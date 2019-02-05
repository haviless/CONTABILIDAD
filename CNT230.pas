Unit CNT230;

// Conciliación Bancaria - Pantalla Principal
// Actualizaciones
// HPC_201501_CNT    Creación de Formulario
// HPC_201502_CNT    Modificaciones en el formulario segun DAF_2015000640_CNT_1
// HPC_201503_CNT    29/09/2015 Se retira formmulario CNT412,
//                   porque no se usa y causa conflicto entre transacciones y consultas
// HPC_201702_CNT    02/06/2017
//                   Permite trabajar con mas de un periodo contable para un mismo descargo de banco
//                   Permite visualizar Saldos Iniciales
//                   Permite exportar a excel
//                   Permite contabilizar los extractos bancarios para periodos atrasados 
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Buttons, Mask, wwdbedit,
// Inicio HPC_201502_CNT
 //Wwdbspin, ExtCtrls, wwdblook, DB, wwcheckbox, Wwdbdlg, DateUtils;
   Wwdbspin, ExtCtrls, wwdblook, DB, wwcheckbox, Wwdbdlg, DateUtils, StrUtils,
   Wwkeycb, ComCtrls, DBClient, wwclient, Wwdatsrc, ppEndUsr, ppDB,
   ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls,
   ppBands, ppPrnabl, ppCache, ppParameter, jpeg, ppVar,ppviewr,ppTypes,
// Fin HPC_201502_CNT
   //Inicio HPC_201702_CNT, nuevas librerias para el manejo de excel
   Excel2000,ComObj;
   //Fin HPC_201702_CNT
Type
   TFConcBanCob = Class(TForm)
      grbConciliacionBancaria: TGroupBox;
      lblBanco: TLabel;
      lblCtaCte: TLabel;
      lblPeriodo: TLabel;
      dblcBanco: TwwDBLookupCombo;
      dblcCCBcoid: TwwDBLookupCombo;
      dbsAno: TwwDBSpinEdit;
      dbsMEs: TwwDBSpinEdit;
      bbtnProcesarConc: TBitBtn;
      grbEXtracto: TGroupBox;
      grbMovCont: TGroupBox;
	  dbgMovCont: TwwDBGrid;
      gbVerifyConfront: TGroupBox;
      chkAgrupado: TCheckBox;
      rbConcAutomatica: TRadioButton;
      rbConcManual: TRadioButton;
      bbtnProcesaVerifyConfr: TBitBtn;
      grbContabiliza: TGroupBox;
      rbContabiliza2: TRadioButton;
      bbtnContabiliza: TBitBtn;
      lblCia: TLabel;
      dblcCia: TwwDBLookupCombo;
      odlgSeleccionarArchivo: TOpenDialog;
      pnlManual: TPanel;
      rbConcxOperacion: TRadioButton;
      rbConcxDNI: TRadioButton;
      rbConcxFecha: TRadioButton;
      grbExtBanDatos: TGroupBox;
      btnArchivo: TBitBtn;
      bbtnProcesaExtrBan: TBitBtn;
      grbMovContDatos: TGroupBox;
      bbtnMovsCont: TBitBtn;
      pnlProcesados: TPanel;
      lblVerifConciliados: TLabel;
      lblVerifNoConciliados: TLabel;
      shpProcesados: TShape;
      shpProcesadosVert: TShape;
      shpProcesadosHoriz: TShape;
      lblconciliados: TLabel;
      lblnoconciliados: TLabel;
      rbContabiliza1: TRadioButton;
      dbgExtracto: TwwDBGrid;
      gbFiltro: TGroupBox;
      chkVerConciliados: TCheckBox;
      chkVerNoConciliados: TCheckBox;
      chkVerContabilizados: TCheckBox;
      bbtnRefresca: TBitBtn;
      ingChk: TImage;
      lblporPrefijo: TLabel;
      edtPrefijo: TEdit;
      btndesmarcaextban: TBitBtn;
      edtCiaid: TEdit;
      edtBancoid: TEdit;
      edtCCBcoid: TEdit;
      edtRutaArchivo: TEdit;
      bbtnNuevo: TBitBtn;
      bbtnEliminaConc: TBitBtn;
      Label5: TLabel;
      dblcdCuenta: TwwDBLookupComboDlg;
      edtCuenta: TEdit;
      gbTDiario: TGroupBox;
      chkTodos: TCheckBox;
      dblcTDiario: TwwDBLookupCombo;
      edtTdiario: TEdit;
      spbMarca: TSpeedButton;
   // Inicio HPC_201502_CNT
      rbTodo: TRadioButton;
      gbPeriodo: TGroupBox;       // Inicio HPC_201702_CNT Fin
      dbsAnoCNT: TwwDBSpinEdit;
      dbsMEsCNT: TwwDBSpinEdit;
      pnlBusca: TPanel;
      grbBusqueda: TGroupBox;
      edtBusca: TwwIncrementalSearch;
      pnlEstado: TPanel;
      pbEstado: TProgressBar;
      pnlNumeroCon: TPanel;
      edtNumConciliacion: TEdit;
      Label1: TLabel;
      cbMarcado: TwwCheckBox;
      bbtnSumaMarcas: TBitBtn;
      bbtnDesmarcatodo: TBitBtn;
      spbDesMarca: TSpeedButton;
      Label2: TLabel;
      edtSaldoBanco: TEdit;
      btnImpresion: TButton;
      ppReport1: TppReport;
      ppdb1: TppBDEPipeline;
      pdes1: TppDesigner;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      plblBanco: TppLabel;
      plblCtacte: TppLabel;
      plblCuenta: TppLabel;
      plblMoneda: TppLabel;
      plblMES: TppLabel;
      ppLine4: TppLine;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppSystemVariable3: TppSystemVariable;
      ppImage1: TppImage;
      plblNomCuenta: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLine7: TppLine;
      ppDetailBand1: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      pplblTotal: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppDBText5: TppDBText;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBCSubtotal: TppDBCalc;
      pplblSubtotal: TppLabel;
      ppLine5: TppLine;
      ppLine6: TppLine;
      BitBtn1: TBitBtn;
      pnlcompara: TPanel;
      Shape1: TShape;
      Shape2: TShape;
      Shape3: TShape;
      Label3: TLabel;
      Label4: TLabel;
      Label6: TLabel;
      edtMayor: TEdit;
      edtConc: TEdit;
      Button1: TButton;
      Shape5: TShape;
      Label7: TLabel;
      edtdif: TEdit;
      chkCheques: TCheckBox;
      BitBtn2: TBitBtn;
      //Inicio HPC_201702_CNT
      //nuevos controles 
      bbtnMovAnt: TBitBtn;
      Shape4: TShape;
      edtInicial: TEdit;
      Label8: TLabel;
      bbtnExpExcel: TBitBtn;     
      ppDBText6: TppDBText;
      ppLabel6: TppLabel;
      //Fin HPC_201702_CNT
   // Fin HPC_201502_CNT
      Procedure FormCreate(Sender: TObject);
      Procedure dblcBancoExit(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcCCBcoidExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure btnArchivoClick(Sender: TObject);
      Procedure bbtnProcesaExtrBanClick(Sender: TObject);
      Procedure bbtnProcesarConcClick(Sender: TObject);
      Procedure bbtnMovsContClick(Sender: TObject);
      Procedure dblcTDiarioExit(Sender: TObject);
      Procedure dbsMEsExit(Sender: TObject);
      Procedure bbtnProcesaVerifyConfrClick(Sender: TObject);
      Procedure rbConcAutomaticaClick(Sender: TObject);

      Procedure dbgMovContCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure dbgMovContTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure dbgMovContDblClick(Sender: TObject);
      Procedure rbConcManualClick(Sender: TObject);
      Procedure bbtnNuevoClick(Sender: TObject);
      Procedure rbContabiliza1Click(Sender: TObject);
      Procedure rbContabiliza2Click(Sender: TObject);
      Procedure bbtnContabilizaClick(Sender: TObject);
      Procedure dbgExtractoCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure dbgExtractoDblClick(Sender: TObject);
      Procedure dbgExtractoTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure chkVerConciliadosClick(Sender: TObject);
      Procedure chkVerNoConciliadosClick(Sender: TObject);
      Procedure chkVerContabilizadosClick(Sender: TObject);
      Procedure bbtnRefrescaClick(Sender: TObject);
      Procedure btndesmarcaextbanClick(Sender: TObject);
      Procedure spbMarcaClick(Sender: TObject);
      Procedure bbtnEliminaConcClick(Sender: TObject);
      Procedure rbConcxDNIClick(Sender: TObject);
      Procedure rbConcxOperacionClick(Sender: TObject);
      Procedure rbConcxFechaClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure chkTodosClick(Sender: TObject);
      Procedure dblcdCuentaExit(Sender: TObject);
   // Inicio HPC_201502_CNT
      procedure edtBuscaExit(Sender: TObject);
      procedure edtBuscaKeyPress(Sender: TObject; var Key: Char);
      procedure dbsMEsCNTExit(Sender: TObject);
      procedure cbMarcadoExit(Sender: TObject);
      procedure cbMarcadoClick(Sender: TObject);
      procedure bbtnSumaMarcasClick(Sender: TObject);
      procedure bbtnDesmarcatodoClick(Sender: TObject);
      procedure spbDesMarcaClick(Sender: TObject);
      procedure edtSaldoBancoExit(Sender: TObject);
      procedure btnImpresionClick(Sender: TObject);
      procedure pplblSubtotalPrint(Sender: TObject);
      procedure ppDBCSubtotalPrint(Sender: TObject);
      procedure ppLine5Print(Sender: TObject);
      procedure BitBtn1Click(Sender: TObject);
      procedure Button1Click(Sender: TObject);
      procedure dblcCCBcoidClick(Sender: TObject);
      procedure edtSaldoBancoKeyPress(Sender: TObject; var Key: Char);
      procedure BitBtn2Click(Sender: TObject);
    procedure ppReport1PreviewFormCreate(Sender: TObject);
   // Fin HPC_201502_CNT
      //Inicio HPC_201702_CNT, nuevas rutinas
      Procedure bbtnMovsAntClick(Sender: TObject);
      procedure bbtnExpExcelClick(Sender: TObject);
      procedure dbgMovContKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
      //Fin HPC_201702_CNT
   Private
    { Private declarations }
   // Inicio HPC_201502_CNT
      Procedure Buscar();
      Procedure SumaImpoContab();
   // Fin HPC_201502_CNT
   Public
    { Public declarations }
      xnumconc: String;
      suma: currency;
      xfiltro: String;
      xprefijo1: String;
   // Inicio HPC_201502_CNT
      vImporContab: Double;
      vSemaforo1 : String;
   // Fin HPC_201502_CNT
      Procedure Refrescadata();
      Procedure sumaconciliados();
      Procedure Nuevo();
      Procedure pclick();
      Function BuscaCadena(vCadena: String): boolean;
      Function VerificaPeriodo: Boolean;
   End;

Var
   FConcBanCob: TFConcBanCob;
   xSQL: String;

Implementation

// Inicio HPC_201702_CNT: Se agrego nuevo formulario CNT230A
// Inicio HPC_201503_CNT
//Uses CNTDM, CNT412, CNT231, CNT232, CNT233;
//Uses CNTDM, CNT231, CNT232, CNT233;          //antes
Uses CNTDM, CNT231, CNT232, CNT233, CNT230A;    //ahora
// Fin HPC_201503_CNT
// Fin HPC_201702_CNT

{$R *.dfm}

Procedure TFConcBanCob.FormCreate(Sender: TObject);
Begin

// Inicio HPC_201502_CNT
   vSemaforo1:= '1';
// Fin HPC_201502_CNT

  //Compañia
   xSQL := 'Select CIAID,CIADES from TGE101';
   DMCNT.cdsCia.Close;
   DMCNT.cdsCia.DataRequest(xSQL);
   DMCNT.cdsCia.Open;
   dblcCia.LookupTable := DMCNT.cdsCia;
   dblcCia.LookupField := 'CIAID';

  //Banco
   xSQL := 'Select BANCOID,BANCONOM From TGE105';
   DMCNT.cdsDoc2.Close;
   DMCNT.cdsDoc2.DataRequest(xSQL);
   DMCNT.cdsDoc2.Open;
   dblcBanco.LookupTable := DMCNT.cdsDoc2;
   dblcBanco.LookupField := 'BANCOID';

  //Tipo de Diario
   xSQL := 'Select TDIARID,TDIARDES from TGE104';
   DMCNT.cdsTDiario.Close;
   DMCNT.cdsTDiario.DataRequest(xSQL);
   DMCNT.cdsTDiario.Open;
   dblcTDiario.LookupTable := DMCNT.cdsTDiario;
   dblcTDiario.LookupField := 'TDIARID';

  //Tipo de Diario
   xSQL := 'Select TDIARID,TDIARDES from TGE104';
   DMCNT.cdsTipCta.Close;
   DMCNT.cdsTipCta.DataRequest(xSQL);
   DMCNT.cdsTipCta.Open;

// Inicio HPC_201502_CNT
   cbMarcado.visible := True;
   xSQL := ' Select ''N'' FLAG, IDCONC, IDEXTBAN, IDMOVCONT, FECEMISION, DESCRIPCION, '
         + '        NUMOPERA, REFERENCIA, DNI, IMPORTE, 0.00 IMPCONTAB, NVL(FLGCONC,''N'') FLGCONC , NUMCOMPROB, CODDIARIO, PERANOMM '
         + '   From CNT_CONC_EXTR_BAN '
         + '  Where 1=2';
   DMCNT.cdsMovCNT1.Close;
   DMCNT.cdsMovCNT1.DataRequest(xSQL);
   DMCNT.cdsMovCNT1.Open;
   dbgExtracto.DataSource := DMCNT.dsMovCNT1;
   dbgExtracto.Selected.Clear;
   dbgExtracto.Selected.Add('FLGCONC'#9'2'#9'Conc.'#9#9);
   dbgExtracto.Selected.Add('DNI'#9'8'#9'DNI'#9#9);
   dbgExtracto.Selected.Add('FECEMISION'#9'10'#9'Fec.Emis.'#9#9);
   dbgExtracto.Selected.Add('IMPORTE'#9'13'#9'Importe'#9#9);
   dbgExtracto.Selected.Add('DESCRIPCION'#9'23'#9'Descripción'#9#9);
   dbgExtracto.Selected.Add('NUMOPERA'#9'10'#9'Num.Operac.'#9#9);
   dbgExtracto.Selected.Add('IDEXTBAN'#9'10'#9'Id.Extrac.'#9#9);
   dbgExtracto.Selected.Add('REFERENCIA'#9'10'#9'Otro/Chq'#9#9);
   dbgExtracto.Selected.Add('FLAG'#9'2'#9' ');
// dbgExtracto.ControlType.Add('FLAG;CheckBox;S;N');
   dbgExtracto.Selected.Add('IMPCONTAB'#9'10'#9'Imp.Contab.'#9#9);
   dbgExtracto.Selected.Add('NUMCOMPROB'#9'10'#9'Comprobante.'#9#9);
   dbgExtracto.Selected.Add('CODDIARIO'#9'02'#9'Diario.'#9#9);
   dbgExtracto.Selected.Add('PERANOMM'#9'06'#9'Periodo.'#9#9);
   dbgExtracto.SetControlType('FLAG',fctCustom,'cbMarcado');
   dbgExtracto.ApplySelected;
   dbgExtracto.RefreshDisplay;

   xSQL := 'Select IDCONC, IDMOVCONT, IDEXTBAN, CIAID, TDIARID, CNTFEMIS, CNTCOMPROB, '
         + '       CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, NUMOPERA, DNI, CNTDH, '
         + '       IMPORTE,NVL(FLGCONC,''N'') FLGCONC '
         + '  From CNT_CONC_MOV_CONT '
         + ' Where 1=2';
   DMCNT.cdsMovCNT.Close;
   DMCNT.cdsMovCNT.DataRequest(xSQL);
   DMCNT.cdsMovCNT.Open;
   dbgMovCont.DataSource := DMCNT.dsMovCNT;
   dbgMovCont.Selected.Clear;
   dbgMovCont.Selected.Add('FLGCONC'#9'2'#9'Conc.'#9#9);
   dbgMovCont.Selected.Add('DNI'#9'8'#9'DNI'#9#9);
   dbgMovCont.Selected.Add('CNTFEMIS'#9'10'#9'Fec.Emis.'#9#9);
   dbgMovCont.Selected.Add('IMPORTE'#9'13'#9'Importe'#9#9);
   dbgMovCont.Selected.Add('CNTDH'#9'1'#9'DH'#9#9);
   dbgMovCont.Selected.Add('NUMOPERA'#9'10'#9'N.Operac.'#9#9);
   dbgMovCont.Selected.Add('IDMOVCONT'#9'10'#9'Id.Mov.CNT.'#9#9);
   dbgMovCont.Selected.Add('TDIARID'#9'02'#9'T.Diario'#9#9);
   dbgMovCont.Selected.Add('CNTCOMPROB'#9'10'#9'Num.Comprob.'#9#9);
   dbgMovCont.ApplySelected;
// Fin HPC_201502_CNT
   Nuevo;
End;

Procedure TFConcBanCob.dblcBancoExit(Sender: TObject);
Begin

   If DMCNT.cdsDoc2.Locate('BANCOID', VarArrayOf([dblcBanco.Text]), []) Then
      edtBancoid.Text := DMCNT.cdsDoc2.FieldByname('BANCONOM').AsString
   Else
      edtBancoid.Text := 'Sin Descripción';

  //Cuenta
   xSQL := 'Select CCBCOID, CCBCODES, TMONID '
         + '  from TGE106 '
         + ' Where BANCOID=' + quotedstr(DMCNT.cdsDoc2.FieldByname('BANCOID').AsString)
         + '   and ACTIVO=''S'' '
         + '   and CIAID=''02'' ';
   DMCNT.cdsCuenta2.Close;
   DMCNT.cdsCuenta2.DataRequest(xSQL);
   DMCNT.cdsCuenta2.Open;
   dblcCCBcoid.LookupTable := DMCNT.CdsCuenta2;
   dblcCCBcoid.LookupField := 'CCBCOID';
// Inicio HPC_201502_CNT
   dblcCCBcoid.DropDown; 
// Fin HPC_201502_CNT
End;

Procedure TFConcBanCob.dblcCiaExit(Sender: TObject);
Begin
   If DMCNT.cdsCia.Locate('CIAID', VarArrayOf([dblcCia.Text]), []) Then
      edtCiaid.Text := DMCNT.cdsCia.FieldByname('CIADES').AsString
   Else
      edtCiaid.Text := 'Sin Descripción';
// Cuenta Contable
   xSQL := 'Select CUENTAID, CTADES, CTAAUT1, CIAID, CTAABR, CTA_MOV, CTA_AUX, '
         + '       CTA_DOC, CTA_CCOS, CTA_ME, FLGVAR, CTA_DEST, CTA_DET, CTA_DIFC, REGSOLOME '
         + '  from TGE202 '
         + ' where CIAID=' + QuotedStr(dblcCia.text)
         + '   and CTAACT=''S'' ';
   DMCNT.cdsCuenta.Close;
   DMCNT.cdsCuenta.DataRequest(xSQL);
   DMCNT.cdsCuenta.Open;
   DMCNT.cdsCuenta.IndexFieldNames := 'CUENTAID';
   dblcdCuenta.LookUpField := 'CUENTAID';
   dblcdCuenta.LookupTable := DMCNT.cdsCuenta;
End;

Procedure TFConcBanCob.dblcCCBcoidExit(Sender: TObject);
Begin
   If DMCNT.cdsCuenta2.Locate('CCBCOID', VarArrayOf([dblcCCBcoid.Text]), []) Then
      edtCCBcoid.Text := DMCNT.cdsCuenta2.FieldByname('CCBCODES').AsString
   Else
      edtCCBcoid.Text := 'Sin Descripción';
End;

Procedure TFConcBanCob.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
   // Inicio HPC_201502_CNT
    //If Self.ActiveControl Is TMemo Then Exit;
      Key := #0;
      Perform(CM_DialogKey, VK_TAB, 0);
   // Fin HPC_201502_CNT
   End;
End;

Procedure TFConcBanCob.btnArchivoClick(Sender: TObject);
Var
   xsArchivo: String;
Begin
   If Not odlgSeleccionarArchivo.Execute Then Exit;
   xsArchivo := odlgSeleccionarArchivo.FileName;
   edtRutaArchivo.Text := xsArchivo;
End;

Procedure TFConcBanCob.bbtnProcesaExtrBanClick(Sender: TObject);
Var
   xslArchivoCVS: TstringList;
   xnLinea, xfin: Integer;
   numdocInt: Int64;
   xsLineaTexto, xperiodo: String;
 //Inicio HPC_201502_CNT
   xPlantilla : String;
 //Final HPC_201502_CNT
Begin
   xperiodo := dbsAno.Text + dbsMEs.Text;
   xslArchivoCVS := TstringList.Create;
   xslArchivoCVS.LoadFromFile(edtRutaArchivo.Text);
   DMCNT.cdsMovCNT1.DisableControls;

   If Length(trim(edtRutaArchivo.Text)) = 0 Then
   Begin
      ShowMessage('Debe Seleccionar un Archivo de Extracto Bancario');
      Exit;
      btnArchivo.SetFocus;
   End;

// Inicio HPC_201502_CNT
   // Verificar si existe detalle, si el detalle ya esta marcado como consiliado no podra hacer nada
   If  DMCNT.cdsMovCNT1.RecordCount>0 Then
   Begin
     Xsql:='select IDEXTBAN from CNT_CONC_MOV_CONT WHERE IDCONC='''+TRIM(edtNumConciliacion.Text)+''' AND (FLGCONC IS NOT NULL OR FLGCONC=''N'') ';
     DMCNT.cdsQry.Close;
     DMCNT.cdsQry.DataRequest(XSQL);
     DMCNT.cdsQry.Open;
     If DMCNT.cdsQry.RecordCount>0 Then
     Begin
       ShowMessage('Ya está conciliado, Verifique o Elimine toda la Conciliación para volverlo a generar');
       exit;
     End
     Else
     Begin
       Xsql:='Delete  CNT_CONC_EXTR_BAN Where  IDCONC='''+TRIM(edtNumConciliacion.Text)+''' ';
       Try
         DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
       Except
         ShowMessage('No se pudo Eliminar el extracto Bancario para poder generarlo nuevamente, verifique');
         exit;
       End;
     End;
   End;
  
   pbEstado.Min := 0;
   pbEstado.Max := xslArchivoCVS.Count;
   pbEstado.Position := 0;
   pnlEstado.Left:=30;
   pnlEstado.Top :=304;
   pnlEstado.Visible := True;

   For xnLinea := 5 To xslArchivoCVS.Count - 1 Do
   Begin
      xsLineaTexto := xslArchivoCVS.Strings[xnLinea];
      xsLineaTexto := StringReplace(xsLineaTexto, '",', '";', [rfreplaceall]);
      xsLineaTexto := StringReplace(xsLineaTexto, ',', '', [rfreplaceall]);
      xsLineaTexto := StringReplace(xsLineaTexto, ':', '', [rfreplaceall]);

      Try
        If chkCheques.Checked Then
           xPlantilla:='00002'
        Else 
           xPlantilla:='00001';

         xSQL := ' Begin '
      //       + '    SP_CNT_CONC_ACT_EXTR_BAN(''00001'',' + QuotedStr(xsLineaTexto) + ',''' + xnumconc + ''');'
               + '    SP_CNT_CONC_ACT_EXTR_BAN('''+xPlantilla+''',' + QuotedStr(xsLineaTexto) + ',''' + xnumconc + ''');'
               + ' End;';
         DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      Except
         ShowMessage('No se pudo añadir el extracto bancario a la Base de Datos');
         exit;
      End;
      pbEstado.Position := pbEstado.Position + 1;
   End;

// Actualiza cabecera conel nombre de archivo
   xSQL := 'Update CNT_CONC_BAN_CAB '
          +'   set NOMARCHEXTBAN='+quotedstr(edtRutaArchivo.Text)
          +' Where IDCONC='+quotedstr(xnumconc);
   Try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
   Except
      ShowMessage('No se pudo actualizar el nombre del archivo del extracto bancario');
      pbEstado.Visible := False;
      exit;
   End;
   Refrescadata;
   sumaconciliados;
   dbsAnoCNT.text := dbsAno.text;
   dbsMEsCNT.text := dbsMEs.text;

   DMCNT.cdsMovCNT1.EnableControls;
   pnlEstado.Visible := False;
// Fin HPC_201502_CNT

End;

Procedure TFConcBanCob.bbtnProcesarConcClick(Sender: TObject);
Var
   xPeriodo: String;
   numdocInt: Int64;
Begin

   dbsMEs.Text := DMCNT.StrZero(dbsMEs.Text, 2);
// Inicio HPC_201502_CNT
   vImporContab := 0;
// Fin HPC_201502_CNT
   If Length(trim(dblcCia.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar el código de Compañia');
      exit;
   End;

   If Length(trim(dblcBanco.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar el código de Banco');
      exit;
   End;

   If Length(trim(dblcCCBcoid.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar Cuenta Bancaria');
      exit;
   End;

   If Length(trim(dbsAno.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar el Año del Periodo');
      exit;
   End;

   If Length(trim(dbsMes.Text)) = 0 Then
   Begin
      ShowMessage('Debe ingresar el Mes del Periodo');
      exit;
   End;

//   If not VerificaPeriodo then
//      exit;

// Inicio HPC_201502_CNT
// xSQL := 'Select IDCONC, CIAID, PERIODO, BANCOID, CCBCOID, NOMARCHEXTBAN, CTACONTMOV, '
   xSQL := 'Select IDCONC, CIAID, PERIODO, BANCOID, CCBCOID, NOMARCHEXTBAN, CTACONTMOV, MONSALBAN, '
         + '       TDIARID, USUARIO, FREG '
         + '  From CNT_CONC_BAN_CAB '
         + ' Where CIAID=' + QuotedStr(dblcCia.Text)
         + '   And PERIODO=' + QuotedStr(Trim(dbsAno.Text + dbsMEs.Text))
         + '   And BANCOID=' + QuotedStr(Trim(dblcBanco.Text))
         + '   And CCBCOID=' + QuotedStr(Trim(dblcCCBcoid.Text));
// Fin HPC_201502_CNT
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   If DMCNT.cdsQry.RecordCount > 0 Then
   Begin
   // JCC se debe deshabilitar si la Conciliación está CERRADA
      grbExtBanDatos.Enabled := True;

      //Inicio HPC_201702_CNT: se habilita e inhabilita cada bloque individual
      //grbMovContDatos.Enabled := True;
      gbTDiario.Enabled := True;
      gbPeriodo.Enabled := True;
      dblcdCuenta.Enabled := True;
      bbtnMovsCont.Enabled := True;
      //Fin HPC_201702_CNT

      If length(DMCNT.cdsQry.FieldByName('CTACONTMOV').AsString) > 0 Then
      Begin
         ShowMessage('Ya existe una Conciliación con los parámetros selecionados, verifique..');
      // Inicio HPC_201502_CNT
         edtNumConciliacion.Text :=  DMCNT.cdsQry.Fieldbyname('IDCONC').AsString;
         edtSaldoBanco.Text      :=  DMCNT.cdsQry.Fieldbyname('MONSALBAN').AsString;
      // Fin HPC_201502_CNT
         grbExtBanDatos.Enabled := False;

         //Inicio HPC_201702_CNT: se habilita e inhabilita cada bloque individual
         //grbMovContDatos.Enabled := False;
         gbTDiario.Enabled := False;
         gbPeriodo.Enabled := False;
         dblcdCuenta.Enabled := False;
         bbtnMovsCont.Enabled := False;
         //Fin HPC_201702_CNT

      End;
      xnumconc := DMCNT.cdsQry.FieldByname('IDCONC').AsString;
   // Inicio HPC_201502_CNT
      edtNumConciliacion.Text :=  xnumconc;
      edtSaldoBanco.Text      :=  DMCNT.cdsQry.Fieldbyname('MONSALBAN').AsString;
   // Fin HPC_201502_CNT      
      edtRutaArchivo.Text := DMCNT.cdsQry.FieldByname('NOMARCHEXTBAN').AsString;
      dblcdCuenta.Text := DMCNT.cdsQry.FieldByname('CTACONTMOV').AsString;
      dblcTDiario.Text := DMCNT.cdsQry.FieldByname('TDIARID').AsString;
      dblcTDiarioExit(self);
      //grbConciliacionBancaria.Color := clActiveCaption;
      //grbConciliacionBancaria.Enabled := False;
      Refrescadata;
      sumaconciliados;
   End
   Else
   Begin
    //Genera nuevo número
      xperiodo := dbsAno.Text + dbsMEs.Text;
   // Inicio HPC_201502_CNT
      xSQL := 'Select nvl(max(IDCONC),''' + xperiodo + '000000'')' + 'IDCONC '
            + '  from CNT_CONC_BAN_CAB '
      //    + ' Where CIAID=' + QuotedStr(dblcCia.Text)
      //    + '   and PERIODO=' + QuotedStr(xperiodo);
            + ' Where PERIODO=' + QuotedStr(xperiodo);
   // Fin HPC_201502_CNT
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;

      If DMCNT.cdsQry.RecordCount > 0 Then
      Begin
         numdocInt := StrToInt64(DMCNT.cdsQry.FieldByname('IDCONC').AsString);
         xnumconc := IntToStr(numdocInt + 1);
      End
      Else
         xnumconc := xperiodo + '000001';
   // Inicio HPC_201502_CNT
      Try
      If DMCNT.Valores(trim(edtSaldoBanco.Text))=0 then
      Begin
         ShowMessage('Debe ingresa el Saldo de Banco');
         exit;
      End;
      Except
         ShowMessage('Debe ingresa el Saldo de Banco');
         exit;
      End;
     //xSQL := 'Insert Into CNT_CONC_BAN_CAB(IDCONC, CIAID, PERIODO, BANCOID, CCBCOID,'
      xSQL := 'Insert Into CNT_CONC_BAN_CAB(IDCONC, CIAID, PERIODO, BANCOID, CCBCOID,MONSALBAN,'
            + '                             USUARIO,FREG) '
            + 'values('
            + QuotedStr(xnumconc) + ','
            + QuotedStr(dblcCia.Text) + ','
            + QuotedStr(dbsAno.Text + dbsMEs.Text) + ','
            + QuotedStr(dblcBanco.Text) + ','
            + QuotedStr(dblcCCBcoid.Text) + ','
            + QuotedStr(FloatToStr(DMCNT.Valores(edtSaldoBanco.Text)))+','
            + QuotedStr(DMCNT.wUsuario) + ',trunc(SysDate))';
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      edtNumConciliacion.Text :=  xnumconc;
   // Fin HPC_201502_CNT
      grbExtBanDatos.Enabled := True;

      //Inicio HPC_201702_CNT: se habilita e inhabilita cada bloque individual
      //grbMovContDatos.Enabled := True;
      gbTDiario.Enabled := True;
      gbPeriodo.Enabled := True;
      dblcdCuenta.Enabled := True;
      bbtnMovsCont.Enabled := True;
      //Fin HPC_201702_CNT
   End;
   grbConciliacionBancaria.Enabled := False;
   grbEXtracto.Enabled := True;
   grbMovCont.Enabled := True;
   grbConciliacionBancaria.Color := $00CEFFCE; //clActiveCaption;
// Inicio HPC_201502_CNT
 //grbConciliacionBancaria.Enabled := False;
// Fin HPC_201502_CNT
End;

Procedure TFConcBanCob.bbtnMovsContClick(Sender: TObject);
Var
   xWhere, xTdiarid: String;
   xGeneraMov: Boolean;
Begin
   If (Not chkTodos.Checked) And (Length(Trim(dblcTDiario.Text)) = 0) Then
   Begin
      ShowMessage('Debe ingresar el Tipo de Diario o indicar Todos los Tipos de Diario');
      exit;
      dblcTDiario.SetFocus;
   End;

   xSQL := 'Select IDMOVCONT, CIAID, TDIARID, CNTFEMIS, CNTCOMPROB, CNTANOMM, CNTLOTE, '
      // Inicio HPC_201502_CNT
       //+ '       CUENTAID, CLAUXID, AUXID, NUMOPERA, DNI, CNTDH, IMPORTE, FLGCONC '
         + '       CUENTAID, CLAUXID, AUXID, NUMOPERA, DNI, CNTDH, IMPORTE, NVL(FLGCONC,''N'')FLGCONC '
      // Fin HPC_201502_CNT
         + '  from CNT_CONC_MOV_CONT '
         + ' Where IDCONC=' + QuotedStr(xnumconc);
   DMCNT.cdsMovCNT.Close;
   DMCNT.cdsMovCNT.DataRequest(xSQL);
   DMCNT.cdsMovCNT.Open;

   xGeneraMov := True;
   If DMCNT.cdsMovCNT.RecordCount > 0 Then
   Begin
      xGeneraMov := False;
      If MessageDlg('¿  Reprocesar Información del Detalle Contable  ? ',
         mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         xGeneraMov := True;
   End;
// Inicio HPC_201502_CNT
   dbsMEsCNT.Text := DMCNT.StrZero(dbsMEsCNT.Text, 2);
// Fin HPC_201502_CNT
   If xGeneraMov Then
   Begin
   // Borra Información generada previamente
      xSQL := 'Delete from CNT_CONC_MOV_CONT '
         + ' Where IDCONC=' + QuotedStr(xnumconc);
      Try
         DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      Except
      End;

   // Genera Informacion
   // Inicio HPC_201502_CNT
      xSQL := 'Insert Into CNT_CONC_MOV_CONT(IDCONC, IDMOVCONT, IDEXTBAN, CIAID, TDIARID, CNTFEMIS, '
            + '                              CNTCOMPROB, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
            + '                              NUMOPERA, DNI, CNTDH, IMPORTE, FLGCONC, USUARIO, '
        //  + '                              FREG) '
            + '                              FREG,CNTGLOSA) '
            + 'Select ''' + xnumconc + ''' IDCONC, LPAD(ROWNUM,6,''0'') IDMOVCONT, '''' IDEXTBAN, '
            + '       CIAID, TDIARID, CNTFEMIS, CNTCOMPROB, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, '
            + '       AUXID, NUMOPERA, DNI, CNTDH, CNTMTOORI, ''N'' FLGCONC,''' + DMCNT.wUsuario + ''', '
       //   + '       trunc(SysDate) '
            + '       trunc(SysDate),CNTGLOSA '
            + '  from (Select CIAID, TDIARID, CNTFEMIS, CNTCOMPROB, CNTANOMM, CNTLOTE, CUENTAID, '
            //+ '               CLAUXID, AUXID, ''0''||SF_CNT_CONC_SOLONUMERO(CNTNODOC) NUMOPERA,'
            + '               CLAUXID, AUXID, CNTNODOC NUMOPERA,'
   //       + '               SF_CNT_CONC_SOLONUMERO(CNTGLOSA) DNI, CNTDH, CNTMTOORI '
            + '               SF_CNT_CONC_SOLONUMERO(CNTGLOSA) DNI, CNTDH, CNTMTOORI,CNTGLOSA '
            + '          From CNT301 '
            + '         where CIAID=' + QuotedStr(dblcCia.Text);
      If (Not chkTodos.Checked) Then
         xSQL := xSQL + ' and TDIARID=' + QuotedStr(dblcTDiario.Text);
      xSQL := xSQL
//          + '           and CNTANOMM=' + QuotedStr(dbsAno.Text + dbsMEs.Text)
            + '           and CNTANOMM=' + QuotedStr(dbsAnoCNT.Text + dbsMEsCNT.Text)
            + '           and CUENTAID=' + quotedstr(dblcdCuenta.Text)
            + '         Order by CNTFEMIS )';
   // Fin HPC_201502_CNT
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

   // Actualiza cabcera
      xSQL := 'Update CNT_CONC_BAN_CAB '
            + '   Set CTACONTMOV=' + QuotedStr(dblcdCuenta.Text) + ','
            + '       TDIARID=' + QuotedStr(dblcTDiario.Text)
            + ' Where IDCONC=' + QuotedStr(xnumconc);
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

   // Inicio HPC_201502_CNT
      xSQL := 'Select IDMOVCONT, CIAID, TDIARID, CNTFEMIS, CNTCOMPROB, CNTANOMM, CNTLOTE, '
        //  + '       CUENTAID, CLAUXID, AUXID, NUMOPERA, DNI, CNTDH, IMPORTE, FLGCONC '
            + '       CUENTAID, CLAUXID, AUXID, NUMOPERA, DNI, CNTDH, IMPORTE, NVL(FLGCONC,''N'')FLGCONC '
            + '  from CNT_CONC_MOV_CONT '
            + ' Where IDCONC=' + QuotedStr(xnumconc);
   // Fin HPC_201502_CNT
      DMCNT.cdsMovCNT.Close;
      DMCNT.cdsMovCNT.DataRequest(xSQL);
      DMCNT.cdsMovCNT.Open;
   End;
   bbtnRefrescaClick(Self);
End;

Procedure TFConcBanCob.dblcTDiarioExit(Sender: TObject);
Begin
   If DMCNT.cdsTDiario.Locate('TDIARID', VarArrayOf([dblcTDiario.Text]), []) Then
      edtTdiario.Text := DMCNT.cdsTDiario.FieldByname('TDIARDES').AsString
   Else
      edtTdiario.Text := 'Sin Descripción';
End;

Procedure TFConcBanCob.dbsMEsExit(Sender: TObject);
Begin
   dbsMEs.Text := DMCNT.StrZero(dbsMEs.Text, 2);
// Inicio HPC_201502_CNT
   if (length(dbsMEs.Text)>0) and (length(dbsano.text)>0) then
   begin
      dbsMEsCNT.text := dbsMEs.Text;
      dbsAnoCNT.text := dbsAno.text;
   end;				   
// Fin HPC_201502_CNT
End;

Procedure TFConcBanCob.bbtnProcesaVerifyConfrClick(Sender: TObject);
Var
   xWhere2, xDatoBusqManual, xNumExtr, xNumMovCnt: String;
Begin
   If (DMCNT.cdsMovCNT.RecordCount = 0) Or (DMCNT.cdsMovCNT1.RecordCount = 0) Then
   Begin
      ShowMessage('Primero debe Generar información de EXTRACTO BANCARIO y MOVIMIENTO CONTABLE A CONCILIAR');
      exit;
   End;

// Inicio HPC_201502_CNT
   Try
      xSQL := ' Begin '
            + '    SP_CNT_CONC_ACT_GRUP_LINEA('''+DMCNT.cdsMovCNT1.FieldByName('IDCONC').AsString+''');'
            + ' End;';
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
   Except
      ShowMessage('No se pudo ACTUALIZAR LA LINEA');
      Exit;
   end;
// Fin HPC_201502_CNT

// Proceso automático
   If rbConcAutomatica.Checked Then
   Begin
   // Inicio HPC_201502_CNT
      pnlEstado.Left:=30;
      pnlEstado.Top :=304;
      pnlEstado.Visible := True;
   // Fin HPC_201502_CNT
      If chkAgrupado.Checked Then
      Begin
      // Inicio HPC_201502_CNT
         xSQL := 'Select A.NUMOPERA NUMOPERA_A, B.NUMOPERA NUMOPERA_B, A.CNTFEMIS CNTFEMIS_A, '
               + '       B.FECEMISION FECEMISION_B, A.IDCONC, B.IDEXTBAN, A.DNI DNI_A, '
               + '       B.DNI DNI_B, sum(nvl(A.IMPORTE,0)) IMPORTE_A, '
               + '       max(nvl(B.IMPORTE,0))IMPORTE_B  '
               + '  from CNT_CONC_MOV_CONT A, CNT_CONC_EXTR_BAN B '
//             + ' where A.NUMOPERA=B.NUMOPERA AND A.CNTFEMIS=B.FECEMISION AND A.DNI=B.DNI '
               + ' where B.IDCONC ='''+DMCNT.cdsMovCNT1.FieldByName('IDCONC').AsString+''' '
               + '       AND B.IDCONC=A.IDCONC AND substr(B.NUMOPERA,-6)=substr(A.NUMOPERA,-6) AND B.FECEMISION=A.CNTFEMIS AND B.DNI=A.DNI '
               + ' group BY A.NUMOPERA, B.NUMOPERA, A.CNTFEMIS, B.FECEMISION, A.IDCONC, '
               + '          B.IDEXTBAN, A.DNI, B.DNI '
               + 'having sum(nvl(A.IMPORTE, 0))= max(nvl(B.IMPORTE, 0)) ';
      // Fin HPC_201502_CNT
         DMCNT.cdsQry4.Close;
         DMCNT.cdsQry4.DataRequest(xSQL);
         DMCNT.cdsQry4.Open;
         DMCNT.cdsQry4.First;
      // Inicio HPC_201502_CNT
         pbEstado.Min:=0;
         pbEstado.Max:=DMCNT.cdsQry4.RecordCount;
         pbEstado.Position := 0;
      // Fin HPC_201502_CNT
         While Not DMCNT.cdsQry4.Eof Do
         Begin
            xSQL := 'Update CNT_CONC_MOV_CONT '
                  + '   Set IDEXTBAN=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDEXTBAN').AsString) + ','
                  + '       FLGCONC=''S'' '
                  + ' where IDCONC=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDCONC').AsString)
                  + '   and NUMOPERA=' + QuotedStr(DMCNT.cdsQry4.FieldByname('NUMOPERA_A').AsString)
                  + '   and CNTFEMIS=' + QuotedStr(DMCNT.cdsQry4.FieldByname('CNTFEMIS_A').AsString)
                  + '   and DNI=' + QuotedStr(DMCNT.cdsQry4.FieldByname('DNI_A').AsString);
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

            xSQL := 'Update CNT_CONC_EXTR_BAN '
                  + '   Set FLGCONC=''S'' '
                  + ' Where IDCONC=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDCONC').AsString)
                  + '   and IDEXTBAN=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDEXTBAN').AsString)
                  + '   and NUMOPERA=' + QuotedStr(DMCNT.cdsQry4.FieldByname('NUMOPERA_A').AsString)
                  + '   and FECEMISION=' + QuotedStr(DMCNT.cdsQry4.FieldByname('CNTFEMIS_A').AsString)
                  + '   and DNI=' + QuotedStr(DMCNT.cdsQry4.FieldByname('DNI_A').AsString);
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

            DMCNT.cdsQry4.Next;
         // Inicio HPC_201502_CNT
            pbEstado.Position := pbEstado.Position +1;
         // Fin HPC_201502_CNT
         End;

      End
      Else
      Begin
      // 1RA CONCILIACION DNI + MONTO + FECHA + NRO_DE_OPERACION
      // Inicio HPC_201502_CNT
         xSQL := 'Select A.NUMOPERA, B.NUMOPERA, A.CNTFEMIS, B.FECEMISION, A.IDCONC, B.IDEXTBAN, '
               + '       A.IDMOVCONT, A.DNI, B.DNI, A.IMPORTE, B.IMPORTE '
               + '  from CNT_CONC_MOV_CONT A, CNT_CONC_EXTR_BAN B '
               + ' where B.IDCONC ='''+DMCNT.cdsMovCNT1.FieldByName('IDCONC').AsString+''' '
               + '   and A.IDCONC=B.IDCONC and substr(A.NUMOPERA,-6)=substr(B.NUMOPERA,-6) '
               + '   and A.CNTFEMIS=B.FECEMISION '
               + '   and A.DNI=B.DNI '
               + '   and A.IMPORTE= (CASE WHEN B.IMPORTE<0 THEN B.IMPORTE*-1 ELSE B.IMPORTE END )  '; //AND B.FLGCONC IS NULL ';
      // Fin HPC_201502_CNT
         DMCNT.cdsQry4.Close;
         DMCNT.cdsQry4.DataRequest(xSQL);
         DMCNT.cdsQry4.Open;
         DMCNT.cdsQry4.First;
      // Inicio HPC_201502_CNT
         pbEstado.Min:=0;
         pbEstado.Max:=DMCNT.cdsQry4.RecordCount;
         pbEstado.Position := 0;
      // Fin HPC_201502_CNT
         While Not DMCNT.cdsQry4.Eof Do
         Begin
            xSQL := 'Update CNT_CONC_MOV_CONT '
                  + '   Set IDEXTBAN=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDEXTBAN').AsString) + ','
                  + '       FLGCONC=''S'' '
                  + ' Where IDCONC=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDCONC').AsString)
                  + '   and IDMOVCONT=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDMOVCONT').AsString);
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

            xSQL := 'Update CNT_CONC_EXTR_BAN '
                  + '   Set IDMOVCONT=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDMOVCONT').AsString) + ','
                  + '       FLGCONC=''S'' '
                  + ' Where IDCONC=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDCONC').AsString)
                  + '   and IDEXTBAN=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDEXTBAN').AsString);
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

            DMCNT.cdsQry4.Next;
         // Inicio HPC_201502_CNT
            pbEstado.Position := pbEstado.Position +1;
         // Fin HPC_201502_CNT
         End;

      // 2DA CONCILIACION DNI+MONTO+FECHA - NO IMPORTA NRO DE OPERACION
      // Inicio HPC_201502_CNT
         xSQL := 'Select A.NUMOPERA, B.NUMOPERA, A.CNTFEMIS, B.FECEMISION, A.IDCONC, B.IDEXTBAN, '
               + '       A.IDMOVCONT, A.DNI, B.DNI, A.IMPORTE, B.IMPORTE '
               + '  from CNT_CONC_MOV_CONT A, CNT_CONC_EXTR_BAN B '
               + ' where A.CNTFEMIS=B.FECEMISION '
               + '   and B.IDCONC ='''+DMCNT.cdsMovCNT1.FieldByName('IDCONC').AsString+''' '
               + '   and A.IDCONC=B.IDCONC '
               + '   and A.DNI=B.DNI '
               + '   and A.IMPORTE=(CASE WHEN B.IMPORTE<0 THEN B.IMPORTE*-1 ELSE B.IMPORTE END ) ' //AND B.FLGCONC IS NULL ';
               + '   and nvl(B.FLGCONC,''N'') <> ''S'' ';
         DMCNT.cdsQry4.Close;
         DMCNT.cdsQry4.DataRequest(xSQL);
         DMCNT.cdsQry4.Open;
         DMCNT.cdsQry4.First;
         pbEstado.Min:=0;
         pbEstado.Max:=DMCNT.cdsQry4.RecordCount;
         pbEstado.Position := 0;
      // Fin HPC_201502_CNT
         While Not DMCNT.cdsQry4.Eof Do
         Begin
            xSQL := 'Update CNT_CONC_MOV_CONT '
                  + '   Set IDEXTBAN=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDEXTBAN').AsString) + ','
                  + '       FLGCONC=''S'' '
                  + ' Where IDCONC=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDCONC').AsString)
                  + '   and IDMOVCONT=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDMOVCONT').AsString);
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

            xSQL := 'Update CNT_CONC_EXTR_BAN '
                  + '   Set IDMOVCONT=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDMOVCONT').AsString) + ','
                  + '       FLGCONC=''S'' '
                  + ' Where IDCONC=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDCONC').AsString)
                  + '   and IDEXTBAN=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDEXTBAN').AsString);
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

            DMCNT.cdsQry4.Next;
         // Inicio HPC_201502_CNT
            pbEstado.Position := pbEstado.Position +1;
         // Fin HPC_201502_CNT
         End;

      // Inicio HPC_201502_CNT
      // 3ra DA CONCILIACION NUM OPERACION+MONTO+FECHA - NO IMPORTA NRO DE OPERACION
         xSQL := 'Select A.NUMOPERA, B.NUMOPERA, A.CNTFEMIS, B.FECEMISION, A.IDCONC, B.IDEXTBAN, '
               + '       A.IDMOVCONT, A.DNI, B.DNI, A.IMPORTE, B.IMPORTE '
               + '  from CNT_CONC_MOV_CONT A, CNT_CONC_EXTR_BAN B '
               + ' where A.CNTFEMIS=B.FECEMISION '
               + '   and B.IDCONC ='''+DMCNT.cdsMovCNT1.FieldByName('IDCONC').AsString+''' '
               + '   and A.IDCONC=B.IDCONC '
               + '   and substr(A.NUMOPERA,-6)=substr(B.NUMOPERA,-6) '
               + '   and A.IMPORTE=(CASE WHEN B.IMPORTE<0 THEN B.IMPORTE*-1 ELSE B.IMPORTE END )  ' //AND B.FLGCONC IS NULL ';
               + '   and nvl(B.FLGCONC,''N'') <> ''S'' ';
         DMCNT.cdsQry4.Close;
         DMCNT.cdsQry4.DataRequest(xSQL);
         DMCNT.cdsQry4.Open;
         DMCNT.cdsQry4.First;
         pbEstado.Min:=0;
         pbEstado.Max:=DMCNT.cdsQry4.RecordCount;
         pbEstado.Position := 0;
         While Not DMCNT.cdsQry4.Eof Do
         Begin
            xSQL := 'Update CNT_CONC_MOV_CONT '
                  + '   Set IDEXTBAN=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDEXTBAN').AsString) + ','
                  + '       FLGCONC=''S'' '
                  + ' Where IDCONC=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDCONC').AsString)
                  + '   and IDMOVCONT=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDMOVCONT').AsString);
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

            xSQL := 'Update CNT_CONC_EXTR_BAN '
                  + '   Set IDMOVCONT=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDMOVCONT').AsString) + ','
                  + '       FLGCONC=''S'' '
                  + ' Where IDCONC=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDCONC').AsString)
                  + '   and IDEXTBAN=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDEXTBAN').AsString);
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

            DMCNT.cdsQry4.Next;
            pbEstado.Position := pbEstado.Position +1;
         End;

      // 4ta  CONCILIACION NUM REFERENCIA+MONTO+FECHA
         xSQL := 'Select A.NUMOPERA, B.NUMOPERA, A.CNTFEMIS, B.FECEMISION, A.IDCONC, B.IDEXTBAN, '
               + '       A.IDMOVCONT, A.DNI, B.DNI, A.IMPORTE, B.IMPORTE '
               + '  from CNT_CONC_MOV_CONT A, CNT_CONC_EXTR_BAN B '
               + ' where A.CNTFEMIS=B.FECEMISION '
              + '   and B.IDCONC ='''+DMCNT.cdsMovCNT1.FieldByName('IDCONC').AsString+''' '
               + '   and A.IDCONC=B.IDCONC '
               + '   and substr(A.NUMOPERA,-5)=substr(B.REFERENCIA,-5) '
               + '   and A.IMPORTE=(CASE WHEN B.IMPORTE<0 THEN B.IMPORTE*-1 ELSE B.IMPORTE END )  '
               + '   and nvl(B.FLGCONC,''N'') <> ''S'' ';
         DMCNT.cdsQry4.Close;
         DMCNT.cdsQry4.DataRequest(xSQL);
         DMCNT.cdsQry4.Open;
         DMCNT.cdsQry4.First;
         pbEstado.Min:=0;
         pbEstado.Max:=DMCNT.cdsQry4.RecordCount;
         pbEstado.Position := 0;
         While Not DMCNT.cdsQry4.Eof Do
         Begin
            xSQL := 'Update CNT_CONC_MOV_CONT '
                  + '   Set IDEXTBAN=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDEXTBAN').AsString) + ','
                  + '       FLGCONC=''S'' '
                  + ' Where IDCONC=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDCONC').AsString)
                  + '   and IDMOVCONT=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDMOVCONT').AsString);
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

            xSQL := 'Update CNT_CONC_EXTR_BAN '
                  + '   Set IDMOVCONT=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDMOVCONT').AsString) + ','
                  + '       FLGCONC=''S'' '
                  + ' Where IDCONC=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDCONC').AsString)
                  + '   and IDEXTBAN=' + QuotedStr(DMCNT.cdsQry4.FieldByname('IDEXTBAN').AsString);
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

            DMCNT.cdsQry4.Next;
            pbEstado.Position := pbEstado.Position +1;
         End;
      // Fin HPC_201502_CNT

      End;

  //Refresca Informacion
      Refrescadata;
      sumaconciliados;
   // Inicio HPC_201502_CNT
      pnlEstado.Visible := False;
   // Fin HPC_201502_CNT
   End;

// Proceso Manual
   If rbConcManual.Checked Then
   Begin
   // Inicio HPC_201502_CNT
   // Try
      xWhere2 := '';
      If rbConcxOperacion.Checked Then
      Begin
         xWhere2 := ' And substr(NUMOPERA,-6)=''' + rightStr(DMCNT.cdsMovCNT1.FieldByname('NUMOPERA').AsString,6) + ''' ';
         xDatoBusqManual := ': ' + DMCNT.cdsMovCNT1.FieldByname('NUMOPERA').AsString;
      End
      Else
      Begin
         If rbConcxDNI.Checked Then
         Begin
            xWhere2 := ' And DNI=''' + DMCNT.cdsMovCNT1.FieldByname('DNI').AsString + ''' ';
            xDatoBusqManual := ': ' + DMCNT.cdsMovCNT1.FieldByname('DNI').AsString;
         End
         Else
         Begin
            If rbConcxFecha.Checked Then
            Begin
               xWhere2 := ' And CNTFEMIS=''' + DMCNT.cdsMovCNT1.FieldByname('FECEMISION').AsString + ''' ';
               xDatoBusqManual := ': ' + DateToStr(DMCNT.cdsMovCNT1.FieldByname('FECEMISION').AsDateTime);
            End

            Else
            If rbTodo.Checked Then
            Begin
               xWhere2 := '';
               xDatoBusqManual  := '';
            End;

         End;
      End;

      If DMCNT.cdsMovCNT1.FieldByname('IMPORTE').AsFloat <0 Then
         xWhere2:=xWhere2+' And CNTDH=''H'' '
      Else
         xWhere2:=xWhere2+' And CNTDH=''D'' ';

      xSQL := 'Select ''N'' FLAG, IDCONC, IDMOVCONT, IDEXTBAN, CIAID, TDIARID, CNTFEMIS, '
            + '       CNTCOMPROB, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, NUMOPERA, DNI, '
            + '       CNTDH, IMPORTE, NVL(FLGCONC,''N'')FLGCONC  '
            + '  From CNT_CONC_MOV_CONT '
            + ' Where IDCONC=' + QuotedStr(xnumconc)
            + xWhere2
            + '   and (trim(FLGCONC) is null or FLGCONC=''N'') ';
      DMCNT.cdsMovCNT2.Close;
      DMCNT.cdsMovCNT2.DataRequest(xSQL);
      DMCNT.cdsMovCNT2.Open;

      If DMCNT.cdsMovCNT2.RecordCount = 0 Then
      Begin
         ShowMessage('No existe Coincidencias en los Movimientos Contables');
         If DMCNT.cdsQry5.Active = True Then DMCNT.cdsQry5.Close;
         DMCNT.cdsQry4.Close;
         DMCNT.cdsMovCNT2.Close;
         exit;
      End;

      FConcilBancManual := TFConcilBancManual.Create(Application);

      If rbConcxOperacion.Checked Then
         FConcilBancManual.Caption := 'Búsqueda Manual por Operación ' + xDatoBusqManual
      Else
         If rbConcxDNI.Checked Then
            FConcilBancManual.Caption := 'Búsqueda Manual por DNI ' + xDatoBusqManual
         Else
            If rbConcxFecha.Checked Then
               FConcilBancManual.Caption := 'Búsqueda Manual por Fecha ' + xDatoBusqManual
            Else
               If rbTodo.Checked Then
                 FConcilBancManual.Caption := 'Búsqueda Manual por Toda la Información Contable ';


      xSQL := 'Select IDCONC, IDEXTBAN, IDMOVCONT, FECEMISION, DESCRIPCION, NUMOPERA, '
            + '       REFERENCIA, DNI, IMPORTE, NVL(FLGCONC,''N'') FLGCONC  '
            + '  From CNT_CONC_EXTR_BAN '
            + ' Where IDCONC=' + QuotedStr(xnumconc)
            + '   And IDEXTBAN=' + QuotedStr(DMCNT.cdsMovCNT1.Fieldbyname('IDEXTBAN').AsString)
            + '   And ( FLGCONC is null OR FLGCONC=''N'') ';
      DMCNT.cdsQry5.Close;
      DMCNT.cdsQry5.DataRequest(xSQL);
      DMCNT.cdsQry5.Open;

      If DMCNT.cdsQry5.RecordCount=0 then
      Begin
         ShowMessage('Registro ya esta conciliado');
         Exit;
      End;
      Try
   // Fin HPC_201502_CNT
         FConcilBancManual.dbgManualCabecera.Selected.Clear;
         FConcilBancManual.dbgManualCabecera.Selected.Add('IDEXTBAN'#9'10'#9'Id.Extrac.'#9#9);
         FConcilBancManual.dbgManualCabecera.Selected.Add('FECEMISION'#9'10'#9'Fec.Emis.'#9#9);
         FConcilBancManual.dbgManualCabecera.Selected.Add('DESCRIPCION'#9'23'#9'Descripción'#9#9);
         FConcilBancManual.dbgManualCabecera.Selected.Add('NUMOPERA'#9'10'#9'Num.Operac.'#9#9);
         FConcilBancManual.dbgManualCabecera.Selected.Add('REFERENCIA'#9'10'#9'Otro/Chq'#9#9);
         FConcilBancManual.dbgManualCabecera.Selected.Add('DNI'#9'8'#9'DNI'#9#9);
         FConcilBancManual.dbgManualCabecera.Selected.Add('IMPORTE'#9'13'#9'Importe'#9#9);
         FConcilBancManual.dbgManualCabecera.Selected.Add('FLGCONC'#9'2'#9'Conc.'#9#9);
         FConcilBancManual.dbgManualCabecera.ApplySelected;
         FConcilBancManual.dbgManualCabecera.DataSource := DMCNT.dsQry5;
         TNumericField(DMCNT.cdsQry5.FieldByName('IMPORTE')).DisplayFormat := '###,###,##0.00';

         DMCNT.cdsMovCNT2.First;
         TNumericField(DMCNT.cdsMovCNT2.FieldByName('IMPORTE')).DisplayFormat := '###,###,##0.00';

         FConcilBancManual.dbgManual.Selected.clear;
      // Inicio HPC_201502_CNT
        // FConcilBancManual.dbgManual.ControlType.Add('FLAG;CheckBox;S;N');
        // FConcilBancManual.dbgManual.Selected.Add('FLAG'#9'2'#9' ');
      // Fin HPC_201502_CNT
         FConcilBancManual.dbgManual.Selected.Add('IDMOVCONT'#9'10'#9'Id.Mov.CNT.'#9#9);
         FConcilBancManual.dbgManual.Selected.Add('CNTFEMIS'#9'10'#9'Fec.Emis.'#9#9);
         FConcilBancManual.dbgManual.Selected.Add('TDIARID'#9'02'#9'T.Diario'#9#9);
         FConcilBancManual.dbgManual.Selected.Add('CNTCOMPROB'#9'10'#9'Num.Comprob.'#9#9);
         FConcilBancManual.dbgManual.Selected.Add('NUMOPERA'#9'10'#9'N.Operac.'#9#9);
         FConcilBancManual.dbgManual.Selected.Add('DNI'#9'8'#9'DNI'#9#9);
         FConcilBancManual.dbgManual.Selected.Add('CNTDH'#9'1'#9'DH'#9#9);
         FConcilBancManual.dbgManual.Selected.Add('IMPORTE'#9'13'#9'Importe'#9#9);
         FConcilBancManual.dbgManual.Selected.Add('FLGCONC'#9'2'#9'Conc.'#9#9);
         FConcilBancManual.dbgManual.ApplySelected;
         FConcilBancManual.dbgManual.Columns[0].ReadOnly := True;
         FConcilBancManual.dbgManual.DataSource := DMCNT.dsMovCNT2;
         FConcilBancManual.lblTotal.Caption := '0';
         suma := 0;

         FConcilBancManual.ShowModal;
      Finally
         FConcilBancManual.Free;

         xNumExtr := DMCNT.cdsMovCNT1.FieldByName('IDEXTBAN').AsString;
         xNumMovCnt := DMCNT.cdsMovCNT.FieldByName('IDMOVCONT').AsString;

         Refrescadata;
         sumaconciliados;

         DMCNT.cdsMovCNT1.Locate('IDEXTBAN', VarArrayOf([xNumExtr]), []);
         DMCNT.cdsMovCNT.Locate('IDMOVCONT', VarArrayOf([xNumMovCnt]), []);

      End;
   End;
End;

Procedure TFConcBanCob.rbConcAutomaticaClick(Sender: TObject);
Begin
   If rbConcAutomatica.Checked Then
   Begin
      pnlManual.Enabled := False;
      rbConcxOperacion.Checked := False;
      rbConcxDNI.Checked := False;
      rbConcxFecha.Checked := False;
   End;
End;

Procedure TFConcBanCob.Refrescadata;
Var
   vimporte: currency;
Begin
   chkVerConciliadosClick(SELF);

// Inicio HPC_201502_CNT
   {
   dbgExtracto.Selected.Clear;
   dbgExtracto.Selected.Add('FLGCONC'#9'2'#9'Conc.'#9#9);
   dbgExtracto.Selected.Add('DNI'#9'8'#9'DNI'#9#9);
   dbgExtracto.Selected.Add('FECEMISION'#9'10'#9'Fec.Emis.'#9#9);
   dbgExtracto.Selected.Add('IMPORTE'#9'13'#9'Importe'#9#9);
   dbgExtracto.Selected.Add('DESCRIPCION'#9'23'#9'Descripción'#9#9);
   dbgExtracto.Selected.Add('NUMOPERA'#9'10'#9'Num.Operac.'#9#9);
   dbgExtracto.Selected.Add('IDEXTBAN'#9'10'#9'Id.Extrac.'#9#9);
   dbgExtracto.Selected.Add('REFERENCIA'#9'10'#9'Otro/Chq'#9#9);
   dbgExtracto.ControlType.Add('FLAG;CheckBox;S;N');
   dbgExtracto.Selected.Add('FLAG'#9'2'#9' ');
   dbgExtracto.Selected.Add('NUMCOMPROB'#9'10'#9'Comprobante.'#9#9);
   dbgExtracto.Selected.Add('CODDIARIO'#9'02'#9'Diario.'#9#9);
   dbgExtracto.Selected.Add('PERANOMM'#9'06'#9'Periodo.'#9#9);
   dbgExtracto.ApplySelected;
   dbgExtracto.Columns[0].ReadOnly := True;

   dbgMovCont.Selected.Clear;
   dbgMovCont.Selected.Add('FLGCONC'#9'2'#9'Conc.'#9#9);
   dbgMovCont.Selected.Add('DNI'#9'8'#9'DNI'#9#9);
   dbgMovCont.Selected.Add('CNTFEMIS'#9'10'#9'Fec.Emis.'#9#9);
   dbgMovCont.Selected.Add('IMPORTE'#9'13'#9'Importe'#9#9);
   dbgMovCont.Selected.Add('CNTDH'#9'1'#9'DH'#9#9);
   dbgMovCont.Selected.Add('NUMOPERA'#9'10'#9'N.Operac.'#9#9);
   dbgMovCont.Selected.Add('IDMOVCONT'#9'10'#9'Id.Mov.CNT.'#9#9);
   dbgMovCont.Selected.Add('TDIARID'#9'02'#9'T.Diario'#9#9);
   dbgMovCont.Selected.Add('CNTCOMPROB'#9'10'#9'Num.Comprob.'#9#9);
   dbgMovCont.ApplySelected;
   }
// Fin HPC_201502_CNT


  //Refresca Informacion
   DMCNT.cdsMovCNT1.DisableControls;
// Inicio HPC_201502_CNT
   xSQL := 'Select ''N'' FLAG, IDCONC, IDEXTBAN, IDMOVCONT, FECEMISION, DESCRIPCION, '
         + '       NUMOPERA, REFERENCIA, DNI, IMPORTE, NVL(FLGCONC,''N'')FLGCONC, NUMCOMPROB, CODDIARIO, '
//       + '       PERANOMM,'
         + '       PERANOMM, 0 IMPCONTAB '
         + '  From CNT_CONC_EXTR_BAN '
         + ' Where IDCONC=' + QuotedStr(xnumconc)
         + xfiltro;
// Fin HPC_201502_CNT
   DMCNT.cdsMovCNT1.Close;
   DMCNT.cdsMovCNT1.DataRequest(xSQL);
   DMCNT.cdsMovCNT1.Open;
   TNumericField(DMCNT.cdsMovCNT1.FieldByName('IMPORTE')).DisplayFormat := '###,###,##0.00';

  //Actualiza footer
// Inicio HPC_201502_CNT
   vimporte:=0;
// Fin HPC_201502_CNT
   DMCNT.cdsMovCNT1.First;
   While Not DMCNT.cdsMovCNT1.Eof Do
   Begin
      vimporte := vimporte + DMCNT.cdsMovCNT1.FieldByname('IMPORTE').AsCurrency;
      DMCNT.cdsMovCNT1.Next
   End;
   TNumericField(DMCNT.cdsMovCNT1.FieldByName('IMPORTE')).DisplayFormat := '###,###,##0.00';
   dbgExtracto.ColumnByName('IMPORTE').FooterValue := FloatTostrf(vimporte, ffnumber, 15, 2);
   dbgExtracto.Refresh;
   DMCNT.cdsMovCNT1.EnableControls;

   DMCNT.cdsMovCNT.DisableControls;
// Inicio HPC_201502_CNT
   xSQL := 'Select IDCONC, IDMOVCONT, IDEXTBAN, CIAID, TDIARID, CNTFEMIS, CNTCOMPROB, '
         + '       CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, NUMOPERA, DNI, CNTDH, '
  //     + '       IMPORTE, FLGCONC '
         + '       IMPORTE, NVL(FLGCONC,''N'')FLGCONC '
         + '  From CNT_CONC_MOV_CONT '
         + ' Where IDCONC=' + QuotedStr(xnumconc)
         + xfiltro;
// Fin HPC_201502_CNT
   DMCNT.cdsMovCNT.Close;
   DMCNT.cdsMovCNT.DataRequest(xSQL);
   DMCNT.cdsMovCNT.Open;
   TNumericField(DMCNT.cdsMovCNT.FieldByName('IMPORTE')).DisplayFormat := '###,###,##0.00';
// Inicio HPC_201502_CNT
   // dbsAnoCNT.Text := copy(DMCNT.cdsMovCNT.FieldByname('CNTANOMM').AsString,1,4);
   // dbsMEsCNT.Text := copy(DMCNT.cdsMovCNT.FieldByname('CNTANOMM').AsString,5,2);
// Fin HPC_201502_CNT
   DMCNT.cdsMovCNT.First;
   vimporte := 0;
   While Not DMCNT.cdsMovCNT.Eof Do
   Begin
   // Inicio HPC_201502_CNT
      If DMCNT.cdsMovCNT.FieldByname('CNTDH').AsString='D' Then
         vimporte := vimporte + DMCNT.cdsMovCNT.FieldByname('IMPORTE').AsCurrency
      Else
        vimporte := vimporte - DMCNT.cdsMovCNT.FieldByname('IMPORTE').AsCurrency;
   // Final HPC_201502_CNT
      DMCNT.cdsMovCNT.Next
   End;
   TNumericField(DMCNT.cdsMovCNT.FieldByName('IMPORTE')).DisplayFormat := '###,###,##0.00';
   dbgMovCont.ColumnByName('IMPORTE').FooterValue := FloatTostrf(vimporte, ffnumber, 15, 2);
   dbgMovCont.Refresh;
   DMCNT.cdsMovCNT.EnableControls;

   dbgMovCont.DataSource := DMCNT.dsMovCNT;
   dbgExtracto.DataSource := DMCNT.dsMovCNT1;
End;

Procedure TFConcBanCob.dbgMovContCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
Begin
   If DMCNT.cdsMovCNT.FieldByName('FLGCONC').AsString = 'S' Then
   Begin
      AFont.Color := clBlack;
      ABrush.Color := $006AFFFF; //$00C1FFFF;
   End;
End;

Procedure TFConcBanCob.dbgMovContTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
// Inicio HPC_201502_CNT
   edtBusca.DataSource := DMCNT.dsMovCNT;

   If AFieldName = 'CNTFEMIS' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT.IndexFieldNames := 'CNTFEMIS';
      Screen.Cursor := crDefault;
      edtBusca.SearchField := 'CNTFEMIS';
      Buscar;
      grbBusqueda.Caption := 'F.Emisión';
   End;

   If AFieldName = 'NUMOPERA' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT.IndexFieldNames := 'NUMOPERA';
      Screen.Cursor := crDefault;
      edtBusca.SearchField := 'NUMOPERA';
      Buscar;
      grbBusqueda.Caption := 'N.Operación';
   End;

   If AFieldName = 'DNI' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT.IndexFieldNames := 'DNI';
      Screen.Cursor := crDefault;
      edtBusca.SearchField := 'DNI';
      Buscar;
      grbBusqueda.Caption := 'Dni';
   End;

   If AFieldName = 'IMPORTE' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT.IndexFieldNames := 'IMPORTE';
      Screen.Cursor := crDefault;
      edtBusca.SearchField := 'IMPORTE';
      Buscar;
      grbBusqueda.Caption := 'Importe';
   End;

   If AFieldName = 'FLGCONC' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT.IndexFieldNames := 'FLGCONC';
      Screen.Cursor := crDefault;
   End;

   If AFieldName = 'IDMOVCONT' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT.IndexFieldNames := 'IDMOVCONT';
      Screen.Cursor := crDefault;
      edtBusca.SearchField := 'IDMOVCONT';
      Buscar;
      grbBusqueda.Caption := 'M.Contable';
   End;

   If AFieldName = 'TDIARID' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT.IndexFieldNames := 'TDIARID';
      Screen.Cursor := crDefault;
      edtBusca.SearchField := 'TDIARID';
      Buscar;
      grbBusqueda.Caption := 'T.Diario';
   End;

   If AFieldName = 'CNTCOMPROB' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT.IndexFieldNames := 'CNTCOMPROB';
      Screen.Cursor := crDefault;
      edtBusca.SearchField := 'CNTCOMPROB';
      Buscar;
      grbBusqueda.Caption := 'N.Comprob.';
   End;
// Fin HPC_201502_CNT
End;

Procedure TFConcBanCob.dbgMovContDblClick(Sender: TObject);
Var
   sumafoot: currency;
Begin
   Try
      FConcilDetExtrBanc := TFConcilDetExtrBanc.Create(Application);
      FConcilDetExtrBanc.Caption := 'Extracto Bancario Conciliado';

   // Inicio HPC_201502_CNT
      xSQL := 'Select IDCONC, IDEXTBAN, IDMOVCONT, FECEMISION, DESCRIPCION, NUMOPERA, '
            + '       REFERENCIA, DNI, IMPORTE, NVL(FLGCONC,''N'')FLGCONC '
            + '  From CNT_CONC_EXTR_BAN '
            + ' Where IDCONC=' + QuotedStr(xnumconc)
            + '   and IDEXTBAN=' + QuotedStr(DMCNT.cdsMovCNT.FieldByname('IDEXTBAN').AsString);
//            + '   and IDMOVCNT=' + QuotedStr(DMCNT.cdsMovCNT.FieldByname('IDMOVCNT').AsString);
   // Fin HPC_201502_CNT
      DMCNT.cdsQry3.Close;
      DMCNT.cdsQry3.DataRequest(xSQL);
      DMCNT.cdsQry3.Open;

   // Inicio HPC_201502_CNT
      If DMCNT.cdsQry3.RecordCount > 0 Then
         DMCNT.cdsMovCNT1.Locate('IDMOVCONT', VarArrayOf([DMCNT.cdsMovCNT.FieldByname('IDMOVCONT').AsString]), [])
      Else
      Begin
         ShowMessage('Movimiento Contable no Conciliado');
         Exit;
      End;
   // Fin HPC_201502_CNT
      FConcilDetExtrBanc.dbgConsulta1.DataSource := DMCNT.dsQry3;

      FConcilDetExtrBanc.dbgConsulta1.Selected.Clear;
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('IDEXTBAN'#9'10'#9'Id.Extrac.'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('FECEMISION'#9'10'#9'Fec.Emis.'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('DESCRIPCION'#9'23'#9'Descripción'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('NUMOPERA'#9'10'#9'Num.Operac.'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('REFERENCIA'#9'10'#9'Otro/Chq'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('DNI'#9'8'#9'DNI'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('IMPORTE'#9'13'#9'Importe'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('FLGCONC'#9'2'#9'Conc.'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.ApplySelected;

      sumafoot := 0.00;
      DMCNT.cdsQry3.First;
      While Not DMCNT.cdsQry3.Eof Do
      Begin
         sumafoot := sumafoot + DMCNT.cdsQry3.FieldByname('IMPORTE').AsCurrency;
         DMCNT.cdsQry3.Next;
      End;
      TNumericField(DMCNT.cdsQry3.FieldByName('IMPORTE')).DisplayFormat := '###,###,##0.00';
      FConcilDetExtrBanc.dbgConsulta1.ColumnByName('IMPORTE').FooterValue := FloatTostrf(sumafoot, ffnumber, 15, 2);
      FConcilDetExtrBanc.dbgConsulta1.Refresh;

      If DMCNT.cdsMovCNT.FieldByName('FLGCONC').AsString = 'S' Then
         FConcilDetExtrBanc.Caption := 'Extracto Bancario Conciliado'
      Else
         FConcilDetExtrBanc.Caption := 'Extracto Bancario No Conciliado';

      FConcilDetExtrBanc.ShowModal;
   Finally
      FConcilDetExtrBanc.Free;
   End;
End;

Procedure TFConcBanCob.rbConcManualClick(Sender: TObject);
Begin
   If rbConcManual.Checked Then
   Begin
      pnlManual.Enabled := True;
   // Inicio HPc_201502_CNT
      rbTodo.Checked := True;
      {
      rbConcxDNI.Checked := True;
      DMCNT.cdsMovCNT1.IndexFieldNames := 'DNI';
      DMCNT.cdsMovCNT1.First;
      DMCNT.cdsMovCNT.IndexFieldNames := 'DNI';
      DMCNT.cdsMovCNT.First;
      }
   // Fin HPc_201502_CNT      
   End;
End;

Procedure TFConcBanCob.sumaconciliados;
Begin
   xSQL := ' Select sum(nvl(CONCILIADO,0)) CONCILIADO, '
         + '        sum(nvl(NOCONCILIADO,0)) NOCONCILIADO '
         + ' From (Select case When nvl(FLGCONC,''N'')=''S'' Then 1 end CONCILIADO,'
         + '              case When nvl(FLGCONC,''N'')=''N'' Then 1 end NOCONCILIADO '
         + '         From CNT_CONC_EXTR_BAN '
         + '        Where IDCONC=' + QuotedStr(xnumconc) + ')';
   DMCNT.cdsClAux.Close;
   DMCNT.cdsClAux.DataRequest(xSQL);
   DMCNT.cdsClAux.Open;
   lblconciliados.Caption := DMCNT.cdsClAux.Fieldbyname('CONCILIADO').AsString;
   lblnoconciliados.Caption := DMCNT.cdsClAux.Fieldbyname('NOCONCILIADO').AsString;
End;

Procedure TFConcBanCob.bbtnNuevoClick(Sender: TObject);
Begin
   Nuevo;
End;

Procedure TFConcBanCob.Nuevo;
Begin
  //Año mes actual
   xSQL := 'Select to_char(SysDate,''YYYY'') VANO, to_char(SysDate,''MM'') VMES From DUAL ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   dbsAno.Text := DMCNT.cdsQry.Fieldbyname('VANO').AsString;
   dbsMes.Text := DMCNT.cdsQry.Fieldbyname('VMES').AsString;
// Inicio HPC_201502_CNT
   dbsMEsCNT.Text := DMCNT.cdsQry.Fieldbyname('VMES').AsString;
   dbsAnoCNT.Text := DMCNT.cdsQry.Fieldbyname('VANO').AsString;
// Fin HPC_201502_CNT
   grbConciliacionBancaria.Enabled := True;
   grbConciliacionBancaria.Color := clBtnFace;
   dblcCia.Text := '';
   edtCiaid.Text := '';
// Inicio HPC_201502_CNT
//  dbsAno.Text := '2015';
//  dbsMEs.Text := '01';
   edtNumConciliacion.Text :='';
   dbgMovCont.ColumnByName('IMPORTE').FooterValue := '0.00';
   dbgExtracto.ColumnByName('IMPORTE').FooterValue := '0.00';
   grbEXtracto.Enabled := False;
   grbMovCont.Enabled  := False;
// Fin HPC_201502_CNT
   dblcBanco.Text := '';
   edtBancoid.Text := '';
   dblcCCBcoid.Text := '';
   edtCCBcoid.Text := '';
   edtRutaArchivo.Text := '';
   dblcTDiario.Text := '';
   edtTdiario.Text := '';
   dblcdCuenta.Text := '';
   edtCuenta.Text := '';
// Inicio HPC_201502_CNT
   edtSaldoBanco.Text := '0';
// Fin HPC_201502_CNT
   DMCNT.cdsMovCNT.EmptyDataSet;
   DMCNT.cdsMovCNT1.EmptyDataSet;
   lblconciliados.Caption := '0';
   lblnoconciliados.Caption := '0';
   pnlManual.Enabled := False;
   rbConcAutomatica.Checked := True;
   rbConcxOperacion.Checked := False;
   rbConcxDNI.Checked := False;
   rbConcxFecha.Checked := False;
   chkAgrupado.Checked := False;
End;

Procedure TFConcBanCob.rbContabiliza1Click(Sender: TObject);
Begin
   If rbContabiliza1.Checked Then
   Begin
      lblporPrefijo.Enabled := True;
      edtPrefijo.Enabled := True;
      ingChk.Enabled := True;
      spbMarca.Enabled := True;
   // Inicio HPC_201502_CNT
      spbDesMarca.Enabled := True;
   // Fin HPC_201502_CNT
   End;
End;

Procedure TFConcBanCob.rbContabiliza2Click(Sender: TObject);
Begin
   lblporPrefijo.Enabled := False;
   edtPrefijo.Enabled := False;
   ingChk.Enabled := False;
   spbMarca.Enabled := False;
End;

Procedure TFConcBanCob.bbtnContabilizaClick(Sender: TObject);
Var
   vcuenta: integer;
   B: TBookmark;
Begin
   If Not VerificaPeriodo Then
      exit;

   If (DMCNT.cdsMovCNT.RecordCount = 0) Or (DMCNT.cdsMovCNT1.RecordCount = 0) Then
   Begin
      ShowMessage('Primero debe Generar información de EXTRACTO BANCARIO y MOVIMIENTO CONTABLE A CONCILIAR');
      exit;
   End;

// Actualiza Archivo de extracto bancario
   B := DMCNT.cdsMovCNT1.GetBookmark;
   DMCNT.cdsMovCNT1.DisableControls;
   DMCNT.cdsMovCNT1.First;
   vcuenta := 0;
   While Not DMCNT.cdsMovCNT1.Eof Do
   Begin
      If DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString = 'S' Then
      Begin
         vcuenta := vcuenta + 1
      End;
      DMCNT.cdsMovCNT1.Next;
   End;
   If vcuenta = 0 Then
   Begin
      ShowMessage('No tiene algún registro marcado');
      DMCNT.cdsMovCNT1.GotoBookmark(B);
      DMCNT.cdsMovCNT1.FreeBookmark(B);
      DMCNT.cdsMovCNT1.EnableControls;
      exit;
   End;
   DMCNT.cdsMovCNT1.GotoBookmark(B);
   DMCNT.cdsMovCNT1.FreeBookmark(B);
   DMCNT.cdsMovCNT1.EnableControls;

   Try
      FConcilBancContab := TFConcilBancContab.Create(Application);
      FConcilBancContab.lblccosto1.Enabled := False;
      FConcilBancContab.edtCCosto1.Enabled := False;
      FConcilBancContab.lblccosto2.Enabled := False;
      FConcilBancContab.edtCCosto2.Enabled := False;
      FConcilBancContab.dblcTDIARID2.LookupTable := DMCNT.cdsTipCta;
      FConcilBancContab.dblcTDIARID2.LookupField := 'TDIARID';
      FConcilBancContab.ShowModal;
   Finally
      FConcilBancContab.Free;
   End;
End;

Procedure TFConcBanCob.dbgExtractoCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
Begin
   If DMCNT.cdsMovCNT1.FieldByName('FLGCONC').AsString = 'S' Then
   Begin
      AFont.Color := clBlack;
      ABrush.Color := $006AFFFF; //$00C1FFFF;
   End;
End;

Procedure TFConcBanCob.dbgExtractoDblClick(Sender: TObject);
Var
   sumafoot: currency;
Begin
// Inicio HPC_201502_CNT
   dbgExtracto.Columns[0].ReadOnly  := True;
   dbgExtracto.Columns[1].ReadOnly  := True;
   dbgExtracto.Columns[2].ReadOnly  := True;
   dbgExtracto.Columns[3].ReadOnly  := True;
   dbgExtracto.Columns[4].ReadOnly  := True;
   dbgExtracto.Columns[5].ReadOnly  := True;
   dbgExtracto.Columns[6].ReadOnly  := True;
   dbgExtracto.Columns[7].ReadOnly  := True;
   dbgExtracto.Columns[9].ReadOnly  := True;
   dbgExtracto.Columns[10].ReadOnly := True;
   dbgExtracto.Columns[11].ReadOnly := True;
   dbgExtracto.Columns[12].ReadOnly := True;
// Fin HPC_201502_CNT
   Try
      FConcilDetExtrBanc := TFConcilDetExtrBanc.Create(Application);
      FConcilDetExtrBanc.Caption := 'Movimiento Contable Conciliado';
      xSQL := 'Select IDMOVCONT, CIAID, TDIARID, CNTFEMIS, CNTCOMPROB, CNTANOMM, CNTLOTE, '
            + '       CUENTAID, CLAUXID, AUXID, NUMOPERA, DNI, CNTDH, IMPORTE, FLGCONC '
            + '  From CNT_CONC_MOV_CONT '
            + ' Where IDCONC=' + QuotedStr(xnumconc)
            + '   and IDEXTBAN=' + QuotedStr(DMCNT.cdsMovCNT1.FieldByname('IDEXTBAN').AsString);
      DMCNT.cdsQry3.Close;
      DMCNT.cdsQry3.DataRequest(xSQL);
      DMCNT.cdsQry3.Open;

   // Inicio HPC_201502_CNT
      If DMCNT.cdsQry3.RecordCount > 0 Then
         DMCNT.cdsMovCNT.Locate('IDEXTBAN', VarArrayOf([DMCNT.cdsMovCNT1.FieldByname('IDEXTBAN').AsString]), [])
      Else
      Begin
       ShowMessage('Movimiento Contable no Conciliado');
       Exit;
      End;
   // Fin HPC_201502_CNT

      FConcilDetExtrBanc.dbgConsulta1.DataSource := DMCNT.dsQry3;

      FConcilDetExtrBanc.dbgConsulta1.Selected.Clear;
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('IDMOVCONT'#9'10'#9'Id.Mov.CNT.'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('CNTFEMIS'#9'10'#9'Fec.Emis.'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('TDIARID'#9'02'#9'T.Diario'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('CNTCOMPROB'#9'10'#9'Num.Comprob.'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('NUMOPERA'#9'10'#9'N.Operac.'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('DNI'#9'8'#9'DNI'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('CNTDH'#9'1'#9'DH'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('IMPORTE'#9'13'#9'Importe'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.Selected.Add('FLGCONC'#9'2'#9'Conc.'#9#9);
      FConcilDetExtrBanc.dbgConsulta1.ApplySelected;
      sumafoot := 0.00;
      DMCNT.cdsQry3.First;
      While Not DMCNT.cdsQry3.Eof Do
      Begin
         sumafoot := sumafoot + DMCNT.cdsQry3.FieldByname('IMPORTE').AsCurrency;
         DMCNT.cdsQry3.Next;
      End;

      TNumericField(DMCNT.cdsQry3.FieldByName('IMPORTE')).DisplayFormat := '###,###,##0.00';
      FConcilDetExtrBanc.dbgConsulta1.ColumnByName('IMPORTE').FooterValue := FloatTostrf(sumafoot, ffnumber, 15, 2);

      If DMCNT.cdsMovCNT1.FieldByname('FLGCONC').AsString = 'S' Then
         FConcilDetExtrBanc.Caption := 'Movimiento Contable Conciliado'
      Else
      Begin
         If DMCNT.cdsMovCNT1.FieldByname('FLGCONC').AsString = 'C' Then
            FConcilDetExtrBanc.Caption := 'Movimiento Contable Conciliado y Contabilizado'
         Else
         Begin
            DMCNT.cdsMovCNT1.Edit;
            If DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString = 'S' Then
            Begin
               DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString := 'N';
            End
            Else
            Begin
               DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString := 'S';
            End;
         End;
      End;
      FConcilDetExtrBanc.ShowModal;
   Finally
      FConcilDetExtrBanc.Free;
   End;
End;

Procedure TFConcBanCob.dbgExtractoTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
// Inicio HPC_201502_CNT
   edtBusca.DataSource := DMCNT.dsMovCNT1;
   If AFieldName = 'FECEMISION' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT1.IndexFieldNames := 'FECEMISION';
      Screen.Cursor := crDefault;
      edtBusca.SearchField := 'FECEMISION';
      Buscar;
      grbBusqueda.Caption := 'F.Emisión';
   End;

   If AFieldName = 'NUMOPERA' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT1.IndexFieldNames := 'NUMOPERA';
      Screen.Cursor := crDefault;
      edtBusca.SearchField := 'NUMOPERA';
      Buscar;
      grbBusqueda.Caption := 'N.Operación';
   End;

   If AFieldName = 'DESCRIPCION' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT1.IndexFieldNames := 'DESCRIPCION';
      Screen.Cursor := crDefault;
      edtBusca.SearchField := 'DESCRIPCION';
      Buscar;
      grbBusqueda.Caption := 'Descripción';
   End;

   If AFieldName = 'FLAG' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT1.IndexFieldNames := 'FLAG';
      Screen.Cursor := crDefault;
   End;

   If AFieldName = 'DNI' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT1.IndexFieldNames := 'DNI';
      Screen.Cursor := crDefault;
      edtBusca.SearchField := 'DNI';
      Buscar;
      grbBusqueda.Caption := 'Dni';
   End;

   If AFieldName = 'IMPORTE' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT1.IndexFieldNames := 'IMPORTE';
      Screen.Cursor := crDefault;
      edtBusca.SearchField := 'IMPORTE';
      Buscar;
      grbBusqueda.Caption := 'Importe';
   End;

   If AFieldName = 'FLGCONC' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT1.IndexFieldNames := 'FLGCONC';
      Screen.Cursor := crDefault;
   End;

   If AFieldName = 'NUMCOMPROB' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT1.IndexFieldNames := 'NUMCOMPROB';
      Screen.Cursor := crDefault;
      edtBusca.SearchField := 'NUMCOMPROB';
      Buscar;
      grbBusqueda.Caption := 'N.Comprob.';
   End;

   If AFieldName = 'REFERENCIA' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT1.IndexFieldNames := 'REFERENCIA';
      Screen.Cursor := crDefault;
      edtBusca.SearchField := 'REFERENCIA';
      Buscar;
      grbBusqueda.Caption := 'Otro/Cheque.';
   End;
// Fin HPC_201502_CNT
End;

Procedure TFConcBanCob.chkVerConciliadosClick(Sender: TObject);
Begin
   pclick;
End;

Procedure TFConcBanCob.pclick;
Var
   xFiltro0: String;
Begin

   xFiltro0 := '  AND NVL(FLGCONC,''N'') IN (';

   If (chkVerConciliados.Checked) And (Not ChkVerNoConciliados.Checked) Then
      xFiltro := '''S''';

   If (chkVerConciliados.Checked) And (ChkVerNoConciliados.Checked) Then
      xFiltro := '''S'',''N''';

   If (Not chkVerConciliados.Checked) And (Not ChkVerNoConciliados.Checked) Then
      xFiltro := '''Z''';

   If (Not chkVerConciliados.Checked) And (ChkVerNoConciliados.Checked) Then
      xFiltro := '''N''';

   If ChkVerContabilizados.Checked Then
      xfiltro := xfiltro + ',''C''';

   xFiltro := xFiltro0 + xFiltro + ')';
End;

Procedure TFConcBanCob.chkVerNoConciliadosClick(Sender: TObject);
Begin
   pclick;
End;

Procedure TFConcBanCob.chkVerContabilizadosClick(Sender: TObject);
Begin
   pclick;
End;

Procedure TFConcBanCob.bbtnRefrescaClick(Sender: TObject);
Begin
   Refrescadata;
End;

Function TFConcBanCob.BuscaCadena(vCadena: String): boolean;
Var
   vdato: String;
   nCadena, I: Integer;

Begin
   nCadena := Length(Trim(vCAdena));
   vdato := TRIM(DMCNT.cdsMovCNT1.Fieldbyname('DESCRIPCION').AsString);
   Result := False;
   For I := 1 To Length(TRIM(DMCNT.cdsMovCNT1.Fieldbyname('DESCRIPCION').AsString)) Do
   Begin
      If Copy(DMCNT.cdsMovCNT1.Fieldbyname('DESCRIPCION').AsString, I, nCadena) = Trim(vCadena) Then
      Begin
         Result := True;
         Exit;
      End;
   End;
End;

Procedure TFConcBanCob.btndesmarcaextbanClick(Sender: TObject);
Var
   B: TBookmark;
Begin
   B := DMCNT.cdsMovCNT1.GetBookmark;
   DMCNT.cdsMovCNT1.DisableControls;
   DMCNT.cdsMovCNT1.First;
   While Not DMCNT.cdsMovCNT1.Eof Do
   Begin
      DMCNT.cdsMovCNT1.Edit;
      DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString := '';
      DMCNT.cdsMovCNT1.Next;
   End;
   DMCNT.cdsMovCNT1.GotoBookmark(B);
   DMCNT.cdsMovCNT1.FreeBookmark(B);
   DMCNT.cdsMovCNT1.EnableControls;
End;

Procedure TFConcBanCob.spbMarcaClick(Sender: TObject);
Var
   B: TBookmark;
Begin

// Inicio HPC_201502_CNT
   vSemaforo1:='0';
// Fin HPC_201502_CNT
   B := DMCNT.cdsMovCNT1.GetBookmark;
   DMCNT.cdsMovCNT1.DisableControls;
   DMCNT.cdsMovCNT1.First;
   While Not DMCNT.cdsMovCNT1.Eof Do
   Begin
   // Inicio HPC_201502_CNT
      If (Length(Trim(DMCNT.cdsMovCNT1.FieldByName('FLGCONC').AsString)) = 0)  or
         (DMCNT.cdsMovCNT1.FieldByName('FLGCONC').AsString='N') Then
   // Fin HPC_201502_CNT
      Begin
         If BuscaCadena(trim(edtPrefijo.Text)) Then
         Begin
            DMCNT.cdsMovCNT1.Edit;
            DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString := 'S';
         // Inicio  HPC_201502_CNT
            DMCNT.cdsMovCNT1.FieldByName('IMPCONTAB').AsFloat := DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsFloat;
         // Fin  HPC_201502_CNT
         End;
      End;
      DMCNT.cdsMovCNT1.Next;
   End;

   DMCNT.cdsMovCNT1.GotoBookmark(B);
   DMCNT.cdsMovCNT1.FreeBookmark(B);
   DMCNT.cdsMovCNT1.EnableControls;
// Inicio HPC_201502_CNT
   SumaImpoContab;
   vSemaforo1:='1';
 // Fin HPC_201502_CNT
End;

Procedure TFConcBanCob.bbtnEliminaConcClick(Sender: TObject);
Var
   vsinConciliar: Integer;
Begin
 //Eliminar conciliacion
 //Primero Verifica en la contabilidad
   DMCNT.cdsMovCNT1.First;
   vsinConciliar := 0;
   While Not DMCNT.cdsMovCNT1.eof Do
   Begin
      If DMCNT.cdsMovCNT1.FieldByName('FLGCONC').AsString = 'C' Then
      Begin
         xSQL := 'Select CIAID, TDIARID, CNTANOMM, CNTCOMPROB '
            + '  from CNT300 '
            + ' where CIAID=''02'' '
            + '   and TDIARID=' + quotedstr(DMCNT.cdsMovCNT1.Fieldbyname('CODDIARIO').Asstring)
            + '   and CNTANOMM=' + quotedstr(DMCNT.cdsMovCNT1.Fieldbyname('PERANOMM').Asstring)
            + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsMovCNT1.Fieldbyname('NUMCOMPROB').Asstring);
         DMCNT.cdsQry.Close;
         DMCNT.cdsQry.DataRequest(xSQL);
         DMCNT.cdsQry.Open;
         If DMCNT.cdsQry.RecordCount > 0 Then vsinConciliar := vsinConciliar + 1;
      End;
      DMCNT.cdsMovCNT1.Next;
   End;

   If vsinConciliar > 0 Then
   Begin
//   ** ojo me quedo aqui de verificar si esta contabilizado antes de eliminar
   End;
End;

Procedure TFConcBanCob.rbConcxDNIClick(Sender: TObject);
Begin
   DMCNT.cdsMovCNT1.IndexFieldNames := 'DNI';
   DMCNT.cdsMovCNT1.First;
   DMCNT.cdsMovCNT.IndexFieldNames := 'DNI';
   DMCNT.cdsMovCNT.First;
End;

Procedure TFConcBanCob.rbConcxOperacionClick(Sender: TObject);
Begin
   DMCNT.cdsMovCNT1.IndexFieldNames := 'NUMOPERA';
   DMCNT.cdsMovCNT1.First;
   DMCNT.cdsMovCNT.IndexFieldNames := 'NUMOPERA';
   DMCNT.cdsMovCNT.First;
End;

Procedure TFConcBanCob.rbConcxFechaClick(Sender: TObject);
Begin
   DMCNT.cdsMovCNT1.IndexFieldNames := 'FECEMISION';
   DMCNT.cdsMovCNT1.First;
   DMCNT.cdsMovCNT.IndexFieldNames := 'CNTFEMIS';
   DMCNT.cdsMovCNT.First;
End;

Procedure TFConcBanCob.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin  
// Inicio HPC_201502_CNT
   //DMCNT.cdsCia.Close;  
// Final HPC_201502_CNT
   DMCNT.cdsMOVCNT1.Filter := '';
   DMCNT.cdsMOVCNT1.Filtered := False;
   DMCNT.cdsMOVCNT1.IndexFieldNames := '';
   DMCNT.cdsMOVCNT1.Close;
   DMCNT.cdsMOVCNT.Filter := '';
   DMCNT.cdsMOVCNT.Filtered := False;
   DMCNT.cdsMOVCNT.IndexFieldNames := '';
   DMCNT.cdsMOVCNT.Close;

   DMCNT.cdsDoc2.Close;	  
// Inicio HPC_201502_CNT
   //DMCNT.cdsTDiario.Close;
// Final HPC_201502_CNT
   DMCNT.cdsTipCta.Close;
   DMCNT.cdsCuenta2.Close;
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry4.Close;
   DMCNT.cdsMovCNT2.Close;
   DMCNT.cdsQry5.Close;
   DMCNT.cdsQry3.Close;
   DMCNT.cdsClAux.Close;
End;

Function TFConcBanCob.VerificaPeriodo: Boolean;
Begin
   xSQL := 'Select * '
         + '  from TGE154 '
         + ' where CIAID=' + quotedstr(dblcCia.text)
         + '   and ANO=' + quotedstr(dbsAno.Text);
   DMCNT.cdsCierres.close;
   DMCNT.cdsCierres.datarequest(xSQL);
   DMCNT.cdsCierres.open;
   Result := True;
   If DMCNT.cdsCierres.FieldByName('PER' + dbsMEs.Text).AsString = 'S' Then
   Begin
      Showmessage('El periodo se encuentra Cerrado');
      result := false;
      exit;
   End
End;

Procedure TFConcBanCob.chkTodosClick(Sender: TObject);
Begin
   If chktodos.Checked = True Then
   Begin
      dblcTDiario.Visible := False;
      edtTDiario.Visible := False;
   End
   Else
      If chktodos.Checked = False Then
      Begin
         dblcTDiario.Visible := True;
         dblcTDiario.Text := '';
         edtTDiario.Visible := True;
         edtTDiario.Text := '';
      End;

End;

Procedure TFConcBanCob.dblcdCuentaExit(Sender: TObject);
Begin
   If dblcdCuenta.Text = '' Then
   Begin
      ShowMessage('Ingrese Cuenta Contable');
      dblcdCuenta.SetFocus;
      exit;
   End;
// Inicio HPC_201502_CNT
   //edtCuenta.Text := '';
   //edtCuenta.Text := DMCNT.cdsCuenta.FieldByName('CTAABR').AsString;
   If DMCNT.cdsCuenta.Locate('CUENTAID', VarArrayOf([dblcdCuenta.Text]), []) Then
      edtCuenta.Text :=DMCNT.cdsCuenta.FieldByName('CTADES').AsString
   Else
      edtCuenta.Text := 'Sin Descripción';
// Fin HPC_201502_CNT

   If length(edtCuenta.Text) = 0 Then
   Begin
      ShowMessage('Ingrese correctamente la Cuenta Contable');
      dblcdCuenta.SetFocus;
      exit;
   End;

// verifica que sea Cuenta de Movimientos
   If DMCNT.cdsCuenta.FieldByName('CTA_MOV').Asstring <> 'S' Then
   Begin

      If (DMCNT.cdsCuenta.FieldByName('CTA_DET').Asstring = 'S') And
         (DMCNT.cdsCuenta.FieldByName('CTA_DEST').AsString = 'S') And
         (DMCNT.cdsCuenta.FieldByName('FLGVAR').AsString = 'S') Then
      Else
      Begin
         dblcdCuenta.setfocus;
         ShowMessage('Cuenta No es de Movimientos, Verifique!');
         exit;
      End;
   End;
   bbtnMovsCont.SetFocus;
   bbtnMovsContClick(Self);
End;

// Inicio HPC_201502_CNT
procedure TFConcBanCob.edtBuscaExit(Sender: TObject);
begin
  pnlBusca.Visible := False;
end;
// Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
procedure TFConcBanCob.edtBuscaKeyPress(Sender: TObject; var Key: Char);
begin
   If (Key = #13) Or (Key = #27) Then
   Begin
      pnlBusca.Visible := False;
   End;
end;
// Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
procedure TFConcBanCob.Buscar;
begin
    edtBusca.Text := '';
    pnlBusca.Visible := False;
    pnlBusca.Left := Mouse.CursorPos.x-300 ;
    pnlBusca.Top  := Mouse.CursorPos.y ;
    pnlBusca.Visible := True;
    edtBusca.SetFocus;
end;
// Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
procedure TFConcBanCob.dbsMEsCNTExit(Sender: TObject);
begin
   dbsMEsCNT.Text := DMCNT.StrZero(dbsMEsCNT.Text, 2);
end;
// Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
procedure TFConcBanCob.cbMarcadoExit(Sender: TObject);
begin
//
end;
// Fin HPC_201502_CNT

// Inicio HPc_201502_CNT
procedure TFConcBanCob.cbMarcadoClick(Sender: TObject);
begin
   If vSemaforo1='1' Then
   Begin
      If (DMCNT.cdsMovCNT1.FieldByName('FLGCONC').AsString = 'S') and (cbMarcado.Checked) then
      Begin
         DMCNT.cdsMovCNT1.Edit;
         DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString := 'N';
         DMCNT.cdsMovCNT1.Post;
         exit;
      End;

      If (DMCNT.cdsMovCNT1.FieldByName('FLGCONC').AsString = 'N') and   cbMarcado.Checked then
      Begin
         DMCNT.cdsMovCNT1.Edit;
         DMCNT.cdsMovCNT1.FieldByName('IMPCONTAB').AsFloat := DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsFloat;
         DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString := 'S';
         DMCNT.cdsMovCNT1.Post;
         dbgExtracto.RefreshDisplay;
         exit;
      End;

      If (DMCNT.cdsMovCNT1.FieldByName('FLGCONC').AsString = 'N') and  not cbMarcado.Checked  Then
      Begin
         DMCNT.cdsMovCNT1.Edit;
         DMCNT.cdsMovCNT1.FieldByName('IMPCONTAB').AsString := '0.00';
         DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString := 'N';
         dbgExtracto.RefreshDisplay;
         DMCNT.cdsMovCNT1.Post;
         exit;
      End;
   End; //Semaforo
end;
//Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
// Suma Importe de los marcados
procedure TFConcBanCob.SumaImpoContab;
Var
   B: TBookmark;
begin
   vImporContab:=0;
   B := DMCNT.cdsMovCNT1.GetBookmark;
   DMCNT.cdsMovCNT1.DisableControls;
   DMCNT.cdsMovCNT1.First;
   While Not  DMCNT.cdsMovCNT1.Eof Do
   Begin
      If  DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString = 'S' Then
      Begin
         vImporContab := vImporContab + DMCNT.cdsMovCNT1.FieldByName('IMPCONTAB').AsFloat;
      End;
      DMCNT.cdsMovCNT1.Next;
   End;
   DMCNT.cdsMovCNT1.GotoBookmark(B);
   DMCNT.cdsMovCNT1.EnableControls;
   DMCNT.cdsMovCNT1.FreeBookmark(B);
   dbgExtracto.ColumnByName('IMPCONTAB').FooterValue := FormatFloat('###,###,##0.00', vImporContab);
end;
// Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
procedure TFConcBanCob.bbtnSumaMarcasClick(Sender: TObject);
begin
   SumaImpoContab;
end;
// Fin HPc_201502_CNT

// Inicio HPc_201502_CNT
procedure TFConcBanCob.bbtnDesmarcatodoClick(Sender: TObject);
Var
   B: TBookmark;
begin
   vImporContab:=0;
   B := DMCNT.cdsMovCNT1.GetBookmark;
   DMCNT.cdsMovCNT1.DisableControls;
   DMCNT.cdsMovCNT1.First;
   vSemaforo1:='0';

   While Not  DMCNT.cdsMovCNT1.Eof Do
   Begin
      If  DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString = 'S' Then
      Begin
         DMCNT.cdsMovCNT1.Edit;
         DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString:='N';
         DMCNT.cdsMovCNT1.FieldByName('IMPCONTAB').AsString:='0.00';
      End;
      DMCNT.cdsMovCNT1.Next;
   End;

   Try
      DMCNT.cdsMovCNT1.GotoBookmark(B);
   except
   end;
   DMCNT.cdsMovCNT1.EnableControls;
   DMCNT.cdsMovCNT1.FreeBookmark(B);
   dbgExtracto.ColumnByName('IMPCONTAB').FooterValue := FormatFloat('###,###,##0.00', vImporContab);
   vSemaforo1:='1';
end;
// Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
procedure TFConcBanCob.spbDesMarcaClick(Sender: TObject);
Var 
   B: TBookmark;
begin
   B := DMCNT.cdsMovCNT1.GetBookmark;
   DMCNT.cdsMovCNT1.DisableControls;
   DMCNT.cdsMovCNT1.First;
   vSemaforo1:='0';

   While Not  DMCNT.cdsMovCNT1.Eof Do
   Begin
      If Length(trim(edtPrefijo.Text))>0 Then
      Begin
         If BuscaCadena(trim(edtPrefijo.Text)) Then
         Begin
            DMCNT.cdsMovCNT1.Edit;
            DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString := 'N';
            DMCNT.cdsMovCNT1.FieldByName('IMPCONTAB').AsString := '0.00';
         End;
      End;
      DMCNT.cdsMovCNT1.Next;
   End;

   Try
      DMCNT.cdsMovCNT1.GotoBookmark(B);
   except
   end;
   DMCNT.cdsMovCNT1.EnableControls;
   DMCNT.cdsMovCNT1.FreeBookmark(B);
   SumaImpoContab;
   vSemaforo1:='1';
end;
// Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
procedure TFConcBanCob.edtSaldoBancoExit(Sender: TObject);
begin
   Try
      edtSaldoBanco.text:=FormatFloat('###,###.00', DMCNT.Valores(edtSaldoBanco.Text));
      SysLocale.MiddleEast := true;
      edtSaldoBanco.BiDiMode := bdRightToLeft;
   Except
      ShowMessage('Debe ingresar el Saldo de Banco');
      exit;
   End;
end;
// Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
procedure TFConcBanCob.btnImpresionClick(Sender: TObject);
var
   xsql,xFechaSaldo:String;
   Saldo:currency;
begin
   {
   xsql:='SELECT ''SALDO SEGUN BANCOS'' DESCRIPCION,'+CurrToStr(DMCNT.Valores(edtSaldoBanco.Text))+' IMPORTE,0 SALDO FROM DUAL'+
        ' UNION ALL '+
        'SELECT ''(-) CHEQUES, OFICIOS Y CARGOS CONTABILIZADOS Y NO PAGADOS''  DESCRIPCION, NVL(SUM(NVL(IMPORTE*-1,0)),0) IMPORTE,0 SALDO FROM CNT_CONC_MOV_CONT where idconc='''+trim(edtNumConciliacion.text)+''' and CNTDH=''H''  and nvl(flgconc,''N'')=''N'' '+
        ' UNION ALL '+
        'SELECT ''(+) CARGOS NO CONTABILIZADOS Y REGISTRADOS POR EL BANCO''    DESCRIPCION, NVL(SUM(NVL(IMPORTE,0)),0) IMPORTE,0 SALDO FROM CNT_CONC_EXTR_BAN where idconc='''+trim(edtNumConciliacion.text)+''' and importe>0  and nvl(flgconc,''N'')=''N'' '+
        ' UNION ALL '+
        'SELECT ''(-) DEPOSITO NO CONTABILIZADO REGISTRADO POR EL BANCO''      DESCRIPCION, NVL(SUM(NVL(IMPORTE,0)),0) IMPORTE,0 SALDO FROM CNT_CONC_EXTR_BAN where idconc='''+trim(edtNumConciliacion.text)+''' and importe<0  and nvl(flgconc,''N'')=''N'' '+
        ' UNION ALL '+
        'SELECT ''(+) DEPOSITOS CONTABILIZADOS Y NO REGISTRADOS POR EL BANCO'' DESCRIPCION, NVL(SUM(NVL(IMPORTE,0)),0) IMPORTE,0 SALDO FROM CNT_CONC_MOV_CONT where idconc='''+trim(edtNumConciliacion.text)+''' and CNTDH=''D''  and nvl(flgconc,''N'')=''N'' ';
   }
   //Inicio HPC_201702_CNT: se comento lo anterior, sql actualizado
   {
   xsql:='SELECT ''00'' GRUPO,''SALDO SEGÚN ESTADO BANCARIO AL ''||LAST_DAY(TO_DATE(''01/'+dbsMEs.Text+'/'+dbsAno.Text+''')) TITULO,NULL FECEMISION,NULL NUMOPERA,NULL DESCRIPCION,'+CurrToStr(DMCNT.Valores(edtSaldoBanco.Text))+' IMPORTE FROM DUAL '+
        ' UNION ALL '+
        'SELECT ''01'' GRUPO,''ABONOS CONTABILIZADOS Y NO REGISTRADOS POR EL BANCO'' TITULO,CNTFEMIS FECEMISION,NUMOPERA,CNTGLOSA DESCRIPCION,IMPORTE FROM CNT_CONC_MOV_CONT where idconc='''+trim(edtNumConciliacion.text)+''' and CNTDH=''D''  and nvl(flgconc,''N'')=''N''  '+
        ' UNION ALL '+
        'SELECT ''02'' GRUPO,''CARGOS CONTABILIZADOS Y NO REGISTRADOS POR EL BANCO'' TITULO,CNTFEMIS FECEMISION,NUMOPERA,CNTGLOSA DESCRIPCION,IMPORTE FROM CNT_CONC_MOV_CONT where idconc='''+trim(edtNumConciliacion.text)+''' and CNTDH=''H''  and nvl(flgconc,''N'')=''N'' AND TDIARID=''06'' '+
        ' UNION ALL '+
        'SELECT ''03'' GRUPO,''CHEQUES, OFICIOS Y CARGOS CONTABILIZADOS Y NO COBRADOS'' TITULO,CNTFEMIS FECEMISION,NUMOPERA,CNTGLOSA DESCRIPCION,IMPORTE FROM CNT_CONC_MOV_CONT where idconc='''+trim(edtNumConciliacion.text)+''' and CNTDH=''H''  and nvl(flgconc,''N'')=''N'' AND TDIARID<>''06'' '+
        ' UNION ALL '+
        'SELECT ''04'' GRUPO,''ABONOS NO CONTABILIZADOS Y REGISTRADOS POR EL BANCO'' TITULO, FECEMISION,NUMOPERA,DESCRIPCION DESCRIPCION,(IMPORTE*-1)IMPORTE FROM CNT_CONC_EXTR_BAN where idconc='''+trim(edtNumConciliacion.text)+''' and importe>0  and nvl(flgconc,''N'')=''N'' and NUMCOMPROB is null'+
        ' UNION ALL '+
        'SELECT ''05'' GRUPO,''CARGOS NO CONTABILIZADO REGISTRADO POR EL BANCO'' TITULO,FECEMISION,NUMOPERA,DESCRIPCION,(IMPORTE*-1)IMPORTE  FROM CNT_CONC_EXTR_BAN where idconc='''+trim(edtNumConciliacion.text)+''' and importe<0  and nvl(flgconc,''N'')=''N'' and NUMCOMPROB is null ';
   }

   xsql:='SELECT ''00'' GRUPO,''SALDO SEGÚN ESTADO BANCARIO AL ''||LAST_DAY(TO_DATE(''01/'+dbsMEs.Text+'/'+dbsAno.Text+''')) TITULO,NULL FECEMISION,NULL TDIARID, NULL NUMOPERA,NULL DESCRIPCION,'+CurrToStr(DMCNT.Valores(edtSaldoBanco.Text))+' IMPORTE FROM DUAL '+
        ' UNION ALL '+
        'SELECT ''01'' GRUPO,''ABONOS CONTABILIZADOS Y NO REGISTRADOS POR EL BANCO'' TITULO,CNTFEMIS FECEMISION, TDIARID,NUMOPERA,CNTGLOSA DESCRIPCION,IMPORTE FROM CNT_CONC_MOV_CONT where idconc='''+trim(edtNumConciliacion.text)+''' and CNTDH=''D''  and nvl(flgconc,''N'')=''N'' '+
        ' UNION ALL '+
        'SELECT ''02'' GRUPO,''CARGOS CONTABILIZADOS Y NO REGISTRADOS POR EL BANCO'' TITULO,CNTFEMIS FECEMISION, TDIARID,NUMOPERA,CNTGLOSA DESCRIPCION,IMPORTE FROM CNT_CONC_MOV_CONT where idconc='''+trim(edtNumConciliacion.text)+''' and CNTDH=''H''  and nvl(flgconc,''N'')=''N'' AND TDIARID<>''06'' '+
        ' UNION ALL '+
        'SELECT ''03'' GRUPO,''CHEQUES Y CARGOS CONTABILIZADOS Y NO BANCOS'' TITULO,CNTFEMIS FECEMISION, TDIARID,NUMOPERA,CNTGLOSA DESCRIPCION,IMPORTE FROM CNT_CONC_MOV_CONT where idconc='''+trim(edtNumConciliacion.text)+''' and CNTDH=''H''  and nvl(flgconc,''N'')=''N'' AND TDIARID=''06'' '+
        ' UNION ALL '+
        'SELECT ''04'' GRUPO,''ABONOS NO CONTABILIZADOS Y REGISTRADOS POR EL BANCO'' TITULO, FECEMISION, NULL TDIARID,NUMOPERA,DESCRIPCION DESCRIPCION,(IMPORTE*-1)IMPORTE FROM CNT_CONC_EXTR_BAN where idconc='''+trim(edtNumConciliacion.text)+''' and importe>0  and nvl(flgconc,''N'')=''N'' and NUMCOMPROB is null '+
        ' UNION ALL '+
        'SELECT ''05'' GRUPO,''CARGOS NO CONTABILIZADO REGISTRADO POR EL BANCO'' TITULO,FECEMISION, NULL TDIARID,NUMOPERA,DESCRIPCION,(IMPORTE*-1)IMPORTE  FROM CNT_CONC_EXTR_BAN where idconc='''+trim(edtNumConciliacion.text)+''' and importe<0  and nvl(flgconc,''N'')=''N'' and NUMCOMPROB is null ';

   xsql := 'SELECT GRUPO, TITULO, FECEMISION, TDIARID, NUMOPERA, DESCRIPCION, IMPORTE FROM ( ' + xsql + ') ORDER BY 1,2,3,5';
   //Fin HPC_201702_CNT

   DMCNT.cdsReporte.Close;
   DMCNT.cdsReporte.DataRequest(xsql);
   DMCNT.cdsReporte.Open;
   ppdb1.DataSource := DMCNT.dsReporte;
   ppReport1.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\RConciliacionBancaria.rtm';
   ppReport1.template.LoadFromFile;
   plblBanco.Caption  := edtBancoid.Text;
   plblCtacte.Caption := edtCCBcoid.Text;
   plblCuenta.Caption := dblcdCuenta.Text;
   If DMCNT.cdsCuenta.Locate('CUENTAID', VarArrayOf([dblcdCuenta.Text]), []) Then
      plblNomCuenta.Caption :=DMCNT.cdsCuenta.FieldByName('CTADES').AsString
   Else
      plblNomCuenta.Caption := 'Sin Descripción';
   plblMES.Caption    := dbsAno.Text+'-'+dbsMEs.Text;
   xFechaSaldo        :='01/'+dbsMEs.Text+'/'+dbsAno.Text;
   pplblTotal.Caption := 'SALDO SEGÚN LIBRO BANCOS AL '+IntToStr(DaysInMonth(StrTodate(xFechaSaldo)))+'/'+dbsMEs.Text+'/'+dbsAno.Text;
   If DMCNT.cdsCuenta2.Fieldbyname('TMONID').AsString='N' Then 
      plblMoneda.Caption := 'Soles' Else plblMoneda.Caption := 'Dolares';

// ppReport1.PreviewForm.WindowState:=WsMaximized;
// TppViewer(ppReport1.PreviewForm.Viewer).ZoomSetting := zsPagewidth;

   ppReport1.Print;
   ppReport1.Stop;
// pdes1.ShowModal;
end;
// Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
procedure TFConcBanCob.pplblSubtotalPrint(Sender: TObject);
begin
   If DMCNT.cdsReporte.FieldByname('GRUPO').AsString = '00' Then
   Begin
      ppDBCSubtotal.Visible := False;
      pplblSubtotal.Visible := False;
   End
   Else
   Begin
      ppDBCSubtotal.Visible := True;
      pplblSubtotal.Visible := True;
   End;
end;
// Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
procedure TFConcBanCob.ppDBCSubtotalPrint(Sender: TObject);
begin
   If DMCNT.cdsReporte.FieldByname('GRUPO').AsString = '00' Then
   Begin
      ppDBCSubtotal.Visible := False;
      pplblSubtotal.Visible := False;
   End
   Else
   Begin
      ppDBCSubtotal.Visible := True;
      pplblSubtotal.Visible := True;
   End;
end;
// Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
procedure TFConcBanCob.ppLine5Print(Sender: TObject);
begin
   If DMCNT.cdsReporte.FieldByname('GRUPO').AsString = '00' Then
   Begin
      ppLine5.Visible := False;
      ppLine6.Visible := False;
   End
   Else
   Begin
      ppLine5.Visible := True;
      ppLine6.Visible := True;
   End;
end;
// Fin HPC_201502_CNT  

// Inicio HPC_201502_CNT
//Inicio HPC_201702_CNT : Se agrego Saldo Inicial, control edtInicial
procedure TFConcBanCob.BitBtn1Click(Sender: TObject);
var
   dFechaAnterior : TDate;
   sPeriodoAnterior : String;
begin

   //calculamos el periodo anterior a partir del AÑO y MES actual al dia 01 y luego restamos 1 dia
   dFechaAnterior := IncDay(EncodeDate(StrToInt(dbsAno.Text),StrToInt(dbsMEs.Text), StrToInt('01')), -1);
   sPeriodoAnterior := formatdatetime('YYYYMM', dFechaAnterior);

   xsql:= 'SELECT SUM(NVL(SALDOC,0)) SALDOC, SUM(NVL(SALDOM,0))SALDOM, SUM(NVL(SALDOI,0))SALDOI, SUM(NVL(SALDOM,0))-SUM(NVL(SALDOC,0)) DIF  FROM ('+
          'SELECT ''C'' TIPO, SUM(NVL(IMPORTE,0)) SALDOC,0 SALDOM,0 SALDOI FROM ( '+
          'SELECT ''00'' GRUPO,''SALDO SEGÚN ESTADO BANCARIO AL ''||LAST_DAY(TO_DATE(''01/'+dbsMEs.Text+'/'+dbsAno.Text+''')) TITULO,NULL FECEMISION,NULL NUMOPERA,NULL DESCRIPCION,'+CurrToStr(DMCNT.Valores(edtSaldoBanco.Text))+' IMPORTE FROM DUAL '+
          ' UNION ALL '+
          'SELECT ''01'' GRUPO,''ABONOS CONTABILIZADOS Y NO REGISTRADOS POR EL BANCO'' TITULO,CNTFEMIS FECEMISION,NUMOPERA,CNTGLOSA DESCRIPCION,IMPORTE FROM CNT_CONC_MOV_CONT where idconc='''+trim(edtNumConciliacion.text)+''' and CNTDH=''D''  and nvl(flgconc,''N'')=''N''  '+
          ' UNION ALL '+
          'SELECT ''02'' GRUPO,''CARGOS CONTABILIZADOS Y NO REGISTRADOS POR EL BANCO'' TITULO,CNTFEMIS FECEMISION,NUMOPERA,CNTGLOSA DESCRIPCION,IMPORTE FROM CNT_CONC_MOV_CONT where idconc='''+trim(edtNumConciliacion.text)+''' and CNTDH=''H''  and nvl(flgconc,''N'')=''N'' AND TDIARID=''06'' '+
          ' UNION ALL '+
          'SELECT ''03'' GRUPO,''CHEQUES, OFICIOS Y CARGOS CONTABILIZADOS Y NO COBRADOS'' TITULO,CNTFEMIS FECEMISION,NUMOPERA,CNTGLOSA DESCRIPCION,IMPORTE FROM CNT_CONC_MOV_CONT where idconc='''+trim(edtNumConciliacion.text)+''' and CNTDH=''H''  and nvl(flgconc,''N'')=''N'' AND TDIARID<>''06'' '+
          ' UNION ALL '+
          'SELECT ''04'' GRUPO,''ABONOS NO CONTABILIZADOS Y REGISTRADOS POR EL BANCO'' TITULO, FECEMISION,NUMOPERA,DESCRIPCION DESCRIPCION,(IMPORTE*-1)IMPORTE FROM CNT_CONC_EXTR_BAN where idconc='''+trim(edtNumConciliacion.text)+''' and importe>0  and nvl(flgconc,''N'')=''N'' and NUMCOMPROB is null'+
          ' UNION ALL '+
          'SELECT ''05'' GRUPO,''CARGOS NO CONTABILIZADO REGISTRADO POR EL BANCO'' TITULO,FECEMISION,NUMOPERA,DESCRIPCION,(IMPORTE*-1)IMPORTE  FROM CNT_CONC_EXTR_BAN where idconc='''+trim(edtNumConciliacion.text)+''' and importe<0  and nvl(flgconc,''N'')=''N'' and NUMCOMPROB is null '+
          ')'+
          ' UNION ALL '+
          'SELECT ''M'' TIPO,0 SALDOC,NVL(SALDMN'+dbsMEs.Text+',0) SALDOM, 0 SALDOI '+
          'FROM CNT401 WHERE CIAID='''+dblcCia.Text+''' AND ANO='''+dbsAno.Text+''' AND CUENTAID='''+dblcdCuenta.Text+''' AND CLAUXID is null and CCOSID is null '+
          ' UNION ALL '+
          'SELECT ''I'' TIPO,0 SALDOC,0 SALDOM, NVL(SALDMN'+Copy(sPeriodoAnterior,5,2)+',0) SALDOI  '+
          'FROM CNT401 WHERE CIAID='''+dblcCia.Text+''' AND ANO='''+Copy(sPeriodoAnterior,1,4) + ''' AND CUENTAID='''+dblcdCuenta.Text+''' AND CLAUXID is null and CCOSID is null '+
          ')';
   DMCNT.cdsReporte.Close;
   DMCNT.cdsReporte.DataRequest(xsql);
   DMCNT.cdsReporte.Open;
   If DMCNT.cdsReporte.RecordCount>0 Then
   Begin
      If DMCNT.cdsReporte.fieldbyname('DIF').AsCurrency<>0 Then
         edtdif.Color := clRed
      Else 
         edtdif.Color := clWhite;

      edtInicial.text:=FormatFloat('###,###.00', DMCNT.Valores(DMCNT.cdsReporte.fieldbyname('SALDOI').AsString));
      edtMayor.text:=FormatFloat('###,###.00', DMCNT.Valores(DMCNT.cdsReporte.fieldbyname('SALDOM').AsString));
      edtConc.Text :=FormatFloat('###,###.00', DMCNT.Valores(DMCNT.cdsReporte.fieldbyname('SALDOC').AsString));
      edtdif.Text  :=FormatFloat('###,###.00', DMCNT.Valores(DMCNT.cdsReporte.fieldbyname('DIF').AsString));
      SysLocale.MiddleEast := true;

      edtInicial.BiDiMode := bdRightToLeft;
      edtMayor.BiDiMode := bdRightToLeft;
      edtConc.BiDiMode := bdRightToLeft;
      edtdif.BiDiMode := bdRightToLeft;

      pnlcompara.Left := 645; 
      pnlcompara.Top  := 416;
      pnlcompara.Visible := True;
   End
end;   
//Fin HPC_201702_CNT
// Fin HPC_201502_CNT


// Inicio HPC_201502_CNT
procedure TFConcBanCob.Button1Click(Sender: TObject);
begin
   pnlcompara.Visible := False;
end;
// Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
procedure TFConcBanCob.dblcCCBcoidClick(Sender: TObject);
begin
   dblcCCBcoid.DropDown; 
end;
// Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
procedure TFConcBanCob.edtSaldoBancoKeyPress(Sender: TObject;
  var Key: Char);
Begin
   If Key In [' ', 'A'..'Z', 'a'..'z', '°', '|', '!', '"', '#', '$', '%', '&', '/', '(', ')', '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '~', '[', ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''', '_'] Then
      Key := #0;
end;
// Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
procedure TFConcBanCob.BitBtn2Click(Sender: TObject);
begin
   close;
end;
// Fin HPC_201502_CNT

// Inicio HPC_201502_CNT
procedure TFConcBanCob.ppReport1PreviewFormCreate(Sender: TObject);
begin
   ppReport1.PreviewForm.WindowState:=WsMaximized;
   TppViewer(ppReport1.PreviewForm.Viewer).ZoomSetting := zs100Percent;
end;
// Fin HPC_201502_CNT

//Inicio HPC_201702_CNT: se agrego nueva opción para añadir movimientos anteriores al periodo seleccionado 
Procedure TFConcBanCob.bbtnMovsAntClick(Sender: TObject);
Var
   xWhere, xTdiarid: String;
   xGeneraMov: Boolean;
Begin

    FSelMovAnt:=TFSelMovAnt.Create(Self);
    FSelMovAnt.sCiaId :=  dblcCia.Text;
    FSelMovAnt.sCuentaId :=  dblcdCuenta.Text;
    FSelMovAnt.sOrigenId :=  dblcTDiario.Text;
    FSelMovAnt.sAno :=  dbsAno.Text;
    FSelMovAnt.sMes :=  dbsMes.Text;
    FSelMovAnt.sNumConc := xnumconc;
    FSelMovAnt.iContadorMov := DMCNT.cdsMovCNT.RecordCount;

    If FSelMovAnt.ShowModal = mrOk Then
        bbtnRefrescaClick(Self);

    FSelMovAnt.Free;
End;
//Fin HPC_201702_CNT

//Inicio HPC_201702_CNT: se agrego nueva opción para exportar a excel
procedure TFConcBanCob.bbtnExpExcelClick(Sender: TObject);
var
   i, iIni, iFin, c, iGrupo, iGrupoIni, iGrupoFin, iTamPag: Integer;
   Sheet: Variant;
   sIni, sFin, sTitulo, sTotal: String;
   XLApp: Variant;
begin

   xsql:='SELECT ''00'' GRUPO,''SALDO SEGÚN ESTADO BANCARIO AL ''||LAST_DAY(TO_DATE(''01/'+dbsMEs.Text+'/'+dbsAno.Text+''')) TITULO,NULL FECEMISION, NULL TDIARID, NULL NUMOPERA,NULL DESCRIPCION,'+CurrToStr(DMCNT.Valores(edtSaldoBanco.Text))+' IMPORTE FROM DUAL '+
        ' UNION ALL '+
        'SELECT ''01'' GRUPO,''ABONOS CONTABILIZADOS Y NO REGISTRADOS POR EL BANCO'' TITULO,CNTFEMIS FECEMISION, TDIARID,NUMOPERA, CNTGLOSA DESCRIPCION,IMPORTE FROM CNT_CONC_MOV_CONT where idconc='''+trim(edtNumConciliacion.text)+''' and CNTDH=''D''  and nvl(flgconc,''N'')=''N'' '+
        ' UNION ALL '+
        'SELECT ''02'' GRUPO,''CARGOS CONTABILIZADOS Y NO REGISTRADOS POR EL BANCO'' TITULO,CNTFEMIS FECEMISION, TDIARID,NUMOPERA,CNTGLOSA DESCRIPCION,IMPORTE FROM CNT_CONC_MOV_CONT where idconc='''+trim(edtNumConciliacion.text)+''' and CNTDH=''H''  and nvl(flgconc,''N'')=''N'' AND TDIARID<>''06'' '+
        ' UNION ALL '+
        'SELECT ''03'' GRUPO,''CHEQUES Y CARGOS CONTABILIZADOS Y NO BANCOS'' TITULO,CNTFEMIS FECEMISION, TDIARID,NUMOPERA,CNTGLOSA DESCRIPCION,IMPORTE FROM CNT_CONC_MOV_CONT where idconc='''+trim(edtNumConciliacion.text)+''' and CNTDH=''H''  and nvl(flgconc,''N'')=''N'' AND TDIARID=''06'' '+
        ' UNION ALL '+
        'SELECT ''04'' GRUPO,''ABONOS NO CONTABILIZADOS Y REGISTRADOS POR EL BANCO'' TITULO, FECEMISION, NULL TDIARID,NUMOPERA,DESCRIPCION DESCRIPCION,(IMPORTE*-1)IMPORTE FROM CNT_CONC_EXTR_BAN where idconc='''+trim(edtNumConciliacion.text)+''' and importe>0  and nvl(flgconc,''N'')=''N'' and NUMCOMPROB is null '+
        ' UNION ALL '+
        'SELECT ''05'' GRUPO,''CARGOS NO CONTABILIZADO REGISTRADO POR EL BANCO'' TITULO,FECEMISION, NULL TDIARID,NUMOPERA,DESCRIPCION,(IMPORTE*-1)IMPORTE  FROM CNT_CONC_EXTR_BAN where idconc='''+trim(edtNumConciliacion.text)+''' and importe<0  and nvl(flgconc,''N'')=''N'' and NUMCOMPROB is null ';

   xsql := 'SELECT GRUPO, TITULO, TO_CHAR(FECEMISION,''YYYY-MM-DD'') FECEMISION, TDIARID, NUMOPERA, DESCRIPCION, IMPORTE FROM ( ' + xsql + ') ORDER BY 1,2,3,5';

   DMCNT.cdsReporte.Close;
   DMCNT.cdsReporte.DataRequest(xsql);
   DMCNT.cdsReporte.Open;

   XLApp := CreateOleObject('Excel.Application');
   XLApp.Visible := True;
   XLApp.Workbooks.Add(xlWBatWorkSheet);
   XLApp.Workbooks[1].WorkSheets[1].Name := 'Conciliacion Bancaria';
   Sheet := XLApp.Workbooks[1].WorkSheets['Conciliacion Bancaria'];


   i := 1;
   sheet.cells[i, 1] := '';
   sheet.cells[i, 2] := 'CONCILIACIÓN BANCARIA';
   sheet.cells[i, 3] := '';
   sheet.cells[i, 4] := '';
   sheet.cells[i, 5] := formatdatetime('DD/MM/YYYY',NOW());
   sheet.Range['B'+ IntToStr(i)+ ':D'+ IntToStr(i)].Font.Bold := True;
   sheet.Range['B'+ IntToStr(i)+ ':D'+ IntToStr(i)].Merge(EmptyParam);
   // 2
   inc(i);
   sheet.cells[i, 1] := 'MÓDULO';
   sheet.cells[i, 3] := 'Contabilidad';
   sheet.cells[i, 2] := '';
   sheet.cells[i, 4] := '';
   // 3
   inc(i);
   sheet.cells[i, 1] := 'BANCO';
   sheet.cells[i, 3] := edtBancoid.Text;
   sheet.cells[i, 2] := '';
   sheet.cells[i, 4] := '';
   // 4
   inc(i);
   sheet.cells[i, 1] := 'CUENTA CORRIENTE N°';
   sheet.cells[i, 3] := edtCCBcoid.Text;
   sheet.cells[i, 2] := '';
   sheet.cells[i, 4] := '';
   // 5
   inc(i);
   sheet.cells[i, 1] := 'CUENTA CONTABLE';
   If DMCNT.cdsCuenta.Locate('CUENTAID', VarArrayOf([dblcdCuenta.Text]), []) Then
      sheet.cells[i, 3] := dblcdCuenta.Text + ' ' + DMCNT.cdsCuenta.FieldByName('CTADES').AsString
   Else
      sheet.cells[i, 3] := dblcdCuenta.Text + ' ' + 'Sin Descripción';

   sheet.cells[i, 2] := '';
   sheet.cells[i, 4] := '';
   // 6
   inc(i);
   sheet.cells[i, 1] := 'MONEDA';
   If DMCNT.cdsCuenta2.Fieldbyname('TMONID').AsString='N' Then
      sheet.cells[i, 3] := 'Soles'
   Else
      sheet.cells[i, 3] := 'Dólares';
   sheet.cells[i, 2] := '';
   sheet.cells[i, 4] := '';
   // 7
   inc(i);
   sheet.cells[i, 1] := 'MES';
   sheet.cells[i, 3] := dbsAno.Text+'-'+dbsMEs.Text;
   sheet.cells[i, 2] := '';
   sheet.cells[i, 4] := '';

   //8,9
   inc(i);
   inc(i);
   sheet.cells[i, 1] := 'FECHA';
   sheet.cells[i, 2] := 'ORIGEN';
   sheet.cells[i, 3] := 'N° OPERACIÓN';
   sheet.cells[i, 4] := 'DESCRIPCIÓN';
   sheet.cells[i, 5] := 'IMPORTE';

   sheet.Range['B:B'].NumberFormat := '@';
   sheet.Range['C:C'].NumberFormat := '@';

   For c := 1 To 5 Do
      sheet.cells[i, c].Interior.Color := clMoneyGreen;

   sheet.Range['A'+ IntToStr(i)+ ':E' + IntToStr(i)].Borders[xlEdgeTop].LineStyle := xlContinuous;
   sheet.Range['A'+ IntToStr(i)+ ':E' + IntToStr(i)].Borders[xlEdgeBottom].LineStyle := xlContinuous;


   If (DMCNT.cdsReporte.RecordCount = 0) Then
      exit;

   //inicializamos variables
   iIni := i + 1;
   sTitulo:= '';
   iGrupo:= 0;
   sTotal := '=';
   DMCNT.cdsReporte.First;
   While Not DMCNT.cdsReporte.Eof Do
   Begin
      inc(i);

      If (sTitulo <> Trim(DMCNT.cdsReporte.FieldbyName('TITULO').AsString)) Then
      Begin
          inc(iGrupo);

          If (iGrupo = 1) Then
              sTotal := sTotal + '+D'+ IntToStr(i + 1); //incrementamos suma total

          //imprime el subtotal cuando se detecta nuevo grupo, se imprime desde subtotal del grupo2
          If (iGrupo > 2) Then
          Begin
              iGrupoFin:=  i - 1;
              sheet.cells[i, 4] := 'Sub Total';
              sheet.cells[i, 5] := '=SUM(E'+ IntToStr(iGrupoIni) + ':E' + IntToStr(iGrupoFin) +')';
              sheet.Range['A'+IntToStr(i) + ':E' + IntToStr(i)].Font.Bold := True;
              sheet.Range['D'+IntToStr(i)+':D'+IntToStr(i)].HorizontalAlignment := xlright;
              sheet.Range['E'+ IntToStr(i)+ ':E' + IntToStr(i)].Borders[xlEdgeTop].LineStyle := xlContinuous;
              sheet.Range['E'+ IntToStr(i)+ ':E' + IntToStr(i)].Borders[xlEdgeBottom].LineStyle := xlContinuous;

              //incrementamos suma total
              sTotal := sTotal + '+E'+ IntToStr(i);

              inc(i);
              inc(i);
          End;

          //inicializa valores de grupo
          sheet.cells[i, 1] := Trim(DMCNT.cdsReporte.FieldbyName('TITULO').AsString);
          sheet.Range['A'+IntToStr(i) + ':E' + IntToStr(i)].Font.Bold := True;
          sheet.Range['A'+IntToStr(i) + ':E' + IntToStr(i)].Merge(EmptyParam);
          sheet.Range['A'+IntToStr(i) + ':A' + IntToStr(i)].HorizontalAlignment := xlleft;
          sTitulo := Trim(DMCNT.cdsReporte.FieldbyName('TITULO').AsString);
          inc(i);
          iGrupoIni:= i;
      End;

      sheet.cells[i, 1] := Trim(DMCNT.cdsReporte.FieldbyName('FECEMISION').AsString);
      sheet.cells[i, 2] := Trim(DMCNT.cdsReporte.FieldbyName('TDIARID').AsString);
      sheet.cells[i, 3] := Trim(DMCNT.cdsReporte.FieldbyName('NUMOPERA').AsString);
      sheet.cells[i, 4] := Trim(DMCNT.cdsReporte.FieldbyName('DESCRIPCION').AsString);
      sheet.cells[i, 5] := DMCNT.cdsReporte.FieldbyName('IMPORTE').AsFloat;

      DMCNT.cdsReporte.Next;
   End;

   If (iGrupo > 0) Then
   Begin
      inc(i);
      iGrupoFin:=  i - 1;
      sheet.cells[i, 4] := 'Sub Total';
      sheet.cells[i, 5] := '=SUM(E'+ IntToStr(iGrupoIni) + ':E' + IntToStr(iGrupoFin) +')';
      sheet.Range['A'+IntToStr(i)+':E'+IntToStr(i)].Font.Bold := True;
      sheet.Range['D'+IntToStr(i)+':D'+IntToStr(i)].HorizontalAlignment := xlright;
      sheet.Range['E'+ IntToStr(i)+ ':E' + IntToStr(i)].Borders[xlEdgeTop].LineStyle := xlContinuous;
      sheet.Range['E'+ IntToStr(i)+ ':E' + IntToStr(i)].Borders[xlEdgeBottom].LineStyle := xlContinuous;

      //incrementamos suma total
      sTotal := sTotal + '+E'+ IntToStr(i);
   End;

   inc(i);
   inc(i);
   sheet.cells[i, 1] := 'SALDO SEGÚN LIBRO BANCOS AL ' + formatdatetime('DD/MM/YYYY', EndOfAMonth(StrToInt(dbsAno.Text), StrToInt(dbsMes.Text)) );
   sheet.cells[i, 5] := sTotal;
   sheet.Range['A'+IntToStr(i) + ':E' + IntToStr(i)].Font.Bold := True;
   sheet.Range['A'+IntToStr(i) + ':D' + IntToStr(i)].Merge(EmptyParam);
   sheet.Range['A'+IntToStr(i) + ':A' + IntToStr(i)].HorizontalAlignment := xlleft;
   sheet.Range['E'+ IntToStr(i)+ ':E' + IntToStr(i)].Borders[xlEdgeTop].LineStyle := xlContinuous;
   sheet.Range['E'+ IntToStr(i)+ ':E' + IntToStr(i)].Borders[xlEdgeBottom].LineStyle := xlContinuous;


   iFin := i;
   sIni := Inttostr(iIni);
   sFin := Inttostr(iFin);

   sheet.Range['E' + sIni + ':' + 'E' + sFin].NumberFormat := '###,###,##0.00';


   sheet.Range['A' + sIni + ':' + 'A' + sFin].HorizontalAlignment := xlleft;
   sheet.Range['B' + sIni + ':' + 'B' + sFin].HorizontalAlignment := xlleft;
   sheet.Range['C' + sIni + ':' + 'C' + sFin].HorizontalAlignment := xlleft;
   sheet.Range['E' + sIni + ':' + 'E' + sFin].HorizontalAlignment := xlright;

   sheet.Range['A9:E9'].Font.Bold := True;
   sheet.Range['A1:A1'].ColumnWidth:=15;
   sheet.Range['B1:B1'].ColumnWidth:=12;
   sheet.Range['C1:C1'].ColumnWidth:=15;
   sheet.Range['D1:D1'].ColumnWidth:=30;
   sheet.Range['E1:E1'].ColumnWidth:=15;

end;
//Fin HPC_201702_CNT

//Inicio HPC_201702_CNT: se agrego rutina para elimimar un item en la BD
procedure TFConcBanCob.dbgMovContKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  xSQL : String;
begin
	if (Key=VK_DELETE) and (ssCtrl in Shift)  then  //^Del
	begin

     xSQL := ' Select COUNT(1) CUENTA '
             + '  from CNT_CONC_MOV_CONT m'
             + ' where m.IDCONC='''+DMCNT.cdsMovCNT.FieldByName('IDCONC').AsString+''''
             + '   and m.IDMOVCONT='''+DMCNT.cdsMovCNT.FieldByName('IDMOVCONT').AsString+''''
             + '   and m.IDEXTBAN IS NOT NULL and m.FLGCONC = ''S''';

     DMCNT.cdsSQL.close;
     DMCNT.cdsSQL.datarequest(xSQL);
     DMCNT.cdsSQL.open;
     If DMCNT.cdsSQL.FieldByName('CUENTA').AsInteger = 1 Then
     Begin
        Showmessage('Registro conciliado');
        exit;
     End;

     if MessageDlg('¿ Seguro de Eliminar Detalle ?',mtConfirmation,
									[mbYes, mbNo], 0)=mrYes then
     begin
        try
           xSQL:='delete from CNT_CONC_MOV_CONT where IDCONC='''+DMCNT.cdsMovCNT.FieldByName('IDCONC').AsString+''''
               + ' and IDMOVCONT='''+DMCNT.cdsMovCNT.FieldByName('IDMOVCONT').AsString+'''';
           DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
           Refrescadata;
           ShowMessage('Elimación OK');
        except
           ShowMessage('Error al Eliminar');
        end;
     end;
  end;
end;
//Fin HPC_201702_CNT

End.

