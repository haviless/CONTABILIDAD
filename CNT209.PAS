unit CNT209;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppDB, ppDBPipe, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, ComCtrls, StdCtrls, wwdblook,
  Buttons, ExtCtrls, Wwdbigrd, Grids, Wwdbgrid, Db, DBClient, wwclient;

type
  TFAjusteInflacion = class(TForm)
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
    Label19: TLabel;
    edtAcumulado: TEdit;
    edtGlosa: TEdit;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    edtAcumuladoDescripcion: TEdit;
    edtTasa: TEdit;
    dtpFecha: TDateTimePicker;
    edtPeriodo: TEdit;
    gbAsiento: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCIA: TEdit;
    edtTDiario: TEdit;
    dblcCIA: TwwDBLookupCombo;
    dblcTDiario: TwwDBLookupCombo;
    edtComprobante: TEdit;
    edtCuentaREI: TEdit;
    cbTCambio: TComboBox;
    edtREIDescripcion: TEdit;
    pnlBotones: TPanel;
    lblAvance: TLabel;
    bbtnContab: TBitBtn;
    bbtnImprime: TBitBtn;
    bbtnGraba: TBitBtn;
    bbtnAcepta: TBitBtn;
    bbtnElimina: TBitBtn;
    prbAvance: TProgressBar;
    pprComprob: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel8: TppLabel;
    ppLabel20: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel21: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppLabel22: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel38: TppLabel;
    pplblCia: TppLabel;
    ppLabel9: TppLabel;
    ppDBText1: TppDBText;
    ppLabel14: TppLabel;
    ppLabel25: TppLabel;
    ppLabel41: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel39: TppLabel;
    ppDBText23: TppDBText;
    ppLabel35: TppLabel;
    ppDBText10: TppDBText;
    ppLabel33: TppLabel;
    ppDBText8: TppDBText;
    ppLabel45: TppLabel;
    ppDBText28: TppDBText;
    ppLabel12: TppLabel;
    ppDBText11: TppDBText;
    ppLabel36: TppLabel;
    ppDBText12: TppDBText;
    ppDBText2: TppDBText;
    pplblTMD: TppLabel;
    ppLabel4: TppLabel;
    pplblEstado: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText9: TppDBText;
    ppDBText25: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine7: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel3: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppdbComprob: TppDBPipeline;
    Label20: TLabel;
    pplblTDD: TppLabel;
    edtEstado: TLabel;
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
  private
    { Private declarations }
    wVRN_TipoCambio : shortstring;
    procedure TitleGrid();
  public
    { Public declarations }
    procedure CalcAjusteDiferencia();
    procedure CalcTotales();
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
  FAjusteInflacion: TFAjusteInflacion;

implementation

uses CNTDM;

{$R *.DFM}

procedure TFAjusteInflacion.dblcCiaExit(Sender: TObject);
var sSQL : string;
begin
	edtCia.Text:='';
	if dblcCia.Text<>'' then
      begin
		edtCia.Text := DM1.cdsCia.FieldByName('CIADES').AsString;
      sSQL := 'SELECT CIACTAREI, CIATDIAREI FROM TGE101 WHERE CIAID='+quotedStr(dblcCia.Text);
      DM1.cdsQry.Close;
      DM1.cdsQry.ProviderName:='prvCNT';
      DM1.cdsQry.DataRequest(sSQL);
      DM1.cdsQry.Open;
      edtCuentaREI.Text := DM1.cdsQry.fieldbyname('CIACTAREI').asString;
      edtAcumulado.Text := DM1.cdsQry.fieldbyname('CIATDIAREI').asString; //¿Exijo una explicacion?
      end;
end;

procedure TFAjusteInflacion.dblcTDiarioExit(Sender: TObject);
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
end;

procedure TFAjusteInflacion.dtpFechaExit(Sender: TObject);
var nAno, nMes, nDia : word;
   sAno, sMes : shortstring;
   sSQL : string;
begin
	decodedate( dtpFecha.date, nAno, nMes, nDia);
	if nMes <> 12 then
   begin
		ShowMessage('El mes tiene que ser diciembre');
      dtpFecha.SetFocus;
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
end;

procedure TFAjusteInflacion.bbtnCancClick(Sender: TObject);
begin
	DM1.cdsREIActivo.Active := false;
	DM1.cdsREIActivo.Active := false;
	DM1.cdsREI.Active := false;
	close;
end;

procedure TFAjusteInflacion.cbTCambioChange(Sender: TObject);
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
   sWhere := 'FECHA=' +quotedStr(datetostr(dtpFecha.date));
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
procedure TFAjusteInflacion.bbtnOkClick(Sender: TObject);
var sSQL : string;
	nAnyo, nMes, nDia : word;
	sAnyo, sMes, sDia : shortstring;
	sMaximo : shortstring;
   sComprobante : shortstring;
   lEstadoGrid : boolean;
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
   if edtTasa.Text = '0' then
   begin
		ShowMessage('Error en tipo de cambio');
      dtpFecha.OnExit(sender);
      cbTCambio.SetFocus;
      exit;
   end;

   TitleGrid;

   DM1.cdsREI.active := false;
   DM1.cdsREIPasivo.active := false;
   DM1.cdsREIActivo.active := false;
	decodeDate(dtpFecha.date, nAnyo, nMes, nDia);
	sAnyo := inttoStr(nAnyo);
	sDia := inttoStr(nDia); if nDia<10 then sDia := '0'+sDia;
	sMes := inttoStr(nMes); if nMes<10 then sMes := '0'+sMes;

   sSQL := 'SELECT DISTINCT CNTCOMPROB FROM CNT404'+
         ' WHERE SRPERIODO= '+quotedStr(edtPeriodo.text) +
            ' AND TDIARID='+quotedStr(dblcTDiario.text) +
            ' AND CIAID='+quotedStr(dblcCIA.text);
   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:='prvREI';
   DM1.cdsQry.DataRequest(sSQL);
   DM1.cdsQry.Open;
   sComprobante := DM1.cdsQry.fieldbyName('CNTCOMPROB').asString;

   if sComprobante = '' then
   begin
      //Aumentar el correlativo, con el maximo+1 a traves de UltimoNum de una tabla de movimientos por un campo determinado
      sMaximo := DM1.UltimoNum('prvCNT', 'TGE301', 'NUMERO', '') ;
      sSQL := 'INSERT INTO TGE301 (CIAID, TDIARID, ANO, MES, NUMERO) '+
                  'VALUES ('''+
                        dblcCIA.text +''','''+ dblcTDiario.text +''','+'''' + sAnyo +''','''+ sMes	+''','+ sMaximo +
                  ')';
      DM1.DCOM1.AppServer.EjecutaQry(sSQL);
      edtComprobante.Text := DM1.strzero(sMaximo, 10);

      // Seleccionar a los NO monetarios, CON ULTIMA CUENTA Y QUE SEAN IMPUTABLES
      // (que contenga los factores de ajueste por periodo)
{
      sSQL := 'INSERT INTO CNT404 ( '+
                     'CNT404.CIAID, CNT404.TDIARID, CNT404.CUENTAID, CNT404.SRPERIODO, '+
                     'CNT404.CLAUXID, CNT404.AUXID, CNT404.CCOSID, '+
                     'CNT404.SRTIPOCTA, CNT404.SALDMNAC, CNT404.SALDMEXT, '+
                     'CNT404.AJUSMNAC, CNT404.AJUSMEXT, CNT404.DIFEMNAC, '+
                     'CNT404.DIFEMEXT, CNTCOMPROB )'+
                  ' select DISTINCT '+
                        ' CNT401.CIAID, ' +quotedStr(dblcTDiario.Text)+ ', CNT401.CUENTAID, '+quotedStr(edtPeriodo.text)+ ', '+
                        ' CNT401.CLAUXID, CNT401.AUXID, CNT401.CCOSID, '+
                        ' TGE202.CTA_GYP, '+
                        ' '+wReplacCeros+'(CNT401.SALDMN12, 0)+('+wReplacCeros+'(CNT401.DEBEMN12, 0)-'+wReplacCeros+'(CNT401.HABEMN12, 0)), '+
                        ' '+wReplacCeros+'(CNT401.SALDME12, 0)+('+wReplacCeros+'(CNT401.DEBEME12, 0)-'+wReplacCeros+'(CNT401.HABEME12, 0)), '+
                        ' 0, 0, 0, 0, '''+ edtComprobante.Text + ''''+
                     ' from CNT401, TGE202'+
                     ' LEFT JOIN TGE202 ON (TGE202.CUENTAID = CNT401.CUENTAID AND TGE202.CIAID = CNT401.CIAID)'+
                     ' WHERE'+
                        ' CNT401.CIAID = ' +quotedStr(dblcCia.text)+
                           ' AND TGE202.CTA_MOV =' +quotedStr('S')+
                           ' AND TGE202.CTA_CIER=' +quotedStr('S')+
                           ' AND (TGE202.CTA_GYP = ''A'' OR TGE202.CTA_GYP = ''P'')';
}
//COMENTE LO ANTERIOR POR QURE EL SQL NO FUNCIONABA
      if (SRV_D = 'DB2NT') or
         (SRV_D = 'DB2400') then
      begin
      sSQL := 'INSERT INTO CNT404 ( '+
                     'CIAID, TDIARID, CUENTAID, SRPERIODO, '+
                     'CLAUXID, AUXID, CCOSID, '+
                     'SRTIPOCTA, SALDMNAC, SALDMEXT, '+
                     'AJUSMNAC, AJUSMEXT, DIFEMNAC, '+
                     'DIFEMEXT, CNTCOMPROB )'+
                  ' select DISTINCT '+
                        ' CNT401.CIAID, ' +quotedStr(dblcTDiario.Text)+ ', CNT401.CUENTAID, '+quotedStr(edtPeriodo.text)+ ', '+
                        ' CNT401.CLAUXID, CNT401.AUXID, CNT401.CCOSID, '+
                        ' TGE202.CTA_GYP, '+
                        ' '+wReplacCeros+'(CNT401.SALDMN12, 0)+('+wReplacCeros+'(CNT401.DEBEMN12, 0)-'+wReplacCeros+'(CNT401.HABEMN12, 0)), '+
                        ' '+wReplacCeros+'(CNT401.SALDME12, 0)+('+wReplacCeros+'(CNT401.DEBEME12, 0)-'+wReplacCeros+'(CNT401.HABEME12, 0)), '+
                        ' 0, 0, 0, 0, '''+ edtComprobante.Text + ''''+
                     ' from CNT401'+
                     ' LEFT JOIN TGE202 ON (TGE202.CUENTAID = CNT401.CUENTAID AND TGE202.CIAID = CNT401.CIAID)'+
                     ' WHERE'+
                        ' CNT401.CIAID = ' +quotedStr(dblcCia.text)+
                           ' AND TGE202.CTA_MOV =' +quotedStr('S')+
                           ' AND TGE202.CTA_CIER=' +quotedStr('S')+
                           ' AND (TGE202.CTA_GYP = ''A'' OR TGE202.CTA_GYP = ''P'')';
      end
      else
       if SRV_D = 'ORACLE' then
        begin
             sSQL := 'INSERT INTO CNT404 ( '+
                     'CIAID, TDIARID, CUENTAID, SRPERIODO, '+
                     'CLAUXID, AUXID, CCOSID, '+
                     'SRTIPOCTA, SALDMNAC, SALDMEXT, '+
                     'AJUSMNAC, AJUSMEXT, DIFEMNAC, '+
                     'DIFEMEXT, CNTCOMPROB )'+
                  ' select DISTINCT '+
                        ' CNT401.CIAID, ' +quotedStr(dblcTDiario.Text)+ ', CNT401.CUENTAID, '+quotedStr(edtPeriodo.text)+ ', '+
                        ' CNT401.CLAUXID, CNT401.AUXID, CNT401.CCOSID, '+
                        ' TGE202.CTA_GYP, '+
                        ' '+wReplacCeros+'(CNT401.SALDMN12, 0)+('+wReplacCeros+'(CNT401.DEBEMN12, 0)-'+wReplacCeros+'(CNT401.HABEMN12, 0)), '+
                        ' '+wReplacCeros+'(CNT401.SALDME12, 0)+('+wReplacCeros+'(CNT401.DEBEME12, 0)-'+wReplacCeros+'(CNT401.HABEME12, 0)), '+
                        ' 0, 0, 0, 0, '''+ edtComprobante.Text + ''''+
                     ' from CNT401,TGE202'+
                     ' WHERE'+
                        ' CNT401.CIAID = ' +quotedStr(dblcCia.text)+
                           ' AND TGE202.CTA_MOV =' +quotedStr('S')+
                           ' AND TGE202.CTA_CIER=' +quotedStr('S')+
                           //' AND (TGE202.CTA_GYP = ''A'' OR TGE202.CTA_GYP = ''P'')'+
                           ' AND (TGE202.CTA_GYP = ''R'' OR TGE202.CTA_GYP = ''P'')'+
                           ' AND (TGE202.CUENTAID(+) = CNT401.CUENTAID '+
                           ' AND TGE202.CIAID(+) = CNT401.CIAID) ';

        end;

      try
        DM1.DCOM1.AppServer.EjecutaQry(sSQL);
      except
      end ;
      DM1.cdsREI.Active := true;
      CalcAjusteDiferencia();
      //
      DM1.Filtracds( DM1.cdsREI, 'SELECT * FROM CNT404 WHERE CNTCOMPROB='''+edtComprobante.text+''''  );
      //
   end //if DM1.DisplayDescrip('prvREI', 'CNT404', 'CIAID', sFiltro, 'COMPROB') <> ''
   else
   begin
      //Ya existe un calculo para este periodo, necesito la fecha de la consulta
      edtComprobante.Text := DM1.strzero(sComprobante, 10);;
      sSQL := 'SELECT * FROM CNT300 where CNTCOMPROB=''' +edtComprobante.Text+ '''';
      DM1.cdsQry.Close;
      DM1.cdsQry.ProviderName:='prvCNT';
      DM1.cdsQry.DataRequest(sSQL);
      DM1.cdsQry.Open;
      if DM1.cdsQry.fieldbyName('CNTCOMPROB').asString <> '' then
         dtpFecha.DateTime := EncodeDate(DM1.cdsQry.fieldbyName('CNTANO').asInteger, DM1.cdsQry.fieldbyName('CNTMM').asInteger, DM1.cdsQry.fieldbyName('CNTDD').asInteger);
      DM1.cdsREI.Active := true;
   end;
   prbAvance.Position := 0;
   lEstadoGrid := false;

	if DM1.cdsREI.RecordCount > 0 then
   begin
      DM1.cdsREI.DisableControls;
      CalcTotales();

      sSQL := 'SELECT * FROM CNT404 WHERE CNTCOMPROB='+ quotedStr(edtComprobante.Text) +
                     ' AND SRPERIODO='+ quotedStr(edtPeriodo.text)+
                     ' AND SRTIPOCTA='+ quotedStr('A');
      DM1.cdsREIActivo.Close;
      DM1.cdsREIActivo.ProviderName := 'prvREI';
      DM1.cdsREIActivo.DataRequest(sSQL);
      DM1.cdsREIActivo.Open;
      sSQL := 'SELECT * FROM CNT404 WHERE CNTCOMPROB='+ quotedStr(edtComprobante.Text) +
                     ' AND SRPERIODO='+ quotedStr(edtPeriodo.text)+
                     ' AND SRTIPOCTA='+ quotedStr('P');
      DM1.cdsREIPasivo.Close;
      DM1.cdsREIPasivo.ProviderName := 'prvREI';
      DM1.cdsREIPasivo.DataRequest(sSQL);
      DM1.cdsREIPasivo.Open;

      sSQL := 'SELECT CNTESTADO, CNTCUADRE FROM CNT300 WHERE CNTCOMPROB='+quotedStr(edtComprobante.text);
      DM1.cdsQry.Close;
      DM1.cdsQry.ProviderName:='prvCNT';
      DM1.cdsQry.DataRequest(sSQL);
      DM1.cdsQry.Open;
      EnaDisAble( DM1.cdsQry.FieldbyName('CNTCUADRE').asString, DM1.cdsQry.fieldByName('CNTESTADO').asstring ) ;
		lEstadoGrid := true;
		end;

   bbtnImprime.Enabled := lEstadoGrid;
	DM1.cdsREIActivo.Active := lEstadoGrid;
	DM1.cdsREIPasivo.Active := lEstadoGrid;
	if lEstadoGrid then
		begin
		if DM1.cdsREIActivo.RecordCount > 0 then tabActivo.Caption := 'Ac&tivo*';
		if DM1.cdsREIPasivo.RecordCount > 0 then tabPasivo.Caption := 'Pa&sivo*';
		end;
//   bbtnOK.Enabled := false;
   DM1.cdsREI.EnableControls;
   DM1.cdsREIActivo.EnableControls;
   DM1.cdsREIPasivo.EnableControls;
end;

//------------------------------------------------------------------------
// Nombre....: CalcAjusteDiferencia
// Parametros: Ninguno
// Objetivo..: Realiza el proceso de Calcular las diferencias, el ajuste y el saldo
//             ademas de realizar el cambio para los dos tipos de moneda extranjera
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion.CalcAjusteDiferencia();
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
procedure TFAjusteInflacion.CalcTotales();
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
procedure TFAjusteInflacion.bbtnEliminaClick(Sender: TObject);
var sSQL : string;
begin
   //if MessageDlg(' ¿Esta seguro de Eliminar? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
   if MessageDlg(' ¿Esta seguro de Eliminar? ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
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
   EnaDisAble('','');
   edtEstado.caption := '';
//   bbtnOK.Enabled := true;
   bbtnElimina.Enabled := false;
   dblcTDiario.SetFocus;
end;

//------------------------------------------------------------------------
// Nombre....: Evento Click de bbtnImprime
// Parametros: Sender
// Objetivo..: Imprime el comprobante del calculo del REI para una Compañia, Diario, Periodo
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion.bbtnImprimeClick(Sender: TObject);
var sSQL : string;
begin

   sSQL := 'Select * from CNT301 WHERE '
               + 'CIAID='     +''''+ dblcCia.Text      +''''+' AND '
               + 'TDIARID='   +''''+ dblcTDiario.text  +''''+' AND '
               + 'CNTANOMM='  +''''+ edtPeriodo.text   +''''+' AND '
               + 'CNTCOMPROB='+''''+ edtComprobante.text+'''' ;

   DM1.cdsMovCNT1.DisableControls;
   DM1.cdsMovCNT1.Active:=true;
   DM1.cdsMovCNT1.Close;
   DM1.cdsMovCNT1.ProviderName:='prvCabCNT';
//   DM1.cdsMovCNT1.ProviderName:='prvMovCNT';
   DM1.cdsMovCNT1.DataRequest(sSQL);
   DM1.cdsMovCNT1.Open;
   if DM1.cdsMovCNT1.RecordCount < 1 then
   begin
		ShowMessage('No existen registro para este calculo');
      exit;
   end;

   if DM1.cdsMOVCNT1.FieldByName('CNTCUADRE').AsString='S' then  pplblEstado.Text:='Contabilizado'
   else begin
      if DM1.cdsMOVCNT1.FieldByName('CNTESTADO').AsString='A' then pplblEstado.Text:='Anulado';
      if DM1.cdsMOVCNT1.FieldByName('CNTESTADO').AsString='P' then pplblEstado.Text:='Aceptado';
      if DM1.cdsMOVCNT1.FieldByName('CNTESTADO').AsString='I' then pplblEstado.Text:='Activo';
   end;
   pplblCia.Text:=edtCia.Text;

   pplblTDD.Caption:=edtTDiario.Text;
   pplblTMD.Caption:='Dolar';
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
procedure TFAjusteInflacion.bbtnAceptaClick(Sender: TObject);
var
	i : byte;
	sSQL : string;
	nSalto : Word;
	nDia, nMes, nAnyo : word;
	sDatosCab, sDatosDet : string;
	sCabecera, sDetalle : string;
	sDia, sMes, sAnyo : shortstring;
	aDeHa : array[1..6] of shortstring;
   sBimestre, sTrimestre : shortstring;
	nREIBalance, nATotal, nPTotal : DOUBLE;
begin
   //if MessageDlg('Aceptar Comprobante'+chr(13)+chr(13)+'  ¿ Esta Seguro ?  ', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
   if MessageDlg('Aceptar Comprobante'+chr(13)+chr(13)+'  ¿ Esta Seguro ?  ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;

   DM1.cdsQry.DisableControls;
   sSQL := 'select CNTESTADO, CNTCUADRE from CNT300 WHERE CNTCOMPROB = '''+ edtComprobante.Text +'''';
   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:='prvCabCNT';
   DM1.cdsQry.DataRequest(sSQL);
   DM1.cdsQry.Open;
   If DM1.cdsCabCnt.FieldByName('CNTESTADO').AsString='I' then
      if MessageDlg('Este comprobante ya fue Generado,'+chr(10)+chr(13)+
                    ' Realizar este proceso otra vez  '+chr(10)+chr(13)+
                    '         ¿ Esta Seguro ?         ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
         exit;
   if DM1.cdsQry.fieldbyName('CNTESTADO').asString = 'P' then
      raise exception.Create(' Error:  Registro Ya Fue Aceptado ');
   if DM1.cdsQry.fieldbyName('CNTCUADRE').asString = 'S' then
   begin
      ShowMessage(' Error:  Asiento ya fue Contabilizado ');
      raise exception.Create(' Error:  Asiento ya fue Contabilizado ');
   end ;
   DM1.cdsQry.EnableControls;

	prbAvance.Position := 0; lblAvance.Caption := 'Generacion de Tabla REI';	prbAvance.Position := 5;

	//Proceso en Si
	prbAvance.Position := 15;

	sCabecera := 'CNTDEBEMN, CNTDEBEME, CNTHABEMN,  CNTHABEME, CNTSALDMN, CNTSALDME,'+
                  'CIAID,   TDIARID,   CNTCOMPROB, CNTANOMM,  CNTESTADO, CNTANO, '+
                  'CNTMM,   CNTDD,     CNTTCAMBIO, CNTGLOSA,  CNTTS,     CNTTRI, '+
                  'CNTSEM,  CNTFREG,   CNTHREG,    TDIARDES';

	sDetalle :=	'CNTDH, CUENTAID, CLAUXID, AUXID, CCOSID'+ ','+
                  sCabecera;

	nATotal := 0;	nPTotal := 0;
	decodeDate(dtpFecha.date, nAnyo, nMes, nDia);
   sAnyo := inttoStr(nAnyo);
   sMes  := DM1.StrZero ( inttoStr(nMes), 2);
   sDia  := DM1.StrZero ( inttoStr(nDia), 2);
   sTrimestre := floattoStr(trunc((nMes/3) + 0.9));
   sBimestre :=  floattoStr(trunc((nMes/2) + 0.9));

   DM1.cdsREI.DisableControls;
   sSQL := 'SELECT * FROM CNT404 WHERE CNTCOMPROB='+quotedStr(edtComprobante.Text);
   DM1.cdsREI.Close;
   DM1.cdsREI.ProviderName:='prvCNT';
   DM1.cdsREI.DataRequest(sSQL);
   DM1.cdsREI.Open;
   DM1.cdsREI.active:=true;
   DM1.cdsREI.First;
	nSalto := trunc(75/DM1.cdsREI.RecordCount);
	while (not DM1.cdsREI.Eof) do begin

      sDatosCab := quotedStr(dblcCia.text)   + ', '+
               quotedStr(dblcTDiario.Text)   + ', '+
               quotedStr(edtComprobante.Text)+', ' +
               quotedStr(edtPeriodo.Text)    +',' +
               quotedStr(DM1.cdsREI.FieldByName('SRTIPOCTA').asstring)+ ', '+
               quotedStr(sAnyo)              + ', '+
               quotedStr(sMes)               + ', '+
               quotedStr(sDia)               + ', '+
               edtTasa.text                  + ', '+
               quotedStr(edtGlosa.Text)      + ', '+
               quotedStr(wVRN_TipoCambio)    + ', '+
               quotedStr(sTrimestre)         + ', '+
               quotedStr(sBimestre)          + ', '+
               wRepFecServi                  + ', '+
               wRepHorServi                  + ', '+
               quotedStr(copy(edtTDiario.text,0,6));
      sDatosDet:= quotedStr(DM1.cdsREI.FieldByName('clAuxID').asstring) +', '+
                  quotedStr(DM1.cdsREI.FieldByName('AuxID').asstring)   +', '+
                  quotedStr(DM1.cdsREI.FieldByName('ccosID').asstring)  ;

		if DM1.cdsREI.FieldByName('SRTIPOCTA').asstring = 'A' then
			begin
			//Insertar Detalle: Activo NO MONETARIO en el DEBE
			nATotal := nATotal + DM1.cdsREI.FieldByName('DIFEMNAC').asFloat;
			FillChar(aDeHa, SizeOf(aDeHa), '0');
			aDeHa[1] := DM1.cdsREI.FieldByName('DIFEMNAC').asstring;
			aDeHa[2] := DM1.cdsREI.FieldByName('DIFEMEXT').asstring;
			sSQL := 'INSERT INTO CNT301 ('+sDetalle+') VALUES (';
            sSQL := sSQL + '''D'','''+ DM1.cdsREI.FieldByName('CUENTAID').asstring  +''','+ sDatosDet +',' ;
            for i :=1 to 6 do sSQL := sSQL + aDeHa[i] +', ';
            sSQL := sSQL + sDatosCab +	')';
			DM1.DCOM1.AppServer.EjecutaQry(SSQL);

			//Insertar Detalle: REI en el HABER
			FillChar(aDeHa, SizeOf(aDeHa), '0');
			aDeHa[3] := DM1.cdsREI.FieldByName('DIFEMNAC').asstring;
			aDeHa[4] := DM1.cdsREI.FieldByName('DIFEMEXT').asstring;
			sSQL := 'INSERT INTO CNT301 ('+sDetalle+') VALUES (';
            sSQL := sSQL + '''H'','''+ edtCuentaREI.text +''','+ sDatosDet +',' ;
            for i :=1 to 6 do sSQL := sSQL + aDeHa[i] +',';
            sSQL := sSQL + sDatosCab + ')';
			DM1.DCOM1.AppServer.EjecutaQry(SSQL);
			end
		else  //SRTIPOCTA = 'P'
			begin
			nPTotal := nPTotal + strtoFloat(DM1.cdsREI.FieldByName('DIFEMNAC').asstring);

			//Insertar Detalle: Activo NO MONETARIO en el DEBE
			FillChar(aDeHa, SizeOf(aDeHa), '0');
			aDeHa[3] := DM1.cdsREI.FieldByName('DIFEMNAC').asstring;
			aDeHa[4] := DM1.cdsREI.FieldByName('DIFEMEXT').asstring;
			sSQL := 'INSERT INTO CNT301 ('+sDetalle+') VALUES (';
            sSQL := sSQL + '''H'','''+ DM1.cdsREI.FieldByName('CUENTAID').asstring +''','+ sDatosDet +',' ;
            for i :=1 to 6 do sSQL := sSQL + aDeHa[i] +',';
            sSQL := sSQL + sDatosCab + ')';
			DM1.DCOM1.AppServer.EjecutaQry(SSQL);
			//Insertar Detalle: REI en el HABER
			FillChar(aDeHa, SizeOf(aDeHa), '0');
			aDeHa[1] := DM1.cdsREI.FieldByName('DIFEMNAC').asstring;
			aDeHa[2] := DM1.cdsREI.FieldByName('DIFEMEXT').asstring;

			sSQL := 'INSERT INTO CNT301 ('+sDetalle+') VALUES (';
            sSQL := sSQL + '''D'','''+ edtCuentaREI.text +''','+ sDatosDet +',' ;
            for i :=1 to 6 do sSQL := sSQL + aDeHa[i] +',' ;
            sSQL := sSQL + sDatosCab +	')';
			DM1.DCOM1.AppServer.EjecutaQry(sSQL);
			end; //else
      DM1.cdsREI.Next;
      prbAvance.Position := prbAvance.Position + nSalto;

   end; //	while (not DM1.cdsREI.Eof)
   DM1.cdsREI.enableControls;

   //Actualizar la cabecera
	sSQL := 'INSERT INTO CNT300 ('+sCabecera+') VALUES (' +
               floattoStr(abs(nPTotal+nATotal)) +','+
               floattoStr(abs(nPTotal+nATotal)/strtoFloat(edtTasa.text)) +
               ', 0, 0, 0, 0, ' +
               sDatosCab +
				')';
	DM1.DCOM1.AppServer.EjecutaQry(sSQL);

   //Actualizar la diferencia de los pasivos
	nREIBalance := abs(strtoFloat(edtADiferencia.text)) - abs(strtoFloat(edtPDiferencia.text));
	if nREIBalance < 0 then // Diferencia de los pasivos
		begin
      FillChar(aDeHa, SizeOf(aDeHa), '0');
      aDEHa[1] := floattoStr( abs( nREIBalance ) );
      aDEHa[2] := floattoStr( abs( nREIBalance / strtoFloat(edtTasa.text) ) );
		sSQL := 'insert into CNT301 ('+sDetalle+') values(';
         sSQL := sSQL + '''H'', '''+ edtAcumulado.Text +''','+ sDatosDet + ',';
         for i :=1 to 6 do sSQL := sSQL + aDeHa[i] +',' ;
         sSQL := sSQL + sDatosCab +
                        ')';
      DM1.DCOM1.AppServer.EjecutaQry(SSQL);

      FillChar(aDeHa, SizeOf(aDeHa), '0');
      aDEHa[3] := floattoStr( abs( nREIBalance ) );
      aDEHa[4] := floattoStr( abs( nREIBalance / strtoFloat(edtTasa.text) ) );
		sSQL := 'insert into CNT301 ('+sDetalle+') values(';
         sSQL := sSQL + '''D'',''' + edtCuentaREI.Text +''','+ sDatosDet +',' ;
         for i :=1 to 6 do sSQL := sSQL + aDeHa[i] +',' ;
         sSQL := sSQL + sDatosCab +
                        ')';
		DM1.DCOM1.AppServer.EjecutaQry(SSQL);
		end
	else
		begin
      FillChar(aDeHa, SizeOf(aDeHa), '0');
      aDEHa[1] := floattoStr( abs( nREIBalance ) );
      aDEHa[2] := floattoStr( abs( nREIBalance / strtoFloat(edtTasa.text) ) );
		sSQL := 'insert into CNT301 ('+sDetalle+') values(';
         sSQL := sSQL + '''H'',''' + edtCuentaREI.Text +''','+ sDatosDet +',' ;
         for i :=1 to 6 do sSQL := sSQL + aDeHa[i] +',' ;
         sSQL := sSQL + sDatosCab + ')';
		DM1.DCOM1.AppServer.EjecutaQry(SSQL);
      FillChar(aDeHa, SizeOf(aDeHa), '0');
      aDEHa[3] := floattoStr( abs( nREIBalance ) );
      aDEHa[4] := floattoStr( abs( nREIBalance / strtoFloat(edtTasa.text) ) );
		sSQL := 'insert into CNT301 ('+sDetalle+') values(';
         sSQL := sSQL + '''D'', '''+ edtAcumulado.Text +''','+ sDatosDet + ',';
         for i :=1 to 6 do sSQL := sSQL + aDeHa[i] +',' ;
         sSQL := sSQL + sDatosCab + ')';
      DM1.DCOM1.AppServer.EjecutaQry(sSQL);
		end;
	prbAvance.Position := 100;	lblAvance.Caption := '';	prbAvance.Position := 0;

   sSQL:='update CNT300 set CNTESTADO=''I''';   DM1.DCOM1.AppServer.EjecutaQry(sSQL);
   sSQL:='update CNT301 set CNTESTADO=''I''';   DM1.DCOM1.AppServer.EjecutaQry(sSQL);
   EnaDisAble('','I');     //I:Activo
   bbtnAcepta.enabled := false;
end;

//------------------------------------------------------------------------
// Nombre....: MuestraEstado
// Parametros: xMovEstado : string --> 'P':Aceptado, 'I':Activo, 'A': Anulado
//             xMovConta : string  --> 'S': Ya contabilizado
// Objetivo..: Dependiendo del estado de los parametros se visualizara un mensaje bien definido bajo un determinado
//             color, el mensaje a visualizar se mandara en edtEstado
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion.MuestraEstado( xMovEstado, xMovConta : string ) ;
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
procedure TFAjusteInflacion.EnaDisAble(cCuadre, cEstado : string);
begin
   if ( cCuadre='S' ) or ( cEstado='A' ) or ( cEstado='P' ) then
      begin
      if cEstado='A' then
         begin
         MuestraEstado( 'A', '' );
         bbtnElimina.Enabled:= False;
         bbtnGraba.Enabled  := False;
         bbtnAcepta.Enabled := False;
         bbtnContab.Enabled := False;
         ShowMessage(' Registro Fue ANULADO ')
      end;
      if (cEstado='P') and (cCuadre<>'S') then
         begin
         MuestraEstado('P','');
         bbtnElimina.Enabled:= true;
         bbtnGraba.Enabled  := False;
         bbtnAcepta.Enabled := False;
         bbtnContab.Enabled := True;
         ShowMessage(' Registro Fue Aceptado ');
         end;
      if cCuadre='S' then
         begin
         MuestraEstado('','S');
         bbtnElimina.Enabled:= true;
         bbtnGraba.Enabled  := False;
         bbtnAcepta.Enabled := False;
         bbtnContab.Enabled := False;
         ShowMessage(' Registro Fue Contabilizado ');
         end;
   end
      else begin // en caso q' no sea Contabilizado, Aceptado (P) o Anulado
              // se asume que es I=Incompleto o Activo
      MuestraEstado('I','');
      bbtnElimina.Enabled := True;
      bbtnAcepta.Enabled  := True;
      bbtnGraba.Enabled   := True;
      end;
end;

procedure TFAjusteInflacion.FormActivate(Sender: TObject);
var nAnyo, nTemp : word;
begin
	DecodeDate ( now, nAnyo, nTemp, nTemp);
	dtpFecha.DateTime := EncodeDate(nAnyo, 12, 31);
        dtpFecha.OnExit(sender);

	bbtnGraba.enabled := false;
	bbtnAcepta.enabled := false;
	bbtnContab.enabled := false;
	bbtnElimina.enabled := false;
   bbtnImprime.Enabled := false;
end;

//------------------------------------------------------------------------
// Nombre....: Evento Click de bbtnGraba
// Parametros: Sender
// Objetivo..: Graba el componentes del REI, se asume que ya se ha hecho el calculo, lo unico que hace este proceso es
//             cambiar el flag CNTESTADO a un valor de 'P'
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion.bbtnGrabaClick(Sender: TObject);
var sSQL : string;
begin

   if MessageDlg('Grabar Comprobante'+chr(13)+chr(13)+'  ¿ Esta Seguro ?  ', mtConfirmation, [mbYes, mbNo], 0)<>mrYes then
      exit;

   If DM1.cdsCabCnt.FieldByName('CNTESTADO').AsString='P' then
   begin
      ShowMessage(' Error:  Registro Ya Fue Aceptado ');
      raise exception.Create(' Error:  Registro Ya Fue Aceptado ');
   end ;

   If DM1.cdsCabCnt.FieldByName('CNTCUADRE').AsString='S' then
   begin
      showmessage(' Error:  Asiento ya fue Contabilizado ');
      raise exception.Create(' Error:  Asiento ya fue Contabilizado ');
   end ;

   sSQL := 'update CNT300 set CNTESTADO = ''P'' WHERE CNTCOMPROB = '''+ edtComprobante.Text +'''';   DM1.DCOM1.AppServer.EjecutaQry(sSQL);
   sSQL := 'update CNT301 set CNTESTADO = ''P'' WHERE CNTCOMPROB = '''+ edtComprobante.Text +'''';   DM1.DCOM1.AppServer.EjecutaQry(sSQL);

   ShowMessage(' Comprobante Contable Aceptado ');
   EnaDisAble('', 'P' );
end;

//------------------------------------------------------------------------
// Nombre....: Evento Click de bbtnContab
// Parametros: Sender
// Objetivo..: Realiza el proceso de contabilizacion, pero este proceso se realiza en la rutina contabiliza, despues
//             actualiza el estado de CNTCUADRE a 'S'
// Fecha.....: 11.07.2000
//------------------------------------------------------------------------
procedure TFAjusteInflacion.bbtnContabClick(Sender: TObject);
var sSQL : string;
begin
   if MessageDlg('Contabilizar Comprobante'+chr(13)+chr(13)+'     ¿ Esta Seguro ?    ', mtConfirmation, [mbYes, mbNo], 0)<>mrYes then
      exit;

   If DM1.cdsCabCnt.FieldByName('CNTCUADRE').AsString='S' then
   begin
      ShowMessage(' Error:  Asiento ya fue Contabilizado ');
      raise exception.Create(' Error:  Asiento ya fue Contabilizado ');
   end ;

   if ( Contabiliza(dblcCia.Text, dblcTDiario.Text, edtPeriodo.text, edtComprobante.text) ) then
      begin
      sSQl := 'UPDATE CNT300 SET CNTCUADRE=''S'' WHERE CNTCOMPROB = '''+ edtComprobante.Text +'''';   DM1.DCOM1.AppServer.EjecutaQry(sSQL);
      sSQl := 'UPDATE CNT301 SET CNTCUADRE=''S'' WHERE CNTCOMPROB = '''+ edtComprobante.Text +'''';   DM1.DCOM1.AppServer.EjecutaQry(sSQL);
      EnaDisAble('S', '');
      end
   else
      ShowMessage('Asiento NO Contabilizado');
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
function TFAjusteInflacion.Contabiliza( xCia, xTDiario, xAnoMM, xNoComp : String ): Boolean;
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
function TFAjusteInflacion.DesContabiliza( xCia, xTDiario, xAnoMM, xNoComp : String ): Boolean;
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
procedure TFAjusteInflacion.GeneraEnLinea401( xxxCia,xxxDiario,xxxAnoMM,xxxNoComp, xxxSigno: String );
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
function TFAjusteInflacion.CuentaExiste( xxxxCia, xxxxAno, xxxxCuenta, xxxxAux,
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
procedure TFAjusteInflacion.InsertaMov( cCia, cAnoMM, cCuenta, cClAux, cAux, cCCosto,cDH,cMov,
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
procedure TFAjusteInflacion.ActualizaMov( cCia,cAnoMM,cCuenta,cClAux,cAux,cCCosto,cDH, cMov,
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


procedure TFAjusteInflacion.TitleGrid();
begin
   dbgActivo.Selected.Clear;
   dbgActivo.Selected.Add ('CUENTAID'#9'15'#9'CuentaID'#9'F');
   dbgActivo.Selected.Add ('CLAUXID'#9'3'#9'Clase~Auxiliar'#9'F');
   dbgActivo.Selected.Add ('AUXID'#9'9'#9'Auxiliar'#9'F');
   dbgActivo.Selected.Add ('CCOSID'#9'16'#9'Centro de~Costo'#9'F');
   dbgActivo.Selected.Add ('SALDMNAC'#9'10'#9'Saldo~Mon.Nac.'#9'F');
   dbgActivo.Selected.Add ('SALDMEXT'#9'10'#9'Saldo~Mon.Ext'#9'F');
   dbgActivo.Selected.Add ('AJUSMNAC'#9'10'#9'Ajuste~Mon.Nac.'#9'F');
   dbgActivo.Selected.Add ('AJUSMEXT'#9'10'#9'Ajuste~Mon.Ext'#9'F');
   dbgActivo.Selected.Add ('DIFEMNAC'#9'10'#9'Diferencia~Mon.Nac.'#9'F');
   dbgActivo.Selected.Add ('DIFEMEXT'#9'10'#9'Diferencia~Mon.Ext'#9'F');

   {dbgActivo.Selected.Add ('SRTIPOCTA'#9'1'#9'SRTIPOCTA'#9'F');
   dbgActivo.Selected.Add ('SRPERIODO'#9'6'#9'SRPERIODO'#9'F');
   dbgActivo.Selected.Add ('CNTCOMPROB'#9'10'#9'CNTCOMPROB'#9'F');
   dbgActivo.Selected.Add ('CIAID'#9'2'#9'CIAID'#9'F');
   dbgActivo.Selected.Add ('TDIARID'#9'2'#9'TDIARID'#9'F');}

   dbgPasivo.Selected.Clear;
   dbgPasivo.Selected.Add ('CUENTAID'#9'15'#9'CuentaID'#9'F');
   dbgPasivo.Selected.Add ('CLAUXID'#9'3'#9'Clase~Auxiliar'#9'F');
   dbgPasivo.Selected.Add ('AUXID'#9'9'#9'Auxiliar'#9'F');
   dbgPasivo.Selected.Add ('CCOSID'#9'16'#9'Centro de~Costo'#9'F');
   dbgPasivo.Selected.Add ('SALDMNAC'#9'10'#9'Saldo~Mon.Nac.'#9'F');
   dbgPasivo.Selected.Add ('SALDMEXT'#9'10'#9'Saldo~Mon.Ext'#9'F');
   dbgPasivo.Selected.Add ('AJUSMNAC'#9'10'#9'Ajuste~Mon.Nac.'#9'F');
   dbgPasivo.Selected.Add ('AJUSMEXT'#9'10'#9'Ajuste~Mon.Ext'#9'F');
   dbgPasivo.Selected.Add ('DIFEMNAC'#9'10'#9'Diferencia~Mon.Nac.'#9'F');
   dbgPasivo.Selected.Add ('DIFEMEXT'#9'10'#9'Diferencia~Mon.Ext'#9'F');
end;


procedure TFAjusteInflacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

End.
