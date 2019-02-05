// Inicio Uso Estándares: 01/08/2011
// Unidad               : CNT702B
// Formulario           : TfDevengadoSeg
// Fecha de Creación    : 23/06/2017
// Autor                : Jesús Castillo Pampas
// Objetivo             : Creación de formulario para devengar seguros
// Actualizaciones      :
//HPC_201703_CNT        : Creación del Formulario
//Creación de formulario para devengar seguros
// HPC_201801_CNT   03/01/2018     Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
//                                 sea de manera Automática
Unit CNT702B;

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, fcButton, fcImgBtn,
   fcShapeBtn, ExtCtrls, wwdbdatetimepicker, Db, ppBands, ppVar, ppPrnabl,
   ppClass, ppCtrls, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
   ppDBPipe, Buttons, Wwdbdlg, Mask, wwdbedit, wwdblook, Wwdotdot, Wwdbcomb, jpeg,
   Wwdbspin, DateUtils, Excel2000, ComObj, ppEndUsr, ppParameter, ppModule,
   daDataModule;

Type
   TfDevengadoSeg = Class(TForm)
      btnCancela: TfcShapeBtn;
      gbPreCab: TGroupBox;
      gbPreDet: TGroupBox;
      GroupBox3: TGroupBox;
      dbgDevengadoSeg1: TwwDBGrid;
      Label9: TLabel;
      Label2: TLabel;
      Label4: TLabel;
      dbePeriodo: TEdit;
      Label5: TLabel;
      dbeRegistro: TwwDBEdit;
      Label6: TLabel;
      dbeTCambio: TwwDBEdit;
      Label7: TLabel;
      Label8: TLabel;
      dbeMO: TEdit;
      dbeML: TEdit;
      Label10: TLabel;
      Label12: TLabel;
      Label13: TLabel;
      dbeME: TEdit;
      Label15: TLabel;
      dbeCAux: TEdit;
      Label17: TLabel;
      dbeNomProv: TEdit;
      dbeCIA: TwwDBEdit;
      dbeTMoneda: TwwDBEdit;
      dbeTDiario: TwwDBEdit;
      pnlNroDev: TPanel;
      dbgDevengadoSeg2: TwwDBGrid;
      Label18: TLabel;
      Label19: TLabel;
      dbeNroDev: TEdit;
      Label16: TLabel;
      dbeCptoDev: TEdit;
      Label3: TLabel;
      dbeGlosaDev: TEdit;
      Label14: TLabel;
      dbePolDev: TEdit;
      edtano: TwwDBSpinEdit;
      edtMes: TwwDBSpinEdit;
      Label1: TLabel;
      Label20: TLabel;
      pnlEdtMontoDev: TPanel;
      Label11: TLabel;
      lblTitulo1: TLabel;
      Label21: TLabel;
      bbtnOk1: TBitBtn;
      edtObservacion: TEdit;
      btnSalir: TBitBtn;
      Label22: TLabel;
      edtCCosto: TEdit;
      edtMonto: TEdit;
      btnGrabar: TBitBtn;
      GroupBox1: TGroupBox;
      dbgDevengadoSeg3: TwwDBGrid;
      bbtnExcelMes: TBitBtn;
      bbtnExcelAcum: TBitBtn;
      btnContabiliza: TBitBtn;
      lblEstado: TLabel;
      ppDBReporte1: TppDBPipeline;
      pprReporte: TppReport;
      ppDesigner1: TppDesigner;
      cbDiseno: TCheckBox;
      sbDiseno: TSpeedButton;
      bbtnImprimeMensual: TBitBtn;
      ppParameterList1: TppParameterList;
      ppDBReporte2: TppDBPipeline;
      ppDBReporte3: TppDBPipeline;
      pprBalComprobUnaMoneda: TppReport;
      ppReport1: TppReport;
      ppParameterList2: TppParameterList;
      ppReport2: TppReport;
      ppHeaderBand4: TppHeaderBand;
      ppLabel21: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel38: TppLabel;
      ppSystemVariable10: TppSystemVariable;
      ppSystemVariable11: TppSystemVariable;
      ppLabel43: TppLabel;
      ppDetailBand4: TppDetailBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppFooterBand4: TppFooterBand;
      ppSummaryBand2: TppSummaryBand;
      ppLine16: TppLine;
      pplblctarei: TppLabel;
      pplblreides: TppLabel;
      pplbldeberei: TppLabel;
      pplblhaberei: TppLabel;
      ppLine17: TppLine;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLine18: TppLine;
      ppLine19: TppLine;
      ppParameterList3: TppParameterList;
      ppDBReporte4: TppDBPipeline;
      ppReport3: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel3: TppLabel;
      ppDBText4: TppDBText;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText9: TppDBText;
      ppLabel11: TppLabel;
      ppDBText10: TppDBText;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDetailBand1: TppDetailBand;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppLine1: TppLine;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLine2: TppLine;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppParameterList4: TppParameterList;
      ppHeaderBand2: TppHeaderBand;
      ppDetailBand2: TppDetailBand;
      ppFooterBand2: TppFooterBand;
      daDataModule1: TdaDataModule;
      bbtnImprimeAcumulado: TBitBtn;
      ppDBReporte5: TppDBPipeline;
      ppDBReporte6: TppDBPipeline;
      ppDBReporte7: TppDBPipeline;
      Label23: TLabel;
      dbeFecIni: TwwDBEdit;
      Label24: TLabel;
      dbeFecFin: TwwDBEdit;
    gbPeriodoCnt: TGroupBox;
      Label25: TLabel;
      edtanocnt: TwwDBSpinEdit;
      Label26: TLabel;
      edtmescnt: TwwDBSpinEdit;
      Procedure ValidaNumerosKeyPress(Sender: TObject; Var Key: Char);
      Procedure ValidaLetrasNumerosKeyPress(Sender: TObject; Var Key: Char);
      Procedure ValidaLetrasKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormActivate(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnCanc1Click(Sender: TObject);
      Procedure dbgDevengadoSeg1RowChanged(Sender: TObject);
      Procedure btnSalirClick(Sender: TObject);
      Procedure dbgDevengadoSeg2DblClick(Sender: TObject);
      Procedure bbtnOk1Click(Sender: TObject);
      Procedure btnGrabarClick(Sender: TObject);
      Procedure btnCancelaClick(Sender: TObject);
      Procedure bbtnExcelMesClick(Sender: TObject);
      Procedure bbtnExcelAcumClick(Sender: TObject);
      Procedure btnContabilizaClick(Sender: TObject);
      Procedure edtMesChange(Sender: TObject);
      Procedure sbDisenoClick(Sender: TObject);
      Procedure bbtnImprimeMensualClick(Sender: TObject);
      Procedure bbtnImprimeAcumuladoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
    procedure dbgDevengadoSeg1DblClick(Sender: TObject);
// Fin HPC_201801_CNT    

   Private
    { Private declarations }
      Function CalculaDevengueMensual: String;
      Procedure RefrescaGrillaDevengado;
      Procedure RefrescaGrillaAcumulado;
      Procedure RefrescaEstadoDevengue;
   Public
    { Public declarations }
      xoperacion: String;
      xciaid, xtipdiario, xcpanomes, cpnoreg, xtipseguro, xnropoliza, xcptoid, xsegid, xsegmovid: String;

   End;

Var
   fDevengadoSeg: TfDevengadoSeg;
Implementation

Uses CNT700A, CNTDM;

{$R *.dfm}

Procedure TfDevengadoSeg.ValidaNumerosKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Not (key In ['0'..'9', '.', #8]) Then
   Begin
      key := #0;
      showmessage('Por favor introduzca números')
   End
End;

Procedure TfDevengadoSeg.ValidaLetrasNumerosKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If Not (key In ['A'..'Z', 'a'..'z', ' ', '0'..'9', '.', #8]) Then
   Begin
      key := #0;
      showmessage('Caracter no permitido')
   End
End;

Procedure TfDevengadoSeg.ValidaLetrasKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Not (key In ['A'..'Z', 'a'..'z', ' ', '0'..'9']) Then
   Begin
      key := #0;
      showmessage('Caracter no permitido')
   End
End;

Procedure TfDevengadoSeg.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;
// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
Procedure TfDevengadoSeg.FormActivate(Sender: TObject);
Var
   xSQL: String;
   xCentroCosto : String;
Begin
   dbePolDev.Text := xnropoliza;
   dbeCptoDev.Enabled := false;
   dbeGlosaDev.Enabled := false;
   dbePolDev.Enabled := false;
   dbgDevengadoSeg1.datasource := nil;

   dbgDevengadoSeg1.Selected.Clear;
   dbgDevengadoSeg1.Selected.Add('MARCA'#9'3'#9'(x)'#9'F');
   dbgDevengadoSeg1.Selected.Add('DCPREG'#9'2'#9'N°'#9'F');
   dbgDevengadoSeg1.Selected.Add('TREGID'#9'5'#9'TR'#9'F');
   dbgDevengadoSeg1.Selected.Add('CPTOID'#9'6'#9'Conc'#9'F');
   dbgDevengadoSeg1.Selected.Add('CUENTAID'#9'7'#9'Cuenta'#9'F');
   dbgDevengadoSeg1.Selected.Add('DCPGLOSA'#9'21'#9'Glosa'#9'F');
   dbgDevengadoSeg1.Selected.Add('CCOSID'#9'6'#9'CCos'#9'F');
   dbgDevengadoSeg1.Selected.Add('DCPDH'#9'4'#9'D/H'#9'F');
   dbgDevengadoSeg1.Selected.Add('DCPMOORI'#9'8'#9'Impor'#9'F');
   xSQL := ' SELECT ''CNT'' MOD,''CNT'' MODULO,''N'' MARCA,CXP302.CIAID,CXP302.DCPREG,CXP302.TREGID,CXP302.CPTOID,CXP302.CUENTAID,CXP302.DCPGLOSA,CXP302.CCOSID,CXP302.DCPDH,CXP302.DCPMOORI,CXP302.DCPMOEXT,'
      + ' CXP302.DCPMOLOC,CXP302.DCPANOMM,CXP302.CLAUXID,CXP302.DCPAUXID,CXP302.DOCID,CXP302.CPSERIE,CXP302.CPNODOC,CXP302.TMONID,CXP302.CPTCAMPR'
      + ' FROM DB2ADMIN.CXP302, DB2ADMIN.TGE202'
      + ' WHERE CXP302.CPTOID =  TGE202.CUENTAID'
      + ' AND CXP302.CIAID =  TGE202.CIAID'
      + ' AND CXP302.CIAID =' + quotedstr(xciaid)
      + ' AND CXP302.TDIARID =' + quotedstr(xtipdiario)
      + ' AND CXP302.DCPANOMM =' + quotedstr(xcpanomes)
      + ' AND TGE202.CTANIV = ' + quotedstr('3')
      + ' AND CXP302.DCPDH = ' + quotedstr('D')
      + ' AND CXP302.TREGID NOT IN (''09'') '
      + ' AND CXP302.CPNOREG =' + quotedstr(cpnoreg) + ' ORDER BY DCPREG';
   Try
      DMCNT.cdsQry5.close;
      DMCNT.cdsQry5.DataRequest(xSql);
      DMCNT.cdsQry5.Open;
   Except
      ShowMessage('Error al Llenar la grilla de datos');
      Screen.Cursor := crDefault;
      exit;
   End;
   xSQL := 'select CTAGASID from CNT_DEV_SEG_CAB WHERE CPTOID=' + quotedstr(xcptoid) + ' AND CIAID=' + quotedstr(xciaid)
      + ' AND SEGID=' + quotedstr(xsegid);
   Try
      DMCNT.cdsQry2.close;
      DMCNT.cdsQry2.DataRequest(xSql);
      DMCNT.cdsQry2.Open;
   Except
      ShowMessage('Error al Llenar la grilla de datos');
      Screen.Cursor := crDefault;
      exit;
   End;
   dbeCptoDev.Text := DMCNT.cdsQry2.fieldbyname('CTAGASID').AsString;

   dbgDevengadoSeg1.datasource := DMCNT.dsQry5;
   dbgDevengadoSeg1.SetControlType('MARCA', fctCheckBox, 'S;N');
   dbgDevengadoSeg1.applyselected;
   RefrescaGrillaDevengado;
   RefrescaGrillaAcumulado;
   dbgDevengadoSeg3.Enabled := false;
 {
   xSQL := 'select CTAGASID from CNT_DEV_SEG_CAB WHERE CPTOID=' + quotedstr(xcptoid) + ' AND CIAID=' + quotedstr(xciaid)
      + ' AND SEGID=' + quotedstr(xsegid);
   Try
      DMCNT.cdsQry2.close;
      DMCNT.cdsQry2.DataRequest(xSql);
      DMCNT.cdsQry2.Open;
   Except
      ShowMessage('Error al Llenar la grilla de datos');
      Screen.Cursor := crDefault;
      exit;
   End;
   dbeCptoDev.Text := DMCNT.cdsQry2.fieldbyname('CTAGASID').AsString;
}
   xSQL := 'select nvl(max(SEGMOVID),0) SEGMOVID from DB2ADMIN.CNT_DEV_SEG_MOV WHERE 1=1';
   Try
      DMCNT.cdsQry2.close;
      DMCNT.cdsQry2.DataRequest(xSQL);
      DMCNT.cdsQry2.Open;
   Except
      ShowMessage('No se pudo obtener el codigo de devengue');
      Screen.Cursor := crDefault;
      exit;
   End;
   xsegmovid := FormatFloat('000000', (DMCNT.cdsQry2.FieldByName('SEGMOVID').AsInteger + 1));
   dbeNroDev.Text := xsegmovid;
   CalculaDevengueMensual;
      //inicializar el periodo actual
   edtano.Text := IntToStr(YearOf(Now));
   edtmes.Text := IntToStr(MonthOf(Now));
   edtanocnt.Text := IntToStr(YearOf(Now));
   edtmescnt.Text := IntToStr(MonthOf(Now));
End;
// Fin HPC_201801_CNT

// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
Procedure TfDevengadoSeg.RefrescaGrillaDevengado;
Var
   xSQL, xsegidCab: String;
   xCentroCosto : String;
Begin
   xSQL := 'SELECT SEGID FROM CNT_DEV_SEG_CAB WHERE CPTOID=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPTOID').AsString) + ' AND CTAGASID=' + quotedstr(dbeCptoDev.Text) ;
   Try
      DMCNT.cdsQry11.close;
      DMCNT.cdsQry11.DataRequest(xSQL);
      DMCNT.cdsQry11.Open;
   Except
      ShowMessage('Error al obtener ID del Seguro');
      exit;
   End;
   if DMCNT.cdsQry11.recordcount>0 then
      xsegidCab := DMCNT.cdsQry11.fieldbyname('SEGID').AsString
   else
   begin
//      ShowMessage('Error al Llenar la grilla de Devengado');
      Screen.Cursor := crDefault;
      exit;
   end;

   xSQL := 'select D.CCOSID,D.CCOSDES,C.TIPMON, (CASE WHEN D.VALOR IS NULL THEN 0 ELSE CAST(D.VALOR AS FLOAT) END) MTOCAL, ''                                        '' OBS'
      + ' from CNT_DEV_SEG_DET D,CNT_DEV_SEG_CAB C '
      + ' WHERE C.SEGID=D.SEGID AND D.SEGID=' + quotedstr(xsegidCab);
   Try
      DMCNT.cdsQry4.DataRequest(xSql);
      DMCNT.cdsQry4.close;
      DMCNT.cdsQry4.Open;
      If DMCNT.cdsQry4.RecordCount = 0 Then
      Begin
         btnGrabar.Enabled := False;
         btnContabiliza.Enabled := False;
      End
      Else
      Begin
         btnGrabar.Enabled := true;
         btnContabiliza.Enabled := true;
      End;
   Except
      ShowMessage('Error al Llenar la grilla de datos de Detalle de la Provisión por Pagar');
      Screen.Cursor := crDefault;
      exit;
   End;
   CalculaDevengueMensual;
{
   While Not DMCNT.cdsQry4.Eof Do
   Begin
      DMCNT.cdsQry4.Edit;
      DMCNT.cdsQry4.FieldByName('MTOCAL').AsString := CalculaDevengueMensual;
      DMCNT.cdsQry4.Post;
      DMCNT.cdsQry4.Next;
   End;
}
End;
// Fin HPC_201801_CNT

Procedure TfDevengadoSeg.RefrescaGrillaAcumulado;
Var
   xSQL: String;
Begin
// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
   xSQL := ' select (SELECT CPTODES FROM CNT_DEV_SEG_CAB WHERE SEGID=' + quotedstr(xsegid) + ') CONCEPTO,'
      + ' TMONID,MONTOT,'
      + ' CASE TMONID WHEN ''N'' THEN SUM(CPMTOPROMESLOC)'
      + ' WHEN ''D'' THEN SUM(CPMTOPROMESEXT)END DEVENGADO'
      + ' from CNT_DEV_SEG_MOV where DCPREGDET=' + quotedstr(DMCNT.cdsQry5.FieldByName('DCPREG').AsString)
      + ' and DCPANOMM=' + quotedstr(dbePeriodo.Text)
      + ' and CIAID=' + quotedstr(DMCNT.cdsQry5.FieldByName('CIAID').AsString)
      + ' and CLAUXID=' + quotedstr(DMCNT.cdsQry5.FieldByName('CLAUXID').AsString)
      + ' and PROV=' + quotedstr(DMCNT.cdsQry5.FieldByName('DCPAUXID').AsString)
      + ' and DOCID=' + quotedstr(DMCNT.cdsQry5.FieldByName('DOCID').AsString)
      + ' and CPSERIE=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPSERIE').AsString)
      + ' and CPNODOC=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPNODOC').AsString)
      + ' group by TMONID,MONTOT';
// Fin HPC_201801_CNT

   Try
      DMCNT.cdsQry7.close;
      DMCNT.cdsQry7.DataRequest(xSql);
      DMCNT.cdsQry7.Open;
   Except
      ShowMessage('Error al Llenar la grilla de datos de Detalle de la Provisión por Pagar');
      Screen.Cursor := crDefault;
      exit;
   End;
End;

// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
Function TfDevengadoSeg.CalculaDevengueMensual: String;
Var
   xSQL,xsegidCab: String;
   xmontoLocal, xcaldevenguemesual, xcalculoFinal: Double;
   xcalculoF : String;
Begin
   xcalculoFinal := 0;
   xcalculoF := '';
   If (length(DMCNT.cdsQry5.FieldByName('CPTOID').AsString)>0) Then
   Begin
       xmontoLocal := DMCNT.cdsQry5.FieldByName('DCPMOLOC').AsFloat;
       xcaldevenguemesual := DMCNT.FRound((xmontoLocal / 12), 15, 2);
       xSQL := 'SELECT SEGID FROM CNT_DEV_SEG_CAB WHERE CPTOID=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPTOID').AsString) + ' AND CTAGASID = ' + quotedstr(dbeCptoDev.Text) ;
       Try
          DMCNT.cdsQry11.close;
          DMCNT.cdsQry11.DataRequest(xSQL);
          DMCNT.cdsQry11.Open;
       Except
          ShowMessage('Error al obtener ID del Seguro');
          exit;
       End;
       xsegidCab := DMCNT.cdsQry11.fieldbyname('SEGID').AsString;
       xSQL := 'select D.CCOSID,D.CCOSDES,C.TIPMON, (CASE WHEN VALOR =0 THEN 0 ELSE CAST(D.VALOR AS FLOAT) END) MTOCAL, ''                                        '' OBS'
          + ' from CNT_DEV_SEG_DET D,CNT_DEV_SEG_CAB C '
          + ' WHERE C.SEGID=D.SEGID AND D.SEGID=' + quotedstr(xsegidCab);
       Try
          DMCNT.cdsQry4.DataRequest(xSql);
          DMCNT.cdsQry4.close;
          DMCNT.cdsQry4.Open;
       Except
          ShowMessage('Error al Obtener los Centros de Costo asociados al Detalle de la Provisión');
          Screen.Cursor := crDefault;
          exit;
       End;
       DMCNT.cdsQry4.First;
       While Not DMCNT.cdsQry4.Eof Do
       Begin
         If DMCNT.cdsQry4.RecordCount > 0 Then
         Begin
            IF DMCNT.cdsQry4.FieldByName('MTOCAL').AsFloat >0 then
            begin
               xcalculoFinal := DMCNT.cdsQry4.FieldByName('MTOCAL').AsFloat;
            end
            else
            begin
              xcalculoFinal := DMCNT.FRound(xcaldevenguemesual / DMCNT.cdsQry4.RecordCount, 15, 2);
            end;
         End
         Else
         Begin
            ShowMessage('No existen Centros de Costo para el cálculo del Devengue Mensual');
            exit;
         End;
  
         xcalculoF := FormatFloat('##0.00', xcalculoFinal);
         DMCNT.cdsQry4.Edit;
         DMCNT.cdsQry4.FieldByName('MTOCAL').AsString := xcalculoF;
         DMCNT.cdsQry4.Post;
       DMCNT.cdsQry4.next;
       end;
   End;
End;
// Fin HPC_201801_CNT

Procedure TfDevengadoSeg.FormCreate(Sender: TObject);
var
   xSQL:String;
Begin
   lblEstado.Caption := 'Pendiente';
   dbgDevengadoSeg2.Selected.Clear;
   dbgDevengadoSeg2.Selected.Add('CCOSID'#9'6'#9'C.Costo'#9'F');
   dbgDevengadoSeg2.Selected.Add('CCOSDES'#9'15'#9'Descripción'#9'F');
   dbgDevengadoSeg2.Selected.Add('TIPMON'#9'6'#9'T.M.'#9'F');
   dbgDevengadoSeg2.Selected.Add('MTOCAL'#9'7'#9'Monto'#9'F');
   dbgDevengadoSeg2.Selected.Add('OBS'#9'28'#9'Observación'#9'F');
   dbgDevengadoSeg2.DataSource := DMCNT.dsQry4;

// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
   dbgDevengadoSeg3.Selected.Clear;
   dbgDevengadoSeg3.Selected.Add('CONCEPTO'#9'33'#9'Concepto'#9'F');
   //dbgDevengadoSeg3.Selected.Add('FECEMI'#9'12'#9'FecEmi'#9'F');
   dbgDevengadoSeg3.Selected.Add('TMONID'#9'6'#9'TM'#9'F');
   dbgDevengadoSeg3.Selected.Add('MONTOT'#9'14'#9'Importe'#9'F');
   dbgDevengadoSeg3.Selected.Add('DEVENGADO'#9'13'#9'Devengado'#9'F');
   dbgDevengadoSeg3.DataSource := DMCNT.dsQry7;

   dbgDevengadoSeg1.Selected.Clear;
   dbgDevengadoSeg1.Selected.Add('MARCA'#9'3'#9'(x)'#9'F');
   dbgDevengadoSeg1.Selected.Add('DCPREG'#9'2'#9' '#9'F');
   dbgDevengadoSeg1.Selected.Add('TREGID'#9'5'#9'TR'#9'F');
   dbgDevengadoSeg1.Selected.Add('CPTOID'#9'6'#9'Conc'#9'F');
   dbgDevengadoSeg1.Selected.Add('CUENTAID'#9'7'#9'Cuenta'#9'F');
   dbgDevengadoSeg1.Selected.Add('DCPGLOSA'#9'22'#9'Glosa'#9'F');
   dbgDevengadoSeg1.Selected.Add('CCOSID'#9'7'#9'CCos'#9'F');
   dbgDevengadoSeg1.Selected.Add('DCPDH'#9'6'#9'D/H'#9'F');
   dbgDevengadoSeg1.Selected.Add('DCPMOORI'#9'8'#9'Impor'#9'F');
// dbgDevengadoSeg1.SetControlType('MARCA', fctCheckBox, 'S;N');
// dbgDevengadoSeg1.DataSource := DMCNT.dsQry5;
// Fin HPC_201801_CNT
   pnlNroDev.Enabled := false;

End;

Procedure TfDevengadoSeg.bbtnCanc1Click(Sender: TObject);
Var
   xSQL, xsegid: String;
Begin
   Screen.Cursor := crHourGlass;
   If (xoperacion <> 'U') Then
   Begin
      ShowMessage('Primero debe asociar un centro de costo');
      Screen.Cursor := crDefault;
      exit;
   End;
   xsegid := DMCNT.cdsQry5.fieldbyname('SEGID').AsString;
   xSQL := 'Delete from DB2ADMIN.CNT_DEV_SEG_DET where segid=' + quotedstr(xsegid) + ' and ccosid=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CCOSID').AsString);
   Try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
   Except
      ShowMessage('No se pudo Eliminar detalle del seguro');
      Screen.Cursor := crDefault;
      exit;
   End;
   Screen.Cursor := crDefault;

   xSQL := 'select c.segid,d.ccosid,d.ccosdes,d.valor from CNT_DEV_SEG_CAB c, CNT_DEV_SEG_det d where c.segid = d.segid '
      + ' and c.ciaid=' + quotedstr(dbeCIA.Text) + ' and d.segid=' + quotedstr(DMCNT.cdsQry5.fieldbyname('SEGID').AsString);
   Try
      DMCNT.cdsQry5.close;
      DMCNT.cdsQry5.DataRequest(xSql);
      DMCNT.cdsQry5.Open;
   Except
      ShowMessage('Error al Llenar la grilla de datos');
      Screen.Cursor := crDefault;
      exit;
   End;
   dbgDevengadoSeg1.DataSource := DMCNT.dsQry5;
End;

// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
Procedure TfDevengadoSeg.dbgDevengadoSeg1RowChanged(Sender: TObject);
Var
  xCentroCosto : String;
Begin
   xCentroCosto := '';
   dbeGlosaDev.Text := DMCNT.cdsQry5.fieldbyname('DCPGLOSA').AsString;
   RefrescaGrillaDevengado;
   RefrescaGrillaAcumulado;
   RefrescaEstadoDevengue;
   //xCentroCosto := DMCNT.cdsQry4.fieldbyname('CCOSID').AsString;
   CalculaDevengueMensual;
End;
// Fin HPC_201801_CNT

Procedure TfDevengadoSeg.btnSalirClick(Sender: TObject);
Begin
   pnlEdtMontoDev.Visible := false;
   dbgDevengadoSeg2.Enabled := true;
End;

Procedure TfDevengadoSeg.dbgDevengadoSeg2DblClick(Sender: TObject);
Begin
   dbgDevengadoSeg2.Enabled := false;
   pnlEdtMontoDev.Visible := true;
   edtCCosto.Text := DMCNT.cdsQry4.FieldByName('CCOSID').AsString;
   edtMonto.Text := DMCNT.cdsQry4.FieldByName('MTOCAL').AsString;
   If (length(trim(DMCNT.cdsQry4.FieldByName('OBS').AsString)) = 0) Then
   Begin
      edtObservacion.Text := '';
   End
   Else
   Begin
      edtObservacion.Text := DMCNT.cdsQry4.FieldByName('OBS').AsString;
   End;
End;

Procedure TfDevengadoSeg.bbtnOk1Click(Sender: TObject);
Begin
   DMCNT.cdsQry4.Edit;
   DMCNT.cdsQry4.FieldByName('MTOCAL').AsString := FormatFloat('##0.00', StrToFloat(edtMonto.Text));
   DMCNT.cdsQry4.FieldByName('OBS').AsString := edtObservacion.Text;
   DMCNT.cdsQry4.Post;
   pnlEdtMontoDev.Visible := false;
   dbgDevengadoSeg2.Enabled := true;
End;

// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
Procedure TfDevengadoSeg.btnGrabarClick(Sender: TObject);
Var
   xSQL, xperiodoDev, xmes, xanoi, xanof, xtipmon: String;
   xmontoOri, xmontoLoc, xmontoExt, xtipcamb, xacumulado, xsaldoOri, xsaldoLoc, xsaldoExt: Double;
   xDiaI : Double;
   xmesF : String;
   xPeriodoAct, xVigFinal, xVigInicial : String;
   xFlag : Integer;
Begin
   Screen.Cursor := crHourGlass;
   xperiodoDev := edtano.Text + FormatFloat('00', StrToInt(edtMes.Text));
   xPeriodoAct :='';
   xVigFinal := '';
   xVigInicial := '';
   xPeriodoAct := InttoStr(YearOf(Now))+ formatfloat('00',MonthOf(Now)) ;
   xSQL := '  SELECT TO_CHAR(A.FECINIVIG,''MM'') MES,SUBSTR(TO_CHAR(A.FECINIVIG,''dd/MM/yyyy''),7,4) ANOI,SUBSTR(TO_CHAR(A.FECFINVIG,''dd/MM/yyyy''),7,4) ANOF, SUBSTR(TO_CHAR(A.FECINIVIG, ''dd/MM/yyyy''), 1, 2) DIAI, TO_CHAR(A.FECFINVIG,''MM'') MESF FROM CXP301 A WHERE'
      + ' A.CLAUXID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CLAUXID').AsString)
      + ' AND A.DOCID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('DOCID').AsString)
      + ' AND A.CPSERIE=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPSERIE').AsString)
      + ' AND A.CPNODOC=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPNODOC').AsString)
      + ' AND A.CPESTADO NOT IN (''E'') ';
   Try
      DMCNT.cdsQry.close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
   Except
      ShowMessage('Error al generar obtener la fecha inicio vigencia de Seguro');
      exit;
   End;
   if  DMCNT.cdsQry.recordcount >0 then
   begin
       if (DMCNT.cdsQry.fieldbyname('MES').isnull) or (DMCNT.cdsQry.fieldbyname('MES').AsString='') then
       begin
          ShowMessage('Error al leer Fecha Inicial Vigente del Seguro');
          exit;
       end
       else
       begin
          xmes := DMCNT.cdsQry.fieldbyname('MES').AsString;
          xanoi := DMCNT.cdsQry.fieldbyname('ANOI').AsString;
          xanof := DMCNT.cdsQry.fieldbyname('ANOF').AsString;
          xmesF := DMCNT.cdsQry.fieldbyname('MESF').AsString;
          xDiaI := strToFloat(DMCNT.cdsQry.fieldbyname('DIAI').AsString);
          xVigInicial := xanoi + xmes;
          xVigFinal := xanof + xmesF;
       end;
   end
   else
   begin
       ShowMessage('No existe fechas para el Seguro');
       exit;
   end;

   If (strToInt(xperiodoDev) > strToInt(xVigFinal)) Then
   Begin
      ShowMessage('El Periodo a devengar es mayor a la Fecha Final de Vigencia del Seguro');
      Screen.Cursor := crDefault;
      exit;
   End;

   If (strToInt(xperiodoDev) < strToInt(xVigInicial)) Then
   Begin
      ShowMessage('El Periodo a devengar es menor a la Fecha Inicial de Vigencia del Seguro');
      Screen.Cursor := crDefault;
      exit;
   End;
   If (strToInt(xperiodoDev) = strToInt(xVigInicial)) And (xDiaI > 13) Then
   Begin
      ShowMessage('No se puede devengar el Periodo ingresado');
      Screen.Cursor := crDefault;
      exit;
   End;

   If (StrToInt(xPeriodoDev) > StrToInt(xPeriodoAct)) Then
   Begin
      ShowMessage('No se puede devengar periodos futuros dentro de la vigencia del seguro');
      Screen.Cursor := crDefault;
      exit;
   End;
   xFlag :=0;
   DMCNT.cdsQry5.First;
   While Not DMCNT.cdsQry5.Eof Do
   Begin
     If DMCNT.cdsQry5.FieldByName('MARCA').AsString = 'S' Then
     Begin

       xSQL := 'select count(segmovid) cant from cnt_dev_seg_mov where '
          + ' CPANOMES=' + quotedstr(xperiodoDev)
          + ' and DCPANOMM=' + quotedstr(dbePeriodo.Text)
          + ' and DCPREGDET=' + quotedstr(DMCNT.cdsQry5.FieldByName('DCPREG').AsString)
          + ' and DOCID=' + quotedstr(DMCNT.cdsQry5.FieldByName('DOCID').AsString)
          + ' and CPSERIE=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPSERIE').AsString)
          + ' and CPNODOC=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPNODOC').AsString)
          + ' and CLAUXID=' + quotedstr(DMCNT.cdsQry5.FieldByName('CLAUXID').AsString);
       Try
          DMCNT.cdsQry3.close;
          DMCNT.cdsQry3.DataRequest(xSql);
          DMCNT.cdsQry3.Open;
       Except
          ShowMessage('Error al consultar si ya se devengó el detalle de la provisión');
          Screen.Cursor := crDefault;
          exit;
       End;
       If (DMCNT.cdsQry3.FieldByName('cant').AsInteger > 0) Then
       Begin
          ShowMessage('El detalle de provisión ya fue devengado');
          Screen.Cursor := crDefault;
          exit;
       End;

       xtipcamb := StrToFloat(DMCNT.cdsQry5.FieldByName('CPTCAMPR').AsString);

       xacumulado := 0;
//       DMCNT.cdsQry4.Last;
       DMCNT.cdsQry4.First;
       While Not DMCNT.cdsQry4.Eof Do
       Begin
          xmontoOri := StrToFloat(DMCNT.cdsQry4.FieldByName('MTOCAL').AsString);
          xmontoLoc := StrToFloat(DMCNT.cdsQry4.FieldByName('MTOCAL').AsString);
          xmontoExt := DMCNT.FRound((xmontoOri / xtipcamb), 15, 2);
          xacumulado := xacumulado + xmontoLoc;

          If (DMCNT.cdsQry5.FieldByName('TMONID').AsString = 'N') Then
          Begin
             xsaldoOri := DMCNT.cdsQry5.FieldByName('DCPMOORI').AsFloat - xacumulado;
             xsaldoLoc := DMCNT.cdsQry5.FieldByName('DCPMOORI').AsFloat - xacumulado;
             xsaldoExt := DMCNT.FRound((xsaldoLoc / xtipcamb), 15, 2);
          End;
          If (DMCNT.cdsQry5.FieldByName('TMONID').AsString = 'D') Then
          Begin
             xsaldoOri := DMCNT.FRound(((DMCNT.cdsQry5.FieldByName('DCPMOORI').AsFloat)*(xtipcamb)),15,2) - xacumulado;
             xsaldoExt := DMCNT.cdsQry5.FieldByName('DCPMOORI').AsFloat - DMCNT.FRound(xacumulado/xtipcamb,15,2);
             xsaldoLoc := xsaldoOri;

          End;

          xSQL := '  SELECT TIPMON FROM CNT_DEV_SEG_CAB WHERE'
            + ' CIAID=' + quotedstr(dbeCIA.Text)
            + ' AND CPTOID=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPTOID').AsString);
          Try
            DMCNT.cdsQry.close;
            DMCNT.cdsQry.DataRequest(xSQL);
            DMCNT.cdsQry.Open;
          Except
            ShowMessage('Error al generar obtener la fecha inicio vigencia de Seguro');
            exit;
          End;

          xtipmon :=  DMCNT.cdsQry.fieldbyname('TIPMON').AsString;

          xSQL := 'insert into cnt_dev_seg_mov'
             + ' (segmovid, cptoiddet, cuentaiddet, dcpregdet, cptoid, cpanomes, dcpanomm, ciaid, clauxid, prov, docid, cpserie, cpnodoc, dcpglosa, cpobs,'
             + '  ccosid, tmonid, cptcampr, cpmtopromesori, cpmtopromesloc, cpmtopromesext, cpsalori, cpsalloc,'
             + '  cpsalext, montot, usureg, fecreg, flgcnt)'
             + '  values'
             + '(' + quotedstr(xsegmovid)
             + ',' + quotedstr(DMCNT.cdsQry5.FieldByName('CPTOID').AsString)
             + ',' + quotedstr(DMCNT.cdsQry5.FieldByName('CUENTAID').AsString)
             + ',' + quotedstr(DMCNT.cdsQry5.FieldByName('DCPREG').AsString)
             + ',' + quotedstr(xcptoid)
             + ',' + quotedstr(xperiodoDev)
             + ',' + quotedstr(dbePeriodo.Text)
             + ',' + quotedstr(DMCNT.cdsQry5.FieldByName('CIAID').AsString) //compañía del detalle
             + ',' + quotedstr(DMCNT.cdsQry5.FieldByName('CLAUXID').AsString)
             + ',' + quotedstr(DMCNT.cdsQry5.FieldByName('DCPAUXID').AsString)
             + ',' + quotedstr(DMCNT.cdsQry5.FieldByName('DOCID').AsString)
             + ',' + quotedstr(DMCNT.cdsQry5.FieldByName('CPSERIE').AsString)
             + ',' + quotedstr(DMCNT.cdsQry5.FieldByName('CPNODOC').AsString)
             + ',' + quotedstr(DMCNT.cdsQry5.FieldByName('DCPGLOSA').AsString)
             + ',' + quotedstr(DMCNT.cdsQry4.FieldByName('OBS').AsString)
             + ',' + quotedstr(DMCNT.cdsQry4.FieldByName('CCOSID').AsString)
             + ',' + quotedstr(xtipmon)//DMCNT.cdsQry5.FieldByName('TMONID').AsString
             + ',' + quotedstr(DMCNT.cdsQry5.FieldByName('CPTCAMPR').AsString)
             + ',' + FloatToStr(xmontoOri)
             + ',' + FloatToStr(xmontoLoc)
             + ',' + FloatToStr(xmontoExt)
             + ',' + FloatToStr(xsaldoOri)
             + ',' + FloatToStr(xsaldoLoc)
             + ',' + FloatToStr(xsaldoExt)
             + ',' + FloatToStr(DMCNT.cdsQry5.FieldByName('DCPMOLOC').AsFloat)
             + ',' + quotedstr(DMCNT.wUsuario)
             + ',SYSDATE,'
             + quotedstr('N')
             + ')';
          Try
             DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
          Except
             ShowMessage('No se pudo Grabar el detalle del devengado generado');
             Screen.Cursor := crDefault;
             exit;
          End;
          xFlag :=1;
          DMCNT.cdsQry4.Next;
       End;
     End;
   DMCNT.cdsQry5.Next;
   End;
   xSQL := 'select nvl(max(SEGMOVID),0) SEGMOVID from DB2ADMIN.CNT_DEV_SEG_MOV WHERE 1=1';
   Try
      DMCNT.cdsQry2.close;
      DMCNT.cdsQry2.DataRequest(xSQL);
      DMCNT.cdsQry2.Open;
      xsegmovid := FormatFloat('000000', (DMCNT.cdsQry2.FieldByName('SEGMOVID').AsInteger + 1));
      dbeNroDev.Text := xsegmovid;
      RefrescaEstadoDevengue;
      RefrescaGrillaAcumulado;
      Screen.Cursor := crDefault;
      if xFlag =1 then
         ShowMessage('El proceso de devengado se realizó correctamente')
      else
         ShowMessage('Seleccione registro para poder devengar');
   Except
      ShowMessage('No se pudo obtener el código de devengue');
      Screen.Cursor := crDefault;
      exit;
   End;
End;
// Fin HPC_201801_CNT

Procedure TfDevengadoSeg.btnCancelaClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfDevengadoSeg.bbtnExcelMesClick(Sender: TObject);
Var
   i, inicio: Integer;
   xsql, xnomSeguro: String;
   Sheet, XLApp: Variant;
Begin
   If (edtano.Text <> IntToStr(YearOf(Now))) Or (StrToInt(edtMes.Text) > MonthOf(Now)) Then
   Begin
      ShowMessage('Periodo inválido para el Reporte Mensual del Devengado de Seguro');
      Screen.Cursor := crDefault;
      exit;
   End;
   xSQL := 'SELECT  PER' + FormatFloat('00', StrToInt(edtMes.Text))
      + ' AS PERIODO FROM TGE154 WHERE CIAID=''' + dbeCIA.Text + ''''
      + 'AND MODULO=''CNT'' '
      + 'AND ANO=''' + inttostr(YearOf(Now))
      + '''';
   DMCNT.cdsQry.close;
   DMCNT.cdsQry.datarequest(xSQL);
   DMCNT.cdsQry.open;

   If DMCNT.cdsQry.FieldByName('PERIODO').asstring = 'S' Then
   Begin
      ShowMessage('El Periodo se encuentra cerrado');
      Screen.Cursor := crDefault;
      exit;
   End;
   DMCNT.cdsQry.close;
// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
   xSQL := ' select cptodes from cnt_dev_seg_cab where cptoid=(select A.cptoid from cxp301 A where '
      + ' A.CLAUXID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CLAUXID').AsString)
      + ' AND A.DOCID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('DOCID').AsString)
      + ' AND A.CPSERIE=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPSERIE').AsString)
      + ' AND A.CPNODOC=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPNODOC').AsString)
      + ' AND A.CPESTADO NOT IN (''E'') )';
// Fin HPC_201801_CNT
   Try
      DMCNT.cdsQry.close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
   Except
      ShowMessage('Error al generar los datos del Reporte Mensual del Devengado de Seguro');
      exit;
   End;
   If (DMCNT.cdsQry.RecordCount > 0) Then
   Begin
      xnomSeguro := DMCNT.cdsQry.fieldbyname('cptodes').AsString;
   End;

   xSQL := ' SELECT M.CPTCAMPR,M.CCOSID,T.CCOSDES,ROUND((ROUND(MONTOT/12,2)/CPTCAMPR),2) DOLARES,ROUND(MONTOT/12,2) SOLES,M.CPMTOPROMESLOC'
      + ' FROM CNT_DEV_SEG_MOV M,TGE203 T'
      + ' WHERE M.CCOSID = T.CCOSID'
      + ' AND T.CCOSACT = ' + quotedstr('S')
      + ' AND M.CPTOIDDET = ' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPTOID').AsString)
      + ' AND M.CUENTAIDDET = ' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPTOID').AsString)
      + ' AND M.CPANOMES = ' + quotedstr(edtano.Text + FormatFloat('00', StrToInt(edtMes.Text)))
      + ' AND M.CLAUXID = ' + quotedstr(DMCNT.cdsQry5.fieldbyname('CLAUXID').AsString)
      + ' AND M.DOCID = ' + quotedstr(DMCNT.cdsQry5.fieldbyname('DOCID').AsString)
      + ' AND M.CPSERIE = ' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPSERIE').AsString)
      + ' AND M.CPNODOC = ' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPNODOC').AsString);

   Try
      DMCNT.cdsQry.close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
   Except
      ShowMessage('Error al generar los datos del Reporte Mensual del Devengado de Seguro');
      exit;
   End;
   If (DMCNT.cdsQry.RecordCount = 0) Then
   Begin
      ShowMessage('No existen datos para el Reporte Mensual del Devengado de Seguro');
      exit;
   End;

   XLApp := CreateOleObject('Excel.Application');
   XLApp.Visible := True;
   XLApp.Workbooks.Add(xlWBatWorkSheet);
   XLApp.Workbooks[1].WorkSheets[1].Name := 'Mensual';
   Sheet := XLApp.Workbooks[1].WorkSheets['Mensual'];

   i := 2;
   sheet.cells[i, 1] := xnomSeguro;
   sheet.Range['A' + IntToStr(i) + ':B' + IntToStr(i)].Font.Bold := True;
   sheet.Range['A' + IntToStr(i) + ':B' + IntToStr(i)].Merge(EmptyParam);
   sheet.Range['A' + IntToStr(i) + ':B' + IntToStr(i)].HorizontalAlignment := xlleft;

   Inc(i); //i=3
   sheet.cells[i, 1] := 'PERIODO :';
   sheet.cells[i, 2] := edtano.Text + FormatFloat('00', StrToInt(edtMes.Text));

   Inc(i); //i=4
   sheet.cells[i, 1] := 'FACT. N :';
   sheet.cells[i, 2] := DMCNT.cdsQry5.fieldbyname('CPSERIE').AsString + '-' + DMCNT.cdsQry5.fieldbyname('CPNODOC').AsString;

   Inc(i); //i=5
   sheet.cells[i, 1] := 'PÓLIZA N° :';
   sheet.cells[i, 2] := xnropoliza;

   Inc(i); //i=6
   sheet.cells[i, 1] := 'DATOS DE LA PROVISIÓN';
   sheet.cells[i, 1].Font.Bold := True;
   sheet.Range['A' + IntToStr(i) + ':B' + IntToStr(i)].Merge(EmptyParam);

   Inc(i); //i=7
   sheet.cells[i, 1] := 'CIA : ' + xciaid;
   sheet.cells[i, 2] := 'TDIARID : ' + xtipdiario;
     //sheet.cells[i, 3] := 'PERIODO : '+edtano.Text + FormatFloat('00',StrToInt(edtMes.Text));
   sheet.cells[i, 3] := 'PERIODO : ' + dbePeriodo.Text;
   sheet.cells[i, 4] := 'NREG : ' + cpnoreg;

   Inc(i); //i=8
   sheet.cells[i, 1] := 'C.C.';
   sheet.Range['A' + IntToStr(i) + ':A' + IntToStr(i + 1)].Merge(EmptyParam);
   sheet.cells[i, 2] := 'UBICACIÓN';
   sheet.Range['B' + IntToStr(i) + ':B' + IntToStr(i + 1)].Merge(EmptyParam);
   sheet.cells[i, 3] := 'SUMA ASEGURADA';
   sheet.Range['C' + IntToStr(i) + ':E' + IntToStr(i)].Merge(EmptyParam);
   sheet.cells[(i + 1), 3] := 'DOLARES';
   sheet.cells[(i + 1), 4] := 'T/C';
   sheet.cells[(i + 1), 5] := 'SOLES';
   sheet.cells[i, 6] := 'MONTO';
   sheet.Range['F' + IntToStr(i) + ':F' + IntToStr(i + 1)].Merge(EmptyParam);

   sheet.Range['A8:F9'].Font.Bold := True;
   sheet.Range['A8:F9'].HorizontalAlignment := xlcenter;

   sheet.Range['A' + IntToStr(i) + ':F' + IntToStr(i + 1)].Borders[xlEdgeTop].LineStyle := xlContinuous;
   sheet.Range['A' + IntToStr(i) + ':F' + IntToStr(i + 1)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
   sheet.Range['C' + IntToStr(i) + ':E' + IntToStr(i)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
   sheet.Range['A' + IntToStr(i) + ':F' + IntToStr(i + 1)].Borders[xlLeft].LineStyle := xlContinuous;
   sheet.Range['G' + IntToStr(i) + ':G' + IntToStr(i + 1)].Borders[xlLeft].LineStyle := xlContinuous;
   Inc(i); //i=9
   Inc(i); //i=10
   inicio := i;
   DMCNT.cdsQry.First;
   While Not DMCNT.cdsQry.Eof Do
   Begin
      sheet.cells[i, 1] := DMCNT.cdsQry.fieldbyname('CCOSID').AsString;
      sheet.cells[i, 2] := DMCNT.cdsQry.fieldbyname('CCOSDES').AsString;
      sheet.cells[i, 3] := DMCNT.cdsQry.fieldbyname('DOLARES').AsString;
      sheet.cells[i, 4] := DMCNT.cdsQry.fieldbyname('CPTCAMPR').AsString;
      sheet.cells[i, 5] := DMCNT.cdsQry.fieldbyname('SOLES').AsString;
      sheet.cells[i, 6] := DMCNT.cdsQry.fieldbyname('CPMTOPROMESLOC').AsString;

      sheet.Range['A' + IntToStr(i) + ':F' + IntToStr(i)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
      sheet.Range['A' + IntToStr(i) + ':G' + IntToStr(i)].Borders[xlLeft].LineStyle := xlContinuous;

      Inc(i);
      DMCNT.cdsQry.Next;
   End;

   sheet.Range['C' + IntToStr(inicio) + ':' + 'F' + IntToStr(i - 1)].NumberFormat := '###,###,##0.00';

   sheet.Range['A1:A' + IntToStr(i - 1)].NumberFormat := '@';
   sheet.Range['B1:B' + IntToStr(i - 1)].NumberFormat := '@';

   sheet.Range['A' + IntToStr(i) + ':F' + IntToStr(i)].Font.Bold := True;
   sheet.cells[i, 1] := 'TOTAL';
   sheet.Range['A' + IntToStr(i) + ':E' + IntToStr(i)].Merge(EmptyParam);

   sheet.cells[i, 6] := '=SUM(F' + IntToStr(inicio) + ':F' + IntToStr(i - 1) + ')';

   sheet.Range['A' + IntToStr(i) + ':F' + IntToStr(i)].HorizontalAlignment := xlcenter;

   sheet.Range['A' + IntToStr(i) + ':F' + IntToStr(i)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
   sheet.Range['A' + IntToStr(i) + ':G' + IntToStr(i)].Borders[xlLeft].LineStyle := xlContinuous;
End;

Procedure TfDevengadoSeg.bbtnExcelAcumClick(Sender: TObject);
Var
   i, j, k, z, inicio: Integer;
   xsql, xmes, xanoi, xanof, xnomSeguro: String;
   Sheet, XLApp: Variant;
   xmontot: Double;
Begin
// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
   xSQL := ' select cptodes from cnt_dev_seg_cab where cptoid=(select A.cptoid from cxp301 A where '
      + ' A.CLAUXID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CLAUXID').AsString)
      + ' AND A.DOCID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('DOCID').AsString)
      + ' AND A.CPSERIE=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPSERIE').AsString)
      + ' AND A.CPNODOC=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPNODOC').AsString)
      + ' AND A.CPESTADO NOT IN (''E'') ) ';
// Fin HPC_201801_CNT
   Try
      DMCNT.cdsQry.close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
   Except
      ShowMessage('Error al generar los datos del Reporte Mensual del Devengado de Seguro');
      exit;
   End;
   If (DMCNT.cdsQry.RecordCount > 0) Then
   Begin
      xnomSeguro := DMCNT.cdsQry.fieldbyname('cptodes').AsString;
   End;
// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
   xSQL := '  SELECT SUBSTR(A.FECINIVIG,5,1) MES,SUBSTR(TO_CHAR(A.FECINIVIG,''dd/MM/yyyy''),7,4) ANOI,SUBSTR(TO_CHAR(A.FECFINVIG,''dd/MM/yyyy''),7,4) ANOF FROM CXP301 A WHERE'
      + ' A.CLAUXID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CLAUXID').AsString)
      + ' AND A.DOCID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('DOCID').AsString)
      + ' AND A.CPSERIE=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPSERIE').AsString)
      + ' AND A.CPNODOC=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPNODOC').AsString)
      + ' AND A.CPESTADO NOT IN (''E'') ';
// Fin HPC_201801_CNT
   Try
      DMCNT.cdsQry.close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
   Except
      ShowMessage('Error al generar obtener la fecha inicio vigencia de Seguro');
      exit;
   End;
   xmes := DMCNT.cdsQry.fieldbyname('MES').AsString;
   xanoi := DMCNT.cdsQry.fieldbyname('ANOI').AsString;
   xanof := DMCNT.cdsQry.fieldbyname('ANOF').AsString;

   xSQL := '  SELECT M.CPTCAMPR,M.CCOSID,T.CCOSDES,ROUND((ROUND(M.MONTOT/12,2)/M.CPTCAMPR),2) DOLARES,ROUND(MONTOT/12,2) SOLES, M.MONTOT,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''01'', M.CPMTOPROMESLOC, 0) ) P1,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''02'', M.CPMTOPROMESLOC, 0) ) P2,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''03'', M.CPMTOPROMESLOC, 0) ) P3,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''04'', M.CPMTOPROMESLOC, 0) ) P4,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''05'', M.CPMTOPROMESLOC, 0) ) P5,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''06'', M.CPMTOPROMESLOC, 0) ) P6,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''07'', M.CPMTOPROMESLOC, 0) ) P7,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''08'', M.CPMTOPROMESLOC, 0) ) P8,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''09'', M.CPMTOPROMESLOC, 0) ) P9,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''10'', M.CPMTOPROMESLOC, 0) ) P10,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''11'', M.CPMTOPROMESLOC, 0) ) P11,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''12'', M.CPMTOPROMESLOC, 0) ) P12'
      + '  FROM CNT_DEV_SEG_MOV M,TGE203 T'
      + '  WHERE M.CCOSID=T.CCOSID'
      + '  AND T.CCOSACT=' + quotedstr('S')
      + '  AND M.CPTOIDDET=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPTOID').AsString)
      + '  AND M.CUENTAIDDET=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPTOID').AsString)
      + '  AND M.CLAUXID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CLAUXID').AsString)
      + '  AND M.DOCID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('DOCID').AsString)
      + '  AND M.CPSERIE=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPSERIE').AsString)
      + '  AND M.CPNODOC=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPNODOC').AsString)
      + '  GROUP BY M.CPTCAMPR,M.CCOSID,T.CCOSDES,ROUND((ROUND(M.MONTOT/12,2)/M.CPTCAMPR),2),ROUND(MONTOT/12,2),M.MONTOT';
   Try
      DMCNT.cdsQry.close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
      xmontot := DMCNT.cdsQry.fieldbyname('MONTOT').AsFloat;
   Except
      ShowMessage('Error al generar los datos del Reporte Mensual del Devengado de Seguro');
      exit;
   End;
   If (DMCNT.cdsQry.RecordCount = 0) Then
   Begin
      ShowMessage('No existen datos para el Reporte Acumulado del Devengado de Seguro');
      exit;
   End;

   XLApp := CreateOleObject('Excel.Application');
   XLApp.Visible := True;
   XLApp.Workbooks.Add(xlWBatWorkSheet);
   XLApp.Workbooks[1].WorkSheets[1].Name := 'Acumulado';
   Sheet := XLApp.Workbooks[1].WorkSheets['Acumulado'];

   i := 2;
   sheet.cells[i, 1] := xnomSeguro;
   sheet.Range['A' + IntToStr(i) + ':B' + IntToStr(i)].Font.Bold := True;
   sheet.Range['A' + IntToStr(i) + ':B' + IntToStr(i)].Merge(EmptyParam);
   sheet.Range['A' + IntToStr(i) + ':B' + IntToStr(i)].HorizontalAlignment := xlleft;

   Inc(i); //i=3
   sheet.cells[i, 1] := 'PERIODO :';
   sheet.cells[i, 2] := xanoi + '-' + xanof;

   Inc(i); //i=4
   sheet.cells[i, 1] := 'FACT. N :';
   sheet.cells[i, 2] := DMCNT.cdsQry5.fieldbyname('CPSERIE').AsString + '-' + DMCNT.cdsQry5.fieldbyname('CPNODOC').AsString;

   Inc(i); //i=5
   sheet.cells[i, 1] := 'PÓLIZA N° :';
   sheet.cells[i, 2] := xnropoliza;

   Inc(i); //i=6
   sheet.cells[i, 1] := 'DATOS DE LA PROVISIÓN';
   sheet.cells[i, 1].Font.Bold := True;
   sheet.Range['A' + IntToStr(i) + ':B' + IntToStr(i)].Merge(EmptyParam);

   Inc(i); //i=7
   sheet.cells[i, 1] := 'CIA : ' + xciaid;
   sheet.cells[i, 2] := 'TDIARID : ' + xtipdiario;
   sheet.cells[i, 3] := 'PERIODO : ' + dbePeriodo.Text;
   sheet.cells[i, 4] := 'NREG : ' + cpnoreg;

   Inc(i); //i=8
   sheet.cells[i, 1] := 'C.C.';
   sheet.Range['A' + IntToStr(i) + ':A' + IntToStr(i + 1)].Merge(EmptyParam);
   sheet.cells[i, 2] := 'UBICACIÓN';
   sheet.Range['B' + IntToStr(i) + ':B' + IntToStr(i + 1)].Merge(EmptyParam);
   sheet.cells[i, 3] := 'SUMA ASEGURADA';
   sheet.Range['C' + IntToStr(i) + ':E' + IntToStr(i)].Merge(EmptyParam);
   sheet.cells[(i + 1), 3] := 'DOLARES';
   sheet.cells[(i + 1), 4] := 'T/C';
   sheet.cells[(i + 1), 5] := 'SOLES';
   k := 6;
   If (strToInt(xmes) > 1) Then
   Begin
      For j := (strToInt(xmes) + 1) To 12 Do
      Begin
         sheet.cells[i, k] := DMCNT.NombreMes(IntToStr(j)) + ' ' + xanoi;
         sheet.Range[DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i + 1)].Merge(EmptyParam);
         k := k + 1;
      End;
      For j := 1 To (strToInt(xmes)) Do
      Begin
         sheet.cells[i, k] := DMCNT.NombreMes(IntToStr(j)) + ' ' + xanof;
         sheet.Range[DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i + 1)].Merge(EmptyParam);
         k := k + 1;
      End;
   End;

   sheet.Range['A' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i + 1)].Font.Bold := True;
   sheet.Range['A' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i + 1)].HorizontalAlignment := xlcenter;

   sheet.Range['A' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k - 1)) + IntToStr(i + 1)].Borders[xlEdgeTop].LineStyle := xlContinuous;
   sheet.Range['A' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k - 1)) + IntToStr(i + 1)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
   sheet.Range['C' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k - 1)) + IntToStr(i)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
   sheet.Range['A' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i + 1)].Borders[xlLeft].LineStyle := xlContinuous;
   sheet.Range['G' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i + 1)].Borders[xlLeft].LineStyle := xlContinuous;

   Inc(i); //i=9
   Inc(i); //i=10
   inicio := i;
   DMCNT.cdsQry.First;
   While Not DMCNT.cdsQry.Eof Do
   Begin
      sheet.cells[i, 1] := DMCNT.cdsQry.fieldbyname('CCOSID').AsString;
      sheet.cells[i, 2] := DMCNT.cdsQry.fieldbyname('CCOSDES').AsString;
      sheet.cells[i, 3] := DMCNT.cdsQry.fieldbyname('DOLARES').AsString;
      sheet.cells[i, 4] := DMCNT.cdsQry.fieldbyname('CPTCAMPR').AsString;
      sheet.cells[i, 5] := DMCNT.cdsQry.fieldbyname('SOLES').AsString;
      k := 6;
      If (strToInt(xmes) > 1) Then
      Begin
         For j := (strToInt(xmes) + 1) To 12 Do
         Begin
            sheet.cells[i, k] := DMCNT.cdsQry.fieldbyname('P' + IntToStr(j)).AsString;
            k := k + 1;
         End;
         For j := 1 To (strToInt(xmes)) Do
         Begin
            sheet.cells[i, k] := DMCNT.cdsQry.fieldbyname('P' + IntToStr(j)).AsString;
            k := k + 1;
         End;
      End;

      Inc(i);
      DMCNT.cdsQry.Next;
   End;

   sheet.Range['A' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k - 1)) + IntToStr(i)].Font.Bold := True;
   sheet.cells[i, 1] := 'TOTAL';
   sheet.Range['A' + IntToStr(i) + ':E' + IntToStr(i)].Merge(EmptyParam);
   sheet.Range['A' + IntToStr(i) + ':E' + IntToStr(i)].HorizontalAlignment := xlcenter;

   k := 6;
   If (strToInt(xmes) > 1) Then
   Begin
      For j := 6 To 18 Do
      Begin
         sheet.cells[i, k] := '=SUM(' + DMCNT.NombreLetra(IntToStr(j)) + IntToStr(inicio) + ':' + DMCNT.NombreLetra(IntToStr(j)) + IntToStr(i - 1) + ')';
         k := k + 1;
      End;
   End;
   sheet.Range['A' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k - 1)) + IntToStr(i)].Borders[xlEdgeTop].LineStyle := xlContinuous;
   sheet.Range['A' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k - 1)) + IntToStr(i)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
   sheet.Range['A' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i)].Borders[xlLeft].LineStyle := xlContinuous;

   sheet.Range['F' + IntToStr(inicio) + ':' + DMCNT.NombreLetra(IntToStr(k - 1)) + IntToStr(i - 1)].NumberFormat := '###,###,##0.00';
   sheet.Range['A1:A' + IntToStr(i - 1)].NumberFormat := '@';
   sheet.Range['B1:B' + IntToStr(i - 1)].NumberFormat := '@';

   i := 8;
   sheet.Range['A' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i + 1)].Font.Bold := True;
   sheet.cells[i, (k - 1)] := 'TOTAL DEVENGADO';
   sheet.Range[DMCNT.NombreLetra(IntToStr(k - 1)) + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k - 1)) + IntToStr(i + 1)].Merge(EmptyParam);
   sheet.Range[DMCNT.NombreLetra(IntToStr(k - 1)) + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k - 1)) + IntToStr(i + 1)].Borders[xlEdgeTop].LineStyle := xlContinuous;
   sheet.Range[DMCNT.NombreLetra(IntToStr(k - 1)) + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k - 1)) + IntToStr(i + 1)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
   sheet.Range[DMCNT.NombreLetra(IntToStr(k - 1)) + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i + 1)].Borders[xlLeft].LineStyle := xlContinuous;
   sheet.cells[i, (k)] := 'TOTAL DEVENGAR';
   sheet.Range[DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i + 1)].Merge(EmptyParam);
   sheet.Range[DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i + 1)].Borders[xlEdgeTop].LineStyle := xlContinuous;
   sheet.Range[DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i + 1)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
   sheet.Range[DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k + 1)) + IntToStr(i + 1)].Borders[xlLeft].LineStyle := xlContinuous;
   DMCNT.cdsQry.First;
   i := 10;
   z := 0;
   While Not DMCNT.cdsQry.Eof Do
   Begin
      sheet.cells[i, k - 1] := '=SUM(' + DMCNT.NombreLetra('6') + IntToStr(i) + ':' + DMCNT.NombreLetra('17') + IntToStr(i) + ')';
      sheet.Range['A' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k - 1)) + IntToStr(i)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
      sheet.Range['A' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i)].Borders[xlLeft].LineStyle := xlContinuous;
      Inc(i);
      Inc(z);
      DMCNT.cdsQry.Next;
   End;
   DMCNT.cdsQry.First;
   i := 10;
   While Not DMCNT.cdsQry.Eof Do
   Begin
      sheet.cells[i, k] := DMCNT.FRound((xmontot / z), 15, 2);
      sheet.Range['A' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k)) + IntToStr(i)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
      sheet.Range['A' + IntToStr(i) + ':' + DMCNT.NombreLetra(IntToStr(k + 1)) + IntToStr(i)].Borders[xlLeft].LineStyle := xlContinuous;
      Inc(i);
      DMCNT.cdsQry.Next;
   End;

End;

// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
Procedure TfDevengadoSeg.btnContabilizaClick(Sender: TObject);
Var
   xSQL, xperiodoDev, diaMesCalc, diaMesEmiCalc: String;
   xciaid, xtdiarid, xcntcomprob, xcntanomm, xcntlote, xcntglosa, xcnttcambio, xcntfcomp, xcntestado, xcntcuadre: String;
   xcntuser, xcntfreg, xcnthreg, xcntano, xcntmm, xcntdd, xcnttri, xcntsem, xcntss, xcntaatri, xcntaasem, xcntaass, xtmonid: String;
   xtdiardes, xcntdebemn, xcntdebeme, xcnthabemn, xcnthabeme, xcntsaldmn, xcntsaldme, xdocmod, xmodulo: String;
   XCNTMTOLOC, XCNTMTOEXT, XCTAABR, XDOCABR: String;
   xcantidad, xcontador: Integer;
   xmtooriTotal, xmtolocTotal, xmtoextTotal,xOri,xLoc,xExt: Double;
   xCentroCosto : String;
   xPeriodoCnt : String;
   xPeriodoAct : String;
   xconteo : Integer;
Begin
   Screen.Cursor := crHourGlass;
   xperiodoDev := edtano.Text + FormatFloat('00', StrToInt(edtMes.Text));
   xPeriodoCnt := edtanocnt.Text + FormatFloat('00', StrToInt(edtMescnt.Text));
   xPeriodoAct := InttoStr(YearOf(Now))+ formatfloat('00',MonthOf(Now)) ;

   xCentroCosto:= '';
   If (StrToInt(xPeriodoCnt) < StrToInt(xperiodoDev)) Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('El periodo a contabilizar no es correcto');
      exit;
   End;

   If (StrToInt(xPeriodoCnt) > StrToInt(xPeriodoAct))  Then
   Begin
      ShowMessage('No se puede contabilizar periodos futuros');
      Screen.Cursor := crDefault;
      exit;
   End;

   //periodo a contabilizar vs fecha actual
   xSQL := 'SELECT  PER' + FormatFloat('00', StrToInt(edtMescnt.Text))
      + ' AS PERIODO FROM TGE154 WHERE CIAID=''' + dbeCIA.Text + ''''
      + 'AND MODULO=''CNT'' '
      + 'AND ANO=''' + inttostr(YearOf(Now))
      + '''';
   DMCNT.cdsQry.close;
   DMCNT.cdsQry.datarequest(xSQL);
   DMCNT.cdsQry.open;

   If DMCNT.cdsQry.FieldByName('PERIODO').asstring = 'S' Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('El periodo a contabilizar se encuentra cerrado');
      exit;
   End;
   If (StrToInt(xPeriodoAct) > StrToInt(xPeriodoCnt)) Then
   Begin
      diaMesCalc := DMCNT.UltDiaMes(edtanocnt.Text + FormatFloat('00', StrToInt(edtMescnt.Text)));
   End
   Else
   Begin
      diaMesCalc := DateToStr(date);
   End;

   If (StrToInt(xPeriodoAct) > StrToInt(xperiodoDev)) Then
   Begin
      diaMesEmiCalc := DMCNT.UltDiaMes(edtano.Text + FormatFloat('00', StrToInt(edtMes.Text)));
   End
   Else
   Begin
      diaMesEmiCalc := DateToStr(date);
   End;
   xconteo :=0;
   DMCNT.cdsQry5.First;
   While Not DMCNT.cdsQry5.Eof Do
   Begin
     If DMCNT.cdsQry5.FieldByName('MARCA').AsString = 'S' Then
     Begin
      //consulta si se puede contabilizar

   xSQL := 'select segmovid, cptoiddet, cuentaiddet, dcpregdet, cptoid, cpanomes,'
      + ' dcpanomm, clauxid, prov, docid, cpserie, cpnodoc, dcpglosa, cpobs, ccosid, tmonid,'
      + ' cptcampr, cpmtopromesori, cpmtopromesloc, cpmtopromesext, cpsalori, cpsalloc, cpsalext,'
      + ' montot, fecreg, flgcnt from cnt_dev_seg_mov where '
      + ' CPANOMES=' + quotedstr(xperiodoDev)
      + ' and DCPANOMM=' + quotedstr(dbePeriodo.Text)
      + ' and DCPREGDET=' + quotedstr(DMCNT.cdsQry5.FieldByName('DCPREG').AsString)
      + ' and DOCID=' + quotedstr(DMCNT.cdsQry5.FieldByName('DOCID').AsString)
      + ' and CPSERIE=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPSERIE').AsString)
      + ' and CPNODOC=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPNODOC').AsString)
      + ' and CLAUXID=' + quotedstr(DMCNT.cdsQry5.FieldByName('CLAUXID').AsString);
         Try
            DMCNT.cdsQry8.close;
            DMCNT.cdsQry8.DataRequest(xSQL);
            DMCNT.cdsQry8.Open;
         Except
            Screen.Cursor := crDefault;
            ShowMessage('Error al obtener los datos del devengue');
            exit;
         End;
         If (DMCNT.cdsQry8.RecordCount = 0) Then
         Begin
            Screen.Cursor := crDefault;
            ShowMessage('El periodo a contabilizar No está devengado');
            exit;
         End;

            //verificando que no este previamente contabilizado

         xSQL := 'select distinct(flgcnt) estado from cnt_dev_seg_mov where '
            + ' CPANOMES=' + quotedstr(xperiodoDev)
            + ' and DCPANOMM=' + quotedstr(dbePeriodo.Text)
            + ' and DCPREGDET=' + quotedstr(DMCNT.cdsQry5.FieldByName('DCPREG').AsString)
            + ' and DOCID=' + quotedstr(DMCNT.cdsQry5.FieldByName('DOCID').AsString)
            + ' and CPSERIE=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPSERIE').AsString)
            + ' and CPNODOC=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPNODOC').AsString)
            + ' and CLAUXID=' + quotedstr(DMCNT.cdsQry5.FieldByName('CLAUXID').AsString);
         Try
            DMCNT.cdsQry.close;
            DMCNT.cdsQry.DataRequest(xSQL);
            DMCNT.cdsQry.Open;
         Except
            Screen.Cursor := crDefault;
            ShowMessage('Error al obtener el estado del devengue');
            exit;
         End;
         If (DMCNT.cdsQry.FieldByName('estado').AsString <> 'N') Then
         Begin
            Screen.Cursor := crDefault;
            ShowMessage('El periodo ya se encuentra contabilizado');
            exit;
         End;

         If (copy(DMCNT.cdsQry5.FieldByName('CPTOID').AsString, 1, 3) <> '166') Then
         Begin
                //obtener datos a almacenar

            xciaid := dbeCIA.Text;
            xtdiarid := '22';
            xcntanomm := edtano.Text + FormatFloat('00', StrToInt(edtMescnt.Text));

                //obtener numero comprobante

            xSQL := 'Select nvl(max(CNTCOMPROB),''0'') as NUMERO '
               + '       from CNT300 '
               + '      where CIAID=' + quotedstr(xciaid)
               + '        and TDIARID=' + quotedstr(xtdiarid)
               + '        and CNTANOMM=' + quotedstr(xcntanomm);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al obtener la fecha del devengue');
               exit;
            End;
            xcntcomprob := DMCNT.StrZero(IntToStr((StrToInt(DMCNT.cdsQry.fieldbyname('NUMERO').AsString) + 1)), 10);
            xcntlote := '';
            xcntglosa := DMCNT.cdsQry5.FieldByName('DCPGLOSA').AsString;

                //asigna fecha calculada a la fecha de comprobante
            xcntfcomp := diaMesCalc;

                //obtener el tipo de cambio según sea la fecha del devengue

            xSQL := 'select TCAMVBV from TGE107 where fecha=' + quotedstr(xcntfcomp);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al generar los datos del Reporte Mensual del Devengado de Seguro');
               exit;
            End;
            xcnttcambio := DMCNT.cdsQry.fieldbyname('TCAMVBV').AsString;
            If (length(xcnttcambio) = 0) Then
            Begin
               Screen.Cursor := crDefault;
               ShowMessage('Tipo de cambio no registrado');
               exit;
            End;
            xcntestado := 'I';
            xcntcuadre := 'N';
            xcntuser := DMCNT.wUsuario;
            xcntfreg := 'TRUNC(SYSDATE)';
            xcnthreg := 'SYSDATE';

            xSQL := ' select fecano, fecmes, fecdia, fectrim, fecsem, fecss, fecaatri, fecaasem, fecaass  from TGE114 where fecha=' + quotedstr(xcntfcomp);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al obtener los campos de fechas');
               exit;
            End;
            xcntano := DMCNT.cdsQry.fieldbyname('fecano').AsString;
            xcntmm := DMCNT.cdsQry.fieldbyname('fecmes').AsString;
            xcntdd := DMCNT.cdsQry.fieldbyname('fecdia').AsString;
            xcnttri := DMCNT.cdsQry.fieldbyname('fectrim').AsString;
            xcntsem := DMCNT.cdsQry.fieldbyname('fecsem').AsString;
            xcntss := DMCNT.cdsQry.fieldbyname('fecss').AsString;
            xcntaatri := DMCNT.cdsQry.fieldbyname('fecaatri').AsString;
            xcntaasem := DMCNT.cdsQry.fieldbyname('fecaasem').AsString;
            xcntaass := DMCNT.cdsQry.fieldbyname('fecaass').AsString;

            xSQL := '  SELECT TIPMON FROM CNT_DEV_SEG_CAB WHERE'
              + ' CIAID=' + quotedstr(dbeCIA.Text)
              + ' AND CPTOID=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPTOID').AsString);
            Try
              DMCNT.cdsQry.close;
              DMCNT.cdsQry.DataRequest(xSQL);
              DMCNT.cdsQry.Open;
            Except
              ShowMessage('Error al generar obtener la fecha inicio vigencia de Seguro');
              exit;
            End;

            xtmonid :=  DMCNT.cdsQry.fieldbyname('TIPMON').AsString;

                //obtener la descripción del  tipo diario

            xSQL := ' select tdiardes from TGE104 where tdiarid=' + quotedstr(xtdiarid);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al obtener la descripción del tipo de diario');
               exit;
            End;
            xtdiardes := DMCNT.cdsQry.FieldByName('tdiardes').AsString;

            xmtooriTotal := 0;
            xmtolocTotal := 0;
            xmtoextTotal := 0;
            While Not DMCNT.cdsQry8.Eof Do
            Begin

               xmtooriTotal := xmtooriTotal + DMCNT.cdsQry8.FieldByName('CPMTOPROMESORI').AsFloat;
               xmtolocTotal := xmtolocTotal + DMCNT.cdsQry8.FieldByName('CPMTOPROMESLOC').AsFloat;
               xmtoextTotal := xmtoextTotal + DMCNT.cdsQry8.FieldByName('CPMTOPROMESEXT').AsFloat;
               DMCNT.cdsQry8.Next;
            End;
                //regresar el cdsQry8 al inicio para el proceso de detalle
            DMCNT.cdsQry8.First;

            xcntsaldmn := '0';
            xcntsaldme := '0';
            xdocmod := 'CNT';
            xmodulo := 'CNT';

                //se graba en cabecera de la contabilización

            xSQL := 'Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
               + '                    CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
               + '                    CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
               + '                    CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, '
               + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
               + '                    CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) VALUES ('
               + quotedstr(xciaid) + ','
               + quotedstr(xtdiarid) + ','
               + quotedstr(xcntcomprob) + ','
               + quotedstr(xcntanomm) + ','
               + quotedstr(xcntlote) + ','
               + quotedstr(xcntglosa) + ','
               + quotedstr(xcnttcambio) + ','
               + quotedstr(xcntfcomp) + ','
               + quotedstr(xcntestado) + ','
               + quotedstr(xcntcuadre) + ','
               + 'NULL,'
               + quotedstr(xcntuser) + ','
               + xcntfreg + ','
               + xcnthreg + ','
               + quotedstr(xcntano) + ','
               + quotedstr(xcntmm) + ','
               + quotedstr(xcntdd) + ','
               + quotedstr(xcnttri) + ','
               + quotedstr(xcntsem) + ','
               + quotedstr(xcntss) + ','
               + quotedstr(xcntaatri) + ','
               + quotedstr(xcntaasem) + ','
               + quotedstr(xcntaass) + ','
               + quotedstr(xtmonid) + ','
               + 'NULL,'
               + 'NULL,'
               + 'NULL,'
               + quotedstr(xtdiardes) + ','
               + quotedstr(FloatToStr(xmtolocTotal)) + ',' //  xcntdebemn
               + quotedstr(FloatToStr(xmtoextTotal)) + ',' //  xcntdebeme
               + quotedstr(FloatToStr(xmtolocTotal)) + ',' //xcnthabemn
               + quotedstr(FloatToStr(xmtoextTotal)) + ',' //xcnthabeme
               + quotedstr(xcntsaldmn) + ','
               + quotedstr(xcntsaldme) + ','
               + 'NULL,'
               + quotedstr(xdocmod) + ','
               + quotedstr(xmodulo) + ')';
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Except
               ShowMessage('No se pudo Grabar cabecera de la contabilización');
               Screen.Cursor := crDefault;
               exit;
            End;

         End
         Else //el concepto de pago empieza con 166
         Begin
                 //obtener datos a almacenar en la compañía igual a los 2 últimos digitos del concepto

            xciaid := copy(DMCNT.cdsQry5.FieldByName('CPTOID').AsString, 4, 2);
            xtdiarid := '22';
            xcntanomm := edtano.Text + FormatFloat('00', StrToInt(edtMescnt.Text));

                //obtener numero comprobante

            xSQL := 'Select nvl(max(CNTCOMPROB),''0'') as NUMERO '
               + '       from CNT300 '
               + '      where CIAID=' + quotedstr(xciaid)
               + '        and TDIARID=' + quotedstr(xtdiarid)
               + '        and CNTANOMM=' + quotedstr(xcntanomm);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al obtener la fecha del devengue');
               exit;
            End;
            xcntcomprob := DMCNT.StrZero(IntToStr((StrToInt(DMCNT.cdsQry.fieldbyname('NUMERO').AsString) + 1)), 10);
            xcntlote := '';
            xcntglosa := DMCNT.cdsQry5.FieldByName('DCPGLOSA').AsString;

                //asigna fecha calculada a la fecha de comprobante

            xcntfcomp := diaMesCalc;

                //obtener el tipo de cambio según sea la fecha del devengue

            xSQL := 'select TCAMVBV from TGE107 where fecha=' + quotedstr(xcntfcomp);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al generar los datos del Reporte Mensual del Devengado de Seguro');
               exit;
            End;
            xcnttcambio := DMCNT.cdsQry.fieldbyname('TCAMVBV').AsString;
            If (length(xcnttcambio) = 0) Then
            Begin
               Screen.Cursor := crDefault;
               ShowMessage('Tipo de cambio no registrado');
               exit;
            End;
            xcntestado := 'I';
            xcntcuadre := 'N';
            xcntuser := DMCNT.wUsuario;
            xcntfreg := 'TRUNC(SYSDATE)';
            xcnthreg := 'SYSDATE';

            xSQL := ' select fecano, fecmes, fecdia, fectrim, fecsem, fecss, fecaatri, fecaasem, fecaass  from TGE114 where fecha=' + quotedstr(xcntfcomp);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al obtener los campos de fechas');
               exit;
            End;
            xcntano := DMCNT.cdsQry.fieldbyname('fecano').AsString;
            xcntmm := DMCNT.cdsQry.fieldbyname('fecmes').AsString;
            xcntdd := DMCNT.cdsQry.fieldbyname('fecdia').AsString;
            xcnttri := DMCNT.cdsQry.fieldbyname('fectrim').AsString;
            xcntsem := DMCNT.cdsQry.fieldbyname('fecsem').AsString;
            xcntss := DMCNT.cdsQry.fieldbyname('fecss').AsString;
            xcntaatri := DMCNT.cdsQry.fieldbyname('fecaatri').AsString;
            xcntaasem := DMCNT.cdsQry.fieldbyname('fecaasem').AsString;
            xcntaass := DMCNT.cdsQry.fieldbyname('fecaass').AsString;
							 

            xSQL := '  SELECT TIPMON FROM CNT_DEV_SEG_CAB WHERE'
              + ' CIAID=' + quotedstr(dbeCIA.Text)
              + ' AND CPTOID=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPTOID').AsString);
            Try
              DMCNT.cdsQry.close;
              DMCNT.cdsQry.DataRequest(xSQL);
              DMCNT.cdsQry.Open;
            Except
              ShowMessage('Error al generar obtener la fecha inicio vigencia de Seguro');
              exit;
            End;

            xtmonid :=  DMCNT.cdsQry.fieldbyname('TIPMON').AsString;

                //obtener la descripción del  tipo diario

            xSQL := ' select tdiardes from TGE104 where tdiarid=' + quotedstr(xtdiarid);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al obtener la descripción del tipo de diario');
               exit;
            End;
            xtdiardes := DMCNT.cdsQry.FieldByName('tdiardes').AsString;

            xmtooriTotal := 0;
            xmtolocTotal := 0;
            xmtoextTotal := 0;
            While Not DMCNT.cdsQry8.Eof Do
            Begin
               xmtooriTotal := xmtooriTotal + DMCNT.cdsQry8.FieldByName('CPMTOPROMESORI').AsFloat;
               xmtolocTotal := xmtolocTotal + DMCNT.cdsQry8.FieldByName('CPMTOPROMESLOC').AsFloat;
               xmtoextTotal := xmtoextTotal + DMCNT.cdsQry8.FieldByName('CPMTOPROMESEXT').AsFloat;
               DMCNT.cdsQry8.Next;
            End;
                //regresar el cdsQry8 al inicio para el proceso de detalle
            DMCNT.cdsQry8.First;

            xcntsaldmn := '0';
            xcntsaldme := '0';
            xdocmod := 'CNT';
            xmodulo := 'CNT';
                // validar que sea la primera contabilización
            xSQL := 'select COUNT(segmovid) contabilizado from db2admin.CNT_DEV_SEG_MOV where '
               + ' CIAID=' + quotedstr(dbeCIA.Text)
               + ' and DCPANOMM=' + quotedstr(dbePeriodo.Text)
               + ' and DCPREGDET=' + quotedstr(DMCNT.cdsQry5.FieldByName('DCPREG').AsString)
               + ' and DOCID=' + quotedstr(DMCNT.cdsQry5.FieldByName('DOCID').AsString)
               + ' and CPSERIE=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPSERIE').AsString)
               + ' and CPNODOC=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPNODOC').AsString)
               + ' and CLAUXID=' + quotedstr(DMCNT.cdsQry5.FieldByName('CLAUXID').AsString)
               + ' and cntcomprob is not null';
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al validar primera contabilización');
               exit;
            End;

            If (StrToInt(DMCNT.cdsQry.fieldbyname('contabilizado').AsString) = 0) Then
            Begin
                //se graba en cabecera de la contabilización
               If (xtmonid = 'N') Then
               Begin
                  xmtooriTotal := DMCNT.cdsQry8.FieldByName('MONTOT').AsFloat;
                  xmtolocTotal := DMCNT.cdsQry8.FieldByName('MONTOT').AsFloat;
                  xmtoextTotal := DMCNT.FRound((DMCNT.cdsQry8.FieldByName('MONTOT').AsFloat / StrToFloat(xcnttcambio)), 15, 2);
               End
               Else
               Begin
                  xmtooriTotal := DMCNT.FRound((DMCNT.cdsQry8.FieldByName('MONTOT').AsFloat * StrToFloat(xcnttcambio)), 15, 2);
                  xmtolocTotal := DMCNT.FRound((DMCNT.cdsQry8.FieldByName('MONTOT').AsFloat * StrToFloat(xcnttcambio)), 15, 2);
                  xmtoextTotal := DMCNT.cdsQry8.FieldByName('MONTOT').AsFloat;
               End;


               xSQL := 'Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
                  + '                    CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
                  + '                    CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
                  + '                    CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
                  + '                    CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) VALUES ('
                  + quotedstr(xciaid) + ','
                  + quotedstr(xtdiarid) + ','
                  + quotedstr(xcntcomprob) + ','
                  + quotedstr(xcntanomm) + ','
                  + quotedstr(xcntlote) + ','
                  + quotedstr(xcntglosa) + ','
                  + quotedstr(xcnttcambio) + ','
                  + quotedstr(xcntfcomp) + ','
                  + quotedstr(xcntestado) + ','
                  + quotedstr(xcntcuadre) + ','
                  + 'NULL,'
                  + quotedstr(xcntuser) + ','
                  + xcntfreg + ','
                  + xcnthreg + ','
                  + quotedstr(xcntano) + ','
                  + quotedstr(xcntmm) + ','
                  + quotedstr(xcntdd) + ','
                  + quotedstr(xcnttri) + ','
                  + quotedstr(xcntsem) + ','
                  + quotedstr(xcntss) + ','
                  + quotedstr(xcntaatri) + ','
                  + quotedstr(xcntaasem) + ','
                  + quotedstr(xcntaass) + ','
                  + quotedstr(xtmonid) + ','
                  + 'NULL,'
                  + 'NULL,'
                  + 'NULL,'
                  + quotedstr(xtdiardes) + ','
                  + quotedstr(FloatToStr(xmtolocTotal)) + ','
                  + quotedstr(FloatToStr(xmtoextTotal)) + ','
                  + quotedstr(FloatToStr(xmtolocTotal)) + ','
                  + quotedstr(FloatToStr(xmtoextTotal)) + ','
                  + quotedstr(xcntsaldmn) + ','
                  + quotedstr(xcntsaldme) + ','
                  + 'NULL,'
                  + quotedstr(xdocmod) + ','
                  + quotedstr(xmodulo) + ')';
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo Grabar cabecera de la contabilización');
                  Screen.Cursor := crDefault;
                  exit;
               End;
               xSQL := 'INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) VALUES ( '
                  + quotedstr(xciaid) + ','
                  + quotedstr(xtdiarid) + ','
                  + quotedstr(xcntcomprob) + ','
                  + quotedstr(xcntano) + ','
                  + quotedstr(xcntanomm) + ','
                  + quotedstr(xcntlote) + ','
                  + quotedstr('46602') + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('CLAUXID').AsString) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('PROV').AsString) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('DOCID').AsString) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('CPSERIE').AsString) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('CPNODOC').AsString) + ','
                  + quotedstr(copy(xcntglosa, 1, 40)) + ','
                  + quotedstr('H') + ','
                  + quotedstr('') + ','
                  + quotedstr(xcnttcambio) + ','
                  + quotedstr(DMCNT.cdsQry5.FieldByName('DCPMOORI').AsString) + ','
                  + quotedstr(DMCNT.cdsQry5.FieldByName('DCPMOORI').AsString) + ',' //CNTMTOLOC
                  + quotedstr(DMCNT.cdsQry5.FieldByName('DCPMOEXT').AsString) + ',' //CNTMTOEXT
                  + quotedstr(DMCNT.cdsQry6.FieldByName('CPFEMIS').AsString) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('CPFVCMTO').AsString) + ','
                  + quotedstr(xcntfcomp) + ',' //CNTFCOMP
                  + quotedstr('I') + ',' //CNTESTADO
                  + quotedstr('N') + ',' //CNTCUADRE
                  + quotedstr('N') + ',' //CNTFAUTOM
                  + quotedstr(xcntuser) + ','
                  + xcntfreg + ','
                  + xcnthreg + ','
                  + quotedstr(xcntmm) + ','
                  + quotedstr(xcntdd) + ','
                  + quotedstr(xcnttri) + ','
                  + quotedstr(xcntsem) + ','
                  + quotedstr(xcntss) + ','
                  + quotedstr(xcntaatri) + ','
                  + quotedstr(xcntaasem) + ','
                  + quotedstr(xcntaass) + ','
                  + quotedstr(xtmonid) + ','
                  + 'NULL,'
                  + 'NULL,'
                  + 'NULL,'
                  + quotedstr(xtdiardes) + ','
                  + quotedstr(XCTAABR) + ','
                  + quotedstr(copy(DMCNT.cdsQry6.FieldByName('PROVDES').AsString, 1, 15)) + ','
                  + quotedstr(XDOCABR) + ','
                  + 'NULL,'
                  + quotedstr('0.00') + ',' //CNTDEBEMN
                  + quotedstr('0.00') + ',' //CNTDEBEME
                  + quotedstr(DMCNT.cdsQry5.FieldByName('DCPMOORI').AsString) + ',' //CNTHABEMN
                  + quotedstr(DMCNT.cdsQry5.FieldByName('DCPMOEXT').AsString) + ',' //CNTHABEME
                  + 'NULL,' //CNTSALDMN
                  + 'NULL,' //CNTSALDME
                  + 'NULL,' //CAMPOVAR
                  + 'NULL,' //CNTTS
                  + 'NULL,' //CNTPAGADO
                  + quotedstr('CNT') + ',' //CNTMODDOC
                  + quotedstr('2') + ',' //CNTREG
                  + quotedstr('CNT') + ',' //MODULO
                  + 'NULL' //CTA_SECU
                  + ')';
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo Grabar el Debe (detalle) del devengado generado');
                  Screen.Cursor := crDefault;
                  exit;
               End;

               xSQL := ' select CTA_CCOS from TGE202 where ciaid=' + quotedstr(xciaid) + 'and cuentaid=' + quotedstr(DMCNT.cdsQry6.FieldByName('ctagasid').AsString);
               Try
                  DMCNT.cdsQry.close;
                  DMCNT.cdsQry.DataRequest(xSQL);
                  DMCNT.cdsQry.Open;
               Except
                  Screen.Cursor := crDefault;
                  ShowMessage('Error al obtener si tiene Centro de Costo');
                  exit;
               End;
               IF DMCNT.cdsQry.FieldByName('CTA_CCOS').AsString='S' THEN
               BEGIN
                  xCentroCosto:= DMCNT.cdsQry8.FieldByName('CCOSID').AsString;
               END
               ELSE
               BEGIN
                  xCentroCosto:= '';
               END;

               xSQL := 'INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) VALUES ( '
                  + quotedstr(xciaid) + ','
                  + quotedstr(xtdiarid) + ','
                  + quotedstr(xcntcomprob) + ','
                  + quotedstr(xcntano) + ','
                  + quotedstr(xcntanomm) + ','
                  + quotedstr(xcntlote) + ','
                  + quotedstr(xtipseguro) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('CLAUXID').AsString) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('PROV').AsString) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('DOCID').AsString) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('CPSERIE').AsString) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('CPNODOC').AsString) + ','
                  + quotedstr(copy(xcntglosa, 1, 40)) + ','
                  + quotedstr('D') + ','
      //          + quotedstr('') + ','
                  + quotedstr(xCentroCosto) + ','
                  + quotedstr(xcnttcambio) + ','
                  + quotedstr(DMCNT.cdsQry5.FieldByName('DCPMOORI').AsString) + ','
                  + quotedstr(DMCNT.cdsQry5.FieldByName('DCPMOORI').AsString) + ',' //CNTMTOLOC
                  + quotedstr(DMCNT.cdsQry5.FieldByName('DCPMOEXT').AsString) + ',' //CNTMTOEXT
                  + quotedstr(diaMesEmiCalc) + ','
                  + quotedstr(diaMesEmiCalc) + ','
                  + quotedstr(xcntfcomp) + ',' //CNTFCOMP
                  + quotedstr('I') + ',' //CNTESTADO
                  + quotedstr('N') + ',' //CNTCUADRE
                  + quotedstr('N') + ',' //CNTFAUTOM
                  + quotedstr(xcntuser) + ','
                  + xcntfreg + ','
                  + xcnthreg + ','
                  + quotedstr(xcntmm) + ','
                  + quotedstr(xcntdd) + ','
                  + quotedstr(xcnttri) + ','
                  + quotedstr(xcntsem) + ','
                  + quotedstr(xcntss) + ','
                  + quotedstr(xcntaatri) + ','
                  + quotedstr(xcntaasem) + ','
                  + quotedstr(xcntaass) + ','
                  + quotedstr(xtmonid) + ','
                  + 'NULL,'
                  + 'NULL,'
                  + 'NULL,'
                  + quotedstr(xtdiardes) + ','
                  + quotedstr(XCTAABR) + ','
                  + quotedstr(copy(DMCNT.cdsQry6.FieldByName('PROVDES').AsString, 1, 15)) + ','
                  + quotedstr(XDOCABR) + ','
                  + 'NULL,'
                  + quotedstr(DMCNT.cdsQry5.FieldByName('DCPMOORI').AsString) + ',' //CNTDEBEMN
                  + quotedstr(DMCNT.cdsQry5.FieldByName('DCPMOEXT').AsString) + ',' //CNTDEBEME
                  + quotedstr('0.00') + ',' //CNTHABEMN
                  + quotedstr('0.00') + ',' //CNTHABEME
                  + 'NULL,' //CNTSALDMN
                  + 'NULL,' //CNTSALDME
                  + 'NULL,' //CAMPOVAR
                  + 'NULL,' //CNTTS
                  + 'NULL,' //CNTPAGADO
                  + quotedstr('CNT') + ',' //CNTMODDOC
                  + quotedstr('1') + ',' //CNTREG
                  + quotedstr('CNT') + ',' //MODULO
                  + 'NULL' //CTA_SECU
                  + ')';
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo Grabar el Debe (detalle) del devengado generado');
                  Screen.Cursor := crDefault;
                  exit;
               End;
            End;
                  //grabar segunda cabecera
                  //obtener numero comprobante
            xmtooriTotal := 0;
            xmtolocTotal := 0;
            xmtoextTotal := 0;
            DMCNT.cdsQry8.First;
            While Not DMCNT.cdsQry8.Eof Do
            Begin

               xmtooriTotal := xmtooriTotal + DMCNT.cdsQry8.FieldByName('CPMTOPROMESORI').AsFloat;
               xmtolocTotal := xmtolocTotal + DMCNT.cdsQry8.FieldByName('CPMTOPROMESLOC').AsFloat;
               xmtoextTotal := xmtoextTotal + DMCNT.cdsQry8.FieldByName('CPMTOPROMESEXT').AsFloat;
               DMCNT.cdsQry8.Next;
            End;

            xSQL := 'Select nvl(max(CNTCOMPROB),''0'') as NUMERO '
               + '       from CNT300 '
               + '      where CIAID=' + quotedstr(xciaid)
               + '        and TDIARID=' + quotedstr(xtdiarid)
               + '        and CNTANOMM=' + quotedstr(xcntanomm);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al obtener la fecha del devengue');
               exit;
            End;
            xcntcomprob := DMCNT.StrZero(IntToStr((StrToInt(DMCNT.cdsQry.fieldbyname('NUMERO').AsString) + 1)), 10);

                  //se graba en cabecera de la contabilización la compañía igual a los 2 últimos dígitos

            xSQL := 'Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
               + '                    CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
               + '                    CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
               + '                    CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, '
               + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
               + '                    CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) VALUES ('
               + quotedstr(xciaid) + ','
               + quotedstr(xtdiarid) + ','
               + quotedstr(xcntcomprob) + ','
               + quotedstr(xcntanomm) + ','
               + quotedstr(xcntlote) + ','
               + quotedstr(xcntglosa) + ','
               + quotedstr(xcnttcambio) + ','
               + quotedstr(xcntfcomp) + ','
               + quotedstr(xcntestado) + ','
               + quotedstr(xcntcuadre) + ','
               + 'NULL,'
               + quotedstr(xcntuser) + ','
               + xcntfreg + ','
               + xcnthreg + ','
               + quotedstr(xcntano) + ','
               + quotedstr(xcntmm) + ','
               + quotedstr(xcntdd) + ','
               + quotedstr(xcnttri) + ','
               + quotedstr(xcntsem) + ','
               + quotedstr(xcntss) + ','
               + quotedstr(xcntaatri) + ','
               + quotedstr(xcntaasem) + ','
               + quotedstr(xcntaass) + ','
               + quotedstr(xtmonid) + ','
               + 'NULL,'
               + 'NULL,'
               + 'NULL,'
               + quotedstr(xtdiardes) + ','
               + quotedstr(FloatToStr(xmtolocTotal)) + ','
               + quotedstr(FloatToStr(xmtoextTotal)) + ','
               + quotedstr(FloatToStr(xmtolocTotal)) + ','
               + quotedstr(FloatToStr(xmtoextTotal)) + ','
               + quotedstr(xcntsaldmn) + ','
               + quotedstr(xcntsaldme) + ','
               + 'NULL,'
               + quotedstr(xdocmod) + ','
               + quotedstr(xmodulo) + ')';
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Except
               ShowMessage('No se pudo Grabar cabecera de la contabilización');
               Screen.Cursor := crDefault;
               exit;
            End;

            xSQL := ' select CTAABR from TGE202 where ciaid=' + quotedstr(xciaid) + 'and cuentaid=' + quotedstr(xtipseguro);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al obtener la descripción del tipo de diario');
               exit;
            End;
            XCTAABR := DMCNT.cdsQry.FieldByName('CTAABR').AsString;
            xSQL := ' select DOCABR from TGE110 where DOCID=' + quotedstr(DMCNT.cdsQry6.FieldByName('DOCID').AsString);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al obtener la descripción del tipo de diario');
               exit;
            End;
            XDOCABR := DMCNT.cdsQry.FieldByName('DOCABR').AsString;

            xcontador := 2;

                    //regresar el cdsQry8 al inicio para el proceso de detalle
            DMCNT.cdsQry8.First;


            xSQL := '  SELECT TIPMON FROM CNT_DEV_SEG_CAB WHERE'
              + ' CIAID=' + quotedstr(dbeCIA.Text)
              + ' AND CPTOID=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPTOID').AsString);
            Try
              DMCNT.cdsQry.close;
              DMCNT.cdsQry.DataRequest(xSQL);
              DMCNT.cdsQry.Open;
            Except
              ShowMessage('Error al generar obtener la fecha inicio vigencia de Seguro');
              exit;
            End;

            xtmonid :=  DMCNT.cdsQry.fieldbyname('TIPMON').AsString;

            //grabar detalle de la contabilización (Debe)

            xSQL := ' select CTAABR from TGE202 where ciaid=' + quotedstr(xciaid) + 'and cuentaid=' + quotedstr(DMCNT.cdsQry6.FieldByName('CTATOTAL').AsString);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al obtener la descripción del tipo de diario');
               exit;
            End;
            XCTAABR := DMCNT.cdsQry.FieldByName('CTAABR').AsString;

            xSQL := ' select CTA_CCOS from TGE202 where ciaid=' + quotedstr(xciaid) + 'and cuentaid=' + quotedstr(DMCNT.cdsQry6.FieldByName('ctagasid').AsString);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al obtener si tiene Centro de Costo');
               exit;
            End;
            IF DMCNT.cdsQry.FieldByName('CTA_CCOS').AsString='S' THEN
            BEGIN
               xCentroCosto:= DMCNT.cdsQry8.FieldByName('CCOSID').AsString;
            END
            ELSE
            BEGIN
               xCentroCosto:= '';
            END;

            xSQL := 'INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
               + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
               + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
               + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
               + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
               + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
               + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) VALUES ( '
               + quotedstr(xciaid) + ','
               + quotedstr(xtdiarid) + ','
               + quotedstr(xcntcomprob) + ','
               + quotedstr(xcntano) + ','
               + quotedstr(xcntanomm) + ','
               + quotedstr(xcntlote) + ','
               + quotedstr(DMCNT.cdsQry6.FieldByName('ctagasid').AsString) + ',' //DMCNT.cdsQry6.FieldByName('ctagasid').AsString
               + quotedstr(DMCNT.cdsQry6.FieldByName('CLAUXID').AsString) + ','
               + quotedstr(DMCNT.cdsQry6.FieldByName('PROV').AsString) + ','
               + quotedstr(DMCNT.cdsQry6.FieldByName('DOCID').AsString) + ','
               + quotedstr(DMCNT.cdsQry6.FieldByName('CPSERIE').AsString) + ','
               + quotedstr(DMCNT.cdsQry6.FieldByName('CPNODOC').AsString) + ','
               + quotedstr(copy(xcntglosa, 1, 40)) + ','
               + quotedstr('D') + ',' 
               + quotedstr(xCentroCosto) + ',' //DMCNT.cdsQry8.FieldByName('CCOSID').AsString
               + quotedstr(xcnttcambio) + ','
               + quotedstr(FloatToStr(DMCNT.FRound(xmtooriTotal, 15, 2))) + ',' //CNTMTOORI
               + quotedstr(FloatToStr(DMCNT.FRound(xmtolocTotal, 15, 2))) + ',' //CNTMTOLOC
               + quotedstr(FloatToStr(DMCNT.FRound(xmtoextTotal, 15, 2))) + ',' //CNTMTOEXT
               + quotedstr(diaMesEmiCalc) + ','
               + quotedstr(diaMesEmiCalc) + ','
               + quotedstr(xcntfcomp) + ',' //CNTFCOMP
               + quotedstr('I') + ',' //CNTESTADO
               + quotedstr('N') + ',' //CNTCUADRE
               + quotedstr('N') + ',' //CNTFAUTOM
               + quotedstr(xcntuser) + ','
               + xcntfreg + ','
               + xcnthreg + ','
               + quotedstr(xcntmm) + ','
               + quotedstr(xcntdd) + ','
               + quotedstr(xcnttri) + ','
               + quotedstr(xcntsem) + ','
               + quotedstr(xcntss) + ','
               + quotedstr(xcntaatri) + ','
               + quotedstr(xcntaasem) + ','
               + quotedstr(xcntaass) + ','
               + quotedstr(xtmonid) + ','
               + 'NULL,'
               + 'NULL,'
               + 'NULL,'
               + quotedstr(xtdiardes) + ','
               + quotedstr(XCTAABR) + ','
               + quotedstr(copy(DMCNT.cdsQry6.FieldByName('PROVDES').AsString, 1, 15)) + ','
               + quotedstr(XDOCABR) + ','
               + 'NULL,'
               + quotedstr(FloatToStr(DMCNT.FRound(xmtolocTotal, 15, 2))) + ',' //CNTDEBEMN
               + quotedstr(FloatToStr(DMCNT.FRound(xmtoextTotal, 15, 2))) + ',' //CNTDEBEME
               + quotedstr('0.00') + ',' //CNTHABEMN
               + quotedstr('0.00') + ',' //CNTHABEME
               + 'NULL,' //CNTSALDMN
               + 'NULL,' //CNTSALDME
               + 'NULL,' //CAMPOVAR
               + 'NULL,' //CNTTS
               + 'NULL,' //CNTPAGADO
               + quotedstr('CNT') + ',' //CNTMODDOC
               + quotedstr('1') + ',' //CNTREG
               + quotedstr('CNT') + ',' //MODULO
               + 'NULL' //CTA_SECU
               + ')';
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Except
               ShowMessage('No se pudo Grabar el Debe (detalle) del devengado generado');
               Screen.Cursor := crDefault;
               exit;
            End;

            xSQL := ' select CTA_CCOS from TGE202 where ciaid=' + quotedstr(xciaid) + 'and cuentaid=' + quotedstr(xtipseguro);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al obtener si tiene Centro de Costo');
               exit;
            End;
            IF DMCNT.cdsQry.FieldByName('CTA_CCOS').AsString='S' THEN
            BEGIN
               xCentroCosto:= DMCNT.cdsQry8.FieldByName('CCOSID').AsString;
            END
            ELSE
            BEGIN
               xCentroCosto:= '';
            END;

            //grabar detalle de la contabilización (Haber)
            xSQL := 'INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
               + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
               + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
               + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
               + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
               + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
               + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) VALUES ( '
               + quotedstr(xciaid) + ','
               + quotedstr(xtdiarid) + ','
               + quotedstr(xcntcomprob) + ','
               + quotedstr(xcntano) + ','
               + quotedstr(xcntanomm) + ','
               + quotedstr(xcntlote) + ','
               + quotedstr(xtipseguro) + ','
               + quotedstr(DMCNT.cdsQry6.FieldByName('CLAUXID').AsString) + ','
               + quotedstr(DMCNT.cdsQry6.FieldByName('PROV').AsString) + ','
               + quotedstr(DMCNT.cdsQry6.FieldByName('DOCID').AsString) + ','
               + quotedstr(DMCNT.cdsQry6.FieldByName('CPSERIE').AsString) + ','
               + quotedstr(DMCNT.cdsQry6.FieldByName('CPNODOC').AsString) + ','
               + quotedstr(copy(xcntglosa, 1, 40)) + ','
               + quotedstr('H') + ','
      //       + 'NULL,'
               + quotedstr(xCentroCosto) + ','
               + quotedstr(xcnttcambio) + ','
               + quotedstr(FloatToStr(DMCNT.FRound(xmtooriTotal, 15, 2))) + ',' //FloatToStr(xmtooriTotal)
               + quotedstr(FloatToStr(DMCNT.FRound(xmtolocTotal, 15, 2))) + ',' //CNTMTOLOC
               + quotedstr(FloatToStr(DMCNT.FRound(xmtoextTotal, 15, 2))) + ',' //CNTMTOEXT
               + quotedstr(diaMesEmiCalc) + ','
               + quotedstr(diaMesEmiCalc) + ','
               + quotedstr(xcntfcomp) + ',' //CNTFCOMP
               + quotedstr('I') + ',' //CNTESTADO
               + quotedstr('N') + ',' //CNTCUADRE
               + quotedstr('N') + ',' //CNTFAUTOM
               + quotedstr(xcntuser) + ','
               + xcntfreg + ','
               + xcnthreg + ','
               + quotedstr(xcntmm) + ','
               + quotedstr(xcntdd) + ','
               + quotedstr(xcnttri) + ','
               + quotedstr(xcntsem) + ','
               + quotedstr(xcntss) + ','
               + quotedstr(xcntaatri) + ','
               + quotedstr(xcntaasem) + ','
               + quotedstr(xcntaass) + ','
               + quotedstr(xtmonid) + ','
               + 'NULL,'
               + 'NULL,'
               + 'NULL,'
               + quotedstr(xtdiardes) + ','
               + quotedstr(XCTAABR) + ','
               + quotedstr(copy(DMCNT.cdsQry6.FieldByName('PROVDES').AsString, 1, 15)) + ','
               + quotedstr(XDOCABR) + ','
               + 'NULL,'
               + quotedstr('0.00') + ',' //CNTDEBEMN
               + quotedstr('0.00') + ',' //CNTDEBEME
               + quotedstr(FloatToStr(DMCNT.FRound(xmtolocTotal, 15, 2))) + ',' //CNTHABEMN
               + quotedstr(FloatToStr(DMCNT.FRound(xmtoextTotal, 15, 2))) + ',' //CNTHABEME
               + 'NULL,' //CNTSALDMN
               + 'NULL,' //CNTSALDME
               + 'NULL,' //CAMPOVAR
               + 'NULL,' //CNTTS
               + 'NULL,' //CNTPAGADO
               + quotedstr('CNT') + ',' //CNTMODDOC
               + quotedstr('2') + ',' //CNTREG
               + quotedstr('CNT') + ',' //MODULO
               + 'NULL' //CTA_SECU
               + ')';
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Except
               ShowMessage('No se pudo Grabar el Haber (detalle) del devengado generado');
               Screen.Cursor := crDefault;
               exit;
            End;
         End;

         If (copy(DMCNT.cdsQry5.FieldByName('CPTOID').AsString, 1, 3) <> '166') Then
         Begin
                //empieza el grabado del detalle de la contabilización

            xSQL := ' select CTAABR from TGE202 where ciaid=' + quotedstr(xciaid) + 'and cuentaid=' + quotedstr(xtipseguro);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al obtener la descripción del tipo de diario');
               exit;
            End;
            XCTAABR := DMCNT.cdsQry.FieldByName('CTAABR').AsString;
            xSQL := ' select DOCABR from TGE110 where DOCID=' + quotedstr(DMCNT.cdsQry6.FieldByName('DOCID').AsString);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al obtener la descripción del tipo de diario');
               exit;
            End;
            XDOCABR := DMCNT.cdsQry.FieldByName('DOCABR').AsString;

            If (xtmonid = 'N') Then
            Begin
               XCNTMTOLOC := FloatToStr(DMCNT.FRound((DMCNT.cdsQry5.FieldByName('DCPMOLOC').AsFloat / 12), 15, 2));
            End
            Else
            Begin
               XCNTMTOLOC := FloatToStr(DMCNT.FRound(((DMCNT.FRound((DMCNT.cdsQry5.FieldByName('DCPMOLOC').AsFloat / 12), 15, 2)) * (strToFloat(xcnttcambio))), 15, 2));
            End;
            If (xtmonid = 'D') Then
            Begin
               XCNTMTOEXT := FloatToStr(DMCNT.FRound((DMCNT.cdsQry5.FieldByName('DCPMOLOC').AsFloat / 12), 15, 2));
            End
            Else
            Begin
               XCNTMTOEXT := FloatToStr(DMCNT.FRound(((DMCNT.FRound((DMCNT.cdsQry5.FieldByName('DCPMOLOC').AsFloat / 12), 15, 2)) / (strToFloat(xcnttcambio))), 15, 2));
            End;

            xcontador := 2;
            xmtooriTotal := 0;
            xmtolocTotal := 0;
            xmtoextTotal := 0;
            While Not DMCNT.cdsQry8.Eof Do
            Begin
                   //grabar detalle de la contabilización (Debe)

               xSQL := ' select CTAABR from TGE202 where ciaid=' + quotedstr(xciaid) + 'and cuentaid=' + quotedstr(DMCNT.cdsQry6.FieldByName('CTATOTAL').AsString);
               Try
                  DMCNT.cdsQry.close;
                  DMCNT.cdsQry.DataRequest(xSQL);
                  DMCNT.cdsQry.Open;
               Except
                  Screen.Cursor := crDefault;
                  ShowMessage('Error al obtener la descripción del tipo de diario');
                  exit;
               End;
               XCTAABR := DMCNT.cdsQry.FieldByName('CTAABR').AsString;

               xSQL := 'INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) VALUES ( '
                  + quotedstr(xciaid) + ','
                  + quotedstr(xtdiarid) + ','
                  + quotedstr(xcntcomprob) + ','
                  + quotedstr(xcntano) + ','
                  + quotedstr(xcntanomm) + ','
                  + quotedstr(xcntlote) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('ctagasid').AsString) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('CLAUXID').AsString) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('PROV').AsString) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('DOCID').AsString) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('CPSERIE').AsString) + ','
                  + quotedstr(DMCNT.cdsQry6.FieldByName('CPNODOC').AsString) + ','
                  + quotedstr(copy(xcntglosa, 1, 40)) + ','
                  + quotedstr('D') + ','
                  + quotedstr(DMCNT.cdsQry8.FieldByName('CCOSID').AsString) + ','
                  + quotedstr(xcnttcambio) + ','
                  + quotedstr(DMCNT.cdsQry8.FieldByName('CPMTOPROMESORI').AsString) + ',' //CNTMTOORI

               + quotedstr(DMCNT.cdsQry8.FieldByName('CPMTOPROMESLOC').AsString) + ',' //CNTMTOLOC

               + quotedstr(DMCNT.cdsQry8.FieldByName('CPMTOPROMESEXT').AsString) + ',' //CNTMTOEXT

               + quotedstr(diaMesEmiCalc) + ','
                  + quotedstr(diaMesEmiCalc) + ','
                  + quotedstr(xcntfcomp) + ',' //CNTFCOMP
                  + quotedstr('I') + ',' //CNTESTADO
                  + quotedstr('N') + ',' //CNTCUADRE
                  + quotedstr('N') + ',' //CNTFAUTOM
                  + quotedstr(xcntuser) + ','
                  + xcntfreg + ','
                  + xcnthreg + ','
                  + quotedstr(xcntmm) + ','
                  + quotedstr(xcntdd) + ','
                  + quotedstr(xcnttri) + ','
                  + quotedstr(xcntsem) + ','
                  + quotedstr(xcntss) + ','
                  + quotedstr(xcntaatri) + ','
                  + quotedstr(xcntaasem) + ','
                  + quotedstr(xcntaass) + ','
                  + quotedstr(xtmonid) + ','
                  + 'NULL,'
                  + 'NULL,'
                  + 'NULL,'
                  + quotedstr(xtdiardes) + ','
                  + quotedstr(XCTAABR) + ','
                  + quotedstr(copy(DMCNT.cdsQry6.FieldByName('PROVDES').AsString, 1, 15)) + ','
                  + quotedstr(XDOCABR) + ','
                  + 'NULL,'
                  + quotedstr(DMCNT.cdsQry8.FieldByName('CPMTOPROMESLOC').AsString) + ',' //CNTDEBEMN
                  + quotedstr(DMCNT.cdsQry8.FieldByName('CPMTOPROMESEXT').AsString) + ',' //CNTDEBEME
                  + quotedstr('0.00') + ',' //CNTHABEMN
                  + quotedstr('0.00') + ',' //CNTHABEME
                  + 'NULL,' //CNTSALDMN
                  + 'NULL,' //CNTSALDME
                  + 'NULL,' //CAMPOVAR
                  + 'NULL,' //CNTTS
                  + 'NULL,' //CNTPAGADO
                  + quotedstr('CNT') + ',' //CNTMODDOC
                  + quotedstr(intToStr(xcontador)) + ',' //CNTREG
                  + quotedstr('CNT') + ',' //MODULO
                  + 'NULL' //CTA_SECU
                  + ')';
               Try
                  xmtooriTotal := xmtooriTotal + DMCNT.cdsQry8.FieldByName('CPMTOPROMESORI').AsFloat;
                  xmtolocTotal := xmtolocTotal + DMCNT.cdsQry8.FieldByName('CPMTOPROMESLOC').AsFloat;
                  xmtoextTotal := xmtoextTotal + DMCNT.cdsQry8.FieldByName('CPMTOPROMESEXT').AsFloat;
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo Grabar el Debe (detalle) del devengado generado');
                  Screen.Cursor := crDefault;
                  exit;
               End;
               xcontador := xcontador + 1;
               DMCNT.cdsQry8.Next;
            End;

            xSQL := ' select CTA_CCOS from TGE202 where ciaid=' + quotedstr(xciaid) + 'and cuentaid=' + quotedstr(xtipseguro);
            Try
               DMCNT.cdsQry.close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
            Except
               Screen.Cursor := crDefault;
               ShowMessage('Error al obtener si tiene Centro de Costo');
               exit;
            End;
            IF DMCNT.cdsQry.FieldByName('CTA_CCOS').AsString='S' THEN
            BEGIN
               xCentroCosto:= DMCNT.cdsQry8.FieldByName('CCOSID').AsString;
            END
            ELSE
            BEGIN
               xCentroCosto:= '';
            END;

                //grabar detalle de la contabilización (Haber)
            xSQL := 'INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
               + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
               + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
               + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
               + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
               + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
               + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) VALUES ( '
               + quotedstr(xciaid) + ','
               + quotedstr(xtdiarid) + ','
               + quotedstr(xcntcomprob) + ','
               + quotedstr(xcntano) + ','
               + quotedstr(xcntanomm) + ','
               + quotedstr(xcntlote) + ','
               + quotedstr(xtipseguro) + ','
               + quotedstr(DMCNT.cdsQry6.FieldByName('CLAUXID').AsString) + ','
               + quotedstr(DMCNT.cdsQry6.FieldByName('PROV').AsString) + ','
               + quotedstr(DMCNT.cdsQry6.FieldByName('DOCID').AsString) + ','
               + quotedstr(DMCNT.cdsQry6.FieldByName('CPSERIE').AsString) + ','
               + quotedstr(DMCNT.cdsQry6.FieldByName('CPNODOC').AsString) + ','
               + quotedstr(copy(xcntglosa, 1, 40)) + ','
               + quotedstr('H') + ','
      //       + 'NULL,'
               + quotedstr(xCentroCosto) + ','
               + quotedstr(xcnttcambio) + ','
               + quotedstr(FloatToStr(xmtooriTotal)) + ','
               + quotedstr(FloatToStr(xmtolocTotal)) + ',' //CNTMTOLOC
               + quotedstr(FloatToStr(xmtoextTotal)) + ',' //CNTMTOEXT
               + quotedstr(diaMesEmiCalc) + ','
               + quotedstr(diaMesEmiCalc) + ','
               + quotedstr(xcntfcomp) + ',' //CNTFCOMP
               + quotedstr('I') + ',' //CNTESTADO
               + quotedstr('N') + ',' //CNTCUADRE
               + quotedstr('N') + ',' //CNTFAUTOM
               + quotedstr(xcntuser) + ','
               + xcntfreg + ','
               + xcnthreg + ','
               + quotedstr(xcntmm) + ','
               + quotedstr(xcntdd) + ','
               + quotedstr(xcnttri) + ','
               + quotedstr(xcntsem) + ','
               + quotedstr(xcntss) + ','
               + quotedstr(xcntaatri) + ','
               + quotedstr(xcntaasem) + ','
               + quotedstr(xcntaass) + ','
               + quotedstr(xtmonid) + ','
               + 'NULL,'
               + 'NULL,'
               + 'NULL,'
               + quotedstr(xtdiardes) + ','
               + quotedstr(XCTAABR) + ','
               + quotedstr(copy(DMCNT.cdsQry6.FieldByName('PROVDES').AsString, 1, 15)) + ','
               + quotedstr(XDOCABR) + ','
               + 'NULL,'
               + quotedstr('0.00') + ',' //CNTDEBEMN
               + quotedstr('0.00') + ',' //CNTDEBEME
               + quotedstr(FloatToStr(xmtolocTotal)) + ',' //CNTHABEMN
               + quotedstr(FloatToStr(xmtoextTotal)) + ',' //CNTHABEME
               + 'NULL,' //CNTSALDMN
               + 'NULL,' //CNTSALDME
               + 'NULL,' //CAMPOVAR
               + 'NULL,' //CNTTS
               + 'NULL,' //CNTPAGADO
               + quotedstr('CNT') + ',' //CNTMODDOC
               + quotedstr('1') + ',' //CNTREG
               + quotedstr('CNT') + ',' //MODULO
               + 'NULL' //CTA_SECU
               + ')';
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Except
               ShowMessage('No se pudo Grabar el Haber (detalle) del devengado generado');
               Screen.Cursor := crDefault;
               exit;
            End;
         End;
         xSQL := 'UPDATE cnt_dev_seg_mov SET FLGCNT=''S'', ciaidcnt=' + quotedstr(xciaid) + ', tdiaridcnt=' + quotedstr(xtdiarid)
            + ', cpanomescnt=' + quotedstr(xcntanomm) + ', cntcomprob=' + quotedstr(xcntcomprob) + ' where '
            + ' CPANOMES=' + quotedstr(xperiodoDev)
            + ' AND CIAID=' + quotedstr(dbeCIA.Text)
            + ' and DCPANOMM=' + quotedstr(dbePeriodo.Text)
            + ' and DCPREGDET=' + quotedstr(DMCNT.cdsQry5.FieldByName('DCPREG').AsString)
            + ' and DOCID=' + quotedstr(DMCNT.cdsQry5.FieldByName('DOCID').AsString)
            + ' and CPSERIE=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPSERIE').AsString)
            + ' and CPNODOC=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPNODOC').AsString)
            + ' and CLAUXID=' + quotedstr(DMCNT.cdsQry5.FieldByName('CLAUXID').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Screen.Cursor := crDefault;
         Except
            ShowMessage('No se pudo Actualizar a estado contabilizado');
            Screen.Cursor := crDefault;
            exit;
         End;
       xconteo := 1;
       End;

     DMCNT.cdsQry5.Next;
   End;
   if xconteo =0 then
   begin
      ShowMessage('No ha seleccionado ninguna Provisión para Contabilizar');
      Screen.Cursor := crDefault;
      exit;
   end;

   RefrescaEstadoDevengue;
   Screen.Cursor := crDefault;
   ShowMessage('Se Contabilizó correctamente');
   xCentroCosto:= '';

End;
// Fin HPC_201801_CNT

Procedure TfDevengadoSeg.RefrescaEstadoDevengue;
Var
   xSQL, xperiodoDev: String;
Begin
   xperiodoDev := edtano.Text + FormatFloat('00', StrToInt(edtMes.Text));
   xSQL := 'select distinct(flgcnt) estado from cnt_dev_seg_mov where '
      + ' CPANOMES=' + quotedstr(xperiodoDev)
      + ' and DCPANOMM=' + quotedstr(dbePeriodo.Text)
      + ' and DCPREGDET=' + quotedstr(DMCNT.cdsQry5.FieldByName('DCPREG').AsString)
      + ' and DOCID=' + quotedstr(DMCNT.cdsQry5.FieldByName('DOCID').AsString)
      + ' and CPSERIE=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPSERIE').AsString)
      + ' and CPNODOC=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPNODOC').AsString)
      + ' and CLAUXID=' + quotedstr(DMCNT.cdsQry5.FieldByName('CLAUXID').AsString);
   Try
      DMCNT.cdsQry.close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
   Except
      Screen.Cursor := crDefault;
      ShowMessage('Error al obtener estado del devengue');
      exit;
   End;
   If (DMCNT.cdsQry.RecordCount = 0) Then
   Begin
      lblEstado.Caption := 'Pendiente';
      gbPeriodoCnt.Enabled := False;
   End;
   If (DMCNT.cdsQry.FieldByName('estado').AsString = 'N') Then
   Begin
      lblEstado.Caption := 'Devengado';
      gbPeriodoCnt.Enabled := True;
   End;
   If (DMCNT.cdsQry.FieldByName('estado').AsString = 'S') Then
   Begin
      lblEstado.Caption := 'Contabilizado';
      xSQL := 'select distinct(cpanomescnt) from cnt_dev_seg_mov where '
      + ' CPANOMES=' + quotedstr(xperiodoDev)
      + ' and DCPANOMM=' + quotedstr(dbePeriodo.Text)
      + ' and DCPREGDET=' + quotedstr(DMCNT.cdsQry5.FieldByName('DCPREG').AsString)
      + ' and DOCID=' + quotedstr(DMCNT.cdsQry5.FieldByName('DOCID').AsString)
      + ' and CPSERIE=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPSERIE').AsString)
      + ' and CPNODOC=' + quotedstr(DMCNT.cdsQry5.FieldByName('CPNODOC').AsString)
      + ' and CLAUXID=' + quotedstr(DMCNT.cdsQry5.FieldByName('CLAUXID').AsString);
      Try
          DMCNT.cdsQry.close;
          DMCNT.cdsQry.DataRequest(xSQL);
          DMCNT.cdsQry.Open;
      Except
          Screen.Cursor := crDefault;
          ShowMessage('Error al obtener estado del devengue');
          exit;
      End;
      edtanocnt.Text := copy(DMCNT.cdsQry.FieldByName('cpanomescnt').AsString, 1, 4);

      edtmescnt.Text :=  copy(DMCNT.cdsQry.FieldByName('cpanomescnt').AsString, 5, 2);

      gbPeriodoCnt.Enabled := False;
   End;

End;

Procedure TfDevengadoSeg.edtMesChange(Sender: TObject);
Begin
   RefrescaEstadoDevengue;
End;

Procedure TfDevengadoSeg.sbDisenoClick(Sender: TObject);
Begin
   cbDiseno.Checked := Not cbDiseno.Checked;
End;

Procedure TfDevengadoSeg.bbtnImprimeMensualClick(Sender: TObject);
Var
   i, j, k, z, inicio: Integer;
   xsql, xmes, xanoi, xanof, xnomSeguro: String;
   Sheet, XLApp: Variant;
   xmontot: Double;
Begin
   xSQL := ' SELECT ''  '' CIAID,''  '' TDIARID,''      '' PERIODO,''      '' PERIODO2,''               '' NREG,''                    '' FACT,''          '' POLIZA FROM DUAL';
   Try
      DMCNT.cdsQry15.close;
      DMCNT.cdsQry15.DataRequest(xSQL);
      DMCNT.cdsQry15.Open;
      DMCNT.cdsQry15.Edit;
      DMCNT.cdsQry15.fieldbyname('CIAID').AsString := xciaid;
      DMCNT.cdsQry15.fieldbyname('TDIARID').AsString := xtipdiario;
      DMCNT.cdsQry15.fieldbyname('PERIODO').AsString := edtano.Text + FormatFloat('00', StrToInt(edtMes.Text));
      DMCNT.cdsQry15.fieldbyname('PERIODO2').AsString := dbePeriodo.Text;
      DMCNT.cdsQry15.fieldbyname('NREG').AsString := cpnoreg;
      DMCNT.cdsQry15.fieldbyname('FACT').AsString := DMCNT.cdsQry5.fieldbyname('CPSERIE').AsString + '-' + DMCNT.cdsQry5.fieldbyname('CPNODOC').AsString;
      DMCNT.cdsQry15.fieldbyname('POLIZA').AsString := xnropoliza;

   Except
      ShowMessage('Error al generar los datos del Reporte Acumulado del Devengado de Seguro');
      exit;
   End;

   If (edtano.Text <> IntToStr(YearOf(Now))) Or (StrToInt(edtMes.Text) > MonthOf(Now)) Then
   Begin
      ShowMessage('Periodo inválido para el Reporte Mensual del Devengado de Seguro');
      Screen.Cursor := crDefault;
      exit;
   End;
   xSQL := 'SELECT  PER' + FormatFloat('00', StrToInt(edtMes.Text))
      + ' AS PERIODO FROM TGE154 WHERE CIAID=''' + dbeCIA.Text + ''''
      + 'AND MODULO=''CNT'' '
      + 'AND ANO=''' + inttostr(YearOf(Now))
      + '''';
   DMCNT.cdsQry.close;
   DMCNT.cdsQry.datarequest(xSQL);
   DMCNT.cdsQry.open;

   If DMCNT.cdsQry.FieldByName('PERIODO').asstring = 'S' Then
   Begin
      ShowMessage('El Periodo se encuentra cerrado');
      Screen.Cursor := crDefault;
      exit;
   End;
   DMCNT.cdsQry.close;
// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
   xSQL := ' select cptodes from cnt_dev_seg_cab where cptoid=(select A.cptoid from cxp301 A where '
      + ' A.CLAUXID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CLAUXID').AsString)
      + ' AND A.DOCID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('DOCID').AsString)
      + ' AND A.CPSERIE=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPSERIE').AsString)
      + ' AND A.CPNODOC=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPNODOC').AsString)
      + ' AND A.CPESTADO NOT IN (''E'') )';
// Fin HPC_201801_CNT
   Try
      DMCNT.cdsQry12.close;
      DMCNT.cdsQry12.DataRequest(xSQL);
      DMCNT.cdsQry12.Open;
   Except
      ShowMessage('Error al generar los datos del Reporte Mensual del Devengado de Seguro');
      exit;
   End;
   If (DMCNT.cdsQry12.RecordCount > 0) Then
   Begin
      xnomSeguro := DMCNT.cdsQry12.fieldbyname('cptodes').AsString;
   End;

   xSQL := ' SELECT M.CPTCAMPR,M.CCOSID,T.CCOSDES,ROUND((ROUND(MONTOT/12,2)/CPTCAMPR),2) DOLARES,ROUND(MONTOT/12,2) SOLES,M.CPMTOPROMESLOC'
      + ' FROM CNT_DEV_SEG_MOV M,TGE203 T'
      + ' WHERE M.CCOSID = T.CCOSID'
      + ' AND T.CCOSACT = ' + quotedstr('S')
      + ' AND M.CPTOIDDET = ' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPTOID').AsString)
      + ' AND M.CUENTAIDDET = ' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPTOID').AsString)
      + ' AND M.CPANOMES = ' + quotedstr(edtano.Text + FormatFloat('00', StrToInt(edtMes.Text)))
      + ' AND M.CLAUXID = ' + quotedstr(DMCNT.cdsQry5.fieldbyname('CLAUXID').AsString)
      + ' AND M.DOCID = ' + quotedstr(DMCNT.cdsQry5.fieldbyname('DOCID').AsString)
      + ' AND M.CPSERIE = ' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPSERIE').AsString)
      + ' AND M.CPNODOC = ' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPNODOC').AsString);

   Try
      DMCNT.cdsQry13.close;
      DMCNT.cdsQry13.DataRequest(xSQL);
      DMCNT.cdsQry13.Open;
   Except
      ShowMessage('Error al generar los datos del Reporte Mensual del Devengado de Seguro');
      exit;
   End;
   If (DMCNT.cdsQry13.RecordCount = 0) Then
   Begin
      ShowMessage('No existen datos para el Reporte Mensual del Devengado de Seguro');
      exit;
   End;

   ppdbReporte1.DataSource := DMCNT.dsQry12;
   ppdbReporte2.DataSource := DMCNT.dsQry13;
   ppdbReporte4.DataSource := DMCNT.dsQry15;
   pprReporte.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\DevengueMensual.rtm';
   pprReporte.template.LoadFromFile;

   If cbDiseno.Checked Then
   Begin
      ppDesigner1.Report := pprReporte;
      ppDesigner1.ShowModal;
   End
   Else
   Begin
      pprReporte.print;
   End;

End;

Procedure TfDevengadoSeg.bbtnImprimeAcumuladoClick(Sender: TObject);
Var
   i, j, k, z, inicio: Integer;
   xsql, xmes, xanoi, xanof, xnomSeguro: String;
   Sheet, XLApp: Variant;
   xmontot, suma: Double;
Begin
   xSQL := ' SELECT ''  '' CIAID,''  '' TDIARID,''      '' PERIODO,''      '' PERIODO2,''               '' NREG,''                    '' FACT,''          '' POLIZA FROM DUAL';
   Try
      DMCNT.cdsQry15.close;
      DMCNT.cdsQry15.DataRequest(xSQL);
      DMCNT.cdsQry15.Open;
      DMCNT.cdsQry15.Edit;
      DMCNT.cdsQry15.fieldbyname('CIAID').AsString := xciaid;
      DMCNT.cdsQry15.fieldbyname('TDIARID').AsString := xtipdiario;
      DMCNT.cdsQry15.fieldbyname('PERIODO').AsString := dbePeriodo.Text;
      DMCNT.cdsQry15.fieldbyname('NREG').AsString := cpnoreg;
      DMCNT.cdsQry15.fieldbyname('FACT').AsString := DMCNT.cdsQry5.fieldbyname('CPSERIE').AsString + '-' + DMCNT.cdsQry5.fieldbyname('CPNODOC').AsString;
      DMCNT.cdsQry15.fieldbyname('POLIZA').AsString := xnropoliza;

   Except
      ShowMessage('Error al generar los datos del Reporte Acumulado del Devengado de Seguro');
      exit;
   End;
// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
   xSQL := ' select cptodes from cnt_dev_seg_cab where cptoid=(select A.cptoid from cxp301 A where '
      + ' A.CLAUXID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CLAUXID').AsString)
      + ' AND A.DOCID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('DOCID').AsString)
      + ' AND A.CPSERIE=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPSERIE').AsString)
      + ' AND A.CPNODOC=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPNODOC').AsString)
      + ' AND A.CPESTADO NOT IN (''E'') )';
// Fin HPC_201801_CNT
   Try
      DMCNT.cdsQry12.close;
      DMCNT.cdsQry12.DataRequest(xSQL);
      DMCNT.cdsQry12.Open;
   Except
      ShowMessage('Error al generar los datos del Reporte Mensual del Devengado de Seguro');
      exit;
   End;
   If (DMCNT.cdsQry12.RecordCount > 0) Then
   Begin
      xnomSeguro := DMCNT.cdsQry12.fieldbyname('cptodes').AsString;
   End;
// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
   xSQL := '  SELECT SUBSTR(A.FECINIVIG,5,1) MES,SUBSTR(TO_CHAR(A.FECINIVIG,''dd/MM/yyyy''),7,4) ANOI,SUBSTR(TO_CHAR(A.FECFINVIG,''dd/MM/yyyy''),7,4) ANOF FROM CXP301 A WHERE'
      + ' A.CLAUXID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CLAUXID').AsString)
      + ' AND A.DOCID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('DOCID').AsString)
      + ' AND A.CPSERIE=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPSERIE').AsString)
      + ' AND A.CPNODOC=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPNODOC').AsString)
      + ' AND A.CPESTADO NOT IN (''E'') ';
// Fin HPC_201801_CNT
   Try
      DMCNT.cdsQry14.close;
      DMCNT.cdsQry14.DataRequest(xSQL);
      DMCNT.cdsQry14.Open;
   Except
      ShowMessage('Error al generar obtener la fecha inicio vigencia de Seguro');
      exit;
   End;
   xmes := DMCNT.cdsQry14.fieldbyname('MES').AsString;
   xanoi := DMCNT.cdsQry14.fieldbyname('ANOI').AsString;
   xanof := DMCNT.cdsQry14.fieldbyname('ANOF').AsString;

   xSQL := '  SELECT M.CPTCAMPR,M.CCOSID,T.CCOSDES,ROUND((ROUND(M.MONTOT/12,2)/M.CPTCAMPR),2) DOLARES,ROUND(MONTOT/12,2) SOLES, M.MONTOT,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''01'', M.CPMTOPROMESLOC, 0) ) P1,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''02'', M.CPMTOPROMESLOC, 0) ) P2,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''03'', M.CPMTOPROMESLOC, 0) ) P3,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''04'', M.CPMTOPROMESLOC, 0) ) P4,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''05'', M.CPMTOPROMESLOC, 0) ) P5,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''06'', M.CPMTOPROMESLOC, 0) ) P6,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''07'', M.CPMTOPROMESLOC, 0) ) P7,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''08'', M.CPMTOPROMESLOC, 0) ) P8,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''09'', M.CPMTOPROMESLOC, 0) ) P9,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''10'', M.CPMTOPROMESLOC, 0) ) P10,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''11'', M.CPMTOPROMESLOC, 0) ) P11,'
      + '  SUM( DECODE( SUBSTR(M.CPANOMES,5,2), ''12'', M.CPMTOPROMESLOC, 0) ) P12'
      + '  FROM CNT_DEV_SEG_MOV M,TGE203 T'
      + '  WHERE M.CCOSID=T.CCOSID'
      + '  AND T.CCOSACT=' + quotedstr('S')
      + '  AND M.CPTOIDDET=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPTOID').AsString)
      + '  AND M.CUENTAIDDET=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPTOID').AsString)
      + '  AND M.CLAUXID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CLAUXID').AsString)
      + '  AND M.DOCID=' + quotedstr(DMCNT.cdsQry5.fieldbyname('DOCID').AsString)
      + '  AND M.CPSERIE=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPSERIE').AsString)
      + '  AND M.CPNODOC=' + quotedstr(DMCNT.cdsQry5.fieldbyname('CPNODOC').AsString)
      + '  GROUP BY M.CPTCAMPR,M.CCOSID,T.CCOSDES,ROUND((ROUND(M.MONTOT/12,2)/M.CPTCAMPR),2),ROUND(MONTOT/12,2),M.MONTOT';
   Try
      DMCNT.cdsQry16.close;
      DMCNT.cdsQry16.DataRequest(xSQL);
      DMCNT.cdsQry16.Open;
      xmontot := DMCNT.cdsQry16.fieldbyname('MONTOT').AsFloat;
   Except
      ShowMessage('Error al generar los datos del Reporte Mensual del Devengado de Seguro');
      exit;
   End;
   If (DMCNT.cdsQry16.RecordCount = 0) Then
   Begin
      ShowMessage('No existen datos para el Reporte Acumulado del Devengado de Seguro');
      exit;
   End;

   xSQL := ' SELECT '
      + '''    ''CCOSID,'
      + '''                    ''CCOSDES,'
      + '0.0 DOLARES,'
      + '''        ''CPTCAMPR,'
      + '0.0 SOLES,'
      + '0.0 P1,'
      + '0.0 P2,'
      + '0.0 P3,'
      + '0.0 P4,'
      + '0.0 P5,'
      + '0.0 P6,'
      + '0.0 P7,'
      + '0.0 P8,'
      + '0.0 P9,'
      + '0.0 P10,'
      + '0.0 P11,'
      + '0.0 P12,'
      + '0.0 TOTDEV,'
      + '0.0 TOTADEV'
      + ' FROM DUAL';
   Try
      DMCNT.cdsQry18.close;
      DMCNT.cdsQry18.DataRequest(xSQL);
      DMCNT.cdsQry18.Open;
   Except
      ShowMessage('Error al generar los datos del Reporte Acumulado del Devengado de Seguro');
      exit;
   End;
   DMCNT.cdsQry18.Delete;
   DMCNT.cdsQry18.Edit;
   suma := 0;
   While Not DMCNT.cdsQry16.Eof Do
   Begin
      DMCNT.cdsQry18.Append;
      k := 1;
      suma := 0;
      DMCNT.cdsQry18.fieldbyname('CCOSID').Value := DMCNT.cdsQry16.fieldbyname('CCOSID').Value;
      DMCNT.cdsQry18.fieldbyname('CCOSDES').Value := DMCNT.cdsQry16.fieldbyname('CCOSDES').Value;
      DMCNT.cdsQry18.fieldbyname('DOLARES').Value := DMCNT.cdsQry16.fieldbyname('DOLARES').Value;
      DMCNT.cdsQry18.fieldbyname('CPTCAMPR').Value := DMCNT.cdsQry16.fieldbyname('CPTCAMPR').Value;
      DMCNT.cdsQry18.fieldbyname('SOLES').Value := DMCNT.cdsQry16.fieldbyname('SOLES').Value;
      If (strToInt(xmes) > 1) Then
      Begin
         For j := (strToInt(xmes) + 1) To 12 Do
         Begin
            DMCNT.cdsQry18.fieldbyname('P' + IntToStr(k)).Value := DMCNT.cdsQry16.fieldbyname('P' + IntToStr(j)).Value;
            suma := suma + DMCNT.cdsQry16.fieldbyname('P' + IntToStr(j)).AsFloat;
            k := k + 1;
         End;
         For j := 1 To (strToInt(xmes)) Do
         Begin
            DMCNT.cdsQry18.fieldbyname('P' + IntToStr(k)).Value := DMCNT.cdsQry16.fieldbyname('P' + IntToStr(j)).Value;
            suma := suma + DMCNT.cdsQry16.fieldbyname('P' + IntToStr(j)).AsFloat;
            k := k + 1;
         End;
      End;
      DMCNT.cdsQry18.fieldbyname('TOTDEV').AsFloat := suma;
      DMCNT.cdsQry18.fieldbyname('TOTADEV').AsFloat := DMCNT.FRound((DMCNT.cdsQry16.fieldbyname('MONTOT').AsFloat / DMCNT.cdsQry16.RecordCount), 15, 2);
      DMCNT.cdsQry18.Post;
      DMCNT.cdsQry16.Next;
   End;

   xSQL := ' SELECT ''                   '' P1,'
      + '''                   '' P2,'
      + '''                   '' P3,'
      + '''                   '' P4,'
      + '''                   '' P5,'
      + '''                   '' P6,'
      + '''                   '' P7,'
      + '''                   '' P8,'
      + '''                   '' P9,'
      + '''                   '' P10,'
      + '''                   '' P11,'
      + '''                   '' P12'
      + ' FROM DUAL';
   Try
      DMCNT.cdsQry17.close;
      DMCNT.cdsQry17.DataRequest(xSQL);
      DMCNT.cdsQry17.Open;
   Except
      ShowMessage('Error al generar los datos del Reporte Acumulado del Devengado de Seguro');
      exit;
   End;
   DMCNT.cdsQry17.Edit;
   k := 1;
   If (strToInt(xmes) > 1) Then
   Begin
      For j := (strToInt(xmes) + 1) To 12 Do
      Begin
         DMCNT.cdsQry17.fieldbyname('P' + IntToStr(k)).AsString := copy(DMCNT.NombreMes(IntToStr(j)), 1, 3) + ' ' + xanoi;
         k := k + 1;
      End;
      For j := 1 To (strToInt(xmes)) Do
      Begin
         DMCNT.cdsQry17.fieldbyname('P' + IntToStr(k)).AsString := copy(DMCNT.NombreMes(IntToStr(j)), 1, 3) + ' ' + xanof;
         k := k + 1;
      End;
   End;

   ppdbReporte1.DataSource := DMCNT.dsQry12;
   ppdbReporte2.DataSource := DMCNT.dsQry13;
   ppdbReporte3.DataSource := DMCNT.dsQry14;
   ppdbReporte4.DataSource := DMCNT.dsQry15;
   ppdbReporte5.DataSource := DMCNT.dsQry16;
   ppdbReporte6.DataSource := DMCNT.dsQry17;
   ppdbReporte7.DataSource := DMCNT.dsQry18;
   pprReporte.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\DevengueAcumulado.rtm';
   pprReporte.template.LoadFromFile;

   If cbDiseno.Checked Then
   Begin
      ppDesigner1.Report := pprReporte;
      ppDesigner1.ShowModal;
   End
   Else
   Begin
      pprReporte.print;
   End;
End;

procedure TfDevengadoSeg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMCNT.cdsQry4.Filter := '';
   DMCNT.cdsQry4.Filtered := False;
   DMCNT.cdsQry4.IndexFieldNames:='';
   DMCNT.cdsQry4.Close;

   DMCNT.cdsQry5.Filter := '';
   DMCNT.cdsQry5.Filtered := False;
   DMCNT.cdsQry5.IndexFieldNames:='';
   DMCNT.cdsQry5.Close;
// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
   DMCNT.cdsQry.Filter := '';
   DMCNT.cdsQry.Filtered := False;
   DMCNT.cdsQry.IndexFieldNames:='';
   DMCNT.cdsQry.Close;

   DMCNT.cdsQry2.Filter := '';
   DMCNT.cdsQry2.Filtered := False;
   DMCNT.cdsQry2.IndexFieldNames:='';
   DMCNT.cdsQry2.Close;

   DMCNT.cdsQry3.Filter := '';
   DMCNT.cdsQry3.Filtered := False;
   DMCNT.cdsQry3.IndexFieldNames:='';
   DMCNT.cdsQry3.Close;

   DMCNT.cdsQry7.Filter := '';
   DMCNT.cdsQry7.Filtered := False;
   DMCNT.cdsQry7.IndexFieldNames:='';
   DMCNT.cdsQry7.Close;

   DMCNT.cdsQry8.Filter := '';
   DMCNT.cdsQry8.Filtered := False;
   DMCNT.cdsQry8.IndexFieldNames:='';
   DMCNT.cdsQry8.Close;

   DMCNT.cdsQry11.Filter := '';
   DMCNT.cdsQry11.Filtered := False;
   DMCNT.cdsQry11.IndexFieldNames:='';
   DMCNT.cdsQry11.Close;

   DMCNT.cdsQry12.Filter := '';
   DMCNT.cdsQry12.Filtered := False;
   DMCNT.cdsQry12.IndexFieldNames:='';
   DMCNT.cdsQry12.Close;

   DMCNT.cdsQry13.Filter := '';
   DMCNT.cdsQry13.Filtered := False;
   DMCNT.cdsQry13.IndexFieldNames:='';
   DMCNT.cdsQry13.Close;

   DMCNT.cdsQry14.Filter := '';
   DMCNT.cdsQry14.Filtered := False;
   DMCNT.cdsQry14.IndexFieldNames:='';
   DMCNT.cdsQry14.Close;

   DMCNT.cdsQry15.Filter := '';
   DMCNT.cdsQry15.Filtered := False;
   DMCNT.cdsQry15.IndexFieldNames:='';
   DMCNT.cdsQry15.Close;

   DMCNT.cdsQry16.Filter := '';
   DMCNT.cdsQry16.Filtered := False;
   DMCNT.cdsQry16.IndexFieldNames:='';
   DMCNT.cdsQry16.Close;

   DMCNT.cdsQry17.Filter := '';
   DMCNT.cdsQry17.Filtered := False;
   DMCNT.cdsQry17.IndexFieldNames:='';
   DMCNT.cdsQry17.Close;

   DMCNT.cdsQry18.Filter := '';
   DMCNT.cdsQry18.Filtered := False;
   DMCNT.cdsQry18.IndexFieldNames:='';
   DMCNT.cdsQry18.Close;

// Fin HPC_201801_CNT
end;

// Inicio HPC_201801_CNT
// Al Contabilizar los seguros el Centro de Costo en las Unidades de Negocio
procedure TfDevengadoSeg.dbgDevengadoSeg1DblClick(Sender: TObject);
begin
  If DMCNT.cdsQry5.FieldByname('MARCA').AsString = 'N' Then
  Begin
     DMCNT.cdsQry5.Edit;
     DMCNT.cdsQry5.FieldByname('MARCA').AsString := 'S'
  End
  Else
  Begin
     DMCNT.cdsQry5.Edit;
     DMCNT.cdsQry5.FieldByname('MARCA').AsString := 'N';
  End;

  DMCNT.cdsQry5.Post;
end;
//Fin HPC_201801_CNT
End.
//Fin HPC_201703_CNT

