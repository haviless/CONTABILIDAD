unit CNT295;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls, Mask, wwdbedit,
  wwdbdatetimepicker, Buttons;

type
  TFLiqDet = class(TForm)
    Panel1: TPanel;
    dbgLiqDet: TwwDBGrid;
    Label2: TLabel;
    dbeNoOfi: TwwDBEdit;
    Label3: TLabel;
    dbeEquipo: TwwDBEdit;
    Label5: TLabel;
    dbeFecha: TwwDBEdit;
    Label6: TLabel;
    dbeUsuario: TwwDBEdit;
    Label1: TLabel;
    dbeMoneda: TwwDBEdit;
    dbeMonto: TwwDBEdit;
    Label4: TLabel;
    dbeNoLiq: TwwDBEdit;
    Label7: TLabel;
    dbeCodUsu: TwwDBEdit;
    pnlCNT: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    dbeEstRen: TwwDBEdit;
    Label10: TLabel;
    dbeUsuCon: TwwDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    dbeEstCon: TwwDBEdit;
    dtpFecCon: TwwDBDateTimePicker;
    bbtnCNT: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure dbgLiqDetDblClick(Sender: TObject);
    procedure bbtnCNTClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLiqDet: TFLiqDet;

implementation

{$R *.dfm}

USES CNTDM, CNT296, CNT293;

procedure TFLiqDet.FormActivate(Sender: TObject);
var
   xSQL : String;
   dProvisionado, dRendicion : Double;
begin
   dbeNoOfi.DataSource  :=DMCNT.dsCNT311;
   dbeEquipo.DataSource :=DMCNT.dsCNT311;
   dbeFecha.DataSource  :=DMCNT.dsCNT311;
   dbeUsuario.DataSource:=DMCNT.dsCNT311;
   dbeMoneda.DataSource :=DMCNT.dsCNT311;
   dbeMonto.DataSource  :=DMCNT.dsLiqCon;
   dbeNoLiq.DataSource  :=DMCNT.dsLiqCon;
   dbeCodUsu.DataSource :=DMCNT.dsLiqCon;
   dbeEstRen.DataSource :=DMCNT.dsLiqCon;
   dtpFecCon.DataSource :=DMCNT.dsLiqCon;
   dbeUsuCon.DataSource :=DMCNT.dsLiqCon;
   dbeEstCon.DataSource :=DMCNT.dsLiqCon;

   dbgLiqDet.DataSource:=DMCNT.dsLiqDet;

   xSQL:='Select * from CNT_LIQ_DET '
        +'Where NUMLIQ='''+DMCNT.cdsLiqCon.FieldByName('NUMLIQ').AsString+''' '
        +  'and ANOLIQ='''+DMCNT.cdsLiqCon.FieldByName('ANOLIQ').AsString+''' '
        +'ORDER BY NUMLIQ';
   DMCNT.cdsLiqDet.Close;
   DMCNT.cdsLiqDet.DataRequest( xSQL );
   DMCNT.cdsLiqDet.Open;

   dProvisionado:=DMCNT.FRound(DMCNT.OperClientDataSet(DMCNT.cdsLiqDet,'SUM(IMPORTE)',''),15,2);
   dRendicion   :=DMCNT.FRound(DMCNT.OperClientDataSet(DMCNT.cdsLiqDet,'SUM(RENDICION)',''),15,2);

   dbgLiqDet.ColumnByName('IMPORTE').FooterValue  :=FloatToStrF(dProvisionado,ffNumber,15,2);
   dbgLiqDet.ColumnByName('RENDICION').FooterValue:=FloatToStrF(dRendicion,ffNumber,15,2);
end;

procedure TFLiqDet.dbgLiqDetDblClick(Sender: TObject);
var
   dRendicion : Double;
begin
  if DMCNT.cdsLiqCon.FieldByName('ESTCONREN').AsString='S' then
  begin
     ShowMessage('Rendición ya fue Contabilizada. NO se pueden hacer cambios.');
     Exit;
  end;

  try
     FRendicion:= TFRendicion.Create(self);
     FRendicion.ShowModal;
  finally
     FRendicion.Free;
     dRendicion   :=DMCNT.FRound(DMCNT.OperClientDataSet(DMCNT.cdsLiqDet,'SUM(RENDICION)',''),15,2);
     dbgLiqDet.ColumnByName('RENDICION').FooterValue:=FloatToStrF(dRendicion,ffNumber,15,2);
  end;
end;

procedure TFLiqDet.bbtnCNTClick(Sender: TObject);
var
  xSQL : String;
begin
  xSQL:='SELECT * FROM TGE154 '
       +'WHERE CIAID=''02'' AND ANO='+quotedstr(Copy(DateToStr(dtpFecCon.Date),7,4));
  DMCNT.cdsCierres.close;
  DMCNT.cdsCierres.datarequest(xsql);
  DMCNT.cdsCierres.open;

  if DMCNT.cdsCierres.FieldByName('PER'+Copy(DateToStr(dtpFecCon.Date),4,2)).AsString = 'S' then
  begin
  	 Showmessage('El periodo se encuentra Cerrado');
     dtpFecCon.setfocus;
     exit;
  end
  else
  begin
  	if dtpFecCon.date=0 then
    begin
    	ShowMessage('Registre la Fecha de Contabilización');
      dtpFecCon.SetFocus;
      exit;
    end;
  end;

  FLiquidacion.ContabilizaRendicion;

end;

end.
