unit CNT702;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, wwdbedit, wwdblook, ExtCtrls, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppCache, ppDBPipe, Spin,mant, Wwdbdlg;

type
  TFtoolHistAjus = class(TForm)
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
    speAno: TSpinEdit;
    Label3: TLabel;
    Z2bbtnCanc3: TBitBtn;
    z2bbtnAceptar: TBitBtn;
    dblcdmes: TwwDBLookupCombo;
    edtmes: TEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    RbConsolidado: TRadioButton;
    RbCia: TRadioButton;
    RbCompConsol: TRadioButton;
    pprCompConsol: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel3: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    ppLabel22: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppLabel39: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLine17: TppLine;
    ppLabel49: TppLabel;
    pplabel50: TppLabel;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine1: TppLine;
    pplbldebeREI: TppLabel;
    pplblhaberei: TppLabel;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppdbCompConsol: TppDBPipeline;
    pplblctarei: TppLabel;
    pplblreides: TppLabel;
    RbComCia: TRadioButton;
    procedure dblcCiaExit(Sender: TObject);
    procedure dblctdiarioExit(Sender: TObject);
    procedure Z2bbtnRegistra3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z1sbInformesClick(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure z2bbtnAceptarClick(Sender: TObject);
    procedure dblcdmesExit(Sender: TObject);
    procedure RbConsolidadoClick(Sender: TObject);
    procedure RbCiaClick(Sender: TObject);
    procedure RbCompConsolClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RbComCiaClick(Sender: TObject);
  private
    { Private declarations }
    xperiodo:string;
//    procedure PegaToolEstadistica (Sender: TObject);
  public
    { Public declarations }
    GSaldos : TMant;
    xtcciaid,xtccuenta,xtano,restado:string;
  end;

var
  FtoolHistAjus: TFtoolHistAjus;

implementation

uses CNTDM, oaCN3000;

{$R *.DFM}

procedure TFtoolHistAjus.dblcCiaExit(Sender: TObject);
var
sql:string;
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then
   begin
      edtCia.Text:=DMCNT.cdsCia.FieldByName('CIADES').AsString;
   end;

   if length(edtCia.Text)<>0 then
   begin
     Screen.Cursor:= crHourGlass;
{     sql:='SELECT CIAID, CUENTAID, CTADES FROM CNT401 WHERE '
          +' CIAID='''+dblcCia.text+''' AND  '+wReplacCeros+'(clauxid,''nulo'')=''nulo'' and '
          +' '+wReplacCeros+'(auxid,''nulo'')=''nulo''  and '+wReplacCeros+'(ccosid,''nulo'')=''nulo'' ORDER BY CUENTAID ';}
     sql:='SELECT CIAID, CUENTAID, CTADES FROM TGE202 '
         +'WHERE CIAID='''+dblcCia.text+''' '
         +'ORDER BY CUENTAID ';
     DMCNT.cdsCuenta.fetchondemand:=False;
     DMCNT.cdsCuenta.packetrecords:=-1;
     DMCNT.cdsCuenta.fetchondemand:=True;
     DMCNT.Filtracds(DMCNT.cdsCuenta,SQL);
     Screen.Cursor:=CrDefault;

     dblcdmes.Selected.Clear;
     dblcdmes.Selected.Add('MESIDR'#9'10'#9'Código'#9'F');
     dblcdmes.Selected.Add('MESDESL'#9'30'#9'Descripción'#9'F');
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
procedure TFtoolHistAjus.dblctdiarioExit(Sender: TObject);
begin
{   if dblctdiario.Text<>'' then dbetdiario.Text:=DMCNT.cdsTDiario.FieldByName('TDIARDES').AsString;

   if length(dbetdiario.Text)=0 then
   begin
      dblctdiario.setfocus;
      raise exception.Create('Falta registrar el Tipo de Diario');
   end;}

end;

procedure TFtoolHistAjus.Z2bbtnRegistra3Click(Sender: TObject);
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

procedure TFtoolHistAjus.FormActivate(Sender: TObject);
var
  xAno, xMes, xDia : Word;
begin
  DecodeDate(Date, xAno, xMes, xDia);
  speAno.Value:=xAno;
   dblcdmes.Selected.Clear;
   dblcdmes.Selected.Add ('MESID'#9'3'#9'Compañia'#9'F');
   dblcdmes.Selected.Add ('MESDESL'#9'15'#9'CuentaID'#9'F');

end;

procedure TFtoolHistAjus.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFtoolHistAjus.Z1sbInformesClick(Sender: TObject);
var
reporte,xsql,periodo,xwhere,mesdes,mes,ano:string;
x10:integer;
Begin
       if length(dblcCia.text)=0 then
{      begin
        dblcCia.setfocus;
        raise exception.Create('Falta registrar la Compañía');
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
  DMCNT.cdssaldos.Close; }
end;

procedure TFtoolHistAjus.FormCreate(Sender: TObject);
var
  xAno, xMes, xDia : Word;
  sql:string;
begin
  DecodeDate(Date, xAno, xMes, xDia);
  speAno.Value:=xAno;
  dblcCia.Enabled:=False;
  edtCia.Enabled:=False;
  dblcdmes.Enabled:=False;
  If RbConsolidado.checked then
  Begin
    RbConsolidadoClick(sender);
  End;
  edtmes.Enabled:=False;
  speAno.Enabled:=False;
  //  dblcdCodigo.enabled:=false;

end;

procedure TFtoolHistAjus.z2bbtnAceptarClick(Sender: TObject);
var
  cntglosa,xcomprob,mesid,ctarei,xwhere : String;
  xsql,XSQL2,ctareides :String;
Begin
//   dblcCia.setfocus;
  FConsulta.GHistorico.UsuarioSQL.clear;

//   if rbcia.checked then
//   Begin
     if length(dblcCia.text)=0 then
     begin
           dblcCia.setfocus;
           raise exception.Create('Falta registrar la Compañía');
     end;


     if length(dblcdmes.text)=0 then
     begin
           dblcdmes.setfocus;
           raise exception.Create('Falta Seleccionar el Mes de Ajuste');
     end;

     if length(speAno.text)=0 then
     begin
           speAno.setfocus;
           raise exception.Create('Falta Seleccionar el Año');
     end;


  // end;
   xWhere   := ' CIAID='''+dblcCia.TEXT+'''';
   ctarei:=DMCNT.DisplayDescrip('PrvTGE','TGE101','CIACTAREI',xWhere,'CIACTAREI');

   if RbConsolidado.checked=True then
   begin
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      Begin
         xsql:='SELECT A.CIAID CIAID, B.TDIARID TDIARID, B.CNTANO CNTANO, B.CNTLOTE CNTLOTE, '
              +  'B.CTA_ORIGEN CUENTAORI, MAX(A.CIADES) CIADES, '
              +  'SUM(CASE WHEN B.FACTOR<>0 AND COALESCE(B.VALHISTMOD,99)=99 THEN B.VALHIST ELSE B.VALHISTMOD END) VALOR_HISTORICO '
              +  'SUM((CASE WHEN B.FACTOR<>0 AND  COALESCE(B.VALHISTMOD,99)=99 THEN B.VALHIST ELSE B.VALHISTMOD END)*B.FACTOR) AS VALOR_AJUSTADO, '
              +  '(SUM((CASE WHEN B.FACTOR<>0 AND COALESCE(B.VALHISTMOD,99)=99 THEN B.VALHIST ELSE B.VALHISTMOD END)*B.FACTOR))-'
              +  '(SUM(CASE WHEN B.FACTOR<>0 AND COALESCE(B.VALHISTMOD,99)=99 THEN B.VALHIST ELSE B.VALHISTMOD END)) AS DIFERENCIA, '
              +  'MAX(C.CTADES) CTADES, ''  '' CIADES, ''   '' PERIODO, ''   '' MES, '
              +  '0.00 FACTOR, ''  '' DESMES, 0.00 NUEVOMONTO, ''  '' CNTDINC, '
              +  '0.00 VALHIST, ''  '' CNTANO, MAX(H.CIADES) CIADESPRINC, 0.00 CNTDEBEMN, '
              +  '0.00 CNTHABEMN, '' '' CUENTAAJUSTE, MAX(C.CTA_TIPOREI) CTA_TIPOREI, '
              +  'MAX(C.CTA_SUMGA) CTA_SUMGA, '' '' TDIARID, '' '' TDIARDES, 0.00 CNTTCAMBIO, '
              +  '0.00 CNTDEBEME, 0.00 CNTHABEME, '' '' CNTFEMIS, '
              +  ''' '' CNTGLOSA, '' '' CNTFREG, '' '' CNTCOMPROB '
              +'FROM TGE101 A '
              +   'LEFT JOIN CNT305 B ON (A.CIAID=B.CIAID AND B.CNTANO='''+speano.TEXT+''' AND '
              +                          'B.CNTLOTE=''INFL'' AND B.CUENTAID<>'''+CTAREI+ '''), '
              +   'TGE202 C, TGE181 G, TGE101 H '
              +'WHERE B.CTA_ORIGEN=C.CUENTAID AND B.CIAID=C.CIAID '
              +   'AND B.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''' AND H.CIAID=''01'' '
              +   'AND G.MESIDR='''+dblcdmes.text+''' '
              +'GROUP BY A.CIAID, B.TDIARID, B.CNTANO, B.CNTLOTE, B.CTA_ORIGEN, C.CTA_SUMGA '
              +'ORDER BY CUENTAORI, A.CIAID, C.CTA_SUMGA';

      end;
      if SRV_D = 'ORACLE' then
      begin
         xsql:='SELECT A.CIAID CIAID, B.TDIARID TDIARID, B.CNTANO CNTANO, B.CNTLOTE CNTLOTE, '
              +   'B.CTA_ORIGEN CUENTAORI, MAX(A.CIADES) CIADES, '
              +   'SUM(DECODE(B.FACTOR,0,0,DECODE (NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD))) AS VALOR_HISTORICO, '
              +   'SUM(DECODE(B.FACTOR,0,0,DECODE (NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD))*B.FACTOR) AS VALOR_AJUSTADO, '
              +   '(SUM(DECODE(B.FACTOR,0,0,DECODE (NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD))*B.FACTOR))-'
              +   '(SUM(DECODE(B.FACTOR,0,0,DECODE (NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD)))) AS DIFERENCIA, '
              +   'MAX(C.CTADES) CTADES, ''  '' CIADES, ''   '' PERIODO, ''   '' MES, '
              +   '0.00 FACTOR, MAX(G.MESDESL) DESMES, 0.00 NUEVOMONTO, ''   '' CNTDINC, '
              +   '0.00 VALHIST, ''   '' CNTANO, MAX(H.CIADES) CIADESPRINC, 0.00 CNTDEBEMN, '
              +   '0.00 CNTHABEMN, '' '' CUENTAAJUSTE, MAX(C.CTA_TIPOREI) CTA_TIPOREI, '
              +   'MAX(C.CTA_SUMGA) CTA_SUMGA, ''   '' TDIARID, '' '' TDIARDES, 0.00 CNTTCAMBIO, '
              +   '0.00 CNTDEBEME, 0.00 CNTHABEME, '' '' CNTFEMIS, '' '' CNTGLOSA, '
              +   ''' '' CNTFREG, '' '' CNTCOMPROB '
              +'FROM TGE101 A, CNT305 B, TGE202 C, TGE181 G, TGE101 H '
              +'WHERE A.CIAID=B.CIAID(+) AND H.CIAID=''01'' AND  B.CTA_ORIGEN=C.CUENTAID '
              +  'AND B.CIAID=C.CIAID AND  B.CNTANO(+)='''+speano.TEXT+''' AND B.CNTLOTE(+)=''INFL'' '
              +  'AND B.CUENTAID(+)<>'''+CTAREI+''' AND G.MESIDR='''+dblcdmes.text+''' AND '
              +  'B.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''' '
              +'GROUP BY A.CIAID, B.TDIARID, B.CNTANO, B.CNTLOTE, B.CTA_ORIGEN, C.CTA_SUMGA '
              +'ORDER BY CUENTAORI,A.CIAID,C.CTA_SUMGA';

         xSql:='Select A.CIAID, A.TDIARID, A.CNTANO, A.CNTLOTE, A.CTA_ORIGEN CUENTAORI, A.CIADES, A.CUENTAID, '
              +   'A.VALOR_HISTORICO, A.VALOR_AJUSTADO, A.DIFERENCIA, A.CTADES, A.CTA_SUMGA, '
              +   'A.DESMES, ''   '' MES, ''   '' PERIODO,  '
              +   '0.00 FACTOR, 0.00 NUEVOMONTO, ''  '' CNTDINC, '
              +   '0.00 VALHIST, A.CIADESPRINC, 0.00 CNTDEBEMN, '
              +   '0.00 CNTHABEMN, '' '' CUENTAAJUSTE, '' '' CTA_TIPOREI, '
              +   ''' '' TDIARDES, 0.000 CNTTCAMBIO, '
              +   '0.00 CNTDEBEME, 0.00 CNTHABEME, '' '' CNTFEMIS, '' '' CNTGLOSA, '
              +   ''' '' CNTFREG, '' '' CNTCOMPROB '
              +'From '
              +'( '
              +  'SELECT A.CIAID CIAID, B.TDIARID TDIARID, B.CNTANO CNTANO, B.CNTLOTE CNTLOTE, '
              +     'B.CTA_ORIGEN CTA_ORIGEN, MAX(A.CIADES) CIADES, B.CUENTAID, MAX(H.CIADES) CIADESPRINC, '
              +     'SUM(DECODE(B.FACTOR,0,0,DECODE (NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD))) AS VALOR_HISTORICO, '
              +     'SUM(DECODE(B.FACTOR,0,0,DECODE (NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD))*B.FACTOR) AS VALOR_AJUSTADO, '
              +     '(SUM(DECODE(B.FACTOR,0,0,DECODE (NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD))*B.FACTOR))-'
              +     '(SUM(DECODE(B.FACTOR,0,0,DECODE (NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD)))) AS DIFERENCIA, '
              +     'MAX(C.CTADES) AS CTADES, MAX(C.CTA_SUMGA) AS CTA_SUMGA, MAX( MESDESL ) DESMES '
              +  'FROM TGE101 A, CNT305 B, TGE202 C, TGE181 G, TGE101 H '
              +  'WHERE A.CIAID=B.CIAID(+) AND B.CNTANO(+)='''+speano.TEXT+''' '
              +    'and B.CNTLOTE(+)=''INFL'' AND B.CUENTAID(+)<>'''+CTAREI+''' '
              +    'and CNTANOMMAJU='''+speAno.TEXT+dblcdmes.text+''' '
              +    'and B.CTA_ORIGEN=C.CUENTAID AND B.CIAID=C.CIAID '
              +    'and G.MESIDR='''+dblcdmes.text+''' '
              +    'and H.CNTCONSOL=''S'' '
              +  'GROUP BY A.CIAID, B.TDIARID, B.CNTANO, B.CNTLOTE, B.CTA_ORIGEN, C.CTA_SUMGA, B.CUENTAID '
              +') A, '
              +'( '
              +   'SELECT CIAID, CNTANO, CUENTAID, CNTLOTE, '
       +     'SUM( CNTDEBEMN ) - SUM( CNTHABEMN ) CNTMTOLOC, '
       +     'CASE WHEN SUM( CNTDEBEMN )-SUM( CNTHABEMN )>0 THEN ''D'' ELSE ''H'' END CNTDH '
       +   'FROM CNT305 '
//       +   'WHERE CNTANO='''+speAno.TEXT+''' AND CNTLOTE=''INFL'' '
       +   'WHERE CNTANO='''+speAno.TEXT+''' AND CNTLOTE=''AJDE'' '
       +     'AND CNTANOMMAJU='''+speAno.TEXT+dblcdmes.text+''' '
       +   'GROUP BY CIAID, CNTANO, CUENTAID, CNTLOTE '
       + ') D '

       +'Where D.CIAID(+)=A.CIAID AND D.CNTANO(+)=A.CNTANO AND D.CUENTAID(+)=A.CUENTAID '
       +  'AND D.CNTLOTE(+)=''AJDE'' '

       +'ORDER BY A.CTA_ORIGEN, A.CIAID, A.CTA_SUMGA' ;

       End;
   End;

   if RbCia.checked=True then
   Begin
     if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
     Begin
      xsql:=' SELECT B.CIAID AS CIAID ,A.CIADES AS CIADES,''SALDO INICIAL'' AS MES, '
          +' B.CTA_ORIGEN AS CUENTAORI,  C.CTADES AS CTADES,'''+speano.TEXT+'00''  AS PERIODO '
          +' , CASE WHEN COALESCE(B.VALHISTMOD,99)=99 THEN B.VALHIST ELSE B.VALHISTMOD END  VALOR_HISTORICO, '
          +' B.FACTOR AS FACTOR, (CASE WHEN (COALESCE(B.VALHISTMOD,99)=99) THEN B.VALHIST ELSE B.VALHISTMOD END) * B.FACTOR VALOR_AJUSTADO, '
          +' (CASE WHEN ((B.FACTOR<>0) AND (COALESCE(B.VALHISTMOD,99)=99)) THEN B.VALHIST ELSE B.VALHISTMOD END )*B.FACTOR-(CASE WHEN COALESCE(B.VALHISTMOD,99)=99 THEN B.VALHIST ELSE B.VALHISTMOD END) AS DIFERENCIA '
          +',G.MESDESL AS DESMES,B.VALHISTMOD AS NUEVOMONTO,B.CNTDINC AS CNTDINC,B.VALHIST VALHIST, B.CNTANO AS CNTANO '
          +', '' '' AS CIADESPRINC, B.CNTDEBEMN AS CNTDEBEMN, B.CNTHABEMN AS CNTHABEMN,'' '' AS CUENTAAJUSTE,  '
          + ' '' ''  AS CTA_TIPOREI, '' ''   AS CTA_SUMGA '
          +',''   '' AS  TDIARID,'' '' AS TDIARDES, 0.00 CNTTCAMBIO '
          +', 0.00 CNTDEBEME, 0.00 CNTHABEME, '' '' AS CNTFEMIS ,'' '' AS CNTGLOSA'
          +','' '' AS CNTFREG ,'' '' AS CNTCOMPROB '
          +' FROM CNT305 B, TGE101 A, TGE202 C ,TGE181 G '
          +' WHERE B.CIAID=A.CIAID AND B.CIAID=C.CIAID  AND B.CUENTAID=C.CUENTAID AND B.CTA_ORIGEN<>'''+ctarei+''''
          +' AND C.CIAID='''+dblcCIA.text+''' AND B.CNTANOMM='''+concat(speAno.Text,'00')
          +''' AND G.MESIDR='''+dblcdmes.text+''' AND B.CNTANOMMAJU=''' +speAno.TEXT+dblcdmes.TEXT+''''

           +' UNION ALL  '

          +' SELECT A.CIAID AS CIAID , C.CIADES CIADES, B.MESDESL MES,A.CTA_ORIGEN AS CUENTAORI,D.CTADES AS CTADES, '
          +' A.CNTANOMM  AS PERIODO '
          +' , CASE WHEN (E.FACTORAJUSTE<>0)  THEN '
          +'  ( CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END ) ELSE 0 END VALOR_HISTORICO, '
          +' A.FACTOR FACTOR , '
          +'( CASE WHEN (E.FACTORAJUSTE<>0)  THEN '
          +'  ( CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END ) ELSE 0 END )*E.FACTORAJUSTE VALOR_AJUSTADO, '
          +' (  CASE WHEN (E.FACTORAJUSTE<>0)  THEN '
          +'  ( CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END ) ELSE 0 END)'
          +' *E.FACTORAJUSTE-'
          +' (  CASE WHEN (E.FACTORAJUSTE<>0)  THEN '
          +'  ( CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END ) ELSE 0 END ) AS DIFERENCIA '
          +',G.MESDESL AS DESMES ,A.VALHISTMOD AS NUEVOMONTO,A.CNTDINC AS CNTDINC, A.VALHIST VALHIST , A.CNTANO AS CNTANO '
          +' ,''   '' AS CIADESPRINC  , A.CNTDEBEMN AS CNTDEBEMN, A.CNTHABEMN AS CNTHABEMN,'' '' AS CUENTAAJUSTE, '
          + ' '' ''  AS CTA_TIPOREI, '' ''   AS CTA_SUMGA '
          +',''   '' AS  TDIARID,'' '' AS TDIARDES, 0.00 CNTTCAMBIO '
          +', 0.00 CNTDEBEME, 0.00 CNTHABEME, '' '' AS CNTFEMIS ,'' '' AS CNTGLOSA'
          +','' '' AS CNTFREG ,'' '' AS CNTCOMPROB '
          + ' FROM CNT305 A ,TGE181 B,TGE101 C ,TGE202 D ,CNT104 E, TGE181 G'
          +' WHERE B.MESIDR=LTRIM(SUBSTR(CNTANOMM,5,2)) AND E.PERIODO=CNTANOMM '
          +' AND A.CNTANO='''+speano.text
          +''' AND A.CUENTAID<>'''+ctarei
          +''' AND A.CIAID=D.CIAID AND A.CIAID='''+dblcCIA.text+''' AND A.CIAID=C.CIAID AND A.CTA_ORIGEN=D.CUENTAID  AND CNTLOTE=''INFL'''
          +'  AND G.MESIDR='''+dblcdmes.text+''' AND A.CNTANOMMAJU=''' +speAno.TEXT+dblcdmes.TEXT+''''
          +' ORDER BY CUENTAORI,PERIODO ';
     End;

     if SRV_D = 'ORACLE' then
     Begin
      xsql:=' SELECT B.CIAID AS CIAID ,A.CIADES AS CIADES,''SALDO INICIAL'' AS MES, '
          +' B.CTA_ORIGEN AS CUENTAORI,  C.CTADES AS CTADES,'''+speano.TEXT+'00'' AS PERIODO '
          +' ,  DECODE(NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD)  VALOR_HISTORICO, '
          +' B.FACTOR AS FACTOR, DECODE(NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD)*B.FACTOR VALOR_AJUSTADO, '
          +' DECODE(B.FACTOR,0,0,(DECODE(NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD))*B.FACTOR-(DECODE(NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD))) AS DIFERENCIA '
          +',G.MESDESL AS DESMES,B.VALHISTMOD AS NUEVOMONTO,B.CNTDINC AS CNTDINC ,B.VALHIST VALHIST , B.CNTANO AS CNTANO '
          +' ,''   '' AS CIADESPRINC ,B.CNTDEBEMN AS CNTDEBEMN,B.CNTHABEMN AS CNTHABEMN,'' '' AS CUENTAAJUSTE, '
          + ' '' ''  AS CTA_TIPOREI, '' ''   AS CTA_SUMGA '
          +',''   '' AS  TDIARID,'' '' AS TDIARDES, 0.00 AS CNTTCAMBIO '
          +',0.00 AS CNTDEBEME, 0.00 AS CNTHABEME,'' '' AS CNTFEMIS ,'' '' AS CNTGLOSA'
          +','' '' AS CNTFREG ,'' '' AS CNTCOMPROB '
          +' FROM CNT305 B, TGE101 A, TGE202 C ,TGE181 G '
          +' WHERE B.CIAID=A.CIAID AND B.CIAID=C.CIAID  AND B.CUENTAID=C.CUENTAID AND B.CTA_ORIGEN<>'''+ctarei+''''
          +' AND C.CIAID='''+dblcCIA.text+''' AND B.CNTANOMM='''+CONCAT(speano.text,'00')
          +''' AND G.MESIDR='''+dblcdmes.text+''' AND B.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''

           +' UNION ALL  '

          +' SELECT A.CIAID AS CIAID, C.CIADES AS CIADES, B.MESDESL MES,A.CTA_ORIGEN AS CUENTAORI,D.CTADES AS CTADES, '
          +' A.CNTANOMM  AS PERIODO '
          +' , DECODE(E.FACTORAJUSTE,0,0,DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD))  VALOR_HISTORICO, '
          //+' A.FACTOR FACTOR , DECODE(E.FACTORAJUSTE,0,0,DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD))*E.FACTORAJUSTE VALOR_AJUSTADO, '
          //+' DECODE(E.FACTORAJUSTE,0,0,(DECODE(E.FACTORAJUSTE,0,0,DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)))*E.FACTORAJUSTE-(DECODE(E.FACTORAJUSTE,0,0,DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)))) AS DIFERENCIA '
          +' A.FACTOR, DECODE(A.FACTOR,0,0,DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)) * A.FACTOR VALOR_AJUSTADO, '
          +' DECODE(A.FACTOR,0,0,(DECODE(A.FACTOR,0,0,DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)))*A.FACTOR-(DECODE(A.FACTOR,0,0,DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)))) AS DIFERENCIA '
          +',G.MESDESL AS DESMES ,A.VALHISTMOD AS NUEVOMONTO,A.CNTDINC AS CNTDINC, A.VALHIST VALHIST , A.CNTANO AS CNTANO '
          +' ,''   '' AS CIADESPRINC  ,A.CNTDEBEMN  AS CNTDEBEMN,A.CNTHABEMN AS CNTHABEMN,'' '' AS CUENTAAJUSTE, '
          + ' '' ''  AS CTA_TIPOREI, '' ''   AS CTA_SUMGA '
          +',''   '' AS  TDIARID,'' '' AS TDIARDES, 0.00 AS CNTTCAMBIO '
          +', 0.00 AS CNTDEBEME, 0.00 AS CNTHABEME,'' '' AS CNTFEMIS ,'' '' AS CNTGLOSA'
          +','' '' AS CNTFREG ,'' '' AS CNTCOMPROB '
          + ' FROM CNT305 A ,TGE181 B,TGE101 C ,TGE202 D, CNT104 E, TGE181 G'
          +' WHERE B.MESIDR=TRIM(SUBSTR(CNTANOMM,5,2)) AND E.PERIODO=CNTANOMM '
          +' AND A.CNTANO='''+speano.text
          +''' AND A.CUENTAID<>'''+ctarei
          +''' AND A.CIAID=D.CIAID AND A.CIAID='''+dblcCIA.text+''' AND A.CIAID=C.CIAID AND A.CTA_ORIGEN=D.CUENTAID  AND CNTLOTE=''INFL'''
          +'  AND G.MESIDR='''+dblcdmes.text+''' AND A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
          +' ORDER BY CUENTAORI,PERIODO ';
     End;
   End;
   If RbComCia.checked then
   Begin
       XWhere := 'MESIDR='+''''+dblcdmes.Text+'''';
       MESID:=DMCNT.DisplayDescrip('PrvTGE','TGE181','MESID',xWhere,'MESID');

       xcomprob:=DMCNT.strzero(mesid, 10);

       xWhere := 'CUENTAID='+''''+ctarei+'''';
       ctareides:=DMCNT.DisplayDescrip('PrvTGE','TGE202','CTADES',xWhere,'CTADES');


       XSQL:=' SELECT DISTINCT CNTGLOSA AS GLOSA  FROM CNT305 '
             +' WHERE CIAID='''+dblcCia.TEXT+''' AND CNTANOMMAJU='''
             +speAno.TEXT+dblcdmes.TEXT+''' AND FACTOR<>0 AND CNTANO='''+speAno.TEXT+'''';
       DMCNT.cdsReporte.close;
       DMCNT.cdsReporte.datarequest(XSQL);
       DMCNT.cdsReporte.open;
       cntglosa:=DMCNT.CDSReporte.fieldbyname('GLOSA').asstring;

       If (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
       Begin
       //DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)
         xSQL:='SELECT A.TDIARID AS TDIARID ,'''+xcomprob+''' AS CNTCOMPROB  ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAAJUSTE, '
          + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
          + ' SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
          + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTHABEMN, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
          + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END /MAX(A.CNTTCAMBIO) AS CNTDEBEME, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
          + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END/MAX(A.CNTTCAMBIO) AS CNTHABEME '
          + ' , '' ''  AS CNTESTADO, '
          + ' MAX(A.CNTFEMIS) AS CNTFEMIS, '
          + ' MAX(A.CNTGLOSA) AS CNTGLOSA, MAX(A.CNTANOMMAJU) AS CNTANOMM, '
          + ' '' ''  CNTFREG, '' '' AS CNTREG, MAX(C.CTADES) AS CTADES, 0.00 NUEVOMONTO '
          + ',  MAX(A.CIAID) AS CIAID, MAX(D.CIADES) AS CIADES,'' ''  AS DESMES,'' '' AS PERIODO,'' ''  AS CUENTAORI,'
          + '0.00 VALOR_HISTORICO, 0.00 FACTOR, 0.00 VALOR_AJUSTADO, 0.00 DIFERENCIA, '
          + ' '' ''  AS CNTANO,'' ''  AS CNTDINC, 0.00 VALHIST, '' '' AS CIADESPRINC '
          + ' ,'' '' CTA_TIPOREI,'' '' AS CTA_SUMGA,'' '' AS MES ,'' '' AS CNTCOMPROB '
          + ' FROM CNT305 A, TGE104 B, TGE202 C, TGE101 D  '
          + ' WHERE A.CIAID='''+dblcCia.Text+'''  '
          + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID AND A.CIAID=D.CIAID '
          + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' AND A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
          + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '
          + ' UNION ALL '

          + 'SELECT A.TDIARID AS TDIARID ,'''+xcomprob+''' AS CNTCOMPROB  ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAAJUSTE, '
          + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
          + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
          + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END  AS CNTHABEMN, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
          + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END/MAX(A.CNTTCAMBIO) AS CNTDEBEME, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
          + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END/MAX(A.CNTTCAMBIO) AS CNTHABEME '
          + ' , '' ''  AS CNTESTADO, '
          + '  MAX(A.CNTFEMIS) AS CNTFEMIS, '
          + ' MAX(A.CNTGLOSA) AS CNTGLOSA, MAX(A.CNTANOMMAJU) AS CNTANOMM, '
          + ' ''  ''  AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES, 0.00 NUEVOMONTO,'
          + ' MAX(A.CIAID) AS CIAID,MAX(D.CIADES) AS CIADES, '' ''  AS DESMES, '' '' AS PERIODO, '' ''  AS CUENTAORI,'
          + ' 0.00 VALOR_HISTORICO, 0.00 FACTOR, 0.00 VALOR_AJUSTADO, 0.00 DIFERENCIA, '
          + ' '' ''  AS CNTANO,'' ''  AS CNTDINC, 0.00 VALHIST, '' '' AS CIADESPRINC'
          + ','' '' CTA_TIPOREI,'' '' AS CTA_SUMGA,'' '' AS MES ,'' '' AS CNTCOMPROB '
          + ' FROM CNT305 A, TGE104 B, TGE202 C, TGE101 D  '
          + ' WHERE A.CIAID='''+dblcCia.Text+''' '
          + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID  AND A.CIAID=D.CIAID '
          + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') AND A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
          + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID ';




         XSQL2:= ' SELECT MAX(TDIARID) AS TDIARID ,'''+xcomprob+''' AS CNTCOMPROB ,MAX(TDIARDES) AS TDIARDES,'''+CTAREI+''' AS CUENTAAJUSTE, MAX(CNTTCAMBIO) AS CNTTCAMBIO,'
         + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) <0 THEN (-1)*(SUM(CNTDEBEMN)-SUM(CNTHABEMN)) ELSE 0 END AS CNTDEBEMN, '
         + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) >0 THEN SUM(CNTDEBEMN)-SUM(CNTHABEMN) ELSE 0 END AS CNTHABEMN, '
         + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) <0 THEN (-1)*(SUM(CNTDEBEMN)-SUM(CNTHABEMN)) ELSE 0 END /MAX(CNTTCAMBIO) AS CNTDEBEME, '
         + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) >0 THEN SUM(CNTDEBEMN)-SUM(CNTHABEMN) ELSE 0 END/MAX(CNTTCAMBIO) AS CNTHABEME '
         + ' , '' '' AS CNTESTADO, '
         + ' MAX(CNTFEMIS)  AS CNTFEMIS, ''' //cntglosa+'''  AS CNTGLOSA, MAX(CNTANOMMAJU)
         +  cntglosa+'''  AS CNTGLOSA, MAX(CNTANOMMAJU) AS CNTANOMM,'
         + ' CURRENT DATE AS CNTFREG,'' '' AS CNTREG,'''
         + ctareides +''' AS CTADES, 0.00 NUEVOMONTO, '
         + ' MAX(CIAID) AS CIAID,MAX(CIADES) AS CIADES,'' ''  AS DESMES,'' '' AS PERIODO,'' ''  AS CUENTAORI,'
         + ' 0.00 VALOR_HISTORICO, 0.00 FACTOR, 0.00 VALOR_AJUSTADO, 0.00 DIFERENCIA, '
         + ' '' ''  AS CNTANO,'' ''  AS CNTDINC, 0.00 VALHIST,'' '' AS CIADESPRINC '
         + ','' '' CTA_TIPOREI,'' '' AS CTA_SUMGA,'' '' AS MES ,'' '' AS CNTCOMPROB '
         + ' FROM (SELECT  A.CIAID CIAID ,A.TDIARID,A.CNTANO,MAX(B.TDIARDES) AS TDIARDES, '
         + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO,'
         + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
         + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
         + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
         + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTHABEMN, '
         + 'MAX(A.CNTGLOSA) AS CNTGLOSA, MAX(A.CNTFEMIS) AS CNTFEMIS, MAX(A.CNTANOMMAJU) AS CNTANOMMAJU,MAX(D.CIADES) AS CIADES '
         + ' FROM CNT305 A, TGE104 B, TGE202 C , TGE101 D   '
         + ' WHERE A.CIAID='''+dblcCia.Text+'''  AND C.CIAID=A.CIAID AND A.CIAID=D.CIAID '
         + ' AND C.CUENTAID=A.CUENTAID  AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') AND A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
         + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO '

         + ' UNION ALL '

         + ' SELECT  A.CIAID CIAID ,A.TDIARID,A.CNTANO,MAX(B.TDIARDES) AS TDIARDES, '
         + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO,'
         + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
         + ' SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
         + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
         + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTHABEMN, '
         + ' MAX(A.CNTGLOSA) AS CNTGLOSA, MAX(A.CNTFEMIS) AS CNTFEMIS, MAX(A.CNTANOMMAJU) AS CNTANOMMAJU, MAX(D.CIADES) AS CIADES '
         + ' FROM CNT305 A, TGE104 B, TGE202 C, TGE101 D   WHERE A.CIAID='''+dblcCia.Text+''' AND  C.CIAID=A.CIAID AND A.CIAID=D.CIAID AND  '
         + ' C.CUENTAID=A.CUENTAID  AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' AND A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
         + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO ) B ';

      End;


       {If (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
       Begin
       //DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)
         xSQL:='SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAID, '
          + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
          + ' SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
          + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTHABEMN, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
          + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END /MAX(A.CNTTCAMBIO) AS CNTDEBEME, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
          + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END/MAX(A.CNTTCAMBIO) AS CNTHABEME '
          + ' , '' ''  AS CNTESTADO, '
          + ' MAX(A.CNTFEMIS) AS CNTFEMIS, '
          + ' MAX(A.CNTGLOSA) AS CNTGLOSA, MAX(A.CNTANOMMAJU) AS CNTANOMM, '
          + ' '' ''  CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES,'' '' AS NUEVOMONTO '
          + ','' '' AS CNTCOMPROB '
          + ' FROM CNT305 A, TGE104 B, TGE202 C '
          + ' WHERE A.CIAID='''+dblcCia.Text+''' '
          + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
          + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
          + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '

          + ' UNION ALL '

          + 'SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAID, '
          + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
          + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
          + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END  AS CNTHABEMN, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
          + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END/MAX(A.CNTTCAMBIO) AS CNTDEBEME, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
          + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END/MAX(A.CNTTCAMBIO) AS CNTHABEME '
          + ' , '' ''  AS CNTESTADO, '
          + '  MAX(A.CNTFEMIS) AS CNTFEMIS, '
          + ' MAX(A.CNTGLOSA) AS CNTGLOSA, MAX(A.CNTANOMMAJU) AS CNTANOMM, '
          + ' ''  ''  AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES,  '
          + ' '' '' AS CNTCOMPROB '
          + ' FROM CNT305 A, TGE104 B, TGE202 C '
          + ' WHERE A.CIAID='''+dblcCia.Text+''' '
          + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
          + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
          + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '

          +' UNION ALL '

         + ' SELECT MAX(TDIARID) AS TDIARID,MAX(TDIARDES) AS TDIARDES,'''+CTAREI+''' AS CUENTAID, MAX(CNTTCAMBIO) AS CNTTCAMBIO,'
         + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) <0 THEN (-1)*(SUM(CNTDEBEMN)-SUM(CNTHABEMN)) ELSE 0 END AS CNTDEBEMN, '
         + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) >0 THEN SUM(CNTDEBEMN)-SUM(CNTHABEMN) ELSE 0 END AS CNTHABEMN, '
         + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) <0 THEN (-1)*(SUM(CNTDEBEMN)-SUM(CNTHABEMN)) ELSE 0 END /MAX(CNTTCAMBIO) AS CNTDEBEME, '
         + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) >0 THEN SUM(CNTDEBEMN)-SUM(CNTHABEMN) ELSE 0 END/MAX(CNTTCAMBIO) AS CNTHABEME '
         + ' , '' '' AS CNTESTADO, '
         + ' A.CNTFEMIS  AS CNTFEMIS, '
         + ' MAX(A.CNTGLOSA) AS CNTGLOSA, A.CNTANOMMAJU AS CNTANOMM,'
         + ' CURRENT DATE AS CNTFREG,'' '' AS CNTREG,'''
         + ' ''SDFSDF'' AS CTADES ,'' '' AS CNTCOMPROB  '
         + ' FROM (SELECT  A.CIAID,A.TDIARID,A.CNTANO,MAX(B.TDIARDES) AS TDIARDES, '
         + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO,'
         + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
         + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
         + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
         + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTHABEMN '
         + ' FROM CNT303 A, TGE104 B, TGE202 C  '
         + ' WHERE A.CIAID='''+dblcCia.Text+'''  AND C.CIAID=A.CIAID '
         + ' AND C.CUENTAID=A.CUENTAID  AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
         + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO '

         + ' UNION ALL '

         + ' SELECT  A.CIAID,A.TDIARID,A.CNTANO,MAX(B.TDIARDES) AS TDIARDES, '
         + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO,'
         + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
         + ' SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
         + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
         + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTHABEMN '
         + ' FROM CNT303 A, TGE104 B, TGE202 C  WHERE A.CIAID='''+dblcCia.Text+''' AND  C.CIAID=A.CIAID AND '
         + ' C.CUENTAID=A.CUENTAID  AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
         + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO ) B ';
      End;}
      If SRV_D = 'ORACLE' then
      Begin
         xSQL:='SELECT A.TDIARID AS TDIARID ,'''+xcomprob+''' AS CNTCOMPROB , MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAAJUSTE, '
          + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
          + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),'
          + '0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
          + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),'
          + '0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN, '
          + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
          + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)/MAX(A.CNTTCAMBIO) AS CNTDEBEME, '
          + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
          + ',0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)/MAX(A.CNTTCAMBIO) AS CNTHABEME '
          + ' , '' ''  AS CNTESTADO, '
          + '  MAX(A.CNTFEMIS) AS CNTFEMIS,'''+cntglosa+''' AS CNTGLOSA, MAX(A.CNTANOMMAJU) AS CNTANOMM '
          + ' , SYSDATE AS  CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES , 0.00 AS NUEVOMONTO, '
          + ' MAX(A.CIAID) CIAID, MAX(D.CIADES) CIADES, '' '' DESMES,'' '' PERIODO,'' '' CUENTAORI,'
          + ' 0.00 VALOR_HISTORICO, 0.000 FACTOR, 0.00 VALOR_AJUSTADO, 0.00 DIFERENCIA, '
          + ' '' ''  AS CNTANO,'' ''  AS CNTDINC, 0.00 VALHIST, '' '' AS CIADESPRINC '
          + ' ,'' '' CTA_TIPOREI,'' '' AS CTA_SUMGA,'' '' AS MES ,'' '' AS CNTCOMPROB '
          + ' FROM CNT305 A, TGE104 B, TGE202 C, TGE101 D '
          + ' WHERE A.CIAID='''+dblcCia.Text+''' '
          + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID AND A.CIAID=D.CIAID  '
          + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' AND A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
          + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '
          + ' UNION ALL '

          + 'SELECT A.TDIARID AS TDIARID ,'''+xcomprob+''' AS CNTCOMPROB  ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAAJUSTE, '
          + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
          + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
          + ',0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
          + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
          + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN, '
          + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
          + ',0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)/MAX(A.CNTTCAMBIO) AS CNTDEBEME, '
          + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
          + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)/MAX(A.CNTTCAMBIO) AS CNTHABEME '
          + ' , '' ''  AS CNTESTADO, '
          + '  MAX(A.CNTFEMIS) AS CNTFEMIS,'''
          + cntglosa+''' AS CNTGLOSA, MAX(A.CNTANOMMAJU) AS CNTANOMM, '
          + '  SYSDATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  , 0.00 NUEVOMONTO,'
          + ' MAX(A.CIAID) AS CIAID,MAX(D.CIADES) AS CIADES,'' ''  AS DESMES,'' '' AS PERIODO,'' ''  AS CUENTAORI,'
          + ' 0.00 VALOR_HISTORICO, 0.00 FACTOR, 0.00 VALOR_AJUSTADO, 0.00 DIFERENCIA, '
          + ' '' ''  AS CNTANO,'' ''  AS CNTDINC, 0.00 VALHIST,'' '' AS CIADESPRINC'
          + ','' '' CTA_TIPOREI,'' '' AS CTA_SUMGA,'' '' AS MES ,'' '' AS CNTCOMPROB '

          + ' FROM CNT305 A, TGE104 B, TGE202 C, TGE101 D '
          + ' WHERE A.CIAID='''+dblcCia.Text+''' '
          + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID  AND A.CIAID=D.CIAID'
          + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') AND A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
          + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '

          +' UNION ALL '

         +' SELECT MAX(TDIARID) AS TDIARID,'''+xcomprob+''' AS CNTCOMPROB ,MAX(TDIARDES) AS TDIARDES,'''+CTAREI+''' AS CUENTAAJUSTE, MAX(CNTTCAMBIO) AS CNTTCAMBIO,'
         + ' DECODE(GREATEST(SUM(CNTDEBEMN)-SUM(CNTHABEMN),0),0,(-1)*(SUM(CNTDEBEMN)-SUM(CNTHABEMN)),0) AS CNTDEBEMN, '
         + ' DECODE(LEAST(SUM(CNTDEBEMN)-SUM(CNTHABEMN),0),0,SUM(CNTDEBEMN)-SUM(CNTHABEMN),0) AS CNTHABEMN, '
         + ' DECODE(GREATEST(SUM(CNTDEBEMN)-SUM(CNTHABEMN),0),0,(-1)*(SUM(CNTDEBEMN)-SUM(CNTHABEMN)),0)/MAX(CNTTCAMBIO) AS CNTDEBEME, '
         + ' DECODE(LEAST(SUM(CNTDEBEMN)-SUM(CNTHABEMN),0),0,SUM(CNTDEBEMN)-SUM(CNTHABEMN),0)/MAX(CNTTCAMBIO) AS CNTHABEME '
         + ' , '' '' AS CNTESTADO, '
         + ' MAX(CNTFEMIS) AS CNTFEMIS,'''
         + cntglosa+'''  AS CNTGLOSA, MAX(CNTANOMMAJU) AS CNTANOMM,'
         + ' SYSDATE AS CNTFREG,'' '' AS CNTREG,'''
         + ctareides +'''  AS CTADES, 0.00 NUEVOMONTO, '
         + ' MAX(CIAID) AS CIAID,MAX(CIADES) AS CIADES,'' ''  AS DESMES,'' '' AS PERIODO,'' ''  AS CUENTAORI,'
         + ' 0.00 VALOR_HISTORICO, 0.00 FACTOR, 0.00 VALOR_AJUSTADO, 0.00 DIFERENCIA, '
         + ' '' ''  AS CNTANO,'' ''  AS CNTDINC, 0.00 VALHIST,'' '' AS CIADESPRINC '
         + ','' '' CTA_TIPOREI,'' '' AS CTA_SUMGA,'' '' AS MES ,'' '' AS CNTCOMPROB '

         + ' FROM (SELECT  A.CIAID AS CIAID ,A.TDIARID,A.CNTANO,MAX(B.TDIARDES) AS TDIARDES, '
         + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO,'
         + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),'
         + '0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
         + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
         + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN ,'
         + 'MAX(A.CNTGLOSA) AS CNTGLOSA, MAX(A.CNTFEMIS) AS CNTFEMIS, MAX(A.CNTANOMMAJU) AS CNTANOMMAJU,MAX(D.CIADES) AS CIADES '
         + ' FROM CNT305 A,  TGE104 B, TGE202 C, TGE101 D  '
         + ' WHERE A.CIAID='''+dblcCia.Text+'''  AND C.CIAID=A.CIAID AND A.CIAID=D.CIAID '
         + ' AND C.CUENTAID=A.CUENTAID  AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') AND A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
         + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO '
         + ' UNION ALL '

         + ' SELECT  A.CIAID AS CIAID , A.TDIARID,A.CNTANO,MAX(B.TDIARDES) AS TDIARDES, '
         + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO,'
         + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
         + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
         + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
         + ',0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN, '
         + 'MAX(A.CNTGLOSA) AS CNTGLOSA, MAX(A.CNTFEMIS) AS CNTFEMIS, MAX(A.CNTANOMMAJU) AS CNTANOMMAJU, MAX(D.CIADES) AS CIADES '
         + ' FROM CNT305 A, TGE104 B, TGE202 C, TGE101 D  WHERE A.CIAID='''+dblcCia.Text+'''  AND C.CIAID=A.CIAID AND A.CIAID=D.CIAID AND '
         + ' C.CUENTAID=A.CUENTAID  AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' AND A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
         + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO ) B ';
     End;
   End;

   If RbCompConsol.checked then
   Begin
           if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      Begin
       xSQL:='SELECT MAX(A.CUENTAID) AS CUENTAAJUSTE, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*'
       + 'A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END))>0 '
       + ' THEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 '
       + 'THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR'
       + '-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END))<0 THEN '
       + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END  AS CNTHABEMN '
       + ' , '' ''  AS CIAID,'' '' CIADES,'' '' AS PERIODO, '' '' AS CUENTAORI,'' '' AS MES ,MAX(C.CTADES) AS CTADES,  '
       + ' 0.00 AS  VALOR_HISTORICO, 0.00 AS FACTOR, 0.00 AS VALOR_AJUSTADO, 0.00 AS DIFERENCIA '
       + ', MAX(E.MESDESL) AS DESMES, 0.00 AS NUEVOMONTO,'' '' AS CNTDINC, 0.00 AS VALHIST, '' '' AS CNTANO,MAX(D.CIADES) AS CIADESPRINC, '' '' AS CUENTAAJUSTE, '
       + ' '' '' AS CTA_TIPOREI, '' ''    AS CTA_SUMGA '
       + ',''   '' AS  TDIARID,'' '' AS TDIARDES, 0.000 AS CNTTCAMBIO '
       + ', 0.00 AS CNTDEBEME, 0.00 AS CNTHABEME, '' '' AS CNTFEMIS ,'' '' AS CNTGLOSA'
       + ' ,'' '' AS CNTFREG ,'' '' AS CNTCOMPROB '
       + ' FROM CNT305 A, TGE104 B, TGE202 C, TGE101 D, TGE181 E '
       + ' WHERE  D.CIAID=''01'' AND A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
       + ' AND A.CNTANO='''+speAno.TEXT+''' AND E.MESIDR='''+dblcdmes.text+''' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
       + ' GROUP BY A.TDIARID,A.CNTANO,A.CUENTAID '
       + ' UNION ALL '

       + 'SELECT MAX(A.CUENTAID) AS CUENTAAJUSTE, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
       + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
       + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTHABEMN '
       + ' , '' ''  AS CIAID, '' ''  CIADES, '' '' AS PERIODO, '' '' AS CUENTAORI, '' '' AS MES ,MAX(C.CTADES) AS CTADES, '
       + ' 0.00 VALOR_HISTORICO, 0.00 FACTOR, 0.00 VALOR_AJUSTADO, 0.00 DIFERENCIA  '
       + ', MAX(E.MESDESL) AS DESMES, 0.00 NUEVOMONTO, '' '' AS CNTDINC, 0.00 VALHIST, '' '' AS CNTANO,'' '' AS CIADESPRINC,MAX(D.CIADES) AS CUENTAAJUSTE, '
       + ' '' '' AS CTA_TIPOREI, '' ''    AS CTA_SUMGA '
       + ',''   '' AS  TDIARID,'' '' AS TDIARDES, 0.00 CNTTCAMBIO '
       + ', 0.00 CNTDEBEME, 0.00 CNTHABEME, '' '' AS CNTFEMIS ,'' '' AS CNTGLOSA '
       + ' ,'' '' AS CNTFREG ,'' '' AS CNTCOMPROB '
       + ' FROM CNT305 A, TGE104 B, TGE202 C, TGE101 D, TGE181 E '
       + ' WHERE D.CIAID=''01'' AND  A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
       + ' AND A.CNTANO='''+speAno.TEXT+''' AND E.MESIDR='''+dblcdmes.text+''' AND  C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
       + ' GROUP BY A.TDIARID,A.CNTANO,A.CUENTAID '



      End;

      if SRV_D = 'ORACLE' then
      Begin

         xSQL:='SELECT MAX(A.CUENTAID) AS CUENTAAJUSTE, '
       + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*'
       + ' A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
       + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*'
       + 'A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
       + ' , '' ''  AS CIAID,'' '' AS CIADES ,'' '' AS PERIODO, '' '' AS CUENTAORI,'' '' AS MES ,MAX(C.CTADES) AS CTADES,  '
       + ' 0.00 AS  VALOR_HISTORICO, 0.00 AS FACTOR, 0.00 AS VALOR_AJUSTADO, 0.00 AS DIFERENCIA  '
       + ', MAX(E.MESDESL) AS DESMES, 0.00 AS NUEVOMONTO, '' '' AS CNTDINC, 0.00 AS VALHIST,'' '' AS CNTANO,MAX(D.CIADES) AS CIADESPRINC, '
       + ' '' '' AS CTA_TIPOREI, '' ''    AS CTA_SUMGA '
       +',''   '' AS  TDIARID,'' '' AS TDIARDES, 0.00 AS CNTTCAMBIO '
       +', 0.00 AS CNTDEBEME, 0.00 AS CNTHABEME, '' '' AS CNTFEMIS ,'' '' AS CNTGLOSA '
       +' ,'' '' AS CNTFREG ,'' '' AS CNTCOMPROB '
       + ' FROM CNT305 A, TGE104 B, TGE202 C, TGE101 D, TGE181 E '
       + ' WHERE  A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
       + ' AND A.CNTANO='''+speAno.TEXT+''' AND D.CIAID=''01'' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND E.MESIDR='''+dblcdmes.text+''' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
       + ' GROUP BY A.TDIARID,A.CNTANO,A.CUENTAID '
       + ' UNION ALL '
       + 'SELECT MAX(A.CUENTAID) AS CUENTAAJUSTE, '
       + 'DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*'
       + 'A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),0,(-1)*'
       + 'SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
       + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*'
       + 'A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
       + ' , '' ''  AS CIAID,'' '' AS CIADES, '' '' AS PERIODO, '' '' AS CUENTAORI,'' '' AS MES ,MAX(C.CTADES) AS CTADES, '
       + ' 0.00 VALOR_HISTORICO, 0.00 FACTOR, 0.00 VALOR_AJUSTADO, 0.00 DIFERENCIA  '
       + ', MAX(E.MESDESL) AS DESMES, 0.00 NUEVOMONTO, '' '' AS CNTDINC, 0.00 VALHIST,'' '' AS CNTANO,MAX(D.CIADES) AS CIADESPRINC, '
       + ' '' '' AS CTA_TIPOREI, '' ''    AS CTA_SUMGA '
       +',''   '' AS  TDIARID,'' '' AS TDIARDES, 0.00 CNTTCAMBIO '
       +', 0.00 CNTDEBEME, 0.00 CNTHABEME, '' '' AS CNTFEMIS ,'' '' AS CNTGLOSA '
       +' ,'' '' AS CNTFREG ,'' '' AS CNTCOMPROB '

       + ' FROM CNT305 A, TGE104 B, TGE202 C,TGE101 D, TGE181 E '
       + ' WHERE A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
       + ' AND A.CNTANO='''+speAno.TEXT+''' AND D.CIAID=''01'' AND  C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND E.MESIDR='''+dblcdmes.text+''' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
       + ' GROUP BY A.CNTANO,A.CUENTAID '
      End;
   End;
   {
   Fprincipal.GHistorico.FMant.Cds2.Close;
   Fprincipal.GHistorico.FMant.Cds2.DataRequest(xsql+xsql2);
   Fprincipal.GHistorico.FMant.Cds2.Open;
   Fprincipal.GHistorico.RefreshDisplay;
   }

   // coquito sollib

   FConsulta.GHistorico.UsuarioSQL.Clear;
   FConsulta.GHistorico.UsuarioSQL.Add( xsql);
   FConsulta.GHistorico.NewQuery;

   if FConsulta.GHistorico.FMant.cds2.RecordCount=0 then
   Begin
       Showmessage('No Existen Datos para la Consulta');
       Exit;
   End;

   DMCNT.cdsQry3.Data:=FConsulta.GHistorico.FMant.cds2.Data;

   If RbComCia.checked then
   Begin
     if (SRV_D = 'DB2NT') or  (SRV_D = 'DB2400') then
      Begin
          DMCNT.cdsReporteC.Close;
          DMCNT.cdsReporteC.Filter := '';
          DMCNT.cdsReporteC.Filtered := True;
          DMCNT.cdsReporteC.IndexFieldNames:='';
          DMCNT.cdsReporteC.Close;
          DMCNT.cdsReporteC.DataRequest(XSQL2);
          DMCNT.cdsReporteC.Open;
          FConsulta.GHistorico.FMant.cds2.Insert;
          FConsulta.GHistorico.FMant.cds2.Fieldbyname('CIAID').Asstring:=DMCNT.cdsReporteC.fieldbyname('CIAID').Asstring;
          FConsulta.GHistorico.FMant.cds2.Fieldbyname('CIADES').Asstring:=DMCNT.cdsReporteC.fieldbyname('CIADES').Asstring;
          FConsulta.GHistorico.FMant.cds2.Fieldbyname('CNTCOMPROB').Asstring:=DMCNT.cdsReporteC.fieldbyname('CNTCOMPROB').Asstring;
          FConsulta.GHistorico.FMant.cds2.Fieldbyname('TDIARDES').Asstring:=DMCNT.cdsReporteC.fieldbyname('TDIARDES').Asstring;
          FConsulta.GHistorico.FMant.cds2.Fieldbyname('CUENTAAJUSTE').Asstring:=DMCNT.cdsReporteC.fieldbyname('CUENTAAJUSTE').Asstring;
          FConsulta.GHistorico.FMant.cds2.Fieldbyname('CNTTCAMBIO').Asstring:=DMCNT.cdsReporteC.fieldbyname('CNTTCAMBIO').Asstring;
          FConsulta.GHistorico.FMant.cds2.Fieldbyname('CNTDEBEMN').Asfloat:=DMCNT.cdsReporteC.fieldbyname('CNTDEBEMN').Asfloat;
          FConsulta.GHistorico.FMant.cds2.Fieldbyname('CNTHABEMN').Asfloat:=DMCNT.cdsReporteC.fieldbyname('CNTHABEMN').Asfloat;
          FConsulta.GHistorico.FMant.cds2.Fieldbyname('CNTDEBEME').Asfloat:=DMCNT.cdsReporteC.fieldbyname('CNTDEBEME').Asfloat;
          FConsulta.GHistorico.FMant.cds2.Fieldbyname('CNTHABEME').Asfloat:=DMCNT.cdsReporteC.fieldbyname('CNTHABEME').Asfloat;
          FConsulta.GHistorico.FMant.cds2.Fieldbyname('CNTGLOSA').Asstring:=DMCNT.cdsReporteC.fieldbyname('CNTGLOSA').Asstring;
          FConsulta.GHistorico.FMant.cds2.Fieldbyname('CNTANOMM').Asstring:=DMCNT.cdsReporteC.fieldbyname('CNTANOMM').Asstring;
          FConsulta.GHistorico.FMant.cds2.Fieldbyname('CTADES').Asstring:=DMCNT.cdsReporteC.fieldbyname('CTADES').Asstring;

      End;
   End;



    If RbCompConsol.Checked THEN
    Begin

       DMCNT.cdsReporteC.Close;
       DMCNT.cdsReporteC.Filter := '';
       DMCNT.cdsReporteC.Filtered := True;
       DMCNT.cdsReporteC.IndexFieldNames:='';

       //Suma los totales del debe y haber por el consolidado
       if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
       begin
       //(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)
          xSQL:='SELECT SUM(CNTDEBEMN) AS CNTDEBEMN,SUM(CNTHABEMN) AS CNTHABEMN FROM '
          +' (SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,MAX(A.CUENTAID) AS CUENTAID, '
          + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END))>0 THEN '
          + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END  AS CNTDEBEMN, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END))<0 THEN '
          + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END  AS CNTHABEMN '
          + ' , '' ''  AS CNTESTADO '
          + ' FROM CNT305 A, TGE104 B, TGE202 C '
          + ' WHERE  A.CNTANO='''+SPEANO.Text+''' AND A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
          + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
          + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
          + ' GROUP BY A.TDIARID,A.CNTANO,A.CUENTAID '

          + ' UNION ALL '

          + 'SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,MAX(A.CUENTAID) AS CUENTAID, '
          + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END))<0 THEN '
          + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
          + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END))>0 THEN '
          + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTHABEMN '
          + ' , '' ''  AS CNTESTADO '
          + ' FROM CNT305 A, TGE104 B, TGE202 C '
          + ' WHERE A.CNTANO='''+SPEANO.Text+''' AND  A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
          + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
          + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
          + ' GROUP BY A.TDIARID,A.CNTANO,A.CUENTAID) M '
       End;

       if SRV_D = 'ORACLE' then
       begin
          xSQL:='SELECT SUM(CNTDEBEMN) AS CNTDEBEMN,SUM(CNTHABEMN) AS CNTHABEMN FROM '
          +' (SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES, MAX(A.CUENTAID) CUENTAAJUSTE, '
          + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, MAX( C.CTADES ) CTADES, '' '' DESMES, '' '' CIADESPRINC,  '
          + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
          + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
          + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
          + ',0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
          + ' , '' ''  AS CNTESTADO '
          + ' FROM CNT305 A, TGE104 B, TGE202 C '
          + ' WHERE  A.CNTANO='''+SPEANO.Text+''' AND A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
          + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
          + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
          + ' GROUP BY A.TDIARID,A.CNTANO,A.CUENTAID '
          + ' UNION ALL '
          + 'SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) TDIARDES, MAX(A.CUENTAID) CUENTAAJUSTE, '
          + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, MAX( C.CTADES ) CTADES, '' '' DESMES, '' '' CIADESPRINC, '
          + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
          + ',0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
          + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
          + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
          + ' , '' ''  AS CNTESTADO '
          + ' FROM CNT305 A, TGE104 B, TGE202 C '
          + ' WHERE A.CNTANO='''+SPEANO.Text+''' AND A.CNTANOMMAJU='''+speAno.TEXT+dblcdmes.TEXT+''''
          + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
          + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
          + ' GROUP BY A.TDIARID,A.CNTANO,A.CUENTAID) M '
       End;
       DMCNT.cdsReporteC.close;
       DMCNT.cdsReporteC.datarequest(XSQL);
       DMCNT.cdsReporteC.open;

       ppdbCompConsol.DataSource:=DMCNT.dsReporteC;
       ppdbCompConsol.DataSource:=DMCNT.dsQry3;

       pprCompConsol.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\ComprobConsol.rtm';
       pprCompConsol.template.LoadFromFile ;



        pplblctarei.caption:=ctarei;
        xWhere := 'CUENTAID='+''''+ctarei+'''';
        pplblreides.caption:=DMCNT.DisplayDescrip('PrvTGE','TGE202','CTADES',xWhere,'CTADES');


       if DMCNT.cdsReporteC.FieldByName('CNTDEBEMN').asfloat>DMCNT.cdsReporteC.FieldByName('CNTHABEMN').asfloat then
      Begin
                    pplblhaberei.Visible:=True;
                    pplblhaberei.caption:=floattostr(DMCNT.cdsReporteC.FieldByName('CNTDEBEMN').asfloat-DMCNT.cdsReporteC.FieldByName('CNTHABEMN').asfloat);
                    pplblhaberei.caption:=FORMAT('%15.2f',[STRTOFLOAT(pplblhaberei.CAPTION)]);
                    pplbldeberei.visible:=False;
                    pplbldeberei.caption:='0.00';
      End;

      if DMCNT.cdsReporteC.FieldByName('CNTHABEMN').asfloat>DMCNT.cdsReporteC.FieldByName('CNTDEBEMN').asfloat then
      Begin
                    pplbldeberei.Visible:=True;
                    pplbldeberei.caption:=floattostr(DMCNT.cdsReporteC.FieldByName('CNTHABEMN').asfloat-DMCNT.cdsReporteC.FieldByName('CNTDEBEMN').asfloat);
                    pplbldeberei.caption:=FORMAT('%15.2f',[STRTOFLOAT(pplbldeberei.CAPTION)]);
                    pplblhaberei.visible:=False;
                    pplblhaberei.caption:='0.00';

      End;

      ppLabel49.caption:=floattostr(DMCNT.cdsReporteC.FieldByName('CNTHABEMN').asfloat+strtofloat(pplblhaberei.caption));
      ppLabel49.caption:=FORMAT('%15.2f',[STRTOFLOAT(PPLABEL49.CAPTION)]);
      ppLabel50.caption:=floattostr(DMCNT.cdsReporteC.FieldByName('CNTDEBEMN').asfloat+strtofloat(pplbldeberei.caption));
      ppLabel50.caption:=FORMAT('%15.2f',[STRTOFLOAT(PPLABEL50.CAPTION)]);
      pplblhaberei.caption:=floattostrF(DMCNT.cdsReporteC.FieldByName('CNTDEBEMN').asfloat-DMCNT.cdsReporteC.FieldByName('CNTHABEMN').asfloat,FFNUMBER,15,2);
      pplbldeberei.caption:=floattostrF(DMCNT.cdsReporteC.FieldByName('CNTHABEMN').asfloat-DMCNT.cdsReporteC.FieldByName('CNTDEBEMN').asfloat,FFNUMBER,15,2);

      {      SSql := 'MESIDR='''+COPY(edtPeriodo.Text,5,2)+'''';
      pplblmesr.caption:= DMCNT.DisplayDescrip('PrvTGE','TGE181','MESDESL',SSql,'MESDESL'); //DMCNT.cdsTDiarioTDiarDes.Text;
 }
      //FORMAT('%15.2f',[OperClientDataset(DMCNT.cdsAFCC, 'SUM(AFDEPREP)', '')]);
      pprCompConsol.PRINT;
      pprCompConsol.Stop;

      ppdbCompConsol.DataSource:=nil;

    End;
end;

procedure TFtoolHistAjus.dblcdmesExit(Sender: TObject);
VAR
 xwhere : String;
begin
   xWhere := 'MESIDR='+''''+dblcdmes.Text+'''';
   edtmes.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE181','MESDESL',xWhere,'MESDESL');

end;

procedure TFtoolHistAjus.RbConsolidadoClick(Sender: TObject);
var
 XSQL,xwhere  :String;
begin
  If RbConsolidado.checked then
  Begin
    xsql:='SELECT MIN(CIAID) AS CIAID FROM TGE101';
    DMCNT.cdsQry.close;
    DMCNT.cdsQry.datarequest(XSQL);
    DMCNT.cdsQry.open;
    dblcCia.text:=DMCNT.cdsqry.fieldbyname('CIAID').asstring;
    xWhere   := ' CIAID='''+DMCNT.cdsqry.fieldbyname('CIAID').asstring+'''';
    edtcia.text:=DMCNT.DisplayDescrip('PrvTGE','TGE101','CIADES',xWhere,'CIADES');

    dblcdmes.Enabled:=True;
    speAno.Enabled:=True;
    dblcCia.Enabled:=False;
  End;
end;

procedure TFtoolHistAjus.RbCiaClick(Sender: TObject);
begin
  If RbCia.checked then
  Begin
    dblcdmes.Enabled:=True;
    speAno.Enabled:=True;
    dblcCia.Enabled:=True;
    dblcCia.text:='';
    edtcia.text:='';
  End;

end;

procedure TFtoolHistAjus.RbCompConsolClick(Sender: TObject);
Var
  XSQL,xwhere :String;
begin
  If RbCompConsol.checked then
  Begin
    xsql:='SELECT MIN(CIAID) AS CIAID FROM TGE101';
    DMCNT.cdsQry.close;
    DMCNT.cdsQry.datarequest(XSQL);
    DMCNT.cdsQry.open;
    dblcCia.text:=DMCNT.cdsqry.fieldbyname('CIAID').asstring;
    xWhere   := ' CIAID='''+DMCNT.cdsqry.fieldbyname('CIAID').asstring+'''';
    edtcia.text:=DMCNT.DisplayDescrip('PrvTGE','TGE101','CIADES',xWhere,'CIADES');

    dblcdmes.Enabled:=True;
    speAno.Enabled:=True;
    dblcCia.Enabled:=False;
  End;

end;

procedure TFtoolHistAjus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    DMCNT.cdsReporte.Close;
    DMCNT.cdsReporte.Filter := '';
    DMCNT.cdsReporte.Filtered := True;
    DMCNT.cdsReporte.IndexFieldNames:='';

    DMCNT.cdsReporteC.Close;
    DMCNT.cdsReporteC.Filter := '';
    DMCNT.cdsReporteC.Filtered := True;
    DMCNT.cdsReporteC.IndexFieldNames:='';

    DMCNT.cdsCuenta5.Close;
    DMCNT.cdsCuenta5.Filter := '';
    DMCNT.cdsCuenta5.Filtered := True;
    DMCNT.cdsCuenta5.IndexFieldNames:='';

end;

procedure TFtoolHistAjus.RbComCiaClick(Sender: TObject);
begin
  If RbComCia.checked then
  Begin
    dblcdmes.Enabled:=True;
    speAno.Enabled:=True;
    dblcCia.Enabled:=True;
    dblcCia.Text:='';
    edtcia.text:='';
  End;

end;

end.
