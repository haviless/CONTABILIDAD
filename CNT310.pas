unit CNT310;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : CNT310
//Formulario               : FMayor
//Fecha de Creación        :
//Autor                    : Equipo de desarrollo
//Objetivo                 : Reporte de Mayor Analítico

//ACTUALIZACIONES
//HPC_201206_CNT 16/10/2012:  Exportacion a excel del reporte de Mayor Analítico

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, wwdbdatetimepicker, wwdblook, Buttons, Grids,
  //INICIO HPC_201206_CNT
  wwExport, shellapi,
  //FIN HPC_201206_CNT
  Wwdbigrd, Wwdbgrid, ppCtrls, ppBands, ppVar, ppClass, ppPrnabl, ppProd,
  ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppModule, daDatMod,
  Mask, wwdbedit, Wwdotdot, ComCtrls, Spin , ppViewr, ActnList,
  ppTypes, oaVariables;

type
  TFMayor = class(TForm)
    pnlMayor: TPanel;
    lblCia: TLabel;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    rgMoneda: TRadioGroup;
    gbLPar: TGroupBox;
    edtTit: TEdit;
    ppdbMayorAna: TppDBPipeline;
    pprMayorAux: TppReport;
    cbComp: TCheckBox;
    ppdbMayorAux: TppDBPipeline;
    gbNivel: TGroupBox;
    dblcNivel: TwwDBLookupCombo;
    cbNivel: TCheckBox;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    ckTDiario: TCheckBox;
    gbPer: TGroupBox;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    Label2: TLabel;
    dbdtpFReg1: TwwDBDateTimePicker;
    dbdtpFReg2: TwwDBDateTimePicker;
    rgCuenta: TRadioGroup;
    Z2bbtnSelCuenta: TBitBtn;
    rgAuxiliar: TRadioGroup;
    Z2bbtnSelAuxiliar: TBitBtn;
    Label1: TLabel;
    ppMayorAux1Mon: TppReport;
    pprMayorAna1Mon: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel7: TppLabel;
    pplblTitulo2: TppLabel;
    ppLabel27: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    pplblCia2: TppLabel;
    pplblDMN2: TppLabel;
    pplblHMN2: TppLabel;
    pplblSMN2: TppLabel;
    pplblDME2: TppLabel;
    pplblHME2: TppLabel;
    pplblSME2: TppLabel;
    pplblME2: TppLabel;
    ppLabel11: TppLabel;
    ppLabel14: TppLabel;
    ppLabel21: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    pplblPerFech2: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    pplblMN2: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText19: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppvSaldoMN2: TppVariable;
    ppvSaldoME2: TppVariable;
    ppdbtDMN: TppDBText;
    ppdbtHMN: TppDBText;
    ppdbtHME: TppDBText;
    ppdbtDME: TppDBText;
    ppdbtSAMN3: TppDBText;
    ppdbtSAME3: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText20: TppDBText;
    ppDBText23: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppvTDMN2: TppVariable;
    ppvTHMN2: TppVariable;
    ppvTSFMN: TppVariable;
    ppvTDME2: TppVariable;
    ppvTHME2: TppVariable;
    ppvTSFME: TppVariable;
    ppLabel20: TppLabel;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppvTSAMN3: TppVariable;
    ppvTSAME3: TppVariable;
    ppLabel35: TppLabel;
    ActionList1: TActionList;
    ppSummaryBand2: TppSummaryBand;
    ppLabel19: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppHeaderBand4: TppHeaderBand;
    pplblCiaY: TppLabel;
    pplblTituloY: TppLabel;
    ppLabel41: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppLabel37: TppLabel;
    pplblPerFechY: TppLabel;
    ppLabel53: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    ppLabel45: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    pplblTituloMonY: TppLabel;
    ppLabel54: TppLabel;
    ppLabel57: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel63: TppLabel;
    ppLabel72: TppLabel;
    ppLabel74: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel67: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDetailBand4: TppDetailBand;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText40: TppDBText;
    ppVariable2: TppVariable;
    DBDEBE: TppDBText;
    DBHABER: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppLabel32: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppLabel81: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLabel82: TppLabel;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppVariable7: TppVariable;
    ppVariable8: TppVariable;
    ppVariable10: TppVariable;
    ppVariable14: TppVariable;
    ppLine3: TppLine;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppLabel84: TppLabel;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppLabel85: TppLabel;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppVariable18: TppVariable;
    ppVariable19: TppVariable;
    ppVariable20: TppVariable;
    ppDBText56: TppDBText;
    ppVariable24: TppVariable;
    ppLine4: TppLine;
    DBSaldoAntFin: TppVariable;
    ppLabel48: TppLabel;
    ppDBText39: TppDBText;
    DBSaldoAnt: TppVariable;
    pprMayorAna: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    pplblCia: TppLabel;
    pplblTitulo: TppLabel;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel4: TppLabel;
    pplblPerFech: TppLabel;
    ppLabel6: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel8: TppLabel;
    ppLine5: TppLine;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel62: TppLabel;
    ppLine6: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLabel66: TppLabel;
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
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText21: TppDBText;
    ppVariable11: TppVariable;
    ppLine7: TppLine;
    ppVariable12: TppVariable;
    ppLabel30: TppLabel;
    ppDBText22: TppDBText;
    ppDBText41: TppDBText;
    ppLine8: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLabel70: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel71: TppLabel;
    ppLabel73: TppLabel;
    ppLabel75: TppLabel;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppVariable23: TppVariable;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppVariable16: TppVariable;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBText44: TppDBText;
    ppLabel1: TppLabel;
    ppVariable6: TppVariable;
    ppVariable13: TppVariable;
    ppLabel2: TppLabel;
    ppVariable15: TppVariable;
    ppVariable17: TppVariable;
    ppHeaderBand3: TppHeaderBand;
    ppLabel36: TppLabel;
    pplblTituloX: TppLabel;
    ppLabel38: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    pplblCiaX: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    pplblPerFechX: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    pplblTituloMoneda: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppVariable1: TppVariable;
    ppDEBE: TppDBText;
    ppHABER: TppDBText;
    ppSaldoAnt: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLabel31: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppVariable3: TppVariable;
    ppVariable4: TppVariable;
    ppVariable5: TppVariable;
    ppLabel58: TppLabel;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppVariable9: TppVariable;
    ppLabel59: TppLabel;
    dbgDatosReporte: TwwDBGrid;
    btnExportarExcel: TBitBtn;
{
    procedure ppvSaldoMNCalc(Sender: TObject; var Value: Variant);
    procedure ppvSaldoMECalc(Sender: TObject; var Value: Variant);
    procedure ppvTSMNCalc(Sender: TObject; var Value: Variant);
    procedure ppvTSMNpCCalc(Sender: TObject; var Value: Variant);
    procedure ppvSxMECalc(Sender: TObject; var Value: Variant);
    procedure ppvTSMECalc(Sender: TObject; var Value: Variant);
    procedure ppvTSMEpCCalc(Sender: TObject; var Value: Variant);
    procedure ppVariable6Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable11Calc(Sender: TObject; var Value: Variant);
    procedure ppvTSAMNPrint(Sender: TObject);
    procedure ppvTSAMN2Print(Sender: TObject);    
}
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure ppvSaldoMN2Calc(Sender: TObject; var Value: Variant);
    procedure ppvSaldoME2Calc(Sender: TObject; var Value: Variant);
    procedure CalculaSaldos;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbNivelClick(Sender: TObject);
    procedure cbCompClick(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure ckTDiarioClick(Sender: TObject);
    procedure dbdtpFReg1Exit(Sender: TObject);
    procedure dbdtpFReg2Exit2(Sender: TObject);
    procedure gbPerExit(Sender: TObject);
    procedure Z2bbtnSelAuxiliarClick(Sender: TObject);
    procedure Z2bbtnSelCuentaClick(Sender: TObject);
    procedure rgAuxiliarClick(Sender: TObject);
    procedure rgCuentaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pprMayorAnaPreviewFormCreate(Sender: TObject);
    procedure pprMayorAnaPreviewFormCreate2(Sender: TObject);
    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);
    procedure pprMayorAna1MonPreviewFormCreate(Sender: TObject);
    procedure ppVariable10Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable16Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable20Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable24Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable2Calc(Sender: TObject; var Value: Variant);
    procedure ppLabel37Print(Sender: TObject);
    procedure ppDBCalc1Calc(Sender: TObject);
    procedure ppDBCalc2Calc(Sender: TObject);
    procedure ppDBCalc3Calc(Sender: TObject);
    procedure ppDBCalc4Calc(Sender: TObject);
    procedure ppDBCalc5Calc(Sender: TObject);
    procedure ppDBCalc6Calc(Sender: TObject);
    procedure ppDBCalc7Calc(Sender: TObject);
    procedure ppDBCalc8Calc(Sender: TObject);
    procedure ppDBCalc9Calc(Sender: TObject);
    procedure ppDBCalc10Calc(Sender: TObject);
    procedure ppDBCalc11Calc(Sender: TObject);
    procedure ppDBCalc12Calc(Sender: TObject);
    procedure pprMayorAna1MonStartPage(Sender: TObject);
    procedure ppGroupHeaderBand7BeforePrint(Sender: TObject);
    procedure pprMayorAnaStartPage(Sender: TObject);
    procedure ppGroupFooterBand7BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancClick(Sender: TObject);
    procedure ppDBText31Print(Sender: TObject);
    procedure btnExportarExcelClick(Sender: TObject);
  private
    { Private declarations }
    xNivel : String;
    xCampo : String;
    xSaldoAntMn,xSaldoAntME : double;
    // vhn
    sCiaOrigen : String;
    sCiaCuenta : String;
    //INICIO HPC_201206_CNT
    xbExportarExcel :Boolean;
    procedure fg_ExportarExcel(wgFormato: String);
    //FIN HPC_201206_CNT
  public
    { Public declarations }
  end;


var
  FMayor: TFMayor;

  SFMN, SFME: DOUBLE;       // xx para programacion chcr
  xWhere,xWhere1, UltNivel, xCia, xCta, xClAux, xAux: String;
  xx: SmallInt;
implementation

uses CNTDM, CNT412, CNT411, CNT998;

{$R *.DFM}


procedure TFMayor.dblcCiaExit(Sender: TObject);
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

procedure TFMayor.bbtnOkClick(Sender: TObject);
Var
  xSQL,xSustrae: String;
  wFecha1,wFecha, wAno, wMes, wMesAnt, xGrp: String;
  CampoDMN,CampoHMN,CampoSMN,CampoDME,CampoHME,CampoSME: String;
  xTDMN, xTHMN, xTDME, xTHME: DOUBLE;
  Year, Month, Day: Word;
  xPos,xZ : Integer;
  xMonedaL,xMonedaE : String;
  // Filtra Log
  sCtaLog, sAuxLog : String;
begin
   DMCNT.cdsQry.IndexFieldNames := '';
   DMCNT.cdsQry.Filter := '';
   DMCNT.cdsQry.Filtered := True;
   xMonedaL := DMCNT.DisplayDescrip('prvTGE','TGE103','TMONABR','TMON_LOC='+quotedstr('L'),'TMONABR');
   xMonedaE := DMCNT.DisplayDescrip('prvTGE','TGE103','TMONABR','TMON_LOC='+quotedstr('E'),'TMONABR');

   With DMCNT do
   Begin
      if (cbNivel.Checked) and (dblcNivel.Text='') then begin
         ShowMessage('Seleccione un Nivel de Detalle de Cuenta');
         raise exception.Create('Seleccione un Nivel de Detalle de Cuenta');
      end;

      if (ckTDiario.Checked) and (edtTDiario.Text='') then begin
         ShowMessage('Seleccione un Tipo de Diario');
         raise exception.Create('Seleccione un Tipo de Diario');
      end;

      // vhn
      SFMN:=0; SFME:=0; xx:=0;
      // end

      //** 04/05/2001 - pjsv, para saber si es de ultimo nivel, para sumar solo
      // las ctas. de mov. sino suma todas las del nivel + las de mov. que hubieran
      xnivel :='';
      xsql :='';
      xnivel := '0'; // por defecto
      if (dblcNivel.Text <> '') then
      begin
         xsql := 'NIVEL='+quotedstr('0'+IntToStr(StrToInt(dblcNivel.text)+1));
         If DMCNT.DisplayDescrip('PrvTGE','CNT202','*',xsql,'NIVEL') = '' then
            xnivel := '0'
         else xnivel := '1';
      end;

      xWhere:='';
      xWhere1 :='';

      // Filtra Log
      sCtaLog:=''; sAuxLog:='';

      if (edtTDiario.Text<>'') then begin
         xWhere :='(TDIARID='+''''+dblcTDiario.Text+''''+')';
         xWhere1:='(TDIARID='+''''+dblcTDiario.Text+''''+')';
      end;

      if (rgCuenta.ItemIndex=1) and (FSelCuenta.cdsClone.recordcount>0) then
      begin
         if length(xWhere)>0 then
         begin
            xWhere :=xWhere+' and ';
            xWhere1:=xWhere+' and ';
         end;
         xWhere := xWhere+'CNT401.CUENTAID IN (' ;
         xWhere1 := xWhere1+'cnt301.CUENTAID IN (' ;
         sCtaLog:='CUENTAID IN (' ;
         with FSelCuenta.cdsClone do
         begin
            First ;
            while not Eof do
            begin
               xWhere := xWhere + '''' + fieldbyname('CUENTAID').AsString + '''';
               xWhere1 := xWhere1 + '''' + fieldbyname('CUENTAID').AsString + '''';
               sCtaLog:=sCtaLog+ fieldbyname('CUENTAID').AsString;
               Next ;
               if not eof then
               begin
                  xWhere := xWhere  + ' , ' ;
                  xWhere1:= xWhere1 + ' , ' ;
                  sCtaLog:= sCtaLog + ', ' ;
               end;
            end;
         end ;
         xwhere := xwhere  + ')';
         xwhere1:= xwhere1 + ')';
         sCtaLog:= sCtaLog +' )';
      end;

      if (rgAuxiliar.ItemIndex=1) and (FSelAux.cdsClone.recordcount>0) then
      begin
         if length(xWhere)>0 then
         begin
            xWhere:=xWhere+' and ';
            xWhere1:=xWhere1+' and ';
         end;
         xWhere := xWhere + '(' ;
         xWhere1:= xWhere1 + '(' ;
         sAuxLog:= '( ' ;
         with FSelAux.cdsClone do
         begin
            First ;
            while not Eof do
            begin
               xWhere :=xWhere +'(CNT401.CLAUXID='''+fieldbyname('CLAUXID').AsString+''' AND '
                               +' CNT401.AUXID='''  +fieldbyname('AUXID').AsString  +''' ) ';
               xWhere1:=xWhere1+'(CLAUXID='''+fieldbyname('CLAUXID').AsString+''' AND '
                               +' AUXID='''  +fieldbyname('AUXID').AsString  +''' ) ';
               sAuxLog:=sAuxLog+'(CLAUXID='+fieldbyname('CLAUXID').AsString+' AND AUXID='+fieldbyname('AUXID').AsString+')';
               Next ;
               if not eof then
               begin
                  xWhere :=xWhere + ' OR ';
                  xWhere1:=xWhere1+ ' OR ';
                  sAuxLog:=sAuxLog+ ' OR ';
               end;
            end;
         end ;
         xwhere :=xwhere + ')';
         xwhere1:=xwhere1+ ')';
         sAuxLog:=sAuxLog+' )';
      end;

      if length(xWhere)>0 then
      begin
         xWhere :=' and '+xWhere;
         xWhere1:=' and '+xWhere1;
      end;

      DecodeDate(dbdtpFReg1.Date, Year, Month, Day);
      wMes := inttostr(Month);
      wMesAnt := inttostr(Month - 1);
      If Month - 1 <= 9 then
         wMesAnt := '0' + inttostr(Month - 1);

      if length(wMes)<2 then wMes := '0'+inttostr(Month);
      wAno:= IntToStr(Year);

      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
         wFecha:='DATE('+''''+wAno+'-'+wMes+'-01'+''''+')';   // Fecha inicio pa movs faltantes
      end
      else
         if SRV_D = 'ORACLE' then
         begin
            wFecha:='TO_DATE('+quotedstr('01'+'-'+wMes+'-'+wAno)+')';   // Fecha inicio pa movs faltantes
         end;

       //** 17/04/2001 - pjsv para comparar y no tocar el wfecha que lo utilizan
                       // en el SQL
      wFecha1:='01/'+wMes+'/'+wano;
      //**

      // Campos en 401
      //** 17/04/2001 - pjsv
      CampoSMN := 'SALDMN'+wMesAnt; //wMes;
      CampoSME := 'SALDME'+wMesAnt; //wMes;
      //**
      CampoDMN := 'DEBEMN'+wMes;
      CampoHMN := 'HABEMN'+wMes;
      CampoDME := 'DEBEME'+wMes;
      CampoHME := 'HABEME'+wMes;

      if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
        xSQL:='Select RTRIM(LTRIM(CNT401.CIAID)) CIAID, RTRIM(LTRIM(CNT401.CUENTAID)) CUENTAID, '+wReplacCeros+'(RTRIM(LTRIM(CNT401.CLAUXID)),''-'') CLAUXID, '+wReplacCeros
              +'(RTRIM(LTRIM(CNT401.AUXID)),''-'') AUXID, CNT401.CTADES,  SUBSTR(CNT201.AUXNOMB,1,33) AUXDES,  '
              +'Sum('+wReplacCeros+'('+CampoSMN+',0)) as SALDMN, '
              +'Sum('+wReplacCeros+'('+CampoDMN+',0)) as DEBEMN, '+'Sum('+wReplacCeros+'('+CampoHMN+',0)) as HABEMN, '
              +'Sum('+wReplacCeros+'('+CampoSME+',0)) as SALDME, '
              +'Sum('+wReplacCeros+'('+CampoDME+',0)) as DEBEME, '+'Sum('+wReplacCeros+'('+CampoHME+',0)) as HABEME, '
              + ' TGE202.CTA_MOV,CNT401.TIPO '
              +' From CNT401 '
              +' LEFT JOIN CNT201 ON (CNT401.AUXID=CNT201.AUXID AND CNT401.CLAUXID=CNT201.CLAUXID ) '
              +' LEFT JOIN TGE202 ON (CNT401.CUENTAID = TGE202.CUENTAID AND CNT401.CIAID = TGE202.CIAID) Where '
              +'CNT401.CIAID='+''''+dblcCia.Text+''''
              +' and CNT401.ANO='+''''+wAno+'''';
         xPos := pos('CUENTAID',xWhere);
         If xWhere <> '' then
            xsustrae:=copy(xWhere,1,xPos-1)+''+copy(xWhere,xpos,length(xWhere));
         xSql := xSql + xSustrae;

         if (dblcNivel.Text <> '') then
            xSQL:=xSQL+' and CNT401.TIPO='+''''+dblcNivel.Text+''''
         else begin
            xSQL:=xSQL+' and TGE202.CTA_MOV='+''''+'S'+'''';
         end;

         xGrp:=' Group by CNT401.CIAID, CNT401.CUENTAID, CNT401.AUXID, CNT401.CLAUXID, CNT401.CTADES,  CNT201.AUXNOMB,TGE202.CTA_MOV,CNT401.TIPO';
         xSQL:=xSQL+xGrp
              +' Having Sum('+wReplacCeros+'('+CampoSMN+',0))<>0 or Sum('+wReplacCeros+'('+CampoDMN+',0))<>0'
              +' or Sum('+wReplacCeros+'('+CampoHMN+',0)) <> 0'  // Descarta los q no tienen Movms.
              +' Order By CIAID,CUENTAID,CLAUXID,AUXID';

      end
      else
      if SRV_D = 'ORACLE' then
      begin

          xSQL:='Select TRIM(CNT401.CIAID) CIAID, TRIM(CNT401.CUENTAID) CUENTAID, '+wReplacCeros+'(TRIM(CNT401.CLAUXID),''-'') CLAUXID, '+wReplacCeros+'(TRIM(CNT401.AUXID),''-'') AUXID, CNT401.CTADES, SUBSTR(CNT201.AUXNOMB,1,33) AUXDES, '
          +'Sum('+wReplacCeros+'('+CampoSMN+',0)) as SALDMN, '
          +'Sum('+wReplacCeros+'('+CampoDMN+',0)) as DEBEMN, '+'Sum('+wReplacCeros+'('+CampoHMN+',0)) as HABEMN, '
          +'Sum('+wReplacCeros+'('+CampoSME+',0)) as SALDME, '
          +'Sum('+wReplacCeros+'('+CampoDME+',0)) as DEBEME, '+'Sum('+wReplacCeros+'('+CampoHME+',0)) as HABEME, '
          + ' TGE202.CTA_MOV,CNT401.TIPO '
          +' From CNT401,TGE202,CNT201  '
          +' Where '
          +'CNT401.CIAID='+''''+dblcCia.Text+''''
          +' and CNT401.ANO='+''''+wAno+''''
          +' AND CNT401.AUXID=CNT201.AUXID(+) AND CNT401.CLAUXID=CNT201.CLAUXID(+) '
          +' AND (CNT401.CUENTAID = TGE202.CUENTAID(+) AND CNT401.CIAID = TGE202.CIAID(+)) '+xWhere;

         if (dblcNivel.Text <> '') then
            xSQL:=xSQL+' and CNT401.TIPO='+''''+dblcNivel.Text+''''
         else begin
            xSQL:=xSQL+' and TGE202.CTA_MOV='+''''+'S'+'''';
         end;

         if sCiaCuenta<>'' then
         begin
            xSQL:=xSQL+' and CNT401.'+ sCiaCuenta;
         end;


         xGrp:=' Group by CNT401.CIAID, CNT401.CUENTAID, CNT401.AUXID, CNT401.CLAUXID, CNT401.CTADES, CNT201.AUXNOMB,TGE202.CTA_MOV,CNT401.TIPO';
         xSQL:=xSQL+xGrp
              +' Having Sum('+wReplacCeros+'('+CampoSMN+',0))<>0 or Sum('+wReplacCeros+'('+CampoDMN+',0))<>0'
              +' or Sum('+wReplacCeros+'('+CampoHMN+',0)) <> 0'  // Descarta los q no tienen Movms.
              +' Order By CIAID,CUENTAID,CLAUXID,AUXID';

      end;

      Screen.Cursor:=CrHourGlass;
      cdsQry.Close;
      cdsQry.ProviderName:='prvCNT';
      cdsQry.DataRequest(xSQL);
      cdsQry.Open;
      cdsQry.IndexFieldNames:='CuentaId;ClAuxId;AuxId';
      cdsQry.ReadOnly:=False;
      cdsQry.First;
      if wFecha1<>datetostr(dbdtpFReg1.Date) then
      begin  // Si fech_ini no es calendario
         // Selecciona datos de 301 k faltan en el periodo
         if (SRV_D = 'DB2NT') or  (SRV_D = 'DB2400') then
         begin
            xSQL:='Select '
               +' RTRIM(LTRIM(cnt301.CIAID)) CIAID,RTRIM(LTRIM(cnt301.TDIARID)) TDIARID,cnt301.CNTCOMPROB,cnt301.CNTANO,cnt301.CNTANOMM,'
               +' cnt301.CNTLOTE,RTRIM(LTRIM(CNT301.CUENTAID)) CUENTAID,'+wReplacCeros+'(RTRIM(LTRIM(cnt301.CLAUXID)),''-'') CLAUXID,'
               +' '+wReplacCeros+'(TRIM(cnt301.AUXID),''-'') AUXID, cnt301.DOCID,cnt301.CNTSERIE,cnt301.CNTNODOC,cnt301.CNTGLOSA,cnt301.CNTDH,'
               +' cnt301.CCOSID,cnt301.CNTTCAMBIO,cnt301.CNTMTOORI,cnt301.CNTMTOLOC,cnt301.CNTMTOEXT,cnt301.CNTFEMIS,cnt301.CNTFVCMTO,'
               +' cnt301.CNTFCOMP,'
               +' cnt301.CNTESTADO,cnt301.CNTCUADRE,cnt301.CNTFAUTOM,cnt301.CNTMM,cnt301.CNTDD,cnt301.CNTTRI,cnt301.CNTSEM,cnt301.CNTSS,cnt301.CNTAATRI,'
               +' cnt301.CNTAASEM,cnt301.CNTAASS,cnt301.TMONID,cnt301.FLAGVAR,cnt301.FCONS,cnt301.CNTFMEC,cnt301.TDIARDES,cnt301.CTADES,'
               +' cnt301.AUXDES,cnt301.DOCDES,'
               +' cnt301.CCOSDES,cnt301.CNTDEBEMN,cnt301.CNTDEBEME,cnt301.CNTHABEMN,cnt301.CNTHABEME,cnt301.CNTSALDMN,cnt301.CNTSALDME,'
               +' cnt301.CAMPOVAR,cnt301.CNTTS,'
               +' cnt301.CNTPAGADO,cnt301.CNTMODDOC,cnt301.CNTREG,cnt301.CNTUSER,cnt301.CNTFREG,cnt301.CNTHREG'
               +' from CNT301 ';
            if rgMoneda.ItemIndex = 0 then
              xSQL:= xSql +  ' where CNT301.CIAID='+quotedstr(dblcCia.Text)
               +' and CNT301.CNTFCOMP>='+wFecha
               +' and CNT301.CNTFCOMP<=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')'
               +' and CNT301.CNTCUADRE='+''''+'S'+''''+xWhere
               //+' Order By CNT301.CIAID,CNT301.CUENTAID,CNT301.CLAUXID,CNT301.AUXID,CNT301.TDIARID'
            else
              xSQL:= xSql +  ' LEFT JOIN TGE202 ON (CNT301.CUENTAID=TGE202.CUENTAID AND TGE202.CTA_ME=''S'')'
               +' where CNT301.CIAID='+''''+dblcCia.Text+''''
               +' and CNT301.CNTFCOMP>='+wFecha
               +' and CNT301.CNTFCOMP<=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')'
               +' and CNT301.CNTCUADRE='+''''+'S'+''''+xWhere;

            if sCiaCuenta<>'' then
            begin
               xSQL:=xSQL+' and CNT301.'+ sCiaCuenta+' ';
            end;

            xSQL:=xSQL+' Order By CNT301.CIAID,CNT301.CUENTAID,CNT301.CLAUXID,CNT301.AUXID,CNT301.TDIARID'
         end
         else
            if SRV_D = 'ORACLE' then
            begin
               xSQL:='Select '
               +' TRIM(cnt301.CIAID) CIAID,TRIM(cnt301.TDIARID) TDIARID,cnt301.CNTCOMPROB,cnt301.CNTANO,cnt301.CNTANOMM,cnt301.CNTLOTE,'
               +' TRIM(CNT301.CUENTAID) CUENTAID,'+wReplacCeros+'(TRIM(cnt301.CLAUXID),''-'') CLAUXID,'
               +' '+wReplacCeros+'(TRIM(cnt301.AUXID),''-'') AUXID, cnt301.DOCID,cnt301.CNTSERIE,cnt301.CNTNODOC,cnt301.CNTGLOSA,cnt301.CNTDH,'
               +' cnt301.CCOSID,cnt301.CNTTCAMBIO,cnt301.CNTMTOORI,cnt301.CNTMTOLOC,cnt301.CNTMTOEXT,cnt301.CNTFEMIS,cnt301.CNTFVCMTO,cnt301.CNTFCOMP,'
               +' cnt301.CNTESTADO,cnt301.CNTCUADRE,cnt301.CNTFAUTOM,cnt301.CNTMM,cnt301.CNTDD,cnt301.CNTTRI,cnt301.CNTSEM,cnt301.CNTSS,cnt301.CNTAATRI,'
               +' cnt301.CNTAASEM,cnt301.CNTAASS,cnt301.TMONID,cnt301.FLAGVAR,cnt301.FCONS,cnt301.CNTFMEC,cnt301.TDIARDES,cnt301.CTADES,'
               +' cnt301.AUXDES,cnt301.DOCDES,'
               +' cnt301.CCOSDES,cnt301.CNTDEBEMN,cnt301.CNTDEBEME,cnt301.CNTHABEMN,cnt301.CNTHABEME,cnt301.CNTSALDMN,cnt301.CNTSALDME,'
               + 'cnt301.CAMPOVAR,cnt301.CNTTS,'
               +' cnt301.CNTPAGADO,cnt301.CNTMODDOC,cnt301.CNTREG,cnt301.CNTUSER,cnt301.CNTFREG,cnt301.CNTHREG'
               +',cnt301.cntcomprob'
               +' from CNT301 ';
               if rgMoneda.ItemIndex = 0 then
                  xSql:=xSql + ' WHERE CNT301.CIAID='+''''+dblcCia.Text+''''
                    +' and CNT301.CNTFCOMP>='+wFecha
                    +' and CNT301.CNTFCOMP<=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')'
                    +' and CNT301.CNTCUADRE='+''''+'S'+''''+xWhere
                  //  +' Order By CNT301.CIAID,CNT301.CUENTAID,CNT301.CLAUXID,CNT301.AUXID,CNT301.TDIARID'
               else
                  xSql:=xSql + ' ,TGE202 WHERE CNT301.CIAID='+''''+dblcCia.Text+''''
                    +' and CNT301.CNTFCOMP>='+wFecha
                    +' and CNT301.CNTFCOMP<=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')'
                    +' and CNT301.CNTCUADRE='+''''+'S'+''''+xWhere
                    +' and CNT301.CUENTAID = TGE202.CUENTAID(+) and TGE202.CTA_ME(+)=''S''';

               if sCiaCuenta<>'' then
               begin
                  xSQL:=xSQL+' and CNT301.' + sCiaCuenta+' ';
               end;
               if sCiaOrigen<>'' then
               begin
                  xSQL:=xSQL+' and CNT301.' + sCiaOrigen+' ';
               end;

               xSQL:=xSQL+' Order By CNT301.CIAID,CNT301.CUENTAID,CNT301.CLAUXID,CNT301.AUXID,CNT301.TDIARID,cnt301.cntcomprob';
            end;

         cdsMovCNT2.Close;
         cdsMovCNT2.DataRequest(xSQL);
         cdsMovCNT2.Open;
         cdsMovCNT2.IndexFieldNames:='CiaId;CuentaId;ClAuxId;AuxId;cntcomprob';
         cdsMovCNT2.First;
         While not(cdsMovCNT2.Eof) do
         begin
           xCia  :=cdsMovCNT2.FieldByName('CIAID').AsString;
           xCta  :=cdsMovCNT2.FieldByName('CUENTAID').AsString;
           xClAux:=cdsMovCNT2.FieldByName('CLAUXID').AsString;
           xAux  :=cdsMovCNT2.FieldByName('AUXID').AsString;
           xTDMN:=0;   XTHMN:=0;   xTDME:=0;   XTHME:=0;
           While (not cdsMovCNT2.Eof)
   //            and (xCia=cdsMovCNT2CiaID.Value)
                 and (xCta=cdsMovCNT2.FieldByName('CUENTAID').AsString)
                 and (xClAux=cdsMovCNT2.FieldByName('CLAUXID').AsString)
                 and (xAux=cdsMovCNT2.FieldByName('AUXID').AsString) do
           Begin
               xTDMN := xTDMN + DMCNT.cdsMovCNT2.FieldByName('CNTDEBEMN').AsFloat;
               xTHMN := xTHMN + DMCNT.cdsMovCNT2.FieldByName('CNTHABEMN').AsFloat;
               xTDME := xTDME + DMCNT.cdsMovCNT2.FieldByName('CNTDEBEME').AsFloat;
               xTHME := xTHME + DMCNT.cdsMovCNT2.FieldByName('CNTHABEME').AsFloat;
               cdsMovCNT2.Next;
           End;
           cdsQry.SetKey;
           CDSQRY.FIELDBYNAME('CUENTAID').VALUE:=XCTA;
           CDSQRY.FIELDBYNAME('CLAUXID').VALUE :=XCLAUX;
           CDSQRY.FIELDBYNAME('AUXID').VALUE   :=XAUX;
           if cdsQry.GotoKey then
           begin
              cdsQry.Edit;  // Actualiza Saldo Inicial
              CDSQRY.FIELDBYNAME('SALDMN').AsString  := FloatToStrF(CDSQRY.FIELDBYNAME('SALDMN').ASFLOAT+(XTDMN-XTHMN),ffFixed,15,2);
              CDSQRY.FIELDBYNAME('SALDME'). AsString := FloatToStrF(CDSQRY.FIELDBYNAME('SALDME').ASFLOAT+(XTDME-XTHME),ffFixed,15,2);
           end
           else
           begin  // No encontro el mov de 301 en 401===> lo inserta
              cdsQry.Insert;
              cdsQry.FieldByName('CIAID').AsString   :=XCIA;
              cdsQry.FieldByName('CUENTAID').AsString:=XCTA;
              cdsQry.FieldByName('CLAUXID').AsString :=XCLAUX;
              cdsQry.FieldByName('AUXID').AsString   :=XAUX;
              cdsQry.FieldByName('CTADES').AsString  :=cdsMovcnt2.FieldByName('CTADES').AsString;
              cdsQry.FieldByName('AUXDES').AsString  :=cdsMovcnt2.FieldByName('AUXDES').AsString;
              cdsQry.FieldByName('SALDMN').AsString  := FloatToStrF((XTDMN-XTHMN),ffFixed,15,2);
              cdsQry.FieldByName('SALDME').AsString  := FloatToStrF((XTDME-XTHME),ffFixed,15,2);
           end;
          end;
       end;   // Fin: Si fech_ini no es calendario (P.ej: 01/03/1997  si es)

      // Selecciona datos de 301 k sobran en el periodo
        if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
        begin
          xSQL:='Select '
               +' RTRIM(LTRIM(cnt301.CIAID)) CIAID,RTRIM(LTRIM(cnt301.TDIARID)) TDIARID,cnt301.CNTCOMPROB,cnt301.CNTANO,cnt301.CNTANOMM,'
               +' cnt301.CNTLOTE,RTRIM(LTRIM(CNT301.CUENTAID)) CUENTAID,'+wReplacCeros+'(RTRIM(LTRIM(cnt301.CLAUXID)),''-'') CLAUXID,'
               +' '+wReplacCeros+'(RTRIM(LTRIM(cnt301.AUXID)),''-'') AUXID, cnt301.DOCID,cnt301.CNTSERIE,cnt301.CNTNODOC,cnt301.CNTGLOSA,cnt301.CNTDH,'
               +' cnt301.CCOSID,cnt301.CNTTCAMBIO,cnt301.CNTMTOORI,cnt301.CNTMTOLOC,cnt301.CNTMTOEXT,cnt301.CNTFEMIS,cnt301.CNTFVCMTO,cnt301.CNTFCOMP,'
               +' cnt301.CNTESTADO,cnt301.CNTCUADRE,cnt301.CNTFAUTOM,cnt301.CNTMM,cnt301.CNTDD,cnt301.CNTTRI,cnt301.CNTSEM,cnt301.CNTSS,cnt301.CNTAATRI,'
               +' cnt301.CNTAASEM,cnt301.CNTAASS,cnt301.TMONID,cnt301.FLAGVAR,cnt301.FCONS,cnt301.CNTFMEC,cnt301.TDIARDES,cnt301.CTADES,'
               +' cnt301.AUXDES,cnt301.DOCDES,'
               +' cnt301.CCOSDES,cnt301.CNTDEBEMN,cnt301.CNTDEBEME,cnt301.CNTHABEMN,cnt301.CNTHABEME,cnt301.CNTSALDMN,cnt301.CNTSALDME,'
               +' cnt301.CAMPOVAR,cnt301.CNTTS,'
               +' cnt301.CNTPAGADO,cnt301.CNTMODDOC,cnt301.CNTREG,cnt301.CNTUSER,cnt301.CNTFREG,cnt301.CNTHREG'
               +' from CNT301 ';
          iF rgMoneda.ItemIndex = 0 then
            xSQL:= xSql + ' WHERE CNT301.CIAID='+''''+dblcCia.Text+''''
               +' and CNTFCOMP>=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+')'
               +' and CNTFCOMP<=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')'
               +' and CNTCUADRE='+''''+'S'+''''+xWhere1
               +' Order By CIAID,CUENTAID,CLAUXID,AUXID,TDIARID'
          ELSE
            xSQL:=xSql +  ' LEFT JOIN TGE202 ON (CNT301.CUENTAID=TGE202.CUENTAID AND TGE202.CTA_ME=''S'')'
               +' WHERE CNT301.CIAID='+''''+dblcCia.Text+''''
               +' and CNTFCOMP>=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+')'
               +' and CNTFCOMP<=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')'
               +' and CNTCUADRE='+''''+'S'+''''+xWhere1
               +' Order By CIAID,CUENTAID,CLAUXID,AUXID,TDIARID';

        end
        else
         if SRV_D = 'ORACLE' then
          begin
          xSQL:='Select '
               +' TRIM(cnt301.CIAID) CIAID,TRIM(cnt301.TDIARID) TDIARID,cnt301.CNTCOMPROB,cnt301.CNTANO,cnt301.CNTANOMM,cnt301.CNTLOTE,'
               +' TRIM(CNT301.CUENTAID) CUENTAID,'+wReplacCeros+'(TRIM(cnt301.CLAUXID),''-'') CLAUXID,'
               +' '+wReplacCeros+'(TRIM(cnt301.AUXID),''-'') AUXID, cnt301.DOCID,cnt301.CNTSERIE,cnt301.CNTNODOC,cnt301.CNTGLOSA,cnt301.CNTDH,'
               +' cnt301.CCOSID,cnt301.CNTTCAMBIO,cnt301.CNTMTOORI,cnt301.CNTMTOLOC,cnt301.CNTMTOEXT,cnt301.CNTFEMIS,cnt301.CNTFVCMTO,cnt301.CNTFCOMP,'
               +' cnt301.CNTESTADO,cnt301.CNTCUADRE,cnt301.CNTFAUTOM,cnt301.CNTMM,cnt301.CNTDD,cnt301.CNTTRI,cnt301.CNTSEM,cnt301.CNTSS,cnt301.CNTAATRI,'
               +' cnt301.CNTAASEM,cnt301.CNTAASS,cnt301.TMONID,cnt301.FLAGVAR,cnt301.FCONS,cnt301.CNTFMEC,cnt301.TDIARDES,cnt301.CTADES,cnt301.AUXDES,cnt301.DOCDES,'
               +' cnt301.CCOSDES,cnt301.CNTDEBEMN,cnt301.CNTDEBEME,cnt301.CNTHABEMN,cnt301.CNTHABEME,cnt301.CNTSALDMN,cnt301.CNTSALDME,cnt301.CAMPOVAR,cnt301.CNTTS,'
               +' cnt301.CNTPAGADO,cnt301.CNTMODDOC,cnt301.CNTREG,cnt301.CNTUSER,cnt301.CNTFREG,cnt301.CNTHREG'
               +' ,cnt301.cntcomprob'
               +' from CNT301';
           iF rgMoneda.ItemIndex = 0 then
            xSQL:= xSql + ' WHERE CNT301.CIAID='+quotedstr(dblcCia.Text)
               +' and CNT301.CNTFCOMP>=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+')'
               +' and CNT301.CNTFCOMP<=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')'
               +' and CNT301.CNTCUADRE='+''''+'S'+''''+xWhere1
               //+' Order By CNT301.CIAID,CNT301.CUENTAID,CNT301.CLAUXID,CNT301.AUXID,CNT301.TDIARID'
           ELSE
            xSQL:= xSql +  ',TGE202 WHERE CNT301.CIAID='+quotedstr(dblcCia.Text)
               +' and CNT301.CNTFCOMP>=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+')'
               +' and CNT301.CNTFCOMP<=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')'
               +' and CNT301.CNTCUADRE='+''''+'S'+''''+xWhere1
               +' and CNT301.CUENTAID = TGE202.CUENTAID(+) and TGE202.CTA_ME(+)=''S'''
               +' AND TGE202.CIAID='+quotedstr(dblcCia.Text);

           if sCiaCuenta<>'' then
           begin
              xSQL:=xSQL+' and CNT301.'+ sCiaCuenta+' ';
           end;
           if sCiaOrigen<>'' then
           begin
              xSQL:=xSQL+' and CNT301.' + sCiaOrigen+' ';
           end;

           xSQL:=xSQL+' Order By CNT301.CIAID,CNT301.CUENTAID,CNT301.CLAUXID,CNT301.AUXID,CNT301.TDIARID,cnt301.cntcomprob';

          end;

      cdsMovCNT2.Close;
      cdsMovCNT2.DataRequest(xSQL);
      cdsMovCNT2.Open;
      cdsMovCNT2.IndexFieldNames:='CiaId;CuentaId;ClAuxId;AuxId;cntcomprob';
      if not(cbComp.Checked) then
       begin  // Mayor Auxiliar x Rango d Fechas: Paso 2
         cdsQry.ReadOnly:=False;
         cdsQry.First;
         while not DMCNT.cdsQry.EOF do
          begin
           cdsQry.Edit;
           cdsQry.FieldByName('DEBEMN').AsFloat := 0;
           cdsQry.FieldByName('HABEMN').AsFloat := 0;
           cdsQry.FieldByName('DEBEME').AsFloat := 0;
           cdsQry.FieldByName('HABEME').AsFloat := 0;
           cdsQry.Next;
          end;
         cdsMovCNT2.First;
         While not(cdsMovCNT2.Eof) do
          begin
            xCia  :=cdsMovCNT2.FieldByName('CIAID').AsString;
            xCta  :=cdsMovCNT2.FieldByName('CUENTAID').AsString;
            xClAux:=cdsMovCNT2.FieldByName('CLAUXID').AsString;
            xAux  :=cdsMovCNT2.FieldByName('AUXID').AsString;
            xTDMN:=0;   xTHMN:=0;   xTDME:=0;   xTHME:=0;
            While (not cdsMovCNT2.Eof)
                     and (xCia=cdsMovCNT2.FieldByName('CIAID').AsString)
                     and (xCta=cdsMovCNT2.FieldByName('CUENTAID').AsString)
                     and (xClAux=cdsMovCNT2.FieldByName('CLAUXID').AsString)
                     and (xAux=cdsMovCNT2.FieldByName('AUXID').AsString) do
             Begin
               xTDMN := xTDMN + DMCNT.cdsMovCNT2.FieldByName('CNTDEBEMN').AsFloat;
               xTHMN := xTHMN + DMCNT.cdsMovCNT2.FieldByName('CNTHABEMN').AsFloat;
               xTDME := xTDME + DMCNT.cdsMovCNT2.FieldByName('CNTDEBEME').AsFloat;
               xTHME := xTHME + DMCNT.cdsMovCNT2.FieldByName('CNTHABEME').AsFloat;
               cdsMovCNT2.Next;
             End;
            cdsQry.SetKey;
            cdsQry.FieldByName('CUENTAID').AsString:=XCTA;
            cdsQry.FieldByName('CLAUXID').AsString :=XCLAUX;
            cdsQry.FieldByName('AUXID').AsString   :=XAUX;
            if cdsQry.GotoKey then
             begin
               cdsQry.Edit;  // Actualiza D - H
               cdsQry.FieldByName('DEBEMN').AsString:= FloatToStrF(cdsQry.FieldByName('DEBEMN').AsFloat+XTDMN,ffFixed,15,2);
               cdsQry.FieldByName('HABEMN').AsString:= FloatToStrF(cdsQry.FieldByName('HABEMN').AsFloat+XTHMN,ffFixed,15,2);
               cdsQry.FieldByName('DEBEME').AsString:= FloatToStrF(cdsQry.FieldByName('DEBEME').AsFloat+XTDME,ffFixed,15,2);
               cdsQry.FieldByName('HABEME').AsString:= FloatToStrF(cdsQry.FieldByName('HABEME').AsFloat+XTHME,ffFixed,15,2);
             end
            else
             begin  // No encontro el mov de 301 en 401===> lo inserta
               cdsQry.Insert;
               cdsQry.FieldByName('CIAID').AsString   :=XCIA;
               cdsQry.FieldByName('CUENTAID').AsString:=XCTA;
               cdsQry.FieldByName('CLAUXID').AsString :=XCLAUX;
               cdsQry.FieldByName('AUXID').AsString   :=XAUX;
               cdsQry.FieldByName('CTADES').AsString  :=cdsMovcnt2.FieldByName('CTADES').AsString;
               cdsQry.FieldByName('AUXDES').AsString  :=cdsMovcnt2.FieldByName('AUXDES').AsString;
               cdsQry.FieldByName('DEBEMN').AsString := FloatToStrF(XTDMN,ffFixed,15,2);
               cdsQry.FieldByName('HABEMN').AsString  :=FloatToStrF(XTHMN,ffFixed,15,2);
               cdsQry.FieldByName('DEBEME').AsString  :=FloatToStrF(XTDME,ffFixed,15,2);
               cdsQry.FieldByName('HABEME').AsString  :=FloatToStrF(XTHME,ffFixed,15,2);
               cdsQry.FieldByName('SALDMN').AsString  := '0.00';
               cdsQry.FieldByName('SALDME').AsString  := '0.00';
             end;
          end;
       end
      else
       begin   // Mayor ANALITICO por Rango de Fechas: Paso 2
         CalculaSaldos;
         cdsMovCNT2.First;
       end;  // Fin Mayor ANALITICO por Rango de Fechas: Paso 2

      pplblCia.Caption  := edtCia.Text ;
      pplblcia2.Caption := edtcia.Text ;
      pplblCiaX.Caption := edtCia.Text ;
      pplblCiaY.Caption := edtcia.Text ;

   /// Asigna  Titulo
      pplblTitulo.Caption:=edtTit.Text;
      pplblTitulo2.Caption:=edtTit.Text;
      pplblTituloX.Caption:=edtTit.Text;
      pplblTituloY.Caption:=edtTit.Text;

      pplblPerFech.Caption :='          Periodo: '+speAno.Text+wMes;
      pplblPerFech2.Caption:='          Periodo: '+speAno.Text+wMes;
      pplblPerFechX.Caption:='          Periodo: '+speAno.Text+wMes;
      pplblPerFechy.Caption:='          Periodo: '+speAno.Text+wMes;

      if cbComp.Checked then
         if DMCNT.cdsMovCNT2.RecordCount=0 then
         begin
            ShowMessage('No hay datos que mostrar');
            Screen.Cursor:=CrDefault;
            exit;
         end
      else begin
         if DMCNT.cdsQry.RecordCount=0 then
         begin
            ShowMessage('No hay datos que mostrar');
            Screen.Cursor:=CrDefault;
            exit;
         end;
      end;

      //  VHN 12/12/2001 - Para imprimir en Texto
      FImpresion := TFImpresion.Create( Self );
      FImpresion.ShowModal;
      if FImpresion.wFlTexto='C' then begin
         DMCNT.cdsQry.CancelUpdates;
         DMCNT.cdsQry.IndexFieldNames:='';
         DMCNT.cdsQry.Filter:='';
         DMCNT.cdsQry.Filtered:=True;
         Screen.Cursor:=CrDefault;
         Exit;
      end;

      case rgMoneda.ItemIndex of
      -1: begin
             ShowMessage('Ingrese Tipo de Moneda a Listar');
             Screen.Cursor:=CrDefault;
             rgMoneda.SetFocus;
          end;
      0 : begin // local  0
            if cbComp.Checked then
            begin
               //INICIO HPC_201206_CNT
               If xbExportarExcel = True Then
               Begin
                  fg_ExportarExcel( 'FORMATO2');
                  Exit;
               End;
               //FIN HPC_201206_CNT

               if FImpresion.wFlTexto='G' then
                  pprMayorAna1Mon.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\MayorAnaUni.rtm';
               if FImpresion.wFlTexto='T' then
                  pprMayorAna1Mon.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\MayorAnaUniTX.rtm';

               pprMayorAna1Mon.template.LoadFromFile;
               pplblTituloMonY.Caption   := 'MONEDA LOCAL' ;
               xCampo      := 'CNTSALDMN' ;
               //DBSaldoAnt.DataField      := 'CNTSALDMN' ;
               ppLabel64.caption := 'Debe ' + xMonedaL;
               ppLabel65.caption := 'Haber ' + xMonedaL;
               DBDEBE.DataField          := 'CNTDEBEMN' ;
               DBhaber.DataField         := 'CNTHABEMN' ;
               //DBSaldoAntFin.DataField   := 'CNTSALDMN' ;
               pplblPerFechY.caption := 'DEL ' + DateToStr(dbdtpFReg1.Date) + ' AL '+DateToStr(dbdtpFReg2.Date);
               pplblCiaY.Caption := edtCia.text;

               DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Mayor Analitico',
                     dblcCia.Text,                                  // Campañía
                     speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
                     dbdtpFReg1.Text, dbdtpFReg2.Text,              // Fecha   Inicio - final
                     dblcNivel.text,  dblcTDiario.Text,                         // Nivel   - Origen
                     '', inttostr(rgMoneda.itemindex),              // Lote    -  Moneda
                     sCtaLog, sAuxLog,                              // Cuentas - Auxiliares
                     '', 'Impresora',                                   // Costos - Tipo Salida
                     '1' );               // Tipo Rep


               pprMayorAna1Mon.Print;
               pprMayorAna1Mon.Stop;

               //** 08/08/2001 - pjsv
               Exit;
               xZ := pprMayorAna1Mon.GroupCount -1;
               While xZ >= 0 Do
                begin
                 pprMayorAna1Mon.Groups[xZ].Free;
                 xZ := xZ - 1;
                end;
               //**
            end
            else
            begin
               //INICIO HPC_201206_CNT
               If xbExportarExcel = True Then
               Begin
                  fg_ExportarExcel( 'FORMATO2');
                  Exit;
               End;
               //FIN HPC_201206_CNT
               if FImpresion.wFlTexto='G' then
                  ppMayorAux1Mon.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\MayorAuxUni.rtm';
               if FImpresion.wFlTexto='T' then
                  ppMayorAux1Mon.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\MayorAuxUniTX.rtm';

               ppMayorAux1Mon.template.LoadFromFile ;

               ppSaldoAnt.DataField      := 'SALDMN' ;
               ppDEBE.DataField          := 'DEBEMN' ;
               pphaber.DataField         := 'HABEMN' ;
               ppLabel64.caption := 'Debe ' + xMonedaL;
               ppLabel65.caption := 'Haber ' + xMonedaL;
               pplblTituloMoneda.Caption := 'MONEDA LOCAL' ;
               pplblPerFechX.Caption := 'DEL ' + DateToStr(dbdtpFReg1.Date) + ' AL '+DateToStr(dbdtpFReg2.Date);// speAno.Text + speMM.Text;
               pplblCiaX.Caption := edtCia.text;
               pplblTituloX.Caption := 'Mayor Analítico Auxiliar Local';

               DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Mayor Analitico',
                     dblcCia.Text,                                  // Campañía
                     speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
                     dbdtpFReg1.Text, dbdtpFReg2.Text,              // Fecha   Inicio - final
                     dblcNivel.text,  dblcTDiario.Text,                         // Nivel   - Origen
                     '', inttostr(rgMoneda.itemindex),              // Lote    -  Moneda
                     sCtaLog, sAuxLog,                              // Cuentas - Auxiliares
                     '', 'Impresora',                                   // Costos - Tipo Salida
                     '0' );               // Tipo Rep


               ppMayorAux1Mon.Print ;  // resumido de Saldos Contables
               ppMayorAux1Mon.stop;

               //** 08/08/2001 - pjsv
               xZ := ppMayorAux1Mon.GroupCount -1;
               While xZ >= 0 Do
                begin
                 ppMayorAux1Mon.Groups[xZ].Free;
                 xZ := xZ - 1;
                end;
               //**
            end;
          end;
      1 : begin  // Extranjera  1
            if cbComp.Checked then
            begin
               //INICIO HPC_201206_CNT
               If xbExportarExcel = True Then
               Begin
                  fg_ExportarExcel( 'FORMATO2');
                  Exit;
               End;
               //FIN HPC_201206_CNT
               if FImpresion.wFlTexto='G' then
                  pprMayorAna1Mon.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\MayorAnaUni.rtm';
               if FImpresion.wFlTexto='T' then
                  pprMayorAna1Mon.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\MayorAnaUniTX.rtm';

               pprMayorAna1Mon.template.LoadFromFile ;
               pplblCiaY.Caption := edtCia.text;
               pplblTituloMonY.Caption   := 'MONEDA EXTRANJERA' ;
               xCampo       := 'CNTSALDME' ;
               ppLabel64.caption := 'Debe ' + xMonedaE;
               ppLabel65.caption := 'Haber ' + xMonedaE;
               DBDEBE.DataField          := 'CNTDEBEME' ;
               DBhaber.DataField         := 'CNTHABEME' ;
               pplblPerFechY.caption := 'DEL ' + DateToStr(dbdtpFReg1.Date) + ' AL '+DateToStr(dbdtpFReg2.Date);

               DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Mayor Analitico',
                     dblcCia.Text,                                  // Campañía
                     speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
                     dbdtpFReg1.Text, dbdtpFReg2.Text,              // Fecha   Inicio - final
                     dblcNivel.text,  dblcTDiario.Text,                         // Nivel   - Origen
                     '', inttostr(rgMoneda.itemindex),              // Lote    -  Moneda
                     sCtaLog, sAuxLog,                              // Cuentas - Auxiliares
                     '', 'Impresora',                                   // Costos - Tipo Salida
                     '1' );               // Tipo Rep


               pprMayorAna1Mon.Print;
               pprMayorAna1Mon.stop;
               xZ := pprMayorAna1Mon.GroupCount -1;
               While xZ >= 0 Do
                begin
                 pprMayorAna1Mon.Groups[xZ].Free;
                 xZ := xZ - 1;
                end;
            end
            else
            begin
               //INICIO HPC_201206_CNT
               If xbExportarExcel = True Then
               Begin
                  fg_ExportarExcel( 'FORMATO2');
                  Exit;
               End;
               //FIN HPC_201206_CNT
               if FImpresion.wFlTexto='G' then
                  ppMayorAux1Mon.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\MayorAuxUni.rtm';
               if FImpresion.wFlTexto='T' then
                  ppMayorAux1Mon.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\MayorAuxUni.rtm';

               ppMayorAux1Mon.template.LoadFromFile ;
               pplblTituloMoneda.Caption := 'MONEDA EXTRANJERA' ;
               ppSaldoAnt.DataField      := 'SALDME' ;
               ppDEBE.DataField          := 'DEBEME' ;
               pphaber.DataField         := 'HABEME' ;
               ppLabel64.caption := 'Debe ' + xMonedaE;
               ppLabel65.caption := 'Haber ' + xMonedaE;
               pplblPerFechX.Caption := 'DEL ' + DateToStr(dbdtpFReg1.Date) + ' AL '+DateToStr(dbdtpFReg2.Date);// speAno.Text + speMM.Text;
               pplblTituloX.Caption := 'Mayor Analítico Auxiliar Extranjero';

               DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Mayor Analitico',
                     dblcCia.Text,                                  // Campañía
                     speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
                     dbdtpFReg1.Text, dbdtpFReg2.Text,              // Fecha   Inicio - final
                     dblcNivel.text,  dblcTDiario.Text,                         // Nivel   - Origen
                     '', inttostr(rgMoneda.itemindex),              // Lote    -  Moneda
                     sCtaLog, sAuxLog,                              // Cuentas - Auxiliares
                     '', 'Impresora',                                   // Costos - Tipo Salida
                     '0' );               // Tipo Rep


               ppMayorAux1Mon.Print;
               ppMayorAux1Mon.stop;
               //** 08/08/2001 - pjsv
               xZ := ppMayorAux1Mon.GroupCount -1;
               While xZ >= 0 Do
                begin
                 ppMayorAux1Mon.Groups[xZ].Free;
                 xZ := xZ - 1;
                end;
               //**
            end;
          end;
      2 : begin  // Ambas
            if cbComp.Checked then
              begin
               //INICIO HPC_201206_CNT
               If xbExportarExcel = True Then
               Begin
                  fg_ExportarExcel( 'FORMATO2');
                  Exit;
               End;
               //FIN HPC_201206_CNT
               if FImpresion.wFlTexto='G' then
                  pprMayorAna.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\MayorAnaAmbos.rtm';
               if FImpresion.wFlTexto='T' then
                  pprMayorAna.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\MayorAnaAmbosTX.rtm';

               pprMayorAna.template.LoadFromFile ;
               pplblCia.caption := edtCia.text;
               ppLabel23.caption := 'Debe '+xMonedaL;
               ppLabel24.caption := 'Haber '+xMonedaL;
               ppLabel73.caption := 'Debe '+xMonedaE;
               ppLabel75.caption := 'Haber '+xMonedaE;
               pplblPerFech.Caption := 'DEL ' + DateToStr(dbdtpFReg1.Date) + ' AL '+DateToStr(dbdtpFReg2.Date);// speAno.Text + speMM.Text;

               DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Mayor Analitico',
                     dblcCia.Text,                                  // Campañía
                     speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
                     dbdtpFReg1.Text, dbdtpFReg2.Text,              // Fecha   Inicio - final
                     dblcNivel.text,  dblcTDiario.Text,             // Nivel   - Origen
                     '', inttostr(rgMoneda.itemindex),              // Lote    -  Moneda
                     sCtaLog, sAuxLog,                              // Cuentas - Auxiliares
                     '', 'Impresora',                               // Costos - Tipo Salida
                     '1' );                                         // Tipo Rep


               pprMayorAna.Print;
               pprMayorAna.stop;
               xZ := pprMayorAna.GroupCount -1;
               While xZ >= 0 Do
                begin
                 pprMayorAna.Groups[xZ].Free;
                 xZ := xZ - 1;
                end;
               //**
              end
            else
             begin
               //INICIO HPC_201206_CNT
               If xbExportarExcel = True Then
               Begin
                  fg_ExportarExcel( 'FORMATO2');
                  Exit;
               End;
               //FIN HPC_201206_CNT
               if FImpresion.wFlTexto='G' then
                  pprMayorAux.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\MayorAuxAmbos.rtm';
               if FImpresion.wFlTexto='T' then
                  pprMayorAux.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt +'\MayorAuxAmbosTX.rtm';

               pprMayorAux.template.LoadFromFile ;
               pplblPerFech2.Caption := 'DEL ' + DateToStr(dbdtpFReg1.Date) + ' AL '+DateToStr(dbdtpFReg2.Date);// speAno.Text + speMM.Text;

               DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Mayor Analitico',
                     dblcCia.Text,                                  // Campañía
                     speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
                     dbdtpFReg1.Text, dbdtpFReg2.Text,              // Fecha   Inicio - final
                     dblcNivel.text,  dblcTDiario.Text,             // Nivel   - Origen
                     '', inttostr(rgMoneda.itemindex),              // Lote    -  Moneda
                     sCtaLog, sAuxLog,                              // Cuentas - Auxiliares
                     '', 'Impresora',                               // Costos - Tipo Salida
                     '0' );                                         // Tipo Rep

               pprMayorAux.Print;
               pprMayorAux.Stop;
               //** 08/08/2001 - pjsv
               xZ := pprMayorAux.GroupCount -1;
               While xZ >= 0 Do
                begin
                 pprMayorAux.Groups[xZ].Free;
                 xZ := xZ - 1;
                end;
               //**
            end;
          end;

      end;

   end;
   Screen.Cursor:=CrDefault;
end;

procedure TFMayor.CalculaSaldos;
//var
 //xbool : Bool;
begin
//  With DMCNT Do
//  Begin
   DMCNT.cdsQry.fIRST;
   While not DMCNT.cdsQry.Eof do
    begin
    XCIA  :=DMCNT.CDSQRY.FIELDBYNAME('CIAID').VALUE;
     XCTA  :=DMCNT.CDSQRY.FIELDBYNAME('CUENTAID').VALUE;
     XCLAUX:=DMCNT.CDSQRY.FIELDBYNAME('CLAUXID').VALUE;
     XAUX  :=DMCNT.CDSQRY.FIELDBYNAME('AUXID').VALUE;
     DMCNT.CDSMOVCNT2.SetKey;
     DMCNT.CDSMOVCNT2.FIELDBYNAME('CIAID').VALUE    :=Trim(XCIA);
     DMCNT.CDSMOVCNT2.FIELDBYNAME('CUENTAID').VALUE :=Trim(XCTA);
     DMCNT.CDSMOVCNT2.FIELDBYNAME('CLAUXID').VALUE  :=Trim(XCLAUX);
     DMCNT.CDSMOVCNT2.FIELDBYNAME('AUXID').VALUE    :=Trim(XAUX);
     if DMCNT.CDSMOVCNT2.GotoKey then
      begin
        While not DMCNT.cdsMovCNT2.Eof and
          (Trim(xCia) = Trim(DMCNT.CDSMOVCNT2.FieldbyName('CiaId').AsString)) AND
          (Trim(XCTA) = Trim(DMCNT.CDSMOVCNT2.FIELDBYNAME('CUENTAID').AsString))  and
          (Trim(XCLAUX) = Trim(DMCNT.CDSMOVCNT2.FIELDBYNAME('CLAUXID').AsString)) and
          (Trim(XAUX) = Trim(DMCNT.CDSMOVCNT2.FIELDBYNAME('AUXID').AsString)) do
         Begin
          DMCNT.cdsMovCNT2.Edit;
          DMCNT.CDSMOVCNT2.fieldbyname('CNTSALDMN').AsString := FloatToStrF(DMCNT.CDSQRY.FIELDBYNAME('SALDMN').ASFLOAT,ffFixed,15,2);
          DMCNT.CDSMOVCNT2.fieldbyname('CNTSALDME').AsString := FloatToStrF(DMCNT.CDSQRY.FIELDBYNAME('SALDME').ASFLOAT,ffFixed,15,2);
          DMCNT.cdsMovCNT2.Next;
         End;
      end
     else
      begin   // No tiene movimientos pero si saldo del mes anterior
       DMCNT.cdsMovCNT2.Insert;
       DMCNT.cdsMovCNT2.FieldByName('CIAID').AsString   :=xCia;
       DMCNT.cdsMovCNT2.FieldByName('CUENTAID').AsString:=xCta;
       DMCNT.cdsMovCNT2.FieldByName('CLAUXID').AsString :=xClAux;
       DMCNT.cdsMovCNT2.FieldByName('AUXID').AsString   :=xAux;
       DMCNT.CDSMOVCNT2.FieldByName('CTADES').AsString  :=DMCNT.cdsQry.FieldByName('CTADES').AsString;
       DMCNT.CDSMOVCNT2.FieldByName('AUXDES').AsString  :=DMCNT.cdsQry.FieldByName('AUXDES').AsString;
       DMCNT.CDSMOVCNT2.fieldbyname('CNTSALDMN').AsString := FloatToStrF(DMCNT.cdsQry.FieldByName('SALDMN').AsFloat,ffFixed,15,2);
       DMCNT.CDSMOVCNT2.fieldbyname('CNTSALDME').AsString := FloatToStrF(DMCNT.cdsQry.FieldByName('SALDME').AsFloat,ffFixed,15,2);
       DMCNT.cdsMovCNT2.Next;
      end;
     DMCNT.cdsQry.Next;
    end;
//  End;
end;

procedure TFMayor.ppvSaldoMN2Calc(Sender: TObject; var Value: Variant);
Var
   xD,xH, xS: DOUBLE;
begin
   ppdbtDMN.DisplayFormat:='';
   ppdbtHMN.DisplayFormat:='';
   ppdbtSAMN3.DisplayFormat:='';
   if ppdbtDMN.Text='' then xD:=0 else xD:=strtofloat(ppdbtDMN.Text);
   if ppdbtHMN.Text='' then xH:=0 else xH:=strtofloat(ppdbtHMN.Text);
   if ppdbtSAMN3.Text='' then xS:=0 else xS:=strtofloat(ppdbtSAMN3.Text);
   Value:=xS+(xD-xH);
   // Totales...Resumen
   ppvTSAMN3.Value:=ppvTSAMN3.Value+xS;
   ppvTDMN2.Value:=ppvTDMN2.Value+xD;
   ppvTHMN2.Value:=ppvTHMN2.Value+xH;
   ppvTSFMN.Value:=ppvTSFMN.Value+Value;
   ppdbtDMN.DisplayFormat:='###,###,##0.00';
   ppdbtHMN.DisplayFormat:='###,###,##0.00';
   ppdbtSAMN3.DisplayFormat:='###,###,##0.00';

end;

procedure TFMayor.ppvSaldoME2Calc(Sender: TObject; var Value: Variant);
Var
   xD, xH, xS: DOUBLE;
begin
   ppdbtDME.DisplayFormat:='';
   ppdbtHME.DisplayFormat:='';
   ppdbtSAME3.DisplayFormat:='';
   if ppdbtDME.Text='' then xD:=0 else xD:=strtofloat(ppdbtDME.Text);
   if ppdbtHME.Text='' then xH:=0 else xH:=strtofloat(ppdbtHME.Text);
   if ppdbtSAME3.Text='' then xS:=0 else xS:=strtofloat(ppdbtSAME3.Text);
   Value:=xS+(xD-xH);
   // Totales...Resumen
   ppvTSAME3.Value:=ppvTSAME3.Value+xS;
   ppvTDME2.Value:=ppvTDME2.Value+xD;
   ppvTHME2.Value:=ppvTHME2.Value+xH;
   ppvTSFME.Value:=ppvTSFME.Value+Value;
   ppdbtDME.DisplayFormat:='###,###,##0.00';
   ppdbtHME.DisplayFormat:='###,###,##0.00';
   ppdbtSAME3.DisplayFormat:='###,###,##0.00';
end;


procedure TFMayor.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFMayor.cbNivelClick(Sender: TObject);
begin
    if cbNivel.Checked then begin
       cbComp.Checked:=False;
       cbComp.Enabled:=False;
       dblcNivel.Enabled:=True;
    end
    else begin
       dblcNivel.Text:='';
       cbComp.Enabled:=True;
       dblcNivel.Enabled:=False;
    end;
end;

procedure TFMayor.cbCompClick(Sender: TObject);
begin
   if cbComp.Checked then begin
      dblcNivel.Text:='';
      ckTDiario.Enabled:=True;
   end
   else begin
      ckTDiario.Checked:=False;
      ckTDiario.Enabled:=False;
   end;
   ckTDiarioClick(Sender);
end;

procedure TFMayor.dblcTDiarioExit(Sender: TObject);
begin
   edtTDiario.Text:='';
   if dblcTDiario.Text<>'' then edtTDiario.Text:=DMCNT.cdsTDiario.FieldByName('TDIARDES').AsString;
end;

procedure TFMayor.ckTDiarioClick(Sender: TObject);
begin
   if not(ckTDiario.Checked) then begin
      dblcTDiario.Text:='';  edtTDiario.Text:='';
      dblcTDiario.Enabled:=False;
   end
   else begin
      dblcTDiario.Enabled:=True;
   end;
end;

procedure TFMayor.dbdtpFReg1Exit(Sender: TObject);
begin
   If dbdtpFReg1.date=0 then
   begin
      dbdtpFReg1.SetFocus;
      ShowMessage('Error : Falta Registrar Fecha');
      Raise Exception.Create('Error : Falta Registrar Fecha');
   end;
end;

procedure TFMayor.dbdtpFReg2Exit2(Sender: TObject);
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

procedure TFMayor.gbPerExit(Sender: TObject);
var
   xFecha1, xFecha2 : TDateTime;
begin
   xFecha1 := strtodate('01/'+DMCNT.strZero(speMM.Text,2)+'/'+speAno.Text);
   If strtofloat(speMM.Text)+1=13 then
     begin
        xFecha2 := strtodate('01/01/'+ FloatToStr(StrToFloat(speAno.Text)+1));
     end
   Else
     begin
        xFecha2:=strtodate('01/'+DMCNT.strZero(floattostr(strtofloat(speMM.Text)+1),2)+'/'+speAno.Text);
     end;
   xFecha2:=xFecha2-1;
   dbdtpFReg1.date:=xFecha1;
   dbdtpFReg2.date:=xFecha2;
end;

procedure TFMayor.Z2bbtnSelAuxiliarClick(Sender: TObject);
begin
   FSelAux.ShowModal ;
end;

procedure TFMayor.Z2bbtnSelCuentaClick(Sender: TObject);
begin
   FSelCuenta.sCia:=dblcCia.text;
   FSelCuenta.ShowModal;
end;

procedure TFMayor.rgAuxiliarClick(Sender: TObject);
begin
   if rgAuxiliar.ItemIndex=1 then
      begin
         Z2bbtnSelAuxiliar.Enabled := True ;
         Z2bbtnSelAuxiliar.Click;
      end
   else begin
      Z2bbtnSelAuxiliar.Enabled := False ;
   end ;
end;

procedure TFMayor.rgCuentaClick(Sender: TObject);
begin
   if rgCuenta.ItemIndex=1 then
      begin
         Z2bbtnSelCuenta.Enabled  := True;
         Z2bbtnSelCuenta.Click;
      end
   else begin
      Z2bbtnSelCuenta.Enabled  := False;
   end;
end;

procedure TFMayor.FormShow(Sender: TObject);
var
   xAno, xMes, xDia: Word;
begin
   SFMN:=0; SFME:=0; xx:=0;

//wmc0204   DMCNT.DCOM1.AppServer.ParamDSPGraba( '0', 'MOVCNT' );

   DMCNT.Filtracds( DMCNT.cdsNivel,   '' );
   DMCNT.cdsNivel.IndexFieldNames   := 'NIVEL';
//wmc0204   DMCNT.cdsMovCnt2.Active:=True;
//   DMCNT.cdsCia.IndexFieldNames:='CiaId';
   DMCNT.cdsMovCNT2.IndexFieldNames:='CiaId;CuentaId;ClAuxId;AuxId';
   DMCNT.cdsNivel.Last;
   UltNivel:=DMCNT.cdsNivel.FieldByName('Nivel').AsString;
///   dblcNivel.Text:=UltNivel;

   dblcCia.Text     := '' ;
   DecodeDate(Date, xAno, xMes, xDia);
   speAno.Value:=xAno;
   speMM.Value:=xMes;
   gbPerExit(Self);
//wmc0204   dblcCia.SetFocus;
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
   //self.SetFocus ;
   perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFMayor.pprMayorAnaPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;
end;

procedure TFMayor.pprMayorAnaPreviewFormCreate2(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;

end;

procedure TFMayor.ppVariable1Calc(Sender: TObject; var Value: Variant);
Var
   xD,xH, xS: DOUBLE;
begin
//   Saldo Final=Saldo Anterior + (D-H)
   ppDEBE.DisplayFormat:='';
   ppHABER.DisplayFormat:='';
   ppSaldoAnt.DisplayFormat:='';
   if ppDEBE.Text='' then xD:=0 else xD:=strtofloat(ppDEBE.Text);
   if ppHABER.Text='' then xH:=0 else xH:=strtofloat(ppHABER.Text);
   if ppSaldoAnt.Text='' then xS:=0 else xS:=strtofloat(ppSaldoAnt.Text);
   Value:=xS+(xD-xH);
   // Totales...Resumen
   ppVariable9.Value:=ppVariable9.Value+xS    ;
   ppVariable3.Value:=ppVariable3.Value+xD    ;
   ppVariable4.Value:=ppVariable4.Value+xH    ;
   ppVariable5.Value:=ppVariable5.Value+Value ;
   ppDEBE.DisplayFormat:='###,###,##0.00';
   ppHABER.DisplayFormat:='###,###,##0.00';
   ppSaldoAnt.DisplayFormat:='###,###,##0.00';

end;
procedure TFMayor.pprMayorAna1MonPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;
end;

procedure TFMayor.ppVariable10Calc(Sender: TObject; var Value: Variant);
begin
     Value:=ppVariable14.Value+(ppVariable7.Value-ppVariable8.Value);
end;

//** 25/10/2001 - pjsv
procedure TFMayor.ppVariable16Calc(Sender: TObject; var Value: Variant);
begin
   xx:=xx+1;      // (p.ch.)
   // Asigna Saldo Anterior a Saldo para el calculo del detalle
   if (ppGroup8.Breaking) or (xx=1) then
    begin
     DBSaldoAnt.DisplayFormat:='';
     If DMCNT.cdsMovCnt2.FieldByName(xCampo).AsString = '' then value := 0
     else value := DMCNT.cdsMovCnt2.FieldByName(xCampo).AsFloat;
     SFMN:=Value;
     DBSaldoAntFin.DisplayFormat:='';
     ppVariable14.DisplayFormat:='';
     DBSaldoAnt.value := DMCNT.cdsMovCnt2.FieldByName(xCampo).AsFloat;
     DBSaldoAntFin.Value :=  DBSaldoAnt.Value;
     ppVariable14.Value:= DBSaldoAntFin.Value; //StrToFloat(DBSaldoAnt.Text); //ppVariable14.Value+SFMN;
     DBSaldoAnt.DisplayFormat:='###,###,##0.00';
     DBSaldoAntFin.DisplayFormat:='###,###,##0.00';
    ppVariable14.DisplayFormat:='###,###,##0.00';
    end;
end;
//**

procedure TFMayor.ppVariable20Calc(Sender: TObject; var Value: Variant);
Var
   dd : DOUBLE;
begin
   DBSaldoAntFin.DisplayFormat:='';
   if DBSaldoAntFin.Text='' then dd:=0 else dd:=strtofloat(DBSaldoAntFin.Text);
//   dd:=ppvSAMN2.Value;   ////
   Value:=dd+(ppVariable18.Value-ppVariable19.Value);
   DBSaldoAntFin.DisplayFormat:='###,###,##0.00';
end;

procedure TFMayor.ppVariable24Calc(Sender: TObject; var Value: Variant);
begin
//   if ppdbtSAMN.Text='' then Value:=0 else Value:=strtofloat(ppdbtSAMN.Text);
end;

procedure TFMayor.ppVariable2Calc(Sender: TObject; var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
//   Saldo Final=Saldo Final + (D-H)
   DBDEBE.DisplayFormat:='';
   DBHABER.DisplayFormat:='';
   if DBDEBE.Text='' then xD:=0 else xD:=strtofloat(DBDEBE.Text);
   if DBHABER.Text='' then xH:=0 else xH:=strtofloat(DBHABER.Text);
   SFMN:=SFMN+(xD-xH);
   Value:=SFMN;
   // Totales...Resumen
   ppVariable18.Value:=ppVariable18.Value+xD;
   ppVariable19.Value:=ppVariable19.Value+xH;
   ppVariable7.Value:=ppVariable7.Value+xD;
   ppVariable8.Value:=ppVariable8.Value+xH;
   DBDEBE.DisplayFormat:='###,###,##0.00';
   DBHABER.DisplayFormat:='###,###,##0.00';

end;

procedure TFMayor.ppLabel37Print(Sender: TObject);
begin
     ppLabel37.top := ppSystemVariable12.Top ;
end;

procedure TFMayor.ppDBCalc1Calc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (DMCNT.cdsQry.fieldbyname('CTA_MOV').AsString = 'S')  then
     ppDBCalc1.Value := ppDBCalc1.Value + DMCNT.cdsQry.fieldbyname('DEBEMN').AsFloat;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (DMCNT.cdsQry.fieldbyname('CTA_MOV').AsString = 'S') then
    ppDBCalc1.Value := ppDBCalc1.Value + DMCNT.cdsQry.fieldbyname('DEBEMN').AsFloat;
   end;
end;

procedure TFMayor.ppDBCalc2Calc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (DMCNT.cdsQry.fieldbyname('CTA_MOV').AsString = 'S')  then
     ppDBCalc2.Value := ppDBCalc2.Value + DMCNT.cdsQry.fieldbyname('HABEMN').AsFloat;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (DMCNT.cdsQry.fieldbyname('CTA_MOV').AsString = 'S') then
    ppDBCalc2.Value := ppDBCalc2.Value + DMCNT.cdsQry.fieldbyname('HABEMN').AsFloat;
   end;
end;

procedure TFMayor.ppDBCalc3Calc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (DMCNT.cdsQry.fieldbyname('CTA_MOV').AsString = 'S')  then
     ppDBCalc3.Value := ppDBCalc3.Value + DMCNT.cdsQry.fieldbyname('DEBEME').AsFloat;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (DMCNT.cdsQry.fieldbyname('CTA_MOV').AsString = 'S') then
    ppDBCalc3.Value := ppDBCalc3.Value + DMCNT.cdsQry.fieldbyname('DEBEME').AsFloat;
   end;
end;

procedure TFMayor.ppDBCalc4Calc(Sender: TObject);
begin
  If xNivel ='0' then
   begin
    If (DMCNT.cdsQry.fieldbyname('CTA_MOV').AsString = 'S')  then
     ppDBCalc4.Value := ppDBCalc4.Value + DMCNT.cdsQry.fieldbyname('HABEME').AsFloat;
   end
  else
   begin
    If (DMCNT.cdsQry.fieldbyname('TIPO').AsString = dblcNivel.text) or
       (DMCNT.cdsQry.fieldbyname('CTA_MOV').AsString = 'S') then
    ppDBCalc4.Value := ppDBCalc4.Value + DMCNT.cdsQry.fieldbyname('HABEME').AsFloat;
   end;
end;

procedure TFMayor.ppDBCalc5Calc(Sender: TObject);
begin
  If xNivel ='0' then
     ppDBCalc5.Value := ppDBCalc5.Value + DMCNT.cdsQry.fieldbyname('DEBEMN').AsFloat
  else
    ppDBCalc5.Value := ppDBCalc5.Value + DMCNT.cdsQry.fieldbyname('DEBEMN').AsFloat;
end;

procedure TFMayor.ppDBCalc6Calc(Sender: TObject);
begin
  If xNivel ='0' then
     ppDBCalc6.Value := ppDBCalc6.Value + DMCNT.cdsQry.fieldbyname('HABEMN').AsFloat
  else
    ppDBCalc6.Value := ppDBCalc6.Value + DMCNT.cdsQry.fieldbyname('HABEMN').AsFloat;
end;

procedure TFMayor.ppDBCalc7Calc(Sender: TObject);
begin
  If xNivel ='0' then
     ppDBCalc7.Value := ppDBCalc7.Value + DMCNT.cdsQry.fieldbyname('DEBEME').AsFloat
  else
    ppDBCalc7.Value := ppDBCalc7.Value + DMCNT.cdsQry.fieldbyname('DEBEME').AsFloat;
end;

procedure TFMayor.ppDBCalc8Calc(Sender: TObject);
begin
  If xNivel ='0' then
     ppDBCalc8.Value := ppDBCalc8.Value + DMCNT.cdsQry.fieldbyname('HABEME').AsFloat
  else
    ppDBCalc8.Value := ppDBCalc8.Value + DMCNT.cdsQry.fieldbyname('HABEME').AsFloat;
end;

procedure TFMayor.ppDBCalc9Calc(Sender: TObject);
begin
  If rgMoneda.Itemindex = 0 then
   ppDBCalc9.Value := ppDBCalc9.Value + DMCNT.cdsQry.fieldbyname('DEBEMN').AsFloat
  else
   ppDBCalc9.Value := ppDBCalc9.Value + DMCNT.cdsQry.fieldbyname('DEBEME').AsFloat;
end;

procedure TFMayor.ppDBCalc10Calc(Sender: TObject);
begin
  If rgMoneda.Itemindex = 0 then
   ppDBCalc10.Value := ppDBCalc10.Value + DMCNT.cdsQry.fieldbyname('HABEMN').AsFloat
  else
   ppDBCalc10.Value := ppDBCalc10.Value + DMCNT.cdsQry.fieldbyname('HABEME').AsFloat;
end;

procedure TFMayor.ppDBCalc11Calc(Sender: TObject);
begin
  If rgMoneda.ItemIndex = 0 then
   ppDBCalc11.Value := ppDBCalc11.Value + DMCNT.cdsMOVCNT2.fieldbyname('CNTDEBEMN').AsFloat
  else
   ppDBCalc11.Value := ppDBCalc11.Value + DMCNT.cdsMOVCNT2.fieldbyname('CNTDEBEME').AsFloat
end;

procedure TFMayor.ppDBCalc12Calc(Sender: TObject);
begin
  If rgMoneda.ItemIndex = 0 then
    ppDBCalc12.Value := ppDBCalc12.Value + DMCNT.cdsMOVCNT2.fieldbyname('CNTHABEMN').AsFloat
  else
    ppDBCalc12.Value := ppDBCalc12.Value + DMCNT.cdsMOVCNT2.fieldbyname('CNTHABEME').AsFloat
end;

//** 25/10/2001 - pjsv
procedure TFMayor.pprMayorAna1MonStartPage(Sender: TObject);
begin
  If pprMayorAna1Mon.page = 1 then xx := 0;
end;
//**





{procedure TFMayor.ppvSxMNCalc(Sender: TObject; var Value: Variant);
begin
   ppdbtSAMN.DisplayFormat:='';
   if ppdbtSAMN.Text='' then Value:=0 else Value:=strtofloat(ppdbtSAMN.Text);
   xx:=xx+1;      // (p.ch.)
   if (ppGroup7.Breaking) or (xx=1) then
   begin
     SFMN:=Value;
     ppvTSAMN.Value:=ppvTSAMN.Value+SFMN;
   end;
   ppdbtSAMN.DisplayFormat:='###,###,##0.00';
end;

procedure TFMayor.ppvSaldoMNCalc(Sender: TObject; var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
   ppdbtDMN1.DisplayFormat:='';
   ppdbtHMN1.DisplayFormat:='';
   if ppdbtDMN1.Text='' then xD:=0 else xD:=strtofloat(ppdbtDMN1.Text);
   if ppdbtHMN1.Text='' then xH:=0 else xH:=strtofloat(ppdbtHMN1.Text);
   SFMN:=SFMN+(xD-xH);
   Value:=SFMN;
   // Totales...Resumen
   ppvTDMN.Value:=ppvTDMN.Value+xD;
   ppvTHMN.Value:=ppvTHMN.Value+xH;
   ppvTDMNpC.Value:=ppvTDMNpC.Value+xD;
   ppvTHMNpC.Value:=ppvTHMNpC.Value+xH;
   ppdbtDMN1.DisplayFormat:='###,###,##0.00';
   ppdbtHMN1.DisplayFormat:='###,###,##0.00';
end;

procedure TFMayor.ppvSaldoMECalc(Sender: TObject; var Value: Variant);
Var
   xD,xH: DOUBLE;
begin
   ppdbtDME1.DisplayFormat:='';
   ppdbtHME1.DisplayFormat:='';
   if ppdbtDME1.Text='' then xD:=0 else xD:=strtofloat(ppdbtDME1.Text);
   if ppdbtHME1.Text='' then xH:=0 else xH:=strtofloat(ppdbtHME1.Text);
   SFME:=SFME+(xD-xH);
   Value:=SFME;
   // Totales...Resumen
   ppvTDME.Value:=ppvTDME.Value+xD;
   ppvTHME.Value:=ppvTHME.Value+xH;
   ppvTDMEpC.Value:=ppvTDMEpC.Value+xD;
   ppvTHMEpC.Value:=ppvTHMEpC.Value+xH;
   ppdbtDME1.DisplayFormat:='###,###,##0.00';
   ppdbtHME1.DisplayFormat:='###,###,##0.00';
end;

procedure TFMayor.ppvTSMNCalc(Sender: TObject; var Value: Variant);
Var
   dd : DOUBLE;
begin
   ppdbtSAMN2.DisplayFormat:='';
   if ppdbtSAMN2.Text='' then dd:=0 else dd:=strtofloat(ppdbtSAMN2.Text);
   Value:=dd+(ppvTDMN.Value-ppvTHMN.Value);
   ppdbtSAMN2.DisplayFormat:='###,###,##0.00';
end;

procedure TFMayor.ppvTSMNpCCalc(Sender: TObject; var Value: Variant);
begin
     Value:=ppvTSAMN.Value+(ppvTDMNpC.Value-ppvTHMNpC.Value);
end;

procedure TFMayor.ppvSxMECalc(Sender: TObject; var Value: Variant);
begin
   ppdbtSAME.DisplayFormat:='';
   if ppdbtSAME.Text='' then Value:=0 else Value:=strtofloat(ppdbtSAME.Text);
// Asigna Saldo Anterior a Saldo Final para el calculo del detalle
   if (ppGroup7.Breaking) or (xx=1) then
   begin
     SFME:=Value;
     ppvTSAME.Value:=ppvTSAME.Value+SFME;
   end;
   ppdbtSAME.DisplayFormat:='###,###,##0.00';
end;

procedure TFMayor.ppvTSMECalc(Sender: TObject; var Value: Variant);
Var
   dd : DOUBLE;
begin
   ppdbtSAME2.DisplayFormat:='';
   if ppdbtSAME2.Text='' then dd:=0 else dd:=strtofloat(ppdbtSAME2.Text);
   Value:=dd+(ppvTDME.Value-ppvTHME.Value);
   ppdbtSAME2.DisplayFormat:='###,###,##0.00';
end;

procedure TFMayor.ppvTSMEpCCalc(Sender: TObject; var Value: Variant);
begin
     Value:=ppvTSAME.Value+(ppvTDMEpC.Value-ppvTHMEpC.Value);
end;

procedure TFMayor.ppVariable6Calc(Sender: TObject; var Value: Variant);
begin
    Value:=StrtoFloat(ppvTSAMN.Value)+
           StrtoFloat(ppvTDMNpC.Value)-
           StrtoFloat(ppvTHMNpC.Value);
    if value>0 then
       ppVariable6.VIsible:=True
    else
       ppVariable6.VIsible:=false;

end;

procedure TFMayor.ppVariable11Calc(Sender: TObject; var Value: Variant);
begin
    Value:=StrtoFloat(ppvTSAMN.Value)+
           StrtoFloat(ppvTDMNpC.Value)-
           StrtoFloat(ppvTHMNpC.Value);
    if value<0 then
       ppVariable6.VIsible:=True
    else
       ppVariable6.VIsible:=false;

end;

procedure TFMayor.ppvTSAMNPrint(Sender: TObject);
begin
   if ppvTSAMN.value>0 then
      ppvTSAMN.Visible:=true
   else
      ppvTSAMN.Visible:=false;
end;

procedure TFMayor.ppvTSAMN2Print(Sender: TObject);
begin
   if ppvTSAMN.value<0 then begin
      ppvTSAMN.Visible:=true;
   end
   else
      ppvTSAMN.Visible:=false;
end;

}

procedure TFMayor.ppGroupHeaderBand7BeforePrint(Sender: TObject);
begin
   xx:=xx+1;      // (p.ch.)
   ppVariable12.DisplayFormat:='';
   ppVariable23.DisplayFormat:='';
   if (ppGroup7.Breaking) or (xx=1) then
    begin
     If DMCNT.cdsMovCnt2.FieldByName('CNTSALDMN').AsString = '' then
       ppVariable12.value := 0
     else
       ppVariable12.value := DMCNT.cdsMovCnt2.FieldByName('CNTSALDMN').AsFloat;

     If DMCNT.cdsMovCnt2.FieldByName('CNTSALDME').AsString = '' then
       ppVariable23.value := 0
     else
       ppVariable23.value := DMCNT.cdsMovCnt2.FieldByName('CNTSALDME').AsFloat;

     ppVariable12.DisplayFormat:='###,###,##0.00';
     ppVariable23.DisplayFormat:='###,###,##0.00';
    end;
end;

procedure TFMayor.pprMayorAnaStartPage(Sender: TObject);
begin
  If pprMayorAna.page = 1 then xx := 0;
end;

procedure TFMayor.ppGroupFooterBand7BeforePrint(Sender: TObject);
begin
   If ppVariable12.value < 0 then
     ppVariable12.spLeft := ppDBText14.spLeft
   else
    ppVariable12.left := ppDBText13.left;
   If ppVariable23.value < 0 then
    ppVariable12.Left := ppDBText43.left
   else
    ppVariable23.Left := ppDBText42.left;
   ppVariable6.value := ppVariable12.value + (ppDBCalc13.value  - ppDBCalc14.value);
   If ppVariable6.value < 0 then
    ppVariable6.left := ppDBText14.left
   else
     ppVariable6.left := ppDBText13.left;
   ppVariable13.value := ppVariable23.value + (ppDBCalc15.value  - ppDBCalc16.value);
   If ppVariable13.value < 0 then
    ppVariable13.Left := ppDBText43.left
   else
    ppVariable13.Left := ppDBText42.left;
  xSaldoantMn := xSaldoantMn + ppVariable12.value;
  xSaldoantMe := xSaldoantMe + ppVariable23.value;

end;

procedure TFMayor.ppGroupHeaderBand1BeforePrint(Sender: TObject);
begin
 xSaldoAntMn := 0;
 xSaldoAntMe := 0;
end;

procedure TFMayor.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
   xx:=xx+1;      // (p.ch.)
   ppVariable15.DisplayFormat:='';
   ppVariable17.DisplayFormat:='';
   if (ppGroup1.Breaking) or (xx=1) then
    begin
     ppVariable15.value := ppVariable12.value + (ppDBCalc17.value  - ppDBCalc18.value);
     If ppVariable15.value < 0 then
      ppVariable15.left := ppDBText14.left
     else
       ppVariable15.left := ppDBText13.left;
     ppVariable17.value := ppVariable23.value + (ppDBCalc19.value  - ppDBCalc20.value);
     If ppVariable17.value < 0 then
      ppVariable17.Left := ppDBText43.left
     else
      ppVariable17.Left := ppDBText42.left;

     ppVariable15.DisplayFormat:='###,###,##0.00';
     ppVariable17.DisplayFormat:='###,###,##0.00';
    end;
end;

procedure TFMayor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMCNT.cdsQry.IndexFieldNames := '';
  DMCNT.cdsQry.Filter := '';
  DMCNT.cdsQry.Filtered := True;
  FSelCuenta.free ;
  FSelAux.free ;
  FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
  Action:=caFree;
end;

procedure TFMayor.bbtnCancClick(Sender: TObject);
begin
   close;
end;

procedure TFMayor.ppDBText31Print(Sender: TObject);
begin
  //
end;
//INICIO HPC_201206_CNT
Procedure TFMayor.btnExportarExcelClick(Sender: TObject);
Begin
   xbExportarExcel := True;
   bbtnOkClick(Self);
   xbExportarExcel := False;
End;

Procedure TFMayor.fg_ExportarExcel(wgFormato: String);
Begin
   If  wgFormato = 'FORMATO1' Then
   Begin
      dbgDatosReporte.Selected.Clear;
      dbgDatosReporte.Selected.Add('CIAID'#9'8'#9'Compañía'#9'F');
      dbgDatosReporte.Selected.Add('TDIARID'#9'8'#9'TDiario Id'#9'F');
      dbgDatosReporte.Selected.Add('TDIARDES'#9'18'#9'Tipo Diario'#9'F');
      dbgDatosReporte.Selected.Add('CNTANOMM'#9'6'#9'Año Mes'#9'F');
      dbgDatosReporte.Selected.Add('TMONID'#9'6'#9'Moneda'#9'F');
      dbgDatosReporte.Selected.Add('CNTFCOMP'#9'10'#9'Fecha'#9'F');
      dbgDatosReporte.Selected.Add('CNTCOMPROB'#9'12'#9'Nº Comprobante'#9'F');
      dbgDatosReporte.Selected.Add('CNTLOTE'#9'6'#9'Lote'#9'F');
      dbgDatosReporte.Selected.Add('CNTUSER'#9'10'#9'Usuario'#9'F');
      dbgDatosReporte.Selected.Add('CNTTCAMBIO'#9'8'#9'Tipo Cambio'#9'F');
      //dbgDatosReporte.Selected.Add('CNTCUADRE'#9'6'#9'Cuadre'#9'F');
      dbgDatosReporte.Selected.Add('CNTESTADO'#9'6'#9'Estado'#9'F');
      dbgDatosReporte.Selected.Add('CNTDEBEMN'#9'10'#9'S/ Debe'#9'F');
      dbgDatosReporte.Selected.Add('CNTHABEMN'#9'10'#9'S/ Haber'#9'F');
      dbgDatosReporte.Selected.Add('CNTDEBEME'#9'10'#9'$ Debe'#9'F');
      dbgDatosReporte.Selected.Add('CNTHABEME'#9'10'#9'$ Haber'#9'F');


      dbgDatosReporte.DataSource :=  DMCNT.dsQry;
   End   
   Else If  wgFormato = 'FORMATO2' Then
   Begin
      dbgDatosReporte.Selected.Clear;
      dbgDatosReporte.Selected.Add('CIAID'#9'8'#9'Compañía'#9'F');
      dbgDatosReporte.Selected.Add('TDIARID'#9'8'#9'TDiario Id'#9'F');
      dbgDatosReporte.Selected.Add('TDIARDES'#9'18'#9'Tipo Diario'#9'F');
      dbgDatosReporte.Selected.Add('CNTCOMPROB'#9'12'#9'Nº Comprobante'#9'F');
      dbgDatosReporte.Selected.Add('CNTANOMM'#9'12'#9'Año Mes'#9'F');
      dbgDatosReporte.Selected.Add('CNTLOTE'#9'6'#9'Lote'#9'F');
      dbgDatosReporte.Selected.Add('CUENTAID'#9'6'#9'Cuenta'#9'F');
      dbgDatosReporte.Selected.Add('CTADES'#9'18'#9'Cuenta Des'#9'F');
      dbgDatosReporte.Selected.Add('CLAUXID'#9'6'#9'Tipo Aux'#9'F');
      dbgDatosReporte.Selected.Add('AUXID'#9'6'#9'Cod Auxiliar'#9'F');
      dbgDatosReporte.Selected.Add('AUXDES'#9'6'#9'Auxiliar Des'#9'F');
      dbgDatosReporte.Selected.Add('DOCID'#9'6'#9'Código Doc'#9'F');
      dbgDatosReporte.Selected.Add('CNTSERIE'#9'6'#9'Serie Doc'#9'F');
      dbgDatosReporte.Selected.Add('CNTNODOC'#9'6'#9'Nº Doc'#9'F');
      dbgDatosReporte.Selected.Add('CNTGLOSA'#9'6'#9'Glosa'#9'F');
      dbgDatosReporte.Selected.Add('CNTDH'#9'6'#9'Debe/Haber'#9'F');
      dbgDatosReporte.Selected.Add('CCOSID'#9'6'#9'CCosto'#9'F');
      dbgDatosReporte.Selected.Add('CCOSDES'#9'6'#9'CCosto Des'#9'F');
      dbgDatosReporte.Selected.Add('CNTTCAMBIO'#9'8'#9'Tipo Cambio'#9'F');
      dbgDatosReporte.Selected.Add('CNTESTADO'#9'6'#9'Estado'#9'F');
      dbgDatosReporte.Selected.Add('CNTDEBEMN'#9'10'#9'S/ Debe'#9'F');
      dbgDatosReporte.Selected.Add('CNTHABEMN'#9'10'#9'S/ Haber'#9'F');
      dbgDatosReporte.Selected.Add('CNTDEBEME'#9'10'#9'$ Debe'#9'F');
      dbgDatosReporte.Selected.Add('CNTHABEME'#9'10'#9'$ Haber'#9'F');
      dbgDatosReporte.Selected.Add('TMONID'#9'6'#9'Moneda'#9'F');
      dbgDatosReporte.Selected.Add('CNTFCOMP'#9'10'#9'Fecha'#9'F');
      dbgDatosReporte.Selected.Add('CNTUSER'#9'10'#9'Usuario'#9'F');
      dbgDatosReporte.Selected.Add('CNTREG'#9'6'#9'Registro'#9'F');

      dbgDatosReporte.DataSource :=  DMCNT.dsMovCnt2;
   End;

      Try
         Screen.Cursor := crHourGlass;
         dbgDatosReporte.ExportOptions.ExportType := wwgetSYLK;
         dbgDatosReporte.ExportOptions.FileName := 'AMYOR ANALITICO' + '.slk';
         dbgDatosReporte.ExportOptions.Save;//el primero genera error
         dbgDatosReporte.ExportOptions.Save;
         ShellExecute(Handle, 'Open', PChar(dbgDatosReporte.exportoptions.Filename),Nil, Nil, sw_shownormal);
         Screen.Cursor := crDefault;
      Except
         On Ex: Exception Do
            Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
      End;

End;
//FIN HPC_201206_CNT
end.



