// Inicio Uso Estándares: 01/08/2011
// Unidad               : CNT700B
// Formulario           : TfNueSeguroPrincipal
// Fecha de Creación    : 23/06/2017
// Autor                : Jesús Castillo Pampas
// Objetivo             : Creación de formulario para dar mantenimiento a los Seguros
// Actualizaciones      :
//HPC_201703_CNT        : Creación del Formulario
// HPC_201801_CNT       : Ajustes para mostrar las cuentas de Gastos con prefijo 382 y 951

//Inicio HPC_201703_CNT
//Creación de formulario para dar mantenimiento a los Seguros

Unit CNT700B;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, fcButton, fcImgBtn,
   fcShapeBtn, ExtCtrls, wwdbdatetimepicker, Db, ppBands, ppVar, ppPrnabl,
   ppClass, ppCtrls, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
   ppDBPipe, Buttons, Wwdbdlg, Mask, wwdbedit, wwdblook, Wwdotdot, Wwdbcomb, jpeg;

Type
   TfNueSeguroPrincipal = Class(TForm)
      pnlPrincipal: TPanel;
      Label9: TLabel;
      Label11: TLabel;
      Label16: TLabel;
      btnCancela: TfcShapeBtn;
      dblcCia: TwwDBLookupCombo;
      dbeCia: TwwDBEdit;
      dblcConcepto: TwwDBLookupComboDlg;
      dbeConcepto: TwwDBEdit;
      dblcCtaGasto: TwwDBLookupComboDlg;
      dbeCtaGasto: TwwDBEdit;
      dbgSeguroDet: TwwDBGrid;
      dbgSeguroDetIButton: TwwIButton;
      btnAceptar: TBitBtn;
      rgMoneda: TRadioGroup;
      pnlSeguroDet: TPanel;
      Label3: TLabel;
      lblTitulo1: TLabel;
      Label1: TLabel;
      bbtnOk1: TBitBtn;
      bbtnCanc1: TBitBtn;
      dblcdCCosto: TwwDBLookupComboDlg;
      edtCCosto: TEdit;
      edtValor: TEdit;
      btnSalir: TBitBtn;
      Procedure btnCancelaClick(Sender: TObject);
      Procedure ValidaNumerosKeyPress(Sender: TObject; Var Key: Char);
      Procedure ValidaLetrasNumerosKeyPress(Sender: TObject; Var Key: Char);
      Procedure ValidaLetrasKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcConceptoEnter(Sender: TObject);
      Procedure dblcConceptoExit(Sender: TObject);
      Procedure dblcCtaGastoEnter(Sender: TObject);
      Procedure dblcCtaGastoExit(Sender: TObject);
      Procedure dbgSeguroDetIButtonClick(Sender: TObject);
      Procedure dblcdCCostoExit(Sender: TObject);
      Procedure btnAceptarClick(Sender: TObject);
      Procedure bbtnOk1Click(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure dbgSeguroDetDblClick(Sender: TObject);
      Procedure btnSalirClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure edtValorKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnCanc1Click(Sender: TObject);
      Procedure dbgSeguroDetKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

   Private
    { Private declarations }
      Procedure AsignaLookup;
   Public
    { Public declarations }
      xoperacion: String;
      xsegid, xciaid, xcptoid, xcptodes, xctagasid, xctagasdes: String;
      xccosto: String;
   End;

Var
   fNueSeguroPrincipal: TfNueSeguroPrincipal;
   xSQL: String;
   
Implementation

Uses CNT700A, CNTDM;

{$R *.dfm}

Procedure TfNueSeguroPrincipal.btnCancelaClick(Sender: TObject);
Begin
   fSeguros.bbtnBuscarClick(Self);
   Close;
End;

Procedure TfNueSeguroPrincipal.ValidaNumerosKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Not (key In ['0'..'9', '.', #8]) Then
   Begin
      key := #0;
      showmessage('Por favor introduzca números')
   End
End;

Procedure TfNueSeguroPrincipal.ValidaLetrasNumerosKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If Not (key In ['A'..'Z', 'a'..'z', ' ', '0'..'9', '.', #8]) Then
   Begin
      key := #0;
      showmessage('Caracter no permitido')
   End
End;

Procedure TfNueSeguroPrincipal.ValidaLetrasKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Not (key In ['A'..'Z', 'a'..'z', ' ', '0'..'9']) Then
   Begin
      key := #0;
      showmessage('Caracter no permitido')
   End
End;

Procedure TfNueSeguroPrincipal.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TfNueSeguroPrincipal.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;

   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TfNueSeguroPrincipal.dblcCiaExit(Sender: TObject);
Begin

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
   xSQL := 'Select CIAID, CUENTAID, CTADES, CTAABR, CTANIV, CTA_DET,'
      + '          CTA_AUT1, CTAAUT1, CTA_AUT2, CTAAUT2, CTA_CIER, CTA_PLAZ, CTA_MOV, CTA_AUX, CTA_DOC, CTA_CCOS,'
      + '          CTA_ME, CTA_DEST, FLGVAR, CTA_DIFC, CTACONTRA, CTA_SECU, CTA_AJUSTEREI, CTAMODDIFC, CTA_DIFGP,'
      + '          CTA_TIPO, TIPCTAID, USUARIO, HREG, FREG, CTA_APERT, CTA_TIPOREI, CTA_NOMONET, CTA_SALAJREI, CTA_CONSOL,'
      + '          CTA_PRES, CTA_SUMGA, REGSOLOME, CTA_TRANSAPE, CTAACT '
      + '     from TGE202 '
      + '    where CIAID=' + QuotedStr(dblcCia.Text);
   DMCNT.cdsCuentaLookUp.Close;
   DMCNT.cdsCuentaLookUp.DataRequest(xSQL);
   DMCNT.cdsCuentaLookUp.Open;

   xSQL := 'Select CODIGO CIAID, CIADES '
      + '     from TGE004, TGE101 '
      + '    where USERID=' + quotedstr(DMCNT.wUsuario)
      + '      and MODULOID = ' + quotedstr(DMCNT.wModulo)
      + '      and NTABLA=' + quotedstr('TGE101')
      + '      and CODIGO <>' + quotedstr(dblcCia.text)
      + '      and TGE101.CIAID(+) = CODIGO';
   DMCNT.cdsQry.close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;

   If DMCNT.cdsQry.RecordCount <= 0 Then
   Begin
      xSQL := 'Select CIAID, CIADES '
         + '     from TGE101 '
         + '    where CIAID <>' + quotedstr(dblcCia.text);
      DMCNT.cdsQry.close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
   End;

   DMCNT.cdsCia.First;

   xSQL := 'SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 WHERE CCOSACT=''S'' AND CCOSCIAS LIKE ''%'+dblcCia.Text+'%'' ';
   DMCNT.cdsCCosto.Close;
   DMCNT.cdsCCosto.DataRequest(xSQL);
   DMCNT.cdsCCosto.Open;
   dblcdCCosto.LookupTable := DMCNT.cdsCCosto;

End;

Procedure TfNueSeguroPrincipal.dblcConceptoEnter(Sender: TObject);
Begin
   DMCNT.cdsQry10.IndexFieldNames := 'CPTOID';
End;

Procedure TfNueSeguroPrincipal.dblcConceptoExit(Sender: TObject);
Begin
   DMCNT.cdsQry10.IndexFieldNames := 'CPTOID';
   DMCNT.cdsQry10.SetKey;
   DMCNT.cdsQry10.FieldbyName('CPTOID').AsString := dblcConcepto.Text;
   If Not DMCNT.cdsQry10.GotoKey Then
   Begin
      ShowMessage('Falta Código de Concepto');
      dblcConcepto.SetFocus;
      exit;
   End;
   dbeConcepto.Text := DMCNT.cdsQry10.FieldByName('CPTODES').AsString;
End;

Procedure TfNueSeguroPrincipal.dblcCtaGastoEnter(Sender: TObject);
Begin
   DMCNT.cdsQry3.IndexFieldNames := 'CPTOID';
End;

Procedure TfNueSeguroPrincipal.dblcCtaGastoExit(Sender: TObject);
Begin
   DMCNT.cdsQry3.IndexFieldNames := 'CPTOID';
   DMCNT.cdsQry3.SetKey;
   DMCNT.cdsQry3.FieldbyName('CPTOID').AsString := dblcCtaGasto.Text;
   If Not DMCNT.cdsQry3.GotoKey Then
   Begin
      ShowMessage('Falta Cuenta de Gasto');
      dblcCtaGasto.SetFocus;
      exit;
   End;

   dbeCtaGasto.Text := DMCNT.cdsQry3.FieldByName('CPTODES').AsString;
   xSQL := 'Select CTA_CCOS '
      + '     from TGE202 '
      + '    where CUENTAID=' + quotedstr(dblcCtaGasto.Text)
      + '      and CIAID=' + quotedstr(dblcCia.Text);
   DMCNT.cdsQry19.close;
   DMCNT.cdsQry19.DataRequest(xSQL);
   DMCNT.cdsQry19.Open;
   If (DMCNT.cdsQry19.FieldbyName('CTA_CCOS').AsString <> 'S') Then
   Begin
      ShowMessage('La Cuenta de Gasto seleccionado no permite ingresar Centros de Costo');
      dblcCtaGasto.SetFocus;
      exit;
   End;
End;

Procedure TfNueSeguroPrincipal.dbgSeguroDetIButtonClick(Sender: TObject);
Begin
   dbgSeguroDet.Enabled := False;
   pnlSeguroDet.Visible := True;
   pnlSeguroDet.Enabled := True;
   dblcdCCosto.Text := '';
   edtCCosto.Text := '';
   edtValor.Text := '';
   pnlSeguroDet.SetFocus;
   xoperacion := '';
   pnlPrincipal.Enabled := False;
End;

Procedure TfNueSeguroPrincipal.dblcdCCostoExit(Sender: TObject);
Begin
   DMCNT.cdsCCosto.IndexFieldNames := 'CCOSID';
   DMCNT.cdsCCosto.SetKey;
   DMCNT.cdsCCosto.FieldbyName('CCOSID').AsString := dblcdCCosto.Text;
   If Not DMCNT.cdsCCosto.GotoKey Then
   Begin
      ShowMessage('Falta Centro de Costo');
      dblcdCCosto.SetFocus;
      exit;
   End;

   edtCCosto.Text := DMCNT.cdsCCosto.FieldByName('CCOSDES').AsString;
End;

Procedure TfNueSeguroPrincipal.btnAceptarClick(Sender: TObject);
Var
   xmoneda: String;
Begin
   Screen.Cursor := crHourGlass;
   If length(dblcCia.Text) = 0 Then
   Begin
      dblcCia.SetFocus;
      ShowMessage('Debe Ingresar la Compañía');
      Screen.Cursor := crDefault;
      exit;
   End;
   If length(dblcConcepto.Text) = 0 Then
   Begin
      dblcConcepto.SetFocus;
      ShowMessage('Debe Ingresar un Concepto');
      Screen.Cursor := crDefault;
      exit;
   End;
   If length(dblcCtaGasto.Text) = 0 Then
   Begin
      dblcCtaGasto.SetFocus;
      ShowMessage('Debe Ingresar un Cuenta de Gasto');
      Screen.Cursor := crDefault;
      exit;
   End;

   If (xoperacion <> 'U') Then
   Begin
      xSQL := 'Select nvl(max(SEGID),0) SEGID '
         + '     from DB2ADMIN.CNT_DEV_SEG_CAB';
      Try
         DMCNT.cdsQry4.close;
         DMCNT.cdsQry4.DataRequest(xSQL);
         DMCNT.cdsQry4.Open;
      Except
         ShowMessage('No se pudo obtener el código de seguro');
         Screen.Cursor := crDefault;
         exit;
      End;
      xsegid := FormatFloat('000000', (DMCNT.cdsQry4.FieldByName('segid').AsInteger + 1));
   End;

   If (rgMoneda.itemindex = 0) Then
   Begin
      xmoneda := 'N';
   End
   Else
   Begin
      xmoneda := 'E';
   End;

   If(copy(dblcConcepto.Text, 1, 3) = '166')Then
   Begin
         xSQL := 'Select SEGID '
            + '     from DB2ADMIN.CNT_DEV_SEG_CAB '
            + '    where CIAID=' + quotedstr(dblcCia.Text)
            + '      and CPTOID=' + quotedstr(dblcConcepto.Text)
            + '      and CTAGASID=' + quotedstr(dblcCtaGasto.Text);

   End
   Else
   Begin
          xSQL := 'Select SEGID '
            + '     from DB2ADMIN.CNT_DEV_SEG_CAB '
            + '    where CIAID=' + quotedstr(dblcCia.Text)
            + '      and CPTOID=' + quotedstr(dblcConcepto.Text);
   End;

   Try
      DMCNT.cdsQry.close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
      If (DMCNT.cdsQry.RecordCount > 0) Then
      Begin
         ShowMessage('Los datos corresponden a un Seguro ya existente');
         Screen.Cursor := crDefault;
         exit;
      End;
   Except
      ShowMessage('Error al verificar si el seguro ya existe');
      Screen.Cursor := crDefault;
      exit;
   End;

   If (xoperacion <> 'U') Then
   Begin
      xSQL := 'Insert into DB2ADMIN.CNT_DEV_SEG_CAB(SEGID,CIAID,CIADES,CPTOID,CPTODES,CTAGASID,CTAGASDES,TIPMON,USUREG,FECREG) '
         + '   Values ( '
         +             quotedstr(xsegid) + ','
         +             quotedstr(dblcCia.Text) + ','
         +             quotedstr(dbeCia.Text) + ','
         +             quotedstr(dblcConcepto.Text) + ','
         +             quotedstr(dbeConcepto.Text) + ','
         +             quotedstr(dblcCtaGasto.Text) + ','
         +             quotedstr(dbeCtaGasto.Text) + ','
         +             quotedstr(xmoneda) + ','
         +             quotedstr(DMCNT.wUsuario) + ','
         + '           SYSDATE)';
   End
   Else
   Begin
      xSQL := 'Update DB2ADMIN.CNT_DEV_SEG_CAB '
         + '      set CIAID =' + quotedstr(dblcCia.Text) + ','
         + '          CIADES=' + quotedstr(dbeCia.Text) + ','
         + '          CPTOID=' + quotedstr(dblcConcepto.Text) + ','
         + '          CPTODES=' + quotedstr(dbeConcepto.Text) + ','
         + '          CTAGASID=' + quotedstr(dblcCtaGasto.Text) + ','
         + '          CTAGASDES=' + quotedstr(dbeCtaGasto.Text) + ','
         + '          TIPMON=' + quotedstr(xmoneda) + ','
         + '          USUMOD=' + quotedstr(DMCNT.wUsuario) + ','
         + '          FECMOD= SYSDATE '
         + '    where SEGID=' + quotedstr(DMCNT.cdsQry9.fieldbyname('SEGID').AsString);
   End;

   Try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
   Except
      ShowMessage('No se pudo Ingresar cabecera del seguro');
      Screen.Cursor := crDefault;
      exit;
   End;

   xSQL := 'select C.SEGID,D.CCOSID,D.CCOSDES,D.VALOR '
      + '     from CNT_DEV_SEG_CAB c, CNT_DEV_SEG_det d '
      + '    where C.SEGID = D.SEGID '
      + '      and C.CIAID=' + quotedstr(dblcCia.Text)
      + '      and C.SEGID=' + quotedstr(xSegid);
   DMCNT.cdsQry9.close;
   DMCNT.cdsQry9.DataRequest(xSQL);
   DMCNT.cdsQry9.Open;

   dbgSeguroDetIButton.Visible := True;

   Screen.Cursor := crDefault;

End;

Procedure TfNueSeguroPrincipal.AsignaLookup;
Begin
   xSQL := 'Select C.SEGID,D.CCOSID,D.CCOSDES,D.VALOR '
      + '     from CNT_DEV_SEG_CAB C, CNT_DEV_SEG_DET D '
      + '    where C.SEGID = D.SEGID '
      + '      and C.CIAID=' + quotedstr(dblcCia.Text);
   Try
      DMCNT.cdsQry9.close;
      DMCNT.cdsQry9.DataRequest(xSQL);
      DMCNT.cdsQry9.Open;
   Except
      ShowMessage('Error al Llenar la grilla de datos');
      Screen.Cursor := crDefault;
      exit;
   End;
   dbgSeguroDet.DataSource := DMCNT.dsQry5;

   dbgSeguroDet.Selected.Clear;
   dbgSeguroDet.Selected.Add('CCOSID'#9'10'#9'Código'#9'F');
   dbgSeguroDet.Selected.Add('CCOSDES'#9'40'#9'Descripción'#9'F');
   dbgSeguroDet.Selected.Add('VALOR'#9'10'#9'Valor'#9'F');

End;

Procedure TfNueSeguroPrincipal.bbtnOk1Click(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   If length(dblcdCCosto.Text) = 0 Then
   Begin
      dblcCia.SetFocus;
      ShowMessage('Debe Ingresar el Centro de Costo');
      Screen.Cursor := crDefault;
      exit;
   End;
   If length(edtValor.Text) = 0 Then
   Begin
      edtValor.Text := '0';
   End;

   If (xoperacion <> 'U') Then
   Begin
      xSQL := 'Insert into DB2ADMIN.CNT_DEV_SEG_DET(SEGID,CCOSID,CCOSDES,VALOR,USUREG,FECREG) '
         + '   Values ( '
         +             quotedstr(xsegid) + ','
         +             quotedstr(dblcdCCosto.Text) + ','
         +             quotedstr(edtCCosto.Text) + ','
         +             quotedstr(edtValor.Text) + ','
         +             quotedstr(DMCNT.wUsuario) + ','
         + '           SYSDATE)';
      xoperacion := 'U';
   End
   Else
   Begin
      xSQL := 'Update DB2ADMIN.CNT_DEV_SEG_DET '
         + '      Set CCOSID =' + quotedstr(dblcdCCosto.Text) + ','
         + '          CCOSDES=' + quotedstr(edtCCosto.Text) + ','
         + '          VALOR=' + quotedstr(edtValor.Text) + ','
         + '          USUMOD=' + quotedstr(DMCNT.wUsuario) + ','
         + '          FECMOD= SYSDATE '
         + '    where SEGID=' + quotedstr(DMCNT.cdsQry9.fieldbyname('SEGID').AsString)
         + '      and CCOSID=' + quotedstr(xccosto);
   End;
   Try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
   Except
      ShowMessage('No se pudo Ingresar detalle del seguro');
      Screen.Cursor := crDefault;
      exit;
   End;
   Screen.Cursor := crDefault;
   pnlSeguroDet.Visible := False;
   dbgSeguroDet.Enabled := True;
   dbgSeguroDetIButton.Enabled := True;

      xSQL := 'Select C.SEGID,D.CCOSID,D.CCOSDES,D.VALOR '
         + '     from CNT_DEV_SEG_CAB C, CNT_DEV_SEG_DET D '
         + '    where C.SEGID = D.SEGID '
         + '      and C.CIAID=' + quotedstr(dblcCia.Text)
         + '      and D.SEGID=' + quotedstr(xsegid);

   Try
      DMCNT.cdsQry9.close;
      DMCNT.cdsQry9.DataRequest(xSQL);
      DMCNT.cdsQry9.Open;
   Except
      ShowMessage('Error al Llenar la grilla de datos');
      Screen.Cursor := crDefault;
      exit;
   End;
   dbgSeguroDet.DataSource := DMCNT.dsQry9;
   pnlPrincipal.Enabled := true;
End;

Procedure TfNueSeguroPrincipal.FormActivate(Sender: TObject);
Begin
   If (xoperacion <> 'U') Then
   Begin
      dblcCia.LookupTable := DMCNT.cdsCia;
      If length(xciaid) > 0 Then
      Begin
         dblcCia.Text := xciaid;
         dblcCiaExit(self);
         dblcCia.Enabled := false;
      End
      Else
      Begin
         dblcCia.Enabled := true;
      End;
      xSQL := 'SELECT CPTOID,CPTODES FROM CXP201 WHERE 1=1 ORDER BY CPTOID';
      DMCNT.cdsQry10.close;
      DMCNT.cdsQry10.DataRequest(xSQL);
      DMCNT.cdsQry10.Open;
      dblcConcepto.LookupTable := DMCNT.cdsQry10;
// Inicio HPC_201801_CNT
// Ajustes para mostrar las cuentas de Gastos con prefijo 382 y 951
      xSQL := 'SELECT CPTOID,CPTODES FROM CXP201 WHERE 1=1 AND CPTOID LIKE ''382%'' OR CPTOID LIKE ''951%'' ORDER BY CPTOID';
// Fin HPC_201801_CNT
      DMCNT.cdsQry3.close;
      DMCNT.cdsQry3.DataRequest(xSQL);
      DMCNT.cdsQry3.Open;
      dblcCtaGasto.LookupTable := DMCNT.cdsQry3;
      dbgSeguroDetIButton.Visible := False;
      AsignaLookup;
   End
   Else
   Begin
      dblcCia.LookupTable := DMCNT.cdsCia;
      xSQL := 'SELECT CPTOID,CPTODES FROM CXP201 WHERE 1=1 ORDER BY CPTOID';
      DMCNT.cdsQry10.close;
      DMCNT.cdsQry10.DataRequest(xSQL);
      DMCNT.cdsQry10.Open;
      dblcConcepto.LookupTable := DMCNT.cdsQry10;
// Inicio HPC_201801_CNT										   
// Ajustes para mostrar las cuentas de Gastos con prefijo 382 y 951
      xSQL := 'SELECT CPTOID,CPTODES FROM CXP201 WHERE 1=1 AND CPTOID LIKE ''382%'' OR CPTOID LIKE ''951%'' ORDER BY CPTOID';
// Fin HPC_201801_CNT
      DMCNT.cdsQry3.close;
      DMCNT.cdsQry3.DataRequest(xSQL);
      DMCNT.cdsQry3.Open;
      dblcCtaGasto.LookupTable := DMCNT.cdsQry3;

      xSQL := 'SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 WHERE CCOSACT=''S'' AND CCOSCIAS LIKE ''%'+xciaid+'%'' ';
      DMCNT.cdsCCosto.Close;
      DMCNT.cdsCCosto.DataRequest(xSQL);
      DMCNT.cdsCCosto.Open;
      dblcdCCosto.LookupTable := DMCNT.cdsCCosto;
      dbgSeguroDetIButton.Visible := False;
      dbgSeguroDetIButton.Visible := True;

      dblcCia.Text := xciaid;
      dblcCia.Enabled := false;
      dblcConcepto.Text := xcptoid;
      dbeConcepto.Text := xcptodes;
      dblcCtaGasto.Text := xctagasid;
      dbeCtaGasto.Text := xctagasdes;

      xSQL := 'select c.segid,d.ccosid,d.ccosdes,d.valor from CNT_DEV_SEG_CAB c, CNT_DEV_SEG_det d where c.segid = d.segid '
         + ' and c.ciaid=' + quotedstr(dblcCia.Text) + ' and d.segid=' + quotedstr(xsegid);
      Try
         DMCNT.cdsQry9.close;
         DMCNT.cdsQry9.DataRequest(xSQL);
         DMCNT.cdsQry9.Open;
      Except
         ShowMessage('Error al Llenar la grilla de datos');
         Screen.Cursor := crDefault;
         exit;
      End;
   End;

End;

Procedure TfNueSeguroPrincipal.dbgSeguroDetDblClick(Sender: TObject);
Begin
   If (DMCNT.cdsQry9.RecordCount > 0) Then
   Begin
      xoperacion := 'U';
      pnlSeguroDet.Visible := True;
      pnlSeguroDet.Enabled := True;
      dblcdCCosto.Text := DMCNT.cdsQry9.fieldbyname('CCOSID').AsString;
      edtCCosto.Text := DMCNT.cdsQry9.fieldbyname('CCOSDES').AsString;
      edtValor.Text := DMCNT.cdsQry9.fieldbyname('VALOR').AsString;

      xccosto := DMCNT.cdsQry9.fieldbyname('CCOSID').AsString;
   End;
End;

Procedure TfNueSeguroPrincipal.btnSalirClick(Sender: TObject);
Begin
   pnlSeguroDet.Visible := False;
   dbgSeguroDet.Enabled := True;

   pnlPrincipal.Enabled := true;
End;

Procedure TfNueSeguroPrincipal.FormCreate(Sender: TObject);
Begin
   dbgSeguroDet.Selected.Clear;
   dbgSeguroDet.Selected.Add('CCOSID'#9'10'#9'Código'#9'F');
   dbgSeguroDet.Selected.Add('CCOSDES'#9'40'#9'Descripción'#9'F');
   dbgSeguroDet.Selected.Add('VALOR'#9'10'#9'Valor'#9'F');
   dbgSeguroDet.DataSource := DMCNT.dsQry9;
End;

Procedure TfNueSeguroPrincipal.edtValorKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If Not (key In ['0'..'9', '.', #8]) Then
   Begin
      key := #0;
      showmessage('Por favor introduzca números')
   End
End;

Procedure TfNueSeguroPrincipal.bbtnCanc1Click(Sender: TObject);
Begin
   btnSalirClick(Sender);
End;

Procedure TfNueSeguroPrincipal.dbgSeguroDetKeyDown(Sender: TObject;
   Var Key: Word; Shift: TShiftState);
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      If (DMCNT.cdsQry9.RecordCount = 0) Then Exit;

      If MessageDlg('¿Desea eliminar el Centro de Costo seleccionado?  ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Begin
         exit;
      End;

      Screen.Cursor := crHourGlass;
      If (xoperacion <> 'U') Then
      Begin
         ShowMessage('Primero debe asociar un centro de costo');
         Screen.Cursor := crDefault;
         exit;
      End;
      xsegid := DMCNT.cdsQry9.fieldbyname('SEGID').AsString;
      xSQL := 'Delete from DB2ADMIN.CNT_DEV_SEG_DET where segid=' + quotedstr(xsegid) + ' and ccosid=' + quotedstr(DMCNT.cdsQry9.fieldbyname('CCOSID').AsString);
      Try
         DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      Except
         ShowMessage('No se pudo Eliminar detalle del seguro');
         Screen.Cursor := crDefault;
         exit;
      End;
      Screen.Cursor := crDefault;
      pnlSeguroDet.Visible := False;
      dbgSeguroDet.Enabled := True;
      dbgSeguroDetIButton.Enabled := True;

      xSQL := 'select C.SEGID,D.CCOSID,D.CCOSDES,D.VALOR '
         + '     from CNT_DEV_SEG_CAB c, CNT_DEV_SEG_det d '
         + '    where c.segid = d.segid '
         + '      and c.ciaid=' + quotedstr(dblcCia.Text) + ' and d.segid=' + quotedstr(DMCNT.cdsQry9.fieldbyname('SEGID').AsString);
      Try
         DMCNT.cdsQry9.close;
         DMCNT.cdsQry9.DataRequest(xSQL);
         DMCNT.cdsQry9.Open;
      Except
         ShowMessage('Error al Llenar la grilla de datos');
         Screen.Cursor := crDefault;
         exit;
      End;
      dbgSeguroDet.DataSource := DMCNT.dsQry9;
      pnlPrincipal.Enabled := true;
   End;
End;

procedure TfNueSeguroPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMCNT.cdsQry9.Filter := '';
   DMCNT.cdsQry9.Filtered := False;
   DMCNT.cdsQry9.IndexFieldNames:='';
   DMCNT.cdsQry9.Close;

   DMCNT.cdsQry10.Filter := '';
   DMCNT.cdsQry10.Filtered := False;
   DMCNT.cdsQry10.IndexFieldNames:='';
   DMCNT.cdsQry10.Close;

   DMCNT.cdsQry3.Filter := '';
   DMCNT.cdsQry3.Filtered := False;
   DMCNT.cdsQry3.IndexFieldNames:='';
   DMCNT.cdsQry3.Close;

   DMCNT.cdsQry4.Filter := '';
   DMCNT.cdsQry4.Filtered := False;
   DMCNT.cdsQry4.IndexFieldNames:='';
   DMCNT.cdsQry4.Close;

   DMCNT.cdsQry19.Filter := '';
   DMCNT.cdsQry19.Filtered := False;
   DMCNT.cdsQry19.IndexFieldNames:='';
   DMCNT.cdsQry19.Close;
end;

End.
//Fin HPC_201703_CNT

