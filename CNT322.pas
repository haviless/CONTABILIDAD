unit CNT322;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, wwdbdatetimepicker, wwdblook, Buttons, Mask, wwdbedit,
  Spin, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppProd, ppReport,
  ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, Grids, Wwdbigrd, Wwdbgrid ,ppViewr,
  Wwdbdlg, oaVariables, ppTypes, ppEndUsr, DBGrids;

type
  TFResGralCta = class(TForm)
    pnlMayorAn: TPanel;
    lblCia: TLabel;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    rgMoneda: TRadioGroup;
    gbLPar: TGroupBox;
    ckTit: TCheckBox;
    edtTit: TEdit;
    ppdbBalComprob: TppDBPipeline;
    gbPer: TGroupBox;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    Label2: TLabel;
    dbdtpFReg1: TwwDBDateTimePicker;
    dbdtpFReg2: TwwDBDateTimePicker;
    ppReport1: TppReport;
    rgCuentaSola: TRadioGroup;
    Z2bbtnSelCuentaSola: TBitBtn;
    gbRangos: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    dblcdHasta: TwwDBLookupComboDlg;
    dblcdDesde: TwwDBLookupComboDlg;
    ppHeaderBand2: TppHeaderBand;
    pplblCia2: TppLabel;
    pplblTitulo2: TppLabel;
    ppLabel32: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel34: TppLabel;
    pplblPeriodo2: TppLabel;
    ppLabel11: TppLabel;
    ppLabel8: TppLabel;
    ppTituloMoneda: TppLabel;
    ppLabel33: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel10: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel20: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel23: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDEBE: TppDBText;
    ppVariable1: TppVariable;
    ppdbtSaldAntMN: TppDBText;
    ppHABER: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLabel35: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLine3: TppLine;
    ppd1: TppDesigner;
    dtgData: TDBGrid;
    bbtnExcel1: TBitBtn;
    cbDisenoRep: TCheckBox;
    sbDisenoRep: TSpeedButton;
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure ckTitClick(Sender: TObject);
    procedure ppvSFMNCalc(Sender: TObject; var Value: Variant);
    procedure ppvSFMECalc(Sender: TObject; var Value: Variant);
    procedure ppdbtSMNPrint(Sender: TObject);
    procedure ppdbtDMNPrint(Sender: TObject);
    procedure ppdbtHMNPrint(Sender: TObject);
    procedure ppdbtSMEPrint(Sender: TObject);
    procedure ppdbtDMEPrint(Sender: TObject);
    procedure ppdbtHMEPrint(Sender: TObject);
    function StrZ(wNumero:String;wLargo:Integer):string;
    procedure LlenaCNT301;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbdtpFReg1Exit(Sender: TObject);
    procedure dbdtpFReg2Exit(Sender: TObject);
    procedure gbPerExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pprBalComprobPreviewFormCreate(Sender: TObject);
    procedure ppSaldoAntPrint(Sender: TObject);
    procedure ppDEBEPrint(Sender: TObject);
    procedure ppHABERPrint(Sender: TObject);
    procedure ppReport1PreviewFormCreate(Sender: TObject);
    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc2Calc(Sender: TObject);
    procedure ppDBCalc3Calc(Sender: TObject);
    procedure ppDBCalc1Calc(Sender: TObject);
    procedure ppDBCalc4Calc(Sender: TObject);
    procedure ppDBCalc5Calc(Sender: TObject);
    procedure ppDBCalc6Calc(Sender: TObject);
    procedure ppVariable2Calc(Sender: TObject; var Value: Variant);
    procedure ppdbtADEBEPrint(Sender: TObject);
    procedure ppdbtAHABEPrint(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure Z2bbtnSelCuentaSolaClick(Sender: TObject);
    procedure rgCuentaSolaClick(Sender: TObject);
    procedure dblcdDesdeDropDown(Sender: TObject);
    procedure dblcdHastaDropDown(Sender: TObject);
    procedure dblcdDesdeExit(Sender: TObject);
    procedure dblcdHastaExit(Sender: TObject);
    procedure bbtnCancClick(Sender: TObject);
    procedure bbtnExcel1Click(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }
    xnivel,xSQL : string;
    sLink : String;
  public
    { Public declarations }
    sCiaCuenta : String;
  end;

var
  FResGralCta: TFResGralCta;
  Year, Month, Day: Word;
  xwhere, anomm : string;

  // Variables para procesos de transferencia (temporales)
   wtdi, wnumco, wano, wper, wnumdo, wmm: String;
   wfedo, wfeve, wfeco: tDate;

implementation

uses CNTDM, CNT412;

{$R *.DFM}

procedure TFResGralCta.dblcCiaExit(Sender: TObject);
begin
   if (bbtnCanc.Focused) then exit;
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DMCNT.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   end;

   Screen.Cursor:= crHourGlass;

   sCiaCuenta:=DMCNT.FiltraTablaxCia( DMCNT.cdsCuenta,  'TGE202', 'CUENTAID', dblcCia.Text );
   xSQL:='SELECT CIAID, CUENTAID, CTADES FROM TGE202 '
        +'WHERE CIAID='''+dblcCia.text+''' ';
   if sCiaCuenta<>'' then
      xSQL:=xSQL+' and '+sCiaCuenta;
   xSQL:=xSQL+' ORDER BY CUENTAID';

   DMCNT.cdsCuenta.fetchondemand:=False;
   DMCNT.cdsCuenta.packetrecords:=-1;
   DMCNT.cdsCuenta.fetchondemand:=True;
   DMCNT.FiltraCDS(DMCNT.cdsCuenta,xSQL);
   Screen.Cursor:=CrDefault;
end;

procedure TFResGralCta.bbtnOkClick(Sender: TObject);
Var
  xSQL,xWhere2,xMes,wMesAnt: String;
  CampoDMN,CampoHMN,CampoSMN,CampoDME,CampoHME,CampoSME: String;
  sMon,sWhere,sDebe,sHabe{,sHaving} : string;
  i:integer;
  xCuentas : Array[1..250] of string;
  xDigi,xZ,xConCuen,xLength : Integer;
  xCuenta,xEntero,xCuentas1,xDesde,xHasta : String;
  xAncho:Integer;
  // vhn
  sCtaLog : String;
begin
  DMCNT.cdsQry.indexFieldNames :='';
  DMCNT.cdsQry.filter := '';
  DMCNT.cdsQry.Filtered := True;
  xWhere2:='';
  if edtCia.Text='' then
  begin
  	showmessage('Compañia no válida');
    raise exception.Create('Compañia no válida');
  end ;

  //** 02/05/2001 - pjsv, para saber si es de ultimo nivel, para sumar solo
  // las ctas. de mov. sino suma todas las del nivel + las de mov. que hubieran
  xnivel :='';
  xsql :='';

  // vhn
  sCtaLog:='';
  if (rgCuentaSola.ItemIndex=2) and (FSelCuenta.cdsClone.recordcount>0) then
   begin
     xCuentas1 := ' and cnt401.CUENTAID IN (' ;
     sCtaLog   := 'CUENTAID IN ( ';
     with FSelCuenta.cdsClone do
      begin
       FSelCuenta.cdsClone.First ;
       while not FSelCuenta.cdsClone.Eof do
        begin
         DMCNT.cdsNivel.First;
         while not DMCNT.cdsNivel.Eof do
          begin
           xCuentas1:=xCuentas1+''''+Copy(FSelCuenta.cdsClone.fieldbyname('CUENTAID').AsString, 1, DMCNT.cdsNivel.FieldByname('DIGITOS').AsInteger ) + '''';
           sCtaLog  :=sCtaLog  +Copy(FSelCuenta.cdsClone.fieldbyname('CUENTAID').AsString, 1, DMCNT.cdsNivel.FieldByname('DIGITOS').AsInteger );
           DMCNT.cdsNivel.Next;
           if not DMCNT.cdsNivel.eof then
           begin
              xCuentas1:=xCuentas1 + ' , ' ;
              sCtaLog  :=sCtaLog   + ', ';
           end;
          end;
         FSelCuenta.cdsClone.Next ;
         if not FSelCuenta.cdsClone.eof then
         begin
            xCuentas1:=xCuentas1 + ' , ' ;
            sCtaLog  :=sCtaLog   + ', ';
         end;
        end;
      end;
    xCuentas1 := xCuentas1 + ' ) ';
    sCtaLog   := sCtaLog   + ' )';
   end ;

  // CLG 11/07/2001 ACUMULADO DEL DEBE Y HABER
  if rgMoneda.ItemIndex=1 then  // CUANDO ES MONDEDA EXTRANJERA
  begin
  	sMon:='ME';
    sWhere:='TMON_LOC=''E''';
  end
  else
  begin
  	sMon:='MN';
    sWhere:='TMON_LOC=''L''';
  end;

  for i:=1 to StrToInt(speMM.text) do
  begin
    sDebe:=sDebe+wReplacCeros+'(DEBE'+sMon+DMCNT.StrZero(IntToStr(i),2)+',0)+';
    sHabe:=sHabe+wReplacCeros+'(HABE'+sMon+DMCNT.StrZero(IntToStr(i),2)+',0)+';
  end;
  //QUITAR EL ULTIMO + DE LA CADENA

  if Length( sDebe )=0 then
  begin
     sDebe:=sDebe+' 0.00 ';
     sHabe:=sHabe+' 0.00 ';
  end;

  sDebe:=Copy(sDebe,1,Length(sDebe)-1);
  sHabe:=Copy(sHabe,1,Length(sHabe)-1);

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    sDebe:=sDebe+' ADEBE, ';
    sHabe:=sHabe+' AHABE, ';
  end
  else
  begin
    sDebe:=sDebe+' ADEBE, ';
    sHabe:=sHabe+' AHABE, ';
  end;

  xnivel :='';
  xsql :='';

  if (SRV_D = 'DB2NT') or	 (SRV_D = 'DB2400') then
//    xsql := 'NIVEL='+quotedstr('0'+IntToStr(StrToInt(dblcNivel.text)-1))
  else
    xsql := 'NIVEL='+quotedstr(IntToStr(StrToInt(DMCNT.cdsNivel.fieldbyname('NIVEL').AsString)-1));

  if DMCNT.DisplayDescrip('PrvTGE','CNT202','*',xsql,'NIVEL') = '' then
  	xnivel := '0'
  else
  	xnivel := '1';

  xWhere:='cnt401.CIAID='+''''+dblcCia.Text+''''
        +' and cnt401.ANO='+''''+speAno.Text+''''
        +' and cnt401.TIPO<='+quotedstr(DMCNT.cdsNivel.fieldbyname('NIVEL').AsString)
        + ' AND (cnt401.auxid IS NULL OR cnt401.auxid='''') '
        + ' AND (cnt401.ccosid is null or cnt401.ccosid='''')'
        + ' AND length(cnt401.cuentaid) <> 1' ;

   if sCiaCuenta<>'' then
      xWhere:=xWhere+' and cnt401.'+sCiaCuenta;

   if rgCuentaSola.ItemIndex = 1 then
   begin
      If Length(dblcdDesde.Text)=0 Then
      Begin
        showmessage('Debe seleccionar la Cuenta de Inicio');
        dblcdDesde.SetFocus;
        exit;
      End;
      If Length(dblcdHasta.Text)=0 Then
      Begin
        showmessage('Debe seleccionar la Cuenta de Fin');
        dblcdHasta.SetFocus;
        exit;
      End;

      If Length(dblcdDesde.Text)>Length(dblcdHasta.Text) Then
      Begin
        xAncho:=Length(dblcdHasta.Text);
      End
      Else
      Begin
        xAncho:=Length(dblcdDesde.Text);
      End;

      If StrToInt(Copy(dblcdDesde.Text,1,xAncho))>StrToInt(Copy(dblcdHasta.Text,1,xAncho)) Then
      Begin
        showmessage('La Cuenta Inicio debe ser Menor a la Cuenta Fin');
        dblcdDesde.SetFocus;
        exit;
      End;
      If StrToInt(Copy(dblcdHasta.Text,1,xAncho))<StrToInt(Copy(dblcdDesde.Text,1,xAncho)) Then
      Begin
        showmessage('La Cuenta de Fin debe ser Mayor que la Cuenta de Inicio');
        dblcdHasta.SetFocus;
        exit;
      End;

     //xDesde:=Copy(TRIM(dblcdDesde.Text),1,2);

     xDesde:=TRIM(dblcdDesde.Text);
     xHasta:=TRIM(dblcdHasta.Text);

     xCuentas1 := ' and ( cnt401.CUENTAID IN (' ;
     sCtaLog   := '';
     DMCNT.cdsNivel.First;
     while not DMCNT.cdsNivel.Eof do
     begin
        xCuentas1:=xCuentas1+''''+Copy( xDesde, 1, DMCNT.cdsNivel.FieldByname('DIGITOS').AsInteger )+'''';
        DMCNT.cdsNivel.Next;
        if not DMCNT.cdsNivel.eof then
           xCuentas1:= xCuentas1 + ', ';
     end;
     xCuentas1:= xCuentas1 + ' ) ';
     xWhere:=xWhere+xCuentas1+ ' or ( CNT401.CUENTAID BETWEEN '+QuotedStr(xDesde)+' AND '+QuotedStr(xHasta)+') )';

     sCtaLog :='CUENTAID BETWEEN '+xDesde+' AND '+xHasta;
  end;

  xMes:=speMM.Text;
  if (StrToInt(xmes) - 1) <= 9 then
  	wMesAnt := '0' + inttostr((StrToInt(xmes) - 1))
  else
  	wMesAnt := inttostr((StrToInt(xmes) - 1));


  if length(xMes)<2 then xMes := '0'+xMes;

     //** 17/04/2001 - pjsv
     if wMesAnt='0-1' then
     begin
        wMesAnt:='00';
        CampoSME := '0.00 '; // wmes
        CampoSMN := '0.00 '; // wmes
     end
     else
     begin
        CampoSME := 'SALDME'+wMesAnt; // wmes
        CampoSMN := 'SALDMN'+wMesAnt; // wmes
     end;
     //**
     CampoDMN := 'DEBEMN'+xMes;
     CampoHMN := 'HABEMN'+xMes;
     CampoDME := 'DEBEME'+xMes;
     CampoHME := 'HABEME'+xMes;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
    begin
     xSQL:='Select cnt401.CUENTAID, cnt401.CTADES, '
        +CampoSMN+' as SALDMN, '
        +CampoDMN+' as DEBEMN, '
        +CampoHMN+' as HABEMN, '
        +CampoSME+' as SALDME, '
        +CampoDME+' as DEBEME, '
        +CampoHME+' as HABEME, '
        +sDebe+sHabe
        +' TGE202.CTA_DET,cnt401.TIPO'
        +' From cnt401 '
        +' LEFT JOIN TGE202 ON (cnt401.CUENTAID = TGE202.CUENTAID AND cnt401.CIAID = TGE202.CIAID) Where ';
        xSQL:=xSQL+xWhere;
        For xZ := 1 to 250 do
         begin
          If xCuentas[xZ] <> '' then
           If xCuenta = '' then
            xCuenta := quotedstr(xCuentas[xZ])
           else xCuenta := xCuenta + ','+quotedstr(xCuentas[xZ]);
         end;
      If xCuenta <> '' then
       xSQL:=xSQL + ' AND cnt401.CUENTAID IN ('+xCuenta+')';
      xSQL:=xSQL +' ORDER BY cnt401.CUENTAID' ;
    end
   else
    if SRV_D = 'ORACLE' then
     begin
      xSQL:='Select cnt401.CUENTAID, TGE202.CTADES, '
        +CampoSMN+' SALDMN, '
        +CampoDMN+' DEBEMN, '+CampoHMN+' HABEMN, '
        +CampoSME+' SALDME, '
        +CampoDME+' DEBEME, '+CampoHME+' HABEME, '+sDebe+sHabe
        +' TGE202.CTA_DET, cnt401.TIPO'
        +' From cnt401'+sLink+', TGE202'+sLink+' '
        +' Where (cnt401.CUENTAID = TGE202.CUENTAID(+)) AND (cnt401.CIAID = TGE202.CIAID(+)) AND ';//+sHaving+' <> 0 AND ';
      xSQL:=xSQL+xWhere;
      If ( Length(xCuentas1)>0) and (rgCuentaSola.ItemIndex<>1) then
         xSql := xSql + '  '+xCuentas1;
      xsql := xsql + ' ORDER BY CUENTAID ' ;
     end;
    DMCNT.cdsQry.Close;
    DMCNT.cdsQry.ProviderName:='prvCNT';
    DMCNT.cdsQry.DataRequest(xSQL);
    DMCNT.cdsQry.Open;
    DMCNT.cdsQry.Filter:='SALDMN<>0.00 or DEBEMN <>0.00 or HABEMN <>0.00 or DEBEME <>0.00 or HABEME <>0.00 or ADEBE <>0.00 or AHABE <>0.00';
    DMCNT.cdsQry.Filtered:=True;
   if DMCNT.cdsQry.RecordCount = 0 then
    begin
     DMCNT.cdsQry.Filter:='';
     DMCNT.cdsQry.Filtered:=True;
     Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas') ;
    end                                                  ;
   DMCNT.cdsQry.First;
   case rgMoneda.ItemIndex of
    -1: begin
           ShowMessage('Ingrese Tipo de Moneda a Listar');
           rgMoneda.SetFocus;
           Exit;
        end;
    0 : begin // local
          ppReport1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\ResGralCta.rtm';
          ppReport1.template.LoadFromFile ;
          ppTituloMoneda.Caption  :='MONEDA LOCAL' ;
          ppdbtSaldAntMN.DataField:='SALDMN' ;
          ppDEBE.DataField        :='DEBEMN' ;
          ppHABER.DataField       :='HABEMN' ;
        end;
    1 : begin  // Extranjera
          ppReport1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\ResGralCta.rtm';
          ppReport1.template.LoadFromFile ;
          ppTituloMoneda.Caption  :='MONEDA EXTRANJERA' ;
          ppdbtSaldAntMN.DataField:='SALDME' ;
          ppDEBE.DataField        :='DEBEME' ;
          ppHABER.DataField       :='HABEME' ;
        end;
   end;
   pplblCia2.Caption       :=edtCia.Text;
   pplblTitulo2.Caption    :=edtTit.Text;
   pplblPeriodo2.caption   :=SysUtils.LongMonthNames[strtoint(xMes)] +'  '+ speAno.Text;

   DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Resumen General por Cuenta',
                     dblcCia.Text,                                  // Campañía
                     speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
                     dbdtpFReg1.Text, dbdtpFReg2.Text,              // Fecha   Inicio - final
                     '',  '',                                       // Nivel   - Origen
                     '', inttostr(rgMoneda.itemindex),              // Lote    -  Moneda
                     sCtaLog, '',                              // Cuentas - Auxiliares
                     '', 'Impresora',                               // Costos - Tipo Salida
                     '' );               // Tipo Rep

   ppd1.Report:=ppReport1;
   if cbDisenoRep.Checked then
      ppd1.ShowModal
   else
   begin
      ppReport1.Print;
      DMCNT.cdsQry.CancelUpdates;
      DMCNT.cdsQry.IndexFieldNames:='';
      DMCNT.cdsQry.Filter:='';
      DMCNT.cdsQry.Filtered:=True;
   end;
end;

procedure TFResGralCta.ckTitClick(Sender: TObject);
begin
   if ckTit.Checked then edtTit.Enabled:=True
   else edtTit.Enabled:=False;
end;

procedure TFResGralCta.ppvSFMNCalc(Sender: TObject; var Value: Variant);
Var
   xD,xH,xS: DOUBLE;
begin
   Value:=xS+(xD-xH);
end;

procedure TFResGralCta.ppvSFMECalc(Sender: TObject; var Value: Variant);
Var
   xD,xH,xS: DOUBLE;
begin
  With DMCNT do Begin
   Value:=xS+(xD-xH);
  End;
end;

procedure TFResGralCta.ppdbtSMNPrint(Sender: TObject);
begin
//     ppdbtSMN.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFResGralCta.ppdbtDMNPrint(Sender: TObject);
begin
//     ppdbtDMN.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFResGralCta.ppdbtHMNPrint(Sender: TObject);
begin
//     ppdbtHMN.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFResGralCta.ppdbtSMEPrint(Sender: TObject);
begin
//     ppdbtSME.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFResGralCta.ppdbtDMEPrint(Sender: TObject);
begin
//     ppdbtDME.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFResGralCta.ppdbtHMEPrint(Sender: TObject);
begin
//     ppdbtHME.DisplayFormat:='#,0.00;-#,0.00';
end;

function TFResGralCta.StrZ(wNumero:String;wLargo:Integer):string;
var
   i : integer;
   s : string;
begin
   s := '';
   for i:=1 to wLargo do
   begin
      s := s+'0';
   end;
   result := wNumero+s;
//   result:= copy(s,length(s)-(wLargo-1),wLargo);
end;

procedure TFResGralCta.LlenaCNT301;
begin
     DMCNT.cdsMovCNT2 .Insert;
     DMCNT.cdsMovCNT2.FieldByName('CIAID').AsString      := DMCNT.cdsCntTemp.FieldByName('CIAID').AsString;
     DMCNT.cdsMovCNT2.FieldByName('TDIARID').AsString    := wtdi;
     DMCNT.cdsMovCNT2.FieldByName('CNTCOMPROB').AsString := wnumco;
     DMCNT.cdsMovCNT2.FieldByName('CNTANO').AsString     := wano;
     DMCNT.cdsMovCNT2.FieldByName('CNTANOMM').AsString   := wper;
//   DMCNT.cdsMovCNT2CNTLote.Value    := DMCNT.cdsMov CNTCNTLote.Value;
     DMCNT.cdsMovCNT2.FieldByName('CUENTAID').AsString   := DMCNT.cdsCntTemp.FieldByName('CUENTAID').AsString;
     DMCNT.cdsMovCNT2.FieldByName('CLAUXID').AsString    := DMCNT.cdsCntTemp.FieldByName('CLAUXID').AsString;
     DMCNT.cdsMovCNT2.FieldByName('AUXID').AsString      := DMCNT.cdsCntTemp.FieldByName('AUXID').AsString;
     DMCNT.cdsMovCNT2.FieldByName('DOCID').AsString      := DMCNT.cdsCntTemp.FieldByName('DOCID').AsString;
     DMCNT.cdsMovCNT2.FieldByName('CNTSERIE').AsString   := DMCNT.cdsCntTemp.FieldByName('CNTSERIE').AsString;
     DMCNT.cdsMovCNT2.FieldByName('CNTNODOC').AsString   := wnumdo;
     DMCNT.cdsMovCNT2.FieldByName('CNTGLOSA').AsString   := DMCNT.cdsCntTemp.FieldByName('CNTGLOSA').AsString;
     DMCNT.cdsMovCNT2.FieldByName('CNTDH').AsString      := DMCNT.cdsCntTemp.FieldByName('CNTDH').AsString;
//   DMCNT.cdsMovCNT2CCosId.Value     := DMCNT.cdsMov CNTCCosId.Value;
     DMCNT.cdsMovCNT2.FieldByName('CNTTCAMBIO').AsFloat  := DMCNT.cdsCntTemp.FieldByName('CNTTCAMBIO').AsFloat;
     DMCNT.cdsMovCNT2.FieldByName('CNTMTOORI').AsFloat   := DMCNT.cdsCntTemp.FieldByName('CNTMTOORI').AsFloat;
     DMCNT.cdsMovCNT2.FieldByName('CNTMTOLOC').AsFloat   := DMCNT.cdsCntTemp.FieldByName('CNTMTOLOC').AsFloat;
     DMCNT.cdsMovCNT2.FieldByName('CNTMTOEXT').AsFloat   := DMCNT.cdsCntTemp.FieldByName('CNTMTOEXT').AsFloat;
     if DMCNT.cdsCntTemp.FieldByName('CNTDH').AsString = 'D' then begin
        DMCNT.cdsMovCNT2.FieldByName('CNTDEBEMN').AsFloat:=DMCNT.cdsCntTemp.FieldByName('CNTMTOLOC').AsFloat;
        DMCNT.cdsMovCNT2.FieldByName('CNTDEBEME').AsFloat:=DMCNT.cdsCntTemp.FieldByName('CNTMTOEXT').AsFloat;
     end
     else begin
        DMCNT.cdsMovCNT2.FieldByName('CNTHABEMN').AsFloat:=DMCNT.cdsCntTemp.FieldByName('CNTMTOLOC').AsFloat;
        DMCNT.cdsMovCNT2.FieldByName('CNTHABEME').AsFloat:=DMCNT.cdsCntTemp.FieldByName('CNTMTOEXT').AsFloat;
     end;
     DMCNT.cdsMovCNT2.FieldByName('CNTFEMIS').AsDateTime := wfedo;
     DMCNT.cdsMovCNT2.FieldByName('CNTFVCMTO').AsDatetime:= wfeve;
     DMCNT.cdsMovCNT2.FieldByName('CNTFCOMP').AsDateTime := wfeco;
     DMCNT.cdsMovCNT2.FieldByName('CNTESTADO').AsString  := DMCNT.cdsCntTemp.FieldByName('CNTESTADO').AsString;
     DMCNT.cdsMovCNT2.FieldByName('CNTCUADRE').AsString  := 'S';
     DMCNT.cdsMovCNT2.FieldByName('CNTFAUTOM').AsString  := '';
     DMCNT.cdsMovCNT2.FieldByName('CNTUSER').AsString    := DMCNT.cdsCntTemp.FieldByName('CNTUSER').AsString;
     DMCNT.cdsMovCNT2.FieldByName('CNTFREG').AsDateTime  := wfeco;
//   DMCNT.cdsMovCNT2CNTHReg.Value    := TIMe;
     DMCNT.cdsMovCNT2.FieldByName('CNTMM').AsString      := wmm;
//   DMCNT.cdsMovCNT2CNTDD.Value      := DMCNT.cdsMov CNTCNTDD.Value;
//   DMCNT.cdsMovCNT2CNTTri.Value     := DMCNT.cdsMov CNTCNTTri.Value;
//   DMCNT.cdsMovCNT2CNTSem.Value     := DMCNT.cdsMov CNTCNTSem.Value;
//   DMCNT.cdsMovCNT2CNTSS.Value      := DMCNT.cdsMov CNTCNTSS.Value;
//   DMCNT.cdsMovCNT2CNTAATri.Value   := DMCNT.cdsMov CNTCNTAATri.Value;
//   DMCNT.cdsMovCNT2CNTAASem.Value   := DMCNT.cdsMov CNTCNTAASem.Value;
//   DMCNT.cdsMovCNT2CNTAASS.Value    := DMCNT.cdsMov CNTCNTAASS.Value;
     DMCNT.cdsMovCNT2.FieldByName('TMONID').AsString     := '01';
end;

procedure TFResGralCta.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFResGralCta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMCNT.cdsCuenta.Close;
   DMCNT.cdsCuenta.IndexFieldNames :='';
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
   Action:=caFree;
end;

procedure TFResGralCta.dbdtpFReg1Exit(Sender: TObject);
begin
   If dbdtpFReg1.date=0 then
   begin
      dbdtpFReg1.SetFocus;
      showmessage('Error : Falta Registrar Fecha');
      Raise Exception.Create('Error : Falta Registrar Fecha');
   end;
end;

procedure TFResGralCta.dbdtpFReg2Exit(Sender: TObject);
begin
   If dbdtpFReg2.date=0 then
   begin
      dbdtpFReg2.SetFocus;
      ShowMessage(' Error : Falta Registrar Fecha ');
      Raise Exception.Create(' Error : Falta Registrar Fecha ');
   end;
   If dbdtpFReg2.date<dbdtpFReg1.date then
   begin
      dbdtpFReg2.SetFocus;
      ShowMessage(' Error : Fecha ser Mayor ');
      Raise Exception.Create(' Error : Fecha ser Mayor ');
   end;

   rgMoneda.Enabled    :=True ;
   //gbParametros.Enabled:=True ;

end;

procedure TFResGralCta.gbPerExit(Sender: TObject);
var
   xFecha1, xFecha2 : TDateTime;
begin
   xFecha1 := strtodate('01/'+DMCNT.strZero(speMM.Text,2)+'/'+speAno.Text);
   if strtofloat(speMM.Text)+1=13 then
   begin
      xFecha2 := strtodate('01/01/'+ FloatToStr(StrToFloat(speAno.Text)+1));
   end
   else begin
      xFecha2:=strtodate('01/'+DMCNT.strZero(floattostr(strtofloat(speMM.Text)+1),2)+'/'+speAno.Text);
   end;
   xFecha2:=xFecha2-1;
   dbdtpFReg1.date:=xFecha1;
   dbdtpFReg2.date:=xFecha2;
end;

procedure TFResGralCta.FormShow(Sender: TObject);
var
   xAno, xMes, xDia : word;
begin
//wmc0204   DMCNT.DCOM1.AppServer.ParamDSPGraba( '0', 'MOVCNT' );
   sLink:='@dbprodlee ';
   sLink:=' ';
   DMCNT.Filtracds( DMCNT.cdsNivel,'' );
   DMCNT.cdsNivel.IndexFieldNames   := 'NIVEL';
   DMCNT.cdsCuenta.IndexFieldNames:='CUENTAID';
   DMCNT.cdsCuenta.Open;
   DMCNT.cdsNivel.Last;
   dblcCia.Text     := '' ;
   DecodeDate(Date, xAno, xMes, xDia);
   speAno.Value:=xAno;
   speMM.Value:=xMes;
   gbPerExit(Self);
   DMCNT.cdsCia.Filtered := False     ;
   if not DMCNT.cdsCia.Active then
      DMCNT.cdsCia.Open ;
   if DMCNT.cdsCia.RecordCount = 1 then
   begin
      dblcCia.Text := DMCNT.cdsCia.fieldbyname('CIAID').AsString ;
      edtCia.Text  := DMCNT.cdsCia.fieldbyname('CIADES').AsString ;
   end ;
   rgCuentaSola.itemindex := 0;
   perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFResGralCta.pprBalComprobPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;

end;

procedure TFResGralCta.ppSaldoAntPrint(Sender: TObject);
begin
//     ppSaldoAnt.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFResGralCta.ppDEBEPrint(Sender: TObject);
begin
//     ppDEBE.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFResGralCta.ppHABERPrint(Sender: TObject);
begin
//     ppHABER.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFResGralCta.ppReport1PreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;

end;

procedure TFResGralCta.ppVariable1Calc(Sender: TObject; var Value: Variant);
Var
   xD, xH, xS: DOUBLE;
begin
   ppDEBE.DisplayFormat:='';
   ppHABER.DisplayFormat:='';
   ppVariable1.DisplayFormat:='';
   ppdbtSaldAntMN.DisplayFormat:='';
   if ppdbtSaldAntMN.text='' then xS:=0 else xS:=StrToFloat(ppdbtSaldAntMN.text);
   if ppDEBE.Text=''         then xD:=0 else xD:=strtofloat(ppDEBE.Text);
   if ppHABER.Text=''        then xH:=0 else xH:=strtofloat(ppHABER.Text);
   Value:= xS + (xD-xH);
   ppVariable1.DisplayFormat:='###,###,###,##0.00';
   ppDEBE.DisplayFormat:='###,###,###,##0.00';
   ppHABER.DisplayFormat:='###,###,###,##0.00';
   ppdbtSaldAntMN.DisplayFormat:='###,###,###,##0.00';
end;

procedure TFResGralCta.ppDBCalc2Calc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
//     ppDBCalc2.Value := ppDBCalc2.Value + DMCNT.cdsQry.fieldbyname('DEBEMN').AsFloat;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = DMCNT.cdsNivel.fieldbyname('NIVEL').AsString) or
       (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
//    ppDBCalc2.Value := ppDBCalc2.Value + DMCNT.cdsQry.fieldbyname('DEBEMN').AsFloat;
   end;
end;

procedure TFResGralCta.ppDBCalc3Calc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
//    ppDBCalc3.Value := ppDBCalc3.Value + DMCNT.cdsQry.fieldbyname('HABEMN').AsFloat;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = '6') or
       (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
//    ppDBCalc3.Value := ppDBCalc3.Value + DMCNT.cdsQry.fieldbyname('HABEMN').AsFloat;
   end;
end;

procedure TFResGralCta.ppDBCalc1Calc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
//     ppDBCalc1.Value := ppDBCalc1.Value + DMCNT.cdsQry.fieldbyname('DEBEME').AsFloat;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = DMCNT.cdsNivel.fieldbyname('NIVEL').AsString) or
       (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
//     ppDBCalc1.Value := ppDBCalc1.Value + DMCNT.cdsQry.fieldbyname('DEBEME').AsFloat;
   end;
end;

procedure TFResGralCta.ppDBCalc4Calc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
//    ppDBCalc4.Value := ppDBCalc4.Value + DMCNT.cdsQry.fieldbyname('HABEME').AsFloat;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = DMCNT.cdsNivel.fieldbyname('NIVEL').AsString) or
       (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
//    ppDBCalc4.Value := ppDBCalc4.Value + DMCNT.cdsQry.fieldbyname('HABEME').AsFloat;
   end;
end;

procedure TFResGralCta.ppDBCalc5Calc(Sender: TObject);
begin
  ppDBCalc5.DisplayFormat := '';
  If xNivel ='0' then
   begin
//    If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
//     begin
      If rgMoneda.ItemIndex = 0 then
       ppDBCalc5.Value := ppDBCalc5.Value + DMCNT.cdsQry.fieldbyname('DEBEMN').AsFloat
      else
       ppDBCalc5.Value := ppDBCalc5.Value + DMCNT.cdsQry.fieldbyname('DEBEME').AsFloat;
//     end;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = DMCNT.cdsNivel.fieldbyname('NIVEL').AsString) or
       (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
      If rgMoneda.ItemIndex = 0 then
       ppDBCalc5.Value := ppDBCalc5.Value + DMCNT.cdsQry.fieldbyname('DEBEMN').AsFloat
      else
       ppDBCalc5.Value := ppDBCalc5.Value + DMCNT.cdsQry.fieldbyname('DEBEME').AsFloat
     end;
   end;
  ppDBCalc5.DisplayFormat := '###,###,##0.00';
end;

procedure TFResGralCta.ppDBCalc6Calc(Sender: TObject);
begin
 ppDBCalc6.DisplayFormat := '';
 If xNivel ='0' then
   begin
//    If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
//     begin
      If rgMoneda.ItemIndex = 0 then
       ppDBCalc6.Value := ppDBCalc6.Value + DMCNT.cdsQry.fieldbyname('HABEMN').AsFloat
      else
       ppDBCalc6.Value := ppDBCalc6.Value + DMCNT.cdsQry.fieldbyname('HABEME').AsFloat
//     end;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = DMCNT.cdsNivel.fieldbyname('NIVEL').AsString) or
       (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
      If rgMoneda.ItemIndex = 0 then
       ppDBCalc6.Value := ppDBCalc6.Value + DMCNT.cdsQry.fieldbyname('HABEMN').AsFloat
      else
       ppDBCalc6.Value := ppDBCalc6.Value + DMCNT.cdsQry.fieldbyname('HABEME').AsFloat
      end;
   end;
  ppDBCalc6.DisplayFormat := '###,###,##0.00';
end;

procedure TFResGralCta.ppVariable2Calc(Sender: TObject;
  var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
   ppdbtSaldAntMN.DisplayFormat:='';
   Value:= StrToFloat(ppdbtSaldAntMN .text) + (xD-xH);
   ppdbtSaldAntMN.DisplayFormat:='###,###,###,##0.00';
end;


procedure TFResGralCta.ppdbtADEBEPrint(Sender: TObject);
begin
//  ppdbtADEBE.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFResGralCta.ppdbtAHABEPrint(Sender: TObject);
begin
//  ppdbtAHABE.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFResGralCta.ppDetailBand2BeforePrint(Sender: TObject);
begin
   If Length(trim(ppDBText2.text)) = 2 then
    begin
     ppDBText2.Font.Style := [fsBold];
     ppDBText3.Font.Style := [fsBold];
     ppDEBE.Font.Style := [fsBold];
     ppHABER.Font.Style := [fsBold];
     ppVariable1.Font.Style := [fsBold];
     ppdbtSaldAntMN.Font.Style := [fsBold];
//     ppdbcSaldAntMN.Font.Style := [fsBold];
    end
   else
    begin
     ppDBText2.Font.Style := [];
     ppDBText3.Font.Style := [];
     ppDEBE.Font.Style := [];
     ppHABER.Font.Style := [];
     ppVariable1.Font.Style := [];
     ppdbtSaldAntMN.Font.Style := [];
//     ppdbcSaldAntMN.Font.Style := [];
    end
end;

procedure TFResGralCta.Z2bbtnSelCuentaSolaClick(Sender: TObject);
begin
   FSelCuenta.sCia:=dblcCia.text;
   FSelCuenta.xRg := '1';
   FSelCuenta.ShowModal;
end;

procedure TFResGralCta.rgCuentaSolaClick(Sender: TObject);
begin
  If rgCuentasola.Itemindex = 0 then
  Begin
   Z2bbtnSelCuentaSola.enabled := False;
   gbRangos.Enabled:=False;
   dblcdDesde.Text:='';
   dblcdHasta.Text:='';
   dblcdDesde.Enabled:=False;
   dblcdHasta.Enabled:=False;
  End;
  If rgCuentasola.Itemindex = 1 then
  Begin
   Z2bbtnSelCuentaSola.enabled := False;
   gbRangos.Enabled:=True;
   dblcdDesde.Text:='';
   dblcdHasta.Text:='';
   dblcdDesde.Enabled:=True;
   dblcdHasta.Enabled:=True;
  End;
  If rgCuentasola.Itemindex = 2 then
  Begin
   Z2bbtnSelCuentaSola.enabled := True;
   Z2bbtnSelCuentaSola.Click;
   gbRangos.Enabled:=False;
   dblcdDesde.Text:='';
   dblcdHasta.Text:='';
   dblcdDesde.Enabled:=False;
   dblcdHasta.Enabled:=False;
  End;
end;

procedure TFResGralCta.dblcdDesdeDropDown(Sender: TObject);
begin
  dblcdDesde.SearchField:='CUENTAID';
end;

procedure TFResGralCta.dblcdHastaDropDown(Sender: TObject);
begin
  dblcdHasta.SearchField:='CUENTAID';
end;

procedure TFResGralCta.dblcdDesdeExit(Sender: TObject);
begin
    xWhere := 'CUENTAID='+QuotedStr(dblcdDesde.Text)+' and CIAID='+''''+dblcCia.Text+'''' ;
    if (DMCNT.DisplayDescrip('PrvTGE','TGE202','CTA_MOV',xWhere,'CTA_MOV')<>'S')
       and  (DMCNT.DisplayDescrip('PrvTGE','TGE202','CTA_DET',xWhere,'CTA_DET')<>'S') then
    begin
      dblcdDesde.Text:='';
      dblcdDesde.SetFocus;
      Showmessage('La Cuenta No es de Movimiento') ;
    end;
end;

procedure TFResGralCta.dblcdHastaExit(Sender: TObject);
begin
    xWhere := 'CUENTAID='+QuotedStr(dblcdHasta.Text)+' and CIAID='+''''+dblcCia.Text+'''' ;
    if (DMCNT.DisplayDescrip('PrvTGE','TGE202','CTA_MOV',xWhere,'CTA_MOV')<>'S')
       AND (DMCNT.DisplayDescrip('PrvTGE','TGE202','CTA_DET',xWhere,'CTA_DET')<>'S') then
    begin
      dblcdHasta.Text:='';
      dblcdHasta.SetFocus;
      Showmessage('La Cuenta No es de Movimiento') ;
    end;

end;

procedure TFResGralCta.bbtnCancClick(Sender: TObject);
begin
   Close;
end;

procedure TFResGralCta.bbtnExcel1Click(Sender: TObject);
Var
  xSQL,xWhere2,xMes,wMesAnt: String;
  CampoDMN,CampoHMN,CampoSMN,CampoDME,CampoHME,CampoSME: String;
  sMon,sWhere,sDebe,sHabe{,sHaving} : string;
  i:integer;
  xCuentas : Array[1..250] of string;
  xDigi,xZ,xConCuen,xLength : Integer;
  xCuenta,xEntero,xCuentas1,xDesde,xHasta : String;
  xAncho:Integer;
  // vhn
  sCtaLog : String;
begin
  DMCNT.cdsQry.indexFieldNames :='';
  DMCNT.cdsQry.filter := '';
  DMCNT.cdsQry.Filtered := True;
  xWhere2:='';
  if edtCia.Text='' then
  begin
  	showmessage('Compañia no válida');
    raise exception.Create('Compañia no válida');
  end ;

  //** 02/05/2001 - pjsv, para saber si es de ultimo nivel, para sumar solo
  // las ctas. de mov. sino suma todas las del nivel + las de mov. que hubieran
  xnivel :='';
  xsql :='';

  // vhn
  sCtaLog:='';
  if (rgCuentaSola.ItemIndex=2) and (FSelCuenta.cdsClone.recordcount>0) then
   begin
     xCuentas1:= ' and cnt401.CUENTAID IN (' ;
     sCtaLog  := 'CUENTAID IN ( ' ;
     with FSelCuenta.cdsClone do
      begin
       FSelCuenta.cdsClone.First ;
       while not FSelCuenta.cdsClone.Eof do
        begin
         DMCNT.cdsNivel.First;
         while not DMCNT.cdsNivel.Eof do
          begin
           xCuentas1:=xCuentas1+''''+Copy(FSelCuenta.cdsClone.fieldbyname('CUENTAID').AsString, 1, DMCNT.cdsNivel.FieldByname('DIGITOS').AsInteger ) + '''';
           sCtaLog  :=sCtaLog  +Copy(FSelCuenta.cdsClone.fieldbyname('CUENTAID').AsString, 1, DMCNT.cdsNivel.FieldByname('DIGITOS').AsInteger );
           DMCNT.cdsNivel.Next;
           if not DMCNT.cdsNivel.eof then
           begin
              xCuentas1:= xCuentas1+ ' , ' ;
              sCtaLog  := sCtaLog  + ', ' ;
           end;
          end;
         FSelCuenta.cdsClone.Next ;
         if not FSelCuenta.cdsClone.eof then
         begin
            xCuentas1:= xCuentas1+ ' , ' ;
            sCtaLog  := sCtaLog  + ', ' ;
         end;
        end;
      end;
     xCuentas1:= xCuentas1+ ' ) ';
     sCtaLog  := sCtaLog  + ' )';
   end ;

  // CLG 11/07/2001 ACUMULADO DEL DEBE Y HABER
  if rgMoneda.ItemIndex=1 then  // CUANDO ES MONDEDA EXTRANJERA
  begin
     sMon:='ME';
     sWhere:='TMON_LOC=''E''';
  end
  else
  begin
  	  sMon:='MN';
     sWhere:='TMON_LOC=''L''';
  end;

  for i:=1 to StrToInt(speMM.text) do
  begin
      sDebe:=sDebe+wReplacCeros+'(DEBE'+sMon+DMCNT.StrZero(IntToStr(i),2)+',0)+';
      sHabe:=sHabe+wReplacCeros+'(HABE'+sMon+DMCNT.StrZero(IntToStr(i),2)+',0)+';
  end;
  //QUITAR EL ULTIMO + DE LA CADENA

  if Length( sDebe )=0 then
  begin
     sDebe:=sDebe+' 0.00 ';
     sHabe:=sHabe+' 0.00 ';
  end;
  
  sDebe:=Copy(sDebe,1,Length(sDebe)-1);
  sHabe:=Copy(sHabe,1,Length(sHabe)-1);

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    sDebe:=sDebe+' ADEBE, ';
    sHabe:=sHabe+' AHABE, ';
  end
  else
  begin
    sDebe:=sDebe+' ADEBE, ';
    sHabe:=sHabe+' AHABE, ';
  end;

  xnivel :='';
  xsql :='';

  if (SRV_D = 'DB2NT') or	 (SRV_D = 'DB2400') then
//    xsql := 'NIVEL='+quotedstr('0'+IntToStr(StrToInt(dblcNivel.text)-1))
  else
    xsql := 'NIVEL='+quotedstr(IntToStr(StrToInt(DMCNT.cdsNivel.fieldbyname('NIVEL').AsString)-1));

  if DMCNT.DisplayDescrip('PrvTGE','CNT202','*',xsql,'NIVEL') = '' then
  	xnivel := '0'
  else
  	xnivel := '1';

  xWhere:='cnt401.CIAID='+''''+dblcCia.Text+''''
        +' and cnt401.ANO='+''''+speAno.Text+''''
        +' and cnt401.TIPO<='+quotedstr(DMCNT.cdsNivel.fieldbyname('NIVEL').AsString)
        + ' AND (cnt401.auxid IS NULL OR cnt401.auxid='''') '
        + ' AND (cnt401.ccosid is null or cnt401.ccosid='''')'
        + ' AND length(cnt401.cuentaid) <> 1' ;


   if sCiaCuenta<>'' then
      xWhere:=xWhere+' and cnt401.'+sCiaCuenta;



   if rgCuentaSola.ItemIndex = 1 then
   begin
      If Length(dblcdDesde.Text)=0 Then
      Begin
        showmessage('Debe seleccionar la Cuenta de Inicio');
        dblcdDesde.SetFocus;
        exit;
      End;
      If Length(dblcdHasta.Text)=0 Then
      Begin
        showmessage('Debe seleccionar la Cuenta de Fin');
        dblcdHasta.SetFocus;
        exit;
      End;

      If Length(dblcdDesde.Text)>Length(dblcdHasta.Text) Then
      Begin
        xAncho:=Length(dblcdHasta.Text);
      End
      Else
      Begin
        xAncho:=Length(dblcdDesde.Text);
      End;

      If StrToInt(Copy(dblcdDesde.Text,1,xAncho))>StrToInt(Copy(dblcdHasta.Text,1,xAncho)) Then
      Begin
        showmessage('La Cuenta Inicio debe ser Menor a la Cuenta Fin');
        dblcdDesde.SetFocus;
        exit;
      End;
      If StrToInt(Copy(dblcdHasta.Text,1,xAncho))<StrToInt(Copy(dblcdDesde.Text,1,xAncho)) Then
      Begin
        showmessage('La Cuenta de Fin debe ser Mayor que la Cuenta de Inicio');
        dblcdHasta.SetFocus;
        exit;
      End;

     //xDesde:=Copy(TRIM(dblcdDesde.Text),1,2);

     xDesde:=TRIM(dblcdDesde.Text);
     xHasta:=TRIM(dblcdHasta.Text);

     xCuentas1:=' and ( cnt401.CUENTAID IN (' ;
     sCtaLog  :='';

     DMCNT.cdsNivel.First;
     while not DMCNT.cdsNivel.Eof do
     begin
        xCuentas1:=xCuentas1+''''+Copy( xDesde, 1, DMCNT.cdsNivel.FieldByname('DIGITOS').AsInteger )+'''';
        DMCNT.cdsNivel.Next;
        if not DMCNT.cdsNivel.eof then
           xCuentas1:= xCuentas1+ ', ' ;
     end;
     xCuentas1:= xCuentas1 + ' ) ';

     xWhere:=xWhere+xCuentas1+ ' or ( CNT401.CUENTAID BETWEEN '+QuotedStr(xDesde)+' AND '+QuotedStr(xHasta)+') )';
     sCtaLog :='CUENTAID BETWEEN '+xDesde+' AND '+xHasta;
  end;

  xMes:=speMM.Text;
  if (StrToInt(xmes) - 1) <= 9 then
  	wMesAnt := '0' + inttostr((StrToInt(xmes) - 1))
  else
  	wMesAnt := inttostr((StrToInt(xmes) - 1));


  if length(xMes)<2 then xMes := '0'+xMes;

     //** 17/04/2001 - pjsv
     if wMesAnt='0-1' then
     begin
        wMesAnt:='00';
        CampoSME := '0.00 '; // wmes
        CampoSMN := '0.00 '; // wmes
     end
     else
     begin
        CampoSME := 'SALDME'+wMesAnt; // wmes
        CampoSMN := 'SALDMN'+wMesAnt; // wmes
     end;
     //**
     CampoDMN := 'DEBEMN'+xMes;
     CampoHMN := 'HABEMN'+xMes;
     CampoDME := 'DEBEME'+xMes;
     CampoHME := 'HABEME'+xMes;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
    begin
     xSQL:='Select cnt401.CUENTAID, cnt401.CTADES, '
        +CampoSMN+' as SALDMN, '
        +CampoDMN+' as DEBEMN, '
        +CampoHMN+' as HABEMN, '
        +CampoSME+' as SALDME, '
        +CampoDME+' as DEBEME, '
        +CampoHME+' as HABEME, '
        +sDebe+sHabe
        +' TGE202.CTA_DET,cnt401.TIPO'
        +' From cnt401 '
        +' LEFT JOIN TGE202 ON (cnt401.CUENTAID = TGE202.CUENTAID AND cnt401.CIAID = TGE202.CIAID) Where ';
        xSQL:=xSQL+xWhere;
        For xZ := 1 to 250 do
         begin
          If xCuentas[xZ] <> '' then
           If xCuenta = '' then
            xCuenta := quotedstr(xCuentas[xZ])
           else xCuenta := xCuenta + ','+quotedstr(xCuentas[xZ]);
         end;
      If xCuenta <> '' then
       xSQL:=xSQL + ' AND cnt401.CUENTAID IN ('+xCuenta+')';
      xSQL:=xSQL +' ORDER BY cnt401.CUENTAID' ;
    end
   else
    if SRV_D = 'ORACLE' then
     begin
      xSQL:='Select cnt401.CUENTAID, TGE202.CTADES, '
        +CampoSMN+' SALDMN, '
        +CampoDMN+' DEBEMN, '+CampoHMN+' HABEMN, '
        +CampoSME+' SALDME, '
        +CampoDME+' DEBEME, '+CampoHME+' HABEME, '+sDebe+sHabe
        +' TGE202.CTA_DET, cnt401.TIPO'
        +' From cnt401, TGE202 '
        +' Where (cnt401.CUENTAID = TGE202.CUENTAID(+)) AND (cnt401.CIAID = TGE202.CIAID(+)) AND ';//+sHaving+' <> 0 AND ';
      xSQL:=xSQL+xWhere;
      If ( Length(xCuentas1)>0) and (rgCuentaSola.ItemIndex<>1) then
         xSql := xSql + '  '+xCuentas1;
      xsql := xsql + ' ORDER BY CUENTAID ' ;
     end;
    DMCNT.cdsQry.Close;
    DMCNT.cdsQry.ProviderName:='prvCNT';
    DMCNT.cdsQry.DataRequest(xSQL);
    DMCNT.cdsQry.Open;
    DMCNT.cdsQry.Filter:='SALDMN<>0.00 or DEBEMN <>0.00 or HABEMN <>0.00 or DEBEME <>0.00 or HABEME <>0.00 or ADEBE <>0.00 or AHABE <>0.00';
    DMCNT.cdsQry.Filtered:=True;
   if DMCNT.cdsQry.RecordCount = 0 then
    begin
     DMCNT.cdsQry.Filter:='';
     DMCNT.cdsQry.Filtered:=True;
     Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas') ;
    end                                                  ;
   DMCNT.cdsQry.First;
   case rgMoneda.ItemIndex of
    -1: begin
           ShowMessage('Ingrese Tipo de Moneda a Listar');
           rgMoneda.SetFocus;
           Exit;
        end;
    0 : begin // local
          ppReport1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\ResGralCta.rtm';
          ppReport1.template.LoadFromFile ;
          ppTituloMoneda.Caption  :='MONEDA LOCAL' ;
          ppdbtSaldAntMN.DataField:='SALDMN' ;
          ppDEBE.DataField        :='DEBEMN' ;
          ppHABER.DataField       :='HABEMN' ;
        end;
    1 : begin  // Extranjera
          ppReport1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\ResGralCta.rtm';
          ppReport1.template.LoadFromFile ;
          ppTituloMoneda.Caption  :='MONEDA EXTRANJERA' ;
          ppdbtSaldAntMN.DataField:='SALDME' ;
          ppDEBE.DataField        :='DEBEME' ;
          ppHABER.DataField       :='HABEME' ;
        end;
   end;
  Screen.Cursor:=crDefault;

  dtgData.DataSource:=DMCNT.dsQry;

   If DMCNT.cdsQry.RecordCount > 0 Then
   begin
      try

         DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Resumen General por Cuenta',
                     dblcCia.Text,                                  // Campañía
                     speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
                     dbdtpFReg1.Text, dbdtpFReg2.Text,              // Fecha   Inicio - final
                     '',  '',                                       // Nivel   - Origen
                     '', inttostr(rgMoneda.itemindex),              // Lote    -  Moneda
                     sCtaLog, '',                              // Cuentas - Auxiliares
                     '', 'Excel',                               // Costos - Tipo Salida
                     '' );               // Tipo Rep

         DMCNT.HojaExcel('ANALISIS DE AUXILIARES',DMCNT.dsQry, dtgData);
      except
         		on Ex: Exception do
          			Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
      end;
   end
   else
      MessageDlg('No existe información para esta Consulta ', mtInformation,[mbOk],0);


   DMCNT.cdsQry.CancelUpdates;
   DMCNT.cdsQry.IndexFieldNames:='';
   DMCNT.cdsQry.Filter:='';
   DMCNT.cdsQry.Filtered:=True;

end;

procedure TFResGralCta.sbDisenoRepClick(Sender: TObject);
begin
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
end;

end.


