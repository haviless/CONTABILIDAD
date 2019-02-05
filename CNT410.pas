Unit CNT410;

// Actualizaciones
// SAR2010-0299   DAD-AS-2010-0012
// HPC_201302_CNT
// HPC_201602_CNT   DAF_2016000605_CNT_1 27/04/2016 Pide nombre y carpeta de archivo

Interface

Uses
   Windows, Messages, SysUtils, StrUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ExtCtrls, wwdbdatetimepicker, wwdblook, Buttons, Wwdbdlg, oaVariables,
   Grids, Wwdbigrd, Wwdbgrid, ppCtrls, ppPrnabl, ppClass, ppBands, ppProd,
   ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppVar, ppviewr, ppModule,
   daDatMod, Db, DBClient, wwclient, Wwdatsrc, Spin, ppEndUsr,
   StrContainer, ComCtrls, ppParameter, DBGrids, shellapi, wwexport;

Type
   TFAnalisisAuxiliar = Class(TForm)
      pnlMayorAn: TPanel;
      lblCia: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label2: TLabel;
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      dbdtpFReg1: TwwDBDateTimePicker;
      dbdtpFReg2: TwwDBDateTimePicker;
      rgMoneda: TRadioGroup;
      gbParametros: TGroupBox;
      edtTit: TEdit;
      ckTDiario: TCheckBox;
      dblcTDiario: TwwDBLookupCombo;
      edtTDiario: TEdit;
      rgCuenta: TRadioGroup;
      rgAuxiliar: TRadioGroup;
      rgOrdenListado: TRadioGroup;
      Label1: TLabel;
      Z2bbtnSelCuenta: TBitBtn;
      Z2bbtnSelAuxiliar: TBitBtn;
      ppDBP1: TppDBPipeline;
      ppDBP2: TppDBPipeline;
      gbPer: TGroupBox;
      speAno: TSpinEdit;
      speMM: TSpinEdit;
      pprptAnaAuxUni: TppReport;
      pprptAnaAuxAmb: TppReport;
      rgCuentaSola: TRadioGroup;
      Z2bbtnSelCuentaSola: TBitBtn;
      rgEstDoc: TRadioGroup;
      rgReporte: TRadioGroup;
      ppHeaderBand2: TppHeaderBand;
      pplblTitulo1: TppLabel;
      ppLabel12: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      pplblCiaA: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppLabel20: TppLabel;
      ppSystemVariable5: TppSystemVariable;
      ppLabel21: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppLabel22: TppLabel;
      ppLabel13: TppLabel;
      ppLabel11: TppLabel;
      ppLabel27: TppLabel;
      ppLabel33: TppLabel;
      pplblRango1: TppLabel;
      ppLabel17: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      pplbEst: TppLabel;
      pplbEstado: TppLabel;
      ppLabel43: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppVariable8: TppVariable;
      ppVariable9: TppVariable;
      ppDBText23: TppDBText;
      ppDBText17: TppDBText;
      ppSummaryBand2: TppSummaryBand;
      ppLabel28: TppLabel;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppVariable4: TppVariable;
      ppDBCalc23: TppDBCalc;
      ppDBCalc24: TppDBCalc;
      ppVariable12: TppVariable;
      ppLabel39: TppLabel;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppLabel29: TppLabel;
      ppVariable5: TppVariable;
      ppDBCalc21: TppDBCalc;
      ppDBCalc22: TppDBCalc;
      ppVariable7: TppVariable;
      ppLabel35: TppLabel;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppLabel31: TppLabel;
      ppVariable11: TppVariable;
      ppDBCalc17: TppDBCalc;
      ppDBCalc18: TppDBCalc;
      ppVariable6: TppVariable;
      ppLabel34: TppLabel;
      ppdbtAuxDes2: TppDBText;
      ppdbtClAux2: TppDBText;
      ppdbtAux2: TppDBText;
      ppGroup6: TppGroup;
      ppGroupHeaderBand6: TppGroupHeaderBand;
      ppDBText24: TppDBText;
      ppLabel2: TppLabel;
      ppGroupFooterBand6: TppGroupFooterBand;
      ppLabel32: TppLabel;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppVariable10: TppVariable;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppVariable3: TppVariable;
      ppDBCalc25: TppDBCalc;
      ppDBCalc26: TppDBCalc;
      pplDoc2: TppLabel;
      ppdbtNoDoc2: TppDBText;
      ppd1: TppDesigner;
      bbtnTexto: TBitBtn;
      sdGraba: TSaveDialog;
      pbExp: TProgressBar;
      scFile: TStrContainer;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      pplblTitulo: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppDEBE: TppLabel;
      ppHABER: TppLabel;
      pplblCia: TppLabel;
      ppLabel23: TppLabel;
      ppLabel1: TppLabel;
      pplblRango: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      pplbEst1: TppLabel;
      pplbEstado1: TppLabel;
      ppLabel42: TppLabel;
      ppLabel24: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppDetailBand1: TppDetailBand;
      ppdbtDebe: TppDBText;
      ppDBText8: TppDBText;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppvTO: TppVariable;
      ppdbtHaber: TppDBText;
      ppDBText9: TppDBText;
      ppDBText27: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLabel5: TppLabel;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppvTotalG: TppVariable;
      ppLabel36: TppLabel;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppLabel4: TppLabel;
      ppTotal: TppVariable;
      ppLabel6: TppLabel;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppLabel3: TppLabel;
      ppVariable2: TppVariable;
      ppdbtClAux1: TppDBText;
      ppdbtAux1: TppDBText;
      ppdbtAuxDes1: TppDBText;
      ppGroup5: TppGroup;
      ppGroupHeaderBand5: TppGroupHeaderBand;
      ppDBText7: TppDBText;
      ppDBText6: TppDBText;
      ppLabel30: TppLabel;
      ppGroupFooterBand5: TppGroupFooterBand;
      ppLabel44: TppLabel;
      ppDBCalc19: TppDBCalc;
      ppDBCalc20: TppDBCalc;
      ppVariable1: TppVariable;
      pplDoc1: TppLabel;
      ppdbtSerie1: TppDBText;
      ppdbtNoDoc1: TppDBText;
      bbtnExcel1: TBitBtn;
      ck_ExpXCuenta: TCheckBox;
      cbDisenoRep: TCheckBox;
      rgTipoDocumento: TRadioGroup;
    dtgData: TwwDBGrid;

      Procedure bbtnCancClick(Sender: TObject);
      Procedure IniciaCampos;
      Procedure bbtnOkClick(Sender: TObject);

      Procedure dblcCiaExit(Sender: TObject);
      Procedure dbdtpFReg2Exit(Sender: TObject);
      Procedure dbdtpFReg1Exit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure ckTDiarioClick(Sender: TObject);
      Procedure dblcTDiarioExit(Sender: TObject);
      Procedure rgCuentaClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure rgAuxiliarClick(Sender: TObject);
      Procedure Z2bbtnSelCuentaClick(Sender: TObject);
      Procedure Z2bbtnSelAuxiliarClick(Sender: TObject);
      Procedure ppvTOCalc(Sender: TObject; Var Value: Variant);
//    procedure ppToLCalc(Sender: TObject; var Value: Variant);
      Procedure gbPerExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
//    procedure ppToECalc(Sender: TObject; var Value: Variant);
      Procedure Z2bbtnSelCuentaSolaClick(Sender: TObject);
      Procedure rgCuentaSolaClick(Sender: TObject);
      Procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
      Procedure ppVariable1Calc(Sender: TObject; Var Value: Variant);
      Procedure ppDetailBand1BeforePrint(Sender: TObject);
      Procedure ppVariable2Calc(Sender: TObject; Var Value: Variant);
      Procedure ppVariable11Calc(Sender: TObject; Var Value: Variant);
      Procedure ppVariable10Calc(Sender: TObject; Var Value: Variant);
      Procedure ppVariable9Calc(Sender: TObject; Var Value: Variant);
      Procedure ppVariable8Calc(Sender: TObject; Var Value: Variant);
      Procedure ppVariable3Calc(Sender: TObject; Var Value: Variant);
      Procedure ppVariable6Calc(Sender: TObject; Var Value: Variant);
      Procedure ppGroupFooterBand3BeforePrint(Sender: TObject);
      Procedure ppDetailBand2BeforePrint(Sender: TObject);
      Procedure bbtnTextoClick(Sender: TObject);
      Procedure bbtnExcel1Click(Sender: TObject);
   Private
    { Private declarations }
      x10: Integer;
      xMonedaL, xMonedaE: String;

      Function Valida: Boolean;
      Function RetornaDatos(cCampo: String): String;
   Public
    { Public declarations }
      sCiaOrigen: String;
      sCiaCuenta: String;
      Procedure FormatoxCta(xxCds, xxCds_aux: TwwClientDataSet);
      Function QuitarCeros(xxCampo: String): String;
   End;

Var
   FAnalisisAuxiliar: TFAnalisisAuxiliar;
   xFechas: String;

Implementation

Uses CNTDM, CNT411, CNT412, CNT998, oaCN3000;

{$R *.DFM}

Procedure TFAnalisisAuxiliar.IniciaCampos;
Var
   xAno, xMes, xDia: word;
Begin
   dblcCia.Text := '';
   rgCuenta.ItemIndex := 0;
   rgAuxiliar.ItemIndex := 0;

   DecodeDate(Date, xAno, xMes, xDia);
   speAno.Value := xAno;
   speMM.Value := xMes;
   If Length(speMM.Text) = 1 Then
   Begin
      speMM.Text := '0' + speMM.Text;
   End;

   gbPerExit(Self);
End;

Procedure TFAnalisisAuxiliar.bbtnCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFAnalisisAuxiliar.bbtnOkClick(Sender: TObject);
Var
   xSQL: String;
   xWhere: String;
   xTML, xTME: String;
   sCtaLog, sAuxLog: String;
Begin

// Inicio HPC_201302_CNT
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.IndexFieldNames := '';
   DMCNT.cdsQry.Filter := '';
   DMCNT.cdsQry.Filtered := True;

   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.Filter := '';
   DMCNT.cdsQry2.Filtered := True;
   DMCNT.cdsQry2.FetchOnDemand := False;
   DMCNT.cdsQry2.PacketRecords := -1;
   DMCNT.cdsQry2.FetchOnDemand := True;
   ppDBP1.DataSource := Nil;
   pprptAnaAuxUni.DataPipeline := Nil;
   ppDBP1.DataSource := Nil;
   pprptAnaAuxUni.DataPipeline := Nil;
// Fin HPC_201302_CNT

   If Not Valida Then Exit;

   Screen.Cursor := crHourGlass;
{
   DMCNT.cdsQry.IndexFieldNames := '';
   DMCNT.cdsQry.Filter := '';
   DMCNT.cdsQry.Filtered := True;

   DMCNT.cdsQry.IndexFieldNames := '';
   DMCNT.cdsQry.Filter := '';
   DMCNT.cdsQry.Filtered := True;

   //** se limpia cualquier filtro que haya quedado en memoria, NO quitar, sino sale Error

   DMCNT.cdsqry2.close;
   DMCNT.cdsQry2.IndexFieldNames := '';
   DMCNT.cdsQry2.Filter := ''; // Todos
   DMCNT.cdsQry2.Filtered := False;
}

   If rgReporte.ItemIndex = 0 Then // Reporte Detallado
   Begin
// Inicio HPC_201302_CNT
      xSQL := 'SELECT A.CIAID, A.CUENTAID, A.CLAUXID, A.AUXID, A.DOCID, ' //A.CNTSERIE, A.CNTNODOC, '
         + '       case when ESCADENANUMERICA(A.CNTSERIE)=''TRUE'' then cast(to_number(A.CNTSERIE) as varchar2(20)) else A.CNTSERIE end CNTSERIE, '
         + '       case when ESCADENANUMERICA(A.CNTNODOC)=''TRUE'' then cast(to_number(A.CNTNODOC) as varchar2(20)) else A.CNTNODOC end CNTNODOC, '
         + '       ''                              '' SERIE_Y_NUM_DOC, '
// Fin HPC_201302_CNT
         + '       A.CNTANOMM, A.CNTFCOMP, A.CNTFEMIS, A.TDIARID, A.CTADES, A.CNTCOMPROB, A.CNTGLOSA, '
         + '       A.CLAUXID||A.AUXID AUXILIAR, B.SALDO, C.AUXNOMB, A.CNTMM, ';
      If dblcTDiario.Text <> '' Then
         xSQL := xSQL + '''ORIGEN : ' + dblcTDiario.Text + ' ' + edtTDiario.Text + ''' ORIGEN, '
      Else
         xSQL := xSQL + ''' '' ORIGEN, ';

      //** dependiendo de la moneda
      Case rgMoneda.ItemIndex Of
         0:
            Begin
               xSQL := xSQL + wReplacCeros + '(A.CNTDEBEMN,0.00) MONTODEBE, ' + wReplacCeros + '(A.CNTHABEMN,0.00) MONTOHABER ';
            End;
         1:
            Begin
               xSQL := xSQL + wReplacCeros + '(A.CNTDEBEME,0.00) MONTODEBE, ' + wReplacCeros + '(A.CNTHABEME,0.00) MONTOHABER ';
            End;
         2:
            Begin
               xSQL := xSQL + wReplacCeros + '(A.CNTDEBEMN,0.00) DEBELOC, ' + wReplacCeros + '(A.CNTHABEMN,0.00) HABERLOC, ';
               xSQL := xSQL + wReplacCeros + '(A.CNTDEBEME,0.00) DEBEEXT, ' + wReplacCeros + '(A.CNTHABEME,0.00) HABEREXT ';
            End;
      End;
   End
   Else
   Begin
      xSQL := 'SELECT A.CIAID, A.CUENTAID, A.CLAUXID, A.AUXID, '' '' DOCID, '' '' CNTSERIE, '' '' CNTNODOC, '
            + '       '' '' CNTANOMM, ''01/01/2005 '' CNTFCOMP, ''01/01/2005'' CNTFEMIS, '' '' TDIARID, A.CTADES, '' '' CNTCOMPROB, '
            + '       '' '' CNTGLOSA, A.CLAUXID||A.AUXID AUXILIAR, C.AUXNOMB, '' '' CNTMM, '' '' ORIGEN, ';

      //** dependiendo de la moneda
      Case rgMoneda.ItemIndex Of
         0:
            Begin
               xSQL := xSQL + 'sum(' + wReplacCeros + '(A.CNTDEBEMN,0.00)) MONTODEBE, sum(' + wReplacCeros + '(A.CNTHABEMN,0.00)) MONTOHABER, (SUM( NVL(A.CNTDEBEMN,0))-SUM(NVL(A.CNTHABEMN,0))) SALDO ';
            End;
         1:
            Begin
               xSQL := xSQL + 'sum(' + wReplacCeros + '(A.CNTDEBEME,0.00)) MONTODEBE, sum(' + wReplacCeros + '(A.CNTHABEME,0.00)) MONTOHABER, (SUM( NVL(A.CNTDEBEME,0))-SUM(NVL(A.CNTHABEME,0))) SALDO ';
            End;
         2:
            Begin
               xSQL := xSQL + 'sum(' + wReplacCeros + '(A.CNTDEBEMN,0.00)) DEBELOC, ' + 'sum(' + wReplacCeros + '(A.CNTHABEMN,0.00)) HABERLOC, ';
               xSQL := xSQL + 'sum(' + wReplacCeros + '(A.CNTDEBEME,0.00)) DEBEEXT, ' + 'sum(' + wReplacCeros + '(A.CNTHABEME,0.00)) HABEREXT ';
            End;
      End;
   End;

   xWhere := '';
   sCtaLog := '';
   sAuxLog := '';

   xWhere := xWhere + '( A.CIAID=' + quotedStr(dblcCia.text) + ' and '
                    + ' A.CNTFCOMP>=''' + formatdatetime(wFormatFecha, dbdtpFReg1.Date) + ''' and '
                    + ' A.CNTFCOMP<=''' + formatdatetime(wFormatFecha, dbdtpFReg2.Date) + ''' and '
                    + ' CNTESTADO=''P'' ) ';

   // Restringe para que no se cuelgue la RED
   If (rgCuentaSola.ItemIndex <= 0) And (rgCuenta.ItemIndex = 0) Then
   Begin
      ShowMessage('Debe seleccionar una o más Cuentas');
      Screen.Cursor := crDefault;
      Exit;
   End;

   // Filtrar una Cuenta
   If rgCuentaSola.ItemIndex = 1 Then
   Begin
      sCtaLog := 'A.CUENTAID IN (';
      xWhere := xWhere + ' and A.CUENTAID IN (';
      With FConsulta.FSelCuenta2.cdsClone Do
      Begin
         First;
         While Not Eof Do
         Begin
            sCtaLog := sCtaLog + fieldbyname('CUENTAID').AsString;
            xWhere := xWhere + '''' + fieldbyname('CUENTAID').AsString + '''';
            Next;
            If Not eof Then
            Begin
               xWhere := xWhere + ' , ';
               sCtaLog := sCtaLog + ', ';
            End;
         End;
      End;
      xwhere := xwhere + ')';
      sCtaLog := sCtaLog + ' )';
   End;

   // Filtrar la Cuenta con Auxiliar
   If rgCuenta.ItemIndex = 1 Then
   Begin
      If Not FConsulta.FSelCuenta2.cdsClone.Active Then
      Begin
         ShowMessage('Debe seleccionar una o más Cuentas');
         Screen.Cursor := crDefault;
         Exit;
      End;
      sCtaLog := 'A.CUENTAID IN (';
      xWhere := xWhere + ' and A.CUENTAID IN (';
      With FConsulta.FSelCuenta2.cdsClone Do
      Begin
         First;
         While Not Eof Do
         Begin
            sCtaLog := sCtaLog + fieldbyname('CUENTAID').AsString;
            xWhere := xWhere + '''' + fieldbyname('CUENTAID').AsString + '''';
            Next;
            If Not eof Then
            Begin
               xWhere := xWhere + ' , ';
               sCtaLog := sCtaLog + ', ';
            End;
         End;
      End;
      xwhere := xwhere + ')';
      sCtaLog := sCtaLog + ' )';
   End;

   // Filtrar el Auxiliar
   If rgAuxiliar.ItemIndex = 1 Then
   Begin
      If Trim(xwhere) <> '' Then
         xWhere := xWhere + ' AND  ';
      xWhere := xWhere + '(';
      sAuxLog := '( ';
      With FConsulta.FSelAux1.cdsClone Do
      Begin
         First;
         While Not Eof Do
         Begin
            sAuxLog := sAuxLog + '(A.CLAUXID=' + fieldbyname('CLAUXID').AsString + ' AND A.AUXID=' + fieldbyname('AUXID').AsString + ') ';
            xWhere := xWhere + '(A.CLAUXID = ''' + fieldbyname('CLAUXID').AsString +
               ''' AND A.AUXID = ''' + fieldbyname('AUXID').AsString + ''') ';
            Next;
            If Not eof Then
            Begin
               xWhere := xWhere + ' OR ';
               sAuxLog := sAuxLog + ' OR ';
            End
         End;
      End;
      xwhere := xwhere + ')';
      sAuxLog := sAuxLog + ' )';
   End;

   // Filtra el Origen
   If ckTDiario.Checked Then
   Begin
      If Trim(xwhere) <> '' Then
         xWhere := xWhere + ' AND  ';
      xWhere := xWhere + '( TDIARID = ''' + dblcTDiario.Text + ''' )';
   End
   Else
   Begin
      If sCiaOrigen <> '' Then
      Begin
         If Trim(xwhere) <> '' Then
            xWhere := xWhere + ' AND ';
         xWhere := xWhere + sCiaOrigen;
      End;
   End;

   xSQL := xSQL + 'FROM CNT301 A, ';

// Si reporte es detallado
   If rgReporte.ItemIndex = 0 Then
   Begin
      xSQL := xSQL + '( SELECT A.CIAID, A.CUENTAID, MAX(A.CNTMM), NVL(A.CLAUXID,''NULO'') CLAUXID, '
   // Inicio HPC_201302_CNT
                   + '         NVL(A.AUXID,''NULO'') AUXID, ';
      If rgTipoDocumento.itemindex = 0 Then
         xSQL := xSQL + '      NVL(A.DOCID,''NULO'') DOCID, ';
      xSQL := xSQL
      //   + 'NVL(A.CNTSERIE,''NULO'') CNTSERIE, NVL(A.CNTNODOC,''NULO'') CNTNODOC, '
         + '         case when ESCADENANUMERICA(A.CNTSERIE)=''TRUE'' then cast(to_number(A.CNTSERIE) as varchar2(20)) else A.CNTSERIE end CNTSERIE, '
         + '         case when ESCADENANUMERICA(A.CNTNODOC)=''TRUE'' then cast(to_number(A.CNTNODOC) as varchar2(20)) else A.CNTNODOC end CNTNODOC, '
         + '         (sum( ' + wReplacCeros + '(A.CNTDEBEMN,0))-sum(' + wReplacCeros + '(A.CNTHABEMN,0))) SALDO '
         + '    FROM CNT301 A '
         + '   WHERE ' + xWhere
         + '   GROUP BY A.CIAID, A.CUENTAID, NVL(A.CLAUXID,''NULO''), NVL(A.AUXID,''NULO''), ';
      //   + 'NVL(A.DOCID,''NULO''), NVL(A.CNTSERIE,''NULO''), NVL(A.CNTNODOC,''NULO'') ) B ';
      If rgTipoDocumento.itemindex = 0 Then
         xSQL := xSQL + 'NVL(A.DOCID,''NULO''), ';
      xSQL := xSQL
         + '         case when ESCADENANUMERICA(A.CNTSERIE)=''TRUE'' then cast(to_number(A.CNTSERIE) as varchar2(20)) else A.CNTSERIE end, '
         + '         case when ESCADENANUMERICA(A.CNTNODOC)=''TRUE'' then cast(to_number(A.CNTNODOC) as varchar2(20)) else A.CNTNODOC end ) B, ';
   // Fin HPC_201302_CNT
      xSQL := xSQL + ' CNT201 C ';
   End
   Else
   Begin
      xSQL := xSQL + ' CNT201 C ';
   End;

   If sCiaCuenta <> '' Then
   Begin
      xWhere := xWhere + ' and A.' + sCiaCuenta;
   End;

   xSQL := xSQL + 'WHERE ' + xWhere + ' ';

   If rgReporte.ItemIndex = 0 Then
   Begin
      xSQL := xSQL + ' AND A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID ';
   // Inicio HPC_201302_CNT
      xSQL := xSQL
         + ' AND ' + wReplacCeros + '(A.CLAUXID, ''NULO'') = B.CLAUXID'
         + ' AND ' + wReplacCeros + '(A.AUXID,   ''NULO'') = B.AUXID';
      If rgTipoDocumento.itemindex = 0 Then
         xSQL := xSQL + ' AND ' + wReplacCeros + '(A.DOCID,''NULO'') = B.DOCID ';
      xSQL := xSQL
      //   + ' AND ' + wReplacCeros + '(A.CNTSERIE,''NULO'')=' + 'B.CNTSERIE'
      //   + ' AND ' + wReplacCeros + '(A.CNTNODOC,''NULO'')=' + 'B.CNTNODOC';
         + ' AND (case when ESCADENANUMERICA(A.CNTSERIE)=''TRUE'' then cast(to_number(A.CNTSERIE) as varchar2(20)) else NVL(A.CNTSERIE,''NULO'') end) = NVL(B.CNTSERIE,''NULO'') '
         + ' AND (case when ESCADENANUMERICA(A.CNTNODOC)=''TRUE'' then cast(to_number(A.CNTNODOC) as varchar2(20)) else NVL(A.CNTNODOC,''NULO'') end) = NVL(B.CNTNODOC,''NULO'') ';
   // Fin HPC_201302_CNT
   End;

   xSQL := xSQL + ' AND ( A.CLAUXID = C.CLAUXID(+) AND A.AUXID = C.AUXID(+) ) ';

   If rgReporte.ItemIndex = 1 Then
   Begin
      xSQL := xSQL + ' GROUP BY A.CIAID, A.CUENTAID, A.CLAUXID, A.AUXID, A.CTADES, C.AUXNOMB';
   End;

   DMCNT.cdsQry2.ProviderName := 'PrvTGE';
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSql);
   DMCNT.cdsQry2.Filter := '';
   DMCNT.cdsQry2.Filtered := False;
   DMCNT.cdsQry2.open;

   If rgReporte.ItemIndex = 0 Then
   Begin
   // Inicio HPC_201302_CNT
      DMCNT.cdsQry2.First;
      while not DMCNT.cdsQry2.EOF do
      begin
         DMCNT.cdsQry2.Edit;
         DMCNT.cdsQry2.FieldByName('SERIE_Y_NUM_DOC').AsString := trim(DMCNT.cdsQry2.FieldByName('CNTSERIE').AsString)
                                                                 +trim(DMCNT.cdsQry2.FieldByName('CNTNODOC').AsString);
         DMCNT.cdsQry2.Post;
         DMCNT.cdsQry2.Next;
      end;
   // Fin HPC_201302_CNT

      If rgOrdenListado.itemindex = 0 Then
      // ordenado popr Fecha de Comprobante
         DMCNT.cdsQry2.IndexFieldNames := 'CUENTAID;CLAUXID;AUXID;CNTANOMM;CNTNODOC;CNTFCOMP'
      Else
      // ordenado por número de documento
         DMCNT.cdsQry2.IndexFieldNames := 'CUENTAID;CLAUXID;AUXID;CNTNODOC;CNTFCOMP';
   End
   Else
   Begin
      DMCNT.cdsQry2.IndexFieldNames := 'CUENTAID;CLAUXID;AUXID'
   End;

  //** se filtra por pendientes, cancelados o todos
   DMCNT.cdsQry2.Filter := ''; // Todos
   Case rgEstDoc.itemindex Of
      0: DMCNT.cdsQry2.Filter := ''; // Todos
      1: DMCNT.cdsQry2.Filter := 'SALDO <> 0'; // Pendientes
      2: DMCNT.cdsQry2.Filter := 'SALDO = 0'; // Cancelados
   End;
   DMCNT.cdsQry2.Filtered := True;

   If DMCNT.cdsQry2.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas');
   End;

   Screen.Cursor := crDefault;

   If (rgMoneda.ItemIndex = 0) Or (rgMoneda.ItemIndex = 1) Then
   Begin
      pprptAnaAuxUni.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\AnalisisAuxUniTX.rtm';
      pprptAnaAuxUni.template.LoadFromFile;

      If rgReporte.ItemIndex = 1 Then
      Begin
         ppDetailBand1.Visible := False;
         ppGroupHeaderBand5.Visible := False;
         ppGroupHeaderBand2.Visible := False;
         ppGroupFooterBand5.Visible := False;
         pplDoc1.Visible := False;
         ppdbtSerie1.Visible := False;
         ppdbtNoDoc1.Visible := False;
         ppdbtClAux1.Visible := True;
         ppdbtAux1.Visible := True;
         ppdbtAuxDes1.Visible := True;
      End;

      ppDBP1.DataSource := DMCNT.dsQry2;
      pprptAnaAuxUni.DataPipeline := ppDBP1;

      If rgMoneda.ItemIndex = 0 Then
      Begin
         ppDebe.Caption := 'Debe ' + xMonedaL;
         ppHaber.Caption := 'Haber ' + xMonedaL;
      End;
      If rgMoneda.ItemIndex = 1 Then
      Begin
         ppDebe.Caption := 'Debe ' + xMonedaE;
         ppHaber.Caption := 'Haber ' + xMonedaE;
      End;
      pplblCia.Caption := edtCia.text;
      pplblTitulo.text := edtTit.text;
      pplblRango.Caption := 'Del ' + DateToStr(dbdtpFReg1.date) + '  Al ' + DateToStr(dbdtpFReg2.date);

      If rgEstDoc.ItemIndex = 0 Then pplbEstado1.Caption := 'Todos';
      If rgEstDoc.ItemIndex = 1 Then pplbEstado1.Caption := 'Pendientes';
      If rgEstDoc.ItemIndex = 2 Then pplbEstado1.Caption := 'Cancelados';

      DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Analisis Auxiliares',
         dblcCia.Text, // Campañía
         speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
         dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
         '', dblcTDiario.Text, // Nivel   - Origen
         '', inttostr(rgMoneda.itemindex), // Lote    -  Moneda
         sCtaLog, sAuxLog, // Cuentas - Auxiliares
         '', 'Impresora', // Costos - Tipo Salida
         inttostr(rgReporte.itemindex)); // Tipo Rep

      If cbDisenoRep.Checked Then
      Begin
         ppd1.Report := pprptAnaAuxUni;
         ppd1.ShowModal;
         ppd1.Report := Nil;
      End
      Else
         pprptAnaAuxUni.Print;

      pprptAnaAuxUni.stop;
   End;

   If rgMoneda.ItemIndex = 2 Then
   Begin

      ppDBP1.DataSource := DMCNT.dsQry2;
      pprptAnaAuxAmb.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\AnalisisAuxAmbTX.rtm';

      pprptAnaAuxAmb.template.LoadFromFile;

      If rgReporte.ItemIndex = 1 Then
      Begin
         ppDetailBand2.Visible := False;
         ppGroupHeaderBand6.Visible := False;
         ppGroupHeaderBand4.Visible := False;
         pplDoc2.Visible := True;
         ppdbtNoDoc2.Visible := True;
         ppdbtClAux2.Visible := True;
         ppdbtAux2.Visible := True;
         ppdbtAuxDes2.Visible := True;
      End;

      pprptAnaAuxAmb.DataPipeline := ppDBP1;

      pplblCiaA.Caption := edtCia.text;
      pplblTitulo1.text := edtTit.text;
      pplblRango1.Caption := 'Del ' + DateToStr(dbdtpFReg1.date) + '  Al ' + DateToStr(dbdtpFReg2.date);

      If rgEstDoc.ItemIndex = 0 Then
      Begin
         pplbEstado.Caption := 'Todos';
      End
      Else
         If rgEstDoc.ItemIndex = 1 Then
         Begin
            pplbEstado.Caption := 'Pendientes';
         End
         Else
            If rgEstDoc.ItemIndex = 2 Then
            Begin
               pplbEstado.Caption := 'Cancelados';
            End;

      xTML := DMCNT.DisplayDescrip('prvTGE', 'TGE103', 'TMONABR', 'TMON_LOC=' + quotedstr('L'), 'TMONABR');
      xTME := DMCNT.DisplayDescrip('prvTGE', 'TGE103', 'TMONABR', 'TMON_LOC=' + quotedstr('E'), 'TMONABR');
      ppLabel15.Caption := 'DEBE ' + xTML;
      ppLabel16.Caption := 'HABER ' + xTML;
      ppLabel22.Caption := 'SALDO ' + xTML;
      ppLabel11.Caption := 'DEBE ' + xTME;
      ppLabel27.Caption := 'HABER ' + xTME;
      ppLabel33.Caption := 'SALDO ' + xTME;

      DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Analisis Auxiliares',
         dblcCia.Text, // Campañía
         speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
         dbdtpFReg1.Text, dbdtpFReg2.Text, // Fecha   Inicio - final
         '', dblcTDiario.Text, // Nivel   - Origen
         '', inttostr(rgMoneda.itemindex), // Lote    -  Moneda
         sCtaLog, sAuxLog, // Cuentas - Auxiliares
         '', 'Impresora', // Costos - Tipo Salida
         inttostr(rgReporte.itemindex)); // Tipo Rep

      If cbDisenoRep.Checked Then
      Begin
         ppd1.Report := pprptAnaAuxAmb;
         ppd1.ShowModal;
         ppd1.Report := Nil;
      End
      Else
         pprptAnaAuxAmb.Print;

      pprptAnaAuxAmb.Stop;
   End;

   x10 := Self.ComponentCount - 1;
   While x10 >= 0 Do
   Begin
      If Self.Components[x10].ClassName = 'TppGroup' Then
      Begin
         Self.Components[x10].Free;
      End;
      x10 := x10 - 1;
   End;

// Inicio HPC_201302_CNT
{
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.Filter := '';
   DMCNT.cdsQry2.Filtered := True;
   DMCNT.cdsQry2.FetchOnDemand := False;
   DMCNT.cdsQry2.PacketRecords := -1;
   DMCNT.cdsQry2.FetchOnDemand := True;
   ppDBP1.DataSource := Nil;
   pprptAnaAuxUni.DataPipeline := Nil;
   ppDBP1.DataSource := Nil;
   pprptAnaAuxUni.DataPipeline := Nil;
}
// Fin HPC_201302_CNT

// Inicio HPC_201302_CNT
   bbtnExcel1.Enabled := True;
// Fin HPC_201302_CNT

   Screen.Cursor := crDefault;
End;

Procedure TFAnalisisAuxiliar.dblcCiaExit(Sender: TObject);
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

Procedure TFAnalisisAuxiliar.dbdtpFReg2Exit(Sender: TObject);
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

Procedure TFAnalisisAuxiliar.dbdtpFReg1Exit(Sender: TObject);
Begin
   If dbdtpFReg1.date = 0 Then
   Begin
      dbdtpFReg1.SetFocus;
      showmessage('Error : Falta Registrar Fecha');
      Raise Exception.Create('Error : Falta Registrar Fecha');
   End;
End;

Procedure TFAnalisisAuxiliar.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFAnalisisAuxiliar.ckTDiarioClick(Sender: TObject);
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

Procedure TFAnalisisAuxiliar.dblcTDiarioExit(Sender: TObject);
Begin
   edtTDiario.Text := '';
   If dblcTDiario.Text <> '' Then edtTDiario.Text := DMCNT.cdsTDiario.FieldByName('TDIARDES').AsString;
End;

Procedure TFAnalisisAuxiliar.rgCuentaClick(Sender: TObject);
Begin
   rgCuentaSola.itemindex := -1;
   Z2bbtnSelCuentaSola.enabled := False;
   If rgCuenta.ItemIndex = 1 Then
   Begin
      Z2bbtnSelCuenta.Enabled := True;
   End
   Else
   Begin
      Z2bbtnSelCuenta.Enabled := False;
   End;
End;

Procedure TFAnalisisAuxiliar.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
// Inicio HPC_201302_CNT
   DMCNT.cdsQry2.Close;
// Fin HPC_201302_CNT
   DMCNT.cdsCuenta.Indexfieldnames := '';
   DMCNT.cdsClAux.Indexfieldnames := '';
   DMCNT.cdsAuxiliar.Indexfieldnames := '';
   DMCNT.cdsTDiario.IndexFieldNames := '';

   FConsulta.FSelCuenta2.Free;
   FConsulta.FSelAux1.Free;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;
   Action := caFree;
End;

Procedure TFAnalisisAuxiliar.rgAuxiliarClick(Sender: TObject);
Begin
   rgCuentaSola.itemindex := -1;
   Z2bbtnSelCuentaSola.enabled := False;
   If rgAuxiliar.ItemIndex = 1 Then
   Begin
      Z2bbtnSelAuxiliar.Enabled := True;
   End
   Else
   Begin
      Z2bbtnSelAuxiliar.Enabled := False;
   End;
End;

Function TFAnalisisAuxiliar.Valida: Boolean;
Begin

   Result := False;

   If (dbdtpFReg1.Date = 0) Then
   Begin
      dbdtpFReg1.SetFocus;
      ShowMessage('Fecha no válida');
      Exit;
   End;

   If (dbdtpFReg2.Date = 0) Then
   Begin
      dbdtpFReg2.SetFocus;
      ShowMessage('Fecha no válida');
      Exit;
   End;

   If (ckTDiario.Checked) And (length(edtTDiario.Text) = 0) Then
   Begin
      dblcTDiario.SetFocus;
      ShowMessage('Seleccione un Tipo de Diario');
      Exit;
   End;

   If rgAuxiliar.ItemIndex = 1 Then
   Begin
      If FConsulta.FSelAux1.cdsClone.RecordCount = 0 Then
      Begin
         Z2bbtnSelAuxiliar.SetFocus;
         ShowMessage('No Ha Seleccionado Auxiliares');
         Exit;
      End;
   End;

   If rgCuenta.ItemIndex = 1 Then
   Begin

      If Not FConsulta.FSelCuenta2.cdsClone.Active Then
      Begin
         ShowMessage('Debe seleccionar una o más Cuentas');
         Exit;
      End;

      If FConsulta.FSelCuenta2.cdsClone.RecordCount = 0 Then
      Begin
         Z2bbtnSelCuenta.SetFocus;
         ShowMessage('No Ha Seleccionado Cuentas');
         Exit;
      End;
   End;

   If rgCuentaSola.ItemIndex = 1 Then
   Begin

      If Not FConsulta.FSelCuenta2.cdsClone.Active Then
      Begin
         ShowMessage('Debe seleccionar una o más Cuentas');
         Exit;
      End;

      If FConsulta.FSelCuenta2.cdsClone.RecordCount = 0 Then
      Begin
         Z2bbtnSelCuenta.SetFocus;
         ShowMessage('No Ha Seleccionado Cuentas');
         Exit;
      End;
   End;

   Result := true;

End;

Procedure TFAnalisisAuxiliar.Z2bbtnSelCuentaClick(Sender: TObject);
Begin
   FConsulta.FSelCuenta2.sCia := dblcCia.text;
   FConsulta.FSelCuenta2.xRg := '0';
   FConsulta.FSelCuenta2.ShowModal;
End;

Procedure TFAnalisisAuxiliar.Z2bbtnSelAuxiliarClick(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   FConsulta.FSelAux1.sCia := dblcCia.text;
   FConsulta.FSelAux1.ShowModal;
End;

Procedure TFAnalisisAuxiliar.ppvTOCalc(Sender: TObject; Var Value: Variant);
Begin
   Value := Value + strtocurr(ppdbtDebe.fIELDVALUE) - strtocurr(ppdbtHaber.FieldValue)
End;

Procedure TFAnalisisAuxiliar.gbPerExit(Sender: TObject);
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

Procedure TFAnalisisAuxiliar.FormShow(Sender: TObject);
Begin

   DMCNT.cdsTDiario.IndexFieldNames := 'TDIARID';

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

   xMonedaL := DMCNT.DisplayDescrip('prvTGE', 'TGE103', 'TMONABR', 'TMON_LOC=' + quotedstr('L'), 'TMONABR');
   xMonedaE := DMCNT.DisplayDescrip('prvTGE', 'TGE103', 'TMONABR', 'TMON_LOC=' + quotedstr('E'), 'TMONABR');
End;

Procedure TFAnalisisAuxiliar.Z2bbtnSelCuentaSolaClick(Sender: TObject);
Begin
   FConsulta.FSelCuenta2.sCia := dblcCia.text;
   FConsulta.FSelCuenta2.xRg := '1';
   FConsulta.FSelCuenta2.ShowModal;
End;

Procedure TFAnalisisAuxiliar.rgCuentaSolaClick(Sender: TObject);
Begin
   rgCuenta.itemindex := -1;
   rgAuxiliar.itemindex := -1;
   If rgCuentasola.itemindex = 0 Then
      Z2bbtnSelCuentaSola.enabled := False
   Else
      Z2bbtnSelCuentaSola.enabled := true;
End;

Procedure TFAnalisisAuxiliar.ppGroupFooterBand1BeforePrint(
   Sender: TObject);
Begin
   ppTotal.Value := ppDBCalc3.Value - ppDBCalc4.Value;
   ppvTotalG.value := ppvTotalG.value + ppTotal.Value;
End;

Procedure TFAnalisisAuxiliar.ppVariable1Calc(Sender: TObject; Var Value: Variant);
Begin
   value := ppDBCalc19.value - ppDBCalc20.value;
End;

Procedure TFAnalisisAuxiliar.ppDetailBand1BeforePrint(Sender: TObject);
Begin
   ppvTO.Visible := False;
End;

Procedure TFAnalisisAuxiliar.ppVariable2Calc(Sender: TObject; Var Value: Variant);
Begin
   value := ppDBCalc1.value - ppDBCalc2.value;
End;

Procedure TFAnalisisAuxiliar.ppVariable11Calc(Sender: TObject; Var Value: Variant);
Begin
   value := ppDBCalc11.value - ppDBCalc12.value;
End;

Procedure TFAnalisisAuxiliar.ppVariable10Calc(Sender: TObject; Var Value: Variant);
Begin
   value := ppDBCalc13.value - ppDBCalc14.value;
End;

Procedure TFAnalisisAuxiliar.ppVariable9Calc(Sender: TObject; Var Value: Variant);
Begin
   Value := Value + StrToFloat(ppDBText12.fIELDVALUE) - StrToFloat(ppDBText16.FieldValue)
End;

Procedure TFAnalisisAuxiliar.ppVariable8Calc(Sender: TObject; Var Value: Variant);
Begin
   Value := Value + StrToFloat(ppDBText25.fIELDVALUE) - StrToFloat(ppDBText26.FieldValue)
End;

Procedure TFAnalisisAuxiliar.ppVariable3Calc(Sender: TObject; Var Value: Variant);
Begin
   value := ppDBCalc15.value - ppDBCalc16.value;
End;

Procedure TFAnalisisAuxiliar.ppVariable6Calc(Sender: TObject; Var Value: Variant);
Begin
   value := ppDBCalc17.value - ppDBCalc18.value;
End;

Procedure TFAnalisisAuxiliar.ppGroupFooterBand3BeforePrint(Sender: TObject);
Begin
   ppVariable5.Value := ppDBCalc9.Value - ppDBCalc10.Value;
   ppVariable4.value := ppVariable4.value + ppVariable5.Value;
   ppVariable7.Value := ppDBCalc21.Value - ppDBCalc22.Value;
   ppVariable12.Value := ppVariable12.Value + ppVariable7.Value;
End;

Procedure TFAnalisisAuxiliar.ppDetailBand2BeforePrint(Sender: TObject);
Begin
   ppVariable9.visible := False;
   ppVariable8.visible := False;
End;

Procedure TFAnalisisAuxiliar.bbtnTextoClick(Sender: TObject);
Var
   i, xSpace, xTem: Integer;
   xBlanco, xCampo, xLinea: String;
   bmk2: TBookMark;
   xSQL: String;
   xWhere: String;
   xMonedaL, xMonedaE, xTML, xTME: String;
Begin

   If Not Valida Then Exit;

   Screen.Cursor := crHourGlass;

   DMCNT.cdsQry.IndexFieldNames := '';
   DMCNT.cdsQry.Filter := '';
   DMCNT.cdsQry.Filtered := True;

   DMCNT.cdsQry.IndexFieldNames := '';
   DMCNT.cdsQry.Filter := '';
   DMCNT.cdsQry.Filtered := True;

   xMonedaL := DMCNT.DisplayDescrip('prvTGE', 'TGE103', 'TMONABR', 'TMON_LOC=' + quotedstr('L'), 'TMONABR');
   xMonedaE := DMCNT.DisplayDescrip('prvTGE', 'TGE103', 'TMONABR', 'TMON_LOC=' + quotedstr('E'), 'TMONABR');
  //** se limpia cualquier filtro que haya quedado en memoria, NO quitar, sino sale Error

   DMCNT.cdsqry2.close;
   DMCNT.cdsQry2.IndexFieldNames := '';
   DMCNT.cdsQry2.Filter := ''; // Todos
   DMCNT.cdsQry2.Filtered := False;

   xSQL := 'SELECT A.CIAID, A.CUENTAID, A.CLAUXID, A.AUXID, A.DOCID, A.CNTSERIE, A.CNTNODOC, '
      + 'A.CNTANOMM, A.CNTFCOMP, A.CNTFEMIS, A.TDIARID, A.CTADES, A.CNTCOMPROB, A.CNTGLOSA, '
      + 'A.CLAUXID||A.AUXID AUXILIAR, B.SALDO, C.AUXNOMB, A.CNTMM, ';

  //** dependiendo de la moneda
   Case rgMoneda.ItemIndex Of
      0:
         Begin
            xSQL := xSQL + wReplacCeros + '(A.CNTDEBEMN,0.00) MONTODEBE, ' + wReplacCeros + '(A.CNTHABEMN,0.00) MONTOHABER ';
         End;
      1:
         Begin
            xSQL := xSQL + wReplacCeros + '(A.CNTDEBEME,0.00) MONTODEBE, ' + wReplacCeros + '(A.CNTHABEME,0.00) MONTOHABER ';
         End;
      2:
         Begin
            xSQL := xSQL + wReplacCeros + '(A.CNTDEBEMN,0.00) DEBELOC, ' + wReplacCeros + '(A.CNTHABEMN,0.00) HABERLOC, ';
            xSQL := xSQL + wReplacCeros + '(A.CNTDEBEME,0.00) DEBEEXT, ' + wReplacCeros + '(A.CNTHABEME,0.00) HABEREXT ';
         End;
   End;

   xWhere := '';
   xWhere := xWhere + '( A.CIAID=' + quotedStr(dblcCia.text) + ' and '
      + ' A.CNTFCOMP>=''' + formatdatetime(wFormatFecha, dbdtpFReg1.Date) + ''' and '
      + ' A.CNTFCOMP<=''' + formatdatetime(wFormatFecha, dbdtpFReg2.Date) + ''' and '
      + ' CNTESTADO=''P'' ) ';

  // Restringe para que no se cuelgue la RED
   If (rgCuentaSola.ItemIndex <= 0) And (rgCuenta.ItemIndex = 0) Then
   Begin
      ShowMessage('Debe seleccionar una o más Cuentas');
      Screen.Cursor := crDefault;
      Exit;
   End;

   If rgCuentaSola.ItemIndex = 1 Then
   Begin
      xWhere := xWhere + ' and A.CUENTAID IN (';
      With FConsulta.FSelCuenta2.cdsClone Do
      Begin
         First;
         While Not Eof Do
         Begin
            xWhere := xWhere + '''' + fieldbyname('CUENTAID').AsString + '''';
            Next;
            If Not eof Then
               xWhere := xWhere + ' , ';
         End;
      End;
      xwhere := xwhere + ')'
   End;

   If rgCuenta.ItemIndex = 1 Then
   Begin
      If Not FConsulta.FSelCuenta2.cdsClone.Active Then
      Begin
         ShowMessage('Debe seleccionar una o más Cuentas');
         Screen.Cursor := crDefault;
         Exit;
      End;
      xWhere := xWhere + ' and A.CUENTAID IN (';
      With FConsulta.FSelCuenta2.cdsClone Do
      Begin
         First;
         While Not Eof Do
         Begin
            xWhere := xWhere + '''' + fieldbyname('CUENTAID').AsString + '''';
            Next;
            If Not eof Then
               xWhere := xWhere + ' , ';
         End;
      End;
      xwhere := xwhere + ')'
   End;

   If rgAuxiliar.ItemIndex = 1 Then
   Begin
      If Trim(xwhere) <> '' Then
         xWhere := xWhere + ' AND  ';
      xWhere := xWhere + '(';
      With FConsulta.FSelAux1.cdsClone Do
      Begin
         First;
         While Not Eof Do
         Begin
            xWhere := xWhere + '(A.CLAUXID = ''' + fieldbyname('CLAUXID').AsString +
               ''' AND A.AUXID = ''' + fieldbyname('AUXID').AsString + ''') ';
            Next;
            If Not eof Then
               xWhere := xWhere + ' OR ';
         End;
      End;
      xwhere := xwhere + ')';
   End;

   If ckTDiario.Checked Then
   Begin
      If Trim(xwhere) <> '' Then
         xWhere := xWhere + ' AND  ';
      xWhere := xWhere + '( TDIARID = ''' + dblcTDiario.Text + ''' )';
   End;

   If SRV_D = 'ORACLE' Then
      xSQL := xSQL + 'FROM CNT301 A, ';

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := xSQL + 'FROM CNT301 A ';
      xSQL := xSQL + 'LEFT JOIN CNT201 C ON ( A.CLAUXID = C.CLAUXID AND A.AUXID = C.AUXID ),  ';
   End;

   xSQL := xSQL + '( SELECT A.CIAID, A.CUENTAID, ' + wReplacCeros + '(A.CLAUXID,''NULO'') CLAUXID, MAX(A.CNTMM), '
      + wReplacCeros + '(A.AUXID,''NULO'') AUXID, ' + wReplacCeros + '(A.DOCID,''NULO'') DOCID, '
      + wReplacCeros + '(A.CNTSERIE,''NULO'') CNTSERIE, ' + wReplacCeros + '(A.CNTNODOC,''NULO'') CNTNODOC, '
      + '(SUM( ' + wReplacCeros + '(A.CNTDEBEMN,0))-SUM(' + wReplacCeros + '(A.CNTHABEMN,0))) SALDO '
      + 'FROM CNT301 A ';

   xSQL := xSQL + ' WHERE ' + xWhere + ' '
      + 'GROUP BY A.CIAID, A.CUENTAID, A.CLAUXID, A.AUXID, A.DOCID, A.CNTSERIE, A.CNTNODOC ) B ';

   If SRV_D = 'ORACLE' Then
      xSQL := xSQL + ', CNT201 C ';

   xSQL := xSQL + 'WHERE ' + xWhere + ' ';
   xSQL := xSQL
      + ' AND A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
      + ' AND ' + wReplacCeros + '(A.CLAUXID,''NULO'')=' + 'B.CLAUXID'
      + ' AND ' + wReplacCeros + '(A.AUXID,''NULO'')=' + 'B.AUXID'
      + ' AND ' + wReplacCeros + '(A.DOCID,''NULO'')=' + 'B.DOCID'
      + ' AND ' + wReplacCeros + '(A.CNTSERIE,''NULO'')=' + 'B.CNTSERIE'
      + ' AND ' + wReplacCeros + '(A.CNTNODOC,''NULO'')=' + 'B.CNTNODOC';

   If SRV_D = 'ORACLE' Then
      xSQL := xSQL + ' AND ( A.CLAUXID = C.CLAUXID(+) AND A.AUXID = C.AUXID(+) ) ';

   DMCNT.cdsQry2.ProviderName := 'PrvTGE';
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSql);
   DMCNT.cdsQry2.open;

   If rgOrdenListado.itemindex = 0 Then
     // ordenado popr Fecha de Comprobante
      DMCNT.cdsQry2.IndexFieldNames := 'CUENTAID;CLAUXID;AUXID;CNTANOMM;CNTNODOC;CNTFCOMP'
   Else
     // ordenado por número de documento
      DMCNT.cdsQry2.IndexFieldNames := 'CUENTAID;CLAUXID;AUXID;CNTNODOC;CNTFCOMP';

   If DMCNT.cdsQry2.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas');
   End;

  //** se filtra por pendientes, cancelados o todos
   DMCNT.cdsQry2.Filter := ''; // Todos
   Case rgEstDoc.itemindex Of
      0: DMCNT.cdsQry2.Filter := ''; // Todos
      1: DMCNT.cdsQry2.Filter := 'SALDO <> 0'; // Pendientes
      2: DMCNT.cdsQry2.Filter := 'SALDO = 0'; // Cancelados
   End;
   DMCNT.cdsQry2.Filtered := True;

   pbExp.Max := 100;
   pbExp.Position := 5;

   xBlanco := '                                                                      ';
   xSpace := 0;

   scFile.Lines.Clear;

   DMCNT.cdsQry2.DisableControls;

   bmk2 := DMCNT.cdsQry2.GetBookmark;

   DMCNT.cdsQry2.Last;

   xTem := Trunc(DMCNT.cdsQry2.RecordCount / 20) * 2;

   pbExp.Max := DMCNT.cdsQry2.RecordCount + (xTem * 3);

   pbExp.Position := (xTem * 2);

   pbExp.Position := xTem;

   pbExp.Position := pbExp.Position + xTem;

   xLinea := 'CUENTA;CUENTA NOMBRE;CL.AUX;AUXILIAR;NOMBRE;SERIE;NUMERO;F.EMISION;AÑO-MES;ORIGEN;COMPROBANTE;GLOSA;DEBE;HABER';
   scFile.Lines.Add(xLinea);

   DMCNT.cdsQry2.First;
   While Not DMCNT.cdsQry2.Eof Do
   Begin
      xLinea := '';
      xLinea := xLinea + RetornaDatos('CUENTAID') + ';';
      xLinea := xLinea + RetornaDatos('CTADES') + ';';
      xLinea := xLinea + RetornaDatos('CLAUXID') + ';';
      xLinea := xLinea + RetornaDatos('AUXID') + ';';
      xLinea := xLinea + RetornaDatos('AUXNOMB') + ';';
      xLinea := xLinea + RetornaDatos('CNTSERIE') + ';';
      xLinea := xLinea + RetornaDatos('CNTNODOC') + ';';
      xLinea := xLinea + RetornaDatos('CNTFEMIS') + ';';
      xLinea := xLinea + RetornaDatos('CNTANOMM') + ';';
      xLinea := xLinea + RetornaDatos('TDIARID') + ';';
      xLinea := xLinea + RetornaDatos('CNTCOMPROB') + ';';
      xLinea := xLinea + RetornaDatos('CNTGLOSA') + ';';
      xLinea := xLinea + RetornaDatos('MONTODEBE') + ';';
      xLinea := xLinea + RetornaDatos('MONTOHABER') + ';';
      pbExp.Position := pbExp.Position + 1;
      scFile.Lines.Add(xLinea);
      DMCNT.cdsQry2.Next;
   End;

   scFile.Lines.SaveToFile(sdGraba.FileName);

   DMCNT.cdsQry2.GotoBookmark(bmk2);
   DMCNT.cdsQry2.FreeBookmark(bmk2);

   DMCNT.cdsQry2.EnableControls;

   pbExp.Position := pbExp.Position + 1;

   Screen.Cursor := crDefault;

   ShowMessage('Archivo Grabado');

   pbExp.Position := 0;
End;

Function TFAnalisisAuxiliar.RetornaDatos(cCampo: String): String;
Var
   xBlanco: String;
   xSpace: Integer;
Begin
   xBlanco := '                                                                      ';
   If DMCNT.cdsQry2.FieldByName(cCampo).Size > 0 Then
      xSpace := DMCNT.cdsQry2.FieldByName(cCampo).Size - Length(DMCNT.cdsQry2.FieldByName(cCampo).AsString)
   Else
      xSpace := 15 - Length(DMCNT.cdsQry2.FieldByName(cCampo).AsString);

   Result := DMCNT.cdsQry2.FieldByName(cCampo).AsString + Copy(xBlanco, 1, xSpace);
End;

Procedure TFAnalisisAuxiliar.bbtnExcel1Click(Sender: TObject);
Var
   i, xSpace, xTem: Integer;
   xBlanco, xCampo, xLinea: String;
   bmk2: TBookMark;
   xSQL: String;
   xWhere: String;
   xMonedaL, xMonedaE, xTML, xTME: String;
   sCtaLog, sAuxLog: String;
Begin
// Inicio HPC_201202_CNT
//
{
   If Not Valida Then Exit;

   Screen.Cursor := crHourGlass;

   DMCNT.cdsQry.IndexFieldNames := '';
   DMCNT.cdsQry.Filter := '';
   DMCNT.cdsQry.Filtered := True;

   DMCNT.cdsQry.IndexFieldNames := '';
   DMCNT.cdsQry.Filter := '';
   DMCNT.cdsQry.Filtered := True;

   xMonedaL := DMCNT.DisplayDescrip('prvTGE', 'TGE103', 'TMONABR', 'TMON_LOC=' + quotedstr('L'), 'TMONABR');
   xMonedaE := DMCNT.DisplayDescrip('prvTGE', 'TGE103', 'TMONABR', 'TMON_LOC=' + quotedstr('E'), 'TMONABR');
  //** se limpia cualquier filtro que haya quedado en memoria, NO quitar, sino sale Error

   DMCNT.cdsqry2.close;
   DMCNT.cdsQry2.IndexFieldNames := '';
   DMCNT.cdsQry2.Filter := ''; // Todos
   DMCNT.cdsQry2.Filtered := False;

   xSQL := 'SELECT A.CIAID, A.CUENTAID, A.CLAUXID, A.AUXID, A.DOCID, A.CNTSERIE, A.CNTNODOC, '
      + 'A.CNTANOMM, A.CNTFCOMP, A.CNTFEMIS, A.TDIARID, A.CTADES, A.CNTCOMPROB, A.CNTGLOSA, '
      + 'A.CLAUXID||A.AUXID AUXILIAR, B.SALDO, C.AUXNOMB, A.CNTMM, ';

  //** dependiendo de la moneda
   Case rgMoneda.ItemIndex Of
      0:
         Begin
            xSQL := xSQL + wReplacCeros + '(A.CNTDEBEMN,0.00) MONTODEBE, ' + wReplacCeros + '(A.CNTHABEMN,0.00) MONTOHABER ';
         End;
      1:
         Begin
            xSQL := xSQL + wReplacCeros + '(A.CNTDEBEME,0.00) MONTODEBE, ' + wReplacCeros + '(A.CNTHABEME,0.00) MONTOHABER ';
         End;
      2:
         Begin
            xSQL := xSQL + wReplacCeros + '(A.CNTDEBEMN,0.00) DEBELOC, ' + wReplacCeros + '(A.CNTHABEMN,0.00) HABERLOC, ';
            xSQL := xSQL + wReplacCeros + '(A.CNTDEBEME,0.00) DEBEEXT, ' + wReplacCeros + '(A.CNTHABEME,0.00) HABEREXT ';
         End;
   End;

   xWhere := '';
   sCtaLog:=''; sAuxLog:='';

   xWhere := xWhere + '( A.CIAID=' + quotedStr(dblcCia.text) + ' and '
      + ' A.CNTFCOMP>=''' + formatdatetime(wFormatFecha, dbdtpFReg1.Date) + ''' and '
      + ' A.CNTFCOMP<=''' + formatdatetime(wFormatFecha, dbdtpFReg2.Date) + ''' and '
      + ' CNTESTADO=''P'' ) ';

  // Restringe para que no se cuelgue la RED
   If (rgCuentaSola.ItemIndex <= 0) And (rgCuenta.ItemIndex = 0) Then
   Begin
      ShowMessage('Debe seleccionar una o más Cuentas');
      Screen.Cursor := crDefault;
      Exit;
   End;

   sCtaLog:=''; sAuxLog:='';

   If rgCuentaSola.ItemIndex = 1 Then
   Begin
      xWhere := xWhere + ' and A.CUENTAID IN (';
      sCtaLog:='A.CUENTAID IN (';
      With FConsulta.FSelCuenta2.cdsClone Do
      Begin
         First;
         While Not Eof Do
         Begin
            xWhere := xWhere + '''' + fieldbyname('CUENTAID').AsString + '''';
            sCtaLog:=sCtaLog +fieldbyname('CUENTAID').AsString;
            Next;
            If Not eof Then
            begin
               xWhere := xWhere + ' , ';
               sCtaLog:=sCtaLog + ', ';
            end;
         End;
      End;
      xwhere := xwhere + ')';
      sCtaLog:=sCtaLog + ') ';
   End;

   If rgCuenta.ItemIndex = 1 Then
   Begin
      If Not FConsulta.FSelCuenta2.cdsClone.Active Then
      Begin
         ShowMessage('Debe seleccionar una o más Cuentas');
         Screen.Cursor := crDefault;
         Exit;
      End;
      sCtaLog:='A.CUENTAID IN (';
      xWhere := xWhere + ' and A.CUENTAID IN (';
      With FConsulta.FSelCuenta2.cdsClone Do
      Begin
         First;
         While Not Eof Do
         Begin
            xWhere := xWhere + '''' + fieldbyname('CUENTAID').AsString + '''';
            sCtaLog:=sCtaLog +fieldbyname('CUENTAID').AsString;
            Next;
            If Not eof Then
            begin
               xWhere := xWhere + ' , ';
               sCtaLog:=sCtaLog + ', ';
            end;
         End;
      End;
      xwhere := xwhere + ')';
      sCtaLog:=sCtaLog + ') ';
   End;

   If rgAuxiliar.ItemIndex = 1 Then
   Begin
      If Trim(xwhere) <> '' Then
         xWhere := xWhere + ' AND  ';
      xWhere := xWhere + '(';
      sAuxLog:='( ';
      With FConsulta.FSelAux1.cdsClone Do
      Begin
         First;
         While Not Eof Do
         Begin
            xWhere := xWhere + '(A.CLAUXID = ''' + fieldbyname('CLAUXID').AsString +
               ''' AND A.AUXID = ''' + fieldbyname('AUXID').AsString + ''') ';
            sAuxLog:=sAuxLog+'(A.CLAUXID='+fieldbyname('CLAUXID').AsString+' AND A.AUXID='+fieldbyname('AUXID').AsString+') ';
            Next;
            If Not eof Then
            begin
               xWhere := xWhere+ ' OR ';
               sAuxLog:=sAuxLog+ ' or ';
            end;
         End;
      End;
      xwhere := xwhere + ')';
      sAuxLog:=sAuxLog + ')';
   End;

   If ckTDiario.Checked Then
   Begin
      If Trim(xwhere) <> '' Then
         xWhere := xWhere + ' AND  ';
      xWhere := xWhere + '( TDIARID = ''' + dblcTDiario.Text + ''' )';
   End;

   If SRV_D = 'ORACLE' Then
      xSQL := xSQL + 'FROM CNT301 A, ';

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := xSQL + 'FROM CNT301 A ';
      xSQL := xSQL + 'LEFT JOIN CNT201 C ON ( A.CLAUXID = C.CLAUXID AND A.AUXID = C.AUXID ),  ';
   End;

   xSQL := xSQL + '( SELECT A.CIAID, A.CUENTAID, ' + wReplacCeros + '(A.CLAUXID,''NULO'') CLAUXID, MAX(A.CNTMM), '
      + wReplacCeros + '(A.AUXID,''NULO'') AUXID, ' + wReplacCeros + '(A.DOCID,''NULO'') DOCID, '
      + wReplacCeros + '(A.CNTSERIE,''NULO'') CNTSERIE, ' + wReplacCeros + '(A.CNTNODOC,''NULO'') CNTNODOC, '
      + '(SUM( ' + wReplacCeros + '(A.CNTDEBEMN,0))-SUM(' + wReplacCeros + '(A.CNTHABEMN,0))) SALDO '
      + 'FROM CNT301 A ';

   xSQL := xSQL + ' WHERE ' + xWhere + ' '
      + 'GROUP BY A.CIAID, A.CUENTAID, A.CLAUXID, A.AUXID, A.DOCID, A.CNTSERIE, A.CNTNODOC ) B ';

   If SRV_D = 'ORACLE' Then
      xSQL := xSQL + ', CNT201 C ';

   xSQL := xSQL + 'WHERE ' + xWhere + ' ';
   xSQL := xSQL
      + ' AND A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
      + ' AND ' + wReplacCeros + '(A.CLAUXID,''NULO'')=' + 'B.CLAUXID'
      + ' AND ' + wReplacCeros + '(A.AUXID,''NULO'')=' + 'B.AUXID'
      + ' AND ' + wReplacCeros + '(A.DOCID,''NULO'')=' + 'B.DOCID'
      + ' AND ' + wReplacCeros + '(A.CNTSERIE,''NULO'')=' + 'B.CNTSERIE'
      + ' AND ' + wReplacCeros + '(A.CNTNODOC,''NULO'')=' + 'B.CNTNODOC';

   If SRV_D = 'ORACLE' Then
      xSQL := xSQL + ' AND ( A.CLAUXID = C.CLAUXID(+) AND A.AUXID = C.AUXID(+) ) ';

   DMCNT.cdsQry2.ProviderName := 'PrvTGE';
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSql);
   DMCNT.cdsQry2.open;

   If rgOrdenListado.itemindex = 0 Then
     // ordenado popr Fecha de Comprobante
      DMCNT.cdsQry2.IndexFieldNames := 'CUENTAID;CLAUXID;AUXID;CNTANOMM;CNTNODOC;CNTFCOMP'
   Else
     // ordenado por número de documento
      DMCNT.cdsQry2.IndexFieldNames := 'CUENTAID;CLAUXID;AUXID;CNTNODOC;CNTFCOMP';

   If DMCNT.cdsQry2.RecordCount = 0 Then
   Begin
      Screen.Cursor := crDefault;
      Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas');
   End;

  //** se filtra por pendientes, cancelados o todos
   DMCNT.cdsQry2.Filter := ''; // Todos
   Case rgEstDoc.itemindex Of
      0: DMCNT.cdsQry2.Filter := ''; // Todos
      1: DMCNT.cdsQry2.Filter := 'SALDO <> 0'; // Pendientes
      2: DMCNT.cdsQry2.Filter := 'SALDO = 0'; // Cancelados
   End;
   DMCNT.cdsQry2.Filtered := True;

}

   If DMCNT.cdsQry2.Active = False Then
   Begin
      ShowMessage('Debe generar los dagtos previamente a través del Reporte');
      exit;
   End;

   If DMCNT.cdsQry2.RecordCount = 0 Then
   Begin
      ShowMessage('No hay información a Mostrar');
      exit;
   End;

   Screen.Cursor := crDefault;

   If ck_ExpXCuenta.Checked Then
   Begin
      DMCNT.cdsQry3.Close;
      FormatoxCta(DMCNT.cdsQry2, DMCNT.cdsQry3);

   // ordenado por número de documento
      DMCNT.cdsQry3.IndexFieldNames := 'TIPODET;CUENTA;CODIGO;DOCUMENTO;FECHA';

      dtgData.DataSource := DMCNT.dsQry3;

   dtgData.Selected.clear;
   dtgData.Selected.Add('NUMERO'+#9+'4'+#9+'Id');

   dtgData.Selected.Add('CUENTA'+#9+'10'+#9+'Cuenta');
   dtgData.Selected.Add('FECHA'+#9+'10'+#9+'Fecha Emis');
   dtgData.Selected.Add('DIARIO'+#9+'8'+#9+'T.Diario');
   dtgData.Selected.Add('COMPROBANTE'+#9+'15'+#9+'Comprobante');
   dtgData.Selected.Add('DOCUMENTO'+#9+'15'+#9+'Documento');
   dtgData.Selected.Add('CODIGO'+#9+'10'+#9+'Auxiliar');
   dtgData.Selected.Add('PROVEEDOR'+#9+'30'+#9+'Nombre Auxiliar');
   dtgData.Selected.Add('CONCEPTO'+#9+'50'+#9+'Glosa');
   dtgData.Selected.Add('SUBTOTAL'+#9+'15'+#9+'SubTotal');
   dtgData.Selected.Add('TOTAL'+#9+'15'+#9+'Total');
   dtgData.ApplySelected;
   End
   Else
   Begin
      dtgData.DataSource := DMCNT.dsQry2;
      dtgData.Selected.clear;
      dtgData.Selected.Add('CUENTAID'+#9+'10'+#9+'Cuenta');
      dtgData.Selected.Add('CNTFEMIS'+#9+'10'+#9+'Fecha Emis');
      dtgData.Selected.Add('TDIARID'+#9+'8'+#9+'T.Diario');
      dtgData.Selected.Add('CNTCOMPROB'+#9+'15'+#9+'Comprobante');
      dtgData.Selected.Add('CNTNODOC'+#9+'15'+#9+'Documento');
      dtgData.Selected.Add('AUXID'+#9+'10'+#9+'Auxiliar');
      dtgData.Selected.Add('AUXNOMB'+#9+'30'+#9+'Nombre Auxiliar');
      dtgData.Selected.Add('CNTGLOSA'+#9+'50'+#9+'Glosa');
      dtgData.Selected.Add('MONTODEBE'+#9+'15'+#9+'Debe');
      dtgData.Selected.Add('MONTOHABER'+#9+'15'+#9+'Haber');
      dtgData.Selected.Add('SALDO'+#9+'15'+#9+'Saldo');
      dtgData.ApplySelected;
   dtgData.ApplySelected;
   End;

   Try
      DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Analisis Auxiliares',
                     dblcCia.Text,                                  // Campañía
                     speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
                     dbdtpFReg1.Text, dbdtpFReg2.Text,              // Fecha   Inicio - final
                     '',  dblcTDiario.Text,                         // Nivel   - Origen
                     '', inttostr(rgMoneda.itemindex),              // Lote    -  Moneda
                     sCtaLog, sAuxLog,                              // Cuentas - Auxiliares
                     '', 'Excel',                                   // Costos - Tipo Salida
                     inttostr(rgReporte.itemindex) );               // Tipo Rep

   // Inicio HPC_201602_CNT
   // DAF_2016000605_CNT_1 Pide nombre y carpeta de archivo
      dtgData.ExportOptions.ExportType := wwgetSYLK;
      sdGraba.DefaultExt := 'slk';
      if not sdGraba.Execute then Exit;

      if sdGraba.FileName='' then
      begin
         ShowMessage('Indique un Nombre para el archivo a generar');
         Exit;
      end;
      Screen.Cursor := crHourGlass;
   // Graba con Nombre de Archivo
      // dtgData.ExportOptions.FileName := 'ANALISIS DE AUXILIARES' + '.slk';
      dtgData.ExportOptions.FileName := sdGraba.FileName;
      dtgData.ExportOptions.Save;
      dtgData.ExportOptions.Save;
      If Not (esoClipboard In dtgData.ExportOptions.Options) Then
      Begin
         ShellExecute(Handle, 'Open', PChar(dtgData.exportoptions.Filename),
             Nil, Nil, sw_shownormal);
      End;
      Screen.Cursor := crDefault;
   // Fin HPC_201602_CNT
   Except
      On Ex: Exception Do
         Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;

   bbtnExcel1.Enabled := False;
   Screen.Cursor := crDefault;

// Fin HPC_201202_CNT

End;

Procedure TFAnalisisAuxiliar.FormatoxCta(xxCds, xxCds_aux: TwwClientDataSet);
Var
   xSQL: String;
   xAux_Ant, xCta_Ant: String;
   xTotalGrupo, xSaldo: Double;
   xI: Integer;
   xTotal: extended;
Begin
   //inicializando el data set
   xSQL := ' SELECT 0 TIPODET, 0 NUMERO, A.CUENTAID CUENTA,A.CNTFEMIS FECHA,  A.TDIARID DIARIO, A.CNTCOMPROB COMPROBANTE, '
      + ' A.CNTSERIE ||' + QuotedStr(' - ') + '|| A.CNTNODOC DOCUMENTO, '
      + ' A.AUXID CODIGO,C.AUXNOMB PROVEEDOR, '
      + ' A.CNTGLOSA CONCEPTO, '
      + ' 0.00 SUBTOTAL, 0.00 TOTAL,  '
      + QuotedStr('               ') + ' REGULARIZ '
      + ' FROM CNT301 A, '
      + ' CNT201 C '
      + ' WHERE (A.CLAUXID = C.CLAUXID(+) '
      + ' AND A.AUXID = C.AUXID(+)) '
      + ' AND 1=2 ';

   xxCds_aux.Close;
   xxCds_aux.DataRequest(xSQL);
   xxCds_aux.Open;
   xxCds.IndexFieldNames := 'CUENTAID;AUXID;CNTNODOC';
   xTotal := 0;
   xTotalGrupo := 0;
   If xxCds.recordcount = 0 Then
      exit
   Else
      xxCds.first;

   //creando los registros necesarios en el dataset auxiliar

   While Not xxCds.Eof Do
   Begin
      xxCds_aux.Insert;
      xxCds_aux.FieldByName('SUBTOTAL').asInteger := 1;
      xxCds.Next;
   End;
   xxCds_aux.Insert;
   xxCds_aux.FieldByName('SUBTOTAL').asInteger := 1;

   xxCds.first;
   xxCds_aux.First;
   xAux_Ant := 'XX';
   xCta_Ant := 'YY';
   xI := 1;
   xxCds_aux.Edit;
   xxCds_aux.FieldByName('NUMERO').asInteger := xI;
   While Not xxCds.Eof Do
   Begin

      xxCds_aux.Edit;

      xxCds_aux.FieldByName('TIPODET').asInteger := 10;
      xxCds_aux.FieldByName('CUENTA').asString := xxCds.FieldByName('CUENTAID').asString;
      xxCds_aux.FieldByName('DIARIO').asString := xxCds.FieldByName('TDIARID').asString;
      xxCds_aux.FieldByName('COMPROBANTE').asString := QuitarCeros(xxCds.FieldByName('CNTCOMPROB').asString);
      xxCds_aux.FieldByName('CODIGO').asString := xxCds.FieldByName('AUXID').asString;
      xxCds_aux.FieldByName('PROVEEDOR').asString := xxCds.FieldByName('AUXNOMB').asString;
      xxCds_aux.FieldByName('FECHA').asString := xxCds.FieldByName('CNTFEMIS').asString;
      xxCds_aux.FieldByName('DOCUMENTO').asString := xxCds.FieldByName('CNTSERIE').asString + ' - ' + xxCds.FieldByName('CNTNODOC').asString;
      xxCds_aux.FieldByName('CONCEPTO').asString := xxCds.FieldByName('CNTGLOSA').asString;
      xSaldo := xxCds.FieldByName('MONTODEBE').asFloat - xxCds.FieldByName('MONTOHABER').asFloat;
      xxCds_aux.FieldByName('SUBTOTAL').asFloat := xSaldo;

      If ((xAux_Ant <> xxCds.FieldByName('AUXID').asString) Or (xCta_Ant <> xxCds.FieldByName('CUENTAID').asString))
         And (xAux_Ant <> 'XX') Then
      Begin
         xI := xI + 1;
         xxCds_aux.FieldByName('NUMERO').asInteger := xI;
         xxCds_aux.Prior;
         xxCds_aux.Edit;
         xxCds_aux.FieldByName('TOTAL').asFloat := xTotalGrupo;
         xTotalGrupo := 0;
         xxCds_aux.Next;
      End;
      xTotalGrupo := xTotalGrupo + xSaldo;
      xTotal := xTotal + xSaldo;

      xAux_Ant := xxCds.FieldByName('AUXID').asString;
      xCta_Ant := xxCds.FieldByName('CUENTAID').asString;
      xxCds.Next;

      // si es la última fila entonces poner el total del último grupo
      If xxCds.Eof Then
      Begin
         xxCds_aux.Edit;
         xxCds_aux.FieldByName('TOTAL').asFloat := xTotalGrupo;
      End;

      xxCds_aux.Next;
   End;

   xxCds_aux.Edit;
   xxCds_aux.FieldByName('TIPODET').asInteger := 20;
   xxCds_aux.FieldByName('TOTAL').asFloat := xTotal;
   xxCds_aux.FieldByName('SUBTOTAL').asFloat := xTotal;
   xxCds_aux.FieldByName('CONCEPTO').asString := 'TOTAL';
End;

Function TFAnalisisAuxiliar.QuitarCeros(xxCampo: String): String;
Var
   xCadena_aux: String;
   xTamanio, xI: integer;
   xRetorno: String;
Begin
   xCadena_aux := xxCampo;
   xTamanio := Length(xxCampo);
   xRetorno := '';
   For xI := 1 To xTamanio Do
   Begin
      If (MidStr(xCadena_aux, xI, 1) <> '0') And (length(xRetorno) = 0) Then
      Begin
         xRetorno := MidStr(xCadena_aux, xI, xTamanio + 1 - xI);
      End;
   End;
   If xRetorno = '' Then
      xRetorno := '0';

   Result := xRetorno;
End;

End.

