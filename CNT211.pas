Unit CNT211;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons, Mask, wwdbedit, wwdblook, ExtCtrls, ppCtrls, ppBands,
   ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppDB, ppComm, ppRelatv,
   ppCache, ppDBPipe, Spin, db, ppParameter, ppEndUsr;

Type
   TFImpBloComp = Class(TForm)
      Label1: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      dblctdiario: TwwDBLookupCombo;
      Label24: TLabel;
      dbetdiario: TwwDBEdit;
      edtCompFin: TEdit;
      Label2: TLabel;
      edtCompIni: TEdit;
      Label26: TLabel;
      Label25: TLabel;
      Z2bbtnCanc3: TBitBtn;
      ppdbComprob: TppDBPipeline;
      pprComprob: TppReport;
      gbPer: TGroupBox;
      speAno: TSpinEdit;
      speMM: TSpinEdit;
      bbtnImpresion: TBitBtn;
      ppParameterList1: TppParameterList;
      ppHeaderBand2: TppHeaderBand;
      ppLabel10: TppLabel;
      ppLabel23: TppLabel;
      ppLabel14: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel38: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppLabel43: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel44: TppLabel;
      ppLabel25: TppLabel;
      ppLabel41: TppLabel;
      ppLabel2: TppLabel;
      ppLabel4: TppLabel;
      ppLabel20: TppLabel;
      ppSystemVariable4: TppSystemVariable;
      ppSystemVariable5: TppSystemVariable;
      ppLabel21: TppLabel;
      ppSystemVariable6: TppSystemVariable;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      pplblFecha: TppLabel;
      pplblPeriodo: TppLabel;
      pplblTcam: TppLabel;
      pplblDiario: TppLabel;
      pplblComp: TppLabel;
      pplblLote: TppLabel;
      pplblTmon: TppLabel;
      pplblEstado: TppLabel;
      ppLabel12: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      lblperiodo: TppLabel;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText3: TppDBText;
      ppDBText40: TppDBText;
      ppDBText41: TppDBText;
      ppDBText42: TppDBText;
      ppDetailBand2: TppDetailBand;
      ppDBText4: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppDBText20: TppDBText;
      ppDBText21: TppDBText;
      ppDBText22: TppDBText;
      ppDBText9: TppDBText;
      ppDBText25: TppDBText;
      ppDBText2: TppDBText;
      ppDBText1: TppDBText;
      ppDBText10: TppDBText;
      ppFooterBand1: TppFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLabel18: TppLabel;
      ppDBCalc5: TppDBCalc;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppDBText99: TppDBText;
      ppLabel13: TppLabel;
      ppLabel7: TppLabel;
      pplCmp: TppLabel;
      ppLabel79: TppLabel;
      ppd1: TppDesigner;
      bbtnAportes: TBitBtn;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblctdiarioExit(Sender: TObject);
      Procedure Z2bbtnRegistra3Click(Sender: TObject);
      Procedure ppHeaderBand2BeforePrint(Sender: TObject);
      Procedure edtCompIniExit(Sender: TObject);
      Procedure edtCompFinExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure Z1sbInformesClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure bbtnImpresionClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dblctdiarioNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure bbtnAportesClick(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
   Private
    { Private declarations }
      xperiodo: String;
   Public
    { Public declarations }
   End;

Var
   FImpBloComp: TFImpBloComp;

Implementation

Uses CNTDM;

{$R *.DFM}

Procedure TFImpBloComp.dblcCiaExit(Sender: TObject);
Begin
   edtCia.Text := '';
   If dblcCia.Text <> '' Then edtCia.Text := DMCNT.cdsCia.FieldByName('CIADES').AsString;
   If length(edtCia.Text) = 0 Then
   Begin
      dblcCia.setfocus;
      Raise exception.Create('Falta registrar la Compañía');
   End;

   DMCNT.FiltraTablaxCia(DMCNT.cdsTDiario, 'TGE104', 'TDIARID', dblcCia.Text);
End;

Procedure TFImpBloComp.dblctdiarioExit(Sender: TObject);
Begin
   If dblctdiario.Text <> '' Then dbetdiario.Text := DMCNT.cdsTDiario.FieldByName('TDIARDES').AsString;

   If length(dbetdiario.Text) = 0 Then
   Begin
      dblctdiario.setfocus;
      Raise exception.Create('Falta registrar el Tipo de Diario');
   End;

End;

Procedure TFImpBloComp.Z2bbtnRegistra3Click(Sender: TObject);
Var
   xsql: String;
   x10: integer;
Begin
{      if length(dblcCia.text)=0 then
      begin
        dblcCia.setfocus;
        raise exception.Create('Falta registrar la Compañía');
      end;

      if length(dblctdiario.text)=0 then
      begin
        dblctdiario.setfocus;
        raise exception.Create('Falta registrar el tipo de Diario');
      end;

      if length(edtCompIni.text)=0 then
      begin
        edtCompIni.setfocus;
        raise exception.Create('Falta registrar el Comprobante Inicial');
      end;

      if length(edtCompFin.text)=0 then
      begin
        edtCompFin.setfocus;
        raise exception.Create('Falta registrar el Comprobante Final');
      end;
{      if (length(edtperiodo.text)<7)  or (length(edtperiodo.text)>7) then
      begin
        edtCompFin.setfocus;

        raise exception.Create('Debe registar corectamente el Periodo');
      end;}

  {   xSQL:= 'SELECT CNTREG,CIAID,CUENTAID,CNTMTOORI,CNTFVCMTO,CNTFEMIS,CNTGLOSA,CNTDH, '
           + 'AUXID,CLAUXID,DOCID,CNTSERIE,CNTNODOC,CCOSID,CNTDEBEMN,CNTDEBEME, '
           + 'CNTHABEMN,CNTHABEME,TDIARID,CNTCUADRE,CNTESTADO,CNTCOMPROB,CNTMTOLOC, '
           + 'CNTMTOEXT,CTADES,AUXDES,DOCDES,CCOSDES,TDIARDES,CNTANO,CNTANOMM, '
           + 'CNTLOTE,CNT301.TMONID,CNTTCAMBIO,CNTTS,CNTMODDOC,CNTFCOMP,CNTUSER,CNTFREG, '
           + 'CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTLOTE,CNTAATRI,CNTAASEM,CNTAASS, CNTFAUTOM,TMONDES '
           + 'FROM CNT301, TGE103 WHERE '
           + 'CNT301.TMONID=TGE103.TMONID AND '
           + ' CIAID='''+dblcCia.text+''' AND TDIARID='''+dblctdiario.text
           + ''' AND CNTANOMM='''+periodo+''' AND CNTCOMPROB >='+''''+edtCompIni.Text+''''
           + ' and CNTCOMPROB <='+''''+edtCompFin.Text+''''
           +' ORDER BY CNTCOMPROB' ;

      DMCNT.cdsMovCnt1.Close;
      DMCNT.cdsMovCnt1.DataRequest(xSQL);
      DMCNT.cdsMovCnt1.Open;

      if DMCNT.cdsMovCnt1.recordcount=0 then
         raise exception.Create('No existen registros para la consulta');

      pprComprob.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\Comprobante.rtm';
      pprComprob.template.LoadFromFile ;

      DMCNT.cdsMovCnt1.indexfieldnames:='CNTCOMPROB';
      pprComprob.Print;
      pprComprob.Stop;

      x10:=self.componentCount-1;
      while x10>0 do begin
        if self.components[x10].classname='TppGroup' then begin
           self.components[x10].free;
        end;
        x10:=x10-1;
      end;

      DMCNT.cdsMovCnt1.indexfieldnames:='';

 }

 {   xSQL:='Select * From TGE202 where CIAID ='+''''+dblcCIA.Text+''''+
          ' and CTANIV <='+''''+dblcNivel.Text+''''+
          ' and CUENTAID >='+''''+dblcdCtaInic.Text+''''+
          ' and CUENTAID <='+''''+dblcdCtaFinal.Text+''''+
          ' order By CUENTAID';
    DMCNT.cdsCuenta3.Close;
    DMCNT.cdsCuenta3.DataRequest(xSQL);
    DMCNT.cdsCuenta3.Open;

    pplblCia.Caption  :=edtCia.Text;
    pplblNivel.Caption:=dblcNivel.Text;
    pprPlanCtas.Print;
}
End;

Procedure TFImpBloComp.ppHeaderBand2BeforePrint(Sender: TObject);
Begin
{
 //MODIFICADO POR ANA
   if DMCNT.cdsMOVCNT1.FieldByName('CNTCUADRE').AsString='S' then
      pplblEstado.Caption:= 'Estado : Contabilizado'
   else begin
      if DMCNT.cdsMOVCNT1.FieldByName('CNTESTADO').AsString='A' then pplblEstado.Caption:= 'Estado : Anulado';
      if DMCNT.cdsMOVCNT1.FieldByName('CNTESTADO').AsString='P' then pplblEstado.Caption:= 'Estado : Aceptado';
      //MODIFICADO POR ANA
      if DMCNT.cdsMOVCNT1.FieldByName('CNTESTADO').AsString='I' then pplblEstado.Caption:= 'Estado : Inicial';
      //////
   end;

      pplblCia.caption:= edtCia.Text;
      pplblFecha.caption   := 'Fecha     : ' + DMCNT.cdsMovCnt1.fieldbyname('CNTFCOMP').asstring;
//      pplblPeriodo.caption := 'Periodo   : '+xPeriodo;
//      xWhere := 'FECHA='+Quotedstr(FormatDateTime(wFormatFecha,dtpFComp.Date));
      pplblTcam.caption    := 'T. Cambio : '+ DMCNT.cdsMovCnt1.fieldbyname('CNTTCAMBIO').asstring;
      pplblDiario.caption  := 'T. de Diario : '+ dblcTDiario.text +' - '+ dbeTDiario.Text;
      pplblComp.caption    := 'Comprobante  : '+DMCNT.cdsMovCnt1.fieldbyname('CNTCOMPROB').asstring;
      pplblLote.caption    := 'No. de Lote  : '+DMCNT.cdsMovCnt1.fieldbyname('CNTLOTE').asstring;
      pplblTMon.Caption    := 'T. de Moneda : '+DMCNT.cdsMovCnt1.fieldbyname('TMONDES').asstring;
 //     //MODIFICADO POR ANA
 }
End;

Procedure TFImpBloComp.edtCompIniExit(Sender: TObject);
Begin
   edtCompIni.text := DMCNT.StrZero(edtCompIni.text, 10);

End;

Procedure TFImpBloComp.edtCompFinExit(Sender: TObject);
Begin
   edtCompFin.text := DMCNT.StrZero(edtCompFin.text, 10);

End;

Procedure TFImpBloComp.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;

End;

Procedure TFImpBloComp.Z1sbInformesClick(Sender: TObject);
Var
   xsql, periodo, xwhere, mesdes, mes, ano: String;
   x10: integer;
Begin
   If length(dblcCia.text) = 0 Then
   Begin
      dblcCia.setfocus;
      Raise exception.Create('Falta registrar la Compañía');
   End;

   If length(dblctdiario.text) = 0 Then
   Begin
      dblctdiario.setfocus;
      Raise exception.Create('Falta registrar el tipo de Diario');
   End;

   If length(edtCompIni.text) = 0 Then
   Begin
      edtCompIni.setfocus;
      Raise exception.Create('Falta registrar el Comprobante Inicial');
   End;

   If length(edtCompFin.text) = 0 Then
   Begin
      edtCompFin.setfocus;
      Raise exception.Create('Falta registrar el Comprobante Final');
   End;
   If length(speano.text) = 0 Then
   Begin
      speano.setfocus;
      Raise exception.Create('Debe registar el Año');
   End;

   If length(speMM.text) = 0 Then
   Begin
      speMM.setfocus;
      Raise exception.Create('Debe registar el Mes');
   End;

   xperiodo := trim(speano.text) + trim(DMCNT.StrZero(spemm.text, 2));

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := 'SELECT CNT301.CNTREG,CNT301.CIAID,CNT301.CUENTAID,COALESCE(CNT301.CNTMTOORI,0.00) CNTMTOORI,CNT301.CNTFVCMTO,CNT301.CNTFEMIS,CNT301.CNTGLOSA,CNT301.CNTDH, '
         + 'CNT301.AUXID,CNT301.CLAUXID,CNT301.DOCID,CNT301.CNTSERIE,CNT301.CNTNODOC,CNT301.CCOSID,CNT301.CNTDEBEMN,CNT301.CNTDEBEME, '
         + 'CNT301.CNTHABEMN,CNT301.CNTHABEME,CNT301.TDIARID,CNT301.CNTCUADRE,CNT301.CNTESTADO,CNT301.CNTCOMPROB,COALESCE(CNT301.CNTMTOLOC,0.00) CNTMTOLOC, '
         + 'COALESCE(CNT301.CNTMTOEXT,0.00) CNTMTOEXT,CNT301.CTADES,CNT301.AUXDES,CNT301.DOCDES,CNT301.CCOSDES,CNT301.TDIARDES,CNT301.CNTANO,CNT301.CNTANOMM, '
         + 'CNT301.CNTLOTE,CNT301.TMONID,CNT301.CNTTCAMBIO,CNT301.CNTTS,CNT301.CNTMODDOC,CNT301.CNTFCOMP,CNT301.CNTUSER,CNT301.CNTFREG, '
         + 'CNT301.CNTHREG,CNT301.CNTMM,CNT301.CNTDD,CNT301.CNTTRI,CNT301.CNTSEM,CNT301.CNTSS,CNT301.CNTLOTE,CNT301.CNTAATRI,CNT301.CNTAASEM,CNT301.CNTAASS, CNT301.CNTFAUTOM,TGE103.TMONDES, '
         + ' ''                                                 '' CNTGLOSAC '
         + 'FROM CNT301, TGE103 WHERE '
         + 'CNT301.TMONID=TGE103.TMONID AND '
         + ' CNT301.CIAID=''' + dblcCia.text + ''' AND CNT301.TDIARID=''' + dblctdiario.text
         + ''' AND CNT301.CNTANOMM=''' + xperiodo + ''' AND CNT301.CNTCOMPROB >=' + '''' + edtCompIni.Text + ''''
         + ' and CNT301.CNTCOMPROB <=' + '''' + edtCompFin.Text + ''''
         + ' ORDER BY CNT301.CNTCOMPROB,CNT301.CNTREG';
   End;
   If SRV_D = 'ORACLE' Then
   Begin
      xSQL := 'SELECT CNT301.CNTREG,CNT301.CIAID,CNT301.CUENTAID,NVL(CNT301.CNTMTOORI,0.00) CNTMTOORI,CNT301.CNTFVCMTO,CNT301.CNTFEMIS,CNT301.CNTGLOSA,CNT301.CNTDH, '
         + 'CNT301.AUXID,CNT301.CLAUXID,CNT301.DOCID,CNT301.CNTSERIE,CNT301.CNTNODOC,CNT301.CCOSID,CNT301.CNTDEBEMN,CNT301.CNTDEBEME, '
         + 'CNT301.CNTHABEMN,CNT301.CNTHABEME,CNT301.TDIARID,CNT301.CNTCUADRE,CNT301.CNTESTADO,CNT301.CNTCOMPROB,NVL(CNT301.CNTMTOLOC,0.00) CNTMTOLOC, '
         + 'NVL(CNT301.CNTMTOEXT,0.00) CNTMTOEXT,CNT301.CTADES,CNT301.AUXDES,CNT301.DOCDES,CNT301.CCOSDES,CNT301.TDIARDES,CNT301.CNTANO,CNT301.CNTANOMM, '
         + 'CNT301.CNTLOTE,CNT301.TMONID,CNT301.CNTTCAMBIO,CNT301.CNTTS,CNT301.CNTMODDOC,CNT301.CNTFCOMP,CNT301.CNTUSER,CNT301.CNTFREG, '
         + 'CNT301.CNTHREG,CNT301.CNTMM,CNT301.CNTDD,CNT301.CNTTRI,CNT301.CNTSEM,CNT301.CNTSS,CNT301.CNTLOTE,CNT301.CNTAATRI,CNT301.CNTAASEM,CNT301.CNTAASS, CNT301.CNTFAUTOM,TGE103.TMONDES, '
         + ' ''                                                 '' CNTGLOSAC '
         + 'FROM CNT301, TGE103 WHERE '
         + 'CNT301.TMONID=TGE103.TMONID AND '
         + ' CNT301.CIAID=''' + dblcCia.text + ''' AND CNT301.TDIARID=''' + dblctdiario.text
         + ''' AND CNT301.CNTANOMM=''' + xperiodo + ''' AND CNT301.CNTCOMPROB >=' + '''' + edtCompIni.Text + ''''
         + ' and CNT301.CNTCOMPROB <=' + '''' + edtCompFin.Text + ''''
         + ' ORDER BY CNT301.CNTCOMPROB,CNT301.CNTREG';
   End;
   DMCNT.cdsMovCnt1.Close;
   DMCNT.cdsMovCnt1.DataRequest(xSQL);
   DMCNT.cdsMovCnt1.Open;
   If DMCNT.cdsMovCnt1.recordcount = 0 Then
      Raise exception.Create('No existen registros para la consulta');

       ///agregado por ana 13/11/2001
   DMCNT.cdsMovCNT2.IndexFieldNames := '';
   DMCNT.cdsMovCNT2.filter := '';
   DMCNT.cdsMovCNT2.Filtered := true;

   DMCNT.cdsMovCNT2.close;
   DMCNT.cdsMovCNT2.DataRequest('SELECT * FROM CNT300 WHERE CIAID=''99''');
   DMCNT.cdsmovcnt2.Open;
      ///fin de agregacion 13/11/2001

   XSQL := 'SELECT CIAID,CNTGLOSA,CNTCOMPROB FROM CNT300 WHERE '
      + ' CIAID=''' + dblcCia.text + ''' AND TDIARID=''' + dblctdiario.text
      + ''' AND CNTANOMM=''' + xperiodo + ''' AND CNTCOMPROB >=' + '''' + edtCompIni.Text + ''''
      + ' and CNTCOMPROB <=' + '''' + edtCompFin.Text + ''''
      + ' ORDER BY CNTCOMPROB';
   DMCNT.cdsMovCNT2.Close;
   DMCNT.cdsMovCNT2.DataRequest(xSQL);
   DMCNT.cdsMovCNT2.Open;
   DMCNT.cdsMovCNT2.IndexFieldNames := 'CNTCOMPROB';

   DMCNT.cdsMovCNT1.FIRST;
   While Not DMCNT.cdsMovCNT1.eof Do
   Begin
      DMCNT.cdsMovCNT2.SetKey;
      DMCNT.cdsMovCNT2.fieldbyname('CNTCOMPROB').asstring := DMCNT.cdsMovCnt1.fieldbyname('CNTCOMPROB').asstring;
      If DMCNT.cdsMovCNT1.FIELDBYNAME('CNTMTOORI').ASFLOAT > 0 Then
      Begin

         If DMCNT.cdsMovCNT2.GotoKey Then
         Begin
            DMCNT.cdsMovCNT1.edit;
            DMCNT.cdsMovCNT1.fieldbyname('CNTGLOSAC').asstring := DMCNT.cdsMovCNT2.fieldbyname('CNTGLOSA').asstring;
         End;
      End;
      DMCNT.cdsMovCNT1.NEXT;
   End;
   pprComprob.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\Comprobante1.rtm';
   pprComprob.template.LoadFromFile;
   pplblPeriodo.caption := 'Periodo   : ';

   mes := copy(xperiodo, 5, 2);
   ano := copy(xperiodo, 1, 4);

   xWhere := 'MESIDR=''' + mes + '''';
   mesdes := DMCNT.DisplayDescrip('dspTGE', 'TGE181', 'MESDESL', XWHERE, 'MESDESL');
   lblPeriodo.Caption := mesdes + ' ' + ano;

   DMCNT.cdsMovCnt1.indexfieldnames := 'CNTCOMPROB';
   pprComprob.Print;
   pprComprob.Stop;

   x10 := self.componentCount - 1;
   While x10 > 0 Do
   Begin
      If self.components[x10].classname = 'TppGroup' Then
      Begin
         self.components[x10].free;
      End;
      x10 := x10 - 1;
   End;

   DMCNT.cdsMovCnt1.indexfieldnames := '';

 {   xSQL:='Select * From TGE202 where CIAID ='+''''+dblcCIA.Text+''''+
          ' and CTANIV <='+''''+dblcNivel.Text+''''+
          ' and CUENTAID >='+''''+dblcdCtaInic.Text+''''+
          ' and CUENTAID <='+''''+dblcdCtaFinal.Text+''''+
          ' order By CUENTAID';
    DMCNT.cdsCuenta3.Close;
    DMCNT.cdsCuenta3.DataRequest(xSQL);
    DMCNT.cdsCuenta3.Open;

    pplblCia.Caption  :=edtCia.Text;
    pplblNivel.Caption:=dblcNivel.Text;
    pprPlanCtas.Print;
}
End;

Procedure TFImpBloComp.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMCNT.cdsMovCNT2.close;
   DMCNT.cdsMovCNT2.DataRequest('SELECT * FROM CNT301 WHERE CIAID=''99''');
   DMCNT.cdsmovcnt2.Open;
End;

Procedure TFImpBloComp.bbtnImpresionClick(Sender: TObject);
Var
   xsql, periodo, xwhere, mesdes, mes, ano, xCampos: String;
   x10: integer;
Begin
   If length(dblcCia.text) = 0 Then
   Begin
      dblcCia.setfocus;
      Raise exception.Create('Falta registrar la Compañía');
   End;

   If length(dblctdiario.text) = 0 Then
   Begin
      dblctdiario.setfocus;
      Raise exception.Create('Falta registrar el tipo de Diario');
   End;

   If length(edtCompIni.text) = 0 Then
   Begin
      edtCompIni.setfocus;
      Raise exception.Create('Falta registrar el Comprobante Inicial');
   End;

   If length(edtCompFin.text) = 0 Then
   Begin
      edtCompFin.setfocus;
      Raise exception.Create('Falta registrar el Comprobante Final');
   End;
   If length(speano.text) = 0 Then
   Begin
      speano.setfocus;
      Raise exception.Create('Debe registar el Año');
   End;

   If length(speMM.text) = 0 Then
   Begin
      speMM.setfocus;
      Raise exception.Create('Debe registar el Mes');
   End;

   xperiodo := trim(speano.text) + trim(DMCNT.StrZero(spemm.text, 2));

   mes := trim(DMCNT.StrZero(spemm.text, 2));
   ano := trim(speano.text);

   xWhere := 'MESIDR=''' + mes + '''';
   mesdes := DMCNT.DisplayDescrip('dspTGE', 'TGE181', 'MESDESL', XWHERE, 'MESDESL');

   xCampos := '''' + mesdes + ' ' + ano + ''' PERIODO ';

   Screen.Cursor := CrHourGlass;

   If (SRV_D = 'DB2NT') Or (SRV_D = 'DB2400') Then
   Begin
      xSQL := 'SELECT CNT301.CNTREG,CNT301.CIAID,CNT301.CUENTAID,COALESCE(CNT301.CNTMTOORI,0.00) CNTMTOORI,CNT301.CNTFVCMTO,CNT301.CNTFEMIS,CNT301.CNTGLOSA,CNT301.CNTDH, '
         + 'CNT301.AUXID,CNT301.CLAUXID,CNT301.DOCID,CNT301.CNTSERIE,CNT301.CNTNODOC,CNT301.CCOSID,CNT301.CNTDEBEMN,CNT301.CNTDEBEME, '
         + 'CNT301.CNTHABEMN,CNT301.CNTHABEME,CNT301.TDIARID,CNT301.CNTCUADRE,CNT301.CNTESTADO,CNT301.CNTCOMPROB,COALESCE(CNT301.CNTMTOLOC,0.00) CNTMTOLOC, '
         + 'COALESCE(CNT301.CNTMTOEXT,0.00) CNTMTOEXT,CNT301.CTADES,CNT301.AUXDES,CNT301.DOCDES,CNT301.CCOSDES,CNT301.TDIARDES,CNT301.CNTANO,CNT301.CNTANOMM, '
         + 'CNT301.CNTLOTE,CNT301.TMONID,CNT301.CNTTCAMBIO,CNT301.CNTTS,CNT301.CNTMODDOC,CNT301.CNTFCOMP,CNT301.CNTUSER,CNT301.CNTFREG, '
         + 'CNT301.CNTHREG,CNT301.CNTMM,CNT301.CNTDD,CNT301.CNTTRI,CNT301.CNTSEM,CNT301.CNTSS,CNT301.CNTLOTE,CNT301.CNTAATRI,CNT301.CNTAASEM,CNT301.CNTAASS, CNT301.CNTFAUTOM,TGE103.TMONDES, '
         + ' ''                                                 '' CNTGLOSAC '
         + 'FROM CNT301, TGE103 WHERE '
         + 'CNT301.TMONID=TGE103.TMONID AND '
         + ' CNT301.CIAID=''' + dblcCia.text + ''' AND CNT301.TDIARID=''' + dblctdiario.text
         + ''' AND CNT301.CNTANOMM=''' + xperiodo + ''' AND CNT301.CNTCOMPROB >=' + '''' + edtCompIni.Text + ''''
         + ' and CNT301.CNTCOMPROB <=' + '''' + edtCompFin.Text + ''''
         + ' ORDER BY CNT301.CNTCOMPROB,CNT301.CNTREG';
   End;
   If SRV_D = 'ORACLE' Then
   Begin
      // VHNDEMA
      xsql := 'SELECT A.*, B.CIADES, A.TDIARID||'' - ''||C.TDIARDES ORIGEN, '
         + 'CASE WHEN D.CNTESTADO=''P'' THEN ''Contabilizado'' '
         + 'ELSE CASE WHEN D.CNTESTADO=''I'' THEN ''Inicial'' '
         + 'ELSE CASE WHEN D.CNTESTADO=''A'' THEN ''Anulado'' '
         + 'ELSE ''ERROR'' END '
         + 'END '
         + 'END ESTADO, D.CNTGLOSA GLOSA, M.TMONDES MONEDA, ' + xCampos
         + 'FROM CNT301 A, CNT300 D, TGE101 B, TGE104 C, TGE103 M '
         + 'WHERE ( A.CIAID=' + quotedstr(dblcCia.Text) + ' AND '
         + 'A.CNTANOMM=' + quotedstr(xperiodo) + ' AND '
         + 'A.TDIARID=' + quotedstr(dblcTDiario.Text) + ' AND '
         + 'A.CNTCOMPROB >=' + '''' + edtCompIni.Text + ''' AND '
         + 'A.CNTCOMPROB <=' + '''' + edtCompFin.Text + ''' AND '
         + 'A.CIAID=D.CIAID AND A.TDIARID=D.TDIARID AND '
         + 'A.CNTANOMM=D.CNTANOMM AND A.CNTCOMPROB=D.CNTCOMPROB AND '
         + 'A.CIAID=B.CIAID AND A.TDIARID=C.TDIARID AND A.TMONID=M.TMONID ) '
         + 'ORDER BY A.CIAID, A.CNTANOMM, A.TDIARID, A.CNTREG'
          // END VHNDEMA
   End;
   DMCNT.cdsMovCnt1.Close;
   DMCNT.cdsMovCnt1.DataRequest(xSQL);
   DMCNT.cdsMovCnt1.Open;
   If DMCNT.cdsMovCnt1.recordcount = 0 Then
   Begin
      Screen.Cursor := CrDefault;
      Raise exception.Create('No existen registros para la consulta');
   End;

   pprComprob.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\Comprobante1.rtm';
   pprComprob.template.LoadFromFile;
   DMCNT.cdsMovCnt1.indexfieldnames := 'CNTCOMPROB;CNTREG';

   DMCNT.Graba_Log_Consultas(DMCNT.wModulo, DMCNT.wUsuario, 'Asientos en Bloque',
      dblcCia.Text, // Campañía
      speAno.Text + DMCNT.strZero(speMM.Text, 2), '', // Periodo Inicio - Final
      '', '', // Fecha   Inicio - final
      '', dblcTDiario.Text, // Nivel   - Origen
      '', '', // Lote    -  Moneda
      '', '', // Cuentas - Auxiliares
      '', 'Impresora', // Costos - Tipo Salida
      ''); // Tipo Rep

   Screen.Cursor := CrHourGlass;
   If cbDisenoRep.Checked Then
      ppd1.ShowModal
   Else
   Begin
      pprComprob.Print;

      pprComprob.Stop;

      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;

      DMCNT.cdsMovCnt1.indexfieldnames := '';
   End;
End;

Procedure TFImpBloComp.FormShow(Sender: TObject);
Var
   xAno, xMes, xDia: Word;

Begin
   DMCNT.cdsCabCNT.First;
   edtCompIni.text := DMCNT.cdsCabCNT.fieldbyname('CNTCOMPROB').asstring;

   DMCNT.cdsCabCNT.Last;
   edtCompFin.text := DMCNT.cdsCabCNT.fieldbyname('CNTCOMPROB').asstring;

   DecodeDate(Date, xAno, xMes, xDia);
   speAno.Value := xAno;
   speMM.Value := xMes;

  // vhndema
  // DMCNT.Filtracds(DMCNT.cdsCia,'SELECT * FROM TGE101');
  // end vhndema

End;

Procedure TFImpBloComp.dblctdiarioNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFImpBloComp.bbtnAportesClick(Sender: TObject);
Var
   xsql, periodo, xwhere, mesdes, mes, ano, xCampos: String;
   x10: integer;
Begin
   If length(dblcCia.text) = 0 Then
   Begin
      dblcCia.setfocus;
      Raise exception.Create('Falta registrar la Compañía');
   End;

   If length(dblctdiario.text) = 0 Then
   Begin
      dblctdiario.setfocus;
      Raise exception.Create('Falta registrar el tipo de Diario');
   End;

   If length(edtCompIni.text) = 0 Then
   Begin
      edtCompIni.setfocus;
      Raise exception.Create('Falta registrar el Comprobante Inicial');
   End;

   If length(edtCompFin.text) = 0 Then
   Begin
      edtCompFin.setfocus;
      Raise exception.Create('Falta registrar el Comprobante Final');
   End;
   If length(speano.text) = 0 Then
   Begin
      speano.setfocus;
      Raise exception.Create('Debe registar el Año');
   End;

   If length(speMM.text) = 0 Then
   Begin
      speMM.setfocus;
      Raise exception.Create('Debe registar el Mes');
   End;

   xperiodo := trim(speano.text) + trim(DMCNT.StrZero(spemm.text, 2));

   mes := trim(DMCNT.StrZero(spemm.text, 2));
   ano := trim(speano.text);

   xWhere := 'MESIDR=''' + mes + '''';
   mesdes := DMCNT.DisplayDescrip('dspTGE', 'TGE181', 'MESDESL', XWHERE, 'MESDESL');

   xCampos := '''' + mesdes + ' ' + ano + ''' PERIODO ';

   Screen.Cursor := CrHourGlass;

      // VHNDEMA
   xsql := 'SELECT A.*, B.CIADES, A.TDIARID||'' - ''||C.TDIARDES ORIGEN, '
      + 'CASE WHEN D.CNTESTADO=''P'' THEN ''Contabilizado'' '
      + 'ELSE CASE WHEN D.CNTESTADO=''I'' THEN ''Inicial'' '
      + 'ELSE CASE WHEN D.CNTESTADO=''A'' THEN ''Anulado'' '
      + 'ELSE ''ERROR'' END '
      + 'END '
      + 'END ESTADO, D.CNTGLOSA GLOSA, M.TMONDES MONEDA, ' + xCampos
      + ', NVL(A.CNTFAUTOM,''N'') AUTOMATICO '
      + 'FROM CNT301 A, CNT300 D, TGE101 B, TGE104 C, TGE103 M '
      + 'WHERE ( A.CIAID=' + quotedstr(dblcCia.Text) + ' AND '
      + 'A.CNTANOMM=' + quotedstr(xperiodo) + ' AND '
      + 'A.TDIARID=' + quotedstr(dblcTDiario.Text) + ' AND '
      + 'A.CNTCOMPROB >=' + '''' + edtCompIni.Text + ''' AND '
      + 'A.CNTCOMPROB <=' + '''' + edtCompFin.Text + ''' AND '
      + 'A.CIAID=D.CIAID AND A.TDIARID=D.TDIARID AND '
      + 'A.CNTANOMM=D.CNTANOMM AND A.CNTCOMPROB=D.CNTCOMPROB AND '
      + 'A.CIAID=B.CIAID AND A.TDIARID=C.TDIARID AND A.TMONID=M.TMONID ) '
      + 'ORDER BY A.CIAID, A.CNTANOMM, A.TDIARID, A.CNTCOMPROB';
          // END VHNDEMA
   DMCNT.cdsMovCnt1.Close;
   DMCNT.cdsMovCnt1.DataRequest(xSQL);
   DMCNT.cdsMovCnt1.Open;
   If DMCNT.cdsMovCnt1.recordcount = 0 Then
   Begin
      Screen.Cursor := CrDefault;
      Raise exception.Create('No existen registros para la consulta');
   End;

   pprComprob.TEMPLATE.FileName := ExtractFilePath(application.ExeName) + wRutaRpt + '\Comprobante1.rtm';
   pprComprob.template.LoadFromFile;

   DMCNT.cdsMovCnt1.indexfieldnames := 'CNTCOMPROB; AUTOMATICO; CNTNODOC;CUENTAID';
   Screen.Cursor := CrHourGlass;
   If cbDisenoRep.Checked Then
      ppd1.ShowModal
   Else
   Begin
      pprComprob.Print;

      pprComprob.Stop;

      x10 := self.componentCount - 1;
      While x10 > 0 Do
      Begin
         If self.components[x10].classname = 'TppGroup' Then
         Begin
            self.components[x10].free;
         End;
         x10 := x10 - 1;
      End;

      DMCNT.cdsMovCnt1.indexfieldnames := '';
   End;
End;

Procedure TFImpBloComp.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
End;

End.

