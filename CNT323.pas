unit CNT323;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, wwdbedit, wwdblook, ExtCtrls, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppCache, ppDBPipe, Spin,mant, Wwdbdlg;

type
  TFToolSaldos = class(TForm)
    ppdbComprob: TppDBPipeline;
    pprComprob: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel10: TppLabel;
    ppLabel23: TppLabel;
    ppLabel11: TppLabel;
    ppLabel14: TppLabel;
    ppLabel26: TppLabel;
    ppLabel24: TppLabel;
    ppLabel27: TppLabel;
    ppLabel38: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel43: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel44: TppLabel;
    ppLabel25: TppLabel;
    ppLabel41: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel20: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppLabel21: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    pplblCia: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    pplblFecha: TppLabel;
    pplblPeriodo: TppLabel;
    pplblTcam: TppLabel;
    pplblDiario: TppLabel;
    pplblComp: TppLabel;
    pplblLote: TppLabel;
    pplblTmon: TppLabel;
    pplblEstado: TppLabel;
    ppLabel12: TppLabel;
    ppDBText5: TppDBText;
    ppDBText3: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBText11: TppDBText;
    ppLabel17: TppLabel;
    pplblglosa: TppLabel;
    lblperiodo: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText9: TppDBText;
    ppDBText25: TppDBText;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppDBText10: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel18: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel19: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText99: TppDBText;
    ppLabel13: TppLabel;
    ppLabel7: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBText12: TppDBText;
    PnlSaldos: TPanel;
    Label1: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dbecuenta: TwwDBEdit;
    speAno: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    Z2bbtnCanc3: TBitBtn;
    dblcdCodigo: TwwDBLookupComboDlg;
    z2bbtnAceptar: TBitBtn;
    procedure dblcCiaExit(Sender: TObject);
    procedure dblctdiarioExit(Sender: TObject);
    procedure Z2bbtnRegistra3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z1sbInformesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure z2bbtnAceptarClick(Sender: TObject);
    procedure dblcdCodigoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    xperiodo:string;
//    procedure PegaToolEstadistica (Sender: TObject);
  public
    { Public declarations }
    GSaldos : TMant;
    xtcciaid,xtccuenta,xtano,restado:string;
    // vhn
    sCiaOrigen : String;
    sCiaCuenta : String;
  end;

var
  FToolSaldos: TFToolSaldos;

implementation

uses CNTDM, oaCN3000;

{$R *.DFM}

procedure TFToolSaldos.dblcCiaExit(Sender: TObject);
var
sql:string;
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then
   begin
      dblcdCodigo.enabled:=true;
      dblcdCodigo.setfocus;
      edtCia.Text:=DMCNT.cdsCia.FieldByName('CIADES').AsString;
   end;

   if length(edtCia.Text)<>0 then
   begin
     Screen.Cursor:= crHourGlass;
     sql:='SELECT CIAID, CUENTAID, CTADES FROM TGE202 '
         +'WHERE CIAID='''+dblcCia.text+''' '
         +'ORDER BY CUENTAID ';
     DMCNT.cdsCuenta.fetchondemand:=False;
     DMCNT.cdsCuenta.packetrecords:=-1;
     DMCNT.cdsCuenta.fetchondemand:=True;
     DMCNT.Filtracds(DMCNT.cdsCuenta,SQL);

     sCiaCuenta:=DMCNT.FiltraTablaxCia( DMCNT.cdsCuenta,  'TGE202', 'CUENTAID', dblcCia.Text );

     Screen.Cursor:=CrDefault;

     dblcdCodigo.Selected.Clear;
     dblcdCodigo.Selected.Add('CUENTAID'#9'10'#9'Código'#9'F');
     dblcdCodigo.Selected.Add('CTADES'#9'30'#9'Descripción'#9'F');
  end;

end;

{procedure TFToolSaldos.PegaToolEstadistica(Sender: TObject);
var
   cb, cl : TPanel ;
begin
   cb := FToolEstadistica.PnlEstadistica ;
   cl:= TMant(Sender).FMant.pnlBtns ;
   cb.Parent   := TMant(Sender).FMant.pnlBtns ;
   cl.Height := cb.Height+5;
   cb.Align    := alClient ;
   cl.AutoSize := True ;
   TMant(Sender).FMant.pnlBtns.Visible  := True;
end;

 }
procedure TFToolSaldos.dblctdiarioExit(Sender: TObject);
begin
{   if dblctdiario.Text<>'' then dbetdiario.Text:=DMCNT.cdsTDiario.FieldByName('TDIARDES').AsString;

   if length(dbetdiario.Text)=0 then
   begin
      dblctdiario.setfocus;
      raise exception.Create('Falta registrar el Tipo de Diario');
   end;}

end;

procedure TFToolSaldos.Z2bbtnRegistra3Click(Sender: TObject);
var
xsql:string;
x10:integer;
begin
{      if length(dblcCia.text)=0 then
      begin
        dblcCia.setfocus;
        raise exception.Create('Falta registrar la Compañía');
      end;

      if length(dblctdiario.text)=0 then
      begin
        dblctdiario.setfocus;
        raise exception.Create('Falta registrar el tipo de Diario');
      end;

      if length(edtCompIni.text)=0 then
      begin
        edtCompIni.setfocus;
        raise exception.Create('Falta registrar el Comprobante Inicial');
      end;

      if length(edtCompFin.text)=0 then
      begin
        edtCompFin.setfocus;
        raise exception.Create('Falta registrar el Comprobante Final');
      end;
{      if (length(edtperiodo.text)<7)  or (length(edtperiodo.text)>7) then
      begin
        edtCompFin.setfocus;

        raise exception.Create('Debe registar corectamente el Periodo');
      end;}


  {   xSQL:= 'SELECT CNTREG,CIAID,CUENTAID,CNTMTOORI,CNTFVCMTO,CNTFEMIS,CNTGLOSA,CNTDH, '
           + 'AUXID,CLAUXID,DOCID,CNTSERIE,CNTNODOC,CCOSID,CNTDEBEMN,CNTDEBEME, '
           + 'CNTHABEMN,CNTHABEME,TDIARID,CNTCUADRE,CNTESTADO,CNTCOMPROB,CNTMTOLOC, '
           + 'CNTMTOEXT,CTADES,AUXDES,DOCDES,CCOSDES,TDIARDES,CNTANO,CNTANOMM, '
           + 'CNTLOTE,CNT301.TMONID,CNTTCAMBIO,CNTTS,CNTMODDOC,CNTFCOMP,CNTUSER,CNTFREG, '
           + 'CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTLOTE,CNTAATRI,CNTAASEM,CNTAASS, CNTFAUTOM,TMONDES '
           + 'FROM CNT301, TGE103 WHERE '
           + 'CNT301.TMONID=TGE103.TMONID AND '
           + ' CIAID='''+dblcCia.text+''' AND TDIARID='''+dblctdiario.text
           + ''' AND CNTANOMM='''+periodo+''' AND CNTCOMPROB >='+''''+edtCompIni.Text+''''
           + ' and CNTCOMPROB <='+''''+edtCompFin.Text+''''
           +' ORDER BY CNTCOMPROB' ;

      DMCNT.cdsMovCnt1.Close;
      DMCNT.cdsMovCnt1.DataRequest(xSQL);
      DMCNT.cdsMovCnt1.Open;

      if DMCNT.cdsMovCnt1.recordcount=0 then
         raise exception.Create('No existen registros para la consulta');

      pprComprob.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\Comprobante.rtm';
      pprComprob.template.LoadFromFile ;

      DMCNT.cdsMovCnt1.indexfieldnames:='CNTCOMPROB';
      pprComprob.Print;
      pprComprob.Stop;

      x10:=self.componentCount-1;
      while x10>0 do begin
        if self.components[x10].classname='TppGroup' then begin
           self.components[x10].free;
        end;
        x10:=x10-1;
      end;

      DMCNT.cdsMovCnt1.indexfieldnames:='';

 }

 {   xSQL:='Select * From TGE202 where CIAID ='+''''+dblcCIA.Text+''''+
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
}
end;

procedure TFToolSaldos.FormActivate(Sender: TObject);
var
  xAno, xMes, xDia : Word;
begin
  DecodeDate(Date, xAno, xMes, xDia);
  speAno.Value:=xAno;
end;

procedure TFToolSaldos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFToolSaldos.Z1sbInformesClick(Sender: TObject);
var
reporte,xsql,periodo,xwhere,mesdes,mes,ano:string;
x10:integer;
Begin
       if length(dblcCia.text)=0 then
      begin
        dblcCia.setfocus;
        raise exception.Create('Falta registrar la Compañía');
      end;

      if length(dbecuenta.text)=0 then
      begin
        dbecuenta.setfocus;
        raise exception.Create('Falta registrar la cuenta');
      end;
      if length(speano.text)=0  then
      begin
        speano.setfocus;
        raise exception.Create('Debe registar el Año');
      end;

Reporte:='select CIAID,CUENTAID,ANO,''ENERO'' MES,''01'' NUMERO,SALDMN00 SALDANT,DEBEMN01 DEBE, '
          +' HABEMN01 HABE,SALDMN01 SALDFIN '
          +' from cnt401 where ciaid='''+dblcCia.text+''' and nvl(clauxid,''nulo'')=''nulo'' and nvl(auxid,''nulo'')=''nulo'' '
          +' and nvl(ccosid,''nulo'')=''nulo'' and cuentaid='''+dbecuenta.text+''' and ANO='''+speano.text+''''
          +' union '

          +' select  CIAID,CUENTAID,ANO,''FEBRERO'' MES,''02'' NUMERO,SALDMN01 SALDANT ,DEBEMN02 DEBE, '
          +' HABEMN02  HABE,SALDMN02 SALDFIN '
          +' from cnt401 where ciaid='''+dblcCia.text+''' and nvl(clauxid,''nulo'')=''nulo'' and nvl(auxid,''nulo'')=''nulo'' '
          +' and nvl(ccosid,''nulo'')=''nulo'' and cuentaid='''+dbecuenta.text+''' and ANO='''+speano.text+''''
          +' UNION '

          +' select  CIAID,CUENTAID,ANO,''MARZO'' MES,''03'' NUMERO, SALDMN02 SALDANT,DEBEMN03 DEBE, '
          +' HABEMN03 HABE,SALDMN03  SALDFIN '
          +' from cnt401 where ciaid='''+dblcCia.text+''' and nvl(clauxid,''nulo'')=''nulo'' and nvl(auxid,''nulo'')=''nulo'''
          +' and nvl(ccosid,''nulo'')=''nulo'' and cuentaid='''+dbecuenta.text+''' and ANO='''+speano.text+''''

          +' union '

          +' select  CIAID,CUENTAID,ANO, ''ABRIL'' MES,''04'' NUMERO, SALDMN03 SALDANT ,DEBEMN04 DEBE , '
          +' HABEMN04 HABE,SALDMN04 SALDFIN '
          +' from cnt401 where ciaid='''+dblcCia.text+''' and nvl(clauxid,''nulo'')=''nulo'' and nvl(auxid,''nulo'')=''nulo'' '
          +' and nvl(ccosid,''nulo'')=''nulo'' and cuentaid='''+dbecuenta.text+''' and ANO='''+speano.text+''''

          +' union '

          +' select  CIAID,CUENTAID,ANO, ''MAYO'' MES,''05'' NUMERO, SALDMN04 SALDANT,DEBEMN05 DEBE, '
          +' HABEMN05 HABE ,SALDMN05 SALDFIN '
          +' from cnt401 where ciaid='''+dblcCia.text+''' and nvl(clauxid,''nulo'')=''nulo'' and nvl(auxid,''nulo'')=''nulo'''
          +' and nvl(ccosid,''nulo'')=''nulo'' and cuentaid='''+dbecuenta.text+''' and ANO='''+speano.text+''''

          +' union '

          +' select  CIAID,CUENTAID,ANO,''JUNIO'' MES,''06'' NUMERO, SALDMN05 SALDANT,DEBEMN06 DEBE, '
          +' HABEMN06 HABE, SALDMN06 SALDFIN '
          +' from cnt401 where ciaid='''+dblcCia.text+''' and nvl(clauxid,''nulo'')=''nulo'' and nvl(auxid,''nulo'')=''nulo'''
          +' and nvl(ccosid,''nulo'')=''nulo'' and cuentaid='''+dbecuenta.text+''' and ANO='''+speano.text+''''

          +' union '

          +' select  CIAID,CUENTAID,ANO, ''JULIO'' MES,''07'' NUMERO,SALDMN06 SALDANT,DEBEMN07 DEBE, '
          +' HABEMN07 HABE,SALDMN07 SALDFIN '
          +' from cnt401 where ciaid='''+dblcCia.text+''' and nvl(clauxid,''nulo'')=''nulo'' and nvl(auxid,''nulo'')=''nulo'' '
          +' and nvl(ccosid,''nulo'')=''nulo'' and cuentaid='''+dbecuenta.text+''' and ANO='''+speano.text+''''

          +' union '

          +' select  CIAID,CUENTAID,ANO,''AGOSTO'' MES,''08'' NUMERO,SALDMN07 SALDANT,DEBEMN08 DEBE, '
          +' HABEMN08 HABE,SALDMN08 SALDFIN '
          +' from cnt401 where ciaid='''+dblcCia.text+''' and nvl(clauxid,''nulo'')=''nulo'' and nvl(auxid,''nulo'')=''nulo'' '
          +' and nvl(ccosid,''nulo'')=''nulo'' and cuentaid='''+dbecuenta.text+''' and ANO='''+speano.text+''''

          +' union '

          +' select  CIAID,CUENTAID,ANO, ''SETIEMBRE'' MES ,''09'' NUMERO,SALDMN08 SALDANT,DEBEMN09 DEBE, '
          +' HABEMN09 HABE,SALDMN09 SALDFIN '
          +' from cnt401 where ciaid='''+dblcCia.text+''' and nvl(clauxid,''nulo'')=''nulo'' and nvl(auxid,''nulo'')=''nulo'' '
          +' and nvl(ccosid,''nulo'')=''nulo'' and cuentaid='''+dbecuenta.text+''' and ANO='''+speano.text+''''

          +' union '

          +' select  CIAID,CUENTAID,ANO, ''OCTUBRE'' MES,''10'' NUMERO,SALDMN09 SALDANT,DEBEMN10 DEBE, '
          +' HABEMN10 HABE,SALDMN10 SALDFIN  '
          +' from cnt401 where ciaid='''+dblcCia.text+''' and nvl(clauxid,''nulo'')=''nulo'' and nvl(auxid,''nulo'')=''nulo'' '
          +' and nvl(ccosid,''nulo'')=''nulo'' and cuentaid='''+dbecuenta.text+''' and ANO='''+speano.text+''''

         +' union '

         +' select  CIAID,CUENTAID,ANO, ''NOVIEMBRE'' MES,''11'' NUMERO,SALDMN10 SALDANT ,DEBEMN11 DEBE, '
         +' HABEMN11 HABE,SALDMN11 SALDFIN '
         +' from cnt401 where ciaid='''+dblcCia.text+''' and nvl(clauxid,''nulo'')=''nulo'' and nvl(auxid,''nulo'')=''nulo'' '
         +' and nvl(ccosid,''nulo'')=''nulo'' and cuentaid='''+dbecuenta.text+''' and ANO='''+speano.text+''''

         +' union '

         +' select  CIAID,CUENTAID,ANO,''DICIEMBRE'' MES,''12'' NUMERO,SALDMN11 SALDANT ,DEBEMN12 DEBE, '
         +' HABEMN12 HABE ,SALDMN12 SALDFIN '
         +' from cnt401 where ciaid='''+dblcCia.text+''' and nvl(clauxid,''nulo'')=''nulo'' and nvl(auxid,''nulo'')=''nulo'' '
         +' and nvl(ccosid,''nulo'')=''nulo'' and cuentaid='''+dbecuenta.text+''' and ANO='''+speano.text+'''  ORDER BY NUMERO ';


  DMCNT.cdsSaldos.Close;
  GSaldos  := TMant.Create(Self);
  try
	GSaldos.Admin           := DMCNT.wAdmin;
   GSaldos.User            := DMCNT.wUsuario;
   GSaldos.OnCreateMant    := nil ;
   GSaldos.TableName       := 'VWCNTESTADISSCTA';
   GSaldos.ClientDataSet   := DMCNT.cdsSALDOS;
   GSaldos.Filter          := '';
   GSaldos.DComC           := DMCNT.DCOM1;
   GSaldos.OnEdit       	 := nil;
   GSaldos.Module          := DMCNT.wModulo;
   GSaldos.Titulo 				 := 'Estadística de Cuenta';
   GSaldos.SectionName		 :='CNTEstadísticas';
   GSaldos.FileNameIni     := '\SOLCNT.INI';
   GSaldos.UsuarioSQL.add(reporte);
   GSaldos. Execute;
  Finally
    DMCNT.cdssaldos.Close;
 	 GSaldos.Free;
  End;
  DMCNT.cdssaldos.Close;
end;

procedure TFToolSaldos.FormCreate(Sender: TObject);
var
  xAno, xMes, xDia : Word;
  sql:string;
begin
  DecodeDate(Date, xAno, xMes, xDia);
  speAno.Value:=xAno;
  dblcdCodigo.enabled:=false;
end;

procedure TFToolSaldos.z2bbtnAceptarClick(Sender: TObject);
var
  reporte,xsql,periodo,xwhere,mesdes,mes,ano:string;
  x10:integer;
  rep1, rep2, rep3, rep4 : String;
Begin
      FConsulta.GSaldos.UsuarioSQL.clear;

      if length(dblcCia.text)=0 then
      begin
        dblcCia.setfocus;
        raise exception.Create('Falta registrar la Compañía');
      end;

      if length(dblcdCodigo.text)=0 then
      begin
        dblcdCodigo.setfocus;
        raise exception.Create('Falta registrar la cuenta');
      end;
      if length(speano.text)=0  then
      begin
        speano.setfocus;
        raise exception.Create('Debe registar el Año');
      end;
      xtcciaid:=dblcCia.text;
      xtccuenta:=dblcdCodigo.text;
      DMCNT.cdsSaldos.Close;

// Inicio HPC_201115_CNT
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
      Reporte:='select CNT401.CIAID ,CNT401.CUENTAID  ,CNT401.ANO ,''ENERO'' Mes,''01'' NUMERO,nvl(CNT401.SALDMN00,0.00) SaldAnt, nvl(CNT401.DEBEMN01,0.00) Debe, '
          +' nvl(CNT401.HABEMN01,0.00) Habe, nvl(CNT401.SALDMN01,0.00) SALDFIN, TGE101.CIADES, CNT401.CTADES '
          +' from cnt401,TGE101 where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,'''')='''' and '+wReplacCeros+'(CNT401.auxid,'''')='''' '
          +' and '+wReplacCeros+'(CNT401.ccosid,'''')='''' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '
          +' union '

          +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO ,''FEBRERO'' Mes,''02'' NUMERO,nvl(CNT401.SALDMN01,0.00) SaldAnt, nvl(CNT401.DEBEMN02,0.00) Debe, '
          +' nvl(CNT401.HABEMN02,0.00) Habe, nvl(CNT401.SALDMN02,0.00) SaldFin, TGE101.CIADES,CNT401.CTADES '
          +' from cnt401,TGE101 where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,'''')='''' and '+wReplacCeros+'(CNT401.auxid,'''')='''' '
          +' and '+wReplacCeros+'(CNT401.ccosid,'''')='''' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '
          +' UNION '

          +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO ,''MARZO'' Mes,''03'' NUMERO, nvl(CNT401.SALDMN02,0.00) SaldAnt, nvl(CNT401.DEBEMN03,0.00) Debe, '
          +' nvl(CNT401.HABEMN03,0.00) Habe, nvl(CNT401.SALDMN03,0.00)  Saldfin,TGE101.CIADES,CNT401.CTADES '
          +' from cnt401,TGE101 where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,'''')='''' and '+wReplacCeros+'(CNT401.auxid,'''')='''' '
          +' and '+wReplacCeros+'(CNT401.ccosid,'''')='''' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '

          +' union '

          +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO , ''ABRIL'' Mes,''04'' NUMERO, nvl(CNT401.SALDMN03,0.00) SaldAnt, nvl(CNT401.DEBEMN04,0.00) Debe , '
          +' nvl(CNT401.HABEMN04,0.00) Habe, nvl(CNT401.SALDMN04,0.00) Saldfin,TGE101.CIADES,CNT401.CTADES '
          +' from cnt401,TGE101 where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,'''')='''' and '+wReplacCeros+'(CNT401.auxid,'''')='''' '
          +' and '+wReplacCeros+'(CNT401.ccosid,'''')='''' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '

          +' union '

          +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO , ''MAYO'' Mes,''05'' NUMERO, nvl(CNT401.SALDMN04,0.00) SaldAnt, nvl(CNT401.DEBEMN05,0.00) DEBE, '
          +' nvl(CNT401.HABEMN05,0.00) HABE, nvl(CNT401.SALDMN05,0.00) SALDFIN, TGE101.CIADES,CNT401.CTADES '
          +' from cnt401,TGE101 where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,'''')='''' and '+wReplacCeros+'(CNT401.auxid,'''')='''' '
          +' and '+wReplacCeros+'(CNT401.ccosid,'''')='''' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '

          +' union '

          +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO ,''JUNIO'' Mes,''06'' NUMERO, nvl(CNT401.SALDMN05,0.00) SaldAnt, nvl(CNT401.DEBEMN06,0.00) DEBE, '
          +' nvl(CNT401.HABEMN06,0.00) HABE, nvl(CNT401.SALDMN06,0.00) SALDFIN, TGE101.CIADES,CNT401.CTADES '
          +' from cnt401,TGE101 where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,'''')='''' and '+wReplacCeros+'(CNT401.auxid,'''')='''' '
          +' and '+wReplacCeros+'(CNT401.ccosid,'''')='''' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '

          +' union '

          +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO , ''JULIO'' Mes,''07'' NUMERO, nvl(CNT401.SALDMN06,0.00) SaldAnt, nvl(CNT401.DEBEMN07,0.00) DEBE, '
          +' nvl(CNT401.HABEMN07,0.00) HABE, nvl(CNT401.SALDMN07,0.00) SALDFIN, TGE101.CIADES,CNT401.CTADES '
          +' from cnt401,TGE101 where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,'''')='''' and '+wReplacCeros+'(CNT401.auxid,'''')='''' '
          +' and '+wReplacCeros+'(CNT401.ccosid,'''')='''' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '

          +' union '



          +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO ,''AGOSTO'' Mes,''08'' NUMERO, nvl(CNT401.SALDMN07,0.00) SaldAnt, nvl(CNT401.DEBEMN08,0.00) DEBE, '
          +' nvl(CNT401.HABEMN08,0.00) HABE, nvl(CNT401.SALDMN08,0.00) SALDFIN, TGE101.CIADES,CNT401.CTADES '
          +' from cnt401,TGE101 where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,'''')='''' and '+wReplacCeros+'(CNT401.auxid,'''')='''' '
          +' and '+wReplacCeros+'(CNT401.ccosid,'''')='''' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '

          +' union '

          +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO , ''SETIEMBRE'' Mes,''09'' NUMERO, nvl(CNT401.SALDMN08,0.00) SaldAnt, nvl(CNT401.DEBEMN09,0.00) DEBE, '
          +' nvl(CNT401.HABEMN09,0.00) HABE, nvl(CNT401.SALDMN09,0.00) SALDFIN, TGE101.CIADES,CNT401.CTADES '
          +' from cnt401,TGE101 where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,'''')='''' and '+wReplacCeros+'(CNT401.auxid,'''')='''' '
          +' and '+wReplacCeros+'(CNT401.ccosid,'''')='''' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '

          +' union '

          +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO , ''OCTUBRE'' Mes,''10'' NUMERO, nvl(CNT401.SALDMN09,0.00) SaldAnt, nvl(CNT401.DEBEMN10,0.00) DEBE, '
          +' nvl(CNT401.HABEMN10,0.00) HABE, nvl(CNT401.SALDMN10,0.00) SALDFIN , TGE101.CIADES,CNT401.CTADES '
          +' from cnt401,TGE101 where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,'''')='''' and '+wReplacCeros+'(CNT401.auxid,'''')='''' '
          +' and '+wReplacCeros+'(CNT401.ccosid,'''')='''' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '

         +' union '

         +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO , ''NOVIEMBRE'' Mes,''11'' NUMERO, nvl(CNT401.SALDMN10,0.00) SaldAnt, nvl(CNT401.DEBEMN11,0.00) DEBE, '
         +' nvl(CNT401.HABEMN11,0.00) HABE, nvl(CNT401.SALDMN11,0.00) SALDFIN ,TGE101.CIADES,CNT401.CTADES '
          +' from cnt401,TGE101 where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,'''')='''' and '+wReplacCeros+'(CNT401.auxid,'''')='''' '
          +' and '+wReplacCeros+'(CNT401.ccosid,'''')='''' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '

         +' union '

         +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO ,''DICIEMBRE'' Mes,''12'' NUMERO, nvl(CNT401.SALDMN11,0.00) SaldAnt, nvl(CNT401.DEBEMN12,0.00) DEBE, '
         +' nvl(CNT401.HABEMN12,0.00) HABE, nvl(CNT401.SALDMN12,0.00) SALDFIN,TGE101.CIADES,CNT401.CTADES '
          +' from cnt401,TGE101 where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,'''')='''' and '+wReplacCeros+'(CNT401.auxid,'''')='''' '
          +' and '+wReplacCeros+'(CNT401.ccosid,'''')='''' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '
      end
      else begin
      // vhndema
      Rep1:='select CNT401.CIAID , CNT401.CUENTAID  ,CNT401.ANO ,''ENERO'' Mes,''01'' NUMERO, nvl(CNT401.SALDMN00,0.00) SaldAnt, nvl(CNT401.DEBEMN01,0.00) Debe, '
          +'  nvl(CNT401.HABEMN01,0.00) Habe,  nvl(CNT401.SALDMN01,0.00) SALDFIN, TGE101.CIADES, TGE202.CTADES '
          +' from cnt401, TGE101, TGE202 '
          +' where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,''nulo'')=''nulo'' and '+wReplacCeros+'(CNT401.auxid,''nulo'')=''nulo'' '
          +' and '+wReplacCeros+'(CNT401.ccosid,''nulo'')=''nulo'' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '
          +' and cnt401.CIAID=TGE202.CIAID and cnt401.CUENTAID=TGE202.CUENTAID '
          +' union '

          +' select CNT401.CIAID, CNT401.CUENTAID, CNT401.ANO, ''FEBRERO'' Mes, ''02'' NUMERO, nvl(CNT401.SALDMN01,0.00) SaldAnt, nvl(CNT401.DEBEMN02,0.00) Debe, '
          +'  nvl(CNT401.HABEMN02,0.00) Habe,  nvl(CNT401.SALDMN02,0.00) SaldFin, TGE101.CIADES, TGE202.CTADES '
          +' from cnt401, TGE101, TGE202 '
          +' where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,''nulo'')=''nulo'' and '+wReplacCeros+'(CNT401.auxid,''nulo'')=''nulo'' '
          +' and '+wReplacCeros+'(CNT401.ccosid,''nulo'')=''nulo'' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '
          +' and cnt401.CIAID=TGE202.CIAID and cnt401.CUENTAID=TGE202.CUENTAID '
          +' UNION '

          +' select CNT401.CIAID, CNT401.CUENTAID, CNT401.ANO , ''MARZO'' Mes, ''03'' NUMERO, nvl(CNT401.SALDMN02,0.00) SaldAnt, nvl(CNT401.DEBEMN03,0.00) Debe, '
          +'  nvl(CNT401.HABEMN03,0.00) Habe,  nvl(CNT401.SALDMN03,0.00) Saldfin, TGE101.CIADES, TGE202.CTADES '
          +' from cnt401, TGE101, TGE202 '
          +' where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,''nulo'')=''nulo'' and '+wReplacCeros+'(CNT401.auxid,''nulo'')=''nulo'''
          +' and '+wReplacCeros+'(CNT401.ccosid,''nulo'')=''nulo'' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '
          +' and cnt401.CIAID=TGE202.CIAID and cnt401.CUENTAID=TGE202.CUENTAID '

          +' union ';

      Rep2:=' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO , ''ABRIL'' Mes,''04'' NUMERO, nvl(CNT401.SALDMN03,0.00) SaldAnt, nvl(CNT401.DEBEMN04,0.00) Debe , '
          +'  nvl(CNT401.HABEMN04,0.00) Habe, nvl(CNT401.SALDMN04,0.00) Saldfin,TGE101.CIADES, TGE202.CTADES '
          +' from cnt401, TGE101, TGE202 '
          +' where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,''nulo'')=''nulo'' and '+wReplacCeros+'(CNT401.auxid,''nulo'')=''nulo'' '
          +' and '+wReplacCeros+'(CNT401.ccosid,''nulo'')=''nulo'' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '
          +' and cnt401.CIAID=TGE202.CIAID and cnt401.CUENTAID=TGE202.CUENTAID '

          +' union '

          +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO , ''MAYO'' Mes,''05'' NUMERO, nvl(CNT401.SALDMN04,0.00) SaldAnt, nvl(CNT401.DEBEMN05,0.00) DEBE, '
          +'  nvl(CNT401.HABEMN05,0.00) HABE, nvl(CNT401.SALDMN05,0.00) SALDFIN, TGE101.CIADES, TGE202.CTADES '
          +' from cnt401, TGE101, TGE202 '
          +' where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,''nulo'')=''nulo'' and '+wReplacCeros+'(CNT401.auxid,''nulo'')=''nulo'''
          +' and '+wReplacCeros+'(CNT401.ccosid,''nulo'')=''nulo'' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '
          +' and cnt401.CIAID=TGE202.CIAID and cnt401.CUENTAID=TGE202.CUENTAID '

          +' union '

          +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO ,''JUNIO'' Mes,''06'' NUMERO, nvl(CNT401.SALDMN05,0.00) SaldAnt, nvl(CNT401.DEBEMN06,0.00) DEBE, '
          +'  nvl(CNT401.HABEMN06,0.00) HABE, nvl(CNT401.SALDMN06,0.00) SALDFIN, TGE101.CIADES, TGE202.CTADES '
          +' from cnt401, TGE101, TGE202 '
          +' where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,''nulo'')=''nulo'' and '+wReplacCeros+'(CNT401.auxid,''nulo'')=''nulo'''
          +' and '+wReplacCeros+'(CNT401.ccosid,''nulo'')=''nulo'' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '
          +' and cnt401.CIAID=TGE202.CIAID and cnt401.CUENTAID=TGE202.CUENTAID '

          +' union ';

      Rep3:=' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO , ''JULIO'' Mes,''07'' NUMERO, nvl(CNT401.SALDMN06,0.00) SaldAnt, nvl(CNT401.DEBEMN07,0.00) DEBE, '
          +'  nvl(CNT401.HABEMN07,0.00) HABE, nvl(CNT401.SALDMN07,0.00) SALDFIN, TGE101.CIADES, TGE202.CTADES '
          +' from cnt401, TGE101, TGE202 '
          +' where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,''nulo'')=''nulo'' and '+wReplacCeros+'(CNT401.auxid,''nulo'')=''nulo'' '
          +' and '+wReplacCeros+'(CNT401.ccosid,''nulo'')=''nulo'' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '
          +' and cnt401.CIAID=TGE202.CIAID and cnt401.CUENTAID=TGE202.CUENTAID '

          +' union '

          +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO ,''AGOSTO'' Mes,''08'' NUMERO, nvl(CNT401.SALDMN07,0.00) SaldAnt, nvl(CNT401.DEBEMN08,0.00) DEBE, '
          +'  nvl(CNT401.HABEMN08,0.00) HABE, nvl(CNT401.SALDMN08,0.00) SALDFIN, TGE101.CIADES, TGE202.CTADES '
          +' from cnt401, TGE101, TGE202 '
          +' where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,''nulo'')=''nulo'' and '+wReplacCeros+'(CNT401.auxid,''nulo'')=''nulo'' '
          +' and '+wReplacCeros+'(CNT401.ccosid,''nulo'')=''nulo'' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '
          +' and cnt401.CIAID=TGE202.CIAID and cnt401.CUENTAID=TGE202.CUENTAID '

          +' union '

          +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO , ''SETIEMBRE'' Mes,''09'' NUMERO, nvl(CNT401.SALDMN08,0.00) SaldAnt, nvl(CNT401.DEBEMN09,0.00) DEBE, '
          +'  nvl(CNT401.HABEMN09,0.00) HABE, nvl(CNT401.SALDMN09,0.00) SALDFIN, TGE101.CIADES, TGE202.CTADES '
          +' from cnt401, TGE101, TGE202 '
          +' where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,''nulo'')=''nulo'' and '+wReplacCeros+'(CNT401.auxid,''nulo'')=''nulo'' '
          +' and '+wReplacCeros+'(CNT401.ccosid,''nulo'')=''nulo'' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '
          +' and cnt401.CIAID=TGE202.CIAID and cnt401.CUENTAID=TGE202.CUENTAID '

          +' union ';

      Rep4:=' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO , ''OCTUBRE'' Mes,''10'' NUMERO, nvl(CNT401.SALDMN09,0.00) SaldAnt, nvl(CNT401.DEBEMN10,0.00) DEBE, '
          +'  nvl(CNT401.HABEMN10,0.00) HABE, nvl(CNT401.SALDMN10,0.00) SALDFIN , TGE101.CIADES, TGE202.CTADES '
          +' from cnt401, TGE101, TGE202 '
          +' where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,''nulo'')=''nulo'' and '+wReplacCeros+'(CNT401.auxid,''nulo'')=''nulo'' '
          +' and '+wReplacCeros+'(CNT401.ccosid,''nulo'')=''nulo'' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '
          +' and cnt401.CIAID=TGE202.CIAID and cnt401.CUENTAID=TGE202.CUENTAID '

          +' union '

          +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO , ''NOVIEMBRE'' Mes,''11'' NUMERO, nvl(CNT401.SALDMN10,0.00) SaldAnt, nvl(CNT401.DEBEMN11,0.00) DEBE, '
          +'  nvl(CNT401.HABEMN11,0.00) HABE, nvl(CNT401.SALDMN11,0.00) SALDFIN ,TGE101.CIADES, TGE202.CTADES '
          +' from cnt401, TGE101, TGE202 '
          +' where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,''nulo'')=''nulo'' and '+wReplacCeros+'(CNT401.auxid,''nulo'')=''nulo'' '
          +' and '+wReplacCeros+'(CNT401.ccosid,''nulo'')=''nulo'' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '
          +' and cnt401.CIAID=TGE202.CIAID and cnt401.CUENTAID=TGE202.CUENTAID '

          +' union '

          +' select  CNT401.CIAID ,CNT401.CUENTAID ,CNT401.ANO ,''DICIEMBRE'' Mes,''12'' NUMERO, nvl(CNT401.SALDMN11,0.00) SaldAnt, nvl(CNT401.DEBEMN12,0.00) DEBE, '
          +'  nvl(CNT401.HABEMN12,0.00) HABE, nvl(CNT401.SALDMN12,0.00) SALDFIN,TGE101.CIADES, TGE202.CTADES '
          +' from cnt401, TGE101, TGE202 '
          +' where CNT401.ciaid='''+dblcCia.text+''' and '+wReplacCeros+'(CNT401.clauxid,''nulo'')=''nulo'' and '+wReplacCeros+'(CNT401.auxid,''nulo'')=''nulo'' '
          +' and '+wReplacCeros+'(CNT401.ccosid,''nulo'')=''nulo'' and CNT401.cuentaid='''+dblcdCodigo.text+''' and CNT401.ANO='''+speano.text+''' AND TGE101.CIAID=CNT401.CIAID '
          +' and cnt401.CIAID=TGE202.CIAID and cnt401.CUENTAID=TGE202.CUENTAID '
          +' ORDER BY NUMERO';

         Reporte:=Rep1+Rep2+Rep3+Rep4;
      end;
// Fin HPC_201115_CNT

   FConsulta.GSaldos.FMant.UsuarioSQL.Add( Reporte );
   FConsulta.GSaldos.NewQuery;
//   dblcCia.setfocus;
end;

procedure TFToolSaldos.dblcdCodigoExit(Sender: TObject);
var
   xWhere, xAdic : String;
begin
   if dblcCia.Focused then Exit;

   xWhere := 'CUENTAID='+''''+dblcdCodigo.Text+''''+' and CIAID='+''''+dblcCia.Text+'''';

   if sCiaCuenta<>'' then
      xWhere:=xWhere +' and '+ sCiaCuenta;

   xAdic := DMCNT.DisplayDescrip('PrvTGE','TGE202','*',xWhere,'CTADES') ;

   if trim( xAdic ) = '' then
   begin
      dblcdCodigo.SetFocus ;
      ShowMessage('Cuenta No Registrada o No tiene Accesos. Verificar...') ;
      Exit;
   end
   else
      dbecuenta.text:= xAdic ;
end;

procedure TFToolSaldos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

end.
