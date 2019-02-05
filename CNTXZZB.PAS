unit CNTXZZB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, ComCtrls, wwdblook, wwdbdatetimepicker, Spin, Buttons, db,
  Menus;

type
  TFMayorAuxiliarAnalisis = class(TForm)
    pnlAuxiliares: TPanel;
    pnlResultado: TPanel;
    Label3: TLabel;
    edtSaldoAcum: TEdit;
    pnlArriba: TPanel;
    lblCia: TLabel;
    gbFech: TGroupBox;
    dtpFReg1: TDateTimePicker;
    dtpFReg2: TDateTimePicker;
    gbCuentas: TGroupBox;
    lbCuentas: TListBox;
    gbTipoMoneda: TGroupBox;
    gbAsientosAutomaticos: TGroupBox;
    ckbDifCambio: TCheckBox;
    ckbEEFF: TCheckBox;
    rgEstadoDoc: TRadioGroup;
    gbPer: TGroupBox;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    rbPer: TRadioButton;
    rbFech: TRadioButton;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    rgTipoAnalisis: TRadioGroup;
    edtDebe: TEdit;
    edtHaber: TEdit;
    edtSaldoActual: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    lblParametro: TLabel;
    edtParametro: TEdit;
    dbgAnalisis: TwwDBGrid;
    pmCancelar: TPopupMenu;
    Cancelar1: TMenuItem;
    Pendiente1: TMenuItem;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    Z2bbtnImprime: TBitBtn;
    bbtnCambio: TBitBtn;
    dblcMoneda: TwwDBLookupCombo;
    procedure rbPerClick(Sender: TObject);
    procedure rbFechClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dtpFReg2Exit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure bbtnCancClick(Sender: TObject);
    procedure bbtnCambioClick(Sender: TObject);
    procedure dbgAnalisisTopRowChanged(Sender: TObject);
    procedure dbgAnalisisCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
  private
    { Private declarations }
    procedure ExecAction(sCia, sCuenta, sMoneda: string; dtFeInicio, dtFeFinal: tdatetime; nAnalisis, nEstado : byte; lDifCambio, lAjusteEF: boolean);
    procedure TitleGrid(Analisis : byte; MonedaMes : string );
    procedure CambiarEstado(sEstado : string; nAnalisis : byte);
  public
    { Public declarations }
    sParametro : string;
  end;

var
  FMayorAuxiliarAnalisis: TFMayorAuxiliarAnalisis;

implementation

uses CNTDM;

{$R *.DFM}


procedure TFMayorAuxiliarAnalisis.bbtnCancClick(Sender: TObject);
begin
   close;
end;

procedure TFMayorAuxiliarAnalisis.rbPerClick(Sender: TObject);
begin
   if rbPer.Checked then Begin
      speAno.Enabled:=True;
      speMM.Enabled:=True;
      dtpFReg1.Enabled:=False;
      dtpFReg2.Enabled:=False;
   end;
end;

procedure TFMayorAuxiliarAnalisis.rbFechClick(Sender: TObject);
begin
   if rbFech.Checked then Begin
      dtpFReg1.Enabled:=True;
      dtpFReg2.Enabled:=True;
      speAno.Enabled:=False;
      speMM.Enabled:=False;
   end;
end;

procedure TFMayorAuxiliarAnalisis.FormActivate(Sender: TObject);
var nAnyo, nMes, nDia : word;
begin
   decodeDate(now, nAnyo, nMes, nDia);
   dtpFReg2.date := now;
   dtpFReg1.date := now;
end;

procedure TFMayorAuxiliarAnalisis.dtpFReg2Exit(Sender: TObject);
begin
   if dtpFReg2.Date < dtpFReg1.Date then begin
     ShowMessage('   Fecha no válida   ');
     dtpFReg2.SetFocus;
   end;
end;


procedure TFMayorAuxiliarAnalisis.bbtnOkClick(Sender: TObject);
var   nMaxDia : integer;
   sTipoMoneda : string;
   dtFReg1, dtFReg2 : TDateTime;
begin

   dtFReg1 := now;   dtFReg2 := now;

   if rbPer.Checked then
      begin
         case strtoInt(speMM.text) of
            1,3,5,7,8,10,12 :
               nMaxDia := 31;
            4,6,9,11 :
               nMaxDia := 30;
         else
            if IsLeapYear(strtoInt(speAno.Text)) then
               nMaxDia := 29
            else
               nMaxDia := 28;
      end;
      dtFReg1 := encodeDate(strtoInt(speAno.Text), strtoint(speMM.text), 1) ;
      dtFReg2 := encodeDate(strtoInt(speAno.Text), strtoint(speMM.text), nMaxDia) ;
      end;

   if rbFech.Checked then
      begin
      dtFReg1 := dtpFReg1.date;
      dtFReg2 := dtpFReg2.date;
      end;

   if DM1.dsTMon.DataSet.FieldByName('TMON_LOC').asString = 'L'
      then sTipoMoneda := 'N'
      else sTipoMoneda := 'E';

   if rgEstadoDoc.ItemIndex = 2 then
      bbtnCambio.Caption := 'Pendientes'
   else
      bbtnCambio.Caption := 'Cancelados';

   ExecAction(dblcCia.Text, lbCuentas.Items[lbCuentas.ItemIndex], sTipoMoneda, dtFReg1, dtFReg2, rgTipoAnalisis.ItemIndex, rgEstadoDoc.ItemIndex, ckbDifCambio.Checked, ckbEEFF.Checked );

   if DM1.cdsMayorAuxA.recordCount > 0 then
      bbtnCambio.Enabled := true
   else
      bbtnCambio.Enabled := false;
end;

procedure TFMayorAuxiliarAnalisis.ExecAction(sCia, sCuenta, sMoneda: string;
                                     dtFeInicio, dtFeFinal: tdatetime;
                                     nAnalisis, nEstado : byte;
                                     lDifCambio, lAjusteEF: boolean);
//sCia, sCuenta, sFeInicio, sFeFinal, sMoneda: string;
//nAnalisis, nEstado : byte;
var sCampoSaldo : string;
   sFeInicio, sFeFinal : string;
   sWhere : string;
   sSQL, sCampos : string;
   sOrder : string;
begin
   sCia     := quotedStr(sCia);
   sCuenta  := quotedStr(sCuenta);
   sFeInicio:= quotedStr( datetoStr(dtFeInicio) );
   sFeFinal := quotedStr( datetoStr(dtFeFinal) );

//   sWhere := 'CIAID=' + sCia + ' AND CUENTAID=' + sCuenta ;
   sWhere := 'CIAID=' + sCia + ' AND CUENTAID=' + sCuenta + ' AND CNTFCOMP >=' +sFeInicio+ ' AND CNTFCOMP <=' + sFefinal;
   sCampos := 'CNTFCOMP, TDIARID, CNTCOMPROB, SUBSTR(CNTGLOSA,10) CNTGLOSA, CNTTCAMBIO, DOCID, CNTSERIE, CNTNODOC, CNTPAGADO';

   TitleGrid(nAnalisis, sMoneda);

   case nAnalisis of
     0:  begin
         sCampos:= sCampos + ', AUXID, CLAUXID, AUXDES';
         sWhere := sWhere +  ' AND (CCOSID = '''' OR CCOSID = '' '' OR CCOSID IS NULL) AND '+
                             ' AUXID = ' + quotedStr(sParametro) ;
         sOrder := ' AUXID, CLAUXID ';
         end;
     1:  begin
         sWhere := sWhere + ' AND CCOSID =' + quotedStr(sParametro);
         sCampos:= sCampos + ', CCOSID, CCODES';
         sOrder := ' CCOSID ';
         end;
   end;

   case nEstado of
     1: sWhere := sWhere + ' AND CNTPAGADO = ''N'' ';
     2: sWhere := sWhere + ' AND CNTPAGADO = ''S'' ';
   end;

   if lDifCambio and lAjusteEF then
      sWhere := sWhere + ' AND ( CNTFAUTOM = ''C'' OR CNTFAUTOM = ''D'' ) '
   else
      begin
      if lDifCambio then
         sWhere := sWhere + ' AND CNTFAUTOM = ''C'' ';
      if lAjusteEF then
         sWhere := sWhere + ' AND CNTFAUTOM = ''D'' ';
      end;

   if nAnalisis = 0 then
      sCampoSaldo := ', CNTSALDM' + sMoneda + ' CNTSALDM, CNTDEBEM' + sMoneda + ' CNTDEBEM, CNTHABEM' + sMoneda + ' CNTHABEM, '+
                        '( COALESCE(CNTSALDM' + sMoneda + ',0) + COALESCE(CNTDEBEM' + sMoneda + ',0) - COALESCE(CNTHABEM' + sMoneda + ',0) ) SALDOACT '
   else
      sCampoSaldo := ', sum(CNTSALDM' + sMoneda + ') CNTSALDM, '+
                        'sum(CNTDEBEM' + sMoneda + ') CNTDEBEM, '+
                        'sum(CNTHABEM' + sMoneda + ') CNTHABEM, '+
                        '( sum(CNTSALDM' + sMoneda + ') + SUM(CNTDEBEM' + sMoneda + ') - SUM(CNTHABEM' + sMoneda + ') ) SALDOACT ';

   sSQL := sSQL + sCampos + sCampoSaldo;
   sSQL := sSQL + ' FROM CNT301 WHERE ' + sWhere ;
   if nAnalisis = 1 then sSQL := sSQL + ' GROUP BY ' + sCampos;
   sSQL := sSQL + ' ORDER BY ' + sOrder;
   sSQL := 'SELECT ' + sSQL;

   DM1.cdsMayorAuxA.DisableControls;
   DM1.cdsMayorAuxA.close;
   DM1.cdsMayorAuxA.ProviderName:= 'prvMayorAuxA';
   DM1.cdsMayorAuxA.DataRequest(sSQL);
   DM1.cdsMayorAuxA.Open;

   DM1.cdsMayorAuxA.EnableControls;

   sCampoSaldo := 'SUM(CNTSALDM' + sMoneda + ') SALDO, ' +
                  'SUM(CNTDEBEM' + sMoneda + ') DEBE, '  +
                  'SUM(CNTHABEM' + sMoneda + ') HABER'   ;

   sSQL := 'SELECT ' + sCampoSaldo + ' FROM CNT301 WHERE ' + sWhere;
   DM1.cdsQry.close;
   DM1.cdsQry.ProviderName:= 'prvCNT';
   DM1.cdsQry.DataRequest(upperCase(sSQL));
   DM1.cdsQry.Open;
   DM1.cdsQry.DisableControls;
   edtSaldoAcum.text  := Format( '%15.2f', [ dm1.cdsQry.fieldbyname('SALDO').asFloat ] );
   edtDebe.text       := Format( '%15.2f', [ dm1.cdsQry.fieldbyname('DEBE').asFloat  ] );
   edtHaber.text      := Format( '%15.2f', [ dm1.cdsQry.fieldbyname('HABER').asFloat ] );
   edtSaldoActual.text:= Format( '%15.2f', [ dm1.cdsQry.fieldbyname('SALDO').asFloat + dm1.cdsQry.fieldbyname('DEBE').asFloat - dm1.cdsQry.fieldbyname('HABER').asFloat ] );
   DM1.cdsQry.EnableControls;
end;

procedure TFMayorAuxiliarAnalisis.TitleGrid(Analisis : byte; MonedaMes : string );
begin

   if length(MonedaMes) = 0 then
      exit;

   dbgAnalisis.DataSource.DataSet.DisableControls ;
   dbgAnalisis.Selected.Clear;   dbgAnalisis.Selected.Clear;   dbgAnalisis.Selected.Clear;
   if Analisis = 0 then
   begin
      dbgAnalisis.selected.add ( 'CLAUXID'#9'2'#9'Clase de~Auxiliar');
      dbgAnalisis.selected.add ( 'AUXID'#9'8'#9'Aux.ID');
      dbgAnalisis.selected.add ( 'AUXDES'#9'15'#9'Auxiliar~Descripcion');
   end
   else
   begin
      dbgAnalisis.selected.add ( 'CCOSID'#9'15'#9'C.Costo~ID');
      dbgAnalisis.selected.add ( 'CCOSDES'#9'15'#9'Centro de Costo~Descripcion');
   end;
   dbgAnalisis.selected.add ( 'TDIARID'#9'2'#9'Tipo~Diario');
   dbgAnalisis.selected.add ( 'CNTCOMPROB'#9'10'#9'Comprobante');
   dbgAnalisis.selected.add ( 'DOCID'#9'2'#9'Nro.Doc.');
   dbgAnalisis.selected.add ( 'CNTGLOSA'#9'15'#9'Glosa');
   dbgAnalisis.selected.add ( 'CNTTCAMBIO'#9'10'#9'Tipo de~Cambio');
   dbgAnalisis.selected.add ( 'CNTFCOMP'#9'10'#9'Fecha del~Comprobante');
   dbgAnalisis.selected.add ( 'CNTDEBEM'#9'10'#9'Debe');
   dbgAnalisis.selected.add ( 'CNTHABEM'#9'10'#9'Haber');
   dbgAnalisis.selected.add ( 'CNTSALDM'#9'10'#9'Saldo');
   dbgAnalisis.selected.add ( 'SALDOACT'#9'10'#9'Saldo~Actual');
   dbgAnalisis.selected.add ( 'CNTPAGADO'#9'0'#9'Estado');

//   dbgAnalisis.DataSource.DataSet.EnableControls ;
end;


procedure TFMayorAuxiliarAnalisis.bbtnCambioClick(Sender: TObject);
begin
   //cUANDO SE TENGAN LOS DOCU, SE PERMITIRA ACTIVAR O DESACTIVAR EL FLAG DE PAGADO, POR CADA REGISTRO DE CNT301

   if bbtnCambio.Caption = 'Pendientes' then
   begin
      if application.MessageBox('Esta seguro de cambia el estado de esta cuenta a Pendiente', 'Aviso', mb_OKCANCEL+MB_DEFBUTTON1) = idYes then
         begin
         CambiarEstado('S', 2);
         bbtnCambio.Caption := 'Cancelados'
         end;
   end
   else
      if application.MessageBox('Esta seguro de cambia el estado de esta cuenta a Cancelado', 'Aviso', mb_OKCANCEL+MB_DEFBUTTON1) = idYes then
         begin
         CambiarEstado('N', 0);
         bbtnCambio.Caption := 'Pendientes';
         end;
   dbgAnalisis.OnTopRowChanged (sender);
end;


procedure TFMayorAuxiliarAnalisis.CambiarEstado(sEstado : string; nAnalisis : byte);
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
   sCuenta := quotedStr(lbCuentas.Items[lbCuentas.ItemIndex]);
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
   dm1.cdsMayorAuxA.DisableControls;
   DM1.DCOM1.AppServer.EjecutaQry(sSQL);
   dm1.cdsMayorAuxA.EnableControls;
end;

procedure TFMayorAuxiliarAnalisis.dbgAnalisisTopRowChanged(Sender: TObject);
begin
	dbgAnalisis.invalidate;
end;

procedure TFMayorAuxiliarAnalisis.dbgAnalisisCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   if Field.DataSet.FieldByName ('CNTPAGADO').asString = 'N' then
      ABrush.color := clYellow
   else
      ABrush.color := clWindow;
end;

End.

