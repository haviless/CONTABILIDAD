Unit CNT240;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, Wwdbdlg, wwdblook,
   ExtCtrls, DB;

Type
   TFHomogNumDocProv = Class(TForm)
      pnlDatosAuxiliar: TPanel;
      lblCia: TLabel;
      lblAuxiliar: TLabel;
      lblClAux: TLabel;
      lblRazonSoc: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      dblcClAux: TwwDBLookupCombo;
      edtAuxiliar: TEdit;
      bbtnBuscaAsientos: TBitBtn;
      lblCuentaContable: TLabel;
      pnlAsientos: TPanel;
      dbgAsientos: TwwDBGrid;
      edtSerie: TEdit;
      lblSerie: TLabel;
      edtNroDoc: TEdit;
      lblNroDoc: TLabel;
      bbtnHomogenizar: TBitBtn;
      dblcdCuenta: TwwDBLookupComboDlg;
      edtCuenta: TEdit;
      dblcdAuxiliar: TwwDBLookupComboDlg;
      bbtnIniciaDatos: TBitBtn;
      bbtnSalir: TBitBtn;
      Procedure FormCreate(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcClAuxExit(Sender: TObject);
      Procedure dblcdAuxiliarExit(Sender: TObject);
      Procedure dblcdCuentaExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnBuscaAsientosClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnIniciaDatosClick(Sender: TObject);
      Procedure bbtnHomogenizarClick(Sender: TObject);
      Procedure bbtnSalirClick(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FHomogNumDocProv: TFHomogNumDocProv;
   xSQL: String;

Implementation

Uses CNTDM;

{$R *.dfm}

Procedure TFHomogNumDocProv.FormCreate(Sender: TObject);
Begin
   dblcCia.LookupTable := DMCNT.cdsCia;
   dblcCia.LookupField := 'CIAID';
   dblcCia.Selected.Clear;
   dblcCia.Selected.Add('CIAID'#9'5'#9'Cía'#9'F');
   dblcCia.Selected.Add('CIADES'#9'15'#9'Compañía'#9'F');

   dblcClAux.LookupTable := DMCNT.cdsClAux;
   dblcClAux.LookupField := 'CLAUXID';
   dblcClAux.Selected.Clear;
   dblcClAux.Selected.Add('CLAUXID'#9'5'#9'Cod'#9'F');
   dblcClAux.Selected.Add('CLAUXDES'#9'15'#9'Clase de Auxiliar'#9'F');

   xSQL := 'Select CIAID, CLAUXID, AUXID, CUENTAID from CNT311 where 1<>1';
   DMCNT.cdsQry4.Close;
   DMCNT.cdsQry4.DataRequest(xSQL);
   DMCNT.cdsQry4.Open;
   dblcCia.DataField := 'CIAID';
   dblcCia.DataSource := DMCNT.dsQry4;
   dblcClAux.DataField := 'CLAUXID';
   dblcClAux.DataSource := DMCNT.dsQry4;
   dblcdAuxiliar.DataField := 'AUXID';
   dblcdAuxiliar.DataSource := DMCNT.dsQry4;
   dblcdCuenta.DataField := 'CUENTAID';
   dblcdCuenta.DataSource := DMCNT.dsQry4;
End;

Procedure TFHomogNumDocProv.dblcCiaExit(Sender: TObject);
Begin
   If bbtnSalir.Focused Then exit;

   edtCia.Text := '';

   If dblcCia.Text <> '' Then edtCia.Text := DMCNT.cdsCia.FieldByName('CIADES').AsString;

   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
      Exit;
   End;

   xSQL := 'Select CUENTAID, CTADES, CTAAUT1, CIAID, CTAABR, CTA_MOV, CTA_AUX, '
      + '          CTA_DOC, CTA_CCOS, CTA_ME, FLGVAR, CTA_DEST, CTA_DET, CTA_DIFC, REGSOLOME '
      + '     from TGE202 '
      + '    where CIAID=' + QuotedStr(dblcCia.text)
      + '      and CTAACT=''S'' ';
   DMCNT.cdsCuenta.DataRequest(xSQL);
   DMCNT.cdsCuenta.Open;
   DMCNT.cdsCuenta.FetchOnDemand := True;
   DMCNT.cdsCuenta.IndexFieldNames := 'CUENTAID';
   dblcdCuenta.LookupTable := DMCNT.cdsCuenta;
   dblcdCuenta.LookupField := 'CUENTAID';
End;

Procedure TFHomogNumDocProv.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFHomogNumDocProv.dblcClAuxExit(Sender: TObject);
Begin
   If bbtnSalir.Focused Then exit;

   If dblcClAux.Text = '' Then
   Begin
      ShowMessage('Indique la Clase de Auxiliar');
      dblcClAux.SetFocus;
      exit;
   End;

   xSQL := 'Select CLAUXID, AUXID, AUXNOMB, ACTIVO, AUXRUC '
      + '     from CNT201 '
      + '    where CLAUXID=' + quotedstr(dblcClAux.Text)
      + '      and ACTIVO=''S'' '
      + '    order by AUXID ';
   DMCNT.cdsQry3.PacketRecords := 50;
   DMCNT.cdsQry3.Close;
   DMCNT.cdsQry3.DataRequest(xSQL);
   DMCNT.cdsQry3.Open;
   dblcdAuxiliar.LookupTable := DMCNT.cdsQry3;
   dblcdAuxiliar.LookupField := 'AUXID';
   dblcdAuxiliar.DataField := 'AUXID';
   dblcdAuxiliar.DataSource := DMCNT.dsQry4;
   DMCNT.cdsQry4.Edit;
   DMCNT.cdsQry4.FieldByName('AUXID').AsString := '';
   DMCNT.cdsQry4.FieldByName('CUENTAID').AsString := '';
   DMCNT.cdsQry4.Post;


   dblcdAuxiliar.Selected.Clear;
   dblcdAuxiliar.Selected.Add('CLAUXID'#9'5'#9'Clase'#9'F');
   dblcdAuxiliar.Selected.Add('AUXID'#9'10'#9'Auxiliar'#9'F');
   dblcdAuxiliar.Selected.Add('AUXRUC'#9'10'#9'RUC'#9'F');
   dblcdAuxiliar.Selected.Add('AUXNOMB'#9'40'#9'Nombre'#9'F');
   dblcdAuxiliar.Clear;
   edtAuxiliar.Clear;

//   If DMCNT.cdsQry3.indexfieldnames <> 'AUXNOMB' Then
//      DMCNT.cdsQry3.indexfieldnames := 'AUXNOMB';
//   dblcdAuxiliar.DropDown;

End;

Procedure TFHomogNumDocProv.dblcdAuxiliarExit(Sender: TObject);
Begin
   If bbtnSalir.Focused Then exit;

   dblcdAuxiliar.Text := DMCNT.cdsQry3.FieldByName('AUXID').AsString;

   If dblcdAuxiliar.Text = '' Then
   Begin
      ShowMessage('Indique el Código de Auxiliar Contable');
      dblcdAuxiliar.SetFocus;
      exit;
   End;
   edtAuxiliar.Text := DMCNT.cdsQry3.FieldByName('AUXNOMB').AsString;
End;

Procedure TFHomogNumDocProv.dblcdCuentaExit(Sender: TObject);
Begin
   If bbtnSalir.Focused Then exit;

   If dblcdCuenta.Text = '' Then
   Begin
      ShowMessage('Ingrese Cuenta Contable');
      dblcdCuenta.SetFocus;
      exit;
   End;

   If DMCNT.cdsCuenta.IndexFieldNames <> 'CUENTAID' Then
      DMCNT.cdsCuenta.IndexFieldNames := 'CUENTAID';
   DMCNT.cdsCuenta.SetKey;
   DMCNT.cdsCuenta.FieldByName('CUENTAID').Asstring := dblcdCuenta.Text;
   If Not DMCNT.cdsCuenta.GotoKey Then
   Begin
      ShowMessage('Error : Cuenta Contable No Existe...');
      dblcdCuenta.SetFocus;
      Exit;
   End;

   edtCuenta.Text := '';
   edtCuenta.Text := DMCNT.cdsCuenta.FieldByName('CTADES').AsString;

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

// verifica que sea Cuenta que requiere Código de Auxiliar
   If DMCNT.cdsCuenta.FieldByName('CTA_AUX').Asstring <> 'S' Then
   Begin
      ShowMessage('Cuenta No es de Movimientos de Auxiliar, Verifique!');
      dblcdCuenta.setfocus;
      exit;
   End;
End;

Procedure TFHomogNumDocProv.FormShow(Sender: TObject);
Begin
   dblcCia.SetFocus;
End;

Procedure TFHomogNumDocProv.bbtnBuscaAsientosClick(Sender: TObject);
Begin
   xSQL := 'Select ''N'' ESCOGE, DOCID, CNTSERIE, CNTNODOC, CNTDH, CNTMTOLOC, CNTMTOEXT, '
      + '       CIAID, CNTANOMM, TDIARID, CNTCOMPROB, CNTREG '
      + '  from CNT301 '
      + ' where CIAID=' + quotedstr(dblcCia.Text)
      + '   and CUENTAID=' + quotedstr(dblcdCuenta.Text)
      + '   and CLAUXID=' + quotedstr(dblcClAux.Text)
      + '   and AUXID=' + quotedstr(dblcdAuxiliar.Text)
      + ' order by DOCID, CNTNODOC';
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   If DMCNT.cdsQry2.recordcount = 0 Then
   Begin
      ShowMessage('No se encontraron Registros para este Auxiliar Contable');
      exit;
   End;

   DMCNT.cdsQry2.First;
   dbgAsientos.DataSource := DMCNT.dsQry2;

   dbgAsientos.Selected.Clear;
   dbgAsientos.Selected.Add('ESCOGE'#9'12'#9'Seleccionar'#9'F');
   dbgAsientos.Selected.Add('DOCID'#9'5'#9'Doc'#9'F');
   dbgAsientos.Selected.Add('CNTSERIE'#9'10'#9'Serie'#9'F');
   dbgAsientos.Selected.Add('CNTNODOC'#9'12'#9'Nro.Doc'#9'F');
   dbgAsientos.Selected.Add('CNTDH'#9'5'#9'Deb/Hab'#9'F');
   dbgAsientos.Selected.Add('CNTMTOLOC'#9'12'#9'Monto MN'#9'F');
   dbgAsientos.Selected.Add('CNTMTOEXT'#9'12'#9'Monto ME'#9'F');
   dbgAsientos.SetControlType('ESCOGE', fctCheckBox, 'S;N');

   (DMCNT.cdsQry2.FieldByName('DOCID') As TStringField).ReadOnly := True;
   (DMCNT.cdsQry2.FieldByName('CNTSERIE') As TStringField).ReadOnly := True;
   (DMCNT.cdsQry2.FieldByName('CNTNODOC') As TStringField).ReadOnly := True;
   (DMCNT.cdsQry2.FieldByName('CNTDH') As TStringField).ReadOnly := True;
   (DMCNT.cdsQry2.FieldByName('CNTMTOLOC') As TNumericField).ReadOnly := True;
   (DMCNT.cdsQry2.FieldByName('CNTMTOEXT') As TNumericField).ReadOnly := True;

   (DMCNT.cdsQry2.FieldByName('CNTMTOLOC') As TNumericField).DisplayFormat := '####,####,##0.00';
   (DMCNT.cdsQry2.FieldByName('CNTMTOEXT') As TNumericField).DisplayFormat := '####,####,##0.00';
   dbgAsientos.ApplySelected;
   edtSerie.Clear;
   edtNroDoc.Clear;
   dbgAsientos.SetFocus;
End;

Procedure TFHomogNumDocProv.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMCNT.cdsQry3.Filtered := False;
   DMCNT.cdsQry3.Filter := '';
   DMCNT.cdsQry2.Close;

   Action := caFree;
End;

Procedure TFHomogNumDocProv.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFHomogNumDocProv.bbtnIniciaDatosClick(Sender: TObject);
Begin
   DMCNT.cdsQry2.DisableControls;
   DMCNT.cdsQry2.First;
   While Not DMCNT.cdsQry2.EOF Do
   Begin
      If DMCNT.cdsQry2.FieldByName('ESCOGE').AsString = 'S' Then
      Begin
         If length(trim(DMCNT.cdsQry2.FieldByName('CNTSERIE').AsString)) > length(trim(edtSerie.Text)) Then
            edtSerie.Text := trim(DMCNT.cdsQry2.FieldByName('CNTSERIE').AsString);
         If length(trim(DMCNT.cdsQry2.FieldByName('CNTNODOC').AsString)) > length(trim(edtNroDoc.Text)) Then
            edtNroDoc.Text := trim(DMCNT.cdsQry2.FieldByName('CNTNODOC').AsString);
      End;
      DMCNT.cdsQry2.Next;
   End;
   DMCNT.cdsQry2.EnableControls;
   DMCNT.cdsQry2.First;
End;

Procedure TFHomogNumDocProv.bbtnHomogenizarClick(Sender: TObject);
Begin
   DMCNT.cdsQry2.DisableControls;
   (DMCNT.cdsQry2.FieldByName('CNTSERIE') As TStringField).ReadOnly := False;
   (DMCNT.cdsQry2.FieldByName('CNTNODOC') As TStringField).ReadOnly := False;
   DMCNT.cdsQry2.First;
   While Not DMCNT.cdsQry2.EOF Do
   Begin
      If DMCNT.cdsQry2.FieldByName('ESCOGE').AsString = 'S' Then
      Begin
         DMCNT.cdsQry2.Edit;
         DMCNT.cdsQry2.FieldByName('CNTSERIE').AsString := edtSerie.Text;
         DMCNT.cdsQry2.FieldByName('CNTNODOC').AsString := edtNroDoc.Text;
         DMCNT.cdsQry2.Post;
         xSQL := 'Update CNT301 '
            + '   Set CNTSERIE=' + quotedstr(edtSerie.Text) + ','
            + '       CNTNODOC=' + quotedstr(edtNroDoc.Text)
            + ' where CIAID=' + quotedstr(DMCNT.cdsQry2.FieldByName('CIAID').AsString)
            + '   and CNTANOMM=' + quotedstr(DMCNT.cdsQry2.FieldByName('CNTANOMM').AsString)
            + '   and TDIARID=' + quotedstr(DMCNT.cdsQry2.FieldByName('TDIARID').AsString)
            + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsQry2.FieldByName('CNTCOMPROB').AsString)
            + '   and CNTREG=' + inttostr(DMCNT.cdsQry2.FieldByName('CNTREG').AsInteger);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo actualizar el Asiento');
            (DMCNT.cdsQry2.FieldByName('CNTSERIE') As TStringField).ReadOnly := True;
            (DMCNT.cdsQry2.FieldByName('CNTNODOC') As TStringField).ReadOnly := True;
            DMCNT.cdsQry2.EnableControls;
            exit;
         End;
      End;
      DMCNT.cdsQry2.Next;
   End;
   (DMCNT.cdsQry2.FieldByName('CNTSERIE') As TStringField).ReadOnly := True;
   (DMCNT.cdsQry2.FieldByName('CNTNODOC') As TStringField).ReadOnly := True;
   DMCNT.cdsQry2.EnableControls;
   DMCNT.cdsQry2.First;
   ShowMessage('Documentos Homogenizados');
   bbtnBuscaAsientosClick(Sender);
End;

Procedure TFHomogNumDocProv.bbtnSalirClick(Sender: TObject);
Begin
   Close;
End;

End.

