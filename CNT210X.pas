unit CNT210;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls,db, DBClient, wwclient,Mant, StdCtrls, Mask, oaContabiliza;

type
  TFToolComprobante = class(TForm)
    PnlComprobante: TPanel;
    sbtABl: TSpeedButton;
    SpeedButton3: TSpeedButton;
    sbtCBl: TSpeedButton;
    Z2sbEliminaAsiento: TSpeedButton;
    Z2sbPlanillas: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbtABlClick(Sender: TObject);
    Function  AsientoCuadra: Boolean;
    Function  Valida_Cuenta_y_CCosto : Boolean;
    procedure sbtCBlClick(Sender: TObject);
    procedure Z2sbEliminaAsientoClick(Sender: TObject);
    procedure Z2sbPlanillasClick(Sender: TObject);

  private
    { Private declarations }
    MProv    : TMant;
    xxMND  : Double;
    xxMNC  : Double;
    xxMED  : Double;
    xxMEC  : Double;

    //Agregado por Ana
     xCont : String;
     cdsGComprobante :  TwwClientDataSet;
     procedure TotalesResumen;
  public
    { Public declarations }
    xToolCia,xTooldiario,xToolAnomm,xToolPeriodo,xToolEstado : String;
    Function  PeriodoCuadra:Boolean;
  end;

var
  FToolComprobante: TFToolComprobante;
   xSqlMant: STring;

implementation

uses CNT211, CNTDM, CNT260, Cnt260i, oaCN2000, CNT201, CNT280;

{$R *.DFM}

procedure TFToolComprobante.SpeedButton1Click(Sender: TObject);
begin
  FImpBloComp:=TFImpBloComp.Create(Self);
  try
    FImpBloComp.ShowModal;
  finally
    FImpBloComp.free;
  end;

end;

procedure TFToolComprobante.SpeedButton2Click(Sender: TObject);
begin
  DMCNT.cdsCabCNT.Data:=FRegistro.GComprobante.FMant.cds2.Data;
  FImpBloComp:=TFImpBloComp.Create(Self);
  try
    FImpBloComp.ShowModal;
  finally
    FImpBloComp.free;
  end;

end;

Function TFToolComprobante.PeriodoCuadra:Boolean;
var
  xA,xR,xI  : integer;
  P,E,T  : string;
begin
    result := False;

    xA:=0 ;  xR:=0 ;  xI:=0 ;
    cdsGComprobante.First ;
    P:= cdsGComprobante.FieldByName('CNTANOMM').AsString ;
    E:= cdsGComprobante.FieldByName('CNTESTADO').AsString ;
    while not  cdsGComprobante.EOF do
    begin
      T := cdsGComprobante.FieldByName('CNTANOMM').AsString;

      if (P = T) and (E = 'I') then //Si periodos son iguales
         xA := xA+1
      else
        if P <> T  then  //  Compara si los periodos son iguales
        begin
           Showmessage(' Debe Aceptar solo Registros con periodos iguales');
           xR := xR+1;
           result := False;
           Exit;
        end ;

        // validación de  los estados
        if  (E ='P') or (E ='C') then //Pendiente  o Contabilizado
        begin
           Showmessage(' Debe Aceptar solo Incompletos');
           xI := xI+1;
           result := False;
           Exit;
        end;

    cdsGComprobante.Next;
    end;
    if (xR =0) or(xI=0) then
       result := true;
 end;

Function TFToolComprobante.AsientoCuadra:Boolean;
var
   xTotDebe, xTotHaber : DOUBLE;
begin
   Result    := False;
   xTotDebe  := 0;
   xTotHaber := 0;
   DMCNT.cdsMovCnt1.DisableControls;
   DMCNT.cdsMovCnt1.First ;
   while not DMCNT.cdsMovCnt1.eof do begin
      if DMCNT.cdsMovCnt1.FieldByName('CNTDH').AsString='D' then
         xTotDebe  := xTotDebe  + DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat
      else begin
         xTotHaber := xTotHaber + DMCNT.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat;
      end;
      DMCNT.cdsMovCnt1.Next;
   end;
   DMCNT.cdsMovCnt1.First;
   DMCNT.cdsMovCnt1.EnableControls;
   if DMCNT.FRound(xTotDebe,15,2)=DMCNT.FRound(xTotHaber,15,2) then Result := True;
end;


Function TFToolComprobante.Valida_Cuenta_y_CCosto : Boolean;
var
   xSQL : String;
begin
   Result    := False;

   DMCNT.cdsMovCnt1.DisableControls;
   DMCNT.cdsMovCnt1.First ;
   while not DMCNT.cdsMovCnt1.eof do
   begin
      // revisar si cuenta contable esta activa
      xSQL:='Select CIAID, CUENTAID, CTAACT, CTA_AUX, CTA_CCOS from TGE202 '
           +'WHERE CIAID='''   +DMCNT.cdsMovCnt1.FieldByName('CIAID').AsString   +''''
           +  'AND CUENTAID='''+DMCNT.cdsMovCnt1.FieldByName('CUENTAID').AsString+''''
           +  'AND CTAACT=''S''';
      DMCNT.cdsSQL.Close;
      DMCNT.cdsSQL.DataRequest(xSQL);
      DMCNT.cdsSQL.Open;
      if DMCNT.cdsSQL.Recordcount<=0 then
      begin
         Exit;
      end;

      if DMCNT.cdsSQL.FieldByName('CTA_CCOS').AsString='S' then
      begin
         if DMCNT.cdsMovCnt1.FieldByName('CCOSID').AsString='' then
         begin
            Exit;
         end;

         // revisar si centro de costo esta activo
         xSQL:='Select CCOSID, CCOSACT from TGE203 '
              +'WHERE CUENTAID='''+DMCNT.cdsMovCnt1.FieldByName('CCOSID').AsString+''''
              +  'AND CCOSACT=''S''';
         DMCNT.cdsSQL.Close;
         DMCNT.cdsSQL.DataRequest(xSQL);
         DMCNT.cdsSQL.Open;
         if DMCNT.cdsSQL.Recordcount<=0 then
         begin
            Exit;
         end;
      end;

      if DMCNT.cdsSQL.FieldByName('CTA_CCOS').AsString='S' then
      begin
         if DMCNT.cdsMovCnt1.FieldByName('CCOSID').AsString='' then
         begin
            Exit;
         end;

         // revisar si centro de costo esta activo
         xSQL:='Select CCOSID, CCOSACT from TGE203 '
              +'WHERE CUENTAID='''+DMCNT.cdsMovCnt1.FieldByName('CCOSID').AsString+''''
              +  'AND CCOSACT=''S''';
         DMCNT.cdsSQL.Close;
         DMCNT.cdsSQL.DataRequest(xSQL);
         DMCNT.cdsSQL.Open;
         if DMCNT.cdsSQL.Recordcount<=0 then
         begin
            Exit;
         end;
      end;


      DMCNT.cdsMovCnt1.Next;
   end;
   DMCNT.cdsMovCnt1.First;
   DMCNT.cdsMovCnt1.EnableControls;

   Result := True;
end;


procedure TFToolComprobante.sbtABlClick(Sender: TObject);
var
    P,E,T ,xFiltro, xtmonid:  string ;
    xClAuxId, xProv        :  string ;
    xCPMtoLoc,xCPMtoExt    :  double ;
    xCia,xPer,xDiar,xNReg,xcompro  :  String ;
    xSqlMant : STRING;

begin
   if MessageDlg('Aceptar Comprobantes'+chr(13)+chr(13)+
                 '  ¿ Esta Seguro ?  ',mtConfirmation, [mbYes, mbNo], 0)=mrNo then exit;
//   xSqlMant := FPrincipal.GComprobante.FMant.SQL;
   xSqlMant := FRegistro.GComprobante.FMant.SQL;

   If pos('CIAID=',xSqlMant) > 0 then
    xToolCia     := copy(xSqlMant,pos('CIAID=',xSqlMant)+7,2);
   If pos('TDIARID=',xSqlMant) > 0 then
    xTooldiario := copy(xSqlMant,pos('TDIARID=',xSqlMant)+9,2);
   If pos('CNTANOMM=',xSqlMant) > 0 then
    xToolPeriodo := copy(xSqlMant,pos('CNTANOMM=',xSqlMant)+10,6);
   If pos('CNTESTADO=',xSqlMant) > 0 then
    xToolEstado := copy(xSqlMant,pos('CNTESTADO=',xSqlMant)+9,2);

   If (xToolCIa = '') then
    begin
     raise exception.Create('Debe de Filtrar también por Compañia');
    end;

   If (xTooldiario = '') then
    begin
     raise exception.Create('Debe de Filtrar también por Tipo de Diario');
    end;

   If (xToolPeriodo = '') then
    begin
     raise exception.Create('Debe de Filtrar también por Periodo');
    end;

   If (xToolEstado = '') then
    begin
     raise exception.Create('Debe de Filtrar también por Estado');
    end;


   try
      screen.Cursor := crHOURGLASS;

      DMCNT.cdsCabCNT.Data:=FRegistro.GComprobante.FMant.cds2.Data;

//      if FPrincipal.xTipocomprobante='P' then
      if FRegistro.xTipocomprobante='P' then
      begin
         cdsGComprobante:=  FRegistro.GComprobante.FMant.cds2 ; //Provisiones
         MProv   :=  FRegistro.GComprobante;
      end;

      If not PeriodoCuadra then

      If MessageDlg( 'Aceptara Registros Diferentes e Incompletos' + chr(13)+
                  '          ¿Esta Seguro?  ',mtConfirmation,[mbYes, mbNo],0)=mrNo
      then exit;

//      cdsGComprobante.disablecontrols;
      cdsGComprobante.Close;
      cdsGComprobante.Open;

      if cdsGComprobante.RecordCount=0 then
      begin
        cdsGComprobante.EnableControls;
        showmessage('No existen Registros');
        Exit;
      end;

      cdsGComprobante.First;

      P:= cdsGComprobante.FieldByName('CNTANOMM').AsString;

      while not  cdsGComprobante.EOF do
      begin
         T:= cdsGComprobante.FieldByName('CNTANOMM').AsString;
         if not(cdsGComprobante.FieldByName('CNTDEBEMN').asfloat=cdsGComprobante.FieldByName('CNTDEBEMN').asfloat) then
         begin
            ShowMessage(
              'Error:  Asiento NO Cuadra' + #13 +
              'Compañía  : ' +  cdsGComprobante.FieldByName('CIAID').asstring   +#13+
              'T. Diario : ' +  cdsGComprobante.FieldByName('TDIARID').asstring +#13+
              'Periodo   : ' +  cdsGComprobante.FieldByName('CPANOMES').asstring+#13+
              'Registro  : ' +  cdsGComprobante.FieldByName('CPNOREG').asstring ) ;
            cdsGComprobante.Next ;
            continue      ;
         end;

         E:= cdsGComprobante.FieldByName('CNTESTADO').AsString;

         if (P = T) and (E = 'I') then
         begin
            xCont     := 'S';
            xCia      := cdsGComprobante.FieldByName('CIAID').value;
            xPer      := cdsGComprobante.FieldByName('CNTANOMM').value;
            xDiar     := cdsGComprobante.FieldByName('TDIARID').value;
            xCompro     := cdsGComprobante.FieldByName('CNTCOMPROB').asstring;

            xtmonid   := cdsGComprobante.FieldByName('TMONID').value;
            //
            xFiltro := 'CIAID='   +''''+xCia    +''''+' and '+
                       'TDIARID=' +''''+xDiar+''''+' and '+
                       'CNTANOMM='+''''+xPer+''''+' and '+
                       'CNTESTADO=''I'' AND CNTCOMPROB='''+xcompro+'''';


            DMCNT.Filtracds( DMCNT.CdsMovCNT1, 'Select * from CNT301 Where '+xFiltro );
            //
            cdsGComprobante.Edit;
            cdsGComprobante.FieldByname('CNTESTADO').Value:='P';
            DMCNT.cdsMovCnt1.First;
            while not DMCNT.cdsMovCnt1.EOF do begin
               DMCNT.cdsMovCnt1.Edit;
               DMCNT.cdsMovCnt1.FieldByName('CNTESTADO').AsString:= 'P';
               cdsPost( DMCNT.cdsMovCnt1 );
               DMCNT.cdsMovCnt1.Next;
            end;
            //DMCNT.AplicaDatos(DMCNT.cdsMovCnt1,'MOVCNT1');
            DMCNT.ControlTran(0);
            cdsGComprobante.NEXT;

         END;
      end;
   finally
      DMCNT.controltran(0);
      ShowMessage('Proceso Finalizado') ;
      FRegistro.GComprobante.RefreshFilter;
      cdsGComprobante.enablecontrols;
      screen.Cursor := crDEFAULT;
  end;
end;


procedure TFToolComprobante.sbtCBlClick(Sender: TObject);
var
   xRegistros, xRegCon  : Integer;
   xZ, nRegNT : Integer;
   xSql, xMest, cMensaje : String;
begin
   if MessageDlg('Contabilizar Comprobantes'+chr(13)+chr(13)+
                 '  ¿ Esta Seguro ?  ',mtConfirmation, [mbYes, mbNo], 0)=mrNo then exit;


   xSqlMant := FRegistro.GComprobante.FMant.SQL;

   If pos('CIAID=',xSqlMant) > 0 then
      xToolCia     := copy(xSqlMant,pos('CIAID=',xSqlMant)+7,2);

   If pos('CNTANOMM=',xSqlMant) > 0 then
      xToolAnomm   := copy(xSqlMant,pos('CNTANOMM=',xSqlMant)+10,6);

   If pos('TDIARID=',xSqlMant) > 0 then
      xTooldiario  := copy(xSqlMant,pos('TDIARID=',xSqlMant)+9,2);

   If (xToolCIa = '') then
   begin
      showMessage('Debe de Filtrar también por Compañia');
      exit;
   end;

   If (xToolAnomm = '') then
   begin
      showMessage('Debe de Filtrar también por Periodo');
      exit;
   end;

   Screen.Cursor:=CrHourGlass;

   FRegistro.GComprobante.FMant.cds2.Last;

   DMCNT.cdsCabCNT.Data:=FRegistro.GComprobante.FMant.cds2.Data;

   xRegistros:=0;
   xRegCon   :=0;

   // vhndema - LA DATA NO ESTA ACTUALIZADA AL SALIR DE LA VENTANA DE COMPROBANTE

   FRegistro.GComprobante.FMant.cds2.First;
   while not FRegistro.GComprobante.FMant.cds2.Eof do begin

      xSQL:='Select * from CNT300 '
           +'WHERE CIAID='''     + FRegistro.GComprobante.FMant.cds2.FieldByName('CIAID').AsString      +''' AND '
           +      'TDIARID='''   + FRegistro.GComprobante.FMant.cds2.FieldByName('TDIARID').AsString    +''' AND '
           +      'CNTANOMM='''  + FRegistro.GComprobante.FMant.cds2.FieldByName('CNTANOMM').AsString   +''' AND '
           +      'CNTCOMPROB='''+ FRegistro.GComprobante.FMant.cds2.FieldByName('CNTCOMPROB').AsString +''' ';
      DMCNT.cdsCabCNT.Close;
      DMCNT.cdsCabCNT.DataRequest( xSQL );
      DMCNT.cdsCabCNT.Open;

      xRegistros:=xRegistros+1;
      if ( DMCNT.cdsCabCNT.FieldByName('CNTCUADRE').AsString<>'S' ) and
         ( DMCNT.cdsCabCNT.FieldByName('CNTESTADO').AsString<>'A' ) then
      begin
         xSQL:='Select * from CNT311 '
              +'WHERE CIAID='''     + DMCNT.cdsCabCnt.FieldByName('CIAID').AsString      +''' AND '
              +      'TDIARID='''   + DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString    +''' AND '
              +      'CNTANOMM='''  + DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString   +''' AND '
              +      'CNTCOMPROB='''+ DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString +''' '
              +'ORDER BY CNTREG';

         DMCNT.cdsMovCNT1.Close;
         DMCNT.cdsMovCNT1.DataRequest( xSQL );
         DMCNT.cdsMovCNT1.Open;

         if (AsientoCuadra) and (Valida_Cuenta_y_CCosto) then
         begin

            Errorcount:=0;

            FRegComp.CuadraAsiento;

            if SOLConta( DMCNT.cdsCabCnt.FieldByName('CIAID').AsString, DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString,
                         DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString, DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString,
               SRV_D, 'C', DMCNT.wModulo, DMCNT.cdsMovCNT1, DMCNT.cdsNivel,
               DMCNT.cdsResultSet, DMCNT.DCOM1, FRegistro.GComprobante.FMant ) then
            begin

               TotalesResumen;

               DMCNT.cdsCabCnt.Edit;
               DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString := 'S';
               DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString := 'P';
               DMCNT.cdsCabCnt.FieldByName('CNTDEBEMN').AsFloat  := DMCNT.FRound( xxMND,15,2);
               DMCNT.cdsCabCnt.FieldByName('CNTHABEMN').AsFloat  := DMCNT.FRound( xxMNC,15,2);
               DMCNT.cdsCabCnt.FieldByName('CNTDEBEME').AsFloat  := DMCNT.FRound( xxMED,15,2);
               DMCNT.cdsCabCnt.FieldByName('CNTHABEME').AsFloat  := DMCNT.FRound( xxMEC,15,2);
               DMCNT.cdsCabCnt.FieldByName('DOCMOD').AsString    := DMCNT.wModulo;
               DMCNT.cdsCabCnt.FieldByName('CNTUSER').AsString   := DMCNT.wUsuario; // usuario que registra
               DMCNT.cdsCabCnt.FieldByName('CNTFREG').AsDateTime := date;         // fecha que registra usuario
               DMCNT.cdsCabCnt.FieldByName('CNTHREG').AsdateTime := time;         // hora que registra usuario
               cdsPost( DMCNT.cdsCabCnt );
               DMCNT.cdsCabCNT.DataRequest( 'Select * from CNT300 '
                            +'WHERE CIAID='''     + DMCNT.cdsCabCnt.FieldByName('CIAID').AsString      +''' AND '
                            +      'TDIARID='''   + DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString    +''' AND '
                            +      'CNTANOMM='''  + DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString   +''' AND '
                            +      'CNTCOMPROB='''+ DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString +'''');
               DMCNT.ControlTran( 0 );
               xRegCon:=xRegCon+1;
            end;
         end;
      end;
      FRegistro.GComprobante.FMant.cds2.Edit;
      FRegistro.GComprobante.FMant.cds2.FieldByName('CNTCUADRE').AsString:=DMCNT.cdsCabCnt.FieldByName('CNTCUADRE').AsString;
      FRegistro.GComprobante.FMant.cds2.FieldByName('CNTESTADO').AsString:=DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString;
      FRegistro.GComprobante.FMant.cds2.Post;
      FRegistro.GComprobante.FMant.cds2.Next;
   end;

   Screen.Cursor:=CrDefault;

   cMensaje:='';
   if xRegistros-xRegCon>0 then
   begin
      //nRegNT:=xRegistros-xRegCon;
      nRegNT:=0;
      FRegistro.GComprobante.FMant.cds2.First;
      while not FRegistro.GComprobante.FMant.cds2.Eof do
      begin
         if FRegistro.GComprobante.FMant.cds2.FieldByName('CNTESTADO').AsString='I' then
         begin
            nRegNT:=nRegNT+1;
         end;
         FRegistro.GComprobante.FMant.cds2.Next;
      end;

      cMensaje:=chr(13)+chr(13)+'Existe(n)    '+IntToStr( nRegNT )+'    registro(s) sin Contabilizar'
               +chr(13)+chr(13)+'Revisar Cuentas Contables y Centros de Costo';
   end;

   ShowMessage( 'Contabilización en Bloque Terminada'+chr(13)+chr(13)+
                'Registros Procesados          : '+IntToStr( xRegistros )+chr(13)+chr(13)+
                'Registros Contabilizados      : '+IntToStr( xRegCon ) + cMensaje );
end;


procedure TFToolComprobante.TotalesResumen;
begin
   xxMND:=0;  xxMNC:=0;  xxMED:=0;  xxMEC:=0;
   DMCNT.cdsMovCnt1.DisableControls;
   DMCNT.cdsMovCnt1.First;
   while not DMCNT.cdsMovCnt1.Eof do
   begin
        xxMND:=xxMND+DMCNT.cdsMovCnt1.FieldByName('CNTDEBEMN').AsFloat;
        xxMNC:=xxMNC+DMCNT.cdsMovCnt1.FieldByName('CNTHABEMN').AsFloat;
        xxMED:=xxMED+DMCNT.cdsMovCnt1.FieldByName('CNTDEBEME').AsFloat;
        xxMEC:=xxMEC+DMCNT.cdsMovCnt1.FieldByName('CNTHABEME').AsFloat;
        DMCNT.cdsMovCnt1.Next;
   end;
   DMCNT.cdsMovCnt1.EnableControls;
end;



procedure TFToolComprobante.Z2sbEliminaAsientoClick(Sender: TObject);
var
   xSQL, xWhere, xLLave : String;
   xCia, xTDiario, xAnoMes, xNroComp : String;
   xCia1, xTdiario1, xAnoMes1, xNroComp1 : String;
   xCia2, xTdiario2, xAnoMes2, xNroComp2 : String;
   xCia3, xTdiario3, xAnoMes3, xNroComp3 : String;
begin

   DMCNT.cdsCabCNT.Data:=FRegistro.GComprobante.FMant.cds2.Data;
   DMCNT.cdsCabCNT.GotoCurrent(FRegistro.GComprobante.FMant.cds2);
// verifica que asiento no esté contabilizado
   if (DMCNT.cdsCabCnt.FieldByName('CNTESTADO').AsString <> 'I') then
   begin
      ShowMessage('Situación del comprobante no permite eliminación!');
      exit;
   end;

   // verifica que asiento haya sido generado por otro Modulo
   if ( DMCNT.cdsCabCnt.FieldByName('MODULO').AsString='CNT'  )  or
      ( DMCNT.cdsCabCnt.FieldByName('MODULO').AsString='CXP'  )  or
      ( DMCNT.cdsCabCnt.FieldByName('MODULO').AsString='CAJA' ) or
      ( DMCNT.cdsCabCnt.FieldByName('MODULO').AsString='PL'  ) then
      // pasa
   else
   begin
      ShowMessage('No se puede Eliminar Asientos del propio módulo de Contabilidad mediante esta opción' );
      Exit;
   end;

   // verifica que no se realice controlando el periodo de cierre

   if MessageDlg(' ¿ Está seguro de eliminar el asiento en el módulo de Contabilidad ? ',
                 mtConfirmation, [mbYes, mbNo], 0)=mrYes then
   begin
      xCia     := DMCNT.cdsCabCnt.FieldByName('CIAID').AsString;
      xTdiario := DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString;
      xAnoMes  := DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString;
      xNroComp := DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString;

      // vhndema
      // CONTABILIDAD
      if ( DMCNT.cdsCabCnt.FieldByName('MODULO').AsString='CNT' ) or
         ( DMCNT.cdsCabCnt.FieldByName('MODULO').AsString='PL'  ) then
      begin

         xSQL:='delete from CNT311 '
              +'where CIAID='      +quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString     )
              +'   and TDIARID='   +quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString   )
              +'   and CNTANOMM='  +quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString  )
              +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         except
         end;

         xSQL:='delete from CNT300 '
              +'where CIAID='      +quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString     )
              +'   and TDIARID='   +quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString   )
              +'   and CNTANOMM='  +quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString  )
              +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         except
         end;
         ShowMessage('Comprobante Eliminado') ;
         DMCNT.ActualizaFiltro(FRegistro.GComprobante,DMCNT.cdsCabCNT,'E');
         FRegistro.GComprobante.RefreshFilter;

      end; // FIN Contabilidad
      // vhndema


   // Caja y Bancos
      if DMCNT.cdsCabCnt.FieldByName('MODULO').AsString='CAJA' then
      begin
      // busca en CAJA302
         xWhere := 'CIAID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
                  +' and TDIARID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
                  +' and ECANOMM='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
                  +' and ECNOCOMP='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         if length(DMCNT.DisplayDescrip('PrvTGE','CAJA302','ECNOCOMP',xWhere,'ECNOCOMP'))>0 then
         begin
            xLLave := '%'+DMCNT.cdsCabCnt.FieldByName('CIAID').AsString+'/'
                         +DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString+'/'
                         +DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString+'%';
            xSQL := 'select * from CAJA302 '
                   +'where ECANOMM='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
                   +' and ECPERREC like '+quotedstr(xLLave);
            DMCNT.cdsQry2.IndexFieldNames:='';
            DMCNT.cdsQry2.Filter:='';
            DMCNT.cdsQry2.Filtered:=False;
            DMCNT.cdsQry2.DataRequest(xSQL);
            DMCNT.cdsQry2.Open;
            if DMCNT.cdsQry2.recordcount>0 then
            begin
               if MessageDlg(' El asiento es del módulo de Caja con asientos automáticos, '+chr(13)
                            +' se eliminarán los asientos automáticos generados, '
                            +' ¿Continuar? ',mtConfirmation, [mbYes, mbNo], 0)=mrNo then
                  exit;
//         1         2         3         4         5         6         7         8         9
//123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
//1. 02/06/0000000004][2. 04/91/0000000004

            //////////////////////////////////////////////////////////////
            // verifica que los 3 asientos hayan sido descontabilizados //
            //////////////////////////////////////////////////////////////

            // asiento principal
               xCia     := DMCNT.cdsQry2.FieldByName('CIAID').AsString;
               xTDiario := DMCNT.cdsQry2.FieldByName('TDIARID').AsString;
               xAnoMes  := DMCNT.cdsQry2.FieldByName('ECANOMM').AsString;
               xNroComp := DMCNT.cdsQry2.FieldByName('ECNOCOMP').AsString;

               xWhere   := ' CIAID='+quotedstr(xCia)
                          +'   and TDIARID='+quotedstr(xTDiario)
                          +'   and CNTANOMM='+quotedstr(xAnoMes)
                          +'   and CNTCOMPROB='+quotedstr(xNroComp);
               if DMCNT.DisplayDescrip('PrvTGE','CNT300','CNTESTADO',xWhere,'CNTESTADO')<>'P' then
               begin
                  ShowMessage('Asiento CIA='+xCia+', Diario='+xTDiario+', Año+Mes='+xAnoMes+', NroComp='+xNroComp+chr(13)
                             +' no ha sido descontabilizado ');
                  exit;
               end;

            // asiento Cia que desembolsa dinero (Cia='02')
               xCia     := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString,4,2);
               xTDiario := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString,7,2);
               xAnoMes  := xAnoMes;
               xNroComp := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString,10,10);
               xWhere   := ' CIAID='+quotedstr(xCia)
                          +'   and TDIARID='+quotedstr(xTDiario)
                          +'   and CNTANOMM='+quotedstr(xAnoMes)
                          +'   and CNTCOMPROB='+quotedstr(xNroComp);
               if DMCNT.DisplayDescrip('PrvTGE','CNT300','CNTESTADO',xWhere,'CNTESTADO')<>'P' then
               begin
                  ShowMessage('Asiento CIA='+xCia+', Diario='+xTDiario+', Año+Mes='+xAnoMes+', NroComp='+xNroComp+chr(13)
                             +' no ha sido descontabilizado ');
                  exit;
               end;

            // asiento auxiliar q realiza el ingreso de dinero para el pago (TDiario='91')
               xCia     := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString,25,2);
               xTDiario := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString,28,2);
               xAnoMes  := xAnoMes;
               xNroComp := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString,31,10);
               xWhere   := ' CIAID='+quotedstr(xCia)
                          +'   and TDIARID='+quotedstr(xTDiario)
                          +'   and CNTANOMM='+quotedstr(xAnoMes)
                          +'   and CNTCOMPROB='+quotedstr(xNroComp);
               if DMCNT.DisplayDescrip('PrvTGE','CNT300','CNTESTADO',xWhere,'CNTESTADO')<>'P' then
               begin
                  ShowMessage('Asiento CIA='+xCia+', Diario='+xTDiario+', Año+Mes='+xAnoMes+', NroComp='+xNroComp+chr(13)
                             +' no ha sido descontabilizado ');
                  exit;
               end;

            ////////////////////////////////////////////////////////////////////////
            // Elimina los movimientos contables y marca de cabecera del CAJA302  //
            ////////////////////////////////////////////////////////////////////////

            // asiento principal, el que ve el usuario en forma operativa
               xCia     := DMCNT.cdsQry2.FieldByName('CIAID').AsString;
               xTDiario := DMCNT.cdsQry2.FieldByName('TDIARID').AsString;
               xAnoMes  := DMCNT.cdsQry2.FieldByName('ECANOMM').AsString;
               xNroComp := DMCNT.cdsQry2.FieldByName('ECNOCOMP').AsString;
            // borra movimientos del detalle temporal del asiento
               xSQL := 'delete from CNT311 '
                      +' where CIAID='+quotedstr(xCia)
                      +'   and TDIARID='+quotedstr(xTDiario)
                      +'   and CNTANOMM='+quotedstr(xAnoMes)
                      +'   and CNTCOMPROB='+quotedstr(xNroComp);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;
            // borra movimientos de la cabecera del asiento
               xSQL := 'delete from CNT300 '
                      +' where CIAID='+quotedstr(xCia)
                      +'   and TDIARID='+quotedstr(xTDiario)
                      +'   and CNTANOMM='+quotedstr(xAnoMes)
                      +'   and CNTCOMPROB='+quotedstr(xNroComp);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;
            // borra voucher de Caja
               xSQL := 'delete from CAJA304 '
                      +'where CIAID='+quotedstr(xCia)
                      +'  and TDIARID='+quotedstr(xTDiario)
                      +'  and ECANOMM='+quotedstr(xAnoMes)
                      +'  and ECNOCOMP='+quotedstr(xNroComp);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;
            // actualiza cabecera de Caja
               xSQL := 'update CAJA302 set ECCONTA='+quotedstr('N')
                      +' where CIAID='+quotedstr(xCia)
                      +'   and TDIARID='+quotedstr(xTDiario)
                      +'   and ECANOMM='+quotedstr(xAnoMes)
                      +'   and ECNOCOMP='+quotedstr(xNroComp);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;

///////////////
            // asiento Cia que desembolsa dinero (Cia='02')
               xCia     := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString,4,2);
               xTDiario := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString,7,2);
               xAnoMes  := xAnoMes;
               xNroComp := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString,10,10);
            // borra movimientos del detalle temporal del asiento
               xSQL := 'delete from CNT311 '
                      +' where CIAID='+quotedstr(xCia)
                      +'   and TDIARID='+quotedstr(xTDiario)
                      +'   and CNTANOMM='+quotedstr(xAnoMes)
                      +'   and CNTCOMPROB='+quotedstr(xNroComp);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;
            // borra movimientos de la cabecera del asiento
               xSQL := 'delete from CNT300 '
                      +' where CIAID='+quotedstr(xCia)
                      +'   and TDIARID='+quotedstr(xTDiario)
                      +'   and CNTANOMM='+quotedstr(xAnoMes)
                      +'   and CNTCOMPROB='+quotedstr(xNroComp);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;
            // borra voucher de Caja
               xSQL := 'delete from CAJA304 '
                      +'where CIAID='+quotedstr(xCia)
                      +'  and TDIARID='+quotedstr(xTDiario)
                      +'  and ECANOMM='+quotedstr(xAnoMes)
                      +'  and ECNOCOMP='+quotedstr(xNroComp);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;
            // actualiza cabecera de Caja
               xSQL := 'delete from CAJA302 '
                      +' where CIAID='+quotedstr(xCia)
                      +'   and TDIARID='+quotedstr(xTDiario)
                      +'   and ECANOMM='+quotedstr(xAnoMes)
                      +'   and ECNOCOMP='+quotedstr(xNroComp);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;

///////////////
            // asiento auxiliar q realiza el ingreso de dinero para el pago (TDiario='91')
               xCia     := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString,25,2);
               xTDiario := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString,28,2);
               xAnoMes  := xAnoMes;
               xNroComp := copy(DMCNT.cdsQry2.FieldByName('ECPERREC').AsString,31,10);
            // borra movimientos del detalle temporal del asiento
               xSQL := 'delete from CNT311 '
                      +' where CIAID='+quotedstr(xCia)
                      +'   and TDIARID='+quotedstr(xTDiario)
                      +'   and CNTANOMM='+quotedstr(xAnoMes)
                      +'   and CNTCOMPROB='+quotedstr(xNroComp);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;
            // borra movimientos de la cabecera del asiento
               xSQL := 'delete from CNT300 '
                      +' where CIAID='+quotedstr(xCia)
                      +'   and TDIARID='+quotedstr(xTDiario)
                      +'   and CNTANOMM='+quotedstr(xAnoMes)
                      +'   and CNTCOMPROB='+quotedstr(xNroComp);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;
            // borra voucher de Caja
               xSQL := 'delete from CAJA304 '
                      +'where CIAID='+quotedstr(xCia)
                      +'  and TDIARID='+quotedstr(xTDiario)
                      +'  and ECANOMM='+quotedstr(xAnoMes)
                      +'  and ECNOCOMP='+quotedstr(xNroComp);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;
            // actualiza cabecera de Caja
               xSQL := 'delete from CAJA302 '
                      +' where CIAID='+quotedstr(xCia)
                      +'   and TDIARID='+quotedstr(xTDiario)
                      +'   and ECANOMM='+quotedstr(xAnoMes)
                      +'   and ECNOCOMP='+quotedstr(xNroComp);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;

///////////////

//////////////////////////////////////////
            end
            else // si el voucher de caja es único
            begin
            // borra movimientos del detalle temporal del asiento
               xSQL := 'delete from CNT311 '
                      +' where CIAID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
                      +'   and TDIARID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
                      +'   and CNTANOMM='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
                      +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;
            // borra movimientos de la cabecera del asiento
               xSQL := 'delete from CNT300 '
                      +' where CIAID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
                      +'   and TDIARID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
                      +'   and CNTANOMM='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
                      +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;
            // borra voucher de Caja
               xSQL := 'delete from CAJA304 '
                      +'where CIAID='+quotedstr(xCia)
                      +'  and TDIARID='+quotedstr(xTDiario)
                      +'  and ECANOMM='+quotedstr(xAnoMes)
                      +'  and ECNOCOMP='+quotedstr(xNroComp);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;
            // actualiza cabecera de Caja
               xSQL := 'update CAJA302 set ECCONTA='+quotedstr('N')
                      +' where CIAID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
                      +'   and TDIARID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
                      +'   and ECANOMM='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
                      +'   and ECNOCOMP='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
               try
                  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
               except
               end;
               ShowMessage('Comprobante Eliminado') ;
               FRegistro.GComprobante.RefreshFilter;
               DMCNT.ActualizaFiltro(FRegistro.GComprobante,DMCNT.cdsCabCNT,'E');
            end;
         end
         else // si es de Caja y no está en CAJA302
         begin
            ShowMessage('Aún no se puede eliminar automáticamente este tipo de asiento de Caja');
            exit;
         end;
      end; // FIN CAJA

   // Cuentas por Pagar
      if DMCNT.cdsCabCnt.FieldByName('MODULO').AsString='CXP' then
      begin
         xSQL := 'update CXP301 set CP_CONTA='+quotedstr('N')
                +' where CIAID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
                +'   and TDIARID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
                +'   and CPANOMES='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
                +'   and CPNOREG='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         except
         end;

         xSQL := 'delete from CNT311 '
                +' where CIAID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
                +'   and TDIARID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
                +'   and CNTANOMM='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
                +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         except
         end;

         xSQL := 'delete from CNT300 '
                +' where CIAID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CIAID').AsString)
                +'   and TDIARID='+quotedstr(DMCNT.cdsCabCnt.FieldByName('TDIARID').AsString)
                +'   and CNTANOMM='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTANOMM').AsString)
                +'   and CNTCOMPROB='+quotedstr(DMCNT.cdsCabCnt.FieldByName('CNTCOMPROB').AsString);
         try
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
         except
         end;
         ShowMessage('Comprobante Eliminado') ;
         DMCNT.ActualizaFiltro(FRegistro.GComprobante,DMCNT.cdsCabCNT,'E');
         FRegistro.GComprobante.RefreshFilter;
      end; // FIN CTAS X PAGAR

      if ( DMCNT.cdsCabCnt.FieldByName('MODULO').AsString<>'CXP' ) and
         ( DMCNT.cdsCabCnt.FieldByName('MODULO').AsString<>'PL'  ) and
         ( DMCNT.cdsCabCnt.FieldByName('MODULO').AsString<>'CAJA') then
      begin
         ShowMessage('Aún no se puede eliminar automáticamente este tipo de asiento, Módulo:'+DMCNT.cdsCabCnt.FieldByName('MODULO').AsString);
         exit;
      end;
   end;

end;

procedure TFToolComprobante.Z2sbPlanillasClick(Sender: TObject);
begin
   Try
      FPlanilla:=TFPlanilla.Create(Self);
      FPlanilla.ShowModal;
   Except
   End;
   FPlanilla.Free;
end;

end.
