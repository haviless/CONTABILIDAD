unit CNT280;

// Actualizaciones
// HPC_201602_CNT DAF_2016001104_CNT_1 02/08/2016 Añade Columna HABER a Grid de Detalle
//                           Incluye Totales a DEBE y HABER

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Wwdatsrc, DBClient, wwclient, Grids,
  Wwdbigrd, Wwdbgrid, Mask, ExtCtrls;

type
  TFPlanilla = class(TForm)
    dbgCab: TwwDBGrid;
    dbgDet: TwwDBGrid;
    cdsPlanilla: TwwClientDataSet;
    dsPlanilla: TwwDataSource;
    BitBtn8: TBitBtn;
    BitBtn10: TBitBtn;
    cdsPlanDet: TwwClientDataSet;
    dsPlanDet: TwwDataSource;
    BitBtn9: TBitBtn;
    BitBtn11: TBitBtn;
    sdGraba300: TSaveDialog;
    sdGraba301: TSaveDialog;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    meRegCab: TMaskEdit;
    meRegDet: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlanilla: TFPlanilla;

implementation

{$R *.dfm}

USES CNTDM;

procedure TFPlanilla.BitBtn8Click(Sender: TObject);
begin
   if not sdGraba300.Execute then Exit;

   try
      cdsPlanilla.LoadFromFile( sdGraba300.FileName );
      meRegCab.Text:= IntToStr(cdsPlanilla.RecordCount);
   except
      ShowMessage('Error : Al Leer Archivo, Verificar si es el Correcto');
      Exit;
   end;

end;

procedure TFPlanilla.BitBtn9Click(Sender: TObject);
// Inicio HPC_201602_CNT
// Incluye Totales a DEBE y HABER
var
   xTotDebe, xTotHaber : Currency;
// Fin HPC_201602_CNT
begin
   if not sdGraba301.Execute then Exit;

   try
      cdsPlanDet.LoadFromFile( sdGraba301.FileName );
      meRegDet.Text:= IntToStr(cdsPlanDet.RecordCount);

// Inicio HPC_201602_CNT
// Incluye Totales a DEBE y HABER
   dbgDet.ColumnByName('CNTDEBEMN').FooterValue := '0.00';
   dbgDet.ColumnByName('CNTHABEMN').FooterValue := '0.00';
   xTotDebe  := 0;
   xTotHaber := 0;
   cdsPlanDet.DisableControls;
   cdsPlanDet.First;
   While Not cdsPlanDet.eof Do
   Begin
      xTotDebe  := xTotDebe  + cdsPlanDet.FieldByName('CNTDEBEMN').AsFloat;
      xTotHaber := xTotHaber + cdsPlanDet.FieldByName('CNTHABEMN').AsFloat;
      cdsPlanDet.Next;
   End;
   cdsPlanDet.First;
   cdsPlanDet.EnableControls;

   TNumericField(cdsPlanDet.FieldByName('CNTDEBEMN')).DisplayFormat := '###,###,##0.00';
   TNumericField(cdsPlanDet.FieldByName('CNTHABEMN')).DisplayFormat := '###,###,##0.00';

   dbgDet.ColumnByName('CNTDEBEMN').FooterValue := FormatFloat('###,###,##0.00', xTotDebe);
   dbgDet.ColumnByName('CNTHABEMN').FooterValue := FormatFloat('###,###,##0.00', xTotHaber);
   dbgDet.RefreshDisplay;
// Fin HPC_201602_CNT

   except
      ShowMessage('Error : Al Leer Archivo, Verificar si es el Correcto');
      Exit;
   end;
end;

procedure TFPlanilla.BitBtn10Click(Sender: TObject);
var
   xSQL, cAM, cCia, cTD, cCo : String;
begin
   if sdGraba300.FileName='' then
   begin
      ShowMessage('Error : Falta Seleccionar Archivo a Tranferir');
      Exit;
   end;

   if not FileExists( sdGraba300.FileName ) then
   begin
      ShowMessage('Error : Archivo Seleccionado No Existe ( '+sdGraba300.FileName+' ) ');
      Exit;
   end;

   try
      cdsPlanilla.LoadFromFile( sdGraba300.FileName );
   except
      ShowMessage('Error : Al Leer Archivo, Verificar si es el Correcto');
      Exit;
   end;

   cdsPlanilla.First;
   while not cdsPlanilla.Eof do
   begin
      cCia:=cdsPlanilla.FieldByName('CIAID').AsString;
      cAM :=cdsPlanilla.FieldByName('CNTANOMM').AsString;

      xSql:='SELECT * FROM TGE154 '
           +'WHERE CIAID='''+cCia+''' AND ANO='+quotedstr(Copy(cAM,1,4));
      DMCNT.cdsCierres.close;
      DMCNT.cdsCierres.datarequest(xsql);
      DMCNT.cdsCierres.open;
      if DMCNT.cdsCierres.FieldByName('PER'+Copy(cAM,5,2)).AsString = 'S' then
      begin
         Showmessage('El periodo se encuentra Cerrado'+chr(13)+chr(13)
                    +' Compañía : '+cCia+chr(13)
                    +' Periodo  : '+cAM );
         exit;
      end;
      cdsPlanilla.Next;
   end;


   cdsPlanilla.First;
   while not cdsPlanilla.Eof do
   begin
      cCia:=cdsPlanilla.FieldByName('CIAID').AsString;
      cAM :=cdsPlanilla.FieldByName('CNTANOMM').AsString;
      cTD :=cdsPlanilla.FieldByName('TDIARID').AsString;
      cCo :=cdsPlanilla.FieldByName('CNTCOMPROB').AsString;

      xSql:='SELECT * FROM CNT300 '
           +'WHERE CIAID='''  +cCia+''' AND CNTANOMM='''  +cAM+''' '
           + ' and TDIARID='''+cTD +''' AND CNTCOMPROB='''+cCo+'''';
      DMCNT.cdsCierres.close;
      DMCNT.cdsCierres.datarequest(xsql);
      DMCNT.cdsCierres.open;
      if DMCNT.cdsCierres.RecordCount>0 then
      begin
         Showmessage('Comprobante Existe en Contabilidad (Cabecera)'+chr(13)+chr(13)
                    +' Compañía   : '+cCia+chr(13)
                    +' Periodo    : '+cAM +chr(13)
                    +' Origen     : '+cTD +chr(13)
                    +' Comprobante: '+cCo );
         exit;
      end;
      cdsPlanilla.Next;
   end;


   if MessageDlg('Transferir los Asientos de Archivo (Cabecera).'+chr(13)
//                +'      Se eliminarán asientos generados anteriormente, '+chr(13)+chr(13)
                +'                        ¿ Esta Seguro ?    ',mtConfirmation, [mbYes, mbNo], 0)<>mrYes then
                  exit;
   {
   xSQL:='Delete from CNT300 '
        +'Where CIAID>=''02'' '
        +  'and TDIARID=''' +cdsPlanilla.FieldByName('TDIARID').AsString  +''' '
        +  'and CNTANOMM='''+cdsPlanilla.FieldByName('CNTANOMM').AsString +''' '
        +  'and MODULO  ='''+cdsPlanilla.FieldByName('MODULO').AsString   +'''';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest( xSQL );
   DMCNT.cdsQry.Execute;
   }
   cdsPlanilla.First;
   while not cdsPlanilla.Eof do
   begin
      xSQL:='Insert into CNT300 '
           +'Values ( '
           +   ''''+cdsPlanilla.FieldByName('CIAID').AsString      +''', '
           +   ''''+cdsPlanilla.FieldByName('TDIARID').AsString    +''', '
           +   ''''+cdsPlanilla.FieldByName('CNTCOMPROB').AsString +''', '
           +   ''''+cdsPlanilla.FieldByName('CNTANOMM').AsString   +''', '
           +   ''''+cdsPlanilla.FieldByName('CNTLOTE').AsString    +''', '
           +   ''''+cdsPlanilla.FieldByName('CNTGLOSA').AsString   +''', '
           +   cdsPlanilla.FieldByName('CNTTCAMBIO').AsString      +', '
           +   ''''+cdsPlanilla.FieldByName('CNTFCOMP').AsString   +''', '
           +   '''I'', '
           +   '''N'', '
           +   '''N'', '
           +   ''''+cdsPlanilla.FieldByName('CNTUSER').AsString    +''', '
           +   ''''+cdsPlanilla.FieldByName('CNTFREG').AsString    +''', '
           +   'sysdate, '
           +   ''''+cdsPlanilla.FieldByName('CNTANO').AsString     +''', '
           +   ''''+cdsPlanilla.FieldByName('CNTMM').AsString      +''', '
           +   ''''+cdsPlanilla.FieldByName('CNTDD').AsString      +''', '
           +   ''''+cdsPlanilla.FieldByName('CNTTRI').AsString     +''', '
           +   ''''+cdsPlanilla.FieldByName('CNTSEM').AsString     +''', '
           +   ''''+cdsPlanilla.FieldByName('CNTSS').AsString      +''', '
           +   ''''+cdsPlanilla.FieldByName('CNTAATRI').AsString   +''', '
           +   ''''+cdsPlanilla.FieldByName('CNTAASEM').AsString   +''', '
           +   ''''+cdsPlanilla.FieldByName('CNTAASS').AsString    +''', '
           +   ''''+cdsPlanilla.FieldByName('TMONID').AsString     +''', '
           +   ''''+cdsPlanilla.FieldByName('FLAGVAR').AsString    +''', '
           +   ''''+cdsPlanilla.FieldByName('FCONS').AsString      +''', '
           +   ''''+cdsPlanilla.FieldByName('CNTFMEC').AsString    +''', '
           +   ''''+cdsPlanilla.FieldByName('TDIARDES').AsString   +''', '
           +   cdsPlanilla.FieldByName('CNTDEBEMN').AsString       +', '
           +   cdsPlanilla.FieldByName('CNTDEBEME').AsString       +', '
           +   cdsPlanilla.FieldByName('CNTHABEMN').AsString       +', '
           +   cdsPlanilla.FieldByName('CNTHABEME').AsString       +', '
           +   FloatToStr(cdsPlanilla.FieldByName('CNTSALDMN').AsFloat)  +', '
           +   FloatToStr(cdsPlanilla.FieldByName('CNTSALDME').AsFloat)  +', '
           +   ''''+cdsPlanilla.FieldByName('CNTTS').AsString     +''', '
           +   ''''+cdsPlanilla.FieldByName('DOCMOD').AsString     +''', '
           +   ''''+cdsPlanilla.FieldByName('MODULO').AsString     +''' '
           +' ) ';

      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest( xSQL );
      DMCNT.cdsQry.Execute;
      cdsPlanilla.Next;
   end;
   ShowMessage('ok');
end;

procedure TFPlanilla.BitBtn11Click(Sender: TObject);
var
   xSQL, cCia, cAM, cTD, cCo : String;
begin
   if sdGraba301.FileName='' then
   begin
      ShowMessage('Error : Falta Seleccionar Archivo a Tranferir');
      Exit;
   end;

   if not FileExists( sdGraba301.FileName ) then
   begin
      ShowMessage('Error : Archivo Seleccionado No Existe ( '+sdGraba301.FileName+' ) ');
      Exit;
   end;

   try
      cdsPlanDet.LoadFromFile( sdGraba301.FileName );
   except
      ShowMessage('Error : Al Leer Archivo, Verificar si es el Correcto');
      Exit;
   end;

   cCia:='';
   cAM :='';
   cdsPlanDet.First;
   while not cdsPlanDet.Eof do
   begin

      if (cCia<>cdsPlanDet.FieldByName('CIAID').AsString) or
         (cAM <>cdsPlanDet.FieldByName('CNTANOMM').AsString) then
      begin
         cCia:=cdsPlanDet.FieldByName('CIAID').AsString;
         cAM :=cdsPlanDet.FieldByName('CNTANOMM').AsString;

         xSql:='SELECT * FROM TGE154 '
              +'WHERE CIAID='''+cCia+''' AND ANO='+quotedstr(Copy(cAM,1,4));
         DMCNT.cdsCierres.close;
         DMCNT.cdsCierres.datarequest(xsql);
         DMCNT.cdsCierres.open;
         if DMCNT.cdsCierres.FieldByName('PER'+Copy(cAM,5,2)).AsString = 'S' then
         begin
            Showmessage('El periodo se encuentra Cerrado'+chr(13)+chr(13)
                       +' Compañía : '+cCia+chr(13)
                       +' Periodo  : '+cAM );
            exit;
         end;
      end;
      cdsPlanDet.Next;
   end;

   cCia:='';
   cAM :='';
   cTD :='';
   cCo :='';
   cdsPlanDet.First;
   while not cdsPlanDet.Eof do
   begin

      if (cCia<>cdsPlanDet.FieldByName('CIAID').AsString     )  or
         (cAM <>cdsPlanDet.FieldByName('CNTANOMM').AsString  ) or
         (cTD <>cdsPlanDet.FieldByName('TDIARID').AsString   ) or
         (cCo <>cdsPlanDet.FieldByName('CNTCOMPROB').AsString) then
      begin
         cCia:=cdsPlanDet.FieldByName('CIAID').AsString;
         cAM :=cdsPlanDet.FieldByName('CNTANOMM').AsString;
         cTD :=cdsPlanDet.FieldByName('TDIARID').AsString;
         cCo :=cdsPlanDet.FieldByName('CNTCOMPROB').AsString;

         xSql:='SELECT * FROM CNT301 '
              +'WHERE CIAID='''  +cCia+''' AND CNTANOMM='''  +cAM+''' '
              + ' and TDIARID='''+cTD +''' AND CNTCOMPROB='''+cCo+'''';
         DMCNT.cdsCierres.close;
         DMCNT.cdsCierres.datarequest(xsql);
         DMCNT.cdsCierres.open;
         if DMCNT.cdsCierres.RecordCount>0 then
         begin
            Showmessage('Comprobante Existe en Contabilidad Aceptado (Detalle)'+chr(13)+chr(13)
                       +' Compañía   : '+cCia+chr(13)
                       +' Periodo    : '+cAM +chr(13)
                       +' Origen     : '+cTD +chr(13)
                       +' Comprobante: '+cCo );
            exit;
         end;
         xSql:='SELECT * FROM CNT311 '
              +'WHERE CIAID='''  +cCia+''' AND CNTANOMM='''  +cAM+''' '
              + ' and TDIARID='''+cTD +''' AND CNTCOMPROB='''+cCo+'''';
         DMCNT.cdsCierres.close;
         DMCNT.cdsCierres.datarequest(xsql);
         DMCNT.cdsCierres.open;
         if DMCNT.cdsCierres.RecordCount>0 then
         begin
            Showmessage('Comprobante Existe en Contabilidad Estado Inicial (Detalle)'+chr(13)+chr(13)
                       +' Compañía   : '+cCia+chr(13)
                       +' Periodo    : '+cAM +chr(13)
                       +' Origen     : '+cTD +chr(13)
                       +' Comprobante: '+cCo );
            exit;
         end;
      end;
      cdsPlanDet.Next;
   end;


   if MessageDlg('Transferir los Asientos de Archivo (Detalle).'+chr(13)
//                +'      Se eliminarán asientos generados anteriormente, '+chr(13)+chr(13)
                +'          ¿ Esta Seguro ?    ',mtConfirmation, [mbYes, mbNo], 0)<>mrYes then
                  exit;
   {
   xSQL:='Delete from CNT311 '
        +'Where CIAID>=''02'' '
        +  'and TDIARID=''' +cdsPlanDet.FieldByName('TDIARID').AsString  +''' '
        +  'and CNTANOMM='''+cdsPlanDet.FieldByName('CNTANOMM').AsString +''' '
        +  'and MODULO  ='''+cdsPlanDet.FieldByName('MODULO').AsString   +'''';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest( xSQL );
   DMCNT.cdsQry.Execute;

   xSQL:='Delete from CNT301 '
        +'Where CIAID>=''02'' '
        +  'and TDIARID=''' +cdsPlanDet.FieldByName('TDIARID').AsString  +''' '
        +  'and CNTANOMM='''+cdsPlanDet.FieldByName('CNTANOMM').AsString +''' '
        +  'and MODULO  ='''+cdsPlanDet.FieldByName('MODULO').AsString   +'''';
   DMCNT.cdsQry.Close;
   DMCNT.cdsQry.DataRequest( xSQL );
   DMCNT.cdsQry.Execute;
   }
   cdsPlanDet.First;
   while not cdsPlanDet.Eof do
   begin
      xSQL:='Insert into CNT311 '
           +'Values ( '
           +   ''''+cdsPlanDet.FieldByName('CIAID').AsString      +''', '
           +   ''''+cdsPlanDet.FieldByName('TDIARID').AsString    +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTCOMPROB').AsString +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTANO').AsString     +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTANOMM').AsString   +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTLOTE').AsString    +''', '
           +   ''''+cdsPlanDet.FieldByName('CUENTAID').AsString   +''', '
           +   ''''+cdsPlanDet.FieldByName('CLAUXID').AsString    +''', '
           +   ''''+cdsPlanDet.FieldByName('AUXID').AsString      +''', '
           +   ''''+cdsPlanDet.FieldByName('DOCID').AsString      +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTSERIE').AsString   +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTNODOC').AsString   +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTGLOSA').AsString   +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTDH').AsString      +''', '
           +   ''''+cdsPlanDet.FieldByName('CCOSID').AsString     +''', '
           +   cdsPlanDet.FieldByName('CNTTCAMBIO').AsString      +', '
           +   cdsPlanDet.FieldByName('CNTMTOORI').AsString       +', '
           +   cdsPlanDet.FieldByName('CNTMTOLOC').AsString       +', '
           +   cdsPlanDet.FieldByName('CNTMTOEXT').AsString       +', '
           +   ''''+cdsPlanDet.FieldByName('CNTFEMIS').AsString   +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTFVCMTO').AsString  +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTFCOMP').AsString   +''', '
           +   '''I'', '
           +   '''N'', '
           +   '''N'', '
           +   ''''+cdsPlanDet.FieldByName('CNTUSER').AsString    +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTFREG').AsString    +''', '
           +   'sysdate, '
           +   ''''+cdsPlanDet.FieldByName('CNTMM').AsString      +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTDD').AsString      +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTTRI').AsString     +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTSEM').AsString     +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTSS').AsString      +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTAATRI').AsString   +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTAASEM').AsString   +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTAASS').AsString    +''', '
           +   ''''+cdsPlanDet.FieldByName('TMONID').AsString     +''', '
           +   ''''+cdsPlanDet.FieldByName('FLAGVAR').AsString    +''', '
           +   ''''+cdsPlanDet.FieldByName('FCONS').AsString      +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTFMEC').AsString    +''', '
           +   ''''+cdsPlanDet.FieldByName('TDIARDES').AsString   +''', '
           +   ''''+cdsPlanDet.FieldByName('CTADES').AsString     +''', '
           +   ''''+cdsPlanDet.FieldByName('AUXDES').AsString     +''', '
           +   ''''+cdsPlanDet.FieldByName('DOCDES').AsString     +''', '
           +   ''''+cdsPlanDet.FieldByName('CCOSDES').AsString    +''', '
           +   cdsPlanDet.FieldByName('CNTDEBEMN').AsString       +', '
           +   cdsPlanDet.FieldByName('CNTDEBEME').AsString       +', '
           +   cdsPlanDet.FieldByName('CNTHABEMN').AsString       +', '
           +   cdsPlanDet.FieldByName('CNTHABEME').AsString       +', '
           +   FloatToStr(cdsPlanDet.FieldByName('CNTSALDMN').AsFloat)  +', '
           +   FloatToStr(cdsPlanDet.FieldByName('CNTSALDME').AsFloat)  +', '
           +   ''''+cdsPlanDet.FieldByName('CAMPOVAR').AsString   +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTTS').AsString      +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTPAGADO').AsString  +''', '
           +   ''''+cdsPlanDet.FieldByName('CNTMODDOC').AsString  +''', '
           +   cdsPlanDet.FieldByName('CNTREG').AsString          +', '
           +   ''''+cdsPlanDet.FieldByName('MODULO').AsString     +''', '
           +   ''''+cdsPlanDet.FieldByName('CTA_SECU').AsString   +''' '
           +' ) ';

      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest( xSQL );
      try
      DMCNT.cdsQry.Execute;
      except
         ShowMessage('Error : al Transferir. Revisar Archivo de Planilla');
         Exit;
      end;
      cdsPlanDet.Next;
   end;
   ShowMessage('ok');
end;

end.
