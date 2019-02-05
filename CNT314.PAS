unit CNT314;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, ComCtrls, wwdblook, wwdbdatetimepicker, Spin, Buttons, DBGrids,
  Wwdbdlg, db, Wwdbspin, Wwkeycb, oaVariables;

type
  TFMayorAuxiliar = class(TForm)
    pnlAuxiliares: TPanel;
    pnlArriba: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    rgTipoAnalisis: TRadioGroup;
    dbgAnalisis: TwwDBGrid;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    Z2bbtnImprime: TBitBtn;
    Label7: TLabel;
    dblcdCuentas: TwwDBLookupComboDlg;
    edtCuenta: TEdit;
    Label5: TLabel;
    speAno: TwwDBSpinEdit;
    Label6: TLabel;
    speMM: TwwDBSpinEdit;
    Label9: TLabel;
    dblcTMon: TwwDBLookupCombo;
    edtMon: TEdit;
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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcdCuentasExit(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcdCuentasEnter(Sender: TObject);
    procedure speAnoEnter(Sender: TObject);
    procedure speAnoExit(Sender: TObject);
    procedure speAnoKeyPress(Sender: TObject; var Key: Char);
    procedure speMMEnter(Sender: TObject);
    procedure speMMExit(Sender: TObject);
    procedure dbgAnalisisTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure btnSalirClick(Sender: TObject);
    procedure isBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgTipoAnalisisClick(Sender: TObject);
  private
    { Private declarations }
    strTmp , Tmp : string ;
    procedure ExecAction(sCia, sCuenta, sMoneda, sAnyo, sMes : string; nAnalisis: byte );
    procedure TitleGrid(Analisis : byte; MonedaMes : string );
    procedure Valida ;
  public
    { Public declarations }
    sOrder : string;
    // vhn
    sCiaOrigen : String;
    sCiaCuenta : String;
  end;


var
  FMayorAuxiliar: TFMayorAuxiliar;

implementation

uses CNTDM, CNT315, CNT320;

{$R *.DFM}



procedure TFMayorAuxiliar.bbtnCancClick(Sender: TObject);
begin
   DMCNT.cdsTMon.active:=false;
   close;
end;

procedure TFMayorAuxiliar.dblcCiaExit(Sender: TObject);
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
   rgTipoAnalisis.OnClick(sender);
end;

procedure TFMayorAuxiliar.bbtnOkClick(Sender: TObject);
var  sTipoMoneda : string;
begin
   Valida ;

   if DMCNT.wTMonLoc=dblcTMon.Text
      then sTipoMoneda := 'N'
      else sTipoMoneda := 'E';

   ExecAction(dblcCia.Text, dblcdCuentas.Text, sTipoMoneda, speAno.text, speMM.text, rgTipoAnalisis.ItemIndex  );

end;


procedure TFMayorAuxiliar.ExecAction(sCia, sCuenta, sMoneda, sAnyo, sMes: string;
                                     nAnalisis: byte);
var sWhere : string;
   sSQL, sCampos : string;
   xMesAnt,sMonMes : string;
   sJoin : string;
   xSaldoAcum, xTotDebe, xTotHaber, xSaldoAct : double;
begin
   sSQL := '';
   sCia := quotedStr(sCia);
   sCuenta := quotedStr(sCuenta);
   sAnyo := quotedStr(sAnyo);

   sMonMes := sMoneda + DMCNT.StrZero(sMes, 2);
   xMesAnt := IntToStr(StrToInt(Copy(sMonMes,2,2))-1);
   xMesAnt := sMoneda + DMCNT.StrZero(xMesAnt, 2);

   sWhere := 'CNT401.CIAID=' + sCia + ' AND CNT401.CUENTAID=' + sCuenta + ' AND CNT401.ANO=' + sAnyo ;

   if sCiaCuenta<>'' then
   begin
       sWhere :=sWhere  +' and CNT401.'+ sCiaCuenta;
   end;

    if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
    begin
       case nAnalisis of
         0:  begin
             sCampos:= ' CNT401.AUXID, CNT401.CLAUXID, CNT201.AUXNOMB ';
             sWhere := sWhere + ' AND TGE202.CTA_MOV=''S'' '+
                                ' AND CNT401.AUXID IS NOT NULL AND CNT401.AUXID<> ' +quotedStr(' ');
                            //    +' AND ( CNT401.CCOSID = '''' OR CNT401.CCOSID = '' '' OR CNT401.CCOSID IS NULL ) ';
             sOrder:=' CNT401.AUXID, CNT401.CLAUXID ';
             sJoin :=' LEFT JOIN TGE202 ON ( TGE202.CUENTAID=CNT401.CUENTAID AND TGE202.CIAID=CNT401.CIAID ) '
                    +' LEFT JOIN CNT201 ON ( CNT201.CLAUXID =CNT401.CLAUXID  AND CNT201.AUXID=CNT401.AUXID ) ';
             end;
         1:  begin
             sCampos:= ' CNT401.CCOSID, TGE203.CCOSDES ';
             sWhere := sWhere + ' AND TGE202.CTA_CCOS=''S''' +
                                ' AND CNT401.CCOSID<>'''' AND CNT401.CCOSID<>'' '' AND CNT401.CCOSID IS NOT NULL';
             sOrder:=' CNT401.CCOSID ';
             sJoin :=' LEFT JOIN TGE202 ON ( TGE202.CUENTAID=CNT401.CUENTAID AND TGE202.CIAID = CNT401.CIAID) '
                    +' LEFT JOIN TGE203 ON ( TGE203.CCOSID  =CNT401.CCOSID ) ';
             end;
       end;
       //sJoin := ' LEFT JOIN TGE202 ON (TGE202.CUENTAID = CNT401.CUENTAID AND TGE202.CIAID = CNT401.CIAID) ';

       sSQL := 'SELECT ';
       if nAnalisis = 0 then
          sSQL := sSQl + sCampos + ', CNT401.SALDM' + xMesAnt + ' SALDO, CNT401.DEBEM' + sMonMes + ' DEBE, CNT401.HABEM' + sMonMes +' HABER, '+
                                   ''+wReplacCeros+'(CNT401.SALDM' + xMesAnt  + ',0) + '+wReplacCeros+'(CNT401.DEBEM' + sMonMes + ',0) - '+
                                     wReplacCeros+'(CNT401.HABEM' + sMonMes +',0) SALDOACT '
       else
          sSQL := sSQL + sCampos +  ', '+wReplacCeros+'(sum(CNT401.SALDM'  +xMesAnt+ '),0) SALDO, '+
                                      ''+wReplacCeros+'(sum(CNT401.DEBEM' +sMonMes+ '),0) DEBE, '+
                                      ''+wReplacCeros+'(sum(CNT401.HABEM' +sMonMes+ '),0) HABER, '+
                                     'sum('+wReplacCeros+'(CNT401.SALDM' +xMesAnt+ ',0) + '+wReplacCeros+'(CNT401.DEBEM' + sMonMes + ',0) - '+wReplacCeros+'(CNT401.HABEM' + sMonMes +',0) ) SALDOACT ';
       sSQL := sSQl + ' FROM CNT401 ' +sJoin+ ' WHERE ' +sWhere;

       if nAnalisis = 1 then
          sSQL := sSQL + ' GROUP BY '+ sCampos ;
       sSQL := sSQL +  ' ORDER BY ' + sOrder ;
    end
    else
      if SRV_D = 'ORACLE' then
      begin
          case nAnalisis of
            0:  begin
                sCampos:= ' CNT401.AUXID, CNT401.CLAUXID, CNT201.AUXNOMB';
                sWhere := sWhere + ' AND TGE202.CTA_MOV(+)='+quotedstr('S')+
                                   ' AND CNT401.AUXID IS NOT NULL AND CNT401.AUXID<> ' +quotedStr(' ')+
                                   ' AND ( CNT401.CCOSID = '+quotedstr('')+' OR CNT401.CCOSID = '+quotedstr(' ')+' OR CNT401.CCOSID IS NULL ) '+
                                   ' AND ( TGE202.CIAID(+)=CNT401.CIAID'+
                                   ' AND  TGE202.CUENTAID(+)=CNT401.CUENTAID'+
                                   ' AND TGE202.CTA_AUX(+)='+quotedstr('S')+' )'+
                                   ' AND ( CNT401.CLAUXID=CNT201.CLAUXID(+) AND CNT401.AUXID=CNT201.AUXID(+) ) ';

                sOrder := ' CNT401.AUXID, CNT401.CLAUXID ';
                end;
            1:  begin
                sCampos:= ' CNT401.CCOSID, TGE203.CCOSDES';
                sWhere := sWhere   + ' AND TGE202.CTA_MOV(+)='+quotedstr('S')+
                                   ' AND LENGTH(TRIM(CNT401.CCOSID))>0 AND CNT401.CCOSID IS NOT NULL'+
                                   ' AND ( CNT401.AUXID = '+quotedstr('')+' OR CNT401.AUXID = '+quotedstr(' ')+' OR CNT401.AUXID IS NULL ) '+
                                   ' AND (TGE202.CIAID(+) = CNT401.CIAID) '+
                                   ' AND (TGE202.CUENTAID(+) = CNT401.CUENTAID) '+
                                   ' AND TGE202.CTA_CCOS(+)='+quotedstr('S')+
                                   ' AND TGE203.CCOSID(+)=CNT401.CCOSID ';
                sOrder := ' CNT401.CCOSID ';
                end;
          end;

          sSQL := 'SELECT ';
          if nAnalisis = 0 then
          begin
             sSQL := sSQl + sCampos + ', CNT401.SALDM' + xMesAnt + ' SALDO, CNT401.DEBEM' + sMonMes + ' DEBE, CNT401.HABEM' + sMonMes +' HABER, '+
                                  ''+wReplacCeros+'(CNT401.SALDM' + xMesAnt  + ',0) + '+wReplacCeros+'(CNT401.DEBEM' + sMonMes + ',0) - '+wReplacCeros+'(CNT401.HABEM' + sMonMes +',0) SALDOACT ';
             sSQL := sSQl + ' FROM CNT401, TGE202, CNT201 WHERE ' +sWhere;
          end
          else
          begin
             sSQL := sSQL + sCampos +  ', '+wReplacCeros+'(sum(CNT401.SALDM' +xMesAnt+ '),0) SALDO, '+
                                         ''+wReplacCeros+'(sum(CNT401.DEBEM' +sMonMes+ '),0) DEBE,  '+
                                         ''+wReplacCeros+'(sum(CNT401.HABEM' +sMonMes+ '),0) HABER, '+
                                        'sum('+wReplacCeros+'(CNT401.SALDM' +xMesAnt+ ',0) + '+wReplacCeros+'(CNT401.DEBEM' + sMonMes + ',0) - '+wReplacCeros+'(CNT401.HABEM' + sMonMes +',0) ) SALDOACT ';
             sSQL := sSQl + ' FROM CNT401, TGE202, TGE203 WHERE '+sWhere;
          end;
          if nAnalisis = 1 then
             sSQL := sSQL + ' GROUP BY '+ sCampos ;

          sSQL := sSQL +  ' ORDER BY ' + sOrder ;
      end;

   DMCNT.cdsMayorAux.DisableControls;
   DMCNT.cdsMayorAux.close;
   DMCNT.cdsMayorAux.ProviderName:= 'prvMayorAux';
   DMCNT.cdsMayorAux.DataRequest(sSQL);
   DMCNT.cdsMayorAux.Open;

   TitleGrid(nAnalisis, sMonMes);   //Modifica la visualizacion del grid

   if DMCNT.cdsMayorAux.recordCount = 0 then
   begin
      dbgAnalisis.ColumnByName('SALDO').FooterValue   :=floattostrf(0.00, ffNumber, 10, 2);
      dbgAnalisis.ColumnByName('DEBE').FooterValue    :=floattostrf(0.00, ffNumber, 10, 2);
      dbgAnalisis.ColumnByName('HABER').FooterValue   :=floattostrf(0.00, ffNumber, 10, 2);
      dbgAnalisis.ColumnByName('SALDOACT').FooterValue:=floattostrf(0.00, ffNumber, 10, 2);
      ShowMessage('No existen Movimientos para Analizar');
      DMCNT.cdsMayorAux.EnableControls;
      exit;
   end;

   DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Analisis x Auxiliar y C.Costo',
        dblcCia.Text,                                  // Campañía
        speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
        '', '',              // Fecha   Inicio - final
        '',  '',                           // Nivel   - Origen
        '', dblcTMon.TEXT,                             // Lote    -  Moneda
        dblcdCuentas.TEXT, '',                         // Cuentas - Auxiliares
        '', 'Pantalla',                                // Costos - Tipo Salida
        inttostr(rgTipoAnalisis.itemindex) );          // Tipo Rep

   DMCNT.cdsMayorAux.EnableControls;

   xSaldoAcum := DMCNT.OperClientDataSet( DMCNT.cdsMayorAux,'SUM('+'SALDO'+')','');
   xTotDebe   := DMCNT.OperClientDataSet( DMCNT.cdsMayorAux,'SUM('+'DEBE'+')','');
   xTotHaber  := DMCNT.OperClientDataSet( DMCNT.cdsMayorAux,'SUM('+'HABER'+')','');
   xSaldoAct  := DMCNT.OperClientDataSet( DMCNT.cdsMayorAux,'SUM('+'SALDOACT'+')','');

   TNumericField( DMCNT.cdsMayorAux.FieldByName('SALDO')   ).DisplayFormat:='### ### ###.#0';
   TNumericField( DMCNT.cdsMayorAux.FieldByName('DEBE' )   ).DisplayFormat:='### ### ###.#0';
   TNumericField( DMCNT.cdsMayorAux.FieldByName('HABER')   ).DisplayFormat:='### ### ###.#0';
   TNumericField( DMCNT.cdsMayorAux.FieldByName('SALDOACT')).DisplayFormat:='### ### ###.#0';

   dbgAnalisis.ColumnByName('SALDO').FooterValue   :=floattostrf(xSaldoAcum,ffNumber, 10, 2);
   dbgAnalisis.ColumnByName('DEBE').FooterValue    :=floattostrf(xTotDebe,  ffNumber, 10, 2);
   dbgAnalisis.ColumnByName('HABER').FooterValue   :=floattostrf(xTotHaber, ffNumber, 10, 2);
   dbgAnalisis.ColumnByName('SALDOACT').FooterValue:=floattostrf(xSaldoAct, ffNumber, 10, 2);
end;

procedure TFMayorAuxiliar.dbgAnalisisDblClick(Sender: TObject);
var sCtaDes : string;
   sCuentaID : string;
begin
   if DMCNT.dsMayorAux.DataSet.RecordCount = 0 then
   begin
      if rgTipoAnalisis.ItemIndex = 0 then
         Raise Exception.Create('No Hay Auxiliares Seleccionados')
      else
         Raise Exception.Create('No Hay Centros de Costos Seleccionados')
   end ;

   sCuentaID := dblcdCuentas.Text;
   sCtaDes := '';

   FMayorAuxiliarAnalisis := TFMayorAuxiliarAnalisis.Create (self);
   Try
      FMayorAuxiliarAnalisis.Caption := 'Analisis x Auxiliar y Centro de Costo [ Cta.:' + sCuentaID + ']';

      FMayorAuxiliarAnalisis.dblcCia.Text := dblcCia.Text;
      FMayorAuxiliarAnalisis.edtCia.Text := edtCia.Text;
      FMayorAuxiliarAnalisis.rgTipoAnalisis.ItemIndex := rgTipoAnalisis.ItemIndex;
      FMayorAuxiliarAnalisis.dblcdCuentas.Text:= sCuentaID;
      FMayorAuxiliarAnalisis.speAno.Text := speAno.Text;
      FMayorAuxiliarAnalisis.speMM.Text := speMM.Text;
      FMayorAuxiliarAnalisis.dblcTMon.Text := dblcTMon.Text;

      if rgTipoAnalisis.ItemIndex = 0 then
         begin
            FMayorAuxiliarAnalisis.lblParametro.Caption  := 'Auxiliar ID.:';
            FMayorAuxiliarAnalisis.edtParametro.Text := DMCNT.dsMayorAux.DataSet.fieldbyname('AUXID').asString;
            FMayorAuxiliarAnalisis.edtParametro2.Text := DMCNT.dsMayorAux.DataSet.fieldbyname('AUXNOMB').asString;
//            FMayorAuxiliarAnalisis.edtParametro2.Text := DMCNT.dsMayorAux.DataSet.fieldbyname('AUXDES').asString;
            FMayorAuxiliarAnalisis.sParametro := DMCNT.dsMayorAux.DataSet.fieldbyname('AUXID').asString ;
            FMayorAuxiliarAnalisis.sParametro2 := DMCNT.dsMayorAux.DataSet.fieldbyname('CLAUXID').asString ;
         end
      else begin
         FMayorAuxiliarAnalisis.lblParametro.Caption  := 'Centro de Costo:';
         FMayorAuxiliarAnalisis.edtParametro.Text := DMCNT.dsMayorAux.DataSet.fieldbyname('CCOSID').asString;
         FMayorAuxiliarAnalisis.edtParametro2.Text := DMCNT.dsMayorAux.DataSet.fieldbyname('CCOSDES').asString;
//         FMayorAuxiliarAnalisis.edtParametro2.Text := DMCNT.dsMayorAux.DataSet.fieldbyname('CCODES').asString;
         FMayorAuxiliarAnalisis.sParametro := DMCNT.dsMayorAux.DataSet.fieldbyname('CCOSID').asString;
      end;

      FMayorAuxiliarAnalisis.ShowModal;
   Finally
      FMayorAuxiliarAnalisis.Free;
   End;

end;

procedure TFMayorAuxiliar.TitleGrid(Analisis : byte; MonedaMes : string );
begin
   if length(MonedaMes) = 0 then exit;

   dbgAnalisis.DataSource := NIL;

   dbgAnalisis.Selected.Clear;

   if Analisis = 0 then
   begin
      dbgAnalisis.Selected.Add ('CLAUXID'#9'2'#9'Clase'#9'F');
      dbgAnalisis.Selected.Add ('AUXID'#9'8'#9'Auxiliar'#9'F');
      dbgAnalisis.Selected.Add ('AUXNOMB'#9'30'#9'Auxiliar~Descripcion'#9'F');
   end
   else
   begin
      dbgAnalisis.Selected.Add ('CCOSID'#9'15'#9'C.Costo~ID'#9'F');
      dbgAnalisis.Selected.Add ('CCOSDES'#9'30'#9'Centro de Costo~Descripcion'#9'F');
   end;
   dbgAnalisis.Selected.Add ('SALDO'#9'13'#9'Saldo ~Ant'#9'F');
   dbgAnalisis.Selected.Add ('DEBE'#9'13'#9'Debe'#9'F');
   dbgAnalisis.Selected.Add ('HABER'#9'13'#9'Haber'#9'F');
   dbgAnalisis.Selected.Add ('SALDOACT'#9'13'#9'Saldo~Act'#9'F');

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


procedure TFMayorAuxiliar.dbgAnalisisTopRowChanged(Sender: TObject);
begin
   dbgAnalisis.invalidate;
end;

procedure TFMayorAuxiliar.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFMayorAuxiliar.dblcdCuentasExit(Sender: TObject);
var
   xWhere : String;
   xAdic  : string ;
begin
   if bbtnCanc.Focused then
      Exit ;

   if rgTipoAnalisis.Focused then
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
      xAdic := DMCNT.DisplayDescrip('PrvTGE','TGE202','*',xWhere,'CTADES') ;
      if trim( xAdic ) = '' then
      begin
         dblcdCuentas.SetFocus ;
         strTmp := Tmp ;
         Raise Exception.Create('Cuenta No Registrada') ;
      end
      else
         edtCuenta.Text := xAdic ;
   end ;
end;

procedure TFMayorAuxiliar.dblcTMonExit(Sender: TObject);
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

procedure TFMayorAuxiliar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMCNT.cdsMayorAux.close;
   FConsultaComprobante.Free;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
   Action:=caFree;
end;

procedure TFMayorAuxiliar.dblcdCuentasEnter(Sender: TObject);
var
   sSQL : string;
begin
   sSQL := 'SELECT * FROM TGE202 WHERE ';
   if rgTipoAnalisis.ItemIndex = 0 then
      sSQL:=sSQL + 'CTA_AUX = ''S'' AND CTA_MOV = ''S'' AND CIAID='+quotedStr(dblcCia.text)
   else
      sSQL:=sSQL + 'CTA_MOV = ''S'' AND CTA_CCOS=''S'' AND CIAID='+quotedStr(dblcCia.text);

   if sCiaCuenta<>'' then
   begin
      sSQL:=sSQL +' and '+ sCiaCuenta;
   end;

   sSQL:=sSQL + ' AND CIAID=' + quotedStr(dblcCia.Text) + ' ORDER BY CUENTAID';

   DMCNT.cdsCuenta2.Close;
   DMCNT.cdsCuenta2.DataRequest(sSQL);
   DMCNT.cdsCuenta2.Open;
   if DMCNT.cdsCuenta2.IndexFieldNames<>'CUENTAID' then
      DMCNT.cdsCuenta2.IndexfieldNames := 'CUENTAID';
end;

procedure TFMayorAuxiliar.speAnoEnter(Sender: TObject);
begin
   strTmp := speAno.Text ;
end;

procedure TFMayorAuxiliar.speAnoExit(Sender: TObject);
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

procedure TFMayorAuxiliar.speAnoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
     key := #0 ;

end;

procedure TFMayorAuxiliar.speMMEnter(Sender: TObject);
begin
   if trim(speAno.Text) = '' then
      speAno.SetFocus ;
   strTmp := speMM.Text ;

end;

procedure TFMayorAuxiliar.speMMExit(Sender: TObject);
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

procedure TFMayorAuxiliar.Valida;
begin
  if speAno.Text = '' then
  begin
     speAno.SetFocus ;
     Raise exception.create('Ingrese Año del Periodo') ;
  end ;
  if speMM.Text = '' then
  begin
     speMM.SetFocus ;
     Raise exception.create('Ingrese Mes del Periodo') ;
  end ;
  if dblcCia.Text = '' then
  begin
     dblcCia.SetFocus ;
     Raise exception.create('Ingrese Compañía') ;
  end ;
  if dblcdCuentas.Text = '' then
  begin
     dblcdCuentas.SetFocus ;
     Raise exception.create('Ingrese Cuenta a Analizar') ;
  end ;
  if dblcTMon.Text = '' then
  begin
     dblcTMon.SetFocus ;
     Raise exception.create('Ingrese Moneda') ;
  end ;

end;

procedure TFMayorAuxiliar.dbgAnalisisTitleButtonClick(Sender: TObject;
  AFieldName: String);
var
   xFlag : Boolean ;
begin
   xFlag := False ;
   if AfieldName='AUXID' then
   begin
      DMCNT.cdsMayorAux.IndexFieldNames:='AUXID;CLAUXID';
      lblBusca.Caption:='Busca por Código:';
      isBusca.SearchField:='AUXID';
      xFlag := True ;
   end;
   if AfieldName='AUXNOMB' then
   begin
      DMCNT.cdsMayorAux.IndexFieldNames:='AUXNOMB;AUXID;CLAUXID';
      lblBusca.Caption:='Busca por Nombre/Razón Soc:';
      isBusca.SearchField:='AUXNOMB';
      xFlag := true ;
   end;
   if xFlag then
   begin
      pnlOrden.Visible := True;
      isBusca.Text:='';
      isBusca.SetFocus;
      pnlArriba.Enabled  := False ;
      pnlAuxiliares.Enabled  := False ;
//wmc0404      dbgEst1.Enabled  := False ;
   end;
end;

procedure TFMayorAuxiliar.btnSalirClick(Sender: TObject);
begin
   pnlOrden.Visible := False;
   pnlArriba.Enabled  := True ;
   pnlAuxiliares.Enabled  := True ;
//wmc0404   dbgEst1.Enabled  := true ;
end;

procedure TFMayorAuxiliar.isBuscaKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      pnlOrden.Visible := False;
//wmc0404      dbgEst1.SetFocus;
   end;
end;

procedure TFMayorAuxiliar.FormCreate(Sender: TObject);
begin
   DMCNT.cdsMayorAux.IndexFieldNames := '' ;
   DMCNT.cdsMayorAux.FILTER := '' ;
   DMCNT.cdsMayorAux.FILTERED := fALSE ;
end;

procedure TFMayorAuxiliar.FormDestroy(Sender: TObject);
begin
   DMCNT.cdsMayorAux.IndexFieldNames := '' ;
   DMCNT.cdsMayorAux.FILTER := '' ;
   DMCNT.cdsMayorAux.FILTERED := fALSE ;
end;

procedure TFMayorAuxiliar.FormShow(Sender: TObject);
var
   nAnyo, nMes, nDia : word;
begin
   decodeDate(now, nAnyo, nMes, nDia);
   speAno.Text := inttoStr(nAnyo);
   speMM.Text := inttoStr(nMes);
   DMCNT.cdsRCuenta.active := false;
   DMCNT.cdsTMon.active:=true;

   Top  := 105;
   Left := 216;
   
//   DMCNT.cdsCia.IndexFieldNames := '' ;
   DMCNT.cdsCia.Filtered := False     ;
   if not DMCNT.cdsCia.Active then
      DMCNT.cdsCia.Open ;
   if DMCNT.cdsCia.RecordCount = 1 then
   begin
      dblcCia.Text := DMCNT.cdsCia.fieldbyname('CIAID').AsString ;
      edtCia.Text  := DMCNT.cdsCia.fieldbyname('CIADES').AsString ;
      dblcCia.Enabled := False ;
   end ;
   
//   self.SetFocus ;
//   perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFMayorAuxiliar.rgTipoAnalisisClick(Sender: TObject);
begin
   dblcdCuentas.text:='';
   edtCuenta.text:='';
end;

End.
