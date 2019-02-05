// Inicio Uso Estándares: 01/08/2011
// Unidad               : CNT700A
// Formulario           : TfSeguros
// Fecha de Creación    : 23/06/2017
// Autor                : Jesús Castillo Pampas
// Objetivo             : Creación de formulario para listar los seguros
// Actualizaciones      :
//HPC_201703_CNT        : Creación del Formulario

//Inicio HPC_201703_CNT
//Creación de formulario para listar los seguros

Unit CNT700A;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls,
   fcButton, fcImgBtn, fcShapeBtn, fcLabel, ppBands, jpeg, ppCtrls,
   ppStrtch, ppMemo, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, wwclient,
   ppReport, Db, Mask, wwdbedit, wwdblook;

Type
   TfSeguros = Class(TForm)
      BitSalir: TBitBtn;
      BitChat: TBitBtn;
      dbgSeguroCab: TwwDBGrid;
      dtgNuevoSeguro: TwwIButton;
      Label1: TLabel;
      dblcCia: TwwDBLookupCombo;
      dbeCia: TwwDBEdit;
      bbtnBuscar: TBitBtn;

      Procedure dtgNuevoSeguroClick(Sender: TObject);

      Procedure btnCancelaClick(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnBuscarClick(Sender: TObject);
      Procedure dbgSeguroCabDblClick(Sender: TObject);
      Procedure dbgSeguroCabKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);

   Private
    { Private declarations }
      Procedure AsignaLookup;
   Public
    { Public declarations }
   End;

Var
   fSeguros: TfSeguros;

Implementation

Uses DateUtils, CNT700B, CNTDM;

{$R *.dfm}

Procedure TfSeguros.dtgNuevoSeguroClick(Sender: TObject);
Begin
   Try
      fNueSeguroPrincipal := TfNueSeguroPrincipal.create(self);
      fNueSeguroPrincipal.xsegid := '';
      fNueSeguroPrincipal.xciaid := dblcCia.Text;
      fNueSeguroPrincipal.Showmodal;
      DMCNT.cdsQry9.close;
   Finally
      fNueSeguroPrincipal.free;
   End;
End;

Procedure TfSeguros.btnCancelaClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfSeguros.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;

   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TfSeguros.dblcCiaExit(Sender: TObject);
Var
   xSQL: String;
Begin

   DMCNT.cdsCia.IndexFieldNames := 'CIAID';
   DMCNT.cdsCia.SetKey;
   DMCNT.cdsCia.FieldbyName('CIAID').AsString := dblcCia.Text;
   DMCNT.cdsCia.GotoKey;
   dbeCia.Text := DMCNT.cdsCia.FieldByName('CIADES').AsString;
   DMCNT.cdsCuentaLookUp.Close;
   DMCNT.cdsCuentaLookUp.DataRequest('Select ciaid, cuentaid, ctades, ctaabr, ctaniv,'
      + ' cta_det, cta_aut1, ctaaut1, cta_aut2, ctaaut2, cta_cier, cta_plaz, cta_mov, cta_aux,'
      + ' cta_doc, cta_ccos, cta_me, cta_dest, flgvar, cta_difc, ctacontra, cta_secu, cta_ajusterei,'
      + ' ctamoddifc, cta_difgp, cta_tipo, tipctaid, usuario, hreg, freg, cta_apert, cta_tiporei,'
      + ' cta_nomonet, cta_salajrei, cta_consol, cta_pres, cta_sumga, regsolome, cta_transape, ctaact '
      + ' from TGE202 where CIAID=' + QuotedStr(dblcCia.Text));
   DMCNT.cdsCuentaLookUp.Open;

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

   DMCNT.cdsCia.First;

End;

Procedure TfSeguros.FormCreate(Sender: TObject);
Begin
   dblcCia.LookupTable := DMCNT.cdsCia;

   AsignaLookup;

End;

Procedure TfSeguros.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TfSeguros.AsignaLookup;
Var
   xSQL: String;
Begin
   xSQL := 'select segid,ciaid,cptoid,cptodes,ctagasid,ctagasdes,tipmon from CNT_DEV_SEG_CAB where 1=1';

   dbgSeguroCab.Selected.Clear;
   dbgSeguroCab.Selected.Add('CIAID'#9'8'#9'Compañía'#9'F');
   dbgSeguroCab.Selected.Add('CPTOID'#9'10'#9'Código'#9'F');
   dbgSeguroCab.Selected.Add('CPTODES'#9'40'#9'Descripción'#9'F');
   dbgSeguroCab.Selected.Add('CTAGASID'#9'10'#9'Código ~cuenta Gasto'#9'F');
   dbgSeguroCab.Selected.Add('CTAGASDES'#9'40'#9'Descripción ~cuenta Gasto'#9'F');
   dbgSeguroCab.Selected.Add('TIPMON'#9'8'#9'Tipo ~Moneda'#9'F');
   dbgSeguroCab.DataSource := DMCNT.dsQry6;

   Try
      DMCNT.cdsQry6.close;
      DMCNT.cdsQry6.DataRequest(xSql);
      DMCNT.cdsQry6.Open;
   Except
      ShowMessage('Error al Llenar la grilla de datos');
      exit;
   End;
End;

Procedure TfSeguros.bbtnBuscarClick(Sender: TObject);
Var
   xSQL: String;
Begin
   Screen.Cursor := crHourGlass;

   xSQL := 'select segid,ciaid,cptoid,cptodes,ctagasid,ctagasdes,tipmon from CNT_DEV_SEG_CAB';

   If length(dblcCia.text)>0 Then
   Begin
       xSQL := xSQL + ' where ciaid=' + quotedstr(dblcCia.text);
   End;

   dbgSeguroCab.Selected.Clear;
   dbgSeguroCab.Selected.Add('CIAID'#9'8'#9'Compañía'#9'F');
   dbgSeguroCab.Selected.Add('CPTOID'#9'10'#9'Código'#9'F');
   dbgSeguroCab.Selected.Add('CPTODES'#9'40'#9'Descripción'#9'F');
   dbgSeguroCab.Selected.Add('CTAGASID'#9'10'#9'Código ~cuenta Gasto'#9'F');
   dbgSeguroCab.Selected.Add('CTAGASDES'#9'40'#9'Descripción ~cuenta Gasto'#9'F');
   dbgSeguroCab.Selected.Add('TIPMON'#9'8'#9'Tipo ~Moneda'#9'F');
   dbgSeguroCab.DataSource := DMCNT.dsQry6;

   Try
      DMCNT.cdsQry6.close;
      DMCNT.cdsQry6.DataRequest(xSql);
      DMCNT.cdsQry6.Open;
   Except
      ShowMessage('Error al Llenar la grilla de datos');
      Screen.Cursor := crDefault;
      exit;
   End;
   Screen.Cursor := crDefault;
End;

Procedure TfSeguros.dbgSeguroCabDblClick(Sender: TObject);
Begin
   If (DMCNT.cdsQry6.RecordCount > 0) Then
   Begin
      fNueSeguroPrincipal := TfNueSeguroPrincipal.create(self);
      fNueSeguroPrincipal.xoperacion := 'U';
      fNueSeguroPrincipal.xsegid := DMCNT.cdsQry6.fieldbyname('SEGID').AsString;
      fNueSeguroPrincipal.dblcCia.Text := DMCNT.cdsQry6.fieldbyname('CIAID').AsString;
      fNueSeguroPrincipal.xciaid := DMCNT.cdsQry6.fieldbyname('CIAID').AsString;
      fNueSeguroPrincipal.dblcCiaExit(self);
      fNueSeguroPrincipal.dblcConcepto.Text := DMCNT.cdsQry6.fieldbyname('CPTOID').AsString;
      fNueSeguroPrincipal.xcptoid := DMCNT.cdsQry6.fieldbyname('CPTOID').AsString;
      fNueSeguroPrincipal.dbeConcepto.Text := DMCNT.cdsQry6.fieldbyname('CPTODES').AsString;
      fNueSeguroPrincipal.xcptodes := DMCNT.cdsQry6.fieldbyname('CPTODES').AsString;
      fNueSeguroPrincipal.dblcCtaGasto.Text := DMCNT.cdsQry6.fieldbyname('CTAGASID').AsString;
      fNueSeguroPrincipal.xctagasid := DMCNT.cdsQry6.fieldbyname('CTAGASID').AsString;
      fNueSeguroPrincipal.dbeCtaGasto.Text := DMCNT.cdsQry6.fieldbyname('CTAGASDES').AsString;
      fNueSeguroPrincipal.xctagasdes := DMCNT.cdsQry6.fieldbyname('CTAGASDES').AsString;
      If (DMCNT.cdsQry6.fieldbyname('TIPMON').AsString = 'N') Then
      Begin
         fNueSeguroPrincipal.rgMoneda.ItemIndex := 0;
      End
      Else
      Begin
         fNueSeguroPrincipal.rgMoneda.ItemIndex := 1;
      End;

      fNueSeguroPrincipal.Showmodal;

   End;
End;

Procedure TfSeguros.dbgSeguroCabKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Var
   xSql: String;
Begin
   If (key = VK_Delete) And (ssCtrl In Shift) Then
   Begin
      Screen.Cursor := crHourGlass;
      If MessageDlg('Desea eliminar los datos del seguro seleccionado' + chr(13) + chr(13) +
         '            ¿ Esta Seguro ?  ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
      Begin
         Screen.Cursor := crDefault;
         exit;
      End;
      xSql := 'select count(cptoid) existe from db2admin.CXP301 where cptoid=' + quotedstr(DMCNT.cdsQry6.fieldbyname('CPTOID').AsString);
      Try
         DMCNT.cdsQry.close;
         DMCNT.cdsQry.DataRequest(xSql);
         DMCNT.cdsQry.Open;
         If (DMCNT.cdsQry.FieldByName('existe').AsInteger > 0) Then
         Begin
            ShowMessage('No se puede eliminar un seguro que se encuentra asociado a una provisión');
            Screen.Cursor := crDefault;
            exit;
         End
         Else
         Begin
            xSql := 'delete from db2admin.cnt_dev_seg_cab where segid=' + quotedstr(DMCNT.cdsQry6.fieldbyname('SEGID').AsString);
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSql);
               xSql := 'delete from db2admin.cnt_dev_seg_det where segid=' + quotedstr(DMCNT.cdsQry6.fieldbyname('SEGID').AsString);
               DMCNT.DCOM1.AppServer.EjecutaQry(xSql);
               AsignaLookup;
               Screen.Cursor := crDefault;
            Except
               ShowMessage('No se pudo Eliminar datos del seguro');
               Screen.Cursor := crDefault;
               exit;
            End;
         End;
      Except
         ShowMessage('No se pudo Eliminar datos del seguro');
         Screen.Cursor := crDefault;
         exit;
      End;
   End;

End;

End.
//Fin HPC_201703_CNT

