unit CXP020;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, wwdbedit, Qt, MConnect, CXPDM;

type
  TFCtrlAcceso = class(TForm)
    gbControlAcceso: TGroupBox;
    lblUsuario: TLabel;
    lblContrasena: TLabel;
    dbePassword: TwwDBEdit;
    dbeUsuario: TwwDBEdit;
    bbtnOkIngreso: TBitBtn;
    bbtnCancelaIngreso: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure bbtnOkIngresoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbePasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnCancelaIngresoClick(Sender: TObject);
  private
    { Private declarations }
  public
    wDCOM1: TDCOMConnection;
    { Public declarations }
    xdiasduracpass:Integer;
    cAccesoSistema : String;
  end;

var
  FCtrlAcceso: TFCtrlAcceso;
  xSQL : String;

implementation

//uses CXPDM;
//uses CXPDM, CAR001, CAR022, Math;


{$R *.dfm}

procedure TFCtrlAcceso.bbtnOkIngresoClick(Sender: TObject);
Var
   xfecfin :TDate;
   xdiasexppass:Integer;
   xdiasfaltantes:Integer;
   xpassact, xctrl_ip, xingresa :String;
begin
//   wBD      := 'TEST';
//   DMCXP.wUsuario := dbeUsuario.Text;
//   DMCXP.wModulo  := 'CXP';

// Usuario se conecta a la base de datos
   Try
      wDCOM1.AppServer.Conectate('xxxxxx', dbeUsuario.Text, dbePassword.Text);
      cAccesoSistema:='S';
   Except
      Showmessage('Usuario y/o contraseña no reconocido por la Base de Datos');
      cAccesoSistema:='N';
      Exit;
   End;
   Close;
End;

Procedure TFCtrlAcceso.FormShow(Sender: TObject);
Begin
  dbeUsuario.SetFocus;
End;

Procedure TFCtrlAcceso.FormKeyPress(Sender: TObject; var Key: Char);
Begin
  If Key = #13 then
  Begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  End;
End;


procedure TFCtrlAcceso.dbePasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key =  13 then
      bbtnOkIngreso.OnClick(bbtnOkIngreso);
end;

procedure TFCtrlAcceso.bbtnCancelaIngresoClick(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

end.
