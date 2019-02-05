unit CNT230A;
// HPC_201702_CNT    02/06/2017
//                   Permite trabajar con mas de un periodo contable para un mismo descargo de banco
//                   Permite visualizar Saldos Iniciales
//                   Permite exportar a excel
//                   Permite contabilizar los extractos bancarios para periodos atrasados
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, Wwdbspin,
  wwcheckbox;

type
  TFSelMovAnt = class(TForm)
    btnAceptar: TButton;
    btnCancelar: TButton;
    dbsMEs: TwwDBSpinEdit;
    dbsAno: TwwDBSpinEdit;
    btnFiltrar: TButton;
    cbMarcado: TwwCheckBox;
    dbgMovCont: TwwDBGrid;
    chkTodo: TCheckBox;
    cmbFiltro: TComboBox;
    edtFiltro: TEdit;
    btnLimpiar: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnFiltrarOnClick(Sender: TObject);
    procedure ListarMovCont;
    procedure chkTodoClick(Sender: TObject);
    procedure cbMarcadoClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure Insertar;
    function ValidarPeriodoCerrado: Boolean;
    procedure FormCreate(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure cbMarcado_UpdEstado(sEstado:string);
    function ValidarFiltro:Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    sOrigenId, sCuentaId, sCiaId, sAno, sMes, sNumConc : String;
    iContadorMov : Integer;
    sSemaforo : String;
  end;

var
    FSelMovAnt: TFSelMovAnt;
    xSQL: String;

implementation

Uses CNTDM;
{$R *.dfm}

procedure TFSelMovAnt.FormActivate(Sender: TObject);
begin

    dbsMes.Text:=sMes;
    dbsAno.Text:=sAno;
    sSemaforo := '1';

    ListarMovCont;

    dbgMovCont.Selected.Clear;
    dbgMovCont.Selected.Add('FLAG'#9'2'#9' ');
    dbgMovCont.Selected.Add('DNI'#9'8'#9'DNI'#9#9);
    dbgMovCont.Selected.Add('CNTFEMIS'#9'10'#9'Fec.Emis.'#9#9);
    dbgMovCont.Selected.Add('IMPORTE'#9'13'#9'Importe'#9#9);
    dbgMovCont.Selected.Add('CNTDH'#9'1'#9'DH'#9#9);
    dbgMovCont.Selected.Add('NUMOPERA'#9'10'#9'N.Operac.'#9#9);
    dbgMovCont.Selected.Add('TDIARID'#9'02'#9'T.Diario'#9#9);
    dbgMovCont.Selected.Add('CNTCOMPROB'#9'10'#9'Num.Comprob.'#9#9);
    dbgMovCont.Selected.Add('CNTGLOSA'#9'25'#9'Glosa'#9#9);
    dbgMovCont.Selected.Add('CNTLOTE'#9'8'#9'Lote'#9#9);
    dbgMovCont.Selected.Add('CNTSERIE'#9'8'#9'Serie'#9#9);
    dbgMovCont.Selected.Add('CNTNODOC'#9'10'#9'Número'#9#9);
    dbgMovCont.SetControlType('FLAG',fctCustom,'cbMarcado');
    dbgMovCont.ApplySelected;

    dbgMovCont.Columns[1].ReadOnly  := True;
    dbgMovCont.Columns[2].ReadOnly  := True;
    dbgMovCont.Columns[3].ReadOnly  := True;
    dbgMovCont.Columns[4].ReadOnly  := True;
    dbgMovCont.Columns[5].ReadOnly  := True;
    dbgMovCont.Columns[6].ReadOnly  := True;
    dbgMovCont.Columns[7].ReadOnly  := True;
    dbgMovCont.Columns[8].ReadOnly  := True;
    dbgMovCont.Columns[9].ReadOnly  := True;
    dbgMovCont.Columns[10].ReadOnly  := True;
    dbgMovCont.Columns[11].ReadOnly  := True;

end;

procedure TFSelMovAnt.btnFiltrarOnClick(Sender: TObject);
begin
    If ValidarFiltro Then
        ListarMovCont;
end;

procedure TFSelMovAnt.ListarMovCont;
var
    iIndex : Integer;
begin
    cbMarcado.visible := True;

    iIndex := cmbFiltro.ItemIndex;

    xSQL := 'Select ''N'' FLAG, CIAID, TDIARID, CNTFEMIS, CNTCOMPROB, CNTANOMM, CNTLOTE, CUENTAID, '
            + '     CLAUXID, AUXID, NUMOPERA, DNI, '
            + '     CNTDH, CNTMTOORI IMPORTE, CNTGLOSA, CNTSERIE, CNTNODOC '
            + ' from (Select c.CIAID, c.TDIARID, c.CNTFEMIS, c.CNTCOMPROB, c.CNTANOMM, CNTLOTE, c.CUENTAID, '
            + '              c.CLAUXID, c.AUXID, c.CNTNODOC NUMOPERA, SF_CNT_CONC_SOLONUMERO(c.CNTGLOSA) DNI, '
            + '              c.CNTDH, c.CNTMTOORI, c.CNTGLOSA, c.CNTSERIE, c.CNTNODOC '
            + '         From CNT301 c'
            + '        where c.CIAID=' + QuotedStr(sCiaId)
            + '          and c.CNTANOMM=' + QuotedStr(dbsAno.Text + dbsMes.Text)
            + '          and c.CUENTAID=' + quotedstr(sCuentaId);

    If (sOrigenId <> '') Then
        xSQL := xSQL + ' and TDIARID=' + QuotedStr(sOrigenId);

    xSQL := xSQL + ' and ( Select COUNT(1) CUENTA '
                  + '  from CNT_CONC_MOV_CONT m'
                  + ' where m.CIAID=c.CIAID'
                  + '   and m.TDIARID=c.TDIARID'
                  + '   and m.CNTANOMM=c.CNTANOMM'
                  + '   and m.CNTCOMPROB=c.CNTCOMPROB'
                  + '   and m.NUMOPERA=c.CNTNODOC'
                  + '   and m.IDEXTBAN IS NOT NULL and m.FLGCONC = ''S'' ) = 0 ';

    xSQL := xSQL + ' and ( Select COUNT(1) CUENTA '
                  + '  from CNT_CONC_MOV_CONT m'
                  + ' where m.IDCONC=' + quotedstr(sNumConc)
                  + '   and m.CIAID=c.CIAID'
                  + '   and m.TDIARID=c.TDIARID'
                  + '   and m.CNTANOMM=c.CNTANOMM'
                  + '   and m.CNTCOMPROB=c.CNTCOMPROB'
                  + '   and m.NUMOPERA=c.CNTNODOC'
                  + '   and m.IDEXTBAN IS NULL and NVL(m.FLGCONC,''N'') = ''N'' ) = 0 ';


    If (iIndex <> 0) Then
    Begin
        Case iIndex Of
            1:xSQL := xSQL + ' and UPPER(c.CNTGLOSA) LIKE UPPER(''%' + edtFiltro.Text + '%'') ';
            2:xSQL := xSQL + ' and UPPER(c.CNTLOTE) LIKE UPPER(''%' + edtFiltro.Text + '%'') ';
            3:xSQL := xSQL + ' and UPPER(c.CNTSERIE) LIKE UPPER(''%' + edtFiltro.Text + '%'') ';
            4:xSQL := xSQL + ' and UPPER(c.CNTNODOC) LIKE UPPER(''%' + edtFiltro.Text + '%'') ';
        End;
    End;

    xSQL := xSQL
            + '         Order by c.CNTFEMIS )';

    sSemaforo := '0';
    DMCNT.cdsSQL.Close;
    DMCNT.cdsSQL.DataRequest(xSQL);
    DMCNT.cdsSQL.Open;
    dbgMovCont.DataSource := DMCNT.dsSQL;
    sSemaforo := '1';

    btnAceptar.Enabled := true;
    If (DMCNT.cdsSQL.RecordCount = 0) Then
        btnAceptar.Enabled := false;

end;

procedure TFSelMovAnt.chkTodoClick(Sender: TObject);
begin

    If (DMCNT.cdsSQL.RecordCount = 0) Then
        exit;

    sSemaforo := '0';

    DMCNT.cdsSQL.First;
    While Not DMCNT.cdsSQL.Eof Do
    Begin
        If  chkTodo.Checked Then
        Begin
            if DMCNT.cdsSQL.FieldByName('FLAG').AsString = 'N' then
                cbMarcado_UpdEstado('S');
        End
        Else
        Begin
            if DMCNT.cdsSQL.FieldByName('FLAG').AsString = 'S' then
                cbMarcado_UpdEstado('N');
        End;

        DMCNT.cdsSQL.Next;
    End;

    sSemaforo := '1';
end;

procedure TFSelMovAnt.cbMarcadoClick(Sender: TObject);
begin
    If (DMCNT.cdsSQL.RecordCount = 0) Then
        exit;

    If (sSemaforo = '1') Then
    Begin

        If cbMarcado.Checked then
            cbMarcado_UpdEstado('S')
        Else
            cbMarcado_UpdEstado('N');
    End;
end;

procedure TFSelMovAnt.cbMarcado_UpdEstado(sEstado:string);
begin
    DMCNT.cdsSQL.Edit;
    DMCNT.cdsSQL.FieldByName('FLAG').AsString := sEstado;
    DMCNT.cdsSQL.Post;
end;

procedure TFSelMovAnt.btnAceptarClick(Sender: TObject);
begin
    Insertar;
end;

procedure TFSelMovAnt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TFSelMovAnt.btnCancelarClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure  TFSelMovAnt.Insertar;
begin

    DMCNT.cdsSQL.First;

    While Not DMCNT.cdsSQL.Eof Do
    Begin
        If DMCNT.cdsSQL.FieldByName('FLAG').AsString = 'S' then
        Begin
            iContadorMov := iContadorMov + 1;
            xSQL := 'INSERT INTO CNT_CONC_MOV_CONT(IDCONC, IDMOVCONT, IDEXTBAN, CIAID, TDIARID, CNTFEMIS, '
                    + '                              CNTCOMPROB, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                    + '                              NUMOPERA, DNI, CNTDH, IMPORTE, FLGCONC, USUARIO, '
                    + '                              FREG,CNTGLOSA) '
                    + ' SELECT  ' + quotedstr(sNumConc) + ', LPAD('+ IntToStr(iContadorMov) +',6,''0''),' + quotedstr('')+ ',' +  quotedstr(DMCNT.cdsSQL.FieldByname('CIAID').AsString) + ',' +  quotedstr(DMCNT.cdsSQL.FieldByname('TDIARID').AsString) + ',' + quotedstr(datetostr(DMCNT.cdsSQL.FieldByName('CNTFEMIS').AsDateTime))+ ','
                    + quotedstr(DMCNT.cdsSQL.FieldByname('CNTCOMPROB').AsString) + ',' + quotedstr(DMCNT.cdsSQL.FieldByname('CNTANOMM').AsString) + ',' + quotedstr(DMCNT.cdsSQL.FieldByname('CNTLOTE').AsString) + ',' + quotedstr(DMCNT.cdsSQL.FieldByname('CUENTAID').AsString) + ',' + quotedstr(DMCNT.cdsSQL.FieldByname('CLAUXID').AsString) + ',' + quotedstr(DMCNT.cdsSQL.FieldByname('AUXID').AsString) + ','
                    + quotedstr(DMCNT.cdsSQL.FieldByname('NUMOPERA').AsString) + ',' + quotedstr(DMCNT.cdsSQL.FieldByname('DNI').AsString) + ',' + quotedstr(DMCNT.cdsSQL.FieldByname('CNTDH').AsString) + ',' + floattostr(DMCNT.cdsSQL.FieldByName('IMPORTE').AsFloat) + ',' + quotedstr('N') + ',' + quotedstr(DMCNT.wUsuario) + ','
                    + ' TRUNC (SYSDATE,''DD''),' + quotedstr(DMCNT.cdsSQL.FieldByname('CNTGLOSA').AsString)
                    + ' FROM DUAL ';

            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

        End;
        DMCNT.cdsSQL.Next;
    End;

    ModalResult := mrOk;

end;

function TFSelMovAnt.ValidarPeriodoCerrado: Boolean;
begin
    xSQL := 'Select * '
          + '  from TGE154 '
          + ' where CIAID=' + quotedstr(sCiaId)
          + '   and ANO=' + quotedstr(dbsAno.Text);
    DMCNT.cdsCierres.close;
    DMCNT.cdsCierres.datarequest(xSQL);
    DMCNT.cdsCierres.open;
    Result := True;
    If DMCNT.cdsCierres.FieldByName('PER' + dbsMEs.Text).AsString = 'S' Then
    Begin
        Showmessage('El periodo se encuentra Cerrado');
        Result := false;
        exit;
    End;

    Result:= true;
end;

procedure TFSelMovAnt.FormCreate(Sender: TObject);
begin
   cmbFiltro.AddItem('<seleccione>', nil);
   cmbFiltro.AddItem('GLOSA', nil);
   cmbFiltro.AddItem('LOTE', nil);
   cmbFiltro.AddItem('SERIE', nil);
   cmbFiltro.AddItem('NUMERO', nil);

   cmbFiltro.ItemIndex := 0;
end;

procedure TFSelMovAnt.btnLimpiarClick(Sender: TObject);
begin
   cmbFiltro.ItemIndex := 0;
   edtFiltro.Text := '';
end;


function TFSelMovAnt.ValidarFiltro:Boolean;
begin
    dbsMEs.Text := DMCNT.StrZero(dbsMEs.Text, 2);

    If  StrToInt(dbsAno.Text + dbsMes.Text) >  StrToInt(sAno + sMes) Then
    Begin
        Showmessage('El periodo no puede ser mayor a: ' + sMes + '/' + sAno);
        dbsMes.SetFocus;
        Result:=false;
        exit;
    End;

    If (Not ValidarPeriodoCerrado) Then
    Begin
        dbsMes.SetFocus;
        Result:=false;
        exit;
    End;

    If  (cmbFiltro.ItemIndex <> 0) and (edtFiltro.Text = '' ) Then
    Begin
        Showmessage('Ingrese un texto a filtrar');
        edtFiltro.SetFocus;
        Result:=false;
        exit;
    End;

    If  (cmbFiltro.ItemIndex = 0) and (edtFiltro.Text <> '' ) Then
    Begin
        Showmessage('Seleccione un criterio de filtro válido');
        cmbFiltro.SetFocus;
        Result:=false;
        exit;
    End;
    
    Result:= true;
end;

end.
