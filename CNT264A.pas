Unit CNT264A;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : CNT264A
//Formulario               : FMayAuxDet
//Fecha de Creación        : 31/07/2013
//Autor                    : Ricardo Medina Zavaleta
//Objetivo                 : Informacioòn para la Planilla Electronica PLE

// Actualizaciones

// HPC_201302_CNT          31/07/2013  Creación del Formulario
// HPC_201404_CNT          27/03/2014  Se cambia rango de fechas por AÑO+MES
// HPC_201407_CNT          30/05/2014  Realizar modificaciones del archivo que se genera del PLE al formato nuevo de Sunat.
// HPC_201410_CNT          30/09/2014  Reemplaza Cuenta 79 por Cuenta 791
// HPC_201501_CNT          06/02/2015  Modifica prefijo de nro.comprobante para inicio y fin de año
// HPC_201602_CNT          17/06/2016  DAF_2016000251 Modifica Nuevas estructuras del PLE SUNAT

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, DBClient, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid,
   ExtCtrls, Mask, ppTypes, ComCtrls, StrContainer, FileCtrl, ppCtrls,
   ppBands, ppVar, ppPrnabl, ppClass, ppDB, ppCache, ppDBPipe, ppDBBDE,
   ppComm, ppRelatv, ppProd, ppReport, DBGrids, ppEndUsr, ppParameter;
Type
   TFLibMayorPLE = Class(TForm)
      pnlAdvertencias: TPanel;
      Shape15: TShape;
      Label48: TLabel;
      Shape16: TShape;
      BitBtn5: TBitBtn;
      BitBtn2: TBitBtn;
      pbExp: TProgressBar;
      dbgMayoraux: TwwDBGrid;
      BtnImprime: TBitBtn;
      btnExcel: TBitBtn;
      rptPLEMAyorAux: TppReport;
      ppdbResumenPLE: TppBDEPipeline;
      dtgData: TDBGrid;
      ppdPLEMayorAux: TppDesigner;
      ppParameterList1: TppParameterList;
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
      Procedure BitBtn5Click(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure BtnImprimeClick(Sender: TObject);
      Procedure btnExcelClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);

   // Inicio HPC_201602_CNT
   // Añade procedimiento para seleccionar registros
      Procedure AbreDetalle;
   // Fin HPC_201602_CNT

   Private
    { Private declarations }
   Public
    { Public declarations }
      sCiaOrigen: String;
      sCiaCuenta: String;
      Procedure fg_PLEexportarFormato(xCarpete: String);
   End;

Var
   FLibMayorPLE: TFLibMayorPLE;

Implementation
Uses CNTDM, CNT264;

{$R *.dfm}

Procedure TFLibMayorPLE.BitBtn5Click(Sender: TObject);
Var
   xsCarpeta: String;
Begin
   If SelectDirectory('Selecciona una Carpeta', '', xsCarpeta) Then
   Begin
      If Copy(xsCarpeta, Length(xsCarpeta), 1) <> '\' Then
      Begin
         xsCarpeta := xsCarpeta + '\';
         Screen.Cursor := crHourGlass;
         fg_PLEexportarFormato(xsCarpeta);
      End;
   End;
   BitBtn2Click(SELF);
   Screen.Cursor := crDefault;
End;


// Inicio HPC_201602_CNT
// Modificaciones a estructura de datos del PLE
Procedure TFLibMayorPLE.fg_PLEexportarFormato(xCarpete: String);
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
Begin

   xsDelimitador := '|';
   xperiodo := Trim(FMayAuxDet.speAno.Text) + DMCNT.StrZero(Trim(FMayAuxDet.speMM.Text), 2);
   xsRuc := DMCNT.DisplayDescrip('', 'TGE101', 'CIARUC', 'CIAID = ' + QuotedStr('01'), 'CIARUC');
   xsNombre := 'LE' + xsRuc + xperiodo + '00' + '060100' + '00' + '1' + '1' + '1' + '1' + '.txt';
   wgArchivo := xCarpete + xsNombre;

   Screen.Cursor := crHourGlass;

   AbreDetalle;

   AssignFile(xfArchivoTexto, wgArchivo);
   Rewrite(xfArchivoTexto);
   vcorrelativ := 1;

   pbExp.Max := DMCNT.cdsReporte.RecordCount;
   pbExp.Position := 0;
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
         ShowMessage('El periodo de la Fecha de Emisión no puede ser mayor');
         exit ;
      end;

      xsTmonid := 'PEN';
      if DMCNT.cdsReporte.FieldByName('TMONID').AsString = 'D' then
         xsTmonid := 'USD';
      xcntfecven := Trim(DMCNT.cdsReporte.FieldByName('CNTFVCMTO').asstring);
      xsDocid := Trim(DMCNT.cdsReporte.FieldByName('DOCID').asstring);
      xsSerie := Trim(DMCNT.cdsReporte.FieldByName('CNTSERIE').asstring);

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

      xcorrelativo := copy(Trim(DMCNT.cdsReporte.FieldByName('CORRELATIVO').asstring),1,4) + copy(Trim(DMCNT.cdsReporte.FieldByName('CORRELATIVO').asstring),8,9);;
      xsMes :=  copy(xperiodo,5,2);
      If (StrToInt(xsMes) > 1) and (StrToInt(xsMes) < 12)  then
         xsRER := 'M';
      If (StrToInt(xsMes) = 1) then
         xsRER := 'A';
      If (StrToInt(xsMes) = 12) then
         xsRER := 'C';
      xCorre := copy(Trim(DMCNT.cdsReporte.FieldByName('CORRELATIVO').asstring),1,4) + copy(Trim(DMCNT.cdsReporte.FieldByName('CORRELATIVO').asstring),8,5);
      If xCorrelativo = '0' then
      Begin
          xCorrelativo := Trim(DMCNT.cdsReporte.FieldByName('TDIARID').asstring) + copy(Trim(DMCNT.cdsReporte.FieldByName('CNTCOMPROB').asstring),1,2) + copy(Trim(DMCNT.cdsReporte.FieldByName('CNTCOMPROB').asstring),6,5) + Trim(DMCNT.cdsReporte.FieldByName('CNTREG').asstring);
          xCorre := Trim(DMCNT.cdsReporte.FieldByName('TDIARID').asstring) + copy(Trim(DMCNT.cdsReporte.FieldByName('CNTCOMPROB').asstring),1,2) + copy(Trim(DMCNT.cdsReporte.FieldByName('CNTCOMPROB').asstring),6,5) ;
      End;

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

   CloseFile(xfArchivoTexto);
   DMCNT.cdsReporte.Close;
   ShowMessage('Proceso terminado. Se ha generado' + #13 + 'correctamente el archivo ' + wgArchivo);

End;
// Fin HPC_201602_CNT

// Inicio HPC_201602_CNT
// Procedimiento para extraer datos
Procedure TFLibMayorPLE.AbreDetalle;
Var
   xSQL, SalIniHas, xMonedaL, xMonedaE, sCtaLog: String;
   wFecha1, wFecha, wAno, wMes, wMesAnt, xGrp, wgArchivo: String;
   CampoDMN, CampoHMN, CampoSMN, CampoDME, CampoHME, CampoSME: String;
   wMesx, wAnox, xsRuc, xperiodo, xcntcomprob, xctasec, xcntglosa: String;
   xcntfemis, xcntdebemn, xcnthabemn, xcorrelativo, xsDelimitador, xsNombre: String;
   Year, Month, Day: Word;
   vcorrelativ, xTem: integer;
   xfArchivoTexto: TextFile;
   xsMes: String;
   xsRER: String;
   xsVentas: String;
   xsCompras: String;
   xcorre: String;
   i: Integer;
Begin
   SalIniHas := quotedStr(formatdatetime(wFormatFecha, FMayAuxDet.dbdtpFReg2.DateTime));
   xMonedaL := DMCNT.DisplayDescrip('prvTGE', 'TGE103', 'TMONABR', 'TMON_LOC=' + quotedstr('L'), 'TMONABR');
   xMonedaE := DMCNT.DisplayDescrip('prvTGE', 'TGE103', 'TMONABR', 'TMON_LOC=' + quotedstr('E'), 'TMONABR');
   SFMN := 0;
   SFME := 0;
   xx := 0;
   xWhere := '';
   xWhere1 := '';
   sCtaLog := '';

   Screen.Cursor := crHourGlass;
   DecodeDate(FMayAuxDet.dbdtpFReg1.Date, Year, Month, Day);
   wMes := inttostr(Month);
   wMes := DMCNT.StrZero(wMes, 2);
   wMesAnt := IntToStr(StrToInt(wMes) - 1);
   wMesAnt := DMCNT.StrZero(wMesAnt, 2);
   wAno := IntToStr(Year);
   wFecha := 'TO_DATE(' + quotedstr('01' + '-' + wMes + '-' + wAno) + ')'; // Fecha inicio pa movs faltantes

   wFecha1 := '01/' + wMes + '/' + wano;
   CampoSMN := 'SALDMN' + wMesAnt;
   CampoSME := 'SALDME' + wMesAnt;
   CampoDMN := 'DEBEMN' + wMes;
   CampoHMN := 'HABEMN' + wMes;
   CampoDME := 'DEBEME' + wMes;
   CampoHME := 'HABEME' + wMes;

   wMesx := DMCNT.StrZero(IntToStr(FMayAuxDet.speMM.Value), 2);
   wAnox := IntToStr(FMayAuxDet.speAno.Value);

   xSQL := 'Select ''0'' CORRELATIVO, ''99'' TDIARID, ''999999999X'' CNTCOMPROB,  '
         + '       D.CUENTAID, '
         + '       (case when D.CUENTAID=''79'' then ''791'' else D.CUENTAID end) CUENTA_SUNAT, '
         + '       ''Saldo Anterior'' CNTGLOSA, TO_DATE('''') CNTFCOMP, TO_DATE(''' + wFecha1 + ''') CNTFEMIS, '
         + '       case when nvl(' + CampoSMN + ',0)>0 then nvl(' + CampoSMN + ',0) else 0 end CNTDEBEMN, '
         + '       case when nvl(' + CampoSME + ',0)>0 then nvl(' + CampoSME + ',0) else 0 end CNTDEBEME, '
         + '       case when nvl(' + CampoSMN + ',0)>0 then 0 else nvl(' + CampoSMN + ',0)*-1 end CNTHABEMN, '
         + '       case when nvl(' + CampoSME + ',0)>0 then 0 else nvl(' + CampoSME + ',0)*-1 end CNTHABEME, '
         + '       D.CTADES, E.REGISTRO, ''' + wAnox + wMesx + ''' CNTANOMM, '' '' TMONID, '' '' DOCID, '
         + '       '''' CNTSERIE, ''0'' CNTNODOC, ''0000'' CNTREG, '
         + '       TO_DATE('''')  CNTFVCMTO, ''''  CNTCOL20 '
         + '  from CNT401 C, TGE101 B, TGE202 D, TGE104 E '
         + ' where C.CIAID=' + QuotedStr(FMayAuxDet.dblcCia.Text) + ' ' + xWhere + ' '
         + '   and NVL(C.AUXID,''N'')=''N'' '
         + '   and C.CIAID=B.CIAID '
         + '   and E.TDIARID=''99'' '
         + '   and NVL(C.CCOSID,''N'')=''N'' '
         + '   and C.ANO=' + QuotedStr(FMayAuxDet.speAno.Text) + ' '
         + '   and D.CIAID(+)=' + quotedstr(FMayAuxDet.dblcCia.Text) + ' AND C.CUENTAID=D.CUENTAID(+) '
         + '   and D.CTA_DET=''S'' '  ;

   If sCiaCuenta <> '' Then
      xSQL := xSQL + ' and C.' + sCiaCuenta;
   xSQL := xSQL
         + 'union all '

         + 'Select A.TDIARID||A.CNTCOMPROB||LPAD(TRIM(CNTREG),4,''0'') CORRELATIVO, A.TDIARID, A.TDIARID||A.CNTCOMPROB CNTCOMPROB, '
         + '       A.CUENTAID, '
         + '       (case when A.CUENTAID=''79'' then ''791'' else A.CUENTAID end) CUENTA_SUNAT, '
         + '       A.CNTGLOSA, trunc(A.CNTFCOMP) CNTFCOMP, A.CNTFEMIS, '
         + '       NVL(A.CNTDEBEMN,0) CNTDEBEMN, NVL(A.CNTDEBEME,0) CNTDEBEME, '
         + '       NVL(A.CNTHABEMN,0) CNTHABEMN, NVL(A.CNTHABEME,0) CNTHABEME, B.CTADES, C.REGISTRO, '
         + '       A.CNTANOMM, A.TMONID, nvl(D.TDOC_SUNAT,''00'') DOCID, '
         + '       case when D.TDOC_SUNAT in (''01'',''02'',''03'',''04'',''05'',''07'',''08'',''12'',''20'') then UPPER(A.CNTSERIE) else '''' end CNTSERIE, '
         + '       case when escadenanumerica(nvl(A.CNTNODOC,''''))= ''TRUE'' then A.CNTNODOC else ''0'' end CNTNODOC, '
         + '       LPAD(TRIM(A.CNTREG),4,''0'') CNTREG, A.CNTFVCMTO, '
         + '       (case when C.REGISTRO = ''V'' then ''140100'' '
         + '             when C.REGISTRO = ''C'' and A.DOCID =''91'' then ''080200'' '
         + '             when C.REGISTRO = ''C'' and A.DOCID <>''91'' then ''080100'' '
         + '             else '''' '
         + '        end) CNTCOL20 '
         + '  From CNT301 A,TGE202 B, TGE104 C, TGE110 D '
         + ' Where A.CIAID=' + quotedstr(FMayAuxDet.dblcCia.Text)
         + '   and A.CNTANOMM = '+quotedstr(FMayAuxDet.speAno.Text+DMCNT.strZero(FMayAuxDet.speMM.Text,2))
         + '   and A.CNTCUADRE=''S'' '
         + '   and (A.CIAID=B.CIAID(+) and A.CUENTAID=B.CUENTAID(+)) '
         + '   and (NVL(A.CNTDEBEMN,0)+NVL(A.CNTHABEMN,0))>0'
         + '   and A.TDIARID = C.TDIARID (+) '
         + '   and D.TDIARID(+) = A.TDIARID and D.DOCID(+) = A.DOCID ' ;

   xSQL := 'Select CORRELATIVO, TDIARID, CNTCOMPROB, CUENTAID, CUENTA_SUNAT, CNTGLOSA, CNTFCOMP, CNTFEMIS, '
         + '       CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CTADES, REGISTRO, CNTANOMM, TMONID, DOCID, '
         + '       CNTSERIE, CNTNODOC, CNTREG, CNTFVCMTO, CNTCOL20 '
         + '  From ( ' + xSQL + ' ) '
         + ' Order by CORRELATIVO,CNTANOMM,CNTFCOMP ';
   DMCNT.cdsReporte.Close;
   DMCNT.cdsReporte.DataRequest(xSQL);
   DMCNT.cdsReporte.Open;
End;
// Fin HPC_201602_CNT

Procedure TFLibMayorPLE.FormShow(Sender: TObject);
Var
   xSQL: String;
   Year, Month, Day: Word;
   wMes, wMesAnt, CampoSaldoMesAct, CampoSaldoMesAnt, xCampoSaldoDEBE, xCampoSaldoHABER: String;
   xnSALDebeIni, xnSALHabeIni,
      xnCNTDebeAct, xnCNTHabeAct, xnCNTDebeFin, xnCNTHabeFin,
      xnSALDebeAct, xnSALHabeAct, xnSALDebeFin, xnSALHabeFin: currency;
Begin

   FLibMayorPLE.Caption := Trim(FLibMayorPLE.Caption) + ' ' + IntToStr(FMayAuxDet.speAno.Value) + '-' + DMCNT.StrZero(IntToStr(FMayAuxDet.speMM.Value), 2);
   pplblPeriodo.Text := IntToStr(FMayAuxDet.speAno.Value) + '-' + DMCNT.StrZero(IntToStr(FMayAuxDet.speMM.Value), 2);

   DecodeDate(FMayAuxDet.dbdtpFReg1.Date, Year, Month, Day);
   wMes := inttostr(Month);
   wMes := DMCNT.StrZero(wMes, 2);
   CampoSaldoMesAct := 'SALDMN' + wMes;

   wMesAnt := IntToStr(StrToInt(wMes) - 1);
   wMesAnt := DMCNT.StrZero(wMesAnt, 2);
   CampoSaldoMesAnt := 'SALDMN' + wMesAnt;

   xCampoSaldoDEBE := 'DEBEMN' + wMes;
   xCampoSaldoHABER := 'HABEMN' + wMes;

   xSQL := 'Select CUENTA, B.CTADES, '

   // Inicio HPC_201404_CNT .
         + '              case when (sum(SALDEBEINI)-sum(SALHABEINI))>0 '
         + '                   then (sum(SALDEBEINI)-sum(SALHABEINI)) '
         + '                   else 0.00 '
         + '              end SALDEBEINI, '

         + '              case when (sum(SALDEBEINI)-sum(SALHABEINI))<0 '
         + '                   then (sum(SALHABEINI)-sum(SALDEBEINI)) '
         + '                   else 0.00 '
         + '              end SALHABEINI, '
//         + '       sum(SALDEBEINI) SALDEBEINI, '
//         + '       sum(SALHABEINI) SALHABEINI,'
   // Fin HPC_201404_CNT .

         + '       sum(CNTDEBEMN) CNTDEBEACT,'
         + '       sum(CNTHABEMN) CNTHABEACT,'

         + '       sum(SALDEBEINI)+sum(CNTDEBEMN) CNTDEBEFIN, '
         + '       sum(SALHABEINI)+sum(CNTHABEMN) CNTHABEFIN, '

         + '       sum(SALDEBEACT) SALDEBEACT, '
         + '       sum(SALHABEACT) SALHABEACT,'

         + '       sum(SALDEBEFIN) SALDEBEFIN, '
         + '       sum(SALHABEFIN) SALHABEFIN  '

         + '  From (Select substr(D.CUENTAID,1,2) CUENTA, '
         + '               0.00 CNTDEBEMN, '
         + '               0.00 CNTHABEMN, '
         + '               case when nvl(' + CampoSaldoMesAnt + ',0)>0 then nvl(' + CampoSaldoMesAnt + ',0) else 0 end SALDEBEINI,'
         + '               case when nvl(' + CampoSaldoMesAnt + ',0)<0 then nvl(' + CampoSaldoMesAnt + ',0)*-1 else 0 end SALHABEINI,'
         + '               ' + xCampoSaldoDEBE + ' SALDEBEACT, '
         + '               ' + xCampoSaldoHABER + ' SALHABEACT, '
         + '               (case when nvl(' + CampoSaldoMesAnt + ',0)>0 then nvl(' + CampoSaldoMesAnt + ',0) else 0 end) +' + xCampoSaldoDEBE + ' SALDEBEFIN,'
         + '               (case when nvl(' + CampoSaldoMesAnt + ',0)<0 then nvl(' + CampoSaldoMesAnt + ',0)*-1 else 0 end) +' + xCampoSaldoHABER + ' SALHABEFIN '
         + '          from CNT401 C, TGE101 B, TGE202 D '
         + '         where C.CIAID=' + QuotedStr(FMayAuxDet.dblcCia.Text)
         + '           and NVL(C.AUXID,''N'')=''N'' '
         + '           and C.CIAID=B.CIAID '
         + '           and NVL(C.CCOSID,''N'')=''N'' '
         + '           and C.ANO=' + QuotedStr(FMayAuxDet.speAno.Text)
         + '           and D.CIAID(+)=' + QuotedStr(FMayAuxDet.dblcCia.Text)
         + '           and C.CUENTAID=D.CUENTAID(+) '
         + '           and D.CTA_DET=''S'' '
         + '        union all '
   // Inicio HPC_201404_CNT
         + '        Select Substr(E.CUENTAID,1,2) CUENTA, '
         + '               NVL(A.CNTDEBEMN,0) CNTDEBEMN, '
         + '               NVL(A.CNTHABEMN,0) CNTHABEMN, '
         + '               0.00 SALDEBEINI, '
         + '               0.00 SALHABEINI, '
         + '               0.00 SALDEBEACT, '
         + '               0.00 SALHABEACT, '
         + '               0.00 SALDEBEFIN, '
         + '               0.00 SALHABEFIN '
         + '          from CNT301 A, TGE202 B, TGE101 D, TGE202 E '
         {
         + '         where A.CIAID=' + QuotedStr(FMayAuxDet.dblcCia.Text)
         + '           and A.CIAID=D.CIAID '
         + '           and trunc(A.CNTFCOMP)>=to_date(' + '''' + formatdatetime(wFormatFecha, FMayAuxDet.dbdtpFReg1.date) + '''' + ') '
         + '           and trunc(A.CNTFCOMP)<=to_date(' + '''' + formatdatetime(wFormatFecha, FMayAuxDet.dbdtpFReg2.date) + '''' + ') '
         + '           and A.CNTESTADO  = ''P'' '
         + '           and A.CNTCUADRE=''S'' '
         + '           and B.CIAID(+)=' + QuotedStr(FMayAuxDet.dblcCia.Text)
         + '           and A.CUENTAID = B.CUENTAID(+) '
         + '           and B.CTA_ME(+)=''S'' '
         + '           and E.CIAID(+)=' + QuotedStr(FMayAuxDet.dblcCia.Text)
         + '           and A.CUENTAID = E.CUENTAID(+) '
         + '           and (NVL(A.CNTDEBEMN,0)+NVL(A.CNTHABEMN,0))>0'
         + '           and SUBSTR( CNTANOMM,5,2)>''00'' '
         }
         + '         where A.CIAID=' + QuotedStr(FMayAuxDet.dblcCia.Text)
         + '           and B.CIAID(+)=' + QuotedStr(FMayAuxDet.dblcCia.Text)
         + '           and B.CUENTAID(+) = A.CUENTAID '
         + '           and D.CIAID = A.CIAID '
         + '           and E.CIAID(+)=' + QuotedStr(FMayAuxDet.dblcCia.Text)
         + '           and E.CUENTAID(+) = A.CUENTAID '
//         + '           and trunc(A.CNTFCOMP)>=to_date(' + '''' + formatdatetime(wFormatFecha, FMayAuxDet.dbdtpFReg1.date) + '''' + ') '
//         + '           and trunc(A.CNTFCOMP)<=to_date(' + '''' + formatdatetime(wFormatFecha, FMayAuxDet.dbdtpFReg2.date) + '''' + ') '
         + '           and A.CNTANOMM = '+quotedstr(FMayAuxDet.speAno.Text+DMCNT.strZero(FMayAuxDet.speMM.Text,2))

         + '           and A.CNTESTADO  = ''P'' '
         + '           and A.CNTCUADRE=''S'' '
         + '           and B.CTA_ME(+)=''S'' '
         + '           and (NVL(A.CNTDEBEMN,0)+NVL(A.CNTHABEMN,0))>0'
//         + '           and SUBSTR( CNTANOMM,5,2)>''00'' '
//         + '           and SUBSTR( CNTANOMM,5,2)<''13'' '
   // Fin HPC_201404_CNT
         + '       ) A, TGE202 B '
         + ' where ' //CNTDEBEMN+CNTHABEMN>0 and
         + '       B.CIAID=' + QuotedStr(FMayAuxDet.dblcCia.Text)
         + '   and B.CUENTAID=A.CUENTA '
         + ' Group by CUENTA, B.CTADES '
         + ' Order by CUENTA ';
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   DMCNT.cdsQry2.First;
   dbgMayoraux.datasource := DMCNT.dsQry2;

   dbgMayoraux.Selected.Clear;
   dbgMayoraux.Selected.Add('CUENTA'#9'2'#9'Cuenta'#9#9);
   dbgMayoraux.Selected.Add('CTADES'#9'30'#9'Descripción'#9#9);

   dbgMayoraux.Selected.Add('SALDEBEINI'#9'17'#9'S.Ini.Debe '#9'F'#9'Saldos Iniciales');
   dbgMayoraux.Selected.Add('SALHABEINI'#9'17'#9'S.Ini.Haber'#9'F'#9'Saldos Iniciales');

   dbgMayoraux.Selected.Add('CNTDEBEACT'#9'17'#9'Debe '#9'F'#9'Libro Mayor - PLE');
   dbgMayoraux.Selected.Add('CNTHABEACT'#9'17'#9'Haber'#9'F'#9'Libro Mayor - PLE');
   dbgMayoraux.Selected.Add('CNTDEBEFIN'#9'17'#9'S.Fin Debe '#9'F'#9'Libro Mayor - PLE');
   dbgMayoraux.Selected.Add('CNTHABEFIN'#9'17'#9'S.Fin Haber'#9'F'#9'Libro Mayor - PLE');

   dbgMayoraux.Selected.Add('SALDEBEACT'#9'17'#9'Debe '#9'F'#9'Saldos Balance General');
   dbgMayoraux.Selected.Add('SALHABEACT'#9'17'#9'Haber'#9'F'#9'Saldos Balance General');
   dbgMayoraux.Selected.Add('SALDEBEFIN'#9'17'#9'S.Fin Debe '#9'F'#9'Saldos Balance General');
   dbgMayoraux.Selected.Add('SALHABEFIN'#9'17'#9'S.Fin Haber'#9'F'#9'Saldos Balance General');
   dbgMayoraux.RefreshDisplay;

   TNumericField(DMCNT.cdsQry2.FieldByName('SALDEBEINI')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCNT.cdsQry2.FieldByName('SALHABEINI')).DisplayFormat := '###,###,##0.00';

   TNumericField(DMCNT.cdsQry2.FieldByName('CNTDEBEACT')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCNT.cdsQry2.FieldByName('CNTHABEACT')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCNT.cdsQry2.FieldByName('CNTDEBEFIN')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCNT.cdsQry2.FieldByName('CNTHABEFIN')).DisplayFormat := '###,###,##0.00';

   TNumericField(DMCNT.cdsQry2.FieldByName('SALDEBEACT')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCNT.cdsQry2.FieldByName('SALHABEACT')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCNT.cdsQry2.FieldByName('SALDEBEFIN')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMCNT.cdsQry2.FieldByName('SALHABEFIN')).DisplayFormat := '###,###,##0.00';

   xnSALDebeIni := 0;
   xnSALHabeIni := 0;
   xnCNTDebeAct := 0;
   xnCNTHabeAct := 0;
   xnCNTDebeFin := 0;
   xnCNTHabeFin := 0;
   xnSALDebeAct := 0;
   xnSALHabeAct := 0;
   xnSALDebeFin := 0;
   xnSALHabeFin := 0;

   dbgMayoraux.ColumnByName('SALDEBEINI').FooterValue := '0.00';
   dbgMayoraux.ColumnByName('SALHABEINI').FooterValue := '0.00';
   dbgMayoraux.ColumnByName('CNTDEBEACT').FooterValue := '0.00';
   dbgMayoraux.ColumnByName('CNTHABEACT').FooterValue := '0.00';
   dbgMayoraux.ColumnByName('CNTDEBEFIN').FooterValue := '0.00';
   dbgMayoraux.ColumnByName('CNTHABEFIN').FooterValue := '0.00';
   dbgMayoraux.ColumnByName('SALDEBEACT').FooterValue := '0.00';
   dbgMayoraux.ColumnByName('SALHABEACT').FooterValue := '0.00';
   dbgMayoraux.ColumnByName('SALDEBEFIN').FooterValue := '0.00';
   dbgMayoraux.ColumnByName('SALHABEFIN').FooterValue := '0.00';

   DMCNT.cdsQry2.First;
   While Not DMCNT.cdsQry2.eof Do
   Begin
      xnSALDebeIni := xnSALDebeIni + DMCNT.cdsQry2.FieldByName('SALDEBEINI').AsFloat;
      xnSALHabeIni := xnSALHabeIni + DMCNT.cdsQry2.FieldByName('SALHABEINI').AsFloat;
      xnCNTDebeAct := xnCNTDebeAct + DMCNT.cdsQry2.FieldByName('CNTDEBEACT').AsFloat;
      xnCNTHabeAct := xnCNTHabeAct + DMCNT.cdsQry2.FieldByName('CNTHABEACT').AsFloat;
      xnCNTDebeFin := xnCNTDebeFin + DMCNT.cdsQry2.FieldByName('CNTDEBEFIN').AsFloat;
      xnCNTHabeFin := xnCNTHabeFin + DMCNT.cdsQry2.FieldByName('CNTHABEFIN').AsFloat;
      xnSALDebeAct := xnSALDebeAct + DMCNT.cdsQry2.FieldByName('SALDEBEACT').AsFloat;
      xnSALHabeAct := xnSALHabeAct + DMCNT.cdsQry2.FieldByName('SALHABEACT').AsFloat;
      xnSALDebeFin := xnSALDebeFin + DMCNT.cdsQry2.FieldByName('SALDEBEFIN').AsFloat;
      xnSALHabeFin := xnSALHabeFin + DMCNT.cdsQry2.FieldByName('SALHABEFIN').AsFloat;
      DMCNT.cdsQry2.Next;
   End;
   DMCNT.cdsQry2.First;
   dbgMayoraux.ColumnByName('SALDEBEINI').FooterValue := FormatFloat('###,###,##0.00', xnSALDebeIni);
   dbgMayoraux.ColumnByName('SALHABEINI').FooterValue := FormatFloat('###,###,##0.00', xnSALHabeIni);
   dbgMayoraux.ColumnByName('CNTDEBEACT').FooterValue := FormatFloat('###,###,##0.00', xnCNTDebeAct);
   dbgMayoraux.ColumnByName('CNTHABEACT').FooterValue := FormatFloat('###,###,##0.00', xnCNTHabeAct);
   dbgMayoraux.ColumnByName('CNTDEBEFIN').FooterValue := FormatFloat('###,###,##0.00', xnCNTDebeFin);
   dbgMayoraux.ColumnByName('CNTHABEFIN').FooterValue := FormatFloat('###,###,##0.00', xnCNTHabeFin);
   dbgMayoraux.ColumnByName('SALDEBEACT').FooterValue := FormatFloat('###,###,##0.00', xnSALDebeAct);
   dbgMayoraux.ColumnByName('SALHABEACT').FooterValue := FormatFloat('###,###,##0.00', xnSALHabeAct);
   dbgMayoraux.ColumnByName('SALDEBEFIN').FooterValue := FormatFloat('###,###,##0.00', xnSALDebeFin);
   dbgMayoraux.ColumnByName('SALHABEFIN').FooterValue := FormatFloat('###,###,##0.00', xnSALHabeFin);
   dbgMayoraux.RefreshDisplay;
End;

Procedure TFLibMayorPLE.BitBtn2Click(Sender: TObject);
Begin
   Close;
End;

Procedure TFLibMayorPLE.BtnImprimeClick(Sender: TObject);
Begin
   ppdbResumenPLE.DataSource := DMCNT.dsQry2;
   ppdPLEMayorAux.Report := rptPLEMAyorAux;
//   ppdPLEMayorAux.Show;
   rptPLEMAyorAux.Print;
   rptPLEMAyorAux.Cancel;
End;

Procedure TFLibMayorPLE.btnExcelClick(Sender: TObject);
Begin
   dtgData.DataSource := DMCNT.dsQry2;
   DMCNT.HojaExcel('Libro Mayor - PLE', self.dtgData.DataSource, self.dtgData);
End;

Procedure TFLibMayorPLE.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMCNT.cdsReporte.Close;
   DMCNT.cdsQry2.Close;
End;

End.

