Unit CNT263;
// Actualizaciones
// HPC_201501_CNT          12/02/2015  Regulariza Métodos Correctos de Control Transaccional

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, StdCtrls, Buttons, Spin, ComCtrls, oaVariables, oaContabiliza,
   wwdblook, ppEndUsr, ppDB, ppDBPipe, ppBands, ppCache, ppClass, ppComm,
   ppRelatv, ppProd, ppReport;

Type
   TFGenConsol = Class(TForm)
      pnlDetalle: TPanel;
      gbPer: TGroupBox;
      speAno: TSpinEdit;
      speMM: TSpinEdit;
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
      pb1: TProgressBar;
      bbtnVerifica: TBitBtn;
      lblCia: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      pprV: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppdbV: TppDBPipeline;
      ppdV: TppDesigner;
      bbtnVerificaMto: TBitBtn;
      final: TLabel;
      Inicio: TLabel;
      Cierre: TLabel;
      Verifica: TLabel;
      Elimina: TLabel;
      Inserta: TLabel;
      Inicializa: TLabel;
      Timer1: TTimer;
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure bbtnVerificaClick(Sender: TObject);
      Procedure bbtnCancClick(Sender: TObject);
      Procedure bbtnVerificaMtoClick(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Procedure CNConsolidado; stdcall;

Exports
   CNConsolidado;

Var
   FGenConsol: TFGenConsol;

Implementation

Uses CNTDM;

{$R *.DFM}

Procedure CNConsolidado;
Begin
   If DMCNT = Nil Then exit;
   If Not DMCNT.DCOM1.Connected Then Exit;
   Try
      FGenConsol := TFGenConsol.Create(Application);
      FGenConsol.ShowModal;
   Finally
      FGenConsol.Free;
   End;
End;

Procedure TFGenConsol.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFGenConsol.FormShow(Sender: TObject);
Var
   wAno, wMes, wDia: Word;
   xSQL: String;
Begin
   xSQL := 'Select * from TGE101 '
      + 'Where CNTCONSOL=''S''';
   DMCNT.cdsQry3.Close;
   DMCNT.cdsQry3.DataRequest(xSQL);
   DMCNT.cdsQry3.Open;
   dblcCia.Text := DMCNT.cdsQry3.FieldByName('CIAID').AsString;
   edtCia.Text := DMCNT.cdsQry3.FieldByName('CIADES').AsString;

   FVariables.ConfiguraForma(Self);
   DecodeDate(date, wAno, wMes, wDia);
   speAno.Text := InttoStr(wAno);
   speMM.Text := InttoStr(wMes);
End;

Procedure TFGenConsol.bbtnOkClick(Sender: TObject);
Var
   speriodo, sSQL, xSQL, xMes, xAM: String;
   DateTime: TDateTime;
Begin
   Screen.Cursor := crHourGlass;

   speriodo := speAno.text + DMCNT.strZero(speMM.text, 2);

   xAM := speriodo;

   pb1.Max := 14;
   pb1.Min := 0;
   pb1.Position := 0;
   pb1.Position := pb1.Position + 1;

   xSQL := 'SELECT A.CIAID, ''' + edtCia.Text + ''' CIADES, '
      + 'A.CUENTAID, A.CNTANOMM, B.CTA_DET, '
      + 'C.CTA_CONSOL, NVL(D.CTA_DET,''N'') CTA_DET_CON, DEBE, HABER '
      + 'FROM '
      + '( SELECT A.CIAID, A.CUENTAID, A.CNTANOMM, '
      + 'SUM( CNTDEBEMN ) DEBE, SUM( CNTHABEMN ) HABER '
      + 'FROM CNT301 A '
      + 'WHERE CIAID<>''' + dblcCia.Text + ''' '
      + 'AND CNTANOMM=''' + xAM + ''' '
      + 'GROUP BY A.CIAID, A.CUENTAID, A.CNTANOMM '
      + ') A, TGE202 B, TGE202 C, TGE202 D '
      + 'WHERE  B.CIAID(+)=''' + dblcCia.Text + ''' AND A.CUENTAID=B.CUENTAID(+) '
      + 'AND ( NVL(B.CTA_DET,''N'')=''N'' OR B.CUENTAID IS NULL OR B.CUENTAID='''' ) '
      + 'AND A.CIAID=C.CIAID(+) AND A.CUENTAID=C.CUENTAID(+) '
      + 'AND D.CIAID(+)=''' + dblcCia.Text + ''' AND C.CTA_CONSOL=D.CUENTAID(+) '
      + 'AND NVL(D.CTA_DET,''N'')=''N'' '
      + 'ORDER BY A.CIAID, A.CUENTAID, A.CNTANOMM';

   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.Filter := '';
   DMCNT.cdsConsistencia.Filtered := False;
   DMCNT.cdsConsistencia.ProviderName := 'prvCNT';
   DMCNT.cdsConsistencia.DataRequest(xSQL);
   DMCNT.cdsConsistencia.Open;

   pb1.Position := pb1.Position + 1;

   If DMCNT.cdsConsistencia.RecordCount > 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('Error : Existen Inconsistencias. Generar Verifica Cuenta');
      pb1.Position := 0;
      Exit;
   End;

   xSQL := 'SELECT CIAID, ''' + edtCia.Text + ''' CIADES, CNTANOMM, TDIARID, CNTCOMPROB, CUENTAID, '
      + 'CNTDH, CNTMTOLOC, CNTDEBEMN, CNTHABEMN '
      + 'FROM CNT301 '
      + 'WHERE CIAID<>''' + dblcCia.Text + ''' AND CNTANOMM=''' + xAM + ''' '
      + 'AND CNTDH=''D'' AND  CNTMTOLOC<>CNTDEBEMN '
      + 'UNION ALL '
      + 'SELECT CIAID, ''' + edtCia.Text + ''' CIADES, CNTANOMM, TDIARID, CNTCOMPROB, CUENTAID, '
      + 'CNTDH, CNTMTOLOC, CNTDEBEMN, CNTHABEMN '
      + 'FROM CNT301 '
      + 'WHERE CIAID<>''' + dblcCia.Text + ''' AND CNTANOMM=''' + xAM + ''' '
      + 'AND CNTDH=''H'' AND  CNTMTOLOC<>CNTHABEMN ';

   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.Filter := '';
   DMCNT.cdsConsistencia.Filtered := False;
   DMCNT.cdsConsistencia.ProviderName := 'prvCNT';
   DMCNT.cdsConsistencia.DataRequest(xSQL);
   DMCNT.cdsConsistencia.Open;

   pb1.Position := pb1.Position + 1;

   If DMCNT.cdsConsistencia.RecordCount > 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('Error : Existen Inconsistencias. Generar Verifica Montos');
      pb1.Position := 0;
      Exit;
   End;

   xMes := DMCNT.strZero(speMM.text, 2);

   sSQL := 'SELECT X.CANTIDAD+Y.CANTIDAD CANTIDAD FROM ' +
      ' (SELECT COUNT(*) CANTIDAD FROM CNT301 WHERE CIAID=''01'' AND CNTANOMM=' + QuotedStr(speriodo) + ' ) X, ' +
      ' (SELECT COUNT(*) CANTIDAD FROM CNT300 WHERE CIAID=''01'' AND CNTANOMM=' + QuotedStr(speriodo) + ' ) Y ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(sSQL);
   DMCNT.cdsQry.Open;

   pb1.Position := pb1.Position + 1;

   If DMCNT.cdsQry.FieldByName('CANTIDAD').AsInteger > 0 Then
   Begin
      Screen.Cursor := crDefault;
      If MessageDlg('Periodo ya fué consolidado. ¿ Desea Proseguir ?',
         mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
      Begin
         pb1.Position := 0;
         exit;
      End;
//     ShowMessage('Los Registros para este periodo ya fueron consolidados.');
   End
   Else
   Begin
      Screen.Cursor := crDefault;
      If MessageDlg('¿ Esta Seguro de Consolidar ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
      Begin
         pb1.Position := 0;
         Exit;
      End
   End;

   DateTime := Time;
   Inicio.Caption := 'Inicio: ' + TimeToStr(datetime);
   Inicio.Refresh;

   If DMCNT.strZero(speMM.text, 2) <> '00' Then
   Begin
      sSQL := 'SELECT CIAID, CIADES FROM TGE101 WHERE CIAID>''01''';
      DMCNT.cdsQry2.Close;
      DMCNT.cdsQry2.DataRequest(sSQL);
      DMCNT.cdsQry2.Open;

      While Not DMCNT.cdsQry2.Eof Do
      Begin
         xSql := 'SELECT * FROM TGE154 '
            + 'WHERE CIAID=''' + DMCNT.cdsQry2.FieldByName('CIAID').AsString + ''' '
            + ' and ANO=''' + Copy(speriodo, 1, 4) + '''';
         DMCNT.cdsCierres.close;
         DMCNT.cdsCierres.datarequest(xsql);
         DMCNT.cdsCierres.open;

         If DMCNT.cdsCierres.RecordCount = 0 Then
            DMCNT.cdsCierres.Insert
         Else
            DMCNT.cdsCierres.Edit;

         DMCNT.cdsCierres.FieldByName('CIAID').AsString := DMCNT.cdsQry2.FieldByName('CIAID').AsString;
         DMCNT.cdsCierres.FieldByName('MODULO').AsString := 'CNT';
         DMCNT.cdsCierres.FieldByName('FECCIERRE').value := Now;
         DMCNT.cdsCierres.FieldByName('USUARIO').AsString := DMCNT.wUsuario;
         DMCNT.cdsCierres.FieldByName('FREG').value := Now;
         DMCNT.cdsCierres.FieldByName('HREG').value := Now;
         DMCNT.cdsCierres.FieldByName('ANO').AsString := speAno.text;
         DMCNT.cdsCierres.FieldByName('PER' + DMCNT.strZero(speMM.text, 2)).AsString := 'S';
         DMCNT.ControlTranCNT(3);
         DMCNT.cdsQry2.Next;
      End;
      DateTime := Time;
      Cierre.Caption := 'Cierre: ' + TimeToStr(datetime);
      Cierre.Refresh;
      pnlDetalle.Refresh;
   End;

   sSQL := 'SELECT X.CANTIDAD+Y.CANTIDAD CANTIDAD FROM ' +
      ' (SELECT COUNT(*) CANTIDAD FROM CNT301 WHERE CIAID<>''01'' AND CNTANOMM=' + QuotedStr(speriodo) + ' ) X, ' +
      ' (SELECT COUNT(*) CANTIDAD FROM CNT300 WHERE CIAID<>''01'' AND CNTANOMM=' + QuotedStr(speriodo) + ' ) Y ';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(sSQL);
   DMCNT.cdsQry.Open;

   pb1.Position := pb1.Position + 1;

   DateTime := Time;
   Verifica.Caption := 'Verifica: ' + TimeToStr(DateTime);
   Verifica.Refresh;
   pnlDetalle.Refresh;

   If DMCNT.cdsQry.FieldByName('CANTIDAD').AsInteger = 0 Then
   Begin
      ShowMessage('No existen Registros a consolidar');
      pb1.Position := 0;
      exit;
   End
   Else
   Begin

    // GENERA DETALLE
      Screen.Cursor := crHourGlass;
      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      Try

         sSQL := 'DELETE FROM CNT301 WHERE CIAID=''01'' AND CNTANOMM=' + QuotedStr(sPeriodo);
         DMCNT.DCOM1.AppServer.EjecutaQry(sSQL);

         pb1.Position := pb1.Position + 1;

         sSQL := 'DELETE FROM CNT300 WHERE CIAID=''01'' AND CNTANOMM=' + QuotedStr(sPeriodo);
         DMCNT.DCOM1.AppServer.EjecutaQry(sSQL);

         pb1.Position := pb1.Position + 1;
         DateTime := Time;
         Elimina.Caption := 'Elimina: ' + TimeToStr(DateTime);
         Elimina.Refresh;
         pnlDetalle.Refresh;

         sSQL := 'INSERT INTO CNT301 '
            + 'SELECT ''01'' CIAID, TDIARID, A.CIAID||SUBSTR(CNTCOMPROB,3,8) CNTCOMPROB, CNTANO, '
            + 'CNTANOMM, CNTLOTE, '
            + 'CASE WHEN NVL(CTA_CONSOL,''nulo'')=''nulo'' then A.CUENTAID else CTA_CONSOL END CUENTAID, '
            + 'CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, '
            + 'CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, '
            + 'CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, '
            + 'CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, A.CTADES, AUXDES, DOCDES, '
            + 'CCOSDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, '
            + 'CNTTS, CNTPAGADO, CNTMODDOC, CNTREG, MODULO, A.CTA_SECU '
            + 'FROM CNT301 A, TGE202 B '
            + 'WHERE A.CIAID<>''01'' AND CNTANOMM=' + QuotedStr(sPeriodo) + ' and CNTCUADRE=''S'' '
            + 'and A.CIAID=B.CIAID(+) and A.CUENTAID=B.CUENTAID(+)';
         DMCNT.DCOM1.AppServer.EjecutaQry(sSQL);

         pb1.Position := pb1.Position + 1;

      // GENERA CABACERA
         sSQL := ' INSERT INTO CNT300' +
            '  SELECT ''01'' CIAID,TDIARID,CIAID||SUBSTR(CNTCOMPROB,3,8) CNTCOMPROB,CNTANOMM,CNTLOTE,CNTGLOSA,CNTTCAMBIO,CNTFCOMP,CNTESTADO,CNTCUADRE,' +
            '       CNTFAUTOM,CNTUSER,CNTFREG,CNTHREG,CNTANO,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,' +
            '       CNTAASS,TMONID,FLAGVAR,FCONS,CNTFMEC,TDIARDES,CNTDEBEMN,CNTDEBEME,CNTHABEMN,CNTHABEME,' +
            '       CNTSALDMN,CNTSALDME,CNTTS,DOCMOD,MODULO' +
            ' FROM CNT300' +
            ' WHERE CIAID<>''01'' AND CNTANOMM=' + QuotedStr(speriodo) + ' and CNTCUADRE=''S'' ';
         DMCNT.DCOM1.AppServer.EjecutaQry(sSQL);
      //
         DMCNT.DCOM1.AppServer.GrabaTransaccion;

         pb1.Position := pb1.Position + 1;
         DateTime := Time;
         Inserta.Caption := 'Inserta: ' + TimeToStr(DateTime);
         Inserta.Refresh;
         pnlDetalle.Refresh;

      // Mayoriza
         xSQL := 'UPDATE CNT401 ' +
            'SET DEBEMN' + xmes + '=0, ' +
            '    HABEMN' + xmes + '=0, ' +
            '    DEBEME' + xmes + '=0, ' +
            '    HABEME' + xmes + '=0, ' +
            '    SALDMN' + xmes + '=0, ' +
            '    SALDME' + xmes + '=0 ' +
            '    WHERE CIAID=''01'' AND ANO=' + quotedstr(speAno.text);
         DMCNT.DCOM1.AppServer.IniciaTransaccion;
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            DMCNT.DCOM1.AppServer.GrabaTransaccion;
         Except
         // Inicio HPC_201501_CNT
            //DMCNT.DCOM1.AppServer.RegresaTransaccion;
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
         // Fin HPC_201501_CNT
            ShowMessage('Error en Mayorización');
            pb1.Position := 0;
            Exit;
         End;

         pb1.Position := pb1.Position + 1;
         DateTime := Time;
         Inicializa.Caption := 'Inicializa: ' + TimeToStr(DateTime);
         Inicializa.Refresh;
         pnlDetalle.Refresh;
      {
      if not SOLConta( '01', '', speAno.text+DMCNT.strZero(speMM.text,2), '',
             SRV_D, 'M', DMCNT.wModulo, DMCNT.cdsMovCNT1, DMCNT.cdsNivel,
             DMCNT.cdsResultSet, DMCNT.DCOM1, Self ) then
      begin
         ShowMessage( 'Error en Mayorización' );
         pb1.Position:=0;
      end;
      }
         xSQL := 'begin'
            + '  db2admin.sp_mayorizacion_cnt( '
            + '    ''01'', '''', ''' + speAno.text + DMCNT.strZero(speMM.text, 2) + ''', '
            + '    '''', ''S'' '
            + ' ); '
            + 'end;';
         DMCNT.DCOM1.AppServer.IniciaTransaccion;
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            DMCNT.DCOM1.AppServer.GrabaTransaccion;
         Except
         // Inicio HPC_201501_CNT
            //DMCNT.DCOM1.AppServer.RegresaTransaccion;
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
         // Fin HPC_201501_CNT
            ShowMessage('Error en Mayorización');
            pb1.Position := 0;
            Exit;
         End;

      Except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
         ShowMessage('Registros NO Grabados');
         pb1.Position := 0;
      End;

      pb1.Position := 13;
      DateTime := Time;
      Final.Caption := 'Final: ' + TimeToStr(DateTime);
      Final.Refresh;
      pnlDetalle.Refresh;
      pb1.Position := 14;

      Screen.Cursor := crDefault;
      ShowMessage('Consolidación OK.');
      pb1.Position := 0;
   End;
//  FGenConsol.caption:=speriodo;
End;

Procedure TFGenConsol.bbtnVerificaClick(Sender: TObject);
Var
   xSQL: String;
   xAM, xMes: String;
Begin
   Screen.Cursor := crHourGlass;
   xAM := speAno.Text;
   xMes := speMM.Text;

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;

   xSQL := 'SELECT A.CIAID, ''' + edtCia.Text + ''' CIADES, '
      + 'A.CUENTAID, A.CNTANOMM, B.CTA_DET, '
      + 'C.CTA_CONSOL, NVL(D.CTA_DET,''N'') CTA_DET_CON, DEBE, HABER '
      + 'FROM '
      + '( SELECT A.CIAID, A.CUENTAID, A.CNTANOMM, '
      + 'SUM( CNTDEBEMN ) DEBE, SUM( CNTHABEMN ) HABER '
      + 'FROM CNT301 A '
      + 'WHERE CIAID<>''' + dblcCia.Text + ''' '
      + 'AND CNTANOMM=''' + xAM + ''' '
      + 'GROUP BY A.CIAID, A.CUENTAID, A.CNTANOMM '
      + ') A, TGE202 B, TGE202 C, TGE202 D '
      + 'WHERE  B.CIAID(+)=''' + dblcCia.Text + ''' AND A.CUENTAID=B.CUENTAID(+) '
      + 'AND ( NVL(B.CTA_DET,''N'')=''N'' OR B.CUENTAID IS NULL OR B.CUENTAID='''' ) '
      + 'AND A.CIAID=C.CIAID(+) AND A.CUENTAID=C.CUENTAID(+) '
      + 'AND D.CIAID(+)=''' + dblcCia.Text + ''' AND C.CTA_CONSOL=D.CUENTAID(+) '
      + 'AND NVL(D.CTA_DET,''N'')=''N'' '
      + 'ORDER BY A.CIAID, A.CUENTAID, A.CNTANOMM';

   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.Filter := '';
   DMCNT.cdsConsistencia.Filtered := False;
   DMCNT.cdsConsistencia.ProviderName := 'prvCNT';
   DMCNT.cdsConsistencia.DataRequest(xSQL);
   DMCNT.cdsConsistencia.Open;

   If DMCNT.cdsConsistencia.RecordCount <= 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existen Inconsistencias');
      Exit;
   End;
   pprV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\ConsistenciaBalance.rtm';
   pprV.Template.LoadFromFile;
   ppdbV.DataSource := DMCNT.dsConsistencia;
   Screen.Cursor := crDefault;
   If (DMCNT.wUsuario = 'DEMO') Or (DMCNT.wUsuario = 'SACSA') Then
      ppdV.ShowModal
   Else
   Begin
      pprV.Print;
   End;
   pprV.Stop;
   ppdbV.DataSource := Nil;
End;

Procedure TFGenConsol.bbtnCancClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFGenConsol.bbtnVerificaMtoClick(Sender: TObject);
Var
   xSQL: String;
   xAM, xMes: String;
Begin
   Screen.Cursor := crHourGlass;
   xAM := speAno.Text;
   xMes := speMM.Text;

   If StrToInt(xMes) <= 9 Then
      xMes := '0' + inttostr(StrToInt(xMes));

   If length(xMes) < 2 Then xMes := '0' + xMes;

   xAM := speAno.Text + xMes;
   xSQL := 'SELECT CIAID, ''' + edtCia.Text + ''' CIADES, CNTANOMM, TDIARID, CNTCOMPROB, CUENTAID, '
      + 'CNTDH, CNTMTOLOC, CNTDEBEMN, CNTHABEMN '
      + 'FROM CNT301 '
      + 'WHERE CIAID<>''' + dblcCia.Text + ''' AND CNTANOMM=''' + xAM + ''' '
      + 'AND CNTDH=''D'' AND  CNTMTOLOC<>CNTDEBEMN '
      + 'UNION ALL '
      + 'SELECT CIAID, ''' + edtCia.Text + ''' CIADES, CNTANOMM, TDIARID, CNTCOMPROB, CUENTAID, '
      + 'CNTDH, CNTMTOLOC, CNTDEBEMN, CNTHABEMN '
      + 'FROM CNT301 '
      + 'WHERE CIAID<>''' + dblcCia.Text + ''' AND CNTANOMM=''' + xAM + ''' '
      + 'AND CNTDH=''H'' AND  CNTMTOLOC<>CNTHABEMN ';

   DMCNT.cdsConsistencia.Close;
   DMCNT.cdsConsistencia.Filter := '';
   DMCNT.cdsConsistencia.Filtered := False;
   DMCNT.cdsConsistencia.ProviderName := 'prvCNT';
   DMCNT.cdsConsistencia.DataRequest(xSQL);
   DMCNT.cdsConsistencia.Open;

   If DMCNT.cdsConsistencia.RecordCount <= 0 Then
   Begin
      Screen.Cursor := crDefault;
      ShowMessage('No Existen Inconsistencias');
      Exit;
   End;
   pprV.Template.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\VerifConsolidadoMto.rtm';
   pprV.Template.LoadFromFile;
   ppdbV.DataSource := DMCNT.dsConsistencia;
   Screen.Cursor := crDefault;
   If (DMCNT.wUsuario = 'DEMO') Or (DMCNT.wUsuario = 'SACSA') Then
      ppdV.ShowModal
   Else
   Begin
      pprV.Print;
   End;
   pprV.Stop;
   ppdbV.DataSource := Nil;
End;

Procedure TFGenConsol.Timer1Timer(Sender: TObject);
Begin
   pnlDetalle.Refresh;
End;

Procedure TFGenConsol.FormCreate(Sender: TObject);
Var
   wAno, wMes, wDia: Word;
Begin
   decodedate(date, wAno, wMes, wDia);
   speAno.MaxValue := wAno;
End;

End.

