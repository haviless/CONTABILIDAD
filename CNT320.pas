unit CNT320;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwDialog, wwrcdvw, Mask, wwdbdatetimepicker, Wwdbdlg, Grids, Wwdbigrd,
  Wwdbgrid, StdCtrls, Buttons, wwdbedit, wwdblook, ExtCtrls, wwSpeedButton,
  wwDBNavigator, DB, DBCtrls, wwClient, DBGrids, Spin, ppDB, ppBands,
  ppClass, ppCtrls, ppVar, ppPrnabl, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDBPipe, DBTables, ComCtrls, ppTypes, ppParameter, ppEndUsr;

type
  TFConsultaComprobante = class(TForm)
    pnlCabecera: TPanel;
    pnlDatosCab: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    pnlMovCNT: TPanel;
    dbgMovCNT: TwwDBGrid;
    bbtnGraba: TBitBtn;
    bbtnCanc2: TBitBtn;
    bbtnContab: TBitBtn;
    bbtnNuevo: TBitBtn;
    Label1: TLabel;
    dbeLote: TwwDBEdit;
    lblTDiario: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    Label15: TLabel;
    dtpFComp: TwwDBDateTimePicker;
    lblNoReg: TLabel;
    edtPeriodo: TEdit;
    Label11: TLabel;
    dblcTMon: TwwDBLookupCombo;
    Label12: TLabel;
    dbeTasa: TwwDBEdit;
    bbtnBorra: TBitBtn;
    bbtnOKCabec: TBitBtn;
    bbtnAnula: TBitBtn;
    bbtnAcepta: TBitBtn;
    Label14: TLabel;
    pnlMantComp: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    dblcClase: TwwDBLookupCombo;
    dblcdCCosto: TwwDBLookupComboDlg;
    edtAux: TEdit;
    dbeSerie: TDBEdit;
    dbeNodoc: TDBEdit;
    dblcTDoc: TwwDBLookupCombo;
    dblcdAux: TwwDBLookupComboDlg;
    dbeDH: TDBEdit;
    dbeGlosa: TDBEdit;
    dbdtpFEmis: TwwDBDateTimePicker;
    dbdtpFVcmto: TwwDBDateTimePicker;
    Panel1: TPanel;
    dbeTDoc: TDBEdit;
    Label19: TLabel;
    dbeCCosto: TDBEdit;
    dbeMonto: TwwDBEdit;
    dbeNoComp: TwwDBEdit;
    Label20: TLabel;
    pnlEstado: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    dbeMND: TDBEdit;
    dbeMED: TDBEdit;
    dbeMNDif: TDBEdit;
    dbeMEDif: TDBEdit;
    Label4: TLabel;
    dbeMNC: TDBEdit;
    dbeMEC: TDBEdit;
    Label25: TLabel;
    lblContab: TLabel;
    lblAceptado: TLabel;
    lblAnulado: TLabel;
    lblIncompleto: TLabel;
    cbTCambio: TComboBox;
    Label26: TLabel;
    bbtnImprime: TBitBtn;
    Label5: TLabel;
    dblcdCuenta: TwwDBLookupComboDlg;
    edtCuenta: TEdit;
    Label27: TLabel;
    dbeGlosaCab: TwwDBEdit;
    edtTMon: TEdit;
    Z2bbtnClose: TBitBtn;
    pnlBoton: TPanel;
    Z2bbtnEditSalir: TBitBtn;
    bbtnRegresa: TBitBtn;
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
    cbDisenoRep: TCheckBox;
    sbDisenoRep: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure IniciaDatos;
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dtpFCompExit(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure bbtnBorraClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgMovCNTIButtonClick(Sender: TObject);
    procedure bbtnGrabaClick(Sender: TObject);
    procedure bbtnCanc2Click(Sender: TObject);
    procedure MuestraEstado( xMovEstado, xMovConta : String ) ;

    procedure bbtnContabClick(Sender: TObject);
    Function AsientoCuadra: Boolean;
//    Function Contabiliza(xCia, xTDiario, xAnoMM, xNoComp:String): Boolean;
//    procedure GeneraEnLinea401( xxxCia,xxxDiario,xxxAnoMM,xxxNoComp: String );
//    function CuentaExiste(xxxxCia, xxxxAno, xxxxCuenta,
//                           xxxxAux, xxxxCCos : String ) : Boolean;
//    procedure ActualizaMov(cCia,cAnoMM,cCuenta,cClAux,cAux,cCCosto,cDH, cMov,
//                           cCtaDes,cAuxDes,cCCoDes:String; nImpMN,nImpME:DOUBLE);
//    procedure InsertaMov(cCia, cAnoMM, cCuenta, cClAux, cAux, cCCosto,cDH,cMov,
//                         cCtaDes,cAuxDes,cCCoDes:String; nImpMN,nImpME:DOUBLE);
//    procedure CreaPanel( xForma:TForm; xMensaje:String );
//    procedure PanelMsg( xMensaje:String; xProc:Integer );

    procedure bbtnAceptaClick(Sender: TObject);
    procedure MovCNTDataRequest;
    procedure bbtnNuevoClick(Sender: TObject);
    procedure bbtnAnulaClick(Sender: TObject);
    procedure dbeLoteExit(Sender: TObject);
    procedure dblcdCCostoExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure Z2bbtnEditSalirClick(Sender: TObject);
    procedure dblcdCuentaExit(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure dbgMovCNTDblClick(Sender: TObject);
    procedure dblcClaseExit(Sender: TObject);
    procedure dbeDHExit(Sender: TObject);
    procedure dbeMontoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TotalesResumen;
    procedure RegNuevoCab;
    procedure RegNuevo;
    procedure cbTCambioExit(Sender: TObject);
    procedure bbtnImprimeClick(Sender: TObject);
    procedure dbeGlosaExit(Sender: TObject);
    procedure Z2bbtnCloseClick(Sender: TObject);
    procedure pprComprobPreviewFormCreate(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }
    procedure RecuperaDescrip ;
  public
    pnlConta: TPanel;
    pbConta : TProgressBar;
    xForma  : TForm;
    xCrea   : Boolean;
    { Public declarations }
  end;

var
  FConsultaComprobante: TFConsultaComprobante;
  xSaldMNS, xSaldMES, xCuenta, xTDiario, xCtaDes, xTDiarDes, xSQL: string;
  xWhere, xDebeMN,xHabeMN,xDebeME,xHabeME, xSaldMN, xSaldME, xCia, xAno, xMes : String;
  xNoCompAx, xCampo, xGlosa: String;
  xTDebeMN, xTDebeME, xTHabeMN, xTHabeME : DOUBLE;
  xCompNew, xFlagCierre, xRegresa, xFlag, wIns, xCambiaFila : Boolean;
  xTCambio : DOUBLE;
  numreg, nn: Smallint;
  Year, Month, Day: Word;
//  xxRecNo: Integer;


implementation

uses CNTDM, ppViewr ;

{$R *.DFM}

procedure TFConsultaComprobante.FormActivate(Sender: TObject);
begin
	xCrea := True;
  Screen.Cursor:=crHourGlass;
  FConsultaComprobante.dblcCia := dblcCia;
  FConsultaComprobante.dblcTDiario := dblcTDiario;

  IniciaDatos;
  dblcCia.Text     := DMCNT.cdsCabCNT.fieldbyname('CIAID').AsString ;
  dblcTDiario.Text := DMCNT.cdsCabCnt.fieldbyname('TDIARID').AsString ;
  dtpFComp.date    := DMCNT.cdsCabCnt.fieldbyname('CNTFCOMP').AsDateTime ;
  edtPeriodo.Text  := DMCNT.cdsCabCnt.fieldbyname('CNTANOMM').AsString ;
  dbeNoComp.Text   := DMCNT.cdsCabCnt.fieldbyname('CNTCOMPROB').AsString ;
  dblcTMon.Text    := DMCNT.cdsCabCnt.fieldbyname('TMONID').AsString ;
  dbeTasa.Text     := DMCNT.cdsCabCnt.fieldbyname('CNTTCAMBIO').AsString ;
  dbeLote.Text     := DMCNT.cdsCabCnt.fieldbyname('CNTLOTE').AsString ;
  dbeGlosaCab.Text := DMCNT.cdsCabCnt.fieldbyname('CNTGLOSA').AsString ;

  xCampo          :=DMCNT.cdsCabCnt.FieldByName('CNTTS').AsString ;
  if xCampo='BV' then cbTCambio.ItemIndex:=0;
  if xCampo='BC' then cbTCambio.ItemIndex:=1;
  if xCampo='PV' then cbTCambio.ItemIndex:=2;
  if xCampo='PC' then cbTCambio.ItemIndex:=3;
  if xCampo='OV' then cbTCambio.ItemIndex:=4;
  if xCampo='OC' then cbTCambio.ItemIndex:=5;
  if xCampo='OT' then cbTCambio.ItemIndex:=6;
  RecuperaDescrip ;
  TotalesResumen;

  DMCNT.cdsMovCnt1.IndexFieldNames:='CiaId;TDiarId;CNTAnoMM;CNTComprob';
  MuestraEstado(DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString , DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString);
  DMCNT.cdsMovCnt1.IndexFieldNames:='CiaId;TDiarId;CNTAnoMM;CNTComprob;CNTREG';
  Screen.Cursor:=crDefault;  
  xCrea     := False;
end;

procedure TFConsultaComprobante.IniciaDatos;
begin
   wIns:=False;
   xFlag:=False;            // Indica si esta Contabilizado, Anulado o Aceptado
   xRegresa:=false;         // flag que controla regreso al panel de cabecera
   xFlagCierre:=False;
   xCompNew   :=False;

   dblcTMon.Text   :=DMCNT.wTMonLoc;      // Tipo de moneda
   numreg          :=0;
   dbeMND.Text     :='0';         dbeMNC.Text     :='0';
   dbeMED.Text     :='0';         dbeMEC.Text     :='0';
   dbeMNDif.Text   :='0';         dbeMEDif.Text   :='0';

//wmc0404   pnlCabecera.Enabled  := True;
   pnlDatosCab.Enabled  := True;
//wmc0404   pnlMovCNT.Enabled    := False;

   dbgMovCNT.ReadOnly   := False;

   dblcCia.Enabled      :=True;
   dtpFComp.Enabled     :=True;
   cbTCambio.Enabled    :=True;
   dbeTasa.Enabled      :=False;
   dblcTDiario.Enabled  :=True;
   dbeNoComp.Enabled    :=True;
   dblcTMon.Enabled     :=True;
//   dbeTasa.Enabled      :=True;

   bbtnOKCabec.Enabled  := True;
   bbtnBorra.Enabled    := True;
   bbtnAnula.Enabled    := False;
   bbtnNuevo.Enabled    := False;
   bbtnRegresa.Enabled  := False;
   bbtnAcepta.Enabled   := False;
   bbtnContab.Enabled   := False;
   bbtnGraba.Enabled    := False;
   bbtnCanc2.Enabled    := False;

   lblAnulado.Visible   := False;
   lblAceptado.Visible  := False;
   lblContab.Visible    := False;
   lblIncompleto.Visible:= False;

   dblcCia.Text    :='';                // Código de Compañía
   edtCia.Text     :='';                // Descripción de Compañía
   dblcTDiario.Text:='';                // Código de Tipo de Diario
   edtTDiario.Text :='';                // Descripción Tipo de Diario
   dbeLote.Text    :='';                // No. Lote
   dbeNoComp.Text  :='';                // No. Comprobante
   edtTMon.Text    :='';
   dbeTasa.Text    :='';                // Tipo de Cambio

end;

procedure TFConsultaComprobante.dblcCiaExit(Sender: TObject);
begin
   If xCrea then Exit;

   edtCia.Text:='';                                                    
   if dblcCia.Text<>'' then edtCia.Text:=DMCNT.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   end;
   dtpFCompExit(Sender);
end;

procedure TFConsultaComprobante.dtpFCompExit(Sender: TObject);
var
   xAno: Word;

begin
   xAno:=0;
   if xCrea then Exit;

   if dtpFComp.date=0 then begin
      ShowMessage('Registre la Fecha del Comprobante');
      dtpFComp.SetFocus;
      exit;
   end;

///Valida Periodo Cerrado... Inicio///
   xWhere :='CIAID='+''''+dblcCia.Text+''''
           +' and MODULO='+''''+'CNT'+''''
           +' and ANO='+''''+inttostr(xAno)+'''';
   if (dtpFComp.Date)<=(DMCNT.BuscaFecha('PrvTGE','TGE154','FECCIERRE',xWhere,'FECCIERRE')) then
   begin
      Showmessage('Periodo Cerrado... Se permite sólo '+chr(13)
                 +'    CONSULTA de Comprobantes');
      xFlagCierre:=True;
   end;
///Valida Periodo Cerrado... Fin  ///


   edtPeriodo.Text:= Copy(DateToStr(dtpFComp.Date),7,4)+Copy(DateToStr(dtpFComp.Date),4,2);

   if (length(edtTDiario.Text)>0) and (length(edtPeriodo.Text)=6) then
   begin
   // último número de comprobante incrementado en 1 para el tipo de diario escogido
      xWhere :='CIAID='+''''+dblcCia.Text+''''
              +' and TDIARID='+''''+dblcTDiario.Text+''''
              +' and ANO='+''''+copy(edtPeriodo.Text,1,4)+''''
              +' and MES='+''''+copy(edtPeriodo.Text,5,2)+'''';
      dbeNoComp.Text:=Inttostr(DMCNT.DisplayInteger('PrvTGE','TGE301','NUMERO',xWhere,'NUMERO')+1);
      dbeNoComp.Text:=DMCNT.strzero(dbeNoComp.Text,10);
      dbeNoComp.SetFocus;
   end;
end;

procedure TFConsultaComprobante.cbTCambioExit(Sender: TObject);
begin
   If xCrea then Exit;

///Determina campo tipo de cambio a aplicar
   xCampo:='';
   dbeTasa.Enabled:=False;
   if (cbTCambio.Text)='' then begin
      cbTCambio.ItemIndex:=0;
      xCampo:='BV';
   end
   else begin
      case cbTCambio.ItemIndex of
      0: xCampo:='BV';
      1: xCampo:='BC';
      2: xCampo:='PV';
      3: xCampo:='PC';
      4: xCampo:='OV';
      5: xCampo:='OC';
      6: begin
           xCampo:='OT';
           dbeTasa.Enabled:=True;
         end;
      end;
   end;

///Busca Tipo de Cambio de la Fecha///
   dbeTasa.Enabled:= False;
   if xCampo<>'OT' then begin
      xWhere := 'FECHA='+wRepFuncDate+''''+formatdatetime(wFormatFecha,dtpFComp.date)+''''+')';
      dbeTasa.Text:=Floattostr(DMCNT.DisplayReal('PrvTGE','TGE107','TCAMV'+xCampo,xWhere,'TCAMV'+xCampo));
      if (Length(dbeTasa.Text)=0) or (dbeTasa.Text='0') then begin
         ShowMessage('Error: Fecha NO Tiene Registrado el Tipo de Cambio');
         cbTCambio.SetFocus;
         Exit
      end;
 //   dbeTasa.Text:=Format('%8.2f',[strtoFloat(dbeTasa.Text)]);
      dbeLote.SetFocus;
   end
   else begin
      dbeTasa.TabOrder:=6;
      dbeTasa.Enabled :=True;
      dbeTasa.SetFocus;
   end
end;

procedure TFConsultaComprobante.dblcTDiarioExit(Sender: TObject);
begin
   If xCrea then Exit;

   with DMCNT do begin
      edtTDiario.Text:='';
      if dblcTDiario.Text<>'' then edtTDiario.Text:=DMCNT.cdsTDiario.FieldByName('TDIARDES').AsString;
      if length(edtTDiario.Text)=0 then
      begin
        ShowMessage('Falta Definición de Tipo de Diario');
        dblcTDiario.SetFocus;
      end;
//// Agregado para Filtros... Inicio
      if (wModo='C') or (wModo='M') then exit;
//// Agregado para Filtros
   end;
end;

procedure TFConsultaComprobante.dbeLoteExit(Sender: TObject);
begin
   If xCrea then Exit;
   if dbeLote.Text<>'' then dbeLote.Text:=DMCNT.strzero( dbeLote.Text,4);
end;

procedure TFConsultaComprobante.dblcTMonExit(Sender: TObject);
begin
   If xCrea then Exit;
   if bbtnBorra.Focused then bbtnBorraClick(Sender);
   edtTMon.Text    :='';
   xWhere := 'TMonId='+''''+dblcTMon.Text+'''';
   edtTMon.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE103','TMONDES',xWhere,'TMONDES');
//   if dblcTMon.Text<>'' then edtTMon.Text:=DMCNT.cdsTMonTMonDes.Text;
   if edtTMon.Text='' then
   begin
      ShowMessage('Falta Tipo de Moneda');
      dblcTMon.SetFocus;
   end;
end;

procedure TFConsultaComprobante.bbtnBorraClick(Sender: TObject);
begin
   DMCNT.cdsMovCnt1.CancelUpdates;
   DMCNT.wModo:='A';    //// Agregado para Filtros...
   IniciaDatos;
   dblcCia.SetFocus;
end;

procedure TFConsultaComprobante.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	DMCNT.cdsMovCnt1.FieldByName('CNTSERIE').ReadOnly:=False ;
  DMCNT.cdsMovCnt1.FieldByName('CNTNODOC').ReadOnly:=False ;
  if pnlMantComp.Visible then
  	Z2bbtnEditSalir.OnClick( Z2bbtnEditSalir ) ;
end;

procedure TFConsultaComprobante.RegNuevoCab;
begin
   if (DMCNT.cdsCabCNT.EOF) then DMCNT.cdsCabCNT.Insert else DMCNT.cdsCabCNT.Edit;
   DMCNT.cdsCabCNT.FieldByName('CIAID').AsString     := dblcCia.Text;
   DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString   := dblcTDiario.Text;
   DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString:= dbeNoComp.Text;
   DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString  := edtPeriodo.Text;
   DMCNT.cdsCabCNT.FieldByName('CNTLOTE').AsString   := dbeLote.Text;
   DMCNT.cdsCabCNT.FieldByName('CNTGLOSA').AsString  := dbeGlosaCab.Text;
   DMCNT.cdsCabCNT.FieldByName('TMONID').AsString    := dblcTMon.Text;
   DMCNT.cdsCabCNT.FieldByName('CNTTCAMBIO').AsFloat := xTCambio;
   DMCNT.cdsCabCNT.FieldByName('CNTTS').AsString     := xCampo;
   DMCNT.cdsCabCNT.FieldByName('CNTFCOMP').AsdateTime:= dtpFComp.Date;
   DMCNT.cdsCabCNT.FieldByName('CNTESTADO').AsString := 'I'; // I=Incompleto
   DMCNT.cdsCabCNT.FieldByName('CNTUSER').AsString   := DMCNT.wUsuario;    // usuario que registra
   DMCNT.cdsCabCNT.FieldByName('CNTFREG').AsDateTime := date;     // fecha que registra usuario
   DMCNT.cdsCabCNT.FieldByName('CNTHREG').AsDateTime := time;     // hora que registra usuario
   DMCNT.cdsCabCNT.FieldByName('CNTANO').AsString    := copy(edtPeriodo.Text,1,4);
   xWhere := 'FECHA='+wRepFuncDate+''''+formatdatetime(wFormatFecha,dtpFComp.date)+''''+')';
//   DMCNT.cdsCabCNTCNTAno.Value     := DMCNT.DisplayDescrip('PrvTGE','TGE114','*',xWhere,'FecAno');
//   if length(DMCNT.cdsCabCNTCNTAno.Value)>0 then
   if length(DMCNT.DisplayDescrip('PrvTGE','TGE114','*',xWhere,'FECANO'))>0 then
   begin
         DMCNT.cdsCabCNT.FieldByName('CNTMM').AsString   := DMCNT.cdsQry.fieldbyname('FECMES').AsString;       // mes
         DMCNT.cdsCabCNT.FieldByName('CNTDD').AsString   := DMCNT.cdsQry.fieldbyname('FECDIA').AsString;       // día
         DMCNT.cdsCabCNT.FieldByName('CNTTRI').AsString  := DMCNT.cdsQry.fieldbyname('FECTRIM').AsString;      // trimestre
         DMCNT.cdsCabCNT.FieldByName('CNTSEM').AsString  := DMCNT.cdsQry.fieldbyname('FECSEM').AsString;      // semestre
         DMCNT.cdsCabCNT.FieldByName('CNTSS').AsString   := DMCNT.cdsQry.fieldbyname('FECSS').AsString;       // semana
         DMCNT.cdsCabCNT.FieldByName('CNTAATRI').AsString:= DMCNT.cdsQry.fieldbyname('FECAATRI').AsString;    // año+trimestre
         DMCNT.cdsCabCNT.FieldByName('CNTAASEM').AsString:= DMCNT.cdsQry.fieldbyname('FECAASEM').AsString;    // año+semestre
         DMCNT.cdsCabCNT.FieldByName('CNTAASS').AsString := DMCNT.cdsQry.fieldbyname('FECAASS').AsString;     // año+semana
   end;
   DMCNT.cdsCabCnt.FieldByName('TDIARDES').AsString :=edtTDiario.Text;
   DMCNT.cdsCabCnt.FieldByName('CNTDEBEMN').AsFloat :=strtofloat(dbeMND.Text);
   DMCNT.cdsCabCnt.FieldByName('CNTHABEMN').AsFloat :=strtofloat(dbeMNC.Text);
   DMCNT.cdsCabCnt.FieldByName('CNTDEBEME').AsFloat :=strtofloat(dbeMED.Text);
   DMCNT.cdsCabCnt.FieldByName('CNTHABEME').AsFloat :=strtofloat(dbeMEC.Text);
end;

procedure TFConsultaComprobante.dbgMovCNTIButtonClick(Sender: TObject);
begin
   // xFlag.... Indica si esta Contabilizado o Anulado o Aceptado
   if xFlag or xFlagCierre then exit;   // Detalle no modificable
   wIns:=True;
//wmc0404   pnlMovCnt.Enabled:=False;
   pnlMantComp.Visible:=True;
   RegNuevo;
   dblcdCuenta.SetFocus;
end;

procedure TFConsultaComprobante.RegNuevo;
begin
   numreg:=numreg+1;
   edtCuenta.Text:='';
   edtAux.Text:='';
   dbeTDoc.Text:='';
   dbeCCosto.Text:='';
   // si numreg=1 es porque ya se hizo un Insert previo y ahora solo aplica Edit
   if numreg=1 then DMCNT.cdsMovCnt1.Edit else DMCNT.cdsMovCnt1.Insert;
   DMCNT.cdsMovCnt1.FieldByName('CIAID').AsString       := dblcCia.Text;
   DMCNT.cdsMovCnt1.FieldByName('TDIARID').AsString     := dblcTDiario.Text;
   DMCNT.cdsMovCnt1.FieldByName('CNTCOMPROB').AsString  := dbeNoComp.Text;
   DMCNT.cdsMovCnt1.FieldByName('CNTANO').AsString      := copy(edtPeriodo.Text,1,4);
   DMCNT.cdsMovCnt1.FieldByName('CNTANOMM').AsString    := edtPeriodo.Text;
   DMCNT.cdsMovCnt1.FieldByName('CNTLOTE').AsString     := dbeLote.Text;
   DMCNT.cdsMovCnt1.FieldByName('TMONID').AsString      := dblcTMon.Text;
   DMCNT.cdsMovCnt1.FieldByName('CNTTCAMBIO').AsFloat   := xTCambio;
   DMCNT.cdsMovCnt1.FieldByName('CNTTS').AsString       := xCampo;
   DMCNT.cdsMovCnt1.FieldByName('CNTMODDOC').AsString   := DMCNT.cdsTDoc.FieldByname('DOCMOD').AsString;
   DMCNT.cdsMovCnt1.FieldByName('CNTFCOMP').AsDateTime  := dtpFComp.Date;
   DMCNT.cdsMovCnt1.FieldByName('CNTFEMIS').AsDatetime  := dtpFComp.Date;
   DMCNT.cdsMovCnt1.FieldByName('CNTFVCMTO').AsDateTime := dtpFComp.Date;
   DMCNT.cdsMovCnt1.FieldByName('CNTESTADO').AsString   := 'I'; // I=Incompleto
   DMCNT.cdsMovCnt1.FieldByName('CNTUSER').AsString     := DMCNT.wUsuario;    // usuario que registra
   DMCNT.cdsMovCnt1.FieldByName('CNTFREG').Asdatetime   := date;     // fecha que registra usuario
   DMCNT.cdsMovCnt1.FieldByName('CNTHREG').AsdateTime   := time;     // hora que registra usuario
   DMCNT.cdsMovCnt1.FieldByName('CNTGLOSA').AsString    := xGlosa;
   xWhere := 'FECHA='+wRepFuncDate+''''+formatdatetime(wFormatFecha,dtpFComp.date)+''''+')';
   if length(DMCNT.DisplayDescrip('PrvTGE','TGE114','*',xWhere,'FECANO'))>0 then
   begin
      DMCNT.cdsMovCnt1.FieldByName('CNTMM').AsString   := DMCNT.cdsQry.fieldbyname('FECMES').AsString;       // mes
      DMCNT.cdsMovCnt1.FieldByName('CNTDD').AsString   := DMCNT.cdsQry.fieldbyname('FECDIA').AsString;       // día
      DMCNT.cdsMovCnt1.FieldByName('CNTTRI').AsString  := DMCNT.cdsQry.fieldbyname('FECTRIM').AsString;      // trimestre
      DMCNT.cdsMovCnt1.FieldByName('CNTSEM').AsString  := DMCNT.cdsQry.fieldbyname('FECSEM').AsString;      // semestre
      DMCNT.cdsMovCnt1.FieldByName('CNTSS').AsString   := DMCNT.cdsQry.fieldbyname('FECSS').AsString;       // semana
      DMCNT.cdsMovCnt1.FieldByName('CNTAATRI').AsString:= DMCNT.cdsQry.fieldbyname('FECAATRI').AsString;    // año+trimestre
      DMCNT.cdsMovCnt1.FieldByName('CNTAASEM').AsString:= DMCNT.cdsQry.fieldbyname('FECAASEM').AsString;    // año+semestre
      DMCNT.cdsMovCnt1.FieldByName('CNTAASS').AsString := DMCNT.cdsQry.fieldbyname('FECAASS').AsString;     // año+semana
   end;
   pnlMantComp.SetFocus;
end;


procedure TFConsultaComprobante.bbtnGrabaClick(Sender: TObject);
var
   xTDebe,xTHaber : DOUBLE;
begin
   If ( DMCNT.cdsMovCnt1.RecordCount<=1 ) and ( DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI0').AsFloat <= 0 ) then
   begin
      ShowMessage(' Error :  Falta Registrar Detalle ');
      raise exception.Create(' Error :  Falta Registrar Detalle ');
   end;
/// Busqueda de ultimo numero de comprobante registrado
   xNoCompAx:=dbeNoComp.Text;
   if xCompNew then begin  // Si es nuevo comprob.
      xCompNew:=False;
      xWhere:='CIAID='+''''+dblcCia.Text+''''
          +' and TDIARID='+''''+dblcTDiario.Text+''''
          +' and CNTCOMPROB='+''''+dbeNoComp.Text+''''
          +' and CNTANOMM='+''''+edtPeriodo.Text+'''';
      if dbeNoComp.Text = DMCNT.DisplayDescrip('prvCNT','CNT300','CNTCOMPROB',xWhere,'CNTCOMPROB')
      then begin  // Si ya le ganaron el N° de comprobante k separo en la cabecera (rara vez)
         xWhere :='CIAID='+''''+dblcCia.Text+''''
                 +' and TDIARID='+''''+dblcTDiario.Text+''''
                 +' and ANO='+''''+copy(edtPeriodo.Text,1,4)+''''
                 +' and MES='+''''+copy(edtPeriodo.Text,5,2)+'''';
         dbeNoComp.Text:=Inttostr(DMCNT.DisplayInteger('PrvTGE','TGE301','NUMERO',xWhere,'NUMERO')+1);
         dbeNoComp.Text:=DMCNT.strzero(dbeNoComp.Text,10);

         ShowMessage('Número de Comprobante '+xNoCompAx+' ya registrado '+chr(13)
                 +'El número asignado sera '+dbeNoComp.Text);
      end;
   end;
///

///////////////////////////////
   DMCNT.cdsMovCnt1.DisableControls;
   DMCNT.cdsMovCnt1.First;
   xTDebe:=0; xTHaber:=0;
//   DMCNT.cdsMovCnt1.Edit;
   while not DMCNT.cdsMovCnt1.eof do begin
//      if (DMCNT.cdsMovCnt1FlagVar.Value='X') and (DMCNT.cdsMovCnt1CNTMtoOri.Value>0) then
      if (DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat > 0) then
      begin
         DMCNT.cdsMovCnt1.Edit;
         if xNoCompAx<>dbeNoComp.Text then DMCNT.cdsMovCnt1.FieldByName('CNTCOMPROB').AsString := dbeNoComp.Text;
         if DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString = 'D'
         then xTDebe :=xTDebe +DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat
         else xTHaber:=xTHaber+DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat;
         DMCNT.cdsMovCnt1.Next;
      end
      else DMCNT.cdsMovCnt1.Delete;
   end;
   if (xTDebe-xTHaber)>0 then
   begin
      if MessageDlg('No hay coincidencia entre Debe y Haber'+chr(13)
         +'      ¿Continuar con Grabación?       ',mtConfirmation, [mbYes, mbNo], 0)<>mrYes then
      begin
         DMCNT.cdsMovCnt1.EnableControls;
         dbgMovCNT.SelectedIndex:=0;
         exit;
      end;
   end;
   DMCNT.ControlTranCNT( 0 );
   //DMCNT.cdsMovCnt1.ApplyUpdates(0);
   DMCNT.cdsMovCnt1.Close;
   DMCNT.cdsMovCnt1.Open;

   RegNuevoCab;
   DMCNT.ControlTranCNT( 0 );
   //DMCNT.cdsCabCnt.ApplyUpdates(0);

   if xNoCompAx<>dbeNoComp.Text then begin
           DMCNT.cdsMovCnt1.DisableControls;
//           xSQL:='Select * from CNT301 Where '
   xSQL:=         'SELECT CIAID,CUENTAID,CNTMTOORI,CNTFVCMTO,CNTFEMIS,CNTGLOSA,CNTDH, '
                + 'AUXID,CLAUXID,DOCID,CNTSERIE,CNTNODOC,CCOSID,CNTDEBEMN,CNTDEBEME, '
                + 'CNTHABEMN,CNTHABEME,TDIARID,CNTCUADRE,CNTESTADO,CNTCOMPROB,CNTMTOLOC, '
                + 'CNTMTOEXT,CTADES,AUXDES,DOCDES,CCOSDES,TDIARDES,CNTANO,CNTANOMM, '
                + 'CNTLOTE,TMONID,CNTTCAMBIO,CNTTS,CNTMODDOC,CNTFCOMP,CNTUSER,CNTFREG, '
                + 'CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS '
                + 'FROM CNT301 WHERE '
                +'CIAID='+''''+dblcCia.Text+''''
                +' and TDIARID='+''''+dblcTDiario.Text+''''
                +' and CNTCOMPROB='+''''+dbenoComp.Text+''''
                +' and CNTANOMM='+''''+edtPeriodo.Text+'''';
           DMCNT.cdsMovCnt1.Close;
           DMCNT.cdsMovCNT1.DataRequest(xSQL);
           DMCNT.cdsMovCNT1.Open;
           DMCNT.cdsMovCNT1.First;
           DMCNT.cdsMovCnt1.EnableControls;
   end;

//   DMCNT.ActualizaData(DMCNT.cdsMovCnt1);
//   DMCNT.MovCxPDataRequest;

   ShowMessage(' Registro de Comprobante Grabado ');
   DMCNT.cdsMovCnt1.EnableControls;
   bbtnAnula.Enabled  :=True;
   bbtnNuevo.Enabled  :=True;
   bbtnRegresa.Enabled:=False;
   bbtnAcepta.Enabled :=True;
   bbtnContab.Enabled :=False;
//   bbtnGraba.Enabled  :=False;
   bbtnCanc2.Enabled  :=False;
   dbgMovCNT.ReadOnly :=True;
   MuestraEstado(DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString,DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString) ;

end;

procedure TFConsultaComprobante.MuestraEstado( xMovEstado, xMovConta : String ) ;
begin
   lblAceptado.Visible   := False;
   lblIncompleto.Visible := False;
   lblContab.Visible     := False;
   lblAnulado.Visible    := False;

   if xMovConta='S' then
      lblContab.Visible:=True
   else begin
      if xMovEstado='A' then lblAnulado.Visible:=true;
      if xMovEstado='P' then lblAceptado.Visible:=True;
      if xMovEstado='I' then lblIncompleto.Visible:=True;
   end;
end;

procedure TFConsultaComprobante.bbtnCanc2Click(Sender: TObject);
begin
// Botón que cancela datos de las Actualizaciones del Detalle
   DMCNT.cdsMovCnt1.CancelUpdates;
   TotalesResumen;
   bbtnCanc2.Enabled  :=False;
{
   bbtnAnula.Enabled  :=False;
   bbtnNuevo.Enabled  :=False;
   bbtnRegresa.Enabled:=False;
   bbtnAcepta.Enabled :=False;
   bbtnContab.Enabled :=False;
   bbtnGraba.Enabled  :=False;
   pnlMovCNT.Enabled  :=False;
}
   dbeTasa.Text:=floattostr(xTCambio);
   bbtnRegresa.Click;
end;

procedure TFConsultaComprobante.bbtnContabClick(Sender: TObject);
begin
   //// Contabilización en Linea: requiere que en el DM del módulo exista cdsMOVCNT2 (mismo nombre)
   //// cds1 y cds2 deben hacer referencia a la tabla CNT301
   if MessageDlg(' Contabilizar Comprobante'+chr(13)+chr(13)+
                 '     ¿ Esta Seguro ?     ',mtConfirmation,[mbYes, mbNo],0)<>mrYes
   then exit;

   if not AsientoCuadra then begin
         ShowMessage(' Error al Contabilizar, asiento No Cuadra....... ');
         exit;
   end;

   if DMCNT.cdsCabCNT.FieldByName('CNTCUADRE').AsString='S' then begin
         ShowMessage(' Asiento ya fue Contabilizado....... ');
         exit;
   end;

   DMCNT.CreaPanel( FConsultaComprobante, 'Contabilizando' );

   if DMCNT.Contabiliza(dblcCia.Text, dblcTDiario.Text, edtPeriodo.Text, dbeNocomp.Text)
   then begin
      dbgMovCNT.ReadOnly := True;
      DMCNT.cdsCabCnt.Edit;
      DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString:='S';
      DMCNT.ControlTrancnt( 0 );
      //DMCNT.cdsCabCnt.ApplyUpdates(0);
      //DMCNT.cdsMovCnt1.ApplyUpdates(0);
      xWhere:='CIAID='+''''+dblcCia.Text+''''
           +' and TDIARID='+''''+dblcTDiario.Text+''''
           +' and CNTCOMPROB='+''''+dbeNoComp.Text+''''
           +' and CNTANOMM='+''''+edtPeriodo.Text+'''';
      DMCNT.cdsMovCnt1.Filtered:=False;
      DMCNT.cdsMovCnt1.DisableControls;
//      xSQL:='Select * from CNT301 Where '
   xSQL:=         'SELECT CIAID,CUENTAID,CNTMTOORI,CNTFVCMTO,CNTFEMIS,CNTGLOSA,CNTDH, '
                + 'AUXID,CLAUXID,DOCID,CNTSERIE,CNTNODOC,CCOSID,CNTDEBEMN,CNTDEBEME, '
                + 'CNTHABEMN,CNTHABEME,TDIARID,CNTCUADRE,CNTESTADO,CNTCOMPROB,CNTMTOLOC, '
                + 'CNTMTOEXT,CTADES,AUXDES,DOCDES,CCOSDES,TDIARDES,CNTANO,CNTANOMM, '
                + 'CNTLOTE,TMONID,CNTTCAMBIO,CNTTS,CNTMODDOC,CNTFCOMP,CNTUSER,CNTFREG, '
                + 'CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS '
                + 'FROM CNT301 WHERE '
      +xWhere;
      DMCNT.cdsMovCnt1.Close;
      DMCNT.cdsMovCnt1.DataRequest(xSQL);
      DMCNT.cdsMovCnt1.Open;
      DMCNT.cdsMovCnt1.First;
      DMCNT.cdsMovCnt1.EnableControls;
      DMCNT.PanelMsg( ' Asiento Contabilizado ',0 );
      MuestraEstado(DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString,DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString);
   end
   else ShowMessage('Asiento NO Contabilizado');

   pnlConta.Free;
   bbtnGraba.Enabled:=False;

end;

{Function TFConsultaComprobante.Contabiliza( xCia, xTDiario, xAnoMM, xNoComp : String ): Boolean;
begin
   PanelMsg( 'Generando Asientos Automaticos',0 );

    if (SRV_D = 'DB2NT') or
       (SRV_D = 'DB2400') then
    begin
   xSQL:='INSERT INTO CNT301 ( '
        +'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
        +'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
        +'CNTDH, CCOSID, '
        +'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
        +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
        +'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
        +'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
        +'CNTDEBEMN, CNTDEBEME, '
        +'CNTHABEMN, CNTHABEME ) '

        +'SELECT A.CIAID, A.TDIARID, A.CNTCOMPROB, A.CNTANO, A.CNTANOMM, A.CNTLOTE, B.CTAAUT1,'
        +'A.CLAUXID, A.AUXID, A.CNTMODDOC, A.DOCID, A.CNTSERIE, A.CNTNODOC, A.CNTGLOSA, '
        +'CASE WHEN A.CNTDH=''D'' THEN ''H'' ELSE ''D'' END AS DH, '
        +'CASE WHEN D.CTA_CCOS=''S'' THEN A.CCOSID ELSE '''' END CCOSID, '
        +'A.CNTTCAMBIO, A.CNTMTOORI, A.CNTMTOLOC, A.CNTMTOEXT, A.CNTFEMIS, A.CNTFVCMTO, '
        +'A.CNTFCOMP, A.CNTESTADO, ''S'', ''S'', '
        +''''+DMCNT.wUsuario+''''+', '+wRepFuncDate+''''+ FORMATDATETIME(wFormatFecha,Date )+''''+'), '+wRepHorServi+', '
        +'A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, '
        +'A.CNTAASS, A.TMONID, D.CTAABR, A.TDIARDES, A.AUXDES, A.DOCDES, C.CCOSABR, '
        +'CASE WHEN A.CNTDH=''H'' THEN CNTMTOLOC ELSE 0 END, '
        +'CASE WHEN A.CNTDH=''H'' THEN CNTMTOEXT ELSE 0 END, '
        +'CASE WHEN A.CNTDH=''D'' THEN CNTMTOLOC ELSE 0 END, '
        +'CASE WHEN A.CNTDH=''D'' THEN CNTMTOEXT ELSE 0 END '

        +'FROM CNT301 A '
        +'LEFT  JOIN TGE203 C ON ( A.CCOSID=C.CCOSID ), '
        +'TGE202 B, TGE202 D '

        +'WHERE  A.CIAID     ='+''''+ xCia    +''''+' AND '
        +'       A.TDIARID   ='+''''+ xTDiario+''''+' AND '
        +'       A.CNTANOMM  ='+''''+ xAnoMM  +''''+' AND '
        +'       A.CNTCOMPROB='+''''+ xNoComp +''''+' AND '
        +'     ( A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND B.CTAAUT1 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT1))>0 ) AND '
        +'     ( A.CIAID=D.CIAID AND B.CTAAUT1=D.CUENTAID AND B.CTAAUT1 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT1))>0  ) ';

    end
    else
     if SRV_D = 'ORACLE' then
      begin
   xSQL:='INSERT INTO CNT301 ( '
        +'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
        +'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
        +'CNTDH, CCOSID, '
        +'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
        +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
        +'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
        +'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
        +'CNTDEBEMN, CNTDEBEME, '
        +'CNTHABEMN, CNTHABEME ) '

        +'SELECT A.CIAID, A.TDIARID, A.CNTCOMPROB, A.CNTANO, A.CNTANOMM, A.CNTLOTE, B.CTAAUT1,'
        +'A.CLAUXID, A.AUXID, A.CNTMODDOC, A.DOCID, A.CNTSERIE, A.CNTNODOC, A.CNTGLOSA, '
        +'DECODE(A.CNTDH,''D'',''H'',''D'') AS DH, '
        +'DECODE(D.CTA_CCOS,''S'',A.CCOSID,'''') CCOSID, '
        +'A.CNTTCAMBIO, A.CNTMTOORI, A.CNTMTOLOC, A.CNTMTOEXT, A.CNTFEMIS, A.CNTFVCMTO, '
        +'A.CNTFCOMP, A.CNTESTADO, ''S'', ''S'', '
        +''''+DMCNT.wUsuario+''''+', '+wRepFuncDate+''''+ FORMATDATETIME(wFormatFecha,Date )+''''+'), '+wRepFecServi+', '
        +'A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, '
        +'A.CNTAASS, A.TMONID, D.CTAABR, A.TDIARDES, A.AUXDES, A.DOCDES, C.CCOSABR, '
        +'DECODE(A.CNTDH,''H'',CNTMTOLOC,0), '
        +'DECODE(A.CNTDH,''H'',CNTMTOEXT,0), '
        +'DECODE(A.CNTDH,''D'',CNTMTOLOC,0), '
        +'DECODE(A.CNTDH,''D'',CNTMTOEXT,0) '
        +'FROM CNT301 A,TGE203 C,TGE202 B, TGE202 D '
        +'WHERE  A.CIAID     ='+''''+ xCia    +''''+' AND '
        +'       A.TDIARID   ='+''''+ xTDiario+''''+' AND '
        +'       A.CNTANOMM  ='+''''+ xAnoMM  +''''+' AND '
        +'       A.CNTCOMPROB='+''''+ xNoComp +''''+' AND '
        +'     ( A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND B.CTAAUT1 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT1))>0 ) AND '
        +'     ( A.CIAID=D.CIAID AND B.CTAAUT1=D.CUENTAID AND B.CTAAUT1 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT1))>0  ) '
        +' AND ( A.CCOSID=C.CCOSID(+) ) ';

      end;


   DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

   // 4
   PanelMsg( 'Generando Asientos Automaticos',0 );

    if (SRV_D = 'DB2NT') or
       (SRV_D = 'DB2400') then
    begin
   xSQL:='INSERT INTO CNT301 ( '
        +'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
        +'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
        +'CNTDH, CCOSID, '
        +'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
        +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
        +'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
        +'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
        +'CNTDEBEMN, CNTDEBEME, '
        +'CNTHABEMN, CNTHABEME ) '

        +'SELECT A.CIAID, A.TDIARID, A.CNTCOMPROB, A.CNTANO, A.CNTANOMM, A.CNTLOTE, B.CTAAUT2,'
        +'A.CLAUXID, A.AUXID, A.CNTMODDOC, A.DOCID, A.CNTSERIE, A.CNTNODOC, A.CNTGLOSA, '
        +'CASE WHEN A.CNTDH=''D'' THEN ''D'' ELSE ''H'' END AS DH, '
        +'CASE WHEN D.CTA_CCOS=''S'' THEN A.CCOSID ELSE '''' END CCOSID, '
        +'A.CNTTCAMBIO, A.CNTMTOORI, A.CNTMTOLOC, A.CNTMTOEXT, A.CNTFEMIS, A.CNTFVCMTO, '
        +'A.CNTFCOMP, A.CNTESTADO, ''S'', ''S'', '
        +''''+DMCNT.wUsuario+''''+', '+wRepFuncDate+''''+ FORMATDATETIME(wFormatFecha,Date )+''''+'), '+wRepHorServi+', '
        +'A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, '
        +'A.CNTAASS, A.TMONID, D.CTAABR, A.TDIARDES, A.AUXDES, A.DOCDES, C.CCOSABR,'
        +'CASE WHEN A.CNTDH=''D'' THEN CNTMTOLOC ELSE 0 END, '
        +'CASE WHEN A.CNTDH=''D'' THEN CNTMTOEXT ELSE 0 END, '
        +'CASE WHEN A.CNTDH=''H'' THEN CNTMTOLOC ELSE 0 END, '
        +'CASE WHEN A.CNTDH=''H'' THEN CNTMTOEXT ELSE 0 END '

        +'FROM CNT301 A '
        +'LEFT  JOIN TGE203 C ON ( A.CCOSID=C.CCOSID ), '
        +'TGE202 B, TGE202 D '

        +'WHERE  A.CIAID     ='+''''+ xCia    +''''+' AND '
        +'       A.TDIARID   ='+''''+ xTDiario+''''+' AND '
        +'       A.CNTANOMM  ='+''''+ xAnoMM  +''''+' AND '
        +'       A.CNTCOMPROB='+''''+ xNoComp +''''+' AND '
        +'     ( A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND B.CTAAUT2 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT2))>0 ) AND '
        +'     ( A.CIAID=D.CIAID AND B.CTAAUT2=D.CUENTAID AND B.CTAAUT2 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT2))>0  ) ';

    end
    else
     if SRV_D = 'ORACLE' then
      begin
   xSQL:='INSERT INTO CNT301 ( '
        +'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
        +'CLAUXID, AUXID, CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
        +'CNTDH, CCOSID, '
        +'CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
        +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG,'
        +'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
        +'CNTAASS, TMONID, CTADES, TDIARDES, AUXDES, DOCDES, CCOSDES,'
        +'CNTDEBEMN, CNTDEBEME, '
        +'CNTHABEMN, CNTHABEME ) '

        +'SELECT A.CIAID, A.TDIARID, A.CNTCOMPROB, A.CNTANO, A.CNTANOMM, A.CNTLOTE, B.CTAAUT2,'
        +'A.CLAUXID, A.AUXID, A.CNTMODDOC, A.DOCID, A.CNTSERIE, A.CNTNODOC, A.CNTGLOSA, '
        +'DECODE(A.CNTDH,''D'',''D'',''H'') AS DH, '
        +'DECODE(D.CTA_CCOS,''S'',A.CCOSID,'''') CCOSID, '
        +'A.CNTTCAMBIO, A.CNTMTOORI, A.CNTMTOLOC, A.CNTMTOEXT, A.CNTFEMIS, A.CNTFVCMTO, '
        +'A.CNTFCOMP, A.CNTESTADO, ''S'', ''S'', '
        +''''+DMCNT.wUsuario+''''+', '+wRepFuncDate+''''+ FORMATDATETIME(wFormatFecha,Date )+''''+'), '+wRepFecServi+', '
        +'A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, '
        +'A.CNTAASS, A.TMONID, D.CTAABR, A.TDIARDES, A.AUXDES, A.DOCDES, C.CCOSABR,'
        +'DECODE(A.CNTDH,''D'',CNTMTOLOC,0), '
        +'DECODE(A.CNTDH,''D'',CNTMTOEXT, 0), '
        +'DECODE(A.CNTDH,''H'',CNTMTOLOC, 0), '
        +'DECODE(A.CNTDH,''H'',CNTMTOEXT, 0) '
        +'FROM CNT301 A,TGE202 B, TGE202 D,TGE203 C  '
        +'WHERE  A.CIAID     ='+''''+ xCia    +''''+' AND '
        +'       A.TDIARID   ='+''''+ xTDiario+''''+' AND '
        +'       A.CNTANOMM  ='+''''+ xAnoMM  +''''+' AND '
        +'       A.CNTCOMPROB='+''''+ xNoComp +''''+' AND '
        +'     ( A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND B.CTAAUT2 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT2))>0 ) AND '
        +'     ( A.CIAID=D.CIAID AND B.CTAAUT2=D.CUENTAID AND B.CTAAUT2 IS NOT NULL AND LENGTH(RTRIM(B.CTAAUT2))>0  ) '
        +' AND ( A.CCOSID=C.CCOSID(+)) ';

      end;


   DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

   GeneraEnLinea401( xCia, xTDiario, xAnoMM, xNoComp );

   Result:=True;
end;

procedure TFConsultaComprobante.GeneraEnLinea401( xxxCia,xxxDiario,xxxAnoMM,xxxNoComp: String );
var
   xCtaPrin, xClAux, xCuenta, xAuxDes, xAno, xMes, xDH, xSQL : string;
   xMov, xAux, xCCos, xCCoDes, xCtaDes, xFLAux, xFLCCo       : String;
   xDigitos, xDigAnt : Integer;
   xImpMN, xImpME    : DOUBLE;
begin
   WITH DMCNT DO BEGIN
   xAno := Copy(xxxAnoMM,1,4);
   xMes := Copy(xxxAnoMM,5,2);

   // 5
   PanelMsg( 'Generando Resultados',0 );
   xSQL:=         'SELECT CIAID,CUENTAID,CNTMTOORI,CNTFVCMTO,CNTFEMIS,CNTGLOSA,CNTDH, '
                + 'AUXID,CLAUXID,DOCID,CNTSERIE,CNTNODOC,CCOSID,CNTDEBEMN,CNTDEBEME, '
                + 'CNTHABEMN,CNTHABEME,TDIARID,CNTCUADRE,CNTESTADO,CNTCOMPROB,CNTMTOLOC, '
                + 'CNTMTOEXT,CTADES,AUXDES,DOCDES,CCOSDES,TDIARDES,CNTANO,CNTANOMM, '
                + 'CNTLOTE,TMONID,CNTTCAMBIO,CNTTS,CNTMODDOC,CNTFCOMP,CNTUSER,CNTFREG, '
                + 'CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS '
                + 'FROM CNT301 WHERE ';

   DMCNT.Filtracds( cdsMovCNT1,xSQL
                           + 'CIAID='     +''''+xxxCia   +''''+' AND '
                           + 'TDIARID='   +''''+xxxDiario+''''+' AND '
                           + 'CNTANOMM='  +''''+xxxAnoMM +''''+' AND '
                           + 'CNTCOMPROB='+''''+xxxNoComp+'''' );

   PanelMsg( 'Generando Resultados', cdsMovCNT1.RecordCount+1 );

   cdsMovCNT1.First;
   while not cdsMovCNT1.Eof do begin

      PanelMsg( 'Generando Resultados', 0 );

      xCtaPrin:= cdsMovCNT1.FieldByName( 'CUENTAID' ).AsString;
      xDH     := cdsMovCNT1.FieldByName( 'CNTDH'    ).AsString;
      xImpMN  := cdsMovCNT1.FieldByName( 'CNTMTOLOC').AsFloat;
      xImpME  := cdsMovCNT1.FieldByName( 'CNTMTOEXT').AsFloat;
      xClAux  := cdsMovCNT1.FieldByName( 'CLAUXID'  ).AsString;
      xAux    := cdsMovCNT1.FieldByName( 'AUXID'    ).AsString;
      xAuxDes := cdsMovCNT1.FieldByName( 'AUXDES'   ).AsString;
      xCCos   := cdsMovCNT1.FieldByName( 'CCOSID'   ).AsString;
      xCCoDes := cdsMovCNT1.FieldByName( 'CCOSDES'  ).AsString;
      xDigAnt := 0;
      cdsNivel.First;
      while not DMCNT.cdsNivel.EOF do begin

         xDigitos := DMCNT.cdsNivel.FieldByName('Digitos').AsInteger;
         xCuenta  := Trim( Copy( xCtaPrin , 1, xDigitos ) );

         xSQL:='Select * from TGE202 where CIAID='   +''''+xxxCia +''''+' and '
                                        + 'CUENTAID='+''''+xCuenta+'''';
         cdsQry.Close;
         cdsQry.ProviderName:= 'PrvTGE';
         cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
         cdsQry.Open;
         xCtaDes := '';
         xMov    := '';
         if cdsQry.RecordCount>0 then begin
            xCtaDes := cdsQry.FieldByName( 'CTAABR'  ).AsString;
            xMov    := cdsQry.FieldByName( 'CTA_MOV' ).AsString;
            xFlAux  := cdsQry.FieldByName( 'CTA_AUX' ).AsString;
            xFlCCo  := cdsQry.FieldByName( 'CTA_CCOS').AsString;
         end;

{         if xCtaPrin='70201' then
            xMov    := cdsQry2.FieldByName( 'CTA_MOV' ).AsString;}

{         If DMCNT.cdsNivel.FieldByName('Signo').AsString='='  then
            if Length(xCuenta)=xDigitos  then  else Break;
         If DMCNT.cdsNivel.FieldByName('Signo').AsString='<=' then
            if (Length(xCuenta)<=xDigitos) and (Length(xCuenta)>xDigAnt) then  else Break;
         If DMCNT.cdsNivel.FieldByName('Signo').AsString='>=' then
            if Length(xCuenta)>=xDigitos then  else Break;

         if not CuentaExiste( xxxCia, xAno, xCuenta, '', '' ) then begin
            InsertaMov( xxxCia, xxxAnoMM, xCuenta, '', '', '', xDH, xMov,
                        xCtaDes, '', '' , xImpMN, xImpME );
            end
         else begin
            ActualizaMov( xxxCia, xxxAnoMM, xCuenta, '', '', '', xDH, xMov,
                          xCtaDes, '', '' , xImpMN, xImpME );
            end;
         xDigAnt := DMCNT.cdsNivel.FieldByName('Digitos').AsInteger;
         cdsNivel.Next;
      end;

      /////////////////////////////////////
      //   Si Tiene C.Costo o Auxiliar   //
      /////////////////////////////////////
      if (xFlAux='S') or (xFlCCo='S') then
         xMov := 'S';

      ///////////////////////////
      //   Si Tiene Auxiliar   //
      ///////////////////////////
      if xFlAux='S' then
      begin
         if not CuentaExiste( xxxCia, xAno, xCuenta, xAux, '' ) then
            InsertaMov( xxxCia, xxxAnoMM, xCuenta, xClAux, xAux, '', xDH, xMov,
                        xCtaDes, xAuxDes, '' , xImpMN, xImpME )
         else
            ActualizaMov( xxxCia, xxxAnoMM, xCuenta, xClAux, xAux,'',xDH, xMov,
                          xCtaDes, xAuxDes, '' , xImpMN, xImpME );
      end;

      ///////////////////////////
      //   Si Tiene C.Costo    //
      ///////////////////////////
      if xFlCCo='S' then
      begin
         if not CuentaExiste( xxxCia, xAno, xCuenta, xAux, xCCos ) then
            InsertaMov( xxxCia,xxxAnoMM,xCuenta, xClAux, xAux, xCCos, xDH,xMov,
                        xCtaDes, xAuxDes, xCCoDes , xImpMN, xImpME )
         else
            ActualizaMov( xxxCia,xxxAnoMM,xCuenta,xClAux,xAux, xCCos, xDH,xMov,
                          xCtaDes, xAuxDes, xCCoDes , xImpMN, xImpME );
      end;

      cdsMovCNT1.Edit;                   //// RDM
      cdsMovCNT1.FieldByName('CNTCUADRE').AsString:='S';    //// RDM
      cdsMovCNT1.Next;
   end;
   END;
end;

function TFConsultaComprobante.CuentaExiste( xxxxCia, xxxxAno, xxxxCuenta, xxxxAux,
                            xxxxCCos : String ) : Boolean;
var
   xSQL : String;
begin
//   xSQL:='Select * from CNT401 Where '
     xSQL:='SELECT CIAID,CUENTAID,CTADES,TDIARID,TDIARDES,CLAUXID,AUXID,AUXDES,CCOSID,CCOSDES, '
          +' ANO,CTA_MOV,TIPO,SALDMN01,SALDMN02,SALDMN03,SALDMN04,SALDMN05,SALDMN06, '
          +' SALDMN07,SALDMN08,SALDMN09,SALDMN10,SALDMN11,SALDMN12, '
          +' SALDME01,SALDME02,SALDME03,SALDME04,SALDME05,SALDME06, '
          +' SALDME07,SALDME08,SALDME09,SALDME10,SALDME11,SALDME12, '
          +' DEBEMN01,DEBEMN02,DEBEMN03,DEBEMN04,DEBEMN05,DEBEMN06, '
          +' DEBEMN07,DEBEMN08,DEBEMN09,DEBEMN10,DEBEMN11,DEBEMN12, '
          +' DEBEME01,DEBEME02,DEBEME03,DEBEME04,DEBEME05,DEBEME06, '
          +' DEBEME07,DEBEME08,DEBEME09,DEBEME10,DEBEME11,DEBEME12, '          
          +' HABEMN01,HABEMN02,HABEMN03,HABEMN04,HABEMN05,HABEMN06, '
          +' HABEMN07,HABEMN08,HABEMN09,HABEMN10,HABEMN11,HABEMN12, '
          +' HABEME01,HABEME02,HABEME03,HABEME04,HABEME05,HABEME06, '
          +' HABEME07,HABEME08,HABEME09,HABEME10,HABEME11,HABEME12, '          
          +' SALDMN00,SALDME00,SALDMN13,SALDME13, '
          +' DEBEMN00,DEBEME00,DEBEMN13,DEBEME13, '
          +' HABEMN00,HABEME00,HABEMN13,HABEME13 '
          +' FROM CNT401 A WHERE '      
   
                                  + 'CIAID='   +''''+xxxxCia   +''''+' and '
                                  + 'ANO='     +''''+xxxxAno   +''''+' and '
                                  + 'CUENTAID='+''''+xxxxCuenta+''''+' and '
                                  + 'AUXID='   +''''+xxxxAux   +''''+' and '
                                  + 'CCOSID='  +''''+xxxxCCos  +'''';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.ProviderName:= 'PrvTGE';
   DMCNT.cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
   DMCNT.cdsQry.Open;
   if DMCNT.cdsQry.RecordCount>0 then
      Result:=True
   else
      Result:=False;
end;

procedure TFConsultaComprobante.ActualizaMov(cCia,cAnoMM,cCuenta,cClAux,cAux,cCCosto,cDH, cMov,
                            cCtaDes,cAuxDes,cCCoDes:String; nImpMN,nImpME:DOUBLE);
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
                   '( '+wReplacCeros+'(DEBEMN'+ cMes +',0)+'+ '('+FloatToStr( nImpMN )+') ) ';
      cSQL:=cSQL + ', DEBEME'+ cMes+'='+
                   '( '+wReplacCeros+'(DEBEME'+ cMes +',0)+'+ '('+FloatToStr( nImpME )+') ) ';
   end;
   if cDH='H' then begin
      cSQL:=cSQL + '  HABEMN'+ cMes +'='+
                   '( '+wReplacCeros+'(HABEMN'+ cMes +',0)+'+ '('+FloatToStr( nImpMN )+') ) ';
      cSQL:=cSQL + ', HABEME'+ cMes +'='+
                   '( '+wReplacCeros+'(HABEME'+ cMes +',0)+'+ '('+FloatToStr( nImpME )+') ) ';
   end;

   for nMes:=(StrToInt( cMes )+1) to 13 do begin
       cMesT := DMCNT.StrZero( IntToStr( nMes),2);

       cSQL:= cSQL + ', SALDMN'+ cMesT +'=';
       cSQL:= cSQL + '( '+wReplacCeros+'(SALDMN'+ cMesT +',0)';
       if cDH='D' then cSQL:=cSQL+'+' else cSQL:=cSQL+'-';
       cSQL:=cSQL + '('+FloatToStr( nImpMN )+') ) ';

       cSQL:= cSQL + ', SALDME'+ cMesT +'=';
       cSQL:= cSQL + '( '+wReplacCeros+'(SALDME'+ cMesT +',0)';
       if cDH='D' then cSQL:=cSQL+'+' else cSQL:=cSQL+'-';
       cSQL:=cSQL + '('+FloatToStr( nImpME )+') ) ';
   end;

   cSQL:=cSQL + 'Where CIAID=   '+''''+cCia    +''''+' and '
              +       'ANO=     '+''''+cAno    +''''+' and '
              +       'CUENTAID='+''''+cCuenta +''''+' and '
              +       'CLAUXID= '+''''+cClAux  +''''+' and '
              +       'AUXID=   '+''''+cAux    +''''+' and '
              +       'CCOSID=  '+''''+cCCosto +'''';

   DMCNT.DCOM1.AppServer.EjecutaQry( cSQL );
end;

procedure TFConsultaComprobante.InsertaMov(cCia, cAnoMM, cCuenta, cClAux, cAux, cCCosto,cDH,cMov,
                          cCtaDes,cAuxDes,cCCoDes:String; nImpMN,nImpME:DOUBLE);
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
       cMesT := DMCNT.StrZero( IntToStr( nMes ),2);
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
       cMesT := DMCNT.StrZero( IntToStr( nMes ),2);
       if cDH='D' then cSQL:=cSQL+', +' else cSQL:=cSQL+', -';
       cSQL:=cSQL + FloatToStr( nImpMN )+' ';
       if cDH='D' then cSQL:=cSQL+', +' else cSQL:=cSQL+', -';
       cSQL:=cSQL + FloatToStr( nImpME )+' ';
   end;

   cSQL:=cSQL+' ) ';

   DMCNT.DCOM1.AppServer.EjecutaQry( cSQL );
end;

procedure TFConsultaComprobante.CreaPanel( xForma:TForm; xMensaje:String );
begin
   pnlConta := TPanel.Create( xForma );
   pbConta  := TProgressBar.Create( NIL );
   pbConta.Width:= 205;
   pbConta.Top  := 72;
   pbConta.Left := 48;
   pbConta.Min  := 0;
   pbConta.Max  := 6;
   pbConta.Parent := pnlConta;
   pnlConta.Alignment := taCenter;
   pnlConta.BringToFront;
   pnlConta.Width  := 300;
   pnlConta.Height := 100;
   pnlConta.Top    := xForma.Height-380;
   pnlConta.Left   := StrToInt(FloattoStr(DMCNT.FRound( ( ((xForma.Width-100))/2)-100,3,0 )));
   pnlConta.Parent := xForma;
   pnlConta.BevelInner := bvRaised;
   pnlConta.BevelOuter := bvRaised;
   pnlConta.BevelWidth := 3;
   pnlConta.Font.Name  := 'Times New Roman';
   pnlConta.Font.Style := [fsBold,fsItalic];
   pnlConta.Font.Size  := 12;
   pnlConta.Caption:= xMensaje;
   pbConta.Position:=1;
   pnlConta.Refresh;
end;

procedure TFConsultaComprobante.PanelMsg( xMensaje:String; xProc:Integer );
begin
   If xProc>0 then begin
      pbConta.Position:= 0;
      pbConta.Min     := 0;
      pbConta.Max     := xProc;
   end;
   pnlConta.Caption:= xMensaje;
   If xProc=0 then pbConta.Position:= pbConta.Position + 1;
   pnlConta.Refresh;
end;
 }

Function TFConsultaComprobante.AsientoCuadra:Boolean;
var
   xTotDebe, xTotHaber : DOUBLE;
begin
   Result    := False;
   xTotDebe  := 0;
   xTotHaber := 0;
   DMCNT.cdsMovCnt1.DisableControls;
   DMCNT.cdsMovCnt1.First ;
   while not DMCNT.cdsMovCnt1.eof do begin
      if DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString='D' then
         xTotDebe  := xTotDebe  + DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat
      else begin
         xTotHaber := xTotHaber + DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat;
      end;
      DMCNT.cdsMovCnt1.Next;
   end;
   DMCNT.cdsMovCnt1.First;
   DMCNT.cdsMovCnt1.EnableControls;
   if xTotDebe=xTotHaber then Result := True;
end;

procedure TFConsultaComprobante.bbtnAceptaClick(Sender: TObject);
begin
   if MessageDlg('Aceptar Comprobante'+chr(13)+chr(13)+
                 '  ¿ Esta Seguro ?  ',mtConfirmation, [mbYes, mbNo], 0)=mrYes then begin

      If DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString='P' then
      begin
         ShowMessage(' Error:  Registro Ya Fue Aceptado ');
         raise exception.Create(' Error:  Registro Ya Fue Aceptado ');
      end ;

      If not AsientoCuadra then
      begin
         ShowMessage(' Error:  Asiento No Cuadra ');
         raise exception.Create(' Error:  Asiento No Cuadra ');
      end ;

      If DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString='S' then
      begin
         ShowMessage(' Error:  Asiento ya fue Contabilizado ');
         raise exception.Create(' Error:  Asiento ya fue Contabilizado ');
      end ;

      DMCNT.cdsMovCnt1.DisableControls;
      DMCNT.cdsMovCnt1.First;
      while not DMCNT.cdsMovCnt1.EOF do begin
         DMCNT.cdsMovCnt1.Edit;
         DMCNT.cdsMovCnt1.FieldByName('CNTESTADO').AsString:= 'P';
//         DMCNT.cdsMovCnt1FlagVar.Value  := '';
         DMCNT.cdsMovCnt1.Next;
      end;
      DMCNT.cdsMovCnt1.EnableControls;
      DMCNT.ControlTranCNT(0);
      //DMCNT.cdsMovCnt1.ApplyUpdates(0);

      DMCNT.cdsCabCnt.Edit;
      DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString:= 'P';
      DMCNT.ControlTranCnt( 0 );
      //DMCNT.cdsCabCnt.ApplyUpdates(0);

      DMCNT.cdsMovCnt1.First;
      dbgMovCNT.ReadOnly := True;
      ShowMessage(' Comprobante Contable Aceptado ');
      bbtnAcepta.Enabled := False;
      bbtnContab.Enabled := True;
      bbtnGraba.Enabled  := False;
      bbtnAnula.Enabled  := False;
      bbtnCanc2.Enabled  := False;
//      pnlMovCnt.Enabled  := False;
      MuestraEstado(DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString,DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString) ;
      xFlag:=True;

   end;
end;

procedure TFConsultaComprobante.MovCNTDataRequest;
begin
//   xSQL := 'Select * from CXP301';
//   xSQL := 'Select * from CNT301';
   xSQL:=         'SELECT CIAID,CUENTAID,CNTMTOORI,CNTFVCMTO,CNTFEMIS,CNTGLOSA,CNTDH, '
                + 'AUXID,CLAUXID,DOCID,CNTSERIE,CNTNODOC,CCOSID,CNTDEBEMN,CNTDEBEME, '
                + 'CNTHABEMN,CNTHABEME,TDIARID,CNTCUADRE,CNTESTADO,CNTCOMPROB,CNTMTOLOC, '
                + 'CNTMTOEXT,CTADES,AUXDES,DOCDES,CCOSDES,TDIARDES,CNTANO,CNTANOMM, '
                + 'CNTLOTE,TMONID,CNTTCAMBIO,CNTTS,CNTMODDOC,CNTFCOMP,CNTUSER,CNTFREG, '
                + 'CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS '
                + 'FROM CNT301 ';
   DMCNT.cdsMovCnt1.Close;
   DMCNT.cdsMovCnt1.DataRequest(xSQL);
   DMCNT.cdsMovCnt1.Open;
   DMCNT.cdsMovCNT2.Close;
   DMCNT.cdsMovCNT2.DataRequest(xSQL);
   DMCNT.cdsMovCNT2.Open;
end;


procedure TFConsultaComprobante.bbtnNuevoClick(Sender: TObject);
begin
   if MessageDlg(' Registrar Nuevo Comprobante'+chr(13)+chr(13)+
                 '       ¿ Esta Seguro ?      ',mtConfirmation,[mbYes, mbNo],0)=mrYes then begin
      DMCNT.wModo:='A';
      IniciaDatos;
   end;
end;

procedure TFConsultaComprobante.bbtnAnulaClick(Sender: TObject);
begin
   if MessageDlg(' Anular Comprobante Actual'+chr(13)+chr(13)+
                 '    ¿ Esta Seguro ?    ',mtConfirmation, [mbYes, mbNo], 0)=mrYes then begin

      DMCNT.cdsMovCnt1.First;
      while not DMCNT.cdsMovCnt1.EOF do begin
         DMCNT.cdsMovCnt1.Edit;
         DMCNT.cdsMovCnt1.FieldByName('CNTESTADO').AsString := 'A';
         DMCNT.cdsMovCnt1.Next;
      end;
      DMCNT.ControlTrancnt( 0 );
      //DMCNT.cdsMovCnt1.ApplyUpdates(0);

      DMCNT.cdsCabCnt.Edit;
      DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString:= 'A';
      DMCNT.ControlTrancnt(0);
      //DMCNT.cdsCabCnt.ApplyUpdates(0);
//      MovCNTDataRequest;
      DMCNT.cdsMovCnt1.First;
      dbgMovCNT.ReadOnly := True;
      ShowMessage('  Registro Anulado  ');
      bbtnAnula.Enabled  :=False;
      bbtnNuevo.Enabled  :=True;
      bbtnRegresa.Enabled:=False;
      bbtnAcepta.Enabled :=False;
      bbtnContab.Enabled :=False;
      bbtnGraba.Enabled  :=False;
      bbtnCanc2.Enabled  :=False;
      MuestraEstado(DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString,DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString);
   end;
end;

procedure TFConsultaComprobante.Z2bbtnEditSalirClick(Sender: TObject);
begin
	pnlMovCnt.Enabled   := True;
  pnlMantComp.Visible := False;
  pnlBoton.Visible    := False ;
end;

procedure TFConsultaComprobante.dblcdCuentaExit(Sender: TObject);
begin
   if (z2bbtnEditSalir.Focused) then exit;
   edtCuenta.Text:='';
   DMCNT.cdsCuenta.SetKey;
   DMCNT.cdsCuenta.FieldByName('CUENTAID').Value:=dblcdCuenta.Text;
{   DMCNT.cdsCuenta.GotoKey;
   if dblcdCuenta.Text<>'' then edtCuenta.Text:=DMCNT.cdsCuentaCtaAbr.Text;}
   if (DMCNT.cdsCuenta.GotoKey) then edtCuenta.Text:=DMCNT.cdsCuenta.FieldByName('CTAABR').AsString;
   if length(edtCuenta.Text)=0 then
   begin
      ShowMessage('Ingrese Cuenta Contable');
      dblcdCuenta.SetFocus;
   end;
   // verifica que sea Cuenta de Movimientos
   // dblcdCuenta.RefreshButton;
   if DMCNT.cdsCuenta.FieldByName('CTA_MOV').Asstring<>'S' then
   begin
        ShowMessage('Cuenta No es de Movimientos, registre!');
        edtCuenta.Text:='';
        dblcdCuenta.SetFocus;
   end;

   // evalúa si pide o no Auxiliar/Anexo
   if DMCNT.cdsCuenta.FieldByName('CTA_AUX').AsString='S' then
   begin
        dblcClase.Enabled:=True;  dblcClase.Color:=clWindow;
        dblcClase.SetFocus;
   end
   else begin
        DMCNT.cdsMovCNT1.FieldByName('CLAUXID').AsString:='';  DMCNT.cdsMovCNT1.FieldByName('AUXId').AsString:='';
        edtAux.Text:='';
        dblcClase.Enabled:=False;  dblcClase.Color:=clSilver;
        dblcdAux.Enabled :=False;  dblcdAux.Color:=clSilver;
   end;

   // evalúa si pide o no datos de documento
   if DMCNT.cdsCuenta.FieldByName('CTA_DOC').Asstring='S' then
   begin
        dblcTdoc.Enabled:=True;   dblcTdoc.Color:=clWindow;
        dbeSerie.Enabled:=True;   dbeSerie.Color:=clWindow;
        dbeNoDoc.Enabled:=True;   dbeNoDoc.Color:=clWindow;
        dblcTDoc.SetFocus;
   end
   else begin
        DMCNT.cdsMovCNT1.FieldByName('DOCID').AsString:='';    dbeTDoc.Text:='';
        DMCNT.cdsMovCNT1.FieldByName('CNTSERIE').AsString:=''; DMCNT.cdsMovCNT1.FieldByName('CNTNODOC').AsString:='';
        dblcTdoc.Enabled:=False;   dblcTdoc.Color:=clSilver;
        dbeSerie.Enabled:=False;   dbeSerie.Color:=clSilver;
        dbeNoDoc.Enabled:=False;   dbeNoDoc.Color:=clSilver;
   end;

// evalúa si pide o no Centro de Costo
   if DMCNT.cdsCuenta.FieldByName('CTA_CCOS').Asstring='S' then
   begin
        dblcdCCosto.Enabled:=True; dblcdCCosto.Color:=clWindow;
   end
   else begin
        DMCNT.cdsMovCNT1.FieldByName('CCOSID').AsString:='';  dbeCCosto.Text:='';
        dblcdCCosto.Enabled:=False;      dblcdCCosto.Color:=clSilver;
   end;
//   DMCNT.cdsMovCnt1CNTMtoOri.Value:=0;

end;

procedure TFConsultaComprobante.dblcTDocExit(Sender: TObject);
begin
	if (z2bbtnEditSalir.Focused) then exit;
  dbeTDoc.Text:='';
  if dblcTDoc.Text<>'' then
  	dbeTDoc.Text:=DMCNT.cdsTDoc.FieldByname('DOCABR').AsString;
  if length(dbeTDoc.Text)=0 then
  begin
  	ShowMessage('Ingrese Tipo de Documento');
    dblcTDoc.SetFocus;
  end;
end;

procedure TFConsultaComprobante.dblcdCCostoExit(Sender: TObject);
begin
	if (z2bbtnEditSalir.Focused) then exit;
  dbeCCosto.Text:='';
  if dblcdCCosto.Text<>'' then
  	dbeCCosto.Text:=DMCNT.cdsCCosto.FieldByName('CCOSABR').AsString;
  if length(dbeCCosto.Text)=0 then
  begin
  	ShowMessage('Ingrese Centro de Costo');
    dblcdCCosto.SetFocus;
  end;
end;

procedure TFConsultaComprobante.dbgMovCNTDblClick(Sender: TObject);
var
	xWhere : String;
begin
	if ( DMCNT.cdsMovCNT1.RecordCount = 0 ) then
  	exit ;

  xWhere := 'CUENTAID='+''''+dblcdCuenta.Text+'''';
  edtCuenta.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE202','CTADES',xWhere,'CTADES');

  xWhere := 'DOCID='+''''+dblcTDoc.Text+'''';
  dbeTDoc.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE110','DOCDES',xWhere,'DOCDES');

  xWhere := 'CCOSID='+''''+dblcdCCosto.Text+'''';
  dbeCCosto.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE203','CCOSDES',xWhere,'CCOSDES');

  pnlMovCnt.Enabled   := False ;
  pnlMantComp.Visible := True;
  pnlBoton.Visible    := True ;
end;

procedure TFConsultaComprobante.dblcClaseExit(Sender: TObject);
begin
  if (z2bbtnEditSalir.Focused) then exit;
  if length(dblcClase.Text)=0 then
  begin
  	ShowMessage('Ingrese Clase de Auxiliar');
    dblcClase.SetFocus;
  end;
  DMCNT.cdsAuxiliar.Filter:='';
  DMCNT.cdsAuxiliar.Filter:='ClAuxId='+''''+dblcClase.Text+'''';
  DMCNT.cdsAuxiliar.Filtered:=True;

  edtAux.Text:='';
  dblcdAux.Enabled :=True;  dblcdAux.Color:=clWindow;
  dblcdAux.SetFocus;
end;

procedure TFConsultaComprobante.dbeDHExit(Sender: TObject);
begin
      if (z2bbtnEditSalir.Focused) then exit;
      dbeDH.Text:=uppercase(dbeDH.Text);
      if ((dbeDH.Text<>'D') and (dbeDH.Text<>'H')) or (dbeDH.Text='') then
      begin
         ShowMessage('Digite sólo D(para Debe) o H(para Haber)');
         dbeDH.Text:='';
         dbeDH.SetFocus;
      end;
      DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString:=dbeDH.Text;
end;

procedure TFConsultaComprobante.dbeMontoExit(Sender: TObject);
begin
   if (z2bbtnEditSalir.Focused) then exit;
   if DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat <= 0 then begin
      ShowMessage('Importe debe ser mayor que cero(0)');
      DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat:=0;
      dbeMonto.SetFocus;
   end;
end;

procedure TFConsultaComprobante.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFConsultaComprobante.TotalesResumen;
begin
   dbeMND.Text     :='0';         dbeMNC.Text     :='0';
   dbeMED.Text     :='0';         dbeMEC.Text     :='0';
   dbeMNDif.Text   :='0';         dbeMEDif.Text   :='0';
   DMCNT.cdsMovCnt1.DisableControls;
   DMCNT.cdsMovCnt1.First;
   while not DMCNT.cdsMovCnt1.Eof do
   begin
        dbeMND.Text:=Format('%8.2f',[strtoFloat(dbeMND.Text)+DMCNT.cdsMovCnt1.FieldByName('CNTDEBEMN').AsFloat]);
        dbeMNC.Text:=Format('%8.2f',[strtoFloat(dbeMNC.Text)+DMCNT.cdsMovCnt1.FieldByName('CNTHABEMN').AsFloat]);
        dbeMED.Text:=Format('%8.2f',[strtoFloat(dbeMED.Text)+DMCNT.cdsMovCnt1.FieldByName('CNTDEBEME').AsFloat]);
        dbeMEC.Text:=Format('%8.2f',[strtoFloat(dbeMEC.Text)+DMCNT.cdsMovCnt1.FieldByName('CNTHABEME').AsFloat]);
        DMCNT.cdsMovCnt1.Next;
   end;
   dbeMNDif.Text:=Format('%8.2f',[strtoFloat(dbeMND.Text)-strtoFloat(dbeMNC.Text)]);
   dbeMEDif.Text:=Format('%8.2f',[strtoFloat(dbeMED.Text)-strtoFloat(dbeMEC.Text)]);
   DMCNT.cdsMovCnt1.First;   
   DMCNT.cdsMovCnt1.EnableControls;
end;


procedure TFConsultaComprobante.bbtnImprimeClick(Sender: TObject);
var
 xWhere,estado,estado1,mes,ano,mesdes, xCampos : String;
 X10:INTEGER;
begin
   DMCNT.cdsMOVCNT1.DisableControls;

   mes:=copy(edtPeriodo.text,5,2);
   ano:=copy(edtPeriodo.text,1,4);

   xWhere := 'MESIDR='''+mes+'''';
   mesdes := DMCNT.DisplayDescrip('dspTGE','TGE181','MESDESL',XWHERE,'MESDESL');

   Xwhere:='CIAID='''+DMCNT.cdsMOVCNT1.FIELDBYNAME('CIAID').ASSTRING
          +''' AND TDIARID='''+DMCNT.cdsMOVCNT1.FIELDBYNAME('TDIARID').ASSTRING
          +''' AND CNTANOMM='''+DMCNT.cdsMOVCNT1.FIELDBYNAME('CNTANOMM').ASSTRING
          +''' AND CNTCOMPROB='''+DMCNT.cdsMOVCNT1.FIELDBYNAME('CNTCOMPROB').ASSTRING+'''';

   Estado:= DMCNT.DisplayDescrip('dspTGE','CNT300','CNTCUADRE,CNTESTADO',XWHERE,'CNTCUADRE');
   estado1:=DMCNT.cdsqry.fieldbyname('CNTESTADO').asstring;

   // vhndema 14/06/2005
   //modificado por ana
   xCampos:= ''''+mesdes+' '+ano+''' PERIODO ';

   if estado1='P' then
      xsql:='SELECT A.*, B.CIADES, A.TDIARID||'' - ''||C.TDIARDES ORIGEN, '
           +  'CASE WHEN D.CNTESTADO=''P'' THEN ''Contabilizado'' '
           +       'ELSE CASE WHEN D.CNTESTADO=''I'' THEN ''Inicial'' '
           +                 'ELSE CASE WHEN D.CNTESTADO=''A'' THEN ''Anulado'' '
           +                           'ELSE ''ERROR'' END '
           +            'END '
           +  'END ESTADO, D.CNTGLOSA GLOSA, M.TMONDES MONEDA, '+xCampos
           +'FROM CNT301 A, CNT300 D, TGE101 B, TGE104 C, TGE103 M '
           +'WHERE ( A.CIAID='     +quotedstr( dblcCia.Text     ) +' AND '
           +        'A.CNTANOMM='  +quotedstr( edtPeriodo.Text  ) +' AND '
           +        'A.TDIARID='   +quotedstr( dblcTDiario.Text ) +' AND '
           +        'A.CNTCOMPROB='+quotedstr( dbeNoComp.Text   ) +' AND '
           +        'A.CIAID=D.CIAID AND A.TDIARID=D.TDIARID AND '
           +        'A.CNTANOMM=D.CNTANOMM AND A.CNTCOMPROB=D.CNTCOMPROB AND '
           +        'A.CIAID=B.CIAID AND A.TDIARID=C.TDIARID AND A.TMONID=M.TMONID ) '
           +'ORDER BY A.CIAID, A.CNTANOMM, A.TDIARID, A.CNTREG'
   else
      xsql:='SELECT A.*, B.CIADES, A.TDIARID||'' - ''||C.TDIARDES ORIGEN, '
           +  'CASE WHEN D.CNTESTADO=''P'' THEN ''Contabilizado'' '
           +       'ELSE CASE WHEN D.CNTESTADO=''I'' THEN ''Inicial'' '
           +                 'ELSE CASE WHEN D.CNTESTADO=''A'' THEN ''Anulado'' '
           +                           'ELSE ''ERROR'' END '
           +            'END '
           +  'END ESTADO, D.CNTGLOSA GLOSA, M.TMONDES MONEDA, '+xCampos
           +'FROM CNT311 A, CNT300 D, TGE101 B, TGE104 C, TGE103 M '
           +'WHERE ( A.CIAID='     +quotedstr( dblcCia.Text     ) +' AND '
           +        'A.CNTANOMM='  +quotedstr( edtPeriodo.Text  ) +' AND '
           +        'A.TDIARID='   +quotedstr( dblcTDiario.Text ) +' AND '
           +        'A.CNTCOMPROB='+quotedstr( dbeNoComp.Text   ) +' AND '
           +        'A.CIAID=D.CIAID AND A.TDIARID=D.TDIARID AND '
           +        'A.CNTANOMM=D.CNTANOMM AND A.CNTCOMPROB=D.CNTCOMPROB AND '
           +        'A.CIAID=B.CIAID AND A.TDIARID=C.TDIARID AND A.TMONID=M.TMONID ) '
           +'ORDER BY A.CIAID, A.CNTANOMM, A.TDIARID, A.CNTREG';

   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;

   ppdbVoucher.DataSource:=DMCNT.dsQry;
   {
   FImpresion := TFImpresion.Create( Self );
   FImpresion.ShowModal;
   if FImpresion.wFlTexto='C' then begin
      FImpresion.Free;
      Exit;
   end;

   if FImpresion.wFlTexto='G' then
      pprVoucher.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\Comprobante.rtm';
   if FImpresion.wFlTexto='T' then
      pprVoucher.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\ComprobanteTX.rtm';

   pprVoucher.template.LoadFromFile ;
   }
   pprv.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\ComprobanteTX.rtm';
   pprv.template.LoadFromFile ;

//   pplblDiario.caption  := 'T. de Diario : '+ dblcTDiario.text +' - '+ edtTDiario.Text;
//   pplblCia.caption:= edtCia.Text;
//   pplblFecha.caption   := 'Fecha     : ' + dtpFComp.Text;

   {FSOLPrevio:=TFSOLPrevio.Create(Self);
   With FSOLPrevio Do
   Try
     FLImpresion      := FImpresion.wFlTexto;
     ppViewer1.Report := pprVoucher;
     pprPrevio        := pprVoucher;
     CarroAncho       := False;
     TipoLetra        := 'Draft 17cpi';
     xTextName        := DMCNT.wUsuario+'Comprob';
     ShowModal;
   Finally
     FImpresion.Free;
   End;
   }

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

procedure TFConsultaComprobante.dbeGlosaExit(Sender: TObject);
begin
    xGlosa:=dbeGlosa.Text;
end;

procedure TFConsultaComprobante.Z2bbtnCloseClick(Sender: TObject);
begin
   Close ;
end;

procedure TFConsultaComprobante.RecuperaDescrip;
var
   xSQL : string ;
begin
  if (SRV_D = 'DB2NT') or
     (SRV_D = 'DB2400') then
  begin
   xSQL :=
    ' SELECT CIADES , TGE104.TDIARDES , TMONDES '
    + '   FROM CNT300 '
    + '   LEFT JOIN TGE101 ON (CNT300.CIAID = TGE101.CIAID) '
    + '   LEFT JOIN TGE104 ON (CNT300.TDIARID = TGE104.TDIARID) '
    + '   LEFT JOIN TGE103 ON (CNT300.TMONID = TGE103.TMONID) '
    + '   WHERE CNT300.CIAID = ''' + DMCNT.cdsCabCNT.fieldbyname('CIAID').AsString + ''''
    + '         AND CNT300.CNTANOMM    = ''' + DMCNT.cdsCabCnt.fieldbyname('CNTANOMM').AsString   + ''''
    + '         AND CNT300.TDIARID     = ''' + DMCNT.cdsCabCnt.fieldbyname('TDIARID').AsString    + ''''
    + '         AND CNT300.CNTCOMPROB  = ''' + DMCNT.cdsCabCnt.fieldbyname('CNTCOMPROB').AsString + '''' ;
  end
  else
   if SRV_D = 'ORACLE' then
    begin
   xSQL :=
    ' SELECT CIADES , TGE104.TDIARDES , TMONDES '
    + '   FROM CNT300,TGE101,TGE104,TGE103 '
    + '   WHERE CNT300.CIAID = ''' + DMCNT.cdsCabCNT.fieldbyname('CIAID').AsString + ''''
    + '         AND CNT300.CNTANOMM    = ''' + DMCNT.cdsCabCnt.fieldbyname('CNTANOMM').AsString   + ''''
    + '         AND CNT300.TDIARID     = ''' + DMCNT.cdsCabCnt.fieldbyname('TDIARID').AsString    + ''''
    + '         AND CNT300.CNTCOMPROB  = ''' + DMCNT.cdsCabCnt.fieldbyname('CNTCOMPROB').AsString + ''''
    + ' AND (CNT300.CIAID = TGE101.CIAID(+)) AND (CNT300.TDIARID = TGE104.TDIARID(+)) AND (CNT300.TMONID = TGE103.TMONID(+)) ';
    end;


   with DMCNT.cdsQry do
   begin
      Close;
      ProviderName:= 'PrvTGE';
      DataRequest(xSQL); // Llamada remota al provider del servidor
      Open ;
      IF RecordCount = 0 then
      begin
         Showmessage('Problemas en la Recuperación de Descripciones') ;
      end
      else
      begin
         edtCia.Text     := Fieldbyname('CIADES').AsString ;
         edtTDiario.Text := Fieldbyname('TDIARDES').AsString ;
         edtTMon.Text    := Fieldbyname('TMONDES').AsString ;
      end ;
   end ;
end;

procedure TFConsultaComprobante.pprComprobPreviewFormCreate(
  Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;
end;

{  Procedimiento de Calculo de Saldos de CCosto, en el caso de hacerlo por
   Niveles de Cuentas..... no funciona por niveles pork tendria k definirce
   en el plan de cuentas que cuando una Cta de Movimiento tiene CCosto
   tambien deberian tener las cuentas de nivel anterior
procedure TFConsultaComprobante.ContaEnLinea402;
Var
   xCCoDes, xCCosto, xFlagDist : String;
   xDigitos : Integer;
begin
   xDigitos := 0;
   DMCNT.cdsMovCNT2.First;
   DMCNT.CDSMOVCNT2.INDEXFIELDNAMES:='CIAID;TDIARID;CUENTAID;CCOSID';

   DMCNT.cdsNivel.First;
   while not DMCNT.cdsNivel.EOF do begin
      If DMCNT.cdsNivelSigno.Value = '=' then
         xDigitos := DMCNT.cdsNivelDigitos.Value;
      // Actualiza Archivo de CCosto
      DMCNT.cdsMovCNT2.First;
      while not DMCNT.cdsMovCNT2.EOF do begin

        If DMCNT.cdsNivelSigno.Value <> '=' then
           xDigitos := Length( DMCNT.cdsMovCNT2CuentaID.Value );

        xCuenta  := Copy(DMCNT.cdsMovCNT2CuentaID.Value, 1, xDigitos );
        xTDiario := DMCNT.cdsMovCNT2TDiarID.Value;
        xCCosto  := DMCNT.cdsMovCNT2CCosID.Value;
        xTDiarDes:= DMCNT.cdsMovCNT2TDiarDes.Value;
        xCCoDes  := DMCNT.cdsMovCNT2CCosDes.Value;

//        xFlagDist := '';
        xTDebeMN:=0; xTDebeME:=0; xTHabeMN:=0; xTHabeME:=0;

        DMCNT.cdsCuenta.SetKey;
        DMCNT.cdsCuentaCiaID.Value    := xCia;
        DMCNT.cdsCuentaCuentaID.Value := xCuenta;
        if DMCNT.cdsCuenta.GotoKey then begin
            xCtaDes:=DMCNT.cdsCuentaCtaAbr.Value;
//            xFlagDist := DMCNT.cdsCuentaCta_DGas.Value;
        end
        else xCtaDes:='';

//        If xFlagDist='S' then Begin   // Si es Cta de Gasto

         while (not DMCNT.cdsMovCNT2.EOF ) and
               (xCuenta=Copy(DMCNT.cdsMovCNT2CuentaID.Value, 1, xDigitos ) ) and
               (xTDiario=DMCNT.cdsMovCNT2TDiarID.Value) and
               (xCCosto =DMCNT.cdsMovCNT2CCosID.Value) do begin

            xTDebeMN := xTDebeMN + DMCNT.cdsMovCNT2CNTDebeMN.AsFloat;
            xTDebeME := xTDebeME + DMCNT.cdsMovCNT2CNTDebeME.AsFloat;
            xTHabeMN := xTHabeMN + DMCNT.cdsMovCNT2CNTHabeMN.AsFloat;
            xTHabeME := xTHabeME + DMCNT.cdsMovCNT2CNTHabeME.AsFloat;

            DMCNT.cdsMovCNT2.Next;
            Application.ProcessMessages;
         end;
         DMCNT.cdsRCCosto.SetKey;
         DMCNT.cdsRCCostoCiaID.Value    := xCia;
         DMCNT.cdsRCCostoAno.Value      := xAno;
         DMCNT.cdsRCCostoTDiarId.Value  := xTDiario;
         DMCNT.cdsRCCostoCuentaID.Value := xCuenta;
         DMCNT.cdsRCCostoCCosId.Value   := xCCosto;
         if DMCNT.cdsRCCosto.GotoKey then
            DMCNT.cdsRCCosto.Edit
         else begin
            DMCNT.cdsRCCosto.Insert;
            DMCNT.cdsRCCostoCiaID.Value    := xCia;
            DMCNT.cdsRCCostoAno.Value      := xAno;
            DMCNT.cdsRCCostoTDiarId.Value  := xTDiario;
            DMCNT.cdsRCCostoCuentaID.Value := xCuenta;
            DMCNT.cdsRCCostoCCosId.Value   := xCCosto;
            DMCNT.cdsRCCostoCtaDes.Value   := xCtaDes;
            DMCNT.cdsRCCostoTDiarDes.Value := xTDiarDes;
            DMCNT.cdsRCCostoCCoDes.Value   := xCCoDes;
            DMCNT.cdsRCCosto.FieldByName(xSaldMN).Value := 0;
            DMCNT.cdsRCCosto.FieldByName(xSaldME).Value := 0;
         end;

         DMCNT.cdsRCCostoTipo.Value := DMCNT.cdsNivelNivel.Value;

         DMCNT.cdsRCCosto.FieldByName( xDebeMN ).AsFloat := DMCNT.cdsRCCosto.FieldByName( xDebeMN ).AsFloat+xTDebeMN;
         DMCNT.cdsRCCosto.FieldByName( xHabeMN ).AsFloat := DMCNT.cdsRCCosto.FieldByName( xHabeMN ).AsFloat+xTHabeMN;
         DMCNT.cdsRCCosto.FieldByName( xDebeME ).AsFloat := DMCNT.cdsRCCosto.FieldByName( xDebeME ).AsFloat+xTDebeME;
         DMCNT.cdsRCCosto.FieldByName( xHabeME ).AsFloat := DMCNT.cdsRCCosto.FieldByName( xHabeME ).AsFloat+xTHabeME;
//         DMCNT.cdsRCCosto.Post;
         nn:=0;
         While (strtofloat(Copy(edtPeriodo.Text,5,2))+(nn+1))<14 do Begin
          // Saldos meses siguientes
           xMes    := Copy(floattostr(strtofloat(edtPeriodo.Text)+(nn)),5,2);
           xSaldMNs:='SALDMN'+Copy(floattostr(strtofloat(edtPeriodo.Text)+(nn+1)),5,2);
           xSaldMEs:='SALDME'+Copy(floattostr(strtofloat(edtPeriodo.Text)+(nn+1)),5,2);
          // Saldo mes sgte:= Saldo Mes Act + (debe mes act - haber mes act)
           DMCNT.cdsRCCosto.FieldByName(xSaldMNS).Value:=DMCNT.cdsRCCosto.FieldByName('SALDMN'+xMes).AsFloat
            +(DMCNT.cdsRCCosto.FieldByName('DEBEMN'+xMes).AsFloat-DMCNT.cdsRCCosto.FieldByName('HABEMN'+xMes).AsFloat);
           DMCNT.cdsRCCosto.FieldByName(xSaldMES).Value:=DMCNT.cdsRCCosto.FieldByName('SALDME'+xMes).AsFloat
            +(DMCNT.cdsRCCosto.FieldByName('DEBEME'+xMes).AsFloat-DMCNT.cdsRCCosto.FieldByName('HABEME'+xMes).AsFloat);
           nn:=nn+1;
         End;

//        End  // Si es cta de Gasto
//        else DMCNT.cdsMovCNT2.Next; // Si no es Cta de Gasto
      end;
      DMCNT.cdsNivel.Next;
   end;
   //DMCNT.cdsRCCosto.ApplyUpdates( 0 );  // inicial

end;}

procedure TFConsultaComprobante.sbDisenoRepClick(Sender: TObject);
begin
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
end;

end.


