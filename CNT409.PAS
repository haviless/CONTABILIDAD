unit CNT409;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, wwdbdatetimepicker, wwdblook, Buttons, Wwdbdlg,
  Grids, Wwdbigrd, Wwdbgrid, ppCtrls, ppPrnabl, ppClass, ppBands, ppProd,
  ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppVar, ppviewr, ppModule,
  daDatMod;

type
  TFDiarioAux = class(TForm)
    pnlMayorAn: TPanel;
    lblCia: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dbdtpFReg1: TwwDBDateTimePicker;
    dbdtpFReg2: TwwDBDateTimePicker;
    rgMoneda: TRadioGroup;
    gbParametros: TGroupBox;
    ckAux: TCheckBox;
    ckTit: TCheckBox;
    ckCtas: TCheckBox;
    edtTit: TEdit;
    gbAux: TGroupBox;
    dblcClAux1: TwwDBLookupCombo;
    dblcClAux2: TwwDBLookupCombo;
    dblcClAux3: TwwDBLookupCombo;
    ckTodos3: TCheckBox;
    ckTodos2: TCheckBox;
    ckTodos1: TCheckBox;
    ckUno1: TCheckBox;
    ckUno2: TCheckBox;
    ckUno3: TCheckBox;
    dblcdAux1: TwwDBLookupComboDlg;
    dblcdAux2: TwwDBLookupComboDlg;
    dblcdAux3: TwwDBLookupComboDlg;
    gbCuenta: TGroupBox;
    dblcdCuenta1: TwwDBLookupComboDlg;
    dblcdCuenta3: TwwDBLookupComboDlg;
    dblcdCuenta2: TwwDBLookupComboDlg;
    pprDiarioAux: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLine6: TppLine;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppVariable2: TppVariable;
    ppLabel45: TppLabel;
    ppLine7: TppLine;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppdbCargoL: TppDBText;
    ppdbAbonoL: TppDBText;
    ppdbCargoE: TppDBText;
    ppdbAbonoE: TppDBText;
    ppdbMovCNT: TppDBPipeline;
    ppLabel55: TppLabel;
    ppLine8: TppLine;
    ppvCargoL: TppVariable;
    ppvAbonoL: TppVariable;
    ppvCargoE: TppVariable;
    ppvAbonoE: TppVariable;
    ppLabel56: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText13: TppDBText;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel57: TppLabel;
    ppDBText14: TppDBText;
    ppvTDCargoL: TppVariable;
    ppvTDAbonoL: TppVariable;
    ppvTDCargoE: TppVariable;
    ppvTDAbonoE: TppVariable;
    ppLine9: TppLine;
    ppdbtTDiarDesP: TppDBText;
    ppLabel58: TppLabel;
    ppdbtTDiarDesG: TppDBText;
    ppvComCargoL: TppVariable;
    ppvComAbonoL: TppVariable;
    ppvComCargoE: TppVariable;
    ppvComAbonoE: TppVariable;
    ppLine10: TppLine;
    ppLabel59: TppLabel;
    ppdbtCompG: TppDBText;
    ckResumen: TCheckBox;
    gbResumen: TGroupBox;
    pprResCompr: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppVariable3: TppVariable;
    ppLabel60: TppLabel;
    ppLine11: TppLine;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppLine12: TppLine;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppDBText15: TppDBText;
    ppdbtAbonoE: TppDBText;
    ppdbtCargoE: TppDBText;
    ppdbtAbonoL: TppDBText;
    ppdbtCargoL: TppDBText;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLabel72: TppLabel;
    ppdbtTDiarioG: TppDBText;
    ppVariable4: TppVariable;
    ppLabel73: TppLabel;
    ppDBText16: TppDBText;
    ppLine13: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppVariable5: TppVariable;
    pprResCuenta: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppVariable6: TppVariable;
    ppLabel75: TppLabel;
    ppLine15: TppLine;
    ppLabel76: TppLabel;
    ppLine16: TppLine;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppLabel85: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppLabel86: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    ppdbCargoL2: TppDBText;
    ppdbtAbonoL2: TppDBText;
    ppdbtCargoE2: TppDBText;
    ppdbtAbonoE2: TppDBText;
    ppdbtCuenta: TppDBText;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLabel88: TppLabel;
    ppdbtTDiarioG2: TppDBText;
    ppvTDDes2: TppVariable;
    ppLabel89: TppLabel;
    ppVariable7: TppVariable;
    ppDBText17: TppDBText;
    ppLine18: TppLine;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppvFechas: TppVariable;
    ppvTit2: TppVariable;
    ppdbtCtaDes2: TppDBText;
    ppdbtClAux: TppDBText;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppLabel92: TppLabel;
    ppLine19: TppLine;
    ppLabel87: TppLabel;
    ppVariable8: TppVariable;
    ppVariable9: TppVariable;
    ppLabel93: TppLabel;
    ppLine14: TppLine;
    ppLabel74: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel94: TppLabel;
    ppVariable10: TppVariable;
    ppVariable11: TppVariable;
    ppLabel95: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppSummaryBand2: TppSummaryBand;
    ppSummaryBand3: TppSummaryBand;
    ppLabel96: TppLabel;
    ckTDiario: TCheckBox;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    rbComprob: TRadioButton;
    rbCuenta: TRadioButton;
    procedure ckAuxClick(Sender: TObject);
    procedure dblcClAux1Exit(Sender: TObject);
    procedure ckTodos1Click(Sender: TObject);
    procedure ckUno1Click(Sender: TObject);
    procedure dblcClAux2Exit(Sender: TObject);
    procedure dblcClAux3Exit(Sender: TObject);
    procedure ckTodos2Click(Sender: TObject);
    procedure ckTodos3Click(Sender: TObject);
    procedure ckUno2Click(Sender: TObject);
    procedure ckUno3Click(Sender: TObject);
    procedure ckCtasClick(Sender: TObject);
    procedure ckTitClick(Sender: TObject);
    procedure bbtnCancClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure IniciaCampos;
    procedure bbtnOkClick(Sender: TObject);
    procedure ppdbCargoMNPrint(Sender: TObject);
    procedure ppdbAbonoMNPrint(Sender: TObject);
    procedure ppvCargoMNCalc(Sender: TObject; var Value: Variant);
    procedure ppvAbonoMNCalc(Sender: TObject; var Value: Variant);
    procedure ppvTCompCargoMNCalc(Sender: TObject; var Value: Variant);
    procedure ppvTCompAbonoMNCalc(Sender: TObject; var Value: Variant);
    procedure ppvTDiarioCargoMNCalc(Sender: TObject; var Value: Variant);
    procedure ppvTDiarioAbonoMNCalc(Sender: TObject; var Value: Variant);
    procedure ppdbCargoMEPrint(Sender: TObject);
    procedure ppdbAbonoMEPrint(Sender: TObject);
    procedure ppvCompCargoMECalc(Sender: TObject; var Value: Variant);
    procedure ppvCompAbonoMECalc(Sender: TObject; var Value: Variant);
    procedure ppvCargoMECalc(Sender: TObject; var Value: Variant);
    procedure ppvAbonoMECalc(Sender: TObject; var Value: Variant);
    procedure ppvTDiarioCargoMECalc(Sender: TObject; var Value: Variant);
    procedure ppvTDiarioAbonoMECalc(Sender: TObject; var Value: Variant);
    procedure dblcCiaExit(Sender: TObject);
    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);
    Procedure SQLDataDetalle( Var xTSQL : WideString );
    Procedure SQLDataComprob( Var xTSQL : WideString );
    Procedure SQLDataCuenta( Var xTSQL : WideString );
    procedure ckResumenClick(Sender: TObject);
    procedure ppVariable4Calc(Sender: TObject; var Value: Variant);
    procedure pprResCuentaPreviewFormCreate(Sender: TObject);
    procedure pprResComprPreviewFormCreate(Sender: TObject);
    procedure pprDiarioAuxPreviewFormCreate(Sender: TObject);
    procedure ppvFechasCalc(Sender: TObject; var Value: Variant);
    procedure ppvTit2Calc(Sender: TObject; var Value: Variant);
    procedure dbdtpFReg2Exit(Sender: TObject);
    procedure dbdtpFReg1Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckTDiarioClick(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDiarioAux: TFDiarioAux;
  xFechas   : String;

implementation

Uses CNTDM;
{$R *.DFM}

procedure TFDiarioAux.ckAuxClick(Sender: TObject);
begin
   gbAux.Enabled     := True;
   ckTodos1.Enabled  := False;
   ckTodos2.Enabled  := False;
   ckTodos3.Enabled  := False;
   ckUno1.Enabled    := False;
   ckUno2.Enabled    := False;
   ckUno3.Enabled    := False;
   dblcdAux1.Enabled := False;
   dblcdAux2.Enabled := False;
   dblcdAux3.Enabled := False;
end;

procedure TFDiarioAux.dblcClAux1Exit(Sender: TObject);
begin
   If Length(dblcClAux1.Text)>0 Then begin
      ckTodos1.Enabled := True;
      ckTodos1.Checked := False;
      ckUno1.Enabled   := True;
      ckUno1.Checked   := False;
   end;
end;

procedure TFDiarioAux.ckTodos1Click(Sender: TObject);
begin
   ckUno1.Enabled    := False;
   ckUno1.Checked    := False;
   dblcdAux1.Enabled := False;
end;

procedure TFDiarioAux.ckUno1Click(Sender: TObject);
begin
   ckTodos1.Enabled  := False;
   ckTodos1.Checked  := False;
   dblcdAux1.Enabled := True;
end;

procedure TFDiarioAux.dblcClAux2Exit(Sender: TObject);
begin
   If Length(dblcClAux2.Text)>0 Then begin
      ckTodos2.Enabled := True;
      ckTodos2.Checked := False;
      ckUno2.Enabled   := True;
      ckUno2.Checked   := False;
   end;
end;

procedure TFDiarioAux.dblcClAux3Exit(Sender: TObject);
begin
   If Length(dblcClAux3.Text)>0 Then begin
      ckTodos3.Enabled := True;
      ckTodos3.Checked := False;
      ckUno3.Enabled   := True;
      ckUno3.Checked   := False;
   end;
end;

procedure TFDiarioAux.ckTodos2Click(Sender: TObject);
begin
   ckUno2.Enabled    := False;
   ckUno2.Checked    := False;
   dblcdAux2.Enabled := False;
end;

procedure TFDiarioAux.ckTodos3Click(Sender: TObject);
begin
   ckUno3.Enabled    := False;
   ckUno3.Checked    := False;
   dblcdAux3.Enabled := False;
end;

procedure TFDiarioAux.ckUno2Click(Sender: TObject);
begin
   ckTodos2.Enabled := False;
   ckTodos2.Checked := False;
   dblcdAux2.Enabled:= True;
end;

procedure TFDiarioAux.ckUno3Click(Sender: TObject);
begin
   ckTodos3.Enabled := False;
   ckTodos3.Checked := False;
   dblcdAux3.Enabled:= True;
end;

procedure TFDiarioAux.ckCtasClick(Sender: TObject);
begin
   gbCuenta.Enabled:=True;
end;

procedure TFDiarioAux.ckTitClick(Sender: TObject);
begin
   edtTit.Enabled:=True;
end;

procedure TFDiarioAux.IniciaCampos;
begin
   dblcCia.Text     := '';
   dbdtpFReg1.Date  := 0;
   dbdtpFReg2.Date  := 0;
   rgMoneda.Enabled := False;
   gbParametros.Enabled:=False;

   ckAux.Checked    := False;
   dblcClAux1.Text  := '';
   dblcClAux2.Text  := '';
   dblcClAux3.Text  := '';
   ckTodos1.Checked := False;
   ckTodos2.Checked := False;
   ckTodos3.Checked := False;
   ckUno1.Checked   := False;
   ckUno2.Checked   := False;
   ckUno3.Checked   := False;
   gbAux.Enabled    := False;
   rbComprob.Checked:= False;
   rbCuenta.Checked := False;

   gbResumen.Enabled:= False;

   ckCtas.Checked   := False;
   dblcdCuenta1.Text:= '';
   dblcdCuenta2.Text:= '';
   dblcdCuenta3.Text:= '';
   gbCuenta.Enabled := False;

   ckTit.Checked    := False;
   edtTit.Text      := '';
   edtTit.Enabled   := False;
end;

procedure TFDiarioAux.bbtnCancClick(Sender: TObject);
begin
   IniciaCampos;
   dblcCia.SetFocus;
end;

procedure TFDiarioAux.FormActivate(Sender: TObject);
begin

   DM1.cdsTDiario.IndexFieldNames:='TDIARID';

   IniciaCampos;

end;

procedure TFDiarioAux.bbtnOkClick(Sender: TObject);
Var
   xSQL : WideString;
begin

   if (dbdtpFReg1.Date=0) or (dbdtpFReg2.Date=0) then
   begin
      ShowMessage('Fecha no no válida');
      raise exception.Create('Fecha no no válida');
   end ;

   if ckResumen.Checked then begin
      If ( not rbComprob.Checked ) and ( not rbCuenta.Checked ) then
      begin
         ShowMessage('Error : Falta Registrar Tipo de Reporte');
         Raise Exception.Create('Error : Falta Registrar Tipo de Reporte');
      end ;
   end;

   if (ckTDiario.Checked) and (edtTDiario.Text='')
   then
   begin
      ShowMessage('Seleccione un Tipo de Diario');
      raise exception.Create('Seleccione un Tipo de Diario');
   end ;

   xFechas:= 'Del  '+datetostr(dbdtpFReg1.Date)+ '  Al  '+datetostr(dbdtpFReg2.Date);

   if not ckResumen.Checked then
      SQLDataDetalle( xSQL )
   else begin
      If rbComprob.Checked then
         SQLDataComprob( xSQL )
      else begin
         SQLDataCuenta( xSQL )
      end;
   end;

   DM1.cdsQry.Close;
   DM1.cdsQry.ProviderName := 'prvCNT';
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;

   {case rgMoneda.ItemIndex of
         0:
         1:
         2:
    end;}

   // Imprime Reporte

   if not ckResumen.Checked then begin
      DM1.cdsQry.IndexFieldNames:='CIAID;TDIARID;CNTComprob;CNTDH';
      pprDiarioAux.print;
   //   ppRepAux.print;
      end
   else begin
      If rbComprob.Checked then begin
         DM1.cdsQry.IndexFieldNames:='CIAID;TDIARID;CNTComprob';
         pprResCompr.print;
         end
      else begin
         DM1.cdsQry.IndexFieldNames:='CIAID;TDIARID;CuentaID';
         //pprResCuenta.PreviewForm.Width := 100;
         pprResCuenta.print;
      end;
   end;
   DM1.cdsQry.IndexFieldNames:='';
end;


Procedure TFDiarioAux.SQLDataCuenta( Var xTSQL : WideString );
Var
  xWhere, xWhere2, xWhereD, xWhereD2 : String;
  xT1, xT2, xT3, xT4, xFrom, xGroup, xGroup2 : WideString;
  //n:  SmallInt;
begin

//   xTSQL := 'Select Data2.CIAID, Data2.TDIARID, Data2.CuentaID, Data2.CtaDes, Data2.ClAuxID, ' ;

   xTSQL := 'Select Data2.CIAID, Data2.TDIARID, Data2.CUENTAID, Data2.CTADES, ' ;

   xfrom := ' from CNT301 Data2 ';

   xWhere:= ' Where Data2.CIAID='+''''+dblcCia.Text+''''
          + ' and Data2.CNTFCOMP>='+''''+datetostr(dbdtpFReg1.Date)+''''
          + ' and Data2.CNTFCOMP<='+''''+datetostr(dbdtpFReg2.Date)+'''';

   xWhereD:= ' Where Data1.CIAID='+''''+dblcCia.Text+''''
           + ' and Data1.CNTFCOMP>='+''''+datetostr(dbdtpFReg1.Date)+''''
           + ' and Data1.CNTFCOMP<='+''''+datetostr(dbdtpFReg2.Date)+'''';

   // Cia + Fecha + Grupo Relación...
   if (edtTDiario.Text<>'') then begin
      xWhere2:='TDIARID='+''''+dblcTDiario.Text+'''';
      xWhere:=xWhere+' and '+'('+xWhere2+')';
   end;
   xWhereD:=xWhereD+' and '+'Data1.TDIARID=Data2.TDIARID ';

   xGroup2:='';
   xWhere2:='';
   if ckAux.Checked then begin
      if dblcClAux1.Text<>'' then begin
         xWhere2 :=xWhere2 +' ( Data2.CLAUXID='+''''+dblcClAux1.Text+'''';
         If ckUno1.Checked then xWhere2 :=xWhere2 +' and Data2.AuxId='+''''+dblcdAux1.Text+'''';
         xWhere2 :=xWhere2 +' )';
      end;
      if (xWhere2<>'') and (dblcClAux2.Text<>'') then xWhere2:=xWhere2+' or ';
      if dblcClAux2.Text<>'' then begin
         xWhere2 :=xWhere2 +' ( Data2.CLAUXID='+''''+dblcClAux2.Text+'''';
         If ckUno2.Checked then xWhere2 :=xWhere2 +' and Data2.AuxId='+''''+dblcdAux2.Text+'''';
         xWhere2 :=xWhere2 +' )';
      end;
      if (xWhere2<>'') and (dblcClAux3.Text<>'') then xWhere2:=xWhere2+' or ';
      if dblcClAux3.Text<>'' then begin
         xWhere2 :=xWhere2 +' ( Data2.CLAUXID='+''''+dblcClAux3.Text+'''';
         If ckUno3.Checked then xWhere2 :=xWhere2 +' and Data2.AuxId='+''''+dblcdAux3.Text+'''';
         xWhere2 :=xWhere2 +' )';
      end;
      if xWhere2<>'' then xWhere:=xWhere+' and '+'('+xWhere2+')';
      xWhereD:=xWhereD+' and Data1.CLAUXID=Data2.CLAUXID and Data1.AuxId=Data2.AuxId';
      xGroup2:= 'Data2.CLAUXID, Data2.AuxId, ';
   end;

   xGroup:= ' group by Data2.CIAID, Data2.TDIARID, '+xGroup2+'Data2.CUENTAID, Data2.CTADES ';

   xWhere2 :='';
   if ckCtas.Checked then begin
      if dblcdCuenta1.Text<>'' then xWhere2 :=xWhere2 +'Data2.CUENTAID='+''''+dblcdCuenta1.Text+'''';
      if (xWhere2 <>'') and (dblcdCuenta2.Text<>'') then xWhere2 :=xWhere2 +' or ';
      if dblcdCuenta2.Text<>'' then xWhere2 :=xWhere2 +'Data2.CUENTAID='+''''+dblcdCuenta2.Text+'''';
      if (xWhere2<>'')  and (dblcdCuenta3.Text<>'') then xWhere2 :=xWhere2 +' or ';
      if dblcdCuenta3.Text<>'' then xWhere2 :=xWhere2 +'Data2.CUENTAID='+''''+dblcdCuenta3.Text+'''';
      if xWhere2<>''  then xWhere :=xWhere +' and '+'('+xWhere2 +')';
      xWhereD:=xWhereD+' and Data1.CuentaID=Data2.CUENTAID';
   end;

   xT1   := '( Select Sum( Data1.CntMtoLoc ) as CargoL'+
            ' from CNT301 Data1 ' + xWhereD +
            ' and Data1.CNTDH='+''''+'D'+''''+' and Data1.CUENTAID=Data2.CUENTAID'+
            ' group by Data1.CIAID, Data1.TDIARID, Data1.CUENTAID, Data1.CNTDH ), ';

   xT2   := '( Select Sum( Data1.CntMtoLoc ) as AbonoL'+
            ' from CNT301 Data1 ' + xWhereD +
            ' and Data1.CNTDH='+''''+'H'+''''+' and Data1.CUENTAID=Data2.CUENTAID'+
            ' group by Data1.CIAID, Data1.TDIARID, Data1.CUENTAID, Data1.CNTDH ), ';

   xT3   := '( Select Sum( Data1.CntMtoExt ) as CargoE'+
            ' from CNT301 Data1 ' + xWhereD +
            ' and Data1.CNTDH='+''''+'D'+''''+' and Data1.CUENTAID=Data2.CUENTAID'+
            ' group by Data1.CIAID, Data1.TDIARID, Data1.CUENTAID, Data1.CNTDH ), ';

   xT4   := '( Select Sum( Data1.CntMtoExt ) as AbonoE'+
            ' from CNT301 Data1 ' + xWhereD +
            ' and Data1.CNTDH='+''''+'H'+''''+' and Data1.CUENTAID=Data2.CUENTAID'+
            ' group by Data1.CIAID, Data1.TDIARID, Data1.CUENTAID, Data1.CNTDH ) ';

   xTSQL := xTSQL + xT1;
   xTSQL := xTSQL + xT2;
   xTSQL := xTSQL + xT3;
   xTSQL := xTSQL + xT4;
   xTSQL := xTSQL + xfrom;
   xTSQL := xTSQL + xWhere;
   xTSQL := xTSQL + xGroup;

   xTSql := xtsql;

end;


Procedure TFDiarioAux.SQLDataComprob( Var xTSQL : WideString );
Var
  xWhere, xWhere2, xWhereD, xWhereD2, xT1, xT2, xT3, xT4, xFrom, xGroup : String;
  //n:  SmallInt;
begin

   xTSQL := 'Select Data2.CIAID, Data2.TDIARID, Data2.CNTCOMPROB,' ;

   xfrom := ' from CNT301 Data2 ';

   xGroup:= ' group by Data2.CIAID, Data2.TDIARID, Data2.CNTCOMPROB ';

   xWhere:= ' Where Data2.CIAID='+''''+dblcCia.Text+''''
          + ' and Data2.CNTFCOMP>='+''''+datetostr(dbdtpFReg1.Date)+''''
          + ' and Data2.CNTFCOMP<='+''''+datetostr(dbdtpFReg2.Date)+'''';

   xWhereD:= ' Where Data1.CIAID='+''''+dblcCia.Text+''''
           + ' and Data1.CNTFCOMP>='+''''+datetostr(dbdtpFReg1.Date)+''''
           + ' and Data1.CNTFCOMP<='+''''+datetostr(dbdtpFReg2.Date)+'''';


   // Cia + Fecha + Grupo Relación...
   if (edtTDiario.Text<>'') then begin
      xWhere2:='TDIARID='+''''+dblcTDiario.Text+'''';
      xWhere:=xWhere+' and '+'('+xWhere2+')';
      xWhereD2:='TDIARID='+''''+dblcTDiario.Text+'''';
      xWhereD:=xWhere+' and '+'('+xWhereD2+')';
   end;

   xWhere2:='';
   xWhereD2:='';
   if ckAux.Checked then begin
      if dblcClAux1.Text<>'' then begin
         xWhere2 :=xWhere2 +' ( Data2.CLAUXID='+''''+dblcClAux1.Text+'''';
         xWhereD2:=xWhereD2+' ( Data1.CLAUXID='+''''+dblcClAux1.Text+'''';
         If ckUno1.Checked then xWhere2 :=xWhere2 +' and Data2.AuxId='+''''+dblcdAux1.Text+'''';
         If ckUno1.Checked then xWhereD2:=xWhereD2+' and Data1.AuxId='+''''+dblcdAux1.Text+'''';
         xWhere2 :=xWhere2 +' )';
         xWhereD2:=xWhereD2+' )';
      end;
      if (xWhere2<>'') and (dblcClAux2.Text<>'') then xWhere2:=xWhere2+' or ';
      if dblcClAux2.Text<>'' then begin
         xWhere2 :=xWhere2 +' ( Data2.CLAUXID='+''''+dblcClAux2.Text+'''';
         xWhereD2:=xWhereD2+' ( Data1.CLAUXID='+''''+dblcClAux2.Text+'''';
         If ckUno2.Checked then xWhere2 :=xWhere2 +' and Data2.AuxId='+''''+dblcdAux2.Text+'''';
         If ckUno2.Checked then xWhereD2:=xWhereD2+' and Data1.AuxId='+''''+dblcdAux2.Text+'''';
         xWhere2 :=xWhere2 +' )';
         xWhereD2:=xWhereD2+' )';
      end;
      if (xWhere2<>'') and (dblcClAux3.Text<>'') then xWhere2:=xWhere2+' or ';
      if dblcClAux3.Text<>'' then begin
         xWhere2 :=xWhere2 +' ( Data2.CLAUXID='+''''+dblcClAux3.Text+'''';
         xWhereD2:=xWhereD2+' ( Data1.CLAUXID='+''''+dblcClAux3.Text+'''';
         If ckUno3.Checked then xWhere2 :=xWhere2 +' and Data2.AuxId='+''''+dblcdAux3.Text+'''';
         If ckUno3.Checked then xWhereD2:=xWhereD2+' and Data1.AuxId='+''''+dblcdAux3.Text+'''';
         xWhere2 :=xWhere2 +' )';
         xWhereD2:=xWhereD2+' )';
      end;
      if xWhere2<>'' then xWhere:=xWhere+' and '+'('+xWhere2+')';
   end;

   xWhere2 :='';
   xWhereD2:='';
   if ckCtas.Checked then begin
      if dblcdCuenta1.Text<>'' then xWhere2 :=xWhere2 +'Data2.CUENTAID='+''''+dblcdCuenta1.Text+'''';
      if dblcdCuenta1.Text<>'' then xWhereD2:=xWhereD2+'Data1.CUENTAID='+''''+dblcdCuenta1.Text+'''';

      if (xWhere2 <>'') and (dblcdCuenta2.Text<>'') then xWhere2 :=xWhere2 +' or ';
      if (xWhereD2<>'') and (dblcdCuenta2.Text<>'') then xWhereD2:=xWhereD2+' or ';

      if dblcdCuenta2.Text<>'' then xWhere2 :=xWhere2 +'Data2.CUENTAID='+''''+dblcdCuenta2.Text+'''';
      if dblcdCuenta2.Text<>'' then xWhereD2:=xWhereD2+'Data1.CUENTAID='+''''+dblcdCuenta2.Text+'''';

      if (xWhere2<>'')  and (dblcdCuenta3.Text<>'') then xWhere2 :=xWhere2 +' or ';
      if (xWhereD2<>'') and (dblcdCuenta3.Text<>'') then xWhereD2:=xWhereD2+' or ';

      if dblcdCuenta3.Text<>'' then xWhere2 :=xWhere2 +'Data2.CUENTAID='+''''+dblcdCuenta3.Text+'''';
      if dblcdCuenta3.Text<>'' then xWhereD2:=xWhereD2+'Data1.CUENTAID='+''''+dblcdCuenta3.Text+'''';

      if xWhere2<>''  then xWhere :=xWhere +' and '+'('+xWhere2 +')';
      if xWhereD2<>'' then xWhereD:=xWhereD+' and '+'('+xWhereD2+')';
   end;

   xT1   := '( Select Sum( Data1.CntMtoLoc ) as CargoL'+
            ' from CNT301 Data1 ' + xWhereD +
            ' and Data1.CNTDH='+''''+'D'+''''+' and Data1.CNTCOMPROB=Data2.CNTCOMPROB'+
            ' group by Data1.CIAID, Data1.TDIARID, Data1.CNTCOMPROB, Data1.CNTDH ), ';

   xT2   := '( Select Sum( Data1.CntMtoLoc ) as AbonoL'+
            ' from CNT301 Data1 ' + xWhereD +
            ' and Data1.CNTDH='+''''+'H'+''''+' and Data1.CNTCOMPROB=Data2.CNTCOMPROB'+
            ' group by Data1.CIAID, Data1.TDIARID, Data1.CNTCOMPROB, Data1.CNTDH ), ';

   xT3   := '( Select Sum( Data1.CntMtoExt ) as CargoE'+
            ' from CNT301 Data1 ' + xWhereD +
            ' and Data1.CNTDH='+''''+'D'+''''+' and Data1.CNTCOMPROB=Data2.CNTCOMPROB'+
            ' group by Data1.CIAID, Data1.TDIARID, Data1.CNTCOMPROB, Data1.CNTDH ), ';

   xT4   := '( Select Sum( Data1.CntMtoExt ) as AbonoE'+
            ' from CNT301 Data1 ' + xWhereD +
            ' and Data1.CNTDH='+''''+'H'+''''+' and Data1.CNTCOMPROB=Data2.CNTCOMPROB'+
            ' group by Data1.CIAID, Data1.TDIARID, Data1.CNTCOMPROB, Data1.CNTDH )';

   xTSQL := xTSQL + xT1 + xT2 + xT3 + xT4 + xFrom;

   xTSQL := xTSQL + xWhere + xGroup;

end;

Procedure TFDiarioAux.SQLDataDetalle( Var xTSQL : WideString );
Var
  xWhere, xWhere2 : String;
  //n:  SmallInt;
begin

   xTSQL  := 'Select  * from CNT301 Where ';
   xWhere := 'CIAID='+''''+dblcCia.Text+''''
           + ' and CNTFCOMP>='+''''+datetostr(dbdtpFReg1.Date)+''''
           + ' and CNTFCOMP<='+''''+datetostr(dbdtpFReg2.Date)+'''';

   // Cia + Fecha + Grupo Relación...
   if (edtTDiario.Text<>'') then begin
      xWhere2:='TDIARID='+''''+dblcTDiario.Text+'''';
      xWhere:=xWhere+' and '+'('+xWhere2+')';
   end;

   xWhere2:='';
   if ckAux.Checked then begin
      if dblcClAux1.Text<>'' then begin
         xWhere2:=xWhere2+' ( CLAUXID='+''''+dblcClAux1.Text+'''';
         If ckUno1.Checked then xWhere2:=xWhere2+' and AuxId='+''''+dblcdAux1.Text+'''';
         xWhere2:=xWhere2+' )';
      end;
      if (xWhere2<>'') and (dblcClAux2.Text<>'') then xWhere2:=xWhere2+' or ';
      if dblcClAux2.Text<>'' then begin
         xWhere2:=xWhere2+' ( CLAUXID='+''''+dblcClAux2.Text+'''';
         If ckUno2.Checked then xWhere2:=xWhere2+' and AuxId='+''''+dblcdAux2.Text+'''';
         xWhere2:=xWhere2+' )';
      end;
      if (xWhere2<>'') and (dblcClAux3.Text<>'') then xWhere2:=xWhere2+' or ';
      if dblcClAux3.Text<>'' then begin
         xWhere2:=xWhere2+' ( CLAUXID='+''''+dblcClAux3.Text+'''';
         If ckUno3.Checked then xWhere2:=xWhere2+' and AuxId='+''''+dblcdAux3.Text+'''';
         xWhere2:=xWhere2+' )';
      end;
      if xWhere2<>'' then xWhere:=xWhere+' and '+'('+xWhere2+')';
   end;

   xWhere2:='';
   if ckCtas.Checked then begin
      if dblcdCuenta1.Text<>'' then xWhere2:=xWhere2 +'CUENTAID='+''''+dblcdCuenta1.Text+'''';
      if (xWhere2<>'') and (dblcdCuenta2.Text<>'') then xWhere2:=xWhere2+' or ';
      if dblcdCuenta2.Text<>'' then xWhere2:=xWhere2 +'CUENTAID='+''''+dblcdCuenta2.Text+'''';
      if (xWhere2<>'') and (dblcdCuenta3.Text<>'') then xWhere2:=xWhere2+' or ';
      if dblcdCuenta3.Text<>'' then xWhere2:=xWhere2 +'CUENTAID='+''''+dblcdCuenta3.Text+'''';
      if xWhere2<>'' then xWhere:=xWhere+' and '+'('+xWhere2+')';
   end;

   xTSQL:=xTSQL+xWhere;

end;


procedure TFDiarioAux.ppdbCargoMNPrint(Sender: TObject);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'D' then begin
      ppdbCargoL.DataField:= 'CNTMtoLoc';
      ppdbAbonoL.DataField:= '';
   end;
end;

procedure TFDiarioAux.ppdbAbonoMNPrint(Sender: TObject);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'H' then begin
      ppdbAbonoL.DataField:= 'CNTMtoLoc';
      ppdbCargoL.DataField:= '';
   end;
end;

procedure TFDiarioAux.ppvCargoMNCalc(Sender: TObject; var Value: Variant);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'D' then
      value:=value + dm1.cdsQry.FieldByName('CNTMTOLOC').Value;
end;

procedure TFDiarioAux.ppvAbonoMNCalc(Sender: TObject; var Value: Variant);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'H' then
      value:=value + dm1.cdsQry.FieldByName('CNTMTOLOC').Value;
end;

procedure TFDiarioAux.ppvTCompCargoMNCalc(Sender: TObject;
  var Value: Variant);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'D' then
      value:=value + dm1.cdsQry.FieldByName('CNTMTOLOC').Value;
end;

procedure TFDiarioAux.ppvTCompAbonoMNCalc(Sender: TObject;
  var Value: Variant);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'H' then
      value:=value + dm1.cdsQry.FieldByName('CNTMTOLOC').Value;
end;

procedure TFDiarioAux.ppvTDiarioCargoMNCalc(Sender: TObject;
  var Value: Variant);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'D' then
      value:=value + dm1.cdsQry.FieldByName('CNTMTOLOC').Value;
end;

procedure TFDiarioAux.ppvTDiarioAbonoMNCalc(Sender: TObject;
  var Value: Variant);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'H' then
      value:=value + dm1.cdsQry.FieldByName('CNTMTOLOC').Value;
end;

procedure TFDiarioAux.ppdbCargoMEPrint(Sender: TObject);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'D' then begin
      ppdbCargoE.DataField:= 'CNTMTOEXT';
      ppdbAbonoE.DataField:= '';
   end;

end;

procedure TFDiarioAux.ppdbAbonoMEPrint(Sender: TObject);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'H' then begin
      ppdbAbonoE.DataField:= 'CNTMtoExt';
      ppdbCargoE.DataField:= '';
   end;
end;

procedure TFDiarioAux.ppvCompCargoMECalc(Sender: TObject;
  var Value: Variant);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'D' then
      value:=value + dm1.cdsQry.FieldByName('CNTMTOEXT').Value;
end;

procedure TFDiarioAux.ppvCompAbonoMECalc(Sender: TObject;
  var Value: Variant);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'H' then
      value:=value + dm1.cdsQry.FieldByName('CNTMTOEXT').Value;
end;

procedure TFDiarioAux.ppvCargoMECalc(Sender: TObject; var Value: Variant);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'D' then
      value:=value + dm1.cdsQry.FieldByName('CNTMTOEXT').Value;
end;

procedure TFDiarioAux.ppvAbonoMECalc(Sender: TObject; var Value: Variant);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'H' then
      value:=value + dm1.cdsQry.FieldByName('CNTMTOEXT').Value;end;

procedure TFDiarioAux.ppvTDiarioCargoMECalc(Sender: TObject;
  var Value: Variant);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'D' then
      value:=value + dm1.cdsQry.FieldByName('CNTMTOEXT').Value;
end;

procedure TFDiarioAux.ppvTDiarioAbonoMECalc(Sender: TObject;
  var Value: Variant);
begin
   If dm1.cdsQry.FieldByName( 'CNTDH' ).Value = 'H' then
      value:=value + dm1.cdsQry.FieldByName('CNTMTOEXT').Value;
end;

procedure TFDiarioAux.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DM1.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   end;

end;

procedure TFDiarioAux.ppVariable1Calc(Sender: TObject; var Value: Variant);
begin
   Value := edtCia.Text;
end;


procedure TFDiarioAux.ckResumenClick(Sender: TObject);
begin
   rbComprob.Enabled:= True;
   rbCuenta.Enabled := True;
   If ckResumen.Checked then begin
      gbResumen.Enabled:= True;
      rbComprob.Checked:= False;
      rbCuenta.Checked := False;
      end
   else begin
      gbResumen.Enabled:= False;
      rbComprob.Checked:= False;
      rbCuenta.Checked := False;
      rbComprob.Enabled:= False;
      rbCuenta.Enabled := False;
   end;
end;

procedure TFDiarioAux.ppVariable4Calc(Sender: TObject; var Value: Variant);
begin
   DM1.cdsTDiario.Setkey;
   DM1.cdsTDiario.FieldByName('TDIARID').AsString := DM1.cdsQry.FieldByName('TDIARID').AsString;
   If DM1.cdsTDiario.GotoKey then begin
      Value := DM1.cdsTDiario.FieldByName('TDIARDES').AsString;
   end;
end;

procedure TFDiarioAux.pprResCuentaPreviewFormCreate(Sender: TObject);
begin
   pprResCuenta.PreviewForm.WindowState:=WsMaximized;
   TppViewer(pprResCuenta.PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
//   pprResCuenta.PreviewForm.WindowState:=WsNormal;
//   TppViewer(pprResCuenta.PreviewForm.Viewer).ZoomSetting:=zsWholePage;

   end;

procedure TFDiarioAux.pprResComprPreviewFormCreate(Sender: TObject);
begin
   pprResCompr.PreviewForm.WindowState:=WsMaximized;
   TppViewer(pprResCompr.PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
end;

procedure TFDiarioAux.pprDiarioAuxPreviewFormCreate(Sender: TObject);
begin
   pprDiarioAux.PreviewForm.WindowState:=WsMaximized;
   TppViewer(pprDiarioAux.PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
end;

procedure TFDiarioAux.ppvFechasCalc(Sender: TObject; var Value: Variant);
begin
   Value := xFechas;
end;

procedure TFDiarioAux.ppvTit2Calc(Sender: TObject; var Value: Variant);
begin
   If Length(edtTit.Text)>0 then
      Value := edtTit.Text
   else
      Value := '';
end;

procedure TFDiarioAux.dbdtpFReg2Exit(Sender: TObject);
begin
   If dbdtpFReg2.date=0 then begin
      dbdtpFReg2.SetFocus;
      ShowMessage(' Error : Falta Registrar Fecha ');
      Raise Exception.Create(' Error : Falta Registrar Fecha ');
   end;
   If dbdtpFReg2.date<dbdtpFReg1.date then begin
      dbdtpFReg2.SetFocus;
      ShowMessage(' Error : Fecha ser Mayor ');
      Raise Exception.Create(' Error : Fecha ser Mayor ');
   end;

   rgMoneda.Enabled    :=True;
   gbParametros.Enabled:=True;

end;

procedure TFDiarioAux.dbdtpFReg1Exit(Sender: TObject);
begin
   If dbdtpFReg1.date=0 then begin
      dbdtpFReg1.SetFocus;
      ShowMessage('Error : Falta Registrar Fecha');
      Raise Exception.Create('Error : Falta Registrar Fecha');
   end;
end;

procedure TFDiarioAux.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFDiarioAux.ckTDiarioClick(Sender: TObject);
begin
   if not(ckTDiario.Checked) then begin
      dblcTDiario.Text:='';  edtTDiario.Text:='';
      dblcTDiario.Enabled:=False;
   end
   else begin
      dblcTDiario.Enabled:=True;
   end;
end;

procedure TFDiarioAux.dblcTDiarioExit(Sender: TObject);
begin
   edtTDiario.Text:='';
   if dblcTDiario.Text<>'' then edtTDiario.Text:=DM1.cdsTDiario.FieldByName('TDIARDES').AsString;
end;

end.
