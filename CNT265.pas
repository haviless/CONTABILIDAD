unit CNT265;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, ppCache, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppEndUsr, ppBands;

type
  TFInconsistencias = class(TForm)
    bbtnLista: TBitBtn;
    pnlFondo: TPanel;
    dbgInconsistencias: TwwDBGrid;
    bbtnCancelar: TBitBtn;
    ppRepIncons: TppReport;
    ppDBIncons: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDesigner1: TppDesigner;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnListaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInconsistencias: TFInconsistencias;

implementation

uses CNTDM;

{$R *.DFM}

procedure TFInconsistencias.bbtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFInconsistencias.bbtnListaClick(Sender: TObject);
var
  x10:Integer;
begin
      ppDBIncons.DataSource:=DMCNT.dsQry;

      ppRepIncons.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\Inconsistencias.rtm';
      ppRepIncons.template.LoadFromFile ;
      ppRepIncons.Print ;
      ppRepIncons.Stop;

//      ppDesigner1.ShowModal;

      x10:=Self.ComponentCount-1;
      While x10 >= 0 do
        begin
          if Self.Components[x10].ClassName='TppGroup' then
          begin
            Self.Components[x10].Free;
          end;
          x10:=x10-1;
      end;

end;

end.
