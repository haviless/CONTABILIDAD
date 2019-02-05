unit CNT264;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : CNT264
//Formulario               : FMayAuxDet
//Fecha de Creación        :
//Autor                    : Equipo de desarrollo
//Objetivo                 : Reporte de Mayor Auxiliar detallado

//ACTUALIZACIONES
//HPC_201206_CNT 16/10/2012:  Exportacion a excel del reporte de Mayor Auxiliar detallado
//HPC_2013XX_CNT 01/08/2013   RMEDINA se adiciona la generacion del archivo texto para la Planilla electronica PLE  
//HPC_201601_CNT 18/01/2016:  Se modifica denominación de abreviatura de moneda local

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdbdlg, ExtCtrls, wwdbdatetimepicker, Spin, StdCtrls, wwdblook, Buttons,
  ppEndUsr, ppVar, ppCtrls, ppBands, ppClass, ppPrnabl, ppProd, ppReport,
  ppDB, ppComm, ppRelatv, ppCache, ppDBPipe, ppViewr, ppTxPipe,
  Menus, Grids, Wwdbigrd, Wwdbgrid, oaVariables, ppParameter, wwExport,
  //INICIO HPC_201206_CNT
  shellapi,
  //FIN HPC_201206_CNT
  Mask, ppTypes, ComCtrls, StrContainer, db, DBClient;
type
  TFMayAuxDet = class(TForm)
    pnlMayor: TPanel;
    lblCia: TLabel;
    Label2: TLabel;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    gbPer: TGroupBox;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    dbdtpFReg1: TwwDBDateTimePicker;
    dbdtpFReg2: TwwDBDateTimePicker;
    rgCuenta: TRadioGroup;
    Z2bbtnSelCuenta: TBitBtn;
    rgTipo: TRadioGroup;
    gbRangos: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    dblcdDesde: TwwDBLookupComboDlg;
    dblcdHasta: TwwDBLookupComboDlg;
    ppdbMayorAna: TppDBPipeline;
    ppDesigner1: TppDesigner;
    MainMenu1: TMainMenu;
    bbtnExcel: TBitBtn;
    dbgMayAuxDet: TwwDBGrid;
    sdGrabExcel: TSaveDialog;
    MEditTitulo: TMaskEdit;
    Label4: TLabel;
    pprm: TppReport;
    ppParameterList1: TppParameterList;
    btnExportTexto: TBitBtn;
    pbExp: TProgressBar;
    sdGraba: TSaveDialog;
    scFile: TStrContainer;
    ppHeaderBand1: TppHeaderBand;
    pplblTitulo: TppLabel;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel4: TppLabel;
    pplblPerFech: TppLabel;
    ppLabel6: TppLabel;
    ppsvFec: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel8: TppLabel;
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
    ppLabel71: TppLabel;
    ppLabel73: TppLabel;
    ppLabel75: TppLabel;
    ppLabel1: TppLabel;
    ppDBText5: TppDBText;
    ppDBText15: TppDBText;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    pplbCia1: TppLabel;
    ppLabel11: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppdbTDiario: TppDBText;
    ppdbComprob: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    gbFecRep: TGroupBox;
    dtpFecRep: TwwDBDateTimePicker;
    cbFecRep: TCheckBox;
    pplFec: TppLabel;
    Memo1: TMemo;
    btnExportarExcel: TBitBtn;
    BtnPLE: TBitBtn;
    cbDisenoRep: TCheckBox;
    sbDisenoRep: TSpeedButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure gbPerExit(Sender: TObject);
    procedure dbdtpFReg2Exit(Sender: TObject);
    procedure rgCuentaClick(Sender: TObject);
    procedure Z2bbtnSelCuentaClick(Sender: TObject);
    procedure speMMExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcdDesdeExit(Sender: TObject);
    procedure ppdbTDiarioPrint(Sender: TObject);
    procedure dblcdHastaExit(Sender: TObject);
    procedure ppLabel13Print(Sender: TObject);
    procedure pplbCia1Print(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancClick(Sender: TObject);
    procedure bbtnExcelClick(Sender: TObject);
    procedure pprMayorAnaPreviewFormCreate(Sender: TObject);
    procedure pprmPreviewFormCreate(Sender: TObject);
    procedure btnExportTextoClick(Sender: TObject);
    procedure cbFecRepClick(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure btnExportarExcelClick(Sender: TObject);
    procedure BtnPLEClick(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }
    xCampo,xSQL : String;
    xbExportarExcel :Boolean;    
    procedure CalculaSaldos;
    function RetornaDatos( cCampo : String ) : String;
    //INICIO HPC_201206_CNT
    procedure fg_ExportarExcel(wgFormato: String);
    //FIN HPC_201206_CNT
    //INICIO RMZ
    Procedure  fg_HabilitabotonPLE;
   //FINAL  RMZ
  public
    { Public declarations }
    // vhn
    sCiaOrigen : String;
    sCiaCuenta : String;
  end;

var
  FMayAuxDet: TFMayAuxDet;
  SFMN, SFME: DOUBLE;
  xx: SmallInt;
  xWhere,xWhere1, xCia, xCta, xClAux, xAux: String;
  xTipoSalida : String;

implementation

uses CNTDM, CNT412, CNT998, oaCN3000, CNT264A;

{$R *.DFM}


procedure TFMayAuxDet.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFMayAuxDet.speMMExit(Sender: TObject);
begin
	if StrtoInt(speMM.Text) > 12 then
  begin
    speMM.Text:='01';
    speAno.Value:=speAno.Value+1;
  end;
end;

procedure TFMayAuxDet.gbPerExit(Sender: TObject);
var
	xFecha1, xFecha2 : TDateTime;
  //wFechaM,wFechaA :String;
begin
	xFecha1 := strtodate('01/'+DMCNT.strZero(speMM.Text,2)+'/'+speAno.Text);
  if strtofloat(speMM.Text)+1=13 then
  begin
  	xFecha2 := strtodate('01/01/'+ FloatToStr(StrToFloat(speAno.Text)+1));
  end
  else
  begin
  	xFecha2:=strtodate('01/'+DMCNT.strZero(floattostr(strtofloat(speMM.Text)+1),2)+'/'+speAno.Text);
  end;
  xFecha2:=xFecha2-1;
  dbdtpFReg1.date:=xFecha1;
  dbdtpFReg2.date:=xFecha2;
end;

procedure TFMayAuxDet.dbdtpFReg2Exit(Sender: TObject);
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

end;

procedure TFMayAuxDet.rgCuentaClick(Sender: TObject);
begin
  if rgCuenta.Itemindex = 0 then
  begin
		Z2bbtnSelCuenta.enabled := False;
   	gbRangos.Enabled:=False;
   	dblcdDesde.Text:='';
   	dblcdHasta.Text:='';
   	dblcdDesde.Enabled:=False;
   	dblcdHasta.Enabled:=False;
      //Inicio RMZ
       fg_HabilitabotonPLE;
      //Final RMZ
  end;
  if rgCuenta.Itemindex = 1 then
  begin
  	Screen.Cursor:=crHourGlass;
   	Z2bbtnSelCuenta.enabled := False;
   	gbRangos.Enabled:=True;
   	dblcdDesde.Text:='';
   	dblcdHasta.Text:='';
   	dblcdDesde.Enabled:=True;
   	dblcdHasta.Enabled:=True;
   	dblcdDesde.Text:='';
   	dblcdHasta.Text:='';
    xSQL :='SELECT CUENTAID, CTADES, CTAABR, ''N'' FLAG ' +
           'FROM TGE202 ' +
           'WHERE CTA_DET=''S'' AND CIAID='+QuotedStr(dblcCia.Text);

   if sCiaCuenta<>'' then
      xSQL := xSQL + ' and ' +sCiaCuenta;

    DMCNT.cdsCuenta.fetchondemand:=False;
    DMCNT.cdsCuenta.packetrecords:=-1;
    DMCNT.cdsCuenta.fetchondemand:=True;
    DMCNT.FiltraCDS(DMCNT.cdsCuenta,xSQL);
    DMCNT.cdsCuenta.IndexFieldNames:='CUENTAID';
		dblcdDesde.SetFocus;
    Screen.Cursor:=CrDefault;
      //Inicio RMZ
       BtnPLE.Visible := False;
      //Final RMZ
  end;
  if rgCuenta.Itemindex = 2 then
  begin
  	Screen.Cursor:=crHourGlass;
   	dblcdDesde.Text:='';
   	dblcdHasta.Text:='';
   	Z2bbtnSelCuenta.enabled := True;
   	Z2bbtnSelCuenta.Click;
   	gbRangos.Enabled:=False;
   	dblcdDesde.Enabled:=False;
   	dblcdHasta.Enabled:=False;
      //Inicio RMZ
       BtnPLE.Visible := False;
      //Final RMZ
  end;
end;

procedure TFMayAuxDet.Z2bbtnSelCuentaClick(Sender: TObject);
begin
	Screen.Cursor:=crHourGlass;
	FConsulta.FSelCuenta1.sCia:=dblcCia.text;
  FConsulta.FSelCuenta1.ShowModal;
end;

procedure TFMayAuxDet.bbtnOkClick(Sender: TObject);
var
	xSQL, xSustrae, SalIniHas : String;
  wFecha1,wFecha, wAno, wMes, wMesAnt, xGrp: String;
  CampoDMN,CampoHMN,CampoSMN,CampoDME,CampoHME,CampoSME: String;
  xTDMN, xTHMN, xTDME, xTHME: DOUBLE;
  Year, Month, Day: Word;
  xPos,xZ,xAncho : Integer;
  xMonedaL,xMonedaE,xDesde,xHasta : String;
  wMesx, wAnox : String;
  // vhn
  sCtaLog, sTmpWhere : String;

begin
  SalIniHas   :=quotedStr(formatdatetime(wFormatFecha,dbdtpFReg2.DateTime));
  xMonedaL := DMCNT.DisplayDescrip('prvTGE','TGE103','TMONABR','TMON_LOC='+quotedstr('L'),'TMONABR');
  xMonedaE := DMCNT.DisplayDescrip('prvTGE','TGE103','TMONABR','TMON_LOC='+quotedstr('E'),'TMONABR');
  SFMN:=0; SFME:=0; xx:=0;
  xWhere :='';
  xWhere1:='';
  sCtaLog:='';
  if (rgCuenta.ItemIndex=2) and (FConsulta.FSelCuenta1.cdsClone.recordcount>0) then
  begin
 // if length(xWhere)>0 then
    begin
    	xWhere  :=' AND ';		// Para Saldos
      xWhere1 :=' AND ';		// Para Movimientos
    end;
    xWhere  := xWhere +'C.CUENTAID IN (' ;
    xWhere1 := xWhere1+'A.CUENTAID IN (' ;
    // vhn
    sCtaLog :='CUENTAID IN ( ';

    FConsulta.FSelCuenta1.cdsClone.First ;
    while not FConsulta.FSelCuenta1.cdsClone.Eof do
    begin
      xWhere := xWhere  + '''' + FConsulta.FSelCuenta1.cdsClone.FieldByName('CUENTAID').AsString + '''';
      xWhere1:= xWhere1 + '''' + FConsulta.FSelCuenta1.cdsClone.FieldByName('CUENTAID').AsString + '''';
      sCtaLog:= sCtaLog + FConsulta.FSelCuenta1.cdsClone.FieldByName('CUENTAID').AsString;
      FConsulta.FSelCuenta1.cdsClone.Next ;
      if not FConsulta.FSelCuenta1.cdsClone.eof then
      begin
        xWhere := xWhere  + ' , ' ;
        xWhere1:= xWhere1 + ' , ' ;
        sCtaLog:= sCtaLog + ', ' ;
      end;
    end;
    xwhere := xwhere  + ')';
    xwhere1:= xwhere1 + ')';
    sCtaLog:= sCtaLog + ' )';
  end ;

  if rgCuenta.ItemIndex = 1 then
  begin
  	If Length(dblcdDesde.Text)=0 Then
    Begin
    	showmessage('Debe seleccionar la Cuenta de Inicio');
      dblcdDesde.SetFocus;
      exit;
    End;
    If Length(dblcdHasta.Text)=0 Then
    Begin
    	showmessage('Debe seleccionar la Cuenta de Fin');
      dblcdHasta.SetFocus;
      exit;
    End;
    If Length(dblcdDesde.Text)>Length(dblcdHasta.Text) Then
    Begin
      xAncho:=Length(dblcdHasta.Text);
    End
    Else
    Begin
      xAncho:=Length(dblcdDesde.Text);
    End;

    If StrToInt(Copy(dblcdDesde.Text,1,xAncho))>StrToInt(Copy(dblcdHasta.Text,1,xAncho)) Then
    Begin
      showmessage('La Cuenta Inicio debe ser Menor a la Cuenta Fin');
      dblcdDesde.SetFocus;
      exit;
    End;
    If StrToInt(Copy(dblcdHasta.Text,1,xAncho))<StrToInt(Copy(dblcdDesde.Text,1,xAncho)) Then
    Begin
      showmessage('La Cuenta de Fin debe ser Mayor que la Cuenta de Inicio');
      dblcdHasta.SetFocus;
      exit;
    End;

    xDesde:=Trim(dblcdDesde.Text);
    xHasta:=Trim(dblcdHasta.Text);

    xWhere :=xWhere +' AND C.CUENTAID BETWEEN '+QuotedStr(xDesde)+' AND '+QuotedStr(xHasta)+' ';
    xWhere1:=xWhere1+' AND A.CUENTAID BETWEEN '+QuotedStr(xDesde)+' AND '+QuotedStr(xHasta)+' ';
    sCtaLog:='CUENTAID BETWEEN '+xDesde+' AND '+xHasta;
    {
    if DMCNT.cFilterCuentaUser<>'' then
    begin
      sTmpWhere:=StringReplace(DMCNT.cFilterCuentaUser,'CUENTAID','C.CUENTAID',[rfreplaceall]);
      sTmpWhere:=StringReplace(sTmpWhere,'CIAID','C.CIAID',[rfreplaceall]);
      xWhere :=xWhere +' and '+sTmpWhere;

      sTmpWhere:=StringReplace(DMCNT.cFilterCuentaUser,'CUENTAID','A.CUENTAID',[rfreplaceall]);
      sTmpWhere:=StringReplace(sTmpWhere,'CIAID','A.CIAID',[rfreplaceall]);
      xWhere1:=xWhere1+' and '+sTmpWhere;
    end;}
  end;

  // VHNDEMA
  if rgCuenta.ItemIndex = 0 then
  begin
     if DMCNT.cFilterCuentaUser<>'' then
     begin
      {sTmpWhere:=StringReplace(DMCNT.cFilterCuentaUser,'CUENTAID','C.CUENTAID',[rfreplaceall]);
      sTmpWhere:=StringReplace(sTmpWhere,'CIAID','C.CIAID',[rfreplaceall]);
      xWhere :=xWhere +' and '+sTmpWhere;

      sTmpWhere:=StringReplace(DMCNT.cFilterCuentaUser,'CUENTAID','A.CUENTAID',[rfreplaceall]);
      sTmpWhere:=StringReplace(sTmpWhere,'CIAID','A.CIAID',[rfreplaceall]);
      xWhere1:=xWhere1+' and '+sTmpWhere;}
     end;
  end;
  // END VHNDEMA

	Screen.Cursor:=crHourGlass;

  DecodeDate(dbdtpFReg1.Date, Year, Month, Day);
  wMes := inttostr(Month);

  wMes:=DMCNT.StrZero(wMes,2);
  wMesAnt:=IntToStr(StrToInt(wMes)-1);
  wMesAnt:=DMCNT.StrZero(wMesAnt,2);

  wAno:= IntToStr(Year);
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      wFecha:='DATE('+''''+wAno+'-'+wMes+'-01'+''''+')'   // Fecha inicio pa movs faltantes
  else
   if SRV_D = 'ORACLE' then
     wFecha:='TO_DATE('+quotedstr('01'+'-'+wMes+'-'+wAno)+')';   // Fecha inicio pa movs faltantes

  wFecha1:='01/'+wMes+'/'+wano;
  CampoSMN := 'SALDMN'+wMesAnt; //wMes;
  CampoSME := 'SALDME'+wMesAnt; //wMes;
  CampoDMN := 'DEBEMN'+wMes;
  CampoHMN := 'HABEMN'+wMes;
  CampoDME := 'DEBEME'+wMes;
  CampoHME := 'HABEME'+wMes;

  wMesx:=DMCNT.StrZero( IntToStr(speMM.Value) ,2);
  wAnox:=IntToStr( speAno.Value );

// Selecciona datos de 301 k sobran en el periodo
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     xSQL:='SELECT C.CIAID, ''99'' TDIARID, ''999999999X'' CNTCOMPROB, ANO CNTANO, '''+wAnox+wMesx+''' CNTANOMM, '' '' CNTLOTE, CUENTAID, '' '' DOCID, '
      +''' '' CNTSERIE, '' '' CNTNODOC, ''Saldo Anterior'' CNTGLOSA, '' '' CNTDH, '' '' CCOSID, 0 CNTTCAMBIO, 0 CNTMTOORI, 0 CNTMTOLOC, 0 CNTMTOEXT, '
      +'current date CNTFEMIS, current date CNTFVCMTO, current date CNTFCOMP, '
      +''' '' CNTESTADO, '' '' CNTCUADRE, '' '' CNTFAUTOM, '' '' CNTMM, '' '' CNTDD, '' '' CNTTRI, '' '' CNTSEM, '' '' CNTSS, '' '' CNTAATRI, '
      +''' '' CNTAASEM, '' '' CNTAASS, '' '' TMONID, '' '' FLAGVAR, '' '' FCONS, '' '' CNTFMEC, '' '' TDIARDES, '' '' CTADES, '' '' DOCDES, '' '' CCOSDES, '
      +'CASE WHEN COALESCE('+CampoSMN+',0)>0 THEN COALESCE('+CampoSMN+',0) ELSE 0 END CNTDEBEMN, '
      +'CASE WHEN COALESCE('+CampoSME+',0)>0 THEN COALESCE('+CampoSME+',0) ELSE 0 END CNTDEBEME, '
      +'CASE WHEN COALESCE('+CampoSMN+',0)>0 THEN 0 ELSE COALESCE('+CampoSMN+',0)*-1 END CNTHABEMN, '
      +'CASE WHEN COALESCE('+CampoSME+',0)>0 THEN 0 ELSE COALESCE('+CampoSME+',0)*-1 END CNTHABEME, '
      +'0 CNTSALDMN, 0 CNTSALDME, '
      +''' '' CAMPOVAR, '' '' CNTTS, '' '' CNTPAGADO, '' '' CNTMODDOC, 0 CNTREG, '' '' CNTUSER, DATE('+SalIniHas+') CNTFREG, '
      +'CURRENT TIME CNTHREG, '
      +''' '' AUXID, B.CIADES, 0 CONTA '
      +'FROM CNT401 C, TGE101 B '
      +'WHERE C.CIAID='+QuotedStr(dblcCia.Text)+' '+xWhere+' '
      +'AND COALESCE(C.AUXID,''N'')=''N'' '
      +'AND C.CIAID=B.CIAID '
      +'AND COALESCE(C.CCOSID,''N'')=''N'' '
      +'AND C.ANO='+QuotedStr(speAno.Text)+' '
      +'UNION ALL '
      +'SELECT A.CIAID, A.TDIARID, A.CNTCOMPROB, A.CNTANO, A.CNTANOMM, A.CNTLOTE, A.CUENTAID, A.DOCID, A.CNTSERIE, '
      +'A.CNTNODOC, A.CNTGLOSA, A.CNTDH, A.CCOSID, A.CNTTCAMBIO, A.CNTMTOORI, A.CNTMTOLOC, A.CNTMTOEXT, '
      +'A.CNTFEMIS, A.CNTFVCMTO, A.CNTFCOMP, A.CNTESTADO, A.CNTCUADRE, A.CNTFAUTOM, A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS, '
      +'A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, A.FLAGVAR, A.FCONS, A.CNTFMEC, A.TDIARDES, A.CTADES, A.DOCDES, A.CCOSDES, '
      +'A.CNTDEBEMN, CASE WHEN TMONID='''+DMCNT.wTMonExt+''' then A.CNTDEBEME else 0 end CNTDEBEME, '
      +'A.CNTHABEMN, CASE WHEN TMONID='''+DMCNT.wTMonExt+''' THEN A.CNTHABEME else 0 end CNTHABEME, '
      +'A.CNTSALDMN, A.CNTSALDME, A.CAMPOVAR, A.CNTTS, A.CNTPAGADO, A.CNTMODDOC, A.CNTREG, A.CNTUSER, A.CNTFREG, A.CNTHREG, A.AUXID, D.CIADES, 0 CONTA '
      +'FROM CNT301 A, TGE202 B, TGE101 D, TGE202 E '
      +'WHERE A.CIAID='+QuotedStr(dblcCia.Text)+' '
      +'AND A.CIAID=D.CIAID '
      +'AND A.CNTFCOMP>=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+') '
      +'AND A.CNTFCOMP<=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')';
      case rgTipo.itemindex of
       0 : xSql := xSql + ' AND A.CNTESTADO  = ''P''  AND A.CNTCUADRE='+''''+'S'+''' '+xWhere1;
       1 : xSql := xSql + ' AND (A.CNTESTADO = ''P'' AND COALESCE(A.CNTCUADRE,''N'') <> ''S'' OR A.CNTESTADO = ''I''  AND COALESCE(A.CNTCUADRE,''N'') <> ''S'')'+xWhere1;
       2 : xSql := xSql + ' AND (A.CNTESTADO = ''I'' OR A.CNTESTADO = ''P'') AND' + xWhere1;
      end;
      xSql:=xSql +' AND B.CIAID='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = B.CUENTAID '
                 +' AND E.CIAID(+)='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = E.CUENTAID(+)'
                 +' AND SUBSTR( CNTANOMM,5,2)>''00'' '
    end
  else
  if SRV_D = 'ORACLE' then
  begin
     xSQL:='SELECT C.CIAID, ''99'' TDIARID, ''999999999X'' CNTCOMPROB, ANO CNTANO, '''+wAnox+wMesx+''' CNTANOMM, '' '' CNTLOTE, D.CUENTAID, '' '' DOCID, '
      +''' '' CNTSERIE, '' '' CNTNODOC, ''Saldo Anterior'' CNTGLOSA, '' '' CNTDH, '' '' CCOSID, 0 CNTTCAMBIO, 0 CNTMTOORI, 0 CNTMTOLOC, 0 CNTMTOEXT, '
      +'TO_DATE('''') CNTFEMIS, TO_DATE('''') CNTFVCMTO, TO_DATE('''') CNTFCOMP, '
      +''' '' CNTESTADO, '' '' CNTCUADRE, '' '' CNTFAUTOM, '' '' CNTMM, '' '' CNTDD, '' '' CNTTRI, '' '' CNTSEM, '' '' CNTSS, '' '' CNTAATRI, '
      +''' '' CNTAASEM, '' '' CNTAASS, '' '' TMONID, '' '' FLAGVAR, '' '' FCONS, '' '' CNTFMEC, '' '' TDIARDES, D.CTADES, '' '' DOCDES, '' '' CCOSDES, '
      +'CASE WHEN NVL('+CampoSMN+',0)>0 THEN NVL('+CampoSMN+',0) ELSE 0 END CNTDEBEMN, '
      +'CASE WHEN NVL('+CampoSME+',0)>0 THEN NVL('+CampoSME+',0) ELSE 0 END CNTDEBEME, '
      +'CASE WHEN NVL('+CampoSMN+',0)>0 THEN 0 ELSE NVL('+CampoSMN+',0)*-1 END CNTHABEMN, '
      +'CASE WHEN NVL('+CampoSME+',0)>0 THEN 0 ELSE NVL('+CampoSME+',0)*-1 END CNTHABEME, '
      +'0 CNTSALDMN, 0 CNTSALDME, '
      +''' '' CAMPOVAR, '' '' CNTTS, '' '' CNTPAGADO, '' '' CNTMODDOC, 0 CNTREG, '' '' CNTUSER, TO_DATE('+SalIniHas+') CNTFREG, '
      +'TO_DATE('''') CNTHREG, '
      +''' '' AUXID, B.CIADES, 0 CONTA '
      +'FROM CNT401 C, TGE101 B, TGE202 D '
      +'WHERE C.CIAID='+QuotedStr(dblcCia.Text)+' '+xWhere+' '
      +'AND NVL(C.AUXID,''N'')=''N'' '
      +'AND C.CIAID=B.CIAID '
      +'AND NVL(C.CCOSID,''N'')=''N'' '
      +'AND C.ANO='+QuotedStr(speAno.Text)+' '
      +'AND D.CIAID(+)='+quotedstr(dblcCia.Text)+' AND C.CUENTAID=D.CUENTAID(+) ';

      if sCiaCuenta<>'' then
         xSQL := xSQL + ' and C.'+sCiaCuenta;

     xSQL := xSQL
      +'UNION ALL '

      +'SELECT A.CIAID, A.TDIARID, A.CNTCOMPROB, A.CNTANO, A.CNTANOMM, A.CNTLOTE, A.CUENTAID, A.DOCID, A.CNTSERIE, '
      +'A.CNTNODOC, A.CNTGLOSA, A.CNTDH, A.CCOSID, A.CNTTCAMBIO, A.CNTMTOORI, A.CNTMTOLOC, A.CNTMTOEXT, '
      +'A.CNTFEMIS, A.CNTFVCMTO, A.CNTFCOMP, A.CNTESTADO, A.CNTCUADRE, A.CNTFAUTOM, A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS, '
      +'A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, A.FLAGVAR, A.FCONS, A.CNTFMEC, A.TDIARDES, E.CTADES, A.DOCDES, A.CCOSDES, '
      +'A.CNTDEBEMN, CASE WHEN TMONID='''+DMCNT.wTMonExt+''' then A.CNTDEBEME else 0 end CNTDEBEME, '
      +'A.CNTHABEMN, CASE WHEN TMONID='''+DMCNT.wTMonExt+''' THEN A.CNTHABEME else 0 end CNTHABEME, '
      +'A.CNTSALDMN, A.CNTSALDME, A.CAMPOVAR, A.CNTTS, A.CNTPAGADO, A.CNTMODDOC, A.CNTREG, A.CNTUSER, A.CNTFREG, A.CNTHREG, A.AUXID, D.CIADES, 0 CONTA '
      +'FROM CNT301 A, TGE202 B, TGE101 D, TGE202 E '
      +'WHERE A.CIAID='+QuotedStr(dblcCia.Text)+' '
      +'AND A.CIAID=D.CIAID '
      +'AND trunc(A.CNTFCOMP)>=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+') '
      +'AND trunc(A.CNTFCOMP)<=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')';
      case rgTipo.itemindex of
       0 : xSql := xSql + ' AND A.CNTESTADO = ''P'' AND A.CNTCUADRE='+''''+'S'+''' '+xWhere1;
       1 : xSql := xSql + ' AND (A.CNTESTADO = ''P''  AND NVL(A.CNTCUADRE,''N'') <> ''S'' OR A.CNTESTADO = ''I''  AND NVL(A.CNTCUADRE,''N'') <> ''S'')'+xWhere1;
       2 : xSql := xSql + ' AND (A.CNTESTADO = ''I'' OR A.CNTESTADO = ''P'') AND' + xWhere1;
      end;
      if sCiaCuenta<>'' then
         xSQL := xSQL + ' and A.'+sCiaCuenta;

      xSql:=xSql +' AND B.CIAID(+)='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = B.CUENTAID(+) AND B.CTA_ME(+)=''S'' '
                 +' AND E.CIAID(+)='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = E.CUENTAID(+) '
                 +'AND SUBSTR( CNTANOMM,5,2)>''00'''
    end;

  DMCNT.cdsReporte.Close;
  DMCNT.cdsReporte.DataRequest(xSQL);
  DMCNT.cdsReporte.Open;

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
  xSQL:='SELECT A.CIAID, A.CUENTAID, '
       +'SUM(A.CNTDEBEMN) CNTDEBEMN, '
       +'COALESCE( SUM( CASE WHEN TMONID='''+DMCNT.wTmonExt+''' then A.CNTDEBEME else 0 end ), 0 ) CNTDEBEME, '
       +'SUM(A.CNTHABEMN) CNTHABEMN, '
       +'COALESCE( SUM( CASE WHEN TMONID='''+DMCNT.wTmonExt+''' then A.CNTHABEME else 0 end ), 0 ) CNTHABEME '
       +'FROM CNT301 A, TGE202 B '
       +'WHERE A.CIAID='+QuotedStr(dblcCia.Text)+' '
       +'AND A.CNTFCOMP>=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+') '
       +'AND A.CNTFCOMP<=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')';
       case rgTipo.itemindex of
        0 : xSql := xSql + ' AND A.CNTESTADO = ''P''  AND A.CNTCUADRE='+''''+'S'+''' '+xWhere1;
        1 : xSql := xSql + ' AND (A.CNTESTADO = ''P'' AND coalesce(A.CNTCUADRE,''N'') <> ''S'' OR A.CNTESTADO = ''I''  AND coalesce(A.CNTCUADRE,''N'') <> ''S'')'+xWhere1;
        2 : xSql := xSql + ' AND (A.CNTESTADO = ''I'' OR A.CNTESTADO = ''P'') AND' + xWhere1;
       end;
       xSql:=xSql +' AND B.CIAID='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = B.CUENTAID '
                  +'AND SUBSTR( CNTANOMM,5,2)>''00'''
       +'GROUP BY A.CIAID, A.CUENTAID';
  end
  else
  if SRV_D = 'ORACLE' then
  begin
  xSQL:='SELECT A.CIAID, A.CUENTAID, '
       +'SUM(A.CNTDEBEMN) CNTDEBEMN, '
       +'NVL(SUM(CASE WHEN A.TMONID = ''D'' THEN A.CNTDEBEME ELSE 0 END),0) CNTDEBEME,'
       +'SUM(A.CNTHABEMN) CNTHABEMN, '
       +'NVL(SUM(CASE WHEN A.TMONID = ''D'' THEN A.CNTHABEME ELSE 0 END),0) CNTHABEME'
       +' FROM CNT301 A, TGE202 B '
       +' WHERE A.CIAID='+QuotedStr(dblcCia.Text)+' '
       +' AND A.CNTFCOMP>=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+') '
       +' AND A.CNTFCOMP<=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')';
       case rgTipo.itemindex of
        0 : xSql := xSql + ' AND A.CNTESTADO = ''P'' AND A.CNTCUADRE='+''''+'S'+''' '+xWhere1;
        1 : xSql := xSql + ' AND (A.CNTESTADO = ''P''  AND NVL(A.CNTCUADRE,''N'') <> ''S'' OR A.CNTESTADO = ''I''  AND NVL(A.CNTCUADRE,''N'') <> ''S'')'+xWhere1;
        2 : xSql := xSql + ' AND (A.CNTESTADO = ''I'' OR A.CNTESTADO = ''P'') AND' + xWhere1;
       end;
       if sCiaCuenta<>'' then
          xSQL := xSQL + ' and A.'+sCiaCuenta;

       xSql:=xSql +' AND B.CIAID(+)='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = B.CUENTAID(+) AND B.CTA_ME(+)=''S'' '
                  +'AND SUBSTR( CNTANOMM,5,2)>''00'''
       +' GROUP BY A.CIAID, A.CUENTAID';
  end;
  DMCNT.cdsCierres.Close;
  DMCNT.cdsCierres.DataRequest(xSQl);				// Total de Mov.
  DMCNT.cdsCierres.Open;


  // vhn
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
  xSQL:='SELECT C.CIAID, C.CUENTAID, D.CTA_DET, D.CTA_MOV, '
       +'CASE WHEN COALESCE('+CampoSMN+',0)>0 THEN COALESCE('+CampoSMN+',0) ELSE 0 END CNTDEBEMN, '
       +'CASE WHEN COALESCE('+CampoSME+',0)>0 THEN COALESCE('+CampoSME+',0) ELSE 0 END CNTDEBEME, '
       +'CASE WHEN COALESCE('+CampoSMN+',0)>0 THEN 0 ELSE COALESCE('+CampoSMN+',0) END CNTHABEMN, '
       +'CASE WHEN COALESCE('+CampoSME+',0)>0 THEN 0 ELSE COALESCE('+CampoSME+',0) END CNTHABEME, '
       +'COALESCE('+CampoDMN+',0) DEBEMN, COALESCE('+CampoHMN+',0) HABEMN, '
       +'COALESCE('+CampoDME+',0) DEBEME, COALESCE('+CampoHME+',0) HABEME '
       +'FROM CNT401 C, TGE202 D '
       +'WHERE C.CIAID='+QuotedStr(dblcCia.Text)+' '+xWhere+' '
       +'AND COALESCE(C.AUXID,''N'')=''N'' '
       +'AND COALESCE(C.CCOSID,''N'')=''N'' '
       +'AND C.ANO='+QuotedStr(speAno.Text)+' '
			 +'AND C.CIAID=D.CIAID '
       +'AND C.CUENTAID=D.CUENTAID';
  end
  else
  if SRV_D = 'ORACLE' then
  begin
  xSQL:='SELECT C.CIAID, C.CUENTAID, D.CTA_DET, D.CTA_MOV, '
       +'CASE WHEN NVL('+CampoSMN+',0)>0 THEN NVL('+CampoSMN+',0) ELSE 0 END CNTDEBEMN, '
       +'CASE WHEN NVL('+CampoSME+',0)>0 THEN NVL('+CampoSME+',0) ELSE 0 END CNTDEBEME, '
       +'CASE WHEN NVL('+CampoSMN+',0)>0 THEN 0 ELSE NVL('+CampoSMN+',0) END CNTHABEMN, '
       +'CASE WHEN NVL('+CampoSME+',0)>0 THEN 0 ELSE NVL('+CampoSME+',0) END CNTHABEME, '
       +'NVL('+CampoDMN+',0) DEBEMN, NVL('+CampoHMN+',0) HABEMN, '
       +'NVL('+CampoDME+',0) DEBEME, NVL('+CampoHME+',0) HABEME '
       +'FROM CNT401 C, TGE202 D '
       +'WHERE C.CIAID='+QuotedStr(dblcCia.Text)+' '+xWhere+' '
       +'AND NVL(C.AUXID,''N'')=''N'' '
       +'AND NVL(C.CCOSID,''N'')=''N'' '
       +'AND C.ANO='+QuotedStr(speAno.Text)+' '
			 +'AND C.CIAID=D.CIAID '
       +'AND C.CUENTAID=D.CUENTAID';

      if sCiaCuenta<>'' then
         xSQL := xSQL + ' and C.'+sCiaCuenta;

  end;

  DMCNT.cdsCNTtemp.Close;
  DMCNT.cdsCNTtemp.DataRequest(xSQl);			// Total de Saldos
  DMCNT.cdsCNTtemp.Open;
  DMCNT.cdsCNTtemp.IndexFieldNames:='CUENTAID';

  DMCNT.cdsCierres.IndexFieldNames:='CUENTAID';
  DMCNT.cdsCNTtemp.First;
  while Not DMCNT.cdsCNTtemp.Eof do
  begin
  	DMCNT.cdsCierres.SetKey;						// Total de Saldo
  	DMCNT.cdsCierres.FieldByName('CUENTAID').AsString:=DMCNT.cdsCNTtemp.FieldByName('CUENTAID').AsString;
    if not DMCNT.cdsCierres.GotoKey then
    begin
      DMCNT.cdsCierres.Insert;
      DMCNT.cdsCierres.FieldByName('CIAID').AsString     := dblcCia.Text;
      DMCNT.cdsCierres.FieldByName('CUENTAID').AsString  := DMCNT.cdsCNTtemp.FieldByName('CUENTAID').AsString;

      if (DMCNT.cdsCNTtemp.FieldByName('CTA_DET').AsString = 'N') and
         (DMCNT.cdsCNTtemp.FieldByName('CTA_MOV').AsString = 'N') then
      begin
      	DMCNT.cdsCierres.FieldByName('CNTDEBEMN').AsString := DMCNT.cdsCNTtemp.FieldByName('DEBEMN').AsString;
      	DMCNT.cdsCierres.FieldByName('CNTDEBEME').AsString := DMCNT.cdsCNTtemp.FieldByName('DEBEME').AsString;
      	DMCNT.cdsCierres.FieldByName('CNTHABEMN').AsString := DMCNT.cdsCNTtemp.FieldByName('HABEMN').AsString;
      	DMCNT.cdsCierres.FieldByName('CNTHABEME').AsString := DMCNT.cdsCNTtemp.FieldByName('HABEME').AsString;
      end
      else
      begin
      	DMCNT.cdsCierres.FieldByName('CNTDEBEMN').AsString := '0';
      	DMCNT.cdsCierres.FieldByName('CNTDEBEME').AsString := '0';
      	DMCNT.cdsCierres.FieldByName('CNTHABEMN').AsString := '0';
      	DMCNT.cdsCierres.FieldByName('CNTHABEME').AsString := '0';
      end;
      DMCNT.cdsCierres.Post;
    end;
    DMCNT.cdsCNTtemp.Next;
  end;

  DMCNT.cdsCierres.IndexFieldNames:='';

  xSQL:='SELECT C.CUENTAID '
       +'FROM CNT401 C '
       +'WHERE C.CIAID='+QuotedStr(dblcCia.Text)+' '+xWhere+' '
       +'AND '+wReplacCeros+'(C.AUXID,''N'')=''N'' '
       +'AND '+wReplacCeros+'(C.CCOSID,''N'')=''N'' '
       +'AND C.ANO='+QuotedStr(speAno.Text);
  if sCiaCuenta<>'' then
     xSQL := xSQL + ' and C.'+sCiaCuenta;

  DMCNT.cdsQry.Close;
  DMCNT.cdsQry.DataRequest(xSQl);
  DMCNT.cdsQry.Open;

  CalculaSaldos;

  if DMCNT.cdsReporte.RecordCount=0 then
  begin
  	ShowMessage('No hay datos que mostrar');
    Screen.Cursor:=CrDefault;
    exit;
  end;

  DMCNT.cdsReporte.IndexFieldNames:='';
  DMCNT.cdsReporte.IndexFieldNames:='CUENTAID;CNTANOMM;TDIARID;CNTCOMPROB;CNTFCOMP;CNTREG;CNTSERIE;CNTNODOC';
  pprM.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\MayAuxDetTX.rtm';
  pprM.template.LoadFromFile ;

  pplblPerFech.Caption := 'DEL ' + DateToStr(dbdtpFReg1.Date) + ' AL '+DateToStr(dbdtpFReg2.Date);// speAno.Text + speMM.Text;
  pplblTitulo.caption := MEditTitulo.text;
  ppLabel23.caption := 'Debe '+xMonedaL;
  ppLabel24.caption := 'Haber '+xMonedaL;
  ppLabel73.caption := 'Debe '+xMonedaE;
  ppLabel75.caption := 'Haber '+xMonedaE;

   DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Mayor Auxiliar Detallado',
                     dblcCia.Text,                                  // Campañía
                     speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
                     dbdtpFReg1.Text, dbdtpFReg2.Text,              // Fecha   Inicio - final
                     '',  '',                                       // Nivel   - Origen
                     '', '',                                       // Lote    -  Moneda
                     sCtaLog, '',                                  // Cuentas - Auxiliares
                     '', 'Impresora',                               // Costos - Tipo Salida
                     '' );               // Tipo Rep

  // vhndema
  If cbDisenoRep.Checked Then
  begin
     ppDesigner1.ShowModal;
  end
  else
  begin
    pprM.Print;
    pprM.Stop;
  end;

  DMCNT.cdsReporte.IndexFieldNames:='';
  Screen.Cursor:=CrDefault;
end;

procedure TFMayAuxDet.CalculaSaldos;
var
	xTotMN, xTotHabMN, xTotME, xTotHabME : Double;
  xConta  : Integer;
  wMesx, wAnox : String;
begin
	xTotMN:=0; xTotHabMN:=0; xTotME:=0; xTotHabME:=0; xConta:=0;

  wMesx:=DMCNT.StrZero( IntToStr(speMM.Value) ,2);
  wAnox:=IntToStr( speAno.Value );

  DMCNT.cdsReporte.IndexFieldNames:='';
  DMCNT.cdsReporte.IndexFieldNames:='CUENTAID';

  DMCNT.cdsQry.First;
  while not DMCNT.cdsQry.Eof do
  begin
  	DMCNT.cdsReporte.SetKey;						// Total de Saldo
  	DMCNT.cdsReporte.FieldByName('CUENTAID').AsString:=DMCNT.cdsQry.FieldByName('CUENTAID').AsString;
    if not DMCNT.cdsReporte.GotoKey then
    begin
      DMCNT.cdsReporte.Insert;
      DMCNT.cdsReporte.FieldByName('CIAID').AsString     := dblcCia.Text;
      DMCNT.cdsReporte.FieldByName('CIADES').AsString    := edtCia.Text;
      DMCNT.cdsReporte.FieldByName('CUENTAID').AsString  := DMCNT.cdsQry.FieldByName('CUENTAID').AsString;
      DMCNT.cdsReporte.FieldByName('CNTANOMM').AsString  := wAnox+wMesx;
      DMCNT.cdsReporte.FieldByName('TDIARID').AsString   := '99'; // '7x'; // jcc 24/09/2002
      DMCNT.cdsReporte.FieldByName('CNTCOMPROB').AsString := '999999999X'; // jcc 24/09/2002
      DMCNT.cdsReporte.FieldByName('CNTGLOSA').AsString  := 'Saldo Anterior';
      DMCNT.cdsReporte.FieldByName('CNTDEBEMN').AsString := '0';
      DMCNT.cdsReporte.FieldByName('CNTDEBEME').AsString := '0';
      DMCNT.cdsReporte.FieldByName('CNTHABEMN').AsString := '0';
      DMCNT.cdsReporte.FieldByName('CNTHABEME').AsString := '0';
      DMCNT.cdsReporte.FieldByName('CONTA').AsString     := '0';
      DMCNT.cdsReporte.Post;
    end;
    DMCNT.cdsQry.Next;
  end;

  DMCNT.cdsReporte.IndexFieldNames:='';
  DMCNT.cdsReporte.IndexFieldNames:='CUENTAID;TDIARID;CNTCOMPROB;CNTFCOMP;CNTSERIE;CNTNODOC';

	DMCNT.cdsCierres.First;
  while not DMCNT.cdsCierres.Eof do
  begin
    DMCNT.cdsReporte.Insert;
    DMCNT.cdsReporte.FieldByName('CIAID').AsString     := dblcCia.Text;
    DMCNT.cdsReporte.FieldByName('CIADES').AsString    := edtCia.Text;
    DMCNT.cdsReporte.FieldByName('CUENTAID').AsString  := DMCNT.cdsCierres.FieldByName('CUENTAID').AsString;
    DMCNT.cdsReporte.FieldByName('CNTANOMM').AsString  := wAnox+wMesx;
    DMCNT.cdsReporte.FieldByName('TDIARID').AsString   := '99'; // '8x'; // jcc 24/09/2002
    DMCNT.cdsReporte.FieldByName('CNTCOMPROB').AsString := '999999999Y'; // jcc 24/09/2002
    DMCNT.cdsReporte.FieldByName('CNTGLOSA').AsString  := 'Movimiento del Mes';
    DMCNT.cdsReporte.FieldByName('CNTDEBEMN').AsString := DMCNT.cdsCierres.FieldByName('CNTDEBEMN').AsString;
    DMCNT.cdsReporte.FieldByName('CNTDEBEME').AsString := DMCNT.cdsCierres.FieldByName('CNTDEBEME').AsString;
    DMCNT.cdsReporte.FieldByName('CNTHABEMN').AsString := DMCNT.cdsCierres.FieldByName('CNTHABEMN').AsString;
    DMCNT.cdsReporte.FieldByName('CNTHABEME').AsString := DMCNT.cdsCierres.FieldByName('CNTHABEME').AsString;
    DMCNT.cdsReporte.Post;

  	DMCNT.cdsCNTtemp.SetKey;						// Total de Saldo
  	DMCNT.cdsCNTtemp.FieldByName('CUENTAID').AsString:=DMCNT.cdsCierres.FieldByName('CUENTAID').AsString;
    if DMCNT.cdsCNTtemp.GotoKey then
    begin
       xTotMN:=(DMCNT.cdsCNTtemp.FieldByName('CNTDEBEMN').AsFloat + DMCNT.cdsCNTtemp.FieldByName('CNTHABEMN').AsFloat)+
              (DMCNT.cdsReporte.FieldByName('CNTDEBEMN').AsFloat - DMCNT.cdsReporte.FieldByName('CNTHABEMN').AsFloat);
       xTotME:=(DMCNT.cdsCNTtemp.FieldByName('CNTDEBEME').AsFloat + DMCNT.cdsCNTtemp.FieldByName('CNTHABEME').AsFloat)+
              (DMCNT.cdsReporte.FieldByName('CNTDEBEME').AsFloat - DMCNT.cdsReporte.FieldByName('CNTHABEME').AsFloat);
    end
    else
    begin
			xTotMN:=(DMCNT.cdsReporte.FieldByName('CNTDEBEMN').AsFloat-DMCNT.cdsReporte.FieldByName('CNTHABEMN').AsFloat);
			xTotME:=(DMCNT.cdsReporte.FieldByName('CNTDEBEME').AsFloat-DMCNT.cdsReporte.FieldByName('CNTHABEME').AsFloat);
    end;

    {if xTotMN < 0 then
    xTotMN:=(xTotMN)*-1;

    if xTotME < 0 then
    xTotME:=(xTotME)*-1;}

    DMCNT.cdsReporte.Insert;
    DMCNT.cdsReporte.FieldByName('CIAID').AsString     := dblcCia.Text;
    DMCNT.cdsReporte.FieldByName('CIADES').AsString    := edtCia.Text;
    DMCNT.cdsReporte.FieldByName('CUENTAID').AsString  := DMCNT.cdsCierres.FieldByName('CUENTAID').AsString;
    DMCNT.cdsReporte.FieldByName('CNTANOMM').AsString  := wAnox+wMesx;
    DMCNT.cdsReporte.FieldByName('TDIARID').AsString   := '99'; // '9x'; // jcc 24/09/2002
    DMCNT.cdsReporte.FieldByName('CNTCOMPROB').AsString := '999999999Z'; // jcc 24/09/2002
    DMCNT.cdsReporte.FieldByName('CNTGLOSA').AsString  := 'Saldo Actual';
    if xTotMN > 0 then
    begin
      DMCNT.cdsReporte.FieldByName('CNTDEBEMN').AsString := FloatToStrF(xTotMN,ffFixed,15,2);
      DMCNT.cdsReporte.FieldByName('CNTHABEMN').AsString := '0';
    end
    else
    begin
      xTotMN:=xTotMN*-1;
      DMCNT.cdsReporte.FieldByName('CNTDEBEMN').AsString := '0';
      DMCNT.cdsReporte.FieldByName('CNTHABEMN').AsString := FloatToStrF(xTotMN,ffFixed,15,2);
    end;
    if xTotME > 0 then
    begin
      DMCNT.cdsReporte.FieldByName('CNTDEBEME').AsString := FloatToStrF(xTotME,ffFixed,15,2);
      DMCNT.cdsReporte.FieldByName('CNTHABEME').AsString := '0';
    end
    else
    begin
    	xTotME:=xTotME*-1;
      DMCNT.cdsReporte.FieldByName('CNTDEBEME').AsString := '0';
      DMCNT.cdsReporte.FieldByName('CNTHABEME').AsString := FloatToStrF(xTotME,ffFixed,15,2);
    end;
    DMCNT.cdsReporte.Post;
    DMCNT.cdsCierres.Next;
  end;
end;


procedure TFMayAuxDet.dblcCiaExit(Sender: TObject);
var
   xSQl : String;
begin
   if (bbtnCanc.Focused) then exit;
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DMCNT.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   end;

    xSQL :='SELECT CUENTAID, CTADES, CTAABR, ''N'' FLAG ' +
           'FROM TGE202 ' +
           'WHERE CTA_DET=''S'' AND CIAID='+QuotedStr(dblcCia.Text);

    DMCNT.cdsCuenta.fetchondemand:=False;
    DMCNT.cdsCuenta.packetrecords:=-1;
    DMCNT.cdsCuenta.fetchondemand:=True;
    DMCNT.FiltraCDS(DMCNT.cdsCuenta,xSQL);
    DMCNT.cdsCuenta.IndexFieldNames:='CUENTAID';

    sCiaCuenta:=DMCNT.FiltraTablaxCia( DMCNT.cdsCuenta,  'TGE202', 'CUENTAID', dblcCia.Text );
    sCiaOrigen:=DMCNT.FiltraTablaxCia( DMCNT.cdsTDiario, 'TGE104', 'TDIARID',  dblcCia.Text );
    //Inicio RMZ
    fg_HabilitabotonPLE;
    //Final RMZ

end;

procedure TFMayAuxDet.dblcdDesdeExit(Sender: TObject);
begin
   if rgCuenta.Focused then Exit;
   if dblcdDesde.Text='' then Exit;

   xWhere := 'CUENTAID='+QuotedStr(dblcdDesde.Text)+' and CIAID='+''''+dblcCia.Text+'''' ;

   if sCiaCuenta<>'' then
      xWhere := xWhere + ' and ' +sCiaCuenta;

   if (DMCNT.DisplayDescrip('PrvTGE','TGE202','CTA_MOV',xWhere,'CTA_MOV')<>'S')
      and  (DMCNT.DisplayDescrip('PrvTGE','TGE202','CTA_DET',xWhere,'CTA_DET')<>'S') then
   begin
      dblcdDesde.Text:='';
      dblcdDesde.SetFocus;
      Showmessage('La Cuenta No es de Movimiento o No tiene Accesos a esta Cuenta') ;
   end;
end;

procedure TFMayAuxDet.ppdbTDiarioPrint(Sender: TObject);
begin
   if (Copy(ppdbComprob.Text,10,1)='X') or (Copy(ppdbComprob.Text,10,1)='Y') or (Copy(ppdbComprob.Text,10,1)='Z') then
      begin
         ppdbTDiario.Visible:=False;
         ppdbComprob.Visible:=False;
      end
   else
   begin
      ppdbTDiario.Visible:=True;
      ppdbComprob.Visible:=True;
   end
end;

procedure TFMayAuxDet.dblcdHastaExit(Sender: TObject);
begin
   if rgCuenta.Focused   then Exit;
   if dblcdHasta.Text='' then Exit;

   xWhere := 'CUENTAID='+QuotedStr(dblcdHasta.Text)+' and CIAID='+''''+dblcCia.Text+'''' ;

   if sCiaCuenta<>'' then
      xWhere := xWhere + ' and ' +sCiaCuenta;

   if (DMCNT.DisplayDescrip('PrvTGE','TGE202','CTA_MOV',xWhere,'CTA_MOV')<>'S')
      and  (DMCNT.DisplayDescrip('PrvTGE','TGE202','CTA_DET',xWhere,'CTA_DET')<>'S') then
   begin
     dblcdHasta.Text:='';
     dblcdHasta.SetFocus;
     Showmessage('La Cuenta No es de Movimiento') ;
   end;

end;

procedure TFMayAuxDet.ppLabel13Print(Sender: TObject);
begin
  if SRV_D = 'ORACLE' then
  begin
    If TRIM(dblcCia.Text)='01' Then
    Begin
      pplbCia1.Visible:=True;
      //ppLabel15.Left:=6;
    End
    Else
    Begin
      pplbCia1.Visible:=False;
    End;
  End;
end;

procedure TFMayAuxDet.pplbCia1Print(Sender: TObject);
begin
  if SRV_D = 'ORACLE' then
  begin
    If TRIM(dblcCia.Text)='01' Then
    Begin
      pplbCia1.Visible:=True;
      //ppLabel15.Left:=6;
    End
    Else
    Begin
      pplbCia1.Visible:=False;
    End;
  End;
end;

procedure TFMayAuxDet.FormShow(Sender: TObject);
var
	xAno, xMes, xDia: Word;
begin
  SFMN:=0; SFME:=0; xx:=0;
  ppdbMayorAna.DataSource:=DMCNT.dsReporte;
  dblcCia.Text := '';
  DecodeDate(Date, xAno, xMes, xDia);
  speAno.Value:=xAno;
  speMM.Value:=xMes;
  If Length(speMM.Text)=1 Then
  Begin
    speMM.Text:='0'+speMM.Text;
  End;
  gbPerExit(Self);
  DMCNT.cdsCia.Filtered := False;
  if not DMCNT.cdsCia.Active then
  	DMCNT.cdsCia.Open ;
  if DMCNT.cdsCia.RecordCount = 1 then
  begin
  	dblcCia.Text := DMCNT.cdsCia.FieldByName('CIAID').AsString ;
    edtCia.Text  := DMCNT.cdsCia.FieldByName('CIADES').AsString ;
    dblcCia.Enabled := False ;
  end
  else
	 dblcCia.SetFocus;
    //Inicio RMZ
     fg_HabilitabotonPLE;
    //Final RMZ
end;

procedure TFMayAuxDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FConsulta.FSelCuenta1.Free;
   FVariables.w_Num_Formas :=FVariables.w_Num_Formas-1;
   Action:=caFree;
end;

procedure TFMayAuxDet.bbtnCancClick(Sender: TObject);
begin
   Close;
end;

procedure TFMayAuxDet.bbtnExcelClick(Sender: TObject);
var
	xSQL, xSustrae, SalIniHas : String;
  wFecha1,wFecha, wAno, wMes, wMesAnt, xGrp: String;
  CampoDMN,CampoHMN,CampoSMN,CampoDME,CampoHME,CampoSME: String;
  xTDMN, xTHMN, xTDME, xTHME: DOUBLE;
  Year, Month, Day: Word;
  xPos,xZ,xAncho : Integer;
  xMonedaL,xMonedaE,xDesde,xHasta : String;
  wMesx, wAnox : String;
begin
  SalIniHas   :=quotedStr(formatdatetime(wFormatFecha,dbdtpFReg2.DateTime));
  xMonedaL := DMCNT.DisplayDescrip('prvTGE','TGE103','TMONABR','TMON_LOC='+quotedstr('L'),'TMONABR');
  xMonedaE := DMCNT.DisplayDescrip('prvTGE','TGE103','TMONABR','TMON_LOC='+quotedstr('E'),'TMONABR');
  SFMN:=0; SFME:=0; xx:=0;
  xWhere :='';
  xWhere1:='';
  if (rgCuenta.ItemIndex=2) and (FConsulta.FSelCuenta1.cdsClone.recordcount>0) then
  begin
 // if length(xWhere)>0 then
    begin
    	xWhere  :=' AND ';		// Para Saldos
      xWhere1 :=' AND ';		// Para Movimientos
    end;
    xWhere  := xWhere+'C.CUENTAID IN (' ;
    xWhere1 := xWhere1+'A.CUENTAID IN (' ;
    FConsulta.FSelCuenta1.cdsClone.First ;
    while not FConsulta.FSelCuenta1.cdsClone.Eof do
    begin
      xWhere := xWhere  + '''' + FConsulta.FSelCuenta1.cdsClone.FieldByName('CUENTAID').AsString + '''';
      xWhere1:= xWhere1 + '''' + FConsulta.FSelCuenta1.cdsClone.FieldByName('CUENTAID').AsString + '''';
      FConsulta.FSelCuenta1.cdsClone.Next ;
      if not FConsulta.FSelCuenta1.cdsClone.eof then
      begin
        xWhere := xWhere + ' , ' ;
        xWhere1 := xWhere1 + ' , ' ;
      end;
    end;
    xwhere := xwhere + ')';
    xwhere1 := xwhere1 + ')';
  end ;

  if rgCuenta.ItemIndex = 1 then
  begin
  	If Length(dblcdDesde.Text)=0 Then
    Begin
    	showmessage('Debe seleccionar la Cuenta de Inicio');
      dblcdDesde.SetFocus;
      exit;
    End;
    If Length(dblcdHasta.Text)=0 Then
    Begin
    	showmessage('Debe seleccionar la Cuenta de Fin');
      dblcdHasta.SetFocus;
      exit;
    End;
    If Length(dblcdDesde.Text)>Length(dblcdHasta.Text) Then
    Begin
      xAncho:=Length(dblcdHasta.Text);
    End
    Else
    Begin
      xAncho:=Length(dblcdDesde.Text);
    End;

    If StrToInt(Copy(dblcdDesde.Text,1,xAncho))>StrToInt(Copy(dblcdHasta.Text,1,xAncho)) Then
    Begin
      showmessage('La Cuenta Inicio debe ser Menor a la Cuenta Fin');
      dblcdDesde.SetFocus;
      exit;
    End;
    If StrToInt(Copy(dblcdHasta.Text,1,xAncho))<StrToInt(Copy(dblcdDesde.Text,1,xAncho)) Then
    Begin
      showmessage('La Cuenta de Fin debe ser Mayor que la Cuenta de Inicio');
      dblcdHasta.SetFocus;
      exit;
    End;

    xDesde:=Trim(dblcdDesde.Text);
    xHasta:=Trim(dblcdHasta.Text);

    xWhere :=xWhere +' AND C.CUENTAID BETWEEN '+QuotedStr(xDesde)+' AND '+QuotedStr(xHasta)+' ';
    xWhere1:=xWhere1+' AND A.CUENTAID BETWEEN '+QuotedStr(xDesde)+' AND '+QuotedStr(xHasta)+' ';
  end;

	Screen.Cursor:=crHourGlass;

  DecodeDate(dbdtpFReg1.Date, Year, Month, Day);
  wMes := inttostr(Month);

  wMes:=DMCNT.StrZero(wMes,2);
  wMesAnt:=IntToStr(StrToInt(wMes)-1);
  wMesAnt:=DMCNT.StrZero(wMesAnt,2);

  wAno:= IntToStr(Year);
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      wFecha:='DATE('+''''+wAno+'-'+wMes+'-01'+''''+')'   // Fecha inicio pa movs faltantes
  else
   if SRV_D = 'ORACLE' then
     wFecha:='TO_DATE('+quotedstr('01'+'-'+wMes+'-'+wAno)+')';   // Fecha inicio pa movs faltantes

  wFecha1:='01/'+wMes+'/'+wano;
  CampoSMN := 'SALDMN'+wMesAnt; //wMes;
  CampoSME := 'SALDME'+wMesAnt; //wMes;
  CampoDMN := 'DEBEMN'+wMes;
  CampoHMN := 'HABEMN'+wMes;
  CampoDME := 'DEBEME'+wMes;
  CampoHME := 'HABEME'+wMes;

  wMesx:=DMCNT.StrZero( IntToStr(speMM.Value) ,2);
  wAnox:=IntToStr( speAno.Value );

// Selecciona datos de 301 k sobran en el periodo
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     xSQL:='SELECT C.CIAID, ''99'' TDIARID, ''999999999X'' CNTCOMPROB, ANO CNTANO, '''+wAnox+wMesx+''' CNTANOMM, '' '' CNTLOTE, CUENTAID, '' '' DOCID, '
      +''' '' CNTSERIE, '' '' CNTNODOC, ''Saldo Anterior'' CNTGLOSA, '' '' CNTDH, '' '' CCOSID, 0 CNTTCAMBIO, 0 CNTMTOORI, 0 CNTMTOLOC, 0 CNTMTOEXT, '
      +'current date CNTFEMIS, current date CNTFVCMTO, current date CNTFCOMP, '
      +''' '' CNTESTADO, '' '' CNTCUADRE, '' '' CNTFAUTOM, '' '' CNTMM, '' '' CNTDD, '' '' CNTTRI, '' '' CNTSEM, '' '' CNTSS, '' '' CNTAATRI, '
      +''' '' CNTAASEM, '' '' CNTAASS, '' '' TMONID, '' '' FLAGVAR, '' '' FCONS, '' '' CNTFMEC, '' '' TDIARDES, '' '' CTADES, '' '' DOCDES, '' '' CCOSDES, '
      +'CASE WHEN COALESCE('+CampoSMN+',0)>0 THEN COALESCE('+CampoSMN+',0) ELSE 0 END CNTDEBEMN, '
      +'CASE WHEN COALESCE('+CampoSME+',0)>0 THEN COALESCE('+CampoSME+',0) ELSE 0 END CNTDEBEME, '
      +'CASE WHEN COALESCE('+CampoSMN+',0)>0 THEN 0 ELSE COALESCE('+CampoSMN+',0)*-1 END CNTHABEMN, '
      +'CASE WHEN COALESCE('+CampoSME+',0)>0 THEN 0 ELSE COALESCE('+CampoSME+',0)*-1 END CNTHABEME, '
      +'0 CNTSALDMN, 0 CNTSALDME, '
      +''' '' CAMPOVAR, '' '' CNTTS, '' '' CNTPAGADO, '' '' CNTMODDOC, 0 CNTREG, '' '' CNTUSER, DATE('+SalIniHas+') CNTFREG, '
      +'CURRENT TIME CNTHREG, '
      +''' '' AUXID, B.CIADES, 0 CONTA '
      +'FROM CNT401 C, TGE101 B '
      +'WHERE C.CIAID='+QuotedStr(dblcCia.Text)+' '+xWhere+' '
      +'AND COALESCE(C.AUXID,''N'')=''N'' '
      +'AND C.CIAID=B.CIAID '
      +'AND COALESCE(C.CCOSID,''N'')=''N'' '
      +'AND C.ANO='+QuotedStr(speAno.Text)+' '
      +'UNION ALL '
      +'SELECT A.CIAID, A.TDIARID, A.CNTCOMPROB, A.CNTANO, A.CNTANOMM, A.CNTLOTE, A.CUENTAID, A.DOCID, A.CNTSERIE, '
      +'A.CNTNODOC, A.CNTGLOSA, A.CNTDH, A.CCOSID, A.CNTTCAMBIO, A.CNTMTOORI, A.CNTMTOLOC, A.CNTMTOEXT, '
      +'A.CNTFEMIS, A.CNTFVCMTO, A.CNTFCOMP, A.CNTESTADO, A.CNTCUADRE, A.CNTFAUTOM, A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS, '
      +'A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, A.FLAGVAR, A.FCONS, A.CNTFMEC, A.TDIARDES, A.CTADES, A.DOCDES, A.CCOSDES, '
      +'A.CNTDEBEMN, CASE WHEN TMONID='''+DMCNT.wTMonExt+''' then A.CNTDEBEME else 0 end CNTDEBEME, '
      +'A.CNTHABEMN, CASE WHEN TMONID='''+DMCNT.wTMonExt+''' THEN A.CNTHABEME else 0 end CNTHABEME, '
      +'A.CNTSALDMN, A.CNTSALDME, A.CAMPOVAR, A.CNTTS, A.CNTPAGADO, A.CNTMODDOC, A.CNTREG, A.CNTUSER, A.CNTFREG, A.CNTHREG, A.AUXID, D.CIADES, 0 CONTA '
      +'FROM CNT301 A, TGE202 B, TGE101 D, TGE202 E '
      +'WHERE A.CIAID='+QuotedStr(dblcCia.Text)+' '
      +'AND A.CIAID=D.CIAID '
      +'AND A.CNTFCOMP>=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+') '
      +'AND A.CNTFCOMP<=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')';
      case rgTipo.itemindex of
       0 : xSql := xSql + ' AND A.CNTESTADO  = ''P''  AND A.CNTCUADRE='+''''+'S'+''' '+xWhere1;
       1 : xSql := xSql + ' AND (A.CNTESTADO = ''P'' AND COALESCE(A.CNTCUADRE,''N'') <> ''S'' OR A.CNTESTADO = ''I''  AND COALESCE(A.CNTCUADRE,''N'') <> ''S'')'+xWhere1;
       2 : xSql := xSql + ' AND (A.CNTESTADO = ''I'' OR A.CNTESTADO = ''P'') AND' + xWhere1;
      end;
      xSql:=xSql +' AND B.CIAID='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = B.CUENTAID '
                 +' AND E.CIAID(+)='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = E.CUENTAID(+)'
                 +' AND SUBSTR( CNTANOMM,5,2)>''00'' '
    end
  else
  if SRV_D = 'ORACLE' then
  begin
     xSQL:='SELECT C.CIAID, ''99'' TDIARID, ''999999999X'' CNTCOMPROB, ANO CNTANO, '''+wAnox+wMesx+''' CNTANOMM, '' '' CNTLOTE, D.CUENTAID, '' '' DOCID, '
      +''' '' CNTSERIE, '' '' CNTNODOC, ''Saldo Anterior'' CNTGLOSA, '' '' CNTDH, '' '' CCOSID, 0 CNTTCAMBIO, 0 CNTMTOORI, 0 CNTMTOLOC, 0 CNTMTOEXT, '
      +'TO_DATE('''') CNTFEMIS, TO_DATE('''') CNTFVCMTO, TO_DATE('''') CNTFCOMP, '
      +''' '' CNTESTADO, '' '' CNTCUADRE, '' '' CNTFAUTOM, '' '' CNTMM, '' '' CNTDD, '' '' CNTTRI, '' '' CNTSEM, '' '' CNTSS, '' '' CNTAATRI, '
      +''' '' CNTAASEM, '' '' CNTAASS, '' '' TMONID, '' '' FLAGVAR, '' '' FCONS, '' '' CNTFMEC, '' '' TDIARDES, D.CTADES, '' '' DOCDES, '' '' CCOSDES, '
      +'CASE WHEN NVL('+CampoSMN+',0)>0 THEN NVL('+CampoSMN+',0) ELSE 0 END CNTDEBEMN, '
      +'CASE WHEN NVL('+CampoSME+',0)>0 THEN NVL('+CampoSME+',0) ELSE 0 END CNTDEBEME, '
      +'CASE WHEN NVL('+CampoSMN+',0)>0 THEN 0 ELSE NVL('+CampoSMN+',0)*-1 END CNTHABEMN, '
      +'CASE WHEN NVL('+CampoSME+',0)>0 THEN 0 ELSE NVL('+CampoSME+',0)*-1 END CNTHABEME, '
      +'0 CNTSALDMN, 0 CNTSALDME, '
      +''' '' CAMPOVAR, '' '' CNTTS, '' '' CNTPAGADO, '' '' CNTMODDOC, 0 CNTREG, '' '' CNTUSER, TO_DATE('+SalIniHas+') CNTFREG, '
      +'TO_DATE('''') CNTHREG, '
      +''' '' AUXID, B.CIADES, 0 CONTA '
      +'FROM CNT401 C, TGE101 B, TGE202 D '
      +'WHERE C.CIAID='+QuotedStr(dblcCia.Text)+' '+xWhere+' '
      +'AND NVL(C.AUXID,''N'')=''N'' '
      +'AND C.CIAID=B.CIAID '
      +'AND NVL(C.CCOSID,''N'')=''N'' '
      +'AND C.ANO='+QuotedStr(speAno.Text)+' '
      +'AND D.CIAID(+)='+quotedstr(dblcCia.Text)+' AND C.CUENTAID=D.CUENTAID(+) '

      +'UNION ALL '

      +'SELECT A.CIAID, A.TDIARID, A.CNTCOMPROB, A.CNTANO, A.CNTANOMM, A.CNTLOTE, A.CUENTAID, A.DOCID, A.CNTSERIE, '
      +'A.CNTNODOC, A.CNTGLOSA, A.CNTDH, A.CCOSID, A.CNTTCAMBIO, A.CNTMTOORI, A.CNTMTOLOC, A.CNTMTOEXT, '
      +'A.CNTFEMIS, A.CNTFVCMTO, A.CNTFCOMP, A.CNTESTADO, A.CNTCUADRE, A.CNTFAUTOM, A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS, '
      +'A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, A.FLAGVAR, A.FCONS, A.CNTFMEC, A.TDIARDES, E.CTADES, A.DOCDES, A.CCOSDES, '
      +'A.CNTDEBEMN, CASE WHEN TMONID='''+DMCNT.wTMonExt+''' then A.CNTDEBEME else 0 end CNTDEBEME, '
      +'A.CNTHABEMN, CASE WHEN TMONID='''+DMCNT.wTMonExt+''' THEN A.CNTHABEME else 0 end CNTHABEME, '
      +'A.CNTSALDMN, A.CNTSALDME, A.CAMPOVAR, A.CNTTS, A.CNTPAGADO, A.CNTMODDOC, A.CNTREG, A.CNTUSER, A.CNTFREG, A.CNTHREG, A.AUXID, D.CIADES, 0 CONTA '
      +'FROM CNT301 A, TGE202 B, TGE101 D, TGE202 E '
      +'WHERE A.CIAID='+QuotedStr(dblcCia.Text)+' '
      +'AND A.CIAID=D.CIAID '
      +'AND A.CNTFCOMP>=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+') '
      +'AND A.CNTFCOMP<=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')';
      case rgTipo.itemindex of
       0 : xSql := xSql + ' AND A.CNTESTADO = ''P'' AND A.CNTCUADRE='+''''+'S'+''' '+xWhere1;
       1 : xSql := xSql + ' AND (A.CNTESTADO = ''P''  AND NVL(A.CNTCUADRE,''N'') <> ''S'' OR A.CNTESTADO = ''I''  AND NVL(A.CNTCUADRE,''N'') <> ''S'')'+xWhere1;
       2 : xSql := xSql + ' AND (A.CNTESTADO = ''I'' OR A.CNTESTADO = ''P'') AND' + xWhere1;
      end;
      xSql:=xSql +' AND B.CIAID(+)='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = B.CUENTAID(+) AND B.CTA_ME(+)=''S'' '
                 +' AND E.CIAID(+)='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = E.CUENTAID(+) '
                 +'AND SUBSTR( CNTANOMM,5,2)>''00'''
    end;

  DMCNT.cdsReporte.Close;
  DMCNT.cdsReporte.DataRequest(xSQL);
  DMCNT.cdsReporte.Open;

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
  xSQL:='SELECT A.CIAID, A.CUENTAID, '
       +'SUM(A.CNTDEBEMN) CNTDEBEMN, '
       +'COALESCE( SUM( CASE WHEN TMONID='''+DMCNT.wTmonExt+''' then A.CNTDEBEME else 0 end ), 0 ) CNTDEBEME, '
       +'SUM(A.CNTHABEMN) CNTHABEMN, '
       +'COALESCE( SUM( CASE WHEN TMONID='''+DMCNT.wTmonExt+''' then A.CNTHABEME else 0 end ), 0 ) CNTHABEME '
       +'FROM CNT301 A, TGE202 B '
       +'WHERE A.CIAID='+QuotedStr(dblcCia.Text)+' '
       +'AND A.CNTFCOMP>=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+') '
       +'AND A.CNTFCOMP<=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')';
       case rgTipo.itemindex of
        0 : xSql := xSql + ' AND A.CNTESTADO = ''P''  AND A.CNTCUADRE='+''''+'S'+''' '+xWhere1;
        1 : xSql := xSql + ' AND (A.CNTESTADO = ''P'' AND coalesce(A.CNTCUADRE,''N'') <> ''S'' OR A.CNTESTADO = ''I''  AND coalesce(A.CNTCUADRE,''N'') <> ''S'')'+xWhere1;
        2 : xSql := xSql + ' AND (A.CNTESTADO = ''I'' OR A.CNTESTADO = ''P'') AND' + xWhere1;
       end;
       xSql:=xSql +' AND B.CIAID='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = B.CUENTAID '
                  +'AND SUBSTR( CNTANOMM,5,2)>''00'''
       +'GROUP BY A.CIAID, A.CUENTAID';
  end
  else
  if SRV_D = 'ORACLE' then
  begin
  xSQL:='SELECT A.CIAID, A.CUENTAID, '
       +'SUM(A.CNTDEBEMN) CNTDEBEMN, '
       +'NVL(SUM(CASE WHEN A.TMONID = ''D'' THEN A.CNTDEBEME ELSE 0 END),0) CNTDEBEME,'
       +'SUM(A.CNTHABEMN) CNTHABEMN, '
       +'NVL(SUM(CASE WHEN A.TMONID = ''D'' THEN A.CNTHABEME ELSE 0 END),0) CNTHABEME'
       +' FROM CNT301 A, TGE202 B '
       +' WHERE A.CIAID='+QuotedStr(dblcCia.Text)+' '
       +' AND A.CNTFCOMP>=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+') '
       +' AND A.CNTFCOMP<=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')';
       case rgTipo.itemindex of
        0 : xSql := xSql + ' AND A.CNTESTADO = ''P'' AND A.CNTCUADRE='+''''+'S'+''' '+xWhere1;
        1 : xSql := xSql + ' AND (A.CNTESTADO = ''P''  AND NVL(A.CNTCUADRE,''N'') <> ''S'' OR A.CNTESTADO = ''I''  AND NVL(A.CNTCUADRE,''N'') <> ''S'')'+xWhere1;
        2 : xSql := xSql + ' AND (A.CNTESTADO = ''I'' OR A.CNTESTADO = ''P'') AND' + xWhere1;
       end;
       xSql:=xSql +' AND B.CIAID(+)='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = B.CUENTAID(+) AND B.CTA_ME(+)=''S'' '
                  +'AND SUBSTR( CNTANOMM,5,2)>''00'''
       +' GROUP BY A.CIAID, A.CUENTAID';
  end;
  DMCNT.cdsCierres.Close;
  DMCNT.cdsCierres.DataRequest(xSQl);				// Total de Mov.
  DMCNT.cdsCierres.Open;


  // vhn
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
  xSQL:='SELECT C.CIAID, C.CUENTAID, D.CTA_DET, D.CTA_MOV, '
       +'CASE WHEN COALESCE('+CampoSMN+',0)>0 THEN COALESCE('+CampoSMN+',0) ELSE 0 END CNTDEBEMN, '
       +'CASE WHEN COALESCE('+CampoSME+',0)>0 THEN COALESCE('+CampoSME+',0) ELSE 0 END CNTDEBEME, '
       +'CASE WHEN COALESCE('+CampoSMN+',0)>0 THEN 0 ELSE COALESCE('+CampoSMN+',0) END CNTHABEMN, '
       +'CASE WHEN COALESCE('+CampoSME+',0)>0 THEN 0 ELSE COALESCE('+CampoSME+',0) END CNTHABEME, '
       +'COALESCE('+CampoDMN+',0) DEBEMN, COALESCE('+CampoHMN+',0) HABEMN, '
       +'COALESCE('+CampoDME+',0) DEBEME, COALESCE('+CampoHME+',0) HABEME '
       +'FROM CNT401 C, TGE202 D '
       +'WHERE C.CIAID='+QuotedStr(dblcCia.Text)+' '+xWhere+' '
       +'AND COALESCE(C.AUXID,''N'')=''N'' '
       +'AND COALESCE(C.CCOSID,''N'')=''N'' '
       +'AND C.ANO='+QuotedStr(speAno.Text)+' '
			 +'AND C.CIAID=D.CIAID '
       +'AND C.CUENTAID=D.CUENTAID';
  end
  else
  if SRV_D = 'ORACLE' then
  begin
  xSQL:='SELECT C.CIAID, C.CUENTAID, D.CTA_DET, D.CTA_MOV, '
       +'CASE WHEN NVL('+CampoSMN+',0)>0 THEN NVL('+CampoSMN+',0) ELSE 0 END CNTDEBEMN, '
       +'CASE WHEN NVL('+CampoSME+',0)>0 THEN NVL('+CampoSME+',0) ELSE 0 END CNTDEBEME, '
       +'CASE WHEN NVL('+CampoSMN+',0)>0 THEN 0 ELSE NVL('+CampoSMN+',0) END CNTHABEMN, '
       +'CASE WHEN NVL('+CampoSME+',0)>0 THEN 0 ELSE NVL('+CampoSME+',0) END CNTHABEME, '
//       +'DECODE(LEAST(NVL('+CampoSMN+',0),0),0, NVL('+CampoSMN+',0), 0) CNTDEBEMN, '
//       +'DECODE(LEAST(NVL('+CampoSME+',0),0),0, NVL('+CampoSME+',0), 0) CNTDEBEME, '
//       +'DECODE(GREATEST(NVL('+CampoSMN+',0),0),0, NVL('+CampoSMN+',0), 0) CNTHABEMN, '
//       +'DECODE(GREATEST(NVL('+CampoSME+',0),0),0, NVL('+CampoSME+',0), 0) CNTHABEME, '
       +'NVL('+CampoDMN+',0) DEBEMN, NVL('+CampoHMN+',0) HABEMN, '
       +'NVL('+CampoDME+',0) DEBEME, NVL('+CampoHME+',0) HABEME '
       +'FROM CNT401 C, TGE202 D '
       +'WHERE C.CIAID='+QuotedStr(dblcCia.Text)+' '+xWhere+' '
       +'AND NVL(C.AUXID,''N'')=''N'' '
       +'AND NVL(C.CCOSID,''N'')=''N'' '
       +'AND C.ANO='+QuotedStr(speAno.Text)+' '
			 +'AND C.CIAID=D.CIAID '
       +'AND C.CUENTAID=D.CUENTAID';
  end;

  DMCNT.cdsCNTtemp.Close;
  DMCNT.cdsCNTtemp.DataRequest(xSQl);			// Total de Saldos
  DMCNT.cdsCNTtemp.Open;
  DMCNT.cdsCNTtemp.IndexFieldNames:='CUENTAID';

  DMCNT.cdsCierres.IndexFieldNames:='CUENTAID';
  DMCNT.cdsCNTtemp.First;
  while Not DMCNT.cdsCNTtemp.Eof do
  begin
  	DMCNT.cdsCierres.SetKey;						// Total de Saldo
  	DMCNT.cdsCierres.FieldByName('CUENTAID').AsString:=DMCNT.cdsCNTtemp.FieldByName('CUENTAID').AsString;
    if not DMCNT.cdsCierres.GotoKey then
    begin
      DMCNT.cdsCierres.Insert;
      DMCNT.cdsCierres.FieldByName('CIAID').AsString     := dblcCia.Text;
      DMCNT.cdsCierres.FieldByName('CUENTAID').AsString  := DMCNT.cdsCNTtemp.FieldByName('CUENTAID').AsString;

      if (DMCNT.cdsCNTtemp.FieldByName('CTA_DET').AsString = 'N') and
         (DMCNT.cdsCNTtemp.FieldByName('CTA_MOV').AsString = 'N') then
      begin
      	DMCNT.cdsCierres.FieldByName('CNTDEBEMN').AsString := DMCNT.cdsCNTtemp.FieldByName('DEBEMN').AsString;
      	DMCNT.cdsCierres.FieldByName('CNTDEBEME').AsString := DMCNT.cdsCNTtemp.FieldByName('DEBEME').AsString;
      	DMCNT.cdsCierres.FieldByName('CNTHABEMN').AsString := DMCNT.cdsCNTtemp.FieldByName('HABEMN').AsString;
      	DMCNT.cdsCierres.FieldByName('CNTHABEME').AsString := DMCNT.cdsCNTtemp.FieldByName('HABEME').AsString;
      end
      else
      begin
      	DMCNT.cdsCierres.FieldByName('CNTDEBEMN').AsString := '0';
      	DMCNT.cdsCierres.FieldByName('CNTDEBEME').AsString := '0';
      	DMCNT.cdsCierres.FieldByName('CNTHABEMN').AsString := '0';
      	DMCNT.cdsCierres.FieldByName('CNTHABEME').AsString := '0';
      end;
      DMCNT.cdsCierres.Post;
    end;
    DMCNT.cdsCNTtemp.Next;
  end;

  DMCNT.cdsCierres.IndexFieldNames:='';

  xSQL:='SELECT C.CUENTAID '
       +'FROM CNT401 C '
       +'WHERE C.CIAID='+QuotedStr(dblcCia.Text)+' '+xWhere+' '
       +'AND '+wReplacCeros+'(C.AUXID,''N'')=''N'' '
       +'AND '+wReplacCeros+'(C.CCOSID,''N'')=''N'' '
       +'AND C.ANO='+QuotedStr(speAno.Text);

  DMCNT.cdsQry.Close;
  DMCNT.cdsQry.DataRequest(xSQl);
  DMCNT.cdsQry.Open;

  CalculaSaldos;

  if DMCNT.cdsReporte.RecordCount=0 then
  begin
     ShowMessage('No hay datos que mostrar');
     Screen.Cursor:=CrDefault;
     exit;
  end;
  DMCNT.cdsReporte.IndexFieldNames:='CUENTAID;CNTANOMM;TDIARID;CNTCOMPROB;CNTFCOMP;CNTREG;CNTSERIE;CNTNODOC';

  dbgMayAuxDet.DataSource := DMCNT.dsReporte;
  dbgMayAuxDet.Selected.Clear;
  dbgMayAuxDet.Selected.Add ('CIAID'#9'15'#9'Cía'#9'F');
  dbgMayAuxDet.Selected.Add ('CIADES'#9'15'#9'Compañía'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTANOMM'#9'15'#9'Año-Mes'#9'F');
  dbgMayAuxDet.Selected.Add ('TDIARID'#9'15'#9'T.Diario'#9'F');
  dbgMayAuxDet.Selected.Add ('TDIARDES'#9'15'#9'Desc.T.Diario'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTCOMPROB'#9'15'#9'Comprobante'#9'F');
  // vhndema
  dbgMayAuxDet.Selected.Add ('AUXID'#9'8'#9'Auxiliar'#9'F');
  // end vhndema
  dbgMayAuxDet.Selected.Add ('CNTFEMIS'#9'15'#9'F.Emis.'#9'F');
  dbgMayAuxDet.Selected.Add ('DOCID'#9'15'#9'Doc'#9'F');
  dbgMayAuxDet.Selected.Add ('DOCDES'#9'15'#9'Desc.Docum'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTSERIE'#9'15'#9'Serie'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTNODOC'#9'15'#9'Nro.Doc.'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTFCOMP'#9'15'#9'F.Comp'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTGLOSA'#9'15'#9'Glosa'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTDEBEMN'#9'15'#9'Debe MN'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTHABEMN'#9'15'#9'Haber MN'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTDEBEME'#9'15'#9'Debe ME'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTHABEME'#9'15'#9'Haber ME'#9'F');
  dbgMayAuxDet.Selected.Add ('CCOSID'#9'15'#9'C.Costo'#9'F');
  dbgMayAuxDet.Selected.Add ('CCOSDES'#9'15'#9'Desc.C.Costo'#9'F');
{
  dbgMayAuxDet.Selected.Add ('CNTREG'#9'15'#9'Item'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTANO'#9'15'#9'Año'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTLOTE'#9'15'#9'Lote'#9'F');
  dbgMayAuxDet.Selected.Add ('CUENTAID'#9'15'#9'Cuenta'#9'F');
  dbgMayAuxDet.Selected.Add ('CTADES'#9'15'#9'Desc.Cuenta'#9'F');
  dbgMayAuxDet.Selected.Add ('AUXID'#9'15'#9'Auxiliar'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTDH'#9'15'#9'D/H'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTTCAMBIO'#9'15'#9'T.Cambio'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTMTOORI'#9'15'#9'Mto.Orig'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTMTOLOC'#9'15'#9'Mto.MN'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTMTOEXT'#9'15'#9'Mto.ME'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTFVCMTO'#9'15'#9'F.Vcmto'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTESTADO'#9'15'#9'Estado'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTCUADRE'#9'15'#9'Contab'#9'F');
  dbgMayAuxDet.Selected.Add ('TMONID'#9'15'#9'Moneda'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTSALDMN'#9'15'#9'Saldo MN'#9'F');
  dbgMayAuxDet.Selected.Add ('CNTSALDME'#9'15'#9'Saldo ME'#9'F');
  dbgMayAuxDet.RefreshDisplay;
}
   sdGrabExcel.DefaultExt := 'xls';
   if not sdGrabExcel.Execute then Exit;
   dbgMayAuxDet.ExportOptions.Options := [esoDblQuoteFields,esoShowFooter];
   dbgMayAuxDet.ExportOptions.Options := dbgMayAuxDet.ExportOptions.Options + [esoShowTitle];
   dbgMayAuxDet.ExportOptions.Options := dbgMayAuxDet.ExportOptions.Options + [esoShowHeader];
   dbgMayAuxDet.ExportOptions.Options := dbgMayAuxDet.ExportOptions.Options + [esoShowRecordNo];
   dbgMayAuxDet.ExportOptions.ExportType := wwgetSYLK;
   dbgMayAuxDet.ExportOptions.FileName := sdGrabExcel.FileName;
   Screen.Cursor := crHourglass;
   dbgMayAuxDet.ExportOptions.Save;
   Screen.Cursor := crDefault;
   ShowMessage('Archivo Grabado');

  DMCNT.cdsReporte.IndexFieldNames:='';
  Screen.Cursor:=CrDefault;
end;

procedure TFMayAuxDet.pprMayorAnaPreviewFormCreate(Sender: TObject);
begin
	//pprMayorAna.PreviewForm.WindowState:=WsMaximized;
  //TppViewer(pprMayorAna.PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
end;

procedure TFMayAuxDet.pprmPreviewFormCreate(Sender: TObject);
begin
	pprm.PreviewForm.WindowState:=WsMaximized;
  TppViewer(pprm.PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
end;

procedure TFMayAuxDet.btnExportTextoClick(Sender: TObject);
var
	xSQL, xSustrae, SalIniHas : String;
  wFecha1,wFecha, wAno, wMes, wMesAnt, xGrp: String;
  CampoDMN,CampoHMN,CampoSMN,CampoDME,CampoHME,CampoSME: String;
  xTDMN, xTHMN, xTDME, xTHME: DOUBLE;
  Year, Month, Day: Word;
  xPos,xZ,xAncho : Integer;
  xMonedaL,xMonedaE,xDesde,xHasta : String;
  wMesx, wAnox : String;
  xBlanco, xCampo, xLinea : String;
  i, xSpace, xTem : Integer;
  bmk2 : TBookMark;
  sCtaLog : String;
begin
  SalIniHas   :=quotedStr(formatdatetime(wFormatFecha,dbdtpFReg2.DateTime));
  xMonedaL := DMCNT.DisplayDescrip('prvTGE','TGE103','TMONABR','TMON_LOC='+quotedstr('L'),'TMONABR');
  xMonedaE := DMCNT.DisplayDescrip('prvTGE','TGE103','TMONABR','TMON_LOC='+quotedstr('E'),'TMONABR');
  SFMN:=0; SFME:=0; xx:=0;
  xWhere :='';
  xWhere1:='';
  sCtaLog:='';
  if (rgCuenta.ItemIndex=2) and (FConsulta.FSelCuenta1.cdsClone.recordcount>0) then
  begin
 // if length(xWhere)>0 then
    begin
    	xWhere  :=' AND ';		// Para Saldos
      xWhere1 :=' AND ';		// Para Movimientos
    end;
    xWhere  := xWhere+'C.CUENTAID IN (' ;
    xWhere1 := xWhere1+'A.CUENTAID IN (' ;
    sCtaLog := 'CUENTAID IN ( ';
    FConsulta.FSelCuenta1.cdsClone.First ;
    while not FConsulta.FSelCuenta1.cdsClone.Eof do
    begin
      xWhere := xWhere  + '''' + FConsulta.FSelCuenta1.cdsClone.FieldByName('CUENTAID').AsString + '''';
      xWhere1:= xWhere1 + '''' + FConsulta.FSelCuenta1.cdsClone.FieldByName('CUENTAID').AsString + '''';
      sCtaLog:= sCtaLog +FConsulta.FSelCuenta1.cdsClone.FieldByName('CUENTAID').AsString;
      FConsulta.FSelCuenta1.cdsClone.Next ;
      if not FConsulta.FSelCuenta1.cdsClone.eof then
      begin
        xWhere := xWhere  + ' , ' ;
        xWhere1:= xWhere1 + ' , ' ;
        sCtaLog:= sCtaLog + ', ';
      end;
    end;
    xwhere := xwhere  + ')';
    xwhere1:= xwhere1 + ')';
    sCtaLog:= sCtaLog + ' )';
  end ;

  if rgCuenta.ItemIndex = 1 then
  begin
  	If Length(dblcdDesde.Text)=0 Then
    Begin
    	showmessage('Debe seleccionar la Cuenta de Inicio');
      dblcdDesde.SetFocus;
      exit;
    End;
    If Length(dblcdHasta.Text)=0 Then
    Begin
    	showmessage('Debe seleccionar la Cuenta de Fin');
      dblcdHasta.SetFocus;
      exit;
    End;
    If Length(dblcdDesde.Text)>Length(dblcdHasta.Text) Then
    Begin
      xAncho:=Length(dblcdHasta.Text);
    End
    Else
    Begin
      xAncho:=Length(dblcdDesde.Text);
    End;

    If StrToInt(Copy(dblcdDesde.Text,1,xAncho))>StrToInt(Copy(dblcdHasta.Text,1,xAncho)) Then
    Begin
      showmessage('La Cuenta Inicio debe ser Menor a la Cuenta Fin');
      dblcdDesde.SetFocus;
      exit;
    End;
    If StrToInt(Copy(dblcdHasta.Text,1,xAncho))<StrToInt(Copy(dblcdDesde.Text,1,xAncho)) Then
    Begin
      showmessage('La Cuenta de Fin debe ser Mayor que la Cuenta de Inicio');
      dblcdHasta.SetFocus;
      exit;
    End;

    xDesde:=Trim(dblcdDesde.Text);
    xHasta:=Trim(dblcdHasta.Text);

    xWhere :=xWhere +' AND C.CUENTAID BETWEEN '+QuotedStr(xDesde)+' AND '+QuotedStr(xHasta)+' ';
    xWhere1:=xWhere1+' AND A.CUENTAID BETWEEN '+QuotedStr(xDesde)+' AND '+QuotedStr(xHasta)+' ';
    sCtaLog:='CUENTAID BETWEEN '+xDesde+' AND '+xHasta;

    if DMCNT.cFilterCuentaUser<>'' then
    begin
//      xWhere :=xWhere +' and '+StringReplace(DMCNT.cFilterCuentaUser,'CUENTAID','C.CUENTAID',[rfreplaceall]);
//      xWhere1:=xWhere1+' and '+StringReplace(DMCNT.cFilterCuentaUser,'CUENTAID','A.CUENTAID',[rfreplaceall]);
    end;
  end;

  // VHNDEMA
  if rgCuenta.ItemIndex = 0 then
  begin
     if DMCNT.cFilterCuentaUser<>'' then
     begin
//        xWhere :=' and '+StringReplace( DMCNT.cFilterCuentaUser,'CUENTAID','C.CUENTAID',[rfreplaceall] );
//        xWhere1:=' and '+StringReplace( DMCNT.cFilterCuentaUser,'CUENTAID','A.CUENTAID',[rfreplaceall] );
     end;
  end;
  // END VHNDEMA

	Screen.Cursor:=crHourGlass;

  DecodeDate(dbdtpFReg1.Date, Year, Month, Day);
  wMes := inttostr(Month);

  wMes:=DMCNT.StrZero(wMes,2);
  wMesAnt:=IntToStr(StrToInt(wMes)-1);
  wMesAnt:=DMCNT.StrZero(wMesAnt,2);

  wAno:= IntToStr(Year);
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      wFecha:='DATE('+''''+wAno+'-'+wMes+'-01'+''''+')'   // Fecha inicio pa movs faltantes
  else
   if SRV_D = 'ORACLE' then
     wFecha:='TO_DATE('+quotedstr('01'+'-'+wMes+'-'+wAno)+')';   // Fecha inicio pa movs faltantes

  wFecha1:='01/'+wMes+'/'+wano;
  CampoSMN := 'SALDMN'+wMesAnt; //wMes;
  CampoSME := 'SALDME'+wMesAnt; //wMes;
  CampoDMN := 'DEBEMN'+wMes;
  CampoHMN := 'HABEMN'+wMes;
  CampoDME := 'DEBEME'+wMes;
  CampoHME := 'HABEME'+wMes;

  wMesx:=DMCNT.StrZero( IntToStr(speMM.Value) ,2);
  wAnox:=IntToStr( speAno.Value );

// Selecciona datos de 301 k sobran en el periodo
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
     xSQL:='SELECT C.CIAID, ''99'' TDIARID, ''999999999X'' CNTCOMPROB, ANO CNTANO, '''+wAnox+wMesx+''' CNTANOMM, '' '' CNTLOTE, CUENTAID, '' '' DOCID, '
      +''' '' CNTSERIE, '' '' CNTNODOC, ''Saldo Anterior'' CNTGLOSA, '' '' CNTDH, '' '' CCOSID, 0 CNTTCAMBIO, 0 CNTMTOORI, 0 CNTMTOLOC, 0 CNTMTOEXT, '
      +'current date CNTFEMIS, current date CNTFVCMTO, current date CNTFCOMP, '
      +''' '' CNTESTADO, '' '' CNTCUADRE, '' '' CNTFAUTOM, '' '' CNTMM, '' '' CNTDD, '' '' CNTTRI, '' '' CNTSEM, '' '' CNTSS, '' '' CNTAATRI, '
      +''' '' CNTAASEM, '' '' CNTAASS, '' '' TMONID, '' '' FLAGVAR, '' '' FCONS, '' '' CNTFMEC, '' '' TDIARDES, '' '' CTADES, '' '' DOCDES, '' '' CCOSDES, '
      +'CASE WHEN COALESCE('+CampoSMN+',0)>0 THEN COALESCE('+CampoSMN+',0) ELSE 0 END CNTDEBEMN, '
      +'CASE WHEN COALESCE('+CampoSME+',0)>0 THEN COALESCE('+CampoSME+',0) ELSE 0 END CNTDEBEME, '
      +'CASE WHEN COALESCE('+CampoSMN+',0)>0 THEN 0 ELSE COALESCE('+CampoSMN+',0)*-1 END CNTHABEMN, '
      +'CASE WHEN COALESCE('+CampoSME+',0)>0 THEN 0 ELSE COALESCE('+CampoSME+',0)*-1 END CNTHABEME, '
      +'0 CNTSALDMN, 0 CNTSALDME, '
      +''' '' CAMPOVAR, '' '' CNTTS, '' '' CNTPAGADO, '' '' CNTMODDOC, 0 CNTREG, '' '' CNTUSER, DATE('+SalIniHas+') CNTFREG, '
      +'CURRENT TIME CNTHREG, '
      +''' '' AUXID, B.CIADES, 0 CONTA '
      +'FROM CNT401 C, TGE101 B '
      +'WHERE C.CIAID='+QuotedStr(dblcCia.Text)+' '+xWhere+' '
      +'AND COALESCE(C.AUXID,''N'')=''N'' '
      +'AND C.CIAID=B.CIAID '
      +'AND COALESCE(C.CCOSID,''N'')=''N'' '
      +'AND C.ANO='+QuotedStr(speAno.Text)+' '
      +'UNION ALL '
      +'SELECT A.CIAID, A.TDIARID, A.CNTCOMPROB, A.CNTANO, A.CNTANOMM, A.CNTLOTE, A.CUENTAID, A.DOCID, A.CNTSERIE, '
      +'A.CNTNODOC, A.CNTGLOSA, A.CNTDH, A.CCOSID, A.CNTTCAMBIO, A.CNTMTOORI, A.CNTMTOLOC, A.CNTMTOEXT, '
      +'A.CNTFEMIS, A.CNTFVCMTO, A.CNTFCOMP, A.CNTESTADO, A.CNTCUADRE, A.CNTFAUTOM, A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS, '
      +'A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, A.FLAGVAR, A.FCONS, A.CNTFMEC, A.TDIARDES, A.CTADES, A.DOCDES, A.CCOSDES, '
      +'A.CNTDEBEMN, CASE WHEN TMONID='''+DMCNT.wTMonExt+''' then A.CNTDEBEME else 0 end CNTDEBEME, '
      +'A.CNTHABEMN, CASE WHEN TMONID='''+DMCNT.wTMonExt+''' THEN A.CNTHABEME else 0 end CNTHABEME, '
      +'A.CNTSALDMN, A.CNTSALDME, A.CAMPOVAR, A.CNTTS, A.CNTPAGADO, A.CNTMODDOC, A.CNTREG, A.CNTUSER, A.CNTFREG, A.CNTHREG, A.AUXID, D.CIADES, 0 CONTA '
      +'FROM CNT301 A, TGE202 B, TGE101 D, TGE202 E '
      +'WHERE A.CIAID='+QuotedStr(dblcCia.Text)+' '
      +'AND A.CIAID=D.CIAID '
      +'AND A.CNTFCOMP>=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+') '
      +'AND A.CNTFCOMP<=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')';
      case rgTipo.itemindex of
       0 : xSql := xSql + ' AND A.CNTESTADO  = ''P''  AND A.CNTCUADRE='+''''+'S'+''' '+xWhere1;
       1 : xSql := xSql + ' AND (A.CNTESTADO = ''P'' AND COALESCE(A.CNTCUADRE,''N'') <> ''S'' OR A.CNTESTADO = ''I''  AND COALESCE(A.CNTCUADRE,''N'') <> ''S'')'+xWhere1;
       2 : xSql := xSql + ' AND (A.CNTESTADO = ''I'' OR A.CNTESTADO = ''P'') AND' + xWhere1;
      end;
      xSql:=xSql +' AND B.CIAID='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = B.CUENTAID '
                 +' AND E.CIAID(+)='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = E.CUENTAID(+)'
                 +' AND SUBSTR( CNTANOMM,5,2)>''00'' '
    end
  else
  if SRV_D = 'ORACLE' then
  begin
     xSQL:='SELECT C.CIAID, ''99'' TDIARID, ''999999999X'' CNTCOMPROB, ANO CNTANO, '''+wAnox+wMesx+''' CNTANOMM, '' '' CNTLOTE, D.CUENTAID, '' '' DOCID, '
      +''' '' CNTSERIE, '' '' CNTNODOC, ''Saldo Anterior'' CNTGLOSA, '' '' CNTDH, '' '' CCOSID, 0 CNTTCAMBIO, 0 CNTMTOORI, 0 CNTMTOLOC, 0 CNTMTOEXT, '
      +'TO_DATE('''') CNTFEMIS, TO_DATE('''') CNTFVCMTO, TO_DATE('''') CNTFCOMP, '
      +''' '' CNTESTADO, '' '' CNTCUADRE, '' '' CNTFAUTOM, '' '' CNTMM, '' '' CNTDD, '' '' CNTTRI, '' '' CNTSEM, '' '' CNTSS, '' '' CNTAATRI, '
      +''' '' CNTAASEM, '' '' CNTAASS, '' '' TMONID, '' '' FLAGVAR, '' '' FCONS, '' '' CNTFMEC, '' '' TDIARDES, D.CTADES, '' '' DOCDES, '' '' CCOSDES, '
      +'CASE WHEN NVL('+CampoSMN+',0)>0 THEN NVL('+CampoSMN+',0) ELSE 0 END CNTDEBEMN, '
      +'CASE WHEN NVL('+CampoSME+',0)>0 THEN NVL('+CampoSME+',0) ELSE 0 END CNTDEBEME, '
      +'CASE WHEN NVL('+CampoSMN+',0)>0 THEN 0 ELSE NVL('+CampoSMN+',0)*-1 END CNTHABEMN, '
      +'CASE WHEN NVL('+CampoSME+',0)>0 THEN 0 ELSE NVL('+CampoSME+',0)*-1 END CNTHABEME, '
      +'0 CNTSALDMN, 0 CNTSALDME, '
      +''' '' CAMPOVAR, '' '' CNTTS, '' '' CNTPAGADO, '' '' CNTMODDOC, 0 CNTREG, '' '' CNTUSER, TO_DATE('+SalIniHas+') CNTFREG, '
      +'TO_DATE('''') CNTHREG, '
      +''' '' AUXID, B.CIADES, 0 CONTA '
      +'FROM CNT401 C, TGE101 B, TGE202 D '
      +'WHERE C.CIAID='+QuotedStr(dblcCia.Text)+' '+xWhere+' '
      +'AND NVL(C.AUXID,''N'')=''N'' '
      +'AND C.CIAID=B.CIAID '
      +'AND NVL(C.CCOSID,''N'')=''N'' '
      +'AND C.ANO='+QuotedStr(speAno.Text)+' '
      +'AND D.CIAID(+)='+quotedstr(dblcCia.Text)+' AND C.CUENTAID=D.CUENTAID(+) ';
    if sCiaCuenta<>'' then
       xSQL := xSQL + ' and C.'+sCiaCuenta;

     xSQL := xSQL
      +'UNION ALL '

      +'SELECT A.CIAID, A.TDIARID, A.CNTCOMPROB, A.CNTANO, A.CNTANOMM, A.CNTLOTE, A.CUENTAID, A.DOCID, A.CNTSERIE, '
      +'A.CNTNODOC, A.CNTGLOSA, A.CNTDH, A.CCOSID, A.CNTTCAMBIO, A.CNTMTOORI, A.CNTMTOLOC, A.CNTMTOEXT, '
      +'A.CNTFEMIS, A.CNTFVCMTO, A.CNTFCOMP, A.CNTESTADO, A.CNTCUADRE, A.CNTFAUTOM, A.CNTMM, A.CNTDD, A.CNTTRI, A.CNTSEM, A.CNTSS, '
      +'A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, A.FLAGVAR, A.FCONS, A.CNTFMEC, A.TDIARDES, E.CTADES, A.DOCDES, A.CCOSDES, '
      +'A.CNTDEBEMN, CASE WHEN TMONID='''+DMCNT.wTMonExt+''' then A.CNTDEBEME else 0 end CNTDEBEME, '
      +'A.CNTHABEMN, CASE WHEN TMONID='''+DMCNT.wTMonExt+''' THEN A.CNTHABEME else 0 end CNTHABEME, '
      +'A.CNTSALDMN, A.CNTSALDME, A.CAMPOVAR, A.CNTTS, A.CNTPAGADO, A.CNTMODDOC, A.CNTREG, A.CNTUSER, A.CNTFREG, A.CNTHREG, A.AUXID, D.CIADES, 0 CONTA '
      +'FROM CNT301 A, TGE202 B, TGE101 D, TGE202 E '
      +'WHERE A.CIAID='+QuotedStr(dblcCia.Text)+' '
      +'AND A.CIAID=D.CIAID '
      +'AND A.CNTFCOMP>=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+') '
      +'AND A.CNTFCOMP<=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')';
      case rgTipo.itemindex of
       0 : xSql := xSql + ' AND A.CNTESTADO = ''P'' AND A.CNTCUADRE='+''''+'S'+''' '+xWhere1;
       1 : xSql := xSql + ' AND (A.CNTESTADO = ''P''  AND NVL(A.CNTCUADRE,''N'') <> ''S'' OR A.CNTESTADO = ''I''  AND NVL(A.CNTCUADRE,''N'') <> ''S'')'+xWhere1;
       2 : xSql := xSql + ' AND (A.CNTESTADO = ''I'' OR A.CNTESTADO = ''P'') AND' + xWhere1;
      end;
      if sCiaCuenta<>'' then
         xSQL := xSQL + ' and A.'+sCiaCuenta;

      xSql:=xSql +' AND B.CIAID(+)='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = B.CUENTAID(+) AND B.CTA_ME(+)=''S'' '
                 +' AND E.CIAID(+)='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = E.CUENTAID(+) '
                 +'AND SUBSTR( CNTANOMM,5,2)>''00'''
    end;

  Memo1.Lines.clear;
  Memo1.Lines.add( xSQL );


  DMCNT.cdsReporte.Close;
  DMCNT.cdsReporte.DataRequest(xSQL);
  DMCNT.cdsReporte.Open;

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
  xSQL:='SELECT A.CIAID, A.CUENTAID, '
       +'SUM(A.CNTDEBEMN) CNTDEBEMN, '
       +'COALESCE( SUM( CASE WHEN TMONID='''+DMCNT.wTmonExt+''' then A.CNTDEBEME else 0 end ), 0 ) CNTDEBEME, '
       +'SUM(A.CNTHABEMN) CNTHABEMN, '
       +'COALESCE( SUM( CASE WHEN TMONID='''+DMCNT.wTmonExt+''' then A.CNTHABEME else 0 end ), 0 ) CNTHABEME '
       +'FROM CNT301 A, TGE202 B '
       +'WHERE A.CIAID='+QuotedStr(dblcCia.Text)+' '
       +'AND A.CNTFCOMP>=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+') '
       +'AND A.CNTFCOMP<=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')';
       case rgTipo.itemindex of
        0 : xSql := xSql + ' AND A.CNTESTADO = ''P''  AND A.CNTCUADRE='+''''+'S'+''' '+xWhere1;
        1 : xSql := xSql + ' AND (A.CNTESTADO = ''P'' AND coalesce(A.CNTCUADRE,''N'') <> ''S'' OR A.CNTESTADO = ''I''  AND coalesce(A.CNTCUADRE,''N'') <> ''S'')'+xWhere1;
        2 : xSql := xSql + ' AND (A.CNTESTADO = ''I'' OR A.CNTESTADO = ''P'') AND' + xWhere1;
       end;
       xSql:=xSql +' AND B.CIAID='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = B.CUENTAID '
                  +'AND SUBSTR( CNTANOMM,5,2)>''00'''
       +'GROUP BY A.CIAID, A.CUENTAID';
  end
  else
  if SRV_D = 'ORACLE' then
  begin
  xSQL:='SELECT A.CIAID, A.CUENTAID, '
       +'SUM(A.CNTDEBEMN) CNTDEBEMN, '
       +'NVL(SUM(CASE WHEN A.TMONID = ''D'' THEN A.CNTDEBEME ELSE 0 END),0) CNTDEBEME,'
       +'SUM(A.CNTHABEMN) CNTHABEMN, '
       +'NVL(SUM(CASE WHEN A.TMONID = ''D'' THEN A.CNTHABEME ELSE 0 END),0) CNTHABEME'
       +' FROM CNT301 A, TGE202 B '
       +' WHERE A.CIAID='+QuotedStr(dblcCia.Text)+' '
       +' AND A.CNTFCOMP>=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+') '
       +' AND A.CNTFCOMP<=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')';
       case rgTipo.itemindex of
        0 : xSql := xSql + ' AND A.CNTESTADO = ''P'' AND A.CNTCUADRE='+''''+'S'+''' '+xWhere1;
        1 : xSql := xSql + ' AND (A.CNTESTADO = ''P''  AND NVL(A.CNTCUADRE,''N'') <> ''S'' OR A.CNTESTADO = ''I''  AND NVL(A.CNTCUADRE,''N'') <> ''S'')'+xWhere1;
        2 : xSql := xSql + ' AND (A.CNTESTADO = ''I'' OR A.CNTESTADO = ''P'') AND' + xWhere1;
       end;
       if sCiaCuenta<>'' then
          xSQL := xSQL + ' and A.'+sCiaCuenta;

       xSql:=xSql +' AND B.CIAID(+)='+quotedstr(dblcCia.Text)+' AND A.CUENTAID = B.CUENTAID(+) AND B.CTA_ME(+)=''S'' '
                  +'AND SUBSTR( CNTANOMM,5,2)>''00'''
       +' GROUP BY A.CIAID, A.CUENTAID';
  end;
  DMCNT.cdsCierres.Close;
  DMCNT.cdsCierres.DataRequest(xSQl);				// Total de Mov.
  DMCNT.cdsCierres.Open;


  // vhn
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
  xSQL:='SELECT C.CIAID, C.CUENTAID, D.CTA_DET, D.CTA_MOV, '
       +'CASE WHEN COALESCE('+CampoSMN+',0)>0 THEN COALESCE('+CampoSMN+',0) ELSE 0 END CNTDEBEMN, '
       +'CASE WHEN COALESCE('+CampoSME+',0)>0 THEN COALESCE('+CampoSME+',0) ELSE 0 END CNTDEBEME, '
       +'CASE WHEN COALESCE('+CampoSMN+',0)>0 THEN 0 ELSE COALESCE('+CampoSMN+',0) END CNTHABEMN, '
       +'CASE WHEN COALESCE('+CampoSME+',0)>0 THEN 0 ELSE COALESCE('+CampoSME+',0) END CNTHABEME, '
       +'COALESCE('+CampoDMN+',0) DEBEMN, COALESCE('+CampoHMN+',0) HABEMN, '
       +'COALESCE('+CampoDME+',0) DEBEME, COALESCE('+CampoHME+',0) HABEME '
       +'FROM CNT401 C, TGE202 D '
       +'WHERE C.CIAID='+QuotedStr(dblcCia.Text)+' '+xWhere+' '
       +'AND COALESCE(C.AUXID,''N'')=''N'' '
       +'AND COALESCE(C.CCOSID,''N'')=''N'' '
       +'AND C.ANO='+QuotedStr(speAno.Text)+' '
			 +'AND C.CIAID=D.CIAID '
       +'AND C.CUENTAID=D.CUENTAID';
  end
  else
  if SRV_D = 'ORACLE' then
  begin
  xSQL:='SELECT C.CIAID, C.CUENTAID, D.CTA_DET, D.CTA_MOV, '
       +'CASE WHEN NVL('+CampoSMN+',0)>0 THEN NVL('+CampoSMN+',0) ELSE 0 END CNTDEBEMN, '
       +'CASE WHEN NVL('+CampoSME+',0)>0 THEN NVL('+CampoSME+',0) ELSE 0 END CNTDEBEME, '
       +'CASE WHEN NVL('+CampoSMN+',0)>0 THEN 0 ELSE NVL('+CampoSMN+',0) END CNTHABEMN, '
       +'CASE WHEN NVL('+CampoSME+',0)>0 THEN 0 ELSE NVL('+CampoSME+',0) END CNTHABEME, '
       +'NVL('+CampoDMN+',0) DEBEMN, NVL('+CampoHMN+',0) HABEMN, '
       +'NVL('+CampoDME+',0) DEBEME, NVL('+CampoHME+',0) HABEME '
       +'FROM CNT401 C, TGE202 D '
       +'WHERE C.CIAID='+QuotedStr(dblcCia.Text)+' '+xWhere+' '
       +'AND NVL(C.AUXID,''N'')=''N'' '
       +'AND NVL(C.CCOSID,''N'')=''N'' '
       +'AND C.ANO='+QuotedStr(speAno.Text)+' '
			 +'AND C.CIAID=D.CIAID '
       +'AND C.CUENTAID=D.CUENTAID';
    if sCiaCuenta<>'' then
       xSQL := xSQL + ' and C.'+sCiaCuenta;

  end;

  DMCNT.cdsCNTtemp.Close;
  DMCNT.cdsCNTtemp.DataRequest(xSQl);			// Total de Saldos
  DMCNT.cdsCNTtemp.Open;
  DMCNT.cdsCNTtemp.IndexFieldNames:='CUENTAID';

  DMCNT.cdsCierres.IndexFieldNames:='CUENTAID';
  DMCNT.cdsCNTtemp.First;
  while Not DMCNT.cdsCNTtemp.Eof do
  begin
  	DMCNT.cdsCierres.SetKey;						// Total de Saldo
  	DMCNT.cdsCierres.FieldByName('CUENTAID').AsString:=DMCNT.cdsCNTtemp.FieldByName('CUENTAID').AsString;
    if not DMCNT.cdsCierres.GotoKey then
    begin
      DMCNT.cdsCierres.Insert;
      DMCNT.cdsCierres.FieldByName('CIAID').AsString     := dblcCia.Text;
      DMCNT.cdsCierres.FieldByName('CUENTAID').AsString  := DMCNT.cdsCNTtemp.FieldByName('CUENTAID').AsString;

      if (DMCNT.cdsCNTtemp.FieldByName('CTA_DET').AsString = 'N') and
         (DMCNT.cdsCNTtemp.FieldByName('CTA_MOV').AsString = 'N') then
      begin
      	DMCNT.cdsCierres.FieldByName('CNTDEBEMN').AsString := DMCNT.cdsCNTtemp.FieldByName('DEBEMN').AsString;
      	DMCNT.cdsCierres.FieldByName('CNTDEBEME').AsString := DMCNT.cdsCNTtemp.FieldByName('DEBEME').AsString;
      	DMCNT.cdsCierres.FieldByName('CNTHABEMN').AsString := DMCNT.cdsCNTtemp.FieldByName('HABEMN').AsString;
      	DMCNT.cdsCierres.FieldByName('CNTHABEME').AsString := DMCNT.cdsCNTtemp.FieldByName('HABEME').AsString;
      end
      else
      begin
      	DMCNT.cdsCierres.FieldByName('CNTDEBEMN').AsString := '0';
      	DMCNT.cdsCierres.FieldByName('CNTDEBEME').AsString := '0';
      	DMCNT.cdsCierres.FieldByName('CNTHABEMN').AsString := '0';
      	DMCNT.cdsCierres.FieldByName('CNTHABEME').AsString := '0';
      end;
      DMCNT.cdsCierres.Post;
    end;
    DMCNT.cdsCNTtemp.Next;
  end;

  DMCNT.cdsCierres.IndexFieldNames:='';

  xSQL:='SELECT C.CUENTAID '
       +'FROM CNT401 C '
       +'WHERE C.CIAID='+QuotedStr(dblcCia.Text)+' '+xWhere+' '
       +'AND '+wReplacCeros+'(C.AUXID,''N'')=''N'' '
       +'AND '+wReplacCeros+'(C.CCOSID,''N'')=''N'' '
       +'AND C.ANO='+QuotedStr(speAno.Text);
    if sCiaCuenta<>'' then
       xSQL := xSQL + ' and C.'+sCiaCuenta;


  DMCNT.cdsQry.Close;
  DMCNT.cdsQry.DataRequest(xSQl);
  DMCNT.cdsQry.Open;

  CalculaSaldos;

  if DMCNT.cdsReporte.RecordCount=0 then
  begin
  	ShowMessage('No hay datos que mostrar');
    Screen.Cursor:=CrDefault;
    exit;
  end;

  DMCNT.cdsReporte.IndexFieldNames:='';
  DMCNT.cdsReporte.IndexFieldNames:='CUENTAID;CNTANOMM;TDIARID;CNTCOMPROB;CNTFCOMP;CNTREG;CNTSERIE;CNTNODOC';

  DMCNT.cdsQry2.data:=DMCNT.cdsReporte.Data;
  DMCNT.cdsQry2.IndexFieldNames:='';
  DMCNT.cdsQry2.IndexFieldNames:='CUENTAID;CNTANOMM;TDIARID;CNTCOMPROB;CNTFCOMP;CNTREG;CNTSERIE;CNTNODOC';
  //
  //INICIO HPC_201206_CNT
  If xbExportarExcel = True Then
  Begin
     fg_ExportarExcel( 'FORMATO1');
     Exit;
  End;
  //FIN HPC_201206_CNT
  if not sdGraba.Execute then Exit;

  DMCNT.Graba_Log_Consultas( DMCNT.wModulo, DMCNT.wUsuario, 'Mayor Auxiliar Detallado',
                     dblcCia.Text,                                  // Campañía
                     speAno.Text+DMCNT.strZero(speMM.Text,2),  '',  // Periodo Inicio - Final
                     dbdtpFReg1.Text, dbdtpFReg2.Text,              // Fecha   Inicio - final
                     '',  '',                                       // Nivel   - Origen
                     '', '',                                       // Lote    -  Moneda
                     sCtaLog, '',                                  // Cuentas - Auxiliares
                     '', 'Texto',                               // Costos - Tipo Salida
                     '' );               // Tipo Rep

  Screen.Cursor:=crHourGlass;

  pbExp.Max:=100;
  pbExp.Position:=5;

  xBlanco:='                                                                      ';
  xSpace :=0;

  scFile.Lines.Clear;

  DMCNT.cdsQry2.DisableControls;

  bmk2:=DMCNT.cdsQry2.GetBookmark;

  DMCNT.cdsQry2.Last;

  xTem:= Trunc(DMCNT.cdsQry2.RecordCount/20)*2;

  pbExp.Max:=DMCNT.cdsQry2.RecordCount + ( xTem*3 );

  pbExp.Position:=(xTem*2);

  pbExp.Position:=xTem;

  pbExp.Position:=pbExp.Position+xTem;
// Inicio HPC_201601_CNT
// Se comenta línea de definición de moneda en código duro y se reemplaza por definición dinámica con variables que leen parámetros de tablas
//  xLinea:='CIAID;CUENTAID;ORIGEN;COMPROBANTE;FECHA;SERIE;NUMERO;AUXILIAR;F.EMISION;GLOSA;DEBE S/.;HABER S/.;DEBE $;HABER $; CCOSTO';
  xLinea:='CIAID;CUENTAID;ORIGEN;COMPROBANTE;FECHA;SERIE;NUMERO;AUXILIAR;F.EMISION;GLOSA;DEBE '+DMCNT.wTMonLocAbr+';HABER '+DMCNT.wTMonLocAbr+';DEBE '+copy(DMCNT.wTMonExtAbr,3,1)+';HABER '+copy(DMCNT.wTMonExtAbr,3,1)+'; CCOSTO';
// Fin HPC_201601_CNT
  scFile.Lines.Add( xLinea );

  DMCNT.cdsQry2.First;
  while not DMCNT.cdsQry2.Eof do
  begin
     xLinea:='';
     xLinea:=xLinea+ RetornaDatos( 'CIAID' ) +';';
     xLinea:=xLinea+ RetornaDatos( 'CUENTAID' ) +';';
     xLinea:=xLinea+ RetornaDatos( 'TDIARID' ) +';';
     xLinea:=xLinea+ RetornaDatos( 'CNTCOMPROB' ) +';';
     xLinea:=xLinea+ RetornaDatos( 'CNTFCOMP' ) +';';
     xLinea:=xLinea+ RetornaDatos( 'CNTSERIE' ) +';';
     xLinea:=xLinea+ RetornaDatos( 'CNTNODOC' ) +';';
     xLinea:=xLinea+ RetornaDatos( 'AUXID' ) +';';
     xLinea:=xLinea+ RetornaDatos( 'CNTFEMIS' ) +';';
     xLinea:=xLinea+ RetornaDatos( 'CNTGLOSA' ) +';';
     xLinea:=xLinea+ RetornaDatos( 'CNTDEBEMN' ) +';';
     xLinea:=xLinea+ RetornaDatos( 'CNTHABEMN' ) +';';
     xLinea:=xLinea+ RetornaDatos( 'CNTDEBEME' ) +';';
     xLinea:=xLinea+ RetornaDatos( 'CNTHABEME' ) +';';
     //INICIO HPC_201206_CNT
     xLinea:=xLinea+ RetornaDatos( 'CCOSID' ) +';';
     //FIN HPC_201206_CNT
     pbExp.Position:=pbExp.Position+1;
     scFile.Lines.Add( xLinea );
     DMCNT.cdsQry2.Next;
  end;

  scFile.Lines.SaveToFile( sdGraba.FileName );

  DMCNT.cdsQry2.GotoBookmark( bmk2 );
  DMCNT.cdsQry2.FreeBookmark( bmk2 );

  DMCNT.cdsQry2.EnableControls;

  pbExp.Position:=pbExp.Position+1;

  DMCNT.cdsQry2.IndexFieldNames:='';

  Screen.Cursor:=crDefault;

  ShowMessage('Archivo Grabado');

  pbExp.Position    :=0;

end;

function TFMayAuxDet.RetornaDatos( cCampo : String ) : String;
var
  xBlanco : String;
  xSpace  : Integer;
begin
  xBlanco:='                                                                      ';
  if DMCNT.cdsQry2.FieldByName( cCampo ).Size>0 then
     xSpace:=DMCNT.cdsQry2.FieldByName( cCampo ).Size-Length( DMCNT.cdsQry2.FieldByName( cCampo ).AsString)
  else
     xSpace:=15-Length( DMCNT.cdsQry2.FieldByName( cCampo ).AsString);

  Result:=DMCNT.cdsQry2.FieldByName( cCampo ).AsString+Copy(xBlanco,1,xSpace);
end;


procedure TFMayAuxDet.cbFecRepClick(Sender: TObject);
begin
   if cbFecRep.Checked then
      gbFecRep.Enabled:=True
   else
      gbFecRep.Enabled:=False;

end;

procedure TFMayAuxDet.ppHeaderBand1BeforePrint(Sender: TObject);
begin
   pplFec.Visible :=False;
   ppsvFec.Visible:=False;
   if (cbFecRep.Checked) and (dtpFecRep.Date>0) then
   begin
      pplFec.Text:=Datetostr(dtpFecRep.Date);
      pplFec.Visible:=True;
   end
   else
      ppsvFec.Visible:=True;

end;
//INICIO HPC_201206_CNT
Procedure TFMayAuxDet.btnExportarExcelClick(Sender: TObject);
Begin
   xbExportarExcel := True;
   btnExportTextoClick(Self);
   xbExportarExcel := False;
End;
Procedure TFMayAuxDet.fg_ExportarExcel( wgFormato :String);
Begin
   If  wgFormato = 'FORMATO1' Then
   Begin
      dbgMayAuxDet.Selected.Clear;
      dbgMayAuxDet.Selected.Add('CIAID'#9'8'#9'Compañía'#9'F');
      dbgMayAuxDet.Selected.Add('TDIARID'#9'8'#9'TDiario Id'#9'F');
      dbgMayAuxDet.Selected.Add('TDIARDES'#9'18'#9'Tipo Diario'#9'F');
      dbgMayAuxDet.Selected.Add('CNTCOMPROB'#9'12'#9'Nº Comprobante'#9'F');
      dbgMayAuxDet.Selected.Add('CNTANOMM'#9'6'#9'Año Mes'#9'F');

      dbgMayAuxDet.Selected.Add('CNTFEMIS'#9'6'#9'FechaEmision'#9'F');

      dbgMayAuxDet.Selected.Add('CNTLOTE'#9'6'#9'Lote'#9'F');
      dbgMayAuxDet.Selected.Add('CUENTAID'#9'6'#9'Cuenta'#9'F');
      dbgMayAuxDet.Selected.Add('CTADES'#9'15'#9'Cuenta Des'#9'F');
      dbgMayAuxDet.Selected.Add('DOCID'#9'6'#9'Cod Doc'#9'F');
      dbgMayAuxDet.Selected.Add('DOCDES'#9'15'#9'Documento Des'#9'F');
      dbgMayAuxDet.Selected.Add('CNTSERIE'#9'6'#9'Serie'#9'F');
      dbgMayAuxDet.Selected.Add('CNTNODOC'#9'6'#9'Nº Doc'#9'F');
      dbgMayAuxDet.Selected.Add('CNTGLOSA'#9'15'#9'Glosa'#9'F');
      dbgMayAuxDet.Selected.Add('CCOSID'#9'6'#9'CCosto'#9'F');
      dbgMayAuxDet.Selected.Add('CCOSDES'#9'15'#9'CCosto Des'#9'F');
      dbgMayAuxDet.Selected.Add('CNTTCAMBIO'#9'6'#9'TCambio'#9'F');
      dbgMayAuxDet.Selected.Add('CNTESTADO'#9'6'#9'Estado'#9'F');
      dbgMayAuxDet.Selected.Add('TMONID'#9'6'#9'Moneda'#9'F');
      dbgMayAuxDet.Selected.Add('CNTDEBEMN'#9'10'#9'S/ Debe'#9'F');
      dbgMayAuxDet.Selected.Add('CNTHABEMN'#9'10'#9'S/ Haber'#9'F');
      dbgMayAuxDet.Selected.Add('CNTDEBEME'#9'10'#9'$ Debe'#9'F');
      dbgMayAuxDet.Selected.Add('CNTHABEME'#9'10'#9'$ Haber'#9'F');
      dbgMayAuxDet.Selected.Add('CNTUSER'#9'10'#9'Usuario'#9'F');
      dbgMayAuxDet.Selected.Add('CNTREG'#9'10'#9'Registro'#9'F');
   End;

   dbgMayAuxDet.DataSource :=  DMCNT.dsQry2;
   Try
      Screen.Cursor := crHourGlass;
      dbgMayAuxDet.ExportOptions.ExportType := wwgetSYLK;
      dbgMayAuxDet.ExportOptions.FileName := 'MAYOR AUXILIAR DETALLADO' + '.slk';
      dbgMayAuxDet.ExportOptions.Save;//el primero genera error
      dbgMayAuxDet.ExportOptions.Save;
      ShellExecute(Handle, 'Open', PChar(dbgMayAuxDet.exportoptions.Filename),Nil, Nil, sw_shownormal);
      Screen.Cursor := crDefault;
   Except
         On Ex: Exception Do
            Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;
End;
//FIN HPC_201206_CNT

//INICIO RMZ
procedure TFMayAuxDet.BtnPLEClick(Sender: TObject);
var xsql: String;
begin
   if edtCia.Text='' then
   begin
     ShowMessage('Compañía no válida');
     raise exception.Create('Compañía no válida');
   end ;

   if (dbdtpFReg1.Date=0) or (dbdtpFReg2.Date=0) then
   begin
     ShowMessage('Fecha no válida');
     raise exception.Create('Fecha no válida');
   end ;

    Try
      FLibMayorPLE := TFLibMayorPLE.create(Self);
      FLibMayorPLE.ShowModal;
    Finally
      FLibMayorPLE.Free;
    End;
end;
//Final RMZ


//INCIO RMZ
procedure TFMayAuxDet.fg_HabilitabotonPLE;
begin
   If  rgCuenta.ItemIndex=0 Then
       If (dblcCia.Text='01') Then
            BtnPLE.Visible := True
       Else BtnPLE.Visible := False
   Else BtnPLE.Visible := False;
end;
//FINAL RMZ

procedure TFMayAuxDet.sbDisenoRepClick(Sender: TObject);
begin
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
end;

end.
