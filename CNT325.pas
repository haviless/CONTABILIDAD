unit CNT325;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Mask, wwdbedit;

type
  TFCompara46vs16 = class(TForm)
    dbgData: TwwDBGrid;
    pnlTool46vs16: TPanel;
    pnlReportes: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCompara46vs16: TFCompara46vs16;

implementation

uses CNT318, CNTDM;

{$R *.dfm}

procedure TFCompara46vs16.FormCreate(Sender: TObject);
var
   xSQL, xAnoMes, xMes : String;
begin
   xMes := FBalGeneral.speMM.Text;
   If StrToInt(FBalGeneral.speMM.Text) <= 9 Then
      xMes := '0' + inttostr(StrToInt(FBalGeneral.speMM.Text));
   xAnoMes := FBalGeneral.speAno.Text + xMes;

   xSQL := 'select A.CIAID, B.CIADES, '
          +'       max(CIA16) CIA16, max(CTA16) CTA16, sum(DEBE16) DEBE16, sum(HABER16) HABER16, '
          +'       max(CIA46) CIA46, max(CTA46) CTA46, sum(DEBE46) DEBE46, sum(HABER46) HABER46, '
          +'       abs(sum(DEBE16)-sum(HABER16)) - abs(sum(DEBE46)-sum(HABER46)) DIFER '
          +'from ( '
          +'select substr(CUENTAID,4,2) CIAID, CIAID CIA16, CUENTAID CTA16, sum(CNTDEBEMN) DEBE16, sum(CNTHABEMN) HABER16, '
          +'                                   ''  '' CIA46, ''     '' CTA46, 0.00 DEBE46, 0.00 HABER46 '
          +'  from CNT301 '
          +' where CIAID=''02'' '
          +'   and CNTANOMM='+quotedstr(xAnoMes)
          +'   and (CUENTAID like ''166%'') '
          +'group by CIAID, CUENTAID '
          +'union all '
          +'select CIAID, ''  '' CIA16, ''     '' CTA16, 0.00 DEBE16, 0.00 HABER16, '
          +'                    CIAID CIA46, CUENTAID CTA46, sum(CNTDEBEMN) DEBE46, sum(CNTHABEMN) HABER46 '
          +'  from CNT301 '
          +' where CIAID<>''01'' and CIAID<>''02'' '
          +'   and CNTANOMM='+quotedstr(xAnoMes)
          +'   and CUENTAID like ''46602%'' '
          +'group by CIAID, CUENTAID '
          +') A, TGE101 B '
          +'where B.CIAID=A.CIAID '
          +'group by A.CIAID, B.CIADES '
          +'order by A.CIAID ';
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   dbgData.DataSource := DMCNT.dsQry2;
   dbgData.Selected.Clear;
   dbgData.Selected.Add('CIAID'#9'8'#9'Compañía'#9'F');
   dbgData.Selected.Add('CIADES'#9'8'#9'Nombre de Compañía'#9'F');

   dbgData.Selected.Add('CIA16'#9'6'#9'Cía 16'#9'F');
   dbgData.Selected.Add('CTA16'#9'8'#9'Cuenta 16'#9'F');
   dbgData.Selected.Add('DEBE16'#9'12'#9'Imp.Debe Cta16'#9'F');
   dbgData.Selected.Add('HABER16'#9'12'#9'Imp.Haber Cta16'#9'F');

   dbgData.Selected.Add('CIA46'#9'6'#9'Cía 46'#9'F');
   dbgData.Selected.Add('CTA46'#9'8'#9'Cuenta 46'#9'F');
   dbgData.Selected.Add('DEBE46'#9'12'#9'Imp.Debe Cta46'#9'F');
   dbgData.Selected.Add('HABER46'#9'12'#9'Imp.Haber Cta46'#9'F');

   dbgData.Selected.Add('DIFER'#9'12'#9'Diferencia'#9'F');

end;

end.
