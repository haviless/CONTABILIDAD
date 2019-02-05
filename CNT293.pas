unit CNT293;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls, Buttons, Mask,
  wwdbedit, ppEndUsr, ppParameter, ppCtrls, ppBands, ppClass, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe;

type
  TFLiquidacion = class(TForm)
    Panel1: TPanel;
    dbgLiquida: TwwDBGrid;
    bbtnSustento: TBitBtn;
    bbtnRendiCont: TBitBtn;
    bbtnRendi: TBitBtn;
    Label2: TLabel;
    dbeNoOfi: TwwDBEdit;
    Label3: TLabel;
    dbeEquipo: TwwDBEdit;
    Label5: TLabel;
    dbeFecha: TwwDBEdit;
    Label6: TLabel;
    dbeUsuario: TwwDBEdit;
    Label4: TLabel;
    dbeCuenta: TwwDBEdit;
    Label1: TLabel;
    dbeMoneda: TwwDBEdit;
    dbeMonto: TwwDBEdit;
    bbtnConRen: TBitBtn;
    ppdbVoucher: TppDBPipeline;
    pprv: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel10: TppLabel;
    ppLabel23: TppLabel;
    ppLabel14: TppLabel;
    ppLabel26: TppLabel;
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
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    lblperiodo: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText3: TppDBText;
    ppLabel78: TppLabel;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
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
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel18: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText99: TppDBText;
    ppLabel13: TppLabel;
    ppLabel7: TppLabel;
    pplCmp: TppLabel;
    ppLabel79: TppLabel;
    ppLabel19: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppDBText43: TppDBText;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppDBText44: TppDBText;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppDBText45: TppDBText;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppParameterList1: TppParameterList;
    ppd1: TppDesigner;
    bbtnCC: TBitBtn;
    BitBtn1: TBitBtn;
    cbDisenoRep: TCheckBox;
    sbDisenoRep: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure bbtnSustentoClick(Sender: TObject);
    procedure dbgLiquidaDblClick(Sender: TObject);
    procedure bbtnRendiClick(Sender: TObject);
    procedure bbtnRendiContClick(Sender: TObject);
    procedure bbtnConRenClick(Sender: TObject);
    procedure bbtnCCClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ContabilizaRendicion;
  end;

var
  FLiquidacion: TFLiquidacion;

implementation

{$R *.dfm}

USES CNTDM, CNT295, CNT297;

procedure TFLiquidacion.FormActivate(Sender: TObject);
var
   xSQL : String;
   dProvisionado : Double;
begin
   if DMCNT.cdsCNT311.FieldByName('ESTCON').AsString='S' then
   begin
      bbtnSustento.Visible :=False;
      bbtnCC.Visible       :=False;
      bbtnRendi.Visible    :=True;
      bbtnRendiCont.Visible:=True;
      bbtnConRen.Visible   :=True;
   end
   else
   begin
      bbtnSustento.Visible :=True;
      bbtnCC.Visible       :=True;
      bbtnRendi.Visible    :=False;
      bbtnRendiCont.Visible:=False;
      bbtnConRen.Visible   :=False;
   end;


   dbeNoOfi.DataSource  :=DMCNT.dsCNT311;
   dbeEquipo.DataSource :=DMCNT.dsCNT311;
   dbeFecha.DataSource  :=DMCNT.dsCNT311;
   dbeUsuario.DataSource:=DMCNT.dsCNT311;
   dbeCuenta.DataSource :=DMCNT.dsCNT311;
   dbeMoneda.DataSource :=DMCNT.dsCNT311;
   dbeMonto.DataSource  :=DMCNT.dsCNT311;

   dbgLiquida.DataSource:=DMCNT.dsLiqCon;

   xSQL:='Select * from CNT_LIQ_CAB '
        +'Where EQUIPO='''+DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString+''' '
        +  'and NUMOFI='''+DMCNT.cdsCNT311.FieldByName('NUMOFI').AsString+''' '
        +  'and ANOLIQ='''+DMCNT.cdsCNT311.FieldByName('ANOOFI').AsString+''' '
        +'ORDER BY ORDEN';
   DMCNT.cdsLiqCon.Close;
   DMCNT.cdsLiqCon.DataRequest( xSQL );
   DMCNT.cdsLiqCon.Open;


   dProvisionado:=DMCNT.FRound(DMCNT.OperClientDataSet(DMCNT.cdsLiqCon,'SUM(IMPTOT)',''),15,2);
   dbgLiquida.ColumnByName('IMPTOT').FooterValue  :=FloatToStrF(dProvisionado,ffNumber,15,2);
end;

procedure TFLiquidacion.bbtnSustentoClick(Sender: TObject);
begin
   if DMCNT.cdsCNT311.FieldByName('ESTCON').AsString='S' then
   begin
      ShowMessage('Oficio Contabilizado. Nose pueden hacer cambios');
      Exit;
   end;

   DMCNT.cdsLiqCon.Edit;

   if DMCNT.cdsLiqCon.FieldByName('ESTLIQSUS').AsString='S' then
      DMCNT.cdsLiqCon.FieldByName('ESTLIQSUS').AsString:='N'
   else
      DMCNT.cdsLiqCon.FieldByName('ESTLIQSUS').AsString:='S';

   DMCNT.cdsLiqCon.Post;
   DMCNT.cdsLiqCon.ApplyUpdates(0);
   ShowMessage('Ok.');
end;

procedure TFLiquidacion.dbgLiquidaDblClick(Sender: TObject);
begin
  try
     FLiqDet:= TFLiqDet.Create(self);
     FLiqDet.bbtnCNT.Visible:=False;
     FLiqDet.pnlCNT.Enabled:=False;
     FLiqDet.ShowModal;
  finally
     FLiqDet.Free;
  end;
end;

procedure TFLiquidacion.bbtnRendiClick(Sender: TObject);
begin
   if DMCNT.cdsLiqCon.FieldByName('ESTLIQSUS').AsString='S' then
   begin
      ShowMessage('Liquidación ya fue Sustentada, no se puede hacer Rendición');
      Exit;
   end;

   if DMCNT.cdsLiqCon.FieldByName('ESTCONREN').AsString='S' then
   begin
      ShowMessage('Rendición ya fue Contabilizada. No se puede cambiar Estado de Rendición');
      Exit;
   end;

   DMCNT.cdsLiqCon.Edit;
   if DMCNT.cdsLiqCon.FieldByName('ESTRENLIQ').AsString='S' then
      DMCNT.cdsLiqCon.FieldByName('ESTRENLIQ').AsString:='N'
   else
      DMCNT.cdsLiqCon.FieldByName('ESTRENLIQ').AsString:='S';

   DMCNT.cdsLiqCon.Post;
   DMCNT.cdsLiqCon.ApplyUpdates(0);
   ShowMessage('Ok.');
end;

procedure TFLiquidacion.bbtnRendiContClick(Sender: TObject);
begin
  if DMCNT.cdsLiqCon.FieldByName('CENCOS').AsString='' then
  begin
     ShowMessage('Falta Ingresar el Centro de Costo');

     try
        FLiqCC:= TFLiqCC.Create(self);
        FLiqCC.ShowModal;
     finally
        FLiqCC.Free;
     end;
  end;

  if DMCNT.cdsLiqCon.FieldByName('CENCOS').AsString='' then
  begin
     ShowMessage('Falta Ingresar el Centro de Costo');
     Exit;
  end;

  if DMCNT.cdsLiqCon.FieldByName('ESTRENLIQ').AsString<>'S' then
  begin
     ShowMessage('Liquidación no esta marcada para Rendición de Cuentas');
     Exit;
  end;

  if DMCNT.cdsLiqCon.FieldByName('ESTCONREN').AsString='S' then
  begin
     ShowMessage('Rendición ya fue Contabilizada');
     Exit;
  end;

  try
     FLiqDet:= TFLiqDet.Create(self);
     FLiqDet.bbtnCNT.Visible:=True;
     FLiqDet.pnlCNT.Enabled:=True;
     FLiqDet.ShowModal;
  finally
     FLiqDet.Free;
  end;
end;


procedure TFLiquidacion.ContabilizaRendicion;
var
   xSQL    : String;
   cDolar, cSoles, cTotal, cDolarD, cSolesD : String;
   cPeriodo, cLote, cTM : String;
   cOrigen, cOriDes, cNReg : String;
   cCia, cCiaDes, cClAux, cAux, cAuxDes, cCCos, cCosDes    : String;
   cNumCom, cCtaCiaHabe : String;
   cCtaCiaDebe, cCtaBanco, cCtaBanDe, cNumDoc : String;
   cTipCam, cCtaDes, cCtaDes2 : String;
begin

   Screen.Cursor:=CrHourGlass;

   cCia   :='02';
   cOrigen:='56';
   cLote  :='REOF';

   cTM:='N';
   if DMCNT.cdsCNT311.FieldByName('MONEDA').AsString='D' then
      cTM:='D';

   xSQL:='SELECT SUBSTR(TDIARDES,1,20) TDIARDES '
        +'FROM TGE104 '
        +'WHERE TDIARID='''+cOrigen+'''';
	 DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   cOriDes:=DMCNT.cdsQry2.FieldByName('TDIARDES').AsString;


   xSQL:='Select TCAMVBV From TGE107 '
        +'Where TMONID=''D'' and FECHA='''+DMCNT.cdsLiqCon.FieldByName('FECRENLIQ').AsString+''' ';
	 DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   if DMCNT.cdsQry2.RecordCount <= 0 then
   begin
      Screen.Cursor:=CrDefault;
      ShowMessage('Falta el Tipo de Cambio');
      Exit;
   end;
   cTipCam:=DMCNT.cdsQry2.FieldByName('TCAMVBV').AsString;

	 xSQL:='SELECT * FROM TGE114 WHERE FECHA='+quotedstr(DMCNT.cdsLiqCon.FieldByName('FECRENLIQ').AsString);
	 DMCNT.cdsQry3.Close;
   DMCNT.cdsQry3.DataRequest(xSQL);
   DMCNT.cdsQry3.Open;
   cPeriodo:=DMCNT.cdsQry3.fieldbyName('FECANO').asString+DMCNT.cdsQry3.fieldbyName('FECMES').asString;

   // DETALLE 1 - CNT301
   xSQL:='select sum(case when nvl(rendicion,0)<>0 then rendicion else Importe end) Importe '
        +'from CNT_LIQ_CAB a, CNT_LIQ_DET b '
        +'where a.ANOLIQ='''+DMCNT.cdsCNT311.FieldByName('ANOOFI').AsString+''' '
        +  'and a.EQUIPO='''+DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString+''' '
        +  'and a.NUMOFI='''+DMCNT.cdsCNT311.FieldByName('NUMOFI').AsString+''' '
        +  'and a.NUMLIQ='''+DMCNT.cdsLiqCon.FieldByName('NUMLIQ').AsString+''' '
        +  'and a.AnoLiq=b.AnoLiq and a.NumLiq=b.NumLiq ';
   DMCNT.cdsSQL.Close;
   DMCNT.cdsSQL.DataRequest( xSQL );
   DMCNT.cdsSQL.Open;

   cTotal:=DMCNT.cdsSQL.FieldByName('IMPORTE').AsString;

   if cTM='N' then
   begin
      cSoles:=FloatToStr(DMCNT.cdsSQL.FieldByName('IMPORTE').AsFloat);
      cDolar:=FloatToStr(DMCNT.FRound(DMCNT.cdsSQL.FieldByName('IMPORTE').AsFloat/DMCNT.cdsQry2.FieldByName('TCAMVBV').AsFloat,15,2));
   end
   else
   begin
      cDolar:=FloatToStr(DMCNT.cdsSQL.FieldByName('IMPORTE').AsFloat);
      cSoles:=FloatToStr(DMCNT.FRound(DMCNT.cdsSQL.FieldByName('IMPORTE').AsFloat*DMCNT.cdsQry2.FieldByName('TCAMVBV').AsFloat,15,2));
   end;


   if DMCNT.cdsLiqCon.FieldByName('NUMCOM').AsString='' then
   begin
      xSQL:='SELECT LPAD(MAX(CNTCOMPROB)+1,10,''0'') CNTCOMPROB '
           +'FROM CNT300 '
           +'WHERE CIAID='''+cCia+''' AND CNTANOMM='''+cPeriodo+''' AND TDIARID='''+cOrigen+''' '
           +'GROUP BY CIAID, TDIARID, CNTANOMM ';
      DMCNT.cdsQry2.Close;
      DMCNT.cdsQry2.DataRequest(xSQL);
      DMCNT.cdsQry2.Open;
      if DMCNT.cdsQry2.RecordCount<=0 then
         cNumCom:='0000000001'
      else
         cNumCom:=DMCNT.cdsQry2.FieldByName('CNTCOMPROB').AsString;
      end
   else
   begin
      cNumCom:=DMCNT.cdsLiqCon.FieldByName('NUMCOM').AsString;
   end;

   // CNT300

   xSQL:='Insert Into CNT300( CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTLOTE, '
        +  'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
        +  'CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, TDIARDES, CNTTS, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, DOCMOD, MODULO ) '
        +'Values('''+cCia+''', '''+cOrigen+''', '''+cNumCom+''', '
        +  ''''+cPeriodo+''', '''+cLote+''', '
        +  '''OF:'+DMCNT.cdsCNT311.FieldByName('NUMOFI').AsString+' - '
        +    'LQ:'+DMCNT.cdsLiqCon.FieldByName('NUMLIQ').AsString+' - '
        +    DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString+''', '
        +  cTipCam+', '
        +  ''''+DMCNT.cdsLiqCon.FieldByName('FECRENLIQ').AsString+''', '
        +  '''I'', '''+DMCNT.wUsuario+''', sysdate, sysdate, '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECANO').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECMES').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECDIA').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECTRIM').asString +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSEM').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSS').asString   +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAATRI').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASEM').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASS').asString +''', '
        +  ''''+cTM+''', '
        +  'null, '''+cOriDes+''', ''BV'', '
        +  cSoles+', '+cDolar+', '
        +  cSoles+', '+cDolar+', '
        +  '''CNT'', ''INT'' )';
   DMCNT.cdsSQL.Close;
   DMCNT.cdsSQL.DataRequest( xSQL );
   DMCNT.cdsSQL.Execute;

   // DETALLE 1 - CNT301
   xSQL:='select b.Cuenta, case when nvl(rendicion,0)<>0 then rendicion else Importe end Importe, '
        +   'a.CodUsu, a.CENCOS '
        +'from CNT_LIQ_CAB a, CNT_LIQ_DET b '
        +'where a.ANOLIQ='''+DMCNT.cdsCNT311.FieldByName('ANOOFI').AsString+''' '
        +  'and a.EQUIPO='''+DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString+''' '
        +  'and a.NUMOFI='''+DMCNT.cdsCNT311.FieldByName('NUMOFI').AsString+''' '
        +  'and a.NUMLIQ='''+DMCNT.cdsLiqCon.FieldByName('NUMLIQ').AsString+''' '
        +  'and a.AnoLiq=b.AnoLiq and a.NumLiq=b.NumLiq '
        +'order by a.CodUsu';
   DMCNT.cdsReporteC.Close;
   DMCNT.cdsReporteC.DataRequest( xSQL );
   DMCNT.cdsReporteC.Open;

   cNReg:='1';
   while not DMCNT.cdsReporteC.Eof do
   begin

      xSQL:='SELECT A.PROV, B.CCOSID, B.CCOSABR, A.PROVABR '
           +'FROM TGE201 A, TGE203 B '
           +'WHERE EQUPROOFI='''+DMCNT.cdsReporteC.FieldByName('CODUSU').AsString+''' '
           +  'AND CCOSID(+)='''+DMCNT.cdsReporteC.FieldByName('CENCOS').AsString+''' ';
      DMCNT.cdsQry2.Close;
      DMCNT.cdsQry2.DataRequest(xSQL);
      DMCNT.cdsQry2.Open;

      cClAux :='E';
      cAux   :=DMCNT.cdsQry2.FieldByName('PROV').AsString;
      cAuxDes:=DMCNT.cdsQry2.FieldByName('PROVABR').AsString;
      if cAux='' then
      begin
         cAux   :='E9999';
         cAuxDes:='VARIOS';
      end;

      cCCos  :=DMCNT.cdsQry2.FieldByName('CCOSID').AsString;
      cCosDes:=DMCNT.cdsQry2.FieldByName('CCOSABR').AsString;
      if cCcos='' then
      begin
         cCCos  :='8888';
         cCosDes:='GASTOS GRALES';
      end;

      xSQL:='SELECT CUENTAID, CTADES, CTA_AUX, CTA_CCOS FROM TGE202 '
           +'WHERE CIAID=''02'' AND CUENTAID='''+DMCNT.cdsReporteC.FieldByName('CUENTA').AsString+'''';
      DMCNT.cdsQry2.Close;
      DMCNT.cdsQry2.DataRequest(xSQL);
      DMCNT.cdsQry2.Open;

      cCtaDes:=DMCNT.cdsQry2.FieldByName('CTADES').AsString;

      if DMCNT.cdsQry2.FieldByName('CTA_AUX').AsString<>'S' then
      begin
         cClAux :='';
         cAux   :='';
         cAuxDes:='';
      end;
      if DMCNT.cdsQry2.FieldByName('CTA_CCOS').AsString<>'S' then
      begin
         cCCos  :='';
         cCosDes:='';
      end;

      if cTM='N' then
      begin
         cSolesD:=FloatToStr(DMCNT.cdsReporteC.FieldByname('IMPORTE').AsFloat);
         cDolarD:=FloatToStr(DMCNT.FRound(DMCNT.cdsReporteC.FieldByname('IMPORTE').AsFloat/StrtoFloat(cTipCam),15,2));
      end
      else
      begin
         cDolarD:=FloatToStr(DMCNT.cdsReporteC.FieldByname('IMPORTE').AsFloat);
         cSolesD:=FloatToStr(DMCNT.FRound(DMCNT.cdsReporteC.FieldByname('IMPORTE').AsFloat*StrToFloat(cTipCam),15,2));
      end;

      cNumDoc:=trim(DMCNT.cdsCNT311.FieldByName('NUMOFI').AsString)
              +' - '+DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString;


      xSQL:='Insert Into CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, '
           +   'CNTLOTE, CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, '
           +   'CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, '
           +   'CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, '
           +   'CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, '
           +   'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, TDIARDES, '
           +   'CTADES, AUXDES, DOCDES, CCOSDES, CNTDEBEMN, CNTDEBEME, '
           +   'CNTHABEMN, CNTHABEME, CNTTS, CNTMODDOC, CNTREG, MODULO ) '
           +'Values('''+cCia+''', '''+cOrigen+''', '''+cNumCom+''', '
           +  ''''+DMCNT.cdsQry3.fieldbyName('FECANO').asString  +''', '
           +  ''''+cPeriodo+''', '''+cLote+''', '''+DMCNT.cdsReporteC.FieldByName('CUENTA').AsString+''', '
           +  ''''+cClAux+''', '''+cAux+''', ''23'', '
           +  ''''+'OF'+''', '''+cNumDoc+''', '
           +  '''Liq. : '+DMCNT.cdsLiqCon.FieldByName('NUMLIQ').AsString+' - '
           +     DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString+''', '
           +  '''D'', '''+cCCos+''', '+cTipCam+', '
           +  DMCNT.cdsReporteC.FieldByname('IMPORTE').AsString +', '
           +  cSolesD+', '+cDolarD+', '
           +  ''''+DMCNT.cdsLiqCon.FieldByName('FECRENLIQ').AsString+''', '
           +  ''''+DMCNT.cdsLiqCon.FieldByName('FECRENLIQ').AsString+''', '
           +  ''''+DMCNT.cdsLiqCon.FieldByName('FECRENLIQ').AsString+''', '
           +  '''I'', ''N'', NULL, '''+DMCNT.wUsuario+''', SYSDATE, SYSDATE, '
           +  ''''+DMCNT.cdsQry3.fieldbyName('FECMES').asString  +''', '
           +  ''''+DMCNT.cdsQry3.fieldbyName('FECDIA').asString  +''', '
           +  ''''+DMCNT.cdsQry3.fieldbyName('FECTRIM').asString +''', '
           +  ''''+DMCNT.cdsQry3.fieldbyName('FECSEM').asString  +''', '
           +  ''''+DMCNT.cdsQry3.fieldbyName('FECSS').asString   +''', '
           +  ''''+DMCNT.cdsQry3.fieldbyName('FECAATRI').asString+''', '
           +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASEM').asString+''', '
           +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASS').asString +''', '
           +  ''''+cTM+''', '
           +  ''''+cOriDes+''', '''+cCtaDes+''', '''+cAuxDes+''', ''Otros'', '''+cCosDes+''', '
           +  cSolesD+', '+cDolarD+', 0, 0, ''BV'', ''CNT'', '+cNReg+', ''INT'' ) ';
      DMCNT.cdsSQL.Close;
      DMCNT.cdsSQL.DataRequest( xSQL );
      DMCNT.cdsSQL.Execute;

      cNReg:=IntToStr(StrToInt(cNreg)+1);

      DMCNT.cdsReporteC.Next;
   end;



   // DETALLE 2 - CNT301


   xSQL:='SELECT A.PROV, A.CENCOSOFI CCOSID, B.CCOSABR, A.PROVABR '
        +'FROM TGE201 A, TGE203 B '
        +'WHERE EQUPROOFI='''+DMCNT.cdsReporteC.FieldByName('CODUSU').AsString+''' '
        +  'AND CENCOSOFI=CCOSID(+)';
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;

   cClAux :='E';
   cAux   :=DMCNT.cdsQry2.FieldByName('PROV').AsString;
   cAuxDes:=DMCNT.cdsQry2.FieldByName('PROVABR').AsString;
   if cAux='' then
   begin
      cAux   :='E9999';
      cAuxDes:='VARIOS';
   end;

   cCCos  :=DMCNT.cdsQry2.FieldByName('CCOSID').AsString;
   cCosDes:=DMCNT.cdsQry2.FieldByName('CCOSABR').AsString;
   if cCcos='' then
   begin
      cCCos  :='8888';
      cCosDes:='GASTOS GRALES';
   end;

   cCtaBanco:='386';

   xSQL:='SELECT CUENTAID, CTADES, CTA_AUX, CTA_CCOS FROM TGE202 '
        +'WHERE CIAID=''02'' AND CUENTAID='''+cCtaBanco+'''';
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;

   cCtaBanDe:=DMCNT.cdsQry2.FieldByName('CTADES').AsString;

   if DMCNT.cdsQry2.FieldByName('CTA_AUX').AsString<>'S' then
   begin
      cClAux :='';
      cAux   :='';
      cAuxDes:='';
   end;
   if DMCNT.cdsQry2.FieldByName('CTA_CCOS').AsString<>'S' then
   begin
      cCCos  :='';
      cCosDes:='';
   end;


   cNumDoc:=trim(DMCNT.cdsCNT311.FieldByName('NUMOFI').AsString)
           +' - '+DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString;

   xSQL:='Insert Into CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, '
        +   'CNTLOTE, CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, '
        +   'CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, '
        +   'CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, '
        +   'CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, '
        +   'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, TDIARDES, '
        +   'CTADES, AUXDES, DOCDES, CCOSDES, CNTDEBEMN, CNTDEBEME, '
        +   'CNTHABEMN, CNTHABEME, CNTTS, CNTMODDOC, CNTREG, MODULO ) '
        +'Values('''+cCia+''', '''+cOrigen+''', '''+cNumCom+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECANO').asString  +''', '
        +  ''''+cPeriodo+''', '''+cLote+''', '''+cCtaBanco+''', '''+cClAux+''', '
        +  ''''+cAux+''', ''23'', '''+'OF'+''', '''+cNumDoc+''', '
        +  '''Liq. : '+DMCNT.cdsLiqCon.FieldByName('NUMLIQ').AsString+' - '
        +     DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString+''', '
        +  '''H'', NULL, '+cTipCam+', '
        +  cTotal+', '+cSoles+', '+cDolar+', '
        +  ''''+DMCNT.cdsLiqCon.FieldByName('FECRENLIQ').AsString+''', '
        +  ''''+DMCNT.cdsLiqCon.FieldByName('FECRENLIQ').AsString+''', '
        +  ''''+DMCNT.cdsLiqCon.FieldByName('FECRENLIQ').AsString+''', '
        +  '''I'', ''N'', NULL, '''+DMCNT.wUsuario+''', SYSDATE, SYSDATE, '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECMES').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECDIA').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECTRIM').asString +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSEM').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSS').asString   +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAATRI').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASEM').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASS').asString +''', '
        +  ''''+cTM+''', '
        +  ''''+cOriDes+''', '''+cCtaBanDe+''', '''+cAuxDes+''', ''Otros'', '''+cCosDes+''', '
        +  '0, 0, '+cSoles+', '+cDolar+', ''BV'', ''CNT'', '+cNReg+', ''INT'' ) ';
   DMCNT.cdsSQL.Close;
   DMCNT.cdsSQL.DataRequest( xSQL );
   DMCNT.cdsSQL.Execute;


   DMCNT.cdsLiqCon.Edit;
   DMCNT.cdsLiqCon.FieldByName('ESTCONREN').AsString:='S';
   DMCNT.cdsLiqCon.FieldByName('USUCONREN').AsString:=DMCNT.wUsuario;
   DMCNT.cdsLiqCon.FieldByName('NUMCOM').AsString   :=cNumCom;
   DMCNT.cdsLiqCon.Post;
   DMCNT.cdsLiqCon.ApplyUpdates(0);
   Screen.Cursor:=CrDefault;
   ShowMessage('Ok.');
end;


procedure TFLiquidacion.bbtnConRenClick(Sender: TObject);
var
  xSQL   : String;
  cCia   : String;
  cOrigen, cPeriodo, xCampos, cTabla : String;
  cLote  : String;
  X10 : INTEGER;
begin
  cCia   :='02';
  cOrigen:='56';
  cLote  :='REOF';

  if DMCNT.cdsLiqCon.FieldByName('ESTCONREN').AsString<>'S' then
  begin
     ShowMessage('No existe Comprobante Contable. Debe Contabilizar Oficio');
     Exit;
  end;

  Screen.Cursor:=CrHourGlass;

	xSQL:='SELECT * FROM TGE114 WHERE FECHA='+quotedstr(DMCNT.cdsLiqCon.FieldByname('FECRENLIQ').AsString);
	DMCNT.cdsQry3.Close;
  DMCNT.cdsQry3.DataRequest(xSQL);
  DMCNT.cdsQry3.Open;
  cPeriodo:=DMCNT.cdsQry3.fieldbyName('FECANO').asString+DMCNT.cdsQry3.fieldbyName('FECMES').asString;

  xCampos:= ''''+DMCNT.cdsQry3.fieldbyName('FECMES').asString+' '+DMCNT.cdsQry3.fieldbyName('FECANO').asString+''' PERIODO ';

  xsql:='SELECT CNTESTADO FROM CNT300 A '
       +'WHERE A.CIAID='''+cCia+''' and A.TDIARID='''+cOrigen+''' and A.CNTANOMM='''+cPeriodo+''' '
       +  'and A.CNTCOMPROB='''+DMCNT.cdsLiqCon.FieldByName('NUMCOM').AsString+''' ';
  DMCNT.cdsQry.Close;
  DMCNT.cdsQry.DataRequest(xSQL);
  DMCNT.cdsQry.Open;
  if DMCNT.cdsQry.FieldByName('CNTESTADO').AsString='P' then
     cTabla:='CNT301'
  else
     cTabla:='CNT311';

  xsql:='SELECT A.*, B.CIADES, A.TDIARID||'' - ''||C.TDIARDES ORIGEN, '
       +  'CASE WHEN D.CNTESTADO=''P'' THEN ''Contabilizado'' '
       +       'ELSE CASE WHEN D.CNTESTADO=''I'' THEN ''Inicial'' '
       +                 'ELSE CASE WHEN D.CNTESTADO=''A'' THEN ''Anulado'' '
       +                           'ELSE ''ERROR'' END '
       +            'END '
       +  'END ESTADO, D.CNTGLOSA GLOSA, M.TMONDES MONEDA, '+xCampos
       +'FROM '+cTabla+' A, CNT300 D, TGE101 B, TGE104 C, TGE103 M '
       +'WHERE A.CIAID='''+cCia+''' and A.TDIARID='''+cOrigen+''' and A.CNTANOMM='''+cPeriodo+''' '
       +  'and A.CNTCOMPROB='''+DMCNT.cdsLiqCon.FieldByName('NUMCOM').AsString+''' '
       +  'and A.CIAID=D.CIAID AND A.TDIARID=D.TDIARID  '
       +  'and A.CNTANOMM=D.CNTANOMM AND A.CNTCOMPROB=D.CNTCOMPROB '
       +  'and A.CIAID=B.CIAID AND A.TDIARID=C.TDIARID AND A.TMONID=M.TMONID '
       +'ORDER BY A.CIAID, A.CNTANOMM, A.TDIARID, A.CNTREG';

   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;

   ppdbVoucher.DataSource:=DMCNT.dsQry;
   pprv.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\ComprobanteTX.rtm';
   pprv.template.LoadFromFile ;
   Screen.Cursor:=CrDefault;
   if cbDisenoRep.Checked then
      ppd1.ShowModal
   else
   begin
      pprv.Print;
      pprv.Stop;

      x10:=self.componentCount-1;
      while x10>0 do begin
        if self.components[x10].classname='TppGroup' then begin
           self.components[x10].free;
        end;
        x10:=x10-1;
      end;

      ppdbVoucher.DataSource:=nil;
   end;
end;

procedure TFLiquidacion.bbtnCCClick(Sender: TObject);
begin
  if DMCNT.cdsLiqCon.FieldByName('ESTCONREN').AsString='S' then
  begin
     ShowMessage('Rendición ya fue Contabilizada');
     Exit;
  end;

  try
     FLiqCC:= TFLiqCC.Create(self);
     FLiqCC.ShowModal;
  finally
     FLiqCC.Free;
  end;
end;

procedure TFLiquidacion.BitBtn1Click(Sender: TObject);
var
   cSQL, cCia, cOrigen, cLote, cPeriodo  : String;
begin
  if DMCNT.cdsLiqCon.FieldByName('ESTCONREN').AsString<>'S' then
  begin
     ShowMessage('Rendición no fue Contabilizada');
     Exit;
  end;

  cCia   :='02';
  cOrigen:='56';
  cLote  :='REOF';

	cSQL:='SELECT * FROM TGE114 WHERE FECHA='+quotedstr(DMCNT.cdsLiqCon.FieldByName('FECRENLIQ').AsString);
	DMCNT.cdsQry3.Close;
  DMCNT.cdsQry3.DataRequest(cSQL);
  DMCNT.cdsQry3.Open;
  cPeriodo:=DMCNT.cdsQry3.fieldbyName('FECANO').asString+DMCNT.cdsQry3.fieldbyName('FECMES').asString;

  cSQL:='Delete from CNT300 '
       +'WHERE CIAID='''+cCia+''' AND TDIARID='''+cOrigen+''' AND CNTANOMM='''+cPeriodo+''' '
       +  'AND CNTCOMPROB='''+DMCNT.cdsLiqCon.FieldByName('NUMCOM').AsString+'''';
  DMCNT.cdsSQL.Close;
  DMCNT.cdsSQL.DataRequest( cSQL );
  DMCNT.cdsSQL.Execute;

  cSQL:='Delete from CNT311 '
       +'WHERE CIAID='''+cCia+''' AND TDIARID='''+cOrigen+''' AND CNTANOMM='''+cPeriodo+''' '
       +  'AND CNTCOMPROB='''+DMCNT.cdsLiqCon.FieldByName('NUMCOM').AsString+'''';
  DMCNT.cdsSQL.Close;
  DMCNT.cdsSQL.DataRequest( cSQL );
  DMCNT.cdsSQL.Execute;

  cSQL:='Delete from CNT301 '
       +'WHERE CIAID='''+cCia+''' AND TDIARID='''+cOrigen+''' AND CNTANOMM='''+cPeriodo+''' '
       +  'AND CNTCOMPROB='''+DMCNT.cdsLiqCon.FieldByName('NUMCOM').AsString+'''';
  DMCNT.cdsSQL.Close;
  DMCNT.cdsSQL.DataRequest( cSQL );
  DMCNT.cdsSQL.Execute;

  DMCNT.cdsLiqCon.Edit;
  DMCNT.cdsLiqCon.FieldByName('ESTCONREN').AsString:='N';
  DMCNT.cdsLiqCon.FieldByName('USUCONREN').AsString:='';
  DMCNT.cdsLiqCon.Post;
  DMCNT.cdsLiqCon.ApplyUpdates(0);
  Screen.Cursor:=CrDefault;
  ShowMessage('Ok.');
end;

procedure TFLiquidacion.sbDisenoRepClick(Sender: TObject);
begin
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
end;

end.
