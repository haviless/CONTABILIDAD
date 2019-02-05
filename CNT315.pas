unit CNT315;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, ComCtrls, wwdblook, wwdbdatetimepicker, Spin, Buttons, db,
  Menus, Mant, ControlGridDisp, Wwdbdlg, Wwdbspin;

type
  TFMayorAuxiliarAnalisis = class(TForm)
    pnlAuxiliares: TPanel;
    pnlArriba: TPanel;
    lblCia: TLabel;
    gbFech: TGroupBox;
    dtpFReg1: TwwDBDateTimePicker;
    dtpFReg2: TwwDBDateTimePicker;
    gbAsientosAutomaticos: TGroupBox;
    ckbDifCambio: TCheckBox;
    ckbEEFF: TCheckBox;
    rgEstadoDoc: TRadioGroup;
    gbPer: TGroupBox;
    speAno: TwwDBSpinEdit;
    speMM: TwwDBSpinEdit;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    rgTipoAnalisis: TRadioGroup;
    Panel1: TPanel;
    lblParametro: TLabel;
    edtParametro: TEdit;
    pmCancelar: TPopupMenu;
    Cancelar1: TMenuItem;
    Pendiente1: TMenuItem;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    Z2bbtnImprime: TBitBtn;
    bbtnCambio: TBitBtn;
    dbgAnalisis: TwwDBGrid;
    cgdPrincipal: TControlGridDisp;
    Label7: TLabel;
    dblcdCuentas: TwwDBLookupComboDlg;
    edtCuenta: TEdit;
    gbTipoMoneda: TGroupBox;
    dblcTMon: TwwDBLookupCombo;
    edtMon: TEdit;
    edtParametro2: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure bbtnCancClick(Sender: TObject);
    procedure bbtnCambioClick(Sender: TObject);
    procedure dbgAnalisisTopRowChanged(Sender: TObject);
    procedure dbgAnalisisCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgAnalisisDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure gbPerExit(Sender: TObject);
    procedure dblcdCuentasExit(Sender: TObject);
    procedure rgTipoAnalisisExit(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure dblcdCuentasEnter(Sender: TObject);
    procedure speAnoKeyPress(Sender: TObject; var Key: Char);
    procedure speMMKeyPress(Sender: TObject; var Key: Char);
    procedure speAnoEnter(Sender: TObject);
    procedure speAnoExit(Sender: TObject);
    procedure speMMEnter(Sender: TObject);
    procedure speMMExit(Sender: TObject);
    procedure dtpFReg1Exit(Sender: TObject);
  private
    { Private declarations }
    strTmp , Tmp : string ;
    procedure ExecAction(sCia, sCuenta, sMoneda: string; dtFeInicio, dtFeFinal: tdatetime; nAnalisis, nEstado : byte; lDifCambio, lAjusteEF: boolean);
    procedure TitleGrid(Analisis : byte; MonedaMes : string );
    procedure CambiarEstado(sEstado : string; nAnalisis : byte; Sender: TObject);
    procedure Validar ;
  public
    { Public declarations }
    sParametro : string;
    sParametro2 : string ;
    GComprobante : TMant;
    xxCia, xxTDiario, xxAnoMM, xxNoReg : String;
  end;

var
  FMayorAuxiliarAnalisis: TFMayorAuxiliarAnalisis;

implementation

uses CNTDM, CNT320;

{$R *.DFM}


procedure TFMayorAuxiliarAnalisis.bbtnCancClick(Sender: TObject);
begin
   DMCNT.cdsMayorAuxA.active := false;
   close;
end;

procedure TFMayorAuxiliarAnalisis.FormActivate(Sender: TObject);
begin
   if rgEstadoDoc.ItemIndex = 2 then
      bbtnCambio.Caption := 'Pendientes'
   else begin
      bbtnCambio.Caption := 'Cancelados';
   end;
   dblcdCuentasExit(Self);
   gbPerExit(Self);
   dblcTMonExit(Self);
   bbtnOkClick(Self);
end;

procedure TFMayorAuxiliarAnalisis.bbtnOkClick(Sender: TObject);
var//   nMaxDia : integer;
   sTipoMoneda : string;
begin
   Validar ;
   if DMCNT.dsTMon.DataSet.FieldByName('TMON_LOC').asString = 'L'
      then sTipoMoneda := 'N'
      else sTipoMoneda := 'E';

   ExecAction(dblcCia.Text, dblcdCuentas.Text, sTipoMoneda, dtpFReg1.date, dtpFReg2.date, rgTipoAnalisis.ItemIndex, rgEstadoDoc.ItemIndex, ckbDifCambio.Checked, ckbEEFF.Checked );

   if DMCNT.cdsMayorAuxA.recordCount > 0 then
      bbtnCambio.Enabled := true
   else
      bbtnCambio.Enabled := false;
end;

procedure TFMayorAuxiliarAnalisis.ExecAction(sCia, sCuenta, sMoneda: string;
                                     dtFeInicio, dtFeFinal: tdatetime;
                                     nAnalisis, nEstado : byte;
                                     lDifCambio, lAjusteEF: boolean);
var sCampoSaldo : string;
   sFeInicio, sFeFinal : string;
   sWhere : string;
   sSQL, sCampos : string;
   sOrder : string;
   xSaldoAcum, xTotDebe, xTotHaber, xSaldoAct : double;
begin
   sCia     := quotedStr(sCia);
   sCuenta  := quotedStr(sCuenta);
{
   sFeInicio:= quotedStr( datetoStr(dtFeInicio) );
   sFeFinal := quotedStr( datetoStr(dtFeFinal) );
}
   sFeInicio:= formatdatetime(wFormatFecha,dtFeInicio) ;
   sFeFinal := formatdatetime(wFormatFecha,dtFeFinal)  ;

//** 07/05/2001- pjsv , se deshabilita momentaneamente el flag de pendiente
//   sWhere := 'CIAID=' + sCia +' and CNTESTADO='+''''+'P'+''''+ ' AND CUENTAID=' + sCuenta +
//               ' AND CNTFCOMP >=''' +sFeInicio+ ''' AND CNTFCOMP <=''' + sFefinal + ''' ';
   sWhere := 'CIAID=' + sCia + ' AND CUENTAID=' + sCuenta +
              ' AND CNTFCOMP >=''' +sFeInicio+ ''' AND CNTFCOMP <=''' + sFefinal + ''' ';
//**
   sCampos := 'CIAID, CNTANOMM, CNTFCOMP, TDIARID, CNTCOMPROB, CNTGLOSA, CNTTCAMBIO, DOCID, CNTSERIE, CNTNODOC, CNTPAGADO';

   TitleGrid(nAnalisis, sMoneda);

   case nAnalisis of
     0:  begin // Análisis por Auxiliar
         sCampos:= sCampos + ', AUXID, CLAUXID, AUXDES';
         sWhere := sWhere + ' AND AUXID = ' + quotedStr(sParametro) + ' AND CLAUXID = ' + quotedStr(sParametro2)   ;
         sOrder := ' AUXID, CLAUXID ';
         end;
     1:  begin  // Análisis por Centro de Costo
         sWhere := sWhere + ' AND CCOSID =' + quotedStr(sParametro);
         sCampos:= sCampos + ', CCOSID, CCOSDES';
         sOrder := ' CCOSID ';
         end;
   end;

   case nEstado of
     1: begin
           if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
              sWhere := sWhere + ' and coalesce(CNTPAGADO,''N'') = ''N'' '; // pendientes
           if (SRV_D = 'ORACLE') then
              sWhere := sWhere + ' and nvl(CNTPAGADO,''N'') = ''N'' '; // pendientes
        end;
     2: sWhere := sWhere + ' AND CNTPAGADO = ''S'' '; // cancelados
   end;

   if lDifCambio and lAjusteEF then
      sWhere := sWhere + ' OR ( CNTFAUTOM = ''C'' OR CNTFAUTOM = ''D'' ) '
   else
      begin
      if lDifCambio then
         sWhere := sWhere + ' OR CNTFAUTOM = ''C'' ';
      if lAjusteEF then
         sWhere := sWhere + ' OR CNTFAUTOM = ''D'' ';
      end;

   if nAnalisis = 0 then
      sCampoSaldo := ', CNTSALDM' + sMoneda + ' CNTSALDM, CNTDEBEM' + sMoneda + ' CNTDEBEM, CNTHABEM' + sMoneda + ' CNTHABEM, '+
                        '( '+wReplacCeros+'(CNTSALDM' + sMoneda + ',0) + '+wReplacCeros+'(CNTDEBEM' + sMoneda + ',0) - '+wReplacCeros+'(CNTHABEM' + sMoneda + ',0) ) SALDOACT '
   else
      sCampoSaldo := ', sum(CNTSALDM' + sMoneda + ') CNTSALDM, '+
                        'sum(CNTDEBEM' + sMoneda + ') CNTDEBEM, '+
                        'sum(CNTHABEM' + sMoneda + ') CNTHABEM, '+
                        'SUM( '+wReplacCeros+'(CNTSALDM' + sMoneda + ',0) + '+wReplacCeros+'(CNTDEBEM' + sMoneda + ',0) - '+wReplacCeros+'(CNTHABEM' + sMoneda + ',0) ) SALDOACT ';

   sSQL := sSQL + sCampos + sCampoSaldo;
   sSQL := sSQL + ' FROM CNT301 WHERE ' + sWhere ;
   if nAnalisis = 1 then sSQL := sSQL + ' GROUP BY ' + sCampos;
   sSQL := sSQL + ' ORDER BY ' + sOrder;
   sSQL := 'SELECT ' + sSQL;

// asi esta el SQL
{
SELECT CIAID, CNTANOMM, CNTFCOMP, TDIARID, CNTCOMPROB, CNTGLOSA, CNTTCAMBIO, DOCID, CNTSERIE, CNTNODOC, 
       CNTPAGADO, AUXID, CLAUXID, AUXDES, CNTSALDMN CNTSALDM, CNTDEBEMN CNTDEBEM, CNTHABEMN CNTHABEM, 
       ( NVL(CNTSALDMN,0) + NVL(CNTDEBEMN,0) - NVL(CNTHABEMN,0) ) SALDOACT  
FROM CNT301 
WHERE CIAID='02' AND CUENTAID='42101' AND CNTFCOMP >='01-01-2003' AND CNTFCOMP <='31-01-2003'  
  AND AUXID = 'P0001' AND CLAUXID = 'P' 
ORDER BY CNTNODOC
}

// asi debe ser el SQL
{
select CNTSERIE, CNTNODOC, sum(CNTDEBEMN) CNTDEBEMN, sum(CNTHABEMN) CNTHABEMN,
       sum(CNTDEBEMN)-sum(CNTHABEMN) SALDOACT
from (
SELECT MOVS.CNTSERIE, MOVS.CNTNODOC, CNTDEBEMN CNTDEBEMN, CNTHABEMN CNTHABEMN
from CNT301 MOVS,
(SELECT CNTSERIE, CNTNODOC
FROM CNT301
WHERE CIAID='02' AND CUENTAID='42101' AND CNTFCOMP >='01-01-2003' AND CNTFCOMP <='31-01-2003'
  AND AUXID = 'P0001' AND CLAUXID = 'P') DOCS
where CIAID='02' AND CUENTAID='42101' AND CLAUXID = 'P' AND AUXID = 'P0001'
  and DOCS.CNTSERIE=MOVS.CNTSERIE and DOCS.CNTNODOC=MOVS.CNTNODOC
order by CNTNODOC
) DOCSALDADOS
group by CNTSERIE, CNTNODOC
order by CNTSERIE, CNTNODOC
}

   DMCNT.cdsMayorAuxA.DisableControls;
   DMCNT.cdsMayorAuxA.MasterSource:=NIL;
   DMCNT.cdsMayorAuxA.MasterFields:='';
   DMCNT.cdsMayorAuxA.Filter:='';
   DMCNT.cdsMayorAuxA.Filtered:=False;
   DMCNT.cdsMayorAuxA.IndexFieldNames:='';
   DMCNT.cdsMayorAuxA.close;
   DMCNT.cdsMayorAuxA.ProviderName:= 'prvMayorAuxA';
   DMCNT.cdsMayorAuxA.DataRequest(sSQL);
   DMCNT.cdsMayorAuxA.Open;

   DMCNT.cdsMayorAuxA.EnableControls;

   xSaldoAcum := DMCNT.OperClientDataSet( DMCNT.cdsMayorAuxA,'SUM('+'CNTSALDM'+')','');
   xTotDebe   := DMCNT.OperClientDataSet( DMCNT.cdsMayorAuxA,'SUM('+'CNTDEBEM'+')','');
   xTotHaber  := DMCNT.OperClientDataSet( DMCNT.cdsMayorAuxA,'SUM('+'CNTHABEM'+')','');
   xSaldoAct  := DMCNT.OperClientDataSet( DMCNT.cdsMayorAuxA,'SUM('+'SALDOACT'+')','');

   TNumericField( DMCNT.cdsMayorAuxA.FieldByName('CNTTCAMBIO') ).DisplayFormat:='###.#000';
   TNumericField( DMCNT.cdsMayorAuxA.FieldByName('CNTSALDM') ).DisplayFormat:='### ### ###.#0';
   TNumericField( DMCNT.cdsMayorAuxA.FieldByName('CNTDEBEM') ).DisplayFormat:='### ### ###.#0';
   TNumericField( DMCNT.cdsMayorAuxA.FieldByName('CNTHABEM') ).DisplayFormat:='### ### ###.#0';
   TNumericField( DMCNT.cdsMayorAuxA.FieldByName('SALDOACT') ).DisplayFormat:='### ### ###.#0';

   dbgAnalisis.ColumnByName('CNTSALDM').FooterValue:=floattostrf(xSaldoAcum,ffNumber, 10, 2);
   dbgAnalisis.ColumnByName('CNTDEBEM').FooterValue:=floattostrf(xTotDebe,  ffNumber, 10, 2);
   dbgAnalisis.ColumnByName('CNTHABEM').FooterValue:=floattostrf(xTotHaber, ffNumber, 10, 2);
   dbgAnalisis.ColumnByName('SALDOACT').FooterValue:=floattostrf(xSaldoAct, ffNumber, 10, 2);
end;

procedure TFMayorAuxiliarAnalisis.TitleGrid(Analisis : byte; MonedaMes : string );
begin

   if length(MonedaMes) = 0 then
      exit;

   dbgAnalisis.Selected.Clear;   dbgAnalisis.Selected.Clear;   dbgAnalisis.Selected.Clear;
   if Analisis = 0 then
   begin
      dbgAnalisis.selected.add ( 'CLAUXID'#9'2'#9'Clase~Aux.');
      dbgAnalisis.selected.add ( 'AUXID'#9'8'#9'Auxiliar');
      dbgAnalisis.selected.add ( 'AUXDES'#9'15'#9'Auxiliar~Descripcion');
   end
   else
   begin
      dbgAnalisis.selected.add ( 'CCOSID'#9'15'#9'C.Costo~ID');
      dbgAnalisis.selected.add ( 'CCOSDES'#9'15'#9'Centro de Costo~Descripcion');
   end;
   dbgAnalisis.selected.add ( 'TDIARID'#9'2'#9'Tipo~Diario');
   dbgAnalisis.selected.add ( 'CNTCOMPROB'#9'10'#9'Comprobante');
//wmc0404   dbgAnalisis.selected.add ( 'DOCID'#9'2'#9'Nro.Doc.');
   dbgAnalisis.selected.add ( 'CNTGLOSA'#9'15'#9'Glosa');
   dbgAnalisis.selected.add ( 'CNTTCAMBIO'#9'4'#9'T.C.');
   dbgAnalisis.selected.add ( 'CNTFCOMP'#9'10'#9'Fecha del~Comprobante');
   dbgAnalisis.selected.add ( 'CNTSALDM'#9'12'#9'Saldo~Ant.');
   dbgAnalisis.selected.add ( 'CNTDEBEM'#9'10'#9'Debe');
   dbgAnalisis.selected.add ( 'CNTHABEM'#9'10'#9'Haber');
   dbgAnalisis.selected.add ( 'SALDOACT'#9'12'#9'Saldo~Act.');
   dbgAnalisis.selected.add ( 'CNTPAGADO'#9'0'#9'Estado');

   dbgAnalisis.SetPictureMask('CNTSALDM','###,###,###.00');
   dbgAnalisis.SetPictureMask('CNTDEBEM','###,###,###.00');
   dbgAnalisis.SetPictureMask('CNTHABEM','###,###,###.00');
   dbgAnalisis.SetPictureMask('SALDOACT','###,###,###.00');

   dbgAnalisis.SetPictureMask('CNTSALDM'+MonedaMes,'###,###,###.00');
   dbgAnalisis.SetPictureMask('CNTDEBEM'+MonedaMes,'###,###,###.00');
   dbgAnalisis.SetPictureMask('CNTHABEM'+MonedaMes,'###,###,###.00');
   dbgAnalisis.SetPictureMask('SALDOACT'+MonedaMes,'###,###,###.00');

end;


procedure TFMayorAuxiliarAnalisis.bbtnCambioClick(Sender: TObject);
begin
   //cUANDO SE TENGAN LOS DOCU, SE PERMITIRA ACTIVAR O DESACTIVAR EL FLAG DE PAGADO, POR CADA REGISTRO DE CNT301

   if bbtnCambio.Caption = 'Pendientes' then
   begin
      if application.MessageBox('Esta seguro de cambia el estado de esta cuenta a Pendiente', 'Aviso', mb_YESNO+MB_DEFBUTTON1) = idYes then
         begin
         CambiarEstado('S', rgTipoAnalisis.ItemIndex, sender);
         bbtnCambio.Caption := 'Cancelados'
         end;
   end
   else
      if application.MessageBox('Esta seguro de cambia el estado de esta cuenta a Cancelado', 'Aviso', mb_YESNO+MB_DEFBUTTON1) = idYes then
         begin
         CambiarEstado('N', rgTipoAnalisis.ItemIndex, sender);
         bbtnCambio.Caption := 'Pendientes';
         end;
//   dbgAnalisis.OnTopRowChanged (sender);
//   dbgAnalisis.Invalidate;
//   dbgAnalisis.OnRowChanged (sender);
end;


procedure TFMayorAuxiliarAnalisis.CambiarEstado(sEstado : string; nAnalisis : byte; Sender: TObject);
var sCia, sCuenta, sCLAuxID, sAuxId, sCCosID : string;
   sComprob, sTDiarID, sDocID, sSerie, sNoDoc : string;
   sSQL : string;
begin
   if nAnalisis = 0 then
   begin
      sCLAuxID := quotedStr(dbgAnalisis.DataSource.DataSet.FieldByName('CLAUXID').asString);
      sAuxId := quotedStr(dbgAnalisis.DataSource.DataSet.FieldByName('AUXID').asString);
   end
   else
   begin
      sCCosID := quotedStr(dbgAnalisis.DataSource.DataSet.FieldByName( 'CCOSID').asString);
   end;

   sCia := quotedStr(dblcCia.Text);
   sCuenta := quotedStr(dblcdCuentas.Text);
   sDocID := quotedStr(dbgAnalisis.DataSource.DataSet.FieldByName('DOCID').asString);
   sSerie := quotedStr(dbgAnalisis.DataSource.DataSet.FieldByName('CNTSERIE').asString);
   sNoDoc := quotedStr(dbgAnalisis.DataSource.DataSet.FieldByName('CNTNODOC').asString);
   sComprob := quotedStr(dbgAnalisis.DataSource.DataSet.FieldByName('CNTCOMPROB').asString);
   sTDiarID := quotedStr(dbgAnalisis.DataSource.DataSet.FieldByName('TDIARID').asString);

   sSQL := 'UPDATE CNT301 SET CNTPAGADO='+quotedStr(sEstado)+ ' WHERE ' ;
   sSQL := sSQL + ' CNTCOMPROB =' +sComprob;
   sSQL := sSQL + ' AND TDIARID ='    +sTDiarID;
   sSQL := sSQL + ' AND DOCID ='      +sDocID;
   sSQL := sSQL + ' AND CNTSERIE ='   +sSerie;
   sSQL := sSQL + ' AND CNTNODOC ='   +sNoDoc;
   if nAnalisis = 0 then
      sSQL := sSQL + ' AND CLAUXID ='+sCLAuxID+' AND AUXID =' +sAuxID
   else
      sSQL := sSQL + ' AND CCOSID ='+sCCosID;
   DMCNT.cdsMayorAuxA.DisableControls;
   DMCNT.DCOM1.AppServer.EjecutaQry(sSQL);
   bbtnOk.OnClick(sender);
   DMCNT.cdsMayorAuxA.EnableControls;
   dbgAnalisis.invalidate;
end;

procedure TFMayorAuxiliarAnalisis.dbgAnalisisTopRowChanged(Sender: TObject);
begin
   dbgAnalisis.invalidate;
end;

procedure TFMayorAuxiliarAnalisis.dbgAnalisisCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   with (Sender as TwwDBGrid) do
      if CalcCellRow = GetActiveRow then
         ABrush.Color := clHighlight;

   if Field.DataSet.FieldByName('CNTPAGADO').asString = 'N'  then
      Abrush.Color := clRed
   else
      Abrush.Color := clBlack;
end;

procedure TFMayorAuxiliarAnalisis.dbgAnalisisDblClick(Sender: TObject);
//var xWhere : String;
var xSQL:string;
begin
//wmc0404
   if DMCNT.cdsMayorAuxA.RecordCount = 0 then
      Raise Exception.Create('No Hay Comprobantes Seleccionados') ;
////////////////////// jcc
   DMCNT.wModo := 'C';
   xxCia    := DMCNT.cdsMayorAuxA.FieldByName( 'CIAID'   ).AsString;
   xxTDiario:= DMCNT.cdsMayorAuxA.FieldByName( 'TDIARID' ).AsString;
   xxAnoMM  := DMCNT.cdsMayorAuxA.FieldByName( 'CNTANOMM' ).AsString;
   xxNoReg  := DMCNT.cdsMayorAuxA.FieldByName( 'CNTCOMPROB' ).AsString;
// Cabecera del Comprobante

   DMCNT.Filtracds( DMCNT.cdsCabCNT,'Select * from CNT300 Where '
                + 'CIAID='    +''''+ xxCia     +''''+' and '
                + 'TDIARID='  +''''+ xxTDiario +''''+' and '
                + 'CNTANOMM=' +''''+ xxAnoMM   +''''+' and '
                + 'CNTCOMPROB='  +''''+ xxNoReg   +'''' );
   if DMCNT.cdsCabCNT.RecordCount <> 1 then
      Raise Exception.Create('Problemas en La Recuperación de La Cabecera') ;
// Detalle del Comprobante
   xSQL:=         'SELECT CIAID,CUENTAID,CNTMTOORI,CNTFVCMTO,CNTFEMIS,CNTGLOSA,CNTDH, '
                + 'AUXID,CLAUXID,DOCID,CNTSERIE,CNTNODOC,CCOSID,CNTDEBEMN,CNTDEBEME, '
                + 'CNTHABEMN,CNTHABEME,TDIARID,CNTCUADRE,CNTESTADO,CNTCOMPROB,CNTMTOLOC, '
                + 'CNTMTOEXT,CTADES,AUXDES,DOCDES,CCOSDES,TDIARDES,CNTANO,CNTANOMM, '
                + 'CNTLOTE,TMONID,CNTTCAMBIO,CNTTS,CNTMODDOC,CNTFCOMP,CNTUSER,CNTFREG, '
                + 'CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS, CNTREG '
                + 'FROM CNT301 WHERE ';

   DMCNT.Filtracds( DMCNT.cdsMovCNT1,xSQL
                + 'CIAID='    +''''+ xxCia     +''''+' and '
                + 'TDIARID='  +''''+ xxTDiario +''''+' and '
                + 'CNTANOMM=' +''''+ xxAnoMM   +''''+' and '
                + 'CNTCOMPROB='  +''''+ xxNoReg   +'''' );
   if DMCNT.cdsMovCNT1.RecordCount = 0 then
      Raise Exception.Create('Problemas en La Recuperación ' +#13 + 'de Detalles del Comprobante') ;

   FConsultaComprobante.ShowModal;

//////////////////////


end;

procedure TFMayorAuxiliarAnalisis.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFMayorAuxiliarAnalisis.gbPerExit(Sender: TObject);
var
   xFecha1, xFecha2 : TDateTime;
begin
   xFecha1 := strtodate('01/'+DMCNT.strZero(speMM.Text,2)+'/'+speAno.Text);
   if strtofloat(speMM.Text)+1=13 then
   begin
      speAno.Text:=floattostr(strtofloat(speAno.Text)+1);
      xFecha2 := strtodate('01/01/'+speAno.Text);
   end
   else begin
      xFecha2:=strtodate('01/'+DMCNT.strZero(floattostr(strtofloat(speMM.Text)+1),2)+'/'+speAno.Text);
   end;
   xFecha2:=xFecha2-1;
   dtpFReg1.date:=xFecha1;
   dtpFReg2.date:=xFecha2;
end;

procedure TFMayorAuxiliarAnalisis.dblcdCuentasExit(Sender: TObject);
var
   xWhere : String;
   xAdic  : string ;
begin
   if bbtnCanc.Focused then
      Exit ;
   Tmp := strTmp ;
   dblcdCuentas.Text := trim( dblcdCuentas.Text ) ;
   if trim( dblcdCuentas.Text ) = '' then
   begin
      dblcdCuentas.SetFocus ;
      strTmp := Tmp ;
      Raise Exception.Create('Ingrese Cuenta') ;
   end ;
   if trim( dblcdCuentas.Text ) <> strTmp then
   begin
      xWhere := 'CUENTAID='+''''+dblcdCuentas.Text+''''+' and CIAID='+''''+dblcCia.Text+'''';
      xAdic  := DMCNT.DisplayDescrip('PrvTGE','TGE202','*',xWhere,'CTADES');
      if trim(xAdic) = '' then
      begin
         dblcdCuentas.SetFocus ;
         strTmp := Tmp ;
         Raise Exception.Create('Cuenta No Registrada') ;
      end
      else
         edtCuenta.Text := xAdic ;
   end ;
end;

procedure TFMayorAuxiliarAnalisis.rgTipoAnalisisExit(Sender: TObject);
var
   sSQL : string;
begin
   sSQL := 'SELECT * FROM TGE202 WHERE ';
   if rgTipoAnalisis.ItemIndex = 0 then
      sSQL := sSQL + 'CTA_AUX = ''S'' AND CTA_MOV = ''S'' '
   else
      sSQL := sSQL + 'CTA_MOV = ''S'' AND CTA_CCOS=''S'' ' ;
   sSQL := sSQL + ' AND CIAID=' + quotedStr(dblcCia.Text) + ' ORDER BY CUENTAID';
   DMCNT.cdsCuenta2.Close;
   DMCNT.cdsCuenta2.DataRequest(sSQL);
   DMCNT.cdsCuenta2.Open;
   DMCNT.cdsCuenta2.IndexfieldNames := 'CUENTAID';
end;

procedure TFMayorAuxiliarAnalisis.dblcTMonExit(Sender: TObject);
var
   xWhere : String;
begin
   edtMon.Text := '';
   xWhere := 'TMONID='+''''+dblcTMon.Text+'''';
   edtMon.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE103','TMONDES',xWhere,'TMONDES');
   if edtMon.Text='' then
   begin
      ShowMessage('Falta Tipo de Moneda');
      dblcTMon.SetFocus;
   end;
end;

procedure TFMayorAuxiliarAnalisis.dblcdCuentasEnter(Sender: TObject);
begin
   strTmp := TCustomedit( Sender ).Text ;
end;

procedure TFMayorAuxiliarAnalisis.Validar;
var
    xFecha : Tdate ;
begin
    if dtpFReg1.date = 0 then
    begin
       dtpFReg1.SetFocus ;
       Raise Exception.Create('Ingrese Fecha de Inicio') ;
    end ;
    if dtpFReg2.date = 0 then
    begin
       dtpFReg2.SetFocus ;
       Raise Exception.Create('Ingrese Fecha Final') ;
    end ;
    
    if dtpFReg1.date > dtpFReg2.date then
    begin
       xFecha := dtpFReg1.date        ;
       dtpFReg1.Date := dtpFReg2.date ;
       dtpFReg2.Date := xFecha        ;
    end ;

end;

procedure TFMayorAuxiliarAnalisis.speAnoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
     key := #0 ;

end;

procedure TFMayorAuxiliarAnalisis.speMMKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
     key := #0 ;

end;

procedure TFMayorAuxiliarAnalisis.speAnoEnter(Sender: TObject);
begin
   strTmp := speAno.Text ;
end;

procedure TFMayorAuxiliarAnalisis.speAnoExit(Sender: TObject);
var
  Tmp : string ;
  xAno : Integer ;
  xMes : Integer ;
begin
  if bbtnCanc.Focused then
     Exit ;
  tmp := strTmp ;
  speAno.Text := trim ( speAno.Text ) ;

  if trim ( speAno.Text ) = '' then
  begin
    showmessage('Ingrese Año del Periodo') ;
    speAno.SetFocus ;
    strTmp := Tmp ;
    Exit ;
  end ;

  if trim ( speAno.text ) <> strTmp then
  begin
     xAno := strtoint(speAno.Text) ;
     if xAno = 0 then
     begin
       showmessage('Ingrese Año diferente de Cero') ;
       speAno.SetFocus ;
       strTmp := Tmp ;
       Exit ;
     end ;

     if xAno > DMCNT.wAnoHoy then
     begin
       showmessage('Año del periodo No Puede Ser Mayor al Año Actual') ;
       speAno.SetFocus ;
       strTmp := Tmp ;
       Exit ;
     end
     else
     begin
       if (trim(speMM.Text) <> '') and ( xAno = DMCNT.wAnoHoy ) then
       begin
          xmes := strtoint( speMM.Text ) ;
          if xmes > DMCNT.wMesHoy then
          begin
             Showmessage('El Mes del periodo No Puede Ser Mayor Al Mes Actual'+ #13 + 'Corrija el Mes Ingresado') ;
             speMM.Text := '' ;
             speMM.SetFocus  ;
          end ;
       end ;
     end ;
  end ;

end;

procedure TFMayorAuxiliarAnalisis.speMMEnter(Sender: TObject);
begin
   if trim(speAno.Text) = '' then
      speAno.SetFocus ;
   strTmp := speMM.Text ;

end;

procedure TFMayorAuxiliarAnalisis.speMMExit(Sender: TObject);
var
  Tmp : string ;
  xAno : Integer ;
  xMes : Integer ;
begin
  if bbtnCanc.Focused then
     Exit ;
  tmp := strTmp ;
  speMM.Text := trim ( speMM.Text ) ;

  if trim ( speMM.Text ) = '' then
  begin
    showmessage('Ingrese Mes del Periodo') ;
    speMM.SetFocus ;
    strTmp := Tmp ;
    Exit ;
  end ;

  if trim ( speMM.text ) <> strTmp then
  begin
     xAno := strtoint(speAno.Text) ;
     xmes := strtoint(speMM.Text) ;

     if xMes = 0 then
     begin
       showmessage('Ingrese Mes diferente de Cero') ;
       speMM.SetFocus ;
       strTmp := Tmp ;
       Exit ;
     end      ;

     if ( xMes > DMCNT.wMesHoy ) and ( xAno = DMCNT.wAnoHoy ) then
     begin
         Showmessage('El Mes del periodo No Puede Ser Mayor Al Mes Actual'+ #13 + 'Corrija el Mes Ingresado') ;
         speMM.SetFocus  ;
         strTmp := Tmp ;
         Exit ;
     end ;
  end ;

end;

procedure TFMayorAuxiliarAnalisis.dtpFReg1Exit(Sender: TObject);
var
  //Tmp : string ;
  xAno ,
  xMes ,
  xDia : Word ;
begin
  if bbtnCanc.Focused then
     Exit ;
  if TwwDBDateTimePicKer( Sender ).Date = 0 then
  begin
    TwwDBDateTimePicKer( Sender ).SetFocus ;
    Raise Exception.Create('Ingrese Fecha') ;
  end ;
  DecodeDate( TwwDBDateTimePicKer( Sender ).date , xano, xmes , xdia ) ;
  if ( xAno > DMCNT.wAnoHoy ) then
  begin
     TwwDBDateTimePicKer( Sender ).SetFocus  ;
     Raise Exception.Create('El año Ingresado No Puede ser Mayor al Año Actual') ;
  end ;
  if ( xMes > DMCNT.wMesHoy ) and ( xAno = DMCNT.wAnoHoy ) then
  begin
     TwwDBDateTimePicKer( Sender ).SetFocus  ;
     Raise Exception.create( 'El Mes Ingresado No Puede ser Mayor al Mes Actual' ) ;
  end ;
end;


End.

