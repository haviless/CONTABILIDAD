Unit CNT214;

// Actualizaciones
// HCP_201401_CNT  Se corrige descripción del Tipo de Diario

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Wwdbdlg, wwdbdatetimepicker, StdCtrls, ExtCtrls, wwdblook, Buttons, Mask,
   wwdbedit, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB,
   ppDBPipe, ppBands, ppCtrls, ppVar, ppPrnabl, Spin, ppViewr, ppEndUsr,
   ppTypes, oaVariables, ppParameter;

Type
   TFCCuadreMovs2 = Class(TForm)
      pnlCuadreMovs: TPanel;
      lblCia: TLabel;
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      rgEstado: TRadioGroup;
      rgListado: TRadioGroup;
      ppdbMovCntD: TppDBPipeline;
      pprCuadreMovsD: TppReport;
      ppdbMovCntR: TppDBPipeline;
      GroupBox1: TGroupBox;
      dbeLote: TwwDBEdit;
      ckLote: TCheckBox;
      gbPer: TGroupBox;
      speAno: TSpinEdit;
      speMM: TSpinEdit;
      Label2: TLabel;
      dbdtpFReg1: TwwDBDateTimePicker;
      dbdtpFReg2: TwwDBDateTimePicker;
      pprCuadreMovsR: TppReport;
      rgTDiario: TRadioGroup;
      Z2bbtnSelTDiario: TBitBtn;
      edtTitulo: TEdit;
      Label1: TLabel;
      ppd1: TppDesigner;
      ppParameterList1: TppParameterList;
      ppParameterList2: TppParameterList;
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
      ppSystemVariable6: TppSystemVariable;
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
      ckbFechaReporte: TCheckBox;
      dbdtpFechaReporte: TwwDBDateTimePicker;
      ppHeaderBand1: TppHeaderBand;
      ppLabel18: TppLabel;
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
      ppLabel6: TppLabel;
      ppLabel43: TppLabel;
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
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
      Procedure dblcCiaExit(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbeLoteExit(Sender: TObject);
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
      Procedure rgTDiarioClick(Sender: TObject);
      Procedure Z2bbtnSelTDiarioClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnCancClick(Sender: TObject);
      Procedure ckbFechaReporteClick(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
    // vhn
      sCiaOrigen: String;
      sCiaCuenta: String;
   End;

Var
   vreal, TD, TH: DOUBLE;
   FCCuadreMovs2: TFCCuadreMovs2;
   vstr, xFiltro, xWhere: String;

Implementation

Uses CNTDM, CNT998, CNT417;

{$R *.DFM}

Procedure TFCCuadreMovs2.dblcCiaExit(Sender: TObject);
Begin
   TD := 0;
   edtCia.Text := '';
   If dblcCia.Text <> '' Then edtCia.Text := DMCNT.cdsCia.FieldByName('CIADES').AsString;
   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   End;

   sCiaOrigen := DMCNT.FiltraTablaxCia(DMCNT.cdsTDiario, 'TGE104', 'TDIARID', dblcCia.Text);
   sCiaCuenta := DMCNT.FiltraTablaxCia(DMCNT.cdsCuenta, 'TGE202', 'CUENTAID', dblcCia.Text);
End;

Procedure TFCCuadreMovs2.bbtnOkClick(Sender: TObject);
Var
   xSQL: String;
   x10: Integer;
   xTDiario: String;
   sOriLog: String;
   xsFechaReporte: String;
Begin
   ppdbMovCntR.DataSource := Nil;
   ppdbMovCntD.DataSource := Nil;
   DMCNT.cdsQry.IndexFieldNames := '';
   DMCNT.cdsQry.Filtered := True;
   DMCNT.cdsQry.Close;

   xsFechaReporte := dbdtpFechaReporte.Text;
   With DMCNT Do
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
      cdsMovCnt2.Filter := '';

      If (ckLote.Checked) And (dbeLote.Text = '') Then
      Begin
         showmessage('Seleccione Lote');
         Raise exception.Create('Seleccione Lote');
      End;

      sOriLog := '';
      If rgTDiario.ItemIndex = 1 Then
      Begin
         If Not FSelTDiario.cdsClone.Active Then
         Begin
            Raise Exception.Create('Debe seleccionar una o más Tipos de Diario');
         End
         Else
         Begin
            If FSelTDiario.cdsClone.RecordCount = 0 Then
            Begin
               Raise Exception.Create('Debe seleccionar una o más Tipos de Diario');
            End
         End;

      // Inicio HCP_201401_CNT
         xTDiario := ' and CNT301.TDIARID IN (';
         sOriLog := 'CNT301.TDIARID IN ( ';
      // Fin HCP_201401_CNT
         With FSelTDiario.cdsClone Do
         Begin
            First;
            While Not Eof Do
            Begin
               xTDiario := xTDiario + '''' + fieldbyname('TDIARID').AsString + '''';
               sOriLog := sOriLog + fieldbyname('TDIARID').AsString;
               Next;
               If Not eof Then
               Begin
                  xTDiario := xTDiario + ' , ';
                  sOriLog := sOriLog + ', ';
               End;
            End;
         End;
         xTDiario := xTDiario + ' )';
         sOriLog := sOriLog + ' )';
      End;

      Screen.Cursor := crHourGlass;
      If rgListado.ItemIndex = 0 Then
      Begin
         xFiltro := 'CIAID=' + '''' + dblcCia.Text + ''''
            + ' and CNTFCOMP>=' + wRepFuncDate + '''' + formatdatetime(wFormatFecha, dbdtpFReg1.DateTime) + '''' + ')'
            + ' and CNTFCOMP<=' + wRepFuncDate + '''' + formatdatetime(wFormatFecha, dbdtpFReg2.DateTime) + '''' + ')';
         If rgTDiario.ItemIndex = 1 Then
            xFiltro := xFiltro + xTDiario;

         If dbeLote.Text <> '' Then
            xFiltro := xFiltro + ' and CNTLOTE=' + '''' + dbeLote.Text + '''';

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

         If sCiaOrigen <> '' Then
            xFiltro := xFiltro + ' and ' + sCiaOrigen;

      End
      Else
      Begin
         xFiltro := 'CNT301.CIAID=' + '''' + dblcCia.Text + ''''
            + ' and CNT301.CNTFCOMP>=' + wRepFuncDate + '''' + formatdatetime(wFormatFecha, dbdtpFReg1.DateTime) + '''' + ')'
            + ' and CNT301.CNTFCOMP<=' + wRepFuncDate + '''' + formatdatetime(wFormatFecha, dbdtpFReg2.DateTime) + '''' + ')';
         If rgTDiario.ItemIndex = 1 Then
            xFiltro := xFiltro + xTDiario;

         If dbeLote.Text <> '' Then
            xFiltro := xFiltro + ' and CNT301.CNTLOTE=' + '''' + dbeLote.Text + '''';
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

         If sCiaCuenta <> '' Then
            xFiltro := xFiltro + ' and CNT301.' + sCiaCuenta;

         If sCiaOrigen <> '' Then
            xFiltro := xFiltro + ' and CNT301.' + sCiaOrigen;

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
                //INICIO SAR666
                  ', ' + Quotedstr(xsFechaReporte) + ' AS FECHA_REPORTE ' +
                //FIN SAR666
                  ' from CNT300 Where ' + xFiltro +
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

               ppdbMovCntR.DataSource := DMCNT.dsQry;

               pprCuadreMovsR.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ResumenComp1TXTmp.rtm';

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
               If edtTitulo.text <> '' Then
               Begin
                  pplabel1.caption := edtTitulo.text;
               End;

               DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Inventarios y Balances',
                  dblcCia.Text, // Campañía
                  speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
                  dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
                  '', sOriLog, // Nivel   - Origen
                  '', '', // Lote    -  Moneda
                  '', '', // Cuentas - Auxiliares
                  '', 'Impresora', // Costos - Tipo Salida
                  inttostr(rgListado.itemindex)); // Tipo Rep

               Screen.Cursor := crDefault;
               ppd1.Report := pprCuadreMovsR;
               If cbDisenoRep.Checked Then
                  ppd1.ShowModal
               Else
               Begin
                  pprCuadreMovsR.Print;

                  DMCNT.cdsQry.FetchOnDemand := False;
                  DMCNT.cdsQry.PacketRecords := -1;
                  DMCNT.cdsQry.FetchOnDemand := True;

                  pprCuadreMovsR.Stop;
                  ppd1.Report := Nil;
                  x10 := Self.ComponentCount - 1;
                  While x10 >= 0 Do
                  Begin
                     If Self.Components[x10].ClassName = 'TppGroup' Then
                     Begin
                        Self.Components[x10].Free;
                     End;
                     x10 := x10 - 1;
                  End;

                  cdsQry.CancelUpdates;
               End;
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
                        + ' from CNT301 '
                        + ' Where ' + xFiltro
                        + ' ORDER BY CNT301.CIAID, CNT301.TDIARID, CNT301.CNTANOMM, CNT301.CNTCOMPROB, CNT301.CNTFCOMP';
               End
               Else
                  If SRV_D = 'ORACLE' Then
                  Begin
                  // Inicio HPC_201401_CNT
                     xSQL := 'Select CNT301.CIAID, CNT301.CUENTAID, CNT301.CLAUXID, CNT301.AUXID,'
                           + '       CNT301.AUXID, CNT301.DOCID, CNT301.CNTSERIE, CNT301.CNTNODOC, CNT301.CNTGLOSA,'
                           + '       CNT301.CCOSID, NVL( CNT301.CNTDEBEMN,0) CNTDEBEMN, NVL(CNT301.CNTHABEMN,0) CNTHABEMN, '
                       //    + '        DECODE(TMONID,' + QuotedStr('D') + ',NVL(CNT301.CNTDEBEME,0),0) CNTDEBEME, '
                           + '       case when CNT301.TMONID=''D'' then nvl(CNT301.CNTDEBEME,0) else 0.00 end CNTDEBEME, '
                       //    + ' DECODE(TMONID,' + QuotedStr('D') + ',NVL(CNT301.CNTHABEME,0),0) CNTHABEME, '
                           + '       case when CNT301.TMONID=''D'' then nvl(CNT301.CNTHABEME,0) else 0.00 end CNTHABEME, '
                           + '       CNT301.CTADES, CNT301.DOCDES, CNT301.TDIARID, TGE104.TDIARDES, CNT301.CNTFCOMP, '
                           + '       CNT301.CNTANOMM, CNT301.CNTCOMPROB, SUBSTR(CNT301.CNTCOMPROB,3,8) AS NROCOMPROB,'
                           + '       CNT301.CNTLOTE, CNT301.TMONID, CNT301.CNTFVCMTO, CNT301.CNTREG, '
                           + '       SUBSTR(CNT301.CNTCOMPROB,1,2) AS NROCIA, '
                                   + Quotedstr(xsFechaReporte) + ' AS FECHA_REPORTE '
                           + '  from CNT301, TGE104 '
                           + ' Where ' + xFiltro
                           + '   and TGE104.TDIARID(+) = CNT301.TDIARID '
                           + ' Order by CNT301.TDIARID, CNT301.CNTCOMPROB, CNT301.CNTANOMM, CNT301.CNTREG, CNT301.CNTFCOMP';
                  // Fin HPC_201401_CNT
                  End;

               DMCNT.cdsQry.Close;
               DMCNT.cdsQry.ProviderName := 'prvCNT';
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.FetchOnDemand := False;
               DMCNT.cdsQry.PacketRecords := 3000;
               DMCNT.cdsQry.Open;
               DMCNT.cdsQry.FetchOnDemand := True;

               If DMCNT.cdsQry.RecordCount = 0 Then
                  Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas');

               ppdbMovCntD.DataSource := DMCNT.dsQry;

           // vhndema
           {FImpresion := TFImpresion.Create( Self );
           FImpresion.ShowModal;
           if FImpresion.wFlTexto='C' then begin
              pprCuadreMovsR.Stop;
              DMCNT.cdsQry.CancelUpdates;
              DMCNT.cdsQry.IndexFieldNames:='';
              DMCNT.cdsQry.Filter:='';
              DMCNT.cdsQry.Filtered:=True;
              DMCNT.cdsQry.FetchOnDemand:=False;
              DMCNT.cdsQry.PacketRecords:=-1;
              DMCNT.cdsQry.FetchOnDemand:=True;
              Exit;
           end;
           if FImpresion.wFlTexto='G' then
              pprCuadreMovsD.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\DetalleCompTmp.rtm';
           if FImpresion.wFlTexto='T' then}
           // end vhndema
               pprCuadreMovsD.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\DetalleCompTXTmp.rtm';
               pprCuadreMovsD.template.LoadFromFile;

               If wRptCia = 'Dema' Then
               Begin
                  ppLabel11.Visible := False;
                  ppLabel27.Visible := False;
                  ppLabel28.Visible := False;
                  ppDBText16.Visible := False;
                  ppDBText17.Visible := False;
                  ppDBCalc14.Visible := False;
                  ppDBCalc19.Visible := False;
                  ppDBCalc9.Visible := False;
                  ppDBCalc10.Visible := False;
               End
               Else
               Begin
                  ppLabel11.Visible := True;
                  ppLabel27.Visible := True;
                  ppLabel28.Visible := True;
                  ppDBText16.Visible := True;
                  ppDBText17.Visible := True;
                  ppDBCalc14.Visible := True;
                  ppDBCalc19.Visible := True;
                  ppDBCalc9.Visible := True;
                  ppDBCalc10.Visible := True;
               End;

           //**
               pplblFecIniD.Caption := datetostr(dbdtpFReg1.Date);
               pplblFecFinD.Caption := datetostr(dbdtpFReg2.Date);
               pplblCiaD.CAPTION := edtCia.TEXT;
               If edtTitulo.text <> '' Then
               Begin
                  pplabel32.caption := edtTitulo.text;
               End;

               DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Inventarios y Balances',
                  dblcCia.Text, // Campañía
                  speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
                  dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
                  '', sOriLog, // Nivel   - Origen
                  '', '', // Lote    -  Moneda
                  '', '', // Cuentas - Auxiliares
                  '', 'Impresora', // Costos - Tipo Salida
                  inttostr(rgListado.itemindex)); // Tipo Rep

           // vhndema
               Screen.Cursor := crDefault;
               ppd1.Report := pprCuadreMovsD;
               If cbDisenoRep.Checked Then
                  ppd1.ShowModal
               Else
               Begin
                  pprCuadreMovsD.Print;

                  DMCNT.cdsQry.FetchOnDemand := False;
                  DMCNT.cdsQry.PacketRecords := -1;
                  DMCNT.cdsQry.FetchOnDemand := True;

                  pprCuadreMovsD.Stop;
                  ppd1.Report := Nil;

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
End;

Procedure TFCCuadreMovs2.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMCNT.cdsMovCnt2.IndexFieldNames := '';
   FSelTDiario.Free;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;
   Action := caFree;
End;

Procedure TFCCuadreMovs2.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFCCuadreMovs2.dbeLoteExit(Sender: TObject);
Begin
   If dbeLote.Text <> '' Then dbeLote.Text := DMCNT.strzero(dbeLote.Text, 4);
End;

Procedure TFCCuadreMovs2.ckLoteClick(Sender: TObject);
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
End;

Procedure TFCCuadreMovs2.gbPerExit(Sender: TObject);
Var
   xFecha1, xFecha2: TDateTime;
   xMes: String;
Begin
   If speMM.Text = '13' Then
      xMes := '12'
   Else
   // Inicio HPC_201402_CNT
      If speMM.Text = '00' Then
         xMes := '01'
      Else
         xMes := speMM.Text;
   // Fin HPC_201402_CNT
   If speMM.Text = '13' Then
      xFecha1 := strtodate('31/' + DMCNT.strZero(xMes, 2) + '/' + speAno.Text)
   Else
      xFecha1 := strtodate('01/' + DMCNT.strZero(xMes, 2) + '/' + speAno.Text);
   If strtofloat(xMes) + 1 = 13 Then
   Begin
      xFecha2 := strtodate('01/01/' + FloatToStr(StrToFloat(speAno.Text) + 1));
   End
   Else
   Begin
      xFecha2 := strtodate('01/' + DMCNT.strZero(floattostr(strtofloat(xMes) + 1), 2) + '/' + speAno.Text);
   End;
   xFecha2 := xFecha2 - 1;
   dbdtpFReg1.date := xFecha1;
   dbdtpFReg2.date := xFecha2;
End;

Procedure TFCCuadreMovs2.dbdtpFReg1Exit(Sender: TObject);
Begin
   If dbdtpFReg1.date = 0 Then
   Begin
      dbdtpFReg1.SetFocus;
      ShowMessage('Error : Falta Registrar Fecha');
      Raise Exception.Create('Error : Falta Registrar Fecha');
   End;
End;

Procedure TFCCuadreMovs2.dbdtpFReg2Exit(Sender: TObject);
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

Procedure TFCCuadreMovs2.pprCuadreMovsRPreviewFormCreate(Sender: TObject);
Begin
   TppReport(Sender).PreviewForm.WindowState := WsMaximized;
   TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zsPageWidth;
End;

Procedure TFCCuadreMovs2.pprCuadreMovsDPreviewFormCreate(Sender: TObject);
Begin
   TppReport(Sender).PreviewForm.WindowState := WsMaximized;
   TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zsPageWidth;
End;

Procedure TFCCuadreMovs2.ppDBCalc13Calc(Sender: TObject);
Begin
   If DMCNT.cdsQry.FieldByName('CNTDEBEMN').AsString <> '' Then
      ppDBCalc13.Value := ppDBCalc13.Value + DMCNT.cdsQry.FieldByName('CNTDEBEMN').AsFloat;
End;

Procedure TFCCuadreMovs2.ppDBCalc14Calc(Sender: TObject);
Begin
   If DMCNT.cdsQry.FieldByName('CNTHABEMN').AsString <> '' Then
      ppDBCalc14.Value := ppDBCalc14.Value + DMCNT.cdsQry.FieldByName('CNTHABEMN').AsFloat;
End;

Procedure TFCCuadreMovs2.ppDBCalc15Calc(Sender: TObject);
Begin
   If DMCNT.cdsQry.FieldByName('CNTDEBEMN').AsString <> '' Then
      ppDBCalc15.Value := ppDBCalc15.Value + DMCNT.cdsQry.FieldByName('CNTDEBEMN').AsFloat;
End;

Procedure TFCCuadreMovs2.ppDBCalc16Calc(Sender: TObject);
Begin
   If DMCNT.cdsQry.FieldByName('CNTHABEMN').AsString <> '' Then
      ppDBCalc16.Value := ppDBCalc16.Value + DMCNT.cdsQry.FieldByName('CNTHABEMN').AsFloat;
End;

Procedure TFCCuadreMovs2.ppDBCalc17Calc(Sender: TObject);
Begin
   If DMCNT.cdsQry.FieldByName('CNTDEBEME').AsString <> '' Then
      ppDBCalc17.Value := ppDBCalc17.Value + DMCNT.cdsQry.FieldByName('CNTDEBEME').AsFloat;
End;

Procedure TFCCuadreMovs2.ppDBCalc18Calc(Sender: TObject);
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

Procedure TFCCuadreMovs2.ppLabel33Print(Sender: TObject);
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

Procedure TFCCuadreMovs2.ppLabel53Print(Sender: TObject);
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

Procedure TFCCuadreMovs2.rgTDiarioClick(Sender: TObject);
Begin
   Z2bbtnSelTDiario.Enabled := (rgTDiario.ItemIndex = 1);
End;

Procedure TFCCuadreMovs2.Z2bbtnSelTDiarioClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   FSelTDiario.xRg := '0';
   FSelTDiario.sCia := dblcCia.text;
   FSelTDiario.ShowModal;
End;

Procedure TFCCuadreMovs2.FormShow(Sender: TObject);
Var
   xSQL: String;
   xAno, xMes, xDia: Word;
Begin
   DMCNT.cdsMovCnt2.IndexFieldNames := '';
   DMCNT.FiltraTabla(DMCNT.cdsTDiario, 'TGE104', 'TDIARID');
   DecodeDate(Date, xAno, xMes, xDia);
   speAno.Value := xAno;
   speMM.Value := xMes;
   //INICIO SAR666
   dbdtpFechaReporte.Date := Date;
   //FIN SAR666
End;

Procedure TFCCuadreMovs2.bbtnCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFCCuadreMovs2.ckbFechaReporteClick(Sender: TObject);
Begin
   If Not (ckbFechaReporte.Checked) Then
   Begin
      dbdtpFechaReporte.Enabled := False;
      dbdtpFechaReporte.Date := Date;
   End
   Else
   Begin
      dbdtpFechaReporte.Enabled := True;
   End;
End;

Procedure TFCCuadreMovs2.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;

End.

