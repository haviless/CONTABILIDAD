Unit CNT207;
//Inicio Uso de Estándares : 01/08/2011
//Unidad                   : CNT207
//Formulario               : FCierrePer
//Fecha de Creación        :
//Autor                    : Equipo de Desarrollo
//Objetivo                 : Realiza el cierre operativo del módulo de contabilidad
//                           y de todos los módulos que registran información contable

//Actualizaciones:
//HPC_201115_CNT           : Modificación del cálculo de los saldos inciales y
//                           finales de las cuentas contables. Se dejará de usar
//                           el ApplyUpdates por una sentencia DML de actualización.
//HPC_201402_CNT 25/02/2014: Modificar los ControlTrans, AplicaDato y los ApplyUpdates.
Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, Spin, wwdblook, ExtCtrls, Wwdbigrd, Grids, Wwdbgrid,
   wwdbdatetimepicker, oaVariables, Mask, db;

Type
   TFCierrePer = Class(TForm)
      pnlCierres: TPanel;
      bbtnOk: TBitBtn;
      bbtnCanc: TBitBtn;
      dbgCerrado: TwwDBGrid;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      lblAno: TLabel;
      speAno: TSpinEdit;
      rgMes: TRadioGroup;
      bbtnOpen: TBitBtn;
      lblCia: TLabel;
      Panel1: TPanel;
      wwDBGrid1: TwwDBGrid;
      Label1: TLabel;
      bbtnBloqueaTodo: TBitBtn;
      bbtnDesBloqTodo: TBitBtn;
      bbtnBloqueaUsu: TBitBtn;
      Label2: TLabel;
      bbtnDesBloqUsu: TBitBtn;
      mePeriodo: TComboBox;
      bbtnUsu: TBitBtn;
      Procedure FormActivate(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure speAnoExit(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure rgMesClick(Sender: TObject);
      Procedure bbtnCancClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnOpenClick(Sender: TObject);
      Procedure bbtnBloqueaUsuClick(Sender: TObject);
      Procedure bbtnDesBloqUsuClick(Sender: TObject);
      Procedure bbtnBloqueaTodoClick(Sender: TObject);
      Procedure bbtnDesBloqTodoClick(Sender: TObject);
      Procedure bbtnUsuClick(Sender: TObject);
      Procedure mePeriodoChange(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
   Private
    { Private declarations }
      xCerrado, sCiaConsol: String;
      sPer01, sPer02: String;
      Procedure PeriodoActivo;
      Procedure FiltraCds;
      Procedure MesCerrado;
      Procedure MuestraUsuarios;
   Public
    { Public declarations }
   End;

Procedure CNCierrePeriodo; stdcall;

Exports
   CNCierrePeriodo;

Var
   FCierrePer: TFCierrePer;
   cb, cb_ant: TCheckBox;
   xAno, xMes, xDia: Word;
   n: integer;
   Periodo, wMes, flg, CheckB, wPer: String;

Implementation

Uses CNTDM;

{$R *.DFM}

Procedure CNCierrePeriodo;
Var
   xSQL: String;
Begin
   If DMCNT = Nil Then exit;
   If Not DMCNT.DCOM1.Connected Then Exit;
   Try
      FCierrePer := TFCierrePer.Create(Application);
      DMCNT.cdsCierres.Open;
      FCierrePer.ShowModal;
   Finally
      FCierrePer.Free;
      DMCNT.cdsCierres.Filter := '';
      DMCNT.cdsCierres.Filtered := False;
      DMCNT.cdsCierres.Close;
   End;
End;

Procedure TFCierrePer.FormActivate(Sender: TObject);
Var
   wAno, wMes, wDia: word;
   xMesAct, xMesAnt, xAnoAct: String;
Begin
  // FVariables.ConfiguraForma( Self );
   bbtnOpen.Enabled := DMCNT.wAdmin = 'P';
   bbtnOpen.Visible := DMCNT.wAdmin = 'P';

   If (DMCNT.wUsuario = 'ASANTANDER') Or (DMCNT.wUsuario = 'AGUTIERREZ') Or (DMCNT.wUsuario = 'JCARBONEL') Then
   Begin
      bbtnOpen.Enabled := True;
      bbtnOpen.Visible := True;
   End;

   sCiaConsol:='select CIAID from TGE101 WHERE CNTCONSOL=''S''';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest(sCiaConsol);
   DMCNT.cdsQry.Open;

   sCiaConsol:=DMCNT.cdsQry.FieldByName('CIAID').AsString;

   rgMes.ItemIndex := -1;
   xCerrado := 'N';

   Decodedate(date, wAno, wMes, wDia);
   sPer01 := inttostr(wAno) + dmcnt.strzero(inttostr(wMes), 2);
   xMesAct := dmcnt.strzero(inttostr(wMes), 2);
   If xMesAct = '01' Then
      xMesAnt := '12'
   Else
      xMesAnt := dmcnt.strzero(inttostr(wMes - 1), 2);
   If xMesAnt = '12' Then
      xAnoAct := inttostr(wAno - 1)
   Else
      xAnoAct := inttostr(wAno);
   sPer02 := xAnoAct + xMesAnt;
   mePeriodo.Items.Clear;
   mePeriodo.Items.Add(sPer01);
   mePeriodo.Items.Add(sPer02);
End;

Procedure TFCierrePer.dblcCiaExit(Sender: TObject);
Var
   xSql: String;
Begin
   If dblcCia.text <> '' Then
   Begin
      edtCia.Text := DMCNT.DisplayDescrip('dspTGE', 'TGE101', 'CIADES', 'CIAID=' + quotedstr(dblcCia.text), 'CIADES');
      xSql := 'SELECT * FROM TGE154 WHERE CIAID=' + quotedstr(dblcCia.text);
      DMCNT.cdsCierres.close;
      DMCNT.cdsCierres.datarequest(xsql);
      DMCNT.cdsCierres.open;
      FiltraCds;
   End;
End;

Procedure TFCierrePer.speAnoExit(Sender: TObject);
Begin
   FiltraCds;
End;

Procedure TFCierrePer.FiltraCds;
Begin
   DMCNT.cdsCierres.filter := '';
   DMCNT.cdsCierres.filtered := False;
   DMCNT.cdsCierres.filter := 'ANO=' + quotedstr(speAno.text);
   DMCNT.cdsCierres.filtered := True;
   dbgCerrado.DataSource := DMCNT.dsCierres;
End;

Procedure TFCierrePer.rgMesClick(Sender: TObject);
Var
   xPeriodo: String;
Begin
   If dblcCia.text = '' Then
   Begin
      Showmessage('Ingrese Compañia');
      dblcCia.setfocus;
   End;

   //** Si el periodo es Enero de Cualquier Año, se busca el estado del mes Diciembre del
   //** año anterior
   If rgMes.itemindex = 0 Then
   Begin
      //** Se Filtra por el Año
      DMCNT.cdsCierres.filter := '';
      DMCNT.cdsCierres.filtered := False;
      DMCNT.cdsCierres.filter := 'ANO=' + quotedstr(IntToStr(StrTOInt(speAno.text) - 1));
      DMCNT.cdsCierres.filtered := True;
      xPeriodo := DMCNT.cdsCierres.FieldByName('PER12').AsString;
      filtraCds;
   End;

   If DMCNT.cdsCierres.RecordCount = 0 Then
   Begin
      Exit;
   End;

   Case rgMes.itemindex Of
      0:
         If DMCNT.cdsCierres.FieldByName('PER01').AsString = 'S' Then
               //** Si el Boton de Reapertura esta deshabilitado, se manda mensaje de Cerrado
               //** sino, se le asigna a la variable la 'S' de Cerrado
            If bbtnOpen.Enabled = False Then
               MesCerrado
            Else
               xCerrado := 'S'
         Else
              //** comprueba que el mes anterior este cerrado
            If xPeriodo = 'S' Then
             //** se no esta cerrado se le asigna 'N'
               xCerrado := 'N'
            Else
            Begin
               Showmessage('El mes anterior no se encuentra Cerrado');
               xCerrado := 'C';
            End;
      1:
         If DMCNT.cdsCierres.FieldByName('PER02').AsString = 'S' Then
            If bbtnOpen.Enabled = False Then
               MesCerrado
            Else
               xCerrado := 'S'
         Else
            //** comprueba que el mes anterior este cerrado
            If DMCNT.cdsCierres.FieldByName('PER01').AsString = 'S' Then
               xCerrado := 'N'
            Else
            Begin
               Showmessage('El mes anterior no se encuentra Cerrado');
               xCerrado := 'C';
            End;
      2:
         If DMCNT.cdsCierres.FieldByName('PER03').AsString = 'S' Then
            If bbtnOpen.Enabled = False Then
               MesCerrado
            Else
               xCerrado := 'S'
         Else
            //** comprueba que el mes anterior este cerrado
            If DMCNT.cdsCierres.FieldByName('PER02').AsString = 'S' Then
               xCerrado := 'N'
            Else
            Begin
               Showmessage('El mes anterior no se encuentra Cerrado');
               xCerrado := 'C';
            End;
      3:
         If DMCNT.cdsCierres.FieldByName('PER04').AsString = 'S' Then
            If bbtnOpen.Enabled = False Then
               MesCerrado
            Else
               xCerrado := 'S'
         Else
            //** comprueba que el mes anterior este cerrado
            If DMCNT.cdsCierres.FieldByName('PER03').AsString = 'S' Then
               xCerrado := 'N'
            Else
            Begin
               Showmessage('El mes anterior no se encuentra Cerrado');
               xCerrado := 'C';
            End;
      4:
         If DMCNT.cdsCierres.FieldByName('PER05').AsString = 'S' Then
            If bbtnOpen.Enabled = False Then
               MesCerrado
            Else
               xCerrado := 'S'
         Else
            //** comprueba que el mes anterior este cerrado
            If DMCNT.cdsCierres.FieldByName('PER04').AsString = 'S' Then
               xCerrado := 'N'
            Else
            Begin
               Showmessage('El mes anterior no se encuentra Cerrado');
               xCerrado := 'C';
            End;
      5:
         If DMCNT.cdsCierres.FieldByName('PER06').AsString = 'S' Then
            If bbtnOpen.Enabled = False Then
               MesCerrado
            Else
               xCerrado := 'S'
         Else
            //** comprueba que el mes anterior este cerrado
            If DMCNT.cdsCierres.FieldByName('PER05').AsString = 'S' Then
               xCerrado := 'N'
            Else
            Begin
               Showmessage('El mes anterior no se encuentra Cerrado');
               xCerrado := 'C';
            End;
      6:
         If DMCNT.cdsCierres.FieldByName('PER07').AsString = 'S' Then
            If bbtnOpen.Enabled = False Then
               MesCerrado
            Else
               xCerrado := 'S'
         Else
            //** comprueba que el mes anterior este cerrado
            If DMCNT.cdsCierres.FieldByName('PER06').AsString = 'S' Then
               xCerrado := 'N'
            Else
            Begin
               Showmessage('El mes anterior no se encuentra Cerrado');
               xCerrado := 'C';
            End;
      7:
         If DMCNT.cdsCierres.FieldByName('PER08').AsString = 'S' Then
            If bbtnOpen.Enabled = False Then
               MesCerrado
            Else
               xCerrado := 'S'
         Else
            //** comprueba que el mes anterior este cerrado
            If DMCNT.cdsCierres.FieldByName('PER07').AsString = 'S' Then
               xCerrado := 'N'
            Else
            Begin
               Showmessage('El mes anterior no se encuentra Cerrado');
               xCerrado := 'C';
            End;
      8:
         If DMCNT.cdsCierres.FieldByName('PER09').AsString = 'S' Then
            If bbtnOpen.Enabled = False Then
               MesCerrado
            Else
               xCerrado := 'S'
         Else
            //** comprueba que el mes anterior este cerrado
            If DMCNT.cdsCierres.FieldByName('PER08').AsString = 'S' Then
               xCerrado := 'N'
            Else
            Begin
               Showmessage('El mes anterior no se encuentra Cerrado');
               xCerrado := 'C';
            End;
      9:
         If DMCNT.cdsCierres.FieldByName('PER10').AsString = 'S' Then
            If bbtnOpen.Enabled = False Then
               MesCerrado
            Else
               xCerrado := 'S'
         Else
            //** comprueba que el mes anterior este cerrado
            If DMCNT.cdsCierres.FieldByName('PER09').AsString = 'S' Then
               xCerrado := 'N'
            Else
            Begin
               Showmessage('El mes anterior no se encuentra Cerrado');
               xCerrado := 'C';
            End;
      10:
         If DMCNT.cdsCierres.FieldByName('PER11').AsString = 'S' Then
            If bbtnOpen.Enabled = False Then
               MesCerrado
            Else
               xCerrado := 'S'
         Else
            //** comprueba que el mes anterior este cerrado
            If DMCNT.cdsCierres.FieldByName('PER10').AsString = 'S' Then
               xCerrado := 'N'
            Else
            Begin
               Showmessage('El mes anterior no se encuentra Cerrado');
               xCerrado := 'C';
            End;
      11:
         If DMCNT.cdsCierres.FieldByName('PER12').AsString = 'S' Then
            If bbtnOpen.Enabled = False Then
               MesCerrado
            Else
               xCerrado := 'S'
         Else
            //** comprueba que el mes anterior este cerrado
            If DMCNT.cdsCierres.FieldByName('PER11').AsString = 'S' Then
               xCerrado := 'N'
            Else
            Begin
               Showmessage('El mes anterior no se encuentra Cerrado');
               xCerrado := 'C';
            End;
   End;

   MuestraUsuarios;
End;

Procedure TFCierrePer.PeriodoActivo;
Begin
   DMCNT.cdsCierres.first;
   If DMCNT.cdsCierres.FieldByName('PER01').AsString = 'S' Then
      If DMCNT.cdsCierres.FieldByName('PER02').AsString = 'S' Then
         If DMCNT.cdsCierres.FieldByName('PER03').AsString = 'S' Then
            If DMCNT.cdsCierres.FieldByName('PER04').AsString = 'S' Then
               If DMCNT.cdsCierres.FieldByName('PER05').AsString = 'S' Then
                  If DMCNT.cdsCierres.FieldByName('PER06').AsString = 'S' Then
                     If DMCNT.cdsCierres.FieldByName('PER07').AsString = 'S' Then
                        If DMCNT.cdsCierres.FieldByName('PER08').AsString = 'S' Then
                           If DMCNT.cdsCierres.FieldByName('PER09').AsString = 'S' Then
                              If DMCNT.cdsCierres.FieldByName('PER10').AsString = 'S' Then
                                 If DMCNT.cdsCierres.FieldByName('PER11').AsString = 'S' Then
                                    If DMCNT.cdsCierres.FieldByName('PER12').AsString = 'S' Then
                                    Else
                                       rgMEs.itemindex := 11
                                 Else
                                    rgMEs.itemindex := 10
                              Else
                                 rgMEs.itemindex := 9
                           Else
                              rgMEs.itemindex := 8
                        Else
                           rgMEs.itemindex := 7
                     Else
                        rgMEs.itemindex := 6
                  Else
                     rgMEs.itemindex := 5
               Else
                  rgMEs.itemindex := 4
            Else
               rgMEs.itemindex := 3
         Else
            rgMEs.itemindex := 2
      Else
         rgMEs.itemindex := 1
   Else
      rgMEs.itemindex := 0
End;

Procedure TFCierrePer.bbtnOkClick(Sender: TObject);
Var
   xSQL, xSQLIns, sSQL: String;
   //INICIO HPC_201115_CNT
   xSQLEnero,xSQLFebrero, xSQLMarzo, xSQLAbril, xSQLMayo, xSQLJunio, xSQLjulio :String;
   xSQLAgosto, xSQLSetiembre, xSQLOctubre, xSQLnoviembre, xSQLDiciembre :String;
   //FIN HPC_201115_CNT
   xMes : String;

Begin
   If rgMEs.itemindex <> -1 Then
   Begin
      rgMes.OnClick(sender);
      If xCerrado = 'N' Then
      Begin
         If MessageDlg('Aceptar Cierre' + chr(13) + chr(13) +
            '  ¿ Esta Seguro ?  ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin

            if dblcCia.Text=sCiaConsol then
            begin
               If MessageDlg('La Compañía ('+sCiaConsol+') a Cerrar es la Compañía Consolidada.' + chr(13) +
                             'Al ejecutar este cierre, NO se podra Aperturar ninguna filial. ' + chr(13) +
                             'No se podra ejecutar ninguna transacción para este periodo.' + chr(13) + chr(13) +
                             '            ¿ Esta Seguro de Cerrar el Periodo ?  ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
               begin
                  // Ok
               end
               else
                  Exit;
            end;

            If DMCNT.cdsCierres.RecordCount = 0 Then
            Begin
               xSQL := 'I';
               DMCNT.cdsCierres.Insert;
            End
            Else
            Begin
               xSQL := 'M';
               DMCNT.cdsCierres.Edit;
            End;
            DMCNT.cdsCierres.FieldByName('CIAID').AsString := dblcCia.Text;
            DMCNT.cdsCierres.FieldByName('MODULO').AsString := 'CNT';
            DMCNT.cdsCierres.FieldByName('FECCIERRE').value := Now;
            DMCNT.cdsCierres.FieldByName('USUARIO').AsString := DMCNT.wUsuario;
            DMCNT.cdsCierres.FieldByName('FREG').value := Now;
            DMCNT.cdsCierres.FieldByName('HREG').value := Now;
            DMCNT.cdsCierres.FieldByName('ANO').AsString := speAno.text;
            Case rgMes.itemindex Of
               0: DMCNT.cdsCierres.FieldByName('PER01').AsString := 'S';
               1: DMCNT.cdsCierres.FieldByName('PER02').AsString := 'S';
               2: DMCNT.cdsCierres.FieldByName('PER03').AsString := 'S';
               3: DMCNT.cdsCierres.FieldByName('PER04').AsString := 'S';
               4: DMCNT.cdsCierres.FieldByName('PER05').AsString := 'S';
               5: DMCNT.cdsCierres.FieldByName('PER06').AsString := 'S';
               6: DMCNT.cdsCierres.FieldByName('PER07').AsString := 'S';
               7: DMCNT.cdsCierres.FieldByName('PER08').AsString := 'S';
               8: DMCNT.cdsCierres.FieldByName('PER09').AsString := 'S';
               9: DMCNT.cdsCierres.FieldByName('PER10').AsString := 'S';
               10: DMCNT.cdsCierres.FieldByName('PER11').AsString := 'S';
               11: DMCNT.cdsCierres.FieldByName('PER12').AsString := 'S';
            End;
            if xSQL='I' then
               xSQL := ' insert into TGE154(CIAID, MODULO, FECCIERRE, USUARIO, '
                      +'                    FREG, HREG, ANO, '
                      +'                    PER01, PER02, PER03, PER04, PER05, PER06, '
                      +'                    PER07, PER08, PER09, PER10, PER11, PER12 ) '
                      +' values('
                      +quotedstr(dblcCia.Text)+','
                      +quotedstr('CNT')+','
                      +'sysdate, '+quotedstr(DMCNT.wUsuario)+','
                      +'sysdate, sysdate, '+quotedstr(speAno.text)+','
                      +quotedstr(DMCNT.cdsCierres.FieldByName('PER01').AsString)+','
                      +quotedstr(DMCNT.cdsCierres.FieldByName('PER02').AsString)+','
                      +quotedstr(DMCNT.cdsCierres.FieldByName('PER03').AsString)+','
                      +quotedstr(DMCNT.cdsCierres.FieldByName('PER04').AsString)+','
                      +quotedstr(DMCNT.cdsCierres.FieldByName('PER05').AsString)+','
                      +quotedstr(DMCNT.cdsCierres.FieldByName('PER06').AsString)+','
                      +quotedstr(DMCNT.cdsCierres.FieldByName('PER07').AsString)+','
                      +quotedstr(DMCNT.cdsCierres.FieldByName('PER08').AsString)+','
                      +quotedstr(DMCNT.cdsCierres.FieldByName('PER09').AsString)+','
                      +quotedstr(DMCNT.cdsCierres.FieldByName('PER10').AsString)+','
                      +quotedstr(DMCNT.cdsCierres.FieldByName('PER11').AsString)+','
                      +quotedstr(DMCNT.cdsCierres.FieldByName('PER12').AsString)+')'
            else // xSQL='M'
            begin
               xSQL := ' update TGE154 '
                      +' set PER01='+quotedstr(DMCNT.cdsCierres.FieldByName('PER01').AsString)+','
                      +'     PER02='+quotedstr(DMCNT.cdsCierres.FieldByName('PER02').AsString)+','
                      +'     PER03='+quotedstr(DMCNT.cdsCierres.FieldByName('PER03').AsString)+','
                      +'     PER04='+quotedstr(DMCNT.cdsCierres.FieldByName('PER04').AsString)+','
                      +'     PER05='+quotedstr(DMCNT.cdsCierres.FieldByName('PER05').AsString)+','
                      +'     PER06='+quotedstr(DMCNT.cdsCierres.FieldByName('PER06').AsString)+','
                      +'     PER07='+quotedstr(DMCNT.cdsCierres.FieldByName('PER07').AsString)+','
                      +'     PER08='+quotedstr(DMCNT.cdsCierres.FieldByName('PER08').AsString)+','
                      +'     PER09='+quotedstr(DMCNT.cdsCierres.FieldByName('PER09').AsString)+','
                      +'     PER10='+quotedstr(DMCNT.cdsCierres.FieldByName('PER10').AsString)+','
                      +'     PER11='+quotedstr(DMCNT.cdsCierres.FieldByName('PER11').AsString)+','
                      +'     PER12='+quotedstr(DMCNT.cdsCierres.FieldByName('PER12').AsString)+' '
                      +' where CIAID='+quotedstr(dblcCia.Text)
                      +'   and ANO='+quotedstr(speAno.text);
            end;
            try
               DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
            except
            end;

            // Cerrar todas las Compañías
            if dblcCia.Text=sCiaConsol then
            begin
               sSQL:='SELECT CIAID, CIADES FROM TGE101 WHERE CIAID>''01''';
               DMCNT.cdsQry2.Close;
               DMCNT.cdsQry2.DataRequest(sSQL);
               DMCNT.cdsQry2.Open;

               while not DMCNT.cdsQry2.Eof do
               begin
                  xSql:='SELECT * FROM TGE154 '
                       +'WHERE CIAID='''+DMCNT.cdsQry2.FieldByName('CIAID').AsString+''' '
                       +' and ANO='''+speAno.text+'''';
                  DMCNT.cdsQry3.close;
                  DMCNT.cdsQry3.datarequest(xsql);
                  DMCNT.cdsQry3.open;

                  xMes:=DMCNT.StrZero( inttostr(rgMes.itemindex+1), 2 );
                  if DMCNT.cdsQry3.RecordCount = 0 then
                  begin
                     xSQLIns:='insert into TGE154(CIAID, MODULO, FECCIERRE, USUARIO, FREG, HREG, ANO, PER'+xMes+' ) '
                       +' values('
                       +quotedstr(DMCNT.cdsQry2.FieldByName('CIAID').AsString)+', '+quotedstr('CNT')+','
                       +'sysdate, '+quotedstr(DMCNT.wUsuario)+', sysdate, sysdate, '+quotedstr(speAno.text)+', ''S'' )';
                  end
                  else
                  begin
                     xSQLIns:='Update TGE154 set PER'+xMes+'=''S'' '
                       +' where CIAID='+quotedstr(DMCNT.cdsQry2.FieldByName('CIAID').AsString)
                       +'   and ANO='+quotedstr(speAno.text);
                  end;
                  try
                     DMCNT.DCOM1.AppServer.EjecutaSQL(xSQLIns);
                  except
                  end;
                  DMCNT.cdsQry2.Next;
               end;
            end;
            // Cerrar todas las Compañías


            xSQL := 'update CNT401 '
                   +'set ';
            //INICIO HPC_201115_CNT
            xSQLEnero   := 'SALDMN02=NVL(SALDMN01,0)+NVL(DEBEMN02,0)-NVL(HABEMN02,0),'
                           +'SALDME02=NVL(SALDME01,0)+NVL(DEBEME02,0)-NVL(HABEME02,0),' ;

            xSQLFebrero := 'SALDMN03=NVL(SALDMN01,0)+NVL(DEBEMN02,0)-NVL(HABEMN02,0)+NVL(DEBEMN03,0)-NVL(HABEMN03,0),'
                           +'SALDME03=NVL(SALDME01,0)+NVL(DEBEME02,0)-NVL(HABEME02,0)+NVL(DEBEME03,0)-NVL(HABEME03,0),';

            xSQLMarzo   := 'SALDMN04=NVL(SALDMN01,0)+NVL(DEBEMN02,0)-NVL(HABEMN02,0)+NVL(DEBEMN03,0)-NVL(HABEMN03,0)+NVL(DEBEMN04,0)-NVL(HABEMN04,0),'
                           +'SALDME04=NVL(SALDME01,0)+NVL(DEBEME02,0)-NVL(HABEME02,0)+NVL(DEBEME03,0)-NVL(HABEME03,0)+NVL(DEBEME04,0)-NVL(HABEME04,0),';

            xSQLAbril   := 'SALDMN05=NVL(SALDMN01,0)+NVL(DEBEMN02,0)-NVL(HABEMN02,0)+NVL(DEBEMN03,0)-NVL(HABEMN03,0)+NVL(DEBEMN04,0)-NVL(HABEMN04,0)+NVL(DEBEMN05,0)-NVL(HABEMN05,0),'
                           +'SALDME05=NVL(SALDME01,0)+NVL(DEBEME02,0)-NVL(HABEME02,0)+NVL(DEBEME03,0)-NVL(HABEME03,0)+NVL(DEBEME04,0)-NVL(HABEME04,0)+NVL(DEBEME05,0)-NVL(HABEME05,0),';

            xSQLMayo    := 'SALDMN06=NVL(SALDMN01,0)+NVL(DEBEMN02,0)-NVL(HABEMN02,0)+NVL(DEBEMN03,0)-NVL(HABEMN03,0)+NVL(DEBEMN04,0)-NVL(HABEMN04,0)+NVL(DEBEMN05,0)-NVL(HABEMN05,0)+NVL(DEBEMN06,0)-NVL(HABEMN06,0),'
                           +'SALDME06=NVL(SALDME01,0)+NVL(DEBEME02,0)-NVL(HABEME02,0)+NVL(DEBEME03,0)-NVL(HABEME03,0)+NVL(DEBEME04,0)-NVL(HABEME04,0)+NVL(DEBEME05,0)-NVL(HABEME05,0)+NVL(DEBEME06,0)-NVL(HABEME06,0),';

            xSQLJunio   := 'SALDMN07=NVL(SALDMN01,0)+NVL(DEBEMN02,0)-NVL(HABEMN02,0)+NVL(DEBEMN03,0)-NVL(HABEMN03,0)+NVL(DEBEMN04,0)-NVL(HABEMN04,0)+NVL(DEBEMN05,0)-NVL(HABEMN05,0)+NVL(DEBEMN06,0)-NVL(HABEMN06,0)+NVL(DEBEMN07,0)-NVL(HABEMN07,0),'
                           +'SALDME07=NVL(SALDME01,0)+NVL(DEBEME02,0)-NVL(HABEME02,0)+NVL(DEBEME03,0)-NVL(HABEME03,0)+NVL(DEBEME04,0)-NVL(HABEME04,0)+NVL(DEBEME05,0)-NVL(HABEME05,0)+NVL(DEBEME06,0)-NVL(HABEME06,0)+NVL(DEBEME07,0)-NVL(HABEME07,0),';

            xSQLJulio   := 'SALDMN08=NVL(SALDMN01,0)+NVL(DEBEMN02,0)-NVL(HABEMN02,0)+NVL(DEBEMN03,0)-NVL(HABEMN03,0)+NVL(DEBEMN04,0)-NVL(HABEMN04,0)+NVL(DEBEMN05,0)-NVL(HABEMN05,0)+NVL(DEBEMN06,0)-NVL(HABEMN06,0)+NVL(DEBEMN07,0)-NVL(HABEMN07,0)+NVL(DEBEMN08,0)-NVL(HABEMN08,0),'
                           +'SALDME08=NVL(SALDME01,0)+NVL(DEBEME02,0)-NVL(HABEME02,0)+NVL(DEBEME03,0)-NVL(HABEME03,0)+NVL(DEBEME04,0)-NVL(HABEME04,0)+NVL(DEBEME05,0)-NVL(HABEME05,0)+NVL(DEBEME06,0)-NVL(HABEME06,0)+NVL(DEBEME07,0)-NVL(HABEME07,0)+NVL(DEBEME08,0)-NVL(HABEME08,0),';

            xSQLAgosto  := 'SALDMN09=NVL(SALDMN01,0)+NVL(DEBEMN02,0)-NVL(HABEMN02,0)+NVL(DEBEMN03,0)-NVL(HABEMN03,0)+NVL(DEBEMN04,0)-NVL(HABEMN04,0)+NVL(DEBEMN05,0)-NVL(HABEMN05,0)'
                           +'+NVL(DEBEMN06,0)-NVL(HABEMN06,0)+NVL(DEBEMN07,0)-NVL(HABEMN07,0)+NVL(DEBEMN08,0)-NVL(HABEMN08,0)+NVL(DEBEMN09,0)-NVL(HABEMN09,0),'
                           +'SALDME09=NVL(SALDME01,0)+NVL(DEBEME02,0)-NVL(HABEME02,0)+NVL(DEBEME03,0)-NVL(HABEME03,0)+NVL(DEBEME04,0)-NVL(HABEME04,0)+NVL(DEBEME05,0)-NVL(HABEME05,0)'
                           +'+NVL(DEBEME06,0)-NVL(HABEME06,0)+NVL(DEBEME07,0)-NVL(HABEME07,0)+NVL(DEBEME08,0)-NVL(HABEME08,0)+NVL(DEBEME09,0)-NVL(HABEME09,0),';

            xSQLSetiembre := 'SALDMN10=NVL(SALDMN01,0)+NVL(DEBEMN02,0)-NVL(HABEMN02,0)+NVL(DEBEMN03,0)-NVL(HABEMN03,0)+NVL(DEBEMN04,0)-NVL(HABEMN04,0)+NVL(DEBEMN05,0)-NVL(HABEMN05,0)'
                           +'+NVL(DEBEMN06,0)-NVL(HABEMN06,0)+NVL(DEBEMN07,0)-NVL(HABEMN07,0)+NVL(DEBEMN08,0)-NVL(HABEMN08,0)+NVL(DEBEMN09,0)-NVL(HABEMN09,0)+NVL(DEBEMN10,0)-NVL(HABEMN10,0),'
                           +'SALDME10=NVL(SALDME01,0)+NVL(DEBEME02,0)-NVL(HABEME02,0)+NVL(DEBEME03,0)-NVL(HABEME03,0)+NVL(DEBEME04,0)-NVL(HABEME04,0)+NVL(DEBEME05,0)-NVL(HABEME05,0)+NVL(DEBEME06,0) '
                           +'-NVL(HABEME06,0)+NVL(DEBEME07,0)-NVL(HABEME07,0)+NVL(DEBEME08,0)-NVL(HABEME08,0)+NVL(DEBEME09,0)-NVL(HABEME09,0)+NVL(DEBEME10,0)-NVL(HABEME10,0),';

            xSQLOctubre   := 'SALDMN11=NVL(SALDMN01,0)+NVL(DEBEMN02,0)-NVL(HABEMN02,0)+NVL(DEBEMN03,0)-NVL(HABEMN03,0)+NVL(DEBEMN04,0)-NVL(HABEMN04,0)+NVL(DEBEMN05,0)-NVL(HABEMN05,0)'
                           +'+NVL(DEBEMN06,0)-NVL(HABEMN06,0)+NVL(DEBEMN07,0)-NVL(HABEMN07,0)+NVL(DEBEMN08,0)-NVL(HABEMN08,0)+NVL(DEBEMN09,0)-NVL(HABEMN09,0)+NVL(DEBEMN10,0)-NVL(HABEMN10,0)+NVL(DEBEMN11,0)-NVL(HABEMN11,0),'
                           +'SALDME11=NVL(SALDME01,0)+NVL(DEBEME02,0)-NVL(HABEME02,0)+NVL(DEBEME03,0)-NVL(HABEME03,0)+NVL(DEBEME04,0)-NVL(HABEME04,0)+NVL(DEBEME05,0)-NVL(HABEME05,0)+NVL(DEBEME06,0)-NVL(HABEME06,0)+NVL(DEBEME07,0)-'
                           +'NVL(HABEME07,0)+NVL(DEBEME08,0)-NVL(HABEME08,0)+NVL(DEBEME09,0)-NVL(HABEME09,0)+NVL(DEBEME10,0)-NVL(HABEME10,0)+NVL(DEBEME11,0)-NVL(HABEME11,0),';

            xSQLNoviembre := 'SALDMN12=NVL(SALDMN01,0)+NVL(DEBEMN02,0)-NVL(HABEMN02,0)+NVL(DEBEMN03,0)-NVL(HABEMN03,0)+NVL(DEBEMN04,0)-NVL(HABEMN04,0)+NVL(DEBEMN05,0)-NVL(HABEMN05,0)'
                           +'+NVL(DEBEMN06,0)-NVL(HABEMN06,0)+NVL(DEBEMN07,0)-NVL(HABEMN07,0)+NVL(DEBEMN08,0)-NVL(HABEMN08,0)+NVL(DEBEMN09,0)-NVL(HABEMN09,0)+NVL(DEBEMN10,0)-'
                           +'NVL(HABEMN10,0)+NVL(DEBEMN11,0)-NVL(HABEMN11,0)+NVL(DEBEMN12,0)-NVL(HABEMN12,0),'
                           +'SALDME12=NVL(SALDME01,0)+NVL(DEBEME02,0)-NVL(HABEME02,0)+NVL(DEBEME03,0)-NVL(HABEME03,0)+NVL(DEBEME04,0)-NVL(HABEME04,0)+NVL(DEBEME05,0)-NVL(HABEME05,0)'
                           +'+NVL(DEBEME06,0)-NVL(HABEME06,0)+NVL(DEBEME07,0)-NVL(HABEME07,0)+NVL(DEBEME08,0)-NVL(HABEME08,0)+NVL(DEBEME09,0)-NVL(HABEME09,0)+NVL(DEBEME10,0)'
                           +'-NVL(HABEME10,0)+NVL(DEBEME11,0)-NVL(HABEME11,0)+NVL(DEBEME12,0)-NVL(HABEME12,0),';

            xSQLDiciembre := 'SALDMN13=NVL(SALDMN01,0)+NVL(DEBEMN02,0)-NVL(HABEMN02,0)+NVL(DEBEMN03,0)-NVL(HABEMN03,0)+NVL(DEBEMN04,0)-NVL(HABEMN04,0)+NVL(DEBEMN05,0)-NVL(HABEMN05,0)'
                           +'+NVL(DEBEMN06,0)-NVL(HABEMN06,0)+NVL(DEBEMN07,0)-NVL(HABEMN07,0)+NVL(DEBEMN08,0)-NVL(HABEMN08,0)+NVL(DEBEMN09,0)-NVL(HABEMN09,0)+NVL(DEBEMN10,0)-'
                           +'NVL(HABEMN10,0)+NVL(DEBEMN11,0)-NVL(HABEMN11,0)+NVL(DEBEMN12,0)-NVL(HABEMN12,0)+NVL(DEBEMN13,0)-NVL(HABEMN13,0),'
                           +'SALDME13=NVL(SALDME01,0)+NVL(DEBEME02,0)-NVL(HABEME02,0)+NVL(DEBEME03,0)-NVL(HABEME03,0)+NVL(DEBEME04,0)-NVL(HABEME04,0)+NVL(DEBEME05,0)-NVL(HABEME05,0)+'
                           +'NVL(DEBEME06,0)-NVL(HABEME06,0)+NVL(DEBEME07,0)-NVL(HABEME07,0)+NVL(DEBEME08,0)-NVL(HABEME08,0)+NVL(DEBEME09,0)-NVL(HABEME09,0)+NVL(DEBEME10,0)-'
                           +'NVL(HABEME10,0)+NVL(DEBEME11,0)-NVL(HABEME11,0)+NVL(DEBEME12,0)-NVL(HABEME12,0)+NVL(DEBEME13,0)-NVL(HABEME13,0) ';
            Case rgMes.itemindex Of
            // Enero
               0: xSQL := xSQL
                           +xSQLEnero
                           +xSQLFebrero
                           +xSQLMarzo
                           +xSQLAbril
                           +xSQLMayo
                           +xSQLJunio
                           +xSQLJulio
                           +xSQLAgosto
                           +xSQLSetiembre
                           +xSQLOctubre
                           +xSQLNoviembre
                           +xSQLDiciembre;
            // Febrero
               1: xSQL := xSQL
                           +xSQLFebrero
                           +xSQLMarzo
                           +xSQLAbril
                           +xSQLMayo
                           +xSQLJunio
                           +xSQLJulio
                           +xSQLAgosto
                           +xSQLSetiembre
                           +xSQLOctubre
                           +xSQLNoviembre
                           +xSQLDiciembre ;
            // Marzo
               2: xSQL := xSQL
                           +xSQLMarzo
                           +xSQLAbril
                           +xSQLMayo
                           +xSQLJunio
                           +xSQLJulio
                           +xSQLAgosto
                           +xSQLSetiembre
                           +xSQLOctubre
                           +xSQLNoviembre
                           +xSQLDiciembre;
            // Abril
               3: xSQL := xSQL
                           +xSQLAbril
                           +xSQLMayo
                           +xSQLJunio
                           +xSQLJulio
                           +xSQLAgosto
                           +xSQLSetiembre
                           +xSQLOctubre
                           +xSQLNoviembre
                           +xSQLDiciembre;
            // Mayo
               4: xSQL := xSQL
                           +xSQLMayo
                           +xSQLJunio
                           +xSQLJulio
                           +xSQLAgosto
                           +xSQLSetiembre
                           +xSQLOctubre
                           +xSQLNoviembre
                           +xSQLDiciembre;
            // Junio
               5: xSQL := xSQL
                           +xSQLJunio
                           +xSQLJulio
                           +xSQLAgosto
                           +xSQLSetiembre
                           +xSQLOctubre
                           +xSQLNoviembre
                           +xSQLDiciembre;
            // Julio
               6: xSQL := xSQL
                           +xSQLJulio
                           +xSQLAgosto
                           +xSQLSetiembre
                           +xSQLOctubre
                           +xSQLNoviembre
                           +xSQLDiciembre;
            // Agosto
               7: xSQL := xSQL
                           +xSQLAgosto
                           +xSQLSetiembre
                           +xSQLOctubre
                           +xSQLNoviembre
                           +xSQLDiciembre;
            // Setiembre
               8: xSQL := xSQL
                           +xSQLSetiembre
                           +xSQLOctubre
                           +xSQLNoviembre
                           +xSQLDiciembre;
            // Octubre
               9: xSQL := xSQL
                           +xSQLOctubre
                           +xSQLNoviembre
                           +xSQLDiciembre;
            // Noviembre
              10: xSQL := xSQL
                           +xSQLNoviembre
                           +xSQLDiciembre;
            // Diciembre
              11: xSQL := xSQL
                           +xSQLDiciembre;
            End;
            //FIN HPC_201115_CNT

            xSQL := xSQL+' where CIAID='+quotedstr(dblcCia.Text)
                        +'  and ANO='+quotedstr(speAno.text);
            try
               DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
            except
            end;
         //   DMCNT.ControlTranCNt(3);
         End;
      End
      Else
         If xCerrado = 'C' Then
            showmessage('Cerrar Mes Anterior')
         Else
            showmessage('No se puede Cerrar')
   End
   Else
      Showmessage('Escoja un Mes');
End;

Procedure TFCierrePer.MesCerrado;
Begin
   showmessage('El Mes ya se encuentra Cerrado');
   rgMes.itemindex := -1;
   xCerrado := 'S';
End;

Procedure TFCierrePer.bbtnCancClick(Sender: TObject);
Begin
   rgMes.ItemIndex := -1;
End;

Procedure TFCierrePer.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFCierrePer.bbtnOpenClick(Sender: TObject);
Var
   xSql, xMes: String;
Begin
   If rgMEs.itemindex <> -1 Then
   Begin
      rgMes.OnClick(sender);
      If xCerrado = 'S' Then
      Begin
         xMes:=DMCNT.StrZero( inttostr(rgMes.itemindex+1), 2 );
         if DMCNT.MesCerrado( xMes, speAno.text, sCiaConsol ) then
         begin
            ShowMessage('Compañía Consolidada Fue cerrada, No Se puede Aperturar.');
            Exit;
         end;

         If MessageDlg('Aceptar Apertura' + chr(13) + chr(13) +
                       '  ¿ Esta Seguro ?  ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            DMCNT.cdsCierres.Edit;
            DMCNT.cdsCierres.FieldByName('CIAID').AsString := dblcCia.Text;
            DMCNT.cdsCierres.FieldByName('MODULO').AsString := 'CNT';
            DMCNT.cdsCierres.FieldByName('FECCIERRE').value := Now;
            DMCNT.cdsCierres.FieldByName('USUARIO').AsString := DMCNT.wUsuario;
            DMCNT.cdsCierres.FieldByName('FREG').value := Now;
            DMCNT.cdsCierres.FieldByName('HREG').value := Now;
            DMCNT.cdsCierres.FieldByName('ANO').AsString := speAno.text;
            Case rgMes.itemindex Of
               0: DMCNT.cdsCierres.FieldByName('PER01').Clear;
               1: DMCNT.cdsCierres.FieldByName('PER02').Clear;
               2: DMCNT.cdsCierres.FieldByName('PER03').Clear;
               3: DMCNT.cdsCierres.FieldByName('PER04').Clear;
               4: DMCNT.cdsCierres.FieldByName('PER05').Clear;
               5: DMCNT.cdsCierres.FieldByName('PER06').Clear;
               6: DMCNT.cdsCierres.FieldByName('PER07').Clear;
               7: DMCNT.cdsCierres.FieldByName('PER08').Clear;
               8: DMCNT.cdsCierres.FieldByName('PER09').Clear;
               9: DMCNT.cdsCierres.FieldByName('PER10').Clear;
               10: DMCNT.cdsCierres.FieldByName('PER11').Clear;
               11: DMCNT.cdsCierres.FieldByName('PER12').Clear;
            End;

            // INICIO HPC_201402_CNT
            //DMCNT.ControlTranCNT(3);
            if DMCNT.cdsCierres.ApplyUpdates(0)>0 then
            begin
               ShowMessage('No se puede actualizar');
               exit;
            end;
            // FIN HPC_201402_CNT

            xSql := 'INSERT INTO TGE184 (CIAID,USUARIO,FREG,HREG,ANO,FECAPERTU,PERAPER) VALUES (' +
               quotedstr(dblcCia.text) + ',' + quotedstr(DMCNT.wUsuario) + ',' + wRepFecServi + ',' + wRepHorServi + ',' +
               quotedstr(speAno.text) + ',' + wRepFecServi + ',' + quotedstr(DMCNT.StrZero(IntToStr(rgMes.itemindex + 1), 2)) + ')';
            DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
         End;
      End
      Else
         showmessage('No se puede Aperturar, el Mes no se encuentra Cerrado')
   End
   Else
      Showmessage('Escoja un Mes');
End;

Procedure TFCierrePer.MuestraUsuarios;
Var
   xSQL: String;
Begin
   DMCNT.cdsBloqueo.Close;
   xSQL := 'SELECT B.USERID, C.USERNOM, CASE WHEN ESTADO=''C'' THEN ''BLOQUEADO'' ELSE '''' END ESTADO, '
      + 'USUCIERRE '
      + 'FROM TGE001 A, TGE007 B, TGE006 C, CNT_CIE_USU D '
      + 'WHERE A.MODULOID IN (''CNT'') AND A.TIPO=''0'' AND B.USERID IS NOT NULL '
      + ' AND ( (FECEXP IS NULL AND FECFIN_PWD IS NULL ) OR ( TO_DATE(SYSDATE)<FECFIN_PWD )  ) '
      + ' AND A.GRUPOID=B.GRUPOID(+) AND B.USERID=C.USERID(+) '
      + ' AND B.USERID=D.USERID(+) AND PERIODO(+)=''' + mePeriodo.text + ''' and ESTADO(+)=''C'''
      + 'GROUP BY B.USERID, C.USERNOM, ESTADO, USUCIERRE '
      + 'ORDER BY USERID';
   DMCNT.cdsBloqueo.dataRequest(xSQL);
   DMCNT.cdsBloqueo.Open;
End;

Procedure TFCierrePer.bbtnBloqueaUsuClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMCNT.cdsBloqueo.FieldByname('ESTADO').AsString = 'BLOQUEADO' Then
   Begin
      ShowMessage('Usuario Bloqueado...Verificar');
      Exit;
   End;
   xSQL := 'INSERT INTO DB2ADMIN.CNT_CIE_USU( PERIODO, USERID, ITEM, ESTADO, FECCIERRE, USUCIERRE ) '
      + 'Values( ''' + mePeriodo.text + ''', ''' + DMCNT.cdsBloqueo.FieldByname('USERID').AsString + ''', '
      + '( select nvl(max(item),0)+1 from DB2ADMIN.CNT_CIE_USU '
      + 'where periodo=''' + mePeriodo.text + ''' '
      + ' and userid=''' + DMCNT.cdsBloqueo.FieldByname('USERID').AsString + ''' ), '
      + '''C'', SYSDATE, ''' + DMCNT.wUsuario + ''' )';
   DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
   MuestraUsuarios;
End;

Procedure TFCierrePer.bbtnDesBloqUsuClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMCNT.cdsBloqueo.FieldByname('ESTADO').AsString = 'BLOQUEADO' Then
   Begin
      xSQL := 'UPDATE DB2ADMIN.CNT_CIE_USU '
         + 'SET ESTADO=''A'', FECACTIVA=SYSDATE, USUACTIVA=''' + DMCNT.wUsuario + ''' '
         + 'WHERE PERIODO=''' + mePeriodo.text + ''' AND USERID=''' + DMCNT.cdsBloqueo.FieldByname('USERID').AsString + ''' '
         + ' AND ESTADO=''C''';
      DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
      MuestraUsuarios;
   End
   Else
      ShowMessage('Usuario no se encuentra Bloqueado...Verificar');
End;

Procedure TFCierrePer.bbtnBloqueaTodoClick(Sender: TObject);
Var
   xSQL: String;
Begin
   DMCNT.cdsBloqueo.First;
   While Not DMCNT.cdsBloqueo.Eof Do
   Begin
      If DMCNT.cdsBloqueo.FieldByname('ESTADO').AsString = 'BLOQUEADO' Then
      Else
      Begin
         xSQL := 'INSERT INTO DB2ADMIN.CNT_CIE_USU( PERIODO, USERID, ITEM, ESTADO, FECCIERRE, USUCIERRE ) '
            + 'Values( ''' + mePeriodo.text + ''', ''' + DMCNT.cdsBloqueo.FieldByname('USERID').AsString + ''', '
            + '( select nvl(max(item),0)+1 from DB2ADMIN.CNT_CIE_USU '
            + 'where periodo=''' + mePeriodo.text + ''' '
            + ' and userid=''' + DMCNT.cdsBloqueo.FieldByname('USERID').AsString + ''' ), '
            + '''C'', SYSDATE, ''' + DMCNT.wUsuario + ''' )';
         DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
      DMCNT.cdsBloqueo.Next;
   End;
   MuestraUsuarios;
End;

Procedure TFCierrePer.bbtnDesBloqTodoClick(Sender: TObject);
Var
   xSQL: String;
Begin
   DMCNT.cdsBloqueo.First;
   While Not DMCNT.cdsBloqueo.Eof Do
   Begin
      If DMCNT.cdsBloqueo.FieldByname('ESTADO').AsString = 'BLOQUEADO' Then
      Begin
         xSQL := 'UPDATE DB2ADMIN.CNT_CIE_USU '
            + 'SET ESTADO=''A'', FECACTIVA=SYSDATE, USUACTIVA=''' + DMCNT.wUsuario + ''' '
            + 'WHERE PERIODO=''' + mePeriodo.text + ''' AND USERID=''' + DMCNT.cdsBloqueo.FieldByname('USERID').AsString + ''' '
            + ' AND ESTADO=''C''';
         DMCNT.DCOM1.AppServer.EjecutaSQL(xSQL);
      End;
      DMCNT.cdsBloqueo.Next;
   End;
   MuestraUsuarios;
End;

Procedure TFCierrePer.bbtnUsuClick(Sender: TObject);
Begin
   If (mePeriodo.Text = sPer01) Or (mePeriodo.Text = sPer02) Then
      MuestraUsuarios
   Else
      ShowMessage('periodo seleccionado no es valido');
End;

Procedure TFCierrePer.mePeriodoChange(Sender: TObject);
Begin
   DMCNT.cdsBloqueo.Close;
End;

Procedure TFCierrePer.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

End.

