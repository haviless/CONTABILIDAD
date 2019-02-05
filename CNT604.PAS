unit CNT604;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit,
  wwdblook, Buttons, wwdbdatetimepicker, Spin;

type
  TFAsMecRRHH = class(TForm)
    pnlCabecera: TPanel;
    pnlDetalle: TPanel;
    Label1: TLabel;
    dbgDocRRHH: TwwDBGrid;
    pnlPie: TPanel;
    Label4: TLabel;
    pnlGenera: TPanel;
    pbGenera: TProgressBar;
    btnGenAsMec: TButton;
    rgMod: TRadioGroup;
    pnlInfoAd: TPanel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    meTCambio: TMaskEdit;
    meNoReg: TMaskEdit;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    bbtnOkIc: TBitBtn;
    bbtnCancIc: TBitBtn;
    meLote: TMaskEdit;
    pnlFecha: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    bbtnOkFec: TBitBtn;
    bbtnCancFec: TBitBtn;
    dbdtpFReg2: TwwDBDateTimePicker;
    dbdtpFReg1: TwwDBDateTimePicker;
    dbdtpFComp: TwwDBDateTimePicker;
    Label14: TLabel;
    edtGlosa: TEdit;
    Label15: TLabel;
    Label3: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    speAno: TSpinEdit;
    Label2: TLabel;
    speMM: TSpinEdit;
    Label16: TLabel;
    Label17: TLabel;
    dbeAnoMM: TwwDBEdit;
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure meNoRegExit(Sender: TObject);
    procedure bbtnOkIcClick(Sender: TObject);
    procedure meLoteExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure dbdtpFReg2Exit(Sender: TObject);
    procedure bbtnCancFecClick(Sender: TObject);
    procedure bbtnOkFecClick(Sender: TObject);
    procedure bbtnCancIcClick(Sender: TObject);
    procedure btnGenAsMecClick(Sender: TObject);
    procedure PnlsEnabled(PVal:Boolean);
    procedure rgModClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GenAsMec;
    procedure edtGlosaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure speMMExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAsMecRRHH: TFAsMecRRHH;
  Year, Month, Day: Word;
  wTDoc, xwhere, wMes : string;
  nn, nreg: integer;
  Cont: SmallInt;

implementation

uses CNTDM;

{$R *.DFM}


procedure TFAsMecRRHH.FormActivate(Sender: TObject);
begin
   nreg:=0;
   nn:=0;
   DM1.cdsMovRRHH.Active:=True;
//   DM1.cdsMovRRHH.IndexFieldNames :='CiaId;TDiarId;CPAnoMes;CPNoReg';
   DM1.cdsMovCnt2.IndexFieldNames:='CiaId;ClAuxId;AuxId;DocId;CNTSerie;CNTNoDoc';

//   DM1.cdsMovRRHH.Refresh;
   DM1.cdsMovRRHH.Filter:='CiaId='+''''+''+'''';
   DM1.cdsMovRRHH.Filtered:=True;
// calcula valor de periodo aaaamm tomando como base la fecha del sistema
   DecodeDate(DATE, Year, Month, Day);
   speAno.Value:=Year;
   speMM.Value:=Month;

   ///////////  Busca TDocId
   DM1.cdsTDoc.Filter:='';
   DM1.cdsTDoc.Filter:='DOC_FREG='+''''+'R'+'''' // TDocum Planillas
                      +' and DOCMOD='+''''+'RH'+'''';
   DM1.cdsTDoc.Filtered:=True;
   if DM1.cdsTDoc.RecordCount>0 then
     begin
       if DM1.cdsTDoc.RecordCount>1 then
        begin
          ShowMessage('Ojo: Existe mas de un registro tipo R - Planilla');
          // Pide eleccion de FReg 'R' que existan en TDoc (TGE110)
        end;
       wTDoc := DM1.cdsTDoc.FieldByname('DOCoID').AsString;
   end
   else begin
      ShowMessage('Tipos de Documento no registra definicion de Planilla');
      // Forma de Registro (R) no definido en tabla TDocum(TGE110)     ¿?
      // Salir del Programa
   end;
   DM1.cdsTDoc.Filtered:=False;

   dblcCia.SetFocus;
end;

procedure TFAsMecRRHH.dblcCiaExit(Sender: TObject);
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

procedure TFAsMecRRHH.bbtnOkClick(Sender: TObject);
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
           +' and ASIANOMM='+''''+dbeAnoMM.Text+'''';

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

      xFiltro:=xFiltro+' and ASIFECHA>'+''''+datetostr(xFecha)+'''';
   end;

   With DM1 do Begin
      cdsMovRRHH.Filter:='';
      cdsMovRRHH.Filter:=xFiltro;
      cdsMovRRHH.Filtered:=True;
      if cdsMovRRHH.RecordCount = 0 then begin
         ShowMessage(' No existen registros para este periodo'+chr(13)
                    +'      en el Módulo de Planillas');
         pnlDetalle.Enabled:=False;
         pnlPie.Enabled:=False;
         exit;
      end
      else begin
         pnlDetalle.Enabled:=True;
         pnlPie.Enabled:=True;
         rgMod.ItemIndex:=1;    // Inicializa RadioGroup en Parcial
         dbgDocRRHH.SetFocus;
//         rgModClick(Sender);
      end;
   End;
end;

procedure TFAsMecRRHH.dblcTDiarioExit(Sender: TObject);
begin
   edtTDiario.Text:='';
   if dblcTDiario.Text<>'' then edtTDiario.Text:=DM1.cdsTDiario.FieldByName('TDIARDES').AsString;
   if length(edtTDiario.Text)=0 then
   begin
        ShowMessage('Falta Definición de Tipo de Diario');
        dblcTDiario.SetFocus;
   end;
end;

procedure TFAsMecRRHH.meNoRegExit(Sender: TObject);
begin
   meNoReg.Text:=DM1.StrZero(meNoReg.Text,10);
end;

procedure TFAsMecRRHH.meLoteExit(Sender: TObject);
begin
   meLote.Text:=DM1.StrZero(meLote.Text,4);
end;



procedure TFAsMecRRHH.dbdtpFReg2Exit(Sender: TObject);
begin
   if dbdtpFReg2.Date < dbdtpFReg1.Date then begin
      ShowMessage('   Fecha no válida   ');
      dbdtpFReg2.SetFocus;
   end;
end;

procedure TFAsMecRRHH.bbtnCancFecClick(Sender: TObject);
begin
    pnlFecha.Visible:=False;
    PnlsEnabled(True);
    rgMod.ItemIndex:=1;
end;

procedure TFAsMecRRHH.bbtnOkFecClick(Sender: TObject);
begin
   nreg:=0;
   nn:=0;
   if (dbdtpFReg1.Date=0) or (dbdtpFReg2.Date=0) then
   begin
     ShowMessage('Información Incompleta... faltan datos');
     raise exception.Create('Información Incompleta... faltan datos');
   end ;
   With DM1 do Begin
     cdsMovRRHH.DisableControls;
     cdsMovRRHH.First;
     While not cdsMovRRHH.Eof do Begin
       if (cdsMovRRHH.FieldByName('ASIFECHA').AsDateTime >= dbdtpFReg1.Date)
        and (cdsMovRRHH.FieldByName('ASIFECHA').AsDateTime <= dbdtpFReg2.Date) then begin
             nn:=nn+1;
             dbgDocRRHH.SelectRecord;
       end;
       cdsMovRRHH.Next;
     end;
     cdsMovRRHH.EnableControls;
   End;
   pnlFecha.Visible:=False;
   PnlsEnabled(True);
   nreg:=nn;
   if nreg = 0 then rgMod.ItemIndex:=1;
end;


procedure TFAsMecRRHH.PnlsEnabled(PVal:Boolean);
begin
   pnlCabecera.Enabled:=PVal;
   pnlDetalle.Enabled :=PVal;
   pnlPie.Enabled     :=PVal;
end;

procedure TFAsMecRRHH.btnGenAsMecClick(Sender: TObject);
begin
   if rgMod.ItemIndex=0 then begin   // Total
      Cont:=DM1.cdsMovRRHH.RecordCount;
      /// si selecciono Total y desmarco algun registro===> Selec Todo
      if Cont <> dbgDocRRHH.SelectedList.Count then dbgDocRRHH.SelectAll;
   end
   else Cont:=dbgDocRRHH.SelectedList.Count;                // Parcial

   if Cont = 0 then
   begin
     ShowMessage('Seleccione por lo menos un registro');
     raise exception.Create('Seleccione por lo menos un registro');
   end ;

   PnlsEnabled(False);
   pnlInfoAd.Visible:=True;
end;

procedure TFAsMecRRHH.bbtnOkIcClick(Sender: TObject);
begin
   if (edtTDiario.Text='') or (meNoReg.Text='')
     or (meLote.Text='') or (meTCambio.Text='') or (dbdtpFComp.Date=0)
   then
   begin
     ShowMessage('Información Incompleta... faltan datos');
     raise exception.Create('Información Incompleta... faltan datos');
   end ;

   pnlInfoAd.Enabled:=False;
   PnlsEnabled(True);
   GenAsMec;
end;

procedure TFAsMecRRHH.bbtnCancIcClick(Sender: TObject);
begin
    pnlInfoAd.Visible:=False;
    PnlsEnabled(True);
    rgMod.ItemIndex:=1;
end;

procedure TFAsMecRRHH.rgModClick(Sender: TObject);
begin
   if (rgMod.ItemIndex=0) or (rgMod.ItemIndex=1) then begin
     nreg:=0;
     if rgMod.ItemIndex=0 then dbgDocRRHH.SelectAll
     else dbgDocRRHH.UnselectAll;
     dbgDocRRHH.SetFocus;
   end;
   if rgMod.ItemIndex=2 then begin
      dbgDocRRHH.UnselectAll;
      PnlsEnabled(False);
      pnlFecha.Visible:=True;
   end;
end;

procedure TFAsMecRRHH.GenAsMec;
Var
   n, i:  SmallInt;
   wAno, wMM, wDD, wTri, wSem, wSS, wAATri, wAASem, wAASS: String;
   iWhere, iWhere2, dWhere, dWhere2 : String;
   iWhere3, dWhere3, iSQL, dSQL, wSQL: WideString;
begin
  With DM1 do Begin
   if MessageDlg('Generación de Asientos Mecanizados desde el'+chr(13)+
                 '           Módulo de Planillas'+chr(13)+
                 '                ¿  Continua  ?  ',mtConfirmation, [mbYes, mbNo], 0)<>mrYes
   then begin pnlInfoAd.Visible:=False; exit; end;
   pnlInfoAd.Visible:=False;

   xWhere := 'FECHA='+''''+datetostr(dbdtpFComp.date)+'''';
   wAno := DM1.DisplayDescrip('PrvTGE','TGE114','*',xWhere,'FECANO');
   if wAno<>'' then begin
      WMM   := DM1.CDSQRY.FIELDBYNAME('FECMES').VALUE;       // DÍA
      WDD   := DM1.CDSQRY.FIELDBYNAME('FECDIA').VALUE;       // DÍA
      WTRI  := DM1.CDSQRY.FIELDBYNAME('FECTRIM').VALUE;      // TRIMESTRE
      WSEM  := DM1.CDSQRY.FIELDBYNAME('FECSEM').VALUE;      // SEMESTRE
      WSS   := DM1.CDSQRY.FIELDBYNAME('FECSS').VALUE;       // SEMANA
      WAATRI:= DM1.CDSQRY.FIELDBYNAME('FECAATRI').VALUE;    // AÑO+TRIMESTRE
      WAASEM:= DM1.CDSQRY.FIELDBYNAME('FECAASEM').VALUE;    // AÑO+SEMESTRE
      WAASS := DM1.CDSQRY.FIELDBYNAME('FECAASS').VALUE;     // AÑO+SEMANA
   end;

   btnGenAsMec.Visible:=False;
   pnlGenera.Visible:=True;
   pbGenera.Min:= 0;
   pbGenera.Max:= Cont+6;
   pbGenera.Step:= 1;
   n:=1;
   dWhere2:='';   dWhere3:='';
   iWhere2:='';   iWhere3:='';

   dWhere:='CIAID='+''''+dblcCia.Text+''''
            +' and CNTANOMM='+''''+dbeAnoMM.Text+''''
            +' and CNTFMEC='+''''+'S'+'''';            // Asientos Mecanizados

   if rgMod.ItemIndex=1 then dWhere:=dWhere+' and ';   // Parcial... pa delete
   if rgMod.ItemIndex=2 then
      dWhere:=dWhere+' and CNTFCOMP>='+''''+datetostr(dbdtpFReg1.Date)+''''
                    +' and CNTFCOMP<='+''''+datetostr(dbdtpFReg2.Date)+'''';

   dSQL:='Delete From CNT301 Where '+dWhere;
   /// quizas no es necesario toda la lista de campos Destino
   iSQL:='Insert Into CNT301RH(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, '
        +'CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, '
        +'CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
        +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, '
        +'CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, '
        +'FLAGVAR, FCONS, CNTFMEC) '
        +'Select a.CIAID, '+''''+dblcTDiario.Text+''''+', '+''''+meNoReg.Text+''''+', '
        +''''+wAno+''''+', '+'a.ASIANOMM, '+''''+meLote.Text+''''+', '
        +'a.CUENTAID, a.ClAUXID, a.AUXID, '+''''+wTDoc+''''+', '+''''+'0000'+''''+', '
        +'a.ASINODOC, '+''''+edtGlosa.Text+''''+', '+'a.ASIDH, '
        +'a.CCOSID, '+meTCambio.Text+', '+'a.ASIDEBE, '+'a.ASIDEBE, '
        +'a.ASIDEBE*'+meTCambio.Text+', '+'a.ASIFECHA, a.ASIFECHA, '  // Ojo FVcmto
        +''''+dbdtpFComp.Text+''''+', '
        +''''+'P'+''''+', '+''''+'S'+''''+', '+''''+' '+''''+', '  // Ojo estos Flags
///  OJO Asi deberia quedar  ////
///        +''''+wUsuario+''''+', '+''''+datetostr(date)+''''+', '+''''+timetostr(time)+''''+', '
        +'a.ASIUSER, a.ASIFREG, a.ASIHREG, '      /// temporal
        +''''+wMM+''''+', '+''''+wDD+''''+', '+''''+wTri+''''+', '+''''+wSem+''''+', '
        +''''+wSS+''''+', '+''''+wAATri+''''+', '+''''+wAASem+''''+', '
        +''''+wAASS+''''+', '+''''+wTMonLoc+''''+', '
        +''''+'XX'+''''+', '+''''+'X'+''''+', '+''''+'S'+''''+' '
        +'From RRHH403 a Where ';

   iWhere:='a.CIAID='+''''+dblcCia.Text+''''           // Cualquier Modalidad
          +' and a.ASIANOMM='+''''+dbeAnoMM.Text+'''';
   if rgMod.ItemIndex=1 then iWhere:=iWhere+' and ';   // Parcial
   if rgMod.ItemIndex=2 then                           // Por Fecha Comprob.
      iWhere:=iWhere+' and ASIFECHA>='+''''+datetostr(dbdtpFReg1.Date)+''''
                    +' and ASIFECHA<='+''''+datetostr(dbdtpFReg2.Date)+'''';
   iSQL:=iSQL+iWhere;

   cdsMovRRHH.DisableControls;
   if rgMod.ItemIndex=1 then begin          // Modalidad Parcial
      for i:=0 to dbgDocRRHH.SelectedList.Count-1 do begin
         pbGenera.Position:=n;
         dbgDocRRHH.Datasource.Dataset.GotoBookmark(dbgDocRRHH.SelectedList.items[i]);
         dWhere2:='TDIARID='+''''+dblcTDiario.Text+''''
                 +' and CNTCOMPROB='+''''+meNoReg.Text+'''';
         iWhere2:='a.TDIARID='+''''+dblcTDiario.Text+''''
                 +' and a.ASICOMP='+''''+meNoReg.Text+'''';
         dWhere3:=dWhere3+'('+dWhere2+')';
         iWhere3:=iWhere3+'('+iWhere2+')';
         if not (i=dbgDocRRHH.SelectedList.Count-1) then begin
            dWhere3:=dWhere3+' or ';
            iWhere3:=iWhere3+' or ';
         end;
         n:=n+1;
      end;
      dSQL :=dSQL + '('+dWhere3+')';        // Delete
      iSQL :=iSQL + '('+iWhere3+')';        // Insert
   end
   else begin                              // El resto
      for i:=0 to Cont-1 do begin
         pbGenera.Position:=n;
         n:=n+1;
      end;
   end;
   cdsMovRRHH.EnableControls;
   DCOM1.AppServer.EjecutaQry(dSQL);   // Borra
   n:=n+1;
   pbGenera.Position:=n;
   DCOM1.AppServer.EjecutaQry(iSQL);   // Inserta
   n:=n+1;
   pbGenera.Position:=n;
   wSQL:='UPDATE CNT301RH Set '
        +'CLAUXID='+''''+''+''''+', AUXID='+''''+''+''''+' Where '+''''+'N'+''''+' IN '
        +'(Select CTA_AUX from TGE202 Where CNT301RH.CUENTAID=TGE202.CUENTAID)';
   DCOM1.AppServer.EjecutaQry(wSQL);   // Actualiza (valida) archivo temporal
   n:=n+1;
   pbGenera.Position:=n;

   wSQL:='UPDATE CNT301RH Set '
        +'DOCID='+''''+''+''''+', CNTSERIE='+''''+''+''''+', CNTNODOC='+''''+''+''''+' Where '+''''+'N'+''''+' IN '
        +'(Select CTA_DOC from TGE202 Where CNT301RH.CUENTAID=TGE202.CUENTAID) ';
   DCOM1.AppServer.EjecutaQry(wSQL);   // Actualiza (valida) archivo temporal
   n:=n+1;
   pbGenera.Position:=n;

   wSQL:='UPDATE CNT301RH Set '
        +'CCOSID='+''''+''+''''+' Where '+''''+'N'+''''+' IN '
        +'(Select CTA_CCOS from TGE202 Where CNT301RH.CUENTAID=TGE202.CUENTAID) ';
   DCOM1.AppServer.EjecutaQry(wSQL);   // Actualiza (valida) archivo temporal
   n:=n+1;
   pbGenera.Position:=n;

{   ////  OJO, OJO, OJO ........ PROBAR EN OS/400 R430 ........ OJO, OJO, OJO  ////

   wSQL:='UPDATE CNT301RH A Set '
        +'CtaDes=(select tge202.ctaabr from tge202 '
        +'Where A.cuentaid=tge202.cuentaid), '
        +'AuxDes=(select cnt201.auxabr from cnt201 '
        +'Where A.auxid=cnt201.auxid '
        +'and A.clauxid=cnt201.clauxid), '
        +'DocDes=(select tge110.docabr from tge110 '
        +'Where A.docid=tge110.docid and tge110.docmod='+''''+'RH'+''''+'), '
        +'CCosDes=(select tge203.ccosabr from tge203 '
        +'Where A.ccosid=tge203.ccosid), '
        +'TDiarDes=(select tge104.tdiarabr from tge104 '
        +'Where A.tdiarid=tge104.tdiarid), '
        +'a.CntDebeMn=(CASE a.Cntdh When '+''''+'D'+''''+' then a.CntMtoLoc end), '
        +'a.CntDebeMe=(CASE a.Cntdh When '+''''+'D'+''''+' then a.CntMtoExt end), '
        +'a.CntHabeMn=(CASE a.Cntdh When '+''''+'H'+''''+' then a.CntMtoLoc end), '
        +'a.CntHabeMe=(CASE a.Cntdh When '+''''+'H'+''''+' then a.CntMtoExt end) ';
   DCOM1.AppServer.EjecutaQry(wSQL);   // Actualiza camos D - H
   n:=n+1;
   pbGenera.Position:=n;}

   wSQL:='Insert into CNT301 Select * from CNT301RH';
   DCOM1.AppServer.EjecutaQry(wSQL);   // Inserta registros actualizados
   n:=n+1;
   pbGenera.Position:=n;

   wSQL:='Delete From CNT301RH';
   DCOM1.AppServer.EjecutaQry(wSQL);   // Clarea archivo temporal
   n:=n+1;
   pbGenera.Position:=n;

   ShowMessage('Proceso Concluido con Exito');

//   cdsMovCnt2.ApplyUpdates( 0 );
//   cdsMovRRHH.CancelUpdates;

  // Refresca Query
{   wSQL := 'Select * from CNT301';
   cdsMovCnt2.Close;
   cdsMovCnt2.Provider.DataRequest(wSQL);
   cdsMovCnt2.Open;

   cdsMovCnt.Close;
   cdsMovCnt.Provider.DataRequest(wSQL);
   cdsMovCnt.Open; }

   bbtnCanc.Click;
// OJO: Problemas al salir.... ===>'Reiniciar' CDSMOVRRHH

  End;

end;


procedure TFAsMecRRHH.edtGlosaExit(Sender: TObject);
begin
   if edtGlosa.Text='' then edtGlosa.Text:=' '
   else edtGlosa.Text:=copy(edtGlosa.Text,1,40);
end;

procedure TFAsMecRRHH.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFAsMecRRHH.speMMExit(Sender: TObject);
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
