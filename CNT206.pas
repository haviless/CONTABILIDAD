Unit CNT206;

// Actualizaciones
// HPC_201401_CNT  Se agrega campo MODULO en la actualización, (para que pueda ser eliminado)
// HPC_201403_CNT  25/02/2014  Modificar los ControlTrans, cdspost, AplicaDato y los ApplyUpdates.
// HPC_201501_CNT  30/01/2015  Asigna constantes para Centros de Costo y auxiliares Faltantes
// HPC_201701_CNT  27/01/2016  Verifica parámetros de Cierre Anual en Plan de Cuentas


Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, wwdblook, Buttons, Spin, Mask, wwdbedit, wwdbdatetimepicker,
   Wwdbdlg, ExtCtrls, ComCtrls, oaVariables, OleServer, Excel2000, variants,
   ComObj;

Type
   TFCierreAno = Class(TForm)
      Panel1: TPanel;
      lblCia: TLabel;
      Label2: TLabel;
      Label1: TLabel;
      pnlGenera: TPanel;
      lblProc: TLabel;
      pbGenera: TProgressBar;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      speAno: TSpinEdit;
      gbACie: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Label13: TLabel;
      edtPeriodoAC: TEdit;
      dblcTDiarioAC: TwwDBLookupCombo;
      edtTDiarioAC: TEdit;
      dbeNoCompAC: TwwDBEdit;
      edtGlosaAC: TEdit;
      dbeLoteAC: TwwDBEdit;
      rbACContS: TRadioButton;
      rbACContN: TRadioButton;
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
      edtCtaCA: TEdit;
      BitBtn1: TBitBtn;
    bbtnVerfPlanCtas: TBitBtn;
      Procedure dblcCiaExit(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure dbeNoCompACExit(Sender: TObject);
      Procedure speAnoExit(Sender: TObject);
      Procedure dblcTDiarioACExit(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure dbeLoteACExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure BitBtn1Click(Sender: TObject);
    procedure bbtnCancClick(Sender: TObject);
    procedure bbtnVerfPlanCtasClick(Sender: TObject);
   Private
    { Private declarations }
      xReg: Integer;
      xSecu, xTcambio, xCtadoc, xCuentaid, xClauxid, xAuxid, xCCosid: String;
      xTMonLoc, xMM, xDD, xTRI, xSEM, xSS, xAATRI, xAASEM, xAASS: String;
      xSaldmn12: Double;
      Procedure Asigna;
   // Inicio HPC_201701_CNT
   // Genera archivo Excel para Verificación entre Totales de 2 dígitos versus movimientos
      Procedure ExportExcelVerif;
   // Fin HPC_201701_CNT
   Public
    { Public declarations }
   End;

Procedure CNCierreAno; stdcall;

Exports
   CNCierreAno;

Var
   FCierreAno: TFCierreAno;
   Y, M, D: Word;
   xWhere: String;

Implementation

Uses CNTDM;

{$R *.DFM}

Procedure CNCierreAno;
Begin
   If DMCNT = Nil Then exit;
   If Not DMCNT.DCOM1.Connected Then Exit;
   Try
      FCierreAno := TFCierreAno.Create(Application);
      FCierreAno.ShowModal;
   Finally
      FCierreAno.Free;
   End;
End;

Procedure TFCierreAno.FormActivate(Sender: TObject);
Begin
   Screen.Cursor := crHourGlass;
   FVariables.ConfiguraForma(Self);
   DecodeDate(DATE, Y, M, D);
   speAno.Value := Y;
   Screen.Cursor := crDefault;
End;

Procedure TFCierreAno.dblcCiaExit(Sender: TObject);
Begin
   edtCia.Text := '';
   If dblcCia.Text <> '' Then
      edtCia.Text := DMCNT.cdsCia.FieldByName('CIADES').AsString;
   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   End;
   xWhere := 'CIAID='+quotedstr(dblcCia.Text)+' and CTA_CIER='+quotedstr('A');
   edtCtaCA.Text := DMCNT.DisplayDescrip('PrvTGE', 'TGE202', '*', xWhere, 'CUENTAID');
End;

Procedure TFCierreAno.speAnoExit(Sender: TObject);
Begin
// Valida Periodo Cerrado
   xWhere := 'CIAID='+quotedstr(dblcCia.Text)
           + ' and MODULO='+quotedstr('CNT')
           + ' and ANO='+quotedstr(inttostr(speAno.Value));
   If (DMCNT.DisplayDescrip('PrvTGE', 'TGE154', 'PER12', xWhere, 'PER12')) = 'C' Then
   Begin
      ShowMessage('Año no válido... Ejercicio Cerrado');
      speAno.SetFocus;
   End;
   edtPeriodoAC.Text := IntToStr(speAno.Value)+'13';
End;

Procedure TFCierreAno.dblcTDiarioACExit(Sender: TObject);
Begin
   edtTDiarioAC.Text := '';
   If dblcTDiarioAC.Text <> '' Then
      edtTDiarioAC.Text := DMCNT.cdsTDiario.FieldByName('TDIARABR').AsString;
   If length(edtTDiarioAC.Text) = 0 Then
   Begin
      ShowMessage('Falta Definición de Tipo de Diario');
      dblcTDiarioAC.SetFocus;
   End;
   If (length(edtTDiarioAC.Text) > 0) And (length(edtPeriodoAC.Text) = 6) Then
   Begin
   //último número de comprobante incrementado en 1 para el tipo de diario escogido
      Screen.Cursor := crHourGlass;
      xWhere := 'CIAID='+quotedstr(dblcCia.Text)
              + ' and TDIARID='+quotedstr(dblcTDiarioAC.Text)
              + ' and CNTANOMM='+quotedstr(edtPeriodoAC.Text);
      dbeNoCompAC.Text := DMCNT.UltimoNum('prvCNT', 'CNT301', 'CNTCOMPROB', xWhere);
      dbeNoCompAC.Text := DMCNT.strzero(dbeNoCompAC.Text, 10);
      Screen.Cursor := crDefault;
      dbeNoCompAC.SetFocus;
   End;
End;

Procedure TFCierreAno.dbeNoCompACExit(Sender: TObject);
Begin
   If (dbeNoCompAC.Text = '') Then
   Begin
      ShowMessage('Ingrese Número de Comprobante');
      dbeNoCompAC.SetFocus;
   End;
   dbeNoCompAC.Text := DMCNT.strzero(dbeNoCompAC.Text, 10);
End;

Procedure TFCierreAno.dbeLoteACExit(Sender: TObject);
Begin
   If dbeLoteAC.Text <> '' Then
      dbeLoteAC.Text := DMCNT.strzero(dbeLoteAC.Text, 4);
End;

Procedure TFCierreAno.bbtnOkClick(Sender: TObject);
Var
   xWhere, xFTCam, xAnioAnt, xSql: String;
   xFEmision, xFTCambio: TDate;
   xAnoCie: String;
   xI: Integer;
Begin
   If MessageDlg(' Iniciar Proceso ' + chr(13) + chr(13) +
      ' ¿ Esta Seguro ? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then exit;

   xSQL := 'select CUENTAID, A.CTACONTRA, A.CTA_SECU, A.CTA_CIER '
          +'  from TGE202 A, '
          +'       (select CTA_SECU, CTACONTRA, CTA '
          +'          from (select CUENTAID, CTACONTRA, CTA_SECU, SUBSTR(CUENTAID,1,2) CTA '
          +'                  from TGE202 '
          +'                 Where CIAID='+quotedstr(dblcCia.Text)
          +'                   and CTACONTRA is not null '
          +'                   and CTA_SECU is not null '
          +'                   and nvl(CTA_CIER,''N'')=''S'' '
          +'                 order by CTA_SECU, CUENTAID ) A '
          +'         group by CTA_SECU, CTACONTRA, CTA '
          +'         order by CTA_SECU '
          +'       ) B '
          +' where CIAID='+quotedstr(dblcCia.Text)
          +'   and (A.CTACONTRA is null or A.CTA_SECU is null or nvl(A.CTA_CIER,''N'')<>''S'' ) '
          +'   and CTA_DET=''S'' '
          +'   and A.CUENTAID like CTA||''%''';
   DMCNT.cdsVariable.Close;
   DMCNT.cdsVariable.dataRequest(xSQL);
   DMCNT.cdsVariable.Open;
   If DMCNT.cdsVariable.RecordCount > 0 Then
   Begin
      ShowMessage('Inconsistencias. Existen Cuentas sin los parámetros asignados...');
      Exit;
   End;

// Paso 2, se toma el T. de Cambio al 31/12 del año anterior
   xSQL := 'Select * '
          +'  from CNT300 '
          +' Where CIAID='+quotedstr(dblcCia.Text)
          +'   and TDIARID='+quotedstr(dblcTDiarioAC.Text)
          +'   and CNTANOMM='+quotedstr(speAno.text+'13')
          +'   and CNTCOMPROB='+quotedstr(dbeNoCompAC.Text);
   DMCNT.cdsVariable.Close;
   DMCNT.cdsVariable.dataRequest(xSql);
   DMCNT.cdsVariable.Open;
   If DMCNT.cdsVariable.RecordCount > 0 Then
   Begin
      If DMCNT.cdsVariable.FieldByname('CNTCUADRE').AsString = 'S' Then
      Begin
         ShowMessage('Asiento ya Fue Contabilizado');
         Exit;
      End
      Else
      Begin
         Screen.Cursor := CrHourGlass;
         xSQL := 'Delete from CNT300 '
               + ' Where CIAID='+quotedstr(dblcCia.Text)
               + '   and TDIARID='+quotedstr(dblcTDiarioAC.Text)
               + '   and CNTANOMM='+quotedstr(speAno.text+'13')
               + '   and CNTCOMPROB='+quotedstr(dbeNoCompAC.Text);
         Try
            DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
         End;

         xSQL := 'Delete from CNT311 '
               + ' Where CIAID='+quotedstr(dblcCia.Text)
               + '   and TDIARID='+quotedstr(dblcTDiarioAC.Text)
               + '   and CNTANOMM='+quotedstr(speAno.text+'13')
               + '   and CNTCOMPROB='+quotedstr(dbeNoCompAC.Text);
         Try
            DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
         End;
      End;
   End;

   Screen.Cursor := CrHourGlass;

   xAnioAnt := IntToStr(StrToInt(speAno.text) - 1);
   xFTCam := '31/12/' + speAno.text;
   xFTCambio := StrToDate(xFTCam);
   xSql := 'select TCAMVBV from TGE107 where FECHA=' + wRepFuncDate + '''' + DateToStr(xFTCambio) + '''' + ')';
   DMCNT.cdsVariable.Close;
   DMCNT.cdsVariable.dataRequest(xSql);
   DMCNT.cdsVariable.Open;
   xTcambio := DMCNT.cdsVariable.FieldByName('TCAMVBV').AsString;

// 3 paso, hallo los datos del semestre,trimestre, etc
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

// 4 paso, capturo la moneda
   xWhere := 'TMON_LOC=' + quotedstr('L');
   xTMonLoc := DMCNT.DisplayDescrip('PrvTGE', 'TGE103', '*', xWhere, 'TMONID');

 //Paso 5, solo para las cuentas que no tengan ni auxiliar ni c. de costo
 //esto toma todas las cuentas puras pero no incluye las que llevan auxiliares o centro de costo
   xSQL := 'Select B.CIAID, B.CUENTAID, B.CTANIV, B.CTA_DET, B.CTA_MOV, B.CTA_AUX, '
         + '       B.CTA_CCOS, B.CTA_DEST, B.CTA_DOC, B.CTACONTRA, B.CTA_SECU, A.* '
         + '  From CNT401 A,TGE202 B '
         + ' Where A.ciaid=' + quotedStr(dblcCia.value)
         + '   and (B.CTA_MOV=''S'' or B.CTA_DET = ''S'' ) and B.CTA_CIER=''S'' '
         + '   and ((A.AUXID='''' or A.AUXID is null) and (a.ccosid='''' or a.ccosid is null)) '
         + '   and A.CUENTAID = B.CUENTAID and A.CIAID = B.CIAID and SALDMN12 <> 0 '
         + '   and A.ANO='+quotedstr(IntToStr(speAno.value))
         + '   and B.CTACONTRA IS NOT NULL '
         + ' Order by B.CTA_SECU,B.CUENTAID';
   DMCNT.cdsVariable.Close;
   DMCNT.cdsVariable.dataRequest(XSQL);
   DMCNT.cdsVariable.Open;
   DMCNT.cdsVariable.First;

   xSql := 'Select * '
          +'  from CNT311 '
          +' Where CIAID='+quotedStr(dblcCia.value)
          +'   and TDIARID='+quotedStr(dblcTDiarioAC.Text)
          +'   and CNTANOMM=' + quotedstr(speAno.text+'13');
   DMCNT.cdsCNT311.Close;
   DMCNT.cdsCNT311.DataRequest(xSql);
   DMCNT.cdsCNT311.open;

   xReg := 0;
   While Not DMCNT.cdsVariable.Eof Do
   Begin
      xSecu     := DMCNT.cdsVariable.FieldByName('CTA_SECU').AsString;
      xCtadoc   := DMCNT.cdsVariable.FieldByName('CTA_DOC').AsString;
      xSaldmn12 := DMCNT.cdsVariable.FieldByName('SALDMN12').AsFloat;
      xCuentaid := DMCNT.cdsVariable.FieldByName('CUENTAID').AsString;
      xClauxid  := DMCNT.cdsVariable.FieldByName('CLAUXID').AsString;
      xAuxid    := DMCNT.cdsVariable.FieldByName('AUXID').AsString;
      xCcosid   := DMCNT.cdsVariable.FieldByName('CCOSID').AsString;
   // Inicio HPC_201501_CNT
      If DMCNT.cdsVariable.FieldByName('CTA_CCOS').AsString = 'S' Then
         xCCosId := '8888';
      If DMCNT.cdsVariable.FieldByName('CTA_AUX').AsString = 'S' Then
      begin
         xClauxid  := '9';
         xAuxid    := '99999';
      end;
   // Fin HPC_201501_CNT

      Asigna;
      DMCNT.cdsVariable.Next;
   End;

// Hallo las secuencias
   xSQL := 'select max(CUENTAID) CUENTAID, max(CTACONTRA) CTACONTRA, CTA_SECU, max(CTA_DOC) CTA_DOC'
          +'  from TGE202 '
          +' where CTACONTRA is not null '
          +'   and CIAID='+quotedstr(dblcCia.value)
          +' group by CTA_SECU order by CTA_SECU';
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.ProviderName := 'PrvTGE';
   DMCNT.cdsQry2.DataRequest(xSql);
   DMCNT.cdsQry2.Open;
   DMCNT.cdsQry2.First;

// hallo los totales
   xAnocie := IntToStr(speAno.value) + '13';
   xSQL := 'select B.CTA_SECU, max(CTACONTRA) ctacontra, sum(CNTDEBEMN) CNTDEBEMN, sum(CNTHABEMN) CNTHABEMN '
          +'  from CNT311 A, TGE202 B'
          +' where A.Ciaid='+quotedStr(dblcCia.value)
          +'   and A.CNTANOMM='+quotedstr(xAnocie)
          +'   and B.CIAID(+)=A.CIAID '
          +'   and B.CTACONTRA is not null '
          +'   and A.CUENTAID=B.CUENTAID '
          +' group by B.CTA_SECU '
          +' order by B.CTA_SECU';
   DMCNT.cdsQry3.Close;
   DMCNT.cdsQry3.DataRequest(xSql);
   DMCNT.cdsQry3.Open;
   DMCNT.cdsQry3.indexfieldnames := 'CTA_SECU';
   DMCNT.cdsQry3.First;
   While Not DMCNT.cdsQry2.Eof Do
   Begin
      DMCNT.cdsQry3.setkey;
      DMCNT.cdsQry3.FieldByName('CTA_SECU').AsString := DMCNT.cdsQry2.FieldByName('CTA_SECU').AsString;
      xSecu := DMCNT.cdsQry2.FieldByName('CTA_SECU').AsString;
      If DMCNT.cdsQry3.GotoKey Then
      Begin
      // si existe, solo genere la ctacontra
         xCtadoc := DMCNT.cdsQry2.FieldByName('CTA_DOC').AsString;
         xSaldmn12 := (DMCNT.cdsQry3.FieldByName('CNTDEBEMN').AsFloat) - (DMCNT.cdsQry3.FieldByName('CNTHABEMN').AsFloat);
         xCuentaid := DMCNT.cdsQry2.FieldByName('CTACONTRA').AsString;
         xClauxid := '';
         xAuxid := '';
         xCcosid := '';
         Asigna;
      End
      Else
      Begin // CUANDO LA SECUENCIA NO EXISTE EN CNMT311, genero el de la cuentaid y el de la ctacontra
       // HALLO EL TOTAL DE LA CUENTAID
         xSQL := 'Select (sum(NVL(CNTDEBEMN,0)) - SUM(NVL(CNTHABEMN,0))) TOTAL '
                +'  from CNT311 '
                +' where CIAID='+quotedStr(dblcCia.value)
                +'   and CUENTAID='+quotedstr(DMCNT.cdsQry2.FieldByName('CUENTAID').AsString)
                +'   and CNTANOMM='+quotedstr(xAnocie)
                +' group by CUENTAID';
         DMCNT.cdsQry4.close;
         DMCNT.cdsQry4.ProviderName := 'PrvTGE';
         DMCNT.cdsQry4.DataRequest(xSql);
         DMCNT.cdsQry4.Open;

         xCtadoc := DMCNT.cdsQry2.FieldByName('CTA_DOC').AsString;
         xSaldmn12 := DMCNT.cdsQry4.FieldByName('TOTAL').AsFloat;
         xCuentaid := DMCNT.cdsQry2.FieldByName('CUENTAID').AsString;
         xClauxid := '';
         xAuxid := '';
         xCcosid := '';
         For xI := 1 To 2 Do // para que genere la cuentaid y la ctacontra
         Begin
            Asigna;
            xCuentaid := DMCNT.cdsQry2.FieldByName('CTACONTRA').AsString;
            xSaldmn12 := xSaldmn12 * -1;
         End;
      End;
      DMCNT.cdsQry2.next;
   End;
   xSql := 'select * '
          +'  from CNT311'
          +' where CIAID='+quotedStr(dblcCia.value)
          +'   and TDIARID=''99'' '
          +'   and CNTANOMM='+quotedstr(xAnocie)
          +' order by CTA_SECU,CNTREG';
   DMCNT.cdsCNT311.close;
   DMCNT.cdsCNT311.DataRequest(xSql);
   DMCNT.cdsCNT311.Open;
   DMCNT.cdsCNT311.First;
   xReg := 1;
   While Not DMCNT.cdsCNT311.Eof Do
   Begin
      xSql := 'update CNT311 '
             +'   set CNTREG='+quotedstr(IntToSTr(xREg))
             +' where CIAID='+quotedStr(dblcCia.value)
             +'  and TDIARID=''99'' '
             +'  and CNTANOMM=' + quotedstr(xAnocie)
             +'  and CUENTAID=' + quotedstr(DMCNT.cdsCNT311.FieldByName('CUENTAID').AsString)
             +'  and CTA_SECU=' + quotedstr(DMCNT.cdsCNT311.FieldByName('CTA_SECU').AsString);
      DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
      xReg := xReg + 1;
      DMCNT.cdsCNT311.next;
   End;

   // Genera Cabecera de Contabilidad
// Inicio HPC_201401_CNT
// Se agrega campo MODULO en la actualización, (para que pueda ser eliminado)
   xSQL := 'INSERT INTO CNT300(CIAID, TDIARID, CNTANOMM, CNTCOMPROB, '
          +'                   CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, '
          +'                   CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
          +'                   CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, '
          +'                   TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTTS, DOCMOD, MODULO ) '
          +'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, '
          +'       max(A.CNTGLOSA),A.CNTTCAMBIO,A.CNTFCOMP,A.CNTESTADO,A.CNTCUADRE,'
          +        quotedstr(DMCNT.wUsuario)+','+wRepFecServi+','+wRepHorServi+','+'A.CNTANO, A.CNTMM, A.CNTDD, '
          +'       A.CNTTRI, A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, A.FLAGVAR, '
          +'       A.TDIARDES,'
         // +'       decode(greatest(SUM(A.CNTDEBEMN),0),0,SUM(A.CNTDEBEMN)* -1,SUM(A.CNTDEBEMN)),'
          +'       case when SUM(A.CNTDEBEMN)<=0 then SUM(A.CNTDEBEMN)*-1 else SUM(A.CNTDEBEMN) end,'
         // +'       decode(greatest(SUM(A.CNTDEBEME),0),0,SUM(A.CNTDEBEME)* -1,SUM(A.CNTDEBEME)),'
          +'       case when SUM(A.CNTDEBEME)<=0 then SUM(A.CNTDEBEME)*-1 else SUM(A.CNTDEBEME) end,'
         // +'       decode(greatest(SUM(A.CNTHABEMN),0),0,SUM(A.CNTHABEMN)* -1,SUM(A.CNTHABEMN)),'
          +'       case when SUM(A.CNTHABEMN)<=0 then SUM(A.CNTHABEMN)*-1 else SUM(A.CNTHABEMN) end,'
         // +'       decode(greatest(SUM(A.CNTHABEME),0),0,SUM(A.CNTHABEME)* -1,SUM(A.CNTHABEME)), '
          +'       case when SUM(A.CNTHABEME)<=0 then SUM(A.CNTHABEME)*-1 else SUM(A.CNTHABEME) end,'

          +'       A.CNTTS, A.CNTMODDOC, A.CNTMODDOC '
          +'  FROM CNT311 A '
          +' WHERE A.CIAID='+quotedstr(dblcCia.value)
          +'   AND A.TDIARID='+quotedstr(dblcTDiarioAC.Value)
          +'   AND A.CNTANOMM='+quotedstr(xAnocie)
          +'   AND A.CNTCOMPROB='+quotedstr(dbeNoCompAC.text)
          +' GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,A.CNTTCAMBIO, '
          +'          A.CNTFCOMP,A.CNTESTADO,A.CNTCUADRE,A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, '
          +'          A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, A.TDIARDES, '
          +'          A.FLAGVAR,A.CNTTS, A.CNTMODDOC';
// Fin HPC_201401_CNT
   Try
      DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   Screen.Cursor := CrDefault;

   ShowMessage('Cierre Ok');
End;

Procedure TFCierreAno.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMCNT.cdsNivel.Close;
   DMCNT.cdsQry3.Close;
   DMCNT.cdsQry3.indexfieldnames := '';
End;

Procedure TFCierreAno.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFCierreAno.Asigna;
Begin
   DMCNT.cdsCNT311.Insert;
   DMCNT.cdsCNT311.FieldByName('CIAID').AsString := dblcCia.value;
   DMCNT.cdsCNT311.FieldByName('TDIARID').AsString := dblcTDiarioAC.Value;
   DMCNT.cdsCNT311.FieldByName('CNTCOMPROB').AsString := '0000000001';
   DMCNT.cdsCNT311.FieldByName('CNTANO').AsString := speAno.text;
   DMCNT.cdsCNT311.FieldByName('CNTANOMM').AsString := speAno.text + '13';
   DMCNT.cdsCNT311.FieldByName('CNTLOTE').AsString := '0000';
   DMCNT.cdsCNT311.FieldByName('CUENTAID').AsString := xCuentaid;
   DMCNT.cdsCNT311.FieldByName('CLAUXID').AsString := xClauxid;
   DMCNT.cdsCNT311.FieldByName('AUXID').AsString := xAuxid;

   If DMCNT.cdsVariable.FieldByName('CTA_DOC').AsString = 'S' Then
   Begin
      DMCNT.cdsCNT311.FieldByName('DOCID').AsString := '23';
      DMCNT.cdsCNT311.FieldByName('CNTSERIE').AsString := '000';
      DMCNT.cdsCNT311.FieldByName('CNTNODOC').AsString := '0000000001';
   End
   Else
   Begin
      DMCNT.cdsCNT311.FieldByName('DOCID').AsString := '';
      DMCNT.cdsCNT311.FieldByName('CNTSERIE').AsString := ''; //'000';
      DMCNT.cdsCNT311.FieldByName('CNTNODOC').AsString := ''; //'0000000001';
   End;
   DMCNT.cdsCNT311.FieldByName('CNTGLOSA').AsString := edtGlosaAC.text;

   DMCNT.cdsCNT311.FieldByName('CCOSID').AsString := xCcosid;

   DMCNT.cdsCNT311.FieldByName('CNTTCAMBIO').AsString := xTcambio;

   If xSaldmn12 < 0 Then
      DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat := (-1) * xSaldmn12
   Else
      DMCNT.cdsCNT311.FieldByName('CNTMTOORI').AsFloat := xSaldmn12;

   If xSaldmn12 < 0 Then
      DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat := (-1) * xSaldmn12
   Else
      DMCNT.cdsCNT311.FieldByName('CNTMTOLOC').AsFloat := xSaldmn12;

   If xSaldmn12 < 0 Then
      DMCNT.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat := (-1) * (xSaldmn12 / StrToFloat(xTcambio))
   Else
      DMCNT.cdsCNT311.FieldByName('CNTMTOEXT').AsFloat := xSaldmn12 / StrToFloat(xTcambio);

   If xSaldMn12 > 0 Then
   Begin
      DMCNT.cdsCNT311.FieldByName('CNTDH').AsString := 'H';
      DMCNT.cdsCNT311.FieldByName('CNTHABEMN').AsFloat := xSaldMn12;
      DMCNT.cdsCNT311.FieldByName('CNTHABEME').AsFloat := xSaldMn12 / StrToFloat(xTCambio);
   End
   Else
   Begin
      DMCNT.cdsCNT311.FieldByName('CNTDH').AsString := 'D';
      DMCNT.cdsCNT311.FieldByName('CNTDEBEMN').AsFloat := -1 * xSaldMn12;
      DMCNT.cdsCNT311.FieldByName('CNTDEBEME').Asfloat := -1 * (xSaldMn12 / StrToFloat(xTCambio));
   End;

   DMCNT.cdsCNT311.FieldByName('CNTFEMIS').AsDateTime := StrToDate('31/12/' + speAno.text);
   DMCNT.cdsCNT311.FieldByName('CNTFVCMTO').AsDateTime := StrToDate('31/12/' + speAno.text);
   DMCNT.cdsCNT311.FieldByName('CNTFCOMP').AsDateTime := StrToDate('31/12/' + speAno.text);
   DMCNT.cdsCNT311.FieldByName('CNTESTADO').AsString := 'I';
   DMCNT.cdsCNT311.FieldByName('CNTCUADRE').AsString := '';
   DMCNT.cdsCNT311.FieldByName('CNTFAUTOM').AsString := '';
   DMCNT.cdsCNT311.FieldByName('CNTUSER').AsString := 'SACSA'; //por ahora
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
   DMCNT.cdsCNT311.FieldByName('FLAGVAR').AsString := '';
   DMCNT.cdsCNT311.FieldByName('FCONS').AsString := '';
   DMCNT.cdsCNT311.FieldByName('CNTFMEC').AsString := '';
   DMCNT.cdsCNT311.FieldByName('TDIARDES').AsString := edtTDiarioAC.text;
   xWhere := 'CIAID=' + quotedstr(dblcCia.value) + ' AND CUENTAID=' + quotedstr(xCuentaid);
   DMCNT.cdsCNT311.FieldByName('CTADES').AsString := DMCNT.DisplayDescrip('prvTGE', 'TGE202', 'CTADES', xWhere, 'CTADES');
   DMCNT.cdsCNT311.FieldByName('AUXDES').AsString := '';
   DMCNT.cdsCNT311.FieldByName('CCOSDES').AsString := '';

   If xCtadoc = 'S' Then
      DMCNT.cdsCNT311.FieldByName('DOCDES').AsString := DMCNT.DisplayDescrip('prvTGE', 'TGE110', 'DOCDES', 'DOCID=' + quotedstr('23'), 'DOCDES')
   Else
      DMCNT.cdsCNT311.FieldByName('DOCDES').AsString := '';

   DMCNT.cdsCNT311.FieldByName('CNTSALDMN').AsString := '';
   DMCNT.cdsCNT311.FieldByName('CNTSALDME').AsString := '';
   DMCNT.cdsCNT311.FieldByName('CAMPOVAR').AsString := '';
   DMCNT.cdsCNT311.FieldByName('CNTTS').AsString := 'BV';
   DMCNT.cdsCNT311.FieldByName('CNTPAGADO').AsString := '';
   DMCNT.cdsCNT311.FieldByName('CNTMODDOC').AsString := 'CNT';
   xReg := xReg + 1;
   DMCNT.cdsCNT311.FieldByName('CNTREG').AsFloat := xReg;
   DMCNT.cdsCNT311.FieldByName('MODULO').AsString := 'CNT';
   DMCNT.cdsCNT311.FieldByName('CTA_SECU').AsString := xSecu;
   // Inicio HPC_201403_CNT
   //cdspost(DMCNT.cdsCNT311);
   DMCNT.cdsCNT311.Post;
   //DMCNT.AplicaDatos(DMCNT.cdsCNT311, 'CNT311');
   if DMCNT.cdsCNT311.ApplyUpdates(0)>0 then
   begin
      ShowMessage('No se puede Asignar');
      exit;
   end;
   // Fin HPC_201403_CNT
End;

Procedure TFCierreAno.BitBtn1Click(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'select CTA_SECU, CTACONTRA, CTA '
          +'  from (select CUENTAID, CTACONTRA, CTA_SECU, SUBSTR(CUENTAID,1,2) CTA '
          +'          from TGE202 '
          +'         where CIAID='+quotedstr(dblcCia.value)
          +'           and CTACONTRA is not null '
          +'           and CTA_SECU is not null '
          +'           and nvl(CTA_CIER,''N'')=''S'' '
          +'         order by CTA_SECU, CUENTAID '
          +'        ) A '
          +' group by CTA_SECU, CTACONTRA, CTA '
          +' order by CTA_SECU';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(xSQL);
   DMCNT.cdsQry.Open;
   While Not DMCNT.cdsQry.Eof Do
   Begin
      xSQL := 'update TGE202 '
             +'   set CTACONTRA='+quotedstr(DMCNT.cdsQry.FieldByname('CTACONTRA').AsString)+', '
             +'       CTA_SECU='+quotedstr(DMCNT.cdsQry.FieldByname('CTA_SECU').AsString)+', '
             +'       CTA_CIER=''S'' '
             +' where CIAID='+quotedstr(dblcCia.value)
             +'   and CUENTAID like '+quotedstr(DMCNT.cdsQry.FieldByname('CTA').AsString+'%') 
             +'   and (CTACONTRA is null or CTA_SECU is null or nvl(CTA_CIER,''N'')<>''S'') '
             +'   and CTA_DET=''S'' ';
      Try
         DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
      End;
      DMCNT.cdsQry.Next;
   End;

   ShowMessage('Inconsistencias Corregidas');
End;

procedure TFCierreAno.bbtnCancClick(Sender: TObject);
begin
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry3.Close;
   DMCNT.cdsQry4.close;
   DMCNT.cdsVariable.Close;
   DMCNT.cdsCNT311.Close;
   Close;
end;

procedure TFCierreAno.bbtnVerfPlanCtasClick(Sender: TObject);
var
   xSQL : String;
begin
   xSQL := 'select * from ( '
      + '                  Select ''Para las Cuentas 70  asignar la Cuenta de Cierre 80  y la Secuencia 01'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''70%''  and (nvl(CTACONTRA,''XX'')<>''80''  OR nvl(CTA_SECU,''XX'')<> ''01'') union all '
      + '                  Select ''Para las Cuentas 69  asignar la Cuenta de Cierre 80  y la Secuencia 01'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''69%''  and (nvl(CTACONTRA,''XX'')<>''80''  OR nvl(CTA_SECU,''XX'')<> ''01'') union all '
      + '                  Select ''Para las Cuentas 61  asignar la Cuenta de Cierre 80  y la Secuencia 02'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''61%''  and (nvl(CTACONTRA,''XX'')<>''80''  OR nvl(CTA_SECU,''XX'')<> ''02'') union all '
      + '                  Select ''Para las Cuentas 60  asignar la Cuenta de Cierre 80  y la Secuencia 02'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''60%''  and (nvl(CTACONTRA,''XX'')<>''80''  OR nvl(CTA_SECU,''XX'')<> ''02'') union all '
      + '                  Select ''Para las Cuentas 80  asignar la Cuenta de Cierre 82  y la Secuencia 03'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''80%''  and (nvl(CTACONTRA,''XX'')<>''82''  OR nvl(CTA_SECU,''XX'')<> ''03'') union all '
      + '                  Select ''Para las Cuentas 93  asignar la Cuenta de Cierre 82  y la Secuencia 04'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''93%''  and (nvl(CTACONTRA,''XX'')<>''82''  OR nvl(CTA_SECU,''XX'')<> ''04'') union all '
      + '                  Select ''Para las Cuentas 63  asignar la Cuenta de Cierre 82  y la Secuencia 04'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''63%''  and (nvl(CTACONTRA,''XX'')<>''82''  OR nvl(CTA_SECU,''XX'')<> ''04'') union all '
      + '                  Select ''Para las Cuentas 82  asignar la Cuenta de Cierre 83  y la Secuencia 05'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''82%''  and (nvl(CTACONTRA,''XX'')<>''83''  OR nvl(CTA_SECU,''XX'')<> ''05'') union all '
      + '                  Select ''Para las Cuentas 94  asignar la Cuenta de Cierre 83  y la Secuencia 06'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''94%''  and (nvl(CTACONTRA,''XX'')<>''83''  OR nvl(CTA_SECU,''XX'')<> ''06'') union all '
      + '                  Select ''Para las Cuentas 64  asignar la Cuenta de Cierre 83  y la Secuencia 06'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''64%''  and (nvl(CTACONTRA,''XX'')<>''83''  OR nvl(CTA_SECU,''XX'')<> ''06'') union all '
      + '                  Select ''Para las Cuentas 92  asignar la Cuenta de Cierre 83  y la Secuencia 06'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''92%''  and (nvl(CTACONTRA,''XX'')<>''83''  OR nvl(CTA_SECU,''XX'')<> ''06'') union all '
      + '                  Select ''Para las Cuentas 62  asignar la Cuenta de Cierre 83  y la Secuencia 06'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''62%''  and (nvl(CTACONTRA,''XX'')<>''83''  OR nvl(CTA_SECU,''XX'')<> ''06'') union all '
      + '                  Select ''Para las Cuentas 83  asignar la Cuenta de Cierre 84  y la Secuencia 07'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''83%''  and (nvl(CTACONTRA,''XX'')<>''84''  OR nvl(CTA_SECU,''XX'')<> ''07'') union all '
      + '                  Select ''Para las Cuentas 65  asignar la Cuenta de Cierre 84  y la Secuencia 08'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''65%''  and (nvl(CTACONTRA,''XX'')<>''84''  OR nvl(CTA_SECU,''XX'')<> ''08'') union all '
      + '                  Select ''Para las Cuentas 98  asignar la Cuenta de Cierre 84  y la Secuencia 08'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''98%''  and (nvl(CTACONTRA,''XX'')<>''84''  OR nvl(CTA_SECU,''XX'')<> ''08'') union all '
      + '                  Select ''Para las Cuentas 95  asignar la Cuenta de Cierre 84  y la Secuencia 08'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''95%''  and (nvl(CTACONTRA,''XX'')<>''84''  OR nvl(CTA_SECU,''XX'')<> ''08'') union all '
      + '                  Select ''Para las Cuentas 68  asignar la Cuenta de Cierre 84  y la Secuencia 08'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''68%''  and (nvl(CTACONTRA,''XX'')<>''84''  OR nvl(CTA_SECU,''XX'')<> ''08'') union all '
      + '                  Select ''Para las Cuentas 75  asignar la Cuenta de Cierre 84  y la Secuencia 09'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''75%''  and (nvl(CTACONTRA,''XX'')<>''84''  OR nvl(CTA_SECU,''XX'')<> ''09'') union all '
      + '                  Select ''Para las Cuentas 84  asignar la Cuenta de Cierre 85  y la Secuencia 10'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''84%''  and (nvl(CTACONTRA,''XX'')<>''85''  OR nvl(CTA_SECU,''XX'')<> ''10'') union all '
      + '                  Select ''Para las Cuentas 79  asignar la Cuenta de Cierre 78  y la Secuencia 11'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''79%''  and (nvl(CTACONTRA,''XX'')<>''78''  OR nvl(CTA_SECU,''XX'')<> ''11'') union all '
      + '                  Select ''Para las Cuentas 78  asignar la Cuenta de Cierre 85  y la Secuencia 12'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''78%''  and (nvl(CTACONTRA,''XX'')<>''85''  OR nvl(CTA_SECU,''XX'')<> ''12'') union all '
      + '                  Select ''Para las Cuentas 76  asignar la Cuenta de Cierre 85  y la Secuencia 13'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''76%''  and (nvl(CTACONTRA,''XX'')<>''85''  OR nvl(CTA_SECU,''XX'')<> ''13'') union all '
      + '                  Select ''Para las Cuentas 77  asignar la Cuenta de Cierre 85  y la Secuencia 13'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''77%''  and (nvl(CTACONTRA,''XX'')<>''85''  OR nvl(CTA_SECU,''XX'')<> ''13'') union all '
      + '                  Select ''Para las Cuentas 97  asignar la Cuenta de Cierre 85  y la Secuencia 14'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''97%''  and (nvl(CTACONTRA,''XX'')<>''85''  OR nvl(CTA_SECU,''XX'')<> ''14'') union all '
      + '                  Select ''Para las Cuentas 66  asignar la Cuenta de Cierre 85  y la Secuencia 14'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''66%''  and (nvl(CTACONTRA,''XX'')<>''85''  OR nvl(CTA_SECU,''XX'')<> ''14'') union all '
      + '                  Select ''Para las Cuentas 67  asignar la Cuenta de Cierre 85  y la Secuencia 14'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''67%''  and (nvl(CTACONTRA,''XX'')<>''85''  OR nvl(CTA_SECU,''XX'')<> ''14'') union all '
      + '                  Select ''Para las Cuentas 71  asignar la Cuenta de Cierre 811 y la Secuencia 15'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''71%''  and (nvl(CTACONTRA,''XX'')<>''811'' OR nvl(CTA_SECU,''XX'')<> ''15'') union all '
      + '                  Select ''Para las Cuentas 81  asignar la Cuenta de Cierre 891 y la Secuencia 16'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''81%''  and (nvl(CTACONTRA,''XX'')<>''891'' OR nvl(CTA_SECU,''XX'')<> ''16'') union all '
      + '                  Select ''Para las Cuentas 85  asignar la Cuenta de Cierre 891 y la Secuencia 17'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''85%''  and (nvl(CTACONTRA,''XX'')<>''891'' OR nvl(CTA_SECU,''XX'')<> ''17'') union all '
      + '                  Select ''Para las Cuentas 891 asignar la Cuenta de Cierre 591 y la Secuencia 18'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''891%'' and (nvl(CTACONTRA,''XX'')<>''591'' OR nvl(CTA_SECU,''XX'')<> ''18'') union all '
      + '                  Select ''Para las Cuentas 898 asignar la Cuenta de Cierre 591 y la Secuencia 19'' OBSERVACION, CIAID, CUENTAID, CTADES, CTACONTRA, CTA_SECU '
      + '                    from TGE202 where CIAID not in (''03'',''06'') and CUENTAID like ''898%'' and (nvl(CTACONTRA,''XX'')<>''591'' OR nvl(CTA_SECU,''XX'')<> ''19'') '
      + '                  ) '
      + '                  order by CIAID, CUENTAID';
   DMCNT.cdsReporte.Close;
   DMCNT.cdsReporte.DataRequest(xSQL);
   DMCNT.cdsReporte.Open;
   If DMCNT.cdsReporte.RecordCount>0 then
      ExportExcelVerif
   Else
   Begin
      ShowMessage('No se presentaron inconsistencias en el Plan de Cuentas');
      Exit;
   End;
end;

// Inicio HPC_201701_CNT
procedure TFCierreAno.ExportExcelVerif;
Var
   XLApp: Variant;
   Sheet: Variant;

   i, iIni, iFin, c: Integer;
   nNum: integer;
   cEstadoRep, sMoneda, sIni, sFin: String;

Begin

   XLApp := CreateOleObject('Excel.Application');
   XLApp.Visible := True;
   XLApp.Workbooks.Add(xlWBatWorkSheet);
   XLApp.Workbooks[1].WorkSheets[1].Name := 'Verif.Ctas.Cierre';
   Sheet := XLApp.Workbooks[1].WorkSheets['Verif.Ctas.Cierre'];

   sheet.Columns[1].ColumnWidth := 80;  // Observación
   sheet.Columns[2].ColumnWidth := 12;   // Compañía
   sheet.Columns[3].ColumnWidth := 20;  // Cuenta Contable
   sheet.Columns[4].ColumnWidth := 60;  // Descripción Cuenta Contable
   sheet.Columns[5].ColumnWidth := 20;  // Cuenta de Cierre
   sheet.Columns[6].ColumnWidth := 15;   // Secuencia

   i := 1;
   sheet.cells[i, 1] := 'Derrama Magisterial - Contabilidad';
   sheet.cells[i, 2] := '';
   sheet.cells[i, 3] := '';
   sheet.cells[i, 4] := '';
   sheet.cells[i, 5] := '';
   sheet.cells[i, 6] := DATETOSTR(DATE);
   sheet.cells[i, 6].HorizontalAlignment := xlRight;

   inc(i);
   sheet.cells[i, 1] := 'VERIFICA CUENTAS DE CIERRE EN PLAN DE CUENTAS';
   sheet.cells[i, 2] := '';
   sheet.cells[i, 3] := '';
   sheet.cells[i, 4] := '';
   sheet.cells[i, 5] := '';
   sheet.cells[i, 6] := TIMETOSTR(TIME);
   sheet.cells[i, 6].HorizontalAlignment := xlRight;

// Titulos
   inc(i);
   inc(i);
// Observación
// Compañía
// Cuenta Contable
// Descripción Cuenta Contable
// Cuenta de Cierre
// Secuencia
   sheet.cells[i, 1] := 'Observación';
   sheet.cells[i, 2] := 'Compañía';
   sheet.cells[i, 3] := 'Cuenta Contable';
   sheet.cells[i, 4] := 'Descripción Cuenta Contable';
   sheet.cells[i, 5] := 'Cuenta de Cierre';
   sheet.cells[i, 6] := 'Secuencia';
   sheet.Range['A5:N5'].Font.Bold := True;


   For c := 1 To 6 Do
   Begin
      sheet.cells[i, c].Font.Bold := True;
      sheet.cells[i, c].Interior.Color := clGray;
   End;

   inc(i);
   iIni := i + 1;
   DMCNT.cdsReporte.First;
   While Not DMCNT.cdsReporte.Eof Do
   Begin
      inc(i);
      sheet.cells[i, 1] := DMCNT.cdsReporte.FieldbyName('OBSERVACION').AsString;
      sheet.cells[i, 2] := '"'+DMCNT.cdsReporte.FieldbyName('CIAID').AsString;
      sheet.cells[i, 3] := '"'+DMCNT.cdsReporte.FieldbyName('CUENTAID').AsString;
      sheet.cells[i, 4] := DMCNT.cdsReporte.FieldbyName('CTADES').AsString;
      sheet.cells[i, 5] := '"'+DMCNT.cdsReporte.FieldbyName('CTACONTRA').AsString;
      sheet.cells[i, 6] := '"'+DMCNT.cdsReporte.FieldbyName('CTA_SECU').AsString;
      DMCNT.cdsReporte.Next;
   End;
end;
// Fin HPC_201701_CNT

End.

