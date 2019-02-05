unit CNT250;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid, wwdblook, ExtCtrls;

type
  TFRelGrupo = class(TForm)
    pnlCabecera: TPanel;
    lblCia: TLabel;
    lblGrupo: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    edtGrupo: TEdit;
    pnlDetalle: TPanel;
    bbtnCanc: TBitBtn;
    bbtnOkGrup: TBitBtn;
    dblcGrupo: TwwDBLookupCombo;
    dbgGrupos: TwwDBGrid;
    bbtnBorrar: TBitBtn;
    bbtnOK: TBitBtn;
    lbtnNuevo: TwwIButton;
    pnlEdicion: TPanel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    bbtnNok: TBitBtn;
    bbtnNcanc: TBitBtn;
    Panel1: TPanel;
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcGrupoExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnBorrarClick(Sender: TObject);
    procedure bbtnOKClick(Sender: TObject);
    procedure bbtnOkGrupClick(Sender: TObject);
    procedure bbtnCancClick(Sender: TObject);
    procedure InicializaCab;
    procedure PreparaEdicion;
    procedure lbtnNuevoClick(Sender: TObject);
    procedure bbtnNokClick(Sender: TObject);
    procedure bbtnNcancClick(Sender: TObject);
    procedure dbgGruposKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgGruposDblClick(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelGrupo: TFRelGrupo;
  xWhere : string;
implementation

uses CNTDM;
{$R *.DFM}

procedure TFRelGrupo.FormActivate(Sender: TObject);
begin
   InicializaCDS;
end;

procedure TFRelGrupo.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DM1.cdsCiaCiaDes.Text;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   end;
end;

procedure TFRelGrupo.dblcGrupoExit(Sender: TObject);
begin
   edtGrupo.Text:='';
   if dblcGrupo.Text<>'' then edtGrupo.Text:=DM1.cdsGrupTDiarGrupoTDiarDes.Text;
   if length(edtGrupo.Text)=0 then
   begin
      ShowMessage('Falta Definición de Grupo de Diarios');
      dblcGrupo.SetFocus;
   end;
end;

procedure TFRelGrupo.bbtnBorrarClick(Sender: TObject);
begin
     InicializaCab;
end;

procedure TFRelGrupo.bbtnOKClick(Sender: TObject);
begin
    if (edtCia.Text='') or (edtGrupo.Text='') then
       raise exception.Create('Información Incompleta');

    DM1.cdsRelGTDiar.Filter:='CiaId='+dblcCia.Text+' and GrupoTDiarId='+dblcGrupo.Text;
    DM1.cdsRelGTDiar.Filtered:=True;
    pnlCabecera.Enabled:=False;
    pnlDetalle.Enabled:=True;
    pnlDetalle.SetFocus;
end;

procedure TFRelGrupo.bbtnOkGrupClick(Sender: TObject);
Var
   xSQL: string;
begin
   With DM1 do Begin
     if cdsRelGTDiar.RecordCount = 0 then
       raise exception.Create('Ingrese Tipo de Diario');

     cdsRelGTDiar.ApplyUpdates(0);

     InicializaCDS;
     pnlCabecera.Enabled:=True;
     pnlDetalle.Enabled:=False;
     InicializaCab;
   End;
end;

procedure TFRelGrupo.InicializaCab;
begin
   dblcCia.Text   :='';
   edtCia.Text    :='';
   dblcGrupo.Text :='';
   edtGrupo.Text  :='';
   dblcCia.SetFocus;
end;

procedure TFRelGrupo.PreparaEdicion;
begin
   dblcTDiario.Text:='';
   edtTDiario.Text:='';
   pnlDetalle.Enabled:=False;
   pnlEdicion.Visible:=True;
end;

procedure TFRelGrupo.bbtnCancClick(Sender: TObject);
begin
     DM1.cdsRelGTDiar.CancelUpdates;
end;

procedure TFRelGrupo.lbtnNuevoClick(Sender: TObject);
begin
   PreparaEdicion;
//   DM1.cdsRelGTDiar.Insert;
end;

procedure TFRelGrupo.bbtnNokClick(Sender: TObject);
begin
  With DM1 do Begin
   if edtTDiario.Text='' then raise exception.Create('Tipo de Diario Errado');
   cdsRelGTDiar.Edit;
   cdsRelGTDiarCiaId.Value:=dblcCia.Text;
   cdsRelGTDiarTdiarId.Value:=dblcTDiario.Text;
   cdsRelGTDiarGrupoTDiarId.Value:=dblcGrupo.Text;
   cdsRelGTDiar.Post;
   pnlEdicion.Visible:=False;
   pnlDetalle.Enabled:=True;
  End;
end;

procedure TFRelGrupo.bbtnNcancClick(Sender: TObject);
begin
   DM1.cdsRelGTDiar.Cancel;
   pnlEdicion.Visible:=False;
   pnlDetalle.Enabled:=True;
end;

procedure TFRelGrupo.dbgGruposKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key=vk_delete) and (ssCtrl in Shift) then DM1.cdsRelGTDiar.Delete;
end;

procedure TFRelGrupo.dbgGruposDblClick(Sender: TObject);
begin
   With DM1 do Begin
     PreparaEdicion;
     dblcTDiario.Text:=cdsRelGTDiarTdiarId.Value;
     edtTDiario.Text :=cdsRelGTDiarlkTDiar.Value;
//     cdsRelGTDiar.Edit;
   End;
end;

procedure TFRelGrupo.dblcTDiarioExit(Sender: TObject);
begin
  With DM1 do Begin
   edtTDiario.Text:='';
   if dblcTDiario.Text<>'' then edtTDiario.Text:=DM1.cdsTDiarioTDiarDes.Text;
//   xWhere:='TDiarId='+''''+dblcTDiario.Text+'''';
//   edtTDiario.Text:=DM1.DisplayDescrip('PrvTge','TGE104','TDiarDes',xWhere,'TDIARDES');
   cdsRelGTDiar.SetKey;
   cdsRelGTDiarCiaId.Value:=dblcCia.Text;
   cdsRelGTDiarTdiarId.Value:=dblcTDiario.Text;
   cdsRelGTDiarGrupoTDiarId.Value:=dblcGrupo.Text;
   if not(cdsRelGTDiar.GotoKey) then cdsRelGTDiar.Insert
   else cdsRelGTDiar.Edit;

  End;
end;

procedure TFRelGrupo.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

end.
