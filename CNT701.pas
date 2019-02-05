unit CNT701;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, wwdbedit, wwdblook, ExtCtrls, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppCache, ppDBPipe, Spin,mant, Wwdbdlg;

type
  TFToolCompGYP = class(TForm)
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
    lblmes: TLabel;
    spemes: TEdit;
    ppRpComparativo: TppReport;
    bitbtnImprime: TBitBtn;
    ppDBComparativo: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel22: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel42: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText24: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText23: TppDBText;
    ppDBText30: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppDBText31: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBText36: TppDBText;
    procedure dblcCiaExit(Sender: TObject);
    procedure dblctdiarioExit(Sender: TObject);
    procedure Z2bbtnRegistra3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z1sbInformesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure z2bbtnAceptarClick(Sender: TObject);
    procedure spemesExit(Sender: TObject);
    procedure bitbtnImprimeClick(Sender: TObject);
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
  FToolCompGYP: TFToolCompGYP;

implementation

uses CNTDM;

{$R *.DFM}

procedure TFToolCompGYP.dblcCiaExit(Sender: TObject);
var
sql:string;
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then
   begin
      edtCia.Text:=DM1.cdsCia.FieldByName('CIADES').AsString;
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
     DM1.cdsCuenta.fetchondemand:=False;
     DM1.cdsCuenta.packetrecords:=-1;
     DM1.cdsCuenta.fetchondemand:=True;
     dm1.Filtracds(DM1.cdsCuenta,SQL);
     Screen.Cursor:=CrDefault;

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
procedure TFToolCompGYP.dblctdiarioExit(Sender: TObject);
begin
{   if dblctdiario.Text<>'' then dbetdiario.Text:=DM1.cdsTDiario.FieldByName('TDIARDES').AsString;

   if length(dbetdiario.Text)=0 then
   begin
      dblctdiario.setfocus;
      raise exception.Create('Falta registrar el Tipo de Diario');
   end;}

end;

procedure TFToolCompGYP.Z2bbtnRegistra3Click(Sender: TObject);
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

      DM1.cdsMovCnt1.Close;
      DM1.cdsMovCnt1.DataRequest(xSQL);
      DM1.cdsMovCnt1.Open;

      if DM1.cdsMovCnt1.recordcount=0 then
         raise exception.Create('No existen registros para la consulta');

      pprComprob.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\Comprobante.rtm';
      pprComprob.template.LoadFromFile ;

      DM1.cdsMovCnt1.indexfieldnames:='CNTCOMPROB';
      pprComprob.Print;
      pprComprob.Stop;

      x10:=self.componentCount-1;
      while x10>0 do begin
        if self.components[x10].classname='TppGroup' then begin
           self.components[x10].free;
        end;
        x10:=x10-1;
      end;

      DM1.cdsMovCnt1.indexfieldnames:='';

 }

 {   xSQL:='Select * From TGE202 where CIAID ='+''''+dblcCIA.Text+''''+
          ' and CTANIV <='+''''+dblcNivel.Text+''''+
          ' and CUENTAID >='+''''+dblcdCtaInic.Text+''''+
          ' and CUENTAID <='+''''+dblcdCtaFinal.Text+''''+
          ' order By CUENTAID';
    DM1.cdsCuenta3.Close;
    DM1.cdsCuenta3.DataRequest(xSQL);
    DM1.cdsCuenta3.Open;

    pplblCia.Caption  :=edtCia.Text;
    pplblNivel.Caption:=dblcNivel.Text;
    pprPlanCtas.Print;
}
end;

procedure TFToolCompGYP.FormActivate(Sender: TObject);
var
  xAno, xMes, xDia : Word;
begin
  DecodeDate(Date, xAno, xMes, xDia);
  speAno.Value:=xAno;
end;

procedure TFToolCompGYP.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFToolCompGYP.Z1sbInformesClick(Sender: TObject);
//var
//reporte,xsql,periodo,xwhere,mesdes,mes,ano:string;
//x10:integer;
Begin
{       if length(dblcCia.text)=0 then
      begin
        dblcCia.setfocus;
        raise exception.Create('Falta registrar la Compañía');
      end;

      if length(speano.text)=0  then
      begin
        speano.setfocus;
        raise exception.Create('Debe registar el Año');
      end;

{Reporte:='select CIAID,CUENTAID,ANO,''ENERO'' MES,''01'' NUMERO,SALDMN00 SALDANT,DEBEMN01 DEBE, '
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

 }
{  DM1.cdsSaldos.Close;
  GSaldos  := TMant.Create(Self);
  try
	GSaldos.Admin           := DM1.wAdmin;
   GSaldos.User            := DM1.wUsuario;
   GSaldos.OnCreateMant    := nil ;
   GSaldos.TableName       := 'VWCNTESTADISSCTA';
   GSaldos.ClientDataSet   := DM1.cdsSALDOS;
   GSaldos.Filter          := '';
   GSaldos.DComC           := DM1.DCOM1;
   GSaldos.OnEdit       	 := nil;
   GSaldos.Module          := dm1.wModulo;
   GSaldos.Titulo 				 := 'Estadística de Cuenta';
   GSaldos.SectionName		 :='CNTEstadísticas';
   GSaldos.FileNameIni     := '\SOLCNT.INI';
   GSaldos.UsuarioSQL.add(reporte);
   GSaldos. Execute;
  Finally
    DM1.cdssaldos.Close;
 	 GSaldos.Free;
  End;
  DM1.cdssaldos.Close;}
end;

procedure TFToolCompGYP.FormCreate(Sender: TObject);
var
  xAno, xMes, xDia : Word;
  sql:string;
begin
  DecodeDate(Date, xAno, xMes, xDia);
  speAno.Value:=xAno;

end;

procedure TFToolCompGYP.z2bbtnAceptarClick(Sender: TObject);
var
xvar1,reporte,mes,ano,xvar,xmess,xsuma,xsuma1,xsql:string;
xlong,i,xmes,u,longitud:integer;

Begin
      fprincipal.GananciayP.UsuarioSQL.clear;

      if length(dblcCia.text)=0 then
      begin
        dblcCia.setfocus;
        raise exception.Create('Falta registrar la Compañía');
      end;

      if length(spemes.text)=0  then
      begin
        spemes.setfocus;
        raise exception.Create('Debe registar el Mes');
      end;

      if length(speano.text)=0  then
      begin
        speano.setfocus;
        raise exception.Create('Debe registar el Año');
      end;
      xtcciaid:=dblcCia.text;

      dm1.cdsQry3.Close;
      xmes:=strtoint(spemes.text);

      for i:=1  to xmes  do
      begin
       if length(inttostr(i))=1 then
          xmess:='0'+inttostr(i);
       xvar:='ABS(DEBEMN'+xmess+'-HABEMN'+xmess+') SALDMN'+xmess+',';
       xvar1:=xvar1+xvar;
       xsuma:='ABS(DEBEMN'+xmess+'-HABEMN'+xmess+') ';
       xsuma1:=xsuma1+'+'+xsuma;
      End;
       longitud:=length(xsuma1);

       xsuma1:=copy(xsuma1,2,longitud);
      {      Reporte:='SELECT B.CUENTAID,A.CTADES AS CTADES,'+xvar1+' ''CONCEPTO'' AS TIPO '
        +' FROM CNT401 B,TGE202 A '
        +' WHERE  A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND A.CIAID='''+dblcCia.text+''''
        +'  AND A.CUENTAID LIKE ''7%'' AND A.CTA_MOV=''S'' '
        +' AND B.ANO='''+speAno.text+''' AND B.TIPREG=''1'' '
        +' UNION ALL '
        +' select B.CUENTAID,A.CTADES AS CTADES,'+xvar1+' ''CONCEPTO DE VENTAS'' AS TIPO '
        +'  FROM CNT401 B,TGE202 A '
        +' WHERE  A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND A.CIAID='''+dblcCia.text+''''
        +' AND A.CUENTAID LIKE ''9%'' AND A.CTA_MOV=''S'' '
        +' AND B.ANO='''+speAno.text+''' AND B.TIPREG=''1''';
 }

      Reporte:='SELECT B.CUENTAID,A.CTADES AS CTADES,ABS(DEBEMN01-HABEMN01) SALDMN01 ,ABS(DEBEMN02-HABEMN02) SALDMN02, '
        +' ABS(DEBEMN03-HABEMN03) SALDMN03,ABS(DEBEMN04-HABEMN04) SALDMN04,ABS(DEBEMN05-HABEMN05) SALDMN05,ABS(DEBEMN06-HABEMN06) SALDMN06, '
        +' ABS(DEBEMN07-HABEMN07) SALDMN07,ABS(DEBEMN08-HABEMN08) SALDMN08,ABS(DEBEMN09-HABEMN09) SALDMN09,ABS(DEBEMN10-HABEMN10) SALDMN10, '
        +' ABS(DEBEMN11-HABEMN11) SALDMN11, ABS(DEBEMN12-HABEMN12) SALDMN12,''CONCEPTO'' AS TIPO,'+xsuma1+' as SUMA,'
        +' DECODE(NVL(C.TOTSALDMN01,0),0,0,(ABS(DEBEMN01-HABEMN01)*100)/C.TOTSALDMN01)  AS PORCEN01,'
        +' DECODE(NVL(C.TOTSALDMN02,0),0,0,(ABS(DEBEMN02-HABEMN02)*100)/C.TOTSALDMN02) AS PORCEN02,'
        +' DECODE(NVL(C.TOTSALDMN03,0),0,0,(ABS(DEBEMN03-HABEMN03)*100)/C.TOTSALDMN03) AS PORCEN03,'
        +' DECODE(NVL(C.TOTSALDMN04,0),0,0,(ABS(DEBEMN04-HABEMN04)*100)/C.TOTSALDMN04) AS PORCEN04, '
        +' DECODE(NVL(C.TOTSALDMN05,0),0,0,(ABS(DEBEMN05-HABEMN05)*100)/C.TOTSALDMN05) AS PORCEN05, '
        +' DECODE(NVL(C.TOTSALDMN06,0),0,0,(ABS(DEBEMN06-HABEMN06)*100)/C.TOTSALDMN06) AS PORCEN06, '
        +' DECODE(NVL(C.TOTSALDMN07,0),0,0,(ABS(DEBEMN07-HABEMN07)*100)/C.TOTSALDMN07) AS PORCEN07, '
        +' DECODE(NVL(C.TOTSALDMN08,0),0,0,(ABS(DEBEMN08-HABEMN08)*100)/C.TOTSALDMN08) AS PORCEN08, '
        +' DECODE(NVL(C.TOTSALDMN09,0),0,0,(ABS(DEBEMN09-HABEMN09)*100)/C.TOTSALDMN09) AS PORCEN09, '
        +' DECODE(NVL(C.TOTSALDMN10,0),0,0,(ABS(DEBEMN10-HABEMN10)*100)/C.TOTSALDMN10) AS PORCEN10, '
        +' DECODE(NVL(C.TOTSALDMN11,0),0,0,(ABS(DEBEMN11-HABEMN11)*100)/C.TOTSALDMN11) AS PORCEN11,'
        +' DECODE(NVL(C.TOTSALDMN12,0),0,0,(ABS(DEBEMN12-HABEMN12)*100)/C.TOTSALDMN12) AS PORCEN12  '
        +' FROM CNT401 B,TGE202 A ,'
        +'(SELECT B.CIAID,B.ANO,SUM(ABS(DEBEMN01-HABEMN01))  TOTSALDMN01, '
        +' SUM(ABS(DEBEMN02-HABEMN02))  TOTSALDMN02, '
        +' SUM(ABS(DEBEMN03-HABEMN03))  TOTSALDMN03, '
        +' SUM(ABS(DEBEMN04-HABEMN04))  TOTSALDMN04, '
        +' SUM(ABS(DEBEMN05-HABEMN05))  TOTSALDMN05, '
        +' SUM(ABS(DEBEMN06-HABEMN06))  TOTSALDMN06, '
        +' SUM(ABS(DEBEMN07-HABEMN07))  TOTSALDMN07, '
        +' SUM(ABS(DEBEMN08-HABEMN08))  TOTSALDMN08, '
        +' SUM(ABS(DEBEMN09-HABEMN09))  TOTSALDMN09, '
        +'  SUM(ABS(DEBEMN10-HABEMN10)) TOTSALDMN10, '
        +' SUM(ABS(DEBEMN11-HABEMN11))  TOTSALDMN11, '
        +' SUM(ABS(DEBEMN12-HABEMN12))  TOTSALDMN12 '
        +' FROM CNT401 B,TGE202 A '
        +' WHERE  A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND A.CIAID=''01'''
        +' AND A.CUENTAID LIKE ''7%'' AND A.CTA_MOV=''S''  AND B.ANO='''+speAno.TEXT+''' AND B.TIPREG=''1'' '
        +' GROUP BY B.CIAID,B.ANO ) C '
        +' WHERE  A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND A.CIAID=''01'''
        +' AND B.CIAID=C.CIAID AND B.ANO=C.ANO AND A.CUENTAID LIKE ''7%'' AND A.CTA_MOV=''S'' '
        +' AND B.ANO='''+speAno.text+''' AND B.TIPREG=''1''   ';

     xsql:='  UNION ALL '
        +' SELECT B.CUENTAID,A.CTADES AS CTADES,ABS(DEBEMN01-HABEMN01) SALDMN01 ,ABS(DEBEMN02-HABEMN02) SALDMN02, '
        +' ABS(DEBEMN03-HABEMN03) SALDMN03,ABS(DEBEMN04-HABEMN04) SALDMN04,ABS(DEBEMN05-HABEMN05) SALDMN05,ABS(DEBEMN06-HABEMN06) SALDMN06, '
        +' ABS(DEBEMN07-HABEMN07) SALDMN07,ABS(DEBEMN08-HABEMN08) SALDMN08,ABS(DEBEMN09-HABEMN09) SALDMN09,ABS(DEBEMN10-HABEMN10) SALDMN10, '
        +' ABS(DEBEMN11-HABEMN11) SALDMN11, ABS(DEBEMN12-HABEMN12) SALDMN12,''CONCEPTO'' AS TIPO,'+xsuma1+' as SUMA,'
        +' DECODE(NVL(C.TOTSALDMN01,0),0,0,(ABS(DEBEMN01-HABEMN01)*100)/C.TOTSALDMN01)  AS PORCEN01,'
        +' DECODE(NVL(C.TOTSALDMN02,0),0,0,(ABS(DEBEMN02-HABEMN02)*100)/C.TOTSALDMN02) AS PORCEN02,'
        +' DECODE(NVL(C.TOTSALDMN03,0),0,0,(ABS(DEBEMN03-HABEMN03)*100)/C.TOTSALDMN03) AS PORCEN03,'
        +' DECODE(NVL(C.TOTSALDMN04,0),0,0,(ABS(DEBEMN04-HABEMN04)*100)/C.TOTSALDMN04) AS PORCEN04, '
        +' DECODE(NVL(C.TOTSALDMN05,0),0,0,(ABS(DEBEMN05-HABEMN05)*100)/C.TOTSALDMN05) AS PORCEN05, '
        +' DECODE(NVL(C.TOTSALDMN06,0),0,0,(ABS(DEBEMN06-HABEMN06)*100)/C.TOTSALDMN06) AS PORCEN06, '
        +' DECODE(NVL(C.TOTSALDMN07,0),0,0,(ABS(DEBEMN07-HABEMN07)*100)/C.TOTSALDMN07) AS PORCEN07, '
        +' DECODE(NVL(C.TOTSALDMN08,0),0,0,(ABS(DEBEMN08-HABEMN08)*100)/C.TOTSALDMN08) AS PORCEN08, '
        +' DECODE(NVL(C.TOTSALDMN09,0),0,0,(ABS(DEBEMN09-HABEMN09)*100)/C.TOTSALDMN09) AS PORCEN09, '
        +' DECODE(NVL(C.TOTSALDMN10,0),0,0,(ABS(DEBEMN10-HABEMN10)*100)/C.TOTSALDMN10) AS PORCEN10, '
        +' DECODE(NVL(C.TOTSALDMN11,0),0,0,(ABS(DEBEMN11-HABEMN11)*100)/C.TOTSALDMN11) AS PORCEN11,'
        +' DECODE(NVL(C.TOTSALDMN12,0),0,0,(ABS(DEBEMN12-HABEMN12)*100)/C.TOTSALDMN12) AS PORCEN12  '
        +' FROM CNT401 B,TGE202 A ,'
        +'(SELECT B.CIAID,B.ANO,SUM(ABS(DEBEMN01-HABEMN01))  TOTSALDMN01, '
        +' SUM(ABS(DEBEMN02-HABEMN02))  TOTSALDMN02, '
        +' SUM(ABS(DEBEMN03-HABEMN03))  TOTSALDMN03, '
        +' SUM(ABS(DEBEMN04-HABEMN04))  TOTSALDMN04, '
        +' SUM(ABS(DEBEMN05-HABEMN05))  TOTSALDMN05, '
        +' SUM(ABS(DEBEMN06-HABEMN06))  TOTSALDMN06, '
        +' SUM(ABS(DEBEMN07-HABEMN07))  TOTSALDMN07, '
        +' SUM(ABS(DEBEMN08-HABEMN08))  TOTSALDMN08, '
        +' SUM(ABS(DEBEMN09-HABEMN09))  TOTSALDMN09, '
        +'  SUM(ABS(DEBEMN10-HABEMN10)) TOTSALDMN10, '
        +' SUM(ABS(DEBEMN11-HABEMN11))  TOTSALDMN11, '
        +' SUM(ABS(DEBEMN12-HABEMN12))  TOTSALDMN12 '
        +' FROM CNT401 B,TGE202 A '
        +' WHERE  A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND A.CIAID=''01'''
        +' AND A.CUENTAID LIKE ''9%'' AND A.CTA_MOV=''S''  AND B.ANO='''+speAno.TEXT+''' AND B.TIPREG=''1'' '
        +' GROUP BY B.CIAID,B.ANO ) C '
        +' WHERE  A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND A.CIAID=''01'''
        +' AND B.CIAID=C.CIAID AND B.ANO=C.ANO AND A.CUENTAID LIKE ''9%'' AND A.CTA_MOV=''S'' '
        +' AND B.ANO='''+speAno.text+''' AND B.TIPREG=''1''   ';

{        +' select B.CUENTAID,A.CTADES AS CTADES,ABS(DEBEMN01-HABEMN01) SALDMN01,ABS(DEBEMN02-HABEMN02) SALDMN02, '
        +' ABS(DEBEMN03-HABEMN03)SALDMN03,ABS(DEBEMN04-HABEMN04) SALDMN04,ABS(DEBEMN05-HABEMN05) SALDMN05,ABS(DEBEMN06-HABEMN06) SALDMN06, '
        +' ABS(DEBEMN07-HABEMN07) SALDMN07, ABS(DEBEMN08-HABEMN08)SALDMN08,ABS(DEBEMN09-HABEMN09) SALDMN09,ABS(DEBEMN10-HABEMN10) SALDMN10, '
        +' ABS(DEBEMN11-HABEMN11) SALDMN11 ,ABS(DEBEMN12-HABEMN12) SALDMN12,''CONCEPTO DE VENTAS'' AS TIPO ,'+xsuma1+' as SUMA,'
        +' DECODE(NVL(C.TOTSALDMN01,0),0,0,(ABS(DEBEMN01-HABEMN01)*100)/C.TOTSALDMN01)  AS PORCEN01,'
        +' DECODE(NVL(C.TOTSALDMN02,0),0,0,(ABS(DEBEMN02-HABEMN02)*100)/C.TOTSALDMN02) AS PORCEN02,'
        +' DECODE(NVL(C.TOTSALDMN03,0),0,0,(ABS(DEBEMN03-HABEMN03)*100)/C.TOTSALDMN03) AS PORCEN03,'
        +' DECODE(NVL(C.TOTSALDMN04,0),0,0,(ABS(DEBEMN04-HABEMN04)*100)/C.TOTSALDMN04) AS PORCEN04, '
        +' DECODE(NVL(C.TOTSALDMN05,0),0,0,(ABS(DEBEMN05-HABEMN05)*100)/C.TOTSALDMN05) AS PORCEN05, '
        +' DECODE(NVL(C.TOTSALDMN06,0),0,0,(ABS(DEBEMN06-HABEMN06)*100)/C.TOTSALDMN06) AS PORCEN06, '
        +' DECODE(NVL(C.TOTSALDMN07,0),0,0,(ABS(DEBEMN07-HABEMN07)*100)/C.TOTSALDMN07) AS PORCEN07, '
        +' DECODE(NVL(C.TOTSALDMN08,0),0,0,(ABS(DEBEMN08-HABEMN08)*100)/C.TOTSALDMN08) AS PORCEN08, '
        +' DECODE(NVL(C.TOTSALDMN09,0),0,0,(ABS(DEBEMN09-HABEMN09)*100)/C.TOTSALDMN09) AS PORCEN09, '
        +' DECODE(NVL(C.TOTSALDMN10,0),0,0,(ABS(DEBEMN10-HABEMN10)*100)/C.TOTSALDMN10) AS PORCEN10, '
        +' DECODE(NVL(C.TOTSALDMN11,0),0,0,(ABS(DEBEMN11-HABEMN11)*100)/C.TOTSALDMN11) AS PORCEN11,'
        +' DECODE(NVL(C.TOTSALDMN12,0),0,0,(ABS(DEBEMN12-HABEMN12)*100)/C.TOTSALDMN12) AS PORCEN12  '
        +'  FROM CNT401 B,TGE202 A ,'
        +'(SELECT B.CIAID,B.ANO,SUM(ABS(DEBEMN01-HABEMN01))  TOTSALDMN01, '
        +' SUM(ABS(DEBEMN02-HABEMN02))  TOTSALDMN02, '
        +' SUM(ABS(DEBEMN03-HABEMN03))  TOTSALDMN03, '
        +' SUM(ABS(DEBEMN04-HABEMN04))  TOTSALDMN04, '
        +' SUM(ABS(DEBEMN05-HABEMN05))  TOTSALDMN05, '
        +' SUM(ABS(DEBEMN06-HABEMN06))  TOTSALDMN06, '
        +' SUM(ABS(DEBEMN07-HABEMN07))  TOTSALDMN07, '
        +' SUM(ABS(DEBEMN08-HABEMN08))  TOTSALDMN08, '
        +' SUM(ABS(DEBEMN09-HABEMN09))  TOTSALDMN09, '
        +'  SUM(ABS(DEBEMN10-HABEMN10)) TOTSALDMN10, '
        +' SUM(ABS(DEBEMN11-HABEMN11))  TOTSALDMN11, '
        +' SUM(ABS(DEBEMN12-HABEMN12))  TOTSALDMN12 '
        +' FROM CNT401 B,TGE202 A '
        +' WHERE  A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND A.CIAID=''01'''
        +' AND B.CIAID=C.CIAID AND B.ANO=C.ANO AND A.CUENTAID LIKE ''9%'' AND A.CTA_MOV=''S''  AND B.ANO='''+speAno.TEXT+''' AND B.TIPREG=''1'' '
        +' GROUP BY B.CIAID,B.ANO ) C '
        +' WHERE  A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND A.CIAID='''+dblcCia.text+''''
        +' AND A.CUENTAID LIKE ''9%'' AND A.CTA_MOV=''S'' '
        +' AND B.ANO='''+speAno.text+''' AND B.TIPREG=''1''  ';}

   Fprincipal.GananciayP.FMant.Cds2.Close;
   Fprincipal.GananciayP.FMant.Cds2.DataRequest(Reporte+xsql);
   Fprincipal.GananciayP.FMant.Cds2.Open;
   Fprincipal.GananciayP.RefreshDisplay;
   Fprincipal.GananciayP.FMant.wUserSQL:=Reporte;
//   dblcCia.setfocus;
end;

procedure TFToolCompGYP.spemesExit(Sender: TObject);
begin
if length(spemes.text)=1 then
   spemes.text:='0'+spemes.text;
end;

procedure TFToolCompGYP.bitbtnImprimeClick(Sender: TObject);
begin
      ppRpComparativo.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\Comparativo1.rtm';
      ppRpComparativo.template.LoadFromFile ;
      ppRpComparativo.print

end;

end.
