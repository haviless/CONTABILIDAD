Unit CNT270;

// Actualizaciones
// HPC_201501_CNT    12/02/2015     Reordenamiento de Sangría
//                                  Se agrega Control Transaccional
//                                  Se cambia grabación de asiento por Sentencias SQL

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, DBClient, MConnect, StdCtrls, Buttons, wwclient, Mask, wwdbedit,
   Spin, wwdblook, ComCtrls, ExtCtrls, ppProd, ppClass, ppReport, ppComm,
   ppRelatv, ppDB, ppDBPipe, ppEndUsr, ppBands, ppCache;

Type
   TFApertura = Class(TForm)
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
      bbtnMov: TBitBtn;
      ppdbInc: TppDBPipeline;
      pprInc: TppReport;
      ppdInc: TppDesigner;
      bbtnPlan: TBitBtn;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      bbtnPlan2: TBitBtn;
      cbAux: TCheckBox;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
      Procedure FormActivate(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure speAnoExit(Sender: TObject);
      Procedure dblcTDiarioAAExit(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnMovClick(Sender: TObject);
      Procedure bbtnPlanClick(Sender: TObject);
      Procedure bbtnPlan2Click(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
   Private
    { Private declarations }
      sLink: String;
   Public
    { Public declarations }
      Function DisplayDescrip(wPrv, wTabla, wCampos, wWhere, wResult: String): String;
   End;

Var
   FApertura: TFApertura;
   SRV_D: String;
   wRepHorServi, wRepFuncDate, wFormatFecha, wReplacCeros, wRepFecServi: String;

Implementation

Uses CNTDM;

{$R *.DFM}

Procedure TFApertura.FormActivate(Sender: TObject);
Var
   nAno, nMes, nDia: word;
Begin
   sLink := ' ';
   DMCNT.cdsCia.Open;
   DMCNT.cdsTdiario.Open;
   dbeLoteAA.Text := '0000';
   dbeNoCompAA.Text := '0000000001';
   dblcTDiarioAA.Text := '01';
   decodedate(date, nAno, nMes, nDia);
   speAno.Value := nAno;
   edtGlosaAA.Text := 'Asiento de Apertura de Año ' + speAno.Text;
End;

Procedure TFApertura.dblcCiaExit(Sender: TObject);
Begin
   edtCia.Text := DMCNT.cdsCia.FieldByName('CIAABR').AsString;
   speAno.SetFocus;
End;

Procedure TFApertura.speAnoExit(Sender: TObject);
Begin
   edtGlosaAA.Text := 'Asiento de Apertura de Año ' + speAno.Text;
   edtPeriodoAA.text := speAno.text + '00';
   dblcTDiarioAA.SetFocus;
End;

Procedure TFApertura.dblcTDiarioAAExit(Sender: TObject);
Begin
   edtTDiarioAA.text := DMCNT.cdsTDiario.FieldByName('TDIARDES').AsString;
End;

Procedure TFApertura.bbtnOkClick(Sender: TObject);
Var
   xWhere, xTcambio, xFTCam, xAnioAnt, xSQL, xSQL1, xSQL2: String;
   xMM, xDD, xTRI, xSEM, xSS, xAATRI, xAASEM, xAASS: String;
   xTMonLoc, xTMonExt: String;
   xFEmision, xFTCambio: TDate;
   xgraba, xReg: Integer;
   xSuma, xSumaME: double;
   sFEcha, xSQLDocs, xSQLAux: String;
Begin
   If dblcCia.Text = '' Then
   Begin
      dblcCia.SetFocus;
      ShowMessage('Tiene que Ingresar Compañía');
      Exit;
   End;

   If dblcTDiarioAA.Text = '' Then
   Begin
      ShowMessage('Tiene que ingresar el Diario');
      dblcTDiarioAA.SetFocus;
      exit
   End;

   If dbeNoCompAA.Text = '' Then
   Begin
      ShowMessage('Tiene que ingresar el Comprobante');
      dbeNoCompAA.SetFocus;
      exit
   End;

  //** 1 paso, captura data del SOLCONFIG
   Screen.Cursor := crHourGlass;

   DMCNT.DisplayDescrip('prvSQL', 'SOLCONFIG', '*', '', 'SRV_DB');

   SRV_D := DMCNT.cdsqry.fieldbyname('SRV_DB').AsString;
   wFormatFecha := 'DD-MM-YYYY';
   wReplacCeros := 'NVL';
   wRepFecServi := 'SYSDATE';
   wRepHorServi := 'SYSDATE';
   wRepFuncDate := 'TO_DATE(';

  //** Paso 2, tomo el T. de Cambio al 31 del año anterior
   xAnioAnt := IntToStr(StrToInt(speAno.text) - 1);

   xSQL := 'Select A.CUENTAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, '
         + '       B.CTA_AUX, A.AUXID, B.CTA_CCOS, A.CCOSID, B.CTA_DOC, CNTNODOC '
         + '  from CNT301 A, TGE202 B '
         + ' where A.CIAID='+quotedstr(dblcCia.Text)
         + '   and CNTANOMM>='+quotedstr(xAnioAnt+'00')
         + '   and CNTANOMM<='+quotedstr(xAnioAnt+'12')
         + '   and A.CUENTAID<''60'' '
         + '   and A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
         + '   and ((B.CTA_AUX=''S'' and (nvl(AUXID,''nulo'')=''nulo'' or AUXID='''')) '
         + '     or (B.CTA_CCOS=''S'' and (nvl(CCOSID,''nulo'')=''nulo'' or CCOSID='''')) '
         + '        )';
   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.dataRequest(xSql);
   DMCNT.cdsConsistencia.Open;

   If DMCNT.cdsConsistencia.RecordCount > 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('Error : En los Datos al comparar Asientos vs Plan de Cuentas '
                 +chr(13)+' Generar Reporte de Inconsistencias');
      //Exit;
   End;

   xFTCam := '31/12/' + xAnioAnt;

   xFTCambio := StrToDate(xFTCam);
   sFecha := FormatDateTime(wFormatFecha, xFTCambio);
   xSql := 'SELECT TCAMVBV FROM TGE107 WHERE FECHA=' + quotedstr(sFecha);
   DMCNT.cdsVariable.Close;
   DMCNT.cdsVariable.dataRequest(xSql);
   DMCNT.cdsVariable.Open;
   xTcambio := DMCNT.cdsVariable.FieldByName('TCAMVBV').AsString;

  //** 3 paso, hallo los datos del semestre,trimestre, etc
   xFEmision := StrToDate('01/01/' + speAno.text);
   xWhere := 'Fecha=' + '''' + datetostr(xFEmision) + '''';
   xMM := DMCNT.DisplayDescrip('PrvTGE', 'TGE114', 'FECMES,FECDIA,FECTRIM,FECSEM,FECSS,FECAATRI,FECAASEM,FECAASS', xWhere, 'FECMES');
   xDD := DMCNT.cdsQRY.FieldByName('FECDIA').AsString;
   xTRI := DMCNT.cdsQRY.FieldByName('FECTRIM').AsString;
   xSEM := DMCNT.cdsQRY.FieldByName('FECSEM').AsString;
   xSS := DMCNT.cdsQRY.FieldByName('FECSS').AsString;
   xAATRI := DMCNT.cdsQRY.FieldByName('FECAATRI').AsString;
   xAASEM := DMCNT.cdsQRY.FieldByName('FECAASEM').AsString;
   xAASS := DMCNT.cdsQRY.FieldByName('FECAASS').AsString;

  //** 4 paso, capturo la moneda
   xWhere := 'TMON_LOC=' + quotedstr('L');
   xTMonLoc := DMCNT.DisplayDescrip('PrvTGE', 'TGE103', '*', xWhere, 'TMONID');
   xWhere := 'TMON_LOC=' + quotedstr('E');
   xTMonExt := DMCNT.DisplayDescrip('PrvTGE', 'TGE103', '*', xWhere, 'TMONID');

  //Paso 5, solo para las cuentas que no tengan ni auxiliar ni c. de costo
   xSQL := 'select CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTLOTE, CNTGLOSA, '
         + '       CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
         + '       CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
         + '       CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
         + '       TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, '
         + '       CNTSALDME, CNTTS, DOCMOD, MODULO '
         + '  from CNT300 '
         + ' Where CIAID='+quotedstr(dblcCia.Text)
         + '   and TDIARID='+quotedstr(dblcTDiarioAA.Text)
         + '   and CNTANOMM='+quotedstr(speAno.text+'00')
         + '   and CNTCOMPROB='+quotedstr(dbeNoCompAA.Text);
   DMCNT.cdsVariable.Close;
   DMCNT.cdsVariable.dataRequest(xSql);
   DMCNT.cdsVariable.Open;

   If (DMCNT.cdsVariable.FieldByName('CNTESTADO').AsString = 'I') Or
      (DMCNT.cdsVariable.Recordcount <= 0) Then
   Begin
      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      xSQL := 'delete from CNT300 '
            + ' Where CIAID=''' + dblcCia.Text + ''' '
            + '   and TDIARID=''' + dblcTDiarioAA.TEXT + ''' '
            + '   and CNTANOMM=''' + speAno.text + '00' + ''' '
            + '   and CNTCOMPROB=''' + dbeNoCompAA.Text + '''';
      Try
         DMCNT.cdsVariable.Close;
         DMCNT.cdsVariable.dataRequest(xSql);
         DMCNT.cdsVariable.Execute;
      Except
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo borrar la Cabecera del Asiento previamente generado');
         exit;
      End;

      xSQL := 'delete from CNT311 '
            + ' Where CIAID=''' + dblcCia.Text + ''' '
            + '   and TDIARID=''' + dblcTDiarioAA.TEXT + ''' '
            + '   and CNTANOMM=''' + speAno.text + '00' + ''' '
            + '   and CNTCOMPROB=''' + dbeNoCompAA.Text + '''';
      Try
         DMCNT.cdsVariable.Close;
         DMCNT.cdsVariable.dataRequest(xSql);
         DMCNT.cdsVariable.Execute;
      Except
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
         ShowMessage('No se pudo borrar el Detalle del Asiento previamente generado');
         exit;
      End;

      DMCNT.DCOM1.AppServer.GrabaTransaccion;
   End
   Else
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('Asiento ya Fue Contabilizado');
      Exit;
   End;
{
   xSQLDocs := 'Select A.CIAID, A.CUENTAID, A.CLAUXID, A.AUXID, A.CCOSID, A.DOCID, '
             + '       A.CNTSERIE, A.CNTNODOC, '
             + '       sum(nvl(CNTDEBEMN,0)) CNTDEBEMN, sum(nvl(CNTHABEMN,0)) CNTHABEMN, '
             + '       sum(nvl(CNTDEBEME,0)) CNTDEBEME, sum(nvl(CNTHABEME,0)) CNTHABEME '
             + '  from (Select A.CIAID, A.CUENTAID, '
             + '               case when B.CTA_AUX =''S'' then nvl(A.CLAUXID,''9'') else null end CLAUXID, '
             + '               case when B.CTA_AUX =''S'' then nvl(A.AUXID,''99999'') else null end AUXID, '
             + '               case when B.CTA_CCOS=''S'' then nvl(A.CCOSID,''8888'') else null end CCOSID, '
             + '               A.DOCID, A.CNTSERIE, A.CNTNODOC, '
             + '               CNTDEBEMN, CNTHABEMN, CNTDEBEME, CNTHABEME '
             + '          FROM CNT301 A, TGE202 B '
             + '         WHERE A.CIAID='+quotedstr(dblcCia.Text)
             + '           AND A.CNTANOMM>='+quotedstr(xAnioAnt+'00')
             + '           AND A.CNTANOMM<='+quotedstr(xAnioAnt+'12')
             + '           AND A.CUENTAID<''60'' AND A.CNTESTADO=''P'' AND A.CNTCUADRE=''S'' '
             + '           AND A.CIAID=B.CIAID AND A.CUENTAID= B.CUENTAID AND B.CTA_DOC=''S'' '
             + '        ) A '
             + ' group by A.CIAID, A.CUENTAID, A.CLAUXID, A.AUXID, A.CCOSID, A.DOCID, '
             + '          A.CNTSERIE, A.CNTNODOC '
             + ' having sum(nvl(CNTDEBEMN,0))<>sum(nvl(CNTHABEMN,0))';

   xSQL1   :=  'Select B.CIAID, B.CUENTAID, B.CTANIV, B.CTA_DET, B.CTA_MOV, B.CTA_AUX, '
             + '       CTA_ME B.CTA_CCOS, B.CTA_DEST, B.CTA_DOC, B.CTA_TRANSAPE, '
             + '       A.CLAUXID, A.AUXID, A.CCOSID, A.SALDMN12, A.SALDMN13, '
             + '       '' '' DOCID, '' '' CNTSERIE, '' '' CNTNODOC, '
             + '       0.00 CNTDEBEMN, 0.00 CNTHABEMN, 0.00 CNTDEBEME, 0.00 CNTHABEME '
             + '  from CNT401 A, TGE202 B '
             + ' where A.CIAID='+quotedstr(dblcCia.Text)
             + '   and ( B.CTA_MOV=''S'' or B.CTA_DET=''S'') '
             + '   and A.ANO=' + QuotedStr(xAnioAnt)
             + '   and A.CUENTAID<''60'' and A.SALDMN13<>0 '
             + '   and A.CUENTAID=B.CUENTAID and A.CIAID=B.CIAID '
             + '   and nvl( B.CTA_TRANSAPE,''S'')=''S'' '
             + '   and ((nvl(B.CTA_AUX,''N'')=''N'' and nvl(B.CTA_CCOS,''N'')=''N'' and A.TIPREG=''1'' ) '
             + '     or (nvl(B.CTA_AUX,''N'')=''S'' and nvl(B.CTA_CCOS,''N'')=''N'' and A.TIPREG=''2'' ) '
             + '     or (nvl(B.CTA_AUX,''N'')=''N'' and nvl(B.CTA_CCOS,''N'')=''S'' and A.TIPREG=''3'' ) '
             + '     or (nvl(B.CTA_AUX,''N'')=''S'' and nvl(B.CTA_CCOS,''N'')=''S'' and A.TIPREG=''4'' ) ) ';

   xSQL2   :=  'Select B.CIAID, B.CUENTAID, B.CTANIV, B.CTA_DET, B.CTA_MOV, B.CTA_AUX, '
             + '       B.CTA_CCOS, B.CTA_DEST, B.CTA_DOC, B.CTA_TRANSAPE, '
             + '       A.CLAUXID, A.AUXID, A.CCOSID, A.SALDMN12, A.SALDMN13, '
             + '       C.DOCID, C.CNTSERIE, C.CNTNODOC, '
             + '       C.CNTDEBEMN, C.CNTHABEMN, C.CNTDEBEME, C.CNTHABEME '
             + '  From CNT401 A, TGE202 B, '
             + '      ( ' + xSQLDocs + ' ) C '
             + ' where A.CIAID=' + QUOTEDSTR(dblcCia.Text) + ' and ( B.CTA_MOV=''S'' or B.CTA_DET=''S'') '
             + '   and A.ANO=' + QuotedStr(xAnioAnt) + ' and A.CUENTAID<''60'' and A.SALDMN12<>0 '
             + '   and A.CUENTAID=B.CUENTAID and A.CIAID=B.CIAID '
             + '   and nvl( B.CTA_TRANSAPE,''M'')=''M'' '
             + '   and A.CIAID=C.CIAID(+) AND A.CUENTAID=C.CUENTAID(+) '
             + '   and nvl(A.CLAUXID,'' '')=nvl(C.CLAUXID(+),'' '') and nvl(A.AUXID,'' '')=nvl(C.AUXID(+),'' '') '
             + '   and nvl(A.CCOSID,'' '')=nvl(C.CCOSID(+),'' '') '
             + '   and nvl(C.CNTNODOC,''nulo'' )<>''nulo''';

   xSQL   :=   'Select * '
             + '  from ( ' + xSQL1 + ' Union All ' + xSQL2 + ' ) A '
             + ' Order By CUENTAID, CLAUXID, AUXID, CCOSID';

// CON AUXILIARES Y CENTROS DE COSTO
   xSQL   :=   'select MOVS.CUENTAID,MOVS.CLAUXID,MOVS.AUXID,MOVS.CCOSID,MOVS.DOCID,MOVS.CNTSERIE, '
             + '       MOVS.CNTNODOC, MOVS.CNTDEBEMN, MOVS.CNTHABEMN, MOVS.SALDOACT SALDMN13, '
             + '       CTAS.CTA_MOV, ''N'' CTA_DOC, CTAS.CTA_AUX, CTA_CCOS '
             + '  from (select CIAID,CUENTAID,CLAUXID,AUXID, CCOSID,DOCID,CNTSERIE,CNTNODOC, '
             + '               ABS(sum(CNTDEBEMN)) CNTDEBEMN, ABS(sum(CNTHABEMN)) CNTHABEMN, '
             + '               ABS(sum(CNTDEBEMN))-ABS(sum(CNTHABEMN)) SALDOACT '
             + '          from (SELECT A.CIAID, A.CUENTAID, '''' CNTSERIE, '''' CNTNODOC, '
             + '                   '''' DOCID, '
             + '                   CASE WHEN CTA_AUX=''S'' THEN nvl(CLAUXID,''9'') ELSE '''' END CLAUXID, '
             + '                   CASE WHEN CTA_AUX=''S'' THEN nvl(AUXID,''99999'''') ELSE '''' END AUXID, '
             + '                   CASE WHEN CTA_CCOS=''S'' THEN nvl(CCOSID,''8888'') ELSE '''' END CCOSID, '
             + '                   NVL(CNTDEBEMN,0) CNTDEBEMN, NVL(CNTHABEMN,0) CNTHABEMN '
             + '                  FROM CNT301 A, TGE202 B '
             + '                 WHERE A.CIAID=' + quotedstr(dblcCia.value)
             + '                   and CNTANO=' + QuotedStr(xAnioAnt)
             + '                   and A.CUENTAID<''60'' '
             + '                   and A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
             + '                ) DOCS '
             + '         group by CIAID, CUENTAID, CLAUXID, AUXID, CCOSID '
             + '        ) MOVS, TGE202 CTAS '
             + ' where SALDOACT<>0 and CTAS.CIAID=MOVS.CIAID and CTAS.CUENTAID=MOVS.CUENTAID '
             + ' order by MOVS.CUENTAID';

// CON AUXILIAR
   xSQLAux  := 'SELECT CUENTAID, CLAUXID, AUXID, '' '' CCOSID, ''51'' DOCID, ''000'' CNTSERIE, '
             + '       ''SI0001'' CNTNODOC, SUM( CNTDEBEMN ) CNTDEBEMN, SUM( CNTHABEMN ) CNTHABEMN, '
             + '       SUM( CNTDEBEME ) CNTDEBEME, SUM( CNTHABEME ) CNTHABEME, '
             + '       SUM( SALDMN13 ) SALDMN13, SUM( SALDME13 ) SALDME13, '
             + '       ''S'' CTA_DOC, ''S'' CTA_AUX, ''N'' CTA_CCOS, MAX(CTA_ME) CTA_ME, TMONID '
             + '  FROM (Select MOVS.CUENTAID, MOVS.CLAUXID, MOVS.AUXID, MOVS.CCOSID, '
             + '               MOVS.CNTDEBEMN, MOVS.CNTHABEMN, MOVS.SALDOACT SALDMN13, '
             + '               MOVS.CNTDEBEME, MOVS.CNTHABEME, MOVS.SALDOACTD SALDME13, '
             + '               CTAS.CTA_MOV, CTAS.CTA_DOC, CTAS.CTA_AUX, CTA_CCOS, CTA_ME, '
             + '               CASE WHEN NVL(CTA_ME,''N'')=''S'' THEN ''D'' ELSE ''N'' END TMONID '
             + '          From (select CIAID, CUENTAID, CLAUXID, AUXID, CCOSID, '
             + '                       sum(CNTDEBEMN) CNTDEBEMN, sum(CNTHABEMN) CNTHABEMN, '
             + '                       sum(CNTDEBEME) CNTDEBEME, sum(CNTHABEME) CNTHABEME, '
             + '                       sum(CNTDEBEMN)-sum(CNTHABEMN) SALDOACT, '
             + '                       sum(CNTDEBEME)-sum(CNTHABEME) SALDOACTD '
             + '                  from (select A.CIAID, A.CUENTAID, A.TMONID, '
             + '                               CASE WHEN CTA_AUX=''S'' THEN nvl(CLAUXID,''9'') ELSE ''X'' END CLAUXID, '
             + '                               CASE WHEN CTA_AUX=''S'' THEN nvl(AUXID,''99999'') ELSE ''C9999'' END AUXID, '
             + '                               CASE WHEN CTA_CCOS=''S'' THEN ''991502'' ELSE '''' END CCOSID, '
             + '                               NVL(CNTDEBEMN,0) CNTDEBEMN, NVL(CNTHABEMN,0) CNTHABEMN, '
             + '                               CASE WHEN NVL(B.CTA_ME,''N'')=''S'' '
             + '                                    THEN NVL( CASE WHEN A.TMONID=''D'' THEN CNTDEBEME ELSE 0 END,0) '
             + '                                    ELSE CNTDEBEME '
             + '                                END CNTDEBEME, '
             + '                               CASE WHEN NVL(B.CTA_ME,''N'')=''S'' '
             + '                                    THEN NVL( CASE WHEN A.TMONID=''D'' THEN CNTHABEME ELSE 0 END,0) '
             + '                                    ELSE CNTHABEME '
             + '                                END CNTHABEME '
             + '                          FROM CNT301 A, TGE202 B '
             + '                         WHERE A.CIAID=' + quotedstr(dblcCia.value)
             + '                           and CNTANO=' + QuotedStr(xAnioAnt)
             + '                           and A.CUENTAID<''60'' '
             + '                           and A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
             + '                           and B.CTA_AUX=''S'' '
             + '                        ) DOCS '
             + '                 Group by CIAID, CUENTAID, CLAUXID, AUXID, CCOSID '
             + '                ) MOVS, TGE202 CTAS '
             + '         Where SALDOACT<>0 and CTAS.CIAID=MOVS.CIAID and CTAS.CUENTAID=MOVS.CUENTAID '
             + '           and CTAS.CTA_AUX=''S'' '
             + '         Order by MOVS.CUENTAID '
             + '       ) A '
             + ' GROUP BY CUENTAID, CLAUXID, AUXID, TMONID '
             + ' HAVING SUM( SALDMN13 )<>0 '
             + ' ORDER BY CUENTAID, CLAUXID, AUXID ';
}

// SIN AUXILIAR
   xSQL   :=   'SELECT A.CUENTAID, '' '' CLAUXID, '' '' AUXID, '' '' CCOSID, '' '' DOCID, '
             +         ''' '' CNTSERIE, '' '' CNTNODOC, '
             + '       CASE WHEN NVL(SALDMN12,0)>=0 THEN NVL(SALDMN12,0) ELSE 0 END CNTDEBEMN, '
             + '       CASE WHEN NVL(SALDMN12,0)<0  THEN NVL(SALDMN12,0)*(-1) ELSE 0 END CNTHABEMN, '
             + '       CASE WHEN NVL(SALDME12,0)>=0 THEN NVL(SALDME12,0) ELSE 0 END CNTDEBEME, '
             + '       CASE WHEN NVL(SALDME12,0)<0  THEN NVL(SALDME12,0)*(-1) ELSE 0 END CNTHABEME, '
             + '       NVL(SALDMN12,0) SALDMN13, NVL(SALDME12,0) SALDME13, '
             + '       ''N'' CTA_DOC, ''N'' CTA_AUX, ''N'' CTA_CCOS, B.CTA_ME, '
             + '       CASE WHEN B.CTA_ME=''S'' THEN ''D'' ELSE ''N'' END TMONID '
             + '  FROM CNT401 A, TGE202 B '
             + ' WHERE A.CIAID=' + quotedstr(dblcCia.value) + ' AND ANO=' + QuotedStr(xAnioAnt) + ' AND TIPREG=1 '
             + '   AND A.CUENTAID<''60'' '
             + '   AND A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
             + '   AND ( B.CTA_MOV=''S'' OR B.CTA_DET=''S'' ) '
             + '   and B.CTA_AUX=''N'' '
             + ' UNION ALL ';

   If cbAux.Checked Then
      xSQL := xSQL
             + 'SELECT CUENTAID, CLAUXID, AUXID, '' '' CCOSID, ''51'' DOCID, ''000'' CNTSERIE, '
             + '       ''SI0001'' CNTNODOC, ABS(SUM( CNTDEBEMN )) CNTDEBEMN, ABS(SUM( CNTHABEMN )) CNTHABEMN, '
             + '       ABS(SUM( CNTDEBEME )) CNTDEBEME, ABS(SUM( CNTHABEME )) CNTHABEME, '
             + '       SUM( SALDMN13 ) SALDMN13, SUM( SALDME13 ) SALDME13, '
             + '       ''S'' CTA_DOC, ''S'' CTA_AUX, ''N'' CTA_CCOS, MAX(CTA_ME) CTA_ME, TMONID '
             + '  FROM (Select MOVS.CUENTAID, MOVS.CLAUXID, MOVS.AUXID, MOVS.CCOSID, '
             + '               MOVS.CNTDEBEMN, MOVS.CNTHABEMN, MOVS.SALDOACT SALDMN13, '
             + '               MOVS.CNTDEBEME, MOVS.CNTHABEME, MOVS.SALDOACTD SALDME13, '
             + '               CTAS.CTA_MOV, CTAS.CTA_DOC, CTAS.CTA_AUX, CTA_CCOS, CTA_ME, '
             + '               CASE WHEN NVL(CTA_ME,''N'')=''S'' THEN ''D'' ELSE ''N'' END TMONID '
             + '         From (select CIAID, CUENTAID, CLAUXID, AUXID, CCOSID, '
             + '                      sum(CNTDEBEMN) CNTDEBEMN, sum(CNTHABEMN) CNTHABEMN, '
             + '                      sum(CNTDEBEME) CNTDEBEME, sum(CNTHABEME) CNTHABEME, '
             + '                      sum(CNTDEBEMN)-sum(CNTHABEMN) SALDOACT, '
             + '                      sum(CNTDEBEME)-sum(CNTHABEME) SALDOACTD '
             + '                from (SELECT A.CIAID, A.CUENTAID, A.TMONID, '
             + '                             CASE WHEN CTA_AUX=''S'' THEN nvl(CLAUXID,''9'') ELSE ''X'' END CLAUXID, '
             + '                             CASE WHEN CTA_AUX=''S'' THEN nvl(AUXID,''99999'') ELSE ''C9999'' END AUXID, '
             + '                             CASE WHEN CTA_CCOS=''S'' THEN ''991502'' ELSE '''' END CCOSID, '
             + '                             NVL(CNTDEBEMN,0) CNTDEBEMN, NVL(CNTHABEMN,0) CNTHABEMN, '
             + '                             CASE WHEN NVL(B.CTA_ME,''N'')=''S'' '
             + '                                  THEN NVL( CASE WHEN A.TMONID=''D'' THEN CNTDEBEME ELSE 0 END,0) '
             + '                                  ELSE CNTDEBEME '
             + '                              END CNTDEBEME, '
             + '                             CASE WHEN NVL(B.CTA_ME,''N'')=''S'' '
             + '                                  THEN NVL( CASE WHEN A.TMONID=''D'' THEN CNTHABEME ELSE 0 END,0) '
             + '                                  ELSE CNTHABEME '
             + '                              END CNTHABEME '
             + '                        FROM CNT301 A, TGE202 B '
             + '                       WHERE A.CIAID=' + quotedstr(dblcCia.value)
             + '                         and CNTANO=' + QuotedStr(xAnioAnt)
             + '                         and A.CUENTAID<''60'' '
             + '                         and A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID and B.CTA_AUX=''S'' '
             + '                      ) DOCS '
             + '               Group by CIAID, CUENTAID, CLAUXID, AUXID, CCOSID '
             + '               ) MOVS, TGE202 CTAS '
             + '        Where SALDOACT<>0 and CTAS.CIAID=MOVS.CIAID and CTAS.CUENTAID=MOVS.CUENTAID '
             + '          and CTAS.CTA_AUX=''S'' '
             + '        Order by MOVS.CUENTAID '
             + '       ) A '
             + ' GROUP BY CUENTAID, CLAUXID, AUXID, TMONID '
             + ' HAVING SUM( SALDMN13 )<>0 '
             + ' ORDER BY CUENTAID, CLAUXID, AUXID '
   Else
      xSQL := xSQL
             + 'SELECT CUENTAID, CLAUXID, AUXID, '' '' CCOSID, ''51'' DOCID, ''000'' CNTSERIE, '
             + '       ''SI0001'' CNTNODOC, ABS(SUM( CNTDEBEMN )) CNTDEBEMN, ABS(SUM( CNTHABEMN )) CNTHABEMN, '
             + '       SUM( SALDMN13 ) SALDMN13, ''S'' CTA_DOC, ''S'' CTA_AUX, ''N'' CTA_CCOS, MAX(CTA_ME) CTA_ME '
             + '  FROM (Select MOVS.CUENTAID, MOVS.CLAUXID, MOVS.AUXID, MOVS.CCOSID, '
             + '               MOVS.CNTDEBEMN, MOVS.CNTHABEMN, MOVS.SALDOACT SALDMN13, '
             + '               CTAS.CTA_MOV, CTAS.CTA_DOC, CTAS.CTA_AUX, CTA_CCOS, CTA_ME '
             + '          From (select CIAID, CUENTAID, CLAUXID, AUXID, CCOSID, '
             + '                       sum(CNTDEBEMN) CNTDEBEMN, sum(CNTHABEMN) CNTHABEMN, '
             + '                       sum(CNTDEBEMN)-sum(CNTHABEMN) SALDOACT '
             + '                  from (SELECT A.CIAID, A.CUENTAID, '
             + '                               CASE WHEN CTA_AUX=''S'' THEN ''C'' ELSE '''' END CLAUXID, '
             + '                               CASE WHEN CTA_AUX=''S'' THEN ''C9999'' ELSE '''' END AUXID, '
             + '                               CASE WHEN CTA_CCOS=''S'' THEN ''991502'' ELSE '''' END CCOSID, '
             + '                               NVL(CNTDEBEMN,0) CNTDEBEMN, NVL(CNTHABEMN,0) CNTHABEMN '
             + '                          FROM CNT301 A, TGE202 B '
             + '                         WHERE A.CIAID=' + quotedstr(dblcCia.value)
             + '                           and CNTANO=' + QuotedStr(xAnioAnt)
             + '                           and A.CUENTAID<''60'' '
             + '                           and A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID '
             + '                           and B.CTA_AUX=''S'' '
             + '                        ) DOCS '
             + '                 Group by CIAID, CUENTAID, CLAUXID, AUXID, CCOSID '
             + '                ) MOVS, TGE202 CTAS '
             + '         Where SALDOACT<>0 and CTAS.CIAID=MOVS.CIAID and CTAS.CUENTAID=MOVS.CUENTAID '
             + '           and CTAS.CTA_AUX=''S'' '
             + '         Order by MOVS.CUENTAID '
             + '        ) A '
             + ' GROUP BY CUENTAID, CLAUXID, AUXID '
             + ' HAVING SUM( SALDMN13 )<>0 '
             + ' ORDER BY CUENTAID ';
   DMCNT.cdsVariable.Close;
   DMCNT.cdsVariable.dataRequest(xSql);
   DMCNT.cdsVariable.Open;
   DMCNT.cdsVariable.First;
   xReg := 0;
   xgraba := 1;

   xSQL := 'select CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, '
         + '       CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, '
         + '       CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
         + '       CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, '
         + '       CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, '
         + '       FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
         + '       CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, '
         + '       CAMPOVAR, CNTTS, CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU '
         + '  from CNT311 '
         + ' Where CIAID=''' + dblcCia.Text + ''' '
         + '   and TDIARID=''' + dblcTDiarioAA.TEXT + ''' '
         + '   and CNTANOMM=''' + speAno.text + '00' + ''' '
         + '   and CNTCOMPROB=''' + dbeNoCompAA.Text + '''';
   DMCNT.cdsCNT311.Close;
   DMCNT.cdsCNT311.Datarequest(xSQL);
   DMCNT.cdsCNT311.open;

   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   While Not DMCNT.cdsVariable.Eof Do
   Begin
     // Revisar si Saldo de la cuenta es Cero
      xSQL := 'select CUENTAID, CTADES, '
            + '       SALDMN11 SALDMN, DEBEMN12 DEBEMN, HABEMN12 HABEMN, NVL(SALDMN11,0)+NVL(DEBEMN12,0)-NVL(HABEMN12,0) SALDO_MN, '
            + '       SALDME11 SALDME, DEBEME12 DEBEME, HABEME12 HABEME, NVL(SALDME11,0)+NVL(DEBEME12,0)-NVL(HABEME12,0) SALDO_ME '
            + '  From CNT401 '
            + ' Where CIAID=''' + dblcCia.Text + ''' '
            + '   and ANO=''' + IntToStr(speAno.Value - 1) + ''' '
            + '   and CUENTAID=''' + DMCNT.cdsVariable.FieldByName('CUENTAID').AsString + ''' AND TIPREG=''1''';
      DMCNT.cdsQry4.Close;
      DMCNT.cdsQry4.dataRequest(xSql);
      DMCNT.cdsQry4.Open;
      DMCNT.cdsQry4.First;

      If DMCNT.cdsQry4.FieldByname('SALDO_MN').AsFloat <> 0 Then
      Begin
         DMCNT.cdsCNT311.Insert;
         DMCNT.cdsCNT311.FieldByName('CIAID').AsString := dblcCia.value;
         DMCNT.cdsCNT311.FieldByName('TDIARID').AsString := dblcTDiarioAA.Value;
         DMCNT.cdsCNT311.FieldByName('CNTCOMPROB').AsString := dbeNoCompAA.Text; // '0000000001';
         DMCNT.cdsCNT311.FieldByName('CNTANO').AsString := speAno.text;
         DMCNT.cdsCNT311.FieldByName('CNTANOMM').AsString := speAno.text + '00';
         DMCNT.cdsCNT311.FieldByName('CNTLOTE').AsString := dbeLoteAA.Text; // '0000';
         DMCNT.cdsCNT311.FieldByName('CUENTAID').AsString := DMCNT.cdsVariable.FieldByName('CUENTAID').AsString;
         DMCNT.cdsCNT311.FieldByName('CLAUXID').AsString := DMCNT.cdsVariable.FieldByName('CLAUXID').AsString;
         DMCNT.cdsCNT311.FieldByName('AUXID').AsString := DMCNT.cdsVariable.FieldByName('AUXID').AsString;

         If (DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat > 0) Or
            (DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat > 0) Then
         Begin
           //Documento Id
            If DMCNT.cdsVariable.FieldByName('CTA_DOC').AsString = 'S' Then
            Begin
              //Documento Id
               If TRIM(DMCNT.cdsVariable.FieldByName('DOCID').AsString) = '' Then
                  DMCNT.cdsCNT311.FieldByName('DOCID').AsString := '23'
               Else
                  DMCNT.cdsCNT311.FieldByName('DOCID').AsString := DMCNT.cdsVariable.FieldByName('DOCID').AsString;

              //Serie
               If TRIM(DMCNT.cdsVariable.FieldByName('CNTSERIE').AsString) = '' Then
                  DMCNT.cdsCNT311.FieldByName('CNTSERIE').AsString := '000'
               Else
                  DMCNT.cdsCNT311.FieldByName('CNTSERIE').AsString := DMCNT.cdsVariable.FieldByName('CNTSERIE').AsString;

              //Numero
               If TRIM(DMCNT.cdsVariable.FieldByName('CNTNODOC').AsString) = '' Then
                  DMCNT.cdsCNT311.FieldByName('CNTNODOC').AsString := '0000000001'
               Else
                  DMCNT.cdsCNT311.FieldByName('CNTNODOC').AsString := DMCNT.cdsVariable.FieldByName('CNTNODOC').AsString;
            End
            Else
            Begin
               DMCNT.cdsCNT311.FieldByName('DOCID').AsString := '';
               DMCNT.cdsCNT311.FieldByName('CNTSERIE').AsString := '';
               DMCNT.cdsCNT311.FieldByName('CNTNODOC').AsString := '';
            End;

            DMCNT.cdsCNT311.FieldByName('CNTFEMIS').AsDateTime := StrToDate('01/01/' + speAno.text);
            DMCNT.cdsCNT311.FieldByName('CNTFVCMTO').AsDateTime := StrToDate('01/01/' + speAno.text);
            DMCNT.cdsCNT311.FieldByName('CNTFCOMP').AsDateTime := StrToDate('01/01/' + speAno.text);

            If DMCNT.cdsVariable.FieldByName('CTA_ME').AsString = 'S' Then
            Begin
               If DMCNT.cdsVariable.FieldByName('TMONID').AsString = xTMonExt Then
               Begin
                  DMCNT.cdsCNT311.FieldByName('TMONID').AsString := xTMonExt;
                  If DMCNT.cdsVariable.FieldByName('CNTDEBEME').AsFloat > DMCNT.cdsVariable.FieldByName('CNTHABEME').AsFloat Then
                  Begin
                     DMCNT.cdsCNT311.FieldByName('CNTDH').AsString := 'D';
                     DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat := DMCNT.cdsVariable.FieldByName('CNTDEBEME').AsFloat - DMCNT.cdsVariable.FieldByName('CNTHABEME').AsFloat;
                     DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat := DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat;
                     DMCNT.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat := (DMCNT.cdsVariable.FieldByName('CNTDEBEME').AsFloat - DMCNT.cdsVariable.FieldByName('CNTHABEME').AsFloat);
                     DMCNT.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat := DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat;
                     DMCNT.cdsCNT311.FieldByName('CNTDEBEME').Asfloat := (DMCNT.cdsVariable.FieldByName('CNTDEBEME').AsFloat - DMCNT.cdsVariable.FieldByName('CNTHABEME').AsFloat);
                  End
                  Else
                  Begin
                     DMCNT.cdsCNT311.FieldByName('CNTDH').AsString := 'H';
                     DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat := DMCNT.cdsVariable.FieldByName('CNTHABEME').AsFloat - DMCNT.cdsVariable.FieldByName('CNTDEBEME').AsFloat;
                     If (DMCNT.cdsVariable.FieldByName('CNTHABEME').AsFloat = 0) And (DMCNT.cdsVariable.FieldByName('CNTDEBEME').AsFloat = 0) Then
                     Begin
                        DMCNT.cdsCNT311.FieldByName('TMONID').AsString := xTMonLoc;
                        If DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat > DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat Then
                        Begin
                           DMCNT.cdsCNT311.FieldByName('CNTDH').AsString := 'D';
                           DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat := DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat
                        End
                        Else
                           DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat := DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat;
                     End;

                     DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat := ABS(DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat);
                     DMCNT.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat := (DMCNT.cdsVariable.FieldByName('CNTHABEME').AsFloat - DMCNT.cdsVariable.FieldByName('CNTDEBEME').AsFloat);
                     If DMCNT.cdsCNT311.FieldByName('CNTDH').AsString = 'H' Then
                     Begin
                        DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat := DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat;
                        If DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat < 0 Then DMCNT.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat := DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat * (-1);
                        If DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat < 0 Then DMCNT.cdsCNT311.FieldByName('CNTDH').AsString := 'D';
                        If DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat < 0 Then DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat := 0;
                        DMCNT.cdsCNT311.FieldByName('CNTHABEME').Asfloat := (DMCNT.cdsVariable.FieldByName('CNTHABEME').AsFloat - DMCNT.cdsVariable.FieldByName('CNTDEBEME').AsFloat);
                     End
                     Else
                     Begin
                        DMCNT.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat := DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat;
                        If DMCNT.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat < 0 Then DMCNT.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat := DMCNT.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat * (-1);
                        DMCNT.cdsCNT311.FieldByName('CNTDEBEME').Asfloat := (DMCNT.cdsVariable.FieldByName('CNTHABEME').AsFloat - DMCNT.cdsVariable.FieldByName('CNTDEBEME').AsFloat);
                     End;
                  End;
               End
               Else
               Begin
                  DMCNT.cdsCNT311.FieldByName('TMONID').AsString := xTMonLoc;
                  If DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat > DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat Then
                  Begin
                     DMCNT.cdsCNT311.FieldByName('CNTDH').AsString := 'D';
                     DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat := DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat;
                     DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat := DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat;
                     DMCNT.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat := 0;
                     DMCNT.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat := DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat;
                     DMCNT.cdsCNT311.FieldByName('CNTDEBEME').Asfloat := 0;
                  End
                  Else
                  Begin
                     DMCNT.cdsCNT311.FieldByName('CNTDH').AsString := 'H';
                     DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat := DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat;
                     DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat := DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat;
                     DMCNT.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat := 0;
                     DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat := DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat;
                     DMCNT.cdsCNT311.FieldByName('CNTHABEME').Asfloat := 0;
                  End;
               End;
            End
            Else
            Begin
               DMCNT.cdsCNT311.FieldByName('TMONID').AsString := xTMonLoc;
               If DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat > DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat Then
               Begin
                  DMCNT.cdsCNT311.FieldByName('CNTDH').AsString := 'D';
                  DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat := DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat;
                  DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat := DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat;
                  DMCNT.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat := DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat / StrToFloat(xTcambio);
                  DMCNT.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat := DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat;
                  DMCNT.cdsCNT311.FieldByName('CNTDEBEME').Asfloat := DMCNT.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat / StrToFloat(xTCambio);
               End
               Else
               Begin
                  DMCNT.cdsCNT311.FieldByName('CNTDH').AsString := 'H';
                  DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat := DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat;
                  DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat := DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat;
                  DMCNT.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat := DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat / StrToFloat(xTcambio);
                  DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat := DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat - DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat;
                  If DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat < 0 Then DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat := DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat * (-1);
                  DMCNT.cdsCNT311.FieldByName('CNTHABEME').Asfloat := DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat / StrToFloat(xTCambio);
               End;
            End;
         End
         Else
         Begin
            If DMCNT.cdsVariable.FieldByName('CTA_DOC').AsString = 'S' Then
            Begin
              //Documento Id
               If Trim(DMCNT.cdsVariable.FieldByName('DOCID').AsString) = '' Then
                  DMCNT.cdsCNT311.FieldByName('DOCID').AsString := '23'
               Else
                  DMCNT.cdsCNT311.FieldByName('DOCID').AsString := DMCNT.cdsVariable.FieldByName('DOCID').AsString;

              //Serie
               If TRIM(DMCNT.cdsVariable.FieldByName('CNTSERIE').AsString) = '' Then
                  DMCNT.cdsCNT311.FieldByName('CNTSERIE').AsString := '000'
               Else
                  DMCNT.cdsCNT311.FieldByName('CNTSERIE').AsString := DMCNT.cdsVariable.FieldByName('CNTSERIE').AsString;

              //Numero
               If TRIM(DMCNT.cdsVariable.FieldByName('CNTNODOC').AsString) = '' Then
                  DMCNT.cdsCNT311.FieldByName('CNTNODOC').AsString := '0000000001'
               Else
                  DMCNT.cdsCNT311.FieldByName('CNTNODOC').AsString := DMCNT.cdsVariable.FieldByName('CNTNODOC').AsString;
            End
            Else
            Begin
               DMCNT.cdsCNT311.FieldByName('DOCID').AsString := '';
               DMCNT.cdsCNT311.FieldByName('CNTSERIE').AsString := '';
               DMCNT.cdsCNT311.FieldByName('CNTNODOC').AsString := '';
            End;

            DMCNT.cdsCNT311.FieldByName('CNTFEMIS').AsDateTime := StrToDate('01/01/' + speAno.text);
            DMCNT.cdsCNT311.FieldByName('CNTFVCMTO').AsDateTime := StrToDate('01/01/' + speAno.text);
            DMCNT.cdsCNT311.FieldByName('CNTFCOMP').AsDateTime := StrToDate('01/01/' + speAno.text);

            If DMCNT.cdsVariable.FieldByName('SALDMN13').AsFloat > 0 Then
               DMCNT.cdsCNT311.FieldByName('CNTDH').AsString := 'D'
            Else
               DMCNT.cdsCNT311.FieldByName('CNTDH').AsString := 'H';

            If DMCNT.cdsVariable.FieldByName('SALDMN13').AsFloat < 0 Then
               DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat := (-1) * (DMCNT.cdsVariable.FieldByName('SALDMN13').AsFloat)
            Else
               DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat := DMCNT.cdsVariable.FieldByName('SALDMN13').AsFloat;

            If DMCNT.cdsVariable.FieldByName('SALDMN13').AsFloat < 0 Then
               DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat := (-1) * DMCNT.cdsVariable.FieldByName('SALDMN13').AsFloat
            Else
               DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat := DMCNT.cdsVariable.FieldByName('SALDMN13').AsFloat;

            If DMCNT.cdsVariable.FieldByName('SALDMN13').AsFloat < 0 Then
               DMCNT.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat := (-1) * (DMCNT.cdsVariable.FieldByName('SALDMN13').AsFloat) / StrToFloat(xTcambio) //cdsVariable.FieldByName('SALDME12').AsFloat;
            Else
               DMCNT.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat := DMCNT.cdsVariable.FieldByName('SALDMN13').AsFloat / StrToFloat(xTcambio); //cdsVariable.FieldByName('SALDME12').AsFloat;

            If DMCNT.cdsVariable.FieldByName('SALDMN13').AsFloat > 0 Then
            Begin
               DMCNT.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat := DMCNT.cdsVariable.FieldByName('SALDMN13').AsFloat;
               DMCNT.cdsCNT311.FieldByName('CNTDEBEME').Asfloat := DMCNT.cdsVariable.FieldByName('SALDMN13').AsFloat / StrToFloat(xTCambio);
            End
            Else
            Begin
               DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat := (-1) * DMCNT.cdsVariable.FieldByName('SALDMN13').AsFloat;
               DMCNT.cdsCNT311.FieldByName('CNTHABEME').AsFloat := (-1) * (DMCNT.cdsVariable.FieldByName('SALDMN13').AsFloat) / StrToFloat(xTCambio);
            End;
         End;

         DMCNT.cdsCNT311.FieldByName('CNTGLOSA').AsString := edtGlosaAA.text;
         DMCNT.cdsCNT311.FieldByName('CCOSID').AsString := DMCNT.cdsVariable.FieldByName('CCOSID').AsString;
         DMCNT.cdsCNT311.FieldByName('CNTTCAMBIO').AsString := xTcambio;
         DMCNT.cdsCNT311.FieldByName('CNTESTADO').AsString := 'I';
         DMCNT.cdsCNT311.FieldByName('CNTCUADRE').Clear;
         DMCNT.cdsCNT311.FieldByName('CNTFAUTOM').Clear;
         DMCNT.cdsCNT311.FieldByName('CNTUSER').AsString := DMCNT.wUsuario;
         DMCNT.cdsCNT311.FieldByName('CNTFREG').AsDateTime := date;
         DMCNT.cdsCNT311.FieldByName('CNTHREG').AsDateTime := time;
         DMCNT.cdsCNT311.FieldByName('CNTMM').AsString := xMM;
         DMCNT.cdsCNT311.FieldByName('CNTDD').AsString := xDD;
         DMCNT.cdsCNT311.FieldByName('CNTTRI').AsString := xTRI;
         DMCNT.cdsCNT311.FieldByName('CNTSEM').AsString := xSEM;
         DMCNT.cdsCNT311.FieldByName('CNTSS').AsString := xSS;
         DMCNT.cdsCNT311.FieldByName('CNTAATRI').AsString := xAATRI;
         DMCNT.cdsCNT311.FieldByName('CNTAASEM').AsString := xAASEM;
         DMCNT.cdsCNT311.FieldByName('CNTAASS').AsString := xAASS;
         DMCNT.cdsCNT311.FieldByName('FLAGVAR').Clear;
         DMCNT.cdsCNT311.FieldByName('FCONS').Clear;
         DMCNT.cdsCNT311.FieldByName('CNTFMEC').Clear;
         DMCNT.cdsCNT311.FieldByName('TDIARDES').AsString := edtTDiarioAA.text;
         xWhere := 'CIAID=' + quotedstr(dblcCia.value) + ' AND CUENTAID=' + quotedstr(DMCNT.cdsVariable.FieldByName('CUENTAID').AsString);
         DMCNT.cdsCNT311.FieldByName('CTADES').AsString := DisplayDescrip('prvTGE', 'TGE202', 'CTADES', xWhere, 'CTADES');
         DMCNT.cdsCNT311.FieldByName('AUXDES').Clear;
         xWhere := 'CCOSID=' + quotedstr(DMCNT.cdsVariable.FieldByName('CCOSID').AsString);
         DMCNT.cdsCNT311.FieldByName('CCOSDES').AsString := DisplayDescrip('prvTGE', 'TGE203', 'CCOSDES', xWhere, 'CCOSDES');

         If DMCNT.cdsVariable.FieldByName('CTA_DOC').AsString = 'S' Then
            DMCNT.cdsCNT311.FieldByName('DOCDES').AsString := DisplayDescrip('prvTGE', 'TGE110', 'DOCDES', 'DOCID=' + quotedstr('23'), 'DOCDES')
         Else
            DMCNT.cdsCNT311.FieldByName('DOCDES').Clear;

         DMCNT.cdsCNT311.FieldByName('CNTSALDMN').Clear;
         DMCNT.cdsCNT311.FieldByName('CNTSALDME').Clear;
         DMCNT.cdsCNT311.FieldByName('CAMPOVAR').Clear;
         DMCNT.cdsCNT311.FieldByName('CNTTS').AsString := 'BV';
         DMCNT.cdsCNT311.FieldByName('CNTPAGADO').Clear;
         DMCNT.cdsCNT311.FieldByName('CNTMODDOC').AsString := 'CNT';
         xReg := xReg + 1;
         DMCNT.cdsCNT311.FieldByName('CNTREG').AsFloat := xReg;
         DMCNT.cdsCNT311.FieldByName('MODULO').AsString := 'CNT';
         If DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat <> 0 Then
            xgraba := xgraba + 1
         Else
         Begin
            If (DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat = 0) And (DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat > 0) Then
               xgraba := xgraba + 1
            Else
            Begin
               DMCNT.cdsCNT311.Delete;
               xReg := xReg - 1;
            End;
         End;

         xSQL := 'Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, ' // 6
               + '                   CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, ' // 12
               + '                   CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, '
               + '                   CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, '
               + '                   CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, '
               + '                   CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
               + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, '
               + '                   CCOSDES, DOCDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
               + '                   CNTSALDMN, CNTSALDME, '
               + '                   CAMPOVAR, CNTTS, CNTPAGADO, CNTMODDOC, CNTREG, MODULO) '
               + 'values ('
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CIAID').AsString)+', ' //1
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('TDIARID').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTCOMPROB').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTANO').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTANOMM').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTLOTE').AsString)+', '  //6
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CUENTAID').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CLAUXID').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('AUXID').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('DOCID').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTSERIE').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTNODOC').AsString)+', ' // 12
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTGLOSA').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTDH').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CCOSID').AsString)+', '
               +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTTCAMBIO').AsFloat)+', '
               +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat)+', '
               +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat)+', '
               +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat)+', '
               +           quotedstr(datetostr(DMCNT.cdsCNT311.FieldByName('CNTFEMIS').AsDateTime))+', '
               +           quotedstr(datetostr(DMCNT.cdsCNT311.FieldByName('CNTFVCMTO').AsDateTime))+', '
               +           quotedstr(datetostr(DMCNT.cdsCNT311.FieldByName('CNTFCOMP').AsDateTime))+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTESTADO').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTCUADRE').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTFAUTOM').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTUSER').AsString)+', '
               +           ' trunc(sysdate), '
               +           ' sysdate, '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTMM').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTDD').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTTRI').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTSEM').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTSS').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTAATRI').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTAASEM').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTAASS').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('TMONID').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('FLAGVAR').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('FCONS').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTFMEC').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('TDIARDES').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CTADES').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('AUXDES').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CCOSDES').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('DOCDES').AsString)+', '
               +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat)+', '
               +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTDEBEME').AsFloat)+', '
               +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat)+', '
               +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTHABEME').Asfloat)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTSALDMN').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTSALDME').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CAMPOVAR').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTTS').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTPAGADO').AsString)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTMODDOC').AsString)+', '
               +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTREG').AsFloat)+', '
               +           quotedstr(DMCNT.cdsCNT311.FieldByName('MODULO').AsString)+') ';
         Try
            DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error al momento de grabar Detalle de Asiento Contable');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      End;
      DMCNT.cdsVariable.Next;
   End;

// Genera Cabecera de Contabilidad
   xSQL := ' Insert into '
         + '        CNT300(CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTGLOSA, CNTTCAMBIO, '
         + '               CNTFCOMP, CNTESTADO, CNTCUADRE, CNTUSER, CNTFREG, CNTHREG, '
         + '               CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, '
         + '               CNTAASS, TMONID, FLAGVAR, TDIARDES, '
         + '               CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTTS, DOCMOD, MODULO ) '
         + ' select A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,A.CNTGLOSA, A.CNTTCAMBIO, '
         + '        A.CNTFCOMP,A.CNTESTADO,A.CNTCUADRE,'+quotedstr('ASANTANDER')+', trunc(sysdate), sysdate, '
         + '        A.CNTANO,A.CNTMM,A.CNTDD,A.CNTTRI,A.CNTSEM,A.CNTSS,A.CNTAATRI,A.CNTAASEM, '
         + '        A.CNTAASS, ''N'' TMONID, A.FLAGVAR, A.TDIARDES,'
         + '        case when sum(A.CNTDEBEMN)>0 then sum(A.CNTDEBEMN) else sum(A.CNTDEBEMN)*-1 end,'
         + '        case when sum(A.CNTDEBEME)>0 then sum(A.CNTDEBEME) else sum(A.CNTDEBEME)*-1 end,'
         + '        case when sum(A.CNTHABEMN)>0 then sum(A.CNTHABEMN) else sum(A.CNTHABEMN)*-1 end,'
         + '        case when sum(A.CNTHABEME)>0 then sum(A.CNTHABEME) else sum(A.CNTHABEME)*-1 end,'
         + '        A.CNTTS, A.CNTMODDOC, ''CNT'' MODULO '
         + '   from CNT311 A '
         + '  where A.CIAID=' + quotedstr(dblcCia.value)
         + '    and A.TDIARID=' + quotedstr(dblcTDiarioAA.Value)
         + '    and A.CNTANOMM=' + quotedstr(speAno.text) + '||' + quotedstr('00')
         + '    and A.CNTCOMPROB=' + quotedstr(dbeNoCompAA.Text)
         + '  group by A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,A.CNTGLOSA,A.CNTTCAMBIO,'
         + '           A.CNTFCOMP,A.CNTESTADO,A.CNTCUADRE,'
         + '           A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI,  '
         + '           A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, '
         + '           A.TDIARDES, A.FLAGVAR, A.CNTTS, A.CNTMODDOC';
   Try
      DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al grabar la Cabecera del Asiento de Apertura');
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
      Exit;
   End;

//** calculo la cuenta 591
   xSql := 'Select sum(CNTDEBEMN)-sum(CNTHABEMN) DIFEMN, '
         + '       sum(CNTDEBEME)-sum(CNTHABEME) DIFEME '
         + '  From CNT300 '
         + ' Where CIAID=' + quotedstr(dblcCia.value)
         + '   and TDIARID=' + quotedstr(dblcTDiarioAA.Value)
         + '   and CNTANOMM=' + quotedstr(speAno.text) + '||' + quotedstr('00')
         + '   and CNTCOMPROB=' + quotedstr(dbeNoCompAA.Text);
   DMCNT.cdsVariable.Close;
   DMCNT.cdsVariable.dataRequest(xSql);
   DMCNT.cdsVariable.Open;
   DMCNT.cdsVariable.First;
   xSuma := DMCNT.cdsVariable.FieldByName('DIFEMN').AsFloat;
   xSumaME := DMCNT.cdsVariable.FieldByName('DIFEME').AsFloat;

   If xSuma <> 0 Then
   Begin
      DMCNT.cdsCNT311.Insert;
      DMCNT.cdsCNT311.FieldByName('CIAID').AsString := dblcCia.value;
      DMCNT.cdsCNT311.FieldByName('TDIARID').AsString := dblcTDiarioAA.Value;
      DMCNT.cdsCNT311.FieldByName('CNTCOMPROB').AsString := dbeNoCompAA.Text; //000000001';
      DMCNT.cdsCNT311.FieldByName('CNTANO').AsString := speAno.text;
      DMCNT.cdsCNT311.FieldByName('CNTANOMM').AsString := speAno.text + '00';
      DMCNT.cdsCNT311.FieldByName('CNTLOTE').AsString := '0000';
      DMCNT.cdsCNT311.FieldByName('CUENTAID').AsString := '591';
      DMCNT.cdsCNT311.FieldByName('CLAUXID').AsString := '';
      DMCNT.cdsCNT311.FieldByName('AUXID').AsString := '';
      DMCNT.cdsCNT311.FieldByName('DOCID').AsString := '23';
      DMCNT.cdsCNT311.FieldByName('CNTSERIE').AsString := '000';
      DMCNT.cdsCNT311.FieldByName('CNTNODOC').AsString := '0000000001';
      DMCNT.cdsCNT311.FieldByName('CNTGLOSA').AsString := edtGlosaAA.text;
   // aca es contrario a los otros procesos
      If xSuma > 0 Then
         DMCNT.cdsCNT311.FieldByName('CNTDH').AsString := 'H'
      Else
         DMCNT.cdsCNT311.FieldByName('CNTDH').AsString := 'D';

      DMCNT.cdsCNT311.FieldByName('CCOSID').AsString := '';
      DMCNT.cdsCNT311.FieldByName('CNTTCAMBIO').AsString := xTcambio;

      If xSuma < 0 Then
         DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat := (-1) * (xSuma)
      Else
         DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat := xSuma;
      If xSuma < 0 Then
         DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat := (-1) * xSuma
      Else
         DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat := xSuma;
      If xSuma < 0 Then
         DMCNT.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat := (-1) * xSumaME
      Else
         DMCNT.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat := xSumaME;

      DMCNT.cdsCNT311.FieldByName('CNTFEMIS').AsDateTime := StrToDate('01/01/' + speAno.text);
      DMCNT.cdsCNT311.FieldByName('CNTFVCMTO').AsDateTime := StrToDate('01/01/' + speAno.text);
      DMCNT.cdsCNT311.FieldByName('CNTFCOMP').AsDateTime := StrToDate('01/01/' + speAno.text);
      DMCNT.cdsCNT311.FieldByName('CNTESTADO').AsString := 'I';
      DMCNT.cdsCNT311.FieldByName('CNTCUADRE').Clear;
      DMCNT.cdsCNT311.FieldByName('CNTFAUTOM').Clear;
      DMCNT.cdsCNT311.FieldByName('CNTUSER').AsString := DMCNT.wUsuario;
      DMCNT.cdsCNT311.FieldByName('CNTFREG').AsDateTime := date;
      DMCNT.cdsCNT311.FieldByName('CNTHREG').AsDateTime := time;
      DMCNT.cdsCNT311.FieldByName('CNTMM').AsString := xMM;
      DMCNT.cdsCNT311.FieldByName('CNTDD').AsString := xDD;
      DMCNT.cdsCNT311.FieldByName('CNTTRI').AsString := xTRI;
      DMCNT.cdsCNT311.FieldByName('CNTSEM').AsString := xSEM;
      DMCNT.cdsCNT311.FieldByName('CNTSS').AsString := xSS;
      DMCNT.cdsCNT311.FieldByName('CNTAATRI').AsString := xAATRI;
      DMCNT.cdsCNT311.FieldByName('CNTAASEM').AsString := xAASEM;
      DMCNT.cdsCNT311.FieldByName('CNTAASS').AsString := xAASS;
      DMCNT.cdsCNT311.FieldByName('TMONID').AsString := xTMonLoc;
      DMCNT.cdsCNT311.FieldByName('FLAGVAR').Clear;
      DMCNT.cdsCNT311.FieldByName('FCONS').Clear;
      DMCNT.cdsCNT311.FieldByName('CNTFMEC').Clear;
      DMCNT.cdsCNT311.FieldByName('TDIARDES').AsString := edtTDiarioAA.text;
      xWhere := 'CIAID=' + quotedstr(dblcCia.value) + ' AND CUENTAID=' + quotedstr('598');
      DMCNT.cdsCNT311.FieldByName('CTADES').AsString := DisplayDescrip('prvTGE', 'TGE202', 'CTADES', xWhere, 'CTADES');
      DMCNT.cdsCNT311.FieldByName('AUXDES').Clear;
      DMCNT.cdsCNT311.FieldByName('CCOSDES').Clear;
      DMCNT.cdsCNT311.FieldByName('DOCDES').AsString := DisplayDescrip('prvTGE', 'TGE110', 'DOCDES', 'DOCID=' + quotedstr('23'), 'DOCDES');
      // aca es contrario a los otros procesos
      If xSuma > 0 Then
      Begin
         DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat := xSuma;
         DMCNT.cdsCNT311.FieldByName('CNTHABEME').Asfloat := xSumaME;
      End
      Else
      Begin
         DMCNT.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat := (-1) * xSuma;
         DMCNT.cdsCNT311.FieldByName('CNTDEBEME').AsFloat := (-1) * xSumaME;
      End;
      DMCNT.cdsCNT311.FieldByName('CNTSALDMN').AsString := '';
      DMCNT.cdsCNT311.FieldByName('CNTSALDME').AsString := '';
      DMCNT.cdsCNT311.FieldByName('CAMPOVAR').AsString := '';
      DMCNT.cdsCNT311.FieldByName('CNTTS').AsString := 'BV';
      DMCNT.cdsCNT311.FieldByName('CNTPAGADO').AsString := '';
      DMCNT.cdsCNT311.FieldByName('CNTMODDOC').AsString := 'CNT';
      xReg := xReg + 1;
      DMCNT.cdsCNT311.FieldByName('CNTREG').AsFloat := xReg;
      DMCNT.cdsCNT311.FieldByName('MODULO').AsString := 'CNT';
      DMCNT.cdsCNT311.Post;

      xSQL := 'Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, '
            + '                   CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, '
            + '                   CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, '
            + '                   CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, '
            + '                   CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, '
            + '                   CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
            + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, '
            + '                   CCOSDES, DOCDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
            + '                   CNTSALDMN, CNTSALDME, '
            + '                   CAMPOVAR, CNTTS, CNTPAGADO, CNTMODDOC, CNTREG, MODULO) '
            + 'values ('
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CIAID').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('TDIARID').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTCOMPROB').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTANO').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTANOMM').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTLOTE').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CUENTAID').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CLAUXID').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('AUXID').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('DOCID').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTSERIE').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTNODOC').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTGLOSA').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTDH').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CCOSID').AsString)+', '
            +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTTCAMBIO').AsFloat)+', '
            +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat)+', '
            +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat)+', '
            +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat)+', '
            +           quotedstr(datetostr(DMCNT.cdsCNT311.FieldByName('CNTFEMIS').AsDateTime))+', '
            +           quotedstr(datetostr(DMCNT.cdsCNT311.FieldByName('CNTFVCMTO').AsDateTime))+', '
            +           quotedstr(datetostr(DMCNT.cdsCNT311.FieldByName('CNTFCOMP').AsDateTime))+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTESTADO').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTCUADRE').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTFAUTOM').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTUSER').AsString)+', '
            +           ' trunc(sysdate), '
            +           ' sysdate, '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTMM').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTDD').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTTRI').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTSEM').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTSS').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTAATRI').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTAASEM').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTAASS').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('TMONID').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('FLAGVAR').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('FCONS').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTFMEC').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('TDIARDES').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CTADES').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('AUXDES').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CCOSDES').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('DOCDES').AsString)+', '
            +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat)+', '
            +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTDEBEME').AsFloat)+', '
            +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat)+', '
            +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTHABEME').Asfloat)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTSALDMN').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTSALDME').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CAMPOVAR').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTTS').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTPAGADO').AsString)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('CNTMODDOC').AsString)+', '
            +           floattostr(DMCNT.cdsCNT311.FieldByName('CNTREG').AsFloat)+', '
            +           quotedstr(DMCNT.cdsCNT311.FieldByName('MODULO').AsString)+') ';
      Try
         DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al grabar la Cuenta 59 del Asiento de Apertura');
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;

   // actualizo nuevamente la cabecera con la diferencia
      xSql := ' Select CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTLOTE, CNTGLOSA, '
            + '       CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
            + '       CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
            + '       CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
            + '       TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, '
            + '       CNTSALDME, CNTTS, DOCMOD, MODULO '
            + '   from CNT300 '
            + '  where CIAID=' + quotedstr(dblcCia.value)
            + '    and TDIARID=' + quotedstr(dblcTDiarioAA.Value)
            + '    and CNTANOMM=' + quotedstr(speAno.text) + '||' + quotedstr('00')
            + '    and CNTCOMPROB=' + quotedstr(dbeNoCompAA.Text);
      DMCNT.cdsVariable.Close;
      DMCNT.cdsVariable.dataRequest(xSql);
      DMCNT.cdsVariable.Open;
   // acá es contrario a los otros procesos
      If xSuma > 0 Then
      Begin
         xSql := 'Update CNT300 '
               + '   set CNTHABEMN='+FloatToStr(DMCNT.cdsVariable.FieldByName('CNTHABEMN').AsFloat + xSuma)+', '
               + '       CNTHABEME='+FloatToStr(DMCNT.cdsVariable.FieldByName('CNTHABEME').AsFloat + xSumaME);
      End
      Else
      Begin
         xSql := 'Update CNT300 '
               + '   SET CNTDEBEMN='+FloatToStr(DMCNT.cdsVariable.FieldByName('CNTDEBEMN').AsFloat + (xSuma*-1))+', '
               + '       CNTDEBEME='+FloatToStr(DMCNT.cdsVariable.FieldByName('CNTDEBEME').AsFloat + (xSumaME));
      End;

      Try
         xSql := xSql
               + ' where CIAID=' + quotedstr(dblcCia.value)
               + '   and TDIARID=' + quotedstr(dblcTDiarioAA.Value)
               + '   and CNTANOMM=' + quotedstr(speAno.text) + '||' + quotedstr('00')
               + '   and CNTCOMPROB=' + quotedstr(dbeNoCompAA.Text);
         DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al grabar los Totales del Asiento de Apertura');
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End;
   DMCNT.DCOM1.AppServer.GrabaTransaccion;
   Screen.Cursor := crDefault;
   Showmessage(' Terminó el Proceso de Apertura para la Cia.:' + edtCia.text);
End;

Function TFApertura.DisplayDescrip(wPrv, wTabla, wCampos, wWhere, wResult: String): String;
Var
   xSQL: String;
Begin
   xSQL := '';
   xSQL := 'select ' + wCampos + ' from ' + wTabla;
   If length(wWhere) > 0 Then xSQL := xSQL + ' where ' + wWhere;
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   result := DMCNT.cdsQry.FieldByName(wResult).Asstring;
End;

Procedure TFApertura.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;

End;

Procedure TFApertura.bbtnMovClick(Sender: TObject);
Var
   xSQL, xAnioAnt: String;
Begin
   If dblcCia.Text = '' Then
   Begin
      dblcCia.SetFocus;
      ShowMessage('Tiene que Ingresar Compañía');
      Exit;
   End;

   Screen.Cursor := crHourGlass;
   //Falta compilar el data modulo
   // crear el Reporte de Inconsistencia
   //** Paso 2, tomo el T. de Cambio al 31 del año anterior
   xAnioAnt := IntToStr(StrToInt(speAno.text) - 1);

   xSQL := 'SELECT A.CIAID, '+quotedstr(edtCia.Text)+' CIADES, '
         + '       A.CUENTAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, '
         + '       NVL(A.CNTDEBEMN,0) CNTDEBEMN, NVL(A.CNTHABEMN,0) CNTHABEMN, '
         + '       NVL(A.CNTDEBEMN,0)-NVL(A.CNTHABEMN,0) SALDO, '
         + '       B.CTA_AUX, A.AUXID, B.CTA_CCOS, A.CCOSID, B.CTA_DOC, CNTNODOC,  '
         + '       CASE WHEN B.CUENTAID IS NULL OR B.CUENTAID='''' THEN ''NO EXISTE'' ELSE '' '' END NOCUENTA '
         + '  FROM CNT301 A, TGE202 B '
         + ' WHERE A.CIAID=''' + dblcCia.Text + ''' '
         + '   and CNTANOMM>=''' + xAnioAnt + '00'' AND CNTANOMM<=''' + xAnioAnt + '12'' '
         + '   and A.CUENTAID<''60'' '
         + '   and A.CIAID=B.CIAID(+) AND A.CUENTAID=B.CUENTAID(+) '
         + '   and '
         + '   ( '
         + '   ( B.CTA_AUX=''S'' AND ( NVL(AUXID,''nulo'')=''nulo'' or AUXID='''' ) ) '
         + '   OR '
         + '   ( B.CTA_CCOS=''S'' AND ( NVL(CCOSID,''nulo'')=''nulo'' or CCOSID='''' ) ) '
         + '   OR '
         + '   ( B.CUENTAID IS NULL OR B.CUENTAID='''' ) '
         + '    ) '
         + ' Order by CIAID, CUENTAID, CNTANOMM, TDIARID, CNTCOMPROB';
   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.dataRequest(xSql);
   DMCNT.cdsConsistencia.Open;

   If DMCNT.cdsConsistencia.RecordCount <= 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existen Inconsistencias');
      Exit;
   End;
   pprInc.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ConsistenciaApertura.rtm';
   pprInc.Template.LoadFromFile;
   ppdbInc.DataSource := DMCNT.dsConsistencia;
   Screen.Cursor := crDefault;
   If cbDisenoRep.Checked Then
      ppdInc.ShowModal
   Else
   Begin
      pprInc.Print;
      pprInc.Stop;
      ppdbInc.DataSource := Nil;
   End;
End;

Procedure TFApertura.bbtnPlanClick(Sender: TObject);
Var
   xSQL, xAnioAnt: String;
Begin
   If dblcCia.Text = '' Then
   Begin
      dblcCia.SetFocus;
      ShowMessage('Tiene que Ingresar Compañía');
      Exit;
   End;

   Screen.Cursor := crHourGlass;

   xAnioAnt := IntToStr(StrToInt(speAno.text) - 1);

   xSQL := 'Select A.CIAID, A.CUENTAID, A.CTA_CONSOL, A.CTA_DET, B.CTA_DET CTA_DET01, '
         + '       A.CTA_AUX, B.CTA_AUX CTA_AUX01, A.CTA_CCOS, B.CTA_CCOS CTA_CCOS01, '
         + '       A.CTA_DOC, B.CTA_DOC CTA_DOC01, ''' + edtCia.Text + ''' CIADES, C.MOV, '
         + '       ''COLUMNA 2 ES COMPAÑIA CONSOLIDADA'' OBSERVA, '
         + '       CASE WHEN B.CUENTAID IS NULL OR B.CUENTAID='''' THEN ''NO EXISTE'' ELSE '' '' END NOCUENTA '
         + '  from TGE202 A, TGE202 B, '
         + '      (SELECT CIAID, CUENTAID, ''MOV'' MOV '
         + '         FROM CNT301 '
         + '        WHERE CIAID=''' + dblcCia.Text + ''' AND CNTANOMM LIKE ''' + xAnioAnt + '%'' '
         + '        GROUP BY CIAID, CUENTAID ) C '
         + ' where A.CIAID=''' + dblcCia.Text + ''' '
         + '   and B.CIAID(+)=''01'' AND A.CUENTAID=B.CUENTAID(+) '
         + '   and (NVL(A.CTA_DET, '''' )<>NVL( B.CTA_DET, '''' ) '
         + '     or NVL( A.CTA_AUX, '''' )<>NVL( B.CTA_AUX, '''' ) '
         + '     or NVL( A.CTA_CCOS,'''' )<>NVL( B.CTA_CCOS,'''' ) '
         + '     or NVL( A.CTA_DOC, '''' )<>NVL( B.CTA_DOC, '''' ) '
         + '     or ( B.CUENTAID IS NULL OR B.CUENTAID='''' ) ) '
         + '   and A.CIAID=C.CIAID(+) and A.CUENTAID=C.CUENTAID(+) '
         + ' order by A.CUENTAID';
   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.dataRequest(xSql);
   DMCNT.cdsConsistencia.Open;

   If DMCNT.cdsConsistencia.RecordCount <= 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existen Inconsistencias');
      Exit;
   End;

   pprInc.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ConsistenciaAperturaPlan.rtm';
   pprInc.Template.LoadFromFile;
   ppdbInc.DataSource := DMCNT.dsConsistencia;
   Screen.Cursor := crDefault;
   If cbDisenoRep.Checked Then
      ppdInc.ShowModal
   Else
   Begin
      pprInc.Print;
   End;
   pprInc.Stop;
   ppdbInc.DataSource := Nil;

End;

Procedure TFApertura.bbtnPlan2Click(Sender: TObject);
Var
   xSQL, xAnioAnt: String;
Begin
   If dblcCia.Text = '' Then
   Begin
      dblcCia.SetFocus;
      ShowMessage('Tiene que Ingresar Compañía');
      Exit;
   End;

   Screen.Cursor := crHourGlass;

   xAnioAnt := IntToStr(StrToInt(speAno.text) - 1);

   xSQL := 'Select B.CIAID, A.CUENTAID, A.CTA_CONSOL, A.CTA_DET, B.CTA_DET CTA_DET01, '
         + '       A.CTA_AUX, B.CTA_AUX CTA_AUX01, A.CTA_CCOS, B.CTA_CCOS CTA_CCOS01, '
         + '       A.CTA_DOC, B.CTA_DOC CTA_DOC01, ''' + edtCia.Text + ''' CIADES, C.MOV, '
         + '       ''COLUMNA 1 ES COMPAÑIA CONSOLIDADA'' OBSERVA, '
         + '       CASE WHEN B.CUENTAID IS NULL OR B.CUENTAID='''' THEN ''NO EXISTE'' ELSE '' '' END NOCUENTA '
         + '  from TGE202 A, TGE202 B, '
         + '      (SELECT CIAID, CUENTAID, ''MOV'' MOV '
         + '         FROM CNT301 '
         + '        WHERE CIAID=''' + dblcCia.Text + ''' AND CNTANOMM LIKE ''' + xAnioAnt + '%'' '
         + '        GROUP BY CIAID, CUENTAID ) C '
         + ' where A.CIAID=''01'' '
         + '   and B.CIAID(+)=''' + dblcCia.Text + ''' AND A.CUENTAID=B.CUENTAID(+) '
         + '   and ( NVL( A.CTA_DET, '''' )<>NVL( B.CTA_DET, '''' ) '
         + '      or NVL( A.CTA_AUX, '''' )<>NVL( B.CTA_AUX, '''' ) '
         + '      or NVL( A.CTA_CCOS,'''' )<>NVL( B.CTA_CCOS,'''' ) '
         + '      or NVL( A.CTA_DOC, '''' )<>NVL( B.CTA_DOC, '''' ) '
         + '      or ( B.CUENTAID IS NULL OR B.CUENTAID='''' ) ) '
         + '   and A.CIAID=C.CIAID(+) and A.CUENTAID=C.CUENTAID(+) '
         + ' order by A.CUENTAID';
   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.dataRequest(xSql);
   DMCNT.cdsConsistencia.Open;

   If DMCNT.cdsConsistencia.RecordCount <= 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existen Inconsistencias');
      Exit;
   End;

   pprInc.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ConsistenciaAperturaPlanConsol.rtm';
   pprInc.Template.LoadFromFile;
   ppdbInc.DataSource := DMCNT.dsConsistencia;
   Screen.Cursor := crDefault;
   If cbDisenoRep.Checked Then
      ppdInc.ShowModal
   Else
   Begin
      pprInc.Print;
   End;
   pprInc.Stop;
   ppdbInc.DataSource := Nil;
End;

Procedure TFApertura.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;

End.

