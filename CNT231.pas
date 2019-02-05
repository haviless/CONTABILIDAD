Unit CNT231;

// Conciliación Bancaria - Detalle del Extracto Bancario
// Actualizaciones
// HPC_201501_CNT    Creación de Formulario

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, DB, StdCtrls;

Type
   TFConcilDetExtrBanc = Class(TForm)
      dbgConsulta1: TwwDBGrid;
      Procedure FormShow(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FConcilDetExtrBanc: TFConcilDetExtrBanc;

Implementation

Uses CNTDM, CNT230;

{$R *.dfm}

Procedure TFConcilDetExtrBanc.FormShow(Sender: TObject);
Begin
   dbgConsulta1.SetFocus;
End;

Procedure TFConcilDetExtrBanc.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If Self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

End.

