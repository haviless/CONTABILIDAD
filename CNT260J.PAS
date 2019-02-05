unit CNT260J;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbedit, StdCtrls, Buttons, ComCtrls, Mask, Spin, wwdblook, ExtCtrls,
  wwdbdatetimepicker;

type
  TFTransferencia = class(TForm)
    Panel1: TPanel;
    lblCia: TLabel;
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    edtAnoMM: TEdit;
    dtpFCont: TwwDBDateTimePicker;
    RadioGroup1: TRadioGroup;
    rgTipdia: TRadioGroup;
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure speAnoExit(Sender: TObject);
    procedure speMMExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dtpFContExit(Sender: TObject);
    procedure RadioGroup1Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnCancClick(Sender: TObject);
    procedure IniciaDatos;

    // Contabilidad
    procedure GeneraContabilidad( xxCia, xxTDiario, xxAnoMM: String;
                                  xForma: TForm );
    procedure CreaPanel( xForma:TForm; xMensaje:String );
    procedure PanelMsg( xMensaje:String; xProc:Integer );
    function  Contabiliza( xCia, xTDiario, xAnoMM : String ): Boolean;
    procedure GeneraEnLinea401( xxxCia,xxxDiario,xxxAnoMM: String );
    procedure FormActivate(Sender: TObject);
    procedure rgTipdiaExit(Sender: TObject);

  private
    { Private declarations }
    xMesT,xMes,xAno : string;
    xDigitos,xDigitos1 : Integer;
    procedure GrabaSaldos;
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

procedure TFTransferencia.bbtnOkClick(Sender: TObject);
var
	 xSQL,xSQL1,xSQL2 : string;
   xWhere,xano,xmes : string;
   xcantidad : string;
   xRGCount,xZ : integer;
begin
   Screen.Cursor:=crHourGlass;
   bbtnOk.Enabled := False;
   bbtnCanc.Enabled := False;
   //** 24/07/2001 - pjsv - Valida si existen los diarios a Transferir
   xSql := 'select count(*) cantidad from CNTDVCF'+
           ' where NOT Exists(Select TDIARID from TGE104 B where TDIARID=CLCLD)'+
           ' GROUP BY CLCLD';
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
   xSql := 'select TDIARID,TDIARDES from TGE104'+
           ' where Exists(Select CLCLD from CNTDVCF B where TDIARID=B.CLCLD)'+
           ' order by TDIARID';
   dm1.cdsTDiario.Close;
   dm1.cdsTDiario.DataRequest(xsql);
   dm1.cdsTDiario.Open;
   dm1.cdsTDiario.IndexFieldNames := 'TDIARID';
   dm1.cdsTDiario.First;

  //**
  //** 20/07/2001- pjsv, Optiene el Año y el mes de la tabla a Transferir
  if strtoint(speAno.text)>1999 then xano:=inttostr((strtoint(speAno.text)-2000))
  else xano:=inttostr((strtoint(speAno.text)-1900));
  if strtoint(speMM.text)=0 then  xmes:='00'
  else
   if length(speMM.text)=1 then xmes:='0'+speMM.text
   else xmes:=copy(speMM.text,1,2);
  //**

   //** valida si la transferencia ya se efectuo anteriormente
    xWhere :=
   'CIAID='+quotedstr(dblcCia.Text)+' AND CNTANOMM='+quotedstr(speAno.text+xmes);//+' AND '
    xcantidad:=DM1.DisplayDescrip('PrvTGE','CNT301','COUNT(*) AS CANTIDAD',xWhere,'CANTIDAD');
    Screen.Cursor:=crDefault;
    if strtoint(xcantidad)>0 then
     begin
      if MessageDlg('La Transferencia ya fue efectuada, desea volver a generarla?',
         mtConfirmation, [mbYes, mbNo], 0) = mrNo then
       begin
        bbtnOk.enabled:=True;
        bbtnCanc.enabled:=True;
        Screen.Cursor:=crDefault;
        exit;
       end
      else
        begin
           Screen.Cursor:=crHourGlass;
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

      //** 23/07/2001 - pjsv - verifica que las cuentas a transferir sean de mov.
      xSql :='select COUNT(*) Cantidad from CNTDVCF'+
              ' INNER JOIN TGE202 ON (CUENTAID=CCNTA AND CTA_MOV=''N'')'+
              ' where CCMPÑ='+quotedstr(dblcCia.Text)+' AND AVCHR='+xano+' AND '+
              ' MVCHR='+xmes+' AND '+
              ' SUBSTR(CCNTA,1,1)<>''9'' AND SUBSTR(CCNTA,1,3)<>''797''';
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

      // Verifica la validez de la cuenta en movimiento origen
//      xSQL:='Select Count(*) Cantidad from cntdvcf A '
       xSQL:='Select * from cntdvcf A '
        +'where A.CCMPÑ='+quotedstr(dblcCia.Text)+' AND A.AVCHR='+xano+' AND '
        +'A.MVCHR='+xmes+' AND '
        //** usar solo para JCP - No Borrar  solo para cuentas automaticas
        +'SUBSTR(A.CCNTA,1,1)<>''9'' AND SUBSTR(CCNTA,1,3)<>''797'' AND '
        +'Not Exists(Select * from TGE202 B where B.CIAID='+quotedstr(dblcCia.Text)+' AND B.CUENTAID=A.CCNTA) ';

      DM1.cdsQry.Close;
      DM1.cdsQry.ProviderName:= 'PrvTGE';
      DM1.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
      DM1.cdsQry.Open;
      //** 23/07/2001 - pjsv - si es mayor que cero significa que hay cuentas que faltan
//      if DM1.cdsqry.fieldbyname('CANTIDAD').AsInteger > 0 then
      if DM1.cdsqry.recordcount > 0 then
       begin
        ShowMessage('Error en Transferencia por Inconsistencia de datos'+chr(13)+
                    'Cuenta origen : '+DM1.cdsqry.fieldbyname('CCNTA').AsString+' no tiene su'+
                    ' equivalente en Maestro de Cuentas - SOL !!!') ;
        Screen.Cursor:=crDefault;
        exit;
       end;
    //** 13/08/2001 - pjsv
    case rgTipDia.ItemIndex of
     0 : xRGCount := dm1.cdsTDiario.RecordCount;
     1 : xRGCount := 1;
    end;
    //**
   //** Proceso de Tranferencia ( Parte I)
   For xZ := 1 to xRGCount do
    begin
       dblcTDiario.text :=  dm1.cdsTDiario.fieldbyname('TDIARID').AsString;//ListBox1.Items.Strings[xZ];
       edtTDiario.text := dm1.cdsTDiario.fieldbyname('TDIARDES').AsString;
       dblcTDiario.Refresh;
       edtTDiario.Refresh;
       // Ingresa movimiento contable
       if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
        begin
           xSQL1:=
             'Insert into CNT301 '
             //** compañia y tipo de diario
            +'Select '+quotedstr(dblcCia.Text)+', A.CLCLD, '
            //** comprobante
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
            //** año, año mes, lote
            +'B.FECANO, B.FECANO||B.FECMES, '+quotedstr('0000')+', '
            //** cuenta
            +'A.CCNTA, '
            //** CLASE DE AUXILIAR
            +'case when (A.CTRCR='+quotedstr(' ')+' or A.CTRCR is null) then ' // Clase de Auxiliar
            +'null else F.CLAUIDDS end, '
            //** AUXILIAR
            +'case when (A.CTRCR='+quotedstr(' ')+' or A.CTRCR is null) then ' // Auxiliar
            +'null else A.CTRCR end, '
            //** TIPO DOCUMENTO
            +quotedstr('VR')+','
            // Número de Serie
            +quotedstr('000')+', '
            // NÚMERO DOCUMENTO
            +'cast(A.NDCMN as varchar(20)), '
            // GLOSA
            +'A.TMVMVC, '
            // debe  o haber
            +'case when A.SCRGAB='+quotedstr('C')+' then '+quotedstr('D')
                 +' else '+quotedstr('H')+' end, '
            //** centro de costo
            +'case when (A.CCNPRC='+quotedstr(' ')+' or A.CCNPRC is null) then ' // Centro de Costo
            +'null else A.CCNPRC end, '
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
            // CNTFEMIS
            +'(case when FDCMN=0 then DATE('+''''+formatdatetime(wFormatFecha,dtpFCont.date)+''''+')'
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
            //FECHA DE VENCIMIENTO
            +'DATE(B.FECANO||'+quotedstr('-')+'||B.FECMES||'+quotedstr('-')+'||B.FECDIA)'
            +','
            //FECHA DE NVCHRANTE
            +'DATE(B.FECANO||'+quotedstr('-')+'||B.FECMES||'+quotedstr('-')+'||B.FECDIA)'
            +','
             //CNTESTADO             CNTCUADRE
            +quotedstr('A')+', '+quotedstr('S')+', '
            //CNTFAUTOM,                    CNTUSER
            +quotedstr(' ')+', '+quotedstr(DM1.wUsuario)+', '
            //CNTFREG,          CNTHREG,       CNTMN,    CNTDD,    CNTTRI,    CNTSEM   ,CNTSS
            +wRepFecServi+', '+wRepHorServi+', B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, '
            //CNTAATRI,   CNTAASEM   ,CNTAAS
            +'B.FECAATRI, B.FECAASEM, B.FECAASS, '
            // TMONID
            +'case when A.CTPOMN='+quotedstr('DL')+' then '+quotedstr('02') // Tipo de Moneda
                 +' else '+quotedstr('01')+' end, '
            // FLAGVAR,           FCONS,                  CNTFMEC
            +quotedstr(' ')+', '+quotedstr(' ')+', '+quotedstr(' ')+', '
            //TDIARDES,                CTADES,                AUXDES
            +'char(C.TDIARDES,20), char(D.CTADES,40), char(E.CLAUXDES,15), '
            //DOCDES,          CCOSDES
            +quotedstr(' ')+', '+quotedstr(' ')+', '
            //CNTDEBEMN
            +'case when A.SCRGAB='+quotedstr('C')+' then '
                  +'A.IMNDNC '
                 +' else null end, '
            //CNTDEBEME
            +'case when A.SCRGAB='+quotedstr('C')+' then '
              +'case when A.CTPOMN='+quotedstr('DL')+' then '
                  +'(case when '+wReplacCeros+'(A.IMNDOR,0)=0 then '
                    +' CASE WHEN A.IMNDNC > 0 '
                    +' then (((A.IMNDNC/'+wtcambio+') *100) +0.5)/100 '
                    +' else (((A.IMNDNC/'+wtcambio+') *100) -0.5)/100 end '
                  +'else A.IMNDOR end) '
              +' else 0 end '
            +' else 0 end, '
            //CNTHABEMN
            +'case when A.SCRGAB='+quotedstr('A')+' then '
                  +'A.IMNDNC '
                 +' else 0 end, '
            //CNTHABEME
            +'case when A.SCRGAB='+quotedstr('A')+' then '
              +'case when A.CTPOMN='+quotedstr('DL')+' then '
                  +'(case when '+wReplacCeros+'(A.IMNDOR,0)=0 then '
                    +' CASE WHEN A.IMNDNC > 0 '
                    +' then (((A.IMNDNC/'+wtcambio+') *100) +0.5)/100 '
                    +' else (((A.IMNDNC/'+wtcambio+') *100) -0.5)/100 end '
                  +'else A.IMNDOR end) '
              +' else 0 end '
            +' else 0 end, '
            //CNTSALDMN,CNTSALDME,CAMPOVAR,CNTTS,           CNTPAGADO,             CNTMODDOC,            CNTREG
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
              +'DECODE(NVL(A.RELACION,''NULO''),''NULO'',NULL,A.RELACION), ' //AUXILIAR
              +quotedstr('VR')+','+quotedstr('000')+', '
              +'A.DOCUMENTO, '
              +'SUBSTR(A.COMENTARIO,1,40), '
              +'DECODE(A.DEBE,0,''H'',''D''),'  //FALTA
              +'DECODE(NVL(A.CCOS_CODI,''NULO''),''NULO'',NULL,A.CCOS_CODI), ' //AUXILIAR
              //** Tipo cambio
              +wTCambio+', '
              //** monto original
              +'DECODE(A.DEBE,0,HABER,DEBE),'
          //**
              //** Monto local
              +'DECODE(A.DEBE,0,HABER,DEBE),'             // Monto soles
              //** monto Extranjero
              +'TRUNC(DECODE(A.DEBE,0,HABER/'+wTCambio+',DEBE/'+wTCambio+'),2),'

              +'A.FECH_DOCU, ' //FECHA DE EMISION
              +'TO_DATE(B.FECDIA||'+quotedstr('-')+'||B.FECMES||'+quotedstr('-')+'||B.FECANO)' //FECHA DE VENCIMIENTO
              +','
              +'TO_DATE(B.FECDIA||'+quotedstr('-')+'||B.FECMES||'+quotedstr('-')+'||B.FECANO)'  //FECHA DE COMPROBANTE
              +','
              +quotedstr('A')+', '+quotedstr('S')+', '+quotedstr(' ')+', '+quotedstr(DM1.wUsuario)+', '
              +wRepFecServi+', '+wRepHorServi+', B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, '
              +'B.FECAATRI, B.FECAASEM, B.FECAASS, '
              +'DECODE(A.MONEDA,''D'', ''D'',''N''),' // Tipo de Moneda
              +quotedstr(' ')+', '+quotedstr(' ')+', '+quotedstr(' ')+', '
              +'SUBSTR(C.TDIARDES,1,20), SUBSTR(D.CTADES,1,40), SUBSTR(E.CLAUXDES,1,15), '
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
           'FROM CGFMOV02 A,TGE114 B,TGE104 C,TGE202 D,TGE102 E,CNT405 F'
                 +' WHERE (B.FECHA(+)=TO_DATE('+''''+formatdatetime(wFormatFecha,dtpFCont.date)+''''+'))' //wFormatFecha A.FECH_DOCU(+)) '
                 +' AND (C.TDIARID(+)='+quotedstr(dblcTDiario.Text)+') '
                 +' AND (D.CIAID(+)='+quotedstr(dblcCia.Text)+' AND D.CUENTAID(+)=A.CUENTA) '
                 +' AND (E.CLAUXID(+)= DECODE(SUBSTR(A.RELACION,1,1),''9'',''Z'',SUBSTR(A.RELACION,1,1))) '
                 +' AND (F.CLAUIDOR(+)=A.RELACION) '
                 +' AND (A.NUMCIA='+quotedstr(dblcCia.Text)+' AND A.ANO='+QuotedStr(xano)+' AND '
                +' A.MES='+QuotedStr(xmes)+' AND A.ORIGEN='+quotedstr(dblcTDiario.text)+')';
         end;
       xSQL:=xSQL1+xSQL2;
      dm1.DCOM1.AppServer.IniciaTransaccion;
      try
       DM1.DCOM1.AppServer.EjecutaQry(xSQL);
       dm1.DCOM1.AppServer.GrabaTransaccion;
      except
       dm1.DCOM1.AppServer.RegresaTransaccion;
      end;
      GeneraContabilidad(dblccia.text,dblcTDiario.text,speano.text+xmes,FTransferencia);
      dm1.cdsTDiario.Next;
    end;

    // FINALIZACION DE PROCESO DE TRANSFERENCIA
   //** 03/07/2001 - pjsv
   //** paraque genera la mayorizacion al terminar la transferencia de toda la data
   GeneraEnLinea401(dblccia.text,dblcTDiario.text,speano.text+xmes);
   //**
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
//   dtpFCont.setfocus;
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

	 bbtnOk.setfocus;
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

procedure TFTransferencia.GeneraContabilidad( xxCia, xxTDiario, xxAnoMM: String;
                                   xForma: TForm );
begin
   wTIPOREG2:='RRN( CNT301 ) ';

   CreaPanel( xForma, 'Contabilizando' );

   if Contabiliza( xxCia, xxTDiario, xxAnoMM ) then
      PanelMsg( 'Asiento Contabilizando Final',0 );

   pnlConta.Free;
end;

function TFTransferencia.Contabiliza( xCia, xTDiario, xAnoMM : String ): Boolean;
Var
   xSQL : String;
//   , xNREG
   //, xNroComp
//   xNumT       : Integer;
begin
   // 3

   //** solo para DERRAMA se debe de inhibir esta parte
  PanelMsg( 'Generando Asientos Automaticos',0 );

   xSQL:='INSERT INTO CNT301 ( '
        +'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
        +'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
        +'CNTDH, CCOSID, '
        +'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
        +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
        +'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
        +'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
        +'CNTDEBEMN, CNTDEBEME, '
        +'CNTHABEMN, CNTHABEME, CNTREG) '
        //** 10/05/2001 - pjsv
        // le agrego trim para que no me graba '   ', xque genera errores
        // al momento de sacar los reportes con mayor analitico
        +'SELECT CNT301.CIAID, CNT301.TDIARID, CNT301.CNTCOMPROB, CNT301.CNTANO, CNT301.CNTANOMM, CNT301.CNTLOTE,TRIM(B.CTAAUT1),'
//        +'TRIM('+wReplacCeros+'(CNT301.CLAUXID,''-'')), TRIM('+wReplacCeros+'(CNT301.AUXID,''-'')), CNT301.CNTMODDOC, CNT301.DOCID, CNT301.CNTSERIE, CNT301.CNTNODOC, CNT301.CNTGLOSA,'
        +'TRIM(CNT301.CLAUXID), TRIM(CNT301.AUXID), CNT301.CNTMODDOC, CNT301.DOCID, CNT301.CNTSERIE, CNT301.CNTNODOC, CNT301.CNTGLOSA,'

        +'CNT301.CNTDH , '
        +'CASE WHEN D.CTA_CCOS=''S'' THEN CNT301.CCOSID ELSE '''' END CCOSID, '
        +'CNT301.CNTTCAMBIO, CNT301.CNTMTOORI, CNT301.CNTMTOLOC, CNT301.CNTMTOEXT, CNT301.CNTFEMIS, CNT301.CNTFVCMTO, '
        +'CNT301.CNTFCOMP, CNT301.CNTESTADO, ''S'', ''S'', '
        +''''+DM1.wUsuario+''''+', '+wRepFuncDate+''''+ FORMATDATETIME(wFormatFecha,Date )+''''+'), CURRENT TIME, '
        +'CNT301.CNTMM, CNT301.CNTDD, CNT301.CNTTRI, CNT301.CNTSEM, CNT301.CNTSS, CNT301.CNTAATRI, CNT301.CNTAASEM, '
        +'CNT301.CNTAASS, CNT301.TMONID, D.CTADES, CNT301.TDIARDES, CNT301.AUXDES, CNT301.DOCDES, C.CCOSABR, '
        +'CASE WHEN CNT301.CNTDH=''D'' THEN CNT301.CNTMTOLOC ELSE 0 END, '
        +'CASE WHEN CNT301.CNTDH=''D'' THEN CNT301.CNTMTOEXT ELSE 0 END, '
        +'CASE WHEN CNT301.CNTDH=''H'' THEN CNT301.CNTMTOLOC ELSE 0 END, '
        +'CASE WHEN CNT301.CNTDH=''H'' THEN CNT301.CNTMTOEXT ELSE 0 END, '
        +wTIPOREG2+' '
        +'FROM CNT301 '
        +'LEFT  JOIN TGE203 C ON ( CNT301.CCOSID=C.CCOSID ), '
        +'TGE202 B, TGE202 D '
        +'WHERE  CNT301.CIAID     ='+''''+ xCia    +''''+' AND '
        +'       CNT301.TDIARID   ='+''''+ xTDiario+''''+' AND '
        +'       CNT301.CNTANOMM  ='+''''+ xAnoMM  +''''+' AND '
        +'     ( CNT301.CIAID=B.CIAID AND CNT301.CUENTAID=B.CUENTAID AND B.CTAAUT1 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT1))>0 ) AND '
        +'     ( CNT301.CIAID=D.CIAID AND B.CTAAUT1=D.CUENTAID AND B.CTAAUT1 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT1))>0  ) ';

       dm1.DCOM1.AppServer.IniciaTransaccion;
       try
        DM1.DCOM1.AppServer.EjecutaQry(xSQL);
        dm1.DCOM1.AppServer.GrabaTransaccion;
       except
        dm1.DCOM1.AppServer.RegresaTransaccion;
       end;

   // 4
   PanelMsg( 'Generando Asientos Automaticos',0 );

   xSQL:='INSERT INTO CNT301 ( '
        +'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
        +'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
        +'CNTDH, CCOSID, '
        +'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
        +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
        +'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
        +'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
        +'CNTDEBEMN, CNTDEBEME, '
        +'CNTHABEMN, CNTHABEME, CNTREG)'
        //** 10/05/2001 - pjsv
        // le agrego trim para que no me graba '   ', xque genera errores
        // al momento de sacar los reportes con mayor analitico
        +'SELECT CNT301.CIAID, CNT301.TDIARID, CNT301.CNTCOMPROB, CNT301.CNTANO, CNT301.CNTANOMM, CNT301.CNTLOTE, TRIM(B.CTAAUT2),'
//        +'TRIM('+wReplacCeros+'(CNT301.CLAUXID,''-'')), TRIM('+wReplacCeros+'(CNT301.AUXID,''-'')), CNT301.CNTMODDOC, CNT301.DOCID, CNT301.CNTSERIE, CNT301.CNTNODOC,CNT301.CNTGLOSA, '
        +'TRIM(CNT301.CLAUXID), TRIM(CNT301.AUXID), CNT301.CNTMODDOC, CNT301.DOCID, CNT301.CNTSERIE, CNT301.CNTNODOC,CNT301.CNTGLOSA, '

        +'CASE WHEN CNT301.CNTDH=''D'' THEN ''H'' ELSE ''D'' END AS DH, '
        +'CASE WHEN D.CTA_CCOS=''S'' THEN CNT301.CCOSID ELSE '''' END CCOSID, '
        +'CNT301.CNTTCAMBIO, CNT301.CNTMTOORI, CNT301.CNTMTOLOC, CNT301.CNTMTOEXT, CNT301.CNTFEMIS, CNT301.CNTFVCMTO, '
        +'CNT301.CNTFCOMP, CNT301.CNTESTADO, ''S'', ''S'', '
        +''''+DM1.wUsuario+''''+', '+wRepFuncDate+''''+ FORMATDATETIME(wFormatFecha,Date )+''''+'), CURRENT TIME, '
        +'CNT301.CNTMM, CNT301.CNTDD, CNT301.CNTTRI, CNT301.CNTSEM, CNT301.CNTSS, CNT301.CNTAATRI, CNT301.CNTAASEM, '
        +'CNT301.CNTAASS, CNT301.TMONID, D.CTADES, CNT301.TDIARDES, CNT301.AUXDES, CNT301.DOCDES, C.CCOSABR,'
        +'CASE WHEN CNT301.CNTDH=''H'' THEN CNT301.CNTMTOLOC ELSE 0 END, '
        +'CASE WHEN CNT301.CNTDH=''H'' THEN CNT301.CNTMTOEXT ELSE 0 END, '
        +'CASE WHEN CNT301.CNTDH=''D'' THEN CNT301.CNTMTOLOC ELSE 0 END, '
        +'CASE WHEN CNT301.CNTDH=''D'' THEN CNT301.CNTMTOEXT ELSE 0 END, '
        +wTIPOREG2+' '
        +'FROM CNT301 '
        +'LEFT  JOIN TGE203 C ON ( CNT301.CCOSID=C.CCOSID ), '
        +'TGE202 B, TGE202 D '
        +'WHERE  CNT301.CIAID     ='+''''+ xCia    +''''+' AND '
        +'       CNT301.TDIARID   ='+''''+ xTDiario+''''+' AND '
        +'       CNT301.CNTANOMM  ='+''''+ xAnoMM  +''''+' AND '
        +'     ( CNT301.CIAID=B.CIAID AND CNT301.CUENTAID=B.CUENTAID AND B.CTAAUT2 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT2))>0 ) AND '
        +'     ( CNT301.CIAID=D.CIAID AND B.CTAAUT2=D.CUENTAID AND B.CTAAUT2 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT2))>0  ) ';
       dm1.DCOM1.AppServer.IniciaTransaccion;
       try
        DM1.DCOM1.AppServer.EjecutaQry(xSQL);
        dm1.DCOM1.AppServer.GrabaTransaccion;
       except
          dm1.DCOM1.AppServer.RegresaTransaccion;
       end;

   DM1.cdsMovCNT.IndexFieldNames:='CNTCOMPROB';
   // 5
   PanelMsg( 'Generando Cabecera de Contabilidad',0 );

  //**

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
   xSQL:=xSQL+ ''''+DM1.wUsuario+''''+', '+wRepFecServi+', '+wRepHorServi+', A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
   xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, '+quotedstr('01')+', '' '', ';
   xSQL:=xSQL+ 'A.TDIARDES, ';
   xSQL:=xSQL+ 'SUM('+wReplacCeros+'(A.CNTDEBEMN,0)), SUM('+wReplacCeros+'(A.CNTDEBEME,0)), SUM('+wReplacCeros+'(A.CNTHABEMN,0)), SUM('+wReplacCeros+'(A.CNTHABEME,0)), ';
   xSQL:=xSQL+ ''''+Copy( wcampo,6,2 )+''''+',''AS/400'' ';

   xSQL:=xSQL+ 'FROM CNT301 A ';
   xSQL:=xSQL+ 'WHERE A.CIAID='     +''''+xCia    +''''+' AND ';
   xSQL:=xSQL+       'A.TDIARID='   +''''+xTDiario+''''+' AND ';
   xSQL:=xSQL+       'A.CNTANOMM='  +''''+xAnoMM  +'''';
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
     xSQL:=xSQL+       'A.TDIARID='   +''''+xTDiario+''''+' AND ';
     xSQL:=xSQL+       'A.CNTANOMM='  +''''+xAnoMM  +'''';
     xSQL:=xSQL+ ' GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, ';
     xSQL:=xSQL+ 'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
     xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
     xSQL:=xSQL+ 'A.TDIARDES, A.CNTMODDOC';
   end;
  dm1.DCOM1.AppServer.IniciaTransaccion;
  try
  DM1.DCOM1.AppServer.EjecutaQry(xSQL);
  dm1.DCOM1.AppServer.GrabaTransaccion;
  except
    dm1.DCOM1.AppServer.RegresaTransaccion;
  end;
  Result:=True;
end;

procedure TFTransferencia.GeneraEnLinea401( xxxCia,xxxDiario,xxxAnoMM: String );
var
   xZ,xNumNiv : Integer;
   xCuenta,xMesA,xNivel,xSql : String;
   xNiv : Array[1..10] of integer;
begin
   xAno := Copy(xxxAnoMM,1,4);
   xMes := Copy(xxxAnoMM,5,2);
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
             ' LEFT JOIN CNT401 ON (trim(TGE202.CUENTAID) = trim(CNT401.CUENTAID) AND TGE202.CIAID=CNT401.CIAID)'+
             ' WHERE CNT401.CUENTAID IS NULL AND TGE202.CIAID='+quotedstr(dblcCia.text);
  dm1.DCOM1.AppServer.IniciaTransaccion;
  try
   DM1.DCOM1.AppServer.EjecutaQry(xSQL);
   dm1.DCOM1.AppServer.GrabaTransaccion;
  except
   dm1.DCOM1.AppServer.RegresaTransaccion;
  end;

//////////////////////// para Auxiliares /////////////////////////////
    xSql := ' insert into cnt401'+
            '(ciaid,cuentaid,auxid,clauxid,ano,ctades,tipo,cta_mov,auxdes,'+
            'DEBEMN'+ xMes+','+'DEBEME'+ xMes +','+
            'HABEMN'+ xMes +','+'HABEME'+ xMes +')'+
            ' select '+quotedstr(dblcCia.text)+', a.cuentaid,a.auxid,a.clauxid,'+
            quotedstr(xAno)+',max(a.ctades) ctades, max(c.ctaniv) ctaniv,'+
            ' max(c.cta_mov) cta_mov, max(a.auxdes) auxdes,'+
            'sum('+wReplacCeros+'(a.CNTDEBEMN'+',0)) DEBEMN'+ xMes+','+
            'sum('+wReplacCeros+'(a.CNTDEBEME'+',0)) DEBEME'+ xMes+','+
            'sum('+wReplacCeros+'(a.CNTHABEMN'+',0)) HABEMN'+ xMes+','+
            'sum('+wReplacCeros+'(a.CNTHABEME'+',0)) HABEME'+ xMes ;

    xSql := xSql + ' from cnt301 a'+
                   ' left join tge202 c on (a.CUENTAID = c.CUENTAID and a.CIAID=c.CIAID)'+
                   ' left join cnt401 b on (a.CUENTAID = b.CUENTAID AND  b.auxid <> a.auxid and'+
                   ' a.clauxid <> b.clauxid and '+wReplacCeros+'(b.auxid,''-'')<>''-'')'+
                   ' where  a.auxid is not null  and a.CNTANOMM='+quotedstr(xxxAnoMM)+
                   ' AND a.CIAID='+quotedstr(dblcCia.text)+
                   ' group by a.cuentaid,a.clauxid,a.auxid';

    xSql := xSql + ' from cnt301 a,tge202 c'+
                   ' WHERE (a.CUENTAID = c.CUENTAID(+) and a.CIAID=c.CIAID(+))'+
                   ' AND cnt401 b on (a.CUENTAID = b.CUENTAID(+) AND  b.auxid(+) <> a.auxid and'+
                   ' a.clauxid <> b.clauxid(+) and '+wReplacCeros+'(b.auxid,''-'')<>''-'')'+
                   ' AND a.auxid is not null  and a.CNTANOMM='+quotedstr(xxxAnoMM)+
                   ' AND a.CIAID='+quotedstr(dblcCia.text)+
                   ' group by a.cuentaid,a.clauxid,a.auxid';


  dm1.DCOM1.AppServer.IniciaTransaccion;
  try
   DM1.DCOM1.AppServer.EjecutaQry(xSQL);
   dm1.DCOM1.AppServer.GrabaTransaccion;
  except
  dm1.DCOM1.AppServer.RegresaTransaccion;
  end;

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
  xSQL:= xSQL + ' where ANO='+quotedstr(xAno)+
                ' AND CIAID='+quotedstr(dblcCia.text);

  dm1.DCOM1.AppServer.IniciaTransaccion;
  try
   DM1.DCOM1.AppServer.EjecutaQry(xSQL);
   dm1.DCOM1.AppServer.GrabaTransaccion;
  except
   dm1.DCOM1.AppServer.RegresaTransaccion;
  end;

///////////////////// para C. Costos ///////////////////////////////////
 xSql := ' insert into cnt401'+
         '(ciaid,cuentaid,auxid,clauxid,ano,ctades,tipo,cta_mov,auxdes,ccosid,ccodes,'+
         'DEBEMN'+ xMes+','+'DEBEME'+ xMes +','+
         'HABEMN'+ xMes +','+'HABEME'+ xMes +')'+
         ' select '+quotedstr(dblcCia.text)+', a.cuentaid,max(a.auxid) auxid,max(a.clauxid) clauxid,'+
         quotedstr(xAno)+', max(a.ctades) ctades, max(c.ctaniv) ctaniv,'+
         ' max(c.cta_mov) cta_mov, max(a.auxdes) auxdes, a.ccosid,max(a.ccosdes) ccosdes,'+
         'sum('+wReplacCeros+'(a.CNTDEBEMN'+',0)) DEBEMN'+ xMes+','+
         'sum('+wReplacCeros+'(a.CNTDEBEME'+',0)) DEBEME'+ xMes+','+
         'sum('+wReplacCeros+'(a.CNTHABEMN'+',0)) HABEMN'+ xMes+','+
         'sum('+wReplacCeros+'(a.CNTHABEME'+',0)) HABEME'+ xMes ;
     xSql := xSql +  ' from cnt301 a'+
                     ' left join tge202 c on (a.CUENTAID = c.CUENTAID and a.CIAID=c.CIAID)'+
                     ' left join cnt401 b on (a.CUENTAID = b.CUENTAID AND a.ccosid <> b.ccosid and '+wReplacCeros+'(b.ccosid,''-'')<>''-'')'+
                     ' where a.ccosid is not null  and a.CNTANOMM='+quotedstr(xxxAnoMM)+
                     ' AND a.CIAID='+quotedstr(dblcCia.text)+
                     ' group by a.cuentaid,a.ccosid';
 dm1.DCOM1.AppServer.IniciaTransaccion;
 try
  DM1.DCOM1.AppServer.EjecutaQry(xSQL);
  dm1.DCOM1.AppServer.GrabaTransaccion;
 except
  dm1.DCOM1.AppServer.RegresaTransaccion;
 end;

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
  xSQL:= xSQL + ' where ANO='+quotedstr(xAno)+
                ' AND CIAID='+quotedstr(dblcCia.text);

 dm1.DCOM1.AppServer.IniciaTransaccion;
 try
  DM1.DCOM1.AppServer.EjecutaQry(xSQL);
  dm1.DCOM1.AppServer.GrabaTransaccion;
 except
  dm1.DCOM1.AppServer.RegresaTransaccion;
 end;

  //** genero montos de las cuentas en la CNT401 que no tengan Auxid y CCOSID
    xSql := 'select a.ciaid,a.cuentaid,sum(a.cntdebemn) cntdebemn,sum(a.cntdebeme) cntdebeme,'+
          'sum(a.cnthabemn) cnthabemn, sum(a.cnthabeme) cnthabeme,'+
          '(sum(a.cntdebemn) -  sum(a.cnthabemn)) saldmn'+DM1.StrZero(xMes,2)+','+
          '(sum(a.cntdebeme) -  sum(a.cnthabeme)) saldme'+DM1.StrZero(xMes,2);
    xSql := xSql + ' from cnt301 a'+
                   ' left join cnt401 b on (b.cuentaid=a.cuentaid and '+
                   wReplacCeros+'(b.auxid,''-'') = ''-'' and '+wReplacCeros+'(b.ccosid,''-'') = ''-'' and '+
                   wreplacCeros+'(b.clauxid,''-'') = ''-'' and b.ano='+quotedstr(xAno)+' AND b.CIAID='+quotedstr(dblcCia.text)+')'+
                 ' where a.cntanomm='+quotedstr(xxxAnoMM)+' AND a.CIAID='+quotedstr(dblcCia.text)+
                 ' group by a.ciaid,a.cntano,a.cntanomm,a.cuentaid';
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
      //** 17/07/2001 - pjsv - quitar esta condicional si el nivel no esta precedido de Cero y
      //** dejar solo dm1.cdsNivel.fieldbyname('NIVEL').AsString := IntToStr(xNiv[xZ]);
      If xNiv[xZ] <= 9 then
       dm1.cdsNivel.fieldbyname('NIVEL').AsString := '0' + IntToStr(xNiv[xZ])
      else  dm1.cdsNivel.fieldbyname('NIVEL').AsString := IntToStr(xNiv[xZ]);
      //**

      xCuenta := dm1.cdsNivel.fieldbyname('NIVEL').AsString;

      if dm1.cdsNivel.GotoKey then
         xDigitos1 := StrToInt(dm1.cdsNivel.fieldbyname('DIGITOS').AsString);

      //** 17/07/2001 - pjsv - quitar esta condicional si el nivel no esta precedido de Cero y
      //** dejar solo dm1.cdsNivel.fieldbyname('NIVEL').AsString := IntToStr(xNiv[xZ]);
      //** determina los dígitos del nivel a sumar
      If IntToStr(xNiv[xZ]+1 ) <= '9' then
       xNivel := '0' + IntToStr(xNiv[xZ]+1 )
      else xNivel := IntToStr(xNiv[xZ]+1 );
      //**

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
          '(sum(debemn'+dm1.StrZero(xMes,2)+') -  sum(habemn'+dm1.StrZero(xMes,2) +')) saldmn'+DM1.StrZero(xMes,2)+','+
          '(sum(debeme'+dm1.StrZero(xMes,2)+') -  sum(habeme'+dm1.StrZero(xMes,2) +')) saldme'+DM1.StrZero(xMes,2);
       xSql := xSql + ' from cnt401 '+
                       ' left join tge202 on (tge202.ctaniv='+quotedstr(xCuenta)+
        ' and tge202.cuentaid= substr(cnt401.cuentaid,1,'+IntToSTr(xDigitos1)+') '+
        ' and tge202.CIAID='+quotedstr(dblcCia.text)+
        ' ) where '+wReplacCeros+'(cnt401.auxid,''-'') = ''-'' and '+
                 wReplacCeros+'(cnt401.ccosid,''-'') = ''-'' and '+
                 wReplacCeros+'(cnt401.clauxid,''-'') = ''-'' '+
        ' and cnt401.tipo= '+quotedstr(xNivel)+
        '  and CNT401.ANO='+quotedstr(xAno)+
        ' and CNT401.CIAID='+quotedstr(dblcCia.text)+
        ' GROUP BY TGE202.CIAID,TGE202.CUENTAID'+
        ' ORDER BY tge202.cuentaid';
      DM1.cdsQry2.Close;
      DM1.cdsQry2.ProviderName:= 'PrvTGE';
      DM1.cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
      DM1.cdsQry2.Open;
      DM1.cdsQry2.IndexFieldNames:='CIAID;CUENTAID';
//    If StrToInt(xNivel) < 3 then
      GrabaSaldos;
    end;
  end;
  Showmessage('Termino');
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
end;

procedure TFTransferencia.GrabaSaldos;
var
 xZ : Integer;
 xMesA,xSql : String;
begin
 xMesA := DM1.StrZero(IntToStr(StrToInt(xmes) -1),2);
 DM1.cdsRCuenta.Close;
 xSql := 'SELECT * FROM CNT401 WHERE ('+wReplacCeros+'(cnt401.auxid,''-'') = ''-'' OR (CNT401.AUXID = ''''))'+
                            ' and ('+wReplacCeros+'(cnt401.ccosid,''-'') = ''-'' OR (cnt401.ccosid = ''''))and ('+
                            wReplacCeros+'(cnt401.clauxid,''-'') = ''-'' OR (cnt401.clauxid = ''''))'+
                           ' AND cnt401.ANO='+quotedstr(xAno)+
                           ' AND cnt401.CIAID='+quotedstr(dblcCia.text)+' ORDER BY CUENTAID';
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
     DM1.cdsRCuenta.FieldByname('SALDMN'+dm1.StrZero(xMes,2)).AsFloat  := DM1.cdsRCuenta.FieldByname('SALDMN'+dm1.StrZero(xMesA,2)).AsFloat + DM1.cdsQry2.FieldByName('SALDMN'+dm1.StrZero(xMes,2)).AsFloat;
     DM1.cdsRCuenta.FieldByname('SALDME'+dm1.StrZero(xMes,2)).AsFloat  := DM1.cdsRCuenta.FieldByname('SALDME'+dm1.StrZero(xMesA,2)).AsFloat + DM1.cdsQry2.FieldByName('SALDME'+dm1.StrZero(xMes,2)).AsFloat;
     for xZ:=StrToInt(xMes)+1 to 13 do
      begin
       xMesT := DM1.StrZero( IntToStr(xZ),2);
       DM1.cdsRCuenta.FieldByname('SALDMN'+xMesT).AsFloat := DM1.cdsRCuenta.FieldByname('SALDMN'+dm1.StrZero(xMes,2)).AsFloat;
       DM1.cdsRCuenta.FieldByname('SALDME'+xMesT).AsFloat := DM1.cdsRCuenta.FieldByname('SALDME'+dm1.StrZero(xMes,2)).AsFloat;
      end;
    end;
   DM1.cdsQry2.next;
  end;
  dm1.ControlTran;
end;

//** 13/08/2001 - pjsv
procedure TFTransferencia.rgTipdiaExit(Sender: TObject);
begin
     case rgTipDia.ItemIndex of
      0 : dblcTDiario.enabled := False;
      1 : begin
           dblcTDiario.enabled := true;
           dblcTDiario.setfocus;
          end;
     end;
end;
//**

end.


{     xSql := 'UPDATE CNT401 SET '+
             'DEBEMN'+dm1.StrZero(xMes,2)+'=' + DM1.cdsQry2.FieldByName('CNTDEBEMN').AsString+
             ',DEBEME'+dm1.StrZero(xMes,2)+'='+ DM1.cdsQry2.FieldByName('CNTDEBEME').AsString+
             ',HABEMN'+dm1.StrZero(xMes,2)+'='+ DM1.cdsQry2.FieldByName('CNTHABEMN').AsString+
             ',HABEME'+dm1.StrZero(xMes,2)+'='+ DM1.cdsQry2.FieldByName('CNTHABEME').AsString+
             ',SALDMN'+dm1.StrZero(xMes,2)+'='+ FloatToStrF(DM1.cdsRCuenta.FieldByname('SALDMN'+dm1.StrZero(xMesA,2)).AsFloat + DM1.cdsQry2.FieldByName('SALDMN'+dm1.StrZero(xMes,2)).AsFloat,ffFixed,15,2)+
             ',SALDME'+dm1.StrZero(xMes,2)+'='+ FloatToStrF(DM1.cdsRCuenta.FieldByname('SALDME'+dm1.StrZero(xMesA,2)).AsFloat + DM1.cdsQry2.FieldByName('SALDME'+dm1.StrZero(xMes,2)).AsFloat,ffFixed,15,2);
     for xZ:=StrToInt(xMes)+1 to 13 do
      begin
       xMesT := DM1.StrZero( IntToStr(xZ),2);
       xSql := xSql + ',SALDMN'+xMesT+'='+ FloatToStrF(DM1.cdsRCuenta.FieldByname('SALDMN'+dm1.StrZero(xMesA,2)).AsFloat + DM1.cdsQry2.FieldByName('SALDMN'+dm1.StrZero(xMes,2)).AsFloat,ffFixed,15,2)+
                      ',SALDME'+xMesT+'='+ FloatToStrF(DM1.cdsRCuenta.FieldByname('SALDME'+dm1.StrZero(xMesA,2)).AsFloat + DM1.cdsQry2.FieldByName('SALDME'+dm1.StrZero(xMes,2)).AsFloat,ffFixed,15,2);
      end;
     xSql := xSql + ' WHERE CUENTAID='+quotedstr(DM1.cdsQry2.FieldByName('CUENTAID').AsString)+
                    ' AND CIAID='+quotedstr(DM1.cdsQry2.FieldByName('CIAID').AsString)
                     WHERE ('+wReplacCeros+'(cnt401.auxid,''-'') = ''-'' OR (CNT401.AUXID = ''''))'+
                             ' and ('+wReplacCeros+'(cnt401.ccosid,''-'') = ''-'' OR (cnt401.ccosid = ''''))and ('+
                            wReplacCeros+'(cnt401.clauxid,''-'') = ''-'' OR (cnt401.clauxid = ''''))'+
                           ' AND cnt401.ANO='+quotedstr(xAno)+
                           ' AND cnt401.CIAID='+quotedstr(dblcCia.text)+' ORDER BY CUENTAID'
     try
      DM1.DCOM1.AppServer.EjecutaQry(xSQL);
      dm1.DCOM1.AppServer.GrabaTransaccion;
     except
      dm1.DCOM1.AppServer.RegresaTransaccion;
     end;
}

