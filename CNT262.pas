unit CNT262;

// Actualizaciones
// HPC_201501_CNT          12/02/2015  Regulariza Métodos Correctos de Control Transaccional

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls;

type
  TFToolPlanCta = class(TForm)
    pnlImprime: TPanel;
    sbtnImprime: TSpeedButton;
    BitBtn1: TBitBtn;
    bbtnDet: TBitBtn;
    bbtnCtaMov: TBitBtn;
    procedure sbtnImprimeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bbtnDetClick(Sender: TObject);
    procedure bbtnCtaMovClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolPlanCta: TFToolPlanCta;

implementation

uses CNT261, CNTDM, oaCN1000, SOLRef01;

{$R *.DFM}

procedure TFToolPlanCta.sbtnImprimeClick(Sender: TObject);
begin
  FImpPlanCta:=TFImpPlanCta.Create(Self);
  try
    FImpPlanCta.ShowModal;
  finally
    FImpPlanCta.free;
  end;
end;

procedure TFToolPlanCta.BitBtn1Click(Sender: TObject);
var
   xSQL : String;
begin
   xSQL:='Select CIAID, CUENTAID, CTAACT from TGE202 '
        +'Where CIAID='''   +FParametros.Mantc.FMant.cds2.FieldByName('CIAID').AsString   +''' '
        +  'AND CUENTAID='''+FParametros.Mantc.FMant.cds2.FieldByName('CUENTAID').AsString+'''';
   DMCNT.cdsCuenta.Close;
   DMCNT.cdsCuenta.DataRequest( xSQL );
   DMCNT.cdsCuenta.Open;

   if DMCNT.cdsCuenta.FieldByName('CTAACT').AsString='N' then
   begin
      if MessageDlg('Cuenta Contable esta INACTIVA '+chr(13)+chr(13)+
                 '     ¿ Desea Activar ?     ',mtConfirmation,[mbYes, mbNo],0)<>mrYes
      then exit;

      xSQL:='Update TGE202 set CTAACT=''S'' '
           +'WHERE CIAID='''   +FParametros.Mantc.FMant.cds2.FieldByName('CIAID').AsString   +''' '
           +  'AND CUENTAID='''+FParametros.Mantc.FMant.cds2.FieldByName('CUENTAID').AsString+'''';
      FParametros.Mantc.FMant.cds2.Edit;
      FParametros.Mantc.FMant.cds2.FieldByname('CTAACT').AsString:='S';
      FParametros.Mantc.FMant.cds2.Post;
   end
   else
   begin
      if MessageDlg('Cuenta Contable ACTIVA '+chr(13)+chr(13)+
                 '    ¿ Desea dar de Baja ?     ',mtConfirmation,[mbYes, mbNo],0)<>mrYes
      then exit;

      xSQL:='Update TGE202 set CTAACT=''N'' '
           +'WHERE CIAID='''   +FParametros.Mantc.FMant.cds2.FieldByName('CIAID').AsString   +''' '
           +  'AND CUENTAID='''+FParametros.Mantc.FMant.cds2.FieldByName('CUENTAID').AsString+'''';

      FParametros.Mantc.FMant.cds2.Edit;
      FParametros.Mantc.FMant.cds2.FieldByname('CTAACT').AsString:='N';
      FParametros.Mantc.FMant.cds2.Post;
   end;

   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
      DMCNT.cdsCuenta2.Close;
      DMCNT.cdsCuenta2.DataRequest(xSQL);
      DMCNT.cdsCuenta2.Execute;
      DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
   // Inicio HPC_201501_CNT
      //DMCNT.DCOM1.AppServer.RegresaTransaccion;
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   // Fin HPC_201501_CNT
   end;

   ShowMessage('Ok');
end;

procedure TFToolPlanCta.bbtnDetClick(Sender: TObject);
var
   xSQL : String;
begin
   xSQL:='Select CIAID, CUENTAID, CTAACT, CTA_DET from TGE202 '
        +'Where CIAID='''   +FParametros.Mantc.FMant.cds2.FieldByName('CIAID').AsString   +''' '
        +  'AND CUENTAID='''+FParametros.Mantc.FMant.cds2.FieldByName('CUENTAID').AsString+'''';
   DMCNT.cdsCuenta.Close;
   DMCNT.cdsCuenta.DataRequest( xSQL );
   DMCNT.cdsCuenta.Open;

   if DMCNT.cdsCuenta.FieldByName('CTA_DET').AsString='N' then
   begin
      if MessageDlg('Cuenta Contable NO es de detalle '+chr(13)+chr(13)+
                 '     ¿ Desea que sea de detalle ?     ',mtConfirmation,[mbYes, mbNo],0)<>mrYes
      then exit;

      xSQL:='Update TGE202 set CTA_DET=''S'' '
           +'WHERE CIAID='''   +FParametros.Mantc.FMant.cds2.FieldByName('CIAID').AsString   +''' '
           +  'AND CUENTAID='''+FParametros.Mantc.FMant.cds2.FieldByName('CUENTAID').AsString+'''';
      FParametros.Mantc.FMant.cds2.Edit;
      FParametros.Mantc.FMant.cds2.FieldByname('CTA_DET').AsString:='S';
      FParametros.Mantc.FMant.cds2.Post;
   end
   else
   begin
      if MessageDlg('Cuenta Contable es de Detalle '+chr(13)+chr(13)+
                 '    ¿ Desea que no sea de detalle ?     ',mtConfirmation,[mbYes, mbNo],0)<>mrYes
      then exit;

      xSQL:='Update TGE202 set CTA_DET=''N'' '
           +'WHERE CIAID='''   +FParametros.Mantc.FMant.cds2.FieldByName('CIAID').AsString   +''' '
           +  'AND CUENTAID='''+FParametros.Mantc.FMant.cds2.FieldByName('CUENTAID').AsString+'''';

      FParametros.Mantc.FMant.cds2.Edit;
      FParametros.Mantc.FMant.cds2.FieldByname('CTA_DET').AsString:='N';
      FParametros.Mantc.FMant.cds2.Post;
   end;

   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
      DMCNT.cdsCuenta2.Close;
      DMCNT.cdsCuenta2.DataRequest(xSQL);
      DMCNT.cdsCuenta2.Execute;
      DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
   // Inicio HPC_201501_CNT
      //DMCNT.DCOM1.AppServer.RegresaTransaccion;
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   // Fin HPC_201501_CNT
   end;

   ShowMessage('Ok');
end;

procedure TFToolPlanCta.bbtnCtaMovClick(Sender: TObject);
var
   xSQL : String;
begin
   xSQL:='Select CIAID, CUENTAID, CTAACT, CTA_MOV from TGE202 '
        +'Where CIAID='''   +FParametros.Mantc.FMant.cds2.FieldByName('CIAID').AsString   +''' '
        +  'AND CUENTAID='''+FParametros.Mantc.FMant.cds2.FieldByName('CUENTAID').AsString+'''';
   DMCNT.cdsCuenta.Close;
   DMCNT.cdsCuenta.DataRequest( xSQL );
   DMCNT.cdsCuenta.Open;

   if DMCNT.cdsCuenta.FieldByName('CTA_MOV').AsString='N' then
   begin
      if MessageDlg('Cuenta Contable NO es de Movimiento '+chr(13)+chr(13)+
                 '     ¿ Desea que sea de Movimiento ?     ',mtConfirmation,[mbYes, mbNo],0)<>mrYes
      then exit;

      xSQL:='Update TGE202 set CTA_MOV=''S'' '
           +'WHERE CIAID='''   +FParametros.Mantc.FMant.cds2.FieldByName('CIAID').AsString   +''' '
           +  'AND CUENTAID='''+FParametros.Mantc.FMant.cds2.FieldByName('CUENTAID').AsString+'''';
      FParametros.Mantc.FMant.cds2.Edit;
      FParametros.Mantc.FMant.cds2.FieldByname('CTA_MOV').AsString:='S';
      FParametros.Mantc.FMant.cds2.Post;
   end
   else
   begin
      if MessageDlg('Cuenta Contable es de Movimiento '+chr(13)+chr(13)+
                 '    ¿ Desea que no sea de Movimiento ?     ',mtConfirmation,[mbYes, mbNo],0)<>mrYes
      then exit;

      xSQL:='Update TGE202 set CTA_MOV=''N'' '
           +'WHERE CIAID='''   +FParametros.Mantc.FMant.cds2.FieldByName('CIAID').AsString   +''' '
           +  'AND CUENTAID='''+FParametros.Mantc.FMant.cds2.FieldByName('CUENTAID').AsString+'''';

      FParametros.Mantc.FMant.cds2.Edit;
      FParametros.Mantc.FMant.cds2.FieldByname('CTA_MOV').AsString:='N';
      FParametros.Mantc.FMant.cds2.Post;
   end;

   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
      DMCNT.cdsCuenta2.Close;
      DMCNT.cdsCuenta2.DataRequest(xSQL);
      DMCNT.cdsCuenta2.Execute;
      DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
   // Inicio HPC_201501_CNT
      //DMCNT.DCOM1.AppServer.RegresaTransaccion;
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   // Fin HPC_201501_CNT
   end;

   ShowMessage('Ok');

end;

end.
