unit oaCN1000;

// ACTUALIZACIONES:
// HPC_201206_CNT 16/10/2012:  Se implementó el control de versiones
// HPC_201401_CNT 24/02/2014:  Se cambio a versión a 20140225083000
// HPC_201404_CNT 04/04/2014:  Se cambio a versión a 20140407083000
// HPC_201405_CNT 09/04/2014:  Se cambio a versión a 20140410083000
// HPC_201406_CNT 12/04/2014:  Se cambio a versión a 20140415083000
// HPC_201407_CNT 10/07/2014:  Se cambio a versión a 20140718083000
// HPC_201501_CNT 12/02/2015:  Regulariza Métodos Correctos de Control Transaccional
// HPC_201602_CNT 27/12/2016:  Se cambio a versión a 20161228083000

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mant, DB, ExtCtrls, oaVariables, StdCtrls;

type
  TFParametros = class(TForm)
    lblVersion: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AdicCCtoPrin(Sender: TObject);
    procedure EditaCCtoPrin(Sender: TObject; MantFields: TFields);
    procedure AdicCtaPrin(Sender: TObject);
    procedure EditaCtaPrin(Sender: TObject; MantFields: TFields);
    procedure BorraCtaPrin(Sender: TObject; MantFields: TFields);
    procedure PegaToolPlanCta (Sender: TObject);
    procedure PlanInicializa;
  public
    { Public declarations }
    MantcC : TMant;
    Mantc  : TMant;
    wVersion : String;
  end;

  procedure CNReferencias; stdcall;
  procedure CNCentroCostoMant; stdcall;
  procedure CNPlanCuentasMant; stdcall;
   //INICIO HPC_201206_CNT
   procedure CNVerificaVersion; stdcall;
   //FIN HPC_201206_CNT
exports
  CNReferencias,
  CNCentroCostoMant,
  //INICIO HPC_201206_CNT
  CNVerificaVersion,
  //FIN HPC_201206_CNT  
  CNPlanCuentasMant;

var
  FParametros: TFParametros;

implementation

{$R *.dfm}

USES CNTDM, CNT208, CNT262, CNT200;

procedure CNReferencias;
var
   MRefe : TMant;
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   Application.Initialize;

   FParametros:=TFParametros.Create( Application );
   //if not DMCNT.VerificaVersion(FParametros.wVersion) then exit;

   try
      MRefe := TMant.Create( Application );
      MRefe.Module := 'CNT';
      MRefe.Admin  := DMCNT.wAdmin;
      MRefe.DComC  := DMCNT.DCOM1 ;
      MRefe.User   := DMCNT.wUsuario;
      MRefe.Execute;
   except
   end;
end;


procedure CNCentroCostoMant;
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   Application.Initialize;

   try
      FParametros:=TFParametros.Create( Application );

      FParametros.MantcC := TMant.Create( Application );
      FParametros.MantcC.Admin          := DMCNT.wAdmin;
      FParametros.MantcC.User           := DMCNT.wUsuario ;
      FParametros.MantcC.Module         := DMCNT.wModulo;
      FParametros.MantcC.Titulo         := 'Centro de Costo' ;
      FParametros.MantcC.Tablename      := 'TGE203';
      FParametros.MantcC.Filter         := '';
      FParametros.MantcC.ClientDataset  := DMCNT.cdsCCosto;
      FParametros.MantcC.OnInsert       := FParametros.AdicCCtoPrin ;
      FParametros.MantcC.OnEdit         := FParametros.EditaCCtoPrin;
      FParametros.MantcC.OnDelete       := nil;
      FParametros.MantcC.DComC          := DMCNT.DCOM1;
      FParametros.MantcC.SectionName    := 'CNTCentroCosto';
      FParametros.MantcC.FileNameIni    := '\oaCNT.INI';
      FParametros.MantcC.Execute;
   Finally
//     MantcC.Free;
//     DMCNT.cdsQry2.Close;
//     DMCNT.cdsQry2.IndexFieldNames:='';
   end;
end;


procedure TFParametros.AdicCCtoPrin(Sender: TObject);
begin
   Try
     DMCNT.wModo := 'A';
     FCCosto := TFCCosto.Create( application );
     FCCosto.ActiveMDIChild;
   finally
     //FCCosto.free;
   end;
end;


procedure TFParametros.EditaCCtoPrin(Sender: TObject; MantFields: TFields);
var
   xSQL : String;
begin
// vhndema
   Try
     xSQL:='Select * from TGE203 Where CCOSID='''+MantFields.FieldByName('CCOSID').AsString+'''';
     DMCNT.cdsCCosto.Close;
     DMCNT.cdsCCosto.DataRequest( xSQL );
     DMCNT.cdsCCosto.Open;

     DMCNT.wModo := 'M';
     FCCosto := TFCCosto.Create( application );
     FCCosto.ActiveMDIChild;
   finally
     //FCCosto.free;
   end;
// end vhndema
end;


procedure CNPlanCuentasMant;
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   Application.Initialize;

   try
      FParametros:=TFParametros.Create( Application );
      FToolPlanCta:=TFToolPlanCta.Create( Application );
      // Registro de Cuenta Contable Principal
      FParametros.PlanInicializa;
      DMCNT.cdsCuentaLookUp.IndexFieldNames:='CUENTAID';

      FParametros.Mantc:= TMant.Create( Application );
      FParametros.Mantc.Admin          := DMCNT.wAdmin;
      FParametros.Mantc.User           := DMCNT.wUsuario ;
      FParametros.Mantc.Module         := DMCNT.wModulo;
      FParametros.Mantc.Titulo         := 'Plan de Cuentas Principal';
      FParametros.Mantc.Tablename      := 'TGE202'                 ;
      FParametros.Mantc.Filter         := ''             ;
      FParametros.Mantc.ClientDataset  := DMCNT.cdsCuenta        ;
      //Eventos :
      FParametros.Mantc.OnCreateMant   := FParametros.PegaToolPlanCta;
      FParametros.Mantc.OnInsert       := FParametros.AdicCtaPrin                ;
      FParametros.Mantc.OnEdit         := FParametros.EditaCtaPrin               ;
      FParametros.Mantc.OnDelete       := nil; //BorraCtaPrin               ;
      FParametros.Mantc.DComC          := DMCNT.DCOM1                  ;
      FParametros.Mantc.SectionName    := 'CNTPlanCuentas';
      FParametros.Mantc.FileNameIni    := '\oaCNT.INI';
      FParametros.Mantc.Execute                             ;
   finally
      //FToolPlanCta.Free;
      //DMCNT.cdsCuentaLookUp.Filter:='';
      //DMCNT.cdsCuentaLookUp.Filtered:=False;
      //DMCNT.cdsCuentaLookUp.Close;
   end;
end;


procedure TFParametros.AdicCtaPrin(Sender: TObject);
var
   xSQL : String;
begin
  try
     xSQL:='Select * from TGE202 Where CIAID=''ZZ'' AND CUENTAID=''ZZZZ''';
     DMCNT.cdsCuenta.Close;
     DMCNT.cdsCuenta.DataRequest( xSQL );
     DMCNT.cdsCuenta.Open;

     DMCNT.wModo := 'A';
     FPlnCta := TFPlnCta.Create(Self);
     FPlnCta.wInicio := '';
     FPlnCta.ActiveMDIChild;
   finally
   end;
end;


procedure TFParametros.EditaCtaPrin(Sender: TObject; MantFields: TFields);
var
   xSQL : String;
begin
   if ( not Mantc.FMant.Z2bbtnConsulta.Enabled ) and
      ( not Mantc.FMant.Z2bbtnModifica.Enabled ) then Exit;
   if Mantc.FMant.Z2bbtnModifica.Enabled then
      DMCNT.wModo := 'M'
   else begin
      DMCNT.wModo := 'C';
   end;

   xSQL:='Select * from TGE202 '
        +'Where CIAID='''   +MantFields.FieldByName('CIAID').AsString   +''' '
        +  'AND CUENTAID='''+MantFields.FieldByName('CUENTAID').AsString+'''';
   DMCNT.cdsCuenta.Close;
   DMCNT.cdsCuenta.DataRequest( xSQL );
   DMCNT.cdsCuenta.Open;

   FPlnCta := TFPlnCta.Create( Application );

   FPlnCta.dbeCta.visible:=False;    // edit
   FPlnCta.dblcdCuenta.visible:=True;    // lookup

   If DMCNT.cdsCUENTA.RecordCount=0 then Exit;

   DMCNT.cdsCia.IndexFieldNames:='CIAID';
   DMCNT.cdsCia.SetKey;
   DMCNT.cdsCia.FieldbyName('CIAID').AsString:=DMCNT.cdsCUENTA.FieldbyName('CIAID').AsString;
   if not DMCNT.cdsCia.GotoKey then
   begin
      ShowMessage('No Tiene Accesos a Esta Compañía');
      exit;
   end;

   try
      FPlnCta.ActiveMDIChild;
   finally
   end;
end;


procedure TFParametros.BorraCtaPrin(Sender: TObject; MantFields: TFields);
var
   sSQL,sDigAnt,sCuenta:string;
   xLargo : integer;
begin
   if DMCNT.cdsCUENTA.RecordCount=0 then Exit;

   if DMCNT.cdsCuenta.FieldByName('CTA_DET').AsString<>'S' then
   begin
     ShowMessage('No se puede eliminar la cuenta porque tiene subcuentas');
     exit;
   end;

   xLargo := length(DMCNT.cdsCuenta.FieldByName('CTANIV').AsString);
   sSQL:=' NIVEL='+quotedstr(DMCNT.StrZero(InttoStr(DMCNT.cdsCuenta.FieldByName('CTANIV').AsInteger-1),xLargo));
   sDigAnt:=DMCNT.DisplayDescrip('prvTGE','CNT202','DIGITOS',sSQL,'DIGITOS');
   if sDigant='' then
      sDigAnt:='0';

   sCuenta:=copy(DMCNT.cdsCuenta.FieldByName('CUENTAID').AsString,1,StrToInt(sDigAnt));

   sSQL:=' SELECT COUNT(CUENTAID) CANTIDAD FROM CNT301 '+
         ' WHERE CUENTAID='+QuotedStr(DMCNT.cdsCuenta.FieldByName('CUENTAID').AsString)+
         ' AND CIAID='+QuotedStr(DMCNT.cdsCuenta.FieldByName('CIAID').AsString);
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(ssql);
   DMCNT.cdsQry.open;
   if DMCNT.cdsQry.FieldByName('CANTIDAD').AsInteger > 0 then
   begin
     ShowMessage('No se puede eliminar la cuenta porque tiene movimientos');
     exit;
   end;
    if MessageDlg('¿Esta seguro de eliminar la Cuenta N° '+DMCNT.cdsCuenta.FieldByName('CUENTAID').AsString+#13+
                  ' De la Compañía '+DMCNT.cdsCuenta.FieldByName('CIAID').AsString,mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
//obc      DMCNT.DCOM1.AppServer.IniciaTransaccion;
       try
          sSQL:=' SELECT COUNT(CUENTAID) CANTIDAD FROM TGE202 '+
             ' WHERE SUBSTR(CUENTAID,1,'+sDigAnt+')='+QuotedStr(sCuenta)+
             ' AND CIAID='+QuotedStr(DMCNT.cdsCuenta.FieldByName('CIAID').AsString);
          DMCNT.cdsQry.Close;
          DMCNT.cdsQry.DataRequest(ssql);
          DMCNT.cdsQry.open;
          if DMCNT.cdsQry.FieldByName('CANTIDAD').AsInteger <= 2 then
          begin
         //LA CUENTA QUE SE VA A BORRAR ES LA UNICA SUBCUENTA DE LA CLASE ANTERIO
         //ENTONCES SE CAMBIA EL MOV Y DET SEGUN DESTINO
            sSQL:=' UPDATE TGE202 SET CTA_DET=''S'', '+
              ' CTA_MOV = CASE WHEN CTA_DEST=''S'' THEN ''N'' ELSE ''S'' END '+
              ' WHERE CIAID = '+QuotedStr(DMCNT.cdsCuenta.FieldByName('CIAID').AsString)+
              ' AND CUENTAID = '+QuotedStr(sCuenta);
            DMCNT.DCOM1.AppServer.EjecutaSQL(sSQL);
          end;

          sSQL:=' DELETE FROM TGE202 '+
             ' WHERE CIAID = '+quotedstr(DMCNT.cdsCuenta.FieldByName('CIAID').AsString)+
             ' AND CUENTAID = '+quotedstr(DMCNT.cdsCuenta.FieldByName('CUENTAID').AsString);
          DMCNT.DCOM1.AppServer.EjecutaSQL(sSQL);
          DMCNT.DCOM1.AppServer.GrabaTransaccion;
          DMCNT.cdsCuenta.Delete; // es para que actualice el ClientDataSet del Filtro.
       except
       // Inicio HPC_201501_CNT
          //DMCNT.DCOM1.AppServer.RegresaTransaccion;
          DMCNT.DCOM1.AppServer.RetornaTransaccion;
       // Fin HPC_201501_CNT
       end;
    end;
end;

procedure TFParametros.PegaToolPlanCta(Sender: TObject);
var
   cb, pnlToolPlanCta : TPanel ;
begin
   cb := FToolPlanCta.pnlImprime ;
   pnlToolPlanCta := TMant(Sender).FMant.pnlBtns ;
   pnlToolPlanCta.Height := cb.Height+2;
   cb.Align    := alClient ;
   cb.Parent   := TMant(Sender).FMant.pnlBtns ;
   pnlToolPlanCta.AutoSize := True ;
   TMant(Sender).FMant.pnlBtns.Visible  := True;
end;


procedure TFParametros.PlanInicializa;
begin
   DMCNT.Filtracds ( DMCNT.cdsNivel,'' );
   DMCNT.cdsNivel.IndexFieldNames  :='Nivel';
   DMCNT.cdsRCuenta.IndexFieldNames:='CiaId;CuentaId';
   DMCNT.cdsRCCosto.IndexFieldNames:='CiaId;Ano;CuentaId';
   DMCNT.cdsCuenta2.IndexFieldNames:='CiaId;CuentaId';
end;

procedure TFParametros.FormCreate(Sender: TObject);
begin
   wVersion := '20110520083000';
end;
//INICIO HPC_201206_CNT
Procedure CNVerificaVersion;
Begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   FParametros := TFParametros.Create( Application );
   If DMCNT.fg_VerificaVersion(FParametros.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.'+#13+'Comuníquese con Soporte Técnico');
			Application.Terminate;
      Exit;
   End;
End;
//FIN HPC_201206_CNT
end.
