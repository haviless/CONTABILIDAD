Unit CNT210;

// Actualizaciones
// HPC_201401_CNT Se añade la eliminación de asientos de detracciones generadas por telecrédito
//                Tipo de Diario 62.
// HPC_201402_CNT 03/03/2014  Modificar los ControlTrans, AplicaDato y los ApplyUpdates.
// HPC_201403_CNT 25/02/2014  Modificar los ControlTrans, AplicaDato, cdspost y los ApplyUpdates.
// HPC_201406_CNT 11/04/2014  retiro de los applyupdates faltantes
//                            Se corrige sangría del formulario
// HPC_201409_CNT 08/09/2014  Se modifica la rutina de eliminacion proveniente de Cuentas por Cobrar
//                            Faltaba el commit(manejo de transaccion) en este proceso.
// HPC_201501_CNT 02/02/2015  Botón para Conciliación Bancaria - CNT230
// HPC_201503_CNT 12/10/2015  Se modifica la Eliminación de asientos contables originados por Órdenes de Pago, para que no limpie la Fecha de Contabilización en la cabecera de Órdenes de Pago.
//                            Se modificó la contabilización de asientos en bloque.
// HPC_201601_CNT 18/01/2016: Verifica que Detalle Temporal CNT311 tenga registros, que no exista en Detalle contable Oficial CNT301 y que este correctamente renumerado
// HPC_201602_CNT 31/03/2016  DAF_2016000283_CXP_1 Añade Formulario que homogenizará Números de Serie y Documentos por Cia+Proveedor
// HPC_201703_CNT           : Seguros-Automatización de Devengue de Seguros
// HPC_201801_CNT 17/01/2018  Ajustes en la eliminación de los asientos devengados

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ExtCtrls, db, DBClient, wwclient, Mant, StdCtrls, Mask, oaContabiliza;

Type
   TFToolComprobante = Class(TForm)
      PnlComprobante: TPanel;
      sbtABl: TSpeedButton;
      SpeedButton3: TSpeedButton;
      sbtCBl: TSpeedButton;
      Z2sbEliminaAsiento: TSpeedButton;
      Z2sbPlanillas: TSpeedButton;
      sbEncinas: TSpeedButton;
      sbCopiar: TSpeedButton;
      bbtnConcBanc: TBitBtn;
   // Inicio HPC_201602_CNT
      bbtnRegNumDocs: TBitBtn;
// Inicio HPC_201703_CNT
// Seguros-Automatización de Devengue de Seguros
    spbSeguros: TSpeedButton;
    spbDevengado: TSpeedButton;
// Fin HPC_201703_CNT
   // Fin HPC_201602_CNT
      Procedure SpeedButton1Click(Sender: TObject);
      Procedure SpeedButton2Click(Sender: TObject);
      Procedure sbtABlClick(Sender: TObject);
      Function AsientoCuadra: Boolean;
      Function Valida_Cuenta_y_CCosto: Boolean;
      Procedure sbtCBlClick(Sender: TObject);
      Procedure Z2sbEliminaAsientoClick(Sender: TObject);
      Procedure Z2sbPlanillasClick(Sender: TObject);
      Procedure sbEncinasClick(Sender: TObject);
      Procedure sbCopiarClick(Sender: TObject);
      Procedure bbtnConcBancClick(Sender: TObject);
   // Inicio HPC_201602_CNT
      procedure bbtnRegNumDocsClick(Sender: TObject);
// Inicio HPC_201703_CNT
// Seguros-Automatización de Devengue de Seguros
    procedure spbSegurosClick(Sender: TObject);
    procedure spbDevengadoClick(Sender: TObject);
// Fin HPC_201703_CNT
   // Fin HPC_201602_CNT

   Private
    { Private declarations }
      MProv: TMant;
      xxMND: Double;
      xxMNC: Double;
      xxMED: Double;
      xxMEC: Double;

    //Agregado por Ana
      xCont: String;
      cdsGComprobante: TwwClientDataSet;
      Procedure TotalesResumen;
   Public
    { Public declarations }
      xToolCia, xTooldiario, xToolAnomm, xToolPeriodo, xToolEstado: String;
      Function PeriodoCuadra: Boolean;
   End;

Var
   FToolComprobante: TFToolComprobante;
   xSqlMant: String;

Implementation

// Inicio HPC_201602_CNT
// DAF_2016000283_CXP_1 - CNT240.pas Formulario que homogenizará Números de Serie y Documentos por Cia+Proveedor
// Inicio HPC_201703_CNT
// Seguros-Automatización de Devengue de Seguros
Uses CNT211, CNTDM, oaCN2000, CNT201, CNT280, CNT215, CNT230, CNT240,
  CNT700A, CNT702A;
// Fin HPC_201703_CNT
// Fin HPC_201602_CNT

{$R *.DFM}

Procedure TFToolComprobante.SpeedButton1Click(Sender: TObject);
Begin
   FImpBloComp := TFImpBloComp.Create(Self);
   Try
      FImpBloComp.ShowModal;
   Finally
      FImpBloComp.free;
   End;

End;

Procedure TFToolComprobante.SpeedButton2Click(Sender: TObject);
Begin
   DMCNT.cdsCabCNT.Data := FRegistro.GComprobante.FMant.cds2.Data;
   FImpBloComp := TFImpBloComp.Create(Self);
   Try
      FImpBloComp.ShowModal;
   Finally
      FImpBloComp.free;
   End;

End;

Function TFToolComprobante.PeriodoCuadra: Boolean;
Var
   xA, xR, xI: integer;
   P, E, T: String;
Begin
   result := False;

   xA := 0;
   xR := 0;
   xI := 0;
   cdsGComprobante.First;
   P := cdsGComprobante.FieldByName('CNTANOMM').AsString;
   E := cdsGComprobante.FieldByName('CNTESTADO').AsString;
   While Not cdsGComprobante.EOF Do
   Begin
      T := cdsGComprobante.FieldByName('CNTANOMM').AsString;

      If (P = T) And (E = 'I') Then //Si periodos son iguales
         xA := xA + 1
      Else
         If P <> T Then //  Compara si los periodos son iguales
         Begin
            Showmessage(' Debe Aceptar solo Registros con periodos iguales');
            xR := xR + 1;
            result := False;
            Exit;
         End;

        // validación de  los estados
      If (E = 'P') Or (E = 'C') Then //Pendiente  o Contabilizado
      Begin
         Showmessage(' Debe Aceptar solo Incompletos');
         xI := xI + 1;
         result := False;
         Exit;
      End;

      cdsGComprobante.Next;
   End;
   If (xR = 0) Or (xI = 0) Then
      result := true;
End;

Function TFToolComprobante.AsientoCuadra: Boolean;
Var
   xTotDebe, xTotHaber: DOUBLE;
Begin
   Result := False;
   xTotDebe := 0;
   xTotHaber := 0;
   DMCNT.cdsMovCnt1.DisableControls;
   DMCNT.cdsMovCnt1.First;
   While Not DMCNT.cdsMovCnt1.eof Do
   Begin
      If DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString = 'D' Then
         xTotDebe := xTotDebe + DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat
      Else
      Begin
         xTotHaber := xTotHaber + DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat;
      End;
      DMCNT.cdsMovCnt1.Next;
   End;
   DMCNT.cdsMovCnt1.First;
   DMCNT.cdsMovCnt1.EnableControls;
   If DMCNT.FRound(xTotDebe, 15, 2) = DMCNT.FRound(xTotHaber, 15, 2) Then Result := True;
End;

Function TFToolComprobante.Valida_Cuenta_y_CCosto: Boolean;
Var
   xSQL, cFlAux, cFLCC: String;
Begin
   Result := False;

   DMCNT.cdsMovCnt1.First;
   While Not DMCNT.cdsMovCnt1.eof Do
   Begin
   // revisar si cuenta contable esta activa
      xSQL := 'Select CIAID, CUENTAID, CTAACT, CTA_AUX, CTA_CCOS '
            + '  from TGE202 '
            + ' where CIAID=''' + DMCNT.cdsMovCnt1.FieldByName('CIAID').AsString + ''''
            + '   and CUENTAID=''' + DMCNT.cdsMovCnt1.FieldByName('CUENTAID').AsString + ''''
            + '   and CTAACT=''S''';
      DMCNT.cdsSQL.Close;
      DMCNT.cdsSQL.DataRequest(xSQL);
      DMCNT.cdsSQL.Open;
      If DMCNT.cdsSQL.Recordcount <= 0 Then
      Begin
         Exit;
      End;

      cFlAux := DMCNT.cdsSQL.FieldByName('CTA_AUX').AsString;
      cFLCC := DMCNT.cdsSQL.FieldByName('CTA_CCOS').AsString;

      If cFLCC = 'S' Then
      Begin
         If DMCNT.cdsMovCnt1.FieldByName('CCOSID').AsString = '' Then
         Begin
            Exit;
         End;

         // revisar si centro de costo esta activo
         xSQL := 'Select CCOSID, CCOSACT '
                +'  from TGE203 '
                +' where CCOSID=''' + DMCNT.cdsMovCnt1.FieldByName('CCOSID').AsString + ''''
                +'   and CCOSACT=''S''';
         DMCNT.cdsSQL.Close;
         DMCNT.cdsSQL.DataRequest(xSQL);
         DMCNT.cdsSQL.Open;
         If DMCNT.cdsSQL.Recordcount <= 0 Then
         Begin
            Exit;
         End;
      End;

      If cFlAux = 'S' Then
      Begin
         If DMCNT.cdsMovCnt1.FieldByName('AUXID').AsString = '' Then
         Begin
            Exit;
         End;

         // revisar si centro de costo esta activo
         xSQL := 'Select CLAUXID, AUXID, AUXNOMB '
                +'  from CNT201 '
                +' where CLAUXID=''' + DMCNT.cdsMovCnt1.FieldByName('CLAUXID').AsString + ''' '
                +'   and AUXID=''' + DMCNT.cdsMovCnt1.FieldByName('AUXID').AsString + '''';
         DMCNT.cdsSQL.Close;
         DMCNT.cdsSQL.DataRequest(xSQL);
         DMCNT.cdsSQL.Open;
         If DMCNT.cdsSQL.Recordcount <= 0 Then
         Begin
            Exit;
         End;
      End;

      DMCNT.cdsMovCnt1.Next;
   End;
   DMCNT.cdsMovCnt1.First;

   Result := True;
End;

Procedure TFToolComprobante.sbtABlClick(Sender: TObject);
Var
   P, E, T, xFiltro, xtmonid: String;
   xClAuxId, xProv: String;
   xCPMtoLoc, xCPMtoExt: double;
   xCia, xPer, xDiar, xNReg, xcompro: String;
   xSqlMant: String;

Begin
   If MessageDlg('Aceptar Comprobantes' + chr(13) + chr(13) +
      '  ¿ Esta Seguro ?  ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then exit;
//   xSqlMant := FPrincipal.GComprobante.FMant.SQL;
   xSqlMant := FRegistro.GComprobante.FMant.SQL;

   If pos('CIAID=', xSqlMant) > 0 Then
      xToolCia := copy(xSqlMant, pos('CIAID=', xSqlMant) + 7, 2);
   If pos('TDIARID=', xSqlMant) > 0 Then
      xTooldiario := copy(xSqlMant, pos('TDIARID=', xSqlMant) + 9, 2);
   If pos('CNTANOMM=', xSqlMant) > 0 Then
      xToolPeriodo := copy(xSqlMant, pos('CNTANOMM=', xSqlMant) + 10, 6);
   If pos('CNTESTADO=', xSqlMant) > 0 Then
      xToolEstado := copy(xSqlMant, pos('CNTESTADO=', xSqlMant) + 9, 2);

   If (xToolCIa = '') Then
   Begin
      Raise exception.Create('Debe de Filtrar también por Compañia');
   End;

   If (xTooldiario = '') Then
   Begin
      Raise exception.Create('Debe de Filtrar también por Tipo de Diario');
   End;

   If (xToolPeriodo = '') Then
   Begin
      Raise exception.Create('Debe de Filtrar también por Periodo');
   End;

   If (xToolEstado = '') Then
   Begin
      Raise exception.Create('Debe de Filtrar también por Estado');
   End;

   Try
      screen.Cursor := crHOURGLASS;

      DMCNT.cdsCabCNT.Data := FRegistro.GComprobante.FMant.cds2.Data;

      If FRegistro.xTipocomprobante = 'P' Then
      Begin
         cdsGComprobante := FRegistro.GComprobante.FMant.cds2; //Provisiones
         MProv := FRegistro.GComprobante;
      End;

      If Not PeriodoCuadra Then

         If MessageDlg('Aceptará Registros Diferentes e Incompletos' + chr(13) +
            '          ¿Está Seguro?  ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then exit;

      cdsGComprobante.Close;
      cdsGComprobante.Open;

      If cdsGComprobante.RecordCount = 0 Then
      Begin
         cdsGComprobante.EnableControls;
         showmessage('No existen Registros');
         Exit;
      End;

      cdsGComprobante.First;

      P := cdsGComprobante.FieldByName('CNTANOMM').AsString;

      While Not cdsGComprobante.EOF Do
      Begin
         T := cdsGComprobante.FieldByName('CNTANOMM').AsString;
         If Not (cdsGComprobante.FieldByName('CNTDEBEMN').asfloat = cdsGComprobante.FieldByName('CNTDEBEMN').asfloat) Then
         Begin
            ShowMessage(
               'Error:  Asiento NO Cuadra' + #13 +
               'Compañía  : ' + cdsGComprobante.FieldByName('CIAID').asstring + #13 +
               'T. Diario : ' + cdsGComprobante.FieldByName('TDIARID').asstring + #13 +
               'Periodo   : ' + cdsGComprobante.FieldByName('CPANOMES').asstring + #13 +
               'Registro  : ' + cdsGComprobante.FieldByName('CPNOREG').asstring);
            cdsGComprobante.Next;
            continue;
         End;

         E := cdsGComprobante.FieldByName('CNTESTADO').AsString;

         If (P = T) And (E = 'I') Then
         Begin
            xCont := 'S';
            xCia := cdsGComprobante.FieldByName('CIAID').value;
            xPer := cdsGComprobante.FieldByName('CNTANOMM').value;
            xDiar := cdsGComprobante.FieldByName('TDIARID').value;
            xCompro := cdsGComprobante.FieldByName('CNTCOMPROB').asstring;
            xtmonid := cdsGComprobante.FieldByName('TMONID').value;

            xFiltro := 'CIAID='+quotedstr(xCia)
                 +' and TDIARID='+quotedstr(xDiar)
                 +' and CNTANOMM='+quotedstr(xPer)
                 +' and CNTESTADO=''I'' '
                 +' and CNTCOMPROB='+quotedstr(xcompro);
            DMCNT.Filtracds(DMCNT.CdsMovCNT1, 'Select * from CNT301 Where ' + xFiltro);

            cdsGComprobante.Edit;
            cdsGComprobante.FieldByname('CNTESTADO').Value := 'P';
            DMCNT.cdsMovCnt1.First;
            While Not DMCNT.cdsMovCnt1.EOF Do
            Begin
               DMCNT.cdsMovCnt1.Edit;
               DMCNT.cdsMovCnt1.FieldByName('CNTESTADO').AsString := 'P';
               DMCNT.cdsMovCnt1.Post;
               DMCNT.cdsMovCnt1.Next;
            End;
            If DMCNT.cdsMovCnt1.ApplyUpdates(0) > 0 Then
            Begin
               ShowMessage('No se puede actualizar');
               exit;
            End;
            cdsGComprobante.NEXT;

         End;
      End;
   Finally
      cdsGComprobante.ApplyUpdates(0);
      ShowMessage('Proceso Finalizado');
      FRegistro.GComprobante.RefreshFilter;
      cdsGComprobante.enablecontrols;
      screen.Cursor := crDEFAULT;
   End;
End;

Procedure TFToolComprobante.sbtCBlClick(Sender: TObject);
Var
   xRegistros, xRegCon: Integer;
   xZ, nRegNT: Integer;
   xSql, xMest, cMensaje: String;
// Inicio HPC_201601_CNT
// Se añade variable para controlar duplicidad de contabilizaciones
   xSigue : Boolean;
// Fin HPC_201601_CNT
Begin
   If MessageDlg('Contabilizar Comprobantes' + chr(13) + chr(13) +
      '  ¿ Esta Seguro ?  ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then exit;

   xSqlMant := FRegistro.GComprobante.FMant.SQL;

   If pos('CIAID=', xSqlMant) > 0 Then
      xToolCia := copy(xSqlMant, pos('CIAID=', xSqlMant) + 7, 2);

   If pos('CNTANOMM=', xSqlMant) > 0 Then
      xToolAnomm := copy(xSqlMant, pos('CNTANOMM=', xSqlMant) + 10, 6);

   If pos('TDIARID=', xSqlMant) > 0 Then
      xTooldiario := copy(xSqlMant, pos('TDIARID=', xSqlMant) + 9, 2);

   If (xToolCIa = '') Then
   Begin
      showMessage('Debe de Filtrar también por Compañia');
      exit;
   End;

   If (xToolAnomm = '') Then
   Begin
      showMessage('Debe de Filtrar también por Periodo');
      exit;
   End;

   Screen.Cursor := CrHourGlass;

   FRegistro.GComprobante.FMant.cds2.Last;

   DMCNT.cdsCabCNT.Data := FRegistro.GComprobante.FMant.cds2.Data;

   xRegistros := 0;
   xRegCon := 0;

// LA DATA NO ESTA ACTUALIZADA AL SALIR DE LA VENTANA DE COMPROBANTE

   FRegistro.GComprobante.FMant.cds2.First;
   While Not FRegistro.GComprobante.FMant.cds2.Eof Do
   Begin
      xSQL := 'Select * from CNT300 '
            + ' where CIAID='+quotedstr(FRegistro.GComprobante.FMant.cds2.FieldByName('CIAID').AsString)
            + '   and TDIARID='+quotedstr(FRegistro.GComprobante.FMant.cds2.FieldByName('TDIARID').AsString)
            + '   and CNTANOMM='+quotedstr(FRegistro.GComprobante.FMant.cds2.FieldByName('CNTANOMM').AsString)
            + '   and CNTCOMPROB='+quotedstr(FRegistro.GComprobante.FMant.cds2.FieldByName('CNTCOMPROB').AsString);
      DMCNT.cdsCabCNT.Close;
      DMCNT.cdsCabCNT.DataRequest(xSQL);
      DMCNT.cdsCabCNT.Open;

      xRegistros := xRegistros + 1;

   // Inicio HPC_201601_CNT
   // Verifica que Detalle Temporal CNT311 tenga registros
   // que no exista en Detalle contable Oficial CNT301
   // y que este correctamdente Renumerado
      xSigue := True;

      xSQL := 'Select count(CNTREG) NUMREGS from CNT311 '
            + ' where CIAID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
            + '   and TDIARID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
            + '   and CNTANOMM='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
            + '   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest(xSQL);
      DMCNT.cdsQry.Open;
      if DMCNT.cdsQry.FieldByName('NUMREGS').AsInteger=0 then
      begin
         ShowMessage('No existen movimientos en Tabla Temporal CNT311');
         xSigue := False;
      end
      else
      begin
         xSQL := ' Select CNTCOMPROB from CNT301 '
               + ' where CIAID = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString)
               + '   and CNTANOMM = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString)
               + '   and TDIARID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString)
               + '   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString);
         DMCNT.cdsQry.Close;
         DMCNT.cdsQry.DataRequest(xSQL);
         DMCNT.cdsQry.Open;
         if DMCNT.cdsQry.RecordCount>0 then
         Begin
            xSQL := ' Delete from CNT301 '
                   + ' where CIAID = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString)
                   + '   and CNTANOMM = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString)
                   + '   and TDIARID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString)
                   + '   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString);
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Except
               ShowMessage('No se pudo borrar registro de CNT301');
               xSigue := False;
            end;
         End;

      // Verifica que campo CNTREG no esté repetido en Detalle
         xSQL := ' select CIAID,TDIARID,CNTANOMM,CNTCOMPROB,CNTREG,COUNT(CNTREG) CANTIDAD '
            + '      from CNT311 '
            + '     where CIAID = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString)
            + '       and CNTANOMM = '+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString)
            + '       and TDIARID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString)
            + '       and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString)
            + '     group by CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTREG '
            + '     having Count(CNTREG)> 1 ';
         DMCNT.cdsQry.Close;
         DMCNT.cdsQry.DataRequest(xSql);
         DMCNT.cdsQry.Open;
         If DMCNT.cdsQry.recordcount>0 then
         Begin
            ShowMessage('Número de Registro Duplicado');
            xSigue := False;
         End;
      End;

      If (DMCNT.cdsCabCNT.FieldByName('CNTCUADRE').AsString <> 'S') And
         (DMCNT.cdsCabCNT.FieldByName('CNTESTADO').AsString <> 'A') And
         (xSigue) Then
// Fin HPC_201601_CNT
      Begin
         xSQL := 'Select * from CNT311 '
               + ' where CIAID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CNTANOMM='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString)
               + ' order by CNTREG';
         DMCNT.cdsMovCNT1.Close;
         DMCNT.cdsMovCNT1.DataRequest(xSQL);
         DMCNT.cdsMovCNT1.Open;

         If (AsientoCuadra) And (Valida_Cuenta_y_CCosto) Then
         Begin

            Errorcount := 0;

            xSigueGrab := True;
            DMCNT.DCOM1.AppServer.IniciaTransaccion;
            FRegComp.CuadraAsiento;
         // Inicio HPC_201503_CNT
            if not xSigueGrab then
            begin
               DMCNT.DCOM1.AppServer.RetornaTransaccion;
            //   exit;
            end
            Else
            Begin
               If SOLConta(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString, DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString,
                  DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString, DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString,
                  SRV_D, 'C', DMCNT.wModulo, DMCNT.cdsMovCNT1, DMCNT.cdsNivel,
                  DMCNT.cdsResultSet, DMCNT.DCOM1, FRegistro.GComprobante.FMant) Then
               Begin

                  TotalesResumen;

                  DMCNT.cdsCabCnt.Edit;
                  DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString := 'S';
                  DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString := 'P';
                  DMCNT.cdsCabCnt.FieldByName('CNTDEBEMN').AsFloat := DMCNT.FRound(xxMND, 15, 2);
                  DMCNT.cdsCabCnt.FieldByName('CNTHABEMN').AsFloat := DMCNT.FRound(xxMNC, 15, 2);
                  DMCNT.cdsCabCnt.FieldByName('CNTDEBEME').AsFloat := DMCNT.FRound(xxMED, 15, 2);
                  DMCNT.cdsCabCnt.FieldByName('CNTHABEME').AsFloat := DMCNT.FRound(xxMEC, 15, 2);
                  DMCNT.cdsCabCnt.FieldByName('DOCMOD').AsString := DMCNT.wModulo;
                  DMCNT.cdsCabCnt.FieldByName('CNTUSER').AsString := DMCNT.wUsuario; // usuario que registra
                  DMCNT.cdsCabCnt.FieldByName('CNTFREG').AsDateTime := date; // fecha que registra usuario
                  DMCNT.cdsCabCnt.FieldByName('CNTHREG').AsdateTime := time; // hora que registra usuario
                  DMCNT.cdsCabCnt.Post;
               // Inicio HPC_201406_CNT
                  {
                  DMCNT.cdsCabCNT.DataRequest('Select * '
                                            + '  from CNT300 '
                                            + ' where CIAID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
                                            + '   and TDIARID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
                                            + '   and CNTANOMM='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
                                            + '   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString)
                                            + ')';
                  If DMCNT.cdsCabCNT.ApplyUpdates(0) > 0 Then
                  Begin
                     ShowMessage('No se puede actualizar la cabecera');
                     exit;
                  End;
                  }
                  xSQL := 'Update CNT300 '
                         +'   set FLAGVAR = null,'
                         +'       CNTCUADRE = '+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString)+','
                         +'       CNTESTADO = '+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString)+','
                         +'       CNTDEBEMN = '+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTDEBEMN').AsFloat)+','
                         +'       CNTHABEMN = '+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTHABEMN').AsFloat)+','
                         +'       CNTDEBEME = '+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTDEBEME').AsFloat)+','
                         +'       CNTHABEME = '+floattostr(DMCNT.cdsCabCnt.FieldByName('CNTHABEME').AsFloat)+','
                         +'       DOCMOD = '+quotedstr(DMCNT.cdsCabCnt.FieldByName('DOCMOD').AsString)+','
                         +'       CNTUSER = '+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTUSER').AsString)+','
                         +'       CNTFREG = trunc(sysdate), '
                         +'       CNTHREG = sysdate '
                         +' where CIAID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CIAID').AsString)
                         +'   and TDIARID='+quotedstr(DMCNT.cdsCabCNT.FieldByName('TDIARID').AsString)
                         +'   and CNTANOMM='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTANOMM').AsString)
                         +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCNT.FieldByName('CNTCOMPROB').AsString);
                  Try
                     DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
                  Except
                     DMCNT.DCOM1.AppServer.RetornaTransaccion;
                     ShowMessage('No se pudo actualizar la cabecera del asiento en la Contabilización');
                     exit;
                  end;
                  DMCNT.DCOM1.AppServer.GrabaTransaccion;
               // Fin HPC_201406_CNT

                  xRegCon := xRegCon + 1;
               End
               Else
               Begin
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
               End;
            End;
         // Fin HPC_201503_CNT
         End;
      End;
      FRegistro.GComprobante.FMant.cds2.Edit;
      FRegistro.GComprobante.FMant.cds2.FieldByName('CNTCUADRE').AsString := DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString;
      FRegistro.GComprobante.FMant.cds2.FieldByName('CNTESTADO').AsString := DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString;
      FRegistro.GComprobante.FMant.cds2.Post;
      FRegistro.GComprobante.FMant.cds2.Next;
   End;

   Screen.Cursor := CrDefault;

   cMensaje := '';
   If xRegistros - xRegCon > 0 Then
   Begin
      nRegNT := 0;
      FRegistro.GComprobante.FMant.cds2.First;
      While Not FRegistro.GComprobante.FMant.cds2.Eof Do
      Begin
         If FRegistro.GComprobante.FMant.cds2.FieldByName('CNTESTADO').AsString = 'I' Then
         Begin
            nRegNT := nRegNT + 1;
         End;
         FRegistro.GComprobante.FMant.cds2.Next;
      End;

      cMensaje := chr(13) + chr(13) + 'Existe(n)    ' + IntToStr(nRegNT) + '    registro(s) sin Contabilizar'
         + chr(13) + chr(13) + 'Revisar Cuentas Contables y Centros de Costo';
   End;

   ShowMessage('Contabilización en Bloque Terminada' + chr(13) + chr(13) +
      'Registros Procesados          : ' + IntToStr(xRegistros) + chr(13) + chr(13) +
      'Registros Contabilizados      : ' + IntToStr(xRegCon) + cMensaje);
End;

Procedure TFToolComprobante.TotalesResumen;
Begin
   xxMND := 0;
   xxMNC := 0;
   xxMED := 0;
   xxMEC := 0;
   DMCNT.cdsMovCnt1.DisableControls;
   DMCNT.cdsMovCnt1.First;
   While Not DMCNT.cdsMovCnt1.Eof Do
   Begin
      xxMND := xxMND + DMCNT.cdsMovCnt1.FieldByName('CNTDEBEMN').AsFloat;
      xxMNC := xxMNC + DMCNT.cdsMovCnt1.FieldByName('CNTHABEMN').AsFloat;
      xxMED := xxMED + DMCNT.cdsMovCnt1.FieldByName('CNTDEBEME').AsFloat;
      xxMEC := xxMEC + DMCNT.cdsMovCnt1.FieldByName('CNTHABEME').AsFloat;
      DMCNT.cdsMovCnt1.Next;
   End;
   DMCNT.cdsMovCnt1.EnableControls;
End;

Procedure TFToolComprobante.Z2sbEliminaAsientoClick(Sender: TObject);
Var
   xSQL, xWhere, xLLave: String;
   xCia, xTDiario, xAnoMes, xNroComp: String;
   xCia1, xTdiario1, xAnoMes1, xNroComp1: String;
   xCia2, xTdiario2, xAnoMes2, xNroComp2: String;
   xCia3, xTdiario3, xAnoMes3, xNroComp3: String;
   xCiaSede : String; // HPC_201410_CNT
   xAsientosElim : WideString; // HPC_201410_CNT
Begin

   DMCNT.cdsCabCNT.Data := FRegistro.GComprobante.FMant.cds2.Data;
   DMCNT.cdsCabCNT.GotoCurrent(FRegistro.GComprobante.FMant.cds2);
// verifica que asiento no esté contabilizado
   If (DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString <> 'I') Then
   Begin
      ShowMessage('Situación del comprobante no permite eliminación!');
      exit;
   End;

   // verifica que asiento haya sido generado por otro Modulo
   If (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'CNT') Or
      (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'CXP') Or
      (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'CXC') Or
      (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'CAJA') Or
      (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'PL') Then
      // pasa
   Else
   Begin
      ShowMessage('No se puede Eliminar Asientos del propio módulo de Contabilidad mediante esta opción');
      Exit;
   End;

   If MessageDlg(' ¿ Está seguro de eliminar el asiento en el módulo de Contabilidad ? ',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      xCia := DMCNT.cdsCabCnt.FieldByName('CIAID').AsString;
      xTdiario := DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString;
      xAnoMes := DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString;
      xNroComp := DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString;

// Inicio HPC_201801_CNT
// Ajustes en la eliminación de los asientos devengados
      // Seguros-Automatización de Devengue de Seguros
      If (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'CNT') And (DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString = '22') Then
      Begin
         DMCNT.DCOM1.AppServer.IniciaTransaccion;

         xSQL := 'delete from CNT311 '
               + 'where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Asiento');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         xSQL := 'delete from CNT300 '
               + 'where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera del Asiento');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         xSQL := 'delete from CNT_DEV_SEG_MOV '
               + 'where CIAIDCNT=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARIDCNT=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CPANOMESCNT=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar Devengue/Contabilización del Seguro');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         DMCNT.DCOM1.AppServer.GrabaTransaccion;
         ShowMessage('Comprobante Eliminado');
         DMCNT.ActualizaFiltro(FRegistro.GComprobante, DMCNT.cdsCabCNT, 'E');
         FRegistro.GComprobante.RefreshFilter;
         Exit;
      End;
// Fin HPC_201801_CNT
      // CONTABILIDAD
      If (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'CNT') Or
         (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'PL') Then
      Begin
         DMCNT.DCOM1.AppServer.IniciaTransaccion;

         xSQL := 'delete from CNT311 '
            + 'where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
            + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
            + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
            + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Asiento');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         xSQL := 'delete from CNT300 '
            + 'where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
            + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
            + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
            + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera del Asiento');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
         DMCNT.DCOM1.AppServer.GrabaTransaccion;
         ShowMessage('Comprobante Eliminado');
         DMCNT.ActualizaFiltro(FRegistro.GComprobante, DMCNT.cdsCabCNT, 'E');
         FRegistro.GComprobante.RefreshFilter;
         Exit;
      End; // FIN Contabilidad

      If (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'CAJA') And (DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString = '46') Then
      Begin
         DMCNT.DCOM1.AppServer.IniciaTransaccion;

         xSQL := 'delete from CNT311 '
               + 'where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Asiento');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         xSQL := 'delete from CNT300 '
               + 'where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera del Asiento');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
         DMCNT.DCOM1.AppServer.GrabaTransaccion;
         ShowMessage('Comprobante Eliminado');
         DMCNT.ActualizaFiltro(FRegistro.GComprobante, DMCNT.cdsCabCNT, 'E');
         FRegistro.GComprobante.RefreshFilter;
         Exit;
      End;
// Inicio HPC_201801_CNT  
// Ajustes en la eliminación de los asientos devengados
{
      // Inicio HPC_201703_CNT
      // Seguros-Automatización de Devengue de Seguros
      If (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'CNT') And (DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString = '22') Then
      Begin
         DMCNT.DCOM1.AppServer.IniciaTransaccion;

         xSQL := 'delete from CNT311 '
               + 'where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Asiento');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         xSQL := 'delete from CNT300 '
               + 'where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera del Asiento');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         xSQL := 'delete from CNT_DEV_SEG_MOV '
               + 'where CIAIDCNT=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARIDCNT=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CPANOMESCNT=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar Devengue/Contabilización del Seguro');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         DMCNT.DCOM1.AppServer.GrabaTransaccion;
         ShowMessage('Comprobante Eliminado');
         DMCNT.ActualizaFiltro(FRegistro.GComprobante, DMCNT.cdsCabCNT, 'E');
         FRegistro.GComprobante.RefreshFilter;
         Exit;
      End;
// Fin HPC_201703_CNT
}  
// Fin HPC_201801_CNT
      If (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'CAJA') And (DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString = '62') Then
      Begin
         DMCNT.DCOM1.AppServer.IniciaTransaccion;

         xSQL := 'delete from CNT311 '
               + 'where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Asiento');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         xSQL := 'delete from CNT300 '
               + 'where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera del Asiento');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

      // actualiza cabecera de CXP_ORD_PAG_CAB para que vuelva a contabilizar
         xSQL := ' Update CXP_ORD_PAG_CAB '
               + '    set USUCONTA=null '
               + '  where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '    and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '    and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '    and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo actualizar los datos Contables en la Orden de Pago');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         DMCNT.DCOM1.AppServer.GrabaTransaccion;

         ShowMessage('Comprobante Eliminado');
         DMCNT.ActualizaFiltro(FRegistro.GComprobante, DMCNT.cdsCabCNT, 'E');
         FRegistro.GComprobante.RefreshFilter;
         Exit;
      End;

   // Caja y Bancos
// Inicio HPC_201410_CNT
// No considera a los asientos generados por Fondo Fijo de Caja en esta Eliminación
// tiene un Condicional Diferente
      If (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'CAJA')
          and (DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString<>'07') Then // diferente de Fondo Fijo
// Fin HPC_201410_CNT
      Begin
      // busca en CAJA302
         xWhere := 'CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
            + ' and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
            + ' and ECANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
            + ' and ECNOCOMP=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         If length(DMCNT.DisplayDescrip('PrvTGE', 'CAJA302', 'ECNOCOMP', xWhere, 'ECNOCOMP')) > 0 Then
         Begin
            xLLave := '%' + DMCNT.cdsCabCnt.FieldByName('CIAID').AsString + '/'
                          + DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString + '/'
                          + DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString + '%';
            xSQL := 'select * from CAJA302 '
                  + 'where ECANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
                  + ' and ECPERREC like ' + quotedstr(xLLave);
            DMCNT.cdsQry2.IndexFieldNames := '';
            DMCNT.cdsQry2.Filter := '';
            DMCNT.cdsQry2.Filtered := False;
            DMCNT.cdsQry2.DataRequest(xSQL);
            DMCNT.cdsQry2.Open;
            If DMCNT.cdsQry2.recordcount > 0 Then
            Begin
               If MessageDlg(' El asiento es del módulo de Caja con asientos automáticos, ' + chr(13)
                           + ' se eliminarán los asientos automáticos generados, '
                           + ' ¿Continuar? ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
                  exit;
//         1         2         3         4         5         6         7         8         9
//123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
//1. 02/06/0000000004][2. 04/91/0000000004

            //////////////////////////////////////////////////////////////
            // verifica que los 3 asientos hayan sido descontabilizados //
            //////////////////////////////////////////////////////////////

            // asiento principal
               xCia := DMCNT.cdsQry2.FieldByName('CIAID').AsString;
               xTDiario := DMCNT.cdsQry2.FieldByName('TDIARID').AsString;
               xAnoMes := DMCNT.cdsQry2.FieldByName('ECANOMM').AsString;
               xNroComp := DMCNT.cdsQry2.FieldByName('ECNOCOMP').AsString;

               xWhere := ' CIAID=' + quotedstr(xCia)
                  + '   and TDIARID=' + quotedstr(xTDiario)
                  + '   and CNTANOMM=' + quotedstr(xAnoMes)
                  + '   and CNTCOMPROB=' + quotedstr(xNroComp);
               If DMCNT.DisplayDescrip('PrvTGE', 'CNT300', 'CNTESTADO', xWhere, 'CNTESTADO') <> 'P' Then
               Begin
                  ShowMessage('Asiento CIA=' + xCia + ', Diario=' + xTDiario + ', Año+Mes=' + xAnoMes + ', NroComp=' + xNroComp + chr(13)
                     + ' no ha sido descontabilizado ');
                  exit;
               End;

            // asiento Cia que desembolsa dinero (Cia='02')
               xCia := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString, 4, 2);
               xTDiario := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString, 7, 2);
               xAnoMes := xAnoMes;
               xNroComp := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString, 10, 10);
               xWhere := ' CIAID=' + quotedstr(xCia)
                  + '  and TDIARID=' + quotedstr(xTDiario)
                  + '  and CNTANOMM=' + quotedstr(xAnoMes)
                  + '  and CNTCOMPROB=' + quotedstr(xNroComp);
               If DMCNT.DisplayDescrip('PrvTGE', 'CNT300', 'CNTESTADO', xWhere, 'CNTESTADO') <> 'P' Then
               Begin
                  ShowMessage('Asiento CIA=' + xCia + ', Diario=' + xTDiario + ', Año+Mes=' + xAnoMes + ', NroComp=' + xNroComp + chr(13)
                     + ' no ha sido descontabilizado ');
                  exit;
               End;

            // asiento auxiliar q realiza el ingreso de dinero para el pago (TDiario='91')
               xCia := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString, 25, 2);
               xTDiario := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString, 28, 2);
               xAnoMes := xAnoMes;
               xNroComp := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString, 31, 10);
               xWhere := ' CIAID=' + quotedstr(xCia)
                  + '  and TDIARID=' + quotedstr(xTDiario)
                  + '  and CNTANOMM=' + quotedstr(xAnoMes)
                  + '  and CNTCOMPROB=' + quotedstr(xNroComp);
               If DMCNT.DisplayDescrip('PrvTGE', 'CNT300', 'CNTESTADO', xWhere, 'CNTESTADO') <> 'P' Then
               Begin
                  ShowMessage('Asiento CIA=' + xCia + ', Diario=' + xTDiario + ', Año+Mes=' + xAnoMes + ', NroComp=' + xNroComp + chr(13)
                     + ' no ha sido descontabilizado ');
                  exit;
               End;

               DMCNT.DCOM1.AppServer.IniciaTransaccion;

            ////////////////////////////////////////////////////////////////////////
            // Elimina los movimientos contables y marca de cabecera del CAJA302  //
            ////////////////////////////////////////////////////////////////////////

            // asiento principal, el que ve el usuario en forma operativa
               xCia := DMCNT.cdsQry2.FieldByName('CIAID').AsString;
               xTDiario := DMCNT.cdsQry2.FieldByName('TDIARID').AsString;
               xAnoMes := DMCNT.cdsQry2.FieldByName('ECANOMM').AsString;
               xNroComp := DMCNT.cdsQry2.FieldByName('ECNOCOMP').AsString;

            // borra movimientos del detalle temporal del asiento
               xSQL := 'delete from CNT311 '
                     + ' where CIAID=' + quotedstr(xCia)
                     + '   and TDIARID=' + quotedstr(xTDiario)
                     + '   and CNTANOMM=' + quotedstr(xAnoMes)
                     + '   and CNTCOMPROB=' + quotedstr(xNroComp);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar el Detalle del Asiento');
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;

            // borra movimientos de la cabecera del asiento
               xSQL := 'delete from CNT300 '
                     + ' where CIAID=' + quotedstr(xCia)
                     + '   and TDIARID=' + quotedstr(xTDiario)
                     + '   and CNTANOMM=' + quotedstr(xAnoMes)
                     + '   and CNTCOMPROB=' + quotedstr(xNroComp);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar la Cabecera del Asiento');
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;

            // borra voucher de Caja
               xSQL := 'delete from CAJA304 '
                     + 'where CIAID=' + quotedstr(xCia)
                     + '  and TDIARID=' + quotedstr(xTDiario)
                     + '  and ECANOMM=' + quotedstr(xAnoMes)
                     + '  and ECNOCOMP=' + quotedstr(xNroComp);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar voucher de Caja (CAJA304)');
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;

            // actualiza cabecera de Caja
               xSQL := 'update CAJA302 '
                     + '   set ECCONTA=' + quotedstr('N')
                     + ' where CIAID=' + quotedstr(xCia)
                     + '   and TDIARID=' + quotedstr(xTDiario)
                     + '   and ECANOMM=' + quotedstr(xAnoMes)
                     + '   and ECNOCOMP=' + quotedstr(xNroComp);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo actualizar cabecera de Caja (CAJA302)');
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;

            // asiento Cia que desembolsa dinero (Cia='02')
               xCia := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString, 4, 2);
               xTDiario := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString, 7, 2);
               xAnoMes := xAnoMes;
               xNroComp := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString, 10, 10);
            // borra movimientos del detalle temporal del asiento
               xSQL := 'delete from CNT311 '
                     + ' where CIAID=' + quotedstr(xCia)
                     + '   and TDIARID=' + quotedstr(xTDiario)
                     + '   and CNTANOMM=' + quotedstr(xAnoMes)
                     + '   and CNTCOMPROB=' + quotedstr(xNroComp);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar el Detalle del Asiento, Cia=' + xCia);
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
            // borra movimientos de la cabecera del asiento
               xSQL := 'delete from CNT300 '
                     + ' where CIAID=' + quotedstr(xCia)
                     + '   and TDIARID=' + quotedstr(xTDiario)
                     + '   and CNTANOMM=' + quotedstr(xAnoMes)
                     + '   and CNTCOMPROB=' + quotedstr(xNroComp);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar la Cabecera del Asiento, Cia=' + xCia);
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
            // borra voucher de Caja
               xSQL := 'delete from CAJA304 '
                     + 'where CIAID=' + quotedstr(xCia)
                     + '  and TDIARID=' + quotedstr(xTDiario)
                     + '  and ECANOMM=' + quotedstr(xAnoMes)
                     + '  and ECNOCOMP=' + quotedstr(xNroComp);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar Voucher de Caja, Cia=' + xCia);
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
            // actualiza cabecera de Caja
               xSQL := 'delete from CAJA302 '
                     + ' where CIAID=' + quotedstr(xCia)
                     + '   and TDIARID=' + quotedstr(xTDiario)
                     + '   and ECANOMM=' + quotedstr(xAnoMes)
                     + '   and ECNOCOMP=' + quotedstr(xNroComp);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar Cabecera de Caja, Cia ' + xCia);
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;

            // asiento auxiliar q realiza el ingreso de dinero para el pago (TDiario='91')
               xCia := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString, 25, 2);
               xTDiario := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString, 28, 2);
               xAnoMes := xAnoMes;
               xNroComp := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString, 31, 10);

            // borra movimientos del detalle temporal del asiento
               xSQL := 'delete from CNT311 '
                     + ' where CIAID=' + quotedstr(xCia)
                     + '   and TDIARID=' + quotedstr(xTDiario)
                     + '   and CNTANOMM=' + quotedstr(xAnoMes)
                     + '   and CNTCOMPROB=' + quotedstr(xNroComp);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar el Detalle del Asiento, Cia=' + xCia);
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
            // borra movimientos de la cabecera del asiento
               xSQL := 'delete from CNT300 '
                     + ' where CIAID=' + quotedstr(xCia)
                     + '   and TDIARID=' + quotedstr(xTDiario)
                     + '   and CNTANOMM=' + quotedstr(xAnoMes)
                     + '   and CNTCOMPROB=' + quotedstr(xNroComp);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar la Cabecera del Asiento, Cia=' + xCia);
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
            // borra voucher de Caja
               xSQL := 'delete from CAJA304 '
                     + 'where CIAID=' + quotedstr(xCia)
                     + '  and TDIARID=' + quotedstr(xTDiario)
                     + '  and ECANOMM=' + quotedstr(xAnoMes)
                     + '  and ECNOCOMP=' + quotedstr(xNroComp);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar voucher de Caja, Cia=' + xCia);
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
            // actualiza cabecera de Caja
               xSQL := 'delete from CAJA302 '
                     + ' where CIAID=' + quotedstr(xCia)
                     + '   and TDIARID=' + quotedstr(xTDiario)
                     + '   and ECANOMM=' + quotedstr(xAnoMes)
                     + '   and ECNOCOMP=' + quotedstr(xNroComp);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar cabecera de Caja, Cia=' + xCia);
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
               DMCNT.DCOM1.AppServer.GrabaTransaccion;
            End
            Else // si el voucher de caja es único
            Begin
               DMCNT.DCOM1.AppServer.IniciaTransaccion;

            // borra movimientos del detalle temporal del asiento
               xSQL := 'delete from CNT311 '
                     + ' where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
                     + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
                     + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
                     + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar el Detalle del Asiento');
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
            // borra movimientos de la cabecera del asiento
               xSQL := 'delete from CNT300 '
                     + ' where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
                     + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
                     + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
                     + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar la Cabecera del Asiento');
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
            // borra voucher de Caja
               xSQL := 'delete from CAJA304 '
                     + ' where CIAID=' + quotedstr(xCia)
                     + '   and TDIARID=' + quotedstr(xTDiario)
                     + '   and ECANOMM=' + quotedstr(xAnoMes)
                     + '   and ECNOCOMP=' + quotedstr(xNroComp);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar el voucher de Caja');
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
            // actualiza cabecera de Caja
               xSQL := 'update CAJA302 set ECCONTA=' + quotedstr('N')
                     + ' where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
                     + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
                     + '   and ECANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
                     + '   and ECNOCOMP=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo actualizar el dato de contabilizado en el voucher de Caja');
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;

               DMCNT.DCOM1.AppServer.GrabaTransaccion;
               ShowMessage('Comprobante Eliminado');
               FRegistro.GComprobante.RefreshFilter;
               DMCNT.ActualizaFiltro(FRegistro.GComprobante, DMCNT.cdsCabCNT, 'E');
            End;
         End
         Else // si es de Caja y no está en CAJA302
         Begin
            ShowMessage('Aún no se puede eliminar automáticamente este tipo de asiento de Caja');
            exit;
         End;
      End; // FIN CAJA

// Inicio HPC_201410_CNT
// Adiciona rutina para borrar asientos de Caja- Fondo Fijo
   // Caja y Bancos - Fondo Fijo
      If (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'CAJA')
          and (DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString='07') Then // sólo de Fondo Fijo
      Begin
         xCiaSede := '02';
         xCia := DMCNT.cdsCabCnt.FieldByName('CIAID').AsString;
         xTDiario := DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString;
         xAnoMes := DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString;
         xNroComp := DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString;
         if DMCNT.cdsCabCnt.FieldByName('CIAID').AsString<>xCiaSede then
         begin
            xSQL := 'select CIAID, TDIARID, ECANOMM, ECNOCOMP, TDIARIO2, ECANOMM2, ECNOCOMP2 '
                   +'  from CAJA302 '
                   +' where CIAID='+quotedstr(xCia)
                   +'   and ECANOMM = ' + quotedstr(xAnoMes)
                   +'   and TDIARID = ' + quotedstr(xTDiario)
                   +'   and ECNOCOMP = ' + quotedstr(xNroComp);
            DMCNT.cdsQry3.IndexFieldNames:='';
            DMCNT.cdsQry3.Filter := '';
            DMCNT.cdsQry3.Filtered := False;
            DMCNT.cdsQry3.Close;
            DMCNT.cdsQry3.DataRequest(xSQL);
            DMCNT.cdsQry3.Open;
            xCia := xCiaSede;
            xTDiario := DMCNT.cdsQry3.FieldByName('TDIARIO2').AsString;
            xAnoMes := DMCNT.cdsQry3.FieldByName('ECANOMM2').AsString;
            xNroComp := DMCNT.cdsQry3.FieldByName('ECNOCOMP2').AsString;
         end;

      // busca en CAJA302
         xSQL := 'select CIAID, TDIARID, ECANOMM, ECNOCOMP, TDIARIO2, ECANOMM2, ECNOCOMP2 '
                +'  from CAJA302 '
                +' where (ECANOMM2 = ' + quotedstr(xAnoMes)
                +'   and TDIARIO2 = ' + quotedstr(xTDiario)
                +'   and ECNOCOMP2 = ' + quotedstr(xNroComp) +')'
                +'    or (CIAID='+quotedstr(xCiaSede)
                +'   and ECANOMM = ' + quotedstr(xAnoMes)
                +'   and TDIARID = ' + quotedstr(xTDiario)
                +'   and ECNOCOMP = ' + quotedstr(xNroComp) +')';
         DMCNT.cdsQry3.IndexFieldNames:='';
         DMCNT.cdsQry3.Filter := '';
         DMCNT.cdsQry3.Filtered := False;
         DMCNT.cdsQry3.Close;
         DMCNT.cdsQry3.DataRequest(xSQL);
         DMCNT.cdsQry3.Open;

         if DMCNT.cdsQry3.RecordCount>0 then
         begin
            xAsientosElim := '';
            DMCNT.cdsQry3.First;
            while not DMCNT.cdsQry3.EOF do
            begin
               xSQL := 'Select CNTESTADO '
                      +'  from CNT300 '
                      +' where CIAID='+quotedstr(DMCNT.cdsQry3.FieldByName('CIAID').AsString)
                      +'   and TDIARID='+quotedstr(DMCNT.cdsQry3.FieldByName('TDIARID').AsString)
                      +'   and CNTANOMM='+quotedstr(DMCNT.cdsQry3.FieldByName('ECANOMM').AsString)
                      +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsQry3.FieldByName('ECNOCOMP').AsString);
               DMCNT.cdsQry.IndexFieldNames:='';
               DMCNT.cdsQry.Filter := '';
               DMCNT.cdsQry.Filtered := False;
               DMCNT.cdsQry.Close;
               DMCNT.cdsQry.DataRequest(xSQL);
               DMCNT.cdsQry.Open;
               if DMCNT.cdsQry.RecordCount>0 then
               begin
                  if DMCNT.cdsQry.FieldByName('CNTESTADO').AsString<>'I' then
                  begin
                     xAsientosElim := xAsientosElim
                                     +' CIA='+quotedstr(DMCNT.cdsQry3.FieldByName('CIAID').AsString)
                                     +'/T.DIARIO='+quotedstr(DMCNT.cdsQry3.FieldByName('TDIARID').AsString)
                                     +'/AÑO+MES='+quotedstr(DMCNT.cdsQry3.FieldByName('ECANOMM').AsString)
                                     +'/ASIENTO='+quotedstr(DMCNT.cdsQry3.FieldByName('ECNOCOMP').AsString)
                                     +chr(13);
                  end;
               end;
               DMCNT.cdsQry3.Next;
            end;
            if length(trim(xAsientosElim))>0 then
            begin
               ShowMessage('Se debe descontabilizar el(los) siguiente(s) asiento(s):'+chr(13)+xAsientosElim);
               exit;
            end;

         // procede a eliminar cabeceras y asientos contables relacionados con el movimiento
            DMCNT.DCOM1.AppServer.IniciaTransaccion;
            DMCNT.cdsQry3.First;
            while not DMCNT.cdsQry3.EOF do
            begin
            // asiento
               xAsientosElim := ' CIA='+quotedstr(DMCNT.cdsQry3.FieldByName('CIAID').AsString)
                               +'/T.DIARIO='+quotedstr(DMCNT.cdsQry3.FieldByName('TDIARID').AsString)
                               +'/AÑO+MES='+quotedstr(DMCNT.cdsQry3.FieldByName('ECANOMM').AsString)
                               +'/ASIENTO='+quotedstr(DMCNT.cdsQry3.FieldByName('ECNOCOMP').AsString);

            // borra cabecera del asiento
               xSQL := 'delete from CNT300 '
                     + ' where CIAID=' + quotedstr(DMCNT.cdsQry3.FieldByName('CIAID').AsString)
                     + '   and TDIARID=' + quotedstr(DMCNT.cdsQry3.FieldByName('TDIARID').AsString)
                     + '   and CNTANOMM=' + quotedstr(DMCNT.cdsQry3.FieldByName('ECANOMM').AsString)
                     + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsQry3.FieldByName('ECNOCOMP').AsString);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar la Cabecera del Asiento'+chr(13)+xAsientosElim);
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;

            // borra detalle del asiento
               xSQL := 'delete from CNT311 '
                     + ' where CIAID=' + quotedstr(DMCNT.cdsQry3.FieldByName('CIAID').AsString)
                     + '   and TDIARID=' + quotedstr(DMCNT.cdsQry3.FieldByName('TDIARID').AsString)
                     + '   and CNTANOMM=' + quotedstr(DMCNT.cdsQry3.FieldByName('ECANOMM').AsString)
                     + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsQry3.FieldByName('ECNOCOMP').AsString);
               Try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               Except
                  ShowMessage('No se pudo eliminar el Detalle del Asiento'+chr(13)+xAsientosElim);
                  DMCNT.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;

               DMCNT.cdsQry3.Next;
            end;

         // borra voucher de Caja
            xSQL := 'delete from CAJA304 '
                  + ' where CIAID='+quotedstr(xCiaSede)
                  + '   and ECANOMM = ' + quotedstr(xAnoMes)
                  + '   and TDIARID = ' + quotedstr(xTDiario)
                  + '   and ECNOCOMP = ' + quotedstr(xNroComp);
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Except
               ShowMessage('No se pudo eliminar voucher de Caja (CAJA304)');
               DMCNT.DCOM1.AppServer.RetornaTransaccion;
               exit;
            End;

         // actualiza cabecera de Caja
            xSQL := 'update CAJA302 '
                  + '   set ECCONTA=' + quotedstr('N')
                  + ' where (CIAID='+quotedstr(xCiaSede)
                  + '   and ECANOMM = ' + quotedstr(xAnoMes)
                  + '   and TDIARID = ' + quotedstr(xTDiario)
                  + '   and ECNOCOMP = ' + quotedstr(xNroComp) +')';
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Except
               ShowMessage('No se pudo actualizar cabecera de Caja (CAJA302)');
               DMCNT.DCOM1.AppServer.RetornaTransaccion;
               exit;
            End;
            DMCNT.DCOM1.AppServer.GrabaTransaccion;
            ShowMessage('Comprobante Eliminado');
            FRegistro.GComprobante.RefreshFilter;
            DMCNT.ActualizaFiltro(FRegistro.GComprobante, DMCNT.cdsCabCNT, 'E');
         End;
      End; // FIN CAJA
// Fin HPC_201410_CNT

   // Cuentas por Pagar
      If DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'CXP' Then
      Begin
         DMCNT.DCOM1.AppServer.IniciaTransaccion;

         If DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString <> '53' Then
         Begin
            xSQL := 'update CXP301 '
                  + '   set CP_CONTA=' + quotedstr('N')
                  + ' where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
                  + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
                  + '   and CPANOMES=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
                  + '   and CPNOREG=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Except
               ShowMessage('No se pudo actualizar el dato de la Cuenta por Pagar');
               DMCNT.DCOM1.AppServer.RetornaTransaccion;
               exit;
            End;
         End
         Else
         Begin
         // se debe borrar todos los registros generado por CXP_ORD_PAG_CAB
         // se debe identificar a la cabecera en un archivo de relación de asientos
         // contables generados en la Contabilización de la cabecera
         // todos los asientos deberán estar descontabilizados
         // se deben borrar todos los asientos de contabilidad (CNT300 y CNT311)
         // actualizar en CXP_ORD_PAG_CAB -->USUCONTA=null, FECCONTA=null
         // también borra el detalle operatrivo-contable que se generó en CXP por la O.Pago
            xSQL := 'update CXP_ORD_PAG_CAB '
               // Inicio HPC_201503_CNT
               //   + '   set USUCONTA=null, FECCONTA=null, TDIARID=null, CNTANOMM=null, CNTCOMPROB=null '
                  + '   set USUCONTA=null, TDIARID=null, CNTANOMM=null, CNTCOMPROB=null '
               // Fin  HPC_201503_CNT
                  + ' where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
                  + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
                  + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
                  + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
            Try
               DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
            Except
               ShowMessage('No se pudo actualizar los datos de la Orden de Pago en la Cuenta por Pagar');
               DMCNT.DCOM1.AppServer.RetornaTransaccion;
               exit;
            End;
         End;

         xSQL := 'delete from CNT311 '
               + ' where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Asiento');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         xSQL := 'delete from CNT300 '
               + ' where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera del Asiento');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
         DMCNT.DCOM1.AppServer.GrabaTransaccion;
         ShowMessage('Comprobante Eliminado');
         DMCNT.ActualizaFiltro(FRegistro.GComprobante, DMCNT.cdsCabCNT, 'E');
         FRegistro.GComprobante.RefreshFilter;
      End; // FIN CTAS X PAGAR

   // Cuentas por Cobrar
      If DMCNT.cdsCabCnt.FieldByName('MODULO').AsString = 'CXC' Then
      Begin
         DMCNT.DCOM1.AppServer.IniciaTransaccion;

         xSQL := 'update CXC301 '
               + '   set CC_CONTA=' + quotedstr('N')
               + ' where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CCANOMES=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CCNOREG=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera de la Cuenta por Cobrar');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         xSQL := 'delete from CNT311 '
               + ' where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Asiento');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         xSQL := 'delete from CNT300 '
               + ' where CIAID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
               + '   and TDIARID=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
               + '   and CNTANOMM=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
               + '   and CNTCOMPROB=' + quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         Try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera del Asiento');
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
// Inicio HPC_201409_CNT
         DMCNT.DCOM1.AppServer.GrabaTransaccion;
// Fin HPC_201409_CNT
         ShowMessage('Comprobante Eliminado');
         DMCNT.ActualizaFiltro(FRegistro.GComprobante, DMCNT.cdsCabCNT, 'E');
         FRegistro.GComprobante.RefreshFilter;
      End; // FIN CTAS X COBRAR

      If (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString <> 'CXP') And
         (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString <> 'CXC') And
         (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString <> 'PL') And
         (DMCNT.cdsCabCnt.FieldByName('MODULO').AsString <> 'CAJA') Then
      Begin
         ShowMessage('Aún no se puede eliminar automáticamente este tipo de asiento, Módulo:' + DMCNT.cdsCabCnt.FieldByName('MODULO').AsString);
         exit;
      End;
   End;
End;

Procedure TFToolComprobante.Z2sbPlanillasClick(Sender: TObject);
Begin
   Try
      FPlanilla := TFPlanilla.Create(Self);
      FPlanilla.ShowModal;
   Except
   End;
   FPlanilla.Free;
End;

Procedure TFToolComprobante.sbEncinasClick(Sender: TObject);
Begin
   Try
      FEncinas := TFEncinas.Create(Self);
      FEncinas.ShowModal;
   Except
   End;
   FEncinas.Free;
End;

Procedure TFToolComprobante.sbCopiarClick(Sender: TObject);
Begin
   If MessageDlg('Desea generar nuevo Asiento Copiando el detalle del asiento seleccionado' + chr(13) + chr(13) +
      '            ¿ Esta Seguro ?  ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then exit;
   DMCNT.wModo := 'N';
   DMCNT.Filtracds(DMCNT.cdsCabCNT, 'Select * from CNT300 Where CIAID=''ZX'' AND TDIARID=''ZZ''');
   DMCNT.Filtracds(DMCNT.cdsMovCNT1, 'Select * from CNT311 Where CIAID=''ZX'' AND TDIARID=''ZZ''');
   FRegComp := TFRegComp.Create(Self);
   FRegComp.ActiveMDIChild;
End;

// Inicio HPC_201501_CNT
Procedure TFToolComprobante.bbtnConcBancClick(Sender: TObject);
begin
   FConcBanCob := TFConcBanCob.Create(Self); // CNT230.pas
   Try
      FConcBanCob.ShowModal;
   Finally
      FConcBanCob.free;
   End;
end;
// Fin HPC_201501_CNT

// Inicio HPC_201602_CNT
// 31/03/2016  Añade Formulario que homogenizará Números de Serie y Documentos por Cia+Proveedor
procedure TFToolComprobante.bbtnRegNumDocsClick(Sender: TObject);
begin
// CNT240.pas
   FHomogNumDocProv := TFHomogNumDocProv.Create(Self); // CNT240.pas
   Try
      FHomogNumDocProv.ShowModal;
   Finally
      FHomogNumDocProv.free;
   End;
end;
// Fin HPC_201602_CNT
// Inicio HPC_201703_CNT
// Seguros-Automatización de Devengue de Seguros
procedure TFToolComprobante.spbSegurosClick(Sender: TObject);
begin
   fSeguros := TfSeguros.Create(Self);
   Try
      fSeguros.ShowModal;
   Finally
      fSeguros.free;
   End;
end;
// Fin HPC_201702_CNT
// Inicio HPC_201702_CNT
// Seguros-Automatización de Devengue de Seguros
procedure TFToolComprobante.spbDevengadoClick(Sender: TObject);
begin
   fBusquedaDev := TfBusquedaDev.Create(Self);
   Try
      fBusquedaDev.ShowModal;
   Finally
      fBusquedaDev.free;
   End;
end;
// Fin HPC_201703_CNT
End.

