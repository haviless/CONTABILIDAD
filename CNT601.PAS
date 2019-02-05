unit CNT601;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, Buttons, Mask, wwdbedit, ExtCtrls,
  wwdbdatetimepicker, Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, Spin;

type
  TFAsMecCxP = class(TForm)
    pnlCabecera: TPanel;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    pnlDetalle: TPanel;
    dbgDocCxP: TwwDBGrid;
    Label1: TLabel;
    pnlPie: TPanel;
    btnGenAsMec: TButton;
    rgMod: TRadioGroup;
    Label4: TLabel;
    pnlGenera: TPanel;
    pbGenera: TProgressBar;
    pnlNoReg: TPanel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    bbtnOkReg: TBitBtn;
    bbtnCancReg: TBitBtn;
    Label5: TLabel;
    meNoReg2: TMaskEdit;
    pnlFecha: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    bbtnOkFec: TBitBtn;
    bbtnCancFec: TBitBtn;
    dbdtpFReg2: TwwDBDateTimePicker;
    dbdtpFReg1: TwwDBDateTimePicker;
    Panel1: TPanel;
    Panel2: TPanel;
    dblcCia: TwwDBLookupCombo;
    Label3: TLabel;
    edtCia: TEdit;
    Label7: TLabel;
    speAno: TSpinEdit;
    Label15: TLabel;
    speMM: TSpinEdit;
    Label2: TLabel;
    dbeAnoMM: TwwDBEdit;
    meNoReg1: TMaskEdit;
    procedure dblcCiaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure btnGenAsMecClick(Sender: TObject);
    procedure rgModClick(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure bbtnOkRegClick(Sender: TObject);
    procedure meNoReg1Exit(Sender: TObject);
    procedure meNoReg2Exit(Sender: TObject);
    procedure bbtnCancRegClick(Sender: TObject);
    procedure dbdtpFReg2Exit(Sender: TObject);
    procedure bbtnOkFecClick(Sender: TObject);
    Function PnlsEnabled(PVal:Boolean):Boolean;
    procedure bbtnCancFecClick(Sender: TObject);
    procedure dbgDocCxPMultiSelectRecord(Grid: TwwDBGrid;
      Selecting: Boolean; var Accept: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure speMMExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAsMecCxP: TFAsMecCxP;
  Year, Month, Day: Word;
  xwhere, wMes : string;
  nn, nreg: integer;

implementation
uses CNTDM;

{$R *.DFM}

/// Generación de Asientos Mecanizados: Trabaja con tablas de diferentes BD's
/// y aun no se ha establecido el formato para accesarlas desde un SQL
/// EN CONSTRUCCION... al 98%
procedure TFAsMecCxP.FormActivate(Sender: TObject);
begin
   DM1.cdsMovCnt2.Active:=True;
   DM1.cdsMovCxP.Active:=True;

   nreg:=0;
   nn:=0;
   DM1.cdsMovCxP.IndexFieldNames :='CIAID;TDiarId;CPAnoMes;CPNoReg';
//   DM1.cdsDetCxP.IndexFieldNames :='CIAID;TDiarId;DCPAnoMM;CPNoReg';   //Busca si ya esta en DetCxP
   DM1.cdsMovCnt2.IndexFieldNames:='CIAID;ClAuxId;AuxId;DocId;CNTSerie;CNTNoDoc';

//   DM1.cdsMovCxP.Refresh;
   DM1.cdsMovCxP.Filter:='CIAID='+''''+''+'''';
   DM1.cdsMovCxP.Filtered:=True;
// calcula valor de periodo aaaamm tomando como base la fecha del sistema
   DecodeDate(DATE, Year, Month, Day);
   speAno.Value:=Year;
   speMM.Value:=Month;
   dblcCia.SetFocus;
end;

procedure TFAsMecCxP.dblcCiaExit(Sender: TObject);
begin
   if (bbtnCanc.Focused) then exit;
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DM1.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía');
      dblcCia.SetFocus;
   end;
   speMMExit(Sender);   
end;

procedure TFAsMecCxP.bbtnOkClick(Sender: TObject);
Var
   xFecha: TDate;
   xFiltro, PerCie: String;
begin
   if edtCia.Text='' then
   begin
      showmessage('Compañia no válida') ;
      raise exception.Create('Compañia no válida');
   end ;

   if length(dbeAnoMM.Text)<>6 then
   begin
       ShowMessage('Periodo no válido') ;
       raise exception.Create('Periodo no válido');
   end ;

   PerCie:='PER'+wMes;

///Valida Periodo Cerrado... Inicio///
   xWhere :='CIAID='+''''+dblcCia.Text+''''
           +' and MODULO='+''''+'CNT'+''''
           +' and ANO='+''''+inttostr(speAno.Value)+'''';
   if ( DM1.DisplayDescrip('PrvTGE','TGE154','*',xWhere,PERCIE) ) = 'C' then
   begin
        ShowMessage('Periodo Cerrado, no válido');
        exit;
   end;
///Valida Periodo Cerrado... Fin  ///

   xFiltro:='CIAID='+''''+dblcCia.Text+''''
           +' and CPANOMES='+''''+dbeAnoMM.Text+''''
           +' and CP_CONTA='+''''+'S'+'''';

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

      xFiltro:=xFiltro+' and CPFCMPRB>'+''''+datetostr(xFecha)+'''';
   end;

   With DM1 do Begin
      cdsMovCxP.Filter:='';
      cdsMovCxP.Filter:=xFiltro;
      cdsMovCxP.Filtered:=True;
      if cdsMovCxP.RecordCount = 0 then begin
         ShowMessage(' No existen registros contabilizados para este periodo'+chr(13)
                    +'          en el Módulo de Cuentas Por Pagar');
         pnlDetalle.Enabled:=False;
         pnlPie.Enabled:=False;
         exit;
      end
      else begin
         pnlDetalle.Enabled:=True;
         pnlPie.Enabled:=True;
         rgMod.ItemIndex:=1;    // Inicializa RadioGroup en Parcial
         dbgDocCxP.SetFocus;
//         rgModClick(Sender);
      end;
   End;
end;

procedure TFAsMecCxP.btnGenAsMecClick(Sender: TObject);
Var
   n, i, Cont: SmallInt;
   iWhere, iWhere2, dWhere, dWhere2 : String;
   iWhere3, dWhere3, iSQL, dSQL, wSQL: WideString;
begin
  With DM1 do Begin
   if rgMod.ItemIndex=0 then begin   // Total
      Cont:=cdsMovCxP.RecordCount;
      /// si selecciono Total y desmarco algun registro===> Selec Todo
      if Cont <> dbgDocCxP.SelectedList.Count then dbgDocCxP.SelectAll;
   end
   else Cont:=dbgDocCxP.SelectedList.Count;                // Parcial

   if Cont = 0 then
   begin
      ShowMessage('Seleccione por lo menos un registro') ;
      raise exception.Create('Seleccione por lo menos un registro') ;
   end ;

   if MessageDlg('Generación de Asientos Mecanizados desde el'+chr(13)+
                 '          Módulo de Cuentas Por Pagar'+chr(13)+
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

   if rgMod.ItemIndex=1 then dWhere:=dWhere+' and ';   // Parcial
   if rgMod.ItemIndex=2 then
      dWhere:=dWhere+' and TDIARID='+''''+dblcTDiario.Text+''''
                    +' and CNTCOMPROB>='+''''+meNoReg1.Text+''''
                    +' and CNTCOMPROB<='+''''+meNoReg2.Text+'''';
   if rgMod.ItemIndex=3 then
      dWhere:=dWhere+' and CNTFCOMP>='+''''+datetostr(dbdtpFReg1.Date)+''''
                    +' and CNTFCOMP<='+''''+datetostr(dbdtpFReg2.Date)+'''';

   dSQL:='Delete From CNT301 Where '+dWhere;
   /// CNT301CXP archivo de trabajo temporal para Gen As Mec desde CXP
   /// quizas no es necesario toda la lista de campos Destino
   iSQL:='Insert Into CNT301CXP(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, '
        +'CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, '
        +'CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, '
        +'CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, '
        +'CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, '
        +'FLAGVAR, FCONS, CNTFMEC) '
        +'Select a.CIAID, a.TDIARID, a.CPNOREG, a.DCPANOC, a.DCPANOMM, a.DCPLOTE, '
        +'a.CUENTAID, a.CLAUXID, a.DCPAUXID, a.DOCID, a.CPSERIE, a.CPNODOC, a.DCPGLOSA, a.DCPDH, '
        +'a.CCOSID, a.CPTCAMPR, a.DCPMOORI, a.DCPMOLOC, a.DCPMOEXT, a.CPFEMIS, a.CPFVCMTO, '
        +'a.DCPFCOM, a.DCPESTDO, a.DCPFLCDR, a.DCPFLAUT, '
///  OJO Asi deberia quedar  ////
///        +''''+wUsuario+''''+', '+''''+datetostr(date)+''''+', '+''''+timetostr(time)+''''+', '
        +'a.DCPUSER, a.DCPFREG, a.DCPHREG, '      /// temporal
        +'a.DCPMM, a.DCPDD, a.DCPTRI, a.DCPSEM, a.DCPSS, a.DCPAATRI, a.DCPAASEM, a.DCPAASS, a.TMONID, '
        +''''+'XX'+''''+', '+''''+'X'+''''+', '+''''+'S'+''''+' '
        +'From CXP302 a Where ';

   iWhere:='a.CIAID='+''''+dblcCia.Text+''''           // Cualquier Modalidad
          +' and a.DCPANOMM='+''''+dbeAnoMM.Text+'''';

   if rgMod.ItemIndex=1 then iWhere:=iWhere+' and ';   // Parcial
   if rgMod.ItemIndex=2 then                           // Por No.Registro
      iWhere:=iWhere+' and a.TDIARID='+''''+dblcTDiario.Text+''''
                    +' and a.CPNOREG>='+''''+meNoReg1.Text+''''
                    +' and a.CPNOREG<='+''''+meNoReg2.Text+'''';
   if rgMod.ItemIndex=3 then                           // Por Fecha Comprob.
      iWhere:=iWhere+' and DCPFCOM>='+''''+datetostr(dbdtpFReg1.Date)+''''
                    +' and DCPFCOM<='+''''+datetostr(dbdtpFReg2.Date)+'''';

   iSQL:=iSQL+iWhere;

   cdsMovCxP.DisableControls;
   if rgMod.ItemIndex=1 then begin          // Modalidad Parcial
      for i:=0 to dbgDocCxP.SelectedList.Count-1 do begin
         pbGenera.Position:=n;
         dbgDocCxP.Datasource.Dataset.GotoBookmark(dbgDocCxP.SelectedList.items[i]);
         dWhere2:='TDIARID='+''''+cdsMovCxP.FieldByName('TDIARID').AsString+''''
                 +' and CNTCOMPROB='+''''+cdsMovCxp.FieldByName('CpNoReg').AsString+'''';
         iWhere2:='a.TDIARID='+''''+cdsMovCxP.FieldByName('TdiarId').AsString+''''
                 +' and a.CPNOREG='+''''+cdsMovCxp.FieldByName('CpNoReg').AsString+'''';
         dWhere3:=dWhere3+'('+dWhere2+')';
         iWhere3:=iWhere3+'('+iWhere2+')';
         if not (i=dbgDocCxP.SelectedList.Count-1) then begin
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
      iSQL:=iSQL+' and a.DCPFlCdr='+''''+'S'+'''';   // Solo inserta Contab = Con cuadre
   end;
   cdsMovCxP.EnableControls;
   DCOM1.AppServer.EjecutaQry(dSQL);   // Borra
   n:=n+1;
   pbGenera.Position:=n;
   DCOM1.AppServer.EjecutaQry(iSQL);   // Inserta en archivo temporal CNT301CXP
   n:=n+1;
   pbGenera.Position:=n;

   // Actualiza inclusion o no de Aux, Doc y CCosto... y Campos descripción
         {UPDATE CNT301CXP Set Clauxid=''
            Where 'N' IN (Select CTA_AUX from TGE202 Where CNT301CXP.cuentaid=TGE202.cuentaid)}
   wSQL:='UPDATE CNT301CXP Set '
        +'CLAUXID='+''''+''+''''+', AUXID='+''''+''+''''+' Where '+''''+'N'+''''+' IN '
        +'(Select CTA_AUX from TGE202 Where CNT301CXP.CUENTAID=TGE202.CUENTAID)';
   DCOM1.AppServer.EjecutaQry(wSQL);   // Actualiza (valida) archivo temporal
   n:=n+1;
   pbGenera.Position:=n;

   wSQL:='UPDATE CNT301CXP Set '
        +'DOCID='+''''+''+''''+', CNTSERIE='+''''+''+''''+', CNTNODOC='+''''+''+''''+' Where '+''''+'N'+''''+' IN '
        +'(Select CTA_DOC from TGE202 Where CNT301CXP.CUENTAID=TGE202.CUENTAID) ';
   DCOM1.AppServer.EjecutaQry(wSQL);   // Actualiza (valida) archivo temporal
   n:=n+1;
   pbGenera.Position:=n;

   wSQL:='UPDATE CNT301CXP Set '
        +'CCOSID='+''''+''+''''+' Where '+''''+'N'+''''+' IN '
        +'(Select CTA_CCOS from TGE202 Where CNT301CXP.CUENTAID=TGE202.CUENTAID) ';
   DCOM1.AppServer.EjecutaQry(wSQL);   // Actualiza (valida) archivo temporal
   n:=n+1;
   pbGenera.Position:=n;

{   ////  OJO, OJO, OJO ........ PROBAR EN OS/400 R430 ........ OJO, OJO, OJO  ////
        +'CtaDes=(select tge202.ctaabr from tge202 '
        +'Where CNT301CXP.cuentaid=tge202.cuentaid), '

        +'AuxDes=(select cnt201.auxabr from cnt201 '
        +'Where CNT301CXP.auxid=cnt201.auxid '
        +'and CNT301CXP.clauxid=cnt201.clauxid), '

        +'DocDes=(select tge110.docabr from tge110 '
        +'Where CNT301CXP.docid=tge110.docid and tge110.docmod='+''''+'CXP'+''''+'), '

        +'CCosDes=(select tge203.ccosabr from tge203 '
        +'Where CNT301CXP.ccosid=tge203.ccosid), '

        +'TDiarDes=(select tge104.tdiarabr from tge104 '
        +'Where CNT301CXP.tdiarid=tge104.tdiarid), '

        +'CntDebeMn=(CASE cntdh When '+''''+'D'+''''+' then CntMtoLoc end), '
        +'CntDebeMe=(CASE cntdh When '+''''+'D'+''''+' then CntMtoExt end), '
        +'CntHabeMn=(CASE cntdh When '+''''+'H'+''''+' then CntMtoLoc end), '
        +'CntHabeMe=(CASE cntdh When '+''''+'H'+''''+' then CntMtoExt end)';

   DCOM1.AppServer.EjecutaQry(wSQL);   // Actualiza (valida) archivo temporal
   n:=n+1;
   pbGenera.Position:=n;}

   wSQL:='Insert into CNT301 Select * from CNT301CXP';
   DCOM1.AppServer.EjecutaQry(wSQL);   // Inserta registros actualizados
   n:=n+1;
   pbGenera.Position:=n;

   wSQL:='Delete From CNT301CXP';
   DCOM1.AppServer.EjecutaQry(wSQL);   // Clarea archivo temporal
   n:=n+1;
   pbGenera.Position:=n;

   ShowMessage('Proceso Concluido con Exito');

   cdsMovCnt2.ApplyUpdates( 0 );
   cdsMovCxP.CancelUpdates;

  // Refresca Query
{   wSQL := 'Select * from CNT301';
   cdsMovCnt2.Close;
   cdsMovCnt2.Provider.DataRequest(wSQL);
   cdsMovCnt2.Open;

   cdsMovCnt.Close;
   cdsMovCnt.Provider.DataRequest(wSQL);
   cdsMovCnt.Open;}

   bbtnCanc.Click;
// OJO: Problemas al salir.... ===>'Reiniciar' CDSMOVCXP
  End;
end;

procedure TFAsMecCxP.rgModClick(Sender: TObject);
begin
   if (rgMod.ItemIndex=0) or (rgMod.ItemIndex=1) then begin
     nreg:=0;
     if rgMod.ItemIndex=0 then dbgDocCxP.SelectAll
     else dbgDocCxP.UnselectAll;
     dbgDocCxP.SetFocus;
   end;
   if (rgMod.ItemIndex=2) or (rgMod.ItemIndex=3) then begin
      dbgDocCxP.UnselectAll;
      PnlsEnabled(False);
      if rgMod.ItemIndex=2 then pnlNoReg.Visible:=True
      else pnlFecha.Visible:=True;
   end;
end;


procedure TFAsMecCxP.dblcTDiarioExit(Sender: TObject);
begin
   edtTDiario.Text:='';
   if dblcTDiario.Text<>'' then edtTDiario.Text:=DM1.cdsTDiario.FieldByName('TDIARDES').AsString;
   if length(edtTDiario.Text)=0 then
   begin
        ShowMessage('Falta Definición de Tipo de Diario');
        dblcTDiario.SetFocus;
   end;
end;

procedure TFAsMecCxP.meNoReg1Exit(Sender: TObject);
begin
     meNoReg1.Text:=DM1.StrZero(meNoReg1.Text,10);
end;

procedure TFAsMecCxP.meNoReg2Exit(Sender: TObject);
begin
     meNoReg2.Text:=DM1.StrZero(meNoReg2.Text,10);
     if (strtoint(meNoReg2.Text) < strtoint(meNoReg1.Text)) then begin
        ShowMessage(' Rango mal definido ');
        meNoReg1.Text;
     end;

end;

procedure TFAsMecCxP.bbtnOkRegClick(Sender: TObject);
begin
   nreg:=0;
   nn:=0;
   if (edtTDiario.Text='') or (meNoReg1.Text='') or (meNoReg2.Text='') then
   begin
     ShowMessage('Información Incompleta... faltan datos');
     raise exception.Create('Información Incompleta... faltan datos');
   end ;
   With DM1 do Begin
     cdsMovCxP.DisableControls;
     cdsMovCxP.First;
     While not cdsMovCxP.Eof do Begin
       if (dblcTDiario.Text = cdsMovCxP.FieldByName('TDiarId').AsString) then begin
          if  (cdsMovCxP.FieldByName('CPNoReg').AsString >= meNoReg1.Text)
          and (cdsMovCxP.FieldByName('CPNoReg').AsString <= meNoReg2.Text) then begin
             nn:=nn+1;
             dbgDocCxP.SelectRecord;
          end;
       end;
       cdsMovCxP.Next;
     end;
     cdsMovCxP.EnableControls;
   End;
   pnlNoReg.Visible:=False;
   PnlsEnabled(True);
   nreg:=nn;
   if nreg = 0 then rgMod.ItemIndex:=1;
end;

procedure TFAsMecCxP.bbtnCancRegClick(Sender: TObject);
begin
    pnlNoReg.Visible:=False;
    PnlsEnabled(True);
    rgMod.ItemIndex:=1;
end;

procedure TFAsMecCxP.dbdtpFReg2Exit(Sender: TObject);
begin
   if dbdtpFReg2.Date < dbdtpFReg1.Date then begin
      ShowMessage('   Fecha no válida   ');
      dbdtpFReg2.SetFocus;
   end;
end;

procedure TFAsMecCxP.bbtnOkFecClick(Sender: TObject);
begin
   nreg:=0;
   nn:=0;
   if (dbdtpFReg1.Date=0) or (dbdtpFReg2.Date=0) then
   begin
     ShowMessage('Información Incompleta... faltan datos');
     raise exception.Create('Información Incompleta... faltan datos');
   end ;
   With DM1 do Begin
     cdsMovCxP.DisableControls;
     cdsMovCxP.First;
     While not cdsMovCxP.Eof do Begin
       if (cdsMovCxP.FieldByName('CPFCMPRB').AsDateTime >= dbdtpFReg1.Date)
        and (cdsMovCxP.FieldByName('CPFCMPRB').AsDateTime <= dbdtpFReg2.Date) then begin
             nn:=nn+1;
             dbgDocCxP.SelectRecord;
       end;
       cdsMovCxP.Next;
     end;
     cdsMovCxP.EnableControls;
   End;
   pnlFecha.Visible:=False;
   PnlsEnabled(True);
   nreg:=nn;
   if nreg = 0 then rgMod.ItemIndex:=1;
//   dbgDocCxP.Options:=dbgDocCxP.Options-[Wwdbigrd.dgRowSelect];
end;

procedure TFAsMecCxP.bbtnCancFecClick(Sender: TObject);
begin
    pnlFecha.Visible:=False;
    PnlsEnabled(True);
    rgMod.ItemIndex:=1;
end;

function TFAsMecCxP.PnlsEnabled(PVal:Boolean):Boolean;
begin
   pnlCabecera.Enabled:=PVal;
   pnlDetalle.Enabled :=PVal;
   pnlPie.Enabled     :=PVal;
end;

procedure TFAsMecCxP.dbgDocCxPMultiSelectRecord(Grid: TwwDBGrid;
  Selecting: Boolean; var Accept: Boolean);
begin
   if nreg > 0 then begin
      Accept := False;
   end;
   // OJO: La propiedad MultiSelectOptions[msoShiftSelect] del grid esta en
   //      False ya que entra en un bucle infinito si presiona Shift aqui

{if (Selecting and (Grid.SelectedList.Count>=3)) then
		Accept := False;}

end;

procedure TFAsMecCxP.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFAsMecCxP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DM1.cdsMovCxP.IndexFieldNames :='';
   DM1.cdsMovCnt2.IndexFieldNames:='';
//   dbgDocCxp.UpdateControlState;
end;

procedure TFAsMecCxP.speMMExit(Sender: TObject);
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


