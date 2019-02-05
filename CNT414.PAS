unit CNT414;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Spin, StdCtrls, Buttons, ExtCtrls, wwdblook, ppVar, ppCtrls, ppPrnabl,
  ppClass, ppBands, ppProd, ppReport, ppComm, ppRelatv, ppCache, ppDB,
  ppDBPipe, ppStrtch, ppSubRpt, ppRegion, ppviewr, ppModule, daDatMod;

type
  TFBalanceG = class(TForm)
    Panel1: TPanel;
    lblCia: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    rgMoneda: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    seMes: TSpinEdit;
    seAno: TSpinEdit;
    dblcNivel: TwwDBLookupCombo;
    dblcGrupo: TwwDBLookupCombo;
    ppdbRCuenta: TppDBPipeline;
    pprBalanceG: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
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
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppVariable1: TppVariable;
    ppdbtCuenta: TppDBText;
    ppdbtCtaDes: TppDBText;
    ppdbtMontoL: TppDBText;
    ppdbtMontoE: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppdbtGrupo: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppdbtSubGrupo: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppdbtRelaDes: TppDBText;
    ppdbcTMontoMN: TppDBCalc;
    ppdbcTMontoME: TppDBCalc;
    ppdbcTSGMN: TppDBCalc;
    ppdbcTSGME: TppDBCalc;
    ppdbcTGMN: TppDBCalc;
    ppdbcTGME: TppDBCalc;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppdbtGrupo2: TppDBText;
    ppdbtSubGrupo2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppvUtilMN: TppVariable;
    ppvUtilME: TppVariable;
    ppdbtCia: TppDBText;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel9: TppLabel;
    ppdbcTBalMN: TppDBCalc;
    ppdbcTBalME: TppDBCalc;
    ppvPasivoMN: TppVariable;
    ppvPasivoME: TppVariable;
    ppLine2: TppLine;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppdbtSSubGrupo: TppDBText;
    ppLabel8: TppLabel;
    ppDBText3: TppDBText;
    ppdbcTSSGMN: TppDBCalc;
    ppdbcTSSGME: TppDBCalc;
    edtGrupo: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcGrupoExit(Sender: TObject);
    procedure dblcNivelExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ppvUtilMNCalc(Sender: TObject; var Value: Variant);
    procedure ppvUtilMECalc(Sender: TObject; var Value: Variant);
    procedure ppvPasivoMNCalc(Sender: TObject; var Value: Variant);
    procedure ppvPasivoMECalc(Sender: TObject; var Value: Variant);
    procedure ppvCiaCalc(Sender: TObject; var Value: Variant);
    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);
    procedure pprBalanceGBeforePrint(Sender: TObject);
    procedure pprBalanceGPreviewFormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBalanceG: TFBalanceG;
  xTitFecha, xNivel : String;
  xWhere            : String;
  xTotDif           : Real;
  xCiaDes           : String;
implementation
{$R *.DFM}

uses CNTDM;

procedure TFBalanceG.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DM1.cdsCiaCiaDes.Text;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   end;
end;

procedure TFBalanceG.dblcGrupoExit(Sender: TObject);
begin
   edtGrupo.Text:='';
   if dblcGrupo.Text<>'' then edtGrupo.Text:=DM1.cdsGrupTDiarGrupoTDiarDes.Text;
   if length(dblcGrupo.Text)=0 then
   begin
      ShowMessage('Falta Definición de Grupo de Diarios');
      dblcGrupo.SetFocus;
   end;
end;

procedure TFBalanceG.dblcNivelExit(Sender: TObject);
begin
   If Length(dblcNivel.Text)=0 then begin
      dblcNivel.SetFocus;
      Raise Exception.Create('Error : Falta Registrar Nivel de Cuenta');
   end;

   xWhere := 'Nivel='+''''+dblcNivel.Text+'''';
   xNivel := IntToStr( DM1.displayInteger('prvCNT','CNT202','*',xWhere,'Digitos') );
   xNivel := DM1.StrZero( xNivel, 2 );

end;

procedure TFBalanceG.BitBtn2Click(Sender: TObject);
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
   DM1.cdsRelGTDiar.Filter:='CIAID='+dblcCia.Text+' and GRUPOTDIARID='+dblcGrupo.Text;
   DM1.cdsRelGTDiar.Filtered:=True;
   DM1.cdsRelGTDiar.First;
   if (DM1.cdsRelGTDiar.Eof) then
   raise exception.Create('Grupo de Relación sin Tipos de Diario... registre');


   xMes := DM1.strzero( seMes.Text,2);

   xTitFecha := 'Mes de '+DM1.NombreMes( seMes.Text)+' de '+seAno.Text;


   // Actuliza con Cero todos los Registros que tengan Null

   xTSql := 'Update CNT401 '
          + 'Set SALDMN'+xMes+'=0 '
          + 'Where ANO='+''''+seAno.Text+''''+' and '
          + 'SALDMN'+xMes+' is NULL';

   DM1.DCOM1.AppServer.EjecutaQry(xTSQL);   // Borra

   xTSql := 'Update CNT401 '
          + 'Set SALDME'+xMes+'=0 '
          + 'Where ANO='+''''+seAno.Text+''''+' and '
          + 'SALDME'+xMes+' is NULL';

   DM1.DCOM1.AppServer.EjecutaQry(xTSQL);   // Borra

   //

   xTSql := 'Select Data1.CIAID, Data5.CUENTAID, Data5.CTA_BAL, Data1.CTADES, '
          + 'Data2.RELADES, Data7.RELADES as SSUBGRUPO, Data6.RELADES as SUBGRUPO, '
          + 'Data4.RELADES as GRUPO, ';

   xMontoMN := 'sum( SALDMN'+xMes+' + DEBEMN'+xMes+' - HABEMN'+xMes+' ) as MONTOMN, ';
   xMontoME := 'sum( SALDME'+xMes+' + DEBEME'+xMes+' - HABEME'+xMes+' ) as MONTOME ';

//   xMontoMN := 'sum( DEBEMN'+xMes+' - HABEMN'+xMes+' ) as MontoMN, ';
//   xMontoME := 'sum( DEBEME'+xMes+' - HABEME'+xMes+' ) as MontoME ';

   xFrom    := 'from CNT401 Data1, CNT203 Data3, TGE202 Data5, '
             + 'CNT205 Data2, CNT205 Data4, CNT205 Data6 , CNT205 Data7 ';

            // Cnt401 = Data1 = Resultados de Cuentas
            // Cnt203 = Data3 = Grupos
            // TGE202 = Data5 = Plan de Cuentas
            // Cnt205 = Data4 = Relación  Grupo
            // Cnt205 = Data6 = Relación  SubGrupo
            // Cnt205 = Data7 = Relación  SSubGrupo
            // Cnt205 = Data2 = Relación  Detalle

   xWhere := 'where '
           + 'Data1.CIAID='+''''+dblcCia.Text  +''''+' and '

           + 'Data3.CIAID='       +''''+dblcCia.Text  +''''+' and '
           + 'Data3.GRUPOTDIARID='+''''+dblcGrupo.Text+''''+' and '
           + 'Data3.TDIARID=Data1.TDIARID and '

           + 'Data5.CIAID='       +''''+dblcCia.Text  +''''+' and '
           + 'Data5.CUENTAID=Data1.CUENTAID and '

           + 'Data2.RELACIONID=Data5.CTA_BAL and '

           + 'Data4.RELACIONID=SubStr(Data5.CTA_BAL,1,4) and '

           + 'Data6.RELACIONID=SubStr(Data5.CTA_BAL,1,6) and '

           + 'Data7.RELACIONID=SubStr(Data5.CTA_BAL,1,8) and '

           + 'Data1.ANO='   +''''+seAno.Text+''''+' and '
           + 'Data1.TIPO='  +''''+xNivel+''''+' ';

   xGroup := 'Group by Data1.CIAID, Data5.CUENTAID, Data5.CTA_BAL, Data1.CTADES, '
           + 'Data2.RELADES, Data7.RELADES, Data6.RELADES, Data4.RELADES ';

   xOrder := 'order by Data1.CIAID, Data5.CTA_BAL, Data5.CUENTAID ';

   xTSQL := xTSQL + xMontoMN + xMontoME + xFrom + xWhere + xGroup + xOrder;

   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName := 'prvCNT';
   DM1.cdsQry.DataRequest(xTSQL);
   DM1.cdsQry.Open;

   pprBalanceG.print;

end;

procedure TFBalanceG.ppvUtilMNCalc(Sender: TObject; var Value: Variant);
begin
    Value := 0;
    If DM1.FRound(ppdbcTBalMN.Value,15,2) <> 0 Then
       Value := (-1) * ppdbcTBalMN.Value;
end;

procedure TFBalanceG.ppvUtilMECalc(Sender: TObject; var Value: Variant);
begin
    Value := 0;
    If DM1.FRound(ppdbcTBalME.Value,15,2) <> 0 Then
       Value := (-1) * ppdbcTBalME.Value;
end;

procedure TFBalanceG.ppvPasivoMNCalc(Sender: TObject; var Value: Variant);
begin
    Value := ppdbcTGMN.Value + ppvUtilMN.Value;
end;

procedure TFBalanceG.ppvPasivoMECalc(Sender: TObject; var Value: Variant);
begin
    Value := ppdbcTGME.Value + ppvUtilME.Value;
end;

procedure TFBalanceG.ppvCiaCalc(Sender: TObject; var Value: Variant);
begin
   Value := xCiaDes;
end;

procedure TFBalanceG.ppVariable1Calc(Sender: TObject; var Value: Variant);
begin
   Value := xTitFecha;
end;

procedure TFBalanceG.pprBalanceGBeforePrint(Sender: TObject);
begin
   If Copy(DM1.cdsQry.FieldByName( 'CTA_BAL' ).Value,3,2 ) = '' then begin
      ppGroupHeaderBand2.Visible := False;
      ppGroupFooterBand2.Visible := False;
   end;
   If Copy(DM1.cdsQry.FieldByName( 'CTA_BAL' ).Value,5,2 ) = '' then begin
      ppGroupHeaderBand1.Visible := False;
      ppGroupFooterBand1.Visible := False;
   end;
   If Copy(DM1.cdsQry.FieldByName( 'CTA_BAL' ).Value,7,2 ) = '' then begin
      ppGroupHeaderBand5.Visible := False;
      ppGroupFooterBand5.Visible := False;
   end;
   If Copy(DM1.cdsQry.FieldByName( 'CTA_BAL' ).Value,9,2 ) = '' then begin
      ppGroupHeaderBand3.Visible := False;
      ppGroupFooterBand3.Visible := False;
   end;
end;

procedure TFBalanceG.pprBalanceGPreviewFormCreate(Sender: TObject);
begin
   pprBalanceG.PreviewForm.WindowState:=WsMaximized;
   TppViewer(pprBalanceG.PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
end;

procedure TFBalanceG.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

end.
