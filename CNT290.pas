unit CNT290;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls,
  StrContainer, wwdblook, Mask;

type
  TFTelecredito = class(TForm)
    pnlCab: TPanel;
    Label1: TLabel;
    bbtnImportar: TBitBtn;
    bbtnFiltrar: TBitBtn;
    dbgCab: TwwDBGrid;
    odFile: TOpenDialog;
    scFile: TStrContainer;
    dbgDet: TwwDBGrid;
    Label3: TLabel;
    bbtnAsiDes: TBitBtn;
    bbtnAsiDoc: TBitBtn;
    pnlImporta: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    bbtnTransf: TBitBtn;
    BitBtn2: TBitBtn;
    meFile: TMaskEdit;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    procedure bbtnImportarClick(Sender: TObject);
    procedure bbtnFiltrarClick(Sender: TObject);
    procedure dbgCabRowChanged(Sender: TObject);
    procedure bbtnAsiDesClick(Sender: TObject);
    procedure bbtnTransfClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnAsiDocClick(Sender: TObject);
  private
    { Private declarations }
    Function BuscaDato( Dato : String; n : Integer ) : String;
    Function BuscaDOC( Dato : String ) : String;
    Function BuscaNum( Dato : String ) : String;
    Function BuscaEstado( Dato : String ) : String;
    Function BuscaMoneda( Dato : String ) : String;
  public
    { Public declarations }
  end;

  procedure CNTelecredito; stdcall;

exports
  CNTelecredito;

var
  FTelecredito: TFTelecredito;

implementation

uses CNTDM;

{$R *.dfm}


procedure CNTelecredito;
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   try
      FTelecredito:=TFTelecredito.Create( Application );
      FTelecredito.ShowModal;
   Finally
      FTelecredito.Free;
   End;
end;


procedure TFTelecredito.bbtnImportarClick(Sender: TObject);
begin
   if not odFile.Execute then Exit;

   pnlImporta.Visible:=True;
   pnlCab.Enabled:=False;
   bbtnTransf.Enabled:=True;
   meFile.Text:=odFile.FileName;

   TRY
      scFile.Lines.LoadFromFile( odFile.FileName );
   EXCEPT
      ShowMessage('Error al Leer el Archivo. Avise a Sistemas');
      Exit;
   END;
end;


Function TFTelecredito.BuscaDato( Dato : String; n : Integer ) : String;
var
   cTexto : String;
   c1, c2, c3, c4, c5, c6, c7, c8 : String;
   f1, f2, f3, f4, f5, f6, f7, f8 : Integer;
begin
   cTexto := Copy(Dato,2,Length(Dato));
   f1:=pos('";',cTexto)-1;
   c1:=Copy(cTexto,1,f1);

   cTexto := Copy(cTexto,f1+4,Length(cTexto));
   f2:=pos('";',cTexto)-1;
   c2:=Copy(cTexto,1,f2);

   cTexto := Copy(cTexto,f2+4,Length(cTexto));
   f3:=pos('";',cTexto)-1;
   c3:=Copy(cTexto,1,f3);

   cTexto := Copy(cTexto,f3+4,Length(cTexto));
   f4:=pos('";',cTexto)-1;
   c4:=Copy(cTexto,1,f4);

   cTexto := Copy(cTexto,f4+4,Length(cTexto));
   f5:=pos('";',cTexto)-1;
   c5:=Copy(cTexto,1,f5);

   cTexto := Copy(cTexto,f5+4,Length(cTexto));
   f6:=pos('";',cTexto)-1;
   c6:=Copy(cTexto,1,f6);

   cTexto := Copy(cTexto,f6+4,Length(cTexto));
   f7:=pos('";',cTexto)-1;
   c7:=Copy(cTexto,1,f7);

   if n=1 then Result:=c1;
   if n=2 then Result:=c2;
   if n=3 then Result:=c3;
   if n=4 then Result:=c4;
   if n=5 then Result:=c5;
   if n=6 then Result:=c6;
   if n=7 then Result:=c7;
end;

Function TFTelecredito.BuscaDOC( Dato : String ) : String;
var
   cTexto : String;
begin
   cTexto := Copy(Dato,1,4);
   if cTexto='FACT' then Result:='01';
   if cTexto<>'FACT' then Result:='02';
end;

Function TFTelecredito.BuscaNum( Dato : String ) : String;
var
   cTexto : String;
begin
   cTexto := Copy(Dato,7,10);
   Result :=cTexto;
end;

Function TFTelecredito.BuscaEstado( Dato : String ) : String;
var
   cTexto : String;
begin
   cTexto := Dato;
   if cTexto='OK' then Result:='S';
   if cTexto<>'OK' then Result:='N';
end;

Function TFTelecredito.BuscaMoneda( Dato : String ) : String;
var
   cTexto : String;
begin
   cTexto := Dato;
   if pos('NUEVOS SOLES',cTexto)>0 then Result:='N';
   if pos('DOLARES AMERICANOS',cTexto)>0 then Result:='D';
end;


procedure TFTelecredito.bbtnFiltrarClick(Sender: TObject);
var
   xSQL : String;
begin
   xSQL:='Select NUMTEL, FECTEL, CUETEL, MONEDA, AUTNOM1, AUTNOM2, MONREC, NUMREC, '
        +  'MONRES, NUMRES, MONDET, NUMDET, FECTRA, USUTRA, TRACON, CIAID, TDIARID, '
        +  'CNTANOMM, CNTCOMPROB, FECCON, USUCON, CIATEL '
        +'from CNT_TRA_TEL_CAB '
        +'ORDER BY NUMTEL DESC';
   DMCNT.cdsReporteC.Close;
   DMCNT.cdsReporteC.DataRequest( xSQL );
   DMCNT.cdsReporteC.Open;

   dbgCabRowChanged( Self);
end;

procedure TFTelecredito.dbgCabRowChanged(Sender: TObject);
var
   xSQL : String;
begin
   xSQL:='Select * from CNT_TRA_TEL_DET '
        +'Where NUMTEL='''+DMCNT.cdsReporteC.FieldByname('NUMTEL').AsString+''' '
        +'order by NUMTEL, NUMITE';
   DMCNT.cdsReporte.Close;
   DMCNT.cdsReporte.DataRequest( xSQL );
   DMCNT.cdsReporte.Open;
end;

procedure TFTelecredito.bbtnAsiDesClick(Sender: TObject);
var
   xSQL    : String;
   cDolar, cSoles   : String;
   cPeriodo: String;
   cOrigen, cOriDes : String;
   cCia, cCiaDes    : String;
   cNumCom, cCtaCiaHabe : String;
   cCtaCiaDebe, cCtaBanco, cCtaBanDe : String;
   cTipCam, cCtaDes, cCtaDes2 : String;
begin
   cCia   :='02';
   cOrigen:='53';
   xSQL:='SELECT SUBSTR(TDIARDES,1,20) TDIARDES '
        +'FROM TGE104 '
        +'WHERE TDIARID='''+cOrigen+'''';
	 DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   cOriDes:=DMCNT.cdsQry2.FieldByName('TDIARDES').AsString;

   xSQL:='Select TCAMVBV From TGE107 '
        +'Where TMONID=''D'' and FECHA='''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''' ';
	 DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   if DMCNT.cdsQry2.RecordCount <= 0 then
   begin
      ShowMessage('Falta el Tipo de Cambio');
      Exit;
   end;
   cTipCam:=DMCNT.cdsQry2.FieldByName('TCAMVBV').AsString;

	 xSQL:='SELECT * FROM TGE114 WHERE FECHA='+quotedstr(DMCNT.cdsReporteC.FieldByname('FECTEL').AsString);
	 DMCNT.cdsQry3.Close;
   DMCNT.cdsQry3.DataRequest(xSQL);
   DMCNT.cdsQry3.Open;
   cPeriodo:=DMCNT.cdsQry3.fieldbyName('FECANO').asString+DMCNT.cdsQry3.fieldbyName('FECMES').asString;

   if DMCNT.cdsReporteC.FieldByname('MONEDA').AsString='N' then
   begin
      cSoles:=FloatToStr(DMCNT.cdsReporteC.FieldByname('MONRES').AsFloat);
      cDolar:=FloatToStr(DMCNT.FRound(DMCNT.cdsReporteC.FieldByname('MONRES').AsFloat/DMCNT.cdsQry2.FieldByName('TCAMVBV').AsFloat,15,2));
   end
   else
   begin
      cDolar:=FloatToStr(DMCNT.cdsReporteC.FieldByname('MONRES').AsFloat);
      cSoles:=FloatToStr(DMCNT.FRound(DMCNT.cdsReporteC.FieldByname('MONRES').AsFloat*DMCNT.cdsQry2.FieldByName('TCAMVBV').AsFloat,15,2));
   end;

   xSQL:='SELECT LPAD(MAX(CNTCOMPROB)+1,10,''0'') CNTCOMPROB '
        +'FROM CNT300 '
        +'WHERE CIAID='''+cCia+''' AND CNTANOMM='''+cPeriodo+''' AND TDIARID='''+cOrigen+''' '
        +'GROUP BY CIAID, TDIARID, CNTANOMM ';
	 DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   cNumCom:=DMCNT.cdsQry2.FieldByName('CNTCOMPROB').AsString;

   xSQL:='Select CTADEBE, CTAHABER, B.CIAABR, C.CTAABR, D.CTAABR CTADES2 '
        +'from CAJA103 A, TGE101 B, TGE202 C, TGE202 d '
        +'WHERE A.CIAID='''+DMCNT.cdsReporteC.FieldByname('CIATEL').AsString+''' '
        +  'AND A.CIAID=B.CIAID(+) '
        +  'AND A.CIAID=C.CIAID(+) AND A.CTADEBE=C.CUENTAID(+) '
        +  'AND A.CIAID=D.CIAID(+) AND A.CTAHABER=D.CUENTAID(+)';
	 DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   cCtaCiaDebe:=DMCNT.cdsQry2.FieldByName('CTADEBE').AsString;
   cCtaCiaHabe:=DMCNT.cdsQry2.FieldByName('CTAHABER').AsString;
   cCiaDes    :=DMCNT.cdsQry2.FieldByName('CIAABR').AsString;
   cCtaDes    :=DMCNT.cdsQry2.FieldByName('CTAABR').AsString;
   cCtaDes2   :=DMCNT.cdsQry2.FieldByName('CTADES2').AsString;

   xSQL:='SELECT CCBCOID, CTAPRINC, C.CTAABR  FROM TGE106 A, TGE202 C '
        +'WHERE A.CIAID='''+cCia+''' AND BANCOID=''03'' '
        +  'AND CCBCOID like '''+DMCNT.cdsReporteC.FieldByname('CUETEL').AsString+'%'' '
        +  'AND A.CIAID=C.CIAID(+) AND A.CTAPRINC=C.CUENTAID(+)';
	 DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   cCtaBanco:=DMCNT.cdsQry2.FieldByName('CTAPRINC').AsString;
   cCtaBanDe:=DMCNT.cdsQry2.FieldByName('CTAABR').AsString;

   xSQL:='Insert Into CNT300( CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTLOTE, '
        +  'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
        +  'CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, TDIARDES, CNTTS, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, DOCMOD, MODULO ) '
        +'Values('''+cCia+''', '''+cOrigen+''', '''+cNumCom+''', '
        +  ''''+cPeriodo+''', ''TEPR'', ''TELECREDITO HOTEL'', '
        +  cTipCam+', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''', '
        +  '''I'', '''+DMCNT.wUsuario+''', sysdate, sysdate, '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECANO').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECMES').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECDIA').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECTRIM').asString +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSEM').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSS').asString   +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAATRI').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASEM').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASS').asString +''', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('MONEDA').AsString +''', '
        +  'null, '''+cOriDes+''', ''BV'', '
        +  DMCNT.cdsReporteC.FieldByname('MONRES').AsString +', '+cDolar+', '
        +  DMCNT.cdsReporteC.FieldByname('MONRES').AsString +', '+cDolar+', '
        +  '''CNT'', ''INT'' )';
   DMCNT.cdsSQL.Close;
   DMCNT.cdsSQL.DataRequest( xSQL );
   DMCNT.cdsSQL.Execute;

   // DETALLE 1

   xSQL:='Insert Into CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, '
        +   'CNTLOTE, CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, '
        +   'CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, '
        +   'CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, '
        +   'CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, '
        +   'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, TDIARDES, '
        +   'CTADES, AUXDES, DOCDES, CCOSDES, CNTDEBEMN, CNTDEBEME, '
        +   'CNTHABEMN, CNTHABEME, CNTTS, CNTMODDOC, CNTREG, MODULO ) '
        +'Values('''+cCia+''', '''+cOrigen+''', '''+cNumCom+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECANO').asString  +''', '
        +  ''''+cPeriodo+''', ''TEPR'', '''+cCtaCiaDebe+''', null, null, '
        +  '''23'', ''0'', '''+DMCNT.cdsReporteC.FieldByname('NUMTEL').AsString+''', '
        +  '''TELECREDITO '+cCiaDes+''', ''D'', NULL, '+cTipCam+', '
        +  DMCNT.cdsReporteC.FieldByname('MONRES').AsString +', '
        +  cSoles+', '+cDolar+', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''', '
        +  '''I'', ''N'', NULL, '''+DMCNT.wUsuario+''', SYSDATE, SYSDATE, '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECMES').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECDIA').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECTRIM').asString +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSEM').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSS').asString   +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAATRI').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASEM').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASS').asString +''', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('MONEDA').AsString +''', '
        +  ''''+cOriDes+''', '''+cCtaDes+''', null, ''Otros'', null, '
        +  cSoles+', '+cDolar+', 0, 0, ''BV'', ''CNT'', 1, ''INT'' ) ';
   DMCNT.cdsSQL.Close;
   DMCNT.cdsSQL.DataRequest( xSQL );
   DMCNT.cdsSQL.Execute;

   // DETALLE 2

   xSQL:='Insert Into CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, '
        +   'CNTLOTE, CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, '
        +   'CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, '
        +   'CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, '
        +   'CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, '
        +   'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, TDIARDES, '
        +   'CTADES, AUXDES, DOCDES, CCOSDES, CNTDEBEMN, CNTDEBEME, '
        +   'CNTHABEMN, CNTHABEME, CNTTS, CNTMODDOC, CNTREG, MODULO ) '
        +'Values('''+cCia+''', '''+cOrigen+''', '''+cNumCom+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECANO').asString  +''', '
        +  ''''+cPeriodo+''', ''TEPR'', '''+cCtaCiaHabe+''', null, null, '
        +  '''23'', ''0'', '''+DMCNT.cdsReporteC.FieldByname('NUMTEL').AsString+''', '
        +  '''TELECREDITO '+cCiaDes+''', ''H'', NULL, '+cTipCam+', '
        +  DMCNT.cdsReporteC.FieldByname('MONRES').AsString +', '
        +  cSoles+', '+cDolar+', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''', '
        +  '''I'', ''N'', NULL, '''+DMCNT.wUsuario+''', SYSDATE, SYSDATE, '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECMES').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECDIA').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECTRIM').asString +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSEM').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSS').asString   +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAATRI').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASEM').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASS').asString +''', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('MONEDA').AsString +''', '
        +  ''''+cOriDes+''', '''+cCtaBanDe+''', null, ''Otros'', null, '
        +  '0, 0, '+cSoles+', '+cDolar+', ''BV'', ''CNT'', 2, ''INT'' ) ';
   DMCNT.cdsSQL.Close;
   DMCNT.cdsSQL.DataRequest( xSQL );
   DMCNT.cdsSQL.Execute;

end;






procedure TFTelecredito.bbtnTransfClick(Sender: TObject);
var
   i, n, item : Integer;
   xSQL, cRUC : String;
begin
   bbtnTransf.Enabled:=False;

   For i := 0 to scFile.Lines.Count-1 Do
   begin
       xSQL:='SELECT * FROM CNT_TRA_TEL_CAB '
            +'WHERE NUMTEL='''+Copy( scFile.Lines[ 4 ], 23, 6 )+'''';
       DMCNT.cdsCabCNT.Filter   := '';
       DMCNT.cdsCabCNT.Filtered := False;
       DMCNT.cdsCabCNT.Close;
       DMCNT.cdsCabCNT.Close;
       DMCNT.cdsCabCNT.DataRequest(xSQL);
       DMCNT.cdsCabCNT.Open;

       if DMCNT.cdsCabCNT.RecordCount>0 then
       begin
          ShowMessage('Archivo ya fue Descargado. Verificar');
          Exit;
       end;

       DMCNT.cdsCabCNT.Insert;
       DMCNT.cdsCabCNT.FieldByName('NUMTEL').AsString  :=BuscaDato( Copy(scFile.Lines[03], 22, 10), 1 );
       DMCNT.cdsCabCNT.FieldByName('FECTEL').AsDateTime:=StrToDate(BuscaDato( Copy(scFile.Lines[04], 06, 30), 1 ));
       DMCNT.cdsCabCNT.FieldByName('CIATEL').AsString  :=dblcCia.Text;
       DMCNT.cdsCabCNT.FieldByName('CUETEL').AsString  :=BuscaDato( Copy(scFile.Lines[05], 18, 30), 1 );
       DMCNT.cdsCabCNT.FieldByName('MONEDA').AsString  :=BuscaMoneda( scFile.Lines[06] );
       DMCNT.cdsCabCNT.FieldByName('AUTNOM1').AsString :=BuscaDato( Copy(scFile.Lines[07], 17, 50), 1 );
       DMCNT.cdsCabCNT.FieldByName('AUTNOM2').AsString :=BuscaDato( scFile.Lines[08], 1 );
       DMCNT.cdsCabCNT.FieldByName('MONREC').AsString  :=StringReplace(  BuscaDato(scFile.Lines[11], 2 ),',','',[rfreplaceall]);
       DMCNT.cdsCabCNT.FieldByName('NUMREC').AsString  :=StringReplace(  BuscaDato(scFile.Lines[12], 2 ),',','',[rfreplaceall]);
       DMCNT.cdsCabCNT.FieldByName('MONRES').AsString  :=StringReplace(  BuscaDato(scFile.Lines[11], 3 ),',','',[rfreplaceall]);
       DMCNT.cdsCabCNT.FieldByName('NUMRES').AsString  :=StringReplace(  BuscaDato(scFile.Lines[12], 3 ),',','',[rfreplaceall]);
       DMCNT.cdsCabCNT.FieldByName('MONDET').AsString  :=StringReplace(  BuscaDato(scFile.Lines[11], 4 ),',','',[rfreplaceall]);
       DMCNT.cdsCabCNT.FieldByName('NUMDET').AsString  :=StringReplace(  BuscaDato(scFile.Lines[12], 4 ),',','',[rfreplaceall]);
       DMCNT.cdsCabCNT.FieldByName('FECTRA').AsDateTime:=Date+time;
       DMCNT.cdsCabCNT.FieldByName('USUTRA').AsString  :=DMCNT.wUsuario;
       DMCNT.cdsCabCNT.FieldByName('TRACON').AsString  :='N';
       DMCNT.cdsCabCNT.Post;
       Break
   end;

   xSQL:='SELECT * FROM CNT_TRA_TEL_DET '
        +'WHERE NUMTEL='''+Copy( scFile.Lines[ 4 ], 23, 6 )+'''';
   DMCNT.cdsMovCNT.Close;
   DMCNT.cdsMovCNT.Filter   := '';
   DMCNT.cdsMovCNT.Filtered := False;
   DMCNT.cdsMovCNT.DataRequest(xSQL);
   DMCNT.cdsMovCNT.Open;

   For i := 0 to scFile.Lines.Count-1 Do
   begin
       if Copy(scFile.Lines[ i ],1,12)='"Proveedor";' then
       begin
          n:=i;
          Break;
       end;
   end;

   item:=0;
   For i := n+1 to scFile.Lines.Count-1 Do
   begin
       if Pos('"PAGO TOTAL', scFile.Lines[i])>0 then
          cRUC:=Copy( scFile.Lines[i], Pos('"RUC ', scFile.Lines[i])+5, 11 )
       else
       begin
          if Pos('"RUC ', scFile.Lines[i])>0 then
             cRUC:=Copy( scFile.Lines[i], Pos('"RUC ', scFile.Lines[i])+5, 11 );

          item:=item+1;
          DMCNT.cdsMovCNT.Insert;
          DMCNT.cdsMovCNT.FieldByName('NUMTEL').AsString  :=DMCNT.cdsCabCNT.FieldByName('NUMTEL').AsString;
          DMCNT.cdsMovCNT.FieldByName('PROVDES').AsString :=BuscaDato( scFile.Lines[i], 1 );
          DMCNT.cdsMovCNT.FieldByName('PROVRUC').AsString :=cRUC;
          DMCNT.cdsMovCNT.FieldByName('DOCID').AsString   :=BuscaDOC(BuscaDato( scFile.Lines[i], 3 ));
          DMCNT.cdsMovCNT.FieldByName('NUMSER').AsString  :='000';
          DMCNT.cdsMovCNT.FieldByName('NUMDOC').AsString  :=BuscaNum(BuscaDato( scFile.Lines[i], 3 ));
          DMCNT.cdsMovCNT.FieldByName('IMPPAG').AsString  :=StringReplace(BuscaDato( scFile.Lines[i], 4 ),',','',[rfreplaceall]);
          DMCNT.cdsMovCNT.FieldByName('CUEABO').AsString  :=BuscaDato( scFile.Lines[i], 6 );
          DMCNT.cdsMovCNT.FieldByName('ESTTRA').AsString  :=BuscaEstado( BuscaDato( scFile.Lines[i], 7 ));
          DMCNT.cdsMovCNT.FieldByName('FECTRA').AsDateTime:=Date+time;
          DMCNT.cdsMovCNT.FieldByName('USUTRA').AsString  :=DMCNT.wUsuario;
          DMCNT.cdsMovCNT.FieldByName('NUMITE').AsString  :=DMCNT.StrZero(IntToStr(item),4);
          DMCNT.cdsMovCNT.Post;
       end;
   end;

   try
      DMCNT.cdsCabCNT.ApplyUpdates( 0 );
      DMCNT.cdsMovCNT.ApplyUpdates( 0 );
   except
      ShowMessage('Error : al Grabar Inicial');
      Exit;
   end;
   bbtnFiltrarClick(SELF);
   Screen.Cursor := crDefault;
   ShowMessage( 'Data Transferida');

end;

procedure TFTelecredito.BitBtn2Click(Sender: TObject);
begin
   bbtnFiltrarClick(SELF);
   pnlCab.Enabled:=True;
   pnlImporta.Visible:=False;
end;

procedure TFTelecredito.FormActivate(Sender: TObject);
begin
   bbtnFiltrarClick(Self);

   DMCNT.cds3.Close;
   DMCNT.cds3.DataRequest('Select * from TGE101 WHERE CIAID>=''07'' order by CIAID');
   DMCNT.cds3.Open;
end;

procedure TFTelecredito.bbtnAsiDocClick(Sender: TObject);
var
   xSQL    : String;
   cDolar, cSoles   : String;
   cPeriodo: String;
   cOrigen, cOriDes : String;
   cCia, cCiaDes    : String;
   cNumCom : String;
   cCtaCiaHabe, cCtaBanco, cCtaBanDe : String;
   cTipCam, cCtaDes, cMoneda : String;
begin
   cCia   :=DMCNT.cdsReporteC.FieldByname('CIATEL').AsString;
   cOrigen:='53';
   xSQL:='SELECT SUBSTR(TDIARDES,1,20) TDIARDES '
        +'FROM TGE104 '
        +'WHERE TDIARID='''+cOrigen+'''';
	 DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   cOriDes:=DMCNT.cdsQry2.FieldByName('TDIARDES').AsString;

   xSQL:='Select TCAMVBV From TGE107 '
        +'Where TMONID=''D'' and FECHA='''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''' ';
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest( xSQL );
   DMCNT.cdsQry2.Open;
   if DMCNT.cdsQry2.RecordCount <= 0 then
   begin
      ShowMessage('Falta el Tipo de Cambio');
      Exit;
   end;
   cTipCam:=DMCNT.cdsQry2.FieldByName('TCAMVBV').AsString;

	 xSQL:='SELECT * FROM TGE114 WHERE FECHA='+quotedstr(DMCNT.cdsReporteC.FieldByname('FECTEL').AsString);
	 DMCNT.cdsQry3.Close;
   DMCNT.cdsQry3.DataRequest(xSQL);
   DMCNT.cdsQry3.Open;
   cPeriodo:=DMCNT.cdsQry3.fieldbyName('FECANO').asString+DMCNT.cdsQry3.fieldbyName('FECMES').asString;

   if DMCNT.cdsReporteC.FieldByname('MONEDA').AsString='N' then
   begin
      cSoles:=FloatToStr(DMCNT.cdsReporteC.FieldByname('MONRES').AsFloat);
      cDolar:=FloatToStr(DMCNT.FRound(DMCNT.cdsReporteC.FieldByname('MONRES').AsFloat/DMCNT.cdsQry2.FieldByName('TCAMVBV').AsFloat,15,2));
   end
   else
   begin
      cDolar:=FloatToStr(DMCNT.cdsReporteC.FieldByname('MONRES').AsFloat);
      cSoles:=FloatToStr(DMCNT.FRound(DMCNT.cdsReporteC.FieldByname('MONRES').AsFloat*DMCNT.cdsQry2.FieldByName('TCAMVBV').AsFloat,15,2));
   end;

   xSQL:='SELECT LPAD(MAX(CNTCOMPROB)+1,10,''0'') CNTCOMPROB '
        +'FROM CNT300 '
        +'WHERE CIAID='''+cCia+''' AND CNTANOMM='''+cPeriodo+''' AND TDIARID='''+cOrigen+''' '
        +'GROUP BY CIAID, TDIARID, CNTANOMM ';
	 DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   cNumCom:=DMCNT.cdsQry.FieldByName('CNTCOMPROB').AsString;

   xSQL:='Select CTADEBE, CTAHABER, B.CIAABR, C.CTAABR '
        +'from CAJA103 A, TGE101 B, TGE202 C '
        +'WHERE A.CIAID='''+DMCNT.cdsReporteC.FieldByname('CIATEL').AsString+''' '
        +  'AND A.CIAID=B.CIAID(+) '
        +  'AND A.CIAID=C.CIAID(+) AND A.CTAHABER=C.CUENTAID(+)';
	 DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   cCtaCiaHabe:=DMCNT.cdsQry.FieldByName('CTAHABER').AsString;
   cCiaDes    :=DMCNT.cdsQry.FieldByName('CIAABR').AsString;
   cCtaDes    :=DMCNT.cdsQry.FieldByName('CTAABR').AsString;

   cMoneda:=DMCNT.cdsReporteC.FieldByname('MONEDA').AsString;

   if cMoneda='N' then
   xSQL:='SELECT C.CUENTAID, C.CTAABR FROM TGE202 C '
        +'WHERE C.CUENTAID=''42101'''
   else
   xSQL:='SELECT C.CUENTAID, C.CTAABR FROM TGE202 C '
        +'WHERE C.CUENTAID=''42102''';

	 DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   cCtaBanco:=DMCNT.cdsQry.FieldByName('CUENTAID').AsString;
   cCtaBanDe:=DMCNT.cdsQry.FieldByName('CTAABR').AsString;

   xSQL:='Insert Into CNT300( CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTLOTE, '
        +  'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
        +  'CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, TDIARDES, CNTTS, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, DOCMOD, MODULO ) '
        +'Values('''+cCia+''', '''+cOrigen+''', '''+cNumCom+''', '
        +  ''''+cPeriodo+''', ''TEPR'', ''TELECREDITO '+cCiaDes+''', '
        +  cTipCam+', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''', '
        +  '''I'', '''+DMCNT.wUsuario+''', sysdate, sysdate, '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECANO').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECMES').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECDIA').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECTRIM').asString +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSEM').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSS').asString   +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAATRI').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASEM').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASS').asString +''', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('MONEDA').AsString +''', '
        +  'null, '''+cOriDes+''', ''BV'', '
        +  DMCNT.cdsReporteC.FieldByname('MONRES').AsString +', '+cDolar+', '
        +  DMCNT.cdsReporteC.FieldByname('MONRES').AsString +', '+cDolar+', '
        +  '''CNT'', ''INT'' )';
   DMCNT.cdsSQL.Close;
   DMCNT.cdsSQL.DataRequest( xSQL );
   DMCNT.cdsSQL.Execute;

   // DETALLE 1

   xSQL:='Insert Into CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, '
        +   'CNTLOTE, CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, '
        +   'CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, '
        +   'CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, '
        +   'CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, '
        +   'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, TDIARDES, '
        +   'CTADES, AUXDES, DOCDES, CCOSDES, CNTDEBEMN, CNTDEBEME, '
        +   'CNTHABEMN, CNTHABEME, CNTTS, CNTMODDOC, CNTREG, MODULO ) '
        +'Select '''+cCia+''', '''+cOrigen+''', '''+cNumCom+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECANO').asString  +''', '
        +  ''''+cPeriodo+''', ''TEPR'', '''+cCtaBanco+''', CLAUXID, PROV, '
        +  'DOCID, NUMSER, NUMDOC, '
        +  '''TELECREDITO '+cCiaDes+''', ''D'', NULL, '+cTipCam+', IMPPAG, '
        +  'CASE WHEN '''+cMoneda+'''=''N'' THEN IMPPAG ELSE round(IMPPAG*'+cTipCam+',2) end SOLES, '
        +  'CASE WHEN '''+cMoneda+'''=''D'' THEN IMPPAG ELSE round(IMPPAG/'+cTipCam+',2) end DOLAR, '
        +  ''''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''', '
        +  '''I'', ''N'', NULL, '''+DMCNT.wUsuario+''', SYSDATE, SYSDATE, '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECMES').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECDIA').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECTRIM').asString +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSEM').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSS').asString   +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAATRI').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASEM').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASS').asString +''', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('MONEDA').AsString +''', '
        +  ''''+cOriDes+''', '''+cCtaBanDe+''',  SUBSTR(B.PROVDES,1,15), ''Otros'', null, '
        +  'CASE WHEN '''+cMoneda+'''=''N'' THEN IMPPAG ELSE round(IMPPAG*'+cTipCam+',2) end SOLES, '
        +  'CASE WHEN '''+cMoneda+'''=''D'' THEN IMPPAG ELSE round(IMPPAG/'+cTipCam+',2) end DOLAR, '
        +  '0, 0, ''BV'', ''CNT'', NUMITE, ''INT'' '
        +'From CNT_TRA_TEL_DET A, TGE201 B '
        +'Where NUMTEL='''+DMCNT.cdsReporteC.FieldByname('NUMTEL').AsString+''' '
        +  'AND A.PROVRUC=B.PROVRUC(+) AND B.CLAUXID(+)=''P'' AND ACTIVO(+)=''S'' '
        +'Order by NUMTEL, NUMITE';
   DMCNT.cdsSQL.Close;
   DMCNT.cdsSQL.DataRequest( xSQL );
   DMCNT.cdsSQL.Execute;

   // DETALLE 2

   xSQL:='Insert Into CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, '
        +   'CNTLOTE, CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, '
        +   'CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, '
        +   'CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, '
        +   'CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, '
        +   'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, TDIARDES, '
        +   'CTADES, AUXDES, DOCDES, CCOSDES, CNTDEBEMN, CNTDEBEME, '
        +   'CNTHABEMN, CNTHABEME, CNTTS, CNTMODDOC, CNTREG, MODULO ) '
        +'Values('''+cCia+''', '''+cOrigen+''', '''+cNumCom+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECANO').asString  +''', '
        +  ''''+cPeriodo+''', ''TEPR'', '''+cCtaCiaHabe+''', null, null, '
        +  '''23'', ''0'', '''+DMCNT.cdsReporteC.FieldByname('NUMTEL').AsString+''', '
        +  '''TELECREDITO '+cCiaDes+''', ''H'', NULL, '+cTipCam+', '
        +  DMCNT.cdsReporteC.FieldByname('MONRES').AsString +', '
        +  cSoles+', '+cDolar+', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('FECTEL').AsString+''', '
        +  '''I'', ''N'', NULL, '''+DMCNT.wUsuario+''', SYSDATE, SYSDATE, '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECMES').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECDIA').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECTRIM').asString +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSEM').asString  +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECSS').asString   +''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAATRI').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASEM').asString+''', '
	      +  ''''+DMCNT.cdsQry3.fieldbyName('FECAASS').asString +''', '
        +  ''''+DMCNT.cdsReporteC.FieldByname('MONEDA').AsString +''', '
        +  ''''+cOriDes+''', '''+cCtaDes+''', null, ''Otros'', null, '
        +  '0, 0, '+cSoles+', '+cDolar+', ''BV'', ''CNT'', '
        +  IntToStr(DMCNT.cdsReporte.RecordCount+1)+', ''INT'' ) ';
   DMCNT.cdsSQL.Close;
   DMCNT.cdsSQL.DataRequest( xSQL );
   DMCNT.cdsSQL.Execute;

end;

end.
