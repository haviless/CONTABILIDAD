Unit CNT202A;
// Actualizaciones

// HPC_201302_CNT          31/07/2013  Creación del Formulario
// HPC_201401_CNT          27/01/2014  Validaciones de Datos
// HPC_201404_CNT          27/03/2014  Se cambia rango de fechas por AÑO+MES
// HPC_201407_CNT          30/05/2014  Realizar modificaciones del archivo que se genera del PLE al formato nuevo de Sunat.
// HPC_201410_CNT          30/09/2014  Reemplaza Cuenta 79 por Cuenta 791
// HPC_201501_CNT          06/02/2015  Modifica prefijo de nro.comprobante para inicio y fin de año
// HPC_201602_CNT          17/06/2016  DAF_2016000251_CNT_1 Modifica Nuevas estructuras del PLE SUNAT
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ppDB, DBGrids, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass,
   ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE, DB,
   DBClient, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, StdCtrls, Buttons,
   ExtCtrls, FileCtrl;

Type
   TFLibroDiarioPLE = Class(TForm)
      pnlAdvertencias: TPanel;
      Shape15: TShape;
      Label48: TLabel;
      Shape16: TShape;
      bbtnTextoPLE: TBitBtn;
      BitBtn2: TBitBtn;
      pbExp: TProgressBar;
      dbgLibroDiario: TwwDBGrid;
      BtnImprime: TBitBtn;
      btnExcel: TBitBtn;
      cdsTotDiario: TClientDataSet;
      dsTotDiario: TDataSource;
      BDEP1: TppBDEPipeline;
      rptPLEDiario: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppShape5: TppShape;
      ppShape2: TppShape;
      ppShape1: TppShape;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppShape3: TppShape;
      ppShape4: TppShape;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      pplblPeriodo: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppShape6: TppShape;
      ppLabel14: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      dtgData: TDBGrid;
      bbtnExlResumen: TBitBtn;
      bbtnCuentaPLE: TBitBtn;
      Procedure FormShow(Sender: TObject);
      Procedure bbtnTextoPLEClick(Sender: TObject);
// Inicio HPC_201407_CNT
      Procedure bbtnCuentaPLEClick(Sender: TObject);
// Fin HPC_201407_CNT
      Procedure btnExcelClick(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure BtnImprimeClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure AbreResumen;
      Procedure AbreDetalle;
      Procedure CuentaDetalle;
      Procedure bbtnExlResumenClick(Sender: TObject);
      Function ValidaDatos: Boolean;
   Private
    { Private declarations }
   Public
    { Public declarations }
      Procedure fg_PLEexportarFormato(xCarpete: String);
      Procedure fg_PLEexportarCuenta(xCarpete: String);
   End;

Var
   FLibroDiarioPLE: TFLibroDiarioPLE;
   xSQL: String;
   CampoDBMN, CampoHNMN: String;

Implementation

Uses CNT264A, CNT202, CNTDM;

{$R *.dfm}

Procedure TFLibroDiarioPLE.FormShow(Sender: TObject);
Var
   vdebe, vhaber, vSaldodebe, vSaldoHaber: currency;
   Year, Month, Day: Word;
   wMes, wMesAnt: String;
   sCiaCuenta, sCiaOrigen: String;
Begin
   DecodeDate(FCCuadreMovs.dbdtpFReg1.Date, Year, Month, Day);
   wMes := inttostr(Month);
   wMes := DMCNT.StrZero(wMes, 2);
   wMesAnt := IntToStr(StrToInt(wMes) - 1);
   wMesAnt := DMCNT.StrZero(wMesAnt, 2);
   CampoDBMN := 'DEBEMN' + wMes;
   CampoHNMN := 'HABEMN' + wMes;

   FCCuadreMovs.Caption := Trim(FCCuadreMovs.Caption) + ' ' + IntToStr(FCCuadreMovs.speAno.Value) + '-' + DMCNT.StrZero(IntToStr(FCCuadreMovs.speMM.Value), 2);
   pplblPeriodo.Text := IntToStr(FCCuadreMovs.speAno.Value) + '-' + DMCNT.StrZero(IntToStr(FCCuadreMovs.speMM.Value), 2);

// Inicio HPC_201401_CNT
   cdsTotDiario.EmptyDataSet;
// Fin HPC_201401_CNT

   AbreResumen;
   vdebe := 0;
   vhaber := 0;
   vSaldodebe := 0;
   vSaldoHaber := 0;

   sCiaCuenta := DMCNT.FiltraTablaxCia(DMCNT.cdsCuenta, 'TGE202', 'CUENTAID', FCCuadreMovs.dblcCia.Text);
   sCiaOrigen := DMCNT.FiltraTablaxCia(DMCNT.cdsTDiario, 'TGE104', 'TDIARID', FCCuadreMovs.dblcCia.Text);

   dbgLibroDiario.ColumnByName('DEBENCT401').FooterValue := '0.00';
   dbgLibroDiario.ColumnByName('HABECNT401').FooterValue := '0.00';
   dbgLibroDiario.ColumnByName('DEBECNT401').FooterValue := '0.00';
   dbgLibroDiario.ColumnByName('HABECNT401').FooterValue := '0.00';

   While Not DMCNT.cdsQry2.eof Do
   Begin
      cdsTotDiario.Insert;
      cdsTotDiario.FieldByName('CUENTA').AsString := DMCNT.cdsQry2.FieldByName('CUENTA').AsString;
      cdsTotDiario.FieldByName('DESCRIPCION').AsString := DMCNT.cdsQry2.FieldByName('CTADES').AsString;
      cdsTotDiario.FieldByName('DEBECNT401').AsFloat := DMCNT.cdsQry2.FieldByName('CNTDEBE401').AsFloat;
      cdsTotDiario.FieldByName('HABECNT401').AsFloat := DMCNT.cdsQry2.FieldByName('CNTHABE401').AsFloat;
      cdsTotDiario.FieldByName('DEBECNT301').AsFloat := DMCNT.cdsQry2.FieldByName('CNTDEBE301').AsFloat;
      cdsTotDiario.FieldByName('HABECNT301').AsFloat := DMCNT.cdsQry2.FieldByName('CNTHABE301').AsFloat;

      vdebe := vdebe + DMCNT.cdsQry2.FieldByName('CNTDEBE401').AsFloat;
      vhaber := vhaber + DMCNT.cdsQry2.FieldByName('CNTHABE401').AsFloat;
      vSaldodebe := vSaldodebe + DMCNT.cdsQry2.FieldByName('CNTDEBE301').AsFloat;
      vSaldoHaber := vSaldoHaber + DMCNT.cdsQry2.FieldByName('CNTHABE301').AsFloat;
      DMCNT.cdsQry2.Next;
   End;
   cdsTotDiario.First;

   TNumericField(cdsTotDiario.FieldByName('DEBECNT401')).DisplayFormat := '###,###,##0.00';
   TNumericField(cdsTotDiario.FieldByName('HABECNT401')).DisplayFormat := '###,###,##0.00';
   TNumericField(cdsTotDiario.FieldByName('DEBECNT301')).DisplayFormat := '###,###,##0.00';
   TNumericField(cdsTotDiario.FieldByName('HABECNT301')).DisplayFormat := '###,###,##0.00';

   dbgLibroDiario.ColumnByName('DEBECNT401').FooterValue := FormatFloat('###,###,##0.00', vdebe);
   dbgLibroDiario.ColumnByName('HABECNT401').FooterValue := FormatFloat('###,###,##0.00', vhaber);
   dbgLibroDiario.ColumnByName('DEBECNT301').FooterValue := FormatFloat('###,###,##0.00', vSaldodebe);
   dbgLibroDiario.ColumnByName('HABECNT301').FooterValue := FormatFloat('###,###,##0.00', vSaldoHaber);
   dbgLibroDiario.RefreshDisplay;
End;

Procedure TFLibroDiarioPLE.bbtnTextoPLEClick(Sender: TObject);
Var
   xsCarpeta: String;
Begin
   If not ValidaDatos then exit;

   If SelectDirectory('Selecciona una Carpeta', '', xsCarpeta) Then
   Begin
      If Copy(xsCarpeta, Length(xsCarpeta), 1) <> '\' Then
      Begin
         xsCarpeta := xsCarpeta + '\';
         Screen.Cursor := crHourGlass;
         fg_PLEexportarFormato(xsCarpeta);
      End;
   End;
   Screen.Cursor := crDefault;
End;

Procedure TFLibroDiarioPLE.bbtnCuentaPLEClick(Sender: TObject);
Var
   xsCarpeta: String;
Begin
   If not ValidaDatos then exit;

   If SelectDirectory('Selecciona una Carpeta', '', xsCarpeta) Then
   Begin
      If Copy(xsCarpeta, Length(xsCarpeta), 1) <> '\' Then
      Begin
         xsCarpeta := xsCarpeta + '\';
         Screen.Cursor := crHourGlass;
         fg_PLEexportarCuenta(xsCarpeta);
      End;
   End;
   Screen.Cursor := crDefault;
End;

Procedure TFLibroDiarioPLE.fg_PLEexportarFormato(xCarpete: String);
Var
   XSQL, xcntcomprob, xctasec, xcntglosa, xcntfemis, xcntdebemn, xcnthabemn: String;
   wgArchivo, xsDelimitador, xsRuc, xperiodo, xsNombre, xcorrelativo: String;
   xfArchivoTexto: TextFile;
   vcorrelativ: Integer;
   xsMes: String;
   xsRER: String;
   xsVentas: String;
   xsCompras: String;
   xcorre: String;
   i: Integer;
// Inicio HPC_201602_CNT
   xcntfecven: String;
   xcntfeComp : String;
   xsTmonid : String;
   xsDocid : String;
   xsSerie : String;
   xsNumDoc : String;
   xsCodLibro: String;
   xsEstado : String;
   xsPerFecemi: String;
   xsPrimdig: String;
// Fin HPC_201602_CNT
Begin

  // cdsTotDiario.EmptyDataSet;
   xsDelimitador := '|';
   xperiodo := Trim(FCCuadreMovs.speAno.Text) + DMCNT.StrZero(Trim(FCCuadreMovs.speMM.Text), 2);
   xsRuc := DMCNT.DisplayDescrip('', 'TGE101', 'CIARUC', 'CIAID = ' + QuotedStr('01'), 'CIARUC');
   xsNombre := 'LE' + xsRuc + xperiodo + '00' + '050100' + '00' + '1' + '1' + '1' + '1' + '.txt';
   wgArchivo := xCarpete + xsNombre;

   Screen.Cursor := crHourGlass;

   AbreDetalle;

   AssignFile(xfArchivoTexto, wgArchivo);
   Rewrite(xfArchivoTexto);
   vcorrelativ := 1;

   pbExp.Max := DMCNT.cdsReporte.RecordCount;
   pbExp.Position := 0;
// Inicio HPC_201602_CNT
   While Not DMCNT.cdsReporte.Eof Do
   Begin
      xcntcomprob := Trim(DMCNT.cdsReporte.FieldByName('CNTCOMPROB').asstring);
      xctasec := Trim(DMCNT.cdsReporte.FieldByName('CUENTA_SUNAT').asstring);
      xcntglosa := copy(Trim(DMCNT.cdsReporte.FieldByName('CNTGLOSA').asstring), 1, 100);
      xsPerFecemi := Copy(trim(DMCNT.cdsReporte.FieldByName('CNTFEMIS').asstring), 7, 4) + Copy(trim(DMCNT.cdsReporte.FieldByName('CNTFEMIS').asstring), 4, 2);
      i:= pos(#$A,xcntglosa);
      while  i > 0 do
      begin
        delete(xcntglosa,i,1);
        i:= pos(#$A,xcntglosa);
      end;

      If Length(TRim(xcntglosa)) = 0 Then xcntglosa := DMCNT.cdsReporte.FieldByName('CTADES').asstring;

      xcntfemis := Trim(DMCNT.cdsReporte.FieldByName('CNTFEMIS').asstring);
      xcntfeComp := Trim(DMCNT.cdsReporte.FieldByName('CNTFCOMP').asstring);

      if DMCNT.cdsReporte.FieldByName('CNTANOMM').asstring = xsPerFecemi then
         xsEstado :='1'
      else if DMCNT.cdsReporte.FieldByName('CNTANOMM').asstring > xsPerFecemi then
         xsEstado :='8'
      else
      begin
         ShowMessage('T.Diario:'+copy(DMCNT.cdsReporte.FieldByName('CORRELATIVO').AsString,1,2)
                    +' Nro.Comprobante:'+copy(DMCNT.cdsReporte.FieldByName('CORRELATIVO').AsString,3,10)
                    +' Correlativo:'+copy(DMCNT.cdsReporte.FieldByName('CORRELATIVO').AsString,13,4)
                    +' El periodo de la Fecha de Emisión no puede ser mayor');
         exit ;
      end;

//    xsTmonid := Trim(DMCNT.cdsReporte.FieldByName('TMONID').asstring);
      xsTmonid := 'PEN';
      if DMCNT.cdsReporte.FieldByName('TMONID').AsString = 'D' then
         xsTmonid := 'USD';
      xcntfecven := Trim(DMCNT.cdsReporte.FieldByName('CNTFVCMTO').asstring);
      xsDocid := Trim(DMCNT.cdsReporte.FieldByName('DOCID').asstring);
      xsSerie := Trim(DMCNT.cdsReporte.FieldByName('CNTSERIE').asstring);

   // Validaciones para Serie y número de documento
      If (xsDocId = '01') Or (xsDocId = '03') Or (xsDocId = '06') Or (xsDocId = '07') Or (xsDocId = '08') Then
      Begin
         If Length(xsSerie) = 0 Then
         Begin
            xsSerie := '';
         End
         Else
            If Length(xsSerie) <= 4 Then
            Begin
               xsSerie := StringOfChar('0', 4 - Length(xsSerie)) + xsSerie;
            End
            Else
            Begin

            End;

         If Length(xsSerie) > 4 Then
         Begin
            xsPrimdig :=  Copy(trim(xsSerie), 1, 1);
            IF xsPrimdig = '0' then
               xsSerie := Copy(xsSerie, 2, 4);
         End
      End;

      xcntdebemn := FormatFloat('##0.00', DMCNT.cdsReporte.FieldByName('CNTDEBEMN').AsFloat);
      xcnthabemn := FormatFloat('##0.00', DMCNT.cdsReporte.FieldByName('CNTHABEMN').AsFloat);
      //xcorrelativo:= DMCNT.StrZero(trim(IntToStr(vcorrelativ)),15);
      xcorrelativo := copy(Trim(DMCNT.cdsReporte.FieldByName('CORRELATIVO').asstring),1,4) + copy(Trim(DMCNT.cdsReporte.FieldByName('CORRELATIVO').asstring),8,9);;
      xsMes :=  copy(xperiodo,5,2);
      If (StrToInt(xsMes) > 1) and (StrToInt(xsMes) < 12)  then
         xsRER := 'M';
      If (StrToInt(xsMes) = 1) then
         xsRER := 'A';
      If (StrToInt(xsMes) = 12) then
         xsRER := 'C';
      xCorre := copy(Trim(DMCNT.cdsReporte.FieldByName('CORRELATIVO').asstring),1,4) + copy(Trim(DMCNT.cdsReporte.FieldByName('CORRELATIVO').asstring),8,5);
      if  Trim(DMCNT.cdsReporte.FieldByName('CNTCOL20').asstring) ='' then
         xsCodLibro:=''
      else
         xsCodLibro:=Trim(DMCNT.cdsReporte.FieldByName('CNTCOL20').asstring) + '&' + xperiodo + '00' + '&' + xcorrelativo + '&' + xsRER + xcorre;

   xsNumdoc := Trim(DMCNT.cdsReporte.FieldByName('CNTNODOC').asstring);
   if xsNumdoc = '0' then
   begin
      xsDocid := '00';
      xsSerie := '0';
   end;
   xcntfecven := xcntfeComp;

   WriteLn(xfArchivoTexto,
         xperiodo + '00' + xsDelimitador +                           // 1
         xcorrelativo + xsDelimitador +                              // 2
         xsRER + xcorre + xsDelimitador +                            // 3
         xctasec + xsDelimitador +                                   // 4
         '99' + xsDelimitador +                                      // 5
         ' '  + xsDelimitador +                                      // 6
         xsTmonid + xsDelimitador +                                  // 7
         ' '  + xsDelimitador +                                      // 8
         ' '  + xsDelimitador +                                      // 9
         xsDocid + xsDelimitador +                                   // 10
         xsSerie + xsDelimitador +                                   // 11
         xsNumdoc + xsDelimitador +                                  // 12
         xcntfeComp + xsDelimitador +                                // 13
         xcntfecven + xsDelimitador +                                // 14
         xcntfemis + xsDelimitador +                                 // 15
         xcntglosa + xsDelimitador +                                 // 16
         ' '  + xsDelimitador +                                      // 17
         xcntdebemn + xsDelimitador +                                // 18  Movimiento del Debe
         xcnthabemn + xsDelimitador +                                // 19  Movimiento del Haber
         xsCodLibro + xsDelimitador +                                // 20  Código del Libro
         '1' + xsDelimitador );                                      // 21  Estado de Operación


      DMCNT.cdsReporte.Next;
      vcorrelativ := vcorrelativ + 1;
      pbExp.Position := pbExp.Position + 1;
   End;
// Fin HPC_201602_CNT

   CloseFile(xfArchivoTexto);
   DMCNT.cdsReporte.Close;
   ShowMessage('Proceso terminado. Se ha generado' + #13 + 'correctamente el archivo ' + wgArchivo);
End;

// Inicio HPC_201407_CNT
Procedure TFLibroDiarioPLE.fg_PLEexportarCuenta(xCarpete: String);
Var
   XSQL, xctasec: String;
   wgArchivo, xsDelimitador, xperiodo, xsRuc, xsNombre, xcorrelativo: String;
   xfArchivoTexto: TextFile;
   vcorrelativ: Integer;
   xCtades: String;
   xCPCxDT: String;
   xDPCxDT: String;
   xEstado: String;
   xUltiDia: String;
   xfecha : Tdatetime;
Begin

   xsDelimitador := '|';
   xperiodo := Trim(FCCuadreMovs.speAno.Text) + DMCNT.StrZero(Trim(FCCuadreMovs.speMM.Text), 2);
   xsRuc := DMCNT.DisplayDescrip('', 'TGE101', 'CIARUC', 'CIAID = ' + QuotedStr('01'), 'CIARUC');
   xsNombre := 'LE' + xsRuc + xperiodo + '00' + '050300' + '00' + '1' + '1' + '1' + '1' + '.txt';
   wgArchivo := xCarpete + xsNombre;
   if strtoint(Trim(FCCuadreMovs.speMM.Text)) = 12 then
      xUltiDia:= '31/12/' + Trim(FCCuadreMovs.speAno.Text)
   else
      xUltiDia:=  datetostr((strtodate('01/'+ DMCNT.StrZero(Trim(inttostr(strtoint(FCCuadreMovs.speMM.Text) +1)), 2) + '/' +  Trim(FCCuadreMovs.speAno.Text)))-1);

   xUltiDia :=  copy (xUltiDia,1,2);

   Screen.Cursor := crHourGlass;

   CuentaDetalle;

   AssignFile(xfArchivoTexto, wgArchivo);
   Rewrite(xfArchivoTexto);
   vcorrelativ := 1;

   pbExp.Max := DMCNT.cdsReporteCuenta.RecordCount;
   pbExp.Position := 0;
   While Not DMCNT.cdsReporteCuenta.Eof Do
   Begin
      xctasec := Trim(DMCNT.cdsReporteCuenta.FieldByName('CUENTA_SUNAT').asstring);
      xctades := copy(Trim(DMCNT.cdsReporteCuenta.FieldByName('DESCRIPCION').asstring), 1, 100);
      xCPCxDT := Trim(DMCNT.cdsReporteCuenta.FieldByName('CPCxDT').asstring);
      xDPCxDT := Trim(DMCNT.cdsReporteCuenta.FieldByName('DPCxDT').asstring);
      xEstado := Trim(DMCNT.cdsReporteCuenta.FieldByName('ESTADO').asstring);

      WriteLn(xfArchivoTexto,
         xperiodo + xUltiDia + xsDelimitador +                     // 1
         xctasec + xsDelimitador +                                 // 2
         xctades + xsDelimitador +                                 // 3
         xCPCxDT + xsDelimitador +                                 // 4
         xDPCxDT + xsDelimitador +                                 // 5
      // Inicio HPC_201602_CNT
         '' + xsDelimitador +                                      // 6
         '' + xsDelimitador +                                      // 7
         xEstado + xsDelimitador);                                 // 8  Estado
      // Fin HPC_201602_CNT
      DMCNT.cdsReporteCuenta.Next;
      vcorrelativ := vcorrelativ + 1;
      pbExp.Position := pbExp.Position + 1;
   End;

   CloseFile(xfArchivoTexto);
   DMCNT.cdsReporteCuenta.Close;
   ShowMessage('Proceso terminado. Se ha generado' + #13 + 'correctamente el archivo ' + wgArchivo);

End;
// Fin HPC_201407_CNT

Procedure TFLibroDiarioPLE.btnExcelClick(Sender: TObject);
Begin
   AbreDetalle;
   dtgData.DataSource := DMCNT.dsReporte;
   DMCNT.HojaExcel('Libro Diario - PLE', self.dtgData.DataSource, self.dtgData);
End;

Procedure TFLibroDiarioPLE.BitBtn2Click(Sender: TObject);
Begin
   Close;
End;

Procedure TFLibroDiarioPLE.BtnImprimeClick(Sender: TObject);
Begin
   rptPLEDiario.Print;
   rptPLEDiario.Cancel;
End;

Procedure TFLibroDiarioPLE.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMCNT.cdsQry2.Close;
   DMCNT.cdsReporte.Close;
   DMCNT.cdsReporteCuenta.Close;
End;

Procedure TFLibroDiarioPLE.AbreDetalle;
Begin
// Inicio Fin HPC_201602_CNT
// Modificaciones a Query para obtener registros de diario para el PLE
   xSQL := ' Select A.TDIARID||A.CNTCOMPROB||LPAD(TRIM(CNTREG),4,''0'') CORRELATIVO, A.TDIARID||A.CNTCOMPROB CNTCOMPROB, '
         + '        A.CUENTAID, '
         + '        (case when A.CUENTAID=''79'' then ''791'' else A.CUENTAID end) CUENTA_SUNAT, '
         + '        A.CNTGLOSA, trunc(A.CNTFCOMP) CNTFCOMP, A.CNTFEMIS, '
         + '        NVL(A.CNTDEBEMN,0) CNTDEBEMN, NVL(A.CNTHABEMN,0) CNTHABEMN, B.CTADES, C.REGISTRO, '
         + '        A.CNTANOMM, A.TMONID, nvl(D.TDOC_SUNAT,''00'') DOCID, '
         + '        case when D.TDOC_SUNAT in (''01'',''02'',''03'',''04'',''05'',''07'',''08'',''12'',''20'') then UPPER(A.CNTSERIE) else '''' end CNTSERIE, '
//         + '      case when A.TDIARID    in (''08'',''09'',''19'') then A.CNTSERIE else '''' end CNTSERIE, '
         + '        case when escadenanumerica(nvl(A.CNTNODOC,''''))= ''TRUE'' then A.CNTNODOC else ''0'' end CNTNODOC, '
         + '        A.CNTFVCMTO, '
         + '        (case when C.REGISTRO = ''V'' then ''140100'' '
         + '              when C.REGISTRO = ''C'' and A.DOCID =''91'' then ''080200'' '
         + '              when C.REGISTRO = ''C'' and A.DOCID <>''91'' then ''080100'' '
         + '              else '''' '
         + '         end) CNTCOL20 '
         + '   From CNT301 A,TGE202 B, TGE104 C, TGE110 D '
         + '  Where A.CIAID=' + quotedstr(FCCuadreMovs.dblcCia.Text)
         + '    and A.CNTANOMM = '+quotedstr(FCCuadreMovs.speAno.Text+DMCNT.strZero(FCCuadreMovs.speMM.Text,2))
         + '    and A.CNTCUADRE=''S'' '
         + '    and (A.CIAID=B.CIAID(+) and A.CUENTAID=B.CUENTAID(+)) '
         + '    and (NVL(A.CNTDEBEMN,0)+NVL(A.CNTHABEMN,0))>0'
         + '    and A.TDIARID = C.TDIARID (+) '
         + '    and D.TDIARID(+) = A.TDIARID and D.DOCID(+) = A.DOCID '
         + '  Order by A.TDIARID||CNTCOMPROB,CNTANOMM,CNTREG,CNTFCOMP ';
// Fin HPC_201602_CNT

   DMCNT.cdsReporte.Close;
   DMCNT.cdsReporte.DataRequest(xSQL);
   DMCNT.cdsReporte.Open;
End;

// Inicio HPC_201407_CNT
Procedure TFLibroDiarioPLE.CuentaDetalle;
Begin
// Inicio HPC_201410_CNT
   //xSQL := ' Select A.CUENTAID CUENTA_SUNAT, B.CTADES DESCRIPCION, ''99'' CPCxDT,''OTROS'' DPCxDT,''1'' ESTADO  '
   xSQL := ' Select (case when A.CUENTAID=''79'' then ''791'' else A.CUENTAID end) CUENTA_SUNAT, '
         + '        B.CTADES DESCRIPCION, ''99'' CPCxDT,''OTROS'' DPCxDT,''1'' ESTADO  '
         + '   From CNT301 A,TGE202 B, TGE104 C '
         + '  Where A.CIAID=' + quotedstr(FCCuadreMovs.dblcCia.Text)
         + '    and A.CNTANOMM = '+quotedstr(FCCuadreMovs.speAno.Text+DMCNT.strZero(FCCuadreMovs.speMM.Text,2))
         + '    and A.CNTCUADRE=''S'' '
         + '    and (A.CIAID=B.CIAID(+) and A.CUENTAID=B.CUENTAID(+)) '
         + '    and (NVL(A.CNTDEBEMN,0)+NVL(A.CNTHABEMN,0))>0'
         + '    and A.TDIARID = C.TDIARID (+) '
         + '  Group by A.CUENTAID, B.CTADES '
         + '  Order by A.CUENTAID ';
// Fin HPC_201410_CNT
   DMCNT.cdsReporteCuenta.Close;
   DMCNT.cdsReporteCuenta.DataRequest(xSQL);
   DMCNT.cdsReporteCuenta.Open;
End;
// Fin HPC_201407_CNT

Procedure TFLibroDiarioPLE.AbreResumen;
Begin
   xSQL := 'Select cuenta, B.CTADES, '
         + '       sum(CNTDEBE401) CNTDEBE401, sum(CNTHABE401) CNTHABE401, '
         + '       sum(CNTDEBE301) CNTDEBE301, sum(CNTHABE301) CNTHABE301 '
         + '  From (Select substr(D.CUENTAID,1,2)Cuenta,'
         + CampoDBMN + ' CNTDEBE401 ,' + CampoHNMN + ' CNTHABE401, '
         + '               0 CNTDEBE301,0 CNTHABE301 '
         + '          from CNT401 C, TGE101 B, TGE202 D '
         + '         where C.CIAID=' + QuotedStr(FCCuadreMovs.dblcCia.Text)
         + '           and nvl(C.AUXID,''N'')=''N'' '
         + '           and C.CIAID=B.CIAID '
         + '           and nvl(C.CCOSID,''N'')=''N'' '
         + '           and C.ANO=' + QuotedStr(FCCuadreMovs.speAno.Text)
         + '           and D.CIAID(+)=' + QuotedStr(FCCuadreMovs.dblcCia.Text)
         + '           and C.CUENTAID=D.CUENTAID(+) '
         + '           and D.CTA_DET=''S'' '
         + '        union all '
   // Inicio HPC_201404_CNT
         + '        Select Substr(E.CUENTAID,1,2) CUENTA, '
         + '               0 CNTDEBE401, 0 CNTHABE401, '
         + '               nvl(A.CNTDEBEMN,0) CNTDEBE301, nvl(A.CNTHABEMN,0) CNTHABE301 '
         + '          from CNT301 A, TGE202 B, TGE101 D, TGE202 E '
         {
         + '         where A.CIAID=' + QuotedStr(FCCuadreMovs.dblcCia.Text)
         + '           and A.CIAID=D.CIAID '
         + '           and trunc(A.CNTFCOMP)>=to_date(' + quotedstr(formatdatetime(wFormatFecha, FCCuadreMovs.dbdtpFReg1.date)) + ') '
         + '           and trunc(A.CNTFCOMP)<=to_date(' + quotedstr(formatdatetime(wFormatFecha, FCCuadreMovs.dbdtpFReg2.date)) + ') '
         + '           and A.CNTESTADO  = ''P'' AND A.CNTCUADRE=''S'' '
         + '           and B.CIAID(+)=' + QuotedStr(FCCuadreMovs.dblcCia.Text)
         + '           and A.CUENTAID = B.CUENTAID(+) '
         + '           and B.CTA_ME(+)=''S'' '
         + '           and E.CIAID(+)=' + QuotedStr(FCCuadreMovs.dblcCia.Text)
         + '           and A.CUENTAID = E.CUENTAID(+) AND SUBSTR( CNTANOMM,5,2)>''00'' ) A, TGE202 B '
         }
         + '         where A.CIAID=' + QuotedStr(FCCuadreMovs.dblcCia.Text)
         + '           and B.CIAID(+)=' + QuotedStr(FCCuadreMovs.dblcCia.Text)
         + '           and B.CUENTAID(+) = A.CUENTAID '
         + '           and D.CIAID = A.CIAID '
         + '           and E.CIAID(+)=' + QuotedStr(FCCuadreMovs.dblcCia.Text)
         + '           and E.CUENTAID(+) = A.CUENTAID '
         + '           and A.CNTESTADO  = ''P'' AND A.CNTCUADRE=''S'' '
         + '           and B.CTA_ME(+)=''S'' '
         + '           and A.CNTANOMM = '+quotedstr(FCCuadreMovs.speAno.Text+DMCNT.strZero(FCCuadreMovs.speMM.Text,2))
//         + '           and trunc(A.CNTFCOMP)>=to_date(' + quotedstr(formatdatetime(wFormatFecha, FCCuadreMovs.dbdtpFReg1.date)) + ') '
//         + '           and trunc(A.CNTFCOMP)<=to_date(' + quotedstr(formatdatetime(wFormatFecha, FCCuadreMovs.dbdtpFReg2.date)) + ') '
//         + '            AND SUBSTR( CNTANOMM,5,2)>''00''
         + '       ) A, TGE202 B '
   // Fin HPC_201404_CNT
         + ' where (CNTDEBE401+CNTHABE401>0 OR CNTDEBE301+CNTHABE301>0) '
         + '   and B.CIAID=' + QuotedStr(FCCuadreMovs.dblcCia.Text)
         + '   and B.CUENTAID=A.CUENTA '
         + ' group by Cuenta,B.CTADES '
         + ' order by  CUENTA DESC';
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   DMCNT.cdsQry2.First;
End;

Procedure TFLibroDiarioPLE.bbtnExlResumenClick(Sender: TObject);
Begin
   AbreResumen;
   dtgData.DataSource := DMCNT.dsQry2;
   DMCNT.HojaExcel('Libro Diario - PLE', self.dtgData.DataSource, self.dtgData);
End;

// Inicio HPC_201401_CNT
Function TFLibroDiarioPLE.ValidaDatos: Boolean;
var
   xSQL, xPeriodo : String;
begin
   xSQL := 'Select ''1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'' OBSERVAC '
          +'  from DUAL where 1<>1';
   DMCNT.cdsReporte.Close;
   DMCNT.cdsReporte.DataRequest(xSQL);
   DMCNT.cdsReporte.Open;

   result := True;
   xPeriodo := IntToStr(FCCuadreMovs.speAno.Value)+DMCNT.StrZero(IntToStr(FCCuadreMovs.speMM.Value),2);
// valida que no haya registro en negativo
   xSQL := 'select TDIARID, CNTCOMPROB, CNTREG '
          +'  from CNT301 '
          +' where CIAID='+quotedstr(FCCuadreMovs.dblcCia.Text)
          +'   and CNTANOMM='+quotedstr(xPeriodo)
          +'   and CNTMTOLOC<0 ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   if DMCNT.cdsQry.RecordCount>0 then
   begin
      result := False;
      while not DMCNT.cdsQry.EOF do
      begin
         DMCNT.cdsReporte.Append;
         DMCNT.cdsReporte.FieldByName('OBSERVAC').AsString :=
               'VALOR NEGATIVO, TDIARIO='+quotedstr(DMCNT.cdsQry.FieldByName('TDIARID').AsString)
              +' COMPROBANTE='+quotedstr(DMCNT.cdsQry.FieldByName('CNTCOMPROB').AsString)
              +' NRO.REGISTRO='+inttostr(DMCNT.cdsQry.FieldByName('CNTREG').AsInteger);
         DMCNT.cdsReporte.Post;
         DMCNT.cdsQry.Next;
      end;
   end;

// valida que no haya números repetidos de registro en el detalle
   xSQL := 'select TDIARID, CNTCOMPROB, CNTREG, count(CNTREG) VECES '
          +'  from CNT301 '
          +' where CIAID='+quotedstr(FCCuadreMovs.dblcCia.Text)
          +'   and CNTANOMM='+quotedstr(xPeriodo)
          +' group by TDIARID, CNTCOMPROB, CNTREG '
          +'having count(CNTREG)>1 ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   if DMCNT.cdsQry.RecordCount>0 then
   begin
      result := False;
      while not DMCNT.cdsQry.EOF do
      begin
         DMCNT.cdsReporte.Append;
         DMCNT.cdsReporte.FieldByName('OBSERVAC').AsString :=
               'NRO REG.DUPLICADO, TDIARIO='+quotedstr(DMCNT.cdsQry.FieldByName('TDIARID').AsString)
              +' COMPROBANTE='+quotedstr(DMCNT.cdsQry.FieldByName('CNTCOMPROB').AsString)
              +' NRO.REGISTRO='+inttostr(DMCNT.cdsQry.FieldByName('CNTREG').AsInteger);
         DMCNT.cdsReporte.Post;
         DMCNT.cdsQry.Next;
      end;
   end;

// valida que no haya glosas con '|'
   xSQL := 'select * '
          +'  from (select TDIARID, CNTCOMPROB, CNTREG, CNTGLOSA, '
          +'               case when instr(CNTGLOSA,''|'')=0 '
          +'                    then ''''  '
          +'                    else CNTGLOSA '
          +'                end OBSERVA '
          +'          from CNT301 '
          +' where CIAID='+quotedstr(FCCuadreMovs.dblcCia.Text)
          +'   and CNTANOMM='+quotedstr(xPeriodo)
          +'       ) where OBSERVA is not null ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   if DMCNT.cdsQry.RecordCount>0 then
   begin
      result := False;
      while not DMCNT.cdsQry.EOF do
      begin
         DMCNT.cdsReporte.Append;
         DMCNT.cdsReporte.FieldByName('OBSERVAC').AsString :=
               'GLOSA CON CARACTER PROHIBIDO, TDIARIO='+quotedstr(DMCNT.cdsQry.FieldByName('TDIARID').AsString)
              +' COMPROBANTE='+quotedstr(DMCNT.cdsQry.FieldByName('CNTCOMPROB').AsString)
              +' NRO.REGISTRO='+inttostr(DMCNT.cdsQry.FieldByName('CNTREG').AsInteger);
         DMCNT.cdsReporte.Post;
         DMCNT.cdsQry.Next;
      end;
   end;

   if DMCNT.cdsReporte.recordcount>0 then
   begin
      ShowMessage('Se ha(n) presentado inconsistencia(s) en la data, verifique los asientos');
      dtgData.DataSource := DMCNT.dsReporte;
      DMCNT.HojaExcel('Observaciones - PLE', self.dtgData.DataSource, self.dtgData);
      DMCNT.cdsReporte.Close;
   end;
end;
// Fin HPC_201401_CNT

End.

