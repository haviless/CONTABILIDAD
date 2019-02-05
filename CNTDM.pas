unit CNTDM;

// HPC_201402_CNT 03/03/2014  Modificar los ControlTrans, AplicaDato y los ApplyUpdates.
// HPC_201501_CNT 26/02/2015  Se agregan 2 cdsQry de trabajo
// HPC_201502_CNT             Modificaciones en el formulario segun DAF_2015000640_CNT_1
// HPC_201503_CNT 05/10/2015  Se cancela apertura del Maestro de Auxiliares para que sea aperturado desde el propio registro de comprobantes contables.
// HPC_201601_CNT 18/01/2016: Se define la variable wTMonLocDes para descripción de la Moneda Local
//                            Se define la variable wTMonExtDes para descripción de la Moneda Extranjera
// HPC_201703_CNT           : Seguros-Automatización de Devengue de Seguros

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, DBClient, wwclient, MConnect, extctrls, comctrls,
  Provider, RecError, oaContabiliza, Variants, IniFiles,
// Inicio HPC_201601_CNT
// Se retira componente por no ser necesario
//  wwExport, ExcelXP, OleServer, DBGrids, SConnect, Mant, winsock, Excel2000;
// Inicio HPC_201703_CNT
// Seguros-Automatización de Devengue de Seguros
  wwExport, OleServer, DBGrids, SConnect, Mant, winsock, Excel2000, ExcelXP;
// Fin HPC_201703_CNT
// Fin HPC_201601_CNT

type
  TDMCNT = class(TDataModule)
    cdsCia: TwwClientDataSet;
    dsCia: TwwDataSource;
    cdsTDiario: TwwClientDataSet;
    dsTDiario: TwwDataSource;
    cdsCuenta: TwwClientDataSet;
    dsCuenta: TwwDataSource;
    cdsClAux: TwwClientDataSet;
    dsClAux: TwwDataSource;
    cdsTDoc: TwwClientDataSet;
    dsTDoc: TwwDataSource;
    cdsCCosto: TwwClientDataSet;
    dsCCosto: TwwDataSource;
    cdsAuxiliar: TwwClientDataSet;
    dsAuxiliar: TwwDataSource;
    cdsQry: TwwClientDataSet;
    dsQry: TwwDataSource;
    cdsMovCNT: TwwClientDataSet;
    dsMovCNT: TwwDataSource;
    cdsTMon: TwwClientDataSet;
    dsTMon: TwwDataSource;
    dsMovCNT2: TwwDataSource;
    cdsNivel: TwwClientDataSet;
    cdsRCuenta: TwwClientDataSet;
    cdsRCCosto: TwwClientDataSet;
    cdsRMayor: TwwClientDataSet;
    dsNivel: TwwDataSource;
    dsRCuenta: TwwDataSource;
    dsRCCosto: TwwDataSource;
    dsRMayor: TwwDataSource;
    cdsRMayor2: TwwClientDataSet;
    dsRMayor2: TwwDataSource;
    cdsDetCxP: TwwClientDataSet;
    dsDetCxP: TwwDataSource;
    dsMovCxP: TwwDataSource;
    cdsMovCaja: TwwClientDataSet;
    dsMovCaja: TwwDataSource;
    cdsDetCaja: TwwClientDataSet;
    cdsMovRRHH: TwwClientDataSet;
    dsMovRRHH: TwwDataSource;
    dsMovCNT1: TwwDataSource;
    cdsCierres: TwwClientDataSet;
    dsCierres: TwwDataSource;
    cdsTipCta: TwwClientDataSet;
    dsTipCta: TwwDataSource;
    cdsCtaConsol: TwwClientDataSet;
    dsCtaConsol: TwwDataSource;
    cdsCuenta2: TwwClientDataSet;
    dsCuenta2: TwwDataSource;
    cdsCuenta3: TwwClientDataSet;
    dsCuenta3: TwwDataSource;
    cdsCtaConsol2: TwwClientDataSet;
    cdsCtaConsol3: TwwClientDataSet;
    dsCtaConsol2: TwwDataSource;
    dsCtaConsol3: TwwDataSource;
    cdsAcceso: TwwClientDataSet;
    cdsGrupos: TwwClientDataSet;
    cdsMGrupo: TwwClientDataSet;
    cdsUsuarios: TwwClientDataSet;
    cdsDoc2: TwwClientDataSet;
    cdsCabCNT: TwwClientDataSet;
    dsCabCNT: TwwDataSource;
    cdsMovCxC: TwwClientDataSet;
    dsMovCxC: TwwDataSource;
    cdsDetCxC: TwwClientDataSet;
    dsDetCxC: TwwDataSource;
    dsDetCaja: TwwDataSource;
    cdsREI: TwwClientDataSet;
    dsREI: TwwDataSource;
    cdsCIAFactores: TwwClientDataSet;
    dsCiaFactores: TwwDataSource;
    cdsMayorAux: TwwClientDataSet;
    cdsMayorAuxA: TwwClientDataSet;
    dsMayorAux: TwwDataSource;
    dsMayorAuxA: TwwDataSource;
    dsAcceso: TwwDataSource;
    dsGrupos: TwwDataSource;
    dsMGrupo: TwwDataSource;
    dsUsuarios: TwwDataSource;
    cdsQry2: TwwClientDataSet;
    cdsRepAux: TwwClientDataSet;
    cdsRepAux2: TwwClientDataSet;
    dsRepAux: TwwDataSource;
    dsRepAux2: TwwDataSource;
    cdsCuentaLookUp: TwwClientDataSet;
    dsCuentaLookUp: TwwDataSource;
    cdsCuenta5: TwwClientDataSet;
    dsCuenta5: TwwDataSource;
    cdsCtaDestino: TwwClientDataSet;
    dsCtaDestino: TwwDataSource;
    cdsQry3: TwwClientDataSet;
    cdsDeltaSet: TwwClientDataSet;
    cdsResultSet: TwwClientDataSet;
    dsDeltaSet: TwwDataSource;
    dsQry2: TwwDataSource;
    dsSaldos: TwwDataSource;
    cdsSaldos: TwwClientDataSet;
    csdCnt406: TwwClientDataSet;
    sdCnt406: TwwDataSource;
    cds3: TClientDataSet;
    cdsReporte: TwwClientDataSet;
    dsReporte: TwwDataSource;
    cdsVariable: TwwClientDataSet;
    cdsCNT311: TwwClientDataSet;
    dsCNT311: TwwDataSource;
    cdsQry4: TwwClientDataSet;
    cdsCntCont: TwwClientDataSet;
    dsCntCont: TwwDataSource;
    dsREIActivo: TwwDataSource;
    cdsREIActivo: TwwClientDataSet;
    dsREIPasivo: TwwDataSource;
    cdsREIPasivo: TwwClientDataSet;
    cdsSustento: TwwClientDataSet;
    dsSustento: TwwDataSource;
    dsQry3: TwwDataSource;
    cdsComboCtaConsol: TwwClientDataSet;
    dsComboCtaConsol: TwwDataSource;
    cdsReporteC: TwwClientDataSet;
    dsReporteC: TwwDataSource;
    cdsUser: TwwClientDataSet;
    dsUser: TwwDataSource;
    dsVariable: TwwDataSource;
    cdsConsistencia: TwwClientDataSet;
    dsConsistencia: TwwDataSource;
    cdsSQL: TwwClientDataSet;
    dsSQL: TwwDataSource;
    cdsLiqCon: TwwClientDataSet;
    dsLiqCon: TwwDataSource;
    cdsLiqDet: TwwClientDataSet;
    dsLiqDet: TwwDataSource;
    ExcelApp: TExcelApplication;
    ExcelBook: TExcelWorkbook;
    WS: TExcelWorksheet;
    cdsMovCNT1: TwwClientDataSet;
    cdsMovCNT2: TwwClientDataSet;
    cdsMovCxP: TwwClientDataSet;
    cdsCNTtemp: TwwClientDataSet;
    DCOM1: TSocketConnection;
    cdsBloqueo: TwwClientDataSet;
    dsBloqueo: TwwDataSource;
    cdsGrabaLog: TwwClientDataSet;
    cdsReporteCuenta: TwwClientDataSet;
    dsReporteCuenta: TwwDataSource;
 // Inicio HPC_201501_CNT
    dsQry4: TwwDataSource;
    cdsQry5: TwwClientDataSet;
    dsQry5: TwwDataSource;
// Inicio HPC_201703_CNT
// Seguros-Automatización de Devengue de Seguros
    cdsQry6: TwwClientDataSet;
    dsQry6: TwwDataSource;
    cdsQry7: TwwClientDataSet;
    dsQry7: TwwDataSource;
    cdsQry8: TwwClientDataSet;
    dsQry8: TwwDataSource;
    cdsQry9: TwwClientDataSet;
    dsQry9: TwwDataSource;
    cdsQry10: TwwClientDataSet;
    dsQry10: TwwDataSource;
    cdsQry11: TwwClientDataSet;
    dsQry11: TwwDataSource;
    cdsQry12: TwwClientDataSet;
    dsQry12: TwwDataSource;
    cdsQry13: TwwClientDataSet;
    dsQry13: TwwDataSource;
    cdsQry14: TwwClientDataSet;
    dsQry14: TwwDataSource;
    cdsQry15: TwwClientDataSet;
    dsQry15: TwwDataSource;
    cdsQry16: TwwClientDataSet;
    dsQry16: TwwDataSource;
    cdsQry17: TwwClientDataSet;
    dsQry17: TwwDataSource;
    cdsQry18: TwwClientDataSet;
    dsQry18: TwwDataSource;
    cdsQry19: TwwClientDataSet;
    dsQry19: TwwDataSource;
    cdsQry20: TwwClientDataSet;
    dsQry20: TwwDataSource;
// Fin HPC_201703_CNT
 // Fin HPC_201501_CNT
    
    procedure AplicaDatos(wCDS: TClientDataSet; wNomArch : String);
    procedure FiltraTabla( xxCds:TwwClientDataSet; xxArchivo,xxCampo:String  );
    procedure ControlTranCNT( wControlError : Integer );
    procedure cdsMovCNTCNTDHChange(Sender: TField);
    procedure cdsMovCNTAfterOpen(DataSet: TDataSet);
    procedure cdsTMonAfterOpen(DataSet: TDataSet);
    procedure cdsCiaAfterOpen(DataSet: TDataSet);
    procedure cdsMovCNTBeforeOpen(DataSet: TDataSet);
    procedure ActualizaData(wCDS: TwwClientDataSet);
    procedure cdsMovCNT2CalcFields(DataSet: TDataSet);
    procedure Filtracds( xxCds:TwwClientDataSet; xxSQL:String  );
    function DesEncripta(wPalabra:String): String;
    function Encripta(wPalabra:String): String;
    function OperClientDataSet( ClientDataSet : TwwClientDataSet;Expression, Condicion : String  ) : Double;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsCabCNTReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsMovCNTReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsRMayorReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsRCuentaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsMayorAuxReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsMayorAuxAReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsMovCNT1ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsCuentaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    wDBFunc01,wDBFunc02 : String;
    pnlConta : TPanel;
    pbConta  : tprogressbar ;
    FormatCel: array of OleVariant;
  public
    // vhndema
    cIP, wOfiId, widepc, ideconex, fechorcon :String;
    cFilterCiaUser     : String;
    cFilterOrigenUser  : String;
    cFilterCuentaUser  : String;
    cFilterUsuarioUser : String;
    cOpcionOasis       : String;
    // end vhndema

    //SRV_D : String;
    inifile : TIniFile;
    sClose, wSRV : String;

    wTipoCambioUsar : String;
    wTMonExt : string; // Tipo de Moneda extranjera oficial (normalmente dólares)
    wTMonLoc : string;
// Inicio HPC_201601_CNT
// Se define la variables para descripción y abreviatura de la Moneda Local y Moneda Extranjera
    wTMonLocDes: String;
    wTMonExtDes: String;
    wTMonLocAbr: String;
    wTMonExtAbr: String;
//Fin HPC_201601_CNT
    wUserName : array[0..63] of char;
    wModo:String;
    // Accesos al Sistema
    wUsuario    : string;
    wObjetoDescr: String;
    wObjetoForma: String;
    wObjetoNombr: String;
    wObjetoDesPr: String;
    wModulo     : String;
    wGrupo      : String;
    wGrupoTmp   : String;
    wAdmin      : String;
    wComponente : TControl;
    // Fin Accesos al Sistema
    //wmc
    wAnoHoy ,
    wMesHoy ,
    wDiaHoy : Word ;

    //
    xNivelCta: Integer;
    //** 23/04/2001 - pjsv , para saber que tipo de cambio se va a usar
    wTCCompra,wTCVenta  :String;
    //**

    wTipoAdicion : String; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa

    procedure HojaExcel(Tit: string; TDs: TDataSource; TDb: TDBGrid);
    procedure FormatosCeldas(N: Integer ; TDs: TDataSource);


    procedure TransferiraCNT(pCIAID,pECANOMM,pTDIARID,pECNOCOMP,pMod:String) ;
    function  Contabiliza( xCia, xTDiario, xAnoMM, xNoComp : String ): Boolean;
    procedure GeneraEnLinea401( xxxCia,xxxDiario,xxxAnoMM,xxxNoComp: String );
    procedure PanelMsg( xMensaje:String; xProc:Integer ) ;
    procedure CreaPanel( xForma:TForm; xMensaje:String );
    function CuentaExiste( xxxxCia, xxxxAno, xxxxCuenta, xxxxAux,xxxxCCos : String ) : Boolean;
    procedure ActualizaMov(cCia,cAnoMM,cCuenta,cClAux,cAux,cCCosto,cDH, cMov,
                            cCtaDes,cAuxDes,cCCoDes,cNivel: String;nImpMN,nImpME:Single );
    procedure InsertaMov(cCia,cAnoMM,cCuenta,cClAux,cAux,cCCosto,cDH,cMov,
                          cCtaDes,cAuxDes,cCCoDes,cNivel: String; nImpMN,nImpME: Single);

    procedure GeneraContabilidad( xxCia, xxTDiario, xxAnoMM, xxNoComp: String;
                                   xForma: TForm; xxModulo : String );

    //**

    function DisplayDescrip(wPrv,wTabla,wCampos,wWhere,wResult:string):string;
    function DisplayInteger(wPrv,wTabla,wCampos,wWhere,wResult:string):Integer;
    function DisplayReal(wPrv,wTabla,wCampos,wWhere,wResult:string):DOUBLE;
    function UltimoNum(wPrv,wTabla,wCampo,wWhere:string):string;
    function StrZero(wNumero:String;wLargo:Integer):string;
    function NombreMes(wNumero:String):string;
// Inicio HPC_201703_CNT
// Seguros-Automatización de Devengue de Seguros
    function NombreLetra(wNumero:String):string;
// Fin HPC_201703_CNT
    function FRound(xReal:DOUBLE;xEnteros,xDecimal:Integer):DOUBLE;
    function BuscaFecha(wPrv,wTabla,wCampos,wWhere:string;wResult:string):TDate;
    function strMes (Fecha : TDateTime) : String ;
    function strAno (Fecha : TDateTime) : String ;
    function  BuscaObjeto( Const xNombre:String; xForm:TForm):TControl ;
    procedure AccesosUsuariosR(xxModulo,xxUsuario,xxTipo:String; xxForma:TForm) ;
    Procedure AccesosUsuarios(xxModulo,xxUsuario,xxTipo,xxForma:String) ;
    function  RecuperarDatos(xTabla,xCampos,xWhere : String): Boolean ;
    Function MesCerrado(xMes,xAno,xCiaid : String) : Boolean;
    Function Buscar(pCadena,pEsto: String) : STring;
    procedure ActualizaFiltro(wwFiltro:TMant;wwCdsLee:TwwClientDataSet;wwAccion:String);
    function FiltraCiaPorUsuario( cdsCiaUser :TwwClientDataSet ) : String;
    // Ini vhn
    function FiltraOrigenPorUsuario( cdsOrigenUser :TwwClientDataSet ) : String;
    function FiltraOrigenPorUsuario_Cia( xxArchivo, xxCampo : String ) : String;
    function FiltraCuentaPorUsuario : String;
    function FiltraCuentaPorUsuario_Cia( xxArchivo, xxCampo : String ) : String;
    function FiltraUsuarioPorUsuario_Cia( xxArchivo, xxCampo : String ) : String;
    function FiltraTablaxCia( xxCds:TwwClientDataSet; xxArchivo, xxCampo, xxCiaSel : String  ) : String;
    // Fin vhn
    function ObtenerIpdeNetbios(Host: string): string;
    function ComputerName: string;
    function AccesosModulo :  Boolean;
    function VerificaVersion(pgVersion:String): Boolean;
    procedure Graba_Log_Consultas( sLog_Modulo, sLog_Usuario, sLog_Opcion,
       sLog_Cia, sLog_PerIni, sLog_PerFin, sLog_FecIni, sLog_FecFin, sLog_Nivel,
       sLog_Diario, sLog_Lote, sLog_Moneda, sLog_Cuentas, sLog_Auxs, sLog_Costos,
       sLog_TipSal, sLog_TipRep : String );
    function Accesos_a_Registros( sUsuarioReg : String ) : Boolean;
     //INICIO HPC_201206_CNT
     function fg_VerificaVersion(wgVersion :String): Boolean;
     //FIN HPC_201206_CNT

  // Inicio HPC_201502_CNT
     Function Valores(Texto: String): Currency;
  // Fin HPC_201502_CNT
// Inicio HPC_201703_CNT
// Seguros-Automatización de Devengue de Seguros
  Function  UltDiaMes(xAnoMes : String) : String;
// Fin HPC_201703_CNT
  end;

var
  DMCNT: TDMCNT;
  wBD : String;
  wFlagDebe, xValidaLinea : Boolean;
  SRV_E, SRV_D, SRV_V, wRptCia, wRutaRpt, wDir_Giro :string;
  wRepHorServi,wRepFuncDate,wFormatFecha,wReplacCeros,wRepFecServi:string;
  ErrorCount : Integer;
// Inicio HPC_201402_CNT
  xSigueGrab : Boolean;
// Fin HPC_201402_CNT


  function  BuscaReg( PCia,PTDiario,PAnoMes,PNoReg:String ):Boolean;
  procedure cdsPost( xxCds:TwwClientDataSet );

implementation

{$R *.DFM}

Uses CNT020;

function TDMCNT.Accesos_a_Registros( sUsuarioReg : String ) : Boolean;
begin
   Result:=False;
   if wAdmin='C' then
   begin
      ShowMessage('Usuario '+wUsuario+', Solo tiene Acceso a consultar los Comprobantes registrados por : '+sUsuarioReg);
      Exit;
   end;

   if wAdmin='U' then
   begin
      if sUsuarioReg<>wUsuario then
      begin
         ShowMessage('Usuario '+wUsuario+', no tiene Acceso a modificar los Comprobantes Registrados por : '+sUsuarioReg);
         Exit;
      end;
   end;
   Result:=True;
end;

procedure TDMCNT.Graba_Log_Consultas( sLog_Modulo, sLog_Usuario, sLog_Opcion,
  sLog_Cia, sLog_PerIni, sLog_PerFin, sLog_FecIni, sLog_FecFin, sLog_Nivel,
  sLog_Diario, sLog_Lote, sLog_Moneda, sLog_Cuentas, sLog_Auxs, sLog_Costos,
  sLog_TipSal, sLog_TipRep : String );
var
  sLogC : String;
  sLogV : String;
begin
  sLogC:='insert into db2admin.aud_acc_oasis_log( modulo, fecha, usuario, opcion';
  sLogV:='values( '''+sLog_Modulo+''', SYSDATE, '''+sLog_Usuario+''', '''+sLog_Opcion+'''';

  if sLog_Cia<>'' then
  begin
     sLogC:=sLogC+', ciaid';
     sLogV:=sLogV+', '''+sLog_Cia+'''';
  end;

  if sLog_PerIni<>'' then
  begin
     sLogC:=sLogC+', per_ini';
     sLogV:=sLogV+', '''+sLog_PerIni+'''';
  end;

  if sLog_PerFin<>'' then
  begin
     sLogC:=sLogC+', per_fin';
     sLogV:=sLogV+', '''+sLog_PerFin+'''';
  end;

  if sLog_FecIni<>'' then
  begin
     sLogC:=sLogC+', fec_Ini';
     sLogV:=sLogV+', '''+sLog_FecIni+'''';
  end;

  if sLog_FecFin<>'' then
  begin
     sLogC:=sLogC+', fec_Fin';
     sLogV:=sLogV+', '''+sLog_FecFin+'''';
  end;

  if sLog_Nivel<>'' then
  begin
     sLogC:=sLogC+', nivel';
     sLogV:=sLogV+', '''+sLog_Nivel+'''';
  end;

  if sLog_Diario<>'' then
  begin
     sLogC:=sLogC+', origen';
     sLogV:=sLogV+', '''+sLog_Diario+'''';
  end;

  if sLog_Lote<>'' then
  begin
     sLogC:=sLogC+', lote';
     sLogV:=sLogV+', '''+sLog_Lote+'''';
  end;

  if sLog_Moneda<>'' then
  begin
     sLogC:=sLogC+', moneda';
     sLogV:=sLogV+', '''+sLog_Moneda+'''';
  end;

  if sLog_Cuentas<>'' then
  begin
     sLogC:=sLogC+', cuentas';
     sLogV:=sLogV+', '''+sLog_Cuentas+'''';
  end;

  if sLog_Auxs<>'' then
  begin
     sLogC:=sLogC+', auxs';
     sLogV:=sLogV+', '''+sLog_Auxs+'''';
  end;

  if sLog_Costos<>'' then
  begin
     sLogC:=sLogC+', ccostos';
     sLogV:=sLogV+', '''+sLog_Costos+'''';
  end;

  if sLog_TipSal<>'' then
  begin
     sLogC:=sLogC+', tipo_salida';
     sLogV:=sLogV+', '''+sLog_TipSal+'''';
  end;

  if sLog_TipRep<>'' then
  begin
     sLogC:=sLogC+', tipo_rep';
     sLogV:=sLogV+', '''+sLog_TipRep+'''';
  end;

  sLogC:=sLogC+' ) ';
  sLogV:=sLogV+' ) ';

  DMCNT.cdsGrabaLog.Close;
  DMCNT.cdsGrabaLog.DataRequest( sLogC+sLogV );
  try
     DMCNT.cdsGrabaLog.Execute;
  except
  end;
end;



function TDMCNT.ObtenerIpdeNetbios(Host: string): string;
var
  WSAData: TWSADATA;
  HostEnt: phostent;
begin
  Result:= '';
  if WSAStartup(MAKEWORD(1, 1), WSADATA) = 0 then
  begin
    HostEnt:= gethostbyname(PChar(Host));
    if HostEnt <> nil then
      Result:= String(inet_ntoa(PInAddr(HostEnt.h_addr_list^)^));
    WSACleanup;
  end;
end;

function TDMCNT.ComputerName: string;
var
  Buffer: array[ 0..100 ] of Char;
  MaxSize: Cardinal ;
begin
  MaxSize := SizeOf( Buffer );
  if not GetComputerName( @Buffer, MaxSize ) then
    raise Exception.Create( 'No puedo determinar el nombre de la máquina' );
  Result := StrPas( @Buffer );
end;


procedure cdsPost( xxCds:TwwClientDataSet );
var
   i:integer;
begin
   xxCds.Edit;
   for i:=0 to xxCds.Fields.Count-1 do begin

       if xxCds.Fields[ i ].ClassType=TStringField then begin
          if xxCds.Fields[ i ].AsString='' then
             xxCds.Fields[ i ].Clear;
       end;

       if xxCds.Fields[ i ].ClassType=TMemoField then begin
          if xxCds.Fields[ i ].AsString='' then
             xxCds.Fields[ i ].AsString:=' ';
       end;

   end;
end;


procedure TDMCNT.AplicaDatos(wCDS: TClientDataSet; wNomArch : String);
var
  Delta, Results, OwnerData : OleVariant;
begin
//  if SRV_D = 'DB2NT' then
//        DMCNT.DCOM1.AppServer.ParamDSPGraba('1', wNomArch);
     wCDS.CheckBrowseMode;

//    cdsDeltaSet.Data := wcds.Delta.  ;
{    If not wDS.DataSet.IsEmpty then
      begin}
       Results:=DCOM1.AppServer.AS_ApplyUpdates(wCDS.ProviderName,wcds.Delta, -1,
                                              ErrorCount,OwnerData);
       cdsResultSet.Data := Results;
       wCDS.Reconcile(Results);
//      end;
// NO Borrar
//    If wErrorCode = 1 then // Este Mensaje de Error es porque al Momento de Grabar Otro Usuario a alterado los datos tomados en un inicio
//     begin
//      wCds.refresh;
//      // Ejecutar el procedimiento de Registro
//     end;

//  if SRV_D = 'DB2NT' then
//     DMCNT.DCOM1.AppServer.ParamDSPGraba('0', wNomArch);

end;


procedure TDMCNT.ControlTranCNT( wControlError : Integer );
begin
   if wControlError=1 then begin
      DMCNT.Dcom1.AppServer.RetornaTransaccion;  // SolRollBack;
      ErrorCount:=1;
      ShowMessage('Avise a su Proveedor de Software...( 1 )');
      Application.Terminate;
   end;
   if wControlError=3 then begin
//      Dcom1.AppServer.SOLStartTransaction;
      ErrorCount:=0;
   end;

   if ( ErrorCount = 0) and ((cdsRCuenta.ChangeCount > 0) or (cdsRCuenta.Modified)) then
       DMCNT.AplicaDatos(DMCNT.cdsRCuenta, 'RCUENTA');
   if ( ErrorCount = 0) and ((cdsRCCosto.ChangeCount > 0)  or (cdsRCCosto.Modified )) then
       DMCNT.AplicaDatos(DMCNT.cdsRCCosto, 'RCCOSTO');
   if ( ErrorCount = 0) and ((cdsMovCNT2.ChangeCount > 0)   or (cdsMovCNT2.Modified  )) then
       DMCNT.AplicaDatos(DMCNT.cdsMovCNT2, 'MOVCNT2'   );
   if ( ErrorCount = 0) and ((cdsCabCnt.ChangeCount > 0)   or (cdsCabCnt.Modified  )) then
       DMCNT.AplicaDatos(DMCNT.cdsCabCnt,  'CABCNT'   );
   if ( ErrorCount = 0) and ((cdsMovCNT1.ChangeCount > 0)   or (cdsMovCNT1.Modified  )) then
       DMCNT.AplicaDatos(DMCNT.cdsMovCNT1, 'MOVCNT1'   );
   if ( ErrorCount = 0) and ((cdsCierres.ChangeCount > 0)  or (cdsCierres.Modified )) then
       DMCNT.AplicaDatos(DMCNT.cdsCierres, 'CIERRES');
   if ( ErrorCount = 0) and ((cdsCtaConsol.ChangeCount > 0)  or (cdsCtaConsol.Modified )) then // prvMovCNT
       DMCNT.AplicaDatos(DMCNT.cdsCtaConsol, 'CTACONSOL'  );
   if ( ErrorCount = 0) and ((cdsCtaConsol2.ChangeCount > 0) or (cdsCtaConsol2.Modified)) then
       DMCNT.AplicaDatos(DMCNT.cdsCtaConsol2, 'CTACONSOL2');
   if ( ErrorCount = 0) and ((cdsCuenta.ChangeCount > 0)  or (cdsCuenta.Modified )) then
       DMCNT.AplicaDatos(DMCNT.cdsCuenta,  'CUENTA');
   if ( ErrorCount = 0) and ((cdsCuenta2.ChangeCount > 0)  or (cdsCuenta2.Modified )) then
       DMCNT.AplicaDatos(DMCNT.cdsCuenta2, 'CUENTA2');
   if ( ErrorCount = 0) and ((cdsMGrupo.ChangeCount > 0)  or (cdsMGrupo.Modified )) then
       AplicaDatos(cdsMGrupo, 'MGRUPO');
   if ( ErrorCount = 0) and ((cdsGrupos.ChangeCount > 0)   or (cdsGrupos.Modified  )) then
       AplicaDatos(cdsGrupos, 'GRUPOS'   );
   if (ErrorCount = 0) and ((cdsUsuarios.ChangeCount > 0)  or (cdsUsuarios.Modified )) then
       AplicaDatos(cdsUsuarios, 'USUARIOS');

   if (ErrorCount = 0) and ((cdsQry.ChangeCount > 0)  or (cdsQry.Modified )) then
       AplicaDatos(cdsQry, 'Qry');

   if (ErrorCount = 0) and ((cds3.ChangeCount > 0)  or (cds3.Modified )) then
       AplicaDatos(cds3, 'Qry');

   If ErrorCount = 0 then
      DMCNT.Dcom1.AppServer.GrabaTransaccion   //SolCommit
   else begin
      DMCNT.Dcom1.AppServer.RetornaTransaccion;  //SolRollBack;

      if DMCNT.cdsCabCnt.Active then
         DMCNT.cdsCabCnt.CancelUpdates;
      if DMCNT.cdsMovCNT1.Active then
         DMCNT.cdsMovCNT1.CancelUpdates;
      if DMCNT.cdsCuenta.Active then
         DMCNT.cdsCuenta.CancelUpdates;

      ShowMessage('Avise a su Proveedor de Software...( 2 )');
      Application.Terminate;
   end;
end;


procedure TDMCNT.FiltraTabla( xxCds:TwwClientDataSet; xxArchivo,xxCampo:String  );
var
   xFiltro : String;
   xSQL2:string;
begin
   cdsAcceso.Filtered := False;
   cdsAcceso.Filter   := '';
   cdsAcceso.Filter   := 'NTABLA='+''''+xxArchivo+'''';
   cdsAcceso.Filtered := True;

   xFiltro := '';
   cdsAcceso.First;
   while not cdsAcceso.Eof do begin
      If Length(xFiltro)=0 then
         xFiltro:=xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''''
      else
         xFiltro:=xFiltro+' OR '+xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+'''';
      cdsAcceso.Next;
   end;

   if Length(xFiltro)>0 then begin
      xSQL2 := 'SELECT * FROM '+ xxArchivo+' WHERE '+xFiltro;
      xxCds.Close;
      xxCds.DataRequest( xSQL2 );
   end;
   xxCds.Open;
//   pbTablas.Position := pbTablas.Position + 1;
end;


function TDMCNT.FiltraTablaxCia( xxCds:TwwClientDataSet; xxArchivo, xxCampo, xxCiaSel : String  ) : String;
var
   xFiltro : String;
   xSQL2:string;
begin
   cdsAcceso.Filtered := False;
   cdsAcceso.Filter   := '';
   cdsAcceso.Filter   := 'NTABLA='+''''+xxArchivo+''' and CIAID='''+xxCiaSel+''' ';
   cdsAcceso.Filtered := True;

   xFiltro:='';
   cdsAcceso.First;
   while not cdsAcceso.Eof do begin
      If Length(xFiltro)=0 then
         xFiltro:= xxCampo+' IN ('+''''+cdsAcceso.FieldByName('CODIGO').AsString+''', '
      else
         xFiltro:=xFiltro+''''+cdsAcceso.FieldByName('CODIGO').AsString+''', ';
      cdsAcceso.Next;
   end;

   if Length(xFiltro)>0 then
   begin
      xFiltro:=Copy( xFiltro, 1, length(xFiltro)-2 ) + ' ) ';
   end;

   xxCds.Filtered:=False;
   xxCds.Filter  :='';
   xxCds.Filter  :=xFiltro;
   xxCds.Filtered:=True;

   Result:=xFiltro;
end;


function TDMCNT.FiltraCiaPorUsuario( cdsCiaUser :TwwClientDataSet ) : String;
var
   cFilter : String;
begin
   cFilter:='';
   cdsCiaUser.First;
   while not cdsCiaUser.Eof do
   begin
      if cFilter='' then
         cFilter:=' CIAID IN ( '''+cdsCiaUser.FieldByName('CIAID').AsString+''''
      else
         cFilter:=cFilter+', '''+cdsCiaUser.FieldByName('CIAID').AsString+'''';

      cdsCiaUser.Next;
   end;

   if cFilter<>'' then
      cFilter:=cFilter+' ) ';

   Result:=cFilter;
end;


function TDMCNT.FiltraOrigenPorUsuario( cdsOrigenUser :TwwClientDataSet ) : String;
var
   cFilter : String;
begin
   cFilter:='';
   cdsOrigenUser.First;
   while not cdsOrigenUser.Eof do
   begin
      if cFilter='' then
         cFilter:=' TDIARID IN ( '''+cdsOrigenUser.FieldByName('TDIARID').AsString+''''
      else
         cFilter:=cFilter+', '''+cdsOrigenUser.FieldByName('TDIARID').AsString+'''';

      cdsOrigenUser.Next;
   end;

   if cFilter<>'' then
      cFilter:=cFilter+' ) ';

   Result:=cFilter;
end;


function TDMCNT.FiltraOrigenPorUsuario_Cia( xxArchivo, xxCampo : String ) : String;
var
   xCiaFil : String;
   xFiltro : String;
begin
   xCiaFil:=cFilterCiaUser;

   cdsAcceso.Filtered := False;
   cdsAcceso.Filter   := '';
   cdsAcceso.Filter   := 'NTABLA='+''''+xxArchivo+'''';
   cdsAcceso.Filtered := True;

   xFiltro := '';
   cdsAcceso.First;
   while not cdsAcceso.Eof do begin
      if cdsAcceso.FieldByName('CIAID').AsString<>'' then
      begin
         If Length(xFiltro)=0 then
            xFiltro:='(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +   xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')'
         else
            xFiltro:=xFiltro+' OR '
                    +'(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')';
         if xCiaFil<>'' then
         begin
            xCiaFil:=StringReplace(xCiaFil,''''+cdsAcceso.FieldByName('CIAID').AsString+''',','',[rfReplaceAll]);
            xCiaFil:=StringReplace(xCiaFil,''''+cdsAcceso.FieldByName('CIAID').AsString+'''' ,'',[rfReplaceAll]);
         end;
                    
      end;
      cdsAcceso.Next;
   end;

   if xCiaFil=' CIAID IN (  ) ' then
      xCiaFil:=''
   else
      xCiaFil:=' or '+xCiaFil;

   if xFiltro<>'' then
      xFiltro:=' ( '+ xFiltro + xCiaFil +' ) ';

   Result:=xFiltro;
end;


function TDMCNT.FiltraCuentaPorUsuario_Cia( xxArchivo, xxCampo : String ) : String;
var
   xFiltro : String;
   xCiaFil : String;
begin
   xCiaFil:=cFilterCiaUser;

   cdsAcceso.Filtered := False;
   cdsAcceso.Filter   := '';
   cdsAcceso.Filter   := 'NTABLA='+''''+xxArchivo+'''';
   cdsAcceso.Filtered := True;

   xFiltro := '';
   cdsAcceso.First;
   while not cdsAcceso.Eof do
   begin
      if cdsAcceso.FieldByName('CIAID').AsString<>'' then
      begin
         if Length(xFiltro)=0 then
            xFiltro:='(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +   xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')'
         else
            xFiltro:=xFiltro+' OR '
                    +'(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')';

         if xCiaFil<>'' then
         begin
            xCiaFil:=StringReplace(xCiaFil,''''+cdsAcceso.FieldByName('CIAID').AsString+''',','',[rfReplaceAll]);
            xCiaFil:=StringReplace(xCiaFil,''''+cdsAcceso.FieldByName('CIAID').AsString+'''' ,'',[rfReplaceAll]);
         end;

      end;

      cdsAcceso.Next;
   end;
   if xCiaFil=' CIAID IN (  ) ' then
      xCiaFil:=''
   else
      xCiaFil:=' or '+xCiaFil;


   if xFiltro<>'' then
      xFiltro:=' ( '+ xFiltro + xCiaFil +' ) ';

   Result:=xFiltro;
end;



function TDMCNT.FiltraUsuarioPorUsuario_Cia( xxArchivo, xxCampo : String ) : String;
var
   xFiltro : String;
begin
   cdsAcceso.Filtered := False;
   cdsAcceso.Filter   := '';
   cdsAcceso.Filter   := 'NTABLA='+''''+xxArchivo+'''';
   cdsAcceso.Filtered := True;

   xFiltro := '';
   cdsAcceso.First;
   while not cdsAcceso.Eof do begin
      if cdsAcceso.FieldByName('CIAID').AsString<>'' then
      begin
         If Length(xFiltro)=0 then
            xFiltro:='(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +   xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')'
         else
            xFiltro:=xFiltro+' OR '
                    +'(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')';
      end;
      cdsAcceso.Next;
   end;

   if xFiltro<>'' then
      xFiltro:=' ( '+ xFiltro+ ' or ('+xxCampo+'='''+wUsuario+''')'+ ' ) '
   else
      xFiltro:=' ( '+'('+xxCampo+'='''+wUsuario+''')'+ ' ) ';

   if (wAdmin='V') or (wAdmin='P') or (wAdmin='G')  or (wAdmin='C') then
      xFiltro:=' ( '+xxCampo+' is not NULL ) ';

   Result:=xFiltro;
end;



function TDMCNT.FiltraCuentaPorUsuario : String;
var
   cFilter : String;
begin
   cdsAcceso.Filtered := False;
   cdsAcceso.Filter   := '';
   cdsAcceso.Filter   := 'NTABLA=''TGE202''';
   cdsAcceso.Filtered := True;

   cFilter:='';
   cdsAcceso.First;
   while not cdsAcceso.Eof do
   begin
      if cFilter='' then
         cFilter:=' CUENTAID IN ( '''+cdsAcceso.FieldByName('CODIGO').AsString+''''
      else
         cFilter:=cFilter+', '''+cdsAcceso.FieldByName('CODIGO').AsString+'''';

      cdsAcceso.Next;
   end;

   if cFilter<>'' then
      cFilter:=cFilter+' ) ';

   Result:=cFilter;
end;



function BuscaReg( PCia,PTDiario,PAnoMes,PNoReg:String ):Boolean;
var
   xSQL: String;
begin
   xSQL:='Select CNTCOMPROB From CNT300 Where ';
   xSQL:= xSQL + 'CIAID='     +''''+ PCia    +''''+' and ';
   xSQL:= xSQL + 'TDIARID='   +''''+ PTDiario+''''+' and ';
   xSQL:= xSQL + 'CNTANOMM='  +''''+ PAnoMes +''''+' and ';
   xSQL:= xSQL + 'CNTCOMPROB='+''''+ PNoReg  +'''';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.ProviderName:='PrvTGE';
   DMCNT.cdsQry.DataRequest( xSQL );
   DMCNT.cdsQry.Open;
   if DMCNT.cdsQry.RecordCount>0 then
      result:=True
   else
      result:=False;
end;

function TDMCNT.DisplayDescrip(wPrv,wTabla,wCampos,wWhere,wResult:string):string;
var
   xSQL : string;
begin
   xSQL := '';
   xSQL := 'select '+wCampos+' from '+wTabla;
   if length(wWhere) > 0 then xSQL := xSQL+' where '+wWhere;
   cdsQry.Close;
//   cdsQry.ProviderName:=wPrv;
   cdsQry.DataRequest( xSQL );
   cdsQry.Open;
   result:=cdsQry.FieldByName(wResult).Asstring;
end;

function TDMCNT.BuscaFecha(wPrv,wTabla,wCampos,wWhere:string;wResult:string):TDate;
var
   xSQL : string;
begin
   xSQL := '';
   xSQL := 'select '+wCampos+' from '+wTabla;
   if length(wWhere)>0 then xSQL:=xSQL+' where '+wWhere;
   cdsQry.Close;
   cdsQry.ProviderName:=wPrv;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   result:=cdsQry.FieldByName(wResult).AsDateTime;
   if result=0 then result:=strtodate('01/01/1900');
   //cdsCierresFecCierre.AsDateTime
end;


function TDMCNT.UltimoNum(wPrv,wTabla,wCampo,wWhere:string):string;
var
   xSQL : string;
begin
   xSQL := '';
   xSQL := 'select max('+wCampo+') as ULT from '+wTabla;
   if length(wWhere)>0 then xSQL:=xSQL+' where '+wWhere;
   cdsQry.Close;
   cdsQry.ProviderName:=wPrv;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   if cdsQry.FieldbyName('ULT').Value=Null then
      result:='1'
   else begin
      result:=inttostr(strtoint(cdsQry.FieldbyName('ULT').Value)+1);
   end;
end;

function TDMCNT.StrZero(wNumero:String;wLargo:Integer):string;
var
   i : integer;
   s : string;
begin
   s := '';
   for i:=1 to wLargo do
   begin
      s := s+'0';
   end;
   s := s+trim(wNumero);
   result:= copy(s,length(s)-(wLargo-1),wLargo);
end;


procedure TDMCNT.cdsMovCNTCNTDHChange(Sender: TField);
begin
   if (wFlagDebe) and (length(DMCNT.cdsMovCNT.FieldByName('CNTDH').AsString)>0) then
   begin
      wFlagDebe:=False;
      DMCNT.cdsMovCNT.Edit;
      DMCNT.cdsMovCNT.FieldByName('CNTDH').AsString:=uppercase(DMCNT.cdsMovCNT.FieldByName('CNTDH').AsString);
      if (DMCNT.cdsMovCNT.FieldByName('CNTDH').AsString<>'D') and (DMCNT.cdsMovCNT.FieldByName('CNTDH').AsString<>'H') and (DMCNT.cdsMovCNT.FieldByName('CNTDH').AsString<>'') then
      begin
         ShowMessage('Digite sólo D(para Debe) o H(para Haber)');
         DMCNT.cdsMovCNT.FieldByName('CNTDH').AsString:='';
         DMCNT.cdsMovCNT.FieldByName('CNTDH').FocusControl;
         wFlagDebe:=True;
      end;
   end;
end;

procedure TDMCNT.cdsMovCNTAfterOpen(DataSet: TDataSet);
begin
   wFlagDebe := True;
end;

procedure TDMCNT.cdsTMonAfterOpen(DataSet: TDataSet);
var
   xWhere : string;
begin
   // determina Tipo de Moneda Extranjera Oficial (normalmente dólares)
   xWhere   := 'TMON_LOC='+''''+'E'+'''';
   wTMonExt:=DisplayDescrip('PrvTGE','TGE103','*',xWhere,'TMONID');
// Inicio HPC_201601_CNT
// Se define la variables para descripción y abreviatura de la Moneda Local y Moneda Extranjera
   wTMonExtDes := cdsQry.FieldByName('TMONDES').AsString;
   wTMonExtAbr := cdsQry.FieldByName('TMONABR').AsString;
// Fin HPC_201601_CNT
   xWhere   := 'TMON_LOC='+''''+'L'+'''';
   wTMonLoc:=DisplayDescrip('PrvTGE','TGE103','*',xWhere,'TMONID');
// Inicio HPC_201601_CNT
// Se define la variables para descripción y abreviatura de la Moneda Local y Moneda Extranjera
   wTMonLocDes := cdsQry.FieldByName('TMONDES').AsString;
   wTMonLocAbr := cdsQry.FieldByName('TMONABR').AsString;
// Fin HPC_201601_CNT

end;

procedure TDMCNT.cdsCiaAfterOpen(DataSet: TDataSet);
begin
//   dbigetnetusername(DMCNT.wUserName);
//   DMCNT.wUsuario := uppercase(DMCNT.wUserName);
//   wAdmin:='G';
end;

procedure TDMCNT.cdsMovCNTBeforeOpen(DataSet: TDataSet);
begin
//     cdsMovCnt.Filter:='Ciaid='+''''+''+'''';
//     cdsMovCnt.Filtered:=True;
end;

function TDMCNT.DisplayInteger(wPrv,wTabla,wCampos,wWhere,wResult:string):Integer;
var
   xSQL : string;
begin
   xSQL := '';
   xSQL := 'select '+wCampos+' from '+wTabla;
   if length(wWhere)>0 then xSQL:=xSQL+' where '+wWhere;
   cdsQry.Close;
   cdsQry.ProviderName:=wPrv;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   result:=cdsQry.FieldByName(wResult).AsInteger;
end;

function TDMCNT.DisplayReal(wPrv,wTabla,wCampos,wWhere,wResult:string):DOUBLE;
var
   xSQL : string;
begin
   xSQL := '';
   xSQL := 'select '+wCampos+' from '+wTabla;
   if length(wWhere)>0 then xSQL:=xSQL+' where '+wWhere;
   cdsQry.Close;
   cdsQry.ProviderName:=wPrv;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   result:=cdsQry.FieldByName(wResult).AsFloat;
end;


function TDMCNT.NombreMes(wNumero:String):string;
var
   wMes  : Array [1..12] of String;
   wnum, code : integer;
begin
   wMes[1]  := 'ENERO';
   wMes[2]  := 'FEBRERO';
   wMes[3]  := 'MARZO';
   wMes[4]  := 'ABRIL';
   wMes[5]  := 'MAYO';
   wMes[6]  := 'JUNIO';
   wMes[7]  := 'JULIO';
   wMes[8]  := 'AGOSTO';
   wMes[9]  := 'SETIEMBRE';
   wMes[10] := 'OCTUBRE';
   wMes[11] := 'NOVIEMBRE';
   wMes[12] := 'DICIEMBRE';

   Val( wNumero, wNum, code );

   Result := wMes[ wNum ];
end;
// Inicio HPC_201703_CNT
// Seguros-Automatización de Devengue de Seguros
function TDMCNT.NombreLetra(wNumero:String):string;
var
   wLetra  : Array [1..26] of String;
   wnum, code : integer;
begin
   wLetra[1]  := 'A';
   wLetra[2]  := 'B';
   wLetra[3]  := 'C';
   wLetra[4]  := 'D';
   wLetra[5]  := 'E';
   wLetra[6]  := 'F';
   wLetra[7]  := 'G';
   wLetra[8]  := 'H';
   wLetra[9]  := 'I';
   wLetra[10] := 'J';
   wLetra[11] := 'K';
   wLetra[12] := 'L';
   wLetra[13] := 'M';
   wLetra[14] := 'N';
   wLetra[15] := 'O';
   wLetra[16] := 'P';
   wLetra[17] := 'Q';
   wLetra[18] := 'R';
   wLetra[19] := 'S';
   wLetra[20] := 'T';
   wLetra[21] := 'U';
   wLetra[22] := 'V';
   wLetra[23] := 'W';
   wLetra[24] := 'X';
   wLetra[25] := 'Y';
   wLetra[26] := 'Z';
   Val( wNumero, wNum, code );

   Result := wLetra[ wNum ];
end;
// Fin HPC_201703_CNT
function TDMCNT.FRound(xReal:DOUBLE;xEnteros,xDecimal:Integer):DOUBLE;
Var
   xNum   : String;
   code   : Integer;
   xNReal : DOUBLE;
begin
   xNum := Floattostrf( xReal, ffFixed, xEnteros, xDecimal );
   Val( xNum, xNReal, code );
   Result := xNReal;
end;

procedure TDMCNT.ActualizaData(wCDS: TwwClientDataSet);
var
  ErrorPacket : OleVariant;
  Errors: Integer;
begin
  ErrorPacket := DCOM1.AppServer.AS_ApplyUpdates(wCDS.ProviderName,
                                               wCDS.Delta,
                                               -1,
                                               Errors,
                                               Null);
  if Errors > 0 then
     wCDS.Reconcile(ErrorPacket);
//  wCDS.Reconcile(ErrorPacket);
  wCDS.mergechangelog();

end;


procedure TDMCNT.cdsMovCNT2CalcFields(DataSet: TDataSet);
begin
   cdsMovCNT2.FieldByName('CAMPOVAR').AsString:=Copy(cdsMovCNT2.FieldByName('CUENTAID').AsString,1,xNivelCta);
end;

procedure TDMCNT.Filtracds( xxCds:TwwClientDataSet; xxSQL:String  );
begin
   if Length( xxSQL )>0 then begin
      xxCds.Close;
      xxCds.DataRequest( xxSQL );
   end;
   xxCds.Open;
end;

function TDMCNT.strMes (Fecha : TDateTime) : String ;
var
   Year, Month, Day: Word ;
begin
     if Fecha = 0 then
         Result := ''
     else
     begin
         DecodeDate(Fecha, Year, Month, Day);
         Result := DMCNT.strzero(inttostr(Month),2) ;
     end ;
end;

function TDMCNT.strAno (Fecha : TDateTime) : String ;
var
   Year, Month, Day: Word ;
begin
     if Fecha = 0 then
         Result := ''
     else
     begin
         DecodeDate(Fecha, Year, Month, Day);
         Result := DMCNT.strzero(inttostr(Year),4) ;
     end ;
end;

function TDMCNT.DesEncripta(wPalabra:String): String;
var
   xLargoPal,i,j : integer;
   xReal,xEncriptado1,xEncriptado2,xEncriptado3,xEncriptado4,
   xEncriptado5,xNuevaPal,xEncriptado : string;
   xTiene : boolean;
begin
   xReal       := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1:= '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2:= '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3:= '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4:= 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5:= ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal   := length(wPalabra);
   xNuevaPal   := '';
   i := 1;
   while i<=xLargoPal do begin
      j := 1;
      xTiene := False;
      if (i=1) or (i=11)or (i=21) or (i=31) then xEncriptado:=xEncriptado1;
      if (i=2) or (i=12)or (i=22) or (i=32) then xEncriptado:=xEncriptado2;
      if (i=3) or (i=13)or (i=23) or (i=33) then xEncriptado:=xEncriptado3;
      if (i=4) or (i=14)or (i=24) or (i=34) then xEncriptado:=xEncriptado4;
      if (i=5) or (i=15)or (i=25) or (i=35) then xEncriptado:=xEncriptado5;
      if (i=6) or (i=16)or (i=26) or (i=36) then xEncriptado:=xEncriptado1;
      if (i=7) or (i=17)or (i=27) or (i=37) then xEncriptado:=xEncriptado2;
      if (i=8) or (i=18)or (i=28) or (i=38) then xEncriptado:=xEncriptado3;
      if (i=9) or (i=19)or (i=29) or (i=39) then xEncriptado:=xEncriptado4;
      if (i=10)or (i=20)or (i=30) or (i=40) then xEncriptado:=xEncriptado5;
      while j<=length(xReal) do begin
         if copy(wPalabra,i,1)=copy(xEncriptado,j,1) then begin
            xNuevaPal := xNuevaPal+copy(xReal,j,1);
            xTiene := True;
         end;
         j := j+1;
      end;
      if not xTiene then xNuevaPal:=xNuevaPal+copy(wPalabra,i,1);
      i := i+1;
   end;
   result:=xNuevaPal;
end;

function TDMCNT.Encripta(wPalabra:String): String;
var
   xLargoPal,i,j : integer;
   xReal,xEncriptado1,xEncriptado2,xEncriptado3,xEncriptado4,
   xEncriptado5,xNuevaPal,xEncriptado : string;
   xTiene : boolean;
begin
   xReal       := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1:= '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2:= '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3:= '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4:= 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5:= ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal   := length(wPalabra);
   xNuevaPal   := '';
   i := 1;
   while i<=xLargoPal do begin
      j := 1;
      xTiene := False;
      if (i=1) or (i=11)or (i=21) or (i=31) then xEncriptado:=xEncriptado1;
      if (i=2) or (i=12)or (i=22) or (i=32) then xEncriptado:=xEncriptado2;
      if (i=3) or (i=13)or (i=23) or (i=33) then xEncriptado:=xEncriptado3;
      if (i=4) or (i=14)or (i=24) or (i=34) then xEncriptado:=xEncriptado4;
      if (i=5) or (i=15)or (i=25) or (i=35) then xEncriptado:=xEncriptado5;
      if (i=6) or (i=16)or (i=26) or (i=36) then xEncriptado:=xEncriptado1;
      if (i=7) or (i=17)or (i=27) or (i=37) then xEncriptado:=xEncriptado2;
      if (i=8) or (i=18)or (i=28) or (i=38) then xEncriptado:=xEncriptado3;
      if (i=9) or (i=19)or (i=29) or (i=39) then xEncriptado:=xEncriptado4;
      if (i=10)or (i=20)or (i=30) or (i=40) then xEncriptado:=xEncriptado5;
      while j<=length(xReal) do begin
         if copy(wPalabra,i,1)=copy(xReal,j,1) then begin
            xNuevaPal := xNuevaPal+copy(xEncriptado,j,1);
            xTiene := True;
         end;
         j := j+1;
      end;
      if not xTiene then xNuevaPal:=xNuevaPal+copy(wPalabra,i,1);
      i := i+1;
   end;
   result:=xNuevaPal;
end;

procedure TDMCNT.DataModuleCreate(Sender: TObject);
var
   wSQL, xSQL2 : string;
begin
   Screen.Cursor:=crHourGlass;
   DCOM1.Connected:=False;

   if ParamStr(1)='' then
   begin
      inifile:=TIniFile.Create( ExtractFilePath( application.ExeName )+'\oaCfg.ini');
      DCOM1.Address:=IniFile.ReadString('TCPIP','ADDRESS','');
      wSRV:=IniFile.ReadString('MOTOR','NAME','');
   end;

   TRY
      DCOM1.Connected:=true;
   EXCEPT
      // por no realizar la conexion
      SHOWMESSAGE( 'ERROR de Conexión.');
      Screen.Cursor:=CrDefault;
      Exit;
   END;

   Try
      cIP:= DMCNT.ObtenerIpdeNetbios(DMCNT.computerName);
   Except
      ShowMessage( 'ERROR de Conexión.');
      DCOM1.Connected:=False;
      Screen.Cursor:=CrDefault;
      Exit;
   End;

   FCtrlAcceso := TFCtrlAcceso.Create(Application);
   wModulo := 'CNT';
   FCtrlAcceso.wDCOM1:=DCOM1;
   Screen.Cursor:=crHourGlass;

   FCtrlAcceso.ShowModal;

   if FCtrlAcceso.cAccesoSistema='S' then
   begin
      wUsuario := FCtrlAcceso.dbeUsuario.Text;
      FCtrlAcceso.free;
   end
   else
   begin
      DCOM1.Connected:=False;
      FCtrlAcceso.free;
      sClose:='1';
      Screen.Cursor:=CrDefault;
      Exit;
   end;

   if not AccesosModulo then
   begin
      DCOM1.Connected:=False;
      Screen.Cursor:=CrDefault;
   end
   else
   begin

      if (wSRV = 'ORACLE') then
      begin
         xSQL2:='Select A.USERID, A.GRUPOID, B.MODULOID, B.TIPO, C.GRUPOADM '
               +'From TGE007 A, TGE001 B, TGE003 C '
               +'WHERE A.USERID='''+wUsuario+''' '
               +'AND A.GRUPOID=B.GRUPOID(+) and B.MODULOID='''+wModulo+''''
               +'AND A.GRUPOID=C.GRUPOID(+)';
      end;
      if (wSRV = 'DB2NT') or (wSRV = 'DB2400') then
      begin
         xSQL2:='Select A.USERID, A.GRUPOID, B.MODULOID, B.TIPO, C.GRUPOADM '
               +'From TGE007 A '
               +'Left Outer Join TGE001 B ON (A.GRUPOID=B.GRUPOID) '
               +'Left Outer Join TGE003 C ON (A.GRUPOID=C.GRUPOID) '
               +'WHERE A.USERID='''+wUsuario+''' '
               +'and B.MODULOID='''+wModulo+'''';
      end;

      cdsUsuarios.Close;
      cdsUsuarios.DataRequest( xSQL2 );
      cdsUsuarios.Open;
      cdsMGrupo.Open;
      cdsGrupos.Open;
//      cdsReglas.Open;
// Inicio HPC_201503_CNT
//      cdsAcceso.Open;
// Fin HPC_201503_CNT

      wAdmin := cdsUsuarios.fieldbyname('GrupoAdm').AsString;


  wTipoCambioUsar      := 'TCAMVPV' ;
  DecodeDate( date , wanohoy , wmeshoy , wdiahoy ) ;
  //** 23/04/2001 - pjsv
  wTCCompra := 'TCAMVBC' ;
  wTCVenta  := 'TCAMVBV' ;
   //**
  DisplayDescrip('prvSQL','SOLCONFIG','*','','SRV_DB');
  SRV_E     :=cdsqry.fieldbyname('SRV_EQUIP').AsString;
  SRV_D     := wSRV; //cdsqry.fieldbyname('SRV_DB').AsString;
  SRV_V     :=cdsqry.fieldbyname('SRV_VERS').AsString;
  wRptCia   :=cdsqry.fieldbyname('RPTCIA').AsString;

	wRutaRpt := 'RTMs\'+wModulo+'\'+wRptCia;

  wDBFunc01 := 'RRN(CAJA304)';
  wDBFunc02 := 'RRN(CNT301)';
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    wSQL:='SELECT CNT301.* ,TGE202.CTADES, CNT201.AUXNOMB,'+
          ' CNT301.CLAUXID||CNT301.AUXID AUXILIAR  ,'+
          ' CASE WHEN CNTDH = ''D'' THEN CNTMTOLOC ELSE 0.00 END MONTODEBE ,'+
          ' CASE WHEN CNTDH = ''H'' THEN CNTMTOLOC ELSE 0.00 END MONTOHABER'+
          ' FROM CNT301'+
          ' LEFT JOIN TGE202'+
          ' ON (CNT301.CUENTAID = TGE202.CUENTAID)'+
          ' LEFT JOIN CNT201'+
          ' ON (CNT301.CLAUXID = CNT201.CLAUXID AND'+
          ' CNT301.AUXID = CNT201.AUXID )'+
          ' ORDER BY CUENTAID,CLAUXID,AUXID';
    cdsRepAux.DataRequest(wSQL);

    wSQL:='SELECT CNT301.* ,TGE202.CTADES, CNT201.AUXNOMB,'+
       ' CNT301.CLAUXID||CNT301.AUXID AUXILIAR  ,'+
       ' CASE WHEN CNTDH = ''D'' THEN CNTMTOLOC ELSE 0.00 END DEBELOC ,'+
       ' CASE WHEN CNTDH = ''H'' THEN CNTMTOLOC ELSE 0.00 END HABERLOC ,'+
       ' CASE WHEN CNTDH = ''D'' THEN CNTMTOEXT ELSE 0.00 END DEBEEXT ,'+
       ' CASE WHEN CNTDH = ''H'' THEN CNTMTOEXT ELSE 0.00 END HABEREXT'+
       ' FROM CNT301'+
       ' LEFT JOIN TGE202'+
       ' ON (CNT301.CUENTAID = TGE202.CUENTAID)'+
       ' LEFT JOIN CNT201'+
       ' ON (CNT301.CLAUXID = CNT201.CLAUXID AND'+
       ' CNT301.AUXID = CNT201.AUXID )';
    cdsRepAux2.DataRequest(wSQL);

    wFormatFecha:='YYYY-MM-DD';
    wReplacCeros:='COALESCE';
    wRepFecServi:='CURRENT DATE';
    wRepHorServi:='CURRENT TIME';
    wRepFuncDate:= 'DATE(';
  end
  else
  if SRV_D = 'ORACLE' then
  begin
    wFormatFecha:='DD-MM-YYYY';
    wReplacCeros:='NVL';
    wRepFecServi:='SYSDATE';
    wRepHorServi:='SYSDATE';
    wRepFuncDate:= 'TO_DATE(';
    wDBFunc01 := 'Int(Rand()*1000000)';
    wDBFunc02 := 'Int(Rand()*1000000)';
  end;

  //
   xSQL2 := 'SELECT * FROM TGE004 '
          + 'WHERE MODULOID='+''''+wModulo    +''''
          + ' AND  USERID='  +''''+wUsuario+'''';
   cdsAcceso.Close;
   cdsAcceso.DataRequest( xSQL2 );
   cdsAcceso.Open;

   FiltraTabla( cdsCia,     'TGE101', 'CIAID'   );
   //FiltraTabla( cdsTDiario, 'TGE104', 'TDIARID' );
   cdsTDiario.Open;
   cdsTDiario.IndexFieldNames:='tdiarid';

   // vhndema
   cFilterCiaUser    :=FiltraCiaPorUsuario( cdsCia );
   //cFilterOrigenUser:=FiltraOrigenPorUsuario( cdsTDiario );
   cFilterOrigenUser :=FiltraOrigenPorUsuario_cia( 'TGE104', 'TDIARID' );
   //cFilterCuentaUser :=FiltraCuentaPorUsuario;
   cFilterCuentaUser :=FiltraCuentaPorUsuario_Cia( 'TGE202', 'CUENTAID' );
   cFilterUsuarioUser:=FiltraUsuarioPorUsuario_cia( 'TGE006', 'CNTUSER' );
   // end vhndema

   FiltraTabla( cdsClAux,   'TGE102', 'CLAUXID' );
   FiltraTabla( cdsTDoc,    'TGE110', 'DOCID'   );
   FiltraTabla( cdsTMon,    'TGE103', 'TMONID'  );
   FiltraTabla( cdsCCosto,  'TGE203', 'CCOSID'  );

// Inicio HPC_201503_CNT
   xSQL2 := 'Select CLAUXID, AUXID, AUXNOMB, ACTIVO, AUXRUC ' // AUXRUC, PROVRETIGV,
          + '  from CNT201 '
          + ' where ACTIVO=''S'' '
          + ' order by AUXID ';
//   cdsAuxiliar.PacketRecords:=50;
   cdsAuxiliar.Close;
//   cdsAuxiliar.DataRequest(xSQL2);
//   cdsAuxiliar.Open;
// Fin HPC_201503_CNT
   Filtracds( cdsNivel,   '' );

   cdsDoc2.Open;
   cdsTipCta.Open;

   cdsCia.IndexFieldNames:='CIAID';
   cdsCCosto.indexFieldNames:='CCOSID';
 end;
 Screen.Cursor:=CrDefault;
end;


function TDMCNT.AccesosModulo :  Boolean;
var
   xSQL : String;
   xfecfin :TDate;
   xdiasexppass:Integer;
   xdiasfaltantes:Integer;
   xdiasduracpass:Integer;
   xpassact, xctrl_ip, xingresa :String;
begin
// busca en tabla DE USUARIO (TGE006) para determinar que es un usuario de base de datos
   xSQL := 'select FECEXP, OFDESID, nvl(CTRL_IP,''S'') CTRL_IP, '
          +'       TO_DATE(nvl(FECINI_PWD,sysdate-30)) FECINI_PWD, '
          +'       TO_DATE(nvl(FECFIN_PWD, sysdate-1)) FECFIN_PWD, '
          +'       nvl(DIASEXP_PWD,7) DIASEXP_PWD,'
          +'       nvl(DIASDURAC_PWD,30) DIASDURAC_PWD '
          +'from TGE006 '
          +'where USERID = '+QuotedStr(wUsuario);
   cdsQry.Close;
   cdsQry.DataRequest(xSql);
   cdsQry.Open;
   If cdsQry.RecordCount=0 then
   Begin
      Showmessage('Usuario no reconocido para el uso de Aplicaciones');
      Result:=False;
      Exit;
   End;

// valida que contraseña en control de aplicaciones (TGE006), no haya expirado
   If (cdsQry.FieldByName('FECEXP').AsDateTime>0) and
      (cdsQry.FieldByName('FECEXP').AsDateTime<Date) Then
   Begin
      Showmessage('Usuario ha caducado para el uso de Aplicaciones');
      Result:=False;
      Exit;
   End;
   xfecfin         := cdsQry.FieldByName('FECFIN_PWD').AsDateTime;
   xdiasexppass    := cdsQry.FieldByName('DIASEXP_PWD').AsInteger;
   xdiasduracpass  := cdsQry.FieldByName('DIASDURAC_PWD').AsInteger;
   //xpassact        := FCtrlAcceso.dbePassword.Text;

   wOfiId  := cdsQry.FieldByName('OFDESID').AsString;
   xctrl_ip:= cdsQry.FieldByName('CTRL_IP').AsString;
   widepc  := computerName;

// determina que el usuario tenga acceso al módulo
// busca en tabla TGE006 para determinar que es un usuario de base de datos y de la aplicación
   xSQL := 'Select USUARIOS.USERID, USUARIOS.USERNOM, USUARIOGRUPO.GRUPOID, '
          +'       GRUPOS.GRUPODES, GRUPOS.GRUPOADM, ACCESOGRUPO.MODULOID, '
          +'       ACCESOGRUPO.TIPO, ACCESOGRUPO.OBJETO, ACCESOGRUPO.FORMA '
          +'From TGE006 USUARIOS, TGE007 USUARIOGRUPO, TGE003 GRUPOS, TGE001 ACCESOGRUPO '
          +'where USUARIOS.USERID='+quotedstr(wUsuario) // -- TGE006 USUARIOS
          +'  and USUARIOGRUPO.USERID=USUARIOS.USERID' // -- TGE007 USUARIOGRUPO
          +'  and GRUPOS.GRUPOID=USUARIOGRUPO.GRUPOID' // -- TGE003 GRUPOS
          +'  and ACCESOGRUPO.GRUPOID=USUARIOGRUPO.GRUPOID '
          +'  and ACCESOGRUPO.MODULOID='+quotedstr(wModulo)
          +'  and ACCESOGRUPO.TIPO=''0'' '; // TGE001 ACCESOGRUPO
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If cdsQry.RecordCount=0 then
   Begin
      ShowMessage('No tiene Acceso al módulo');
      Result:=False;
      Exit;
   End;

// Identifica si el usuario puede ejecutar los sistemas de cualquier maquina
// o solo de las máquina que se le han asignado
   xingresa := 'N';
   If xctrl_ip = 'S' Then
   Begin
     xSQL := 'SELECT IP_ASIGNADO FROM TGE010 WHERE USERID = '+QuotedStr(wUsuario);
     cdsQry.Close;
     cdsQry.DataRequest(xSQL);
     cdsQry.Open;
     While Not cdsQry.Eof Do
     Begin
        If cdsQry.FieldByName('IP_ASIGNADO').AsString = cIP then xingresa := 'S';
        cdsQry.Next;
     End;
   End;
   If (xingresa = 'N') And (xctrl_ip = 'S') Then
   Begin
      Showmessage('Usuario no autorizado para ingresar de este equipo');
      Result:=False;
      Exit;
   End;

// DETERMINA NRO DE IDENTIFICADOR PARA GRABAR EN ARCHIVO LOG DE ACCESOS
// SE DETERMINA EN BASE A LA FECHA+HORA DE INGRESO A LA BASE DE DATOS
   xSQL := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') IDE, SYSDATE FECHORCON FROM DUAL';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   ideconex  := cdsQry.FieldByName('IDE').AsString;
   fechorcon := cdsQry.FieldByName('FECHORCON').AsString;

// ENVIA PARAMETROS DE LA PC DEL USUARIO HACIA LA APLICACION SERVIDOR
   DCOM1.AppServer.ConexionON( wUsuario, cIP, wModulo, ideconex, fechorcon, widepc);

// controla caducidad de contraseña
   xSQL := 'SELECT TO_DATE('+QuotedStr(DateToStr(xfecfin))+') - TO_DATE(SYSDATE) DIASFALTANTE FROM DUAL';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;

   xdiasfaltantes := cdsQry.FieldByName('DIASFALTANTE').AsInteger; // dias que faltan
   If xdiasfaltantes <= xdiasexppass Then
   Begin
      If xdiasfaltantes <= 0 then
         MessageDlg('SU CONTRASEÑA HA CADUCADO, DEBE CAMBIARLA AHORA', mtCustom, [mbOk], 0)
      else
         if xdiasfaltantes=1 then
            MessageDlg('!!! FALTA 1 DíA PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡'+chr(13)
                      +'            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0)
         else
            MessageDlg('!!! FALTAN '+IntToStr(xdiasfaltantes)+' DÍAS PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡'+chr(13)
                      +'            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0);
     { FCambioContrasena:= TFCambioContrasena.create(self);
      Try
         FCambioContrasena.ShowModal;
      Finally
         FCambioContrasena.Free;
      End;}
   End;
   If xdiasfaltantes <= 0 Then
   Begin
      Result:=False;
      Exit;
   End;

   Result:=True;

end;


function TDMCNT.OperClientDataSet( ClientDataSet : TwwClientDataSet;
                            Expression, Condicion : String  ) : Double;
var
  cdsClone    : TwwClientDataSet;
  bmk         : TBookmark;
  Agg         : TAggregate;
begin
  result := 0;
  if trim(Expression)= '' then Exit;
  bmk:=ClientDataSet.GetBookmark;
  cdsClone    := TwwClientDataSet.Create(nil);
  try
    with cdsClone do
    begin
      CloneCursor(ClientDataSet,True);
      Agg := Aggregates.Add;
      Agg.AggregateName := 'OPER';
      Agg.Expression := Expression;
      Agg.Active := True;
      if Trim(Condicion)<>'' then
      begin
        Filtered     := False;
        Filter       := Condicion;
        Filtered     := True;
      end;
      if Aggregates.Items[Aggregates.IndexOf('OPER')].Value<>NULL then
         result := Aggregates.Items[Aggregates.IndexOf('OPER')].Value;
      Aggregates.Clear;
    end;
    ClientDataSet.GotoBookmark(bmk);
    ClientDataSet.FreeBookmark(bmk);
  finally
    cdsClone.Free;
  end;
end;

Procedure TDMCNT.AccesosUsuarios(xxModulo,xxUsuario,xxTipo,xxForma:String);
begin
   if Trim(cdsUsuarios.FieldByname('GRUPOID').AsString)='' then begin
      cdsUsuarios.SetKey;
      cdsUsuarios.FieldByname('UserId').AsString := xxUsuario;
      If not cdsUsuarios.GotoKey then Exit;
   end;

   cdsGrupos.Filter := '';
   If xxTipo='1' then begin
      cdsGrupos.Filter:='GrupoID='+''''+cdsUsuarios.FieldByname('GRUPOID').AsString+''''+' and '
                       +'ModuloID='+''''+xxModulo+''''+' and '
                       +'Tipo='+''''+xxTipo+'''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      While not cdsGrupos.Eof do begin
         wComponente := BuscaObjeto( cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      end;
   end;

   If xxTipo='2' then begin
      cdsGrupos.Filter:='GrupoID=' +''''+cdsUsuarios.FieldByname('GrupoId').AsString+''''+' and '
                       +'ModuloID='+''''+xxModulo+''''+' and '
                       +'Forma='   +''''+xxForma +''''+' and '
                       +'Tipo='    +''''+xxTipo  +'''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      While not cdsGrupos.Eof do begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm );
         If (wComponente.Name='Z2bbtnModifica') or
            (wComponente.Name='Z2bbtnConsulta') then
            wComponente.Enabled := False
         else begin
            wComponente.Visible := False;
         end;
         cdsGrupos.Next;
      end;
   end;

end;

procedure TDMCNT.AccesosUsuariosR(xxModulo,xxUsuario,xxTipo:String; xxForma:TForm);
begin
   if Trim(cdsUsuarios.FieldByname('GRUPOID').AsString)='' then begin
      cdsUsuarios.SetKey;
      cdsUsuarios.FieldByname('USERID').AsString := xxUsuario;
      If not cdsUsuarios.GotoKey then Exit;
   end;

   cdsGrupos.Filter := '';
   If xxTipo='1' then begin
      cdsGrupos.Filter:='GrupoID='+''''+cdsUsuarios.FieldByname('GRUPOID').AsString+''''+' and '
                       +'ModuloID='+''''+xxModulo+''''+' and '
                       +'Tipo='+''''+xxTipo+'''';
      cdsGrupos.Filtered := True;

      if (DMCNT.wAdmin='G') or (DMCNT.wAdmin='P') then Exit;

      cdsGrupos.First;
      While not cdsGrupos.Eof do begin
         wComponente := BuscaObjeto( cdsGrupos.FieldByName('OBJETO').AsString, xxForma );
         wComponente.Enabled := False;
         cdsGrupos.Next;
      end;
   end;

   If xxTipo='2' then begin
      cdsGrupos.Filter:='GrupoID=' +''''+cdsUsuarios.FieldByname('GRUPOID').AsString+''''+' and '
                       +'ModuloID='+''''+xxModulo                +''''+' and '
                       +'Forma='   +''''+xxForma.Name            +''''+' and '
                       +'Tipo='    +''''+xxTipo                  +'''';
      cdsGrupos.Filtered := True;

      if (DMCNT.wAdmin='G') or (DMCNT.wAdmin='P') then Exit;

      cdsGrupos.First;
      While not cdsGrupos.Eof do begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, xxForma );
         If (wComponente.Name='Z2bbtnModifica') or
            (wComponente.Name='Z2bbtnConsulta') then
            wComponente.Enabled := False
         else begin
            wComponente.Visible := False;
         end;
         cdsGrupos.Next;
      end;
   end;

end;


function TDMCNT.BuscaObjeto( Const xNombre:String; xForm:TForm):TControl;
var
   ic : Integer;
begin
   ic := xForm.ComponentCount-1;
   while (xForm.Components[ic].Name<>xNombre) and (ic>-1) do
   begin
      Dec(ic);
   end;
   If xForm.Components[ic].Name=xNombre then Result := TControl( xForm.Components[ic]);
end;

function TDMCNT.RecuperarDatos (xTabla,xCampos,xWhere : String): Boolean ;
var
   xSQL : String ;
begin
   xSQL := 'SELECT ' + xCampos + ' FROM ' + xTabla              ;
   if length(xWhere)>0 then xSQL := xSQL + ' WHERE ' + xWhere   ;
   cdsQry.Close                                                 ;
   cdsQry.ProviderName:= 'PrvTGE'                               ;
   cdsQry.DataRequest( xSQL )                                   ;
   cdsQry.Open                                                  ;
   if DMCNT.cdsqry.RecordCount=0 then
      Result := False
   else
      Result := True                                            ;
end;


//** 18/08/2001 - PJSV , clg
function tDMCNT.contabiliza( xCia, xTDiario, xAnoMM, xNoComp : String ): Boolean;
Var
   sSQL : String;
   sCIA,sCuenta,sDeHa   : string;
   dDebeMN,dHabeMN,dDebeME,dHabeME:double;
   iOrden : integer;
   cdsClone : TwwClientDataSet;
begin
   CreaPanel( Application.MainForm , 'Contabilizando' );
//   CreaPanel( FRegComp, 'Contabilizando' );
   PanelMsg( 'Generando Asientos Automaticos',0 );

   // GENERA ASIENTOS AUTOMATICOS PARA LA CUENTA 1

   cdsMovCNT1.Last;
   iOrden:=cdsMovCNT1.FieldByName('CNTREG').AsInteger+1;

   cdsClone:=TwwClientDataSet.Create(nil);

   cdsClone.RemoteServer:= DCOM1;
   cdsClone.ProviderName:='PrvTGE';
   cdsClone.Close;
   {
   sSQL:='SELECT * FROM CNT301 '
        +'WHERE CIAID='+QuotedStr(cdsCabCnt.FieldByName('CIAID').AsString)
        + ' and TDIARID='+QuotedStr(cdsCabCnt.FieldByName('TDIARID').AsString)
        + ' and CNTCOMPROB='+QuotedStr(cdsCabCnt.FieldByName('CNTCOMPROB').AsString)
        + ' and CNTANOMM='+QuotedStr(cdsCabCnt.FieldByName('CNTANOMM').AsString);
   }

  sSQL:='Select A.CIAID, TDIARID, CNTCOMPROB, MAX(CNTANO) CNTANO, CNTANOMM, A.CUENTAID, '
       +  'CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CCOSID, '
       +  'MAX(CNTGLOSA) CNTGLOSA, CNTDH, MAX(CNTTCAMBIO) CNTTCAMBIO, MAX(CNTLOTE) CNTLOTE, '
       +  'SUM(CNTMTOORI) CNTMTOORI, SUM(CNTMTOLOC) CNTMTOLOC, SUM(CNTMTOEXT) CNTMTOEXT, '
       +  'MAX(CNTFCOMP) CNTFCOMP, MAX(CNTFEMIS) CNTFEMIS, MAX(CNTFVCMTO) CNTFVCMTO, '
       +  'MAX(CNTUSER) CNTUSER, MAX(CNTFREG) CNTFREG, MAX(CNTHREG) CNTHREG, MAX(CNTMM) CNTMM, '
       +  'MAX(CNTDD) CNTDD, MAX(CNTTRI) CNTTRI, MAX(CNTSEM) CNTSEM, MAX(CNTSS) CNTSS, '
       +  'MAX(CNTAATRI) CNTAATRI, MAX(CNTAASEM) CNTAASEM, MAX(CNTAASS) CNTAASS, MAX(TMONID) TMONID, '
       +  'MAX(TDIARDES) TDIARDES, MAX(A.CTADES) CTADES, MAX(AUXDES) AUXDES, MAX(DOCDES) DOCDES, '
       +  'SUM(CNTDEBEMN) CNTDEBEMN, SUM(CNTDEBEME) CNTDEBEME, SUM(CNTHABEMN) CNTHABEMN, SUM(CNTHABEME) CNTHABEME, '
       +  'MAX(CNTTS) CNTTS, MAX(CNTMODDOC) CNTMODDOC, MAX(CCOSDES) CCOSDES, '
       +  'MAX(CTAAUT1) CTAAUT1, MAX(CTAAUT2) CTAAUT2 '
       +'FROM CNT301 A, TGE202 B '
       +'WHERE A.CIAID='+QuotedStr(cdsCabCnt.FieldByName('CIAID').AsString)
       + ' and TDIARID='+QuotedStr(cdsCabCnt.FieldByName('TDIARID').AsString)
       + ' and CNTCOMPROB='+QuotedStr(cdsCabCnt.FieldByName('CNTCOMPROB').AsString)
       + ' and CNTANOMM='+QuotedStr(cdsCabCnt.FieldByName('CNTANOMM').AsString)+' '
       + ' and A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
       +'Group by A.CIAID, TDIARID, CNTANOMM, CNTCOMPROB, A.CUENTAID, CNTDH, CLAUXID, '
       +         'AUXID, CCOSID, DOCID, CNTSERIE, CNTNODOC';

   cdsClone.DataRequest(sSQL);
   cdsClone.Open;

   cdsMovCNT1.DisableControls;
   cdsClone.First;
   while not cdsClone.EOF DO
   begin
     sCia:=cdsClone.FieldByName('CIAID').AsString;
     sCuenta:=cdsClone.FieldByName('CUENTAID').AsString;

        //SI TIENE CUENTA AUTOMATICA 1 Y 2
        if ( not cdsClone.FieldByName('CTAAUT1').IsNull ) AND
           ( not cdsClone.FieldByName('CTAAUT2').IsNull )then
        begin
          //SI LA CUENTA ORIGES ESTA DESTINADA AL DEBE LA CUENTA AUTOMATICA 1 IRA AL HABER
          if cdsClone.FieldByName('CNTDH').AsString='D' then
          begin
            sDeHa:='D';
            dHabeMN:=0;
            dHabeME:=0;
            dDebeMN:=cdsClone.FieldByName('CNTMTOLOC').AsFloat;
            dDebeME:=cdsClone.FieldByName('CNTMTOEXT').AsFloat;
          end
          else
          begin
            sDeHa:='H';
            dDebeMN:=0;
            dDebeME:=0;
            dHabeMN:=cdsClone.FieldByName('CNTMTOLOC').AsFloat;
            dHabeME:=cdsClone.FieldByName('CNTMTOEXT').AsFloat;
          end;

          cdsMovCNT1.Insert;
          cdsMovCNT1.FieldByName('CIAID').AsString      :=cdsClone.FieldByName('CIAID').AsString;
          cdsMovCNT1.FieldByName('TDIARID').AsString    :=cdsClone.FieldByName('TDIARID').AsString;
          cdsMovCNT1.FieldByName('CNTCOMPROB').AsString :=cdsClone.FieldByName('CNTCOMPROB').AsString;
          cdsMovCNT1.FieldByName('CNTANOMM').AsString   :=cdsClone.FieldByName('CNTANOMM').AsString;
          cdsMovCNT1.FieldByName('CUENTAID').AsString   :=cdsClone.FieldByName('CTAAUT1').AsString;
          cdsMovCNT1.FieldByName('CNTLOTE').AsString    :=cdsClone.FieldByName('CNTLOTE').AsString;
          cdsMovCNT1.FieldByName('CLAUXID').AsString    :=cdsClone.FieldByName('CLAUXID').AsString;
          cdsMovCNT1.FieldByName('AUXID').AsString      :=cdsClone.FieldByName('AUXID').AsString;
          cdsMovCNT1.FieldByName('CCOSID').AsString     :=cdsClone.FieldByName('CCOSID').AsString;
          cdsMovCNT1.FieldByName('CNTMODDOC').AsString  :=cdsClone.FieldByName('CNTMODDOC').AsString;
          cdsMovCNT1.FieldByName('DOCID').AsString      :=cdsClone.FieldByName('DOCID').AsString;
          cdsMovCNT1.FieldByName('CNTSERIE').AsString   :=cdsClone.FieldByName('CNTSERIE').AsString;
          cdsMovCNT1.FieldByName('CNTNODOC').AsString   :=cdsClone.FieldByName('CNTNODOC').AsString;
          cdsMovCNT1.FieldByName('CNTGLOSA').AsString   :=cdsClone.FieldByName('CNTGLOSA').AsString;
          cdsMovCNT1.FieldByName('CNTDH').AsString      :=sDeHa;
          cdsMovCNT1.FieldByName('CNTTCAMBIO').AsString :=cdsClone.FieldByName('CNTTCAMBIO').AsString;
          cdsMovCNT1.FieldByName('CNTMTOORI').AsString  :=cdsClone.FieldByName('CNTMTOORI').AsString;
          cdsMovCNT1.FieldByName('CNTMTOLOC').AsString  :=cdsClone.FieldByName('CNTMTOLOC').AsString;
          cdsMovCNT1.FieldByName('CNTMTOEXT').AsString  :=cdsClone.FieldByName('CNTMTOEXT').AsString;
          cdsMovCNT1.FieldByName('CNTFEMIS').AsDateTime :=cdsClone.FieldByName('CNTFEMIS').AsDateTime;
          cdsMovCNT1.FieldByName('CNTFVCMTO').AsDateTime:=cdsClone.FieldByName('CNTFVCMTO').AsDateTime;
          cdsMovCNT1.FieldByName('CNTFCOMP').AsDateTime :=cdsClone.FieldByName('CNTFCOMP').AsDateTime;
          cdsMovCNT1.FieldByName('CNTESTADO').AsString  :='P';
          cdsMovCNT1.FieldByName('CNTCUADRE').AsString  :='S';
          cdsMovCNT1.FieldByName('CNTFAUTOM').AsString  :='S';
          cdsMovCNT1.FieldByName('CNTUSER').AsString    :=cdsClone.FieldByName('CNTUSER').AsString;
          cdsMovCNT1.FieldByName('CNTFREG').AsDateTime  :=cdsClone.FieldByName('CNTFREG').AsDateTime;
          cdsMovCNT1.FieldByName('CNTHREG').AsDateTime  :=cdsClone.FieldByName('CNTHREG').AsDateTime;
          cdsMovCNT1.FieldByName('CNTANO').AsString     :=cdsClone.FieldByName('CNTANO').AsString;
          cdsMovCNT1.FieldByName('CNTMM').AsString      :=cdsClone.FieldByName('CNTMM').AsString;
          cdsMovCNT1.FieldByName('CNTDD').AsString      :=cdsClone.FieldByName('CNTDD').AsString;
          cdsMovCNT1.FieldByName('CNTTRI').AsString     :=cdsClone.FieldByName('CNTTRI').AsString;
          cdsMovCNT1.FieldByName('CNTSEM').AsString     :=cdsClone.FieldByName('CNTSEM').AsString;
          cdsMovCNT1.FieldByName('CNTSS').AsString      :=cdsClone.FieldByName('CNTSS').AsString;
          cdsMovCNT1.FieldByName('CNTAATRI').AsString   :=cdsClone.FieldByName('CNTAATRI').AsString;
          cdsMovCNT1.FieldByName('CNTAASEM').AsString   :=cdsClone.FieldByName('CNTAASEM').AsString;
          cdsMovCNT1.FieldByName('CNTAASS').AsString    :=cdsClone.FieldByName('CNTAASS').AsString;
          cdsMovCNT1.FieldByName('TMONID').AsString     :=cdsClone.FieldByName('TMONID').AsString;
          cdsMovCNT1.FieldByName('TDIARDES').AsString   :=cdsClone.FieldByName('TDIARDES').AsString;
          cdsMovCNT1.FieldByName('AUXDES').AsString     :=cdsClone.FieldByName('AUXDES').AsString;
          cdsMovCNT1.FieldByName('DOCDES').AsString     :=cdsClone.FieldByName('DOCDES').AsString;
          cdsMovCNT1.FieldByName('CCOSDES').AsString    :=cdsClone.FieldByName('CCOSDES').AsString;
          cdsMovCNT1.FieldByName('CNTDEBEMN').AsFloat   :=dDebeMN;
          cdsMovCNT1.FieldByName('CNTDEBEME').AsFloat   :=dDebeME;
          cdsMovCNT1.FieldByName('CNTHABEMN').AsFloat   :=dHabeMN;
          cdsMovCNT1.FieldByName('CNTHABEME').AsFloat   :=dHabeME;
          cdsMovCNT1.FieldByName('CNTREG').AsInteger    :=iOrden;
          iOrden:=iOrden+1;

          //SI LA CUENTA ORIGES ESTA DESTINADA AL HABER LA CUENTA AUTOMATICA 2 IRA AL DEBE
          if cdsClone.FieldByName('CNTDH').AsString='D' then
          begin
            sDeHa:='H';
            dDebeMN:=0;
            dDebeME:=0;
            dHabeMN:=cdsClone.FieldByName('CNTMTOLOC').AsFloat;
            dHabeME:=cdsClone.FieldByName('CNTMTOEXT').AsFloat;
          end
          else
          begin
            sDeHa:='D';
            dDebeMN:=cdsClone.FieldByName('CNTMTOLOC').AsFloat;
            dDebeME:=cdsClone.FieldByName('CNTMTOEXT').AsFloat;
            dHabeMN:=0;
            dHabeME:=0;
          end;

          cdsMovCNT1.Insert;
          cdsMovCNT1.FieldByName('CIAID').AsString      :=cdsClone.FieldByName('CIAID').AsString;
          cdsMovCNT1.FieldByName('TDIARID').AsString    :=cdsClone.FieldByName('TDIARID').AsString;
          cdsMovCNT1.FieldByName('CNTCOMPROB').AsString :=cdsClone.FieldByName('CNTCOMPROB').AsString;
          cdsMovCNT1.FieldByName('CNTANOMM').AsString   :=cdsClone.FieldByName('CNTANOMM').AsString;
          cdsMovCNT1.FieldByName('CUENTAID').AsString   :=cdsClone.FieldByName('CTAAUT2').AsString;
          cdsMovCNT1.FieldByName('CNTLOTE').AsString    :=cdsClone.FieldByName('CNTLOTE').AsString;
          cdsMovCNT1.FieldByName('CLAUXID').AsString    :=cdsClone.FieldByName('CLAUXID').AsString;
          cdsMovCNT1.FieldByName('AUXID').AsString      :=cdsClone.FieldByName('AUXID').AsString;
          cdsMovCNT1.FieldByName('CCOSID').AsString     :=cdsClone.FieldByName('CCOSID').AsString;
          cdsMovCNT1.FieldByName('CNTMODDOC').AsString  :=cdsClone.FieldByName('CNTMODDOC').AsString;
          cdsMovCNT1.FieldByName('DOCID').AsString      :=cdsClone.FieldByName('DOCID').AsString;
          cdsMovCNT1.FieldByName('CNTSERIE').AsString   :=cdsClone.FieldByName('CNTSERIE').AsString;
          cdsMovCNT1.FieldByName('CNTNODOC').AsString   :=cdsClone.FieldByName('CNTNODOC').AsString;
          cdsMovCNT1.FieldByName('CNTGLOSA').AsString   :=cdsClone.FieldByName('CNTGLOSA').AsString;
          cdsMovCNT1.FieldByName('CNTDH').AsString      :=sDeHa;
          cdsMovCNT1.FieldByName('CNTTCAMBIO').AsString :=cdsClone.FieldByName('CNTTCAMBIO').AsString;
          cdsMovCNT1.FieldByName('CNTMTOORI').AsString  :=cdsClone.FieldByName('CNTMTOORI').AsString;
          cdsMovCNT1.FieldByName('CNTMTOLOC').AsString  :=cdsClone.FieldByName('CNTMTOLOC').AsString;
          cdsMovCNT1.FieldByName('CNTMTOEXT').AsString  :=cdsClone.FieldByName('CNTMTOEXT').AsString;
          cdsMovCNT1.FieldByName('CNTFEMIS').AsDateTime :=cdsClone.FieldByName('CNTFEMIS').AsDateTime;
          cdsMovCNT1.FieldByName('CNTFVCMTO').AsDateTime:=cdsClone.FieldByName('CNTFVCMTO').AsDateTime;
          cdsMovCNT1.FieldByName('CNTFCOMP').AsDateTime :=cdsClone.FieldByName('CNTFCOMP').AsDateTime;
          cdsMovCNT1.FieldByName('CNTESTADO').AsString  :='P';
          cdsMovCNT1.FieldByName('CNTCUADRE').AsString  :='S';
          cdsMovCNT1.FieldByName('CNTFAUTOM').AsString  :='S';
          cdsMovCNT1.FieldByName('CNTUSER').AsString    :=cdsClone.FieldByName('CNTUSER').AsString;
          cdsMovCNT1.FieldByName('CNTFREG').AsDateTime  :=cdsClone.FieldByName('CNTFREG').AsDateTime;
          cdsMovCNT1.FieldByName('CNTHREG').AsDateTime  :=cdsClone.FieldByName('CNTHREG').AsDateTime;
          cdsMovCNT1.FieldByName('CNTANO').AsString     :=cdsClone.FieldByName('CNTANO').AsString;
          cdsMovCNT1.FieldByName('CNTMM').AsString      :=cdsClone.FieldByName('CNTMM').AsString;
          cdsMovCNT1.FieldByName('CNTDD').AsString      :=cdsClone.FieldByName('CNTDD').AsString;
          cdsMovCNT1.FieldByName('CNTTRI').AsString     :=cdsClone.FieldByName('CNTTRI').AsString;
          cdsMovCNT1.FieldByName('CNTSEM').AsString     :=cdsClone.FieldByName('CNTSEM').AsString;
          cdsMovCNT1.FieldByName('CNTSS').AsString      :=cdsClone.FieldByName('CNTSS').AsString;
          cdsMovCNT1.FieldByName('CNTAATRI').AsString   :=cdsClone.FieldByName('CNTAATRI').AsString;
          cdsMovCNT1.FieldByName('CNTAASEM').AsString   :=cdsClone.FieldByName('CNTAASEM').AsString;
          cdsMovCNT1.FieldByName('CNTAASS').AsString    :=cdsClone.FieldByName('CNTAASS').AsString;
          cdsMovCNT1.FieldByName('TMONID').AsString     :=cdsClone.FieldByName('TMONID').AsString;
          cdsMovCNT1.FieldByName('TDIARDES').AsString   :=cdsClone.FieldByName('TDIARDES').AsString;
          cdsMovCNT1.FieldByName('AUXDES').AsString     :=cdsClone.FieldByName('AUXDES').AsString;
          cdsMovCNT1.FieldByName('DOCDES').AsString     :=cdsClone.FieldByName('DOCDES').AsString;
          cdsMovCNT1.FieldByName('CCOSDES').AsString    :=cdsClone.FieldByName('CCOSDES').AsString;
          cdsMovCNT1.FieldByName('CNTDEBEMN').AsFloat   :=dDebeMN;
          cdsMovCNT1.FieldByName('CNTDEBEME').AsFloat   :=dDebeME;
          cdsMovCNT1.FieldByName('CNTHABEMN').AsFloat   :=dHabeMN;
          cdsMovCNT1.FieldByName('CNTHABEME').AsFloat   :=dHabeME;
          cdsMovCNT1.FieldByName('CNTREG').AsInteger    :=iOrden;
          iOrden:=iOrden+1;

        end;

//        DMCNT.ControlTran;

//     end;
     cdsClone.Next;
   end;

//   DMCNT.ControlTran;

   Result:=False;
   cdsMovCNT1.EnableControls;


   cdsClone.Free;
   GeneraEnLinea401( xCia, xTDiario, xAnoMM, xNoComp ) ;
   pNLcONTA.Free;

   if Errorcount>0 then Exit;

   Result:=True ;
end;


// Nuevo
procedure TDMCNT.GeneraEnLinea401( xxxCia, xxxDiario, xxxAnoMM, xxxNoComp: String );
var
   xCtaPrin, xClAux, xCuenta, xAuxDes, xAno, xMes, xDH, xSQL : string;
   xMov, xAux, xCCos, xCCoDes, xCtaDes, xFLAux, xFLCCo, xNivel: String;
   xDigitos, xDigAnt : Integer;
   xImpMN, xImpME    : Double;
begin
   xAno := Copy(xxxAnoMM,1,4);
   xMes := Copy(xxxAnoMM,5,2);

   // 5
   PanelMsg( 'Generando Resultados',0 );

{
   xSQL:='Select A.CUENTAID, A.CNTDH, SUM( A.CNTMTOLOC ) CNTMTOLOC, SUM( A.CNTMTOEXT ) CNTMTOEXT, '
        +   'MAX(B.CTANIV), MAX(B.CTAABR), MAX(B.CTA_MOV), MAX(B.CTA_AUX), MAX(B.CTA_CCOS) '
        +'From CNT301 A, TGE202 B '
        +'Where A.CIAID='     +''''+xxxCia   +''''+' AND '
        +      'A.TDIARID='   +''''+xxxDiario+''''+' AND '
        +      'A.CNTANOMM='  +''''+xxxAnoMM +''''+' AND '
        +      'A.CNTCOMPROB='+''''+xxxNoComp+''' '
        +  'and A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
        +'Group by A.CUENTAID, A.CNTDH';
}
   xSQL:='Select A.CUENTAID, A.CNTDH, SUM( A.CNTMTOLOC ) CNTMTOLOC, SUM( A.CNTMTOEXT ) CNTMTOEXT '
        +'From CNT301 A '
        +'Where A.CIAID='     +''''+xxxCia   +''''+' AND '
        +      'A.TDIARID='   +''''+xxxDiario+''''+' AND '
        +      'A.CNTANOMM='  +''''+xxxAnoMM +''''+' AND '
        +      'A.CNTCOMPROB='+''''+xxxNoComp+''' '
        +'Group by A.CUENTAID, A.CNTDH';


   Filtracds( cdsMovCNT2, xSQL );

   PanelMsg( 'Generando Resultados', cdsMovCNT2.RecordCount+1 );

   cdsMovCNT2.First;
   while not cdsMovCNT2.Eof do begin

      PanelMsg( 'Generando Resultados', 0 );

      xCtaPrin:= cdsMovCNT2.FieldByName( 'CUENTAID' ).AsString;
      xDH     := cdsMovCNT2.FieldByName( 'CNTDH'    ).AsString;
      xImpMN  := cdsMovCNT2.FieldByName( 'CNTMTOLOC').AsFloat;
      xImpME  := cdsMovCNT2.FieldByName( 'CNTMTOEXT').AsFloat;

      xDigAnt := 0;
      cdsNivel.First;
      while not DMCNT.cdsNivel.EOF do
      begin

         xDigitos := DMCNT.cdsNivel.fieldbyName('Digitos').AsInteger;
         xCuenta  := Trim( Copy( xCtaPrin , 1, xDigitos ) );
         xNivel   := DMCNT.cdsNivel.fieldbyName('Nivel').AsString;

         xCtaDes := '';
         xMov    := '';

         xSQL:='Select CTAABR, CTA_MOV, CYA_DIFC from TGE202'
              +' where CIAID='+quotedstr(xxxCia)
              +' and CUENTAID='+quotedstr(xCuenta)
              +' AND CTANIV='+quotedstr(xNivel);
         cdsQry2.Close;
         cdsQry2.ProviderName:='PrvTGE';
         cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
         cdsQry2.Open;

         xCtaDes := cdsQry2.FieldByName( 'CTAABR'  ).AsString;
         xMov    := cdsQry2.FieldByName( 'CTA_MOV' ).AsString;

         if Trim(DMCNT.cdsNivel.fieldbyName('Signo').AsString)='='  then
            if Length(xCuenta)=xDigitos  then  else Break;
         if DMCNT.cdsNivel.fieldbyName('Signo').AsString='<=' then
            if (Length(xCuenta)<=xDigitos) and (Length(xCuenta)>xDigAnt) then  else Break;
         if DMCNT.cdsNivel.fieldbyName('Signo').AsString='>=' then
            if Length(xCuenta)>=xDigitos then  else Break;

         if not CuentaExiste( xxxCia, xAno, xCuenta, '', '' ) then
         begin
            InsertaMov( xxxCia, xxxAnoMM, xCuenta, '', '', '', xDH, xMov,
                        xCtaDes, '', '' , xNivel, xImpMN, xImpME );
            if Errorcount>0 then Exit;
         end
         else
         begin
            ActualizaMov( xxxCia, xxxAnoMM, xCuenta, '', '', '', xDH, xMov,
                          xCtaDes, '', '' , xNivel, xImpMN, xImpME );
            if Errorcount>0 then Exit;
         end;

         xDigAnt := DMCNT.cdsNivel.fieldbyName('Digitos').AsInteger;

         cdsNivel.Next;
      end;
      cdsMovCNT2.Next;
   end;

   xSQL:='Select A.CUENTAID, A.CLAUXID, A.AUXID, A.AUXDES, A.CCOSID, A.CCOSDES, A.CNTDH, '
        +   'SUM( A.CNTMTOLOC ) CNTMTOLOC, SUM( A.CNTMTOEXT ) CNTMTOEXT, '
        +   'MAX(B.CTANIV) CTANIV, MAX(B.CTAABR) CTAABR, MAX(B.CTA_MOV) CTA_MOV, MAX(B.CTA_AUX) CTA_AUX, MAX(B.CTA_CCOS) CTA_CCOS '
        +'From CNT301 A, TGE202 B '
        +'Where A.CIAID='     +''''+xxxCia   +''''+' AND '
        +      'A.TDIARID='   +''''+xxxDiario+''''+' AND '
        +      'A.CNTANOMM='  +''''+xxxAnoMM +''''+' AND '
        +      'A.CNTCOMPROB='+''''+xxxNoComp+''' '
        +  'and A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
        +'Group by A.CUENTAID, A.CLAUXID, A.AUXID, A.AUXDES, A.CCOSID, A.CCOSDES, A.CNTDH ';

   Filtracds( cdsMovCNT2, xSQL );

   PanelMsg( 'Generando Resultados Por Auxiliar y C.Costo', cdsMovCNT2.RecordCount+1 );

   cdsMovCNT2.First;
   while not cdsMovCNT2.Eof do begin

      PanelMsg( 'Generando Resultados', 0 );

      xCtaPrin:= cdsMovCNT2.FieldByName( 'CUENTAID' ).AsString;
      xDH     := cdsMovCNT2.FieldByName( 'CNTDH'    ).AsString;
      xImpMN  := cdsMovCNT2.FieldByName( 'CNTMTOLOC').AsFloat;
      xImpME  := cdsMovCNT2.FieldByName( 'CNTMTOEXT').AsFloat;
      xClAux  := cdsMovCNT2.FieldByName( 'CLAUXID'  ).AsString;
      xAux    := cdsMovCNT2.FieldByName( 'AUXID'    ).AsString;
      xAuxDes := cdsMovCNT2.FieldByName( 'AUXDES'   ).AsString;
      xCCos   := cdsMovCNT2.FieldByName( 'CCOSID'   ).AsString;
      xCCoDes := cdsMovCNT2.FieldByName( 'CCOSDES'  ).AsString;
      xCuenta := cdsMovCNT2.FieldByName( 'CUENTAID' ).AsString;
      xCtaDes := cdsMovCNT2.FieldByName( 'CTAABR'   ).AsString;
      xMov    := cdsMovCNT2.FieldByName( 'CTA_MOV'  ).AsString;
      xFlAux  := cdsMovCNT2.FieldByName( 'CTA_AUX'  ).AsString;
      xFlCCo  := cdsMovCNT2.FieldByName( 'CTA_CCOS' ).AsString;

      ///////////////////////////
      //   Si Tiene Auxiliar   //
      ///////////////////////////
      if xFlAux='S' then
      begin
         if not CuentaExiste( xxxCia, xAno, xCuenta, xAux, '' ) then
         begin
            InsertaMov( xxxCia, xxxAnoMM, xCuenta, xClAux, xAux, '', xDH, xMov,
                        xCtaDes, xAuxDes, '' , xNivel, xImpMN, xImpME );
            if Errorcount>0 then Exit;
         end
         else
         begin
            ActualizaMov( xxxCia, xxxAnoMM, xCuenta, xClAux, xAux,'',xDH, xMov,
                          xCtaDes, xAuxDes, '' , xNivel, xImpMN, xImpME );
            if Errorcount>0 then Exit;
         end;
      end;

      ///////////////////////////
      //   Si Tiene C.Costo    //
      ///////////////////////////
      if xFlCCo='S' then
      begin
         if not CuentaExiste( xxxCia, xAno, xCuenta, xAux, xCCos ) then
         begin
            InsertaMov( xxxCia,xxxAnoMM,xCuenta, xClAux, xAux, xCCos, xDH,xMov,
                        xCtaDes, xAuxDes, xCCoDes, xNivel, xImpMN, xImpME );
            if Errorcount>0 then Exit;
         end
         else
         begin
            ActualizaMov( xxxCia,xxxAnoMM,xCuenta,xClAux,xAux, xCCos, xDH,xMov,
                          xCtaDes, xAuxDes, xCCoDes, xNivel, xImpMN, xImpME );
            if Errorcount>0 then Exit;
         end;
      end;
      cdsMovCNT2.Next;
   end;

   cdsQry2.IndexFieldNames:='';

end;


{  Anterior vhn  23/11/2001

procedure TDMCNT.GeneraEnLinea401( xxxCia,xxxDiario,xxxAnoMM,xxxNoComp: String );
var
   xCtaPrin, xClAux, xCuenta, xAuxDes, xAno, xMes, xDH, xSQL, xww : string;
   xMov, xAux, xCCos, xCCoDes, xCtaDes, xFLAux, xFLCCo, xNivel, xNREG: String;
   xDigitos, xDigAnt, xNumT : Integer;
   xImpMN, xImpME    : Double;
   cdsCta            : TwwClientDataSet;
begin
   xAno := Copy(xxxAnoMM,1,4);
   xMes := Copy(xxxAnoMM,5,2);

   // 5
   PanelMsg( 'Generando Resultados',0 );

/// Añade CNTNREG

//   Filtracds( cdsMovCNT2,'Select CUENTAID, CLAUXID, AUXID, AUXDES, CCOSID, CCOSDES, CNTDH, '
//                        +  'SUM( CNTMTOLOC ) CNTMTOLOC, SUM( CNTMTOEXT ) CNTMTOEXT '
//                        +'From CNT301 Where '
//                        +  'CIAID='     +''''+xxxCia   +''''+' AND '
//                        +  'TDIARID='   +''''+xxxDiario+''''+' AND '
//                        +  'CNTANOMM='  +''''+xxxAnoMM +''''+' AND '
//                        +  'CNTCOMPROB='+''''+xxxNoComp+''' '
//                        +'Group by CUENTAID, CLAUXID, AUXID, AUXDES, CCOSID, CCOSDES, CNTDH '
//                        +'Order by CUENTAID ');
//
   xSQL:='Select A.CUENTAID, A.CLAUXID, A.AUXID, A.AUXDES, A.CCOSID, A.CCOSDES, A.CNTDH, '
        +   'SUM( A.CNTMTOLOC ) CNTMTOLOC, SUM( A.CNTMTOEXT ) CNTMTOEXT, '
        +   'MAX(B.CTANIV), MAX(B.CTAABR), MAX(B.CTA_MOV), MAX(B.CTA_AUX), MAX(B.CTA_CCOS) '
        +'From CNT301 A, TGE202 B '
        +'Where A.CIAID='     +''''+xxxCia   +''''+' AND '
        +      'A.TDIARID='   +''''+xxxDiario+''''+' AND '
        +      'A.CNTANOMM='  +''''+xxxAnoMM +''''+' AND '
        +      'A.CNTCOMPROB='+''''+xxxNoComp+''' '
        +  'and A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
        +'Group by A.CUENTAID, A.CLAUXID, A.AUXID, A.AUXDES, A.CCOSID, A.CCOSDES, A.CNTDH '
        +'Order by A.CUENTAID '

   Filtracds( cdsMovCNT2, xSQL );

   PanelMsg( 'Generando Resultados', cdsMovCNT2.RecordCount+1 );
   xww:='';
   cdsMovCNT2.First;
   while not cdsMovCNT2.Eof do begin

      PanelMsg( 'Generando Resultados', 0 );

      xCtaPrin:= cdsMovCNT2.FieldByName( 'CUENTAID' ).AsString;
      xDH     := cdsMovCNT2.FieldByName( 'CNTDH'    ).AsString;
      xImpMN  := cdsMovCNT2.FieldByName( 'CNTMTOLOC').AsFloat;
      xImpME  := cdsMovCNT2.FieldByName( 'CNTMTOEXT').AsFloat;
      xClAux  := cdsMovCNT2.FieldByName( 'CLAUXID'  ).AsString;
      xAux    := cdsMovCNT2.FieldByName( 'AUXID'    ).AsString;
      xAuxDes := cdsMovCNT2.FieldByName( 'AUXDES'   ).AsString;
      xCCos   := cdsMovCNT2.FieldByName( 'CCOSID'   ).AsString;
      xCCoDes := cdsMovCNT2.FieldByName( 'CCOSDES'  ).AsString;

      cdsNivel.First;

      xCuenta := Trim( Copy( xCtaPrin , 1, DMCNT.cdsNivel.fieldbyName('Digitos').AsInteger ) );

      if xCuenta<>xCtaAnt then begin
         xSQL:='Select CUENTAID, CTANIV, CTAABR, CTA_MOV, CTA_AUX, CTA_CCOS from TGE202'
              +' where CIAID='+quotedstr(xxxCia)
              +' and SUBSTR(CUENTAID,1,'+DMCNT.cdsNivel.fieldbyName('Digitos').AsString+')='+quotedstr(xCuenta);
         cdsQry2.Close;
         cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
         cdsQry2.Open;
         cdsQry2.IndexFieldNames:='CUENTAID;CTANIV';
         xCtaAnt:=xCuenta;
      end;

      xDigAnt := 0;
      cdsNivel.First;
      while not DMCNT.cdsNivel.EOF do
       begin

         xDigitos := DMCNT.cdsNivel.fieldbyName('Digitos').AsInteger;
         xCuenta  := Trim( Copy( xCtaPrin , 1, xDigitos ) );
         xNivel   := DMCNT.cdsNivel.fieldbyName('Nivel').AsString;

         xSQL:='Select CTAABR, CTA_MOV, CTA_AUX, CTA_CCOS from TGE202'
               +' where CIAID='+quotedstr(xxxCia)
                +' and CUENTAID='+quotedstr(xCuenta)
                +' AND CTANIV='+quotedstr(xNivel);
         cdsQry2.Close;
         cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
         cdsQry2.Open;

         xCtaDes := '';
         xMov    := '';

         cdsQry2.SetKey;
         cdsQry2.FieldByName('CUENTAID').AsString:=xCuenta;
         cdsQry2.FieldByName('CTANIV').AsString  :=xNivel;
         if cdsQry2.GotoKey then
         begin
            xCtaDes := cdsQry2.FieldByName( 'CTAABR'  ).AsString;
            xMov    := cdsQry2.FieldByName( 'CTA_MOV' ).AsString;
            xFlAux  := cdsQry2.FieldByName( 'CTA_AUX' ).AsString;
            xFlCCo  := cdsQry2.FieldByName( 'CTA_CCOS').AsString;

           If Trim(DMCNT.cdsNivel.fieldbyName('Signo').AsString)='='  then
              if Length(xCuenta)=xDigitos  then  else Break;
           If DMCNT.cdsNivel.fieldbyName('Signo').AsString='<=' then
              if (Length(xCuenta)<=xDigitos) and (Length(xCuenta)>xDigAnt) then  else Break;
           If DMCNT.cdsNivel.fieldbyName('Signo').AsString='>=' then
              if Length(xCuenta)>=xDigitos then  else Break;

           if not CuentaExiste( xxxCia, xAno, xCuenta, '', '' ) then
            begin
              InsertaMov( xxxCia, xxxAnoMM, xCuenta, '', '', '', xDH, xMov,
                          xCtaDes, '', '' , xNivel, xImpMN, xImpME );
            end
           else
            begin
              ActualizaMov( xxxCia, xxxAnoMM, xCuenta, '', '', '', xDH, xMov,
                            xCtaDes, '', '' , xNivel, xImpMN, xImpME );
            end;
           xDigAnt := DMCNT.cdsNivel.fieldbyName('Digitos').AsInteger;

            ///////////////////////////
            //   Si Tiene Auxiliar   //
            ///////////////////////////
            if xFlAux='S' then
             begin
              if not CuentaExiste( xxxCia, xAno, xCuenta, xAux, '' ) then
               begin
                  InsertaMov( xxxCia, xxxAnoMM, xCuenta, xClAux, xAux, '', xDH, xMov,
                              xCtaDes, xAuxDes, '' , xNivel, xImpMN, xImpME );
               end
              else
               begin
                  ActualizaMov( xxxCia, xxxAnoMM, xCuenta, xClAux, xAux,'',xDH, xMov,
                                xCtaDes, xAuxDes, '' , xNivel, xImpMN, xImpME );
               end;
             end;

            ///////////////////////////
            //   Si Tiene C.Costo    //
            ///////////////////////////
            if xFlCCo='S' then
             begin
              if not CuentaExiste( xxxCia, xAno, xCuenta, xAux, xCCos ) then
               begin
                  InsertaMov( xxxCia,xxxAnoMM,xCuenta, xClAux, xAux, xCCos, xDH,xMov,
                              xCtaDes, xAuxDes, xCCoDes, xNivel, xImpMN, xImpME );
               end
              else
               begin
                  ActualizaMov( xxxCia,xxxAnoMM,xCuenta,xClAux,xAux, xCCos, xDH,xMov,
                                xCtaDes, xAuxDes, xCCoDes, xNivel, xImpMN, xImpME );
               end;
             end;
          end;
         cdsNivel.Next;
       end;
      cdsMovCNT2.Next;
   end;





   cdsQry2.IndexFieldNames:='';

end;
}


function TDMCNT.CuentaExiste( xxxxCia, xxxxAno, xxxxCuenta, xxxxAux,
                            xxxxCCos : String ) : Boolean;
var
   xSQL : String;
   xAuxid,xCcosid : String;
begin
   //** 13/08/2001 - pjsv
   If xxxxAux = '' then
      xAuxid := '(AUXID='+quotedstr(xxxxAux)+' OR AUXID IS NULL) AND '
   else
      xAuxid := 'AUXID='+quotedstr(xxxxAux) + ' AND ';
   If xxxxCCos = '' then
      xCcosid := '(CCOSID='+quotedstr(xxxxCCos)+' OR CCOSID IS NULL)'
   else
      xCcosid := 'CCOSID='+quotedstr(xxxxCCos);

   xSQL:='Select COUNT(*) TOTREG from CNT401 '
           + 'Where CIAID='   +''''+xxxxCia   +''''+' and '
           + 'ANO='     +''''+xxxxAno   +''''+' and '
           + 'CUENTAID='+''''+xxxxCuenta+''''+' and ';
    xSQL := xSQL + xAuxid + xCcosid;
   //**
   cdsQry.Close;
   cdsQry.ProviderName:= 'PrvTGE';
   cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
   cdsQry.Open;
   //** 13/08/2001 - pjsv
   if cdsQry.fieldbyName('TOTREG').asInteger>0 then
   //**
      Result:=True
   else
      Result:=False;
end;

procedure TDMCNT.ActualizaMov(cCia,cAnoMM,cCuenta,cClAux,cAux,cCCosto,cDH, cMov,
                            cCtaDes,cAuxDes,cCCoDes,cNivel: String;
                            nImpMN,nImpME:Single );
var
   cMes, cAno, cSQL, cMesT : String;
   nMes             : Integer;
   xAuxid,xCcosid,xClauxid : String;
begin

   cAno := Copy( cAnoMM,1,4 );
   cMes := Copy( cAnoMM,5,2 );

   cSQL := 'Update CNT401 Set CTADES ='+''''+cCtaDes+''''+', '
                            +'AUXDES ='+''''+cAuxDes+''''+', '
                            +'CCODES ='+''''+cCCoDes+''''+', ';

   if cDH='D' then begin
      cSQL:=cSQL + '  DEBEMN'+ cMes +'='+
                   '( '+wReplacCeros+'(DEBEMN'+ cMes +',0)+'+ FloatToStr( nImpMN )+') ';
      cSQL:=cSQL + ', DEBEME'+ cMes+'='+
                   '( '+wReplacCeros+'(DEBEME'+ cMes +',0)+'+ FloatToStr( nImpME )+') ';
   end;
   if cDH='H' then begin
      cSQL:=cSQL + '  HABEMN'+ cMes +'='+
                   '( '+wReplacCeros+'(HABEMN'+ cMes +',0)+'+ FloatToStr( nImpMN )+') ';
      cSQL:=cSQL + ', HABEME'+ cMes +'='+
                   '( '+wReplacCeros+'(HABEME'+ cMes +',0)+'+ FloatToStr( nImpME )+') ';
   end;

   //** 13/08/2001 - pjsv, para que grabe en el mes del movimiento.
   cSQL:= cSQL + ', SALDMN'+ cMes +'=';
   cSQL:= cSQL + '('+wReplacCeros+'(SALDMN'+ cMes +',0)';
   if cDH='D' then cSQL:=cSQL+'+'
   else cSQL:=cSQL+'-';
   cSQL:=cSQL + '('+FloatToStr( nImpMN )+') ) ';

   cSQL:= cSQL + ', SALDME'+ cMes +'=';
   cSQL:= cSQL + '('+wReplacCeros+'(SALDME'+ cMes +',0)';
   if cDH='D' then cSQL:=cSQL+'+'
   else cSQL:=cSQL+'-';
   cSQL:=cSQL + '('+FloatToStr( nImpME )+') ) ';
   //**

   for nMes:=(StrToInt( cMes )+1) to 13 do begin
       cMesT := StrZero( IntToStr( nMes),2);

       cSQL:= cSQL + ', SALDMN'+ cMesT +'=';
       cSQL:= cSQL + '( '+wReplacCeros+'(SALDMN'+ cMesT +',0)';
       if cDH='D' then cSQL:=cSQL+'+' else cSQL:=cSQL+'-';
       cSQL:=cSQL + FloatToStr( nImpMN )+') ';

       cSQL:= cSQL + ', SALDME'+ cMesT +'=';
       cSQL:= cSQL + '( '+wReplacCeros+'(SALDME'+ cMesT +',0)';
       if cDH='D' then cSQL:=cSQL+'+' else cSQL:=cSQL+'-';
       cSQL:=cSQL + FloatToStr( nImpME )+') ';
   end;

   //** 13/08/2001 - pjsv, para que ubique correctamente
   If cAux = '' then
     xAuxid := '(AUXID='+quotedstr(cAux)+' OR AUXID IS NULL) AND '
   else
     xAuxid := 'AUXID='+quotedstr(cAux) + ' AND ';
   If cCCosto = '' then
      xCcosid := '(CCOSID='+quotedstr(cCCosto)+' OR CCOSID IS NULL) AND '
   else
      xCcosid := 'CCOSID='+quotedstr(cCCosto) + ' AND ';
   If cClAux = '' then
      xClauxid := '(CLAUXID='+quotedstr(cClAux)+' OR CLAUXID IS NULL)'
   else
      xClauxid := 'CLAUXID='+quotedstr(cClAux);
   //**
   cSQL:=cSQL + 'Where CIAID=   '+''''+cCia    +''''+' and '
              +       'ANO=     '+''''+cAno    +''''+' and '
              +       'CUENTAID='+''''+cCuenta +''''+' and ';
   //** 13/08/2001- pjsv
   cSQL:=cSQL +xAuxid+xCcosid+xClauxid;
   //**

   try
      DCOM1.AppServer.EjecutaSQL( cSQL );
   except
      ControlTranCNT( 1 );
   end;
end;

procedure TDMCNT.InsertaMov(cCia,cAnoMM,cCuenta,cClAux,cAux,cCCosto,cDH,cMov,
                          cCtaDes,cAuxDes,cCCoDes,cNivel: String; nImpMN,nImpME: Single) ;
var
   cMes, cAno, cSQL, cMesT : String;
   nMes             : Integer;
   xCtaMov : String;
begin
   cAno := Copy( cAnoMM,1,4 );
   cMes := Copy( cAnoMM,5,2 );

   //** 13/08/2001- pjsv, para jalar si es de movimiento
   xCtaMov := DMCNT.DisplayDescrip('PrvTGE','TGE202','CTA_MOV','CUENTAID='+quotedstr(cCuenta),'CTA_MOV');
   //**

   cSQL := 'Insert into CNT401( CIAID, ANO, CUENTAID, CLAUXID, AUXID, '
         +                    ' CCOSID, CTADES, AUXDES, CCODES, TIPO ,CTA_MOV';

   if cDH='D' then cSQL:=cSQL+ ', DEBEMN'+ cMes + ', DEBEME' + cMes;
   if cDH='H' then cSQL:=cSQL+ ', HABEMN'+ cMes + ', HABEME' + cMes;

   //** 13/08/2001 - pjsv, para que genere el saldo del mes del movimiento
   cSQL:=cSQL + ', SALDMN'+ cMes;
   cSQL:=cSQL + ', SALDME'+ cMes;
   //**

   for nMes:=(StrToInt( cMes )+1) to 13 do begin
       cMesT := StrZero( IntToStr( nMes ),2);
       cSQL:=cSQL + ', SALDMN'+ cMesT;
       cSQL:=cSQL + ', SALDME'+ cMesT;
   end;
   cSQL:=cSQL+' ) ';
   cSQL:=cSQL+'Values( '+''''+cCia    +''''+', '+''''+cAno   +''''+', '
                        +''''+cCuenta +''''+', '+''''+cClAux +''''+', '
                        +''''+cAux    +''''+', '+''''+cCCosto+''''+', '
                        +''''+cCtaDes +''''+', '+''''+cAuxDes+''''+', '
                        +''''+cCCoDes +''''+', '+''''+cNivel +''''+', '
                        //** 13/08/2001 - pjsv
                        +quotedstr(xCtaMov)+','
                        //**
                        +FloatToStr( nImpMN )+', '
                        +FloatToStr( nImpME )+' ';

   //** 13/08/2001 - psjv, para el monto del mes del movimiento
   if cDH='D' then cSQL:=cSQL+', +' else cSQL:=cSQL+', -';
     cSQL:=cSQL + FloatToStr( nImpMN )+' ';
   if cDH='D' then cSQL:=cSQL+', +' else cSQL:=cSQL+', -';
     cSQL:=cSQL + FloatToStr( nImpME )+' ';
   //**

   for nMes:=(StrToInt( cMes )+1) to 13 do begin
       cMesT := StrZero( IntToStr( nMes ),2);
       if cDH='D' then cSQL:=cSQL+', +' else cSQL:=cSQL+', -';
       cSQL:=cSQL + FloatToStr( nImpMN )+' ';
       if cDH='D' then cSQL:=cSQL+', +' else cSQL:=cSQL+', -';
       cSQL:=cSQL + FloatToStr( nImpME )+' ';
   end;

   cSQL:=cSQL+' ) ';

   try
      DCOM1.AppServer.EjecutaSQL( cSQL );
   except
      ControlTranCNT( 1 );
   end;
end;

procedure TDMCNT.CreaPanel( xForma:TForm; xMensaje:String );
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
   pnlConta.Left   := strtoInt(FloattoStr(FRound( ( ((xForma.Width-100))/2)-100,3,0 )));
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

procedure TDMCNT.PanelMsg( xMensaje:String; xProc:Integer );
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

procedure TDMCNT.GeneraContabilidad( xxCia, xxTDiario, xxAnoMM, xxNoComp: String;
                                   xForma: TForm; xxModulo : String );
var
   xSQL : String;
begin
   xSql := 'SELECT * FROM SOLCONFIG';
   cdsqry.Close;
   cdsqry.datarequest(xSql);
   cdsQry.Open;
   If cdsqry.fieldbyname('SRV_DB').AsString = 'DB2400' then
    begin
     wDBFunc01 := 'RRN(CAJA304)';
     wDBFunc02 := 'RRN(CNT301)';
    end
   else
    begin
     wDBFunc01 := 'Int(Rand()*1000000)';
     wDBFunc02 := 'Int(Rand()*1000000)';
    end;


   CreaPanel( xForma, 'Contabilizando' );
   TransferiraCNT ( xxCIA , xxAnoMM , xxTDiario , xxNoComp, xxModulo ) ;
   if Contabiliza( xxCia, xxTDiario, xxAnoMM, xxNoComp ) then
      PanelMsg( 'Asiento Contabilizando Final',0 );

   pnlConta.Free;
end;

procedure TDMCNT.TransferiraCNT;
var xSQL : String;
begin
	if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
    xSQL:='INSERT INTO CNT301 (CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE,'+
          'CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA,'+
          'CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT,'+
          'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE,'+
          'CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS,'+
          'CNTAATRI, CNTAASEM, CNTAASS, TMONID,'+
          'TDIARDES, CTADES, DOCDES, CCOSDES, CNTDEBEME, CNTDEBEMN,'+
          'CNTHABEME, CNTHABEMN,CNTREG,CNTMODDOC ) '+
          'SELECT CAJA304.CIAID, CAJA304.TDIARID,  CAJA304.ECNOCOMP, CAJA304.DCANO,CAJA304.ECANOMM,'+
          'CAJA304.DCLOTE,CAJA304.CUENTAID, CAJA304.CLAUXID,CAJA304.DCAUXID,'+
          'CAJA304.DOCID, CAJA304.DCSERIE,'+
          'CAJA304.DCNODOC, CAJA304.DCGLOSA,  CAJA304.DCDH,CAJA304.CCOSID, CAJA304.DCTCAMPA,'+
          'CAJA304.DCMTOORI, CAJA304.DCMTOLO, CAJA304.DCMTOEXT,'+
          'CAJA304.DCFEMIS, CAJA304.DCFVCMTO, CAJA304.ECFCOMP,CAJA304.DCESTADO, CAJA304.DCFLACDR,'+
          'CAJA304.DCUSER,CAJA304.DCFREG, CAJA304.DCHREG, CAJA304.DCMM, CAJA304.DCDD ,'+
          'CAJA304.DCTRI,CAJA304.DCSEM,  CAJA304.DCSS, CAJA304.DCAATRI, CAJA304.DCAASEM,'+
          'CAJA304.DCAASS,  CAJA304.TMONID, TGE104.TDIARABR,'+
          'TGE202.CTAABR, TGE110.DOCABR, TGE203.CCOSABR,'+
          'CASE WHEN DCDH= ''D'' THEN DCMTOEXT ELSE NULL END AS CNTDEBEME,'+
          'CASE WHEN DCDH= ''D'' THEN DCMTOLO  ELSE NULL END AS CNTDEBEMN,'+
          'CASE WHEN DCDH= ''H'' THEN DCMTOEXT ELSE NULL END AS CNTHABEME,'+
          'CASE WHEN DCDH= ''H'' THEN DCMTOLO  ELSE NULL END AS CNTHABEMN,'+
           wDBFUNC01 +
          ',''CAJA''' +
          ' FROM CAJA304' +
          ' LEFT OUTER JOIN TGE104 ON (CAJA304.TDIARID = TGE104.TDIARID)'+
          ' LEFT OUTER JOIN TGE202 ON (CAJA304.CIAID = TGE202.CIAID)'+
          ' AND (CAJA304.CUENTAID = TGE202.CUENTAID)'+
          ' LEFT OUTER JOIN TGE110 ON (CAJA304.DOCMOD=TGE110.DOCMOD AND CAJA304.DOCID = TGE110.DOCID)'+
          ' LEFT OUTER JOIN TGE203 ON (CAJA304.CCOSID = TGE203.CCOSID)'+
          ' WHERE  CAJA304.CIAID='+quotedstr(pCIAID)  +' AND'+
          ' CAJA304.ECANOMM='     +quotedstr(pECANOMM)+' AND'+
          ' CAJA304.TDIARID='     +quotedstr(pTDIARID)+' AND'+
          ' CAJA304.ECNOCOMP='    +quotedstr(pECNOCOMP)
  else
  	if SRV_D = 'ORACLE' then
      xSQL:='INSERT INTO CNT301 (CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE,'+
              'CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA,'+
              'CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT,'+
              'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE,'+
              'CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS,'+
              'CNTAATRI, CNTAASEM, CNTAASS, TMONID,'+
              'TDIARDES, CTADES, DOCDES, CCOSDES, CNTDEBEME, CNTDEBEMN,'+
              'CNTHABEME, CNTHABEMN,CNTREG,CNTMODDOC ) '+
            'SELECT CAJA304.CIAID, CAJA304.TDIARID,  CAJA304.ECNOCOMP, CAJA304.DCANO,CAJA304.ECANOMM,'+
              'CAJA304.DCLOTE,CAJA304.CUENTAID, CAJA304.CLAUXID,CAJA304.DCAUXID,'+
              'CAJA304.DOCID, CAJA304.DCSERIE,'+
              'CAJA304.DCNODOC, CAJA304.DCGLOSA,  CAJA304.DCDH,CAJA304.CCOSID, CAJA304.DCTCAMPA,'+
              'CAJA304.DCMTOORI, CAJA304.DCMTOLO, CAJA304.DCMTOEXT,'+
              'CAJA304.DCFEMIS, CAJA304.DCFVCMTO, CAJA304.ECFCOMP,CAJA304.DCESTADO, CAJA304.DCFLACDR,'+
              'CAJA304.DCUSER,CAJA304.DCFREG, CAJA304.DCHREG, CAJA304.DCMM, CAJA304.DCDD ,'+
              'CAJA304.DCTRI,CAJA304.DCSEM,  CAJA304.DCSS, CAJA304.DCAATRI, CAJA304.DCAASEM,'+
              'CAJA304.DCAASS,  CAJA304.TMONID, TGE104.TDIARABR,'+
              'TGE202.CTAABR, TGE110.DOCABR, TGE203.CCOSABR,'+
              'DECODE(DCDH, ''D'' , DCMTOEXT , NULL ) CNTDEBEME,'+
              'DECODE(DCDH, ''D'' , DCMTOLO  , NULL ) CNTDEBEMN,'+
              'DECODE(DCDH, ''H'' , DCMTOEXT , NULL ) CNTHABEME,'+
              'DECODE(DCDH, ''H'' , DCMTOLO  , NULL ) CNTHABEMN,'+
               wDBFUNC01 +
              ',''CAJA''' +
            ' FROM CAJA304, TGE104, TGE202' +
            ' WHERE  CAJA304.CIAID='  +quotedstr(pCIAID)  +' AND'+
              ' CAJA304.ECANOMM='     +quotedstr(pECANOMM)+' AND'+
              ' CAJA304.TDIARID='     +quotedstr(pTDIARID)+' AND'+
              ' CAJA304.ECNOCOMP='    +quotedstr(pECNOCOMP)+
              ' AND (CAJA304.TDIARID = TGE104.TDIARID (+) )'+
              ' AND (CAJA304.CIAID = TGE202.CIAID (+) )'+
              ' AND (CAJA304.CUENTAID = TGE202.CUENTAID (+) )'+
              ' AND (CAJA304.DOCMOD=TGE110.DOCMOD (+) AND CAJA304.DOCID = TGE110.DOCID (+) )'+
              ' AND (CAJA304.CCOSID = TGE203.CCOSID (+) )';
              
//obc   DCOM1.AppServer.IniciaTransaccion;
   try
      DCOM1.AppServer.EjecutaSQL( xSQL );
//obc      DCOM1.AppServer.GrabaTransaccion;
   except
//obc      DCOM1.AppServer.RegresaTransaccion;
   end;

end;

//**

function TDMCNT.MesCerrado(xMes, xAno, xCiaid: String): Boolean;
var
 xSql : String;
begin

  if xMes='00' then
     xMes:='01';

  xSql := 'SELECT PER'+strzero(xMes,2)+' FROM TGE154 WHERE CIAID='+quotedstr(xCiaid)+
          ' AND ANO='+quotedstr(xAno);
  cdsCNTtemp.IndexFieldNames:='';
  cdsCNTtemp.Close;
  cdsCNTtemp.DataRequest(xSql);
  cdsCNTtemp.Open;
  If cdsCNTtemp.FieldByName('PER'+strzero(xMes,2)).AsString = 'S' then
   result := True
  else result := False;
end;

procedure TDMCNT.cdsCabCNTReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Action := HandleReconcileError(Dataset,UpdateKind,E);
//   If wFErrorCode = '1' then
//      Action := raCancel;
end;

procedure TDMCNT.cdsMovCNTReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Action := HandleReconcileError(Dataset,UpdateKind,E);
{   If wFErrorCode = '1' then
      Action := raCancel;}
end;

procedure TDMCNT.cdsRMayorReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
    Action := HandleReconcileError(Dataset,UpdateKind,E);
//   If wFErrorCode = '1' then
//     Action := raCancel;
end;

procedure TDMCNT.cdsRCuentaReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Action := HandleReconcileError(Dataset,UpdateKind,E);
{   If wFErrorCode = '1' then
      Action := raCancel;}
end;

procedure TDMCNT.cdsMayorAuxReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
    Action := HandleReconcileError(Dataset,UpdateKind,E);
//   If wFErrorCode = '1' then
//     Action := raCancel;
end;

procedure TDMCNT.cdsMayorAuxAReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
    Action := HandleReconcileError(Dataset,UpdateKind,E);
//   If wFErrorCode = '1' then
//     Action := raCancel;
end;

procedure TDMCNT.cdsMovCNT1ReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
   Action := HandleReconcileError(Dataset,UpdateKind,E);
{   If wFErrorCode = '1' then
      Action := raCancel;}
end;



Function TDMCNT.Buscar(pCadena,pEsto: String) : STring;
var
 xPos : Integer;
begin
  xPos := Pos(pEsto,pCadena);
  Result := '';
  Result := Result + IntToStr(xPos);
end;


procedure TDMCNT.cdsCuentaReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
    Action := HandleReconcileError(Dataset,UpdateKind,E);
end;

procedure TDMCNT.ActualizaFiltro(wwFiltro: TMant; wwCdsLee: TwwClientDataSet;
  wwAccion: String);
var
   i : integer;
begin
// wFiltro : Es el Filtro que va a actualizar
// wCDsLee : Es el cds que contiene la información a actualizar
// wAccion : 'A' = Adición/Inserción/Nuevo Item
//           'M' = Actualización del Registro
//           'E' = Eliminación del Registro

   if wwAccion='E' then
   begin
      wwFiltro.FMant.cds2.Delete;
   end;

   if wwAccion='A' then
   begin
      wwFiltro.FMant.cds2.Append;
   end;

   if wwAccion='M' then
   begin
      wwFiltro.FMant.cds2.Edit;
   end;
   // VHNDEMA
   if (wwAccion='A') or (wwAccion='M') then
   begin
      for i:=0 to wwCdsLee.FieldCount-1 do
      begin
         wwFiltro.FMant.cds2.FieldByName(wwCdsLee.Fields[i].FieldName).Value :=
                wwCdsLee.FieldByName(wwCdsLee.Fields[i].FieldName).Value;
      end;
      wwFiltro.FMant.cds2.Post;
   end;
   // END VHNDEMA
end;


procedure TDMCNT.HojaExcel(Tit: string; TDs: TDataSource; TDb: TDBGrid);
var Lcid, C, CH, CH1, I, W, X, Y, TotHoja: Integer; Bk: TBookmarkStr;
    Tabla: Variant; L, A: OleVariant; HH: Extended;
begin
	if not TDs.DataSet.Active then Exit;
	if TDs.DataSet.RecordCount = 0 then Exit;

	Lcid:= GetUserDefaultLCID;
	C:= TDb.Columns.Count;
	CH:= 1;
	if TDs.DataSet.RecordCount > 15100 then
		begin
			HH:= TDs.DataSet.RecordCount / 15100;
			CH:= Trunc(HH);
			if Frac(HH) > 0 then CH:= CH + 1;
		end;

	ExcelApp.Visible[Lcid]:= True;
	ExcelApp.Caption:= 'Consultas en EXCEL';
	ExcelBook.ConnectTo(ExcelApp.Workbooks.Add(1, Lcid));
	if CH > 1 then
		begin
			ExcelBook.Worksheets.Add(NULL, NULL, (CH - 1), NULL, Lcid);
			for I:= 1 to CH do
				begin
					WS.ConnectTo(ExcelBook.Worksheets[I] as _Worksheet);
					WS.Name:= Tit + '_' + IntToStr(I);
				end;
		end;

	WS.ConnectTo(ExcelBook.Worksheets[1] as _Worksheet);
	WS.Activate(Lcid);
	if CH = 1 then WS.Name:= Tit;
	ExcelApp.ScreenUpdating[Lcid]:= False;
	for X:= 1 to CH do
		begin
			WS.ConnectTo(ExcelBook.Worksheets[X] as _Worksheet);
			WS.Activate(Lcid);
			for I:= 0 to (C - 1) do
				begin
					L:= WS.Cells.Item[1, I + 1];
					WS.Range[L, L].Value2:= TDb.Columns[I].Title.Caption;
				end;
		end;

	WS.ConnectTo(ExcelBook.Worksheets[1] as _Worksheet);
	WS.Activate(Lcid);

	CH1:= 1;
	W:= 2;
	I:= 1;
	Y:= 1;
	TotHoja:= 0;
	TDs.DataSet.DisableControls;
	Bk:= TDs.DataSet.Bookmark;

	Tabla:= VarArrayCreate([1, 5000, 0, C], varVariant);
	TDs.DataSet.First;
	while not TDs.DataSet.Eof do
		begin
			for X:= 0 to (C - 1) do Tabla[Y, X]:= TDs.DataSet.Fields[X].AsString;
			if Y = 5000 then
				begin
					L:= 'A' + IntToStr(W);
					WS.Range[L, WS.Cells.Item[I + 1, C]].Value2:= Tabla;
					try
						Tabla:= Unassigned;
					finally
						Tabla:= VarArrayCreate([1, 5000, 0, C], varVariant);
					end;

					Y:= 0;
					W:= I + 2;
				end;
			Inc(Y, 1);
			Inc(I, 1);
			Inc(TotHoja, 1);
			if TotHoja = 15100 then
				begin
					L:= 'A' + IntToStr(W);
					WS.Range[L, WS.Cells.Item[I, C]].Value2:= Tabla;

					try
						Tabla:= Unassigned;
					finally
						Tabla:= VarArrayCreate([1, 5000, 0, C], varVariant);
					end;

					CH1:= CH1 + 1;
					WS.ConnectTo(ExcelBook.Worksheets[CH1] as _Worksheet);
					WS.Activate(Lcid);

					Y:= 1;
					W:= 2;
					I:= 1;
					TotHoja:= 0;
				end;
			Application.ProcessMessages;
			TDs.DataSet.Next;
		end;
	CH1:= I;
	try
	   WS.Range['A' + IntToStr(W), WS.Cells.Item[CH1, C]].Value2:= Tabla;
	finally
		Tabla:= Unassigned;
	end;

	for X:= 1 to CH do
		begin
			WS.ConnectTo(ExcelBook.Worksheets[X] as _Worksheet);
			WS.Activate(Lcid);

			SetLength(FormatCel, C + 1);
			FormatosCeldas(C,TDs);
			for I:= 1 to C do
				begin
					L:= WS.Cells.Item[1, I];
					WS.Range[L, L].EntireColumn.NumberFormat:= FormatCel[I];
				end;

			for I:= 0 to (C - 1) do
				begin
					L:= WS.Cells.Item[1, I + 1];
					Y:= TDs.DataSet.Fields[I].DisplayWidth;
					if Length(TDb.Columns[I].Title.Caption) > Y then
						Y:= Length(TDb.Columns[I].Title.Caption);
					  WS.Range[L, L].EntireColumn.ColumnWidth:= Y + 2;
					if TDb.Columns[I].Alignment = taLeftJustify then A:= 2;
					if TDb.Columns[I].Alignment = taCenter then A:= 3;
					if TDb.Columns[I].Alignment = taRightJustify then A:= 4;
					WS.Range[L, L].EntireColumn.HorizontalAlignment:= A;
				end;

			L:= WS.Cells.Item[1, C];
			WS.Range['A1', L].HorizontalAlignment:= 3;
			WS.Range['A1', L].Interior.Color:= clMaroon;
			WS.Range['A1', L].Font.Color:= clWhite;
			WS.Range['A1', L].Font.Bold:= True;

			if CH = 1 then W:= TDs.DataSet.RecordCount + 1
			else if (CH > 1) and (X < CH) then W:= 15101
			else if (CH > 1) and (X = CH) then W:= CH1;

			WS.PageSetup.PrintGridlines:= True;
			WS.PageSetup.PrintTitleRows:= '1:1';

			WS.DefaultInterface.Set_DisplayAutomaticPageBreaks(Lcid, True);
		end;

	WS.ConnectTo(ExcelBook.Worksheets[1] as _Worksheet);
	WS.Activate(Lcid);

	ExcelApp.ScreenUpdating[Lcid]:= True;

	TDs.DataSet.EnableControls;
	TDs.DataSet.Bookmark:= Bk;


end;

procedure TDMCNT.FormatosCeldas(N: Integer; TDs: TDataSource);
var I: Integer; F: TFieldDef;
begin
    for I:= 1 to N do
    Begin
          F := TDs.DataSet.FieldDefs.Items[I-1];
          Case F.DataType of
               ftString: FormatCel[I]:= StrZero('0',Length(TDs.DataSet.Fields[I-1].AsString));
               ftDate: FormatCel[I]:= 'dd/mm/yyyy';
               ftDateTime: FormatCel[I]:= 'dd/mm/yyyy';
               ftTimeStamp: FormatCel[I]:= 'dd/mm/yyyy';
               ftUnknown: FormatCel[I]:= StrZero('0',Length(TDs.DataSet.Fields[I-1].AsString));
          Else
               FormatCel[I]:= Null;
          End;
     End;


end;


procedure TDMCNT.DataModuleDestroy(Sender: TObject);
begin
// ENVIA PARAMETROS DE LA PC DEL USUARIO HACIA LA APLICACION SERVIDOR
   try
      if ideconex<>'' then
         DCOM1.AppServer.ConexionOFF( wUsuario, ideconex);
   except
   end;
end;

function TDMCNT.VerificaVersion(pgVersion:String): Boolean;
var
   xSQL : String;
begin
   xSQL:='Select VERSION '
        +'from TGE600 '
        +'where CODIGO=''CNT'' '
        +' and PAQUETE='+quotedstr('CNTPk01');
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest( xSQL );
   DMCNT.cdsQry.Open;
   if DMCNT.cdsQry.FieldByName('VERSION').AsString=pgVersion then
      Result:=True
   else
   begin
      ShowMessage( 'Para poder continuar, es necesario que actualice la Versión');
      Result:=False;
   end
end;

Function TDMCNT.fg_VerificaVersion(wgVersion :String): Boolean;
Var
   xsSQL : String;
Begin
   Result:=False;
   xsSQL:='SELECT * FROM TGE600 WHERE CODIGO = ' + QuotedStr(wModulo);
   cdsQry.Close;
   cdsQry.DataRequest( xsSQL );
   cdsQry.Open;
   If Trim(wgVersion) = Trim(cdsQry.FieldByName('VERSION').AsString) Then
      Result:=True
   Else
      Result:=False;
End;


// Inicio HPC_201502_CNT
function TDMCNT.Valores(Texto: String): Currency;
Var
   xMont, xValor: String;
   I: Integer;
Begin
   For I := 1 To Length(Trim(Texto)) Do
   Begin
      xMont := Copy(Texto, I, 1);
      If xMont <> ',' Then
         xValor := Trim(xValor) + Trim(xMont);
   End;
   Result := StrToFloat(xValor);
End;
// Fin HPC_201502_CNT
// Inicio HPC_201703_CNT
// Seguros-Automatización de Devengue de Seguros
function TDMCNT.UltDiaMes(xAnoMes : String) : String;
var
	xFAnt : String;
  xMes, xAno : String;
begin
  xMes := copy(xAnoMes,5,2);
  xAno := copy(xAnoMes,1,4);
  if  xMes = '12' then
  begin
    xAno:=FloatToStr(strtofloat(xAno)+1);
  	xMes := '01';
  end
  else
  begin
  	xMes:=FloattoStr(StrtoFloat(xMes)+1);
    xAno:=xAno
  end;
	xFAnt:='01/'+xMes+'/'+xAno;
  xFAnt:=DateToStr(StrToDate(xFAnt)-1);
	xFAnt:=copy(xFAnt,1,2)+'/'+copy(xAnoMes,5,2)+'/'+copy(xAnoMes,1,4);
	Result:=xFAnt;
end;
// Fin HPC_201703_CNT
end.
