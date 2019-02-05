unit CNT205;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, wwdbdatetimepicker, Mask, wwdblook, wwdbedit, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, ComCtrls, Db, DBClient, wwclient, ppCtrls,
  ppBands, ppVar, ppPrnabl, ppClass, ppDB, ppCache, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppReport, oacontabiliza, oaVariables;

type
  TFDifCambio = class(TForm)
    Panel1: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    gbTCambio: TGroupBox;
    rbTCDia: TRadioButton;
    rbTCProm: TRadioButton;
    rbTCEspe: TRadioButton;
    meTCDia: TMaskEdit;
    meTCProm: TMaskEdit;
    dbeTCEspe: TwwDBEdit;
    gbCtasGP: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtCtaG: TEdit;
    edtCtaP: TEdit;
    gbComprob: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtPeriodo: TEdit;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    rbCmpContS: TRadioButton;
    rbCmpContN: TRadioButton;
    dbeNoComp: TwwDBEdit;
    edtGlosa: TEdit;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    pnlGenera: TPanel;
    lblProc: TLabel;
    pbGenera: TProgressBar;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    bbtnImCxP: TBitBtn;
    Label8: TLabel;
    dblcTipDoc: TwwDBLookupCombo;
    edtTipDoc: TEdit;
    Label9: TLabel;
    EdtNdoc: TEdit;
    Label10: TLabel;
    EdtSerie: TEdit;
    ppReport2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    rbTCPeriodo: TRadioButton;
    dbeTCPeriodo: TwwDBEdit;
    Label15: TLabel;
    dtpFComp: TwwDBDateTimePicker;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText12: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel3: TppLabel;
    ppLabel1: TppLabel;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppDBText13: TppDBText;
    ppLabel2: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel5: TppLabel;
    ppDBText15: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText14: TppDBText;
    ppLabel4: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    pplblcia: TppLabel;
    ppLabel76: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel77: TppLabel;
    ppLabel91: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppLabel75: TppLabel;
    ppLabel88: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel89: TppLabel;
    ppLabel80: TppLabel;
    ppDBText41: TppDBText;
    ppLabel83: TppLabel;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppLabel87: TppLabel;
    pplblEstado: TppLabel;
    ppLabel81: TppLabel;
    ppDBText6: TppDBText;
    ppLabel84: TppLabel;
    ppDBText42: TppDBText;
    ppLabel86: TppLabel;
    pplbltmoneda: TppLabel;
    ppLabel82: TppLabel;
    ppDBText47: TppDBText;
    ppLabel90: TppLabel;
    ppDBText5: TppDBText;
    ppLabel85: TppLabel;
    procedure dblcCiaExit(Sender: TObject);
    procedure rbTCDiaClick(Sender: TObject);
    procedure rbTCPromClick(Sender: TObject);
    procedure rbTCEspeClick(Sender: TObject);
    procedure dtpFCompExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);
    procedure Inserta301;
    procedure Conta_DifCambio;
    procedure ContaEnLinea401;
    procedure ContaEnLinea402;
    procedure FormActivate(Sender: TObject);
    procedure dbeTCEspeChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    Function AsientoCuadra: Boolean;
    Function Contabiliza(cds1,cds2:TwwClientDataSet): Boolean;
    procedure dbeTCEspeExit(Sender: TObject);
    procedure bbtnImCxPClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure meTCPromExit(Sender: TObject);
    procedure meTCDiaExit(Sender: TObject);
    procedure dblcTipDocExit(Sender: TObject);
    procedure rbTCPeriodoClick(Sender: TObject);
  private
    { Private declarations }
    tcambio:string;
    procedure AsientoCXP;
    procedure AsientoCXC;
    procedure AsientoCajayBancos;


  public
    { Public declarations }
  end;

  procedure CNDiferenciaCambio; stdcall;

exports
  CNDiferenciaCambio;


var
  FDifCambio: TFDifCambio;
  xSQL, xCCo, xDH, xAux, xClAux, xFlAuxG, xFlCCosG, xFlAuxP, xFlCCosP : String;
  xMes, xWhere, xCuenta, xTDiario, xTDiarDes, CtaDesG, CtaDesP, xCtaDes, xCCoDes, xAuxDes: String;
  wAno, wMes, xDia: Word;
  nn: SmallInt;
  xTDebeMN, xTDebeME, xTHabeMN, xTHabeME, xDif, TC: DOUBLE;
  xSaldMNs, xSaldMEs, xDebeMN,xHabeMN,xDebeME,xHabeME, xSaldMN, xSaldME, xCia, xAno : String;

implementation

uses CNTDM;

{$R *.DFM}

procedure CNDiferenciaCambio;
var
   xSQL : String;
begin
   if DMCNT=nil then exit;
  if not DMCNT.DCOM1.Connected then Exit;
   try
      FDifCambio:=TFDifCambio.Create( Application );
      FDifCambio.ShowModal;
   Finally
      FDifCambio.Free;
   End;
end;


procedure TFDifCambio.FormActivate(Sender: TObject);
var
	xSQL:string;
begin
	Screen.Cursor:=crHourGlass;
  FVariables.ConfiguraForma( Self );
  xSQL:=         'SELECT CIAID, CUENTAID, CNTMTOORI, CNTFVCMTO, CNTFEMIS, CNTGLOSA, CNTDH, '
                + 'AUXID, CLAUXID, DOCID, CNTSERIE, CNTNODOC, CCOSID, CNTDEBEMN, CNTDEBEME, '
                + 'CNTHABEMN, CNTHABEME, TDIARID, CNTCUADRE, CNTESTADO, CNTCOMPROB, CNTMTOLOC, '
                + 'CNTMTOEXT, CTADES, AUXDES, DOCDES, CCOSDES, TDIARDES, CNTANO, CNTANOMM, '
                + 'CNTLOTE, TMONID, CNTTCAMBIO, CNTTS, CNTMODDOC, CNTFCOMP, CNTUSER, CNTFREG, '
                + 'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
                + 'FROM CNT301 '
                + 'WHERE CIAID=''ZZ'' and TDIARID=''ZZ'' AND CNTANOMM=''ZZYYYY''';
  DMCNT.cdsMovCnt1.Close;
  DMCNT.cdsMovCnt1.IndexFieldNames:='';
  DMCNT.cdsMovCnt1.DataRequest(xSQL);
  DMCNT.cdsMovCnt1.Open;

//  DMCNT.cdsCuenta.IndexFieldNames :='CIAID;CUENTAID';
  DMCNT.cdsRCuenta.IndexFieldNames:='CIAID;ANO;TDIARID;CUENTAID;CLAUXID;AUXID';
  DMCNT.cdsRCCosto.IndexFieldNames:='CIAID;ANO;TDIARID;CCOSID;CUENTAID';
  bbtnImCxP.visible:=True;
  Screen.Cursor:=crDefault;
end;

procedure TFDifCambio.dblcCiaExit(Sender: TObject);
var
  xSQL : String;
begin
  edtCia.Text:='';
  if dblcCia.Text<>'' then
  	edtCia.Text:=DMCNT.cdsCia.FieldByName('CIADES').AsString;
  if length(edtCia.Text)=0 then
  begin
  	ShowMessage('Falta Definición de Compañía');
    dblcCia.SetFocus;
  end;
	Screen.Cursor:=crHourGlass;
  xWhere :='CIAID='+''''+dblcCia.Text+''''+' AND CTA_DIFGP='+''''+'G'+'''';
//  xWhere :='CIAID='+''''+dblcCia.Text+''''+' AND CTA_SIGNO='+''''+'G'+'''';
  edtCtaG.Text:= DMCNT.DisplayDescrip('PrvTGE','TGE202','CUENTAID,CTAABR,CTA_AUX,CTA_CCOS',xWhere,'CUENTAID');
  CtaDesG:=DMCNT.cdsQry.FieldByName('CTAABR').Text;
  xFlAuxG :=DMCNT.cdsQry.FieldByName('CTA_AUX').Text;
  xFlCCosG:=DMCNT.cdsQry.FieldByName('CTA_CCOS').Text;

  xWhere :='CIAID='+''''+dblcCia.Text+''''+' AND CTA_DIFGP='+''''+'P'+'''';
//  xWhere  :='CIAID='+''''+dblcCia.Text+''''+' AND CTA_SIGNO='+''''+'P'+'''';
  edtCtaP.Text:= DMCNT.DisplayDescrip('PrvTGE','TGE202','CUENTAID,CTAABR,CTA_AUX,CTA_CCOS',xWhere,'CUENTAID');
  CtaDesP :=DMCNT.cdsQry.FieldByName('CTAABR').Text;
  xFlAuxP :=DMCNT.cdsQry.FieldByName('CTA_AUX').Text;
  xFlCCosP:=DMCNT.cdsQry.FieldByName('CTA_CCOS').Text;


  xSQL:='Select * from TGE202 Where CIAID='''+dblcCia.text+'''';
  DMCNT.cdsCuenta.Close;
  DMCNT.cdsCuenta.DataRequest( xSQL );
  DMCNT.cdsCuenta.Open;

	Screen.Cursor:=crDefault;
end;

procedure TFDifCambio.rbTCDiaClick(Sender: TObject);
begin
	if rbTCDia.Checked then
  begin
  	dbeTCEspe.Enabled:=False;
    meTCProm.Text:='';
    dbeTCEspe.Text:='';
    xWhere := 'Fecha='+''''+formatdatetime(wFormatFecha,date)+''' AND TMONID='''+DMCNT.wTMonExt+'''';
    meTCDia.Text:= DMCNT.DisplayDescrip('PrvTGE','TGE107','TCAMVBC',xWhere,'TCAMVBC');
    tcambio:=meTCDia.Text;
    if length(meTCDia.Text)=0 then
    begin
    	ShowMessage('No hay registro de Tipo de Cambio para hoy');
      rbTCDia.Checked:=False;
    end;
  end;
end;
                                                                        
procedure TFDifCambio.rbTCPromClick(Sender: TObject);
var
	xCampo: String;
begin
  if rbTCProm.Checked then
  begin
  	DecodeDate(date, wAno, wMes, xDia);
    dbeTCEspe.Enabled:=False;
    meTCDia.Text:='';
    dbeTCEspe.Text:='';
    xCampo := 'AVG(TCAMVBC) AS PROM';
    if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
    begin
    	xWhere := 'MONTH(FECHA)='+inttostr(wMes);
    end
    else
    if SRV_D = 'ORACLE' then
    begin
    	xWhere := 'TO_NUMBER(TO_CHAR(FECHA,''MM''))='+inttostr(wMes);
    end;

    meTCProm.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE107',xCampo,xWhere,'PROM');
    tcambio:=meTCProm.Text;
    if length(meTCProm.Text)=0 then
    begin
    	ShowMessage('No hay registro de Tipo de Cambio en el mes');
      rbTCProm.Checked:=False;
    end;
  end;
end;

procedure TFDifCambio.rbTCEspeClick(Sender: TObject);
begin
	if rbTCEspe.Checked then
  begin
  	meTCDia.Text:='';
    meTCProm.Text:='';
    dbeTCEspe.Enabled:=True;
    dbeTCEspe.SetFocus;
  end;
end;

procedure TFDifCambio.dtpFCompExit(Sender: TObject);
var

xvar,xwhere : String;
begin
//   if bbtnCanc.focused then exit;
  // if dbeTCEspe.focused then exit;
	if dtpFComp.date=0 then
  begin
  	ShowMessage('Registre la Fecha del Comprobante');
   dtpFComp.setfocus;
   exit;
  end;
 	// calcula valor de periodo aaaamm tomando como base la fecha ingresada
  DecodeDate(dtpFComp.Date, wAno, wMes, xDia);
  xMes := inttostr(wMes);
  if wMes<10 then
  	xMes := '0'+inttostr(wMes);
  edtPeriodo.Text := IntToStr(wAno)+xMes;
  edtndoc.text:=edtperiodo.text;
  edtserie.text:='000';
  dblcTipDoc.text:='23';
  xwhere := 'DOCID='''+dblcTipDoc.Text+'''';
  edtTipDoc.text:= DMCNT.DisplayDescrip('PrvTGE','TGE110','DOCDES',xwhere ,'DOCDES'); //DMCNT.cdsTDiarioTDiarDes.Text;

  xwhere := 'CIAID='''+dblcCia.Text+''' AND CNTLOTE IN (''DIFC'',''DCCC'',''DCCB'') AND CNTANOMM='''+edtPeriodo.TEXT+'''';
  xvar:= DMCNT.DisplayDescrip('PrvTGE','CNT304','CNTESTADO,CNTCUADRE,TDIARID,CNTCOMPROB,CNTGLOSA',xwhere ,'CNTESTADO'); //DMCNT.cdsTDiarioTDiarDes.Text;
  bbtnOk.Enabled:=True;
  bbtnImCxP.Visible:=True;
  dblcTDiario.Enabled:=True;
  dbeNoComp.Enabled:=True;
  edtGlosa.Enabled:=True;
  rbCmpContN.Enabled:=True;
  rbCmpContS.Enabled:=True;
  rbCmpContS.Checked:=False;
  rbCmpContN.checked:=True;


  if xvar='C' then
  Begin
    dblcTDiario.text:=DMCNT.cdsQry.fieldbyname('TDIARID').asstring;
    dbeNoComp.text:=DMCNT.cdsQry.fieldbyname('CNTCOMPROB').asstring;
    edtglosa.text:=DMCNT.cdsQry.fieldbyname('CNTGLOSA').asstring;
    xwhere := 'TDIARID='''+DMCNT.cdsQry.fieldbyname('TDIARID').asstring+'''';
    edtTDiario.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE104','TDIARDES',xwhere ,'TDIARDES');
    bbtnOk.Enabled:=False;
    Showmessage('Periodo Contabilizado');
    bbtnImCxP.Enabled:=True;
    dblcTDiario.Enabled:=False;
    rbCmpContN.checked:=False;
    rbCmpContS.Checked:=True;
    dbeNoComp.Enabled:=False;
    edtGlosa.Enabled:=False;
    rbCmpContN.Enabled:=False;
    rbCmpContS.Enabled:=False;

  End;
	///Valida Periodo Cerrado... Inicio///
  xSQL :='SELECT  PER'+Copy(edtperiodo.text,5,2)
          +' AS PERIODO FROM TGE154 WHERE CIAID='''+dblcCia.Text+''''
          +'AND MODULO=''CNT'' '
          +'AND ANO='''+inttostr(wAno)
          +'''';
          DMCNT.cdsQry.close;
          DMCNT.cdsQry.datarequest(xSQL);
          DMCNT.cdsQry.open;

//  if (dtpFComp.Date)<=(DMCNT.BuscaFecha('PrvTGE','TGE154','FECCIERRE',xWhere,'FECCIERRE')) then
 bbtnImCxP.Enabled:=True;
 if DMCNT.cdsQry.FieldByName('PERIODO').asstring='S' then
  begin
   dtpFComp.setfocus;
  	ShowMessage('Fecha no válida... Periodo Cerrado');
   dtpFComp.SetFocus;
   bbtnOk.Enabled:=False;
   bbtnImCxP.Enabled:=False;

  end;

  edtGlosa.text:='DIFERENCIA DE CAMBIO';
	///Valida Periodo Cerrado... Fin  ///
end;

procedure TFDifCambio.dblcTDiarioExit(Sender: TObject);
begin
  if dtpFComp.focused then  Exit;
	edtTDiario.Text:='';
  if dblcTDiario.Text<>'' then
  	edtTDiario.Text:=DMCNT.cdsTDiario.FieldByName('TDIARDES').AsString;
  if length(edtTDiario.Text)=0 then
  begin
  	ShowMessage('Falta Definición de Tipo de Diario');
    dblcTDiario.SetFocus;
  end;
  if (length(edtTDiario.Text)>0) and (length(edtPeriodo.Text)=6) then
  begin
  	//último número de comprobante incrementado en 1 para el tipo de diario escogido
    xWhere :='CIAID='+''''+dblcCia.Text+''' '
            +'AND TDIARID='''+dblcTDiario.Text+''' '
            +'AND CNTANOMM='''+edtPeriodo.Text+'''';
    dbeNoComp.Text:=DMCNT.UltimoNum('prvCNT','CNT301','CNTCOMPROB',xWhere);
    dbeNoComp.Text:=DMCNT.strzero(dbeNoComp.Text,10);
    dbeNoComp.SetFocus;
  end;
end;

procedure TFDifCambio.dbeNoCompExit(Sender: TObject);
begin
  if (dbeNoComp.Text='') then
  begin
  	ShowMessage('Ingrese Número de Comprobante');
    dbeNoComp.SetFocus;
  end;
  dbeNoComp.Text:=DMCNT.strzero(dbeNoComp.Text,10);
end;

procedure TFDifCambio.bbtnOkClick(Sender: TObject);
var
	xx, xSaldMN, xSaldME , Ssql: String;

begin
  Screen.Cursor:=crHourGlass;
  if not(rbTCDia.Checked) and not(rbTCProm.Checked) and
     (not(rbTCEspe.Checked) or (dbeTCEspe.Text='')) and not(rbTCPeriodo.checked) then
  begin
    Screen.Cursor:=CrDefault;
  	 ShowMessage('Ingrese Tipo de Cambio');
    exit;
  end;
  if  Length(dblcTDiario.text)=0 then
  begin
    Screen.Cursor:=CrDefault;
  	 ShowMessage('Ingrese Tipo de Diario');
    dblcTDiario.setfocus;
    exit;
  end;

  if (edtCtaG.Text='') or (edtCtaP.Text='') then
  begin
   Screen.Cursor:=CrDefault;
  	ShowMessage('No Existe Cuenta de Ganacias y/o de Perdidas Definida');
    exit;
  end;
  if rbTCDia.Checked  then TC:=strtofloat(meTCDia.Text);
  if rbTCProm.Checked then TC:=strtofloat(meTCProm.Text);
  if rbTCEspe.Checked then TC:=strtofloat(dbeTCEspe.Text);
  if rbTCPeriodo.Checked then TC:=strtofloat(dbeTCPeriodo.Text);

  tcambio:=floattostr(TC);
  XSQL:='DELETE FROM CNT303 WHERE CIAID='''+dblcCia.text
        +''' AND CNTANOMM='''+edtPeriodo.TEXT+''' AND CNTLOTE IN (''DIFC'',''DCCC'',''DCCB'')';
         DMCNT.cdsQRY.Close;
         DMCNT.cdsQRY.DataRequest(xSQL);
         try
         DMCNT.cdsQRY.Execute;
         except
         end;

  XSQL:='DELETE FROM CNT304 WHERE CIAID='''+dblcCia.text
        +''' AND CNTANOMM='''+edtPeriodo.TEXT+''' AND CNTLOTE IN (''DIFC'',''DCCC'',''DCCB'')';
         DMCNT.cdsQRY.Close;
         DMCNT.cdsQRY.DataRequest(xSQL);
         try

         DMCNT.cdsQRY.Execute;
         except
         end;

  AsientoCXP;

  AsientoCajayBancos;

  AsientoCXC   ;


  If rbCmpContS.Checked then
  Begin

     SSQL:='UPDATE CNT304  SET CNTCUADRE=''S'', CNTESTADO=''C'' WHERE   CIAID='''+dblcCIA.TEXT
         +''' AND CNTANOMM='''+edtperiodo.text+''' AND CNTLOTE IN(''DIFC'',''DCCC'',''DCCB'')' ;
     DMCNT.cdsQry4.Close;
     DMCNT.cdsQry4.DataRequest(Ssql);
     try
       DMCNT.DCOM1.AppServer.EjecutaQry(SSQL) ;
     except
     end ;
     SSQL:='UPDATE CNT303  SET CNTCUADRE=''S'' , CNTESTADO=''C'' WHERE   CIAID='''+dblcCIA.TEXT
         +''' AND CNTANOMM='''+edtperiodo.text+'''AND CNTLOTE IN(''DIFC'',''DCCC'',''DCCB'')' ;
     DMCNT.cdsQry4.Close;
     DMCNT.cdsQry4.DataRequest(Ssql);
     try
       DMCNT.DCOM1.AppServer.EjecutaQry(SSQL) ;
     except
     end ;
   END;

   bbtnOk.Enabled:=False;
   Screen.Cursor:=CrDefault;
   Showmessage('Proceso Terminado');
end;

procedure TFDifCambio.AsientoCXP;

var
   xCNTReg ,xconta : integer;
   xmes : String;
   XSQL1, XSQL2 : String;
   WHReg   : TTime;
begin


   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
        xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
        +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFComp.Date)+''')';
   end;
   if (SRV_D = 'ORACLE') then
   begin
       xSQL:='SELECT * FROM TGE114 WHERE FECHA='
         +'TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFComp.Date)+''')';
   end;
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest( xSQL );
   DMCNT.cdsQry.Open;

   xmes:=cOpy(edtperiodo.text,5,2);

   wHreg  :=Time;

   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   Begin
    XSQL:='INSERT INTO CNT303 (CIAID, TDIARID, TDIARDES, CUENTAID, CNTCOMPROB, CTADES, CNTANO, '
         +  'CNTANOMM, CNTDEBEMN, CNTHABEMN, CNTLOTE, CNTUSER, CNTFREG, CNTHREG, '
         +  'CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         +  'CNTDH, CNTGLOSA, CNTTCAMBIO, CNTDEBEME, CNTHABEME, CNTFCOMP, CLAUXID, AUXID, '
         +  'DOCID, CNTSERIE, CNTNODOC, TMONID ) '

         +'SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT+''' ,A.CUENTAID AS CUENTA, '
         +  ''''+dbeNoComp.text+''' ,MAX(B.CTADES) AS CTADES, '
         +  ''''+COPY(edtPeriodo.text,1,4)+''', '''+edtPeriodo.TEXT+''', '
         +  'CASE WHEN ((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)))<0 THEN (-1)*((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))) ELSE 0 END AS DEBE, '
         +  'CASE WHEN ((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)))>0 THEN ((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))) ELSE 0 END AS HABE, '
         +' ''DIFC'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',CURRENT DATE,CURRENT TIME, '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' CASE WHEN ((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)))>0 THEN ''H'' ELSE ''D'' END  as CNTDH,'''+edtGlosa.text+' DE CTAS POR PAGAR'
         +''','+tcambio
         +' ,(CASE WHEN ((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)))<0 THEN (-1)*((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))) ELSE 0 END)/'+TCAMBIO
         +' ,(CASE WHEN ((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)))>0 THEN ((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))) ELSE 0 END)/'+TCAMBIO
         +' , DATE('''+formatdatetime(wFormatFecha,dtpFComp.date)+'''), A.CLAUXID  AS CLAUXID, A.AUXID AS PROV,A.DOCID,A.CNTSERIE,A.CNTNODOC,'''
         + DMCNT.wTMonLoc+''''
         +' FROM CNT301 A, TGE202 B , '
         +' (SELECT A.CUENTAID,A.CLAUXID,A.CNTTCAMBIO,A.CIAID,A.DOCID,A.CNTSERIE,A.CNTNODOC,A.AUXID,A.CNTANOMM '
         +'  FROM CNT301 A, TGE202 B '
         +'  WHERE A.CIAID=B.CIAID  AND A.CUENTAID=B.CUENTAID '
// JCC 22/11/2003         +'  AND  A.CIAID='''+dblcCia.TEXT+''' AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXP'''
         +'  AND  A.CIAID='''+dblcCia.TEXT+''' AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXP'''
         +'  AND A.CNTHABEME>0 AND A.CNTANOMM<='''+edtPeriodo.TEXT+''' AND A.TMONID='''+DMCNT.WTMONEXT+''' AND A.CNTESTADO=''P'' AND A.CNTCUADRE=''S''  ) G '
         +' WHERE A.CIAID=B.CIAID AND A.CIAID=G.CIAID '
         +' AND A.CUENTAID=B.CUENTAID  AND A.CUENTAID=G.CUENTAID '
         +' AND A.AUXID=G.AUXID AND A.CLAUXID=G.CLAUXID AND A.DOCID=G.DOCID AND A.CNTSERIE=G.CNTSERIE AND A.CNTNODOC=G.CNTNODOC '
// JCC 22/11/2003         +' AND  A.CIAID='''+dblcCia.TEXT+''' AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXP'''
         +' AND  A.CIAID='''+dblcCia.TEXT+''' AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXP'''
         +' AND A.CNTANOMM<='''+edtperiodo.text+''' AND A.TMONID='''+DMCNT.WTMONEXT+''' '
         +' GROUP BY A.CIAID,A.CUENTAID, A.CLAUXID,A.AUXID,A.DOCID,A.CNTSERIE,A.CNTNODOC,A.TMONID '
         +' HAVING SUM(CNTHABEME-CNTDEBEME)-SUM(CNTDEBEME)<>0 '
         +' AND ( SUM(CNTDEBEME)>=0 AND SUM(CNTHABEME-CNTDEBEME)>=0) '
         +' UNION ALL ';
         XSQL1:=' SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT
         +''' ,CASE WHEN (SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))>0 THEN '''+edtCtaP.text+''' ELSE '''+edtCtaG.text+''' END  AS CUENTA,'''
         +dbeNoComp.text
         +''' ,MAX(B.CTADES) AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' CASE WHEN (SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))>0 THEN (SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)) ELSE 0 END AS DEBE, '
         +' CASE WHEN (SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))<0 THEN (-1)*((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))) ELSE 0 END AS HABE, '
         +' ''DIFC'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',CURRENT DATE ,CURRENT TIME , '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' CASE WHEN ((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)))>0 THEN ''D'' ELSE ''H'' END AS  CNTDH,'''+edtGlosa.text+' DE CTAS POR PAGAR'
         +''','+tcambio
         +' ,(CASE WHEN (SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))>0 THEN (SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)) ELSE 0 END)/'+TCAMBIO
         +' ,(CASE WHEN (SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))<0 THEN (-1)*((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))) ELSE 0 END)/'+TCAMBIO
         +' , DATE('''+formatdatetime(wFormatFecha,dtpFComp.date)+'''),A.CLAUXID AS CLAUXID,A.AUXID AS PROV, '
         +' A.DOCID,A.CNTSERIE AS CPSERIE ,A.CNTNODOC AS CPNODOC,'''
         + DMCNT.wTMonLoc+''''
         +' FROM CNT301 A, TGE202 B , '
         +' (SELECT A.CUENTAID,A.CLAUXID,A.CNTTCAMBIO,A.CIAID,A.DOCID,A.CNTSERIE,A.CNTNODOC,A.AUXID,A.CNTANOMM '
         +'  FROM CNT301 A, TGE202 B '
         +'  WHERE A.CIAID=B.CIAID  AND A.CUENTAID=B.CUENTAID '
// JCC 22/11/2003         +'  AND  A.CIAID='''+dblcCia.TEXT+''' AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXP''  '
         +'  AND  A.CIAID='''+dblcCia.TEXT+''' AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXP''  '
         +'  AND A.CNTHABEME>0 AND A.CNTANOMM<='''+edtPeriodo.TEXT+''' AND A.TMONID='''+DMCNT.WTMONEXT+''' AND A.CNTESTADO=''P'' AND A.CNTCUADRE=''S'' ) G '
         +' WHERE A.CIAID=B.CIAID AND A.CIAID=G.CIAID '
         +' AND A.CUENTAID=B.CUENTAID  AND A.CUENTAID=G.CUENTAID '
         +' AND A.AUXID=G.AUXID AND A.CLAUXID=G.CLAUXID AND A.DOCID=G.DOCID AND A.CNTSERIE=G.CNTSERIE AND A.CNTNODOC=G.CNTNODOC '
// JCC 22/11/2003         +' AND  A.CIAID='''+dblcCia.TEXT+''' AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXP'''
         +' AND  A.CIAID='''+dblcCia.TEXT+''' AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXP'''
         +' AND A.CNTANOMM<='''+edtperiodo.text+''' AND A.TMONID='''+DMCNT.WTMONEXT+''' '
         +' GROUP BY A.CIAID,A.CUENTAID, A.CLAUXID,A.AUXID,A.DOCID,A.CNTSERIE,A.CNTNODOC,A.TMONID '
         +' HAVING SUM(CNTHABEME-CNTDEBEME)-SUM(CNTDEBEME)<>0 '
         +' AND ( SUM(CNTDEBEME)>=0 AND SUM(CNTHABEME-CNTDEBEME)>=0) ';
   End;

   if (SRV_D = 'ORACLE') then
   Begin
      XSQL:='INSERT INTO CNT303 (CIAID,TDIARID,TDIARDES, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM,CNTDEBEMN'
         +' ,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
         +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
         +' ,CNTDH,CNTGLOSA,CNTTCAMBIO,CNTDEBEME,CNTHABEME,CNTFCOMP,CLAUXID,AUXID '
         +' ,DOCID,CNTSERIE,CNTNODOC, TMONID) '

         +'SELECT A.CIAID, '''+dblcTDiario.TEXT+''', '''+edtTDiario.TEXT+''', A.CUENTAID AS CUENTA, '
         +  ''''+dbeNoComp.text+''', MAX(B.CTADES) AS CTADES, '
         +  ''''+COPY(edtPeriodo.text,1,4)+''', '''+edtPeriodo.TEXT+''', '
         +  'DECODE(GREATEST((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)),0),0,(-1)*((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))),0) AS DEBE, '
         +  'DECODE(LEAST((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)),0),0,((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))),0) AS HABE, '
         +  '''DIFC'' AS CNTLOTE, '''+DMCNT.wUsuario+''', SYSDATE, SYSDATE, '
         +  ''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +  ''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +  ''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +  ''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +  ''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +  ''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +  ''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +  ''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString +''', '
         +  'DECODE(LEAST((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)),0),0,''H'',''D'') as CNTDH, '
         +  ''''+edtGlosa.text+' DE CTAS POR PAGAR'','+tcambio+', '
         +  '(DECODE(GREATEST((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)),0),0,(-1)*((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))),0))/'+TCAMBIO+', '
         +  '(DECODE(LEAST((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)),0),0,((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))),0))/'+TCAMBIO+', '
         +  'TO_DATE('''+dtpFComp.TEXT+'''), A.CLAUXID AS CLAUXID, A.AUXID AS PROV, A.DOCID, A.CNTSERIE, '
         +  'A.CNTNODOC, '''+DMCNT.wTMonLoc+''' '
         +'FROM CNT301 A, TGE202 B, '

         +' ( SELECT A.CUENTAID, A.CLAUXID, A.CNTTCAMBIO, A.CIAID, A.DOCID, A.CNTSERIE, A.CNTNODOC, A.AUXID, A.CNTANOMM '
         +   'FROM CNT301 A, TGE202 B '
         +   'WHERE A.CIAID='''+dblcCia.TEXT+''' '
         +     'AND A.CNTANOMM>='''+Copy(edtPeriodo.TEXT,1,4)+'00'' AND A.CNTANOMM<='''+edtPeriodo.TEXT+''' '
         +     'AND A.TMONID='''+DMCNT.WTMONEXT+''' AND A.CNTESTADO=''P'' AND A.CNTCUADRE=''S'' AND A.CNTHABEME>0 '
// 22/11/2003         +     'AND A.CIAID=B.CIAID  AND A.CUENTAID=B.CUENTAID AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' '
         +     'AND A.CIAID=B.CIAID  AND A.CUENTAID=B.CUENTAID AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' '
         +     'AND B.CTAMODDIFC=''CXP'' ) G '

         +' WHERE A.CIAID='''+dblcCia.TEXT+''' '
         +   'AND A.CNTANOMM>='''+Copy(edtPeriodo.TEXT,1,4)+'00'' AND A.CNTANOMM<='''+edtPeriodo.TEXT+''' '
         +   'AND A.TMONID='''+DMCNT.WTMONEXT+''' '

// JCC 22/11/2003         +   'AND A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' '
         +   'AND A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' '
         +   'AND B.CTAMODDIFC=''CXP'' '

         +   'AND A.CIAID=G.CIAID AND A.CUENTAID=G.CUENTAID AND A.AUXID=G.AUXID AND A.CLAUXID=G.CLAUXID '
         +   'AND A.DOCID=G.DOCID AND A.CNTSERIE=G.CNTSERIE AND A.CNTNODOC=G.CNTNODOC '
         +' GROUP BY A.CIAID, A.CUENTAID, A.CLAUXID, A.AUXID, A.DOCID, A.CNTSERIE, A.CNTNODOC, A.TMONID '
         +' HAVING SUM(CNTHABEME-CNTDEBEME)-SUM(CNTDEBEME)<>0 '
         +    'AND (SUM(CNTDEBEME)>=0 AND SUM(CNTHABEME-CNTDEBEME)>=0) '
         +' UNION ALL ';

         XSQL1:=' SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT
         +''' ,DECODE(LEAST((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)),0),0,'''+edtCtaP.text+''','''+edtCtaG.text+''') AS CUENTA,'''
         +dbeNoComp.text
         +''' ,MAX(B.CTADES) AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' DECODE(LEAST((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)),0),0,(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)),0) AS DEBE, '
         +' DECODE(GREATEST((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)),0),0,(-1)*((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))),0) AS HABE, '
         +' ''DIFC'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',SYSDATE,SYSDATE, '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' DECODE(LEAST((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)),0),0,''D'',''H'') CNTDH,'''+edtGlosa.text+' DE CTAS POR PAGAR'
         +''','+tcambio
         +' ,(DECODE(LEAST((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)),0),0,(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)),0))/'+TCAMBIO
         +' ,(DECODE(GREATEST((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME)),0),0,(-1)*((SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTHABEME)-SUM(A.CNTDEBEME))),0))/'+TCAMBIO
         +' , TO_DATE('''+dtpFComp.TEXT+'''),A.CLAUXID AS CLAUXID,A.AUXID AS PROV, '
         +' A.DOCID,A.CNTSERIE AS CPSERIE ,A.CNTNODOC AS CPNODOC,'''
         + DMCNT.wTMonLoc+''''
         +' FROM CNT301 A, TGE202 B , '
         +' (SELECT A.CUENTAID,A.CLAUXID,A.CNTTCAMBIO,A.CIAID,A.DOCID,A.CNTSERIE,A.CNTNODOC,A.AUXID,A.CNTANOMM '
         +'  FROM CNT301 A, TGE202 B '
         +'  WHERE A.CIAID=B.CIAID  AND A.CUENTAID=B.CUENTAID '
// JCC 22/11/2003         +'  AND  A.CIAID='''+dblcCia.TEXT+''' AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXP'' AND A.CNTESTADO=''P'' AND A.CNTCUADRE=''S'''
         +'  AND  A.CIAID='''+dblcCia.TEXT+''' AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXP'' AND A.CNTESTADO=''P'' AND A.CNTCUADRE=''S'''
         +'  AND A.CNTHABEME>0 '
         + ' AND A.CNTANOMM>='''+Copy(edtPeriodo.TEXT,1,4)+'00'' AND A.CNTANOMM<='''+edtPeriodo.TEXT+''' '
         + ' AND A.TMONID='''+DMCNT.WTMONEXT+'''  ) G '
         +' WHERE A.CIAID=B.CIAID AND A.CIAID=G.CIAID '
         +' AND A.CUENTAID=B.CUENTAID  AND A.CUENTAID=G.CUENTAID '
         +' AND A.AUXID=G.AUXID AND A.CLAUXID=G.CLAUXID AND A.DOCID=G.DOCID AND A.CNTSERIE=G.CNTSERIE AND A.CNTNODOC=G.CNTNODOC '
// JCC 22/11/2003         +' AND  A.CIAID='''+dblcCia.TEXT+''' AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXP'''
         +' AND  A.CIAID='''+dblcCia.TEXT+''' AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXP'''
         +' AND A.CNTANOMM>='''+Copy(edtPeriodo.TEXT,1,4)+'00'' AND A.CNTANOMM<='''+edtPeriodo.TEXT+''' '
         +' AND A.TMONID='''+DMCNT.WTMONEXT+''' '
         +' GROUP BY A.CIAID,A.CUENTAID, A.CLAUXID,A.AUXID,A.DOCID,A.CNTSERIE,A.CNTNODOC,A.TMONID '
         +' HAVING SUM(CNTHABEME-CNTDEBEME)-SUM(CNTDEBEME)<>0 '
         +' AND ( SUM(CNTDEBEME)>=0 AND SUM(CNTHABEME-CNTDEBEME)>=0) ';

   End;
   DMCNT.cdscuenta5.Close;
   DMCNT.cdsCuenta5.DataRequest(xSQL+XSQL1);
   try
   DMCNT.cdsCuenta5.Execute;
   except
   end;

   xSQL:='SELECT * FROM CNT303 '
        +'Where CIAID='''     + dblcCIA.text      +''' and '
        +      'CNTANOMM='''  +edtPeriodo.text+''' and '
        +      'TDIARID='''   +dblcTDiario.Text  +''' and '
        +      'CNTCOMPROB='''+dbeNoComp.text+''' and '
        +      'CNTLOTE=''DIFC'''
        +' ORDER BY CIAID,TDIARID,CNTCOMPROB,CLAUXID,AUXID,DOCID,CNTSERIE,CNTNODOC ';
  DMCNT.cdsCntCont.Close;
  DMCNT.cdsCntCont.DataRequest(xSQL);
  DMCNT.cdsCntCont.Open;

  xCNTReg:=0;
  XCONTA:=0;
  DMCNT.cdsCntCont.First;
  while not DMCNT.cdsCntCont.Eof do
  begin

      DMCNT.cdsCntCont.Edit;
      xCNTReg:=xCNTReg+1;
      XCONTA:=XCONTA+1;
      DMCNT.cdsCntCont.FieldByName('CNTREG').AsInteger:=xCNTReg;
      IF  XCONTA>=100 THEN
      Begin
            DMCNT.cdsCntCont.ApplyUpdates( 0 );
            XCONTA:=0;
            //Showmessage('grabando 100');
      End;
      DMCNT.cdsCntCont.Next;
  end;



        //INSERTANDO CABECERRA PARA LLEVAR EL CONTROLDE  LOS PERIODOS
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  Begin
      XSQL:=' INSERT INTO CNT304 (CIAID,TDIARID,CNTCOMPROB,CNTGLOSA,CNTANO, '
            +' CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
            +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS'
            +' ,FAMENSUAL,CNTTCAMBIO,CNTESTADO,TMONID) '
      +' ( SELECT CIAID,TDIARID,CNTCOMPROB,'''+edtGlosa.text+'DE CTAS POR PAGAR'+''',CNTANO, '
      +' CNTANOMM,SUM(CNTDEBEMN),SUM(CNTHABEMN),CNTLOTE,MAX(CNTUSER),CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
      +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''', ''S'''
      +','+TCAMBIO+',''P'','''+DMCNT.wTMonLoc+''''
      +' FROM CNT303 WHERE CIAID='''+dblcCIA.text+''' AND TDIARID='''+dblcTDiario.text
      +''' AND CNTCOMPROB='''+dbeNoComp.text
      +''' AND  CNTANOMM='''+edtperiodo.text+''' AND CNTLOTE=''DIFC'''
      +' GROUP BY CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE ) ' ;
  End;

  if SRV_D = 'ORACLE' then
  Begin
      XSQL:=' INSERT INTO CNT304 (CIAID,TDIARID,CNTCOMPROB,CNTGLOSA,CNTANO, '
            +' CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
            +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS'
            +' ,FAMENSUAL,CNTTCAMBIO,CNTESTADO,TMONID) '
      +' ( SELECT CIAID,TDIARID,CNTCOMPROB,'''+edtGlosa.text+'DE CTAS POR PAGAR'+''',CNTANO, '
      +' CNTANOMM,SUM(CNTDEBEMN),SUM(CNTHABEMN),CNTLOTE,MAX(CNTUSER),MAX(CNTFREG),MAX(CNTHREG), '
      +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''', ''S'''
      +','+TCAMBIO+',''P'','''+DMCNT.wTMonLoc+''''
      +' FROM CNT303 WHERE CIAID='''+dblcCIA.text+''' AND TDIARID='''+dblcTDiario.text
      +''' AND CNTCOMPROB='''+dbeNoComp.text
      +''' AND  CNTANOMM='''+edtperiodo.text+''' AND CNTLOTE=''DIFC'''
      +' GROUP BY CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE ) ' ;
  End;

      DMCNT.cdscuenta5.Close;
      DMCNT.cdsCuenta5.DataRequest(xSQL);
      try
      DMCNT.cdsCuenta5.Execute;
      except
      end;

               XSQL:='INSERT INTO  CNT311 '
               + ' (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
               + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
               + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
               + ' CNTHABEMN,CNTHABEME,CNTREG) '

               + ' (SELECT CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
               + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
               + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
               + ' CNTHABEMN,CNTHABEME,CNTREG '
               +' FROM CNT303 '
               +' Where CIAID='''     + dblcCia.text      +''' and '
               +      'CNTANOMM='''  + edtPeriodo.Text +''' and '
               +      'TDIARID='''   + dblcTDiario.Text  +''' and '
               +      'CNTCOMPROB='''+ dbeNoComp.Text      +''' and '
               +      'CNTLOTE=''DIFC'' )';
         DMCNT.CDSQRY.CLOSE;
         DMCNT.CDSQRY.DATAREQUEST(Xsql);
         try
              DMCNT.CDSQRY.EXECUTE;
         except
         end;

         DMCNT.CDSQRY.CLOSE;

         XSQL:='SELECT * FROM CNT311 WHERE '
               +'      CIAID='''     + dblcCia.text      +''' and '
               +      'CNTANOMM='''  + edtPeriodo.Text +''' and '
               +      'TDIARID='''   + dblcTDiario.Text  +''' and '
               +      'CNTCOMPROB='''+ dbeNoComp.Text      +''' and '
               +      'CNTLOTE=''DIFC'' ';
         DMCNT.cdsCNT311.Close;
         DMCNT.cdsCNT311.DataRequest(XSQL);
         DMCNT.cdsCNT311.Open;

      if rbCmpContS.Checked then
      Begin

      if SOLConta(dblcCia.text,
                  dblcTDiario.Text,
                  edtPeriodo.Text,
                  dbeNoComp.Text,
                  SRV_D, 'P', DMCNT.wModulo, DMCNT.cdsCNT311, DMCNT.cdsNivel,
                  DMCNT.cdsResultSet, DMCNT.DCOM1, Self ) then
      END;
      if rbCmpContN.Checked then
      Begin

{      if SOLConta(dblcCia.text,
                  dblcTDiario.Text,
                  edtPeriodo.Text,
                  dbeNoComp.Text,
                  SRV_D, 'P', DMCNT.wModulo, DMCNT.cdsCNT311, DMCNT.cdsNivel,
                  DMCNT.cdsResultSet, DMCNT.DCOM1, Self ) then}
      END;


end;

procedure TFDifCambio.AsientoCXC;

var
   xCNTReg : integer;
   WHReg   : TTime;
   XSQL1,XSQL2:sTRING;
begin


  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
        xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
        +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFComp.Date)+''')';
   end;
   if (SRV_D = 'ORACLE') then
   begin
       xSQL:='SELECT * FROM TGE114 WHERE FECHA='
         +'TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFComp.Date)+''')';
   end;
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest( xSQL );
   DMCNT.cdsQry.Open;
   XMES:=Copy(edtperiodo.text,5,2);


   wHreg  :=Time;

  //CONVERTIR DB2
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  Begin
{     XSQL:=' INSERT INTO CNT303 (CIAID,TDIARID,TDIARDES, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM,CNTDEBEMN'
         +' ,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
         +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
         +' ,CNTDH,CNTGLOSA,CNTTCAMBIO,CNTDEBEME,CNTHABEME,CNTFCOMP,CLAUXID '
         +' ,AUXID,DOCID,CNTSERIE,CNTNODOC,TMONID ) '
         +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT+''' ,A.CUENTAID AS CUENTA,'''+dbeNoComp.text
         +''' ,B.CTADES AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') >0 THEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') ELSE 0 END AS DEBE, '
         +' CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') <0 THEN (-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')) ELSE 0 END AS HABE,'
         +' ''DCCC'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',CURRENT DATE, '''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') >0 THEN ''D'' ELSE ''H'' END as CNTDH,'''+edtGlosa.text+' DE CTAS POR COBRAR'
         +''','+tcambio
         +' ,(CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') >0 THEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') ELSE 0 END)/'+TCAMBIO
         +' ,(CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') <0 THEN (-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')) ELSE 0 END)/'+TCAMBIO
         +' , DATE('''+dtpFComp.TEXT+'''),'' '' AS  CLAUXID, '' '' AS CLIEID '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+dblcTipDoc.Text+''' ELSE '' '' END  AS DOCID '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+edtserie.Text+''' ELSE '' '' END AS CPSERIE '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+edtndoc.Text+''' ELSE '' '' END AS CPNODOC ,'''
         + DMCNT.wTMonLoc+''''
         +' FROM  CNT401 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID '
         +' AND A.CUENTAID=B.CUENTAID '
         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_ME=''S'''
         +' AND B.CTA_MOV=''S'' '
         +' AND B.CTAMODDIFC=''CXC'' '
         + ' AND A.ANO='''+copy(edtperiodo.text,1,4)+''' AND A.CCOSID IS NULL  AND B.CTA_AUX=''N'''
         + ' AND A.AUXID IS NULL  AND A.SALDMN'+XMES+'<>0 '
         + ' AND (A.DEBEMN'+XMES+'<>0  OR A.HABEMN'+XMES+'<>0) '


         +' UNION ALL '

         +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT+''' ,A.CUENTAID AS CUENTA,'''+dbeNoComp.text
         +''' ,B.CTADES AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') >0 THEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') ELSE 0 END AS DEBE, '
         +' CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') <0 THEN (-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')) ELSE 0 END AS HABE,'
         +' ''DCCC'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',CURRENT DATE, '''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') >0 THEN ''D'' ELSE ''H'' END as CNTDH,'''+edtGlosa.text+' DE CTAS POR COBRAR'
         +''','+tcambio
         +' ,(CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') >0 THEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') ELSE 0 END)/'+TCAMBIO
         +' ,(CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') <0 THEN (-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')) ELSE 0 END)/'+TCAMBIO
         +' , DATE('''+dtpFComp.TEXT+'''),'' '' AS  CLAUXID, '' '' AS CLIEID '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+dblcTipDoc.Text+''' ELSE '' '' END  AS DOCID '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+edtserie.Text+''' ELSE '' '' END AS CPSERIE '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+edtndoc.Text+''' ELSE '' '' END AS CPNODOC ,'''
         + DMCNT.wTMonLoc+''''
         +' FROM  CNT401 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID '
         +' AND A.CUENTAID=B.CUENTAID '
         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_ME=''S'''
         +' AND B.CTA_MOV=''S'' '
         +' AND B.CTAMODDIFC=''CXC'' '
         + ' AND A.ANO='''+copy(edtperiodo.text,1,4)+''' AND A.CCOSID IS NULL  AND B.CTA_AUX=''S'''
         + ' AND A.AUXID IS  NOT NULL  AND A.SALDMN'+XMES+'<>0 '
         + ' AND (A.DEBEMN'+XMES+'<>0  OR A.HABEMN'+XMES+'<>0) '

         +' UNION ALL '

         +'SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT
         +''' , CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') >0 THEN '''+edtCtaG.text+''' ELSE '''+edtCtaP.text+''' END  AS CUENTA,'''
         +dbeNoComp.text
         +''' ,B.CTADES AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')<0 THEN (-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')) ELSE 0 END AS DEBE, '
         +' CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')>0 THEN (ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')) ELSE 0 END AS HABE, '
         +' ''DCCC'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',CURRENT DATE, '''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')> 0 THEN ''H'' ELSE ''D'' END CNTDH,'''+edtGlosa.text+' DE CTAS POR COBRAR'
         +''','+tcambio
         +' ,(CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')<0 THEN (-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')) ELSE 0 END)/'+TCAMBIO
         +' ,(CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')>0 THEN (ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')) ELSE 0 END)/'+TCAMBIO
         +' , DATE('''+dtpFComp.TEXT+'''),'' '' AS CLAUXID, '' '' AS CLIEID '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+dblcTipDoc.Text+''' ELSE '' '' END  AS DOCID '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+edtserie.Text+''' ELSE '' '' END AS CPSERIE '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+edtndoc.Text+''' ELSE '' '' END AS CPNODOC ,'''
         + DMCNT.wTMonLoc+''''
         +' FROM  CNT401 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID '
         +' AND A.CUENTAID=B.CUENTAID '
         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_ME=''S'''
         +' AND B.CTA_MOV=''S'' '
         +' AND B.CTAMODDIFC=''CXC'' '
         +' AND A.ANO='''+copy(edtperiodo.text,1,4)+''' AND A.CCOSID IS NULL  AND B.CTA_AUX=''N'''
         +' AND A.AUXID IS NULL AND A.SALDMN'+XMES+'<>0 '
         + ' AND (A.DEBEMN'+XMES+'<>0  OR A.HABEMN'+XMES+'<>0) '

         +' UNION ALL '

         +'SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT
         +''' , CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+') >0 THEN '''+edtCtaG.text+''' ELSE '''+edtCtaP.text+''' END  AS CUENTA,'''
         +dbeNoComp.text
         +''' ,B.CTADES AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')<0 THEN (-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')) ELSE 0 END AS DEBE, '
         +' CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')>0 THEN (ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')) ELSE 0 END AS HABE, '
         +' ''DCCC'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',CURRENT DATE, '''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')> 0 THEN ''H'' ELSE ''D'' END CNTDH,'''+edtGlosa.text+' DE CTAS POR COBRAR'
         +''','+tcambio
         +' ,(CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')<0 THEN (-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')) ELSE 0 END)/'+TCAMBIO
         +' ,(CASE WHEN ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')>0 THEN (ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')) ELSE 0 END)/'+TCAMBIO
         +' , DATE('''+dtpFComp.TEXT+'''),'' '' AS CLAUXID, '' '' AS CLIEID '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+dblcTipDoc.Text+''' ELSE '' '' END  AS DOCID '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+edtserie.Text+''' ELSE '' '' END AS CPSERIE '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+edtndoc.Text+''' ELSE '' '' END AS CPNODOC ,'''
         + DMCNT.wTMonLoc+''''
         +' FROM  CNT401 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID '
         +' AND A.CUENTAID=B.CUENTAID '
         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_ME=''S'''
         +' AND B.CTA_MOV=''S'' '
         +' AND B.CTAMODDIFC=''CXC'' '
         +' AND A.ANO='''+copy(edtperiodo.text,1,4)+''' AND A.CCOSID IS NULL  AND B.CTA_AUX=''S'''
         +' AND A.AUXID IS NOT NULL AND A.SALDMN'+XMES+'<>0 '
         + ' AND (A.DEBEMN'+XMES+'<>0  OR A.HABEMN'+XMES+'<>0) )';
 }
      XSQL:=' INSERT INTO CNT303 (CIAID,TDIARID,TDIARDES, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM,CNTDEBEMN'
         +' ,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
         +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
         +' ,CNTDH,CNTGLOSA,CNTTCAMBIO,CNTDEBEME,CNTHABEME,CNTFCOMP,CLAUXID,AUXID '
         +' ,DOCID,CNTSERIE,CNTNODOC, TMONID) '
         +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT+''' ,A.CUENTAID AS CUENTA,'''+dbeNoComp.text
         +''' ,MAX(B.CTADES) AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' CASE WHEN (SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))>0  THEN  (SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)) ELSE 0 END AS DEBE, '
         +' CASE WHEN (SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))<0  THEN  (-1)*((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))) ELSE 0 END AS HABE,'
         +' ''DCCC'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',CURRENT DATE ,CURRENT TIME  , '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' CASE WHEN (SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))>0 THEN ''D'' ELSE ''H'' END  as CNTDH,'''+edtGlosa.text+' DE CTAS POR COBRAR'
         +''','+tcambio
         +' ,(CASE WHEN (SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))>0  THEN  (SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)) ELSE 0 END)/'+TCAMBIO
         +' ,(CASE WHEN (SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))<0  THEN  (-1)*((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))) ELSE 0 END)/'+TCAMBIO
         +' , DATE('''+formatdatetime(wFormatFecha,dtpFComp.date)+'''), A.CLAUXID AS  CLAUXID, A.AUXID AS CLIEID '
         +' , A.DOCID, '
         +' A.CNTSERIE AS CCSERIE, '
         +' A.CNTNODOC  AS CCNODOC ,'''
         + DMCNT.wTMonLoc+''''
         +' FROM CNT301 A, TGE202 B , '
         +' (SELECT A.CUENTAID,A.CLAUXID,A.CNTTCAMBIO,A.CIAID,A.DOCID,A.CNTSERIE,A.CNTNODOC,A.AUXID '
         +'  FROM CNT301 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID  AND A.CUENTAID=B.CUENTAID '
// JCC 22/11/2003         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC''  AND A.CNTESTADO=''P'' AND A.CNTCUADRE=''S'' '
         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC''  AND A.CNTESTADO=''P'' AND A.CNTCUADRE=''S'' '
         +' AND A.CNTDEBEME>0  AND A.CNTANOMM<='''+edtPeriodo.TEXT+''' AND A.TMONID='''+DMCNT.WTMONEXT+'''    ) G '
         +' WHERE A.CIAID=B.CIAID AND A.CIAID=G.CIAID '
         +' AND A.CUENTAID=B.CUENTAID  AND A.CUENTAID=G.CUENTAID '
         +' AND A.AUXID=G.AUXID AND A.CLAUXID=G.CLAUXID AND '
         +' A.DOCID=G.DOCID AND A.CNTSERIE=G.CNTSERIE AND A.CNTNODOC=G.CNTNODOC '
// JCC 22/11/2003         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC'' '
         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC'' '
         +' AND A.CNTANOMM<='''+edtPeriodo.TEXT+''' AND A.TMONID='''+DMCNT.WTMONEXT+''' '
         +' GROUP BY A.CIAID,A.CUENTAID, A.CLAUXID,A.AUXID,A.DOCID,A.CNTSERIE,A.CNTNODOC,A.TMONID '
         +' HAVING SUM(CNTDEBEME-CNTHABEME)-SUM(CNTHABEME)<>0 '
         +' AND ( SUM(CNTHABEME)>=0 AND SUM(CNTDEBEME-CNTHABEME)>=0) '
         +' UNION ALL';
         XSQL1:=' SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT
         +''' ,CASE WHEN (SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))>0 THEN '''+edtCtaG.text+''' ELSE '''+edtCtaP.text+''' END  AS CUENTA,'''
         +dbeNoComp.text
         +''' ,MAX(B.CTADES) AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' CASE WHEN (SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)) <0 THEN (-1)*((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))) ELSE 0 END  AS DEBE, '
         +' CASE WHEN (SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)) >0 THEN ((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)))ELSE 0 END  AS HABE, '
         +' ''DCCC'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',CURRENT DATE ,CURRENT TIME , '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' CASE WHEN (SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)) >0 THEN ''H'' ELSE ''D'' END  CNTDH,'''+edtGlosa.text+' DE CTAS POR COBRAR'
         +''','+tcambio
         +' ,(CASE WHEN (SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)) <0 THEN (-1)*((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))) ELSE 0 END)/'+TCAMBIO
         +' ,(CASE WHEN (SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)) >0 THEN ((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)))ELSE 0 END)/'+TCAMBIO
         +' , DATE('''+formatdatetime(wFormatFecha,dtpFComp.date)+'''),A.CLAUXID AS CLAUXID, A.AUXID AS CLIEID '
         +' , A.DOCID, '
         +' A.CNTSERIE AS CCSERIE, '
         +' A.CNTNODOC  AS CCNODOC ,'''
         + DMCNT.wTMonLoc+''''
         +' FROM CNT301 A, TGE202 B , '
         +' (SELECT A.CUENTAID,A.CLAUXID,A.CNTTCAMBIO,A.CIAID,A.DOCID,A.CNTSERIE,A.CNTNODOC,A.AUXID '
         +'  FROM CNT301 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID  AND A.CUENTAID=B.CUENTAID '
// JCC 22/11/2003         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC''  AND A.CNTESTADO=''P'' AND A.CNTCUADRE=''S'' '
         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC''  AND A.CNTESTADO=''P'' AND A.CNTCUADRE=''S'' '
         +' AND A.TMONID='''+DMCNT.WTMONEXT+'''  AND A.CNTDEBEME>0  AND A.CNTANOMM<='''+edtPeriodo.TEXT+'''  ) G '
         +' WHERE A.CIAID=B.CIAID AND A.CIAID=G.CIAID '
         +' AND A.CUENTAID=B.CUENTAID  AND A.CUENTAID=G.CUENTAID '
         +' AND A.AUXID=G.AUXID AND A.CLAUXID=G.CLAUXID AND '
         +' A.DOCID=G.DOCID AND A.CNTSERIE=G.CNTSERIE AND A.CNTNODOC=G.CNTNODOC '
// JCC 22/11/2003         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC'' '
         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC'' '
         +' AND A.CNTANOMM<='''+edtPeriodo.TEXT+''' AND A.TMONID='''+DMCNT.WTMONEXT+''' '
         +' GROUP BY A.CIAID,A.CUENTAID, A.CLAUXID,A.AUXID,A.DOCID,A.CNTSERIE,A.CNTNODOC,A.TMONID '
         +' HAVING SUM(CNTDEBEME-CNTHABEME)-SUM(CNTHABEME)<>0 '
         +' AND ( SUM(CNTHABEME)>=0 AND SUM(CNTDEBEME-CNTHABEME)>=0) ';


  End;

  if (SRV_D = 'ORACLE') then
  Begin
{     XSQL:=' INSERT INTO CNT303 (CIAID,TDIARID,TDIARDES, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM,CNTDEBEMN'
         +' ,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
         +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
         +' ,CNTDH,CNTGLOSA,CNTTCAMBIO,CNTDEBEME,CNTHABEME,CNTFCOMP,CLAUXID,AUXID '
         +' ,DOCID,CNTSERIE,CNTNODOC, TMONID) '
         +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT+''' ,A.CUENTAID AS CUENTA,'''+dbeNoComp.text
         +''' ,B.CTADES AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' DECODE(LEAST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0) AS DEBE, '
         +' DECODE(GREATEST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,(-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')),0) AS HABE,'
         +' ''DCCC'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',SYSDATE,SYSDATE, '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' DECODE(LEAST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,''D'',''H'') as CNTDH,'''+edtGlosa.text+' DE CTAS POR COBRAR'
         +''','+tcambio
         +' ,(DECODE(LEAST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0))/'+TCAMBIO
         +' ,(DECODE(GREATEST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,(-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')),0))/'+TCAMBIO
         +' , TO_DATE('''+dtpFComp.TEXT+'''),'' '' AS  CLAUXID, '' '' AS CLIEID '
         +' , DECODE(B.CTA_DOC,''S'','''+dblcTipDoc.Text+''','' '') AS DOCID, '
         +' DECODE(B.CTA_DOC,''S'','''+edtserie.Text+''','' '') AS CCSERIE, '
         +' DECODE(B.CTA_DOC,''S'','''+edtperiodo.text+''','' '')  AS CCNODOC ,'''
         + DMCNT.wTMonLoc+''''
         +' FROM  CNT401 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID '
         +' AND A.CUENTAID=B.CUENTAID '
         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_ME=''S'''
         +' AND B.CTA_MOV=''S'''
         +' AND B.CTAMODDIFC=''CXC'' '
         +' AND A.ANO='''+copy(edtperiodo.text,1,4)+''' AND A.CCOSID IS NULL  AND B.CTA_AUX=''N'''
         +' AND A.AUXID IS NULL AND A.SALDMN'+XMES+'<>0 '
         + ' AND (A.DEBEMN'+XMES+'<>0  OR A.HABEMN'+XMES+'<>0) '
         +' UNION ALL '
         +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT+''' ,A.CUENTAID AS CUENTA,'''+dbeNoComp.text
         +''' ,B.CTADES AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' DECODE(LEAST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0) AS DEBE, '
         +' DECODE(GREATEST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,(-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')),0) AS HABE,'
         +' ''DCCC'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',SYSDATE,SYSDATE, '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' DECODE(LEAST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,''D'',''H'') as CNTDH,'''+edtGlosa.text+' DE CTAS POR COBRAR'
         +''','+tcambio
         +' ,(DECODE(LEAST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0))/'+TCAMBIO
         +' ,(DECODE(GREATEST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,(-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')),0))/'+TCAMBIO
         +' , TO_DATE('''+dtpFComp.TEXT+'''), A.CLAUXID AS  CLAUXID, A.AUXID AS CLIEID '
         +' , DECODE(B.CTA_DOC,''S'','''+dblcTipDoc.Text+''','' '') AS DOCID, '
         +' DECODE(B.CTA_DOC,''S'','''+edtserie.Text+''','' '') AS CCSERIE, '
         +' DECODE(B.CTA_DOC,''S'','''+edtndoc.Text+''','' '')  AS CCNODOC ,'''
         + DMCNT.wTMonLoc+''''
         +' FROM  CNT401 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID '
         +' AND A.CUENTAID=B.CUENTAID '
         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_ME=''S'''
         +' AND B.CTA_MOV=''S'' '
         +' AND B.CTAMODDIFC=''CXC'' '
         +' AND A.ANO='''+copy(edtperiodo.text,1,4)+''' AND A.CCOSID IS NULL  AND B.CTA_AUX=''S'''
         +' AND A.AUXID IS NOT NULL AND A.SALDMN'+XMES+'<>0 '
         + ' AND (A.DEBEMN'+XMES+'<>0  OR A.HABEMN'+XMES+'<>0) '
         +' UNION ALL '

         +'SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT
         +''' ,DECODE(LEAST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,'''+edtCtaG.text+''','''+edtCtaP.text+''') AS CUENTA,'''
         +dbeNoComp.text
         +''' ,B.CTADES AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' DECODE(GREATEST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,(-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')),0) AS DEBE, '
         +' DECODE(LEAST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')),0) AS HABE, '
         +' ''DCCC'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',SYSDATE,SYSDATE, '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' DECODE(LEAST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,''H'',''D'') CNTDH,'''+edtGlosa.text+' DE CTAS POR COBRAR'
         +''','+tcambio
         +' ,(DECODE(GREATEST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,(-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')),0))/'+TCAMBIO
         +' ,(DECODE(LEAST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')),0))/'+TCAMBIO
         +' , TO_DATE('''+dtpFComp.TEXT+'''),'' '' AS CLAUXID, '' '' AS CLIEID, '
         +'  DECODE(B.CTA_DOC,''S'','''+dblcTipDoc.Text+''','' '')  AS DOCID, '
         +' DECODE(B.CTA_DOC,''S'','''+edtserie.Text+''','' '') AS CCSERIE, '
         +' DECODE(B.CTA_DOC,''S'','''+edtndoc.Text+''','' '')  AS CCNODOC,'''
         + DMCNT.wTMonLoc+''''
         +' FROM  CNT401 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID '
         +' AND A.CUENTAID=B.CUENTAID '
         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_ME=''S'''
         +' AND B.CTAMODDIFC=''CXC'' '
         +' AND B.CTA_MOV=''S'' AND A.ANO='''+copy(edtperiodo.text,1,4)+''' AND A.CCOSID IS NULL '
         +' AND B.CTA_AUX=''N'' AND A.AUXID IS NULL AND A.SALDMN'+XMES+'<>0 '
         + ' AND (A.DEBEMN'+XMES+'<>0  OR A.HABEMN'+XMES+'<>0) '

         +' UNION ALL '

         +'SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT
         +''' ,DECODE(LEAST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,'''+edtCtaG.text+''','''+edtCtaP.text+''') AS CUENTA,'''
         +dbeNoComp.text
         +''' ,B.CTADES AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' DECODE(GREATEST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,(-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')),0) AS DEBE, '
         +' DECODE(LEAST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')),0) AS HABE, '
         +' ''DCCC'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',SYSDATE,SYSDATE, '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' DECODE(LEAST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,''H'',''D'') CNTDH,'''+edtGlosa.text+' DE CTAS POR COBRAR'
         +''','+tcambio
         +' ,(DECODE(GREATEST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,(-1)*(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')),0))/'+TCAMBIO
         +' ,(DECODE(LEAST(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+'),0),0,(ABS(A.SALDME'+XMES+')*'+TCAMBIO+'-ABS(A.SALDMN'+XMES+')),0))/'+TCAMBIO
         +' , TO_DATE('''+dtpFComp.TEXT+'''),A.CLAUXID AS CLAUXID, A.AUXID AS CLIEID, '
         +'  DECODE(B.CTA_DOC,''S'','''+dblcTipDoc.Text+''','' '')  AS DOCID, '
         +' DECODE(B.CTA_DOC,''S'','''+edtserie.Text+''','' '') AS CCSERIE, '
         +' DECODE(B.CTA_DOC,''S'','''+edtndoc.Text+''','' '')  AS CCNODOC,'''
         + DMCNT.wTMonLoc+''''
         +' FROM  CNT401 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID '
         +' AND A.CUENTAID=B.CUENTAID '
         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_ME=''S'''
         +' AND B.CTAMODDIFC=''CXC'' '
         +' AND B.CTA_MOV=''S'' AND A.ANO='''+copy(edtperiodo.text,1,4)+''' AND A.CCOSID IS NULL '
         +' AND B.CTA_AUX=''S'' AND A.AUXID IS NOT NULL AND A.SALDMN'+XMES+'<>0 '
         + ' AND (A.DEBEMN'+XMES+'<>0  OR A.HABEMN'+XMES+'<>0) )  ';
 }
      XSQL:=' INSERT INTO CNT303 (CIAID,TDIARID,TDIARDES, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM,CNTDEBEMN'
         +' ,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
         +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
         +' ,CNTDH,CNTGLOSA,CNTTCAMBIO,CNTDEBEME,CNTHABEME,CNTFCOMP,CLAUXID,AUXID '
         +' ,DOCID,CNTSERIE,CNTNODOC, TMONID) '
         +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT+''' ,A.CUENTAID AS CUENTA,'''+dbeNoComp.text
         +''' ,MAX(B.CTADES) AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' DECODE(LEAST((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)),0),0,(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)),0) AS DEBE, '
         +' DECODE(GREATEST((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)),0),0,(-1)*((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))),0) AS HABE,'
         +' ''DCCC'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',SYSDATE,SYSDATE, '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' DECODE(LEAST((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)),0),0,''D'',''H'') as CNTDH,'''+edtGlosa.text+' DE CTAS POR COBRAR'
         +''','+tcambio
         +' ,(DECODE(LEAST((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)),0),0,(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)),0))/'+TCAMBIO
         +' ,(DECODE(GREATEST((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)),0),0,(-1)*((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))),0))/'+TCAMBIO
         +' , TO_DATE('''+dtpFComp.TEXT+'''), A.CLAUXID AS  CLAUXID, A.AUXID AS CLIEID '
         +' , A.DOCID, '
         +' A.CNTSERIE AS CCSERIE, '
         +' A.CNTNODOC  AS CCNODOC ,'''
         + DMCNT.wTMonLoc+''''
         +' FROM CNT301 A, TGE202 B , '
         +' (SELECT A.CUENTAID,A.CLAUXID,A.CNTTCAMBIO,A.CIAID,A.DOCID,A.CNTSERIE,A.CNTNODOC,A.AUXID '
         +'  FROM CNT301 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID  AND A.CUENTAID=B.CUENTAID '
// JCC 22/11/2003         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC''  AND A.CNTESTADO=''P'' AND A.CNTCUADRE=''S'' '
         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC''  AND A.CNTESTADO=''P'' AND A.CNTCUADRE=''S'' '
         +' AND A.CNTDEBEME>0  AND A.CNTANOMM<='''+edtPeriodo.TEXT+''' AND A.TMONID='''+DMCNT.WTMONEXT+'''    ) G '
         +' WHERE A.CIAID=B.CIAID AND A.CIAID=G.CIAID '
         +' AND A.CUENTAID=B.CUENTAID  AND A.CUENTAID=G.CUENTAID '
         +' AND A.AUXID=G.AUXID AND A.CLAUXID=G.CLAUXID AND '
         +' A.DOCID=G.DOCID AND A.CNTSERIE=G.CNTSERIE AND A.CNTNODOC=G.CNTNODOC '
// JCC 22/11/2003         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC'' '
         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC'' '
         +' AND A.TMONID='''+DMCNT.WTMONEXT+''' AND A.CNTANOMM<='''+edtPeriodo.TEXT+''' '
         +' GROUP BY A.CIAID,A.CUENTAID, A.CLAUXID,A.AUXID,A.DOCID,A.CNTSERIE,A.CNTNODOC,A.TMONID '
         +' HAVING SUM(CNTDEBEME-CNTHABEME)-SUM(CNTHABEME)<>0 '
         +' AND ( SUM(CNTHABEME)>=0 AND SUM(CNTDEBEME-CNTHABEME)>=0) '
         +' UNION ALL';
         XSQL1:=' SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT
         +''' ,DECODE(LEAST((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)),0),0,'''+edtCtaG.text+''','''+edtCtaP.text+''') AS CUENTA,'''
         +dbeNoComp.text
         +''' ,MAX(B.CTADES) AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' DECODE(GREATEST((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)),0),0,(-1)*((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))),0) AS DEBE, '
         +' DECODE(LEAST((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)),0),0,((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))),0) AS HABE, '
         +' ''DCCC'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',SYSDATE,SYSDATE, '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' DECODE(LEAST((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)),0),0,''H'',''D'') CNTDH,'''+edtGlosa.text+' DE CTAS POR COBRAR'
         +''','+tcambio
         +' ,(DECODE(GREATEST((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)),0),0,(-1)*((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))),0))/'+TCAMBIO
         +' ,(DECODE(LEAST((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME)),0),0,((SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))*'+TCAMBIO+'-MAX(G.CNTTCAMBIO)*(SUM(A.CNTDEBEME)-SUM(A.CNTHABEME))),0))/'+TCAMBIO
         +' , TO_DATE('''+dtpFComp.TEXT+'''),A.CLAUXID AS CLAUXID, A.AUXID AS CLIEID '
         +' , A.DOCID, '
         +' A.CNTSERIE AS CCSERIE, '
         +' A.CNTNODOC  AS CCNODOC ,'''
         + DMCNT.wTMonLoc+''''

//         +'  DECODE(B.CTA_DOC,''S'','''+dblcTipDoc.Text+''','' '')  AS DOCID, '
//         +' DECODE(B.CTA_DOC,''S'','''+edtserie.Text+''','' '') AS CCSERIE, '
//         +' DECODE(B.CTA_DOC,''S'','''+edtndoc.Text+''','' '')  AS CCNODOC,'''
 //        + DMCNT.wTMonLoc+''''}

         +' FROM CNT301 A, TGE202 B , '
         +' (SELECT A.CUENTAID,A.CLAUXID,A.CNTTCAMBIO,A.CIAID,A.DOCID,A.CNTSERIE,A.CNTNODOC,A.AUXID '
         +'  FROM CNT301 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID  AND A.CUENTAID=B.CUENTAID '
// JCC 22/11/2003         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC''  AND A.CNTESTADO=''P'' AND A.CNTCUADRE=''S'' '
         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC''  AND A.CNTESTADO=''P'' AND A.CNTCUADRE=''S'' '
         +' AND A.TMONID='''+DMCNT.WTMONEXT+'''  AND A.CNTDEBEME>0  AND A.CNTANOMM<='''+edtPeriodo.TEXT+'''  ) G '
         +' WHERE A.CIAID=B.CIAID AND A.CIAID=G.CIAID '
         +' AND A.CUENTAID=B.CUENTAID  AND A.CUENTAID=G.CUENTAID '
         +' AND A.AUXID=G.AUXID AND A.CLAUXID=G.CLAUXID AND '
         +' A.DOCID=G.DOCID AND A.CNTSERIE=G.CNTSERIE AND A.CNTNODOC=G.CNTNODOC '
// JCC 22/11/2003         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_ME=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC'' '
         +' AND  A.CIAID='''+DBLCCIA.TEXT+''' AND B.CTA_DIFC=''S'' AND B.CTA_MOV=''S'' AND B.CTAMODDIFC=''CXC'' '
         +' AND A.CNTANOMM<='''+edtPeriodo.TEXT+''' AND A.TMONID='''+DMCNT.WTMONEXT+''' '
         +' GROUP BY A.CIAID,A.CUENTAID, A.CLAUXID,A.AUXID,A.DOCID,A.CNTSERIE,A.CNTNODOC,A.TMONID '
         +' HAVING SUM(CNTDEBEME-CNTHABEME)-SUM(CNTHABEME)<>0 '
         +' AND ( SUM(CNTHABEME)>=0 AND SUM(CNTDEBEME-CNTHABEME)>=0) ';
  End;
         DMCNT.cdscuenta5.Close;
         DMCNT.cdsCuenta5.DataRequest(xSQL+XSQL1);
         try
         DMCNT.cdsCuenta5.Execute;
         except
         end;
  xSQL:='SELECT * FROM CNT303 '
        +'Where CIAID='''     + dblcCIA.text      +''' and '
        +      'CNTANOMM='''  +edtPeriodo.text+''' and '
        +      'TDIARID='''   +dblcTDiario.Text  +''' and '
        +      'CNTCOMPROB='''+dbeNoComp.text+''' and '
        +      'CNTLOTE=''DCCC'' '
        +' ORDER BY CIAID,TDIARID,CNTCOMPROB,CLAUXID,AUXID,DOCID,CNTSERIE,CNTNODOC ';
  DMCNT.cdsCntCont.Close;
  DMCNT.cdsCntCont.DataRequest(xSQL);
  DMCNT.cdsCntCont.Open;
  xCNTReg:=0;

  DMCNT.cdsCntCont.First;
  while not DMCNT.cdsCntCont.Eof do
  begin
      DMCNT.cdsCntCont.Edit;
      xCNTReg:=xCNTReg+1;
      DMCNT.cdsCntCont.FieldByName('CNTREG').AsInteger:=xCNTReg;
      DMCNT.cdsCntCont.Next;
  end;

  DMCNT.cdsCntCont.ApplyUpdates( 0 );

        //INSERTANDO CABECERRA PARA LLEVAR EL CONTROLDE  LOS PERIODOS
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  Begin

      XSQL:=' INSERT INTO CNT304 (CIAID,TDIARID,CNTCOMPROB,CNTGLOSA,CNTANO, '
            +' CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
            +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
            +' CNTAASS,FAMENSUAL,CNTTCAMBIO,CNTESTADO,TMONID ) '
      +' ( SELECT CIAID,TDIARID,CNTCOMPROB,'''+edtGlosa.text+' DE CUENTAS POR COBRAR'+''',CNTANO, '
      +' CNTANOMM,SUM(CNTDEBEMN),SUM(CNTHABEMN),CNTLOTE,MAX(CNTUSER),CURRENT DATE,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
      +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''', ''S'''
      +','+TCAMBIO+',''P'','''+DMCNT.wTMonLoc+''''
      +' FROM CNT303 WHERE CIAID='''+dblcCIA.text+''' AND TDIARID='''+dblcTDiario.text
      +''' AND CNTCOMPROB='''+dbeNoComp.text
      +''' AND  CNTANOMM='''+edtperiodo.text+''' AND CNTLOTE=''DCCC'''
      +' GROUP BY CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE ) ' ;
  End;

  if SRV_D = 'ORACLE' then
  Begin

      XSQL:=' INSERT INTO CNT304 (CIAID,TDIARID,CNTCOMPROB,CNTGLOSA,CNTANO, '
            +' CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
            +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
            +' CNTAASS,FAMENSUAL,CNTTCAMBIO,CNTESTADO,TMONID ) '
      +' ( SELECT CIAID,TDIARID,CNTCOMPROB,'''+edtGlosa.text+' DE CUENTAS POR COBRAR'+''',CNTANO, '
      +' CNTANOMM,SUM(CNTDEBEMN),SUM(CNTHABEMN),CNTLOTE,MAX(CNTUSER),MAX(CNTFREG),MAX(CNTHREG), '
      +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''', ''S'''
      +','+TCAMBIO+',''P'','''+DMCNT.wTMonLoc+''''
      +' FROM CNT303 WHERE CIAID='''+dblcCIA.text+''' AND TDIARID='''+dblcTDiario.text
      +''' AND CNTCOMPROB='''+dbeNoComp.text
      +''' AND  CNTANOMM='''+edtperiodo.text+''' AND CNTLOTE=''DCCC'''
      +' GROUP BY CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE ) ' ;
  End;

      DMCNT.cdscuenta5.Close;
      DMCNT.cdsCuenta5.DataRequest(xSQL);
      try
      DMCNT.cdsCuenta5.Execute;
      except
      end;

               XSQL:='INSERT INTO  CNT311 '
               + ' (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
               + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
               + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
               + ' CNTHABEMN,CNTHABEME,CNTREG) '

               + ' (SELECT CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
               + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
               + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
               + ' CNTHABEMN,CNTHABEME,CNTREG '
               +' FROM CNT303 '
               +' Where CIAID='''     + dblcCia.text      +''' and '
               +      'CNTANOMM='''  + edtPeriodo.Text +''' and '
               +      'TDIARID='''   + dblcTDiario.Text  +''' and '
               +      'CNTCOMPROB='''+ dbeNoComp.Text      +''' and '
               +      'CNTLOTE=''DCCC'' )';
         DMCNT.CDSQRY.CLOSE;
         DMCNT.CDSQRY.DATAREQUEST(Xsql);
         Try
          DMCNT.CDSQRY.EXECUTE;
         Except
         End;
         DMCNT.CDSQRY.CLOSE;

         XSQL:='SELECT * FROM CNT311 WHERE '
               +'      CIAID='''     + dblcCia.text      +''' and '
               +      'CNTANOMM='''  + edtPeriodo.Text +''' and '
               +      'TDIARID='''   + dblcTDiario.Text  +''' and '
               +      'CNTCOMPROB='''+ dbeNoComp.Text      +''' and '
               +      'CNTLOTE=''DCCC'' ';
         DMCNT.cdsCNT311.Close;
         DMCNT.cdsCNT311.DataRequest(XSQL);
         DMCNT.cdsCNT311.Open;

      if rbCmpContS.Checked then
      Begin

      if SOLConta(dblcCia.text,
                  dblcTDiario.Text,
                  edtPeriodo.Text,
                  dbeNoComp.Text,
                  SRV_D, 'P', DMCNT.wModulo, DMCNT.cdsCNT311, DMCNT.cdsNivel,
                  DMCNT.cdsResultSet, DMCNT.DCOM1, Self ) then
      END;
      if rbCmpContN.Checked then
      Begin

{      if SOLConta(dblcCia.text,
                  dblcTDiario.Text,
                  edtPeriodo.Text,
                  dbeNoComp.Text,
                  SRV_D, 'P', DMCNT.wModulo, DMCNT.cdsCNT311, DMCNT.cdsNivel,
                  DMCNT.cdsResultSet, DMCNT.DCOM1, Self ) then}
      END;


end;


procedure TFDifCambio.AsientoCajayBancos;

var
   xCNTReg : integer;
      WHReg   : TTime;
Begin


   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
        xSQL:='SELECT * FROM TGE114 WHERE FECHA ='
        +'DATE('''+FORMATDATETIME('YYYY-MM-DD',dtpFComp.Date)+''')';
   end;
   if (SRV_D = 'ORACLE') then
   begin
         xSQL:='SELECT * FROM TGE114 WHERE FECHA='
         +'TO_DATE('''+FORMATDATETIME(wFormatFecha,dtpFComp.Date)+''')';
   end;
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest( xSQL );
   DMCNT.cdsQry.Open;
   //CONVERTIR DB2
   xmes:=copy(edtPeriodo.Text,5,2);
   wHreg  :=Time;


   //CNTDH,CNTGLOSA,CNTTCAMBIO,CNTDEBEME,CNTHABEME,CNTFCOMP,CLAUXID,AUXID,DOCID,CNTSERIE,CNTNODOC) '
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
    XSQL:=' INSERT INTO CNT303 (CIAID,TDIARID,TDIARDES, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM,CNTDEBEMN'
         +' ,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
         +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
         +' ,CNTDH,CNTGLOSA,CNTTCAMBIO,CNTDEBEME,CNTHABEME,CNTFCOMP,DOCID, '
         +' CNTSERIE,CNTNODOC,TMONID) '
         +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT+''' ,B.CUENTAID AS CUENTA,'''+dbeNoComp.text
         +''' ,B.CTADES AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' CASE WHEN ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+') >0 THEN ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+') ELSE 0 END AS DEBE, '
         +' CASE WHEN ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+') <0 THEN (-1)*(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+')) ELSE 0 END AS HABE,'
         +' ''DCCB'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' CASE WHEN ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+') >0 THEN ''D'' ELSE ''H'' END  as CNTDH,'''+edtGlosa.text+' DE CAJA Y BANCOS'
         +''','+tcambio
         +' ,(CASE WHEN ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+') >0 THEN ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+') ELSE 0 END)/'+TCAMBIO
         +' ,(CASE WHEN ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+') <0 THEN (-1)*(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+')) ELSE 0 END)/'+TCAMBIO
         +' , DATE('''+formatdatetime(wFormatFecha,dtpFComp.date)+''')'
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+dblcTipDoc.text+''' ELSE '' '' END  AS DOCID '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+EdtSerie.text+''' ELSE '' '' END AS CPSERIE '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+EdtNdoc.text+''' ELSE '' '' END AS CPNODOC,'''
         + DMCNT.wTMonLoc+''''
         +' FROM  CNT401 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID '
         +' AND A.CUENTAID=B.CUENTAID '
// JCC 22/11/2003         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_ME=''S'''
         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_DIFC=''S'''
         +' AND B.CTA_MOV=''S'''
         +' AND B.CTAMODDIFC=''CAJA'' '
//         +' AND B.CUENTAID LIKE ''10%'''    AND  B.CTA_GP=''I''
         +' AND A.ANO='''+copy(edtperiodo.text,1,4)+''' AND (A.CCOSID IS NULL OR A.CCOSID='''' )  AND B.CTA_AUX=''N'''
         +' AND (A.AUXID IS NULL OR A.AUXID='''' )   AND A.SALDMN'+XMES+'<>0 '
         + ' AND (A.DEBEMN'+XMES+'<>0  OR A.HABEMN'+XMES+'<>0) '

         +' UNION ALL '

         +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''
         +edtTDiario.TEXT
         +''' ,CASE WHEN ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+')> 0 THEN  '''+edtCtaG.text+''' ELSE '''+edtCtaP.text+''' END  AS CUENTA,'''
         +dbeNoComp.text
         +''' ,B.CTADES AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' CASE WHEN ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+') <0 THEN (-1)*(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+')) ELSE 0 END AS  DEBE, '
         +' CASE WHEN ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+') >0 THEN (ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+')) ELSE 0 END AS HABE, '
         +' ''DCCB'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',CURRENT DATE,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' CASE WHEN (A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+')> 0 THEN ''H'' ELSE ''D'' END AS  CNTDH,'''+edtGlosa.text+' DE CAJA Y BANCOS'
         +''','+tcambio
         +' ,(CASE WHEN ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+') <0 THEN (-1)*(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+')) ELSE 0 END)/'+TCAMBIO
         +' ,(CASE WHEN ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+') >0 THEN (ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+')) ELSE 0 END)/'+TCAMBIO
         +' , DATE('''+formatdatetime(wFormatFecha,dtpFComp.date)+''')'
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+dblcTipDoc.text+''' ELSE '' '' END AS DOCID '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+EdtSerie.text+''' ELSE '' '' END  AS CPSERIE '
         +' ,CASE WHEN B.CTA_DOC=''S'' THEN '''+EdtNdoc.text+''' ELSE '' '' END  AS CPNODOC,'''
         + DMCNT.wTMonLoc+''''
         +' FROM  CNT401 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID '
         +' AND A.CUENTAID=B.CUENTAID '
// JCC 22/11/2003         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_ME=''S'''
         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_DIFC=''S'''
         +' AND B.CTA_MOV=''S'''
         +' AND B.CTAMODDIFC=''CAJA'' '
//         +' AND B.CUENTAID LIKE ''10%'''   AND  B.CTA_GP=''I''
         +' AND A.ANO='''+copy(edtperiodo.text,1,4)+''' AND (A.CCOSID IS NULL OR A.CCOSID='''' ) '
         +' AND (A.AUXID IS NULL OR A.AUXID='''' )   AND B.CTA_AUX=''N'' AND A.SALDMN'+XMES+'<>0 '
         + ' AND (A.DEBEMN'+XMES+'<>0  OR A.HABEMN'+XMES+'<>0) ) ';
   End;

   if (SRV_D = 'ORACLE') then
   begin
    XSQL:=' INSERT INTO CNT303 (CIAID,TDIARID,TDIARDES, CUENTAID,CNTCOMPROB,CTADES,CNTANO,CNTANOMM,CNTDEBEMN'
         +' ,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
         +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
         +' ,CNTDH,CNTGLOSA,CNTTCAMBIO,CNTDEBEME,CNTHABEME,CNTFCOMP,DOCID,CNTSERIE,CNTNODOC,TMONID ) '
         +' (SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''+edtTDiario.TEXT+''' ,B.CUENTAID AS CUENTA,'''+dbeNoComp.text
         +''' ,B.CTADES AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' DECODE(LEAST(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+'),0),0,ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+'),0) AS DEBE, '
         +' DECODE(GREATEST(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+'),0),0,(-1)*(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+')),0) AS HABE,'
         +' ''DCCB'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',SYSDATE,SYSDATE, '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' DECODE(LEAST(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+'),0),0,''D'',''H'') as CNTDH,'''+edtGlosa.text+' DE CAJA Y BANCOS'
         +''','+tcambio
         +' ,(DECODE(LEAST(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+'),0),0,ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+'),0))/'+TCAMBIO
         +' ,(DECODE(GREATEST(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+'),0),0,(-1)*(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+')),0))/'+TCAMBIO
         +' , TO_DATE('''+dtpFComp.TEXT+''')'
         +' ,DECODE(B.CTA_DOC,''S'','''+dblcTipDoc.text+''','' '') AS DOCID '
         +' ,DECODE(B.CTA_DOC,''S'','''+EdtSerie.text+''','' '') AS CPSERIE '
         +' ,DECODE(B.CTA_DOC,''S'','''+EdtNdoc.text+''','' '') AS CPNODOC,'''
         + DMCNT.wTMonLoc+''''
         +' FROM  CNT401 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID '
         +' AND A.CUENTAID=B.CUENTAID '
// JCC 22/11/2003         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_ME=''S'''
         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_DIFC=''S'''
         +' AND B.CTA_MOV=''S'''
         +' AND B.CTAMODDIFC=''CAJA'' '
//         +' AND B.CUENTAID LIKE ''10%'''   AND  B.CTA_GP=''I''
         +' AND A.ANO='''+copy(edtperiodo.text,1,4)+''' AND A.CCOSID IS NULL AND B.CTA_AUX=''N'''
         +' AND A.AUXID IS NULL AND A.SALDMN'+XMES+'<>0 '
         + ' AND (A.DEBEMN'+XMES+'<>0  OR A.HABEMN'+XMES+'<>0) '



         +' UNION ALL '

         +' SELECT A.CIAID, '''+dblcTDiario.TEXT+''','''
         +edtTDiario.TEXT
         +''' ,DECODE(LEAST(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+'),0),0,'''+edtCtaG.text+''','''+edtCtaP.text+''') AS CUENTA,'''
         +dbeNoComp.text
         +''' ,B.CTADES AS CTADES, '
         +' '''+COPY(edtPeriodo.text,1,4)+''','''+edtPeriodo.TEXT+''','
         +' DECODE(GREATEST(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+'),0),0,(-1)*(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+')),0) AS DEBE, '
         +' DECODE(LEAST(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+'),0),0,(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+')),0) AS HABE, '
         +' ''DCCB'' AS CNTLOTE ,'''+DMCNT.wUsuario+''',SYSDATE,SYSDATE, '
         +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
         +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''','
         +' DECODE(LEAST(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+'),0),0,''H'',''D'') CNTDH,'''+edtGlosa.text+' DE CAJA Y BANCOS'
         +''','+tcambio
         +' ,(DECODE(GREATEST(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+'),0),0,(-1)*(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+')),0))/'+TCAMBIO
         +' ,(DECODE(LEAST(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+'),0),0,(ABS(A.SALDME'+xmes+')*'+tcambio+'-ABS(A.SALDMN'+xmes+')),0))/'+TCAMBIO
         +' , TO_DATE('''+dtpFComp.TEXT+''')'
         +' ,DECODE(B.CTA_DOC,''S'','''+dblcTipDoc.text+''','' '') AS DOCID '
         +' ,DECODE(B.CTA_DOC,''S'','''+EdtSerie.text+''','' '') AS CPSERIE '
         +' ,DECODE(B.CTA_DOC,''S'','''+EdtNdoc.text+''','' '') AS CPNODOC,'''
         + DMCNT.wTMonLoc+''''
         +' FROM  CNT401 A, TGE202 B '
         +' WHERE A.CIAID=B.CIAID '
         +' AND A.CUENTAID=B.CUENTAID '
// JCC 22/11/2003         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_ME=''S'''
         +' AND  A.CIAID='''+dblcCia.text+''' AND CTA_DIFC=''S'''
         +' AND B.CTA_MOV=''S'''
         +' AND B.CTAMODDIFC=''CAJA'' '
//         +' AND B.CUENTAID LIKE ''10%'''   AND  B.CTA_GP=''I''
         +' AND A.ANO='''+copy(edtperiodo.text,1,4)+''' AND A.CCOSID IS NULL '
         +' AND A.AUXID IS NULL AND B.CTA_AUX=''N'' AND A.SALDMN'+XMES+'<>0 '
         + ' AND (A.DEBEMN'+XMES+'<>0  OR A.HABEMN'+XMES+'<>0) ) ';
   End;
   DMCNT.cdscuenta5.Close;
   DMCNT.cdsCuenta5.DataRequest(xSQL);
   try
   DMCNT.cdsCuenta5.Execute;
   except
   end;

   xSQL:='SELECT * FROM CNT303 '
        +'Where CIAID='''     + dblcCIA.text      +''' and '
        +      'CNTANOMM='''  +edtPeriodo.text+''' and '
        +      'TDIARID='''   +dblcTDiario.Text  +''' and '
        +      'CNTCOMPROB='''+dbeNoComp.text+''' and '
        +      'CNTLOTE=''DCCB'' ';
   DMCNT.cdsCntCont.Close;
   DMCNT.cdsCntCont.DataRequest(xSQL);
   DMCNT.cdsCntCont.Open;
   xCNTReg:=0;

   DMCNT.cdsCntCont.First;
   while not DMCNT.cdsCntCont.Eof do
   begin
      DMCNT.cdsCntCont.Edit;
      xCNTReg:=xCNTReg+1;
      DMCNT.cdsCntCont.FieldByName('CNTREG').AsInteger:=xCNTReg;
      DMCNT.cdsCntCont.Next;
   end;

   DMCNT.cdsCntCont.ApplyUpdates( 0 );


        //INSERTANDO CABECERRA PARA LLEVAR EL CONTROLDE  LOS PERIODOS
   if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   Begin

      XSQL:=' INSERT INTO CNT304 (CIAID,TDIARID,CNTCOMPROB,CNTGLOSA,CNTANO, '
            +' CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
            +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
            +' CNTAASS,FAMENSUAL,CNTTCAMBIO,CNTESTADO,TMONID) '
      +' ( SELECT CIAID,TDIARID,CNTCOMPROB,'''+edtGlosa.text+' DE CAJA Y BANCOS'+''',CNTANO, '
      +' CNTANOMM,SUM(CNTDEBEMN),SUM(CNTHABEMN),CNTLOTE,MAX(CNTUSER),CURRENT DATE ,'''+FORMATDATETIME('HH:MM AM/PM',WHREG)+''', '
      +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''', ''S'''
      +','+TCAMBIO+',''P'','''+DMCNT.wTMonLoc+''''
      +' FROM CNT303 WHERE CIAID='''+dblcCIA.text+''' AND TDIARID='''+dblcTDiario.text
      +''' AND CNTCOMPROB='''+dbeNoComp.text
      +''' AND  CNTANOMM='''+edtperiodo.text+''' AND CNTLOTE=''DCCB'''
      +' GROUP BY CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE ) ' ;
   End;

   if SRV_D = 'ORACLE' then
   Begin

      XSQL:=' INSERT INTO CNT304 (CIAID,TDIARID,CNTCOMPROB,CNTGLOSA,CNTANO, '
            +' CNTANOMM,CNTDEBEMN,CNTHABEMN,CNTLOTE,CNTUSER,CNTFREG,CNTHREG, '
            +'   CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
            +' CNTAASS,FAMENSUAL,CNTTCAMBIO,CNTESTADO,TMONID) '
      +' ( SELECT CIAID,TDIARID,CNTCOMPROB,'''+edtGlosa.text+' DE CAJA Y BANCOS'+''',CNTANO, '
      +' CNTANOMM,SUM(CNTDEBEMN),SUM(CNTHABEMN),CNTLOTE,MAX(CNTUSER),MAX(CNTFREG),MAX(CNTHREG), '
      +''''+DMCNT.cdsQry.FieldByName('FECMES').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECDIA').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECTRIM').AsString +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECSEM').AsString  +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECSS').AsString   +''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAATRI').AsString+''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAASEM').AsString+''', '
      +''''+DMCNT.cdsQry.FieldByName('FECAASS').AsString+''', ''S'''
      +','+TCAMBIO+',''P'','''+DMCNT.wTMonLoc+''''
      +' FROM CNT303 WHERE CIAID='''+dblcCIA.text+''' AND TDIARID='''+dblcTDiario.text
      +''' AND CNTCOMPROB='''+dbeNoComp.text
      +''' AND  CNTANOMM='''+edtperiodo.text+''' AND CNTLOTE=''DCCB'''
      +' GROUP BY CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE ) ' ;
   End;

   DMCNT.cdscuenta5.Close;
   DMCNT.cdsCuenta5.DataRequest(xSQL);
   try
     DMCNT.cdsCuenta5.Execute;
   except
   end;

               XSQL:='INSERT INTO  CNT311 '
               + ' (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
               + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
               + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
               + ' CNTHABEMN,CNTHABEME,CNTREG) '

               + ' (SELECT CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID, '
               + ' CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC,CNTMTOEXT,CNTFCOMP,CNTUSER,CNTFREG, '
               + ' CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS,TMONID,CNTDEBEMN,CNTDEBEME, '
               + ' CNTHABEMN,CNTHABEME,CNTREG '
               +' FROM CNT303 '
               +' Where CIAID='''     + dblcCia.text      +''' and '
               +      'CNTANOMM='''  + edtPeriodo.Text +''' and '
               +      'TDIARID='''   + dblcTDiario.Text  +''' and '
               +      'CNTCOMPROB='''+ dbeNoComp.Text      +''' and '
               +      'CNTLOTE=''DCCB'' )';
         DMCNT.CDSQRY.CLOSE;
         DMCNT.CDSQRY.DATAREQUEST(Xsql);
         Try
          DMCNT.CDSQRY.EXECUTE;
         Except
         End;
         DMCNT.CDSQRY.CLOSE;

         XSQL:='SELECT * FROM CNT311 WHERE '
               +'      CIAID='''     + dblcCia.text      +''' and '
               +      'CNTANOMM='''  + edtPeriodo.Text +''' and '
               +      'TDIARID='''   + dblcTDiario.Text  +''' and '
               +      'CNTCOMPROB='''+ dbeNoComp.Text      +''' and '
               +      'CNTLOTE=''DCCB'' ';
         DMCNT.cdsCNT311.Close;
         DMCNT.cdsCNT311.DataRequest(XSQL);
         DMCNT.cdsCNT311.Open;

      if rbCmpContS.Checked then
      Begin
        SOLConta(dblcCia.text,
                     dblcTDiario.Text,
                     edtPeriodo.Text,
                     dbeNoComp.Text,
                     SRV_D, 'P', DMCNT.wModulo, DMCNT.cdsCNT311, DMCNT.cdsNivel,
                     DMCNT.cdsResultSet, DMCNT.DCOM1, Self )
      END;
      if rbCmpContN.Checked then
      Begin
       {      if SOLConta(dblcCia.text,
                  dblcTDiario.Text,
                  edtPeriodo.Text,
                  dbeNoComp.Text,
                  SRV_D, 'P', DMCNT.wModulo, DMCNT.cdsCNT311, DMCNT.cdsNivel,
                  DMCNT.cdsResultSet, DMCNT.DCOM1, Self ) then}
      END;


End;



procedure TFDifCambio.Inserta301;
var
	AA: String;
begin
	DMCNT.cdsMovCnt1.Insert;
  DMCNT.cdsMovCnt1.FieldByName('CIAID').AsString     := dblcCia.Text;
  DMCNT.cdsMovCnt1.FieldByName('TDIARID').AsString   := dblcTDiario.Text;
  DMCNT.cdsMovCnt1.FieldByName('CNTCOMPROB').AsString:= dbeNoComp.Text;
  DMCNT.cdsMovCnt1.FieldByName('CNTANO').AsString    := copy(edtPeriodo.Text,1,4);
  DMCNT.cdsMovCnt1.FieldByName('CNTANOMM').AsString  := edtPeriodo.Text;
  DMCNT.cdsMovCnt1.FieldByName('CUENTAID').AsString  := xCuenta;
  DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString     := xDH;
  DMCNT.cdsMovCNT1.FieldByName('CLAUXID').AsString   := xClAux;
  DMCNT.cdsMovCnt1.FieldByName('AUXID').AsString     := xAux;
  DMCNT.cdsMovCnt1.FieldByName('CCOSID').AsString    := xCCo;
//  DMCNT.cdsMovCnt1.FieldByName('CNTLOTE').AsString   := dbeLote.Text;
  DMCNT.cdsMovCnt1.FieldByName('CNTGLOSA').AsString  := edtGlosa.Text;
  DMCNT.cdsMovCnt1.FieldByName('TMONID').AsString    := DMCNT.wTMonLoc;
  DMCNT.cdsMovCnt1.FieldByName('CNTTCAMBIO').AsFloat := TC;
  DMCNT.cdsMovCnt1.FieldByName('CNTFCOMP').AsDateTime:= dtpFComp.Date;
  DMCNT.cdsMovCnt1.FieldByName('CNTFEMIS').AsDateTime:= dtpFComp.Date;
  DMCNT.cdsMovCnt1.FieldByName('CNTESTADO').AsString := 'I';
  DMCNT.cdsMovCnt1.FieldByName('CNTUSER').AsString   := DMCNT.wUsuario;
  DMCNT.cdsMovCnt1.FieldByName('CNTFREG').AsDateTime := date;
  DMCNT.cdsMovCnt1.FieldByName('CNTHREG').AsDateTime := time;
  xWhere := 'Fecha='+''''+datetostr(dtpFComp.date)+'''';
  AA:=DMCNT.DisplayDescrip('PrvTGE','TGE114','FECANO,FECMES,FECDIA,FECTRIM,FECSEM,FECSS,FECAATRI,FECAASEM,FECAASS',xWhere,'FECANO');
  if AA<>'' then
  	DMCNT.cdsMovCnt1.FieldByName('CNTANO').AsString :=AA;
  if length(AA)>0 then
  begin
    DMCNT.cdsMovcnt1.FieldByName('CNTMM').AsString   := DMCNT.cdsQry.FieldByName('FECMES').AsString;      // MES
    DMCNT.cdsMovcnt1.FieldByName('CNTDD').AsString   := DMCNT.cdsQry.FieldByName('FECDIA').AsString;      // DÍA
    DMCNT.cdsMovcnt1.FieldByName('CNTTRI').AsString  := DMCNT.cdsQry.FieldByName('FECTRIM').AsString;     // TRIMESTRE
    DMCNT.cdsMovcnt1.FieldByName('CNTSEM').AsString  := DMCNT.cdsQry.FieldByName('FECSEM').AsString;      // SEMESTRE
    DMCNT.cdsMovcnt1.FieldByName('CNTSS').AsString   := DMCNT.cdsQry.FieldByName('FECSS').AsString;       // SEMANA
    DMCNT.cdsMovcnt1.FieldByName('CNTAATRI').AsString:= DMCNT.cdsQry.FieldByName('FECAATRI').AsString;    // AÑO+TRIMESTRE
    DMCNT.cdsMovcnt1.FieldByName('CNTAASEM').AsString:= DMCNT.cdsQry.FieldByName('FECAASEM').AsString;    // AÑO+SEMESTRE
    DMCNT.cdsMovcnt1.FieldByName('CNTAASS').AsString := DMCNT.cdsQry.FieldByName('FECAASS').AsString;     // AÑO+SEMANA
  end;
  DMCNT.cdsMovCnt1.FieldByName('CTADES').AsString   :=xCtaDes;
  DMCNT.cdsMovCnt1.FieldByName('AUXDES').AsString   :=xAuxDes;
  DMCNT.cdsMovCnt1.FieldByName('TDIARDES').AsString :=edtTDiario.Text;
  DMCNT.cdsMovCnt1.FieldByName('CCOSDES').AsString  :=xCCoDes;
  DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat :=xDif;
  DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat :=xDif;
  DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat :=DMCNT.FRound((xDif*TC),14,2);
  if DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString='D' then
  begin
  	DMCNT.cdsMovCnt1.FieldByName('CNTDEBEMN').AsFloat:=DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat;
    DMCNT.cdsMovCnt1.FieldByName('CNTDEBEME').AsFloat:=DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat;
  end
  else
  begin
    DMCNT.cdsMovCnt1.FieldByName('CNTHABEMN').AsFloat:=DMCNT.cdsMovCnt1.FieldByName('CNTMTOLOC').AsFloat;
    DMCNT.cdsMovCnt1.FieldByName('CNTHABEME').AsFloat:=DMCNT.cdsMovCnt1.FieldByName('CNTMTOEXT').AsFloat;
  end;
end;

procedure TFDifCambio.Conta_DifCambio;
var
	cds1, cds2: TwwClientDataSet;
begin
  //// Contabilización en Linea: requiere que en el DM del módulo exista cdsMOVCNT2 (mismo nombre)
  //// cds1 y cds2 deben hacer referencia a la tabla CNT301
  cds1:=DMCNT.cdsMovCNT1;  // Tabla principal en donde se guardan los registros contables manuales
  cds2:=DMCNT.cdsMovCNT2;  // Tabla en donde se generan los asientos automáticos
  if (Contabiliza(cds1,cds2)) then
  begin
		//dbgMovCNT.ReadOnly := True;
    cds1.EnableControls;
    ShowMessage(' Asiento Contabilizado ');
		//MuestraEstado(DMCNT.cdsMovCnt1CNTEstado.Value,DMCNT.cdsMovCnt1CNTCuadre.Value);
  end
  else
  	ShowMessage('Asiento NO Contabilizado');
end;

Function TFDifCambio.Contabiliza(cds1,cds2:TwwClientDataSet):Boolean;
var
	xCCoId, xCCoDes, xCtaDes1, xCtaDes2, xCtaAut1, xCtaAut2, xDH1, xDH2  : String;
begin
	(*if MessageDlg(' Contabilizar Comprobante'+chr(13)+chr(13)+
                '     ¿ Esta Seguro ?     ',mtConfirmation,[mbYes, mbNo],0)=mrNo then Result:=False;*)
	if MessageDlg(' Contabilizar Comprobante'+chr(13)+chr(13)+
                '     ¿ Esta Seguro ?     ',mtConfirmation,[mbYes, mbNo],0)<>mrYes then Result:=False;
  if not AsientoCuadra then
  begin
  	ShowMessage(' Error al Contabilizar, asiento No Cuadra....... ');
    Result:=False;
    exit;
  end;

  if cds1.FieldByName('CNTCUADRE').Value='S' then
  begin
  	ShowMessage(' Asiento ya fue Contabilizado....... ');
    Result:=False;
    exit;
  end;
  // Genera Asiento Automático

  cds1.DisableControls;
  cds1.First;
  while not cds1.Eof do
  begin
  	cds1.Edit;
    cds1.FieldByName('CNTCUADRE').AsString := 'S';

    xWhere := 'CIAID='+''''+dblcCia.Text+''''+' and CUENTAID='+''''+cds1.FieldByName('CUENTAID').Value+'''';
    xCtaAut1 := DMCNT.DisplayDescrip('PrvTGE','TGE202','CTAAUT1,CTAAUT2',xWhere,'CTAAUT1');
    if length( xCtaAut1 )>0 then
    begin
    	xCtaAut2 := DMCNT.cdsQry.FieldByName('CTAAUT2').Value;
      xWhere  := 'CIAID='+''''+dblcCia.Text+''''+' and CUENTAID='+''''+xCtaAut1+'''';
      xCtaDes1:= DMCNT.DisplayDescrip('PrvTGE','TGE202','CTAABR,CTA_CCOS',xWhere,'CTAABR');
      xCCoId:='';  xCCoDes:='';
      if (DMCNT.cdsQry.FieldByName('CTA_CCOS').Value = 'S') then
      begin
      	DMCNT.cdsCCosto.SetKey;
        DMCNT.cdsCCosto.FieldByName('CCosID').AsString := CDS1.FIELDBYNAME('CCOSID').VALUE;
        if DMCNT.cdsCCosto.GotoKey then
        begin
        	xCCoId :=DMCNT.cdsCCosto.FieldByName('CCOSID').AsString;
          xCCoDes:=DMCNT.cdsCCosto.FieldByName('CCOSDES').AsString;
        end;
      end;
      If cds1.FieldByName('CNTDH').Value='D' then xDH1:='D' else xDH1:='H';
      If cds1.FieldByName('CNTDH').Value='D' then xDH2:='H' else xDH2:='D';

      // Grabar Asiento Automático 1
      cds2.Insert;
      cds2.FieldByName('CIAID').AsString     := cds1.FieldByName('CIAID').VALUE;
      cds2.FieldByName('TDIARID').AsString   := cds1.FieldByName('TDIARID').VALUE;
      cds2.FieldByName('CNTCOMPROB').AsString:= cds1.FieldByName('CNTCOMPROB').VALUE;
      cds2.FieldByName('CNTANO').AsString    := cds1.FieldByName('CNTANO').VALUE;
      cds2.FieldByName('CNTANOMM').AsString  := cds1.FieldByName('CNTANOMM').VALUE;
      cds2.FieldByName('CNTLOTE').AsString   := cds1.FieldByName('CNTLOTE').VALUE;
      cds2.FieldByName('CUENTAID').AsString  := XCTAAUT1;
      cds2.FieldByName('CLAUXID').AsString   := cds1.FieldByName('CLAUXID').VALUE;
      cds2.FieldByName('AUXID').AsString     := cds1.FieldByName('AUXID').VALUE;
      cds2.FieldByName('CNTSERIE').AsString  := cds1.FieldByName('CNTSERIE').VALUE;
      cds2.FieldByName('CNTNODOC').AsString  := cds1.FieldByName('CNTNODOC').VALUE;
      cds2.FieldByName('CNTGLOSA').AsString  := cds1.FieldByName('CNTGLOSA').VALUE;
      cds2.FieldByName('CNTDH').AsString     := XDH1;
      cds2.FieldByName('CCOSID').AsString    := xCCoID;
      cds2.FieldByName('CNTTCAMBIO').VALUE:= cds1.FieldByName('CNTTCAMBIO').VALUE;
      cds2.FieldByName('CNTMTOORI').VALUE := cds1.FieldByName('CNTMTOORI').VALUE;
      cds2.FieldByName('CNTMTOLOC').VALUE := cds1.FieldByName('CNTMTOLOC').VALUE;
      cds2.FieldByName('CNTMTOEXT').VALUE := cds1.FieldByName('CNTMTOEXT').VALUE;
      cds2.FieldByName('CNTFEMIS').VALUE  := cds1.FieldByName('CNTFEMIS').VALUE;
      cds2.FieldByName('CNTFVCMTO').VALUE := cds1.FieldByName('CNTFVCMTO').VALUE;
      cds2.FieldByName('CNTFCOMP').VALUE  := cds1.FieldByName('CNTFCOMP').VALUE;
      cds2.FieldByName('CNTESTADO').VALUE := cds1.FieldByName('CNTESTADO').VALUE;
      cds2.FieldByName('CNTCUADRE').VALUE := 'S';
      cds2.FieldByName('CNTFAUTOM').VALUE := 'S';
      cds2.FieldByName('CNTUSER').VALUE   := DMCNT.WUSUARIO;
      cds2.FieldByName('CNTFREG').VALUE   := DATE;
      cds2.FieldByName('CNTHREG').VALUE   := TIME;
      cds2.FieldByName('CNTMM').VALUE     := cds1.FieldByName('CNTMM').VALUE;
      cds2.FieldByName('CNTDD').VALUE     := cds1.FieldByName('CNTDD').VALUE;
      cds2.FieldByName('CNTTRI').VALUE    := cds1.FieldByName('CNTTRI').VALUE;
      cds2.FieldByName('CNTSEM').VALUE    := cds1.FieldByName('CNTSEM').VALUE;
      cds2.FieldByName('CNTSS').VALUE     := cds1.FieldByName('CNTSS').VALUE;
      cds2.FieldByName('CNTAATRI').VALUE  := cds1.FieldByName('CNTAATRI').VALUE;
      cds2.FieldByName('CNTAASEM').VALUE  := cds1.FieldByName('CNTAASEM').VALUE;
      cds2.FieldByName('CNTAASS').VALUE   := cds1.FieldByName('CNTAASS').VALUE;
      cds2.FieldByName('TMONID').VALUE    := cds1.FieldByName('TMONID').VALUE;
      cds2.FieldByName('CTADES').VALUE    := XCTADES1;
      cds2.FieldByName('TDIARDES').VALUE  := cds1.FieldByName('TDIARDES').VALUE;
      cds2.FieldByName('AUXDES').VALUE    := cds1.FieldByName('AUXDES').VALUE;
      cds2.FieldByName('DOCDES').VALUE    := cds1.FieldByName('DOCDES').VALUE;
      cds2.FieldByName('CCOSDES').VALUE   := xCCoDes;
      if CDS2.FieldByName('CNTDH').VALUE='D' then
      begin
      	CDS2.FieldByName('CNTDEBEMN').Value:=cds1.FieldByName('CNTMTOLOC').VALUE;
        CDS2.FieldByName('CNTDEBEME').Value:=cds1.FieldByName('CNTMTOEXT').VALUE;
      end
      else
      begin
        CDS2.FieldByName('CNTHABEMN').Value:=cds1.FieldByName('CNTMTOLOC').VALUE;
        CDS2.FieldByName('CNTHABEME').Value:=cds1.FieldByName('CNTMTOEXT').VALUE;
      end;
      // Grabar Asiento Automático 2
      if length( xCtaAut2 )>0 then
      begin
      	XWHERE := 'CIAID='+''''+DBLCCIA.TEXT+''''+' AND CUENTAID='+''''+XCTAAUT2+'''';
      	XCTADES2 := DMCNT.DisplayDescrip('PrvTGE','TGE202','CTAABR,CTA_CCOS',xWhere,'CTAABR');
      	xCCoId:='';  xCCoDes:='';
      	if (DMCNT.cdsQry.FieldByName('CTA_CCOS').Value = 'S') then
        begin
        	DMCNT.cdsCCosto.SetKey;
         	DMCNT.cdsCCosto.FieldByName('CCOSID').AsString := CDS1.FIELDBYNAME('CCOSID').VALUE;
         	if DMCNT.cdsCCosto.GotoKey then
          begin
          	xCCoId :=DMCNT.cdsCCosto.FieldByName('CCOSID').AsString;
            xCCoDes:=DMCNT.cdsCCosto.FieldByName('CCOSDES').AsString;
          end;
        end;
      	CDS2.INSERT;
      	CDS2.FIELDBYNAME('CIAID').VALUE     := CDS1.FIELDBYNAME('CIAID').VALUE;
      	CDS2.FIELDBYNAME('TDIARID').VALUE   := CDS1.FIELDBYNAME('TDIARID').VALUE;
      	CDS2.FIELDBYNAME('CNTCOMPROB').VALUE:= CDS1.FIELDBYNAME('CNTCOMPROB').VALUE;
      	CDS2.FIELDBYNAME('CNTANO').VALUE    := CDS1.FIELDBYNAME('CNTANO').VALUE;
      	CDS2.FIELDBYNAME('CNTANOMM').VALUE  := CDS1.FIELDBYNAME('CNTANOMM').VALUE;
      	CDS2.FIELDBYNAME('CNTLOTE').VALUE   := CDS1.FIELDBYNAME('CNTLOTE').VALUE;
      	CDS2.FIELDBYNAME('CUENTAID').VALUE  := XCTAAUT2;
      	CDS2.FIELDBYNAME('CLAUXID').VALUE   := CDS1.FIELDBYNAME('CLAUXID').VALUE;
      	CDS2.FIELDBYNAME('AUXID').VALUE     := CDS1.FIELDBYNAME('AUXID').VALUE;
      	CDS2.FIELDBYNAME('CNTSERIE').VALUE  := CDS1.FIELDBYNAME('CNTSERIE').VALUE;
      	CDS2.FIELDBYNAME('CNTNODOC').VALUE  := CDS1.FIELDBYNAME('CNTNODOC').VALUE;
      	CDS2.FIELDBYNAME('CNTGLOSA').VALUE  := CDS1.FIELDBYNAME('CNTGLOSA').VALUE;
      	CDS2.FIELDBYNAME('CNTDH').VALUE     := XDH2;
      	CDS2.FIELDBYNAME('CCOSID').VALUE    := xCCoID;
      	CDS2.FIELDBYNAME('CNTTCAMBIO').VALUE:= CDS1.FIELDBYNAME('CNTTCAMBIO').VALUE;
      	CDS2.FIELDBYNAME('CNTMTOORI').VALUE := CDS1.FIELDBYNAME('CNTMTOORI').VALUE;
      	CDS2.FIELDBYNAME('CNTMTOLOC').VALUE := CDS1.FIELDBYNAME('CNTMTOLOC').VALUE;
      	CDS2.FIELDBYNAME('CNTMTOEXT').VALUE := CDS1.FIELDBYNAME('CNTMTOEXT').VALUE;
      	CDS2.FIELDBYNAME('CNTFEMIS').VALUE  := CDS1.FIELDBYNAME('CNTFEMIS').VALUE;
      	CDS2.FIELDBYNAME('CNTFVCMTO').VALUE := CDS1.FIELDBYNAME('CNTFVCMTO').VALUE;
      	CDS2.FIELDBYNAME('CNTFCOMP').VALUE  := CDS1.FIELDBYNAME('CNTFCOMP').VALUE;
      	CDS2.FIELDBYNAME('CNTESTADO').VALUE := CDS1.FIELDBYNAME('CNTESTADO').VALUE;
      	CDS2.FIELDBYNAME('CNTCUADRE').VALUE := 'S';
      	CDS2.FIELDBYNAME('CNTFAUTOM').VALUE := 'S';
      	CDS2.FIELDBYNAME('CNTUSER').VALUE   := DMCNT.WUSUARIO;
      	CDS2.FIELDBYNAME('CNTFREG').VALUE   := DATE;
      	CDS2.FIELDBYNAME('CNTHREG').VALUE   := TIME;
      	CDS2.FIELDBYNAME('CNTMM').VALUE     := CDS1.FIELDBYNAME('CNTMM').VALUE;
      	CDS2.FIELDBYNAME('CNTDD').VALUE     := CDS1.FIELDBYNAME('CNTDD').VALUE;
      	CDS2.FIELDBYNAME('CNTTRI').VALUE    := CDS1.FIELDBYNAME('CNTTRI').VALUE;
      	CDS2.FIELDBYNAME('CNTSEM').VALUE    := CDS1.FIELDBYNAME('CNTSEM').VALUE;
      	CDS2.FIELDBYNAME('CNTSS').VALUE     := CDS1.FIELDBYNAME('CNTSS').VALUE;
      	CDS2.FIELDBYNAME('CNTAATRI').VALUE  := CDS1.FIELDBYNAME('CNTAATRI').VALUE;
      	CDS2.FIELDBYNAME('CNTAASEM').VALUE  := CDS1.FIELDBYNAME('CNTAASEM').VALUE;
      	CDS2.FIELDBYNAME('CNTAASS').VALUE   := CDS1.FIELDBYNAME('CNTAASS').VALUE;
      	CDS2.FIELDBYNAME('TMONID').VALUE    := CDS1.FIELDBYNAME('TMONID').VALUE;
      	CDS2.FIELDBYNAME('CTADES').VALUE    := XCTADES2;
      	CDS2.FIELDBYNAME('TDIARDES').VALUE  := CDS1.FIELDBYNAME('TDIARDES').VALUE;
      	CDS2.FIELDBYNAME('AUXDES').VALUE    := CDS1.FIELDBYNAME('AUXDES').VALUE;
      	CDS2.FIELDBYNAME('DOCDES').VALUE    := CDS1.FIELDBYNAME('DOCDES').VALUE;
      	CDS2.FIELDBYNAME('CCOSDES').VALUE   := xCCoDes;
      	if CDS2.FIELDBYNAME('CNTDH').VALUE='D' then
        begin
        	CDS2.FIELDBYNAME('CNTDEBEMN').Value:=CDS1.FIELDBYNAME('CNTMTOLOC').VALUE;
         	CDS2.FIELDBYNAME('CNTDEBEME').Value:=CDS1.FIELDBYNAME('CNTMTOEXT').VALUE;
      	end
      	else
        begin
        	CDS2.FIELDBYNAME('CNTHABEMN').Value:=CDS1.FIELDBYNAME('CNTMTOLOC').VALUE;
         	CDS2.FIELDBYNAME('CNTHABEME').Value:=CDS1.FIELDBYNAME('CNTMTOEXT').VALUE;
      	end;
      end;
    end;
    CDS1.NEXT;
  end;
  CDS1.APPLYUPDATES( 0 );
  CDS2.APPLYUPDATES( 0 );

  ShowMessage('Asiento Automatico Generado... Actualizando Saldos en Linea');

	// Inicio: Contabilización en Linea //
  xCia    := dblcCia.Text;
  xAno    := Copy(edtPeriodo.Text,1,4);
  xMes    := Copy(edtPeriodo.Text,5,2);
  xDebeMN := 'DEBEMN'+xMes;
  xHabeMN := 'HABEMN'+xMes;
  xDebeME := 'DEBEME'+xMes;
  xHabeME := 'HABEME'+xMes;
  xSaldMN := 'SALDMN'+xMes;
  xSaldME := 'SALDME'+xMes;

  xSQL:= 'SELECT CIAID, CUENTAID, CNTMTOORI, CNTFVCMTO, CNTFEMIS, CNTGLOSA, CNTDH, '
       + 'AUXID, CLAUXID, DOCID, CNTSERIE, CNTNODOC, CCOSID, CNTDEBEMN, CNTDEBEME, '
       + 'CNTHABEMN, CNTHABEME, TDIARID, CNTCUADRE, CNTESTADO, CNTCOMPROB, CNTMTOLOC, '
       + 'CNTMTOEXT, CTADES, AUXDES, DOCDES, CCOSDES, TDIARDES, CNTANO, CNTANOMM, '
       + 'CNTLOTE, TMONID, CNTTCAMBIO, CNTTS, CNTMODDOC, CNTFCOMP, CNTUSER, CNTFREG, '
       + 'CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS '
       + 'FROM CNT301 WHERE '
       + 'CIAID='''+dblcCia.Text+''' '
       + 'AND TDIARID='''+dblcTDiario.Text+''' '
       + 'AND CNTCOMPROB='''+dbeNoComp.Text+''' '
       + 'AND CNTANOMM='''+edtPeriodo.Text+'''';
  DMCNT.cdsMovCnt2.Close;
  DMCNT.cdsMovCNT2.DataRequest(xSQL);
  DMCNT.cdsMovCNT2.Open;
  DMCNT.cdsMovCNT2.First;

  xSQL:='SELECT CIAID, CUENTAID, CTADES, TDIARID, TDIARDES, CLAUXID, AUXID, AUXDES, CCOSID, CCOSDES, '
       +'ANO, CTA_MOV, TIPO, '
       +'SALDMN01, SALDMN02, SALDMN03, SALDMN04, SALDMN05, SALDMN06, '
       +'SALDMN07, SALDMN08, SALDMN09, SALDMN10, SALDMN11, SALDMN12, '
       +'SALDME01, SALDME02, SALDME03, SALDME04, SALDME05, SALDME06, '
       +'SALDME07, SALDME08, SALDME09, SALDME10, SALDME11, SALDME12, '
       +'DEBEMN01, DEBEMN02, DEBEMN03, DEBEMN04, DEBEMN05, DEBEMN06, '
       +'DEBEMN07, DEBEMN08, DEBEMN09, DEBEMN10, DEBEMN11, DEBEMN12, '
       +'DEBEME01, DEBEME02, DEBEME03, DEBEME04, DEBEME05, DEBEME06, '
       +'DEBEME07, DEBEME08, DEBEME09, DEBEME10, DEBEME11, DEBEME12, '
       +'HABEMN01, HABEMN02, HABEMN03, HABEMN04, HABEMN05, HABEMN06, '
       +'HABEMN07, HABEMN08, HABEMN09, HABEMN10, HABEMN11, HABEMN12, '
       +'HABEME01, HABEME02, HABEME03, HABEME04, HABEME05, HABEME06, '
       +'HABEME07, HABEME08, HABEME09, HABEME10, HABEME11, HABEME12, '
       +'SALDMN00, SALDME00, SALDMN13, SALDME13, '
       +'DEBEMN00, DEBEME00, DEBEMN13, DEBEME13, '
       +'HABEMN00, HABEME00, HABEMN13, HABEME13 '
       +'FROM CNT401 WHERE '
       +'CIAID='''+dblcCia.Text+''' '
       +'AND ANO='''+xAno+'''';
  DMCNT.cdsRCuenta.Close;
  DMCNT.cdsRCuenta.DataRequest(xSQL);
  DMCNT.cdsRCuenta.Open;
  ContaEnLinea401;      // Cuentas
	//  dbgCta.Visible:=True;

  xSQL:='SELECT * FROM CNT402 WHERE '
       +'CIAID='''+dblcCia.Text+''' '
       +'AND ANO='''+xAno+'''';
  DMCNT.cdsRCCosto.Close;
  DMCNT.cdsRCCosto.DataRequest(xSQL);
  DMCNT.cdsRCCosto.Open;
  ContaEnLinea402;    // Centro de Costo
  Result:=True;
	// Fin: Contabilización en Linea //
end;

Function TFDifCambio.AsientoCuadra:Boolean;
var
  xTotDebe, xTotHaber : DOUBLE;
begin
  Result    := False;
  xTotDebe  := 0;
  xTotHaber := 0;
  DMCNT.cdsMovCnt2.First ;
  while not DMCNT.cdsMovCnt2.eof do
  begin
  	if DMCNT.cdsMovCnt2.FieldByName('CNTDH').AsString='D' then
    	xTotDebe  := xTotDebe  + DMCNT.cdsMovCnt2.FieldByName('CNTMTOORI').AsFloat
    else
    begin
    	xTotHaber := xTotHaber + DMCNT.cdsMovCnt2.FieldByName('CNTMTOORI').AsFloat;
    end;
    DMCNT.cdsMovCnt2.Next;
  end;
  DMCNT.cdsMovCnt2.First;
  DMCNT.cdsMovCnt2.EnableControls;
  if xTotDebe=xTotHaber then
  	Result := True;
end;

procedure TFDifCambio.ContaEnLinea401;
var
	xCtaMov, xCCoId, xCCoDes, xAuxDes, xClAux, xAux: String;
  xDigitos : Integer;
begin
  xDigitos:= 0;
  DMCNT.cdsMovCNT2.First;
  DMCNT.cdsMovCNT2.IndexFieldNames:='CIAID;TDIARID;CUENTAID;CLAUXID;AUXID';

  DMCNT.cdsNivel.First;
  while not DMCNT.cdsNivel.EOF do
  begin
  	if DMCNT.cdsNivel.FieldByName('Signo').AsString = '=' then
    	xDigitos := DMCNT.cdsNivel.FieldByName('Digitos').AsInteger;
    // Actualiza Archivo de Cuentas
    DMCNT.cdsMovCnt2.First;
    while not DMCNT.cdsMovCNT2.EOF do
    begin
    	if DMCNT.cdsMovCNT2.FieldByName('FLAGVAR').AsString <> 'V' then
      begin     // Si aun no proceso la cuenta de movimiento
      	if DMCNT.cdsNivel.FieldByName('SIGNO').AsString <> '=' then
        	xDigitos := Length( DMCNT.cdsMovCNT2.FieldByName('CUENTAID').AsString);
        xCuenta  := Copy(DMCNT.cdsMovCNT2.FieldByName('CUENTAID').AsString, 1, xDigitos );
        xTDiario := DMCNT.cdsMovCNT2.FieldByName('TDIARID').AsString;
        xAux     := DMCNT.cdsMovCNT2.FieldByName('AUXID').AsString;
        xClAux   := DMCNT.cdsMovCNT2.FieldByName('CLAUXID').AsString;
        xTDiarDes:= DMCNT.cdsMovCNT2.FieldByName('TDIARDES').AsString;
        xAuxDes  := DMCNT.cdsMovCNT2.FieldByName('AUXDES').AsString;

        DMCNT.cdsCuenta.SetKey;
        DMCNT.cdsCuenta.FieldByName('CIAID').AsString    := xCia;
        DMCNT.cdsCuenta.FieldByName('CUENTAID').AsString := xCuenta;
        if DMCNT.cdsCuenta.GotoKey then
        begin
          xCtaDes:=DMCNT.cdsCuenta.FieldByName('CTAABR').Value;
          xTDebeMN:=0; xTDebeME:=0; xTHabeMN:=0; xTHabeME:=0;
          xCtaMov:=''; xCCoId:=''; xCCoDes:='';

          if DMCNT.cdsCuenta.FieldByName('CTA_MOV').AsString='S' then
          begin
          	DMCNT.cdsMovCNT2.Edit;
            // Marca la cuenta movimiento (V:Dif.cambio - Z:EnLinea - Y:Batch - W:CierreAño)
            DMCNT.cdsMovCNT2.FieldByName('FLAGVAR').AsString:='V';
            xCCoId :=DMCNT.cdsMovCNT2.FieldByName('CCOSID').AsString;
            xCCoDes:=DMCNT.cdsMovCNT2.FieldByName('CCOSDES').AsString;
            xCtaMov:='S';
          end;

          while (not DMCNT.cdsMovCNT2.EOF ) and
               (xTDiario=DMCNT.cdsMovCNT2.FieldByName('TDIARID').AsString) and
               (xCuenta =Copy(DMCNT.cdsMovCNT2.FieldByName('CUENTAID').AsString, 1, xDigitos ) ) and
               (xClAux  =DMCNT.cdsMovCNT2.FieldByName('CLAUXID').AsString) and
               (xAux    =DMCNT.cdsMovCNT2.FieldByName('AUXID').AsString) do
          begin
            if DMCNT.cdsMovCNT2.FieldByName('CNTDH').AsString='D' then
            begin
            	xTDebeMN := xTDebeMN + DMCNT.cdsMovCNT2.FieldByName('CNTMTOLOC').AsFloat;
              xTDebeME := xTDebeME + DMCNT.cdsMovCNT2.FieldByName('CNTMTOEXT').AsFloat;
            end
            else
            begin
            	xTHabeMN := xTHabeMN + DMCNT.cdsMovCNT2.FieldByName('CNTMTOLOC').AsFloat;
              xTHabeME := xTHabeME + DMCNT.cdsMovCNT2.FieldByName('CNTMTOEXT').AsFloat;
            end;
            DMCNT.cdsMovCNT2.Next;
          end;

          DMCNT.cdsRCuenta.SetKey;
          DMCNT.cdsRCuenta.FieldByName('CIAID').AsString    := xCia;
          DMCNT.cdsRCuenta.FieldByName('ANO').AsString      := xAno;
          DMCNT.cdsRCuenta.FieldByName('TDIARID').AsString  := xTDiario;
          DMCNT.cdsRCuenta.FieldByName('CUENTAID').AsString := xCuenta;
          DMCNT.cdsRCuenta.FieldByName('CLAUXID').AsString  := xClAux;
          DMCNT.cdsRCuenta.FieldByName('AUXID').AsString  := xAux;
          if DMCNT.cdsRCuenta.GotoKey then
          	DMCNT.cdsRCuenta.Edit
          else
          begin
            DMCNT.cdsRCuenta.Insert;
            DMCNT.cdsRCuenta.FieldByName('CIAID').AsString    := xCia;
            DMCNT.cdsRCuenta.FieldByName('ANO').AsString      := xAno;
            DMCNT.cdsRCuenta.FieldByName('TDIARID').AsString  := xTDiario;
            DMCNT.cdsRCuenta.FieldByName('CUENTAID').AsString := xCuenta;
            DMCNT.cdsRCuenta.FieldByName('CLAUXID').AsString  := xClAux;
            DMCNT.cdsRCuenta.FieldByName('AUXID').AsString  := xAux;
            DMCNT.cdsRCuenta.FieldByName('CTADES').AsString  := xCtaDes;
            DMCNT.cdsRCuenta.FieldByName('TDIARDES').AsString := xTDiarDes;
            DMCNT.cdsRCuenta.FieldByName('AUXDES').AsString  := xAuxDes;
            DMCNT.cdsRCuenta.FieldByName(xSaldMN).Value := 0;
            DMCNT.cdsRCuenta.FieldByName(xSaldME).Value := 0;
            DMCNT.cdsRCuenta.FieldByName('CTA_MOV').AsString := xCtaMov;
            DMCNT.cdsRCuenta.FieldByName('CCOSID').AsString  := xCCoId;
            DMCNT.cdsRCuenta.FieldByName('CCODES').AsString   := xCCoDes;
          end;

					{Str(DMCNT.cdsNivelDigitos.Value, xTipo );
         	if length(xTipo)<2 then xTipo:='0'+copy(xTipo,1,1);
          DMCNT.cdsRCuentaTipo.Value := xTipo;}
          DMCNT.cdsRCuenta.FieldByName('TIPO').AsString :=DMCNT.cdsNivel.FieldByName('NIVEL').AsString;

          DMCNT.cdsRCuenta.FieldByName( xDebeMN ).AsFloat:=DMCNT.cdsRCuenta.FieldByName( xDebeMN ).AsFloat + xTDebeMN;
          DMCNT.cdsRCuenta.FieldByName( xHabeMN ).AsFloat:=DMCNT.cdsRCuenta.FieldByName( xHabeMN ).AsFloat + xTHabeMN;
          DMCNT.cdsRCuenta.FieldByName( xDebeME ).AsFloat:=DMCNT.cdsRCuenta.FieldByName( xDebeME ).AsFloat + xTDebeME;
          DMCNT.cdsRCuenta.FieldByName( xHabeME ).AsFloat:=DMCNT.cdsRCuenta.FieldByName( xHabeME ).AsFloat + xTHabeME;
          nn:=0;
          while (strtofloat(Copy(edtPeriodo.Text,5,2))+(nn+1))<14 do
          begin
          	// Saldos meses siguientes
           	xMes    := Copy(floattostr(strtofloat(edtPeriodo.Text)+(nn)),5,2);
           	xSaldMNs:='SALDMN'+Copy(floattostr(strtofloat(edtPeriodo.Text)+(nn+1)),5,2);
           	xSaldMEs:='SALDME'+Copy(floattostr(strtofloat(edtPeriodo.Text)+(nn+1)),5,2);
           	// Saldo mes sgte:= Saldo Mes Act + (debe mes act - haber mes act)
           	DMCNT.cdsRCuenta.FieldByName(xSaldMNs).Value:=DMCNT.cdsRCuenta.FieldByName('SALDMN'+xMes).AsFloat
            	+(DMCNT.cdsRCuenta.FieldByName('DEBEMN'+xMes).AsFloat-DMCNT.cdsRCuenta.FieldByName('HABEMN'+xMes).AsFloat);
           	DMCNT.cdsRCuenta.FieldByName(xSaldMEs).Value:=DMCNT.cdsRCuenta.FieldByName('SALDME'+xMes).AsFloat
            	+(DMCNT.cdsRCuenta.FieldByName('DEBEME'+xMes).AsFloat-DMCNT.cdsRCuenta.FieldByName('HABEME'+xMes).AsFloat);
           	nn:=nn+1;
          end;
        end
        else
        	DMCNT.cdsMovCNT2.Next;    // Si substr  de cuenta no esta en TGE202
      end
      else
      	DMCNT.cdsMovCNT2.Next;     // Si ya proceso la cuenta de movimiento
    end;
    DMCNT.cdsNivel.Next;
  end;
  DMCNT.ControlTranCNT( 0 );
  //DMCNT.cdsRCuenta.ApplyUpdates(0);
end;

procedure TFDifCambio.ContaEnLinea402;
var
	xFlCC, xCCoDes, xCCosto, xFlagDist : String;
begin
  xFlCC:='';
  DMCNT.CDSMOVCNT2.INDEXFIELDNAMES:='CIAID;TDIARID;CUENTAID;CCOSID';
  DMCNT.cdsMovCNT2.First;
  while not DMCNT.cdsMovCNT2.EOF do
  begin
  	xCCosto  := DMCNT.cdsMovCNT2.FieldByName('CCOSID').AsString;
    if (xCCosto<>'') then
    begin         // Si CCosto no esta vacio
    	xFlCC:='1';
      xCuenta  := DMCNT.cdsMovCNT2.FieldByName('CUENTAID').AsString;
      xTDiario := DMCNT.cdsMovCNT2.FieldByName('TDIARID').AsString;
      xCtaDes  := DMCNT.cdsMovCNT2.FieldByName('CTADES').AsString;
      xTDiarDes:= DMCNT.cdsMovCNT2.FieldByName('TDIARDES').AsString;
      xCCoDes  := DMCNT.cdsMovCNT2.FieldByName('CCOSDES').AsString;

      xTDebeMN:=0; xTDebeME:=0; xTHabeMN:=0; xTHabeME:=0;

      while (not DMCNT.cdsMovCNT2.EOF ) and
             (xCuenta =DMCNT.cdsMovCNT2.FieldByName('CUENTAID').AsString) and
             (xTDiario=DMCNT.cdsMovCNT2.FieldByName('TDIARID').AsString) and
             (xCCosto =DMCNT.cdsMovCNT2.FieldByName('CCOSID').AsString) do
      begin
      	xTDebeMN := xTDebeMN + DMCNT.cdsMovCNT2.FieldByName('CNTDEBEMN').AsFloat;
        xTDebeME := xTDebeME + DMCNT.cdsMovCNT2.FieldByName('CNTDEBEME').AsFloat;
        xTHabeMN := xTHabeMN + DMCNT.cdsMovCNT2.FieldByName('CNTHABEMN').AsFloat;
        xTHabeME := xTHabeME + DMCNT.cdsMovCNT2.FieldByName('CNTHABEME').AsFloat;
        DMCNT.cdsMovCNT2.Next;
        Application.ProcessMessages;
      end;
      DMCNT.cdsRCCosto.SetKey;
      DMCNT.cdsRCCosto.FieldByName('CIAID').AsString    := xCia;
      DMCNT.cdsRCCosto.FieldByName('ANO').AsString      := xAno;
      DMCNT.cdsRCCosto.FieldByName('TDIARID').AsString  := xTDiario;
      DMCNT.cdsRCCosto.FieldByName('CUENTAID').AsString := xCuenta;
      DMCNT.cdsRCCosto.FieldByName('CCOSID').AsString   := xCCosto;
      if DMCNT.cdsRCCosto.GotoKey then
      	DMCNT.cdsRCCosto.Edit
      else
      begin
      	DMCNT.cdsRCCosto.Insert;
        DMCNT.cdsRCCosto.FieldByName('CIAID').AsString    := xCia;
        DMCNT.cdsRCCosto.FieldByName('ANO').AsString      := xAno;
        DMCNT.cdsRCCosto.FieldByName('TDIARID').AsString  := xTDiario;
        DMCNT.cdsRCCosto.FieldByName('CUENTAID').AsString := xCuenta;
        DMCNT.cdsRCCosto.FieldByName('CCOSID').AsString   := xCCosto;
        DMCNT.cdsRCCosto.FieldByName('CTADES').AsString   := xCtaDes;
        DMCNT.cdsRCCosto.FieldByName('TDIARDES').AsString := xTDiarDes;
        DMCNT.cdsRCCosto.FieldByName('CCODES').AsString   := xCCoDes;
        DMCNT.cdsRCCosto.FieldByName(xSaldMN).Value := 0;
        DMCNT.cdsRCCosto.FieldByName(xSaldME).Value := 0;
      end;
			//DMCNT.cdsRCCostoTipo.Value := DMCNT.cdsNivelNivel.Value;

      DMCNT.cdsRCCosto.FieldByName( xDebeMN ).AsFloat := DMCNT.cdsRCCosto.FieldByName( xDebeMN ).AsFloat+xTDebeMN;
      DMCNT.cdsRCCosto.FieldByName( xHabeMN ).AsFloat := DMCNT.cdsRCCosto.FieldByName( xHabeMN ).AsFloat+xTHabeMN;
      DMCNT.cdsRCCosto.FieldByName( xDebeME ).AsFloat := DMCNT.cdsRCCosto.FieldByName( xDebeME ).AsFloat+xTDebeME;
      DMCNT.cdsRCCosto.FieldByName( xHabeME ).AsFloat := DMCNT.cdsRCCosto.FieldByName( xHabeME ).AsFloat+xTHabeME;
			//DMCNT.cdsRCCosto.Post;
      nn:=0;
      While (strtofloat(Copy(edtPeriodo.Text,5,2))+(nn+1))<14 do
      Begin
      	//Saldos meses siguientes
        xMes    := Copy(floattostr(strtofloat(edtPeriodo.Text)+(nn)),5,2);
        xSaldMNs:='SALDMN'+Copy(floattostr(strtofloat(edtPeriodo.Text)+(nn+1)),5,2);
        xSaldMEs:='SALDME'+Copy(floattostr(strtofloat(edtPeriodo.Text)+(nn+1)),5,2);
        // Saldo mes sgte:= Saldo Mes Act + (debe mes act - haber mes act)
        DMCNT.cdsRCCosto.FieldByName(xSaldMNS).Value:=DMCNT.cdsRCCosto.FieldByName('SALDMN'+xMes).AsFloat
          +(DMCNT.cdsRCCosto.FieldByName('DEBEMN'+xMes).AsFloat-DMCNT.cdsRCCosto.FieldByName('HABEMN'+xMes).AsFloat);
        DMCNT.cdsRCCosto.FieldByName(xSaldMES).Value:=DMCNT.cdsRCCosto.FieldByName('SALDME'+xMes).AsFloat
          +(DMCNT.cdsRCCosto.FieldByName('DEBEME'+xMes).AsFloat-DMCNT.cdsRCCosto.FieldByName('HABEME'+xMes).AsFloat);
        nn:=nn+1;
      end;
    end
    else
    	DMCNT.cdsMovCNT2.Next;  // Si CCosto esta vacio
  end;
  if xFlCC<>'' then
  	DMCNT.cdsRCCosto.ApplyUpdates( 0 );
end;

procedure TFDifCambio.dbeTCEspeChange(Sender: TObject);
begin


	if (dbeTCEspe.Text <> '') then
  	rbTCEspe.Checked:=True;

end;

procedure TFDifCambio.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFDifCambio.dbeTCEspeExit(Sender: TObject);
begin
   tcambio:=dbeTCEspe.Text;
end;

procedure TFDifCambio.bbtnImCxPClick(Sender: TObject);
var
 ssql,xwhere  : String;
begin
{  sSQL:= 'Select * from CNT304 WHERE '
               + 'CIAID='     +''''+ dblcCia.Text      +''''+' AND '
               + 'TDIARID='   +''''+ dblcTDiario.text  +''''+' AND '
               + 'CNTANOMM='  +''''+ edtPeriodo.text   +''''+' AND '
               + 'CNTLOTE=''AJDE''' ;
  DMCNT.cdsQry.close;
  DMCNT.cdsQry.datarequest(sSQL);
  DMCNT.cdsQry.open;


  if DMCNT.cdsQry.FieldByName('CNTESTADO').asstring='P' then
  Begin

   sSQL := 'Select * from CNT303 WHERE '
               + 'CIAID='     +''''+ dblcCia.Text      +''''+' AND '
               + 'TDIARID='   +''''+ dblcTDiario.text  +''''+' AND '
               + 'CNTANOMM='  +''''+ edtPeriodo.text   +''''+' AND '
               + 'CNTLOTE=''AJDE''' ;
  end;

 }
  //if DMCNT.cdsQry.FieldByName('CNTCUADRE').asstring='S' then
  //Begin

   sSQL := 'Select * from CNT303 WHERE '
               + 'CIAID='     +''''+ dblcCia.Text      +''''+' AND '
               + 'TDIARID='   +''''+ dblcTDiario.text  +''''+' AND '
               + 'CNTANOMM='  +''''+ edtPeriodo.text   +''''+' AND '
               + 'CNTLOTE IN (''DIFC'',''DCCC'',''DCCB'') '
               + 'ORDER BY CIAID,TDIARID,CNTCOMPROB,CNTLOTE,CLAUXID,AUXID,DOCID,CNTSERIE,CNTNODOC,CNTREG' ;
//               + 'ORDER BY CIAID,TDIARID,CNTCOMPROB,CLAUXID,AUXID,DOCID,CNTSERIE,CNTNODOC,CNTLOTE,CNTREG' ;
 // end;

{   DMCNT.cdsMovCNT1.DisableControls;
   DMCNT.cdsMovCNT1.Active:=true;
   DMCNT.cdsMovCNT1.Close;
   DMCNT.cdsMovCNT1.ProviderName:='prvCabCNT';
   DMCNT.cdsMovCNT1.DataRequest(sSQL);
   DMCNT.cdsMovCNT1.Open;
   if DMCNT.cdsMovCNT1.RecordCount < 1 then}
   DMCNT.cdsqry2.Close;
   DMCNT.cdsqry2.ProviderName:='prvCNT';
   DMCNT.cdsqry2.DataRequest(sSQL);
   DMCNT.cdsqry2.Open;
   if DMCNT.cdsqry2.RecordCount < 1 then
   begin
		ShowMessage('No existen registro para este calculo');
      exit;
   end;

   ppReport1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\DifCambio.rtm';
   ppReport1.template.LoadFromFile ;
   pplblcia.caption:=edtCia.text;
   if DMCNT.cdsqry2.FieldByName('CNTESTADO').asstring='' then    pplblestado.text:='Inicial';
   if DMCNT.cdsqry2.FieldByName('CNTESTADO').asstring='P' then    pplblestado.text:='Aceptado';
   if DMCNT.cdsqry2.FieldByName('CNTESTADO').asstring='C' then    pplblestado.text:='Contabilizado';
   IF DMCNT.cdsqry2.FieldByName('TMONID').asstring='N' THEN
   Begin
     xWhere :='TMONID='+''''+DMCNT.cdsqry2.FieldByName('TMONID').asstring+'''';
     pplbltmoneda.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE103','TMONDES',xWhere,'TMONDES');
   End;
   ppReport1.Print;
end;

procedure TFDifCambio.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DMCNT.cdsCuenta5.Close;
    DMCNT.cdsCuenta5.Filter := '';
    DMCNT.cdsCuenta5.Filtered := True;
    DMCNT.cdsCuenta5.IndexFieldNames:='';

    DMCNT.cdsQry.Close;
    DMCNT.cdsQry.Filter := '';
    DMCNT.cdsQry.Filtered := True;
    DMCNT.cdsQry.IndexFieldNames:='';

end;

procedure TFDifCambio.meTCPromExit(Sender: TObject);
begin
if length(meTCProm.text)>0 then
   tcambio:=meTCProm.text;
end;

procedure TFDifCambio.meTCDiaExit(Sender: TObject);
begin
if length(meTCDia.text)>0 then
   tcambio:=meTCDia.text;

end;

procedure TFDifCambio.dblcTipDocExit(Sender: TObject);
begin
   edtTipDoc.Text:='';
   if dblcTipDoc.Text<>'' then
    begin
     edtTipDoc.Text:=DMCNT.cdsTDoc.FieldByname('DOCDES').AsString;
    end;
   if length(edtTipDoc.Text)=0 then
   begin
      ShowMessage('Ingrese Tipo de Documento');
      dblcTipDoc.SetFocus;
   end;

end;

procedure TFDifCambio.rbTCPeriodoClick(Sender: TObject);
var
 xWhere : String;
begin
    xWhere := 'Fecha='+''''+formatdatetime(wFormatFecha,dtpFComp.date)+''' AND TMONID='''+DMCNT.wTMonExt+'''';
    dbeTCPeriodo.Text:= DMCNT.DisplayDescrip('PrvTGE','TGE107','TCAMVOV',xWhere,'TCAMVOV');

end;

end.
