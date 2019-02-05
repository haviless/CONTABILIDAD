unit CNT801;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ppVar, ppCtrls,
  ppPrnabl, ppClass, ppBands, ppProd, ppReport, ppComm, ppRelatv, ppCache,
  ppDB, ppDBPipe, ExtCtrls;

type
  TFVerificaPlan = class(TForm)
    bbtnVerifica: TBitBtn;
    wwDBGrid1: TwwDBGrid;
    pbarCuenta: TProgressBar;
    ppdbCtasObservadas: TppDBPipeline;
    pprCtasObservadas: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    BitBtn1: TBitBtn;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    gbRango: TGroupBox;
    dbgTablas: TwwDBGrid;
    Memo1: TMemo;
    rgEscoger: TRadioGroup;
    btnVerifiva: TButton;
    procedure bbtnVerificaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgEscogerClick(Sender: TObject);
    procedure btnVerifivaClick(Sender: TObject);
  private
		{ Private declarations }
    Procedure ProcesaTGE202;		
  public
    { Public declarations }
  end;

var
  FVerificaPlan: TFVerificaPlan;

implementation

uses CNTDM;

{$R *.DFM}

procedure TFVerificaPlan.bbtnVerificaClick(Sender: TObject);
var
   xSQL, xEs, xDebeSer, xFlagDet, xFlagMov, xCuenta : string;
   xError,Bandera : Boolean;
   xAdic,xwhere  : string;
begin
// Para Observaciones
   
   xSQL := 'Select CIAID,CUENTAID,''@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'' OBSER from TGE202 where CIAID=''8888'' ';
   DM1.cdsCuenta2.Close;
   DM1.cdsCuenta2.IndexFieldNames:='';
   DM1.cdsCuenta2.Filter:='';
   DM1.cdsCuenta2.DataRequest(xSQL);
   DM1.cdsCuenta2.Open;
// Para Búsqueda
   xSQL := 'Select * from TGE202';
   DM1.cdsCuenta3.Close;
   DM1.cdsCuenta3.IndexFieldNames:='';
   DM1.cdsCuenta3.Filter:='';
   DM1.cdsCuenta3.DataRequest(xSQL);
   DM1.cdsCuenta3.Open;
   DM1.cdsCuenta3.IndexFieldNames:='CIAID;CUENTAID';
// Para Verificar
   xSQL := 'Select * from TGE202';
   DM1.cdsCuenta.Close;
   DM1.cdsCuenta.IndexFieldNames:='';
   DM1.cdsCuenta.Filter:='';
   DM1.cdsCuenta.DataRequest(xSQL);
   DM1.cdsCuenta.Open;
   DM1.cdsCuenta.IndexFieldNames:='CIAID;CUENTAID';

   pbarCuenta.Max := DM1.cdsCuenta.RecordCount;

   DM1.cdsCuenta.First;
   pbarCuenta.Position:=0;
   
   while not DM1.cdsCuenta.EOF do
   begin
      pbarCuenta.Position:=pbarCuenta.Position+1;
   // pregunta si Es de Destino y de Movimientos a la misma vez
      if (DM1.cdsCuenta.FieldByName('CTA_DEST').AsString='S') and (DM1.cdsCuenta.FieldByName('CTA_MOV').AsString='S') then
      begin
         DM1.cdsCuenta2.Append;
         DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
         DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
         DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Incompatibilidad entre Movim. y Destino';
      end;

   // pregunta si Es de Destino y a la vez Tiene Cuentas de Destino
      if (DM1.cdsCuenta.FieldByName('CTA_DEST').AsString='S') and (DM1.cdsCuenta.fieldbyname('CTA_AUT1').AsString = 'S') then
      begin
         DM1.cdsCuenta2.Append;
         DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
         DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
         DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Incompatibilidad Ctas Destino y Flag Destino';
      end;

   // Verifica Cuenta Automática 1
      if (DM1.cdsCuenta.fieldbyname('CTA_AUT1').AsString = 'S') and (trimright(trimleft(DM1.cdsCuenta.fieldbyname('CTAAUT1').AsString)) = '') then
      begin
         DM1.cdsCuenta2.Append;
         DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
         DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
         DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Cuenta Automática 1 mal definida';
      end;

   // Verifica Cuenta Automática 2
      if (DM1.cdsCuenta.fieldbyname('CTA_AUT2').AsString = 'S') and (trimright(trimleft(DM1.cdsCuenta.fieldbyname('CTAAUT2').AsString)) = '') then
      begin
         DM1.cdsCuenta2.Append;
         DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
         DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
         DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Cuenta Automática 2 mal definida';
      end;

   // Verifica que Cuenta Automática 1 haya sido declarada como de Destino
      if length(trimright(trimleft(DM1.cdsCuenta.fieldbyname('CTAAUT1').AsString)))>0 then
      begin
         DM1.cdsCuenta3.SetKey;
         DM1.cdsCuenta3.FieldByName('CIAID').AsString := DM1.cdsCuenta.FieldByName('CIAID').AsString;
         DM1.cdsCuenta3.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CTAAUT1').AsString;
         if not DM1.cdsCuenta3.GotoKey then
         begin
            DM1.cdsCuenta2.Append;
            DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
            DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
            DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Cta.Automática 1 No existe';
         end
         else
            if DM1.cdsCuenta3.FieldByName('CTA_DEST').AsString<>'S' then
            begin
               DM1.cdsCuenta2.Append;
               DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
               DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
               DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Cta.Automática 1 No Es de Destino';
            end;
      end;

   // Verifica que Cuenta Automática 2 haya sido declarada como de Destino
      if length(trimright(trimleft(DM1.cdsCuenta.fieldbyname('CTAAUT2').AsString)))>0 then
      begin
         DM1.cdsCuenta3.SetKey;
         DM1.cdsCuenta3.FieldByName('CIAID').AsString := DM1.cdsCuenta.FieldByName('CIAID').AsString;
         DM1.cdsCuenta3.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CTAAUT2').AsString;
         if not DM1.cdsCuenta3.GotoKey then
         begin
            DM1.cdsCuenta2.Append;
            DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
            DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
            DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Cta.Automática 2 No existe';
         end
         else
            if DM1.cdsCuenta3.FieldByName('CTA_DEST').AsString<>'S' then
            begin
               DM1.cdsCuenta2.Append;
               DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
               DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
               DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Cta.Automática 2 No Es de Destino';
            end;
      end;

   // Si No Tiene las dos Cuentas de Destino
      if ((DM1.cdsCuenta.fieldbyname('CTA_AUT1').AsString='S') and (DM1.cdsCuenta.fieldbyname('CTA_AUT2').AsString <> 'S')) or
         ((DM1.cdsCuenta.fieldbyname('CTA_AUT1').AsString<>'S') and (DM1.cdsCuenta.fieldbyname('CTA_AUT2').AsString = 'S'))
      then
      begin
         DM1.cdsCuenta2.Append;
         DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
         DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
         DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Inconsistencias entre Cta.Aut 1 y Cta.Aut 2';
      end;

   // pregunta si tiene nivel inferior
      xCuenta  := trimright(trimleft(DM1.cdsCuenta.FieldByName('CUENTAID').AsString));
      xFlagDet := DM1.cdsCuenta.FieldByName('CTA_DET').AsString;
      xFlagMov := DM1.cdsCuenta.FieldByName('CTA_MOV').AsString;
      DM1.cdsCuenta3.SetKey;
      DM1.cdsCuenta3.FieldByName('CIAID').AsString := DM1.cdsCuenta.FieldByName('CIAID').AsString;
      DM1.cdsCuenta3.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CTAAUT2').AsString;
      DM1.cdsCuenta3.Gotokey;
      DM1.cdsCuenta3.Next;
      if not DM1.cdsCuenta3.EOF then
      begin
         if copy(DM1.cdsCuenta3.FieldByName('CUENTAID').AsString,1,length(xCuenta))=xCuenta then
         begin
            if xFlagDet='S' then
            begin
               DM1.cdsCuenta2.Append;
               DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
               DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
               DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Error en Flag de Detalle';
            end;
            if xFlagMov='S' then
            begin
               DM1.cdsCuenta2.Append;
               DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
               DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
               DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Error en Flag de Movimiento';
            end;
         end;
      end;

      DM1.cdsCuenta.Next;
   end;

end;

procedure TFVerificaPlan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DM1.cdsCuenta.Close;
   DM1.cdsCuenta.IndexFieldNames:='';
   DM1.cdsCuenta.Filter:='';
   DM1.cdsCuenta2.Close;
   DM1.cdsCuenta2.IndexFieldNames:='';
   DM1.cdsCuenta2.Filter:='';
   DM1.cdsCuenta3.Close;
   DM1.cdsCuenta3.IndexFieldNames:='';
   DM1.cdsCuenta3.Filter:='';
end;

procedure TFVerificaPlan.BitBtn1Click(Sender: TObject);
begin
	 pprCtasObservadas.Print;
end;

procedure TFVerificaPlan.FormShow(Sender: TObject);
var
	 i : integer;
	 xSQL : string; 
begin
	DM1.cdsQry3.IndexFieldNames:='';
	DM1.cdsQry3.Close;
	xSQL := 'SELECT * FROM TGE901 '+
					'WHERE DUME=''XYZ'' ' ;
	DM1.cdsQry3.DataRequest(xSQL);
	DM1.cdsQry3.Open;

	for i:=0  to memo1.Lines.Count do
	begin
		DM1.cdsQry3.Insert;
		DM1.cdsQry3.FieldByName('DESCRIP').AsString:= memo1.Lines.Strings[i];
		Next;
	end;
	dbgTablas.DataSource:= DM1.dsQry3;

end;

procedure TFVerificaPlan.rgEscogerClick(Sender: TObject);
begin
   if rgEscoger.ItemIndex=0 then
     dbgTablas.Enabled := false
   else
      if rgEscoger.ItemIndex=1 then
				 dbgTablas.Enabled := true;
end;

procedure TFVerificaPlan.btnVerifivaClick(Sender: TObject);
var
	 xSQL, xEs, xDebeSer, xFlagDet, xFlagMov, xCuenta : string;
	 xError,Bandera : Boolean;
	 xAdic,xwhere  : string;
begin
// Para Observaciones
	 ////cim
	 if rgEscoger.ItemIndex=-1 then
			raise exception.Create('Seleccione opción...');

	 if rgEscoger.ItemIndex=1 then
	 begin
		 Bandera := False ;

		 DM1.cdsQry3.DisableControls;
		 DM1.cdsQry3.First;
		 while not dm1.cdsQry3.Eof do
		 begin
			 if dm1.cdsQry3.FieldByName('DUME').AsString = 'S' then
			 begin
				 Bandera := True;
			 end;
			 dm1.cdsQry3.Next;
		 end;
		 dm1.cdsQry3.EnableControls;

		 if not Bandera then
		 begin
			 Screen.Cursor:=crDefault;
			 Raise Exception.create('Seleccione Tabla');
		 end;
	 end;

	 if rgEscoger.ItemIndex=0 then//si es la opcion de todos
	 begin
		 //////////////////////////////////
		 // TABLAS Q NO TIENEN COMPAÑIA //
		 // CXC201                      //
		 /////////////////////////////////
		 DM1.cdsQry3.DisableControls;
		 DM1.cdsQry3.First;
		 while not DM1.cdsQry3.Eof do
		 begin
				if DM1.cdsQry3.FieldByName('DESCRIP').AsString='TGE202' then
					 ProcesaTGE202
				else
				begin
					xSQL := 'Select CIAID,''@@@@@@@@@@@'' TABLA,CUENTAID,''@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'' OBSER from TGE202 where CIAID=''8888'' ';
					DM1.cdsCuenta2.Close;
					DM1.cdsCuenta2.IndexFieldNames:='';
					DM1.cdsCuenta2.Filter:='';
					DM1.cdsCuenta2.DataRequest(xSQL);
					DM1.cdsCuenta2.Open;
					// Para Búsqueda
					xSQL := 'Select * from TGE202';
					DM1.cdsCuenta3.Close;
					DM1.cdsCuenta3.IndexFieldNames:='';
					DM1.cdsCuenta3.Filter:='';
					DM1.cdsCuenta3.DataRequest(xSQL);
					DM1.cdsCuenta3.Open;
					DM1.cdsCuenta3.IndexFieldNames:='CIAID;CUENTAID';
					// Para Verificar
					xSQL := 'Select * from '+DM1.cdsQry3.FieldByName('DESCRIP').AsString;
					DM1.cdsCuenta.Close;
					DM1.cdsCuenta.IndexFieldNames:='';
					DM1.cdsCuenta.Filter:='';
					DM1.cdsCuenta.DataRequest(xSQL);
					DM1.cdsCuenta.Open;

					if DM1.cdsQry3.FieldByName('DESCRIP').AsString='CXC201' then
						 DM1.cdsCuenta.IndexFieldNames:='CUENTAID'
					else
							DM1.cdsCuenta.IndexFieldNames:='CIAID;CUENTAID';

					pbarCuenta.Max := DM1.cdsCuenta.RecordCount;

					DM1.cdsCuenta.First;
					pbarCuenta.Position:=0;

					while not DM1.cdsCuenta.EOF do
					begin
						 DM1.cdsCuenta3.SetKey;
						 DM1.cdsCuenta3.FieldByName('CIAID').AsString    := '01';
						 DM1.cdsCuenta3.FieldByName('CUENTAID').AsString := DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
						 if not DM1.cdsCuenta3.GotoKey then
						 begin
								DM1.cdsCuenta2.Append;

								if DM1.cdsQry3.FieldByName('DESCRIP').AsString='CXC201' then
									 DM1.cdsCuenta2.FieldByName('CIAID').AsString :='01'
								else
									DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;

								DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
								DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Cta. No existe';
								DM1.cdsCuenta2.FieldByName('TABLA').AsString :=DM1.cdsQry3.fieldbyname('DESCRIP').AsString;
						 end
						 else
						 begin
								if (DM1.cdsCuenta3.FieldByName('CTA_DET').AsString<>'S')  then
								begin
									 DM1.cdsCuenta2.Append;

									 if DM1.cdsQry3.FieldByName('DESCRIP').AsString='CXC201' then
											 DM1.cdsCuenta2.FieldByName('CIAID').AsString :='01'
									 else
											DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;

									 DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
									 DM1.cdsCuenta2.FieldByName('OBSER').AsString    :='Cta. No Es de Detalle';
									 DM1.cdsCuenta2.FieldByName('TABLA').AsString :=DM1.cdsQry3.fieldbyname('DESCRIP').AsString;
								end;
								
								if (DM1.cdsCuenta3.FieldByName('CTA_MOV').AsString<>'S') then
								begin
									 DM1.cdsCuenta2.Append;
									 
									 if DM1.cdsQry3.FieldByName('DESCRIP').AsString='CXC201' then
											 DM1.cdsCuenta2.FieldByName('CIAID').AsString :='01'
									 else
											DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;


									 DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
									 DM1.cdsCuenta2.FieldByName('OBSER').AsString    :='Cta. No Es de Movimiento';
									 DM1.cdsCuenta2.FieldByName('TABLA').AsString :=DM1.cdsQry3.fieldbyname('DESCRIP').AsString;
								end;

						 end;
						 DM1.cdsCuenta.Next;
					end;//while

				end;

				DM1.cdsQry3.Next;

		 end;//cdsqry3
	 end
	 else
			if rgEscoger.ItemIndex=1 then//si es la opcion de escoger
			begin
				 DM1.cdsQry3.DisableControls;
				 DM1.cdsQry3.First;
				 while not DM1.cdsQry3.Eof do
				 begin
						if DM1.cdsQry3.FieldByName('DUME').AsString='S' then
						begin
							if DM1.cdsQry3.FieldByName('DESCRIP').AsString='TGE202' then
								 ProcesaTGE202
							else
							begin
								 xSQL := 'Select CIAID,''@@@@@@@@@@@'' TABLA,CUENTAID,''@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'' OBSER from TGE202 where CIAID=''8888'' ';
								 DM1.cdsCuenta2.Close;
								 DM1.cdsCuenta2.IndexFieldNames:='';
								 DM1.cdsCuenta2.Filter:='';
								 DM1.cdsCuenta2.DataRequest(xSQL);
								 DM1.cdsCuenta2.Open;
								 // Para Búsqueda
								 xSQL := 'Select * from TGE202';
								 DM1.cdsCuenta3.Close;
								 DM1.cdsCuenta3.IndexFieldNames:='';
								 DM1.cdsCuenta3.Filter:='';
								 DM1.cdsCuenta3.DataRequest(xSQL);
								 DM1.cdsCuenta3.Open;
								 DM1.cdsCuenta3.IndexFieldNames:='CIAID;CUENTAID';
								 // Para Verificar
								 xSQL := 'Select * from '+DM1.cdsQry3.FieldByName('DESCRIP').AsString;
								 DM1.cdsCuenta.Close;
								 DM1.cdsCuenta.IndexFieldNames:='';
								 DM1.cdsCuenta.Filter:='';
								 DM1.cdsCuenta.DataRequest(xSQL);
								 DM1.cdsCuenta.Open;

								 if DM1.cdsQry3.FieldByName('DESCRIP').AsString='CXC201' then
										 DM1.cdsCuenta.IndexFieldNames:='CUENTAID'
								 else
										DM1.cdsCuenta.IndexFieldNames:='CIAID;CUENTAID';

								 pbarCuenta.Max := DM1.cdsCuenta.RecordCount;

								 DM1.cdsCuenta.First;
								 pbarCuenta.Position:=0;

								 while not DM1.cdsCuenta.EOF do
								 begin
									 DM1.cdsCuenta3.SetKey;
									 if DM1.cdsQry3.FieldByName('DESCRIP').AsString='CXC201' then
											DM1.cdsCuenta3.FieldByName('CIAID').AsString    := '01'
									 else
										 DM1.cdsCuenta3.FieldByName('CIAID').AsString := DM1.cdsCuenta.FieldByName('CIAID').AsString;

									 DM1.cdsCuenta3.FieldByName('CUENTAID').AsString := DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
									 if not DM1.cdsCuenta3.GotoKey then
									 begin
											DM1.cdsCuenta2.Append;

											if DM1.cdsQry3.FieldByName('DESCRIP').AsString='CXC201' then
												 DM1.cdsCuenta2.FieldByName('CIAID').AsString :='01'
											else
												DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;

											DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
											DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Cta. No existe';
											DM1.cdsCuenta2.FieldByName('TABLA').AsString :=DM1.cdsQry3.fieldbyname('DESCRIP').AsString;
									 end
									 else
									 begin
											if (DM1.cdsCuenta3.FieldByName('CTA_DET').AsString<>'S')  then
											begin
												 DM1.cdsCuenta2.Append;

												 if DM1.cdsQry3.FieldByName('DESCRIP').AsString='CXC201' then
														 DM1.cdsCuenta2.FieldByName('CIAID').AsString :='01'
												 else
														DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;

												 DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
												 DM1.cdsCuenta2.FieldByName('OBSER').AsString    :='Cta. No Es de Detalle';
												 DM1.cdsCuenta2.FieldByName('TABLA').AsString :=DM1.cdsQry3.fieldbyname('DESCRIP').AsString;
											end;

											if (DM1.cdsCuenta3.FieldByName('CTA_MOV').AsString<>'S') then
											begin
												 DM1.cdsCuenta2.Append;

												 if DM1.cdsQry3.FieldByName('DESCRIP').AsString='CXC201' then
														 DM1.cdsCuenta2.FieldByName('CIAID').AsString :='01'
												 else
														DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;


												 DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
												 DM1.cdsCuenta2.FieldByName('OBSER').AsString    :='Cta. No Es de Movimiento';
												 DM1.cdsCuenta2.FieldByName('TABLA').AsString :=DM1.cdsQry3.fieldbyname('DESCRIP').AsString;
											end;

									 end;
 								   DM1.cdsCuenta.Next;									 
								 end;//WHILE

							end;//if tabla es = TGE202

						end;//if//dum

						DM1.cdsQry3.Next;
				 end;//cdsqry3

			end;//IF


end;


Procedure TFVerificaPlan.ProcesaTGE202;
var
  xSQL,xCuenta,xFlagDet,xFlagMov : string;
begin

	 xSQL := 'Select CIAID,''@@@@@@@@@@@'' TABLA,CUENTAID,''@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'' OBSER from TGE202 where CIAID=''8888'' ';
	 DM1.cdsCuenta2.Close;
	 DM1.cdsCuenta2.IndexFieldNames:='';
	 DM1.cdsCuenta2.Filter:='';
	 DM1.cdsCuenta2.DataRequest(xSQL);
	 DM1.cdsCuenta2.Open;
// Para Búsqueda
	 xSQL := 'Select * from TGE202';
	 DM1.cdsCuenta3.Close;
	 DM1.cdsCuenta3.IndexFieldNames:='';
	 DM1.cdsCuenta3.Filter:='';
	 DM1.cdsCuenta3.DataRequest(xSQL);
   DM1.cdsCuenta3.Open;
   DM1.cdsCuenta3.IndexFieldNames:='CIAID;CUENTAID';
// Para Verificar
   xSQL := 'Select * from TGE202';
   DM1.cdsCuenta.Close;
   DM1.cdsCuenta.IndexFieldNames:='';
   DM1.cdsCuenta.Filter:='';
   DM1.cdsCuenta.DataRequest(xSQL);
   DM1.cdsCuenta.Open;
   DM1.cdsCuenta.IndexFieldNames:='CIAID;CUENTAID';

   pbarCuenta.Max := DM1.cdsCuenta.RecordCount;

   DM1.cdsCuenta.First;
   pbarCuenta.Position:=0;
   
   while not DM1.cdsCuenta.EOF do
   begin
      pbarCuenta.Position:=pbarCuenta.Position+1;
   // pregunta si Es de Destino y de Movimientos a la misma vez
      if (DM1.cdsCuenta.FieldByName('CTA_DEST').AsString='S') and (DM1.cdsCuenta.FieldByName('CTA_MOV').AsString='S') then
      begin
         DM1.cdsCuenta2.Append;
         DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
         DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
				 DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Incompatibilidad entre Movim. y Destino';
				 DM1.cdsCuenta2.FieldByName('TABLA').AsString :=DM1.cdsQry3.fieldbyname('DESCRIP').AsString;				 
      end;

	 // pregunta si Es de Destino y a la vez Tiene Cuentas de Destino
      if (DM1.cdsCuenta.FieldByName('CTA_DEST').AsString='S') and (DM1.cdsCuenta.fieldbyname('CTA_AUT1').AsString = 'S') then
      begin
         DM1.cdsCuenta2.Append;
         DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
         DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
				 DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Incompatibilidad Ctas Destino y Flag Destino';
 			   DM1.cdsCuenta2.FieldByName('TABLA').AsString :=DM1.cdsQry3.fieldbyname('DESCRIP').AsString;				 
      end;

   // Verifica Cuenta Automática 1
      if (DM1.cdsCuenta.fieldbyname('CTA_AUT1').AsString = 'S') and (trimright(trimleft(DM1.cdsCuenta.fieldbyname('CTAAUT1').AsString)) = '') then
      begin
         DM1.cdsCuenta2.Append;
         DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
         DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
				 DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Cuenta Automática 1 mal definida';
				 DM1.cdsCuenta2.FieldByName('TABLA').AsString :=DM1.cdsQry3.fieldbyname('DESCRIP').AsString;				 
      end;

   // Verifica Cuenta Automática 2
      if (DM1.cdsCuenta.fieldbyname('CTA_AUT2').AsString = 'S') and (trimright(trimleft(DM1.cdsCuenta.fieldbyname('CTAAUT2').AsString)) = '') then
      begin
         DM1.cdsCuenta2.Append;
         DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
         DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
				 DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Cuenta Automática 2 mal definida';
  			 DM1.cdsCuenta2.FieldByName('TABLA').AsString :=DM1.cdsQry3.fieldbyname('DESCRIP').AsString;				 
      end;

   // Verifica que Cuenta Automática 1 haya sido declarada como de Destino
      if length(trimright(trimleft(DM1.cdsCuenta.fieldbyname('CTAAUT1').AsString)))>0 then
			begin
         DM1.cdsCuenta3.SetKey;
         DM1.cdsCuenta3.FieldByName('CIAID').AsString := DM1.cdsCuenta.FieldByName('CIAID').AsString;
         DM1.cdsCuenta3.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CTAAUT1').AsString;
         if not DM1.cdsCuenta3.GotoKey then
         begin
            DM1.cdsCuenta2.Append;
            DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
            DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
						DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Cta.Automática 1 No existe';
						DM1.cdsCuenta2.FieldByName('TABLA').AsString :=DM1.cdsQry3.fieldbyname('DESCRIP').AsString;
				 end
				 else
						if DM1.cdsCuenta3.FieldByName('CTA_DEST').AsString<>'S' then
						begin
							 DM1.cdsCuenta2.Append;
							 DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
							 DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
							 DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Cta.Automática 1 No Es de Destino';
							 DM1.cdsCuenta2.FieldByName('TABLA').AsString :=DM1.cdsQry3.fieldbyname('DESCRIP').AsString;							 
						end;
			end;

	 // Verifica que Cuenta Automática 2 haya sido declarada como de Destino
			if length(trimright(trimleft(DM1.cdsCuenta.fieldbyname('CTAAUT2').AsString)))>0 then
      begin
         DM1.cdsCuenta3.SetKey;
         DM1.cdsCuenta3.FieldByName('CIAID').AsString := DM1.cdsCuenta.FieldByName('CIAID').AsString;
         DM1.cdsCuenta3.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CTAAUT2').AsString;
         if not DM1.cdsCuenta3.GotoKey then
         begin
						DM1.cdsCuenta2.Append;
            DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
            DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
            DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Cta.Automática 2 No existe';
         end
         else
            if DM1.cdsCuenta3.FieldByName('CTA_DEST').AsString<>'S' then
            begin
               DM1.cdsCuenta2.Append;
               DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
               DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
               DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Cta.Automática 2 No Es de Destino';
            end;
      end;

   // Si No Tiene las dos Cuentas de Destino
      if ((DM1.cdsCuenta.fieldbyname('CTA_AUT1').AsString='S') and (DM1.cdsCuenta.fieldbyname('CTA_AUT2').AsString <> 'S')) or
         ((DM1.cdsCuenta.fieldbyname('CTA_AUT1').AsString<>'S') and (DM1.cdsCuenta.fieldbyname('CTA_AUT2').AsString = 'S'))
      then
      begin
         DM1.cdsCuenta2.Append;
         DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
         DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
         DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Inconsistencias entre Cta.Aut 1 y Cta.Aut 2';
      end;

   // pregunta si tiene nivel inferior
      xCuenta  := trimright(trimleft(DM1.cdsCuenta.FieldByName('CUENTAID').AsString));
      xFlagDet := DM1.cdsCuenta.FieldByName('CTA_DET').AsString;
			xFlagMov := DM1.cdsCuenta.FieldByName('CTA_MOV').AsString;
      DM1.cdsCuenta3.SetKey;
      DM1.cdsCuenta3.FieldByName('CIAID').AsString := DM1.cdsCuenta.FieldByName('CIAID').AsString;
      DM1.cdsCuenta3.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CTAAUT2').AsString;
      DM1.cdsCuenta3.Gotokey;
      DM1.cdsCuenta3.Next;
      if not DM1.cdsCuenta3.EOF then
      begin
         if copy(DM1.cdsCuenta3.FieldByName('CUENTAID').AsString,1,length(xCuenta))=xCuenta then
         begin
            if xFlagDet='S' then
            begin
               DM1.cdsCuenta2.Append;
               DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
               DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
               DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Error en Flag de Detalle';
            end;
            if xFlagMov='S' then
            begin
               DM1.cdsCuenta2.Append;
               DM1.cdsCuenta2.FieldByName('CIAID').AsString :=DM1.cdsCuenta.FieldByName('CIAID').AsString;
               DM1.cdsCuenta2.FieldByName('CUENTAID').AsString :=DM1.cdsCuenta.FieldByName('CUENTAID').AsString;
               DM1.cdsCuenta2.FieldByName('OBSER').AsString :='Error en Flag de Movimiento';
            end;
         end;
      end;

      DM1.cdsCuenta.Next;
   end;
end;

end.
