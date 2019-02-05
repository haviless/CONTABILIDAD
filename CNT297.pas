unit CNT297;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, wwdblook, Wwdbdlg;

type
  TFLiqCC = class(TForm)
    dblcdCCosto: TwwDBLookupComboDlg;
    dbeCCosto: TDBEdit;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    bbtnCanc: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcdCCostoExit(Sender: TObject);
    procedure bbtnCancClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLiqCC: TFLiqCC;

implementation

{$R *.dfm}

USES CNTDM;

procedure TFLiqCC.BitBtn1Click(Sender: TObject);
var
  cCCosto, cCodUsu : String;
begin
   if DMCNT.cdsCCosto.FieldByName('CCOSID').Asstring='' then
   begin
      DMCNT.cdsLiqCon.CancelUpdates;
      ShowMessage('Debe Ingresar el Centro de Costo');
      Exit;
   end;

   cCCosto:=DMCNT.cdsLiqCon.FieldByname('CENCOS').AsString;
   cCodUsu:=DMCNT.cdsLiqCon.FieldByname('CODUSU').AsString;

   while (not DMCNT.cdsLiqCon.Eof)
     and (cCodUsu=DMCNT.cdsLiqCon.FieldByname('CODUSU').AsString) do
   begin
      DMCNT.cdsLiqCon.Edit;
      DMCNT.cdsLiqCon.FieldByname('CENCOS').AsString:=cCCosto;
      DMCNT.cdsLiqCon.Next
   end;
   DMCNT.cdsLiqCon.ApplyUpdates(0);
   ShowMessage('Ok.');
   close;
end;

procedure TFLiqCC.FormActivate(Sender: TObject);
var
   xSQL : String;
begin
   xSQL:='SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV FROM TGE203 '
        +'Where CCOSMOV='+quotedstr('S')+' and CCOSACT=''S''';
   DMCNT.cdsCCosto.Close;
   DMCNT.cdsCCosto.DataRequest(xSQL);
   DMCNT.cdsCCosto.Open;
end;

procedure TFLiqCC.dblcdCCostoExit(Sender: TObject);
begin
   if bbtnCanc.Focused then Exit;

   if DMCNT.cdsCCosto.FieldByName('CCOSID').Asstring='' then
   begin
      ShowMessage('Debe Ingresar el Centro de Costo');
      Exit;
   end;

   DMCNT.cdsCCosto.IndexFieldNames:='CCOSID';
   DMCNT.cdsCCosto.SetKey;
   DMCNT.cdsCCosto.FieldByName('CCOSID').Asstring:=dblcdCCosto.Text;
   if not DMCNT.cdsCCosto.GotoKey then
   begin
      ShowMessage('Error : Centro de Costo No Existe...');
      dblcdCCosto.SetFocus;
      Exit;
   end;
   dbeCCosto.Text:=DMCNT.cdsCCosto.FieldByName('CCOSDES').AsString;
end;

procedure TFLiqCC.bbtnCancClick(Sender: TObject);
begin
   DMCNT.cdsLiqCon.CancelUpdates;
   close;
end;

procedure TFLiqCC.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

end.
