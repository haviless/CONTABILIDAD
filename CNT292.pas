unit CNT292;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, DB, ADODB, StdCtrls, Spin, Buttons,
  ExtCtrls, Wwdatsrc, FMTBcd, DBXpress, SqlExpr, ppEndUsr, ppParameter,
  ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, Mask, wwdbdatetimepicker;

type
  TFOficios = class(TForm)
    Panel1: TPanel;
    bbtnBuscar: TBitBtn;
    seAno: TSpinEdit;
    seMes: TSpinEdit;
    dbgConta: TwwDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    bbtnTransGiro: TBitBtn;
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
    Label4: TLabel;
    meEQ: TMaskEdit;
    GroupBox1: TGroupBox;
    dtpFecha: TwwDBDateTimePicker;
    bbtnContab: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    bbtnMarcar: TBitBtn;
    Label1: TLabel;
    cbDisenoRep: TCheckBox;
    sbDisenoRep: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure bbtnBuscarClick(Sender: TObject);
    procedure bbtnContabClick(Sender: TObject);
    procedure bbtnTransGiroClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgContaDblClick(Sender: TObject);
    procedure bbtnMarcarClick(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }
    procedure GeneraContabilidad;
    procedure ContabilizaGiro;
  public
    { Public declarations }
  end;

  procedure CNTOficios; stdcall;

exports
  CNTOficios;

var
  FOficios: TFOficios;

implementation

uses CNTDM, CNT294, CNT293;

{$R *.dfm}

procedure CNTOficios;
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   try
      FOficios:=TFOficios.Create( Application );
      FOficios.ShowModal;
   Finally
      FOficios.Free;
   End;
end;


procedure TFOficios.FormActivate(Sender: TObject);
begin
   seMes.Value:= StrToInt(Copy(DateToStr(Date),4,2));
   seAno.Value:= StrToInt(Copy(DateToStr(Date),7,4));
   bbtnBuscarClick(Self);
end;

procedure TFOficios.bbtnBuscarClick(Sender: TObject);
var
   xSQL, cMesSig, cMesAct, cDiaIni, cDiaFin, cDiaIniOra, cDiaFinOra, cEquipo, cNumOfi : String;
   nMes, nAno : Integer;
   dFecha : TDate;
   cWhere : String;
begin
   nMes:=seMes.Value+1;
   nAno:=seAno.Value;
   if nMes>=13 then
   begin
      nMes:=1;
      nAno:=nAno+1;
   end;
   cMesSig:= DMCNT.StrZero(IntToStr(nMes),2);
   cMesAct:= DMCNT.StrZero(IntToStr(seMes.Value),2);
   cDiaFin:= DateToStr( StrToDate('01/'+cMesSig+'/'+IntToStr(nAno))-1 );
   cDiaFin:= Copy(cDiaFin,4,2)+'/'+Copy(cDiaFin,1,2)+'/'+Copy(cDiaFin,7,4);
   cDiaIni:= cMesAct+'/01/'+IntToStr(seAno.Value);

   cDiaIniOra:='01/'+cMesAct+'/'+IntToStr(seAno.Value);
   cDiaFinOra:=DateToStr( StrToDate('01/'+cMesSig+'/'+IntToStr(nAno))-1 );

   dbgConta.DataSource:=DMCNT.dsCNT311;

   xSQL:='Select * from CNT_DES_OFI '
        +'Where FECHA>='''+cDiaIniOra+''' and FECHA<='''+cDiaFinOra+''' '
        +  'and EQUIPO LIKE '''+meEQ.Text+''' '
        +'ORDER BY FECHA, EQUIPO, NUMOFI';
   DMCNT.cdsCNT311.Close;
   DMCNT.cdsCNT311.DataRequest( xSQL );
   DMCNT.cdsCNT311.Open;

   cWhere:='';
   DMCNT.cdsCNT311.First;
   while not DMCNT.cdsCNT311.Eof do
   begin
      cWhere:=cWhere+' ( EQUIPO='''+DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString+''' AND '
                    +   'NUMOFI='''+DMCNT.cdsCNT311.FieldByName('NUMOFI').AsString+''' ) OR ';
      DMCNT.cdsCNT311.Next;
   end;
   if Length(cWhere)>0 then
   begin
      cWhere:=Copy(cWhere,1,Length(cWhere)-3);
      cWhere:=' and NOT ( '+cWhere+' ) ';
   end;

   DMCNT.cdsCNT311.First;
end;

procedure TFOficios.GeneraContabilidad;
var
   xSQL    : String;
   cDolar, cSoles, cDolarD, cSolesD : String;
   cPeriodo, cLote, cTM : String;
   cOrigen, cOriDes, cNReg : String;
   cCia, cCiaDes, cClAux, cAux, cAuxDes, cCCos, cCosDes    : String;
   cNumCom, cCtaCiaHabe : String;
   cCtaCiaDebe, cCtaBanco, cCtaBanDe, cNumDoc : String;
   cTipCam, cCtaDes, cCtaDes2 : String;
begin
   {
   cCia   :='02';
   cOrigen:='52';
   cLote  :='PAGO';

   cTM:='N';
   if cdsOficios.FieldByname('MONEDA').AsString='D' then
      cTM:='D';

   xSQL:='SELECT SUBSTR(TDIARDES,1,20) TDIARDES '
        +'FROM TGE104 '
        +'WHERE TDIARID='''+cOrigen+'''';
	 DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   cOriDes:=DMCNT.cdsQry2.FieldByName('TDIARDES').AsString;

   xSQL:='Select TCAMVBV From TGE107 '
        +'Where TMONID=''D'' and FECHA='''+cdsOficios.FieldByname('FECHA').AsString+''' ';
	 DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   if DMCNT.cdsQry2.RecordCount <= 0 then
   begin
      ShowMessage('Falta el Tipo de Cambio');
      Exit;
   end;
   cTipCam:=DMCNT.cdsQry2.FieldByName('TCAMVBV').AsString;

	 xSQL:='SELECT * FROM TGE114 WHERE FECHA='+quotedstr(cdsOficios.FieldByname('FECHA').AsString);
	 DMCNT.cdsQry3.Close;
   DMCNT.cdsQry3.DataRequest(xSQL);
   DMCNT.cdsQry3.Open;
   cPeriodo:=DMCNT.cdsQry3.fieldbyName('FECANO').asString+DMCNT.cdsQry3.fieldbyName('FECMES').asString;

   if cTM='N' then
   begin
      cSoles:=FloatToStr(cdsOficios.FieldByname('MONTO').AsFloat);
      cDolar:=FloatToStr(DMCNT.FRound(cdsOficios.FieldByname('MONTO').AsFloat/DMCNT.cdsQry2.FieldByName('TCAMVBV').AsFloat,15,2));
   end
   else
   begin
      cDolar:=FloatToStr(cdsOficios.FieldByname('MONTO').AsFloat);
      cSoles:=FloatToStr(DMCNT.FRound(cdsOficios.FieldByname('MONTO').AsFloat*DMCNT.cdsQry2.FieldByName('TCAMVBV').AsFloat,15,2));
   end;

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

   // CNT300

   xSQL:='Insert Into CNT300( CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTLOTE, '
        +  'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
        +  'CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, TDIARDES, CNTTS, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, DOCMOD, MODULO ) '
        +'Values('''+cCia+''', '''+cOrigen+''', '''+cNumCom+''', '
        +  ''''+cPeriodo+''', '''+cLote+''', '
        +  '''EQUIPO='+cdsOficios.FieldByName('EQUIPO').AsString+' '
        +    'OFICIO='+cdsOficios.FieldByName('NUMOFI').AsString+''', '
        +  cTipCam+', '
        +  ''''+cdsOficios.FieldByname('FECHA').AsString+''', '
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

   cNumDoc:='OF.'+trim(cdsOficios.FieldByName('NUMOFI').AsString)
           +'-'  +trim(cdsOficios.FieldByName('EQUIPO').AsString);


   // DETALLE 1 - CNT301

   xSQL:='select b.Cuenta, b.Importe, a.CodUsu '
        +'from tMovCab a, tMovDet b '
        +'where a.ANOLIQ='''+cdsOficios.FieldByName('ANOOFI').AsString+''' '
        +  'and a.EQUIPO='''+cdsOficios.FieldByName('EQUIPO').AsString+''' '
        +  'and a.NUMOFI='''+cdsOficios.FieldByName('NUMOFI').AsString+''' '
        +  'and a.AnoLiq=b.AnoLiq and a.NumLiq=b.NumLiq '
        +'order by a.CodUsu';
   cdsCuenta.Active:=False;
   cdsCuenta.CommandText:=xSQL;
   cdsCuenta.Active:=True;

   cNReg:='1';
   while not cdsCuenta.Eof do
   begin

      xSQL:='SELECT A.PROV, A.CENCOSOFI CCOSID, B.CCOSABR, A.PROVABR '
           +'FROM TGE201 A, TGE203 B '
           +'WHERE CLAUXID=''E'' '
           +  'AND EQUPROOFI='''+cdsCuenta.FieldByName('CODUSU').AsString+''' '
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

      xSQL:='SELECT CUENTAID, CTADES, CTA_AUX, CTA_CCOS FROM TGE202 '
           +'WHERE CIAID=''02'' AND CUENTAID='''+cdsCuenta.FieldByName('CUENTA').AsString+'''';
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
         cSolesD:=FloatToStr(cdsCuenta.FieldByname('IMPORTE').AsFloat);
         cDolarD:=FloatToStr(DMCNT.FRound(cdsCuenta.FieldByname('IMPORTE').AsFloat/StrtoFloat(cTipCam),15,2));
      end
      else
      begin
         cDolarD:=FloatToStr(cdsCuenta.FieldByname('IMPORTE').AsFloat);
         cSolesD:=FloatToStr(DMCNT.FRound(cdsCuenta.FieldByname('IMPORTE').AsFloat*StrToFloat(cTipCam),15,2));
      end;

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
           +  ''''+cPeriodo+''', '''+cLote+''', '''+cdsCuenta.FieldByName('CUENTA').AsString+''', '
           +  ''''+cClAux+''', '''+cAux+''', ''23'', ''0'', '''+cNumDoc+''', '
           +  ''''+cCtaDes+''', ''D'', '''+cCCos+''', '+cTipCam+', '
           +  cdsCuenta.FieldByname('IMPORTE').AsString +', '
           +  cSolesD+', '+cDolarD+', '
           +  ''''+cdsOficios.FieldByname('FECHA').AsString+''', '
           +  ''''+cdsOficios.FieldByname('FECHA').AsString+''', '
           +  ''''+cdsOficios.FieldByname('FECHA').AsString+''', '
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

      cdsCuenta.Next;
   end;

   // DETALLE 2 - CNT301

   xSQL:='select a.CodBco, a.CtaOri, a.NumOfi, a.Equipo, b.CtaBanco '
        +'from tOfiDes a, tBancos b '
        +'where ANOOFI='''+cdsOficios.FieldByName('ANOOFI').AsString+''' '
        +  'and EQUIPO='''+cdsOficios.FieldByName('EQUIPO').AsString+''' '
        +  'and NUMOFI='''+cdsOficios.FieldByName('NUMOFI').AsString+''' '
        +  'and a.CodBco=b.CodBco and a.CtaOri=b.CodCta';
   cdsCuenta.Active:=False;
   cdsCuenta.CommandText:=xSQL;
   cdsCuenta.Active:=True;

   xSQL:='SELECT CCBCOID, CTAPRINC, C.CTAABR FROM TGE105 A, TGE106 B, TGE202 C '
        +'WHERE A.EQUBANOFI='''+cdsCuenta.FieldByName('CodBco').AsString+''' '
        +  'AND B.CIAID='''+cCia+''' AND A.BANCOID=B.BANCOID '
        +  'AND CCBCOID like '''+cdsCuenta.FieldByname('CtaBanco').AsString+'%'' '
        +  'AND B.CIAID=C.CIAID(+) AND B.CTAPRINC=C.CUENTAID(+)';
	 DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   cCtaBanco:=DMCNT.cdsQry2.FieldByName('CTAPRINC').AsString;
   cCtaBanDe:=DMCNT.cdsQry2.FieldByName('CTAABR').AsString;

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
        +  ''''+cPeriodo+''', '''+cLote+''', '''+cCtaBanco+''', null, null, '
        +  '''23'', ''0'', '''+cNumDoc+''', '
        +  '''EQUIPO='+cdsOficios.FieldByName('EQUIPO').AsString+' - '
        +    'OFICIO='+cdsOficios.FieldByName('NUMOFI').AsString+''', '
        +  '''H'', NULL, '+cTipCam+', '
        +  cdsOficios.FieldByName('MONTO').AsString +', '
        +  cSoles+', '+cDolar+', '
        +  ''''+cdsOficios.FieldByname('FECHA').AsString+''', '
        +  ''''+cdsOficios.FieldByname('FECHA').AsString+''', '
        +  ''''+cdsOficios.FieldByname('FECHA').AsString+''', '
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
        +  ''''+cOriDes+''', '''+cCtaBanDe+''', null, ''Otros'', null, '
        +  '0, 0, '+cSoles+', '+cDolar+', ''BV'', ''CNT'', '+cNReg+', ''INT'' ) ';
   DMCNT.cdsSQL.Close;
   DMCNT.cdsSQL.DataRequest( xSQL );
   DMCNT.cdsSQL.Execute;
   }
end;


procedure TFOficios.bbtnContabClick(Sender: TObject);
var
   xSQL, cCia : String;
begin
   if DMCNT.cdsCNT311.FieldByName('ESTADO').AsString='S' then
   begin
      ShowMessage('Oficio Anulado. No se puede Contabilizar');
      Exit;
   end;

   if DMCNT.cdsCNT311.FieldByName('ESTCON').AsString='S' then
   begin
      ShowMessage('Oficio Contabilizado. No se pueden hacer cambios');
      Exit;
   end;

   cCia:='02';
   xSql:='SELECT * FROM TGE154 WHERE CIAID='''+cCia+''' '
        +' AND ANO='+quotedstr(Copy(DateToStr(dtpFecha.Date),7,4));
   DMCNT.cdsCierres.close;
   DMCNT.cdsCierres.datarequest(xsql);
   DMCNT.cdsCierres.open;
   if DMCNT.cdsCierres.FieldByName('PER'+Copy(DateToStr(dtpFecha.Date),4,2)).AsString = 'S' then
   begin
  	  Showmessage('El periodo se encuentra Cerrado');
      dtpFecha.setfocus;
      exit;
   end
   else
   begin
  	  if dtpFecha.date=0 then
      begin
         ShowMessage('Registre la Fecha del Comprobante');
         dtpFecha.SetFocus;
         exit;
      end;
   end;

   ContabilizaGiro;
end;


procedure TFOficios.ContabilizaGiro;
var
   xSQL    : String;
   cDolar, cSoles, cDolarD, cSolesD : String;
   cPeriodo, cLote, cTM : String;
   cOrigen, cOriDes, cNReg : String;
   cCia, cCiaDes, cClAux, cAux, cAuxDes, cCCos, cCosDes    : String;
   cNumCom, cCtaCiaHabe : String;
   cCtaCiaDebe, cCtaBanco, cCtaBanDe, cNumDoc : String;
   cTipCam, cCtaDes, cCtaDes2 : String;
begin
   cCia   :='02';
   cOrigen:='55';
   cLote  :='PAOF';

   xSQL:='select B.Cuenta, c.cuentaid, a.CENCOS '
        +'from CNT_LIQ_CAB a, CNT_LIQ_DET b, TGE202 C '
        +'where a.ANOLIQ='''+DMCNT.cdsCNT311.FieldByName('ANOOFI').AsString+''' '
        +  'and a.EQUIPO='''+DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString+''' '
        +  'and a.NUMOFI='''+DMCNT.cdsCNT311.FieldByName('NUMOFI').AsString+''' '
        +  'and a.AnoLiq=b.AnoLiq and a.NumLiq=b.NumLiq '
        +  'and c.ciaid(+)=''02'' and b.cuenta=c.cuentaid(+) '
        +'order by a.CodUsu';
   DMCNT.cdsLiqDet.Close;
   DMCNT.cdsLiqDet.DataRequest( xSQL );
   DMCNT.cdsLiqDet.Open;

   DMCNT.cdsLiqDet.first;
   while not DMCNT.cdsLiqDet.Eof do
   begin
      if DMCNT.cdsLiqDet.FieldByname('CUENTAID').AsString='' then
      begin
         ShowMessage('Cuenta : '+DMCNT.cdsLiqDet.FieldByname('CUENTA').AsString+', No existe en Plan Contable ');
         Exit;
      end;

      if DMCNT.cdsLiqDet.FieldByname('CENCOS').AsString='' then
      begin
         ShowMessage('Faltan Registrar Centros de Costo. Revisar Liquidaciones');
         Exit;
      end;

      DMCNT.cdsLiqDet.Next;
   end;

   Screen.Cursor:=CrHourGlass;

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
        +'Where TMONID=''D'' and FECHA='''+dtpFecha.Text+'''';
//        +'Where TMONID=''D'' and FECHA='''+DMCNT.cdsCNT311.FieldByName('FECHA').AsString+''' ';
	 DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   if DMCNT.cdsQry2.RecordCount <= 0 then
   begin
      ShowMessage('Falta el Tipo de Cambio');
      Exit;
   end;
   cTipCam:=DMCNT.cdsQry2.FieldByName('TCAMVBV').AsString;

	 xSQL:='SELECT * FROM TGE114 WHERE FECHA='+quotedstr(dtpFecha.Text);
	 DMCNT.cdsQry3.Close;
   DMCNT.cdsQry3.DataRequest(xSQL);
   DMCNT.cdsQry3.Open;
   cPeriodo:=DMCNT.cdsQry3.fieldbyName('FECANO').asString+DMCNT.cdsQry3.fieldbyName('FECMES').asString;

   if cTM='N' then
   begin
      cSoles:=FloatToStr(DMCNT.cdsCNT311.FieldByName('MONTO').AsFloat);
      cDolar:=FloatToStr(DMCNT.FRound(DMCNT.cdsCNT311.FieldByName('MONTO').AsFloat/DMCNT.cdsQry2.FieldByName('TCAMVBV').AsFloat,15,2));
   end
   else
   begin
      cDolar:=FloatToStr(DMCNT.cdsCNT311.FieldByName('MONTO').AsFloat);
      cSoles:=FloatToStr(DMCNT.FRound(DMCNT.cdsCNT311.FieldByName('MONTO').AsFloat*DMCNT.cdsQry2.FieldByName('TCAMVBV').AsFloat,15,2));
   end;

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

   // CNT300

   xSQL:='Insert Into CNT300( CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTLOTE, '
        +  'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
        +  'CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, TDIARDES, CNTTS, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, DOCMOD, MODULO ) '
        +'Values('''+cCia+''', '''+cOrigen+''', '''+cNumCom+''', '
        +  ''''+cPeriodo+''', '''+cLote+''', '
        +  '''OFICIO='+DMCNT.cdsCNT311.FieldByName('NUMOFI').AsString+' '
        +    'EQUIPO='+DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString+''', '
        +  cTipCam+', '
        +  ''''+dtpFecha.Text+''', '
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
   xSQL:='select CASE WHEN ESTLIQSUS=''S'' THEN b.Cuenta ELSE ''386'' END CUENTA, '
        +   'b.Importe, a.CodUsu, a.NumLiq, a.CenCos '
        +'from CNT_LIQ_CAB a, CNT_LIQ_DET b '
        +'where a.ANOLIQ='''+DMCNT.cdsCNT311.FieldByName('ANOOFI').AsString+''' '
        +  'and a.EQUIPO='''+DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString+''' '
        +  'and a.NUMOFI='''+DMCNT.cdsCNT311.FieldByName('NUMOFI').AsString+''' '
        +  'and a.CTAORI='''+DMCNT.cdsCNT311.FieldByName('CTAORI').AsString+''' '
        +  'and a.AnoLiq=b.AnoLiq and a.NumLiq=b.NumLiq '
        +'order by a.Orden, CASE WHEN ESTLIQSUS=''S'' THEN b.Cuenta ELSE ''386'' END';
   DMCNT.cdsLiqDet.Close;
   DMCNT.cdsLiqDet.DataRequest( xSQL );
   DMCNT.cdsLiqDet.Open;

   cNReg:='1';
   while not DMCNT.cdsLiqDet.Eof do
   begin

      xSQL:='SELECT A.PROV, B.CCOSID, B.CCOSABR, A.PROVABR '
           +'FROM TGE201 A, TGE203 B '
           +'WHERE EQUPROOFI='''+DMCNT.cdsLiqDet.FieldByName('CODUSU').AsString+''' '
           +  'AND CCOSID(+)='''+DMCNT.cdsLiqDet.FieldByName('CENCOS').AsString+''' ';
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
           +'WHERE CIAID=''02'' AND CUENTAID='''+DMCNT.cdsLiqDet.FieldByName('CUENTA').AsString+'''';
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
         cSolesD:=FloatToStr(DMCNT.cdsLiqDet.FieldByname('IMPORTE').AsFloat);
         cDolarD:=FloatToStr(DMCNT.FRound(DMCNT.cdsLiqDet.FieldByname('IMPORTE').AsFloat/StrtoFloat(cTipCam),15,2));
      end
      else
      begin
         cDolarD:=FloatToStr(DMCNT.cdsLiqDet.FieldByname('IMPORTE').AsFloat);
         cSolesD:=FloatToStr(DMCNT.FRound(DMCNT.cdsLiqDet.FieldByname('IMPORTE').AsFloat*StrToFloat(cTipCam),15,2));
      end;

      cNumDoc:=trim(DMCNT.cdsCNT311.FieldByName('NUMOFI').AsString)
           +' - '+trim(DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString);

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
           +  ''''+cPeriodo+''', '''+cLote+''', '''+DMCNT.cdsLiqDet.FieldByName('CUENTA').AsString+''', '
           +  ''''+cClAux+''', '''+cAux+''', ''23'', '
           +  ''''+'OF'+''', '''+cNumDoc+''', '
           +  ''''+'LIQ : '+DMCNT.cdsLiqDet.FieldByname('NUMLIQ').AsString+''', '
           +  '''D'', '''+cCCos+''', '+cTipCam+', '
           +  DMCNT.cdsLiqDet.FieldByname('IMPORTE').AsString +', '
           +  cSolesD+', '+cDolarD+', '
           +  ''''+DMCNT.cdsCNT311.FieldByName('FECHA').AsString+''', '
           +  ''''+DMCNT.cdsCNT311.FieldByName('FECHA').AsString+''', '
           +  ''''+dtpFecha.Text+''', '
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

      DMCNT.cdsLiqDet.Next;
   end;

   // DETALLE 2 - CNT301

   xSQL:='SELECT CCBCOID, CTAPRINC, C.CTAABR FROM TGE105 A, TGE106 B, TGE202 C '
        +'WHERE A.EQUBANOFI='''+DMCNT.cdsCNT311.FieldByName('CODBAN').AsString+''' '
        +  'AND B.CIAID='''+cCia+''' AND A.BANCOID=B.BANCOID '
        +  'AND CCBCOID like '''+DMCNT.cdsCNT311.FieldByname('CUEBAN').AsString+'%'' '
        +  'AND B.CIAID=C.CIAID(+) AND B.CTAPRINC=C.CUENTAID(+)';
	 DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   cCtaBanco:=DMCNT.cdsQry2.FieldByName('CTAPRINC').AsString;
   cCtaBanDe:=DMCNT.cdsQry2.FieldByName('CTAABR').AsString;

   cNumDoc:=trim(DMCNT.cdsCNT311.FieldByName('NUMOFI').AsString)+' - '
           +DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString;


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
        +  ''''+cPeriodo+''', '''+cLote+''', '''+cCtaBanco+''', null, null, '
        +  '''23'', '''+'OF'+''', '''+cNumDoc+''', '
        +  '''OFICIO='+DMCNT.cdsCNT311.FieldByName('NUMOFI').AsString+' - '
        +     DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString+''', '
        +  '''H'', NULL, '+cTipCam+', '
        +  DMCNT.cdsCNT311.FieldByName('MONTO').AsString +', '
        +  cSoles+', '+cDolar+', '
        +  ''''+DMCNT.cdsCNT311.FieldByname('FECHA').AsString+''', '
        +  ''''+DMCNT.cdsCNT311.FieldByname('FECHA').AsString+''', '
        +  ''''+dtpFecha.Text+''', '
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
        +  ''''+cOriDes+''', '''+cCtaBanDe+''', null, ''Otros'', null, '
        +  '0, 0, '+cSoles+', '+cDolar+', ''BV'', ''CNT'', '+cNReg+', ''INT'' ) ';
   DMCNT.cdsSQL.Close;
   DMCNT.cdsSQL.DataRequest( xSQL );
   DMCNT.cdsSQL.Execute;

   DMCNT.cdsCNT311.Edit;
   DMCNT.cdsCNT311.FieldByName('NUMCOM').AsString:=cNumCom;
   DMCNT.cdsCNT311.FieldByName('PERCOM').AsString:=cPeriodo;
   DMCNT.cdsCNT311.FieldByName('ESTCON').AsString:='S';
   DMCNT.cdsCNT311.Post;
   DMCNT.cdsCNT311.ApplyUpdates(0);

   Screen.Cursor:=CrDefault;
   ShowMessage('Ok.');
end;


procedure TFOficios.bbtnTransGiroClick(Sender: TObject);
begin
  try
     FTransfGiro:= TFTransfGiro.Create(self);
     FTransfGiro.seAno.Value:=seAno.Value;
     FTransfGiro.seMes.Value:=seMes.Value;
     FTransfGiro.ShowModal;
  finally
     FTransfGiro.Free;
  end;
end;

procedure TFOficios.BitBtn1Click(Sender: TObject);
var
  xSQL   : String;
  cCia   : String;
  cOrigen, cPeriodo, xCampos, cTabla : String;
  cLote  : String;
  X10 : INTEGER;
begin
  cCia   :='02';
  cOrigen:='55';
  cLote  :='PAOF';

  if DMCNT.cdsCNT311.FieldByName('ESTCON').AsString<>'S' then
  begin
     ShowMessage('No existe Comprobante Contable. Debe Contabilizar Oficio');
     Exit;
  end;

  Screen.Cursor:=CrHourGlass;

	xSQL:='SELECT * FROM TGE114 WHERE FECHA='+quotedstr(DMCNT.cdsCNT311.FieldByname('FECHA').AsString);
	DMCNT.cdsQry3.Close;
  DMCNT.cdsQry3.DataRequest(xSQL);
  DMCNT.cdsQry3.Open;
  cPeriodo:=DMCNT.cdsQry3.fieldbyName('FECANO').asString+DMCNT.cdsQry3.fieldbyName('FECMES').asString;

  xCampos:= ''''+DMCNT.cdsQry3.fieldbyName('FECMES').asString+' '+DMCNT.cdsQry3.fieldbyName('FECANO').asString+''' PERIODO ';

  xsql:='SELECT CNTESTADO FROM CNT300 A '
       +'WHERE A.CIAID='''+cCia+''' and A.TDIARID='''+cOrigen+''' '
       +  'and A.CNTANOMM='''  +DMCNT.cdsCNT311.FieldByName('PERCOM').AsString+''' '
       +  'and A.CNTCOMPROB='''+DMCNT.cdsCNT311.FieldByName('NUMCOM').AsString+''' ';
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
       +'WHERE A.CIAID='''+cCia+''' and A.TDIARID='''+cOrigen+''' '
       +  'and A.CNTANOMM='''  +DMCNT.cdsCNT311.FieldByName('PERCOM').AsString+''' '
       +  'and A.CNTCOMPROB='''+DMCNT.cdsCNT311.FieldByName('NUMCOM').AsString+''' '
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
      DMCNT.cdsMOVCNT1.EnableControls;

      ppdbVoucher.DataSource:=nil;
   end;
end;

procedure TFOficios.dbgContaDblClick(Sender: TObject);
begin
  try
     FLiquidacion:= TFLiquidacion.Create(self);
     FLiquidacion.ShowModal;
  finally
     FLiquidacion.Free;
  end;
end;

procedure TFOficios.bbtnMarcarClick(Sender: TObject);
begin

   if DMCNT.cdsCNT311.FieldByName('FECHA').AsDateTime>=StrToDate('01/01/2007') then
   begin
      ShowMessage('Solo para Oficios del 2006');
      Exit;
   end;


   if MessageDlg( 'Marcar Oficio como Contabilizado' + chr(13)+
                '        ¿ Esta Seguro ?   ',mtConfirmation,[mbYes, mbNo],0)<>mrYes
      then exit;

   DMCNT.cdsCNT311.Edit;
   DMCNT.cdsCNT311.FieldByName('ESTCON').AsString:='S';
   DMCNT.cdsCNT311.Post;
   DMCNT.cdsCNT311.ApplyUpdates(0);

   Screen.Cursor:=CrDefault;
   ShowMessage('Ok.');
end;

procedure TFOficios.sbDisenoRepClick(Sender: TObject);
begin
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
end;

end.
