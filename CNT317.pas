unit CNT317;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, ComCtrls, wwdblook, wwdbdatetimepicker, Spin, Buttons, db,
  Menus, Mant, ControlGridDisp, Wwdbdlg, Wwdbspin;

type
  TFAnalisisCuentaDet = class(TForm)
    pnlAuxiliares: TPanel;
    pnlArriba: TPanel;
    lblCia: TLabel;
    gbFech: TGroupBox;
    dtpFReg1: TwwDBDateTimePicker;
    dtpFReg2: TwwDBDateTimePicker;
    gbTipoMoneda: TGroupBox;
    gbAsientosAutomaticos: TGroupBox;
    ckbDifCambio: TCheckBox;
    ckbEEFF: TCheckBox;
    gbPer: TGroupBox;
    speAno: TwwDBSpinEdit;
    speMM: TwwDBSpinEdit;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    pmCancelar: TPopupMenu;
    Cancelar1: TMenuItem;
    Pendiente1: TMenuItem;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    Z2bbtnImprime: TBitBtn;
    dbgAnalisis: TwwDBGrid;
    Mantc: TMant;
    cgdPrincipal: TControlGridDisp;
    bbtnCuentas: TBitBtn;
    dblcdCuentas: TwwDBLookupComboDlg;
    Label5: TLabel;
    edtCuenta: TEdit;
    dblcTMon: TwwDBLookupCombo;
    edtMon: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure dtpFReg2Exit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure bbtnCancClick(Sender: TObject);
    procedure dbgAnalisisTopRowChanged(Sender: TObject);
    procedure dbgAnalisisCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgAnalisisDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnCuentasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcdCuentasExit(Sender: TObject);
    procedure gbPerExit(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure speAnoEnter(Sender: TObject);
    procedure speAnoExit(Sender: TObject);
    procedure speAnoKeyPress(Sender: TObject; var Key: Char);
    procedure speMMEnter(Sender: TObject);
    procedure speMMExit(Sender: TObject);
    procedure dtpFReg1Exit(Sender: TObject);
  private
    { Private declarations }
    strTmp : String ;
    procedure ExecAction(sCia, sCuenta, sMoneda: string; dtFeInicio, dtFeFinal: tdatetime; lDifCambio, lAjusteEF: boolean);
    procedure TitleGrid( MonedaMes : string );
    procedure Valida ;
  public
    { Public declarations }
    sParametro : string;
    GComprobante : TMant;
    xxCia, xxTDiario, xxAnoMM, xxNoReg : String;
  end;

var
  FAnalisisCuentaDet: TFAnalisisCuentaDet;

implementation

uses CNTDM, CNT320, CNT316, CNT412;

{$R *.DFM}


procedure TFAnalisisCuentaDet.bbtnCancClick(Sender: TObject);
begin
   DMCNT.cdsMayorAuxA.active := false;
   close;
end;

procedure TFAnalisisCuentaDet.FormActivate(Sender: TObject);
begin
	//DMCNT.cdsMayorAuxA.active := true;
	dblcdCuentasExit(Self);
  gbPerExit(Self);
  dblcTMonExit(Self);
  bbtnOkClick(Self);
end;

procedure TFAnalisisCuentaDet.bbtnOkClick(Sender: TObject);
var //  nMaxDia : integer;
	sTipoMoneda : string;
begin
  Valida ;
  if DMCNT.dsTMon.DataSet.FieldByName('TMON_LOC').asString = 'L' then
  	sTipoMoneda := 'N'
  else
  	sTipoMoneda := 'E';

  ExecAction(dblcCia.Text, dblcdCuentas.Text, sTipoMoneda, dtpFReg1.Date, dtpFReg2.Date, ckbDifCambio.Checked, ckbEEFF.Checked );

	//   dbgAnalisis.refresh;
	//   dbgAnalisis.SetFocus;
	{if DMCNT.cdsMayorAuxA.recordCount > 0 then
  	bbtnCambio.Enabled := true
  else
  	bbtnCambio.Enabled := false;}
end;

procedure TFAnalisisCuentaDet.ExecAction(sCia, sCuenta, sMoneda: string;
                                     dtFeInicio, dtFeFinal: tdatetime;
                                     lDifCambio, lAjusteEF: boolean);
var
	sCampoSaldo : string;
  sFeInicio, sFeFinal : string;
  sWhere : string;
  sSQL, sCampos : string;
  sOrder : string;
  xSaldoAcum, xTotDebe, xTotHaber, xSaldoAct : double;
begin
	Screen.Cursor:=crHourGlass;
  sCia      := quotedStr(sCia);
  sCuenta   := quotedStr(sCuenta);

  sFeInicio:= formatdatetime(wFormatFecha,dtFeInicio) ;
  sFeFinal := formatdatetime(wFormatFecha,dtFeFinal)  ;
  sWhere := 'CIAID=' + sCia +' AND CUENTAID=' + sCuenta +
               ' AND CNTFCOMP >=''' +sFeInicio+ ''' AND CNTFCOMP <=''' + sFefinal + '''' ;
  sCampos := 'CIAID, CUENTAID, CNTANOMM, CNTFCOMP, TDIARID, CNTCOMPROB, CNTGLOSA, CNTTCAMBIO, DOCID, CNTSERIE, CNTNODOC, CNTPAGADO';

  TitleGrid( sMoneda);

  sOrder := ' CUENTAID, TDIARID, CNTCOMPROB';
  sCampoSaldo:=', CNTSALDM'+sMoneda+' CNTSALDM, CNTDEBEM'+sMoneda+' CNTDEBEM, CNTHABEM'+sMoneda+' CNTHABEM, '+
                '( '+wReplacCeros+'(CNTSALDM' + sMoneda + ',0) + '+wReplacCeros+'(CNTDEBEM' + sMoneda + ',0) - '+wReplacCeros+'(CNTHABEM' + sMoneda + ',0) ) SALDOACT ';

  sSQL := sSQL + sCampos + sCampoSaldo;
  sSQL := sSQL + ' FROM CNT301 WHERE ' + sWhere ;
  sSQL := sSQL + ' ORDER BY ' + sOrder;
  sSQL := 'SELECT ' + sSQL;

  DMCNT.cdsMayorAuxA.DisableControls;
  DMCNT.cdsMayorAuxA.close;
  DMCNT.cdsMayorAuxA.ProviderName:= 'prvMayorAuxA';
  DMCNT.cdsMayorAuxA.DataRequest(sSQL);
  DMCNT.cdsMayorAuxA.Open;

  {if DMCNT.cdsMayorAuxA.RecordCount = 0 then
  begin
    ShowMessage('No Existe Detalle a Mostrar');
    Close;
    Exit;
  end;}

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
	Screen.Cursor:=crDefault;  
end;

procedure TFAnalisisCuentaDet.TitleGrid( MonedaMes : string );
begin

   if length(MonedaMes) = 0 then
      exit;

   dbgAnalisis.Selected.Clear;   dbgAnalisis.Selected.Clear;   dbgAnalisis.Selected.Clear;
   dbgAnalisis.selected.add ( 'CUENTAID'#9'10'#9'Cuenta~Contable');
   dbgAnalisis.selected.add ( 'TDIARID'#9'2'#9'Tipo~Diario');
   dbgAnalisis.selected.add ( 'CNTCOMPROB'#9'10'#9'Comprobante');
   dbgAnalisis.selected.add ( 'DOCID'#9'2'#9'Nro.Doc.');
   dbgAnalisis.selected.add ( 'CNTGLOSA'#9'15'#9'Glosa');
   dbgAnalisis.selected.add ( 'CNTTCAMBIO'#9'8'#9'Tipo de~Cambio');
   dbgAnalisis.selected.add ( 'CNTFCOMP'#9'10'#9'Fecha del~Comprobante');
   dbgAnalisis.selected.add ( 'CNTSALDM'#9'12'#9'Saldo~Ant.');
   dbgAnalisis.selected.add ( 'CNTDEBEM'#9'10'#9'Debe');
   dbgAnalisis.selected.add ( 'CNTHABEM'#9'10'#9'Haber');
   dbgAnalisis.selected.add ( 'SALDOACT'#9'12'#9'Saldo~Actual');
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


procedure TFAnalisisCuentaDet.dbgAnalisisTopRowChanged(Sender: TObject);
begin
   dbgAnalisis.invalidate;
end;

procedure TFAnalisisCuentaDet.dbgAnalisisCalcCellColors(
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

procedure TFAnalisisCuentaDet.dbgAnalisisDblClick(Sender: TObject);
var
  xSQL:string;
begin
  if DMCNT.cdsMayorAuxA.RecordCount = 0 then
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
  FConsultaComprobante.ShowModal;

//////////////////////


{  Comentado para que en la proxima se pueda ver el comprobante del registro seleccionado
   FRegComp   := TFRegComp.Create(Self);

   FRegComp.xCrea := True;

   DMCNT.cdsMovCNT1.Filtered:=False;   //// Agregado para Filtros...
   FRegComp.IniciaDatos;
   if DMCNT.wModo='A' then begin  //// Agregado para Filtros...
      FRegComp.pnlDatosCab.Enabled:=True;
      FRegComp.dblcCia.Enabled    :=True;
      FRegComp.dtpFComp.Enabled   :=True;
      FRegComp.dblcTDiario.Enabled:=True;
      FRegComp.dbeNoComp.Enabled  :=True;
      FRegComp.dtpFComp.Date:=DATE;
      DecodeDate(DATE, Year, Month, Day);
      FRegComp.cbTCambio.ItemIndex:=0;
      xCampo:='BV';
   end                     //// Agregado para Filtros...
   else begin
//// Agregado para Filtros... Inicio
      FRegComp.dblcCia.Text    := dblcCia.Text;
      FRegComp.dtpFComp.date   := date;
      FRegComp.dblcCiaExit(Sender);
      FRegComp.dbeLote.Text  := '';
//      FRegComp.dblcTMon.Text := dblcMoneda.Text;
      FRegComp.dbeTasa.Text  := DMCNT.cdsMayorAuxA.fieldbyName('CNTTCAMBIO').asString;
//      FRegComp.cbTCambio.text :=

      xCampo := DMCNT.cdsCabCntCNTTS.Value;
      if xCampo='BV' then FRegComp.cbTCambio.ItemIndex:=0;
      if xCampo='BC' then FRegComp.cbTCambio.ItemIndex:=1;
      if xCampo='PV' then FRegComp.cbTCambio.ItemIndex:=2;
      if xCampo='PC' then FRegComp.cbTCambio.ItemIndex:=3;
      if xCampo='OV' then FRegComp.cbTCambio.ItemIndex:=4;
      if xCampo='OC' then FRegComp.cbTCambio.ItemIndex:=5;
      if xCampo='OT' then FRegComp.cbTCambio.ItemIndex:=6;
      FRegComp.dblcTDiario.Text:= DMCNT.cdsMayorAuxA.fieldbyname('TDIARID').asString;
      FRegComp.dblcTDiarioExit(Sender);
      FRegComp.dbeNoComp.Text  := DMCNT.cdsMayorAuxA.fieldbyname('CNTCOMPROB').asString;
      FRegComp.dbeGlosaCab.Text:= '';
      FRegComp.dbeNoCompExit(Sender);
//      xWhere := 'TMonId=' +quotedStr(DMCNT.cdsMayorAuxA.fieldbyname('').asString);
//      FRegComp.edtTMon.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE103','TMONDES',xWhere,'TMONDES');
//      FRegComp.TotalesResumen;

      FRegComp.pnlDatosCab.Enabled:=True;
      FRegComp.dblcCia.Enabled    :=False;
      FRegComp.dtpFComp.Enabled   :=False;
      FRegComp.dblcTDiario.Enabled:=False;
      FRegComp.dbeNoComp.Enabled  :=False;
      if ( DMCNT.cdsMovCnt1CNTCuadre.Value='S' ) or
         ( DMCNT.cdsMovCnt1CNTEstado.Value='A' ) or
         ( DMCNT.cdsMovCnt1CNTEstado.Value='P' ) then
      begin
         FRegComp.pnlDatosCab.Enabled:=False;
      end
   end;

   DMCNT.cdsMovCnt1.IndexFieldNames:='CiaId;TDiarId;CNTAnoMM;CNTComprob';
   FRegComp.ShowModal;
   FRegComp.xCrea     := False;
}
end;

procedure TFAnalisisCuentaDet.FormCreate(Sender: TObject);
var
   sSQL : string;
begin
   sSQL := 'SELECT * FROM TGE202 WHERE ';
   sSQL := sSQL + 'CTA_MOV = ''S'' AND ';
   sSQL := sSQL + ' CIAID=' + quotedStr(FAnalisisCuenta.dblcCia.Text) + ' ORDER BY CUENTAID';
   DMCNT.cdsCuenta2.Close;
   DMCNT.cdsCuenta2.DataRequest(sSQL);
   DMCNT.cdsCuenta2.Open;
   DMCNT.cdsCuenta2.IndexFieldNames := 'CUENTAID';
end;

procedure TFAnalisisCuentaDet.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFAnalisisCuentaDet.bbtnCuentasClick(Sender: TObject);
begin
   FSelCuenta := TFSelCuenta.create(self) ;
   FSelCuenta.sCia:=dblcCia.text;
   FSelCuenta.ShowModal ;
end;

procedure TFAnalisisCuentaDet.FormShow(Sender: TObject);
begin
	dblcCia.Enabled :=False;
  dblcCia.Text:=FAnalisisCuenta.dblcCia.Text;
  edtCia.Text :=DMCNT.cdsCia.FieldByName('CIADES').AsString;
end;

procedure TFAnalisisCuentaDet.dblcdCuentasExit(Sender: TObject);
var
   xWhere : String;
   xAdic  : string ;
begin
  if bbtnCanc.Focused then
     Exit ;

   if trim( dblcdCuentas.Text ) = '' then
   begin
      ShowMessage('Ingrese Cuenta') ;
      dblcdCuentas.SetFocus ;
      Exit ;
   end ;
   xWhere := 'CUENTAID='+''''+dblcdCuentas.Text+''''+' and CIAID='+''''+dblcCia.Text+'''';
//wmc0404   edtCuenta.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE202','*',xWhere,'CTADES');
   xAdic := DMCNT.DisplayDescrip('PrvTGE','TGE202','*',xWhere,'CTADES');
   if trim( xAdic ) = '' then
   begin
      ShowMessage('Cuenta No está Registrada') ;
      dblcdCuentas.SetFocus ;
      Exit ;
   end
   else
      edtCuenta.Text := xAdic ;
end;

procedure TFAnalisisCuentaDet.gbPerExit(Sender: TObject);
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

procedure TFAnalisisCuentaDet.dblcTMonExit(Sender: TObject);
var
   xWhere : String;
begin
   if bbtnCanc.Focused then
     Exit ;

   edtMon.Text := '';
   xWhere := 'TMONID='+''''+dblcTMon.Text+'''';
   edtMon.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE103','TMONDES',xWhere,'TMONDES');
   if edtMon.Text='' then
   begin
      ShowMessage('Falta Tipo de Moneda');
      dblcTMon.SetFocus;
   end;
end;

procedure TFAnalisisCuentaDet.Valida;
var
   xFecha : TDate ;
begin
   if dtpFReg1.date > dtpFReg2.date then
   begin
      xFecha := dtpFReg1.date ;
      dtpFReg1.Date := dtpFReg2.date ;
      dtpFReg2.Date := xFecha ;
   end ;
end;

procedure TFAnalisisCuentaDet.speAnoEnter(Sender: TObject);
begin
   strTmp := speAno.Text ;
end;

procedure TFAnalisisCuentaDet.speAnoExit(Sender: TObject);
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

procedure TFAnalisisCuentaDet.speAnoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
     key := #0 ;
end;

procedure TFAnalisisCuentaDet.speMMEnter(Sender: TObject);
begin
   if trim(speAno.Text) = '' then
      speAno.SetFocus ;
   strTmp := speMM.Text ;
end;

procedure TFAnalisisCuentaDet.speMMExit(Sender: TObject);
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

procedure TFAnalisisCuentaDet.dtpFReg1Exit(Sender: TObject);
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

procedure TFAnalisisCuentaDet.dtpFReg2Exit(Sender: TObject);
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


End.

