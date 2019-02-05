unit CNT204;

// Actualizaciones

// HPC_201501_CNT          12/02/2015  Regulariza Métodos Correctos de Control Transaccional

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, wwdblook, ExtCtrls, DB, Spin,
  OleCtnrs, MPlayer, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid, DBGrids,
  oaContabiliza, Wwdbdlg, oaVariables;

type
  TFActualizacion = class(TForm)
    Panel1: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Label2: TLabel;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    meAnoMM: TMaskEdit;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    GroupBox1: TGroupBox;
    dblcdCuenta: TwwDBLookupComboDlg;
    Label5: TLabel;
    edtCuenta: TEdit;
    BitBtn1: TBitBtn;
    procedure bbtnOkClick(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dblcdCuentaEnter(Sender: TObject);
    procedure dblcdCuentaExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
    procedure ValidacionPrevia ;

  public
    { Public declarations }
  end;

  procedure CNActualizacion; stdcall;

exports
  CNActualizacion;


var
  xSQL : WideString;
  xDebeMN,xHabeMN,xDebeME,xSaldMN, xSaldME,xHabeME, xSaldMNs, xSaldMEs :String;
  xTDiarDes, xCtaDes, xTDiario, xCuenta, xCia, xAno, xMes: String;
  xTDebeMN, xTDebeME, xTHabeMN, xTHabeME : DOUBLE;
  FActualizacion: TFActualizacion;

implementation

Uses CNTDM;

{$R *.DFM}

procedure CNActualizacion;
begin
   if DMCNT=nil then exit;
  if not DMCNT.DCOM1.Connected then Exit;
  try
     DMCNT.Filtracds( DMCNT.cdsNivel,   '' );
     FActualizacion:=TFActualizacion.Create( Application );
     FActualizacion.ShowModal;
  finally
     FActualizacion.Free;
  end;
end;


procedure TFActualizacion.bbtnOkClick(Sender: TObject);
var
   xMes, xAno, xSQL : String;
begin
   ValidacionPrevia ;

   if length(speMM.text)=1 then
      xmes:='0'+speMM.text
   else
      xmes:=copy(speMM.text,1,2);

   //if MessageDlg( ' Confirme Actualización ',mtConfirmation,[mbYes, mbNo],0) = mrNo then
   if MessageDlg( ' Confirme Actualización ',mtConfirmation,[mbYes, mbNo],0) <> mrYes then
      Exit;

   Screen.Cursor:=crHourGlass;


   xAno:=speAno.text;

   if dblcdCuenta.Text<>'' then begin

      xSQL:='UPDATE CNT401 '+
            'SET DEBEMN'+xmes+'=0, '+
            '    HABEMN'+xmes+'=0, '+
            '    DEBEME'+xmes+'=0, '+
            '    HABEME'+xmes+'=0, '+
            '    SALDMN'+xmes+'=0, '+
            '    SALDME'+xmes+'=0 '+
            '    WHERE CIAID='+QuotedStr(dblcCia.Text)+' AND ANO='+quotedstr(xAno)
           +     ' and CUENTAID='''+dblcdCuenta.Text+''''  ;
      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      try
        DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
        DMCNT.DCOM1.AppServer.GrabaTransaccion;
      except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
      end;

      if not SOLConta(dblcCia.Text, '', xAno+xMes, dblcdCuenta.Text,
             SRV_D, 'MC', DMCNT.wModulo, DMCNT.cdsMovCNT1, DMCNT.cdsNivel,
             DMCNT.cdsResultSet, DMCNT.DCOM1, Self ) then
      begin
         ShowMessage( 'Error en Mayorización' );
         exit;
      end;
   end
   else
   begin
      xSql:='SELECT * FROM TGE154 WHERE CIAID='+quotedstr(dblcCia.text)+' AND ANO='+quotedstr(speAno.text);
      DMCNT.cdsCierres.close;
      DMCNT.cdsCierres.datarequest(xsql);
      DMCNT.cdsCierres.open;

      if xMes='00' then
      begin
        if DMCNT.cdsCierres.FieldByName('PER01').AsString = 'S' then
        begin
           Screen.Cursor:=crDefault;
           Showmessage('El periodo se encuentra Cerrado');
           exit;
        end;
      end
      else
      begin
        if DMCNT.cdsCierres.FieldByName('PER'+xmes).AsString = 'S' then
        begin
           Screen.Cursor:=crDefault;
           Showmessage('El periodo se encuentra Cerrado');
           exit;
        end;
      end;

      xSQL:='UPDATE CNT401 '+
            'SET DEBEMN'+xmes+'=0, '+
            '    HABEMN'+xmes+'=0, '+
            '    DEBEME'+xmes+'=0, '+
            '    HABEME'+xmes+'=0, '+
            '    SALDMN'+xmes+'=0, '+
            '    SALDME'+xmes+'=0 '+
            '    WHERE CIAID='+QuotedStr(dblcCia.Text)+' AND ANO='+quotedstr(xAno);
      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      try
        DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
        DMCNT.DCOM1.AppServer.GrabaTransaccion;
      except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
      end;

      if not SOLConta(dblcCia.Text, '', xAno+xMes, '',
             SRV_D, 'M', DMCNT.wModulo, DMCNT.cdsMovCNT1, DMCNT.cdsNivel,
             DMCNT.cdsResultSet, DMCNT.DCOM1, Self ) then
      begin
         ShowMessage( 'Error en Mayorización' );
         exit;
      end;
   end;

   Screen.Cursor:=crDefault;
   ShowMessage('Grabación Exitosa');

   //   GeneraEnLinea401 ;
end;


procedure TFActualizacion.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then
      edtCia.Text:=DMCNT.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía') ;
      dblcCia.SetFocus ;
   end ;
end ;

procedure TFActualizacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key:=#0 ;
      perform(CM_DialogKey,VK_TAB,0) ;
   end ;
end ;


procedure TFActualizacion.ValidacionPrevia;
begin
   if false then
   begin
      showmessage('Mensaje de error') ;
      Raise Exception.Create('Mensaje de error') ;
   end ;
end;

procedure TFActualizacion.FormShow(Sender: TObject);
var
   xAno, xMes, xDia: Word;
begin
  DecodeDate(Date, xAno, xMes, xDia);
  speAno.Value:=xAno;
  speMM.Value :=xMes;
  FVariables.ConfiguraForma( Self );
end;

procedure TFActualizacion.dblcdCuentaEnter(Sender: TObject);
var
   sSQL : String;
begin
   DMCNT.cdsCuenta.Close;
   DMCNT.cdsCuenta.PacketRecords:=100;
   DMCNT.cdsCuenta.FetchOnDemand:=False;

   sSQL:='Select CUENTAID, CTADES, CIAID, CTA_MOV '
        +'From TGE202 Where CIAID='+QuotedStr(dblcCia.text);
   DMCNT.cdsCuenta.DataRequest(sSQL);
   DMCNT.cdsCuenta.Open;
   DMCNT.cdsCuenta.FetchOnDemand:=True;
   DMCNT.cdsCuenta.IndexFieldNames := 'CUENTAID';
end;

procedure TFActualizacion.dblcdCuentaExit(Sender: TObject);
begin
   if (bbtnCanc.Focused)  then Exit;
   if dblcdCuenta.Text='' then Exit;

   if DMCNT.cdsCuenta.IndexFieldNames<>'CUENTAID' then
      DMCNT.cdsCuenta.IndexFieldNames:='CUENTAID';

   DMCNT.cdsCuenta.SetKey;
   DMCNT.cdsCuenta.FieldByName('CUENTAID').Asstring:=trim(dblcdCuenta.Text);
   DMCNT.cdsCuenta.GotoKey;

   edtCuenta.Text:='';
   edtCuenta.Text:=DMCNT.cdsCuenta.FieldByName('CTADES').AsString;

   if length(edtCuenta.Text)=0 then
   begin
      ShowMessage('Ingrese Cuenta Contable');
      dblcdCuenta.SetFocus;
      exit;
   end;

end;

procedure TFActualizacion.BitBtn1Click(Sender: TObject);
var
   xMes, xAno, xSQL : String;
begin
   ValidacionPrevia ;

   if MessageDlg( ' Confirme Actualización ',mtConfirmation,[mbYes, mbNo],0) = mrYes then

   Screen.Cursor:=crHourGlass;

   if length(speMM.text)=1 then
      xmes:='0'+speMM.text
   else
      xmes:=copy(speMM.text,1,2);

   xAno:=speAno.text;

   if dblcdCuenta.Text<>'' then begin

      xSQL:='UPDATE CNT401 SET DEBEMN'+xmes+'=0, HABEMN'+xmes+'=0, '
           +                  'DEBEME'+xmes+'=0, HABEME'+xmes+'=0, '
           +                  'SALDMN'+xmes+'=0, SALDME'+xmes+'=0 '
           +'WHERE CIAID='+QuotedStr(dblcCia.Text)+' AND ANO='+quotedstr(xAno)
           + ' and CUENTAID='''+dblcdCuenta.Text+''' '
           + ' and ( TIPREG=''2'' or TIPREG=''3'' or TIPREG=''4'' )'  ;
      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      try
        DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
        DMCNT.DCOM1.AppServer.GrabaTransaccion;
      except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
      end;

      if not SOLConta(dblcCia.Text, '', xAno+xMes, dblcdCuenta.Text,
             SRV_D, 'MC', DMCNT.wModulo, DMCNT.cdsMovCNT1, DMCNT.cdsNivel,
             DMCNT.cdsResultSet, DMCNT.DCOM1, Self ) then
      begin
         ShowMessage( 'Error en Mayorización' );
      end;
   end
   else begin
      xSQL:='UPDATE CNT401 SET DEBEMN'+xmes+'=0, HABEMN'+xmes+'=0, '
           +                  'DEBEME'+xmes+'=0, HABEME'+xmes+'=0, '
           +                  'SALDMN'+xmes+'=0, SALDME'+xmes+'=0 '
           +'WHERE CIAID='+QuotedStr(dblcCia.Text)+' AND ANO='+quotedstr(xAno)
           + ' and ( TIPREG=''2'' or TIPREG=''3'' or TIPREG=''4'' )'  ;
      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      try
        DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
        DMCNT.DCOM1.AppServer.GrabaTransaccion;
      except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
      end;

      if not SOLConta(dblcCia.Text, '', xAno+xMes, '',
             SRV_D, 'MCACC', DMCNT.wModulo, DMCNT.cdsMovCNT1, DMCNT.cdsNivel,
             DMCNT.cdsResultSet, DMCNT.DCOM1, Self ) then
      begin
         ShowMessage( 'Error en Mayorización' );
      end;
   end;

   Screen.Cursor:=crDefault;
   ShowMessage('Grabación Exitosa');

   //   GeneraEnLinea401 ;
end;

end.
