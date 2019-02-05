unit CNT606;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Spin, StdCtrls, wwdblook, Buttons, ppProd, ppClass, ppReport,
  ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppBands, ppCtrls, ppPrnabl,
  ppVar,db, oaVariables;

type
  TFHojaTrabajo = class(TForm)
    pnlHoja: TPanel;
    bbtnOk: TBitBtn;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    gbPer: TGroupBox;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    gbNivel: TGroupBox;
    dblcNivel: TwwDBLookupCombo;
    rgMoneda: TRadioGroup;
    rgMes: TRadioGroup;
    bbtnCanc: TBitBtn;
    ppdbHojaTrabajo: TppDBPipeline;
    pprHojaTrabajo: TppReport;
    ppLabel1: TppLabel;
    ppdbtCIA: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    pplblFecha: TppLabel;
    pplblCIA: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppHojaTrabajo1: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel14: TppLabel;
    ppdbtCIA1: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    pplblFecha1: TppLabel;
    pplblCIA1: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppHojaTrabajo2: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel27: TppLabel;
    ppdbtCIA2: TppDBText;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    pplblFecha2: TppLabel;
    pplblCIA2: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppSummaryBand3: TppSummaryBand;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    pplblMoneda: TppLabel;
    pplblMoneda1: TppLabel;
    pplblMoneda2: TppLabel;
    ppDBCalc13: TppVariable;
    ppDBCalc14: TppVariable;
    ppDBCalc15: TppVariable;
    ppDBCalc16: TppVariable;
    ppDBCalc17: TppVariable;
    ppDBCalc18: TppVariable;
    ppDBCalc19: TppVariable;
    ppDBCalc20: TppVariable;
    ppDBCalc21: TppVariable;
    ppDBCalc22: TppVariable;
    ppDBCalc23: TppVariable;
    ppDBCalc24: TppVariable;
    ppVariable1: TppVariable;
    ppVariable2: TppVariable;
    ppVariable3: TppVariable;
    ppVariable4: TppVariable;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppVariable5: TppVariable;
    ppVariable6: TppVariable;
    ppVariable7: TppVariable;
    ppVariable8: TppVariable;
    ppLabel42: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel43: TppLabel;
    ppVariable9: TppVariable;
    ppVariable10: TppVariable;
    ppVariable11: TppVariable;
    ppVariable12: TppVariable;
    ppLine5: TppLine;
    ppLine7: TppLine;
    ppLabel40: TppLabel;
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dblcNivelNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure ppDBCalc3Print(Sender: TObject);
    procedure ppDBCalc4Print(Sender: TObject);
    procedure ppDBCalc2Print(Sender: TObject);
    procedure ppDBCalc1Print(Sender: TObject);
    procedure ppDBCalc13Calc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc14Calc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc15Calc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc16Calc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc17Calc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc18Calc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc19Calc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc20Calc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc21Calc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc22Calc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc23Calc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc24Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable2Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable3Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable4Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable5Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable6Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable7Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable8Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable9Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable10Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable11Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable12Calc(Sender: TObject; var Value: Variant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sCiaCuenta : String;
  end;


var
  FHojaTrabajo: TFHojaTrabajo;

implementation

uses CNTDM;

{$R *.DFM}



procedure TFHojaTrabajo.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DMCNT.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   end;

   sCiaCuenta:=DMCNT.FiltraTablaxCia( DMCNT.cdsCuenta,  'TGE202', 'CUENTAID', dblcCia.Text );

end;

procedure TFHojaTrabajo.bbtnOkClick(Sender: TObject);
var sWhere,sSQL,sDebe,sHabe,sSaldoDebe,sSaldoHabe,sMon:string;
    i,x:integer;
begin

   Screen.Cursor:=crHourGlass;
   if rgMes.ItemIndex=1 then  // CUANDO ES ACUMULADO
   begin
     x:=1;
   end
   else
   begin
     x:=StrToInt(speMM.text);
   end;

   if rgMoneda.ItemIndex=1 then  // CUANDO ES MONDEDA EXTRANJERA
   begin
     sMon:='ME';
     sWhere:='TMON_LOC=''E''';
   end
   else
   begin
     sMon:='MN';
     sWhere:='TMON_LOC=''L''';
   end;

     for i:=x to StrToInt(speMM.text) do
     begin
       sDebe:=sDebe+wReplacCeros+'(DEBE'+sMon+DMCNT.StrZero(IntToStr(i),2)+',0)+';
       sHabe:=sHabe+wReplacCeros+'(HABE'+sMon+DMCNT.StrZero(IntToStr(i),2)+',0)+';
     end;

       //QUITAR EL ULTIMO + DE LA CADENA
       sDebe:=Copy(sDebe,1,Length(sDebe)-1);
       sHabe:=Copy(sHabe,1,Length(sHabe)-1);
       if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
       begin
        //** 03/08/2001 - pjsv
        sSaldoDebe:='SUM(CASE WHEN '+sDebe+'>='+sHabe+' THEN ('+sDebe+')-('+sHabe+') ELSE 0 END) SALDODEBE,';
        sSaldoHabe:='SUM(CASE WHEN '+sDebe+'>='+sHabe+' THEN 0 ELSE ('+sHabe+')-('+sDebe+') END) SALDOHABER';
        //**
       end
       else
       begin
        sSaldoDebe:='SUM(DECODE(LEAST('+sDebe+','+sHabe+'),'+sHabe+',('+sDebe+')-('+sHabe+'),0)) SALDODEBE,';
        sSaldoHabe:='SUM(DECODE(GREATEST('+sDebe+','+sHabe+'),'+sHabe+',('+sHabe+')-('+sDebe+'),0)) SALDOHABER';
       end;

       sDebe:='SUM('+sDebe+') DEBE, ';
       sHabe:='SUM('+sHabe+') HABE, ';

       if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
       begin
         sSQL:=' SELECT CNT401.CIAID,CNT401.ANO,CNT401.CUENTAID,CNT401.CTADES,'+sDebe+sHabe+sSaldoDebe+sSaldoHabe+
          ' FROM CNT401 '+
          ' LEFT JOIN TGE202 CTA ON CNT401.CUENTAID=CTA.CUENTAID AND CNT401.CIAID=CTA.CIAID'+
          ' WHERE CNT401.CIAID='+QuotedStr(dblcCia.text)+' AND CNT401.ANO='+QuotedStr(speAno.text)+' AND CNT401.TIPO='+QuotedStr(dblcNivel.text)+' '+
          ' AND (CNT401.AUXID IS NULL OR CNT401.AUXID = '''') AND (CLAUXID IS NULL OR CLAUXID ='''') AND (CCOSID IS NULL OR CCOSID='''')'+
          ' GROUP BY CNT401.CIAID,CNT401.ANO,CNT401.CUENTAID,CNT401.CTADES '+
          ' ORDER BY CNT401.CIAID,CNT401.ANO,CNT401.CUENTAID ';
        end
        else
        begin
         sSQL:=' SELECT CNT401.CIAID,CNT401.ANO,CNT401.CUENTAID,CNT401.CTADES,'+sDebe+sHabe+sSaldoDebe+sSaldoHabe+
          ' FROM CNT401'+
          ' WHERE CNT401.CIAID='+QuotedStr(dblcCia.text)+' AND CNT401.ANO='+QuotedStr(speAno.text)+' AND CNT401.TIPO='+QuotedStr(dblcNivel.text)+' ';
         if sCiaCuenta<>'' then
            sSQL:=sSQL+' and CNT401.'+sCiaCuenta;
         sSQL:=sSQL+
          ' GROUP BY CNT401.CIAID,CNT401.ANO,CNT401.CUENTAID,CNT401.CTADES '+
          ' ORDER BY CNT401.CIAID,CNT401.ANO,CNT401.CUENTAID ';
        end;

     DMCNT.cdsRMayor.Close;
     DMCNT.cdsRMayor.DataRequest(sSQL);
     DMCNT.cdsRMayor.Open;
     if DMCNT.cdsRMayor.RecordCount=0 then
     begin
       ShowMessage('No hay registros que mostrar');
     end
     else
     begin
       //**
       pplblCIA.text:=edtCia.text;
       pplblMoneda.text:=DMCNT.DisplayDescrip('prvTGE','TGE103','TMONDES',sWhere,'TMONDES');
       pplblFecha.text:=' DE '+DMCNT.NombreMes(speMM.text)+' DEL '+speAno.text;

       DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Hoja de Trabajo',
        dblcCia.Text,                                  // Campañía
        speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
        '', '',                                        // Fecha   Inicio - final
        dblcNivel.text,  '',                           // Nivel   - Origen
        '', inttostr( rgmoneda.itemindex),             // Lote    -  Moneda
        '', '',                                        // Cuentas - Auxiliares
        '', 'Impresora',                                // Costos - Tipo Salida
        inttostr(rgMes.itemindex) );                                          // Tipo Rep

       pprHojaTrabajo.Print;
     end;


     if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
     begin
       sSQL:=' SELECT CNT401.CIAID,CNT401.ANO,CNT401.CUENTAID,CNT401.CTADES,'+sDebe+sHabe+sSaldoDebe+sSaldoHabe+
        ' FROM CNT401 '+
        ' LEFT JOIN TGE202 CTA ON CNT401.CUENTAID=CTA.CUENTAID '+
        ' LEFT JOIN TGE202 PLAN ON (CNT401.CUENTAID=PLAN.CUENTAID) AND (CNT401.CIAID=PLAN.CIAID) '+
        ' WHERE CNT401.CIAID='+QuotedStr(dblcCia.text)+' AND CNT401.ANO='+QuotedStr(speAno.text)+' AND CNT401.TIPO='+QuotedStr(dblcNivel.text)+' '+
        ' AND PLAN.CTA_TIPO IN (''A'',''P'') '+
        ' GROUP BY CNT401.CIAID,CNT401.ANO,CNT401.CUENTAID,CNT401.CTADES '+
        ' ORDER BY CNT401.CIAID,CNT401.ANO,CNT401.CUENTAID ';
     end
     else
     begin
       sSQL:=' SELECT CNT401.CIAID,CNT401.ANO,CNT401.CUENTAID,CNT401.CTADES,'+sDebe+sHabe+sSaldoDebe+sSaldoHabe+
        ' FROM CNT401,TGE202 PLAN '+
        ' WHERE (CNT401.CUENTAID=PLAN.CUENTAID(+)) AND (CNT401.CIAID=PLAN.CIAID(+)) '+
        ' AND CNT401.CIAID='+QuotedStr(dblcCia.text)+' AND CNT401.ANO='+QuotedStr(speAno.text)+' AND CNT401.TIPO='+QuotedStr(dblcNivel.text)+' '+
        ' AND PLAN.CTA_TIPO IN (''A'',''P'') ';
          if sCiaCuenta<>'' then
             sSQL:=sSQL+' and CNT401.'+sCiaCuenta;
         sSQL:=sSQL+
        ' GROUP BY CNT401.CIAID,CNT401.ANO,CNT401.CUENTAID,CNT401.CTADES '+
        ' ORDER BY CNT401.CIAID,CNT401.ANO,CNT401.CUENTAID ';
     end;
     DMCNT.cdsRMayor.Close;
     DMCNT.cdsRMayor.DataRequest(sSQL);
     DMCNT.cdsRMayor.Open;

     if DMCNT.cdsRMayor.RecordCount=0 then
     begin
       ShowMessage('No hay registros que mostrar');
     end
     else
     begin
       pplblCIA1.text:=edtCia.text;
       pplblMoneda1.text:=DMCNT.DisplayDescrip('prvTGE','TGE103','TMONDES',sWhere,'TMONDES');
       pplblFecha1.text:=' DE '+DMCNT.NombreMes(speMM.text)+' DEL '+speAno.text;
       ppHojaTrabajo1.Print;
     end;
     pplblCIA2.text:=edtCia.text;
     pplblFecha2.text:=' DE '+DMCNT.NombreMes(speMM.text)+' DEL '+speAno.text;
     pplblMoneda2.text:=DMCNT.DisplayDescrip('prvTGE','TGE103','TMONDES',sWhere,'TMONDES');
     if DMCNT.cdsRMayor.RecordCount=0 then
     begin
       ShowMessage('No hay registros que mostrar');
     end
     else
     begin
       ppHojaTrabajo2.Print;
     end;
     Screen.Cursor:=crDefault;
end;

procedure TFHojaTrabajo.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFHojaTrabajo.FormShow(Sender: TObject);
var
    xAno, xMes, xDia : word;
begin
   DMCNT.Filtracds( DMCNT.cdsNivel,'' );
   DMCNT.cdsNivel.IndexFieldNames   := 'NIVEL';

   DMCNT.cdsNivel.First;
//   DMCNT.cdsNivel.Next;
   dblcNivel.Text:=DMCNT.cdsNivel.FieldByName('Nivel').AsString;
//   dblcNivel.Text:='1';

   dblcCia.Text     := '' ;
   DecodeDate(Date, xAno, xMes, xDia);
   speAno.Value:=xAno;
   speMM.Value:=xMes;

   dblcCia.Text := DMCNT.cdsCia.fieldbyname('CIAID').AsString ;
   edtCia.Text  := DMCNT.cdsCia.fieldbyname('CIADES').AsString ;

end;

procedure TFHojaTrabajo.dblcNivelNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
	if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;

	Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFHojaTrabajo.ppDBCalc3Print(Sender: TObject);
begin
     ppDBCalc3.DisplayFormat:='###,###,###,#0.00';
end;

procedure TFHojaTrabajo.ppDBCalc4Print(Sender: TObject);
begin
     ppDBCalc4.DisplayFormat:='###,###,###,#0.00';
end;

procedure TFHojaTrabajo.ppDBCalc2Print(Sender: TObject);
begin
     ppDBCalc2.DisplayFormat:='###,###,###,#0.00';
end;

procedure TFHojaTrabajo.ppDBCalc1Print(Sender: TObject);
begin
     ppDBCalc1.DisplayFormat:='###,###,###,#0.00';
end;

procedure TFHojaTrabajo.ppDBCalc13Calc(Sender: TObject;
  var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
  if ppdbCalc3.text='' then
    xD:=0
  else
    xD:=ppdbCalc3.Value;
  if ppdbCalc4.text='' then
    xH:=0
  else
    xH:=ppdbCalc4.Value;
  if (xH>=xD) then
  begin
    Value:=(xH-xD);
    ppDBCalc13.Visible:=True;
    ppDBCalc14.Visible:=False;
  end;
end;

procedure TFHojaTrabajo.ppDBCalc14Calc(Sender: TObject;
  var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
  if ppdbCalc3.text='' then
    xD:=0
  else
    xD:=ppdbCalc3.Value;
  if ppdbCalc4.text='' then
    xH:=0
  else
    xH:=ppdbCalc4.Value;
  if (xD>xH) then
  begin
    Value:=(xD-xH);
    ppDBCalc13.Visible:=False;
    ppDBCalc14.Visible:=True;
  end;
end;

procedure TFHojaTrabajo.ppDBCalc15Calc(Sender: TObject;
  var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
  if ppdbCalc2.text='' then
    xD:=0
  else
    xD:=ppdbCalc2.Value;
  if ppdbCalc1.text='' then
    xH:=0
  else
    xH:=ppdbCalc1.Value;
  if (xH>=xD) then
  begin
    Value:=(xH-xD);
    ppDBCalc15.Visible:=True;
    ppDBCalc16.Visible:=False;
  end;
end;

procedure TFHojaTrabajo.ppDBCalc16Calc(Sender: TObject;
  var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
//  ppdbCalc2.DisplayFormat:='';
//  ppdbCalc1.DisplayFormat:='';
  if ppdbCalc2.text='' then
    xD:=0
  else
    xD:=ppdbCalc2.Value;
  if ppdbCalc1.text='' then
    xH:=0
  else
    xH:=ppdbCalc1.Value;
  if (xD>xH) then
  begin
    Value:=(xD-xH);
    ppDBCalc15.Visible:=False;
    ppDBCalc16.Visible:=True;
  end;
end;

procedure TFHojaTrabajo.ppDBCalc17Calc(Sender: TObject;
  var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
  if ppdbCalc5.text='' then
    xD:=0
  else
    xD:=ppdbCalc5.Value;
  if ppdbCalc6.text='' then
    xH:=0
  else
    xH:=ppdbCalc6.Value;
  if (xH>=xD) then
  begin
    Value:=(xH-xD);
    ppDBCalc17.Visible:=True;
    ppDBCalc18.Visible:=False;
  end;
end;

procedure TFHojaTrabajo.ppDBCalc18Calc(Sender: TObject;
  var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
  if ppdbCalc5.text='' then
    xD:=0
  else
    xD:=ppdbCalc5.Value;
  if ppdbCalc6.text='' then
    xH:=0
  else
    xH:=ppdbCalc6.Value;
  if (xD>xH) then
  begin
    Value:=(xD-xH);
    ppDBCalc17.Visible:=False;
    ppDBCalc18.Visible:=True;
  end;
end;

procedure TFHojaTrabajo.ppDBCalc19Calc(Sender: TObject;
  var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
  if ppdbCalc7.text='' then
    xD:=0
  else
    xD:=ppdbCalc7.Value;
  if ppdbCalc8.text='' then
    xH:=0
  else
    xH:=ppdbCalc8.Value;
  if (xH>=xD) then
  begin
    Value:=(xH-xD);
    ppDBCalc19.Visible:=True;
    ppDBCalc20.Visible:=False;
  end;
end;

procedure TFHojaTrabajo.ppDBCalc20Calc(Sender: TObject;
  var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
  if ppdbCalc7.text='' then
    xD:=0
  else
    xD:=ppdbCalc7.Value;
  if ppdbCalc8.text='' then
    xH:=0
  else
    xH:=ppdbCalc8.Value;
  if (xD>xH) then
  begin
    Value:=(xD-xH);
    ppDBCalc19.Visible:=False;
    ppDBCalc20.Visible:=True;
  end;

end;

procedure TFHojaTrabajo.ppDBCalc21Calc(Sender: TObject;
  var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
  if ppdbCalc9.text='' then
    xD:=0
  else
    xD:=ppdbCalc9.Value;
  if ppdbCalc10.text='' then
    xH:=0
  else
    xH:=ppdbCalc10.Value;
  if (xH>=xD) then
  begin
    Value:=(xH-xD);
    ppDBCalc21.Visible:=True;
    ppDBCalc22.Visible:=False;
  end;

end;

procedure TFHojaTrabajo.ppDBCalc22Calc(Sender: TObject;
  var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
  if ppdbCalc9.text='' then
    xD:=0
  else
    xD:=ppdbCalc9.Value;
  if ppdbCalc10.text='' then
    xH:=0
  else
    xH:=ppdbCalc10.Value;
  if (xD>xH) then
  begin
    Value:=(xD-xH);
    ppDBCalc21.Visible:=False;
    ppDBCalc22.Visible:=True;
  end;
end;

procedure TFHojaTrabajo.ppDBCalc23Calc(Sender: TObject;
  var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
  if ppdbCalc11.text='' then
    xD:=0
  else
    xD:=ppdbCalc11.Value;
  if ppdbCalc12.text='' then
    xH:=0
  else
    xH:=ppdbCalc12.Value;
  if (xH>=xD) then
  begin
    Value:=(xH-xD);
    ppDBCalc23.Visible:=True;
    ppDBCalc24.Visible:=False;
  end;
end;

procedure TFHojaTrabajo.ppDBCalc24Calc(Sender: TObject;
  var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
  if ppdbCalc11.text='' then
    xD:=0
  else
    xD:=ppdbCalc11.Value;
  if ppdbCalc12.text='' then
    xH:=0
  else
    xH:=ppdbCalc12.Value;

  if (xD>xH) then
   begin
    Value:=(xD-xH);
    ppDBCalc23.Visible:=False;
    ppDBCalc24.Visible:=True;
   end;

end;

////////////********** para la Hoja3 **************/////////////
procedure TFHojaTrabajo.ppVariable1Calc(Sender: TObject;
  var Value: Variant);
begin
   If ppDBCalc21.Visible then
     value := ppDBCalc9.Value + ppDBCalc21.value
   else
    value := ppDBCalc9.Value;
end;

procedure TFHojaTrabajo.ppVariable2Calc(Sender: TObject;
  var Value: Variant);
begin
   If ppDBCalc22.Visible then
    value := ppDBCalc10.Value + ppDBCalc22.value
   else
    value := ppDBCalc10.Value;
end;

procedure TFHojaTrabajo.ppVariable3Calc(Sender: TObject;
  var Value: Variant);
begin
   If ppDBCalc23.Visible then
     value := ppDBCalc11.Value + ppDBCalc23.value
   else
    value := ppDBCalc11.Value;
end;

procedure TFHojaTrabajo.ppVariable4Calc(Sender: TObject;
  var Value: Variant);
begin
   If ppDBCalc24.Visible then
    value := ppDBCalc12.Value + ppDBCalc24.value
   else
    value := ppDBCalc12.Value;
end;
////////////************************/////////////

////////////********** para la Hoja2 **************/////////////
procedure TFHojaTrabajo.ppVariable5Calc(Sender: TObject;
  var Value: Variant);
begin
    If ppDBCalc17.Visible then
     value := ppDBCalc5.Value + ppDBCalc17.value
    else
     value := ppDBCalc5.Value;
end;

procedure TFHojaTrabajo.ppVariable6Calc(Sender: TObject;
  var Value: Variant);
begin
    If ppDBCalc18.Visible then
     value := ppDBCalc6.Value + ppDBCalc18.value
    else
     value := ppDBCalc6.Value;

end;

procedure TFHojaTrabajo.ppVariable7Calc(Sender: TObject;
  var Value: Variant);
begin
    If ppDBCalc19.Visible then
     value := ppDBCalc7.Value + ppDBCalc19.value
    else
     value := ppDBCalc7.Value;

end;

procedure TFHojaTrabajo.ppVariable8Calc(Sender: TObject;
  var Value: Variant);
begin
   If ppDBCalc20.Visible then
    value := ppDBCalc8.Value + ppDBCalc20.value
    else
     value := ppDBCalc8.Value;
end;
////////////************************/////////////

procedure TFHojaTrabajo.ppVariable9Calc(Sender: TObject;
  var Value: Variant);
begin
    If ppDBCalc13.Visible then
     value := ppDBCalc3.Value + ppDBCalc13.value
    else
     value := ppDBCalc3.Value;
end;

procedure TFHojaTrabajo.ppVariable10Calc(Sender: TObject;
  var Value: Variant);
begin
    If ppDBCalc14.Visible then
     value := ppDBCalc4.Value + ppDBCalc14.value
    else
     value := ppDBCalc4.Value;
end;

procedure TFHojaTrabajo.ppVariable11Calc(Sender: TObject;
  var Value: Variant);
begin
    If ppDBCalc15.Visible then
     value := ppDBCalc2.Value + ppDBCalc15.value
    else
     value := ppDBCalc2.Value;
end;

procedure TFHojaTrabajo.ppVariable12Calc(Sender: TObject;
  var Value: Variant);
begin
    If ppDBCalc16.Visible then
     value := ppDBCalc1.Value + ppDBCalc16.value
    else
     value := ppDBCalc1.Value;
end;

procedure TFHojaTrabajo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
   Action:=caFree;
end;

procedure TFHojaTrabajo.bbtnCancClick(Sender: TObject);
begin
   Close;
end;

end.
