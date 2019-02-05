{ PJSV, 2002/02/08
  Solo para la apertura en CNT }

unit CNT270;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, MConnect, StdCtrls, Buttons, wwclient, Mask, wwdbedit,
  Spin, wwdblook, ComCtrls, ExtCtrls;

type
  TFApertura = class(TForm)
    Panel1: TPanel;
    lblCia: TLabel;
    Label2: TLabel;
    pnlGenera: TPanel;
    lblProc: TLabel;
    pbGenera: TProgressBar;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    speAno: TSpinEdit;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    gbAApe: TGroupBox;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    edtPeriodoAA: TEdit;
    dblcTDiarioAA: TwwDBLookupCombo;
    edtTDiarioAA: TEdit;
    dbeNoCompAA: TwwDBEdit;
    edtGlosaAA: TEdit;
    dbeLoteAA: TwwDBEdit;
    rbAAContS: TRadioButton;
    rbAAContN: TRadioButton;
    procedure FormActivate(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure speAnoExit(Sender: TObject);
    procedure dblcTDiarioAAExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    function DisplayDescrip(wPrv,wTabla,wCampos,wWhere,wResult:string):string;
  end;

var
  FApertura: TFApertura;
  SRV_D : String;
  wRepHorServi,wRepFuncDate,wFormatFecha,wReplacCeros,wRepFecServi:string;

implementation

uses CNTDM;

{$R *.DFM}

procedure TFApertura.FormActivate(Sender: TObject);
begin
   DM1.cdsCia.Open;
   DM1.cdsTdiario.Open;
   dbeLoteAA.Text := '0000';
   dbeNoCompAA.Text := '0000000001';
end;

procedure TFApertura.dblcCiaExit(Sender: TObject);
begin
     edtCia.Text := DM1.cdsCia.FieldByName('CIAABR').AsString;
     speAno.SetFocus;
end;

procedure TFApertura.speAnoExit(Sender: TObject);
begin
//   edtPeriodoAA.text :=  speAno.text + '01';
   edtPeriodoAA.text :=  speAno.text + '00';
   dblcTDiarioAA.SetFocus;
end;

procedure TFApertura.dblcTDiarioAAExit(Sender: TObject);
begin
    edtTDiarioAA.text := DM1.cdsTDiario.FieldByName('TDIARDES').AsString;
end;


procedure TFApertura.bbtnOkClick(Sender: TObject);
var
   xWhere,xTcambio,xFTCam,xAnioAnt,xSql : String;
   xMM,xDD,xTRI,xSEM,xSS,xAATRI,xAASEM,xAASS : String;
   xTMonLoc : String;
   xFEmision,xFTCambio : TDate;
   xgraba,xReg : Integer;
   xSuma : double;
   sFEcha, xSQLDocs : String;
begin
  //** 1 paso, captura data del SOLCONFIG
  Screen.Cursor := crHourGlass;
  DM1.DisplayDescrip('prvSQL','SOLCONFIG','*','','SRV_DB');
  SRV_D     := DM1.cdsqry.fieldbyname('SRV_DB').AsString;
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   begin
    wFormatFecha:='YYYY-MM-DD';
    wReplacCeros:='COALESCE';
    wRepFecServi:='CURRENT DATE';
    wRepHorServi:='CURRENT TIME';
    wRepFuncDate:= 'DATE(';
   end
  else
   if SRV_D = 'ORACLE' then
    begin
    wFormatFecha:='DD-MM-YYYY';
    wReplacCeros:='NVL';
    wRepFecServi:='SYSDATE';
    wRepHorServi:='SYSDATE';
    wRepFuncDate:= 'TO_DATE(';
   end;
  //**

  //** Paso 2, tomo el T. de Cambio al 31 del año anterior
  xAnioAnt := IntToStr(StrToInt(speAno.text) - 1);
  xFTCam := '31/12/'+xAnioAnt;
  //** 2002/06/06 - pjsv
  xFTCambio := StrToDate(xFTCam);
  sFecha := FormatDateTime(wFormatFecha,xFTCambio);
  xSql := 'SELECT TCAMVBV FROM TGE107 WHERE FECHA='+quotedstr(sFecha);
  //xSql := 'SELECT TCAMVBV FROM TGE107 WHERE FECHA='+wRepFuncDate+''''+DateToStr(xFTCambio)+''''+')';
  //**
  DM1.cdsVariable.Close;
  DM1.cdsVariable.dataRequest(xSql);
  DM1.cdsVariable.Open;
  xTcambio := DM1.cdsVariable.FieldByName('TCAMVBV').AsString;
  //**

  //** 3 paso, hallo los datos del semestre,trimestre, etc
  xFEmision := StrToDate('01/01/'+speAno.text);
  xWhere := 'Fecha='+''''+datetostr(xFEmision)+'''';
  xMM    := DM1.DisplayDescrip('PrvTGE','TGE114','FECMES,FECDIA,FECTRIM,FECSEM,FECSS,FECAATRI,FECAASEM,FECAASS',xWhere,'FECMES');
  xDD    := DM1.cdsQRY.FieldByName('FECDIA').AsString;
  xTRI   := DM1.cdsQRY.FieldByName('FECTRIM').AsString;
  xSEM   := DM1.cdsQRY.FieldByName('FECSEM').AsString;
  xSS    := DM1.cdsQRY.FieldByName('FECSS').AsString;
  xAATRI := DM1.cdsQRY.FieldByName('FECAATRI').AsString;
  xAASEM := DM1.cdsQRY.FieldByName('FECAASEM').AsString;
  xAASS  := DM1.cdsQRY.FieldByName('FECAASS').AsString;
  //**

  //** 4 paso, capturo la moneda
  xWhere   := 'TMON_LOC='+quotedstr('L');
  xTMonLoc:=DM1.DisplayDescrip('PrvTGE','TGE103','*',xWhere,'TMONID');

  //Paso 5, solo para las cuentas que no tengan ni auxiliar ni c. de costo
{ esto toma todas las cuentas puras pero no incluye las que llevan auxiliares o centro de costo
 xSql := 'Select B.ciaid,B.cuentaid,B.ctaniv,B.cta_det,B.cta_mov,B.cta_aux,'+
          'B.cta_ccos,B.cta_dest,B.cta_doc,A.* from cnt401 A,TGE202 B where'+
          ' A.ciaid='+dblcCia.value+' and (B.cta_mov=''S'' or B.cta_det = ''S'') and (B.cta_aux=''N'' and B.cta_ccos=''N'')'+
          ' and A.cuentaid = B.cuentaid and a.ciaid = b.ciaid and saldmn12 <> 0'+
          ' and a.ano='+xAnioAnt+' and a.cuentaid < ''60'''+
          ' order by a.cuentaid';
}
  // esto toma todas las cuentas pueras inclusive las que tienen auxiliares o centro de costo
 //** 2002/06/06 - PJSV
  xSQL:='select * from CNT300 '
       +'Where CIAID='''     +dblcCia.Text      +''' '
       + ' and TDIARID='''   +dblcTDiarioAA.TEXT+''' '
       + ' and CNTANOMM='''  +speAno.text+'00'  +''' '
       + ' and CNTCOMPROB='''+dbeNoCompAA.Text  +'''';
  DM1.cdsVariable.Close;
  DM1.cdsVariable.dataRequest(xSql);
  DM1.cdsVariable.Open;

  IF ( DM1.cdsVariable.FieldByName('CNTESTADO').AsString='I') or
     ( DM1.cdsVariable.Recordcount<=0 ) then
  begin
     xSQL:='delete from CNT300 '
          +'Where CIAID='''    +dblcCia.Text      +''' '
          + ' and TDIARID='''  +dblcTDiarioAA.TEXT+''' '
          + ' and CNTANOMM=''' +speAno.text+'00'  +''' '
          + ' and CNTCOMPROB='''+dbeNoCompAA.Text  +'''';
     DM1.cdsVariable.Close;
     DM1.cdsVariable.dataRequest(xSql);
     DM1.cdsVariable.Execute;

     xSQL:='delete from CNT311 '
          +'Where CIAID='''    +dblcCia.Text      +''' '
          + ' and TDIARID='''  +dblcTDiarioAA.TEXT+''' '
          + ' and CNTANOMM=''' +speAno.text+'00'  +''' '
          + ' and CNTCOMPROB='''+dbeNoCompAA.Text  +'''';
     DM1.cdsVariable.Close;
     DM1.cdsVariable.dataRequest(xSql);
     DM1.cdsVariable.Execute;
  end
  else
  begin
     Screen.Cursor := crDefault;
     ShowMessage( 'Asiento ya Fue Contabilizado' );
     Exit;
  end;


  xSQLDocs:=
      'SELECT A.CIAID, A.CUENTAID, A.CLAUXID, A.AUXID, A.CCOSID, A.DOCID, '
     +  'A.CNTSERIE, A.CNTNODOC, A.TMONID, '
     +  'SUM(NVL(CNTDEBEMN,0)) CNTDEBEMN,   SUM(NVL(CNTHABEMN,0)) CNTHABEMN, '
     +  'SUM(NVL(CNTDEBEME,0)) CNTDEBEME,   SUM(NVL(CNTHABEME,0)) CNTHABEME '
     +'FROM '
     +  '( '
     +    'SELECT A.CIAID, A.CUENTAID, A.CLAUXID, A.AUXID, A.CCOSID, A.DOCID, '
     +      'A.CNTSERIE, A.CNTNODOC, A.TMONID, '
     +      'CNTDEBEMN, CNTHABEMN, CNTDEBEME, CNTHABEME '
     +    'FROM CNT301 A, TGE202 B '
     +    'WHERE A.CIAID='''+dblcCia.Text+''' '
     +      'AND A.CNTANOMM>='''+xAnioAnt+'00'' AND A.CNTANOMM<='''+xAnioAnt+'12'' '
     +      'AND A.CUENTAID<''60'' AND A.CNTESTADO=''P'' AND A.CNTCUADRE=''S'' '
     +      'AND A.CIAID=B.CIAID AND A.CUENTAID= B.CUENTAID AND B.CTA_DOC=''S'' '
     +      'AND ( B.CTA_AUX=''S'' OR B.CTA_CCOS=''S'' ) '
     +  ') A '
     +'GROUP BY A.CIAID, A.CUENTAID, A.CLAUXID, A.AUXID, A.CCOSID, A.DOCID, A.CNTSERIE, A.CNTNODOC, A.TMONID '
     +'HAVING SUM( NVL(CNTDEBEMN,0) )<>SUM( NVL(CNTHABEMN,0) ) ';

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
     xSql:='Select B.ciaid, B.cuentaid, B.ctaniv, B.cta_det, B.cta_mov, B.cta_aux, '+
          ' B.cta_ccos, B.cta_dest, B.cta_doc, A.* From cnt401 A, TGE202 B'+
          ' where A.ciaid='+ QUOTEDSTR(dblcCia.value) +' and ( B.cta_mov=''S'' or B.cta_det = ''S'') AND '+
          '   (  '+
          '     (COALESCE(B.CTA_AUX, ''N'')=''S'' AND COALESCE(A.AUXID, '' '')<>'' '' ) or '+
          '     ( COALESCE(B.CTA_CCOS,''N'')=''S'' AND COALESCE(A.CCOSID,'' '')<>'' '' ) or '+
          '     ( COALESCE(B.CTA_AUX, ''N'')=''N'' AND COALESCE(A.AUXID, '' '')= '' ''  and '+
          '       COALESCE(B.CTA_CCOS,''N'')=''N'' AND COALESCE(A.CCOSID,'' '')= '' '' ) '   +
          '   ) '+
          ' and A.cuentaid = B.cuentaid and a.ciaid = b.ciaid and saldmn12 <> 0'+
          ' and a.ano='+ QUOTEDSTR(xAnioAnt) +' and a.cuentaid < ''60'''+
          'Order By A.CUENTAID, A.CLAUXID, A.AUXID, A.CCOSID';

  if SRV_D = 'ORACLE' then
     xSql:='Select B.CIAID, B.CUENTAID, B.CTANIV, B.CTA_DET, B.CTA_MOV, B.CTA_AUX, '
          +  'B.cta_ccos, B.cta_dest, B.cta_doc, A.*, C.* '
          +'From CNT401 A, TGE202 B, '
          +  '( '+xSQLDocs+' ) C '
          +'where A.CIAID='+QUOTEDSTR(dblcCia.value)+' and ( B.CTA_MOV=''S'' or B.CTA_DET=''S'') AND '
          +  '( '
          +    '( NVL(B.CTA_AUX, ''N'')=''S'' AND NVL(A.AUXID, '' '')<>'' '' ) or '
          +    '( NVL(B.CTA_CCOS,''N'')=''S'' AND NVL(A.CCOSID,'' '')<>'' '' ) or '
          +    '( NVL(B.CTA_AUX, ''N'')=''N'' AND NVL(A.AUXID, '' '')= '' '' and '
          +      'NVL(B.CTA_CCOS,''N'')=''N'' AND NVL(A.CCOSID,'' '')= '' '' ) '
          +  ') '
          +  'and A.cuentaid=B.cuentaid and A.ciaid=B.ciaid and saldmn12<>0 '
          +  'and A.ano='+QuotedStr(xAnioAnt)+' and A.cuentaid<''60'' '

          +  'and A.CIAID=C.CIAID(+) AND A.CUENTAID=C.CUENTAID(+) AND A.CLAUXID=C.CLAUXID(+) '
          +  'and A.AUXID=C.AUXID(+) AND nvl(A.CCOSID,'' '')=nvl(C.CCOSID(+),'' '') '

          +'Order By A.CUENTAID, A.CLAUXID, A.AUXID, A.CCOSID';

 //**
  DM1.cdsVariable.Close;
  DM1.cdsVariable.dataRequest(xSql);
  DM1.cdsVariable.Open;
  DM1.cdsVariable.First;
  xReg := 0;
  xgraba := 1;

  xSQL:='select * from CNT311 '
       +'Where CIAID='''     +dblcCia.Text      +''' '
       + ' and TDIARID='''   +dblcTDiarioAA.TEXT+''' '
       + ' and CNTANOMM='''  +speAno.text+'00'  +''' '
       + ' and CNTCOMPROB='''+dbeNoCompAA.Text  +'''';
  DM1.cdsCNT311.Close;
  DM1.cdsCNT311.Datarequest( xSQL );
  DM1.cdsCNT311.open;
  while not DM1.cdsVariable.Eof do
  begin
    DM1.cdsCNT311.Insert;
    DM1.cdsCNT311.FieldByName('CIAID').AsString      := dblcCia.value;
    DM1.cdsCNT311.FieldByName('TDIARID').AsString    := dblcTDiarioAA.Value;
    DM1.cdsCNT311.FieldByName('CNTCOMPROB').AsString := dbeNoCompAA.Text;  // '0000000001';
    DM1.cdsCNT311.FieldByName('CNTANO').AsString     := speAno.text;
    DM1.cdsCNT311.FieldByName('CNTANOMM').AsString   := speAno.text + '00';
    DM1.cdsCNT311.FieldByName('CNTLOTE').AsString    := dbeLoteAA.Text;  // '0000';
    DM1.cdsCNT311.FieldByName('CUENTAID').AsString   := DM1.cdsVariable.FieldByName('CUENTAID').AsString;
    DM1.cdsCNT311.FieldByName('CLAUXID').AsString    := DM1.cdsVariable.FieldByName('CLAUXID').AsString;
    DM1.cdsCNT311.FieldByName('AUXID').AsString      := DM1.cdsVariable.FieldByName('AUXID').AsString;
    If ( DM1.cdsVariable.FieldByName('CTA_DOC').AsString = 'S' ) and
       ( ( DM1.cdsVariable.FieldByName('CNTDEBEMN').AsFloat>0 ) or
         ( DM1.cdsVariable.FieldByName('CNTHABEMN').AsFloat>0 ) ) then
    Begin
       //Documento Id
       if DM1.cdsVariable.FieldByName('DOCID').AsString='' then
          DM1.cdsCNT311.FieldByName('DOCID').AsString:= '23'
       else
          DM1.cdsCNT311.FieldByName('DOCID').AsString:= DM1.cdsVariable.FieldByName('DOCID').AsString;

       //Serie
       if DM1.cdsVariable.FieldByName('CNTSERIE').AsString='' then
          DM1.cdsCNT311.FieldByName('CNTSERIE').AsString:='000'
       else
          DM1.cdsCNT311.FieldByName('CNTSERIE').AsString:=DM1.cdsVariable.FieldByName('CNTSERIE').AsString;

       //Numero
       if DM1.cdsVariable.FieldByName('CNTNODOC').AsString='' then
          DM1.cdsCNT311.FieldByName('CNTNODOC').AsString  := '0000000001'
       else
          DM1.cdsCNT311.FieldByName('CNTNODOC').AsString  := DM1.cdsVariable.FieldByName('CNTNODOC').AsString;

       DM1.cdsCNT311.FieldByName('CNTFEMIS').AsDateTime := StrToDate('01/01/'+speAno.text);
       DM1.cdsCNT311.FieldByName('CNTFVCMTO').AsDateTime:= StrToDate('01/01/'+speAno.text);
       DM1.cdsCNT311.FieldByName('CNTFCOMP').AsDateTime := StrToDate('01/01/'+speAno.text);
       {
       DM1.cdsCNT311.FieldByName('CNTFEMIS').AsDateTime := DM1.cdsCNT311.FieldByName('CNTFEMIS').AsDateTime;
       DM1.cdsCNT311.FieldByName('CNTFVCMTO').AsDateTime:= DM1.cdsCNT311.FieldByName('CNTFVCMTO').AsDateTime;
       DM1.cdsCNT311.FieldByName('CNTFCOMP').AsDateTime := DM1.cdsCNT311.FieldByName('CNTFCOMP').AsDateTime;
       }
       if DM1.cdsVariable.FieldByName('CNTDEBEMN').AsFloat>DM1.cdsVariable.FieldByName('CNTHABEMN').AsFloat then
       begin
          DM1.cdsCNT311.FieldByName('CNTDH').AsString   := 'D';
          DM1.cdsCNT311.FieldByName('CNTMTOORI').AsFloat:=DM1.cdsVariable.FieldByName('CNTDEBEMN').AsFloat-DM1.cdsVariable.FieldByName('CNTHABEMN').AsFloat;
          DM1.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat:=DM1.cdsVariable.FieldByName('CNTDEBEMN').AsFloat-DM1.cdsVariable.FieldByName('CNTHABEMN').AsFloat;
          DM1.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat:=( DM1.cdsVariable.FieldByName('CNTDEBEMN').AsFloat-DM1.cdsVariable.FieldByName('CNTHABEMN').AsFloat ) / StrToFloat(xTcambio);
          DM1.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat:=DM1.cdsVariable.FieldByName('CNTDEBEMN').AsFloat-DM1.cdsVariable.FieldByName('CNTHABEMN').AsFloat;
          DM1.cdsCNT311.FieldByName('CNTDEBEME').Asfloat:=( DM1.cdsVariable.FieldByName('CNTDEBEMN').AsFloat-DM1.cdsVariable.FieldByName('CNTHABEMN').AsFloat ) / StrToFloat(xTCambio);
       end
       else begin
          DM1.cdsCNT311.FieldByName('CNTDH').AsString   := 'H';
          DM1.cdsCNT311.FieldByName('CNTMTOORI').AsFloat:=DM1.cdsVariable.FieldByName('CNTHABEMN').AsFloat-DM1.cdsVariable.FieldByName('CNTDEBEMN').AsFloat;
          DM1.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat:=DM1.cdsVariable.FieldByName('CNTHABEMN').AsFloat-DM1.cdsVariable.FieldByName('CNTDEBEMN').AsFloat;
          DM1.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat:=( DM1.cdsVariable.FieldByName('CNTHABEMN').AsFloat-DM1.cdsVariable.FieldByName('CNTDEBEMN').AsFloat ) / StrToFloat(xTcambio);
          DM1.cdsCNT311.FieldByName('CNTHABEMN').AsFloat:=DM1.cdsVariable.FieldByName('CNTHABEMN').AsFloat-DM1.cdsVariable.FieldByName('CNTDEBEMN').AsFloat;
          DM1.cdsCNT311.FieldByName('CNTHABEME').Asfloat:=( DM1.cdsVariable.FieldByName('CNTHABEMN').AsFloat-DM1.cdsVariable.FieldByName('CNTDEBEMN').AsFloat ) / StrToFloat(xTCambio);
       end;

    end
    else begin

       DM1.cdsCNT311.FieldByName('DOCID').AsString      := '';
       DM1.cdsCNT311.FieldByName('CNTSERIE').AsString   := '';
       DM1.cdsCNT311.FieldByName('CNTNODOC').AsString   := '';

       DM1.cdsCNT311.FieldByName('CNTFEMIS').AsDateTime := StrToDate('01/01/'+speAno.text);
       DM1.cdsCNT311.FieldByName('CNTFVCMTO').AsDateTime:= StrToDate('01/01/'+speAno.text);
       DM1.cdsCNT311.FieldByName('CNTFCOMP').AsDateTime := StrToDate('01/01/'+speAno.text);

       if DM1.cdsVariable.FieldByName('SALDMN12').AsFloat>0 then
          DM1.cdsCNT311.FieldByName('CNTDH').AsString   := 'D'
       else
          DM1.cdsCNT311.FieldByName('CNTDH').AsString   := 'H';

       If DM1.cdsVariable.FieldByName('SALDMN13').AsFloat<0  then
          DM1.cdsCNT311.FieldByName('CNTMTOORI').AsFloat:=(-1)*(DM1.cdsVariable.FieldByName('SALDMN13').AsFloat)
       else
          DM1.cdsCNT311.FieldByName('CNTMTOORI').AsFloat:=DM1.cdsVariable.FieldByName('SALDMN13').AsFloat;

       If DM1.cdsVariable.FieldByName('SALDMN13').AsFloat< 0 then
          DM1.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat:=(-1)*DM1.cdsVariable.FieldByName('SALDMN13').AsFloat
       else
          DM1.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat:=DM1.cdsVariable.FieldByName('SALDMN13').AsFloat;

       If DM1.cdsVariable.FieldByName('SALDMN13').AsFloat < 0 then
          DM1.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat:=(-1)*(DM1.cdsVariable.FieldByName('SALDMN13').AsFloat)/ StrToFloat(xTcambio) //cdsVariable.FieldByName('SALDME12').AsFloat;
       else
          DM1.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat:=DM1.cdsVariable.FieldByName('SALDMN13').AsFloat / StrToFloat(xTcambio); //cdsVariable.FieldByName('SALDME12').AsFloat;

       If DM1.cdsVariable.FieldByName('SALDMN13').AsFloat > 0 then
       begin
          DM1.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat  := DM1.cdsVariable.FieldByName('SALDMN13').AsFloat;
          DM1.cdsCNT311.FieldByName('CNTDEBEME').Asfloat  := DM1.cdsVariable.FieldByName('SALDMN13').AsFloat / StrToFloat(xTCambio);
       end
       else begin
          DM1.cdsCNT311.FieldByName('CNTHABEMN').AsFloat  := (-1)*DM1.cdsVariable.FieldByName('SALDMN13').AsFloat;
          DM1.cdsCNT311.FieldByName('CNTHABEME').AsFloat  := (-1)*(DM1.cdsVariable.FieldByName('SALDMN13').AsFloat)  / StrToFloat(xTCambio);
       end;
    end;

    DM1.cdsCNT311.FieldByName('CNTGLOSA').AsString    := edtGlosaAA.text;

    DM1.cdsCNT311.FieldByName('CCOSID').AsString      := DM1.cdsVariable.FieldByName('CCOSID').AsString;;
    DM1.cdsCNT311.FieldByName('CNTTCAMBIO').AsString  := xTcambio;

    DM1.cdsCNT311.FieldByName('CNTESTADO').AsString   := 'I';
    DM1.cdsCNT311.FieldByName('CNTCUADRE').Clear;
    DM1.cdsCNT311.FieldByName('CNTFAUTOM').Clear;
    DM1.cdsCNT311.FieldByName('CNTUSER').AsString     := DM1.wUsuario;
    DM1.cdsCNT311.FieldByName('CNTFREG').AsDateTime   := date;
    DM1.cdsCNT311.FieldByName('CNTHREG').AsDateTime   := time;
    DM1.cdsCNT311.FieldByName('CNTMM').AsString       := xMM;
    DM1.cdsCNT311.FieldByName('CNTDD').AsString       := xDD;
    DM1.cdsCNT311.FieldByName('CNTTRI').AsString      := xTRI;
    DM1.cdsCNT311.FieldByName('CNTSEM').AsString      := xSEM;
    DM1.cdsCNT311.FieldByName('CNTSS').AsString       := xSS;
    DM1.cdsCNT311.FieldByName('CNTAATRI').AsString    := xAATRI;
    DM1.cdsCNT311.FieldByName('CNTAASEM').AsString    := xAASEM;
    DM1.cdsCNT311.FieldByName('CNTAASS').AsString     := xAASS;
    DM1.cdsCNT311.FieldByName('TMONID').AsString      := xTMonLoc;
    DM1.cdsCNT311.FieldByName('FLAGVAR').Clear;
    DM1.cdsCNT311.FieldByName('FCONS').Clear;
    DM1.cdsCNT311.FieldByName('CNTFMEC').Clear;
    DM1.cdsCNT311.FieldByName('TDIARDES').AsString    := edtTDiarioAA.text;
    xWhere := 'CIAID='+quotedstr(dblcCia.value)+' AND CUENTAID='+quotedstr(DM1.cdsVariable.FieldByName('CUENTAID').AsString);
    DM1.cdsCNT311.FieldByName('CTADES').AsString      :=  DisplayDescrip('prvTGE','TGE202','CTADES',xWhere,'CTADES');
    DM1.cdsCNT311.FieldByName('AUXDES').Clear;
    xWhere := 'CCOSID='+quotedstr(DM1.cdsVariable.FieldByName('CCOSID').AsString);
    DM1.cdsCNT311.FieldByName('CCOSDES').AsString      := DisplayDescrip('prvTGE','TGE203','CCOSDES',xWhere,'CCOSDES');

    if DM1.cdsVariable.FieldByName('CTA_DOC').AsString = 'S' then
       DM1.cdsCNT311.FieldByName('DOCDES').AsString      :=  DisplayDescrip('prvTGE','TGE110','DOCDES','DOCID='+quotedstr('23'),'DOCDES')
    else
     DM1.cdsCNT311.FieldByName('DOCDES').Clear;

    DM1.cdsCNT311.FieldByName('CNTSALDMN').Clear;
    DM1.cdsCNT311.FieldByName('CNTSALDME').Clear;
    DM1.cdsCNT311.FieldByName('CAMPOVAR').Clear;
    DM1.cdsCNT311.FieldByName('CNTTS').AsString     := 'BV';
    DM1.cdsCNT311.FieldByName('CNTPAGADO').Clear;
    DM1.cdsCNT311.FieldByName('CNTMODDOC').AsString  := 'CNT';
    xReg := xReg +1;
    DM1.cdsCNT311.FieldByName('CNTREG').AsFloat    := xReg;
    DM1.cdsCNT311.FieldByName('MODULO').AsString    := 'CNT';
    if DM1.cdsCNT311.FieldByName('CNTMTOORI').AsFloat<>0 then
       xgraba := xgraba + 1
    else begin
       DM1.cdsCNT311.Delete;
       xReg:=xReg-1;
    end;

    If xGraba = 1000 then
     begin
      If DM1.cdsCNT311.ApplyUpdates(0) > 0 then Showmessage('No Actualizo Cuenta');
      xGraba := 0;
     end;
    DM1.cdsVariable.Next;
   end;
  If DM1.cdsCNT311.ChangeCount > 0 then
   If DM1.cdsCNT311.ApplyUpdates(0) > 0 then Showmessage('No Actualizo Cuenta');


  // Genera Cabecera de Contabilidad
  //** 2002/06/06 - PJSV
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
   xSQL:='INSERT INTO CNT300 '+
         '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, '+
         ' CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, '+
         ' CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, '+
         ' CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, '+
         ' TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '+
         ' CNTTS, DOCMOD ) '+
         ' SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,A.CNTGLOSA,'+
         ' A.CNTTCAMBIO,A.CNTFCOMP,A.CNTESTADO,A.CNTCUADRE,'+quotedstr('SACSA')+','+wRepFecServi+','+wRepHorServi+','+
         ' A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, '+
         ' A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, A.FLAGVAR, '+
         ' A.TDIARDES,'+
         ' CASE WHEN SUM(A.CNTDEBEMN) > 0 THEN SUM(A.CNTDEBEMN)* -1 ELSE SUM(A.CNTDEBEMN) END,'+
         ' CASE WHEN SUM(A.CNTDEBEME) > 0 THEN SUM(A.CNTDEBEME)* -1 ELSE SUM(A.CNTDEBEME) END,'+
         ' CASE WHEN SUM(A.CNTHABEMN) > 0 THEN SUM(A.CNTHABEMN)* -1 ELSE SUM(A.CNTHABEMN) END,'+
         ' CASE WHEN SUM(A.CNTHABEME) > 0 THEN SUM(A.CNTHABEME)* -1 ELSE SUM(A.CNTHABEME) END,'+
         ' A.CNTTS, A.CNTMODDOC '+
         ' FROM CNT311 A '+
         ' WHERE A.CIAID='  +quotedstr(dblcCia.value)+' AND '+
         ' A.TDIARID='   + quotedstr(dblcTDiarioAA.Value)+' AND '+
         ' A.CNTANOMM='  + quotedstr(speAno.text)+'||'+quotedstr('00')+' AND '+
//         ' A.CNTANOMM='  + quotedstr(speAno.text)+'||'+quotedstr('01')+' AND '+
         ' A.CNTCOMPROB='+ quotedstr(dbeNoCompAA.Text)+
         ' GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,A.CNTGLOSA,A.CNTTCAMBIO,'+
         ' A.CNTFCOMP,A.CNTESTADO,A.CNTCUADRE,'+
         ' A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI,  '+
         ' A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, '+
         ' A.TDIARDES,A.FLAGVAR,A.CNTTS, A.CNTMODDOC' ;

  if SRV_D = 'ORACLE' then
   xSQL:='INSERT INTO CNT300 '+
         '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, '+
         ' CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, '+
         ' CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, '+
         ' CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, '+
         ' TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '+
         ' CNTTS, DOCMOD ) '+
         ' SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,A.CNTGLOSA,'+
         ' A.CNTTCAMBIO,A.CNTFCOMP,A.CNTESTADO,A.CNTCUADRE,'+quotedstr('SACSA')+','+wRepFecServi+','+wRepHorServi+','+
         ' A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, '+
         ' A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, A.FLAGVAR, '+
         ' A.TDIARDES,'+
         ' decode(greatest(SUM(A.CNTDEBEMN),0),0,SUM(A.CNTDEBEMN)* -1,SUM(A.CNTDEBEMN)),'+
         ' decode(greatest(SUM(A.CNTDEBEME),0),0,SUM(A.CNTDEBEME)* -1,SUM(A.CNTDEBEME)),'+
         ' decode(greatest(SUM(A.CNTHABEMN),0),0,SUM(A.CNTHABEMN)* -1,SUM(A.CNTHABEMN)),'+
         ' decode(greatest(SUM(A.CNTHABEME),0),0,SUM(A.CNTHABEME)* -1,SUM(A.CNTHABEME)), '+
         ' A.CNTTS, A.CNTMODDOC '+
         ' FROM CNT311 A '+
         ' WHERE A.CIAID='  +quotedstr(dblcCia.value)+' AND '+
         ' A.TDIARID='   + quotedstr(dblcTDiarioAA.Value)+' AND '+
//         ' A.CNTANOMM='  + quotedstr(speAno.text)+'||'+quotedstr('01')+' AND '+
         ' A.CNTANOMM='  + quotedstr(speAno.text)+'||'+quotedstr('00')+' AND '+
         ' A.CNTCOMPROB='+ quotedstr(dbeNoCompAA.Text)+
         ' GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,A.CNTGLOSA,A.CNTTCAMBIO,'+
         ' A.CNTFCOMP,A.CNTESTADO,A.CNTCUADRE,'+
         ' A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI,  '+
         ' A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, '+
         ' A.TDIARDES,A.FLAGVAR,A.CNTTS, A.CNTMODDOC' ;
   //**
     try
       DM1.DCOM1.AppServer.EjecutaSQL(xSQL) ;
     except
     end ;

      //** calculo la cuenta 591
      xSql := 'Select sum(cntdebemn) - sum(cnthabemn) DIFE from cnt300 where '+
        ' CIAID='  +quotedstr(dblcCia.value)+' AND '+
        ' TDIARID='   + quotedstr(dblcTDiarioAA.Value)+' AND '+
//        ' CNTANOMM='  + quotedstr(speAno.text)+'||'+quotedstr('01')+' AND '+
        ' CNTANOMM='  + quotedstr(speAno.text)+'||'+quotedstr('00')+' AND '+
        ' CNTCOMPROB='+ quotedstr(dbeNoCompAA.Text);
      DM1.cdsVariable.Close;
      DM1.cdsVariable.dataRequest(xSql);
      DM1.cdsVariable.Open;
      DM1.cdsVariable.First;
      xSuma := DM1.cdsVariable.FieldByName('DIFE').AsFloat;

      DM1.cdsCNT311.Insert;
      DM1.cdsCNT311.FieldByName('CIAID').AsString      := dblcCia.value;
      DM1.cdsCNT311.FieldByName('TDIARID').AsString    := dblcTDiarioAA.Value;
      DM1.cdsCNT311.FieldByName('CNTCOMPROB').AsString := dbeNoCompAA.Text; //000000001';
      DM1.cdsCNT311.FieldByName('CNTANO').AsString     := speAno.text;
//      DM1.cdsCNT311.FieldByName('CNTANOMM').AsString   := speAno.text + '01';
      DM1.cdsCNT311.FieldByName('CNTANOMM').AsString   := speAno.text + '00';
      DM1.cdsCNT311.FieldByName('CNTLOTE').AsString    := '0000';
      DM1.cdsCNT311.FieldByName('CUENTAID').AsString   := '591';
      DM1.cdsCNT311.FieldByName('CLAUXID').AsString    := '';
      DM1.cdsCNT311.FieldByName('AUXID').AsString      := '';
      DM1.cdsCNT311.FieldByName('DOCID').AsString     := '23';
      DM1.cdsCNT311.FieldByName('CNTSERIE').AsString    := '000';
      DM1.cdsCNT311.FieldByName('CNTNODOC').AsString    := '0000000001';
      DM1.cdsCNT311.FieldByName('CNTGLOSA').AsString    := edtGlosaAA.text;
      // aca es contrario a los otros procesos
      If xSuma > 0 then
      DM1.cdsCNT311.FieldByName('CNTDH').AsString       := 'H'
      else
      DM1.cdsCNT311.FieldByName('CNTDH').AsString       := 'D';

      DM1.cdsCNT311.FieldByName('CCOSID').AsString      := '';
      DM1.cdsCNT311.FieldByName('CNTTCAMBIO').AsString   := xTcambio;

      If xSuma < 0  then
       DM1.cdsCNT311.FieldByName('CNTMTOORI').AsFloat   := (-1)*(xSuma)
      else
       DM1.cdsCNT311.FieldByName('CNTMTOORI').AsFloat   := xSuma;
      If xSuma < 0 then
       DM1.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat   := (-1)*xSuma
      else
       DM1.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat   := xSuma;
      If xSuma < 0 then
       DM1.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat   := (-1)* (xSuma / StrToFloat(xTcambio))
      else
       DM1.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat   := (xSuma / StrToFloat(xTcambio));

      DM1.cdsCNT311.FieldByName('CNTFEMIS').AsDateTime  := StrToDate('01/01/'+speAno.text);
      DM1.cdsCNT311.FieldByName('CNTFVCMTO').AsDateTime := StrToDate('01/01/'+speAno.text);
      DM1.cdsCNT311.FieldByName('CNTFCOMP').AsDateTime  := StrToDate('01/01/'+speAno.text);
      DM1.cdsCNT311.FieldByName('CNTESTADO').AsString   := 'I';
      DM1.cdsCNT311.FieldByName('CNTCUADRE').Clear;
      DM1.cdsCNT311.FieldByName('CNTFAUTOM').Clear;
      DM1.cdsCNT311.FieldByName('CNTUSER').AsString     := DM1.wUsuario;
      DM1.cdsCNT311.FieldByName('CNTFREG').AsDateTime   := date;
      DM1.cdsCNT311.FieldByName('CNTHREG').AsDateTime   := time;
      DM1.cdsCNT311.FieldByName('CNTMM').AsString       := xMM;
      DM1.cdsCNT311.FieldByName('CNTDD').AsString       := xDD;
      DM1.cdsCNT311.FieldByName('CNTTRI').AsString      := xTRI;
      DM1.cdsCNT311.FieldByName('CNTSEM').AsString      := xSEM;
      DM1.cdsCNT311.FieldByName('CNTSS').AsString       := xSS;
      DM1.cdsCNT311.FieldByName('CNTAATRI').AsString    := xAATRI;
      DM1.cdsCNT311.FieldByName('CNTAASEM').AsString    := xAASEM;
      DM1.cdsCNT311.FieldByName('CNTAASS').AsString     := xAASS;
      DM1.cdsCNT311.FieldByName('TMONID').AsString      := xTMonLoc;
      DM1.cdsCNT311.FieldByName('FLAGVAR').Clear;
      DM1.cdsCNT311.FieldByName('FCONS').Clear;
      DM1.cdsCNT311.FieldByName('CNTFMEC').Clear;
      DM1.cdsCNT311.FieldByName('TDIARDES').AsString    := edtTDiarioAA.text;
      xWhere := 'CIAID='+quotedstr(dblcCia.value)+' AND CUENTAID='+quotedstr('598');
      DM1.cdsCNT311.FieldByName('CTADES').AsString      :=  DisplayDescrip('prvTGE','TGE202','CTADES',xWhere,'CTADES');
      DM1.cdsCNT311.FieldByName('AUXDES').Clear;
      DM1.cdsCNT311.FieldByName('CCOSDES').Clear;
      DM1.cdsCNT311.FieldByName('DOCDES').AsString      :=  DisplayDescrip('prvTGE','TGE110','DOCDES','DOCID='+quotedstr('23'),'DOCDES');
      // aca es contrario a los otros procesos
      If xSuma > 0 then
       begin
        DM1.cdsCNT311.FieldByName('CNTHABEMN').AsFloat  := xSuma;
        DM1.cdsCNT311.FieldByName('CNTHABEME').Asfloat  := xSuma / StrToFloat(xTCambio);
       end
      else
       begin
        DM1.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat  := (-1)*xSuma;
        DM1.cdsCNT311.FieldByName('CNTDEBEME').AsFloat  := (-1)*(xSuma / StrToFloat(xTCambio));
       end;
      DM1.cdsCNT311.FieldByName('CNTSALDMN').AsString := '';
      DM1.cdsCNT311.FieldByName('CNTSALDME').AsString := '';
      DM1.cdsCNT311.FieldByName('CAMPOVAR').AsString  := '';
      DM1.cdsCNT311.FieldByName('CNTTS').AsString     := 'BV';
      DM1.cdsCNT311.FieldByName('CNTPAGADO').AsString := '';
      DM1.cdsCNT311.FieldByName('CNTMODDOC').AsString  := 'CNT';
      xReg := xReg +1;
      DM1.cdsCNT311.FieldByName('CNTREG').AsFloat    := xReg;
      DM1.cdsCNT311.FieldByName('MODULO').AsString    := 'CNT';
      If DM1.cdsCNT311.ApplyUpdates(0) > 0 then Showmessage('No Actualizo 591');

   // actualizo nuevamente la cabecera con la diferencia
    xSql := 'Select * from cnt300 where '+
            ' CIAID='  +quotedstr(dblcCia.value)+' AND '+
            ' TDIARID='   + quotedstr(dblcTDiarioAA.Value)+' AND '+
//            ' CNTANOMM='  + quotedstr(speAno.text)+'||'+quotedstr('01')+' AND '+
            ' CNTANOMM='  + quotedstr(speAno.text)+'||'+quotedstr('00')+' AND '+
            ' CNTCOMPROB='+ quotedstr(dbeNoCompAA.Text);
    DM1.cdsVariable.Close;
    DM1.cdsVariable.dataRequest(xSql);
    DM1.cdsVariable.Open;
    // aca es contrario a los otros procesos
    If xSuma > 0 then
     begin
      xSql := 'UPDATE CNT300 SET '+
              ' CNTHABEMN = '+FloatToStr(DM1.cdsVariable.FieldByName('CNTHABEMN').AsFloat + xSuma)+','+
              ' CNTHABEME = '+FloatToStr(DM1.cdsVariable.FieldByName('CNTHABEME').AsFloat + (xSuma / StrToFloat(xTCambio)));
     end
    else
     begin
      xSql := 'UPDATE CNT300 SET '+
              ' CNTDEBEMN ='+FloatToStr(DM1.cdsVariable.FieldByName('CNTDEBEMN').AsFloat + (xSuma * -1))+' ,'+
              ' CNTDEBEME ='+FloatToStr(DM1.cdsVariable.FieldByName('CNTDEBEME').AsFloat + ((xSuma / StrToFloat(xTCambio)) * -1) );
     end;

     try
      xSql := xSql + ' WHERE '+
              ' CIAID='  +quotedstr(dblcCia.value)+' AND '+
              ' TDIARID='   + quotedstr(dblcTDiarioAA.Value)+' AND '+
//              ' CNTANOMM='  + quotedstr(speAno.text)+'||'+quotedstr('01')+' AND '+
              ' CNTANOMM='  + quotedstr(speAno.text)+'||'+quotedstr('00')+' AND '+
              ' CNTCOMPROB='+ quotedstr(dbeNoCompAA.Text);
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL) ;
     except
     end ;


  Screen.Cursor := crDefault;
  Showmessage(' Termino el Proceso de Apertura para la Cia.:'+edtCia.text  );
end;

function TFApertura.DisplayDescrip(wPrv,wTabla,wCampos,wWhere,wResult:string):string;
var
   xSQL : string;
begin
   xSQL := '';
   xSQL := 'select '+wCampos+' from '+wTabla;
   if length(wWhere) > 0 then xSQL := xSQL+' where '+wWhere;
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest( xSQL );
   DM1.cdsQry.Open;
   result:=DM1.cdsQry.FieldByName(wResult).Asstring;
end;


procedure TFApertura.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;

end;

end.
