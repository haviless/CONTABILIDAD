// Actualizaciones
// HPC_201410_CNT
// HPC_201601_CNT 18/01/2016: Se define la variable wTMonLocDes para descripción de la Moneda Local
//                            Se define la variable wTMonExtDes para descripción de la Moneda Extranjera



Unit CNT313;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ExtCtrls, wwdbdatetimepicker, wwdblook, Buttons, Wwdbdlg, oaVariables,
   Grids, Wwdbigrd, Wwdbgrid, ppCtrls, ppPrnabl, ppClass, ppBands, ppProd,
   ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppVar, ppviewr, ppModule,
   daDatMod, Db, DBClient, wwclient, Wwdatsrc, Spin, ppEndUsr, ppTypes,
   wwExport, shellapi,
   ppParameter, StrContainer, ComCtrls;

Type
   TFCtroCosto = Class(TForm)
      pnlMayorAn: TPanel;
      lblCia: TLabel;
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      rgMoneda: TRadioGroup;
      gbParametros: TGroupBox;
      edtTit: TEdit;
      ckTDiario: TCheckBox;
      dblcTDiario: TwwDBLookupCombo;
      edtTDiario: TEdit;
      rgCuenta: TRadioGroup;
      rgCCosto: TRadioGroup;
      rgOrdenListado: TRadioGroup;
      Label1: TLabel;
      Z2bbtnSelCuenta: TBitBtn;
      Z2bbtnSelCCosto: TBitBtn;
      cds1: TwwClientDataSet;
      ds1: TwwDataSource;
      ppDBPipeline1: TppDBPipeline;
      ppField1: TppField;
      ppField2: TppField;
      ppField3: TppField;
      ppField4: TppField;
      ppField5: TppField;
      ppField6: TppField;
      ppField7: TppField;
      ppField8: TppField;
      ppField9: TppField;
      ppField10: TppField;
      ppField11: TppField;
      ppField12: TppField;
      ppField13: TppField;
      ppField14: TppField;
      ppField15: TppField;
      ppField16: TppField;
      ppField17: TppField;
      ppField18: TppField;
      ppField19: TppField;
      ppField20: TppField;
      ppField21: TppField;
      ppField22: TppField;
      ppField23: TppField;
      ppField24: TppField;
      ppField25: TppField;
      ppField26: TppField;
      ppField27: TppField;
      ppField28: TppField;
      ppField29: TppField;
      ppField30: TppField;
      ppField31: TppField;
      ppField32: TppField;
      ppField33: TppField;
      ppField34: TppField;
      ppField35: TppField;
      ppField36: TppField;
      ppField37: TppField;
      ppField38: TppField;
      ppField39: TppField;
      ppField40: TppField;
      ppField41: TppField;
      ppField42: TppField;
      ppField43: TppField;
      ppField44: TppField;
      ppField45: TppField;
      ppField46: TppField;
      ppField47: TppField;
      ppField48: TppField;
      ppField49: TppField;
      ppField50: TppField;
      ppField51: TppField;
      ppField52: TppField;
      ppField53: TppField;
      ppField54: TppField;
      ppField55: TppField;
      ppField56: TppField;
      ppField57: TppField;
      ppField58: TppField;
      ppReport1: TppReport;
      ppReport2: TppReport;
      ppDBPipeline2: TppDBPipeline;
      ppField59: TppField;
      ppField60: TppField;
      ppField61: TppField;
      ppField62: TppField;
      ppField63: TppField;
      ppField64: TppField;
      ppField65: TppField;
      ppField66: TppField;
      ppField67: TppField;
      ppField68: TppField;
      ppField69: TppField;
      ppField70: TppField;
      ppField71: TppField;
      ppField72: TppField;
      ppField73: TppField;
      ppField74: TppField;
      ppField75: TppField;
      ppField76: TppField;
      ppField77: TppField;
      ppField78: TppField;
      ppField79: TppField;
      ppField80: TppField;
      ppField81: TppField;
      ppField82: TppField;
      ppField83: TppField;
      ppField84: TppField;
      ppField85: TppField;
      ppField86: TppField;
      ppField87: TppField;
      ppField88: TppField;
      ppField89: TppField;
      ppField90: TppField;
      ppField91: TppField;
      ppField92: TppField;
      ppField93: TppField;
      ppField94: TppField;
      ppField95: TppField;
      ppField96: TppField;
      ppField97: TppField;
      ppField98: TppField;
      ppField99: TppField;
      ppField100: TppField;
      ppField101: TppField;
      ppField102: TppField;
      ppField103: TppField;
      ppField104: TppField;
      ppField105: TppField;
      ppField106: TppField;
      ppField107: TppField;
      ppField108: TppField;
      ppField109: TppField;
      ppField110: TppField;
      ppField111: TppField;
      ppField112: TppField;
      ppField113: TppField;
      ppField114: TppField;
      ppField115: TppField;
      ppField116: TppField;
      ppField117: TppField;
      ppField118: TppField;
      gbPer: TGroupBox;
      speAno: TSpinEdit;
      speMM: TSpinEdit;
      Label2: TLabel;
      dbdtpFReg1: TwwDBDateTimePicker;
      dbdtpFReg2: TwwDBDateTimePicker;
      ppHeaderBand1: TppHeaderBand;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppLabel22: TppLabel;
      ppSystemVariable5: TppSystemVariable;
      ppLabel27: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppLabel28: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppVariable2: TppVariable;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppVariable4: TppVariable;
      ppSummaryBand1: TppSummaryBand;
      ppLabel36: TppLabel;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppDBText11: TppDBText;
      ppDBText20: TppDBText;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppLabel37: TppLabel;
      ppDBCalc19: TppDBCalc;
      ppDBCalc20: TppDBCalc;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppDBCalc21: TppDBCalc;
      ppDBCalc22: TppDBCalc;
      ppLabel38: TppLabel;
      ppDBCalc23: TppDBCalc;
      ppDBCalc24: TppDBCalc;
      rgTipoListado: TRadioGroup;
      ppReport3: TppReport;
      ppHeaderBand3: TppHeaderBand;
      ppLabel30: TppLabel;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
      ppLabel45: TppLabel;
      ppSystemVariable7: TppSystemVariable;
      ppLabel46: TppLabel;
      ppSystemVariable8: TppSystemVariable;
      ppLabel47: TppLabel;
      ppSystemVariable9: TppSystemVariable;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      pplblmonedag: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLabel52: TppLabel;
      ppGroup5: TppGroup;
      ppGroupHeaderBand5: TppGroupHeaderBand;
      ppGroupFooterBand5: TppGroupFooterBand;
      ppDBText22: TppDBText;
      ppDBText25: TppDBText;
      ppDBText27: TppDBText;
      ppDBText26: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppLabel50: TppLabel;
      ppDBCalc13: TppDBCalc;
      ppDBPipeline3: TppDBPipeline;
      cds2: TwwClientDataSet;
      ds2: TwwDataSource;
      ppLabel31: TppLabel;
      pplblmes: TppLabel;
      ppDBCalc14: TppDBCalc;
      ppVariable6: TppVariable;
      ppReport4: TppReport;
      ppDBPipeline4: TppDBPipeline;
      ppHeaderBand4: TppHeaderBand;
      ppLabel32: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel51: TppLabel;
      ppLabel53: TppLabel;
      ppLabel54: TppLabel;
      ppLabel55: TppLabel;
      ppLabel56: TppLabel;
      ppLabel57: TppLabel;
      ppLabel58: TppLabel;
      ppLabel59: TppLabel;
      ppSystemVariable10: TppSystemVariable;
      ppLabel60: TppLabel;
      ppSystemVariable11: TppSystemVariable;
      ppLabel61: TppLabel;
      ppSystemVariable12: TppSystemVariable;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppLabel64: TppLabel;
      pplblciaextg: TppLabel;
      ppDetailBand4: TppDetailBand;
      ppDBText30: TppDBText;
      ppDBText33: TppDBText;
      ppDBText34: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppDBText37: TppDBText;
      ppVariable7: TppVariable;
      ppVariable8: TppVariable;
      ppFooterBand2: TppFooterBand;
      ppGroup6: TppGroup;
      ppGroupHeaderBand6: TppGroupHeaderBand;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
      ppGroupFooterBand6: TppGroupFooterBand;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppDBCalc17: TppDBCalc;
      ppDBCalc18: TppDBCalc;
      ppLabel65: TppLabel;
      gbNivel: TGroupBox;
      Label3: TLabel;
      dblcNivel: TwwDBLookupCombo;
      GroupBox1: TGroupBox;
      speAnoF: TSpinEdit;
      speMMF: TSpinEdit;
      pprCCostoNiv: TppReport;
      ppdbCCostoNiv: TppDBPipeline;
      ppd1: TppDesigner;
      ppHeaderBand5: TppHeaderBand;
      ppDBText38: TppDBText;
      ppDBText39: TppDBText;
      ppDBText40: TppDBText;
      ppLabel66: TppLabel;
      ppSystemVariable13: TppSystemVariable;
      ppSystemVariable14: TppSystemVariable;
      ppSystemVariable15: TppSystemVariable;
      ppLabel67: TppLabel;
      ppLabel68: TppLabel;
      ppLabel69: TppLabel;
      ppDetailBand5: TppDetailBand;
      ppDBText41: TppDBText;
      ppDBText42: TppDBText;
      ppDBText43: TppDBText;
      ppDBText44: TppDBText;
      ppSummaryBand3: TppSummaryBand;
      ppDBCalc25: TppDBCalc;
      ppDBCalc26: TppDBCalc;
      ppLabel70: TppLabel;
      ppGroup7: TppGroup;
      ppGroupHeaderBand7: TppGroupHeaderBand;
      ppDBText45: TppDBText;
      ppDBText46: TppDBText;
      ppLabel71: TppLabel;
      ppGroupFooterBand7: TppGroupFooterBand;
      ppDBCalc27: TppDBCalc;
      ppDBCalc28: TppDBCalc;
      ppLabel72: TppLabel;
      Panel1: TPanel;
      BitBtn1: TBitBtn;
      scFile: TStrContainer;
      sdGraba: TSaveDialog;
      pbExp: TProgressBar;
      dbgExcel: TwwDBGrid;
      btnExportarExcel: TBitBtn;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
      ppParameterList1: TppParameterList;
      ppHeaderBand2: TppHeaderBand;
      pplTitulo1: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppDEBE: TppLabel;
      ppHABER: TppLabel;
      pplblCia: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel26: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel25: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel2: TppLabel;
      ppLabel29: TppLabel;
      ppLabel73: TppLabel;
      ppLabel21: TppLabel;
      pplbMoneda: TppLabel;
      ppDBText47: TppDBText;
      ppDBText48: TppDBText;
      ppDetailBand2: TppDetailBand;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText21: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppLabel74: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText49: TppDBText;
      ppGroupFooterBand3: TppGroupFooterBand;

      Procedure bbtnCancClick(Sender: TObject);
      Procedure IniciaCampos;
      Procedure bbtnOkClick(Sender: TObject);

      Procedure dblcCiaExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure ckTDiarioClick(Sender: TObject);
      Procedure dblcTDiarioExit(Sender: TObject);
      Procedure rgCuentaClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure rgCCostoClick(Sender: TObject);
      Procedure Z2bbtnSelCuentaClick(Sender: TObject);
      Procedure Z2bbtnSelCCostoClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure ppVariable1Calc2(Sender: TObject; Var Value: Variant);
      Procedure ppVariable2Calc2(Sender: TObject; Var Value: Variant);
      Procedure ppVariable3Calc(Sender: TObject; Var Value: Variant);
      Procedure dbdtpFReg1Exit2(Sender: TObject);
      Procedure dbdtpFReg2Exit2(Sender: TObject);
      Procedure gbPerExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure ppReport1PreviewFormCreate(Sender: TObject);
      Procedure ppReport2PreviewFormCreate(Sender: TObject);
      Procedure ppHeaderBand2BeforePrint(Sender: TObject);
      Procedure ppHeaderBand3BeforePrint(Sender: TObject);
      Procedure ppReport3PreviewFormCreate(Sender: TObject);
      Procedure ppVariable6Calc(Sender: TObject; Var Value: Variant);
      Procedure ppVariable7Calc(Sender: TObject; Var Value: Variant);
      Procedure ppVariable8Calc(Sender: TObject; Var Value: Variant);
      Procedure dblcNivelExit(Sender: TObject);
      Procedure rgTipoListadoClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure btnExportarExcelClick(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
   Private
    { Private declarations }
      x10: Integer;
      xNivel: Integer;
      xAAAAMM: String;
      fTexto: String;
      xbExportarExcel: Boolean;
      Procedure Valida;
      Procedure InsertarSaldos;
      Procedure GeneraTexto;
      Function RetornaDatos(cCampo: String): String;
      Procedure fg_GeneraExcel;
   Public
    { Public declarations }
      sCiaOrigen: String;
      sCiaCuenta: String;
   End;

Var
   FCtroCosto: TFCtroCosto;
   xFechas: String;

Implementation

Uses CNTDM, CNT412, CNT413, CNT998, oaCN3000;

{$R *.DFM}

Procedure TFCtroCosto.IniciaCampos;
Var
   xAno, xMes, xDia: word;
Begin
   dblcCia.Text := '';
   rgCuenta.ItemIndex := 0;
   rgTipoListado.ItemIndex := 0;
   rgCCosto.ItemIndex := 0;
   DecodeDate(Date, xAno, xMes, xDia);
   speAno.Value := xAno;
   speMM.Value := xMes;
   gbPerExit(Self);
   dblcCia.SetFocus;
End;

Procedure TFCtroCosto.bbtnCancClick(Sender: TObject);
Begin
   IniciaCampos;
   dblcCia.SetFocus;
End;

Procedure TFCtroCosto.bbtnOkClick(Sender: TObject);
Var
   xSQL, xSQL2, xMesAnt, xMesFin, xAno, xAnoI, xAnoF: String;
   xWhere, xMes, xCCostoT: String;
   xWhere1: String;
   Year, Month, Day: Word;
   Year2, Month2, Day2: Word;
   sCtaLog, sCosLog: String;
   xFecha0 : String; // HPC_201411_CNT
Begin
   Valida;
   sCtaLog := '';
   sCosLog := '';
   If rgCuenta.ItemIndex = 1 Then
   Begin
      xWhere := 'CNT301.CUENTAID IN (';
      xWhere1 := 'CNT301.CUENTAID IN (';
      sCtaLog := 'CUENTAID IN (';
      With FConsulta.FSelCuenta3.cdsClone Do
      Begin
         First;
         While Not Eof Do
         Begin
            xWhere := xWhere + '''' + fieldbyname('CUENTAID').AsString + '''';
            xWhere1 := xWhere1 + '''' + fieldbyname('CUENTAID').AsString + '''';
            sCtaLog := sCtaLog + fieldbyname('CUENTAID').AsString;
            Next;
            If Not eof Then
            Begin
               xWhere := xWhere + ' , ';
               xWhere1 := xWhere1 + ' , ';
               sCtaLog := sCtaLog + ', '
            End;
         End;
      End;
      xwhere := xwhere + ')';
      xwhere1 := xwhere1 + ')';
      sCtaLog := sCtaLog + ' )';
   End;

   If Trim(xwhere) <> '' Then
   Begin
      xWhere := xWhere + ' AND ';
   End;

   If Trim(xwhere1) <> '' Then
      xWhere1 := ' and ' + xWhere1;

   xWhere := xWhere + '(CNT301.CCOSID IS NOT NULL) ';
   //xWhere1 := xWhere1 + '(CNT401.CCOSID IS NOT NULL) ';

   xCCostoT := '';
   If rgCCosto.ItemIndex = 1 Then
   Begin
      If Trim(xwhere) <> '' Then
      Begin
         xWhere := xWhere + ' AND ';
         xWhere1 := xWhere1 + ' AND ';
      End;

      xWhere := xWhere + 'CNT301.CCOSID IN (';
      xWhere1 := xWhere1 + 'CNT301.CCOSID IN (';
      xCCostoT := xCCostoT + 'A.CCOSID IN (';
      sCosLog := 'CCOSID IN ( ';
      With FSelCCosto.cdsClone Do
      Begin
         First;
         While Not Eof Do
         Begin
            xWhere := xWhere + '''' + fieldbyname('CCOSID').AsString + '''';
            xWhere1 := xWhere1 + '''' + fieldbyname('CCOSID').AsString + '''';
            xCCostoT := xCCostoT + '''' + fieldbyname('CCOSID').AsString + '''';
            sCosLog := sCosLog + fieldbyname('CCOSID').AsString;
            Next;
            If Not eof Then
            Begin
               xWhere := xWhere + ' , ';
               xWhere1 := xWhere1 + ' , ';
               xCCostoT := xCCostoT + ' , ';
               sCosLog := sCosLog + ', ';
            End
         End;
      End;
      xwhere := xwhere + ' ) ';
      xwhere1 := xwhere1 + ' ) ';
      xCCostoT := ' AND ' + xCCostoT + ' ) ';
      sCosLog := sCosLog + ' )';
   End;

   If ckTDiario.Checked Then
   Begin
      If Trim(xwhere) <> '' Then
      Begin
         xWhere := xWhere + ' AND ';
         xWhere1 := xWhere1 + ' AND ';
      End;
      xWhere1 := xWhere1 + '( CNT301.TDIARID(+) = ''' + dblcTDiario.Text + ''' )';
      xWhere := xWhere + '( CNT301.TDIARID = ''' + dblcTDiario.Text + ''' )';
   End;

   If Trim(xwhere) <> '' Then
   Begin
      xWhere := xWhere + ' AND ';
   //   xWhere1 := xWhere1 + ' AND ';
   End;
   //xWhere1 := xWhere1 + '( CNT301.CNTFCOMP(+) >= ''' + formatdatetime(wFormatFecha, dbdtpFReg1.Date)
   //   + ''' AND CNT301.CNTFCOMP(+) <= ''' + formatdatetime(wFormatFecha, dbdtpFReg2.Date) + ''' )';

   xWhere := xWhere + '( CNTFCOMP >= ''' + formatdatetime(wFormatFecha, dbdtpFReg1.Date)
      + ''' AND CNTFCOMP <= ''' + formatdatetime(wFormatFecha, dbdtpFReg2.Date) + ''' )';

   If sCiaOrigen <> '' Then
   Begin
      xWhere := xWhere + ' and CNT301.' + sCiaOrigen + ' ';
   End;
   If sCiaCuenta <> '' Then
   Begin
      xWhere := xWhere + ' and CNT301.' + sCiaCuenta;
   //   xWhere1 := xWhere1 + ' and CNT401.' + sCiaCuenta;
   End;

   Case rgMoneda.ItemIndex Of
      0: Begin
            xMes := IntToStr(strtoInt(speMM.text));

            DecodeDate(dbdtpFReg1.Date, Year, Month, Day);
            DecodeDate(dbdtpFReg2.Date, Year2, Month2, Day2);

            xMesAnt := DMCNT.StrZero(inttostr(Month - 1), 2);

            xAnoI := DMCNT.StrZero(inttostr(Year), 4);
            xAnoF := DMCNT.StrZero(inttostr(Year2), 4);

            xMesFin := DMCNT.StrZero(inttostr(Month2), 2);

            xSQL := 'Select * from TGE181 WHERE MESID=''' + xMes + '''';
            DMCNT.cdsQry.Close;
            DMCNT.cdsQry.DataRequest(xSQL);
            DMCNT.cdsQry.Open;

            xAAAAMM := 'Periodo : ' + DMCNT.cdsQry.FieldByName('MESDESL').AsString + ' DE ' + speAno.Text;

            xSQL := 'SELECT CNT301.CUENTAID, CASE WHEN CNT301.CUENTAID IS NOT NULL THEN ''CUENTA:'' ELSE '''' END LBLCUENTA, '
               + 'TGE202.CTADES, CNT301.CCOSID, CNTCOMPROB, CNTGLOSA, '
               + 'CNT301.TDIARID, CNTFCOMP, CNTFEMIS, TGE203.CCOSDES CCOSABR, '
               + 'NVL(CNTDEBEMN,0) MONTODEBE, NVL(CNTHABEMN,0) MONTOHABER, '
               + '0.00 SALINI, 0.00 SALFIN, 0.00 CCINI, 0.00 CCFIN, '
               + '''Desde ' + DateToStr(dbdtpFReg1.Date)
               + ' Hasta ' + DateToStr(dbdtpFReg2.Date) + ''' RANGO, '
               + '''' + xAAAAMM + ''' PERIODO, ''01'' TIPO, ''01'' TCC '
               + 'FROM CNT301, TGE202, TGE203 '
               + 'WHERE CNT301.CIAID=' + QuotedStr(dblcCia.Text) + ' AND CNTESTADO=''P'' '
               + 'AND TGE202.CIAID(+)=CNT301.CIAID AND TGE202.CUENTAID(+)=CNT301.CUENTAID AND TGE202.CTA_CCOS=''S'' '
               + 'AND TGE203.CCOSID(+)=CNT301.CCOSID';

            xSQL2 := 'SELECT CNT401.CUENTAID, CNT401.CCOSID, '
               + 'sum(NVL(CNTDEBEMN,0)) MONTODEBE, sum(NVL(CNTHABEMN,0)) MONTOHABER, '
               + 'max(NVL(cnt401.saldmn' + xMesAnt + ',0)) SALINI, '
               + 'max(NVL(cnt401.saldmn' + xMesAnt + ',0)) + sum(NVL(CNTDEBEMN,0)) - sum(NVL(CNTHABEMN,0)) SALFIN, '
               + 'max(x.ccini) ccini, max(x.ccfin) ccfin, MAX(CCDEBE) CCDEBE, MAX(CCHABE) CCHABE '
               + 'FROM CNT301, TGE202, CNT401, '
               + '( select ccosid, sum(salini) CCINI, sum(salfin) CCFIN, SUM(CCDEBE) CCDEBE, SUM(CCHABE) CCHABE '
               + 'from ( SELECT CNT301.CUENTAID, CNT301.CCOSID, NVL(max(cnt401.saldmn' + xMesAnt + '),0) SALINI, '
               + 'NVL(max(cnt401.saldmn' + xMesAnt + '),0)+sum( NVL(CNTDEBEMN,0) )-sum( NVL(CNTHABEMN,0) ) SALFIN,  '
               + 'sum( NVL(CNTDEBEMN,0) ) CCDEBE, sum( NVL(CNTHABEMN,0) ) CCHABE '
               + 'FROM CNT301, TGE202, CNT401 '
               + 'WHERE CNT301.CIAID=' + QuotedStr(dblcCia.Text) + ' AND CNTESTADO=''P'' '
               + ' AND TGE202.CIAID(+)=CNT301.CIAID  and TGE202.CUENTAID(+)=CNT301.CUENTAID '
               + 'AND TGE202.CTA_CCOS=''S''  and cnt401.ciaid(+)=cnt301.ciaid and cnt401.ano(+)=''' + xAnoI + ''' '
               + 'and cnt301.cuentaid=cnt401.cuentaid(+)  and cnt301.ccosid=cnt401.ccosid(+) and TIPREG(+)=''3'' '
               + ' and ' + xWhere + ' '
               + 'group by cnt301.cuentaid, cnt301.ccosid '
               + ') a '
               + 'group by ccosid '
               + ') X '
               + 'WHERE CNT401.CIAID=' + QuotedStr(dblcCia.Text) + ' AND TGE202.CIAID=CNT401.CIAID AND TGE202.CUENTAID=CNT401.CUENTAID '
               + 'and TGE202.CTA_CCOS=''S'' and cnt401.ciaid=cnt301.ciaid(+) '
               + 'and cnt401.ano=''' + xAnoI + ''' and cnt301.cuentaid(+)=cnt401.cuentaid  and cnt301.ccosid(+)=cnt401.ccosid '
               + 'and cnt401.TIPREG=''3'' and cnt401.ccosid=x.ccosid(+) and ' + xWhere1 + ' '
               + 'group by CNT401.CUENTAID, CNT401.CCOSID';
            ppDEBE.Caption := 'Debe MN';
            ppHABER.Caption := 'Haber MN';

         // Inicio HPC_201411_CNT
            xFecha0 := '01/01/'+inttostr(Year);
            xSQL2 := 'Select CIAID, CUENTAID, CCOSID, '
                    +'       sum(CNTDEBEMN) MONTODEBE, sum(CNTHABEMN) MONTOHABER, '
                    +'       sum(SALINI) SALINI, sum(SALFIN) SALFIN, sum(MOVIMI) MOVIMI '
                    +'  from (Select CNT301.CIAID, CNT301.CUENTAID, CNT301.CCOSID, '
                 // Comprende desde el inicio del año de la fecha inicial del rango deseado hasta 1 dia antes del inicial del rango deseado
                    +'      (case when (CNTFCOMP >= '+quotedstr(xFecha0)
                    +'             and CNTFCOMP < '+quotedstr(datetostr(dbdtpFReg1.date))+')'
                    +'            then (sum(nvl(CNTDEBEMN,0)) - sum(nvl(CNTHABEMN,0)) ) else 0 end) SALINI, '
                    +'      (case when (CNTFCOMP >= '+quotedstr(datetostr(dbdtpFReg1.date))
                    +'             and CNTFCOMP <= '+quotedstr(datetostr(dbdtpFReg2.date))+')'
                    +'            then (sum(nvl(CNTDEBEMN,0))) else 0 end) CNTDEBEMN, '
                    +'      (case when (CNTFCOMP >= '+quotedstr(datetostr(dbdtpFReg1.date))
                    +'             and CNTFCOMP <= '+quotedstr(datetostr(dbdtpFReg2.date))+') '
                    +'            then (sum(nvl(CNTHABEMN,0))) else 0 end) CNTHABEMN, '
                 // Comprende desde la fecha inicial del rango deseado hasta el final del rango deseado
                    +'      (case when (CNTFCOMP >= '+quotedstr(datetostr(dbdtpFReg1.date))
                    +'             and CNTFCOMP <= '+quotedstr(datetostr(dbdtpFReg2.date))+')'
                    +'            then (sum(nvl(CNTDEBEMN,0)) - sum(nvl(CNTHABEMN,0)) ) else 0 end) MOVIMI, '
                 // Comprende desde la fecha inicial del año de la fecha inicial del rango deseado hasta el final del rango deseado
                    +'      (case when (CNTFCOMP >= '+quotedstr(xFecha0)
                    +'             and CNTFCOMP <= '+quotedstr(datetostr(dbdtpFReg2.date))+')'
                    +'            then (sum(nvl(CNTDEBEMN,0)) - sum(nvl(CNTHABEMN,0)) ) ELSE 0 end) SALFIN '
                    +'          from CNT301, TGE202, TGE203 '
                    +'         where CNT301.CIAID='+QuotedStr(dblcCia.Text)
                    +'           and CNTESTADO=''P'''
                    +'           and TGE202.CIAID(+)=CNT301.CIAID AND TGE202.CUENTAID(+)=CNT301.CUENTAID AND TGE202.CTA_CCOS=''S'' '
                    +'           and TGE203.CCOSID(+)=CNT301.CCOSID '
                 //   +'           and TGE203.CCOSID=CNT301.CCOSID '
                 // la 1era fecha siempre es 01/01 del año de la fecha inicial del rango deseado
                 // la 2da fecha es la fecha final a evaluar del rango deseado
                    +'           and (CNTFCOMP >= '+quotedstr(xFecha0)
                    +'           and CNTFCOMP <= '+quotedstr(datetostr(dbdtpFReg2.date))+') '
                    +'           and (CNT301.CCOSID IS NOT NULL) '
                    +          xWhere1
                    +'         group by CNT301.CIAID, CNT301.CUENTAID, CNT301.CCOSID,CNTFCOMP '
                    +'         order by CNT301.CIAID, CNT301.CUENTAID, CNT301.CCOSID) A '
                    +'GROUP BY CIAID,CUENTAID,CCOSID '
                    +'ORDER BY CIAID,CUENTAID,CCOSID ';
         // Fin HPC_201411_CNT
         End;
      1: Begin
            xSQL := ' SELECT CNT301.CUENTAID,CNT301.CTADES,CNT301.CCOSID,CNTCOMPROB,CNTGLOSA,TDIARID,CNTFCOMP,CNTFEMIS,TGE203.CCOSDES CCOSABR,'
               + '        DECODE(CNTDH,''D'',CNTMTOEXT,0.00) MONTODEBE ,        '
               + '        DECODE(CNTDH,''H'',CNTMTOEXT,0.00) MONTOHABER         '
               + ' FROM CNT301,TGE202,TGE203 '
               + ' WHERE CNT301.CIAID=' + QuotedStr(dblcCia.Text)
               + ' AND (CNT301.CUENTAID = TGE202.CUENTAID AND CNT301.CIAID = TGE202.CIAID ) '
               + ' AND (TGE202.CTA_CCOS(+) = ''S'') '
               + ' AND (CNT301.CCOSID = TGE203.CCOSID(+) )';
            xMes := IntToStr(strtoInt(speMM.text));

            DecodeDate(dbdtpFReg1.Date, Year, Month, Day);
            DecodeDate(dbdtpFReg2.Date, Year2, Month2, Day2);

            xMesAnt := DMCNT.StrZero(inttostr(Month - 1), 2);

            xAnoI := DMCNT.StrZero(inttostr(Year), 4);
            xAnoF := DMCNT.StrZero(inttostr(Year2), 4);

            xMesFin := DMCNT.StrZero(inttostr(Month2), 2);

            xSQL := 'Select * from TGE181 WHERE MESID=''' + xMes + '''';
            DMCNT.cdsQry.Close;
            DMCNT.cdsQry.DataRequest(xSQL);
            DMCNT.cdsQry.Open;

            xAAAAMM := 'Periodo : ' + DMCNT.cdsQry.FieldByName('MESDESL').AsString + ' DE ' + speAno.Text;

            xSQL := 'SELECT CNT301.CUENTAID, CASE WHEN CNT301.CUENTAID IS NOT NULL THEN ''CUENTA:'' ELSE '''' END LBLCUENTA, '
               + 'TGE202.CTADES, CNT301.CCOSID, CNTCOMPROB, CNTGLOSA, '
               + 'CNT301.TDIARID, CNTFCOMP, CNTFEMIS, TGE203.CCOSDES CCOSABR, '
               + 'NVL(CNTDEBEME,0) MONTODEBE, NVL(CNTHABEME,0) MONTOHABER, '
               + '0.00 SALINI, 0.00 SALFIN, 0.00 CCINI, 0.00 CCFIN, '
               + '''Desde ' + DateToStr(dbdtpFReg1.Date)
               + ' Hasta ' + DateToStr(dbdtpFReg2.Date) + ''' RANGO, '
               + '''' + xAAAAMM + ''' PERIODO, ''01'' TIPO, ''01'' TCC '
               + 'FROM CNT301, TGE202, TGE203 '
               + 'WHERE CNT301.CIAID=' + QuotedStr(dblcCia.Text) + ' AND CNTESTADO=''P'' '
               + 'AND TGE202.CIAID(+)=CNT301.CIAID AND TGE202.CUENTAID(+)=CNT301.CUENTAID AND TGE202.CTA_CCOS=''S'' '
               + 'AND TGE203.CCOSID(+)=CNT301.CCOSID';

            xSQL2 := 'SELECT CNT401.CUENTAID, CNT401.CCOSID, '
               + 'sum(NVL(CNTDEBEME,0)) MONTODEBE, sum(NVL(CNTHABEME,0)) MONTOHABER, '
               + 'max(NVL(cnt401.saldme' + xMesAnt + ',0)) SALINI, '
               + 'max(NVL(cnt401.saldme' + xMesAnt + ',0)) + sum(NVL(CNTDEBEME,0)) - sum(NVL(CNTHABEME,0)) SALFIN, '
               + 'max(x.ccini) ccini, max(x.ccfin) ccfin, MAX(CCDEBE) CCDEBE, MAX(CCHABE) CCHABE '
               + 'FROM CNT301, TGE202, CNT401, '
               + '( select ccosid, sum(salini) CCINI, sum(salfin) CCFIN, SUM(CCDEBE) CCDEBE, SUM(CCHABE) CCHABE '
               + 'from ( SELECT CNT301.CUENTAID, CNT301.CCOSID, NVL(max(cnt401.saldme' + xMesAnt + '),0) SALINI, '
               + 'NVL(max(cnt401.saldme' + xMesAnt + '),0)+sum( NVL(CNTDEBEME,0) )-sum( NVL(CNTHABEME,0) ) SALFIN,  '
               + 'sum( NVL(CNTDEBEME,0) ) CCDEBE, sum( NVL(CNTHABEME,0) ) CCHABE '
               + 'FROM CNT301, TGE202, CNT401 '
               + 'WHERE CNT301.CIAID=' + QuotedStr(dblcCia.Text) + ' AND CNTESTADO=''P'' '
               + ' AND TGE202.CIAID(+)=CNT301.CIAID  and TGE202.CUENTAID(+)=CNT301.CUENTAID '
               + 'AND TGE202.CTA_CCOS=''S''  and cnt401.ciaid(+)=cnt301.ciaid and cnt401.ano(+)=''' + xAnoI + ''' '
               + 'and cnt301.cuentaid=cnt401.cuentaid(+)  and cnt301.ccosid=cnt401.ccosid(+) and TIPREG(+)=''3'' '
               + ' and ' + xWhere + ' '
               + 'group by cnt301.cuentaid, cnt301.ccosid '
               + ') a '
               + 'group by ccosid '
               + ') X '
               + 'WHERE CNT401.CIAID=' + QuotedStr(dblcCia.Text) + ' AND TGE202.CIAID=CNT401.CIAID AND TGE202.CUENTAID=CNT401.CUENTAID '
               + 'and TGE202.CTA_CCOS=''S'' and cnt401.ciaid=cnt301.ciaid(+) '
               + 'and cnt401.ano=''' + xAnoI + ''' and cnt301.cuentaid(+)=cnt401.cuentaid  and cnt301.ccosid(+)=cnt401.ccosid '
               + 'and cnt401.TIPREG=''3'' and cnt401.ccosid=x.ccosid(+) and ' + xWhere + ' '
               + 'group by CNT401.CUENTAID, CNT401.CCOSID';
            ppDEBE.Caption := 'Debe ME';
            ppHABER.Caption := 'Haber ME';
         End;
   Else
      Begin
         xMes := IntToStr(strtoInt(speMM.text));

         DecodeDate(dbdtpFReg1.Date, Year, Month, Day);
         DecodeDate(dbdtpFReg2.Date, Year2, Month2, Day2);

         xMesAnt := DMCNT.StrZero(inttostr(Month - 1), 2);

         xAnoI := DMCNT.StrZero(inttostr(Year), 4);
         xAnoF := DMCNT.StrZero(inttostr(Year2), 4);

         xMesFin := DMCNT.StrZero(inttostr(Month2), 2);

         xSQL := 'Select * from TGE181 WHERE MESID=''' + xMes + '''';
         DMCNT.cdsQry.Close;
         DMCNT.cdsQry.DataRequest(xSQL);
         DMCNT.cdsQry.Open;

         xAAAAMM := 'Periodo : ' + DMCNT.cdsQry.FieldByName('MESDESL').AsString + ' DE ' + speAno.Text;
         xSQL := ' SELECT CNT301.CUENTAID,CNT301.CTADES,CNT301.CCOSID,CNTCOMPROB,CNTGLOSA,TDIARID,CNTFCOMP,CNTFEMIS,TGE203.CCOSDES CCOSABR ,                               ' +
            '        DECODE(CNTDH,''D'',CNTMTOLOC,0.00) DEBELOC ,        ' +
            '        DECODE(CNTDH,''H'',CNTMTOLOC,0.00) HABERLOC ,         ' +
            '        DECODE(CNTDH,''D'',CNTMTOEXT,0.00) DEBEEXT ,        ' +
            '        DECODE(CNTDH,''H'',CNTMTOEXT,0.00) HABEREXT         ' +
            ' FROM CNT301, TGE202, TGE203  ' +
            ' WHERE CNT301.CIAID=' + QuotedStr(dblcCia.Text) + ' AND CNTESTADO=''P'' ' +
            ' AND (CNT301.CUENTAID = TGE202.CUENTAID(+) AND CNT301.CIAID = TGE202.CIAID(+)) ' +
            ' AND (TGE202.CTA_CCOS(+)=''S'') ' +
            ' AND (CNT301.CCOSID = TGE203.CCOSID(+))';

         xSQL2 := 'SELECT CNT401.CUENTAID, CNT401.CCOSID, '
            + 'sum(NVL(CNTDEBEME,0)) MONTODEBE, sum(NVL(CNTHABEME,0)) MONTOHABER, '
            + 'max(NVL(cnt401.saldme' + xMesAnt + ',0)) SALINI, '
            + 'max(NVL(cnt401.saldme' + xMesAnt + ',0)) + sum(NVL(CNTDEBEME,0)) - sum(NVL(CNTHABEME,0)) SALFIN, '
            + 'max(x.ccini) ccini, max(x.ccfin) ccfin, MAX(CCDEBE) CCDEBE, MAX(CCHABE) CCHABE '
            + 'FROM CNT301, TGE202, CNT401, '
            + '( select ccosid, sum(salini) CCINI, sum(salfin) CCFIN, SUM(CCDEBE) CCDEBE, SUM(CCHABE) CCHABE '
            + 'from ( SELECT CNT301.CUENTAID, CNT301.CCOSID, NVL(max(cnt401.saldme' + xMesAnt + '),0) SALINI, '
            + 'NVL(max(cnt401.saldme' + xMesAnt + '),0)+sum( NVL(CNTDEBEME,0) )-sum( NVL(CNTHABEME,0) ) SALFIN,  '
            + 'sum( NVL(CNTDEBEME,0) ) CCDEBE, sum( NVL(CNTHABEME,0) ) CCHABE '
            + 'FROM CNT301, TGE202, CNT401 '
            + 'WHERE CNT301.CIAID=' + QuotedStr(dblcCia.Text) + ' AND CNTESTADO=''P'' '
            + ' AND TGE202.CIAID=CNT301.CIAID  and TGE202.CUENTAID=CNT301.CUENTAID '
            + 'AND TGE202.CTA_CCOS=''S''  and cnt401.ciaid(+)=cnt301.ciaid and cnt401.ano(+)=''' + xAnoI + ''' '
            + 'and cnt301.cuentaid=cnt401.cuentaid(+)  and cnt301.ccosid=cnt401.ccosid(+) and TIPREG(+)=''3'' '
            + ' and ' + xWhere + ' '
            + 'group by cnt301.cuentaid, cnt301.ccosid '
            + ') a '
            + 'group by ccosid '
            + ') X '
            + 'WHERE CNT401.CIAID=' + QuotedStr(dblcCia.Text) + ' AND TGE202.CIAID=CNT401.CIAID AND TGE202.CUENTAID=CNT401.CUENTAID '
            + 'and TGE202.CTA_CCOS=''S'' and cnt401.ciaid=cnt301.ciaid(+) '
            + 'and cnt401.ano=''' + xAnoI + ''' and cnt301.cuentaid(+)=cnt401.cuentaid  and cnt301.ccosid(+)=cnt401.ccosid '
            + 'and cnt401.TIPREG=''3'' and cnt401.ccosid=x.ccosid(+) and ' + xWhere + ' '
            + 'group by CNT401.CUENTAID, CNT401.CCOSID';
      End;
   End;

   xSQL := xSQL + ' AND ' + xWhere;

   If rgTipoListado.ItemIndex = 0 Then
   Begin
      Screen.Cursor := CrHourGlass;

      cds2.Active := False;
      cds2.DataRequest(xSQL2);
      cds2.Active := True;

      cds1.Active := False;
      cds1.DataRequest(xSQL);
      cds1.Active := True;

      InsertarSaldos;

      cds1.IndexFieldNames := 'CCOSID; TCC; CUENTAID; TIPO; CNTFCOMP; CNTCOMPROB';
      If cds1.RecordCount = 0 Then
      Begin
         ShowMessage('No hay Datos Para Las Condiciones Seleccionadas');
         Screen.Cursor := CrDefault;
         Exit;
      End;
   End;

   If rgTipoListado.ItemIndex = 2 Then
   Begin
      If xNivel <= 0 Then
      Begin
         ShowMessage('Error : Falta seleccionar el Nivel de Cuenta');
         Exit;
      End;

      If speAno.Text + IntToStr(strtoInt(speMM.text)) > speAnoF.Text + IntToStr(strtoInt(speMMF.text)) Then
      Begin
         ShowMessage('Error : Periodo Final debe Ser Mayor al Inicial');
         Exit;
      End;

      Screen.Cursor := CrHourGlass;

      xMes := IntToStr(strtoInt(speMM.text));
      xSQL := 'Select * from TGE181 WHERE MESID=''' + xMes + '''';
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;

      xAAAAMM := 'DESDE ' + DMCNT.cdsQry.FieldByName('MESDESL').AsString + ' DE ' + speAno.Text;

      xMes := IntToStr(strtoInt(speMMF.text));

      xSQL := 'Select * from TGE181 WHERE MESID=''' + xMes + '''';
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;

      xAAAAMM := xAAAAMM + ' HASTA ' + DMCNT.cdsQry.FieldByName('MESDESL').AsString + ' DE ' + speAnoF.Text;

      xSQL := 'SELECT ''' + xAAAAMM + ''' PERIODO, A.CIAID, A.CCOSID, B.CIADES, C.CCOSDES, A.CUENTAID, D.CTADES, '
         + 'CNTDEBEMN, CNTHABEMN, CNTDEBEME, CNTHABEME, CNTSALDOMN, CNTSALDOME '
         + 'FROM ( '
         + 'SELECT CIAID, CCOSID, TRIM(CTANIV) CUENTAID, '
         + 'SUM( NVL(CNTDEBEMN,0) ) CNTDEBEMN, SUM( NVL(CNTHABEMN,0) ) CNTHABEMN, '
         + 'SUM( NVL(CNTDEBEMN,0) )-SUM( NVL(CNTHABEMN,0) ) CNTSALDOMN, '
         + 'SUM( NVL(CNTDEBEME,0) ) CNTDEBEME, SUM( NVL(CNTHABEME,0) ) CNTHABEME, '
         + 'SUM( NVL(CNTDEBEME,0) )-SUM( NVL(CNTHABEME,0) ) CNTSALDOME '
         + 'FROM ( '
         + 'Select A.CIAID, A.CCOSID, A.CUENTAID, SUBSTR(A.CUENTAID,1,' + IntToStr(xNivel) + ') CTANIV, '
         + 'SUM( NVL(CNTDEBEMN,0) ) CNTDEBEMN, SUM( NVL(CNTHABEMN,0) ) CNTHABEMN, '
         + 'SUM( NVL(CNTDEBEMN,0) )-SUM( NVL(CNTHABEMN,0) ) CNTSALDOMN, '
         + 'SUM( NVL(CNTDEBEME,0) ) CNTDEBEME, SUM( NVL(CNTHABEME,0) ) CNTHABEME , '
         + 'SUM( NVL(CNTDEBEME,0) )-SUM( NVL(CNTHABEME,0) ) CNTSALDOME '
         + 'From CNT301 A, TGE202 B '
         + 'WHERE A.CIAID=''' + dblcCia.Text + ''' AND '
         + 'A.CNTANOMM>=''' + speAno.Text + DMCNT.StrZero(speMM.Text, 2) + ''' AND '
         + 'A.CNTANOMM<=''' + speAnoF.Text + DMCNT.StrZero(speMMF.Text, 2) + ''' '
         + xCCostoT + ' '
         + 'AND A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND B.CTA_CCOS=''S'''
         + 'GROUP BY A.CIAID, A.CCOSID, A.CUENTAID '
         + ') A '
         + 'GROUP BY CIAID, CCOSID, CTANIV '
         + ') A, TGE101 B, TGE203 C, TGE202 D '
         + 'WHERE A.CIAID=B.CIAID '
         + 'AND A.CCOSID=C.CCOSID(+) '
         + 'AND A.CIAID=D.CIAID(+) AND A.CUENTAID=TRIM(D.CUENTAID) ';

      xSQL := xSQL + 'ORDER BY A.CIAID, A.CCOSID, A.CUENTAID ';

      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.ProviderName := 'PrvTGE';
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;

      ppdbCCostoNiv.DataSource := DMCNT.dsQry;

      pprCCostoNiv.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\CCOSTONIVELTX.rtm';
      pprCCostoNiv.template.LoadFromFile;

      Screen.Cursor := crDefault;

      DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Analisis Centro Costo',
         dblcCia.Text, // Campañía
         speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
         dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
         dblcNivel.text, dblcTDiario.Text, // Nivel   - Origen
         '', inttostr(rgMoneda.itemindex), // Lote    -  Moneda
         sCtaLog, '', // Cuentas - Auxiliares
         sCosLog, 'Impresora', // Costos - Tipo Salida
         inttostr(rgTipoListado.itemindex)); // Tipo Rep

      pprCCostoNiv.Print;

      ppdbCCostoNiv.DataSource := Nil;

      pprCCostoNiv.Stop;

      x10 := Self.ComponentCount - 1;
      While x10 >= 0 Do
      Begin
         If Self.Components[x10].ClassName = 'TppGroup' Then
         Begin
            Self.Components[x10].Free;
         End;
         x10 := x10 - 1;
      End;
      Exit;
   End;

   If rgTipoListado.ItemIndex = 1 Then
   Begin
      xsql := '';

      cds1.Close;
      cds1.Filter := '';
      cds1.Filtered := True;
      cds1.IndexFieldNames := '';
      If rgMoneda.ItemIndex = 0 Then
      Begin
         xsql := ' SELECT CNT301.CUENTAID, max(CNT301.CTADES) CTADES, CNT301.CCOSID, '
            + ' max(TGE203.CCOSDES) CCOSDES ,sum( DECODE(CNTDH,''D'',NVL(CNTMTOLOC,0) '
            + '  ,0.00)) CNTDEBEMN, sum(DECODE(CNTDH,''H'',NVL(CNTMTOLOC,0),0.00)) CNTHABEMN '
            + ' FROM CNT301 ,TGE202,TGE203 WHERE CNT301.CIAID=''' + dblcCia.text + ''' AND CNT301.CUENTAID '
            + '= TGE202.CUENTAID AND CNT301.CIAID = TGE202.CIAID AND TGE202.CTA_CCOS(+)=''S'''
            + ' AND CNT301.CCOSID = TGE203.CCOSID(+) AND ' + xwhere
            + ' group by CNT301.CCOSID,CNT301.CUENTAID ';
      End;
      If rgMoneda.ItemIndex = 1 Then
      Begin
         xsql := ' SELECT CNT301.CUENTAID, max(CNT301.CTADES) CTADES, CNT301.CCOSID, '
            + ' max(TGE203.CCOSDES) CCOSDES ,sum( DECODE(CNTDH,''D'',NVL(CNTMTOEXT,0) '
            + '  ,0.00)) CNTDEBEMN, sum(DECODE(CNTDH,''H'',NVL(CNTMTOEXT,0),0.00)) CNTHABEMN '
            + ' FROM CNT301 ,TGE202,TGE203 WHERE CNT301.CIAID=''' + dblcCia.text + ''' AND CNT301.CUENTAID '
            + '= TGE202.CUENTAID AND CNT301.CIAID = TGE202.CIAID AND TGE202.CTA_CCOS(+)=''S'''
            + ' AND CNT301.CCOSID = TGE203.CCOSID(+) AND ' + xwhere
            + ' group by CNT301.CCOSID,CNT301.CUENTAID ';
      End;
      If rgMoneda.ItemIndex = 2 Then
      Begin
         xsql := ' SELECT CNT301.CUENTAID,MAX(CNT301.CTADES) CTADES,CNT301.CCOSID '
            + ' ,MAX(TGE203.CCOSDES) CCOSDES, '
            + ' SUM(DECODE(CNTDH,''D'',CNTMTOLOC,0.00)) DEBELOC , '
            + ' SUM(DECODE(CNTDH,''H'',CNTMTOLOC,0.00)) HABERLOC , '
            + ' SUM(DECODE(CNTDH,''D'',CNTMTOEXT,0.00)) DEBEEXT , '
            + ' SUM(DECODE(CNTDH,''H'',CNTMTOEXT,0.00) )HABEREXT '
            + ' FROM CNT301,TGE202,TGE203 '
            + ' WHERE CNT301.CIAID=''' + dblcCia.text + ''' AND '
            + ' (CNT301.CUENTAID = TGE202.CUENTAID AND CNT301.CIAID = TGE202.CIAID) '
            + ' AND (TGE202.CTA_CCOS(+)=''S'')  AND (CNT301.CCOSID = TGE203.CCOSID(+)) '
            + ' AND ' + xwhere
            + ' GROUP BY CNT301.CCOSID,CNT301.CUENTAID '
      End;
     //
      Screen.Cursor := CrHourGlass;
      cds1.Active := False;
      cds1.DataRequest(xSQL);
      cds1.Active := True;
      cds1.IndexFieldNames := 'CCOSID;CUENTAID';
      If cds1.RecordCount = 0 Then
      Begin
         ShowMessage('No hay Datos Para Las Condiciones Seleccionadas');
         Screen.Cursor := CrDefault;
         Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas');
      End;
   End;

   pplTitulo1.Caption := edtTit.Text;
   pplblCia.Caption := edtCia.Text;
   If rgMoneda.ItemIndex <> 2 Then
   Begin
      ppDBPipeline1.DataSource := ds1;
      ppDBPipeline3.DataSource := ds1;
      ppReport1.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\AnalisisCCostoTX.rtm';

      If rgTipoListado.ItemIndex = 0 Then
         ppReport1.template.LoadFromFile;

      If rgTipoListado.ItemIndex = 1 Then
      Begin
         If rgTipoListado.ItemIndex = 0 Then
            ppReport3.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\AnalisisCCosto.rtm'
         Else
            ppReport3.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\AnalisisCCostogrupo.rtm';
         ppReport3.template.LoadFromFile;
      End;

      If rgTipoListado.ItemIndex = 1 Then
      Begin
         If length(speMM.text) = 1 Then
            speMM.text := '0' + speMM.text;

         If length(speMM.text) = 2 Then
            speMM.text := speMM.text;

         xSql := 'MESIDR=''' + speMM.text + '''';
         pplblmes.caption := DMCNT.DisplayDescrip('PrvTGE', 'TGE181', 'MESDESL', xSql, 'MESDESL') + ' ' + speAno.text; //DMCNT.cdsTDiarioTDiarDes.Text;
      End;

      If rgMoneda.ItemIndex = 0 Then
      Begin
         If rgTipoListado.ItemIndex = 0 Then
// Inicio HPC_201601_CNT
// Se realiza asignación dinámica de descripción de la Moneda Local
//            pplbMoneda.Caption := 'NUEVOS SOLES'
            pplbMoneda.Caption := Uppercase(DMCNT.wTMonLocDes)
         Else
         Begin
//            pplblmonedag.Caption := 'NUEVOS SOLES';
            pplblmonedag.Caption := Uppercase(DMCNT.wTMonLocDes);
// Fin HPC_201601_CNT
         End;
      End;

      If rgMoneda.ItemIndex = 1 Then
      Begin
         If rgTipoListado.ItemIndex = 0 Then
// Inicio HPC_201601_CNT
// Se realiza asignación dinámica de descripción de la Moneda Extranjera
//          pplbMoneda.Caption := 'DOLARES AMERICANOS'
            pplbMoneda.Caption := Uppercase(DMCNT.wTMonExtDes)
         Else
//            pplblmonedag.Caption := 'NUEVOS SOLES';
            pplblmonedag.Caption := Uppercase(DMCNT.wTMonLocDes);
// Fin HPC_201601_CNT
      End;

      If rgTipoListado.ItemIndex = 0 Then
      Begin
         If fTexto = 'S' Then
         Begin
            GeneraTexto;
            Exit;
         End;

         If xbExportarExcel = True Then
         Begin
            fg_GeneraExcel;
            Exit;
         End;

         ppd1.Report := ppReport1;

         DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Analisis Centro Costo',
            dblcCia.Text, // Campañía
            speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
            dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
            dblcNivel.text, dblcTDiario.Text, // Nivel   - Origen
            '', inttostr(rgMoneda.itemindex), // Lote    -  Moneda
            sCtaLog, '', // Cuentas - Auxiliares
            sCosLog, 'Impresora', // Costos - Tipo Salida
            inttostr(rgTipoListado.itemindex)); // Tipo Rep

         If cbDisenoRep.Checked Then
         Begin
            ppd1.ShowModal;
         End
         Else
         Begin
            ppReport1.Print;
            ppReport1.Stop;
            x10 := Self.ComponentCount - 1;
            While x10 >= 0 Do
            Begin
               If Self.Components[x10].ClassName = 'TppGroup' Then
               Begin
                  Self.Components[x10].Free;
               End;
               x10 := x10 - 1;
            End;
            ppDBPipeline1.DataSource := Nil;
         End;
      End;

      If rgTipoListado.ItemIndex = 1 Then
      Begin
         DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Analisis Centro Costo',
            dblcCia.Text, // Campañía
            speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
            dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
            dblcNivel.text, dblcTDiario.Text, // Nivel   - Origen
            '', inttostr(rgMoneda.itemindex), // Lote    -  Moneda
            sCtaLog, '', // Cuentas - Auxiliares
            sCosLog, 'Impresora', // Costos - Tipo Salida
            inttostr(rgTipoListado.itemindex)); // Tipo Rep
         ppReport3.Print;
         ppReport3.Stop;
         x10 := Self.ComponentCount - 1;
         While x10 >= 0 Do
         Begin
            If Self.Components[x10].ClassName = 'TppGroup' Then
            Begin
               Self.Components[x10].Free;
            End;
            x10 := x10 - 1;
         End;
         ppDBPipeline1.DataSource := Nil;

      End;
   End
   Else
   Begin
      ppDBPipeline2.DataSource := ds1;
      ppDBPipeline4.DataSource := ds1;

      FImpresion := TFImpresion.Create(Self);
      FImpresion.ShowModal;
      If FImpresion.wFlTexto = 'C' Then
      Begin
         ppReport2.stop;
         DMCNT.cdsQry.CancelUpdates;
         DMCNT.cdsQry.IndexFieldNames := '';
         DMCNT.cdsQry.Filter := '';
         DMCNT.cdsQry.Filtered := True;
         Exit;
      End;
      If rgTipoListado.itemindex = 0 Then
      Begin
         If FImpresion.wFlTexto = 'G' Then
            ppReport2.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\AnalisisCCostoExt.rtm';
         If FImpresion.wFlTexto = 'T' Then
            ppReport2.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\AnalisisCCostoExtTX.rtm';
      End;
      If rgTipoListado.itemindex = 1 Then
      Begin
         If FImpresion.wFlTexto = 'G' Then
            ppReport2.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\AnalisisCCostoExtGrupo.rtm';
      End;

      If rgTipoListado.itemindex = 0 Then
      Begin
         If FImpresion.wFlTexto = 'G' Then
            ppReport2.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\AnalisisCCostoExt.rtm';
         If FImpresion.wFlTexto = 'T' Then
            ppReport2.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\AnalisisCCostoExtTX.rtm';
         ppReport2.template.LoadFromFile;
         ppLabel35.Caption := edtCia.Text;

         DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Analisis Centro Costo',
            dblcCia.Text, // Campañía
            speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
            dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
            dblcNivel.text, dblcTDiario.Text, // Nivel   - Origen
            '', inttostr(rgMoneda.itemindex), // Lote    -  Moneda
            sCtaLog, '', // Cuentas - Auxiliares
            sCosLog, 'Impresora', // Costos - Tipo Salida
            inttostr(rgTipoListado.itemindex)); // Tipo Rep

         ppReport2.Print;
         ppReport2.Stop;
         x10 := Self.ComponentCount - 1;
         While x10 >= 0 Do
         Begin
            If Self.Components[x10].ClassName = 'TppGroup' Then
            Begin
               Self.Components[x10].Free;
            End;
            x10 := x10 - 1;
         End;
         ppDBPipeline2.DataSource := Nil;
      End;
      If rgTipoListado.itemindex = 1 Then
      Begin
         If FImpresion.wFlTexto = 'G' Then
            ppReport4.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\AnalisisCCostoExtGrupo.rtm';

         ppReport4.template.LoadFromFile;
         pplblciaextg.Caption := edtCia.Text;

         DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Analisis Centro Costo',
            dblcCia.Text, // Campañía
            speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
            dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
            dblcNivel.text, dblcTDiario.Text, // Nivel   - Origen
            '', inttostr(rgMoneda.itemindex), // Lote    -  Moneda
            sCtaLog, '', // Cuentas - Auxiliares
            sCosLog, 'Impresora', // Costos - Tipo Salida
            inttostr(rgTipoListado.itemindex)); // Tipo Rep

         ppReport4.Print;
         ppReport4.Stop;
         x10 := Self.ComponentCount - 1;
         While x10 >= 0 Do
         Begin
            If Self.Components[x10].ClassName = 'TppGroup' Then
            Begin
               Self.Components[x10].Free;
            End;
            x10 := x10 - 1;
         End;
         ppDBPipeline4.DataSource := Nil;
      End;

   End;
   Screen.Cursor := CrDefault;
End;

Procedure TFCtroCosto.GeneraTexto;
Var
   xBlanco, xCampo, xLinea: String;
   i, xSpace, xTem: Integer;
Begin

   If Not sdGraba.Execute Then Exit;

   Screen.Cursor := crHourGlass;

   pbExp.Max := 100;
   pbExp.Position := 5;

   xBlanco := '                                                                      ';
   xSpace := 0;

   scFile.Lines.Clear;

   cds1.DisableControls;

   cds1.Last;

   xTem := Trunc(cds1.RecordCount / 20) * 2;

   pbExp.Max := cds1.RecordCount + (xTem * 3);

   pbExp.Position := (xTem * 2);

   pbExp.Position := xTem;

   pbExp.Position := pbExp.Position + xTem;

   xLinea := 'COMPAÑIA;NOMBRE;';
   scFile.Lines.Add(xLinea);
   xLinea := dblcCia.text + ';' + edtCia.text + ';';
   scFile.Lines.Add(xLinea);
   xLinea := RetornaDatos('PERIODO');
   scFile.Lines.Add(xLinea);
   xLinea := RetornaDatos('RANGO');
   scFile.Lines.Add(xLinea);

   xLinea := 'C.COSTO;NOMBRE;CUENTA;NOMBRE;FEC.COMPROB;ORIGEN;COMPROBANTE;FEC.EMISION;GLOSA;DEBE;HABER;';
   scFile.Lines.Add(xLinea);

   cds1.First;
   While Not cds1.Eof Do
   Begin
      xLinea := '';
      xLinea := xLinea + RetornaDatos('CCOSID') + ';';
      xLinea := xLinea + RetornaDatos('CCOSABR') + ';';
      xLinea := xLinea + RetornaDatos('CUENTAID') + ';';
      xLinea := xLinea + RetornaDatos('CTADES') + ';';
      xLinea := xLinea + RetornaDatos('CNTFCOMP') + ';';
      xLinea := xLinea + RetornaDatos('TDIARID') + ';';
      xLinea := xLinea + RetornaDatos('CNTCOMPROB') + ';';
      xLinea := xLinea + RetornaDatos('CNTFEMIS') + ';';
      xLinea := xLinea + RetornaDatos('CNTGLOSA') + ';';
      xLinea := xLinea + RetornaDatos('MONTODEBE') + ';';
      xLinea := xLinea + RetornaDatos('MONTOHABER') + ';';
      pbExp.Position := pbExp.Position + 1;
      scFile.Lines.Add(xLinea);
      cds1.Next;
   End;

   scFile.Lines.SaveToFile(sdGraba.FileName);

   pbExp.Position := pbExp.Position + 1;

   cds1.IndexFieldNames := '';

   Screen.Cursor := crDefault;

   ShowMessage('Archivo Grabado');

   pbExp.Position := 0;
End;

Function TFCtroCosto.RetornaDatos(cCampo: String): String;
Var
   xBlanco: String;
   xSpace: Integer;
Begin
   xBlanco := '                                                                      ';
   If cds1.FieldByName(cCampo).Size > 0 Then
      xSpace := cds1.FieldByName(cCampo).Size - Length(cds1.FieldByName(cCampo).AsString)
   Else
      xSpace := 15 - Length(cds1.FieldByName(cCampo).AsString);

   Result := cds1.FieldByName(cCampo).AsString + Copy(xBlanco, 1, xSpace);
End;

Procedure TFCtroCosto.dblcCiaExit(Sender: TObject);
Begin
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

Procedure TFCtroCosto.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFCtroCosto.ckTDiarioClick(Sender: TObject);
Begin
   If Not (ckTDiario.Checked) Then
   Begin
      dblcTDiario.Text := '';
      edtTDiario.Text := '';
      dblcTDiario.Enabled := False;
   End
   Else
   Begin
      dblcTDiario.Enabled := True;
   End;
End;

Procedure TFCtroCosto.dblcTDiarioExit(Sender: TObject);
Begin
   edtTDiario.Text := '';
   If dblcTDiario.Text <> '' Then edtTDiario.Text := DMCNT.cdsTDiario.FieldByName('TDIARDES').AsString;
End;

Procedure TFCtroCosto.rgCuentaClick(Sender: TObject);
Begin
   If rgCuenta.ItemIndex = 1 Then
   Begin
      Z2bbtnSelCuenta.Enabled := True;
   End
   Else
   Begin
      Z2bbtnSelCuenta.Enabled := False;
   End;
End;

Procedure TFCtroCosto.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMCNT.cdsTDiario.IndexFieldNames := '';
   FConsulta.FSelCuenta3.Free;
   FSelCCosto.free;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;
   Action := caFree;
End;

Procedure TFCtroCosto.rgCCostoClick(Sender: TObject);
Begin
   If TRadioGroup(Sender).ItemIndex = 1 Then
   Begin
      Z2bbtnSelCCosto.Enabled := True;
   End
   Else
   Begin
      Z2bbtnSelCCosto.Enabled := False;
   End;
End;

Procedure TFCtroCosto.Valida;
Begin

   If (dbdtpFReg1.Date = 0) Then
   Begin
      dbdtpFReg1.SetFocus;
      ShowMessage('Fecha no válida');
      Raise exception.Create('Fecha no válida');
   End;

   If (dbdtpFReg2.Date = 0) Then
   Begin
      dbdtpFReg2.SetFocus;
      ShowMessage('Fecha no válida');
      Raise exception.Create('Fecha no válida');
   End;

   If (ckTDiario.Checked) And (length(edtTDiario.Text) = 0) Then
   Begin
      dblcTDiario.SetFocus;
      ShowMessage('Seleccione un Tipo de Diario');
      Raise Exception.create('Seleccione un Tipo de Diario');
   End;
   If rgCCosto.ItemIndex = 1 Then
   Begin
      If FSelCCosto.cdsClone.RecordCount = 0 Then
      Begin
         Z2bbtnSelCCosto.SetFocus;
         ShowMessage('No Ha Seleccionado Centros de Costo');
         Raise Exception.create('No Ha Seleccionado Centros de Costo');
      End;
   End;
   If rgCuenta.ItemIndex = 1 Then
   Begin
      If FConsulta.FSelCuenta3.cdsClone.RecordCount = 0 Then
      Begin
         Z2bbtnSelCuenta.SetFocus;
         ShowMessage('No Ha Seleccionado Cuentas');
         Raise Exception.create('No Ha Seleccionado Cuentas');
      End;
   End;

End;

Procedure TFCtroCosto.Z2bbtnSelCuentaClick(Sender: TObject);
Begin
   FConsulta.FSelCuenta3.sCia := dblcCia.text;
   FConsulta.FSelCuenta3.ShowModal;
End;

Procedure TFCtroCosto.Z2bbtnSelCCostoClick(Sender: TObject);
Begin
   FSelCCosto.ShowModal;
End;

Procedure TFCtroCosto.FormCreate(Sender: TObject);
Begin

   cds1.RemoteServer := DMCNT.DCOM1;
   cds1.ProviderName := 'PrvTGE';

   cds2.RemoteServer := DMCNT.DCOM1;
   cds2.ProviderName := 'PrvTGE';

End;

Procedure TFCtroCosto.ppVariable1Calc2(Sender: TObject; Var Value: Variant);
Begin
   Value := Value + strtocurr(ppDBText12.fieldvalue) - strtocurr(ppDBText13.Fieldvalue)
End;

Procedure TFCtroCosto.ppVariable2Calc2(Sender: TObject; Var Value: Variant);
Begin
   Value := Value + strtocurr(ppDBText3.fieldvalue) - strtocurr(ppDBText4.Fieldvalue)
End;

Procedure TFCtroCosto.ppVariable3Calc(Sender: TObject; Var Value: Variant);
Begin
   Value := Value + strtocurr(ppDBText9.fieldvalue) - strtocurr(ppDBText10.Fieldvalue)
End;

Procedure TFCtroCosto.dbdtpFReg1Exit2(Sender: TObject);
Begin
   If dbdtpFReg1.date = 0 Then
   Begin
      dbdtpFReg1.SetFocus;
      ShowMessage('Error : Falta Registrar Fecha');
      Raise Exception.Create('Error : Falta Registrar Fecha');
   End;
End;

Procedure TFCtroCosto.dbdtpFReg2Exit2(Sender: TObject);
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
   gbParametros.Enabled := True;

End;

Procedure TFCtroCosto.gbPerExit(Sender: TObject);
Var
   xFecha1, xFecha2: TDateTime;
Begin
   xFecha1 := strtodate('01/' + DMCNT.strZero(speMM.Text, 2) + '/' + speAno.Text);
   If strtofloat(speMM.Text) + 1 = 13 Then
   Begin
      xFecha2 := strtodate('01/01/' + FloatToStr(StrToFloat(speAno.Text) + 1));
   End
   Else
   Begin
      xFecha2 := strtodate('01/' + DMCNT.strZero(floattostr(strtofloat(speMM.Text) + 1), 2) + '/' + speAno.Text);
   End;
   xFecha2 := xFecha2 - 1;
   dbdtpFReg1.date := xFecha1;
   dbdtpFReg2.date := xFecha2;
End;

Procedure TFCtroCosto.FormShow(Sender: TObject);
Begin
   DMCNT.FiltraTabla(DMCNT.cdsTDiario, 'TGE104', 'TDIARID');
   IniciaCampos;

   DMCNT.cdsCia.Filtered := False;
   If Not DMCNT.cdsCia.Active Then
      DMCNT.cdsCia.Open;
   If DMCNT.cdsCia.RecordCount = 1 Then
   Begin
      dblcCia.Text := DMCNT.cdsCia.fieldbyname('CIAID').AsString;
      edtCia.Text := DMCNT.cdsCia.fieldbyname('CIADES').AsString;
      dblcCia.Enabled := False;
   End;
End;

Procedure TFCtroCosto.ppReport1PreviewFormCreate(Sender: TObject);
Begin
   TppReport(Sender).PreviewForm.WindowState := WsMaximized;
   TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zsPageWidth;
End;

Procedure TFCtroCosto.ppReport2PreviewFormCreate(Sender: TObject);
Begin
   TppReport(Sender).PreviewForm.WindowState := WsMaximized;
   TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zsPageWidth;

End;

Procedure TFCtroCosto.ppHeaderBand2BeforePrint(Sender: TObject);
Begin
   pplblCia.Caption := edtCia.Text;
End;

Procedure TFCtroCosto.ppHeaderBand3BeforePrint(Sender: TObject);
Begin
   ppLabel43.Caption := edtCia.Text;
End;

Procedure TFCtroCosto.ppReport3PreviewFormCreate(Sender: TObject);
Begin
   TppReport(Sender).PreviewForm.WindowState := WsMaximized;
   TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zsPageWidth;

End;

Procedure TFCtroCosto.ppVariable6Calc(Sender: TObject; Var Value: Variant);
Begin
   Value := Value + strtocurr(ppDBText28.fieldvalue) - strtocurr(ppDBText29.Fieldvalue)
End;

Procedure TFCtroCosto.ppVariable7Calc(Sender: TObject; Var Value: Variant);
Begin
   Value := Value + strtocurr(ppDBText30.fieldvalue) - strtocurr(ppDBText35.Fieldvalue)

End;

Procedure TFCtroCosto.ppVariable8Calc(Sender: TObject; Var Value: Variant);
Begin
   Value := Value + strtocurr(ppDBText36.fieldvalue) - strtocurr(ppDBText37.Fieldvalue)
End;

Procedure TFCtroCosto.dblcNivelExit(Sender: TObject);
Begin
   xNivel := DMCNT.cdsNivel.FieldByName('DIGITOS').AsInteger;
End;

Procedure TFCtroCosto.rgTipoListadoClick(Sender: TObject);
Begin
   gbNivel.Enabled := False;
   If rgTipoListado.ItemIndex = 2 Then
   Begin
      gbNivel.Enabled := True;
      DMCNT.cdsNivel.First;
      speAnoF.Value := speAno.Value;
      speMMF.Value := speMM.Value;
   End;
End;

Procedure TFCtroCosto.InsertarSaldos;
Var
   xCC, xC1: String;
   xTotSALINI, xTotMONTODEBE, xTotMONTOHABER, xTotSALFIN : currency;
Begin
   cds2.IndexFieldNames := 'CCOSID;CUENTAID';
   cds2.First;
   xCC := '';

// cds1.IndexFieldNames := 'CCOSID; TCC; CUENTAID; TIPO; CNTFCOMP; CNTCOMPROB';

   While Not cds2.Eof Do
   Begin
      xCC := cds2.FieldByName('CCOSID').AsString;
      xTotSALINI:=0; xTotMONTODEBE:=0; xTotMONTOHABER:=0; xTotSALFIN:=0;
      While (xCC=cds2.FieldByName('CCOSID').AsString) and (Not cds2.Eof) Do
      Begin
         cds1.Insert;
         cds1.FieldByName('CUENTAID').AsString := cds2.FieldByName('CUENTAID').AsString;
         cds1.FieldByName('CCOSID').AsString := cds2.FieldByName('CCOSID').AsString;
         cds1.FieldByName('CNTGLOSA').AsString := '                    Saldo Anterior    :';
         cds1.FieldByName('TCC').AsString := '01';
         cds1.FieldByName('TIPO').AsString := '02';
         cds1.FieldByName('RANGO').AsString := 'Desde ' + DateToStr(dbdtpFReg1.Date) + ' Hasta ' + DateToStr(dbdtpFReg2.Date);
         cds1.FieldByName('PERIODO').AsString := xAAAAMM;
         If cds2.FieldByName('SALINI').AsFloat >= 0 Then
            cds1.FieldByName('MONTODEBE').AsFloat := cds2.FieldByName('SALINI').AsFloat
         Else
            cds1.FieldByName('MONTOHABER').AsFloat := cds2.FieldByName('SALINI').AsFloat;
         cds1.FieldByName('TDIARID').AsString := '00';
         cds1.FieldByName('CNTCOMPROB').AsString := '0000000000';

         cds1.Insert;
         cds1.FieldByName('CUENTAID').AsString := cds2.FieldByName('CUENTAID').AsString;
         cds1.FieldByName('CCOSID').AsString := cds2.FieldByName('CCOSID').AsString;
         xC1 := Copy('Cuenta : ' + cds2.FieldByName('CUENTAID').AsString + '                     ', 1, 20);
         cds1.FieldByName('CNTGLOSA').AsString := xC1 + 'Total Movimiento:';
         cds1.FieldByName('TCC').AsString := '01';
         cds1.FieldByName('TIPO').AsString := '03';
         cds1.FieldByName('RANGO').AsString := 'Desde ' + DateToStr(dbdtpFReg1.Date) + ' Hasta ' + DateToStr(dbdtpFReg2.Date);
         cds1.FieldByName('PERIODO').AsString := xAAAAMM;
         cds1.FieldByName('MONTODEBE').AsFloat := cds2.FieldByName('MONTODEBE').AsFloat;
         cds1.FieldByName('MONTOHABER').AsFloat := cds2.FieldByName('MONTOHABER').AsFloat;
         cds1.FieldByName('TDIARID').AsString := '00';
         cds1.FieldByName('CNTCOMPROB').AsString := '0000000000';

         cds1.Insert;
         cds1.FieldByName('CUENTAID').AsString := cds2.FieldByName('CUENTAID').AsString;
         cds1.FieldByName('CCOSID').AsString := cds2.FieldByName('CCOSID').AsString;
         cds1.FieldByName('CNTGLOSA').AsString := '                    Saldo Final      :';
         cds1.FieldByName('TCC').AsString := '01';
         cds1.FieldByName('TIPO').AsString := '04';
         cds1.FieldByName('RANGO').AsString := 'Desde ' + DateToStr(dbdtpFReg1.Date) + ' Hasta ' + DateToStr(dbdtpFReg2.Date);
         cds1.FieldByName('PERIODO').AsString := xAAAAMM;
         If cds2.FieldByName('SALFIN').AsFloat >= 0 Then
            cds1.FieldByName('MONTODEBE').AsFloat := cds2.FieldByName('SALFIN').AsFloat
         Else
            cds1.FieldByName('MONTOHABER').AsFloat := cds2.FieldByName('SALFIN').AsFloat;
         cds1.FieldByName('TDIARID').AsString := '00';
         cds1.FieldByName('CNTCOMPROB').AsString := '0000000000';
         xTotSALINI := xTotSALINI + cds2.FieldByName('SALINI').AsFloat;
         xTotMONTODEBE := xTotMONTODEBE + cds2.FieldByName('MONTODEBE').AsFloat;
         xTotMONTOHABER := xTotMONTOHABER + cds2.FieldByName('MONTOHABER').AsFloat;
         xTotSALFIN := xTotSALFIN + cds2.FieldByName('SALFIN').AsFloat;

         cds2.Next;
      End;

   // TOTAL POR CCOSTO
      cds1.Insert;
      cds1.FieldByName('CCOSID').AsString := cds2.FieldByName('CCOSID').AsString;
      cds1.FieldByName('CNTGLOSA').AsString := '                    Saldo Anterior    :';
      cds1.FieldByName('TCC').AsString := '02';
      cds1.FieldByName('TIPO').AsString := '02';
      cds1.FieldByName('RANGO').AsString := 'Desde ' + DateToStr(dbdtpFReg1.Date) + ' Hasta ' + DateToStr(dbdtpFReg2.Date);
      cds1.FieldByName('PERIODO').AsString := xAAAAMM;
      If xTotSALINI >= 0 Then
         cds1.FieldByName('MONTODEBE').AsFloat := xTotSALINI
      Else
         cds1.FieldByName('MONTOHABER').AsFloat := xTotSALINI;
      cds1.FieldByName('TDIARID').AsString := '00';
      cds1.FieldByName('CNTCOMPROB').AsString := '0000000000';

      cds1.Insert;
      cds1.FieldByName('CCOSID').AsString := cds2.FieldByName('CCOSID').AsString;
      xC1 := Copy('C.Costo: ' + cds2.FieldByName('CCOSID').AsString + '                    ', 1, 20);
      cds1.FieldByName('CNTGLOSA').AsString := xC1 + 'Total Movimiento :';
      cds1.FieldByName('TCC').AsString := '02';
      cds1.FieldByName('TIPO').AsString := '03';
      cds1.FieldByName('RANGO').AsString := 'Desde ' + DateToStr(dbdtpFReg1.Date) + ' Hasta ' + DateToStr(dbdtpFReg2.Date);
      cds1.FieldByName('PERIODO').AsString := xAAAAMM;
      cds1.FieldByName('MONTODEBE').AsFloat := xTotMONTODEBE;
      cds1.FieldByName('MONTOHABER').AsFloat := xTotMONTOHABER;
      cds1.FieldByName('TDIARID').AsString := '00';
      cds1.FieldByName('CNTCOMPROB').AsString := '0000000000';

      cds1.Insert;
      cds1.FieldByName('CCOSID').AsString := cds2.FieldByName('CCOSID').AsString;
      cds1.FieldByName('CNTGLOSA').AsString := '                    Saldo Final      :';
      cds1.FieldByName('TCC').AsString := '02';
      cds1.FieldByName('TIPO').AsString := '04';
      cds1.FieldByName('RANGO').AsString := 'Desde ' + DateToStr(dbdtpFReg1.Date) + ' Hasta ' + DateToStr(dbdtpFReg2.Date);
      cds1.FieldByName('PERIODO').AsString := xAAAAMM;
      If cds2.FieldByName('SALFIN').AsFloat >= 0 Then
         cds1.FieldByName('MONTODEBE').AsFloat := xTotSALFIN
      Else
         cds1.FieldByName('MONTOHABER').AsFloat := xTotSALFIN;

      xCC := cds2.FieldByName('CCOSID').AsString;
      cds1.FieldByName('TDIARID').AsString := '00';
      cds1.FieldByName('CNTCOMPROB').AsString := '0000000000';

   End;

End;

Procedure TFCtroCosto.BitBtn1Click(Sender: TObject);
Begin
   fTexto := 'S';
   bbtnOkClick(Self);
   fTexto := 'N';
End;

Procedure TFCtroCosto.FormActivate(Sender: TObject);
Begin
   fTexto := 'N';
End;

Procedure TFCtroCosto.fg_GeneraExcel;
Begin
   dbgExcel.Selected.Clear;
   dbgExcel.Selected.Add('TDIARID'#9'8'#9'TipoDiario'#9'F');
   dbgExcel.Selected.Add('CUENTAID'#9'8'#9'CuentaId'#9'F');
   dbgExcel.Selected.Add('CTADES'#9'8'#9'Cuenta'#9'F');
   dbgExcel.Selected.Add('CCOSID'#9'8'#9'CcostoId'#9'F');
   dbgExcel.Selected.Add('CCOSABR'#9'8'#9'CentroCosto'#9'F');
   dbgExcel.Selected.Add('CNTCOMPROB'#9'8'#9'NºComprob'#9'F');
   dbgExcel.Selected.Add('CNTGLOSA'#9'40'#9'Glosa'#9'F');
   dbgExcel.Selected.Add('CNTFCOMP'#9'8'#9'FComprob'#9'F');
   dbgExcel.Selected.Add('CNTFEMIS'#9'8'#9'FEmision'#9'F');
   dbgExcel.Selected.Add('MONTODEBE'#9'8'#9'Debe'#9'F');
   dbgExcel.Selected.Add('MONTOHABER'#9'8'#9'Haber'#9'F');
   dbgExcel.DataSource := ds1;
   Try
      Screen.Cursor := crHourGlass;
      dbgExcel.ExportOptions.ExportType := wwgetSYLK;
      dbgExcel.ExportOptions.FileName := 'AnalisisCC' + '.slk';
      dbgExcel.ExportOptions.Save; //el primero genera error
      dbgExcel.ExportOptions.Save;
      ShellExecute(Handle, 'Open', PChar(dbgExcel.exportoptions.Filename), Nil, Nil, sw_shownormal);
      Screen.Cursor := crDefault;
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;
End;

Procedure TFCtroCosto.btnExportarExcelClick(Sender: TObject);
Begin
   xbExportarExcel := True;
   bbtnOkClick(Self);
   xbExportarExcel := False;
End;

Procedure TFCtroCosto.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;

End.

