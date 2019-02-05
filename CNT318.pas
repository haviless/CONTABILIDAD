// Actualizaciones
// Inicio   :  2001
// HPC_201303_CNT Netea Saldo Inicial Mandándolo a la columna del Debe o Haber de Saldos Iniciales
// HPC_201304_CNT Reporte que compara Cuentas por Cobrar vs Cuentas por pagar de Filiales
// HPC_201401_CNT Ajustes a Comparación de Consolidado
// HPC_201405_CNT Consistencia de Valores en Negativos, Nro de Registro Duplicados, Fecha de Comprobante dentro del rango Año+Mes
// HPC_201602_CNT 16/05/2016 Opción que genera Excel para comparar Totales Nivel 1 versus Nivel 5
// HPC_201602_CNT 21/07/2016 Opción que genera excel con Cuentas de Detalle
// HPC_201701_CNT 21/14/2017 Corregir reporte que valida que no haya asientos con fecha de comprobante mayor a fecha maxima


Unit CNT318;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ExtCtrls, wwdbdatetimepicker, wwdblook, Buttons, Mask, wwdbedit,
   Spin, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppProd, ppReport,
   ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, Grids, Wwdbigrd, Wwdbgrid, ppViewr,
   oaVariables, ppTypes, ppEndUsr, DBGrids, ppParameter, DB, Wwdatsrc,
//   DBClient, wwclient, OleServer, ExcelXP,
   DBClient, wwclient, OleServer, Excel2000,
   variants, ComObj, TXComp;

Type
   TFBalGeneral = Class(TForm)
      pnlMayorAn: TPanel;
      lblCia: TLabel;
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      rgMoneda: TRadioGroup;
      ppdbBalComprob: TppDBPipeline;
      gbNivel: TGroupBox;
      dblcNivel: TwwDBLookupCombo;
      gbPer: TGroupBox;
      speAno: TSpinEdit;
      speMM: TSpinEdit;
      Label2: TLabel;
      dbdtpFReg1: TwwDBDateTimePicker;
      dbdtpFReg2: TwwDBDateTimePicker;
      ckTit: TCheckBox;
      edtTit: TEdit;
      bbtnVerifica: TBitBtn;
      ppdbV: TppDBPipeline;
      pprV: TppReport;
      ppdV: TppDesigner;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      bbtnRepCmpIni: TBitBtn;
      ppd1: TppDesigner;
      BitBtn1: TBitBtn;
      bbtnExcel1: TBitBtn;
      dtgData: TDBGrid;
      sdGraba: TSaveDialog;
      BitBtn2: TBitBtn;
      pprBalComprobUnaMoneda: TppReport;
      ppParameterList1: TppParameterList;
      BitBtn3: TBitBtn;
      cdsExcel: TwwClientDataSet;
      dsExcel: TwwDataSource;
      bbtnExcel2: TBitBtn;
      bbtnA4: TBitBtn;
      pprA4: TppReport;
      ppHeaderBand3: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel9: TppLabel;
      ppLabel18: TppLabel;
      ppLabel22: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppLabel24: TppLabel;
      ppSystemVariable5: TppSystemVariable;
      ppLabel25: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLabel43: TppLabel;
      ppLabel45: TppLabel;
      ppLabel50: TppLabel;
      ppLabel52: TppLabel;
      ppLabel53: TppLabel;
      ppLabel62: TppLabel;
      ppDBText1: TppDBText;
      ppDetailBand3: TppDetailBand;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLabel65: TppLabel;
      ppcADEBE: TppDBCalc;
      ppcAHABE: TppDBCalc;
      ppcASALDOD: TppDBCalc;
      ppcASALDOH: TppDBCalc;
      ppcISALDOD: TppDBCalc;
      ppcISALDOH: TppDBCalc;
      ppcESALDOD: TppDBCalc;
      ppcESALDOH: TppDBCalc;
      vIDIFD: TppVariable;
      vIDIFH: TppVariable;
      ppcHABE: TppDBCalc;
      ppcDEBE: TppDBCalc;
      ppcDEBEANT: TppDBCalc;
      ppcHABEANT: TppDBCalc;
      vIDIFD1: TppVariable;
      vIDIFH1: TppVariable;
      ppDBCalc25: TppDBCalc;
      ppDBCalc26: TppDBCalc;
      ppDBCalc27: TppDBCalc;
      ppDBCalc28: TppDBCalc;
      ppDBCalc29: TppDBCalc;
      ppDBCalc30: TppDBCalc;
      ppDBCalc31: TppDBCalc;
      ppDBCalc32: TppDBCalc;
      ppDBCalc33: TppDBCalc;
      ppDBCalc34: TppDBCalc;
      ppDBCalc35: TppDBCalc;
      ppDBCalc36: TppDBCalc;
      ppParameterList2: TppParameterList;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLine6: TppLine;
      BitBtn4: TBitBtn;
      BitBtn5: TBitBtn;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      bbtnVeriC9vsC6: TBitBtn;
      bbtnVeriC6vsC9: TBitBtn;
      bbtnValida60vs61: TBitBtn;
      cbDisenoRep: TCheckBox;
      bbtnGastosPlaneam: TBitBtn;
      bbtnBCG_SIxSaldo: TBitBtn;
      bbtn46vs16: TBitBtn; // HPC_201304_CNT
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
      ppDBText2: TppDBText;
      ppDetailBand2: TppDetailBand;
      ppDBText3: TppDBText;
      ppDBText13: TppDBText;
      ppDEBE: TppDBText;
      ppHABER: TppDBText;
      ppSALDOD: TppDBText;
      ppSALDOH: TppDBText;
      ppISALDOD: TppDBText;
      ppISALDOH: TppDBText;
      ppESALDOH: TppDBText;
      ppESALDOD: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
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
   // Inicio HPC_201602_CNT
   // Genera archivo Excel para Verificación entre Totales de 2 dígitos versus movimientos
      SpeedButton1: TSpeedButton;
      bbtnVerifNegat: TBitBtn;
      bbtn2DigVSMov: TBitBtn;
    bbtnExcel3: TBitBtn;
   // Inicio HPC_201602_CNT
      Procedure dblcCiaExit(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure ckTitClick(Sender: TObject);
      Function StrZ(wNumero: String; wLargo: Integer): String;
      Procedure LlenaCNT301;
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbdtpFReg1Exit(Sender: TObject);
      Procedure dbdtpFReg2Exit(Sender: TObject);
      Procedure gbPerExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure pprBalComprobPreviewFormCreate(Sender: TObject);
      Procedure ppDEBEPrint(Sender: TObject);
      Procedure ppHABERPrint(Sender: TObject);
      Procedure pprBalComprobUnaMonedaPreviewFormCreate(Sender: TObject);
      Procedure IDIFDCalc(Sender: TObject; Var Value: Variant);
      Procedure ppDBCalc5Calc(Sender: TObject);
      Procedure ppDBCalc6Calc(Sender: TObject);
      Procedure ppdbcADEBECalc(Sender: TObject);
      Procedure ppdbcAHABECalc(Sender: TObject);
      Procedure ppdbcASALDODCalc(Sender: TObject);
      Procedure ppdbcASALDOHCalc(Sender: TObject);
      Procedure ppdbcISALDODCalc(Sender: TObject);
      Procedure ppdbcISALDOHCalc(Sender: TObject);
      Procedure ppdbcESALDODCalc(Sender: TObject);
      Procedure ppdbcESALDOHCalc(Sender: TObject);
      Procedure IDIFHCalc(Sender: TObject; Var Value: Variant);
      Procedure ppdbcDEBECalc(Sender: TObject);
      Procedure ppdbcHABeCalc(Sender: TObject);
      Procedure ppdbcHABEANTCalc(Sender: TObject);
      Procedure ppdbcDEBEANTCalc(Sender: TObject);
      Procedure IDIFD1Calc(Sender: TObject; Var Value: Variant);
      Procedure IDIFH1Calc(Sender: TObject; Var Value: Variant);
      Procedure ppDBCalc9Calc(Sender: TObject);
      Procedure ppDBCalc10Calc(Sender: TObject);
      Procedure ppDBCalc11Calc(Sender: TObject);
      Procedure ppDBCalc12Calc(Sender: TObject);
      Procedure ppDBCalc13Calc(Sender: TObject);
      Procedure ppDBCalc14Calc(Sender: TObject);
      Procedure ppDBCalc15Calc(Sender: TObject);
      Procedure ppDBCalc16Calc(Sender: TObject);
      Procedure bbtnVerificaClick(Sender: TObject);
      Procedure bbtnCancClick(Sender: TObject);
      Procedure bbtnRepCmpIniClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure bbtnExcel1Click(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure BitBtn3Click(Sender: TObject);
      Procedure bbtnExcel2Click(Sender: TObject);
      Procedure bbtnA4Click(Sender: TObject);
      Procedure ppcDEBEANTCalc(Sender: TObject);
      Procedure ppcHABEANTCalc(Sender: TObject);
      Procedure ppcDEBECalc(Sender: TObject);
      Procedure ppcHABECalc(Sender: TObject);
      Procedure ppcADEBECalc(Sender: TObject);
      Procedure ppcAHABECalc(Sender: TObject);
      Procedure ppcASALDODCalc(Sender: TObject);
      Procedure ppcASALDOHCalc(Sender: TObject);
      Procedure ppcISALDODCalc(Sender: TObject);
      Procedure ppcISALDOHCalc(Sender: TObject);
      Procedure ppcESALDODCalc(Sender: TObject);
      Procedure ppcESALDOHCalc(Sender: TObject);
      Procedure vIDIFDCalc(Sender: TObject; Var Value: Variant);
      Procedure vIDIFHCalc(Sender: TObject; Var Value: Variant);
      Procedure vIDIFD1Calc(Sender: TObject; Var Value: Variant);
      Procedure vIDIFH1Calc(Sender: TObject; Var Value: Variant);
      Procedure ppDBCalc25Calc(Sender: TObject);
      Procedure ppDBCalc26Calc(Sender: TObject);
      Procedure ppDBCalc27Calc(Sender: TObject);
      Procedure ppDBCalc28Calc(Sender: TObject);
      Procedure ppDBCalc29Calc(Sender: TObject);
      Procedure ppDBCalc30Calc(Sender: TObject);
      Procedure ppDBCalc31Calc(Sender: TObject);
      Procedure ppDBCalc32Calc(Sender: TObject);
      Procedure BitBtn4Click(Sender: TObject);
      Procedure BitBtn5Click(Sender: TObject);
      Procedure bbtnVeriC9vsC6Click(Sender: TObject);
      Procedure bbtnVeriC6vsC9Click(Sender: TObject);
      Procedure bbtnValida60vs61Click(Sender: TObject);
      Procedure bbtnGastosPlaneamClick(Sender: TObject);
      Procedure bbtnBCG_SIxSaldoClick(Sender: TObject);
      Procedure bbtn46vs16Click(Sender: TObject);
   // Inicio HPC_201602_CNT
      procedure SpeedButton1Click(Sender: TObject);
      procedure bbtnVerifNegatClick(Sender: TObject);
      procedure bbtn2DigVSMovClick(Sender: TObject);
    procedure bbtnExcel3Click(Sender: TObject);
   // Fin HPC_201602_CNT
   Private
    { Private declarations }
      xnivel: String;
      xCiaConsol: String;
      XLApp: Variant;
      Procedure GeneraSQLRegIni;
      Procedure GeneraSQLVerifica;
      Procedure GeneraSQLAsientoDesc;
      Procedure GeneraSQLAsientoSinCta;
      Procedure GeneraSQLCtaDetalle;
      Procedure GeneraSQLComparaConsol;

      Procedure GeneraSQLVerificaC6vsC9;
      Procedure GeneraSQLVerificaC9vsC6;
      Procedure GeneraSQLVerificaC60vsC61;

      Procedure CrearCDS;
      Procedure GenerarCDS;
      Procedure ExportarExcel;

   // Inicio HPC_201602_CNT
   // Genera archivo Excel para Verificación entre Totales de 2 dígitos versus movimientos
      Procedure ExportExcelVerif;
   // Fin HPC_201602_CNT

   Public
    { Public declarations }
      sCiaOrigen: String;
      sCiaCuenta: String;
   End;

Var
   FBalGeneral: TFBalGeneral;
   Year, Month, Day: Word;
   xwhere, anomm: String;

// Variables para procesos de transferencia (temporales)
   wtdi, wnumco, wano, wper, wnumdo, wmm: String;
   wfedo, wfeve, wfeco: tDate;

Implementation

Uses CNTDM, CNT998;

{$R *.DFM}

Procedure TFBalGeneral.dblcCiaExit(Sender: TObject);
Begin
// Inicio HPC_201304_CNT
   If dblcCia.Text <> '01' Then
      bbtn46vs16.Visible := False
   Else
      bbtn46vs16.Visible := True;
// Fin HPC_201304_CNT

   If (bbtnCanc.Focused) Then exit;
   edtCia.Text := '';
   If dblcCia.Text <> '' Then edtCia.Text := DMCNT.cdsCia.FieldByName('CIADES').AsString;
   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   End;
   sCiaCuenta := DMCNT.FiltraTablaxCia(DMCNT.cdsCuenta, 'TGE202', 'CUENTAID', dblcCia.Text);
   sCiaOrigen := DMCNT.FiltraTablaxCia(DMCNT.cdsTDiario, 'TGE104', 'TDIARID', dblcCia.Text);
End;

Procedure TFBalGeneral.bbtnOkClick(Sender: TObject);
Var
   xWhere2, xMes, wMesAnt, sSQL1, sSQL2, sSQL3, sSQL4, sSQL5, sSQL6: String;
   xSQL: AnsiString;
   CampoH, CampoS, CampoD: String;
   sSaldoD, sSaldoH, sISaldoD, sISaldoH, sESaldoD, sESaldoH: String;
   sMon, sWhere, sDebe, sDebeAnt, sHabe, sHabeAnt, sHaving: String;
   i, x10: integer;
   xAM, cEstadoRep, xCierre: String;
Begin
   If edtCia.Text = '' Then
   Begin
      showmessage('Compañía no válida');
      Raise exception.Create('Compañía no válida');
   End;

   If dblcNivel.Text = '' Then
   Begin
      ShowMessage('Seleccione un Nivel de Detalle de Cuenta');
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   xAM := speAno.Text;
   xMes := speMM.Text;

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;

   xSql := 'SELECT * FROM TGE154 WHERE CIAID=' + quotedstr(dblcCia.text) + ' and ANO=' + quotedstr(speAno.Text);
   DMCNT.cdsCierres.close;
   DMCNT.cdsCierres.datarequest(xsql);
   DMCNT.cdsCierres.open;
   If DMCNT.cdsCierres.FieldByName('PER' + xMes).AsString = 'S' Then
   Begin
      GeneraSQLVerifica;
      If DMCNT.cdsConsistencia.RecordCount > 0 Then
      Begin
         Screen.Cursor := crDefault;
         ShowMessage('Error : Existen Inconsistencias. Emitir Reporte...');
         Exit;
      End;
   End;

   If xAM >= '201104' Then
   Begin
      GeneraSQLAsientoDesc;

      If DMCNT.cdsConsistencia.RecordCount > 0 Then
      Begin
         Screen.Cursor := crDefault;
         ShowMessage('Error : Existen asientos con Descuadre. Emitir Reporte...');
         Exit;
      End;
   End;

   GeneraSQLAsientoSinCta;

   If DMCNT.cdsConsistencia.RecordCount > 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('Error : Existen asientos con cuentas en blanco. Emitir Reporte...');
      Exit;
   End;

   DMCNT.cdsQry.Filtered := false;
   DMCNT.cdsQry.Filter := '';

   GeneraSQLRegIni;

   cEstadoRep := ' ';
   If DMCNT.cdsConsistencia.RecordCount > 0 Then
      cEstadoRep := 'BALANCE PRELIMINAR : EXISTEN REGISTROS EN ESTADO INICIAL, VERIFICAR';

   Screen.Cursor := crHourGlass;
   xnivel := '';
   xsql := '';
   If rgMoneda.ItemIndex = 1 Then // CUANDO ES MONDEDA EXTRANJERA
   Begin
      sMon := 'ME';
      sWhere := 'TMON_LOC=''E''';
   End
   Else
   Begin
      sMon := 'MN';
      sWhere := 'TMON_LOC=''L''';
   End;

// ACUMULADO INCLUYENDO EL MES ACTUAL
   For i := 0 To StrToInt(speMM.text) Do
   Begin
      sDebe := sDebe + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      sHabe := sHabe + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
   End;
//QUITAR EL ULTIMO + DE LA CADENA
   sDebe := Copy(sDebe, 1, Length(sDebe) - 1);
   sHabe := Copy(sHabe, 1, Length(sHabe) - 1);

// SALDOS ANTERIORES
   For i := 0 To StrToInt(speMM.text) - 1 Do
   Begin
      sDebeAnt := sDebeAnt + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      sHabeAnt := sHabeAnt + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
   End;

   If StrToInt(speMM.text) - 1 > 0 Then
      If StrToInt(speMM.text) = 1 Then
      Begin
         sDebeAnt := sDebeAnt + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
         sHabeAnt := sHabeAnt + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      End;

   If Length(sDebeAnt) = 0 Then
   Begin
      sDebeAnt := sDebeAnt + ' 0.00+';
      sHabeAnt := sHabeAnt + ' 0.00+';
   End;

   //QUITAR EL ULTIMO + DE LA CADENA
   sDebeAnt := Copy(sDebeAnt, 1, Length(sDebeAnt) - 1);
   sHabeant := Copy(sHabeAnt, 1, Length(sHabeAnt) - 1);
   sDebeAnt := sDebeAnt + ' ADEBEANT, ';
   sHabeAnt := sHabeAnt + ' AHABEANT, ';

{   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      sSaldoD := ' CASE WHEN (' + sDebe + ' - (' + sHabe + '))>0 THEN ' + sDebe + ' - (' + sHabe + ') ELSE 0 END ASALDOD, ';
      sSaldoh := ' CASE WHEN (' + sHabe + ' - (' + sDebe + '))>0 THEN ' + sHabe + ' - (' + sDebe + ') ELSE 0 END ASALDOH, ';

      sISaldoD := ' CASE WHEN (TGE202.CTA_TIPO IN (''O'',''A'',''P'')) AND (' + sDebe + ' - (' + sHabe + '))>0 THEN ' + sDebe + ' - (' + sHabe + ') ELSE 0 END ISALDOD, ';
      sISaldoH := ' CASE WHEN (TGE202.CTA_TIPO IN (''O'',''A'',''P'')) AND (' + sHabe + ' - (' + sDebe + '))>0 THEN ' + sHabe + ' - (' + sDebe + ') ELSE 0 END ISALDOH, ';

      sESaldoD := ' CASE WHEN (TGE202.CTA_TIPO IN (''G'',''I'',''R'',''N'')) AND (' + sDebe + ' - (' + sHabe + '))>0 THEN ' + sDebe + ' - (' + sHabe + ') ELSE 0 END ESALDOD, ';
      sESaldoH := ' CASE WHEN (TGE202.CTA_TIPO IN (''G'',''I'',''R'',''N'')) AND (' + sHabe + ' - (' + sDebe + '))>0 THEN ' + sHabe + ' - (' + sDebe + ') ELSE 0 END ESALDOH, ';

      sDebe := sDebe + ' ADEBE, ';
      sHabe := sHabe + ' AHABE, ';
   End
   Else
   Begin
}
      sSaldoD := ' DECODE(LEAST( (' + sDebe + ' - (' + sHabe + ')),0),0,' + sDebe + ' - (' + sHabe + '), 0 ) ASALDOD, ';
      sSaldoh := ' DECODE(LEAST( (' + sHabe + ' - (' + sDebe + ')),0),0,' + sHabe + ' - (' + sDebe + '), 0 ) ASALDOH, ';

      sISaldoD := ' DECODE(LEAST((' + sDebe + ' - (' + sHabe + ')),0),0,DECODE(TGE202.CTA_TIPO,''A'',' + sDebe + ' - (' + sHabe + ')),0,0) ISALDOD, ';
      sISaldoH := ' DECODE(LEAST((' + sHabe + ' - (' + sDebe + ')),0),0,DECODE(TGE202.CTA_TIPO,''A'',' + sHabe + ' - (' + sDebe + ')),0,0) ISALDOH, ';

      sESaldoD := ' DECODE(LEAST((' + sDebe + ' - (' + sHabe + ')),0),0,DECODE(TGE202.CTA_TIPO,''R'',' + sDebe + ' - (' + sHabe + '),''R'',' + sDebe + ' - (' + sHabe + '),0),0) ESALDOD, ';
      sESaldoH := ' DECODE(LEAST((' + sHabe + ' - (' + sDebe + ')),0),0,DECODE(TGE202.CTA_TIPO,''R'',' + sHabe + ' - (' + sDebe + '),''R'',' + sHabe + ' - (' + sDebe + '),0),0) ESALDOH, ';

      sDebe := sDebe + ' ADEBE, ';
      sHabe := sHabe + ' AHABE, ';
//   End;
   xnivel := '';
   xsql := '';

   xsql := 'NIVEL=' + quotedstr(IntToStr(StrToInt(dblcNivel.text) + 1));

   If DMCNT.DisplayDescrip('PrvTGE', 'CNT202', '*', xsql, 'NIVEL') = '' Then
      xnivel := '0'
   Else
      xnivel := '1';

   xWhere := 'CNT401.CIAID=' + '''' + dblcCia.Text + ''''
           + ' AND CNT401.ANO=' + '''' + speAno.Text + ''''
           + ' AND CNT401.TIPO<=' + '''' + dblcNivel.Text + ''''
           + ' AND (CNT401.AUXID IS NULL OR CNT401.AUXID='''') '
           + ' AND (CNT401.CCOSID IS NULL OR CNT401.CCOSID='''')'
           + ' AND LENGTH(CNT401.CUENTAID) <> 1';

   If sCiaCuenta <> '' Then
   Begin
      xWhere := xWhere + ' and CNT401.' + sCiaCuenta;
   End;

   xMes := speMM.Text;

   If (StrToInt(xmes) - 1) <= 9 Then
      wMesAnt := '0' + inttostr((StrToInt(xmes) - 1));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   CampoS := ' SALD' + sMon + wMesAnt; // wmes
   CampoD := ' DEBE' + sMon + xMes;
   CampoH := ' HABE' + sMon + xMes;
{
   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      If UpperCase(wRutaRpt) = 'SOLFORMATOS\CNT\INCORESA' Then
      Begin
         xSQL := 'SELECT CNT401.CUENTAID, CNT401.CTADES, '
                +        sDebeAnt + sHabeant + CampoD + ' DEBE,' + CampoH + ' HABE, ' + sDebe + sHabe + sSaldoD + sSaldoH + sISaldoD + sISaldoH + sESaldoD + sESaldoH
                +'       TGE202.CTA_DET, CNT401.TIPO'
                +'  FROM CNT401 '
                +' LEFT JOIN TGE202 ON ( CNT401.CIAID=TGE202.CIAID AND CNT401.CUENTAID=TGE202.CUENTAID) WHERE ';
         xSQL := xSQL + xWhere + ' ORDER BY CNT401.CUENTAID';
      End
      Else
      Begin
         xSQL := 'SELECT CNT401.CUENTAID, CNT401.CTADES, '
            + sDebeAnt + sHabeant + CampoD + ' DEBE,' + CampoH + ' HABE, ' + sDebe + sHabe + sSaldoD + sSaldoH + sISaldoD + sISaldoH + sESaldoD + sESaldoH
            + ' TGE202.CTA_DET, CNT401.TIPO'
            + ' FROM CNT401 '
            + ' LEFT JOIN TGE202 ON (CNT401.CIAID=TGE202.CIAID AND CNT401.CUENTAID = TGE202.CUENTAID) WHERE ';
         xSQL := xSQL + xWhere + ' ORDER BY CNT401.CUENTAID';
      End;
   End
   Else
      If SRV_D = 'ORACLE' Then
      Begin
}
         xSQL := 'SELECT CNT401.CUENTAID, CNT401.CTADES, ';
         sSQL1 := sDebeAnt + sHabeant + CampoD + ' DEBE,' + CampoH + ' HABE, ';
         sSQL2 := sDebe + sHabe + sSaldoD + sSaldoH;
         sSQL3 := sISaldoD + sISaldoH; //+sESaldoD+sESaldoH;
         sSQL6 := sESaldoD + sESaldoH;
         sSQL4 := ' TGE202.CTA_DET, CNT401.TIPO, ''' + cEstadoRep + ''' ESTADO '
                + ' FROM CNT401, TGE202'
                + ' WHERE (CNT401.CUENTAID = TGE202.CUENTAID(+)) AND (CNT401.CIAID = TGE202.CIAID(+)) AND ';
         sSQL5 := ' ORDER BY CNT401.CUENTAID';
         xSQL := xSQL + sSQL1 + sSQL2 + sSQL3 + sSQL6 + sSQL4 + xWhere + sSQL5;
//      End;

   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.ProviderName := 'prvCNT';
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   DMCNT.cdsQry.Filter := ' ADEBE <>0.00 or AHABE <>0.00 ';
   DMCNT.cdsQry.Filtered := True;
   If DMCNT.cdsQry.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas');
      DMCNT.cdsQry.Filter := '';
      DMCNT.cdsQry.Filtered := True;
   End;
   DMCNT.cdsQry.First;
   Screen.Cursor := crDefault;
   If rgMoneda.ItemIndex = -1 Then
   Begin
      ShowMessage('Ingrese Tipo de Moneda');
      rgMoneda.SetFocus;
      Exit;
   End;

   ppdbBalComprob.DataSource := DMCNT.dsQry;

   pprBalComprobUnaMoneda.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\BalGeneralTX.rtm';
   pprBalComprobUnaMoneda.template.LoadFromFile;

   pplCia2.Caption := edtCia.Text;
   pplblTitulo2.Caption := edtTit.Text;
   pplblPeriodo2.Caption := speAno.Text + xMes;
   pplblPeriodo2.caption := SysUtils.LongMonthNames[strtoint(xMes)] + '  ' + speAno.Text;

   If rgMoneda.ItemIndex = 0 Then
      ppLabel16.Caption := 'MONEDA LOCAL'
   Else
      ppLabel16.Caption := 'MONEDA EXTRANJERA';

   pprBalComprobUnaMoneda.AllowPrintToArchive := True;
   pprBalComprobUnaMoneda.AllowPrintToFile := True;

   DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Balance Comprobacion General',
      dblcCia.Text, // Campañía
      speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
      dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
      dblcNivel.Text, '', // Nivel   - Origen
      '', inttostr(rgMoneda.itemindex), // Lote    -  Moneda
      '', '', // Cuentas - Auxiliares
      '', 'Impresora', // Costos - Tipo Salida
      ''); // Tipo Rep

   Screen.Cursor := crDefault;
   If cbDisenoRep.Checked Then
   Begin
      ppdV.Report := pprBalComprobUnaMoneda;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprBalComprobUnaMoneda.Print;
      pprBalComprobUnaMoneda.Stop;
      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;
      ppdbBalComprob.DataSource := Nil;
   End;

   DMCNT.cdsQry.CancelUpdates;
   DMCNT.cdsQry.IndexFieldNames := '';
   DMCNT.cdsQry.Filter := '';
   DMCNT.cdsQry.Filtered := True;

End;

Procedure TFBalGeneral.ckTitClick(Sender: TObject);
Begin
   If ckTit.Checked Then
      edtTit.Enabled := True
   Else
      edtTit.Enabled := False;
End;

Function TFBalGeneral.StrZ(wNumero: String; wLargo: Integer): String;
Var
   i: integer;
   s: String;
Begin
   s := '';
   For i := 1 To wLargo Do
   Begin
      s := s + '0';
   End;
   result := wNumero + s;
End;

Procedure TFBalGeneral.LlenaCNT301;
Begin
   DMCNT.cdsMovCNT2.Insert;
   DMCNT.cdsMovCNT2.FieldByName('CIAID').AsString := DMCNT.cdsCntTemp.FieldByName('CIAID').AsString;
   DMCNT.cdsMovCNT2.FieldByName('TDIARID').AsString := wtdi;
   DMCNT.cdsMovCNT2.FieldByName('CNTCOMPROB').AsString := wnumco;
   DMCNT.cdsMovCNT2.FieldByName('CNTANO').AsString := wano;
   DMCNT.cdsMovCNT2.FieldByName('CNTANOMM').AsString := wper;
   DMCNT.cdsMovCNT2.FieldByName('CUENTAID').AsString := DMCNT.cdsCntTemp.FieldByName('CUENTAID').AsString;
   DMCNT.cdsMovCNT2.FieldByName('CLAUXID').AsString := DMCNT.cdsCntTemp.FieldByName('CLAUXID').AsString;
   DMCNT.cdsMovCNT2.FieldByName('AUXID').AsString := DMCNT.cdsCntTemp.FieldByName('AUXID').AsString;
   DMCNT.cdsMovCNT2.FieldByName('DOCID').AsString := DMCNT.cdsCntTemp.FieldByName('DOCID').AsString;
   DMCNT.cdsMovCNT2.FieldByName('CNTSERIE').AsString := DMCNT.cdsCntTemp.FieldByName('CNTSERIE').AsString;
   DMCNT.cdsMovCNT2.FieldByName('CNTNODOC').AsString := wnumdo;
   DMCNT.cdsMovCNT2.FieldByName('CNTGLOSA').AsString := DMCNT.cdsCntTemp.FieldByName('CNTGLOSA').AsString;
   DMCNT.cdsMovCNT2.FieldByName('CNTDH').AsString := DMCNT.cdsCntTemp.FieldByName('CNTDH').AsString;
   DMCNT.cdsMovCNT2.FieldByName('CNTTCAMBIO').AsFloat := DMCNT.cdsCntTemp.FieldByName('CNTTCAMBIO').AsFloat;
   DMCNT.cdsMovCNT2.FieldByName('CNTMTOORI').AsFloat := DMCNT.cdsCntTemp.FieldByName('CNTMTOORI').AsFloat;
   DMCNT.cdsMovCNT2.FieldByName('CNTMTOLOC').AsFloat := DMCNT.cdsCntTemp.FieldByName('CNTMTOLOC').AsFloat;
   DMCNT.cdsMovCNT2.FieldByName('CNTMTOEXT').AsFloat := DMCNT.cdsCntTemp.FieldByName('CNTMTOEXT').AsFloat;
   If DMCNT.cdsCntTemp.FieldByName('CNTDH').AsString = 'D' Then
   Begin
      DMCNT.cdsMovCNT2.FieldByName('CNTDEBEMN').AsFloat := DMCNT.cdsCntTemp.FieldByName('CNTMTOLOC').AsFloat;
      DMCNT.cdsMovCNT2.FieldByName('CNTDEBEME').AsFloat := DMCNT.cdsCntTemp.FieldByName('CNTMTOEXT').AsFloat;
   End
   Else
   Begin
      DMCNT.cdsMovCNT2.FieldByName('CNTHABEMN').AsFloat := DMCNT.cdsCntTemp.FieldByName('CNTMTOLOC').AsFloat;
      DMCNT.cdsMovCNT2.FieldByName('CNTHABEME').AsFloat := DMCNT.cdsCntTemp.FieldByName('CNTMTOEXT').AsFloat;
   End;
   DMCNT.cdsMovCNT2.FieldByName('CNTFEMIS').AsDateTime := wfedo;
   DMCNT.cdsMovCNT2.FieldByName('CNTFVCMTO').AsDatetime := wfeve;
   DMCNT.cdsMovCNT2.FieldByName('CNTFCOMP').AsDateTime := wfeco;
   DMCNT.cdsMovCNT2.FieldByName('CNTESTADO').AsString := DMCNT.cdsCntTemp.FieldByName('CNTESTADO').AsString;
   DMCNT.cdsMovCNT2.FieldByName('CNTCUADRE').AsString := 'S';
   DMCNT.cdsMovCNT2.FieldByName('CNTFAUTOM').AsString := '';
   DMCNT.cdsMovCNT2.FieldByName('CNTUSER').AsString := DMCNT.cdsCntTemp.FieldByName('CNTUSER').AsString;
   DMCNT.cdsMovCNT2.FieldByName('CNTFREG').AsDateTime := wfeco;
   DMCNT.cdsMovCNT2.FieldByName('CNTMM').AsString := wmm;
   DMCNT.cdsMovCNT2.FieldByName('TMONID').AsString := '01';
End;

Procedure TFBalGeneral.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFBalGeneral.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;
   Action := caFree;
End;

Procedure TFBalGeneral.dbdtpFReg1Exit(Sender: TObject);
Begin
   If dbdtpFReg1.date = 0 Then
   Begin
      dbdtpFReg1.SetFocus;
      showmessage('Error : Falta Registrar Fecha');
      Raise Exception.Create('Error : Falta Registrar Fecha');
   End;
End;

Procedure TFBalGeneral.dbdtpFReg2Exit(Sender: TObject);
Begin
   If dbdtpFReg2.date = 0 Then
   Begin
      dbdtpFReg2.SetFocus;
      ShowMessage(' Error : Falta Registrar Fecha ');
      Raise Exception.Create(' Error : Falta Registrar Fecha ');
   End;
   If dbdtpFReg2.date < dbdtpFReg1.date Then
   Begin
      dbdtpFReg2.SetFocus;
      ShowMessage(' Error : Fecha ser Mayor ');
      Raise Exception.Create(' Error : Fecha ser Mayor ');
   End;

   rgMoneda.Enabled := True;
End;

Procedure TFBalGeneral.gbPerExit(Sender: TObject);
Var
   xFecha1, xFecha2: TDateTime;
Begin
   If strtofloat(speMM.Text) + 1 = 13 Then
   Begin
      xFecha2 := strtodate('01/01/' + FloatToStr(StrToFloat(speAno.Text) + 1));
   End
   Else
   Begin
      xFecha2 := strtodate('01/' + DMCNT.strZero(floattostr(strtofloat(speMM.Text) + 1), 2) + '/' + speAno.Text);
   End;
   xFecha1 := strtodate('01/' + DMCNT.strZero(speMM.Text, 2) + '/' + speAno.Text);
   xFecha2 := xFecha2 - 1;
   dbdtpFReg1.date := xFecha1;
   dbdtpFReg2.date := xFecha2;
End;

Procedure TFBalGeneral.FormShow(Sender: TObject);
Var
   xAno, xMes, xDia: word;
   xSQL: String;
Begin
// Inicio HPC_201401_CNT
   cbDisenoRep.Visible := False;
   cbDisenoRep.Checked := False;
// Final HPC_201401_CNT

// Inicio HPC_201304_CNT
   bbtn46vs16.Visible := False;
// Fin HPC_201304_CNT

   xSQL := 'Select * from TGE101 Where CNTCONSOL=''S''';
   DMCNT.cdsQry3.Close;
   DMCNT.cdsQry3.DataRequest(xSQL);
   DMCNT.cdsQry3.Open;
   xCiaConsol := DMCNT.cdsQry3.FieldByName('CIAID').AsString;

   DMCNT.Filtracds(DMCNT.cdsNivel, '');

   DMCNT.cdsNivel.IndexFieldNames := 'NIVEL';
   DMCNT.cdsCuenta.Active := True;

   DMCNT.cdsNivel.Last;
   dblcNivel.Text := DMCNT.cdsNivel.FieldByName('NIVEL').AsString;

   dblcCia.Text := '';
   DecodeDate(Date, xAno, xMes, xDia);
   speAno.Value := xAno;
   speMM.Value := xMes;
   gbPerExit(Self);

   DMCNT.cdsCia.Filtered := False;
   If Not DMCNT.cdsCia.Active Then
      DMCNT.cdsCia.Open;
   If DMCNT.cdsCia.RecordCount = 1 Then
   Begin
      dblcCia.Text := DMCNT.cdsCia.fieldbyname('CIAID').AsString;
      edtCia.Text := DMCNT.cdsCia.fieldbyname('CIADES').AsString;
   End;
   perform(CM_DialogKey, VK_TAB, 0);
End;

Procedure TFBalGeneral.pprBalComprobPreviewFormCreate(Sender: TObject);
Begin
   TppReport(Sender).PreviewForm.WindowState := WsMaximized;
   TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zsPageWidth;

End;

Procedure TFBalGeneral.ppDEBEPrint(Sender: TObject);
Begin
   ppDEBE.DisplayFormat := '#,0.00;-#,0.00';
End;

Procedure TFBalGeneral.ppHABERPrint(Sender: TObject);
Begin
   ppHABER.DisplayFormat := '#,0.00;-#,0.00';
End;

Procedure TFBalGeneral.pprBalComprobUnaMonedaPreviewFormCreate(Sender: TObject);
Begin
   TppReport(Sender).PreviewForm.WindowState := WsMaximized;
   TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomPercentage := 120;
   TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zs100Percent;
End;

Procedure TFBalGeneral.IDIFDCalc(Sender: TObject; Var Value: Variant);
Var
   xD, xH: DOUBLE;
Begin
   If ppdbcISALDOD.text = '' Then
      xD := 0
   Else
      xD := ppdbcISALDOD.Value;

   If ppdbcISALDOH.text = '' Then
      xH := 0
   Else
      xH := ppdbcISALDOH.Value;
   If (xH >= xD) Then
   Begin
      Value := (xH - xD);
      IDIFD.Visible := True;
      IDIFH.Visible := False;
   End
   Else
      value := 0;
   ppDBCalc17.Value := ppdbcISALDOD.value + IDIFD.Value;
End;

Procedure TFBalGeneral.ppDBCalc5Calc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         If rgMoneda.ItemIndex = 0 Then
         Else
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         If rgMoneda.ItemIndex = 0 Then
         Else
      End;
   End;
End;

Procedure TFBalGeneral.ppDBCalc6Calc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         If rgMoneda.ItemIndex = 0 Then
         Else
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         If rgMoneda.ItemIndex = 0 Then
         Else
      End;
   End;
End;

Procedure TFBalGeneral.ppdbcADEBECalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcADEBE.Value := ppdbcADEBE.Value + DMCNT.cdsQry.fieldbyname('ADEBE').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcADEBE.Value := ppdbcADEBE.Value + DMCNT.cdsQry.fieldbyname('ADEBE').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppdbcAHABECalc(Sender: TObject);
Begin

   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcAHABE.Value := ppdbcAHABE.Value + DMCNT.cdsQry.fieldbyname('AHABE').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcAHABE.Value := ppdbcAHABE.Value + DMCNT.cdsQry.fieldbyname('AHABE').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppdbcASALDODCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcASALDOD.Value := ppdbcASALDOD.Value + DMCNT.cdsQry.fieldbyname('ASALDOD').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString <= dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcASALDOD.Value := ppdbcASALDOD.Value + DMCNT.cdsQry.fieldbyname('ASALDOD').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppdbcASALDOHCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcASALDOH.Value := ppdbcASALDOH.Value + DMCNT.cdsQry.fieldbyname('ASALDOH').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcASALDOH.Value := ppdbcASALDOH.Value + DMCNT.cdsQry.fieldbyname('ASALDOH').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppdbcISALDODCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcISALDOD.Value := ppdbcISALDOD.Value + DMCNT.cdsQry.fieldbyname('ISALDOD').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcISALDOD.Value := ppdbcISALDOD.Value + DMCNT.cdsQry.fieldbyname('ISALDOD').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppdbcISALDOHCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcISALDOH.Value := ppdbcISALDOH.Value + DMCNT.cdsQry.fieldbyname('ISALDOH').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcISALDOH.Value := ppdbcISALDOH.Value + DMCNT.cdsQry.fieldbyname('ISALDOH').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppdbcESALDODCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcESALDOD.Value := ppdbcESALDOD.Value + DMCNT.cdsQry.fieldbyname('ESALDOD').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcESALDOD.Value := ppdbcESALDOD.Value + DMCNT.cdsQry.fieldbyname('ESALDOD').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppdbcESALDOHCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcESALDOH.Value := ppdbcESALDOH.Value + DMCNT.cdsQry.fieldbyname('ESALDOH').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcESALDOH.Value := ppdbcESALDOH.Value + DMCNT.cdsQry.fieldbyname('ESALDOH').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.IDIFHCalc(Sender: TObject; Var Value: Variant);
Var
   xD, xH: DOUBLE;
Begin
   If ppdbcISALDOH.text = '' Then
      xD := 0
   Else
      xD := ppdbcISALDOH.Value;

   If ppdbcISALDOD.text = '' Then
      xH := 0
   Else
      xH := ppdbcISALDOD.Value;
   If (xH >= xD) Then
   Begin
      Value := (xH - xD);
      IDIFH.Visible := True;
      IDIFD.Visible := False;
   End
   Else
      value := 0;
   ppDBCalc18.value := ppdbcISALDOH.value + value;
End;

Procedure TFBalGeneral.ppdbcDEBECalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcDEBE.Value := ppdbcDEBE.Value + DMCNT.cdsQry.fieldbyname('DEBE').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcDEBE.Value := ppdbcDEBE.Value + DMCNT.cdsQry.fieldbyname('DEBE').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppdbcHABeCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcHABE.Value := ppdbcHABE.Value + DMCNT.cdsQry.fieldbyname('HABE').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcHABE.Value := ppdbcHABE.Value + DMCNT.cdsQry.fieldbyname('HABE').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppdbcHABEANTCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcHABEANT.Value := ppdbcHABEANT.Value + DMCNT.cdsQry.fieldbyname('AHABEANT').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcHABEANT.Value := ppdbcHABEANT.Value + DMCNT.cdsQry.fieldbyname('AHABEANT').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppdbcDEBEANTCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcDEBEANT.Value := ppdbcDEBEANT.Value + DMCNT.cdsQry.fieldbyname('ADEBEANT').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppdbcDEBEANT.Value := ppdbcDEBEANT.Value + DMCNT.cdsQry.fieldbyname('ADEBEANT').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.IDIFD1Calc(Sender: TObject; Var Value: Variant);
Var
   xD, xH: DOUBLE;
Begin
   If ppdbcESALDOD.text = '' Then
      xD := 0
   Else
      xD := ppdbcESALDOD.Value;

   If ppdbcESALDOH.text = '' Then
      xH := 0
   Else
      xH := ppdbcESALDOH.Value;
   If (xH >= xD) Then
   Begin
      Value := (xH - xD);
      IDIFD1.Visible := True;
      IDIFH1.Visible := False;
   End
   Else
      value := 0;
   ppDBCalc19.Value := value + ppdbcESALDOD.value;
End;

Procedure TFBalGeneral.IDIFH1Calc(Sender: TObject; Var Value: Variant);
Var
   xD, xH: DOUBLE;
Begin
   If ppdbcESALDOH.text = '' Then
      xD := 0
   Else
      xD := ppdbcESALDOH.Value;

   If ppdbcESALDOD.text = '' Then
      xH := 0
   Else
      xH := ppdbcESALDOD.Value;
   If (xH >= xD) Then
   Begin
      Value := (xH - xD);
      IDIFH1.Visible := True;
      IDIFD1.Visible := False;
   End
   Else
      Value := 0;
   ppDBCalc20.value := ppdbcESALDOH.value + value;
End;

Procedure TFBalGeneral.ppDBCalc9Calc(Sender: TObject);
Begin
   ppDBCalc9.value := ppdbcDEBEANT.value;
End;

Procedure TFBalGeneral.ppDBCalc10Calc(Sender: TObject);
Begin
   ppDBCalc10.value := ppdbcHABEANT.value;
End;

Procedure TFBalGeneral.ppDBCalc11Calc(Sender: TObject);
Begin
   ppDBCalc11.value := ppdbcDEBE.value;
End;

Procedure TFBalGeneral.ppDBCalc12Calc(Sender: TObject);
Begin
   ppDBCalc12.value := ppdbcHABe.value;
End;

Procedure TFBalGeneral.ppDBCalc13Calc(Sender: TObject);
Begin
   ppDBCalc13.value := ppdbcADEBE.value;
End;

Procedure TFBalGeneral.ppDBCalc14Calc(Sender: TObject);
Begin
   ppDBCalc14.value := ppdbcAHABE.value;
End;

Procedure TFBalGeneral.ppDBCalc15Calc(Sender: TObject);
Begin
   ppDBCalc15.value := ppdbcASALDOD.value;
End;

Procedure TFBalGeneral.ppDBCalc16Calc(Sender: TObject);
Begin
   ppDBCalc16.value := ppdbcASALDOH.value;
End;

Procedure TFBalGeneral.bbtnVerificaClick(Sender: TObject);
Var
   x10: Integer;
Begin

   GeneraSQLVerifica;

   If DMCNT.cdsConsistencia.RecordCount <= 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existen Inconsistencias');
      Exit;
   End;

   pprV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ConsistenciaBalance.rtm';
   pprV.Template.LoadFromFile;
   ppdbV.DataSource := DMCNT.dsConsistencia;

   Screen.Cursor := crDefault;
   If cbDisenoRep.Checked Then
   Begin
      ppdV.Report := pprV;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprV.Print;
      pprV.Stop;
      ppdbV.DataSource := Nil;
      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;
   End;
End;

Procedure TFBalGeneral.GeneraSQLVerifica;
Var
   xSQL: String;
   xAM, xMes: String;
Begin
   Screen.Cursor := crHourGlass;
   xAM := speAno.Text;
   xMes := speMM.Text;

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;

   If dblcCia.Text = xCiaConsol Then
   Begin
      xSQL := 'SELECT A.CIAID, ''' + edtCia.Text + ''' CIADES, '
            + '       A.CUENTAID, A.CNTANOMM, B.CTA_DET, '
            + '       C.CTA_CONSOL, NVL(D.CTA_DET,''N'') CTA_DET_CON, DEBE, HABER '
            + '  FROM '
            + '     ( SELECT A.CIAID, A.CUENTAID, A.CNTANOMM, '
            + '              SUM( CNTDEBEMN ) DEBE, SUM( CNTHABEMN ) HABER '
            + '         FROM CNT301 A '
            + '        WHERE CIAID<>''' + xCiaConsol + ''' '
            + '          AND CNTANOMM=''' + xAM + ''' '
            + '        GROUP BY A.CIAID, A.CUENTAID, A.CNTANOMM '
            + '      ) A, TGE202 B, TGE202 C, TGE202 D '
            + ' WHERE  B.CIAID(+)=''' + xCiaConsol + ''' AND A.CUENTAID=B.CUENTAID(+) '
            + '   AND ( NVL(B.CTA_DET,''N'')=''N'' OR B.CUENTAID IS NULL OR B.CUENTAID='''' ) '
            + '   AND A.CIAID=C.CIAID(+) AND A.CUENTAID=C.CUENTAID(+) '
            + '   AND D.CIAID(+)=''' + xCiaConsol + ''' AND C.CTA_CONSOL=D.CUENTAID(+) '
            + '   AND NVL(D.CTA_DET,''N'')=''N'' '
            + ' ORDER BY A.CIAID, A.CUENTAID, A.CNTANOMM';
   End
   Else
   Begin
      xSQL := 'SELECT A.CIAID, ''' + edtCia.Text + ''' CIADES, '
            + '       A.CUENTAID, A.CNTANOMM, B.CTA_DET, '
            + '       '' '' CTA_CONSOL, '' '' CTA_DET_CON, DEBE, HABER '
            + '  FROM '
            + '     ( SELECT A.CIAID, A.CUENTAID, A.CNTANOMM, '
            + '              SUM( CNTDEBEMN ) DEBE, SUM( CNTHABEMN ) HABER '
            + '         FROM CNT301 A '
            + '        WHERE CIAID=''' + dblcCia.Text + ''' '
            + '          AND CNTANOMM=''' + xAM + ''' '
            + '        GROUP BY A.CIAID, A.CUENTAID, A.CNTANOMM '
            + '      ) A, TGE202 B '
            + ' WHERE  B.CIAID(+)=''' + dblcCia.Text + ''' AND A.CUENTAID=B.CUENTAID(+) '
            + '   AND ( NVL(B.CTA_DET,''N'')=''N'' OR B.CUENTAID IS NULL OR B.CUENTAID='''' ) '
            + ' ORDER BY A.CIAID, A.CUENTAID, A.CNTANOMM';
   End;

   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.Filter := '';
   DMCNT.cdsConsistencia.Filtered := False;
   DMCNT.cdsConsistencia.ProviderName := 'prvCNT';
   DMCNT.cdsConsistencia.DataRequest(xSQL);
   DMCNT.cdsConsistencia.Open;
End;

Procedure TFBalGeneral.bbtnCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFBalGeneral.bbtnRepCmpIniClick(Sender: TObject);
Var
   x10: Integer;
Begin

   GeneraSQLRegIni;

   If DMCNT.cdsConsistencia.RecordCount <= 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existen Inconsistencias');
      Exit;
   End;
   pprV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ConsistenciaCmpIni.rtm';
   pprV.Template.LoadFromFile;
   ppdbV.DataSource := DMCNT.dsConsistencia;

   Screen.Cursor := crDefault;
   If cbDisenoRep.Checked Then
   Begin
      ppdV.Report := pprV;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprV.Print;
      pprV.Stop;
      ppdbV.DataSource := Nil;
      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;
   End;
End;

Procedure TFBalGeneral.GeneraSQLRegIni;
Var
   xSQL: String;
   xAM, xMes: String;
Begin
   xAM := speAno.Text;
   xMes := speMM.Text;

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;

   If dblcCia.Text = xCiaConsol Then
   Begin
      xSQL := 'select CIAID, TDIARID, CNTANOMM, CNTCOMPROB NREG, CNTFCOMP, CNTUSER, CNTDEBEMN, CNTESTADO, MODULO, ''CONTABILIDAD'' ORIGEN, CNTFREG FREG '
            + '  from CNT300 '
            + ' where CIAID>=''02'' AND CNTANOMM=''' + xAM + ''' AND NOT CNTESTADO IN (''P'',''A'') '
            + ' union all '
            + 'select CIAID, TDIARID, CPANOMES, CPNOREG NREG, CXP301.CPFCMPRB, CPUSER, CPMTOORI, CPESTADO, ''CXP'' MODULO, ''OBLIGACIONES'' ORIGEN, CPFREG FREG '
            + '  from CXP301 '
            + ' where CIAID>=''02'' AND CPANOMES=''' + xAM + ''' AND CPESTADO IN (''P'',''C'',''I'',''T'') AND nvl(CP_CONTA,''N'')=''N'' '
            + ' union all '
            + 'select CIAID, TDIARID, CCANOMES, CCNOREG NREG, CXC301.CCFCMPRB, CCUSER, CCMTOORI, CCESTADO, ''CXC'' MODULO, ''VENTAS'' ORIGEN, CCFREG FREG '
            + '  from CXC301 '
            + ' where CIAID>=''02'' AND CCANOMES=''' + xAM + ''' AND CCESTADO IN (''P'',''C'') AND nvl(CC_CONTA,''N'')=''N'' '
            + ' union all '
            + 'select CIAID, TDIARID, ECANOMM, ECNOCOMP NREG, ECFCOMP, ECUSER, ECMTOORI, ECESTADO, ''CAJA'' MODULO, ''TESORERIA'' ORIGEN, ECFREG FREG '
            + '  from CAJA302 '
            + ' where CIAID>=''02'' AND ECANOMM=''' + xAM + ''' AND ECESTADO IN (''P'',''C'',''I'') AND NVL(ECCONTA,''N'')=''N'' and NOT EC_PROCE IS NULL '
            + '   and TDIARID <> ' + QuotedStr('62') //debido a que las detracciones se contabilizan al momento del pago de la det
            + ' order BY ORIGEN, MODULO, CIAID, TDIARID, NREG';
   End
   Else
   Begin
      xSQL := 'Select CIAID, TDIARID, CNTANOMM, CNTCOMPROB NREG, CNTFCOMP, CNTUSER, CNTDEBEMN, CNTESTADO, MODULO, ''CONTABILIDAD'' ORIGEN, CNTFREG FREG '
            + '  from CNT300 '
            + ' where CIAID=''' + dblcCia.Text + ''' AND CNTANOMM=''' + xAM + ''' AND NOT CNTESTADO IN (''P'',''A'') '
            + ' union all '
            + 'Select CIAID, TDIARID, CPANOMES, CPNOREG NREG, CXP301.CPFCMPRB, CPUSER, CPMTOORI, CPESTADO, ''CXP'' MODULO, ''OBLIGACIONES'' ORIGEN, CPFREG FREG '
            + '  from CXP301 '
            + ' where CIAID=''' + dblcCia.Text + ''' AND CPANOMES=''' + xAM + ''' AND CPESTADO IN (''P'',''C'',''I'',''T'') AND nvl(CP_CONTA,''N'')=''N'' '
            + ' union all '
            + 'Select CIAID, TDIARID, CCANOMES, CCNOREG NREG, CXC301.CCFCMPRB, CCUSER, CCMTOORI, CCESTADO, ''CXC'' MODULO, ''VENTAS'' ORIGEN, CCFREG FREG '
            + '  from CXC301 '
            + ' where CIAID=''' + dblcCia.Text + ''' AND CCANOMES=''' + xAM + ''' AND CCESTADO IN (''P'',''C'') AND nvl(CC_CONTA,''N'')=''N'' '
            + ' union all '
            + 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP NREG, ECFCOMP, ECUSER, ECMTOORI, ECESTADO, ''CAJA'' MODULO, ''TESORERIA'' ORIGEN, ECFREG FREG '
            + '  from CAJA302 '
            + ' where CIAID=''' + dblcCia.Text + ''' AND ECANOMM=''' + xAM + ''' AND ECESTADO IN (''P'',''C'',''I'') AND NVL(ECCONTA,''N'')=''N'' and NOT EC_PROCE IS NULL '
            + '   and TDIARID <> ' + QuotedStr('62') //debido a que las detracciones se contabilizan al momento del pago de la det
            + ' order BY ORIGEN, MODULO, CIAID, TDIARID, NREG';
   End;
   Screen.Cursor := crHourGlass;

   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.Filter := '';
   DMCNT.cdsConsistencia.Filtered := False;
   DMCNT.cdsConsistencia.ProviderName := 'prvCNT';
   DMCNT.cdsConsistencia.DataRequest(xSQL);
   DMCNT.cdsConsistencia.Open;

   Screen.Cursor := crDefault;
End;

Procedure TFBalGeneral.GeneraSQLAsientoDesc;
Var
   xSQL: String;
   xAM, xMes: String;
Begin
   xAM := speAno.Text;
   xMes := speMM.Text;

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;

   If dblcCia.Text = xCiaConsol Then
   Begin
      xSQL := 'Select CIAID, TDIARID, CNTANOMM, CNTCOMPROB, ''' + edtCia.Text + ''' CIADES, '
            + '       sum(cntdebemn) debe, sum(cnthabemn) haber, sum(cntdebemn)-sum(cnthabemn) difer '
            + '  from cnt301 '
            + ' where ciaid>=''01'' and cntanomm=''' + xam + ''' and cntestado in (''p'') '
            + ' group by ciaid, tdiarid, cntanomm, cntcomprob '
            + 'having sum(cntdebemn) <> sum(cnthabemn) '
            + ' order by ciaid, tdiarid, cntanomm, cntcomprob';
   End
   Else
   Begin
      xSQL := 'Select CIAID, TDIARID, CNTANOMM, CNTCOMPROB, ''' + edtCia.Text + ''' CIADES, '
            + '       sum(CNTDEBEMN) debe, sum(cnthabemn) haber, sum(CNTDEBEMN)-sum(cnthabemn) DIFER '
            + '  from CNT301 '
            + ' where CIAID=''' + dblcCia.Text + ''' AND CNTANOMM=''' + xAM + ''' AND CNTESTADO IN (''P'') '
            + ' group BY CIAID, TDIARID, CNTANOMM, CNTCOMPROB '
            + 'having sum(CNTDEBEMN) <> sum(cnthabemn) '
            + ' order BY CIAID, TDIARID, CNTANOMM, CNTCOMPROB';
   End;
   Screen.Cursor := crHourGlass;

   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.Filter := '';
   DMCNT.cdsConsistencia.Filtered := False;
   DMCNT.cdsConsistencia.ProviderName := 'prvCNT';
   DMCNT.cdsConsistencia.DataRequest(xSQL);
   DMCNT.cdsConsistencia.Open;

   Screen.Cursor := crDefault;
End;

Procedure TFBalGeneral.GeneraSQLAsientoSinCta;
Var
   xSQL: String;
   xAM, xMes: String;
Begin
   xAM := speAno.Text;
   xMes := speMM.Text;

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;

   If dblcCia.Text = xCiaConsol Then
   Begin
      xSQL := 'Select CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CUENTAID, ''' + edtCia.Text + ''' CIADES, '
            + '       CNTDEBEMN, CNTHABEMN, CNTGLOSA, DOCID, CNTSERIE, CNTNODOC, CLAUXID, AUXID, CCOSID '
            + '  from CNT301 '
            + ' where CIAID>=''01'' AND CNTANOMM=''' + xAM + ''' AND CNTESTADO IN (''P'') AND CUENTAID IS NULL '
            + ' order by CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CUENTAID';
   End
   Else
   Begin
      xSQL := 'Select CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CUENTAID, ''' + edtCia.Text + ''' CIADES, '
            + '       CNTDEBEMN, CNTHABEMN, CNTGLOSA, DOCID, CNTSERIE, CNTNODOC, CLAUXID, AUXID, CCOSID '
            + '  from CNT301 '
            + ' where CIAID=''' + dblcCia.Text + ''' AND CNTANOMM=''' + xAM + ''' AND CNTESTADO IN (''P'') AND CUENTAID IS NULL '
            + ' order by CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CUENTAID';
   End;
   Screen.Cursor := crHourGlass;

   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.Filter := '';
   DMCNT.cdsConsistencia.Filtered := False;
   DMCNT.cdsConsistencia.ProviderName := 'prvCNT';
   DMCNT.cdsConsistencia.DataRequest(xSQL);
   DMCNT.cdsConsistencia.Open;

   Screen.Cursor := crDefault;

End;

Procedure TFBalGeneral.GeneraSQLComparaConsol;
Var
   xSQL: String;
   xAM, xMes, xMesA, xAno: String;
Begin
   xAM := speAno.Text;
   xAno := speAno.Text;
   xMes := speMM.Text;

   xMesA := DMCNT.StrZero(inttostr(strtoint(speMM.Text) - 1), 2);

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;

// Inicio HPC_201401_CNT .
//
   xSQL := 'select '+quotedstr(speAno.Text+speMM.Text)+' ANOMM, '
         + '       A.CUENTAID, SALDMN' + xMesA + ' CON_SALINI, DEBEMN' + xMes + ' CON_DEBE, HABEMN' + xMes + ' CON_HABER, nvl(SALDMN' + xMes + ',0) CON_SALFIN, '
         + '       SALDOANT SUM_SALINI, DEBE SUM_DEBE, HABE SUM_HABER, SALDOSUM SUM_SALFIN, '
         + '       SALDMN' + xMes + '-SALDOSUM DIFERENCIA_SALDO '
         + '  from CNT401 A, '
         + '      (select CUENTAID, sum(SALDMN' + xMesA + ') SALDOANT, sum(DEBEMN' + xMes + ') DEBE, sum(HABEMN' + xMes + ') HABE, '
         + '              sum(nvl(SALDMN' + xMes + ',0)) SALDOSUM '
         + '         from CNT401 A '
         + '        where A.CIAID>=''02'' and A.ANO=''' + xAno + ''' and TIPREG=''1'' '
         + '        group by CUENTAID '
         + '       ) b '
         + ' where A.CIAID=''01'' and A.ANO=''' + xAno + ''' and A.TIPREG=''1'' '
         + '   and A.CUENTAID=B.CUENTAID(+) '
         + '   and nvl(SALDMN' + xMes + ',0)<>nvl(SALDOSUM,0) '
         + ' order by CUENTAID';
// Final HPC_201401_CNT .

   Screen.Cursor := crHourGlass;

   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.Filter := '';
   DMCNT.cdsConsistencia.Filtered := False;
   DMCNT.cdsConsistencia.ProviderName := 'prvCNT';
   DMCNT.cdsConsistencia.DataRequest(xSQL);
   DMCNT.cdsConsistencia.Open;

   Screen.Cursor := crDefault;

End;

Procedure TFBalGeneral.GeneraSQLCtaDetalle;
Var
   xSQL: String;
Begin
   xSQL := 'select a.ciaid, a.cuentaid, a.cta_det, ''' + edtCia.Text + ''' CIADES, '
         + '       case when count(*)>1 then ''N'' else ''S'' end CTA_DET_CAL, '
         + '       case when a.cta_det<>case when count(*)>1 then ''N'' else ''S'' end then ''Dif'' else '''' end dif '
         + '  from tge202 a, tge202 b '
         + ' where a.ciaid=''' + dblcCia.Text + ''' '
         + '   and a.ciaid=b.ciaid(+) and b.cuentaid like a.cuentaid||''%'' '
         + ' group by a.ciaid, a.cuentaid, a.cta_det '
         + 'having a.cta_det<>case when count(*)>1 then ''N'' else ''S'' end '
         + ' order by a.ciaid, a.cuentaid, a.cta_det';
   Screen.Cursor := crHourGlass;
   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.Filter := '';
   DMCNT.cdsConsistencia.Filtered := False;
   DMCNT.cdsConsistencia.ProviderName := 'prvCNT';
   DMCNT.cdsConsistencia.DataRequest(xSQL);
   DMCNT.cdsConsistencia.Open;

   Screen.Cursor := crDefault;
End;

Procedure TFBalGeneral.BitBtn1Click(Sender: TObject);
Var
   xWhere2, xMes, wMesAnt: String;
   xSQL: AnsiString;
   CampoH, CampoS, CampoD: String;
   sSaldoD, sSaldoH, sISaldoD, sISaldoH, sESaldoD, sESaldoH: String;
   sMon, sWhere, sDebe, sDebeAnt, sHabe, sHabeAnt, sHaving: String;
   i, x10: integer;
   xAM, cEstadoRep, xCierre: String;
Begin
   If edtCia.Text = '' Then
   Begin
      showmessage('Compañía no válida');
      Raise exception.Create('Compañía no válida');
   End;

   If dblcNivel.Text = '' Then
   Begin
      ShowMessage('Seleccione un Nivel de Detalle de Cuenta');
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   xAM := speAno.Text;
   xMes := speMM.Text;

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;

   DMCNT.cdsQry.CancelUpdates;
   DMCNT.cdsQry.IndexFieldNames := '';
   DMCNT.cdsQry.Filter := '';
   DMCNT.cdsQry.Filtered := True;

   xSql := 'Select * from TGE154 where CIAID=' + quotedstr(dblcCia.text) + ' and ANO=' + quotedstr(speAno.Text);
   DMCNT.cdsCierres.close;
   DMCNT.cdsCierres.datarequest(xsql);
   DMCNT.cdsCierres.open;
   If DMCNT.cdsCierres.FieldByName('PER' + xMes).AsString = 'S' Then
   Begin

      GeneraSQLVerifica;

      If DMCNT.cdsConsistencia.RecordCount > 0 Then
      Begin
         Screen.Cursor := crDefault;
         ShowMessage('Error : Existen Inconsistencias, Emitir Reporte');
         Exit;
      End;
   End;

   GeneraSQLRegIni;

   cEstadoRep := ' ';
   If DMCNT.cdsConsistencia.RecordCount > 0 Then
      cEstadoRep := 'BALANCE PRELIMINAR : EXISTEN REGISTROS EN ESTADO INICIAL, VERIFICAR';

   Screen.Cursor := crHourGlass;
   xnivel := '';
   xsql := '';
// ACUMULADO DEL DEBE Y HABER
   If rgMoneda.ItemIndex = 1 Then // CUANDO ES MONDEDA EXTRANJERA
   Begin
      sMon := 'ME';
      sWhere := 'TMON_LOC=''E''';
   End
   Else
   Begin
      sMon := 'MN';
      sWhere := 'TMON_LOC=''L''';
   End;

// ACUMULADO INCLUYENDO EL MES ACTUAL
   For i := 0 To StrToInt(speMM.text) Do
   Begin
      sDebe := sDebe + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      sHabe := sHabe + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
   End;
   //QUITAR EL ULTIMO + DE LA CADENA
   sDebe := Copy(sDebe, 1, Length(sDebe) - 1);
   sHabe := Copy(sHabe, 1, Length(sHabe) - 1);

// SALDOS ANTERIORES
   For i := 0 To StrToInt(speMM.text) - 1 Do
   Begin
      sDebeAnt := sDebeAnt + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      sHabeAnt := sHabeAnt + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
   End;

   If StrToInt(speMM.text) - 1 > 0 Then
      If StrToInt(speMM.text) = 1 Then
      Begin
         sDebeAnt := sDebeAnt + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
         sHabeAnt := sHabeAnt + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      End;

   If Length(sDebeAnt) = 0 Then
   Begin
      sDebeAnt := sDebeAnt + ' 0.00+';
      sHabeAnt := sHabeAnt + ' 0.00+';
   End;

   //QUITAR EL ULTIMO + DE LA CADENA
   sDebeAnt := Copy(sDebeAnt, 1, Length(sDebeAnt) - 1);
   sHabeant := Copy(sHabeAnt, 1, Length(sHabeAnt) - 1);
   sDebeAnt := sDebeAnt + ' ADEBEANT, ';
   sHabeAnt := sHabeAnt + ' AHABEANT, ';

{   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      sSaldoD := ' CASE WHEN (' + sDebe + ' - (' + sHabe + '))>0 THEN ' + sDebe + ' - (' + sHabe + ') ELSE 0 END ASALDOD, ';
      sSaldoh := ' CASE WHEN (' + sHabe + ' - (' + sDebe + '))>0 THEN ' + sHabe + ' - (' + sDebe + ') ELSE 0 END ASALDOH, ';

      sISaldoD := ' CASE WHEN (TGE202.CTA_TIPO IN (''O'',''A'',''P'')) AND (' + sDebe + ' - (' + sHabe + '))>0 THEN ' + sDebe + ' - (' + sHabe + ') ELSE 0 END ISALDOD, ';
      sISaldoH := ' CASE WHEN (TGE202.CTA_TIPO IN (''O'',''A'',''P'')) AND (' + sHabe + ' - (' + sDebe + '))>0 THEN ' + sHabe + ' - (' + sDebe + ') ELSE 0 END ISALDOH, ';

      sESaldoD := ' CASE WHEN (TGE202.CTA_TIPO IN (''G'',''I'',''R'',''N'')) AND (' + sDebe + ' - (' + sHabe + '))>0 THEN ' + sDebe + ' - (' + sHabe + ') ELSE 0 END ESALDOD, ';
      sESaldoH := ' CASE WHEN (TGE202.CTA_TIPO IN (''G'',''I'',''R'',''N'')) AND (' + sHabe + ' - (' + sDebe + '))>0 THEN ' + sHabe + ' - (' + sDebe + ') ELSE 0 END ESALDOH, ';

      sDebe := sDebe + ' ADEBE, ';
      sHabe := sHabe + ' AHABE, ';
   End
   Else
   Begin
}
      sSaldoD := ' DECODE(LEAST( (' + sDebe + ' - (' + sHabe + ')),0),0,' + sDebe + ' - (' + sHabe + '), 0 ) ASALDOD, ';
      sSaldoh := ' DECODE(LEAST( (' + sHabe + ' - (' + sDebe + ')),0),0,' + sHabe + ' - (' + sDebe + '), 0 ) ASALDOH, ';

      sISaldoD := ' DECODE(LEAST((' + sDebe + ' - (' + sHabe + ')),0),0,DECODE(TGE202.CTA_TIPO,''A'',' + sDebe + ' - (' + sHabe + ')),0,0) ISALDOD, ';
      sISaldoH := ' DECODE(LEAST((' + sHabe + ' - (' + sDebe + ')),0),0,DECODE(TGE202.CTA_TIPO,''A'',' + sHabe + ' - (' + sDebe + ')),0,0) ISALDOH, ';

      sESaldoD := ' DECODE(LEAST((' + sDebe + ' - (' + sHabe + ')),0),0,DECODE(TGE202.CTA_TIPO,''R'',' + sDebe + ' - (' + sHabe + '),''R'',' + sDebe + ' - (' + sHabe + '),0),0) ESALDOD, ';
      sESaldoH := ' DECODE(LEAST((' + sHabe + ' - (' + sDebe + ')),0),0,DECODE(TGE202.CTA_TIPO,''R'',' + sHabe + ' - (' + sDebe + '),''R'',' + sHabe + ' - (' + sDebe + '),0),0) ESALDOH, ';

      sDebe := sDebe + ' ADEBE, ';
      sHabe := sHabe + ' AHABE, ';

//   End;
   xnivel := '';
   xsql := '';

{   If (SRV_D = 'DB2400') Then
      xsql := 'NIVEL=' + quotedstr('0' + IntToStr(StrToInt(dblcNivel.text) + 1))
   Else
}
      xsql := 'NIVEL=' + quotedstr(IntToStr(StrToInt(dblcNivel.text) + 1));

   If DMCNT.DisplayDescrip('PrvTGE', 'CNT202', '*', xsql, 'NIVEL') = '' Then
      xnivel := '0'
   Else
      xnivel := '1';

   xSQL := 'Delete CNT_BAL_INV Where PERIODO=''' + xAM + '''';
   DMCNT.DCOM1.AppServer.EjecutaSQL(XSQL);

   DMCNT.cdsCia.First;
   While Not DMCNT.cdsCia.Eof Do
   Begin
      dblcCia.Text := DMCNT.cdsCia.FieldByName('CIAID').AsString;

      xWhere := 'CNT401.CIAID=' + '''' + dblcCia.Text + ''''
              + ' AND CNT401.ANO=' + '''' + speAno.Text + ''''
              + ' AND CNT401.TIPO<=' + '''' + dblcNivel.Text + ''''
              + ' AND (CNT401.AUXID IS NULL OR CNT401.AUXID='''') '
              + ' AND (CNT401.CCOSID IS NULL OR CNT401.CCOSID='''')'
              + ' AND LENGTH(CNT401.CUENTAID) <> 1';

      xMes := speMM.Text;

      If (StrToInt(xmes) - 1) <= 9 Then
         wMesAnt := '0' + inttostr((StrToInt(xmes) - 1));

      If length(xMes) < 2 Then xMes := '0' + xMes;

      CampoS := ' SALD' + sMon + wMesAnt; // wmes
      CampoD := ' DEBE' + sMon + xMes;
      CampoH := ' HABE' + sMon + xMes;

{      If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
      Begin
         If UpperCase(wRutaRpt) = 'SOLFORMATOS\CNT\INCORESA' Then
         Begin
            xSQL := 'SELECT CNT401.CUENTAID, CNT401.CTADES, '
               + sDebeAnt + sHabeant + CampoD + ' DEBE,' + CampoH + ' HABE, ' + sDebe + sHabe + sSaldoD + sSaldoH + sISaldoD + sISaldoH + sESaldoD + sESaldoH
               + ' TGE202.CTA_DET, CNT401.TIPO'
               + ' FROM CNT401 '
               + ' LEFT JOIN TGE202 ON ( CNT401.CIAID=TGE202.CIAID AND CNT401.CUENTAID=TGE202.CUENTAID) WHERE ';
            xSQL := xSQL + xWhere + ' ORDER BY CNT401.CUENTAID';
         End
         Else
         Begin

            xSQL := 'SELECT CNT401.CUENTAID, CNT401.CTADES, '
               + sDebeAnt + sHabeant + CampoD + ' DEBE,' + CampoH + ' HABE, ' + sDebe + sHabe + sSaldoD + sSaldoH + sISaldoD + sISaldoH + sESaldoD + sESaldoH
               + ' TGE202.CTA_DET, CNT401.TIPO'
               + ' FROM CNT401 '
               + ' LEFT JOIN TGE202 ON (CNT401.CIAID=TGE202.CIAID AND CNT401.CUENTAID = TGE202.CUENTAID) WHERE ';
            xSQL := xSQL + xWhere + ' ORDER BY CNT401.CUENTAID';
         End;
      End
      Else
         If SRV_D = 'ORACLE' Then
         Begin
}
            xSQL := 'SELECT CNT401.CIAID, CNT401.CUENTAID, NVL(CNT401.CTADES,''X'') CTADES, '
               + sDebeAnt + sHabeant + CampoD + ' DEBE,' + CampoH + ' HABE, ' + sDebe + sHabe + sSaldoD + sSaldoH + sISaldoD + sISaldoH + sESaldoD + sESaldoH
               + ' TGE202.CTA_DET, CNT401.TIPO, ''' + cEstadoRep + ''' ESTADO '
               + ' FROM CNT401, TGE202'
               + ' WHERE (CNT401.CUENTAID = TGE202.CUENTAID(+)) AND (CNT401.CIAID = TGE202.CIAID(+)) AND '; //+sHaving+' <> 0 AND ';
            xSQL := xSQL + xWhere;
            xsql := xsql + ' ORDER BY CNT401.CUENTAID';
//         End;

      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.ProviderName := 'prvCNT';
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
      DMCNT.cdsQry.Filter := ' ADEBE <>0.00 or AHABE <>0.00 ';
      DMCNT.cdsQry.Filtered := True;
      If DMCNT.cdsQry.RecordCount = 0 Then
      Begin
         ShowMessage('No hay Datos Para Las Condiciones Seleccionadas');
         DMCNT.cdsQry.Filter := '';
         DMCNT.cdsQry.Filtered := True;
      End;

      DMCNT.cdsQry.First;
      While Not DMCNT.cdsQry.Eof Do
      Begin

         If dblcCia.Text <> '03' Then
         Begin

            xSQL := 'Select * '
                   +'  from CNT_BAL_INV '
                   +' Where PERIODO=''' + xAM + ''' AND CUENTAID=''' + DMCNT.cdsQry.FieldByname('CUENTAID').AsString + '''';
            DMCNT.cdsQry2.Close;
            DMCNT.cdsQry2.ProviderName := 'prvCNT';
            DMCNT.cdsQry2.DataRequest(xSQL);
            DMCNT.cdsQry2.Open;
            If dblcCia.Text = '01' Then
            Begin
               If DMCNT.cdsQry2.recordcount = 1 Then
               Begin
                  xSQL := 'update CNT_BAL_INV '
                        + '   set CIAD' + dblcCia.Text + '=' + FloatToStr(DMCNT.cdsQry.FieldByname('ISALDOD').AsFloat) + ', '
                        + '       CIAH' + dblcCia.Text + '=' + FloatToStr(DMCNT.cdsQry.FieldByname('ISALDOH').AsFloat) + ', '
                        + '       CIAID' + dblcCia.Text + '=' + FloatToStr(DMCNT.cdsQry.FieldByname('ADEBEANT').AsFloat) + ', '
                        + '       CIAIH' + dblcCia.Text + '=' + FloatToStr(DMCNT.cdsQry.FieldByname('AHABEANT').AsFloat) + ' '
                        + ' Where PERIODO=''' + xAM + ''' AND CUENTAID=''' + DMCNT.cdsQry.FieldByname('CUENTAID').AsString + '''';
                  DMCNT.DCOM1.AppServer.EjecutaSQL(XSQL);
               End
               Else
               Begin
                  xSQL := 'insert into CNT_BAL_INV( PERIODO, CIAD' + dblcCia.Text + ', CIAH' + dblcCia.Text + ', CIAID' + dblcCia.Text + ', CIAIH' + dblcCia.Text + ', CUENTAID, CTADES ) '
                        + 'Values( ''' + xAM + ''', '
                        +          FloatToStr(DMCNT.cdsQry.FieldByname('ISALDOD').AsFloat) + ', '
                        +          FloatToStr(DMCNT.cdsQry.FieldByname('ISALDOH').AsFloat) + ', '
                        +          FloatToStr(DMCNT.cdsQry.FieldByname('ADEBEANT').AsFloat) + ', '
                        +          FloatToStr(DMCNT.cdsQry.FieldByname('AHABEANT').AsFloat) + ', '
                        +          '''' + DMCNT.cdsQry.FieldByname('CUENTAID').AsString + ''', '
                        +          '''' + DMCNT.cdsQry.FieldByname('CTADES').AsString + ''' ) ';
                  DMCNT.DCOM1.AppServer.EjecutaSQL(XSQL);
               End;
            End
            Else
            Begin
               If DMCNT.cdsQry2.recordcount = 1 Then
               Begin
                  xSQL := 'update CNT_BAL_INV '
                        + '   set CIAD' + dblcCia.Text + '=' + FloatToStr(DMCNT.cdsQry.FieldByname('ISALDOD').AsFloat) + ', '
                        + '       CIAH' + dblcCia.Text + '=' + FloatToStr(DMCNT.cdsQry.FieldByname('ISALDOH').AsFloat) + ', '
                        + '       CIAID' + dblcCia.Text + '=' + FloatToStr(DMCNT.cdsQry.FieldByname('ADEBEANT').AsFloat) + ', '
                        + '       CIAIH' + dblcCia.Text + '=' + FloatToStr(DMCNT.cdsQry.FieldByname('AHABEANT').AsFloat) + ', '
                        + '       TOTDEBE =nvl(TOTDEBE,0) +' + FloatToStr(DMCNT.cdsQry.FieldByname('ISALDOD').AsFloat) + ', '
                        + '       TOTHABER=nvl(TOTHABER,0)+' + FloatToStr(DMCNT.cdsQry.FieldByname('ISALDOH').AsFloat) + ', '
                        + '       INIDEBE =nvl(INIDEBE,0) +' + FloatToStr(DMCNT.cdsQry.FieldByname('ADEBEANT').AsFloat) + ', '
                        + '       INIHABER=nvl(INIHABER,0)+' + FloatToStr(DMCNT.cdsQry.FieldByname('AHABEANT').AsFloat) + ' '
                        + ' Where PERIODO=''' + xAM + ''' AND CUENTAID=''' + DMCNT.cdsQry.FieldByname('CUENTAID').AsString + '''';
                  DMCNT.DCOM1.AppServer.EjecutaSQL(XSQL);
               End
               Else
               Begin
                  xSQL := 'insert into CNT_BAL_INV(PERIODO, CIAD' + dblcCia.Text + ', CIAH' + dblcCia.Text + ', CIAID' + dblcCia.Text + ', CIAIH' + dblcCia.Text + ', '
                        + '                        CUENTAID, CTADES, TOTDEBE, TOTHABER, INIDEBE, INIHABER ) '
                        + 'Values( ''' + xAM + ''', '
                        +          FloatToStr(DMCNT.cdsQry.FieldByname('ISALDOD').AsFloat) + ', '
                        +          FloatToStr(DMCNT.cdsQry.FieldByname('ISALDOH').AsFloat) + ', '
                        +          FloatToStr(DMCNT.cdsQry.FieldByname('ADEBEANT').AsFloat) + ', '
                        +          FloatToStr(DMCNT.cdsQry.FieldByname('AHABEANT').AsFloat) + ', '
                        +          '''' + DMCNT.cdsQry.FieldByname('CUENTAID').AsString + ''', '
                        +          '''' + DMCNT.cdsQry.FieldByname('CTADES').AsString + ''', '
                        +          FloatToStr(DMCNT.cdsQry.FieldByname('ISALDOD').AsFloat) + ', '
                        +          FloatToStr(DMCNT.cdsQry.FieldByname('ISALDOH').AsFloat) + ', '
                        +          FloatToStr(DMCNT.cdsQry.FieldByname('ADEBEANT').AsFloat) + ', '
                        +          FloatToStr(DMCNT.cdsQry.FieldByname('AHABEANT').AsFloat) + ' )';
                  DMCNT.DCOM1.AppServer.EjecutaSQL(XSQL);
               End;
            End;
         End;
         DMCNT.cdsQry.Next;
      End;
      DMCNT.cdsQry.CancelUpdates;
      DMCNT.cdsQry.IndexFieldNames := '';
      DMCNT.cdsQry.Filter := '';
      DMCNT.cdsQry.Filtered := True;
      DMCNT.cdsCia.Next;
   End;

   Screen.Cursor := crDefault;
   ShowMessage('ok');

End;

Procedure TFBalGeneral.bbtnExcel1Click(Sender: TObject);
Var
   xWhere2, xMes, wMesAnt, sSQL1, sSQL2, sSQL3, sSQL4, sSQL5, sSQL6: String;
   xSQL: AnsiString;
   CampoH, CampoS, CampoD: String;
   sSaldoD, sSaldoH, sISaldoD, sISaldoH, sESaldoD, sESaldoH: String;
   sMon, sWhere, sDebe, sDebeAnt, sHabe, sHabeAnt, sHaving: String;
   i, x10: integer;
   xAM, cEstadoRep, xCierre: String;
Begin
   If edtCia.Text = '' Then
   Begin
      showmessage('Compañía no válida');
      Raise exception.Create('Compañía no válida');
   End;

   If dblcNivel.Text = '' Then
   Begin
      ShowMessage('Seleccione un Nivel de Detalle de Cuenta');
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   xAM := speAno.Text;
   xMes := speMM.Text;

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;

   xSql := 'SELECT * FROM TGE154 WHERE CIAID=' + quotedstr(dblcCia.text) + ' and ANO=' + quotedstr(speAno.Text);
   DMCNT.cdsCierres.close;
   DMCNT.cdsCierres.datarequest(xsql);
   DMCNT.cdsCierres.open;
   If DMCNT.cdsCierres.FieldByName('PER' + xMes).AsString = 'S' Then
   Begin

      GeneraSQLVerifica;

      If DMCNT.cdsConsistencia.RecordCount > 0 Then
      Begin
         Screen.Cursor := crDefault;
         ShowMessage('Error : Existen Inconsistencias, Emitir Reporte');
         Exit;
      End;
   End;

   DMCNT.cdsQry.Filtered := false;
   DMCNT.cdsQry.Filter := '';

   GeneraSQLRegIni;

   cEstadoRep := ' ';
   If DMCNT.cdsConsistencia.RecordCount > 0 Then
      cEstadoRep := 'BALANCE PRELIMINAR : EXISTEN REGISTROS EN ESTADO INICIAL, VERIFICAR';

   Screen.Cursor := crHourGlass;
   xnivel := '';
   xsql := '';
// ACUMULADO DEL DEBE Y HABER
   If rgMoneda.ItemIndex = 1 Then // CUANDO ES MONDEDA EXTRANJERA
   Begin
      sMon := 'ME';
      sWhere := 'TMON_LOC=''E''';
   End
   Else
   Begin
      sMon := 'MN';
      sWhere := 'TMON_LOC=''L''';
   End;

// ACUMULADO INCLUYENDO EL MES ACTUAL
   For i := 0 To StrToInt(speMM.text) Do
   Begin
      sDebe := sDebe + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      sHabe := sHabe + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
   End;
   //QUITAR EL ULTIMO + DE LA CADENA
   sDebe := Copy(sDebe, 1, Length(sDebe) - 1);
   sHabe := Copy(sHabe, 1, Length(sHabe) - 1);

  // SALDOS ANTERIORES
   For i := 0 To StrToInt(speMM.text) - 1 Do
   Begin
      sDebeAnt := sDebeAnt + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      sHabeAnt := sHabeAnt + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
   End;

   If StrToInt(speMM.text) - 1 > 0 Then
      If StrToInt(speMM.text) = 1 Then
      Begin
         sDebeAnt := sDebeAnt + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
         sHabeAnt := sHabeAnt + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      End;

   If Length(sDebeAnt) = 0 Then
   Begin
      sDebeAnt := sDebeAnt + ' 0.00+';
      sHabeAnt := sHabeAnt + ' 0.00+';
   End;

   //QUITAR EL ULTIMO + DE LA CADENA
   sDebeAnt := Copy(sDebeAnt, 1, Length(sDebeAnt) - 1);
   sHabeant := Copy(sHabeAnt, 1, Length(sHabeAnt) - 1);
   sDebeAnt := sDebeAnt + ' ADEBEANT, ';
   sHabeAnt := sHabeAnt + ' AHABEANT, ';

// Inicio HPC_201602_CNT
// 21/07/2016 Modifica para generar Excel diferenciado cuando es Nivel 5 (Cuentas de Detalle)
   {
      sSaldoD := ' DECODE(LEAST( (' + sDebe + ' - (' + sHabe + ')),0),0,' + sDebe + ' - (' + sHabe + '), 0 ) ASALDOD, ';
      sSaldoh := ' DECODE(LEAST( (' + sHabe + ' - (' + sDebe + ')),0),0,' + sHabe + ' - (' + sDebe + '), 0 ) ASALDOH, ';

      sISaldoD := ' DECODE(LEAST((' + sDebe + ' - (' + sHabe + ')),0),0,DECODE(TGE202.CTA_TIPO,''A'',' + sDebe + ' - (' + sHabe + ')),0,0) ISALDOD, ';
      sISaldoH := ' DECODE(LEAST((' + sHabe + ' - (' + sDebe + ')),0),0,DECODE(TGE202.CTA_TIPO,''A'',' + sHabe + ' - (' + sDebe + ')),0,0) ISALDOH, ';

      sESaldoD := ' DECODE(LEAST((' + sDebe + ' - (' + sHabe + ')),0),0,DECODE(TGE202.CTA_TIPO,''R'',' + sDebe + ' - (' + sHabe + '),''R'',' + sDebe + ' - (' + sHabe + '),0),0) ESALDOD, ';
      sESaldoH := ' DECODE(LEAST((' + sHabe + ' - (' + sDebe + ')),0),0,DECODE(TGE202.CTA_TIPO,''R'',' + sHabe + ' - (' + sDebe + '),''R'',' + sHabe + ' - (' + sDebe + '),0),0) ESALDOH, ';

      sDebe := sDebe + ' ADEBE, ';
      sHabe := sHabe + ' AHABE, ';
   }

   sSaldoD := 'case when (' + sDebe + ' - (' + sHabe + '))<= 0 '
      + '           then 0 '
      + '           else (' + sDebe + ' - (' + sHabe + ')) '
      + '       end ASALDOD, ';

   sSaldoH := 'case when (' + sHabe + ' - (' + sDebe + '))<= 0 '
      + '           then 0 '
      + '           else (' + sHabe + ' - (' + sDebe + ')) '
      + '       end ASALDOH, ';

   sISaldoD := 'case when (' + sDebe + ' - (' + sHabe + '))<= 0 '
      + '            then 0 '
      + '            else case when TGE202.CTA_TIPO=''A'' '
      + '                      then (' + sDebe + ' - (' + sHabe + ')) '
      + '                      else 0 '
      + '                  end '
      + '        end ISALDOD, ';

   sISaldoH := 'case when (' + sHabe + ' - (' + sDebe + '))<= 0 '
      + '            then 0 '
      + '             else case when TGE202.CTA_TIPO=''A'' '
      + '                       then (' + sHabe + ' - (' + sDebe + ')) '
      + '                       else 0 '
      + '                   end '
      + '        end ISALDOH, ';

   sESaldoD := 'case when (' + sDebe + ' - (' + sHabe + '))<= 0 '
      + '            then 0 '
      + '            else case when TGE202.CTA_TIPO=''R'' '
      + '                      then (' + sDebe + ' - (' + sHabe + ')) '
      + '                      else 0 '
      + '                  end '
      + '        end ESALDOD, ';

   sESaldoH := 'case when (' + sHabe + ' - (' + sDebe + '))<= 0 '
      + '            then 0 '
      + '             else case when TGE202.CTA_TIPO=''R'' '
      + '                       then (' + sHabe + ' - (' + sDebe + ')) '
      + '                       else 0 '
      + '                   end '
      + '        end ESALDOH, ';

   sDebe := sDebe + ' ADEBE, ';
   sHabe := sHabe + ' AHABE, ';

   xnivel := '';
   //xsql := '';

   xsql := 'NIVEL=' + quotedstr(IntToStr(StrToInt(dblcNivel.text) + 1));

   If DMCNT.DisplayDescrip('PrvTGE', 'CNT202', '*', xsql, 'NIVEL') = '' Then
      xnivel := '0'
   Else
      xnivel := '1';

   If dblcNivel.text<>'5' then
      xWhere := 'CNT401.CIAID='+quotedstr(dblcCia.Text)
         +      ' AND CNT401.ANO='+quotedstr(speAno.Text)
         +      ' AND CNT401.TIPO<='+quotedstr(dblcNivel.Text)
         +      ' AND (CNT401.AUXID IS NULL OR CNT401.AUXID='''') '
         +      ' AND (CNT401.CCOSID IS NULL OR CNT401.CCOSID='''')'
         +      ' AND LENGTH(CNT401.CUENTAID) <> 1 '
   Else
      xWhere := 'CNT401.CIAID = '+quotedstr(dblcCia.Text)
         +      ' AND CNT401.ANO='+quotedstr(speAno.Text)
         +      ' AND (TGE202.CIAID(+) = CNT401.CIAID) '
         +      ' AND (TGE202.CUENTAID(+) = CNT401.CUENTAID) '
         +      ' AND TGE202.CTA_DET = ''S'' '
         +      ' AND (CNT401.AUXID IS NULL OR CNT401.AUXID = '''') '
         +      ' AND (CNT401.CCOSID IS NULL OR CNT401.CCOSID = '''') '
         +      ' AND LENGTH(CNT401.CUENTAID) <> 1 ';


   If sCiaCuenta <> '' Then
   Begin
      xWhere := xWhere + ' and CNT401.' + sCiaCuenta;
   End;

   xMes := speMM.Text;

   If (StrToInt(xmes) - 1) <= 9 Then
      wMesAnt := '0' + inttostr((StrToInt(xmes) - 1));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   CampoS := ' SALD' + sMon + wMesAnt; // wmes
   CampoD := ' DEBE' + sMon + xMes;
   CampoH := ' HABE' + sMon + xMes;

   xSQL := 'SELECT CNT401.CUENTAID, CNT401.CTADES, ';

   sSQL1 := sDebeAnt + sHabeant + CampoD + ' DEBE,' + CampoH + ' HABE, ';

   sSQL2 := sDebe + sHabe + sSaldoD + sSaldoH;

   sSQL3 := sISaldoD + sISaldoH;

   sSQL6 := sESaldoD + sESaldoH;

   sSQL4 := ' TGE202.CTA_DET, CNT401.TIPO, ''' + cEstadoRep + ''' ESTADO '
      + ' FROM CNT401, TGE202'
      + ' WHERE (CNT401.CUENTAID = TGE202.CUENTAID(+)) AND (CNT401.CIAID = TGE202.CIAID(+)) AND ';

   sSQL5 := ' ORDER BY CNT401.CUENTAID';

   xSQL := xSQL + sSQL1 + sSQL2 + sSQL3 + sSQL6 + sSQL4 + xWhere + sSQL5;
// Fin HPC_201602_CNT

   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.ProviderName := 'prvCNT';
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   DMCNT.cdsQry.Filter := ' ADEBE <>0.00 or AHABE <>0.00 ';
   DMCNT.cdsQry.Filtered := True;
   If DMCNT.cdsQry.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas');
      DMCNT.cdsQry.Filter := '';
      DMCNT.cdsQry.Filtered := True;
   End;
   DMCNT.cdsQry.First;
   Screen.Cursor := crDefault;
   If rgMoneda.ItemIndex = -1 Then
   Begin
      ShowMessage('Ingrese Tipo de Moneda');
      rgMoneda.SetFocus;
      Exit;
   End;

   DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Balance Comprobacion General',
      dblcCia.Text, // Campañía
      speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
      dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
      dblcNivel.Text, '', // Nivel   - Origen
      '', inttostr(rgMoneda.itemindex), // Lote    -  Moneda
      '', '', // Cuentas - Auxiliares
      '', 'Excel', // Costos - Tipo Salida
      ''); // Tipo Rep

   ExportarExcel;

   DMCNT.cdsQry.CancelUpdates;
   DMCNT.cdsQry.IndexFieldNames := '';
   DMCNT.cdsQry.Filter := '';
   DMCNT.cdsQry.Filtered := True;
End;

Procedure TFBalGeneral.BitBtn2Click(Sender: TObject);
Var
   x10: Integer;
Begin

   GeneraSQLAsientoDesc;

   If DMCNT.cdsConsistencia.RecordCount <= 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existen Inconsistencias');
      Exit;
   End;

   pprV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ConsistenciaCmpDesc.rtm';
   pprV.Template.LoadFromFile;
   ppdbV.DataSource := DMCNT.dsConsistencia;

   Screen.Cursor := crDefault;
   If cbDisenoRep.Checked Then
   Begin
      ppdV.Report := pprV;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprV.Print;
      pprV.Stop;
      ppdbV.DataSource := Nil;
      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;
   End;

End;

Procedure TFBalGeneral.BitBtn3Click(Sender: TObject);
Var
   x10: Integer;
Begin

   GeneraSQLAsientoSinCta;

   If DMCNT.cdsConsistencia.RecordCount <= 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existen Inconsistencias');
      Exit;
   End;
   pprV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ConsistenciaSinCta.rtm';
   pprV.Template.LoadFromFile;
   ppdbV.DataSource := DMCNT.dsConsistencia;

   Screen.Cursor := crDefault;
   If cbDisenoRep.Checked Then
   Begin
      ppdV.Report := pprV;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprV.Print;
      pprV.Stop;
      ppdbV.DataSource := Nil;
      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;
   End;
End;

Procedure TFBalGeneral.CrearCDS;
Begin
   cdsExcel.Close;
   cdsExcel.FieldDefs.Clear;
   cdsExcel.FieldDefs.Add('REP_NUM', ftInteger, 0, False);
   cdsExcel.FieldDefs.Add('CUENTAID', ftString, 15, False);
   cdsExcel.FieldDefs.Add('CTADES', ftString, 40, False);
   cdsExcel.FieldDefs.Add('DEBE_ANT', ftFloat, 0, False);
   cdsExcel.FieldDefs.Add('HABE_ANT', ftFloat, 0, False);
   cdsExcel.FieldDefs.Add('DEBE_MES', ftFloat, 0, False);
   cdsExcel.FieldDefs.Add('HABE_MES', ftFloat, 0, False);
   cdsExcel.FieldDefs.Add('DEBE_ACU', ftFloat, 0, False);
   cdsExcel.FieldDefs.Add('HABE_ACU', ftFloat, 0, False);
   cdsExcel.FieldDefs.Add('DEBE_SAL', ftFloat, 0, False);
   cdsExcel.FieldDefs.Add('HABE_SAL', ftFloat, 0, False);
   cdsExcel.FieldDefs.Add('DEBE_INV', ftFloat, 0, False);
   cdsExcel.FieldDefs.Add('HABE_INV', ftFloat, 0, False);
   cdsExcel.FieldDefs.Add('DEBE_RES', ftFloat, 0, False);
   cdsExcel.FieldDefs.Add('HABE_RES', ftFloat, 0, False);
   cdsExcel.CreateDataSet;
   cdsExcel.Open;
   cdsExcel.EmptyDataSet;
End;

Procedure TFBalGeneral.GenerarCDS;
Var
   xSQL: String;
   nNum: integer;

   dADEBEANT, dAHABEANT: Double;
   dDEBE, dHABE: Double;
   dADEBE, dAHABE: Double;
   dASALDOD, dASALDOH: Double;
   dISALDOD, dISALDOH: Double;
   dESALDOD, dESALDOH: Double;
   dISALDOD2, dISALDOH2: Double;
   dESALDOD2, dESALDOH2: Double;
Begin
   nNum := 0;

// En Blanco
   Inc(nNum);
   cdsExcel.Append;
   cdsExcel.FieldbyName('REP_NUM').AsInteger := nNum;
   cdsExcel.Post;

// Encabezado
   Inc(nNum);
   cdsExcel.Append;
   cdsExcel.FieldbyName('REP_NUM').AsInteger := nNum;
   cdsExcel.FieldbyName('CUENTAID').AsString := edtCia.text;
   cdsExcel.FieldbyName('CTADES').AsString := 'TOTALES';
   cdsExcel.FieldbyName('DEBE_ANT').AsFloat := dADEBEANT;
   cdsExcel.FieldbyName('HABE_ANT').AsFloat := dAHABEANT;
   cdsExcel.FieldbyName('DEBE_MES').AsFloat := dDEBE;
   cdsExcel.FieldbyName('HABE_MES').AsFloat := dHABE;
   cdsExcel.FieldbyName('DEBE_ACU').AsFloat := dADEBE;
   cdsExcel.FieldbyName('HABE_ACU').AsFloat := dAHABE;
   cdsExcel.FieldbyName('DEBE_SAL').AsFloat := dASALDOD;
   cdsExcel.FieldbyName('HABE_SAL').AsFloat := dASALDOH;
   cdsExcel.FieldbyName('DEBE_INV').AsFloat := dISALDOD;
   cdsExcel.FieldbyName('HABE_INV').AsFloat := dISALDOH;
   cdsExcel.FieldbyName('DEBE_RES').AsFloat := dESALDOD;
   cdsExcel.FieldbyName('HABE_RES').AsFloat := dESALDOH;
   cdsExcel.Post;

   dADEBEANT := 0;
   dAHABEANT := 0;
   dDEBE := 0;
   dHABE := 0;
   dADEBE := 0;
   dAHABE := 0;
   dASALDOD := 0;
   dASALDOH := 0;
   dISALDOD := 0;
   dISALDOH := 0;
   dESALDOD := 0;
   dESALDOH := 0;

   DMCNT.cdsQry.First;
   While Not DMCNT.cdsQry.Eof Do
   Begin
      Inc(nNum);
      cdsExcel.Append;
      cdsExcel.FieldbyName('REP_NUM').AsInteger := nNum;
      cdsExcel.FieldbyName('CUENTAID').AsString := DMCNT.cdsQry.FieldbyName('CUENTAID').AsString;
      cdsExcel.FieldbyName('CTADES').AsString := DMCNT.cdsQry.FieldbyName('CTADES').AsString;
      cdsExcel.FieldbyName('DEBE_ANT').AsFloat := DMCNT.cdsQry.FieldbyName('ADEBEANT').AsFloat;
      cdsExcel.FieldbyName('HABE_ANT').AsFloat := DMCNT.cdsQry.FieldbyName('AHABEANT').AsFloat;
      cdsExcel.FieldbyName('DEBE_MES').AsFloat := DMCNT.cdsQry.FieldbyName('DEBE').AsFloat;
      cdsExcel.FieldbyName('HABE_MES').AsFloat := DMCNT.cdsQry.FieldbyName('HABE').AsFloat;
      cdsExcel.FieldbyName('DEBE_ACU').AsFloat := DMCNT.cdsQry.FieldbyName('ADEBE').AsFloat;
      cdsExcel.FieldbyName('HABE_ACU').AsFloat := DMCNT.cdsQry.FieldbyName('AHABE').AsFloat;

      cdsExcel.FieldbyName('DEBE_SAL').AsFloat := DMCNT.cdsQry.FieldbyName('ASALDOD').AsFloat;
      cdsExcel.FieldbyName('HABE_SAL').AsFloat := DMCNT.cdsQry.FieldbyName('ASALDOH').AsFloat;

      cdsExcel.FieldbyName('DEBE_INV').AsFloat := DMCNT.cdsQry.FieldbyName('ISALDOD').AsFloat;
      cdsExcel.FieldbyName('HABE_INV').AsFloat := DMCNT.cdsQry.FieldbyName('ISALDOH').AsFloat;

      cdsExcel.FieldbyName('DEBE_RES').AsFloat := DMCNT.cdsQry.FieldbyName('ESALDOD').AsFloat;
      cdsExcel.FieldbyName('HABE_RES').AsFloat := DMCNT.cdsQry.FieldbyName('ESALDOH').AsFloat;
      cdsExcel.Post;

      If xNivel = '0' Then
      Begin
         If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
         Begin
            dADEBEANT := dADEBEANT + DMCNT.cdsQry.fieldbyname('ADEBEANT').AsFloat;
            dAHABEANT := dAHABEANT + DMCNT.cdsQry.fieldbyname('AHABEANT').AsFloat;
            dDEBE := dDEBE + DMCNT.cdsQry.fieldbyname('DEBE').AsFloat;
            dHABE := dHABE + DMCNT.cdsQry.fieldbyname('HABE').AsFloat;
            dADEBE := dADEBE + DMCNT.cdsQry.fieldbyname('ADEBE').AsFloat;
            dAHABE := dAHABE + DMCNT.cdsQry.fieldbyname('AHABE').AsFloat;
            dASALDOD := dASALDOD + DMCNT.cdsQry.fieldbyname('ASALDOD').AsFloat;
            dASALDOH := dASALDOH + DMCNT.cdsQry.fieldbyname('ASALDOH').AsFloat;
            dISALDOD := dISALDOD + DMCNT.cdsQry.fieldbyname('ISALDOD').AsFloat;
            dISALDOH := dISALDOH + DMCNT.cdsQry.fieldbyname('ISALDOH').AsFloat;
            dESALDOD := dESALDOD + DMCNT.cdsQry.fieldbyname('ESALDOD').AsFloat;
            dESALDOH := dESALDOH + DMCNT.cdsQry.fieldbyname('ESALDOH').AsFloat;
         End;
      End
      Else
      Begin
         If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
            (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
         Begin
            dADEBEANT := dADEBEANT + DMCNT.cdsQry.fieldbyname('ADEBEANT').AsFloat;
            dAHABEANT := dAHABEANT + DMCNT.cdsQry.fieldbyname('AHABEANT').AsFloat;
            dDEBE := dDEBE + DMCNT.cdsQry.fieldbyname('DEBE').AsFloat;
            dHABE := dHABE + DMCNT.cdsQry.fieldbyname('HABE').AsFloat;
            dADEBE := dADEBE + DMCNT.cdsQry.fieldbyname('ADEBE').AsFloat;
            dAHABE := dAHABE + DMCNT.cdsQry.fieldbyname('AHABE').AsFloat;
            dASALDOD := dASALDOD + DMCNT.cdsQry.fieldbyname('ASALDOD').AsFloat;
            dASALDOH := dASALDOH + DMCNT.cdsQry.fieldbyname('ASALDOH').AsFloat;
            dISALDOD := dISALDOD + DMCNT.cdsQry.fieldbyname('ISALDOD').AsFloat;
            dISALDOH := dISALDOH + DMCNT.cdsQry.fieldbyname('ISALDOH').AsFloat;
            dESALDOD := dESALDOD + DMCNT.cdsQry.fieldbyname('ESALDOD').AsFloat;
            dESALDOH := dESALDOH + DMCNT.cdsQry.fieldbyname('ESALDOH').AsFloat;
         End;
      End;

      DMCNT.cdsQry.Next;
   End;

// En Blanco
   Inc(nNum);
   cdsExcel.Append;
   cdsExcel.FieldbyName('REP_NUM').AsInteger := nNum;
   cdsExcel.Post;

// Totales
   Inc(nNum);
   cdsExcel.Append;
   cdsExcel.FieldbyName('REP_NUM').AsInteger := nNum;
   cdsExcel.FieldbyName('CUENTAID').AsString := '';
   cdsExcel.FieldbyName('CTADES').AsString := 'TOTALES';
   cdsExcel.FieldbyName('DEBE_ANT').AsFloat := dADEBEANT;
   cdsExcel.FieldbyName('HABE_ANT').AsFloat := dAHABEANT;
   cdsExcel.FieldbyName('DEBE_MES').AsFloat := dDEBE;
   cdsExcel.FieldbyName('HABE_MES').AsFloat := dHABE;
   cdsExcel.FieldbyName('DEBE_ACU').AsFloat := dADEBE;
   cdsExcel.FieldbyName('HABE_ACU').AsFloat := dAHABE;
   cdsExcel.FieldbyName('DEBE_SAL').AsFloat := dASALDOD;
   cdsExcel.FieldbyName('HABE_SAL').AsFloat := dASALDOH;
   cdsExcel.FieldbyName('DEBE_INV').AsFloat := dISALDOD;
   cdsExcel.FieldbyName('HABE_INV').AsFloat := dISALDOH;
   cdsExcel.FieldbyName('DEBE_RES').AsFloat := dESALDOD;
   cdsExcel.FieldbyName('HABE_RES').AsFloat := dESALDOH;
   cdsExcel.Post;

// Totales
   Inc(nNum);
   cdsExcel.Append;
   cdsExcel.FieldbyName('REP_NUM').AsInteger := nNum;
   cdsExcel.FieldbyName('CUENTAID').AsString := '';
   cdsExcel.FieldbyName('CTADES').AsString := '';
   cdsExcel.FieldbyName('DEBE_ANT').AsFloat := 0;
   cdsExcel.FieldbyName('HABE_ANT').AsFloat := 0;
   cdsExcel.FieldbyName('DEBE_MES').AsFloat := 0;
   cdsExcel.FieldbyName('HABE_MES').AsFloat := 0;
   cdsExcel.FieldbyName('DEBE_ACU').AsFloat := 0;
   cdsExcel.FieldbyName('HABE_ACU').AsFloat := 0;
   cdsExcel.FieldbyName('DEBE_SAL').AsFloat := 0;
   cdsExcel.FieldbyName('HABE_SAL').AsFloat := 0;

   If dISALDOD <= dISALDOH Then
   Begin
      cdsExcel.FieldbyName('DEBE_INV').AsFloat := dISALDOH - dISALDOD;
      cdsExcel.FieldbyName('HABE_INV').AsFloat := 0;
   End
   Else
   Begin
      cdsExcel.FieldbyName('DEBE_INV').AsFloat := 0;
      cdsExcel.FieldbyName('HABE_INV').AsFloat := dISALDOD - dISALDOH;
   End;

   If dESALDOD <= dESALDOH Then
   Begin
      cdsExcel.FieldbyName('DEBE_RES').AsFloat := dESALDOH - dESALDOD;
      cdsExcel.FieldbyName('HABE_RES').AsFloat := 0;
   End
   Else
   Begin
      cdsExcel.FieldbyName('DEBE_RES').AsFloat := 0;
      cdsExcel.FieldbyName('HABE_RES').AsFloat := dESALDOD - dESALDOH;
   End;
   cdsExcel.Post;

   dISALDOD2 := cdsExcel.FieldbyName('DEBE_INV').AsFloat;
   dISALDOH2 := cdsExcel.FieldbyName('HABE_INV').AsFloat;
   dESALDOD2 := cdsExcel.FieldbyName('DEBE_RES').AsFloat;
   dESALDOH2 := cdsExcel.FieldbyName('HABE_RES').AsFloat;

  // Totales 2
   Inc(nNum);
   cdsExcel.Append;
   cdsExcel.FieldbyName('REP_NUM').AsInteger := nNum;
   cdsExcel.FieldbyName('CUENTAID').AsString := '';
   cdsExcel.FieldbyName('CTADES').AsString := '';
   cdsExcel.FieldbyName('DEBE_ANT').AsFloat := dADEBEANT;
   cdsExcel.FieldbyName('HABE_ANT').AsFloat := dAHABEANT;
   cdsExcel.FieldbyName('DEBE_MES').AsFloat := dDEBE;
   cdsExcel.FieldbyName('HABE_MES').AsFloat := dHABE;
   cdsExcel.FieldbyName('DEBE_ACU').AsFloat := dADEBE;
   cdsExcel.FieldbyName('HABE_ACU').AsFloat := dAHABE;
   cdsExcel.FieldbyName('DEBE_SAL').AsFloat := dASALDOD;
   cdsExcel.FieldbyName('HABE_SAL').AsFloat := dASALDOH;

   cdsExcel.FieldbyName('DEBE_INV').AsFloat := dISALDOD + dISALDOD2;
   cdsExcel.FieldbyName('HABE_INV').AsFloat := dISALDOH + dISALDOH2;
   cdsExcel.FieldbyName('DEBE_RES').AsFloat := dESALDOD + dESALDOD2;
   cdsExcel.FieldbyName('HABE_RES').AsFloat := dESALDOH + dESALDOH2;
   cdsExcel.Post;

End;

Procedure TFBalGeneral.bbtnExcel2Click(Sender: TObject);
Var
   i: Integer;
   Sheet: Variant;
   nNum: integer;
   sMoneda: String;

   dADEBEANT, dAHABEANT: Double;
   dDEBE, dHABE: Double;
   dADEBE, dAHABE: Double;
   dASALDOD, dASALDOH: Double;
   dISALDOD, dISALDOH: Double;
   dESALDOD, dESALDOH: Double;
   dISALDOD2, dISALDOH2: Double;
   dESALDOD2, dESALDOH2: Double;
Begin

   XLApp := CreateOleObject('Excel.Application');
   XLApp.Visible := True;
   XLApp.Workbooks.Add(xlWBatWorkSheet);
   XLApp.Workbooks[1].WorkSheets[1].Name := 'Balance General';

   Sheet := XLApp.Workbooks[1].WorkSheets['Balance General'];

   i := 1;
   sheet.cells[i, 1] := edtCia.Text;
   sheet.cells[i, 2] := '';
   sheet.cells[i, 3] := '';
   sheet.cells[i, 4] := '';
   sheet.cells[i, 5] := '';
   sheet.cells[i, 6] := 'BALANCE DE COMPROBACION GENERAL';
   sheet.cells[i, 7] := '';
   sheet.cells[i, 8] := '';
   sheet.cells[i, 9] := '';
   sheet.cells[i, 10] := '';
   sheet.cells[i, 11] := '';
   sheet.cells[i, 12] := '';
   sheet.cells[i, 13] := '';
   sheet.cells[i, 14] := '';

   inc(i);
   sheet.cells[i, 1] := 'Contabilidad';
   sheet.cells[i, 2] := '';
   sheet.cells[i, 3] := '';
   sheet.cells[i, 4] := '';
   sheet.cells[i, 5] := '';
   sheet.cells[i, 6] := '';
   sheet.cells[i, 7] := SysUtils.LongMonthNames[strtoint(speMM.Text)] + '  ' + speAno.Text;
   sheet.cells[i, 8] := '';
   sheet.cells[i, 9] := '';
   sheet.cells[i, 10] := '';
   sheet.cells[i, 11] := '';
   sheet.cells[i, 12] := '';
   sheet.cells[i, 13] := '';
   sheet.cells[i, 14] := '';

   If rgMoneda.ItemIndex = 0 Then
      sMoneda := 'MONEDA LOCAL'
   Else
      sMoneda := 'MONEDA EXTRANJERA';

   inc(i);
   sheet.cells[i, 1] := 'Contabilidad';
   sheet.cells[i, 2] := '';
   sheet.cells[i, 3] := '';
   sheet.cells[i, 4] := '';
   sheet.cells[i, 5] := '';
   sheet.cells[i, 6] := '';
   sheet.cells[i, 7] := SysUtils.LongMonthNames[strtoint(speMM.Text)] + '  ' + speAno.Text;
   sheet.cells[i, 8] := '';
   sheet.cells[i, 9] := '';
   sheet.cells[i, 10] := '';
   sheet.cells[i, 11] := '';
   sheet.cells[i, 12] := '';
   sheet.cells[i, 13] := '';
   sheet.cells[i, 14] := '';
End;

Procedure TFBalGeneral.ExportarExcel;
Var
   i, iIni, iFin, c: Integer;
   Sheet: Variant;
   nNum: integer;
   cEstadoRep, sMoneda, sIni, sFin: String;

   dADEBEANT, dAHABEANT: Double;
   dDEBE, dHABE: Double;
   dADEBE, dAHABE: Double;
   dASALDOD, dASALDOH: Double;
   dISALDOD, dISALDOH: Double;
   dESALDOD, dESALDOH: Double;
   dISALDOD2, dISALDOH2: Double;
   dESALDOD2, dESALDOH2: Double;
Begin
   XLApp := CreateOleObject('Excel.Application');
   XLApp.Visible := True;
   XLApp.Workbooks.Add(xlWBatWorkSheet);
   XLApp.Workbooks[1].WorkSheets[1].Name := 'Balance General';
   Sheet := XLApp.Workbooks[1].WorkSheets['Balance General'];

   sheet.Columns[1].ColumnWidth := 10;
   sheet.Columns[2].ColumnWidth := 20;
   sheet.Columns[3].ColumnWidth := 16;
   sheet.Columns[4].ColumnWidth := 16;
   sheet.Columns[5].ColumnWidth := 15;
   sheet.Columns[6].ColumnWidth := 15;
   sheet.Columns[7].ColumnWidth := 16;
   sheet.Columns[8].ColumnWidth := 16;
   sheet.Columns[9].ColumnWidth := 16;
   sheet.Columns[10].ColumnWidth := 16;
   sheet.Columns[11].ColumnWidth := 16;
   sheet.Columns[12].ColumnWidth := 16;
   sheet.Columns[13].ColumnWidth := 16;
   sheet.Columns[14].ColumnWidth := 16;
   i := 1;
   sheet.cells[i, 1] := edtCia.Text;
   sheet.cells[i, 2] := '';
   sheet.cells[i, 3] := '';
   sheet.cells[i, 4] := '';
   sheet.cells[i, 5] := '';
   sheet.cells[i, 6] := 'BALANCE DE COMPROBACION GENERAL';
   sheet.cells[i, 7] := '';
   sheet.cells[i, 8] := '';
   sheet.cells[i, 9] := '';
   sheet.cells[i, 10] := '';
   sheet.cells[i, 11] := '';
   sheet.cells[i, 12] := '';
   sheet.cells[i, 13] := '';
   sheet.cells[i, 14] := DATETOSTR(DATE);

   inc(i);
   sheet.cells[i, 1] := 'Contabilidad';
   sheet.cells[i, 2] := '';
   sheet.cells[i, 3] := '';
   sheet.cells[i, 4] := '';
   sheet.cells[i, 5] := '';
   sheet.cells[i, 6] := '';
   sheet.cells[i, 7] := SysUtils.LongMonthNames[strtoint(speMM.Text)] + '  ' + speAno.Text;
   sheet.cells[i, 8] := '';
   sheet.cells[i, 9] := '';
   sheet.cells[i, 10] := '';
   sheet.cells[i, 11] := '';
   sheet.cells[i, 12] := '';
   sheet.cells[i, 13] := '';
   sheet.cells[i, 14] := TIMETOSTR(TIME);

   If rgMoneda.ItemIndex = 0 Then
      sMoneda := 'MONEDA LOCAL'
   Else
      sMoneda := 'MONEDA EXTRANJERA';

   cEstadoRep := ' ';
   If DMCNT.cdsConsistencia.RecordCount > 0 Then
      cEstadoRep := 'BALANCE PRELIMINAR : EXISTEN REGISTROS EN ESTADO INICIAL, VERIFICAR';

   inc(i);
   sheet.cells[i, 1] := cEstadoRep;
   sheet.cells[i, 2] := '';
   sheet.cells[i, 3] := '';
   sheet.cells[i, 4] := '';
   sheet.cells[i, 5] := '';
   sheet.cells[i, 6] := '';
   sheet.cells[i, 7] := sMoneda;
   sheet.cells[i, 8] := '';
   sheet.cells[i, 9] := '';
   sheet.cells[i, 10] := '';
   sheet.cells[i, 11] := '';
   sheet.cells[i, 12] := '';
   sheet.cells[i, 13] := '';
   sheet.cells[i, 14] := '';

  // Titulos
   inc(i);
   inc(i);
   sheet.cells[i, 1] := '';
   sheet.cells[i, 2] := '';
   sheet.cells[i, 3] := 'ANTERIOR';
   sheet.cells[i, 4] := 'ANTERIOR';
   sheet.cells[i, 5] := 'DEL MES';
   sheet.cells[i, 6] := 'DEL MES';
   sheet.cells[i, 7] := 'ACUMULADO';
   sheet.cells[i, 8] := 'ACUMULADO';
   sheet.cells[i, 9] := 'SALDOS';
   sheet.cells[i, 10] := 'SALDOS';
   sheet.cells[i, 11] := 'INVENTARIOS';
   sheet.cells[i, 12] := 'INVENTARIOS';
   sheet.cells[i, 13] := 'RESULTADOS';
   sheet.cells[i, 14] := 'RESULTADOS';
   For c := 1 To 14 Do
      sheet.cells[i, c].Interior.Color := clMoneyGreen;

  // Titulos 2
   inc(i);
   sheet.cells[i, 1] := 'CUENTA';
   sheet.cells[i, 2] := 'DESCRIPCION';
   sheet.cells[i, 3] := 'DEBE';
   sheet.cells[i, 4] := 'HABER';
   sheet.cells[i, 5] := 'DEBE';
   sheet.cells[i, 6] := 'HABER';
   sheet.cells[i, 7] := 'DEBE';
   sheet.cells[i, 8] := 'HABER';
   sheet.cells[i, 9] := 'DEBE';
   sheet.cells[i, 10] := 'HABER';
   sheet.cells[i, 11] := 'DEBE';
   sheet.cells[i, 12] := 'HABER';
   sheet.cells[i, 13] := 'DEBE';
   sheet.cells[i, 14] := 'HABER';
   For c := 1 To 14 Do
      sheet.cells[i, c].Interior.Color := clMoneyGreen;
   inc(i);

   iIni := i + 1;
   DMCNT.cdsQry.First;
   While Not DMCNT.cdsQry.Eof Do
   Begin
      inc(i);
      sheet.cells[i, 1] := '"' + DMCNT.cdsQry.FieldbyName('CUENTAID').AsString;
      sheet.cells[i, 2] := DMCNT.cdsQry.FieldbyName('CTADES').AsString;

      If DMCNT.cdsQry.FieldbyName('ADEBEANT').AsFloat <> 0 Then sheet.cells[i, 3] := DMCNT.cdsQry.FieldbyName('ADEBEANT').AsFloat;
      If DMCNT.cdsQry.FieldbyName('AHABEANT').AsFloat <> 0 Then sheet.cells[i, 4] := DMCNT.cdsQry.FieldbyName('AHABEANT').AsFloat;
      If DMCNT.cdsQry.FieldbyName('DEBE').AsFloat <> 0 Then sheet.cells[i, 5] := DMCNT.cdsQry.FieldbyName('DEBE').AsFloat;
      If DMCNT.cdsQry.FieldbyName('HABE').AsFloat <> 0 Then sheet.cells[i, 6] := DMCNT.cdsQry.FieldbyName('HABE').AsFloat;
      If DMCNT.cdsQry.FieldbyName('ADEBE').AsFloat <> 0 Then sheet.cells[i, 7] := DMCNT.cdsQry.FieldbyName('ADEBE').AsFloat;
      If DMCNT.cdsQry.FieldbyName('AHABE').AsFloat <> 0 Then sheet.cells[i, 8] := DMCNT.cdsQry.FieldbyName('AHABE').AsFloat;
      If DMCNT.cdsQry.FieldbyName('ASALDOD').AsFloat <> 0 Then sheet.cells[i, 9] := DMCNT.cdsQry.FieldbyName('ASALDOD').AsFloat;
      If DMCNT.cdsQry.FieldbyName('ASALDOH').AsFloat <> 0 Then sheet.cells[i, 10] := DMCNT.cdsQry.FieldbyName('ASALDOH').AsFloat;
      If DMCNT.cdsQry.FieldbyName('ISALDOD').AsFloat <> 0 Then sheet.cells[i, 11] := DMCNT.cdsQry.FieldbyName('ISALDOD').AsFloat;
      If DMCNT.cdsQry.FieldbyName('ISALDOH').AsFloat <> 0 Then sheet.cells[i, 12] := DMCNT.cdsQry.FieldbyName('ISALDOH').AsFloat;
      If DMCNT.cdsQry.FieldbyName('ESALDOD').AsFloat <> 0 Then sheet.cells[i, 13] := DMCNT.cdsQry.FieldbyName('ESALDOD').AsFloat;
      If DMCNT.cdsQry.FieldbyName('ESALDOH').AsFloat <> 0 Then sheet.cells[i, 14] := DMCNT.cdsQry.FieldbyName('ESALDOH').AsFloat;

      If xNivel = '0' Then
      Begin
         If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
         Begin
            dADEBEANT := dADEBEANT + DMCNT.cdsQry.fieldbyname('ADEBEANT').AsFloat;
            dAHABEANT := dAHABEANT + DMCNT.cdsQry.fieldbyname('AHABEANT').AsFloat;
            dDEBE := dDEBE + DMCNT.cdsQry.fieldbyname('DEBE').AsFloat;
            dHABE := dHABE + DMCNT.cdsQry.fieldbyname('HABE').AsFloat;
            dADEBE := dADEBE + DMCNT.cdsQry.fieldbyname('ADEBE').AsFloat;
            dAHABE := dAHABE + DMCNT.cdsQry.fieldbyname('AHABE').AsFloat;
            dASALDOD := dASALDOD + DMCNT.cdsQry.fieldbyname('ASALDOD').AsFloat;
            dASALDOH := dASALDOH + DMCNT.cdsQry.fieldbyname('ASALDOH').AsFloat;
            dISALDOD := dISALDOD + DMCNT.cdsQry.fieldbyname('ISALDOD').AsFloat;
            dISALDOH := dISALDOH + DMCNT.cdsQry.fieldbyname('ISALDOH').AsFloat;
            dESALDOD := dESALDOD + DMCNT.cdsQry.fieldbyname('ESALDOD').AsFloat;
            dESALDOH := dESALDOH + DMCNT.cdsQry.fieldbyname('ESALDOH').AsFloat;
         End;
      End
      Else
      Begin
         If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
            (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
         Begin
            dADEBEANT := dADEBEANT + DMCNT.cdsQry.fieldbyname('ADEBEANT').AsFloat;
            dAHABEANT := dAHABEANT + DMCNT.cdsQry.fieldbyname('AHABEANT').AsFloat;
            dDEBE := dDEBE + DMCNT.cdsQry.fieldbyname('DEBE').AsFloat;
            dHABE := dHABE + DMCNT.cdsQry.fieldbyname('HABE').AsFloat;
            dADEBE := dADEBE + DMCNT.cdsQry.fieldbyname('ADEBE').AsFloat;
            dAHABE := dAHABE + DMCNT.cdsQry.fieldbyname('AHABE').AsFloat;
            dASALDOD := dASALDOD + DMCNT.cdsQry.fieldbyname('ASALDOD').AsFloat;
            dASALDOH := dASALDOH + DMCNT.cdsQry.fieldbyname('ASALDOH').AsFloat;
            dISALDOD := dISALDOD + DMCNT.cdsQry.fieldbyname('ISALDOD').AsFloat;
            dISALDOH := dISALDOH + DMCNT.cdsQry.fieldbyname('ISALDOH').AsFloat;
            dESALDOD := dESALDOD + DMCNT.cdsQry.fieldbyname('ESALDOD').AsFloat;
            dESALDOH := dESALDOH + DMCNT.cdsQry.fieldbyname('ESALDOH').AsFloat;
         End;
      End;

      DMCNT.cdsQry.Next;
   End;

  // En Blanco
   inc(i);
  // Totales
   inc(i);
   sheet.cells[i, 1] := '';
   sheet.cells[i, 2] := 'TOTALES';
   sheet.cells[i, 3] := dADEBEANT;
   sheet.cells[i, 4] := dAHABEANT;
   sheet.cells[i, 5] := dDEBE;
   sheet.cells[i, 6] := dHABE;
   sheet.cells[i, 7] := dADEBE;
   sheet.cells[i, 8] := dAHABE;
   sheet.cells[i, 9] := dASALDOD;
   sheet.cells[i, 10] := dASALDOH;
   sheet.cells[i, 11] := dISALDOD;
   sheet.cells[i, 12] := dISALDOH;
   sheet.cells[i, 13] := dESALDOD;
   sheet.cells[i, 14] := dESALDOH;

  // Totales
   Inc(i);
   sheet.cells[i, 1] := '';
   sheet.cells[i, 2] := '';
   sheet.cells[i, 3] := '';
   sheet.cells[i, 4] := '';
   sheet.cells[i, 5] := '';
   sheet.cells[i, 6] := '';
   sheet.cells[i, 7] := '';
   sheet.cells[i, 8] := '';
   sheet.cells[i, 9] := '';
   sheet.cells[i, 10] := '';

   If dISALDOD <= dISALDOH Then
   Begin
      sheet.cells[i, 11] := dISALDOH - dISALDOD;
      sheet.cells[i, 12] := 0;
   End
   Else
   Begin
      sheet.cells[i, 11] := 0;
      sheet.cells[i, 12] := dISALDOD - dISALDOH;
   End;

   If dESALDOD <= dESALDOH Then
   Begin
      sheet.cells[i, 13] := dESALDOH - dESALDOD;
      sheet.cells[i, 14] := 0;
   End
   Else
   Begin
      sheet.cells[i, 13] := 0;
      sheet.cells[i, 14] := dESALDOD - dESALDOH;
   End;

   dISALDOD2 := sheet.cells[i, 11];
   dISALDOH2 := sheet.cells[i, 12];
   dESALDOD2 := sheet.cells[i, 13];
   dESALDOH2 := sheet.cells[i, 14];

  // Totales 2
   Inc(i);
   sheet.cells[i, 1] := '';
   sheet.cells[i, 2] := '';
   sheet.cells[i, 3] := dADEBEANT;
   sheet.cells[i, 4] := dAHABEANT;
   sheet.cells[i, 5] := dDEBE;
   sheet.cells[i, 6] := dHABE;
   sheet.cells[i, 7] := dADEBE;
   sheet.cells[i, 8] := dAHABE;
   sheet.cells[i, 9] := dASALDOD;
   sheet.cells[i, 10] := dASALDOH;
   sheet.cells[i, 11] := dISALDOD + dISALDOD2;
   sheet.cells[i, 12] := dISALDOH + dISALDOH2;
   sheet.cells[i, 13] := dESALDOD + dESALDOD2;
   sheet.cells[i, 14] := dESALDOH + dESALDOH2;

   iFin := i;
   sIni := Inttostr(iIni);
   sFin := Inttostr(iFin);
   sheet.Range['C' + sIni + ':' + 'C' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['D' + sIni + ':' + 'C' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['E' + sIni + ':' + 'C' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['F' + sIni + ':' + 'C' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['G' + sIni + ':' + 'C' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['H' + sIni + ':' + 'C' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['I' + sIni + ':' + 'C' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['J' + sIni + ':' + 'C' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['K' + sIni + ':' + 'C' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['M' + sIni + ':' + 'C' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['N' + sIni + ':' + 'C' + sFin].NumberFormat := '###,###,##0.00';

   sheet.Range['A5:N5'].Font.Bold := True;
   sheet.Range['A6:N6'].Font.Bold := True;
End;

Procedure TFBalGeneral.bbtnA4Click(Sender: TObject);
Var
   xWhere2, xMes, wMesAnt, sSQL1, sSQL2, sSQL3, sSQL4, sSQL5, sSQL6: String;
   xSQL: AnsiString;
   CampoH, CampoS, CampoD: String;
   sSaldoD, sSaldoH, sISaldoD, sISaldoH, sESaldoD, sESaldoH: String;
   sMon, sWhere, sDebe, sDebeAnt, sHabe, sHabeAnt, sHaving: String;
   i, x10: integer;
   xAM, cEstadoRep, xCierre, xSDAnt, xSHAnt: String;
Begin
   If edtCia.Text = '' Then
   Begin
      showmessage('Compañía no válida');
      Raise exception.Create('Compañía no válida');
   End;

   If dblcNivel.Text = '' Then
   Begin
      ShowMessage('Seleccione un Nivel de Detalle de Cuenta');
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   xAM := speAno.Text;
   xMes := speMM.Text;

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;

   xSql := 'SELECT * FROM TGE154 WHERE CIAID=' + quotedstr(dblcCia.text) + ' and ANO=' + quotedstr(speAno.Text);
   DMCNT.cdsCierres.close;
   DMCNT.cdsCierres.datarequest(xsql);
   DMCNT.cdsCierres.open;
   If DMCNT.cdsCierres.FieldByName('PER' + xMes).AsString = 'S' Then
   Begin

      GeneraSQLVerifica;

      If DMCNT.cdsConsistencia.RecordCount > 0 Then
      Begin
         Screen.Cursor := crDefault;
         ShowMessage('Error : Existen Inconsistencias. Emitir Reporte...');
         Exit;
      End;
   End;

   If xAM >= '201104' Then
   Begin
      GeneraSQLAsientoDesc;

      If DMCNT.cdsConsistencia.RecordCount > 0 Then
      Begin
         Screen.Cursor := crDefault;
         ShowMessage('Error : Existen asientos con Descuadre. Emitir Reporte...');
         Exit;
      End;
   End;

   GeneraSQLAsientoSinCta;

   If DMCNT.cdsConsistencia.RecordCount > 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('Error : Existen asientos con cuentas en blanco. Emitir Reporte...');
      Exit;
   End;

   DMCNT.cdsQry.Filtered := false;
   DMCNT.cdsQry.Filter := '';

   GeneraSQLRegIni;

   cEstadoRep := ' ';
   If DMCNT.cdsConsistencia.RecordCount > 0 Then
      cEstadoRep := 'BALANCE PRELIMINAR : EXISTEN REGISTROS EN ESTADO INICIAL, VERIFICAR';

   Screen.Cursor := crHourGlass;
   xnivel := '';
   xsql := '';
// ACUMULADO DEL DEBE Y HABER
   If rgMoneda.ItemIndex = 1 Then // CUANDO ES MONDEDA EXTRANJERA
   Begin
      sMon := 'ME';
      sWhere := 'TMON_LOC=''E''';
   End
   Else
   Begin
      sMon := 'MN';
      sWhere := 'TMON_LOC=''L''';
   End;

// ACUMULADO INCLUYENDO EL MES ACTUAL
   For i := 0 To StrToInt(speMM.text) Do
   Begin
      sDebe := sDebe + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      sHabe := sHabe + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
   End;
   //QUITAR EL ULTIMO + DE LA CADENA
   sDebe := Copy(sDebe, 1, Length(sDebe) - 1);
   sHabe := Copy(sHabe, 1, Length(sHabe) - 1);

// SALDOS ANTERIORES
   For i := 0 To StrToInt(speMM.text) - 1 Do
   Begin
      sDebeAnt := sDebeAnt + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      sHabeAnt := sHabeAnt + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
   End;

   If StrToInt(speMM.text) - 1 > 0 Then
      If StrToInt(speMM.text) = 1 Then
      Begin
         sDebeAnt := sDebeAnt + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
         sHabeAnt := sHabeAnt + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      End;

   If Length(sDebeAnt) = 0 Then
   Begin
      sDebeAnt := sDebeAnt + ' 0.00+';
      sHabeAnt := sHabeAnt + ' 0.00+';
   End;

   //QUITAR EL ULTIMO + DE LA CADENA
   sDebeAnt := Copy(sDebeAnt, 1, Length(sDebeAnt) - 1);
   sHabeant := Copy(sHabeAnt, 1, Length(sHabeAnt) - 1);
   sDebeAnt := sDebeAnt + ' ADEBEANT, ';
   sHabeAnt := sHabeAnt + ' AHABEANT, ';

{   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      sSaldoD := ' CASE WHEN (' + sDebe + ' - (' + sHabe + '))>0 THEN ' + sDebe + ' - (' + sHabe + ') ELSE 0 END ASALDOD, ';
      sSaldoh := ' CASE WHEN (' + sHabe + ' - (' + sDebe + '))>0 THEN ' + sHabe + ' - (' + sDebe + ') ELSE 0 END ASALDOH, ';

      sISaldoD := ' CASE WHEN (TGE202.CTA_TIPO IN (''O'',''A'',''P'')) AND (' + sDebe + ' - (' + sHabe + '))>0 THEN ' + sDebe + ' - (' + sHabe + ') ELSE 0 END ISALDOD, ';
      sISaldoH := ' CASE WHEN (TGE202.CTA_TIPO IN (''O'',''A'',''P'')) AND (' + sHabe + ' - (' + sDebe + '))>0 THEN ' + sHabe + ' - (' + sDebe + ') ELSE 0 END ISALDOH, ';

      sESaldoD := ' CASE WHEN (TGE202.CTA_TIPO IN (''G'',''I'',''R'',''N'')) AND (' + sDebe + ' - (' + sHabe + '))>0 THEN ' + sDebe + ' - (' + sHabe + ') ELSE 0 END ESALDOD, ';
      sESaldoH := ' CASE WHEN (TGE202.CTA_TIPO IN (''G'',''I'',''R'',''N'')) AND (' + sHabe + ' - (' + sDebe + '))>0 THEN ' + sHabe + ' - (' + sDebe + ') ELSE 0 END ESALDOH, ';

      sDebe := sDebe + ' ADEBE, ';
      sHabe := sHabe + ' AHABE, ';
   End
   Else
   Begin
}
// Inicio HCP_201303_CNT
   //   sSaldoD := ' DECODE(LEAST( (' + sDebe + ' - (' + sHabe + ')),0),0,' + sDebe + ' - (' + sHabe + '), 0 ) ASALDOD, ';
   //   sSaldoh := ' DECODE(LEAST( (' + sHabe + ' - (' + sDebe + ')),0),0,' + sHabe + ' - (' + sDebe + '), 0 ) ASALDOH, ';

      sSaldoD := ' CASE WHEN (' + sDebe + ' - (' + sHabe + '))>0 THEN ' + sDebe + ' - (' + sHabe + ') ELSE 0 END ASALDOD, ';
      sSaldoh := ' CASE WHEN (' + sHabe + ' - (' + sDebe + '))>0 THEN ' + sHabe + ' - (' + sDebe + ') ELSE 0 END ASALDOH, ';

   ///////////////////////

   //   sISaldoD := ' DECODE(LEAST((' + sDebe + ' - (' + sHabe + ')),0),0,DECODE(TGE202.CTA_TIPO,''A'',' + sDebe + ' - (' + sHabe + ')),0,0) ISALDOD, ';
   //   sISaldoH := ' DECODE(LEAST((' + sHabe + ' - (' + sDebe + ')),0),0,DECODE(TGE202.CTA_TIPO,''A'',' + sHabe + ' - (' + sDebe + ')),0,0) ISALDOH, ';

      sISaldoD := ' CASE WHEN (TGE202.CTA_TIPO = ''A'') AND (' + sDebe + ' - (' + sHabe + '))>0 THEN ' + sDebe + ' - (' + sHabe + ') ELSE 0 END ISALDOD, ';
      sISaldoH := ' CASE WHEN (TGE202.CTA_TIPO = ''A'') AND (' + sHabe + ' - (' + sDebe + '))>0 THEN ' + sHabe + ' - (' + sDebe + ') ELSE 0 END ISALDOH, ';

   ///////////////////////

   //   sESaldoD := ' DECODE(LEAST((' + sDebe + ' - (' + sHabe + ')),0),0,DECODE(TGE202.CTA_TIPO,''R'',' + sDebe + ' - (' + sHabe + '),''R'',' + sDebe + ' - (' + sHabe + '),0),0) ESALDOD, ';
   //   sESaldoH := ' DECODE(LEAST((' + sHabe + ' - (' + sDebe + ')),0),0,DECODE(TGE202.CTA_TIPO,''R'',' + sHabe + ' - (' + sDebe + '),''R'',' + sHabe + ' - (' + sDebe + '),0),0) ESALDOH, ';

      sESaldoD := ' CASE WHEN (TGE202.CTA_TIPO = ''R'') AND (' + sDebe + ' - (' + sHabe + '))>0 THEN ' + sDebe + ' - (' + sHabe + ') ELSE 0 END ESALDOD, ';
      sESaldoH := ' CASE WHEN (TGE202.CTA_TIPO = ''R'') AND (' + sHabe + ' - (' + sDebe + '))>0 THEN ' + sHabe + ' - (' + sDebe + ') ELSE 0 END ESALDOH, ';

   ///////////////////////

      sDebe := sDebe + ' ADEBE, ';
      sHabe := sHabe + ' AHABE, ';
    {
      xSDAnt := sDebe;
      xSHAnt := sHabe;

      sDebe := ' CASE WHEN (' + xSDAnt + ' - (' + xSHAnt + '))>0 THEN ' + xSDAnt + ' - (' + xSHAnt + ') ELSE 0 END ADEBE, ';
      sHabe := ' CASE WHEN (' + xSHAnt + ' - (' + xSDAnt + '))>0 THEN ' + xSHAnt + ' - (' + xSDAnt + ') ELSE 0 END AHABE, ';
     }
   ///////////////////////
// Fin HCP_201303_CNT
//   End;
   xnivel := '';
   xsql := '';

{   If (SRV_D = 'DB2400') Then
      xsql := 'NIVEL=' + quotedstr('0' + IntToStr(StrToInt(dblcNivel.text) + 1))
   Else
}
      xsql := 'NIVEL=' + quotedstr(IntToStr(StrToInt(dblcNivel.text) + 1));

   If DMCNT.DisplayDescrip('PrvTGE', 'CNT202', '*', xsql, 'NIVEL') = '' Then
      xnivel := '0'
   Else
      xnivel := '1';
   xWhere := 'CNT401.CIAID=' + '''' + dblcCia.Text + ''''
      + ' AND CNT401.ANO=' + '''' + speAno.Text + ''''
      + ' AND CNT401.TIPO<=' + '''' + dblcNivel.Text + ''''
      + ' AND (CNT401.AUXID IS NULL OR CNT401.AUXID='''') '
      + ' AND (CNT401.CCOSID IS NULL OR CNT401.CCOSID='''')'
      + ' AND LENGTH(CNT401.CUENTAID) <> 1';
   If sCiaCuenta <> '' Then
   Begin
      xWhere := xWhere + ' and CNT401.' + sCiaCuenta;
   End;

   xMes := speMM.Text;

   If (StrToInt(xmes) - 1) <= 9 Then
      wMesAnt := '0' + inttostr((StrToInt(xmes) - 1));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   CampoS := ' SALD' + sMon + wMesAnt; // wmes
   CampoD := ' DEBE' + sMon + xMes;
   CampoH := ' HABE' + sMon + xMes;

// Inicio : HPC_201303_CNT
   xSQL := 'SELECT CNT401.CUENTAID, CNT401.CTADES, ''' + edtCia.Text + ''' CIA_NOMBRE, ''' + SysUtils.LongMonthNames[strtoint(xMes)] + '  ' + speAno.Text + ''' PERIODO_T, ';

   sSQL1 := sDebeAnt + sHabeant + CampoD + ' DEBE,' + CampoH + ' HABE, ';

   sSQL2 := sDebe + sHabe + sSaldoD + sSaldoH;

   sSQL3 := sISaldoD + sISaldoH;

   sSQL6 := sESaldoD + sESaldoH;

   sSQL4 := ' TGE202.CTA_DET, CNT401.TIPO, ''' + cEstadoRep + ''' ESTADO '
      + ' FROM CNT401, TGE202'
      + ' WHERE (CNT401.CUENTAID = TGE202.CUENTAID(+)) AND (CNT401.CIAID = TGE202.CIAID(+)) AND ';

   sSQL5 := ' ORDER BY CNT401.CUENTAID';

   xSQL := xSQL + sSQL1 + sSQL2 + sSQL3 + sSQL6 + sSQL4 + xWhere + sSQL5;

   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.ProviderName := 'prvCNT';
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   DMCNT.cdsQry.Filter := ' ADEBE <>0.00 or AHABE <>0.00 ';
   DMCNT.cdsQry.Filtered := True;
   If DMCNT.cdsQry.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas');
      DMCNT.cdsQry.Filter := '';
      DMCNT.cdsQry.Filtered := True;
   End;
   DMCNT.cdsQry.First;
   Screen.Cursor := crDefault;
   If rgMoneda.ItemIndex = -1 Then
   Begin
      ShowMessage('Ingrese Tipo de Moneda');
      rgMoneda.SetFocus;
      Exit;
   End;

   ppdbBalComprob.DataSource := DMCNT.dsQry;

   DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Balance Comprobacion General',
      dblcCia.Text, // Campañía
      speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
      dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
      dblcNivel.Text, '', // Nivel   - Origen
      '', inttostr(rgMoneda.itemindex), // Lote    -  Moneda
      '', '', // Cuentas - Auxiliares
      '', 'Impresora', // Costos - Tipo Salida
      ''); // Tipo Rep

// Inicio : HPC_201303_CNT
   pprA4.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\BalCompGeneralA4.rtm';
   pprA4.Template.LoadFromFile;
   If cbDisenoRep.Checked Then
   Begin
      ppdV.Report := pprA4;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprA4.Print;
      pprA4.Stop;

      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;

      DMCNT.cdsQry.CancelUpdates;
      DMCNT.cdsQry.IndexFieldNames := '';
      DMCNT.cdsQry.Filter := '';
      DMCNT.cdsQry.Filtered := True;
   End;
// Fin : HPC_201303_CNT

   ppdbBalComprob.DataSource := Nil;
End;

Procedure TFBalGeneral.ppcDEBEANTCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcDEBEANT.Value := ppcDEBEANT.Value + DMCNT.cdsQry.fieldbyname('ADEBEANT').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcDEBEANT.Value := ppcDEBEANT.Value + DMCNT.cdsQry.fieldbyname('ADEBEANT').AsFloat
      End;
   End;

End;

Procedure TFBalGeneral.ppcHABEANTCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcHABEANT.Value := ppcHABEANT.Value + DMCNT.cdsQry.fieldbyname('AHABEANT').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcHABEANT.Value := ppcHABEANT.Value + DMCNT.cdsQry.fieldbyname('AHABEANT').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppcDEBECalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcDEBE.Value := ppcDEBE.Value + DMCNT.cdsQry.fieldbyname('DEBE').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcDEBE.Value := ppcDEBE.Value + DMCNT.cdsQry.fieldbyname('DEBE').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppcHABECalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcHABE.Value := ppcHABE.Value + DMCNT.cdsQry.fieldbyname('HABE').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcHABE.Value := ppcHABE.Value + DMCNT.cdsQry.fieldbyname('HABE').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppcADEBECalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcADEBE.Value := ppcADEBE.Value + DMCNT.cdsQry.fieldbyname('ADEBE').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcADEBE.Value := ppcADEBE.Value + DMCNT.cdsQry.fieldbyname('ADEBE').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppcAHABECalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcAHABE.Value := ppcAHABE.Value + DMCNT.cdsQry.fieldbyname('AHABE').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcAHABE.Value := ppcAHABE.Value + DMCNT.cdsQry.fieldbyname('AHABE').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppcASALDODCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcASALDOD.Value := ppcASALDOD.Value + DMCNT.cdsQry.fieldbyname('ASALDOD').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString <= dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcASALDOD.Value := ppcASALDOD.Value + DMCNT.cdsQry.fieldbyname('ASALDOD').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppcASALDOHCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcASALDOH.Value := ppcASALDOH.Value + DMCNT.cdsQry.fieldbyname('ASALDOH').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcASALDOH.Value := ppcASALDOH.Value + DMCNT.cdsQry.fieldbyname('ASALDOH').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppcISALDODCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcISALDOD.Value := ppcISALDOD.Value + DMCNT.cdsQry.fieldbyname('ISALDOD').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcISALDOD.Value := ppcISALDOD.Value + DMCNT.cdsQry.fieldbyname('ISALDOD').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppcISALDOHCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcISALDOH.Value := ppcISALDOH.Value + DMCNT.cdsQry.fieldbyname('ISALDOH').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcISALDOH.Value := ppcISALDOH.Value + DMCNT.cdsQry.fieldbyname('ISALDOH').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppcESALDODCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcESALDOD.Value := ppcESALDOD.Value + DMCNT.cdsQry.fieldbyname('ESALDOD').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcESALDOD.Value := ppcESALDOD.Value + DMCNT.cdsQry.fieldbyname('ESALDOD').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.ppcESALDOHCalc(Sender: TObject);
Begin
   If xNivel = '0' Then
   Begin
      If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcESALDOH.Value := ppcESALDOH.Value + DMCNT.cdsQry.fieldbyname('ESALDOH').AsFloat
      End;
   End
   Else
   Begin
      If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) Or
         (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') Then
      Begin
         ppcESALDOH.Value := ppcESALDOH.Value + DMCNT.cdsQry.fieldbyname('ESALDOH').AsFloat
      End;
   End;
End;

Procedure TFBalGeneral.vIDIFDCalc(Sender: TObject; Var Value: Variant);
Var
   xD, xH: DOUBLE;
Begin
   If ppcISALDOD.text = '' Then
      xD := 0
   Else
      xD := ppcISALDOD.Value;

   If ppcISALDOH.text = '' Then
      xH := 0
   Else
      xH := ppcISALDOH.Value;
   If (xH >= xD) Then
   Begin
      Value := (xH - xD);
      vIDIFD.Visible := True;
      vIDIFH.Visible := False;
   End
   Else
      value := 0;
   ppDBCalc33.Value := ppcISALDOD.value + vIDIFD.Value;
End;

Procedure TFBalGeneral.vIDIFHCalc(Sender: TObject; Var Value: Variant);
Var
   xD, xH: DOUBLE;
Begin
   If ppcISALDOH.text = '' Then
      xD := 0
   Else
      xD := ppcISALDOH.Value;

   If ppcISALDOD.text = '' Then
      xH := 0
   Else
      xH := ppcISALDOD.Value;
   If (xH >= xD) Then
   Begin
      Value := (xH - xD);
      vIDIFH.Visible := True;
      vIDIFD.Visible := False;
   End
   Else
      value := 0;
   ppDBCalc34.value := ppcISALDOH.value + value;
End;

Procedure TFBalGeneral.vIDIFD1Calc(Sender: TObject; Var Value: Variant);
Var
   xD, xH: DOUBLE;
Begin
   If ppcESALDOD.text = '' Then
      xD := 0
   Else
      xD := ppcESALDOD.Value;

   If ppcESALDOH.text = '' Then
      xH := 0
   Else
      xH := ppcESALDOH.Value;
   If (xH >= xD) Then
   Begin
      Value := (xH - xD);
      vIDIFD1.Visible := True;
      vIDIFH1.Visible := False;
   End
   Else
      value := 0;
   ppDBCalc35.Value := value + ppcESALDOD.value;
End;

Procedure TFBalGeneral.vIDIFH1Calc(Sender: TObject; Var Value: Variant);
Var
   xD, xH: DOUBLE;
Begin
   If ppcESALDOH.text = '' Then
      xD := 0
   Else
      xD := ppcESALDOH.Value;

   If ppcESALDOD.text = '' Then
      xH := 0
   Else
      xH := ppcESALDOD.Value;
   If (xH >= xD) Then
   Begin
      Value := (xH - xD);
      vIDIFH1.Visible := True;
      vIDIFD1.Visible := False;
   End
   Else
      Value := 0;
   ppDBCalc36.value := ppcESALDOH.value + value;
End;

Procedure TFBalGeneral.ppDBCalc25Calc(Sender: TObject);
Begin
   ppDBCalc25.value := ppcDEBEANT.value;
End;

Procedure TFBalGeneral.ppDBCalc26Calc(Sender: TObject);
Begin
   ppDBCalc26.value := ppcHABEANT.value;
End;

Procedure TFBalGeneral.ppDBCalc27Calc(Sender: TObject);
Begin
   ppDBCalc27.value := ppcDEBE.value;
End;

Procedure TFBalGeneral.ppDBCalc28Calc(Sender: TObject);
Begin
   ppDBCalc28.value := ppcHABE.value;
End;

Procedure TFBalGeneral.ppDBCalc29Calc(Sender: TObject);
Begin
   ppDBCalc29.value := ppcAHABE.value;
End;

Procedure TFBalGeneral.ppDBCalc30Calc(Sender: TObject);
Begin
   ppDBCalc30.value := ppcAHABE.value;
End;

Procedure TFBalGeneral.ppDBCalc31Calc(Sender: TObject);
Begin
   ppDBCalc31.value := ppcASALDOD.value;
End;

Procedure TFBalGeneral.ppDBCalc32Calc(Sender: TObject);
Begin
   ppDBCalc32.value := ppcASALDOH.value;
End;

Procedure TFBalGeneral.BitBtn4Click(Sender: TObject);
Var
   x10: Integer;
Begin

   GeneraSQLCtaDetalle;

   If DMCNT.cdsConsistencia.RecordCount <= 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existen Inconsistencias');
      Exit;
   End;
   pprV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ConsistenciaCtaDetalle.rtm';
   pprV.Template.LoadFromFile;
   ppdbV.DataSource := DMCNT.dsConsistencia;
   ppdV.Report := pprV;

   Screen.Cursor := crDefault;
   If cbDisenoRep.Checked Then
   Begin
      ppdV.Report := pprV;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprV.Print;
      pprV.Stop;
      ppdbV.DataSource := Nil;
      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;
   End;
End;

Procedure TFBalGeneral.BitBtn5Click(Sender: TObject);
Var
   x10: Integer;
Begin

   GeneraSQLComparaConsol;

   If DMCNT.cdsConsistencia.RecordCount <= 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existen Inconsistencias');
      Exit;
   End;
   pprV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ConsistenciaCompaConsol.rtm';
   pprV.Template.LoadFromFile;
   ppdbV.DataSource := DMCNT.dsConsistencia;
   ppdV.Report := pprV;

   Screen.Cursor := crDefault;
   If cbDisenoRep.Checked Then
   Begin
      ppdV.Report := pprV;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprV.Print;
      pprV.Stop;
      ppdbV.DataSource := Nil;
      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;
   End;
End;

Procedure TFBalGeneral.bbtnVeriC9vsC6Click(Sender: TObject);
Var
   x10: Integer;
Begin
   GeneraSQLVerificaC9vsC6;

   If DMCNT.cdsConsistencia.RecordCount <= 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existen Inconsistencias');
      Exit;
   End;

   pprV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ConsistenciaVeriC9vsC6.rtm';
   pprV.Template.LoadFromFile;
   ppdbV.DataSource := DMCNT.dsConsistencia;

   Screen.Cursor := crDefault;
   If cbDisenoRep.Checked Then
   Begin
      ppdV.Report := pprV;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprV.Print;
      pprV.Stop;
      ppdbV.DataSource := Nil;
      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;
   End;
End;

Procedure TFBalGeneral.bbtnVeriC6vsC9Click(Sender: TObject);
Var
   x10: Integer;
Begin

   GeneraSQLVerificaC6vsC9;

   If DMCNT.cdsConsistencia.RecordCount <= 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existen Inconsistencias');
      Exit;
   End;

   pprV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ConsistenciaVeriC6vsC9.rtm';
   pprV.Template.LoadFromFile;
   ppdbV.DataSource := DMCNT.dsConsistencia;

   Screen.Cursor := crDefault;
   If cbDisenoRep.Checked Then
   Begin
      ppdV.Report := pprV;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprV.Print;
      pprV.Stop;
      ppdbV.DataSource := Nil;
      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;
   End;
End;

Procedure TFBalGeneral.GeneraSQLVerificaC6vsC9;
Var
   xSQL: String;
   xAM, xMes: String;
   xCia, xCuenta9: String;
Begin
   xAM := speAno.Text;
   xMes := speMM.Text;

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;

   If dblcCia.Text = xCiaConsol Then
   Begin
      xCia := 'A.CIAID>=' + quotedstr('01');
      xCuenta9 := 'B.CUENTAID';
   End
   Else
   Begin
      xCia := 'A.CIAID=' + quotedstr(dblcCia.Text);
      xCuenta9 := 'max(B.CUENTAID)';
   End;

// cuando la clase 6 no tiene su clase 9
   xSQL := 'Select A.*, ' + quotedstr(edtCia.Text) + ' CIADES, ''CLASE 6 VS CLASE 9'' SUBTITULO, DEBE-DEBE9 DIFDEBE, HABE-HABE9 DIFHABE '
      + '  from (Select A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CUENTAID, A.CUENTA9, A.DEBE, A.HABE, '
      + '               B.CUENTAID CTA9, SUM(NVL(B.CNTDEBEMN,0)) DEBE9, SUM(NVL(B.CNTHABEMN,0)) HABE9 '
      + '          from (Select A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CUENTAID, '
      + xCuenta9 + 'CUENTA9, '
      + '                       sum(nvl(A.CNTDEBEMN,0)) DEBE, sum(nvl(A.CNTHABEMN,0)) HABE '
      + '                  from CNT301 A, TGE202 B '
      + '                 where ' + xCia
      + '                   and A.CNTANOMM=''' + xAM + ''' and CNTESTADO=''P'' '
      + '                   and A.CIAID=B.CIAID and A.CUENTAID=B.CTAAUT1 and A.CUENTAID LIKE ''6%'' '
      + '                 group by A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CUENTAID '
      + '                 order by CIAID, TDIARID, CNTCOMPROB '
      + '                ) A, CNT301 B '
      + '         where A.CIAID=B.CIAID(+) AND A.TDIARID=B.TDIARID(+) AND A.CNTANOMM=B.CNTANOMM(+) '
      + '           and A.CNTCOMPROB=B.CNTCOMPROB(+) '
      + '           and A.CUENTA9=B.CUENTAID(+) '
      + '         group by A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CUENTAID, A.CUENTA9, A.DEBE, A.HABE, B.CUENTAID '
      + '         order by A.CIAID, A.TDIARID, A.CNTCOMPROB '
      + '        ) A '
      + ' where DEBE<>DEBE9 or HABE<>HABE9 '
      + ' order by CIAID, TDIARID, CNTANOMM, CNTCOMPROB';
   Screen.Cursor := crHourGlass;
   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.Filter := '';
   DMCNT.cdsConsistencia.Filtered := False;
   DMCNT.cdsConsistencia.ProviderName := 'prvCNT';
   DMCNT.cdsConsistencia.DataRequest(xSQL);
   DMCNT.cdsConsistencia.Open;
   Screen.Cursor := crDefault;
End;

Procedure TFBalGeneral.GeneraSQLVerificaC9vsC6;
Var
   xSQL: String;
   xAM, xMes: String;
   xCia: String;
Begin
   xAM := speAno.Text;
   xMes := speMM.Text;

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;

   If dblcCia.Text = xCiaConsol Then
      xCia := 'A.CIAID>=' + quotedstr('01')
   Else
      xCia := 'A.CIAID=' + quotedstr(dblcCia.Text);

// LA CLASE 9 NO TIENE SU CORRESPONDIENTE 6
   xSQL := ' Select A.*, ''' + edtCia.Text + ''' CIADES, ''CLASE 9 VS CLASE 6'' SUBTITULO, DEBE-DEBE6 DIFDEBE, HABE-HABE6 DIFHABE '
      + '   From (Select A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CUENTAID, A.CUENTA6, '
      + '                A.DEBE, A.HABE, B.CUENTAID CTA6, '
      + '                sum(nvl(B.CNTDEBEMN,0)) DEBE6, sum(nvl(B.CNTHABEMN,0)) HABE6 '
      + '           from (Select A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CUENTAID, '
      + '                        B.CTAAUT1 CUENTA6, sum(nvl(A.CNTDEBEMN,0)) DEBE, sum(nvl(A.CNTHABEMN,0)) HABE '
      + '                   from CNT301 A, TGE202 B '
      + '                  where ' + xCia
      + '                    and A.CNTANOMM=''' + xAM + ''' and CNTESTADO=''P'' '
      + '                    and A.CIAID=B.CIAID and A.CUENTAID=B.CUENTAID and nvl(B.CTA_AUT1,''N'')=''S'' '
      + '                    and A.CUENTAID LIKE ''9%'' '
      + '                  group by A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CUENTAID, B.CTAAUT1 '
      + '                  order by CIAID, TDIARID, CNTCOMPROB '
      + '                 ) A, CNT301 B '
      + '          where A.CIAID=B.CIAID(+) and A.TDIARID=B.TDIARID(+) and A.CNTANOMM=B.CNTANOMM(+) '
      + '            and A.CNTCOMPROB=B.CNTCOMPROB(+) '
      + '            and A.CUENTA6=B.CUENTAID(+) '
      + '          group by A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CUENTAID, A.CUENTA6, '
      + '                   A.DEBE, A.HABE, B.CUENTAID '
      + '          order by A.CIAID, A.TDIARID, A.CNTCOMPROB '
      + '         ) A '
      + '  where DEBE<>DEBE6 or HABE<>HABE6 '
      + '  order by CIAID, TDIARID, CNTANOMM, CNTCOMPROB';
   Screen.Cursor := crHourGlass;

   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.Filter := '';
   DMCNT.cdsConsistencia.Filtered := False;
   DMCNT.cdsConsistencia.ProviderName := 'prvCNT';
   DMCNT.cdsConsistencia.DataRequest(xSQL);
   DMCNT.cdsConsistencia.Open;

   Screen.Cursor := crDefault;
End;

Procedure TFBalGeneral.GeneraSQLVerificaC60vsC61;
Var
   xSQL: String;
   xAM, xMes: String;
   xCia: String;
Begin
   xAM := speAno.Text;
   xMes := speMM.Text;

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;

   If dblcCia.Text = xCiaConsol Then
      xCia := 'A.CIAID>=' + quotedstr('01')
   Else
      xCia := 'A.CIAID=' + quotedstr(dblcCia.Text);

// Las Cuentas 60 no tiene su correspondiente 61
   xSQL := ' Select A.*, ''' + edtCia.Text + ''' CIADES, ''CTA 60 VS CTA 61'' SUBTITULO, DEBE-DEBE6 DIFDEBE, HABE-HABE6 DIFHABE '
      + '   From (Select A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CUENTAID, A.CUENTA6, '
      + '                A.DEBE, A.HABE, B.CUENTAID CTA6, '
      + '                sum(nvl(B.CNTDEBEMN,0)) DEBE6, sum(nvl(B.CNTHABEMN,0)) HABE6 '
      + '           from (Select A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CUENTAID, '
      + '                        B.CTAAUT2 CUENTA6, sum(nvl(A.CNTDEBEMN,0)) DEBE, sum(nvl(A.CNTHABEMN,0)) HABE '
      + '                   from CNT301 A, TGE202 B '
      + '                  where ' + xCia
      + '                    and A.CNTANOMM=''' + xAM + ''' and CNTESTADO=''P'' '
      + '                    and A.CIAID=B.CIAID and A.CUENTAID=B.CUENTAID and nvl(B.CTA_AUT2,''N'')=''S'' '
      + '                    and A.CUENTAID LIKE ''60%'' '
      + '                  group by A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CUENTAID, B.CTAAUT2 '
      + '                  order by CIAID, TDIARID, CNTCOMPROB '
      + '                 ) A, CNT301 B '
      + '          where A.CIAID=B.CIAID(+) and A.TDIARID=B.TDIARID(+) and A.CNTANOMM=B.CNTANOMM(+) '
      + '            and A.CNTCOMPROB=B.CNTCOMPROB(+) '
      + '            and A.CUENTA6=B.CUENTAID(+) '
      + '          group by A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CUENTAID, A.CUENTA6, '
      + '                   A.DEBE, A.HABE, B.CUENTAID '
      + '          order by A.CIAID, A.TDIARID, A.CNTCOMPROB '
      + '        ) A '
      + '  where DEBE<>HABE6 or HABE<>DEBE6 '
      + '  order by CIAID, TDIARID, CNTANOMM, CNTCOMPROB ';
   Screen.Cursor := crHourGlass;

   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.Filter := '';
   DMCNT.cdsConsistencia.Filtered := False;
   DMCNT.cdsConsistencia.ProviderName := 'prvCNT';
   DMCNT.cdsConsistencia.DataRequest(xSQL);
   DMCNT.cdsConsistencia.Open;

   Screen.Cursor := crDefault;
End;

Procedure TFBalGeneral.bbtnValida60vs61Click(Sender: TObject);
Var
   x10: Integer;
Begin
   GeneraSQLVerificaC60vsC61;

   If DMCNT.cdsConsistencia.RecordCount <= 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existen Inconsistencias');
      Exit;
   End;

   pprV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ConsistenciaVeriC9vsC6.rtm';
   pprV.Template.LoadFromFile;
   ppdbV.DataSource := DMCNT.dsConsistencia;

   Screen.Cursor := crDefault;
   If cbDisenoRep.Checked Then
   Begin
      ppdV.Report := pprV;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprV.Print;
      pprV.Stop;
      ppdbV.DataSource := Nil;
      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;
   End;
End;

Procedure TFBalGeneral.bbtnGastosPlaneamClick(Sender: TObject);
Var
// Inicio HPC_201602_CNT
// variables para separar Sentencia SQL
   xSQL, xSQL1, xSQL2: String;
// Fin HPC_201602_CNT
Begin
// Se diferencia la Cia 02 de las Filiales las cuales no se diferencian por Centro de Costo
// Inicio HPC_201602_CNT
// Se corrige SQL para retirar conexión remota @dbprodlee
   xSQL1 := 'select * from ( '
      + 'select A.CIAID, B.CIADES, A.CCOSID, C.CCOSDES, A.CUENTAID, D.CTADES, '
      + '       sum(T_ENE) T_ENE, sum(T_FEB) T_FEB, sum(T_MAR) T_MAR, sum(T_ABR) T_ABR, sum(T_MAY) T_MAY, sum(T_JUN) T_JUN, '
      + '       sum(T_JUL) T_JUL, sum(T_AGO) T_AGO, sum(T_SET) T_SET, '
      + '       sum(T_ENE) + sum(T_FEB) + sum(T_MAR) + sum(T_ABR) + sum(T_MAY) + sum(T_JUN) '
      + '     + sum(T_JUL) + sum(T_AGO) + sum(T_SET) T_TOT, '
      + '       round((sum(T_ENE) + sum(T_FEB) + sum(T_MAR) + sum(T_ABR) + sum(T_MAY) + sum(T_JUN) '
      + '     + sum(T_JUL) + sum(T_AGO) + sum(T_SET))/9,2) T_PRO '
      + '  from (select CIAID, CCOSID, CUENTAID, '
      + '               ENE_DEBE-ENE_HABER T_ENE, FEB_DEBE-FEB_HABER T_FEB,  MAR_DEBE-MAR_HABER T_MAR, ABR_DEBE-ABR_HABER T_ABR, '
      + '               MAY_DEBE-MAY_HABER T_MAY, JUN_DEBE-JUN_HABER T_JUN,  JUL_DEBE-JUL_HABER T_JUL, AGO_DEBE-AGO_HABER T_AGO, '
      + '               SET_DEBE-SET_HABER T_SET '
      + '          from (select CIAID, CCOSID, CUENTAID, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '01') + ' then CNTDEBEMN else 0 end ENE_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '01') + ' then CNTHABEMN else 0 end ENE_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '02') + ' then CNTDEBEMN else 0 end FEB_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '02') + ' then CNTHABEMN else 0 end FEB_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '03') + ' then CNTDEBEMN else 0 end MAR_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '03') + ' then CNTHABEMN else 0 end MAR_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '04') + ' then CNTDEBEMN else 0 end ABR_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '04') + ' then CNTHABEMN else 0 end ABR_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '05') + ' then CNTDEBEMN else 0 end MAY_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '05') + ' then CNTHABEMN else 0 end MAY_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '06') + ' then CNTDEBEMN else 0 end JUN_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '06') + ' then CNTHABEMN else 0 end JUN_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '07') + ' then CNTDEBEMN else 0 end JUL_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '07') + ' then CNTHABEMN else 0 end JUL_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '08') + ' then CNTDEBEMN else 0 end AGO_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '08') + ' then CNTHABEMN else 0 end AGO_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '09') + ' then CNTDEBEMN else 0 end SET_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '09') + ' then CNTHABEMN else 0 end SET_HABER, '
      + '                       A.CNTESTADO '
      + '                  from CNT301 A '
      + '                 where CIAID=''02'' '
      + '                   and CNTANOMM>=' + quotedstr(speAno.Text + '01') + ' and CNTANOMM<=' + quotedstr(speAno.Text + '09') + ' '
      + '                   and CUENTAID like ''9%'' '
      + '                   and CNTESTADO=''P'' '
      + '                 order by CIAID, CCOSID, CUENTAID '
      + '               ) A '
      + '        ) A, TGE101 B, TGE203 C, TGE202 D '
      + ' where A.CIAID=B.CIAID(+) '
      + '   and A.CCOSID=C.CCOSID(+) '
      + '   and A.CIAID=D.CIAID(+) AND A.CUENTAID=D.CUENTAID(+) '
      + ' group by A.CIAID, B.CIADES, A.CCOSID, C.CCOSDES, A.CUENTAID, D.CTADES ';

   xSQL2 := 'select A.CIAID, '
      + '       B.CIADES, '
      + '       ''****'' CCOSID, ''SIN CCOSTO'' CCOSDES, '
      + '       A.CUENTAID, '
      + '       D.CTADES, '
      + '       sum(T_ENE) T_ENE, '
      + '       sum(T_FEB) T_FEB, '
      + '       sum(T_MAR) T_MAR, '
      + '       sum(T_ABR) T_ABR, '
      + '       sum(T_MAY) T_MAY, '
      + '       sum(T_JUN) T_JUN, '
      + '       sum(T_JUL) T_JUL, '
      + '       sum(T_AGO) T_AGO, '
      + '       sum(T_SET) T_SET, '
      + '       sum(T_ENE) + sum(T_FEB) + sum(T_MAR) + sum(T_ABR) + sum(T_MAY) '
      + '                  + sum(T_JUN) + sum(T_JUL) + sum(T_AGO) + sum(T_SET) T_TOT, '
      + '       round((sum(T_ENE) + sum(T_FEB) + sum(T_MAR) + sum(T_ABR) + sum(T_MAY) '
      + '            + sum(T_JUN) + sum(T_JUL) + sum(T_AGO) + sum(T_SET))/9,2) T_PRO '
      + '  from (select CIAID, CCOSID, CUENTAID, '
      + '               ENE_DEBE-ENE_HABER T_ENE, FEB_DEBE-FEB_HABER T_FEB,  MAR_DEBE-MAR_HABER T_MAR, ABR_DEBE-ABR_HABER T_ABR, '
      + '               MAY_DEBE-MAY_HABER T_MAY, JUN_DEBE-JUN_HABER T_JUN,  JUL_DEBE-JUL_HABER T_JUL, AGO_DEBE-AGO_HABER T_AGO, '
      + '               SET_DEBE-SET_HABER T_SET '
      + '          from (select CIAID, ''****'' CCOSID, CUENTAID, '
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '01') + ' then CNTDEBEMN else 0 end) ENE_DEBE, '
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '01') + ' then CNTHABEMN else 0 end) ENE_HABER,'
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '02') + ' then CNTDEBEMN else 0 end) FEB_DEBE, '
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '02') + ' then CNTHABEMN else 0 end) FEB_HABER,'
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '03') + ' then CNTDEBEMN else 0 end) MAR_DEBE, '
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '03') + ' then CNTHABEMN else 0 end) MAR_HABER,'
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '04') + ' then CNTDEBEMN else 0 end) ABR_DEBE, '
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '04') + ' then CNTHABEMN else 0 end) ABR_HABER,'
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '05') + ' then CNTDEBEMN else 0 end) MAY_DEBE, '
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '05') + ' then CNTHABEMN else 0 end) MAY_HABER,'
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '06') + ' then CNTDEBEMN else 0 end) JUN_DEBE, '
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '06') + ' then CNTHABEMN else 0 end) JUN_HABER,'
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '07') + ' then CNTDEBEMN else 0 end) JUL_DEBE, '
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '07') + ' then CNTHABEMN else 0 end) JUL_HABER,'
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '08') + ' then CNTDEBEMN else 0 end) AGO_DEBE, '
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '08') + ' then CNTHABEMN else 0 end) AGO_HABER,'
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '09') + ' then CNTDEBEMN else 0 end) SET_DEBE, '
      + '                       sum(case when CNTANOMM=' + quotedstr(speAno.Text + '09') + ' then CNTHABEMN else 0 end) SET_HABER,'
      + '                       A.CNTESTADO '
      + '                  from CNT301 A '
      + '                 where CIAID>''02'' '
      + '                   and CNTANOMM>=' + quotedstr(speAno.Text + '01') + ' and CNTANOMM<=' + quotedstr(speAno.Text + '09') + ' '
      + '                   and CUENTAID like ''9%'' '
      + '                   and CNTESTADO=''P'' '
      + '                 group by CIAID, CUENTAID, A.CNTESTADO '
      + '                 order by CIAID, CCOSID, CUENTAID '
      + '               ) A '
      + '        ) A, '
      + '       TGE101 B, '
      + '       TGE202 D '
      + ' where B.CIAID(+)=A.CIAID '
      + '   and D.CIAID(+)=A.CIAID AND D.CUENTAID(+)=A.CUENTAID '
      + ' group by A.CIAID, B.CIADES, A.CUENTAID, D.CTADES ';

   xSQL2 := 'select A.CIAID, B.CIADES, A.CCOSID, C.CCOSDES, A.CUENTAID, D.CTADES, '
      + '       sum(T_ENE) T_ENE, sum(T_FEB) T_FEB, sum(T_MAR) T_MAR, sum(T_ABR) T_ABR, sum(T_MAY) T_MAY, sum(T_JUN) T_JUN, '
      + '       sum(T_JUL) T_JUL, sum(T_AGO) T_AGO, sum(T_SET) T_SET, '
      + '       sum(T_ENE) + sum(T_FEB) + sum(T_MAR) + sum(T_ABR) + sum(T_MAY) + sum(T_JUN) '
      + '     + sum(T_JUL) + sum(T_AGO) + sum(T_SET) T_TOT, '
      + '       round((sum(T_ENE) + sum(T_FEB) + sum(T_MAR) + sum(T_ABR) + sum(T_MAY) + sum(T_JUN) '
      + '     + sum(T_JUL) + sum(T_AGO) + sum(T_SET))/9,2) T_PRO '
      + '  from (select CIAID, CCOSID, CUENTAID, '
      + '               ENE_DEBE-ENE_HABER T_ENE, FEB_DEBE-FEB_HABER T_FEB,  MAR_DEBE-MAR_HABER T_MAR, ABR_DEBE-ABR_HABER T_ABR, '
      + '               MAY_DEBE-MAY_HABER T_MAY, JUN_DEBE-JUN_HABER T_JUN,  JUL_DEBE-JUL_HABER T_JUL, AGO_DEBE-AGO_HABER T_AGO, '
      + '               SET_DEBE-SET_HABER T_SET '
      + '          from (select CIAID, CCOSID, CUENTAID, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '01') + ' then CNTDEBEMN else 0 end ENE_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '01') + ' then CNTHABEMN else 0 end ENE_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '02') + ' then CNTDEBEMN else 0 end FEB_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '02') + ' then CNTHABEMN else 0 end FEB_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '03') + ' then CNTDEBEMN else 0 end MAR_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '03') + ' then CNTHABEMN else 0 end MAR_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '04') + ' then CNTDEBEMN else 0 end ABR_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '04') + ' then CNTHABEMN else 0 end ABR_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '05') + ' then CNTDEBEMN else 0 end MAY_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '05') + ' then CNTHABEMN else 0 end MAY_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '06') + ' then CNTDEBEMN else 0 end JUN_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '06') + ' then CNTHABEMN else 0 end JUN_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '07') + ' then CNTDEBEMN else 0 end JUL_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '07') + ' then CNTHABEMN else 0 end JUL_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '08') + ' then CNTDEBEMN else 0 end AGO_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '08') + ' then CNTHABEMN else 0 end AGO_HABER, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '09') + ' then CNTDEBEMN else 0 end SET_DEBE, '
      + '                       case when CNTANOMM=' + quotedstr(speAno.Text + '09') + ' then CNTHABEMN else 0 end SET_HABER, '
      + '                       A.CNTESTADO '
      + '                  from CNT301 A '
      + '                 where CIAID>''02'' '
      + '                   and CNTANOMM>=' + quotedstr(speAno.Text + '01') + ' and CNTANOMM<=' + quotedstr(speAno.Text + '09') + ' '
      + '                   and CUENTAID like ''9%'' '
      + '                   and CNTESTADO=''P'' '
      + '                 order by CIAID, CCOSID, CUENTAID '
      + '               ) A '
      + '        ) A, TGE101 B, TGE203 C, TGE202 D '
      + ' where A.CIAID=B.CIAID(+) '
      + '   and A.CCOSID=C.CCOSID(+) '
      + '   and A.CIAID=D.CIAID(+) AND A.CUENTAID=D.CUENTAID(+) '
      + ' group by A.CIAID, B.CIADES, A.CCOSID, C.CCOSDES, A.CUENTAID, D.CTADES ';

   xSQL := xSQL1 + 'union all ' + xSQL2
      + ') '
      + '  order by CIAID, CCOSID, CUENTAID ';
// Fin HPC_201602_CNT

   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   dtgData.DataSource := DMCNT.dsQry;
   DMCNT.HojaExcel('ProyGastosPlaneamiento', self.dtgData.DataSource, self.dtgData);
End;

// Inicio HCP_201303_CNT
Procedure TFBalGeneral.bbtnBCG_SIxSaldoClick(Sender: TObject);
Var
   xWhere2, xMes, wMesAnt, sSQL1, sSQL2, sSQL3, sSQL4, sSQL5, sSQL6: String;
   xSQL: AnsiString;
   CampoH, CampoS, CampoD: String;
   sSaldoD, sSaldoH, sISaldoD, sISaldoH, sESaldoD, sESaldoH: String;
   sMon, sWhere, sDebe, sDebeAnt, sHabe, sHabeAnt, sHaving: String;
   i, x10: integer;
   xAM, cEstadoRep, xCierre, xSDAnt, xSHAnt: String;
Begin
   If edtCia.Text = '' Then
   Begin
      showmessage('Compañía no válida');
      Raise exception.Create('Compañía no válida');
   End;

   If dblcNivel.Text = '' Then
   Begin
      ShowMessage('Seleccione un Nivel de Detalle de Cuenta');
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   xAM := speAno.Text;
   xMes := speMM.Text;

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;

   xSql := 'SELECT * FROM TGE154 WHERE CIAID=' + quotedstr(dblcCia.text) + ' and ANO=' + quotedstr(speAno.Text);
   DMCNT.cdsCierres.close;
   DMCNT.cdsCierres.datarequest(xsql);
   DMCNT.cdsCierres.open;
   If DMCNT.cdsCierres.FieldByName('PER' + xMes).AsString = 'S' Then
   Begin
      GeneraSQLVerifica;
      If DMCNT.cdsConsistencia.RecordCount > 0 Then
      Begin
         Screen.Cursor := crDefault;
         ShowMessage('Error : Existen Inconsistencias. Emitir Reporte...');
         Exit;
      End;
   End;

   If xAM >= '201104' Then
   Begin
      GeneraSQLAsientoDesc;
      If DMCNT.cdsConsistencia.RecordCount > 0 Then
      Begin
         Screen.Cursor := crDefault;
         ShowMessage('Error : Existen asientos con Descuadre. Emitir Reporte...');
         Exit;
      End;
   End;

   GeneraSQLAsientoSinCta;
   If DMCNT.cdsConsistencia.RecordCount > 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('Error : Existen asientos con cuentas en blanco. Emitir Reporte...');
      Exit;
   End;

   DMCNT.cdsQry.Filtered := false;
   DMCNT.cdsQry.Filter := '';

   GeneraSQLRegIni;
   cEstadoRep := ' ';
   If DMCNT.cdsConsistencia.RecordCount > 0 Then
      cEstadoRep := 'BALANCE PRELIMINAR : EXISTEN REGISTROS EN ESTADO INICIAL, VERIFICAR';

   Screen.Cursor := crHourGlass;
   xnivel := '';
   xsql := '';
// ACUMULADO DEL DEBE Y HABER
   If rgMoneda.ItemIndex = 1 Then // CUANDO ES MONDEDA EXTRANJERA
   Begin
      sMon := 'ME';
      sWhere := 'TMON_LOC=''E''';
   End
   Else
   Begin
      sMon := 'MN';
      sWhere := 'TMON_LOC=''L''';
   End;

// ACUMULADO INCLUYENDO EL MES ACTUAL
   For i := 0 To StrToInt(speMM.text) Do
   Begin
      sDebe := sDebe + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      sHabe := sHabe + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
   End;
   //QUITAR EL ULTIMO + DE LA CADENA
   sDebe := Copy(sDebe, 1, Length(sDebe) - 1);
   sHabe := Copy(sHabe, 1, Length(sHabe) - 1);

// SALDOS ANTERIORES
   For i := 0 To StrToInt(speMM.text) - 1 Do
   Begin
      sDebeAnt := sDebeAnt + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      sHabeAnt := sHabeAnt + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
   End;

   If StrToInt(speMM.text) - 1 > 0 Then
      If StrToInt(speMM.text) = 1 Then
      Begin
         sDebeAnt := sDebeAnt + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
         sHabeAnt := sHabeAnt + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      End;

   If Length(sDebeAnt) = 0 Then
   Begin
      sDebeAnt := sDebeAnt + ' 0.00+';
      sHabeAnt := sHabeAnt + ' 0.00+';
   End;

   //QUITAR EL ULTIMO + DE LA CADENA
   xSDAnt := Copy(sDebeAnt, 1, Length(sDebeAnt) - 1);
   xSHAnt := Copy(sHabeAnt, 1, Length(sHabeAnt) - 1);

   sDebeAnt := ' CASE WHEN (' + xSDAnt + ' - (' + xSHAnt + '))>0 THEN ' + xSDAnt + ' - (' + xSHAnt + ') ELSE 0 END ADEBEANT, ';
   sHabeAnt := ' CASE WHEN (' + xSHAnt + ' - (' + xSDAnt + '))>0 THEN ' + xSHAnt + ' - (' + xSDAnt + ') ELSE 0 END AHABEANT, ';

   sSaldoD := ' CASE WHEN (' + sDebe + ' - (' + sHabe + '))>0 THEN ' + sDebe + ' - (' + sHabe + ') ELSE 0 END ASALDOD, ';
   sSaldoh := ' CASE WHEN (' + sHabe + ' - (' + sDebe + '))>0 THEN ' + sHabe + ' - (' + sDebe + ') ELSE 0 END ASALDOH, ';

   sISaldoD := ' CASE WHEN (TGE202.CTA_TIPO = ''A'') AND (' + sDebe + ' - (' + sHabe + '))>0 THEN ' + sDebe + ' - (' + sHabe + ') ELSE 0 END ISALDOD, ';
   sISaldoH := ' CASE WHEN (TGE202.CTA_TIPO = ''A'') AND (' + sHabe + ' - (' + sDebe + '))>0 THEN ' + sHabe + ' - (' + sDebe + ') ELSE 0 END ISALDOH, ';

   sESaldoD := ' CASE WHEN (TGE202.CTA_TIPO = ''R'') AND (' + sDebe + ' - (' + sHabe + '))>0 THEN ' + sDebe + ' - (' + sHabe + ') ELSE 0 END ESALDOD, ';
   sESaldoH := ' CASE WHEN (TGE202.CTA_TIPO = ''R'') AND (' + sHabe + ' - (' + sDebe + '))>0 THEN ' + sHabe + ' - (' + sDebe + ') ELSE 0 END ESALDOH, ';

   sDebe := sDebe + ' ADEBE, ';
   sHabe := sHabe + ' AHABE, ';

   xnivel := '';
   xsql := '';

   xsql := 'NIVEL=' + quotedstr(IntToStr(StrToInt(dblcNivel.text) + 1));

   If DMCNT.DisplayDescrip('PrvTGE', 'CNT202', '*', xsql, 'NIVEL') = '' Then
      xnivel := '0'
   Else
      xnivel := '1';
   xWhere := 'CNT401.CIAID=' + '''' + dblcCia.Text + ''''
      + ' AND CNT401.ANO=' + '''' + speAno.Text + ''''
      + ' AND CNT401.TIPO<=' + '''' + dblcNivel.Text + ''''
      + ' AND (CNT401.AUXID IS NULL OR CNT401.AUXID='''') '
      + ' AND (CNT401.CCOSID IS NULL OR CNT401.CCOSID='''')'
      + ' AND LENGTH(CNT401.CUENTAID) <> 1';
   If sCiaCuenta <> '' Then
   Begin
      xWhere := xWhere + ' and CNT401.' + sCiaCuenta;
   End;

   xMes := speMM.Text;

   If (StrToInt(xmes) - 1) <= 9 Then
      wMesAnt := '0' + inttostr((StrToInt(xmes) - 1));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   CampoS := ' SALD' + sMon + wMesAnt; // wmes
   CampoD := ' DEBE' + sMon + xMes;
   CampoH := ' HABE' + sMon + xMes;

   xSQL := 'SELECT CNT401.CUENTAID, CNT401.CTADES, ''' + edtCia.Text + ''' CIA_NOMBRE, ''' + SysUtils.LongMonthNames[strtoint(xMes)] + '  ' + speAno.Text + ''' PERIODO_T, ';

   sSQL1 := sDebeAnt + sHabeant + CampoD + ' DEBE,' + CampoH + ' HABE, ';

   sSQL2 := sDebe + sHabe + sSaldoD + sSaldoH;

   sSQL3 := sISaldoD + sISaldoH;

   sSQL6 := sESaldoD + sESaldoH;

   sSQL4 := ' TGE202.CTA_DET, CNT401.TIPO, ''' + cEstadoRep + ''' ESTADO '
      + ' FROM CNT401, TGE202'
      + ' WHERE (CNT401.CUENTAID = TGE202.CUENTAID(+)) AND (CNT401.CIAID = TGE202.CIAID(+)) AND ';

   sSQL5 := ' ORDER BY CNT401.CUENTAID';

   xSQL := xSQL + sSQL1 + sSQL2 + sSQL3 + sSQL6 + sSQL4 + xWhere + sSQL5;

   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.ProviderName := 'prvCNT';
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
//   DMCNT.cdsQry.Filter := ' ADEBE <>0.00 or AHABE <>0.00 ';
//   DMCNT.cdsQry.Filtered := True;
   If DMCNT.cdsQry.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas');
      DMCNT.cdsQry.Filter := '';
      DMCNT.cdsQry.Filtered := True;
   End;
   DMCNT.cdsQry.First;
   While Not DMCNT.cdsQry.EOF Do
   Begin
      DMCNT.cdsQry.Edit;
      DMCNT.cdsQry.FieldByName('ADEBE').AsFloat := 0.00;
      DMCNT.cdsQry.FieldByName('AHABE').AsFloat := 0.00;
      DMCNT.cdsQry.FieldByName('ADEBE').AsFloat := DMCNT.cdsQry.FieldByName('ADEBEANT').AsFloat
         + DMCNT.cdsQry.FieldByName('DEBE').AsFloat;
      DMCNT.cdsQry.FieldByName('AHABE').AsFloat := DMCNT.cdsQry.FieldByName('AHABEANT').AsFloat
         + DMCNT.cdsQry.FieldByName('HABE').AsFloat;
      DMCNT.cdsQry.Next;
   End;

   DMCNT.cdsQry.First;
   Screen.Cursor := crDefault;
   If rgMoneda.ItemIndex = -1 Then
   Begin
      ShowMessage('Ingrese Tipo de Moneda');
      rgMoneda.SetFocus;
      Exit;
   End;

   ppdbBalComprob.DataSource := DMCNT.dsQry;

   DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Balance Comprobacion General',
      dblcCia.Text, // Campañía
      speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
      dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
      dblcNivel.Text, '', // Nivel   - Origen
      '', inttostr(rgMoneda.itemindex), // Lote    -  Moneda
      '', '', // Cuentas - Auxiliares
      '', 'Impresora', // Costos - Tipo Salida
      ''); // Tipo Rep

   pprA4.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\BalCompGeneralA4.rtm';
   pprA4.Template.LoadFromFile;
   If cbDisenoRep.Checked Then
   Begin
      ppdV.Report := pprA4;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprA4.Print;
      pprA4.Stop;

      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;

      DMCNT.cdsQry.CancelUpdates;
      DMCNT.cdsQry.IndexFieldNames := '';
      DMCNT.cdsQry.Filter := '';
      DMCNT.cdsQry.Filtered := True;
   End;

   ppdbBalComprob.DataSource := Nil;
End;
// Fin : HPC_201303_CNT

// Inicio HPC_201304_CNT
Procedure TFBalGeneral.bbtn46vs16Click(Sender: TObject);
Var
   xSQL, xAnoMes, xMes: String;
   x10: Integer;
Begin
   xMes := FBalGeneral.speMM.Text;
   If StrToInt(FBalGeneral.speMM.Text) <= 9 Then
      xMes := '0' + inttostr(StrToInt(FBalGeneral.speMM.Text));
   xAnoMes := FBalGeneral.speAno.Text + xMes;

   xSQL := 'select A.CIAID, B.CIADES, ' + quotedstr(xAnoMes) + ' ANOMES, '
      + '       max(CIA16) CIA16, max(CTA16) CTA16, sum(DEBE16) DEBE16, sum(HABER16) HABER16, '
      + '       abs(sum(DEBE16) - sum(HABER16)) DIFER16,'
      + '       max(CIA46) CIA46, max(CTA46) CTA46, sum(DEBE46) DEBE46, sum(HABER46) HABER46, '
      + '       abs(sum(DEBE46) - sum(HABER46)) DIFER46,'
      + '       abs(sum(DEBE16)-sum(HABER16)) - abs(sum(DEBE46)-sum(HABER46)) DIFER '
      + 'from ( '
      + 'select substr(CUENTAID,4,2) CIAID, CIAID CIA16, CUENTAID CTA16, sum(CNTDEBEMN) DEBE16, sum(CNTHABEMN) HABER16, '
      + '                                   ''  '' CIA46, ''     '' CTA46, 0.00 DEBE46, 0.00 HABER46 '
      + '  from CNT301 '
      + ' where CIAID=''02'' '
      + '   and CNTANOMM=' + quotedstr(xAnoMes)
      + '   and (CUENTAID like ''166%'') '
      + 'group by CIAID, CUENTAID '
      + 'union all '
      + 'select CIAID, ''  '' CIA16, ''     '' CTA16, 0.00 DEBE16, 0.00 HABER16, '
      + '                    CIAID CIA46, CUENTAID CTA46, sum(CNTDEBEMN) DEBE46, sum(CNTHABEMN) HABER46 '
      + '  from CNT301 '
      + ' where CIAID<>''01'' and CIAID<>''02'' '
      + '   and CNTANOMM=' + quotedstr(xAnoMes)
      + '   and CUENTAID like ''46602%'' '
      + 'group by CIAID, CUENTAID '
      + ') A, TGE101 B '
      + 'where B.CIAID=A.CIAID '
      + 'group by A.CIAID, B.CIADES '
      + 'order by A.CIAID ';
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;

   pprV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\BalComp46vs16.rtm';
   pprV.Template.LoadFromFile;
   ppdbV.DataSource := DMCNT.dsQry2;

   Screen.Cursor := crDefault;
   If cbDisenoRep.Checked Then
   Begin
      ppdV.Report := pprV;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprV.Print;
      pprV.Stop;
      ppdbV.DataSource := Nil;
      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;
   End;
   bbtn46vs16.Visible := False;
   dblcCia.SetFocus;
   dblccia.SelStart := 0;
   dblcCia.SelLength := Length(dblccia.TexT);
    //DMCNT.cdsCia.FieldValues('CIAID').AsString
    {
   dbgData.DataSource := DMCNT.dsQry2;
   dbgData.Selected.Clear;
   dbgData.Selected.Add('CIAID'#9'8'#9'Compañía'#9'F');
   dbgData.Selected.Add('CIADES'#9'8'#9'Nombre de Compañía'#9'F');

   dbgData.Selected.Add('CIA16'#9'6'#9'Cía 16'#9'F');
   dbgData.Selected.Add('CTA16'#9'8'#9'Cuenta 16'#9'F');
   dbgData.Selected.Add('DEBE16'#9'12'#9'Imp.Debe Cta16'#9'F');
   dbgData.Selected.Add('HABER16'#9'12'#9'Imp.Haber Cta16'#9'F');

   dbgData.Selected.Add('CIA46'#9'6'#9'Cía 46'#9'F');
   dbgData.Selected.Add('CTA46'#9'8'#9'Cuenta 46'#9'F');
   dbgData.Selected.Add('DEBE46'#9'12'#9'Imp.Debe Cta46'#9'F');
   dbgData.Selected.Add('HABER46'#9'12'#9'Imp.Haber Cta46'#9'F');

   dbgData.Selected.Add('DIFER'#9'12'#9'Diferencia'#9'F');
}
End;
// Fin HPC_201304_CNT

procedure TFBalGeneral.SpeedButton1Click(Sender: TObject);
begin
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
end;

// Inicio HPC_201405_CNT
procedure TFBalGeneral.bbtnVerifNegatClick(Sender: TObject);
Var
   xSQL: String;
   xAnoMes : String;
   xFechaIni : TDateTime;
   xFechaFin : TDateTime;
   x10 : Integer;
Begin
   xSQL := 'Select ''12'' CIAID, ''123456789012345678901234567890'' CIADES, ''AAAAMM'' ANOMES, '
          +'  ''1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'' OBSERVAC '
          +'  from DUAL where 1<>1';
   DMCNT.cdsReporte.Close;
   DMCNT.cdsReporte.DataRequest(xSQL);
   DMCNT.cdsReporte.Open;

   xAnoMes := speAno.Text + DMCNT.StrZero(speMM.Text,2);

   xFechaIni := strtodate('01/'+ DMCNT.StrZero(speMM.Text,2)+'/'+speAno.Text);

   if speMM.Text='12' then
      xFechaFin := strtodate('31/12/'+speAno.Text)
   else
      xFechaFin := strtodate('01/'
                           +DMCNT.StrZero(
                                   inttostr(
                                       strtoint(speMM.Text)+1)
                                          ,2)+'/'+speAno.Text)-1;

// valida que no haya registro en negativo
   xSQL := 'select CIAID, TDIARID, CNTCOMPROB, CNTREG, CNTUSER '
          +'  from CNT301 '
          +' where CIAID='+quotedstr(dblcCia.Text)
          +'   and CNTANOMM='+quotedstr(xAnoMes)
          +'   and CNTMTOLOC<0 '
          +' order by CNT301.CIAID, CNT301.TDIARID, CNT301.CNTCOMPROB, CNT301.CNTREG';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   if DMCNT.cdsQry.RecordCount>0 then
   begin
      while not DMCNT.cdsQry.EOF do
      begin
         DMCNT.cdsReporte.Append;
         DMCNT.cdsReporte.FieldByName('CIAID').AsString := dblcCia.Text;
         DMCNT.cdsReporte.FieldByName('CIADES').AsString := edtCia.Text;
         DMCNT.cdsReporte.FieldByName('ANOMES').AsString := xAnoMes;
         DMCNT.cdsReporte.FieldByName('OBSERVAC').AsString :=
               'VALOR NEGATIVO, '
              +' CIAID='+quotedstr(DMCNT.cdsQry.FieldByName('CIAID').AsString)
              +' TDIARIO='+quotedstr(DMCNT.cdsQry.FieldByName('TDIARID').AsString)
              +' COMPROBANTE='+quotedstr(DMCNT.cdsQry.FieldByName('CNTCOMPROB').AsString)
              +' NRO.REGISTRO='+inttostr(DMCNT.cdsQry.FieldByName('CNTREG').AsInteger)
              +' USUARIO='+quotedstr(DMCNT.cdsQry.FieldByName('CNTUSER').AsString);
         DMCNT.cdsReporte.Post;
         DMCNT.cdsQry.Next;
      end;
   end;

// valida que no haya números repetidos de registro en el detalle
   xSQL := 'select CNT301.CIAID, CNT301.TDIARID, CNT301.CNTCOMPROB, CNT301.CNTREG, CNT300.CNTUSER, count(CNT301.CNTREG) VECES '
          +'  from CNT301, CNT300 '
          +' where CNT301.CIAID='+quotedstr(dblcCia.Text)
          +'   and CNT301.CNTANOMM='+quotedstr(xAnoMes)
          +'   and CNT300.CIAID=CNT301.CIAID and CNT300.TDIARID=CNT301.TDIARID '
          +'       and CNT300.CNTANOMM=CNT301.CNTANOMM and CNT300.CNTCOMPROB=CNT301.CNTCOMPROB '
          +' group by CNT301.CIAID, CNT301.TDIARID, CNT301.CNTCOMPROB, CNT301.CNTREG, CNT300.CNTUSER '
          +'having count(CNT301.CNTREG)>1 '
          +' order by CNT301.CIAID, CNT301.TDIARID, CNT301.CNTCOMPROB, CNT301.CNTREG';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   if DMCNT.cdsQry.RecordCount>0 then
   begin
      while not DMCNT.cdsQry.EOF do
      begin
         DMCNT.cdsReporte.Append;
         DMCNT.cdsReporte.FieldByName('CIAID').AsString := dblcCia.Text;
         DMCNT.cdsReporte.FieldByName('CIADES').AsString := edtCia.Text;
         DMCNT.cdsReporte.FieldByName('ANOMES').AsString := xAnoMes;
         DMCNT.cdsReporte.FieldByName('OBSERVAC').AsString :=
               'NRO REG.DUPLICADO, '
              +' CIAID='+quotedstr(DMCNT.cdsQry.FieldByName('CIAID').AsString)
              +' TDIARIO='+quotedstr(DMCNT.cdsQry.FieldByName('TDIARID').AsString)
              +' COMPROBANTE='+quotedstr(DMCNT.cdsQry.FieldByName('CNTCOMPROB').AsString)
              +' NRO.REGISTRO='+inttostr(DMCNT.cdsQry.FieldByName('CNTREG').AsInteger)
              +' USUARIO='+quotedstr(DMCNT.cdsQry.FieldByName('CNTUSER').AsString);
         DMCNT.cdsReporte.Post;
         DMCNT.cdsQry.Next;
      end;
   end;
   //Inicio HPC_201701_CNT
// valida que no haya asientos con fecha de comprobante mayor a fecha maxima
   xSQL := 'select CIAID, TDIARID, CNTCOMPROB, CNTFCOMP, CNTREG, CNTUSER '
          +'  from CNT301 '
          +' where CIAID='+quotedstr(dblcCia.Text)
          +'   and CNTANOMM='+quotedstr(xAnoMes)
          +'   and (TRUNC(CNTFCOMP)<'+quotedstr(datetostr(xFechaIni))
          +'      or TRUNC(CNTFCOMP)>'+quotedstr(datetostr(xFechaFin))+')'
          +' order by CNT301.CIAID, CNT301.TDIARID, CNT301.CNTCOMPROB, CNT301.CNTREG';
   //Fin HPC_201701_CNT
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   if DMCNT.cdsQry.RecordCount>0 then
   begin
      while not DMCNT.cdsQry.EOF do
      begin
         DMCNT.cdsReporte.Append;
         DMCNT.cdsReporte.FieldByName('CIAID').AsString := dblcCia.Text;
         DMCNT.cdsReporte.FieldByName('CIADES').AsString := edtCia.Text;
         DMCNT.cdsReporte.FieldByName('ANOMES').AsString := xAnoMes;
         DMCNT.cdsReporte.FieldByName('OBSERVAC').AsString :=
               'FECHA DEL ASIENTO CONTABLE INVÁLIDA, '
              +' CIAID='+quotedstr(DMCNT.cdsQry.FieldByName('CIAID').AsString)
              +' TDIARIO='+quotedstr(DMCNT.cdsQry.FieldByName('TDIARID').AsString)
              +' COMPROBANTE='+quotedstr(DMCNT.cdsQry.FieldByName('CNTCOMPROB').AsString)
              +' NRO.REGISTRO='+inttostr(DMCNT.cdsQry.FieldByName('CNTREG').AsInteger)
              +' USUARIO='+quotedstr(DMCNT.cdsQry.FieldByName('CNTUSER').AsString);
         DMCNT.cdsReporte.Post;
         DMCNT.cdsQry.Next;
      end;
   end;

// valida que no haya glosas con '|'
   xSQL := 'select * '
          +'  from (select CIAID, TDIARID, CNTCOMPROB, CNTREG, CNTUSER, CNTGLOSA, '
          +'               case when instr(CNTGLOSA,''|'')=0 '
          +'                    then ''''  '
          +'                    else CNTGLOSA '
          +'                end OBSERVA '
          +'          from CNT301 '
          +' where CIAID='+quotedstr(dblcCia.Text)
          +'   and CNTANOMM='+quotedstr(xAnoMes)
          +'       ) where OBSERVA is not null '
          +' order by CIAID, TDIARID, CNTCOMPROB, CNTREG';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   if DMCNT.cdsQry.RecordCount>0 then
   begin
      while not DMCNT.cdsQry.EOF do
      begin
         DMCNT.cdsReporte.Append;
         DMCNT.cdsReporte.FieldByName('CIAID').AsString := dblcCia.Text;
         DMCNT.cdsReporte.FieldByName('CIADES').AsString := edtCia.Text;
         DMCNT.cdsReporte.FieldByName('ANOMES').AsString := xAnoMes;
         DMCNT.cdsReporte.FieldByName('OBSERVAC').AsString :=
               'GLOSA CON CARACTER PROHIBIDO, '
              +' CIAID='+quotedstr(DMCNT.cdsQry.FieldByName('CIAID').AsString)
              +' TDIARIO='+quotedstr(DMCNT.cdsQry.FieldByName('TDIARID').AsString)
              +' COMPROBANTE='+quotedstr(DMCNT.cdsQry.FieldByName('CNTCOMPROB').AsString)
              +' NRO.REGISTRO='+inttostr(DMCNT.cdsQry.FieldByName('CNTREG').AsInteger)
              +' USUARIO='+quotedstr(DMCNT.cdsQry.FieldByName('CNTUSER').AsString);
         DMCNT.cdsReporte.Post;
         DMCNT.cdsQry.Next;
      end;
   end;

   if DMCNT.cdsReporte.RecordCount= 0 then
   begin
      Screen.Cursor := crDefault;
      ShowMessage('No existen inconsistencias para este botón');
      exit;
   end;

   ppdbV.DataSource := DMCNT.dsReporte;
   pprV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\BalCompValidaNegativos.rtm';
   pprV.Template.LoadFromFile;

   Screen.Cursor := crDefault;
   If cbDisenoRep.Checked Then
   Begin
      ppdV.Report := pprV;
      ppdV.ShowModal;
   End
   Else
   Begin
      pprV.Print;
      pprV.Stop;
      ppdbV.DataSource := Nil;
      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;
   End;
end;
// Fin HPC_201405_CNT

// Inicio HPC_201602_CNT
procedure TFBalGeneral.bbtn2DigVSMovClick(Sender: TObject);
var
   xSQL, xCampoSaldoIni, xCampoDebe, xCampoHaber, xCampoSaldoFin : String;
begin
   xCampoSaldoIni := 'SALDMN' + DMCNT.StrZero(inttostr(strtoint(speMM.Text)-1),2);
   xCampoDebe     := 'DEBEMN' + DMCNT.StrZero(speMM.Text,2);
   xCampoHaber    := 'HABEMN' + DMCNT.StrZero(speMM.Text,2);
   xCampoSaldoFin := 'SALDMN' + DMCNT.StrZero(speMM.Text,2);

   xSQL := 'Select CUENTAID, CTADES, CTA_DET, '

      + '          case when length(CUENTAID)=2 then SALDINIDEBE else 0.00 end SAL_INI_2_DEBE, '
      + '          case when length(CUENTAID)=2 then SALDINIHABE else 0.00 end SAL_INI_2_HABER, '
      + '          case when CTA_DET=''S'' then SALDINIDEBE else 0.00 end SAL_INI_MOV_DEBE, '
      + '          case when CTA_DET=''S'' then SALDINIHABE else 0.00 end SAL_INI_MOV_HABER, '

      + '          case when length(CUENTAID)=2 then DEBEMN else 0.00 end DEBEMN_2_DIG, '
      + '          case when length(CUENTAID)=2 then HABERMN else 0.00 end HABERMN_2_DIG, '
      + '          case when CTA_DET=''S'' then DEBEMN else 0.00 end DEBEMN_MOV, '
      + '          case when CTA_DET=''S'' then HABERMN else 0.00 end HABERMN_MOV, '

      + '          case when length(CUENTAID)=2 then SALDINIDEBE+DEBEMN else 0.00 end SAL_ACU_2_DEBE, '
      + '          case when length(CUENTAID)=2 then SALDINIHABE+HABERMN else 0.00 end SAL_ACU_2_HABER, '
      + '          case when CTA_DET=''S'' then SALDINIDEBE+DEBEMN else 0.00 end SAL_ACU_MOV_DEBE, '
      + '          case when CTA_DET=''S'' then SALDINIHABE+HABERMN else 0.00 end SAL_ACU_MOV_HABER, '

      + '          case when length(CUENTAID)=2 then SALDFINDEBE else 0.00 end SAL_FIN_2_DEBE, '
      + '          case when length(CUENTAID)=2 then SALDFINHABE else 0.00 end SAL_FIN_2_HABER, '
      + '          case when CTA_DET=''S'' then SALDFINDEBE else 0.00 end SAL_FIN_MOV_DEBE, '
      + '          case when CTA_DET=''S'' then SALDFINHABE else 0.00 end SAL_FIN_MOV_HABER '

      + '     from (Select A.CUENTAID, B.CTADES, A.TIPO, B.CTA_DET, '

      + '                  case when ('+xCampoSaldoIni+')>0 '
      + '                       then '+xCampoSaldoIni
      + '                       else 0.00 end SALDINIDEBE, '
      + '                  case when ('+xCampoSaldoIni+')<0 '
      + '                       then abs('+xCampoSaldoIni+') '
      + '                       else 0.00 end SALDINIHABE, '

      +                    xCampoDebe+' DEBEMN,'
      +                    xCampoHaber+' HABERMN,'

      + '                  case when ('+xCampoSaldoFin+')>0 '
      + '                       then '+xCampoSaldoFin
      + '                       else 0.00 end SALDFINDEBE, '
      + '                  case when ('+xCampoSaldoFin+')<0 '
      + '                       then abs('+xCampoSaldoFin+') '
      + '                       else 0.00 end SALDFINHABE '

      + '             from CNT401 A, TGE202 B '
      + '            where A.CIAID='+quotedstr(dblcCia.Text)
      + '              and A.ANO='+quotedstr(speAno.Text)
      + '              and A.AUXID is null and A.CCOSID is null '
      + '              and B.CIAID=A.CIAID and B.CUENTAID=A.CUENTAID '
      + '           ) '
      + '    order by CUENTAID, TIPO ';
   DMCNT.cdsReporte.Close;
   DMCNT.cdsReporte.DataRequest(xSQL);
   DMCNT.cdsReporte.Open;
   ExportExcelVerif;
end;
// Fin HPC_201602_CNT

// Inicio HPC_201602_CNT
// Genera archivo Excel para Verificación entre Totales de 2 dígitos versus movimientos
procedure TFBalGeneral.ExportExcelVerif;
Var
   i, iIni, iFin, c: Integer;
   Sheet: Variant;
   nNum: integer;
   cEstadoRep, sMoneda, sIni, sFin: String;

   xnSINI_DEBE_2 : currency;  // Saldo Inicial Debe a 2 dígitos
   xnSINI_HABE_2 : currency;  // Saldo Inicial Haber a 2 dígitos
   xnSINI_DEBE_M : currency;  // Saldo Inicial Debe Nivel Movimiento
   xnSINI_HABE_M : currency;  // Saldo Inicial Haber Nivel Movimiento

   xnDEBE_2 : currency;  // Debe a 2 dígitos
   xnHABE_2 : currency;  // Haber a 2 dígitos
   xnDEBE_M : currency;  // Debe a Nivel movimiento
   xnHABE_M : currency;  // Haber a Nivel movimiento

   xnSACU_DEBE_2 : currency; // Saldo Acumulado Debe a 2 dígitos
   xnSACU_HABE_2 : currency; // Saldo Acumulado Haber a 2 dígitos
   xnSACU_DEBE_M : currency; // Saldo Acumulado Debe a Nivel Movimiento
   xnSACU_HABE_M : currency; // Saldo Acumulado Haber a Nivel Movimiento

   xnSFIN_DEBE_2 : currency; // Saldo Final Debe a 2 dígitos
   xnSFIN_HABE_2 : currency; // Saldo Final Haber a 2 dígitos
   xnSFIN_DEBE_M : currency; // Saldo Final Debe a Nivel movimiento
   xnSFIN_HABE_M : currency; // Saldo Final Haber a Nivel Movimiento
Begin
   xnSINI_DEBE_2 :=0;
   xnSINI_HABE_2 :=0;
   xnSINI_DEBE_M :=0;
   xnSINI_HABE_M :=0;

   xnDEBE_2 :=0;
   xnHABE_2 :=0;
   xnDEBE_M :=0;
   xnHABE_M :=0;

   xnSACU_DEBE_2 :=0;
   xnSACU_HABE_2 :=0;
   xnSACU_DEBE_M :=0;
   xnSACU_HABE_M :=0;

   xnSFIN_DEBE_2 :=0;
   xnSFIN_HABE_2 :=0;
   xnSFIN_DEBE_M :=0;
   xnSFIN_HABE_M :=0;

   XLApp := CreateOleObject('Excel.Application');
   XLApp.Visible := True;
   XLApp.Workbooks.Add(xlWBatWorkSheet);
   XLApp.Workbooks[1].WorkSheets[1].Name := 'Balance CompGral Verif.Niveles';
   Sheet := XLApp.Workbooks[1].WorkSheets['Balance CompGral Verif.Niveles'];

   sheet.Columns[1].ColumnWidth := 10;  // Cuenta Contable
   sheet.Columns[2].ColumnWidth := 45;  // Descripción de Cuenta
   sheet.Columns[3].ColumnWidth := 9;   // Flag Indica que es Detalle

   sheet.Columns[4].ColumnWidth := 16;  // Saldo Inicial Debe a 2 dígitos
   sheet.Columns[5].ColumnWidth := 16;  // Saldo Inicial Haber a 2 dígitos
   sheet.Columns[6].ColumnWidth := 16;  // Saldo Inicial Debe Nivel Movimiento
   sheet.Columns[7].ColumnWidth := 16;  // Saldo Inicial Haber Nivel Movimiento

   sheet.Columns[8].ColumnWidth := 16;  // Debe a 2 dígitos
   sheet.Columns[9].ColumnWidth := 16;  // Haber a 2 dígitos
   sheet.Columns[10].ColumnWidth := 16; // Debe a Nivel movimiento
   sheet.Columns[11].ColumnWidth := 16; // Haber a Nivel movimiento

   sheet.Columns[12].ColumnWidth := 16; // Saldo Acumulado Debe a 2 dígitos
   sheet.Columns[13].ColumnWidth := 16; // Saldo Acumulado Haber a 2 dígitos
   sheet.Columns[14].ColumnWidth := 16; // Saldo Acumulado Debe a Nivel Movimiento
   sheet.Columns[15].ColumnWidth := 16; // Saldo Acumulado Haber a Nivel Movimiento

   sheet.Columns[16].ColumnWidth := 16; // Saldo Final Debe a 2 dígitos
   sheet.Columns[17].ColumnWidth := 16; // Saldo Final Haber a 2 dígitos
   sheet.Columns[18].ColumnWidth := 16; // Saldo Final Debe a Nivel movimiento
   sheet.Columns[19].ColumnWidth := 16; // Saldo Final Haber a Nivel Movimiento

   i := 1;
   sheet.cells[i, 1] := edtCia.Text;
   sheet.cells[i, 2] := '';
   sheet.cells[i, 3] := '';
   sheet.cells[i, 4] := '';
   sheet.cells[i, 5] := '';
   sheet.cells[i, 6] := 'BALANCE DE COMPROBACION GENERAL - VERIFICA TOTALES POR NIVEL (2 Y MÁX)';
   sheet.cells[i, 7] := '';
   sheet.cells[i, 8] := '';
   sheet.cells[i, 9] := '';
   sheet.cells[i, 10] := '';
   sheet.cells[i, 11] := '';
   sheet.cells[i, 12] := '';
   sheet.cells[i, 13] := '';
   sheet.cells[i, 14] := '';
   sheet.cells[i, 15] := '';
   sheet.cells[i, 16] := '';
   sheet.cells[i, 17] := '';
   sheet.cells[i, 18] := '';
   sheet.cells[i, 19] := DATETOSTR(DATE);

   inc(i);
   sheet.cells[i, 1] := 'Contabilidad';
   sheet.cells[i, 2] := '';
   sheet.cells[i, 3] := '';
   sheet.cells[i, 4] := '';
   sheet.cells[i, 5] := '';
   sheet.cells[i, 6] := '';
   sheet.cells[i, 7] := '';
   sheet.cells[i, 8] := '';
   sheet.cells[i, 9] := SysUtils.LongMonthNames[strtoint(speMM.Text)] + '  ' + speAno.Text;
   sheet.cells[i, 10] := '';
   sheet.cells[i, 11] := '';
   sheet.cells[i, 12] := '';
   sheet.cells[i, 13] := '';
   sheet.cells[i, 14] := '';
   sheet.cells[i, 15] := '';
   sheet.cells[i, 16] := '';
   sheet.cells[i, 17] := '';
   sheet.cells[i, 18] := '';
   sheet.cells[i, 19] := TIMETOSTR(TIME);

   If rgMoneda.ItemIndex = 0 Then
      sMoneda := 'MONEDA LOCAL'
   Else
      sMoneda := 'MONEDA EXTRANJERA';

   cEstadoRep := ' ';
//   If DMCNT.cdsConsistencia.RecordCount > 0 Then
//      cEstadoRep := 'BALANCE PRELIMINAR : EXISTEN REGISTROS EN ESTADO INICIAL, VERIFICAR';

   inc(i);
   sheet.cells[i, 1] := cEstadoRep;
   sheet.cells[i, 2] := '';
   sheet.cells[i, 3] := '';
   sheet.cells[i, 4] := '';
   sheet.cells[i, 5] := '';
   sheet.cells[i, 6] := '';
   sheet.cells[i, 7] := '';
   sheet.cells[i, 8] := '';
   sheet.cells[i, 9] := sMoneda;
   sheet.cells[i, 10] := '';
   sheet.cells[i, 11] := '';
   sheet.cells[i, 12] := '';
   sheet.cells[i, 13] := '';
   sheet.cells[i, 14] := '';
   sheet.cells[i, 15] := '';
   sheet.cells[i, 16] := '';
   sheet.cells[i, 17] := '';
   sheet.cells[i, 18] := '';
   sheet.cells[i, 19] := '';

  // Titulos
   inc(i);
   inc(i);
   sheet.cells[i, 1] := '';
   sheet.cells[i, 2] := '';
   sheet.cells[i, 3] := 'ES';
   sheet.cells[i, 4] := 'ANTERIOR';
   sheet.cells[i, 5] := 'ANTERIOR';
   sheet.cells[i, 6] := 'ANTERIOR';
   sheet.cells[i, 7] := 'ANTERIOR';
   sheet.cells[i, 8] := 'DEL MES';
   sheet.cells[i, 9] := 'DEL MES';
   sheet.cells[i, 10] := 'DEL MES';
   sheet.cells[i, 11] := 'DEL MES';
   sheet.cells[i, 12] := 'ACUMULADO';
   sheet.cells[i, 13] := 'ACUMULADO';
   sheet.cells[i, 14] := 'ACUMULADO';
   sheet.cells[i, 15] := 'ACUMULADO';
   sheet.cells[i, 16] := 'SALDOS';
   sheet.cells[i, 17] := 'SALDOS';
   sheet.cells[i, 18] := 'SALDOS';
   sheet.cells[i, 19] := 'SALDOS';
//   sheet.cells[i, 20] := 'INVENTARIOS';
//   sheet.cells[i, 21] := 'INVENTARIOS';
//   sheet.cells[i, 22] := 'RESULTADOS';
//   sheet.cells[i, 23] := 'RESULTADOS';

   For c := 1 To 19 Do
   Begin
      if (c<=5) or (c=8) or (c=9) or (c=12) or (c=13) or (c=16) or (c=17) then
         sheet.cells[i, c].Interior.Color := clMoneyGreen
      else
         sheet.cells[i, c].Interior.Color := clGray;
   End;

  // Titulos 2
   inc(i);
   sheet.cells[i, 1] := 'CUENTA';
   sheet.cells[i, 2] := 'DESCRIPCION';
   sheet.cells[i, 3] := 'DETALLE';
   sheet.cells[i, 4] := 'DEBE 2DIG';
   sheet.cells[i, 5] := 'HABER 2DIG';
   sheet.cells[i, 6] := 'DEBE MOV';
   sheet.cells[i, 7] := 'HABER MOV';
   sheet.cells[i, 8] := 'DEBE 2DIG';
   sheet.cells[i, 9] := 'HABER 2DIG';
   sheet.cells[i, 10] := 'DEBE MOV';
   sheet.cells[i, 11] := 'HABER MOV';
   sheet.cells[i, 12] := 'DEBE 2DIG';
   sheet.cells[i, 13] := 'HABER 2DIG';
   sheet.cells[i, 14] := 'DEBE MOV';
   sheet.cells[i, 15] := 'HABER MOV';
   sheet.cells[i, 16] := 'DEBE 2DIG';
   sheet.cells[i, 17] := 'HABER 2DIG';
   sheet.cells[i, 18] := 'DEBE MOV';
   sheet.cells[i, 19] := 'HABER MOV';

   For c := 1 To 19 Do
   Begin
      if (c<=5) or (c=8) or (c=9) or (c=12) or (c=13) or (c=16) or (c=17) then
         sheet.cells[i, c].Interior.Color := clMoneyGreen
      else
         sheet.cells[i, c].Interior.Color := clGray;
   End;


   inc(i);

   iIni := i + 1;
   DMCNT.cdsReporte.First;
   While Not DMCNT.cdsReporte.Eof Do
   Begin
      inc(i);
      sheet.cells[i, 1] := '"' + DMCNT.cdsReporte.FieldbyName('CUENTAID').AsString;
      sheet.cells[i, 2] := DMCNT.cdsReporte.FieldbyName('CTADES').AsString;
      sheet.cells[i, 3] := DMCNT.cdsReporte.FieldbyName('CTA_DET').AsString;

      If DMCNT.cdsReporte.FieldbyName('SAL_INI_2_DEBE').AsFloat <> 0 Then
         sheet.cells[i, 4] := DMCNT.cdsReporte.FieldbyName('SAL_INI_2_DEBE').AsFloat;
      If DMCNT.cdsReporte.FieldbyName('SAL_INI_2_HABER').AsFloat <> 0 Then
         sheet.cells[i, 5] := DMCNT.cdsReporte.FieldbyName('SAL_INI_2_HABER').AsFloat;
      If DMCNT.cdsReporte.FieldbyName('SAL_INI_MOV_DEBE').AsFloat <> 0 Then
         sheet.cells[i, 6] := DMCNT.cdsReporte.FieldbyName('SAL_INI_MOV_DEBE').AsFloat;
      If DMCNT.cdsReporte.FieldbyName('SAL_INI_MOV_HABER').AsFloat <> 0 Then
         sheet.cells[i, 7] := DMCNT.cdsReporte.FieldbyName('SAL_INI_MOV_HABER').AsFloat;

      If DMCNT.cdsReporte.FieldbyName('DEBEMN_2_DIG').AsFloat <> 0 Then
         sheet.cells[i, 8] := DMCNT.cdsReporte.FieldbyName('DEBEMN_2_DIG').AsFloat;
      If DMCNT.cdsReporte.FieldbyName('HABERMN_2_DIG').AsFloat <> 0 Then
         sheet.cells[i, 9] := DMCNT.cdsReporte.FieldbyName('HABERMN_2_DIG').AsFloat;
      If DMCNT.cdsReporte.FieldbyName('DEBEMN_MOV').AsFloat <> 0 Then
         sheet.cells[i, 10] := DMCNT.cdsReporte.FieldbyName('DEBEMN_MOV').AsFloat;
      If DMCNT.cdsReporte.FieldbyName('HABERMN_MOV').AsFloat <> 0 Then
         sheet.cells[i, 11] := DMCNT.cdsReporte.FieldbyName('HABERMN_MOV').AsFloat;

      If DMCNT.cdsReporte.FieldbyName('SAL_ACU_2_DEBE').AsFloat <> 0 Then
         sheet.cells[i, 12] := DMCNT.cdsReporte.FieldbyName('SAL_ACU_2_DEBE').AsFloat;
      If DMCNT.cdsReporte.FieldbyName('SAL_ACU_2_HABER').AsFloat <> 0 Then
         sheet.cells[i, 13] := DMCNT.cdsReporte.FieldbyName('SAL_ACU_2_HABER').AsFloat;
      If DMCNT.cdsReporte.FieldbyName('SAL_ACU_MOV_DEBE').AsFloat <> 0 Then
         sheet.cells[i, 14] := DMCNT.cdsReporte.FieldbyName('SAL_ACU_MOV_DEBE').AsFloat;
      If DMCNT.cdsReporte.FieldbyName('SAL_ACU_MOV_HABER').AsFloat <> 0 Then
         sheet.cells[i, 15] := DMCNT.cdsReporte.FieldbyName('SAL_ACU_MOV_HABER').AsFloat;

      If DMCNT.cdsReporte.FieldbyName('SAL_FIN_2_DEBE').AsFloat <> 0 Then
         sheet.cells[i, 16] := DMCNT.cdsReporte.FieldbyName('SAL_FIN_2_DEBE').AsFloat;
      If DMCNT.cdsReporte.FieldbyName('SAL_FIN_2_HABER').AsFloat <> 0 Then
         sheet.cells[i, 17] := DMCNT.cdsReporte.FieldbyName('SAL_FIN_2_HABER').AsFloat;
      If DMCNT.cdsReporte.FieldbyName('SAL_FIN_MOV_DEBE').AsFloat <> 0 Then
         sheet.cells[i, 18] := DMCNT.cdsReporte.FieldbyName('SAL_FIN_MOV_DEBE').AsFloat;
      If DMCNT.cdsReporte.FieldbyName('SAL_FIN_MOV_HABER').AsFloat <> 0 Then
         sheet.cells[i, 19] := DMCNT.cdsReporte.FieldbyName('SAL_FIN_MOV_HABER').AsFloat;

   // Totales x Columna
      xnSINI_DEBE_2 := xnSINI_DEBE_2 + DMCNT.cdsReporte.FieldbyName('SAL_INI_2_DEBE').AsFloat;
      xnSINI_HABE_2 := xnSINI_HABE_2 + DMCNT.cdsReporte.FieldbyName('SAL_INI_2_HABER').AsFloat;
      xnSINI_DEBE_M := xnSINI_DEBE_M + DMCNT.cdsReporte.FieldbyName('SAL_INI_MOV_DEBE').AsFloat;
      xnSINI_HABE_M := xnSINI_HABE_M + DMCNT.cdsReporte.FieldbyName('SAL_INI_MOV_HABER').AsFloat;

      xnDEBE_2      := xnDEBE_2 + DMCNT.cdsReporte.FieldbyName('DEBEMN_2_DIG').AsFloat;
      xnHABE_2      := xnHABE_2 + DMCNT.cdsReporte.FieldbyName('HABERMN_2_DIG').AsFloat;
      xnDEBE_M      := xnDEBE_M + DMCNT.cdsReporte.FieldbyName('DEBEMN_MOV').AsFloat;
      xnHABE_M      := xnHABE_M + DMCNT.cdsReporte.FieldbyName('HABERMN_MOV').AsFloat;

      xnSACU_DEBE_2 := xnSACU_DEBE_2 + DMCNT.cdsReporte.FieldbyName('SAL_ACU_2_DEBE').AsFloat;
      xnSACU_HABE_2 := xnSACU_HABE_2 + DMCNT.cdsReporte.FieldbyName('SAL_ACU_2_HABER').AsFloat;
      xnSACU_DEBE_M := xnSACU_DEBE_M + DMCNT.cdsReporte.FieldbyName('SAL_ACU_MOV_DEBE').AsFloat;
      xnSACU_HABE_M := xnSACU_HABE_M + DMCNT.cdsReporte.FieldbyName('SAL_ACU_MOV_HABER').AsFloat;

      xnSFIN_DEBE_2 := xnSFIN_DEBE_2 + DMCNT.cdsReporte.FieldbyName('SAL_FIN_2_DEBE').AsFloat;
      xnSFIN_HABE_2 := xnSFIN_HABE_2 + DMCNT.cdsReporte.FieldbyName('SAL_FIN_2_HABER').AsFloat;
      xnSFIN_DEBE_M := xnSFIN_DEBE_M + DMCNT.cdsReporte.FieldbyName('SAL_FIN_MOV_DEBE').AsFloat;
      xnSFIN_HABE_M := xnSFIN_HABE_M + DMCNT.cdsReporte.FieldbyName('SAL_FIN_MOV_HABER').AsFloat;

      DMCNT.cdsReporte.Next;
   End;

  // En Blanco
   inc(i);
  // Totales
   inc(i);
   sheet.cells[i, 1]  := '';
   sheet.cells[i, 2]  := 'TOTALES';
   sheet.cells[i, 3]  := '';
   sheet.cells[i, 4]  := xnSINI_DEBE_2;
   sheet.cells[i, 5]  := xnSINI_HABE_2; 
   sheet.cells[i, 6]  := xnSINI_DEBE_M; 
   sheet.cells[i, 7]  := xnSINI_HABE_M; 
   sheet.cells[i, 8]  := xnDEBE_2;
   sheet.cells[i, 9]  := xnHABE_2;
   sheet.cells[i, 10] := xnDEBE_M;
   sheet.cells[i, 11] := xnHABE_M;
   sheet.cells[i, 12] := xnSACU_DEBE_2;
   sheet.cells[i, 13] := xnSACU_HABE_2;
   sheet.cells[i, 14] := xnSACU_DEBE_M;
   sheet.cells[i, 15] := xnSACU_HABE_M;
   sheet.cells[i, 16] := xnSFIN_DEBE_2;
   sheet.cells[i, 17] := xnSFIN_HABE_2;
   sheet.cells[i, 18] := xnSFIN_DEBE_M;
   sheet.cells[i, 19] := xnSFIN_HABE_M;

//
   iFin := i;
   sIni := Inttostr(iIni);
   sFin := Inttostr(iFin);
   sheet.Range['D' + sIni + ':' + 'D' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['E' + sIni + ':' + 'E' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['F' + sIni + ':' + 'F' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['G' + sIni + ':' + 'G' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['H' + sIni + ':' + 'H' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['I' + sIni + ':' + 'I' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['J' + sIni + ':' + 'J' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['K' + sIni + ':' + 'K' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['L' + sIni + ':' + 'L' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['M' + sIni + ':' + 'M' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['N' + sIni + ':' + 'N' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['O' + sIni + ':' + 'O' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['P' + sIni + ':' + 'P' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['Q' + sIni + ':' + 'Q' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['R' + sIni + ':' + 'R' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['S' + sIni + ':' + 'S' + sFin].NumberFormat := '###,###,##0.00';
   sheet.Range['T' + sIni + ':' + 'T' + sFin].NumberFormat := '###,###,##0.00';

   sheet.Range['A5:T5'].Font.Bold := True;
   sheet.Range['A6:T6'].Font.Bold := True;
end;
// Fin HPC_201602_CNT

procedure TFBalGeneral.bbtnExcel3Click(Sender: TObject);
Var
   xWhere2, xMes, wMesAnt, sSQL1, sSQL2, sSQL3, sSQL4, sSQL5, sSQL6: String;
   xSQL: AnsiString;
   CampoH, CampoS, CampoD: String;
   sSaldoD, sSaldoH, sISaldoD, sISaldoH, sESaldoD, sESaldoH: String;
   sMon, sWhere, sDebe, sDebeAnt, sHabe, sHabeAnt, sHaving: String;
   i, x10: integer;
   xAM, cEstadoRep, xCierre: String;
Begin
   If edtCia.Text = '' Then
   Begin
      showmessage('Compañía no válida');
      Raise exception.Create('Compañía no válida');
   End;

   If dblcNivel.Text = '' Then
   Begin
      ShowMessage('Seleccione un Nivel de Detalle de Cuenta');
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   xAM := speAno.Text;
   xMes := speMM.Text;

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;

   xSql := 'SELECT * FROM TGE154 WHERE CIAID=' + quotedstr(dblcCia.text) + ' and ANO=' + quotedstr(speAno.Text);
   DMCNT.cdsCierres.close;
   DMCNT.cdsCierres.datarequest(xsql);
   DMCNT.cdsCierres.open;
   If DMCNT.cdsCierres.FieldByName('PER' + xMes).AsString = 'S' Then
   Begin
      GeneraSQLVerifica;

      If DMCNT.cdsConsistencia.RecordCount > 0 Then
      Begin
         Screen.Cursor := crDefault;
         ShowMessage('Error : Existen Inconsistencias, Emitir Reporte');
         Exit;
      End;
   End;

   DMCNT.cdsQry.Filtered := false;
   DMCNT.cdsQry.Filter := '';

   GeneraSQLRegIni;

   cEstadoRep := ' ';
   If DMCNT.cdsConsistencia.RecordCount > 0 Then
      cEstadoRep := 'BALANCE PRELIMINAR : EXISTEN REGISTROS EN ESTADO INICIAL, VERIFICAR';

   Screen.Cursor := crHourGlass;
   xnivel := '';
   xsql := '';
// ACUMULADO DEL DEBE Y HABER
   If rgMoneda.ItemIndex = 1 Then // CUANDO ES MONDEDA EXTRANJERA
   Begin
      sMon := 'ME';
      sWhere := 'TMON_LOC=''E''';
   End
   Else
   Begin
      sMon := 'MN';
      sWhere := 'TMON_LOC=''L''';
   End;

// ACUMULADO INCLUYENDO EL MES ACTUAL
   For i := 0 To StrToInt(speMM.text) Do
   Begin
      sDebe := sDebe + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      sHabe := sHabe + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
   End;
   //QUITAR EL ULTIMO + DE LA CADENA
   sDebe := Copy(sDebe, 1, Length(sDebe) - 1);
   sHabe := Copy(sHabe, 1, Length(sHabe) - 1);

  // SALDOS ANTERIORES
   For i := 0 To StrToInt(speMM.text) - 1 Do
   Begin
      sDebeAnt := sDebeAnt + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      sHabeAnt := sHabeAnt + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
   End;

   If StrToInt(speMM.text) - 1 > 0 Then
      If StrToInt(speMM.text) = 1 Then
      Begin
         sDebeAnt := sDebeAnt + wReplacCeros + '(DEBE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
         sHabeAnt := sHabeAnt + wReplacCeros + '(HABE' + sMon + DMCNT.StrZero(IntToStr(i), 2) + ',0)+';
      End;

   If Length(sDebeAnt) = 0 Then
   Begin
      sDebeAnt := sDebeAnt + ' 0.00+';
      sHabeAnt := sHabeAnt + ' 0.00+';
   End;

   //QUITAR EL ULTIMO + DE LA CADENA
   sDebeAnt := Copy(sDebeAnt, 1, Length(sDebeAnt) - 1);
   sHabeant := Copy(sHabeAnt, 1, Length(sHabeAnt) - 1);
   sDebeAnt := sDebeAnt + ' ADEBEANT, ';
   sHabeAnt := sHabeAnt + ' AHABEANT, ';
   {
      sSaldoD := ' DECODE(LEAST( (' + sDebe + ' - (' + sHabe + ')),0),0,' + sDebe + ' - (' + sHabe + '), 0 ) ASALDOD, ';
      sSaldoh := ' DECODE(LEAST( (' + sHabe + ' - (' + sDebe + ')),0),0,' + sHabe + ' - (' + sDebe + '), 0 ) ASALDOH, ';

      sISaldoD := ' DECODE(LEAST((' + sDebe + ' - (' + sHabe + ')),0),0,DECODE(TGE202.CTA_TIPO,''A'',' + sDebe + ' - (' + sHabe + ')),0,0) ISALDOD, ';
      sISaldoH := ' DECODE(LEAST((' + sHabe + ' - (' + sDebe + ')),0),0,DECODE(TGE202.CTA_TIPO,''A'',' + sHabe + ' - (' + sDebe + ')),0,0) ISALDOH, ';

      sESaldoD := ' DECODE(LEAST((' + sDebe + ' - (' + sHabe + ')),0),0,DECODE(TGE202.CTA_TIPO,''R'',' + sDebe + ' - (' + sHabe + '),''R'',' + sDebe + ' - (' + sHabe + '),0),0) ESALDOD, ';
      sESaldoH := ' DECODE(LEAST((' + sHabe + ' - (' + sDebe + ')),0),0,DECODE(TGE202.CTA_TIPO,''R'',' + sHabe + ' - (' + sDebe + '),''R'',' + sHabe + ' - (' + sDebe + '),0),0) ESALDOH, ';

      sDebe := sDebe + ' ADEBE, ';
      sHabe := sHabe + ' AHABE, ';
   }
   sSaldoD := 'case when (' + sDebe + ' - (' + sHabe + '))<= 0 '
      + '           then 0 '
      + '           else (' + sDebe + ' - (' + sHabe + ')) '
      + '       end ASALDOD, ';

   sSaldoH := 'case when (' + sHabe + ' - (' + sDebe + '))<= 0 '
      + '           then 0 '
      + '           else (' + sHabe + ' - (' + sDebe + ')) '
      + '       end ASALDOH, ';

   sISaldoD := 'case when (' + sDebe + ' - (' + sHabe + '))<= 0 '
      + '            then 0 '
      + '            else case when TGE202.CTA_TIPO=''A'' '
      + '                      then (' + sDebe + ' - (' + sHabe + ')) '
      + '                      else 0 '
      + '                  end '
      + '        end ISALDOD, ';

   sISaldoH := 'case when (' + sHabe + ' - (' + sDebe + '))<= 0 '
      + '            then 0 '
      + '             else case when TGE202.CTA_TIPO=''A'' '
      + '                       then (' + sHabe + ' - (' + sDebe + ')) '
      + '                       else 0 '
      + '                   end '
      + '        end ISALDOH, ';

   sESaldoD := 'case when (' + sDebe + ' - (' + sHabe + '))<= 0 '
      + '            then 0 '
      + '            else case when TGE202.CTA_TIPO=''R'' '
      + '                      then (' + sDebe + ' - (' + sHabe + ')) '
      + '                      else 0 '
      + '                  end '
      + '        end ESALDOD, ';

   sESaldoH := 'case when (' + sHabe + ' - (' + sDebe + '))<= 0 '
      + '            then 0 '
      + '             else case when TGE202.CTA_TIPO=''R'' '
      + '                       then (' + sHabe + ' - (' + sDebe + ')) '
      + '                       else 0 '
      + '                   end '
      + '        end ESALDOH, ';

   sDebe := sDebe + ' ADEBE, ';
   sHabe := sHabe + ' AHABE, ';

   xnivel := '';
   xsql := '';

   xsql := 'NIVEL=' + quotedstr(IntToStr(StrToInt(dblcNivel.text) + 1));

   If DMCNT.DisplayDescrip('PrvTGE', 'CNT202', '*', xsql, 'NIVEL') = '' Then
      xnivel := '0'
   Else
      xnivel := '1';

   xWhere := 'CNT401.CIAID=' + '''' + dblcCia.Text + ''''
           + ' AND CNT401.ANO=' + '''' + speAno.Text + ''''
           + ' AND CNT401.TIPO<=' + '''' + dblcNivel.Text + ''''
           + ' AND (CNT401.AUXID IS NULL OR CNT401.AUXID='''') '
           + ' AND (CNT401.CCOSID IS NULL OR CNT401.CCOSID='''')'
           + ' AND LENGTH(CNT401.CUENTAID) <> 1';

   If sCiaCuenta <> '' Then
   Begin
      xWhere := xWhere + ' and CNT401.' + sCiaCuenta;
   End;

   xMes := speMM.Text;

   If (StrToInt(xmes) - 1) <= 9 Then
      wMesAnt := '0' + inttostr((StrToInt(xmes) - 1));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   CampoS := ' SALD' + sMon + wMesAnt; // wmes
   CampoD := ' DEBE' + sMon + xMes;
   CampoH := ' HABE' + sMon + xMes;

   xSQL  := 'Select CNT401.CUENTAID, CNT401.CTADES, ';
   sSQL1 :=         sDebeAnt + sHabeant + CampoD + ' DEBE,' + CampoH + ' HABE, ';
   sSQL2 :=         sDebe + sHabe + sSaldoD + sSaldoH;
   sSQL3 :=         sISaldoD + sISaldoH;
   sSQL6 :=         sESaldoD + sESaldoH;
   sSQL4 := '       TGE202.CTA_DET, CNT401.TIPO, ''' + cEstadoRep + ''' ESTADO '
      + '      from CNT401, TGE202'
      + '     where (CNT401.CUENTAID = TGE202.CUENTAID(+)) AND (CNT401.CIAID = TGE202.CIAID(+)) AND ';
   sSQL5 := ' order by CNT401.CUENTAID';

   xSQL := xSQL + sSQL1 + sSQL2 + sSQL3 + sSQL6 + sSQL4 + xWhere + sSQL5;

   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.ProviderName := 'prvCNT';
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   DMCNT.cdsQry.Filter := ' ADEBE <>0.00 or AHABE <>0.00 ';
   DMCNT.cdsQry.Filtered := True;
   If DMCNT.cdsQry.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas');
      DMCNT.cdsQry.Filter := '';
      DMCNT.cdsQry.Filtered := True;
   End;
   DMCNT.cdsQry.First;
   Screen.Cursor := crDefault;
   If rgMoneda.ItemIndex = -1 Then
   Begin
      ShowMessage('Ingrese Tipo de Moneda');
      rgMoneda.SetFocus;
      Exit;
   End;

   DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Balance Comprobacion General',
      dblcCia.Text, // Campañía
      speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
      dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
      dblcNivel.Text, '', // Nivel   - Origen
      '', inttostr(rgMoneda.itemindex), // Lote    -  Moneda
      '', '', // Cuentas - Auxiliares
      '', 'Excel', // Costos - Tipo Salida
      ''); // Tipo Rep

   ExportarExcel;

   DMCNT.cdsQry.CancelUpdates;
   DMCNT.cdsQry.IndexFieldNames := '';
   DMCNT.cdsQry.Filter := '';
   DMCNT.cdsQry.Filtered := True;
  
end;

End.


