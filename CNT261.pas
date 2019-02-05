unit CNT261;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Wwdbdlg, Mask, wwdbedit, wwdblook, ExtCtrls, ppDB,
  ppDBPipe, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppComm,
  ppRelatv, ppProd, ppReport,DB;

type
  TFImpPlanCta = class(TForm)
    ppDBPipeline1: TppDBPipeline;
    pprPlanCtas: TppReport;
    pnlReporte: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label1: TLabel;
    dblcNivel: TwwDBLookupCombo;
    dbeNivel: TwwDBEdit;
    Panel4: TPanel;
    dblcdCtaInic: TwwDBLookupComboDlg;
    dbeCtaInic: TwwDBEdit;
    dblcdCtaFinal: TwwDBLookupComboDlg;
    dbeCtaFinal: TwwDBEdit;
    Z2bbtnRegistra3: TBitBtn;
    Z2bbtnCanc3: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    ppHeaderBand1: TppHeaderBand;
    pplblCia: TppLabel;
    ppLabel6: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel1: TppLabel;
    pplblNivel: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel8: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel9: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel4: TppLabel;
    ppLabel17: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    ppLabel10: TppLabel;
    ppLabel14: TppLabel;
    ppLabel19: TppLabel;
    ppLabel23: TppLabel;
    ppLabel25: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    pplblNivel1: TppLabel;
    ppLabel15: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText13: TppDBText;
    ppFooterBand1: TppFooterBand;
    procedure dblcNivelExit(Sender: TObject);
    procedure dblcdCtaInicChange(Sender: TObject);
    procedure Z2bbtnRegistra3Click(Sender: TObject);
    procedure dblcdCtaFinalChange(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dblcNivelNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImpPlanCta: TFImpPlanCta;

implementation

uses CNTDM;

{$R *.DFM}

procedure TFImpPlanCta.dblcNivelExit(Sender: TObject);
var
   xWhere : string;
   xSQL : String;
begin
   xWhere := 'NIVEL = '+''''+dblcNivel.Text+'''';
   dbeNivel.Text:=DMCNT.DisplayDescrip('PrvTGE','CNT202','DIGITOS',xWhere,'DIGITOS');

    xSQL:='Select * From TGE202 where CIAID ='+''''+dblcCIA.Text+''''+
          ' and CTANIV <='+''''+dblcNivel.Text+''''+
          ' order By CUENTAID';
    DMCNT.cdsCuenta3.Close;
    DMCNT.cdsCuenta3.DataRequest(xSQL);
    DMCNT.cdsCuenta3.Open;

    DMCNT.cdsCuenta3.First;
    dblcdCtaInic.Text:=DMCNT.cdsCuenta3.FieldByName('CUENTAID').AsString;

    DMCNT.cdsCuenta3.Last;
    dblcdCtaFinal.Text:=DMCNT.cdsCuenta3.FieldByName('CUENTAID').AsString;

end;

procedure TFImpPlanCta.dblcdCtaInicChange(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'CUENTAID = '+''''+dblcdCtaInic.Text+'''';
   dbeCtaInic.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE202','CTADES',xWhere,'CTADES');
end;

procedure TFImpPlanCta.Z2bbtnRegistra3Click(Sender: TObject);
var
    xSQL : String;
begin
    xSQL:='Select * From TGE202 where CIAID ='+''''+dblcCIA.Text+''''+
          ' and CTANIV <='+''''+dblcNivel.Text+''''+
          ' and CUENTAID >='+''''+dblcdCtaInic.Text+''''+
          ' and CUENTAID <='+''''+dblcdCtaFinal.Text+''''+
          ' order By CUENTAID';
    DMCNT.cdsCuenta3.Close;
    DMCNT.cdsCuenta3.DataRequest(xSQL);
    DMCNT.cdsCuenta3.Open;

    pplblCia.Caption  :=edtCia.Text;
    pplblNivel.Caption:=dblcNivel.Text;
    pprPlanCtas.Print;
end;

procedure TFImpPlanCta.dblcdCtaFinalChange(Sender: TObject);
var
   xWhere : string;
begin
   xWhere := 'CUENTAID = '+''''+dblcdCtaFinal.Text+'''';
   dbeCtaFinal.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE202','CTADES',xWhere,'CTADES');
end;

procedure TFImpPlanCta.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DMCNT.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   end;
end;

procedure TFImpPlanCta.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFImpPlanCta.FormShow(Sender: TObject);
begin
  edtCia.enabled:=False;
  DMCNT.cdsCia.First;
  if DMCNT.cdsCia.RecordCount=1 then
  begin
    dblcCia.text:=DMCNT.cdsCia.FieldByName('CIAID').Asstring;
    edtCia.text:=DMCNT.cdsCia.FieldByName('CIADES').Asstring;
    dblcCia.enabled:=False;
    dblcNivel.SetFocus;
  end
  else
  begin
    dblcCia.text:='';
    edtCia.text:='';
    dblcCia.enabled:=True;
    dblcCia.SetFocus
  end;

end;

procedure TFImpPlanCta.dblcNivelNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
	if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
	Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.
