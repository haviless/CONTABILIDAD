unit CNT260;
// Actualizaciones
// HPC_201501_CNT          12/02/2015  Regulariza Métodos Correctos de Control Transaccional

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbedit, StdCtrls, Buttons, ComCtrls, Mask, Spin, wwdblook, ExtCtrls,
  wwdbdatetimepicker, Wwdbdlg, CheckLst, oaContabiliza, oaVariables;

type
  TFTransferenciaDema = class(TForm)
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
    BitBtn1: TBitBtn;
    meComp: TMaskEdit;
    Label1: TLabel;
    meTAbaco: TMaskEdit;
    Label4: TLabel;
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
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
    xCias,xMesT,xMesA,xMes,xAno : string;
    xDigitos,xDigitos1 : Integer;
    xCNT301 : String;
    xCNT300 : String;
    procedure GrabaSaldos;
    procedure GeneraCorrelativoCtasAutom( xCia, xTDiario, xAnoMM : String) ;
  public
    { Public declarations }

  end;

  procedure CNTransferenciaDema; stdcall;

exports
  CNTransferenciaDema;



var
  FTransferenciaDema: TFTransferenciaDema;
  wtcambio : string;
  pnlConta   : TPanel;
  pbConta    : TProgressBar;
  wTIPOREG2  : String;
  wcampo : string;
  xNombreBoton : String;

implementation

uses CNTDM, CNT265;

{$R *.DFM}

procedure CNTransferenciaDema;
begin
   if DMCNT=nil then exit;
  if not DMCNT.DCOM1.Connected then Exit;
  FTransferenciaDema := TFTransferenciaDema.Create( Application );
  try
    FTransferenciaDema.ShowModal;
  finally
    FTransferenciaDema.Free;
  end;
end;


procedure TFTransferenciaDema.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then
      edtCia.Text:=DMCNT.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía') ;
      dblcCia.SetFocus ;
      exit;
   end ;
   speAno.setfocus;
end;

procedure TFTransferenciaDema.IniciaDatos;
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

procedure TFTransferenciaDema.Z2bbtnContabClick(Sender: TObject);
var
	 xSQL,xSQL1,xSQL2,wSQL : string;
   xWhere,xano,xmes : string;
   xcantidad : string;
   xRGCount,xZ : integer;
begin
   If MessageDlg('¿ Esta Seguro de Ejecutar ?',
      mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

   Screen.Cursor:=crHourGlass;
   Z2bbtnContab.Enabled := False;
   bbtnCanc.Enabled := False;

  If (rgElimina.ItemIndex=0) OR (rgElimina.ItemIndex=1) Then
  Begin
{   //*************** INICIA VALIDACION *********************
    If SRV_D = 'ORACLE' Then
    Begin
        wSQL:='SELECT NUMCIA AS CIA, '+QuotedStr('Tipo de Diario: ')+'||ORIGEN|| '+
        QuotedStr(' Cuenta:  ')+'||CUENTA||'+QuotedStr('  Año:')+'||ANO||'+QuotedStr('  Mes:')+
        '||MES|| '+QuotedStr('   Comprob:')+'||COMPROB AS DATOS, '
        +QuotedStr('No Tiene Tipo de Diario')+' AS PROBLEMA FROM DETCORR L '+
        'WHERE L.ORIGEN IS NULL OR L.ORIGEN='+QuotedStr(' ')+
        'OR L.ORIGEN='+QuotedStr(' ')+
        'UNION '+
        'SELECT NUMCIA AS CIA, '+QuotedStr('Cuenta:  ')+'||CUENTA||'+QuotedStr('  Año:')+
        '||ANO||'+QuotedStr('  Mes:')+'||MES|| '+QuotedStr('  Tipo de Diario:')+
        '||ORIGEN||'+QuotedStr('   Comprob:')+'||COMPROB AS DATOS, '
        +QuotedStr('No Tiene Compañia')+' AS PROBLEMA FROM DETCORR K '+
        'WHERE K.NUMCIA IS NULL OR K.NUMCIA='+QuotedStr(' ')+
        'UNION '+
        'SELECT L.NUMCIA AS CIA,L.CUENTA AS DATOS, '
        +QuotedStr('La Cuenta Exige Centro de Costo')+' AS RESULTADO '+
        'FROM DETCORR L,TGE202 M WHERE M.CUENTAID=L.CUENTA AND '+
        'M.CTA_CCOS='+QuotedStr('S')+' AND L.CCOS_CODI IS NULL '+
        'GROUP BY L.NUMCIA,L.CUENTA '+
        'UNION '+
        'SELECT NUMCIA AS CIA,'+QuotedStr('Cuenta :  ')+'||CUENTA AS DATOS, '
        +QuotedStr('La Cuenta no es de Movimiento, ni es de Destino')+' AS RESULTADO '+
        'FROM DETCORR G WHERE EXISTS (SELECT CIAID,CUENTAID FROM TGE202 H WHERE H.CIAID=G.NUMCIA '+
        ' AND H.CUENTAID=G.CUENTA AND H.CTA_MOV<>'+QuotedStr('S')+' AND H.CTA_DEST<>'+QuotedStr('S')+
        ' GROUP BY H.CIAID,H.CUENTAID ) GROUP BY G.NUMCIA,G.CUENTA '+
        'UNION '+
        'SELECT NUMCIA AS CIA,'+QuotedStr('Cuenta: ')+'||CUENTA AS DATOS, '
        +QuotedStr('La Cuenta No Existe')+' AS PROBLEMA FROM DETCORR A  WHERE NOT EXISTS '+
        '(SELECT CIAID,CUENTAID FROM TGE202 B WHERE B.CIAID=A.NUMCIA AND B.CUENTAID=A.CUENTA) '+
        'AND A.CUENTA IS NOT NULL GROUP BY A.NUMCIA,A.CUENTA '+
        'UNION '+
        'SELECT NUMCIA AS CIA,'+QuotedStr('Auxiliar:  ')+'||RELACION AS DATOS, '
        +QuotedStr('El Auxiliar No Existe')+' AS PROBLEMA FROM DETCORR C WHERE NOT EXISTS '+
        '(SELECT AUXID FROM CNT201 D WHERE D.AUXID=C.RELACION) AND C.RELACION IS NOT NULL '+
        'GROUP BY C.NUMCIA,C.RELACION '+
        'UNION '+
        'SELECT NUMCIA AS CIA,'+QuotedStr('Centro de Costo:  ')+'||CCOS_CODI AS DATOS, '
        +QuotedStr('El Centro de Costo No Existe')+' AS PROBLEMA FROM DETCORR E '+
        'WHERE NOT EXISTS (SELECT CCOSID FROM TGE203 F WHERE F.CCOSID=E.CCOS_CODI) '+
        'AND E.CCOS_CODI IS NOT NULL GROUP BY E.NUMCIA,E.CCOS_CODI '+
        'UNION '+
        'SELECT NUMCIA AS CIA,'+QuotedStr('Año:')+'||ANO||'+QuotedStr('  Mes:')+'||MES|| '
        +QuotedStr('  Tipo de Diario:')+'||ORIGEN||'+QuotedStr('   Comprob:')+'||COMPROB AS DATOS, '
        +QuotedStr('No Tiene los Montos (Debe,Haber) en Moneda=D')+' AS PROBLEMA FROM DETCORR WHERE '+
        'MONEDA='+QuotedStr('D')+' AND ((DEBE_DOL IS NULL AND HABER_DOL IS NULL) '+
        'OR (DEBE_DOL=0 AND HABER_DOL=0)) '+
        'UNION '+
        'SELECT NUMCIA AS CIA,'+QuotedStr('Año:')+'||ANO||'+QuotedStr('  Mes:')+'||MES|| '
        +QuotedStr('  Tipo de Diario:')+'||ORIGEN||'+QuotedStr('   Comprob:')+'||COMPROB AS DATOS, '
        +QuotedStr('No Tiene los Montos (Debe,Haber) en Moneda=N')+' AS PROBLEMA FROM DETCORR WHERE '+
        'MONEDA='+QuotedStr('N')+' AND ((DEBE IS NULL AND HABER IS NULL) OR (DEBE=0 AND HABER=0)) '+
        'UNION '+
        'SELECT NUMCIA AS CIA,'+QuotedStr('Año:')+'||ANO||'+QuotedStr('  Mes:')+'||MES|| '
        +QuotedStr('  Tipo de Diario:')+'||ORIGEN||'+QuotedStr('   Comprob:')+'||COMPROB AS DATOS, '
        +QuotedStr('No Tiene Tipo de Moneda')+' AS PROBLEMA FROM DETCORR WHERE MONEDA='+QuotedStr('N')+
        ' AND ((DEBE IS NULL AND HABER IS NULL) OR (DEBE=0 AND HABER=0)) '+
        'UNION '+
        'SELECT NUMCIA AS CIA,'+QuotedStr('Auxiliar:  ')+'||RELACION AS DATOS, '
        +QuotedStr('El Auxiliar No Existe')+' AS PROBLEMA FROM DETCORR C WHERE NOT EXISTS '+
        '(SELECT AUXID FROM CNT201 D WHERE D.AUXID=C.RELACION) AND C.RELACION IS NOT NULL '+
        'GROUP BY C.NUMCIA,C.RELACION '+
        'UNION '+
        'SELECT NUMCIA AS CIA,'+QuotedStr('Año:')+'||ANO||'+QuotedStr('  Mes:')+'||MES|| '
        +QuotedStr('  Tipo de Diario:')+'||ORIGEN||'+QuotedStr('   Comprob:')+'||COMPROB AS DATOS, '
        +QuotedStr('No Tiene Tipo de Moneda')+' AS PROBLEMA FROM DETCORR WHERE '
        +'ELEMENTO IS NULL OR ELEMENTO='+QuotedStr(' ');

|       DMCNT.cdsQry.Close;
       DMCNT.cdsQry.ProviderName:= 'PrvTGE';
       DMCNT.cdsQry.DataRequest(wSQL);
       DMCNT.cdsQry.Open;

       If DMCNT.cdsQry.RecordCount>0 Then
       Begin
        FInconsistencias:=TFInconsistencias.Create(Self);
        FInconsistencias.ShowModal;
        ShowMessage('El Proceso fue Cancelado. Debe Solucionar las Inconsistencias... ');
        exit;
       End;
    End;
    //************  FIN VALIDACION  *****************
}
  End;

  xCNT301:='CNT301';
  xCNT300:='CNT300';

   //** 24/07/2001 - pjsv - Valida si existen los diarios a Transferir
{   xSql := 'select count(*) cantidad from DETCORR '+
           ' where NOT Exists(Select TDIARID from TGE104 B where TDIARID=ORIGEN)'+
           ' GROUP BY ORIGEN';
   xSql := ' SELECT COUNT(*) CANTIDAD FROM DETCORR,TGE104 WHERE DETCORR.ORIGEN=TGE104.TDIARID(+) AND TDIARDES IS NULL ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.ProviderName:= 'PrvTGE';
   DMCNT.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
   DMCNT.cdsQry.Open;

   //** 24/07/2001 - pjsv - si es mayor que cero significa que hay Diarios que faltan
   If DMCNT.cdsqry.fieldbyname('CANTIDAD').AsInteger > 0 then
   begin
      ShowMessage('Error en Transferencia, Falta Diarios en la TGE104') ;
      Screen.Cursor:=crDefault;
      exit;
   end;
 }
  { If rgTipDia.ItemIndex=0 then begin
     //** 20/07/2001 - pjsv, para que la TGE104 tenga solo los diarios de la tabla a transferir
     xSql:='select TDIARID,TDIARDES from TGE104 '+
         'where Exists(Select ORIGEN from DETCORR B where TDIARID=B.ORIGEN) '+
         'Order by TDIARID';
     DMCNT.cdsTDiario.Close;
     DMCNT.cdsTDiario.DataRequest(xsql);
     DMCNT.cdsTDiario.Open;
     DMCNT.cdsTDiario.IndexFieldNames := 'TDIARID';
     DMCNT.cdsTDiario.First;
   end;
   }
   if strtoint(speMM.text)=0 then  xmes:='00'
   else if length(speMM.text)=1 then xmes:='0'+speMM.text
   else xmes:=copy(speMM.text,1,2);

   xAno:=speAno.text;
   //** valida si la transferencia ya se efectuo anteriormente
   xWhere :=
   'CIAID='+quotedstr(dblcCia.Text)+' AND CNTANOMM='+quotedstr(speAno.text+xmes);//+' AND '
   xcantidad:=DMCNT.DisplayDescrip('PrvTGE', xCNT301,'COUNT(*) AS CANTIDAD',xWhere,'CANTIDAD');
   Screen.Cursor:=crDefault;

   if strtoint(xcantidad)>0 then
   begin
      if MessageDlg('La Transferencia ya fue efectuada. ¿ Desea Continuar ?',
         mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      begin
         Z2bbtnContab.enabled:=True;
         bbtnCanc.enabled:=True;
         Screen.Cursor:=crDefault;
         exit;
      end
   end;

   Screen.Cursor:=crHourGlass;

   if rgElimina.ItemIndex=0 then begin

      xSQL:='DELETE FROM '+xCNT300+' WHERE CIAID='+QuotedStr(dblcCia.Text)+'AND CNTANOMM='+QuotedStr(speAno.text+xmes);
      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      try
        DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
        DMCNT.DCOM1.AppServer.GrabaTransaccion;
      except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
      end;

      xSQL:='DELETE FROM '+xCNT301+' WHERE CIAID='+QuotedStr(dblcCia.Text)+'AND CNTANOMM='+QuotedStr(speAno.text+xmes);
      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      try
        DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
        DMCNT.DCOM1.AppServer.GrabaTransaccion;
      except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
      end;

   end;

   case rgTipDia.ItemIndex of
    0 : xRGCount := DMCNT.cdsTDiario.RecordCount;
    1 : xRGCount := 1;
   end;

  if (rgElimina.ItemIndex=0) or (rgElimina.ItemIndex=1) then begin
   For xZ := 1 to xRGCount do //ListBox1.Items.Count -1 do
   begin
      if rgTipDia.ItemIndex=0 then begin
         dblcTDiario.text:= DMCNT.cdsTDiario.fieldbyname('TDIARID').AsString;//ListBox1.Items.Strings[xZ];
         edtTDiario.text := DMCNT.cdsTDiario.fieldbyname('TDIARDES').AsString;
      end;
       dblcTDiario.Refresh;
       edtTDiario.Refresh;
      // INICIA PROCESO DE TRANSFERENCIA
       // Ingresa movimiento contable
       if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
        begin
           xSQL1:=
             'Insert into '+xCNT301+' '
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
            +quotedstr('A')+', '+quotedstr('S')+', '+quotedstr(' ')+', '+quotedstr(DMCNT.wUsuario)+', '
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
               'Insert into '+xCNT301+' '
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
              //CLASE DE AUXILIAR
              //+'DECODE(NVL(A.RELACION,''NULO''),''NULO'',NULL,E.CLAUXID), '
              +'SUBSTR(A.RELACION,1,1), '
              // AUXILIAR
              +'A.RELACION, '
              // Tipo de Documento (Clase de Auxiliar)
              +'DECODE( A.DOCUMENTO, NULL, NULL, '+quotedstr('23')+' ),'
              // Número de Serie
              +quotedstr('000')+', '
              // NÚMERO DOCUMENTO
              +'A.DOCUMENTO, '
              // GLOSA
              +'SUBSTR(A.COMENTARIO,1,40), '
//              +'DECODE(A.DEBE,0,''H'',''D''),'  //FALTA
              +'DECODE(NVL(A.DEBE,0), 0, ''H'', ''D'') DH, '
              +'A.CCOS_CODI, '
              //*** Tipo cambio
              +'DECODE(NVL(A.CNTTCAMBIO,0),0,'+wTCambio+',A.CNTTCAMBIO), '
              //** monto original
//            +'DECODE(A.DEBE,0,HABER,DEBE),'
              +'DECODE(NVL(A.DEBE,0),0,HABER,DEBE) MTOORI, '
              //** Monto local
              //+'DECODE(A.DEBE,0,HABER,DEBE),'             // Monto soles
              +'DECODE(NVL(A.DEBE,0),0,HABER,DEBE) MTOLOC, '

              //** monto Extranjero
//            +'TRUNC(DECODE(A.DEBE,0,HABER/'+wTCambio+',DEBE/'+wTCambio+'),2),'
//              +'ROUND( DECODE(NVL(A.DEBE,0), 0, HABER/'+wTCambio+', DEBE/'+wTCambio+'),2 ) MTOEXT, '
              +'ROUND( DECODE(NVL(A.DEBE,0), 0, HABER/DECODE(NVL(A.CNTTCAMBIO,0),0,'+wTCambio+',A.CNTTCAMBIO), DEBE/'+wTCambio+'),2 ) MTOEXT, '
              +'DECODE(NVL(A.FECH_DOCU,''''),'''',TO_DATE('+''''+formatdatetime(wFormatFecha,dtpFCont.date)+''''+'),A.FECH_DOCU ), ' //FECHA DE EMISION
              +'TO_DATE(B.FECDIA||'+quotedstr('-')+'||B.FECMES||'+quotedstr('-')+'||B.FECANO), ' //FECHA DE VENCIMIENTO
              +'TO_DATE(B.FECDIA||'+quotedstr('-')+'||B.FECMES||'+quotedstr('-')+'||B.FECANO), '  //FECHA DE COMPROBANTE
              +'Decode( OK,''2'',''A'',''P''), DECODE( OK,''2'',''N'',''S''), '
              +quotedstr(' ')+', '+quotedstr(DMCNT.wUsuario)+', '
              +wRepFecServi+', '+wRepHorServi+', B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, '
              +'B.FECAATRI, B.FECAASEM, B.FECAASS, '
              //+'DECODE(A.MONEDA,''D'', ''D'',''N''),' // Tipo de Moneda
              //+'DECODE(A.MONEDA,''D'', ''D'',''N'') TM, '
              +'A.MONEDA, '

              +quotedstr('X')+', '+quotedstr(' ')+', '+quotedstr(' ')+', '
              +'SUBSTR(C.TDIARDES,1,20), SUBSTR(D.CTADES,1,15), SUBSTR(E.CLAUXDES,1,15), '
              +quotedstr(' ')+', '+quotedstr(' ')+', '

              //+'A.DEBE, '  //CNTDEBEMN
              +'nvl(A.DEBE,0 ) DEBEMN, '
              //+'A.DEBE_DOL, '
              +'ROUND(DECODE( nvl(A.DEBE_DOL,0), 0, DECODE( NVL(A.DEBE,0),0, 0, A.DEBE/DECODE(NVL(A.CNTTCAMBIO,0),0,'+wTCambio+',A.CNTTCAMBIO)'
              +' ), nvl(A.DEBE_DOL,0) ),2) DEBEME, '
              //+'A.HABER, '
              +'nvl(A.HABER,0) HABEMN, '
              //+'A.HABER_DOL,'
              +'ROUND(DECODE( nvl(A.HABER_DOL,0), 0, DECODE( NVL(A.HABER,0),0,0, A.HABER/DECODE(NVL(A.CNTTCAMBIO,0),0,'+wTCambio+',A.CNTTCAMBIO)'
              +' ), NVL(A.HABER_DOL,0) ),2) HABEME, '

              +'0, 0, '+quotedstr(' ')+', '+quotedstr(' ')+', '+quotedstr(' ')+', '+quotedstr('ORACLE')+', TO_NUMBER( A.ELEMENTO ), '
              +QuotedStr('DERRAMA')+' ';
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
           'FROM DETCORR A, TGE114 B, TGE104 C, TGE202 D, TGE102 E, CNT405 F '
                 +' WHERE (B.FECHA(+)=TO_DATE('+''''+formatdatetime(wFormatFecha,dtpFCont.date)+''''+'))' //wFormatFecha A.FECH_DOCU(+)) '
                 +' AND (C.TDIARID(+)='+quotedstr(dblcTDiario.Text)+') '
                 +' AND (D.CIAID(+)='+quotedstr(dblcCia.Text)+' AND D.CUENTAID(+)=A.CUENTA) '
                 +' AND (E.CLAUXID(+)= DECODE(SUBSTR(A.RELACION,1,1),''9'',''Z'',SUBSTR(A.RELACION,1,1))) '
                 +' AND (F.CLAUIDOR(+)=A.RELACION) '
                 +' AND (A.NUMCIA='+quotedstr(dblcCia.Text)+' AND A.ANO='+QuotedStr(xano)+' '
                 +' AND A.MES='+QuotedStr(xmes)+' AND A.ORIGEN='+quotedstr(dblcTDiario.text)+')';
//               +'SUBSTR(CCNTA,1,1)<>''9'' AND SUBSTR(CCNTA,1,3)<>''797'' ';
         end;
       xSQL:=xSQL1+xSQL2;
       DMCNT.DCOM1.AppServer.IniciaTransaccion;
       try
        DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
        DMCNT.DCOM1.AppServer.GrabaTransaccion;
       except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
       end;


       GeneraContabilidad(dblccia.text,dblcTDiario.text,speano.text+xmes,FTransferenciaDema,Sender);

       xSQL:='UPDATE '+xCNT301+' SET FLAGVAR=NULL ';
       xSQL:=xSQL+ 'WHERE CIAID='     +''''+dblcCia.Text    +''' AND ';
       xSQL:=xSQL+       'TDIARID='   +''''+dblcTDiario.Text+''' AND ';
       xSQL:=xSQL+       'CNTANOMM='  +''''+speAno.text+xmes+''' AND ';
       xSQL:=xSQL+       'FLAGVAR=''X'' ';

       try
         DMCNT.DCOM1.AppServer.IniciaTransaccion;
         DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         DMCNT.DCOM1.AppServer.GrabaTransaccion;
       except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
       end;

       DMCNT.cdsTDiario.Next;

    end;

  end;

{   if rgTipDia.ItemIndex=0 then begin
       dblcTDiario.text:= '';
       edtTDiario.text := '';
    end;
}

    //JOSE: MAYORIZACION

    if rgMayoriza.ItemIndex=1 then
    begin

       xSQL:='UPDATE CNT401 '+
             'SET DEBEMN'+xmes+'=0, '+
             '    HABEMN'+xmes+'=0, '+
             '    DEBEME'+xmes+'=0, '+
             '    HABEME'+xmes+'=0, '+
             '    SALDMN'+xmes+'=0, '+
             '    SALDME'+xmes+'=0 '+
             '    WHERE CIAID='+QuotedStr(dblcCia.Text)+' AND ANO='+quotedstr(speAno.text);
       DMCNT.DCOM1.AppServer.IniciaTransaccion;
       try
         DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         DMCNT.DCOM1.AppServer.GrabaTransaccion;
       except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
       end;

       if SOLConta(dblcCia.Text, '', speano.text+xmes, '',
          SRV_D, 'M', DMCNT.wModulo, DMCNT.cdsMovCNT1, DMCNT.cdsNivel,
          DMCNT.cdsResultSet, DMCNT.DCOM1, Self ) then
       begin
          ShowMessage( 'Ok Mayorización' );
       end;
   end;

   Screen.Cursor:=crDefault;
   ShowMessage('Grabación Exitosa');
   Close;
end;

procedure TFTransferenciaDema.speAnoExit(Sender: TObject);
begin
	 speMM.setfocus;
end;

procedure TFTransferenciaDema.speMMExit(Sender: TObject);
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

procedure TFTransferenciaDema.dblcTDiarioExit(Sender: TObject);
begin
   edtTDiario.Text:='';
   if dblcTDiario.Text<>'' then
      edtTDiario.Text:=DMCNT.cdsTDiario.FieldByName('TDIARDES').AsString;
   if length(edtTDiario.Text)=0 then
   begin
      ShowMessage('Falta Definición de Tipo de Diario') ;
      dblcTDiario.SetFocus ;
      exit;
   end ;
   dtpFCont.setfocus;
end;

procedure TFTransferenciaDema.dtpFContExit(Sender: TObject);
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
   xfecha:=DMCNT.DisplayDescrip('PrvTGE','TGE107','*',xWhere,'FECHA');
   if length(xfecha)=0 then
   begin
      ShowMessage('Fecha contable no esta registrada en Tipo de Cambio');
      dtpFCont.SetFocus ;
      exit;
   end;

	 RadioGroup1.setfocus;
end;

procedure TFTransferenciaDema.RadioGroup1Exit(Sender: TObject);
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

   wtcambio:=DMCNT.cdsQry.fieldbyname(wcampo).AsString;
   if length(wtcambio)=0 then
   begin
      ShowMessage('Tipo de cambio no registrado en la fecha dada') ;
      RadioGroup1.SetFocus ;
      exit;
   end;

	 Z2bbtnContab.setfocus;
end;

procedure TFTransferenciaDema.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFTransferenciaDema.bbtnCancClick(Sender: TObject);
begin
	 Iniciadatos;
end;

/////////////////////////////////////////////
///                                       ///
///    PROCEDIMIENTOS PARA CONTABILIDAD   ///
///                                       ///
/////////////////////////////////////////////

//procedure TFTransferencia.GeneraContabilidad( xxCia, xxTDiario, xxAnoMM: String; xForma: TForm );
procedure TFTransferenciaDema.GeneraContabilidad( xxCia, xxTDiario, xxAnoMM: String; xForma: TForm; Sender: TObject);
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
   wTIPOREG2:='RRN( '+xCNT301+' ) ';
   CreaPanel( xForma, 'Contabilizando' );

   if Contabiliza(xxCia, xxTDiario, xxAnoMM ) then
   begin
      //**30/10/2001 - pjsv solo si viene del boton de contabilización en bloque
{      If xNombreBoton = 'sbtCBl' then
         FTransferencia.GeneraEnLinea401(xxCia, xxTDiario, xxAnoMM);
}
      PanelMsg( 'Asiento Contabilizando Final',0 );
   end;
   //**
   pnlConta.Free;
end;

function TFTransferenciaDema.Contabiliza( xCia, xTDiario, xAnoMM  : String ): Boolean;
Var
   xSQL : String;
begin
  //** 30/10/2001 - pjsv solo si viene de contabilizacion en bloque
  If xNombreBoton = 'sbtCBl' then
   begin
    PanelMsg( 'Generando Asientos Automaticos',0 );
    if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
     begin
      xSQL:='INSERT INTO '+xCNT301+' (';
      xSQL:= xSql + 'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
          +'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
          +'CNTDH, CCOSID, '
          +'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
          +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
          +'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
          +'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
          +'CNTDEBEMN, CNTDEBEME, '
          +'CNTHABEMN, CNTHABEME) ';
          xSQL:= xSql +'SELECT '+xCNT301+'.CIAID, '+xCNT301+'.TDIARID, '+xCNT301+'.CNTCOMPROB, '+xCNT301+'.CNTANO, '+xCNT301+'.CNTANOMM, '+xCNT301+'.CNTLOTE, B.CTAAUT1,'
          +'CASE WHEN '+xCNT301+'.CLAUXID = '''' THEN NULL ELSE '+xCNT301+'.CLAUXID END CLAUXID,'
          +'CASE WHEN '+xCNT301+'.AUXID = '''' THEN NULL ELSE '+xCNT301+'.AUXID END AUXID,'
          +''+xCNT301+'.CNTMODDOC, '+xCNT301+'.DOCID, '+xCNT301+'.CNTSERIE, '+xCNT301+'.CNTNODOC, '+xCNT301+'.CNTGLOSA,'
          +''+xCNT301+'.CNTDH , '
          +'CASE WHEN B.CTA_CCOS=''S'' THEN CASE WHEN '+xCNT301+'.CCOSID= '''' THEN NULL ELSE '+xCNT301+'.CCOSID END ELSE NULL END CCOSID, '
          +''+xCNT301+'.CNTTCAMBIO, '+xCNT301+'.CNTMTOORI, '+xCNT301+'.CNTMTOLOC, '+xCNT301+'.CNTMTOEXT, '+xCNT301+'.CNTFEMIS, '+xCNT301+'.CNTFVCMTO, '
          +''+xCNT301+'.CNTFCOMP, '+xCNT301+'.CNTESTADO, ''S'', ''S'', '
          +''''+DMCNT.wUsuario+''''+', DATE('+''''+ FORMATDATETIME(wFormatFecha,Date )+''''+'),'+wRepHorServi+', '
          +''+xCNT301+'.CNTMM, '+xCNT301+'.CNTDD, '+xCNT301+'.CNTTRI, '+xCNT301+'.CNTSEM, '+xCNT301+'.CNTSS, '+xCNT301+'.CNTAATRI, '+xCNT301+'.CNTAASEM, '
          +''+xCNT301+'.CNTAASS, '+xCNT301+'.TMONID, B.CTAABR, '+xCNT301+'.TDIARDES, '+xCNT301+'.AUXDES, '+xCNT301+'.DOCDES, C.CCOSABR, '
          +'CASE WHEN '+xCNT301+'.CNTDH=''D'' THEN '+xCNT301+'.CNTMTOLOC ELSE 0 END, '
          +'CASE WHEN '+xCNT301+'.CNTDH=''D'' THEN '+xCNT301+'.CNTMTOEXT ELSE 0 END, '
          +'CASE WHEN '+xCNT301+'.CNTDH=''H'' THEN '+xCNT301+'.CNTMTOLOC ELSE 0 END, '
          +'CASE WHEN '+xCNT301+'.CNTDH=''H'' THEN '+xCNT301+'.CNTMTOEXT ELSE 0 END'
  //        + wTIPOREG2
          +' FROM '+xCNT301+' '
          +' LEFT  JOIN TGE203 C ON ( '+xCNT301+'.CCOSID=C.CCOSID ), '
          +' TGE202 B ' //, TGE202 D '
          +' WHERE  '+xCNT301+'.CIAID     ='+''''+ xCia    +''''+' AND ';
       if xTDiario<>'' then
          xSQL:= xSql +' '+xCNT301+'.TDIARID   ='+''''+ xTDiario+''''+' AND ';

       xSQL:=xSql+' '+xCNT301+'.CNTANOMM  ='+''''+ xAnoMM  +''''+' AND '
          +' '+xCNT301+'.CNTESTADO =''P'' AND COALESCE('+xCNT301+'.CNTCUADRE,'''')<>''S'' AND '
          +' ( '+xCNT301+'.CIAID=B.CIAID AND '+xCNT301+'.CUENTAID=B.CUENTAID AND B.CTAAUT1 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT1))>0 ) ';
     end
    else
     if SRV_D = 'ORACLE' then
       begin
        xSQL:='INSERT INTO '+xCNT301+' ('
            + 'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
            +'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
            +'CNTDH, CCOSID, '
            +'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
            +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
            +'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
            +'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
            +'CNTDEBEMN, CNTDEBEME, '
            +'CNTHABEMN, CNTHABEME )' //, CNTREG ) '
            +'SELECT '+xCNT301+'.CIAID, '+xCNT301+'.TDIARID, '+xCNT301+'.CNTCOMPROB, '+xCNT301+'.CNTANO, '+xCNT301+'.CNTANOMM, '+xCNT301+'.CNTLOTE, B.CTAAUT1,'
            +'DECODE('+xCNT301+'.CLAUXID,NULL,NULL,'+xCNT301+'.CLAUXID) CLAUXID,'
            +'DECODE('+xCNT301+'.AUXID,NULL,NULL,'+xCNT301+'.AUXID) AUXID,'
            +''+xCNT301+'.CNTMODDOC, '+xCNT301+'.DOCID, '+xCNT301+'.CNTSERIE, '+xCNT301+'.CNTNODOC, '+xCNT301+'.CNTGLOSA,'
            +''+xCNT301+'.CNTDH , '
            +'DECODE(B.CTA_CCOS,''S'', DECODE('+xCNT301+'.CCOSID,'''', NULL,'+xCNT301+'.CCOSID), NULL) CCOSID, '
            +''+xCNT301+'.CNTTCAMBIO, '+xCNT301+'.CNTMTOORI, '+xCNT301+'.CNTMTOLOC, '+xCNT301+'.CNTMTOEXT, '+xCNT301+'.CNTFEMIS, '+xCNT301+'.CNTFVCMTO, '
            +''+xCNT301+'.CNTFCOMP, '+xCNT301+'.CNTESTADO, ''S'', ''S'', '
            +''''+DMCNT.wUsuario+''''+', TO_DATE('+''''+ FORMATDATETIME(wFormatFecha,Date )+''''+'),'+wRepHorServi+', '
            +''+xCNT301+'.CNTMM, '+xCNT301+'.CNTDD, '+xCNT301+'.CNTTRI, '+xCNT301+'.CNTSEM, '+xCNT301+'.CNTSS, '+xCNT301+'.CNTAATRI, '+xCNT301+'.CNTAASEM, '
            +''+xCNT301+'.CNTAASS, '+xCNT301+'.TMONID, B.CTAABR, '+xCNT301+'.TDIARDES, '+xCNT301+'.AUXDES, '+xCNT301+'.DOCDES, C.CCOSABR, '

            +'DECODE('+xCNT301+'.CNTDH, ''D'', '+xCNT301+'.CNTMTOLOC, 0), '
            +'DECODE('+xCNT301+'.CNTDH, ''D'', '+xCNT301+'.CNTMTOEXT, 0), '
            +'DECODE('+xCNT301+'.CNTDH, ''H'', '+xCNT301+'.CNTMTOLOC, 0), '
            +'DECODE('+xCNT301+'.CNTDH, ''H'', '+xCNT301+'.CNTMTOEXT, 0) '
            +' FROM '+xCNT301+', TGE203 C, '
            +'TGE202 B '//, TGE202 D '
            +'WHERE  '+xCNT301+'.CIAID     ='+''''+ xCia    +''''+' AND ';
       if xTDiario<>'' then
          xSQL:= xSql +' '+xCNT301+'.TDIARID   ='+''''+ xTDiario+''''+' AND ';

       xSQL:=xSql+''+xCNT301+'.CNTANOMM  ='+''''+ xAnoMM  +''''+' AND '
            +' '+xCNT301+'.CCOSID   =C.CCOSID AND '
            +' '+xCNT301+'.CNTESTADO=''P'' AND NVL('+xCNT301+'.CNTCUADRE,''N'')<>''S'' AND '
            +' ('+xCNT301+'.CIAID=B.CIAID AND '+xCNT301+'.CUENTAID=B.CUENTAID AND B.CTAAUT1(+) IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT1))>0 ) ';
       end;
     try
       DMCNT.DCOM1.AppServer.IniciaTransaccion;
       DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
       DMCNT.DCOM1.AppServer.GrabaTransaccion;
     except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
     end ;
     // 4
     PanelMsg( 'Generando Asientos Automaticos',0 );

    if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
       xSQL:='INSERT INTO '+xCNT301+' (';
       xSQL:= xSql +'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
          +'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
          +'CNTDH, CCOSID, '
          +'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
          +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
          +'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
          +'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
          +'CNTDEBEMN, CNTDEBEME, '
          +'CNTHABEMN, CNTHABEME )';
          xSql := xSql +'SELECT '+xCNT301+'.CIAID, '+xCNT301+'.TDIARID, '+xCNT301+'.CNTCOMPROB, '+xCNT301+'.CNTANO, '+xCNT301+'.CNTANOMM, '+xCNT301+'.CNTLOTE, B.CTAAUT2,'
          +'CASE WHEN '+xCNT301+'.CLAUXID = '''' THEN NULL ELSE '+xCNT301+'.CLAUXID END CLAUXID,'
          +'CASE WHEN '+xCNT301+'.AUXID = '''' THEN NULL ELSE '+xCNT301+'.AUXID END AUXID,'
          +''+xCNT301+'.CNTMODDOC, '+xCNT301+'.DOCID, '+xCNT301+'.CNTSERIE, '+xCNT301+'.CNTNODOC,'+xCNT301+'.CNTGLOSA, '
          +'CASE WHEN '+xCNT301+'.CNTDH=''D'' THEN ''H'' ELSE ''D'' END AS DH, '
          +'CASE WHEN B.CTA_CCOS=''S'' THEN CASE WHEN '+xCNT301+'.CCOSID= '''' THEN NULL ELSE '+xCNT301+'.CCOSID END ELSE NULL END CCOSID, '
          +''+xCNT301+'.CNTTCAMBIO, '+xCNT301+'.CNTMTOORI, '+xCNT301+'.CNTMTOLOC, '+xCNT301+'.CNTMTOEXT, '+xCNT301+'.CNTFEMIS, '+xCNT301+'.CNTFVCMTO, '
          +''+xCNT301+'.CNTFCOMP, '+xCNT301+'.CNTESTADO, ''S'', ''S'', '
          +''''+DMCNT.wUsuario+''''+', DATE('+''''+ FORMATDATETIME(wFormatFecha,Date )+''''+'),'+wRepHorServi+', '
          +''+xCNT301+'.CNTMM, '+xCNT301+'.CNTDD, '+xCNT301+'.CNTTRI, '+xCNT301+'.CNTSEM, '+xCNT301+'.CNTSS, '+xCNT301+'.CNTAATRI, '+xCNT301+'.CNTAASEM, '
          +''+xCNT301+'.CNTAASS, '+xCNT301+'.TMONID, B.CTAABR, '+xCNT301+'.TDIARDES, '+xCNT301+'.AUXDES, '+xCNT301+'.DOCDES, C.CCOSABR,'
          +'CASE WHEN '+xCNT301+'.CNTDH=''H'' THEN '+xCNT301+'.CNTMTOLOC ELSE 0 END, '
          +'CASE WHEN '+xCNT301+'.CNTDH=''H'' THEN '+xCNT301+'.CNTMTOEXT ELSE 0 END, '
          +'CASE WHEN '+xCNT301+'.CNTDH=''D'' THEN '+xCNT301+'.CNTMTOLOC ELSE 0 END, '
          +'CASE WHEN '+xCNT301+'.CNTDH=''D'' THEN '+xCNT301+'.CNTMTOEXT ELSE 0 END '
  //        + wTIPOREG2
          +' FROM '+xCNT301+' '
          +' LEFT  JOIN TGE203 C ON ( '+xCNT301+'.CCOSID=C.CCOSID ), '
          +' TGE202 B, TGE202 D '
          +' WHERE  '+xCNT301+'.CIAID     ='+''''+ xCia    +''''+' AND ';
       if xTDiario<>'' then
          xSQL:= xSql +' '+xCNT301+'.TDIARID   ='+''''+ xTDiario+''''+' AND ';

       xSQL:=xSql+' '+xCNT301+'.CNTANOMM  ='+''''+ xAnoMM  +''''+' AND '
          +' '+xCNT301+'.CNTESTADO =''P'' AND COALESCE('+xCNT301+'.CNTCUADRE,'''')<>''S'' AND '
          +' ( '+xCNT301+'.CIAID=B.CIAID AND '+xCNT301+'.CUENTAID=B.CUENTAID AND B.CTAAUT2 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT2))>0 ) ';
      end
    else
     if SRV_D = 'ORACLE' then
      begin
        xSQL:='INSERT INTO '+xCNT301+' ('
          + 'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
          +'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
          +'CNTDH, CCOSID, '
          +'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
          +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
          +'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
          +'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
          +'CNTDEBEMN, CNTDEBEME, '
          +'CNTHABEMN, CNTHABEME) ';
          xSql := xSql +'SELECT '+xCNT301+'.CIAID, '+xCNT301+'.TDIARID, '+xCNT301+'.CNTCOMPROB, '+xCNT301+'.CNTANO, '+xCNT301+'.CNTANOMM, '+xCNT301+'.CNTLOTE, B.CTAAUT2, '
          +'DECODE('+xCNT301+'.CLAUXID,'''', NULL, '+xCNT301+'.CLAUXID) CLAUXID, '
          +'DECODE('+xCNT301+'.AUXID,'''', NULL,'+xCNT301+'.AUXID) AUXID, '
          +''+xCNT301+'.CNTMODDOC, '+xCNT301+'.DOCID, '+xCNT301+'.CNTSERIE, '+xCNT301+'.CNTNODOC,'+xCNT301+'.CNTGLOSA, '
          +'DECODE('+xCNT301+'.CNTDH, ''D'', ''H'', ''D'') AS DH, '
          +'DECODE(B.CTA_CCOS, ''S'', DECODE('+xCNT301+'.CCOSID,'''',NULL,'+xCNT301+'.CCOSID), NULL) AS CCOSID, '
          +''+xCNT301+'.CNTTCAMBIO, '+xCNT301+'.CNTMTOORI, '+xCNT301+'.CNTMTOLOC, '+xCNT301+'.CNTMTOEXT, '+xCNT301+'.CNTFEMIS, '+xCNT301+'.CNTFVCMTO, '
          +''+xCNT301+'.CNTFCOMP, '+xCNT301+'.CNTESTADO, ''S'', ''S'', '
          +''''+DMCNT.wUsuario+''''+', TO_DATE('+''''+ FORMATDATETIME(wFormatFecha,Date )+''''+'), SYSDATE, '
          +''+xCNT301+'.CNTMM, '+xCNT301+'.CNTDD, '+xCNT301+'.CNTTRI, '+xCNT301+'.CNTSEM, '+xCNT301+'.CNTSS, '+xCNT301+'.CNTAATRI, '+xCNT301+'.CNTAASEM, '
          +''+xCNT301+'.CNTAASS, '+xCNT301+'.TMONID, B.CTAABR, '+xCNT301+'.TDIARDES, '+xCNT301+'.AUXDES, '+xCNT301+'.DOCDES, C.CCOSABR, '

          +'DECODE('+xCNT301+'.CNTDH, ''H'', '+xCNT301+'.CNTMTOLOC, 0), '
          +'DECODE('+xCNT301+'.CNTDH, ''H'', '+xCNT301+'.CNTMTOEXT, 0), '
          +'DECODE('+xCNT301+'.CNTDH, ''D'', '+xCNT301+'.CNTMTOLOC, 0), '
          +'DECODE('+xCNT301+'.CNTDH, ''D'', '+xCNT301+'.CNTMTOEXT, 0)'
          +' FROM '+xCNT301+', TGE203 C, TGE202 B' //, TGE202 D '
          +' WHERE  '+xCNT301+'.CIAID ='+''''+ xCia    +''''+' AND ';
       if xTDiario<>'' then
          xSQL:= xSql +' '+xCNT301+'.TDIARID   ='+''''+ xTDiario+''''+' AND ';

       xSQL:=xSql+''+xCNT301+'.CNTANOMM  ='+''''+ xAnoMM  +''''+' AND '
          +' '+xCNT301+'.CCOSID=C.CCOSID AND '
          +' '+xCNT301+'.CNTESTADO=''P'' AND NVL('+xCNT301+'.CNTCUADRE,''N'')<>''S'' AND '
          +' ( '+xCNT301+'.CIAID=B.CIAID AND '+xCNT301+'.CUENTAID=B.CUENTAID AND B.CTAAUT2 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT2))>0 ) ';
      end;
     try
       DMCNT.DCOM1.AppServer.IniciaTransaccion;
       DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
       DMCNT.DCOM1.AppServer.GrabaTransaccion;
     except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
     end ;

     if SRV_D = 'ORACLE' then
      begin
        xSQL:='UPDATE '+xCNT301+' SET CNTCUADRE=''S'' '
             +' WHERE  '+xCNT301+'.CIAID ='+''''+ xCia    +''''+' AND ';
        if xTDiario<>'' then
           xSQL:=xSql+' '+xCNT301+'.TDIARID='+''''+xTDiario+''''+' AND ';

       xSQL:=xSql+''+xCNT301+'.CNTANOMM  ='+''''+ xAnoMM  +''''+' AND '
            +' '+xCNT301+'.CNTESTADO=''P'' AND NVL('+xCNT301+'.CNTCUADRE,''N'')<>''S'' ';
     end;

     try
       DMCNT.DCOM1.AppServer.IniciaTransaccion;
       DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
       DMCNT.DCOM1.AppServer.GrabaTransaccion;
     except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
     end ;

   end;


  If xNombreBoton = 'Z2bbtnContab' then //** solo si viene de la transferencia
   begin
     // Genera Cabecera de Contabilidad
    if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
    begin
     xSQL:='INSERT INTO '+xCNT300+' ';
     xSQL:=xSQL+ '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, ';
     xSQL:=xSQL+ 'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, ';
     xSQL:=xSQL+ 'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, ';
     xSQL:=xSQL+ 'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, ';
     xSQL:=xSQL+ 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, ';
     xSQL:=xSQL+ 'CNTTS,DOCMOD ) ' ;

     xSQL:=xSQL+ 'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE, ';
//     xSQL:=xSQL+ '''M:'''+'||A.CNTMODDOC||'+''' D:'''+'||A.TDIARID||'+''' P:'''+'||A.CNTANOMM||'+''' C:'''+'||A.CNTCOMPROB, ';
     xSQL:=xSQL+ 'DECODE( MIN(A.CNTREG), 1, MAX( A.CNTGLOSA ), ''COMPROBANTE DE ''||MODULO ), ';
     xSQL:=xSQL+ 'SUM( CASE WHEN A.FLAGVAR=''T'' THEN A.CNTTCAMBIO ELSE 0 END ), ';
     xSQL:=xSQL+ 'A.CNTFCOMP, MAX( CNTESTADO ), MAX( CNTCUADRE ), ';
     xSQL:=xSQL+ ''''+DMCNT.wUsuario+''''+', '+wRepFecServi+', '+wRepFecServi+', A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
     xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, '+quotedstr('01')+', '' '', ';
     xSQL:=xSQL+ 'A.TDIARDES, ';
     xSQL:=xSQL+ 'SUM('+wReplacCeros+'(A.CNTDEBEMN,0)), SUM('+wReplacCeros+'(A.CNTDEBEME,0)), SUM('+wReplacCeros+'(A.CNTHABEMN,0)), SUM('+wReplacCeros+'(A.CNTHABEME,0)), ';
     xSQL:=xSQL+ ''''+Copy( wcampo,6,2 )+''''+',''AS/400'' ';

     xSQL:=xSQL+ 'FROM '+xCNT301+' A ';
     xSQL:=xSQL+ 'WHERE A.CIAID='     +''''+xCia    +''''+' AND ';

     if xTDiario<>'' then
        xSQL:=xSQL+    'A.TDIARID='   +''''+xTDiario+''''+' AND ';

     xSQL:=xSQL+       'A.CNTANOMM='  +''''+xAnoMM  +'''';
     xSQL:=xSQL+       'A.CNTESTADO =''P'' AND COALESCE(A.CNTCUADRE,'''')=''S'' and FLAGVAR=''X'' ';
     xSQL:=xSQL+ ' GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, ';
     xSQL:=xSQL+ 'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
     xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
     xSQL:=xSQL+ 'A.TDIARDES, A.CNTMODDOC';
    end
    else
     if SRV_D = 'ORACLE' then
      begin
       xSQL:='INSERT INTO '+xCNT300+' ';
       xSQL:=xSQL+ '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, ';
       xSQL:=xSQL+ 'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, ';
       xSQL:=xSQL+ 'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, ';
       xSQL:=xSQL+ 'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, ';
       xSQL:=xSQL+ 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, ';
       xSQL:=xSQL+ 'CNTTS,DOCMOD ) ' ;

       xSQL:=xSQL+ 'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE, ';
//       xSQL:=xSQL+ '''M:'''+'||A.CNTMODDOC||'+''' D:'''+'||A.TDIARID||'+''' P:'''+'||A.CNTANOMM||'+''' C:'''+'||A.CNTCOMPROB, ';
       xSQL:=xSQL+ 'DECODE( MIN(A.CNTREG), 1, MAX( A.CNTGLOSA ), ''COMPROBANTE DE ''||MAX(MODULO) ), ';
       xSQL:=xSQL+ 'MAX( NVL( A.CNTTCAMBIO, 0 ) ), ';
       xSQL:=xSQL+ 'A.CNTFCOMP, MAX( CNTESTADO ), MAX( CNTCUADRE ), ';
       xSQL:=xSQL+ ''''+DMCNT.wUsuario+''''+', '+wRepFecServi+', '+wRepFecServi+', A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
       xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, MAX(A.TMONID)'+', '' '', ';
       xSQL:=xSQL+ 'A.TDIARDES, ';
       xSQL:=xSQL+ 'SUM('+wReplacCeros+'(A.CNTDEBEMN,0)), SUM('+wReplacCeros+'(A.CNTDEBEME,0)), SUM('+wReplacCeros+'(A.CNTHABEMN,0)), SUM('+wReplacCeros+'(A.CNTHABEME,0)), ';
       xSQL:=xSQL+ ''''+Copy( wcampo,6,2 )+''''+',''ORACLE'' ';
       xSQL:=xSQL+ 'FROM '+xCNT301+' A ';
       xSQL:=xSQL+ 'WHERE A.CIAID='     +''''+xCia    +''''+' AND ';
       if xTDiario<>'' then
          xSQL:=xSQL+    'A.TDIARID='   +''''+xTDiario+''''+' AND ';
       xSQL:=xSQL+       'A.CNTANOMM='  +''''+xAnoMM  +''''+' AND ';
//       xSQL:=xSQL+       'A.CNTESTADO=''P'' AND NVL( A.CNTCUADRE,''N'')=''S'' and A.FLAGVAR=''X'' ';
       xSQL:=xSQL+       ' A.FLAGVAR=''X'' ';
       xSQL:=xSQL+ 'GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, ';
       xSQL:=xSQL+ 'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
       xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
       xSQL:=xSQL+ 'A.TDIARDES, A.CNTMODDOC ';
     end;
    try
      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      DMCNT.DCOM1.AppServer.GrabaTransaccion;
    except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
    end;

   end;

   GeneraCorrelativoCtasAutom( xCia, xTDiario, xAnoMM ) ;

   Result:=True;
end;

procedure TFTransferenciaDema.GeneraCorrelativoCtasAutom( xCia, xTDiario, xAnoMM : String) ;
var
   xSQL  : String;
   nNum  : Integer;
   xGraba: Boolean;
begin

   xSQL:='Select CIAID, TDIARID, CNTANOMM, CNTCOMPROB, MIN(NVL(CNTREG,0)), '
        +  'MAX(NVL(CNTREG,0)) NREG, COUNT(*) '
        +  'From '+xCNT301+' '
        +'WHERE CIAID='   +''''+xCia    +''''+' AND ';
   if xTDiario<>'' then
      xSQL:=xSQL+'TDIARID=' +''''+xTDiario+''''+' AND ';

   xSQL:=xSQL+'CNTANOMM='+''''+xAnoMM  +''' '
        +'GROUP BY CIAID, TDIARID, CNTANOMM, CNTCOMPROB '
        +'HAVING MIN(NVL(CNTREG,0))=0 '
        +'Order by CNTCOMPROB ';

   DMCNT.cdsQry3.Close;
   DMCNT.cdsQry3.DataRequest( xSQL );
   DMCNT.cdsQry3.Open;

   DMCNT.cdsQry3.First;
   while not DMCNT.cdsQry3.Eof do begin

      xSQL:='Select CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CUENTAID, CNTDH, DOCID, '
           +   'CLAUXID, AUXID, CNTMTOORI, CNTREG '
           +'From '+xCNT301+' '
           +'WHERE CIAID='''     +xCia      +''''+' AND '
           +      'TDIARID='''   +DMCNT.cdsQry3.FieldByName('TDIARID').AsString  +''''+' AND '
           +      'CNTANOMM='''  +xAnoMM    +''''+' AND '
           +      'CNTCOMPROB='''+DMCNT.cdsQry3.FieldByName('CNTCOMPROB').AsString+'''';

      DMCNT.cdsMovCNT2.Close;
      DMCNT.cdsMovCNT2.IndexFieldNames:='';
      DMCNT.cdsMovCNT2.DataRequest( xSQL );
      DMCNT.cdsMovCNT2.Open;

      xGraba:=False;
      DMCNT.cdsMovCnt2.First;
      while not DMCNT.cdsMovCnt2.EOF do begin
         if DMCNT.cdsMovCnt2.FieldByName('CNTREG').AsInteger=0 then begin
            xGraba:=True;
            DMCNT.cdsMovCnt2.Edit;
            DMCNT.cdsMovCnt2.FieldByName('CNTREG').AsInteger:=9999;
         end;
         DMCNT.cdsMovCnt2.Next;
      end;

      if xGraba then begin
        DMCNT.cdsMovCNT2.IndexFieldNames:='CNTCOMPROB;CNTREG;CNTMTOORI;CNTDH';

        nNum:=DMCNT.cdsQry3.FieldByName('NREG').AsInteger;

        DMCNT.cdsMovCnt2.First;
        while not DMCNT.cdsMovCnt2.EOF do begin
           if DMCNT.cdsMovCnt2.FieldByName('CNTREG').AsInteger=9999 then begin
              nNum:=nNum+1;
              DMCNT.cdsMovCnt2.Edit;
              DMCNT.cdsMovCnt2.FieldByName('CNTREG').AsInteger:=nNum;
              cdsPost( DMCNT.cdsMovCnt2 );
           end;
           DMCNT.cdsMovCnt2.Next;
        end;
        DMCNT.cdsMovCnt2.ApplyUpdates(0);
        //DMCNT.ControlTran(0);
      end;

      DMCNT.cdsQry3.Next;
   end;

   DMCNT.cdsMovCNT2.IndexFieldNames:='';
end;

procedure TFTransferenciaDema.GeneraEnLinea401( xxxCia,xxxDiario,xxxAnoMM: String );
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
      xsql:='Insert into CNT401 '+
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
               xSql:=xSql+' WHERE CNT401.CUENTAID IS NULL AND TGE202.CIAID='+quotedstr(xxxCia)
            else
               xSql:=xSql+' WHERE CNT401.CUENTAID IS NULL AND TGE202.CIAID='+quotedstr(dblcCia.text);
   end
   else
   if SRV_D = 'ORACLE' then
   begin
      xsql:='Insert into CNT401 '+
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
  DMCNT.DCOM1.AppServer.IniciaTransaccion;
  try
   DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
   DMCNT.DCOM1.AppServer.GrabaTransaccion;
  except
  // Inicio HPC_201501_CNT
     //DMCNT.DCOM1.AppServer.RegresaTransaccion;
     DMCNT.DCOM1.AppServer.RetornaTransaccion;
  // Fin HPC_201501_CNT
  end;

   //**12/09/2001 - pjsv, actualizo todos los auxiliares y clase de auxiliares a null
   //** siempre y cuando esten en '', para que no me generen registro indebidos
   //** 30/10/2001 - pjsv
   if (SRV_D = 'DB2NT') or	 (SRV_D = 'DB2400') then
      xSql:='UPDATE '+xCNT301+' SET AUXID=NULL,CLAUXID=NULL WHERE AUXID=''''';
   if SRV_D = 'ORACLE' then
      xSql:='UPDATE '+xCNT301+' SET AUXID=NULL,CLAUXID=NULL WHERE AUXID is null ';

   If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
      xSql:=xSql + ' AND '+xCNT301+'.CIAID='+quotedstr(xxxCia)+' AND CNTANOMM='+quotedstr(xxxAnoMM)
   else
      xSql:=xSql + ' AND '+xCNT301+'.CIAID='+quotedstr(dblcCia.text)+' AND CNTANOMM='+quotedstr(xxxAnoMM);
    //**
   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
   end;

   //**actualizo todos los C. de Costo a null
   //** siempre y cuando esten en '', para que no me generen registro indebidos
   //** 30/10/2001 - pjsv
   if (SRV_D = 'DB2NT') or	 (SRV_D = 'DB2400') then
      xSql := 'UPDATE '+xCNT301+' SET CCOSID=NULL WHERE CCOSID=''''';
   if SRV_D = 'ORACLE' then
      xSql := 'UPDATE '+xCNT301+' SET CCOSID=NULL WHERE CCOSID is null';

   If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
      xSql := xSql + ' AND '+xCNT301+'.CIAID='+quotedstr(xxxCia)+' AND CNTANOMM='+quotedstr(xxxAnoMM)
   else
      xSql := xSql + ' AND '+xCNT301+'.CIAID='+quotedstr(dblcCia.text)+' AND CNTANOMM='+quotedstr(xxxAnoMM);
   //**
   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
   end;
   //**


//////////////////////// para Auxiliares /////////////////////////////
   //**12/09/2001 - pjsv, actualizo todos los auxiliares y clase de auxiliares a null
   //** siempre y cuando esten en '', para que no me generen registro indebidos
   if (SRV_D = 'DB2NT') or	 (SRV_D = 'DB2400') then
      xSql:= 'UPDATE CNT401 SET AUXID=NULL,CLAUXID=NULL WHERE AUXID=''''';
   if SRV_D = 'ORACLE' then
      xSql:= 'UPDATE CNT401 SET AUXID=NULL,CLAUXID=NULL WHERE AUXID is null';

   If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
      xSql:= xSql + ' AND CNT401.CIAID='+quotedstr(xxxCia)
   else
      xSql:= xSql + ' AND CNT401.CIAID='+quotedstr(dblcCia.text);

   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
   end;
   //**

   /////////////////////////////////////
   //  INSERTA EN EL CNT401
   /////////////////////////////////////


   xSql:='Insert into CNT401'+
          '(ciaid, cuentaid, auxid, clauxid, ano, ctades, Tipo, cta_mov, auxdes,'+
          'DEBEMN'+ xMes +','+'DEBEME'+ xMes +','+
          'HABEMN'+ xMes +','+'HABEME'+ xMes +') ';

   If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
      xSql:=xSql+'Select '+quotedstr(xxxCia)+', a.cuentaid, a.auxid, a.clauxid,'
   else
      xSql:=xSql+'Select '+quotedstr(dblcCia.text)+', a.cuentaid, a.auxid, a.clauxid, ';

   xSql:=xSql + quotedstr(xAno)+',max(a.ctades) ctades, max(c.ctaniv) ctaniv, '+
         ' max(c.cta_mov) cta_mov, max(a.auxdes) auxdes, '+
         'sum('+wReplacCeros+'(a.CNTDEBEMN'+',0)) DEBEMN'+ xMes+','+
         'sum('+wReplacCeros+'(a.CNTDEBEME'+',0)) DEBEME'+ xMes+','+
         'sum('+wReplacCeros+'(a.CNTHABEMN'+',0)) HABEMN'+ xMes+','+
         'sum('+wReplacCeros+'(a.CNTHABEME'+',0)) HABEME'+ xMes ;

   xSql:=xSql+' From '+xCNT301+' a, TGE202 c '+
              ' WHERE NVL(A.CNTESTADO,''X'')=''P'' AND NVL(A.CNTCUADRE,''X'')=''S'' AND '+ // VHN
                ' (a.CUENTAID = c.CUENTAID(+) and a.CIAID=c.CIAID(+) '+
                ' AND C.CTA_AUX=''S'')'+
                ' AND a.auxid is not null and a.CNTANOMM='+quotedstr(xxxAnoMM);
   If xNombreBoton='sbtCBl' then // solo si viene de contabilizacion en bloque
      xSql:=xSql+' AND a.CIAID='+quotedstr(xxxCia)
   else
      xSql:=xSql+' AND a.CIAID='+quotedstr(dblcCia.text);

   //** 2002/02/12 - PJSV SE AGREGO LA CUENTA A LA COMPARACION   
   xSql:=xSql+' AND NOT EXISTS(SELECT B.CUENTAID FROM CNT401 B '
             +                'WHERE B.CIAID=A.CIAID AND b.cuentaid = a.cuentaid AND B.CLAUXID=A.CLAUXID AND '
             +                      'B.AUXID=A.AUXID AND B.CLAUXID IS NOT NULL AND '
             +                      'B.AUXID IS NOT NULL ) '
             +'Group by a.cuentaid, a.clauxid, a.auxid';

   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
   end;


//** 25/10/2001 - pjsv esta parte es para actualizar los auxiliares, tienes que probarlo
//** para ORACLE

   xSQL:='SELECT '
        +'A.CIAID,A.CUENTAID,A.CLAUXID,A.AUXID,sum('+wReplacCeros
        +'(a.CNTDEBEMN'+',0)) DEBEMN'+ xMes+','
        +'sum('+wReplacCeros+'(a.CNTDEBEME'+',0)) DEBEME'+ xMes+','
        +'sum('+wReplacCeros+'(a.CNTHABEMN'+',0)) HABEMN'+ xMes+','
        +'sum('+wReplacCeros+'(a.CNTHABEME'+',0)) HABEME'+ xMes
        +' From '+xCNT301+' a, TGE202 c'
        +' WHERE NVL(A.CNTESTADO,''X'')=''P'' AND NVL(A.CNTCUADRE,''X'')=''S'' AND ' // VHN
        +  '(a.CUENTAID = c.CUENTAID(+) and a.CIAID=c.CIAID(+) AND C.CTA_AUX=''S'')'
        +  ' AND a.auxid is not null AND A.CLAUXID IS NOT NULL '
        +  ' and a.CNTANOMM='+quotedstr(xxxAnoMM);

   If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
      xSql := xSql + ' AND a.CIAID='+quotedstr(xxxCia)
   else
      xSql := xSql + ' AND a.CIAID='+quotedstr(dblcCia.text);

   xSql:=xSql+' AND EXISTS(SELECT B.CUENTAID FROM CNT401 B '
             +            'WHERE B.CIAID=A.CIAID AND B.CLAUXID=A.CLAUXID AND '
             +                  'B.AUXID=A.AUXID AND B.CLAUXID IS NOT NULL AND '
             +                  'B.AUXID IS NOT NULL) '
             +'Group by A.CIAID, a.cuentaid, a.clauxid, a.auxid ';

   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.ProviderName:= 'PrvTGE';
   DMCNT.cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
   DMCNT.cdsQry2.Open;
   DMCNT.cdsQry2.IndexFieldNames:='CIAID;CUENTAID;CLAUXID;AUXID';

   DMCNT.cdsQry2.First;
   while not DMCNT.cdsQry2.EOF do
   begin
      xSQL:='UPDATE CNT401 '+
           ' SET DEBEMN'+xMes+'='+DMCNT.cdsQry2.FieldByName('DEBEMN'+xMes).AsString+','+
           '     DEBEME'+xMes+'='+DMCNT.cdsQry2.FieldByName('DEBEME'+xMes).AsString+','+
           '     HABEMN'+xMes+'='+DMCNT.cdsQry2.FieldByName('HABEMN'+xMes).AsString+','+
           '     HABEME'+xMes+'='+DMCNT.cdsQry2.FieldByName('HABEME'+xMes).AsString+
           ' WHERE CIAID='+QuotedStr(DMCNT.cdsQry2.FieldByName('CIAID').AsString)+
           ' AND CUENTAID='+QuotedStr(DMCNT.cdsQry2.FieldByName('CUENTAID').AsString)+
           ' AND CLAUXID='+QuotedStr(DMCNT.cdsQry2.FieldByName('CLAUXID').AsString)+
           ' AND AUXID='+QuotedStr(DMCNT.cdsQry2.FieldByName('AUXID').AsString);

      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      try
         DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         DMCNT.DCOM1.AppServer.GrabaTransaccion;
      except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
      end;
      DMCNT.cdsQry2.Next;
   end;

   DMCNT.cdsQry2.IndexFieldNames:='';
//**

   xMesA := DMCNT.StrZero(IntToStr(StrToInt(xmes) -1),2);
   xSql:='UPDATE CNT401 SET '+
         'SALDMN'+ xMes +'= ('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
         wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),'+
         'SALDME'+ xMes +'= ('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
         wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0),';

   for xZ:=StrToInt( xMes )+1 to 13 do
   begin
      xMesT := DMCNT.StrZero( IntToStr(xZ),2);
      xSQL:= xSQL + 'SALDMN'+ xMesT +'=('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
            wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),';
   end;
   for xZ:=StrToInt( xMes )+1 to 13 do
   begin
       xMesT := DMCNT.StrZero( IntToStr(xZ),2);
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

   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
     DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
     DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
   end;

   ///////////////////// para C. Costos ///////////////////////////////////
   //**12/09/2001 - pjsv, actualizo todos los C. de Costo a null
   //** siempre y cuando esten en '', para que no me generen registro indebidos

   if (SRV_D = 'DB2NT') or	 (SRV_D = 'DB2400') then
      xSql := 'UPDATE CNT401 SET CCOSID=NULL WHERE CCOSID=''''';
   if SRV_D = 'ORACLE' then
      xSql := 'UPDATE CNT401 SET CCOSID=NULL WHERE CCOSID IS NULL';
   If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
      xSql:=xSql + ' AND CNT401.CIAID='+quotedstr(xxxCia)
   else
      xSql:=xSql + ' AND CNT401.CIAID='+quotedstr(dblcCia.text);


   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
   end;


   xSql:='Insert into cnt401 '+
         '(ciaid,cuentaid,auxid,clauxid,ano,ctades,tipo,cta_mov,auxdes,ccosid,ccodes,'+
         'DEBEMN'+ xMes+','+'DEBEME'+ xMes +','+
         'HABEMN'+ xMes +','+'HABEME'+ xMes +')';

   If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
      xSql := xSql + ' select '+quotedstr(xxxCia)+', a.cuentaid,max(a.auxid) auxid,max(a.clauxid) clauxid,'
   else
      xSql := xSql + ' select '+quotedstr(dblcCia.text)+', a.cuentaid,max(a.auxid) auxid,max(a.clauxid) clauxid,';

   xSql:=xSql+quotedstr(xAno)+', max(a.ctades) ctades, max(c.ctaniv) ctaniv,'+
         ' max(c.cta_mov) cta_mov, max(a.auxdes) auxdes, a.ccosid,max(a.ccosdes) ccosdes,'+
         'sum('+wReplacCeros+'(a.CNTDEBEMN'+',0)) DEBEMN'+ xMes+','+
         'sum('+wReplacCeros+'(a.CNTDEBEME'+',0)) DEBEME'+ xMes+','+
         'sum('+wReplacCeros+'(a.CNTHABEMN'+',0)) HABEMN'+ xMes+','+
         'sum('+wReplacCeros+'(a.CNTHABEME'+',0)) HABEME'+ xMes ;

   xSql:=xSql+' From '+xCNT301+' a, TGE202 c '
             +' WHERE NVL(A.CNTESTADO,''X'')=''P'' AND NVL(A.CNTCUADRE,''X'')=''S'' AND '  // VHN
             +  ' (a.CUENTAID = c.CUENTAID(+) and a.CIAID=c.CIAID(+) '
             +  ' AND c.CTA_CCOS=''S'') '
             +  ' AND a.ccosid is not null and a.auxid is null '
             +  ' and a.CNTANOMM='+quotedstr(xxxAnoMM);

   If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
      xSql:=xSql+' AND a.CIAID='+quotedstr(xxxCia)
   else
      xSql:=xSql+' AND a.CIAID='+quotedstr(dblcCia.text);

   xSql:=xSql+' AND NOT EXISTS(SELECT B.CUENTAID FROM CNT401 B '
             +                'WHERE B.CIAID=A.CIAID AND B.CUENTAID = A.CUENTAID AND B.CCOSID=A.CCOSID '
             +                  'AND B.CLAUXID IS NULL AND B.AUXID IS NULL '
             +                  'AND B.CCOSID IS NOT NULL) '
             +'Group by a.cuentaid, a.ccosid';

{     xSql := xSql +  ' from '+xCNT301+' a,tge202 c,CNT401 B '+
                     ' where (a.CUENTAID = c.CUENTAID(+) and a.CIAID=c.CIAID(+)) and'+
                     ' (a.CUENTAID = b.CUENTAID(+) AND '+
                     ' a.ccosid <> b.ccosid(+) and b.ccosid is null ) and'+
                     ' a.ccosid is not null  and a.CNTANOMM='+quotedstr(xxxAnoMM)+
                     ' AND a.CIAID='+quotedstr(dblcCia.text)+
                     ' group by a.cuentaid,a.ccosid';}


   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
   end;


 //** 25/10/2001 - pjsv

   xSQL:='SELECT '+
        'A.CIAID,A.CUENTAID,A.CCOSID,sum('+wReplacCeros+'(a.CNTDEBEMN'+',0)) DEBEMN'+ xMes+','+
        'sum('+wReplacCeros+'(a.CNTDEBEME'+',0)) DEBEME'+ xMes+','+
        'sum('+wReplacCeros+'(a.CNTHABEMN'+',0)) HABEMN'+ xMes+','+
        'sum('+wReplacCeros+'(a.CNTHABEME'+',0)) HABEME'+ xMes +
        ' from '+xCNT301+' a, tge202 c'+
        ' WHERE A.CNTESTADO=''P'' AND A.CNTCUADRE=''S'' AND '+  // VHN
          ' (a.CUENTAID = c.CUENTAID(+) and a.CIAID=c.CIAID(+) AND C.CTA_CCOS=''S'')'+
          ' AND a.CCOSID is not null  and a.CNTANOMM='+quotedstr(xxxAnoMM);

   If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
      xSql:=xSql+' AND a.CIAID='+quotedstr(xxxCia)
   else
      xSql:=xSql+' AND a.CIAID='+quotedstr(dblcCia.text);

   xSql:=xSql+' AND EXISTS(SELECT B.CUENTAID FROM CNT401 B '+
              ' WHERE B.CIAID=A.CIAID AND B.CCOSID=A.CCOSID AND '+
              ' B.CCOSID IS NOT NULL ) '+
              ' group by A.CIAID,a.cuentaid,A.CCOSID';

   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.ProviderName:= 'PrvTGE';
   DMCNT.cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
   DMCNT.cdsQry2.Open;
   DMCNT.cdsQry2.IndexFieldNames:='CIAID;CUENTAID;CCOSID';

   DMCNT.cdsQry2.First;
   while not DMCNT.cdsQry2.EOF do
   begin
      xSQL:='UPDATE CNT401 '+
            ' SET DEBEMN'+xMes+'='+DMCNT.cdsQry2.FieldByName('DEBEMN'+xMes).AsString+','+
            '     DEBEME'+xMes+'='+DMCNT.cdsQry2.FieldByName('DEBEME'+xMes).AsString+','+
            '     HABEMN'+xMes+'='+DMCNT.cdsQry2.FieldByName('HABEMN'+xMes).AsString+','+
            '     HABEME'+xMes+'='+DMCNT.cdsQry2.FieldByName('HABEME'+xMes).AsString+
            ' WHERE CIAID='+QuotedStr(DMCNT.cdsQry2.FieldByName('CIAID').AsString)+
            ' AND CUENTAID='+QuotedStr(DMCNT.cdsQry2.FieldByName('CUENTAID').AsString)+
            ' AND CCOSID='+QuotedStr(DMCNT.cdsQry2.FieldByName('CCOSID').AsString);
      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      try
         DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         DMCNT.DCOM1.AppServer.GrabaTransaccion;
      except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
      end;

      DMCNT.cdsQry2.Next;
   end;

   DMCNT.cdsQry2.IndexFieldNames:='';

   xMesA:= DMCNT.StrZero( IntToStr(StrToInt(xmes) -1),2);
   xSql :='UPDATE CNT401 SET '+
         'SALDMN'+ xMes +'= ('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
         wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),'+
         'SALDME'+ xMes +'= ('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
         wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0),';


   for xZ:=StrToInt( xMes )+1 to 13 do
   begin
      xMesT:=DMCNT.StrZero( IntToStr(xZ),2);
      xSQL :=xSQL + 'SALDMN'+ xMesT +'=('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
             wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),';
   end;

   for xZ:=StrToInt( xMes )+1 to 13 do
   begin
      xMesT := DMCNT.StrZero( IntToStr(xZ),2);
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

   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
   end;

  //** genero montos de las cuentas en la CNT401 que no tengan Auxid y CCOSID
   xSql:='select a.ciaid,a.cuentaid,sum('+wReplacCeros+'(a.cntdebemn,0)) cntdebemn,sum('+wReplacCeros+'(a.cntdebeme,0)) cntdebeme,'+
         'sum('+wReplacCeros+'(a.cnthabemn,0)) cnthabemn, sum('+wReplacCeros+'(a.cnthabeme,0)) cnthabeme,'+
         '(sum('+wReplacCeros+'(a.cntdebemn,0)) -  sum('+wReplacCeros+'(a.cnthabemn,0))) saldmn'+DMCNT.StrZero(xMes,2)+','+
         '(sum('+wReplacCeros+'(a.cntdebeme,0)) -  sum('+wReplacCeros+'(a.cnthabeme,0))) saldme'+DMCNT.StrZero(xMes,2);
   xSql:=xSql + ' from '+xCNT301+' a,cnt401 b ';

   // VHN
   xSql:=xSql+'where NVL(A.CNTESTADO,''X'')=''P'' AND NVL(A.CNTCUADRE,''X'')=''S'' AND ';

   If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
      xSql:=xSql+' a.cntanomm='+quotedstr(xxxAnoMM)+' AND a.CIAID='+quotedstr(xxxCia)
   else
      xSql:=xSql+' a.cntanomm='+quotedstr(xxxAnoMM)+' AND a.CIAID='+quotedstr(dblcCia.text);

   xSql:=xSql+' AND (b.cuentaid(+)=a.cuentaid and '+
         wReplacCeros+'(b.auxid(+),''-'') = ''-'' and '+wReplacCeros+'(b.ccosid(+),''-'') = ''-'' and ';

   If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
      xSql:=xSql+wreplacCeros+'(b.clauxid(+),''-'') = ''-'' and b.ano='+quotedstr(xAno)+' AND b.CIAID='+quotedstr(xxxCia)+')'
   else
      xSql:=xSql+wreplacCeros+'(b.clauxid(+),''-'') = ''-'' and b.ano='+quotedstr(xAno)+' AND b.CIAID='+quotedstr(dblcCia.text)+')';

   xSql:=xSql+' group by a.ciaid, a.cntano, a.cntanomm, a.cuentaid';

   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.ProviderName:= 'PrvTGE';
   DMCNT.cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
   DMCNT.cdsQry2.Open;
   DMCNT.cdsQry2.IndexFieldNames:='CIAID;CUENTAID';
   GrabaSaldos;

   //** genero los montos de las cuentas internas
   DMCNT.cdsNivel.Open;
   xNumNiv := DMCNT.cdsNivel.recordcount;
   DMCNT.cdsNivel.IndexFieldNames := 'NIVEL';
   DMCNT.cdsNivel.Last;
   xNivel := DMCNT.cdsNivel.FieldByName('NIVEL').AsString;

   For xZ := 1 to xNumNiv do
       If (StrToInt(xNivel) - xZ) >= 1 then
          xNiv[xZ] := StrToInt(xNivel) - xZ
       else break;

   For xZ := 1 to High(xNiv) do
   begin
      if xNiv[xZ] <> 0 then
      begin

      // determina los digitos del nivel a totalizar
         DMCNT.cdsNivel.SetKey;
         DMCNT.cdsNivel.fieldbyname('NIVEL').AsString := IntToStr(xNiv[xZ]);
         if DMCNT.cdsNivel.GotoKey then
            xDigitos1 := StrToInt(DMCNT.cdsNivel.fieldbyname('DIGITOS').AsString);

      // determina los dígitos del nivel a sumar
         xNivel := IntToStr(xNiv[xZ]+1 );
         DMCNT.cdsNivel.SetKey;
         DMCNT.cdsNivel.fieldbyname('NIVEL').AsString := xNivel; //IntToStr(xNiv[xZ]);
         If DMCNT.cdsNivel.GotoKey then
            xDigitos := StrToInt(DMCNT.cdsNivel.fieldbyname('DIGITOS').AsString);

      // xsigno := DMCNT.cdsNivel.fieldbyname('SIGNO').AsString;
         xSql := 'SELECT TGE202.ciaid, tge202.cuentaid,'+
             ' sum(debemn'+DMCNT.StrZero(xMes,2)+') cntdebemn,'+
             ' sum(debeme'+DMCNT.StrZero(xMes,2)+') cntdebeme,'+
             ' sum(habemn'+DMCNT.StrZero(xMes,2)+') cnthabemn,'+
             ' sum(habeme'+DMCNT.StrZero(xMes,2)+') cnthabeme,'+
             '(sum(debemn'+DMCNT.StrZero(xMes,2)+') -  sum(habemn'+DMCNT.StrZero(xMes,2) +')) SALDMN'+DMCNT.StrZero(xMes,2)+','+
             '(sum(debeme'+DMCNT.StrZero(xMes,2)+') -  sum(habeme'+DMCNT.StrZero(xMes,2) +')) SALDME'+DMCNT.StrZero(xMes,2);


         if (SRV_D = 'DB2NT') or	 (SRV_D = 'DB2400') then
         begin
            xSql:=xSql+' from cnt401 a'+
                       ' left join tge202 b on (b.ctaniv='+quotedstr(IntToStr(xNiv[xZ]))+
                       ' and b.cuentaid= substr(b.cuentaid,1,'+IntToSTr(xDigitos1)+')) ';
            If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
               xSql:=xSql + ' and b.CIAID='+quotedstr(xxxCia)
            else
               xSql:=xSql + ' and b.CIAID='+quotedstr(dblcCia.text);

            xSql:=xSql+' where (('+wReplacCeros+'(cnt401.auxid,''-'') = ''-'') or '
                      +' (cnt401.auxid = '''')) and (('+
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
               xSql:=xSql+' from cnt401,TGE202'+
                   ' where (('+wReplacCeros+'(cnt401.auxid,''-'') = ''-'') or (cnt401.auxid = '''')) and (('+
                   wReplacCeros+'(cnt401.ccosid,''-'') = ''-'') or (cnt401.ccosid = '''')) and (('+
                   wReplacCeros+'(cnt401.clauxid,''-'') = ''-'') or (cnt401.clauxid = '''')) '+
                   ' and cnt401.tipo= '+quotedstr(xNivel)+
                   ' and CNT401.ANO='+quotedstr(xAno);

               If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
                  xSql:=xSql + ' and CNT401.CIAID='+quotedstr(xxxCia)
               else
                  xSql:=xSql + ' and CNT401.CIAID='+quotedstr(dblcCia.text);

               xSql:=xSql+' and tge202.ctaniv(+)='+quotedstr(IntToStr(xNiv[xZ]))+
                          ' and tge202.cuentaid(+)= substr(cnt401.cuentaid,1,'+IntToSTr(xDigitos1)+')';

               If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
                  xSql:=xSql+' and tge202.CIAID(+)='+quotedstr(xxxCia)
               else
                  xSql:=xSql+' and tge202.CIAID(+)='+quotedstr(dblcCia.text);

               xSql := xSql + ' group by  tge202.ciaid,tge202.cuentaid ORDER BY tge202.cuentaid';
            end;

         DMCNT.cdsQry2.Close;
         DMCNT.cdsQry2.ProviderName:= 'PrvTGE';
         DMCNT.cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
         DMCNT.cdsQry2.Open;
         DMCNT.cdsQry2.IndexFieldNames:='CIAID;CUENTAID';

         GrabaSaldos;
      end;
   end;
   DMCNT.cdsQry2.IndexFieldNames:='';
   Showmessage('Termino A LAS '+DateToStr(date)+' a las '+TimetoStr(Now));
end;


procedure TFTransferenciaDema.CreaPanel( xForma:TForm; xMensaje:String );
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
   pnlConta.Left   := StrToInt(FloattoStr(DMCNT.FRound( ( ((xForma.Width-100))/2)-100,3,0 )));
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

procedure TFTransferenciaDema.PanelMsg( xMensaje:String; xProc:Integer );
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

procedure TFTransferenciaDema.FormActivate(Sender: TObject);
begin
	 Iniciadatos;
   FVariables.ConfiguraForma( Self );
  bbtnRecal.Enabled := DMCNT.wAdmin='P';
  bbtnRecal.Visible := DMCNT.wAdmin='P';
end;

procedure TFTransferenciaDema.GrabaSaldos;
var
 xZ : Integer;
  xSql : String;
begin
 DMCNT.cdsRCuenta.Close;
 {
 xSql := 'SELECT * FROM CNT401 WHERE ('+wReplacCeros+'(cnt401.auxid,''-'') = ''-'' OR (CNT401.AUXID <> ''''))'+
                            ' and ('+wReplacCeros+'(cnt401.ccosid,''-'') = ''-'' OR (cnt401.ccosid <> ''''))and ('+
                            wReplacCeros+'(cnt401.clauxid,''-'') = ''-'' OR (cnt401.clauxid <> ''''))'+
                           ' AND cnt401.ANO='+quotedstr(xAno)+
                           ' AND cnt401.CIAID='+quotedstr(dblcCia.text)+' ORDER BY CUENTAID';
 }
 xSql:='SELECT * FROM CNT401 WHERE ('+wReplacCeros+'(CNT401.AUXID,''-'') = ''-'' OR (CNT401.AUXID <> ''''))'+
                            ' and ('+wReplacCeros+'(CNT401.CCOSID,''-'') = ''-'' OR (CNT401.CCOSID <> '''')) and ('+
                            wReplacCeros+'(CNT401.CLAUXID,''-'') = ''-'' OR (CNT401.CLAUXID <> ''''))'+
                           ' AND CNT401.ANO='+quotedstr(xAno);
  If xNombreBoton = 'sbtCBl' then // solo si viene de contabilizacion en bloque
    xSql := xSql + ' AND CNT401.CIAID='+quotedstr(xCias)
  else
   xSql := xSql + ' AND CNT401.CIAID='+quotedstr(dblcCia.text);


 xMesA := DMCNT.StrZero(IntToStr(StrToInt(xmes) -1),2);

 DMCNT.cdsRCuenta.DataRequest(xSql);
 DMCNT.cdsRCuenta.Open;
 DMCNT.cdsRCuenta.IndexFieldNames :='CIAID;CUENTAID';
 DMCNT.cdsQry2.First;
 while not DMCNT.cdsQry2.eof do
  begin
   DMCNT.cdsRCuenta.Setkey;
   DMCNT.cdsRCuenta.FieldByname('CIAID').AsString   :=DMCNT.cdsQry2.FieldByName('CIAID').AsString;
   DMCNT.cdsRCuenta.FieldByname('CUENTAID').AsString:= DMCNT.cdsQry2.FieldByName('CUENTAID').AsString;
   If DMCNT.cdsRCuenta.Gotokey then
    begin
     DMCNT.cdsRCuenta.edit;
     DMCNT.cdsRCuenta.FieldByname('DEBEMN'+DMCNT.StrZero(xMes,2)).AsString := DMCNT.cdsQry2.FieldByName('CNTDEBEMN').AsString;
     DMCNT.cdsRCuenta.FieldByname('DEBEME'+DMCNT.StrZero(xMes,2)).AsString := DMCNT.cdsQry2.FieldByName('CNTDEBEME').AsString;
     DMCNT.cdsRCuenta.FieldByname('HABEMN'+DMCNT.StrZero(xMes,2)).AsString := DMCNT.cdsQry2.FieldByName('CNTHABEMN').AsString;
     DMCNT.cdsRCuenta.FieldByname('HABEME'+DMCNT.StrZero(xMes,2)).AsString := DMCNT.cdsQry2.FieldByName('CNTHABEME').AsString;
//CLG 22/10/2001
//     DMCNT.cdsRCuenta.FieldByname('SALDMN'+DMCNT.StrZero(xMes,2)).AsFloat := DMCNT.cdsRCuenta.FieldByname('SALDMN'+DMCNT.StrZero(xMesA,2)).AsFloat + DMCNT.cdsQry2.FieldByName('SALDMN'+DMCNT.StrZero(xMes,2)).AsFloat;
//     DMCNT.cdsRCuenta.FieldByname('SALDME'+DMCNT.StrZero(xMes,2)).AsFloat := DMCNT.cdsRCuenta.FieldByname('SALDME'+DMCNT.StrZero(xMesA,2)).AsFloat + DMCNT.cdsQry2.FieldByName('SALDME'+DMCNT.StrZero(xMes,2)).AsFloat;
     DMCNT.cdsRCuenta.FieldByname('SALDMN'+DMCNT.StrZero(xMes,2)).AsFloat := DMCNT.cdsRCuenta.FieldByname('SALDMN'+DMCNT.StrZero(xMesA,2)).AsFloat + DMCNT.cdsQry2.FieldByName('SALDMN'+DMCNT.StrZero(xMes,2)).AsFloat;
     DMCNT.cdsRCuenta.FieldByname('SALDME'+DMCNT.StrZero(xMes,2)).AsFloat := DMCNT.cdsRCuenta.FieldByname('SALDME'+DMCNT.StrZero(xMesA,2)).AsFloat + DMCNT.cdsQry2.FieldByName('SALDME'+DMCNT.StrZero(xMes,2)).AsFloat;

     for xZ:=StrToInt(xMes)+1 to 13 do
      begin
       xMesT := DMCNT.StrZero( IntToStr(xZ),2);
         DMCNT.cdsRCuenta.FieldByname('SALDMN'+xMesT).AsFloat := DMCNT.cdsRCuenta.FieldByname('SALDMN'+DMCNT.StrZero(xMes,2)).AsFloat;
         DMCNT.cdsRCuenta.FieldByname('SALDME'+xMesT).AsFloat := DMCNT.cdsRCuenta.FieldByname('SALDME'+DMCNT.StrZero(xMes,2)).AsFloat;
      end;
    end;
    cdsPost(DMCNT.cdsRCuenta);
   DMCNT.cdsQry2.next;
  end;
 try
    DMCNT.cdsRCuenta.ApplyUpdates(0);
//   DMCNT.ControlTran(0);
 except
 end;
end;

procedure TFTransferenciaDema.rgTipdiaExit(Sender: TObject);
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

procedure TFTransferenciaDema.bbtnRecalClick(Sender: TObject);
var
	 xSQL : string;
   xWhere,xano,xmes : string;
   xcantidad : string;
   xRGCount,xZ : integer;
begin
   Screen.Cursor:=crHourGlass;
   xCNT301:='CNT301';
   xCNT300:='CNT300';
   Z2bbtnContab.Enabled := False;
   bbtnCanc.Enabled := False;
{   //** 24/07/2001 - pjsv - Valida si existen los diarios a Transferir
   xSql := 'select count(*) cantidad from '+xCNT301+' A'+
           ' where NOT Exists(Select TDIARID from TGE104 B where B.TDIARID=A.TDIARID)'+
           ' GROUP BY TDIARID';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.ProviderName:= 'PrvTGE';
   DMCNT.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
   DMCNT.cdsQry.Open;

   //** 24/07/2001 - pjsv - si es mayor que cero significa que hay Diarios que faltan
   if DMCNT.cdsqry.fieldbyname('CANTIDAD').AsInteger > 0 then
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
    xcantidad:=DMCNT.DisplayDescrip('PrvTGE',xCNT301,'COUNT(*) AS CANTIDAD',xWhere,'CANTIDAD');
    Screen.Cursor:=crDefault;
    if strtoint(xcantidad)>0 then
     begin
      if MessageDlg('La Mayorización ya fue efectuada, desea volver a generarla?',
         mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
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
           DMCNT.DCOM1.AppServer.IniciaTransaccion;
           try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            DMCNT.DCOM1.AppServer.GrabaTransaccion;
           except
            // Inicio HPC_201501_CNT
               //DMCNT.DCOM1.AppServer.RegresaTransaccion;
               DMCNT.DCOM1.AppServer.RetornaTransaccion;
            // Fin HPC_201501_CNT
           end;
        end;
     end;
   GeneraEnLinea401(dblccia.text,dblcTDiario.text,speano.text+xmes);
   //**
   Screen.Cursor:=crDefault;
   ShowMessage('Grabación Exitosa');
   Close;
end;


procedure TFTransferenciaDema.BitBtn1Click(Sender: TObject);
var
   xSQL, xSQL1, xSQL2 : String;
begin
   if MessageDlg('¿ Esta Seguro de Ejecutar ?',
      mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

   Screen.Cursor:=crHourGlass;

   if strtoint(speMM.text)=0 then  xmes:='00'
   else if length(speMM.text)=1 then xmes:='0'+speMM.text
   else xmes:=copy(speMM.text,1,2);

   xAno:=speAno.text;



   xSQL:='DELETE FROM '+xCNT300+' WHERE CIAID='+QuotedStr(dblcCia.Text)+' AND CNTANOMM='+QuotedStr(speAno.text+xmes)
        +  ' and TDIARID='''   +dblcTDiario.Text +''' AND '
        +       'CNTCOMPROB='''+meComp.Text      +''' ';

   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
     DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
     DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
   // Inicio HPC_201501_CNT
      //DMCNT.DCOM1.AppServer.RegresaTransaccion;
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   // Fin HPC_201501_CNT
   end;

   xSQL:='DELETE FROM '+xCNT301+' WHERE CIAID='+QuotedStr(dblcCia.Text)+' AND CNTANOMM='+QuotedStr(speAno.text+xmes)
        +  ' and TDIARID='''   +dblcTDiario.Text +''' AND '
        +       'CNTCOMPROB='''+meComp.Text      +''' ';

   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
     DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
     DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
   // Inicio HPC_201501_CNT
      //DMCNT.DCOM1.AppServer.RegresaTransaccion;
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   // Fin HPC_201501_CNT
   end;

   if SRV_D = 'ORACLE' then
   begin
      xSQL1:='Insert into '+xCNT301+' '
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
//              +'DECODE(A.DEBE,0,''H'',''D''),'  //FALTA
              +'DECODE(NVL(A.DEBE,0), 0, ''H'', ''D'') DH, '

              +'A.CCOS_CODI, '
              //** Tipo cambio
              +wTCambio+', '
              //** monto original
//            +'DECODE(A.DEBE,0,HABER,DEBE),'
              +'DECODE(NVL(A.DEBE,0),0,HABER,DEBE) MTOORI, '
              //** Monto local
              //+'DECODE(A.DEBE,0,HABER,DEBE),'             // Monto soles
              +'DECODE(NVL(A.DEBE,0),0,HABER,DEBE) MTOLOC, '

              //** monto Extranjero
//            +'TRUNC(DECODE(A.DEBE,0,HABER/'+wTCambio+',DEBE/'+wTCambio+'),2),'
              +'ROUND( DECODE(NVL(A.DEBE,0), 0, HABER/'+wTCambio+', DEBE/'+wTCambio+'),2 ) MTOEXT, '

              +'DECODE(NVL(A.FECH_DOCU,''''),'''',TO_DATE('+''''+formatdatetime(wFormatFecha,dtpFCont.date)+''''+'),A.FECH_DOCU ), ' //FECHA DE EMISION
              +'TO_DATE(B.FECDIA||'+quotedstr('-')+'||B.FECMES||'+quotedstr('-')+'||B.FECANO)' //FECHA DE VENCIMIENTO
              +','
              +'TO_DATE(B.FECDIA||'+quotedstr('-')+'||B.FECMES||'+quotedstr('-')+'||B.FECANO)'  //FECHA DE COMPROBANTE
              +','
              +quotedstr('P')+', '+quotedstr('S')+', '+quotedstr(' ')+', '+quotedstr(DMCNT.wUsuario)+', '
              +wRepFecServi+', '+wRepHorServi+', B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, '
              +'B.FECAATRI, B.FECAASEM, B.FECAASS, '
              //+'DECODE(A.MONEDA,''D'', ''D'',''N''),' // Tipo de Moneda
              +'DECODE(A.MONEDA,''D'', ''D'',''N'') TM, '

              +quotedstr('X')+', '+quotedstr(' ')+', '+quotedstr(' ')+', '
              +'SUBSTR(C.TDIARDES,1,20), SUBSTR(D.CTADES,1,15), SUBSTR(E.CLAUXDES,1,15), '
              +quotedstr(' ')+', '+quotedstr(' ')+', '

              //+'A.DEBE, '  //CNTDEBEMN
              +'nvl(A.DEBE,0 ) DEBEMN, '
              //+'A.DEBE_DOL, '
              +'ROUND(DECODE( nvl(A.DEBE_DOL,0), 0, DECODE( NVL(A.DEBE,0),0, 0, A.DEBE/3.5 ), nvl(A.DEBE_DOL,0) ),2) DEBEME, '

              //+'A.HABER, '
              +'nvl(A.HABER,0) HABEMN, '
              //+'A.HABER_DOL,'
              +'ROUND(DECODE( nvl(A.HABER_DOL,0), 0, DECODE( NVL(A.HABER,0),0,0, A.HABER/3.5), NVL(A.HABER_DOL,0) ),2) HABEME, '

              +'0, 0, '+quotedstr(' ')+', '+quotedstr(' ')+', '+quotedstr(' ')+', '+quotedstr('ORACLE')+', TO_NUMBER( A.ELEMENTO ) ';

   end;

   xSQL2:='FROM '+meTAbaco.Text+', DETCORR A, TGE114 B, TGE104 C, TGE202 D, TGE102 E, CNT405 F '
         +' WHERE (B.FECHA(+)=TO_DATE('+''''+formatdatetime(wFormatFecha,dtpFCont.date)+''''+'))' //wFormatFecha A.FECH_DOCU(+)) '
         +' AND (C.TDIARID(+)='+quotedstr(dblcTDiario.Text)+') '
         +' AND (D.CIAID(+)='+quotedstr(dblcCia.Text)+' AND D.CUENTAID(+)=A.CUENTA) '
         +' AND (E.CLAUXID(+)= DECODE(SUBSTR(A.RELACION,1,1),''9'',''Z'',SUBSTR(A.RELACION,1,1))) '
         +' AND (F.CLAUIDOR(+)=A.RELACION) '
         +' AND (A.NUMCIA='+quotedstr(dblcCia.Text)+' AND A.ANO='+QuotedStr(xano)+' AND '
         +' A.MES='+QuotedStr(xmes)+' AND A.ORIGEN='+quotedstr(dblcTDiario.text)+') AND '
         +' A.COMPROB='+quotedstr( Copy( meComp.text, 4, 7 ));

   xSQL:=xSQL1+xSQL2;
   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
   // Inicio HPC_201501_CNT
      //DMCNT.DCOM1.AppServer.RegresaTransaccion;
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   // Fin HPC_201501_CNT
   end;

   if SRV_D = 'ORACLE' then
   begin
     xSQL:='INSERT INTO '+xCNT300+' ';
     xSQL:=xSQL+ '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, ';
     xSQL:=xSQL+ 'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, ';
     xSQL:=xSQL+ 'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, ';
     xSQL:=xSQL+ 'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, ';
     xSQL:=xSQL+ 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, ';
     xSQL:=xSQL+ 'CNTTS,DOCMOD ) ' ;

     xSQL:=xSQL+ 'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE, ';
     xSQL:=xSQL+ 'MAX( CNTGLOSA ), ';
     xSQL:=xSQL+ 'SUM( DECODE(A.FLAGVAR,''T'',A.CNTTCAMBIO,0)), ';
     xSQL:=xSQL+ 'A.CNTFCOMP, ''P'', ''S'', ';
     xSQL:=xSQL+ ''''+DMCNT.wUsuario+''''+', '+wRepFecServi+', '+wRepFecServi+', A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
     xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, MAX(A.TMONID)'+', '' '', ';
     xSQL:=xSQL+ 'A.TDIARDES, ';
     xSQL:=xSQL+ 'SUM('+wReplacCeros+'(A.CNTDEBEMN,0)), SUM('+wReplacCeros+'(A.CNTDEBEME,0)), SUM('+wReplacCeros+'(A.CNTHABEMN,0)), SUM('+wReplacCeros+'(A.CNTHABEME,0)), ';
     xSQL:=xSQL+ ''''+Copy( wcampo,6,2 )+''''+',''ORACLE'' ';
     xSQL:=xSQL+ 'FROM '+xCNT301+' A ';
     xSQL:=xSQL+ 'WHERE A.CIAID='     +''''+dblcCia.Text    +''''+' AND ';
     xSQL:=xSQL+       'A.TDIARID='   +''''+dblcTDiario.Text+''''+' AND ';
     xSQL:=xSQL+       'A.CNTANOMM='  +''''+speAno.text+xmes+''''+' AND ';
     xSQL:=xSQL+       'CNTCOMPROB='  +''''+meComp.Text     +''' ';
     xSQL:=xSQL+ 'GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, ';
     xSQL:=xSQL+ 'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
     xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
     xSQL:=xSQL+ 'A.TDIARDES, A.CNTMODDOC';
   end;
   try
      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
   // Inicio HPC_201501_CNT
      //DMCNT.DCOM1.AppServer.RegresaTransaccion;
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   // Fin HPC_201501_CNT
   end;

   Screen.Cursor:=crDefault;
   ShowMessage( 'OK' );

end;

{
procedure cuadra;
begin
   xSQL:='SELECT CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTREG, CUENTAID, '
        +  'CNTDH, TMONID, CNTMTOORI, CNTTCAMBIO, CNTDEBEMN, CNTHABEMN, '
        +  'CNTDEBEME, CNTHABEME, CNTMTOLOC, CNTMTOEXT, CCOSID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
        +  'CNTESTADO, CNTCUADRE, CNTFAUTOM, '
        +  'CNTMODDOC, CNTUSER '
        +  'FROM '+xCNT301+' '
        +'WHERE CIAID='''     +cds1.FieldByName('CIAID').AsString     +''' AND '
        +      'TDIARID='''   +cds1.FieldByName('TDIARID').AsString   +''' AND '
        +      'CNTANOMM='''  +cds1.FieldByName('CNTANOMM').AsString  +''' AND '
        +      'CNTCOMPROB='''+cds1.FieldByName('CNTCOMPROB').AsString+''' ';

   cdsMovCnt1.Close;
   cdsMovCnt1.DataRequest( xSQL );
   cdsMovCnt1.Open;

   cdsMovCnt1.INDEXFIELDNAMES:='CNTREG';

   xSQL:='SELECT CIAID, TDIARID, CNTANOMM, CNTCOMPROB, '
        +  'CNTDEBEMN, CNTHABEMN, CNTDEBEME, CNTHABEME '
        +'FROM '+xCNT300+' '
        +'WHERE CIAID='''     +cds1.FieldByName('CIAID').AsString     +''' AND '
        +      'TDIARID='''   +cds1.FieldByName('TDIARID').AsString   +''' AND '
        +      'CNTANOMM='''  +cds1.FieldByName('CNTANOMM').AsString  +''' AND '
        +      'CNTCOMPROB='''+cds1.FieldByName('CNTCOMPROB').AsString+''' ';

   cdsCabCnt.Close;
   cdsCabCnt.DataRequest( xSQL );
   cdsCabCnt.Open;

   xSQL:='SELECT CIAID, TDIARID, CNTANOMM, CNTCOMPROB, '
        + 'sum(CNTDEBEMN) DEBEMN, SUM(CNTHABEMN) HABEMN, '
        + 'SUM(CNTDEBEME) DEBEME, SUM(CNTHABEME) HABEME '
        + 'FROM '+xCNT301+' '
        +'WHERE CIAID='''     +cds1.FieldByName('CIAID').AsString     +''' AND '
        +      'TDIARID='''   +cds1.FieldByName('TDIARID').AsString   +''' AND '
        +      'CNTANOMM='''  +cds1.FieldByName('CNTANOMM').AsString  +''' AND '
        +      'CNTCOMPROB='''+cds1.FieldByName('CNTCOMPROB').AsString+''' '
        +'GROUP BY CIAID, TDIARID, CNTANOMM, CNTCOMPROB ';

   cds2.Close;
   cds2.DataRequest( xSQL );
   cds2.Open;

   medmn.Text:=cds2.FieldByname('debemn').asstring;
   mehmn.Text:=cds2.FieldByname('habemn').asstring;
   medme.Text:=cds2.FieldByname('debeme').asstring;
   mehme.Text:=cds2.FieldByname('habeme').asstring;
end;
 }
end.


