// CLG
//transferencia exclusiva para derrama al 25/09/2001
unit CNT260;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbedit, StdCtrls, Buttons, ComCtrls, Mask, Spin, wwdblook, ExtCtrls,
  wwdbdatetimepicker, Wwdbdlg, CheckLst;

type
  TFTransferencia = class(TForm)
    Panel1: TPanel;
    lblCia: TLabel;
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    Z2bbtnContab: TBitBtn;
    bbtnCanc: TBitBtn;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    Label3: TLabel;
    edtAnoMM: TEdit;
    dtpFCont: TwwDBDateTimePicker;
    RadioGroup1: TRadioGroup;
    rgTipdia: TRadioGroup;
    wwDBLookupComboDlg1: TwwDBLookupComboDlg;
    bbtnRecal: TBitBtn;
    rgElimina: TRadioGroup;
    rgMayoriza: TRadioGroup;
    procedure dblcCiaExit(Sender: TObject);
    procedure Z2bbtnContabClick(Sender: TObject);
    procedure speAnoExit(Sender: TObject);
    procedure speMMExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dtpFContExit(Sender: TObject);
    procedure RadioGroup1Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnCancClick(Sender: TObject);
    procedure IniciaDatos;

    // Contabilidad
    procedure GeneraContabilidad( xxCia, xxTDiario, xxAnoMM: String; xForma: TForm; Sender: TObject);
//    procedure GeneraContabilidad( xxCia, xxTDiario, xxAnoMM: String; xForma: TForm );
    procedure CreaPanel( xForma:TForm; xMensaje:String );
    procedure PanelMsg( xMensaje:String; xProc:Integer );
    function  Contabiliza( xCia, xTDiario, xAnoMM : String ): Boolean;
    procedure GeneraEnLinea401( xxxCia,xxxDiario,xxxAnoMM: String );
    procedure FormActivate(Sender: TObject);
    procedure rgTipdiaExit(Sender: TObject);
    procedure bbtnRecalClick(Sender: TObject);

  private
    { Private declarations }
    xCias,xMesT,xMesA,xMes,xAno : string;
    xDigitos,xDigitos1 : Integer;
    procedure GrabaSaldos;
    procedure GeneraCorrelativoCtasAutom( xCia, xTDiario, xAnoMM : String) ;
  public
    { Public declarations }

  end;

var
  FTransferencia: TFTransferencia;
  wtcambio : string;
  pnlConta   : TPanel;
  pbConta    : TProgressBar;
  wTIPOREG2  : String;
  wcampo : string;
  xNombreBoton : String;

implementation

uses CNTDM;

{$R *.DFM}

procedure TFTransferencia.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then
      edtCia.Text:=DM1.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía') ;
      dblcCia.SetFocus ;
      exit;
   end ;
   speAno.setfocus;
end;

procedure TFTransferencia.IniciaDatos;
var
   xano, xmes, xdia : word;
begin
   dblcCia.Text:='';
   edtcia.text:='';
   DecodeDate(date, xano, xmes, xdia);
   speAno.value:=xano;
   speMM.value:=xmes;
   dtpFCont.date:=date;
   RadioGroup1.ItemIndex := 0;
   dblcCia.SetFocus;
end;

procedure TFTransferencia.Z2bbtnContabClick(Sender: TObject);
var
	 xSQL,xSQL1,xSQL2 : string;
   xWhere,xano,xmes : string;
   xcantidad : string;
   xRGCount,xZ : integer;
begin
   if MessageDlg('¿ Esta Seguro de Ejecutar ?',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

   Screen.Cursor:=crHourGlass;
   Z2bbtnContab.Enabled := False;
   bbtnCanc.Enabled := False;
   //** 24/07/2001 - pjsv - Valida si existen los diarios a Transferir
   xSql := 'select count(*) cantidad from CGFDET'+
           ' where NOT Exists(Select TDIARID from TGE104 B where TDIARID=ORIGEN)'+
           ' GROUP BY ORIGEN';
    xSql := ' SELECT COUNT(*) CANTIDAD FROM CGFDET,TGE104 WHERE CGFDET.ORIGEN=TGE104.TDIARID(+) AND TDIARDES IS NULL ';
   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:= 'PrvTGE';
   DM1.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
   DM1.cdsQry.Open;

   //** 24/07/2001 - pjsv - si es mayor que cero significa que hay Diarios que faltan
   if DM1.cdsqry.fieldbyname('CANTIDAD').AsInteger > 0 then
   begin
      ShowMessage('Error en Transferencia, Falta Diarios en la TGE104') ;
      Screen.Cursor:=crDefault;
      exit;
   end;
   //**
   //** 20/07/2001 - pjsv, para que la TGE104 tenga solo los diarios de la tabla a transferir
   xSql:='select TDIARID,TDIARDES from TGE104 '+
         'where Exists(Select ORIGEN from CGFDET B where TDIARID=B.ORIGEN) '+
         'Order by TDIARID';
   dm1.cdsTDiario.Close;
   dm1.cdsTDiario.DataRequest(xsql);
   dm1.cdsTDiario.Open;
   dm1.cdsTDiario.IndexFieldNames := 'TDIARID';
   dm1.cdsTDiario.First;

   if strtoint(speMM.text)=0 then  xmes:='00'
   else if length(speMM.text)=1 then xmes:='0'+speMM.text
   else xmes:=copy(speMM.text,1,2);

   xAno:=speAno.text;
   //** valida si la transferencia ya se efectuo anteriormente
   xWhere :=
   'CIAID='+quotedstr(dblcCia.Text)+' AND CNTANOMM='+quotedstr(speAno.text+xmes);//+' AND '
   xcantidad:=DM1.DisplayDescrip('PrvTGE','CNT301','COUNT(*) AS CANTIDAD',xWhere,'CANTIDAD');
   Screen.Cursor:=crDefault;

   if strtoint(xcantidad)>0 then
   begin
      if MessageDlg('La Transferencia ya fue efectuada. ¿ Desea Continuar ?',
         mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      begin
         Z2bbtnContab.enabled:=True;
         bbtnCanc.enabled:=True;
         Screen.Cursor:=crDefault;
         exit;
      end

   end;

   Screen.Cursor:=crHourGlass;

   if rgElimina.ItemIndex=0 then begin

      xSQL:='DELETE FROM CNT300 WHERE CIAID='+QuotedStr(dblcCia.Text)+'AND CNTANOMM='+QuotedStr(speAno.text+xmes);
      dm1.DCOM1.AppServer.IniciaTransaccion;
      try
        DM1.DCOM1.AppServer.EjecutaQry(xSQL);
        dm1.DCOM1.AppServer.GrabaTransaccion;
      except
        dm1.DCOM1.AppServer.RegresaTransaccion;
      end;

      xSQL:='DELETE FROM CNT301 WHERE CIAID='+QuotedStr(dblcCia.Text)+'AND CNTANOMM='+QuotedStr(speAno.text+xmes);
      dm1.DCOM1.AppServer.IniciaTransaccion;
      try
        DM1.DCOM1.AppServer.EjecutaQry(xSQL);
        dm1.DCOM1.AppServer.GrabaTransaccion;
      except
        dm1.DCOM1.AppServer.RegresaTransaccion;
      end;

   end;

{      //** 12/09/2001 - pjsv - verifica que las cuentas a transferir sean de mov.
      xSql :='select COUNT(*) Cantidad from CGFDET A,TGE202 B'+
              ' where A.NUMCIA='+quotedstr(dblcCia.Text)+' AND A.ANO='+QuotedStr(xano)+' AND '+
              ' A.MES='+QuotedStr(xmes)+' AND '+
              ' A.CUENTA=B.CUENTAID(+) AND A.NUMCIA=B.CIAID(+) ';  //AND B.CTA_MOV=''N''
      DM1.cdsQry.Close;
      DM1.cdsQry.ProviderName:= 'PrvTGE';
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;
      //** 23/07/2001 - pjsv - si es mayor que cero significa que hay cuentas que faltan
      if DM1.cdsqry.fieldbyname('CANTIDAD').AsInteger > 0 then
       begin
        ShowMessage('Error en la Data a Transferir, Existen Registros con Cuentas'+chr(13)+
                    ' que no son de Movimiento') ;
        Screen.Cursor:=crDefault;
        exit;
       end;
     //**
}
     //  Verifica la validez de la cuenta en movimiento origen
{      xSQL:='Select Count(CUENTA) Cantidad from CGFDET A '
        +'where A.NUMCIA='+quotedstr(dblcCia.Text)+' AND A.ANO='+quotedstr(speAno.text)+' AND '
        +'A.MES='+quotedStr(xmes)+' AND '
        //** usar solo para JCP - No Borrar  solo para cuentas automaticas
       // +'SUBSTR(A.CUENTA,1,1)<>''9'' AND SUBSTR(CUENTA,1,3)<>''797'' AND '
        +'Not Exists(Select CUENTAID from TGE202 B where B.CIAID='+quotedstr(dblcCia.Text)+' AND B.CUENTAID=A.CUENTA) ';

       DM1.cdsQry.Close;
       DM1.cdsQry.ProviderName:= 'PrvTGE';
       DM1.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
       DM1.cdsQry.Open;

   if DM1.cdsqry.fieldbyname('CANTIDAD').AsInteger > 0 then
   begin
      ShowMessage('Error en Transferencia por Inconsistencia de datos'+chr(13)+
                  'Alguna cuenta no tiene su'+
                  'equivalente en Maestro de Cuentas - SOL !!!') ;
      Screen.Cursor:=crDefault;
      exit;
   end;
}
   case rgTipDia.ItemIndex of
    0 : xRGCount := dm1.cdsTDiario.RecordCount;
    1 : xRGCount := 1;
   end;

   For xZ := 1 to xRGCount do //ListBox1.Items.Count -1 do
   begin
       dblcTDiario.text :=  dm1.cdsTDiario.fieldbyname('TDIARID').AsString;//ListBox1.Items.Strings[xZ];
       edtTDiario.text := dm1.cdsTDiario.fieldbyname('TDIARDES').AsString;
       dblcTDiario.Refresh;
       edtTDiario.Refresh;
      // INICIA PROCESO DE TRANSFERENCIA
       // Ingresa movimiento contable
       if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
        begin
           xSQL1:=
             'Insert into CNT301 '
            +'Select '+quotedstr(dblcCia.Text)+', A.CLCLD, '
            +'case when length(trim(char(nvchr)))=0 then '
                  +quotedstr('0000000000')+' '
                 +'when length(trim(char(nvchr)))=1 then '
                  +quotedstr('000000000')+'||trim(char(nvchr))'+' '
                 +'when length(trim(char(nvchr)))=2 then '
                  +quotedstr('00000000')+'||trim(char(nvchr))'+' '
                 +'when length(trim(char(nvchr)))=3 then '
                  +quotedstr('0000000')+'||trim(char(nvchr))'+' '
                 +'when length(trim(char(nvchr)))=4 then '
                  +quotedstr('000000')+'||trim(char(nvchr))'+' '
                 +'when length(trim(char(nvchr)))=5 then '
                  +quotedstr('00000')+'||trim(char(nvchr))'+' '
                 +'when length(trim(char(nvchr)))=6 then '
                  +quotedstr('0000')+'||trim(char(nvchr))'+' '
                 +'when length(trim(char(nvchr)))=7 then '
                  +quotedstr('000')+'||trim(char(nvchr))'+' '
                 +'when length(trim(char(nvchr)))=8 then '
                  +quotedstr('00')+'||trim(char(nvchr))'+' '
                 +'when length(trim(char(nvchr)))=9 then '
                  +quotedstr('0')+'||trim(char(nvchr))'+' '
                 +'else '
                  +'trim(char(nvchr))'+' '
            +'end, '
            +'B.FECANO, B.FECANO||B.FECMES, '+quotedstr('0000')+', '
            +'A.CCNTA, '
            +'case when (A.CTRCR='+quotedstr(' ')+' or A.CTRCR is null) then ' // Clase de Auxiliar
            +'null '
            +' else '
            +'F.CLAUIDDS end, '
            +'A.CTRCR, '
            +quotedstr('VR')+','+quotedstr('000')+', '
            +'cast(A.NDCMN as varchar(20)), '
            +'A.TMVMVC, '
            +'case when A.SCRGAB='+quotedstr('C')+' then '+quotedstr('D')
                 +' else '+quotedstr('H')+' end, '
            +'A.CCNPRC, '
            //** Tipo cambio
            +'case when A.CTPOMN='+quotedstr('DL')+' then ' // Tipo de Cambio
                    +'case when (A.IMNDOR=0 or A.IMNDOR is null) then '
                    +'0 '
                    +' else '
                    +'dec(('
                    +'(A.IMNDNC/A.IMNDOR)'
                    +'*power(10,4))+0.5*('
                    +'A.IMNDNC/A.IMNDOR'
                    +'/abs('
                    +'A.IMNDNC/A.IMNDOR'
                    +')),15,4)/power(10,4) end '
            +' else 0 end, '
            //** monto original
            +'case when A.CTPOMN='+quotedstr('DL')+' then ' // Monto origen
                    +'case when ('+wReplacCeros+'(A.IMNDOR,0)=0) then '
                    +' CASE WHEN A.IMNDNC > 0 '
                    +' then (((A.IMNDNC/'+wtcambio+') *power(10,2)) +0.5)/100 '
                    +' else (((A.IMNDNC/'+wtcambio+') *power(10,2)) -0.5)/100 end '
                    +' else A.IMNDOR end '
            +' else A.IMNDNC end, '
        //**
            //** Monto local
            +'A.IMNDNC, '                                   // Monto soles
            //** monto Extranjero
            +'case when A.CTPOMN='+quotedstr('DL')+' then ' // Monto dolares
                    +'case when ('+wReplacCeros+'(A.IMNDOR,0)=0) then '
                    +' CASE WHEN A.IMNDNC > 0 '
                    +' then (((A.IMNDNC/'+wtcambio+') *power(10,2)) +0.5)/100 '
                    +' else (((A.IMNDNC/'+wtcambio+') *power(10,2)) -0.5)/100 end '
                    +' else A.IMNDOR end '
            +' else 0 end, '

            +'(case when FDCMN=0 then date(1) '             // fecha de emision
             +'else '
              +'(case when int(FDCMN/10000)>50 then '
                        +'cast(1900+int(FDCMN/10000) as varchar(4)) '
                    +'else '
                        +'cast(2000+int(FDCMN/10000) as varchar(4)) end)'
              +'||'+quotedstr('-')
              +'||(case when int((FDCMN/10000-int(FDCMN/10000))*100)>9 then '
                        +'cast(int((FDCMN/10000-int(FDCMN/10000))*100) as varchar(2)) '
                    +'else '
                        +quotedstr('0')+'||cast(int((FDCMN/10000-int(FDCMN/10000))*100) as varchar(1)) end)'
              +'||'+quotedstr('-')
              +'||(case when int((FDCMN/100-int(FDCMN/100))*100)>9 then '
                        +'cast(int((FDCMN/100-int(FDCMN/100))*100) as varchar(2)) '
                     +'else '
                        +quotedstr('0')+'||cast(int((FDCMN/100-int(FDCMN/100))*100) as varchar(1)) end) '
            +'end), '
            +'B.FECANO||'+quotedstr('-')+'||B.FECMES||'+quotedstr('-')+'||B.FECDIA'
            +','
            +'B.FECANO||'+quotedstr('-')+'||B.FECMES||'+quotedstr('-')+'||B.FECDIA'
            +','
            +quotedstr('A')+', '+quotedstr('S')+', '+quotedstr(' ')+', '+quotedstr(DM1.wUsuario)+', '
            +wRepFecServi+', '+wRepHorServi+', B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, '
            +'B.FECAATRI, B.FECAASEM, B.FECAASS, '
            +'case when A.CTPOMN='+quotedstr('DL')+' then '+quotedstr('02') // Tipo de Moneda
                 +' else '+quotedstr('01')+' end, '
            +quotedstr(' ')+', '+quotedstr(' ')+', '+quotedstr(' ')+', '
            +'char(C.TDIARDES,20), char(D.CTADES,15), char(E.CLAUXDES,15), '
            +quotedstr(' ')+', '+quotedstr(' ')+', '

            +'case when A.SCRGAB='+quotedstr('C')+' then '
                  +'A.IMNDNC '
                 +' else null end, '

            +'case when A.SCRGAB='+quotedstr('C')+' then '
              +'case when A.CTPOMN='+quotedstr('DL')+' then '
                  +'(case when '+wReplacCeros+'(A.IMNDOR,0)=0 then '
                    +' CASE WHEN A.IMNDNC > 0 '
                    +' then (((A.IMNDNC/'+wtcambio+') *100) +0.5)/100 '
                    +' else (((A.IMNDNC/'+wtcambio+') *100) -0.5)/100 end '
                  +'else A.IMNDOR end) '
              +' else 0 end '
            +' else 0 end, '

            +'case when A.SCRGAB='+quotedstr('A')+' then '
                  +'A.IMNDNC '
                 +' else 0 end, '

            +'case when A.SCRGAB='+quotedstr('A')+' then '
              +'case when A.CTPOMN='+quotedstr('DL')+' then '
                  +'(case when '+wReplacCeros+'(A.IMNDOR,0)=0 then '
                    +' CASE WHEN A.IMNDNC > 0 '
                    +' then (((A.IMNDNC/'+wtcambio+') *100) +0.5)/100 '
                    +' else (((A.IMNDNC/'+wtcambio+') *100) -0.5)/100 end '
                  +'else A.IMNDOR end) '
              +' else 0 end '
            +' else 0 end, '

            +'0, 0, '+quotedstr(' ')+', '+quotedstr(' ')+', '+quotedstr(' ')+', '+quotedstr('AS/400')+', A.NCRRVC ';

        end
       else
         if SRV_D = 'ORACLE' then
          begin
             xSQL1:=
               'Insert into CNT301 '
              +'Select '+quotedstr(dblcCia.Text)+', A.ORIGEN, '
              +'DECODE(length(trim(COMPROB)),0,'+quotedstr('0000000000')+' '
                     +',1,'+quotedstr('000000000')+'||trim(COMPROB)'+' '
                     +',2,'+quotedstr('00000000')+'||trim(COMPROB)'+' '
                     +',3,'+quotedstr('0000000')+'||trim(COMPROB)'+' '
                     +',4,'+quotedstr('000000')+'||trim(COMPROB)'+' '
                     +',5,'+quotedstr('00000')+'||trim(COMPROB)'+' '
                     +',6,'+quotedstr('0000')+'||trim(COMPROB)'+' '
                     +',7,'+quotedstr('000')+'||trim(COMPROB)'+' '
                     +',8,'+quotedstr('00')+'||trim(COMPROB)'+' '
                     +',9,'+quotedstr('0')+'||trim(COMPROB)'+' '
                     +',trim(COMPROB)'+'), '
              +'B.FECANO, B.FECANO||B.FECMES, '+quotedstr('0000')+', '
              +'A.CUENTA, '
              +'DECODE(NVL(A.RELACION,''NULO''),''NULO'',NULL,E.CLAUXID), ' //CLASE AUXILIAR
              +'A.RELACION, '
              +quotedstr('VR')+','+quotedstr('000')+', '
              +'A.DOCUMENTO, '
              +'SUBSTR(A.COMENTARIO,1,40), '
              +'DECODE(A.DEBE,0,''H'',''D''),'  //FALTA
              +'A.CCOS_CODI, '
              //** Tipo cambio
              +wTCambio+', '
              //** monto original
              +'DECODE(A.DEBE,0,HABER,DEBE),'
          //**
              //** Monto local
              +'DECODE(A.DEBE,0,HABER,DEBE),'             // Monto soles
              //** monto Extranjero
              +'TRUNC(DECODE(A.DEBE,0,HABER/'+wTCambio+',DEBE/'+wTCambio+'),2),'

              +'DECODE(NVL(A.FECH_DOCU,''''),'''',TO_DATE('+''''+formatdatetime(wFormatFecha,dtpFCont.date)+''''+'),A.FECH_DOCU ), ' //FECHA DE EMISION
              +'TO_DATE(B.FECDIA||'+quotedstr('-')+'||B.FECMES||'+quotedstr('-')+'||B.FECANO)' //FECHA DE VENCIMIENTO
              +','
              +'TO_DATE(B.FECDIA||'+quotedstr('-')+'||B.FECMES||'+quotedstr('-')+'||B.FECANO)'  //FECHA DE COMPROBANTE
              +','
              +quotedstr('A')+', '+quotedstr('S')+', '+quotedstr(' ')+', '+quotedstr(DM1.wUsuario)+', '
              +wRepFecServi+', '+wRepHorServi+', B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, '
              +'B.FECAATRI, B.FECAASEM, B.FECAASS, '
              +'DECODE(A.MONEDA,''D'', ''D'',''N''),' // Tipo de Moneda
              +quotedstr(' ')+', '+quotedstr(' ')+', '+quotedstr(' ')+', '
              +'SUBSTR(C.TDIARDES,1,20), SUBSTR(D.CTADES,1,15), SUBSTR(E.CLAUXDES,1,15), '
              +quotedstr(' ')+', '+quotedstr(' ')+', '

              +'A.DEBE, '  //CNTDEBEMN
              +'A.DEBE_DOL, '

              +'A.HABER, '
              +'A.HABER_DOL,'

              +'0, 0, '+quotedstr(' ')+', '+quotedstr(' ')+', '+quotedstr(' ')+', '+quotedstr('ORACLE')+', 0 ';

          end;

       if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
        begin
         xSQL2:=
           'FROM CNTDVCF A '
           +'LEFT OUTER JOIN TGE114 B '
                 +'ON(B.FECHA='
                   +'(case when A.AVCHR>50 then '
                     +quotedstr('19')+'||cast(A.AVCHR as varchar(2)) '
                     +'when A.AVCHR>9 then '
                     +quotedstr('20')+'||cast(A.AVCHR as varchar(2)) '
                     +'else '
                     +quotedstr('200')+'||cast(A.AVCHR as varchar(1)) '
                   +'end)'
                   +'||'+quotedstr('-')+'||'
                   +'(case when A.MVCHR>9 then '
                     +'cast(A.MVCHR as varchar(2)) '
                     +'else '
                     +quotedstr('0')+'||cast(A.MVCHR as varchar(1)) '
                   +'end)'
                   +'||'+quotedstr('-')+'||'
                   +'(case when A.DVCHR>9 then '
                     +'cast(A.DVCHR as varchar(2)) '
                     +'else '
                     +quotedstr('0')+'||cast(A.DVCHR as varchar(1)) '
                   +'end)'
                 +') '
          +'LEFT OUTER JOIN TGE104 C '
                 +'ON(C.TDIARID='
                 +quotedstr(dblcTDiario.Text)
                 +') '
          +'LEFT OUTER JOIN TGE202 D '
                 +'ON(D.CIAID='+quotedstr(dblcCia.Text)+' AND D.CUENTAID=A.CCNTA) '
          +'LEFT OUTER JOIN TGE102 E '
                 +'ON(E.CLAUXID=A.CTPOTR) '
          +'LEFT OUTER JOIN CNT405 F '
                 +'ON(F.CLAUIDOR=A.CTPOTR) '
          +'where A.CCMPÑ='+quotedstr(dblcCia.Text)+' AND A.AVCHR='+xano+' AND '
          +'A.MVCHR='+xmes+' AND A.CLCLD='+quotedstr(dblcTDiario.text)+' AND '
          +'SUBSTR(CCNTA,1,1)<>''9'' AND SUBSTR(CCNTA,1,3)<>''797'' ';
        end
       else
        if SRV_D = 'ORACLE' then
         begin
          xSQL2:=
           'FROM CGFDET A,TGE114 B,TGE104 C,TGE202 D,TGE102 E,CNT405 F'
                 +' WHERE (B.FECHA(+)=TO_DATE('+''''+formatdatetime(wFormatFecha,dtpFCont.date)+''''+'))' //wFormatFecha A.FECH_DOCU(+)) '
                 +' AND (C.TDIARID(+)='+quotedstr(dblcTDiario.Text)+') '
                 +' AND (D.CIAID(+)='+quotedstr(dblcCia.Text)+' AND D.CUENTAID(+)=A.CUENTA) '
                 +' AND (E.CLAUXID(+)= DECODE(SUBSTR(A.RELACION,1,1),''9'',''Z'',SUBSTR(A.RELACION,1,1))) '
                 +' AND (F.CLAUIDOR(+)=A.RELACION) '
                 +' AND (A.NUMCIA='+quotedstr(dblcCia.Text)+' AND A.ANO='+QuotedStr(xano)+' AND '
                 +' A.MES='+QuotedStr(xmes)+' AND A.ORIGEN='+quotedstr(dblcTDiario.text)+')';
//               +'SUBSTR(CCNTA,1,1)<>''9'' AND SUBSTR(CCNTA,1,3)<>''797'' ';
         end;
       xSQL:=xSQL1+xSQL2;
       dm1.DCOM1.AppServer.IniciaTransaccion;
       try
        DM1.DCOM1.AppServer.EjecutaQry(xSQL);
        dm1.DCOM1.AppServer.GrabaTransaccion;
       except
          dm1.DCOM1.AppServer.RegresaTransaccion;
       end;
       GeneraContabilidad(dblccia.text,dblcTDiario.text,speano.text+xmes,FTransferencia,Sender);
       dm1.cdsTDiario.Next;
    end;

    //JOSE: MAYORIZACION

    if rgMayoriza.ItemIndex=1 then begin

       xSQL:='UPDATE CNT401 '+
             'SET DEBEMN'+xmes+'=0, '+
             '    HABEMN'+xmes+'=0, '+
             '    DEBEME'+xmes+'=0, '+
             '    HABEME'+xmes+'=0, '+
             '    SALDMN'+xmes+'=0, '+
             '    SALDME'+xmes+'=0 '+
             '    WHERE CIAID='+QuotedStr(dblcCia.Text)+' AND ANO='+quotedstr(speAno.text);
       dm1.DCOM1.AppServer.IniciaTransaccion;
       try
         DM1.DCOM1.AppServer.EjecutaQry(xSQL);
         dm1.DCOM1.AppServer.GrabaTransaccion;
       except
         dm1.DCOM1.AppServer.RegresaTransaccion;
       end;

       GeneraEnLinea401(dblccia.text,dblcTDiario.text,speano.text+xmes);
   end;

   Screen.Cursor:=crDefault;
   ShowMessage('Grabación Exitosa');
   Close;
end;

procedure TFTransferencia.speAnoExit(Sender: TObject);
begin
	 speMM.setfocus;
end;

procedure TFTransferencia.speMMExit(Sender: TObject);
var
 xAnoP, xMesP : integer;

begin
   edtAnoMM.text:=speAno.text+'/'+speMM.text;
   xMesP := StrToInt(speMM.text) + 1;
   If xMesP > 12 then
    begin
     xAnoP := StrToInt(speAno.text) + 1;
     xMesP := 1;
    end
   else xAnoP := StrToInt(speAno.text);
   dtpFCont.Date := StrToDate('01/'+IntToStr(xMesP)+'/'+IntToStr(xAnoP)) - 1;
   dtpFCont.setfocus;
//	 dblcTDiario.setfocus;
end;

procedure TFTransferencia.dblcTDiarioExit(Sender: TObject);
begin
   edtTDiario.Text:='';
   if dblcTDiario.Text<>'' then
      edtTDiario.Text:=DM1.cdsTDiario.FieldByName('TDIARDES').AsString;
   if length(edtTDiario.Text)=0 then
   begin
      ShowMessage('Falta Definición de Tipo de Diario') ;
      dblcTDiario.SetFocus ;
      exit;
   end ;
   dtpFCont.setfocus;
end;

procedure TFTransferencia.dtpFContExit(Sender: TObject);
var
	 xWhere,xfecha : string;
begin
   if length(dtpFCont.Text)=0 then
   begin
      ShowMessage('Falta Definición de Fecha contable') ;
      dtpFCont.SetFocus ;
      exit;
   end;

   xWhere := 'FECHA='+quotedstr(formatdatetime(wFormatFecha,dtpFCont.date));
   xfecha:=DM1.DisplayDescrip('PrvTGE','TGE107','*',xWhere,'FECHA');
   if length(xfecha)=0 then
   begin
      ShowMessage('Fecha contable no esta registrada en Tipo de Cambio');
      dtpFCont.SetFocus ;
      exit;
   end;

	 RadioGroup1.setfocus;
end;

procedure TFTransferencia.RadioGroup1Exit(Sender: TObject);
begin
// Determina el tipo de cambio
   if RadioGroup1.itemindex=0 then wcampo:='TCAMVBC'
   else if RadioGroup1.itemindex=1 then wcampo:='TCAMVBV'
   else if RadioGroup1.itemindex=2 then wcampo:='TCAMVPC'
   else if RadioGroup1.itemindex=3 then wcampo:='TCAMVPV'
   else if RadioGroup1.itemindex=4 then wcampo:='TCAMVOC'
   else if RadioGroup1.itemindex=5 then wcampo:='TCAMVOV'
   else if RadioGroup1.itemindex=6 then wcampo:='TCAMVXC'
   else wcampo:='TCAMVXV';

   wtcambio:=DM1.cdsQry.fieldbyname(wcampo).AsString;
   if length(wtcambio)=0 then
   begin
      ShowMessage('Tipo de cambio no registrado en la fecha dada') ;
      RadioGroup1.SetFocus ;
      exit;
   end;

	 Z2bbtnContab.setfocus;
end;

procedure TFTransferencia.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFTransferencia.bbtnCancClick(Sender: TObject);
begin
	 Iniciadatos;
end;

/////////////////////////////////////////////
///                                       ///
///    PROCEDIMIENTOS PARA CONTABILIDAD   ///
///                                       ///
/////////////////////////////////////////////

//procedure TFTransferencia.GeneraContabilidad( xxCia, xxTDiario, xxAnoMM: String; xForma: TForm );
procedure TFTransferencia.GeneraContabilidad( xxCia, xxTDiario, xxAnoMM: String; xForma: TForm; Sender: TObject);
begin
   //**30/10/2001 - pjsv se valida de que boton viene
   If sender.ClassName = 'TBitBtn' then
    begin
     If (sender as TBitBtn).Name = 'Z2bbtnContab' then
      xNombreBoton := 'Z2bbtnContab'
     else
      If (sender as TBitBtn).Name = 'Z2bbtnPreview' then
       xNombreBoton := 'Z2bbtnPreview';
    end
   else
    begin
     If sender.ClassName = 'TSpeedButton' then
      If (sender as TSpeedButton).Name = 'sbtCBl' then
       xNombreBoton := 'sbtCBl';
    end;
   //**
   wTIPOREG2:='RRN( CNT301 ) ';
   CreaPanel( xForma, 'Contabilizando' );
   if Contabiliza(xxCia, xxTDiario, xxAnoMM ) then
    begin
     //**30/10/2001 - pjsv solo si viene del boton de contabilización en bloque
     If xNombreBoton = 'sbtCBl' then
      FTransferencia.GeneraEnLinea401(xxCia, xxTDiario, xxAnoMM);
     PanelMsg( 'Asiento Contabilizando Final',0 );
    end;
   //**
   pnlConta.Free;
end;

function TFTransferencia.Contabiliza( xCia, xTDiario, xAnoMM  : String ): Boolean;
Var
   xSQL : String;
//   , xNREG
   //, xNroComp
//   xNumT       : Integer;
begin
  //** 30/10/2001 - pjsv solo si viene de contabilizacion en bloque
  If xNombreBoton = 'sbtCBl' then
   begin
    PanelMsg( 'Generando Asientos Automaticos',0 );
    if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
     begin
      //** 29/08/2001 - pjsv
      xSQL:='INSERT INTO CNT301 (';
      xSQL:= xSql + 'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
          +'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
          +'CNTDH, CCOSID, '
          +'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
          +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
          +'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
          +'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
          +'CNTDEBEMN, CNTDEBEME, '
          +'CNTHABEMN, CNTHABEME) ';
          xSQL:= xSql +'SELECT CNT301.CIAID, CNT301.TDIARID, CNT301.CNTCOMPROB, CNT301.CNTANO, CNT301.CNTANOMM, CNT301.CNTLOTE, B.CTAAUT1,'
          +'CASE WHEN CNT301.CLAUXID = '''' THEN NULL ELSE CNT301.CLAUXID END CLAUXID,'
          +'CASE WHEN CNT301.AUXID = '''' THEN NULL ELSE CNT301.AUXID END AUXID,'
          +'CNT301.CNTMODDOC, CNT301.DOCID, CNT301.CNTSERIE, CNT301.CNTNODOC, CNT301.CNTGLOSA,'
          +'CNT301.CNTDH , '
          +'CASE WHEN B.CTA_CCOS=''S'' THEN CASE WHEN CNT301.CCOSID= '''' THEN NULL ELSE CNT301.CCOSID END ELSE NULL END CCOSID, '
          +'CNT301.CNTTCAMBIO, CNT301.CNTMTOORI, CNT301.CNTMTOLOC, CNT301.CNTMTOEXT, CNT301.CNTFEMIS, CNT301.CNTFVCMTO, '
          +'CNT301.CNTFCOMP, CNT301.CNTESTADO, ''S'', ''S'', '
          +''''+DM1.wUsuario+''''+', DATE('+''''+ FORMATDATETIME(wFormatFecha,Date )+''''+'),'+wRepHorServi+', '
          +'CNT301.CNTMM, CNT301.CNTDD, CNT301.CNTTRI, CNT301.CNTSEM, CNT301.CNTSS, CNT301.CNTAATRI, CNT301.CNTAASEM, '
          +'CNT301.CNTAASS, CNT301.TMONID, B.CTAABR, CNT301.TDIARDES, CNT301.AUXDES, CNT301.DOCDES, C.CCOSABR, '
          +'CASE WHEN CNT301.CNTDH=''D'' THEN CNT301.CNTMTOLOC ELSE 0 END, '
          +'CASE WHEN CNT301.CNTDH=''D'' THEN CNT301.CNTMTOEXT ELSE 0 END, '
          +'CASE WHEN CNT301.CNTDH=''H'' THEN CNT301.CNTMTOLOC ELSE 0 END, '
          +'CASE WHEN CNT301.CNTDH=''H'' THEN CNT301.CNTMTOEXT ELSE 0 END'
  //        + wTIPOREG2
          +' FROM CNT301 '
          +' LEFT  JOIN TGE203 C ON ( CNT301.CCOSID=C.CCOSID ), '
          +' TGE202 B ' //, TGE202 D '
          +' WHERE  CNT301.CIAID     ='+''''+ xCia    +''''+' AND ';
       if xTDiario<>'' then
          xSQL:= xSql +' CNT301.TDIARID   ='+''''+ xTDiario+''''+' AND ';

       xSQL:=xSql+' CNT301.CNTANOMM  ='+''''+ xAnoMM  +''''+' AND '
          +' CNT301.CNTESTADO =''P'' AND COALESCE(CNT301.CNTCUADRE,'''')<>''S'' AND '
          +' ( CNT301.CIAID=B.CIAID AND CNT301.CUENTAID=B.CUENTAID AND B.CTAAUT1 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT1))>0 ) ';
     end
    else
     if SRV_D = 'ORACLE' then
       begin
        xSQL:='INSERT INTO CNT301 ('
            + 'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
            +'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
            +'CNTDH, CCOSID, '
            +'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
            +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
            +'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
            +'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
            +'CNTDEBEMN, CNTDEBEME, '
            +'CNTHABEMN, CNTHABEME )' //, CNTREG ) '
            +'SELECT CNT301.CIAID, CNT301.TDIARID, CNT301.CNTCOMPROB, CNT301.CNTANO, CNT301.CNTANOMM, CNT301.CNTLOTE, B.CTAAUT1,'
            +'DECODE(CNT301.CLAUXID,NULL,NULL,CNT301.CLAUXID) CLAUXID,'
            +'DECODE(CNT301.AUXID,NULL,NULL,CNT301.AUXID) AUXID,'
            +'CNT301.CNTMODDOC, CNT301.DOCID, CNT301.CNTSERIE, CNT301.CNTNODOC, CNT301.CNTGLOSA,'
            +'CNT301.CNTDH , '
            +'DECODE(B.CTA_CCOS,''S'', DECODE(CNT301.CCOSID,'''', NULL,CNT301.CCOSID), NULL) CCOSID, '
            +'CNT301.CNTTCAMBIO, CNT301.CNTMTOORI, CNT301.CNTMTOLOC, CNT301.CNTMTOEXT, CNT301.CNTFEMIS, CNT301.CNTFVCMTO, '
            +'CNT301.CNTFCOMP, CNT301.CNTESTADO, ''S'', ''S'', '
            +''''+DM1.wUsuario+''''+', TO_DATE('+''''+ FORMATDATETIME(wFormatFecha,Date )+''''+'),'+wRepHorServi+', '
            +'CNT301.CNTMM, CNT301.CNTDD, CNT301.CNTTRI, CNT301.CNTSEM, CNT301.CNTSS, CNT301.CNTAATRI, CNT301.CNTAASEM, '
            +'CNT301.CNTAASS, CNT301.TMONID, B.CTAABR, CNT301.TDIARDES, CNT301.AUXDES, CNT301.DOCDES, C.CCOSABR, '

            +'DECODE(CNT301.CNTDH, ''D'', CNT301.CNTMTOLOC, 0), '
            +'DECODE(CNT301.CNTDH, ''D'', CNT301.CNTMTOEXT, 0), '
            +'DECODE(CNT301.CNTDH, ''H'', CNT301.CNTMTOLOC, 0), '
            +'DECODE(CNT301.CNTDH, ''H'', CNT301.CNTMTOEXT, 0) '
            +' FROM CNT301, TGE203 C, '
            +'TGE202 B '//, TGE202 D '
            +'WHERE  CNT301.CIAID     ='+''''+ xCia    +''''+' AND ';
       if xTDiario<>'' then
          xSQL:= xSql +' CNT301.TDIARID   ='+''''+ xTDiario+''''+' AND ';

       xSQL:=xSql+'CNT301.CNTANOMM  ='+''''+ xAnoMM  +''''+' AND '
            +' CNT301.CCOSID   =C.CCOSID AND '
            +' CNT301.CNTESTADO=''P'' AND NVL(CNT301.CNTCUADRE,''N'')<>''S'' AND '
            +' (CNT301.CIAID=B.CIAID AND CNT301.CUENTAID=B.CUENTAID AND B.CTAAUT1(+) IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT1))>0 ) ';
       end;
     try
       dm1.DCOM1.AppServer.EjecutaSQL(xSQL);
     except
     end ;
     // 4
     PanelMsg( 'Generando Asientos Automaticos',0 );

    if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
       xSQL:='INSERT INTO CNT301 (';
       xSQL:= xSql +'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
          +'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
          +'CNTDH, CCOSID, '
          +'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
          +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
          +'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
          +'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
          +'CNTDEBEMN, CNTDEBEME, '
          +'CNTHABEMN, CNTHABEME )';
          xSql := xSql +'SELECT CNT301.CIAID, CNT301.TDIARID, CNT301.CNTCOMPROB, CNT301.CNTANO, CNT301.CNTANOMM, CNT301.CNTLOTE, B.CTAAUT2,'
          +'CASE WHEN CNT301.CLAUXID = '''' THEN NULL ELSE CNT301.CLAUXID END CLAUXID,'
          +'CASE WHEN CNT301.AUXID = '''' THEN NULL ELSE CNT301.AUXID END AUXID,'
          +'CNT301.CNTMODDOC, CNT301.DOCID, CNT301.CNTSERIE, CNT301.CNTNODOC,CNT301.CNTGLOSA, '
          +'CASE WHEN CNT301.CNTDH=''D'' THEN ''H'' ELSE ''D'' END AS DH, '
          +'CASE WHEN B.CTA_CCOS=''S'' THEN CASE WHEN CNT301.CCOSID= '''' THEN NULL ELSE CNT301.CCOSID END ELSE NULL END CCOSID, '
          +'CNT301.CNTTCAMBIO, CNT301.CNTMTOORI, CNT301.CNTMTOLOC, CNT301.CNTMTOEXT, CNT301.CNTFEMIS, CNT301.CNTFVCMTO, '
          +'CNT301.CNTFCOMP, CNT301.CNTESTADO, ''S'', ''S'', '
          +''''+DM1.wUsuario+''''+', DATE('+''''+ FORMATDATETIME(wFormatFecha,Date )+''''+'),'+wRepHorServi+', '
          +'CNT301.CNTMM, CNT301.CNTDD, CNT301.CNTTRI, CNT301.CNTSEM, CNT301.CNTSS, CNT301.CNTAATRI, CNT301.CNTAASEM, '
          +'CNT301.CNTAASS, CNT301.TMONID, B.CTAABR, CNT301.TDIARDES, CNT301.AUXDES, CNT301.DOCDES, C.CCOSABR,'
          +'CASE WHEN CNT301.CNTDH=''H'' THEN CNT301.CNTMTOLOC ELSE 0 END, '
          +'CASE WHEN CNT301.CNTDH=''H'' THEN CNT301.CNTMTOEXT ELSE 0 END, '
          +'CASE WHEN CNT301.CNTDH=''D'' THEN CNT301.CNTMTOLOC ELSE 0 END, '
          +'CASE WHEN CNT301.CNTDH=''D'' THEN CNT301.CNTMTOEXT ELSE 0 END '
  //        + wTIPOREG2
          +' FROM CNT301 '
          +' LEFT  JOIN TGE203 C ON ( CNT301.CCOSID=C.CCOSID ), '
          +' TGE202 B, TGE202 D '
          +' WHERE  CNT301.CIAID     ='+''''+ xCia    +''''+' AND ';
       if xTDiario<>'' then
          xSQL:= xSql +' CNT301.TDIARID   ='+''''+ xTDiario+''''+' AND ';

       xSQL:=xSql+' CNT301.CNTANOMM  ='+''''+ xAnoMM  +''''+' AND '
          +' CNT301.CNTESTADO =''P'' AND COALESCE(CNT301.CNTCUADRE,'''')<>''S'' AND '
          +' ( CNT301.CIAID=B.CIAID AND CNT301.CUENTAID=B.CUENTAID AND B.CTAAUT2 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT2))>0 ) ';
      end
    else
     if SRV_D = 'ORACLE' then
      begin
        xSQL:='INSERT INTO CNT301 ('
          + 'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
          +'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
          +'CNTDH, CCOSID, '
          +'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
          +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
          +'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
          +'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
          +'CNTDEBEMN, CNTDEBEME, '
          +'CNTHABEMN, CNTHABEME) ';
          xSql := xSql +'SELECT CNT301.CIAID, CNT301.TDIARID, CNT301.CNTCOMPROB, CNT301.CNTANO, CNT301.CNTANOMM, CNT301.CNTLOTE, B.CTAAUT2, '
          +'DECODE(CNT301.CLAUXID,'''', NULL, CNT301.CLAUXID) CLAUXID, '
          +'DECODE(CNT301.AUXID,'''', NULL,CNT301.AUXID) AUXID, '
          +'CNT301.CNTMODDOC, CNT301.DOCID, CNT301.CNTSERIE, CNT301.CNTNODOC,CNT301.CNTGLOSA, '
          +'DECODE(CNT301.CNTDH, ''D'', ''H'', ''D'') AS DH, '
          +'DECODE(B.CTA_CCOS, ''S'', DECODE(CNT301.CCOSID,'''',NULL,CNT301.CCOSID), NULL) AS CCOSID, '
          +'CNT301.CNTTCAMBIO, CNT301.CNTMTOORI, CNT301.CNTMTOLOC, CNT301.CNTMTOEXT, CNT301.CNTFEMIS, CNT301.CNTFVCMTO, '
          +'CNT301.CNTFCOMP, CNT301.CNTESTADO, ''S'', ''S'', '
          +''''+DM1.wUsuario+''''+', TO_DATE('+''''+ FORMATDATETIME(wFormatFecha,Date )+''''+'), SYSDATE, '
          +'CNT301.CNTMM, CNT301.CNTDD, CNT301.CNTTRI, CNT301.CNTSEM, CNT301.CNTSS, CNT301.CNTAATRI, CNT301.CNTAASEM, '
          +'CNT301.CNTAASS, CNT301.TMONID, B.CTAABR, CNT301.TDIARDES, CNT301.AUXDES, CNT301.DOCDES, C.CCOSABR, '

          +'DECODE(CNT301.CNTDH, ''H'', CNT301.CNTMTOLOC, 0), '
          +'DECODE(CNT301.CNTDH, ''H'', CNT301.CNTMTOEXT, 0), '
          +'DECODE(CNT301.CNTDH, ''D'', CNT301.CNTMTOLOC, 0), '
          +'DECODE(CNT301.CNTDH, ''D'', CNT301.CNTMTOEXT, 0)'
          +' FROM CNT301, TGE203 C, TGE202 B' //, TGE202 D '
          +' WHERE  CNT301.CIAID ='+''''+ xCia    +''''+' AND ';
       if xTDiario<>'' then
          xSQL:= xSql +' CNT301.TDIARID   ='+''''+ xTDiario+''''+' AND ';

       xSQL:=xSql+'CNT301.CNTANOMM  ='+''''+ xAnoMM  +''''+' AND '
          +' CNT301.CCOSID=C.CCOSID AND '
          +' CNT301.CNTESTADO=''P'' AND NVL(CNT301.CNTCUADRE,''N'')<>''S'' AND '
          +' ( CNT301.CIAID=B.CIAID AND CNT301.CUENTAID=B.CUENTAID AND B.CTAAUT2 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT2))>0 ) ';
      end;
     try
       dm1.DCOM1.AppServer.IniciaTransaccion;
       Dm1.DCOM1.AppServer.EjecutaSQL(xSQL);
       dm1.DCOM1.AppServer.GrabaTransaccion;
     except
       dm1.DCOM1.AppServer.RegresaTransaccion;
     end ;

   end;


  If xNombreBoton = 'Z2bbtnContab' then //** solo si viene de la transferencia
   begin
     // Genera Cabecera de Contabilidad
    if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
    begin
     xSQL:='INSERT INTO CNT300 ';
     xSQL:=xSQL+ '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, ';
     xSQL:=xSQL+ 'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, ';
     xSQL:=xSQL+ 'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, ';
     xSQL:=xSQL+ 'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, ';
     xSQL:=xSQL+ 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, ';
     xSQL:=xSQL+ 'CNTTS,DOCMOD ) ' ;

     xSQL:=xSQL+ 'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE, ';
     xSQL:=xSQL+ '''M:'''+'||A.CNTMODDOC||'+''' D:'''+'||A.TDIARID||'+''' P:'''+'||A.CNTANOMM||'+''' C:'''+'||A.CNTCOMPROB, ';
     xSQL:=xSQL+ 'SUM( CASE WHEN A.FLAGVAR=''T'' THEN A.CNTTCAMBIO ELSE 0 END ), ';
     xSQL:=xSQL+ 'A.CNTFCOMP, ''P'', ''S'', ';
     xSQL:=xSQL+ ''''+DM1.wUsuario+''''+', '+wRepFecServi+', '+wRepFecServi+', A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
     xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, '+quotedstr('01')+', '' '', ';
     xSQL:=xSQL+ 'A.TDIARDES, ';
     xSQL:=xSQL+ 'SUM('+wReplacCeros+'(A.CNTDEBEMN,0)), SUM('+wReplacCeros+'(A.CNTDEBEME,0)), SUM('+wReplacCeros+'(A.CNTHABEMN,0)), SUM('+wReplacCeros+'(A.CNTHABEME,0)), ';
     xSQL:=xSQL+ ''''+Copy( wcampo,6,2 )+''''+',''AS/400'' ';

     xSQL:=xSQL+ 'FROM CNT301 A ';
     xSQL:=xSQL+ 'WHERE A.CIAID='     +''''+xCia    +''''+' AND ';

     if xTDiario<>'' then
        xSQL:=xSQL+    'A.TDIARID='   +''''+xTDiario+''''+' AND ';

     xSQL:=xSQL+       'A.CNTANOMM='  +''''+xAnoMM  +'''';
     xSQL:=xSQL+       'A.CNTESTADO =''P'' AND COALESCE(CNT301.CNTCUADRE,'''')<>''S'' ';
     xSQL:=xSQL+ ' GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, ';
     xSQL:=xSQL+ 'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
     xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
     xSQL:=xSQL+ 'A.TDIARDES, A.CNTMODDOC';
    end
    else
     if SRV_D = 'ORACLE' then
      begin
       xSQL:='INSERT INTO CNT300 ';
       xSQL:=xSQL+ '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, ';
       xSQL:=xSQL+ 'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, ';
       xSQL:=xSQL+ 'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, ';
       xSQL:=xSQL+ 'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, ';
       xSQL:=xSQL+ 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, ';
       xSQL:=xSQL+ 'CNTTS,DOCMOD ) ' ;

       xSQL:=xSQL+ 'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE, ';
       xSQL:=xSQL+ '''M:'''+'||A.CNTMODDOC||'+''' D:'''+'||A.TDIARID||'+''' P:'''+'||A.CNTANOMM||'+''' C:'''+'||A.CNTCOMPROB, ';
       xSQL:=xSQL+ 'SUM( DECODE(A.FLAGVAR,''T'',A.CNTTCAMBIO,0)), ';
       xSQL:=xSQL+ 'A.CNTFCOMP, ''P'', ''S'', ';
       xSQL:=xSQL+ ''''+DM1.wUsuario+''''+', '+wRepFecServi+', '+wRepFecServi+', A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
       xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, '+quotedstr('01')+', '' '', ';
       xSQL:=xSQL+ 'A.TDIARDES, ';
       xSQL:=xSQL+ 'SUM('+wReplacCeros+'(A.CNTDEBEMN,0)), SUM('+wReplacCeros+'(A.CNTDEBEME,0)), SUM('+wReplacCeros+'(A.CNTHABEMN,0)), SUM('+wReplacCeros+'(A.CNTHABEME,0)), ';
       xSQL:=xSQL+ ''''+Copy( wcampo,6,2 )+''''+',''ORACLE'' ';
       xSQL:=xSQL+ 'FROM CNT301 A ';
       xSQL:=xSQL+ 'WHERE A.CIAID='     +''''+xCia    +''''+' AND ';
       if xTDiario<>'' then
          xSQL:=xSQL+    'A.TDIARID='   +''''+xTDiario+''''+' AND ';
       xSQL:=xSQL+       'A.CNTANOMM='  +''''+xAnoMM  +'''';
       xSQL:=xSQL+       'A.CNTESTADO=''P'' AND NVL( A.CNTCUADRE,''N'')<>''S'' ';
       xSQL:=xSQL+ 'GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, ';
       xSQL:=xSQL+ 'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
       xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
       xSQL:=xSQL+ 'A.TDIARDES, A.CNTMODDOC';
     end;
    try
      dm1.DCOM1.AppServer.IniciaTransaccion;
      DM1.DCOM1.AppServer.EjecutaQry(xSQL);
      dm1.DCOM1.AppServer.GrabaTransaccion;
    except
      dm1.DCOM1.AppServer.RegresaTransaccion;
    end;
   end;

   GeneraCorrelativoCtasAutom( xCia, xTDiario, xAnoMM ) ;

   Result:=True;
end;

procedure TFTransferencia.GeneraCorrelativoCtasAutom( xCia, xTDiario, xAnoMM : String) ;
var
   xSQL  : String;
   nNum  : Integer;
   xGraba: Boolean;
begin

   xSQL:='Select CIAID, TDIARID, CNTANOMM, CNTCOMPROB, MIN(NVL(CNTREG,0)), '
        +  'MAX(NVL(CNTREG,0)) NREG, COUNT(*) '
        +  'From CNT301 '
        +'WHERE CIAID='   +''''+xCia    +''''+' AND ';
   if xTDiario<>'' then
      xSQL:=xSQL+'TDIARID=' +''''+xTDiario+''''+' AND ';

   xSQL:=xSQL+'CNTANOMM='+''''+xAnoMM  +''' '
        +'GROUP BY CIAID, TDIARID, CNTANOMM, CNTCOMPROB '
        +'HAVING MIN(NVL(CNTREG,0))=0 '
        +'Order by CNTCOMPROB ';

   DM1.cdsQry3.Close;
   DM1.cdsQry3.DataRequest( xSQL );
   DM1.cdsQry3.Open;

   DM1.cdsQry3.First;
   while not DM1.cdsQry3.Eof do begin

      xSQL:='Select CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CUENTAID, CNTDH, DOCID, '
           +   'CLAUXID, AUXID, CNTMTOORI, CNTREG '
           +'From CNT301 '
           +'WHERE CIAID='''     +xCia      +''''+' AND '
           +      'TDIARID='''   +DM1.cdsQry3.FieldByName('TDIARID').AsString  +''''+' AND '
           +      'CNTANOMM='''  +xAnoMM    +''''+' AND '
           +      'CNTCOMPROB='''+DM1.cdsQry3.FieldByName('CNTCOMPROB').AsString+'''';

      DM1.cdsMovCNT2.Close;
      DM1.cdsMovCNT2.IndexFieldNames:='';
      DM1.cdsMovCNT2.DataRequest( xSQL );
      DM1.cdsMovCNT2.Open;

      xGraba:=False;
      DM1.cdsMovCnt2.First;
      while not DM1.cdsMovCnt2.EOF do begin
         if DM1.cdsMovCnt2.FieldByName('CNTREG').AsInteger=0 then begin
            xGraba:=True;
            DM1.cdsMovCnt2.Edit;
            DM1.cdsMovCnt2.FieldByName('CNTREG').AsInteger:=9999;
         end;
         DM1.cdsMovCnt2.Next;
      end;

      if xGraba then begin
        DM1.cdsMovCNT2.IndexFieldNames:='CNTCOMPROB;CNTREG;CNTMTOORI;CNTDH';

        nNum:=DM1.cdsQry3.FieldByName('NREG').AsInteger;

        DM1.cdsMovCnt2.First;
        while not DM1.cdsMovCnt2.EOF do begin
           if DM1.cdsMovCnt2.FieldByName('CNTREG').AsInteger=9999 then begin
              nNum:=nNum+1;
              DM1.cdsMovCnt2.Edit;
              DM1.cdsMovCnt2.FieldByName('CNTREG').AsInteger:=nNum;
              cdsPost( DM1.cdsMovCnt2 );
           end;
           DM1.cdsMovCnt2.Next;
        end;
        dm1.ControlTran;
      end;

      DM1.cdsQry3.Next;
   end;

   DM1.cdsMovCNT2.IndexFieldNames:='';
end;

procedure TFTransferencia.GeneraEnLinea401( xxxCia,xxxDiario,xxxAnoMM: String );
var
   xNumNiv : Integer;
   xNivel,xSql : String;
   xZ : Integer;
   xNiv : Array[1..10] of integer;
   xMesA : String;
begin
   xCias := xxxCia;
   xAno := Copy(xxxAnoMM,1,4);
   xMes := Copy(xxxAnoMM,5,2);
  // INSERTA EN LA CNT401 LAS CUENTAS NUEVAS DEL PLAN DE CUENTAS
  if (SRV_D = 'DB2NT') or	 (SRV_D = 'DB2400') then
   begin
    xsql := 'Insert into CNT401 '+
             ' (CIAID, CUENTAID, CTADES, TIPO,CTA_MOV,ANO,'+
             'DEBEMN00,DEBEMN01,DEBEMN02,DEBEMN03,DEBEMN04,DEBEMN05,DEBEMN06,'+
             'DEBEMN07,DEBEMN08,DEBEMN09,DEBEMN10,DEBEMN11,DEBEMN12,DEBEMN13,'+
             'DEBEME00,DEBEME01,DEBEME02,DEBEME03,DEBEME04,DEBEME05,DEBEME06,'+
             'DEBEME07,DEBEME08,DEBEME09,DEBEME10,DEBEME11,DEBEME12,DEBEME13,'+
             'HABEMN00,HABEMN01,HABEMN02,HABEMN03,HABEMN04,HABEMN05,HABEMN06,'+
             'HABEMN07,HABEMN08,HABEMN09,HABEMN10,HABEMN11,HABEMN12,HABEMN13,'+
             'HABEME00,HABEME01,HABEME02,HABEME03,HABEME04,HABEME05,HABEME06,'+
             'HABEME07,HABEME08,HABEME09,HABEME10,HABEME11,HABEME12,HABEME13,'+
             'SALDMN00,SALDMN01,SALDMN02,SALDMN03,SALDMN04,SALDMN05,SALDMN06,'+
             'SALDMN07,SALDMN08,SALDMN09,SALDMN10,SALDMN11,SALDMN12,SALDMN13,'+
             'SALDME00,SALDME01,SALDME02,SALDME03,SALDME04,SALDME05,SALDME06,'+
             'SALDME07,SALDME08,SALDME09,SALDME10,SALDME11,SALDME12,SALDME13)'+
             ' select TGE202.CIAID,TGE202.CUENTAID,TGE202.CTADES,TGE202.CTANIV,TGE202.CTA_MOV,'+
             quotedstr(xAno)+','+
             ' 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'+
             ' 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'+
             ' 0,0,0,0,0,0,0,0,0,0,0,0,0,0'+
             ' FROM TGE202'+
             ' LEFT JOIN CNT401 ON (trim(TGE202.CUENTAID) = trim(CNT401.CUENTAID) AND TGE202.CIAID=CNT401.CIAID)';
            //** 30/10/2001 - pjsv
            If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
             xSql := xSql + ' WHERE CNT401.CUENTAID IS NULL AND TGE202.CIAID='+quotedstr(xxxCia)
            else
             xSql := xSql + ' WHERE CNT401.CUENTAID IS NULL AND TGE202.CIAID='+quotedstr(dblcCia.text);
   end
  else
   if SRV_D = 'ORACLE' then
    begin
     xsql := 'Insert into CNT401 '+
             ' (CIAID, CUENTAID, CTADES, TIPO,CTA_MOV,ANO,'+
             'DEBEMN00,DEBEMN01,DEBEMN02,DEBEMN03,DEBEMN04,DEBEMN05,DEBEMN06,'+
             'DEBEMN07,DEBEMN08,DEBEMN09,DEBEMN10,DEBEMN11,DEBEMN12,DEBEMN13,'+
             'DEBEME00,DEBEME01,DEBEME02,DEBEME03,DEBEME04,DEBEME05,DEBEME06,'+
             'DEBEME07,DEBEME08,DEBEME09,DEBEME10,DEBEME11,DEBEME12,DEBEME13,'+
             'HABEMN00,HABEMN01,HABEMN02,HABEMN03,HABEMN04,HABEMN05,HABEMN06,'+
             'HABEMN07,HABEMN08,HABEMN09,HABEMN10,HABEMN11,HABEMN12,HABEMN13,'+
             'HABEME00,HABEME01,HABEME02,HABEME03,HABEME04,HABEME05,HABEME06,'+
             'HABEME07,HABEME08,HABEME09,HABEME10,HABEME11,HABEME12,HABEME13,'+
             'SALDMN00,SALDMN01,SALDMN02,SALDMN03,SALDMN04,SALDMN05,SALDMN06,'+
             'SALDMN07,SALDMN08,SALDMN09,SALDMN10,SALDMN11,SALDMN12,SALDMN13,'+
             'SALDME00,SALDME01,SALDME02,SALDME03,SALDME04,SALDME05,SALDME06,'+
             'SALDME07,SALDME08,SALDME09,SALDME10,SALDME11,SALDME12,SALDME13)'+
             ' select TGE202.CIAID,TGE202.CUENTAID,TGE202.CTADES,TGE202.CTANIV,TGE202.CTA_MOV,'+
             quotedstr(xAno)+','+
             ' 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'+
             ' 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'+
             ' 0,0,0,0,0,0,0,0,0,0,0,0,0,0'+
             ' FROM TGE202,CNT401 WHERE CNT401.CUENTAID IS NULL AND '+
             ' trim(TGE202.CUENTAID) = trim(CNT401.CUENTAID(+)) AND ';
            //** 30/10/2001 - pjsv
            If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
             xSql := xSql + 'TGE202.CIAID=CNT401.CIAID(+) AND TGE202.CIAID='+quotedstr(xxxCia)
            else
             xSql := xSql + 'TGE202.CIAID=CNT401.CIAID(+) AND TGE202.CIAID='+quotedstr(dblcCia.text);


    end;
  dm1.DCOM1.AppServer.IniciaTransaccion;
  try
   DM1.DCOM1.AppServer.EjecutaQry(xSQL);
   dm1.DCOM1.AppServer.GrabaTransaccion;
  except
   dm1.DCOM1.AppServer.RegresaTransaccion;
  end;

   //**12/09/2001 - pjsv, actualizo todos los auxiliares y clase de auxiliares a null
   //** siempre y cuando esten en '', para que no me generen registro indebidos
   //** 30/10/2001 - pjsv
   if (SRV_D = 'DB2NT') or	 (SRV_D = 'DB2400') then
     xSql := 'UPDATE CNT301 SET AUXID=NULL,CLAUXID=NULL WHERE AUXID=''''';
   if SRV_D = 'ORACLE' then
     xSql := 'UPDATE CNT301 SET AUXID=NULL,CLAUXID=NULL WHERE AUXID is null ';

   If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
     xSql := xSql + ' AND CNT301.CIAID='+quotedstr(xxxCia)+' AND CNTANOMM='+quotedstr(xxxAnoMM)
   else
     xSql := xSql + ' AND CNT301.CIAID='+quotedstr(dblcCia.text)+' AND CNTANOMM='+quotedstr(xxxAnoMM);
    //**
   dm1.DCOM1.AppServer.IniciaTransaccion;
   try
    DM1.DCOM1.AppServer.EjecutaQry(xSQL);
    dm1.DCOM1.AppServer.GrabaTransaccion;
   except
   dm1.DCOM1.AppServer.RegresaTransaccion;
   end;
   //**actualizo todos los C. de Costo a null
   //** siempre y cuando esten en '', para que no me generen registro indebidos
   //** 30/10/2001 - pjsv
   if (SRV_D = 'DB2NT') or	 (SRV_D = 'DB2400') then
    xSql := 'UPDATE CNT301 SET CCOSID=NULL WHERE CCOSID=''''';
   if SRV_D = 'ORACLE' then
    xSql := 'UPDATE CNT301 SET CCOSID=NULL WHERE CCOSID is null';

   If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
     xSql := xSql + ' AND CNT301.CIAID='+quotedstr(xxxCia)+' AND CNTANOMM='+quotedstr(xxxAnoMM)
   else
     xSql := xSql + ' AND CNT301.CIAID='+quotedstr(dblcCia.text)+' AND CNTANOMM='+quotedstr(xxxAnoMM);
   //**
   dm1.DCOM1.AppServer.IniciaTransaccion;
   try
    DM1.DCOM1.AppServer.EjecutaQry(xSQL);
    dm1.DCOM1.AppServer.GrabaTransaccion;
   except
   dm1.DCOM1.AppServer.RegresaTransaccion;
   end;
   //**


//////////////////////// para Auxiliares /////////////////////////////
      //**12/09/2001 - pjsv, actualizo todos los auxiliares y clase de auxiliares a null
      //** siempre y cuando esten en '', para que no me generen registro indebidos
      if (SRV_D = 'DB2NT') or	 (SRV_D = 'DB2400') then
       xSql := 'UPDATE CNT401 SET AUXID=NULL,CLAUXID=NULL WHERE AUXID=''''';
      if SRV_D = 'ORACLE' then
       xSql := 'UPDATE CNT401 SET AUXID=NULL,CLAUXID=NULL WHERE AUXID is null';

      If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
       xSql := xSql + ' AND CNT401.CIAID='+quotedstr(xxxCia)
      else
       xSql := xSql + ' AND CNT401.CIAID='+quotedstr(dblcCia.text);

      dm1.DCOM1.AppServer.IniciaTransaccion;
      try
       DM1.DCOM1.AppServer.EjecutaQry(xSQL);
       dm1.DCOM1.AppServer.GrabaTransaccion;
      except
      dm1.DCOM1.AppServer.RegresaTransaccion;
      end;
      //**

    xSql := ' insert into cnt401'+
            '(ciaid,cuentaid,auxid,clauxid,ano,ctades,tipo,cta_mov,auxdes,'+
            'DEBEMN'+ xMes+','+'DEBEME'+ xMes +','+
            'HABEMN'+ xMes +','+'HABEME'+ xMes +')';
     If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
       xSql := xSql +  ' select '+quotedstr(xxxCia)+', a.cuentaid,a.auxid,a.clauxid,'
     else
       xSql := xSql + ' select '+quotedstr(dblcCia.text)+', a.cuentaid,a.auxid,a.clauxid,';
     xSql := xSql + quotedstr(xAno)+',max(a.ctades) ctades, max(c.ctaniv) ctaniv,'+
            ' max(c.cta_mov) cta_mov, max(a.auxdes) auxdes,'+
            'sum('+wReplacCeros+'(a.CNTDEBEMN'+',0)) DEBEMN'+ xMes+','+
            'sum('+wReplacCeros+'(a.CNTDEBEME'+',0)) DEBEME'+ xMes+','+
            'sum('+wReplacCeros+'(a.CNTHABEMN'+',0)) HABEMN'+ xMes+','+
            'sum('+wReplacCeros+'(a.CNTHABEME'+',0)) HABEME'+ xMes ;

    xSql := xSql + ' from cnt301 a,tge202 c'+
                   ' WHERE (a.CUENTAID = c.CUENTAID(+) and a.CIAID=c.CIAID(+) AND C.CTA_AUX=''S'')'+
                   ' AND  a.auxid is not null  and a.CNTANOMM='+quotedstr(xxxAnoMM);
     If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
       xSql := xSql + ' AND a.CIAID='+quotedstr(xxxCia)
     else
       xSql := xSql + ' AND a.CIAID='+quotedstr(dblcCia.text);
    xSql := xSql +' AND NOT EXISTS(SELECT B.CUENTAID FROM CNT401 B WHERE B.CIAID=A.CIAID AND B.CLAUXID=A.CLAUXID AND '+
                   ' B.AUXID=A.AUXID AND B.CLAUXID IS NOT NULL AND B.AUXID IS NOT NULL ) '+
                   ' group by a.cuentaid,a.clauxid,a.auxid';

  dm1.DCOM1.AppServer.IniciaTransaccion;
  try
   DM1.DCOM1.AppServer.EjecutaQry(xSQL);
   dm1.DCOM1.AppServer.GrabaTransaccion;
  except
  dm1.DCOM1.AppServer.RegresaTransaccion;
  end;


//** 25/10/2001 - pjsv esta parte es para actualizar los auxiliares, tienes que probarlo
//** para ORACLE

      xSQL:=' SELECT '+
            'A.CIAID,A.CUENTAID,A.CLAUXID,A.AUXID,sum('+wReplacCeros+'(a.CNTDEBEMN'+',0)) DEBEMN'+ xMes+','+
            'sum('+wReplacCeros+'(a.CNTDEBEME'+',0)) DEBEME'+ xMes+','+
            'sum('+wReplacCeros+'(a.CNTHABEMN'+',0)) HABEMN'+ xMes+','+
            'sum('+wReplacCeros+'(a.CNTHABEME'+',0)) HABEME'+ xMes +
            ' from cnt301 a,tge202 c'+
                   ' WHERE (a.CUENTAID = c.CUENTAID(+) and a.CIAID=c.CIAID(+) AND C.CTA_AUX=''S'')'+
                   ' AND   a.auxid is not null AND A.CLAUXID IS NOT NULL and a.CNTANOMM='+quotedstr(xxxAnoMM);
      If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
       xSql := xSql + ' AND a.CIAID='+quotedstr(xxxCia)
      else
       xSql := xSql + ' AND a.CIAID='+quotedstr(dblcCia.text);
     xSql := xSql + ' AND EXISTS(SELECT B.CUENTAID FROM CNT401 B WHERE B.CIAID=A.CIAID AND B.CLAUXID=A.CLAUXID AND '+
                   ' B.AUXID=A.AUXID AND B.CLAUXID IS NOT NULL AND B.AUXID IS NOT NULL) '+
                   ' group by A.CIAID,a.cuentaid,a.clauxid,a.auxid';

      DM1.cdsQry2.Close;
      DM1.cdsQry2.ProviderName:= 'PrvTGE';
      DM1.cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
      DM1.cdsQry2.Open;
      DM1.cdsQry2.IndexFieldNames:='CIAID;CUENTAID;CLAUXID;AUXID';

      DM1.cdsQry2.First;
      while not DM1.cdsQry2.EOF do
      begin
        xSQL:=' UPDATE CNT401 '+
              ' SET DEBEMN'+xMes+'='+DM1.cdsQry2.FieldByName('DEBEMN'+xMes).AsString+','+
              '     DEBEME'+xMes+'='+DM1.cdsQry2.FieldByName('DEBEME'+xMes).AsString+','+
              '     HABEMN'+xMes+'='+DM1.cdsQry2.FieldByName('HABEMN'+xMes).AsString+','+
              '     HABEME'+xMes+'='+DM1.cdsQry2.FieldByName('HABEME'+xMes).AsString+
              ' WHERE CIAID='+QuotedStr(DM1.cdsQry2.FieldByName('CIAID').AsString)+
              ' AND CUENTAID='+QuotedStr(DM1.cdsQry2.FieldByName('CUENTAID').AsString)+
              ' AND CLAUXID='+QuotedStr(DM1.cdsQry2.FieldByName('CLAUXID').AsString)+
              ' AND AUXID='+QuotedStr(DM1.cdsQry2.FieldByName('AUXID').AsString);

         dm1.DCOM1.AppServer.IniciaTransaccion;
         try
          DM1.DCOM1.AppServer.EjecutaQry(xSQL);
          dm1.DCOM1.AppServer.GrabaTransaccion;
         except
          dm1.DCOM1.AppServer.RegresaTransaccion;
         end;
        DM1.cdsQry2.Next;
      end;

      DM1.cdsQry2.IndexFieldNames:='';
//**

  xMesA := DM1.StrZero(IntToStr(StrToInt(xmes) -1),2);
  xSql := 'UPDATE CNT401 SET '+
          'SALDMN'+ xMes +'= ('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
          wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),'+
          'SALDME'+ xMes +'= ('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0),';


 for xZ:=StrToInt( xMes )+1 to 13 do
  begin
   xMesT := DM1.StrZero( IntToStr(xZ),2);
   xSQL:= xSQL + 'SALDMN'+ xMesT +'=('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
         wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),';
  end;
 for xZ:=StrToInt( xMes )+1 to 13 do
  begin
    xMesT := DM1.StrZero( IntToStr(xZ),2);
    If xZ <> 13 then
     xSQL:= xSQL + 'SALDME'+ xMesT +'=('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0),'
    else
     xSQL:= xSQL + 'SALDME'+ xMesT +'=('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0)';
  end;
  xSQL:= xSQL + ' where ANO='+quotedstr(xAno);
  If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
   xSql := xSql + ' AND CIAID='+quotedstr(xxxCia)
  else
   xSql := xSql + ' AND CIAID='+quotedstr(dblcCia.text);

  dm1.DCOM1.AppServer.IniciaTransaccion;
  try
   DM1.DCOM1.AppServer.EjecutaQry(xSQL);
   dm1.DCOM1.AppServer.GrabaTransaccion;
  except
   dm1.DCOM1.AppServer.RegresaTransaccion;
  end;

///////////////////// para C. Costos ///////////////////////////////////
   //**12/09/2001 - pjsv, actualizo todos los C. de Costo a null
   //** siempre y cuando esten en '', para que no me generen registro indebidos
  if (SRV_D = 'DB2NT') or	 (SRV_D = 'DB2400') then
   xSql := 'UPDATE CNT401 SET CCOSID=NULL WHERE CCOSID=''''';
  if SRV_D = 'ORACLE' then
   xSql := 'UPDATE CNT401 SET CCOSID=NULL WHERE CCOSID IS NULL';
  If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
   xSql := xSql + ' AND CNT401.CIAID='+quotedstr(xxxCia)
  else
   xSql := xSql + ' AND CNT401.CIAID='+quotedstr(dblcCia.text);


   dm1.DCOM1.AppServer.IniciaTransaccion;
   try
    DM1.DCOM1.AppServer.EjecutaQry(xSQL);
    dm1.DCOM1.AppServer.GrabaTransaccion;
   except
   dm1.DCOM1.AppServer.RegresaTransaccion;
   end;
   //**

 xSql := ' insert into cnt401'+
         '(ciaid,cuentaid,auxid,clauxid,ano,ctades,tipo,cta_mov,auxdes,ccosid,ccodes,'+
         'DEBEMN'+ xMes+','+'DEBEME'+ xMes +','+
         'HABEMN'+ xMes +','+'HABEME'+ xMes +')';
     If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
       xSql := xSql + ' select '+quotedstr(xxxCia)+', a.cuentaid,max(a.auxid) auxid,max(a.clauxid) clauxid,'
     else
       xSql := xSql + ' select '+quotedstr(dblcCia.text)+', a.cuentaid,max(a.auxid) auxid,max(a.clauxid) clauxid,';
     xSql := xSql + quotedstr(xAno)+', max(a.ctades) ctades, max(c.ctaniv) ctaniv,'+
         ' max(c.cta_mov) cta_mov, max(a.auxdes) auxdes, a.ccosid,max(a.ccosdes) ccosdes,'+
         'sum('+wReplacCeros+'(a.CNTDEBEMN'+',0)) DEBEMN'+ xMes+','+
         'sum('+wReplacCeros+'(a.CNTDEBEME'+',0)) DEBEME'+ xMes+','+
         'sum('+wReplacCeros+'(a.CNTHABEMN'+',0)) HABEMN'+ xMes+','+
         'sum('+wReplacCeros+'(a.CNTHABEME'+',0)) HABEME'+ xMes ;
     xSql := xSql +  ' from cnt301 a,tge202 c '+
                     ' WHERE (a.CUENTAID = c.CUENTAID(+) and a.CIAID=c.CIAID(+) AND c.CTA_CCOS=''S'')'+
                     ' AND a.ccosid is not null and a.auxid is null and a.CNTANOMM='+quotedstr(xxxAnoMM);
     If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
       xSql := xSql + ' AND a.CIAID='+quotedstr(xxxCia)
     else
       xSql := xSql + ' AND a.CIAID='+quotedstr(dblcCia.text);
     xSql := xSql +  ' AND NOT EXISTS(SELECT B.CUENTAID FROM CNT401 B WHERE B.CIAID=A.CIAID AND B.CCOSID=A.CCOSID '+
                     ' AND B.CLAUXID IS NULL AND B.AUXID IS NULL AND'+
                     ' B.CCOSID IS NOT NULL)'+
                     ' group by a.cuentaid,a.ccosid';

{     xSql := xSql +  ' from cnt301 a,tge202 c,CNT401 B '+
                     ' where (a.CUENTAID = c.CUENTAID(+) and a.CIAID=c.CIAID(+)) and'+
                     ' (a.CUENTAID = b.CUENTAID(+) AND '+
                     ' a.ccosid <> b.ccosid(+) and b.ccosid is null ) and'+
                     ' a.ccosid is not null  and a.CNTANOMM='+quotedstr(xxxAnoMM)+
                     ' AND a.CIAID='+quotedstr(dblcCia.text)+
                     ' group by a.cuentaid,a.ccosid';}


 dm1.DCOM1.AppServer.IniciaTransaccion;
 try
  DM1.DCOM1.AppServer.EjecutaQry(xSQL);
  dm1.DCOM1.AppServer.GrabaTransaccion;
 except
  dm1.DCOM1.AppServer.RegresaTransaccion;
 end;


 //** 25/10/2001 - pjsv

       xSQL:=' SELECT '+
            'A.CIAID,A.CUENTAID,A.CCOSID,sum('+wReplacCeros+'(a.CNTDEBEMN'+',0)) DEBEMN'+ xMes+','+
            'sum('+wReplacCeros+'(a.CNTDEBEME'+',0)) DEBEME'+ xMes+','+
            'sum('+wReplacCeros+'(a.CNTHABEMN'+',0)) HABEMN'+ xMes+','+
            'sum('+wReplacCeros+'(a.CNTHABEME'+',0)) HABEME'+ xMes +
            ' from cnt301 a,tge202 c'+
                   ' WHERE (a.CUENTAID = c.CUENTAID(+) and a.CIAID=c.CIAID(+) AND C.CTA_CCOS=''S'')'+
                   ' AND   a.CCOSID is not null  and a.CNTANOMM='+quotedstr(xxxAnoMM);
       If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
        xSql := xSql + ' AND a.CIAID='+quotedstr(xxxCia)
       else
        xSql := xSql + ' AND a.CIAID='+quotedstr(dblcCia.text);
        xSql := xSql + ' AND EXISTS(SELECT B.CUENTAID FROM CNT401 B WHERE B.CIAID=A.CIAID AND B.CCOSID=A.CCOSID AND '+
                       ' B.CCOSID IS NOT NULL ) '+
                       ' group by A.CIAID,a.cuentaid,A.CCOSID';

      DM1.cdsQry2.Close;
      DM1.cdsQry2.ProviderName:= 'PrvTGE';
      DM1.cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
      DM1.cdsQry2.Open;
      DM1.cdsQry2.IndexFieldNames:='CIAID;CUENTAID;CCOSID';

      DM1.cdsQry2.First;
      while not DM1.cdsQry2.EOF do
      begin
        xSQL:=' UPDATE CNT401 '+
              ' SET DEBEMN'+xMes+'='+DM1.cdsQry2.FieldByName('DEBEMN'+xMes).AsString+','+
              '     DEBEME'+xMes+'='+DM1.cdsQry2.FieldByName('DEBEME'+xMes).AsString+','+
              '     HABEMN'+xMes+'='+DM1.cdsQry2.FieldByName('HABEMN'+xMes).AsString+','+
              '     HABEME'+xMes+'='+DM1.cdsQry2.FieldByName('HABEME'+xMes).AsString+
              ' WHERE CIAID='+QuotedStr(DM1.cdsQry2.FieldByName('CIAID').AsString)+
              ' AND CUENTAID='+QuotedStr(DM1.cdsQry2.FieldByName('CUENTAID').AsString)+
              ' AND CCOSID='+QuotedStr(DM1.cdsQry2.FieldByName('CCOSID').AsString);
         dm1.DCOM1.AppServer.IniciaTransaccion;
         try
          DM1.DCOM1.AppServer.EjecutaQry(xSQL);
          dm1.DCOM1.AppServer.GrabaTransaccion;
         except
          dm1.DCOM1.AppServer.RegresaTransaccion;
         end;

        DM1.cdsQry2.Next;
      end;

  DM1.cdsQry2.IndexFieldNames:='';

  xMesA := DM1.StrZero( IntToStr(StrToInt(xmes) -1),2);
  xSql := 'UPDATE CNT401 SET '+
          'SALDMN'+ xMes +'= ('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
          wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),'+
          'SALDME'+ xMes +'= ('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0),';


  for xZ:=StrToInt( xMes )+1 to 13 do
   begin
    xMesT := DM1.StrZero( IntToStr(xZ),2);
    xSQL:= xSQL + 'SALDMN'+ xMesT +'=('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
          wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),';
   end;
 for xZ:=StrToInt( xMes )+1 to 13 do
  begin
    xMesT := DM1.StrZero( IntToStr(xZ),2);
    If xZ <> 13 then
     xSQL:= xSQL + 'SALDME'+ xMesT +'=('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0),'
    else
     xSQL:= xSQL + 'SALDME'+ xMesT +'=('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0)';
  end;
  xSQL:= xSQL + ' where ANO='+quotedstr(xAno);
   If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
    xSql := xSql + ' AND CIAID='+quotedstr(xxxCia)
   else
    xSql := xSql + ' AND CIAID='+quotedstr(dblcCia.text);

 dm1.DCOM1.AppServer.IniciaTransaccion;
 try
  DM1.DCOM1.AppServer.EjecutaQry(xSQL);
  dm1.DCOM1.AppServer.GrabaTransaccion;
 except
  dm1.DCOM1.AppServer.RegresaTransaccion;
 end;

  //** genero montos de las cuentas en la CNT401 que no tengan Auxid y CCOSID
    xSql := 'select a.ciaid,a.cuentaid,sum('+wReplacCeros+'(a.cntdebemn,0)) cntdebemn,sum('+wReplacCeros+'(a.cntdebeme,0)) cntdebeme,'+
          'sum('+wReplacCeros+'(a.cnthabemn,0)) cnthabemn, sum('+wReplacCeros+'(a.cnthabeme,0)) cnthabeme,'+
          '(sum('+wReplacCeros+'(a.cntdebemn,0)) -  sum('+wReplacCeros+'(a.cnthabemn,0))) saldmn'+DM1.StrZero(xMes,2)+','+
          '(sum('+wReplacCeros+'(a.cntdebeme,0)) -  sum('+wReplacCeros+'(a.cnthabeme,0))) saldme'+DM1.StrZero(xMes,2);
    xSql := xSql + ' from cnt301 a,cnt401 b';
    If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
     xSql := xSql + ' where a.cntanomm='+quotedstr(xxxAnoMM)+' AND a.CIAID='+quotedstr(xxxCia)
    else
     xSql := xSql +  ' where a.cntanomm='+quotedstr(xxxAnoMM)+' AND a.CIAID='+quotedstr(dblcCia.text);
     xSql := xSql +  ' AND (b.cuentaid(+)=a.cuentaid and '+
                   wReplacCeros+'(b.auxid(+),''-'') = ''-'' and '+wReplacCeros+'(b.ccosid(+),''-'') = ''-'' and ';
    If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
     xSql := xSql + wreplacCeros+'(b.clauxid(+),''-'') = ''-'' and b.ano='+quotedstr(xAno)+' AND b.CIAID='+quotedstr(xxxCia)+')'
    else
      xSql := xSql + wreplacCeros+'(b.clauxid(+),''-'') = ''-'' and b.ano='+quotedstr(xAno)+' AND b.CIAID='+quotedstr(dblcCia.text)+')';
    xSql := xSql +' group by a.ciaid,a.cntano,a.cntanomm,a.cuentaid';
 DM1.cdsQry2.Close;
 DM1.cdsQry2.ProviderName:= 'PrvTGE';
 DM1.cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
 DM1.cdsQry2.Open;
 DM1.cdsQry2.IndexFieldNames:='CIAID;CUENTAID';
 GrabaSaldos;

 //** genero los montos de las cuentas internas
 dm1.cdsNivel.Open;
 xNumNiv := dm1.cdsNivel.recordcount;
 dm1.cdsNivel.IndexFieldNames := 'NIVEL';
 dm1.cdsNivel.Last;
 xNivel := dm1.cdsNivel.FieldByName('NIVEL').AsString;

 For xZ := 1 to xNumNiv do
    If (StrToInt(xNivel) - xZ) >= 1 then
       xNiv[xZ] := StrToInt(xNivel) - xZ
    else break;

 For xZ := 1 to High(xNiv) do
 begin
   if xNiv[xZ] <> 0 then
   begin

   // determina los digitos del nivel a totalizar
      dm1.cdsNivel.SetKey;
      dm1.cdsNivel.fieldbyname('NIVEL').AsString := IntToStr(xNiv[xZ]);
      if dm1.cdsNivel.GotoKey then
         xDigitos1 := StrToInt(dm1.cdsNivel.fieldbyname('DIGITOS').AsString);

   // determina los dígitos del nivel a sumar
      xNivel := IntToStr(xNiv[xZ]+1 );
      dm1.cdsNivel.SetKey;
      dm1.cdsNivel.fieldbyname('NIVEL').AsString := xNivel; //IntToStr(xNiv[xZ]);
      If dm1.cdsNivel.GotoKey then
         xDigitos := StrToInt(dm1.cdsNivel.fieldbyname('DIGITOS').AsString);

   // xsigno := dm1.cdsNivel.fieldbyname('SIGNO').AsString;
      xSql := 'SELECT TGE202.ciaid, tge202.cuentaid,'+
          ' sum(debemn'+dm1.StrZero(xMes,2)+') cntdebemn,'+
          ' sum(debeme'+dm1.StrZero(xMes,2)+') cntdebeme,'+
          ' sum(habemn'+dm1.StrZero(xMes,2)+') cnthabemn,'+
          ' sum(habeme'+dm1.StrZero(xMes,2)+') cnthabeme,'+
          '(sum(debemn'+dm1.StrZero(xMes,2)+') -  sum(habemn'+dm1.StrZero(xMes,2) +')) SALDMN'+DM1.StrZero(xMes,2)+','+
          '(sum(debeme'+dm1.StrZero(xMes,2)+') -  sum(habeme'+dm1.StrZero(xMes,2) +')) SALDME'+DM1.StrZero(xMes,2);


      if (SRV_D = 'DB2NT') or	 (SRV_D = 'DB2400') then
       begin
        xSql := xSql + ' from cnt401 a'+
                       ' left join tge202 b on (b.ctaniv='+quotedstr(IntToStr(xNiv[xZ]))+
        ' and b.cuentaid= substr(b.cuentaid,1,'+IntToSTr(xDigitos1)+')) ';
         If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
          xSql := xSql + ' and b.CIAID='+quotedstr(xxxCia)
         else
          xSql := xSql + ' and b.CIAID='+quotedstr(dblcCia.text);
         xSql := xSql +  ' where (('+wReplacCeros+'(cnt401.auxid,''-'') = ''-'') or (cnt401.auxid = '''')) and (('+
                          wReplacCeros+'(cnt401.ccosid,''-'') = ''-'') or (cnt401.ccosid = '''')) and (('+
                          wReplacCeros+'(cnt401.clauxid,''-'') = ''-'') or (cnt401.clauxid = '''')) '+
                          ' and cnt401.tipo= '+quotedstr(xNivel)+
                          '  and CNT401.ANO='+quotedstr(xAno);
        If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
         xSql := xSql + ' and CNT401.CIAID='+quotedstr(xxxCia)
        else
         xSql := xSql + ' and CNT401.CIAID='+quotedstr(dblcCia.text);
        xSql := xSql + ' group by  b.ciaid,b.cuentaid ORDER BY b.cuentaid';

       end
      else
       if SRV_D = 'ORACLE' then
        begin
         xSql := xSql + ' from cnt401,TGE202'+
              ' where (('+wReplacCeros+'(cnt401.auxid,''-'') = ''-'') or (cnt401.auxid = '''')) and (('+
                        wReplacCeros+'(cnt401.ccosid,''-'') = ''-'') or (cnt401.ccosid = '''')) and (('+
                        wReplacCeros+'(cnt401.clauxid,''-'') = ''-'') or (cnt401.clauxid = '''')) '+
              ' and cnt401.tipo= '+quotedstr(xNivel)+
              '  and CNT401.ANO='+quotedstr(xAno);
           If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
            xSql := xSql + ' and CNT401.CIAID='+quotedstr(xxxCia)
           else
            xSql := xSql + ' and CNT401.CIAID='+quotedstr(dblcCia.text);
           xSql := xSql +  ' and tge202.ctaniv(+)='+quotedstr(IntToStr(xNiv[xZ]))+
                           ' and tge202.cuentaid(+)= substr(cnt401.cuentaid,1,'+IntToSTr(xDigitos1)+')';
           If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
            xSql := xSql + ' and tge202.CIAID(+)='+quotedstr(xxxCia)
           else
            xSql := xSql + ' and tge202.CIAID(+)='+quotedstr(dblcCia.text);
           xSql := xSql + ' group by  tge202.ciaid,tge202.cuentaid ORDER BY tge202.cuentaid';
        end;
      DM1.cdsQry2.Close;
      DM1.cdsQry2.ProviderName:= 'PrvTGE';
      DM1.cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
      DM1.cdsQry2.Open;
      DM1.cdsQry2.IndexFieldNames:='CIAID;CUENTAID';
//      If StrToInt(xNivel) < 3 then
       GrabaSaldos;
    end;
  end;
  DM1.cdsQry2.IndexFieldNames:='';
  Showmessage('Termino A LAS '+DateToStr(date)+' a las '+TimetoStr(Now));
end;


procedure TFTransferencia.CreaPanel( xForma:TForm; xMensaje:String );
begin
   pnlConta := TPanel.Create( xForma );
   pbConta  := TProgressBar.Create( NIL );
   pbConta.Width:= 205;
   pbConta.Top  := 78;
   pbConta.Left := 48;
   pbConta.Min  := 0;
   pbConta.Max  := 5;
   pbConta.Parent := pnlConta;
   pnlConta.Alignment := taCenter;
   pnlConta.BringToFront;
   pnlConta.Width  := 300;
   pnlConta.Height := 100;
   pnlConta.Top    := xForma.Height-200;
   pnlConta.Left   := StrToInt(FloattoStr(DM1.FRound( ( ((xForma.Width-100))/2)-100,3,0 )));
   pnlConta.Parent := xForma;
   pnlConta.BevelInner := bvRaised;
   pnlConta.BevelOuter := bvRaised;
   pnlConta.BevelWidth := 3;
   pnlConta.Font.Name  := 'Times New Roman';
   pnlConta.Font.Style := [fsBold,fsItalic];
   pnlConta.Font.Size  := 12;
   pnlConta.Caption:= xMensaje;
   pbConta.Position:=1;
   pnlConta.Refresh;
end;

procedure TFTransferencia.PanelMsg( xMensaje:String; xProc:Integer );
begin
   If xProc>0 then begin
      pbConta.Position:= 0;
      pbConta.Min     := 0;
      pbConta.Max     := xProc;
   end;
   pnlConta.Caption:= xMensaje;
   If xProc=0 then pbConta.Position:= pbConta.Position + 1;
   pnlConta.Refresh;
end;

////////////////////////////////////////
//                                    //
//       Fin de Contabilización       //
//                                    //
////////////////////////////////////////

procedure TFTransferencia.FormActivate(Sender: TObject);
begin
	 Iniciadatos;
  bbtnRecal.Enabled := DM1.wAdmin='P';
  bbtnRecal.Visible := DM1.wAdmin='P';
end;

procedure TFTransferencia.GrabaSaldos;
var
 xZ : Integer;
  xSql : String;
begin
 DM1.cdsRCuenta.Close;
 {
 xSql := 'SELECT * FROM CNT401 WHERE ('+wReplacCeros+'(cnt401.auxid,''-'') = ''-'' OR (CNT401.AUXID <> ''''))'+
                            ' and ('+wReplacCeros+'(cnt401.ccosid,''-'') = ''-'' OR (cnt401.ccosid <> ''''))and ('+
                            wReplacCeros+'(cnt401.clauxid,''-'') = ''-'' OR (cnt401.clauxid <> ''''))'+
                           ' AND cnt401.ANO='+quotedstr(xAno)+
                           ' AND cnt401.CIAID='+quotedstr(dblcCia.text)+' ORDER BY CUENTAID';
 }
 xSql := 'SELECT * FROM CNT401 WHERE ('+wReplacCeros+'(CNT401.AUXID,''-'') = ''-'' OR (CNT401.AUXID <> ''''))'+
                            ' and ('+wReplacCeros+'(CNT401.CCOSID,''-'') = ''-'' OR (CNT401.CCOSID <> '''')) and ('+
                            wReplacCeros+'(CNT401.CLAUXID,''-'') = ''-'' OR (CNT401.CLAUXID <> ''''))'+
                           ' AND CNT401.ANO='+quotedstr(xAno);
  If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
    xSql := xSql + ' AND CNT401.CIAID='+quotedstr(xCias)
  else
   xSql := xSql + ' AND CNT401.CIAID='+quotedstr(dblcCia.text);


 xMesA := DM1.StrZero(IntToStr(StrToInt(xmes) -1),2);

 DM1.cdsRCuenta.DataRequest(xSql);
 DM1.cdsRCuenta.Open;
 DM1.cdsRCuenta.IndexFieldNames :='CIAID;CUENTAID';
 DM1.cdsQry2.First;
 while not DM1.cdsQry2.eof do
  begin
   DM1.cdsRCuenta.Setkey;
   DM1.cdsRCuenta.FieldByname('CIAID').AsString   :=DM1.cdsQry2.FieldByName('CIAID').AsString;
   DM1.cdsRCuenta.FieldByname('CUENTAID').AsString:= DM1.cdsQry2.FieldByName('CUENTAID').AsString;
   If DM1.cdsRCuenta.Gotokey then
    begin
     DM1.cdsRCuenta.edit;
     DM1.cdsRCuenta.FieldByname('DEBEMN'+dm1.StrZero(xMes,2)).AsString := DM1.cdsQry2.FieldByName('CNTDEBEMN').AsString;
     DM1.cdsRCuenta.FieldByname('DEBEME'+dm1.StrZero(xMes,2)).AsString := DM1.cdsQry2.FieldByName('CNTDEBEME').AsString;
     DM1.cdsRCuenta.FieldByname('HABEMN'+dm1.StrZero(xMes,2)).AsString := DM1.cdsQry2.FieldByName('CNTHABEMN').AsString;
     DM1.cdsRCuenta.FieldByname('HABEME'+dm1.StrZero(xMes,2)).AsString := DM1.cdsQry2.FieldByName('CNTHABEME').AsString;
//CLG 22/10/2001
//     DM1.cdsRCuenta.FieldByname('SALDMN'+dm1.StrZero(xMes,2)).AsFloat := DM1.cdsRCuenta.FieldByname('SALDMN'+dm1.StrZero(xMesA,2)).AsFloat + DM1.cdsQry2.FieldByName('SALDMN'+dm1.StrZero(xMes,2)).AsFloat;
//     DM1.cdsRCuenta.FieldByname('SALDME'+dm1.StrZero(xMes,2)).AsFloat := DM1.cdsRCuenta.FieldByname('SALDME'+dm1.StrZero(xMesA,2)).AsFloat + DM1.cdsQry2.FieldByName('SALDME'+dm1.StrZero(xMes,2)).AsFloat;
     DM1.cdsRCuenta.FieldByname('SALDMN'+dm1.StrZero(xMes,2)).AsFloat := DM1.cdsRCuenta.FieldByname('SALDMN'+dm1.StrZero(xMesA,2)).AsFloat + DM1.cdsQry2.FieldByName('SALDMN'+dm1.StrZero(xMes,2)).AsFloat;
     DM1.cdsRCuenta.FieldByname('SALDME'+dm1.StrZero(xMes,2)).AsFloat := DM1.cdsRCuenta.FieldByname('SALDME'+dm1.StrZero(xMesA,2)).AsFloat + DM1.cdsQry2.FieldByName('SALDME'+dm1.StrZero(xMes,2)).AsFloat;

     for xZ:=StrToInt(xMes)+1 to 13 do
      begin
       xMesT := DM1.StrZero( IntToStr(xZ),2);
         DM1.cdsRCuenta.FieldByname('SALDMN'+xMesT).AsFloat := DM1.cdsRCuenta.FieldByname('SALDMN'+dm1.StrZero(xMes,2)).AsFloat;
         DM1.cdsRCuenta.FieldByname('SALDME'+xMesT).AsFloat := DM1.cdsRCuenta.FieldByname('SALDME'+dm1.StrZero(xMes,2)).AsFloat;
      end;
    end;
    cdsPost(DM1.cdsRCuenta);
   DM1.cdsQry2.next;
  end;
 try
   dm1.ControlTran;
 except
 end;
end;

procedure TFTransferencia.rgTipdiaExit(Sender: TObject);
begin
     case rgTipDia.ItemIndex of
      0 : dblcTDiario.enabled := False;
      1 : begin
           dblcTDiario.enabled := true;
           dblcTDiario.setfocus;
          end;
     end;
// if rgTipDia.ItemIndex = 1 then
//    FTDiario.ShowModal;
end;

procedure TFTransferencia.bbtnRecalClick(Sender: TObject);
var
	 xSQL : string;
   xWhere,xano,xmes : string;
   xcantidad : string;
   xRGCount,xZ : integer;
begin
   Screen.Cursor:=crHourGlass;
   Z2bbtnContab.Enabled := False;
   bbtnCanc.Enabled := False;
{   //** 24/07/2001 - pjsv - Valida si existen los diarios a Transferir
   xSql := 'select count(*) cantidad from CNT301 A'+
           ' where NOT Exists(Select TDIARID from TGE104 B where B.TDIARID=A.TDIARID)'+
           ' GROUP BY TDIARID';
   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:= 'PrvTGE';
   DM1.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
   DM1.cdsQry.Open;

   //** 24/07/2001 - pjsv - si es mayor que cero significa que hay Diarios que faltan
   if DM1.cdsqry.fieldbyname('CANTIDAD').AsInteger > 0 then
    begin
     ShowMessage('Error en Transferencia, Falta Diarios en la TGE104') ;
     Screen.Cursor:=crDefault;
     exit;
    end;
   //**
}
   if strtoint(speMM.text)=0 then  xmes:='00'
   else if length(speMM.text)=1 then xmes:='0'+speMM.text
   else xmes:=copy(speMM.text,1,2);
   xAno:=speAno.text;

   //** valida si la transferencia ya se efectuo anteriormente
    xWhere := 'CIAID='+quotedstr(dblcCia.Text)+' AND CNTANOMM='+quotedstr(speAno.text+xmes);//+' AND '
    xcantidad:=DM1.DisplayDescrip('PrvTGE','CNT301','COUNT(*) AS CANTIDAD',xWhere,'CANTIDAD');
    Screen.Cursor:=crDefault;
    if strtoint(xcantidad)>0 then
     begin
      if MessageDlg('La Mayorización ya fue efectuada, desea volver a generarla?',
         mtConfirmation, [mbYes, mbNo], 0) = mrNo then
       begin
        Z2bbtnContab.enabled:=True;
        bbtnCanc.enabled:=True;
        Screen.Cursor:=crDefault;
        exit;
       end
      else
        begin
           Screen.Cursor:=crHourGlass;
           xSQL:=' UPDATE CNT401 '+
                 ' SET DEBEMN'+xmes+'=0, '+
                 '     HABEMN'+xmes+'=0, '+
                 '     DEBEME'+xmes+'=0, '+
                 '     HABEME'+xmes+'=0, '+
                 '     SALDMN'+xmes+'=0, '+
                 '     SALDME'+xmes+'=0 '+
                 '     WHERE CIAID='+QuotedStr(dblcCia.Text)+' AND ANO='+quotedstr(speAno.text);
           dm1.DCOM1.AppServer.IniciaTransaccion;
           try
            DM1.DCOM1.AppServer.EjecutaQry(xSQL);
            dm1.DCOM1.AppServer.GrabaTransaccion;
           except
              dm1.DCOM1.AppServer.RegresaTransaccion;
           end;
        end;
     end;
   GeneraEnLinea401(dblccia.text,dblcTDiario.text,speano.text+xmes);
   //**
   Screen.Cursor:=crDefault;
   ShowMessage('Grabación Exitosa');
   Close;
end;


end.


