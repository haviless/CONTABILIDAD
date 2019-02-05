Unit CNT201;

// Actualizaciones
// HPC_201402_CNT 03/03/2014  Modificar los ControlTrans, AplicaDato y los ApplyUpdates.
//                            Se corrige sangría del formulario
// HPC_201403_CNT 10/03/2014  Ajustes finales de Pase 201402_CNT
// HPC_201404_CNT 03/04/2014  Ajustes finales de Pase 201402_CNT
// HPC_201405_CNT 09/04/2014  Agrega campos al momento de editar registro de detalle
// HPC_201406_CNT 11/04/2014  retiro de los applyupdates faltantes
// HPC_201407_CNT 30/05/2014  incluye datos de auxiliar en modificación de detalle
// HPC_201409_CNT 03/09/2014  Corrección de Módulo de Contabilidad para el Registro de Comprobante.
// HPC_201501_CNT 02/03/2015  Cierra cds utilizados en forma al momento de salir para que no cause conflictos
//                            con otros formularios
// HPC_201503_CNT 05/10/2015  Retiro de comentarios antiguos
//                            Retiro de apertura de tablas de DB2
//                            Ajustes a la grabación de comprobantes contables
//                            Individualización de grabación de tablas
//                            Apertura de Auxiliares Contables por Clase de Auxiliar
//                            Ajustes a la numeración del detalle
// HPC_201601_CNT 18/01/2016: Borra datos de Tabla CNT301 para que no genere duplicidad en Contabilización
// HPC_201602_CNT 06/12/2016  Verifica que numeración de registro no esté duplicada antes de actualizar registros
// HPC_201701_CNT 21/14/2017 Valida que la fecha de emisión sea menor igual que la fecha de comprobante.

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   wwDialog, wwrcdvw, Mask, wwdbdatetimepicker, Wwdbdlg, Grids, Wwdbigrd,
   Wwdbgrid, StdCtrls, Buttons, wwdbedit, wwdblook, ExtCtrls, wwSpeedButton,
   wwDBNavigator, DB, DBCtrls, wwClient, DBGrids, Spin, ppDB, ppBands,
   ppClass, ppCtrls, ppVar, ppPrnabl, ppProd, ppReport, ppComm, ppRelatv,
   ppCache, ppDBPipe, DBTables, ComCtrls, ppTypes, oaContabiliza,
   Wwdotdot, Wwdbcomb, oaVariables, ppEndUsr, ppParameter;

Type
   TFRegComp = Class(TForm)
      pnlCabecera: TPanel;
      pnlDatosCab: TPanel;
      lblCia: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      pnlMovCNT: TPanel;
      dbgMovCNT: TwwDBGrid;
      bbtnGraba: TBitBtn;
      bbtnCanc2: TBitBtn;
      bbtnContab: TBitBtn;
      bbtnRegresa: TBitBtn;
      bbtnNuevo: TBitBtn;
      Label1: TLabel;
      dbeLote: TwwDBEdit;
      lblTDiario: TLabel;
      dblcTDiario: TwwDBLookupCombo;
      edtTDiario: TEdit;
      Label15: TLabel;
      dtpFComp: TwwDBDateTimePicker;
      lblNoReg: TLabel;
      edtPeriodo: TEdit;
      Label11: TLabel;
      dblcTMon: TwwDBLookupCombo;
      Label12: TLabel;
      dbeTasa: TwwDBEdit;
      bbtnBorra: TBitBtn;
      bbtnOKCabec: TBitBtn;
      dbgMovCNTIButton: TwwIButton;
      bbtnAnula: TBitBtn;
      bbtnAcepta: TBitBtn;
      Label14: TLabel;
      pnlMantComp: TPanel;
      Label6: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      Label13: TLabel;
      Label16: TLabel;
      Label17: TLabel;
      Label18: TLabel;
      dblcdCCosto: TwwDBLookupComboDlg;
      edtAux: TEdit;
      dbeSerie: TDBEdit;
      dbeNodoc: TDBEdit;
      dblcdAux: TwwDBLookupComboDlg;
      dbeGlosa: TDBEdit;
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
      dbdtpFEmis: TwwDBDateTimePicker;
      dbdtpFVcmto: TwwDBDateTimePicker;
      Panel1: TPanel;
      dbeTDoc: TDBEdit;
      Label19: TLabel;
      dbeCCosto: TDBEdit;
      dbeMonto: TwwDBEdit;
      dbeNoComp: TwwDBEdit;
      Label20: TLabel;
      pnlEstado: TPanel;
      Label21: TLabel;
      Label22: TLabel;
      Label23: TLabel;
      Label24: TLabel;
      dbeMND: TDBEdit;
      dbeMED: TDBEdit;
      dbeMNDif: TDBEdit;
      dbeMEDif: TDBEdit;
      Label4: TLabel;
      dbeMNC: TDBEdit;
      dbeMEC: TDBEdit;
      Label25: TLabel;
      lblContab: TLabel;
      lblAceptado: TLabel;
      lblAnulado: TLabel;
      lblIncompleto: TLabel;
      cbTCambio: TComboBox;
      Label26: TLabel;
      ppdbVoucher: TppDBPipeline;
      bbtnImprime: TBitBtn;
      Label5: TLabel;
      dblcdCuenta: TwwDBLookupComboDlg;
      edtCuenta: TEdit;
      Label27: TLabel;
      dbeGlosaCab: TwwDBEdit;
      edtTMon: TEdit;
      DBLCCLASE: TwwDBLookupCombo;
      dblcTDoc: TwwDBLookupCombo;
      Label2: TLabel;
      dbeTCamb: TwwDBEdit;
      bbtnDesConta: TBitBtn;
      dblcTMon2: TwwDBLookupCombo;
      Label3: TLabel;
      ppReport1: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel3: TppLabel;
      ppLabel11: TppLabel;
      ppLabel22: TppLabel;
      ppLabel24: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel42: TppLabel;
      ppLabel45: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel50: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel51: TppLabel;
      ppLabel52: TppLabel;
      ppLabel53: TppLabel;
      ppLabel54: TppLabel;
      ppLabel55: TppLabel;
      ppLabel56: TppLabel;
      ppLabel57: TppLabel;
      ppLabel58: TppLabel;
      ppLabel59: TppLabel;
      ppLabel60: TppLabel;
      ppLabel61: TppLabel;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppLabel64: TppLabel;
      ppLabel65: TppLabel;
      ppLabel66: TppLabel;
      ppDBText5: TppDBText;
      ppDBText11: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText26: TppDBText;
      ppDetailBand1: TppDetailBand;
      ppDBText27: TppDBText;
      ppDBText28: TppDBText;
      ppDBText29: TppDBText;
      ppDBText30: TppDBText;
      ppDBText31: TppDBText;
      ppDBText32: TppDBText;
      ppDBText33: TppDBText;
      ppDBText34: TppDBText;
      ppDBText35: TppDBText;
      ppDBText36: TppDBText;
      ppDBText37: TppDBText;
      ppDBText38: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppGroup5: TppGroup;
      ppGroupHeaderBand5: TppGroupHeaderBand;
      ppGroupFooterBand5: TppGroupFooterBand;
      ppLabel67: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppLabel68: TppLabel;
      ppLabel69: TppLabel;
      ppDBText39: TppDBText;
      ppLabel70: TppLabel;
      ppLabel71: TppLabel;
      ppLabel72: TppLabel;
      ppLabel73: TppLabel;
      ppLabel74: TppLabel;
      ppLabel75: TppLabel;
      ppLabel76: TppLabel;
      ppLabel77: TppLabel;
      ppGroup6: TppGroup;
      ppGroupHeaderBand6: TppGroupHeaderBand;
      ppGroupFooterBand6: TppGroupFooterBand;
      ppGroup7: TppGroup;
      ppGroupHeaderBand7: TppGroupHeaderBand;
      ppGroupFooterBand7: TppGroupFooterBand;
      ppGroup8: TppGroup;
      ppGroupHeaderBand8: TppGroupHeaderBand;
      ppGroupFooterBand8: TppGroupFooterBand;
      dbeDH: TwwDBComboBox;
      ppd1: TppDesigner;
      pprv: TppReport;
      ppParameterList1: TppParameterList;
      ppHeaderBand2: TppHeaderBand;
      ppLabel10: TppLabel;
      ppLabel23: TppLabel;
      ppLabel14: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel38: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppLabel43: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel44: TppLabel;
      ppLabel25: TppLabel;
      ppLabel41: TppLabel;
      ppLabel2: TppLabel;
      ppLabel4: TppLabel;
      ppLabel20: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppSystemVariable5: TppSystemVariable;
      ppLabel21: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      pplblFecha: TppLabel;
      pplblPeriodo: TppLabel;
      pplblTcam: TppLabel;
      pplblDiario: TppLabel;
      pplblComp: TppLabel;
      pplblLote: TppLabel;
      pplblTmon: TppLabel;
      pplblEstado: TppLabel;
      ppLabel12: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      lblperiodo: TppLabel;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText3: TppDBText;
      ppLabel78: TppLabel;
      ppDBText40: TppDBText;
      ppDBText41: TppDBText;
      ppDBText42: TppDBText;
      ppDetailBand2: TppDetailBand;
      ppDBText4: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText9: TppDBText;
      ppDBText25: TppDBText;
      ppDBText2: TppDBText;
      ppDBText1: TppDBText;
      ppDBText10: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppLabel18: TppLabel;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppDBText99: TppDBText;
      ppLabel13: TppLabel;
      ppLabel7: TppLabel;
      pplCmp: TppLabel;
      ppLabel79: TppLabel;
      ppLabel19: TppLabel;
      ppDBCalc9: TppDBCalc;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppLabel80: TppLabel;
      ppLabel81: TppLabel;
      ppDBText43: TppDBText;
      ppLabel82: TppLabel;
      ppLabel83: TppLabel;
      ppLabel84: TppLabel;
      ppLabel85: TppLabel;
      ppLabel86: TppLabel;
      ppDBCalc13: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      ppDBCalc16: TppDBCalc;
      ppLabel87: TppLabel;
      ppLabel88: TppLabel;
      ppDBText44: TppDBText;
      ppLabel89: TppLabel;
      ppLabel90: TppLabel;
      ppLabel91: TppLabel;
      ppLabel92: TppLabel;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLabel93: TppLabel;
      ppDBCalc17: TppDBCalc;
      ppDBCalc18: TppDBCalc;
      ppDBCalc19: TppDBCalc;
      ppDBCalc20: TppDBCalc;
      ppLabel94: TppLabel;
      ppLabel95: TppLabel;
      ppDBText45: TppDBText;
      ppLabel96: TppLabel;
      ppLabel97: TppLabel;
      ppLabel98: TppLabel;
      ppLabel99: TppLabel;
      pnlAdm: TPanel;
      Label28: TLabel;
      bbtnAdm: TBitBtn;
      lblModulo: TLabel;
      cbDisenoRep: TCheckBox;
      SpeedButton1: TSpeedButton;
      bbtnRenumDet: TBitBtn;
      Procedure IniciaDatos;
      Procedure dblcTDiarioExit(Sender: TObject);
      Procedure dtpFCompExit(Sender: TObject);
      Procedure dblcTMonExit(Sender: TObject);
      Procedure bbtnBorraClick(Sender: TObject);
      Procedure bbtnOKCabecClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbgMovCNTIButtonClick(Sender: TObject);
      Procedure bbtnGrabaClick(Sender: TObject);
      Procedure bbtnRegresaClick(Sender: TObject);
      Procedure bbtnCanc2Click(Sender: TObject);
      Procedure MuestraEstado(xMovEstado, xMovConta: String);

      Procedure bbtnContabClick(Sender: TObject);
      Function AsientoCuadra: Boolean;
      Function Valida_Cuenta_y_CCosto: Boolean;
      Procedure bbtnNuevoClick(Sender: TObject);
      Procedure bbtnAnulaClick(Sender: TObject);
      Procedure dbeLoteExit(Sender: TObject);
      Procedure dblcdAuxExit(Sender: TObject);
      Procedure dblcdCCostoExit(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure bbtnCancClick(Sender: TObject);
      Procedure dbgMovCNTDblClick(Sender: TObject);
      Procedure dbeDHExit(Sender: TObject);
      Procedure dbeMontoExit(Sender: TObject);
      Procedure dbeNoCompExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure TotalesResumen;
      Procedure RegNuevo;
      Procedure cbTCambioExit(Sender: TObject);
      Procedure bbtnImprimeClick(Sender: TObject);
      Procedure dbeGlosaExit(Sender: TObject);
      Procedure dbgMovCNTKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
   // Inicio HPC_201503_CNT
   //   Procedure FormDestroy(Sender: TObject);
   // Fin HPC_201503_CNT
      Procedure dblcdCuentaExit(Sender: TObject);
      Procedure dbdtpFEmisExit(Sender: TObject);
      Procedure dbdtpFVcmtoExit(Sender: TObject);
      Procedure dblcdAuxDropDown(Sender: TObject);
      Procedure dblcdCCostoDropDown(Sender: TObject);
      Procedure dblcClaseDropDown(Sender: TObject);
      Procedure DBLCCLASEExit(Sender: TObject);
      Procedure dblcTDocExit(Sender: TObject);
      Procedure dblcTDiarioEnter(Sender: TObject);
      Procedure bbtnDesContaClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcTMon2Exit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dblcdAuxEnter(Sender: TObject);
      Procedure DBLCCLASENotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcTDiarioNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure bbtnAdmClick(Sender: TObject);
      Procedure SpeedButton1Click(Sender: TObject);
      Procedure bbtnRenumDetClick(Sender: TObject);
   Private
    { Private declarations }
      xmov, cMensaje: String;
      xDigitos, xDigitos1: Integer;
      wNewR: Boolean;
      xMesA, xMesT: String;
      xCuentaStr: String;
      wCiaT: String;
      xFechaT: TDate;
      Procedure Items;
      Procedure MuestraDetalle;
      Procedure GrabaCabecera;
      Procedure GeneraEnLinea401;
      Procedure GrabaSaldos;
      Procedure BuscaTipoCancelacion;
      Procedure CargaDataSource;
   Public
      xcCuadre: String;
      pnlConta: TPanel;
      pbConta: TProgressBar;
      xForma: TForm;
      xCrea: Boolean;
      sAdm: String;
    { Public declarations }
      Procedure CuadraAsiento;
      Function UsuarioBloqueado(xPeriodo, xUsuario: String): Boolean;
   End;

Procedure CNComprobantes; stdcall;

Exports
   CNComprobantes;

Var
   FRegComp: TFRegComp;
   xSaldMNS, xSaldMES, xCuenta, xTDiario, xCtaDes, xTDiarDes, xSQL: String;
   xWhere, xDebeMN, xHabeMN, xDebeME, xHabeME, xSaldMN, xSaldME, xCia, xAno, xMes: String;
   sWhere: String;
   xNoCompAx, xCampo, xGlosa: String;
   xTDebeMN, xTDebeME, xTHabeMN, xTHabeME: DOUBLE;
   xCompNew, xFlagCierre, xRegresa, xFlag, wIns, xCambiaFila: Boolean;
   xTCambio: DOUBLE;
   numreg, nn: Smallint;
   Year, Month, Day: Word;

Implementation

Uses CNTDM, oaCN2000;

{$R *.DFM}

Procedure CNComprobantes;
Var
   xSQL: String;
Begin
   If DMCNT = Nil Then exit;
   If Not DMCNT.DCOM1.Connected Then Exit;
   If Not FVariables.w_CN_Registro Then
   Begin
      Try
         DMCNT.wModo := 'A';
         DMCNT.Filtracds(DMCNT.cdsCabCNT, 'Select * from CNT300 Where CIAID=''ZX'' AND TDIARID=''ZZ''');
         DMCNT.Filtracds(DMCNT.cdsMovCNT1, 'Select * from CNT311 Where CIAID=''ZX'' AND TDIARID=''ZZ''');
         FRegComp := TFRegComp.Create(Application);
         FVariables.w_CN_Registro := True;
         FRegComp.ActiveMDIChild;
         FVariables.ConfiguraForma(Screen.ActiveForm);
      Finally
      End;
   End
   Else
   Begin
      ShowMessage('Opcion en USO');
   End
End;

Procedure TFRegComp.IniciaDatos;
Begin
   wIns := False;
   xFlag := False; // Indica si esta Contabilizado, Anulado o Aceptado
   xRegresa := false; // flag que controla regreso al panel de cabecera
   xFlagCierre := False;

   dblcTMon.Text := DMCNT.wTMonLoc; // Tipo de moneda
   numreg := 0;
   dbeMND.Text := '0';
   dbeMNC.Text := '0';
   dbeMED.Text := '0';
   dbeMEC.Text := '0';
   dbeMNDif.Text := '0';
   dbeMEDif.Text := '0';

   pnlCabecera.Enabled := True;
   pnlDatosCab.Enabled := True;
   pnlMovCNT.Enabled := False;

   dbgMovCNT.ReadOnly := False;

   dblcCia.Enabled := True;
   dtpFComp.Enabled := True;
   cbTCambio.Enabled := True;
   dbeTasa.Enabled := False;
   dblcTDiario.Enabled := True;
   dbeNoComp.Enabled := True;
   dblcTMon.Enabled := True;

   bbtnOKCabec.Enabled := True;
   bbtnBorra.Enabled := True;
   bbtnAnula.Enabled := False;
   bbtnNuevo.Enabled := False;
   bbtnRegresa.Enabled := False;
   bbtnAcepta.Enabled := False;
   bbtnContab.Enabled := False;
   bbtnGraba.Enabled := False;
   bbtnCanc2.Enabled := False;
   bbtnImprime.Enabled := False;
   lblAnulado.Visible := False;
   lblAceptado.Visible := False;
   lblContab.Visible := False;
   lblIncompleto.Visible := False;

   dblcCia.Text := ''; // Código de Compañía
   edtCia.Text := ''; // Descripción de Compañía
   dblcTDiario.Text := ''; // Código de Tipo de Diario
   edtTDiario.Text := ''; // Descripción Tipo de Diario
   dbeLote.Text := ''; // No. Lote
   dbeNoComp.Text := ''; // No. Comprobante
   edtTMon.Text := '';
   dbeTasa.Text := ''; // Tipo de Cambio
   dbeGlosaCab.Text := '';
   dbgMovCNT.Color := clSilver;

//filtra Movimientos Contables
   If DMCNT.wModo = 'A' Then
   Begin /// Para Filtros
      If DMCNT.cdsMovCnt1.Active Then
         DMCNT.cdsMovCnt1.EmptyDataSet;

      dblcCia.SetFocus;
   End; /// Para Filtros
End;

Procedure TFRegComp.dblcCiaExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If (bbtnCanc.Focused) Then exit;
   If xCrea Then Exit;
   edtCia.Text := '';

   If dblcCia.Text <> '' Then edtCia.Text := DMCNT.cdsCia.FieldByName('CIADES').AsString;

   xWhere := 'CiaId=' + '''' + dblcCia.Text + '''';

   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
      Exit;
   End;
   DMCNT.FiltraTablaxCia(DMCNT.cdsTDiario, 'TGE104', 'TDIARID', dblcCia.Text);
End;

Procedure TFRegComp.dtpFCompExit(Sender: TObject);
Var
   xAno: Word;
   xSql: String;
Begin
   If xCrea Then Exit;
   If dblcCia.Focused Then Exit;
   If dblcTDiario.Focused Then Exit;
   xAno := 2001;

   xSql := 'SELECT * '
          +'  FROM TGE154 '
          +' WHERE CIAID=' + quotedstr(dblcCia.text)
          +'   AND ANO=' + quotedstr(Copy(DateToStr(dtpFComp.Date), 7, 4));
   DMCNT.cdsCierres.close;
   DMCNT.cdsCierres.datarequest(xsql);
   DMCNT.cdsCierres.open;
   If DMCNT.cdsCierres.FieldByName('PER' + Copy(DateToStr(dtpFComp.Date), 4, 2)).AsString = 'S' Then
   Begin
      Showmessage('El periodo se encuentra Cerrado');
      dtpFComp.setfocus;
      exit;
   End
   Else
   Begin
      If dtpFComp.date = 0 Then
      Begin
         ShowMessage('Registre la Fecha del Comprobante');
         dtpFComp.SetFocus;
         exit;
      End;

      edtPeriodo.Text := Copy(DateToStr(dtpFComp.Date), 7, 4) + Copy(DateToStr(dtpFComp.Date), 4, 2);

      If (length(edtTDiario.Text) > 0) And (length(edtPeriodo.Text) = 6) Then
      Begin
         If (DMCNT.wModo = 'A') Or (DMCNT.wModo = 'N') Then
         Begin
         // Inicio HPC_201503_CNT
            {
            If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
            Begin
               xWhere := 'SELECT COALESCE( MAX( CNTCOMPROB ), ''0'' ) AS NUMERO FROM CNT300 '
                  + 'WHERE CIAID=' + '''' + dblcCia.Text + ''''
                  + ' and TDIARID=' + '''' + dblcTDiario.Text + ''''
                  + ' and CNTANOMM=' + '''' + edtPeriodo.Text + '''';
            End;

            If SRV_D = 'ORACLE' Then
            Begin
               xWhere := 'SELECT NVL( MAX( CNTCOMPROB ), ''0'' ) AS NUMERO FROM CNT300 '
                  + 'WHERE CIAID=' + '''' + dblcCia.Text + ''''
                  + ' and TDIARID=' + '''' + dblcTDiario.Text + ''''
                  + ' and CNTANOMM=' + '''' + edtPeriodo.Text + '''';
            End;
            }
            xWhere := 'Select nvl(max(CNTCOMPROB),''0'') as NUMERO '
               + '       from CNT300 '
               + '      where CIAID='+quotedstr(dblcCia.Text)
               + '        and TDIARID='+quotedstr(dblcTDiario.Text)
               + '        and CNTANOMM='+quotedstr(edtPeriodo.Text);
         // Fin HPC_201503_CNT

            DMCNT.cdsQry.Close;
            DMCNT.cdsQry.DataRequest(xWhere);
            DMCNT.cdsQry.Open;

            dbeNoComp.Text := Inttostr(StrToInt(DMCNT.cdsQry.FieldByname('NUMERO').AsString) + 1);
            dbeNoComp.Text := DMCNT.strzero(dbeNoComp.Text, 10);
            dbeNoComp.SetFocus;
         End;
      End;
   End;
End;

Procedure TFRegComp.cbTCambioExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtnBorra.Focused Then Exit;

///Determina campo tipo de cambio a aplicar
   xCampo := '';
   If (cbTCambio.Text) = '' Then
   Begin
      cbTCambio.ItemIndex := 0;
      xCampo := 'BV';
   End
   Else
   Begin
      Case cbTCambio.ItemIndex Of
         0: xCampo := 'BV';
         1: xCampo := 'BC';
         2: xCampo := 'PV';
         3: xCampo := 'PC';
         4: xCampo := 'OV';
         5: xCampo := 'OC';
         6:
            Begin
               xCampo := 'OT';
               dbeTasa.Enabled := True;
            End;
      End;
   End;

///Busca Tipo de Cambio de la Fecha///
   If xCampo <> 'OT' Then
   Begin
      xWhere := 'FECHA=' + wRepFuncDate + '''' + formatdatetime(wFormatFecha, dtpFComp.date) + '''' + ')';
      dbeTasa.Text := Floattostrf(DMCNT.DisplayReal('PrvTGE', 'TGE107', 'TCAMV' + xCampo, xWhere, 'TCAMV' + xCampo),
         fffixed, 15, 3);
      If (Length(dbeTasa.Text) = 0) Or (dbeTasa.Text = '0.000') Then
      Begin
         ShowMessage('Error: Fecha NO Tiene Registrado el Tipo de Cambio');
         cbTCambio.SetFocus;
         Exit
      End;
      dbeLote.SetFocus;
   End
   Else
   Begin
      dbeTasa.TabOrder := 6;
      dbeTasa.Enabled := True;
      dbeTasa.SetFocus;
      Exit;
   End;

   If StrToFloat(dbeTasa.text) = 0 Then
      dbeTasa.Enabled := True
   Else
      dbeTasa.Enabled := False;
End;

Procedure TFRegComp.dblcTDiarioExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If dblcCia.Focused Then Exit;

   edtTDiario.Text := '';
   If dblcTDiario.Text <> '' Then edtTDiario.Text := DMCNT.cdsTDiario.FieldByName('TDIARDES').Asstring;
   If length(edtTDiario.Text) = 0 Then
   Begin
      ShowMessage('Falta Definición de Tipo de Diario');
      dblcTDiario.SetFocus;
      Exit;
   End;

   If (DMCNT.wModo = 'C') Or (DMCNT.wModo = 'M') Then exit;

   dtpFComp.SetFocus;
End;

Procedure TFRegComp.dbeNoCompExit(Sender: TObject);
Var
   xSQL : String;
Begin
   If xCrea Then Exit;
   If dblcCia.Focused Then Exit;
   If dblcTDiario.Focused Then Exit;
   If dtpFComp.Focused Then Exit;
   If bbtnBorra.Focused Then Exit;

   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Falta Registrar Compañía');
      dblcCia.SetFocus;
      exit;
   End;
   If length(edtPeriodo.Text) = 0 Then
   Begin
      ShowMessage('Falta Registrar Fecha de Comprobante');
      dtpFComp.SetFocus;
      exit;
   End;
   If length(edtTDiario.Text) = 0 Then
   Begin
      ShowMessage('Falta Registrar Tipo de Diario');
      dblcTDiario.SetFocus;
      exit;
   End;
   If length(dbeNoComp.Text) = 0 Then
   Begin
      ShowMessage('Falta Registrar No. de Comprobante');
      dbeNoComp.SetFocus;
      exit;
   End;

   dbeNoComp.Text := DMCNT.strzero(dbeNoComp.Text, 10);

   sWhere := 'CIAID='+quotedstr(dblcCia.Text)
         + ' and TDIARID='+quotedstr(dblcTDiario.Text)
         + ' and CNTANOMM='+quotedstr(edtPeriodo.Text)
         + ' and CNTCOMPROB='+quotedstr(dbeNoComp.Text);
   xNoCompAx := dbeNoComp.Text;
   If dbeNoComp.Text = DMCNT.DisplayDescrip('prvCNT', 'CNT300', 'CNTCOMPROB', sWhere, 'CNTCOMPROB') Then
   Begin
      xSQL := 'Select nvl(max(CNTCOMPROB), ''0'' ) as NUMERO '
               + '  from CNT300 '
               + ' where CIAID='+quotedstr(dblcCia.Text)
               + '   and TDIARID='+quotedstr(dblcTDiario.Text)
               + '   and CNTANOMM='+quotedstr(edtPeriodo.Text);
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
      dbeNoComp.Text := Inttostr(StrToInt(DMCNT.cdsQry.FieldByname('NUMERO').AsString) + 1);
      dbeNoComp.Text := DMCNT.strzero(dbeNoComp.Text, 10);
      ShowMessage('Número de Comprobante ' + xNoCompAx + ' ya fue registrado en otro asiento ' + chr(13)
                + 'El nuevo número asignado será ' + dbeNoComp.Text);
   End;

   dbeLote.Enabled := True;
   dbeGlosaCab.Enabled := True;

   dblcCia.Enabled := False;
   dtpFComp.Enabled := False;
   dblcTDiario.Enabled := False;
   dbeNoComp.Enabled := False;
   DMCNT.cdsMovCnt1.EnableControls;
   dbgMovCNT.DataSource := DMCNT.dsMovCNT1;
   dblcTMon.SetFocus;
   xCompNew := True;
End;

Procedure TFRegComp.dbeLoteExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If dbeLote.Text <> '' Then dbeLote.Text := DMCNT.strzero(dbeLote.Text, 4);
End;

Procedure TFRegComp.dblcTMonExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtnBorra.Focused Then Exit;

   edtTMon.Text := '';
   xWhere := 'TMonId=' + '''' + dblcTMon.Text + '''';
   edtTMon.Text := DMCNT.DisplayDescrip('PrvTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
   If edtTMon.Text = '' Then
   Begin
      ShowMessage('Falta Tipo de Moneda');
      dblcTMon.SetFocus;
   End;
End;

Procedure TFRegComp.bbtnBorraClick(Sender: TObject);
Begin
   If DMCNT.wModo = 'M' Then
   Begin
      DMCNT.cdsCabCnt.CancelUpdates;
      dbeGlosaCab.SetFocus;
   End
   Else
   Begin
      DMCNT.cdsMovCnt1.CancelUpdates;
      DMCNT.wModo := 'A';
      IniciaDatos;
      dblcCia.SetFocus;
   End;
End;

Procedure TFRegComp.bbtnOKCabecClick(Sender: TObject);
Var
   sSQL: String;
Begin
// consistencia ingreso de No.Comprobante
   If length(dbeNoComp.Text) = 0 Then
   Begin
      ShowMessage('Falta No.Comprobante');
      Exit;
   End;
   If dbeNoComp.Text = '0000000000' Then
   Begin
      showmessage('Falta No.Comprobante');
      Exit;
   End;

// consistencia ingreso de Tipo de Moneda
   If length(dblcTMon.Text) = 0 Then
   Begin
      ShowMessage('Falta Tipo de Moneda');
      Exit;
   End;
   If length(edtTMon.Text) = 0 Then
   Begin
      ShowMessage('Tipo de Moneda Errado');
      Exit;
   End;

// consistencia ingreso de Tipo de Cambio
   If (Length(dbeTasa.Text) = 0) Or (StrToFloat(dbeTasa.Text) = 0.00) Then
   Begin
      ShowMessage('Falta Tipo de Cambio');
      Exit;
   End;

   xTCambio := strtofloat(dbeTasa.Text);

   If UsuarioBloqueado(edtPeriodo.Text, DMCNT.wUsuario) Then
   Begin
      ShowMessage(' Usuario ' + DMCNT.wUsuario + ', fue bloqueado para registrar en este periodo ' + edtPeriodo.Text + '.' + #13 + #13 + 'Consulte al area de Contabilidad...');
      exit;
   End;

   xSigueGrab := True;
   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   GrabaCabecera;
   if not xSigueGrab then
   begin
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
      exit;
   end;
   DMCNT.DCOM1.AppServer.GrabaTransaccion;
   sWhere := 'CIAID='+quotedstr(dblcCia.Text)
         + ' and TDIARID='+quotedstr(dblcTDiario.Text)
         + ' and CNTANOMM='+quotedstr(edtPeriodo.Text)
         + ' and CNTCOMPROB='+quotedstr(dbeNoComp.Text);
   If (wCiaT <> dblcCia.text) Or (Not DMCNT.cdsCuenta.Active) Then
   Begin

      DMCNT.cdsCuenta.Close;
      DMCNT.cdsCuenta.PacketRecords := 100;

      DMCNT.cdsCuenta.FetchOnDemand := False;

      sSQL := 'Select CUENTAID, CTADES, CTAAUT1, CIAID, CTAABR, CTA_MOV, CTA_AUX, '
            + '       CTA_DOC, CTA_CCOS, CTA_ME, FLGVAR, CTA_DEST, CTA_DET, CTA_DIFC, REGSOLOME '
            + '  from TGE202 '
            + ' where CIAID=' + QuotedStr(dblcCia.text)
            + '   and CTAACT=''S'' ';
      DMCNT.cdsCuenta.DataRequest(sSQL);
      DMCNT.cdsCuenta.Open;
      DMCNT.cdsCuenta.FetchOnDemand := True;
      DMCNT.cdsCuenta.IndexFieldNames := 'CUENTAID';
      wCiaT := dblcCia.text;
      DMCNT.FiltraTablaxCia(DMCNT.cdsCuenta, 'TGE202', 'CUENTAID', dblcCia.Text);
   End;

   bbtnRegresa.Enabled := True;
   bbtnCanc2.Enabled := True;
   xGlosa := dbeGlosaCab.Text;

   If Not xRegresa Then
   Begin
      DMCNT.cdstdoc.Filter := '';
      DMCNT.cdsTDoc.Filtered := True;

      sSQL:= ' Select * '
            + '  from CNT300 ' ;
      sSQL:= sSQL + ' WHERE ' + sWhere ;
      DMCNT.cdsCabCnt.Close;
      DMCNT.cdsCabCnt.DataRequest(sSQL);
      DMCNT.cdsCabCnt.Open;
      numreg:= DMCNT.cdsCabCnt.RecordCount;
      
      
      If numreg > 0 Then
      Begin
         DMCNT.cdsCabCnt.First;
         bbtnImprime.Enabled := True;
         If (DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString = 'S') Or
            (DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString = 'A') Or
            (DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString = 'P') Then
         Begin
            bbtnNuevo.Enabled := True;
            If DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString = 'A' Then
            Begin
               lblAnulado.Visible := True;
               bbtnAnula.Enabled := False;
               bbtnGraba.Enabled := False;
               bbtnAcepta.Enabled := False;
               bbtnContab.Enabled := False;
               dbgMovCNT.ReadOnly := True;
               ShowMessage(' Registro Fue ANULADO ')
            End;
            If (DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString = 'P') And (DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString <> 'S') Then
            Begin
               lblAceptado.Visible := True;
               bbtnAnula.Enabled := False;
               bbtnGraba.Enabled := False;
               bbtnAcepta.Enabled := False;
               bbtnContab.Enabled := True;
               dbgMovCNT.ReadOnly := True;
               ShowMessage(' Registro Fue Aceptado ');
            End;
            If DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString = 'S' Then
            Begin
               lblContab.Visible := True;
               bbtnAnula.Enabled := False;
               bbtnGraba.Enabled := False;
               bbtnAcepta.Enabled := False;
               bbtnContab.Enabled := False;
               dbgMovCNT.ReadOnly := True;
               ShowMessage(' Registro Fue Contabilizado ');
            End;
         End
         Else
         Begin // en caso q' no sea Contabilizado, Aceptado (P) o Anulado
                    // se asume que es I=Incompleto o Activo
            lblIncompleto.Visible := True;
            bbtnAnula.Enabled := True;
            bbtnAcepta.Enabled := True;
            bbtnGraba.Enabled := True;
         End;
      End
      Else
      Begin // si no encontro registros en el filtro
         bbtnAnula.Enabled := False;
         bbtnAcepta.Enabled := False;
         bbtnGraba.Enabled := True;
      End;
   End;

   xFechaT := dtpfComp.date;

   pnlCabecera.Enabled := false;
   bbtnOKCabec.Enabled := false;
   bbtnBorra.Enabled := false;
   pnlMovCNT.Enabled := True;
   dbgMovCNTIButton.Enabled := True;
   dbgMovCNT.Color := $00F4F4F4;

   If DMCNT.wModo = 'A' Then
      dbgMovCNTIButton.OnClick(sender);
End;

Procedure TFRegComp.FormClose(Sender: TObject; Var Action: TCloseAction);
var
   xSQL : String;
Begin
   If (DMCNT.cdsMovCnt1.RecordCount = 0) And
      ((DMCNT.cdsCabCNT.FieldByName('CNTESTADO').AsString = 'I') or
       (DMCNT.cdsCabCNT.FieldByName('CNTESTADO').AsString = '')) Then
   Begin
      xSQL := 'Delete from CNT300 '
             +' where CIAID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString)
             +'   and TDIARID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString)
             +'   and CNTANOMM='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString)
             +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString);
      Try
         DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      Except
         ShowMessage('No se pudo actualizar la cabecera al Salir');
         exit;
      end;
   End;
   DMCNT.cdsCabCNT.CancelUpdates;

// Inicio HPC_201501_CNT
   DMCNT.cdsCuenta.Filter := '';
   DMCNT.cdsCuenta.Filtered := False;
   DMCNT.cdsCCosto.Filter := '';
   DMCNT.cdsCCosto.Filtered := False;
   DMCNT.cdsAuxiliar.Filter := '';
   DMCNT.cdsAuxiliar.Filtered := False;

   xCrea := True;

   FVariables.w_CN_Registro := False;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;

   DMCNT.cdsMOVCNT1.Filter := '';
   DMCNT.cdsMOVCNT1.Filtered := False;
   DMCNT.cdsMOVCNT1.IndexFieldNames:='';
   DMCNT.cdsMOVCNT1.Close;
   DMCNT.cdsMOVCNT.Filter := '';
   DMCNT.cdsMOVCNT.Filtered := False;
   DMCNT.cdsMOVCNT.IndexFieldNames:='';
   DMCNT.cdsMOVCNT.Close;
// Fin HPC_201501_CNT

   Action := caFree;
End;

Procedure TFRegComp.dbgMovCNTIButtonClick(Sender: TObject);
Begin
   // xFlag.... Indica si esta Contabilizado o Anulado o Aceptado
   If xFlag Or xFlagCierre Then exit; // Detalle no modificable

   If DMCNT.cdsCabCnt.FieldByName('MODULO').AsString <> 'CNT' Then
   Begin
      If DMCNT.cdsCabCnt.FieldByName('MODULO').AsString <> 'ALM' Then
      Begin
         ShowMessage('No se puede Insertar. Módulo ' + DMCNT.cdsCabCnt.FieldByName('MODULO').AsString);
         Exit;
      End;
   End;

   wIns := True;
   pnlMovCnt.Enabled := False;
   pnlMantComp.Visible := True;

   RegNuevo;
   dblcdCuenta.SetFocus;
End;

Procedure TFRegComp.RegNuevo;
Begin
   If DMCNT.cdsMovCnt1.IndexFieldNames <> 'CNTREG' Then
      DMCNT.cdsMovCnt1.IndexFieldNames := 'CNTREG';

   DMCNT.cdsMovCnt1.Last;
   numreg := DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger + 1;

   edtCuenta.Text := '';
   edtAux.Text := '';
   dbeTDoc.Text := '';
   dbeCCosto.Text := '';
   // si numreg=1 es porque ya se hizo un Insert previo y ahora solo aplica Edit
   // if numreg=1 then DMCNT.cdsMovCnt1.Edit else DMCNT.cdsMovCnt1.Insert;

   DMCNT.cdsMovCnt1.Append;
   DMCNT.cdsMovCnt1.FieldByName('CIAID').AsString := dblcCia.Text;
   DMCNT.cdsMovCnt1.FieldByName('TDIARID').AsString := dblcTDiario.Text;
   DMCNT.cdsMovCnt1.FieldByName('CNTCOMPROB').AsString := dbeNoComp.Text;
   DMCNT.cdsMovCnt1.FieldByName('CNTANO').AsString := copy(edtPeriodo.Text, 1, 4);
   DMCNT.cdsMovCnt1.FieldByName('CNTANOMM').AsString := edtPeriodo.Text;
   DMCNT.cdsMovCnt1.FieldByName('CNTLOTE').AsString := dbeLote.Text;
   DMCNT.cdsMovCnt1.FieldByName('TMONID').AsString := dblcTMon.Text;
   DMCNT.cdsMovCnt1.FieldByName('CNTTCAMBIO').AsFloat := StrToFloat(dbeTasa.Text);
   DMCNT.cdsMovCnt1.FieldByName('CNTTS').AsString := xCampo;
   DMCNT.cdsMovCnt1.FieldByName('CNTMODDOC').AsString := DMCNT.cdsTDoc.FieldByname('DOCMOD').AsString;
   DMCNT.cdsMovCnt1.FieldByName('CNTFCOMP').AsDateTime := dtpFComp.Date;
   DMCNT.cdsMovCnt1.FieldByName('CNTFEMIS').AsDateTime := xFechaT; //dtpFComp.Date;
   DMCNT.cdsMovCnt1.FieldByName('CNTFVCMTO').AsDateTime := xFechaT; //dtpFComp.Date;
   DMCNT.cdsMovCnt1.FieldByName('CNTESTADO').AsString := 'I'; // I=Incompleto
   DMCNT.cdsMovCnt1.FieldByName('CNTUSER').AsString := DMCNT.wUsuario; // usuario que registra
   DMCNT.cdsMovCnt1.FieldByName('CNTFREG').AsDateTime := date; // fecha que registra usuario
   DMCNT.cdsMovCnt1.FieldByName('CNTHREG').AsDateTime := time; // hora que registra usuario
   DMCNT.cdsMovCnt1.FieldByName('CNTGLOSA').AsString := xGlosa;
   DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger := numreg;
   DMCNT.cdsMovCnt1.FieldByName('MODULO').AsString := DMCNT.wModulo;

   DMCNT.cdsMovCnt1.FieldByName('CNTMM').AsString := DMCNT.cdsCabCNT.FieldByName('CNTMM').AsString;
   DMCNT.cdsMovCnt1.FieldByName('CNTDD').AsString := DMCNT.cdsCabCNT.FieldByName('CNTDD').AsString;
   DMCNT.cdsMovCnt1.FieldByName('CNTTRI').AsString := DMCNT.cdsCabCNT.FieldByName('CNTTRI').AsString;
   DMCNT.cdsMovCnt1.FieldByName('CNTSEM').AsString := DMCNT.cdsCabCNT.FieldByName('CNTSEM').AsString;
   DMCNT.cdsMovCnt1.FieldByName('CNTSS').AsString := DMCNT.cdsCabCNT.FieldByName('CNTSS').AsString;
   DMCNT.cdsMovCnt1.FieldByName('CNTAATRI').AsString := DMCNT.cdsCabCNT.FieldByName('CNTAATRI').AsString;
   DMCNT.cdsMovCnt1.FieldByName('CNTAASEM').AsString := DMCNT.cdsCabCNT.FieldByName('CNTAASEM').AsString;
   DMCNT.cdsMovCnt1.FieldByName('CNTAASS').AsString := DMCNT.cdsCabCNT.FieldByName('CNTAASS').AsString;

// Inicio HPC_201503_CNT
   DMCNT.cdsMovCnt1.Post;
// Fin HPC_201503_CNT

   dbeTCamb.Text := dbeTasa.Text;
   pnlMantComp.SetFocus;
End;

Procedure TFRegComp.bbtnGrabaClick(Sender: TObject);
Var
   xTDebe, xTHaber: DOUBLE;
   xNoCuadra : Boolean;
Begin
   If Not DMCNT.Accesos_a_Registros(DMCNT.cdsCabCnt.FieldByName('CNTUSER').AsString) Then
      Exit;

   If (DMCNT.cdsMovCnt1.RecordCount <= 1) And (DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat <= 0) Then
   Begin
      ShowMessage(' Error :  Falta Registrar Detalle ');
      Raise exception.Create(' Error :  Falta Registrar Detalle ');
   End;

   if not VALIDA_Cuenta_y_CCosto then exit;

   Screen.Cursor := CrHourGlass;

   xNoCuadra := True;
   If Not AsientoCuadra Then
   Begin
      If MessageDlg('No hay coincidencia entre Debe y Haber' + chr(13)
         + '      ¿Continuar con Grabación?       ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
      Begin
         DMCNT.cdsMovCnt1.EnableControls;
         dbgMovCNT.SelectedIndex := 0;
         Screen.Cursor := CrDefault;
         exit;
      End;
   End
   Else
      xNoCuadra := False;

// Inicio HPC_201503_CNT
// se individualiza el control de grabación
   {
   Try
      sWhere := 'CIAID='+quotedstr(dblcCia.Text)
         + ' and TDIARID='+quotedstr(dblcTDiario.Text)
         + ' and CNTANOMM='+quotedstr(edtPeriodo.Text)
         + ' and CNTCOMPROB='+quotedstr(dbeNoComp.Text);

      DMCNT.DCOM1.AppServer.IniciaTransaccion;

      xSQL := 'Update CNT300 '
             +'   set FLAGVAR=null, '
             +'       CNTDEBEMN='+(dbeMND.Text)+','
             +'       CNTDEBEME='+(dbeMNC.Text)+','
             +'       CNTHABEMN='+(dbeMED.Text)+','
             +'       CNTHABEME='+(dbeMEC.Text)+','
             +'       CNTUSER='''+(DMCNT.wUsuario)+''','
             +'       CNTFREG=trunc(sysdate),'
             +'       CNTHREG=sysdate '
             +' where ' + sWhere ;

      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

      DMCNT.cdsMovCnt1.DisableControls;

      DMCNT.cdsMovCNT1.first;
      While Not DMCNT.cdsMovCNT1.eof Do
      Begin
         If DMCNT.cdsMovCNT1.fieldbyname('CNTMODDOC').asstring = 'CXP' Then
         Begin
            xSQL := 'UPDATE CXP302 '
                  + '   SET CUENTAID=''' + DMCNT.cdsMovCNT1.fieldbyname('CUENTAID').asstring + ''', '
                  + '       CCOSID=''' + DMCNT.cdsMovCNT1.fieldbyname('CCOSID').asstring + ''' '
                  + ' WHERE CIAID='+quotedstr(dblcCia.Text)
                  + '   AND TDIARID='+quotedstr(dblcTDiario.Text)
                  + '   AND DCPANOMM='+quotedstr(edtPeriodo.Text)
                  + '   AND CPNOREG='+quotedstr(dbeNoComp.Text)
                  + '   AND DCPREG=' + DMCNT.cdsMovCNT1.fieldbyname('CNTREG').asstring;

            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         End;

         If DMCNT.cdsCabCNT.fieldbyname('MODULO').asstring = 'CXC' Then
         Begin
            xSQL := 'UPDATE CXC302 '
                  + '   SET CUENTAID=''' + DMCNT.cdsMovCNT1.fieldbyname('CUENTAID').asstring + ''', '
                  + '       CCOSID=''' + DMCNT.cdsMovCNT1.fieldbyname('CCOSID').asstring + ''' '
                  + ' WHERE CIAID='+quotedstr(dblcCia.Text)
                  + '   AND TDIARID='+quotedstr(dblcTDiario.Text)
                  + '   AND CCANOMES='+quotedstr(edtPeriodo.Text)
                  + '   AND CCNOREG='+quotedstr(dbeNoComp.Text)
                  + '   AND CCREG=' + DMCNT.cdsMovCNT1.fieldbyname('CNTREG').asstring;

               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         End;
         DMCNT.cdsMovCNT1.next;
      End;

      DMCNT.cdsMovCNT1.first;
      While Not DMCNT.cdsMovCNT1.eof Do
      Begin
         If DMCNT.cdsCabCNT.fieldbyname('MODULO').asstring = 'CAJA' Then
         Begin
            BuscaTipoCancelacion;
         End;
         DMCNT.cdsMovCNT1.Next;
      End;
      //fin de agregacion
      DMCNT.cdsMovCnt1.EnableControls;

      DMCNT.DCOM1.AppServer.GrabaTransaccion;
      dbgMovCNT.ReadOnly := False;
      Screen.Cursor := CrDefault;
      ShowMessage(' Registro de Comprobante Grabado ');
   Except
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := CrDefault;
      ShowMessage('No se puede Grabar el Comprobante');
      exit;
   End;
   }
   sWhere := 'CIAID='+quotedstr(dblcCia.Text)
      + ' and TDIARID='+quotedstr(dblcTDiario.Text)
      + ' and CNTANOMM='+quotedstr(edtPeriodo.Text)
      + ' and CNTCOMPROB='+quotedstr(dbeNoComp.Text);

   DMCNT.DCOM1.AppServer.IniciaTransaccion;

   xSQL := 'Update CNT300 '
          +'   set FLAGVAR=null, '
          +'       CNTDEBEMN='+(dbeMND.Text)+','
          +'       CNTDEBEME='+(dbeMNC.Text)+','
          +'       CNTHABEMN='+(dbeMED.Text)+','
          +'       CNTHABEME='+(dbeMEC.Text)+','
          +'       CNTUSER='''+(DMCNT.wUsuario)+''','
          +'       CNTFREG=trunc(sysdate),'
          +'       CNTHREG=sysdate '
          +' where ' + sWhere ;
   try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
   except
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
      Screen.Cursor := CrDefault;
      ShowMessage('No se puede Grabar la cabecera del Comprobante');
      exit;
   End;

   DMCNT.cdsMovCnt1.DisableControls;

   DMCNT.cdsMovCNT1.first;
   While Not DMCNT.cdsMovCNT1.eof Do
   Begin
      If DMCNT.cdsMovCNT1.fieldbyname('CNTMODDOC').asstring = 'CXP' Then
      Begin
         xSQL := 'UPDATE CXP302 '
               + '   SET CUENTAID=''' + DMCNT.cdsMovCNT1.fieldbyname('CUENTAID').asstring + ''', '
               + '       CCOSID=''' + DMCNT.cdsMovCNT1.fieldbyname('CCOSID').asstring + ''' '
               + ' WHERE CIAID='+quotedstr(dblcCia.Text)
               + '   AND TDIARID='+quotedstr(dblcTDiario.Text)
               + '   AND DCPANOMM='+quotedstr(edtPeriodo.Text)
               + '   AND CPNOREG='+quotedstr(dbeNoComp.Text)
               + '   AND DCPREG=' + DMCNT.cdsMovCNT1.fieldbyname('CNTREG').asstring;
         try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         except
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := CrDefault;
            ShowMessage('No se puede Actualizar el Detalle la Cuenta por Pagar del Registro = '+DMCNT.cdsMovCNT1.fieldbyname('CNTREG').asstring);
            exit;
         End;
      End;

      If DMCNT.cdsCabCNT.fieldbyname('MODULO').asstring = 'CXC' Then
      Begin
         xSQL := 'UPDATE CXC302 '
               + '   SET CUENTAID=''' + DMCNT.cdsMovCNT1.fieldbyname('CUENTAID').asstring + ''', '
               + '       CCOSID=''' + DMCNT.cdsMovCNT1.fieldbyname('CCOSID').asstring + ''' '
               + ' WHERE CIAID='+quotedstr(dblcCia.Text)
               + '   AND TDIARID='+quotedstr(dblcTDiario.Text)
               + '   AND CCANOMES='+quotedstr(edtPeriodo.Text)
               + '   AND CCNOREG='+quotedstr(dbeNoComp.Text)
               + '   AND CCREG=' + DMCNT.cdsMovCNT1.fieldbyname('CNTREG').asstring;
         try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         except
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := CrDefault;
            ShowMessage('No se puede Actualizar el Detalle la Cuenta por Cobrar del Registro = '+DMCNT.cdsMovCNT1.fieldbyname('CNTREG').asstring);
            exit;
         End;
      End;
      DMCNT.cdsMovCNT1.next;
   End;

   DMCNT.cdsMovCNT1.first;
   While Not DMCNT.cdsMovCNT1.eof Do
   Begin
      If DMCNT.cdsCabCNT.fieldbyname('MODULO').asstring = 'CAJA' Then
      Begin
         xSigueGrab := True;
         BuscaTipoCancelacion;
         if not xSigueGrab then
         Begin
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            Screen.Cursor := CrDefault;
            ShowMessage('No se puede Actualizar los movimientos operativos del módulo de Caja/Bancos del Registro = '+DMCNT.cdsMovCNT1.fieldbyname('CNTREG').asstring);
            exit;
         End;
      End;
      DMCNT.cdsMovCNT1.Next;
   End;
   //fin de agregacion
   DMCNT.cdsMovCnt1.EnableControls;

   DMCNT.DCOM1.AppServer.GrabaTransaccion;
   dbgMovCNT.ReadOnly := False;
   Screen.Cursor := CrDefault;
   ShowMessage(' Registro de Comprobante Grabado ');

// Fin HPC_201503_CNT
   bbtnAcepta.Enabled := False;
   bbtnImprime.Enabled := True;
   bbtnRegresa.Enabled := True;
   if xNoCuadra then
   begin
      bbtnAnula.Enabled := False;
      bbtnNuevo.Enabled := False;
      bbtnContab.Enabled := False;
      bbtnCanc2.Enabled := True;
   end
   Else
   begin
      bbtnAnula.Enabled := True;
      bbtnNuevo.Enabled := True;
      bbtnContab.Enabled := True;
      bbtnCanc2.Enabled := False;
   end;

   MuestraEstado(DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString, DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString);
   If DMCNT.wTipoAdicion = 'xFiltro' Then
      DMCNT.ActualizaFiltro(FRegistro.GComprobante, DMCNT.cdsCabCNT, DMCNT.wModo);
End;

Procedure TFRegComp.MuestraEstado(xMovEstado, xMovConta: String);
Begin
   lblAceptado.Visible := False;
   lblIncompleto.Visible := False;
   lblContab.Visible := False;
   lblAnulado.Visible := False;

   If xMovConta = 'S' Then
   Begin
      lblContab.Visible := True;
      bbtnContab.enabled := False;
   End
   Else
   Begin
      If xMovEstado = 'A' Then lblAnulado.Visible := true;
      If xMovEstado = 'P' Then lblAceptado.Visible := True;
      If xMovEstado = 'I' Then lblIncompleto.Visible := True;
   End;
End;

Procedure TFRegComp.bbtnRegresaClick(Sender: TObject);
Begin
   bbtnRegresa.Enabled := False;
   pnlMovCNT.Enabled := False;
   dbgMovCNT.Color := clSilver;
   pnlCabecera.Enabled := true;
   bbtnOKCabec.Enabled := True;
   bbtnBorra.Enabled := True;
   xRegresa := true;
End;

Procedure TFRegComp.bbtnCanc2Click(Sender: TObject);
Begin
// Botón que cancela datos de las Actualizaciones del Detalle
   DMCNT.cdsMovCnt1.CancelUpdates;
   TotalesResumen;
   bbtnCanc2.Enabled := False;
   dbeTasa.Text := floattostrf(xTCambio, ffFixed, 15, 4);
   bbtnRegresa.Click;
End;

Procedure TFRegComp.bbtnContabClick(Sender: TObject);
var
   xSQL : String;
   xxSQL : String;
Begin
   xcCuadre := 'S';

   If DMCNT.MesCerrado(copy(edtPeriodo.text, 5, 2), copy(edtPeriodo.text, 1, 4), dblcCia.text) Then
   Begin
      ShowMessage(' Mes cerrado, no se puede contabilizar');
      exit;
   End;

   If UsuarioBloqueado(edtPeriodo.Text, DMCNT.wUsuario) Then
   Begin
      ShowMessage(' Usuario ' + DMCNT.wUsuario + ', fue bloqueado para registrar en este periodo ' + edtPeriodo.Text + '.' + #13 + #13 + 'Consulte al area de Contabilidad...');
      exit;
   End;

   If Not DMCNT.Accesos_a_Registros(DMCNT.cdsCabCnt.FieldByName('CNTUSER').AsString) Then
      Exit;

   //// Contabilización en Linea: requiere que en el DM del módulo exista cdsMOVCNT2 (mismo nombre)
   //// cds1 y cds2 deben hacer referencia a la tabla CNT301
   If MessageDlg(' Contabilizar Comprobante' + chr(13) + chr(13) +
      '     ¿ Esta Seguro ?     ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then exit;

   If Not AsientoCuadra Then
   Begin
      ShowMessage(' Error al Contabilizar.  Asiento No Cuadra.....! ');
      exit;
   End;

   If DMCNT.cdsCabCNT.FieldByName('CNTCUADRE').AsString = 'S' Then
   Begin
      ShowMessage('Revisar las Cuentas Asiento ya fue Contabilizado....... ');
      exit;
   End;

   if not VALIDA_Cuenta_y_CCosto then exit;

   Screen.Cursor := CrHourGlass;

   Errorcount := 0;

// Inicio HPC_201601_CNT
// 18/01/2016: Borra datos de Tabla CNT301 para que no genere duplicidad en Contabilización

   xxSQL := ' Select CNTCOMPROB from CNT301 '
          + '  where CIAID = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString)
          + '    and CNTANOMM = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString)
          + '    and TDIARID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString)
          + '    and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString);
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xxSql);
   DMCNT.cdsQry.Open;
   if DMCNT.cdsQry.RecordCount>0 then
   Begin
      xxSQL := ' Delete from CNT301 '
             + ' where CIAID = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString)
             + '   and CNTANOMM = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString)
             + '   and TDIARID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString)
             + '   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString);
      Try
         DMCNT.DCOM1.AppServer.EjecutaQry(xxSQL);
      Except
         ShowMessage('No se pudo borrar registro de CNT301');
         exit;
      end;
   End;
// Fin HPC_201601_CNT

    xxSQL := ' select ciaid,tdiarid,cntanomm,cntcomprob,cntreg,count(cntreg) Cantidad '
           + '  from CNT311 '
           + ' where CIAID = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString)
           + '   and CNTANOMM = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString)
           + '   and TDIARID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString)
           + '   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString)
           + '   group by ciaid,tdiarid,cntanomm,cntcomprob,cntreg '
           + '   Having Count(cntreg)> 1 ';
    DMCNT.cdsQry.Close;
    DMCNT.cdsQry.DataRequest(xxSql);
    DMCNT.cdsQry.Open;

    DMCNT.cdsQry.First;
    If DMCNT.cdsQry.RecordCount > 0 Then
    Begin
       bbtnRenumDet.click;
    End;


   DMCNT.cdsMovCNT1.cancel;

   xSQL := 'Select * from CNT311 '
          +' where '+sWhere;
   DMCNT.cdsMovCNT1.Close;
   DMCNT.cdsMovCNT1.DataRequest(xSQL);
   DMCNT.cdsMovCNT1.Open;

   xSQL := 'Select * from CNT300 '
          +' where '+sWhere;
   DMCNT.cdsCabCNT.Close;
   DMCNT.cdsCabCNT.DataRequest(xSQL);
   DMCNT.cdsCabCNT.Open;

   xSigueGrab := True;
   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   CuadraAsiento;
   if not xSigueGrab then
   begin
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
      exit;
   end;

   If SOLConta(dblcCia.Text, dblcTDiario.Text, edtPeriodo.Text, dbeNocomp.Text,
      SRV_D, 'C', DMCNT.wModulo, DMCNT.cdsMovCNT1, DMCNT.cdsNivel,
      DMCNT.cdsResultSet, DMCNT.DCOM1, Self) Then
   Begin
      dbgMovCNT.ReadOnly := True;

      TotalesResumen;

      DMCNT.cdsCabCnt.Edit;
      DMCNT.cdsCabCnt.FieldByName('FLAGVAR').Clear;
      DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString := 'S';
      DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString := 'P';
      DMCNT.cdsCabCnt.FieldByName('CNTDEBEMN').AsFloat := DMCNT.FRound(strtofloat(dbeMND.Text), 15, 2);
      DMCNT.cdsCabCnt.FieldByName('CNTHABEMN').AsFloat := DMCNT.FRound(strtofloat(dbeMNC.Text), 15, 2);
      DMCNT.cdsCabCnt.FieldByName('CNTDEBEME').AsFloat := DMCNT.FRound(strtofloat(dbeMED.Text), 15, 2);
      DMCNT.cdsCabCnt.FieldByName('CNTHABEME').AsFloat := DMCNT.FRound(strtofloat(dbeMEC.Text), 15, 2);
      DMCNT.cdsCabCnt.FieldByName('DOCMOD').AsString := DMCNT.cdsTDoc.FieldByname('DOCMOD').AsString;
      DMCNT.cdsCabCnt.FieldByName('CNTUSER').AsString := DMCNT.wUsuario; // usuario que registra
      DMCNT.cdsCabCnt.FieldByName('CNTFREG').AsDateTime := date; // fecha que registra usuario
      DMCNT.cdsCabCnt.FieldByName('CNTHREG').AsdateTime := time; // hora que registra usuario

      DMCNT.cdsCabCnt.Post;
      xSQL := 'Update CNT300 '
             +'   set FLAGVAR = null,'
             +'       CNTCUADRE = '+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString)+','
             +'       CNTESTADO = '+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString)+','
             +'       CNTDEBEMN = '+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTDEBEMN').AsFloat)+','
             +'       CNTHABEMN = '+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTHABEMN').AsFloat)+','
             +'       CNTDEBEME = '+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTDEBEME').AsFloat)+','
             +'       CNTHABEME = '+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTHABEME').AsFloat)+','
             +'       DOCMOD = '+quotedstr(DMCNT.cdsCabCnt.FieldByName('DOCMOD').AsString)+','
             +'       CNTUSER = '+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTUSER').AsString)+','
             +'       CNTFREG = trunc(sysdate), '
             +'       CNTHREG = sysdate '
             +' where CIAID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString)
             +'   and TDIARID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString)
             +'   and CNTANOMM='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString)
             +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString);
      Try
         DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      Except
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo actualizar la cabecera del asiento en la Contabilización');
         exit;
      end;
      DMCNT.DCOM1.AppServer.GrabaTransaccion;

      DMCNT.cdsMovCnt1.First;

      MuestraEstado(DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString, DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString);
      bbtnGraba.Enabled := False;
      bbtnContab.Enabled := False;
      bbtnDesConta.Enabled := True;
      bbtnAnula.Enabled := False;
      dbgMovCNTIButton.Enabled := False;
      bbtnDesConta.Enabled := True;
      Screen.Cursor := CrDefault;
      If DMCNT.wTipoAdicion = 'xFiltro' Then
         DMCNT.ActualizaFiltro(FRegistro.GComprobante, DMCNT.cdsCabCNT, DMCNT.wModo);
      ShowMessage('Asiento Contabilizado');
   End
   Else
   Begin
      bbtnDesConta.Enabled := false;
      Screen.Cursor := CrDefault;
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   End;
End;

Function TFRegComp.AsientoCuadra: Boolean;
Var
   xTDebe, xTHaber: DOUBLE;
Begin
   Result := False;
   xTDebe := 0;
   xTHaber := 0;
   DMCNT.cdsMovCnt1.DisableControls;
   DMCNT.cdsMovCnt1.First;
   While Not DMCNT.cdsMovCnt1.eof Do
   Begin
      If dblcTMon.Text = DMCNT.wTmonLoc Then
      Begin
         If DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString = 'D' Then
            xTDebe := xTDebe + DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat
         Else
            xTHaber := xTHaber + DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat;
      End
      Else
      Begin
         If DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString = 'D' Then
            xTDebe := xTDebe + DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat
         Else
            xTHaber := xTHaber + DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat;
      End;
      DMCNT.cdsMovCnt1.Next;
   End;
   DMCNT.cdsMovCnt1.First;
   DMCNT.cdsMovCnt1.EnableControls;
   If DMCNT.FRound(xTDebe, 15, 2) = DMCNT.FRound(xTHaber, 15, 2) Then Result := True;
End;

Function TFRegComp.Valida_Cuenta_y_CCosto: Boolean;
Var
   xSQL, cFlAux, cFLCC: String;
Begin
   Result := False;

   DMCNT.cdsMovCnt1.DisableControls;
   DMCNT.cdsMovCnt1.First;
   While Not DMCNT.cdsMovCnt1.eof Do
   Begin
      xSQL := 'Select CIAID, CUENTAID, CTAACT, CTA_AUX, CTA_CCOS '
             +'  from TGE202 '
             +' where CIAID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CIAID').AsString)
             +'   and CUENTAID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CUENTAID').AsString)
             +'   and CTAACT=''S'' ';
      DMCNT.cdsSQL.Close;
      DMCNT.cdsSQL.DataRequest(xSQL);
      DMCNT.cdsSQL.Open;
      If DMCNT.cdsSQL.Recordcount <= 0 Then
      Begin
         ShowMessage('Registro : '+inttostr(DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger)+chr(13)+
                     'Cuenta Contable: ' + DMCNT.cdsMovCnt1.FieldByName('CUENTAID').AsString + ' NO se puede Usar. Revisar');
         DMCNT.cdsMovCnt1.EnableControls;
         Exit;
      End;

      cFlAux := DMCNT.cdsSQL.FieldByName('CTA_AUX').AsString;
      cFLCC := DMCNT.cdsSQL.FieldByName('CTA_CCOS').AsString;

   // Valida Centro de Costo
      If cFLCC='S' then
      Begin
      // revisar si centro de costo esta en blanco
         If DMCNT.cdsMovCnt1.FieldByName('CCOSID').AsString = '' Then
         Begin
            ShowMessage('Registro : '+inttostr(DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger)+chr(13)
                       +'Cuenta Contable: ' + DMCNT.cdsMovCnt1.FieldByName('CUENTAID').AsString + ', necesita Centro de Costo. Revisar');
            DMCNT.cdsMovCnt1.EnableControls;
            Exit;
         End;

      // revisar si centro de costo existe y esta activo
         xSQL := 'Select CCOSID, CCOSACT '
                +'  from TGE203 '
                +' where CCOSID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CCOSID').AsString)
                +'   and CCOSACT=''S'' ';
         DMCNT.cdsSQL.Close;
         DMCNT.cdsSQL.DataRequest(xSQL);
         DMCNT.cdsSQL.Open;
         If DMCNT.cdsSQL.Recordcount <= 0 Then
         Begin
            ShowMessage('Registro : '+inttostr(DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger)+chr(13)
                       +'Centro de Costo: ' + DMCNT.cdsMovCnt1.FieldByName('CCOSID').AsString + ' NO se puede Usar. Revisar');
            DMCNT.cdsMovCnt1.EnableControls;
            Exit;
         End;
      End
      Else
      Begin
         if length(DMCNT.cdsMovCnt1.FieldByName('CCOSID').AsString)>0 then
         begin
            ShowMessage('Registro : '+inttostr(DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger)+chr(13)
                       +'Cuenta Contable no requiere Centro de Costo ');
            DMCNT.cdsMovCnt1.EnableControls;
            Exit;
         end;
      End;

   // Valida Auxiliar Contable
      If cFlAux = 'S' Then
      Begin
         If DMCNT.cdsMovCnt1.FieldByName('AUXID').AsString = '' Then
         Begin
            ShowMessage('Registro : '+inttostr(DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger)+chr(13)
                       +'Cuenta Contable: ' + DMCNT.cdsMovCnt1.FieldByName('CUENTAID').AsString + ', necesita Auxiliar. Revisar');
            DMCNT.cdsMovCnt1.EnableControls;
            Exit;
         End;

      // revisar si Auxiliar existe en Tabla de Auxiliares CNT201
         xSQL := 'Select CLAUXID, AUXID, AUXNOMB '
                +'  from CNT201 '
                +' where CLAUXID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CLAUXID').AsString)
                +'   and AUXID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('AUXID').AsString);
         DMCNT.cdsSQL.Close;
         DMCNT.cdsSQL.DataRequest(xSQL);
         DMCNT.cdsSQL.Open;
         If DMCNT.cdsSQL.Recordcount <= 0 Then
         Begin
            ShowMessage('Registro : '+inttostr(DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger)+chr(13)
                       +'Auxiliar : ' + DMCNT.cdsMovCnt1.FieldByName('CLAUXID').AsString + ' - ' + DMCNT.cdsMovCnt1.FieldByName('AUXID').AsString + ', NO existe. Revisar');
            DMCNT.cdsMovCnt1.EnableControls;
            Exit;
         End;
      End;

      DMCNT.cdsMovCnt1.Next;
   End;
   DMCNT.cdsMovCnt1.First;
   DMCNT.cdsMovCnt1.EnableControls;

   Result := True;
End;

Procedure TFRegComp.CuadraAsiento;
Var
   xTotDebeMN, xTotHaberMN: DOUBLE;
   xTotDebeME, xTotHaberME: DOUBLE;
   xDif: Double;
   xSQL : String;
Begin
   xTotDebeMN := 0;
   xTotHaberMN := 0;
   xTotDebeME := 0;
   xTotHaberME := 0;
   DMCNT.cdsMovCnt1.DisableControls;
   DMCNT.cdsMovCnt1.First;
   While Not DMCNT.cdsMovCnt1.eof Do
   Begin
      If DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString = 'D' Then
      Begin
         xTotDebeMN := xTotDebeMN + DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat;
         xTotDebeME := xTotDebeME + DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat;
      End
      Else
      Begin
         xTotHaberMN := xTotHaberMN + DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat;
         xTotHaberME := xTotHaberME + DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat;
      End;
      DMCNT.cdsMovCnt1.Next;
   End;

   xDif := 0;

   If DMCNT.cdsMovCnt1.FieldByName('TMONID').AsString = DMCNT.wTMonExt Then
   Begin
      If DMCNT.fround(xTotHaberMN, 15, 2) <> DMCNT.fround(xTotDebeMN, 15, 2) Then
      Begin
         If DMCNT.fround(xTotHaberMN, 15, 2) > DMCNT.fround(xTotDebeMN, 15, 2) Then
         Begin
            xDIf := DMCNT.fround(xTotHaberMN, 15, 2) - DMCNT.fround(xTotDebeMN, 15, 2);
            DMCNT.cdsMovCnt1.First;
            While Not DMCNT.cdsMovCnt1.eof Do
            Begin
               If DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString = 'D' Then
               Begin
                  DMCNT.cdsMovCnt1.Edit;
                  DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat := DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat + xDif;
                  DMCNT.cdsMovCnt1.FieldByName('CNTDEBEMN').AsFloat := DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat;
                  DMCNT.cdsMovCnt1.Post;
                  begin
                     xSQL := 'update CNT311 '
                            +'   set CNTMTOLOC='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat)+','
                            +'       CNTDEBEMN='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTDEBEMN').AsFloat)
                            +' where CIAID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CIAID').AsString)
                            +'   and TDIARID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('TDIARID').AsString)
                            +'   and CNTANOMM='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTANOMM').AsString)
                            +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTCOMPROB').AsString)
                            +'   and CNTREG='+inttostr(DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger);
                     Try
                        DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
                     Except
                        xSigueGrab := False;
                        ShowMessage('No se pudo ajustar el detalle por redondeo (H>D ME)');
                        exit;
                     end;
                  end;
                  Break;
               End;
               DMCNT.cdsMovCnt1.Next;
            End;
         End
         Else
         Begin
            xDIf := DMCNT.fround(xTotDebeMN, 15, 2) - DMCNT.fround(xTotHaberMN, 15, 2);
            DMCNT.cdsMovCnt1.First;
            While Not DMCNT.cdsMovCnt1.eof Do
            Begin
               If DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString = 'H' Then
               Begin
                  DMCNT.cdsMovCnt1.Edit;
                  DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat := DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat + xDif;
                  DMCNT.cdsMovCnt1.FieldByName('CNTHABEMN').AsFloat := DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat;
                  DMCNT.cdsMovCnt1.Post;
                  begin
                     xSQL := 'update CNT311 '
                            +'   set CNTMTOLOC='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat)+','
                            +'       CNTHABEMN='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTHABEMN').AsFloat)
                            +' where CIAID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CIAID').AsString)
                            +'   and TDIARID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('TDIARID').AsString)
                            +'   and CNTANOMM='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTANOMM').AsString)
                            +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTCOMPROB').AsString)
                            +'   and CNTREG='+inttostr(DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger);
                     Try
                        DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
                     Except
                        xSigueGrab := False;
                        ShowMessage('No se pudo ajustar el detalle por redondeo (D>H ME)');
                        exit;
                     end;
                  end;
                  Break;
               End;
               DMCNT.cdsMovCnt1.Next;
            End;
         End

      End;
   End
   Else
   Begin
      If DMCNT.fround(xTotHaberME, 15, 2) <> DMCNT.fround(xTotDebeME, 15, 2) Then
      Begin
         If DMCNT.fround(xTotHaberME, 15, 2) > DMCNT.fround(xTotDebeME, 15, 2) Then
         Begin
            xDIf := DMCNT.fround(xTotHaberME, 15, 2) - DMCNT.fround(xTotDebeME, 15, 2);
            DMCNT.cdsMovCnt1.First;
            While Not DMCNT.cdsMovCnt1.eof Do
            Begin
               If DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString = 'D' Then
               Begin
                  DMCNT.cdsMovCnt1.Edit;
                  DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat := DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat + xDif;
                  DMCNT.cdsMovCnt1.FieldByName('CNTDEBEME').AsFloat := DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat;
                  DMCNT.cdsMovCnt1.Post;
                  begin
                     xSQL := 'update CNT311 '
                            +'   set CNTMTOEXT='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat)+','
                            +'       CNTDEBEME='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTDEBEME').AsFloat)
                            +' where CIAID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CIAID').AsString)
                            +'   and TDIARID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('TDIARID').AsString)
                            +'   and CNTANOMM='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTANOMM').AsString)
                            +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTCOMPROB').AsString)
                            +'   and CNTREG='+inttostr(DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger);
                     Try
                        DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
                     Except
                        xSigueGrab := False;
                        ShowMessage('No se pudo ajustar el detalle por redondeo (H>D ME)');
                        exit;
                     end;
                  end;
                  Break;
               End;
               DMCNT.cdsMovCnt1.Next;
            End;
         End
         Else
         Begin
            xDIf := DMCNT.fround(xTotDebeME, 15, 2) - DMCNT.fround(xTotHaberME, 15, 2);
            DMCNT.cdsMovCnt1.First;
            While Not DMCNT.cdsMovCnt1.eof Do
            Begin
               If DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString = 'H' Then
               Begin
                  DMCNT.cdsMovCnt1.Edit;
                  DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat := DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat + xDif;
                  DMCNT.cdsMovCnt1.FieldByName('CNTHABEME').AsFloat := DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat;
                  DMCNT.cdsMovCnt1.Post;
                  begin
                     xSQL := 'update CNT311 '
                            +'   set CNTMTOEXT='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat)+','
                            +'       CNTHABEME='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTHABEME').AsFloat)
                            +' where CIAID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CIAID').AsString)
                            +'   and TDIARID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('TDIARID').AsString)
                            +'   and CNTANOMM='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTANOMM').AsString)
                            +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTCOMPROB').AsString)
                            +'   and CNTREG='+inttostr(DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger);
                     Try
                        DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
                     Except
                        xSigueGrab := False;
                        ShowMessage('No se pudo ajustar el detalle por redondeo (D>H MN)');
                        exit;
                     end;
                  end;
                  Break;
               End;
               DMCNT.cdsMovCnt1.Next;
            End;
         End
      End;
   End;

   DMCNT.cdsMovCnt1.First;
   DMCNT.cdsMovCnt1.EnableControls;
End;

Procedure TFRegComp.bbtnNuevoClick(Sender: TObject);
Var
   xcia, xTDia: String;
Begin
   If MessageDlg(' Registrar Nuevo Comprobante' + chr(13) + chr(13) +
      '       ¿ Esta Seguro ?      ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin

      If DMCNT.cdsMovCnt1.RecordCount = 0 Then
      Begin
         DMCNT.cdsMovCnt1.CancelUpdates;
         DMCNT.cdsCabCNT.CancelUpdates;
      End;

      DMCNT.wModo := 'A';
      wNewR := False;
      xcia := dblcCia.Text;
      xTDia := dblcTDiario.Text;
      IniciaDatos;
      dblcCia.Text := xcia;
      dblcTDiario.Text := xTDia;
      lblModulo.Caption := 'CNT';
      bbtnAdm.Caption := 'CNT';
      xwhere := 'CIAID=' + quotedstr(dblcCia.Text);
      edtCia.Text := DMCNT.DisplayDescrip('PrvTGE', 'TGE101', '*', xWhere, 'CIADES');
      xWhere := 'TDIARID=' + quotedstr(dblcTDiario.Text);
      edtTDiario.text := DMCNT.DisplayDescrip('PrvTGE', 'TGE104', '*', xWhere, 'TDIARDES');
      dblcTDiario.SetFocus;
   End;
End;

Procedure TFRegComp.bbtnAnulaClick(Sender: TObject);
var
   xSQL : String;
Begin

   If DMCNT.cdsCabCnt.FieldByName('MODULO').AsString <> 'CNT' Then
   Begin
      If DMCNT.cdsCabCnt.FieldByName('MODULO').AsString <> 'CAJA' Then
      Begin
         If (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'ALM') Or
            (DMCNT.wUsuario = 'ASANTANDER') Then
         Else
         Begin
            ShowMessage('No se puede Anular Comprobante. Modulo ' + DMCNT.cdsCabCnt.FieldByName('MODULO').AsString);
            Exit;
         End;
      End;
   End;

   If Not DMCNT.Accesos_a_Registros(DMCNT.cdsCabCnt.FieldByName('CNTUSER').AsString) Then
      Exit;

   If MessageDlg(' Anular Comprobante Actual' + chr(13) + chr(13) +
      '    ¿ Esta Seguro ?    ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin

      Screen.Cursor := CrHourGlass;

      xSigueGrab := True;
      DMCNT.DCOM1.AppServer.IniciaTransaccion;

      DMCNT.cdsMovCnt1.First;
      While Not DMCNT.cdsMovCnt1.EOF Do
      Begin
         DMCNT.cdsMovCnt1.Edit;
         DMCNT.cdsMovCnt1.FieldByName('CNTESTADO').AsString := 'A';
         DMCNT.cdsMovCnt1.FieldByName('CNTUSER').AsString := DMCNT.wUsuario; // usuario que registra
         DMCNT.cdsMovCnt1.FieldByName('CNTFREG').AsDateTime := date; // fecha que registra usuario
         DMCNT.cdsMovCnt1.FieldByName('CNTHREG').AsDateTime := time; // hora que registra usuario
         DMCNT.cdsMovCnt1.Next;
      End;

      begin
         xSQL := 'Update CNT311 '
                +'   set CNTESTADO='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTESTADO').AsString)+','
                +'       CNTUSER='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTUSER').AsString)+','
                +'       CNTFREG=trunc(sysdate), '
                +'       CNTHREG=sysdate '
                +' where CIAID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CIAID').AsString)
                +'   and TDIARID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('TDIARID').AsString)
                +'   and CNTANOMM='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTANOMM').AsString)
                +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se pudo actualizar el Estado del Detalle en la Contabilización');
            exit;
         end;
      end;

      DMCNT.cdsCabCnt.Edit;
      DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString := 'A';
      DMCNT.cdsCabCnt.FieldByName('CNTUSER').AsString := DMCNT.wUsuario; // usuario que registra
      DMCNT.cdsCabCnt.FieldByName('CNTFREG').AsDateTime := date; // fecha que registra usuario
      DMCNT.cdsCabCnt.FieldByName('CNTHREG').AsdateTime := time; // hora que registra usuario

      DMCNT.cdsCabCnt.Post;

      begin
         xSQL := 'Update CNT300 '
                +'   set CNTESTADO='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString)+','
                +'       CNTUSER='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTUSER').AsString)+','
                +'       CNTFREG = trunc(sysdate), '
                +'       CNTHREG = sysdate '
                +' where CIAID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString)
                +'   and TDIARID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString)
                +'   and CNTANOMM='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString)
                +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se pudo actualizar la cabecera del asiento');
            exit;
         end;

      end;
      DMCNT.DCOM1.AppServer.GrabaTransaccion;

      DMCNT.cdsMovCnt1.First;

      dbgMovCNT.ReadOnly := True;

      Screen.Cursor := CrDefault;

      ShowMessage(' Registro Anulado ');
      bbtnAnula.Enabled := False;
      bbtnNuevo.Enabled := True;
      bbtnRegresa.Enabled := False;
      bbtnAcepta.Enabled := False;
      bbtnContab.Enabled := False;
      bbtnGraba.Enabled := False;
      bbtnCanc2.Enabled := False;

      MuestraEstado(DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString, DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString);

   End;
End;

Procedure TFRegComp.dblcdAuxExit(Sender: TObject);
Begin
   If bbtnCanc.Focused Then exit;
   If dblcClase.Focused Then exit;

   edtAux.Text := '';
   If dblcdAux.Text <> '' Then
      edtAux.Text := DMCNT.DisplayDescrip('dspCNT', 'CNT201', 'AUXABR',
         'AUXID=' + quotedstr(dblcdAux.text) + ' AND CLAUXID=' + quotedstr(dblcClase.Text) + ' and ACTIVO=''S''', 'AUXABR');
   If length(edtAux.Text) = 0 Then
   Begin
      edtAux.Text := DMCNT.DisplayDescrip('dspCNT', 'CNT201', 'AUXNOMB',
         'AUXID=' + quotedstr(dblcdAux.text) + ' AND CLAUXID=' + quotedstr(dblcClase.Text) + ' and ACTIVO=''S''', 'AUXNOMB');
      If length(edtAux.Text) = 0 Then
      Begin
         ShowMessage('Ingrese Auxiliar');
         dblcdAux.SetFocus;
         exit;
      End;
   End;
End;

Procedure TFRegComp.GrabaCabecera;
Var
   xGrabaC: Boolean;
   xWhere2, xWhere1: String;
   xSQL : String;
Begin
   If (xCompNew) And ((DMCNT.wModo = 'A') Or (DMCNT.wModo = 'N')) Then
   Begin
      sWhere := 'CIAID='+quotedstr(dblcCia.Text)
         + ' and TDIARID='+quotedstr(dblcTDiario.Text)
         + ' and CNTANOMM='+quotedstr(edtPeriodo.Text)
         + ' and CNTCOMPROB='+quotedstr(dbeNoComp.Text);
      If dbeNoComp.Text = DMCNT.DisplayDescrip('prvCNT', 'CNT300', 'CNTCOMPROB', sWhere, 'CNTCOMPROB') Then
      Begin
         xWhere1 := 'Select nvl(max(CNTCOMPROB), ''0'' ) as NUMERO '
                  + '  from CNT300 '
                  + ' where CIAID='+quotedstr(dblcCia.Text)
                  + '   and TDIARID='+quotedstr(dblcTDiario.Text)
                  + '   and CNTANOMM='+quotedstr(edtPeriodo.Text);
         DMCNT.cdsQry.Close;
         DMCNT.cdsQry.DataRequest(xWhere1);
         DMCNT.cdsQry.Open;
         dbeNoComp.Text := Inttostr(StrToInt(DMCNT.cdsQry.FieldByname('NUMERO').AsString) + 1);
         dbeNoComp.Text := DMCNT.strzero(dbeNoComp.Text, 10);

         sWhere := 'CIAID='+quotedstr(dblcCia.Text)
            + ' and TDIARID='+quotedstr(dblcTDiario.Text)
            + ' and CNTANOMM='+quotedstr(edtPeriodo.Text)
            + ' and CNTCOMPROB='+quotedstr(dbeNoComp.Text);

         xSQL := 'Insert into CNT300(CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTFCOMP) '
                +'Values ( '
                         + quotedstr(dblcCia.Text)+','
                         + quotedstr(dblcTDiario.Text)+','
                         + quotedstr(edtPeriodo.Text)+','
                         + quotedstr(dbeNoComp.Text)+','
                         + quotedstr(datetostr(dtpFComp.Date))+')';
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            xSigueGrab := False;
            ShowMessage('No se pudo Ingresar la cabecera del asiento');
            exit;
         end;

         ShowMessage('Número de Comprobante ' + xNoCompAx + ' ya fue registrado en otro asiento ' + chr(13)
                   + 'El nuevo número asignado será ' + dbeNoComp.Text);
      End
      Else
      Begin
         xSQL := 'Insert into CNT300(CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTFCOMP) '
                +'Values ( '
                         + quotedstr(dblcCia.Text)+','
                         + quotedstr(dblcTDiario.Text)+','
                         + quotedstr(edtPeriodo.Text)+','
                         + quotedstr(dbeNoComp.Text)+','
                         + quotedstr(datetostr(dtpFComp.Date))+')';
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            xSigueGrab := False;
            ShowMessage('No se pudo Ingresar la cabecera del asiento');
            exit;
         end;
      End;

      wNewR := True;
      xWhere2 := 'FECHA=' + wRepFuncDate + '''' + formatdatetime(wFormatFecha, dtpFComp.date) + '''' + ')';
      If length(DMCNT.DisplayDescrip('PrvTGE', 'TGE114', '*', xWhere2, 'FECANO')) > 0 Then
      Begin
         xSQL := 'Update CNT300 '
                +'   set CNTMM='+quotedstr(DMCNT.cdsQry.fieldbyname('FECMES').Value)+','
                +'       CNTDD='+quotedstr(DMCNT.cdsQry.fieldbyname('FECDIA').Value)+','
                +'       CNTTRI='+quotedstr(DMCNT.cdsQry.fieldbyname('FECTRIM').Value)+','
                +'       CNTSEM='+quotedstr(DMCNT.cdsQry.fieldbyname('FECSEM').Value)+','
                +'       CNTSS='+quotedstr(DMCNT.cdsQry.fieldbyname('FECSS').Value)+','
                +'       CNTAATRI='+quotedstr(DMCNT.cdsQry.fieldbyname('FECAATRI').Value)+','
                +'       CNTAASEM='+quotedstr(DMCNT.cdsQry.fieldbyname('FECAASEM').Value)+','
                +'       CNTAASS='+quotedstr(DMCNT.cdsQry.fieldbyname('FECAASS').Value)+','
                +'       CNTESTADO='+quotedstr('I')+','
                +'       CNTANO='+quotedstr(copy(edtPeriodo.Text, 1, 4))+','
                +'       TDIARDES='+quotedstr(edtTDiario.Text)+','
                +'       MODULO='+quotedstr(DMCNT.wModulo) ;
         xSQL := xSQL + ' WHERE ' + sWhere;
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            xSigueGrab := False;
            ShowMessage('No se pudo actualizar la cabecera del asiento');
            exit;
         end;

      End;

   // Anadido para Copiar Asiento
      If DMCNT.wModo = 'N' Then
      Begin
         If MessageDlg('Si elige SI (Yes), se copia el detalle del Asiento Original. ' + chr(13) + chr(13) +
            'Si elige NO (No ), se genera un asiento de Extorno.' + chr(13) + chr(13),
            mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
            xSQL := 'Insert into CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, '
               + 'CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
               + 'CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
               + 'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, '
               + 'CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
               + 'CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
               + 'TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
               + 'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
               + 'CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, CNTPAGADO, '
               + 'CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
               + 'Select ''' + dblcCia.Text + ''', ''' + dblcTDiario.Text + ''', ''' + dbeNoComp.Text + ''', '
               + '''' + copy(edtPeriodo.Text, 1, 4) + ''', ''' + edtPeriodo.Text + ''', ''' + dbeLote.Text + ''', '
               + 'CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
               + 'CNTDH, '
               + 'CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
               + 'CNTFEMIS, CNTFVCMTO, ''' + formatdatetime(wFormatFecha, dtpFComp.date) + ''' CNTFCOMP, ''I'', ''N'', CNTFAUTOM, '
               + 'CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
               + 'CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
               + 'TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, CNTHABEMN, CNTHABEME, CNTDEBEMN, CNTDEBEME, '
               + 'CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU '
               + 'From CNT301 '
               + 'Where CIAID=' + quotedstr(FRegistro.GComprobante.FMant.cds2.FieldByName('CIAID').AsString) + ' and '
               + 'TDIARID=' + quotedstr(FRegistro.GComprobante.FMant.cds2.FieldByName('TDIARID').AsString) + ' and '
               + 'CNTANOMM=' + quotedstr(FRegistro.GComprobante.FMant.cds2.FieldByName('CNTANOMM').AsString) + ' and '
               + 'CNTCOMPROB=' + quotedstr(FRegistro.GComprobante.FMant.cds2.FieldByName('CNTCOMPROB').AsString) + ' and '
               + 'NVL( CNTFAUTOM,''N'' )<>' + quotedstr('S')
         Else
            xSQL := 'Insert into CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, '
               + 'CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
               + 'CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
               + 'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, '
               + 'CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
               + 'CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
               + 'TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
               + 'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
               + 'CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, CNTPAGADO, '
               + 'CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
               + 'Select ''' + dblcCia.Text + ''', ''' + dblcTDiario.Text + ''', ''' + dbeNoComp.Text + ''', '
               + '''' + copy(edtPeriodo.Text, 1, 4) + ''', ''' + edtPeriodo.Text + ''', ''' + dbeLote.Text + ''', '
               + 'CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
               + 'CASE WHEN CNTDH=''D'' THEN ''H'' ELSE ''D'' END CNTDH, '
               + 'CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
               + 'CNTFEMIS, CNTFVCMTO, ''' + formatdatetime(wFormatFecha, dtpFComp.date) + ''' CNTFCOMP, ''I'', ''N'', CNTFAUTOM, '
               + 'CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
               + 'CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
               + 'TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, CNTHABEMN, CNTHABEME, CNTDEBEMN, CNTDEBEME, '
               + 'CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU '
               + 'From CNT301 '
               + 'Where CIAID=' + quotedstr(FRegistro.GComprobante.FMant.cds2.FieldByName('CIAID').AsString) + ' and '
               + 'TDIARID=' + quotedstr(FRegistro.GComprobante.FMant.cds2.FieldByName('TDIARID').AsString) + ' and '
               + 'CNTANOMM=' + quotedstr(FRegistro.GComprobante.FMant.cds2.FieldByName('CNTANOMM').AsString) + ' and '
               + 'CNTCOMPROB=' + quotedstr(FRegistro.GComprobante.FMant.cds2.FieldByName('CNTCOMPROB').AsString) + ' and '
               + 'NVL( CNTFAUTOM,''N'' )<>' + quotedstr('S');
         DMCNT.cdsQry.Close;
         DMCNT.cdsQry.DataRequest(xSQL);
         DMCNT.cdsQry.Execute;
      End;

      DMCNT.cdsMovCnt1.Filtered := False;
      DMCNT.cdsMovCnt1.DisableControls;

      xSQL := 'SELECT CNTREG,CIAID,CUENTAID,CNTMTOORI,CNTFVCMTO,CNTFEMIS,CNTGLOSA,CNTDH, '
            + '       AUXID,CLAUXID,DOCID,CNTSERIE,CNTNODOC,CCOSID,CNTDEBEMN,CNTDEBEME, '
            + '       CNTHABEMN,CNTHABEME,TDIARID,CNTCUADRE,CNTESTADO,CNTCOMPROB,CNTMTOLOC, '
            + '       CNTMTOEXT,CTADES,AUXDES,DOCDES,CCOSDES,TDIARDES,CNTANO,CNTANOMM, '
            + '       CNTLOTE,TMONID,CNTTCAMBIO,CNTTS,CNTMODDOC,CNTFCOMP,CNTUSER,CNTFREG, '
            + '       CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS, '
            + '       CNTFAUTOM, MODULO '
            + '  FROM CNT311 '
            + ' WHERE '+ sWhere;

      DMCNT.cdsMovCnt1.Close;
      DMCNT.cdsMovCnt1.DataRequest(xSQL);
      DMCNT.cdsMovCnt1.Open;
      MuestraDetalle;
      TotalesResumen;
      DMCNT.cdsMovCnt1.First;
      DMCNT.cdsMovCnt1.EnableControls;
      xCompNew := False;
      wNewR := True;
   End
   Else
   Begin

      If Not DMCNT.Accesos_a_Registros(DMCNT.wUsuario) Then
         Exit;
   End;

   xGrabaC := True;

   If xGrabaC Then
   Begin
      sWhere := 'CIAID='+quotedstr(dblcCia.Text)
            + ' and TDIARID='+quotedstr(dblcTDiario.Text)
            + ' and CNTANOMM='+quotedstr(edtPeriodo.Text)
            + ' and CNTCOMPROB='+quotedstr(dbeNoComp.Text);

      xSQL := 'Update CNT300 '
             +'   set CNTLOTE='+quotedstr(dbeLote.text)+','
             +'       CNTGLOSA='+quotedstr(dbeGlosaCab.text)+','
             +'       TMONID='+quotedstr(dblcTMon.text)+','
             +'       CNTTCAMBIO='+(dbeTasa.TEXT)+','
             +'       CNTTS='+quotedstr(xCampo)+','
             +'       CNTUSER='+quotedstr(DMCNT.wUsuario)+','
             +'       CNTFREG=trunc(sysdate),'
             +'       CNTHREG=sysdate '
             +' where ' + swhere;
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            xSigueGrab := False;
            ShowMessage('No se pudo actualizar la cabecera del asiento');
            exit;
         end;
   End;
End;

Procedure TFRegComp.bbtnOkClick(Sender: TObject);
Var
   xModC: Boolean;
Begin
   If (length(dblcdCuenta.Text) = 0) Or
      (dblcClase.Enabled And (dblcdAux.Text = '')) Or
      (((length(dblcTDoc.Text) = 0) Or (length(dbeSerie.Text) = 0) Or (length(dbeNoDoc.Text) = 0)) And (dblcTDoc.enabled)) Or
      ((length(dblcdCCosto.Text) = 0) And (dblcdCCosto.Enabled)) Or
      (length(dbdtpFEmis.Text) = 0) Or (length(dbdtpFVcmto.Text) = 0) Or (length(dbeMonto.Text) = 0) Or
      ((dbeDH.Text <> 'D') And (dbeDH.Text <> 'H')) Or (length(dbeGlosa.Text) = 0) Then
   Begin
      ShowMessage('Información Incompleta o errada');
      exit;
   End;

   If dbdtpFVcmto.Date < dbdtpFEmis.date Then
   Begin
      showmessage('La Fecha de Vencimiento no puede se menor que la fecha de Emisión');
      dbdtpFVcmto.setfocus;
      Exit;
   End;

   If (DMCNT.DisplayDescrip('PrvTGE', 'TGE202', 'REGSOLOME', 'CIAID=' + QuotedStr(dblcCia.text) + ' AND CUENTAID=' + QuotedStr(dblcdCuenta.text), 'REGSOLOME') = 'S')
      And (dblcTMon2.text = DMCNT.wTMonLoc) Then
   Begin
      dblcdCuenta.setfocus;
      ShowMessage('Cuenta sólo permite registrar en Moneda Extranjera, Verifique!');
      exit;
   End;

// Inicio HPC_201503_CNT
   {
   Try
      DMCNT.DCOM1.AppServer.IniciaTransaccion;
   }

   DMCNT.cdsMovCnt1.Edit;
   DMCNT.cdsMovCnt1.FieldByName('CNTCOMPROB').AsString := dbeNoComp.Text;
   If DMCNT.cdsMovCnt1.FieldByName('TMONID').AsString = DMCNT.wTMonLoc Then
   Begin
      DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat := DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat;
      If DMCNT.cdsCuenta.FieldByName('CTA_DIFC').Asstring = 'S' Then
         DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat := 0
      Else
         DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat := DMCNT.FRound(DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat / DMCNT.cdsMovCnt1.FieldByName('CNTTCAMBIO').AsFloat, 15, 2);
   End
   Else
   Begin
      DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat := DMCNT.FRound(DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat * DMCNT.cdsMovCnt1.FieldByName('CNTTCAMBIO').AsFloat, 15, 2);
      DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat := DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat;
   End;

   If (DMCNT.cdsMovCNT1.FieldByName('CNTDH').AsString = 'D') Then
   Begin
      DMCNT.cdsMovCnt1.FieldByName('CNTDEBEMN').AsFloat := DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat;
      DMCNT.cdsMovCnt1.FieldByName('CNTDEBEME').AsFloat := DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat;
      DMCNT.cdsMovCnt1.FieldByName('CNTHABEMN').AsFloat := 0;
      DMCNT.cdsMovCnt1.FieldByName('CNTHABEME').AsFloat := 0;
   End
   Else
   Begin
      DMCNT.cdsMovCnt1.FieldByName('CNTHABEMN').AsFloat := DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat;
      DMCNT.cdsMovCnt1.FieldByName('CNTHABEME').AsFloat := DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat;
      DMCNT.cdsMovCnt1.FieldByName('CNTDEBEMN').AsFloat := 0;
      DMCNT.cdsMovCnt1.FieldByName('CNTDEBEME').AsFloat := 0;
   End;

   DMCNT.cdsMovCnt1.FieldByName('CNTGLOSA').AsString := dbeGlosa.Text;
   DMCNT.cdsMovCnt1.FieldByName('CTADES').AsString := edtCuenta.Text;
   DMCNT.cdsMovCnt1.FieldByName('AUXDES').AsString := edtAux.Text;
   DMCNT.cdsMovCnt1.FieldByName('DOCDES').AsString := dbeTDoc.Text;
   DMCNT.cdsMovCnt1.FieldByName('CCOSDES').AsString := dbeCCosto.Text;
   DMCNT.cdsMovCnt1.FieldByName('TDIARDES').AsString := edtTDiario.Text;
   DMCNT.cdsMovCnt1.FieldByName('CNTUSER').AsString := DMCNT.wUsuario; // usuario que registra
   DMCNT.cdsMovCnt1.FieldByName('CNTFREG').AsDateTime := date; // fecha que registra usuario
   DMCNT.cdsMovCnt1.FieldByName('CNTHREG').AsDateTime := time; // hora que registra usuario
   DMCNT.cdsMovCnt1.Post;
//   xSigueGrab := True;

   xSQL := 'select * '
          +'  from CNT311 '
          +' where CIAID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CIAID').AsString)
          +'   and TDIARID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('TDIARID').AsString)
          +'   and CNTANOMM='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTANOMM').AsString)
          +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTCOMPROB').AsString)
          +'   and CNTREG='+inttostr(DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger);
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;

   IF DMCNT.cdsQry.RecordCount>0 THEN
   BEGIN
      xSQL := 'UPDATE CNT311 '
             +'   SET CUENTAID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CUENTAID').AsString)+','
             +'       CLAUXID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CLAUXID').AsString)+','
             +'       AUXID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('AUXID').AsString)+','
             +'       CNTFCOMP='+quotedstr(datetostr(DMCNT.cdsMovCnt1.FieldByName('CNTFCOMP').AsDateTime))+','
             +'       CNTESTADO='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTESTADO').AsString)+','
             +'       DOCID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('DOCID').AsString)+','
             +'       CNTSERIE='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTSERIE').AsString)+','
             +'       CNTNODOC='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTNODOC').AsString)+','
             +'       CCOSID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CCOSID').AsString)+','
             +'       CNTFEMIS='+quotedstr(datetostr(DMCNT.cdsMovCnt1.FieldByName('CNTFEMIS').AsDateTime))+','
             +'       CNTFVCMTO='+quotedstr(datetostr(DMCNT.cdsMovCnt1.FieldByName('CNTFVCMTO').AsDateTime))+','
             +'       CNTTCAMBIO='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTTCAMBIO').AsFloat)+','
             +'       CNTMTOORI='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat)+','
             +'       CNTMTOLOC='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat)+','
             +'       CNTMTOEXT='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat)+','
             +'       CNTDEBEMN='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTDEBEMN').AsFloat)+','
             +'       CNTDEBEME='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTDEBEME').AsFloat)+','
             +'       CNTHABEMN='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTHABEMN').AsFloat)+','
             +'       CNTHABEME='+floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTHABEME').AsFloat)+','
             +'       TMONID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('TMONID').AsString)+','
             +'       CNTDH='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString)+','
             +'       CTADES='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CTADES').AsString)+','
             +'       AUXDES='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('AUXDES').AsString)+','
             +'       DOCDES='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('DOCDES').AsString)+','
             +'       CCOSDES='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CCOSDES').AsString)+','
             +'       TDIARDES='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('TDIARDES').AsString)+','
             +'       CNTGLOSA='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTGLOSA').AsString)+','
             +'       CNTUSER='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTUSER').AsString)+','
             +'       CNTFREG=trunc(sysdate),'
             +'       CNTHREG=sysdate '
             +' where CIAID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CIAID').AsString)
             +'   and TDIARID='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('TDIARID').AsString)
             +'   and CNTANOMM='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTANOMM').AsString)
             +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTCOMPROB').AsString)
             +'   and CNTREG='+inttostr(DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger);
   END
   ELSE
   BEGIN
      xSQL := 'Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, TMONID, '
             +'                   CNTTCAMBIO, CNTTS, CNTMODDOC, CNTFCOMP, CNTFEMIS, CNTFVCMTO, CNTESTADO, '
             +'                   CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CCOSID, CNTDH, '
             +'                   CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
             +'                   CTADES, AUXDES, DOCDES, CCOSDES, TDIARDES, '
             +'                   CNTUSER, CNTFREG, CNTHREG, CNTGLOSA, CNTREG, MODULO, CNTMM, CNTDD, CNTTRI, '
             +'                   CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS) '
             +'values ('+quotedstr(DMCNT.cdsMovCnt1.FieldByName('CIAID').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('TDIARID').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTCOMPROB').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTANO').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTANOMM').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTLOTE').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('TMONID').AsString)+','
             +           floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTTCAMBIO').AsFloat)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTTS').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTMODDOC').AsString)+','
             +           quotedstr(datetostr(DMCNT.cdsMovCnt1.FieldByName('CNTFCOMP').AsDateTime))+','
             +           quotedstr(datetostr(DMCNT.cdsMovCnt1.FieldByName('CNTFEMIS').AsDateTime))+','
             +           quotedstr(datetostr(DMCNT.cdsMovCnt1.FieldByName('CNTFVCMTO').AsDateTime))+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTESTADO').AsString)+','
             +           quotedstr(DMCNT.cdsMovCNT1.FieldByName('CUENTAID').AsString)+','
             +           quotedstr(DMCNT.cdsMovCNT1.FieldByName('CLAUXID').AsString)+','
             +           quotedstr(DMCNT.cdsMovCNT1.FieldByName('AUXID').AsString)+','
             +           quotedstr(DMCNT.cdsMovCNT1.FieldByName('DOCID').AsString)+','
             +           quotedstr(DMCNT.cdsMovCNT1.FieldByName('CNTSERIE').AsString)+','
             +           quotedstr(DMCNT.cdsMovCNT1.FieldByName('CNTNODOC').AsString)+','
             +           quotedstr(DMCNT.cdsMovCNT1.FieldByName('CCOSID').AsString)+','
             +           quotedstr(DMCNT.cdsMovCNT1.FieldByName('CNTDH').AsString)+','
             +           floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat)+','
             +           floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat)+','
             +           floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat)+','
             +           floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTDEBEMN').AsFloat)+','
             +           floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTDEBEME').AsFloat)+','
             +           floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTHABEMN').AsFloat)+','
             +           floattostr(DMCNT.cdsMovCnt1.FieldByName('CNTHABEME').AsFloat)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CTADES').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('AUXDES').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('DOCDES').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CCOSDES').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('TDIARDES').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTUSER').AsString)+','
             +'          trunc(sysdate), '
             +'          sysdate,'
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTGLOSA').AsString)+','
             +           inttostr(DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('MODULO').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTMM').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTDD').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTTRI').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTSEM').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTSS').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTAATRI').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTAASEM').AsString)+','
             +           quotedstr(DMCNT.cdsMovCnt1.FieldByName('CNTAASS').AsString)+') ';
   END;

   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
   Except
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se puede grabar el registro de Detalle');
      exit;
   end;

   xFechaT := DMCNT.cdsMovCnt1.FieldByName('CNTFEMIS').AsDateTime;

   TotalesResumen;
   DMCNT.cdsCabCnt.Edit;
   xModC := False;

   If DMCNT.FRound(DMCNT.cdsCabCnt.FieldByName('CNTDEBEMN').AsFloat, 15, 2) <> DMCNT.FRound(strtofloat(dbeMND.Text), 15, 2) Then
   Begin
      DMCNT.cdsCabCnt.FieldByName('CNTDEBEMN').AsFloat := strtofloat(dbeMND.Text);
      xModC := true;
   End;
   If DMCNT.FRound(DMCNT.cdsCabCnt.FieldByName('CNTHABEMN').AsFloat, 15, 2) <> DMCNT.FRound(strtofloat(dbeMNC.Text), 15, 2) Then
   Begin
      DMCNT.cdsCabCnt.FieldByName('CNTHABEMN').AsFloat := strtofloat(dbeMNC.Text);
      xModC := true;
   End;
   If DMCNT.FRound(DMCNT.cdsCabCnt.FieldByName('CNTDEBEME').AsFloat, 15, 2) <> DMCNT.FRound(strtofloat(dbeMED.Text), 15, 2) Then
   Begin
      DMCNT.cdsCabCnt.FieldByName('CNTDEBEME').AsFloat := strtofloat(dbeMED.Text);
      xModC := true;
   End;

   If DMCNT.FRound(DMCNT.cdsCabCnt.FieldByName('CNTHABEME').AsFloat, 15, 2) <> DMCNT.FRound(strtofloat(dbeMEC.Text), 15, 2) Then
   Begin
      DMCNT.cdsCabCnt.FieldByName('CNTHABEME').AsFloat := strtofloat(dbeMEC.Text);
      xModC := true;
   End;

   DMCNT.cdsCabCNT.FieldByName('CNTUSER').AsString := DMCNT.wUsuario;
   DMCNT.cdsCabCNT.FieldByName('CNTFREG').AsdateTime := date;
   DMCNT.cdsCabCNT.FieldByName('CNTHREG').AsdateTime := date+time;
   DMCNT.cdsCabCNT.Post;
   xSQL := 'Update CNT300 '
          +'   set CNTDEBEMN='+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTDEBEMN').AsFloat)+','
          +'       CNTDEBEME='+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTDEBEME').AsFloat)+','
          +'       CNTHABEMN='+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTHABEMN').AsFloat)+','
          +'       CNTHABEME='+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTHABEME').AsFloat)+','
          +'       CNTUSER='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTUSER').AsString)+','
          +'       CNTFREG=trunc(sysdate),'
          +'       CNTHREG=sysdate '
          +' where CIAID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString)
          +'   and TDIARID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString)
          +'   and CNTANOMM='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString)
          +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString);
   try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
   Except
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se puede grabar el asiento');
      exit;
   end;

   DMCNT.DCOM1.AppServer.GrabaTransaccion;
   {
   Except
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('No se puede grabar el asiento');
      exit;
   end;
   }
// Fin HPC_201503_CNT

   If wIns Then
      RegNuevo // Si es insercion o continuacion de insercion
   Else
   Begin
      pnlMovCnt.Enabled := True;
      pnlMantComp.Visible := False;
   End;

   bbtnCanc2.Enabled := True;

   If wIns Then
      dblcdCuenta.setfocus;
End;

Procedure TFRegComp.bbtnCancClick(Sender: TObject);
Begin
   If wIns Then
      DMCNT.cdsMovCnt1.Delete // Si es por insercion==> borra
   Else
   Begin
      DMCNT.cdsMovCnt1.Cancel; //cdsMovCNT1.Recno := xxRecno;
   End;

// Inicio HPC_201503_CNT
   wIns := False;
// Fin HPC_201503_CNT
   pnlMovCnt.Enabled := True;
   pnlMantComp.Visible := False;

End;

Procedure TFRegComp.dblcdCCostoExit(Sender: TObject);
Begin
   If (bbtnCanc.Focused) Then exit;
   dbeCCosto.Text := '';

   DMCNT.cdsCCosto.IndexFieldNames := 'CCOSID';
   DMCNT.cdsCCosto.SetKey;
   DMCNT.cdsCCosto.FieldByName('CCOSID').Asstring := dblcdCCosto.Text;
   If Not DMCNT.cdsCCosto.GotoKey Then
   Begin
      ShowMessage('Error : Centro de Costo No Existe...');
      dblcdCCosto.SetFocus;
      Exit;
   End;

   If xmov = 'S' Then
   Begin
      If Length(Trim(DMCNT.cdsCCosto.FieldByName('CCOSMOV').ASString)) = 0 Then
      Begin
         dbeCCosto.Text := '';
         dblcdCCosto.setfocus;
         ShowMessage('Error :  Solo puede Seleccionar un Codigo de C. Costo de Ultimo Nivel ');
         Exit;
      End;
   End;

   //Acepta solo los Centros de Costo que son de Movimiento
   If DMCNT.cdsCCosto.Fieldbyname('CCOSMOV').asstring = 'N' Then
   Begin
      Showmessage('El Centro de Costo no es de Movimiento');
      dblcdCCosto.setfocus;
      exit;
   End;

   If dblcdCCosto.Text <> '' Then dbeCCosto.Text := DMCNT.cdsCCosto.FieldByName('CCOSDES').AsString;
   If length(dbeCCosto.Text) = 0 Then
   Begin
      ShowMessage('Ingrese Centro de Costo');
      dblcdCCosto.SetFocus;
   End;
End;

Procedure TFRegComp.dbgMovCNTDblClick(Sender: TObject);
Begin
   If Not dbgMovCNTIButton.Enabled Then Exit;
   If (DMCNT.cdsMovCNT1.RecordCount = 0) Or (xFlag) Or (xFlagCierre) Then exit;

// Inicio HPC_201602_CNT
   xWhere := ' select ciaid,tdiarid,cntanomm,cntcomprob,cntreg,count(cntreg) Cantidad '
           + '  from CNT311 '
           + ' where CIAID = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString)
           + '   and CNTANOMM = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString)
           + '   and TDIARID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString)
           + '   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString)
           + '   group by ciaid,tdiarid,cntanomm,cntcomprob,cntreg '
           + '   Having Count(cntreg)> 1 ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xWhere);
   DMCNT.cdsQry.Open;

   DMCNT.cdsQry.First;
   If DMCNT.cdsQry.RecordCount > 0 Then
   Begin
      bbtnRenumDet.click;
   End;
// Fin HPC_201602_CNT


   wIns := False;

   DMCNT.cdsMovCNT1.Edit;
   pnlMovCnt.Enabled := False;

   edtcuenta.text := DMCNT.CdsMovCNT1.fieldbyname('CTADES').Asstring;
   dbeCCosto.text := DMCNT.CdsMovCNT1.fieldbyname('CCOSDES').Asstring;

   pnlMantComp.Visible := True;

   If DMCNT.cdsCabCnt.FieldByName('MODULO').AsString <> 'CNT' Then
   Begin
      dblcTMon2.Enabled := False;
      dbeMonto.Enabled := False;
      dbeDH.Enabled := False;
      dbeTCamb.Enabled := False;
      If DMCNT.wAdmin <> 'V' Then
         dbeGlosa.Enabled := False;
   End
   Else
   Begin
      dblcTMon2.Enabled := True;
      dbeMonto.Enabled := True;
      dbeDH.Enabled := True;
      dbeTCamb.Enabled := True;
      dbeGlosa.Enabled := True;
   End;
   dblcdCuenta.SetFocus;

End;

Procedure TFRegComp.dbeDHExit(Sender: TObject);
Begin
   If (bbtnCanc.Focused) Then exit;

   If ((dbeDH.Text <> 'D') And (dbeDH.Text <> 'H')) Or (dbeDH.Text = '') Then
   Begin
      ShowMessage('Digite sólo D(para Debe) o H(para Haber)');
      dbeDH.Text := '';
      dbeDH.SetFocus;
   End;
   DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString := dbeDH.Text;
End;

Procedure TFRegComp.dbeMontoExit(Sender: TObject);
Begin
   If (bbtnCanc.Focused) Then exit;
   If DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat <= 0 Then
   Begin
      ShowMessage('Importe debe ser mayor que cero(0)');
      DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat := 0;
      dbeMonto.SetFocus;
   End;
End;

Procedure TFRegComp.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFRegComp.TotalesResumen;
Begin
   dbeMND.Text := '0';
   dbeMNC.Text := '0';
   dbeMED.Text := '0';
   dbeMEC.Text := '0';
   dbeMNDif.Text := '0';
   dbeMEDif.Text := '0';
   DMCNT.cdsMovCnt1.DisableControls;
   DMCNT.cdsMovCnt1.First;
   While Not DMCNT.cdsMovCnt1.Eof Do
   Begin
      dbeMND.Text := Format('%8.2f', [strtoFloat(dbeMND.Text) + DMCNT.cdsMovCnt1.FieldByName('CNTDEBEMN').AsFloat]);
      dbeMNC.Text := Format('%8.2f', [strtoFloat(dbeMNC.Text) + DMCNT.cdsMovCnt1.FieldByName('CNTHABEMN').AsFloat]);
      dbeMED.Text := Format('%8.2f', [strtoFloat(dbeMED.Text) + DMCNT.cdsMovCnt1.FieldByName('CNTDEBEME').AsFloat]);
      dbeMEC.Text := Format('%8.2f', [strtoFloat(dbeMEC.Text) + DMCNT.cdsMovCnt1.FieldByName('CNTHABEME').AsFloat]);
      DMCNT.cdsMovCnt1.Next;
   End;
   dbeMNDif.Text := Format('%8.2f', [strtoFloat(dbeMND.Text) - strtoFloat(dbeMNC.Text)]);
   dbeMEDif.Text := Format('%8.2f', [strtoFloat(dbeMED.Text) - strtoFloat(dbeMEC.Text)]);
   DMCNT.cdsMovCnt1.EnableControls;
End;

Procedure TFRegComp.bbtnImprimeClick(Sender: TObject);
Var
   xWhere, estado, estado1, mes, ano, mesdes, xCampos: String;
   X10: INTEGER;
Begin
   DMCNT.cdsMOVCNT1.DisableControls;

   mes := copy(edtPeriodo.text, 5, 2);
   ano := copy(edtPeriodo.text, 1, 4);

   xWhere := 'MESIDR=''' + mes + '''';
   mesdes := DMCNT.DisplayDescrip('dspTGE', 'TGE181', 'MESDESL', XWHERE, 'MESDESL');

   Xwhere := 'CIAID=''' + DMCNT.cdsMOVCNT1.FIELDBYNAME('CIAID').ASSTRING
      + ''' AND TDIARID=''' + DMCNT.cdsMOVCNT1.FIELDBYNAME('TDIARID').ASSTRING
      + ''' AND CNTANOMM=''' + DMCNT.cdsMOVCNT1.FIELDBYNAME('CNTANOMM').ASSTRING
      + ''' AND CNTCOMPROB=''' + DMCNT.cdsMOVCNT1.FIELDBYNAME('CNTCOMPROB').ASSTRING + '''';

   Estado := DMCNT.DisplayDescrip('dspTGE', 'CNT300', 'CNTCUADRE,CNTESTADO', XWHERE, 'CNTCUADRE');
   estado1 := DMCNT.cdsqry.fieldbyname('CNTESTADO').asstring;

   xCampos := '''' + mesdes + ' ' + ano + ''' PERIODO ';

   If estado1 = 'P' Then
      xsql := 'SELECT A.*, B.CIADES, A.TDIARID||'' - ''||C.TDIARDES ORIGEN, '
         + 'CASE WHEN D.CNTESTADO=''P'' THEN ''Contabilizado'' '
         + 'ELSE CASE WHEN D.CNTESTADO=''I'' THEN ''Inicial'' '
         + 'ELSE CASE WHEN D.CNTESTADO=''A'' THEN ''Anulado'' '
         + 'ELSE ''ERROR'' END '
         + 'END '
         + 'END ESTADO, D.CNTGLOSA GLOSA, M.TMONDES MONEDA, ' + xCampos
         + 'FROM CNT301 A, CNT300 D, TGE101 B, TGE104 C, TGE103 M '
         + 'WHERE ( A.CIAID=' + quotedstr(dblcCia.Text) + ' AND '
         + 'A.CNTANOMM=' + quotedstr(edtPeriodo.Text) + ' AND '
         + 'A.TDIARID=' + quotedstr(dblcTDiario.Text) + ' AND '
         + 'A.CNTCOMPROB=' + quotedstr(dbeNoComp.Text) + ' AND '
         + 'A.CIAID=D.CIAID AND A.TDIARID=D.TDIARID AND '
         + 'A.CNTANOMM=D.CNTANOMM AND A.CNTCOMPROB=D.CNTCOMPROB AND '
         + 'A.CIAID=B.CIAID AND A.TDIARID=C.TDIARID AND A.TMONID=M.TMONID ) '
         + 'ORDER BY A.CIAID, A.CNTANOMM, A.TDIARID, A.CNTREG'
   Else
      xsql := 'SELECT A.*, B.CIADES, A.TDIARID||'' - ''||C.TDIARDES ORIGEN, '
         + 'CASE WHEN D.CNTESTADO=''P'' THEN ''Contabilizado'' '
         + 'ELSE CASE WHEN D.CNTESTADO=''I'' THEN ''Inicial'' '
         + 'ELSE CASE WHEN D.CNTESTADO=''A'' THEN ''Anulado'' '
         + 'ELSE ''ERROR'' END '
         + 'END '
         + 'END ESTADO, D.CNTGLOSA GLOSA, M.TMONDES MONEDA, ' + xCampos
         + 'FROM CNT311 A, CNT300 D, TGE101 B, TGE104 C, TGE103 M '
         + 'WHERE ( A.CIAID=' + quotedstr(dblcCia.Text) + ' AND '
         + 'A.CNTANOMM=' + quotedstr(edtPeriodo.Text) + ' AND '
         + 'A.TDIARID=' + quotedstr(dblcTDiario.Text) + ' AND '
         + 'A.CNTCOMPROB=' + quotedstr(dbeNoComp.Text) + ' AND '
         + 'A.CIAID=D.CIAID AND A.TDIARID=D.TDIARID AND '
         + 'A.CNTANOMM=D.CNTANOMM AND A.CNTCOMPROB=D.CNTCOMPROB AND '
         + 'A.CIAID=B.CIAID AND A.TDIARID=C.TDIARID AND A.TMONID=M.TMONID ) '
         + 'ORDER BY A.CIAID, A.CNTANOMM, A.TDIARID, A.CNTREG';

   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;

   ppdbVoucher.DataSource := DMCNT.dsQry;
   pprv.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ComprobanteTX.rtm';
   pprv.template.LoadFromFile;

   If cbDisenoRep.Checked Then
      ppd1.ShowModal
   Else
   Begin
      pprv.Print;
      pprv.Stop;

      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;
      DMCNT.cdsMOVCNT1.EnableControls;

      ppdbVoucher.DataSource := Nil;
   End;
End;

Procedure TFRegComp.dbeGlosaExit(Sender: TObject);
Begin
   xGlosa := dbeGlosa.Text;
End;

Procedure TFRegComp.dbgMovCNTKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Var
   xCont: Integer;
   xNumReg : Integer;
   xSQL : String;
// Inicio HPC_201503_CNT
//   xxSQL : String;
// Fin HPC_201503_CNT
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If (DMCNT.cdsMovCNT1.RecordCount = 0) Or (xFlag) Or (xFlagCierre) Then exit;

      If DMCNT.cdsCabCnt.FieldByName('MODULO').AsString <> 'CNT' Then
      Begin
      // Inicio HPC_201503_CNT
         {
         If DMCNT.wUsuario <> 'ASANTANDER' Then
         Begin
            ShowMessage('No se puede Eliminar Registros. Modulo ' + DMCNT.cdsCabCnt.FieldByName('MODULO').AsString);
            Exit;
         End;
         }
         ShowMessage('No se puede Eliminar Registros. Módulo ' + DMCNT.cdsCabCnt.FieldByName('MODULO').AsString);
         Exit;
      // Fin HPC_201503_CNT
      End;

      If (bbtnAcepta.Enabled = True) Or (bbtnGraba.Enabled = True) Then
      Begin
         If MessageDlg(' Cuenta : ' + DMCNT.cdsMovCNT1.FieldByName('CUENTAID').AsString + chr(13) + chr(13)
            + '¿  Eliminar Registro  ? ' + chr(13), mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
         // Inicio HPC_201503_CNT
            xNumReg := DMCNT.cdsMovCnt1.FieldByName('CNTREG').AsInteger;
            xSQL := ' select CNTREG '
               + '      from CNT311 '
               + '     where CIAID = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString)
               + '       and CNTANOMM = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString)
               + '       and TDIARID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString)
               + '       and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString)
               + '       and CNTREG='+inttostr(xNumReg);
            DMCNT.cdsQry.Close;
            DMCNT.cdsQry.DataRequest(xSql);
            DMCNT.cdsQry.Open;
            If DMCNT.cdsQry.RecordCount > 1 Then
            Begin
               ShowMessage('Existe conflicto con el número de registro se procederá a renumerar'+chr(13)
                          +'Luego intente borrar el registro nuevamente');
               bbtnRenumDet.click;
               Exit;
            End;
            DMCNT.DCOM1.AppServer.IniciaTransaccion;
            xSQL := 'Delete from CNT311 '
               +    ' where CIAID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString)
               +    '   and TDIARID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString)
               +    '   and CNTANOMM='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString)
               +    '   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString)
               +    '   and CNTREG='+inttostr(xNumReg);
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Except
               DMCNT.DCOM1.AppServer.RetornaTransaccion;
               ShowMessage('No se pudo eliminar el Registro');
               exit;
            end;
            {
            DMCNT.cdsMovCNT1.Delete;

            DMCNT.cdsMovCnt1.DisableControls;

            xCont := 1;
            DMCNT.cdsMovCNT1.First;
            While Not DMCNT.cdsMovCNT1.eof Do
            Begin
               DMCNT.cdsMovCNT1.Edit;
               If DMCNT.cdsMovCNT1.fieldByName('CNTREG').AsInteger <> xCont Then
               Begin
                  DMCNT.cdsMovCNT1.fieldByName('CNTREG').AsInteger := xCont;
               End;
               DMCNT.cdsMovCNT1.next;
               xCont := xCont + 1;
            End;

            begin
            xSQL := 'update CNT311 '
                  + '  set CNTREG=rownum '
                  + ' where CIAID = ' + quotedstr(DMCNT.cdsMovCNT1.FieldByName('CIAID').AsString)
                  + '   and CNTANOMM = ' + quotedstr(DMCNT.cdsMovCNT1.FieldByName('CNTANOMM').AsString)
                  + '   and TDIARID=' + quotedstr(DMCNT.cdsMovCNT1.FieldByName('TDIARID').AsString)
                  + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsMovCNT1.FieldByName('CNTCOMPROB').AsString);
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Except
                  ShowMessage('No se pudo renumerar el Detalle');
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;

            end;
            }
            xSigueGrab := True;
            bbtnRenumDet.click;
            if not xSigueGrab then
            Begin
               ShowMessage('No se pudo eliminar completamente el Detalle');
               DMCNT.DCOM1.AppServer.RetornaTransaccion;
               exit;
            End;
            DMCNT.DCOM1.AppServer.GrabaTransaccion;
            ShowMessage('ok');

            DMCNT.cdsMovCnt1.EnableControls;
            TotalesResumen;
         // Fin HPC_201503_CNT
         End;
      End;
   End;
End;

// Inicio HPC_201503_CNT
{
Procedure TFRegComp.FormDestroy(Sender: TObject);
Begin
End;
}
// Fin HPC_201503_CNT
Procedure TFRegComp.dblcdCuentaExit(Sender: TObject);
Var
   sSQL: String;
Begin
   If (bbtnCanc.Focused) Then exit;

   If dblcdCuenta.Text = '' Then
   Begin
      ShowMessage('Ingrese Cuenta Contable');
      dblcdCuenta.SetFocus;
      exit;
   End;

   DMCNT.cdsMovCNT1.Edit;
   DMCNT.cdsMovCNT1.FieldByName('CUENTAID').AsString := trim(dblcdCuenta.Text);
   DMCNT.cdsCuenta.SetKey;
   DMCNT.cdsCuenta.FieldByName('CUENTAID').Asstring := dblcdCuenta.Text;
   If Not DMCNT.cdsCuenta.GotoKey Then
   Begin
      ShowMessage('Error : Cuenta Contable No Existe...');
      dblcdCuenta.SetFocus;
      Exit;
   End;

   edtCuenta.Text := '';
   edtCuenta.Text := DMCNT.cdsCuenta.FieldByName('CtaAbr').AsString;

   If length(edtCuenta.Text) = 0 Then
   Begin
      ShowMessage('Ingrese Cuenta Contable');
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

// cuando se actualiza un registro alimentado desde un módulo diferente al de contabilidad
   If (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString <> 'CNT') And
      (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString <> 'INT') Then
   Begin
      If DMCNT.cdsCabCnt.FieldByName('MODULO').AsString <> 'ALM' Then
      Begin
         DBLCCLASE.enabled := False;
         dblcTDoc.enabled := False;
         dbeSerie.enabled := False;
         dbeNodoc.enabled := False;
         dbdtpFEmis.enabled := False;
         dbdtpFVcmto.enabled := False;
         dblcTMon2.enabled := False;
         dbeMonto.enabled := False;
         dbeDH.enabled := False;
         dbeTCamb.enabled := False;
         dbeTCamb.enabled := False;
         dblcdAux.Enabled := False;
   // evalúa si pide o no Centro de Costo
         If DMCNT.cdsCuenta.FieldByName('CTA_CCOS').Asstring = 'S' Then
            xmov := 'S';
         If DMCNT.cdsCuenta.FieldByName('CTA_CCOS').Asstring = 'S' Then
         Begin
            dblcdCCosto.Enabled := True;
            dblcdCCosto.Color := clWindow;

            xSQL := 'SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 '
               + 'Where CCOSMOV=' + quotedstr('S')
               + ' and CCOSACT=''S'' AND CCOSCIAS LIKE ''%' + dblcCia.text + '%''';
            DMCNT.cdsCCosto.Close;
            DMCNT.cdsCCosto.DataRequest(xSQL);
            DMCNT.cdsCCosto.Open;
         End
         Else
         Begin
            DMCNT.cdsMovCNT1.FieldByName('CCOSID').AsString := '';
            dbeCCosto.Text := '';
            dblcdCCosto.Enabled := False;
            dblcdCCosto.Color := clSilver;
         End;
         exit;
      End;
   End;

// cuando se actualiza un registro alimentado desde módulo de contabilidad
   If (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'CNT') Or
      (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'ALM') Then
   Begin
      dbdtpFEmis.enabled := True;
      dbdtpFVcmto.enabled := True;
      dblcTMon2.enabled := True;
      dbeMonto.enabled := True;
      dbeDH.enabled := True;
      dbeglosa.enabled := True;
   End;

   DMCNT.cdsMovCNT1.Edit;
// evalúa si pide o no Auxiliar/Anexo
   If DMCNT.cdsCuenta.FieldByName('CTA_AUX').Asstring = 'S' Then
   Begin
      dblcClase.Enabled := True;
      dblcClase.Color := clWindow;
      If (dblcClase.Text = '') Then
   End
   Else
   Begin
      DMCNT.cdsMovCNT1.FieldByName('CLAUXID').AsString := '';
      DMCNT.cdsMovCNT1.FieldByName('AUXID').AsString := '';
      edtAux.Text := '';
      dblcClase.Enabled := False;
      dblcClase.Color := clSilver;
      dblcdAux.Enabled := False;
      dblcdAux.Color := clSilver;
   End;

// evalúa si pide o no datos de documento
   If DMCNT.cdsCuenta.FieldByName('CTA_DOC').Asstring = 'S' Then
   Begin
      dblcTdoc.Enabled := True;
      dblcTdoc.Color := clWindow;
      dbeSerie.Enabled := True;
      dbeSerie.Color := clWindow;
      dbeNoDoc.Enabled := True;
      dbeNoDoc.Color := clWindow;
   End
   Else
   Begin
      DMCNT.cdsMovCNT1.FieldByName('DOCID').AsString := '';
      dbeTDoc.Text := '';
      DMCNT.cdsMovCNT1.FieldByName('CNTSERIE').AsString := '';
      DMCNT.cdsMovCNT1.FieldByName('CNTNODOC').AsString := '';
      dblcTdoc.Enabled := False;
      dblcTdoc.Color := clSilver;
      dbeSerie.Enabled := False;
      dbeSerie.Color := clSilver;
      dbeNoDoc.Enabled := False;
      dbeNoDoc.Color := clSilver;
   End;

// evalúa si pide o no Centro de Costo
   If DMCNT.cdsCuenta.FieldByName('CTA_CCOS').Asstring = 'S' Then
      xmov := 'S';
   If DMCNT.cdsCuenta.FieldByName('CTA_CCOS').Asstring = 'S' Then
   Begin
      dblcdCCosto.Enabled := True;
      dblcdCCosto.Color := clWindow;

      xSQL := 'SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 '
            + 'Where CCOSMOV=' + quotedstr('S')
            + ' and CCOSACT=''S'' AND CCOSCIAS LIKE ''%' + dblcCia.text + '%''';
      DMCNT.cdsCCosto.Close;
      DMCNT.cdsCCosto.DataRequest(xSQL);
      DMCNT.cdsCCosto.Open;
   End
   Else
   Begin
      DMCNT.cdsMovCNT1.FieldByName('CCOSID').AsString := '';
      dbeCCosto.Text := '';
      dblcdCCosto.Enabled := False;
      dblcdCCosto.Color := clSilver;
   End;

// evalua si es cuenta de <<sólo moneda extranjera>>
   If DMCNT.cdsCuenta.FieldByName('CTA_ME').Asstring = 'S' Then
      dbeTCamb.Enabled := True
   Else
      dbeTCamb.Enabled := False;

   If dblcClase.Enabled Then
      dblcClase.setfocus
   Else
      If dblcTDoc.Enabled Then
         dblcTDoc.setfocus
      Else
         If dblcdCCosto.Enabled Then
            dblcdCCosto.setfocus
         Else
            dbdtpFEmis.setfocus;

End;

Procedure TFRegComp.dbdtpFEmisExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If (bbtnCanc.Focused) Then exit;
   //Inicio HPC_201701_CNT
   //Valida que la fecha de emisión sea menor igual que la fecha de comprobante.
   If dbdtpFEmis.date > dtpFComp.Date Then
   Begin
      showmessage('La Fecha de Emisión debe ser menor o igual a la fecha '+dtpFComp.Text+' del comprobante');
      dbdtpFEmis.setfocus;
   End;
   //Fin HPC_201701_CNT
   If dtpFComp.Date < dbdtpFEmis.date Then
   Begin
      DMCNT.cdsMovCnt1.FieldByName('CNTFVCMTO').AsDateTime := DMCNT.cdsMovCnt1.FieldByName('CNTFEMIS').AsDateTime;
   End;
End;

Procedure TFRegComp.dbdtpFVcmtoExit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If (bbtnCanc.Focused) Then exit;

   If dbdtpFVcmto.Date < dbdtpFEmis.date Then
   Begin
      showmessage('La Fecha de Vencimiento no puede se menor que la fecha de Emision');
      dbdtpFVcmto.setfocus;
   End;
End;

Procedure TFRegComp.dblcdAuxDropDown(Sender: TObject);
Begin
   DMCNT.cdsAuxiliar.indexfieldnames := 'AUXNOMB';
End;

Procedure TFRegComp.dblcdCCostoDropDown(Sender: TObject);
Begin
   DMCNT.cdsCCosto.indexfieldnames := 'CCOSID';
End;

Procedure TFRegComp.dblcClaseDropDown(Sender: TObject);
Begin
   DMCNT.cdsClAux.indexfieldnames := 'CLAUXID';
End;

Procedure TFRegComp.items;
Var
   xCont: Integer;
Begin

End;

Procedure TFRegComp.DBLCCLASEExit(Sender: TObject);
// Inicio HPC_201503_CNT
Var
   xSQL: String;
// Fin HPC_201503_CNT
Begin
   If bbtnCanc.Focused Then exit;
   If dblcdCuenta.Focused Then exit;

   DMCNT.cdsMovCNT1.Edit;
   DMCNT.cdsMovCNT1.FieldByName('CLAUXID').AsString := trim(dblcClase.Text);

   If length(dblcClase.Text) = 0 Then
   Begin
      ShowMessage('Ingrese Clase de Auxiliar');
      dblcClase.SetFocus;
      Exit;
   End;

// Inicio HPC_201503_CNT
   {
   DMCNT.cdsAuxiliar.Filter := '';
   DMCNT.cdsAuxiliar.Filter := 'CLAUXID=' + '''' + dblcClase.Text + ''' and ACTIVO=''S''';
   DMCNT.cdsAuxiliar.Filtered := True;
   }
   if DMCNT.cdsAuxiliar.Active = False then
   Begin
      xSQL := 'Select CLAUXID, AUXID, AUXNOMB, ACTIVO, AUXRUC '
             + '  from CNT201 '
             + ' where CLAUXID=' + quotedstr(dblcClase.Text)
             + '   and ACTIVO=''S'' '
             + ' order by AUXID ';
      DMCNT.cdsAuxiliar.PacketRecords:=50;
      DMCNT.cdsAuxiliar.Close;
      DMCNT.cdsAuxiliar.DataRequest(xSQL);
      DMCNT.cdsAuxiliar.Open;
   End
   Else
   Begin
      DMCNT.cdsAuxiliar.First;
      if DMCNT.cdsAuxiliar.FieldByName('CLAUXID').AsString<>dblcClase.Text then
      Begin
         xSQL := 'Select CLAUXID, AUXID, AUXNOMB, ACTIVO, AUXRUC '
                + '  from CNT201 '
                + ' where CLAUXID=' + quotedstr(dblcClase.Text)
                + '   and ACTIVO=''S'' '
                + ' order by AUXID ';
         DMCNT.cdsAuxiliar.PacketRecords:=50;
         DMCNT.cdsAuxiliar.Close;
         DMCNT.cdsAuxiliar.DataRequest(xSQL);
         DMCNT.cdsAuxiliar.Open;
      End;
   End;
// Fin HPC_201503_CNT

   edtAux.Text := '';
   dblcdAux.Enabled := True;
   dblcdAux.Color := clWindow;

   dblcdAux.SetFocus;
End;

Procedure TFRegComp.dblcTDocExit(Sender: TObject);
Begin
   If (bbtnCanc.Focused) Then exit;
   dbeTDoc.Text := '';
   If dblcTDoc.Text <> '' Then
   Begin
      dbeTDoc.Text := DMCNT.cdsTDoc.FieldByname('DOCABR').AsString;
      DMCNT.cdsMovCnt1.FieldByName('CNTMODDOC').AsString := DMCNT.cdsTDoc.FieldByname('DOCMOD').AsString;
   End;
   If length(dbeTDoc.Text) = 0 Then
   Begin
      ShowMessage('Ingrese Tipo de Documento');
      dblcTDoc.SetFocus;
   End;
End;

Procedure TFRegComp.dblcTDiarioEnter(Sender: TObject);
Begin
   DMCNT.cdsTDiario.IndexFieldNames := 'TDIARID';
End;

Procedure TFRegComp.MuestraDetalle;
Begin
   DMCNT.cdsMovCNT1.FieldByName('CIAID').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CUENTAID').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTMTOORI').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTFVCMTO').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTFEMIS').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTGLOSA').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTDH').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('AUXID').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CLAUXID').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('DOCID').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTSERIE').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTNODOC').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CCOSID').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTDEBEMN').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTDEBEME').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTHABEMN').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTHABEME').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('TDIARID').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTCUADRE').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTESTADO').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTCOMPROB').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTMTOLOC').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTMTOEXT').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CTADES').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('AUXDES').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('DOCDES').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CCOSDES').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('TDIARDES').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTANO').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTANOMM').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTLOTE').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('TMONID').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTTCAMBIO').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTTS').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTMODDOC').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTFCOMP').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTUSER').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTFREG').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTHREG').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTMM').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTDD').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTTRI').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTSEM').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTSS').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTAATRI').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTAASEM').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTAASS').Visible := False;
   DMCNT.cdsMovCNT1.FieldByName('CNTFAUTOM').Visible := False;

   DMCNT.cdsMovCNT1.FieldByName('CNTREG').Visible := True;
   DMCNT.cdsMovCNT1.FieldByName('CUENTAID').Visible := True;
   DMCNT.cdsMovCNT1.FieldByName('CLAUXID').Visible := True;
   DMCNT.cdsMovCNT1.FieldByName('AUXID').Visible := True;
   DMCNT.cdsMovCNT1.FieldByName('CCOSID').Visible := True;
   DMCNT.cdsMovCNT1.FieldByName('CNTGLOSA').Visible := True;
   DMCNT.cdsMovCNT1.FieldByName('CNTDH').Visible := True;
   DMCNT.cdsMovCNT1.FieldByName('CNTMTOORI').Visible := True;
   DMCNT.cdsMovCNT1.FieldByName('DOCID').Visible := True;
   DMCNT.cdsMovCNT1.FieldByName('CNTSERIE').Visible := True;
   DMCNT.cdsMovCNT1.FieldByName('CNTNODOC').Visible := True;
   DMCNT.cdsMovCNT1.FieldByName('CNTFEMIS').Visible := True;
   DMCNT.cdsMovCNT1.FieldByName('CNTFVCMTO').Visible := True;

   DMCNT.cdsMovCNT1.FieldByName('CNTREG').DisplayLabel := 'Item';
   DMCNT.cdsMovCNT1.FieldByName('CUENTAID').DisplayLabel := 'Cuenta';
   DMCNT.cdsMovCNT1.FieldByName('CLAUXID').DisplayLabel := 'Cl~Aux.';
   DMCNT.cdsMovCNT1.FieldByName('AUXID').DisplayLabel := 'Auxiliar';
   DMCNT.cdsMovCNT1.FieldByName('CCOSID').DisplayLabel := 'Centro~Costo';
   DMCNT.cdsMovCNT1.FieldByName('CNTGLOSA').DisplayLabel := 'Glosa';
   DMCNT.cdsMovCNT1.FieldByName('CNTDH').DisplayLabel := 'D/H';
   DMCNT.cdsMovCNT1.FieldByName('CNTMTOORI').DisplayLabel := 'Importe';
   DMCNT.cdsMovCNT1.FieldByName('DOCID').DisplayLabel := 'DOC~Id.';
   DMCNT.cdsMovCNT1.FieldByName('CNTSERIE').DisplayLabel := 'DOC~Serie';
   DMCNT.cdsMovCNT1.FieldByName('CNTNODOC').DisplayLabel := 'DOC~Número';
   DMCNT.cdsMovCNT1.FieldByName('CNTFEMIS').DisplayLabel := 'Fecha~Emisión';
   DMCNT.cdsMovCNT1.FieldByName('CNTFVCMTO').DisplayLabel := 'Fecha~Vcmto.';

   DMCNT.cdsMovCNT1.FieldByName('CNTREG').Index := 1;
   DMCNT.cdsMovCNT1.FieldByName('CUENTAID').Index := 2;
   DMCNT.cdsMovCNT1.FieldByName('CLAUXID').Index := 3;
   DMCNT.cdsMovCNT1.FieldByName('AUXID').Index := 4;
   DMCNT.cdsMovCNT1.FieldByName('CCOSID').Index := 5;
   DMCNT.cdsMovCNT1.FieldByName('CNTGLOSA').Index := 6;
   DMCNT.cdsMovCNT1.FieldByName('CNTDH').Index := 7;
   DMCNT.cdsMovCNT1.FieldByName('CNTMTOORI').Index := 8;
   DMCNT.cdsMovCNT1.FieldByName('DOCID').Index := 9;
   DMCNT.cdsMovCNT1.FieldByName('CNTSERIE').Index := 10;
   DMCNT.cdsMovCNT1.FieldByName('CNTNODOC').Index := 11;
   DMCNT.cdsMovCNT1.FieldByName('CNTFEMIS').Index := 12;
   DMCNT.cdsMovCNT1.FieldByName('CNTFVCMTO').Index := 13;

   DMCNT.cdsMovCNT1.FieldByName('CNTREG').DisplayWidth := 4;
   DMCNT.cdsMovCNT1.FieldByName('CUENTAID').DisplayWidth := 12;
   DMCNT.cdsMovCNT1.FieldByName('CLAUXID').DisplayWidth := 4;
   DMCNT.cdsMovCNT1.FieldByName('AUXID').DisplayWidth := 10;
   DMCNT.cdsMovCNT1.FieldByName('CCOSID').DisplayWidth := 9;
   DMCNT.cdsMovCNT1.FieldByName('CNTGLOSA').DisplayWidth := 35;
   DMCNT.cdsMovCNT1.FieldByName('CNTDH').DisplayWidth := 3;
   DMCNT.cdsMovCNT1.FieldByName('CNTMTOORI').DisplayWidth := 10;
   DMCNT.cdsMovCNT1.FieldByName('DOCID').DisplayWidth := 3;
   DMCNT.cdsMovCNT1.FieldByName('CNTSERIE').DisplayWidth := 4;
   DMCNT.cdsMovCNT1.FieldByName('CNTNODOC').DisplayWidth := 15;
   DMCNT.cdsMovCNT1.FieldByName('CNTFEMIS').DisplayWidth := 10;
   DMCNT.cdsMovCNT1.FieldByName('CNTFVCMTO').DisplayWidth := 10;

End;

Procedure TFRegComp.bbtnDesContaClick(Sender: TObject);
Var
   xSql: String;
Begin
   xSQL := 'SELECT * FROM TGE154 WHERE CIAID=' + quotedstr(dblcCia.text) +
      ' AND ANO=' + quotedstr(Copy(DateToStr(dtpFComp.Date), 7, 4));
   DMCNT.cdsCierres.close;
   DMCNT.cdsCierres.datarequest(xsql);
   DMCNT.cdsCierres.open;

   If DMCNT.cdsCierres.FieldByName('PER' + Copy(DateToStr(dtpFComp.Date), 4, 2)).AsString = 'S' Then
   Begin
      Showmessage('El periodo se encuentra Cerrado');
      exit;
   End;

   If UsuarioBloqueado(edtPeriodo.Text, DMCNT.wUsuario) Then
   Begin
      ShowMessage(' Usuario ' + DMCNT.wUsuario + ', fue bloqueado para registrar en este periodo ' + edtPeriodo.Text + '.' + #13 + #13 + 'Consulte al area de Contabilidad...');
      exit;
   End;

   If Not DMCNT.Accesos_a_Registros(DMCNT.cdsCabCnt.FieldByName('CNTUSER').AsString) Then
      Exit;

   If MessageDlg('Descontabilizar Comprobante' + chr(13) + chr(13) +
      '     ¿ Esta Seguro ?     ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then exit;

   DMCNT.cdsMovCNT1.CancelUpdates;
   DMCNT.cdsCabCNT.CancelUpdates;

   xSigueGrab := True;
   DMCNT.DCOM1.AppServer.IniciaTransaccion;

   If SOLDesConta(dblcCia.text, dblcTDiario.text, edtPeriodo.text, dbeNoComp.text,
      SRV_D, DMCNT.cdsNivel, DMCNT.DCOM1, Self) Then
   Begin

      DMCNT.Filtracds(DMCNT.cdsMovCNT1,
         'SELECT * FROM CNT311 WHERE '
         + 'CIAID=' + '''' + dblcCia.text + '''' + ' AND '
         + 'TDIARID=' + '''' + dblcTDiario.Text + '''' + ' AND '
         + 'CNTANOMM=' + '''' + edtperiodo.Text + '''' + ' AND '
         + 'CNTCOMPROB=' + '''' + dbeNoComp.text + '''');

      TotalesResumen;

      DMCNT.cdsCabCnt.Edit;
      DMCNT.cdsCabCnt.FieldByName('FLAGVAR').Clear;
      DMCNT.cdsCabCnt.FieldByName('CNTDEBEMN').AsFloat := DMCNT.FRound(strtofloat(dbeMND.Text), 15, 2);
      DMCNT.cdsCabCnt.FieldByName('CNTHABEMN').AsFloat := DMCNT.FRound(strtofloat(dbeMNC.Text), 15, 2);
      DMCNT.cdsCabCnt.FieldByName('CNTDEBEME').AsFloat := DMCNT.FRound(strtofloat(dbeMED.Text), 15, 2);
      DMCNT.cdsCabCnt.FieldByName('CNTHABEME').AsFloat := DMCNT.FRound(strtofloat(dbeMEC.Text), 15, 2);
      DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString := 'N';
      DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString := 'I';
      DMCNT.cdsCabCnt.FieldByName('CNTUSER').AsString := DMCNT.wUsuario; // usuario que registra
      DMCNT.cdsCabCNT.Post;

      Begin
         xSQL := 'Update CNT300 '
                +'   Set FLAGVAR=null, '
                +'       CNTDEBEMN='+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTDEBEMN').AsFloat)+','
                +'       CNTHABEMN='+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTHABEMN').AsFloat)+','
                +'       CNTDEBEME='+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTDEBEME').AsFloat)+','
                +'       CNTHABEME='+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTHABEME').AsFloat)+','
                +'       CNTCUADRE='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString)+','
                +'       CNTESTADO='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString)+','
                +'       CNTUSER='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTUSER').AsString)+','
                +'       CNTFREG=trunc(sysdate),'
                +'       CNTHREG=sysdate '
                +' where CIAID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString)
                +'   and TDIARID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString)
                +'   and CNTANOMM='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString)
                +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se pudo actualizar la cabecera en descontabilización');
            exit;
         end;
      End;
      DMCNT.DCOM1.AppServer.GrabaTransaccion;

      If DMCNT.wTipoAdicion = 'xFiltro' Then
         DMCNT.ActualizaFiltro(FRegistro.GComprobante, DMCNT.cdsCabCNT, 'M');

      MuestraDetalle;

      MuestraEstado(DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString, DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString);

      ShowMessage('Descontabilización Ok');
      bbtnRegresaClick(self);
      bbtnOKCabecClick(self);

      Close;
   End
   Else
   Begin
      ShowMessage('Error en Descontabilización');
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   End;
End;

Procedure TFRegComp.GeneraEnLinea401;
Var
   xNumNiv: Integer;
   xNivel, xSql: String;
   xZ: Integer;
   xNiv: Array[1..10] Of integer;
   xTipo: String;
   xConcatena: String;
Begin
   //** capturo el mes y al nño
   xAno := Copy(edtPeriodo.text, 1, 4);
   xMes := Copy(edtPeriodo.text, 5, 2);
   //** este bloque es para calcular las cuentas que tuvieran auxiliares
   //** para ello tomo la tabla de movimiento (CNT301)
   DMCNT.cdsMovCNT1.First;
   While Not DMCNT.cdsMovCNT1.EOF Do
   Begin
       //** Para Auxiliares
      If (DMCNT.cdsMovCNT1.FieldByName('CLAUXID').AsString <> '') And
         (DMCNT.cdsMovCNT1.FieldByName('AUXID').AsString <> '') Then
      Begin
          // resto al debe y al haber los montos que tienen en el CNT301
         xSQL := ' UPDATE CNT401 ' +
            ' SET DEBEMN' + xMes + '= DEBEMN' + xMes + ' - ' + DMCNT.cdsMovCNT1.FieldByName('CNTDEBEMN').AsString + ',' +
            '     DEBEME' + xMes + '= DEBEME' + xMes + ' - ' + DMCNT.cdsMovCNT1.FieldByName('CNTDEBEME').AsString + ',' +
            '     HABEMN' + xMes + '= HABEMN' + xMes + ' - ' + DMCNT.cdsMovCNT1.FieldByName('CNTHABEMN').AsString + ',' +
            '     HABEME' + xMes + '= HABEME' + xMes + ' - ' + DMCNT.cdsMovCNT1.FieldByName('CNTHABEME').AsString +
            ' WHERE CIAID=' + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('CIAID').AsString) +
            ' AND CUENTAID=' + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('CUENTAID').AsString) +
            ' AND CLAUXID=' + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('CLAUXID').AsString) +
            ' AND AUXID=' + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('AUXID').AsString) +
            ' AND ANO=' + quotedstr(xAno);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
         End;
         xMesA := DMCNT.StrZero(IntToStr(StrToInt(xmes) - 1), 2);
         xSql := 'UPDATE CNT401 SET ' +
            'SALDMN' + xMes + '= (' + wReplacCeros + '(SALDMN' + xMesA + ',0)+' +
            wReplacCeros + '(DEBEMN' + xMes + ',0))- ' + wReplacCeros + '(HABEMN' + xMes + ',0),' +
            'SALDME' + xMes + '= (' + wReplacCeros + '(SALDME' + xMesA + ',0)+' +
            wReplacCeros + '(DEBEME' + xMes + ',0))- ' + wReplacCeros + '(HABEME' + xMes + ',0),';
         For xZ := StrToInt(xMes) + 1 To 13 Do
         Begin
            xMesT := DMCNT.StrZero(IntToStr(xZ), 2);
            xSQL := xSQL + 'SALDMN' + xMesT + '=(' + wReplacCeros + '(SALDMN' + xMesA + ',0)+' +
               wReplacCeros + '(DEBEMN' + xMes + ',0))- ' + wReplacCeros + '(HABEMN' + xMes + ',0),';
         End;
         For xZ := StrToInt(xMes) + 1 To 13 Do
         Begin
            xMesT := DMCNT.StrZero(IntToStr(xZ), 2);
            If xZ <> 13 Then
               xSQL := xSQL + 'SALDME' + xMesT + '=(' + wReplacCeros + '(SALDME' + xMesA + ',0)+' +
                  wReplacCeros + '(DEBEME' + xMes + ',0))- ' + wReplacCeros + '(HABEME' + xMes + ',0),'
            Else
               xSQL := xSQL + 'SALDME' + xMesT + '=(' + wReplacCeros + '(SALDME' + xMesA + ',0)+' +
                  wReplacCeros + '(DEBEME' + xMes + ',0))- ' + wReplacCeros + '(HABEME' + xMes + ',0)';
         End;
         xSQL := xSQL + ' WHERE CIAID=' + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('CIAID').AsString) +
            ' AND CUENTAID=' + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('CUENTAID').AsString) +
            ' AND CLAUXID=' + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('CLAUXID').AsString) +
            ' AND AUXID=' + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('AUXID').AsString) +
            ' AND ANO=' + quotedstr(xAno);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
         End;
      End;

      DMCNT.cdsMovCNT1.Next;
   End;

///////////////////// para C. Costos ///////////////////////////////////
   //** este bloque es para calcular las cuentas que tuvieran centro de costo
   //** para ello tomo la tabla de movimiento (CNT301)
   DMCNT.cdsMovCNT1.First;
   While Not DMCNT.cdsMovCNT1.EOF Do
   Begin
       //** Para centro de costo
      If (DMCNT.cdsMovCNT1.FieldByName('CCOSID').AsString <> '') Then
      Begin
         xSQL := ' UPDATE CNT401 ' +
            ' SET DEBEMN' + xMes + '= DEBEMN' + xMes + ' - ' + DMCNT.cdsMovCNT1.FieldByName('CNTDEBEMN').AsString + ',' +
            '     DEBEME' + xMes + '= DEBEME' + xMes + ' - ' + DMCNT.cdsMovCNT1.FieldByName('CNTDEBEME').AsString + ',' +
            '     HABEMN' + xMes + '= HABEMN' + xMes + ' - ' + DMCNT.cdsMovCNT1.FieldByName('CNTHABEMN').AsString + ',' +
            '     HABEME' + xMes + '= HABEME' + xMes + ' - ' + DMCNT.cdsMovCNT1.FieldByName('CNTHABEME').AsString +
            ' WHERE CIAID=' + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('CIAID').AsString) +
            ' AND CUENTAID=' + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('CUENTAID').AsString) +
            ' AND CCOSID=' + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('CCOSID').AsString) +
            ' AND ANO=' + quotedstr(xAno);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
         End;
          //** actulizo los saldos para la cuenta
         xMesA := DMCNT.StrZero(IntToStr(StrToInt(xmes) - 1), 2);
         xSql := 'UPDATE CNT401 SET ' +
            'SALDMN' + xMes + '= (' + wReplacCeros + '(SALDMN' + xMesA + ',0)+' +
            wReplacCeros + '(DEBEMN' + xMes + ',0))- ' + wReplacCeros + '(HABEMN' + xMes + ',0),' +
            'SALDME' + xMes + '= (' + wReplacCeros + '(SALDME' + xMesA + ',0)+' +
            wReplacCeros + '(DEBEME' + xMes + ',0))- ' + wReplacCeros + '(HABEME' + xMes + ',0),';
         For xZ := StrToInt(xMes) + 1 To 13 Do
         Begin
            xMesT := DMCNT.StrZero(IntToStr(xZ), 2);
            xSQL := xSQL + 'SALDMN' + xMesT + '=(' + wReplacCeros + '(SALDMN' + xMesA + ',0)+' +
               wReplacCeros + '(DEBEMN' + xMes + ',0))- ' + wReplacCeros + '(HABEMN' + xMes + ',0),';
         End;
         For xZ := StrToInt(xMes) + 1 To 13 Do
         Begin
            xMesT := DMCNT.StrZero(IntToStr(xZ), 2);
            If xZ <> 13 Then
               xSQL := xSQL + 'SALDME' + xMesT + '=(' + wReplacCeros + '(SALDME' + xMesA + ',0)+' +
                  wReplacCeros + '(DEBEME' + xMes + ',0))- ' + wReplacCeros + '(HABEME' + xMes + ',0),'
            Else
               xSQL := xSQL + 'SALDME' + xMesT + '=(' + wReplacCeros + '(SALDME' + xMesA + ',0)+' +
                  wReplacCeros + '(DEBEME' + xMes + ',0))- ' + wReplacCeros + '(HABEME' + xMes + ',0)';
         End;
         xSQL := xSQL + ' WHERE CIAID=' + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('CIAID').AsString) +
            ' AND CUENTAID=' + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('CUENTAID').AsString) +
            ' AND CCOSID=' + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('CCOSID').AsString) +
            ' AND ANO=' + quotedstr(xAno);

         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
         End;
      End;
      DMCNT.cdsMovCNT1.Next;
   End;

  //** genero montos de las cuentas en la CNT401 que no tengan Auxid y CCOSID
   DMCNT.cdsMovCNT1.First;
   While Not DMCNT.cdsMovCNT1.EOF Do
   Begin
      If (DMCNT.cdsMovCNT1.FieldByName('CLAUXID').AsString = '') And
         (DMCNT.cdsMovCNT1.FieldByName('AUXID').AsString = '') And
         (DMCNT.cdsMovCNT1.FieldByName('CCOSID').AsString = '') Then
      Begin
        //** solo debe entrar una vez por cuenta,
         If xCuentaStr <> DMCNT.cdsMovCNT1.FieldByName('CUENTAID').AsString Then
         Begin
            xSql := 'select a.ciaid,a.cuentaid,sum(' + wReplacCeros + '(a.cntdebemn,0)) cntdebemn,sum(' + wReplacCeros + '(a.cntdebeme,0)) cntdebeme,' +
               'sum(' + wReplacCeros + '(a.cnthabemn,0)) cnthabemn, sum(' + wReplacCeros + '(a.cnthabeme,0)) cnthabeme,' +
               '(sum(' + wReplacCeros + '(a.cntdebemn,0)) -  sum(' + wReplacCeros + '(a.cnthabemn,0))) saldmn' + DMCNT.StrZero(xMes, 2) + ',' +
               '(sum(' + wReplacCeros + '(a.cntdebeme,0)) -  sum(' + wReplacCeros + '(a.cnthabeme,0))) saldme' + DMCNT.StrZero(xMes, 2) +
               ' from cnt301 a,cnt401 b' +
               ' where a.cntanomm=' + quotedstr(edtPeriodo.text) + ' AND a.CIAID=' + quotedstr(dblcCia.text) +
               ' and a.cntcomprob=' + quotedstr(dbeNoComp.text) + ' and a.tdiarid=' + quotedstr(dblcTDiario.text) +
               ' AND a.cuentaid=' + quotedstr(DMCNT.cdsMovCNT1.FieldByName('CUENTAID').AsString) + ' AND (b.cuentaid(+)=a.cuentaid and ' +
               wReplacCeros + '(b.auxid(+),''-'') = ''-'' and ' + wReplacCeros + '(b.ccosid(+),''-'') = ''-'' and ' +
               wreplacCeros + '(b.clauxid(+),''-'') = ''-'' and b.ano=' + quotedstr(xAno) + ' AND b.CIAID=' + quotedstr(dblcCia.text) + ')' +
               ' group by a.ciaid,a.cntano,a.cntanomm,a.cuentaid';
            DMCNT.cdsqry2.Close;
            DMCNT.cdsqry2.ProviderName := 'PrvTGE';
            DMCNT.cdsqry2.DataRequest(xSQL);
            DMCNT.cdsqry2.Open;
            DMCNT.cdsqry2.IndexFieldNames := 'CIAID;CUENTAID';
            xCuentaStr := DMCNT.cdsMovCNT1.FieldByName('CUENTAID').AsString;
            GrabaSaldos;
         End;
      End;
      DMCNT.cdsMovCNT1.Next;
   End;

  //** genero montos de las cuentas en la CNT401 que no tengan Auxid y CCOSID
   DMCNT.cdsMovCNT1.First;
   While Not DMCNT.cdsMovCNT1.EOF Do
   Begin
      If (DMCNT.cdsMovCNT1.FieldByName('CLAUXID').AsString = '') And
         (DMCNT.cdsMovCNT1.FieldByName('AUXID').AsString = '') And
         (DMCNT.cdsMovCNT1.FieldByName('CCOSID').AsString = '') Then
      Begin
         xSql := 'SELECT CTANIV,CUENTAID FROM TGE202 WHERE CUENTAID=' +
            quotedstr(DMCNT.cdsMovCNT1.FieldByName('CUENTAID').AsString) +
            ' AND CIAID = ' + quotedstr(dblcCia.text);
         DMCNT.cdsCuenta.close;
         DMCNT.cdsCuenta.datarequest(xsql);
         DMCNT.cdsCuenta.open;
         xTipo := DMCNT.cdsCuenta.fieldbyname('CTANIV').AsString;

         xNivel := IntToStr(StrToInt(xTipo) - 1);
         DMCNT.cdsNivel.SetKey;
         DMCNT.cdsNivel.fieldbyname('NIVEL').AsString := xNivel; //IntToStr(xNiv[xZ]);
         If DMCNT.cdsNivel.GotoKey Then
            xDigitos := StrToInt(DMCNT.cdsNivel.fieldbyname('DIGITOS').AsString);

         xCuentaStr := copy(DMCNT.cdsMovCNT1.FieldByName('CUENTAID').AsString, 1, xDigitos);
         xConcatena := xCuentaStr + '%';

      // Inicio HPC_201503_CNT
         {
         xSql := 'SELECT TGE202.ciaid, tge202.cuentaid,' +
            ' sum(debemn' + DMCNT.StrZero(xMes, 2) + ') cntdebemn,' +
            ' sum(debeme' + DMCNT.StrZero(xMes, 2) + ') cntdebeme,' +
            ' sum(habemn' + DMCNT.StrZero(xMes, 2) + ') cnthabemn,' +
            ' sum(habeme' + DMCNT.StrZero(xMes, 2) + ') cnthabeme,' +
            '(sum(debemn' + DMCNT.StrZero(xMes, 2) + ') -  sum(habemn' + DMCNT.StrZero(xMes, 2) + ')) SALDMN' + DMCNT.StrZero(xMes, 2) + ',' +
            '(sum(debeme' + DMCNT.StrZero(xMes, 2) + ') -  sum(habeme' + DMCNT.StrZero(xMes, 2) + ')) SALDME' + DMCNT.StrZero(xMes, 2);

         If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
         Begin
            xSql := xSql + ' from cnt401 a' +
               ' left join tge202 b on (b.ctaniv=' + quotedstr(IntToStr(xNiv[xZ])) +
               ' and b.cuentaid= substr(b.cuentaid,1,' + IntToSTr(xDigitos1) + ')) ';
            xSql := xSql + ' and b.CIAID=' + quotedstr(dblcCia.text);
            xSql := xSql + ' where ((' + wReplacCeros + '(CNT401.auxid,''-'') = ''-'') or (CNT401.auxid = '''')) and ((' +
               wReplacCeros + '(CNT401.ccosid,''-'') = ''-'') or (CNT401.ccosid = '''')) and ((' +
               wReplacCeros + '(CNT401.clauxid,''-'') = ''-'') or (CNT401.clauxid = '''')) ' +
               ' and CNT401.tipo= ' + quotedstr(xNivel) +
               '  and CNT401.ANO=' + quotedstr(xAno);
            xSql := xSql + ' and CNT401.CIAID=' + quotedstr(dblcCia.text);
            xSql := xSql + ' group by  b.ciaid,b.cuentaid ORDER BY b.cuentaid';

         End
         Else
            If SRV_D = 'ORACLE' Then
            Begin
               xSql := xSql + ' from CNT401,TGE202' +
                  ' where ((' + wReplacCeros + '(CNT401.auxid,''-'') = ''-'') or (CNT401.auxid = '''')) and ((' +
                  wReplacCeros + '(CNT401.ccosid,''-'') = ''-'') or (CNT401.ccosid = '''')) and ((' +
                  wReplacCeros + '(CNT401.clauxid,''-'') = ''-'') or (CNT401.clauxid = '''')) ' +
                  ' and CNT401.tipo= ' + quotedstr(xNivel) +
                  '  and CNT401.ANO=' + quotedstr(xAno);
               xSql := xSql + ' and CNT401.CIAID=' + quotedstr(dblcCia.text) +
               ' and tge202.cuentaid(+)= substr(CNT401.cuentaid,1,' + IntToSTr(xDigitos) + ')';
               xSql := xSql + ' and tge202.CIAID(+)=' + quotedstr(dblcCia.text) + ' and CNT401.cuentaid like' + quotedstr(xConcatena);
               xSql := xSql + ' group by  tge202.ciaid,tge202.cuentaid ORDER BY tge202.cuentaid';
            End;
         }
         xSql := 'Select TGE202.CIAID, TGE202.CUENTAID,'
            +    '       sum(DEBEMN' + DMCNT.StrZero(xMes, 2) + ') CNTDEBEMN,'
            +    '       sum(DEBEME' + DMCNT.StrZero(xMes, 2) + ') CNTDEBEME,'
            +    '       sum(HABEMN' + DMCNT.StrZero(xMes, 2) + ') CNTHABEMN,'
            +    '       sum(HABEME' + DMCNT.StrZero(xMes, 2) + ') CNTHABEME,'
            +    '      (sum(DEBEMN' + DMCNT.StrZero(xMes, 2) + ') '
            +    '    -  sum(HABEMN' + DMCNT.StrZero(xMes, 2) + ')) SALDMN' + DMCNT.StrZero(xMes, 2) + ','
            +    '      (sum(DEBEME' + DMCNT.StrZero(xMes, 2) + ') '
            +    '    -  sum(HABEME' + DMCNT.StrZero(xMes, 2) + ')) SALDME' + DMCNT.StrZero(xMes, 2)
            +    '  from CNT401, TGE202'
            +    ' where ((nvl(CNT401.AUXID,''-'') = ''-'') or (CNT401.AUXID = '''')) '
            +    '   and ((nvl(CNT401.CCOSID,''-'') = ''-'') or (CNT401.CCOSID = '''')) '
            +    '   and ((nvl(CNT401.CLAUXID,''-'') = ''-'') or (CNT401.CLAUXID = '''')) '
            +    '   and CNT401.TIPO= ' + quotedstr(xNivel)
            +    '   and CNT401.ANO=' + quotedstr(xAno)
            +    '   and CNT401.CIAID=' + quotedstr(dblcCia.text)
            +    '   and TGE202.CUENTAID(+)= substr(CNT401.CUENTAID,1,' + IntToSTr(xDigitos) + ')'
            +    '   and TGE202.CIAID(+)='+quotedstr(dblcCia.text)
            +    '   and CNT401.CUENTAID like' + quotedstr(xConcatena)
            +    ' group by TGE202.CIAID,TGE202.CUENTAID order by TGE202.CUENTAID';
      // Fin HPC_201503_CNT
         DMCNT.cdsQry2.Close;
         DMCNT.cdsQry2.ProviderName := 'PrvTGE';
         DMCNT.cdsQry2.DataRequest(xSQL);
         DMCNT.cdsQry2.Open;
         DMCNT.cdsQry2.IndexFieldNames := 'CIAID;CUENTAID';
         GrabaSaldos;

      End;
      DMCNT.cdsMovCNT1.Next;
   End;
   DMCNT.cdsQry2.IndexFieldNames := '';
End;

Procedure TFRegComp.GrabaSaldos;
Var
   xZ: Integer;
   xSql: String;
Begin
   DMCNT.cdsRCuenta.Close;
   xSql := 'SELECT * FROM CNT401 WHERE (' + wReplacCeros + '(CNT401.AUXID,''-'') = ''-'' OR (CNT401.AUXID <> ''''))' +
      ' and (' + wReplacCeros + '(CNT401.CCOSID,''-'') = ''-'' OR (CNT401.CCOSID <> '''')) and (' +
      wReplacCeros + '(CNT401.CLAUXID,''-'') = ''-'' OR (CNT401.CLAUXID <> ''''))' +
      ' AND CNT401.ANO=' + quotedstr(xAno) +
      ' AND CUENTAID=' + quotedstr(xCuentaStr)
      + ' AND CNT401.CIAID=' + quotedstr(dblcCia.text);

   xMesA := DMCNT.StrZero(IntToStr(StrToInt(xmes) - 1), 2);

   DMCNT.cdsRCuenta.DataRequest(xSql);
   DMCNT.cdsRCuenta.Open;
   DMCNT.cdsRCuenta.IndexFieldNames := 'CIAID;CUENTAID';
   DMCNT.cdsQry2.First;
   While Not DMCNT.cdsQry2.eof Do
   Begin
      DMCNT.cdsRCuenta.Setkey;
      DMCNT.cdsRCuenta.FieldByname('CIAID').AsString := DMCNT.cdsQry2.FieldByName('CIAID').AsString;
      DMCNT.cdsRCuenta.FieldByname('CUENTAID').AsString := DMCNT.cdsQry2.FieldByName('CUENTAID').AsString;
      If DMCNT.cdsRCuenta.Gotokey Then
      Begin
         DMCNT.cdsRCuenta.edit;
         DMCNT.cdsRCuenta.FieldByname('DEBEMN' + DMCNT.StrZero(xMes, 2)).AsFloat :=
            DMCNT.cdsRCuenta.FieldByname('DEBEMN' + DMCNT.StrZero(xMes, 2)).AsFloat -
            DMCNT.cdsQry2.FieldByName('CNTDEBEMN').AsFloat;
         DMCNT.cdsRCuenta.FieldByname('DEBEME' + DMCNT.StrZero(xMes, 2)).AsFloat :=
            DMCNT.cdsRCuenta.FieldByname('DEBEME' + DMCNT.StrZero(xMes, 2)).AsFloat -
            DMCNT.cdsQry2.FieldByName('CNTDEBEME').AsFloat;
         DMCNT.cdsRCuenta.FieldByname('HABEMN' + DMCNT.StrZero(xMes, 2)).AsFloat :=
            DMCNT.cdsRCuenta.FieldByname('HABEMN' + DMCNT.StrZero(xMes, 2)).AsFloat -
            DMCNT.cdsQry2.FieldByName('CNTHABEMN').AsFloat;
         DMCNT.cdsRCuenta.FieldByname('HABEME' + DMCNT.StrZero(xMes, 2)).AsFloat :=
            DMCNT.cdsRCuenta.FieldByname('HABEME' + DMCNT.StrZero(xMes, 2)).AsFloat -
            DMCNT.cdsQry2.FieldByName('CNTHABEME').AsFloat;

         DMCNT.cdsRCuenta.FieldByname('SALDMN' + DMCNT.StrZero(xMes, 2)).AsFloat :=
            DMCNT.cdsRCuenta.FieldByname('SALDMN' + DMCNT.StrZero(xMes, 2)).AsFloat -
            DMCNT.cdsQry2.FieldByName('SALDMN' + DMCNT.StrZero(xMes, 2)).AsFloat;
         DMCNT.cdsRCuenta.FieldByname('SALDME' + DMCNT.StrZero(xMes, 2)).AsFloat :=
            DMCNT.cdsRCuenta.FieldByname('SALDME' + DMCNT.StrZero(xMes, 2)).AsFloat -
            DMCNT.cdsQry2.FieldByName('SALDME' + DMCNT.StrZero(xMes, 2)).AsFloat;

         For xZ := StrToInt(xMes) + 1 To 13 Do
         Begin
            xMesT := DMCNT.StrZero(IntToStr(xZ), 2);
            DMCNT.cdsRCuenta.FieldByname('SALDMN' + xMesT).AsFloat :=
               DMCNT.cdsRCuenta.FieldByname('SALDMN' + xMesT).AsFloat -
               DMCNT.cdsQry2.FieldByName('SALDMN' + DMCNT.StrZero(xMes, 2)).AsFloat;
            DMCNT.cdsRCuenta.FieldByname('SALDME' + xMesT).AsFloat :=
               DMCNT.cdsRCuenta.FieldByname('SALDME' + xMesT).AsFloat -
               DMCNT.cdsQry2.FieldByName('SALDME' + DMCNT.StrZero(xMes, 2)).AsFloat
         End;
      End;
      DMCNT.cdsRCuenta.Post;
      DMCNT.cdsQry2.next;
   End;
   Try
      If DMCNT.cdsRCuenta.ApplyUpdates(0) > 0 Then
      Begin
         ShowMessage('No se puede actualizar Cuenta');
         exit;
      End;
   Except
   End;
End;

Procedure TFRegComp.FormCreate(Sender: TObject);
Begin
   wCiaT := '';

   CargaDataSource;

End;

Procedure TFRegComp.dblcTMon2Exit(Sender: TObject);
Begin
   If xCrea Then Exit;
   If bbtnCanc.Focused Then Exit;

   xWhere := 'TMonId=' + '''' + dblcTMon2.Text + '''';
   If DMCNT.DisplayDescrip('PrvTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES') = '' Then
   Begin
      ShowMessage('Falta Tipo de Moneda');
      dblcTMon2.SetFocus;
   End;
End;

Procedure TFRegComp.BuscaTipoCancelacion;
Var
   XSQL: String;
Begin
   xsql := 'SELECT * FROM CAJA302 '
         + ' WHERE  CIAID=''' + DMCNT.cdsCabCNT.fieldbyname('CIAID').asstring
         + ' '' AND TDIARID=''' + DMCNT.cdsCabCNT.fieldbyname('TDIARID').asstring
         + ' '' AND ECANOMM=''' + DMCNT.cdsCabCNT.fieldbyname('CNTANOMM').asstring
         + ' '' AND ECNOCOMP=''' + DMCNT.cdsCabCNT.fieldbyname('CNTCOMPROB').asstring + '''';
   DMCNT.cdsQry3.Close;
   DMCNT.cdsQry3.DataRequest(xsql);
   DMCNT.cdsQry3.Open;

  //Para Pagos Provisionados
   xsql := 'SELECT * FROM CAJA304 '
      + ' WHERE CIAID=''' + DMCNT.cdsMovCNT1.fieldbyname('CIAID').asstring
      + ' '' AND TDIARID=''' + DMCNT.cdsMovCNT1.fieldbyname('TDIARID').asstring
      + ' '' AND ECANOMM=''' + DMCNT.cdsMovCNT1.fieldbyname('CNTANOMM').asstring
      + ' '' AND ECNOCOMP=''' + DMCNT.cdsMovCNT1.fieldbyname('CNTCOMPROB').asstring + '''';
   DMCNT.cdsReporteC.close;
   DMCNT.cdsReporteC.datarequest(xsql);
   DMCNT.cdsReporteC.open;
   DMCNT.cdsReporteC.IndexFieldNames := 'CIAID;TDIARID;ECANOMM;ECNOCOMP;DOCID;DCSERIE;DCNODOC;NREG';

   DMCNT.cdsReporteC.SetKey;
   DMCNT.cdsReporteC.fieldbyname('CIAID').asstring := DMCNT.cdsMovCNT1.fieldbyname('CIAID').asstring;
   DMCNT.cdsReporteC.fieldbyname('TDIARID').asstring := DMCNT.cdsMovCNT1.fieldbyname('TDIARID').asstring;
   DMCNT.cdsReporteC.fieldbyname('ECANOMM').asstring := DMCNT.cdsMovCNT1.fieldbyname('CNTANOMM').asstring;
   DMCNT.cdsReporteC.fieldbyname('ECNOCOMP').asstring := DMCNT.cdsMovCNT1.fieldbyname('CNTCOMPROB').asstring;
   DMCNT.cdsReporteC.fieldbyname('DOCID').asstring := DMCNT.cdsMovCNT1.fieldbyname('DOCID').asstring;
   DMCNT.cdsReporteC.fieldbyname('DCSERIE').asstring := DMCNT.cdsMovCNT1.fieldbyname('CNTSERIE').asstring;
   DMCNT.cdsReporteC.fieldbyname('DCNODOC').asstring := DMCNT.cdsMovCNT1.fieldbyname('CNTNODOC').asstring;
   DMCNT.cdsReporteC.fieldbyname('NREG').asstring := DMCNT.cdsMovCNT1.fieldbyname('CNTREG').asstring;
   If DMCNT.cdsReporteC.GotoKey Then
   Begin
      If (DMCNT.cdsReporteC.Fieldbyname('CUENTAID').asstring <> DMCNT.cdsMovCNT1.fieldbyname('CUENTAID').asstring) Or
         (DMCNT.cdsReporteC.Fieldbyname('CCOSID').asstring <> DMCNT.cdsMovCNT1.fieldbyname('CCOSID').asstring) Then
      Begin
         If (DMCNT.cdsQry3.fieldbyname('EC_PROCE').asstring = 'B') Or
            (DMCNT.cdsQry3.fieldbyname('EC_PROCE').asstring = '3') Then
         Begin
            xsql := 'UPDATE CAJA303 '
                  + ' SET CUENTAID=''' + DMCNT.cdsMovCNT1.fieldbyname('CUENTAID').asstring
                  + ''', CCOSID=''' + DMCNT.cdsMovCNT1.fieldbyname('CCOSID').asstring
                  + ''' WHERE CIAID=''' + DMCNT.cdsMovCNT1.fieldbyname('CIAID').asstring
                  + ' '' AND TDIARID=''' + DMCNT.cdsMovCNT1.fieldbyname('TDIARID').asstring
                  + ' '' AND ECANOMM=''' + DMCNT.cdsMovCNT1.fieldbyname('CNTANOMM').asstring
                  + ' '' AND ECNOCOMP=''' + DMCNT.cdsMovCNT1.fieldbyname('CNTCOMPROB').asstring
                  + ' '' AND DOCID2=''' + DMCNT.cdsMovCNT1.fieldbyname('DOCID').asstring
                  + ' '' AND CPSERIE=''' + DMCNT.cdsMovCNT1.fieldbyname('CNTSERIE').asstring
                  + ' '' AND CPNODOC=''' + DMCNT.cdsMovCNT1.fieldbyname('CNTNODOC').asstring
                  + '''';
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Except
            // Inicio HPC_201503_CNT
               xSigueGrab := False;
            // Fin HPC_201503_CNT
            End;
         End;
         If (DMCNT.cdsQry3.fieldbyname('EC_PROCE').asstring = 'B') Or
            (DMCNT.cdsQry3.fieldbyname('EC_PROCE').asstring = '1') Then
         Begin
            xsql := 'UPDATE CAJA301 '
                  + ' SET CUENTAID=''' + DMCNT.cdsMovCNT1.fieldbyname('CUENTAID').asstring
                  + ''', CCOSID=''' + DMCNT.cdsMovCNT1.fieldbyname('CCOSID').asstring
                  + ''' WHERE CIAID=''' + DMCNT.cdsMovCNT1.fieldbyname('CIAID').asstring
                  + ' '' AND TDIARID=''' + DMCNT.cdsMovCNT1.fieldbyname('TDIARID').asstring
                  + ' '' AND ECANOMM=''' + DMCNT.cdsMovCNT1.fieldbyname('CNTANOMM').asstring
                  + ' '' AND ECNOCOMP=''' + DMCNT.cdsMovCNT1.fieldbyname('CNTCOMPROB').asstring
                  + ' '' AND DOCID2=''' + DMCNT.cdsMovCNT1.fieldbyname('DOCID').asstring
                  + ' '' AND CPSERIE=''' + DMCNT.cdsMovCNT1.fieldbyname('CNTSERIE').asstring
                  + ' '' AND CPNODOC=''' + DMCNT.cdsMovCNT1.fieldbyname('CNTNODOC').asstring
                  + '''';
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Except
            // Inicio HPC_201503_CNT
               xSigueGrab := False;
            // Fin HPC_201503_CNT
            End;
         End;
         If DMCNT.cdsQry3.fieldbyname('EC_PROCE').asstring = 'C' Then
         Begin
            xsql := 'UPDATE CAJA301 '
               + ' SET CUENTAID=''' + DMCNT.cdsMovCNT1.fieldbyname('CUENTAID').asstring
               + ''', CCOSID=''' + DMCNT.cdsMovCNT1.fieldbyname('CCOSID').asstring
               + ''' WHERE CIAID=''' + DMCNT.cdsMovCNT1.fieldbyname('CIAID').asstring
               + ''' AND DOCID2=''' + DMCNT.cdsMovCNT1.fieldbyname('DOCID').asstring
               + ''' AND CPSERIE=''' + DMCNT.cdsMovCNT1.fieldbyname('CNTSERIE').asstring
               + ''' AND CPNODOC=''' + DMCNT.cdsMovCNT1.fieldbyname('CNTNODOC').asstring
               + ''' AND DEMTOLOC=' + DMCNT.cdsMovCNT1.fieldbyname('CNTMTOLOC').asstring;
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Except
            // Inicio HPC_201503_CNT
               xSigueGrab := False;
            // Fin HPC_201503_CNT
            End;
         End;

      End;
   End;

  //Para Pagos No Provisionados
   If DMCNT.cdsQry3.fieldbyname('EC_PROCE').asstring = '1' Then
   Begin
   End;

End;

Procedure TFRegComp.FormShow(Sender: TObject);
Var
   xWhere: String;
Begin
   pnlMantComp.Visible := False;
   pnlAdm.Enabled := False;

   DMCNT.AccesosUsuarios(DMCNT.wModulo, DMCNT.wUsuario, '2', Screen.ActiveForm.Name);
   xCrea := True;
   DMCNT.cdsMovCNT1.Filtered := False; //// Agregado para Filtros...
   IniciaDatos;

   xCompNew := False;
   wNewR := False;

   If (DMCNT.wModo = 'A') Or (DMCNT.wModo = 'N') Then
   Begin //// Agregado para Filtros...
      lblModulo.Caption := 'CNT';
      bbtnAdm.Caption := 'CNT';
      pnlDatosCab.Enabled := True;
      dblcCia.Enabled := True;
      dtpFComp.Enabled := True;
      dblcTDiario.Enabled := True;
      dbeNoComp.Enabled := True;
      dtpFComp.Date := DATE;
      DecodeDate(DATE, Year, Month, Day);
      cbTCambio.ItemIndex := 0;
      xCampo := 'BV';
      dblcCia.SetFocus;
   End
   Else
   Begin
      dbgMovCNT.DataSource := DMCNT.dsMovCNT1;
      dblcCia.Text := DMCNT.cdsCabCNT.FieldByName('CIAID').AsString;

      lblModulo.Caption := DMCNT.cdsCabCNT.FieldByName('MODULO').AsString;
      bbtnAdm.Caption := DMCNT.cdsCabCNT.FieldByName('MODULO').AsString;

      xwhere := 'CIAID=''02''';
      sAdm := DMCNT.DisplayDescrip('PrvTGE', 'TGE101', '*', xWhere, 'CIAUSER');
      pnlAdm.Enabled := False;
      If sAdm = DMCNT.wUsuario Then
      Begin
         pnlAdm.Enabled := True;
      End;

      xwhere := 'CIAID=' + quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString);
      edtCia.Text := DMCNT.DisplayDescrip('PrvTGE', 'TGE101', '*', xWhere, 'CIADES');

      dtpFComp.date := DMCNT.cdsCabCnt.FieldByName('CNTFCOMP').AsDateTime;
      dbeLote.Text := DMCNT.cdsCabCnt.FieldByName('CNTLOTE').AsString;
      dblcTMon.Text := DMCNT.cdsCabCnt.FieldByName('TMONID').AsString;
      dbeTasa.Text := Currtostr(DMCNT.cdsCabCnt.FieldByName('CNTTCAMBIO').AsFloat);
      xCampo := DMCNT.cdsCabCnt.FieldByName('CNTTS').AsString;
      If xCampo = 'BV' Then cbTCambio.ItemIndex := 0;
      If xCampo = 'BC' Then cbTCambio.ItemIndex := 1;
      If xCampo = 'PV' Then cbTCambio.ItemIndex := 2;
      If xCampo = 'PC' Then cbTCambio.ItemIndex := 3;
      If xCampo = 'OV' Then cbTCambio.ItemIndex := 4;
      If xCampo = 'OC' Then cbTCambio.ItemIndex := 5;
      If xCampo = 'OT' Then cbTCambio.ItemIndex := 6;
      dblcTDiario.Text := DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString;
      xWhere := 'TDIARID=' + quotedstr(dblcTDiario.Text);
      edtTDiario.text := DMCNT.DisplayDescrip('PrvTGE', 'TGE104', '*', xWhere, 'TDIARDES');
      dbeNoComp.Text := DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString;
      dbeGlosaCab.Text := DMCNT.cdsCabCnt.FieldByName('CNTGLOSA').AsString;
      edtPeriodo.text := DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString;
      xWhere := 'TMonId=' + '''' + dblcTMon.Text + '''';
      edtTMon.Text := DMCNT.DisplayDescrip('PrvTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
      TotalesResumen;
      pnlDatosCab.Enabled := True;
      dblcCia.Enabled := False;
      dtpFComp.Enabled := False;
      dblcTDiario.Enabled := False;
      dbeNoComp.Enabled := False;
      If (DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString = 'S') Or
         (DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString = 'A') Or
         (DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString = 'P') Then
      Begin
         pnlDatosCab.Enabled := False;

         bbtnNuevo.Enabled := True;
         If DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString = 'A' Then
         Begin
            lblAnulado.Visible := True;
            bbtnAnula.Enabled := False;
            bbtnGraba.Enabled := False;
            bbtnAcepta.Enabled := False;
            bbtnContab.Enabled := False;
            dbgMovCNT.ReadOnly := True;
         End;
         If (DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString = 'P') And
            (DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString <> 'S') Then
         Begin
            lblAceptado.Visible := True;
            bbtnAnula.Enabled := False;
            bbtnGraba.Enabled := False;
            bbtnAcepta.Enabled := False;
            bbtnContab.Enabled := True;
            dbgMovCNT.ReadOnly := True;
            bbtnImprime.Enabled := True;
         End;
         If DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString = 'S' Then
         Begin
            lblContab.Visible := True;
            bbtnAnula.Enabled := False;
            bbtnGraba.Enabled := False;
            bbtnAcepta.Enabled := False;
            bbtnContab.Enabled := False;
            bbtnDesConta.Enabled := True;
            dbgMovCNT.ReadOnly := True;
            bbtnImprime.Enabled := True;
            dbgMovCNT.Color := $00F4F4F4;
         End;
         pnlCabecera.Enabled := false;
         bbtnOKCabec.Enabled := false;
         bbtnBorra.Enabled := false;
         pnlMovCNT.Enabled := True;
         dbgMovCNTIButton.Enabled := False;
      End
      Else
      Begin
         lblIncompleto.Visible := True;
         bbtnAnula.Enabled := True;
         bbtnAcepta.Enabled := True;
         bbtnGraba.Enabled := True;
      End;
   End;
   DMCNT.cdsMovCnt1.IndexFieldNames := 'CNTREG';
   xCrea := False;
End;

Procedure TFRegComp.CargaDataSource;
Begin
   dblcCia.LookupTable := DMCNT.cdsCia;
   dblcTDiario.LookupTable := DMCNT.cdsTDiario;
   dblcTMon.LookupTable := DMCNT.cdsTMon;

   dblcdCuenta.DataSource := DMCNT.dsMovCNT1;
   dblcdCuenta.LookupTable := DMCNT.cdsCuenta;
   dblcClase.DataSource := DMCNT.dsMovCNT1;
   dblcClase.LookupTable := DMCNT.cdsClAux;
   dblcdAux.DataSource := DMCNT.dsMovCNT1;
   dblcdAux.LookupTable := DMCNT.cdsAuxiliar;
   dblcTDoc.DataSource := DMCNT.dsMovCNT1;
   dblcTDoc.LookupTable := DMCNT.cdsTDoc;
   dbeSerie.DataSource := DMCNT.dsMovCNT1;
   dbeNoDoc.DataSource := DMCNT.dsMovCNT1;
   dblcdCCosto.DataSource := DMCNT.dsMovCNT1;
   dblcdCCosto.LookupTable := DMCNT.cdsCCosto;
   dbdtpFEmis.DataSource := DMCNT.dsMovCNT1;
   dbdtpFVcmto.DataSource := DMCNT.dsMovCNT1;
   dblcTMon2.DataSource := DMCNT.dsMovCNT1;
   dblcTMon2.LookupTable := DMCNT.cdsTMon;
   dbeMonto.DataSource := DMCNT.dsMovCNT1;
   dbeDH.DataSource := DMCNT.dsMovCNT1;
   dbeTCamb.DataSource := DMCNT.dsMovCNT1;
   dbeGlosa.DataSource := DMCNT.dsMovCNT1;

   dbgMovCNT.DataSource := DMCNT.dsMovCNT1;
End;

Procedure TFRegComp.dblcdAuxEnter(Sender: TObject);
Begin
   If DMCNT.cdsAuxiliar.indexfieldnames <> 'AUXNOMB' Then
      DMCNT.cdsAuxiliar.indexfieldnames := 'AUXNOMB';
   dblcdAux.DropDown;
End;

Procedure TFRegComp.DBLCCLASENotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRegComp.dblcTDiarioNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRegComp.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRegComp.bbtnAdmClick(Sender: TObject);
Var
   xSQL: String;
Begin

   xSQL := 'SELECT * FROM TGE154 WHERE CIAID=' + quotedstr(dblcCia.text) +
      ' AND ANO=' + quotedstr(Copy(DateToStr(dtpFComp.Date), 7, 4));
   DMCNT.cdsCierres.close;
   DMCNT.cdsCierres.datarequest(xsql);
   DMCNT.cdsCierres.open;

   If DMCNT.cdsCierres.FieldByName('PER' + Copy(DateToStr(dtpFComp.Date), 4, 2)).AsString = 'S' Then
   Begin
      Showmessage('El periodo se encuentra Cerrado');
      exit;
   End;

   If MessageDlg('Liberar Comprobante Contable, generado en módulo : ' + lblModulo.Caption + chr(13) + chr(13) +
      '       ¿ Esta Seguro ?      ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      DMCNT.cdsCabCnt.Edit;
      DMCNT.cdsCabCnt.FieldByName('MODULO').AsString := 'CNT';
      DMCNT.cdsCabCnt.Post;
      xSQL := 'Update CNT300 '
             +'   Set DOCMOD=''CNT'', MODULO=''CNT'' '
             +' where CIAID='+quotedstr(dblcCia.Text)
             +'   and TDIARID='+quotedstr(dblcTDiario.Text)
             +'   and CNTANOMM='+quotedstr(edtPeriodo.Text)
             +'   and CNTCOMPROB='+quotedstr(dbeNoComp.Text);
      Try
         DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      Except
         ShowMessage('No se pudo liberar el Asiento');
         exit;
      end;
      lblModulo.Caption := 'CNT';
      bbtnAdm.Caption := 'CNT';
      ShowMessage('Comprobante Liberado');
   End;
End;

Function TFRegComp.UsuarioBloqueado(xPeriodo, xUsuario: String): Boolean;
Var
   xSql: String;
Begin
   xSQL := 'select * from CNT_CIE_USU '
         + 'where periodo=''' + xPeriodo + ''' and userid=''' + xUsuario + ''' and estado=''C''';
   DMCNT.cdsCNTtemp.IndexFieldNames := '';
   DMCNT.cdsCNTtemp.Close;
   DMCNT.cdsCNTtemp.DataRequest(xSql);
   DMCNT.cdsCNTtemp.Open;
   If DMCNT.cdsCNTtemp.RecordCount > 0 Then
      result := True
   Else
      result := False;
End;

Procedure TFRegComp.SpeedButton1Click(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;

Procedure TFRegComp.bbtnRenumDetClick(Sender: TObject);
Var
   xNumReg: Integer;
   xSQL: String;
   xxSQL: String;
   xxxSQL: String;
   xGrabaOk: boolean;
Begin
   xNumReg := 1;
   xGrabaOk := True;

   If DMCNT.cdsCabCNT.FieldByName('CNTESTADO').AsString='I' then
   Begin
      xxxSQL := ' select ciaid, tdiarid, cntcomprob, cntano, cntanomm, cntlote, cuentaid, clauxid, auxid, docid, cntserie, '
         + ' cntnodoc, cntglosa, cntdh, ccosid, cnttcambio, cntmtoori, cntmtoloc, cntmtoext, cntfemis, cntfvcmto, cntfcomp, cntestado, cntcuadre, cntfautom, cntuser, cntfreg, '
         + ' cnthreg, cntmm, cntdd, cnttri, cntsem, cntss, cntaatri, cntaasem, cntaass, tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, ccosdes, cntdebemn, '
         + ' cntdebeme, cnthabemn, cnthabeme, cntsaldmn, cntsaldme, campovar, cntts, cntpagado, cntmoddoc, cntreg, modulo, cta_secu,rowid '
         + '  from CNT311 '
         + ' where CIAID = ' + quotedstr(DMCNT.cdsMovCNT1.FieldByName('CIAID').AsString)
         + '   and CNTANOMM = ' + quotedstr(DMCNT.cdsMovCNT1.FieldByName('CNTANOMM').AsString)
         + '   and TDIARID=' + quotedstr(DMCNT.cdsMovCNT1.FieldByName('TDIARID').AsString)
         + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsMovCNT1.FieldByName('CNTCOMPROB').AsString)
         + ' Order by cntreg ';
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xxxSql);
      DMCNT.cdsQry.Open;

   // Inicio HPC_201503_CNT
      DMCNT.cdsQry.IndexFieldNames := 'CNTREG';
   // Fin HPC_201503_CNT

      DMCNT.cdsQry.First;
      While Not DMCNT.cdsQry.EOF Do
      Begin
          xxSQL := ' Update CNT311 '
                 + '    set CNTREG = ' + inttostr(xNumReg)
                 + '  where CIAID = ' + quotedstr(DMCNT.cdsQry.FieldByName('CIAID').AsString)
                 + '    and CNTANOMM = ' + quotedstr(DMCNT.cdsQry.FieldByName('CNTANOMM').AsString)
                 + '    and TDIARID=' + quotedstr(DMCNT.cdsQry.FieldByName('TDIARID').AsString)
                 + '    and CNTCOMPROB=' + quotedstr(DMCNT.cdsQry.FieldByName('CNTCOMPROB').AsString)
                 + '    and CNTREG=' + quotedstr(DMCNT.cdsQry.FieldByName('CNTREG').AsString)
                 + '    and ROWID =' + quotedstr(DMCNT.cdsQry.FieldByName('ROWID').AsString);
          TRY
             DMCNT.DCOM1.AppServer.EjecutaQry(xxSQL);
          EXCEPT
             xGrabaOk := False;
          // Inicio HPC_201503_CNT
             DMCNT.cdsQry.IndexFieldNames := '';
             xSigueGrab := False;
             ShowMessage('No se ha podido regenerar el Número de Registro');
             exit;
          // Fin HPC_201503_CNT
          END;
          xNumReg := xNumReg + 1;
          DMCNT.cdsQry.Next;
       End;
   // Inicio HPC_201503_CNT
      xSQL := 'Select CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
         +    '       CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, '
         +    '       CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
         +    '       CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, '
         +    '       CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         +    '       TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, '
         +    '       CCOSDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, '
         +    '       CNTSALDME, CAMPOVAR, CNTTS, CNTPAGADO, CNTMODDOC, CNTREG, '
         +    '       MODULO, CTA_SECU '
         +    '  from CNT311 '
         +    ' where CIAID = ' + quotedstr(DMCNT.cdsQry.FieldByName('CIAID').AsString)
         +    '   and CNTANOMM = ' + quotedstr(DMCNT.cdsQry.FieldByName('CNTANOMM').AsString)
         +    '   and TDIARID=' + quotedstr(DMCNT.cdsQry.FieldByName('TDIARID').AsString)
         +    '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsQry.FieldByName('CNTCOMPROB').AsString);
      DMCNT.cdsMovCNT1.Close;
      DMCNT.cdsMovCNT1.DataRequest(xSQL);
      DMCNT.cdsMovCNT1.Open;
      DMCNT.cdsQry.IndexFieldNames := '';
   // Fin HPC_201503_CNT
   End;

   If DMCNT.cdsCabCNT.FieldByName('CNTESTADO').AsString='P' then
   Begin
       xxxSQL := ' select ciaid, tdiarid, cntcomprob, cntano, cntanomm, cntlote, cuentaid, clauxid, auxid, docid, cntserie, '
         + ' cntnodoc, cntglosa, cntdh, ccosid, cnttcambio, cntmtoori, cntmtoloc, cntmtoext, cntfemis, cntfvcmto, cntfcomp, cntestado, cntcuadre, cntfautom, cntuser, cntfreg, '
         + ' cnthreg, cntmm, cntdd, cnttri, cntsem, cntss, cntaatri, cntaasem, cntaass, tmonid, flagvar, fcons, cntfmec, tdiardes, ctades, auxdes, docdes, ccosdes, cntdebemn, '
         + ' cntdebeme, cnthabemn, cnthabeme, cntsaldmn, cntsaldme, campovar, cntts, cntpagado, cntmoddoc, cntreg, modulo, cta_secu,rowid '
         + '  from CNT301 '
         + ' where CIAID = ' + quotedstr(DMCNT.cdsMovCNT1.FieldByName('CIAID').AsString)
         + '   and CNTANOMM = ' + quotedstr(DMCNT.cdsMovCNT1.FieldByName('CNTANOMM').AsString)
         + '   and TDIARID=' + quotedstr(DMCNT.cdsMovCNT1.FieldByName('TDIARID').AsString)
         + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsMovCNT1.FieldByName('CNTCOMPROB').AsString)
         + ' Order by CNTREG ';
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xxxSql);
      DMCNT.cdsQry.Open;

      DMCNT.cdsQry.First;
      While Not DMCNT.cdsQry.EOF Do
       Begin
          xxSQL := ' Update CNT301 '
                 + '    set CNTREG = ' + inttostr(xNumReg)
                 + '  where CIAID = ' + quotedstr(DMCNT.cdsQry.FieldByName('CIAID').AsString)
                 + '    and CNTANOMM = ' + quotedstr(DMCNT.cdsQry.FieldByName('CNTANOMM').AsString)
                 + '    and TDIARID=' + quotedstr(DMCNT.cdsQry.FieldByName('TDIARID').AsString)
                 + '    and CNTCOMPROB=' + quotedstr(DMCNT.cdsQry.FieldByName('CNTCOMPROB').AsString)
                 + '    and CNTREG=' + quotedstr(DMCNT.cdsQry.FieldByName('CNTREG').AsString)
                 + '    and ROWID =' + quotedstr(DMCNT.cdsQry.FieldByName('ROWID').AsString);
          TRY
             DMCNT.DCOM1.AppServer.EjecutaQry(xxSQL);
          EXCEPT
             xGrabaOk := False;
          // Inicio HPC_201503_CNT
             xSigueGrab := False;
          // Fin HPC_201503_CNT
          END;
          xNumReg := xNumReg + 1;
          DMCNT.cdsQry.Next;
      End;

   End;

   DMCNT.cdsMovCnt1.IndexFieldNames := 'CNTREG';
   DMCNT.cdsMovCNT1.EnableControls;
   If xGrabaOk Then
   Begin
      ShowMessage('El Detalle del asiento ha sido Renumerado correctamente');
   // Inicio HPC_201503_CNT
   //   close;
   // Fin HPC_201503_CNT
   End
   Else
   Begin
      ShowMessage('No se ha podido regenerar el Número de Registro');
   End;
End;

End.

