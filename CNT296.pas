unit CNT296;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, wwdbedit, Buttons;

type
  TFRendicion = class(TForm)
    dbeImporte: TwwDBEdit;
    dbeObser: TwwDBEdit;
    dbeCuenta: TwwDBEdit;
    dbeRendicion: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRendicion: TFRendicion;

implementation

{$R *.dfm}

USES CNTDM;

procedure TFRendicion.FormActivate(Sender: TObject);
begin

  dbeCuenta.DataSource   :=DMCNT.dsLiqDet;
  dbeObser.DataSource    :=DMCNT.dsLiqDet;
  dbeImporte.DataSource  :=DMCNT.dsLiqDet;
  dbeRendicion.DataSource:=DMCNT.dsLiqDet;

  dbeRendicion.SetFocus;
end;

procedure TFRendicion.BitBtn1Click(Sender: TObject);
begin
   DMCNT.cdsLiqDet.ApplyUpdates(0);
   Close
end;

procedure TFRendicion.BitBtn2Click(Sender: TObject);
begin
   DMCNT.cdsLiqDet.CancelUpdates;
   Close
end;

procedure TFRendicion.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

end.
