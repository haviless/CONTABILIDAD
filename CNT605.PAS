unit CNT605;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit,
  wwdblook, Buttons, wwdbdatetimepicker, Spin;

type
  TFAsMecCaja = class(TForm)
    pnlCabecera: TPanel;
    Label3: TLabel;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dbeAnoMM: TwwDBEdit;
    pnlDetalle: TPanel;
    Label1: TLabel;
    dbgDocCaja: TwwDBGrid;
    pnlPie: TPanel;
    Label4: TLabel;
    pnlGenera: TPanel;
    pbGenera: TProgressBar;
    btnGenAsMec: TButton;
    rgMod: TRadioGroup;
    pnlNoReg: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label5: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    bbtnOkReg: TBitBtn;
    bbtnCancReg: TBitBtn;
    meNoReg1: TMaskEdit;
    meNoReg2: TMaskEdit;
    pnlFecha: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    bbtnOkFec: TBitBtn;
    bbtnCancFec: TBitBtn;
    dbdtpFReg2: TwwDBDateTimePicker;
    dbdtpFReg1: TwwDBDateTimePicker;
    Label2: TLabel;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    Label7: TLabel;
    Label15: TLabel;
    procedure dblcCiaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure dbgDocCajaMultiSelectRecord(Grid: TwwDBGrid;
      Selecting: Boolean; var Accept: Boolean);
    procedure btnGenAsMecClick(Sender: TObject);
    procedure meNoReg1Exit(Sender: TObject);
    procedure meNoReg2Exit(Sender: TObject);
    procedure bbtnCancRegClick(Sender: TObject);
    procedure bbtnOkRegClick(Sender: TObject);
    procedure dbdtpFReg2Exit(Sender: TObject);
    procedure bbtnOkFecClick(Sender: TObject);
    procedure bbtnCancFecClick(Sender: TObject);
    procedure PnlsEnabled(PVal:Boolean);
    procedure rgModClick(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure speMMExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAsMecCaja: TFAsMecCaja;
  Year, Month, Day: Word;
  xwhere, anomm, wMes : string;
  nn, nreg: integer;

implementation

uses CNTDM;

{$R *.DFM}

/// Generación de Asientos Mecanizados: Trabaja con tablas de diferentes BD's
/// y aun no se ha establecido el formato para accesarlas desde un SQL
/// EN CONSTRUCCION
procedure TFAsMecCaja.FormActivate(Sender: TObject);
begin
   nreg:=0;
   nn:=0;
   DM1.cdsDetCaja.Active:=True;
//   DM1.cdsMovCaja.IndexFieldNames :='CiaId;TDiarId;ECAnoMM;ECNoComp';
//   DM1.cdsDetCaja.IndexFieldNames :='CiaId;TDiarId;DCPAnoMM;CPNoReg';   //Busca si ya esta en DetCaja
   DM1.cdsMovCnt2.IndexFieldNames:='CiaId;ClAuxId;AuxId;DocId;CNTSerie;CNTNoDoc';

//   DM1.cdsMovCaja.Filter:='CiaId='+''''+''+'''';
//   DM1.cdsMovCaja.Filtered:=True;
// calcula valor de periodo aaaamm tomando como base la fecha del sistema
   DecodeDate(DATE, Year, Month, Day);
   speAno.Value:=Year;
   speMM.Value:=Month;
   dblcCia.SetFocus;
end;

procedure TFAsMecCaja.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DM1.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   end;
   speMMExit(Sender);
end;

procedure TFAsMecCaja.bbtnOkClick(Sender: TObject);
Var
   xFecha: TDate;
   xFiltro, PerCie: String;
begin
   if edtCia.Text='' then
   begin
      ShowMessage('Compañia no válida');
      raise exception.Create('Compañia no válida');
   end ;

   if length(dbeAnoMM.Text)<>6 then
   begin
     ShowMessage('Periodo no válido');
     raise exception.Create('Periodo no válido');
   end ;

   PerCie:='PER'+wMes;

///Valida Periodo Cerrado... Inicio///
   xWhere :='CIAID='+''''+dblcCia.Text+''''
           +' and MODULO='+''''+'CNT'+''''
           +' and ANO='+''''+inttostr(speAno.Value)+'''';
   if (DM1.DisplayDescrip('PrvTGE','TGE154','*',xWhere,PERCIE))='C' then
   begin
        ShowMessage('Periodo Cerrado, no válido');
        exit;
   end;
///Valida Periodo Cerrado... Fin  ///

   xFiltro:='CIAID='+''''+dblcCia.Text+''''
                    +' and ECANOMM='+''''+dbeAnoMM.Text+'''';
//                  +' and ECConta='+''''+'S'+'''';

   xFecha:=DM1.cdsQry.FieldByName('FECCIERRE').AsDateTime;
   if xFecha<>0 then begin
      DecodeDate(xFecha, Year, Month, Day);
      wMes := inttostr(Month);
      if Month<10 then wMes := '0'+inttostr(Month);
      if strtoint(wMes) = (strtoint(Copy(PerCie,4,2))-1) then    // Fecha de Cierre no fue actualizada en Cierres
      begin
        Showmessage('Al verificar Periodo Activo y Fecha de cierre, se detectaron '+chr(13)
                   +'datos no válidos...  Revise la opción de Cierre Operativo');
        exit;
      end;

      xFiltro:=xFiltro+' and ECPFCOMP>'+''''+datetostr(xFecha)+'''';
   end;

   With DM1 do Begin
      cdsMovCaja.close;
      cdsMovCaja.open;
      cdsMovCaja.Filter:='';
      cdsMovCaja.Filter:=xFiltro;
      cdsMovCaja.Filtered:=True;
      if cdsMovCaja.RecordCount = 0 then begin
         ShowMessage(' No existen registros contabilizados para este periodo'+chr(13)
                    +'                   en el Módulo de Caja');
         pnlDetalle.Enabled:=False;
         pnlPie.Enabled:=False;
         exit;
      end
      else begin
         pnlDetalle.Enabled:=True;
         pnlPie.Enabled:=True;
         rgMod.ItemIndex:=1;    // Inicializa RadioGroup en Parcial
         dbgDocCaja.SetFocus;
//         rgModClick(Sender);
      end;
   End;

end;

procedure TFAsMecCaja.dbgDocCajaMultiSelectRecord(Grid: TwwDBGrid;
  Selecting: Boolean; var Accept: Boolean);
begin
   if nreg > 0 then begin
      Accept := False;
   end;
end;

procedure TFAsMecCaja.btnGenAsMecClick(Sender: TObject);
Var
   n, i, Cont: SmallInt;
   iWhere, iWhere2, dWhere, dWhere2 : String;
   iWhere3, dWhere3, iSQL, dSQL, wSQL: WideString;
begin
  With DM1 do Begin
   if rgMod.ItemIndex=0 then begin   // Total
      Cont:=cdsMovCaja.RecordCount;
      /// si selecciono Total y desmarco algun registro===> Selec Todo
      if Cont <> dbgDocCaja.SelectedList.Count then dbgDocCaja.SelectAll;
   end
   else Cont:=dbgDocCaja.SelectedList.Count;                // Parcial

   if Cont = 0 then
   begin
      ShowMessage('Seleccione por lo menos un registro');
      raise exception.Create('Seleccione por lo menos un registro');
   end ;

   if MessageDlg('Generación de Asientos Mecanizados desde el'+chr(13)+
                 '               Módulo de Caja'+chr(13)+
                 '                  ¿  Continua  ?  ',mtConfirmation, [mbYes, mbNo], 0)<>mrYes
   then exit;

   btnGenAsMec.Visible:=False;
   pnlGenera.Visible:=True;
   pbGenera.Min:= 0;
   pbGenera.Max:= Cont+8;
   pbGenera.Step:= 1;
   n:=1;
   dWhere2:='';
   dWhere3:='';
   iWhere2:='';
   iWhere3:='';

   dWhere:='CIAID='+''''+dblcCia.Text+''''
            +' and CNTANOMM='+''''+dbeAnoMM.Text+''''
            +' and CNTFMEC='+''''+'S'+'''';             // Asientos Mecanizados

   if rgMod.ItemIndex=1 then dWhere:=dWhere+' and ';    // Parcial
   if rgMod.ItemIndex=2 then
      dWhere:=dWhere+' and TDIARID='+''''+dblcTDiario.Text+''''
                    +' and CNTCOMPROB>='+''''+meNoReg1.Text+''''
                    +' and CNTCOMPROB<='+''''+meNoReg2.Text+'''';
   if rgMod.ItemIndex=3 then
      dWhere:=dWhere+' and CNTFCOMP>='+''''+datetostr(dbdtpFReg1.Date)+''''
                    +' and CNTFCOMP<='+''''+datetostr(dbdtpFReg2.Date)+'''';

   dSQL:='Delete From CNT301 Where '+dWhere;
   /// CNT301Caja archivo de trabajo temporal para Gen As Mec desde Caja
   /// quizas no es necesario toda la lista de campos Destino
   iSQL:='Insert Into CNT301CAJA(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, '
        +'CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, '
        +'CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
        +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, '
        +'CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, '
        +'FLAGVAR, FCONS, CNTFMEC) '
        +'Select a.CIAID, a.TDIARID, a.ECNOCOMP, a.DCANO, a.ECANOMM, a.DCLOTE, '
        +'a.CUENTAID, a.ClAUXID, a.DCAUXID, a.DOCID, a.DCSERIE, a.DCNODOC, a.DCGLOSA, a.DCDH, '
        +'a.CCOSID, a.DCTCAMPR, a.DCMTOORI, a.DCMTOLO, a.DCMTOEXT, a.DCFEMIS, a.DCFVCMTO, '
        +'a.ECFCOMP, a.DCESTADO, a.DCFLACDR, a.DCFLAAUT, '
///  OJO Asi deberia quedar  ////
///        +''''+wUsuario+''''+', '+''''+datetostr(date)+''''+', '+''''+timetostr(time)+''''+', '
        +'a.DCUSER, a.DCFREG, a.DCHREG, '      /// asi no debe ser... temporal
        +'a.DCMM, a.DCDD, a.DCTRI, a.DCSEM, a.DCSS, a.DCAATRI, a.DCAASEM, a.DCAASS, a.TMONID, '
        +''''+'XX'+''''+', '+''''+'X'+''''+', '+''''+'S'+''''+' '
        +'From CAJA304 a Where ';

   iWhere:='a.CIAID='+''''+dblcCia.Text+''''           // Cualquier Modalidad
          +' and a.ECANOMM='+''''+dbeAnoMM.Text+'''';

   if rgMod.ItemIndex=1 then iWhere:=iWhere+' and ';   // Parcial
   if rgMod.ItemIndex=2 then                           // Por No.Registro
      iWhere:=iWhere+' and a.TDIARID='+''''+dblcTDiario.Text+''''
                    +' and a.ECNOCOMP>='+''''+meNoReg1.Text+''''
                    +' and a.ECNOCOMP<='+''''+meNoReg2.Text+'''';
   if rgMod.ItemIndex=3 then                           // Por Fecha Comprob.
      iWhere:=iWhere+' and ECFCOMP>='+''''+datetostr(dbdtpFReg1.Date)+''''
                    +' and ECFCOMP<='+''''+datetostr(dbdtpFReg2.Date)+'''';

   iSQL:=iSQL+iWhere;

   cdsMovCaja.DisableControls;
   if rgMod.ItemIndex=1 then begin          // Modalidad Parcial
      for i:=0 to dbgDocCaja.SelectedList.Count-1 do begin
         pbGenera.Position:=n;
         dbgDocCaja.Datasource.Dataset.GotoBookmark(dbgDocCaja.SelectedList.items[i]);
         dWhere2:='TDIARID='+''''+cdsMovCaja.FieldByName('TDIARID').AsString+''''
                 +' and CNTCOMPROB='+''''+cdsMovCaja.FieldByName('ECNOCOMP').AsString+'''';
         iWhere2:='a.TDIARID='+''''+cdsMovCaja.FieldByName('TDIARID').AsString+''''
                 +' and a.ECNOCOMP='+''''+cdsMovCaja.FieldByName('ECNOCOMP').AsString+'''';
         dWhere3:=dWhere3+'('+dWhere2+')';
         iWhere3:=iWhere3+'('+iWhere2+')';
         if not (i=dbgDocCaja.SelectedList.Count-1) then begin
            dWhere3:=dWhere3+' or ';
            iWhere3:=iWhere3+' or ';
         end;
         n:=n+1;
      end;
      dSQL:=dSQL + '('+dWhere3+')';        // Delete
      iSQL:=iSQL + '('+iWhere3+')';        // Insert
   end
   else begin                              // El resto
      for i:=0 to Cont-1 do begin
         pbGenera.Position:=n;
         n:=n+1;
      end;
      iSQL:=iSQL+' and a.DCFLACDR='+''''+'S'+'''';   // Solo inserta Contab = Con cuadre
   end;
   cdsMovCaja.EnableControls;
   DCOM1.AppServer.EjecutaQry(dSQL);   // Borra
   n:=n+1;
   pbGenera.Position:=n;
   DCOM1.AppServer.EjecutaQry(iSQL);   // Inserta en archivo temporal CNT301Caja
   n:=n+1;
   pbGenera.Position:=n;

   // Actualiza
   wSQL:='UPDATE CNT301Caja Set '
        +'CLAUXID='+''''+''+''''+', AUXID='+''''+''+''''+' Where '+''''+'N'+''''+' IN '
        +'(Select CTA_AUX from TGE202 Where CNT301Caja.CUENTAID=TGE202.CUENTAID)';
   DCOM1.AppServer.EjecutaQry(wSQL);   // Actualiza (valida) archivo temporal
   n:=n+1;
   pbGenera.Position:=n;

   wSQL:='UPDATE CNT301Caja Set '
        +'DOCID='+''''+''+''''+', CNTSERIE='+''''+''+''''+', CNTNODOC='+''''+''+''''+' Where '+''''+'N'+''''+' IN '
        +'(Select CTA_DOC from TGE202 Where CNT301Caja.CUENTAID=TGE202.CUENTAID) ';
   DCOM1.AppServer.EjecutaQry(wSQL);   // Actualiza (valida) archivo temporal
   n:=n+1;
   pbGenera.Position:=n;

   wSQL:='UPDATE CNT301Caja Set '
        +'CCOSID='+''''+''+''''+' Where '+''''+'N'+''''+' IN '
        +'(Select CTA_CCOS from TGE202 Where CNT301Caja.CUENTAID=TGE202.CUENTAID) ';
   DCOM1.AppServer.EjecutaQry(wSQL);   // Actualiza (valida) archivo temporal
   n:=n+1;
   pbGenera.Position:=n;

{   ////  OJO, OJO, OJO ........ PROBAR EN OS/400 R430 ........ OJO, OJO, OJO  ////
        +'CtaDes=(select tge202.ctaabr from tge202 '
        +'Where CNT301Caja.cuentaid=tge202.cuentaid), '
        +'AuxDes=(select cnt201.auxabr from cnt201 '
        +'Where CNT301Caja.auxid=cnt201.auxid '
        +'and CNT301Caja.clauxid=cnt201.clauxid), '
        +'DocDes=(select tge110.docabr from tge110 '
        +'Where CNT301Caja.docid=tge110.docid and tge110.docmod='+''''+'CJA'+''''+'), '
        +'CCosDes=(select tge203.ccosabr from tge203 '
        +'Where CNT301Caja.ccosid=tge203.ccosid), '
        +'TDiarDes=(select tge104.tdiarabr from tge104 '
        +'Where CNT301Caja.tdiarid=tge104.tdiarid), '
        +'CntDebeMn=(CASE cntdh When '+''''+'D'+''''+' then CntMtoLoc end), '
        +'CntDebeMe=(CASE cntdh When '+''''+'D'+''''+' then CntMtoExt end), '
        +'CntHabeMn=(CASE cntdh When '+''''+'H'+''''+' then CntMtoLoc end), '
        +'CntHabeMe=(CASE cntdh When '+''''+'H'+''''+' then CntMtoExt end)';

   DCOM1.AppServer.EjecutaQry(wSQL);   // Actualiza (valida) archivo temporal
   n:=n+1;
   pbGenera.Position:=n;}

   wSQL:='Insert into CNT301 Select * from CNT301Caja';
   DCOM1.AppServer.EjecutaQry(wSQL);   // Inserta registros actualizados
   n:=n+1;
   pbGenera.Position:=n;

   wSQL:='Delete From CNT301Caja';
//   DCOM1.AppServer.EjecutaQry(wSQL);   // Clarea archivo temporal
   n:=n+1;
   pbGenera.Position:=n;

   ShowMessage('Proceso Concluido con Exito');

//   cdsMovCnt2.ApplyUpdates( 0 );
   cdsMovCaja.CancelUpdates;

{  // Refresca Query
   wSQL := 'Select * from CNT301';
   cdsMovCnt2.Close;
   cdsMovCnt2.Provider.DataRequest(wSQL);
   cdsMovCnt2.Open;

   cdsMovCnt.Close;
   cdsMovCnt.Provider.DataRequest(wSQL);
   cdsMovCnt.Open;}

   bbtnCanc.Click;
// OJO: Problemas al salir.... ===>'Reiniciar' CDSMOVCaja
  End;
end;

procedure TFAsMecCaja.meNoReg1Exit(Sender: TObject);
begin
     meNoReg1.Text:=DM1.StrZero(meNoReg1.Text,10);
end;

procedure TFAsMecCaja.meNoReg2Exit(Sender: TObject);
begin
     meNoReg2.Text:=DM1.StrZero(meNoReg2.Text,10);
end;

procedure TFAsMecCaja.bbtnCancRegClick(Sender: TObject);
begin
    pnlNoReg.Visible:=False;
    PnlsEnabled(True);
    rgMod.ItemIndex:=1;
end;

procedure TFAsMecCaja.bbtnOkRegClick(Sender: TObject);
begin
   nreg:=0;
   nn:=0;
   if (edtTDiario.Text='') or (meNoReg1.Text='') or (meNoReg2.Text='') then
   begin
       ShowMessage('Información Incompleta... faltan datos');
       raise exception.Create('Información Incompleta... faltan datos');
   end ;
   With DM1 do Begin
     cdsMovCaja.DisableControls;
     cdsMovCaja.First;
     While not cdsMovCaja.Eof do Begin
       if (dblcTDiario.Text = cdsMovCaja.FieldByName('TDIARID').AsString) then begin
          if  (cdsMovCaja.FieldByName('ECNOCOMP').AsString >= meNoReg1.Text)
          and (cdsMovCaja.FieldByName('ECNOCOMP').AsString <= meNoReg2.Text) then begin
             nn:=nn+1;
             dbgDocCaja.SelectRecord;
          end;
       end;
       cdsMovCaja.Next;
     end;
     cdsMovCaja.EnableControls;
   End;
   pnlNoReg.Visible:=False;
   PnlsEnabled(True);
   nreg:=nn;
   if nreg = 0 then rgMod.ItemIndex:=1;
end;

procedure TFAsMecCaja.PnlsEnabled(PVal:Boolean);
begin
   pnlCabecera.Enabled:=PVal;
   pnlDetalle.Enabled :=PVal;
   pnlPie.Enabled     :=PVal;
end;

procedure TFAsMecCaja.dbdtpFReg2Exit(Sender: TObject);
begin
   if dbdtpFReg2.Date < dbdtpFReg1.Date then begin
      ShowMessage('   Fecha no válida   ');
      dbdtpFReg2.SetFocus;
   end;
end;

procedure TFAsMecCaja.bbtnOkFecClick(Sender: TObject);
begin
   nreg:=0;
   nn:=0;
   if (dbdtpFReg1.Date=0) or (dbdtpFReg2.Date=0) then
   begin
      ShowMessage('Información Incompleta... faltan datos');
      raise exception.Create('Información Incompleta... faltan datos');
   end ;
   With DM1 do Begin
     cdsMovCaja.DisableControls;
     cdsMovCaja.First;
     While not cdsMovCaja.Eof do Begin
       if (cdsMovCaja.FieldByName('ECFCOMP').AsDateTime >= dbdtpFReg1.Date)
        and (cdsMovCaja.FieldByName('ECFCOMP').AsDateTime <= dbdtpFReg2.Date) then begin
             nn:=nn+1;
             dbgDocCaja.SelectRecord;
       end;
       cdsMovCaja.Next;
     end;
     cdsMovCaja.EnableControls;
   End;
   pnlFecha.Visible:=False;
   PnlsEnabled(True);
   nreg:=nn;
   if nreg = 0 then rgMod.ItemIndex:=1;
//   dbgDocCaja.Options:=dbgDocCaja.Options-[Wwdbigrd.dgRowSelect];
end;

procedure TFAsMecCaja.bbtnCancFecClick(Sender: TObject);
begin
    pnlFecha.Visible:=False;
    PnlsEnabled(True);
    rgMod.ItemIndex:=1;
end;

procedure TFAsMecCaja.rgModClick(Sender: TObject);
begin
   if (rgMod.ItemIndex=0) or (rgMod.ItemIndex=1) then begin
     nreg:=0;
     if rgMod.ItemIndex=0 then dbgDocCaja.SelectAll
     else dbgDocCaja.UnselectAll;
     dbgDocCaja.SetFocus;
   end;
   if (rgMod.ItemIndex=2) or (rgMod.ItemIndex=3) then begin
      dbgDocCaja.UnselectAll;
      PnlsEnabled(False);
      if rgMod.ItemIndex=2 then pnlNoReg.Visible:=True
      else pnlFecha.Visible:=True;
   end;
end;

procedure TFAsMecCaja.dblcTDiarioExit(Sender: TObject);
begin
   edtTDiario.Text:='';
   if dblcTDiario.Text<>'' then edtTDiario.Text:=DM1.cdsTDiario.FieldByName('TDIARDES').AsString;
   if length(edtTDiario.Text)=0 then
   begin
        ShowMessage('Falta Definición de Tipo de Diario');
        dblcTDiario.SetFocus;
   end;
end;

procedure TFAsMecCaja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DM1.cdsMovCaja.IndexFieldNames :='';
   DM1.cdsMovCnt2.IndexFieldNames:='';
end;

procedure TFAsMecCaja.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFAsMecCaja.speMMExit(Sender: TObject);
begin
   if (speMM.Value>12) or (speMM.Value<1) then begin
      speMM.SetFocus;
      exit;
   end;
   wMes := inttostr( speMM.Value );
   if speMM.Value<10 then wMes:= '0'+inttostr(speMM.Value);
   dbeAnoMM.text :=inttostr( speAno.Value) + wMes;
end;

end.
