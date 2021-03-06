unit CNT412;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBClient, wwclient, MConnect,
  StdCtrls, ExtCtrls, Buttons, Wwkeycb;

type
  TFSelCuenta = class(TForm)
    cds: TwwClientDataSet;
    dsDocsCont: TwwDataSource;
    dsDocContClone: TwwDataSource;
    pnlPendientes: TPanel;
    Label16: TLabel;
    dbgPendientes: TwwDBGrid;
    pnlDocCanje: TPanel;
    Label17: TLabel;
    dbgDocCanje: TwwDBGrid;
    cdsClone: TwwClientDataSet;
    bbtnOk: TBitBtn;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    pnlBusca: TPanel;
    lblBusca: TLabel;
    isBusca: TwwIncrementalSearch;
    procedure dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
    procedure dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgPendientesTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure isBuscaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    sCia:string;
    xRg : string // identifica de que Radio Group proviene
    { Public declarations }
  end;

var
  FSelCuenta: TFSelCuenta;
 
  
implementation

uses CNTDM;


{$R *.DFM}

procedure TFSelCuenta.dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFSelCuenta.dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
var
   I : Integer ;
begin
   If (Target = dbgpendientes) AND (cdsClone.recordcount <> 0 ) Then
   Begin
      if dbgDocCanje.SelectedList.Count>0 then
      begin
         for i:= 0 to dbgDocCanje.SelectedList.Count-1 do
         begin
            dbgDocCanje.datasource.dataset.GotoBookmark(dbgDocCanje.SelectedList.items[i]);
            cdsClone.edit ;
            cdsClone.FieldByName('FLAG').AsString := 'N' ;
            cdsClone.Post ;
            dbgDocCanje.datasource.dataset.Freebookmark(dbgDocCanje.SelectedList.items[i]);
         end; // for
         dbgDocCanje.SelectedList.clear;  { Clear selected record list since they are all deleted}
      end
      else begin
         cdsClone.edit ;
         cdsClone.FieldByName('FLAG').AsString := 'N' ;
         cdsClone.Post ;
      end;
   end;
end;

procedure TFSelCuenta.dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocCanje.BeginDrag(False);
end;

procedure TFSelCuenta.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFSelCuenta.dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
var
  I: integer;
begin
   If (Target = dbgDocCanje) AND (cds.recordcount <> 0 ) Then
   begin
      if dbgPendientes.SelectedList.Count>0 then
      begin
         for i:= 0 to dbgPendientes.SelectedList.Count-1 do
         begin
              dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);
              cds.edit ;
              cds.FieldByName('FLAG').AsString := 'S' ;
              cds.Post ;
              dbgPendientes.datasource.dataset.Freebookmark(dbgPendientes.SelectedList.items[i]);
         end; // for
         dbgPendientes.SelectedList.clear;  { Clear selected record list since they are all deleted}
       end
       else begin
          cds.edit ;
          cds.FieldByName('FLAG').AsString := 'S' ;
          cds.Post ;
       end;
   end ;
end;

procedure TFSelCuenta.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgPendientes.BeginDrag(False);
end;

procedure TFSelCuenta.FormShow(Sender: TObject);
var
   xSQL, sCiaCuenta : String ;
begin
	Screen.Cursor:=crHourGlass;
   isBusca.Text := '';
   pnlBusca.Visible := false;
   cds.Close;
   cds.RemoteServer := DMCNT.DCOM1 ;
   cds.ProviderName := 'prvCNT';
   If xRg = '0' then
    xSQL := ' SELECT CUENTAID ,CTADES ,CTAABR , ''N'' FLAG   ' +
           '  FROM TGE202 ' +
           '  WHERE CTA_DET=''S'' AND CTA_AUX=''S'' AND CIAID='+QuotedStr(sCia)
   else
    xSQL := ' SELECT CUENTAID ,CTADES ,CTAABR , ''N'' FLAG   ' +
           '  FROM TGE202 ' +
           '  WHERE CTA_DET=''S'' AND CIAID='+QuotedStr(sCia);

   cds.DataRequest(xSQL);
   cds.Open;
   cds.IndexFieldNames:='CUENTAID';

   sCiaCuenta:=DMCNT.FiltraTablaxCia( cds,  'TGE202', 'CUENTAID', sCia );

   cdsClone.CloneCursor(cds,TRUE) ;
   cdsClone.FILTER := 'FLAG = ''S''' ;
   cdsClone.FILTERED := tRUE ;
	Screen.Cursor:=crDefault;   
end;


procedure TFSelCuenta.bbtnOkClick(Sender: TObject);
begin
   Close ;
end;

procedure TFSelCuenta.BitBtn1Click(Sender: TObject);
begin
   Close ;
end;

procedure TFSelCuenta.dbgPendientesTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   if AFieldName='CUENTAID'  then lblBusca.Caption:='Cuenta Contable:';
   if AFieldName='CTADES'    then lblBusca.Caption:='Descripción de Cuenta:';
   if AFieldName='CTAABR'    then lblBusca.Caption:='Nombre Corto de Cuenta:';
//   lblBusca.Caption := AFieldName;
   cds.indexfieldNames:= AFieldName;
   cds.First;   
   isBusca.DataSource := dsDocsCont;
   isBusca.SearchField:= AFieldName;
   isBusca.Text := '';
   isBusca.Left := lblBusca.Width+24;
   pnlBusca.Width:= 12+lblBusca.Width+12+isBusca.Width+12;
   pnlBusca.Visible := True;
   isBusca.SetFocus;
end;

procedure TFSelCuenta.isBuscaKeyPress(Sender: TObject; var Key: Char);
begin
   if (key=#13) or (key=#27) then
   begin
      pnlBusca.Visible := False;
   end;
end;

end.
