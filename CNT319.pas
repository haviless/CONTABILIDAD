unit CNT319;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, wwdbdatetimepicker, Spin, StdCtrls, wwdblook, Buttons, ppDB,
  ppDBPipe, ppVar, ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppComm,
  ppRelatv, ppProd, ppReport,ppViewr, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg,
  ppEndUsr, ppTxPipe, ppFilDev, SOLPrintTexto, pptypes;

type
  TFMAD = class(TForm)
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
    rgAuxiliar: TRadioGroup;
    Z2bbtnSelAuxiliar: TBitBtn;
    Z2bbtnSelCuenta: TBitBtn;
    pprMayorAna: TppReport;
    ppdbMayorAna: TppDBPipeline;
    rgTipo: TRadioGroup;
    ppHeaderBand1: TppHeaderBand;
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
    ppDetailBand1: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
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
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel66: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel30: TppLabel;
    ppDBText22: TppDBText;
    ppDBText41: TppDBText;
    ppLabel2: TppLabel;
    ppLabel68: TppLabel;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppVariable15: TppVariable;
    ppVariable17: TppVariable;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppVariable1: TppVariable;
    ppVariable2: TppVariable;
    ppVariable3: TppVariable;
    ppVariable4: TppVariable;
    ppVariable5: TppVariable;
    ppVariable6: TppVariable;
    gbRangos: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    dblcdDesde: TwwDBLookupComboDlg;
    dblcdHasta: TwwDBLookupComboDlg;
    ppDesigner1: TppDesigner;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel11: TppLabel;
    ppLabel14: TppLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure gbPerExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dbdtpFReg1Exit(Sender: TObject);
    procedure dbdtpFReg2Exit(Sender: TObject);
    procedure rgAuxiliarClick(Sender: TObject);
    procedure rgCuentaClick(Sender: TObject);
    procedure Z2bbtnSelAuxiliarClick(Sender: TObject);
    procedure Z2bbtnSelCuentaClick(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure bbtnCancClick(Sender: TObject);
    procedure pprMayorAnaPreviewFormCreate(Sender: TObject);
    procedure pprMayorAnaStartPage(Sender: TObject);
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforeGenerate(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppVariable15Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable17Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable2Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable3Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable6Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable4Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable5Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable15Print(Sender: TObject);
    procedure ppVariable3Print(Sender: TObject);
    procedure pprMayorAnaSaveText(Sender: TObject; var Text: String);
  private
    { Private declarations }
    xNivel,xCampo,xSQL : String;
    xSaldoAntMn,xSaldoAntME : double;
    procedure CalculaSaldos;
  public
    { Public declarations }
  end;

var  FMAD: TFMAD;
  SFMN, SFME: DOUBLE;       // xx para programacion chcr
  xx: SmallInt;
  xWhere,xWhere1, UltNivel, xCia, xCta, xClAux, xAux: String;

implementation

uses CNTDM, CNT411, CNT412;

{$R *.DFM}

procedure TFMAD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DM1.cdsCuenta.IndexFieldNames:='';
   DM1.cdsCuenta.Filter:='';
   DM1.cdsCuenta.Filtered := True;
   DM1.cdsQry.IndexFieldNames := '';
   DM1.cdsQry.Filter := '';
   DM1.cdsQry.Filtered := True;
end;

procedure TFMAD.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;

end;

procedure TFMAD.FormShow(Sender: TObject);
var
   xAno, xMes, xDia: Word;
begin
   SFMN:=0; SFME:=0; xx:=0;
   DM1.Filtracds( DM1.cdsNivel,   '' );
   DM1.cdsNivel.IndexFieldNames   := 'NIVEL';
//   DM1.cdsMovCNT2.IndexFieldNames:='CiaId;CuentaId;ClAuxId;AuxId';
   DM1.cdsCuenta.IndexFieldNames:='CUENTAID';
   DM1.cdsCuenta.Open;
   DM1.cdsNivel.Last;
   UltNivel:=DM1.cdsNivel.FieldByName('Nivel').AsString;
   dblcCia.Text     := '' ;
   DecodeDate(Date, xAno, xMes, xDia);
   speAno.Value:=xAno;
   speMM.Value:=xMes;
   gbPerExit(Self);
   dm1.cdsCia.Filtered := False     ;
   if not dm1.cdsCia.Active then
      dm1.cdsCia.Open ;
   if dm1.cdsCia.RecordCount = 1 then
   begin
      dblcCia.Text := dm1.cdsCia.fieldbyname('CIAID').AsString ;
      edtCia.Text  := dm1.cdsCia.fieldbyname('CIADES').AsString ;
      dblcCia.Enabled := False ;
   end ;
   //self.SetFocus ;
   perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFMAD.gbPerExit(Sender: TObject);
var
   xFecha1, xFecha2 : TDateTime;
   wFechaM,wFechaA :String;
begin
   xFecha1 := strtodate('01/'+DM1.strZero(speMM.Text,2)+'/'+speAno.Text);
   if strtofloat(speMM.Text)+1=13 then
   begin
      xFecha2 := strtodate('01/01/'+ FloatToStr(StrToFloat(speAno.Text)+1));
   end
   else begin
      xFecha2:=strtodate('01/'+DM1.strZero(floattostr(strtofloat(speMM.Text)+1),2)+'/'+speAno.Text);
   end;
   xFecha2:=xFecha2-1;
   dbdtpFReg1.date:=xFecha1;
   dbdtpFReg2.date:=xFecha2;
end;

procedure TFMAD.dblcCiaExit(Sender: TObject);
begin
   if (bbtnCanc.Focused) then exit;
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DM1.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   end;
   Screen.Cursor:= crHourGlass;
   xSQL:='SELECT CIAID, CUENTAID, CTADES FROM CNT401 WHERE '
      +' CIAID='''+dblcCia.text+''' AND  nvl(clauxid,''nulo'')=''nulo'' and '
      +' nvl(auxid,''nulo'')=''nulo''  and nvl(ccosid,''nulo'')=''nulo'' ORDER BY CUENTAID ';
   DM1.cdsCuenta.fetchondemand:=False;
   DM1.cdsCuenta.packetrecords:=-1;
   DM1.cdsCuenta.fetchondemand:=True;
   DM1.FiltraCDS(DM1.cdsCuenta,xSQL);
   Screen.Cursor:=CrDefault;
end;

procedure TFMAD.dbdtpFReg1Exit(Sender: TObject);
begin
   If dbdtpFReg1.date=0 then
   begin
      dbdtpFReg1.SetFocus;
      ShowMessage('Error : Falta Registrar Fecha');
      Raise Exception.Create('Error : Falta Registrar Fecha');
   end;

end;

procedure TFMAD.dbdtpFReg2Exit(Sender: TObject);
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

procedure TFMAD.rgAuxiliarClick(Sender: TObject);
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

procedure TFMAD.rgCuentaClick(Sender: TObject);
begin
  If rgCuenta.Itemindex = 0 then
  Begin
   Z2bbtnSelCuenta.enabled := False;
   gbRangos.Enabled:=False;
   dblcdDesde.Text:='';
   dblcdHasta.Text:='';
   dblcdDesde.Enabled:=False;
   dblcdHasta.Enabled:=False;
  End;
  If rgCuenta.Itemindex = 1 then
  Begin
   Z2bbtnSelCuenta.enabled := False;
   gbRangos.Enabled:=True;
   dblcdDesde.Text:='';
   dblcdHasta.Text:='';
   dblcdDesde.Enabled:=True;
   dblcdHasta.Enabled:=True;
  End;

  If rgCuenta.Itemindex = 2 then
  Begin
   Z2bbtnSelCuenta.enabled := True;
   Z2bbtnSelCuenta.Click;
   gbRangos.Enabled:=False;
   dblcdDesde.Text:='';
   dblcdHasta.Text:='';
   dblcdDesde.Enabled:=False;
   dblcdHasta.Enabled:=False;
  End;


end;

procedure TFMAD.Z2bbtnSelAuxiliarClick(Sender: TObject);
begin
   FSelAux.ShowModal ;
end;

procedure TFMAD.Z2bbtnSelCuentaClick(Sender: TObject);
begin
	Screen.Cursor:=crHourGlass;
	FSelCuenta.sCia:=dblcCia.text;
  FSelCuenta.ShowModal;
end;

procedure TFMAD.bbtnOkClick(Sender: TObject);
var
	xSQL,xSustrae: String;
  wFecha1,wFecha, wAno, wMes, wMesAnt, xGrp: String;
  CampoDMN,CampoHMN,CampoSMN,CampoDME,CampoHME,CampoSME: String;
  xTDMN, xTHMN, xTDME, xTHME: DOUBLE;
  Year, Month, Day: Word;
  xPos,xZ : Integer;
  xMonedaL,xMonedaE,xDesde,xHasta : String;
begin
  dm1.cdsMovcnt2.IndexFieldNames:='';
  dm1.cdsQry.IndexFieldNames := '';
  dm1.cdsQry.Filter := '';
  dm1.cdsQry.Filtered := True;
  xMonedaL := dm1.DisplayDescrip('prvTGE','TGE103','TMONABR','TMON_LOC='+quotedstr('L'),'TMONABR');
  xMonedaE := dm1.DisplayDescrip('prvTGE','TGE103','TMONABR','TMON_LOC='+quotedstr('E'),'TMONABR');
  SFMN:=0; SFME:=0; xx:=0;
  xsql := 'NIVEL='+quotedstr('0'+IntToStr(StrToInt(UltNivel)+1));
  If dm1.DisplayDescrip('PrvTGE','CNT202','*',xsql,'NIVEL') = '' then
  	xnivel := '0'
  else
  	xnivel := '1';
  xWhere:='';
  xWhere1 :='';
  if (rgCuenta.ItemIndex=2) and (FSelCuenta.cdsClone.recordcount>0) then
  begin
  	if length(xWhere)>0 then
    begin
    	xWhere:=xWhere+' and ';
      xWhere1 :=xWhere+' and ';
    end;
    xWhere := xWhere+'CNT401.CUENTAID IN (' ;
    xWhere1 := xWhere1+'cnt301.CUENTAID IN (' ;
    with FSelCuenta.cdsClone do
    begin
    	First ;
      while not Eof do
      begin
      	xWhere := xWhere + '''' + fieldbyname('CUENTAID').AsString + '''';
        xWhere1 := xWhere1 + '''' + fieldbyname('CUENTAID').AsString + '''';
        Next ;
        if not eof then
        begin
        	xWhere := xWhere + ' , ' ;
          xWhere1 := xWhere1 + ' , ' ;
        end;
      end;
    end ;
    xwhere := xwhere + ')';
    xwhere1 := xwhere1 + ')';
  end ;

  if (rgAuxiliar.ItemIndex=2) and (FSelAux.cdsClone.recordcount>0) then
  begin
  	if length(xWhere)>0 then
    begin
    	xWhere:=xWhere+' AND ';
      xWhere1:=xWhere1+' AND ';
    end;
    xWhere := xWhere + '(' ;
    xWhere1 := xWhere1 + '(' ;
    with FSelAux.cdsClone do
    begin
    	First ;
      while not Eof do
      begin
      	xWhere := xWhere + '(CLAUXID = '''+fieldbyname('CLAUXID').AsString+
                         ''' AND AUXID = ''' + fieldbyname('AUXID').AsString + ''') ' ;
        xWhere1 := xWhere1 + '(CLAUXID = '''+fieldbyname('CLAUXID').AsString+
                       ''' AND AUXID = ''' + fieldbyname('AUXID').AsString + ''') ' ;
        Next ;
        if not eof then
        begin
        	xWhere := xWhere + ' OR ' ;
          xWhere1 := xWhere1 + ' OR ' ;
        end;
      end;
    end ;
    xwhere  := xwhere + ')' ;
    xwhere1 := xwhere1 + ')' ;
  end
  else
  begin
    //xWhere  := xWhere + ' AND (NVL(CLAUXID,''N'') = ''N'' AND NVL(AUXID,''N'') = ''N'') ' ;
    //xWhere1 := xWhere1+ ' AND (NVL(CLAUXID,''N'') = ''N'' AND NVL(AUXID,''N'') = ''N'') ' ;
		//AND NVL(CLAUXID,'N') ='N'
  end;

  if length(xWhere)>0 then
  begin
  	xWhere:= ' and '+xWhere;
    xWhere1:= ' and '+xWhere1;
  end;

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
      If StrToInt(dblcdDesde.Text)>StrToInt(dblcdHasta.Text) Then
      Begin
        showmessage('La Cuenta Inicio debe ser Menor a la Cuenta Fin');
        dblcdDesde.SetFocus;
        exit;
      End;
      If StrToInt(dblcdHasta.Text)<StrToInt(dblcdDesde.Text) Then
      Begin
        showmessage('La Cuenta de Fin debe ser Mayor que la Cuenta de Inicio');
        dblcdHasta.SetFocus;
        exit;
      End;
     xDesde:=TRIM(dblcdDesde.Text);
     xHasta:=TRIM(dblcdHasta.Text);

     xWhere:=xWhere+' AND CNT401.CUENTAID BETWEEN '+QuotedStr(xDesde)+' AND '+QuotedStr(xHasta)+' ';
  end;

  DecodeDate(dbdtpFReg1.Date, Year, Month, Day);
  wMes := inttostr(Month);

//  If Month - 1 <= 9 then
//   wMesAnt := '0' + inttostr(Month - 1);
//  if length(wMes)<2 then
//   wMes := '0'+inttostr(Month);
//  Month:=DM1.StrZero(Month,2);

  wMes:=DM1.StrZero(wMes,2);
  wMesAnt:=IntToStr(StrToInt(wMes)-1);
  wMesAnt:=DM1.StrZero(wMesAnt,2);

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

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
// VHN
//  	xSQL:='Select RTRIM(LTRIM(CNT401.CIAID)) CIAID, RTRIM(LTRIM(CNT401.CUENTAID)) CUENTAID, '+wReplacCeros+'(RTRIM(LTRIM(CNT401.CLAUXID)),''-'') CLAUXID, '+wReplacCeros+'(RTRIM(LTRIM(CNT401.AUXID)),''-'') AUXID, CNT401.CTADES, CNT401.AUXDES, '
  	xSQL:='Select RTRIM(LTRIM(CNT401.CIAID)) CIAID, RTRIM(LTRIM(CNT401.CUENTAID)) CUENTAID, CNT401.CTADES, '
        +'Sum('+wReplacCeros+'('+CampoSMN+',0)) as SALDMN, '
        +'Sum('+wReplacCeros+'('+CampoDMN+',0)) as DEBEMN, '+'Sum('+wReplacCeros+'('+CampoHMN+',0)) as HABEMN, '
        +'Sum('+wReplacCeros+'('+CampoSME+',0)) as SALDME, '
        +'Sum('+wReplacCeros+'('+CampoDME+',0)) as DEBEME, '+'Sum('+wReplacCeros+'('+CampoHME+',0)) as HABEME, '
        + ' TGE202.CTA_MOV,CNT401.TIPO '
        +' From CNT401 '
        +' LEFT JOIN TGE202 ON (TGE202.CIAID='+quotedstr(dblcCia.text)+' CNT401.CUENTAID = TGE202.CUENTAID AND CNT401.CIAID = TGE202.CIAID ) Where '
        +'CNT401.CIAID='+quotedstr(dblcCia.text)
        +' and CNT401.ANO='+''''+wAno+'''';
    xPos := pos('CUENTAID',xWhere);
    If xWhere <> '' then
     xsustrae := copy(xWhere,1,xPos-1)+' CNT401.'+copy(xWhere,xpos,length(xWhere));
    xSql := xSql + xSustrae;

    if (UltNivel <> '') then
       xSQL:=xSQL+' and CNT401.TIPO='+''''+UltNivel+''''
    else begin
       xSQL:=xSQL+' and TGE202.CTA_MOV='+''''+'S'+'''';
    end;
// VHN
//    xGrp:=' Group by CNT401.CIAID, CNT401.CUENTAID, CNT401.AUXID, CNT401.CLAUXID, CNT401.CTADES, CNT401.AUXDES,TGE202.CTA_MOV,CNT401.TIPO';
    xGrp:=' Group by CNT401.CIAID, CNT401.CUENTAID, CNT401.CTADES, TGE202.CTA_MOV, CNT401.TIPO';
    xSQL:=xSQL+xGrp
         +' Having Sum('+wReplacCeros+'('+CampoSMN+',0))<>0 or Sum('+wReplacCeros+'('+CampoDMN+',0))<>0'
         +' or Sum('+wReplacCeros+'('+CampoHMN+',0)) <> 0'  // Descarta los q no tienen Movms.
         +' Order By CIAID,CUENTAID';
// VHN
//         +' Order By CIAID,CUENTAID,CLAUXID,AUXID';
  end
  else
  if SRV_D = 'ORACLE' then
  begin
    //if rgAuxiliar.
    // vhn
//	  	xSQL:='Select TRIM(CNT401.CIAID) CIAID, TRIM(CNT401.CUENTAID) CUENTAID, '+wReplacCeros+'(TRIM(CNT401.CLAUXID),''-'') CLAUXID, '+wReplacCeros+'(TRIM(CNT401.AUXID),''-'') AUXID, CNT401.CTADES, CNT401.AUXDES, '
  	xSQL:='Select TRIM(CNT401.CIAID) CIAID, TRIM(CNT401.CUENTAID) CUENTAID, CNT401.CTADES,CNT401.AUXID, '
        +'Sum('+wReplacCeros+'('+CampoSMN+',0)) as SALDMN, '
        +'Sum('+wReplacCeros+'('+CampoDMN+',0)) as DEBEMN, '+'Sum('+wReplacCeros+'('+CampoHMN+',0)) as HABEMN, '
        +'Sum('+wReplacCeros+'('+CampoSME+',0)) as SALDME, '
        +'Sum('+wReplacCeros+'('+CampoDME+',0)) as DEBEME, '+'Sum('+wReplacCeros+'('+CampoHME+',0)) as HABEME, '
        + ' TGE202.CTA_MOV,CNT401.TIPO '
        +' From CNT401,TGE202 '
        +' Where '
        +'CNT401.CIAID='+''''+dblcCia.Text+''''
        +' and CNT401.ANO='+''''+wAno+''''
        +' AND (TGE202.CIAID(+)='+quotedstr(dblcCia.text)+' AND CNT401.CUENTAID = TGE202.CUENTAID(+) AND CNT401.CIAID = TGE202.CIAID(+))' +xWhere+ ' AND CLAUXID IS NULL';

    if (UltNivel <> '') then
       xSQL:=xSQL+' and CNT401.TIPO<='+''''+UltNivel+''''
    else
       xSQL:=xSQL+' and TGE202.CTA_MOV='+''''+'S'+'''';
//  xGrp:=' Group by CNT401.CIAID, CNT401.CUENTAID, CNT401.AUXID, CNT401.CLAUXID, CNT401.CTADES, CNT401.AUXDES,TGE202.CTA_MOV,CNT401.TIPO';
    xGrp:=' Group by CNT401.CIAID, CNT401.CUENTAID, CNT401.CTADES, TGE202.CTA_MOV, CNT401.TIPO,CNT401.AUXID ';
    xSQL:=xSQL+xGrp
         +' Having Sum('+wReplacCeros+'('+CampoSMN+',0))<>0 or Sum('+wReplacCeros+'('+CampoDMN+',0))<>0'
         +' or Sum('+wReplacCeros+'('+CampoHMN+',0)) <> 0'  // Descarta los q no tienen Movms.
         +' Order By CIAID, CUENTAID';
  end;
  Screen.Cursor:=CrHourGlass;
  DM1.cdsQry.Close;
  DM1.cdsQry.ProviderName:='prvCNT';
  DM1.cdsQry.DataRequest(xSQL);
  DM1.cdsQry.Open;
//  DM1.cdsQry.IndexFieldNames:='CuentaId;ClAuxId;AuxId';
  DM1.cdsQry.IndexFieldNames:='CuentaId';
  DM1.cdsQry.ReadOnly:=False;
  DM1.cdsQry.First;
  if wFecha1<>datetostr(dbdtpFReg1.Date) then
  begin  // Si fech_ini no es calendario
  	//Selecciona datos de 301 k faltan en el periodo
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
           +' from CNT301 '
           +  ' LEFT JOIN TGE202 ON (CNT301.CIAID = '+quotedstr(dblcCia.Text)+'CNT301.CUENTAID=TGE202.CUENTAID AND TGE202.CTA_ME=''S'')'
           +' where CNT301.CIAID='+''''+dblcCia.Text+''''
           +' and CNT301.CNTFCOMP>='+wFecha
           +' and CNT301.CNTFCOMP<=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')'
           +' and CNT301.CNTCUADRE='+''''+'S'+''''+xWhere
           +' Order By CNT301.CUENTAID,CNT301.CNTCOMPROB';
    end
    else
    if SRV_D = 'ORACLE' then
    begin
    	xSQL:='Select '
           +' TRIM(cnt301.CIAID) CIAID,TRIM(cnt301.TDIARID) TDIARID,cnt301.CNTCOMPROB,cnt301.CNTANO,cnt301.CNTANOMM,cnt301.CNTLOTE,'
           +' TRIM(CNT301.CUENTAID) CUENTAID, '
           +' cnt301.DOCID,cnt301.CNTSERIE,cnt301.CNTNODOC,cnt301.CNTGLOSA,cnt301.CNTDH,'
           +' cnt301.CCOSID,cnt301.CNTTCAMBIO,cnt301.CNTMTOORI,cnt301.CNTMTOLOC,cnt301.CNTMTOEXT,cnt301.CNTFEMIS,cnt301.CNTFVCMTO,cnt301.CNTFCOMP,'
           +' cnt301.CNTESTADO,cnt301.CNTCUADRE,cnt301.CNTFAUTOM,cnt301.CNTMM,cnt301.CNTDD,cnt301.CNTTRI,cnt301.CNTSEM,cnt301.CNTSS,cnt301.CNTAATRI,'
           +' cnt301.CNTAASEM,cnt301.CNTAASS,cnt301.TMONID,cnt301.FLAGVAR,cnt301.FCONS,cnt301.CNTFMEC,cnt301.TDIARDES,cnt301.CTADES,'
           +' cnt301.DOCDES,'
           +' cnt301.CCOSDES,cnt301.CNTDEBEMN,cnt301.CNTDEBEME,cnt301.CNTHABEMN,cnt301.CNTHABEME,cnt301.CNTSALDMN,cnt301.CNTSALDME,'
           + 'cnt301.CAMPOVAR,cnt301.CNTTS,'
           +' cnt301.CNTPAGADO,cnt301.CNTMODDOC,cnt301.CNTREG,cnt301.CNTUSER,cnt301.CNTFREG,cnt301.CNTHREG'
           +',CNT301.CNTCOMPROB,CNT301.AUXID  '
           +' from CNT301 '
           + ' ,TGE202 WHERE CNT301.CIAID='+''''+dblcCia.Text+''''
           +' and CNT301.CNTFCOMP>='+wFecha
           +' and CNT301.CNTFCOMP<=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')';
      case rgTipo.itemindex of
      	0 : xSql := xSql + ' AND CNT301.CNTESTADO = ''P'' AND CNT301.CNTCUADRE='+''''+'S'+''' '+xWhere1;
            //1 : xSql := xSql + ' and CNT301.CNTCUADRE<>'+''''+'S'+''''+xWhere1;
        1 : xSql := xSql + ' AND (CNT301.CNTESTADO = ''P''  AND NVL(CNT301.CNTCUADRE,''N'') <> ''S'' OR CNT301.CNTESTADO = ''I''  AND NVL(CNT301.CNTCUADRE,''N'') <> ''S'') '+xWhere1;
        2 : xSql := xSql + ' AND (CNT301.CNTESTADO = ''I'' OR CNT301.CNTESTADO = ''P'') ' + xWhere1;
      end;
      xSql:=xSql+' and TGE202.CIAID(+)'+quotedstr(dblcCia.Text) +' and CNT301.CUENTAID = TGE202.CUENTAID(+) and TGE202.CTA_ME(+)=''S'''
           +' Order By CNT301.CUENAID,CNT301.CNTCOMPROB';
		end;
  end;   // Fin: Si fech_ini no es calendario (P.ej: 01/03/1997  si es)

// Selecciona datos de 301 k sobran en el periodo
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
	begin
   	xSQL:='Select '
          +' RTRIM(LTRIM(cnt301.CIAID)) CIAID,RTRIM(LTRIM(cnt301.TDIARID)) TDIARID,cnt301.CNTCOMPROB,cnt301.CNTANO,cnt301.CNTANOMM,'
          +' cnt301.CNTLOTE,RTRIM(LTRIM(CNT301.CUENTAID)) CUENTAID, '+wReplacCeros+'(RTRIM(LTRIM(cnt301.CLAUXID)),''-'') CLAUXID,'
          +' '+wReplacCeros+'(RTRIM(LTRIM(cnt301.AUXID)),''-'') AUXID, cnt301.DOCID,cnt301.CNTSERIE,cnt301.CNTNODOC,cnt301.CNTGLOSA,cnt301.CNTDH,'
          +' cnt301.CCOSID,cnt301.CNTTCAMBIO,cnt301.CNTMTOORI,cnt301.CNTMTOLOC,cnt301.CNTMTOEXT,cnt301.CNTFEMIS,cnt301.CNTFVCMTO,cnt301.CNTFCOMP,'
          +' cnt301.CNTESTADO,cnt301.CNTCUADRE,cnt301.CNTFAUTOM,cnt301.CNTMM,cnt301.CNTDD,cnt301.CNTTRI,cnt301.CNTSEM,cnt301.CNTSS,cnt301.CNTAATRI,'
          +' cnt301.CNTAASEM,cnt301.CNTAASS,cnt301.TMONID,cnt301.FLAGVAR,cnt301.FCONS,cnt301.CNTFMEC,cnt301.TDIARDES,cnt301.CTADES,'
          +' cnt301.AUXDES,cnt301.DOCDES,'
          +' cnt301.CCOSDES,cnt301.CNTDEBEMN,cnt301.CNTDEBEME,cnt301.CNTHABEMN,cnt301.CNTHABEME,cnt301.CNTSALDMN,cnt301.CNTSALDME,'
          +' cnt301.CAMPOVAR,cnt301.CNTTS,'
          +' cnt301.CNTPAGADO,cnt301.CNTMODDOC,cnt301.CNTREG,cnt301.CNTUSER,cnt301.CNTFREG,cnt301.CNTHREG'
          +' from CNT301 '
          +  ' LEFT JOIN TGE202 ON (CNT301.CUENTAID=TGE202.CUENTAID AND TGE202.CTA_ME=''S'' and TGE202.CIAID='+quotedstr(dblcCia.Text)+')'
          +' WHERE CNT301.CIAID='+quotedstr(dblcCia.Text)
          +' and CNTFCOMP>=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+')'
          +' and CNTFCOMP<=DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')';
          case rgTipo.itemindex of
           0 : xSql := xSql + ' AND CNT301.CNTESTADO = ''P'' AND CNT301.CNTCUADRE='+''''+'S'+''' '+xWhere1;
           //1 : xSql := xSql + ' and CNT301.CNTCUADRE<>'+''''+'S'+''''+xWhere1;
           1 : xSql := xSql + 'AND '+wReplacCeros+'(CNT301.CNTCUADRE,''N'') <> ''S'' '+xWhere1;
           2 : xSql := xSql + ' AND (CNT301.CNTESTADO = ''I'' OR CNT301.CNTESTADO = ''P'') ' + xWhere1;

          end;

          xSql := xSql +' Order By CNT301.CUENTAID,CNT301.CNTCOMPROB';
	end
	else
  if SRV_D = 'ORACLE' then
  begin
  	 xSQL:='Select '
          +' TRIM(cnt301.CIAID) CIAID,TRIM(cnt301.TDIARID) TDIARID,cnt301.CNTCOMPROB,cnt301.CNTANO,cnt301.CNTANOMM,cnt301.CNTLOTE,'
          +' TRIM(CNT301.CUENTAID) CUENTAID, '
          +' cnt301.DOCID,cnt301.CNTSERIE,cnt301.CNTNODOC,cnt301.CNTGLOSA,cnt301.CNTDH,'
          +' cnt301.CCOSID,cnt301.CNTTCAMBIO,cnt301.CNTMTOORI,cnt301.CNTMTOLOC,cnt301.CNTMTOEXT,cnt301.CNTFEMIS,cnt301.CNTFVCMTO,cnt301.CNTFCOMP,'
          +' cnt301.CNTESTADO,cnt301.CNTCUADRE,cnt301.CNTFAUTOM,cnt301.CNTMM,cnt301.CNTDD,cnt301.CNTTRI,cnt301.CNTSEM,cnt301.CNTSS,cnt301.CNTAATRI,'
          +' cnt301.CNTAASEM,cnt301.CNTAASS,cnt301.TMONID,cnt301.FLAGVAR,cnt301.FCONS,cnt301.CNTFMEC,cnt301.TDIARDES,cnt301.CTADES, cnt301.DOCDES,'
          +' cnt301.CCOSDES,cnt301.CNTDEBEMN, DECODE(TMONID,'+QuotedStr('D')+',cnt301.CNTDEBEME,0) CNTDEBEME ,'
          +'cnt301.CNTHABEMN,DECODE(TMONID,'+QuotedStr('D')+',cnt301.CNTHABEME,0) CNTHABEME,cnt301.CNTSALDMN,cnt301.CNTSALDME,'
          +' cnt301.CAMPOVAR,cnt301.CNTTS,'
          +' cnt301.CNTPAGADO,cnt301.CNTMODDOC,cnt301.CNTREG,cnt301.CNTUSER,cnt301.CNTFREG,cnt301.CNTHREG,CNT301.AUXID '
          +',CNT301.CNTCOMPROB '
          +' from CNT301, TGE202 '
          +' WHERE CNT301.CIAID='+quotedstr(dblcCia.Text)
          +' and CNT301.CNTFCOMP>=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg1.date)+''''+')'
          +' and CNT301.CNTFCOMP<=TO_DATE('+''''+formatdatetime(wFormatFecha,dbdtpFReg2.date)+''''+')';
          case rgTipo.itemindex of
           0 : xSql := xSql + ' AND CNT301.CNTESTADO = ''P'' AND CNT301.CNTCUADRE='+''''+'S'+''' '+xWhere1;
           1 : xSql := xSql + ' AND (CNT301.CNTESTADO = ''P''  AND NVL(CNT301.CNTCUADRE,''N'') <> ''S'' OR CNT301.CNTESTADO = ''I''  AND NVL(CNT301.CNTCUADRE,''N'') <> ''S'') '+xWhere1;
           2 : xSql := xSql + ' AND (CNT301.CNTESTADO = ''I'' OR CNT301.CNTESTADO = ''P'') ' + xWhere1;
          end;
          If rgCuenta.ItemIndex=1 Then
          Begin
            xSQL:=xSQL+' AND CNT301.CUENTAID BETWEEN '+QuotedStr(xDesde)+' AND '+QuotedStr(xHasta)+' ';
          End;

          xSql:=xSql +' and  TGE202.CIAID(+)='+quotedstr(dblcCia.Text)+' and CNT301.CUENTAID = TGE202.CUENTAID(+) and TGE202.CTA_ME(+)=''S'''
               +' Order By CNT301.CUENTAID,CNT301.CNTCOMPROB';
	end;
  DM1.cdsMovCNT2.IndexFieldNames:='';
  DM1.cdsMovCNT2.Close;
  DM1.cdsMovCNT2.DataRequest(xSQL);
  DM1.cdsMovCNT2.Open;
  DM1.cdsMovCNT2.IndexFieldNames:='CiaId;CuentaId';

  CalculaSaldos;

  DM1.cdsMovCNT2.indexfieldnames := 'CUENTAID;TDIARID;CNTCOMPROB';
  DM1.cdsMovCNT2.First;

  pplblCia.Caption  := edtCia.Text ;

  /// Asigna  Titulo
  pplblPerFech.Caption :='          Periodo: '+speAno.Text+wMes;

  if DM1.cdsMovCNT2.RecordCount=0 then
  begin
  	ShowMessage('No hay datos que mostrar');
    Screen.Cursor:=CrDefault;
    exit;
  end;
  pprMayorAna.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\MayorAuxDet.rtm';
  pprMayorAna.template.LoadFromFile ;
  case rgTipo.ItemIndex of
  	0 :  ppLabel1.caption := 'CONTABILIZADOS';
    1 :  ppLabel1.caption := 'NO CONTABILIZADOS';
    2 :  ppLabel1.caption := 'CONTABILIZADOS Y NO CONTABILIZADOS';
  end;
  pplblCia.caption    := edtCia.text;
  ppLabel23.caption   := 'Debe '+xMonedaL;
  ppLabel24.caption   := 'Haber '+xMonedaL;
  ppLabel73.caption   := 'Debe '+xMonedaE;
  ppLabel75.caption   := 'Haber '+xMonedaE;
  pplblPerFech.Caption:= 'DEL ' + DateToStr(dbdtpFReg1.Date) + ' AL '+DateToStr(dbdtpFReg2.Date);// speAno.Text + speMM.Text;

  FSOLPrevio:=TFSOLPrevio.Create(Self);
  With FSOLPrevio Do
  Try
     ppViewer1.Report := pprMayorAna;
     pprPrevio        := pprMayorAna;
     xTextName        := DM1.wUsuario+'MayorAna';
     ShowModal;
  Finally
     Free;
  End;

//  pprMayorAna.Print;   // detallado por comprobantes contables

  pprMayorAna.stop;
//  ppDesigner1.ShowModal;

  dm1.cdsMovcnt2.IndexFieldNames:='';
  dm1.cdsQry.IndexFieldNames:='';

  //** 08/08/2001 - pjsv
  xZ := pprMayorAna.GroupCount -1;
  While xZ >= 0 Do
  begin
    pprMayorAna.Groups[xZ].Free;
    xZ := xZ - 1;
  end;
  Screen.Cursor:=CrDefault;
end;

procedure TFMAD.bbtnCancClick(Sender: TObject);
begin
 close;
end;

procedure TFMAD.pprMayorAnaPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;

end;

procedure TFMAD.pprMayorAnaStartPage(Sender: TObject);
begin
  If pprMayorAna.page = 1 then xx := 0;
end;

procedure TFMAD.CalculaSaldos;
begin
	Dm1.cdsQry.fIRST;
  while not Dm1.cdsQry.Eof do
  begin
  	XCIA  :=Dm1.CDSQRY.FIELDBYNAME('CIAID').VALUE;
    XCTA  :=Dm1.CDSQRY.FIELDBYNAME('CUENTAID').VALUE;
		//XCLAUX:=Dm1.CDSQRY.FIELDBYNAME('CLAUXID').VALUE;
		//XAUX  :=Dm1.CDSQRY.FIELDBYNAME('AUXID').VALUE;
    Dm1.CDSMOVCNT2.first;
    Dm1.CDSMOVCNT2.SetKey;
    Dm1.CDSMOVCNT2.FIELDBYNAME('CIAID').VALUE    :=Trim(XCIA);
    Dm1.CDSMOVCNT2.FIELDBYNAME('CUENTAID').VALUE :=Trim(XCTA);
		//Dm1.CDSMOVCNT2.FIELDBYNAME('CLAUXID').VALUE  :=Trim(XCLAUX);
		//Dm1.CDSMOVCNT2.FIELDBYNAME('AUXID').VALUE    :=Trim(XAUX);
    if Dm1.CDSMOVCNT2.GotoKey then
    begin
    	while not Dm1.cdsMovCNT2.Eof and
      	(Trim(xCia) = Trim(dm1.CDSMOVCNT2.FieldbyName('CiaId').AsString)) AND
        (Trim(XCTA) = Trim(dm1.CDSMOVCNT2.FIELDBYNAME('CUENTAID').AsString)) DO //and
      Begin
      	Dm1.cdsMovCNT2.Edit;
        Dm1.CDSMOVCNT2.FIELDBYNAME('CUENTAID').AsString := TRIM(Dm1.CDSMOVCNT2.FIELDBYNAME('CUENTAID').AsString);
        Dm1.CDSMOVCNT2.fieldbyname('CNTSALDMN').AsString := FloatToStrF(Dm1.CDSQRY.FIELDBYNAME('SALDMN').ASFLOAT,ffFixed,15,2);
        Dm1.CDSMOVCNT2.fieldbyname('CNTSALDME').AsString := FloatToStrF(Dm1.CDSQRY.FIELDBYNAME('SALDME').ASFLOAT,ffFixed,15,2);
        Dm1.cdsMovCNT2.Next;
      End;
    end
    else
    begin   // No tiene movimientos pero si saldo del mes anterior
    	Dm1.cdsMovCNT2.Insert;
      Dm1.cdsMovCNT2.FieldByName('CIAID').AsString   :=xCia;
      Dm1.cdsMovCNT2.FieldByName('CUENTAID').AsString:= TRIM(xCta);
//      Dm1.cdsMovCNT2.FieldByName('CLAUXID').AsString :=xClAux;
//      Dm1.cdsMovCNT2.FieldByName('AUXID').AsString   :=xAux;
      Dm1.CDSMOVCNT2.FieldByName('CTADES').AsString  :=Dm1.cdsQry.FieldByName('CTADES').AsString;
//      Dm1.CDSMOVCNT2.FieldByName('AUXDES').AsString  :=Dm1.cdsQry.FieldByName('AUXDES').AsString;
      Dm1.CDSMOVCNT2.fieldbyname('CNTSALDMN').AsString := FloatToStrF(Dm1.cdsQry.FieldByName('SALDMN').AsFloat,ffFixed,15,2);
      Dm1.CDSMOVCNT2.fieldbyname('CNTSALDME').AsString := FloatToStrF(Dm1.cdsQry.FieldByName('SALDME').AsFloat,ffFixed,15,2);
      Dm1.cdsMovCNT2.Next;
    end;
    Dm1.cdsQry.Next;
  end;
end;


procedure TFMAD.ppGroupHeaderBand1BeforePrint(Sender: TObject);
begin
 xSaldoAntMn := 0;
 xSaldoAntMe := 0;
 xx:=xx+1;      // (p.ch.)
 if (ppGroup1.Breaking) or (xx=1) then
  begin
   If dm1.cdsMovCnt2.FieldByName('CNTSALDMN').AsString = '' then
   else
   If dm1.cdsMovCnt2.FieldByName('CNTSALDME').AsString = '' then
   else
//    showmessage(dm1.cdsMovCnt2.FieldByName('CUENTAID').AsString+' - '+dm1.cdsMovCnt2.FieldByName('TDIARID').AsString);
//    If dm1.cdsMovCnt2.FieldByName('TDIARID').AsString = '' then
//      dm1.cdsMovCnt2.Delete;
  end;
end;

procedure TFMAD.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
  ppVariable15.DisplayFormat:='';
  ppVariable17.DisplayFormat:='';



   //xSaldoantMn := xSaldoantMn + ppVariable12.value;
   //xSaldoantMe := xSaldoantMe + ppVariable23.value;


   xx:=xx+1;      // (p.ch.)
   ppVariable15.DisplayFormat:='';
   ppVariable17.DisplayFormat:='';

   {
   if (ppGroup1.Breaking) or (xx=1) OR (pprMayorAna.PageCount = pprMayorAna.AbsolutePageNo )then
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
    end;
    }
  ppVariable15.DisplayFormat:='###,###,##0.00';
  ppVariable17.DisplayFormat:='###,###,##0.00';
end;

procedure TFMAD.ppDetailBand1BeforeGenerate(Sender: TObject);
begin
//    If dm1.cdsMovCnt2.FieldByName('TDIARID').AsString = '' then
//      dm1.cdsMovCnt2.Delete;
end;

procedure TFMAD.ppDetailBand1BeforePrint(Sender: TObject);
begin
//    If dm1.cdsMovCnt2.FieldByName('TDIARID').AsString = '' then
//      dm1.cdsMovCnt2.Delete;
end;

procedure TFMAD.ppVariable15Calc(Sender: TObject; var Value: Variant);
begin
   ppVariable15.Visible:=False;
   Value:=StrToFloat(StringReplace(ppDBText3.Text,',','',[rfreplaceall] ) )+ppDBCalc17.Value-ppDBCalc18.Value;
   if value>=0 then
      ppVariable15.Visible:=True;
end;

procedure TFMAD.ppVariable17Calc(Sender: TObject; var Value: Variant);
begin
//   Value:=StrToFloat(StringReplace(ppDBText4.Text,',','',[rfreplaceall] ) )+ppDBCalc19.Value-ppDBCalc20.Value;
   ppVariable17.Visible:=False;
   Value:=StrToFloat(StringReplace(ppDBText4.Text,',','',[rfreplaceall] ) )+ppDBCalc19.Value-ppDBCalc20.Value;
   if value>=0 then
      ppVariable17.Visible:=True;
end;

procedure TFMAD.ppVariable1Calc(Sender: TObject; var Value: Variant);
begin
   ppVariable1.Visible:=false;
   if StrToFloat(StringReplace(ppDBText3.Text,',','',[rfreplaceall] ) )>=0 then begin
      ppVariable1.Visible:=true;
      ppVariable1.Value  :=StrToFloat(StringReplace(ppDBText3.Text,',','',[rfreplaceall] ) );
   end;
end;

procedure TFMAD.ppVariable2Calc(Sender: TObject; var Value: Variant);
begin
   ppVariable2.Visible:=false;
   if StrToFloat(StringReplace(ppDBText3.Text,',','',[rfreplaceall] ) )<0 then begin
      ppVariable2.Visible:=true;
      ppVariable2.Value  :=StrToFloat(StringReplace(ppDBText3.Text,',','',[rfreplaceall] ) )*(-1);
   end;
end;

procedure TFMAD.ppVariable3Calc(Sender: TObject; var Value: Variant);
begin
   ppVariable3.Visible:=False;
   Value:=StrToFloat(StringReplace(ppDBText3.Text,',','',[rfreplaceall] ) )+ppDBCalc17.Value-ppDBCalc18.Value;
   if value<0 then begin
      Value:=(StrToFloat(StringReplace(ppDBText3.Text,',','',[rfreplaceall] ) )+ppDBCalc17.Value-ppDBCalc18.Value)*(-1);
      ppVariable3.Visible:=True;
   end;
end;

procedure TFMAD.ppVariable6Calc(Sender: TObject; var Value: Variant);
begin
   ppVariable6.Visible:=False;
   Value:=StrToFloat(StringReplace(ppDBText4.Text,',','',[rfreplaceall] ) )+ppDBCalc19.Value-ppDBCalc20.Value;
   if value<0 then begin
      Value:=(StrToFloat(StringReplace(ppDBText4.Text,',','',[rfreplaceall] ) )+ppDBCalc19.Value-ppDBCalc20.Value)*(-1);
      ppVariable6.Visible:=True;
   end;
end;

procedure TFMAD.ppVariable4Calc(Sender: TObject; var Value: Variant);
begin
   ppVariable4.Visible:=false;
   if StrToFloat(StringReplace(ppDBText4.Text,',','',[rfreplaceall] ) )>=0 then begin
      ppVariable4.Visible:=true;
      ppVariable4.Value  :=StrToFloat(StringReplace(ppDBText4.Text,',','',[rfreplaceall] ) );
   end;
end;

procedure TFMAD.ppVariable5Calc(Sender: TObject; var Value: Variant);
begin
   ppVariable5.Visible:=false;
   if StrToFloat(StringReplace(ppDBText4.Text,',','',[rfreplaceall] ) )<0 then begin
      ppVariable5.Visible:=true;
      ppVariable5.Value  :=StrToFloat(StringReplace(ppDBText4.Text,',','',[rfreplaceall] ) )*(-1);
   end;
end;

procedure TFMAD.ppVariable15Print(Sender: TObject);
begin
   ppVariable15.DisplayFormat:='###,###,##0.00';
end;

procedure TFMAD.ppVariable3Print(Sender: TObject);
begin
   ppVariable3.DisplayFormat:='###,###,##0.00';
end;

procedure TFMAD.pprMayorAnaSaveText(Sender: TObject; var Text: String);
const
  cDelimiter = '><';
  cCRLF = #13#10;
var
  lDevice: TppTextFileDevice;
  lsText: String;
begin

  lDevice := TppTextFileDevice(Sender);

  lsText := '';

  {describe any starting coniditions}
  if lDevice.StartingPage then
    lsText := lsText + '----Starting Page----' + cCRLF;

  if lDevice.FirstLine and lDevice.StartingLine then
    lsText := lsText + '----First Line----' + cCRLF;

  {add the text item}
  if lDevice.StartingLine then
    lsText := lsText + '<Line ' + IntToStr(lDevice.LineNo) + '><' + Text + cDelimiter

  else if lDevice.EndingLine then
    lsText := lsText + Text + '><Line ' + IntToStr(lDevice.LineNo) + ', ' + IntToStr(lDevice.LineItemNo) + ' items>' + cCRLF

  else
    lsText := lsText + Text + cDelimiter;

  {describe any ending conditions}
  if lDevice.LastLine and lDevice.EndingLine then
    lsText := lsText + '----Last Line----' + cCRLF;

  if lDevice.EndingPage then
    lsText := lsText + '----Ending Page----' + cCRLF ;

  Text := lsText;

end;

end.



