unit CNT318;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, wwdbdatetimepicker, wwdblook, Buttons, Mask, wwdbedit,
  Spin, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppProd, ppReport,
  ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, Grids, Wwdbigrd, Wwdbgrid ,ppViewr,
  oaPrintTexto, ppTypes, oaVariables;

type
  TFBalGeneral = class(TForm)
    pnlMayorAn: TPanel;
    lblCia: TLabel;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    rgMoneda: TRadioGroup;
    gbLPar: TGroupBox;
    gbCtas: TGroupBox;
    edtCta1: TEdit;
    edtCta2: TEdit;
    edtCta3: TEdit;
    ckCtas: TCheckBox;
    ppdbBalComprob: TppDBPipeline;
    gbNivel: TGroupBox;
    dblcNivel: TwwDBLookupCombo;
    ckTDiario: TCheckBox;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    gbPer: TGroupBox;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    Label2: TLabel;
    dbdtpFReg1: TwwDBDateTimePicker;
    dbdtpFReg2: TwwDBDateTimePicker;
    pprBalComprobUnaMoneda: TppReport;
    ckTit: TCheckBox;
    edtTit: TEdit;
    ppHeaderBand2: TppHeaderBand;
    ppLabel8: TppLabel;
    pplblTitulo2: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel20: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel21: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel23: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel29: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    pplblPeriodo2: TppLabel;
    ppLabel46: TppLabel;
    ppLabel10: TppLabel;
    ppLabel13: TppLabel;
    ppLabel44: TppLabel;
    ppLabel49: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    pplCia2: TppLabel;
    ppLabel59: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel19: TppLabel;
    ppLabel35: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDEBE: TppDBText;
    ppHABER: TppDBText;
    ppSALDOD: TppDBText;
    ppSALDOH: TppDBText;
    ppISALDOD: TppDBText;
    ppISALDOH: TppDBText;
    ppESALDOH: TppDBText;
    ppESALDOD: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLabel47: TppLabel;
    ppdbcADEBE: TppDBCalc;
    ppdbcAHABE: TppDBCalc;
    ppdbcASALDOD: TppDBCalc;
    ppdbcASALDOH: TppDBCalc;
    ppdbcISALDOD: TppDBCalc;
    ppdbcISALDOH: TppDBCalc;
    ppdbcESALDOD: TppDBCalc;
    ppdbcESALDOH: TppDBCalc;
    IDIFD: TppVariable;
    IDIFH: TppVariable;
    ppdbcHABe: TppDBCalc;
    ppdbcDEBE: TppDBCalc;
    ppdbcDEBEANT: TppDBCalc;
    ppdbcHABEANT: TppDBCalc;
    IDIFD1: TppVariable;
    IDIFH1: TppVariable;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppLabel48: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel2: TppLabel;
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure ckCtasClick(Sender: TObject);
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
    procedure dblcTDiarioExit(Sender: TObject);
    procedure ckTDiarioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbdtpFReg1Exit(Sender: TObject);
    procedure dbdtpFReg2Exit(Sender: TObject);
    procedure gbPerExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pprBalComprobPreviewFormCreate(Sender: TObject);
    procedure ppSaldoAntPrint(Sender: TObject);
    procedure ppDEBEPrint(Sender: TObject);
    procedure ppHABERPrint(Sender: TObject);
    procedure pprBalComprobUnaMonedaPreviewFormCreate(Sender: TObject);
    procedure IDIFDCalc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc5Calc(Sender: TObject);
    procedure ppDBCalc6Calc(Sender: TObject);
    procedure ppVariable2Calc(Sender: TObject; var Value: Variant);
    procedure ppdbtADEBEPrint(Sender: TObject);
    procedure ppdbtAHABEPrint(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure ppdbcADEBECalc(Sender: TObject);
    procedure ppdbcAHABECalc(Sender: TObject);
    procedure ppdbcASALDODCalc(Sender: TObject);
    procedure ppdbcASALDOHCalc(Sender: TObject);
    procedure ppdbcISALDODCalc(Sender: TObject);
    procedure ppdbcISALDOHCalc(Sender: TObject);
    procedure ppdbcESALDODCalc(Sender: TObject);
    procedure ppdbcESALDOHCalc(Sender: TObject);
    procedure IDIFHCalc(Sender: TObject; var Value: Variant);
    procedure EDIFDCalc(Sender: TObject; var Value: Variant);
    procedure EDIFHCalc(Sender: TObject; var Value: Variant);
    procedure ppdbcDEBECalc(Sender: TObject);
    procedure ppdbcHABeCalc(Sender: TObject);
    procedure ppdbcHABEANTCalc(Sender: TObject);
    procedure ppdbcDEBEANTCalc(Sender: TObject);
    procedure IDIFD1Calc(Sender: TObject; var Value: Variant);
    procedure IDIFH1Calc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc9Calc(Sender: TObject);
    procedure ppDBCalc10Calc(Sender: TObject);
    procedure ppDBCalc11Calc(Sender: TObject);
    procedure ppDBCalc12Calc(Sender: TObject);
    procedure ppDBCalc13Calc(Sender: TObject);
    procedure ppDBCalc14Calc(Sender: TObject);
    procedure ppDBCalc15Calc(Sender: TObject);
    procedure ppDBCalc16Calc(Sender: TObject);
  private
    { Private declarations }
    xnivel : string;
  public
    { Public declarations }
  end;


var
  FBalGeneral: TFBalGeneral;
  Year, Month, Day: Word;
  xwhere, anomm : string;

  // Variables para procesos de transferencia (temporales)
   wtdi, wnumco, wano, wper, wnumdo, wmm: String;
   wfedo, wfeve, wfeco: tDate;

implementation

uses CNTDM, CNT998;

{$R *.DFM}


procedure TFBalGeneral.dblcCiaExit(Sender: TObject);
begin
   if (bbtnCanc.Focused) then exit;
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DM1.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   end;
end;


procedure TFBalGeneral.bbtnOkClick(Sender: TObject);
Var
  xWhere2,xMes,wMesAnt: String;
  xSQL:AnsiString;
  CampoH,CampoS,CampoD: String;
  sSaldoD,sSaldoH,sISaldoD,sISaldoH,sESaldoD,sESaldoH:string;
  sMon,sWhere,sDebe,sDebeAnt,sHabe,sHabeAnt,sHaving:string;
  i:integer;
begin
  dm1.cdsqry.IndexFieldNames := '';
  dm1.cdsqry.filter := '';
  dm1.cdsqry.Filtered := True;
	xWhere2:='';
  if edtCia.Text='' then
  begin
  	showmessage('Compañia no válida');
    raise exception.Create('Compañia no válida');
  end ;

  if dblcNivel.Text=''
  then
  begin
    ShowMessage('Seleccione un Nivel de Detalle de Cuenta');
    raise exception.Create('Seleccione un Nivel de Detalle de Cuenta');
  end ;

  if (ckTDiario.Checked) and (edtTDiario.Text='')
  then
  begin
    ShowMessage('Seleccione un Tipo de Diario');
    raise exception.Create('Seleccione un Tipo de Diario');
  end ;
  //** 02/05/2001 - pjsv, para saber si es de ultimo nivel, para sumar solo
  // las ctas. de mov. sino suma todas las del nivel + las de mov. que hubieran
  Screen.Cursor:=crHourGlass;
  xnivel :='';
  xsql :='';
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

  // ACUMULADO INCLUYENDO EL MES ACTUAL
//  for i:=1 to StrToInt(speMM.text) do
  for i:=0 to StrToInt(speMM.text) do
  begin
  	sDebe:=sDebe+wReplacCeros+'(DEBE'+sMon+DM1.StrZero(IntToStr(i),2)+',0)+';
    sHabe:=sHabe+wReplacCeros+'(HABE'+sMon+DM1.StrZero(IntToStr(i),2)+',0)+';
  end;
   //QUITAR EL ULTIMO + DE LA CADENA
  sDebe:=Copy(sDebe,1,Length(sDebe)-1);
  sHabe:=Copy(sHabe,1,Length(sHabe)-1);

  // SALDOS ANTERIORES
  for i:=0 to StrToInt(speMM.text)-1 do
  begin
  	sDebeAnt:=sDebeAnt+wReplacCeros+'(DEBE'+sMon+DM1.StrZero(IntToStr(i),2)+',0)+';
    sHabeAnt:=sHabeAnt+wReplacCeros+'(HABE'+sMon+DM1.StrZero(IntToStr(i),2)+',0)+';
  end;

  If StrToInt(speMM.text) - 1 > 0 then
   if StrToInt(speMM.text)=1 then
    begin
     sDebeAnt:=sDebeAnt+wReplacCeros+'(DEBE'+sMon+DM1.StrZero(IntToStr(i),2)+',0)+';
     sHabeAnt:=sHabeAnt+wReplacCeros+'(HABE'+sMon+DM1.StrZero(IntToStr(i),2)+',0)+';
   end;

   //QUITAR EL ULTIMO + DE LA CADENA
  sDebeAnt:=Copy(sDebeAnt,1,Length(sDebeAnt)-1);
  sHabeant:=Copy(sHabeAnt,1,Length(sHabeAnt)-1);
  sDebeAnt:=sDebeAnt+' ADEBEANT, ';
  sHabeAnt:=sHabeAnt+' AHABEANT, ';

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
		//    sHaving:='SUM('+sDebe+'+'+sHabe+') ';
		//    sDebe:='SUM('+sDebe+') ADEBE, ';
		//    sHabe:='SUM('+sHabe+') AHABE, ';
   	sSaldoD:=' CASE WHEN ('+sDebe+' - ('+sHabe+'))>0 THEN '+sDebe+' - ('+sHabe+') ELSE 0 END ASALDOD, ';
   	sSaldoh:=' CASE WHEN ('+sHabe+' - ('+sDebe+'))>0 THEN '+sHabe+' - ('+sDebe+') ELSE 0 END ASALDOH, ';

   	sISaldoD:=' CASE WHEN (TGE202.CTA_TIPO IN (''O'',''A'',''P'')) AND ('+sDebe+' - ('+sHabe+'))>0 THEN '+sDebe+' - ('+sHabe+') ELSE 0 END ISALDOD, ';
   	sISaldoH:=' CASE WHEN (TGE202.CTA_TIPO IN (''O'',''A'',''P'')) AND ('+sHabe+' - ('+sDebe+'))>0 THEN '+sHabe+' - ('+sDebe+') ELSE 0 END ISALDOH, ';

   	sESaldoD:=' CASE WHEN (TGE202.CTA_TIPO IN (''G'',''I'',''R'',''N'')) AND ('+sDebe+' - ('+sHabe+'))>0 THEN '+sDebe+' - ('+sHabe+') ELSE 0 END ESALDOD, ';
   	sESaldoH:=' CASE WHEN (TGE202.CTA_TIPO IN (''G'',''I'',''R'',''N'')) AND ('+sHabe+' - ('+sDebe+'))>0 THEN '+sHabe+' - ('+sDebe+') ELSE 0 END ESALDOH, ';

    sDebe:=sDebe+' ADEBE, ';
    sHabe:=sHabe+' AHABE, ';
  end
  else
  begin
		//sHaving:=sDebe+'+'+sHabe;

   	sSaldoD:=' DECODE(LEAST( ('+sDebe+' - ('+sHabe+')),0),0,'+sDebe+' - ('+sHabe+'), 0 ) ASALDOD, ';
   	sSaldoh:=' DECODE(LEAST( ('+sHabe+' - ('+sDebe+')),0),0,'+sHabe+' - ('+sDebe+'), 0 ) ASALDOH, ';

    sISaldoD:=' DECODE(LEAST(('+sDebe+' - ('+sHabe+')),0),0,DECODE(TGE202.CTA_TIPO,''A'','+sDebe+' - ('+sHabe+')),0,0) ISALDOD, ';
    sISaldoH:=' DECODE(LEAST(('+sHabe+' - ('+sDebe+')),0),0,DECODE(TGE202.CTA_TIPO,''A'','+sHabe+' - ('+sDebe+')),0,0) ISALDOH, ';


    sESaldoD:=' DECODE(LEAST(('+sDebe+' - ('+sHabe+')),0),0,DECODE(TGE202.CTA_TIPO,''R'','+sDebe+' - ('+sHabe+'),''R'','+sDebe+' - ('+sHabe+'),0),0) ESALDOD, ';
    sESaldoH:=' DECODE(LEAST(('+sHabe+' - ('+sDebe+')),0),0,DECODE(TGE202.CTA_TIPO,''R'','+sHabe+' - ('+sDebe+'),''R'','+sHabe+' - ('+sDebe+'),0),0) ESALDOH, ';

  	sDebe:=sDebe+' ADEBE, ';
  	sHabe:=sHabe+' AHABE, ';

  end;
  xnivel :='';
  xsql :='';

  if (SRV_D = 'DB2400') then
   	xsql := 'NIVEL='+quotedstr('0'+IntToStr(StrToInt(dblcNivel.text)+1))
  else
  	xsql := 'NIVEL='+quotedstr(IntToStr(StrToInt(dblcNivel.text)+1));

  If dm1.DisplayDescrip('PrvTGE','CNT202','*',xsql,'NIVEL') = '' then
  	xnivel := '0'
  else
  	xnivel := '1';

  xWhere:='CNT401.CIAID='+''''+dblcCia.Text+''''
        +' AND CNT401.ANO='+''''+speAno.Text+''''
        +' AND CNT401.TIPO<='+''''+dblcNivel.Text+''''
        //** 27/04/2001 - pjsv
        + ' AND (CNT401.AUXID IS NULL OR CNT401.AUXID='''') '
        + ' AND (CNT401.CCOSID IS NULL OR CNT401.CCOSID='''')'
        + ' AND LENGTH(CNT401.CUENTAID) <> 1' ;
        //**

  if (edtTDiario.Text<>'') then
  begin
  	xWhere2:='TDIARID='+''''+dblcTDiario.Text+'''';
    xWhere:=xWhere+' AND '+'('+xWhere2+')';
  end;

  if ckCtas.Checked then
  begin
  	if edtCta1.Text<>'' then xWhere2:=xWhere2+'CUENTAID='+''''+edtCta1.Text+'''';
    if (xWhere2<>'') and (edtCta2.Text<>'') then xWhere2:=xWhere2+' or ';
    if edtCta2.Text<>'' then xWhere2:=xWhere2+'CUENTAID='+''''+edtCta2.Text+'''';
    if (xWhere2<>'') and (edtCta3.Text<>'') then xWhere2:=xWhere2+' or ';
    if edtCta3.Text<>'' then xWhere2:=xWhere2+'CUENTAID='+''''+edtCta3.Text+'''';
    if xWhere2<>'' then xWhere:=xWhere+' and '+'('+xWhere2+')';
  end;

  xMes:=speMM.Text;

  If (StrToInt(xmes) - 1) <= 9 then
  	wMesAnt := '0' + inttostr((StrToInt(xmes) - 1));

  if length(xMes)<2 then xMes := '0'+xMes;

  //** 17/04/2001 - pjsv
  CampoS := ' SALD'+sMon+wMesAnt; // wmes
  CampoD := ' DEBE'+sMon+xMes;
  CampoH := ' HABE'+sMon+xMes;

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     if UpperCase( wRutaRpt )='RTMs\CNT\INCORESA' then begin
  	xSQL:='SELECT CNT401.CUENTAID, CNT401.CTADES, '
         + sDebeAnt+sHabeant+CampoD+' DEBE,'+CampoH+' HABE, '+sDebe+sHabe+sSaldoD+sSaldoH+sISaldoD+sISaldoH+sESaldoD+sESaldoH
      	 +' TGE202.CTA_DET, CNT401.TIPO'
	       +' FROM CNT401 '
  	     +' LEFT JOIN TGE202 ON ( CNT401.CIAID=TGE202.CIAID AND CNT401.CUENTAID=TGE202.CUENTAID) WHERE ';
  	xSQL:=xSQL+xWhere+ ' ORDER BY CNT401.CUENTAID';
     end
     else begin
  	xSQL:='SELECT CNT401.CUENTAID, CNT401.CTADES, '
//    	  +sDebe+sHabe+sSaldoD+sSaldoH+sISaldoD+sISaldoH+sESaldoD+sESaldoH
          +sDebeAnt+sHabeant+CampoD+' DEBE,'+CampoH+' HABE, '+sDebe+sHabe+sSaldoD+sSaldoH+sISaldoD+sISaldoH+sESaldoD+sESaldoH
      	+' TGE202.CTA_DET, CNT401.TIPO'
	      +' FROM CNT401 '
  	    +' LEFT JOIN TGE202 ON (CNT401.CIAID=TGE202.CIAID AND CNT401.CUENTAID = TGE202.CUENTAID) WHERE ';
  	xSQL:=xSQL+xWhere+ ' ORDER BY CNT401.CUENTAID';
     end;
  end
  else
  if SRV_D = 'ORACLE' then
  begin
   	xSQL:='SELECT CNT401.CUENTAID, CNT401.CTADES, '
       +sDebeAnt+sHabeant+CampoD+' DEBE,'+CampoH+' HABE, '+sDebe+sHabe+sSaldoD+sSaldoH+sISaldoD+sISaldoH+sESaldoD+sESaldoH
       +' TGE202.CTA_DET, CNT401.TIPO'
       +' FROM CNT401, TGE202'
       +' WHERE (CNT401.CUENTAID = TGE202.CUENTAID(+)) AND (CNT401.CIAID = TGE202.CIAID(+)) AND ';//+sHaving+' <> 0 AND ';
   	xSQL:=xSQL+xWhere;
   	xsql := xsql + ' ORDER BY CNT401.CUENTAID';
  end;

  DM1.cdsQry.Close;
  DM1.cdsQry.ProviderName:='prvCNT';
  DM1.cdsQry.DataRequest(xSQL);
  DM1.cdsQry.Open;
  DM1.cdsQry.Filter:=' ADEBE <>0.00 or AHABE <>0.00 ';
  DM1.cdsQry.Filtered:=True;
  If DM1.cdsQry.RecordCount = 0 then
  begin
  	Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas') ;
  	DM1.cdsQry.Filter:='';
  	DM1.cdsQry.Filtered:=True;
  end;
  DM1.cdsQry.First;
  Screen.Cursor:=crDefault;
  if rgMoneda.ItemIndex= -1 then begin
  	 ShowMessage('Ingrese Tipo de Moneda');
     rgMoneda.SetFocus;
     Exit;
  end;

  //  VHN 12/12/2001 - Para imprimir en Texto
  FImpresion := TFImpresion.Create( Self );
  FImpresion.ShowModal;
  if FImpresion.wFlTexto='C' then begin
     pprBalComprobUnaMoneda.Stop;
     DM1.cdsQry.CancelUpdates;
     DM1.cdsQry.IndexFieldNames:='';
     DM1.cdsQry.Filter:='';
     DM1.cdsQry.Filtered:=True;
     Exit;
  end;
  if FImpresion.wFlTexto='G' then
     pprBalComprobUnaMoneda.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\BalGeneral.rtm';
  if FImpresion.wFlTexto='T' then
     pprBalComprobUnaMoneda.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\BalGeneralTX.rtm';

  pprBalComprobUnaMoneda.template.LoadFromFile ;

  pplCia2.Caption:=edtCia.Text;
  pplblTitulo2.Caption:=edtTit.Text;
  pplblPeriodo2.Caption:=speAno.Text+xMes;
  pplblPeriodo2.caption := SysUtils.LongMonthNames[strtoint(xMes)] +'  '+ speAno.Text;

  if rgMoneda.ItemIndex=0 then
     ppLabel16.Caption := 'MONEDA LOCAL'
  else
     ppLabel16.Caption := 'MONEDA EXTRANJERA' ;

  FSOLPrevio:=TFSOLPrevio.Create(Self);
  With FSOLPrevio Do
  Try
     FLImpresion     :=FImpresion.wFlTexto;
     ppViewer1.Report:=pprBalComprobUnaMoneda;
     pprPrevio       :=pprBalComprobUnaMoneda;
     CarroAncho      :=True;
     TipoLetra       :='Draft 17cpi';
     xTextName       :=DM1.wUsuario+'BalGeneral';
     ShowModal;
  Finally
     FImpresion.Free;
  End;
  pprBalComprobUnaMoneda.Stop;

  DM1.cdsQry.CancelUpdates;
  DM1.cdsQry.IndexFieldNames:='';
  DM1.cdsQry.Filter:='';
  DM1.cdsQry.Filtered:=True;
end;

procedure TFBalGeneral.ckCtasClick(Sender: TObject);
begin
   if ckCtas.Checked then gbCtas.Enabled:=True
   else gbCtas.Enabled:=False;
end;

procedure TFBalGeneral.ckTitClick(Sender: TObject);
begin
   if ckTit.Checked then edtTit.Enabled:=True
   else edtTit.Enabled:=False;
end;

procedure TFBalGeneral.ppvSFMNCalc(Sender: TObject; var Value: Variant);
Var
   xD,xH,xS: DOUBLE;
begin
//1   Saldo Final=Saldo Anterior + (D-H)
{   ppdbtSMN.DisplayFormat:='';
   ppdbtDMN.DisplayFormat:='';
   ppdbtHMN.DisplayFormat:='';
   if ppdbtSMN.Text='' then xS:=0 else xS:=strtofloat(ppdbtSMN.Text);
   if ppdbtDMN.Text='' then xD:=0 else xD:=strtofloat(ppdbtDMN.Text);
   if ppdbtHMN.Text='' then xH:=0 else xH:=strtofloat(ppdbtHMN.Text);
   Value:=xS+(xD-xH);
   // Totales...Resumen
   ppvTSMN.Value:=ppvTSMN.Value+xS;
   ppvTDMN.Value:=ppvTDMN.Value+xD;
   ppvTHMN.Value:=ppvTHMN.Value+xH;
   ppvTSFMN.Value:=ppvTSFMN.Value+(xS+(xD-xH));}
end;

procedure TFBalGeneral.ppvSFMECalc(Sender: TObject; var Value: Variant);
Var
   xD,xH,xS: DOUBLE;
begin
  With DM1 do Begin
//   Saldo Final=Saldo Anterior + (D-H)
//1   xD:=0; xH:=0; xS:=0;
{   ppdbtSME.DisplayFormat:='';
   ppdbtDME.DisplayFormat:='';
   ppdbtHME.DisplayFormat:='';
   if ppdbtSME.Text='' then xS:=0 else xS:=strtofloat(ppdbtSME.Text);
   if ppdbtDME.Text='' then xD:=0 else xD:=strtofloat(ppdbtDME.Text);
   if ppdbtHME.Text='' then xH:=0 else xH:=strtofloat(ppdbtHME.Text);
   Value:=xS+(xD-xH);
   // Totales...Resumen
   ppvTSME.Value:=ppvTSME.Value+xS;
   ppvTDME.Value:=ppvTDME.Value+xD;
   ppvTHME.Value:=ppvTHME.Value+xH;
   ppvTSFME.Value:=ppvTSFME.Value+(xS+(xD-xH));}
  End;
end;

procedure TFBalGeneral.ppdbtSMNPrint(Sender: TObject);
begin
//1     ppdbtSMN.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalGeneral.ppdbtDMNPrint(Sender: TObject);
begin
//1     ppdbtDMN.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalGeneral.ppdbtHMNPrint(Sender: TObject);
begin
//1     ppdbtHMN.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalGeneral.ppdbtSMEPrint(Sender: TObject);
begin
//1     ppdbtSME.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalGeneral.ppdbtDMEPrint(Sender: TObject);
begin
//1     ppdbtDME.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalGeneral.ppdbtHMEPrint(Sender: TObject);
begin
//1     ppdbtHME.DisplayFormat:='#,0.00;-#,0.00';
end;

function TFBalGeneral.StrZ(wNumero:String;wLargo:Integer):string;
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

procedure TFBalGeneral.LlenaCNT301;
begin
     DM1.cdsMovCNT2.Insert;
     DM1.cdsMovCNT2.FieldByName('CIAID').AsString      := DM1.cdsCntTemp.FieldByName('CIAID').AsString;
     DM1.cdsMovCNT2.FieldByName('TDIARID').AsString    := wtdi;
     DM1.cdsMovCNT2.FieldByName('CNTCOMPROB').AsString := wnumco;
     DM1.cdsMovCNT2.FieldByName('CNTANO').AsString     := wano;
     DM1.cdsMovCNT2.FieldByName('CNTANOMM').AsString   := wper;
//   DM1.cdsMovCNT2CNTLote.Value    := DM1.cdsMov CNTCNTLote.Value;
     DM1.cdsMovCNT2.FieldByName('CUENTAID').AsString   := DM1.cdsCntTemp.FieldByName('CUENTAID').AsString;
     DM1.cdsMovCNT2.FieldByName('CLAUXID').AsString    := DM1.cdsCntTemp.FieldByName('CLAUXID').AsString;
     DM1.cdsMovCNT2.FieldByName('AUXID').AsString      := DM1.cdsCntTemp.FieldByName('AUXID').AsString;
     DM1.cdsMovCNT2.FieldByName('DOCID').AsString      := DM1.cdsCntTemp.FieldByName('DOCID').AsString;
     DM1.cdsMovCNT2.FieldByName('CNTSERIE').AsString   := DM1.cdsCntTemp.FieldByName('CNTSERIE').AsString;
     DM1.cdsMovCNT2.FieldByName('CNTNODOC').AsString   := wnumdo;
     DM1.cdsMovCNT2.FieldByName('CNTGLOSA').AsString   := DM1.cdsCntTemp.FieldByName('CNTGLOSA').AsString;
     DM1.cdsMovCNT2.FieldByName('CNTDH').AsString      := DM1.cdsCntTemp.FieldByName('CNTDH').AsString;
//   DM1.cdsMovCNT2CCosId.Value     := DM1.cdsMov CNTCCosId.Value;
     DM1.cdsMovCNT2.FieldByName('CNTTCAMBIO').AsFloat  := DM1.cdsCntTemp.FieldByName('CNTTCAMBIO').AsFloat;
     DM1.cdsMovCNT2.FieldByName('CNTMTOORI').AsFloat   := DM1.cdsCntTemp.FieldByName('CNTMTOORI').AsFloat;
     DM1.cdsMovCNT2.FieldByName('CNTMTOLOC').AsFloat   := DM1.cdsCntTemp.FieldByName('CNTMTOLOC').AsFloat;
     DM1.cdsMovCNT2.FieldByName('CNTMTOEXT').AsFloat   := DM1.cdsCntTemp.FieldByName('CNTMTOEXT').AsFloat;
     if DM1.cdsCntTemp.FieldByName('CNTDH').AsString = 'D' then begin
        DM1.cdsMovCNT2.FieldByName('CNTDEBEMN').AsFloat:=DM1.cdsCntTemp.FieldByName('CNTMTOLOC').AsFloat;
        DM1.cdsMovCNT2.FieldByName('CNTDEBEME').AsFloat:=DM1.cdsCntTemp.FieldByName('CNTMTOEXT').AsFloat;
     end
     else begin
        DM1.cdsMovCNT2.FieldByName('CNTHABEMN').AsFloat:=DM1.cdsCntTemp.FieldByName('CNTMTOLOC').AsFloat;
        DM1.cdsMovCNT2.FieldByName('CNTHABEME').AsFloat:=DM1.cdsCntTemp.FieldByName('CNTMTOEXT').AsFloat;
     end;
     DM1.cdsMovCNT2.FieldByName('CNTFEMIS').AsDateTime := wfedo;
     DM1.cdsMovCNT2.FieldByName('CNTFVCMTO').AsDatetime:= wfeve;
     DM1.cdsMovCNT2.FieldByName('CNTFCOMP').AsDateTime := wfeco;
     DM1.cdsMovCNT2.FieldByName('CNTESTADO').AsString  := DM1.cdsCntTemp.FieldByName('CNTESTADO').AsString;
     DM1.cdsMovCNT2.FieldByName('CNTCUADRE').AsString  := 'S';
     DM1.cdsMovCNT2.FieldByName('CNTFAUTOM').AsString  := '';
     DM1.cdsMovCNT2.FieldByName('CNTUSER').AsString    := DM1.cdsCntTemp.FieldByName('CNTUSER').AsString;
     DM1.cdsMovCNT2.FieldByName('CNTFREG').AsDateTime  := wfeco;
//   DM1.cdsMovCNT2CNTHReg.Value    := TIMe;
     DM1.cdsMovCNT2.FieldByName('CNTMM').AsString      := wmm;
//   DM1.cdsMovCNT2CNTDD.Value      := DM1.cdsMov CNTCNTDD.Value;
//   DM1.cdsMovCNT2CNTTri.Value     := DM1.cdsMov CNTCNTTri.Value;
//   DM1.cdsMovCNT2CNTSem.Value     := DM1.cdsMov CNTCNTSem.Value;
//   DM1.cdsMovCNT2CNTSS.Value      := DM1.cdsMov CNTCNTSS.Value;
//   DM1.cdsMovCNT2CNTAATri.Value   := DM1.cdsMov CNTCNTAATri.Value;
//   DM1.cdsMovCNT2CNTAASem.Value   := DM1.cdsMov CNTCNTAASem.Value;
//   DM1.cdsMovCNT2CNTAASS.Value    := DM1.cdsMov CNTCNTAASS.Value;
     DM1.cdsMovCNT2.FieldByName('TMONID').AsString     := '01';
end;

procedure TFBalGeneral.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFBalGeneral.dblcTDiarioExit(Sender: TObject);
begin
   edtTDiario.Text:='';
   if dblcTDiario.Text<>'' then edtTDiario.Text:=DM1.cdsTDiario.FieldByName('TDIARDES').AsString;
end;

procedure TFBalGeneral.ckTDiarioClick(Sender: TObject);
begin
   if not(ckTDiario.Checked) then begin
      dblcTDiario.Text:='';  edtTDiario.Text:='';
      dblcTDiario.Enabled:=False;
   end
   else begin
      dblcTDiario.Enabled:=True;
   end;
end;

procedure TFBalGeneral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dm1.cdsqry.Close;
   dm1.cdsqry.filter := '';
   dm1.cdsqry.Filtered := True;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
   Action:=caFree;
end;

procedure TFBalGeneral.dbdtpFReg1Exit(Sender: TObject);
begin
   If dbdtpFReg1.date=0 then
   begin
      dbdtpFReg1.SetFocus;
      showmessage('Error : Falta Registrar Fecha');
      Raise Exception.Create('Error : Falta Registrar Fecha');
   end;
end;

procedure TFBalGeneral.dbdtpFReg2Exit(Sender: TObject);
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

procedure TFBalGeneral.gbPerExit(Sender: TObject);
var
   xFecha1, xFecha2 : TDateTime;
begin
   xFecha1 := strtodate('01/'+DM1.strZero(speMM.Text,2)+'/'+speAno.Text);
   if strtofloat(speMM.Text)+1=13 then
   begin
      xFecha2 := strtodate('01/01/'+ FloatToStr(StrToFloat(speAno.Text)+1));
   end
   else begin
      xFecha2:=strtodate('01/'+DM1.strZero(floattostr(strtofloat(speMM.Text)+1),2)+'/'+speAno.Text);
   end;
   xFecha2:=xFecha2-1;
   dbdtpFReg1.date:=xFecha1;
   dbdtpFReg2.date:=xFecha2;
end;

procedure TFBalGeneral.FormShow(Sender: TObject);
var
   xAno, xMes, xDia : word;
begin

   DM1.Filtracds( DM1.cdsNivel,'' );

   DM1.cdsNivel.IndexFieldNames   := 'NIVEL';
   DM1.cdsCuenta.Active:=True;

   DM1.cdsNivel.Last;
   dblcNivel.Text:=DM1.cdsNivel.FieldByName('NIVEL').AsString;

   dblcCia.Text     := '' ;
   DecodeDate(Date, xAno, xMes, xDia);
   speAno.Value:=xAno;
   speMM.Value:=xMes;
   gbPerExit(Self);

//   dm1.cdsCia.IndexFieldNames := '' ;
   dm1.cdsCia.Filtered := False     ;
   if not dm1.cdsCia.Active then
      dm1.cdsCia.Open ;
   if dm1.cdsCia.RecordCount = 1 then
   begin
      dblcCia.Text := dm1.cdsCia.fieldbyname('CIAID').AsString ;
      edtCia.Text  := dm1.cdsCia.fieldbyname('CIADES').AsString ;
      //dblcCia.Enabled := False ;
   end ;
//   Self.SetFocus ;
   perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFBalGeneral.pprBalComprobPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;

end;

procedure TFBalGeneral.ppSaldoAntPrint(Sender: TObject);
begin
//     ppSaldoAnt.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalGeneral.ppDEBEPrint(Sender: TObject);
begin
     ppDEBE.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalGeneral.ppHABERPrint(Sender: TObject);
begin
     ppHABER.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalGeneral.pprBalComprobUnaMonedaPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;

end;

procedure TFBalGeneral.IDIFDCalc(Sender: TObject; var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
  if ppdbcISALDOD.text='' then
    xD:=0
  else
    xD:=ppdbcISALDOD.Value;

  if ppdbcISALDOH.text='' then
    xH:=0
  else
    xH:=ppdbcISALDOH.Value;
  if (xH>=xD) then
   begin
    Value:=(xH-xD);
    IDIFD.Visible:=True;
    IDIFH.Visible:=False;
   end
 else  value :=0;
  ppDBCalc17.Value :=  ppdbcISALDOD.value + IDIFD.Value;

end;

procedure TFBalGeneral.ppDBCalc5Calc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     begin
      If rgMoneda.ItemIndex = 0 then
//1       ppDBCalc5.Value := ppDBCalc5.Value + dm1.cdsQry.fieldbyname('DEBEMN').AsFloat
      else
//1       ppDBCalc5.Value := ppDBCalc5.Value + dm1.cdsQry.fieldbyname('DEBEME').AsFloat;
     end;
   end
  else
   begin
    If (dm1.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
      If rgMoneda.ItemIndex = 0 then
//1       ppDBCalc5.Value := ppDBCalc5.Value + dm1.cdsQry.fieldbyname('DEBEMN').AsFloat
      else
//1       ppDBCalc5.Value := ppDBCalc5.Value + dm1.cdsQry.fieldbyname('DEBEME').AsFloat
     end;
   end;
end;

procedure TFBalGeneral.ppDBCalc6Calc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     begin
      If rgMoneda.ItemIndex = 0 then
//1       ppDBCalc6.Value := ppDBCalc6.Value + dm1.cdsQry.fieldbyname('HABEMN').AsFloat
      else
//1       ppDBCalc6.Value := ppDBCalc6.Value + dm1.cdsQry.fieldbyname('HABEME').AsFloat
     end;
   end
  else
   begin
    If (dm1.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
      If rgMoneda.ItemIndex = 0 then
//1       ppDBCalc6.Value := ppDBCalc6.Value + dm1.cdsQry.fieldbyname('HABEMN').AsFloat
      else
//1       ppDBCalc6.Value := ppDBCalc6.Value + dm1.cdsQry.fieldbyname('HABEME').AsFloat
      end;
   end;
end;

procedure TFBalGeneral.ppVariable2Calc(Sender: TObject;
  var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
{   ppdbtADEBE.DisplayFormat:='';
   ppdbtAHABE.DisplayFormat:='';
   if ppdbtADEBE.Text='' then xD:=0 else xD:=strtofloat(ppdbtADEBE.Text);
   if ppdbtAHABE.Text='' then xH:=0 else xH:=strtofloat(ppdbtAHABE.Text);
   Value:=(xD-xH);}
end;

procedure TFBalGeneral.ppdbtADEBEPrint(Sender: TObject);
begin
//1  ppdbtADEBE.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalGeneral.ppdbtAHABEPrint(Sender: TObject);
begin
//1  ppdbtAHABE.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalGeneral.ppDetailBand2BeforePrint(Sender: TObject);
begin
{    If Length(dm1.cdsQry.fieldbyname('CUENTAID').AsString) = 2  then
     begin
      ppDBText2.Font.Style := [fsBold];
      ppDBText3.Font.Style := [fsBold];
      ppDEBE.Font.Style := [fsBold];
      ppHABER.Font.Style := [fsBold];
      ppSALDOD.Font.Style := [fsBold];
      ppSALDOH.Font.Style := [fsBold];
      ppISALDOD.Font.Style := [fsBold];
      ppISALDOH.Font.Style := [fsBold];
      ppESALDOD.Font.Style := [fsBold];
      ppESALDOH.Font.Style := [fsBold];}

//1      ppVariable1.Font.Style := [fsBold];
//1      ppdbtADEBE.Font.Style := [fsBold];
//1      ppdbtAHABE.Font.Style := [fsBold];
//1      ppVariable2.Font.Style := [fsBold];
{     end
    else
     begin
      ppDBText2.Font.Style := [];
      ppDBText3.Font.Style := [];
      ppDEBE.Font.Style := [];
      ppHABER.Font.Style := [];
      ppSALDOD.Font.Style := [];
      ppSALDOH.Font.Style := [];
      ppISALDOD.Font.Style := [];
      ppISALDOH.Font.Style := [];
      ppESALDOD.Font.Style := [];
      ppESALDOH.Font.Style := [];}

//1      ppVariable1.Font.Style := [];
//1      ppdbtADEBE.Font.Style := [];
//1      ppdbtAHABE.Font.Style := [];
//1      ppVariable2.Font.Style := [];
//     end;
end;

procedure TFBalGeneral.ppdbcADEBECalc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     begin
       ppdbcADEBE.Value := ppdbcADEBE.Value + dm1.cdsQry.fieldbyname('ADEBE').AsFloat
     end;
   end
  else
   begin
    If (dm1.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
       ppdbcADEBE.Value := ppdbcADEBE.Value + dm1.cdsQry.fieldbyname('ADEBE').AsFloat
     end;
   end;
end;

procedure TFBalGeneral.ppdbcAHABECalc(Sender: TObject);
begin

  If xNivel ='0' then
   begin
    If (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     begin
       ppdbcAHABE.Value := ppdbcAHABE.Value + dm1.cdsQry.fieldbyname('AHABE').AsFloat
     end;
   end
  else
   begin
    If (dm1.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
       ppdbcAHABE.Value := ppdbcAHABE.Value + dm1.cdsQry.fieldbyname('AHABE').AsFloat
      end;
   end;
end;

procedure TFBalGeneral.ppdbcASALDODCalc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     begin
       ppdbcASALDOD.Value := ppdbcASALDOD.Value + dm1.cdsQry.fieldbyname('ASALDOD').AsFloat
     end;
   end
  else
   begin
    If (dm1.cdsQry.fieldbyname('TIPO').AsString<=dblcNivel.text) or
       (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
       ppdbcASALDOD.Value := ppdbcASALDOD.Value + dm1.cdsQry.fieldbyname('ASALDOD').AsFloat
     end;
   end;
end;

procedure TFBalGeneral.ppdbcASALDOHCalc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     begin
       ppdbcASALDOH.Value := ppdbcASALDOH.Value + dm1.cdsQry.fieldbyname('ASALDOH').AsFloat
     end;
   end
  else
   begin
    If (dm1.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
       ppdbcASALDOH.Value := ppdbcASALDOH.Value + dm1.cdsQry.fieldbyname('ASALDOH').AsFloat
     end;
   end;
end;

procedure TFBalGeneral.ppdbcISALDODCalc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     begin
       ppdbcISALDOD.Value := ppdbcISALDOD.Value + dm1.cdsQry.fieldbyname('ISALDOD').AsFloat
     end;
   end
  else
   begin
    If (dm1.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
       ppdbcISALDOD.Value := ppdbcISALDOD.Value + dm1.cdsQry.fieldbyname('ISALDOD').AsFloat
     end;
   end;
end;

procedure TFBalGeneral.ppdbcISALDOHCalc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     begin
       ppdbcISALDOH.Value := ppdbcISALDOH.Value + dm1.cdsQry.fieldbyname('ISALDOH').AsFloat
     end;
   end
  else
   begin
    If (dm1.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
       ppdbcISALDOH.Value := ppdbcISALDOH.Value + dm1.cdsQry.fieldbyname('ISALDOH').AsFloat
     end;
   end;
end;

procedure TFBalGeneral.ppdbcESALDODCalc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     begin
       ppdbcESALDOD.Value := ppdbcESALDOD.Value + dm1.cdsQry.fieldbyname('ESALDOD').AsFloat
     end;
   end
  else
   begin
    If (dm1.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
       ppdbcESALDOD.Value := ppdbcESALDOD.Value + dm1.cdsQry.fieldbyname('ESALDOD').AsFloat
     end;
   end;
end;

procedure TFBalGeneral.ppdbcESALDOHCalc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     begin
       ppdbcESALDOH.Value := ppdbcESALDOH.Value + dm1.cdsQry.fieldbyname('ESALDOH').AsFloat
     end;
   end
  else
   begin
    If (dm1.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
       ppdbcESALDOH.Value := ppdbcESALDOH.Value + dm1.cdsQry.fieldbyname('ESALDOH').AsFloat
     end;
   end;
end;

procedure TFBalGeneral.IDIFHCalc(Sender: TObject; var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
 if ppdbcISALDOH.text='' then
    xD:=0
  else
    xD:=ppdbcISALDOH.Value;

  if ppdbcISALDOD.text='' then
    xH:=0
  else
    xH:=ppdbcISALDOD.Value;
  if (xH>=xD) then
   begin
    Value:=(xH-xD);
    IDIFH.Visible:=True;
    IDIFD.Visible:=False;
   end
  else value := 0;
 ppDBCalc18.value :=  ppdbcISALDOH.value + value;
end;

procedure TFBalGeneral.EDIFDCalc(Sender: TObject; var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
  {if ppdbcESALDOD.text='' then
    xD:=0
  else
    xD:=ppdbcESALDOD.Value;

  if ppdbcESALDOH.text='' then
    xH:=0
  else
    xH:=ppdbcESALDOH.Value;
  if (xH>=xD) then
  begin
    Value:=(xH-xD);
    EDIFD.Visible:=True;
    EDIFH.Visible:=False;
  end;}
end;

procedure TFBalGeneral.EDIFHCalc(Sender: TObject; var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
  {if ppdbcESALDOH.text='' then
    xD:=0
  else
    xD:=ppdbcESALDOH.Value;

  if ppdbcESALDOD.text='' then
    xH:=0
  else
    xH:=ppdbcESALDOD.Value;
  if (xH>=xD) then
  begin
    Value:=(xH-xD);
    EDIFH.Visible:=True;
    EDIFD.Visible:=False;
  end;}
end;

procedure TFBalGeneral.ppdbcDEBECalc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     begin
       ppdbcDEBE.Value := ppdbcDEBE.Value + dm1.cdsQry.fieldbyname('DEBE').AsFloat
     end;
   end
  else
   begin
    If (dm1.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
       ppdbcDEBE.Value := ppdbcDEBE.Value + dm1.cdsQry.fieldbyname('DEBE').AsFloat
     end;
   end;
end;

procedure TFBalGeneral.ppdbcHABeCalc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     begin
       ppdbcHABE.Value := ppdbcHABE.Value + dm1.cdsQry.fieldbyname('HABE').AsFloat
     end;
   end
  else
   begin
    If (dm1.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
       ppdbcHABE.Value := ppdbcHABE.Value + dm1.cdsQry.fieldbyname('HABE').AsFloat
      end;
   end;
end;

procedure TFBalGeneral.ppdbcHABEANTCalc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     begin
       ppdbcHABEANT.Value := ppdbcHABEANT.Value + dm1.cdsQry.fieldbyname('AHABEANT').AsFloat
     end;
   end
  else
   begin
    If (dm1.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
       ppdbcHABEANT.Value := ppdbcHABEANT.Value + dm1.cdsQry.fieldbyname('AHABEANT').AsFloat
      end;
   end;
end;

procedure TFBalGeneral.ppdbcDEBEANTCalc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     begin
       ppdbcDEBEANT.Value := ppdbcDEBEANT.Value + dm1.cdsQry.fieldbyname('ADEBEANT').AsFloat
     end;
   end
  else
   begin
    If (dm1.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (dm1.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
       ppdbcDEBEANT.Value := ppdbcDEBEANT.Value + dm1.cdsQry.fieldbyname('ADEBEANT').AsFloat
     end;
   end;
end;

procedure TFBalGeneral.IDIFD1Calc(Sender: TObject; var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
  if ppdbcESALDOD.text='' then
    xD:=0
  else
    xD:=ppdbcESALDOD.Value;

  if ppdbcESALDOH.text='' then
    xH:=0
  else
    xH:=ppdbcESALDOH.Value;
  if (xH>=xD) then
   begin
    Value:=(xH-xD);
    IDIFD1.Visible:=True;
    IDIFH1.Visible:=False;
   end
  else value := 0;
 ppDBCalc19.Value := value + ppdbcESALDOD.value;
end;

procedure TFBalGeneral.IDIFH1Calc(Sender: TObject; var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
 if ppdbcESALDOH.text='' then
    xD:=0
  else
    xD:=ppdbcESALDOH.Value;

  if ppdbcESALDOD.text='' then
    xH:=0
  else
    xH:=ppdbcESALDOD.Value;
  if (xH>=xD) then
   begin
    Value:=(xH-xD);
    IDIFH1.Visible:=True;
    IDIFD1.Visible:=False;
   end
  else Value := 0;
  ppDBCalc20.value := ppdbcESALDOH.value  +  value;
end;

procedure TFBalGeneral.ppDBCalc9Calc(Sender: TObject);
begin
  ppDBCalc9.value := ppdbcDEBEANT.value;
end;

procedure TFBalGeneral.ppDBCalc10Calc(Sender: TObject);
begin
 ppDBCalc10.value :=  ppdbcHABEANT.value;
end;


procedure TFBalGeneral.ppDBCalc11Calc(Sender: TObject);
begin
   ppDBCalc11.value := ppdbcDEBE.value;
end;

procedure TFBalGeneral.ppDBCalc12Calc(Sender: TObject);
begin
  ppDBCalc12.value := ppdbcHABe.value;
end;

procedure TFBalGeneral.ppDBCalc13Calc(Sender: TObject);
begin
   ppDBCalc13.value := ppdbcADEBE.value;
end;

procedure TFBalGeneral.ppDBCalc14Calc(Sender: TObject);
begin
   ppDBCalc14.value := ppdbcAHABE.value;
end;

procedure TFBalGeneral.ppDBCalc15Calc(Sender: TObject);
begin
  ppDBCalc15.value := ppdbcASALDOD.value;
end;

procedure TFBalGeneral.ppDBCalc16Calc(Sender: TObject);
begin
  ppDBCalc16.value := ppdbcASALDOH.value;
end;

end.



