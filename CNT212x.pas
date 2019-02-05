unit Cnt212;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppDB, ppDBPipe, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, ComCtrls, StdCtrls, wwdblook,
  Buttons, ExtCtrls, Wwdbigrd, Grids, Wwdbgrid, Db, DBClient, wwclient,
  Spin, wwdbdatetimepicker, oaContabiliza, ppEndUsr, Mask, wwdbedit,
  Wwdbspin, Wwkeycb, ppviewr, ppTypes, oaVariables;

type
  TFAjusteInflacion1 = class(TForm)
    Label6: TLabel;
    pgcActPas: TPageControl;
    tabActivo: TTabSheet;
    dbgActivo: TwwDBGrid;
    pnlATotal: TPanel;
    Label8: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtASaldo: TEdit;
    edtAAjustado: TEdit;
    edtADiferencia: TEdit;
    tabPasivo: TTabSheet;
    pnlPTotal: TPanel;
    Label10: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edtPSaldo: TEdit;
    edtPAjustado: TEdit;
    edtPDiferencia: TEdit;
    dbgPasivo: TwwDBGrid;
    pnlTop: TPanel;
    Label9: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    Label5: TLabel;
    edtAcumulado: TEdit;
    edtGlosa: TEdit;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    edtAcumuladoDescripcion: TEdit;
    edtTasa: TEdit;
    edtPeriodo: TEdit;
    gbAsiento: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtCIA: TEdit;
    edtTDiario: TEdit;
    dblcCIA: TwwDBLookupCombo;
    dblcTDiario: TwwDBLookupCombo;
    edtCuentaREI: TEdit;
    cbTCambio: TComboBox;
    edtREIDescripcion: TEdit;
    pnlBotones: TPanel;
    lblAvance: TLabel;
    bbtnContab: TBitBtn;
    bbtnImprime: TBitBtn;
    bbtnGraba: TBitBtn;
    bbtnAcepta: TBitBtn;
    prbAvance: TProgressBar;
    pprComprob: TppReport;
    ppdbComprob: TppDBPipeline;
    lblestado: TLabel;
    edtEstado: TLabel;
    bbtnMensual: TBitBtn;
    lblfactor: TLabel;
    edtfactor: TEdit;
    BitBCarta: TBitBtn;
    pprSustento: TppReport;
    ppDBSustento: TppDBPipeline;
    ppDesigner1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine1: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine3: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    Label3: TLabel;
    edtComprobante: TEdit;
    speanoajuste: TLabel;
    speano: TwwDBSpinEdit;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText12: TppDBText;
    ppDBText20: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBText21: TppDBText;
    ppLabel18: TppLabel;
    ppLine11: TppLine;
    BitBtn2: TBitBtn;
    pprSconsolidado: TppReport;
    ppdbconsolidado: TppDBPipeline;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel30: TppLabel;
    ppDBText22: TppDBText;
    ppLabel31: TppLabel;
    ppDBText23: TppDBText;
    ppLabel32: TppLabel;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppLine14: TppLine;
    ppLine15: TppLine;
    pnlSustento: TPanel;
    Panel2: TPanel;
    dbgSustento: TwwDBGrid;
    bbtnImprimirS: TBitBtn;
    bbtnCancelar: TBitBtn;
    isbusca: TwwIncrementalSearch;
    pprResumen: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppLabel21: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    pplblciades: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppLine16: TppLine;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    pplblctarei: TppLabel;
    pplblreides: TppLabel;
    pplbldeberei: TppLabel;
    pplblhaberei: TppLabel;
    ppLine17: TppLine;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    pplblciac: TppLabel;
    ppLabel42: TppLabel;
    pplblmes: TppLabel;
    //ExtraOptions1: TExtraOptions;
    pplblcian: TppLabel;
    pplblmesr: TppLabel;
    ppLabel43: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppLabel41: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel90: TppLabel;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText47: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    pplblEstado: TppLabel;
    ppLabel76: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel77: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel91: TppLabel;
    pplblcia: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel3: TppLabel;
    ppLabel1: TppLabel;
    ppLabel10: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    //ExtraOptions2: TExtraOptions;
    ppdbResumen: TppDBPipeline;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppDBCalc13: TppDBCalc;
    ppLabel44: TppLabel;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    pplAno1: TppLabel;
    pplAno2: TppLabel;
    bbtnAjuste: TBitBtn;
    pplAno3: TppLabel;
    dtpFecha: TwwDBDateTimePicker;
    procedure dblcCIAExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dtpFechaExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure bbtnCancClick(Sender: TObject);
    procedure bbtnContabClick(Sender: TObject);
    procedure bbtnAceptaClick(Sender: TObject);
    procedure bbtnImprimeClick(Sender: TObject);
    procedure bbtnEliminaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnGrabaClick(Sender: TObject);
    procedure cbTCambioChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnMensualClick(Sender: TObject);
    procedure bbtnaceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBCartaClick(Sender: TObject);
    procedure bbtnAjusteClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bbtnImprimirSClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbgSustentoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure isbuscaExit(Sender: TObject);
    procedure dbgSustentoFieldChanged(Sender: TObject; Field: TField);
    procedure speanoExit(Sender: TObject);
    procedure dblcCIAClick(Sender: TObject);
    procedure dblcTDiarioClick(Sender: TObject);
    procedure pprSconsolidadoPreviewFormCreate(Sender: TObject);
    procedure pprSustentoPreviewFormCreate(Sender: TObject);
    procedure pprResumenPreviewFormCreate(Sender: TObject);
    procedure pprComprobPreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
    wVRN_TipoCambio : shortstring;
    FAJUSDEF : sTRING;
    procedure GrabaPrevio;

    procedure TitleGrid();
  public
    { Public declarations }
    procedure CalcAjusteDiferencia();
    procedure CalcTotales();
    procedure ActualizaSalidas();
    procedure MuestraEstado( xMovEstado, xMovConta : string ) ;
    procedure EnaDisAble(cCuadre, cEstado : string);
    function Contabiliza( xCia, xTDiario, xAnoMM, xNoComp : String ): Boolean;
    function DesContabiliza( xCia, xTDiario, xAnoMM, xNoComp : String ): Boolean;
    function CuentaExiste( xxxxCia, xxxxAno, xxxxCuenta, xxxxAux, xxxxCCos : String ) : Boolean;
    procedure ActualizaMov( cCia, cAnoMM, cCuenta, cClAux, cAux, cCCosto, cDH, cMov, cCtaDes, cAuxDes, cCCoDes:String; nImpMN,nImpME:DOUBLE; nSigno:DOUBLE );
    procedure InsertaMov  ( cCia, cAnoMM, cCuenta, cClAux, cAux, cCCosto, cDH, cMov, cCtaDes, cAuxDes, cCCoDes:String; nImpMN,nImpME:DOUBLE );
    procedure GeneraEnLinea401( xxxCia,xxxDiario,xxxAnoMM,xxxNoComp, xxxSigno: String );
  end;


var
  FAjusteInflacion1: TFAjusteInflacion1;
   anox,XSQL,XSQL1,XSQL2 : String;
 Present: TDateTime;
 ssAnyo, ssMes, ssDia : string;
 sDia, sMes, sAnyo : SHORTstring;
 nDia, nMes, nAnyo : word;
 Periodo , xmes,CNTDH,TASA,glosa,XVAR,xvar1,MES : String;
 I ,H,F: Integer;        //ana
 XREIDEBE,XREIHABE : Double;
 xCNTReg,ano,xfactor : Integer;
 xnvalor,xsalidas,xvalsalida,nmontosal: string;
 WHReg   : TTime;
 HH,XVARS,XVARS1,XCUENTAREI : String;
 xncomp : String;

implementation

uses CNTDM, CNT213;

{$R *.DFM}


procedure TFAjusteInflacion1.dblcCiaExit(Sender: TObject);
var
sSQL : string;
begin

	edtCia.Text:='';
	if dblcCia.Text<>'' then
      begin
      sSQL:='CIAID='''+dblcCia.Text+'''';
      if length(dm1.DisplayDescrip('PrvTGE','TGE101','CIADES',SSql,'CIADES'))=0 then
      Begin
         Showmessage('Compañia No Valida');
         dblcCia.setfocus;
         Exit;
      End; //DM1.cdsTDiarioTDiarDes.Text;

      xSql := 'CIAID='+quotedstr(dblccIA.Text);
      edtCia.Text:= dm1.DisplayDescrip('PrvTGE','TGE101','*',xSql,'CIADES'); //DM1.cdsTDiarioTDiarDes.Text;

		//edtCia.Text := DM1.cdsCia.FieldByName('CIADES').AsString;
      sSQL := 'SELECT CIACTAREI, CIATDIAREI FROM TGE101 WHERE CIAID='+quotedStr(dblcCia.Text);
      DM1.cdsQry.Close;
      DM1.cdsQry.ProviderName:='prvCNT';
      DM1.cdsQry.DataRequest(sSQL);
      DM1.cdsQry.Open;
      edtAcumulado.Text := DM1.cdsQry.fieldbyname('CIATDIAREI').asString; //¿Exijo una explicacion?
      edtCuentaREI.Text := DM1.cdsQry.fieldbyname('CIACTAREI').asString;
      SSql := 'CUENTAID='''+DM1.cdsQry.fieldbyname('CIACTAREI').asString+''' AND CIAID='''+dblcCIA.text+'''';
      edtREIDescripcion.Text:= dm1.DisplayDescrip('PrvTGE','TGE202','CTADES',SSql,'CTADES'); //DM1.cdsTDiarioTDiarDes.Text;
      end;
end;

procedure TFAjusteInflacion1.dblcTDiarioExit(Sender: TObject);
var
 xSql : String;
begin
	edtTDiario.Text:='';
   if dblcTDiario.Text = '' then
      begin
      ShowMessage('Tiene que ingresar el Diario');
      dblcTDiario.SetFocus;
      exit
      end;

   xSql := 'TDIARID='+quotedstr(dblcTDiario.Text);
   edtTDiario.Text:= dm1.DisplayDescrip('PrvTGE','TGE104','*',xSql,'TDIARDES'); //DM1.cdsTDiarioTDiarDes.Text;
   if length(edtTDiario.Text)=0 then
   Begin
    Showmessage('Diario No Válido');
    dblcTDiario.setfocus;
    Exit;
   End;
end;

procedure TFAjusteInflacion1.dtpFechaExit(Sender: TObject);
var nAno, nMes, nDia : word;
   sAno, sMes : shortstring;
   sSQL,xnumero,xsql : string;
   valor:integer;
begin
	decodedate( dtpFecha.date, nAno, nMes, nDia);



  	if nMes <> 12 then
   begin
      str(nAno,sAno);
      str(nMes,sMes);   sMes := DM1.StrZero(sMes,2);
      edtPeriodo.text := sAno + sMes;
      sSQL := 'SELECT COUNT(*) AS TOTAL FROM TGE107 WHERE FECHA=' +quotedstr(FormatDatetime(wFormatFecha,(dtpFecha.date)));

      DM1.cdsQry.Close;
      DM1.cdsQry.ProviderName:='prvCNT';
      DM1.cdsQry.DataRequest(SSQL);
      DM1.cdsQry.Open;

      if DM1.cdsQry.FieldByName('Total').asInteger = 0 then
      begin
         cbTCambio.itemindex := 6;
         cbTCambio.OnChange(sender);
      end;


  //		ShowMessage('El mes tiene que ser diciembre');
  //    dtpFecha.SetFocus;
   end
   else
   begin
      str(nAno,sAno);
      str(nMes,sMes);   sMes := DM1.StrZero(sMes,2);
      edtPeriodo.text := sAno + sMes;
      sSQL := 'SELECT COUNT(*) AS TOTAL FROM TGE107 WHERE FECHA=' +quotedstr(FormatDatetime(wFormatFecha,(dtpFecha.date)));

      DM1.cdsQry.Close;
      DM1.cdsQry.ProviderName:='prvCNT';
      DM1.cdsQry.DataRequest(SSQL);
      DM1.cdsQry.Open;
      if DM1.cdsQry.FieldByName('Total').asInteger = 0 then
      begin
         cbTCambio.itemindex := 6;
         cbTCambio.OnChange(sender);
      end;
   end;


   xsql:='SELECT * FROM CNT304 WHERE CIAID='''+dblcCIA.Text+''' AND TDIARID='''+dblcTDiario.Text
          +''' AND CNTLOTE=''INFL'' AND FAMENSUAL=''S'' AND CNTANOMM='''+edtperiodo.text+'''';
   dm1.cdsQry2.Close;
   dm1.cdsQry2.IndexFieldnames:='';
   DM1.cdsQry2.ProviderName:='prvCNT';
   dm1.cdsQry2.DataRequest(xsql);
   dm1.cdsQry2.OPEN;

   IF DM1.CDSQRY2.RECORdCOUNT>0 THEN
   Begin
      //Permite regenerar los ajustes para los meses cuando varien los factores

      xsql:='SELECT * FROM CNT303 WHERE CIAID='''+dblcCIA.Text+''' AND TDIARID='''+dblcTDiario.Text
           +''' AND CNTLOTE=''INFL''  AND CNTANOMM='''+edtperiodo.text+''' AND CUENTAID<>'''+edtCuentaREI.Text+'''';
      dm1.cdsQry2.Close;
      DM1.cdsQry2.ProviderName:='prvCNT';
      dm1.cdsQry2.DataRequest(xsql);
      dm1.cdsQry2.OPEN;

      IF DM1.CDSQRY2.RECORDCOUNT=0 THEN
      BEGIN
        IF LENGTH(edtTasa.TEXT)=0 THEN
        BEGIN
           SHOWMESSAGE('No existe Tipo cambio para el dia');
           exit;
        END;
      END;

      edtTasa.text:=dm1.cdsqry2.fieldbyname('CNTTCAMBIO').asstring;
      edtfactor.text:=dm1.cdsqry2.fieldbyname('FACTOR').asstring;
      lblestado.caption:='Ajuste Mensual Realizado';
      BitBCarta.Enabled:=True;
      bbtnOkClick(sender);
//      bbtnAcepta.Enabled:=False;
      edtComprobante.text:=dm1.cdsqry2.fieldbyname('CNTCOMPROB').asstring;
      bbtnOk.Enabled:=False;
      edtGlosa.Text:='AJUSTE REALIZADO AL '+datetostr(dtpFecha.date);
      IF FAJUSDEF<>'S'  THEN
         bbtnGraba.Enabled:=True
      ELSE
         bbtnGraba.Enabled:=False;

      bbtnGraba.Enabled:=TRUE;

      BitBCarta.Enabled:=True;
      Exit;
   End;

   lblestado.caption:='';
   bbtnOk.Enabled:=True;
   bbtnGraba.Enabled:=False;
   xsql:='SELECT MAX(CNTCOMPROB) as NUMERO FROM CNT303 '
        +'WHERE CIAID='''+dblcCIA.text+''' AND CNTANO='''+sano+'''' ;
   dm1.cdsQry2.Close;
   DM1.cdsQry2.ProviderName:='prvCNT';
   dm1.cdsQry2.DataRequest(xsql);
   dm1.cdsQry2.Open;

   if dm1.cdsQry2.fieldbyname('NUMERO').isnull then
      edtComprobante.text:='0000000001'
   else
     Begin
           valor:=dm1.cdsQry2.fieldbyname('NUMERO').asinteger+1;
           xnumero:=inttostr(valor);
           edtComprobante.Text := DM1.strzero(xnumero, 10);
     End;

   xsql:='SELECT FACTORAJUSTE FROM CNT104 WHERE PERIODO='''+edtPeriodo.Text+'''';
   dm1.cdsQry2.Close;
   DM1.cdsQry2.ProviderName:='prvCNT';
   dm1.cdsQry2.DataRequest(xsql);
   dm1.cdsQry2.Open;
   edtfactor.text:=dm1.cdsqry2.fieldbyname('FACTORAJUSTE').asstring;
   edtGlosa.Text:='AJUSTE REALIZADO AL '+datetostr(dtpFecha.date);
   BitBCarta.Enabled:=True;
end;

procedure TFAjusteInflacion1.GrabaPrevio;
var
   xSQL   : String;
   xTCam  : Double;
   xWhere : String;

   xCNTReg, xCon : Integer;
begin
      xSQL:='DELETE FROM CNT303 '
           +'WHERE CIAID='''   +dblcCia.Text     +''' and '
           +      'CNTANOMM='''+edtPeriodo.Text+''' and '
           +      'CNTLOTE=''REI'' ';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest( xSQL );
      try
        DM1.cdsQry.Execute;
      except
      end;

   {   if dbeCambio.Text='' then begin
         xWhere := 'TMonId='+''''+DM1.wTMonExt+''''+' and '
                 + 'Fecha='+dm1.wRepFuncDate+''''+ FORMATDATETIME(dm1.wFormatFecha,dtpFComp.Date)+''')';
         if length( DM1.DisplayDescrip('dspTGE','TGE107','*',xWhere,'TMONID'))>0 then
            dbeCambio.Text:=FloattoStr(DM1.cdsQry.fieldbyname('TCam'+DM1.wVRN_TipoCambio).AsFloat)
         else begin
            dbeCambio.Text:='0';
         end;
      end;
    }
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
          xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
             +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFecha.Date)+''')';
      end;
      if (SRV_D = 'ORACLE') then
      begin
          xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
             +'TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''')';
      end;
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest( xSQL );
      DM1.cdsQry.Open;


end;



procedure TFAjusteInflacion1.bbtnCancClick(Sender: TObject);
begin
	DM1.cdsREIActivo.Active := false;
	DM1.cdsREIActivo.Active := false;
	DM1.cdsREI.Active := false;
	close;
end;

procedure TFAjusteInflacion1.cbTCambioChange(Sender: TObject);
var sWhere : string;
	nIndice : integer;
	sCampo : string;
   sSQL : string;
begin
	nIndice := cbTCambio.ItemIndex;
	if ((nIndice = 6) or (nIndice = -1)) then
      begin
		edtTasa.enabled := true;
      sSQL := 'SELECT TCAMVBC FROM TGE107 WHERE FECHA=(SELECT MAX(FECHA) FROM TGE107)';
      DM1.cdsQry.Close;
      DM1.cdsQry.ProviderName:='prvCNT';
      DM1.cdsQry.DataRequest(SSQL);
      DM1.cdsQry.Open;
      edtTasa.Text := DM1.cdsQry.FieldByName('TCAMVBC').asString;
      exit;
      end;

   edtTasa.enabled := false;
   case nIndice of
      0: sCampo := 'BC'; //Valor Bancaria (Compra)
      1: sCampo := 'BV'; //Valor Bancaria (Venta)
      2: sCampo := 'PC'; //Valor Paralela (Venta)
      3: sCampo := 'PV'; //Valor Pararela (Compra)
      4: sCampo := 'OC'; //Valor Oficial (Venta)
      5: sCampo := 'OV'; //Valor Oficial (Compra)
   end;
//formatdatetime(wFormatFecha,dtpFComp.date)+''''+')
//formatdatetime(wFormatFecha,dtpFComp.date)
     sWhere := 'FECHA=' +quotedStr(formatdatetime(wFormatFecha,dtpFecha.date));

   wVRN_TipoCambio := sCampo;
   sCampo := 'TCAMV' + sCampo;
   edtTasa.text := Floattostr(DM1.DisplayReal('PrvTGE', 'TGE107', sCampo, sWhere, sCampo));
end;

//------------------------------------------------------------------------
// Nombre....: evento Click de bbtnOK
// Parametros: sender
// Objetivo..: Este es la parte incial del proceso. Primero verifica que para este periodo no exista ninguna generacion
//             Si existiese registro, significa que ya existe una generacion, sino hay que crear. Ademas de esto tiene
//             que verificar el estado de CNTESTADO y CNTCUADRE para ver si ya esta grabado o contabilizado.
// Fecha.....: 11.04.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion1.bbtnOkClick(Sender: TObject);
var sSQL : string;
	nAnyo, nMes, nDia : word;
	sAnyo, sMes, sDia : shortstring;
	sMaximo : shortstring;
   sComprobante : shortstring;
   lEstadoGrid : boolean;
   xsaldoActivo,XsaldoPasivo,xFactorActivo,xFactorPasivo : Double;
begin


	if length(edtCia.Text)=0 then
   begin
		ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
      exit;
	end;
	if length(edtTDiario.Text)=0 then
	begin
		ShowMessage('Falta Definición de Tipo de Diario');
      dblcTDiario.SetFocus;
      exit;
	end;
   if length(edtTasa.Text) =0 then
   begin
		ShowMessage('Error en Tipo de cambio');
      dtpFecha.OnExit(sender);
      cbTCambio.SetFocus;
      exit;
   end;

   if length(edtfactor.Text) = 0 then
   begin
		ShowMessage('Error en el Factor, Debe ingresar el Valor desde Referencias');
//      edtfactor.SetFocus;
      exit;
   end;

   TitleGrid;

   DM1.cdsREI.active := false;
//   DM1.cdsREIPasivo.active := false;
//   DM1.cdsREIActivo.active := false;
	decodeDate(dtpFecha.date, nAnyo, nMes, nDia);
	sAnyo := inttoStr(nAnyo);
	sDia := inttoStr(nDia); if nDia<10 then sDia := '0'+sDia;
	sMes := inttoStr(nMes); if nMes<10 then sMes := '0'+sMes;


   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin

   sSQL:='SELECT A.CIAID,A.CUENTAID,A.CTADES, '
         +'A.SALDMN'+smes+ ' AS SALDO, A.SALDMN'+smes+'*'+edtFactor.Text
         +' AS FACTOR FROM CNT401 A,TGE202 B '
         +' WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
         +' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.Text
//         +' AND B.CTA_GYP=''A'' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.Text
         +''' AND A.ANO='''+sAnyo+''' AND A.SALDMN'+smes+ '>0'  ;
    END;

   if SRV_D = 'ORACLE' then
   begin
   sSQL:='SELECT A.CIAID,A.CUENTAID,A.CTADES, '
         +'A.SALDMN'+smes+ ' AS SALDO, A.SALDMN'+smes+'*'+edtFactor.Text
         +' AS FACTOR FROM CNT401 A,TGE202 B '
         +' WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND'
         +'  NVL(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.Text
//         +' AND B.CTA_GYP=''A'' AND NVL(CTA_AJUSTEREI,''0'')<>0 AND A.CIAID='''+dblcCIA.Text
         +''' AND A.ANO='''+sAnyo+''' AND A.SALDMN'+smes+ '>0'  ;
    End;
      dm1.cdsREIActivo.Close;
      dm1.cdsREIActivo.DataRequest(sSQL);
      dm1.cdsREIActivo.open;


   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
   sSQL:='SELECT A.CIAID,A.CUENTAID,A.CTADES, '
         +' (-1)*A.SALDMN'+smes+ ' AS SALDO, '
         +' (-1)*A.SALDMN'+smes+'*'+edtfactor.Text
         +' AS FACTOR FROM CNT401 A,TGE202 B '
         +' WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
         +' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.Text
//         +' AND B.CTA_GYP=''P'' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.Text
         +''' AND A.ANO='''+sAnyo+'''AND A.SALDMN'+smes+ '< 0' ;
   END;

   if SRV_D = 'ORACLE' then
   begin
   sSQL:='SELECT A.CIAID,A.CUENTAID,A.CTADES, '
         +' (-1)*A.SALDMN'+smes+ ' AS SALDO, '
         +' (-1)*A.SALDMN'+smes+'*'+edtfactor.Text
         +' AS FACTOR FROM CNT401 A,TGE202 B '
         +' WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
         +' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.Text         
//         +' AND B.CTA_GYP=''P'' AND NVL(CTA_AJUSTEREI,0)<>0 AND A.CIAID='''+dblcCIA.Text
         +''' AND A.ANO='''+sAnyo+'''AND A.SALDMN'+smes+ '< 0' ;
   END;

      DM1.cdsREIPasivo.Close;
      DM1.cdsREIPasivo.DataRequest(sSQL);
      DM1.cdsREIPasivo.Open;



   TitleGrid;

   xSaldoActivo := DM1.OperClientDataSet( dm1.cdsREIActivo,'SUM('+'SALDO'+')','');
   xSaldoPasivo := DM1.OperClientDataSet( dm1.cdsREIPasivo,'SUM('+'SALDO'+')','');
   edtASaldo.text:=Format('%15.2f',[xSaldoActivo+xSaldoPasivo]); // %15.2f;

   xFactorActivo := DM1.OperClientDataSet( dm1.cdsREIActivo,'SUM('+'FACTOR'+')','');
   xFactorPasivo := DM1.OperClientDataSet( dm1.cdsREIPasivo,'SUM('+'FACTOR'+')','');
   edtAAjustado.text:=Format('%15.2f',[xFactorActivo+xFactorPasivo]); // %15.2f;;
   edtADiferencia.text:=Format('%15.2f',[strtofloat(edtAAjustado.text)-strtofloat(edtASaldo.text)]); // %15.2f;;

   edtASaldo.Enabled:=False;
   edtAAjustado.Enabled:=False;
   edtADiferencia.Enabled:=False;
   bbtnAcepta.Enabled:=True;
   bbtnGraba.Enabled:=True;
end;

//------------------------------------------------------------------------
// Nombre....: CalcAjusteDiferencia
// Parametros: Ninguno
// Objetivo..: Realiza el proceso de Calcular las diferencias, el ajuste y el saldo
//             ademas de realizar el cambio para los dos tipos de moneda extranjera
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion1.CalcAjusteDiferencia();
var nFactor, nDolar : DOUBLE;
      sSQL : string;
begin
   if DM1.cdsREI.RecordCount = 0 then exit;
	lblAvance.Caption := 'Visualizacion de Tabla REI';	prbAvance.position := 5;

	//Calcular ajuste por empresa
	nFactor := DM1.DisplayReal ('prvCiaFactores', 'CNT102', 'FCFACTOR', 'CIAID =' +quotedStr(dblcCIA.Text)+ ' AND FCEJERC=' +quotedStr(copy(edtPeriodo.text,1,4)), 'FCFACTOR');
	prbAvance.Position := 20;

	nDolar := strtoFloat(edtTasa.text);

	//Actualizar CNT404
	prbAvance.position := 30;

   sSQL := 'UPDATE CNT404 SET';
    if (SRV_D = 'DB2NT') or
       (SRV_D = 'DB2400') then
    begin
     sSQL := sSQL + ' SALDMNAC= CASE WHEN SALDMNAC=0 THEN ABS(SALDMNAC/'+floattoStr(nDolar) +') ELSE ABS(SALDMNAC) END,';
     sSQL := sSQL + ' SALDMEXT= CASE WHEN SALDMEXT=0 THEN ABS(SALDMEXT*'+floattoStr(nDolar) +') ELSE ABS(SALDMEXT) END';
    end
    else
     if SRV_D = 'ORACLE' then
      begin
       sSQL := sSQL + ' SALDMNAC= DECODE(SALDMNAC,0,ABS(SALDMNAC/'+floattoStr(nDolar) +'),ABS(SALDMNAC)),';
       sSQL := sSQL + ' SALDMEXT= DECODE(SALDMEXT,0,ABS(SALDMEXT*'+floattoStr(nDolar) +'),ABS(SALDMEXT))';
      end;

   sSQL := sSQL + ' WHERE CNTCOMPROB='+quotedStr(edtComprobante.Text);
   sSQL := sSQL +       ' AND (SALDMNAC<>0 AND SALDMEXT<>0)';

   DM1.DCOM1.AppServer.EjecutaQry(SSQL);

   sSQL := 'UPDATE CNT404 SET';
   sSQL := sSQL + ' AJUSMNAC=SALDMNAC*'+floattoStr(nFactor)+',';
   sSQL := sSQL + ' AJUSMEXT=SALDMEXT*'+floattoStr(nFactor)+',';
   sSQL := sSQL + ' DIFEMNAC=SALDMNAC-(SALDMNAC*'+floattoStr(nFactor)+'),';
   sSQL := sSQL + ' DIFEMEXT=SALDMEXT-(SALDMEXT*'+floattoStr(nFactor)+')';
   sSQL := sSQL + ' WHERE CNTCOMPROB='+quotedStr(edtComprobante.Text);
   DM1.DCOM1.AppServer.EjecutaQry(SSQL);
	prbAvance.Position := 90;

	DM1.cdsREIActivo.Active := true;
   DM1.cdsREIPasivo.Active := true;
   DM1.cdsREI.Active := true;
	DM1.cdsREI.EnableControls;

	prbAvance.Position := 100;
	lblAvance.caption := '';
end;

//------------------------------------------------------------------------
// Nombre....: CalcTotales
// Parametros: ninguno
// Objetivo..: Calcula la sumatoria de los saldos, ajustes y diferencias diferenciados en los activos vs pasivos
//             Esto por periodo, compañia
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion1.ActualizaSalidas();
Begin

        for i:=0 to   12 do
        Begin
       //A.) trabajando el saldo inicial inicio
         if i=00 then
         Begin
                  xmes:=inttostr(I);
                  if length(xmes)=1 then
                     xmes:=concat('0',xmes);
                  //Insertando detalle



                if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
                begin

                  XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM '
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS, CNTDINC,DEBE,HABE) '

                     +' ( SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''' ,A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID, ABS(A.SALDMN12+F.SALDMN12),0,''1'',0,0 '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C ,'
                     +'(SELECT SALDMN12,CUENTAID FROM CNT401 WHERE CIAID='''+dblcCIA.text+''' AND ANO='''+anox+''') F '
                     +'  WHERE A.CIAID=B.CIAID AND  A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+anox+''' and F.CUENTAID=CTA_AJUSTEREI and A.CUENTAID=B.CUENTAID  '
                     +'  AND A.TIPREG=''1'' AND B.CTA_TIPOREI=''T'' AND C.PERIODO='''+anox+'12'
                     +''' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE<>0 '
                     +'     )';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

                  XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM '
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS, CNTDINC,DEBE,HABE) '
                     +' ( SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''' ,A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID, '
                     +' CASE WHEN B.CTA_SALAJREI=''N'' THEN ABS(A.SALDMN12) ELSE '
                     +' (CASE WHEN B.CTA_SALAJREI=''S'' THEN ABS(A.SALDMN12+F.SALDMN12) ELSE 0 END ) END '
                     +' ,0,''1'','
                     +' CASE WHEN B.CTA_SALAJREI=''N'' THEN ABS(A.SALDMN12) ELSE '
                     +' (CASE WHEN B.CTA_SALAJREI=''S'' THEN ABS(A.SALDMN12+F.SALDMN12) ELSE 0 END ) END '
                     +',0 '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C ,'
                     +'(SELECT SALDMN12,CUENTAID FROM CNT401 WHERE CIAID='''+dblcCIA.text+''' AND ANO='''+anox+''') F '
                     +'  WHERE A.CIAID=B.CIAID AND  A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+anox+''' AND  F.CUENTAID=CTA_AJUSTEREI and A.CUENTAID=B.CUENTAID  '
                     +' AND A.TIPREG=''1'' AND B.CTA_TIPOREI=''M'' AND C.PERIODO='''+anox+'12'
                     +''' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE<>0   )';

                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

                  XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM '
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS, CNTDINC,DEBE,HABE) '

                     +' ( SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID, ABS(A.SALDMN12+F.SALDMN12),0,''2'',0,0 '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C, '
                     +'(SELECT SALDMN12,CUENTAID FROM CNT401 WHERE CIAID='''+dblcCIA.text+''' AND ANO='''+anox+''') F '
                     +' WHERE A.CIAID=B.CIAID AND  F.CUENTAID=CTA_AJUSTEREI AND A.CUENTAID=B.CUENTAID '
                     +' AND C.PERIODO='''+anox+'12'' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+anox
                     +''' AND B.CTA_TIPOREI=''A''  AND C.FACTORAJUSTE<>0 AND A.TIPREG=''1''   )';
//                     +''' AND A.SALDMN12< 0  AND C.FACTORAJUSTE<>0 AND A.TIPREG=''1''   )';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

//UENTA 491
                  XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM '
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS, CNTDINC,DEBE,HABE) '

                     +' ( SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID, ABS(A.SALDMN12+F.SALDMN12),0,''2'',ABS(A.SALDMN12+F.SALDMN12),0 '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C, '
                     +'(SELECT SALDMN12,CUENTAID FROM CNT401 WHERE CIAID='''+dblcCIA.text+''' AND ANO='''+anox+''') F '
                     +' WHERE A.CIAID=B.CIAID AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+anox+''' AND  F.CUENTAID=CTA_AJUSTEREI AND A.CUENTAID=B.CUENTAID '
                     +' AND A.TIPREG=''1'' AND C.PERIODO='''+anox+'12'' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'''
                     +' AND B.CTA_TIPOREI=''V'' AND C.FACTORAJUSTE<>0    )';

                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;


                  XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM '
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS, CNTDINC,DEBE,HABE) '
                     +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''', B.REIDEPRE AS  CUENTA, ''00000000'+XMES+''',B.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''
                     +Glosa
                     +''','+Tasa+',C.FACTORAJUSTE,A.CUENTAID, A.SALDMN12,0 ,''3'' ,0,0 '
                     +' FROM CNT401 A, CNT104 C,'
                     +' (SELECT A.CIAID,A.CUENTAID,B.CTADES,C.REIDEPRE,C.CTADEPAC '
                     +' FROM CNT401 A,TGE202 B ,ACF110 C '
                     +' WHERE A.CIAID=B.CIAID AND B.CUENTAID=C.CUENTAID AND '
                     +' A.CUENTAID=B.CUENTAID '
                     +' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+anox
                     +''' AND A.SALDMN12>0) B '
                     +' WHERE A.CIAID=B.CIAID  AND A.CIAID='''+dblcCIA.text
                     +''' AND A.ANO='''+anox+''' AND B.CTADEPAC=A.CUENTAID AND C.PERIODO='''+anox+'12''  AND C.FACTORAJUSTE<>0 )';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

                      XSQL:='UPDATE CNT303TMP D SET VALHIST=( '
                     +' SELECT  ABS(VALHIST+B.SALDMN12) '
                     +' FROM CNT303TMP A, CNT401 B '
                     +' WHERE B.CIAID='''+dblcCIA.text+''' AND D.CIAID=A.CIAID AND A.CIAID=B.CIAID '
                     +' AND B.ANO='''+ANOX+'''  AND  D.CNTANO=A.CNTANO AND A.CNTANO='''+ssAnyo+''''
                     +' AND A.CUENTAID=D.CUENTAID AND A.CUENTAID=B.CUENTAID '
                     +' AND A.CNTANOMM=D.CNTANOMM AND A.CNTANOMM='''+Periodo+xmes+''' '
                     +' AND A.CNTDINC=''3'' ) WHERE  D.CNTDINC=''3'' AND D.CNTANOMM='''+Periodo+xmes+'''' ;
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;
                End;

                if (SRV_D = 'ORACLE') then        //UNO
                begin
                  XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM '
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS, CNTDINC,DEBE,HABE) '

                     +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''' ,A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID, ABS(A.SALDMN12+F.SALDMN12),0,''1'',0,0 '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C ,'
                     +'(SELECT SALDMN12,CUENTAID FROM CNT401 WHERE CIAID='''+dblcCIA.text+''' AND ANO='''+anox+''') F '
//                     +'  WHERE A.CIAID=B.CIAID AND  F.CUENTAID=CTA_AJUSTEREI and A.CUENTAID=B.CUENTAID  AND B.CTA_GYP=''A'' AND NVL(B.CTA_RSREI,''N'')=''N'' AND C.PERIODO='''+anox+'12'
                     +' WHERE A.CIAID=B.CIAID AND  F.CUENTAID=CTA_AJUSTEREI and A.CUENTAID=B.CUENTAID AND  B.CTA_TIPOREI=''T'' AND C.PERIODO='''+anox+'12'
                     +''' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE<>0 AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+anox+'''  AND A.TIPREG=''1'''

                     +' UNION ALL '
                                                          //38960
                     +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''' ,A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID,'
                     +' DECODE(B.CTA_SALAJREI,''N'',ABS(A.SALDMN12),DECODE(B.CTA_SALAJREI,''S'',ABS(A.SALDMN12+F.SALDMN12),0)) '
                     +',0,''1'''
                     {// +',DECODE(B.CTA_SALAJREI,''N'',ABS(A.SALDMN12),DECODE(B.CTA_SALAJREI,''S'',ABS(A.SALDMN12+F.SALDMN12),0)) ' anianka
                     +',DECODE(B.CTA_SALAJREI,''N'',ABS(NVL(A.SALDMN12,0)),DECODE(B.CTA_SALAJREI,''S'',ABS(NVL(A.SALDMN12,0)+NVL(F.SALDMN12,0)),0)) '}
                     +',DECODE(B.CTA_SALAJREI,''N'',ABS(nvl(A.SALDMN12,0)),DECODE(B.CTA_SALAJREI,''S'',ABS(NVL(A.SALDMN12,0)+NVL(F.SALDMN12,0)),0)) '
                     + ' ,0 '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C ,'
                     +'(SELECT SALDMN12,CUENTAID FROM CNT401 WHERE CIAID='''+dblcCIA.text+''' AND ANO='''+anox+''') F ,'
                     +' (SELECT A.CIAID, A.CUENTAID ,'+XVARS1+' SUMA ,MAX(B.CIADES) '
                     +' FROM CNT401 A, TGE101 B,TGE202 C '
                     +'  WHERE A.CIAID='''+dblcCIA.TEXT+''' AND A.ANO='''+ssAnyo+''' '
                     +' AND  A.CIAID=B.CIAID AND C.CIAID=A.CIAID AND A.CUENTAID=C.CUENTAID '
                     +' AND LENGTH(C.CTA_AJUSTEREI)>0 AND C.CTA_TIPOREI=''M''  '
                     +' HAVING '+ XVARS1+' >0 GROUP BY A.CIAID,A.CUENTAID  ) G '
                     +'  WHERE A.CIAID=B.CIAID AND  F.CUENTAID(+)=CTA_AJUSTEREI and A.CUENTAID=B.CUENTAID  '
                     +' AND A.CUENTAID=G.CUENTAID  AND B.CTA_TIPOREI=''M'' AND C.PERIODO='''+anox+'12'
                     +''' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE<>0 AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+anox
                     +''' AND TIPREG=''1''' // AND A.SALDMN12>0 AND A.TIPREG=''1'''

                     +' UNION ALL '          //571

                     +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID, ABS(A.SALDMN12+F.SALDMN12),0,''2'',0,0 '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C, '
                     +'(SELECT SALDMN12,CUENTAID FROM CNT401 WHERE CIAID='''+dblcCIA.text+''' AND ANO='''+anox+''') F '
                     +' WHERE A.CIAID=B.CIAID AND  F.CUENTAID=CTA_AJUSTEREI AND A.CUENTAID=B.CUENTAID '
                     +' AND C.PERIODO='''+anox+'12'' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+anox
                     +''' AND B.CTA_TIPOREI=''A''  AND C.FACTORAJUSTE<>0 AND A.TIPREG=''1'''
//                     +''' AND A.CUENTAID NOT LIKE ''39%'' AND A.SALDMN12< 0  AND C.FACTORAJUSTE<>0 AND A.TIPREG=''1'''

                     +' UNION ALL ';

                     XSQL1:=' SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''+Glosa
//                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID, ABS(A.SALDMN12+F.SALDMN12),0,''2'',ABS(A.SALDMN12+F.SALDMN12),0 '
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID, ABS(A.SALDMN12+F.SALDMN12),0,''2'',0,0 '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C, '
                     +'(SELECT SALDMN12,CUENTAID FROM CNT401 WHERE CIAID='''+dblcCIA.text+''' AND ANO='''+anox+''') F '
                     +' WHERE A.CIAID=B.CIAID AND  F.CUENTAID=CTA_AJUSTEREI AND A.CUENTAID=B.CUENTAID '
                     +' AND C.PERIODO='''+anox+'12'' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+anox
                     +'''  AND B.CTA_TIPOREI=''V''  AND  C.FACTORAJUSTE<>0 AND A.TIPREG=''1'''

                     +' UNION ALL '

                     +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''', B.REIDEPRE AS  CUENTA, ''00000000'+XMES+''',B.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''
                     +Glosa
                     +''','+Tasa+',C.FACTORAJUSTE,A.CUENTAID, ABS(A.SALDMN12+F.SALDMN12),0 ,''3'',0,0  '
                     +' FROM CNT401 A, CNT104 C,'
                     +' (SELECT A.CIAID,A.CUENTAID,B.CTADES,C.REIDEPRE,C.CTADEPAC '
                     +' FROM CNT401 A,TGE202 B ,ACF110 C '
                     +' WHERE A.CIAID=B.CIAID AND B.CUENTAID=C.CUENTAID AND '
                     +' A.CUENTAID=B.CUENTAID '
                     +' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+anox+''' AND A.SALDMN12>0) B ,'
                     +' (SELECT SALDMN12,CUENTAID FROM CNT401 WHERE CIAID='''+dblcCIA.text+''''
                     +'    AND ANO='''+ANOX+''') F '
                     +' WHERE A.CIAID=B.CIAID AND B.CTADEPAC=A.CUENTAID AND F.CUENTAID=B.REIDEPRE AND '
                     +' C.PERIODO='''+anox+'12'' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+anox
                     +''' AND C.FACTORAJUSTE<>0) ';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL+XSQL1);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;
                End;
         end;
         //Fin de insercion para los saldo inicales por cuenta

          	prbAvance.Position := 30;
         //insercion para los valores de enero
         if i=1 then
         Begin
                  xmes:=inttostr(I);
                  if length(xmes)=1 then
                     xmes:=concat('0',xmes);

                  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
                  Begin

                     XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST, SALIDAS, CNTDINC,DEBE,HABE ) '
                     +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''' ,A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE, '''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID'
                     +', (A.DEBEMN'+XMES+'-A.HABEMN'+XMES+'-F.SALDMN12),'
                     +' CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE A.HABEMN'+XMES+' END ,''1'',0,0 '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C,  '
                     +' (SELECT  CUENTAID,SALDMN12,TIPREG FROM CNT401 WHERE CIAID='''+dblcCIA.TEXT+''' AND  ANO='''+ANOX+''' AND  TIPREG=''1'')F '
                     +'  WHERE A.CIAID=B.CIAID AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+'''  AND  A.CUENTAID=B.CUENTAID  AND F.CUENTAID=A.CUENTAID  '
                     +'  AND  A.TIPREG=''1'' AND B.CTA_TIPOREI=''T'' AND C.PERIODO='''+PERIODO+XMES
                     +''' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE>=0   )';

                      DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

                    XSQL:=' UPDATE CNT303TMP G SET VALHIST=( '
                         +' SELECT A.VALHIST+((COALESCE(C.DEBEMN'+XMES+',0)-COALESCE(C.HABEMN'+XMES+',0))-'
                         +' COALESCE(D.SALDMN12,0)) '
                         +' FROM CNT303TMP A,CNT401 C, CNT401 D '
                         +' WHERE  A.CIAID='''+dblcCIA.TEXT+''''
                         +' AND A.CIAID=C.CIAID AND G.CIAID=A.CIAID AND  A.CIAID=D.CIAID '
                         +' AND  A.CNTANO='''+ssAnyo+''''
                         +' AND G.CNTANO=A.CNTANO  AND C.ANO=A.CNTANO AND  D.ANO='''+ANOX+''''
                         +' AND G.CUENTAID=A.CUENTAID  AND A.CUENTAID=C.CUENTAID AND D.CUENTAID=A.CUENTAID'
                         +' AND A.CNTANOMM='''+Periodo+xmes+''' AND G.CNTANOMM=A.CNTANOMM AND A.CNTDINC=''1'' )'
                         +' WHERE G.CNTANOMM='''+Periodo+xmes+''' AND G.CNTDINC=''1''';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

                              //CLASE 382
                     XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST, SALIDAS, CNTDINC,DEBE,HABE,CTA_RSREI ) '
//                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST, SALIDAS, CNTDINC,DEBE,HABE,CTA_RSREI ) '
                     +'(SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''' ,A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE, '''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID'
                     +', (COALESCE(A.DEBEMN'+XMES+',0)-COALESCE(A.HABEMN'+XMES+',0)-ABS(COALESCE(F.SALDMN12,0))), '
                     +' CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.HABEMN'+XMES+',0) END ,''1'' '
                     +' ,CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE (CASE WHEN B.CTA_SALAJREI=''N'' THEN COALESCE(A.DEBEMN'+XMES+',0) ELSE  '
                     +' (CASE WHEN B.CTA_SALAJREI=''S'' THEN ((COALESCE(A.DEBEMN'+XMES+',0) )) END )  '                     
//                     +' (CASE WHEN B.CTA_SALAJREI=''S'' THEN ((A.DEBEMN'+XMES+'-F.SALDMN12 )) END )  '

                     +' END) END, '
                     +' CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.HABEMN'+XMES+',0) END, ''S'''
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C,  '
                     +' (SELECT  CUENTAID,SALDMN12,TIPREG FROM CNT401 WHERE  CIAID='''+dblcCIA.TEXT+''' AND ANO='''+ANOX
                     +''' AND  TIPREG=''1'')F '
                     +'  WHERE A.CIAID=B.CIAID AND A.CIAID='''+dblcCIA.text+'''  AND A.ANO='''+ssAnyo
                     +''' AND A.CUENTAID=B.CUENTAID  AND F.CUENTAID=A.CUENTAID  '
                     +'  AND A.TIPREG=''1''  AND  B.CTA_TIPOREI=''M'' AND C.PERIODO='''+PERIODO+XMES
                     +''' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE>=0    )';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

//revisar
                     XSQL:='SELECT A.CTA_ORIGEN  FROM CNT303TMP A,  TGE202 B '
                     +' WHERE  B.CIAID='''+dblcCIA.text+''' AND A.CIAID=B.CIAID '
                     +' AND A.CTA_ORIGEN=B.CUENTAID AND A.CNTANO='''+speano.text+''''
                     +' AND A.TDIARID='''+dblcTDiario.text+'''  AND A.CNTANOMM='''+PERIODO+XMES+''''
                     +' AND B.CTA_TIPOREI=''M'' ORDER BY A.CTA_ORIGEN ';
//                     +' AND B.CTA_RSREI=''S'' ORDER BY A.CTA_ORIGEN ';
                     DM1.cdsCuenta3.Close;
                     DM1.cdsCuenta3.DataRequest(xSQL);
                     DM1.cdsCuenta3.Open;

                     DM1.cdsCuenta3.First;
                     while not DM1.cdsCuenta3.eof do
                     Begin
                       XSQL:=' UPDATE CNT303TMP S SET S.SALIDAS=ABS((-1)*(S.SALIDAS) +( '
                       +' SELECT COALESCE(SUM(A.CNTHABEMN),0) SALIDASINI '
                       +' FROM TGE202  B ,CNT301 A ,TGE104 C '
                       +' WHERE A.CIAID='''+dblcCIA.text+''' AND S.CIAID=A.CIAID AND A.CIAID=B.CIAID '
                       +' AND B.CTA_TIPOREI=''M'' AND S.CTA_ORIGEN=B.CUENTAID '
                       +' AND A.CUENTAID LIKE '''+dm1.cdsCuenta3.fieldbyname('CTA_ORIGEN').asstring+'%'' '
                       +' AND A.CNTANOMM='''+PERIODO+XMES+''' AND S.CNTANOMM=A.CNTANOMM '
                       +' AND A.TDIARID=C.TDIARID '
                       +' AND C.REGISTRO=''A'' AND B.CUENTAID='''+dm1.cdsCuenta3.fieldbyname('CTA_ORIGEN').asstring+''' '
                       +' GROUP BY A.CIAID,A.TDIARID,A.CNTANOMM,B.CUENTAID )), '
                       +' S.DEBE=ABS((-1)*(S.DEBE)+( '
                       +' SELECT COALESCE(SUM(A.CNTDEBEMN),0) DEBEINI '
                       +' FROM TGE202  B ,CNT301 A ,TGE104 C '
                       +' WHERE A.CIAID='''+dblcCIA.text+''' AND S.CIAID=A.CIAID AND A.CIAID=B.CIAID '
                       +' AND B.CTA_TIPOREI=''M'' AND S.CTA_ORIGEN=B.CUENTAID '
                       +' AND A.CUENTAID LIKE '''+dm1.cdsCuenta3.fieldbyname('CTA_ORIGEN').asstring+'%'' '
                       +' AND A.CNTANOMM='''+PERIODO+XMES+''' AND S.CNTANOMM=A.CNTANOMM '
                       +' AND A.TDIARID=C.TDIARID '
                       +' AND C.REGISTRO=''A'' AND B.CUENTAID='''+dm1.cdsCuenta3.fieldbyname('CTA_ORIGEN').asstring+''' '
                       +' GROUP BY A.CIAID,A.TDIARID,A.CNTANOMM,B.CUENTAID )) '
                       +' WHERE  S.CNTANOMM='''+PERIODO+XMES+''' AND S.CIAID='''+dblcCIA.text
                       +''' AND S.TDIARID='''+dblcTDiario.TEXT+''''
                       +' AND S.CTA_RSREI=''S'' AND S.CTA_ORIGEN='''+dm1.cdsCuenta3.fieldbyname('CTA_ORIGEN').asstring+'''';
                       DM1.cdscuenta5.Close;
                       DM1.cdsCuenta5.DataRequest(xSQL);
                       try
                        DM1.cdsCuenta5.Execute;
                       except
                       end;
                     DM1.cdsCuenta3.next;
                     End;


                        //571
                     XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST, SALIDAS, CNTDINC,DEBE,HABE ) '

                     +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '
                     +',(A.HABEMN'+XMES+'- A.DEBEMN'+XMES+')-ABS(F.SALDMN12)+ (H.HABEMN'+XMES+'-H.DEBEMN'+XMES+')+ ABS(G.SALDMN12)'
                     +' ,CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE (A.HABEMN'+XMES+') END, ''2'',0,0  '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C, '
                     +' (SELECT  * FROM CNT401 WHERE CIAID='''+dblcCIA.TEXT+''' AND  ANO='''+ANOX+''' )F , '
                     +' (SELECT  HABEMN12,CUENTAID,SALDMN12 FROM CNT401 WHERE CIAID='''+dblcCIA.TEXT+''' AND ANO='''+ANOX+''')G, '
                     +' (SELECT  HABEMN01,CUENTAID,DEBEMN01,SALDMN12  FROM CNT401 WHERE CIAID='''+dblcCIA.TEXT+''' and ANO='''+ssAnyo+''' )H '
                     +' WHERE A.CIAID=B.CIAID AND  A.CIAID='''+dblcCIA.text+'''  AND A.ANO='''+ssAnyo +''' AND G.CUENTAID=CTA_AJUSTEREI AND A.CUENTAID=B.CUENTAID AND F.CUENTAID=A.CUENTAID AND H.CUENTAID=B.CTA_AJUSTEREI  '
                     +' AND A.TIPREG=''1'' AND C.PERIODO='''+PERIODO+XMES+''' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'''
                     +' AND B.CTA_TIPOREI=''A'' AND C.FACTORAJUSTE>=0 )';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

//CUENTA491
                     XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST, SALIDAS, CNTDINC,DEBE,HABE ) '

                     +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '
                     +',(A.DEBEMN'+XMES+'-A.HABEMN'+XMES+'-ABS(F.SALDMN12))'
                     +' ,CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE (A.DEBEMN'+XMES+') END, ''2'''
                     +',CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE A.HABEMN'+XMES+' END ,CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE A.DEBEMN'+XMES+' END  '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C, '
                     +' (SELECT  * FROM CNT401 WHERE CIAID='''+dblcCIA.TEXT+''' AND ANO='''+ANOX+''')F '
                     +' WHERE A.CIAID=B.CIAID AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo
                     +''' AND  A.CUENTAID=B.CUENTAID AND F.CUENTAID=A.CUENTAID  '
                     +' AND A.TIPREG=''1''  AND C.PERIODO='''+PERIODO+XMES+''' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'''
                     +' AND B.CTA_TIPOREI=''V'' AND C.FACTORAJUSTE>=0 )';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

                     XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST, SALIDAS, CNTDINC,DEBE,HABE ) '
                     +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''', B.REIDEPRE AS  CUENTA, ''00000000'+XMES+''',B.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''
                     +Glosa
                     +''','+Tasa+',C.FACTORAJUSTE,A.CUENTAID '
                     +', A.HABEMN'+XMES+'-A.DEBEMN'+XMES+', ' // update -ABS(F.SALDMN12)+(COALESCE(H.HABEMN01,0)-COALESCE(H.DEBEMN01,0)+G.SALDMN12),'
                     +' CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE A.HABEMN'+XMES+' END ,''3'',0,0 '
                     +' FROM CNT401 A, CNT104 C,'
                     +' (SELECT A.CIAID,A.CUENTAID,B.CTADES,C.REIDEPRE,C.CTADEPAC,A.HABEMN01,A.DEBEMN01 '
                     +' FROM CNT401 A,TGE202 B ,ACF110 C '
                     +' WHERE A.CIAID=B.CIAID AND B.CUENTAID=C.CUENTAID AND '
                     +' A.CUENTAID=B.CUENTAID '
                     +' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+''' AND A.SALDMN'+xmes+'>0) B '
                     +' WHERE A.CIAID=B.CIAID   AND B.CTADEPAC=A.CUENTAID AND C.PERIODO='''
                     +PERIODO+XMES+''' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+''' AND C.FACTORAJUSTE>=0) ';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;
                     XSQL:='UPDATE CNT303TMP D SET VALHIST=( '
                            +' SELECT  VALHIST-ABS(B.SALDMN12) '
                     +' FROM CNT303TMP A, CNT401 B '
                     +' WHERE B.CIAID='''+dblcCIA.text+''' AND D.CIAID=A.CIAID AND A.CIAID=B.CIAID '
                     +' AND B.ANO='''+ANOX+'''  AND  D.CNTANO=A.CNTANO AND A.CNTANO='''+ssAnyo+''''
                     +' AND A.CUENTAID=D.CUENTAID AND A.CTA_ORIGEN=B.CUENTAID '
                     +' AND A.CNTANOMM=D.CNTANOMM AND A.CNTANOMM='''+Periodo+xmes+''' '
                     +' AND A.CNTDINC=''3'' ) WHERE  D.CNTANOMM='''+Periodo+xmes+''' AND CNTDINC=''3''' ;
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

                     XSQL:='UPDATE CNT303TMP D SET VALHIST=( '
                     +' SELECT A.VALHIST+(COALESCE(B.HABEMN01,0)-COALESCE(B.DEBEMN01,0) '
                     +' +C.SALDMN12) '
                     +' FROM CNT303TMP A, CNT401 B  ,CNT401 C '
                     +' WHERE B.CIAID='''+dblcCIA.text+''''
                     +' AND D.CIAID=A.CIAID AND A.CIAID=B.CIAID AND A.CIAID=C.CIAID '
                     +' AND A.CNTANO='''+ssAnyo+'''AND  D.CNTANO=A.CNTANO AND C.ANO='''+ANOX+''''
                     +' AND A.CNTANO=B.ANO '
                     +' AND A.CUENTAID=D.CUENTAID AND A.CUENTAID=B.CUENTAID   AND A.CUENTAID=C.CUENTAID '
                     +' AND A.CNTANOMM=D.CNTANOMM AND A.CNTANOMM='''+Periodo+xmes+''''
                     +' AND A.CNTDINC=''3'') WHERE  D.CNTANOMM='''+Periodo+xmes+''' AND CNTDINC=''3''';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

                  End;

                  if (SRV_D = 'ORACLE') then             // DOS
                  Begin

                     XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST, SALIDAS, CNTDINC,DEBE,HABE,CTA_RSREI ) '
//                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST, SALIDAS, CNTDINC,DEBE,HABE,CTA_RSREI ) '
                     +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''' ,A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID'
                     +', (NVL(A.DEBEMN'+XMES+',0)-NVL(A.HABEMN'+XMES+',0)-NVL(F.SALDMN12,0))+(NVL(H.DEBEMN'+XMES+',0)-NVL(H.HABEMN'+XMES+',0))-NVL(G.SALDMN12,0), '
                     +' DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0)),''1'' ,0,0,'' '' '  //, ABS(F.SALDMN12-(A.DEBEMN'+xmes+'-A.HABEMN'+xmes+')'
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C,  '
                     +' (SELECT  CUENTAID,SALDMN12,TIPREG FROM CNT401 WHERE ANO='''+ANOX+''' AND CIAID='''+dblcCIA.TEXT+''' AND TIPREG=''1'')F, '
                     +' (SELECT  HABEMN12,CUENTAID,SALDMN12,TIPREG FROM CNT401 WHERE ANO='''+ANOX+''' AND CIAID='''+dblcCIA.TEXT+''' AND TIPREG=''1'')G, '
                     +' (SELECT  HABEMN01,CUENTAID,DEBEMN01,SALDMN12,TIPREG FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''' AND TIPREG=''1'')H '
                     +'  WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID  AND F.CUENTAID=A.CUENTAID  '
                     +' AND G.CUENTAID(+)=B.CTA_AJUSTEREI AND H.CUENTAID(+)=B.CTA_AJUSTEREI  AND B.CTA_TIPOREI=''T'' AND C.PERIODO='''+PERIODO+XMES
//                     +' AND G.CUENTAID(+)=B.CTA_AJUSTEREI AND H.CUENTAID(+)=B.CTA_AJUSTEREI AND B.CTA_GYP=''A'' AND NVL(B.CTA_RSREI,''N'')=''N'' AND C.PERIODO='''+PERIODO+XMES
//                     +''' AND A.CUENTAID NOT LIKE ''5%'' AND NVL(CTA_AJUSTEREI,0)<>0 AND C.FACTORAJUSTE>=0 AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+''' AND A.SALDMN'+xmes+'>0 AND A.TIPREG=''1'''
                     +'''  AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE>=0 AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+'''  AND A.TIPREG=''1'''

                     +' UNION ALL '

                     +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''' ,A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID'
                     +', (NVL(A.DEBEMN'+XMES+',0)-NVL(A.HABEMN'+XMES+',0)-ABS(NVL(F.SALDMN12,0))), '
                     +' DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0)),''1'' '
                     +' ,DECODE(C.FACTORAJUSTE,0,0,'
                     +' DECODE(B.CTA_SALAJREI,''N'','
                     +' DECODE(B.CTA_SALAJREI,''N'',NVL(A.DEBEMN'+XMES+',0), '
                     +' DECODE(B.CTA_SALAJREI,''S'','
                     +' DECODE(B.CTA_SALAJREI,''S'',(NVL(A.DEBEMN'+XMES+',0)-NVL(F.SALDMN12,0) ) '
                     +' +(NVL(H.DEBEMN'+XMES+',0)-NVL(G.SALDMN12,0)),0),0),0),(NVL(A.DEBEMN'+XMES+',0)))) '
                     +'  ,DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0)),''S'' '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C,  '
                     +' (SELECT  CUENTAID,SALDMN12,TIPREG FROM CNT401 WHERE ANO='''+ANOX+''' AND CIAID='''+dblcCIA.TEXT+''' AND TIPREG=''1'')F, '
                     +' (SELECT  HABEMN12,CUENTAID,SALDMN12,TIPREG FROM CNT401 WHERE ANO='''+ANOX+''' AND CIAID='''+dblcCIA.TEXT+''' AND TIPREG=''1'')G, '
                     +' (SELECT  HABEMN01,CUENTAID,DEBEMN01,SALDMN12,TIPREG FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''' AND TIPREG=''1'')H '
                     +'  WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID  AND F.CUENTAID(+)=A.CUENTAID  '
                     +' AND G.CUENTAID(+)=B.CTA_AJUSTEREI AND H.CUENTAID(+)=B.CTA_AJUSTEREI '
                     +' AND B.CTA_TIPOREI=''M'' AND C.PERIODO='''+PERIODO+XMES
                     +''' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE>=0 AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+'''  AND A.TIPREG=''1'''

                     +' UNION ALL '

                     +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '
//                     +', (NVL(A.HABEMN'+XMES+',0)- NVL(A.DEBEMN'+XMES+',0))-ABS(F.SALDMN12)+ (H.HABEMN'+XMES+'-H.DEBEMN'+XMES+')+ ABS(G.SALDMN12) '
                     +', (NVL(A.HABEMN'+XMES+',0)- NVL(A.DEBEMN'+XMES+',0))-ABS(NVL(F.SALDMN12,0))+ (NVL(H.HABEMN'+XMES+',0)-NVL(H.DEBEMN'+XMES+',0))+ ABS(NVL(G.SALDMN12,0)) '
//                     +' ,DECODE(C.FACTORAJUSTE,0,0,A.HABEMN'+XMES+'),''2'' ,0,0,'' '' '
                     +' ,DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0)),''2'' ,0,0,'' '' '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C, '
                     +' (SELECT  * FROM CNT401 WHERE ANO='''+ANOX+''' AND CIAID='''+dblcCIA.TEXT+''')F , '
                     +' (SELECT  HABEMN12,CUENTAID,SALDMN12 FROM CNT401 WHERE ANO='''+ANOX+''' AND CIAID='''+dblcCIA.TEXT+''')G, '
                     +' (SELECT  HABEMN01,CUENTAID,DEBEMN01,SALDMN12  FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''')H '
                     +' WHERE A.CIAID=B.CIAID AND G.CUENTAID=CTA_AJUSTEREI AND A.CUENTAID=B.CUENTAID AND F.CUENTAID=A.CUENTAID AND H.CUENTAID=B.CTA_AJUSTEREI  '
                     +' AND C.PERIODO='''+PERIODO+XMES+''' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo
                     +''' AND B.CTA_TIPOREI=''A''   AND C.FACTORAJUSTE>=0 AND A.TIPREG=''1'''

                     +' UNION ALL ';
                                 //VER 491
                     XSQL1:=' SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '
                     +',(NVL(A.DEBEMN'+XMES+',0)-NVL(A.HABEMN'+XMES+',0)+ABS(NVL(F.SALDMN12,0)))  '
                     +' ,DECODE(C.FACTORAJUSTE,0,0,NVL(A.DEBEMN'+XMES+',0)),''2'' '
                     +', DECODE(C.FACTORAJUSTE,0,0,(NVL(A.HABEMN'+XMES+',0)))'
                     +',DECODE(C.FACTORAJUSTE,0,0,NVL(A.DEBEMN'+XMES+',0)) ,'' '' '
{                     +',(A.DEBEMN'+XMES+'-A.HABEMN'+XMES+'+ABS(F.SALDMN12))  '
                     +' ,DECODE(C.FACTORAJUSTE,0,0,A.DEBEMN'+XMES+'),''2'' '
                     +', DECODE(C.FACTORAJUSTE,0,0,(A.HABEMN'+XMES+'))'
                     +',DECODE(C.FACTORAJUSTE,0,0,A.DEBEMN'+XMES+') ,'' '' '
}                    +' FROM CNT401 A,TGE202 B  ,CNT104 C, '
                     +' (SELECT  * FROM CNT401 WHERE ANO='''+ANOX+''' AND CIAID='''+dblcCIA.TEXT+''')F , '
                     +' (SELECT  HABEMN12,CUENTAID,SALDMN12 FROM CNT401 WHERE ANO='''+ANOX+''' AND CIAID='''+dblcCIA.TEXT+''')G, '
                     +' (SELECT  HABEMN01,CUENTAID,DEBEMN01,SALDMN12  FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''')H '
                     +' WHERE A.CIAID=B.CIAID AND G.CUENTAID(+)=CTA_AJUSTEREI AND A.CUENTAID=B.CUENTAID AND F.CUENTAID=A.CUENTAID AND H.CUENTAID(+)=B.CTA_AJUSTEREI  '
                     +' AND C.PERIODO='''+PERIODO+XMES+''' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo
                     +'''  AND B.CTA_TIPOREI=''V''  AND C.FACTORAJUSTE>=0 AND A.TIPREG=''1'''
                     //                     +'''  AND B.CTA_RSREI=''X''  AND C.FACTORAJUSTE>=0 AND A.TIPREG=''1'''

                     +' UNION ALL '

                     +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''', B.REIDEPRE AS  CUENTA, ''00000000'+XMES+''',B.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''
                     +Glosa
                     +''','+Tasa+',C.FACTORAJUSTE,A.CUENTAID '
                     +', A.HABEMN'+XMES+'-A.DEBEMN'+XMES+'-ABS(F.SALDMN12)+(nvl(H.HABEMN01,0)-nvl(H.DEBEMN01,0)+G.SALDMN12),'
                     +' DECODE(C.FACTORAJUSTE,0,0,A.HABEMN'+XMES+'),''3'',0,0,'' '' '
                     +' FROM CNT401 A, CNT104 C,'
                     +' (SELECT A.CIAID,A.CUENTAID,B.CTADES,C.REIDEPRE,C.CTADEPAC,A.HABEMN01,A.DEBEMN01 '
                     +' FROM CNT401 A,TGE202 B ,ACF110 C '
                     +' WHERE A.CIAID=B.CIAID AND B.CUENTAID=C.CUENTAID AND '
                     +' A.CUENTAID=B.CUENTAID '
//                     +' AND B.CTA_GYP=''A'' '
                     +' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+''' AND A.SALDMN'+xmes+'>0) B ,'
                     +' (SELECT  * FROM CNT401 WHERE ANO='''+ANOX+''' AND CIAID='''+dblcCIA.TEXT+''')F ,'
                     +' (SELECT  * FROM CNT401 WHERE ANO='''+ANOX+''' AND CIAID='''+dblcCIA.TEXT+''')G ,'
                     +' (SELECT  *  FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''')H '
                     +' WHERE A.CIAID=B.CIAID AND F.CUENTAID=A.CUENTAID AND G.CUENTAID=B.REIDEPRE AND B.REIDEPRE=H.CUENTAID(+)  AND B.CTADEPAC=A.CUENTAID AND C.PERIODO='''
                     +PERIODO+XMES+'''   AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+''' AND C.FACTORAJUSTE>=0) ';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL+XSQL1);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

                     //Actualizacion en las cuentas de Clase 2 y en la 382,38960 ACT2
                     XSQL:=' UPDATE CNT303TMP S SET S.SALIDAS=ABS((-1)*(S.SALIDAS) +( '
                       +' SELECT NVL(SUM(A.CNTHABEMN),0) SALIDASINI '
                       +' FROM TGE202  B ,CNT301 A ,TGE104 C '
                       +' WHERE A.CIAID='''+dblcCIA.text+''' AND S.CIAID=A.CIAID AND A.CIAID=B.CIAID '
                       +' AND B.CTA_TIPOREI=''M'' AND S.CTA_ORIGEN=B.CUENTAID '
                       +' AND A.CUENTAID LIKE B.CUENTAID||''%'' '
                       +' AND A.CNTANOMM='''+PERIODO+XMES+''' AND S.CNTANOMM=A.CNTANOMM '
                       +' AND A.TDIARID=C.TDIARID '
                       +' AND C.REGISTRO=''A'' '
                       +' GROUP BY A.CIAID,A.TDIARID,A.CNTANOMM,B.CUENTAID )), '
                       +' S.DEBE=ABS((-1)*(S.DEBE)+( '
                       +' SELECT NVL(SUM(A.CNTDEBEMN),0) DEBEINI '
                       +' FROM TGE202  B ,CNT301 A ,TGE104 C '
                       +' WHERE A.CIAID='''+dblcCIA.text+''' AND S.CIAID=A.CIAID AND A.CIAID=B.CIAID '
                       +' AND B.CTA_TIPOREI=''M'' AND S.CTA_ORIGEN=B.CUENTAID '
                       +' AND A.CUENTAID LIKE B.CUENTAID||''%'' '
                       +' AND A.CNTANOMM='''+PERIODO+XMES+''' AND S.CNTANOMM=A.CNTANOMM '
                       +' AND A.TDIARID=C.TDIARID '
                       +' AND C.REGISTRO=''A'' '
                       +' GROUP BY A.CIAID,A.TDIARID,A.CNTANOMM,B.CUENTAID )) '

                       +' WHERE  S.CNTANOMM='''+PERIODO+XMES+''' AND S.CIAID='''+dblcCIA.text
                       +''' AND S.TDIARID='''+dblcTDiario.TEXT+''''
                       +' AND S.CTA_RSREI=''S''';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

//Para la cuenta 491   chequear
{                     XSQL:=' UPDATE CNT303TMP S SET S.SALIDAS=ABS((-1)*(S.SALIDAS) +( '
                       +' SELECT NVL(SUM(A.CNTDEBEMN),0) SALIDASINI '
                       +' FROM TGE202  B ,CNT301 A ,TGE104 C '
                       +' WHERE A.CIAID='''+dblcCIA.text+''' AND S.CIAID=A.CIAID AND A.CIAID=B.CIAID '
                       +' AND B.CTA_RSREI=''X'' AND S.CTA_ORIGEN=B.CUENTAID '
                       +' AND A.CUENTAID LIKE B.CUENTAID||''%'' '
                       +' AND A.CNTANOMM='''+PERIODO+XMES+''' AND S.CNTANOMM=A.CNTANOMM '
                       +' AND A.TDIARID=C.TDIARID '
                       +' AND C.REGISTRO=''A'' '
                       +' GROUP BY A.CIAID,A.TDIARID,A.CNTANOMM,B.CUENTAID )), '
                       +' S.DEBE=ABS((-1)*(S.DEBE)+( '
                       +' SELECT NVL(SUM(A.CNTHABEMN),0) DEBEINI '
                       +' FROM TGE202  B ,CNT301 A ,TGE104 C '
                       +' WHERE A.CIAID='''+dblcCIA.text+''' AND S.CIAID=A.CIAID AND A.CIAID=B.CIAID '
                       +' AND B.CTA_RSREI=''X'' AND S.CTA_ORIGEN=B.CUENTAID '
                       +' AND A.CUENTAID LIKE B.CUENTAID||''%'' '
                       +' AND A.CNTANOMM='''+PERIODO+XMES+''' AND S.CNTANOMM=A.CNTANOMM '
                       +' AND A.TDIARID=C.TDIARID '
                       +' AND C.REGISTRO=''A'' '
                       +' GROUP BY A.CIAID,A.TDIARID,A.CNTANOMM,B.CUENTAID )) '
                       +' WHERE  S.CNTANOMM='''+PERIODO+XMES+''' AND S.CIAID='''+dblcCIA.text
                       +''' AND S.TDIARID='''+dblcTDiario.TEXT+''''
                       +' AND S.CTA_RSREI=''X''';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;
 }
                  End;
        end;

        //FIN DE INSERCION DE VALORES HISTORICOS PARA MES DE ENERO

        	prbAvance.Position := 40;
        //INSERCION DE VALORES HISTORICOS PARA MESES DE FEBRERO A DICIEMBRE
        if i>1 then
         Begin
                  xmes:=inttostr(I);
                  if length(xmes)=1 then
                     xmes:=concat('0',xmes);

                  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
                  Begin

                    XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDINC,DEBE,HABE ) '
                     +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'
                     +XMES+''' ,A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE ,'''
                     +FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '
                     +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE (COALESCE(A.DEBEMN'+xmes+',0)-COALESCE(A.HABEMN'+XMES+',0)) END '
                     +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.HABEMN'+XMES+',0) END,''1'',0,0 '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C  '
                     +'  WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID  '
                     +'  AND B.CTA_TIPOREI=''T'' AND C.PERIODO='''+PERIODO+XMES
                     +''' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE>=0 AND A.CIAID='''+dblcCIA.text
                     +''' AND A.ANO='''+ssAnyo+'''  AND A.TIPREG=''1'')';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

                     XSQL:='UPDATE CNT303TMP D SET VALHIST=( '
                           +' SELECT A.VALHIST+(COALESCE(B.DEBEMN'+XMES+',0)- COALESCE(B.HABEMN'+XMES+',0)) FROM CNT303TMP A, CNT401 B '
                           +' WHERE B.CIAID='''+dblcCIA.text+''' AND D.CIAID=A.CIAID '
                           +' AND B.ANO='''+ssAnyo+''' AND  D.CNTANO=A.CNTANO '
                           +' AND A.CUENTAID=D.CUENTAID AND A.CNTANOMM='''+Periodo+xmes+''' AND A.CNTANOMM=D.CNTANOMM  '
                           +' AND A.CUENTAID=B.CUENTAID AND A.CNTDINC=''1'' ), '
                           +' SALIDAS=('
                           +' SELECT A.SALIDAS+COALESCE(B.HABEMN'+XMES+',0) FROM CNT303TMP A, CNT401 B '
                           +' WHERE B.CIAID='''+dblcCIA.text+''' AND D.CIAID=A.CIAID '
                           +' AND B.ANO='''+ssAnyo+''' AND  D.CNTANO=A.CNTANO '
                           +' AND A.CUENTAID=D.CUENTAID AND A.CNTANOMM='''+Periodo+xmes+''' AND A.CNTANOMM=D.CNTANOMM  '
                           +' AND A.CUENTAID=B.CUENTAID AND A.CNTDINC=''1'' ) '
                           +' WHERE D.CNTANOMM='''+Periodo+xmes+''' AND D.CNTDINC=''1''';

                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;


                     XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDINC,DEBE,HABE ) '
//                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDINC,DEBE,HABE,CTA_RSREI ) '
                     +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''' ,A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '
                     +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE (COALESCE(A.DEBEMN'+xmes+',0)-COALESCE(A.HABEMN'+XMES+',0)) END '
                     +',CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.HABEMN'+XMES+',0) END,''1'' '
                     +',CASE  WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.DEBEMN'+XMES+',0) END '
                     +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.HABEMN'+XMES+',0) END  '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C  '
                     +'  WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID   '
                     +'  AND B.CTA_TIPOREI=''M'' AND C.PERIODO='''+PERIODO+XMES
                     +''' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE>=0 AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+''' AND A.SALDMN'+xmes+'>=0 AND A.TIPREG=''1'')';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

                     XSQL:='UPDATE CNT303TMP D SET VALHIST= '
                     +' (SELECT CASE WHEN A.FACTOR=0 THEN 0 ELSE '
                     +' (CASE WHEN LENGTH(A.CTA_ORIGEN)=2 THEN '
                     +'  (CASE WHEN SUBSTR(A.CUENTAID,1,2)=SUBSTR(A.CTA_ORIGEN,1,2) THEN A.VALHIST ELSE 0 END ) '
                     +' ELSE (CASE WHEN LENGTH(A.CTA_ORIGEN)=3  THEN '
                     +' (CASE WHEN SUBSTR(A.CUENTAID,1,3)=SUBSTR(A.CTA_ORIGEN,1,3) THEN 0 '
                     +' ELSE A.VALHIST+(COALESCE(B.DEBEMN'+XMES+',0) + COALESCE(B.HABEMN'+XMES+',0)) END  ) '
                     +' ELSE A.VALHIST+(COALESCE(B.DEBEMN'+XMES+',0) +COALESCE(B.HABEMN'+XMES+',0)) END) END  ) '
                     +' END VALHIST '
                     +' FROM CNT303TMP A, CNT401 B ,TGE202 C '
                     +' WHERE B.CIAID='''+dblcCIA.text+''' AND D.CIAID=A.CIAID AND A.CIAID=B.CIAID  AND A.CIAID=C.CIAID '
                     +' AND C.CUENTAID=A.CTA_ORIGEN AND C.CTA_TIPOREI=''M'' '
//                     +' AND C.CUENTAID=A.CTA_ORIGEN AND C.CTA_RSREI=''S'' '
                     +' AND B.ANO='''+ssAnyo+''' AND  D.CNTANO=A.CNTANO '
                     +' AND A.CUENTAID=D.CUENTAID AND A.CNTANOMM='''+Periodo+xmes+'''  AND  A.CNTANOMM=D.CNTANOMM '
                     +' AND A.CUENTAID=B.CUENTAID AND A.CNTDINC=''1'') '
                     +' WHERE D.CNTANOMM='''+Periodo+xmes+''' AND D.CNTDINC=''1'' AND D.CTA_RSREI=''M''';
//                     +' WHERE D.CNTANOMM='''+Periodo+xmes+''' AND D.CNTDINC=''1'' AND D.CTA_RSREI=''S''';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;
                                              //571
                     XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDINC,DEBE,HABE ) '

                     +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '//(A.HABEMN01- A.DEBEMN01)-ABS(F.SALDMN12)+(H.HABEMN01-H.DEBEMN01)+ABS(G.SALDMN12)
                     +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE (COALESCE(A.HABEMN'+XMES+',0)-COALESCE(A.DEBEMN'+xmes+',0))+(COALESCE(H.HABEMN'+XMES+',0)-COALESCE(H.DEBEMN'+XMES+',0)) END'
                     +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.HABEMN'+XMES+',0) END ,''2'',0,0'
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C, '
                     +' (SELECT  * FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''')H '
                     +' WHERE  A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND H.CUENTAID=CTA_AJUSTEREI '
                     +' AND C.PERIODO='''+PERIODO+XMES+''' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' '
                     +' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo
                     +''' AND B.CTA_TIPOREI=''A''  AND C.FACTORAJUSTE>=0 AND A.TIPREG=''1'')';

                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

//CUENTA 491
                     XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDINC,DEBE,HABE ) '

                     +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '//(A.HABEMN01- A.DEBEMN01)-ABS(F.SALDMN12)+(H.HABEMN01-H.DEBEMN01)+ABS(G.SALDMN12)
                     +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE (A.DEBEMN'+XMES+'-A.HABEMN'+xmes+') END'
//                     +', DECODE(C.FACTORAJUSTE,0,0,A.DEBEMN'+xmes+')'
                     +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.DEBEMN'+XMES+',0) END ,''2'''
                     +',CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.HABEMN'+XMES+',0) END '
                     +',CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.DEBEMN'+XMES+',0) END '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C '
//                     +' (SELECT  * FROM CNT401 WHERE  CIAID='''+dblcCIA.TEXT+''' AND ANO='''+ssAnyo+'''  )H '
                     +' WHERE  A.CIAID=B.CIAID AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo
//                     +''' AND A.CUENTAID=B.CUENTAID AND H.CUENTAID=A.CTA_AJUSTEREI AND A.TIPREG=''1'' '
                     +''' AND A.CUENTAID=B.CUENTAID AND  A.TIPREG=''1'' '
                     +' AND C.PERIODO='''+PERIODO+XMES+''' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' '
                     +'  AND B.CTA_TIPOREI=''V''  AND C.FACTORAJUSTE>=0 )';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

                     XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDINC,DEBE,HABE ) '
                     +' ( SELECT A.CIAID, '''+dblcTDiario.TEXT+''', B.REIDEPRE AS  CUENTA, ''00000000'+XMES+''',B.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''
                     +Glosa
                     +''','+Tasa+',C.FACTORAJUSTE,A.CUENTAID '  //A.HABEMN02-A.DEBEMN02+(H.HABEMN02-H.DEBEMN02)
                     +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE ( COALESCE(A.HABEMN'+xmes+',0)- COALESCE(A.DEBEMN'+XMES+',0)) END '
                     +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.HABEMN'+XMES+',0) END,''3'',0,0 '
                     +' FROM CNT401 A, CNT104 C,'
                     +' (SELECT A.CIAID,A.CUENTAID,B.CTADES,C.REIDEPRE,C.CTADEPAC '
                     +' FROM CNT401 A,TGE202 B ,ACF110 C '
                     +' WHERE A.CIAID=B.CIAID AND B.CUENTAID=C.CUENTAID AND '
                     +' A.CUENTAID=B.CUENTAID '
//                     +' AND B.CTA_GYP=''A'' '
                     +' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND  A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+''' AND A.SALDMN'+xmes+'>=0) B '
                     +' WHERE A.CIAID='''+dblcCIA.text+''' AND  A.CIAID=B.CIAID  AND A.ANO='''+ssAnyo+''''
                     +' AND A.CUENTAID=B.CTADEPAC '
                     +' AND C.PERIODO='''+PERIODO+XMES+''''
                     +' AND C.FACTORAJUSTE>=0) ';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

                     XSQL:='UPDATE CNT303TMP D SET VALHIST=( '
                            +' SELECT  VALHIST+(COALESCE(B.HABEMN'+XMES+',0)-COALESCE(B.DEBEMN'+XMES+',0) ) '
                     +' FROM CNT303TMP A, CNT401 B '
                     +' WHERE B.CIAID='''+dblcCIA.text+''' AND D.CIAID=A.CIAID AND A.CIAID=B.CIAID '
                     +' AND B.ANO='''+ssAnyo+'''  AND  D.CNTANO=A.CNTANO AND A.CNTANO=B.ANO '
                     +' AND A.CUENTAID=D.CUENTAID AND A.CUENTAID=B.CUENTAID '
                     +' AND A.CNTANOMM=D.CNTANOMM AND A.CNTANOMM='''+Periodo+xmes+''' '
                     +' AND A.CNTDINC=''3'' ) WHERE D.CNTANOMM='''+Periodo+xmes+''' AND D.CNTDINC=''3''' ;
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;

                  End;
                  if (SRV_D = 'ORACLE') then  //TRES
                  Begin

                    XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDINC,DEBE,HABE ) '
                     +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''' ,A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '
                     +', DECODE(C.FACTORAJUSTE,0,0,(NVL(A.DEBEMN'+xmes+',0)-NVL(A.HABEMN'+XMES+',0))+(NVL(H.DEBEMN'+XMES+',0)- NVL(H.HABEMN'+XMES+',0))) '
                     +',  DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0)+ NVL(H.HABEMN'+XMES+',0)),''1'',0,0 '
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C,  '
                     +' (SELECT  * FROM CNT401 WHERE ANO='''+ANOX+''' AND CIAID='''+dblcCIA.TEXT+''' AND TIPREG=''1'')F, '
                     +' (SELECT  * FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''' AND TIPREG=''1'')H '
                     +'  WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID  AND F.CUENTAID=A.CUENTAID  '
                     +' AND H.CUENTAID(+)=CTA_AJUSTEREI  '
                     +' AND B.CTA_TIPOREI=''T'' AND C.PERIODO='''+PERIODO+XMES
                     +''' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE>=0 AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+'''  AND A.TIPREG=''1'''

                     +' UNION ALL '
                                      //382
                     +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''' ,A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '

                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '
                     +', DECODE(C.FACTORAJUSTE,0,0,(A.DEBEMN'+xmes+'-A.HABEMN'+XMES+')) '
                     +',  DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0)),''1'''
                     +', DECODE(C.FACTORAJUSTE,0,0,DECODE(B.CTA_SALAJREI,''N'',NVL(A.DEBEMN'+XMES+',0),DECODE(B.CTA_SALAJREI,''S'',(NVL(A.DEBEMN'+XMES+',0))+(H.DEBEMN'+XMES+'-H.HABEMN'+XMES+') )))' // DECODE(B.CTA_SALAJREI,''N'',ABS(A.SALDMN12),DECODE(B.CTA_SALAJREI,''S'',ABS(A.SALDMN12+F.SALDMN12),0)) '
                     +' ,DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0))'
{                     +', DECODE(C.FACTORAJUSTE,0,0,DECODE(B.CTA_SALAJREI,''N'',NVL(A.DEBEMN'+XMES+',0),DECODE(B.CTA_SALAJREI,''S'',(NVL(A.DEBEMN'+XMES+',0))+(H.DEBEMN'+XMES+'-H.HABEMN'+XMES+') )))'
                     +' ,DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0))'}
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C,  '
                     +' (SELECT  * FROM CNT401 WHERE ANO='''+ANOX+''' AND CIAID='''+dblcCIA.TEXT+''' AND TIPREG=''1'')F, '
                     +' (SELECT  * FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''' AND TIPREG=''1'')H ,'
                     +' (SELECT A.CIAID, A.CUENTAID ,'+XVARS1+' SUMA ,max(B.CIADES) '
                     +' FROM CNT401 A, TGE101 B,TGE202 C '
                     +'  WHERE A.CIAID='''+dblcCIA.TEXT+''' AND A.ANO='''+ssAnyo+''' '
                     +' AND  A.CIAID=B.CIAID AND C.CIAID=A.CIAID AND A.CUENTAID=C.CUENTAID '
                     +' AND LENGTH(C.CTA_AJUSTEREI)>0 AND C.CTA_TIPOREI=''M'' '
//                     +' AND LENGTH(C.CTA_AJUSTEREI)>0 AND C.CTA_RSREI=''S'' '
                     +' HAVING '+ XVARS1+' >0 GROUP BY A.CIAID,A.CUENTAID  ) G '
                     +'  WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID  AND F.CUENTAID(+)=A.CUENTAID  '
                     +' AND A.CUENTAID=G.CUENTAID AND H.CUENTAID(+)=CTA_AJUSTEREI  AND B.CTA_TIPOREI=''M'' AND C.PERIODO='''+PERIODO+XMES
//                     +' AND A.CUENTAID=G.CUENTAID AND H.CUENTAID(+)=CTA_AJUSTEREI AND   B.CTA_GYP=''A'' AND B.CTA_RSREI=''S'' AND C.PERIODO='''+PERIODO+XMES
                     +''' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE>=0 AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+''' AND A.TIPREG=''1'' ' // AND A.SALDMN'+xmes+'>=0 AND A.TIPREG=''1'''

                     +' UNION ALL '

                     +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '//(A.HABEMN01- A.DEBEMN01)-ABS(F.SALDMN12)+(H.HABEMN01-H.DEBEMN01)+ABS(G.SALDMN12)
                     +', DECODE(C.FACTORAJUSTE,0,0,(A.HABEMN'+XMES+'-A.DEBEMN'+xmes+'))'
                     +', DECODE(C.FACTORAJUSTE,0,0,A.HABEMN'+XMES+') ,''2'',DECODE(C.FACTORAJUSTE,0,0,A.DEBEMN'+XMES+'),DECODE(C.FACTORAJUSTE,0,0,A.HABEMN'+XMES+')'
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C, '
                     +' (SELECT  * FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''')H '
                     + ' WHERE  A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND H.CUENTAID=CTA_AJUSTEREI '
                     +' AND C.PERIODO='''+PERIODO+XMES+''' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo
                     +''' AND B.CTA_TIPOREI=''A''  AND C.FACTORAJUSTE>=0 AND A.TIPREG=''1'''

                     +' UNION ALL ';      //VER 491

                     XSQL1:=' SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''+Glosa
                     +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '//(A.HABEMN01- A.DEBEMN01)-ABS(F.SALDMN12)+(H.HABEMN01-H.DEBEMN01)+ABS(G.SALDMN12)
                     +', DECODE(C.FACTORAJUSTE,0,0,(A.DEBEMN'+XMES+'-A.HABEMN'+xmes+'))'
                     +', DECODE(C.FACTORAJUSTE,0,0,A.DEBEMN'+XMES+') ,''2'''
                     +',DECODE(C.FACTORAJUSTE,0,0,A.HABEMN'+XMES+')'
                     +',DECODE(C.FACTORAJUSTE,0,0,A.DEBEMN'+XMES+')'
                     +' FROM CNT401 A,TGE202 B  ,CNT104 C, '
                     +' (SELECT  * FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''')H '
                     + ' WHERE  A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND H.CUENTAID(+)=CTA_AJUSTEREI '
                     +' AND C.PERIODO='''+PERIODO+XMES+''' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo
                     +'''  AND B.CTA_TIPOREI=''V''  AND C.FACTORAJUSTE>=0 AND A.TIPREG=''1'''

                     +' UNION ALL '

                     +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''', B.REIDEPRE AS  CUENTA, ''00000000'+XMES+''',B.CTADES AS CTADES, '
                     +' '''+ssAnyo+''','''+Periodo+xmes+''','
                     +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                     +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                     +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                     +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                     +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                     +''''
                     +Glosa
                     +''','+Tasa+',C.FACTORAJUSTE,A.CUENTAID '  //A.HABEMN02-A.DEBEMN02+(H.HABEMN02-H.DEBEMN02)
                     +', DECODE(C.FACTORAJUSTE,0,0,(A.HABEMN'+xmes+'- A.DEBEMN'+XMES+')+(nvl(H.HABEMN'+XMES+',0)-nvl(H.DEBEMN'+XMES+',0))) '
                     +', DECODE(C.FACTORAJUSTE,0,0,A.HABEMN'+XMES+'),''3'',0,0 '
                     +' FROM CNT401 A, CNT104 C,'
                     +' (SELECT A.CIAID,A.CUENTAID,B.CTADES,C.REIDEPRE,C.CTADEPAC '
                     +' FROM CNT401 A,TGE202 B ,ACF110 C '
                     +' WHERE A.CIAID=B.CIAID AND B.CUENTAID=C.CUENTAID AND '
                     +' A.CUENTAID=B.CUENTAID '
//                     +' AND B.CTA_GYP=''A'' '
                     +' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+''' AND A.SALDMN'+xmes+'>=0) B, '
                     +' (SELECT  *  FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''')H '
                     +' WHERE A.CIAID=B.CIAID AND B.REIDEPRE=H.CUENTAID(+)  AND B.CTADEPAC=A.CUENTAID AND '
                     +' C.PERIODO='''+PERIODO+XMES+''' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''
                     +ssAnyo+''' AND C.FACTORAJUSTE>=0) ';
                     DM1.cdscuenta5.Close;
                     DM1.cdsCuenta5.DataRequest(xSQL+XSQL1);
                     try
                     DM1.cdsCuenta5.Execute;
                     except
                     end;
                  End;
        end;
      end; //fin del for para los 12 meses

End;


procedure TFAjusteInflacion1.CalcTotales();
var sSQL : string;
begin
	sSQL := 'SELECT SUM(SALDMNAC), SUM(AJUSMNAC), SUM(DIFEMNAC), SRTIPOCTA FROM CNT404'+
               ' WHERE SRPERIODO='''+ edtPeriodo.text +''' AND CIAID='''+ dblcCia.Text +''''+
               ' GROUP BY SRTIPOCTA ORDER BY SRTIPOCTA';
	DM1.cdsQry.Close;
	DM1.cdsQry.ProviderName:='prvCNT';
	DM1.cdsQry.DataRequest(sSQL);
	DM1.cdsQry.Open;
	DM1.cdsQry.First;

   if DM1.cdsQry.fieldbyName('SRTIPOCTA').asstring = 'A' then //Activo
      begin
      edtASaldo.Text     := Format(' %15.2f',[dm1.cdsQry.Fields.Fields[0].asFloat]);
      edtAAjustado.Text  := Format(' %15.2f',[dm1.cdsQry.Fields.Fields[1].asFloat]);
      edtADiferencia.Text:= Format(' %15.2f',[dm1.cdsQry.Fields.Fields[2].asFloat]);
      end
   else
      begin //Pasivo
		edtPSaldo.Text     := Format(' %15.2f',[dm1.cdsQry.Fields.Fields[0].asFloat]);
		edtPAjustado.Text  := Format(' %15.2f',[dm1.cdsQry.Fields.Fields[1].asFloat]);
		edtPDiferencia.Text:= Format(' %15.2f',[dm1.cdsQry.Fields.Fields[2].asFloat]);
      end;
	if DM1.cdsQry.RecordCount > 1 then
		begin
		DM1.cdsQry.Next ; //'P', ya que esta ordenado alfabeticamente
		edtPSaldo.Text     := Format(' %15.2f',[dm1.cdsQry.Fields.Fields[0].asFloat]);
		edtPAjustado.Text  := Format(' %15.2f',[dm1.cdsQry.Fields.Fields[1].asFloat]);
		edtPDiferencia.Text:= Format(' %15.2f',[dm1.cdsQry.Fields.Fields[2].asFloat]);
		end;
end;

//------------------------------------------------------------------------
// Nombre....: evento Click de bbtnElimina
// Parametros: sender
// Objetivo..: Elimina un calculo ya definido, si el comprobante REI calculado ya esta contabilizado hay que descargar
//             primero de la contabilidad - Descontabiliza-
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion1.bbtnEliminaClick(Sender: TObject);
var sSQL : string;
begin
   if MessageDlg(' ¿Esta seguro de Eliminar? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      exit;

   sSQL := 'SELECT CNTCUADRE, CNTESTADO FROM CNT300 WHERE CNTCOMPROB=''' + edtComprobante.text +'''';
	DM1.cdsQry.Close;
	DM1.cdsQry.ProviderName:='prvCNT';
	DM1.cdsQry.DataRequest(sSQL);
	DM1.cdsQry.Open;
   if (DM1.cdsQry.FieldByName('CNTCUADRE').asString = 'S') and (DM1.cdsQry.FieldByName('CNTESTADO').asString <> 'A') then
      begin
      //Descargar de la contabilidad
      Descontabiliza( dblcCia.text, dblcTDiario.text, edtPeriodo.text, edtComprobante.Text );
      end;
   sSQL := 'DELETE FROM CNT301 WHERE CNTCOMPROB=''' + edtComprobante.Text +''''; DM1.DCOM1.AppServer.EjecutaQry(sSQL);
   sSQL := 'DELETE FROM CNT300 WHERE CNTCOMPROB=''' + edtComprobante.Text +''''; DM1.DCOM1.AppServer.EjecutaQry(sSQL);
   sSQL := 'DELETE FROM CNT404 WHERE CNTCOMPROB=''' + edtComprobante.Text +''''; DM1.DCOM1.AppServer.EjecutaQry(sSQL);
   DM1.cdsREI.DisableControls;
   DM1.cdsREI.active:=false;  DM1.cdsREIActivo.active:=false;  DM1.cdsREIPasivo.active:=false;
   DM1.cdsREI.active:=true;   DM1.cdsREIActivo.active:=true;   DM1.cdsREIPasivo.active:=true;
   DM1.cdsREI.EnableControls;
   tabActivo.Caption := 'Ac&tivo';   tabPasivo.Caption := 'Pa&sivo';

   edtEstado.caption := '';
   edtComprobante.Text := '0000000000';
   dblcTDiario.text := ''; edtTDiario.text := '';
   edtPSaldo.text := '0';   edtPAjustado.text := '0';   edtPDiferencia.text := '0';
   edtASaldo.text := '0';   edtAAjustado.text := '0';   edtADiferencia.text := '0';
//   EnaDisAble('','');
   edtEstado.caption := '';
//   bbtnOK.Enabled := true;
// bbtnElimina.Enabled := false;
   dblcTDiario.SetFocus;
end;

//------------------------------------------------------------------------
// Nombre....: Evento Click de bbtnImprime
// Parametros: Sender
// Objetivo..: Imprime el comprobante del calculo del REI para una Compañia, Diario, Periodo
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion1.bbtnImprimeClick(Sender: TObject);
var sSQL : string;
begin

  DM1.cdsMovCNT1.Close;

  sSQL:= 'Select * from CNT304 WHERE '
               + 'CIAID='     +''''+ dblcCia.Text      +''''+' AND '
               + 'TDIARID='   +''''+ dblcTDiario.text  +''''+' AND '
               + 'CNTANOMM='  +''''+ edtPeriodo.text   +''''+' AND '
               + 'CNTLOTE=''AJDE''' ;
  dm1.cdsQry.close;
  dm1.cdsQry.datarequest(sSQL);
  dm1.cdsQry.open;


  if dm1.cdsQry.FieldByName('CNTESTADO').asstring='P' then
  Begin

   sSQL := 'Select * from CNT303 WHERE '
               + 'CIAID='     +''''+ dblcCia.Text      +''''+' AND '
               + 'TDIARID='   +''''+ dblcTDiario.text  +''''+' AND '
               + 'CNTANOMM='  +''''+ edtPeriodo.text   +''''+' AND '
               + 'CNTLOTE=''AJDE''' ;
  end;

  if dm1.cdsQry.FieldByName('CNTCUADRE').asstring='S' then
  Begin

   sSQL := 'Select * from CNT301 WHERE '
               + 'CIAID='     +''''+ dblcCia.Text      +''''+' AND '
               + 'TDIARID='   +''''+ dblcTDiario.text  +''''+' AND '
               + 'CNTANOMM='  +''''+ edtPeriodo.text   +''''+' AND '
               + 'CNTLOTE=''AJDE''' ;
  end;

   DM1.cdsMovCNT1.DisableControls;
//   DM1.cdsMovCNT1.Active:=true;
   DM1.cdsMovCNT1.Close;
//   DM1.cdsMovCNT1.ProviderName:='prvCabCNT';
   //TIENE CLOSE AL INICIO
//   DM1.cdsMovCNT1.ProviderName:='prvMovCNT';
   DM1.cdsMovCNT1.DataRequest(sSQL);
   DM1.cdsMovCNT1.Open;
   if DM1.cdsMovCNT1.RecordCount < 1 then
   begin
		ShowMessage('No existen registro para este calculo');
      exit;
   end;


   pprComprob.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\AjusteInflacionREI.rtm';
   pprComprob.template.LoadFromFile ;

   if DM1.cdsMOVCNT1.FieldByName('CNTCUADRE').AsString='S' then  //pplblEstado.Text:='Contabilizado'
   else begin
      if DM1.cdsMOVCNT1.FieldByName('CNTESTADO').AsString='A' then //pplblEstado.Text:='Anulado';
//      if DM1.cdsMOVCNT1.FieldByName('CNTESTADO').AsString='P' then pplblEstado.Text:='Aceptado';
//      if DM1.cdsMOVCNT1.FieldByName('CNTESTADO').AsString='I' then pplblEstado.Text:='Activo';
   end;
 //  pplblCia.Text:=edtCia.Text;

   pplblcia.text:=edtCIA.text;
   if dm1.cdsQry.FieldByName('CNTESTADO').asstring='P' then    pplblestado.text:='Aceptado';
   if dm1.cdsQry.FieldByName('CNTESTADO').asstring='C' then    pplblestado.text:='Contabilizado';
   DM1.cdsMovCNT1.EnableControls;
   pprComprob.Print;
end;

//------------------------------------------------------------------------
// Nombre....: Evento Click de bbtnAcepta
// Parametros: Sender
// Objetivo..: Este es el proceso de aceptar el comprobante, Lo que hace este proceso es va a insertar por cada
//             registro del calculo del REI insertar en la CNT301 2 registros, uno en el DEBE y otro en el HABER
//             De este modo la al realizar la contabilizacion ya tiene cuadrada sus calculos
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion1.bbtnAceptaClick(Sender: TObject);
Var
 Ssql : sTRING;
 Xreidebe , xreihabe,TOTDEBEMN,TOTHABEMN : Double;
 xrepor : string;

 begin

  	Screen.Cursor:=crHourGlass;
//   DM1.cdsMovCNT1.Close;
    dm1.cdsReporteC.Close;
    DM1.cdsReporteC.Filter := '';
    DM1.cdsReporteC.Filtered := True;
    dm1.cdsReporteC.IndexFieldNames:='';


   if MessageDlg('Desea ver Resumen Consolidado'+chr(13)+chr(13)+'  ¿ Esta Seguro ?  ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
   begin
      xrepor:='RCON';
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      Begin
      //DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)
       SSQL:='SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,MAX(A.CUENTAID) AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*'
       + 'A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END))>0 '
       + ' THEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 '
       + 'THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR'
       + '-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END))<0 THEN '
       + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END  AS CNTHABEMN '
       + ' , '' ''  AS CNTESTADO, '
       +'  DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, CURRENT DATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE  A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
       + ' GROUP BY A.TDIARID,A.CNTANO,A.CUENTAID '

       + ' UNION ALL '

       + 'SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,MAX(A.CUENTAID) AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
       + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
       + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTHABEMN '
       + ' , '' ''  AS CNTESTADO, '
       +'  DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, CURRENT DATE  AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
       + ' GROUP BY A.TDIARID,A.CNTANO,A.CUENTAID '

      End;

      if SRV_D = 'ORACLE' then
      Begin

         SSQL:='SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,MAX(A.CUENTAID) AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*'
       + ' A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
       + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*'
       + 'A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
       + ' , '' ''  AS CNTESTADO, '
       +'  TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, SYSDATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE  A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
       + ' GROUP BY A.TDIARID,A.CNTANO,A.CUENTAID '
       + ' UNION ALL '
       + 'SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,MAX(A.CUENTAID) AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*'
       + 'A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),0,(-1)*'
       + 'SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
       + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*'
       + 'A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
       + ' , '' ''  AS CNTESTADO, '
       +'  TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, SYSDATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
       + ' GROUP BY A.TDIARID,A.CNTANO,A.CUENTAID '
      End;


   end

   else
   begin
      xrepor:='XCIA';
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
                         //(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)
       SSQL:='SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
       + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END  AS CNTDEBEMN, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
       + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTHABEMN '
       + ' , '' ''  AS CNTESTADO, '
       +'  DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, CURRENT DATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
       + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '

       + ' UNION ALL '

       + 'SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
       + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
       + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTHABEMN '
       + ' , '' ''  AS CNTESTADO, '
       +'  DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, CURRENT DATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
       + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '

      end;
      if (SRV_D = 'ORACLE') then
      begin
       SSQL:='SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
       + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
       + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
       + ',0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
       + ' , '' ''  AS CNTESTADO, '
       +'  TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, SYSDATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
       + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '
       + ' UNION ALL '
       + 'SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),'
       + '0),0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
       + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),'
       + '0),0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
       + ' , '' ''  AS CNTESTADO, '
       +'  TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, SYSDATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
       + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '

      end;
   end;

   DM1.cdsReporteC.DisableControls;
   DM1.cdsReporteC.Close;
   DM1.cdsReporteC.EnableControls;
//   DM1.cdsMovCNT1.ProviderName:='prvCabCNT';
   //TIENE CLOSE AL INICIO
//   DM1.cdsMovCNT1.ProviderName:='prvMovCNT';
   DM1.cdsReporteC.DataRequest(sSQL);
   DM1.cdsReporteC.Open;
   if DM1.cdsReporteC.RecordCount < 1 then
   begin
    	Screen.Cursor:=CrDefault;
		ShowMessage('No existen registro para este calculo');
      exit;
   end;

  IF xrepor='RCON' THEN
  Begin
    if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
    begin
    //(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)
       SSQL:='SELECT SUM(CNTDEBEMN) AS CNTDEBEMN,SUM(CNTHABEMN) AS CNTHABEMN FROM '
       +' (SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,MAX(A.CUENTAID) AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END))>0 THEN '
       + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END  AS CNTDEBEMN, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END))<0 THEN '
       + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END  AS CNTHABEMN '
       + ' , '' ''  AS CNTESTADO, '
       +'  DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, CURRENT DATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE  A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
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
       + ' , '' ''  AS CNTESTADO, '
       +'  DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, CURRENT DATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
       + ' GROUP BY A.TDIARID,A.CNTANO,A.CUENTAID) M '
    End;

    if SRV_D = 'ORACLE' then
    begin
       SSQL:='SELECT SUM(CNTDEBEMN) AS CNTDEBEMN,SUM(CNTHABEMN) AS CNTHABEMN FROM '
       +' (SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,MAX(A.CUENTAID) AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
       + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
       + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
       + ',0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
       + ' , '' ''  AS CNTESTADO, '
       +'  TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, SYSDATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE  A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
       + ' GROUP BY A.TDIARID,A.CNTANO,A.CUENTAID '
       + ' UNION ALL '
       + 'SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,MAX(A.CUENTAID) AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
       + ',0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
       + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
       + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
       + ' , '' ''  AS CNTESTADO, '
       +'  TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, SYSDATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
       + ' GROUP BY A.TDIARID,A.CNTANO,A.CUENTAID) M '
    End;
  End;
  if xrepor='XCIA' then
  Begin
    if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
    Begin
       SSQL:='SELECT SUM (CNTDEBEMN) AS CNTDEBEMN, SUM(CNTHABEMN) AS CNTHABEMN FROM '
       +' (SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END))>0 THEN '
       + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END))<0 THEN '
       + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTHABEMN '
       + ' , '' ''  AS CNTESTADO, '
       +'  DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, CURRENT DATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
       + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '

       + ' UNION ALL '

       + 'SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END))<0 THEN '
       + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
       + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END))>0 THEN '
       + ' SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END  AS CNTHABEMN '
       + ' , '' ''  AS CNTESTADO, '
       +'  DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, CURRENT DATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
       + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID ) M'
    End;

    if SRV_D = 'ORACLE' then
    Begin
//DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)
       SSQL:='SELECT SUM (CNTDEBEMN) AS CNTDEBEMN, SUM(CNTHABEMN) AS CNTHABEMN FROM '
       +' (SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
       + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
       + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),'
       + '0),0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
       + ' , '' ''  AS CNTESTADO, '
       +'  TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, SYSDATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
       + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '
       + ' UNION ALL '
       + 'SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
       + ',0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
       + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),'
       + '0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
       + ' , '' ''  AS CNTESTADO, '
       +'  TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, SYSDATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
       + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID ) M'
    End;
  End;

      dm1.cdsqry.close;
      dm1.cdsqry.datarequest(sSQL);
      dm1.cdsqry.open;
   ppdbResumen.DataSource:=DM1.dsReporteC;
   pprResumen.DataPipeline:=ppdbResumen;
   pprResumen.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\ajusteresumen.rtm';
   pprResumen.template.LoadFromFile ;
   If xrepor='RCON' then
     begin
     pplblciades.caption:='CONSOLIDADO';
     pplblciac.visible:=True;
       if wrptcia='Dema' then
            pplblciac.caption:='DERRAMA MAGISTERIAL'

     end
   else
   begin
        pplblciades.caption:=dblcCIA.Text+' '+edtcia.text;
        pplblciac.visible:=False;
   end;
   //xreidebe := DM1.OperClientDataSet( DM1.cdsMovCNT1,'SUM('+'CNTDEBEMN'+')','');


   pplblctarei.caption:=edtCuentaREI.text;
   pplblreides.caption:=edtREIDescripcion.text;

   if dm1.cdsQry.FieldByName('CNTDEBEMN').asfloat>dm1.cdsQry.FieldByName('CNTHABEMN').asfloat then
   Begin
                 pplblhaberei.Visible:=True;
                 pplblhaberei.caption:=floattostr(dm1.cdsQry.FieldByName('CNTDEBEMN').asfloat-dm1.cdsQry.FieldByName('CNTHABEMN').asfloat);
                 pplblhaberei.caption:=FORMAT('%15.2f',[STRTOFLOAT(pplblhaberei.CAPTION)]);
                 pplbldeberei.visible:=False;
                 pplbldeberei.caption:='0.00';
   End;

   if dm1.cdsQry.FieldByName('CNTHABEMN').asfloat>dm1.cdsQry.FieldByName('CNTDEBEMN').asfloat then
   Begin
                 pplbldeberei.Visible:=True;
                 pplbldeberei.caption:=floattostr(dm1.cdsQry.FieldByName('CNTHABEMN').asfloat-dm1.cdsQry.FieldByName('CNTDEBEMN').asfloat);
                 pplbldeberei.caption:=FORMAT('%15.2f',[STRTOFLOAT(pplbldeberei.CAPTION)]);
                 pplblhaberei.visible:=False;
                 pplblhaberei.caption:='0.00';

   End;

   ppLabel39.caption:=floattostr(dm1.cdsQry.FieldByName('CNTHABEMN').asfloat+strtofloat(pplblhaberei.caption));
   ppLabel39.caption:=FORMAT('%15.2f',[STRTOFLOAT(PPLABEL39.CAPTION)]);
   ppLabel40.caption:=floattostr(dm1.cdsQry.FieldByName('CNTDEBEMN').asfloat+strtofloat(pplbldeberei.caption));
   ppLabel40.caption:=FORMAT('%15.2f',[STRTOFLOAT(PPLABEL40.CAPTION)]);
   pplAno3.Caption  := COPY(edtPeriodo.Text,1,4);
   SSql := 'MESIDR='''+COPY(edtPeriodo.Text,5,2)+'''';
   pplblmesr.caption:= dm1.DisplayDescrip('PrvTGE','TGE181','MESDESL',SSql,'MESDESL'); //DM1.cdsTDiarioTDiarDes.Text;

   //FORMAT('%15.2f',[OperClientDataset(DM1.cdsAFCC, 'SUM(AFDEPREP)', '')]);

   pprResumen.PRINT;

//   ppDesigner2.SHOW;

 	Screen.Cursor:=CrDefault;


end;

//------------------------------------------------------------------------
// Nombre....: MuestraEstado
// Parametros: xMovEstado : string --> 'P':Aceptado, 'I':Activo, 'A': Anulado
//             xMovConta : string  --> 'S': Ya contabilizado
// Objetivo..: Dependiendo del estado de los parametros se visualizara un mensaje bien definido bajo un determinado
//             color, el mensaje a visualizar se mandara en edtEstado
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion1.MuestraEstado( xMovEstado, xMovConta : string ) ;
begin

   if xMovConta = 'S' then
      begin
      edtEstado.caption := 'Contabilizado';
      edtEstado.Font.Color := clBlue;
      end
   else begin
      if xMovEstado = 'P' then
         begin
         edtEstado.caption := 'Aceptado';
         edtEstado.Font.Color := clTeal;
         end;
      if xMovEstado = 'I' then
      begin
         edtEstado.caption := 'Activo';
         edtEstado.Font.Color := clAqua;
      end;
      if xMovEstado = 'A' then
         begin
         edtEstado.caption := 'Anulado';
         edtEstado.Font.Color := clRed;
         end;
   end;
end;


//------------------------------------------------------------------------
// Nombre....: EnaDisAble
// Parametros: cCuadre: string --> 'S': Ya contabilizado
//             cEstado: string --> 'P':Aceptado, 'I':Activo, 'A': Anulado
// Objetivo..: Dependiendo del estado de los parametros se activara o desactivara los estado de los botones de
//             aceptacion (bbtnAcepta), eliminacion (bbtnElimina), grabacion (bbtnGraba). contabilizar (bbtnContab)
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion1.EnaDisAble(cCuadre, cEstado : string);
begin
   if ( cCuadre='S' ) or ( cEstado='A' ) or ( cEstado='P' ) then
      begin
      if cEstado='A' then
         begin
         MuestraEstado( 'A', '' );
//       bbtnElimina.Enabled:= False;
         bbtnGraba.Enabled  := False;
         bbtnAcepta.Enabled := False;
         bbtnContab.Enabled := False;
         ShowMessage(' Registro Fue ANULADO ')
      end;
      if (cEstado='P') and (cCuadre<>'S') then
         begin
         MuestraEstado('P','');
//       bbtnElimina.Enabled:= true;
         bbtnGraba.Enabled  := False;
         bbtnAcepta.Enabled := False;
         bbtnContab.Enabled := True;
         ShowMessage(' Registro Fue Aceptado ');
         end;
      if cCuadre='S' then
         begin
         MuestraEstado('','S');
//       bbtnElimina.Enabled:= true;
         bbtnGraba.Enabled  := False;
         bbtnAcepta.Enabled := False;
         bbtnContab.Enabled := False;
         ShowMessage(' Registro Fue Contabilizado ');
         end;
   end
      else begin // en caso q' no sea Contabilizado, Aceptado (P) o Anulado
              // se asume que es I=Incompleto o Activo
      MuestraEstado('I','');
//    bbtnElimina.Enabled := True;
      bbtnAcepta.Enabled  := True;
      bbtnGraba.Enabled   := True;
      end;
end;

procedure TFAjusteInflacion1.FormActivate(Sender: TObject);
var
nAnyo, nTemp, month, day  : word;
ssql,xmess : String;
begin
   FVariables.ConfiguraForma( Self );
   dm1.cdsReporte.Close;
   DM1.cdsReporte.Filter := '';
   DM1.cdsReporte.Filtered := True;
   dm1.cdsReporte.IndexFieldNames:='';

   BitBCarta.Enabled:=False;
   pnlSustento.visible:=False;
	DecodeDate ( now, nAnyo, month, day);
//	dtpFecha.DateTime := EncodeDate(nAnyo, 12, 31);
   dtpFecha.date:=date;
    speano.Text:=inttostr(nAnyo);
   xmess:=inttostr(month);
   if length(xmess)=1 then
      xmess:='0'+xmess;
   edtperiodo.text:=inttostr(nAnyo)+xmess;

//        dtpFecha.OnExit(sender);

	bbtnGraba.enabled := false;
	bbtnAcepta.enabled := true;
	bbtnContab.enabled := false;
//btnElimina.enabled := false;
   bbtnImprime.Enabled := false;

   sSQL:='SELECT A.CIAID,A.CUENTAID,A.CTADES '
      +' FROM CNT401 A '
      +' WHERE A.CIAID=''GG'' ';
//      +' AND B.CTA_GYP=''nn'' ' ;
   dm1.cdsREIActivo.Close;
   dm1.cdsREIActivo.DataRequest(sSQL);
   dm1.cdsREIActivo.open;


   sSQL:='SELECT A.CIAID,A.CUENTAID,A.CTADES '
      +' FROM CNT401 A '
      +' WHERE A.CIAID=''GG'' ';
//      +' AND B.CTA_GYP=''dd'' ';

   DM1.cdsREIPasivo.Close;
   DM1.cdsREIPasivo.DataRequest(sSQL);
   DM1.cdsREIPasivo.Open;


   dbgActivo.Selected.Clear;
   dbgActivo.Selected.Add ('CIAID'#9'3'#9'Compañia'#9'F');
   dbgActivo.Selected.Add ('CUENTAID'#9'15'#9'CuentaID'#9'F');
   dbgActivo.Selected.Add ('CTADES'#9'20'#9'Descripcion Cuenta'#9'F');
   dbgActivo.Selected.Add ('SALDO'#9'10'#9'Saldo'#9'F');
   dbgActivo.Selected.Add ('FACTOR'#9'10'#9'Saldo~Factor.'#9'F');


   dbgPasivo.Selected.Clear;
   dbgPasivo.Selected.Add ('CIAID'#9'3'#9'Compañia'#9'F');
   dbgPasivo.Selected.Add ('CUENTAID'#9'15'#9'CuentaID'#9'F');
   dbgPasivo.Selected.Add ('CTADES'#9'20'#9'Descripcion Cuenta'#9'F');
   dbgPasivo.Selected.Add ('SALDO'#9'10'#9'Saldo'#9'F');
   dbgPasivo.Selected.Add ('FACTOR'#9'10'#9'Saldo~Factor.'#9'F');


end;

//------------------------------------------------------------------------
// Nombre....: Evento Click de bbtnGraba
// Parametros: Sender
// Objetivo..: Graba el componentes del REI, se asume que ya se ha hecho el calculo, lo unico que hace este proceso es
//             cambiar el flag CNTESTADO a un valor de 'P'
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion1.bbtnGrabaClick(Sender: TObject);
var
 sSQL,xsql,xano : string;

 periodo,CNTDH , II: String;
 XREIDEBE,XREIHABE, xDif : Double;
 xCNTReg,i : Integer;
 Temp: array[1..12] of String;
 Xnumero,Xcomprobante,meses : string;
 valor : Integer;
 WHReg   : TTime;

begin

   XSQL:='select * from CNT304 WHERE CNTLOTE=''AJDE'' AND FADEFINIT=''S'' AND CIAID='''+dblcCIA.TEXT
         +''' AND CNTANOMM='''+edtperiodo.text+'''' ;
   DM1.cdsQry4.Close;
   dm1.cdsQry4.DataRequest(xsql);
   dm1.cdsQry4.Open;

   wHreg  :=Time;
   if dm1.cdsqry4.recordcount> 0 then
   Begin
      showmessage('El Asiento para el periodo ya fue registrado');
      bbtnContab.Enabled:=True;
      bbtnImprime.Enabled:=True;
      Exit;
   End;
   bbtnContab.Enabled:=False;
   bbtnImprime.Enabled:=False;


   xano:=copy(edtperiodo.text,1,4);
   xsql:='SELECT DISTINCT CNTANOMM  as  PERIODO FROM CNT303 '
         +' WHERE CNTANO='''+copy(edtperiodo.text,1,4)+''' AND CIAID='''+dblcCIA.text+'''';
   DM1.cdsQry4.Close;
   dm1.cdsQry4.DataRequest(xsql);
   dm1.cdsQry4.Open;

   if MessageDlg('Generar Ajuste Definitivo'+chr(13)+chr(13)+'  ¿ Esta Seguro ?  ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
   Begin
      if length(copy(edtperiodo.text,5,2))=1 then

      Temp[01] := 'Enero';
      Temp[02] :='Febrero';
      Temp[03] := 'Marzo';
      Temp[04] :='Abril';
      Temp[05] := 'Mayo';
      Temp[06] :='Junio';
      Temp[07] := 'Julio';
      Temp[08] :='Agosto';
      Temp[09] := 'Setiembre';
      Temp[10] :='Octubre';
      Temp[11] := 'Noviembre';
      Temp[12] :='Diciembre';

      FOR I:=01 TO Strtoint(copy(edtperiodo.text,5,2)) DO
      BEGIN
          DM1.cdsQry4.IndexFieldNames:='PERIODO';
          DM1.cdsQry4.SetKey;
          IF LENGTH(INTTOSTR(I))=1 THEN
              II:='0'+INTTOSTR(I);
          DM1.cdsQry4.FieldbyName('PERIODO').AsString:=copy(edtperiodo.text,1,4)+II;
          if not DM1.cdsQry4.GotoKey then
          begin
            MESES:=MESES+temp[strtoint(II)]+',';
          end;
      END;

      dm1.cdsQry4.Close;
      DM1.cdsqry4.Filter := '';
      DM1.cdsqry4.Filtered := True;
      dm1.cdsQry4.IndexFieldNames:='';

      if length(meses)>1 then
      Begin
         ShowMessage(' Error:  Debe generar los siguientes Ajustes Mensuales para generar el Ajuste Definitivo' );
         raise exception.Create(' Faltan registrar le siguientes Ajustes Mensuales: '+meses+','+' Debe Registrar los meses indicados');
      End ;

      xsql:='DELETE FROM CNT303 '
//           +'WHERE CNTANO='''+copy(edtperiodo.text,1,4)
           +'WHERE CNTANOMM='''+edtperiodo.text
           +''' AND CNTLOTE=''AJDE''  AND CIAID='''+dblcCIA.TEXT+''' ';
      DM1.cdsQry4.Close;
      DM1.cdsQry4.datarequest(xsql);
      try
         dm1.cdsQry4.Execute;
      except
      end;


      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
          xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
          +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFecha.Date)+''')';
      end;
      if (SRV_D = 'ORACLE') then
      begin
         xSQL:='SELECT * FROM TGE114 WHERE FECHA='
           +'TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''')';
      end;
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest( xSQL );
      DM1.cdsQry.Open;

      xsql:='SELECT MAX(CNTCOMPROB) as NUMERO FROM CNT303 WHERE CNTANO='''+copy(edtperiodo.text,1,4)+''' and ciaid='''+dblcCIA.text
      +''' AND  CNTLOTE=''AJDE''';
      dm1.cdsQry2.Close;
      DM1.cdsQry2.ProviderName:='prvCNT';
      dm1.cdsQry2.DataRequest(xsql);
      try
       dm1.cdsQry2.Open;
      except
      end;


      if dm1.cdsQry2.fieldbyname('NUMERO').isnull then
         Xcomprobante:='0000000001'
      else Begin
         valor:=dm1.cdsQry2.fieldbyname('NUMERO').asinteger+1;
         xnumero:=inttostr(valor);
         XComprobante := DM1.strzero(xnumero, 10);
      End;

      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
          xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
          +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFecha.Date)+''')';
      end;
      if (SRV_D = 'ORACLE') then
      begin
         xSQL:='SELECT * FROM TGE114 WHERE FECHA='
           +'TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''')';
      end;
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest( xSQL );
      DM1.cdsQry.Open;

      //'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+'''
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      Begin
         XSQL:='INSERT INTO CNT303 (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
          +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS,CNTDH,CNTESTADO,CNTGLOSA,CNTTCAMBIO ) '
          +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,A.CUENTAID, '''+XComprobante +''' ,MAX(B.CTADES) ,A.CNTANO, '
          +' '''+edtperiodo.text+''','
          +' SUM(A.CNTDEBEMN) DEBE, '
          +' SUM(A.CNTHABEMN) HABE,'
          +' ''AJDE'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
          +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
          +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
          +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
          +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
          +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
          +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
          +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
          +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
          +' CASE WHEN SUM(A.CNTDEBEMN) >0 THEN ''D'' ELSE ''H'' END,''P'' ,'''+edtGlosa.TEXT
          +''','+edtTasa.TEXT
          +' FROM CNT303 A ,TGE202 B '
          +' WHERE A.CUENTAID<>'''+edtCuentaREI.TEXT+''' AND A.CUENTAID=B.CUENTAID AND A.CIAID=B.CIAID  AND A.CIAID='''+dblcCIA.TEXT
          +''' AND A.CNTANO='''+COPY(edtperiodo.text,1,4)+''' AND  A.FACTOR<>0 AND A.CNTANOMM<='''+edtperiodo.text
          +''' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID )';
      End;
      if (SRV_D = 'ORACLE') then
      Begin
         { aNTERIOR SQL

         XSQL:=' INSERT INTO CNT303 (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
         +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS,CNTDH,CNTESTADO,CNTGLOSA,CNTTCAMBIO ) '
         +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,A.CUENTAID, '''+XComprobante +''' ,MAX(B.CTADES) ,A.CNTANO, '
         +' '''+edtperiodo.text+''','
         +' SUM(A.CNTDEBEMN) DEBE, '
         +' SUM(A.CNTHABEMN) HABE,'
         +' ''AJDE'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
         +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
         +' DECODE(LEAST(SUM(A.CNTDEBEMN),0),0,''D'',''H''),''P'' ,'''+edtGlosa.TEXT
         +''','+edtTasa.TEXT
         +' FROM CNT303 A ,TGE202 B '
         +' WHERE A.CUENTAID<>'''+edtCuentaREI.TEXT+''' AND A.CUENTAID=B.CUENTAID AND A.CIAID=B.CIAID  AND A.CIAID='''+dblcCIA.TEXT
         +''' AND A.CNTANO='''+COPY(edtperiodo.text,1,4)+''' AND  A.FACTOR<>0 AND A.CNTANOMM<='''+edtperiodo.text
         +''' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID )';
         }
         ///////////////
       XSQL:='INSERT INTO CNT303 (CIAID, TDIARID, CUENTAID,  CNTANO, '
            +  'CNTTCAMBIO, CNTDEBEMN, CNTHABEMN, CNTDEBEME, CNTHABEME, CNTESTADO, CNTLOTE, '
            +  'CNTFCOMP, CNTGLOSA, CNTANOMM, CNTCOMPROB, CNTFREG, CTADES  ) ';

       SSQL:='SELECT '''+dblcCia.Text+''', A.TDIARID , A.CUENTAID AS CUENTAID, MAX( CNTANO ), '
         + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
         + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),'
         + '0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
         + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),'
         + '0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN, '
         + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
         + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)/MAX(A.CNTTCAMBIO) AS CNTDEBEME, '
         + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
         + ',0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)/MAX(A.CNTTCAMBIO) AS CNTHABEME '
         + ' , ''P''  AS CNTESTADO, ''AJDE'', '
         +'  TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
         + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
         +XComprobante+''' AS CNTCOMPROB, SYSDATE AS CNTFREG, MAX(C.CTADES) AS CTADES  '
         + ' FROM CNT303 A, TGE104 B, TGE202 C '
         + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+COPY(edtperiodo.text,1,4)+''''
         + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
         + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
         + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '

         + ' UNION ALL '

         + 'SELECT '''+dblcCia.Text+''', A.TDIARID AS TDIARID, A.CUENTAID AS CUENTAID, MAX( CNTANO ),'
         + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
         + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
         + ',0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
         + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
         + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN, '
         + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
         + ',0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)/MAX(A.CNTTCAMBIO) AS CNTDEBEME, '
         + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
         + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)/MAX(A.CNTTCAMBIO) AS CNTHABEME '
         + ' , ''P''  AS CNTESTADO, ''AJDE'', '
         +'  TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
         + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
         +XComprobante+''' AS CNTCOMPROB, SYSDATE AS CNTFREG, MAX(C.CTADES) AS CTADES  '
         + ' FROM CNT303 A, TGE104 B, TGE202 C '
         + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+COPY(edtperiodo.text,1,4)+''''
         + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
         + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
         + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '

         +' UNION ALL ';

       xsql2:='SELECT '''+dblcCia.Text+''', MAX(TDIARID) AS TDIARID, '''+edtCuentaREI.TEXT+''' AS CUENTAID, MAX( CNTANO ), MAX(CNTTCAMBIO) AS CNTTCAMBIO,'
         + ' DECODE(GREATEST(SUM(CNTDEBEMN)-SUM(CNTHABEMN),0),0,(-1)*(SUM(CNTDEBEMN)-SUM(CNTHABEMN)),0) AS CNTDEBEMN, '
         + ' DECODE(LEAST(SUM(CNTDEBEMN)-SUM(CNTHABEMN),0),0,SUM(CNTDEBEMN)-SUM(CNTHABEMN),0) AS CNTHABEMN, '
         + ' DECODE(GREATEST(SUM(CNTDEBEMN)-SUM(CNTHABEMN),0),0,(-1)*(SUM(CNTDEBEMN)-SUM(CNTHABEMN)),0)/MAX(CNTTCAMBIO) AS CNTDEBEME, '
         + ' DECODE(LEAST(SUM(CNTDEBEMN)-SUM(CNTHABEMN),0),0,SUM(CNTDEBEMN)-SUM(CNTHABEMN),0)/MAX(CNTTCAMBIO) AS CNTHABEME '
         + ' , ''P'' AS CNTESTADO, ''AJDE'', '
         +' TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''')  AS CNTFEMIS, '''
         + edtGlosa.text+''' AS CNTGLOSA,'''+edtPeriodo.TEXT+''' AS CNTANOMM,'''
         +XComprobante+'''AS CNTCOMPROB, SYSDATE AS CNTFREG, '''
         +edtREIDescripcion.TEXT+''' AS CTADES '
         + ' FROM '

         + '( SELECT  A.CIAID, A.TDIARID, A.CNTANO, MAX(B.TDIARDES) AS TDIARDES, '
         + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO,'
         + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),'
         + '0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
         + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
         + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
         + ' FROM CNT303 A, TGE104 B, TGE202 C  '
         + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+COPY(edtperiodo.text,1,4)+''' AND C.CIAID=A.CIAID '
         + ' AND C.CUENTAID=A.CUENTAID  AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
         + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO '

         + ' UNION ALL '

         + ' SELECT  A.CIAID,A.TDIARID,A.CNTANO,MAX(B.TDIARDES) AS TDIARDES, '
         + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO,'
         + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
         + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
         + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
         + ',0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
         + ' FROM CNT303 A, TGE104 B, TGE202 C  WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+COPY(edtperiodo.text,1,4)+''' AND C.CIAID=A.CIAID AND '
         + ' C.CUENTAID=A.CUENTAID  AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
         + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO ) B ';
             //////////////
      End;

      DM1.cdsQry4.Close;
      DM1.cdsQry4.DataRequest( xSQL+SSQL+xsql2 );
      try
         DM1.cdsQry4.Execute;
         //DM1.DCOM1.AppServer.EjecutaQry(xSQL) ;
      except
      end ;
      {
      XSQL:='SELECT SUM(CNTDEBEMN) AS DEBE ,SUM(CNTHABEMN) AS HABE FROM CNT303 WHERE CNTCOMPROB='''
            +XCOMPROBANTE+''' AND CIAID='''+dblcCIA.text+''' AND CNTANO='''+copy(edtperiodo.text,1,4)
            +''' AND  CNTLOTE=''AJDE''';
      DM1.cdscuenta5.Close;
      DM1.cdsCuenta5.DataRequest(xSQL);
      try
      DM1.cdsCuenta5.open;
      except
      end;

      if dm1.cdsCuenta5.FieldByName('DEBE').asfloat>dm1.cdsCuenta5.FieldByName('HABE').asfloat then
      Begin
         XREIHABE:=dm1.cdsCuenta5.FieldByName('DEBE').asfloat-dm1.cdsCuenta5.FieldByName('HABE').asfloat;
         XREIDEBE:=0;
         CNTDH:='H';
      end
      else
      Begin
         XREIDEBE:=dm1.cdsCuenta5.FieldByName('HABE').asfloat-dm1.cdsCuenta5.FieldByName('DEBE').asfloat;
         XREIHABE:=0;
         CNTDH:='D';
      end;


      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      Begin
         XSQL:=' INSERT INTO CNT303 (CIAID,TDIARID, CNTCOMPROB,CUENTAID,CTADES,CNTANO,CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
         +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS,CNTESTADO,CNTDH,CNTGLOSA,CNTTCAMBIO) '
         +' VALUES ('''+dblcCIA.TEXT+''','''+dblcTDiario.TEXT+''','''+XComprobante+''','''+edtCuentaREI.TEXT+''',''REI'','
         +' '''+copy(edtperiodo.text,1,4)+''','''+edtperiodo.text+''','+floattostr(XREIDEBE)+','+floattostr(XREIHABE)
         +',''AJDE'','''+dm1.wUsuario+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
         +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''',''P'','''+CNTDH+''','''+edtGlosa.Text+''','+edtTasa.text+')';
      End;

      if (SRV_D = 'ORACLE') then
      Begin
         XSQL:=' INSERT INTO CNT303 (CIAID,TDIARID, CNTCOMPROB,CUENTAID,CTADES,CNTANO,CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
         +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS,CNTESTADO,CNTDH,CNTGLOSA,CNTTCAMBIO) '
         +' VALUES ('''+dblcCIA.TEXT+''','''+dblcTDiario.TEXT+''','''+XComprobante+''','''+edtCuentaREI.TEXT+''',''REI'','
         +' '''+copy(edtperiodo.text,1,4)+''','''+edtperiodo.text+''','+floattostr(XREIDEBE)+','+floattostr(XREIHABE)
         +',''AJDE'','''+dm1.wUsuario+''',sysdate,sysdate, '
         +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''',''P'','''+CNTDH+''','''+edtGlosa.Text+''','+edtTasa.text+')';
      End;

      DM1.cdsQry3.Close;
      DM1.cdsQry3.DataRequest( xSQL );
      try
        DM1.cdsQry3.Execute;
      except
      end;

      }
      // Actualiza debe
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      Begin
         XSQL:='UPDATE CNT303 SET CNTDEBEME=CNTDEBEMN/CNTTCAMBIO,CNTHABEME=CNTHABEMN/CNTTCAMBIO,TDIARDES='''+edtTDiario.TEXT
               +''' ,CNTFEMIS=DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFecha.DATE)+'''),CNTFCOMP=DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFecha.DATE)+''') WHERE CNTANOMM='''
               +EdtPeriodo.text+''' AND CIAID='''+dblcCIA.text+''' AND TDIARID='''+dblcTDiario.TEXT
               +''' AND CNTCOMPROB='''+XComprobante+''' AND CNTLOTE=''AJDE'' ';
         DM1.cdscuenta5.Close;
         DM1.cdsCuenta5.DataRequest(xSQL);
      End;

      if (SRV_D = 'ORACLE') then
      Begin
         XSQL:='UPDATE CNT303 SET CNTMTOORI=CNTDEBEMN, CNTMTOLOC=CNTDEBEMN, CNTMTOEXT=CNTDEBEME, CNTDH=''D'', '
              +  'TMONID='''+DM1.wTMonLoc+''', TDIARDES='''+edtTDiario.TEXT+''' ,CNTFEMIS=TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',dtpFecha.DATE)+'''),CNTFCOMP=TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',dtpFecha.DATE)+''') '
              +'WHERE CNTANOMM='''+EdtPeriodo.text+''' AND CIAID='''+dblcCIA.text+''' AND TDIARID='''+dblcTDiario.TEXT+''' '
              +  'AND CNTCOMPROB='''+XComprobante+''' AND CNTLOTE=''AJDE'' and CNTDEBEMN<>0';
         DM1.cdscuenta5.Close;
         DM1.cdsCuenta5.DataRequest(xSQL);
      End;

      try
      DM1.cdsCuenta5.Execute;
      except
      end;


      // Actualiza HABER
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      Begin
         XSQL:='UPDATE CNT303 SET CNTDEBEME=CNTDEBEMN/CNTTCAMBIO,CNTHABEME=CNTHABEMN/CNTTCAMBIO,TDIARDES='''+edtTDiario.TEXT
               +''' ,CNTFEMIS=DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFecha.DATE)+'''),CNTFCOMP=DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFecha.DATE)+''') WHERE CNTANOMM='''
               +EdtPeriodo.text+''' AND CIAID='''+dblcCIA.text+''' AND TDIARID='''+dblcTDiario.TEXT
               +''' AND CNTCOMPROB='''+XComprobante+''' AND CNTLOTE=''AJDE'' ';
         DM1.cdscuenta5.Close;
         DM1.cdsCuenta5.DataRequest(xSQL);
      End;

      if (SRV_D = 'ORACLE') then
      Begin
         XSQL:='UPDATE CNT303 SET CNTMTOORI=CNTHABEMN, CNTMTOLOC=CNTHABEMN, CNTMTOEXT=CNTHABEME, CNTDH=''H'', '
              +  'TMONID='''+DM1.wTMonLoc+''', TDIARDES='''+edtTDiario.TEXT+''' ,CNTFEMIS=TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',dtpFecha.DATE)+'''),CNTFCOMP=TO_DATE('''+FORMATDATETIME('DD-MM-YYYY',dtpFecha.DATE)+''') '
               +'WHERE CNTANOMM='''+EdtPeriodo.text+''' AND CIAID='''+dblcCIA.text+''' AND TDIARID='''+dblcTDiario.TEXT
               +''' AND CNTCOMPROB='''+XComprobante+''' AND CNTLOTE=''AJDE'' and CNTHABEMN<>0';
         DM1.cdscuenta5.Close;
         DM1.cdsCuenta5.DataRequest(xSQL);
      End;

      try
      DM1.cdsCuenta5.Execute;
      except
      end;

      // cuadra cnt303

      xSQL:='SELECT sum( CNTDEBEMN ) DMN, SUM( CNTHABEMN ) HMN, '
           +  'sum( CNTDEBEME ) DME, SUM( CNTHABEME ) HME, '
           +  'sum( CASE WHEN CUENTAID='''+edtCuentaREI.Text+''' THEN CNTDEBEMN ELSE 0 END ) DMNREI, '
           +  'sum( CASE WHEN CUENTAID='''+edtCuentaREI.Text+''' THEN CNTHABEMN ELSE 0 END ) HMNREI '
           +'FROM CNT303 '
           +'Where CIAID='''     + dblcCIA.text              +''' and '
           +      'CNTANO='''    + copy(edtperiodo.text,1,4) +''' and '
           +      'CNTCOMPROB='''+ XComprobante              +''' and '
           +      'CNTLOTE=''AJDE'' ';
      DM1.cdscuenta5.Close;
      DM1.cdsCuenta5.DataRequest(xSQL);
      try
         DM1.cdsCuenta5.Open;
      except
      end;

      if DM1.cdsCuenta5.FieldByName('DMN').AsFloat<>DM1.cdsCuenta5.FieldByName('HMN').AsFloat then begin
         if DM1.cdsCuenta5.FieldByName('DMNREI').AsFloat>0 THEN begin
            xDif:=DM1.cdsCuenta5.FieldByName('HMN').AsFloat-DM1.cdsCuenta5.FieldByName('DMN').AsFloat;
            xSQL:='Update CNT303 SET CNTDEBEMN=CNTDEBEMN+('+FloatToStrf(xDif,ffFixed,8,2)+'), '
                 +   'CNTMTOORI=CNTMTOORI+('+FloatToStrf(xDif,ffFixed,8,2)+'), '
                 +   'CNTMTOLOC=CNTMTOLOC+('+FloatToStrf(xDif,ffFixed,8,2)+') '
                 +'Where CIAID='''     + dblcCIA.text              +''' and '
                 +      'CNTANO='''    + copy(edtperiodo.text,1,4) +''' and '
                 +      'CNTCOMPROB='''+ XComprobante              +''' and '
                 +      'CNTLOTE=''AJDE'' and CUENTAID='''+edtCuentaREI.Text+'''';
         end
         ELSE begin
            xDif:=DM1.cdsCuenta5.FieldByName('DMN').AsFloat-DM1.cdsCuenta5.FieldByName('HMN').AsFloat;
            xSQL:='Update CNT303 SET CNTHABEMN=CNTHABEMN+('+FloatToStrf(xDif,ffFixed,8,2)+'), '
                 +   'CNTMTOORI=CNTMTOORI+('+FloatToStrf(xDif,ffFixed,8,2)+'), '
                 +   'CNTMTOLOC=CNTMTOLOC+('+FloatToStrf(xDif,ffFixed,8,2)+') '
                 +'Where CIAID='''     + dblcCIA.text              +''' and '
                 +      'CNTANO='''    + copy(edtperiodo.text,1,4) +''' and '
                 +      'CNTCOMPROB='''+ XComprobante              +''' and '
                 +      'CNTLOTE=''AJDE'' and CUENTAID='''+edtCuentaREI.Text+'''';
         END;
         DM1.cdscuenta5.Close;
         DM1.cdsCuenta5.DataRequest(xSQL);
         try
            DM1.cdsCuenta5.Execute;
         except
         end;

      end;

      //gebnerando la cabecera del  asiento para el control
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      Begin
         XSQL:=' INSERT INTO CNT304 (CIAID,TDIARID,CNTCOMPROB,CNTGLOSA,CNTANO, '
         +' CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
         +' CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         +' FADEFINIT,FACTOR,CNTTCAMBIO,CNTESTADO) '
         +' ( SELECT CIAID,TDIARID,CNTCOMPROB,'''+edtGlosa.text+''',CNTANO, '
         +' CNTANOMM,SUM(CNTDEBEMN),SUM(CNTHABEMN),CNTLOTE,MAX(CNTUSER),CURRENT DATE '
         +','''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
         +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', ''S'','+edtfactor.Text
         +','+edtTasa.text+',''P'''
         +' FROM CNT303 WHERE CIAID='''+dblcCIA.text+''' AND TDIARID='''+dblcTDiario.text
         +''' AND CNTCOMPROB='''+XComprobante
         +'''  AND CNTANO='''+copy(edtperiodo.text,1,4)+''' AND CNTANOMM='''+edtperiodo.text
         +''' AND CNTLOTE=''AJDE'''
         +' GROUP BY CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE ) ' ;
      End;

      if (SRV_D = 'ORACLE') then
      Begin
         XSQL:=' INSERT INTO CNT304 (CIAID,TDIARID,CNTCOMPROB,CNTGLOSA,CNTANO, '
         +' CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
         +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS,FADEFINIT,FACTOR,CNTTCAMBIO,CNTESTADO) '
         +' ( SELECT CIAID,TDIARID,CNTCOMPROB,'''+edtGlosa.text+''',CNTANO, '
         +' CNTANOMM,SUM(CNTDEBEMN),SUM(CNTHABEMN),CNTLOTE,MAX(CNTUSER),MAX(CNTFREG),MAX(CNTHREG), '
         +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', ''S'','+edtfactor.Text
         +','+edtTasa.text+',''P'''
         +' FROM CNT303 WHERE CIAID='''+dblcCIA.text+''' AND TDIARID='''+dblcTDiario.text
         +''' AND CNTCOMPROB='''+XComprobante
         +'''  AND CNTANO='''+copy(edtperiodo.text,1,4)+''' AND CNTANOMM='''+edtperiodo.text
         +''' AND CNTLOTE=''AJDE'''
         +' GROUP BY CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE ) ' ;
      End;

      DM1.cdscuenta5.Close;
      DM1.cdsCuenta5.DataRequest(xSQL);
      try
      DM1.cdsCuenta5.Execute;
      except
      end;


      xSQL:='SELECT * FROM CNT303 '
        +'Where CIAID='''     + dblcCIA.text              +''' and '
        +      'CNTANO='''    + copy(edtperiodo.text,1,4) +''' and '
        +      'CNTCOMPROB='''+ XComprobante              +''' and '
        +      'CNTLOTE=''AJDE'' ';
      DM1.cdsCntCont.Close;
      DM1.cdsCntCont.DataRequest(xSQL);
      DM1.cdsCntCont.Open;

      xCNTReg:=0;

      DM1.cdsCntCont.First;
      while not DM1.cdsCntCont.Eof do begin
         DM1.cdsCntCont.Edit;
         xCNTReg:=xCNTReg+1;
         DM1.cdsCntCont.FieldByName('CNTREG').AsInteger:=xCNTReg;
         DM1.cdsCntCont.Next;
      end;
      DM1.cdsCntCont.ApplyUpdates( 0 );

      DM1.CDSQRY.CLOSE;
      xSQL:='INSERT INTO  CNT311 '
            + ' (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
            + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
            + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
            + ' CNTHABEMN,CNTHABEME,CNTREG,CNTESTADO) '

            + ' (SELECT CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
            + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
            + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
            + ' CNTHABEMN,CNTHABEME,CNTREG,CNTESTADO '
            +' FROM CNT303 '
            +' Where CIAID='''     + dblcCIA.text      +''' and '
            +      'CNTANOMM='''  + edtperiodo.text +''' and '
            +      'TDIARID='''   + dblcTDiario.Text  +''' and '
            +      'CNTCOMPROB='''+ xcomprobante      +''' and '
            +      'CNTLOTE=''AJDE'' )';
      DM1.CDSQRY.CLOSE;
      DM1.CDSQRY.DATAREQUEST(xsql);
      DM1.CDSQRY.EXECUTE;

      DM1.CDSQRY.CLOSE;


      xSQL:='SELECT * FROM CNT311 WHERE '
         +'      CIAID='''     + dblcCia.text      +''' and '
         +      'CNTANOMM='''  + edtperiodo.text +''' and '
         +      'TDIARID='''   + dblcTDiario.Text  +''' and '
         +      'CNTCOMPROB='''+ xcomprobante      +''' and '
         +      'CNTLOTE=''AJDE'' ';
      dm1.cdsCNT311.Close;
      dm1.cdsCNT311.DataRequest(xSQL);
      DM1.cdsCNT311.Open;

      if DM1.cdsCNT311.FieldByName('CNTESTADO').AsString='P' then
      begin
         if SOLConta(dblcCia.text,
                          dblcTDiario.Text,
                          edtperiodo.text,
                          XCOMPROBANTE,
                           SRV_D, 'P', DM1.wModulo, DM1.cdsCNT311, DM1.cdsNivel,
                          dm1.cdsResultSet, DM1.DCOM1, Self ) then
      end;
      bbtnContab.Enabled:=True;
      bbtnImprime.Enabled:=True;
      bbtnAjuste.eNABLED:=fALSE;
      Showmessage('Ajuste Definitivo Realizado');
   End;


end;

//------------------------------------------------------------------------
// Nombre....: Evento Click de bbtnContab
// Parametros: Sender
// Objetivo..: Realiza el proceso de contabilizacion, pero este proceso se realiza en la rutina contabiliza, despues
//             actualiza el estado de CNTCUADRE a 'S'
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion1.bbtnContabClick(Sender: TObject);
var
  sSQL, xSql, xComprobante : string;
begin
   if MessageDlg('Contabilizar Comprobante'+chr(13)+chr(13)+'     ¿ Esta Seguro ?    ', mtConfirmation, [mbYes, mbNo], 0)=mrNo then
      exit;

   sSQL:='UPDATE CNT304  SET CNTCUADRE=''S'' '
        +'WHERE CNTLOTE=''AJDE'' AND CIAID='''+dblcCIA.TEXT+''' AND CNTANOMM='''+edtperiodo.text+'''';
   DM1.cdsQry4.Close;
   DM1.cdsQry4.DataRequest(Ssql);
   try
      DM1.DCOM1.AppServer.EjecutaQry(SSQL) ;
   except
   end ;

   SSQL:='UPDATE CNT303  SET CNTCUADRE=''S'' '
        +'WHERE CNTLOTE=''INFL'' AND CIAID='''+dblcCIA.TEXT+''' AND CNTANOMM='''+edtperiodo.text+'''';
   DM1.cdsQry4.Close;
   DM1.cdsQry4.DataRequest(Ssql);
   try
      DM1.DCOM1.AppServer.EjecutaQry(SSQL) ;
   except
   end ;

   xSQL:='Select CNTCOMPROB FROM CNT303 '
        +'Where CIAID='''   + dblcCIA.text    +''' and '
        +      'CNTANOMM='''+ edtperiodo.text +''' and '
        +      'TDIARID=''' + dblcTDiario.Text+''' and '
        +      'CNTLOTE=''AJDE'' ';
   DM1.CDSQRY.CLOSE;
   DM1.CDSQRY.DATAREQUEST(xsql);
   DM1.CDSQRY.Open;


   xComprobante:=DM1.CDSQRY.FieldByName('CNTCOMPROB').AsString;

   xSQL:='DELETE FROM CNT311 WHERE '
        +'      CIAID='''     + dblcCia.text     +''' and '
        +      'CNTANOMM='''  + edtperiodo.text  +''' and '
        +      'TDIARID='''   + dblcTDiario.Text +''' and '
        +      'CNTCOMPROB='''+ xComprobante     +'''';
   dm1.cdsCNT311.Close;
   dm1.cdsCNT311.DataRequest(xSQL);
   try
   DM1.cdsCNT311.Execute;
   except
   end;

   xSQL:='INSERT INTO  CNT311 '
        + ' (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
        + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
        + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
        + ' CNTHABEMN,CNTHABEME,CNTREG,CNTESTADO) '

        + ' (SELECT CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
        + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
        + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
        + ' CNTHABEMN,CNTHABEME,CNTREG,CNTESTADO '
        +' FROM CNT303 '
        +' Where CIAID='''  + dblcCIA.text    +''' and '
        +      'CNTANOMM='''+ edtperiodo.text +''' and '
        +      'TDIARID=''' + dblcTDiario.Text+''' and '
        +      'CNTLOTE=''AJDE'' AND CNTMTOLOC<>0 )';
   DM1.CDSQRY.CLOSE;
   DM1.CDSQRY.DATAREQUEST(xsql);
   DM1.CDSQRY.EXECUTE;

   xSQL:='SELECT * FROM CNT311 WHERE '
        +'      CIAID='''     + dblcCia.text      +''' and '
        +      'CNTANOMM='''  + edtperiodo.text +''' and '
        +      'TDIARID='''   + dblcTDiario.Text  +''' and '
        +      'CNTLOTE=''AJDE'' ';
   dm1.cdsCNT311.Close;
   dm1.cdsCNT311.DataRequest(xSQL);
   DM1.cdsCNT311.Open;

   if SOLConta(dblcCia.text,
               dblcTDiario.Text,
               edtperiodo.text,
               XComprobante,
               SRV_D, 'C', DM1.wModulo, DM1.cdsCNT311, DM1.cdsNivel,
               dm1.cdsResultSet, DM1.DCOM1, Self ) then
      ShowMessage('Asiento Contabilizado');

end;

//------------------------------------------------------------------------
// Nombre....: Contabiliza
// Parametros: xCia : string
//             xTDiario: string
//             xAnoMM: string
//             xNoComp : string
// Objetivo..: Realiza el proceso de contabilizacion, llamando a GeneraEnLinea401 con signo positivo
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
function TFAjusteInflacion1.Contabiliza( xCia, xTDiario, xAnoMM, xNoComp : String ): Boolean;
begin
   GeneraEnLinea401( xCia, xTDiario, xAnoMM, xNoComp, '+' );
   Result:=True;
end;

//------------------------------------------------------------------------
// Nombre....: DesContabiliza
// Parametros: xCia : string
//             xTDiario: string
//             xAnoMM: string
//             xNoComp : string
// Objetivo..: Realiza el proceso de descontabilizacion, llamando a GeneraEnLinea401 con signo negativo
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
function TFAjusteInflacion1.DesContabiliza( xCia, xTDiario, xAnoMM, xNoComp : String ): Boolean;
begin
   GeneraEnLinea401( xCia, xTDiario, xAnoMM, xNoComp, '-' );
   Result:=True;
end;

//------------------------------------------------------------------------
// Nombre....: GeneraEmLinea401
// Parametros: xCia : string
//             xTDiario: string
//             xAnoMM: string
//             xNoComp : string
// Objetivo..: Realiza el proceso de contabilizacion en si, llamando a GeneraEnLinea401
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion1.GeneraEnLinea401( xxxCia,xxxDiario,xxxAnoMM,xxxNoComp, xxxSigno: String );
var
   xCtaPrin, xClAux, xCuenta, xAuxDes, xAno, xMes, xDH, xSQL : string;
   xMov, xAux, xCCos, xCCoDes, xCtaDes, xFLAux, xFLCCo       : String;
   xDigitos, xDigAnt : Integer;
   xImpMN, xImpME    : DOUBLE;
   nSigno : DOUBLE;
begin
   xAno := Copy(xxxAnoMM,1,4);
   xMes := Copy(xxxAnoMM,5,2);
   if xxxSigno = '+' then
      nSigno := 1
   else
      nSigno := -1;

   //PanelMsg( 'Generando Resultados',0 );

   DM1.Filtracds( DM1.cdsMovCNT1,'Select * from CNT301 WHERE '
                           + 'CIAID='     +''''+xxxCia   +''''+' AND '
                           + 'TDIARID='   +''''+xxxDiario+''''+' AND '
                           + 'CNTANOMM='  +''''+xxxAnoMM +''''+' AND '
                           + 'CNTCOMPROB='+''''+xxxNoComp+'''' );

   //PanelMsg( 'Generando Resultados', cdsMovCNT1.RecordCount+1 );

   DM1.cdsNivel.DisableControls;
   DM1.cdsMovCNT1.DisableControls;
   DM1.cdsMovCNT1.First;
   while not DM1.cdsMovCNT1.Eof do begin

      //PanelMsg( 'Generando Resultados', 0 );

      xCtaPrin:= DM1.cdsMovCNT1.FieldByName( 'CUENTAID' ).AsString;
      xDH     := DM1.cdsMovCNT1.FieldByName( 'CNTDH'    ).AsString;
      xImpMN  := DM1.cdsMovCNT1.FieldByName( 'CNTMTOLOC').AsFloat;
      xImpME  := DM1.cdsMovCNT1.FieldByName( 'CNTMTOEXT').AsFloat;
      xClAux  := DM1.cdsMovCNT1.FieldByName( 'CLAUXID'  ).AsString;
      xAux    := DM1.cdsMovCNT1.FieldByName( 'AUXID'    ).AsString;
      xAuxDes := DM1.cdsMovCNT1.FieldByName( 'AUXDES'   ).AsString;
      xCCos   := DM1.cdsMovCNT1.FieldByName( 'CCOSID'   ).AsString;
      xCCoDes := DM1.cdsMovCNT1.FieldByName( 'CCOSDES'  ).AsString;
      xDigAnt := 0;

      DM1.cdsNivel.First;
      while not DM1.cdsNivel.EOF do begin

         xDigitos := DM1.cdsNivel.FieldByName('Digitos').AsInteger;
         xCuenta  := Trim( Copy( xCtaPrin , 1, xDigitos ) );

         xSQL:='Select * from TGE202 WHERE CIAID='   +''''+xxxCia +''''+' and '
                                        + 'CUENTAID='+''''+xCuenta+'''';
         DM1.cdsQry.Close;
         DM1.cdsQry.ProviderName:= 'prvCNT';
         DM1.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
         DM1.cdsQry.Open;
         xCtaDes := '';
         xMov    := '';
         if DM1.cdsQry.RecordCount>0 then begin
            xCtaDes := DM1.cdsQry.FieldByName( 'CTAABR'  ).AsString;
            xMov    := DM1.cdsQry.FieldByName( 'CTA_MOV' ).AsString;
            xFlAux  := DM1.cdsQry.FieldByName( 'CTA_AUX' ).AsString;
            xFlCCo  := DM1.cdsQry.FieldByName( 'CTA_CCOS').AsString;
         end;

         If DM1.cdsNivel.FieldByName('Signo').AsString = '='  then
            if Length(xCuenta)=xDigitos  then  else Break;
         If DM1.cdsNivel.FieldByName('Signo').AsString = '<=' then
            if (Length(xCuenta)<=xDigitos) and (Length(xCuenta)>xDigAnt) then  else Break;
         If DM1.cdsNivel.FieldByName('Signo').Value='>=' then
            if Length(xCuenta)>=xDigitos then  else Break;

         if not CuentaExiste( xxxCia, xAno, xCuenta, '', '' ) then begin
            InsertaMov( xxxCia, xxxAnoMM, xCuenta, '', '', '', xDH, xMov,
                        xCtaDes, '', '' , xImpMN, xImpME );
            end
         else begin
            ActualizaMov( xxxCia, xxxAnoMM, xCuenta, '', '', '', xDH, xMov,
                          xCtaDes, '', '' , xImpMN, xImpME, nSigno );
         end;
         xDigAnt := DM1.cdsNivel.FieldByName('Digitos').AsInteger;
         DM1.cdsNivel.Next;
      end;

      ///////////////////////////
      //   Si Tiene Auxiliar   //
      ///////////////////////////
      if xFlAux='S' then begin
         if not CuentaExiste( xxxCia, xAno, xCuenta, xAux, '' ) then begin
            InsertaMov( xxxCia, xxxAnoMM, xCuenta, xClAux, xAux, '', xDH, xMov,
                        xCtaDes, xAuxDes, '' , xImpMN, xImpME );
            end
         else begin
            ActualizaMov( xxxCia, xxxAnoMM, xCuenta, xClAux, xAux,'',xDH, xMov,
                          xCtaDes, xAuxDes, '' , xImpMN, xImpME, nSigno );
         end;
      end;

      ///////////////////////////
      //   Si Tiene C.Costo    //
      ///////////////////////////
      if xFlCCo='S' then begin
         if not CuentaExiste( xxxCia, xAno, xCuenta, xAux, xCCos ) then begin
            InsertaMov( xxxCia,xxxAnoMM,xCuenta, xClAux, xAux, xCCos, xDH,xMov,
                        xCtaDes, xAuxDes, xCCoDes , xImpMN, xImpME );
            end
         else begin
            ActualizaMov( xxxCia,xxxAnoMM,xCuenta,xClAux,xAux, xCCos, xDH,xMov,
                          xCtaDes, xAuxDes, xCCoDes , xImpMN, xImpME, nSigno );
         end;
      end;

      DM1.cdsMovCNT1.Next;
   end;
   DM1.cdsMovCNT1.EnableControls;
//   DM1.cdsNivel.EnableControls;
end;

//------------------------------------------------------------------------
// Nombre....:
// Parametros:
// Objetivo..:
//
//
// Fecha.....:
//------------------------------------------------------------------------
function TFAjusteInflacion1.CuentaExiste( xxxxCia, xxxxAno, xxxxCuenta, xxxxAux,
                            xxxxCCos : String ) : Boolean;
var
   xSQL : String;
begin

   xSQL:='Select count(*) as Total from CNT401 WHERE CIAID='   +''''+xxxxCia   +''''+' and '
                                  + 'ANO='     +''''+xxxxAno   +''''+' and '
                                  + 'CUENTAID='+''''+xxxxCuenta+''''+' and '
                                  + 'AUXID='   +''''+xxxxAux   +''''+' and '
                                  + 'CCOSID='  +''''+xxxxCCos  +'''';
   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:= 'prvCNT';
   DM1.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
   DM1.cdsQry.Open;
   result := (dm1.cdsQry.FieldByName('Total').asInteger > 0);
end;

//------------------------------------------------------------------------
// Nombre....:
// Parametros:
// Objetivo..:
//
//
// Fecha.....:
//------------------------------------------------------------------------
procedure TFAjusteInflacion1.InsertaMov( cCia, cAnoMM, cCuenta, cClAux, cAux, cCCosto,cDH,cMov,
                           cCtaDes,cAuxDes,cCCoDes:String; nImpMN,nImpME:DOUBLE );
var
   cMes, cAno, cSQL, cMesT : String;
   nMes             : Integer;
begin
   cAno := Copy( cAnoMM,1,4 );
   cMes := Copy( cAnoMM,5,2 );

   cSQL := 'Insert into CNT401( CIAID, ANO, CUENTAID, CLAUXID, AUXID, '
         +                    ' CCOSID, CTADES, AUXDES, CCODES ';

   if cDH='D' then cSQL:=cSQL+ ', DEBEMN'+ cMes + ', DEBEME' + cMes;
   if cDH='H' then cSQL:=cSQL+ ', HABEMN'+ cMes + ', HABEME' + cMes;

   for nMes:=(StrToInt( cMes )+1) to 13 do begin
       cMesT := DM1.StrZero( IntToStr( nMes ),2);
       cSQL:=cSQL + ', SALDMN'+ cMesT;
       cSQL:=cSQL + ', SALDME'+ cMesT;
   end;
   cSQL:=cSQL+' ) ';
   cSQL:=cSQL+'Values( '+''''+cCia    +''''+', '+''''+cAno   +''''+', '
                        +''''+cCuenta +''''+', '+''''+cClAux +''''+', '
                        +''''+cAux    +''''+', '+''''+cCCosto+''''+', '
                        +''''+cCtaDes +''''+', '+''''+cAuxDes+''''+', '
                        +''''+cCCoDes +''''+', '
                        +FloatToStr( nImpMN )+', '
                        +FloatToStr( nImpME )+' ';

   for nMes:=(StrToInt( cMes )+1) to 13 do begin
       cMesT := DM1.StrZero( IntToStr( nMes ),2);
       if cDH='D' then cSQL:=cSQL+', +' else cSQL:=cSQL+', -';
       cSQL:=cSQL + FloatToStr( nImpMN )+' ';
       if cDH='D' then cSQL:=cSQL+', +' else cSQL:=cSQL+', -';
       cSQL:=cSQL + FloatToStr( nImpME )+' ';
   end;

   cSQL:=cSQL+' ) ';

   DM1.DCOM1.AppServer.EjecutaQry( cSQL );
end;


//------------------------------------------------------------------------
// Nombre....:
// Parametros:
// Objetivo..:
//
//
// Fecha.....:
//------------------------------------------------------------------------
procedure TFAjusteInflacion1.ActualizaMov( cCia,cAnoMM,cCuenta,cClAux,cAux,cCCosto,cDH, cMov,
                             cCtaDes,cAuxDes,cCCoDes:String; nImpMN,nImpME:DOUBLE; nSigno:DOUBLE );
var
   cMes, cAno, cSQL, cMesT : String;
   nMes             : Integer;
begin
   cAno := Copy( cAnoMM,1,4 );
   cMes := Copy( cAnoMM,5,2 );

   cSQL := 'Update CNT401 Set CTADES ='+''''+cCtaDes+''''+', '
                            +'AUXDES ='+''''+cAuxDes+''''+', '
                            +'CCODES ='+''''+cCCoDes+''''+', ';

   if cDH='D' then begin
      cSQL:=cSQL + '  DEBEMN'+ cMes +'='+
                   '( '+wReplacCeros+'(DEBEMN'+ cMes +',0)+'+ '('+FloatToStr( nSigno * nImpMN )+') ) ';
      cSQL:=cSQL + ', DEBEME'+ cMes+'='+
                   '( '+wReplacCeros+'(DEBEME'+ cMes +',0)+'+ '('+FloatToStr( nSigno * nImpME )+') ) ';
   end;
   if cDH='H' then begin
      cSQL:=cSQL + '  HABEMN'+ cMes +'='+
                   '( '+wReplacCeros+'(HABEMN'+ cMes +',0)+'+ '('+FloatToStr( nSigno * nImpMN )+') ) ';
      cSQL:=cSQL + ', HABEME'+ cMes +'='+
                   '( '+wReplacCeros+'(HABEME'+ cMes +',0)+'+ '('+FloatToStr( nSigno * nImpME )+') ) ';
   end;

   for nMes:=(StrToInt( cMes )+1) to 13 do begin
       cMesT := DM1.StrZero( IntToStr( nMes),2);

       cSQL:= cSQL + ', SALDMN'+ cMesT +'=';
       cSQL:= cSQL + '( '+wReplacCeros+'(SALDMN'+ cMesT +',0)';
       if cDH='D'
         then cSQL := cSQL + '+ ('
         else cSQL := cSQL + '- (' ;
       cSQL:=cSQL + FloatToStr( nSigno * nImpMN )+') ) ';

       cSQL:= cSQL + ', SALDME'+ cMesT +'=';
       cSQL:= cSQL + '( '+wReplacCeros+'(SALDME'+ cMesT +',0)';
       if cDH='D'
         then cSQL:=cSQL+'+ ('
         else cSQL:=cSQL+'- (';
       cSQL:=cSQL + FloatToStr( nSigno * nImpME )+') ) ';
   end;

   cSQL:=cSQL + 'WHERE CIAID=   '+''''+cCia    +''''+' and '
              +       'ANO=     '+''''+cAno    +''''+' and '
              +       'CUENTAID='+''''+cCuenta +''''+' and '
              +       'CLAUXID= '+''''+cClAux  +''''+' and '
              +       'AUXID=   '+''''+cAux    +''''+' and '
              +       'CCOSID=  '+''''+cCCosto +'''';

   DM1.DCOM1.AppServer.EjecutaQry( cSQL );
end;


procedure TFAjusteInflacion1.TitleGrid();
begin
   dbgActivo.Selected.Clear;
   dbgActivo.Selected.Add ('CIAID'#9'3'#9'Compañia'#9'F');
   dbgActivo.Selected.Add ('CUENTAID'#9'15'#9'CuentaID'#9'F');
   dbgActivo.Selected.Add ('CTADES'#9'20'#9'Descripcion Cuenta'#9'F');
   dbgActivo.Selected.Add ('SALDO'#9'10'#9'Saldo'#9'F');
   dbgActivo.Selected.Add ('FACTOR'#9'10'#9'Saldo~Factor.'#9'F');


   dbgPasivo.Selected.Clear;
   dbgPasivo.Selected.Add ('CIAID'#9'3'#9'Compañia'#9'F');
   dbgPasivo.Selected.Add ('CUENTAID'#9'15'#9'CuentaID'#9'F');
   dbgPasivo.Selected.Add ('CTADES'#9'20'#9'Descripcion Cuenta'#9'F');
   dbgPasivo.Selected.Add ('SALDO'#9'10'#9'Saldo'#9'F');
   dbgPasivo.Selected.Add ('FACTOR'#9'10'#9'Saldo~Factor.'#9'F');

end;


procedure TFAjusteInflacion1.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFAjusteInflacion1.bbtnMensualClick(Sender: TObject);
VAR
 Ssql,factor ,xsql2: sTRING;
begin
	Screen.Cursor:=crHourGlass;


   SSql:='PERIODO='''+edtPeriodo.Text+'''';
   factor:= dm1.DisplayDescrip('PrvTGE','CNT104','FACTORAJUSTE',SSql,'FACTORAJUSTE'); //DM1.cdsTDiarioTDiarDes.Text;
{   if factor='0' then
   begin
      showmessage('No Existen registros para la Consulta');
   	Screen.Cursor:=crDefault;
      Exit;
   end;
 }
 	Screen.Cursor:=crHourGlass;
{SSQL:='  SELECT A.CUENTAID AS CUENTAID,A.TDIARID TDIARID ,MAX(B.TDIARDES) TDIARDES '
      +'  ,MAX(CNTTCAMBIO) CNTTCAMBIO,SUM(A.CNTDEBEMN) AS CNTDEBEMN , SUM(A.CNTHABEMN) AS CNTHABEMN,'
      +' SUM(A.CNTDEBEMN)/MAX(CNTTCAMBIO) AS CNTDEBEME, '
      +'  SUM(A.CNTHABEMN)/MAX(CNTTCAMBIO) AS CNTHABEME,
      +' '' '' AS CNTESTADO, '
      +'  TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
      + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
      +edtComprobante.text+''' AS CNTCOMPROB, SYSDATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
      +' FROM CNT303 A, TGE104 B, TGE202 C '
      +' WHERE A.CIAID='''+dblcCia.Text+''' AND A.CUENTAID=C.CUENTAID AND A.CIAID=C.CIAID  AND '
      +' A.TDIARID=B.TDIARID '
      +' AND A.CNTANO='''+COPY(edtPeriodo.text,1,4)+''' AND A.FACTOR<>0 AND A.CNTANOMM<='''+edtPeriodo.text+''' '
      +' AND A.CUENTAID<>'''+edtCuentaREI.TEXT+''' '
      +' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '
 }


    If (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
    Begin
    //DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)
      SSQL:='SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAID, '
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
       +'  DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, CURRENT DATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''''
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
       +'  DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, CURRENT DATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''''
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
       + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '

       +' UNION ALL '

      + ' SELECT MAX(TDIARID) AS TDIARID,MAX(TDIARDES) AS TDIARDES,'''+edtCuentaREI.TEXT+''' AS CUENTAID, MAX(CNTTCAMBIO) AS CNTTCAMBIO,'
      + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) <0 THEN (-1)*(SUM(CNTDEBEMN)-SUM(CNTHABEMN)) ELSE 0 END AS CNTDEBEMN, '
      + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) >0 THEN SUM(CNTDEBEMN)-SUM(CNTHABEMN) ELSE 0 END AS CNTHABEMN, '
      + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) <0 THEN (-1)*(SUM(CNTDEBEMN)-SUM(CNTHABEMN)) ELSE 0 END /MAX(CNTTCAMBIO) AS CNTDEBEME, '
      + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) >0 THEN SUM(CNTDEBEMN)-SUM(CNTHABEMN) ELSE 0 END/MAX(CNTTCAMBIO) AS CNTHABEME '
      + ' , '' '' AS CNTESTADO, '
      +' DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''')  AS CNTFEMIS, '''
      + edtGlosa.text+''' AS CNTGLOSA,'''+edtPeriodo.TEXT+''' AS CNTANOMM,'''
      +edtComprobante.TEXT+'''AS CNTCOMPROB, CURRENT DATE AS CNTFREG,'' '' AS CNTREG,'''
      +edtREIDescripcion.TEXT+''' AS CTADES '
      + ' FROM (SELECT  A.CIAID,A.TDIARID,A.CNTANO,MAX(B.TDIARDES) AS TDIARDES, '
      + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO,'
      + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
      + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
      + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
      + 'SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTHABEMN '
      + ' FROM CNT303 A, TGE104 B, TGE202 C  '
      + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND C.CIAID=A.CIAID '
      + ' AND C.CUENTAID=A.CUENTAID  AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
      + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO '

      + ' UNION ALL '

      + ' SELECT  A.CIAID,A.TDIARID,A.CNTANO,MAX(B.TDIARDES) AS TDIARDES, '
      + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO,'
      + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) >0 THEN '
      + ' SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTDEBEMN, '
      + ' CASE WHEN SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) <0 THEN '
      + '(-1)*SUM((CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)*A.FACTOR-(CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END)) ELSE 0 END AS CNTHABEMN '
      + ' FROM CNT303 A, TGE104 B, TGE202 C  WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND C.CIAID=A.CIAID AND '
      + ' C.CUENTAID=A.CUENTAID  AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
      + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO ) B ';

      {      SSQL:='SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' CASE WHEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) >0 THEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) ELSE 0 END AS CNTDEBEMN, '
       + ' CASE WHEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) <0 THEN (-1)*SUM(A.VALHIST*A.FACTOR-A.VALHIST) ELSE 0 END AS CNTHABEMN, '
       + ' CASE WHEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) >0 THEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) ELSE 0 END /MAX(A.CNTTCAMBIO) AS CNTDEBEME, '
       + ' CASE WHEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) <0 THEN (-1)*SUM(A.VALHIST*A.FACTOR-A.VALHIST) ELSE 0 END/MAX(A.CNTTCAMBIO) AS CNTHABEME '
       + ' , '' ''  AS CNTESTADO, '
       +'  DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, CURRENT DATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''''
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
       + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '

       + ' UNION ALL '

       + 'SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAID, '
       + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO, '
       + ' CASE WHEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) <0 THEN (-1)*SUM(A.VALHIST*A.FACTOR-A.VALHIST) ELSE 0 END AS CNTDEBEMN, '
       + ' CASE WHEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) >0 THEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) ELSE 0 END  AS CNTHABEMN, '
       + ' CASE WHEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) <0 THEN (-1)*SUM(A.VALHIST*A.FACTOR-A.VALHIST) ELSE 0 END/MAX(A.CNTTCAMBIO) AS CNTDEBEME, '
       + ' CASE WHEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) >0 THEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) ELSE 0 END/MAX(A.CNTTCAMBIO) AS CNTHABEME '
       + ' , '' ''  AS CNTESTADO, '
       +'  DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, CURRENT DATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''''
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
       + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '

       +' UNION ALL '

      + ' SELECT MAX(TDIARID) AS TDIARID,MAX(TDIARDES) AS TDIARDES,'''+edtCuentaREI.TEXT+''' AS CUENTAID, MAX(CNTTCAMBIO) AS CNTTCAMBIO,'
      + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) <0 THEN (-1)*(SUM(CNTDEBEMN)-SUM(CNTHABEMN)) ELSE 0 END AS CNTDEBEMN, '
      + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) >0 THEN SUM(CNTDEBEMN)-SUM(CNTHABEMN) ELSE 0 END AS CNTHABEMN, '
      + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) <0 THEN (-1)*(SUM(CNTDEBEMN)-SUM(CNTHABEMN)) ELSE 0 END /MAX(CNTTCAMBIO) AS CNTDEBEME, '
      + ' CASE WHEN (SUM(CNTDEBEMN)-SUM(CNTHABEMN)) >0 THEN SUM(CNTDEBEMN)-SUM(CNTHABEMN) ELSE 0 END/MAX(CNTTCAMBIO) AS CNTHABEME '
      + ' , '' '' AS CNTESTADO, '
      +' DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''')  AS CNTFEMIS, '''
      + edtGlosa.text+''' AS CNTGLOSA,'''+edtPeriodo.TEXT+''' AS CNTANOMM,'''
      +edtComprobante.TEXT+'''AS CNTCOMPROB, CURRENT DATE AS CNTFREG,'' '' AS CNTREG,'''
      +edtREIDescripcion.TEXT+''' AS CTADES '
      + ' FROM (SELECT  A.CIAID,A.TDIARID,A.CNTANO,MAX(B.TDIARDES) AS TDIARDES, '
      + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO,'
      + ' CASE WHEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) <0 THEN (-1)*SUM(A.VALHIST*A.FACTOR-A.VALHIST) ELSE 0 END AS CNTDEBEMN, '
      + ' CASE WHEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) >0 THEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) ELSE 0 END AS CNTHABEMN '
      + ' FROM CNT303 A, TGE104 B, TGE202 C  '
      + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND C.CIAID=A.CIAID '
      + ' AND C.CUENTAID=A.CUENTAID  AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
      + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO '

      + ' UNION ALL '

      + ' SELECT  A.CIAID,A.TDIARID,A.CNTANO,MAX(B.TDIARDES) AS TDIARDES, '
      + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO,'
      + ' CASE WHEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) >0 THEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) ELSE 0 END AS CNTDEBEMN, '
      + ' CASE WHEN SUM(A.VALHIST*A.FACTOR-A.VALHIST) <0 THEN (-1)*SUM(A.VALHIST*A.FACTOR-A.VALHIST) ELSE 0 END AS CNTHABEMN '
      + ' FROM CNT303 A, TGE104 B, TGE202 C  WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND C.CIAID=A.CIAID AND '
      + ' C.CUENTAID=A.CUENTAID  AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
      + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO ) B ';
}
    End;

    If SRV_D = 'ORACLE' then
    Begin
      SSQL:='SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAID, '
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
       +'  TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, SYSDATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
       + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '
       + ' UNION ALL '

       + 'SELECT A.TDIARID AS TDIARID ,MAX(B.TDIARDES) AS TDIARDES,A.CUENTAID AS CUENTAID, '
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
       +'  TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''') AS CNTFEMIS, '''
       + edtGlosa.text+''' AS CNTGLOSA, '''+edtPeriodo.text+''' AS CNTANOMM, '''
       +edtComprobante.text+''' AS CNTCOMPROB, SYSDATE AS CNTFREG,'' '' AS CNTREG,MAX(C.CTADES) AS CTADES  '
       + ' FROM CNT303 A, TGE104 B, TGE202 C '
       + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
       + ' AND C.CIAID=A.CIAID AND C.CUENTAID=A.CUENTAID '
       + ' AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
       + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID '

       +' UNION ALL ';

      xsql2:=' SELECT MAX(TDIARID) AS TDIARID,MAX(TDIARDES) AS TDIARDES,'''+edtCuentaREI.TEXT+''' AS CUENTAID, MAX(CNTTCAMBIO) AS CNTTCAMBIO,'
      + ' DECODE(GREATEST(SUM(CNTDEBEMN)-SUM(CNTHABEMN),0),0,(-1)*(SUM(CNTDEBEMN)-SUM(CNTHABEMN)),0) AS CNTDEBEMN, '
      + ' DECODE(LEAST(SUM(CNTDEBEMN)-SUM(CNTHABEMN),0),0,SUM(CNTDEBEMN)-SUM(CNTHABEMN),0) AS CNTHABEMN, '
      + ' DECODE(GREATEST(SUM(CNTDEBEMN)-SUM(CNTHABEMN),0),0,(-1)*(SUM(CNTDEBEMN)-SUM(CNTHABEMN)),0)/MAX(CNTTCAMBIO) AS CNTDEBEME, '
      + ' DECODE(LEAST(SUM(CNTDEBEMN)-SUM(CNTHABEMN),0),0,SUM(CNTDEBEMN)-SUM(CNTHABEMN),0)/MAX(CNTTCAMBIO) AS CNTHABEME '
      + ' , '' '' AS CNTESTADO, '
      +' TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''')  AS CNTFEMIS, '''
      + edtGlosa.text+''' AS CNTGLOSA,'''+edtPeriodo.TEXT+''' AS CNTANOMM,'''
      +edtComprobante.TEXT+'''AS CNTCOMPROB, SYSDATE AS CNTFREG,'' '' AS CNTREG,'''
      +edtREIDescripcion.TEXT+''' AS CTADES '
      + ' FROM '
      + '( SELECT  A.CIAID,A.TDIARID,A.CNTANO,MAX(B.TDIARDES) AS TDIARDES, '
      + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO,'
      + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0),'
      + '0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
      + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
      + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
      + ' FROM CNT303 A, TGE104 B, TGE202 C  '
      + ' WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' '
      +   ' AND C.CIAID=A.CIAID '
      +   ' AND C.CUENTAID=A.CUENTAID  AND A.TDIARID=B.TDIARID AND A.CNTDINC IN (''2'',''3'') '
      + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO '
      + ' UNION ALL '

      + ' SELECT  A.CIAID,A.TDIARID,A.CNTANO,MAX(B.TDIARDES) AS TDIARDES, '
      + ' MAX(A.CNTTCAMBIO) AS CNTTCAMBIO,'
      + ' DECODE(LEAST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
      + ',0,SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTDEBEMN, '
      + ' DECODE(GREATEST(SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0)'
      + ',0,(-1)*SUM(DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)*A.FACTOR-DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)),0) AS CNTHABEMN '
      + ' FROM CNT303 A, TGE104 B, TGE202 C  WHERE A.CIAID='''+dblcCia.Text+''' AND A.TDIARID='''+dblcTDiario.Text+''' AND A.CNTANO='''+speAno.Text+''' AND C.CIAID=A.CIAID AND '
      + ' C.CUENTAID=A.CUENTAID  AND A.TDIARID=B.TDIARID AND A.CNTDINC=''1'' '
      + ' GROUP BY A.CIAID,A.TDIARID,A.CNTANO ) B ';
    End;


//   DM1.cdsMovCNT1.DisableControls;
//   DM1.cdsMovCNT1.Active:=true;
   DM1.cdsMovCNT1.Close;
//   DM1.cdsMovCNT1.ProviderName:='prvCabCNT';
   //TIENE CLOSE AL INICIO
   DM1.cdsMovCNT1.DataRequest(sSQL+xsql2);
   DM1.cdsMovCNT1.Open;
   if DM1.cdsMovCNT1.RecordCount < 1 then
   begin
		ShowMessage('No existen registro para este calculo');
   	Screen.Cursor:=crDefault;
      exit;
   end;

//   DM1.cdsMovCNT1.EnableControls;
   pprComprob.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\AjusteInflacionREI.rtm';
   pprComprob.template.LoadFromFile ;

   pplblcia.text:=edtCIA.text;
   if DM1.cdsMovCNT1.FieldByName('CNTESTADO').asstring='' then    pplblestado.text:='Inicial';
   if DM1.cdsMovCNT1.FieldByName('CNTESTADO').asstring='P' then    pplblestado.text:='Aceptado';
   if DM1.cdsMovCNT1.FieldByName('CNTESTADO').asstring='C' then    pplblestado.text:='Contabilizado';
   Screen.Cursor:=CrDefault;
   pprComprob.Print;

end;

procedure TFAjusteInflacion1.bbtnaceptarClick(Sender: TObject);
var
 xsql,xano : String;
 xmes1,xmes2,xmes3,xmes4,xmes5,xmes6,xmes7,xmes8,xmes9,xmes10,xmes11,xmes12:String;
 Xnumero,Xcomprobante,meses : string;
 valor : Integer;
 periodo,CNTDH , II: String;
 XREIDEBE,XREIHABE : Double;
 xCNTReg,i : Integer;
 Temp: array[1..12] of String;


begin

{   xano:=speAno.text;

   if length(speMM.text)=1 then
          speMM.text:='0'+speMM.text;


  Temp[01] := 'Enero';
  Temp[02] :='Febrero';
  Temp[03] := 'Marzo';
  Temp[04] :='Abril';
  Temp[05] := 'Mayo';
  Temp[06] :='Junio';
  Temp[07] := 'Julio';
  Temp[08] :='Agosto';
  Temp[09] := 'Setiembre';
  Temp[10] :='Octubre';
  Temp[11] := 'Noviembre';
  Temp[12] :='Diciembre';



 FOR I:=01 TO Strtoint(speMM.text) DO
 BEGIN
      DM1.cdsQry4.IndexFieldNames:='PERIODO';
      DM1.cdsQry4.SetKey;
      IF LENGTH(INTTOSTR(I))=1 THEN
          II:='0'+INTTOSTR(I);
      DM1.cdsQry4.FieldbyName('PERIODO').AsString:=speAno.TEXT+II;
      if not DM1.cdsQry4.GotoKey then
      begin
        MESES:=MESES+temp[strtoint(II)]+',';
      end;
 END;


//
   if length(meses)>1 then
       Begin
         ShowMessage(' Error:  Debe generar los siguientes Ajustes Mensuales para generar el Ajuste Definitivo' );
        raise exception.Create(' Faltan registrar le siguientes Ajustes Mensuales: '+meses+','+' Debe Registrar los meses indicados');
        pnlconta.visible:=False;
       End ;



   xsql:='DELETE FROM CNT303 WHERE CNTANO='''+speAno.Text
         +''' AND CNTANOMM='''+speAno.text+speMM.text
         +''' AND CNTLOTE=''AJDE''  AND CIAID='''+dblcCIA.TEXT+''' ';
   DM1.cdsQry4.Close;
   DM1.cdsQry4.datarequest(xsql);
   dm1.cdsQry4.Execute;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
        xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
        +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFecha.Date)+''')';
   end;
   if (SRV_D = 'ORACLE') then
   begin
       xSQL:='SELECT * FROM TGE114 WHERE FECHA='
         +'TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''')';
   end;
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest( xSQL );
   DM1.cdsQry.Open;


   xsql:='SELECT MAX(CNTCOMPROB) as NUMERO FROM CNT303 WHERE CNTANO='''+speAno.Text+''' and ciaid='''+dblcCIA.text
   +''' AND  CNTLOTE=''AJDE''';
   dm1.cdsQry2.Close;
   DM1.cdsQry2.ProviderName:='prvCNT';
   dm1.cdsQry2.DataRequest(xsql);
   dm1.cdsQry2.Open;

   if dm1.cdsQry2.fieldbyname('NUMERO').isnull then
      Xcomprobante:='0000000001'
   else
     Begin
           valor:=dm1.cdsQry2.fieldbyname('NUMERO').asinteger+1;
           xnumero:=inttostr(valor);
           XComprobante := DM1.strzero(xnumero, 10);
     End;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
        xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
        +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFecha.Date)+''')';
   end;
   if (SRV_D = 'ORACLE') then
   begin
       xSQL:='SELECT * FROM TGE114 WHERE FECHA='
         +'TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''')';
   end;
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest( xSQL );
   DM1.cdsQry.Open;

   XSQL:=' INSERT INTO CNT303 (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CNTGLOSA,CNTANO,CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
   +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS,CNTDH,CNTESTADO) '
   +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,A.CUENTAID, '''+XComprobante +''' ,MAX(B.CTADES) ,A.CNTANO, '
   +' '''+speAno.text+speMM.text+''','
   +' SUM(A.CNTDEBEMN) DEBE, '
   +' SUM(A.CNTHABEMN) HABE,'
   +' ''AJDE'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
   +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
   +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
   +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
   +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
   +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
   +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
   +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
   +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
   +' DECODE(LEAST(SUM(A.CNTDEBEMN),0),0,''D'',''H''),''P'' '
   +' FROM CNT303 A ,TGE202 B '
   +' WHERE A.CUENTAID<>'''+edtCuentaREI.TEXT+''' AND A.CUENTAID=B.CUENTAID AND A.CIAID=B.CIAID  AND A.CIAID='''+dblcCIA.TEXT
   +''' AND A.CNTANO='''+COPY(edtperiodo.text,1,4)+''' AND A.CNTANOMM<='''+speAno.TEXT+speMM.TEXT
   +''' GROUP BY A.CIAID,A.TDIARID,A.CNTANO,A.CUENTAID )';
   DM1.cdsQry4.Close;
   DM1.cdsQry4.DataRequest( xSQL );
   try
      DM1.DCOM1.AppServer.EjecutaQry(xSQL) ;
   except
   end ;

   XSQL:='SELECT SUM(CNTDEBEMN) AS DEBE ,SUM(CNTHABEMN) AS HABE FROM CNT303 WHERE CNTCOMPROB='''
         +XCOMPROBANTE+''' AND CIAID='''+dblcCIA.text+''' AND CNTANO='''+speAno.Text
         +''' AND  CNTLOTE=''AJDE''';
   DM1.cdscuenta5.Close;
   DM1.cdsCuenta5.DataRequest(xSQL);
   try
   DM1.cdsCuenta5.open;
   except
   end;

   if dm1.cdsCuenta5.FieldByName('DEBE').asfloat>dm1.cdsCuenta5.FieldByName('HABE').asfloat then
   Begin
      XREIHABE:=dm1.cdsCuenta5.FieldByName('DEBE').asfloat-dm1.cdsCuenta5.FieldByName('HABE').asfloat;
      XREIDEBE:=0;
      CNTDH:='H';
   end
   else
   Begin
      XREIDEBE:=dm1.cdsCuenta5.FieldByName('HABE').asfloat-dm1.cdsCuenta5.FieldByName('DEBE').asfloat;
      XREIHABE:=0;
      CNTDH:='D';
   end;



         XSQL:=' INSERT INTO CNT303 (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CNTGLOSA,CNTANO,CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
         +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS,CNTDH,CNTESTADO) '
         +' VALUES ('''+dblcCIA.TEXT+''','''+dblcTDiario.TEXT+''','''+edtCuentaREI.TEXT+''','''+XComprobante+''',''REI'','
         +' '''+speAno.Text+''','''+speAno.text+speMM.text+''','+floattostr(XREIDEBE)+','+floattostr(XREIHABE)+',''AJDE'','''+dm1.wUsuario+''',sysdate,sysdate, '
         +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','''+CNTDH+''',''P'')';

      DM1.cdsQry3.Close;
      DM1.cdsQry3.DataRequest( xSQL );
      try
        DM1.cdsQry3.Execute;
      except
      end;


      xSQL:='SELECT * FROM CNT303 '
        +'Where CIAID='''     + dblcCIA.text      +''' and '
        +      'CNTANO='''  + speAno.Text +''' and '
        +      'CNTCOMPROB='''+ XComprobante      +''' and '
        +      'CNTLOTE=''AJDE'' ';
      DM1.cdsCntCont.Close;
      DM1.cdsCntCont.DataRequest(xSQL);
      DM1.cdsCntCont.Open;

   xCNTReg:=0;

   DM1.cdsCntCont.First;
   while not DM1.cdsCntCont.Eof do begin
      DM1.cdsCntCont.Edit;
      xCNTReg:=xCNTReg+1;
      DM1.cdsCntCont.FieldByName('CNTREG').AsInteger:=xCNTReg;
      DM1.cdsCntCont.Next;
   end;
   DM1.cdsCntCont.ApplyUpdates( 0 );

   DM1.CDSQRY.CLOSE;
   xSQL:='INSERT INTO  CNT311 '
         + ' (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
         + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
         + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
         + ' CNTHABEMN,CNTHABEME,CNTREG,CNTESTADO) '

         + ' (SELECT CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
         + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
         + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
         + ' CNTHABEMN,CNTHABEME,CNTREG,CNTESTADO '
         +' FROM CNT303 '
         +' Where CIAID='''     + dblcCIA.text      +''' and '
         +      'CNTANOMM='''  + speAno.text+speMM.text +''' and '
         +      'TDIARID='''   + dblcTDiario.Text  +''' and '
         +      'CNTCOMPROB='''+ xcomprobante      +''' and '
         +      'CNTLOTE=''AJDE'' )';
   DM1.CDSQRY.CLOSE;
   DM1.CDSQRY.DATAREQUEST(xsql);
   DM1.CDSQRY.EXECUTE;

   DM1.CDSQRY.CLOSE;


      xSQL:='SELECT * FROM CNT311 WHERE '
         +'      CIAID='''     + dblcCia.text      +''' and '
         +      'CNTANOMM='''  + speAno.text+speMM.text +''' and '
         +      'TDIARID='''   + dblcTDiario.Text  +''' and '
         +      'CNTCOMPROB='''+ xcomprobante      +''' and '
         +      'CNTLOTE=''AJDE'' ';
   dm1.cdsCNT311.Close;
   dm1.cdsCNT311.DataRequest(xSQL);
   DM1.cdsCNT311.Open;

 {  if DM1.cdsCNT311.FieldByName('CNESTADO').AsString='S' then
   begin

      if SOLConta(dblcCia.text,
                       dblcTDiario.Text,
                       speAno.text+speMM.text,
                       XCOMPROBANTE,
                       SRV_D, 'C', DM1.wModulo, DM1.cdsCNT311, DM1.cdsNivel,
                       dm1.cdsResultSet, DM1.DCOM1, Self ) then

   end;
   }
{   if DM1.cdsCNT311.FieldByName('CNTESTADO').AsString='P' then
   begin

      if SOLConta(dblcCia.text,
                       dblcTDiario.Text,
                       speAno.text+speMM.text,
                       XCOMPROBANTE,
                        SRV_D, 'P', DM1.wModulo, DM1.cdsCNT311, DM1.cdsNivel,
                       dm1.cdsResultSet, DM1.DCOM1, Self ) then

   end;


   Showmessage('Ajuste Definitivo Realizado');
   pnlconta.visible:=False;}
end;

procedure TFAjusteInflacion1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dm1.cdsQry4.Close;
    DM1.cdsqry4.Filter := '';
    DM1.cdsqry4.Filtered := True;
    dm1.cdsQry4.IndexFieldNames:='';

    dm1.cdsQry.Close;
    DM1.cdsqrY.Filter := '';
    DM1.cdsqry.Filtered := True;
    dm1.cdsQry.IndexFieldNames:='';

    dm1.cdsQry2.Close;
    DM1.cdsqry2.Filter := '';
    DM1.cdsqry2.Filtered := True;
    dm1.cdsQry2.IndexFieldNames:='';

    dm1.cdsQry3.Close;
    DM1.cdsqry3.Filter := '';
    DM1.cdsqry3.Filtered := True;
    dm1.cdsQry3.IndexFieldNames:='';

    dm1.cdsREI.Close;
    DM1.cdsREI.Filter := '';
    DM1.cdsREI.Filtered := True;
    dm1.cdsREI.IndexFieldNames:='';


    dm1.cdsREIpasivo.Close;
    DM1.cdsREIpasivo.Filter := '';
    DM1.cdsREIpasivo.Filtered := True;
    dm1.cdsREIpasivo.IndexFieldNames:='';

    dm1.cdsREIActivo.Close;
    DM1.cdsREIActivo.Filter := '';
    DM1.cdsREIActivo.Filtered := True;
    dm1.cdsREIActivo.IndexFieldNames:='';

    dm1.cdsMOVCnt1.Close;
    DM1.cdsMOVCnt1.Filter := '';
    DM1.cdsMOVCnt1.Filtered := True;
    dm1.cdsMOVCnt1.IndexFieldNames:='';

    dm1.cdsCuenta5.Close;
    DM1.cdsCuenta5.Filter := '';
    DM1.cdsCuenta5.Filtered := True;
    dm1.cdsCuenta5.IndexFieldNames:='';

    dm1.cdsCuenta3.Close;
    DM1.cdsCuenta3.Filter := '';
    DM1.cdsCuenta3.Filtered := True;
    dm1.cdsCuenta3.IndexFieldNames:='';


    dm1.cdsReporte.Close;
    DM1.cdsReporte.Filter := '';
    DM1.cdsReporte.Filtered := True;
    dm1.cdsReporte.IndexFieldNames:='';

    dm1.cdsReporteC.Close;
    DM1.cdsReporteC.Filter := '';
    DM1.cdsReporteC.Filtered := True;
    dm1.cdsReporteC.IndexFieldNames:='';

end;

procedure TFAjusteInflacion1.BitBCartaClick(Sender: TObject);
var
  xsql,anox : String;
  ano:integer;
begin



  pnlSustento.visible:=True;

  dbgSustento.Selected.Clear;
  dbgSustento.Selected.Add ('CUENTAORI'#9'5'#9'Cuenta'#9'F');
  dbgSustento.Selected.Add ('CTADES'#9'20'#9'Descripción'#9'F');
  dbgSustento.Selected.Add ('MES'#9'13'#9'Mes'#9'F');
  dbgSustento.Selected.Add ('VALOR_HISTORICO'#9'11'#9'Valor~Histórico'#9'F');
  dbgSustento.Selected.Add ('FACTOR'#9'6'#9'Factor.'#9'F');
  dbgSustento.Selected.Add ('VALOR_AJUSTADO'#9'11'#9'Valor~Ajustado'#9'F');
  dbgSustento.Selected.Add ('DIFERENCIA'#9'9'#9'Diferencia'#9'F');
  dbgSustento.Selected.Add ('NUEVOMONTO'#9'9'#9'Nuevo~Val.Hist'#9'F');

  if length(speano.text)<4 then
  Begin
    Showmessage('Debe ingresar el Año de Ajuste');
    speano.setfocus;
  End;
	Screen.Cursor:=crHourGlass;
  ano:=strtoint(speano.text)-1;
  anox:=inttostr(ano)+'12';

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  Begin
    xsql:=' SELECT B.CIAID,A.CIADES,''SALDO INICIAL'' AS MES, '
       +' B.CTA_ORIGEN AS CUENTAORI,  C.CTADES AS CTADES,'''+speano.TEXT+'00'' AS PERIODO '
       +' ,  CASE WHEN COALESCE(B.VALHISTMOD,99)=99 THEN B.VALHIST ELSE B.VALHISTMOD END  VALOR_HISTORICO, '
       +' B.FACTOR AS FACTOR, (CASE WHEN COALESCE(B.VALHISTMOD,99)=99 THEN B.VALHIST ELSE B.VALHISTMOD END)*B.FACTOR VALOR_AJUSTADO, '
       +' (CASE WHEN (B.FACTOR<>0) AND (COALESCE(B.VALHISTMOD,99)=99) THEN  B.VALHIST ELSE B.VALHISTMOD END)*B.FACTOR-( CASE WHEN (COALESCE(B.VALHISTMOD,99)=99) THEN B.VALHIST ELSE B.VALHISTMOD END ) AS DIFERENCIA '
       +',G.MESDESL AS DESMES,B.VALHISTMOD AS NUEVOMONTO,B.CNTDINC, B.VALHIST VALHIST '
       +' FROM CNT303 B, TGE101 A, TGE202 C ,TGE181 G '
       +' WHERE B.CIAID=A.CIAID AND B.CIAID=C.CIAID  AND B.CUENTAID=C.CUENTAID AND B.CTA_ORIGEN<>'''+edtCuentaREI.text+''''
       +' AND C.CIAID='''+dblcCIA.text+''' AND B.CNTANOMM='''+concat(copy(edtperiodo.text,1,4),'00')
       +''' AND G.MESIDR='''+COPY(edtperiodo.text,5,2)+''''

        +' UNION ALL  '

       +' SELECT A.CIAID, C.CIADES CIADES, B.MESDESL MES,A.CTA_ORIGEN AS CUENTAORI,D.CTADES AS CTADES, '
       +' A.CNTANOMM  AS PERIODO '
       +' , (CASE WHEN (E.FACTORAJUSTE=0) AND (COALESCE(A.VALHISTMOD,99)=99) THEN A.VALHIST ELSE A.VALHISTMOD END)  VALOR_HISTORICO, '
       +' E.FACTORAJUSTE FACTOR , (CASE WHEN (E.FACTORAJUSTE<>0) AND (COALESCE(A.VALHISTMOD,99)=99) THEN A.VALHIST ELSE A.VALHISTMOD END )*E.FACTORAJUSTE VALOR_AJUSTADO, '
       +' (CASE WHEN (E.FACTORAJUSTE<>0) AND (E.FACTORAJUSTE<>0) AND (COALESCE(A.VALHISTMOD,99)=99) THEN A.VALHIST ELSE A.VALHISTMOD END )*E.FACTORAJUSTE-'
       +' (CASE WHEN (E.FACTORAJUSTE<>0) AND (COALESCE(A.VALHISTMOD,99)=99) THEN A.VALHIST ELSE A.VALHISTMOD END ) AS DIFERENCIA '
       +',G.MESDESL AS DESMES ,A.VALHISTMOD AS NUEVOMONTO,A.CNTDINC ,A.VALHIST VALHIST'
       + ' FROM CNT303 A ,TGE181 B,TGE101 C ,TGE202 D ,CNT104 E, TGE181 G'
       +' WHERE B.MESIDR=LTRIM(SUBSTR(CNTANOMM,5,2)) AND E.PERIODO=CNTANOMM '
       +' AND A.CNTANO='''+copy(edtperiodo.text,1,4)
       +''' AND A.CUENTAID<>'''+edtCuentaREI.text
       +''' AND A.CIAID=D.CIAID   AND A.CIAID='''+dblcCIA.Text+'''  AND A.CIAID=C.CIAID AND A.CTA_ORIGEN=D.CUENTAID  AND CNTLOTE=''INFL'''
       +'  AND G.MESIDR='''+COPY(edtperiodo.text,5,2)+''''
       +' ORDER BY CUENTAORI,PERIODO ';
  End;

  if SRV_D = 'ORACLE' then
  Begin
    xsql:=' SELECT B.CIAID,A.CIADES,''SALDO INICIAL'' AS MES, '
       +' B.CTA_ORIGEN AS CUENTAORI,  C.CTADES AS CTADES,'''+speano.TEXT+'00'' AS PERIODO '
       +' ,  DECODE(NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD)  VALOR_HISTORICO, '
       +' B.FACTOR AS FACTOR, DECODE(NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD)*B.FACTOR VALOR_AJUSTADO, '
       +' DECODE(B.FACTOR,0,0,(DECODE(NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD))*B.FACTOR-(DECODE(NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD))) AS DIFERENCIA '
       +',G.MESDESL AS DESMES,B.VALHISTMOD AS NUEVOMONTO,B.CNTDINC, B.VALHIST VALHIST '
       +' FROM CNT303 B, TGE101 A, TGE202 C ,TGE181 G '
       +' WHERE B.CIAID=A.CIAID AND B.CIAID=C.CIAID  AND B.CUENTAID=C.CUENTAID AND B.CTA_ORIGEN<>'''+edtCuentaREI.TEXT+''''
       +' AND C.CIAID='''+dblcCIA.text+''' AND B.CNTANOMM='''+concat(copy(edtperiodo.text,1,4),'00')
       +''' AND G.MESIDR='''+COPY(edtperiodo.text,5,2)+''''

        +' UNION ALL  '

       +' SELECT A.CIAID, C.CIADES CIADES, B.MESDESL MES,A.CTA_ORIGEN AS CUENTAORI,D.CTADES AS CTADES, '
       +' A.CNTANOMM  AS PERIODO '
       +' , DECODE(E.FACTORAJUSTE,0,0,DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD))  VALOR_HISTORICO, '
       +' E.FACTORAJUSTE FACTOR , DECODE(E.FACTORAJUSTE,0,0,DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD))*E.FACTORAJUSTE VALOR_AJUSTADO, '
       +' DECODE(E.FACTORAJUSTE,0,0,(DECODE(E.FACTORAJUSTE,0,0,DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)))*E.FACTORAJUSTE-(DECODE(E.FACTORAJUSTE,0,0,DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)))) AS DIFERENCIA '
       +',G.MESDESL AS DESMES ,A.VALHISTMOD AS NUEVOMONTO,A.CNTDINC ,A.VALHIST VALHIST'
       + ' FROM CNT303 A ,TGE181 B,TGE101 C ,TGE202 D ,CNT104 E, TGE181 G'
       +' WHERE B.MESIDR=TRIM(SUBSTR(CNTANOMM,5,2)) AND E.PERIODO=CNTANOMM '
       +' AND A.CNTANO='''+copy(edtperiodo.text,1,4)
       +''' AND A.CUENTAID<>'''+edtCuentaREI.text
       +''' AND A.CIAID=D.CIAID   AND A.CIAID='''+dblcCIA.Text+'''  AND A.CIAID=C.CIAID AND A.CTA_ORIGEN=D.CUENTAID  AND CNTLOTE=''INFL'''
       +'  AND G.MESIDR='''+COPY(edtperiodo.text,5,2)+''''
       +' ORDER BY CUENTAORI,PERIODO ';
  End;

  dm1.cdsReporte.Close;
  dm1.cdsReporte.DataRequest(xsql);
  dm1.cdsReporte.Open;

  TNumericField(dm1.cdsReporte.FieldByName('VALOR_HISTORICO')).DisplayFormat:= '###,###,##0.00';
  TNumericField(dm1.cdsReporte.FieldByName('VALOR_AJUSTADO')).DisplayFormat:= '###,###,##0.00';
  TNumericField(dm1.cdsReporte.FieldByName('DIFERENCIA')).DisplayFormat:= '###,###,##0.00';
  TNumericField(dm1.cdsReporte.FieldByName('NUEVOMONTO')).DisplayFormat:= '###,###,##0.00';

  pprSustento.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\Sustento.rtm';
  pprSustento.template.LoadFromFile ;
  Screen.Cursor:=CrDefault;
//  pprSustento.print;
end;

procedure TFAjusteInflacion1.bbtnAjusteClick(Sender: TObject);
VAR
   periodof, xMesIPM : String;
   xncomp1 : String;
   xval : boolean;
   xsalida :double;
   xvalhist : double ;
   xvalsalida :double;
   xvalor :double;
begin
   if dblcCia.Text='' then begin
      dblcCia.SetFocus;
      ShowMessage('Tiene que Ingresar Compañía');
      Exit;
   end;

   if dblcTDiario.Text= '' then  begin
      ShowMessage('Tiene que ingresar el Diario');
      dblcTDiario.SetFocus;
      exit
   end;

   if edtComprobante.Text= '' then  begin
      ShowMessage('Tiene que ingresar el Comprobante');
      dtpFecha.SetFocus;
      exit
   end;


   XSQL:=' SELECT DISTINCT A.CUENTAID,A.REI FROM ACF110 A, TGE202 B '
         +' WHERE A.CUENTAID=B.CUENTAID AND CTA_TIPOREI=''T'' ';
   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:='prvCNT';
   DM1.cdsQry.DataRequest(XSQL);
   DM1.cdsQry.Open;

   //** 2002/06/06 -pjsv
   if length(dm1.cdsqry.fieldbyname('REI').asstring) > 0 then
      XCUENTAREI:=dm1.cdsqry.fieldbyname('REI').asstring
   else
    Begin
      Showmessage('Falta Ingresar la Cuenta de Resultado por Exposición a la Inflación REI en el Plan de Cuentas');
      Exit;
    End;
   //**

   if MessageDlg('Generar Ajuste Anual'+chr(13)+chr(13)+'  ¿ Esta Seguro ?  ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
   else Exit;

   prbAvance.Position := 10;
   decodeDate(dtpFecha.Date, nAnyo, nMes, nDia);
   ssAnyo := inttoStr(nAnyo);
   ssDia := inttoStr(nDia); if nDia<10 then ssDia := '0'+ssDia;
   ssMes := inttoStr(nMes); if nMes<10 then ssMes := '0'+ssMes;
   Periodo:=speano.text;
   ssAnyo:=speano.text;

   ano:=strtoint(speano.text)-1;
   anox:=inttostr(ano);
   wHreg  :=Time;

   //ENCUENTRA EL PERIODO PARA GENERAR ARCHIVO DE ESPEJO DEL PERIODO A PROCESAR
   XSQL:='SELECT MAX(PERIODO) AS PERIODO FROM CNT104 where FACTORAJUSTE<>0 ORDER BY PERIODO ';
   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:='prvCNT';
   DM1.cdsQry.DataRequest(XSQL);
   DM1.CDSQRY.Open;
   periodof:=dm1.cdsqry.fieldbyname('PERIODO').ASSTRING;

   XSQL := 'DELETE FROM CNT305 WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+PERIODO+''' AND CNTLOTE=''INFL'' AND CNTANOMMAJU='''+PERIODOF+'''';
   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:='prvCNT';
   DM1.cdsQry.DataRequest(XSQL);
   try
      DM1.cdsQRY.Execute;
   except
   end;

//   GUADALUPE XSQL := 'DELETE FROM CNT303 WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+PERIODO+''' AND CNTLOTE=''INFL''';
   XSQL := 'DELETE FROM CNT303 WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+PERIODO+''' AND CNTLOTE=''INFL'' AND FACTOR=0';
   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:='prvCNT';
   DM1.cdsQry.DataRequest(XSQL);
   try
      DM1.cdsQRY.Execute;
   except
   end;

   XSQL := 'DELETE FROM CNT303 WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+PERIODO+''' AND CNTLOTE=''INFL'' AND CUENTAID='''+edtCuentaREI.TEXT+'''';
   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:='prvCNT';
   DM1.cdsQry.DataRequest(XSQL);
   try
      DM1.cdsQRY.Execute;
   except
   end;

   XSQL := 'DELETE FROM CNT303TMP WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+PERIODO+''' AND CNTLOTE=''INFL''';

   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:='prvCNT';
   DM1.cdsQry.DataRequest(XSQL);
   try
      DM1.cdsQRY.Execute;
   except
   end;

// GUADALUPE   XSQL := 'DELETE FROM CNT304 WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+PERIODO+'''AND CNTLOTE=''AJDE''';
   XSQL := 'DELETE FROM CNT304 WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+PERIODO+'''AND CNTLOTE=''INFL''';

   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:='prvCNT';
   DM1.cdsQry.DataRequest(XSQL);
   try
      DM1.cdsQRY.Execute;
   except
   end;

   XSQL := 'SELECT TCAMVPC FROM TGE107 WHERE FECHA=' +quotedstr(FormatDatetime(wFormatFecha,(dtpFecha.date)));

   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:='prvCNT';
   DM1.cdsQry.DataRequest(XSQL);
   DM1.cdsQry.Open;
   IF DM1.CDSQRY.recordcount=0 then
   Begin
     Showmessage('Debe ingresar el tipo de Cambio para el dia de hoy');
     Exit;
   End;

   TASA:=DM1.CDSQRY.FIELDBYNAME('TCAMVPC').ASSTRING;

   XSQL:='SELECT PERIODO,FACTORAJUSTE FROM CNT104 WHERE PERIODO='''+INTTOSTR(ano)+'12''' ;
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(XSQL);
   DM1.cdsQry.Open;

   xSQL:='UPDATE  CNT303 SET FACTOR='+DM1.cdsQry.fieldbyname('FACTORAJUSTE').asstring
        +' WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+speano.TEXT+''' '
        +   'AND CNTANOMM='''+speano.TEXT+'00'' AND CUENTAID<>'''+edtCuentaREI.text+'''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest( xSQL );
   try
      DM1.cdsQRY.Execute;
   except
   end;

   XSQL:=' UPDATE CNT303 SET FACTOR=(SELECT FACTORAJUSTE FROM CNT104 WHERE  CNT104.PERIODO=CNT303.CNTANOMM) '
         +' WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+speano.TEXT+''' AND CUENTAID<>'''+edtCuentaREI.TEXT
         +''' AND CNTANOMM<>'''+speano.TEXT+'00'+'''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest( xSQL );
   try
   DM1.cdsQRY.Execute;
   except
   end;

   xSQL:='SELECT MAX(PERIODO) PERIODO,MAX(SUBSTR(PERIODO,5,2))  MES FROM CNT104 WHERE FACTORAJUSTE=1 ';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest( xSQL );
   DM1.cdsQry.Open;

//   MES:=STRTOINT(DM1.CDSQRY.FIELDBYNAME('MES').ASSTRING);
   xvar:='';
   xvar1:='';
   XVARS1:='';
   F:=0;
   IF Length(DM1.CDSQRY.FIELDBYNAME('MES').ASSTRING)=0 then
   Begin
      Showmessage('Falta determinar cual es el de Ajuste');
      Exit;
   End;
   FOR F:=01 TO STRTOINT(DM1.CDSQRY.FIELDBYNAME('MES').ASSTRING) DO
   BEGIN
//     xfactor:=STRTOINT(DM1.CDSQRY.FIELDBYNAME('MES').ASSTRING);
     if length(inttostr(f))=1 then
        mes:=concat('0',inttostr(f))
     ELSE
         mes:=inttostr(f);
     XVAR:='NVL(A.DEBEMN'+mes+',0)+NVL(A.HABEMN'+mes+',0)';
     XVARS:='SUM(NVL(A.DEBEMN'+mes+',0))+ SUM(NVL(A.HABEMN'+mes+',0))';
     IF F<>STRTOINT(DM1.CDSQRY.FIELDBYNAME('MES').ASSTRING) THEN
     BEGIN
      XVAR:=XVAR+'+';
      XVARS:=XVARS+'+';
     END;
     xvar1:=xvar1+xvar;
     XVARS1:=XVARS1+XVARS;
   END;

   XSQL:='SELECT MAX(DISTINCT CNTANOMM) PERIODO  FROM CNT303 WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+speano.TEXT+''' ' ;
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest( xSQL );
   DM1.cdsQry.Open;
   If length(dm1.cdsqry.Fieldbyname('PERIODO').asstring)>0 then
      f:=strtoint(copy(dm1.cdsqry.fieldbyname('PERIODO').asstring,5,2))+1
   else
      f:=0;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
        xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
        +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFecha.Date)+''')';
   end;
   if (SRV_D = 'ORACLE') then
   begin
       xSQL:='SELECT * FROM TGE114 WHERE FECHA='
         +'TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''')';
   end;
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest( xSQL );
   DM1.cdsQry.Open;

   Glosa:='AJUSTE REALIZADO AL '+datetostr(dtpFecha.date);

   if xfactor=1 then
   BEGIN
     XSQL:='SELECT * FROM CNT303 WHERE CNTANOMM='''+speano.TEXT+'0'+INTTOSTR(XFACTOR)+'''';
     DM1.cdsQry.Close;
     DM1.cdsQry.DataRequest( xSQL );
     DM1.cdsQry.Open;
     IF  DM1.cdsqry.recordcount=0 then
         f:=0;
   END;
 	 prbAvance.Position := 20;
   //TRABAJO EN LA TABLA TEMPORAL CNT303TMP PARA JALAR LOS VALORES HISTORICOS
// antiguo        for i:=00 to   12 do
//        for i:=f to   12 do

   for i:=00 to   12 do
   Begin

      prbAvance.Position := 30;

      //FIN DE INSERCION DE VALORES HISTORICOS PARA MES DE ENERO

      prbAvance.Position := 40;

      //INSERCION DE VALORES HISTORICOS PARA MESES DE FEBRERO A DICIEMBRE

      if i>=0 then
      Begin
         xmes:=inttostr(I);

         if length(xmes)=1 then
            xmes:=concat('0',xmes);

         // vhn
         if I=0 then
            xMesIPM:=anox+'12'
         else
            xMesIPM:=Periodo+xmes;

         if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
         Begin

            XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                 +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                 +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                 +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDINC,DEBE,HABE ) '
                 +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'
                 +XMES+''' ,A.CTADES AS CTADES, '
                 +' '''+ssAnyo+''','''+Periodo+xmes+''','
                 +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE ,'''
                 +FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                 +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                 +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','
                 +''''+Glosa
                 +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '
                 +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE (COALESCE(A.DEBEMN'+xmes+',0)-COALESCE(A.HABEMN'+XMES+',0)) END '
                 +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.HABEMN'+XMES+',0) END,''1'',0,0 '
                 +' FROM CNT401 A,TGE202 B  ,CNT104 C  '
                 +'  WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID  '
                 +'  AND B.CTA_TIPOREI=''T'' AND C.PERIODO='''+PERIODO+XMES
                 +''' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE>=0 AND A.CIAID='''+dblcCIA.text
                 +''' AND A.ANO='''+ssAnyo+'''  AND A.TIPREG=''1'')';
            DM1.cdscuenta5.Close;
            DM1.cdsCuenta5.DataRequest(xSQL);
            try
            DM1.cdsCuenta5.Execute;
            except
            end;

            XSQL:='UPDATE CNT303TMP D SET VALHIST=( '
                 +' SELECT A.VALHIST+(COALESCE(B.DEBEMN'+XMES+',0)- COALESCE(B.HABEMN'+XMES+',0)) FROM CNT303TMP A, CNT401 B '
                 +' WHERE B.CIAID='''+dblcCIA.text+''' AND D.CIAID=A.CIAID '
                 +' AND B.ANO='''+ssAnyo+''' AND  D.CNTANO=A.CNTANO '
                 +' AND A.CUENTAID=D.CUENTAID AND A.CNTANOMM='''+Periodo+xmes+''' AND A.CNTANOMM=D.CNTANOMM  '
                 +' AND A.CUENTAID=B.CUENTAID AND A.CNTDINC=''1'' ), '
                 +' SALIDAS=('
                 +' SELECT A.SALIDAS+COALESCE(B.HABEMN'+XMES+',0) FROM CNT303TMP A, CNT401 B '
                 +' WHERE B.CIAID='''+dblcCIA.text+''' AND D.CIAID=A.CIAID '
                 +' AND B.ANO='''+ssAnyo+''' AND  D.CNTANO=A.CNTANO '
                 +' AND A.CUENTAID=D.CUENTAID AND A.CNTANOMM='''+Periodo+xmes+''' AND A.CNTANOMM=D.CNTANOMM  '
                 +' AND A.CUENTAID=B.CUENTAID AND A.CNTDINC=''1'' ) '
                 +' WHERE D.CNTANOMM='''+Periodo+xmes+''' AND D.CNTDINC=''1''';

            DM1.cdscuenta5.Close;
            DM1.cdsCuenta5.DataRequest(xSQL);
            try
            DM1.cdsCuenta5.Execute;
            except
            end;


            XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                 +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                 +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                 +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDINC,DEBE,HABE ) '
//                 +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDINC,DEBE,HABE,CTA_RSREI ) '
                 +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''' ,A.CTADES AS CTADES, '
                 +' '''+ssAnyo+''','''+Periodo+xmes+''','
                 +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                 +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                 +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','
                 +''''+Glosa
                 +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '
                 +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE (COALESCE(A.DEBEMN'+xmes+',0)-COALESCE(A.HABEMN'+XMES+',0)) END '
                 +',CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.HABEMN'+XMES+',0) END,''1'' '
                 +',CASE  WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.DEBEMN'+XMES+',0) END '
                 +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.HABEMN'+XMES+',0) END  '
                 +' FROM CNT401 A,TGE202 B  ,CNT104 C  '
                 +'  WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID   '
                 +'  AND B.CTA_TIPOREI=''M'' AND C.PERIODO='''+PERIODO+XMES
                 +''' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE>=0 AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+''' AND A.SALDMN'+xmes+'>=0 AND A.TIPREG=''1'')';
            DM1.cdscuenta5.Close;
            DM1.cdsCuenta5.DataRequest(xSQL);
            try
            DM1.cdsCuenta5.Execute;
            except
            end;

            XSQL:='UPDATE CNT303TMP D SET VALHIST= '
                 +' (SELECT CASE WHEN A.FACTOR=0 THEN 0 ELSE '
                 +' (CASE WHEN LENGTH(A.CTA_ORIGEN)=2 THEN '
                 +'  (CASE WHEN SUBSTR(A.CUENTAID,1,2)=SUBSTR(A.CTA_ORIGEN,1,2) THEN A.VALHIST ELSE 0 END ) '
                 +' ELSE (CASE WHEN LENGTH(A.CTA_ORIGEN)=3  THEN '
                 +' (CASE WHEN SUBSTR(A.CUENTAID,1,3)=SUBSTR(A.CTA_ORIGEN,1,3) THEN 0 '
                 +' ELSE A.VALHIST+(COALESCE(B.DEBEMN'+XMES+',0) + COALESCE(B.HABEMN'+XMES+',0)) END  ) '
                 +' ELSE A.VALHIST+(COALESCE(B.DEBEMN'+XMES+',0) +COALESCE(B.HABEMN'+XMES+',0)) END) END  ) '
                 +' END VALHIST '
                 +' FROM CNT303TMP A, CNT401 B ,TGE202 C '
                 +' WHERE B.CIAID='''+dblcCIA.text+''' AND D.CIAID=A.CIAID AND A.CIAID=B.CIAID  AND A.CIAID=C.CIAID '
                 +' AND C.CUENTAID=A.CTA_ORIGEN AND C.CTA_TIPOREI=''M'' '
//                 +' AND C.CUENTAID=A.CTA_ORIGEN AND C.CTA_RSREI=''S'' '
                 +' AND B.ANO='''+ssAnyo+''' AND  D.CNTANO=A.CNTANO '
                 +' AND A.CUENTAID=D.CUENTAID AND A.CNTANOMM='''+Periodo+xmes+'''  AND  A.CNTANOMM=D.CNTANOMM '
                 +' AND A.CUENTAID=B.CUENTAID AND A.CNTDINC=''1'') '
                 +' WHERE D.CNTANOMM='''+Periodo+xmes+''' AND D.CNTDINC=''1'' AND D.CTA_RSREI=''M''';
//                 +' WHERE D.CNTANOMM='''+Periodo+xmes+''' AND D.CNTDINC=''1'' AND D.CTA_RSREI=''S''';
            DM1.cdscuenta5.Close;
            DM1.cdsCuenta5.DataRequest(xSQL);
            try
            DM1.cdsCuenta5.Execute;
            except
            end;
                                              //571
            XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                 +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                 +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                 +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDINC,DEBE,HABE ) '

                 +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                 +' '''+ssAnyo+''','''+Periodo+xmes+''','
                 +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                 +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                 +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                 +''''+Glosa
                 +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '//(A.HABEMN01- A.DEBEMN01)-ABS(F.SALDMN12)+(H.HABEMN01-H.DEBEMN01)+ABS(G.SALDMN12)
                 +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE (COALESCE(A.HABEMN'+XMES+',0)-COALESCE(A.DEBEMN'+xmes+',0))+(COALESCE(H.HABEMN'+XMES+',0)-COALESCE(H.DEBEMN'+XMES+',0)) END'
                 +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.HABEMN'+XMES+',0) END ,''2'',0,0'
                 +' FROM CNT401 A,TGE202 B  ,CNT104 C, '
                 +' (SELECT  * FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''')H '
                 +' WHERE  A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND H.CUENTAID=CTA_AJUSTEREI '
                 +' AND C.PERIODO='''+PERIODO+XMES+''' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' '
                 +' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo
                 +''' AND B.CTA_TIPOREI=''A''  AND C.FACTORAJUSTE>=0 AND A.TIPREG=''1'')';

            DM1.cdscuenta5.Close;
            DM1.cdsCuenta5.DataRequest(xSQL);
            try
            DM1.cdsCuenta5.Execute;
            except
            end;

//CUENTA 491
            XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                 +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                 +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                 +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDINC,DEBE,HABE ) '

                 +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                 +' '''+ssAnyo+''','''+Periodo+xmes+''','
                 +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                 +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                 +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                 +''''+Glosa
                 +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '//(A.HABEMN01- A.DEBEMN01)-ABS(F.SALDMN12)+(H.HABEMN01-H.DEBEMN01)+ABS(G.SALDMN12)
                 +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE (A.DEBEMN'+XMES+'-A.HABEMN'+xmes+') END'
                 +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.DEBEMN'+XMES+',0) END ,''2'''
                 +',CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.HABEMN'+XMES+',0) END '
                 +',CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.DEBEMN'+XMES+',0) END '
                 +' FROM CNT401 A,TGE202 B  ,CNT104 C '
                 +' WHERE  A.CIAID=B.CIAID AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo
                 +''' AND A.CUENTAID=B.CUENTAID AND  A.TIPREG=''1'' '
                 +' AND C.PERIODO='''+PERIODO+XMES+''' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' '
                 +'  AND B.CTA_TIPOREI=''V''  AND C.FACTORAJUSTE>=0 )';
            DM1.cdscuenta5.Close;
            DM1.cdsCuenta5.DataRequest(xSQL);
            try
            DM1.cdsCuenta5.Execute;
            except
            end;

            XSQL:=' INSERT INTO CNT303TMP (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                 +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                 +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                 +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDINC,DEBE,HABE ) '
                 +' ( SELECT A.CIAID, '''+dblcTDiario.TEXT+''', B.REIDEPRE AS  CUENTA, ''00000000'+XMES+''',B.CTADES AS CTADES, '
                 +' '''+ssAnyo+''','''+Periodo+xmes+''','
                 +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
                 +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                 +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                 +''''
                 +Glosa
                 +''','+Tasa+',C.FACTORAJUSTE,A.CUENTAID '  //A.HABEMN02-A.DEBEMN02+(H.HABEMN02-H.DEBEMN02)
                 +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE ( COALESCE(A.HABEMN'+xmes+',0)- COALESCE(A.DEBEMN'+XMES+',0)) END '
                 +', CASE WHEN C.FACTORAJUSTE=0 THEN 0 ELSE COALESCE(A.HABEMN'+XMES+',0) END,''3'',0,0 '
                 +' FROM CNT401 A, CNT104 C,'
                 +' (SELECT A.CIAID,A.CUENTAID,B.CTADES,C.REIDEPRE,C.CTADEPAC '
                 +' FROM CNT401 A,TGE202 B ,ACF110 C '
                 +' WHERE A.CIAID=B.CIAID AND B.CUENTAID=C.CUENTAID AND '
                 +' A.CUENTAID=B.CUENTAID '
                 +' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND  A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+''' AND A.SALDMN'+xmes+'>=0) B '
                 +' WHERE A.CIAID='''+dblcCIA.text+''' AND  A.CIAID=B.CIAID  AND A.ANO='''+ssAnyo+''''
                 +' AND A.CUENTAID=B.CTADEPAC '
                 +' AND C.PERIODO='''+PERIODO+XMES+''''
                 +' AND C.FACTORAJUSTE>=0) ';
            DM1.cdscuenta5.Close;
            DM1.cdsCuenta5.DataRequest(xSQL);
            try
            DM1.cdsCuenta5.Execute;
            except
            end;

            XSQL:='UPDATE CNT303TMP D SET VALHIST=( '
                 +' SELECT  VALHIST+(COALESCE(B.HABEMN'+XMES+',0)-COALESCE(B.DEBEMN'+XMES+',0) ) '
                 +' FROM CNT303TMP A, CNT401 B '
                 +' WHERE B.CIAID='''+dblcCIA.text+''' AND D.CIAID=A.CIAID AND A.CIAID=B.CIAID '
                 +' AND B.ANO='''+ssAnyo+'''  AND  D.CNTANO=A.CNTANO AND A.CNTANO=B.ANO '
                 +' AND A.CUENTAID=D.CUENTAID AND A.CUENTAID=B.CUENTAID '
                 +' AND A.CNTANOMM=D.CNTANOMM AND A.CNTANOMM='''+Periodo+xmes+''' '
                 +' AND A.CNTDINC=''3'' ) WHERE D.CNTANOMM='''+Periodo+xmes+''' AND D.CNTDINC=''3''' ;
            DM1.cdscuenta5.Close;
            DM1.cdsCuenta5.DataRequest(xSQL);
            try
            DM1.cdsCuenta5.Execute;
            except
            end;
         End;

         if (SRV_D = 'ORACLE') then  //TRES
         Begin

            XSQL:='INSERT INTO CNT303TMP (CIAID, TDIARID, CUENTAID, CNTCOMPROB, CTADES, '
                 +  'CNTANO, CNTANOMM, CNTLOTE, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, '
                 +  'CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, CNTGLOSA, '
                 +  'CNTTCAMBIO, FACTOR, CTA_ORIGEN, VALHIST, SALIDAS, CNTDINC, DEBE, HABE ) '

                 +'( SELECT A.CIAID, '''+dblcTDiario.TEXT+''', B.CTA_AJUSTEREI AS CUENTA, '
                 +'''00000000'+XMES+''', A.CTADES AS CTADES, '''+ssAnyo+''','''+Periodo+xmes+''','
                 +' ''INFL'' AS CNTLOTE, '''+DM1.wUsuario+''', SYSDATE, SYSDATE, '
                 +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '''+DM1.cdsQry.FieldByName('FECAASS').AsString +''', '
                 +''''+Glosa+''', '+Tasa+', C.FACTORAJUSTE, B.CUENTAID, '
                 +'DECODE(C.FACTORAJUSTE,0,0,(NVL(A.DEBEMN'+xmes+',0)-NVL(A.HABEMN'+XMES+',0))+(NVL(H.DEBEMN'+XMES+',0)- NVL(H.HABEMN'+XMES+',0))), '
                 +'DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0)+ NVL(H.HABEMN'+XMES+',0)), ''1'', 0, 0 '
                 +' FROM CNT401 A, TGE202 B, CNT104 C, '
                 +' (SELECT * FROM CNT401 WHERE ANO='''+ANOX+''' AND CIAID='''+dblcCIA.TEXT+''' AND TIPREG=''1'') F, '
                 +' (SELECT * FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''' AND TIPREG=''1'') H '
                 +'  WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID  AND F.CUENTAID(+)=A.CUENTAID  '
                 +' AND H.CUENTAID(+)=CTA_AJUSTEREI  '
                 +' AND B.CTA_TIPOREI=''T'' AND C.PERIODO='''+xMesIPM
                 +''' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE>=0 AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+'''  AND A.TIPREG=''1'''
                 +' UNION ALL '
                                  //382
                 +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''' ,A.CTADES AS CTADES, '
                 +' '''+ssAnyo+''','''+Periodo+xmes+''','
                 +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                 +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '''+DM1.cdsQry.FieldByName('FECAASS').AsString+''','
                 +''''+Glosa+''', '+Tasa+', C.FACTORAJUSTE, B.CUENTAID, '

                 //VHN
                 // VALHIST
                 //+'DECODE(C.FACTORAJUSTE,0,0,(NVL(A.DEBEMN'+xmes+',0)-NVL(A.HABEMN'+XMES+',0))) '
                 +'DECODE(C.FACTORAJUSTE,0,0,(NVL(A.DEBEMN'+xmes+',0)-NVL(A.HABEMN'+XMES+',0))+ '
                 +' CASE WHEN B.CTANIV>''1'' AND '''+xmes+'''=''00'' THEN (NVL(H.DEBEMN00,0)-NVL(H.HABEMN00,0)) ELSE 0 END ), '

                 // SALIDAS
                 + 'CASE WHEN B.CTA_AJUSTEREI=''38001'' THEN '
                 + 'DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0)+NVL(H.HABEMN'+XMES+',0)) '
                 + 'ELSE DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0)) END, ''1'', '

                 // DEBE
                 //+ 'DECODE(C.FACTORAJUSTE,0,0,DECODE(B.CTA_SALAJREI,''N'',NVL(A.DEBEMN'+XMES+',0),DECODE(B.CTA_SALAJREI,''S'',(NVL(A.DEBEMN'+XMES+',0))+(NVL(H.DEBEMN'+XMES+',0)-NVL(H.HABEMN'+XMES+',0)) ))), '
                 + 'DECODE(C.FACTORAJUSTE,0,0,DECODE(B.CTA_SALAJREI,''N'',NVL(A.DEBEMN'+XMES+',0),DECODE(B.CTA_SALAJREI,''S'',(NVL(A.DEBEMN'+XMES+',0))+(NVL(H.DEBEMN'+XMES+',0)) ))), '

                 // HABE
                 + 'CASE WHEN B.CTA_AJUSTEREI=''38001'' THEN '
                 + 'DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0)+NVL(H.HABEMN'+XMES+',0))'
                 + 'ELSE DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0)) END '

                 +' FROM CNT401 A, TGE202 B, CNT104 C,  '
                 +' (SELECT  * FROM CNT401 WHERE ANO='''+ANOX+''' AND CIAID='''+dblcCIA.TEXT+''' AND TIPREG=''1'') F, '
                 +' (SELECT  * FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''' AND TIPREG=''1'') H, '
                 +' (SELECT A.CIAID, A.CUENTAID ,'+XVARS1+' SUMA ,max(B.CIADES) '
                 +' FROM CNT401 A, TGE101 B, TGE202 C '
                 +'  WHERE A.CIAID='''+dblcCIA.TEXT+''' AND A.ANO='''+ssAnyo+''' '
                 +' AND  A.CIAID=B.CIAID AND C.CIAID=A.CIAID AND A.CUENTAID=C.CUENTAID '
                 +' AND LENGTH(C.CTA_AJUSTEREI)>0 AND C.CTA_TIPOREI=''M'' '
                 +' HAVING '+ XVARS1+' >0 GROUP BY A.CIAID,A.CUENTAID  ) G '
                 +'  WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID  AND F.CUENTAID(+)=A.CUENTAID  '
                 +' AND A.CUENTAID=G.CUENTAID(+) AND H.CUENTAID(+)=CTA_AJUSTEREI  AND B.CTA_TIPOREI=''M'' AND C.PERIODO='''+xMesIPM
                 +''' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND C.FACTORAJUSTE>=0 AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+''' AND A.TIPREG=''1'' ' // AND A.SALDMN'+xmes+'>=0 AND A.TIPREG=''1'''

                 +' UNION ALL ';

           XSQL1:='SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                 +' '''+ssAnyo+''','''+Periodo+xmes+''','
                 +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                 +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                 +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                 +''''+Glosa
                 +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '//(A.HABEMN01- A.DEBEMN01)-ABS(F.SALDMN12)+(H.HABEMN01-H.DEBEMN01)+ABS(G.SALDMN12)
                 +', DECODE(C.FACTORAJUSTE,0,0, (NVL(A.HABEMN'+XMES+',0)-NVL(A.DEBEMN'+xmes+',0)) + CASE WHEN '''+xmes+'''=''00'' THEN (NVL(H.HABEMN00,0)-NVL(H.DEBEMN00,0)) ELSE 0 END )'
                 +', DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0)), ''2'', '
                 +  'DECODE(C.FACTORAJUSTE,0,0,NVL(A.DEBEMN'+XMES+',0)), '
                 +  'DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0))'
                 +' FROM CNT401 A,TGE202 B  ,CNT104 C, '
                 +' (SELECT  * FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''')H '
                 + ' WHERE  A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND H.CUENTAID=CTA_AJUSTEREI '
                 +' AND C.PERIODO='''+xMesIPM+''' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.text
                 +''' AND A.ANO='''+ssAnyo
                 +''' AND B.CTA_TIPOREI=''A''  AND C.FACTORAJUSTE>=0 AND A.TIPREG=''1'''

                 +' UNION ALL ';      //VER 491

            XSQL2:=' SELECT A.CIAID, '''+dblcTDiario.TEXT+''' ,B.CTA_AJUSTEREI AS CUENTA, ''00000000'+XMES+''',A.CTADES AS CTADES, '
                 +' '''+ssAnyo+''','''+Periodo+xmes+''','
                 +' ''INFL'' AS CNTLOTE ,'''+DM1.wUsuario+''',SYSDATE,SYSDATE, '
                 +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                 +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
                 +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
                 +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''', '
                 +''''+Glosa
                 +''','+Tasa+',C.FACTORAJUSTE ,B.CUENTAID '//(A.HABEMN01- A.DEBEMN01)-ABS(F.SALDMN12)+(H.HABEMN01-H.DEBEMN01)+ABS(G.SALDMN12)
                 +', DECODE(C.FACTORAJUSTE,0,0, NVL( NVL(A.HABEMN'+XMES+',0)-NVL(A.DEBEMN'+xmes+',0),0 ) + CASE WHEN '''+xmes+'''=''00'' THEN (NVL(H.HABEMN00,0)-NVL(H.DEBEMN00,0)) ELSE 0 END )'
                 +', DECODE(C.FACTORAJUSTE,0,0,NVL(A.DEBEMN'+XMES+',0) + CASE WHEN '''+xmes+'''=''00'' THEN NVL(H.DEBEMN00,0) ELSE 0 END ), ''2'''
                 +', DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0) + CASE WHEN '''+xmes+'''=''00'' THEN NVL(H.HABEMN00,0) ELSE 0 END ) '
                 +', DECODE(C.FACTORAJUSTE,0,0,NVL(A.DEBEMN'+XMES+',0) + CASE WHEN '''+xmes+'''=''00'' THEN NVL(H.DEBEMN00,0) ELSE 0 END ) '
                 {
                 +', DECODE(C.FACTORAJUSTE,0,0,(NVL(A.HABEMN'+XMES+',0)-NVL(A.DEBEMN'+xmes+',0)))'
                 +', DECODE(C.FACTORAJUSTE,0,0,NVL(A.DEBEMN'+XMES+',0)) ,''2'''
                 +',DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0))'
                 +',DECODE(C.FACTORAJUSTE,0,0,NVL(A.DEBEMN'+XMES+',0))'
                 }
                 +' FROM CNT401 A, TGE202 B, CNT104 C, '
                 +' (SELECT  * FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''')H '
                 + ' WHERE  A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND H.CUENTAID(+)=CTA_AJUSTEREI '
                 +' AND C.PERIODO='''+xMesIPM+''' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo
                 +'''  AND B.CTA_TIPOREI=''V''  AND C.FACTORAJUSTE>=0 AND A.TIPREG=''1'''

                 +' UNION ALL '

                 +'SELECT A.CIAID, '''+dblcTDiario.TEXT+''', B.REIDEPRE CUENTA, ''00000000'+XMES+''', '
                 +  'B.CTADES CTADES, '''+ssAnyo+''', '''+Periodo+xmes+''', ''INFL'' CNTLOTE, '
                 +  ''''+DM1.wUsuario+''', SYSDATE, SYSDATE, '
                 +  ''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
                 +  ''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
                 +  ''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
                 +  ''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '''+DM1.cdsQry.FieldByName('FECAASS').AsString +''', '
                 +  ''''+Glosa+''', '+Tasa+', C.FACTORAJUSTE, A.CUENTAID, '
                 +  'DECODE(C.FACTORAJUSTE,0,0,(NVL(A.HABEMN'+xmes+',0)- NVL(A.DEBEMN'+XMES+',0))+(nvl(H.HABEMN'+XMES+',0)-nvl(H.DEBEMN'+XMES+',0))), '
                 +  'DECODE(C.FACTORAJUSTE,0,0,NVL(A.HABEMN'+XMES+',0)), ''3'', 0, 0 '
                 +'FROM CNT401 A, CNT104 C, '
                 +  '( SELECT A.CIAID, A.CUENTAID, B.CTADES, C.REIDEPRE, C.CTADEPAC '
                 +    'FROM CNT401 A, TGE202 B, ACF110 C '
                 +    'WHERE A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+''' '
                 //+    'WHERE A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+''' AND A.SALDMN'+xmes+'>=0 '
                 +      'AND A.CIAID=B.CIAID AND B.CUENTAID=C.CUENTAID AND A.CUENTAID=B.CUENTAID '
                 +      'AND NVL(CTA_AJUSTEREI,''0'')<>''0'' ) B, '
                 +  '( SELECT * FROM CNT401 WHERE ANO='''+ssAnyo+''' AND CIAID='''+dblcCIA.TEXT+''' ) H '
                 +'WHERE A.CIAID='''+dblcCIA.text+''' AND A.ANO='''+ssAnyo+''' '
                 +  'AND A.CIAID=B.CIAID AND B.REIDEPRE=H.CUENTAID(+)  AND B.CTADEPAC=A.CUENTAID '
                 +  'AND C.PERIODO='''+xMesIPM+''' AND C.FACTORAJUSTE>=0 ) ';
            DM1.cdscuenta5.Close;
            DM1.cdsCuenta5.DataRequest(xSQL+XSQL1+XSQL2);
            try
            DM1.cdsCuenta5.Execute;
            except
            end;
         End;
      end;
   end; //fin del for para los 12 meses


   // SEGUNDA PARTE


   prbAvance.Position := 50;

   xncomp:=DM1.strzero(Inttostr(F),10);

   If f<>0 then
   Begin
      xncomp1:=DM1.strzero(Inttostr(F-1),10);

       // VHN
       {
      //      XNCOMP1:=STRTOIN(XNCOMP)
         if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
         begin
           XSQL:=' UPDATE  CNT303TMP A SET VALHIST='
                 + ' COALESCE((SELECT COALESCE(VALHIST,0)  FROM CNT303 B WHERE B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID AND '
                 + ' B.CNTCOMPROB=A.CNTCOMPROB AND B.CNTANO=A.CNTANO AND '
                 + ' B.CNTANOMM=A.CNTANOMM AND B.CUENTAID=A.CUENTAID AND    B.CTA_ORIGEN=A.CTA_ORIGEN AND'
                 + ' B.CIAID='''+dblcCIA.text+''' AND B.CNTANO='''+speano.Text
                 + ''' AND B.CUENTAID<>'''+edtCuentaREI.text+''' AND  B.FACTOR<>0   AND B.CNTLOTE=''INFL''),0) '
                 + ' WHERE A.CIAID='''+dblcCIA.text+''' AND A.CNTANO='''+speano.Text
                 +''' AND A.CNTLOTE=''INFL''  AND CNTCOMPROB<'''+XNCOMP1+'''';
         End;
        if SRV_D = 'ORACLE' then
        begin

           XSQL:=' UPDATE  CNT303TMP A SET VALHIST='
                 + ' NVL((SELECT NVL(VALHIST,0)  FROM CNT303 B WHERE B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID AND '
                 + ' B.CNTCOMPROB=A.CNTCOMPROB AND B.CNTANO=A.CNTANO AND '
                 + ' B.CNTANOMM=A.CNTANOMM AND B.CUENTAID=A.CUENTAID AND    B.CTA_ORIGEN=A.CTA_ORIGEN AND'
                 + ' B.CIAID='''+dblcCIA.text+''' AND B.CNTANO='''+speano.Text
                 + ''' AND B.CUENTAID<>'''+edtCuentaREI.text+''' AND  B.FACTOR<>0   AND B.CNTLOTE=''INFL''),0) '
                 + ' WHERE A.CIAID='''+dblcCIA.text+''' AND A.CNTANO='''+speano.Text
                 +''' AND A.CNTLOTE=''INFL''  AND CNTCOMPROB<'''+XNCOMP1+'''';
        End;
        DM1.cdsQry.Close;
        DM1.cdsQry.DataRequest(XSQL);
        try
          DM1.cdsQRY.Execute;
        except
        end;
        }
      End;
      //CALCULO PARA APLICAR FIFO EN LAS CUENTAS DE CLASE 2 Y LA 382,
      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
      XSQL:=' UPDATE CNT303TMP A SET A.TOTSALIDAS=COALESCE((SELECT SUM(COALESCE(B.SALIDAS,0)) SALIDASACT FROM '
              +' CNT303TMP B,TGE202 C '
              + ' WHERE B.CIAID='''+dblcCIA.text+''' AND A.CIAID=B.CIAID AND B.CIAID=C.CIAID '
              + ' AND (C.CTA_TIPOREI=''M'' OR C.CTA_TIPOREI=''V'')AND B.CTA_ORIGEN=C.CUENTAID AND A.CNTANO=B.CNTANO'
              + ' AND A.TDIARID=B.TDIARID '
              + ' AND B.CNTANO='''+speano.TEXT+''' AND A.CTA_ORIGEN=B.CTA_ORIGEN  AND B.CUENTAID<>'''
              +edtCuentaREI.TEXT+''' '
              + '  GROUP BY B.CIAID,B.TDIARID,B.CNTANO,B.CTA_ORIGEN '
              + ' HAVING SUM(COALESCE(B.SALIDAS,0))>0),0) WHERE A.CNTANOMM='''+speano.TEXT+'00''';
       END;

      if SRV_D = 'ORACLE' then
      begin
      XSQL:=' UPDATE CNT303TMP A SET A.TOTSALIDAS=NVL((SELECT SUM(NVL(B.SALIDAS,0)) SALIDASACT FROM '
              +' CNT303TMP B,TGE202 C '
              + ' WHERE B.CIAID='''+dblcCIA.text+''' AND A.CIAID=B.CIAID AND B.CIAID=C.CIAID '
              + ' AND (C.CTA_TIPOREI=''M'' OR C.CTA_TIPOREI=''V'')AND B.CTA_ORIGEN=C.CUENTAID AND A.CNTANO=B.CNTANO'
              + ' AND A.TDIARID=B.TDIARID '
              + ' AND B.CNTANO='''+speano.TEXT+''' AND A.CTA_ORIGEN=B.CTA_ORIGEN  AND B.CUENTAID<>'''
              +edtCuentaREI.TEXT+''' '
              + '  GROUP BY B.CIAID,B.TDIARID,B.CNTANO,B.CTA_ORIGEN '
              + ' HAVING SUM(NVL(B.SALIDAS,0))>0),0) WHERE A.CNTANOMM='''+speano.TEXT+'00''';
       END;

            DM1.cdscuenta5.Close;
            DM1.cdsCuenta5.DataRequest(xSQL);
            try
            DM1.cdsCuenta5.Execute;
            except
            end;

      //ACTULIZACION CUANDO EL TOTAL DE SALIDAS ES CERO Y EL SALDO INICIAL ES CERO
      XSQL:='SELECT CIAID, CNTANO, CNTANOMM, CTA_ORIGEN, SALIDAS FROM CNT303TMP '
           +' WHERE CIAID='''+dblcCIA.text+''' AND CNTANO='''+speano.text+'''';
      dm1.cdsQRY.Close;
      dm1.cdsQRY.DataRequest(xsql);
      dm1.cdsQRY.Open;


      //CALCULO DE LOS VALORES HISTORICOS POR CUENTA SI ES QUE EXISTEN SALIDAS DE ACTIVOS

      prbAvance.Position := 60;
      XSQL:='SELECT CIAID, CNTANO, CNTANOMM, CTA_ORIGEN, SALIDAS FROM CNT303TMP '
           +'WHERE CIAID='''+dblcCIA.text+''' AND CNTANO='''+speano.text+''' AND TOTSALIDAS>0 '
           +'ORDER BY CIAID, CNTANO, CTA_ORIGEN, CNTANOMM ';
      dm1.cdsQRY.Close;
      dm1.cdsQRY.DataRequest(xsql);
      dm1.cdsQRY.Open;

      XSQL:='SELECT A.* ,B.SALIDASACT  FROM CNT303TMP A, '
           +' ( SELECT CTA_ORIGEN,CIAID,TDIARID,CNTANO,SUM(SALIDAS) SALIDASACT FROM CNT303TMP '
           +   'WHERE CIAID='''+dblcCIA.text+''' AND CNTANO='''+speano.text+''' AND CUENTAID<>'''+edtCuentaREI.text+''' '
           +   'GROUP BY CIAID,TDIARID,CNTANO,CTA_ORIGEN ) B '
           +'WHERE A.CIAID='''+dblcCIA.text+''' AND A.CIAID=B.CIAID AND A.CTA_ORIGEN=B.CTA_ORIGEN AND '
           +   'A.CNTANO='''+speano.text+''' AND A.CUENTAID<>'''+edtCuentaREI.text+''' '
           +'ORDER BY A.CIAID, A.TDIARID, A.CNTANO, A.CTA_ORIGEN, A.CNTANOMM ';
      dm1.cdsCuenta2.Close;
      dm1.cdsCuenta2.DataRequest(xsql);
      dm1.cdsCuenta2.Open;

      DM1.cdscuenta2.IndexFieldNames:='CIAID;CNTANO;CTA_ORIGEN;CNTANOMM';
      DM1.cdsQRY.FIRST;
      While not DM1.cdsQry.EOF do //(1)        //revisar
      begin
         DM1.cdscuenta2.SetKey;
         DM1.cdscuenta2.FieldByName('CIAID').AsString:=DM1.cdsQry.FieldByName('CIAID').AsString;
         DM1.cdscuenta2.FieldByName('CNTANO').AsString:=DM1.cdsqry.FieldByName('CNTANO').AsString;
         DM1.cdscuenta2.FieldByName('CTA_ORIGEN').AsString:=DM1.cdsqry.FieldByName('CTA_ORIGEN').AsString;
         DM1.cdscuenta2.FieldByName('CNTANOMM').AsString:=DM1.cdsqry.FieldByName('CNTANOMM').AsString;
         if DM1.cdsCuenta2.GotoKey then     //NCODIGO
         begin //(2)
             xsql:='SELECT * FROM CNT303TMP WHERE '
                   +' CIAID='''+DM1.cdsQry.FieldByName('CIAID').AsString
                   +''' AND CNTANO='''+DM1.cdsQry.FieldByName('CNTANO').AsString
                   +''' AND CTA_ORIGEN='''+DM1.cdsQry.FieldByName('CTA_ORIGEN').AsString+''' ORDER BY CNTCOMPROB';
            dm1.cdsQry2.Close;
            DM1.cdsQry2.ProviderName:='prvCNT';
            dm1.cdsQry2.DataRequest(xsql);
            dm1.cdsQry2.OPEN;
            dm1.cdsQry2.First;
            xvalsalida:=0;
            xvalor:=0;
            while not dm1.cdsQry2.Eof do
            begin     // (3)
              if dm1.cdsQry2.FieldByName('CNTANOMM').asstring<=periodof then
              begin //(3)
                if dm1.cdsQry2.FieldByName('CNTANOMM').asstring=copy(dm1.cdsQry2.FieldByName('CNTANOMM').asstring,1,4)+'00' then
                begin
                  xvalsalida:=dm1.cdsQry2.FieldByName('DEBE').asfloat-dm1.cdsQry2.FieldByName('TOTSALIDAS').asfloat;
                  xvalor:=xvalsalida;
                end;
                if dm1.cdsQry2.FieldByName('CNTANOMM').asstring<>copy(dm1.cdsQry2.FieldByName('CNTANOMM').asstring,1,4)+'00' then
                  xvalor:=dm1.cdsQry2.FieldByName('DEBE').asfloat+xvalor;
                if xvalor<=0 then
                   xvalhist:=0;
                if xvalor>0 then
                begin
                  xvalhist:=xvalor;//+dm1.cdsQry2.fieldbyname('DEBE').asfloat;
                  xvalor:=0;
                end;
              end; //fin de 3
              if dm1.cdsQry2.FieldByName('CNTANOMM').asstring>periodof then
              begin //(4)
                xvalor:=0;
                xvalhist:=0;
              end;  //fin de (4)
              xsql:='UPDATE CNT303TMP SET VALHIST='+floattostr(xvalhist)
                     +' WHERE CIAID='''+DM1.cdsQry2.FieldByName('CIAID').AsString
                     + ''' AND  CNTANO='''+DM1.cdsQry2.FieldByName('CNTANO').AsString
                     + ''' AND  CTA_ORIGEN='''+DM1.cdsQry2.FieldByName('CTA_ORIGEN').AsString
                     + ''' AND  CNTANOMM='''+DM1.cdsQry2.FieldByName('CNTANOMM').AsString+'''';

               DM1.cdscuenta5.Close;
               DM1.cdsCuenta5.DataRequest(xSQL);
               try
                 DM1.cdsCuenta5.Execute;
               except
               end;
              dm1.cdsQry2.next;  //va al siguiente periodo
            end;
         End; //fin de (2)
         DM1.cdsqry.NEXT;
      END; //fin de (1)

    prbAvance.Position := 80;
    dm1.cdsCuenta2.Close;
    DM1.cdsCuenta2.Filter := '';
    DM1.cdsCuenta2.Filtered := True;
    dm1.cdsCuenta2.IndexFieldNames:='';

    dm1.cdsqry.Close;
    DM1.cdsqry.Filter := '';
    DM1.cdsqry.Filtered := True;
    dm1.cdsqry.IndexFieldNames:='';

   XSQL:='select CTA_ORIGEN,SUM(DEBE) DEBE,SUM(HABE) HABE,SUM(DEBE)-SUM(HABE) SALDO  FROM CNT303TMP A,TGE202 B '
     +' WHERE A.CIAID=B.CIAID AND A.CTA_ORIGEN=B.CUENTAID AND CTA_TIPOREI=''V'' '
     +' AND A.CIAID='''+dblcCIA.TEXT+''' AND A.CNTANO='''+speano.TEXT+''''
     +' GROUP BY A.CIAID,A.CNTANO,A.CTA_ORIGEN ';
    dm1.cdsqry.Close;
    dm1.cdsqry.Datarequest(XSQL);
    dm1.cdsqry.Open;


    //AGREGADO PARA VER EL PERIODO EN EL QUE SE ESTA REALIZANDO EL AJUSTE

   XSQL:='SELECT MAX(PERIODO) AS PERIODO FROM CNT104 WHERE FACTORAJUSTE=1 ';
   DM1.cdscuenta5.close;
   dm1.cdscuenta5.Datarequest(XSQL);
   dm1.cdscuenta5.Open;

    dm1.cdsqry.First;
    While not DM1.cdsQry.EOF do
    Begin
      if dm1.cdsQry.fieldbyname('SALDO').asfloat<0 then
      Begin
//      xsql:='UPDATE CNT303TMP SET VALHIST='+DM1.CDSQRY.FIELDBYNAME('SALDO').ASSTRING+'WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+speano.TEXT+''' AND CTA_ORIGEN='''
//            +DM1.CDSQRY.FIELDBYNAME('CTA_ORIGEN').ASSTRING+''' AND FACTOR=1 ';
      xsql:='UPDATE CNT303TMP SET VALHIST='+DM1.CDSQRY.FIELDBYNAME('SALDO').ASSTRING+' '
           +'WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+speano.TEXT+''' '
           +  'AND CTA_ORIGEN='''+DM1.CDSQRY.FIELDBYNAME('CTA_ORIGEN').ASSTRING+''' AND CNTANOMM='''+DM1.cdsCuenta5.fieldbyname('PERIODO').asstring+'''';
      dm1.cdsCuenta2.Close;
      dm1.cdsCuenta2.Datarequest(XSQL);
      dm1.cdsCuenta2.Execute;

      End;
      dm1.cdsQry.next;
    End;


      If f<>0 then
      Begin
        XSQL:=' UPDATE  CNT303 A SET VALHIST='
              + ' (SELECT VALHIST  FROM CNT303TMP B WHERE B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID AND '
              + ' B.CNTCOMPROB=A.CNTCOMPROB AND B.CNTANO=A.CNTANO AND '
              + ' B.CNTANOMM=A.CNTANOMM AND B.CUENTAID=A.CUENTAID AND  B.CTA_ORIGEN=A.CTA_ORIGEN AND '
              + ' B.CIAID='''+dblcCIA.text+''' AND B.CNTANO='''+speano.Text
              + ''' AND B.CUENTAID<>'''+edtCuentaREI.text+''' AND  B.FACTOR<>0   AND B.CNTLOTE=''INFL'') '
              + ' WHERE  EXISTS '
              + ' (SELECT B.CTA_ORIGEN FROM CNT303 B WHERE '
              + '  A.CIAID=B.CIAID AND A.CTA_ORIGEN=B.CTA_ORIGEN  AND '
              + '  A.TDIARID=B.TDIARID AND A.CNTANO=B.CNTANO) AND '
              + ' A.CIAID='''+dblcCIA.text+''' AND A.CNTANO='''+speano.Text
              +''' AND A.CNTLOTE=''INFL''  AND CNTCOMPROB<'''+XNCOMP+'''';

{        XSQL:=' UPDATE  CNT303 A SET VALHIST='
              + ' (SELECT VALHIST  FROM CNT303TMP B WHERE B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID AND '
              + ' B.CNTCOMPROB=A.CNTCOMPROB AND B.CNTANO=A.CNTANO AND '
              + ' B.CNTANOMM=A.CNTANOMM AND B.CUENTAID=A.CUENTAID AND  B.CTA_ORIGEN=A.CTA_ORIGEN AND '
              + ' B.CIAID='''+dblcCIA.text+''' AND B.CNTANO='''+speano.Text
              + ''' AND B.CUENTAID<>'''+edtCuentaREI.text+''' AND  B.FACTOR<>0   AND B.CNTLOTE=''INFL'') '
              + ' WHERE A.CIAID='''+dblcCIA.text+''' AND A.CNTANO='''+speano.Text
              +''' AND A.CNTLOTE=''INFL''  AND CNTCOMPROB<'''+XNCOMP+'''';
}

         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(XSQL);
         try
          DM1.cdsQRY.Execute;
         except
         end;

      End;


    //SI LAS SALIDAS SE REGISTRAN DESPUES DEL PERIODO DE PROCESO


    if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
    Begin
       XSQL:=' INSERT INTO CNT303 (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
            +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
            +' CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
            +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDEBEMN,CNTHABEMN,CNTDH,CNTDEBEME,CNTHABEME,CNTDINC) '
            +' (SELECT CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
            +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
            +' CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
            +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS '
            +', CASE WHEN (VALHIST*FACTOR-VALHIST) >0 THEN  (VALHIST*FACTOR-VALHIST) ELSE 0 END AS CNTDEBE '
            +', CASE WHEN (VALHIST*FACTOR-VALHIST) <0 THEN (-1)*(VALHIST*FACTOR-VALHIST) ELSE 0 END AS CNTHABE '
            +', CASE WHEN (VALHIST*FACTOR-VALHIST) >0 THEN ''D'' ELSE ''H'' END  '
            +', (CASE WHEN (VALHIST*FACTOR-VALHIST) >0 THEN  (VALHIST*FACTOR-VALHIST) ELSE 0 END)/CNTTCAMBIO AS CNTDEBEME '
            +', (CASE WHEN (VALHIST*FACTOR-VALHIST) <0 THEN (-1)*(VALHIST*FACTOR-VALHIST) ELSE 0 END)/CNTTCAMBIO AS CNTHABEME,CNTDINC '

            +' FROM CNT303TMP  WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTDINC=''1'' AND CNTCOMPROB>='''+xncomp+''''
            +' UNION '
            +' SELECT CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
            +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
            +' CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
            +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS '
            +' ,CASE WHEN (VALHIST*FACTOR-VALHIST) <0 THEN (-1)*(VALHIST*FACTOR-VALHIST) ELSE 0  END AS CNTDEBEMN '
            +' ,CASE WHEN (VALHIST*FACTOR-VALHIST) >0 THEN (VALHIST*FACTOR-VALHIST)  ELSE 0 END AS CNTHABEMN '
            +' ,CASE WHEN (VALHIST*FACTOR-VALHIST) <0 THEN ''D'' ELSE ''H'' END AS CNTDH '
            +' ,(CASE WHEN (VALHIST*FACTOR-VALHIST)<0 THEN (-1)*(VALHIST*FACTOR-VALHIST) ELSE 0 END )/CNTTCAMBIO AS CNTDEBEME '
            +' ,(CASE WHEN (VALHIST*FACTOR-VALHIST)>0 THEN VALHIST*FACTOR-VALHIST ELSE 0 END)/CNTTCAMBIO AS CNTHABEME,CNTDINC '
            +' FROM CNT303TMP  WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTDINC IN (''2'',''3'') AND CNTCOMPROB>='''+xncomp+''' )';
    End;

    if (SRV_D = 'ORACLE') then
    Begin
       XSQL:=' INSERT INTO CNT303 (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
            +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
            +' CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
            +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDEBEMN,CNTHABEMN,CNTDH,CNTDEBEME,CNTHABEME,CNTDINC) '
            +' (SELECT A.CIAID,A.TDIARID, A.CUENTAID,A.CNTCOMPROB,A.CTADES,A.CNTANO,A.CNTANOMM'
            +' ,A.CNTLOTE,A.CNTUSER,A.CNTFREG,A.CNTHREG, '
            +' A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS '
            +' ,A.CNTGLOSA,A.CNTTCAMBIO,A.FACTOR,A.CTA_ORIGEN,A.VALHIST,A.SALIDAS '
            +', DECODE(LEAST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,(A.VALHIST*A.FACTOR-A.VALHIST),0) AS CNTDEBE '
            +', DECODE(GREATEST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,(-1)*(A.VALHIST*A.FACTOR-A.VALHIST),0) AS CNTHABE '
            +', DECODE(LEAST(A.VALHIST*A.FACTOR-A.VALHIST,0),0,''D'',''H'') '
            +', DECODE(LEAST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,(A.VALHIST*A.FACTOR-A.VALHIST),0)/A.CNTTCAMBIO AS CNTDEBEME '
            +', DECODE(GREATEST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,(-1)*(A.VALHIST*A.FACTOR-A.VALHIST),0)/A.CNTTCAMBIO AS CNTHABEME,CNTDINC '

            +' FROM CNT303TMP A, '
            +'  (SELECT DISTINCT A.CTA_ORIGEN  FROM CNT303TMP A '
            +' WHERE   EXISTS '
            +' (SELECT B.CTA_ORIGEN FROM CNT303 B WHERE '
            +' A.CIAID=B.CIAID AND A.CTA_ORIGEN=B.CTA_ORIGEN  AND A.TDIARID=B.TDIARID AND A.CNTANO=B.CNTANO) '
            +' AND A.CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+speano.TEXT+''') B '
            +' WHERE A.CIAID='''+dblcCIA.TEXT+''' AND A.CTA_ORIGEN=B.CTA_ORIGEN  AND A.CNTDINC=''1'' AND A.CNTCOMPROB>='''+xncomp+''''
            +' UNION '
            +' SELECT A.CIAID,A.TDIARID, A.CUENTAID,A.CNTCOMPROB,A.CTADES,A.CNTANO,A.CNTANOMM'
            +' ,A.CNTLOTE,A.CNTUSER,A.CNTFREG,A.CNTHREG, '
            +' A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS '
            +' ,A.CNTGLOSA,A.CNTTCAMBIO,A.FACTOR,A.CTA_ORIGEN,A.VALHIST,A.SALIDAS '
            +' ,DECODE(GREATEST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,(-1)*(A.VALHIST*A.FACTOR-A.VALHIST),0) AS CNTDEBEMN '
            +' ,DECODE(LEAST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,A.VALHIST*A.FACTOR-A.VALHIST,0) AS CNTHABEMN '
            +' ,DECODE(GREATEST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,''D'',''H'') AS CNTDH '
            +' ,DECODE(GREATEST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,(-1)*(A.VALHIST*A.FACTOR-A.VALHIST),0)/A.CNTTCAMBIO AS CNTDEBEME '
            +' ,DECODE(LEAST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,A.VALHIST*A.FACTOR-A.VALHIST,0)/A.CNTTCAMBIO AS CNTHABEME,CNTDINC '
            +' FROM CNT303TMP A, '
            +'  (SELECT DISTINCT A.CTA_ORIGEN  FROM CNT303TMP A '
            +' WHERE   EXISTS '
            +' (SELECT B.CTA_ORIGEN FROM CNT303 B WHERE '
            +' A.CIAID=B.CIAID AND A.CTA_ORIGEN=B.CTA_ORIGEN  AND A.TDIARID=B.TDIARID AND A.CNTANO=B.CNTANO) '
            +' AND A.CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+speano.TEXT+''') B '
            +' WHERE A.CIAID='''+dblcCIA.TEXT+''' AND A.CTA_ORIGEN=B.CTA_ORIGEN AND A.CNTDINC IN (''2'',''3'') AND A.CNTCOMPROB>='''+xncomp+''')';

{       XSQL:=' INSERT INTO CNT303 (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
            +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
            +' CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
            +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDEBEMN,CNTHABEMN,CNTDH,CNTDEBEME,CNTHABEME,CNTDINC) '
            +' (SELECT CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
            +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
            +' CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
            +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS '
            +', DECODE(LEAST((VALHIST*FACTOR-VALHIST),0),0,(VALHIST*FACTOR-VALHIST),0) AS CNTDEBE '
            +', DECODE(GREATEST((VALHIST*FACTOR-VALHIST),0),0,(-1)*(VALHIST*FACTOR-VALHIST),0) AS CNTHABE '
            +', DECODE(LEAST(VALHIST*FACTOR-VALHIST,0),0,''D'',''H'') '
            +', DECODE(LEAST((VALHIST*FACTOR-VALHIST),0),0,(VALHIST*FACTOR-VALHIST),0)/CNTTCAMBIO AS CNTDEBEME '
            +', DECODE(GREATEST((VALHIST*FACTOR-VALHIST),0),0,(-1)*(VALHIST*FACTOR-VALHIST),0)/CNTTCAMBIO AS CNTHABEME,CNTDINC '

            +' FROM CNT303TMP  WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTDINC=''1'' AND CNTCOMPROB>='''+xncomp+''''
            +' UNION '
            +' SELECT CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
            +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
            +' CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
            +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS '
            +' ,DECODE(GREATEST((VALHIST*FACTOR-VALHIST),0),0,(-1)*(VALHIST*FACTOR-VALHIST),0) AS CNTDEBEMN '
            +' ,DECODE(LEAST((VALHIST*FACTOR-VALHIST),0),0,VALHIST*FACTOR-VALHIST,0) AS CNTHABEMN '
            +' ,DECODE(GREATEST((VALHIST*FACTOR-VALHIST),0),0,''D'',''H'') AS CNTDH '
            +' ,DECODE(GREATEST((VALHIST*FACTOR-VALHIST),0),0,(-1)*(VALHIST*FACTOR-VALHIST),0)/CNTTCAMBIO AS CNTDEBEME '
            +' ,DECODE(LEAST((VALHIST*FACTOR-VALHIST),0),0,VALHIST*FACTOR-VALHIST,0)/CNTTCAMBIO AS CNTHABEME,CNTDINC '
            +' FROM CNT303TMP  WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTDINC IN (''2'',''3'') AND CNTCOMPROB>='''+xncomp+''')';
}
    End;

    DM1.cdscuenta5.Close;
    DM1.cdsCuenta5.DataRequest(xSQL);
    try
    DM1.cdsCuenta5.Execute;
    except
    end;


    //SI EXISTEN CUENTAS CON MOVIMIENTO RECIEN EN ESTE PERIODO SE DEBE DE INGRESAR LOS REGISTROS DE LOS PERIODOS ANRERIORES
    XSQL:=' SELECT DISTINCT A.CTA_ORIGEN  FROM CNT303TMP A '
          +' WHERE  NOT  EXISTS '
          +' (SELECT B.CTA_ORIGEN FROM CNT303 B WHERE '
          +' A.CIAID=B.CIAID AND A.CTA_ORIGEN=B.CTA_ORIGEN  AND '
          +' A.TDIARID=B.TDIARID AND A.CNTANO=B.CNTANO) '
          +' AND A.CIAID='''+dblccia.text+''' AND CNTANO='''+speano.text+''''
          +' ORDER BY A.CTA_ORIGEN ';
    DM1.cdscuenta5.Close;
    DM1.cdsCuenta5.DataRequest(xSQL);
    DM1.cdsCuenta5.open;

    if dm1.cdscuenta5.recordcount>0 then
    Begin
       xncomp1:='0000000000';

       if (SRV_D = 'ORACLE') then
          Begin
             XSQL:=' INSERT INTO CNT303 (CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM'
                  +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                  +' CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                  +' ,CNTGLOSA,CNTTCAMBIO,FACTOR,CTA_ORIGEN,VALHIST,SALIDAS,CNTDEBEMN,CNTHABEMN,CNTDH,CNTDEBEME,CNTHABEME,CNTDINC) '
                  +' (SELECT A.CIAID,A.TDIARID, A.CUENTAID,A.CNTCOMPROB,A.CTADES,A.CNTANO,A.CNTANOMM'
                  +' ,A.CNTLOTE,A.CNTUSER,A.CNTFREG,A.CNTHREG, '
                  +' A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS '
                  +' ,A.CNTGLOSA,A.CNTTCAMBIO,A.FACTOR,A.CTA_ORIGEN,A.VALHIST,A.SALIDAS '
                  +', DECODE(LEAST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,(A.VALHIST*A.FACTOR-A.VALHIST),0) AS CNTDEBE '
                  +', DECODE(GREATEST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,(-1)*(A.VALHIST*A.FACTOR-A.VALHIST),0) AS CNTHABE '
                  +', DECODE(LEAST(A.VALHIST*A.FACTOR-A.VALHIST,0),0,''D'',''H'') '
                  +', DECODE(LEAST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,(A.VALHIST*A.FACTOR-A.VALHIST),0)/A.CNTTCAMBIO AS CNTDEBEME '
                  +', DECODE(GREATEST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,(-1)*(A.VALHIST*A.FACTOR-A.VALHIST),0)/A.CNTTCAMBIO AS CNTHABEME,CNTDINC '

                  +' FROM CNT303TMP A, '
                  +'  (SELECT DISTINCT A.CTA_ORIGEN  FROM CNT303TMP A '
                  +' WHERE  NOT EXISTS '
                  +' (SELECT B.CTA_ORIGEN FROM CNT303 B WHERE '
                  +' A.CIAID=B.CIAID AND A.CTA_ORIGEN=B.CTA_ORIGEN  AND A.TDIARID=B.TDIARID AND A.CNTANO=B.CNTANO) '
                  +' AND A.CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+speano.TEXT+''') B '
                  +' WHERE A.CIAID='''+dblcCIA.TEXT+''' AND A.CTA_ORIGEN=B.CTA_ORIGEN  AND A.CNTDINC=''1'' AND A.CNTCOMPROB>='''+xncomp1+''''
                  +' UNION '
                  +' SELECT A.CIAID,A.TDIARID, A.CUENTAID,A.CNTCOMPROB,A.CTADES,A.CNTANO,A.CNTANOMM'
                  +' ,A.CNTLOTE,A.CNTUSER,A.CNTFREG,A.CNTHREG, '
                  +' A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS '
                  +' ,A.CNTGLOSA,A.CNTTCAMBIO,A.FACTOR,A.CTA_ORIGEN,A.VALHIST,A.SALIDAS '
                  +' ,DECODE(GREATEST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,(-1)*(A.VALHIST*A.FACTOR-A.VALHIST),0) AS CNTDEBEMN '
                  +' ,DECODE(LEAST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,A.VALHIST*A.FACTOR-A.VALHIST,0) AS CNTHABEMN '
                  +' ,DECODE(GREATEST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,''D'',''H'') AS CNTDH '
                  +' ,DECODE(GREATEST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,(-1)*(A.VALHIST*A.FACTOR-A.VALHIST),0)/A.CNTTCAMBIO AS CNTDEBEME '
                  +' ,DECODE(LEAST((A.VALHIST*A.FACTOR-A.VALHIST),0),0,A.VALHIST*A.FACTOR-A.VALHIST,0)/A.CNTTCAMBIO AS CNTHABEME,CNTDINC '
                  +' FROM CNT303TMP A, '
                  +'  (SELECT DISTINCT A.CTA_ORIGEN  FROM CNT303TMP A '
                  +' WHERE  NOT EXISTS '
                  +' (SELECT B.CTA_ORIGEN FROM CNT303 B WHERE '
                  +' A.CIAID=B.CIAID AND A.CTA_ORIGEN=B.CTA_ORIGEN  AND A.TDIARID=B.TDIARID AND A.CNTANO=B.CNTANO) '
                  +' AND A.CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+speano.TEXT+''') B '
                  +' WHERE A.CIAID='''+dblcCIA.TEXT+''' AND A.CTA_ORIGEN=B.CTA_ORIGEN AND A.CNTDINC IN (''2'',''3'') AND A.CNTCOMPROB>='''+xncomp1+''')';

          End;

          DM1.cdscuenta5.Close;
          DM1.cdsCuenta5.DataRequest(xSQL);
          try
          DM1.cdsCuenta5.Execute;
          except
          end;
    End;



    XSQL:='SELECT DISTINCT CNTCOMPROB,CIAID,TDIARID,CNTANO,CNTANOMM, CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
          +' CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI,CNTAASS, CNTAASEM,  CNTGLOSA,CNTTCAMBIO '
          +' FROM CNT303  '
          +' WHERE CNTANO='''+speano.TEXT+''' AND CIAID='''+dblcCIA.TEXT+''' AND CNTLOTE=''INFL''';
    DM1.cdsqry.Close;
    DM1.cdsqry.DataRequest(xSQL);
    DM1.cdsqry.open;

    //CALCULO DE LA CUENTA DEL REI PARA TRABAJAR CON EL ARCHIVO CNT304 (CABECERA)

    XSQL:=' SELECT CIAID,TDIARID,CNTCOMPROB,CNTANO,SUM(CNTDEBEMN) DEBE,SUM(CNTHABEMN) HABE '
          +' FROM CNT303 WHERE CNTANO='''+speano.TEXT+''' AND CIAID='''+dblcCIA.TEXT+''' AND CNTLOTE=''INFL'''
          +' GROUP BY CIAID,TDIARID,CNTANO,CNTCOMPROB ';
    DM1.cdscuenta5.Close;
    DM1.cdsCuenta5.DataRequest(xSQL);
    DM1.cdscuenta5.open;
    DM1.cdscuenta5.IndexFieldNames:='CIAID;TDIARID;CNTANO;CNTCOMPROB';
    DM1.cdsqry.first;

    while not DM1.cdsQry.EOF do
    begin
       DM1.cdscuenta5.SetKey;
       DM1.cdscuenta5.Fieldbyname('CIAID').asstring:=Dm1.cdsqry.fieldbyname('CIAID').asstring;
       DM1.cdscuenta5.Fieldbyname('TDIARID').asstring:=Dm1.cdsqry.fieldbyname('TDIARID').asstring;
       DM1.cdscuenta5.Fieldbyname('CNTCOMPROB').asstring:=Dm1.cdsqry.fieldbyname('CNTCOMPROB').asstring;
       DM1.cdscuenta5.Fieldbyname('CNTANO').asstring:=SPEANO.TEXT;

       if DM1.cdsCuenta5.GotoKey then
       begin
            IF (dm1.cdsCuenta5.FieldByName('DEBE').asfloat=0) AND (dm1.cdsCuenta5.FieldByName('HABE').asfloat=0) THEN
               BREAK;
            if dm1.cdsCuenta5.FieldByName('DEBE').asfloat>dm1.cdsCuenta5.FieldByName('HABE').asfloat then
            Begin
               XREIHABE:=dm1.cdsCuenta5.FieldByName('DEBE').asfloat-dm1.cdsCuenta5.FieldByName('HABE').asfloat;
               XREIDEBE:=0;
               CNTDH:='H';
            end
            else
            Begin
               XREIDEBE:=dm1.cdsCuenta5.FieldByName('HABE').asfloat-dm1.cdsCuenta5.FieldByName('DEBE').asfloat;
               XREIHABE:=0;
               CNTDH:='D';
            end;
           if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
           Begin
                        XSQL:='INSERT INTO CNT303(CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM '
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,CNTDEBEMN,CNTHABEMN,CNTDH,CNTDEBEME,CNTHABEME)'
                  +' VALUES('''+DM1.cdsQry.Fieldbyname('CIAID').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('TDIARID').asstring+''','''
                             +edtCuentaREI.Text+''','''
                             +DM1.cdsQry.Fieldbyname('CNTCOMPROB').asstring+''','''
                             +edtREIDescripcion.TEXT+''','''
                             +SPEANO.TEXT+''','''
                             +DM1.cdsQry.Fieldbyname('CNTANOMM').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTLOTE').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTUSER').asstring+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''' ,'''
                             +DM1.cdsQry.Fieldbyname('CNTMM').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTDD').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTTRI').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTSEM').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTSS').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTAATRI').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTAASEM').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTAASS').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTGLOSA').asstring+''','
                             +DM1.cdsQry.Fieldbyname('CNTTCAMBIO').asstring+','
                             +FLOATTOSTR(XREIDEBE)+','+FLOATTOSTR(XREIHABE)+','''+CNTDH+''','
                             +floattostr(XREIDEBE/DM1.cdsQry.Fieldbyname('CNTTCAMBIO').asFLOAT)+','
                             +floattostr(XREIHABE/DM1.cdsQry.Fieldbyname('CNTTCAMBIO').asfloat)+') ';
            End;

           if SRV_D = 'ORACLE' then
           Begin

{                        XSQL:='INSERT INTO CNT303(CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM '
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,CNTDEBEMN,CNTHABEMN,CNTDH,CNTDEBEME,CNTHABEME)'
                  +' VALUES('''+DM1.cdsQry.Fieldbyname('CIAID').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('TDIARID').asstring+''','''
                             +edtCuentaREI.Text+''','''
                             +DM1.cdsQry.Fieldbyname('CNTCOMPROB').asstring+''','''
                             +edtREIDescripcion.TEXT+''','''
                             +SPEANO.TEXT+''','''
                             +DM1.cdsQry.Fieldbyname('CNTANOMM').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTLOTE').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTUSER').asstring+''',SYSDATE,SYSDATE,'''
                             +DM1.cdsQry.Fieldbyname('CNTMM').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTDD').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTTRI').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTSEM').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTSS').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTAATRI').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTAASEM').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTAASS').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTGLOSA').asstring+''','
                             +DM1.cdsQry.Fieldbyname('CNTTCAMBIO').asstring+',0'
                             +',0,'''+CNTDH+''',0,0 )';
//                             +floattostr(XREIDEBE/DM1.cdsQry.Fieldbyname('CNTTCAMBIO').asFLOAT)+','
//                             +floattostr(XREIHABE/DM1.cdsQry.Fieldbyname('CNTTCAMBIO').asfloat)+') ';}

                        XSQL:='INSERT INTO CNT303(CIAID,TDIARID, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM '
                     +' ,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
                     +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                     +' ,CNTGLOSA,CNTTCAMBIO,CNTDEBEMN,CNTHABEMN,CNTDH,CNTDEBEME,CNTHABEME)'
                  +' VALUES('''+DM1.cdsQry.Fieldbyname('CIAID').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('TDIARID').asstring+''','''
                             +edtCuentaREI.Text+''','''
                             +DM1.cdsQry.Fieldbyname('CNTCOMPROB').asstring+''','''
                             +edtREIDescripcion.TEXT+''','''
                             +SPEANO.TEXT+''','''
                             +DM1.cdsQry.Fieldbyname('CNTANOMM').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTLOTE').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTUSER').asstring+''',SYSDATE,SYSDATE,'''
                             +DM1.cdsQry.Fieldbyname('CNTMM').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTDD').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTTRI').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTSEM').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTSS').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTAATRI').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTAASEM').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTAASS').asstring+''','''
                             +DM1.cdsQry.Fieldbyname('CNTGLOSA').asstring+''','
                             +DM1.cdsQry.Fieldbyname('CNTTCAMBIO').asstring+','
                             +FLOATTOSTR(XREIDEBE)+','+FLOATTOSTR(XREIHABE)+','''+CNTDH+''','
                             +floattostr(XREIDEBE/DM1.cdsQry.Fieldbyname('CNTTCAMBIO').asFLOAT)+','
                             +floattostr(XREIHABE/DM1.cdsQry.Fieldbyname('CNTTCAMBIO').asfloat)+') ';

            End;

            DM1.cdscuenta2.Close;
            DM1.cdsCuenta2.DataRequest(xSQL);
            try
            DM1.cdsCuenta2.Execute;
            except
            end;


       End;
       DM1.cdsqry.Next;
   End;
    prbAvance.Position := 90;
    dm1.cdsCuenta5.Close;
    DM1.cdsCuenta5.Filter := '';
    DM1.cdsCuenta5.Filtered := True;
    dm1.cdsCuenta5.IndexFieldNames:='';

    dm1.cdsqry.Close;
    DM1.cdsqry.Filter := '';
    DM1.cdsqry.Filtered := True;
    dm1.cdsqry.IndexFieldNames:='';


   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
        xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
        +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFecha.Date)+''')';
   end;
   if (SRV_D = 'ORACLE') then
   begin
       xSQL:='SELECT * FROM TGE114 WHERE FECHA='
         +'TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFecha.Date)+''')';
   end;
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest( xSQL );
   DM1.cdsQry.Open;


   //INSERTANDO CABECERRA PARA LLEVAR EL CONTROLDE  LOS PERIODOS
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  Begin
    XSQL:=' INSERT INTO CNT304 (CIAID,TDIARID,CNTCOMPROB,CNTGLOSA,CNTANO, '
         +' CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
         +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         +' CNTTCAMBIO,CNTESTADO,FAMENSUAL) '
   +' ( SELECT CIAID,TDIARID,CNTCOMPROB,MAX(CNTGLOSA),CNTANO, '
   +' CNTANOMM,SUM(CNTDEBEMN),SUM(CNTHABEMN),CNTLOTE, '''
   +DM1.wUsuario+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''' ,'
   +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
   +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
   +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
   +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
   +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
   +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
   +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
   +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''''
   +',MAX(CNTTCAMBIO),''P'',''S'' '
   +' FROM CNT303 WHERE CIAID='''+dblcCIA.text+''' AND TDIARID='''+dblcTDiario.text
   +'''  AND CNTANO='''+SPEANO.TEXT+''' AND CNTLOTE=''INFL'''
   +' GROUP BY CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE ) ' ;
  End;

  if SRV_D = 'ORACLE' then
  Begin
    XSQL:=' INSERT INTO CNT304 (CIAID,TDIARID,CNTCOMPROB,CNTGLOSA,CNTANO, '
         +' CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
         +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         +' CNTTCAMBIO,CNTESTADO,FAMENSUAL) '
   +' ( SELECT CIAID,TDIARID,CNTCOMPROB,MAX(CNTGLOSA),CNTANO, '
   +' CNTANOMM,SUM(CNTDEBEMN),SUM(CNTHABEMN),CNTLOTE, '''
   +DM1.wUsuario+''',SYSDATE,SYSDATE,'
   +''''+DM1.cdsQry.FieldByName('FECMES').AsString  +''', '
   +''''+DM1.cdsQry.FieldByName('FECDIA').AsString  +''', '
   +''''+DM1.cdsQry.FieldByName('FECTRIM').AsString +''', '
   +''''+DM1.cdsQry.FieldByName('FECSEM').AsString  +''', '
   +''''+DM1.cdsQry.FieldByName('FECSS').AsString   +''', '
   +''''+DM1.cdsQry.FieldByName('FECAATRI').AsString+''', '
   +''''+DM1.cdsQry.FieldByName('FECAASEM').AsString+''', '
   +''''+DM1.cdsQry.FieldByName('FECAASS').AsString+''''
   +',MAX(CNTTCAMBIO),''P'',''S'' '
   +' FROM CNT303 WHERE CIAID='''+dblcCIA.text+''' AND TDIARID='''+dblcTDiario.text
   +'''  AND CNTANO='''+SPEANO.TEXT+''' AND CNTLOTE=''INFL'''
   +' GROUP BY CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE ) ' ;
  End;

   DM1.cdscuenta5.Close;
   DM1.cdsCuenta5.DataRequest(xSQL);
   try
   DM1.cdsCuenta5.Execute;
   except
   end;



   xsql:='SELECT * FROM CNT303 WHERE CIAID='''+dblcCIA.Text+''' AND TDIARID='''+dblcTDiario.Text
       +''' AND CNTLOTE=''INFL''  AND CNTANO='''+COPY(edtperiodo.text,1,4)+''' AND CUENTAID<>'''+edtCuentaREI.Text+'''';
   dm1.cdsQry2.Close;
   DM1.cdsQry2.ProviderName:='prvCNT';
   dm1.cdsQry2.DataRequest(xsql);
   dm1.cdsQry2.OPEN;

   XSQL := 'DELETE FROM CNT303TMP WHERE CIAID='''+dblcCIA.TEXT+''' AND CNTANO='''+PERIODO
           +''' AND CNTLOTE=''INFL'' AND TDIARID='''+dblcTDiario.Text+'''';

   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:='prvCNT';
   DM1.cdsQry.DataRequest(XSQL);
   try

   DM1.cdsQRY.Execute;
   except
   end;

   xsql:='SELECT DISTINCT CNTTCAMBIO, CNTCOMPROB COMPROBANTE, FACTOR FACTOR, CNTANOMM PERIODO,'
       +' CNTGLOSA AS GLOSA  FROM CNT303 WHERE CIAID='''
       +dblcCIA.Text+''' AND TDIARID='''
         +dblcTDiario.Text+''' AND CNTLOTE=''INFL''  AND FACTOR=1 '
       + 'ORDER BY PERIODO ';
   dm1.cdsQry2.Close;
   DM1.cdsQry2.ProviderName:='prvCNT';
   dm1.cdsQry2.DataRequest(xsql);
   dm1.cdsQry2.OPEN;

   // Modificado vhn
   IF Dm1.cdsqry2.recordcount>1 then begin
    dm1.cdsQry2.last;

   edtPeriodo.TEXT    :=DM1.cdsqry2.fieldbyname('PERIODO').asstring;
   edtTasa.TEXT       :=DM1.cdsqry2.fieldbyname('CNTTCAMBIO').asstring;
   edtComprobante.TEXT:=DM1.cdsqry2.fieldbyname('COMPROBANTE').asstring;
   edtfactor.TEXT     :=DM1.cdsqry2.fieldbyname('FACTOR').asstring;
   edtglosa.TEXT      :=DM1.cdsqry2.fieldbyname('GLOSA').asstring;
   end;


//FACTORw

   //Guarda en el archivo CNT305 una imagen de lo que se ha procesado en el presente periodo
   xsql:=' INSERT INTO CNT305 (CIAID ,  TDIARID ,  CNTCOMPROB ,  CNTANO ,  CNTANOMM ,  CNTLOTE ,  CUENTAID ,  CLAUXID , '
          +' AUXID ,  DOCID ,  CNTSERIE ,  CNTNODOC ,  CNTGLOSA ,  CNTDH ,  CCOSID ,  CNTTCAMBIO ,  CNTMTOORI , '
          +' CNTMTOLOC ,  CNTMTOEXT ,  CNTFEMIS ,  CNTFVCMTO ,  CNTFCOMP ,  CNTESTADO ,  CNTCUADRE ,  CNTFAUTOM , '
          +' CNTUSER ,  CNTFREG ,  CNTHREG ,  CNTMM ,  CNTDD ,  CNTTRI ,  CNTSEM ,  CNTSS ,  CNTAATRI ,  CNTAASEM , '
          +' CNTAASS ,  TMONID ,  FLAGVAR ,  FCONS ,  CNTFMEC ,  TDIARDES ,  CTADES ,  AUXDES ,  DOCDES , '
          +' CCOSDES ,  CNTDEBEMN ,  CNTDEBEME ,  CNTHABEMN ,  CNTHABEME ,  CNTSALDMN ,  CNTSALDME ,  CAMPOVAR , '
          +' CNTTS ,  CNTPAGADO ,  CNTMODDOC ,  CNTREG ,  MODULO ,  CTA_SECU ,  FACTOR ,  VALHIST ,  CTA_ORIGEN , '
          +' VALHISTMOD ,  DEBE ,  HABE ,  SALDO ,  SALIDAS ,  CNTDINC ,  CTA_RSREI,CNTANOMMAJU ) '
          +' (SELECT CIAID ,  TDIARID ,  CNTCOMPROB ,  CNTANO ,  CNTANOMM ,  CNTLOTE ,  CUENTAID ,  CLAUXID , '
          +' AUXID ,  DOCID ,  CNTSERIE ,  CNTNODOC ,  CNTGLOSA ,  CNTDH ,  CCOSID ,  CNTTCAMBIO ,  CNTMTOORI , '
          +' CNTMTOLOC ,  CNTMTOEXT ,  CNTFEMIS ,  CNTFVCMTO ,  CNTFCOMP ,  CNTESTADO ,  CNTCUADRE ,  CNTFAUTOM , '
          +' CNTUSER ,  CNTFREG ,  CNTHREG ,  CNTMM ,  CNTDD ,  CNTTRI ,  CNTSEM ,  CNTSS ,  CNTAATRI ,  CNTAASEM , '
          +' CNTAASS ,  TMONID ,  FLAGVAR ,  FCONS ,  CNTFMEC ,  TDIARDES ,  CTADES ,  AUXDES ,  DOCDES , '
          +' CCOSDES ,  CNTDEBEMN ,  CNTDEBEME ,  CNTHABEMN ,  CNTHABEME ,  CNTSALDMN ,  CNTSALDME ,  CAMPOVAR , '
          +' CNTTS ,  CNTPAGADO ,  CNTMODDOC ,  CNTREG ,  MODULO ,  CTA_SECU ,  FACTOR ,  VALHIST ,  CTA_ORIGEN , '
          +' VALHISTMOD ,  DEBE ,  HABE ,  SALDO ,  SALIDAS ,  CNTDINC ,  CTA_RSREI,'''+periodof
          +''' FROM CNT303 '
          +' WHERE CIAID='''+dblcCIA.TEXT+''' AND TDIARID='''
          +dblcTDiario.TEXT+''' AND CNTANO='''+speano.TEXT+''' AND CNTLOTE=''INFL'' )';
   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:='prvCNT';
   DM1.cdsQry.DataRequest(XSQL);
   try

   DM1.cdsQRY.Execute;
   except
   end;



   BitBCarta.enabled:=true;
 	 prbAvance.Position := 100;
   BitBtn2.Enabled:=True;
   bbtnMensual.Enabled:=True;
   //FIN DE TRABAJO EN LA TABLA TEMPORAL


   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin

   XSQL:='SELECT A.CIAID,A.CUENTAID,A.CTADES, '
         +'A.SALDMN'+copy(edtPeriodo.text,5,2)+ ' AS SALDO, A.SALDMN'+copy(edtPeriodo.text,5,2)+'*'+edtFactor.Text
         +' AS FACTOR FROM CNT401 A,TGE202 B '
         +' WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
         +' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.Text
//         +' AND B.CTA_GYP=''A'' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.Text
         +''' AND A.ANO='''+speano.text+''' AND A.SALDMN'+copy(edtPeriodo.text,5,2)+ '>0'  ;
    END;

   if SRV_D = 'ORACLE' then
   begin
   XSQL:='SELECT A.CIAID,A.CUENTAID,A.CTADES, '
         +'A.SALDMN'+copy(edtPeriodo.text,5,2)+ ' AS SALDO, A.SALDMN'+copy(edtPeriodo.text,5,2)+'*'+edtFactor.Text
         +' AS FACTOR FROM CNT401 A,TGE202 B '
         +' WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND'
         +'  NVL(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.Text
//         +' AND B.CTA_GYP=''A'' AND NVL(CTA_AJUSTEREI,''0'')<>0 AND A.CIAID='''+dblcCIA.Text
         +''' AND A.ANO='''+speano.text+''' AND A.SALDMN'+copy(edtPeriodo.text,5,2)+ '>0'  ;
    End;
      dm1.cdsREIActivo.Close;
      dm1.cdsREIActivo.DataRequest(XSQL);
      dm1.cdsREIActivo.open;


   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
   XSQL:='SELECT A.CIAID,A.CUENTAID,A.CTADES, '
         +' (-1)*A.SALDMN'+copy(edtPeriodo.text,5,2)+ ' AS SALDO, '
         +' (-1)*A.SALDMN'+copy(edtPeriodo.text,5,2)+'*'+edtfactor.Text
         +' AS FACTOR FROM CNT401 A,TGE202 B '
         +' WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
         +' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.Text
//         +' AND B.CTA_GYP=''P'' AND COALESCE(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.Text
         +''' AND A.ANO='''+speano.text+'''AND A.SALDMN'+copy(edtPeriodo.text,5,2)+ '< 0' ;
   END;

   if SRV_D = 'ORACLE' then
   begin
   XSQL:='SELECT A.CIAID,A.CUENTAID,A.CTADES, '
         +' (-1)*A.SALDMN'+copy(edtPeriodo.text,5,2)+ ' AS SALDO, '
         +' (-1)*A.SALDMN'+copy(edtPeriodo.text,5,2)+'*'+edtfactor.Text
         +' AS FACTOR FROM CNT401 A,TGE202 B '
         +' WHERE A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
         +' AND NVL(CTA_AJUSTEREI,''0'')<>''0'' AND A.CIAID='''+dblcCIA.Text
//         +' AND B.CTA_GYP=''P'' AND NVL(CTA_AJUSTEREI,0)<>0 AND A.CIAID='''+dblcCIA.Text
         +''' AND A.ANO='''+speano.text+'''AND A.SALDMN'+copy(edtPeriodo.text,5,2)+ '< 0' ;
   END;

      DM1.cdsREIPasivo.Close;
      DM1.cdsREIPasivo.DataRequest(XSQL);
      DM1.cdsREIPasivo.Open;





  Screen.Cursor:=CrDefault;
  showmessage('Ajuste Realizado');
end;

procedure TFAjusteInflacion1.BitBtn2Click(Sender: TObject);
var
 xsql : String;
 x10:integer;
begin
 dm1.cdsQry2.Close;
 DM1.cdsqry2.Filter := '';
 DM1.cdsqry2.Filtered := True;
 dm1.cdsQry2.IndexFieldNames:='';


 if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
 Begin
    xsql:=' SELECT A.CIAID AS CIAID ,B.TDIARID AS TDIARID,B.CNTANO AS CNTANO,B.CNTLOTE AS CNTLOTE,B.CTA_ORIGEN AS CTA_ORIGEN ,MAX(A.CIADES) CIADES '
       + ' ,SUM(CASE WHEN B.FACTOR<>0 AND COALESCE(B.VALHISTMOD,99)=99 THEN B.VALHIST ELSE B.VALHISTMOD END) AS VALOR_HISTORICO '
       + ' ,SUM((CASE WHEN B.FACTOR<>0 AND  COALESCE(B.VALHISTMOD,99)=99 THEN B.VALHIST ELSE B.VALHISTMOD END)*B.FACTOR) AS VALOR_AJUSTADO, '
       + ' (SUM((CASE WHEN B.FACTOR<>0 AND COALESCE(B.VALHISTMOD,99)=99 THEN B.VALHIST ELSE B.VALHISTMOD END) *B.FACTOR))-'
       + ' (SUM(CASE WHEN B.FACTOR<>0 AND COALESCE(B.VALHISTMOD,99)=99 THEN B.VALHIST ELSE B.VALHISTMOD END)) AS DIFERENCIA '
       + ' , MAX(C.CTADES) AS CTADES,MAX(C.CTA_SUMGA)   AS CTA_SUMGA '
       + ' FROM TGE101 A   '
       + ' LEFT JOIN CNT303 B ON (A.CIAID=B.CIAID AND '
       + '  B.CNTANO='''+speano.TEXT+''' AND B.CNTLOTE=''INFL'' AND B.CUENTAID<>'''+edtCuentaREI.TEXT
       + ''') ,  TGE202 C '
       + ' WHERE  B.CTA_ORIGEN=C.CUENTAID AND B.CIAID=C.CIAID '
       + ' GROUP BY A.CIAID,B.TDIARID,B.CNTANO,B.CNTLOTE,B.CTA_ORIGEN,C.CTA_SUMGA '
       +' ORDER BY B.CTA_ORIGEN,A.CIAID,C.CTA_SUMGA' ;
 End;

 if SRV_D = 'ORACLE' then
 Begin
  xSql:='Select A.CIAID, A.TDIARID, A.CNTANO, A.CNTLOTE, A.CTA_ORIGEN, A.CIADES, A.CUENTAID, '
       +     'A.VALOR_HISTORICO, '
       +     'A.VALOR_AJUSTADO, '
       +     'A.DIFERENCIA, '
       +     'A.CTADES, A.CTA_SUMGA '
       +'From '
       + '( '
       +   'SELECT A.CIAID AS CIAID, B.TDIARID AS TDIARID, B.CNTANO AS CNTANO, B.CNTLOTE AS CNTLOTE, '
       +     'B.CTA_ORIGEN AS CTA_ORIGEN, MAX(A.CIADES) CIADES, B.CUENTAID, '
       +     'SUM(DECODE(B.FACTOR,0,0,DECODE (NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD))) AS VALOR_HISTORICO, '
       +     'SUM(DECODE(B.FACTOR,0,0,DECODE (NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD))*B.FACTOR) AS VALOR_AJUSTADO, '
       +     ' (SUM(DECODE(B.FACTOR,0,0,DECODE (NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD))*B.FACTOR))-'
       +     ' (SUM(DECODE(B.FACTOR,0,0,DECODE (NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD)))) AS DIFERENCIA, '
       +     'MAX(C.CTADES) AS CTADES, MAX(C.CTA_SUMGA) AS CTA_SUMGA '
       +   'FROM TGE101 A, CNT303 B, TGE202 C '
       +   'WHERE A.CIAID=B.CIAID(+) AND B.CNTANO(+)='''+speano.TEXT+''' '
       +     'AND B.CNTLOTE(+)=''INFL'' AND B.CUENTAID(+)<>'''+edtCuentaREI.TEXT+''' '
       +     'AND B.CTA_ORIGEN=C.CUENTAID AND B.CIAID=C.CIAID '
       +   'GROUP BY A.CIAID, B.TDIARID, B.CNTANO, B.CNTLOTE, B.CTA_ORIGEN, C.CTA_SUMGA, B.CUENTAID '
       + ') A, '
       + '( '
       +   'SELECT CIAID, CNTANO, CUENTAID, CNTLOTE, '
       +     'SUM( CNTDEBEMN ) - SUM( CNTHABEMN ) CNTMTOLOC, '
       +     'CASE WHEN SUM( CNTDEBEMN )-SUM( CNTHABEMN )>0 THEN ''D'' ELSE ''H'' END CNTDH '
       +   'FROM CNT303 '
//       +   'WHERE CNTANO='''+speAno.TEXT+''' AND CNTLOTE=''INFL'' '
       +   'WHERE CNTANO='''+speAno.TEXT+''' AND CNTLOTE=''AJDE'' '
       +   'GROUP BY CIAID, CNTANO, CUENTAID, CNTLOTE '
       + ') D '

       +'Where D.CIAID(+)=A.CIAID AND D.CNTANO(+)=A.CNTANO AND D.CUENTAID(+)=A.CUENTAID '
       +  'AND D.CNTLOTE(+)=''AJDE'' '

       +'ORDER  BY A.CTA_ORIGEN, A.CIAID, A.CTA_SUMGA' ;


 End;

 dm1.cdsqry2.close;
 dm1.cdsqry2.datarequest(xsql);
 dm1.cdsqry2.open;

  pprSconsolidado.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\SConsolidado.rtm';
  pprSconsolidado.template.LoadFromFile ;
  if wrptcia='Dema' then
            pplblcian.caption:='DERRAMA MAGISTERIAL' ;

  XSql := 'MESIDR='''+COPY(edtPeriodo.Text,5,2)+'''';
  pplblmes.caption:= dm1.DisplayDescrip('PrvTGE','TGE181','MESDESL',xSql,'MESDESL'); //DM1.cdsTDiarioTDiarDes.Text;
  pplAno2.Caption:=COPY(edtperiodo.text,1,4);

  Screen.Cursor:=CrDefault;
  pprSconsolidado.print;
  pprResumen.Stop;

  x10:=self.componentCount-1;
  while x10>0 do begin
     if self.components[x10].classname='TppGroup' then begin
        self.components[x10].free;
     end;
     x10:=x10-1;
  end;
end;

procedure TFAjusteInflacion1.bbtnImprimirSClick(Sender: TObject);
var
 xsql : String;
begin

  if dm1.cdsReporte.recordcount=0 then
  Begin
    Showmessage('No Existen Datos para la Consulta');
    pnlSustento.visible:=False;
    Exit;
  End;
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  Begin
   xsql:=' SELECT B.CIAID,A.CIADES,''SALDO INICIAL'' AS MES, '
       +' B.CTA_ORIGEN AS CUENTAORI,  C.CTADES AS CTADES,'''+speano.TEXT+'00''  AS PERIODO '
       +' , CASE WHEN COALESCE(B.VALHISTMOD,99)=99 THEN B.VALHIST ELSE B.VALHISTMOD END  VALOR_HISTORICO, '
       +' B.FACTOR AS FACTOR, (CASE WHEN (COALESCE(B.VALHISTMOD,99)=99) THEN B.VALHIST ELSE B.VALHISTMOD END) * B.FACTOR VALOR_AJUSTADO, '
       +' (CASE WHEN ((B.FACTOR<>0) AND (COALESCE(B.VALHISTMOD,99)=99)) THEN B.VALHIST ELSE B.VALHISTMOD END )*B.FACTOR-(CASE WHEN COALESCE(B.VALHISTMOD,99)=99 THEN B.VALHIST ELSE B.VALHISTMOD END) AS DIFERENCIA '
       +',G.MESDESL AS DESMES,B.VALHISTMOD AS NUEVOMONTO,B.CNTDINC,B.VALHIST VALHIST '
       +' FROM CNT303 B, TGE101 A, TGE202 C ,TGE181 G '
       +' WHERE B.CIAID=A.CIAID AND B.CIAID=C.CIAID  AND B.CTA_ORIGEN=C.CUENTAID AND B.CTA_ORIGEN<>'''+edtCuentaREI.text+''''
       +' AND C.CIAID='''+dblcCIA.text+''' AND B.CNTANOMM='''+concat(copy(edtperiodo.text,1,4),'00')
       +''' AND G.MESIDR='''+COPY(edtperiodo.text,5,2)+''''

        +' UNION ALL  '

       +' SELECT A.CIAID, C.CIADES CIADES, B.MESDESL MES,A.CTA_ORIGEN AS CUENTAORI,D.CTADES AS CTADES, '
       +' A.CNTANOMM  AS PERIODO '
       +' , CASE WHEN (E.FACTORAJUSTE<>0)  THEN '
       +'  ( CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END ) ELSE 0 END VALOR_HISTORICO, '
       +' E.FACTORAJUSTE FACTOR , '
       +'( CASE WHEN (E.FACTORAJUSTE<>0)  THEN '
       +'  ( CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END ) ELSE 0 END )*E.FACTORAJUSTE VALOR_AJUSTADO, '
       +' (  CASE WHEN (E.FACTORAJUSTE<>0)  THEN '
       +'  ( CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END ) ELSE 0 END)'
       +' *E.FACTORAJUSTE-'
       +' (  CASE WHEN (E.FACTORAJUSTE<>0)  THEN '
       +'  ( CASE WHEN COALESCE(A.VALHISTMOD,99)=99 THEN A.VALHIST ELSE A.VALHISTMOD END ) ELSE 0 END ) AS DIFERENCIA '
       +',G.MESDESL AS DESMES ,A.VALHISTMOD AS NUEVOMONTO,A.CNTDINC, A.VALHIST VALHIST '
       + ' FROM CNT303 A ,TGE181 B,TGE101 C ,TGE202 D ,CNT104 E, TGE181 G'
       +' WHERE B.MESIDR=LTRIM(SUBSTR(CNTANOMM,5,2)) AND E.PERIODO=CNTANOMM '
       +' AND A.CNTANO='''+copy(edtperiodo.text,1,4)
       +''' AND A.CUENTAID<>'''+edtCuentaREI.text
       +''' AND A.CIAID=D.CIAID AND A.CIAID='''+dblcCIA.text+''' AND A.CIAID=C.CIAID AND A.CTA_ORIGEN=D.CUENTAID  AND CNTLOTE=''INFL'''
       +'  AND G.MESIDR='''+COPY(edtperiodo.text,5,2)+''''
       +' ORDER BY CUENTAORI,PERIODO ';
  End;

  if SRV_D = 'ORACLE' then
  Begin
   xsql:=' SELECT B.CIAID,A.CIADES,''SALDO INICIAL'' AS MES, '
       +' B.CTA_ORIGEN AS CUENTAORI,  C.CTADES AS CTADES,'''+speano.TEXT+'00'' AS PERIODO '
       +' ,  DECODE(NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD)  VALOR_HISTORICO, '
       +' B.FACTOR AS FACTOR, DECODE(NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD)*B.FACTOR VALOR_AJUSTADO, '
       +' DECODE(B.FACTOR,0,0,(DECODE(NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD))*B.FACTOR-(DECODE(NVL(B.VALHISTMOD,99),99,B.VALHIST,B.VALHISTMOD))) AS DIFERENCIA '
       +',G.MESDESL AS DESMES,B.VALHISTMOD AS NUEVOMONTO,B.CNTDINC,B.VALHIST VALHIST '
       +' FROM CNT303 B, TGE101 A, TGE202 C ,TGE181 G '
       +' WHERE B.CIAID=A.CIAID AND B.CIAID=C.CIAID  AND B.CTA_ORIGEN=C.CUENTAID AND B.CTA_ORIGEN<>'''+edtCuentaREI.TEXT+''''
       +' AND C.CIAID='''+dblcCIA.text+''' AND B.CNTANOMM='''+concat(copy(edtperiodo.text,1,4),'00')
       +''' AND G.MESIDR='''+COPY(edtperiodo.text,5,2)+''''

        +' UNION ALL  '

       +' SELECT A.CIAID, C.CIADES CIADES, B.MESDESL MES,A.CTA_ORIGEN AS CUENTAORI,D.CTADES AS CTADES, '
       +' A.CNTANOMM  AS PERIODO '
       +' , DECODE(E.FACTORAJUSTE,0,0,DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD))  VALOR_HISTORICO, '

      +' E.FACTORAJUSTE FACTOR , DECODE(E.FACTORAJUSTE,0,0,DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD))*E.FACTORAJUSTE VALOR_AJUSTADO, '
       +' DECODE(E.FACTORAJUSTE,0,0,(DECODE(E.FACTORAJUSTE,0,0,DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)))*E.FACTORAJUSTE-(DECODE(E.FACTORAJUSTE,0,0,DECODE(NVL(A.VALHISTMOD,99),99,A.VALHIST,A.VALHISTMOD)))) AS DIFERENCIA '
       +',G.MESDESL AS DESMES ,A.VALHISTMOD AS NUEVOMONTO,A.CNTDINC, A.VALHIST VALHIST '
       + ' FROM CNT303 A ,TGE181 B,TGE101 C ,TGE202 D ,CNT104 E, TGE181 G'
       +' WHERE B.MESIDR=TRIM(SUBSTR(CNTANOMM,5,2)) AND E.PERIODO=CNTANOMM '
       +' AND A.CNTANO='''+copy(edtperiodo.text,1,4)
       +''' AND A.CUENTAID<>'''+edtCuentaREI.text
       +''' AND A.CIAID=D.CIAID AND A.CIAID='''+dblcCIA.text+''' AND A.CIAID=C.CIAID AND A.CTA_ORIGEN=D.CUENTAID  AND CNTLOTE=''INFL'''
       +'  AND G.MESIDR='''+COPY(edtperiodo.text,5,2)+''''
       +' ORDER BY CUENTAORI,PERIODO ';
  End;

  dm1.cdsReporte.Close;
  dm1.cdsReporte.DataRequest(xsql);
  dm1.cdsReporte.Open;

  TNumericField(dm1.cdsReporte.FieldByName('VALOR_HISTORICO')).DisplayFormat:= '###,###,##0.00';
  TNumericField(dm1.cdsReporte.FieldByName('VALOR_AJUSTADO')).DisplayFormat:= '###,###,##0.00';
  TNumericField(dm1.cdsReporte.FieldByName('DIFERENCIA')).DisplayFormat:= '###,###,##0.00';
  TNumericField(dm1.cdsReporte.FieldByName('NUEVOMONTO')).DisplayFormat:= '###,###,##0.00';

  pprSustento.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\Sustento.rtm';
  pprSustento.template.LoadFromFile ;


  pplAno1.Caption:=COPY(edtperiodo.text,1,4);

  Screen.Cursor:=CrDefault;
  pprSustento.print;

end;

procedure TFAjusteInflacion1.bbtnCancelarClick(Sender: TObject);
begin
   pnlSustento.visible:=False;
end;

procedure TFAjusteInflacion1.dbgSustentoTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  isbusca.visible:=True;
  isbusca.SearchField:=AFieldName;

end;

procedure TFAjusteInflacion1.isbuscaExit(Sender: TObject);
begin
 isbusca.visible:=False;
end;

procedure TFAjusteInflacion1.dbgSustentoFieldChanged(Sender: TObject;
  Field: TField);
var
 xSQL : String;
 Xnvalor,xdiferencia, xreidebe,xreihabe: string;
begin
//          if length(dbgsustento.Fields[7].asstring)=0 then
          if dbgsustento.Fields[7].asstring='99' then
                  xnvalor:='99'
          else
                xnvalor:=dbgsustento.Fields[7].asstring;


//  IF xnvalor<>'0' then
  if xnvalor='0' then
  Begin
    xreidebe:='0';
    xreihabe:='0';
  End;
  IF xnvalor<>'0' then
  begin
      //calculo del nue vo : debe ,haber
      xdiferencia:= floattostr(strtofloat(xnvalor)*dm1.cdsreporte.fieldbyname('FACTOR').asfloat-strtofloat(xnvalor));
      if dm1.cdsreporte.fieldbyname('CNTDINC').asstring='1' then
      Begin
          if strtofloat(xdiferencia)<0 then
          Begin
                 xreidebe:='0';
                 xreihabe:=floattostr(strtofloat(xdiferencia)*(-1));
          End;
          if strtofloat(xdiferencia)>0 then
          Begin
                 xreidebe:=xdiferencia;
                 xreihabe:='0';
          End;

      End;
      if (dm1.cdsreporte.fieldbyname('CNTDINC').asstring='2') or (dm1.cdsreporte.fieldbyname('CNTDINC').asstring='3') then
      Begin
          if strtofloat(xdiferencia)<0 then
          Begin
                 xreidebe:=floattostr(strtofloat(xdiferencia)*(-1));
                 xreihabe:='0';
          End;
          if strtofloat(xdiferencia)>0 then
          Begin
                 xreidebe:='0';
                 xreihabe:=xdiferencia;
          End;
      End;

   END;
     IF xnvalor='99' then
  begin
      //calculo del nuevo : debe ,haber
      xdiferencia:= floattostr(dm1.cdsreporte.fieldbyname('VALHIST').asfloat*dm1.cdsreporte.fieldbyname('FACTOR').asfloat-dm1.cdsreporte.fieldbyname('VALHIST').asfloat);
      if dm1.cdsreporte.fieldbyname('CNTDINC').asstring='1' then
      Begin
          if strtofloat(xdiferencia)<0 then
          Begin
                 xreidebe:='0';
                 xreihabe:=floattostr(strtofloat(xdiferencia)*(-1));
          End;
          if strtofloat(xdiferencia)>0 then
          Begin
                 xreidebe:=xdiferencia;
                 xreihabe:='0';
          End;

      End;
      if (dm1.cdsreporte.fieldbyname('CNTDINC').asstring='2') or (dm1.cdsreporte.fieldbyname('CNTDINC').asstring='2') then
      Begin
          if strtofloat(xdiferencia)<0 then
          Begin
                 xreidebe:=floattostr(strtofloat(xdiferencia)*(-1));
                 xreihabe:='0';
          End;
          if strtofloat(xdiferencia)>0 then
          Begin
                 xreidebe:='0';
                 xreihabe:=xdiferencia;
          End;
      End;

   END;

   if dbgsustento.Fields[7].asstring<>'99' then
   Begin
     IF (DM1.CdsReporte.FieldByName('FACTOR').asstring<>'0') then
     Begin
        if (DM1.CdsReporte.FieldByName('FACTOR').asstring<>'1') THEN
           Begin
            xSQL := 'UPDATE CNT303 SET VALHISTMOD='+xnvalor+', CNTDEBEMN='+XREIDEBE+', CNTHABEMN='+XREIHABE
                   +'  WHERE CIAID='''+dm1.cdsreporte.fieldbyname('CIAID').asstring
                   +''' AND  CNTANOMM='''+dm1.cdsreporte.fieldbyname('PERIODO').asstring
                   +''' AND CTA_ORIGEN='''+dm1.cdsreporte.fieldbyname('CUENTAORI').asstring+''' AND CNTLOTE=''INFL''';
            DM1.DCOM1.AppServer.EjecutaQry(xSQL);
           End;
     End;
     IF DM1.CdsReporte.FieldByName('FACTOR').asstring='1' THEN
     Begin
      xSQL := 'UPDATE CNT303 SET VALHISTMOD='+xnvalor+', CNTDEBEMN=0, CNTHABEMN=0'
             +'  WHERE CIAID='''+dm1.cdsreporte.fieldbyname('CIAID').asstring
             +''' AND  CNTANOMM='''+dm1.cdsreporte.fieldbyname('PERIODO').asstring
             +''' AND CTA_ORIGEN='''+dm1.cdsreporte.fieldbyname('CUENTAORI').asstring+''' AND CNTLOTE=''INFL''';
      DM1.DCOM1.AppServer.EjecutaQry(xSQL);
     End;
   End;

   if dbgsustento.Fields[7].asstring='99' then
   Begin
     IF (DM1.CdsReporte.FieldByName('FACTOR').asstring<>'0') then
     Begin
        if (DM1.CdsReporte.FieldByName('FACTOR').asstring<>'1') THEN
           Begin
            xSQL := 'UPDATE CNT303 SET VALHISTMOD=99, CNTDEBEMN='+XREIDEBE+', CNTHABEMN='+XREIHABE
                   +'  WHERE CIAID='''+dm1.cdsreporte.fieldbyname('CIAID').asstring
                   +''' AND  CNTANOMM='''+dm1.cdsreporte.fieldbyname('PERIODO').asstring
                   +''' AND CTA_ORIGEN='''+dm1.cdsreporte.fieldbyname('CUENTAORI').asstring+''' AND CNTLOTE=''INFL''';
            DM1.DCOM1.AppServer.EjecutaQry(xSQL);
           End;
     End;
     IF DM1.CdsReporte.FieldByName('FACTOR').asstring='1' THEN
     Begin
      xSQL := 'UPDATE CNT303 SET VALHISTMOD=99, CNTDEBEMN=0, CNTHABEMN=0'
             +'  WHERE CIAID='''+dm1.cdsreporte.fieldbyname('CIAID').asstring
             +''' AND  CNTANOMM='''+dm1.cdsreporte.fieldbyname('PERIODO').asstring
             +''' AND CTA_ORIGEN='''+dm1.cdsreporte.fieldbyname('CUENTAORI').asstring+''' AND CNTLOTE=''INFL''';
      DM1.DCOM1.AppServer.EjecutaQry(xSQL);
     End;
   End;

  {       if length(dbgsustento.Fields[7].asstring)=0 then
                     xnvalor:='0'
          else
                xnvalor:=dbgsustento.Fields[7].asstring;


  IF xnvalor<>'0' then
  begin
      //calculo del nuevo : debe ,haber
      xdiferencia:= floattostr(strtofloat(xnvalor)*dm1.cdsreporte.fieldbyname('FACTOR').asfloat-strtofloat(xnvalor));
      if dm1.cdsreporte.fieldbyname('CNTDINC').asstring='1' then
      Begin
          if strtofloat(xdiferencia)<0 then
          Begin
                 xreidebe:='0';
                 xreihabe:=floattostr(strtofloat(xdiferencia)*(-1));
          End;
          if strtofloat(xdiferencia)>0 then
          Begin
                 xreidebe:=xdiferencia;
                 xreihabe:='0';
          End;

      End;
      if (dm1.cdsreporte.fieldbyname('CNTDINC').asstring='2') or (dm1.cdsreporte.fieldbyname('CNTDINC').asstring='2') then
      Begin
          if strtofloat(xdiferencia)<0 then
          Begin
                 xreidebe:=floattostr(strtofloat(xdiferencia)*(-1));
                 xreihabe:='0';
          End;
          if strtofloat(xdiferencia)>0 then
          Begin
                 xreidebe:='0';
                 xreihabe:=xdiferencia;
          End;
      End;

   END;
     IF xnvalor='0' then
  begin
      //calculo del nuevo : debe ,haber
      xdiferencia:= floattostr(dm1.cdsreporte.fieldbyname('VALHIST').asfloat*dm1.cdsreporte.fieldbyname('FACTOR').asfloat-dm1.cdsreporte.fieldbyname('VALHIST').asfloat);
      if dm1.cdsreporte.fieldbyname('CNTDINC').asstring='1' then
      Begin
          if strtofloat(xdiferencia)<0 then
          Begin
                 xreidebe:='0';
                 xreihabe:=floattostr(strtofloat(xdiferencia)*(-1));
          End;
          if strtofloat(xdiferencia)>0 then
          Begin
                 xreidebe:=xdiferencia;
                 xreihabe:='0';
          End;

      End;
      if (dm1.cdsreporte.fieldbyname('CNTDINC').asstring='2') or (dm1.cdsreporte.fieldbyname('CNTDINC').asstring='2') then
      Begin
          if strtofloat(xdiferencia)<0 then
          Begin
                 xreidebe:=floattostr(strtofloat(xdiferencia)*(-1));
                 xreihabe:='0';
          End;
          if strtofloat(xdiferencia)>0 then
          Begin
                 xreidebe:='0';
                 xreihabe:=xdiferencia;
          End;
      End;

   END;

  IF (DM1.CdsReporte.FieldByName('FACTOR').asstring<>'0') then
  Begin
     if (DM1.CdsReporte.FieldByName('FACTOR').asstring<>'1') THEN
        Begin
         xSQL := 'UPDATE CNT303 SET VALHISTMOD='+xnvalor+', CNTDEBEMN='+XREIDEBE+', CNTHABEMN='+XREIHABE
                +'  WHERE CIAID='''+dm1.cdsreporte.fieldbyname('CIAID').asstring
                +''' AND  CNTANOMM='''+dm1.cdsreporte.fieldbyname('PERIODO').asstring
                +''' AND CTA_ORIGEN='''+dm1.cdsreporte.fieldbyname('CUENTAORI').asstring+''' AND CNTLOTE=''INFL''';
         DM1.DCOM1.AppServer.EjecutaQry(xSQL);
        End;
  End;
  IF DM1.CdsReporte.FieldByName('FACTOR').asstring='1' THEN
  Begin
   xSQL := 'UPDATE CNT303 SET VALHISTMOD='+xnvalor+', CNTDEBEMN=0, CNTHABEMN=0'
          +'  WHERE CIAID='''+dm1.cdsreporte.fieldbyname('CIAID').asstring
          +''' AND  CNTANOMM='''+dm1.cdsreporte.fieldbyname('PERIODO').asstring
          +''' AND CTA_ORIGEN='''+dm1.cdsreporte.fieldbyname('CUENTAORI').asstring+''' AND CNTLOTE=''INFL''';
   DM1.DCOM1.AppServer.EjecutaQry(xSQL);
  End;
}

showmessage('Registro Actualizado');

end;

procedure TFAjusteInflacion1.speanoExit(Sender: TObject);
var
XSQL : String;
begin
 if length(speano.text)>0 then
 Begin
   BitBtn2.Enabled:=true;
   bbtnAcepta.Enabled:=True;
   bbtnMensual.Enabled:=True;
   XSQL:='SELECT CNTANOMM  PERIODO,CNTFREG FROM CNT304 WHERE CNTLOTE=''AJDE''  '
   +' AND CIAID='''+dblcCIA.TEXT+''' AND TDIARID='''+dblcTDiario.TEXT
   +''' ORDER BY CNTFREG DESC';
   DM1.cdsQRY.Close;
   DM1.cdsQRY.DataRequest(xSQL);
   DM1.cdsQRY.open;


   IF    copy(DM1.cdsQRY.Fieldbyname('PERIODO').asstring,1,4)=speano.text then
   Begin
         Showmessage('Yase genero el Proceso de Ajuste Para el Año');
         bbtnAjuste.Enabled:=False;
         FAJUSDEF:='S' ;
         XSQL:='SELECT CNTANOMM  PERIODO,CNTFREG FROM CNT303 WHERE FACTOR=1  '
         +' AND CIAID='''+dblcCIA.TEXT+''' AND TDIARID='''+dblcTDiario.TEXT
         +''' ORDER BY CNTFREG DESC';
         DM1.cdsQRY.Close;
         DM1.cdsQRY.DataRequest(xSQL);
         DM1.cdsQRY.open;
         dtpFecha.date:=DM1.cdsQRY.Fieldbyname('CNTFREG').asdatetime;
         edtperiodo.Text:=DM1.cdsQRY.Fieldbyname('PERIODO').asstring;
         dtpFechaExit(sender);

         Exit;
   End;
 End;
end;

procedure TFAjusteInflacion1.dblcCIAClick(Sender: TObject);
begin
dblcCIAExit(sender);
end;

procedure TFAjusteInflacion1.dblcTDiarioClick(Sender: TObject);
begin
dblcTDiarioExit(sender);
end;

procedure TFAjusteInflacion1.pprSconsolidadoPreviewFormCreate(
  Sender: TObject);
begin
   pprSconsolidado.PreviewForm.ClientHeight := 500;
   pprSconsolidado.PreviewForm.ClientWidth  := 650;
   TppViewer(pprSconsolidado.PreviewForm.Viewer).ZoomSetting := zsPagewidth;

end;

procedure TFAjusteInflacion1.pprSustentoPreviewFormCreate(Sender: TObject);
begin
   pprSustento.PreviewForm.ClientHeight := 500;
   pprSustento.PreviewForm.ClientWidth  := 650;
   TppViewer(pprSustento.PreviewForm.Viewer).ZoomSetting := zsPagewidth;

end;

procedure TFAjusteInflacion1.pprResumenPreviewFormCreate(Sender: TObject);
begin
   pprResumen.PreviewForm.ClientHeight := 500;
   pprResumen.PreviewForm.ClientWidth  := 650;
   TppViewer(pprResumen.PreviewForm.Viewer).ZoomSetting := zsPagewidth;

end;

procedure TFAjusteInflacion1.pprComprobPreviewFormCreate(Sender: TObject);
begin
   pprComprob.PreviewForm.ClientHeight := 500;
   pprComprob.PreviewForm.ClientWidth  := 650;
   TppViewer(pprComprob.PreviewForm.Viewer).ZoomSetting := zsPagewidth;

end;

end.
