Unit CNT202;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : CNT202
//Formulario               : FCCuadreMovs
//Fecha de Creación        :
//Autor                    : Equipo de desarrollo
//Objetivo                 : Reporte de Diario General

//ACTUALIZACIONES
//HPC_201206_CNT 16/10/2012:  Exportacion a excel del reporte de Diario General
//HPC_2013XX_CNT 31/07/2013   RMEDINA se adiciona la generacion del archivo texto para la Planilla electronica PLE
Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Wwdbdlg, wwdbdatetimepicker, StdCtrls, ExtCtrls, wwdblook, Buttons, Mask,
   wwdbedit, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB,
   ppDBPipe, ppBands, ppCtrls, ppVar, ppPrnabl, Spin, ppViewr, ppEndUsr,
  //INICIO HPC_201206_CNT
   wwclient, wwExport, shellapi,
  //FIN HPC_201206_CNT
   ppTypes, oaVariables, ppParameter, Grids, Wwdbigrd, Wwdbgrid, DB,
  //Inicio HPC_2013XX_CNT
  //DBClient;
   DBClient, FileCtrl;
  //Final HPC_2013XX_CNT

Type
   TFCCuadreMovs = Class(TForm)
      pnlCuadreMovs: TPanel;
      lblCia: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      rgEstado: TRadioGroup;
      rgListado: TRadioGroup;
      ppdbMovCntD: TppDBPipeline;
      pprCuadreMovsD: TppReport;
      ppdbMovCntR: TppDBPipeline;
      GroupBox1: TGroupBox;
      ckTDiario: TCheckBox;
      dblcTDiario: TwwDBLookupCombo;
      edtTDiario: TEdit;
      dbeLote: TwwDBEdit;
      ckLote: TCheckBox;
      gbPer: TGroupBox;
      speAno: TSpinEdit;
      speMM: TSpinEdit;
      Label2: TLabel;
      dbdtpFReg1: TwwDBDateTimePicker;
      dbdtpFReg2: TwwDBDateTimePicker;
      pprCuadreMovsR: TppReport;
      gbNivel: TGroupBox;
      dblcNivel: TwwDBLookupCombo;
      Label1: TLabel;
      ppdbDiario: TppDBPipeline;
      pprDiario: TppReport;
      ppd1: TppDesigner;
      rgMoneda: TRadioGroup;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppLabel18: TppLabel;
      ppLabel6: TppLabel;
      ppLabel13: TppLabel;
      ppLabel19: TppLabel;
      ppLabel4: TppLabel;
      ppLabel3: TppLabel;
      ppLabel7: TppLabel;
      ppLabel2: TppLabel;
      ppLabel40: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppLabel50: TppLabel;
      ppLabel51: TppLabel;
      pplblCiaR: TppLabel;
      ppLabel1: TppLabel;
      ppLabel15: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel42: TppLabel;
      pplblDel: TppLabel;
      pplblFecini: TppLabel;
      pplblAl: TppLabel;
      pplblFecfin: TppLabel;
      ppLabel16: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel17: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel59: TppLabel;
      ppLabel60: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText2: TppDBText;
      ppDBText24: TppDBText;
      ppDBText3: TppDBText;
      ppDBText6: TppDBText;
      ppVariable1: TppVariable;
      ppDBText4: TppDBText;
      ppDBText29: TppDBText;
      ppDBText5: TppDBText;
      ppDBText26: TppDBText;
      ppDBText27: TppDBText;
      ppDBText30: TppDBText;
      ppDBText31: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLabel54: TppLabel;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppDBCalc17: TppDBCalc;
      ppDBCalc18: TppDBCalc;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppLabel5: TppLabel;
      TDIARID: TppDBText;
      ppDBText34: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppLabel46: TppLabel;
      ppDBText32: TppDBText;
      ppLabel61: TppLabel;
      ppParameterList2: TppParameterList;
      cbCta: TCheckBox;
      dblcdCta: TwwDBLookupComboDlg;
      gbFecRep: TGroupBox;
      dtpFecRep: TwwDBDateTimePicker;
      ppParameterList3: TppParameterList;
      ppHeaderBand3: TppHeaderBand;
      ppDBText9: TppDBText;
      ppLabel69: TppLabel;
      ppLabel70: TppLabel;
      ppLabel71: TppLabel;
      ppLabel74: TppLabel;
      ppLabel73: TppLabel;
      ppLabel75: TppLabel;
      ppLabel76: TppLabel;
      ppsvFec: TppSystemVariable;
      ppsvHor: TppSystemVariable;
      ppSystemVariable9: TppSystemVariable;
      ppLabel82: TppLabel;
      ppDBText45: TppDBText;
      ppLabel83: TppLabel;
      ppDBText46: TppDBText;
      ppLabel12: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppDBText37: TppDBText;
      ppDBText38: TppDBText;
      ppDBText43: TppDBText;
      ppDBText44: TppDBText;
      ppSummaryBand3: TppSummaryBand;
      ppLabel77: TppLabel;
      ppDBCalc25: TppDBCalc;
      ppDBCalc26: TppDBCalc;
      ppLabel78: TppLabel;
      ppLabel80: TppLabel;
      ppGroup5: TppGroup;
      ppGroupHeaderBand5: TppGroupHeaderBand;
      ppLabel67: TppLabel;
      ppDBText41: TppDBText;
      ppDBText42: TppDBText;
      ppGroupFooterBand5: TppGroupFooterBand;
      ppDBCalc23: TppDBCalc;
      ppLabel68: TppLabel;
      ppDBCalc24: TppDBCalc;
      ppLabel79: TppLabel;
      ppDBText39: TppDBText;
      ppDBText40: TppDBText;
      pplFec: TppLabel;
      cbFecRep: TCheckBox;
      ppHeaderBand2: TppHeaderBand;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel14: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel29: TppLabel;
      ppLabel32: TppLabel;
      ppLabel34: TppLabel;
      pplblCiaD: TppLabel;
      pplblFecIniD: TppLabel;
      ppLabel31: TppLabel;
      pplblFecFinD: TppLabel;
      ppLabel35: TppLabel;
      ppLabel10: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppsvFecD: TppSystemVariable;
      ppSystemVariable4: TppSystemVariable;
      ppSystemVariable5: TppSystemVariable;
      ppLabel39: TppLabel;
      ppLabel41: TppLabel;
      ppLabel45: TppLabel;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppLabel11: TppLabel;
      ppLabel30: TppLabel;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText8: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppLabel38: TppLabel;
      ppLabel58: TppLabel;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppLabel52: TppLabel;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppLabel43: TppLabel;
      ppLabel57: TppLabel;
      ppLabel44: TppLabel;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppLabel53: TppLabel;
      ppDBText22: TppDBText;
      ppLabel72: TppLabel;
      ppDBText23: TppDBText;
      ppLabel81: TppLabel;
      ppDBText25: TppDBText;
      ppLabel92: TppLabel;
      ppDBText28: TppDBText;
      ppLabel93: TppLabel;
      ppDBText33: TppDBText;
      ppLabel94: TppLabel;
      ppDBText57: TppDBText;
      ppLabel33: TppLabel;
      ppDBText7: TppDBText;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppLabel95: TppLabel;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBCalc19: TppDBCalc;
      ppLabel55: TppLabel;
      ppLabel56: TppLabel;
      pplFecD: TppLabel;
      dbgDatosReporte: TwwDBGrid;
      gbBotones: TGroupBox;
      bbtnA4: TBitBtn;
      btnExportarExcel: TBitBtn;
      BtnPLE: TBitBtn;
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcTDiarioExit(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure ppVariable1Calc(Sender: TObject; Var Value: Variant);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbeLoteExit(Sender: TObject);
      Procedure ckTDiarioClick(Sender: TObject);
      Procedure ckLoteClick(Sender: TObject);
      Procedure gbPerExit(Sender: TObject);
      Procedure dbdtpFReg1Exit(Sender: TObject);
      Procedure dbdtpFReg2Exit(Sender: TObject);
      Procedure pprCuadreMovsRPreviewFormCreate(Sender: TObject);
      Procedure pprCuadreMovsDPreviewFormCreate(Sender: TObject);
      Procedure ppDBCalc13Calc(Sender: TObject);
      Procedure ppDBCalc14Calc(Sender: TObject);
      Procedure ppDBCalc15Calc(Sender: TObject);
      Procedure ppDBCalc16Calc(Sender: TObject);
      Procedure ppDBCalc17Calc(Sender: TObject);
      Procedure ppDBCalc18Calc(Sender: TObject);
      Procedure ppLabel33Print(Sender: TObject);
      Procedure ppLabel53Print(Sender: TObject);
      Procedure rgListadoClick(Sender: TObject);
      Procedure dblcNivelExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnCancClick(Sender: TObject);
      Procedure cbCtaClick(Sender: TObject);
      Procedure bbtnA4Click(Sender: TObject);
      Procedure ppHeaderBand3BeforePrint(Sender: TObject);
      Procedure cbFecRepClick(Sender: TObject);
      Procedure ppHeaderBand2BeforePrint(Sender: TObject);
      Procedure btnExportarExcelClick(Sender: TObject);
      Procedure BtnPLEClick(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure dblcCiaChange(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
   Private
    { Private declarations }
      xNivel: Integer;
      sLink: String;
    // vhn
      sCiaOrigen: String;
      sCiaCuenta: String;
      sA4: String;
    //INICIO HPC_201206_CNT
      xbExportarExcel: Boolean;
      Procedure fg_ExportarExcel(wgFormato: String);
    //FIN HPC_201206_CNT
    //Inicio HPC_2013XX_CNT
      Procedure fg_HabilitabotonPLE();
    //Final HPC_2013XX_CNT
   Public
    { Public declarations }
   End;

Var
   vreal, TD, TH: DOUBLE;
   FCCuadreMovs: TFCCuadreMovs;
   vstr, xFiltro, xWhere: String;

Implementation

Uses CNTDM, CNT998, CNT202A;

{$R *.DFM}

Procedure TFCCuadreMovs.dblcCiaExit(Sender: TObject);
Var
   xSQL: String;
Begin
   TD := 0;
   edtCia.Text := '';
   If dblcCia.Text <> '' Then edtCia.Text := DMCNT.cdsCia.FieldByName('CIADES').AsString;
   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   End;

   xSQL := 'SELECT CUENTAID, CTADES, CTAABR, ''N'' FLAG ' +
      'FROM TGE202 ' +
      'WHERE CIAID=' + QuotedStr(dblcCia.Text) + ' and CTA_DET=''S'' and CTAACT=''S''';

   DMCNT.cdsCuenta.fetchondemand := False;
   DMCNT.cdsCuenta.packetrecords := -1;
   DMCNT.cdsCuenta.fetchondemand := True;
   DMCNT.FiltraCDS(DMCNT.cdsCuenta, xSQL);
   DMCNT.cdsCuenta.IndexFieldNames := 'CUENTAID';

   sCiaCuenta := DMCNT.FiltraTablaxCia(DMCNT.cdsCuenta, 'TGE202', 'CUENTAID', dblcCia.Text);
   sCiaOrigen := DMCNT.FiltraTablaxCia(DMCNT.cdsTDiario, 'TGE104', 'TDIARID', dblcCia.Text);

   //Inicio HPC_2013XX_CNT
   fg_HabilitabotonPLE;
   //Fina HPC_2013XX_CNT
End;

Procedure TFCCuadreMovs.dblcTDiarioExit(Sender: TObject);
Begin
   edtTDiario.Text := '';
   If dblcTDiario.Text <> '' Then edtTDiario.Text := DMCNT.cdsTDiario.FieldByName('TDIARABR').AsString;
End;

Procedure TFCCuadreMovs.bbtnOkClick(Sender: TObject);
Var
   xSQL, xAAAAMM, xMes: String;
   x10: Integer;
   sLogV, sLogC: String;
Begin
   ppdbMovCntR.DataSource := Nil;
   ppdbMovCntD.DataSource := Nil;
   DMCNT.cdsQry.IndexFieldNames := '';
   DMCNT.cdsQry.Filtered := True;
//   DMCNT.cdsQry.Open;
   DMCNT.cdsQry.Close;

   If edtCia.Text = '' Then
   Begin
      ShowMessage('Compañía no válida');
      Raise exception.Create('Compañía no válida');
   End;

   If (dbdtpFReg1.Date = 0) Or (dbdtpFReg2.Date = 0) Then
   Begin
      ShowMessage('Fecha no válida');
      Raise exception.Create('Fecha no válida');
   End;
   DMCNT.cdsMovCnt2.Filter := '';

   If (ckTDiario.Checked) And (edtTDiario.Text = '') Then
   Begin
      ShowMessage('Seleccione un Tipo de Diario');
      Raise exception.Create('Seleccione un Tipo de Diario');
   End;

   If (ckLote.Checked) And (dbeLote.Text = '') Then
   Begin
      showmessage('Seleccione Lote');
      Raise exception.Create('Seleccione Lote');
   End;

   Screen.Cursor := crHourGlass;
   If rgListado.ItemIndex = 0 Then
   Begin
      xFiltro := 'CIAID=' + '''' + dblcCia.Text + ''''
         + ' and CNTFCOMP>=' + wRepFuncDate + '''' + formatdatetime(wFormatFecha, dbdtpFReg1.DateTime) + '''' + ')'
         + ' and CNTFCOMP<=' + wRepFuncDate + '''' + formatdatetime(wFormatFecha, dbdtpFReg2.DateTime) + '''' + ')';

      If DMCNT.strZero(speMM.Text, 2) = '00' Then
         xFiltro := xFiltro + ' and CNTANOMM=''' + speAno.Text + DMCNT.strZero(speMM.Text, 2) + '''';

      If dblcTDiario.Text <> '' Then
         xFiltro := xFiltro + ' and TDIARID=' + '''' + dblcTDiario.Text + ''' '
      Else
         If sCiaOrigen <> '' Then
            xFiltro := xFiltro + ' and ' + sCiaOrigen;

      If dbeLote.Text <> '' Then
         xFiltro := xFiltro + ' and CNTLOTE LIKE ' + '''' + dbeLote.Text + '%''';

      Case rgEstado.ItemIndex Of
         0:
            Begin // Activos
               xFiltro := xFiltro + ' and CNTESTADO=' + '''' + 'I' + '''';
            End;
         1:
            Begin // Aceptado
               xFiltro := xFiltro + ' and CNTESTADO=' + '''' + 'P' + '''' + ' and CNTCUADRE<>' + '''' + 'S' + '''';
            End;
         2:
            Begin // Contabilizado
               xFiltro := xFiltro + ' and CNTCUADRE=' + '''' + 'S' + '''';
            End;
      End;
   End
   Else
   Begin
      xFiltro := 'CNT301.CIAID=' + '''' + dblcCia.Text + ''''
         + ' and CNT301.CNTFCOMP>=' + wRepFuncDate + '''' + formatdatetime(wFormatFecha, dbdtpFReg1.DateTime) + '''' + ')'
         + ' and CNT301.CNTFCOMP<=' + wRepFuncDate + '''' + formatdatetime(wFormatFecha, dbdtpFReg2.DateTime) + '''' + ')';

      If DMCNT.strZero(speMM.Text, 2) = '00' Then
         xFiltro := xFiltro + ' and CNTANOMM=''' + speAno.Text + DMCNT.strZero(speMM.Text, 2) + '''';

      If dblcTDiario.Text <> '' Then
         xFiltro := xFiltro + ' and CNT301.TDIARID=' + '''' + dblcTDiario.Text + ''''
      Else
         If sCiaOrigen <> '' Then
            xFiltro := xFiltro + ' and CNT301.' + sCiaOrigen;

      If dbeLote.Text <> '' Then
         xFiltro := xFiltro + ' and CNTLOTE LIKE ' + '''' + dbeLote.Text + '%''';

      Case rgEstado.ItemIndex Of
         0:
            Begin // Activos
               xFiltro := xFiltro + ' and CNT301.CNTESTADO=' + '''' + 'I' + '''';
            End;
         1:
            Begin // Aceptado
               xFiltro := xFiltro + ' and CNT301.CNTESTADO=' + '''' + 'P' + '''' + ' and CNTCUADRE<>' + '''' + 'S' + '''';
            End;
         2:
            Begin // Contabilizado
               xFiltro := xFiltro + ' and CNT301.CNTCUADRE=' + '''' + 'S' + '''';
            End;
      End;
   End;
   //**

   Case rgListado.ItemIndex Of
      0:
         Begin // Resumido
            pplblCiaR.Text := edtCia.Text;
            If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
            Begin
               xSQL := 'Select CIAID, TDIARID, CNTANOMM, CNTCOMPROB,' +
                  ' TMONID, CNTFCOMP, CNTLOTE, CNTUSER, CNTTCAMBIO, CNTCUADRE, CNTESTADO,' +
                  ' CNTDEBEMN, CNTHABEMN, ' +
                  ' CASE WHEN TMONID=' + QuotedStr(DMCNT.wTMonExt) + ' THEN CNTDEBEME ELSE 0 END CNTDEBEME,' +
                  ' CASE WHEN TMONID=' + QuotedStr(DMCNT.wTMonExt) + ' THEN CNTHABEME ELSE 0 END CNTHABEME, TDIARDES' +
                  ' from CNT300 Where ' + xFiltro +
                  ' ORDER BY CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTFCOMP';
            End;
            If SRV_D = 'ORACLE' Then
            Begin
               xSQL := 'Select CIAID, TDIARID, CNTANOMM, CNTCOMPROB,' +
                  ' TMONID, CNTFCOMP, CNTLOTE, CNTUSER, CNTTCAMBIO, CNTCUADRE, CNTESTADO,' +
                  ' CNTDEBEMN, CNTHABEMN, ' +
                  ' DECODE(TMONID,' + QuotedStr(DMCNT.wTMonExt) + ',CNTDEBEME,0) CNTDEBEME,' +
                  ' DECODE(TMONID,' + QuotedStr(DMCNT.wTMonExt) + ',CNTHABEME,0) CNTHABEME, TDIARDES' +
                  ' from CNT300' + sLink + ' Where ' + xFiltro +
                  ' ORDER BY CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTFCOMP';
            End;
            DMCNT.cdsQry.Close;
            DMCNT.cdsQry.ProviderName := 'prvCNT';
            DMCNT.cdsQry.DataRequest(xSQL);
            DMCNT.cdsQry.FetchOnDemand := False;
            DMCNT.cdsQry.PacketRecords := -1;
            DMCNT.cdsQry.Open;
            DMCNT.cdsQry.FetchOnDemand := True;

            If DMCNT.cdsQry.RecordCount = 0 Then
            Begin
               Screen.Cursor := crDefault;
               Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas');
            End;
           //INICIO HPC_201206_CNT
            If xbExportarExcel = True Then
            Begin
               fg_ExportarExcel('FORMATO1');
               Exit;
            End;
           //FIN HPC_201206_CNT
            ppdbMovCntR.DataSource := DMCNT.dsQry;

           //  VHN 12/12/2001 - Para imprimir en Texto
            FImpresion := TFImpresion.Create(Self);
            FImpresion.ShowModal;
            If FImpresion.wFlTexto = 'C' Then
            Begin
               Screen.Cursor := crDefault;
               pprCuadreMovsR.Stop;
               DMCNT.cdsQry.CancelUpdates;
               DMCNT.cdsQry.IndexFieldNames := '';
               DMCNT.cdsQry.Filter := '';
               DMCNT.cdsQry.Filtered := True;
               DMCNT.cdsQry.FetchOnDemand := False;
               DMCNT.cdsQry.PacketRecords := -1;
               DMCNT.cdsQry.FetchOnDemand := True;
               Exit;
            End;
            If FImpresion.wFlTexto = 'G' Then
               pprCuadreMovsR.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ResumenComp1.rtm';
            If FImpresion.wFlTexto = 'T' Then
               pprCuadreMovsR.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ResumenComp1TX.rtm';

            pprCuadreMovsR.template.LoadFromFile;

            If wRptCia = 'Dema' Then
            Begin
               ppLabel49.Visible := False;
               ppLabel50.Visible := False;
               ppLabel51.Visible := False;
               ppDBText30.Visible := False;
               ppDBText31.Visible := False;
               ppDBCalc6.Visible := False;
               ppDBCalc8.Visible := False;
               ppDBCalc17.Visible := False;
               ppDBCalc18.Visible := False;
            End
            Else
            Begin
               ppLabel49.Visible := True;
               ppLabel50.Visible := True;
               ppLabel51.Visible := True;
               ppDBText30.Visible := True;
               ppDBText31.Visible := True;
               ppDBCalc6.Visible := True;
               ppDBCalc8.Visible := True;
               ppDBCalc17.Visible := True;
               ppDBCalc18.Visible := True;
            End;

           //**
            pplblFecIni.Caption := datetostr(dbdtpFReg1.Date);
            pplblFecFin.Caption := datetostr(dbdtpFReg2.Date);
            pplblCiaR.CAPTION := edtCia.TEXT;
            Screen.Cursor := crDefault;

            DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Diario General',
               dblcCia.Text, // Campañía
               speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
               dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
               dblcNivel.Text, dblcTDiario.Text, // Nivel   - Origen
               dbeLote.Text, inttostr(rgMoneda.itemindex), // Lote    -  Moneda
               dblcdCta.Text, '', // Cuentas - Auxiliares
               '', 'Impresora', // Costos - Tipo Salida
               inttostr(rgListado.itemindex)); // Tipo Rep

            pprCuadreMovsR.Print;
            pprCuadreMovsR.Stop;

            x10 := Self.ComponentCount - 1;
            While x10 >= 0 Do
            Begin
               If Self.Components[x10].ClassName = 'TppGroup' Then
               Begin
                  Self.Components[x10].Free;
               End;
               x10 := x10 - 1;
            End;

            DMCNT.cdsQry.CancelUpdates;
         End;
      1:
         Begin // Detallado
            pplblCiaD.Text := edtCia.Text;
            If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
            Begin
               If UpperCase(wRutaRpt) = 'RTMs\CNT\INCORESA' Then
                  xSQL := 'Select CNT301.CIAID,CNT301.CUENTAID,CNT301.CLAUXID,CNT301.AUXID,'
                     + ' CNT301.AUXID,CNT301.DOCID,CNT301.CNTSERIE,CNT301.CNTNODOC,CNT301.CNTGLOSA,'
                     + ' CNT301.CCOSID, COALESCE( CNT301.CNTDEBEMN,0) CNTDEBEMN, COALESCE(CNT301.CNTHABEMN,0) CNTHABEMN, '
                     + ' CASE WHEN TMONID=' + QuotedStr(DMCNT.wTMonExt) + ' THEN CNT301.CNTDEBEME ELSE 0 END CNTDEBEME, '
                     + ' CASE WHEN TMONID=' + QuotedStr(DMCNT.wTMonExt) + ' THEN CNT301.CNTHABEME ELSE 0 END CNTHABEME, '
                     + ' CNT301.CTADES,CNT301.DOCDES,TDIARID,TDIARDES,CNTFCOMP,CNTANOMM,CNTCOMPROB,SUBSTR(CNTCOMPROB,3,8) AS NROCOMPROB,'
                     + ' CNTLOTE,TMONID,CNTFVCMTO,CNTREG,SUBSTR(CNTCOMPROB,1,2) AS NROCIA'
                     + ' from CNT301 '
                     + ' Where ' + xFiltro
                     + ' ORDER BY CNT301.TDIARID,CNT301.CNTCOMPROB, CNT301.CNTANOMM, CNT301.CNTREG,CNT301.CNTFCOMP'
               Else
                  xSQL := 'Select CNT301.CIAID,CNT301.CUENTAID,CNT301.CLAUXID,CNT301.AUXID,'
                     + ' CNT301.AUXID,CNT301.DOCID,CNT301.CNTSERIE,CNT301.CNTNODOC,CNT301.CNTGLOSA,'
                     + ' CNT301.CCOSID,CNT301.CNTDEBEMN,CNT301.CNTHABEMN,CNT301.CNTDEBEME,CNTHABEME,'
                     + ' CNT301.CTADES,CNT301.DOCDES,TDIARID,TDIARDES,CNTFCOMP,CNTANOMM,CNTCOMPROB,'
                     + ' CNTLOTE,TMONID,CNTFVCMTO, CNTREG, SUBSTR(CNTCOMPROB,1,2) AS NROCIA'
                     + ' from CNT301' + sLink + ' '
                     + ' Where ' + xFiltro
                     + ' ORDER BY CNT301.CIAID, CNT301.TDIARID, CNT301.CNTANOMM, CNT301.CNTCOMPROB, CNT301.CNTFCOMP';
            End
            Else
               If SRV_D = 'ORACLE' Then
               Begin
                  If rgMoneda.ItemIndex = 0 Then
                  Begin
                     xSQL := 'Select CNT301.CIAID,CNT301.CUENTAID,CNT301.CLAUXID,CNT301.AUXID,'
                        + ' CNT301.AUXID,CNT301.DOCID,CNT301.CNTSERIE,CNT301.CNTNODOC,CNT301.CNTGLOSA,'
                        + ' CNT301.CCOSID, NVL( CNT301.CNTDEBEMN,0) CNTDEBEMN, NVL(CNT301.CNTHABEMN,0) CNTHABEMN, '
                        + ' DECODE(TMONID,' + QuotedStr('D') + ',NVL(CNT301.CNTDEBEME,0),0) CNTDEBEME, '
                        + ' DECODE(TMONID,' + QuotedStr('D') + ',NVL(CNT301.CNTHABEME,0),0) CNTHABEME, '
                        + ' CNT301.CTADES,CNT301.DOCDES,TDIARID,TDIARDES,CNTFCOMP,CNTANOMM,CNTCOMPROB,SUBSTR(CNTCOMPROB,3,8) AS NROCOMPROB,'
                        + ' CNTLOTE,TMONID,CNTFVCMTO,CNTREG,SUBSTR(CNTCOMPROB,1,2) AS NROCIA'
                        + ' from CNT301' + sLink + ' '
                        + ' Where ' + xFiltro
                        + ' ORDER BY CNT301.TDIARID,CNT301.CNTCOMPROB, CNT301.CNTANOMM, CNT301.CNTREG,CNT301.CNTFCOMP';
                  End;
                  If rgMoneda.ItemIndex = 1 Then
                  Begin
                     xSQL := 'Select CNT301.CIAID,CNT301.CUENTAID,CNT301.CLAUXID,CNT301.AUXID,'
                        + ' CNT301.AUXID,CNT301.DOCID,CNT301.CNTSERIE,CNT301.CNTNODOC,CNT301.CNTGLOSA,'
                        + ' CNT301.CCOSID, NVL( CNT301.CNTDEBEMN,0) CNTDEBEMN, NVL(CNT301.CNTHABEMN,0) CNTHABEMN, '
                        + ' NVL(CNT301.CNTDEBEME,0) CNTDEBEME, '
                        + ' NVL(CNT301.CNTHABEME,0) CNTHABEME, '
                        + ' CNT301.CTADES,CNT301.DOCDES,TDIARID,TDIARDES,CNTFCOMP,CNTANOMM,CNTCOMPROB,SUBSTR(CNTCOMPROB,3,8) AS NROCOMPROB,'
                        + ' CNTLOTE,TMONID,CNTFVCMTO,CNTREG,SUBSTR(CNTCOMPROB,1,2) AS NROCIA'
                        + ' from CNT301' + sLink + ' '
                        + ' Where ' + xFiltro
                        + ' AND ( NVL(CNT301.CNTDEBEME,0)>0 OR NVL(CNT301.CNTHABEME,0)>0 ) '
                        + ' ORDER BY CNT301.TDIARID,CNT301.CNTCOMPROB, CNT301.CNTANOMM, CNT301.CNTREG,CNT301.CNTFCOMP';
                  End;
                  If rgMoneda.ItemIndex = 2 Then
                  Begin
                     xSQL := 'Select CNT301.CIAID,CNT301.CUENTAID,CNT301.CLAUXID,CNT301.AUXID,'
                        + ' CNT301.AUXID,CNT301.DOCID,CNT301.CNTSERIE,CNT301.CNTNODOC,CNT301.CNTGLOSA,'
                        + ' CNT301.CCOSID, NVL( CNT301.CNTDEBEMN,0) CNTDEBEMN, NVL(CNT301.CNTHABEMN,0) CNTHABEMN, '
                        + ' NVL(CNT301.CNTDEBEME,0) CNTDEBEME, '
                        + ' NVL(CNT301.CNTHABEME,0) CNTHABEME, '
                        + ' CNT301.CTADES,CNT301.DOCDES,TDIARID,TDIARDES,CNTFCOMP,CNTANOMM,CNTCOMPROB,SUBSTR(CNTCOMPROB,3,8) AS NROCOMPROB,'
                        + ' CNTLOTE,TMONID,CNTFVCMTO,CNTREG,SUBSTR(CNTCOMPROB,1,2) AS NROCIA'
                        + ' from CNT301' + sLink + ' '
                        + ' Where ' + xFiltro
                        + ' ORDER BY CNT301.TDIARID,CNT301.CNTCOMPROB, CNT301.CNTANOMM, CNT301.CNTREG,CNT301.CNTFCOMP';
                  End;
               End;

            DMCNT.cdsQry.Close;
            DMCNT.cdsQry.ProviderName := 'prvCNT';
            DMCNT.cdsQry.DataRequest(xSQL);
            DMCNT.cdsQry.FetchOnDemand := False;
            DMCNT.cdsQry.PacketRecords := 100;
            DMCNT.cdsQry.Open;
            DMCNT.cdsQry.FetchOnDemand := True;

            If DMCNT.cdsQry.RecordCount = 0 Then
               Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas');

           //INICIO HPC_201206_CNT
            If xbExportarExcel = True Then
            Begin
               fg_ExportarExcel('FORMATO2');
               Exit;
            End;
           //FIN HPC_201206_CNT

            ppdbMovCntD.DataSource := DMCNT.dsQry;

            If sA4 = 'S' Then
            Begin
               If rgMoneda.ItemIndex = 0 Then
               Begin
                  pprCuadreMovsD.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\DetalleCompSTX_A4.rtm';
               End;
               If rgMoneda.ItemIndex = 1 Then
               Begin
                  pprCuadreMovsD.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\DetalleCompDTX.rtm';
               End;
               If rgMoneda.ItemIndex = 2 Then
               Begin
                  pprCuadreMovsD.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\DetalleCompATX_A4.rtm';
               End;
            End
            Else
            Begin
               If rgMoneda.ItemIndex = 0 Then
               Begin
                  pprCuadreMovsD.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\DetalleCompSTX.rtm';
               End;
               If rgMoneda.ItemIndex = 1 Then
               Begin
                  pprCuadreMovsD.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\DetalleCompDTX.rtm';
               End;
               If rgMoneda.ItemIndex = 2 Then
               Begin
                  pprCuadreMovsD.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\DetalleCompATX.rtm';
               End;
            End;

            pprCuadreMovsD.template.LoadFromFile;
           //**
            pplblFecIniD.Caption := datetostr(dbdtpFReg1.Date);
            pplblFecFinD.Caption := datetostr(dbdtpFReg2.Date);
            pplblCiaD.CAPTION := edtCia.TEXT;
            Screen.Cursor := crDefault;

            ppd1.Report := pprCuadreMovsD;

            DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Diario General',
               dblcCia.Text, // Campañía
               speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
               dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
               dblcNivel.Text, dblcTDiario.Text, // Nivel   - Origen
               dbeLote.Text, inttostr(rgMoneda.itemindex), // Lote    -  Moneda
               dblcdCta.Text, '', // Cuentas - Auxiliares
               '', 'Impresora', // Costos - Tipo Salida
               inttostr(rgListado.itemindex)); // Tipo Rep

            If cbDisenoRep.Checked Then
               ppd1.ShowModal
            Else
            Begin
               pprCuadreMovsD.Print;
               pprCuadreMovsD.Stop;

               x10 := Self.ComponentCount - 1;
               While x10 >= 0 Do
               Begin
                  If Self.Components[x10].ClassName = 'TppGroup' Then
                  Begin
                     Self.Components[x10].Free;
                  End;
                  x10 := x10 - 1;
               End;
            End;
         End;

      2:
         Begin // Diario / Cuenta

            If xNivel <= 0 Then
            Begin
               ShowMessage('Error : Falta seleccionar el Nivel de Cuenta');
               Exit;
            End;

            xMes := IntToStr(strtoInt(speMM.text));

            xSQL := 'Select * from TGE181 WHERE MESID=''' + xMes + '''';
            DMCNT.cdsQry.Close;
            DMCNT.cdsQry.DataRequest(xSQL);
            DMCNT.cdsQry.Open;

            xAAAAMM := 'MES DE ' + DMCNT.cdsQry.FieldByName('MESDESL').AsString + ' DE ' + speAno.Text;

            xSQL := 'SELECT ''' + xAAAAMM + ''' PERIODO, A.CIAID, B.CIADES, A.TDIARID, C.TDIARDES, A.CNTANOMM, A.CUENTAID, D.CTADES, '
               + 'CNTDEBEMN, CNTHABEMN, CNTDEBEME, CNTHABEME, '
               + '''Desde ' + dbdtpFReg1.Text + ' Hasta ' + dbdtpFReg2.Text + ''' RANGO '
               + 'FROM ( '
               + 'SELECT CIAID, TDIARID, CNTANOMM, TRIM(CTANIV) CUENTAID, '
               + 'SUM( NVL(CNTDEBEMN,0) ) CNTDEBEMN, SUM( NVL(CNTHABEMN,0) ) CNTHABEMN, '
               + 'SUM( NVL(CNTDEBEME,0) ) CNTDEBEME, SUM( NVL(CNTHABEME,0) ) CNTHABEME '
               + 'FROM ( '
               + 'Select CIAID, TDIARID, CNTANOMM, CUENTAID, SUBSTR(CUENTAID,1,' + IntToStr(xNivel) + ') CTANIV, '
               + 'SUM( NVL(CNTDEBEMN,0) ) CNTDEBEMN, SUM( NVL(CNTHABEMN,0) ) CNTHABEMN, '
               + 'SUM( NVL(CNTDEBEME,0) ) CNTDEBEME, SUM( NVL(CNTHABEME,0) ) CNTHABEME '
               + 'from CNT301' + sLink + ' '
               + 'WHERE CIAID=''' + dblcCia.Text + ''' AND CNTANOMM=''' + speAno.Text + DMCNT.StrZero(speMM.Text, 2) + ''' '
               + ' and CNT301.CNTFCOMP>=' + wRepFuncDate + '''' + formatdatetime(wFormatFecha, dbdtpFReg1.DateTime) + '''' + ')'
               + ' and CNT301.CNTFCOMP<=' + wRepFuncDate + '''' + formatdatetime(wFormatFecha, dbdtpFReg2.DateTime) + '''' + ')';

            If dbeLote.Text <> '' Then
               xSQL := xSQL + ' and CNTLOTE LIKE ' + '''' + dbeLote.Text + '%''';

            If dblcdCta.Text <> '' Then
               xSQL := xSQL + ' and CUENTAID LIKE ' + '''' + dblcdCta.Text + '%'''
            Else
               If sCiaCuenta <> '' Then
                  xSQL := xSQL + ' and ' + sCiaCuenta;

            xSQL := xSQL + 'GROUP BY CIAID, TDIARID, CNTANOMM, CUENTAID '
               + ') A '
               + 'GROUP BY CIAID, TDIARID, CNTANOMM, CTANIV '
               + ') A, TGE101 B, TGE104 C, TGE202 D '
               + 'WHERE A.CIAID=B.CIAID '
               + 'AND A.TDIARID=C.TDIARID(+) '
               + 'AND A.CIAID=D.CIAID(+) AND A.CUENTAID=TRIM(D.CUENTAID) ';

            If dblcTDiario.Text <> '' Then
               xSQL := xSQL + ' and A.TDIARID=' + '''' + dblcTDiario.Text + ''' '
            Else
               If sCiaOrigen <> '' Then
                  xSQL := xSQL + ' and A.' + sCiaOrigen;

            xSQL := xSQL + 'ORDER BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CUENTAID ';

            DMCNT.cdsQry.Close;
            DMCNT.cdsQry.ProviderName := 'prvCNT';
            DMCNT.cdsQry.DataRequest(xSQL);
            DMCNT.cdsQry.Open;

           //INICIO HPC_201206_CNT
            If xbExportarExcel = True Then
            Begin
               fg_ExportarExcel('FORMATO3');
               Exit;
            End;
           //FIN HPC_201206_CNT
            ppdbDiario.DataSource := DMCNT.dsQry;

          //ppDesigner1.ShowModal;
            pprDiario.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\DiarioCuenta.rtm';
            pprDiario.template.LoadFromFile;

            DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Diario General',
               dblcCia.Text, // Campañía
               speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
               dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
               dblcNivel.Text, dblcTDiario.Text, // Nivel   - Origen
               dbeLote.Text, inttostr(rgMoneda.itemindex), // Lote    -  Moneda
               dblcdCta.Text, '', // Cuentas - Auxiliares
               '', 'Impresora', // Costos - Tipo Salida
               inttostr(rgListado.itemindex)); // Tipo Rep

            Screen.Cursor := crDefault;
            ppd1.Report := pprDiario;
            If cbDisenoRep.Checked Then
               ppd1.ShowModal
            Else
            Begin
               pprDiario.Print;
               ppdbDiario.DataSource := Nil;
               pprDiario.Stop;

               x10 := Self.ComponentCount - 1;
               While x10 >= 0 Do
               Begin
                  If Self.Components[x10].ClassName = 'TppGroup' Then
                  Begin
                     Self.Components[x10].Free;
                  End;
                  x10 := x10 - 1;
               End;
            End;   
         End;
      3:
         Begin // LOTE

            If xNivel <= 0 Then
            Begin
               ShowMessage('Error : Falta seleccionar el Nivel de Cuenta');
               Exit;
            End;

            xMes := IntToStr(strtoInt(speMM.text));

            xSQL := 'Select * from TGE181 WHERE MESID=''' + xMes + '''';
            DMCNT.cdsQry.Close;
            DMCNT.cdsQry.DataRequest(xSQL);
            DMCNT.cdsQry.Open;

            xAAAAMM := 'MES DE ' + DMCNT.cdsQry.FieldByName('MESDESL').AsString + ' DE ' + speAno.Text;

            xSQL := 'SELECT ''' + xAAAAMM + ''' PERIODO, A.CIAID, B.CIADES, A.TDIARID, C.TDIARDES, A.CNTANOMM, CNTLOTE, A.CUENTAID, D.CTADES, '
               + 'CNTDEBEMN, CNTHABEMN, CNTDEBEME, CNTHABEME, '
               + '''Desde ' + dbdtpFReg1.Text + ' Hasta ' + dbdtpFReg2.Text + ''' RANGO, '
               + 'CASE WHEN E.OFDESNOM IS NOT NULL THEN E.OFDESNOM ELSE '
               + 'CASE WHEN CNTLOTE=''APB1'' THEN ''BANCOS DEL MES'' ELSE '
               + 'CASE WHEN CNTLOTE=''APB2'' THEN ''BANCOS MESES ANTERIORES'' ELSE '
               + 'CASE WHEN CNTLOTE=''APO'' THEN ''COBRANZAS USES'' ELSE ''OTROS'' END '
               + 'END '
               + 'END '
               + 'END OFDESNOM '
               + 'FROM ( '
               + 'SELECT CIAID, TDIARID, CNTANOMM, CNTLOTE, TRIM(CTANIV) CUENTAID, '
               + 'SUM( NVL(CNTDEBEMN,0) ) CNTDEBEMN, SUM( NVL(CNTHABEMN,0) ) CNTHABEMN, '
               + 'SUM( NVL(CNTDEBEME,0) ) CNTDEBEME, SUM( NVL(CNTHABEME,0) ) CNTHABEME '
               + 'FROM ( '
               + 'Select CIAID, TDIARID, CNTANOMM, CNTLOTE, CUENTAID, SUBSTR(CUENTAID,1,' + IntToStr(xNivel) + ') CTANIV, '
               + 'SUM( NVL(CNTDEBEMN,0) ) CNTDEBEMN, SUM( NVL(CNTHABEMN,0) ) CNTHABEMN, '
               + 'SUM( NVL(CNTDEBEME,0) ) CNTDEBEME, SUM( NVL(CNTHABEME,0) ) CNTHABEME '
               + 'from CNT301' + sLink + ' '
               + 'WHERE CIAID=''' + dblcCia.Text + ''' AND CNTANOMM=''' + speAno.Text + DMCNT.StrZero(speMM.Text, 2) + ''' '
               + ' and CNT301.CNTFCOMP>=' + wRepFuncDate + '''' + formatdatetime(wFormatFecha, dbdtpFReg1.DateTime) + '''' + ')'
               + ' and CNT301.CNTFCOMP<=' + wRepFuncDate + '''' + formatdatetime(wFormatFecha, dbdtpFReg2.DateTime) + '''' + ')';

            If dbeLote.Text <> '' Then
               xSQL := xSQL + ' and CNTLOTE LIKE ' + '''' + dbeLote.Text + '%''';

            If dblcdCta.Text <> '' Then
               xSQL := xSQL + ' and CUENTAID LIKE ' + '''' + dblcdCta.Text + '%'' '
            Else
               If sCiaCuenta <> '' Then
                  xSQL := xSQL + ' and ' + sCiaCuenta;

            xSQL := xSQL + 'GROUP BY CIAID, TDIARID, CNTANOMM, CNTLOTE, CUENTAID '
               + ') A '
               + 'GROUP BY CIAID, TDIARID, CNTANOMM, CNTLOTE, CTANIV '
               + ') A, TGE101 B, TGE104 C, TGE202 D, APO110 E  '
               + 'WHERE A.CIAID=B.CIAID '
               + 'AND A.TDIARID=C.TDIARID(+) '
               + 'AND A.CIAID=D.CIAID(+) AND A.CUENTAID=TRIM(D.CUENTAID) '
               + 'and SUBSTR(CNTLOTE,3,2)=E.OFDESID(+) ';

            If dblcTDiario.Text <> '' Then
               xSQL := xSQL + ' and A.TDIARID=' + '''' + dblcTDiario.Text + ''' '
            Else
               If sCiaOrigen <> '' Then
                  xSQL := xSQL + ' and A.' + sCiaOrigen;

            xSQL := xSQL + 'ORDER BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CUENTAID, A.CNTLOTE ';

            DMCNT.cdsQry.Close;
            DMCNT.cdsQry.ProviderName := 'prvCNT';
            DMCNT.cdsQry.DataRequest(xSQL);
            DMCNT.cdsQry.Open;
           //INICIO HPC_201206_CNT
            If xbExportarExcel = True Then
            Begin
               fg_ExportarExcel('FORMATO4');
               Exit;
            End;
           //FIN HPC_201206_CNT
            ppdbDiario.DataSource := DMCNT.dsQry;

          //ppDesigner1.ShowModal;
            pprDiario.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\DiarioCuentaLote.rtm';
            pprDiario.template.LoadFromFile;

            Screen.Cursor := crDefault;

            ppd1.Report := pprDiario;

            DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Diario General',
               dblcCia.Text, // Campañía
               speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
               dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
               dblcNivel.Text, dblcTDiario.Text, // Nivel   - Origen
               dbeLote.Text, inttostr(rgMoneda.itemindex), // Lote    -  Moneda
               dblcdCta.Text, '', // Cuentas - Auxiliares
               '', 'Impresora', // Costos - Tipo Salida
               inttostr(rgListado.itemindex)); // Tipo Rep

            If cbDisenoRep.Checked Then
               ppd1.ShowModal
            Else
            Begin
               pprDiario.Print;
               ppdbDiario.DataSource := Nil;
               pprDiario.Stop;

               x10 := Self.ComponentCount - 1;
               While x10 >= 0 Do
               Begin
                  If Self.Components[x10].ClassName = 'TppGroup' Then
                  Begin
                     Self.Components[x10].Free;
                  End;
                  x10 := x10 - 1;
               End;
            End;
         End;
   End;
End;

Procedure TFCCuadreMovs.ppVariable1Calc(Sender: TObject;
   Var Value: Variant);
Begin
   With DMCNT Do
   Begin
      ppVariable1.Font.Size := 8;
      ppVariable1.Font.Style := ppVariable1.Font.Style - [fsBold];
      vstr := cdsQry.FieldByName('CNTCOMPROB').AsString;
      If cdsQry.FieldByName('CNTCUADRE').Value = 'S' Then
         ppVariable1.Text := ' CONTABILIZADO'
      Else
      Begin
         If cdsQry.FieldByName('CNTESTADO').Value = 'I' Then
            ppVariable1.Text := '   ACTIVO';
         If cdsQry.FieldByName('CNTESTADO').Value = 'P' Then
            ppVariable1.Text := ' ACEPTADO';
         If cdsQry.FieldByName('CNTESTADO').Value = 'A' Then
         Begin
            ppVariable1.Font.Size := 10;
            ppVariable1.Font.Style := ppVariable1.Font.Style + [fsBold];
            ppVariable1.Text := ' A N U L A D O ';
         End;
      End;
   End;
End;

Procedure TFCCuadreMovs.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMCNT.cdsMovCnt2.IndexFieldNames := '';
   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;
   Action := caFree;
End;

Procedure TFCCuadreMovs.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFCCuadreMovs.dbeLoteExit(Sender: TObject);
Begin
//   if strtoint(trim(dbeLote.Text))>0 then dbeLote.Text:=DMCNT.strzero( dbeLote.Text,4);
End;

Procedure TFCCuadreMovs.ckTDiarioClick(Sender: TObject);
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

   //Inicio HPC_2013XX_CNT
   fg_HabilitabotonPLE;
   //Fina HPC_2013XX_CNT

End;

Procedure TFCCuadreMovs.ckLoteClick(Sender: TObject);
Begin
   If Not (ckLote.Checked) Then
   Begin
      dbeLote.Text := '';
      dbeLote.Enabled := False;
   End
   Else
   Begin
      dbeLote.Enabled := True;
   End;

   //Inicio HPC_2013XX_CNT
   fg_HabilitabotonPLE;
   //Fina HPC_2013XX_CNT

End;

Procedure TFCCuadreMovs.gbPerExit(Sender: TObject);
Var
   xFecha1, xFecha2: TDateTime;
Begin
   If DMCNT.strZero(speMM.Text, 2) = '00' Then
      xFecha1 := strtodate('01/01/' + speAno.Text)
   Else
      xFecha1 := strtodate('01/' + DMCNT.strZero(speMM.Text, 2) + '/' + speAno.Text);

   If DMCNT.strZero(speMM.Text, 2) = '00' Then
      xFecha2 := strtodate('01/01/' + speAno.Text)
   Else
   Begin
      If strtofloat(speMM.Text) + 1 = 13 Then
      Begin
         xFecha2 := strtodate('01/01/' + FloatToStr(StrToFloat(speAno.Text) + 1));
      End
      Else
      Begin
         xFecha2 := strtodate('01/' + DMCNT.strZero(floattostr(strtofloat(speMM.Text) + 1), 2) + '/' + speAno.Text);
      End;
      xFecha2 := xFecha2 - 1;
   End;
   dbdtpFReg1.date := xFecha1;
   dbdtpFReg2.date := xFecha2;
End;

Procedure TFCCuadreMovs.dbdtpFReg1Exit(Sender: TObject);
Begin
   If dbdtpFReg1.date = 0 Then
   Begin
      dbdtpFReg1.SetFocus;
      ShowMessage('Error : Falta Registrar Fecha');
      Raise Exception.Create('Error : Falta Registrar Fecha');
   End;
End;

Procedure TFCCuadreMovs.dbdtpFReg2Exit(Sender: TObject);
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
      ShowMessage(' Error : Fecha debe ser Mayor');
      Raise Exception.Create(' Error : Fecha debe ser Mayor');
   End;

   //rgMoneda.Enabled    :=True ;
   //gbParametros.Enabled:=True ;

End;

Procedure TFCCuadreMovs.pprCuadreMovsRPreviewFormCreate(Sender: TObject);
Begin
   TppReport(Sender).PreviewForm.WindowState := WsMaximized;
   TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zsPageWidth;
End;

Procedure TFCCuadreMovs.pprCuadreMovsDPreviewFormCreate(Sender: TObject);
Begin
   TppReport(Sender).PreviewForm.WindowState := WsMaximized;
   TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zsPageWidth;
End;

Procedure TFCCuadreMovs.ppDBCalc13Calc(Sender: TObject);
Begin
   If DMCNT.cdsQry.FieldByName('CNTDEBEMN').AsString <> '' Then
      ppDBCalc13.Value := ppDBCalc13.Value + DMCNT.cdsQry.FieldByName('CNTDEBEMN').AsFloat;
End;

Procedure TFCCuadreMovs.ppDBCalc14Calc(Sender: TObject);
Begin
   If DMCNT.cdsQry.FieldByName('CNTHABEMN').AsString <> '' Then
      ppDBCalc14.Value := ppDBCalc14.Value + DMCNT.cdsQry.FieldByName('CNTHABEMN').AsFloat;
End;

Procedure TFCCuadreMovs.ppDBCalc15Calc(Sender: TObject);
Begin
   If DMCNT.cdsQry.FieldByName('CNTDEBEMN').AsString <> '' Then
      ppDBCalc15.Value := ppDBCalc15.Value + DMCNT.cdsQry.FieldByName('CNTDEBEMN').AsFloat;
End;

Procedure TFCCuadreMovs.ppDBCalc16Calc(Sender: TObject);
Begin
   If DMCNT.cdsQry.FieldByName('CNTHABEMN').AsString <> '' Then
      ppDBCalc16.Value := ppDBCalc16.Value + DMCNT.cdsQry.FieldByName('CNTHABEMN').AsFloat;
End;

Procedure TFCCuadreMovs.ppDBCalc17Calc(Sender: TObject);
Begin
   If DMCNT.cdsQry.FieldByName('CNTDEBEME').AsString <> '' Then
      ppDBCalc17.Value := ppDBCalc17.Value + DMCNT.cdsQry.FieldByName('CNTDEBEME').AsFloat;
End;

Procedure TFCCuadreMovs.ppDBCalc18Calc(Sender: TObject);
Begin
   If DMCNT.cdsQry.FieldByName('CNTHABEME').AsString <> '' Then
      ppDBCalc18.Value := ppDBCalc18.Value + DMCNT.cdsQry.FieldByName('CNTHABEME').AsFloat;
End;

{procedure TFCCuadreMovs.ppdbcTDCalc(Sender: TObject);
begin
    vstr:=DMCNT.cdsMovCnt2CNTComprob.Value;
    if DMCNT.cdsMovCnt2CNTDH.Value='D' then
       TD:=TD+DMCNT.cdsMovCnt2CntMtoLoc.Value;
//    ppdbcTD.Value:=TD;
//       ppdbcTD.Value:=(ppdbcTD.Value)+(DMCNT.cdsMovCnt2CntMtoLoc.Value);  // ???
end;

procedure TFCCuadreMovs.ppdbcTDPrint(Sender: TObject);
begin
//    if DMCNT.cdsMovCnt2CNTDH.Value='D' then ppdbcTD.Text:=floattostr(TD);
    vstr:=DMCNT.cdsMovCnt2CNTComprob.Value;
    ppdbcTD.Value:=TD;
end;

procedure TFCCuadreMovs.ppdbcTHCalc(Sender: TObject);
begin
    if DMCNT.cdsMovCnt2CNTDH.Value='H' then
       TH:=TH+DMCNT.cdsMovCnt2CntMtoLoc.Value;
//    ppdbcTH.Value:=TH;
//       ppdbcTH.Value:=(ppdbcTH.Value)+(DMCNT.cdsMovCnt2CntMtoLoc.Value);
//       ppdbcTH.Printing;   // ???
end;

procedure TFCCuadreMovs.ppdbcTHPrint(Sender: TObject);
begin
//    if DMCNT.cdsMovCnt2CNTDH.Value='H' then ppdbcTH.Text:=floattostr(TH);
    ppdbcTH.Value:=TH;
end;

procedure TFCCuadreMovs.ppdbcTDGroupBreak(Sender: TObject);
begin
     TD:=0;
end;

procedure TFCCuadreMovs.ppdbcTHGroupBreak(Sender: TObject);
begin
     TH:=0;
end;}

Procedure TFCCuadreMovs.ppLabel33Print(Sender: TObject);
Begin
   If ppDBText7.Text = '00' Then
   Begin
      ppDBText7.Visible := False;
      ppLabel33.Visible := False;
   End
   Else
   Begin
      ppDBText7.Visible := True;
      ppLabel33.Visible := True;
   End;

End;

Procedure TFCCuadreMovs.ppLabel53Print(Sender: TObject);
Begin
   If ppDBText7.Text = '00' Then
   Begin
      ppDBText7.Visible := False;
      ppLabel55.Visible := False;
   End
   Else
   Begin
      ppDBText7.Visible := True;
      ppLabel55.Visible := True;
   End;
End;

Procedure TFCCuadreMovs.rgListadoClick(Sender: TObject);
Begin
   gbNivel.Enabled := False;
   If (rgListado.ItemIndex = 2) Or (rgListado.ItemIndex = 3) Then
   Begin
      gbNivel.Enabled := True;
      DMCNT.cdsNivel.First;
   End;
   //Inicio HPC_2013XX_CNT
   fg_HabilitabotonPLE;
   //Fina HPC_2013XX_CNT
End;

Procedure TFCCuadreMovs.dblcNivelExit(Sender: TObject);
Begin
   xNivel := DMCNT.cdsNivel.FieldByName('DIGITOS').AsInteger;
End;

Procedure TFCCuadreMovs.FormShow(Sender: TObject);
Var
   xSQL: String;
   xAno, xMes, xDia: Word;
Begin
   //sLink:='@dbprodlee ';
   sLink := ' ';
   DMCNT.cdsMovCnt2.IndexFieldNames := '';
   DecodeDate(Date, xAno, xMes, xDia);
   speAno.Value := xAno;
   speMM.Value := xMes;
End;

Procedure TFCCuadreMovs.bbtnCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFCCuadreMovs.cbCtaClick(Sender: TObject);
Begin
   If Not (cbCta.Checked) Then
   Begin
      dblcdCta.Text := '';
      dblcdCta.Enabled := False;
   End
   Else
   Begin
      dblcdCta.Enabled := True;
   End;

   //Inicio HPC_2013XX_CNT
   fg_HabilitabotonPLE;
   //Fina HPC_2013XX_CNT

End;

Procedure TFCCuadreMovs.bbtnA4Click(Sender: TObject);
Begin
   sA4 := 'S';
   bbtnOkClick(Self);
   sA4 := 'N';
End;

Procedure TFCCuadreMovs.ppHeaderBand3BeforePrint(Sender: TObject);
Begin
   pplFec.Visible := False;
   ppsvFec.Visible := False;
   If (cbFecRep.Checked) And (dtpFecRep.Date > 0) Then
   Begin
      pplFec.Text := Datetostr(dtpFecRep.Date);
      pplFec.Visible := True;
   End
   Else
      ppsvFec.Visible := True;

End;

Procedure TFCCuadreMovs.cbFecRepClick(Sender: TObject);
Begin
   If cbFecRep.Checked Then
      gbFecRep.Enabled := True
   Else
      gbFecRep.Enabled := False;

   //Inicio HPC_2013XX_CNT
   fg_HabilitabotonPLE;
   //Fina HPC_2013XX_CNT

End;

Procedure TFCCuadreMovs.ppHeaderBand2BeforePrint(Sender: TObject);
Begin
   pplFecD.Visible := False;
   ppsvFecD.Visible := False;
   If (cbFecRep.Checked) And (dtpFecRep.Date > 0) Then
   Begin
      pplFecD.Text := Datetostr(dtpFecRep.Date);
      pplFecD.Visible := True;
   End
   Else
      ppsvFecD.Visible := True;

End;
//INICIO HPC_201206_CNT

Procedure TFCCuadreMovs.btnExportarExcelClick(Sender: TObject);
Begin
   xbExportarExcel := True;
   bbtnOkClick(Self);
   xbExportarExcel := False;
End;

Procedure TFCCuadreMovs.fg_ExportarExcel(wgFormato: String);
Begin
   If wgFormato = 'FORMATO1' Then
   Begin
      dbgDatosReporte.Selected.Clear;
      dbgDatosReporte.Selected.Add('CIAID'#9'8'#9'Compañía'#9'F');
      dbgDatosReporte.Selected.Add('TDIARID'#9'8'#9'TDiario Id'#9'F');
      dbgDatosReporte.Selected.Add('TDIARDES'#9'18'#9'Tipo Diario'#9'F');
      dbgDatosReporte.Selected.Add('CNTANOMM'#9'6'#9'Año Mes'#9'F');
      dbgDatosReporte.Selected.Add('TMONID'#9'6'#9'Moneda'#9'F');
      dbgDatosReporte.Selected.Add('CNTFCOMP'#9'10'#9'Fecha'#9'F');
      dbgDatosReporte.Selected.Add('CNTCOMPROB'#9'12'#9'Nº Comprobante'#9'F');
      dbgDatosReporte.Selected.Add('CNTLOTE'#9'6'#9'Lote'#9'F');
      dbgDatosReporte.Selected.Add('CNTUSER'#9'10'#9'Usuario'#9'F');
      dbgDatosReporte.Selected.Add('CNTTCAMBIO'#9'8'#9'Tipo Cambio'#9'F');
      //dbgDatosReporte.Selected.Add('CNTCUADRE'#9'6'#9'Cuadre'#9'F');
      dbgDatosReporte.Selected.Add('CNTESTADO'#9'6'#9'Estado'#9'F');
      dbgDatosReporte.Selected.Add('CNTDEBEMN'#9'10'#9'S/ Debe'#9'F');
      dbgDatosReporte.Selected.Add('CNTHABEMN'#9'10'#9'S/ Haber'#9'F');
      dbgDatosReporte.Selected.Add('CNTDEBEME'#9'10'#9'$ Debe'#9'F');
      dbgDatosReporte.Selected.Add('CNTHABEME'#9'10'#9'$ Haber'#9'F');
   End
   Else
      If wgFormato = 'FORMATO2' Then
      Begin
         dbgDatosReporte.Selected.Clear;
         dbgDatosReporte.Selected.Add('CIAID'#9'8'#9'Compañía'#9'F');
         dbgDatosReporte.Selected.Add('CUENTAID'#9'8'#9'Cuenta Id'#9'F');
         dbgDatosReporte.Selected.Add('CTADES'#9'20'#9'Cuenta'#9'F');
         dbgDatosReporte.Selected.Add('CLAUXID'#9'8'#9'Tipo Axiliar'#9'F');
         dbgDatosReporte.Selected.Add('AUXID'#9'8'#9'Auxiliar Id'#9'F');
         dbgDatosReporte.Selected.Add('DOCID'#9'8'#9'Documento Id'#9'F');
         dbgDatosReporte.Selected.Add('DOCDES'#9'18'#9'Tipo Documento'#9'F');
         dbgDatosReporte.Selected.Add('CNTSERIE'#9'8'#9'Serie Doc'#9'F');
         dbgDatosReporte.Selected.Add('CNTNODOC'#9'8'#9'Numero Doc'#9'F');
         dbgDatosReporte.Selected.Add('CNTGLOSA'#9'20'#9'Glosa'#9'F');
         dbgDatosReporte.Selected.Add('CCOSID'#9'8'#9'CCosto Id'#9'F');
         dbgDatosReporte.Selected.Add('TDIARID'#9'8'#9'TDiario Id'#9'F');
         dbgDatosReporte.Selected.Add('TDIARDES'#9'12'#9'Tipo Diario'#9'F');
         dbgDatosReporte.Selected.Add('CNTDEBEMN'#9'10'#9'S/ Debe'#9'F');
         dbgDatosReporte.Selected.Add('CNTHABEMN'#9'10'#9'S/ Haber'#9'F');
         dbgDatosReporte.Selected.Add('CNTDEBEME'#9'10'#9'$ Debe'#9'F');
         dbgDatosReporte.Selected.Add('CNTHABEME'#9'10'#9'$ Haber'#9'F');
         dbgDatosReporte.Selected.Add('CNTFCOMP'#9'10'#9'Fecha'#9'F');
         dbgDatosReporte.Selected.Add('CNTANOMM'#9'7'#9'Año Mes'#9'F');
         dbgDatosReporte.Selected.Add('CNTCOMPROB'#9'12'#9'Nº Comprobante'#9'F');
         dbgDatosReporte.Selected.Add('CNTLOTE'#9'6'#9'Lote'#9'F');
         dbgDatosReporte.Selected.Add('TMONID'#9'6'#9'Moneda'#9'F');
         dbgDatosReporte.Selected.Add('CNTFVCMTO'#9'12'#9'Fecha Vencimiento'#9'F');
         dbgDatosReporte.Selected.Add('CNTREG'#9'6'#9'Nº Registro'#9'F');
      End
      Else
         If wgFormato = 'FORMATO3' Then
         Begin
            dbgDatosReporte.Selected.Add('PERIODO'#9'7'#9'Periodo'#9'F');
            dbgDatosReporte.Selected.Add('CNTANOMM'#9'7'#9'Año Mes'#9'F');
            dbgDatosReporte.Selected.Add('CIAID'#9'12'#9'Compañía Id'#9'F');
            dbgDatosReporte.Selected.Add('CIADES'#9'20'#9'Compañía'#9'F');
            dbgDatosReporte.Selected.Add('TDIARID'#9'8'#9'TDiario Id'#9'F');
            dbgDatosReporte.Selected.Add('TDIARDES'#9'12'#9'Tipo Diario'#9'F');
            dbgDatosReporte.Selected.Add('CUENTAID'#9'8'#9'Cuenta Id'#9'F');
            dbgDatosReporte.Selected.Add('CTADES'#9'20'#9'Cuenta'#9'F');
            dbgDatosReporte.Selected.Add('CNTDEBEMN'#9'10'#9'S/ Debe'#9'F');
            dbgDatosReporte.Selected.Add('CNTHABEMN'#9'10'#9'S/ Haber'#9'F');
            dbgDatosReporte.Selected.Add('CNTDEBEME'#9'10'#9'$ Debe'#9'F');
            dbgDatosReporte.Selected.Add('CNTHABEME'#9'10'#9'$ Haber'#9'F');
            dbgDatosReporte.Selected.Add('RANGO'#9'20'#9'Rango Fecha'#9'F');
         End
         Else
            If wgFormato = 'FORMATO4' Then
            Begin
               dbgDatosReporte.Selected.Add('PERIODO'#9'7'#9'Periodo'#9'F');
               dbgDatosReporte.Selected.Add('CIAID'#9'12'#9'Compañía Id'#9'F');
               dbgDatosReporte.Selected.Add('CIADES'#9'20'#9'Compañía'#9'F');
               dbgDatosReporte.Selected.Add('TDIARID'#9'8'#9'TDiario Id'#9'F');
               dbgDatosReporte.Selected.Add('TDIARDES'#9'12'#9'Tipo Diario'#9'F');
               dbgDatosReporte.Selected.Add('CNTANOMM'#9'7'#9'Año Mes'#9'F');
               dbgDatosReporte.Selected.Add('CNTLOTE'#9'6'#9'Lote'#9'F');
               dbgDatosReporte.Selected.Add('CUENTAID'#9'8'#9'Cuenta Id'#9'F');
               dbgDatosReporte.Selected.Add('CTADES'#9'20'#9'Cuenta'#9'F');
               dbgDatosReporte.Selected.Add('CNTDEBEMN'#9'10'#9'S/ Debe'#9'F');
               dbgDatosReporte.Selected.Add('CNTHABEMN'#9'10'#9'S/ Haber'#9'F');
               dbgDatosReporte.Selected.Add('CNTDEBEME'#9'10'#9'$ Debe'#9'F');
               dbgDatosReporte.Selected.Add('CNTHABEME'#9'10'#9'$ Haber'#9'F');
               dbgDatosReporte.Selected.Add('RANGO'#9'20'#9'Rango Fecha'#9'F');
               dbgDatosReporte.Selected.Add('OFDESNOM'#9'20'#9'Oficina'#9'F');

            End;
   dbgDatosReporte.DataSource := DMCNT.dsQry;
   Try
      Screen.Cursor := crHourGlass;
      dbgDatosReporte.ExportOptions.ExportType := wwgetSYLK;
      dbgDatosReporte.ExportOptions.FileName := 'DIARIO_GENERAL' + '.slk';
      dbgDatosReporte.ExportOptions.Save; //la primera genera error
      dbgDatosReporte.ExportOptions.Save;
      ShellExecute(Handle, 'Open', PChar(dbgDatosReporte.exportoptions.Filename), Nil, Nil, sw_shownormal);
      Screen.Cursor := crDefault;
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;
End;
//FIN HPC_201206_CNT

//Inicio HPC_2013XX_CNT

Procedure TFCCuadreMovs.BtnPLEClick(Sender: TObject);
Var
   xsql: String;
Begin
   If edtCia.Text = '' Then
   Begin
      ShowMessage('Compañía no válida');
      Raise exception.Create('Compañía no válida');
   End;

   If (dbdtpFReg1.Date = 0) Or (dbdtpFReg2.Date = 0) Then
   Begin
      ShowMessage('Fecha no válida');
      Raise exception.Create('Fecha no válida');
   End;

   Try
      FLibroDiarioPLE := TFLibroDiarioPLE.create(Self);
      FLibroDiarioPLE.ShowModal;
   Finally
      FLibroDiarioPLE.Free;
   End;
End;
//Final HPC_2013XX_CNT

Procedure TFCCuadreMovs.BitBtn2Click(Sender: TObject);
Begin

End;

//Inicio HPC_2013XX_CNT

Procedure TFCCuadreMovs.fg_HabilitabotonPLE;
Begin
   If rgListado.ItemIndex = 1 Then
      If (dblcCia.Text = '01') And (rgMoneda.ItemIndex = 0) And
         (Not ckTDiario.Checked) And (Not ckLote.Checked) And
         (Not cbcta.Checked) And (Not cbFecRep.Checked) Then
         BtnPLE.Visible := True
      Else
         BtnPLE.Visible := False
   Else
      BtnPLE.Visible := False;
End;
//Final HPC_2013XX_CNT

Procedure TFCCuadreMovs.dblcCiaChange(Sender: TObject);
Begin
   //Inicio HPC_2013XX_CNT
   fg_HabilitabotonPLE;
   //Fina HPC_2013XX_CNT
End;

Procedure TFCCuadreMovs.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;

End.

