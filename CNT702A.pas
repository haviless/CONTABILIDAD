// Inicio Uso Estándares: 01/08/2011
// Unidad               : CNT702A
// Formulario           : TfBusquedaDev
// Fecha de Creación    : 23/06/2017
// Autor                : Jesús Castillo Pampas
// Objetivo             : Creación de formulario buscar las provisiones a devengar
// Actualizaciones      :
//HPC_201703_CNT        : Creación del Formulario

//Inicio HPC_201703_CNT
//Creación de formulario buscar las provisiones a devengar
// HPC_201801_CNT   03/01/2018     Muestre los registros Contabilizados y no los Eliminados

Unit CNT702A;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls,
   fcButton, fcImgBtn, fcShapeBtn, fcLabel, ppBands, jpeg, ppCtrls,
   ppStrtch, ppMemo, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, wwclient,
   ppReport, Db, Mask, wwdbedit, wwdblook, Wwdbspin;

Type
   TfBusquedaDev = Class(TForm)
      BitSalir: TBitBtn;
      BitChat: TBitBtn;
      dbgBusqSeguro: TwwDBGrid;
      Label1: TLabel;
      dblcCia: TwwDBLookupCombo;
      bbtnBuscar: TBitBtn;
      edtBuscar: TwwDBSpinEdit;
      Label2: TLabel;
// Inicio HPC_201801_CNT
// Muestre los registros Contabilizados y no los Eliminados
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
// Fin HPC_201801_CNT
      Procedure dtgNuevoSeguroClick(Sender: TObject);

      Procedure btnCancelaClick(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure FormCreate(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnBuscarClick(Sender: TObject);
      Procedure dbgBusqSeguroDblClick(Sender: TObject);
// Inicio HPC_201801_CNT
// Muestre los registros Contabilizados y no los Eliminados
      Procedure dbgBusqSeguroCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);								   
// Fin HPC_201801_CNT
   Private
    { Private declarations }
      Procedure AsignaLookup;
   Public
    { Public declarations }
   End;

Var
   fBusquedaDev: TfBusquedaDev;

Implementation

Uses DateUtils, CNT700B, CNTDM, CNT702B;

{$R *.dfm}

Procedure TfBusquedaDev.dtgNuevoSeguroClick(Sender: TObject);
Begin
   Try
      fNueSeguroPrincipal := TfNueSeguroPrincipal.create(self);
      fNueSeguroPrincipal.xsegid := '';
      fNueSeguroPrincipal.Showmodal;

   Finally
      fNueSeguroPrincipal.free;
   End;
End;

Procedure TfBusquedaDev.btnCancelaClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfBusquedaDev.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;

   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TfBusquedaDev.FormCreate(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   dblcCia.LookupTable := DMCNT.cdsCia;
   EdtBuscar.Text := IntToStr(YearOf(Now));
   AsignaLookup;
   Screen.Cursor := crDefault;
   dblcCia.Text := '02';

End;

Procedure TfBusquedaDev.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TfBusquedaDev.AsignaLookup;
Var
   xSQL: String;
Begin
   dbgBusqSeguro.Selected.Clear;
// Inicio HPC_201801_CNT
// Muestre los registros Contabilizados y no los Eliminados
   xSQL := 'SELECT s.ctagasid,S.SEGID,C.CIAID,C.CPANOMES,C.TDIARID,C.CPNOREG,C.CLAUXID,C.PROV,C.CTATOTAL,C.PROVDES,C.CPFEMIS,C.CPFVCMTO,'
      + ' (SELECT PROVDES FROM DB2ADMIN.TGE201 WHERE PROVRUC = C.PROVRUC) RAZONSOCIAL,C.DOCID,C.NROPOL,C.CPTOID,'
      + ' C.CPSERIE,C.CPNODOC,C.TMONID,C.CPMTOORI,C.CPMTOLOC,C.CPMTOEXT,C.CPSALORI,C.CPESTADO,C.CPTCAMPR,C.FECINIVIG,C.FECFINVIG,'
      + ' M.CIAID,M.DCPANOMM,M.CLAUXID,M.PROV,M.DOCID,M.CPSERIE,M.CPNODOC,M.TMONID,M.MONTOT,M.DEVENGADO, '
      + ' CASE WHEN M.DEVENGADO IS NULL THEN ''SIN_DEVENGAR'' '
      + ' WHEN M.DEVENGADO < M.MONTOT THEN ''FALTA_DEVENGAR'' ELSE ''TOTAL_DEVENGADO'' END ESTADO_DEV '
      + ' FROM DB2ADMIN.CXP301 C, DB2ADMIN.CNT_DEV_SEG_CAB S, '
      + ' (SELECT CIAID,DCPANOMM, CLAUXID,PROV,DOCID,CPSERIE,CPNODOC,TMONID, SUM(MONTOT) MONTOT, SUM(DEVENGADO) DEVENGADO '
      + ' FROM ( '
      + ' SELECT CIAID,DCPANOMM,CLAUXID,PROV,DOCID,CPSERIE,CPNODOC,TMONID,CUENTAIDDET,MONTOT, CASE TMONID WHEN ''N'' THEN SUM(CPMTOPROMESLOC) WHEN ''D'' THEN SUM(CPMTOPROMESEXT)END DEVENGADO '
      + ' From CNT_DEV_SEG_MOV '
      + ' Group by CIAID,DCPANOMM,CLAUXID,PROV,DOCID,CPSERIE,CPNODOC,TMONID,CUENTAIDDET,MONTOT) '
      + ' GROUP BY CIAID,DCPANOMM, CLAUXID,PROV,DOCID,CPSERIE,CPNODOC,TMONID ) M '
      + ' WHERE C.CPTOID = S.CPTOID AND C.CIAID = S.CIAID AND C.CPESTADO NOT IN (''A'',''E'') '
      + ' AND C.CPANOMES= M.DCPANOMM(+) AND C.CIAID = M.CIAID(+) AND C.CLAUXID = M.CLAUXID(+) AND C.PROV = M.PROV(+) AND C.DOCID = M.DOCID(+) AND C.CPSERIE = M.CPSERIE(+) AND C.CPNODOC = M.CPNODOC(+) ';

      If Length(Trim(edtBuscar.Text)) > 0 Then
      Begin
         xSQL := xSQL + ' AND EXTRACT (YEAR FROM C.CPFCMPRB)=' + quotedstr(edtBuscar.Text);
      End;
      If Length(Trim(dblcCia.Text)) > 0 Then
      Begin
         xSQL := xSQL + ' AND C.CIAID =' + quotedstr(dblcCia.Text);
      End;
      xSQL := xSQL + ' ORDER BY C.CIAID,C.CPANOMES,C.TDIARID,C.CPNOREG';
//      + ' ORDER BY C.CIAID,C.CPANOMES,C.TDIARID,C.CPNOREG';
// Fin HPC_201801_CNT

   Try
      DMCNT.cdsQry6.close;
      DMCNT.cdsQry6.DataRequest(xSql);
      DMCNT.cdsQry6.Open;
   Except
      ShowMessage('Error al Llenar la grilla de datos');
      Screen.Cursor := crDefault;
      exit;
   End;
// Inicio HPC_201801_CNT
// Muestre los registros Contabilizados y no los Eliminados
   dbgBusqSeguro.Selected.Add('CIAID'#9'4'#9'Cía'#9'F');
   dbgBusqSeguro.Selected.Add('CPANOMES'#9'6'#9'Periodo'#9'F');
   dbgBusqSeguro.Selected.Add('TDIARID'#9'4'#9'TD'#9'F');
   dbgBusqSeguro.Selected.Add('CPNOREG'#9'11'#9'N° ~Registro'#9'F');
   dbgBusqSeguro.Selected.Add('CLAUXID'#9'6'#9'CL ~Aux'#9'F');
   dbgBusqSeguro.Selected.Add('PROV'#9'6'#9'Aux'#9'F');
   dbgBusqSeguro.Selected.Add('RAZONSOCIAL'#9'32'#9'Razon ~Social'#9'F');
   dbgBusqSeguro.Selected.Add('DOCID'#9'6'#9'Doc'#9'F');
   dbgBusqSeguro.Selected.Add('CPSERIE'#7'10'#9'Serie'#9'F');
   dbgBusqSeguro.Selected.Add('CPNODOC'#9'8'#9'N° ~Doc'#9'F');
   dbgBusqSeguro.Selected.Add('TMONID'#9'4'#9'TM'#9'F');
   dbgBusqSeguro.Selected.Add('CPMTOORI'#9'9'#9'Importe'#9'F');
   dbgBusqSeguro.Selected.Add('CPSALORI'#9'9'#9'Saldo'#9'F');
   dbgBusqSeguro.Selected.Add('CPESTADO'#9'6'#9'Estado'#9'F');
   dbgBusqSeguro.DataSource := DMCNT.dsQry6;
End;
// Fin HPC_201801_CNT
Procedure TfBusquedaDev.bbtnBuscarClick(Sender: TObject);
Var
   xSQL: String;
Begin
   Screen.Cursor := crHourGlass;
   dbgBusqSeguro.Selected.Clear;
   If Length(Trim(edtBuscar.Text)) = 0 Then
   Begin
      MessageDlg('Debe Ingresar Año de Búsqueda ', mtError, [mbOk], 0);
      Exit;
   End;
// Inicio HPC_201801_CNT
// Muestre los registros Contabilizados y no los Eliminados
   xSQL := 'SELECT s.ctagasid,S.SEGID,C.CIAID,C.CPANOMES,C.TDIARID,C.CPNOREG,C.CLAUXID,C.PROV,C.CTATOTAL,C.PROVDES,C.CPFEMIS,C.CPFVCMTO,'
      + ' (SELECT PROVDES FROM DB2ADMIN.TGE201 WHERE PROVRUC = C.PROVRUC) RAZONSOCIAL,C.DOCID,C.NROPOL,C.CPTOID,'
      + ' C.CPSERIE,C.CPNODOC,C.TMONID,C.CPMTOORI,C.CPMTOLOC,C.CPMTOEXT,C.CPSALORI,C.CPESTADO,C.CPTCAMPR,C.FECINIVIG,C.FECFINVIG,'
      + ' M.CIAID,M.DCPANOMM,M.CLAUXID,M.PROV,M.DOCID,M.CPSERIE,M.CPNODOC,M.TMONID,M.MONTOT,M.DEVENGADO, '
      + ' CASE WHEN M.DEVENGADO IS NULL THEN ''SIN_DEVENGAR'' '
      + ' WHEN M.DEVENGADO < M.MONTOT THEN ''FALTA_DEVENGAR'' ELSE ''TOTAL_DEVENGADO'' END ESTADO_DEV '
      + ' FROM DB2ADMIN.CXP301 C,DB2ADMIN.CNT_DEV_SEG_CAB S,'
      + ' (SELECT CIAID,DCPANOMM, CLAUXID,PROV,DOCID,CPSERIE,CPNODOC,TMONID, SUM(MONTOT) MONTOT, SUM(DEVENGADO) DEVENGADO '
      + ' FROM ( '
      + ' SELECT CIAID,DCPANOMM,CLAUXID,PROV,DOCID,CPSERIE,CPNODOC,TMONID,CUENTAIDDET,MONTOT, CASE TMONID WHEN ''N'' THEN SUM(CPMTOPROMESLOC) WHEN ''D'' THEN SUM(CPMTOPROMESEXT)END DEVENGADO '
      + ' From CNT_DEV_SEG_MOV '
      + ' Group by CIAID,DCPANOMM,CLAUXID,PROV,DOCID,CPSERIE,CPNODOC,TMONID,CUENTAIDDET,MONTOT) '
      + ' GROUP BY CIAID,DCPANOMM, CLAUXID,PROV,DOCID,CPSERIE,CPNODOC,TMONID ) M '
      + ' WHERE C.CPTOID = S.CPTOID AND C.CIAID = S.CIAID AND C.CPESTADO NOT IN (''A'',''E'')'
      + ' AND C.CPANOMES= M.DCPANOMM(+) AND C.CIAID = M.CIAID(+) AND C.CLAUXID = M.CLAUXID(+) AND C.PROV = M.PROV(+) AND C.DOCID = M.DOCID(+) AND C.CPSERIE = M.CPSERIE(+) AND C.CPNODOC = M.CPNODOC(+) ' ;

   If Length(Trim(edtBuscar.Text)) > 0 Then
   Begin
      xSQL := xSQL + ' AND EXTRACT (YEAR FROM C.CPFCMPRB)=' + quotedstr(edtBuscar.Text);
   End;
   If Length(Trim(dblcCia.Text)) > 0 Then
   Begin
      xSQL := xSQL + ' AND C.CIAID =' + quotedstr(dblcCia.Text);
   End;
   xSQL := xSQL + ' ORDER BY C.CIAID,C.CPANOMES,C.TDIARID,C.CPNOREG';
// Fin HPC_201801_CNT   
   Try
      DMCNT.cdsQry6.close;
      DMCNT.cdsQry6.DataRequest(xSql);
      DMCNT.cdsQry6.Open;
   Except
      ShowMessage('Error al Llenar la grilla de datos');
      Screen.Cursor := crDefault;
      exit;
   End;
   dbgBusqSeguro.Selected.Add('CIAID'#9'6'#9'Compañía'#9'F');
   dbgBusqSeguro.Selected.Add('CPANOMES'#9'6'#9'Periodo'#9'F');
   dbgBusqSeguro.Selected.Add('TDIARID'#9'4'#9'TD'#9'F');
   dbgBusqSeguro.Selected.Add('CPNOREG'#9'11'#9'N° ~Registro'#9'F');
   dbgBusqSeguro.Selected.Add('CLAUXID'#9'6'#9'CL ~Aux'#9'F');
   dbgBusqSeguro.Selected.Add('PROV'#9'6'#9'Aux'#9'F');
   dbgBusqSeguro.Selected.Add('RAZONSOCIAL'#9'30'#9'Razon ~Social'#9'F');
   dbgBusqSeguro.Selected.Add('DOCID'#9'6'#9'Doc'#9'F');
   dbgBusqSeguro.Selected.Add('CPSERIE'#7'10'#9'Serie'#9'F');
   dbgBusqSeguro.Selected.Add('CPNODOC'#9'8'#9'N° ~Doc'#9'F');
   dbgBusqSeguro.Selected.Add('TMONID'#9'6'#9'TM'#9'F');
   dbgBusqSeguro.Selected.Add('CPMTOORI'#9'8'#9'Importe'#9'F');
   dbgBusqSeguro.Selected.Add('CPSALORI'#9'8'#9'Saldo'#9'F');
   dbgBusqSeguro.Selected.Add('CPESTADO'#9'6'#9'Estado'#9'F');
   dbgBusqSeguro.DataSource := DMCNT.dsQry6;
   Screen.Cursor := crDefault;
End;

Procedure TfBusquedaDev.dbgBusqSeguroDblClick(Sender: TObject);
Begin													   
// Inicio HPC_201801_CNT
// Muestre los registros Contabilizados y no los Eliminados
   IF DMCNT.cdsQry6.RECORDCOUNT =0 THEN
      EXIT;												   
// Fin HPC_201801_CNT
   Try
      fDevengadoSeg := TfDevengadoSeg.create(self);
      fDevengadoSeg.xsegid := DMCNT.cdsQry6.fieldbyname('SEGID').AsString;
      fDevengadoSeg.xnropoliza := DMCNT.cdsQry6.fieldbyname('NROPOL').AsString;
      fDevengadoSeg.xtipseguro := DMCNT.cdsQry6.fieldbyname('CPTOID').AsString;
      fDevengadoSeg.xcptoid := DMCNT.cdsQry6.fieldbyname('CPTOID').AsString;
      fDevengadoSeg.dbeCIA.Text := DMCNT.cdsQry6.fieldbyname('CIAID').AsString;
      fDevengadoSeg.xciaid := DMCNT.cdsQry6.fieldbyname('CIAID').AsString;
      fDevengadoSeg.dbePeriodo.Text := DMCNT.cdsQry6.fieldbyname('CPANOMES').AsString;
      fDevengadoSeg.xcpanomes := DMCNT.cdsQry6.fieldbyname('CPANOMES').AsString;
      fDevengadoSeg.dbeTDiario.Text := DMCNT.cdsQry6.fieldbyname('TDIARID').AsString;
      fDevengadoSeg.xtipdiario := DMCNT.cdsQry6.fieldbyname('TDIARID').AsString;
      fDevengadoSeg.dbeRegistro.Text := DMCNT.cdsQry6.fieldbyname('CPNOREG').AsString;
      fDevengadoSeg.cpnoreg := DMCNT.cdsQry6.fieldbyname('CPNOREG').AsString;

      fDevengadoSeg.dbeTMoneda.Text := DMCNT.cdsQry6.fieldbyname('TMONID').AsString;
      fDevengadoSeg.dbeMO.Text := DMCNT.cdsQry6.fieldbyname('CPMTOORI').AsString;
      fDevengadoSeg.dbeML.Text := DMCNT.cdsQry6.fieldbyname('CPMTOLOC').AsString;
      fDevengadoSeg.dbeME.Text := DMCNT.cdsQry6.fieldbyname('CPMTOEXT').AsString;

      fDevengadoSeg.dbeTCambio.Text := DMCNT.cdsQry6.fieldbyname('CPTCAMPR').AsString;
      fDevengadoSeg.dbeCAux.Text := DMCNT.cdsQry6.fieldbyname('PROV').AsString;
      fDevengadoSeg.dbeNomProv.Text := DMCNT.cdsQry6.fieldbyname('RAZONSOCIAL').AsString;

      fDevengadoSeg.dbeFecIni.Text := DMCNT.cdsQry6.fieldbyname('FECINIVIG').AsString;
      fDevengadoSeg.dbeFecFin.Text := DMCNT.cdsQry6.fieldbyname('FECFINVIG').AsString;

      fDevengadoSeg.Showmodal;

   Finally
      fDevengadoSeg.free;
   End;
End;
// Inicio HPC_201801_CNT
// Muestre los registros Contabilizados y no los Eliminados
Procedure TfBusquedaDev.dbgBusqSeguroCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
Begin

   If DMCNT.cdsQry6.FieldByName('ESTADO_DEV').AsString = 'FALTA_DEVENGAR' Then
   Begin
      AFont.Color := clBlack;
      ABrush.Color := $006AFFFF; //$00C1FFFF;
   END
   ELSE IF DMCNT.cdsQry6.FieldByName('ESTADO_DEV').AsString = 'TOTAL_DEVENGADO' THEN
   BEGIN
      AFont.Color := clBlack;
      ABrush.Color := clAqua;
   End;

End;
// Fin HPC_201801_CNT

End.
//Fin HPC_201703_CNT

