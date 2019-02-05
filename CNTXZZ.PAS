unit CNTXZZ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, ComCtrls, wwdblook, wwdbdatetimepicker, Spin, Buttons, DBGrids;

type
  TFMayorAuxiliar = class(TForm)
    pnlAuxiliares: TPanel;
    pnlResultado: TPanel;
    Label3: TLabel;
    edtSaldoAcum: TEdit;
    pnlArriba: TPanel;
    lblCia: TLabel;
    gbCuentas: TGroupBox;
    lbCuentas: TListBox;
    gbTipoMoneda: TGroupBox;
    gbPer: TGroupBox;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    rgTipoAnalisis: TRadioGroup;
    edtDebe: TEdit;
    edtHaber: TEdit;
    edtSaldoActual: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbgAnalisis: TwwDBGrid;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    Z2bbtnImprime: TBitBtn;
    dblcMoneda: TwwDBLookupCombo;
    procedure dblcCiaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure bbtnCancClick(Sender: TObject);
    procedure dbgAnalisisDblClick(Sender: TObject);
    procedure rgTipoAnalisisClick(Sender: TObject);
    procedure dbgAnalisisTopRowChanged(Sender: TObject);
  private
    { Private declarations }
    procedure ExecAction(sCia, sCuenta, sMoneda, sAnyo, sMes : string; nAnalisis: byte );
    procedure TitleGrid(Analisis : byte; MonedaMes : string );
  public
    { Public declarations }
    sOrder : string;
  end;

var
  FMayorAuxiliar: TFMayorAuxiliar;

implementation

uses CNTDM, cntxzzb;

{$R *.DFM}


procedure TFMayorAuxiliar.bbtnCancClick(Sender: TObject);
begin
   DM1.cdsTMon.active:=false;
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
   edtCia.Text := DM1.cdsCiaCiaDes.Text;
   if length(edtCia.Text)=0 then
      begin
      ShowMessage('Falta Definición de Compañía');      dblcCia.SetFocus;      exit;
      end;

   bbtnOk.Enabled := true;
   rgTipoAnalisis.OnClick(sender);
end;

procedure TFMayorAuxiliar.rgTipoAnalisisClick(Sender: TObject);
var sSQL : string;
begin
   sSQL := 'SELECT CUENTAID FROM TGE202 WHERE ';
   if rgTipoAnalisis.ItemIndex = 0 then
      sSQL := sSQL + 'CTA_AUX = ''S'' AND CTA_MOV = ''S'''
   else
      sSQL := sSQL + 'CTA_MOV = ''S'' AND CTA_CCOS=''S''' ;
   sSQL := sSQL + ' AND CIAID=' + quotedStr(dblcCia.Text) + ' ORDER BY CUENTAID';
   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName:= 'prvCNT';
   DM1.cdsQry.DataRequest(sSQL);
   DM1.cdsQry.Open;
   DM1.cdsQry.DisableControls;
   DM1.cdsQry.First;
   lbCuentas.Items.Clear;
   while ( not DM1.cdsQry.Eof ) do
      begin
      lbCuentas.Items.Add ( DM1.cdsQry.FieldByName('CUENTAID').asString );
      DM1.cdsQry.Next;
      end;
   lbCuentas.ItemIndex := 0;
   lbCuentas.SetFocus;
end;



procedure TFMayorAuxiliar.FormActivate(Sender: TObject);
var nAnyo, nMes, nDia : word;
begin
   decodeDate(now, nAnyo, nMes, nDia);
   speAno.Text := inttoStr(nAnyo);
   speMM.Text := inttoStr(nMes);
   DM1.cdsRCuenta.active := false;
   DM1.cdsTMon.active:=true;
end;

procedure TFMayorAuxiliar.bbtnOkClick(Sender: TObject);
var  sTipoMoneda : string;
begin

   if DM1.dsTMon.DataSet.FieldByName('TMON_LOC').asString = 'L'
      then sTipoMoneda := 'N'
      else sTipoMoneda := 'E';

   ExecAction(dblcCia.Text, lbCuentas.Items[lbCuentas.ItemIndex], sTipoMoneda, speAno.text, speMM.text, rgTipoAnalisis.ItemIndex  );
end;


procedure TFMayorAuxiliar.ExecAction(sCia, sCuenta, sMoneda, sAnyo, sMes: string;
                                     nAnalisis: byte);
//sCia, sCuenta, sFeInicio, sFeFinal, sMoneda: string;
//nAnalisis, nEstado : byte;
var sWhere : string;
   sSQL, sCampos : string;
   sMonMes : string;
   sJoin : string;
begin
   sSQL := '';
   sCia := quotedStr(sCia);
   sCuenta := quotedStr(sCuenta);
   sAnyo := quotedStr(sAnyo);

   sMonMes := sMoneda + DM1.StrZero(sMes, 2);

//   sWhere := 'CIAID=' + sCia ;
   sWhere := 'CNT401.CIAID=' + sCia + ' AND CNT401.CUENTAID=' + sCuenta + ' AND CNT401.ANO=' + sAnyo ;

   TitleGrid(nAnalisis, sMonMes);   //Modifica la visualizacion del grid

   case nAnalisis of
     0:  begin
         sCampos:= ' CNT401.AUXID, CNT401.CLAUXID, CNT401.AUXDES ';
         sWhere := sWhere + ' AND TGE202.CTA_AUX = ''S'' AND TGE202.CTA_CCOS=''N'' AND CNT401.CTA_MOV=''S'' ';
//         sWhere := sWhere + ' AND (AUXID <> '''' and AUXID <> '' '' and NOT AUXID IS NULL ) AND ( CCOSID = '''' OR CCOSID = '' '' OR CCOSID IS NULL ) ';
         sOrder := ' CNT401.AUXID, CNT401.CLAUXID ';
         end;
     1:  begin
         sCampos:= ' CNT401.CCOSID, CNT401.CCODES ';
         sWhere := sWhere + ' TGE202.CTA_CCOS=''S'' AND TGE202.CTA_AUX = ''N'' ';
         sOrder := ' CNT401.CCOSID ';
         end;
   end;
   sJoin := ' LEFT JOIN TGE202 ON (TGE202.CUENTAID = CNT401.CUENTAID AND TGE202.CIAID = CNT401.CIAID) ';

   sSQL := 'SELECT ';

   if nAnalisis = 0 then
      sSQL := sSQl + sCampos + ', CNT401.SALDM' + sMonMes + ' SALDO, CNT401.DEBEM' + sMonMes + ' DEBE, CNT401.HABEM' + sMonMes +' HABER, '+
                               '(CNT401.SALDM' + sMonMes  + '+ CNT401.DEBEM' + sMonMes + '- CNT401.HABEM' + sMonMes +') SALDOACT '
   else
      sSQL := sSQL + sCampos + ', sum(CNT401.SALDM' +sMonMes+ ') SALDO, '+
                                  'sum(CNT401.DEBEM' +sMonMes+ ') DEBE, '+
                                  'sum(CNT401.HABEM' +sMonMes+ ') HABER, '+
                                 '(sum(CNT401.SALDM' +sMonMes+ ') + sum(CNT401.DEBEM' + sMonMes + ') - sum(CNT401.HABEM' + sMonMes +') ) SALDOACT ';
   sSQL := sSQl + ' FROM CNT401 ' +sJoin+ ' WHERE ' +sWhere;
//   sSQL := sSQl + ' FROM CNT401 WHERE ' + sWhere;

   if nAnalisis = 1 then
      sSQL := sSQL + ' GROUP BY '+ sCampos ;
   sSQL := sSQL +  ' ORDER BY ' + sOrder ;

   DM1.cdsMayorAux.close;
   DM1.cdsMayorAux.ProviderName:= 'prvMayorAux';
   DM1.cdsMayorAux.DataRequest(sSQL);
   DM1.cdsMayorAux.Open;
   DM1.cdsMayorAux.DisableControls;
   if DM1.cdsMayorAux.recordCount = 0 then
      begin
      ShowMessage('No existen Auxiliares o Centros de Costo para esta Cuenta');
      edtSaldoAcum.text  := Format( '%10.2f', [0.0] );
      edtDebe.text       := Format( '%10.2f', [0.0] );
      edtHaber.text      := Format( '%10.2f', [0.0] );
      edtSaldoActual.text:= Format( '%10.2f', [0.0] );
      lbCuentas.SetFocus;
      DM1.cdsMayorAux.EnableControls;
      exit;
      end;

   DM1.cdsMayorAux.EnableControls;

   sCampos := 'SUM(SALDM' + sMonMes + ') Saldo,' +
                  'SUM(DEBEM' + sMonMes + ') Debe,' +
                  'SUM(HABEM' + sMonMes + ') Haber,' +
                  '( SUM(SALDM' + sMonMes + ') + SUM(DEBEM' + sMonMes + ') - SUM(HABEM' + sMonMes + ') ) Actual ';

   sSQL := 'SELECT ' + sCampos + ' FROM CNT401 ' +sJoin+ 'WHERE ' + sWhere;
   DM1.cdsQry.close;
   DM1.cdsQry.ProviderName:= 'prvCNT';
   DM1.cdsQry.DataRequest(upperCase(sSQL));
   DM1.cdsQry.Open;
   Dm1.cdsQry.DisableControls;
   edtSaldoAcum.text  := Format( '%10.2f', [dm1.cdsQry.fieldbyname('Saldo').asFloat] );
   edtDebe.text       := Format( '%10.2f', [dm1.cdsQry.fieldbyname('Debe').asFloat]  );
   edtHaber.text      := Format( '%10.2f', [dm1.cdsQry.fieldbyname('Haber').asFloat] );
   edtSaldoActual.text:= Format( '%10.2f', [dm1.cdsQry.fieldbyname('Actual').asFloat]);
   //d:\jesse1\docs\xx.txt
end;

procedure TFMayorAuxiliar.dbgAnalisisDblClick(Sender: TObject);
var sCtaDes : string;
   sCuentaID : string;
begin

   sCuentaID := lbCuentas.Items[lbCuentas.ItemIndex];
   sCtaDes := '';

   FMayorAuxiliarAnalisis := TFMayorAuxiliarAnalisis.Create (self);
   Try
      FMayorAuxiliarAnalisis.Caption := FMayorAuxiliarAnalisis.Caption + '[ Cta.:' + sCuentaID + ']';

      FMayorAuxiliarAnalisis.rgTipoAnalisis.ItemIndex := rgTipoAnalisis.ItemIndex;
      FMayorAuxiliarAnalisis.dblcMoneda.Text := dblcMoneda.Text;

      FMayorAuxiliarAnalisis.speAno.Text := speAno.Text;
      FMayorAuxiliarAnalisis.speMM.Text := speMM.Text;

      FMayorAuxiliarAnalisis.dblcCia.Text := dblcCia.Text;
      FMayorAuxiliarAnalisis.edtCia.Text := edtCia.Text;

      FMayorAuxiliarAnalisis.gbCuentas.Caption := gbCuentas.Caption;
      FMayorAuxiliarAnalisis.lbCuentas.Items := lbCuentas.Items ;
      FMayorAuxiliarAnalisis.lbCuentas.ItemIndex := lbCuentas.ItemIndex;

      if rgTipoAnalisis.ItemIndex = 0 then
         begin
         FMayorAuxiliarAnalisis.lblParametro.Caption  := 'Auxiliar ID.:';
         FMayorAuxiliarAnalisis.edtParametro.Text := dm1.dsMayorAux.DataSet.fieldbyname('AUXID').asString;
         FMayorAuxiliarAnalisis.sParametro := dm1.dsMayorAux.DataSet.fieldbyname('AUXID').asString
         end
      else
         begin
         FMayorAuxiliarAnalisis.lblParametro.Caption  := 'Centro de Costo:';
         FMayorAuxiliarAnalisis.edtParametro.Text := dm1.dsMayorAux.DataSet.fieldbyname('CCOSID').asString;
         FMayorAuxiliarAnalisis.sParametro := dm1.dsMayorAux.DataSet.fieldbyname('CCOSID').asString;
         end;

      FMayorAuxiliarAnalisis.bbtnOk.OnClick(sender);

      FMayorAuxiliarAnalisis.ShowModal;
   Finally
      FMayorAuxiliarAnalisis.Free;
   End;

end;

procedure TFMayorAuxiliar.TitleGrid(Analisis : byte; MonedaMes : string );
begin
   dbgAnalisis.Selected.Clear;
   if length(MonedaMes) = 0 then
      exit;

   if Analisis = 0 then
   begin
      dbgAnalisis.Selected.Add ('CLAUXID'#9'2'#9'Clase~Auxiliar'#9'F');
      dbgAnalisis.Selected.Add ('AUXID'#9'8'#9'Aux.ID'#9'F');
      dbgAnalisis.Selected.Add ('AUXDES'#9'30'#9'Auxiliar~Descripcion'#9'F');
   end
   else
   begin
      dbgAnalisis.Selected.Add ('CCOSID'#9'15'#9'C.Costo~ID'#9'F');
      dbgAnalisis.Selected.Add ('CCODES'#9'30'#9'Centro de Costo~Descripcion'#9'F');
   end;
   dbgAnalisis.Selected.Add ('SALDO'#9'10'#9'Saldo'#9'F');
   dbgAnalisis.Selected.Add ('DEBE'#9'10'#9'Debe'#9'F');
   dbgAnalisis.Selected.Add ('HABER'#9'10'#9'Haber'#9'F');
   dbgAnalisis.Selected.Add ('SALDOACT'#9'10'#9'Saldo~Actual'#9'F');

   dbgAnalisis.SetPictureMask('SALDO','###,###,###.00');
   dbgAnalisis.SetPictureMask('DEBE','###,###,###.00');
   dbgAnalisis.SetPictureMask('HABER','###,###,###.00');
   dbgAnalisis.SetPictureMask('SALDOACT','###,###,###.00');

   dbgAnalisis.SetPictureMask('SALD'+MonedaMes,'###,###,###.00');
   dbgAnalisis.SetPictureMask('DEBE'+MonedaMes,'###,###,###.00');
   dbgAnalisis.SetPictureMask('HABE'+MonedaMes,'###,###,###.00');
   dbgAnalisis.SetPictureMask('SALDOACT'+MonedaMes,'###,###,###.00');

   //   DM1.cdsMayorAux.FieldByName('SALDM' +MonedaMes).EditMask := '###,###,###.00';
   //.DisplayFormat := '###,###,###.00';

   dbgAnalisis.ControlType := dbgAnalisis.Selected ;

end;


procedure TFMayorAuxiliar.dbgAnalisisTopRowChanged(Sender: TObject);
begin
   dbgAnalisis.invalidate;
end;

End.
