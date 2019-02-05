unit CNT311;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, wwdbdatetimepicker, wwdblook, Buttons, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppCache, ppDBPipe;

type
  TFCtroCosto = class(TForm)
    pnlCC: TPanel;
    lblCia: TLabel;
    gbLPar: TGroupBox;
    gbCC: TGroupBox;
    edtCC1: TEdit;
    edtCC2: TEdit;
    edtCC3: TEdit;
    gbCtas: TGroupBox;
    edtCta1: TEdit;
    edtCta2: TEdit;
    edtCta3: TEdit;
    ckTit: TCheckBox;
    ckCtas: TCheckBox;
    edtTit: TEdit;
    ckCC: TCheckBox;
    rgMoneda: TRadioGroup;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    cbComp: TCheckBox;
    gbFech: TGroupBox;
    dbdtpFReg1: TwwDBDateTimePicker;
    dbdtpFReg2: TwwDBDateTimePicker;
    gbPer: TGroupBox;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    rbFech: TRadioButton;
    rbPer: TRadioButton;
    ppdbCCostoDet: TppDBPipeline;
    pprCCostoDet: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel9: TppLabel;
    pplblTitulo: TppLabel;
    ppLine1: TppLine;
    ppLabel18: TppLabel;
    ppLine2: TppLine;
    ppLabel6: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
    pplblCia: TppLabel;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLabel2: TppLabel;
    pplblDMN: TppLabel;
    pplblHMN: TppLabel;
    pplMN1: TppLine;
    pplblMN: TppLabel;
    pplMN2: TppLine;
    pplblSMN: TppLabel;
    pplME1: TppLine;
    pplblDME: TppLabel;
    pplblHME: TppLabel;
    pplblSME: TppLabel;
    pplblME: TppLabel;
    pplME2: TppLine;
    ppLine11: TppLine;
    ppLabel22: TppLabel;
    pplblSAME: TppLabel;
    pplblSAMN: TppLabel;
    pplblPerFech: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText9: TppDBText;
    ppvSaldoMN: TppVariable;
    ppvSaldoME: TppVariable;
    ppdbtDMN1: TppDBText;
    ppdbtHMN1: TppDBText;
    ppdbtDME1: TppDBText;
    ppdbtHME1: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText7: TppDBText;
    ppDBText10: TppDBText;
    ppLabel4: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel24: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppvTDMNpC: TppVariable;
    ppvTHMNpC: TppVariable;
    ppvTSMNpC: TppVariable;
    ppvTDMEpC: TppVariable;
    ppvTHMEpC: TppVariable;
    ppvTSMEpC: TppVariable;
    pplG2: TppLine;
    ppvTSAMN: TppVariable;
    ppvTSAME: TppVariable;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppLabel30: TppLabel;
    ppdbtSAME: TppDBText;
    ppvSxMN: TppVariable;
    ppdbtSAMN: TppDBText;
    ppvSxME: TppVariable;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLabel23: TppLabel;
    ppDBText14: TppDBText;
    ppDBText13: TppDBText;
    ppvTDMN: TppVariable;
    pplG1: TppLine;
    ppvTHMN: TppVariable;
    ppvTSMN: TppVariable;
    ppvTDME: TppVariable;
    ppvTHME: TppVariable;
    ppvTSME: TppVariable;
    ppdbtSAMN2: TppDBText;
    ppdbtSAME2: TppDBText;
    ppvSAMN2: TppVariable;
    ppdbCCosto: TppDBPipeline;
    pprCCosto: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel7: TppLabel;
    pplblTitulo2: TppLabel;
    ppLine3: TppLine;
    ppLine7: TppLine;
    ppLabel27: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    pplblCia2: TppLabel;
    pplblDMN2: TppLabel;
    pplblHMN2: TppLabel;
    ppLine12: TppLine;
    pplblMN2: TppLabel;
    ppLine13: TppLine;
    pplblSMN2: TppLabel;
    ppLine14: TppLine;
    pplblDME2: TppLabel;
    pplblHME2: TppLabel;
    pplblSME2: TppLabel;
    pplblME2: TppLabel;
    ppLine15: TppLine;
    ppLabel11: TppLabel;
    ppLabel14: TppLabel;
    ppLabel21: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    pplblPerFech2: TppLabel;
    ppDetailBand2: TppDetailBand;
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
    ppFooterBand2: TppFooterBand;
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
    pplTotMN: TppLine;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppvTSAMN3: TppVariable;
    ppvTSAME3: TppVariable;
    cbNivel: TCheckBox;
    gbNivel: TGroupBox;
    dblcNivel: TwwDBLookupCombo;
    ppLabel12: TppLabel;
    ckTDiario: TCheckBox;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    procedure dblcCiaExit(Sender: TObject);
    procedure rbFechClick(Sender: TObject);
    procedure rbPerClick(Sender: TObject);
    procedure dbdtpFReg2Exit(Sender: TObject);
    procedure ckCCClick(Sender: TObject);
    procedure ckCtasClick(Sender: TObject);
    procedure ckTitClick(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure CalculaSaldos;
    procedure FormActivate(Sender: TObject);
    procedure ppvSxMNCalc(Sender: TObject; var Value: Variant);
    procedure ppvSxMECalc(Sender: TObject; var Value: Variant);
    procedure ppvSaldoMNCalc(Sender: TObject; var Value: Variant);
    procedure ppvSaldoMECalc(Sender: TObject; var Value: Variant);
    procedure ppvTSMNCalc(Sender: TObject; var Value: Variant);
    procedure ppvTSMECalc(Sender: TObject; var Value: Variant);
    procedure ppdbtSAMNPrint(Sender: TObject);
    procedure ppdbtDMN1Print(Sender: TObject);
    procedure ppdbtHMN1Print(Sender: TObject);
    procedure ppdbtSAMEPrint(Sender: TObject);
    procedure ppdbtDME1Print(Sender: TObject);
    procedure ppdbtHME1Print(Sender: TObject);
    procedure ppdbtSAMN2Print(Sender: TObject);
    procedure ppdbtSAME2Print(Sender: TObject);
    procedure ppvTSMNpCCalc(Sender: TObject; var Value: Variant);
    procedure ppvTSAMNPrint(Sender: TObject);
    procedure ppvTSAMEPrint(Sender: TObject);
    procedure ppvTSMEpCCalc(Sender: TObject; var Value: Variant);
    procedure ppvSaldoMN2Calc(Sender: TObject; var Value: Variant);
    procedure ppdbtSAMN3Print(Sender: TObject);
    procedure ppdbtDMNPrint(Sender: TObject);
    procedure ppdbtHMNPrint(Sender: TObject);
    procedure ppdbtSAME3Print(Sender: TObject);
    procedure ppdbtDMEPrint(Sender: TObject);
    procedure ppdbtHMEPrint(Sender: TObject);
    procedure ppvSaldoME2Calc(Sender: TObject; var Value: Variant);
    procedure cbNivelClick(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure ckTDiarioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCtroCosto: TFCtroCosto;
  xWhere: String;
  UltNivel, xCia, xCta, xCCo: String;
  SFMN, SFME: Single;       // xx para programacion chcr
  xx: SmallInt;

implementation

uses CNTDM;

{$R *.DFM}

procedure TFCtroCosto.FormActivate(Sender: TObject);
var
   xAno, xMes, xDia: Word;
   xSQL : String;
begin
   SFMN:=0; SFME:=0; xx:=0;

   DM1.DCOM1.AppServer.ParamDSPGraba( '0', 'MOVCNT' );

   DM1.cdsMovCNT2.IndexFieldNames:='CIAID;CUENTAID;CCOSID';

   xSQL :=' Select * From CNT202';
   DM1.cdsNivel.Close;
   DM1.cdsNivel.DataRequest(xSQL);
   DM1.cdsNivel.Open;

   DM1.cdsNivel.Last;
   UltNivel:=DM1.cdsNivelNivel.Value;
   dblcNivel.Text:=UltNivel;

   DecodeDate(Date, xAno, xMes, xDia);
   speAno.Value:=xAno;
   speMM.Value:=xMes;

   xSQL :=' Select * From TGE104';
   DM1.cdsTDIARIO.Close;
   DM1.cdsTDIARIO.DataRequest(xSQL);
   DM1.cdsTDIARIO.Open;

end;

procedure TFCtroCosto.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DM1.cdsCiaCiaDes.Text;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   end;
end;

procedure TFCtroCosto.rbFechClick(Sender: TObject);
begin
   if rbFech.Checked then Begin
      dbdtpFReg1.Enabled:=True;
      dbdtpFReg2.Enabled:=True;
      speAno.Enabled:=False;
      speMM.Enabled:=False;
   end;
end;

procedure TFCtroCosto.rbPerClick(Sender: TObject);
begin
   if rbPer.Checked then Begin
      speAno.Enabled:=True;
      speMM.Enabled:=True;
      dbdtpFReg1.Enabled:=False;
      dbdtpFReg2.Enabled:=False;
   end;
end;

procedure TFCtroCosto.dbdtpFReg2Exit(Sender: TObject);
begin
     if dbdtpFReg2.Date < dbdtpFReg1.Date then begin
        ShowMessage('   Fecha no válida   ');
        dbdtpFReg2.SetFocus;
     end;
end;

procedure TFCtroCosto.ckCCClick(Sender: TObject);
begin
   if not(ckCC.Checked) then begin
      gbCC.Enabled:=False;
   end
   else begin
      gbCC.Enabled:=True;
   end;
end;

procedure TFCtroCosto.ckCtasClick(Sender: TObject);
begin
   if not(ckCtas.Checked) then begin
      gbCtas.Enabled:=False;
   end
   else begin
      gbCtas.Enabled:=True;
   end;
end;

procedure TFCtroCosto.ckTitClick(Sender: TObject);
begin
   if ckTit.Checked then begin
      edtTit.Enabled:=True;
   end
   else begin
      edtTit.Enabled:=False;
   end;
end;

procedure TFCtroCosto.bbtnOkClick(Sender: TObject);
Var
  xSQL, xWhere1, xWhere2, xWhere3, xWhereP, xWhereTD : String;
  wFecha, wAno, wMes, wAnomm, xSeleP,xGrp: String;
  CampoDMN,CampoHMN,CampoSMN,CampoDME,CampoHME,CampoSME: String;
  xTDMN, xTHMN, xTDME, xTHME: Single;
  n:  SmallInt;
  Year, Month, Day: Word;
begin
  With DM1 do Begin
   if not(rbPer.Checked) and not(rbFech.Checked)
   then raise exception.Create('Seleccione un Periodo o un Rango de Fechas');

   if (cbNivel.Checked) and (dblcNivel.Text='')
   then raise exception.Create('Seleccione un Nivel de Detalle de Cuenta');

   if (ckTDiario.Checked) and (edtTDiario.Text='')
   then raise exception.Create('Seleccione un Tipo de Diario');

   xWhere:='';

   // Cia + Fecha + Grupo Relación...
   if (edtTDiario.Text<>'') then begin
      xWhereTD:='TDIARID='+''''+dblcTDiario.Text+'''';
      xWhere:=xWhere+' and '+'('+xWhereTD+')';
   end;
   xWhere2:='';

   if ckCC.Checked then begin
      if edtCC1.Text<>'' then xWhere2:=xWhere2+'CCOSID='+''''+edtCC1.Text+'''';
      if (xWhere2<>'') and (edtCC2.Text<>'') then xWhere2:=xWhere2+' or ';
      if edtCC2.Text<>'' then xWhere2:=xWhere2+'CCOSID='+''''+edtCC2.Text+'''';
      if (xWhere2<>'') and (edtCC3.Text<>'') then xWhere2:=xWhere2+' or ';
      if edtCC3.Text<>'' then xWhere2:=xWhere2+'CCOSID='+''''+edtCC3.Text+'''';
      if xWhere2<>'' then xWhereP:=xWhereP+' and '+'('+xWhere2+')';
   end;

   xWhere2:='';
   if ckCtas.Checked then begin
      if edtCta1.Text<>'' then xWhere2:=xWhere2+'CUENTAID='+''''+edtCta1.Text+'''';
      if (xWhere2<>'') and (edtCta2.Text<>'') then xWhere2:=xWhere2+' or ';
      if edtCta2.Text<>'' then xWhere2:=xWhere2+'CUENTAID='+''''+edtCta2.Text+'''';
      if (xWhere2<>'') and (edtCta3.Text<>'') then xWhere2:=xWhere2+' or ';
      if edtCta3.Text<>'' then xWhere2:=xWhere2+'CUENTAID='+''''+edtCta3.Text+'''';
      if xWhere2<>'' then xWhereP:=xWhereP+' and '+'('+xWhere2+')';
   end;

   if xWhereP<>'' then xWhere:=xWhere+xWhereP;  //  Si hubo Parametros opcionales
   // Asigna Where: Fin

   // Calcula Periodo / mesinicio: INICIO
   if rbPer.Checked then begin  //Periodo
      wMes:=speMM.Text;                           //Ccosto por Periodo
      if length(wMes)<2 then wMes := '0'+wMes;
      wAnomm:=speAno.Text+wMes;
   end
   else begin
      DecodeDate(dbdtpFReg1.Date, Year, Month, Day);
      wMes := inttostr(Month);
      if length(wMes)<2 then wMes := '0'+inttostr(Month);
      wAno:=IntToStr(Year);
//      wFecha:='01/'+wMes+'/'+wAno;   // Fecha inicio pa movs faltantes
      wFecha:='DATE('+''''+wAno+'-'+wMes+'-01'+''''+')';   // Fecha inicio pa movs faltantes
//      DATE('1997-01-15')... p.ej.;

   end;
   // Calcula Periodo / mesinicio: FIN

   // Campos en 400: Inicio
   CampoSMN := 'SALDMN'+wMes;
   CampoDMN := 'DEBEMN'+wMes;
   CampoHMN := 'HABEMN'+wMes;
   CampoSME := 'SALDME'+wMes;
   CampoDME := 'DEBEME'+wMes;
   CampoHME := 'HABEME'+wMes;
   // Campos en 400: Fin

   if rbPer.Checked then begin  //Periodo
      xSQL:='Select CIAID, CUENTAID, CCOSID, CTADES, CCODES, '
        +'Sum('+CampoSMN+') as SALDMN, '
        +'Sum('+CampoDMN+') as DEBEMN, '+'Sum('+CampoHMN+') as HABEMN, '
        +'Sum('+CampoSME+') as SALDME, '
        +'Sum('+CampoDME+') as DEBEME, '+'Sum('+CampoHME+') as HABEME '
        +'From CNT402 Where '
        +'CIAID='+''''+dblcCia.Text+''''
        +' and ANO='+''''+speAno.Text+'''';
//        +' and TIPO='+''''+dblcNivel.Text+'''';
      xGrp:=' Group by CIAID, CUENTAID, CCOSID, CTADES, CCODES';
      xSQL:=xSQL+xWhere
           +xGrp
           +' Having Sum('+CampoSMN+')<>0 or Sum('+CampoDMN+')<>0 or Sum('+CampoHMN+') <> 0';  // Descarta los k no tienen Movms.
      cdsQry.Close;
      cdsQry.ProviderName:='prvCNT';
      cdsQry.DataRequest(xSQL);
      cdsQry.Open;
      cdsQry.First;
      if cbComp.Checked then begin   // Analitico: incluye comprobantes
         // Selecciona datos de 301 x periodo
         xSQL:='Select * from CNT301 Where '
              +'CIAID='+''''+dblcCia.Text+''''
              +' and CNTANOMM='+''''+wAnomm+''''
              +' and CCOSID<>'+''''+''+''''
              +' and CNTESTADO='+''''+'P'+''''+xWhere
              +' Order By CIAID,CUENTAID,CCOSID,TDIARID';
         cdsMovCNT2.Close;
         cdsMovCNT2.DataRequest(xSQL);
         cdsMovCNT2.Open;
         CalculaSaldos;
         cdsMovCNT2.First;         
      end;
   end
   else begin  // Mayor Por Rango de Fechas: Paso 1
      xSQL:='Select CIAID, CUENTAID, CCOSID, CTADES, CCODES, '
        +'Sum('+CampoSMN+') as SALDMN, '
        +'Sum('+CampoDMN+') as DEBEMN, '+'Sum('+CampoHMN+') as HABEMN, '
        +'Sum('+CampoSME+') as SALDME, '
        +'Sum('+CampoDME+') as DEBEME, '+'Sum('+CampoHME+') as HABEME '
        +'From CNT402 Where '
        +'CIAID='+''''+dblcCia.Text+''''
        +' and ANO='+''''+wAno+'''';
//        +' and TIPO='+''''+dblcNivel.Text+'''';
//        +' and CCOSID<>'+''''+''+'''';
      xGrp:=' Group by CIAID, CUENTAID, CCOSID, CTADES, CCODES';
      xSQL:=xSQL+xWhere
           +xGrp
           +' Having Sum('+CampoSMN+')<>0 or Sum('+CampoDMN+')<>0 or Sum('+CampoHMN+') <> 0';  // Descarta los k no tienen Movms.
      cdsQry.Close;
      cdsQry.ProviderName:='prvCNT';
      cdsQry.DataRequest(xSQL);
      cdsQry.Open;
      cdsQry.IndexFieldNames:='CUENTAID;CCOSID';
      cdsQry.ReadOnly:=False;
      cdsQry.First;
      IF wFecha<>datetostr(dbdtpFReg1.Date) then BEGIN  // Si fech_ini no es calendario
      // Selecciona datos de 301 k faltan en el periodo
      xSQL:='Select * from CNT301 Where '
           +'CIAID='+''''+dblcCia.Text+''''
           +' and CNTFCOMP>='+wFecha
           +' and CNTFCOMP<'+''''+datetostr(dbdtpFReg1.Date)+''''
           +' and CCOSID<>'+''''+''+''''
           +' and CNTESTADO='+''''+'P'+''''+xWhere
           +' Order By CIAID,CUENTAID,CCOSID,TDIARID';
      cdsMovCNT2.Close;
      cdsMovCNT2.DataRequest(xSQL);
      cdsMovCNT2.Open;
      cdsMovCNT2.First;
      While not(cdsMovCNT2.Eof) do begin
        xCia  :=cdsMovCNT2CIAID.Value;
        xCta  :=cdsMovCNT2CUENTAID.Value;
        xCCo  :=cdsMovCNT2CCOSID.Value;
        xTDMN:=0;   XTHMN:=0;   xTDME:=0;   XTHME:=0;
        While (not cdsMovCNT2.Eof)
              and (xCta=cdsMovCNT2CUENTAID.Value)
              and (xCCo=cdsMovCNT2CCOSID.Value) do Begin
            xTDMN := xTDMN + DM1.cdsMovCNT2CNTDEBEMN.AsFloat;
            xTHMN := xTHMN + DM1.cdsMovCNT2CNTHABEMN.AsFloat;
            xTDME := xTDME + DM1.cdsMovCNT2CNTDEBEME.AsFloat;
            xTHME := xTHME + DM1.cdsMovCNT2CNTHABEME.AsFloat;
            cdsMovCNT2.Next;
        End;
        cdsQry.SetKey;
        cdsQry.FieldbyName('CUENTAID').Value:=xCta;
        cdsQry.FieldbyName('CCOSID').Value  :=xCCo;
        if cdsQry.GotoKey then begin
           cdsQry.Edit;  // Actualiza Saldo Inicial
           cdsQry.FieldbyName('SALDMN').Value:=cdsQry.FieldbyName('SALDMN').AsFloat+(xTDMN-xTHMN);
           cdsQry.FieldbyName('SALDME').Value:=cdsQry.FieldbyName('SALDME').AsFloat+(xTDME-xTHME);
        end
        else begin  // No encontro el mov de 301 en 400===> lo inserta
           cdsQry.Insert;
           cdsQry.FieldbyName('CIAID').Value   :=xCia;
           cdsQry.FieldbyName('CUENTAID').Value:=xCta;
           cdsQry.FieldbyName('CCOSID').Value  :=xCCo;
           cdsQry.FieldbyName('CTADES').Value  :=cdsMovCNT2CTADES.Value;
           cdsQry.FieldbyName('CCODES').Value  :=cdsMovCNT2CCosDes.Value;
           cdsQry.FieldbyName('SALDMN').Value  :=(xTDMN-xTHMN);
           cdsQry.FieldbyName('SALDME').Value  :=(xTDME-xTHME);
        end;
      end;
      END;   // Fin: Si fech_ini no es calendario (P.ej: 01/03/1997  si es)

      // Selecciona datos de 301 k sobran en el periodo
      xSQL:='Select * from CNT301 Where '
           +'CIAID='+''''+dblcCia.Text+''''
           +' and CNTFCOMP>=date('+''''+formatdatetime('YYYY-MM-DD',dbdtpFReg1.DateTime)+''''+')'
           +' and CNTFCOMP<=date('+''''+formatdatetime('YYYY-MM-DD',dbdtpFReg2.DateTime)+''''+')'
           +' and CCOSID<>'+''''+''+''''
           +' and CNTESTADO='+''''+'P'+''''+xWhere
           +' Order By CIAID,CUENTAID,CCOSID,TDIARID';
      cdsMovCNT2.Close;
      cdsMovCNT2.DataRequest(xSQL);
      cdsMovCNT2.Open;
      if not(cbComp.Checked) then begin  // CCosto x Rango d Fechas: Paso 2
         cdsQry.ReadOnly:=False;
         cdsQry.First;
         while not DM1.cdsQry.EOF do begin
           cdsQry.Edit;
           cdsQry.FieldByName('DEBEMN').Value := 0;
           cdsQry.FieldByName('HABEMN').Value := 0;
           cdsQry.FieldByName('DEBEME').Value := 0;
           cdsQry.FieldByName('HABEME').Value := 0;
           cdsQry.Next;
         end;
         cdsMovCNT2.First;
         While not(cdsMovCNT2.Eof) do begin
            xCia  :=cdsMovCNT2CIAID.Value;
            xCta  :=cdsMovCNT2CUENTAID.Value;
            xCCo  :=cdsMovCNT2CCOSID.Value;
            xTDMN:=0;   xTHMN:=0;   xTDME:=0;   xTHME:=0;
            While (not cdsMovCNT2.Eof)
                     and (xCia=cdsMovCNT2CIAID.Value)
                     and (xCta=cdsMovCNT2CUENTAID.Value)
                     and (xCCo=cdsMovCNT2CCOSID.Value) do Begin
               xTDMN := xTDMN + DM1.cdsMovCNT2CNTDEBEMN.AsFloat;
               xTHMN := xTHMN + DM1.cdsMovCNT2CNTHABEMN.AsFloat;
               xTDME := xTDME + DM1.cdsMovCNT2CNTDEBEME.AsFloat;
               xTHME := xTHME + DM1.cdsMovCNT2CNTHABEME.AsFloat;
               cdsMovCNT2.Next;
            End;
            cdsQry.SetKey;
            cdsQry.FieldbyName('CUENTAID').Value:=xCta;
            cdsQry.FieldbyName('CCOSID').Value  :=xCCo;
            if cdsQry.GotoKey then begin
               cdsQry.Edit;  // Actualiza D - H
               cdsQry.FieldbyName('DEBEMN').Value:=cdsQry.FieldbyName('DEBEMN').AsFloat+xTDMN;
               cdsQry.FieldbyName('HABEMN').Value:=cdsQry.FieldbyName('HABEMN').AsFloat+xTHMN;
               cdsQry.FieldbyName('DEBEME').Value:=cdsQry.FieldbyName('DEBEME').AsFloat+xTDME;
               cdsQry.FieldbyName('HABEME').Value:=cdsQry.FieldbyName('HABEME').AsFloat+xTHME;
            end
            else begin  // No encontro el mov de 301 en 400===> lo inserta
               cdsQry.Insert;
               cdsQry.FieldbyName('CIAID').Value   :=xCia;
               cdsQry.FieldbyName('CUENTAID').Value:=xCta;
               cdsQry.FieldbyName('CCOSID').Value  :=xCCo;
               cdsQry.FieldbyName('CTADES').Value  :=cdsMovCNT2CTADES.Value;
               cdsQry.FieldbyName('CCODES').Value  :=cdsMovCNT2CCosDes.Value;
               cdsQry.FieldbyName('DEBEMN').Value  :=xTDMN;
               cdsQry.FieldbyName('HABEMN').Value  :=xTHMN;
               cdsQry.FieldbyName('DEBEME').Value  :=xTDME;
               cdsQry.FieldbyName('HABEME').Value  :=xTHME;
               cdsQry.FieldbyName('SALDMN').Value  :=0;
               cdsQry.FieldbyName('SALDME').Value  :=0;
            end;
         end;
      end
      else begin   // Mayor ANALITICO por Rango de Fechas: Paso 2
         CalculaSaldos;
         cdsMovCNT2.First;
      end;  // Fin Mayor ANALITICO por Rango de Fechas: Paso 2
   end;   // Fin Rango de Fechas

   pplblCia.Caption :=edtCia.Text;
   pplblCia2.Caption:=edtCia.Text;
   /// Asigna  Titulo
   pplblTitulo.Caption:=edtTit.Text;
   pplblTitulo2.Caption:=edtTit.Text;

   /// Asigna Fechas/Periodo
   if rbFech.Checked then begin   // por Rango Fechas
      pplblPerFech.Caption :='Del  '+datetostr(dbdtpFReg1.Date)
                    +'  Al  '+datetostr(dbdtpFReg2.Date);
      pplblPerFech2.Caption:='Del  '+datetostr(dbdtpFReg1.Date)
                    +'  Al  '+datetostr(dbdtpFReg2.Date);
   end
   else begin
      pplblPerFech.Caption :='          Periodo: '+speAno.Text+wMes;
      pplblPerFech2.Caption:='          Periodo: '+speAno.Text+wMes;
   end;

   case rgMoneda.ItemIndex of
   -1: begin
          ShowMessage('Ingrese Tipo de Moneda a Listar');
          rgMoneda.SetFocus;
       end;
   4 : begin // local  0
          pplblME.Visible:=False;
          pplME1.Visible:=False;
          pplME2.Visible:=False;
          pplblDME.Visible:=False;
          pplblHME.Visible:=False;
          pplblSME.Visible:=False;
//        ppdbcDME.Visible:=False;
//        ppdbcHME.Visible:=False;
          ppvSaldoME.Visible:=False;
          ppvTDME.Visible:=False;
          ppvTHME.Visible:=False;
          ppvTSME.Visible:=False;
          ppvTDMEpC.Visible:=False;
          ppvTHMEpC.Visible:=False;
          ppvTSMEpC.Visible:=False;
          pplG1.Width:=75;
          pplG2.Width:=75;

          pplG1.Left:=pplG1.Left+30;
          pplG2.Left:=pplG2.Left+30;
          pplblMN.Left:=pplblMN.Left+30;
          pplMN1.Left:=pplMN1.Left+30;
          pplMN2.Left:=pplMN2.Left+30;
          pplblDMN.Left:=pplblDMN.Left+30;
          pplblHMN.Left:=pplblHMN.Left+30;
          pplblSMN.Left:=pplblSMN.Left+30;
//          ppdbcDMN.Left:=ppdbcDMN.Left+30;
//          ppdbcHMN.Left:=ppdbcHMN.Left+30;
          ppvSaldoMN.Left:=ppvSaldoMN.Left+30;
          ppvTDMN.Left:=ppvTDMN.Left+30;
          ppvTHMN.Left:=ppvTHMN.Left+30;
          ppvTSMN.Left:=ppvTSMN.Left+30;
          ppvTDMNpC.Left:=ppvTDMNpC.Left+30;
          ppvTHMNpC.Left:=ppvTHMNpC.Left+30;
          ppvTSMNpC.Left:=ppvTSMNpC.Left+30;
       end;
   5 : begin  // Extranjera  1
          pplblMN.Visible:=False;
          pplMN1.Visible:=False;
          pplMN2.Visible:=False;
          pplblDMN.Visible:=False;
          pplblHMN.Visible:=False;
          pplblSMN.Visible:=False;
//          ppdbcDMN.Visible:=False;
//          ppdbcHMN.Visible:=False;
          ppvSaldoMN.Visible:=False;
          ppvTDMN.Visible:=False;
          ppvTHMN.Visible:=False;
          ppvTSMN.Visible:=False;
          ppvTDMNpC.Visible:=False;
          ppvTHMNpC.Visible:=False;
          ppvTSMNpC.Visible:=False;
          pplG1.Width:=75;
          pplG2.Width:=75;

          pplG1.Left:=pplG1.Left+37;
          pplG2.Left:=pplG2.Left+37;
          pplblME.Left:=pplblME.Left-30;
          pplME1.Left:=pplME1.Left-30;
          pplME2.Left:=pplME2.Left-30;
          pplblDME.Left:=pplblDME.Left-30;
          pplblHME.Left:=pplblHME.Left-30;
          pplblSME.Left:=pplblSME.Left-30;
//        ppdbcDME.Left:=ppdbcDME.Left-30;
//        ppdbcHME.Left:=ppdbcHME.Left-30;
          ppvSaldoME.Left:=ppvSaldoME.Left-30;
          ppvTDME.Left:=ppvTDME.Left-30;
          ppvTHME.Left:=ppvTHME.Left-30;
          ppvTSME.Left:=ppvTSME.Left-30;
          ppvTDMEpC.Left:=ppvTDMEpC.Left-30;
          ppvTHMEpC.Left:=ppvTHMEpC.Left-30;
          ppvTSMEpC.Left:=ppvTSMEpC.Left-30;
       end;
   2 : begin  // Ambas
       end;

   end;
{   if cbComp.Checked then dbgCNT2.Visible:=True;   //// para pruebas
//   else dbgQry.Visible:=True;}

   if cbComp.Checked then pprCCostoDet.Print
   else pprCCosto.Print;

   cdsMovCNT2.CancelUpdates;
   cdsQry.CancelUpdates;
   cdsQry.IndexFieldNames:='';
//   bbtnCanc.Click;
  End;
end;


procedure TFCtroCosto.CalculaSaldos;
begin
     With DM1 Do Begin
         cdsMovCNT2.First;
         While not(cdsQry.Eof) do begin
            xCia  :=cdsQry.FieldbyName('CIAID').Value;
            xCta  :=cdsQry.FieldbyName('CUENTAID').Value;
            xCCo  :=cdsQry.FieldbyName('CCOSID').Value;
            if cdsMovCNT2.Locate('CIAID;CUENTAID;CCOSID',VarArrayOf([xCia,xCta,xCCo]),[])
            then begin

{            cdsMovCNT2.SetKey;
            cdsMovCNT2CIAID.Value   :=xCia;
            cdsMovCNT2CUENTAID.Value:=xCta;
            cdsMovCNT2CCOSID.Value  :=xCCo;
            if cdsMovCNT2.GotoKey then begin}
               While (not cdsMovCNT2.Eof)
                     and (xCia=cdsMovCNT2CIAID.Value)
                     and (xCta=cdsMovCNT2CUENTAID.Value)
                     and (xCCo=cdsMovCNT2CCOSID.Value) do Begin
                  cdsMovCNT2.Edit;
                  cdsMovCNT2CNTSALDMN.Value:=cdsQry.FieldbyName('SALDMN').AsFloat;
                  cdsMovCNT2CNTSALDME.Value:=cdsQry.FieldbyName('SALDME').AsFloat;
                  cdsMovCNT2.Next;
               End;
            end
            else begin   // No tiene movimientos pero si saldo del mes anterior
               cdsMovCNT2.Insert;
               cdsMovCNT2CIAID.Value   :=xCia;
               cdsMovCNT2CUENTAID.Value:=xCta;
               cdsMovCNT2CCOSID.Value  :=xCCo;
               cdsMovCNT2CTADES.Text   :=copy(cdsQry.FieldbyName('CTADES').Text,1,15);
               cdsMovCNT2CCosDes.Text  :=copy(cdsQry.FieldbyName('CCODES').Text,1,15);
               cdsMovCNT2CNTSALDMN.Value:=cdsQry.FieldbyName('SALDMN').AsFloat;
               cdsMovCNT2CNTSALDME.Value:=cdsQry.FieldbyName('SALDME').AsFloat;
               cdsMovCNT2.Next;
            end;
            cdsQry.Next;
         end;
     End;
end;

procedure TFCtroCosto.ppvSxMNCalc(Sender: TObject; var Value: Variant);
begin
   ppdbtSAMN.DisplayFormat:='';
   if ppdbtSAMN.Text='' then Value:=0 else Value:=strtofloat(ppdbtSAMN.Text);
   xx:=xx+1;      // (p.ch.)
// Asigna Saldo Anterior a Saldo para el calculo del detalle
   if (ppGroup7.Breaking) or (xx=1) then
   begin
     SFMN:=Value;
     ppvTSAMN.Value:=ppvTSAMN.Value+SFMN;
   end;
end;

procedure TFCtroCosto.ppvSxMECalc(Sender: TObject; var Value: Variant);
begin
   ppdbtSAME.DisplayFormat:='';
   if ppdbtSAME.Text='' then Value:=0 else Value:=strtofloat(ppdbtSAME.Text);
// Asigna Saldo Anterior a Saldo Final para el calculo del detalle
   if (ppGroup7.Breaking) or (xx=1) then
   begin
     SFME:=Value;
     ppvTSAME.Value:=ppvTSAME.Value+SFME;
   end;
end;

procedure TFCtroCosto.ppvSaldoMNCalc(Sender: TObject; var Value: Variant);
Var
   xD,xH: Single;
begin
//   Saldo Final=Saldo Final + (D-H)
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
end;

procedure TFCtroCosto.ppvSaldoMECalc(Sender: TObject; var Value: Variant);
Var
   xD,xH: Single;
begin
//   Saldo Final=Saldo Final + (D-H)
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
end;

procedure TFCtroCosto.ppvTSMNCalc(Sender: TObject; var Value: Variant);
Var dd : Single;
begin
   ppdbtSAMN2.DisplayFormat:='';
   if ppdbtSAMN2.Text='' then dd:=0 else dd:=strtofloat(ppdbtSAMN2.Text);
//   dd:=ppvSAMN2.Value;   ////
   Value:=dd+(ppvTDMN.Value-ppvTHMN.Value);
end;

procedure TFCtroCosto.ppvTSMECalc(Sender: TObject; var Value: Variant);
Var dd : Single;
begin
   ppdbtSAME2.DisplayFormat:='';
   if ppdbtSAME2.Text='' then dd:=0 else dd:=strtofloat(ppdbtSAME2.Text);
   Value:=dd+(ppvTDME.Value-ppvTHME.Value);
end;

procedure TFCtroCosto.ppdbtSAMNPrint(Sender: TObject);
begin
     ppdbtSAMN.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppdbtDMN1Print(Sender: TObject);
begin
     ppdbtDMN1.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppdbtHMN1Print(Sender: TObject);
begin
     ppdbtHMN1.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppdbtSAMEPrint(Sender: TObject);
begin
     ppdbtSAME.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppdbtDME1Print(Sender: TObject);
begin
     ppdbtDME1.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppdbtHME1Print(Sender: TObject);
begin
     ppdbtHME1.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppdbtSAMN2Print(Sender: TObject);
begin
     ppdbtSAMN2.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppdbtSAME2Print(Sender: TObject);
begin
     ppdbtSAME2.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppvTSMNpCCalc(Sender: TObject; var Value: Variant);
begin
     Value:=ppvTSAMN.Value+(ppvTDMNpC.Value-ppvTHMNpC.Value);
end;

procedure TFCtroCosto.ppvTSAMNPrint(Sender: TObject);
begin
     ppvTSAMN.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppvTSAMEPrint(Sender: TObject);
begin
     ppvTSAME.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppvTSMEpCCalc(Sender: TObject; var Value: Variant);
begin
     Value:=ppvTSAME.Value+(ppvTDMEpC.Value-ppvTHMEpC.Value);
end;

procedure TFCtroCosto.ppvSaldoMN2Calc(Sender: TObject; var Value: Variant);
Var
   xD,xH, xS: Single;
begin
//   Saldo Final=Saldo Anterior + (D-H)
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
end;

procedure TFCtroCosto.ppdbtSAMN3Print(Sender: TObject);
begin
     ppdbtSAMN3.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppdbtDMNPrint(Sender: TObject);
begin
     ppdbtDMN.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppdbtHMNPrint(Sender: TObject);
begin
     ppdbtHMN.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppdbtSAME3Print(Sender: TObject);
begin
     ppdbtSAME3.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppdbtDMEPrint(Sender: TObject);
begin
     ppdbtDME.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppdbtHMEPrint(Sender: TObject);
begin
     ppdbtHME.DisplayFormat:='#,0.00;-#,0.00';
end;

procedure TFCtroCosto.ppvSaldoME2Calc(Sender: TObject; var Value: Variant);
Var
   xD, xH, xS: Single;
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
end;

procedure TFCtroCosto.cbNivelClick(Sender: TObject);
begin
    if cbNivel.Checked then begin
       cbComp.Checked:=False;
       cbComp.Enabled:=False;
       dblcNivel.Enabled:=True;
    end
    else begin
       dblcNivel.Text:='';
       cbComp.Enabled:=True;
///       dblcNivel.Value:=UltNivel;
       dblcNivel.Enabled:=False;
    end;

end;

procedure TFCtroCosto.dblcTDiarioExit(Sender: TObject);
begin
   edtTDiario.Text:='';
   if dblcTDiario.Text<>'' then edtTDiario.Text:=DM1.cdsTDiarioTDiarDes.Text;
end;

procedure TFCtroCosto.ckTDiarioClick(Sender: TObject);
begin
   if not(ckTDiario.Checked) then begin
      dblcTDiario.Text:='';  edtTDiario.Text:='';
      dblcTDiario.Enabled:=False;
   end
   else begin
      dblcTDiario.Enabled:=True;
   end;
end;

procedure TFCtroCosto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DM1.DCOM1.AppServer.ParamDSPGraba( '1', 'MOVCNT' );
end;

procedure TFCtroCosto.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

end.
