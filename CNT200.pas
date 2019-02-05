Unit CNT200;

// Actualizaciones
// 2002/05/27
// 25/11/2003
// 20060109
// HPC_201401_CNT    05/02/2014  Regulariza controles para asignar Cuentas de Contrapartida
// HPC_201501_CNT    12/02/2015  Regulariza Métodos Correctos de Control Transaccional
Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, DBCtrls, wwdblook, Mask, wwdbedit, ExtCtrls, Wwdbdlg, DB,
   ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe,
   ppVar, ppCtrls, ppPrnabl, ppBands, DBClient, wwclient, Grids, Wwdbigrd,
   Wwdbgrid, CheckLst, Variants, oaVariables;

Type
   TFPlnCta = Class(TForm)
      pnlPrincipal: TPanel;
      pnlDetalle: TPanel;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      Label15: TLabel;

      dbeDescripcion: TwwDBEdit;
      dbeCtaAbr: TwwDBEdit;
      dblcCia: TwwDBLookupCombo;
      dbeCia: TwwDBEdit;
      Z2bbtnRegistra: TBitBtn;
      Z2bbtnCanc2: TBitBtn;
      Z2bbtnImprime: TBitBtn;
      pnlReporte: TPanel;
      Label24: TLabel;
      dblcNivel: TwwDBLookupCombo;
      dbeNivel: TwwDBEdit;
      Panel4: TPanel;
      Label25: TLabel;
      dblcdCtaInic: TwwDBLookupComboDlg;
      dbeCtaInic: TwwDBEdit;
      Label26: TLabel;
      dblcdCtaFinal: TwwDBLookupComboDlg;
      dbeCtaFinal: TwwDBEdit;
      Label27: TLabel;
      Z2bbtnRegistra3: TBitBtn;
      Z2bbtnCanc3: TBitBtn;
      Label28: TLabel;
      ppDBPipeline1: TppDBPipeline;
      pprPlanCtas: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      pnlFondo: TPanel;
      Label29: TLabel;
      Z2bbtnNuevo: TBitBtn;
      Z2bbtnClose: TBitBtn;
      ppDBText10: TppDBText;
      dblcdCuenta: TwwDBLookupComboDlg;
      dbeCta: TwwDBEdit;
      Label6: TLabel;
      ppDBText12: TppDBText;
      ppDBText1: TppDBText;
      ppDBText5: TppDBText;
      ppDBText9: TppDBText;
      ppDBText11: TppDBText;
      ppDBText13: TppDBText;
      pplblCia: TppLabel;
      ppLabel6: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel1: TppLabel;
      pplblNivel: TppLabel;
      ppLabel5: TppLabel;
      ppLabel7: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel8: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel9: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel4: TppLabel;
      ppLabel17: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppLabel24: TppLabel;
      ppLabel26: TppLabel;
      ppLabel10: TppLabel;
      ppLabel14: TppLabel;
      ppLabel19: TppLabel;
      ppLabel23: TppLabel;
      ppLabel25: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      pplblNivel1: TppLabel;
      ppLabel15: TppLabel;
      lblCopiarCuentas: TLabel;
      clbCopiar: TCheckListBox;
      gbTieneCtaDestino: TGroupBox;
      gbOtrosFlags: TGroupBox;
      dbcbCCosto: TCheckBox;
      dbcbDoc: TCheckBox;
      dbcbAux: TCheckBox;
      dbcbEsDifCambioGP: TCheckBox;
      dbcbMayorizaenME: TCheckBox;
      dbcbTieneCtaDestino: TCheckBox;
      gbNivelCta: TGroupBox;
      Label33: TLabel;
      dblcNivel1: TwwDBLookupCombo;
      Label35: TLabel;
      dbeSigno: TwwDBEdit;
      Label34: TLabel;
      dbeDigitos: TwwDBEdit;
      dbcbEsDesti: TCheckBox;
      gbEsCtaDestino: TGroupBox;
      dbcbPermiteMov: TCheckBox;
      dbcbEsDet: TCheckBox;
      gbCtasDestino: TGroupBox;
      Label16: TLabel;
      dblcdCtaAutDebe: TwwDBLookupComboDlg;
      dbeCtaAutDebe: TwwDBEdit;
      dblcdCtaAutHaber: TwwDBLookupComboDlg;
      Label7: TLabel;
      dbeCtaAutHaber: TwwDBEdit;
      gbPlazo: TGroupBox;
      chbPlazoCorto: TCheckBox;
      chbPlazoLargo: TCheckBox;
      dbcbSeTomaAjusteDC: TCheckBox;
      dbcbEsCtaApertura: TCheckBox;
      gbCierreAnual: TGroupBox;
      Label9: TLabel;
      dbeContra: TwwDBEdit;
      dblcdContra: TwwDBLookupComboDlg;
      dbcbCtaCierreAnual: TCheckBox;
      gbTipoCta: TGroupBox;
      Label20: TLabel;
      dblcTipCta: TwwDBLookupCombo;
      dbeTipCta: TwwDBEdit;
      dbcbNoMonet: TCheckBox;
      gbREI: TGroupBox;
      Label5: TLabel;
      Label8: TLabel;
      dbeCuentaREI: TwwDBEdit;
      dblcdCtaREI: TwwDBLookupComboDlg;
      dblcTipoREI: TwwDBLookupCombo;
      edtTipoREI: TEdit;
      dbeSecu: TwwDBEdit;
      lblSecu: TLabel;
      dbcbCtaAjuste: TCheckBox;
      lblCtaAjuste: TLabel;
      gbCtaConsolidada: TGroupBox;
      dbeConsoli: TwwDBEdit;
      dblcdConsoli: TwwDBLookupComboDlg;
      Z2bbtnBorrar: TBitBtn;
      cbCias: TCheckBox;
      dbcbRegistroSoloME: TCheckBox;
      dbcbDifCambPer: TCheckBox;
      dbcbDifCambGan: TCheckBox;
      lblModuloparaAjusteDC: TLabel;
      dblcModulo: TwwDBLookupCombo;
      dbeModuloAjusDC: TwwDBEdit;
      gbEsMov: TGroupBox;
      dbcbEsMovi: TCheckBox;
      Procedure Z2bbtnCanc2Click(Sender: TObject);
      Procedure Z2bbtnRegistraClick(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dbcbAuxClick(Sender: TObject);
      Procedure dblcTipCtaExit(Sender: TObject);
      Procedure dblcdCuentaExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcNivelChange(Sender: TObject);
      Procedure dblcdCtaInicChange(Sender: TObject);
      Procedure dblcdCtaFinalChange(Sender: TObject);
      Procedure Z2bbtnImprimeClick(Sender: TObject);
      Procedure Z2bbtnCanc3Click(Sender: TObject);
      Procedure dblcNivelExit(Sender: TObject);
      Procedure dblcdCtaFinalExit(Sender: TObject);
      Procedure Z2bbtnRegistra3Click(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure ppDBText1Print(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure Z2bbtnCloseClick(Sender: TObject);
      Procedure NotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dbeCtaExit(Sender: TObject);
      Procedure dbcbTieneCtaDestinoClick(Sender: TObject);
      Procedure dblcdCtaAutHaberExit(Sender: TObject);
      Procedure chbPlazoCortoClick(Sender: TObject);
      Procedure chbPlazoLargoClick(Sender: TObject);
      Procedure dbcbEsDestiClick(Sender: TObject);
      Procedure dblcdCtaAutDebeExit(Sender: TObject);
      Procedure dblcdContraExit(Sender: TObject);
      Procedure dbcbCCostoClick(Sender: TObject);
      Procedure dbcbEsDifCambioGPClick(Sender: TObject);
      Procedure dblcTipoREIExit(Sender: TObject);
      Procedure dblcdCtaREIExit(Sender: TObject);
      Procedure dbcbEsCtaAperturaClick(Sender: TObject);
      Procedure dbcbCtaCierreAnualClick(Sender: TObject);
      Procedure dbcbDifCambGanClick(Sender: TObject);
      Procedure dbcbDifCambPerClick(Sender: TObject);
      Procedure dblcdConsoliExit(Sender: TObject);
      Procedure Z2bbtnBorrarClick(Sender: TObject);
      Procedure dblcModuloExit(Sender: TObject);
      Procedure cbCiasClick(Sender: TObject);
      Procedure clbCopiarClickCheck(Sender: TObject);
      Procedure dbcbSeTomaAjusteDCClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcdConsoliEnter(Sender: TObject);
   Private
    { Private declarations }
      xAux, xCCos, xAno, wModif: String;
      xNivel1: String;
      xTotCia: Integer;
      Procedure DesHabilitaChecks;
      Procedure cargadata;
      Procedure ActNivelAnt;
      Procedure ActNivelAntBat(xxCia, xxCta: String);
      Function ValNivelAnt: boolean;
      Function ValNivelAntBat(xxcia, xxCta: String): boolean;
      Procedure ActCtaAlBorrar;
      Function ValNivelSup: boolean;
      Procedure CargaDataSource;
   Public
    { Public declarations }
      wInicio: String;
      Procedure FiltraPlan;
   End;

Var
   FPlnCta: TFPlnCta;
   xCrea: Boolean;
   xSalir: Boolean;
   xCtaDebeDest, xCtaHaberDest: String;

Implementation

Uses CNTDM, oaCN1000;

{$R *.DFM}

Procedure TFPlnCta.Z2bbtnCanc2Click(Sender: TObject);
Begin
   If DMCNT.cdsCuenta.State In [dsInsert, dsedit] Then
   Begin
      DMCNT.cdsCuenta.Cancel;
      DMCNT.cdsCuenta2.Cancel;
   End;
   If DMCNT.wModo = 'A' Then Close;
   If DMCNT.wModo = 'M' Then
   Begin
      dblcdCuenta.SetFocus;
      dbeDescripcion.SetFocus;
   End;
End;

Procedure TFPlnCta.Z2bbtnRegistraClick(Sender: TObject);
Var
   xCtaDet, xCtaMov, xSQL, xWhere: String;
   xZ: Integer;
   xCias: Array[1..20] Of String;
Begin
   Screen.Cursor := crHourGlass;

// Verifica que tenga el valor de Tipo de Cuenta
   If length(dbeTipCta.Text) = 0 Then
   Begin
      ShowMessage('Falta Tipo de Cuenta');
      Screen.Cursor := crDefault;
      exit;
   End;

// Verifica que Ctas automáticas existan si se la ha indicado que tiene
// Cuenta de Destino
   If dbcbTieneCtaDestino.Checked Then
   Begin
      If Length(dblcdCtaAutDebe.Text) = 0 Then
      Begin
         ShowMessage('Error :  Falta Cuenta de Destino Debe ');
         Screen.Cursor := crDefault;
         dblcdCtaAutDebe.SetFocus;
         Exit;
      End;
      If Length(dblcdCtaAutHaber.Text) = 0 Then
      Begin
         ShowMessage('Error :  Falta Cuenta de Destino Haber ');
         Screen.Cursor := crDefault;
         dblcdCtaAutHaber.SetFocus;
         Exit;
      End;
   End;

   DMCNT.cdsCuenta.Edit;
   DMCNT.cdsCuenta.fieldbyname('CIAID').AsString := dblcCia.Text;

// Cuenta Contable
   If dblcdCuenta.visible Then // si es adición de nueva cuenta
      DMCNT.cdsCuenta.fieldbyname('CUENTAID').AsString := dblcdCuenta.text
   Else
      DMCNT.cdsCuenta.fieldbyname('CUENTAID').AsString := dbeCta.text;

// Descripción de la Cuenta Contable
   If DMCNT.cdsCuenta.fieldbyname('CTADES').AsString <> dbeDescripcion.text Then
      DMCNT.cdsCuenta.fieldbyname('CTADES').AsString := dbeDescripcion.text;
   If DMCNT.cdsCuenta.fieldbyname('CTAABR').AsString <> dbeCtaAbr.Text Then
      DMCNT.cdsCuenta.fieldbyname('CTAABR').AsString := dbeCtaAbr.Text;

// Nivel de Dígitos de la Cuenta Contable
   If DMCNT.cdsCuenta.fieldbyname('CTANIV').AsString <> dblcNivel1.text Then
      DMCNT.cdsCuenta.fieldbyname('CTANIV').AsString := dblcNivel1.text;

// Tipo de Cuenta Contable
   DMCNT.cdsCuenta.fieldbyname('TIPCTAID').AsString := dblcTipCta.value;

// Indica si es Cuenta  de Detalle
   If dbcbEsDet.Checked Then
      DMCNT.cdsCuenta.fieldbyname('CTA_DET').AsString := 'S'
   Else
      DMCNT.cdsCuenta.fieldbyname('CTA_DET').AsString := 'N';

// Tipo de Cuenta Contable
   xWhere := 'TIPCTAID=' + quotedstr(dblcTipCta.text);
   DMCNT.cdsCuenta.fieldbyname('CTA_TIPO').AsString := DMCNT.DisplayDescrip('PrvTGE', 'TGE162', 'TIPCTADES,CTA_TIPO', xWhere, 'CTA_TIPO');

// actualiza Centro de Costo
   If dbcbCCosto.checked Then
   Begin
      If DMCNT.cdsCuenta.fieldbyname('CTA_CCOS').AsString <> 'S' Then
         DMCNT.cdsCuenta.fieldbyname('CTA_CCOS').AsString := 'S';
   End
   Else
   Begin
      If DMCNT.cdsCuenta.fieldbyname('CTA_CCOS').AsString <> 'N' Then
         DMCNT.cdsCuenta.fieldbyname('CTA_CCOS').AsString := 'N';
   End;

// Corto o Largo Plazo o ninguno
   If chbPlazoCorto.checked Then
      DMCNT.cdsCuenta.fieldbyname('CTA_PLAZ').AsString := 'C'
   Else
   Begin
      If chbPlazoLargo.checked Then
         DMCNT.cdsCuenta.fieldbyname('CTA_PLAZ').AsString := 'L'
      Else
      Begin
         If DMCNT.cdsCuenta.fieldbyname('CTA_PLAZ').AsString <> '' Then
            DMCNT.cdsCuenta.fieldbyname('CTA_PLAZ').AsString := '';
      End;
   End;

// indica si requiere o no Código de Anexo/Auxiliar/CtaCte
   If dbcbAux.Checked Then
   Begin
      If DMCNT.cdsCuenta.fieldbyname('CTA_AUX').AsString <> 'S' Then
         DMCNT.cdsCuenta.fieldbyname('CTA_AUX').AsString := 'S'
   End
   Else
   Begin
      If DMCNT.cdsCuenta.fieldbyname('CTA_AUX').AsString <> 'N' Then
         DMCNT.cdsCuenta.fieldbyname('CTA_AUX').AsString := 'N';
   End;

// actualiza Flag que indica que es de Movimiento
   If dbcbEsMovi.Checked Then
      DMCNT.cdsCuenta.fieldbyname('CTA_MOV').AsString := 'S'
   Else
      DMCNT.cdsCuenta.fieldbyname('CTA_MOV').AsString := 'N';

// actualiza Flag que indica que es de Movimiento sólo en Módulo de Contabilidad
   If dbcbPermiteMov.Checked Then
      DMCNT.cdsCuenta.fieldbyname('FLGVAR').AsString := 'S'
   Else
      DMCNT.cdsCuenta.fieldbyname('FLGVAR').AsString := 'N';

// actualiza parámetro q indica que Cuenta requiere Cód. de Documento
   If dbcbDOC.Checked Then
      DMCNT.cdsCuenta.fieldbyname('CTA_DOC').AsString := 'S'
   Else
      DMCNT.cdsCuenta.fieldbyname('CTA_DOC').AsString := 'N';

// indica que También se debe mayorizar en Moneda Extranjera
   If dbcbMayorizaenME.Checked Then
      DMCNT.cdsCuenta.fieldbyname('CTA_ME').AsString := 'S'
   Else
      DMCNT.cdsCuenta.fieldbyname('CTA_ME').AsString := 'N';

// indica que la Cuenta es Cuenta de Destino
   If dbcbEsDesti.Checked Then
      DMCNT.cdsCuenta.fieldbyname('CTA_DEST').AsString := 'S'
   Else
      DMCNT.cdsCuenta.fieldbyname('CTA_DEST').AsString := 'N';

// indica que la Cuenta requiere Cuentas de Destino
   If dbcbTieneCtaDestino.Checked Then
   Begin
      DMCNT.cdsCuenta.fieldbyname('CTA_AUT1').AsString := 'S';
      DMCNT.cdsCuenta.fieldbyname('CTA_AUT2').AsString := 'S';
      DMCNT.cdsCuenta.fieldbyname('CTAAUT1').AsString := dblcdCtaAutDebe.Text;
      DMCNT.cdsCuenta.fieldbyname('CTAAUT2').AsString := dblcdCtaAutHaber.Text;
   End
   Else
   Begin
      DMCNT.cdsCuenta.fieldbyname('CTA_AUT1').AsString := 'N';
      DMCNT.cdsCuenta.fieldbyname('CTA_AUT2').AsString := 'N';
      DMCNT.cdsCuenta.fieldbyname('CTAAUT1').AsString := '';
      DMCNT.cdsCuenta.fieldbyname('CTAAUT2').AsString := '';
   End;

// indica que es Cuenta de Apertura
   If dbcbEsCtaApertura.checked Then
   Begin
      DMCNT.cdsCuenta.fieldbyname('CTA_APERT').AsString := 'S';
      DMCNT.cdsCuenta.fieldbyname('CTA_CIER').AsString := 'N';
   End
   Else
      DMCNT.cdsCuenta.fieldbyname('CTA_APERT').AsString := 'N';

// indica que es Cuenta de Cierre Anual
   If dbcbCtaCierreAnual.checked Then
   Begin
      DMCNT.cdsCuenta.fieldbyname('CTA_CIER').AsString := 'S';
      DMCNT.cdsCuenta.fieldbyname('CTA_APERT').AsString := 'N';
      DMCNT.cdsCuenta.fieldbyname('CTA_SECU').AsString := dbeSecu.text;
      ;
   // Cuenta de Contrapartida para el Cierre Anual
      DMCNT.cdsCuenta.fieldbyname('CTACONTRA').AsString := dblcdContra.value;
   End
   Else
   Begin
      DMCNT.cdsCuenta.fieldbyname('CTA_CIER').AsString := 'N';
      DMCNT.cdsCuenta.fieldbyname('CTACONTRA').AsString := '';
   End;

// indica que es una Cuenta de Diferencia de Cambio
   If dbcbDifCambGan.checked Then
   // Ganancia
      DMCNT.cdsCuenta.fieldbyname('CTA_DIFGP').AsString := 'G'
   Else
      If dbcbDifCambPER.checked Then
      // Pérdida
         DMCNT.cdsCuenta.fieldbyname('CTA_DIFGP').AsString := 'P'
      Else
      // Ni Ganancia Ni Pérdida
         DMCNT.cdsCuenta.fieldbyname('CTA_DIFGP').AsString := '';

// Indica que la Cuenta Contable debe considerarse o no en el Proceso por Diferencia de Cambio
   If dbcbSeTomaAjusteDC.checked Then
   Begin
      DMCNT.cdsCuenta.fieldbyname('CTA_DIFC').AsString := 'S';
      DMCNT.cdsCuenta.fieldbyname('CTAMODDIFC').AsString := dblcModulo.text;
   End
   Else
   Begin
      DMCNT.cdsCuenta.fieldbyname('CTA_DIFC').AsString := 'N';
      DMCNT.cdsCuenta.fieldbyname('CTAMODDIFC').AsString := '';
   End;

// Tipo de Ajuste por Inflación y Cuenta de Ajuste
   DMCNT.cdsCuenta.fieldbyname('CTA_TIPOREI').AsString := dblcTipoREI.Text;
   DMCNT.cdsCuenta.fieldbyname('CTA_AJUSTEREI').AsString := dblcdCtaREI.Text;
   If dbcbCtaAjuste.Checked Then
      DMCNT.cdsCuenta.fieldbyname('CTA_SALAJREI').AsString := 'S'
   Else
      DMCNT.cdsCuenta.fieldbyname('CTA_SALAJREI').AsString := 'N';

// Indica que es Cuenta No Monetaria
   If dbcbNoMonet.checked Then
      DMCNT.cdsCuenta.fieldbyname('CTA_NOMONET').AsString := 'S'
   Else
      DMCNT.cdsCuenta.fieldbyname('CTA_NOMONET').AsString := 'N';

// Cuenta Consolidada
   DMCNT.cdsCuenta.fieldbyname('CTA_CONSOL').AsString := dblcdConsoli.value;

// Mayoriza solo en Moneda Extranjera ME
   If dbcbRegistroSoloME.Checked Then
      DMCNT.cdsCuenta.fieldbyname('REGSOLOME').AsString := 'S'
   Else
      DMCNT.cdsCuenta.fieldbyname('REGSOLOME').AsString := 'N';

   cdsPost(DMCNT.cdsCuenta);

   xNivel1 := DMCNT.cdsCuenta.fieldbyname('CTANIV').AsString;

   DMCNT.cdsCuenta.fieldbyname('USUARIO').AsString := DMCNT.wUsuario;
   DMCNT.cdsCuenta.fieldbyname('FREG').AsDateTime := Date;
   DMCNT.cdsCuenta.fieldbyname('HREG').AsDateTime := Time;

   If DMCNT.wModo = 'A' Then
      DMCNT.cdsCuenta.fieldbyname('CTAACT').AsString := 'S';

   DMCNT.cdsCuenta.DataRequest('Select * from TGE202');
   DMCNT.ControlTranCNT(0);

// Aqui se actualiza Nivel Anterior de la Cuenta
   ActNivelAnt;

   Screen.Cursor := crDefault;
   ShowMessage(' Cuenta Contable Grabada ');
   Screen.Cursor := crHourGlass;

   If DMCNT.wModo = 'A' Then
   Begin
      If lblCopiarCuentas.Visible Then
      Begin
         xTotCia := 0;
         For xZ := 0 To clbCopiar.Items.Count - 1 Do
         Begin
            If clbCopiar.Checked[xZ] Then
            Begin
               xTotCia := xTotCia + 1;
               xCias[xTotCia] := copy(clbCopiar.Items.Strings[xZ], 1, 2);
            End;
         End;
         Try
            If xTotCia > 0 Then
            Begin
               xSql := 'SELECT * FROM TGE202 WHERE CIAID=' + QUOTEDSTR('');
               DMCNT.cdsQry4.close;
               DMCNT.cdsQry4.DAtaRequest(xSql);
               DMCNT.cdsQry4.open;
               For xZ := 1 To xTotCia Do
               Begin
                  DMCNT.cdsQry4.Insert;
                  DMCNT.cdsQry4.fieldbyname('CIAID').AsString := xCias[xZ];
                  DMCNT.cdsQry4.fieldbyname('CUENTAID').AsString := DMCNT.cdsCuenta.fieldbyname('CUENTAID').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTADES').AsString := DMCNT.cdsCuenta.fieldbyname('CTADES').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTAABR').AsString := DMCNT.cdsCuenta.fieldbyname('CTAABR').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTANIV').AsString := DMCNT.cdsCuenta.fieldbyname('CTANIV').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_DET').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_DET').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_MOV').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_MOV').AsString;
                  DMCNT.cdsQry4.fieldbyname('TIPCTAID').AsString := DMCNT.cdsCuenta.fieldbyname('TIPCTAID').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_AUX').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_AUX').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_DOC').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_DOC').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_CCOS').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_CCOS').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_ME').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_ME').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_AUT1').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_AUT1').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTAAUT1').AsString := DMCNT.cdsCuenta.fieldbyname('CTAAUT1').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_AUT2').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_AUT2').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTAAUT2').AsString := DMCNT.cdsCuenta.fieldbyname('CTAAUT2').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_CIER').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_CIER').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_PLAZ').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_PLAZ').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_DEST').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_DEST').AsString;
                  DMCNT.cdsQry4.fieldbyname('FLGVAR').AsString := DMCNT.cdsCuenta.fieldbyname('FLGVAR').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_TIPO').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_TIPO').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_TIPOREI').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_TIPOREI').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_AJUSTEREI').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_AJUSTEREI').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_SECU').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_SECU').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_DIFGP').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_DIFGP').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTACONTRA').AsString := DMCNT.cdsCuenta.fieldbyname('CTACONTRA').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_DIFC').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_DIFC').AsString;
                  DMCNT.cdsQry4.fieldbyname('USUARIO').AsString := DMCNT.cdsCuenta.fieldbyname('USUARIO').AsString;
                  DMCNT.cdsQry4.fieldbyname('FREG').AsString := DMCNT.cdsCuenta.fieldbyname('FREG').AsString;
                  DMCNT.cdsQry4.fieldbyname('HREG').AsString := DMCNT.cdsCuenta.fieldbyname('HREG').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTAMODDIFC').AsString := DMCNT.cdsCuenta.fieldbyname('CTAMODDIFC').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_APERT').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_APERT').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_NOMONET').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_NOMONET').AsString;
                  DMCNT.cdsQry4.fieldbyname('CTA_SALAJREI').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_SALAJREI').AsString;
                  DMCNT.cdsQry4.fieldbyname('REGSOLOME').AsString := DMCNT.cdsCuenta.fieldbyname('REGSOLOME').AsString;
                  DMCNT.cdsQry4.POST;
               End;

               DMCNT.cdsQry4.first;
               While Not DMCNT.cdsQry4.eof Do
               Begin
                  DMCNT.cdsCuenta.insert;
                  DMCNT.cdsCuenta.fieldbyname('CIAID').AsString := DMCNT.cdsQry4.fieldbyname('CIAID').AsString;
                  dblcCia.text := DMCNT.cdsCuenta.fieldbyname('CIAID').AsString;
                  DMCNT.cdsCia.SetKey;
                  DMCNT.cdsCia.FieldbyName('CIAID').AsString := dblcCia.Text;
                  If DMCNT.cdsCia.GotoKey Then
                     dbeCia.Text := DMCNT.cdsCia.FieldByName('CIADES').AsString;
                  DMCNT.cdsCuenta.fieldbyname('CUENTAID').AsString := DMCNT.cdsQry4.fieldbyname('CUENTAID').AsString;
             // verifica que la cuenta no haya sido registrada previamente
                  xWhere := 'CIAID =' + quotedStr(DMCNT.cdsCuenta.fieldbyname('CIAID').AsString) +
                     ' and CUENTAID=' + quotedStr(DMCNT.cdsCuenta.fieldbyname('CUENTAID').AsString);
                  If length(DMCNT.DisplayDescrip('PrvTGE', 'TGE202', 'CUENTAID', xWhere, 'CUENTAID')) > 0 Then
                  Begin
                     showMessage('Cuenta a copiar ' + DMCNT.cdsCuenta.fieldbyname('CUENTAID').AsString + ' para la Cia. ' +
                        DMCNT.cdsCuenta.fieldbyname('CIAID').AsString + ' ya existe, no se realizara ésta copia');
                     DMCNT.cdsCuenta.cancel;
                     DMCNT.cdsCuenta.cancelupdates;
                  End
                  Else
                  Begin
                     If ValNivelAnt Then
                     Begin
                        ActNivelAnt;
                        DMCNT.cdsCuenta.fieldbyname('CTADES').AsString := DMCNT.cdsQry4.fieldbyname('CTADES').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTAABR').AsString := DMCNT.cdsQry4.fieldbyname('CTAABR').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTANIV').AsString := DMCNT.cdsQry4.fieldbyname('CTANIV').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_DET').AsString := DMCNT.cdsQry4.fieldbyname('CTA_DET').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_MOV').AsString := DMCNT.cdsQry4.fieldbyname('CTA_MOV').AsString;
                        DMCNT.cdsCuenta.fieldbyname('TIPCTAID').AsString := DMCNT.cdsQry4.fieldbyname('TIPCTAID').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_AUX').AsString := DMCNT.cdsQry4.fieldbyname('CTA_AUX').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_DOC').AsString := DMCNT.cdsQry4.fieldbyname('CTA_DOC').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_CCOS').AsString := DMCNT.cdsQry4.fieldbyname('CTA_CCOS').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_ME').AsString := DMCNT.cdsQry4.fieldbyname('CTA_ME').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_AUT1').AsString := DMCNT.cdsQry4.fieldbyname('CTA_AUT1').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTAAUT1').AsString := DMCNT.cdsQry4.fieldbyname('CTAAUT1').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_AUT2').AsString := DMCNT.cdsQry4.fieldbyname('CTA_AUT2').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTAAUT2').AsString := DMCNT.cdsQry4.fieldbyname('CTAAUT2').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_CIER').AsString := DMCNT.cdsQry4.fieldbyname('CTA_CIER').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_PLAZ').AsString := DMCNT.cdsQry4.fieldbyname('CTA_PLAZ').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_DEST').AsString := DMCNT.cdsQry4.fieldbyname('CTA_DEST').AsString;
                        DMCNT.cdsCuenta.fieldbyname('FLGVAR').AsString := DMCNT.cdsQry4.fieldbyname('FLGVAR').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_TIPO').AsString := DMCNT.cdsQry4.fieldbyname('CTA_TIPO').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_TIPOREI').AsString := DMCNT.cdsQry4.fieldbyname('CTA_TIPOREI').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_AJUSTEREI').AsString := DMCNT.cdsQry4.fieldbyname('CTA_AJUSTEREI').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_SECU').AsString := DMCNT.cdsQry4.fieldbyname('CTA_SECU').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_DIFGP').AsString := DMCNT.cdsQry4.fieldbyname('CTA_DIFGP').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTACONTRA').AsString := DMCNT.cdsQry4.fieldbyname('CTACONTRA').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_DIFC').AsString := DMCNT.cdsQry4.fieldbyname('CTA_DIFC').AsString;
                        DMCNT.cdsCuenta.fieldbyname('USUARIO').AsString := DMCNT.cdsQry4.fieldbyname('USUARIO').AsString;
                        DMCNT.cdsCuenta.fieldbyname('FREG').AsString := DMCNT.cdsQry4.fieldbyname('FREG').AsString;
                        DMCNT.cdsCuenta.fieldbyname('HREG').AsString := DMCNT.cdsQry4.fieldbyname('HREG').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTAMODDIFC').AsString := DMCNT.cdsQry4.fieldbyname('CTAMODDIFC').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_APERT').AsString := DMCNT.cdsQry4.fieldbyname('CTA_APERT').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_NOMONET').AsString := DMCNT.cdsQry4.fieldbyname('CTA_NOMONET').AsString;
                        DMCNT.cdsCuenta.fieldbyname('CTA_SALAJREI').AsString := DMCNT.cdsQry4.fieldbyname('CTA_SALAJREI').AsString;
                        DMCNT.cdsCuenta.fieldbyname('REGSOLOME').AsString := DMCNT.cdsQry4.fieldbyname('REGSOLOME').AsString;
                        DMCNT.AplicaDatos(DMCNT.cdsCuenta, '');
                     End;
                  End;
                  DMCNT.cdsQry4.next;
               End;
            End;
         Finally
            Screen.Cursor := crDefault;
         End;
      End;
   End
   Else
   Begin
      If lblCopiarCuentas.Visible Then
      Begin
         xTotCia := 0;
         For xZ := 0 To clbCopiar.Items.Count - 1 Do
         Begin
            If clbCopiar.Checked[xZ] Then
            Begin
               xTotCia := xTotCia + 1;
               xCias[xTotCia] := copy(clbCopiar.Items.Strings[xZ], 1, 2);
            End;
         End;

         Try
            If xTotCia > 0 Then
            Begin
               xSql := 'SELECT * FROM TGE202 WHERE CIAID=' + QUOTEDSTR('xxyy');
               DMCNT.cdsQry4.close;
               DMCNT.cdsQry4.DAtaRequest(xSql);
               DMCNT.cdsQry4.open;
               For xZ := 1 To xTotCia Do
               Begin
                  xSQL := 'CIAID=' + QuotedStr(xCias[xZ]) + ' AND CUENTAID=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CUENTAID').AsString);
                  If DMCNT.DisplayDescrip('PrvTGE', 'TGE202', 'CUENTAID,CTANIV', xSQL, 'CTANIV') <> dblcNivel1.text Then
                  Begin
                     DMCNT.cdsQry4.Insert;
                     DMCNT.cdsQry4.fieldbyname('CIAID').AsString := xCias[xZ];
                     DMCNT.cdsQry4.fieldbyname('CUENTAID').AsString := DMCNT.cdsCuenta.fieldbyname('CUENTAID').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTADES').AsString := DMCNT.cdsCuenta.fieldbyname('CTADES').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTAABR').AsString := DMCNT.cdsCuenta.fieldbyname('CTAABR').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTANIV').AsString := DMCNT.cdsCuenta.fieldbyname('CTANIV').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_DET').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_DET').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_MOV').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_MOV').AsString;
                     DMCNT.cdsQry4.fieldbyname('TIPCTAID').AsString := DMCNT.cdsCuenta.fieldbyname('TIPCTAID').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_AUX').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_AUX').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_DOC').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_DOC').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_CCOS').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_CCOS').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_ME').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_ME').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_AUT1').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_AUT1').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTAAUT1').AsString := DMCNT.cdsCuenta.fieldbyname('CTAAUT1').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_AUT2').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_AUT2').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTAAUT2').AsString := DMCNT.cdsCuenta.fieldbyname('CTAAUT2').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_CIER').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_CIER').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_PLAZ').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_PLAZ').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_DEST').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_DEST').AsString;
                     DMCNT.cdsQry4.fieldbyname('FLGVAR').AsString := DMCNT.cdsCuenta.fieldbyname('FLGVAR').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_TIPO').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_TIPO').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_TIPOREI').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_TIPOREI').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_AJUSTEREI').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_AJUSTEREI').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_SECU').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_SECU').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_DIFGP').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_DIFGP').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTACONTRA').AsString := DMCNT.cdsCuenta.fieldbyname('CTACONTRA').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_DIFC').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_DIFC').AsString;
                     DMCNT.cdsQry4.fieldbyname('USUARIO').AsString := DMCNT.cdsCuenta.fieldbyname('USUARIO').AsString;
                     DMCNT.cdsQry4.fieldbyname('FREG').AsString := DMCNT.cdsCuenta.fieldbyname('FREG').AsString;
                     DMCNT.cdsQry4.fieldbyname('HREG').AsString := DMCNT.cdsCuenta.fieldbyname('HREG').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTAMODDIFC').AsString := DMCNT.cdsCuenta.fieldbyname('CTAMODDIFC').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_APERT').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_APERT').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_NOMONET').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_NOMONET').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTA_SALAJREI').AsString := DMCNT.cdsCuenta.fieldbyname('CTA_SALAJREI').AsString;
                     DMCNT.cdsQry4.fieldbyname('REGSOLOME').AsString := DMCNT.cdsCuenta.fieldbyname('REGSOLOME').AsString;
                     DMCNT.cdsQry4.fieldbyname('CTAACT').AsString := DMCNT.cdsCuenta.fieldbyname('CTAACT').AsString;
                     DMCNT.cdsQry4.POST;
                     DMCNT.AplicaDatos(DMCNT.cdsQry4, '');
                  End
                  Else
                  Begin
                     If ValNivelAntBat(xCias[xZ], DMCNT.cdsCuenta.fieldbyname('CUENTAID').AsString) Then
                     Begin
                        ActNivelAntBat(xCias[xZ], DMCNT.cdsCuenta.fieldbyname('CUENTAID').AsString);
                        xSQL := ' UPDATE TGE202 ' +
                           ' SET ' +
                           ' CTADES=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTADES').AsString) + ', ' +
                           ' CTAABR=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTAABR').AsString) + ', ' +
                           ' CTANIV=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTANIV').AsString) + ', ' +
                           ' CTA_DET=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_DET').AsString) + ', ' +
                           ' CTA_MOV=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_MOV').AsString) + ', ' +
                           ' TIPCTAID=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('TIPCTAID').AsString) + ', ' +
                           ' CTA_AUX=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_AUX').AsString) + ', ' +
                           ' CTA_DOC=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_DOC').AsString) + ', ' +
                           ' CTA_CCOS=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_CCOS').AsString) + ', ' +
                           ' CTA_ME=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_ME').AsString) + ', ' +
                           ' CTA_AUT1=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_AUT1').AsString) + ', ' +
                           ' CTAAUT1=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTAAUT1').AsString) + ', ' +
                           ' CTA_AUT2=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_AUT2').AsString) + ', ' +
                           ' CTAAUT2=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTAAUT2').AsString) + ', ' +
                           ' CTA_CIER=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_CIER').AsString) + ', ' +
                           ' CTA_PLAZ=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_PLAZ').AsString) + ', ' +
                           ' CTA_DEST=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_DEST').AsString) + ', ' +
                           ' FLGVAR=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('FLGVAR').AsString) + ', ' +
                           ' CTA_TIPO=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_TIPO').AsString) + ', ' +
                           ' CTA_TIPOREI=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_TIPOREI').AsString) + ', ' +
                           ' CTA_AJUSTEREI=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_AJUSTEREI').AsString) + ', ' +
                           ' CTA_SECU=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_SECU').AsString) + ', ' +
                           ' CTA_DIFGP=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_DIFGP').AsString) + ', ' +
                           ' CTACONTRA=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTACONTRA').AsString) + ', ' +
                           ' CTA_DIFC=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_DIFC').AsString) + ', ' +
                           ' USUARIO=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('USUARIO').AsString) + ', ' +
                           ' FREG=' + wRepFecServi + ', ' +
                           ' HREG=' + wRepFecServi + ', ' +
                           ' CTAMODDIFC=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTAMODDIFC').AsString) + ', ' +
                           ' CTA_APERT=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_APERT').AsString) + ', ' +
                           ' CTA_NOMONET=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_NOMONET').AsString) + ', ' +
                           ' CTA_SALAJREI=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CTA_SALAJREI').AsString) + ', ' +
                           ' REGSOLOME=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('REGSOLOME').AsString) +
                           ' WHERE CIAID=' + QuotedStr(xCias[xZ]) + ' AND CUENTAID=' + QuotedStr(DMCNT.cdsCuenta.fieldbyname('CUENTAID').AsString);
                        Try
                           DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
                        Except
                        End;
                     End
                  End;
               End;
            End;
         Finally
            Screen.Cursor := crDefault;
         End;
      End;
   End;

   If DMCNT.wModo = 'A' Then
   Begin
      DMCNT.wModo := 'M';
      If Z2bbtnNuevo.Visible Then
         Z2bbtnNuevo.Enabled := true;
      If Not dblcdCuenta.visible Then
      Begin
         dblcdCuenta.visible := True;
         dblcdCuenta.text := dbeCta.text;
         dbeCta.visible := False;
      End;
   End;
   Screen.Cursor := crDefault;
End;

Procedure TFPlnCta.dblcCiaExit(Sender: TObject);
Var
   xFiltro, xWhere, xSQL: String;
   xZ: Integer;
Begin
   If (Z2bbtnCanc2.Focused) Then
      Exit;

   DMCNT.cdsCia.IndexFieldNames := 'CIAID';
   DMCNT.cdsCia.SetKey;
   DMCNT.cdsCia.FieldbyName('CIAID').AsString := dblcCia.Text;
   If Not DMCNT.cdsCia.GotoKey Then
   Begin
      ShowMessage('Falta Código de Compañía');
      dblcCia.SetFocus;
      exit;
   End;

   dbeCia.Text := DMCNT.cdsCia.FieldByName('CIADES').AsString;
   DMCNT.cdsCuentaLookUp.Close;
   DMCNT.cdsCuentaLookUp.DataRequest('Select * from TGE202 where CIAID=' + QuotedStr(dblcCia.Text));
   DMCNT.cdsCuentaLookUp.Open;

   If DMCNT.cdsCia.RecordCount = 1 Then
   Begin
      lblCopiarCuentas.Visible := False;
      cbCias.Visible := False;
      clbCopiar.Visible := False;
   End
   Else
   Begin
      xSql := 'SELECT CODIGO CIAID, CIADES FROM TGE004, TGE101 '
            + ' WHERE USERID=' + quotedstr(DMCNT.wUsuario)
            + '   AND MODULOID = ' + quotedstr(DMCNT.wModulo)
            + '   AND NTABLA=' + quotedstr('TGE101')
            + '   AND CODIGO <>' + quotedstr(dblcCia.text)
            + '   AND TGE101.CIAID(+) = CODIGO';
      DMCNT.cdsQry.close;
      DMCNT.cdsQry.DataRequest(xSql);
      DMCNT.cdsQry.Open;

      If DMCNT.cdsQry.RecordCount <= 0 Then
      Begin
         xSql := 'SELECT CIAID, CIADES FROM TGE101 WHERE  CIAID <>' + quotedstr(dblcCia.text);
         DMCNT.cdsQry.close;
         DMCNT.cdsQry.DataRequest(xSql);
         DMCNT.cdsQry.Open;
      End;

      lblCopiarCuentas.Visible := True;
      cbCias.Visible := True;
      clbCopiar.Visible := True;
      DMCNT.cdsCia.First;
      clbCopiar.Clear;
      For xZ := 1 To DMCNT.cdsQry.RecordCount Do
      Begin
         clbCopiar.Items.Add(DMCNT.cdsQry.FieldByName('CIAID').AsString + ' - ' + DMCNT.cdsQry.FieldByName('CIADES').AsString);
         DMCNT.cdsQry.Next;
      End;
   End;
End;

Procedure TFPlnCta.dbcbAuxClick(Sender: TObject);
Var
   xWhere: String;
   xAno, xMes, xDia: Word;
Begin

   If xCrea Then Exit;
   If xSalir Then Exit;

   If Not dbcbAux.Checked Then
   Begin
      If DMCNT.wModo <> 'A' Then
      Begin
      // si se desea desactivar el flag de auxiliar, primero verifica que no existan saldos
      // de esa cuenta con algun auxiliar
         decodedate(date, xAno, xMes, xDia);
         xWhere := 'CIAID=' + quotedstr(dblcCia.Text) + ' and CUENTAID=' + quotedstr(dblcdCuenta.Text)
            + ' and ANO=' + quotedstr(inttostr(xAno));
         If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
            xWhere := xWhere + ' and coalesce(AUXID,' + quotedstr('X') + ')<>' + quotedstr('X');
         If SRV_D = 'ORACLE' Then
            xWhere := xWhere + ' and nvl(AUXID,' + quotedstr('X') + ')<>' + quotedstr('X');

         If length(DMCNT.DisplayDescrip('PrvTGE', 'CNT401', '*', xWhere, 'CUENTAID')) > 0 Then
         Begin
            If (DMCNT.cdsQry.FieldByName('SALDMN' + DMCNT.strMes(Date)).AsFloat > 0)
               Or (DMCNT.cdsQry.FieldByName('SALDME' + DMCNT.strMes(Date)).AsFloat > 0) Then
            Begin
               showMessage('No se puede Actualizar porque existen Saldos de Auxilares en esta Cuenta');
               xSalir := True;
               dbcbAux.Checked := True;
               xSalir := False;
               exit;
            End;
         End;
      End;
   End
End;

Procedure TFPlnCta.dblcTipCtaExit(Sender: TObject);
Var
   xWhere, xSql: String;
Begin
   xWhere := 'TIPCTAID=' + quotedStr(dblcTipCta.text);
   dbeTipCta.Text := DMCNT.DisplayDescrip('PrvTGE', 'TGE162', 'TIPCTADES,CTA_TIPO', xWhere, 'TIPCTADES');
   If wInicio <> 'S' Then
   Begin
      If dbeTipCta.Text = '' Then
      Begin
         ShowMessage('Error : Tipo Cuenta No Existe');
         Exit;
      End;
   End;
// Inicio HPC_201401_CNT
//   if DMCNT.cdsQry.fieldbyname('TIPCTAID').AsString = 'R' then // si es de Resultado
   If dblcTipCta.text <> 'I' Then // si es diferente a INVENTARIO
// Fin HPC_201401_CNT
   Begin
      dbcbCtaCierreAnual.Enabled := False;
      dbcbCtaCierreAnual.Checked := True;
      dbcbCtaCierreAnual.OnClick(dbcbCtaCierreAnual);
      dblcdContra.Enabled := True;
      dbcbEsCtaApertura.Enabled := False;
      dbcbEsCtaApertura.Checked := False;
      xSql := 'select CUENTAID,CTADES from TGE202'
         + ' where CIAID=' + quotedstr(dblcCia.value)
         + ' and CTA_CIER=' + quotedstr('S') + ' AND TIPCTAID=' + quotedstr('R');
      DMCNT.cdsQry3.Close;
      DMCNT.cdsQry3.DataRequest(xSql);
      DMCNT.cdsQry3.Open;
      dblcdContra.LookupTable := DMCNT.CdsQry3;
      dblcdContra.Selected.Add('CUENTAID'#9'3'#9'ID'#9'F');
      dblcdContra.Selected.Add('CTADES'#9'75'#9'Descripción'#9'F');
      dblcdContra.LookupField := 'CUENTAID';
      dblcdContra.Refresh;
   End
   Else
   Begin
      dbcbEsCtaApertura.Enabled := True;
      dbcbCtaCierreAnual.Enabled := True;
      dblcdContra.Enabled := False;
      dblcdContra.text := '';
      dbeContra.text := '';
   End;
End;

Procedure TFPlnCta.dblcdCuentaExit(Sender: TObject);
Var
   xWhere, xSigno: String;

Begin
   If xCrea Then Exit;
   If Z2bbtnCanc2.Focused Then Exit;
   If DMCNT.cdsCuenta.State In [dsBrowse, dsInsert, dsedit] Then
   Begin
      DMCNT.cdsCuenta.Cancel;
      DMCNT.cdsCuenta2.Cancel;
   End;

   Screen.Cursor := crHourGlass;

// verifica que la cuenta haya sido registrada previamente
   If Not DMCNT.cdsCuenta.Locate('CIAID;CUENTAID', VarArrayOf([dblcCia.text, dblcdCuenta.text]), [loCaseInsensitive]) Then
   Begin
      showMessage('Cuenta NO existe');
      dblcdCuenta.Text := DMCNT.cdsCuenta.fieldbyname('CUENTAID').AsString;
      dblcdCuenta.SetFocus;
      Screen.Cursor := crDefault;
      exit;
   End;

// Determina el Nivel de la Cuenta Ingresada en base a la cantidad de dígitos
   xNivel1 := '';
   DMCNT.cdsNivel.First;
   While Not DMCNT.cdsNivel.Eof Do
   Begin
      xSigno := trimleft(trimright(DMCNT.cdsNivel.FieldByName('SIGNO').AsString));
      If xSigno = '=' Then
      Begin
         If length(dbeCta.Text) = DMCNT.cdsNivel.FieldByName('DIGITOS').AsInteger Then
         Begin
            xNivel1 := DMCNT.cdsNivel.FieldByName('NIVEL').AsString;
            break;
         End;
      End;
      If xSigno = '<=' Then
      Begin
         If length(dbeCta.Text) <= DMCNT.cdsNivel.FieldByName('DIGITOS').AsInteger Then
         Begin
            xNivel1 := DMCNT.cdsNivel.FieldByName('NIVEL').AsString;
            break;
         End;
      End;
      If xSigno = '>=' Then
      Begin
         If length(dbeCta.Text) >= DMCNT.cdsNivel.FieldByName('DIGITOS').AsInteger Then
         Begin
            xNivel1 := DMCNT.cdsNivel.FieldByName('NIVEL').AsString;
            break;
         End;
      End;
      DMCNT.cdsNivel.Next;
   End;

   If Length(xNivel1) = 0 Then
   Begin
      ShowMessage('Longitud de Cuenta NO Existe en Tabla Nivel de Cuenta');
      dbeCta.SetFocus;
      Exit;
   End;

   If ValNivelSup Then
      If ValNivelAnt Then
      Begin
         dblcNivel1.Text := DMCNT.cdsNivel.FieldByName('NIVEL').AsString;
         dbeSigno.Text := DMCNT.cdsNivel.FieldByName('SIGNO').AsString;
         dbeDigitos.Text := DMCNT.cdsNivel.FieldByName('DIGITOS').AsString;
         DMCNT.cdsCuenta.Edit;
         DMCNT.cdsCuenta.fieldbyname('CTA_DET').AsString := 'S';
         dbcbEsDet.checked := true;
         dbcbEsMovi.Checked := True;
      End
      Else
      Begin
         DMCNT.cdsCuenta.Edit;
         DMCNT.cdsCuenta.fieldbyname('CTA_DET').AsString := 'N';
         dbcbEsDet.checked := False;
         dbcbEsMovi.Checked := False;
      End;
   Screen.Cursor := crDefault;

End;

Procedure TFPlnCta.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFPlnCta.dblcNivelChange(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'NIVEL = ' + '''' + dblcNivel.Text + '''';
   dbeNivel.Text := DMCNT.DisplayDescrip('PrvTGE', 'CNT202', 'DIGITOS', xWhere, 'DIGITOS');
End;

Procedure TFPlnCta.dblcdCtaInicChange(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CUENTAID = ' + '''' + dblcdCtaInic.Text + '''';
   dbeCtaInic.Text := DMCNT.DisplayDescrip('PrvTGE', 'TGE202', 'CTADES', xWhere, 'CTADES');
End;

Procedure TFPlnCta.dblcdCtaFinalChange(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CUENTAID = ' + '''' + dblcdCtaFinal.Text + '''';
   dbeCtaFinal.Text := DMCNT.DisplayDescrip('PrvTGE', 'TGE202', 'CTADES', xWhere, 'CTADES');
End;

Procedure TFPlnCta.Z2bbtnImprimeClick(Sender: TObject);
Var
   xSQL: String;
Begin
   DMCNT.cdsNivel.Last;
   dblcNivel.Text := DMCNT.cdsNivel.FieldByName('NIVEL').AsString;

   xSQL := 'select * From TGE202 where CIAID =' + '''' + dblcCIA.Text + '''' +
      ' order By CUENTAID';
   DMCNT.cdsCuenta3.Close;
   DMCNT.cdsCuenta3.DataRequest(xSQL);
   DMCNT.cdsCuenta3.Open;

   DMCNT.cdsCuenta3.First;
   dblcdCtaInic.Text := DMCNT.cdsCuenta3.FieldByName('CUENTAID').AsString;

   DMCNT.cdsCuenta3.Last;
   dblcdCtaFinal.Text := DMCNT.cdsCuenta3.FieldByName('CUENTAID').AsString;

   pnlPrincipal.Enabled := False;
   pnlReporte.Visible := True;
   pnlFondo.Visible := True;

   dblcNivel.SetFocus;
   pnlPrincipal.SendToBack;

End;

Procedure TFPlnCta.Z2bbtnCanc3Click(Sender: TObject);
Begin
   pnlReporte.Visible := False;
   pnlFondo.Visible := False;
   pnlPrincipal.Enabled := True;
   Z2bbtnCanc2.SetFocus;
End;

Procedure TFPlnCta.dblcNivelExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select * From TGE202 where CIAID =' + '''' + dblcCIA.Text + '''' +
      ' and CTANIV <=' + '''' + dblcNivel.Text + '''' +
      ' order By CUENTAID';
   DMCNT.cdsCuenta3.Close;
   DMCNT.cdsCuenta3.DataRequest(xSQL);
   DMCNT.cdsCuenta3.Open;

   DMCNT.cdsCuenta3.First;
   dblcdCtaInic.Text := DMCNT.cdsCuenta3.FieldByName('CUENTAID').AsString;

   DMCNT.cdsCuenta3.Last;
   dblcdCtaFinal.Text := DMCNT.cdsCuenta3.FieldByName('CUENTAID').AsString;

End;

Procedure TFPlnCta.dblcdCtaFinalExit(Sender: TObject);
Begin
   If dblcdCtaFinal.Text < dblcdCtaInic.Text Then
   Begin
      ShowMessage('Cuenta Inicial es Mayor que la Final');
      dblcdCtaInic.SetFocus;
   End;
End;

Procedure TFPlnCta.Z2bbtnRegistra3Click(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select * From TGE202 where CIAID =' + '''' + dblcCIA.Text + '''' +
      ' and CTANIV <=' + '''' + dblcNivel.Text + '''' +
      ' and CUENTAID >=' + '''' + dblcdCtaInic.Text + '''' +
      ' and CUENTAID <=' + '''' + dblcdCtaFinal.Text + '''' +
      ' order By CUENTAID';
   DMCNT.cdsCuenta3.Close;
   DMCNT.cdsCuenta3.DataRequest(xSQL);
   DMCNT.cdsCuenta3.Open;

   pplblCia.Caption := dbeCia.Text;
   pplblNivel.Caption := dblcNivel.Text;
   pprPlanCtas.Print;
End;

Procedure TFPlnCta.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   xCrea := True;
   pnlReporte.Visible := False;
   pnlFondo.Visible := False;
   pnlPrincipal.Enabled := True;
   dblcCia.Enabled := True;
   dblcdCuenta.Enabled := True;
   DMCNT.cdsCuenta.CancelUpdates;
   Action := caFree;
End;

Procedure TFPlnCta.ppDBText1Print(Sender: TObject);
Var
   x: DOUBLE;
Begin
   x := strtoFloat(DMCNT.cdsCuenta3.FieldByName('CTANIV').AsString) * 0.06;
   ppdbText1.Left := 0.1 + x;
End;

Procedure TFPlnCta.Z2bbtnNuevoClick(Sender: TObject);
Begin
   DMCNT.wModo := 'A';
   self.OnShow(Nil);
End;

Procedure TFPlnCta.FormShow(Sender: TObject);
Var
   xSql: String;
Begin
   xCrea := True;

   cbCias.Checked := False;
   dbcbSeTomaAjusteDC.checked := False;
   dbcbNoMonet.checked := False;
   dblcdContra.clear;
   dbeContra.clear;
   dblcdConsoli.clear;
   dbeConsoli.clear;
   edtTipoREI.clear;
   dblcdCtaREI.clear;
   dbeCuentaREI.clear;
   dbcbCtaAjuste.checked := False;
   dbcbDifCambGan.checked := False;
   chbPlazoCorto.checked := False;
   dbcbCtaCierreAnual.checked := False;

   dblcNivel1.enabled := False;
   dbeSigno.enabled := False;
   dbeDigitos.enabled := False;
   dbcbEsDet.enabled := False;
   gbCtasDestino.Enabled := false;
   dbeCtaAutDebe.enabled := False;
   dbeCtaAutHaber.enabled := False;

   lblCopiarCuentas.Visible := False;
   cbCias.Visible := False;
   clbCopiar.Visible := False;

   /////////////////////
   xSql := 'select TIPOREI,TIPOREIDES from TGE823';
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.IndexFieldNames := '';
   DMCNT.cdsQry2.DataRequest(xSql);
   DMCNT.cdsQry2.Open;
   dblcTipoREI.Selected.Add('TIPOREI'#9'3'#9'ID'#9'F');
   dblcTipoREI.Selected.Add('TIPOREIDES'#9'75'#9'Descripción'#9'F');
   dblcTipoREI.LookupTable := DMCNT.CdsQry2;
   dblcTipoREI.LookupField := 'TIPOREI';
   dblcTipoREI.Refresh;
   ////////////

   If DMCNT.wModo = 'A' Then //INSERTAR CUENTA
   Begin
      dblcCia.Text := '';
      dbeCia.text := '';

      dblcdCuenta.visible := False; // es para Modificación
      dbeCta.visible := True; // es para Adición
      dbeCta.text := '';
      dbeDescripcion.Text := '';
      dbeCtaAbr.Text := '';

      dblcNivel1.Text := '';
      dbeSigno.Text := '';
      dbeDigitos.Text := '';
      dbcbEsDet.checked := False;
      dbeTipCta.Text := '';
      chbPlazoCorto.Checked := False;
      chbPlazoLargo.Checked := False;
      dbcbTieneCtaDestino.Checked := False;
      dblcdCtaAutDebe.Text := '';
      dblcdCtaAutHaber.Text := '';
      xCtaDebeDest := '';
      xCtaHaberDest := '';
      dbcbDoc.Checked := False;
      dbcbAux.Checked := False;
      dbcbCCosto.Checked := False;
      dbcbEsDifCambioGP.Checked := False;
      dbcbMayorizaenME.Checked := False;
      dbcbCtaCierreAnual.Checked := False;
      dbcbEsDesti.Checked := False;
      dbcbEsMovi.Checked := False;
      dbcbPermiteMov.Checked := False;

      DMCNT.cdsCuenta.Insert;

      wModif := 'N';
      Z2bbtnNuevo.Visible := True;
      Z2bbtnNuevo.Enabled := false;
      dblcCia.SetFocus;

   End
   Else
   Begin
      wInicio := 'S';
   // esto es para cuando se quiera volver a restablecer las cuentas automáticas
   // en caso se haya desabilitado el check de "tiene cta destino" por error
      xCtaDebeDest := DMCNT.cdsCuenta.FieldByName('CTAAUT1').AsString;
      xCtaHaberDest := DMCNT.cdsCuenta.FieldByName('CTAAUT2').AsString;

      Z2bbtnNuevo.Visible := False;
      wModif := 'S';
      dblcCia.Text := DMCNT.cdsCuenta.FieldByName('CIAID').AsString;
      DMCNT.cdsCia.IndexFieldNames := 'CIAID';
      DMCNT.cdsCia.SetKey;
      DMCNT.cdsCia.FieldbyName('CIAID').AsString := dblcCia.Text;
      If Not DMCNT.cdsCia.GotoKey Then
      Begin
         ShowMessage('No Tiene Accesos a Esta Compañía');
         exit;
      End;

      dblcCiaExit(Sender);
      dblcCia.Enabled := False;
      dblcdCuenta.text := DMCNT.cdsCuenta.FieldByName('CUENTAID').AsString;
      xCrea := False;
      cargadata;

   End;
   xCrea := False;
End;

Procedure TFPlnCta.FiltraPlan;
Var
   xSQL: String;
Begin
   xSQL := ' Select CIAID,CUENTAID,SALDMN01,SALDMN02,SALDMN03,SALDMN04,SALDMN05,SALDMN06,' +
      ' SALDMN07,SALDMN08,SALDMN09,SALDMN10,SALDMN11,SALDMN12,SALDME01,SALDME02,SALDME03,' +
      ' SALDME04,SALDME05,SALDME06,SALDME07,SALDME08,SALDME09,SALDME10,SALDME11,SALDME12' +
      '  From CNT401 Where CIAID =' + '''' + dblcCia.Text + '''';
   DMCNT.Filtracds(DMCNT.cdsRCuenta, xSQL);
End;

Procedure TFPlnCta.Z2bbtnCloseClick(Sender: TObject);
Begin
   If DMCNT.cdsCuenta.State In [dsInsert, dsedit] Then
   Begin
      DMCNT.cdsCuenta.Cancel;
      DMCNT.cdsCuenta2.Cancel;
   End;
   Close;
End;

Procedure TFPlnCta.DesHabilitaChecks;
Var
   i: integer;
Begin
   For i := 0 To pnlDetalle.ControlCount - 1 Do
   Begin
      If pnlDetalle.Controls[i] Is TDBCheckBox Then
      Begin
         TDBCheckBox(pnlDetalle.Controls[i]).State := cbUnChecked;
         TDBCheckBox(pnlDetalle.Controls[i]).allowGrayed := false;
      End;
   End;
End;

Procedure TFPlnCta.NotInList(Sender: TObject; LookupTable: TDataSet;
   NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;

   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFPlnCta.dbeCtaExit(Sender: TObject);
Var
   xWhere, xSigno: String;
Begin
   dbeCta.Text := trimleft(trimright(dbeCta.Text));

// verifica que la cuenta no haya sido registrada previamente
   xWhere := 'CIAID =' + quotedStr(dblcCIA.Text) + ' and CUENTAID=' + quotedStr(dbeCta.Text);
   If length(DMCNT.DisplayDescrip('PrvTGE', 'TGE202', 'CUENTAID', xWhere, 'CUENTAID')) > 0 Then
   Begin
      showMessage('Cuenta ya existe');
      dbeCta.SetFocus;
      exit;
   End;

// Determina el Nivel de la Cuenta Ingresada en base a la cantidad de dígitos
   xNivel1 := '';
   DMCNT.cdsNivel.First;
   While Not DMCNT.cdsNivel.Eof Do
   Begin
      xSigno := trimleft(trimright(DMCNT.cdsNivel.FieldByName('SIGNO').AsString));
      If xSigno = '=' Then
      Begin
         If length(dbeCta.Text) = DMCNT.cdsNivel.FieldByName('DIGITOS').AsInteger Then
         Begin
            xNivel1 := DMCNT.cdsNivel.FieldByName('NIVEL').AsString;
            break;
         End;
      End;
      If xSigno = '<=' Then
      Begin
         If length(dbeCta.Text) <= DMCNT.cdsNivel.FieldByName('DIGITOS').AsInteger Then
         Begin
            xNivel1 := DMCNT.cdsNivel.FieldByName('NIVEL').AsString;
            break;
         End;
      End;
      If xSigno = '>=' Then
      Begin
         If length(dbeCta.Text) >= DMCNT.cdsNivel.FieldByName('DIGITOS').AsInteger Then
         Begin
            xNivel1 := DMCNT.cdsNivel.FieldByName('NIVEL').AsString;
            break;
         End;
      End;
      DMCNT.cdsNivel.Next;
   End;

   If Length(xNivel1) = 0 Then
   Begin
      ShowMessage('Longitud de Cuenta NO Existe en Tabla Nivel de Cuenta');
      dbeCta.SetFocus;
      Exit;
   End;

   If ValNivelAnt Then
   Begin
      dblcNivel1.Text := DMCNT.cdsNivel.FieldByName('NIVEL').AsString;
      dbeSigno.Text := DMCNT.cdsNivel.FieldByName('SIGNO').AsString;
      dbeDigitos.Text := DMCNT.cdsNivel.FieldByName('DIGITOS').AsString;
      DMCNT.cdsCuenta.fieldbyname('CTA_DET').AsString := 'S';
      dbcbEsDet.checked := true;
      dbcbEsMovi.Checked := True;
   End;
End;

Procedure TFPlnCta.dbcbTieneCtaDestinoClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If xCrea Then Exit;

   If (dbcbTieneCtaDestino.Checked) And (dbcbEsDesti.Checked) Then
   Begin
      ShowMessage('La Cuenta ha sido declarada como Cuenta de Destino');
      dbcbTieneCtaDestino.Checked := False;
      exit;
   End;

   If dbcbTieneCtaDestino.Checked Then
   Begin
      DMCNT.cdsCtaDestino.close;
      xSQL := 'Select CUENTAID,CTADES,CIAID from TGE202 where CIAID=' + quotedstr(dblcCIA.Text)
         + ' and CTA_DEST=' + quotedstr('S');
      DMCNT.cdsCtaDestino.DataRequest(xSQL);
      DMCNT.cdsCtaDestino.Open;

   // si ya tuvo cuentas automáticas anteriores en la presente actualización
   // las restituirá como sugerencia
      gbCtasDestino.Enabled := True;
      dblcdCtaAutDebe.text := xCtaDebeDest;
      dblcdCtaAutHaber.text := xCtaHaberDest;
      If length(trim(xCtaDebeDest)) > 0 Then
      Begin
         dblcdCtaAutDebeExit(Sender);
      End;
      If length(trim(xCtaHaberDest)) > 0 Then
      Begin
         dblcdCtaAutHaberExit(Sender);
      End;
   End
   Else
   Begin
      xCtaDebeDest := dblcdCtaAutDebe.text;
      xCtaHaberDest := dblcdCtaAutHaber.text;
      dblcdCtaAutDebe.text := '';
      dblcdCtaAutHaber.text := '';
      dbeCtaAutDebe.text := '';
      dbeCtaAutHaber.text := '';
      gbCtasDestino.Enabled := false;
   End;
End;

Procedure TFPlnCta.dblcdCtaAutHaberExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CUENTAID = ' + QuotedStr(dblcdCtaAutHaber.Text) + ' AND CIAID=' + QuotedStr(dblcCia.text);
   dbeCtaAutHaber.Text := DMCNT.DisplayDescrip('PrvTGE', 'TGE202', 'CTADES', xWhere, 'CTADES');
   If wInicio <> 'S' Then
   Begin
      If length(dbeCtaAutHaber.text) = 0 Then
      Begin
         ShowMessage('Cuenta de Destino 2 NO existe, reintente');
         dblcdCtaAutHaber.SetFocus;
         exit;
      End;
   End;

End;

Procedure TFPlnCta.chbPlazoCortoClick(Sender: TObject);
Begin
   If wInicio <> 'S' Then
      chbPlazoLargo.Checked := Not chbPlazoCorto.Checked;
End;

Procedure TFPlnCta.chbPlazoLargoClick(Sender: TObject);
Begin
   If wInicio <> 'S' Then
      chbPlazoCorto.Checked := Not chbPlazoLargo.Checked;
End;

Procedure TFPlnCta.dbcbEsDestiClick(Sender: TObject);
Begin
   If xCrea Then Exit;

   If (dbcbTieneCtaDestino.Checked) And (dbcbEsDesti.Checked) Then
   Begin
      ShowMessage('La Cuenta ha sido declarada como que Tiene Cuenta Destino');
      dbcbEsDesti.Checked := False;
      exit;
   End;

   If dbcbEsDet.Checked Then
   Begin
      If dbcbEsDesti.Checked Then
      Begin
         dbcbEsMovi.Checked := False;
         dbcbPermiteMov.Visible := True;
      End
      Else
      Begin
         dbcbEsMovi.Checked := True;
         dbcbPermiteMov.Visible := False;
      End;
   End
   Else
   Begin
      dbcbEsMovi.Checked := False;
      dbcbPermiteMov.Visible := False;
   End;
End;

Procedure TFPlnCta.dblcdCtaAutDebeExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CUENTAID = ' + QuotedStr(dblcdCtaAutDebe.Text) + ' AND CIAID=' + QuotedStr(dblcCia.text);
   dbeCtaAutDebe.Text := DMCNT.DisplayDescrip('PrvTGE', 'TGE202', 'CTADES', xWhere, 'CTADES');
   If wInicio <> 'S' Then
   Begin
      If length(dbeCtaAutDebe.text) = 0 Then
      Begin
         ShowMessage('Cuenta de Destino 1 NO existe, reintente');
         dblcdCtaAutDebe.SetFocus;
         exit;
      End;
   End;

End;

Procedure TFPlnCta.dblcdContraExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If xSalir Then Exit;
   If dblcTipCta.Focused Then exit;

   xWhere := 'CIAID=' + quotedstr(dblcCia.Text) + ' and CUENTAID=' + quotedstr(dblcdContra.Text);
   dbeContra.text := DMCNT.DisplayDescrip('PrvTGE', 'TGE202', 'CTADES', xWhere, 'CTADES');
   If wInicio <> 'S' Then
   Begin
      If length(dbeContra.text) = 0 Then
      Begin
         ShowMessage('Cuenta de Contrapartida NO existe, reintente');
         dblcdContra.SetFocus;
         exit;
      End;
   End;
End;

Procedure TFPlnCta.dbcbCCostoClick(Sender: TObject);
Var
   xWhere: String;
   xAno, xMes, xDia: Word;
Begin
   If xCrea Then Exit;
   If xSalir Then Exit;

   If Not dbcbCCosto.Checked Then
   Begin
      If DMCNT.wModo <> 'A' Then
      Begin
      // si se desea desactivar el flag de auxiliar, primero verifica que no existan saldos
      // de esa cuenta con algun auxiliar
         decodedate(date, xAno, xMes, xDia);
         xWhere := 'CIAID=' + quotedstr(dblcCia.Text) + ' and CUENTAID=' + quotedstr(dblcdCuenta.Text)
            + ' and ANO=' + quotedstr(inttostr(xAno));
         If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
            xWhere := xWhere + ' and coalesce(CCOSID,' + quotedstr('X') + ')<>' + quotedstr('X');
         If SRV_D = 'ORACLE' Then
            xWhere := xWhere + ' and nvl(CCOSID,' + quotedstr('X') + ')<>' + quotedstr('X');

         If length(DMCNT.DisplayDescrip('PrvTGE', 'CNT401', '*', xWhere, 'CUENTAID')) > 0 Then
         Begin
            If (DMCNT.cdsQry.FieldByName('SALDMN' + DMCNT.strMes(Date)).AsFloat > 0)
               Or (DMCNT.cdsQry.FieldByName('SALDME' + DMCNT.strMes(Date)).AsFloat > 0) Then
            Begin
               ShowMessage('No se puede Actualizar porque existen Saldos de Centros de Costo en esta Cuenta');
               xSalir := True;
               dbcbCCosto.Checked := True;
               xSalir := False;
               exit;
            End;
         End;
      End;
   End
End;

Procedure TFPlnCta.dbcbEsDifCambioGPClick(Sender: TObject);
Begin
   dbcbDifCambGan.Visible := dbcbEsDifCambioGP.checked;
   dbcbDifCambPer.Visible := dbcbEsDifCambioGP.checked;
   If Not dbcbEsDifCambioGP.checked Then
   Begin
      dbcbDifCambGan.Checked := False;
      dbcbDifCambPer.Checked := False;
   End
   Else
   Begin
      If DMCNT.wModo = 'M' Then
      Begin
         If DMCNT.cdsCuenta.fieldbyname('CTA_DIFGP').AsString = 'G' Then
         Begin
            dbcbDifCambGan.Checked := true;
            dbcbDifCambPer.Checked := False;
         End;
         If DMCNT.cdsCuenta.fieldbyname('CTA_DIFGP').AsString = 'P' Then
         Begin
            dbcbDifCambGan.Checked := False;
            dbcbDifCambPer.Checked := True;
         End;
      End;
   End;
End;

Procedure TFPlnCta.dblcTipoREIExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'TIPOREI=' + quotedstr(dblcTipoREI.value);
   edtTipoREI.TEXT := DMCNT.DisplayDescrip('PrvTGE', 'TGE823', 'TIPOREIDES', xWhere, 'TIPOREIDES');
   dblcdCtaREI.enabled := Length(edtTipoREI.TEXT) > 0;
End;

Procedure TFPlnCta.dblcdCtaREIExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CIAID=' + quotedstr(dblcCia.Text) + ' and CUENTAID=' + quotedstr(dblcdCtaREI.Text);
   dbeCuentaREI.text := DMCNT.DisplayDescrip('PrvTGE', 'TGE202', 'CTADES', xWhere, 'CTADES');
   If wInicio <> 'S' Then
      If length(dbeCuentaREI.text) = 0 Then
      Begin
         ShowMessage('Cuenta de RIE NO existe, reintente');
         dblcdCtaREI.SetFocus;
         exit;
      End;
End;

Procedure TFPlnCta.dbcbEsCtaAperturaClick(Sender: TObject);
Begin
   dbcbCtaCierreAnual.enabled := Not dbcbEsCtaApertura.checked;
   If Not dbcbEsCtaApertura.checked Then
      dbcbCtaCierreAnual.checked := False;
End;

Procedure TFPlnCta.dbcbCtaCierreAnualClick(Sender: TObject);
Begin
   dbcbEsCtaApertura.enabled := Not dbcbCtaCierreAnual.checked;
   If Not dbcbCtaCierreAnual.checked Then
   Begin
      dbcbEsCtaApertura.checked := False;
      dbeSecu.Enabled := False;
      dbeSecu.Clear;
   End
   Else
// Inicio HPC_201401_CNT
   Begin
      dblcdContra.enabled := True;
      dbeSecu.Enabled := True;
   End;
// Fin HPC_201401_CNT
End;

Procedure TFPlnCta.cargadata;
Begin
   Screen.Cursor := crDefault;
   dblcModulo.text := DMCNT.cdsCuenta.fieldbyname('CTAMODDIFC').AsString;
// Inicio HPC_201401_CNT
//   dblcdContra.text := DMCNT.cdsCuenta.fieldbyname('CTACONTRA').AsString;
   dblcdCtaAutDebe.text := DMCNT.cdsCuenta.fieldbyname('CTAAUT1').AsString;
   dblcdCtaAutHaber.text := DMCNT.cdsCuenta.fieldbyname('CTAAUT2').AsString;
   dblcTipoREI.text := DMCNT.cdsCuenta.fieldbyname('CTA_TIPOREI').AsString;
   dblcdCtaREI.text := DMCNT.cdsCuenta.fieldbyname('CTA_AJUSTEREI').AsString;
   dblcTipCta.onexit(dblcTipCta);
   dblcdContra.text := DMCNT.cdsCuenta.fieldbyname('CTACONTRA').AsString;
   dblcdContra.Enabled := dbcbCtaCierreAnual.Checked;
// Fin HPC_201401_CNT
   dbcbDOC.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_DOC').AsString = 'S';
   dbcbAux.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_AUX').AsString = 'S';
   dbcbAux.onclick(dbcbAux);
   dbcbCCosto.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_CCOS').AsString = 'S';
   dbcbCCosto.OnClick(dbcbCCosto);
   dbcbNoMonet.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_NOMONET').AsString = 'S';
   dbcbEsCtaApertura.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_APERT').AsString = 'S';
   dbcbEsCtaApertura.OnClick(dbcbEsCtaApertura);
   dbcbMayorizaenME.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_ME').AsString = 'S';
   dbcbSeTomaAjusteDC.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_DIFC').AsString = 'S';
   dbcbDifCambGan.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_DIFGP').AsString = 'G';
   dbcbDifCambPer.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_DIFGP').AsString = 'P';
   dbcbRegistroSoloME.Checked := DMCNT.cdsCuenta.fieldbyname('REGSOLOME').AsString = 'S';
   dblcModulo.OnExit(dblcModulo);
   chbPlazoCorto.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_PLAZ').AsString = 'C';
   chbPlazoCorto.onclick(chbPlazoCorto);
   chbPlazoLargo.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_PLAZ').AsString = 'L';
   chbPlazoLargo.onclick(chbPlazoLargo);
   dbcbCtaCierreAnual.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_CIER').AsString = 'S';
   dbcbCtaCierreAnual.onclick(dbcbCtaCierreAnual);
   dblcdContra.OnExit(dblcdContra);
   dbcbEsDesti.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_DEST').AsString = 'S';
   dbcbEsDesti.onclick(dbcbEsDesti);
   dbcbTieneCtaDestino.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_AUT1').AsString = 'S';
   dbcbTieneCtaDestino.onclick(dbcbTieneCtaDestino);
   dbcbEsDet.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_DET').AsString = 'S';
   dbcbEsMovi.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_MOV').AsString = 'S';
   dbcbPermiteMov.Checked := DMCNT.cdsCuenta.fieldbyname('FLGVAR').AsString = 'S';
   dblcdCtaAutDebe.OnExit(dblcdCtaAutDebe);
   dblcdCtaAutHaber.OnExit(dblcdCtaAutHaber);
   dblcTipoREI.OnExit(dblcTipoREI);
   dblcdCtaREI.OnExit(dblcdCtaREI);
   dbcbEsDifCambioGP.checked := (DMCNT.cdsCuenta.fieldbyname('CTA_DIFGP').AsString = 'G') Or (DMCNT.cdsCuenta.fieldbyname('CTA_DIFGP').AsString = 'P');
   dbeSecu.text := DMCNT.cdsCuenta.fieldbyname('CTA_SECU').AsString;
   dbcbCtaAjuste.Checked := DMCNT.cdsCuenta.fieldbyname('CTA_SALAJREI').AsString = 'S';
   dblcdConsoli.value := DMCNT.cdsCuenta.fieldbyname('CTA_CONSOL').AsString;
   dblcdConsoli.OnExit(dblcdConsoli);
   wInicio := '';
   dbeDescripcion.SetFocus;
   xCrea := False;
End;

Procedure TFPlnCta.dbcbDifCambGanClick(Sender: TObject);
Begin
   dbcbDifCambPer.Checked := Not dbcbDifCambGan.Checked;
End;

Procedure TFPlnCta.dbcbDifCambPerClick(Sender: TObject);
Begin
   dbcbDifCambGan.Checked := Not dbcbDifCambPer.Checked;
End;

Procedure TFPlnCta.ActNivelAnt;
Var
   xSql, xCuenta1, xNivel2: String;
   xNive: Integer;
Begin
   xNive := 0;
   xNivel2 := DMCNT.StrZero(inttoStr((strtoInt(xNivel1)) - 1), length(xNivel1));
   DMCNT.cdsNivel.SetKey;
   DMCNT.cdsNivel.FieldByName('NIVEL').AsString := xNivel2;
   If DMCNT.cdsNivel.GotoKey Then
      xNive := DMCNT.cdsNivel.FieldByName('DIGITOS').AsInteger;

   If dblcdCuenta.visible Then
      xCuenta1 := copy(dblcdCuenta.Text, 1, xNive)
   Else
      xCuenta1 := copy(dbeCta.Text, 1, xNive);

   If xCuenta1 <> '' Then
   Begin
      xSQL := 'Update TGE202 set CTA_DET=''N'', CTA_MOV=''N'' '
         + 'WHERE CIAID=''' + dblcCIA.Text + ''' and  '
         + 'CUENTAID=''' + xCuenta1 + '''';
      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      Try
         DMCNT.cdsCuenta2.Close;
         DMCNT.cdsCuenta2.DataRequest(xSQL);
         DMCNT.cdsCuenta2.Execute;
         DMCNT.DCOM1.AppServer.GrabaTransaccion;
      Except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
      End;
   End;
End;

Function TFPlnCta.ValNivelAnt: boolean;
Var
   xDigitos: Integer;
   xWhere, xCuenta: String;
Begin
// verifica que los niveles anteriores hayan sido registrados
   Result := True;
   DMCNT.cdsNivel.First;
   While (Not DMCNT.cdsNivel.Eof) And (DMCNT.cdsNivel.FieldByName('NIVEL').AsString < xNivel1) Do
   Begin
      xDigitos := DMCNT.cdsNivel.FieldByName('DIGITOS').AsInteger;
      xCuenta := copy(dbeCta.Text, 1, xDigitos);

      xWhere := 'CIAID =' + quotedStr(dblcCIA.Text) + ' and CUENTAID=' + quotedStr(xCuenta);
      If length(DMCNT.DisplayDescrip('PrvTGE', 'TGE202', 'CUENTAID', xWhere, 'CUENTAID')) = 0 Then
      Begin
         showMessage('No hay Cuenta en Nivel' + DMCNT.cdsNivel.FieldByName('NIVEL').AsString);
         dbeCta.SetFocus;
         Result := false;
         exit;
      End;
      DMCNT.cdsNivel.Next;
   End;
End;

Procedure TFPlnCta.dblcdConsoliExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If xCrea Then Exit;
   If xSalir Then Exit;
   xWhere := 'CIAID=' + quotedstr('01') + ' and CUENTAID=' + quotedstr(dblcdConsoli.Text);
   dbeConsoli.text := DMCNT.DisplayDescrip('PrvTGE', 'TGE202', 'CTADES', xWhere, 'CTADES');
   If wInicio <> 'S' Then
   Begin
      If (dblcdConsoli.Text <> '') And (length(dbeConsoli.text) = 0) Then
      Begin
         ShowMessage('Cuenta Consolidada NO existe, reintente');
         dblcdConsoli.SetFocus;
         exit;
      End;
   End;
End;

Procedure TFPlnCta.Z2bbtnBorrarClick(Sender: TObject);
Var
   xSql: String;
Begin
 //** Paso 1, para borrar se debe validar que la cta. no tenga movi. en ningun año
   xSql := 'SELECT COUNT(*) TOTAL from ' +
      ' (SELECT CIAID,CUENTAID FROM CNT401 WHERE CIAID=' + quotedstr(dblcCia.text) +
      ' AND CUENTAID=' + quotedstr(dbeCta.text) +
      ' group by CIAID,CUENTAID' +
      ' HAVING ( ' +
      ' SUM(DEBEMN00) <> 0 OR SUM(DEBEMN01) <> 0 OR  SUM(DEBEMN02) <> 0 OR ' +
      ' SUM(DEBEMN03) <> 0 OR  SUM(DEBEMN04) <> 0 OR SUM(DEBEMN05) <> 0 OR' +
      ' SUM(DEBEMN06) <> 0 OR SUM(DEBEMN07) <> 0 OR  SUM(DEBEMN08) <> 0 OR' +
      ' SUM(DEBEMN09) <> 0 OR  SUM(DEBEMN10) <> 0 OR SUM(DEBEMN11) <> 0 OR' +
      ' SUM(DEBEMN12) <> 0) OR' +
      ' (SUM(DEBEME00) <> 0 OR SUM(DEBEME01) <> 0 OR  SUM(DEBEME02) <> 0 OR' +
      ' SUM(DEBEME03) <> 0 OR  SUM(DEBEME04) <> 0 OR SUM(DEBEME05) <> 0 OR' +
      ' SUM(DEBEME06) <> 0 OR SUM(DEBEME07) <> 0 OR  SUM(DEBEME08) <> 0 OR' +
      ' SUM(DEBEME09) <> 0 OR  SUM(DEBEME10) <> 0 OR SUM(DEBEME11) <> 0 OR' +
      ' SUM(DEBEME12) <> 0 ) OR' +
      ' (SUM(HABEME00) <> 0 OR SUM(HABEME01) <> 0 OR  SUM(HABEME02) <> 0 OR' +
      ' SUM(HABEME03) <> 0 OR  SUM(HABEME04) <> 0 OR SUM(HABEME05) <> 0 OR' +
      ' SUM(HABEME06) <> 0 OR SUM(HABEME07) <> 0 OR  SUM(HABEME08) <> 0 OR' +
      ' SUM(HABEME09) <> 0 OR  SUM(HABEME10) <> 0 OR SUM(HABEME11) <> 0 OR' +
      ' SUM(HABEME12) <> 0 ) OR' +
      ' (SUM(HABEMN00) <> 0 OR SUM(HABEMN01) <> 0 OR  SUM(HABEMN02) <> 0 OR' +
      ' SUM(HABEMN03) <> 0 OR  SUM(HABEMN04) <> 0 OR SUM(HABEMN05) <> 0 OR' +
      ' SUM(HABEMN06) <> 0 OR SUM(HABEMN07) <> 0 OR  SUM(HABEMN08) <> 0 OR' +
      ' SUM(HABEMN09) <> 0 OR  SUM(HABEMN10) <> 0 OR SUM(HABEMN11) <> 0 OR' +
      ' SUM(HABEMN12) <> 0 ) ) RESULTADO';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSql);
   DMCNT.cdsQry.Open;
   If DMCNT.cdsQry.FieldByName('TOTAL').AsFloat > 0 Then
   Begin
      Showmessage('Esta Cta. no se puede eliminar. Registra Saldo a la fecha');
      exit
   End;

   //TGE208
   //TGE131
   //CXP201
   //CXC201
   //CAJA201
   //TGE106
   //RRHH202
   //ACF110
   //PPRES201
   xSQL := ' SELECT TABLE_NAME FROM USER_ALL_TABLES WHERE TABLE_NAME=''TGE208'' ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   If DMCNT.cdsQry.RecordCount > 0 Then
   Begin
      xSQL := ' SELECT * FROM TGE208 WHERE CUENTAID=' + QuotedStr(dblcdCuenta.text) + ' OR CTADEBE=' + QuotedStr(dblcdCuenta.text) + ' OR CTAHABER=' + QuotedStr(dblcdCuenta.text);
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
      If DMCNT.cdsQry.RecordCount > 0 Then
      Begin
         Showmessage('No se puede borrar la cuenta. Se registra en el archivo TGE208');
         exit;
      End;
   End;

   xSQL := ' SELECT TABLE_NAME FROM USER_ALL_TABLES WHERE TABLE_NAME=''TGE131'' ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   If DMCNT.cdsQry.RecordCount > 0 Then
   Begin
      xSQL := ' SELECT * FROM TGE131 WHERE CIAID=' + QuotedStr(dblcCia.text) + ' AND (CUENTAID=' + QuotedStr(dblcdCuenta.text) + ' OR CUENTAHAB=' + QuotedStr(dblcdCuenta.text) + ')';
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
      If DMCNT.cdsQry.RecordCount > 0 Then
      Begin
         Showmessage('No se puede borrar la cuenta. Se registra en el archivo TGE131');
         exit;
      End;
   End;

   xSQL := ' SELECT TABLE_NAME FROM USER_ALL_TABLES WHERE TABLE_NAME=''CXP201'' ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   If DMCNT.cdsQry.RecordCount > 0 Then
   Begin
      xSQL := ' SELECT * FROM CXP201 WHERE CUENTAID=' + QuotedStr(dblcdCuenta.text);
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
      If DMCNT.cdsQry.RecordCount > 0 Then
      Begin
         Showmessage('No se puede borrar la cuenta. Se registra en el archivo CXP201');
         exit;
      End;
   End;

   xSQL := ' SELECT TABLE_NAME FROM USER_ALL_TABLES WHERE TABLE_NAME=''CXC201'' ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   If DMCNT.cdsQry.RecordCount > 0 Then
   Begin
      xSQL := ' SELECT * FROM CXC201 WHERE CIAID=' + QuotedStr(dblcCia.text) + ' AND CUENTAID=' + QuotedStr(dblcdCuenta.text);
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
      If DMCNT.cdsQry.RecordCount > 0 Then
      Begin
         Showmessage('No se puede borrar la cuenta. Se registra en el archivo CXC201');
         exit;
      End;
   End;

   xSQL := ' SELECT TABLE_NAME FROM USER_ALL_TABLES WHERE TABLE_NAME=''CAJA201'' ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   If DMCNT.cdsQry.RecordCount > 0 Then
   Begin
      xSQL := ' SELECT * FROM CAJA201 WHERE CUENTAID=' + QuotedStr(dblcdCuenta.text);
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
      If DMCNT.cdsQry.RecordCount > 0 Then
      Begin
         Showmessage('No se puede borrar la cuenta. Se registra en el archivo CAJA201');
         exit;
      End;
   End;

   xSQL := ' SELECT TABLE_NAME FROM USER_ALL_TABLES WHERE TABLE_NAME=''TGE106'' ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   If DMCNT.cdsQry.RecordCount > 0 Then
   Begin
      xSQL := ' SELECT * FROM TGE106 WHERE CIAID=' + QuotedStr(dblcCia.text) + ' AND (CTAPRINC=' + QuotedStr(dblcdCuenta.text) + ' OR CTAREMES=' + QuotedStr(dblcdCuenta.text) +
         ' OR CTADIFG=' + QuotedStr(dblcdCuenta.text) + ' OR CTADIFP=' + QuotedStr(dblcdCuenta.text) + ')';
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
      If DMCNT.cdsQry.RecordCount > 0 Then
      Begin
         Showmessage('No se puede borrar la cuenta. Se registra en el archivo TGE106');
         exit;
      End;
   End;

   xSQL := ' SELECT TABLE_NAME FROM USER_ALL_TABLES WHERE TABLE_NAME=''RRHH202'' ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   If DMCNT.cdsQry.RecordCount > 0 Then
   Begin
      xSQL := ' SELECT * FROM RRHH202 WHERE RUBCTAN=' + QuotedStr(dblcdCuenta.text) + ' OR RUBCTAV=' + QuotedStr(dblcdCuenta.text) +
         ' OR RUBCTAG=' + QuotedStr(dblcdCuenta.text);
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
      If DMCNT.cdsQry.RecordCount > 0 Then
      Begin
         Showmessage('No se puede borrar la cuenta. Se registra en el archivo RRHH202');
         exit;
      End;
   End;

   xSQL := ' SELECT TABLE_NAME FROM USER_ALL_TABLES WHERE TABLE_NAME=''ACF110'' ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   If DMCNT.cdsQry.RecordCount > 0 Then
   Begin
      xSQL := ' SELECT * FROM ACF110 WHERE CUENTAID=' + QuotedStr(dblcdCuenta.text) + ' OR CTADEPRE=' + QuotedStr(dblcdCuenta.text) +
         ' OR CTADEPAC=' + QuotedStr(dblcdCuenta.text) + ' OR REIAJUSTE=' + QuotedStr(dblcdCuenta.text) + ' OR REIDEPRE=' + QuotedStr(dblcdCuenta.text) +
         ' OR REI=' + QuotedStr(dblcdCuenta.text);
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
      If DMCNT.cdsQry.RecordCount > 0 Then
      Begin
         Showmessage('No se puede borrar la cuenta. Se registra en el archivo ACF110');
         exit;
      End;
   End;

   xSQL := ' SELECT TABLE_NAME FROM USER_ALL_TABLES WHERE TABLE_NAME=''PPRES201'' ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   If DMCNT.cdsQry.RecordCount > 0 Then
   Begin
      xSQL := ' SELECT * FROM PPRES201 WHERE PARPRESID=' + QuotedStr(dblcdCuenta.text);
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
      If DMCNT.cdsQry.RecordCount > 0 Then
      Begin
         Showmessage('No se puede borrar la cuenta. Se registra en el archivo PPRES201');
         exit;
      End;
   End;

 //** valido si es de movimiento
   If Not dbcbEsMovi.checked Then
   Begin
      Showmessage('Esta Cta. no es de Movimiento');
      exit
   End;

 //** valido si existe más ctas. con el mismo nivel, caso cotnrario deberia actualizar el nivel
 //** anterior
   xSql := 'select count(*) total from tge202 where ciaid=' + quotedstr(dblcCia.text) +
      ' and cuentaid like ' + quotedstr(dbeCta.text + '||%') + ' and ctaniv=' + quotedstr(dblcNivel1.text) +
      ' and cuentaid <> ' + quotedstr(dbeCta.text);
   DMCNT.cdsQry.close;
   DMCNT.cdsQry.DataRequest(xSql);
   DMCNT.cdsQry.open;
   xNivel1 := DMCNT.cdsCuenta.fieldbyname('CTANIV').AsString;
   If DMCNT.cdsQry.FieldByName('TOTAL').AsFloat = 0 Then
      ActCtaAlBorrar;

 //** borro de la CNT401 (SALDOS)
   xSql := 'DELETE FROM CNT401 WHERE CIAID=' + quotedstr(dblcCia.text) +
      ' AND CUENTAID=' + quotedstr(dbeCta.text);
   DMCNT.DCOM1.AppServer.EjecutaQry(xSql);

 //** borro del plan de CTAS
   DMCNT.cdsCuenta.Delete;
   DMCNT.AplicaDatos(DMCNT.cdsCuenta, '');
   Z2bbtnClose.onclick(Z2bbtnClose);

End;

Procedure TFPlnCta.ActCtaAlBorrar;
Var
   xSql, xCuenta1, xNivel2: String;
   xNive: Integer;
Begin
   xNive := 0;
   xNivel2 := DMCNT.StrZero(inttoStr((strtoInt(xNivel1)) - 1), length(xNivel1));
   DMCNT.cdsNivel.SetKey;
   DMCNT.cdsNivel.FieldByName('NIVEL').AsString := xNivel2;
   If DMCNT.cdsNivel.GotoKey Then
      xNive := DMCNT.cdsNivel.FieldByName('DIGITOS').AsInteger;

   If dblcdCuenta.visible Then
      xCuenta1 := copy(dblcdCuenta.Text, 1, xNive)
   Else
      xCuenta1 := copy(dbeCta.Text, 1, xNive);

   If xCuenta1 <> '' Then
   Begin
      xSQL := 'Update TGE202 set CTA_DET=''S'', CTA_MOV=''S'' '
         + 'WHERE CIAID=''' + dblcCIA.Text + ''' and  '
         + 'CUENTAID=''' + xCuenta1 + '''';
      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      Try
         DMCNT.cdsCuenta2.Close;
         DMCNT.cdsCuenta2.DataRequest(xSQL);
         DMCNT.cdsCuenta2.Execute;
         DMCNT.DCOM1.AppServer.GrabaTransaccion;
      Except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
      End;
   End;
End;

Procedure TFPlnCta.dblcModuloExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CODIGO=' + quotedstr(dblcModulo.text);
   dbeModuloAjusDC.text := DMCNT.DisplayDescrip('PrvTGE', 'TGE600', 'DESCRIP', xWhere, 'DESCRIP');
End;

Function TFPlnCta.ValNivelSup: boolean;
Var
   xSql: String;
Begin
   Result := True;
   xSql := 'SELECT COUNT(*) TOTAL FROM TGE202 WHERE CUENTAID LIKE ' +
      quotedstr(trim(dblcdCuenta.text) + '%');
   DMCNT.cdsCuenta5.close;
   DMCNT.cdsCuenta5.DataRequest(xSql);
   DMCNT.cdsCuenta5.open;
   If DMCNT.cdsCuenta5.FieldByName('TOTAL').AsFloat > 1 Then
      Result := False;
End;

Procedure TFPlnCta.cbCiasClick(Sender: TObject);
Var
   xz: word;
   sSQL: String;
Begin
   If clbCopiar.Items.Count > 0 Then
      For xZ := 0 To clbCopiar.Items.Count - 1 Do
      Begin
         If cbCias.Checked Then
         Begin
            If DMCNT.wModo = 'A' Then
            Begin
               clbCopiar.Checked[xZ] := cbCias.Checked;
            End
            Else
            Begin
               clbCopiar.Checked[xZ] := cbCias.Checked;
            End;
         End
         Else
         Begin
            clbCopiar.Checked[xZ] := cbCias.Checked;
         End;
      End;
End;

Function TFPlnCta.ValNivelAntBat(xxCia, xxCta: String): boolean;
Var
   xDigitos: Integer;
   xWhere, xCuenta: String;
Begin
   // verifica que los niveles anteriores hayan sido registrados
   Result := True;
   DMCNT.cdsNivel.First;
   While (Not DMCNT.cdsNivel.Eof) And (DMCNT.cdsNivel.FieldByName('NIVEL').AsString < xNivel1) Do
   Begin
      xDigitos := DMCNT.cdsNivel.FieldByName('DIGITOS').AsInteger;
      xCuenta := copy(xxCta, 1, xDigitos);

      xWhere := 'CIAID =' + quotedStr(xxCia) + ' and CUENTAID=' + quotedStr(xCuenta);
      If length(DMCNT.DisplayDescrip('PrvTGE', 'TGE202', 'CUENTAID', xWhere, 'CUENTAID')) = 0 Then
      Begin
         ShowMessage('No hay Cuenta en Nivel' + DMCNT.cdsNivel.FieldByName('NIVEL').AsString + ' para la Compañía ' + xxCta);
         Result := false;
         exit;
      End;
      DMCNT.cdsNivel.Next;
   End;
End;

Procedure TFPlnCta.ActNivelAntBat(xxCia, xxCta: String);
Var
   xSql, xCuenta1, xNivel2: String;
   xNive: Integer;
Begin
   xNive := 0;
   xNivel2 := DMCNT.StrZero(inttoStr((strtoInt(xNivel1)) - 1), length(xNivel1));
   DMCNT.cdsNivel.SetKey;
   DMCNT.cdsNivel.FieldByName('NIVEL').AsString := xNivel2;
   If DMCNT.cdsNivel.GotoKey Then
      xNive := DMCNT.cdsNivel.FieldByName('DIGITOS').AsInteger;

   xCuenta1 := copy(xxCta, 1, xNive);

   If xCuenta1 <> '' Then
   Begin
      xSQL := 'Update TGE202 set CTA_DET=''N'', CTA_MOV=''N'' '
         + 'WHERE CIAID=''' + xxCia + ''' and  '
         + 'CUENTAID=''' + xCuenta1 + '''';
      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      Try
         DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         DMCNT.DCOM1.AppServer.GrabaTransaccion;
      Except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
      End;
   End;
End;

Procedure TFPlnCta.clbCopiarClickCheck(Sender: TObject);
Var
   sSQL: String;
Begin
   If clbCopiar.Items.Count > 0 Then
   Begin
      If clbCopiar.Checked[clbCopiar.ItemIndex] Then
      Begin
         If DMCNT.wModo = 'A' Then
         Begin
            clbCopiar.Checked[clbCopiar.ItemIndex] := True;
         End
         Else
         Begin

         End;
      End
      Else
      Begin
         clbCopiar.Checked[clbCopiar.ItemIndex] := False;
      End;
   End;
End;

Procedure TFPlnCta.dbcbSeTomaAjusteDCClick(Sender: TObject);
Begin
   lblModuloparaAjusteDC.Enabled := dbcbSeTomaAjusteDC.Checked;
   dblcModulo.Enabled := dbcbSeTomaAjusteDC.Checked;
   dbeModuloAjusDC.Enabled := dbcbSeTomaAjusteDC.Checked;
End;

Procedure TFPlnCta.FormCreate(Sender: TObject);
Begin

   CargaDataSource;

End;

Procedure TFPlnCta.CargaDataSource;
Begin
   dblcCia.LookupTable := DMCNT.cdsCia;
   dblcdCuenta.DataSource := DMCNT.dsCuenta;
   dblcdCuenta.LookupTable := DMCNT.cdsCuentaLookUp;
   dbeDescripcion.DataSource := DMCNT.dsCuenta;
   dbeCtaAbr.DataSource := DMCNT.dsCuenta;
   dblcNivel1.DataSource := DMCNT.dsCuenta;
   dblcNivel1.LookupTable := DMCNT.cdsNivel;
   dbeSigno.DataSource := DMCNT.dsNivel;
   dbeDigitos.DataSource := DMCNT.dsNivel;
   dblcTipCta.DataSource := DMCNT.dsCuenta;
   dblcTipCta.LookupTable := DMCNT.cdsTipCta;
   dbeTipCta.DataSource := DMCNT.dsTipCta;
   dblcdContra.LookupTable := DMCNT.cdsCuentaLookUp;
   dblcdConsoli.LookupTable := DMCNT.cdsComboCtaConsol;
   dblcdCtaAutDebe.LookupTable := DMCNT.cdsCtaDestino;
   dblcdCtaAutHaber.LookupTable := DMCNT.cdsCtaDestino;
   dblcdCtaREI.LookupTable := DMCNT.cdsCuentaLookUp;
End;

Procedure TFPlnCta.dblcdConsoliEnter(Sender: TObject);
Var
   xSQL: String;
Begin
   If Not DMCNT.cdsComboCtaConsol.Active Then
   Begin
      xSQL := 'Select CUENTAID,CTADES,CIAID from TGE202 '
         + 'where CIAID=''01'' and CTA_DET=' + quotedstr('S');
      DMCNT.cdsComboCtaConsol.close;
      DMCNT.cdsComboCtaConsol.DataRequest(xSQL);
      DMCNT.cdsComboCtaConsol.Open;
   End;
End;

End.

