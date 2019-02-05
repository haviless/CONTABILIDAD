unit CNT411;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBClient, wwclient, MConnect,
  StdCtrls, ExtCtrls, Buttons, Wwkeycb;

type
  TFSelAux = class(TForm)
    dsDocsCont: TwwDataSource;
    cdsClone: TwwClientDataSet;
    dsDocContClone: TwwDataSource;
    Button1: TButton;
    pnlPendientes: TPanel;
    Label16: TLabel;
    dbgPendientes: TwwDBGrid;
    pnlDocCanje: TPanel;
    Label17: TLabel;
    dbgDocCanje: TwwDBGrid;
    cds: TwwClientDataSet;
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
    procedure Button1Click(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgPendientesTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure isBuscaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
      sCia:string;
  end;

var
  FSelAux: TFSelAux;

implementation

uses CNTDM;

{$R *.DFM}

procedure TFSelAux.dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFSelAux.dbgDocCanjeEndDrag(Sender, Target: TObject; X,
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

procedure TFSelAux.dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocCanje.BeginDrag(False);
end;

procedure TFSelAux.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFSelAux.dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
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

procedure TFSelAux.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgPendientes.BeginDrag(False);
end;

procedure TFSelAux.FormShow(Sender: TObject);
var
	xSQL :String ;
begin
	Screen.Cursor:=crHourGlass;
   if cds.Active = False then
   begin
      cds.Close;
      cds.RemoteServer := DMCNT.DCOM1 ;
      cds.ProviderName := 'prvCNT';
      if (SRV_D = 'DB2NT') or
         (SRV_D = 'DB2400') then
      begin
         xSQL := ' SELECT CNT201.CLAUXID, CLAUXDES, AUXID,    ' +
                 '        AUXRUC, AUXNOMB,AUXABR,''N'' FLAG  ' +
                 ' FROM CNT201                                 ' +
                 ' LEFT JOIN TGE102 ON                         ' +
                 ' (CNT201.CLAUXID=TGE102.CLAUXID)             ' ;
      end
      else
      if SRV_D = 'ORACLE' then
      begin
         xSQL := 'SELECT CNT201.CLAUXID, CLAUXDES, AUXID, ' +
                 'AUXRUC, AUXNOMB,AUXABR,''N'' FLAG ' +
                 'FROM CNT201,TGE102 ' +
                 'WHERE (CNT201.CLAUXID=TGE102.CLAUXID(+)) ' ;
      end;
      cds.DataRequest(xSQL);
      cds.Open;
      cds.IndexFieldNames:='AUXID';
   end
   else
   begin
      cds.Filter := 'FLAG = ''S'' ';
      cds.Filtered := True;
      cds.First;
      while not cds.EOF do
      begin
         cds.Edit;
         cds.FieldByName('FLAG').AsString:='N';
         cds.Post;
      end;
      cds.Filter := '';
      cds.Filtered := False;
   end;
   cdsClone.CloneCursor(cds,TRUE) ;
   cdsClone.Filter := 'FLAG = ''S'' ';
   cdsClone.Filtered := True;
   Screen.Cursor:=crDefault;
end;

procedure TFSelAux.Button1Click(Sender: TObject);
begin
    cds.CancelUpdates ;
end;

procedure TFSelAux.bbtnOkClick(Sender: TObject);
begin
   cLOSE ;
end;

procedure TFSelAux.BitBtn1Click(Sender: TObject);
begin
   Close ;
end;

procedure TFSelAux.dbgPendientesTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   if AFieldName='CLAUXID'  then lblBusca.Caption:='Clase de Auxiliar:';
   if AFieldName='CLAUXDES' then lblBusca.Caption:='Nombre de Clase de Auxiliar:';
   if AFieldName='AUXID'    then lblBusca.Caption:='Código de Auxiliar:';
   if AFieldName='RUC'      then lblBusca.Caption:='RUC del Auxiliar:';
   if AFieldName='AUXNOMB'  then lblBusca.Caption:='Nombre del Auxiliar:';
   if AFieldName='AUXABR'   then lblBusca.Caption:='Nombre Corto Auxiliar:';
//   lblBusca.Caption := AFieldName;
   cds.indexfieldNames:= AFieldName;
   isBusca.SearchField:= AFieldName;
   isBusca.Left := lblBusca.Width+24;
   pnlBusca.Width:= 12+lblBusca.Width+12+isBusca.Width+12;
   pnlBusca.Visible := True;
   isBusca.SetFocus;
end;

procedure TFSelAux.isBuscaKeyPress(Sender: TObject; var Key: Char);
begin
   if (key=#13) or (key=#27) then
   begin
      pnlBusca.Visible := False;
   end;
end;

end.
