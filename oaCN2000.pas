Unit oaCN2000;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaCN2000
// FORMULARIO               : FRegistro
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Formulario inicial que contiene las funcionalidades
//                            que permiten acceder a las opciones  del menu de Transacciones

// ACTUALIZACIONES:
// HPC_201206_CNT 16/10/2012:  Se implementó el control de versiones
// HPC_201401_CNT 24/02/2014:  Se cambio a versión a 20140225083000
// HPC_201404_CNT 04/04/2014:  Se cambio a versión a 20140407083000
// HPC_201405_CNT 09/04/2014:  Se cambio a versión a 20140410083000
// HPC_201406_CNT 12/04/2014:  Se cambio a versión a 20140415083000
// HPC_201407_CNT 10/07/2014:  Se cambio a versión a 20140718083000
// HPC_201602_CNT 27/12/2016:  Se cambio a versión a 20161228083000

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, db, Mant, ExtCtrls, oaVariables, StdCtrls;

Type
   TFRegistro = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
      Procedure ComprobanteInsert(Sender: TObject);
      Procedure ComprobanteEdita(Sender: TObject; MantFields: TFields);
      Procedure ComprobanteDelete(Sender: TObject; MantFields: TFields);
      Procedure ComprobanteCierra(Sender: TObject);
      Procedure PGridShow(Sender: TObject);
      Procedure PegaToolComprobante(Sender: TObject);

   Public
    { Public declarations }
      GComprobante: TMant;
      xTipocomprobante: String; // variable usada para Provisiones y Otras Obligaciones (P,O)
      xSelDoc: String;
      Procedure ComprobanteInicializa;
   End;

Procedure CNComprobantesMant; stdcall;
Procedure CNAjusteInflacion; stdcall;
Procedure CNApertura; stdcall;
   //INICIO HPC_201206_CNT
Procedure CNVerificaVersion; stdcall;
   //FIN HPC_201206_CNT

Exports
   CNComprobantesMant,
   CNAjusteInflacion,
   CNVerificaVersion,
   CNApertura;

Var
   FRegistro: TFRegistro;

Implementation

{$R *.dfm}

Uses CNTDM, CNT201, CNT210, CNT212, CNT270;

Procedure CNComprobantesMant;
Begin
   If DMCNT = Nil Then exit;
   If Not DMCNT.DCOM1.Connected Then Exit;
   Try

      If Not Assigned(FRegistro) Then
         FRegistro := TFRegistro.Create(Application);
      If Not (FRegistro.GComprobante = Nil) Then Exit;

      Screen.Cursor := CrHourGlass;
      FRegistro := TFRegistro.Create(Application);

      FRegistro.ComprobanteInicializa;
      DMCNT.cdsTDoc.IndexFieldNames := 'DOCID';
      FRegistro.xTipocomprobante := 'P';

      FToolComprobante := TFToolComprobante.Create(Application);

      DMCNT.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FRegistro.GComprobante := TMant.Create(Application);
      FRegistro.GComprobante.Admin := DMCNT.wAdmin;
      FRegistro.GComprobante.OnInsert := FRegistro.ComprobanteInsert;
      FRegistro.GComprobante.OnEdit := FRegistro.ComprobanteEdita;
      FRegistro.GComprobante.OnDelete := FRegistro.ComprobanteDelete;
      FRegistro.GComprobante.OnCreateMant := FRegistro.PegaToolComprobante;
      FRegistro.GComprobante.OnShow := FRegistro.PGridShow;
      FRegistro.GComprobante.ClientDataSet := DMCNT.cdsCabCNT;
      FRegistro.GComprobante.TableName := 'CNT300';
      FRegistro.GComprobante.OnCierra := FRegistro.ComprobanteCierra;

     // VHNDEMA
      FRegistro.GComprobante.Filter := FRegistro.xSelDoc;

      If DMCNT.cFilterCiaUser <> '' Then
      Begin
         If (FRegistro.GComprobante.Filter <> '') And (DMCNT.cFilterCiaUser <> '') Then
            FRegistro.GComprobante.Filter := FRegistro.GComprobante.Filter + ' and ' + DMCNT.cFilterCiaUser
         Else
            FRegistro.GComprobante.Filter := DMCNT.cFilterCiaUser;
      End;

      If (DMCNT.cFilterOrigenUser <> '') Then
      Begin
         If (FRegistro.GComprobante.Filter <> '') And (DMCNT.cFilterOrigenUser <> '') Then
            FRegistro.GComprobante.Filter := FRegistro.GComprobante.Filter + ' and ' + DMCNT.cFilterOrigenUser
         Else
            FRegistro.GComprobante.Filter := DMCNT.cFilterOrigenUser;
      End;

      If (DMCNT.cFilterUsuarioUser <> '') Then
      Begin
         If (FRegistro.GComprobante.Filter <> '') And (DMCNT.cFilterUsuarioUser <> '') Then
            FRegistro.GComprobante.Filter := FRegistro.GComprobante.Filter + ' and ' + DMCNT.cFilterUsuarioUser
         Else
            FRegistro.GComprobante.Filter := DMCNT.cFilterUsuarioUser;
      End;

     // END VHNDEMA

      FRegistro.GComprobante.Titulo := 'Comprobantes Contables';
      FRegistro.GComprobante.User := DMCNT.wUsuario;
      FRegistro.GComprobante.Module := 'CNT';
      FRegistro.GComprobante.SectionName := 'CNTComprobantes';
      FRegistro.GComprobante.FileNameIni := '\oaCNT.INI';
      FRegistro.GComprobante.DComC := DMCNT.DCOM1;
      Screen.Cursor := CrDefault;
      FRegistro.GComprobante.Execute;
   Finally
     {
     DMCNT.cdsCuenta.Filter:='';
     DMCNT.cdsCuenta.Filtered:=False;
    DMCNT.cdsCuenta.Close;
    DMCNT.cdsTDoc.IndexFieldNames:='';
     DMCNT.cdsMovCnt1.IndexFieldNames:='';
     }
   End;
End;

Procedure CNAjusteInflacion;
Begin
   If DMCNT = Nil Then exit;
   If Not DMCNT.DCOM1.Connected Then Exit;
   Try
      FAjusteInflacion1 := TFAjusteInflacion1.Create(Application);
      FAjusteInflacion1.ShowModal;
   Finally
      FAjusteInflacion1.Free;
   End;
End;

Procedure CNApertura;
Begin
   If DMCNT = Nil Then exit;
   If Not DMCNT.DCOM1.Connected Then Exit;
   Try
      FApertura := TFApertura.Create(Application);
      FApertura.ShowModal;
   Finally
      FApertura.Free;
   End;
End;

Procedure TFRegistro.ComprobanteCierra(Sender: TObject);
Begin
   GComprobante := Nil;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;
End;

Procedure TFRegistro.ComprobanteInicializa; //CIM
Begin
   DMCNT.Filtracds(DMCNT.cdsNivel, '');
   DMCNT.cdsNivel.IndexFieldNames := 'NIVEL';
   DMCNT.cdsAuxiliar.IndexFieldNames := 'AUXID';
End;

Procedure TFRegistro.ComprobanteInsert(Sender: TObject);
Begin
   If FVariables.w_CN_Registro Then
   Begin
      ShowMessage('Opcion de Registro se encuentra en USO');
      Exit;
   End;
   DMCNT.wModo := 'A';
   DMCNT.Filtracds(DMCNT.cdsCabCNT, 'Select * from CNT300 Where CIAID=''ZX'' AND TDIARID=''ZZ''');
   DMCNT.Filtracds(DMCNT.cdsMovCNT1, 'Select * from CNT311 Where CIAID=''ZX'' AND TDIARID=''ZZ''');
   FRegComp := TFRegComp.Create(Self);
   FVariables.w_CN_Registro := True;
   FRegComp.ActiveMDIChild;
   //FVariables.ConfiguraForma( Screen.ActiveForm );
End;

Procedure TFRegistro.PGridShow(Sender: TObject);
Var
   i: Integer;
   MGrid: TMant;
Begin
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
End;

Procedure TFRegistro.ComprobanteEdita(Sender: TObject; MantFields: TFields);
Begin
   If (Not GComprobante.FMant.Z2bbtnConsulta.Enabled) And
      (Not GComprobante.FMant.Z2bbtnModifica.Enabled) Then Exit;

   If GComprobante.FMant.Z2bbtnModifica.Enabled Then
      DMCNT.wModo := 'M'
   Else
   Begin
      DMCNT.wModo := 'C';
   End;

   If GComprobante.FMant.cds2.RecordCount = 0 Then Exit;
   {
   xxCia    := MantFields.FieldByName( 'CIAID'   ).AsString;
   xxTDiario:= MantFields.FieldByName( 'TDIARID' ).AsString;
   xxAnoMM  := MantFields.FieldByName( 'CNTANOMM' ).AsString;
   xxNoReg  := MantFields.FieldByName( 'CNTCOMPROB' ).AsString;
   }
   DMCNT.Filtracds(DMCNT.cdsCabCNT,
      'SELECT * FROM CNT300 WHERE '
      + 'CIAID=''' + MantFields.FieldByName('CIAID').AsString + ''' AND '
      + 'TDIARID=''' + MantFields.FieldByName('TDIARID').AsString + ''' AND '
      + 'CNTANOMM=''' + MantFields.FieldByName('CNTANOMM').AsString + ''' AND '
      + 'CNTCOMPROB=''' + MantFields.FieldByName('CNTCOMPROB').AsString + '''');

   If DMCNT.cdsCabCNT.FieldByName('CNTCUADRE').AsString = 'S' Then
   Begin

      DMCNT.Filtracds(DMCNT.cdsMovCNT1,
         'SELECT a.* FROM CNT301 a WHERE '
         + 'CIAID=''' + MantFields.FieldByName('CIAID').AsString + ''' AND '
         + 'TDIARID=''' + MantFields.FieldByName('TDIARID').AsString + ''' AND '
         + 'CNTANOMM=''' + MantFields.FieldByName('CNTANOMM').AsString + ''' AND '
         + 'CNTCOMPROB=''' + MantFields.FieldByName('CNTCOMPROB').AsString + '''');
   End
   Else
   Begin
      DMCNT.Filtracds(DMCNT.cdsMovCNT1,
         'SELECT a.* FROM CNT311 a WHERE '
         + 'CIAID=''' + MantFields.FieldByName('CIAID').AsString + ''' AND '
         + 'TDIARID=''' + MantFields.FieldByName('TDIARID').AsString + ''' AND '
         + 'CNTANOMM=''' + MantFields.FieldByName('CNTANOMM').AsString + ''' AND '
         + 'CNTCOMPROB=''' + MantFields.FieldByName('CNTCOMPROB').AsString + '''');

   End;

   FRegComp := TFRegComp.Create(Application);
   FRegComp.ActiveMDIChild;
   //FVariables.ConfiguraForma( Screen.ActiveForm );
End;

Procedure TFRegistro.ComprobanteDelete(Sender: TObject; MantFields: TFields);
Var
   xSQL, xxCia, xxTDi, xxPer, xxNRe: String;
Begin
   If GComprobante.FMant.cds2.RecordCount = 0 Then Exit;

   If (MantFields.FieldByName('CNTESTADO').AsString <> 'I') Then
   Begin
      ShowMessage('Situación del comprobante no permite eliminación!');
      exit;
   End;

   If Not ((MantFields.FieldByName('MODULO').AsString = 'CNT') Or
      (MantFields.FieldByName('MODULO').AsString = 'INT')) Then
   Begin
      Showmessage('Registro NO se puede Eliminar de esta forma');
      exit;
   End;

   xxCia := MantFields.FieldByName('CIAID').AsString;
   xxTDi := MantFields.FieldByName('TDIARID').AsString;
   xxPer := MantFields.FieldByName('CNTANOMM').AsString;
   xxNRe := MantFields.FieldByName('CNTCOMPROB').AsString;

   If MessageDlg('¿  Eliminar Registro  ? ' + chr(13) + chr(13)
      + 'Compañía =' + '''' + xxCia + '''' + chr(13)
      + 'Tipo Diario=' + '''' + xxTDi + '''' + chr(13)
      + 'Periodo     =' + '''' + xxPer + '''' + chr(13)
      + 'Registro    =' + '''' + xxNRe + '''',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      Try
         DMCNT.cdsCabCNT.Data := GComprobante.FMant.cds2.Data;
         DMCNT.cdsCabCNT.GotoCurrent(GComprobante.FMant.cds2);

         {
         DMCNT.cdsCabCNT.Delete;
         DMCNT.cdsCabCNT.DataRequest( 'Select * from CNT300 '+
                                      'Where CIAID='''     + xxCia +''' and '+
                                            'TDIARID='''   + xxTDi +''' and '+
                                            'CNTANOMM='''  + xxPer +''' and '+
                                            'CNTCOMPROB='''+ xxNRe +'''' );
         }
         xSQL := 'Delete from CNT300 Where '
            + 'CIAID=' + '''' + xxCia + '''' + ' and '
            + 'TDIARID=' + '''' + xxTDi + '''' + ' and '
            + 'CNTANOMM=' + '''' + xxPer + '''' + ' and '
            + 'CNTCOMPROB=' + '''' + xxNRe + '''';
         Try
            DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
         End;

         xSQL := 'Delete from CNT311 Where '
            + 'CIAID=' + '''' + xxCia + '''' + ' and '
            + 'TDIARID=' + '''' + xxTDi + '''' + ' and '
            + 'CNTANOMM=' + '''' + xxPer + '''' + ' and '
            + 'CNTCOMPROB=' + '''' + xxNRe + '''';
         Try
            DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
         End;

         xSQL := 'Delete from CNT301 Where '
            + 'CIAID=' + '''' + xxCia + '''' + ' and '
            + 'TDIARID=' + '''' + xxTDi + '''' + ' and '
            + 'CNTANOMM=' + '''' + xxPer + '''' + ' and '
            + 'CNTCOMPROB=' + '''' + xxNRe + '''';
         Try
            DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
         End;

      Finally
         {
         DMCNT.ControlTran( 0 );
         DMCNT.ActualizaFiltro(GComprobante,DMCNT.cdsCabCNT,'E');
         }
         FRegistro.GComprobante.RefreshFilter;

         Showmessage(' Registro Eliminado ');
      End;
   End
End;

Procedure TFRegistro.PegaToolComprobante(Sender: TObject);
Var
   cb, cl: TPanel;
Begin
   cb := FToolComprobante.PnlComprobante;
   cl := TMant(Sender).FMant.pnlBtns;
   cl.Height := cb.Height + 2;
   cb.Align := alClient;
   cb.Parent := TMant(Sender).FMant.pnlBtns;
   cl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

//INICIO HPC_201206_CNT

Procedure CNVerificaVersion;
Begin
   If DMCNT = Nil Then exit;
   If Not DMCNT.DCOM1.Connected Then Exit;
   FRegistro := TFRegistro.Create(Application);
   If DMCNT.fg_VerificaVersion(FRegistro.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;
//FIN HPC_201206_CNT

End.

