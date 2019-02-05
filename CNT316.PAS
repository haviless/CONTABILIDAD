
unit CNT316;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, ComCtrls, wwdblook, wwdbdatetimepicker, Spin, Buttons, DBGrids, DB,
  Wwkeycb, Wwdbspin, oaVariables;

type
  TFAnalisisCuenta = class(TForm)
    pnlAuxiliares: TPanel;
    pnlArriba: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dbgAnalisis: TwwDBGrid;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    Z2bbtnImprime: TBitBtn;
    Label5: TLabel;
    speAno: TwwDBSpinEdit;
    Label6: TLabel;
    speMM: TwwDBSpinEdit;
    dblcNivel: TwwDBLookupCombo;
    edtNivel: TEdit;
    dblcMoneda: TwwDBLookupCombo;
    edtMon: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    pnlOrden: TPanel;
    lblBusca: TLabel;
    Bevel1: TBevel;
    isBusca: TwwIncrementalSearch;
    btnSalir: TBitBtn;
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure bbtnCancClick(Sender: TObject);
    procedure dbgAnalisisDblClick(Sender: TObject);
    procedure dbgAnalisisTopRowChanged(Sender: TObject);
    procedure dblcNivelExit(Sender: TObject);
    procedure dblcMonedaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgAnalisisTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure btnSalirClick(Sender: TObject);
    procedure isBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure speAnoKeyPress(Sender: TObject; var Key: Char);
    procedure speAnoExit(Sender: TObject);
    procedure speAnoEnter(Sender: TObject);
    procedure speMMEnter(Sender: TObject);
    procedure speMMExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure isBuscaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    strTmp : string ;
    procedure ExecAction(sCia, sMoneda, sAnyo, sMes : string );
    procedure TitleGrid( MonedaMes : string );
  public
    { Public declarations }
    sOrder : string;
    // vhn
    sCiaOrigen : String;
    sCiaCuenta : String;
  end;

  procedure CNAnalisisCuenta; stdcall;

exports
  CNAnalisisCuenta;

var
  FAnalisisCuenta: TFAnalisisCuenta;

implementation

uses CNTDM, CNT315, CNT317, CNT320;

{$R *.DFM}

procedure CNAnalisisCuenta;
begin
   if DMCNT=nil then exit;
  if not DMCNT.DCOM1.Connected then Exit;
   try
      FConsultaComprobante := TFConsultaComprobante.Create( Application );
      FAnalisisCuenta := TFAnalisisCuenta.Create( Application );
      FAnalisisCuenta.ActiveMDIChild;
      FVariables.ConfiguraForma( Screen.ActiveForm );
   Finally
   End;
end;

procedure TFAnalisisCuenta.bbtnCancClick(Sender: TObject);
begin
   DMCNT.cdsTMon.active:=false;
   close;
end;

procedure TFAnalisisCuenta.dblcCiaExit(Sender: TObject);
begin
   bbtnOk.Enabled := false;
   edtCia.Text := '';
   if dblcCia.Text = '' then
      begin
      ShowMessage('Falta Definición de Compañía');      dblcCia.SetFocus;      exit;
      end;
   edtCia.Text := DMCNT.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
      begin
      ShowMessage('Falta Definición de Compañía');      dblcCia.SetFocus;      exit;
      end;

   sCiaCuenta:=DMCNT.FiltraTablaxCia( DMCNT.cdsCuenta,  'TGE202', 'CUENTAID', dblcCia.Text );
   sCiaOrigen:=DMCNT.FiltraTablaxCia( DMCNT.cdsTDiario, 'TGE104', 'TDIARID',  dblcCia.Text );

   bbtnOk.Enabled := true;
end;

procedure TFAnalisisCuenta.bbtnOkClick(Sender: TObject);
var
   sTipoMoneda : string;
begin
   if dblcMoneda.Text = '' then
   begin
      ShowMessage('Falta Definición de Moneda');
      dblcMoneda.SetFocus;
      exit;
   end;
   if dblcNivel.Text = '' then
   begin
      ShowMessage('Falta Definición de Nivel');
      dblcNivel.SetFocus;
      exit;
   end;
   if speAno.Text = '' then
   begin
      ShowMessage('Falta Año del Periodo');
      speAno.SetFocus;
      exit;
   end;
   if speMM.Text = '' then
   begin
      ShowMessage('Falta Mes del Periodo');
      speMM.SetFocus;
      exit;
   end;

   screen.Cursor:=crHourGlass;
   if DMCNT.wTMonLoc=dblcMoneda.Text
      then sTipoMoneda := 'N'
      else sTipoMoneda := 'E';

   ExecAction(dblcCia.Text, sTipoMoneda, speAno.text, speMM.text );
   screen.Cursor:=crDefault;
end;

procedure TFAnalisisCuenta.ExecAction(sCia, sMoneda, sAnyo, sMes: string );
//sCia, sCuenta, sFeInicio, sFeFinal, sMoneda: string;
//nAnalisis, nEstado : byte;
var
	sWhere, sSQL, sCampos, sMonMes, sJoin, sMesAnt : string;
  xSaldoAcum, xTotDebe, xTotHaber, xSaldoAct : double;
begin
	sSQL   := '';
  sCia   := quotedStr(sCia);
  sAnyo  := quotedStr(sAnyo);

  sMonMes:= sMoneda + DMCNT.StrZero(sMes, 2);
  sMesAnt:= sMoneda + DMCNT.StrZero(InttoStr((StrtoInt(sMes)-1)), 2);
  sCampos:= ' CNT401.CUENTAID, CNT401.CTADES, CNT202.DIGITOS ';
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
  	sWhere := 'CNT401.CIAID=' + sCia + ' AND CNT401.ANO=' + sAnyo ;
    sWhere := sWhere + ' AND TGE202.CTANIV<='+''''+dblcNivel.Text+'''';
    sWhere := sWhere + ' AND '+wReplacCeros+'(CNT401.AUXID, '''' )='+''''+''+'''';
    sWhere := sWhere + ' AND '+wReplacCeros+'(CNT401.CCOSID,'''') ='+''''+''+'''';
    //sWhere := sWhere + ' AND '+wReplacCeros+'(CNT401.AUXID,''N'')=''N''';
    sJoin := ' LEFT JOIN TGE202 ON (TGE202.CUENTAID=CNT401.CUENTAID AND TGE202.CIAID=CNT401.CIAID) ';
    sJoin := sJoin+' LEFT JOIN CNT202 ON (TGE202.CTANIV=CNT202.NIVEL) ';

    sOrder := ' CNT401.CUENTAID';

    sSQL := 'SELECT ';
    sSQL := sSQL + sCampos + ', CNT401.SALDM' + sMesAnt + ' SALDO, CNT401.DEBEM' + sMonMes + ' DEBE, CNT401.HABEM' + sMonMes +' HABER, '+
    ''+wReplacCeros+'(CNT401.SALDM' + sMesAnt  + ',0) + '+wReplacCeros+'(CNT401.DEBEM' + sMonMes + ',0) - '+wReplacCeros+'(CNT401.HABEM' + sMonMes +',0) SALDOACT ';
    sSQL := sSQL + ' FROM CNT401 ' +sJoin+ ' WHERE ' +sWhere;
    sSQL := sSQL +  ' ORDER BY ' + sOrder ;
  end
  else
  if SRV_D = 'ORACLE' then
  begin
  	sWhere := 'CNT401.CIAID=' + sCia + ' AND CNT401.ANO=' + sAnyo ;
    sWhere := sWhere + ' AND TGE202.CTANIV<='+''''+dblcNivel.Text+'''';
		//sWhere := sWhere + ' AND '+wReplacCeros+'(CNT401.AUXID, '''' )='+''''+''+'''';
    //sWhere := sWhere + ' AND '+wReplacCeros+'(CNT401.CCOSID,'''') ='+''''+''+'''';
    sWhere := sWhere + ' AND (TGE202.CUENTAID(+)=CNT401.CUENTAID AND TGE202.CIAID(+)=CNT401.CIAID) ';
    sWhere := sWhere + ' AND '+wReplacCeros+'(CNT401.AUXID,''N'')=''N''';
    sWhere := sWhere + ' AND (TGE202.CTANIV=CNT202.NIVEL) ';

    sOrder := ' CNT401.CUENTAID';
    sSQL := 'SELECT';
    sSQL := sSQL + sCampos + ', SUM(CNT401.SALDM' + sMesAnt + ') SALDO, SUM(CNT401.DEBEM' + sMonMes + ') DEBE, SUM(CNT401.HABEM' + sMonMes +') HABER, '+
                                'SUM('+wReplacCeros+'(CNT401.SALDM' + sMesAnt  + ',0) + '+wReplacCeros+'(CNT401.DEBEM' + sMonMes + ',0) - '+wReplacCeros+'(CNT401.HABEM' + sMonMes +',0)) SALDOACT ';
    sSQL := sSQL + ' FROM CNT401,TGE202,CNT202 WHERE ' +sWhere;

    if sCiaCuenta<>'' then
    begin
       sSQL := sSQL +' and CNT401.'+ sCiaCuenta;
    end;

    sSQL := sSQL +  ' GROUP BY CNT401.CUENTAID, CNT401.CTADES, CNT202.DIGITOS';
    sSQL := sSQL +  ' ORDER BY ' + sOrder ;
  end;
  DMCNT.cdsMayorAux.DisableControls;
  DMCNT.cdsMayorAux.close;
  DMCNT.cdsMayorAux.ProviderName:= 'prvMayorAux';
  DMCNT.cdsMayorAux.DataRequest(sSQL);
  DMCNT.cdsMayorAux.Open;

  TitleGrid( sMonMes);   //Modifica la visualizacion del grid

  if DMCNT.cdsMayorAux.recordCount = 0 then
  begin
  	dbgAnalisis.ColumnByName('SALDO').FooterValue :=floattostrf(0.00, ffNumber, 10, 2);
    dbgAnalisis.ColumnByName('DEBE').FooterValue  :=floattostrf(0.00,   ffNumber, 10, 2);
    dbgAnalisis.ColumnByName('HABER').FooterValue :=floattostrf(0.00,  ffNumber, 10, 2);
    dbgAnalisis.ColumnByName('SALDOACT').FooterValue:=floattostrf(0.00,  ffNumber, 10, 2);
    ShowMessage('No existen Cuentas para este Periodo');
    DMCNT.cdsMayorAux.EnableControls;
    exit;
  end;

  DMCNT.cdsMayorAux.EnableControls;

   DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Analisis de Cuenta',
        dblcCia.Text,                                  // Campañía
        speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
        '', '',                                        // Fecha   Inicio - final
        dblcNivel.text,  '',                           // Nivel   - Origen
        '', dblcMoneda.TEXT,                           // Lote    -  Moneda
        '', '',                                        // Cuentas - Auxiliares
        '', 'Pantalla',                                // Costos - Tipo Salida
        '' );                                          // Tipo Rep


  xSaldoAcum := DMCNT.OperClientDataSet( DMCNT.cdsMayorAux,'SUM('+'SALDO'+')','DIGITOS=1');
  xTotDebe   := DMCNT.OperClientDataSet( DMCNT.cdsMayorAux,'SUM('+'DEBE'+')','DIGITOS=1');
  xTotHaber  := DMCNT.OperClientDataSet( DMCNT.cdsMayorAux,'SUM('+'HABER'+')','DIGITOS=1');
  xSaldoAct  := DMCNT.OperClientDataSet( DMCNT.cdsMayorAux,'SUM('+'SALDOACT'+')','DIGITOS=1');

  TNumericField( DMCNT.cdsMayorAux.FieldByName('SALDO')   ).DisplayFormat:='### ### ###.#0';
  TNumericField( DMCNT.cdsMayorAux.FieldByName('DEBE' )   ).DisplayFormat:='### ### ###.#0';
  TNumericField( DMCNT.cdsMayorAux.FieldByName('HABER')   ).DisplayFormat:='### ### ###.#0';
  TNumericField( DMCNT.cdsMayorAux.FieldByName('SALDOACT')).DisplayFormat:='### ### ###.#0';

  dbgAnalisis.ColumnByName('SALDO').FooterValue   :=floattostrf(xSaldoAcum,ffNumber, 10, 2);
  dbgAnalisis.ColumnByName('DEBE').FooterValue    :=floattostrf(xTotDebe,  ffNumber, 10, 2);
  dbgAnalisis.ColumnByName('HABER').FooterValue   :=floattostrf(xTotHaber, ffNumber, 10, 2);
  dbgAnalisis.ColumnByName('SALDOACT').FooterValue:=floattostrf(xSaldoAct, ffNumber, 10, 2);
end;

procedure TFAnalisisCuenta.dbgAnalisisDblClick(Sender: TObject) ;
var
	sCtaDes  : string ;
  sCuentaID : string ;
  xWhere    : String ;
begin
	if DMCNT.cdsMayorAux.RecordCount = 0 then
  begin
  	Showmessage('No hay Una Cuenta Seleccionada') ;
    Exit ;
  end ;

  sCuentaID := DMCNT.cdsMayorAux.FieldByName('CUENTAID').AsString;

  xWhere := 'CUENTAID='+''''+sCuentaID+''''+' and CIAID='+''''+dblcCia.Text+'''' ;
  if DMCNT.DisplayDescrip('PrvTGE','TGE202','*',xWhere,'CTA_MOV')<>'S' then
  begin
  	Showmessage('La Cuenta No es de Movimiento') ;
    Exit;
  end;

  sCtaDes := '';
  screen.Cursor:=crHourGlass;
  FAnalisisCuentaDet := TFAnalisisCuentaDet.Create (self);
  Try
  	FAnalisisCuentaDet.Caption := 'Analisis de Cuenta : [' + sCuentaID + ']';

    FAnalisisCuentaDet.speAno.Text := speAno.Text;
    FAnalisisCuentaDet.speMM.Text := speMM.Text;

    FAnalisisCuentaDet.dblcCia.Text := dblcCia.Text;
    FAnalisisCuentaDet.edtCia.Text := edtCia.Text;

    FAnalisisCuentaDet.dblcdCuentas.Text:= sCuentaID;
    FAnalisisCuentaDet.dblcTMon.Text    := dblcMoneda.Text;

    FAnalisisCuentaDet.ShowModal;
  finally
  	FAnalisisCuentaDet.Free;
  end;
  screen.Cursor:=crDefault;
end;

procedure TFAnalisisCuenta.TitleGrid( MonedaMes : string );
begin
   if length(MonedaMes) = 0 then
      exit;

   dbgAnalisis.DataSource := NIL;

   dbgAnalisis.Selected.Clear;

   dbgAnalisis.Selected.Add ('CUENTAID'#9'15'#9'Cuenta~Contable'#9'F');
   dbgAnalisis.Selected.Add ('CTADES'#9'25'#9'Cuenta~Descripcion'#9'F');
   dbgAnalisis.Selected.Add ('SALDO'#9'15'#9'Saldo~Ant'#9'F');
   dbgAnalisis.Selected.Add ('DEBE'#9'15'#9'Debe'#9'F');
   dbgAnalisis.Selected.Add ('HABER'#9'15'#9'Haber'#9'F');
   dbgAnalisis.Selected.Add ('SALDOACT'#9'15'#9'Saldo~Actual'#9'F');

   dbgAnalisis.SetPictureMask('SALDO','###,###,###.00');
   dbgAnalisis.SetPictureMask('DEBE','###,###,###.00');
   dbgAnalisis.SetPictureMask('HABER','###,###,###.00');
   dbgAnalisis.SetPictureMask('SALDOACT','###,###,###.00');

   dbgAnalisis.SetPictureMask('SALD'+MonedaMes,'###,###,###.00');
   dbgAnalisis.SetPictureMask('DEBE'+MonedaMes,'###,###,###.00');
   dbgAnalisis.SetPictureMask('HABE'+MonedaMes,'###,###,###.00');
   dbgAnalisis.SetPictureMask('SALDOACT'+MonedaMes,'###,###,###.00');
   dbgAnalisis.ControlType := dbgAnalisis.Selected ;
   dbgAnalisis.DataSource := DMCNT.dsMayorAux;
end;


procedure TFAnalisisCuenta.dbgAnalisisTopRowChanged(Sender: TObject);
begin
	dbgAnalisis.invalidate;
end;

procedure TFAnalisisCuenta.dblcNivelExit(Sender: TObject);
var
   xWhere : String;
begin
   edtNivel.Text := '';
   xWhere := 'NIVEL='+''''+dblcNivel.Text+'''';
   edtNivel.Text:=DMCNT.DisplayDescrip('PrvTGE','CNT202','*',xWhere,'DIGITOS');
   if length(edtNivel.Text) = 0 then begin
      ShowMessage('Falta Definición de Nivel');
      dblcNivel.SetFocus;
      exit;
   end;
end;

procedure TFAnalisisCuenta.dblcMonedaExit(Sender: TObject);
var
   xWhere : String;
begin
   edtMon.Text := '';
   xWhere := 'TMONID='+''''+dblcMoneda.Text+'''';
   edtMon.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE103','TMONDES',xWhere,'TMONDES');
//   if dblcTMon.Text<>'' then edtTMon.Text:=DMCNT.cdsTMonTMonDes.Text;
   if edtMon.Text='' then
   begin
      ShowMessage('Falta Tipo de Moneda');
      dblcMoneda.SetFocus;
   end;
end;

procedure TFAnalisisCuenta.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFAnalisisCuenta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMCNT.cdsMayorAux.close;
   FConsultaComprobante.Free;
   Action:=caFree;
end;

procedure TFAnalisisCuenta.dbgAnalisisTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   if AfieldName='CUENTAID' then
   begin
      lblBusca.Caption:='Busca por Cuenta:';
      pnlOrden.Visible := True;
      isBusca.Text:='';
      isBusca.SetFocus;
      pnlAuxiliares.Enabled  := False ;
      pnlArriba.Enabled      := False ;
//wmc0404   dbgEst1.Enabled  := False ;
   end;
end;

procedure TFAnalisisCuenta.btnSalirClick(Sender: TObject);
begin
	pnlOrden.Visible := False;
  pnlAuxiliares.Enabled  := True ;
  pnlArriba.Enabled  := True ;
	//wmc0404   dbgEst1.Enabled  := true ;
end;

procedure TFAnalisisCuenta.isBuscaKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      pnlOrden.Visible := False;
//wmc0404      dbgEst1.SetFocus;
   end;
end;

procedure TFAnalisisCuenta.speAnoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
     key := #0 ;
end;


procedure TFAnalisisCuenta.speAnoEnter(Sender: TObject);
begin
   strTmp := speAno.Text ;
end;

procedure TFAnalisisCuenta.speMMEnter(Sender: TObject);
begin
   if trim(speAno.Text) = '' then
      speAno.SetFocus ;
   strTmp := speMM.Text ;
end;

procedure TFAnalisisCuenta.speMMExit( Sender: TObject ) ;
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

procedure TFAnalisisCuenta.speAnoExit ( Sender: TObject ) ;
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


procedure TFAnalisisCuenta.FormDestroy(Sender: TObject);
begin
   DMCNT.cdsMayorAux.IndexFieldNames := '' ;
   DMCNT.cdsMayorAux.FILTER := '' ;
   DMCNT.cdsMayorAux.FILTERED := fALSE ;
end;

procedure TFAnalisisCuenta.FormCreate(Sender: TObject);
begin
   DMCNT.cdsMayorAux.IndexFieldNames := '' ;
   DMCNT.cdsMayorAux.FILTER := '' ;
   DMCNT.cdsMayorAux.FILTERED := fALSE ;

end;

procedure TFAnalisisCuenta.isBuscaExit(Sender: TObject);
begin
	btnSalir.Click;
end;

procedure TFAnalisisCuenta.FormShow(Sender: TObject);
var
   nAnyo, nMes, nDia : word;
begin
   decodeDate(now, nAnyo, nMes, nDia);
   speAno.Text := inttoStr(nAnyo);
   speMM.Text := inttoStr(nMes);
   DMCNT.cdsRCuenta.active:= false;
   DMCNT.cdsTMon.active :=true;
   DMCNT.cdsNivel.active:=true;

   DMCNT.cdsCia.Filtered := False     ;
   if not DMCNT.cdsCia.Active then
      DMCNT.cdsCia.Open ;
   if DMCNT.cdsCia.RecordCount = 1 then
   begin
      dblcCia.Text := DMCNT.cdsCia.fieldbyname('CIAID').AsString ;
      edtCia.Text  := DMCNT.cdsCia.fieldbyname('CIADES').AsString ;
      dblcCia.Enabled := False ;
   end ;
end;

End.
