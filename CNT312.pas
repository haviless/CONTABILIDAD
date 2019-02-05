unit CNT312;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, wwdbdatetimepicker, wwdblook, Buttons, Mask, wwdbedit,
  Spin, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppProd, ppReport,
  ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, Grids, Wwdbigrd, Wwdbgrid ,ppViewr,
  ppTypes, oaVariables;
type
  TFBalComprob = class(TForm)
    pnlMayorAn: TPanel;
    lblCia: TLabel;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    rgMoneda: TRadioGroup;
    gbLPar: TGroupBox;
    ckTit: TCheckBox;
    edtTit: TEdit;
    ppdbBalComprob: TppDBPipeline;
    pprBalComprob: TppReport;
    gbNivel: TGroupBox;
    dblcNivel: TwwDBLookupCombo;
    gbPer: TGroupBox;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    Label2: TLabel;
    dbdtpFReg1: TwwDBDateTimePicker;
    dbdtpFReg2: TwwDBDateTimePicker;
    pprBalComprobUnaMoneda: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppdbtSMN: TppDBText;
    ppDBText7: TppDBText;
    ppDBText10: TppDBText;
    ppdbtDMN: TppDBText;
    ppdbtHMN: TppDBText;
    ppvSFMN: TppVariable;
    ppdbtSME: TppDBText;
    ppdbtDME: TppDBText;
    ppdbtHME: TppDBText;
    ppvSFME: TppVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel1: TppLabel;
    ppvTSMN: TppVariable;
    ppvTDMN: TppVariable;
    ppvTSFMN: TppVariable;
    ppvTSME: TppVariable;
    ppvTDME: TppVariable;
    ppvTHME: TppVariable;
    ppvTSFME: TppVariable;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppvTHMN: TppVariable;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    pplblCia: TppLabel;
    ppLabel22: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel28: TppLabel;
    pplblTitulo: TppLabel;
    ppLabel9: TppLabel;
    pplblPer: TppLabel;
    pplblPeriodo: TppLabel;
    ppLabel27: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppLabel7: TppLabel;
    ppLabel5: TppLabel;
    pplblMN: TppLabel;
    ppLabel18: TppLabel;
    ppLabel6: TppLabel;
    pplblSMN: TppLabel;
    pplblDMN: TppLabel;
    pplblHMN: TppLabel;
    pplblSFMN: TppLabel;
    pplblSME: TppLabel;
    pplblDME: TppLabel;
    pplblHME: TppLabel;
    pplblSFMe: TppLabel;
    ppLabel2: TppLabel;
    rgCuentaSola: TRadioGroup;
    Z2bbtnSelCuentaSola: TBitBtn;
    ppHeaderBand2: TppHeaderBand;
    pplblCia2: TppLabel;
    pplblTitulo2: TppLabel;
    ppLabel32: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel34: TppLabel;
    pplblPeriodo2: TppLabel;
    ppLabel11: TppLabel;
    ppLabel8: TppLabel;
    ppTituloMoneda: TppLabel;
    ppLabel33: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel12: TppLabel;
    ppLabel10: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel20: TppLabel;
    ppLabel15: TppLabel;
    ppLabel19: TppLabel;
    ppLabel21: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel23: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDEBE: TppDBText;
    ppVariable1: TppVariable;
    ppdbtADEBE: TppDBText;
    ppdbtAHABE: TppDBText;
    ppVariable2: TppVariable;
    ppdbtSaldAntMN: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLabel35: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLine3: TppLine;
    ppHABER: TppDBText;
    ppDBCalc7: TppDBCalc;
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure ckTitClick(Sender: TObject);
    procedure ppvSFMNCalc(Sender: TObject; var Value: Variant);
    procedure ppvSFMECalc(Sender: TObject; var Value: Variant);
    procedure ppdbtSMNPrint(Sender: TObject);
    procedure ppdbtDMNPrint(Sender: TObject);
    procedure ppdbtHMNPrint(Sender: TObject);
    procedure ppdbtSMEPrint(Sender: TObject);
    procedure ppdbtDMEPrint(Sender: TObject);
    procedure ppdbtHMEPrint(Sender: TObject);
    function StrZ(wNumero:String;wLargo:Integer):string;
    procedure LlenaCNT301;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbdtpFReg1Exit(Sender: TObject);
    procedure dbdtpFReg2Exit(Sender: TObject);
    procedure gbPerExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pprBalComprobPreviewFormCreate(Sender: TObject);
    procedure ppSaldoAntPrint(Sender: TObject);
    procedure ppDEBEPrint(Sender: TObject);
    procedure ppHABERPrint(Sender: TObject);
    procedure pprBalComprobUnaMonedaPreviewFormCreate(Sender: TObject);
    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc2Calc(Sender: TObject);
    procedure ppDBCalc3Calc(Sender: TObject);
    procedure ppDBCalc1Calc(Sender: TObject);
    procedure ppDBCalc4Calc(Sender: TObject);
    procedure ppDBCalc5Calc(Sender: TObject);
    procedure ppDBCalc6Calc(Sender: TObject);
    procedure ppVariable2Calc(Sender: TObject; var Value: Variant);
    procedure ppDBCalc8Calc(Sender: TObject);
    procedure ppDBCalc7Calc(Sender: TObject);
    procedure ppdbtADEBEPrint(Sender: TObject);
    procedure ppdbtAHABEPrint(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure Z2bbtnSelCuentaSolaClick(Sender: TObject);
    procedure rgCuentaSolaClick(Sender: TObject);
{    procedure ppdbcSaldAntMNCalc(Sender: TObject);}
    procedure ppdbtSaldAntMNPrint(Sender: TObject);
    procedure bbtnCancClick(Sender: TObject);
  private
    { Private declarations }
    xnivel : string;
  public
    { Public declarations }
    // vhn
    sCiaOrigen : String;
    sCiaCuenta : String;
  end;

var
  FBalComprob: TFBalComprob;
  Year, Month, Day: Word;
  xwhere, anomm : string;

  // Variables para procesos de transferencia (temporales)
   wtdi, wnumco, wano, wper, wnumdo, wmm: String;
   wfedo, wfeve, wfeco: tDate;

implementation

uses CNTDM, CNT412, CNT998;

{$R *.DFM}

procedure TFBalComprob.dblcCiaExit(Sender: TObject);
begin
   if (bbtnCanc.Focused) then exit;
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DMCNT.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   end;

   sCiaCuenta:=DMCNT.FiltraTablaxCia( DMCNT.cdsCuenta,  'TGE202', 'CUENTAID', dblcCia.Text );
   sCiaOrigen:=DMCNT.FiltraTablaxCia( DMCNT.cdsTDiario, 'TGE104', 'TDIARID',  dblcCia.Text );

end;

procedure TFBalComprob.bbtnOkClick(Sender: TObject);
Var
  xSQL,xWhere2,xMes,wMesAnt: String;
  CampoDMN,CampoHMN,CampoSMN,CampoDME,CampoHME,CampoSME: String;
  sMon,sWhere,sDebe,sHabe{,sHaving} : string;
  i, xLen :integer;
  xCuentas : Array[1..250] of string;
  xDigi,xZ,xConCuen : Integer;
  xCuenta : String;
  xEntero : String;
  xCuentas1 : String;
    // Filtra Log
  sCtaLog : String;
begin
  DMCNT.cdsQry.indexFieldNames :='';
  DMCNT.cdsQry.filter := '';
  DMCNT.cdsQry.Filtered := True;
  xWhere2:='';
  if edtCia.Text='' then
  begin
     showmessage('Compañia no válida');
     raise exception.Create('Compañia no válida');
  end ;

  if dblcNivel.Text='' then
  begin
  	  ShowMessage('Seleccione un Nivel de Detalle de Cuenta');
     raise exception.Create('Seleccione un Nivel de Detalle de Cuenta');
  end ;

  //** 02/05/2001 - pjsv, para saber si es de ultimo nivel, para sumar solo
  // las ctas. de mov. sino suma todas las del nivel + las de mov. que hubieran
  xnivel :='';
  xsql :='';

  sCtaLog:='';
  if (rgCuentaSola.ItemIndex=1) and (FSelCuenta.cdsClone.recordcount>0) then
  begin
      xCuentas1:= ' and CNT401.CUENTAID IN (' ;
      sCtaLog  := 'CUENTAID IN ( ';
      with FSelCuenta.cdsClone do
      begin
         FSelCuenta.cdsClone.First ;
         while not FSelCuenta.cdsClone.Eof do
         begin
            DMCNT.cdsNivel.First;
            while not DMCNT.cdsNivel.Eof do
            begin
               xCuentas1:=xCuentas1+''''+Copy(FSelCuenta.cdsClone.fieldbyname('CUENTAID').AsString, 1, DMCNT.cdsNivel.FieldByname('DIGITOS').AsInteger ) + '''';
               sCtaLog  :=sCtaLog  +Copy(FSelCuenta.cdsClone.fieldbyname('CUENTAID').AsString, 1, DMCNT.cdsNivel.FieldByname('DIGITOS').AsInteger );
               DMCNT.cdsNivel.Next;
               if not DMCNT.cdsNivel.eof then
               begin
                  xCuentas1:= xCuentas1 + ' , ' ;
                  sCtaLog  := sCtaLog   + ', ';
               end;
            end;
            FSelCuenta.cdsClone.Next ;
            if not FSelCuenta.cdsClone.eof then
            begin
               xCuentas1:= xCuentas1 + ' , ' ;
               sCtaLog  := sCtaLog   + ', ';
            end;
         end;
      end;
      xCuentas1 := xCuentas1 + ' ) ';
      sCtaLog   := sCtaLog   + ' )';
  end ;


  // CLG 11/07/2001 ACUMULADO DEL DEBE Y HABER
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

  for i:=1 to StrToInt(speMM.text) do
  begin
      sDebe:=sDebe+wReplacCeros+'(DEBE'+sMon+DMCNT.StrZero(IntToStr(i),2)+',0)+';
      sHabe:=sHabe+wReplacCeros+'(HABE'+sMon+DMCNT.StrZero(IntToStr(i),2)+',0)+';
  end;

  if Length( sDebe )=0 then
  begin
     i:=0;
     sDebe:=sDebe+wReplacCeros+'(DEBE'+sMon+DMCNT.StrZero(IntToStr(i),2)+',0)+';
     sHabe:=sHabe+wReplacCeros+'(HABE'+sMon+DMCNT.StrZero(IntToStr(i),2)+',0)+';
  end;

  //QUITAR EL ULTIMO + DE LA CADENA
  sDebe:=Copy(sDebe,1,Length(sDebe)-1);
  sHabe:=Copy(sHabe,1,Length(sHabe)-1);


  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    sDebe:=sDebe+' ADEBE, ';
    sHabe:=sHabe+' AHABE, ';
  end
  else
  begin
    sDebe:=sDebe+' ADEBE, ';
    sHabe:=sHabe+' AHABE, ';
  end;

  xnivel :='';
  xsql :='';

  if (SRV_D = 'DB2NT') or	 (SRV_D = 'DB2400') then
  begin
    xsql := 'NIVEL='+quotedstr('0'+IntToStr(StrToInt(dblcNivel.text)-1))
  end
  else
  begin
    xsql := 'NIVEL='+quotedstr(IntToStr(StrToInt(dblcNivel.text)-1));
  end;

  if DMCNT.DisplayDescrip('PrvTGE','CNT202','*',xsql,'NIVEL') = '' then
     xnivel := '0'
  else
  	  xnivel := '1';

  xWhere:='CNT401.CIAID='+''''+dblcCia.Text+''''
        +' and CNT401.ANO='+''''+speAno.Text+''''
        +' and CNT401.TIPO<='+''''+dblcNivel.Text+''''
        + ' AND (cnt401.auxid IS NULL OR cnt401.auxid='''') '
        + ' AND (cnt401.ccosid is null or cnt401.ccosid='''')'
        + ' AND length(cnt401.cuentaid) <> 1' ;

  if rgCuentaSola.ItemIndex = 1 then
  begin
     FSelCuenta.cdsClone.first;
     xConCuen := 0;
     while not FSelCuenta.cdsClone.Eof do
     begin
        xConCuen := xConCuen + 1;
        xCuentas[xConCuen] := FSelCuenta.cdsClone.FieldByName('CUENTAID').AsString;
        xZ := StrToInt(dblcNivel.text);
        xLen:=Length(dblcNivel.text);
        repeat
           if xZ>1 then
              xZ := xZ -1;
           xEntero := DMCNT.DisplayDescrip('PrvTGE','CNT202','DIGITOS','NIVEL='+quotedstr(DMCNT.StrZero(IntToStr(xZ),xLen)),'DIGITOS');
           xDigi := StrToInt(xEntero); //StrToInt(DMCNT.DisplayDescrip('PrvTGE','CNT202','DIGITOS','NIVEL='+quotedstr(DMCNT.StrZero(IntToStr(xZ),2)),'DIGITOS'));
           xConCuen := xConCuen + 1;
           xCuentas[xConCuen] :=  copy(FSelCuenta.cdsClone.FieldByName('CUENTAID').AsString,1,xDigi);
        until xz = 1;
        FSelCuenta.cdsClone.next;
     end;
  end;

  xMes:=speMM.Text;
  if (StrToInt(xmes) - 1) <= 9 then
  	  wMesAnt := '0' + inttostr((StrToInt(xmes) - 1))
  else
  	  wMesAnt := inttostr((StrToInt(xmes) - 1));

  if length(xMes)<2 then xMes := '0'+xMes;

     if wMesAnt='0-1' then
     begin
        wMesAnt:='00';
        CampoSME := '0.00 '; // wmes
        CampoSMN := '0.00 '; // wmes
     end
     else
     begin
        CampoSME := 'SALDME'+wMesAnt; // wmes
        CampoSMN := 'SALDMN'+wMesAnt; // wmes
     end;
     //**
     CampoDMN := 'DEBEMN'+xMes;
     CampoHMN := 'HABEMN'+xMes;
     CampoDME := 'DEBEME'+xMes;
     CampoHME := 'HABEME'+xMes;

    if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
    begin
        xSQL:='Select CNT401.CUENTAID, CNT401.CTADES, '
           +'COALESCE( '+CampoSMN+',0) as SALDMN, '
           +'COALESCE( '+CampoDMN+',0) as DEBEMN, '
           +'COALESCE( '+CampoHMN+',0) as HABEMN, '
           +'COALESCE( '+CampoSME+',0) as SALDME, '
           +'COALESCE( '+CampoDME+',0) as DEBEME, '
           +'COALESCE( '+CampoHME+',0) as HABEME, '
           +sDebe+sHabe
           +' TGE202.CTA_DET,CNT401.TIPO'
           +' From CNT401 '
           +' LEFT JOIN TGE202 ON (CNT401.CUENTAID = TGE202.CUENTAID AND CNT401.CIAID = TGE202.CIAID) Where ';
           xSQL:=xSQL+xWhere;
           For xZ := 1 to 250 do
            begin
             If xCuentas[xZ] <> '' then
              If xCuenta = '' then
               xCuenta := quotedstr(xCuentas[xZ])
              else xCuenta := xCuenta + ','+quotedstr(xCuentas[xZ]);
            end;
         If xCuenta <> '' then
          xSQL:=xSQL + ' AND CNT401.CUENTAID IN ('+xCuenta+')';
         xSQL:=xSQL +' ORDER BY CNT401.CUENTAID' ;
    end
    else
        if SRV_D = 'ORACLE' then
        begin
            xSQL:='Select CNT401.CUENTAID, CNT401.CTADES, '
              +'NVL('+CampoSMN+',0) SALDMN, '
              +'NVL('+CampoDMN+',0) DEBEMN, '+'NVL('+CampoHMN+',0) HABEMN, '
              +'NVL('+CampoSME+',0) SALDME, '
              +'NVL('+CampoDME+',0) DEBEME, '+'NVL('+CampoHME+',0) HABEME, '+sDebe+sHabe
              +' TGE202.CTA_DET,CNT401.TIPO'
              +' From CNT401, TGE202 '
              +' Where (CNT401.CUENTAID = TGE202.CUENTAID(+)) AND (CNT401.CIAID = TGE202.CIAID(+)) AND ';
            xSQL:=xSQL+xWhere;
            If Length(xCuentas1) > 0 then
               xSql := xSql + '  '+xCuentas1;

            if sCiaCuenta<>'' then
            begin
                xSql:=xSql +' and CNT401.'+ sCiaCuenta;
            end;

            xsql := xsql + ' ORDER BY CUENTAID ' ;
        end;

    DMCNT.cdsQry.Close;
    DMCNT.cdsQry.ProviderName:='prvCNT';
    DMCNT.cdsQry.DataRequest(xSQL);
    DMCNT.cdsQry.Open;
    DMCNT.cdsQry.Filter:='DEBEMN <>0.00 or HABEMN <>0.00 or DEBEME <>0.00 or HABEME <>0.00 or ADEBE <>0.00 or AHABE <>0.00';
    DMCNT.cdsQry.Filtered:=True;

    if DMCNT.cdsQry.RecordCount = 0 then
    begin
       DMCNT.cdsQry.Filter:='';
       DMCNT.cdsQry.Filtered:=True;
       Raise Exception.Create('No hay Datos Para Las Condiciones Seleccionadas') ;
    end                                                  ;
    DMCNT.cdsQry.First;
    case rgMoneda.ItemIndex of
    -1: begin
           ShowMessage('Ingrese Tipo de Moneda a Listar');
           rgMoneda.SetFocus;
        end;
    0 : begin // local
           FImpresion := TFImpresion.Create( Self );
           FImpresion.ShowModal;
           if FImpresion.wFlTexto='C' then begin
              pprBalComprob.stop;
              DMCNT.cdsQry.CancelUpdates;
              DMCNT.cdsQry.IndexFieldNames:='';
              DMCNT.cdsQry.Filter:='';
              DMCNT.cdsQry.Filtered:=True;
              Exit;
           end;
           if FImpresion.wFlTexto='G' then
              pprBalComprob.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\BalComprobUna.rtm';
           if FImpresion.wFlTexto='T' then
              pprBalComprob.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\BalComprobUnaTX.rtm';

          pprBalComprob.template.LoadFromFile ;

          ppTituloMoneda.Caption := 'MONEDA LOCAL' ;
          ppdbtSaldAntMN.DataField     := 'SALDMN' ;
          ppDEBE.DataField     := 'DEBEMN' ;
          ppHABER.DataField    := 'HABEMN' ;
          ppdbtADEBE.DataField := 'ADEBE';
          ppdbtAHABE.DataField := 'AHABE';
          pplblCia2.Caption:=edtCia.Text;
          pplblTitulo2.Caption:=edtTit.Text;
          pplblPeriodo2.caption := SysUtils.LongMonthNames[strtoint(xMes)] +'  '+ speAno.Text;

           DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Balance Comprobacion',
                 dblcCia.Text,                                  // Campañía
                 speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
                 dbdtpFReg1.Text, dbdtpFReg2.Text,              // Fecha   Inicio - final
                 dblcNivel.Text,  '',                           // Nivel   - Origen
                 '', inttostr(rgMoneda.itemindex),              // Lote    -  Moneda
                 sCtaLog, '',                                   // Cuentas - Auxiliares
                 '', 'Impresora',                               // Costos - Tipo Salida
                 '' );                                          // Tipo Rep

          pprBalComprobUnaMoneda.Print;
          pprBalComprobUnaMoneda.Stop ;
        end;
    1 : begin  // Extranjera
           FImpresion := TFImpresion.Create( Self );
           FImpresion.ShowModal;
           if FImpresion.wFlTexto='C' then begin
              pprBalComprob.stop;
              DMCNT.cdsQry.CancelUpdates;
              DMCNT.cdsQry.IndexFieldNames:='';
              DMCNT.cdsQry.Filter:='';
              DMCNT.cdsQry.Filtered:=True;
              Exit;
           end;
           if FImpresion.wFlTexto='G' then
              pprBalComprob.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\BalComprobUna.rtm';
           if FImpresion.wFlTexto='T' then
              pprBalComprob.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\BalComprobUnaTX.rtm';

          pprBalComprob.template.LoadFromFile ;

          ppTituloMoneda.Caption  := 'MONEDA EXTRANJERA' ;
          ppdbtSaldAntMN.DataField:= 'SALDME' ;
          ppDEBE.DataField     := 'DEBEME' ;
          ppHABER.DataField    := 'HABEME' ;
          ppdbtADEBE.DataField := 'ADEBE';
          ppdbtADEBE.DataField := 'AHABE';

          pplblCia2.Caption:=edtCia.Text;
          pplblTitulo2.Caption:=edtTit.Text;
          pplblPeriodo2.caption := SysUtils.LongMonthNames[strtoint(xMes)] +'  '+ speAno.Text;

           DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Balance Comprobacion',
                 dblcCia.Text,                                  // Campañía
                 speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
                 dbdtpFReg1.Text, dbdtpFReg2.Text,              // Fecha   Inicio - final
                 dblcNivel.Text,  '',                           // Nivel   - Origen
                 '', inttostr(rgMoneda.itemindex),              // Lote    -  Moneda
                 sCtaLog, '',                                   // Cuentas - Auxiliares
                 '', 'Impresora',                               // Costos - Tipo Salida
                 '' );                                          // Tipo Rep
          
          pprBalComprobUnaMoneda.Print;
          pprBalComprobUnaMoneda.Stop ;
        end;
   end;
   DMCNT.cdsQry.CancelUpdates;
   DMCNT.cdsQry.IndexFieldNames:='';
   DMCNT.cdsQry.Filter:='';
   DMCNT.cdsQry.Filtered:=True;
end;

procedure TFBalComprob.ckTitClick(Sender: TObject);
begin
   if ckTit.Checked then edtTit.Enabled:=True
   else edtTit.Enabled:=False;
end;

procedure TFBalComprob.ppvSFMNCalc(Sender: TObject; var Value: Variant);
Var
   xD,xH,xS: DOUBLE;
begin
//   Saldo Final=Saldo Anterior + (D-H)
   ppdbtSMN.DisplayFormat:='';
   ppdbtDMN.DisplayFormat:='';
   ppdbtHMN.DisplayFormat:='';
   if ppdbtSMN.Text='' then xS:=0 else xS:=strtofloat(ppdbtSMN.Text);
   if ppdbtDMN.Text='' then xD:=0 else xD:=strtofloat(ppdbtDMN.Text);
   if ppdbtHMN.Text='' then xH:=0 else xH:=strtofloat(ppdbtHMN.Text);
   Value:=xS+(xD-xH);
   // Totales...Resumen
   ppvTSMN.Value:=ppvTSMN.Value+xS;
   ppvTDMN.Value:=ppvTDMN.Value+xD;
   ppvTHMN.Value:=ppvTHMN.Value+xH;
   ppvTSFMN.Value:=ppvTSFMN.Value+(xS+(xD-xH));
end;

procedure TFBalComprob.ppvSFMECalc(Sender: TObject; var Value: Variant);
Var
   xD,xH,xS: DOUBLE;
begin
  With DMCNT do Begin
   ppdbtSME.DisplayFormat:='';
   ppdbtDME.DisplayFormat:='';
   ppdbtHME.DisplayFormat:='';
   if ppdbtSME.Text='' then xS:=0 else xS:=strtofloat(ppdbtSME.Text);
   if ppdbtDME.Text='' then xD:=0 else xD:=strtofloat(ppdbtDME.Text);
   if ppdbtHME.Text='' then xH:=0 else xH:=strtofloat(ppdbtHME.Text);
   Value:=xS+(xD-xH);
   ppvTSME.Value:=ppvTSME.Value+xS;
   ppvTDME.Value:=ppvTDME.Value+xD;
   ppvTHME.Value:=ppvTHME.Value+xH;
   ppvTSFME.Value:=ppvTSFME.Value+(xS+(xD-xH));
  End;
end;

procedure TFBalComprob.ppdbtSMNPrint(Sender: TObject);
begin
     ppdbtSMN.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalComprob.ppdbtDMNPrint(Sender: TObject);
begin
     ppdbtDMN.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalComprob.ppdbtHMNPrint(Sender: TObject);
begin
     ppdbtHMN.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalComprob.ppdbtSMEPrint(Sender: TObject);
begin
     ppdbtSME.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalComprob.ppdbtDMEPrint(Sender: TObject);
begin
     ppdbtDME.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalComprob.ppdbtHMEPrint(Sender: TObject);
begin
     ppdbtHME.DisplayFormat:='#,0.00;-#,0.00';
end;

function TFBalComprob.StrZ(wNumero:String;wLargo:Integer):string;
var
   i : integer;
   s : string;
begin
   s := '';
   for i:=1 to wLargo do
   begin
      s := s+'0';
   end;
   result := wNumero+s;
//   result:= copy(s,length(s)-(wLargo-1),wLargo);
end;

procedure TFBalComprob.LlenaCNT301;
begin
     DMCNT.cdsMovCNT2.Insert;
     DMCNT.cdsMovCNT2.FieldByName('CIAID').AsString      := DMCNT.cdsCntTemp.FieldByName('CIAID').AsString;
     DMCNT.cdsMovCNT2.FieldByName('TDIARID').AsString    := wtdi;
     DMCNT.cdsMovCNT2.FieldByName('CNTCOMPROB').AsString := wnumco;
     DMCNT.cdsMovCNT2.FieldByName('CNTANO').AsString     := wano;
     DMCNT.cdsMovCNT2.FieldByName('CNTANOMM').AsString   := wper;
//   DMCNT.cdsMovCNT2CNTLote.Value    := DMCNT.cdsMov CNTCNTLote.Value;
     DMCNT.cdsMovCNT2.FieldByName('CUENTAID').AsString   := DMCNT.cdsCntTemp.FieldByName('CUENTAID').AsString;
     DMCNT.cdsMovCNT2.FieldByName('CLAUXID').AsString    := DMCNT.cdsCntTemp.FieldByName('CLAUXID').AsString;
     DMCNT.cdsMovCNT2.FieldByName('AUXID').AsString      := DMCNT.cdsCntTemp.FieldByName('AUXID').AsString;
     DMCNT.cdsMovCNT2.FieldByName('DOCID').AsString      := DMCNT.cdsCntTemp.FieldByName('DOCID').AsString;
     DMCNT.cdsMovCNT2.FieldByName('CNTSERIE').AsString   := DMCNT.cdsCntTemp.FieldByName('CNTSERIE').AsString;
     DMCNT.cdsMovCNT2.FieldByName('CNTNODOC').AsString   := wnumdo;
     DMCNT.cdsMovCNT2.FieldByName('CNTGLOSA').AsString   := DMCNT.cdsCntTemp.FieldByName('CNTGLOSA').AsString;
     DMCNT.cdsMovCNT2.FieldByName('CNTDH').AsString      := DMCNT.cdsCntTemp.FieldByName('CNTDH').AsString;
//   DMCNT.cdsMovCNT2CCosId.Value     := DMCNT.cdsMov CNTCCosId.Value;
     DMCNT.cdsMovCNT2.FieldByName('CNTTCAMBIO').AsFloat  := DMCNT.cdsCntTemp.FieldByName('CNTTCAMBIO').AsFloat;
     DMCNT.cdsMovCNT2.FieldByName('CNTMTOORI').AsFloat   := DMCNT.cdsCntTemp.FieldByName('CNTMTOORI').AsFloat;
     DMCNT.cdsMovCNT2.FieldByName('CNTMTOLOC').AsFloat   := DMCNT.cdsCntTemp.FieldByName('CNTMTOLOC').AsFloat;
     DMCNT.cdsMovCNT2.FieldByName('CNTMTOEXT').AsFloat   := DMCNT.cdsCntTemp.FieldByName('CNTMTOEXT').AsFloat;
     if DMCNT.cdsCntTemp.FieldByName('CNTDH').AsString = 'D' then begin
        DMCNT.cdsMovCNT2.FieldByName('CNTDEBEMN').AsFloat:=DMCNT.cdsCntTemp.FieldByName('CNTMTOLOC').AsFloat;
        DMCNT.cdsMovCNT2.FieldByName('CNTDEBEME').AsFloat:=DMCNT.cdsCntTemp.FieldByName('CNTMTOEXT').AsFloat;
     end
     else begin
        DMCNT.cdsMovCNT2.FieldByName('CNTHABEMN').AsFloat:=DMCNT.cdsCntTemp.FieldByName('CNTMTOLOC').AsFloat;
        DMCNT.cdsMovCNT2.FieldByName('CNTHABEME').AsFloat:=DMCNT.cdsCntTemp.FieldByName('CNTMTOEXT').AsFloat;
     end;
     DMCNT.cdsMovCNT2.FieldByName('CNTFEMIS').AsDateTime := wfedo;
     DMCNT.cdsMovCNT2.FieldByName('CNTFVCMTO').AsDatetime:= wfeve;
     DMCNT.cdsMovCNT2.FieldByName('CNTFCOMP').AsDateTime := wfeco;
     DMCNT.cdsMovCNT2.FieldByName('CNTESTADO').AsString  := DMCNT.cdsCntTemp.FieldByName('CNTESTADO').AsString;
     DMCNT.cdsMovCNT2.FieldByName('CNTCUADRE').AsString  := 'S';
     DMCNT.cdsMovCNT2.FieldByName('CNTFAUTOM').AsString  := '';
     DMCNT.cdsMovCNT2.FieldByName('CNTUSER').AsString    := DMCNT.cdsCntTemp.FieldByName('CNTUSER').AsString;
     DMCNT.cdsMovCNT2.FieldByName('CNTFREG').AsDateTime  := wfeco;
     DMCNT.cdsMovCNT2.FieldByName('CNTMM').AsString      := wmm;
     DMCNT.cdsMovCNT2.FieldByName('TMONID').AsString     := '01';
end;

procedure TFBalComprob.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFBalComprob.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
   Action:=caFree;
end;

procedure TFBalComprob.dbdtpFReg1Exit(Sender: TObject);
begin
   If dbdtpFReg1.date=0 then
   begin
      dbdtpFReg1.SetFocus;
      showmessage('Error : Falta Registrar Fecha');
      Raise Exception.Create('Error : Falta Registrar Fecha');
   end;
end;

procedure TFBalComprob.dbdtpFReg2Exit(Sender: TObject);
begin
   If dbdtpFReg2.date=0 then
   begin
      dbdtpFReg2.SetFocus;
      ShowMessage(' Error : Falta Registrar Fecha ');
      Raise Exception.Create(' Error : Falta Registrar Fecha ');
   end;
   If dbdtpFReg2.date<dbdtpFReg1.date then
   begin
      dbdtpFReg2.SetFocus;
      ShowMessage(' Error : Fecha ser Mayor ');
      Raise Exception.Create(' Error : Fecha ser Mayor ');
   end;

   rgMoneda.Enabled    :=True ;
   //gbParametros.Enabled:=True ;

end;

procedure TFBalComprob.gbPerExit(Sender: TObject);
var
   xFecha1, xFecha2 : TDateTime;
begin
   xFecha1 := strtodate('01/'+DMCNT.strZero(speMM.Text,2)+'/'+speAno.Text);
   if strtofloat(speMM.Text)+1=13 then
   begin
      xFecha2 := strtodate('01/01/'+ FloatToStr(StrToFloat(speAno.Text)+1));
   end
   else begin
      xFecha2:=strtodate('01/'+DMCNT.strZero(floattostr(strtofloat(speMM.Text)+1),2)+'/'+speAno.Text);
   end;
   xFecha2:=xFecha2-1;
   dbdtpFReg1.date:=xFecha1;
   dbdtpFReg2.date:=xFecha2;
end;

procedure TFBalComprob.FormShow(Sender: TObject);
var
   xAno, xMes, xDia : word;
begin
   DMCNT.Filtracds( DMCNT.cdsNivel,'' );
   DMCNT.cdsNivel.IndexFieldNames   := 'NIVEL';
   DMCNT.cdsCuenta.Active:=True;
   DMCNT.cdsNivel.Last;

   dblcNivel.Text:=DMCNT.cdsNivel.FieldByName('NIVEL').AsString;
   dblcCia.Text     := '' ;
   DecodeDate(Date, xAno, xMes, xDia);
   speAno.Value:=xAno;
   speMM.Value:=xMes;
   gbPerExit(Self);
   DMCNT.cdsCia.Filtered := False     ;
   if not DMCNT.cdsCia.Active then
      DMCNT.cdsCia.Open ;
   if DMCNT.cdsCia.RecordCount = 1 then
   begin
      dblcCia.Text := DMCNT.cdsCia.fieldbyname('CIAID').AsString ;
      edtCia.Text  := DMCNT.cdsCia.fieldbyname('CIADES').AsString ;
   end ;
   rgCuentaSola.itemindex := 0;
   perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFBalComprob.pprBalComprobPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;

end;

procedure TFBalComprob.ppSaldoAntPrint(Sender: TObject);
begin
//     ppSaldoAnt.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalComprob.ppDEBEPrint(Sender: TObject);
begin
//     ppDEBE.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalComprob.ppHABERPrint(Sender: TObject);
begin
//     ppHABER.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalComprob.pprBalComprobUnaMonedaPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;

end;

procedure TFBalComprob.ppVariable1Calc(Sender: TObject; var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
   ppDEBE.DisplayFormat:='';
   ppHABER.DisplayFormat:='';
   ppVariable1.DisplayFormat:='';
   ppdbtSaldAntMN.DisplayFormat:='';
   if ppDEBE.Text='' then xD:=0 else xD:=strtofloat(ppDEBE.Text);
   if ppHABER.Text='' then xH:=0 else xH:=strtofloat(ppHABER.Text);
   Value:= StrToFloat(ppdbtSaldAntMN.text) + (xD-xH);
   ppVariable1.DisplayFormat:='###,###,###,##0.00';
   ppDEBE.DisplayFormat:='###,###,###,##0.00';
   ppHABER.DisplayFormat:='###,###,###,##0.00';
   ppdbtSaldAntMN.DisplayFormat:='###,###,###,##0.00';
end;

procedure TFBalComprob.ppDBCalc2Calc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     ppDBCalc2.Value := ppDBCalc2.Value + DMCNT.cdsQry.fieldbyname('DEBEMN').AsFloat;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
    ppDBCalc2.Value := ppDBCalc2.Value + DMCNT.cdsQry.fieldbyname('DEBEMN').AsFloat;
   end;
end;

procedure TFBalComprob.ppDBCalc3Calc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
    ppDBCalc3.Value := ppDBCalc3.Value + DMCNT.cdsQry.fieldbyname('HABEMN').AsFloat;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
    ppDBCalc3.Value := ppDBCalc3.Value + DMCNT.cdsQry.fieldbyname('HABEMN').AsFloat;
   end;
end;

procedure TFBalComprob.ppDBCalc1Calc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
     ppDBCalc1.Value := ppDBCalc1.Value + DMCNT.cdsQry.fieldbyname('DEBEME').AsFloat;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     ppDBCalc1.Value := ppDBCalc1.Value + DMCNT.cdsQry.fieldbyname('DEBEME').AsFloat;
   end;
end;

procedure TFBalComprob.ppDBCalc4Calc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
    ppDBCalc4.Value := ppDBCalc4.Value + DMCNT.cdsQry.fieldbyname('HABEME').AsFloat;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
    ppDBCalc4.Value := ppDBCalc4.Value + DMCNT.cdsQry.fieldbyname('HABEME').AsFloat;
   end;
end;

procedure TFBalComprob.ppDBCalc5Calc(Sender: TObject);
begin
  ppDBCalc5.DisplayFormat := '';
  If xNivel ='0' then
   begin
//    If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
//     begin
      If rgMoneda.ItemIndex = 0 then
       ppDBCalc5.Value := ppDBCalc5.Value + DMCNT.cdsQry.fieldbyname('DEBEMN').AsFloat
      else
       ppDBCalc5.Value := ppDBCalc5.Value + DMCNT.cdsQry.fieldbyname('DEBEME').AsFloat;
//     end;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
      If rgMoneda.ItemIndex = 0 then
       ppDBCalc5.Value := ppDBCalc5.Value + DMCNT.cdsQry.fieldbyname('DEBEMN').AsFloat
      else
       ppDBCalc5.Value := ppDBCalc5.Value + DMCNT.cdsQry.fieldbyname('DEBEME').AsFloat
     end;
   end;
  ppDBCalc5.DisplayFormat := '###,###,##0.00';
end;

procedure TFBalComprob.ppDBCalc6Calc(Sender: TObject);
begin
 ppDBCalc6.DisplayFormat := '';
 If xNivel ='0' then
   begin
//    If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
//     begin
      If rgMoneda.ItemIndex = 0 then
       ppDBCalc6.Value := ppDBCalc6.Value + DMCNT.cdsQry.fieldbyname('HABEMN').AsFloat
      else
       ppDBCalc6.Value := ppDBCalc6.Value + DMCNT.cdsQry.fieldbyname('HABEME').AsFloat
//     end;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
      If rgMoneda.ItemIndex = 0 then
       ppDBCalc6.Value := ppDBCalc6.Value + DMCNT.cdsQry.fieldbyname('HABEMN').AsFloat
      else
       ppDBCalc6.Value := ppDBCalc6.Value + DMCNT.cdsQry.fieldbyname('HABEME').AsFloat
      end;
   end;
  ppDBCalc6.DisplayFormat := '###,###,##0.00';
end;

procedure TFBalComprob.ppVariable2Calc(Sender: TObject;
  var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
   ppdbtADEBE.DisplayFormat:='';
   ppdbtAHABE.DisplayFormat:='';
   ppVariable2.DisplayFormat:='';
   ppdbtSaldAntMN.DisplayFormat:='';
   if ppdbtADEBE.Text='' then xD:=0 else xD:=strtofloat(ppdbtADEBE.Text);
   if ppdbtAHABE.Text='' then xH:=0 else xH:=strtofloat(ppdbtAHABE.Text);
   Value:= StrToFloat(ppdbtSaldAntMN .text) + (xD-xH);
   ppVariable2.DisplayFormat:='###,###,###,##0.00';
   ppdbtADEBE.DisplayFormat:='###,###,###,##0.00';
   ppdbtAHABE.DisplayFormat:='###,###,###,##0.00';
   ppdbtSaldAntMN.DisplayFormat:='###,###,###,##0.00';
end;

procedure TFBalComprob.ppDBCalc8Calc(Sender: TObject);
begin
  ppDBCalc8.DisplayFormat := '';
  If xNivel ='0' then
   begin
//    If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
//     begin
       ppDBCalc8.Value := ppDBCalc8.Value + DMCNT.cdsQry.fieldbyname('AHABE').AsFloat
//     end;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
       ppDBCalc8.Value := ppDBCalc8.Value + DMCNT.cdsQry.fieldbyname('AHABE').AsFloat
      end;
   end;
  ppDBCalc8.DisplayFormat := '###,###,##0.00';
end;

procedure TFBalComprob.ppDBCalc7Calc(Sender: TObject);
begin
  ppDBCalc7.DisplayFormat := '';
  If xNivel ='0' then
   begin
//    If (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S')  then
//     begin
       ppDBCalc7.Value := ppDBCalc7.Value + DMCNT.cdsQry.fieldbyname('ADEBE').AsFloat
//     end;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (DMCNT.cdsQry.fieldbyname('CTA_DET').AsString = 'S') then
     begin
       ppDBCalc7.Value := ppDBCalc7.Value + DMCNT.cdsQry.fieldbyname('ADEBE').AsFloat
     end;
   end;
  ppDBCalc7.DisplayFormat := '###,###,##0.00';
end;

procedure TFBalComprob.ppdbtADEBEPrint(Sender: TObject);
begin
//  ppdbtADEBE.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalComprob.ppdbtAHABEPrint(Sender: TObject);
begin
//  ppdbtAHABE.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalComprob.ppDetailBand2BeforePrint(Sender: TObject);
begin
   If Length(trim(ppDBText2.text)) = 2 then
    begin
     ppDBText2.Font.Style := [fsBold];
     ppDBText3.Font.Style := [fsBold];
     ppDEBE.Font.Style := [fsBold];
     ppHABER.Font.Style := [fsBold];
     ppVariable1.Font.Style := [fsBold];
     ppdbtADEBE.Font.Style := [fsBold];
     ppdbtAHABE.Font.Style := [fsBold];
     ppVariable2.Font.Style := [fsBold];
     ppdbtSaldAntMN.Font.Style := [fsBold];
//     ppdbcSaldAntMN.Font.Style := [fsBold];
    end
   else
    begin
     ppDBText2.Font.Style := [];
     ppDBText3.Font.Style := [];
     ppDEBE.Font.Style := [];
     ppHABER.Font.Style := [];
     ppVariable1.Font.Style := [];
     ppdbtADEBE.Font.Style := [];
     ppdbtAHABE.Font.Style := [];
     ppVariable2.Font.Style := [];
     ppdbtSaldAntMN.Font.Style := [];
//     ppdbcSaldAntMN.Font.Style := [];
    end
end;

procedure TFBalComprob.Z2bbtnSelCuentaSolaClick(Sender: TObject);
begin
   FSelCuenta.sCia:=dblcCia.text;
   FSelCuenta.xRg := '1';
   FSelCuenta.ShowModal;
end;

procedure TFBalComprob.rgCuentaSolaClick(Sender: TObject);
begin
  If rgCuentasola.itemindex = 0 then
   Z2bbtnSelCuentaSola.enabled := False
  else
    Z2bbtnSelCuentaSola.enabled := true;
end;


procedure TFBalComprob.ppdbtSaldAntMNPrint(Sender: TObject);
begin
//   ppdbtSaldAntMN.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFBalComprob.bbtnCancClick(Sender: TObject);
begin
   Close;
end;

end.


