Unit CNT232;

// Conciliación Bancaria - Conciliación Manual
// Actualizaciones
// HPC_201501_CNT    Creación de Formulario
// HPC_201502_CNT    Modificaciones en el formulario segun DAF_2015000640_CNT_1

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  // Inicio HPC_201502_CNT
  //Dialogs, Grids, Wwdbigrd, Wwdbgrid, DB, StdCtrls, Buttons;
    Dialogs, Grids, Wwdbigrd, Wwdbgrid, DB, StdCtrls, Buttons, ExtCtrls,Wwkeycb;
  // Fin HPC_201502_CNT

Type
   TFConcilBancManual = Class(TForm)
      dbgManual: TwwDBGrid;
      dbgManualCabecera: TwwDBGrid;
      bbtnDesmarca: TBitBtn;
      lblTotal: TLabel;
      bbtnAcepta: TBitBtn;
    //Inicio HPC_201502_CNT
      pnlBusca: TPanel;
      grbBusqueda: TGroupBox;
      edtBusca: TwwIncrementalSearch;
    //Final HPC_201502_CNT
      Procedure FormShow(Sender: TObject);
      Procedure dbgManualDblClick(Sender: TObject);
      Procedure dbgManualTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure bbtnDesmarcaClick(Sender: TObject);
      Procedure bbtnAceptaClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
    //Inicio HPC_201502_CNT 
      Procedure dbgManualCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
      Procedure edtBuscaExit(Sender: TObject);
      Procedure edtBuscaKeyPress(Sender: TObject; var Key: Char);
    //Inicio HPC_201502_CNT 
   Private
    { Private declarations }
     //Inicio HPC_201502_CNT
      Procedure Buscar();
     //Final HPC_201502_CNT
   Public
    { Public declarations }
   End;

Var
   FConcilBancManual: TFConcilBancManual;

Implementation

Uses CNTDM, CNT230;

{$R *.dfm}

Procedure TFConcilBancManual.FormShow(Sender: TObject);
Begin
   dbgManual.SetFocus;
End;

Procedure TFConcilBancManual.dbgManualDblClick(Sender: TObject);
Begin
   DMCNT.cdsMovCNT2.Edit;
   If DMCNT.cdsMovCNT2.FieldByName('FLAG').AsString = 'S' Then
   Begin
      DMCNT.cdsMovCNT2.FieldByName('FLAG').AsString := 'N';
      If FConcBanCob.suma > 0 Then
         FConcBanCob.suma := FConcBanCob.suma - DMCNT.cdsMovCNT2.FieldByName('IMPORTE').AsCurrency
      Else
         FConcBanCob.suma := 0;
   End
   Else
   Begin
      DMCNT.cdsMovCNT2.FieldByName('FLAG').AsString := 'S';
      FConcBanCob.suma := FConcBanCob.suma + DMCNT.cdsMovCNT2.FieldByName('IMPORTE').AsCurrency;
   End;
   //Inicio HPC_201502_CNT
   dbgManual.Refresh;
   //Final HPC_201502_CNT
   lblTotal.Caption := CurrToStr(FConcBanCob.suma);
End;

Procedure TFConcilBancManual.dbgManualTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
//Inicio HPC_201502_CNT
   edtBusca.DataSource := DMCNT.dsMovCNT2;
//Final HPC_201502_CNT
   If AFieldName = 'CNTFEMIS' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT2.IndexFieldNames := 'CNTFEMIS';
      Screen.Cursor := crDefault;
//Inicio HPC_201502_CNT
      Buscar;
      grbBusqueda.Caption := 'F.Emisión';
//Final HPC_201502_CNT
   End;

   If AFieldName = 'NUMOPERA' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT2.IndexFieldNames := 'NUMOPERA';
      Screen.Cursor := crDefault;
//Inicio HPC_201502_CNT
      Buscar;
      grbBusqueda.Caption := 'N.Operación';
//Final HPC_201502_CNT
   End;

   If AFieldName = 'DNI' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT2.IndexFieldNames := 'DNI';
      Screen.Cursor := crDefault;
//Inicio HPC_201502_CNT
      Buscar;
      grbBusqueda.Caption := 'Dni';
//Final HPC_201502_CNT
   End;

   If AFieldName = 'IMPORTE' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT2.IndexFieldNames := 'IMPORTE';
      Screen.Cursor := crDefault;
//Inicio HPC_201502_CNT
      Buscar;
      grbBusqueda.Caption := 'Importe';
//Final HPC_201502_CNT
   End;

   If AFieldName = 'FLGCONC' Then
   Begin
      Screen.Cursor := crHourGlass;
      DMCNT.cdsMovCNT2.IndexFieldNames := 'FLGCONC';
      Screen.Cursor := crDefault;
   End;
End;

Procedure TFConcilBancManual.bbtnDesmarcaClick(Sender: TObject);
Var
   B: TBookmark;
Begin
   FConcBanCob.suma := 0.00;
   lblTotal.Caption := CurrToStr(FConcBanCob.suma);
   DMCNT.cdsMovCNT2.DisableControls;

   B := DMCNT.cdsMovCNT2.GetBookmark;
   DMCNT.cdsMovCNT2.First;
   While Not DMCNT.cdsMovCNT2.Eof Do
   Begin
      DMCNT.cdsMovCNT2.Edit;
      DMCNT.cdsMovCNT2.FieldByName('FLAG').AsString := '';
      DMCNT.cdsMovCNT2.Next;
   End;
   DMCNT.cdsMovCNT2.GotoBookmark(B);
   DMCNT.cdsMovCNT2.EnableControls;
   DMCNT.cdsMovCNT2.FreeBookmark(B);
End;

Procedure TFConcilBancManual.bbtnAceptaClick(Sender: TObject);
Var
   xSQL: String;
   B: TBookmark;
   //Inicio HPC_201502_CNT
   vimporte : currency;
   //Final HPC_201502_CNT
Begin
  //Inicio HPC_201502_CNT
  //If DMCNT.cdsQry5.FieldByName('IMPORTE').AsCurrency <> StrToCurr(lblTotal.Caption) Then
  If DMCNT.cdsMovCNT2.FieldByName('CNTDH').ASSTRING ='H' Then
       vimporte := DMCNT.cdsQry5.FieldByName('IMPORTE').AsCurrency*-1
  Else vimporte := DMCNT.cdsQry5.FieldByName('IMPORTE').AsCurrency;
   If vimporte <> StrToCurr(lblTotal.Caption) Then
  //Final HPC_201502_CNT
   Begin
      ShowMessage('Los Importes Selecionados No son iguales, verifique....');
      Exit;
   End;

   DMCNT.cdsMovCNT2.DisableControls;

   B := DMCNT.cdsMovCNT2.GetBookmark;
   DMCNT.cdsMovCNT2.First;
   While Not DMCNT.cdsMovCNT2.Eof Do
   Begin
      If DMCNT.cdsMovCNT2.FieldByName('FLAG').AsString = 'S' Then
      Begin
         xSQL := 'Update CNT_CONC_MOV_CONT '
               + '   set FLGCONC=''S'', '
               + '       IDEXTBAN=' + QuotedStr(DMCNT.cdsQry5.FieldByname('IDEXTBAN').AsString)
               + ' Where IDCONC=' + QuotedStr(FConcBanCob.xnumconc)
               + '   and IDMOVCONT=' + QuotedStr(DMCNT.cdsMovCNT2.Fieldbyname('IDMOVCONT').AsString);
         DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      //Inicio HPC_201502_CNT
         xSQL := 'Update CNT_CONC_EXTR_BAN '
                + '   Set IDMOVCONT=' + QuotedStr(DMCNT.cdsQry5.FieldByname('IDMOVCONT').AsString) + ','
                + '       FLGCONC=''S'' '
                + ' Where IDCONC=' + QuotedStr(DMCNT.cdsQry5.FieldByname('IDCONC').AsString)
                + '   and IDEXTBAN=' + QuotedStr(DMCNT.cdsQry5.FieldByname('IDEXTBAN').AsString);
         DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      //Final HPC_201502_CNT
      End;
      DMCNT.cdsMovCNT2.Next;
   End;
   DMCNT.cdsMovCNT2.GotoBookmark(B);
   DMCNT.cdsMovCNT2.EnableControls;
   DMCNT.cdsMovCNT2.FreeBookmark(B);
   ShowMessage('Grabación Exitosa');
   Close;
End;

Procedure TFConcilBancManual.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If Self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;
//Inicio HPC_201502_CNT
procedure TFConcilBancManual.dbgManualCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   If DMCNT.cdsMovCNT2.FieldByName('FLAG').AsString = 'S' Then
   Begin
      AFont.Color := clBlack;
      ABrush.Color := clLime;
   End
   Else
   Begin
      AFont.Color := clBlack;
      ABrush.Color := clWindow;
   End
end;
//Final HPC_201502_CNT
//Inicio HPC_201502_CNT
procedure TFConcilBancManual.Buscar;
begin
    edtBusca.Text := '';
    pnlBusca.Visible := False;
    pnlBusca.Left := Mouse.CursorPos.x-600 ;
    pnlBusca.Top  := Mouse.CursorPos.y-100 ;
    pnlBusca.Visible := True;
    edtBusca.SetFocus;
end;
//Final HPC_201502_CNT

//Inicio HPC_201502_CNT
procedure TFConcilBancManual.edtBuscaExit(Sender: TObject);
begin
  pnlBusca.Visible := False;
end;
//Final HPC_201502_CNT

//Inicio HPC_201502_CNT
procedure TFConcilBancManual.edtBuscaKeyPress(Sender: TObject;
  var Key: Char);
begin
   If (Key = #13) Or (Key = #27) Then
   Begin
      pnlBusca.Visible := False;
   End;
end;
//Final HPC_201502_CNT
End.

