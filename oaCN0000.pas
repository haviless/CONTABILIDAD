unit oaCN0000;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaCN0000
// FORMULARIO               : FCNIni
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Formulario inicial que contiene las funcionalidades
//                            que permiten acceder a las opciones de parámetros generales

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
  Dialogs, mant, oaVariables, wwclient, CNTDM, StdCtrls;


type
  TFCNIni = class(TForm)
    lblVersion: TLabel;
  private
    { Private declarations }
  public
    MantHelp : TMant;
    { Public declarations }
  end;

  procedure CNDataModulo; stdcall;
  procedure CNMantenimientoAccesos; stdcall;
  procedure CNOpcionAccesos; stdcall;
  procedure CNOpcionAccesosShow; stdcall;
  procedure CNMantenimientoAyudaMant; stdcall;
   //INICIO HPC_201206_CNT
   procedure CNVerificaVersion; stdcall;
   //FIN HPC_201206_CNT
exports
  CNDataModulo,

  CNMantenimientoAccesos,

  CNOpcionAccesos,

  CNOpcionAccesosShow,

  //INICIO HPC_201206_CNT

  CNVerificaVersion,
  //FIN HPC_201206_CNT

  CNMantenimientoAyudaMant;


var
  FCNIni: TFCNIni;

implementation

{$R *.dfm}


procedure CNDataModulo;
begin
   Application.Initialize;
   try
      if ( DMCNT=nil ) or ( DMCNT.sClose='1' ) then
      begin
         FVariables:=TFVariables.Create(Application);
         DMCNT:=TDMCNT.Create( Application );
         if DMCNT.sClose='1' then
         begin
            DMCNT.Free;
            DMCNT := nil;
         end;
      end;
   finally
   end;
end;


procedure CNMantenimientoAccesos;
begin
{
  try
     if ( DMCNT.wAdmin='G' ) or ( DMCNT.wAdmin='P' ) then
     begin
        if FMantAcceso=Nil then
        begin
           FMantAcceso:=TFMantAcceso.Create( nil );
           FMantAcceso.wDCOM1       :=DMCNT.DCOM1;
           FMantAcceso.wcdsAcceso   :=DMCNT.cdsAcceso;
           FMantAcceso.wcdsGrupos   :=DMCNT.cdsGrupos;
           FMantAcceso.wcdsMGrupo   :=DMCNT.cdsMGrupo;
           FMantAcceso.wcdsUsuarios :=DMCNT.cdsUsuarios;
           FMantAcceso.wcdsResultSet:=DMCNT.cdsResultSet;
           FMantAcceso.wcdsUser     :=DMCNT.cdsUser;
           FMantAcceso.sModulo      :=DMCNT.wModulo;
           FMantAcceso.sSRV_D       :=SRV_D;
        end
        else begin
           Exit;
        end;

        With FMantAcceso Do
        Try
           ShowModal;
        Finally
           DMCNT.wGrupoTmp:=FMantAcceso.sGrupoTmp;
           Free;
           FMantAcceso:=Nil;
        End;
     end
     else
     begin
        ShowMessage( 'Password NO es Administrador' );
     end;
  except
  end;
  }
end;

procedure CNOpcionAccesos;
begin
{
   IF FMantOpcion <> nil then Exit;

   FMantOpcion:=TFMantOpcion.Create( nil );
   FMantOpcion.wcdsAcceso   :=DMCNT.cdsAcceso;
   FMantOpcion.wcdsGrupos   :=DMCNT.cdsGrupos;
   FMantOpcion.wcdsMGrupo   :=DMCNT.cdsMGrupo;
   FMantOpcion.wcdsUsuarios :=DMCNT.cdsUsuarios;
   FMantOpcion.wcdsResultSet:=DMCNT.cdsResultSet;
   FMantOpcion.wDCOM1       :=DMCNT.DCOM1;
   FMantOpcion.sGrupoTmp    :=DMCNT.wGrupoTmp;
   FMantOpcion.sObjetoNombr:=FVariables.w_Var_sObjetoNombr;
   FMantOpcion.sObjetoDescr:=FVariables.w_Var_sObjetoDescr;
   FMantOpcion.sObjetoForma:=FVariables.w_Var_sObjetoForma;
   FMantOpcion.sModulo      :=DMCNT.wModulo;}
end;


procedure CNOpcionAccesosShow;
begin
{   Try
      If Length(DMCNT.wGrupoTmp)>0 then begin
         FMantOpcion.ShowModal;
      end;
   Finally
      FMantOpcion.Free;
   End;

   FMantOpcion:=nil;}
end;


procedure CNMantenimientoAyudaMant;
begin
{
   FVariables.cdsTempVar :=TwwClientDataSet( DMCNT.FindComponent( FVariables.dblcTempVar.LookupTable.Name ) );
   FCNIni:=TFCNIni.Create( NIL );
   FCNIni.MantHelp:=TMant.Create( Application );
   FCNIni.MantHelp.ClientDataSet:= FVariables.cdsTempVar;
   FCNIni.MantHelp.Module       := DMCNT.wModulo;
   FCNIni.MantHelp.Tipo         := 'HELP';
   FCNIni.MantHelp.Admin        := 'N';
   FCNIni.MantHelp.DComC        := DMCNT.DCOM1;
   FCNIni.MantHelp.User         := DMCNT.wUsuario;
   FCNIni.MantHelp.Execute;}
end;
//INICIO HPC_201206_CNT
Procedure CNVerificaVersion;
Begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   FCNIni := TFCNIni.Create( Application );
   If DMCNT.fg_VerificaVersion(FCNIni.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.'+#13+'Comuníquese con Soporte Técnico');
			Application.Terminate;
      Exit;
   End;
End;
//FIN HPC_201206_CNT
end.
