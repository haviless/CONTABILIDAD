unit CNT215;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, Spin, Mask,
  wwdbedit;

type
  TFEncinas = class(TForm)
    dbetdiario: TwwDBEdit;
    gbPer: TGroupBox;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    dbeOrigen: TwwDBEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    dbgData: TwwDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    xTCambio : String;
  public
    { Public declarations }
  end;

var
  FEncinas: TFEncinas;

implementation

{$R *.dfm}

USES CNTDM;

procedure TFEncinas.BitBtn1Click(Sender: TObject);
var
  xSQL, cImporte, sMes, sAno, cFecFin, cFecIni : String;
begin
  sMes:='';
  sAno:=IntToStr( (speAno.Value+1)-1 );

  if speMM.Value<12 then
     sMes:=DMCNT.StrZero( IntToStr(speMM.Value+1), 2)
  else
  begin
     sMes:='01';
     sAno:=IntToStr(speAno.Value+1);
  end;

  cImporte:='120';

  cFecFin:=DateToStr(StrToDate('01/'+sMes+'/'+sAno)-1);
  cFecIni:='01/'+DMCNT.StrZero( IntToStr(speMM.Value), 2)+'/'+IntToStr(speAno.Value);

  xSQL := 'SELECT * FROM TGE107 WHERE TO_CHAR(FECHA,''DD/MM/YYYY'') = '+quotedstr( cFecFin );
  DMCNT.cdsQry.Close;
  DMCNT.cdsQry.DataRequest(xSQL);
  DMCNT.cdsQry.Open;
  xTCambio := DMCNT.cdsQry.fieldbyname('TCAMVBC').AsString;
  if xTCambio = '' then
  begin
     xSQL:='SELECT * FROM TGE107 WHERE TO_CHAR(FECHA,''DD/MM/YYYY'') <= '+quotedstr( cFecFin )+' '
          +'Order by FECHA DESC';
     DMCNT.cdsQry.Close;
     DMCNT.cdsQry.DataRequest(xSQL);
     DMCNT.cdsQry.Open;
     xTCambio := DMCNT.cdsQry.fieldbyname('TCAMVBC').AsString;
     if xTCambio = '' then
        ShowMessage('No hay Tipo de cambio para el ' + cFecFin);
  end;


  xSQL:='SELECT FECPAG, DOCPAG, NUMDOCPAG, A.TMONID, A.IMPORTE, CLAUXID, CLIEID, RUCDNI, NOMBRE '
       +'FROM CXC_ING_VAR_SER A, CAJA201 B '
       +'WHERE A.FECPAG>='''+cFecIni+''' AND A.FECPAG<='''+cFecFin+''' '
       +  'AND FORPAG=''BANCO'' AND B.CPTOID=A.CPTOID';
  DMCNT.cdsReporte.Close;
  DMCNT.cdsReporte.DataRequest(xSQL);
  DMCNT.cdsReporte.Open;

  if DMCNT.cdsReporte.recordcount=0 then
  begin
     Screen.Cursor:=CrDefault;
     raise exception.Create('No existen registros para la consulta');
  end;

end;

procedure TFEncinas.FormActivate(Sender: TObject);
begin
   dbgData.DataSource:=DMCNT.dsReporte;
end;

procedure TFEncinas.BitBtn2Click(Sender: TObject);
var
  xSQL, xPeriodo, cImporte, cOrigen, cLote, sMes, sAno, cFecFin, cFecIni, NUMCOMP : String;
  cCuenta1, cCuenta2, cReg : String;
  xfecmes  : String;
  xfecdia  : String;
  xfectrim : String;
  xfecsem  : String;
  xfecss   : String;
  xfecaatri: String;
  xfecaasem: String;
  xfecaass : String;
  nReg : Integer;
begin
  sMes:='';
  sAno:=IntToStr( (speAno.Value+1)-1 );

  if speMM.Value<12 then
     sMes:=DMCNT.StrZero( IntToStr(speMM.Value+1), 2)
  else
  begin
     sMes:='01';
     sAno:=IntToStr(speAno.Value+1);
  end;

  cImporte:='120';

  cFecFin:=DateToStr(StrToDate('01/'+sMes+'/'+sAno)-1);

  xPeriodo:=IntToStr(speAno.Value)+DMCNT.StrZero( IntToStr(speMM.Value), 2);
  cOrigen :='57';
  cLote   :='CRCC';
  cCuenta1:='104010312';
  cCuenta2:='16605';

  xSQL := 'SELECT * FROM TGE114 WHERE TO_CHAR(FECHA,''DD/MM/YYYY'') = '+quotedstr( cFecFin );
  DMCNT.cdsQry.close;
  DMCNT.cdsQry.DataRequest(Xsql);
  DMCNT.cdsQry.open;
  xfecmes  := DMCNT.cdsQry.FieldByName('FECMES').AsString;
  xfecdia  := DMCNT.cdsQry.FieldByName('FECDIA').AsString;
  xfectrim := DMCNT.cdsQry.FieldByName('FECTRIM').AsString;
  xfecsem  := DMCNT.cdsQry.FieldByName('FECSEM').AsString;
  xfecss   := DMCNT.cdsQry.FieldByName('FECSS').AsString;
  xfecaatri:= DMCNT.cdsQry.FieldByName('FECAATRI').AsString;
  xfecaasem:= DMCNT.cdsQry.FieldByName('FECAASEM').AsString;
  xfecaass := DMCNT.cdsQry.FieldByName('FECAASS').AsString;

  xSQL:='DELETE FROM CNT300 '
       +'where CIAID=''02'' AND TDIARID=''57'' '
       + ' and CNTANOMM='+quotedstr(xPeriodo)
       + ' and CNTLOTE like '+quotedstr( cLote+'%' )+' ';

  DMCNT.cdsQry.Close;
  DMCNT.cdsQry.DataRequest( xSQL );
  try
  DMCNT.cdsQry.Execute;
  except
     ShowMessage('Error : al Eliminar Asientos ( CNT300 )');
     Exit;
  end;

  xSQL:='DELETE FROM CNT311 '
       +'where CIAID=''02'' AND TDIARID=''57'' '
       + ' and CNTANOMM='+quotedstr(xPeriodo)
       + ' and CNTLOTE like '+quotedstr( cLote+'%' )+' ';

  DMCNT.cdsQry.Close;
  DMCNT.cdsQry.DataRequest( xSQL );
  try
  DMCNT.cdsQry.Execute;
  except
     ShowMessage('Error : al Eliminar Asientos ( CNT311 )');
     Exit;
  end;

  xSQL:='DELETE FROM CNT301 '
       +'where CIAID=''02'' AND TDIARID=''57'' '
       + ' and CNTANOMM='+quotedstr(xPeriodo)
       + ' and CNTLOTE like '+quotedstr( cLote+'%' )+' ';

  DMCNT.cdsQry.Close;
  DMCNT.cdsQry.DataRequest( xSQL );
  try
  DMCNT.cdsQry.Execute;
  except
     ShowMessage('Error : al Eliminar Asientos ( CNT301 )');
     Exit;
  end;



  //PARA RENUMERAR ORIGEN 32
  xSQL:='SELECT NVL(MAX( CNTCOMPROB ),''0'') NUMMAX '
       +'FROM CNT300 '
       +'WHERE CIAID=''02'' AND CNTANOMM = '''+xPeriodo+''' '
       +  'AND TDIARID in ('''+cOrigen+''') '
       +  ' and CNTLOTE LIKE '''+cLote+'%'' ';
  DMCNT.cdsQry.Close;
  DMCNT.cdsQry.DataRequest(xSQL);
  DMCNT.cdsQry.Open;

  NUMCOMP:=DMCNT.cdsQry.FieldByName('NUMMAX').ASSTRING;

  nReg:=0;
  while not DMCNT.cdsReporte.Eof do
  begin
      NUMCOMP:= DMCNT.strzero(inttostr(strtoint(numcomp)+1),10);

      nReg:=nReg+1;

      xSQL:='Insert into CNT311( CIAID, TDIARID, CNTANO, CNTANOMM, CNTCOMPROB, CNTLOTE, '
           +   'CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, '
           +   'CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
           +   'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, '
           +   'CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, '
           +   'TDIARDES, CTADES, AUXDES, DOCDES, '
           +   'CCOSDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTTS, CNTMODDOC, '
           +   'CNTREG, MODULO ) '
           +'Values( ''02'', ''57'', '''+IntToStr(speAno.Value)+''', '''+xPeriodo+''', '
           +   ''''+NUMCOMP+''', '''+cLote+''', '''+cCuenta1+''', NULL, NULL, '
           +   ''''+'67'+''', ''BCO'', '''+Copy(DMCNT.cdsReporte.FieldByname('NUMDOCPAG').AsString,15,6)+''', '
           +   ''''+Copy(DMCNT.cdsReporte.FieldByname('NOMBRE').AsString,1,40)+''', ''D'', NULL, '
           +   xTCambio+', '+DMCNT.cdsReporte.FieldByname('IMPORTE').AsString+', '
           +   DMCNT.cdsReporte.FieldByname('IMPORTE').AsString+', '
           +   FloatToStr(DMCNT.FRound( DMCNT.cdsReporte.FieldByname('IMPORTE').AsFloat/StrToFloat(xTCambio),15,2)) +', '
           +   ''''+DMCNT.cdsReporte.FieldByname('FECPAG').AsString+''', '
           +   ''''+DMCNT.cdsReporte.FieldByname('FECPAG').AsString+''', '
           +   ''''+cFecFin+''', ''I'', ''N'', ''N'', '''+DMCNT.wUsuario+''', SYSDATE, SYSDATE, '
           +   ''''+xfecmes+''', '''+xfecdia+''', '''+xfectrim+''', '''+xfecsem+''', '
           +   ''''+xfecss+''', '''+xfecaatri+''', '''+xfecaasem+''', '''+xfecaass+''', '
           +   ''''+'N'+''', ''RECAUDADORA CENTRO C'', ''CTA.RECAUD. JAE 193-1709316-0-17'', NULL, '
           +   ''''+'Deposito'', NULL, '
           +   DMCNT.cdsReporte.FieldByname('IMPORTE').AsString+', '
           +   FloatToStr(DMCNT.FRound( DMCNT.cdsReporte.FieldByname('IMPORTE').AsFloat/StrToFloat(xTCambio),15,2))+', '
           +   '0, 0, ''BV'', ''CXC'', 1, ''CNT'' ) ';
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest( xSQL );
      try
      DMCNT.cdsQry.Execute;
      except
         ShowMessage('Error : al Generar cuenta de banco');
         Exit;
      end;


      xSQL:='Insert into CNT311( CIAID, TDIARID, CNTANO, CNTANOMM, CNTCOMPROB, CNTLOTE, '
           +   'CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, '
           +   'CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
           +   'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, '
           +   'CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, '
           +   'TDIARDES, CTADES, AUXDES, DOCDES, '
           +   'CCOSDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTTS, CNTMODDOC, '
           +   'CNTREG, MODULO ) '
           +'Values( ''02'', ''57'', '''+IntToStr(speAno.Value)+''', '''+xPeriodo+''', '
           +   ''''+NUMCOMP+''', '''+cLote+''', ''16605'', NULL, NULL, '
           +   ''''+'67'+''', ''BCO'', '''+Copy(DMCNT.cdsReporte.FieldByname('NUMDOCPAG').AsString,15,6)+''', '
           +   ''''+Copy(DMCNT.cdsReporte.FieldByname('NOMBRE').AsString,1,40)+''', ''H'', NULL, '
           +   xTCambio+', '+DMCNT.cdsReporte.FieldByname('IMPORTE').AsString+', '
           +   DMCNT.cdsReporte.FieldByname('IMPORTE').AsString+', '
           +   FloatToStr(DMCNT.FRound( DMCNT.cdsReporte.FieldByname('IMPORTE').AsFloat/StrToFloat(xTCambio),15,2)) +', '
           +   ''''+DMCNT.cdsReporte.FieldByname('FECPAG').AsString+''', '
           +   ''''+DMCNT.cdsReporte.FieldByname('FECPAG').AsString+''', '
           +   ''''+cFecFin+''', ''I'', ''N'', ''N'', '''+DMCNT.wUsuario+''', SYSDATE, SYSDATE, '
           +   ''''+xfecmes+''', '''+xfecdia+''', '''+xfectrim+''', '''+xfecsem+''', '
           +   ''''+xfecss+''', '''+xfecaatri+''', '''+xfecaasem+''', '''+xfecaass+''', '
           +   ''''+'N'+''', ''RECAUDADORA CENTRO C'', ''CTA.RECAUD. JAE 193-1709316-0-17'', NULL, '
           +   ''''+'Deposito'', NULL, 0, 0, '
           +   DMCNT.cdsReporte.FieldByname('IMPORTE').AsString+', '
           +   FloatToStr(DMCNT.FRound( DMCNT.cdsReporte.FieldByname('IMPORTE').AsFloat/StrToFloat(xTCambio),15,2))+', '
           +   '''BV'', ''CXC'', 2, ''CNT'' ) ';
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest( xSQL );
      try
      DMCNT.cdsQry.Execute;
      except
         ShowMessage('Error : al Generar cuenta de Centro Cultural');
         Exit;
      end;

      DMCNT.cdsReporte.Next;
  end;

  xSQL := 'insert into CNT300 ( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, '
                                +'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, '
                                +'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, '
                                +'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, '
                                +'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
                                +'CNTTS, DOCMOD, MODULO ) '
          +'select A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE, '
                 +'''CTA.RECAUDADORA ENCINAS'' CNTGLOSA, '+xTCambio+','+'A.CNTFCOMP, ''I'', ''N'', '
                 +''''+DMCNT.wUsuario+''' CNTUSER, MAX( CNTFREG ), MAX( CNTHREG ), A.CNTANO, '
                 +'A.CNTMM, A.CNTDD, A.CNTTRI, '
                 +'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, '
                 +' ''N'' TMONID, null FLAGVAR, A.TDIARDES, '
                 +'SUM(A.CNTDEBEMN), SUM(A.CNTDEBEME), SUM(A.CNTHABEMN), SUM(A.CNTHABEME), '
                 +'MAX( CNTTS ), MAX( CNTMODDOC), MAX( MODULO ) '
          +'from CNT311 A '
          +'where CIAID=''02'' AND TDIARID=''57'' '
          + ' and CNTANOMM='+quotedstr(xPeriodo)
          + ' and CNTLOTE like '+quotedstr( cLote+'%' )+' '
          +'group by A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE,  '
                   +'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, '
                   +'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS,  A.TDIARDES ';

  DMCNT.cdsQry.Close;
  DMCNT.cdsQry.DataRequest( xSQL );
  try
  DMCNT.cdsQry.Execute;
  except
     ShowMessage('Error : al Transferir. Revisar Archivo de Planilla');
     Exit;
  end;

  ShowMessage('ok');

end;

end.
