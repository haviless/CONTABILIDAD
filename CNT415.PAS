unit CNT415;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Spin, StdCtrls, Buttons, ExtCtrls, wwdblook, ppDB, ppBands, ppClass,
  ppProd, ppReport, ppComm, ppRelatv, ppCache, ppDBPipe, ppPrnabl, ppCtrls,
  ppVar,ppviewr;

type
  TFGanPer = class(TForm)
    Panel1: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    rgMoneda: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ppdbRelacion: TppDBPipeline;
    pprGanPer: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppdbtCuenta: TppDBText;
    ppdbtCtaDes: TppDBText;
    ppdbtMontoL: TppDBText;
    ppdbtMontoE: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBRelDes: TppDBPipeline;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppdbtTotal: TppDBText;
    ppdbtRelacion: TppDBText;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppdbtTitulo: TppDBText;
    ppvCia: TppVariable;
    ppLabel75: TppLabel;
    ppLine15: TppLine;
    ppLabel76: TppLabel;
    ppLine16: TppLine;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel81: TppLabel;
    ppLabel84: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppLabel85: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppLabel86: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppVariable1: TppVariable;
    Label5: TLabel;
    Label2: TLabel;
    seAno: TSpinEdit;
    seMes: TSpinEdit;
    Label1: TLabel;
    Label4: TLabel;
    dblcGrupo: TwwDBLookupCombo;
    edtGrupo: TEdit;
    Label3: TLabel;
    dblcNivel: TwwDBLookupCombo;
    procedure BitBtn2Click(Sender: TObject);
    procedure ppvRelacionCalc(Sender: TObject; var Value: Variant);
    procedure dblcCiaExit(Sender: TObject);
    procedure ppvCiaCalc(Sender: TObject; var Value: Variant);
    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);
    procedure dblcNivelExit(Sender: TObject);
    procedure pprGanPerPreviewFormCreate(Sender: TObject);
    procedure dblcGrupoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGanPer           : TFGanPer;
  xTitFecha, xNivel : String;
  xWhere            : String;

implementation
{$R *.DFM}

uses CNTDM;

procedure TFGanPer.BitBtn2Click(Sender: TObject);
var
   xmes : String;
   xtsql, xfrom, xmontomn, xmontome, xGroup, xorder : string;
begin

   If Length(dblcCia.Text)=0 then begin
      dblcCia.SetFocus;
      Raise Exception.Create('Error : Falta Registrar Compañía');
   end;
   If Length(seMes.Text)=0 then begin
      dblcCia.SetFocus;
      Raise Exception.Create('Error : Falta Registrar Mes');
   end;
   If Length(seAno.Text)=0 then begin
      dblcCia.SetFocus;
      Raise Exception.Create('Error : Falta Registrar Año');
   end;
   If Length(dblcNivel.Text)=0 then begin
      dblcCia.SetFocus;
      Raise Exception.Create('Error : Registrar Nivel');
   end;

   xMes := DM1.strzero( seMes.Text,2);

   xTitFecha := 'Mes de '+DM1.NombreMes( seMes.Text)+' de '+seAno.Text;

   xTSql := 'Select Data1.CIAID, Data5.CUENTAID, Data5.CTA_GYP, Data1.Ctades, '
          + 'Data2.RELADES, Data4.RELADES as Grupo, ';


   xMontoMN := 'sum( SaldMN'+xMes+' + DebeMN'+xMes+' + HabeMN'+xMes+' ) as MontoMN, ';
   xMontoME := 'sum( SaldME'+xMes+' + DebeME'+xMes+' + HabeME'+xMes+' ) as MontoME ';

   xMontoMN := 'sum( DebeMN'+xMes+' - HabeMN'+xMes+' ) as MontoMN, ';
   xMontoME := 'sum( DebeME'+xMes+' - HabeME'+xMes+' ) as MontoME ';

   xFrom    := 'from CNT401 Data1, CNT203 Data3, TGE202 Data5, '
             + 'CNT204 Data2, CNT204 Data4';

            // Cnt401 = Data1 = Resultados de Cuentas
            // Cnt203 = Data3 = Grupos
            // TGE202 = Data5 = Plan de Cuentas
            // Cnt204 = Data2 = Relación
            // Cnt204 = Data4 = Relación
            // Cnt204 = Data6 = Relación

   xWhere := 'where '
           + 'Data1.CIAID='+''''+dblcCia.Text  +''''+' and '

           + 'Data3.CIAID='       +''''+dblcCia.Text  +''''+' and '
           + 'Data3.GrupoTDiarID='+''''+dblcGrupo.Text+''''+' and '
           + 'Data3.TDIARID=Data1.TDIARID and '

           + 'Data5.CIAID='       +''''+dblcCia.Text  +''''+' and '
           + 'Data5.CUENTAID=Data1.CUENTAID and '

           + 'Data2.CIAID='       +''''+dblcCia.Text  +''''+' and '
           + 'Data2.RelacionID=Data5.CTA_GYP and '

           + 'Data4.CIAID='       +''''+dblcCia.Text  +''''+' and '
           + 'Data4.RelacionID=SubStr(Data5.CTA_GYP,1,2) and '

           + 'Data1.ANO='   +''''+seAno.Text+''''+' and '
           + 'Data1.tipo='  +''''+xNivel+''''+' ';

   xGroup := 'Group by Data1.CIAID, Data5.CUENTAID, Data5.CTA_GYP, '
           + 'Data1.CTADES, Data2.RELADES, Data4.RELADES ';

   xOrder := 'order by Data1.CIAID,Data5.CUENTAID ';

   xTSQL := xTSQL + xMontoMN + xMontoME + xFrom + xWhere + xGroup + xOrder;

   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName := 'prvCNT';
   DM1.cdsQry.DataRequest(xTSQL);
   DM1.cdsQry.Open;

   pprGanPer.print;
end;

procedure TFGanPer.ppvRelacionCalc(Sender: TObject; var Value: Variant);
begin
   Value := Copy( dm1.cdsQry.FieldByName('RELACIONID').Value,1,2);
end;

procedure TFGanPer.dblcCiaExit(Sender: TObject);
begin

   If Length(dblcCia.Text)=0 then begin
      dblcCia.SetFocus;
      Raise Exception.Create('Error : Falta Registrar Compañía');
   end;

   xWhere := 'CIAID = '+''''+dblcCia.Text+'''';
   edtCia.Text:=DM1.displaydescrip('PrvTGE','TGE101','*',xWhere,'CIAABR');

end;

procedure TFGanPer.ppvCiaCalc(Sender: TObject; var Value: Variant);
begin
   Value := edtCia.Text;
end;

procedure TFGanPer.ppVariable1Calc(Sender: TObject; var Value: Variant);
begin
   Value := xTitFecha;
end;

procedure TFGanPer.dblcNivelExit(Sender: TObject);
begin
   If Length(dblcNivel.Text)=0 then begin
      dblcNivel.SetFocus;
      Raise Exception.Create('Error : Falta Registrar Nivel de Cuenta');
   end;

   xWhere := 'Nivel='+''''+dblcNivel.Text+'''';
   xNivel := IntToStr( DM1.displayInteger('prvCNT','CNT202','*',xWhere,'Digitos') );
   xNivel := DM1.StrZero( xNivel, 2 );
end;

procedure TFGanPer.pprGanPerPreviewFormCreate(Sender: TObject);
begin
   pprGanPer.PreviewForm.WindowState:=WsMaximized;
   TppViewer(pprGanPer.PreviewForm.Viewer).ZoomSetting:=zsPagewidth;

end;

procedure TFGanPer.dblcGrupoExit(Sender: TObject);
begin
   edtGrupo.Text:='';
   if dblcGrupo.Text<>'' then edtGrupo.Text:=DM1.cdsGrupTDiarGrupoTDiarDes.Text;
   if length(dblcGrupo.Text)=0 then
   begin
      ShowMessage('Falta Definición de Grupo de Diarios');
      dblcGrupo.SetFocus;
   end;
end;

procedure TFGanPer.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

end.
