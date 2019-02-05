unit oaCN3000;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaCN3000
// FORMULARIO               : FConsulta
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Formulario inicial que contiene las funcionalidades
//                            que permiten acceder a las opciones Consulta

// ACTUALIZACIONES:
// HPC_201206_CNT 16/10/2012:  Se implementó el control de versiones
// HPC_201401_CNT 24/02/2014:  Se cambio a versión a 20140225083000
// HPC_201404_CNT 04/04/2014:  Se cambio a versión a 20140407083000
// HPC_201405_CNT 09/04/2014:  Se cambio a versión a 20140410083000
// HPC_201406_CNT 12/04/2014:  Se cambio a versión a 20140415083000
// HPC_201407_CNT 10/07/2014:  Se cambio a versión a 20140718083000
// HPC_201602_CNT 27/12/2016:  Se cambio a versión a 20161228083000


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mant, ExtCtrls, oaVariables, CNT411, CNT412, db, StdCtrls;

type
  TFConsulta = class(TForm)
    lblVersion: TLabel;
  private
    { Private declarations }
    procedure PegaToolSaldos (Sender: TObject);
    procedure PGridShow(Sender: TObject);
    procedure PegaToolHistAju (Sender: TObject);
    procedure DetalleCierra( Sender: TObject);
    procedure SaldosCierra( Sender: TObject);
  public
    { Public declarations }
    Mantc       : TMant;
    GSaldos     : TMant;
    GHistorico  : TMant;
    FSelCuenta1 : TFSelCuenta;
    FSelCuenta2 : TFSelCuenta;
    FSelCuenta3 : TFSelCuenta;
    FSelAux1    : TFSelAux;
    FSelAux2    : TFSelAux;
    procedure ComprobanteEdita(Sender: TObject; MantFields: TFields);
  end;

  procedure CNDiarioGeneral; stdcall;// FCCuadreMovs CNT202 Diario General
  procedure CNAnalisisAuxiliar; stdcall;// FAnalisisAuxiliar CNT410 Análisis de Auxiliar
  procedure CNMayor; stdcall; // FMayor CNT310 Mayor Analítico
  procedure CNAnalisisCentroCosto; stdcall;// FCtroCosto CNT313 Análisis x CentroCosto
  procedure CNBalanceComprobacion; stdcall; // FBalComprob CNT312 Balance de Comprobación
  procedure CNBalanceComprobacionGeneral; stdcall; // FBalGeneral CNT318 Balance de Comprobación Gral
  procedure CNMayorAuxiliar; stdcall; // FMayorAuxiliar CNT314 Análisis por Auxiliar y Centro de Costo
  procedure CNHojaTrabajo; stdcall; // FHojaTrabajo CNT606 Hoja de Trabajo
  procedure CNResumenGeneralCuenta; stdcall; // FResGralCta CNT322 Resumen General por Cuenta
  procedure CNMayorAuxiliarDetallado; stdcall; // FMayAuxDet CNT264 Mayor Auxiliar Detallado
  procedure CNDetalleContabilidadMant; stdcall; // Mant
  procedure CNSaldoCuentasMant; stdcall; // Mant
  procedure CNHistoricoAjusteMant; stdcall; // Mant
  procedure CNInventariosyBalances; stdcall; // FCCuadreMovs2 CNT214 Inventarios y Balances
   //INICIO HPC_201206_CNT
   procedure CNVerificaVersion; stdcall;
   //FIN HPC_201206_CNT

exports
  CNDiarioGeneral,
  CNAnalisisAuxiliar,
  CNMayor,
  CNAnalisisCentroCosto,
  CNBalanceComprobacion,
  CNBalanceComprobacionGeneral,
  CNMayorAuxiliar,
  CNHojaTrabajo,
  CNResumenGeneralCuenta,
  CNMayorAuxiliarDetallado,
  CNDetalleContabilidadMant,
  CNSaldoCuentasMant,
  CNHistoricoAjusteMant,
  //INICIO HPC_201206_CNT
  CNVerificaVersion,
  //FIN HPC_201206_CNT
  CNInventariosyBalances;


var
  FConsulta: TFConsulta;

implementation

uses CNTDM,  CNT323, CNT702, CNT202, CNT214, CNT264, CNT410, CNT313, CNT320,
     CNT413, CNT417, CNT310, CNT312, CNT314, CNT318, CNT606, CNT322;

{$R *.dfm}

// FSelAux           CNT411
// FSelCuenta        CNT412;
// FSelCCosto        CNT413;
// FSelTDiario       CNT417;
// FCCuadreMovs      CNT202     Diario General
// FAnalisisAuxiliar CNT410     Analisis de Auxiliar
// FBalComprob       CNT312     Balance de Comprobacion
// FCtroCosto        CNT313     Analisis x CentroCosto
// FMayorAuxiliar    CNT314     Analisis por Auxiliar y Centro de Costo
// FHojaTrabajo      CNT606     Hoja de Trabajo
// FResGralCta       CNT322     Resumen General por Cuenta
// FBalGeneral       CNT318     Balance de Comprobacion General
// FCCuadreMovs2     CNT214     Inventarios y Balances
// FMayAuxDet        CNT264     Mayor Auxiliar Detallado
// FMayor            CNT310     Mayor Analitico
// FToolHistAjus     CNT702     Tool de Ajuste por Inflacion
// FToolSaldos       CNT323     Saldos de Cuentas
// FAnalisisCuenta   CNT316     Analisis de Cuentas


procedure CNDiarioGeneral; // CNT202
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
//   if Assigned( FCCuadreMovs ) then Exit;
   try
// FCCuadreMovs      CNT202     Diario General
      FCCuadreMovs:=TFCCuadreMovs.Create( Application );
      FCCuadreMovs.ActiveMDIChild;
      FVariables.ConfiguraForma( Screen.ActiveForm );
      FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   finally
   end;
end;


procedure CNAnalisisAuxiliar;
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
//   if Assigned( FAnalisisAuxiliar ) then Exit;
   try
      FConsulta:=TFConsulta.Create( Application );
// FAnalisisAuxiliar CNT410     Analisis de Auxiliar
      FAnalisisAuxiliar:=TFAnalisisAuxiliar.Create( Application );
      FConsulta.FSelCuenta2:= TFSelCuenta.create( Application );
      FConsulta.FSelAux1 := TFSelAux.create( Application );
      FAnalisisAuxiliar.ActiveMDIChild;
      FVariables.ConfiguraForma( Screen.ActiveForm );
      FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   Finally
   End;
end;


procedure CNMayor;
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
//   if Assigned( FMayor ) then Exit;
   try
      FMayor:=TFMayor.Create( Application );
      FSelCuenta := TFSelCuenta.create( Application );
      FSelAux := TFSelAux.create( Application );
// FMayor            CNT310     Mayor Analitico
      FMayor.ActiveMDIChild;
      FVariables.ConfiguraForma( Screen.ActiveForm );
      FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   Finally
   End;
end;


procedure CNAnalisisCentroCosto;
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
//   if Assigned( FCtroCosto ) then Exit;
   try
     FConsulta:=TFConsulta.Create( Application );
     FConsulta.FSelCuenta3:= TFSelCuenta.create( Application );
     FSelCCosto := TFSelCCosto.create( Application );
     FCtroCosto:=TFCtroCosto.Create( Application ); // FCtroCosto CNT313 Analisis x CentroCosto
     FCtroCosto.ActiveMDIChild;
     FVariables.ConfiguraForma( Screen.ActiveForm );
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   Finally
   End;
end;


procedure CNBalanceComprobacion;
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
//   if Assigned( FBalComprob ) then Exit;
   try
     FSelCuenta:= TFSelCuenta.create( Application );
     FBalComprob:=TFBalComprob.Create( Application ); // FBalComprob CNT312 Balance de Comprobacion
     FBalComprob.ActiveMDIChild;
     FVariables.ConfiguraForma( Screen.ActiveForm );
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   finally
   end;
end;


procedure CNBalanceComprobacionGeneral;
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
//   if Assigned( FBalGeneral ) then Exit;
   try
     FBalGeneral:=TFBalGeneral.Create( Application ); // FBalGeneral CNT318 Balance de Comprobacion General
     FBalGeneral.ActiveMDIChild;
     FVariables.ConfiguraForma( Screen.ActiveForm );
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   finally
   end;
end;


procedure CNMayorAuxiliar;
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
//   if Assigned( FMayorAuxiliar ) then Exit;
   try
      FConsultaComprobante := TFConsultaComprobante.Create( Application );
      FMayorAuxiliar := TFMayorAuxiliar.Create( Application ); // FMayorAuxiliar CNT314 Análisis por Auxiliar y Centro de Costo
      FMayorAuxiliar.ActiveMDIChild;
      FVariables.ConfiguraForma( Screen.ActiveForm );
      FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   Finally
   End;
end;

procedure CNHojaTrabajo;
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
//   if Assigned( FHojaTrabajo ) then Exit;
   try
      FHojaTrabajo := TFHojaTrabajo.Create( Application ); // FHojaTrabajo CNT606 Hoja de Trabajo
      FHojaTrabajo.ActiveMDIChild;
      FVariables.ConfiguraForma( Screen.ActiveForm );
      FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   Finally
   End;
end;


procedure CNResumenGeneralCuenta;
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
//   if Assigned( FResGralCta ) then Exit;
   try
      DMCNT.Filtracds ( DMCNT.cdsNivel,'' );
      DMCNT.cdsNivel.IndexFieldNames:='NIVEL';
      FSelCuenta := TFSelCuenta.create( Application );
      FResGralCta:= TFResGralCta.Create( Application ); // FResGralCta CNT322 Resumen General por Cuenta
      FResGralCta.ActiveMDIChild;
      FVariables.ConfiguraForma( Screen.ActiveForm );
      FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   Finally
   End;
end;



procedure CNDetalleContabilidadMant;
var
  sCiaCuenta : String;
begin
   if DMCNT=nil then exit;
  if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
  try

    FConsulta:=TFConsulta.Create( Application );

    sCiaCuenta:=DMCNT.FiltraCuentaPorUsuario_Cia( 'TGE202', 'CUENTAID' );

    if not (FConsulta.Mantc=nil) then Exit;
    FConsulta.Mantc := TMant.Create( Application);
    FConsulta.Mantc.Admin         := DMCNT.wAdmin;
    FConsulta.Mantc.User          := DMCNT.wUsuario;
    FConsulta.Mantc.OnCreateMant  := nil ;
    FConsulta.Mantc.TableName     := 'CNT301';
    FConsulta.Mantc.ClientDataSet := DMCNT.cdsMayorAuxA;

    FConsulta.Mantc.Filter        := DMCNT.cFilterCiaUser;
    if sCiaCuenta<>'' then
       FConsulta.Mantc.Filter     := DMCNT.cFilterCiaUser+' AND '+sCiaCuenta;

    FConsulta.Mantc.DComC         := DMCNT.DCOM1;
    FConsulta.Mantc.Module        := DMCNT.wModulo;
    FConsulta.Mantc.Titulo 	      := 'Detalle de Contabilidad';
    FConsulta.Mantc.OnInsert      := nil;
    FConsulta.Mantc.OnEdit 	      := FConsulta.ComprobanteEdita;
    FConsulta.Mantc.OnCierra      := FConsulta.DetalleCierra;
    FConsulta.Mantc.OnDelete      := Nil;
    FConsulta.Mantc.OnShow 	      := nil;
    FConsulta.Mantc.SectionName	:='CNTDETALLECONTAD';
    FConsulta.Mantc.FileNameIni     := '\oaCNT.INI';
    FConsulta.Mantc.Execute;
    FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
  finally
  end;
end;


procedure TFConsulta.ComprobanteEdita(Sender: TObject; MantFields: TFields);
var
  xSQL:string;
  xxCia, xxTDiario, xxAnoMM, xxNoReg : String;
begin
  if FConsulta.Mantc.FMant.cds2.RecordCount=0 then
  begin
    Showmessage('No Hay un comprobante Seleccionado') ;
    Exit ;
  end ;
////////////////////// jcc
  DMCNT.wModo := 'C' ;
  //LimpiaClients
  with DMCNT.cdsCabCNT do
  begin
  	Filter   := '' ;
    Filtered := False ;
    IndexFieldNames := '' ;
  end ;
  with DMCNT.cdsMovCNT1 do
  begin
  	Filter   := '' ;
    Filtered := False ;
    IndexFieldNames := '' ;
  end ;
  Screen.Cursor:=crHourGlass;
  xxCia    := MantFields.FieldByName( 'CIAID'   ).AsString;
  xxTDiario:= MantFields.FieldByName( 'TDIARID' ).AsString;
  xxAnoMM  := MantFields.FieldByName( 'CNTANOMM' ).AsString;
  xxNoReg  := MantFields.FieldByName( 'CNTCOMPROB' ).AsString;

	// Cabecera del Comprobante
  DMCNT.Filtracds( DMCNT.cdsCabCNT,'Select * from CNT300 Where '
                + 'CIAID='    +''''+ xxCia     +''''+' and '
                + 'TDIARID='  +''''+ xxTDiario +''''+' and '
                + 'CNTANOMM=' +''''+ xxAnoMM   +''''+' and '
                + 'CNTCOMPROB='  +''''+ xxNoReg   +'''' );
  Screen.Cursor:=crDefault;
  //WMC
  if DMCNT.cdsCabCNT.RecordCount <> 1 then
  begin
  	Showmessage(' Error en La Recuperación de La cabecera del comprobante  ') ;
    Exit ;
  end ;
   //
	// Detalle del Comprobante
  Screen.Cursor:=crHourGlass;
  xSQL:=         'SELECT CIAID,CUENTAID,CNTMTOORI,CNTFVCMTO,CNTFEMIS,CNTGLOSA,CNTDH, '
               + 'AUXID,CLAUXID,DOCID,CNTSERIE,CNTNODOC,CCOSID,CNTDEBEMN,CNTDEBEME, '
               + 'CNTHABEMN,CNTHABEME,TDIARID,CNTCUADRE,CNTESTADO,CNTCOMPROB,CNTMTOLOC, '
               + 'CNTMTOEXT,CTADES,AUXDES,DOCDES,CCOSDES,TDIARDES,CNTANO,CNTANOMM, '
               + 'CNTLOTE,TMONID,CNTTCAMBIO,CNTTS,CNTMODDOC,CNTFCOMP,CNTUSER,CNTFREG, '
               + 'CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,CNTREG '
               + 'FROM CNT301 WHERE ';

  DMCNT.Filtracds( DMCNT.cdsMovCNT1,xSQL
               + 'CIAID='    +''''+ xxCia     +''''+' and '
               + 'TDIARID='  +''''+ xxTDiario +''''+' and '
               + 'CNTANOMM=' +''''+ xxAnoMM   +''''+' and '
               + 'CNTCOMPROB='  +''''+ xxNoReg   +''''
               + ' ORDER BY CNTREG');
  //WMC
  if DMCNT.cdsMovCNT1.RecordCount = 0 then
  begin
  	Showmessage(' Error en La Recuperación de Los Detalles del Comprobante  ') ;
    Exit ;
  end ;

  Screen.Cursor:=crDefault;
  FConsultaComprobante := TFConsultaComprobante.Create(Self);
  FConsultaComprobante.ShowModal;
end;


procedure CNMayorAuxiliarDetallado;
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
//   if Assigned( FMayAuxDet ) then Exit;
   try
      FConsulta:=TFConsulta.create( Application );
      FConsulta.FSelCuenta1:= TFSelCuenta.create( Application );
      FMayAuxDet := TFMayAuxDet.Create( Application ); // FMayAuxDet CNT264 Mayor Auxiliar Detallado
      FMayAuxDet.ActiveMDIChild;
      FVariables.ConfiguraForma( Screen.ActiveForm );
      FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
   Finally
   End;
end;


procedure CNSaldoCuentasMant;
var
   reporte:string;
begin
   if DMCNT=nil then exit;
  if not DMCNT.DCOM1.Connected then Exit;
  if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
  begin
     ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
     Exit;
  end;
  try
    Screen.Cursor:=CrHourGlass;

// Inicio HPC_201115_CNT
    Reporte:='select CNT401.CIAID, CNT401.CUENTAID, CNT401.ANO , '
            +' ''ENERO'' Mes,''01'' NUMERO, nvl(CNT401.SALDMN00,0.00) SaldAnt, '
            +' nvl(CNT401.DEBEMN01,0.00) Debe, '
            +' nvl(CNT401.HABEMN01,0.00) Habe, '
            +' nvl(CNT401.SALDMN01,0.00) SaldFin, '
            +' TGE101.CIADES,CNT401.CTADES '
            +' from CNT401, TGE101 '
            +'where CNT401.ciaid=''dd'' and TGE101.CIAID=CNT401.CIAID';
// Fin HPC_201115_CNT

//    if not Assigned( FConsulta ) then
       FConsulta:=TFConsulta.Create( Application );
//    if not Assigned( FToolSaldos ) then
       FToolSaldos:=TFToolSaldos.Create( Application );
    if not (FConsulta.GSaldos=nil) then Exit;
    FConsulta.GSaldos                := TMant.Create( Application );
    FConsulta.GSaldos.Admin          := DMCNT.wAdmin           ;
    FConsulta.GSaldos.OnInsert       := nil    ;
    FConsulta.GSaldos.OnEdit         := nil     ;
    FConsulta.GSaldos.OnDelete       := nil    ;
    FConsulta.GSaldos.OnCierra       := FConsulta.SaldosCierra;
    FConsulta.GSaldos.OnCreateMant   := FConsulta.PegaToolSaldos;
    FConsulta.GSaldos.OnShow         := FConsulta.PGridShow                ;
    FConsulta.GSaldos.ClientDataSet  := DMCNT.cdsSaldos            ;
    FConsulta.GSaldos.TableName      := 'VWCNTESTADISCTA';
    FConsulta.GSaldos.Filter         := ''          ;
    FConsulta.GSaldos.Titulo         := 'Saldo de Cuentas' ;
    FConsulta.GSaldos.User           := DMCNT.wUsuario             ;
    FConsulta.GSaldos.Module         := DMCNT.wModulo;
    FConsulta.GSaldos.SectionName    := 'CNTEstadísticas'        ;
    FConsulta.GSaldos.FileNameIni    := '\SOLCNT.INI'            ;
    FConsulta.GSaldos.DComC          := DMCNT.DCOM1                ;
    FConsulta.GSaldos.UsuarioSQL.Add(Reporte);
    Screen.Cursor:=CrDefault;
    FConsulta.GSaldos.Execute;
    FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
  finally
    //DMCNT.cdsSaldos.close;
  end ;
end;


procedure CNInventariosyBalances; // CNT214
begin
   if DMCNT=nil then exit;
  if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
//   if Assigned( FCCuadreMovs2 ) then Exit;
  try
     FSelTDiario  :=TFSelTDiario.Create( Application );
     FCCuadreMovs2:=TFCCuadreMovs2.Create( Application ); // FCCuadreMovs2 CNT214 Inventarios y Balances
     FCCuadreMovs2.ActiveMDIChild;
     FVariables.ConfiguraForma( Screen.ActiveForm );
     FVariables.w_Num_Formas :=FVariables.w_Num_Formas+1;
  finally
  end;
end;


procedure TFConsulta.PGridShow( Sender: TObject );
var
   i     : Integer;
   MGrid : TMant;
begin
   {
   MGrid := TMant( Sender );
   for i:=0 to MGrid.FMant.ComponentCount-1 do begin
       if MGrid.FMant.Components[i].ClassName = 'TPanel' then
          TPanel(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
       // para botones
       if MGrid.FMant.Components[i].ClassName = 'TButton' then
          TButton(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
       // para bitbuttons
       if MGrid.FMant.Components[i].ClassName = 'TBitBtn' then
          TBitBtn(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
       // para speedbuttons
       if MGrid.FMant.Components[i].ClassName = 'TSpeedButton' then
          TSpeedButton(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
       // Boton de Grid
       if MGrid.FMant.Components[i].ClassName = 'TwwIButton' then
          TwwIButton(MGrid.FMant.components[i]).OnMouseMove := MueveMouse;
       // para la forma
       MGrid.FMant.onMouseMove := MueveMouse;
   end;
   }
///   DMCNT.AccesosUsuariosR(DMCNT.wModulo, DMCNT.wUsuario,'2', MGrid.FMant );
end;

procedure TFConsulta.PegaToolSaldos(Sender: TObject);
var
   cb, cl : TPanel ;
begin
   cb := FToolSaldos.PnlSaldos ;
   cl:= TMant(Sender).FMant.pnlBtns ;
   cl.Height := cb.Height+2;
   cb.Parent   := TMant(Sender).FMant.pnlBtns ;
   cl.AutoSize := True ;
   cb.Align    := alClient ;
   TMant(Sender).FMant.pnlBtns.Visible  := True;
end;


procedure CNHistoricoAjusteMant;
var
   xSQL : String;
begin
   if DMCNT=nil then exit;
  if not DMCNT.DCOM1.Connected then Exit;
  try
    Screen.Cursor:=CrHourGlass;
    DMCNT.Filtracds(DMCNT.CDSCUENTA5,'SELECT * FROM TGE181 ');

    xSQL:='SELECT B.CIAID CIAID, A.CIADES CIADES, ''SALDO INICIAL'' MES, '
        +  'B.CTA_ORIGEN CUENTAORI, C.CTADES CTADES, '' '' PERIODO, '
        +  '0.00 VALOR_HISTORICO, B.FACTOR AS FACTOR, 0.00 AS  VALOR_AJUSTADO, '
        +  '0.00 DIFERENCIA, '' '' DESMES, 0.00 NUEVOMONTO, B.CNTDINC CNTDINC, '
        +  '0.00 VALHIST, ''  '' CNTANO, ''   '' CIADESPRINC, 0.00 CNTDEBEMN, '
        +  '0.00 CNTHABEMN, '' '' CUENTAAJUSTE, '' '' CTA_TIPOREI, '' '' CTA_SUMGA, '
        +  '''   '' TDIARID, '' '' TDIARDES, 0.000 CNTTCAMBIO, 0.00 CNTDEBEME, '
        +  '0.00 CNTHABEME, '' '' CNTFEMIS, '' '' CNTGLOSA, '' '' CNTFREG, '' '' CNTCOMPROB '
        +'FROM CNT303 B, TGE101 A, TGE202 C ,TGE181 G '
        +'WHERE B.CIAID=A.CIAID AND B.CIAID=C.CIAID  AND B.CUENTAID=C.CUENTAID '
        +  'AND B.CTA_ORIGEN<>''FF'' AND C.CIAID=''DD'' AND B.CNTANOMM=''DD'' AND G.MESIDR=''GG''';

      FConsulta:= TFConsulta.Create( Application );
      FtoolHistAjus:=TFtoolHistAjus.Create( Application );

      FConsulta.GHistorico                := TMant.Create( Application );
      FConsulta.GHistorico.Admin          := DMCNT.wAdmin           ;
      FConsulta.GHistorico.OnInsert       := nil    ;
      FConsulta.GHistorico.OnEdit         := nil     ;
      FConsulta.GHistorico.OnDelete       := nil    ;

      FConsulta.GHistorico.OnCreateMant   := FConsulta.PegaToolHistAju;
      FConsulta.GHistorico.OnShow         := FConsulta.PGridShow            ;
      FConsulta.GHistorico.ClientDataSet  := DMCNT.cdsqry3        ;
      FConsulta.GHistorico.TableName      := 'VWCNTHISTAJUSTE'              ;
      FConsulta.GHistorico.Titulo         := 'Archivo de Ajuste por Inflación' ;
      FConsulta.GHistorico.User           := DMCNT.wUsuario             ;
      FConsulta.GHistorico.Module         := 'CNT'                     ;
      FConsulta.GHistorico.SectionName    := 'CNTHistoricoAju'         ;
      FConsulta.GHistorico.FileNameIni    := '\SOLCNT.INI'             ;
      FConsulta.GHistorico.DComC          := DMCNT.DCOM1                ;
      FConsulta.GHistorico.UsuarioSQL.Add( xSQL );
      Screen.Cursor:=CrDefault;
      FConsulta.GHistorico.Execute;
   finally
      //DMCNT.cdsQry3.close;
      //DMCNT.cdscuenta5.close;
   end;
end;   


procedure TFConsulta.PegaToolHistAju(Sender: TObject);
var
   cb, cl : TPanel ;
begin
   cb := FToolHistAjus.PnlSaldos ;
   cl:= TMant(Sender).FMant.pnlBtns ;
   cl.Height := cb.Height+2;
   cb.Parent   := TMant(Sender).FMant.pnlBtns ;
   cb.Align    := alClient ;
   cl.AutoSize := True ;
   TMant(Sender).FMant.pnlBtns.Visible  := True;
end;

procedure TFConsulta.DetalleCierra( Sender: TObject);
begin
   Mantc:=nil;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;

procedure TFConsulta.SaldosCierra( Sender: TObject);
begin
   GSaldos:=nil;
   //FToolSaldos.Free;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
end;
//INICIO HPC_201206_CNT
Procedure CNVerificaVersion;
Begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   FConsulta := TFConsulta.Create( Application );
   If DMCNT.fg_VerificaVersion(FConsulta.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.'+#13+'Comuníquese con Soporte Técnico');
			Application.Terminate;
      Exit;
   End;
End;
//FIN HPC_201206_CNT
end.

