unit CNT602;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, wwdbdatetimepicker, StdCtrls, ExtCtrls, ComCtrls, Grids, Wwdbigrd,
  Wwdbgrid, wwdbedit, Spin, wwdblook, Buttons;

type
  TFAsMecCxC = class(TForm)
    pnlCabecera: TPanel;
    Label3: TLabel;
    Label7: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    dbeAnoMM: TwwDBEdit;
    pnlDetalle: TPanel;
    Label1: TLabel;
    dbgDocCxC: TwwDBGrid;
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
    Label5: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    bbtnOkReg: TBitBtn;
    bbtnCancReg: TBitBtn;
    meNoReg2: TMaskEdit;
    Panel1: TPanel;
    meNoReg1: TMaskEdit;
    pnlFecha: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    bbtnOkFec: TBitBtn;
    bbtnCancFec: TBitBtn;
    dbdtpFReg2: TwwDBDateTimePicker;
    dbdtpFReg1: TwwDBDateTimePicker;
    Panel2: TPanel;
    procedure dblcCiaExit(Sender: TObject);
    procedure speMMExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure meNoReg1Exit(Sender: TObject);
    procedure meNoReg2Exit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    Function PnlsEnabled(PVal:Boolean):Boolean;
    procedure FormActivate(Sender: TObject);
    procedure rgModClick(Sender: TObject);
    procedure btnGenAsMecClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAsMecCxC: TFAsMecCxC;
  Year, Month, Day: Word;
  xSQL, xWhere, xGrp, anomm, wMes : string;
  nn, nreg: integer;

implementation

uses CNTDM;

{$R *.DFM}

procedure TFAsMecCxC.FormActivate(Sender: TObject);
begin
   DM1.cdsDetCxC.Active:=True;

   nreg:=0;
   nn:=0;
//   DM1.cdsDetCxCIndexFieldNames :='CIAID;TDiarId;CPAnoMes;CPNoReg';
//   DM1.cdsDetCxC.IndexFieldNames :='CIAID;TDiarId;DCPAnoMM;CPNoReg';   //Busca si ya esta en DetCxc

//   DM1.cdsDetCxCRefresh;
//   DM1.cdsDetCxCFilter:='CIAID='+''''+''+'''';
//   DM1.cdsDetCxCFiltered:=True;
// calcula valor de periodo aaaamm tomando como base la fecha del sistema
   DecodeDate(DATE, Year, Month, Day);
   speAno.Value:=Year;
   speMM.Value:=Month;
   dblcCia.SetFocus;
end;

procedure TFAsMecCxC.dblcCiaExit(Sender: TObject);
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

procedure TFAsMecCxC.speMMExit(Sender: TObject);
begin
   if (speMM.Value>12) or (speMM.Value<1) then begin
      speMM.SetFocus;
      exit;
   end;
   wMes := inttostr( speMM.Value );
   if speMM.Value<10 then wMes:= '0'+inttostr(speMM.Value);
   dbeAnoMM.text :=inttostr( speAno.Value) + wMes;
end;

procedure TFAsMecCxC.bbtnOkClick(Sender: TObject);
Var
   xFecha: TDate;
   PerCie: String;
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

   xSQL:='SELECT A.CIAID, A.TDIARID, A.CCANOMES, A.CCNOREG, '
        +'A.CCFCOMP, A.DOCID, A.CCSERIE, A.CCNODOC, A.CLIEID, A.TMONID, '
        +'SUM(A.CCMTOORI) AS MTOORI '
        +'FROM CXC302 A ';
   xWhere:='WHERE CIAID='+''''+dblcCia.Text+''''
          +' and CCANOMES='+''''+dbeAnoMM.Text+'''';
//          +' and CCESTADO='+''''+'P'+'''';   // OJO, solo para pruebas
   xGrp:=' GROUP BY A.CIAID, A.TDIARID, A.CCANOMES, A.CCNOREG,'
        +' A.CCFCOMP, A.DOCID, A.CCSERIE, A.CCNODOC, A.CLIEID, A.TMONID ';

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

      xWhere:=xWhere+' and CCFCMPRB>'+''''+datetostr(xFecha)+'''';
   end;

   dbgDocCxC.Selected.Add('MTOORI'#9'10'#9'Monto'#9'F');
   xSQL:=xSQL+xWhere+xGrp;
   DM1.cdsDetCxC.Close;
   DM1.cdsDetCxC.DataRequest(xSQL);
   DM1.cdsDetCxC.Open;
   dbgDocCxC.RedrawGrid;

   
   With DM1 do Begin
      if cdsDetCxC.RecordCount = 0 then begin
         ShowMessage(' No existen Registros disponibles para este periodo'+chr(13)
                    +'        en el Módulo de Cuentas Por Cobrar');
         pnlDetalle.Enabled:=False;
         pnlPie.Enabled:=False;
         exit;
      end
      else begin
         pnlDetalle.Enabled:=True;
         pnlPie.Enabled:=True;
         rgMod.ItemIndex:=1;    // Inicializa RadioGroup en Parcial
         dbgDocCxC.SetFocus;
//         rgModClick(Sender);
      end;
   End;
end;


procedure TFAsMecCxC.rgModClick(Sender: TObject);
begin
   if (rgMod.ItemIndex=0) or (rgMod.ItemIndex=1) then begin
     nreg:=0;
     if rgMod.ItemIndex=0 then dbgDocCxC.SelectAll
     else dbgDocCxC.UnselectAll;
     dbgDocCxC.SetFocus;
   end;
   if (rgMod.ItemIndex=2) or (rgMod.ItemIndex=3) then begin
      dbgDocCxC.UnselectAll;
      PnlsEnabled(False);
      if rgMod.ItemIndex=2 then pnlNoReg.Visible:=True
      else pnlFecha.Visible:=True;
   end;
end;

procedure TFAsMecCxC.btnGenAsMecClick(Sender: TObject);
Var
   n, i, Cont: SmallInt;
   iWhere, iWhere2, xWhere2: String;
   iWhere3, xWhere3: WideString;
begin
  With DM1 do Begin
   if rgMod.ItemIndex=0 then begin   // Total
      Cont:=cdsDetCxC.RecordCount;
      /// si selecciono Total y desmarco algun registro===> Selec Todo
      if Cont <> dbgDocCxC.SelectedList.Count then dbgDocCxC.SelectAll;
   end
   else Cont:=dbgDocCxC.SelectedList.Count;                // Parcial

   if Cont = 0 then
   begin
     ShowMessage('Seleccione por lo menos un registro');
     raise exception.Create('Seleccione por lo menos un registro');
   end ;

   if MessageDlg('Generación de Asientos Mecanizados desde el'+chr(13)+
                 '          Módulo de Cuentas Por Cobrar'+chr(13)+
                 '                  ¿  Continua  ?  ',mtConfirmation, [mbYes, mbNo], 0)<>mrYes
   then exit;

   btnGenAsMec.Visible:=False;
   pnlGenera.Visible:=True;
   pbGenera.Min:= 0;
   pbGenera.Max:= Cont+2;
   pbGenera.Step:= 1;
   n:=1;
   iWhere2:='';
   iWhere3:='';
   xWhere:='';   xWhere2:='';   xWhere3:='';

   iWhere:=' WHERE A.CIAID='+''''+dblcCia.Text+''''    // Cualquier Modalidad (DET)
          +' and A.CCANOMES='+''''+dbeAnoMM.Text+'''';
   xWhere:=' WHERE A.CIAID='+''''+dblcCia.Text+''''    // Cualquier Modalidad (CAB)
          +' and A.CNTANOMM='+''''+dbeAnoMM.Text+'''';

   if rgMod.ItemIndex=1 then begin     // Parcial
      iWhere:=iWhere+' and ';   //(DET)
      xWhere:=xWhere+' and ';   //(CAB)
   end;

   if rgMod.ItemIndex=2 then begin                     // Por No.Registro
      iWhere:=iWhere+' and A.TDIARID='+''''+dblcTDiario.Text+''''
                    +' and A.CCNOREG>='+''''+meNoReg1.Text+''''
                    +' and A.CCNOREG<='+''''+meNoReg2.Text+'''';
      xWhere:=xWhere+' and A.TDIARID='+''''+dblcTDiario.Text+''''  //(CAB)
                    +' and A.CNTCOMPROB>='+''''+meNoReg1.Text+''''
                    +' and A.CNTCOMPROB<='+''''+meNoReg2.Text+'''';
   end;
   if rgMod.ItemIndex=3 then begin                     // Por Fecha Comprob.
      iWhere:=iWhere+' and A.CCPFCOM>='+''''+datetostr(dbdtpFReg1.Date)+''''
                    +' and A.CCPFCOM<='+''''+datetostr(dbdtpFReg2.Date)+'''';
      xWhere:=xWhere+' and A.CNTFCOM>='+''''+datetostr(dbdtpFReg1.Date)+''''
                    +' and A.CNTFCOM<='+''''+datetostr(dbdtpFReg2.Date)+'''';
   end;
// xSQL:=xSQL+iWhere;

   cdsDetCxC.DisableControls;
   if rgMod.ItemIndex=1 then begin          // Modalidad Parcial
      for i:=0 to dbgDocCxC.SelectedList.Count-1 do begin
         pbGenera.Position:=n;
         dbgDocCxC.Datasource.Dataset.GotoBookmark(dbgDocCxC.SelectedList.items[i]);
         iWhere2:='A.TDIARID='+''''+cdsDetCxC.FieldByName('TDIARID').AsString+''''
                 +' and A.CCNOREG='+''''+cdsDetCxC.FieldByName('CCNOREG').AsString+'''';
         xWhere2:='A.TDIARID='+''''+cdsDetCxC.FieldByName('TDIARID').AsString+''''
                 +' and A.CNTCOMPROB='+''''+cdsDetCxC.FieldByName('CCNOREG').AsString+'''';
         iWhere3:=iWhere3+'('+iWhere2+')';  //DET
         xWhere3:=xWhere3+'('+xWhere2+')';  //CAB
         if not (i=dbgDocCxC.SelectedList.Count-1) then begin
            iWhere3:=iWhere3+' or ';
            xWhere3:=xWhere3+' or ';
         end;
         n:=n+1;
      end;
      iWhere:=iWhere + '('+iWhere3+')';
      xWhere:=xWhere + '('+xWhere3+')';
   end
   else begin                              // El resto
      for i:=0 to Cont-1 do begin
         pbGenera.Position:=n;
         n:=n+1;
      end;
//      xSQL:=xSQL+' and a.DCPFlCdr='+''''+'S'+'''';   // Solo inserta Contab = Con cuadre
   end;
   cdsDetCxC.EnableControls;

   // Genera Detalle de Contabilidad
        if (SRV_D = 'DB2NT') or
           (SRV_D = 'DB2400') then
        begin
   xSQL:='INSERT INTO CNT301'
        + '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CUENTAID, '
        + 'CLAUXID, AUXID, AUXDES, CCOSID, CCOSDES, '
        + 'CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, DOCDES, '
        + 'CNTGLOSA, CNTDH,  CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, '
        + 'CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, '
        + 'CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, '
        + 'CNTTRI, CNTSEM, CNTANO, CNTSS, CNTAATRI, CNTAASEM, '
        + 'CNTAASS, TMONID, CNTCUADRE, CTADES, TDIARDES, FLAGVAR, CNTLOTE, '
        + 'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME ) '

        + 'SELECT A.CIAID, A.TDIARID, A.CCANOMES, A.CCNOREG, A.CUENTAID, '
        + 'CASE WHEN B.CTA_AUX =''S'' THEN A.CLAUXID  ELSE '''' END,'
        + 'CASE WHEN B.CTA_AUX =''S'' THEN A.CLIEID   ELSE '''' END,'
        + 'CASE WHEN B.CTA_AUX =''S'' THEN D.CLIEABR  ELSE '''' END,'
        + 'CASE WHEN B.CTA_CCOS=''S'' THEN A.CCOSID   ELSE '''' END,'
        + 'CASE WHEN B.CTA_CCOS=''S'' THEN F.CCOSABR  ELSE '''' END,'
        + 'CASE WHEN B.CTA_DOC =''S'' THEN ''CXC''    ELSE '''' END,'
        + 'CASE WHEN B.CTA_DOC =''S'' THEN A.DOCID    ELSE '''' END,'
        + 'CASE WHEN B.CTA_DOC =''S'' THEN A.CCSERIE  ELSE '''' END,'
        + 'CASE WHEN B.CTA_DOC =''S'' THEN A.CCNODOC  ELSE '''' END,'
        + 'CASE WHEN B.CTA_DOC =''S'' THEN E.DOCABR   ELSE '''' END,'
        + 'A.CCGLOSA, A.CCDH, A.CCTCAMPR, A.CCMTOORI, A.CCMTOLOC, '
        + 'A.CCMTOEXT, A.CCFEMIS, A.CCFVCMTO, A.CCFCOMP, A.CCESTADO, '
        + 'A.CCUSER, CURRENT DATE, CURRENT TIME, A.CCMM, A.CCDD, '
        + 'A.CCTRI, A.CCSEM, A.CCAAAA, A.CCSS, A.CCAATRI, A.CCAASEM, '
        + 'A.CCAASS, A.TMONID, ''S'', B.CTAABR, C.TDIARABR, ''Z'', A.CCLOTE, '
        + 'CASE WHEN A.CCDH=''D'' THEN A.CCMTOLOC ELSE 0 END,'
        + 'CASE WHEN A.CCDH=''D'' THEN A.CCMTOEXT ELSE 0 END,'
        + 'CASE WHEN A.CCDH=''H'' THEN A.CCMTOLOC ELSE 0 END,'
        + 'CASE WHEN A.CCDH=''H'' THEN A.CCMTOEXT ELSE 0 END '
        + 'FROM CXC302 A '
        + 'LEFT JOIN TGE202 B ON ( A.CIAID=B.CIAID AND A.CUENTAID=B.CUENTAID ) '
        + 'LEFT JOIN TGE104 C ON ( A.TDIARID =C.TDIARID ) '
        + 'LEFT JOIN TGE204 D ON ( A.CLIEID  =D.CLIEID  ) '
        + 'LEFT JOIN TGE110 E ON ( E.DOCMOD=''CXC'' AND A.DOCID   =E.DOCID   ) '
        + 'LEFT JOIN TGE203 F ON ( A.CCOSID  =F.CCOSID  ) ';

   xSQL:=xSQL+iWhere;

        end
        else
         if SRV_D = 'ORACLE' then
          begin
   xSQL:='INSERT INTO CNT301'
        + '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CUENTAID, '
        + 'CLAUXID, AUXID, AUXDES, CCOSID, CCOSDES, '
        + 'CNTMODDOC, DOCID, CNTSERIE, CNTNODOC, DOCDES, '
        + 'CNTGLOSA, CNTDH,  CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, '
        + 'CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, '
        + 'CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, '
        + 'CNTTRI, CNTSEM, CNTANO, CNTSS, CNTAATRI, CNTAASEM, '
        + 'CNTAASS, TMONID, CNTCUADRE, CTADES, TDIARDES, FLAGVAR, CNTLOTE, '
        + 'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME ) '

        + 'SELECT A.CIAID, A.TDIARID, A.CCANOMES, A.CCNOREG, A.CUENTAID, '
        + 'DECODE(B.CTA_AUX,''S'',A.CLAUXID,''''), '
        + 'DECODE(B.CTA_AUX,''S'',A.CLIEID,''''), '
        + 'DECODE(B.CTA_AUX,''S'',D.CLIEABR,''''), '
        + 'DECODE(B.CTA_CCOS,''S'',A.CCOSID,''''), '
        + 'DECODE(B.CTA_CCOS,''S'',F.CCOSABR,''''), '
        + 'DECODE(B.CTA_DOC,''S'',''CXC'',''''), '
        + 'DECODE(B.CTA_DOC,''S'',A.DOCID,''''), '
        + 'DECODE(B.CTA_DOC,''S'',A.CCSERIE,''''), '
        + 'DECODE(B.CTA_DOC,''S'',A.CCNODOC,''''), '
        + 'DECODE(B.CTA_DOC,''S'',E.DOCABR,''''), '
        + 'A.CCGLOSA, A.CCDH, A.CCTCAMPR, A.CCMTOORI, A.CCMTOLOC, '
        + 'A.CCMTOEXT, A.CCFEMIS, A.CCFVCMTO, A.CCFCOMP, A.CCESTADO, '
        + 'A.CCUSER, SYSDATE, SYSDATE, A.CCMM, A.CCDD, '
        + 'A.CCTRI, A.CCSEM, A.CCAAAA, A.CCSS, A.CCAATRI, A.CCAASEM, '
        + 'A.CCAASS, A.TMONID, ''S'', B.CTAABR, C.TDIARABR, ''Z'', A.CCLOTE, '
        + 'DECODE(A.CCDH,''D'',A.CCMTOLOC,0), '
        + 'DECODE(A.CCDH,''D'',A.CCMTOEXT,0), '
        + 'DECODE(A.CCDH,''H'',A.CCMTOLOC,0), '
        + 'DECODE(A.CCDH,''H'',A.CCMTOEXT,0) '
        + 'FROM CXC302 A,TGE202 B,TGE104 C,TGE204 D,TGE110 E,TGE203 F '
        + 'WHERE ( A.CIAID=B.CIAID(+)) AND (A.CUENTAID=B.CUENTAID(+) ) '
        + 'AND ( A.TDIARID =C.TDIARID(+) ) '
        + 'AND ( A.CLIEID  =D.CLIEID(+)  ) '
        + 'AND ( E.DOCMOD(+)=''CXC'' AND A.DOCID =E.DOCID(+)   ) '
        + 'AND ( A.CCOSID  =F.CCOSID(+) ) ';

   xSQL:=xSQL+iWhere;

          end;

   DCOM1.AppServer.EjecutaQry(xSQL);   // Inserta CXC302 a CNT301
   n:=n+1;
   pbGenera.Position:=n;

   // Genera Cabecera de Contabilidad
   xSQL:='';
   xSQL:='INSERT INTO CNT300 '
        + '( CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTLOTE, '
        + 'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, '
        + 'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, '
        + 'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, '
        + 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
        + 'CNTTS ) '
        + 'SELECT A.CIAID, A.TDIARID, A.CNTCOMPROB, A.CNTANOMM, A.CNTLOTE, '
        + '''M:'''+'||A.CNTMODDOC||'+''' D:'''+'||A.TDIARID||'+''' P:'''+'||A.CNTANOMM||'+''' C:'''+'||A.CNTCOMPROB, '
        + 'A.CNTTCAMBIO, A.CNTFCOMP, ''P'', ''S'', '
        + ''''+DM1.wUsuario+''''+', '+wRepFecServi+','+wRepFecServi+', A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, '
        + 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, '' '', '
        + 'A.TDIARDES, '
        + 'SUM(A.CNTDEBEMN), SUM(A.CNTDEBEME), SUM(A.CNTHABEMN), SUM(A.CNTHABEME), '
//        + ''''+Copy( wVRN_TipoCambio,2,2 )+''''+' '   OJO... asi deberia quedar
        + ''''+'P'+''''
        + ' FROM CNT301 A ';
   xGrp:=' GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, '
        + 'A.CNTTCAMBIO, A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI,  '
        + 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, A.TMONID, '
        + 'A.TDIARDES, A.CNTMODDOC';

   xSQL:=xSQL+xWhere+xGrp;
   DCOM1.AppServer.EjecutaQry(xSQL);   // Inserta a CNT300
   n:=n+1;
   pbGenera.Position:=n;

   ShowMessage('Proceso Concluido con Exito');

   bbtnCanc.Click;
  End;
end;

procedure TFAsMecCxC.dblcTDiarioExit(Sender: TObject);
begin
   edtTDiario.Text:='';
   if dblcTDiario.Text<>'' then edtTDiario.Text:=DM1.cdsTDiario.FieldByName('TDIARDES').AsString;
   if length(edtTDiario.Text)=0 then
   begin
        ShowMessage('Falta Definición de Tipo de Diario');
        dblcTDiario.SetFocus;
   end;
end;

procedure TFAsMecCxC.meNoReg1Exit(Sender: TObject);
begin
     meNoReg1.Text:=DM1.StrZero(meNoReg1.Text,10);
end;

procedure TFAsMecCxC.meNoReg2Exit(Sender: TObject);
begin
     meNoReg2.Text:=DM1.StrZero(meNoReg2.Text,10);
end;

function TFAsMecCxC.PnlsEnabled(PVal:Boolean):Boolean;
begin
   pnlCabecera.Enabled:=PVal;
   pnlDetalle.Enabled :=PVal;
   pnlPie.Enabled     :=PVal;
end;


end.
