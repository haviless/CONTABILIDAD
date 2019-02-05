Unit CNT233;

// Conciliación Bancaria - Contabiliazción
// Actualizaciones
// HPC_201501_CNT    Creación de Formulario
// HPC_201503_CNT    29/09/2015 Se retira formmulario CNT412,
//                   porque no se usa y causa conflicto entre transacciones y consultas
// HPC_201702_CNT    02/06/2017
//                   Permite trabajar con mas de un periodo contable para un mismo descargo de banco
//                   Permite visualizar Saldos Iniciales
//                   Permite exportar a excel
//                   Permite contabilizar los extractos bancarios para periodos atrasados
Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, DB, StdCtrls, Buttons, Wwdbdlg,
//Inicio HPC_201702_CNT: nuevas librerias para el manejo de los nuevos controles
   wwdblook, ExtCtrls,DateUtils,    
   Mask, wwdbedit, Wwdbspin;
   //Fin HPC_201702_CNT
Type
   TFConcilBancContab = Class(TForm)
      pnlContabilizacion: TPanel;
      Label9: TLabel;
      Label10: TLabel;
      dblcTDIARID2: TwwDBLookupCombo;
      edtGlosa: TEdit;
      btnContabiliza2: TBitBtn;
      edtDiario2: TEdit;
      chkTotalizado: TCheckBox;
      lblCtaContable1: TLabel;
      dblcdCuenta1: TwwDBLookupComboDlg;
      edtCuenta1: TEdit;
      lblCCosto1: TLabel;
      dblcdCCosto1: TwwDBLookupComboDlg;
      bvlConta1: TBevel;
      edtCCosto1: TEdit;
      Bevel1: TBevel;
      lblCtaContable2: TLabel;
      dblcdCuenta2: TwwDBLookupComboDlg;
      edtCuenta2: TEdit;
      lblCCosto2: TLabel;
      dblcdCCosto2: TwwDBLookupComboDlg;
      edtCCosto2: TEdit;
      //Inicio HPC_201702_CNT: nuevos controles para el manejo del periodo
      dbsMEs: TwwDBSpinEdit;
      dbsAno: TwwDBSpinEdit;
      Label1: TLabel;
      //Fin HPC_201702_CNT
      Procedure FormShow(Sender: TObject);
      Procedure dblcTDIARID2Exit(Sender: TObject);
      Procedure btnContabiliza2Click(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormCreate(Sender: TObject);
      Procedure dblcdCuenta1Exit(Sender: TObject);
      Procedure dblcdCuenta2Exit(Sender: TObject);
      Procedure dblcdCCosto1Exit(Sender: TObject);
      Procedure dblcdCCosto2Exit(Sender: TObject);
      //Inicio HPC_201702_CNT: nuevas validaciones para el manejo del periodo
      function ValidarPeriodo:Boolean;
      function ValidarPeriodoCerrado: Boolean;
      //Fin HPC_201702_CNT
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FConcilBancContab: TFConcilBancContab;
   //Inicio HPC_201702_CNT: nuevas variables para el manejo del periodo
   sAno, sMes: String;
   //Fin HPC_201702_CNT
Implementation

// Inicio HPC_201503_CNT
//Uses CNTDM, CNT230, CNT412;
Uses CNTDM, CNT230;
// Fin HPC_201503_CNT

{$R *.dfm}

Procedure TFConcilBancContab.FormShow(Sender: TObject);
Begin
//
End;

Procedure TFConcilBancContab.dblcTDIARID2Exit(Sender: TObject);
Begin
   If DMCNT.cdsTipCta.Locate('TDIARID', VarArrayOf([dblcTDIARID2.Text]), []) Then
      edtDiario2.Text := DMCNT.cdsTipCta.FieldByname('TDIARDES').AsString
   Else
      edtDiario2.Text := 'Sin Descripción';
End;

Procedure TFConcilBancContab.btnContabiliza2Click(Sender: TObject);
Var
   xSQL, xSQLI, vFcomprob, vFPeriodo, vTMoneda, vClauxid, vAuxid, vDH, vDH2, vCuenta1, vCuenta2, vUltimodia, vCNTCOMPROB: String;
   vCNTTCAMBIO, vCNTMTOORI, vCNTMTOLOC, vCNTMTOEXT, vCNTDEBEMN, vCNTDEBEME, vCNTHABEMN, vCNTHABEME: Currency;
   vCntReg: Integer;
   B: TBookmark;
   xTotDebe, xTotHaber: Currency;
   vFPeriodoExtracto: String; //Inicio HPC_201702_CNT: nueva variable que almacena el periodo del extracto bancario. Fin HPC_201702_CNT
Begin

   //Inicio HPC_201702_CNT: nueva validacion para el periodo seleccionado
   If not ValidarPeriodo Then
      exit;
   //Fin HPC_201702_CNT

   B := DMCNT.cdsMovCNT1.GetBookmark;
   DMCNT.cdsMovCNT1.DisableConstraints;
   DMCNT.cdsMovCNT1.First;

   //Inicio HPC_201702_CNT: ahora el valor de la fecha contable se tomara en base al periodo seleccionado
   //vUltimodia := IntToStr(DaysInMonth(StrTodate('01/' + FConcBanCob.dbsMEs.Text + '/' + FConcBanCob.dbsAno.Text)));
   //vFComprob := vUltimodia + '/' + FConcBanCob.dbsMEs.Text + '/' + FConcBanCob.dbsAno.Text;
   //vFPeriodo := FConcBanCob.dbsAno.Text + FConcBanCob.dbsMEs.Text;
   if (dbsAno.Text + dbsMEs.Text) = (formatdatetime('YYYYMM', NOW())) then
      vUltimodia := formatdatetime('DD', NOW())
   else
      vUltimodia := IntToStr(DaysInMonth(StrTodate('01/' + dbsMEs.Text + '/' + dbsAno.Text)));

   vFComprob := vUltimodia + '/' + dbsMEs.Text + '/' + dbsAno.Text;
   vFPeriodo := dbsAno.Text + dbsMEs.Text;
   vFPeriodoExtracto:= FConcBanCob.dbsAno.Text + FConcBanCob.dbsMEs.Text;
   //Fin HPC_201702_CNT
   
   vTMoneda := DMCNT.cdsCuenta2.FieldByName('TMONID').AsString;
   vCntReg := 0;

// Tipo de Cambio
   xSQL := 'Select * FROM TGE107 WHERE FECHA=''' + vFComprob + ''' ';
   DMCNT.cdsTMon.Close;
   DMCNT.cdsTMon.DataRequest(xSQL);
   DMCNT.cdsTMon.Open;
   vCNTTCAMBIO := DMCNT.cdsTMon.FieldByname('TCAMVBC').AsCurrency;

// Inserto un comprobante
//Inicio HPC_201702_CNT: Se incorpora el NVL para qe si no encuentra valor le asigna 0
   xSQL := 'Select NVL(MAX(CNTCOMPROB),0) CNTCOMPROB '
         + '  from CNT300 '
         + ' where CIAID=''02'' '
         + '   and TDIARID=' + QuotedStr(dblcTDIARID2.Text)
         + '   and CNTANOMM=' + QuotedStr(vFPeriodo);
   DMCNT.cdsTMon.Close;
   DMCNT.cdsTMon.DataRequest(xSQL);
   DMCNT.cdsTMon.Open; 
//Fin HPC_201702_CNT
   vCNTCOMPROB := DMCNT.StrZero(IntToStr(DMCNT.cdsTMon.FieldByname('CNTCOMPROB').AsInteger + 1), 10);
   xSQL := 'Insert Into CNT300(CIAID,TDIARID,CNTANOMM,CNTCOMPROB,CNTLOTE) '
         + 'Values (' + QuotedStr('02') + ','
         + QuotedStr(dblcTDIARID2.Text) + ','
         + QuotedStr(vFPeriodo) + ','
         + QuotedStr(vCNTCOMPROB) + ','
         + QuotedStr('TMP') + ')';
   DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

   If chkTotalizado.Checked Then
   Begin
      While Not DMCNT.cdsMovCNT1.Eof Do
      Begin
         If DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString = 'S' Then
         Begin
            If DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsFloat > 0 Then
               If vTMoneda = 'N' Then
                  xTotDebe := xTotDebe + DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsFloat
               Else
                  xTotDebe := xTotDebe + DMCNT.FRound(DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency / vCNTTCAMBIO, 15, 2)
            Else
               If vTMoneda = 'N' Then
                  xTotHaber := xTotHaber + (DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsFloat) * -1
               Else
                  xTotHaber := xTotHaber + DMCNT.FRound(((DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsFloat) / vCNTTCAMBIO), 15, 2) * -1;
         End;
         DMCNT.cdsMovCNT1.Next;
      End;

      If (xTotDebe > 0) And (xTotHaber > 0) Then
      Begin
         ShowMessage('Existen líneas que son positivas y negativas, debe escoger sólo de un tipo');
         exit;
      End;

      vCNTMTOORI := xTotDebe + xTotHaber;

      vCuenta1 := dblcdCuenta1.Text;
      vCuenta2 := dblcdCuenta2.Text;

      vCntReg := vCntReg + 1;
      vCNTMTOLOC := vCNTMTOORI;
      vCNTMTOEXT := DMCNT.FRound(vCNTMTOORI / vCNTTCAMBIO, 15, 2);
      vCNTDEBEMN := vCNTMTOORI;
      vCNTDEBEME := DMCNT.FRound(vCNTMTOORI / vCNTTCAMBIO, 15, 2);
      vCNTHABEMN := 0;
      vCNTHABEME := 0;
      xSQLI := 'Insert Into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CUENTAID, '
            + '                   CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
            + '                   CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, '
            + '                   CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, '
            + '                   CNTCUADRE, CNTUSER, CNTFREG, CNTHREG, CNTMM, TMONID, '
            + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTTS, MODULO, '
            + '                   CNTMODDOC, CNTREG) ';
      xSQL := '(Select ' + quotedstr(FConcBanCob.dblcCia.Text) + ' CIAID,'
            + Quotedstr(dblcTDIARID2.Text) + ' TDIARID ,'
            + Quotedstr(vCNTCOMPROB) + ' CNTCOMPROB,'
//Inicio HPC_201702_CNT: se toma el valor año del periodo seleccionado            
//+ Quotedstr(FConcBanCob.dbsAno.Text) + ' CNTANO,' 
            + Quotedstr(copy(vFPeriodo,1,4)) + ' CNTANO,'               
//Fin HPC_201702_CNT
            + Quotedstr(vFPeriodo) + ' CNTANOMM,'
            + Quotedstr(vCuenta1) + ' CUENTAID,'
            + Quotedstr(vClauxid) + ' CLAUXID,'
            + Quotedstr(vAuxid) + ' AUXID,'
            + Quotedstr('23') + ' DOCID,'
            + Quotedstr('0') + ' CNTSERIE,'
            + Quotedstr('0') + ' CNTNODOC,'
            + Quotedstr(edtGlosa.Text) + ' CNTGLOSA,'
            + Quotedstr('D') + ' CNTDH,'
            + Quotedstr(dblcdCCosto1.Text) + ' CCOSID,'
            + CurrToStr(vCNTTCAMBIO) + ' CNTTCAMBIO,'
            + CurrToStr(vCNTMTOORI) + ' CNTMTOORI,'
            + CurrToStr(vCNTMTOLOC) + ' CNTMTOLOC,'
            + CurrToStr(vCNTMTOEXT) + ' CNTMTOEXT,'
            + Quotedstr(vFComprob) + ' CNTFEMIS,'
            + Quotedstr(vFComprob) + ' CNTFVCMTO,'
            + Quotedstr(vFComprob) + ' CNTFCOMP, '
            + Quotedstr('I') + ' CNTESTADO, '
            + Quotedstr('N') + ' CNTCUADRE, '
            + Quotedstr(DMCNT.wUsuario) + ' CNTUSER, '
            + '        trunc(SysDate) CNTFREG,'
            + '        SysDate CNTHREG,'
//Inicio HPC_201702_CNT: se toma el valor mes del periodo seleccionado            
//+ Quotedstr(FConcBanCob.dbsMEs.Text) + ' CNTMM,'  
            + Quotedstr(copy(vFPeriodo,5,2)) + ' CNTMM,'                
//Fin HPC_201702_CNT
            + Quotedstr(vTMoneda) + ' TMONID,'
            + CurrToStr(vCNTDEBEMN) + ' CNTDEBEMN,'
            + CurrToStr(vCNTDEBEME) + ' CNTDEBEME,'
            + CurrToStr(vCNTHABEMN) + ' CNTHABEMN,'
            + CurrToStr(vCNTHABEME) + ' CNTHABEME,'
            + Quotedstr('BV') + ' CNTTS, '
            + Quotedstr('CNT') + ' MODULO,'
            + Quotedstr('CNT') + ' CNTMODDOC,'
            + InttoStr(vCntReg) + ' CNTREG '
            + '   from DUAL )';
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQLI + xSQL);

      vCntReg := vCntReg + 1;
      vCNTDEBEMN := 0;
      vCNTDEBEME := 0;
      vCNTHABEMN := vCNTMTOORI;
      vCNTHABEME := DMCNT.FRound(vCNTMTOORI / vCNTTCAMBIO, 15, 2);
      xSQL := '(Select ' + quotedstr(FConcBanCob.dblcCia.Text) + ' CIAID,'
            + QuotedStr(dblcTDIARID2.Text) + ' TDIARID,'
            + QuotedStr(vCNTCOMPROB) + ' CNTCOMPROB,'
//Inicio HPC_201702_CNT: se toma el valor año del periodo seleccionado            
//+ QuotedStr(FConcBanCob.dbsAno.Text) + ' CNTANO,' 
            + QuotedStr(copy(vFPeriodo,1,4)) + ' CNTANO,'               
//Fin HPC_201702_CNT
            + QuotedStr(vFPeriodo) + ' CNTANOMM,'
            + QuotedStr(vCuenta2) + ' CUENTAID,'
            + QuotedStr(vClauxid) + ' CLAUXID,'
            + QuotedStr(vAuxid) + ' AUXID,'
            + QuotedStr('23') + ' DOCID,'
            + QuotedStr('0') + ' CNTSERIE,'
            + QuotedStr('0') + ' CNTNODOC,'
            + QuotedStr(edtGlosa.Text) + ' CNTGLOSA,'
            + QuotedStr('H') + ' CNTDH,'
            + QuotedStr(dblcdCCosto2.Text) + ' CCOSID,'
            + CurrToStr(vCNTTCAMBIO) + ' CNTTCAMBIO,'
            + CurrToStr(vCNTMTOORI) + ' CNTMTOORI,'
            + CurrToStr(vCNTMTOLOC) + ' CNTMTOLOC,'
            + CurrToStr(vCNTMTOEXT) + ' CNTMTOEXT,'
            + QuotedStr(vFComprob) + ' CNTFEMIS,'
            + QuotedStr(vFComprob) + ' CNTFVCMTO,'
            + QuotedStr(vFComprob) + ' CNTFCOMP,'
            + QuotedStr('I') + ' CNTESTADO,'
            + QuotedStr('N') + ' CNTCUADRE,'
            + QuotedStr(DMCNT.wUsuario) + ' CNTUSER,'
            + '        trunc(SysDate) CNTFREG,'
            + '        SysDate CNTHREG,'
//Inicio HPC_201702_CNT: se toma el valor mes del periodo seleccionado            
//+ QuotedStr(FConcBanCob.dbsMEs.Text) + ' CNTMM,'  
            + QuotedStr(copy(vFPeriodo,5,2)) + ' CNTMM,'                
//Fin HPC_201702_CNT
            + QuotedStr(vTMoneda) + ' TMONID,'
            + CurrToStr(vCNTDEBEMN) + ' CNTDEBEMN,'
            + CurrToStr(vCNTDEBEME) + ' CNTDEBEME,'
            + CurrToStr(vCNTHABEMN) + ' CNTHABEMN,'
            + CurrToStr(vCNTHABEME) + ' CNTHABEME,'
            + Quotedstr('BV') + ' CNTTS, '
            + QuotedStr('CNT') + ' MODULO,'
            + QuotedStr('CNT') + ' CNTMODDOC,'
            + InttoStr(vCntReg) + ' CNTREG FROM DUAL )';
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQLI + xSQL);
   End
   Else
   Begin
      While Not DMCNT.cdsMovCNT1.Eof Do
      Begin
         If DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString = 'S' Then
         Begin
          //VER SI LA CUENTA PIDE CUENTA AUXILIAR BUSCARLA EN EN CNT201 POR EL DNI  tge202
            If DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsFloat > 0 Then
            Begin
               vDH := 'H';
               vDH2 := 'D';
               vCuenta1 := dblcdCuenta2.Text;
               vCuenta2 := dblcdCuenta1.Text;

               If vTMoneda = 'N' Then
               Begin
                  vCNTMTOORI := DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency;
                  vCNTMTOLOC := DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency;
                  vCNTMTOEXT := DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency / vCNTTCAMBIO;
                  vCNTDEBEMN := 0;
                  vCNTDEBEME := 0;
                  vCNTHABEMN := DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency;
                  vCNTHABEME := DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency / vCNTTCAMBIO;
               End
               Else
               Begin
                  vCNTMTOORI := DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency;
                  vCNTMTOLOC := DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency * vCNTTCAMBIO;
                  vCNTMTOEXT := DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency;
                  vCNTDEBEMN := 0;
                  vCNTDEBEME := 0;
                  vCNTHABEMN := DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency * vCNTTCAMBIO;
                  vCNTHABEME := DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency;
               End;
            End
            Else
            Begin
               vDH := 'D';
               vDH2 := 'H';
               vCuenta1 := dblcdCuenta1.Text;
               vCuenta2 := dblcdCuenta2.Text;
               If vTMoneda = 'N' Then
               Begin
                  vCNTMTOORI := (DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency) * -1;
                  vCNTMTOLOC := (DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency) * -1;
                  vCNTMTOEXT := ((DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency) * -1) / vCNTTCAMBIO;
                  vCNTDEBEMN := (DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency) * -1;
                  vCNTDEBEME := ((DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency) * -1) / vCNTTCAMBIO;
                  vCNTHABEMN := 0;
                  vCNTHABEME := 0;
               End
               Else
               Begin
                  vCNTMTOORI := (DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency) * -1;
                  vCNTMTOLOC := ((DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency) * -1) * vCNTTCAMBIO;
                  vCNTMTOEXT := (DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency) * -1;
                  vCNTDEBEMN := ((DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency) * -1) * vCNTTCAMBIO;
                  vCNTDEBEME := (DMCNT.cdsMovCNT1.FieldByName('IMPORTE').AsCurrency * -1);
                  vCNTHABEMN := 0;
                  vCNTHABEME := 0;
               End;
            End;

          //Contabiliza Detalle
            vCntReg := vCntReg + 1;
            xSQLI := 'Insert Into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CUENTAID, '
                  + '                   CLAUXID, AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, '
                  + '                   CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, '
                  + '                   CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, '
                  + '                   CNTCUADRE, CNTUSER, CNTFREG, CNTHREG, CNTMM, TMONID, '
                  + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTTS, '
                  + '                   MODULO, CNTMODDOC, CNTREG)  ';
            xSQL := '(Select  ' + quotedstr(FConcBanCob.dblcCia.Text) + ' CIAID,'
                  + Quotedstr(dblcTDIARID2.Text) + ' TDIARID ,'
                  + Quotedstr(vCNTCOMPROB) + ' CNTCOMPROB,'
//Inicio HPC_201702_CNT: se toma el valor año del periodo seleccionado                  
//+ Quotedstr(FConcBanCob.dbsAno.Text) + ' CNTANO,' 
                  + Quotedstr(copy(vFPeriodo,1,4)) + ' CNTANO,'               
//Fin HPC_201702_CNT
                  + Quotedstr(vFPeriodo) + ' CNTANOMM,'
                  + Quotedstr(vCuenta1) + ' CUENTAID,'
                  + Quotedstr(vClauxid) + ' CLAUXID,'
                  + Quotedstr(vAuxid) + ' AUXID,'
                  + Quotedstr('23') + ' DOCID,'
                  + Quotedstr('OP') + ' CNTSERIE,'
                  + Quotedstr(DMCNT.cdsMovCNT1.FieldByName('NUMOPERA').AsString) + ' CNTNODOC,'
                  + Quotedstr(DMCNT.cdsMovCNT1.FieldByName('DESCRIPCION').AsString) + ' CNTGLOSA,'
                  + Quotedstr(vDH) + ' CNTDH,'
                  + Quotedstr(dblcdCCosto1.Text) + ' CCOSID,'
                  + CurrToStr(vCNTTCAMBIO) + ' CNTTCAMBIO,'
                  + CurrToStr(vCNTMTOORI) + ' CNTMTOORI,'
                  + CurrToStr(vCNTMTOLOC) + ' CNTMTOLOC,'
                  + CurrToStr(vCNTMTOEXT) + ' CNTMTOEXT,'
                  + Quotedstr(DMCNT.cdsMovCNT1.FieldByName('FECEMISION').AsString) + ' CNTFEMIS,'
                  + Quotedstr(DMCNT.cdsMovCNT1.FieldByName('FECEMISION').AsString) + ' CNTFVCMTO,'
                  + Quotedstr(vFComprob) + ' CNTFCOMP, '
                  + Quotedstr('I') + ' CNTESTADO, '
                  + Quotedstr('N') + ' CNTCUADRE, '
                  + Quotedstr(DMCNT.wUsuario) + ' CNTUSER, '
                  + '        trunc(SysDate) CNTFREG,'
                  + '        SysDate CNTHREG,'
//Inicio HPC_201702_CNT: se toma el valor mes del periodo seleccionado                  
//+ Quotedstr(FConcBanCob.dbsMEs.Text) + ' CNTMM,'  
                  + Quotedstr(copy(vFPeriodo,5,2)) + ' CNTMM,'                
//Fin HPC_201702_CNT
                  + Quotedstr(vTMoneda) + ' TMONID,'
                  + CurrToStr(vCNTDEBEMN) + ' CNTDEBEMN,'
                  + CurrToStr(vCNTDEBEME) + ' CNTDEBEME,'
                  + CurrToStr(vCNTHABEMN) + ' CNTHABEMN,'
                  + CurrToStr(vCNTHABEME) + ' CNTHABEME,'
                  + Quotedstr('BV') + ' CNTTS, '
                  + Quotedstr('CNT') + ' MODULO,'
                  + Quotedstr('CNT') + ' CNTMODDOC,'
                  + InttoStr(vCntReg) + ' CNTREG '
                  + '   from DUAL )';
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQLI + xSQL);

            vCntReg := vCntReg + 1;
            xSQL := '(Select ' + quotedstr(FConcBanCob.dblcCia.Text) + ' CIAID,'
                  + QuotedStr(dblcTDIARID2.Text) + ' TDIARID,'
                  + QuotedStr(vCNTCOMPROB) + ' CNTCOMPROB,'
//Inicio HPC_201702_CNT: se toma el valor año del periodo seleccionado                  
//+ QuotedStr(FConcBanCob.dbsAno.Text) + ' CNTANO,' 
                  + QuotedStr(copy(vFPeriodo,1,4)) + ' CNTANO,'               
//Fin HPC_201702_CNT
                  + QuotedStr(vFPeriodo) + ' CNTANOMM,'
                  + QuotedStr(vCuenta2) + ' CUENTAID,'
                  + QuotedStr(vClauxid) + ' CLAUXID,'
                  + QuotedStr(vAuxid) + ' AUXID,'
                  + QuotedStr('23') + ' DOCID,'
                  + QuotedStr('OP') + ' CNTSERIE,'
                  + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('NUMOPERA').AsString) + ' CNTNODOC,'
                  + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('DESCRIPCION').AsString) + ' CNTGLOSA,'
                  + QuotedStr(vDH2) + ' CNTDH,'
                  + QuotedStr(dblcdCCosto2.Text) + ' CCOSID,'
                  + CurrToStr(vCNTTCAMBIO) + ' CNTTCAMBIO,'
                  + CurrToStr(vCNTMTOORI) + ' CNTMTOORI,'
                  + CurrToStr(vCNTMTOLOC) + ' CNTMTOLOC,'
                  + CurrToStr(vCNTMTOEXT) + ' CNTMTOEXT,'
                  + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('FECEMISION').AsString) + ' CNTFEMIS,'
                  + QuotedStr(DMCNT.cdsMovCNT1.FieldByName('FECEMISION').AsString) + ' CNTFVCMTO,'
                  + QuotedStr(vFComprob) + ' CNTFCOMP,'
                  + QuotedStr('I') + ' CNTESTADO,'
                  + QuotedStr('N') + ' CNTCUADRE,'
                  + QuotedStr(DMCNT.wUsuario) + ' CNTUSER,'
                  + '        trunc(SysDate) CNTFREG,'
                  + '        SysDate CNTHREG,'
//Inicio HPC_201702_CNT: se toma el valor mes del periodo seleccionado                  
//+ QuotedStr(FConcBanCob.dbsMEs.Text) + ' CNTMM,'    
                  + QuotedStr(copy(vFPeriodo,5,2)) + ' CNTMM,'                  
//Fin HPC_201702_CNT
                  + QuotedStr(vTMoneda) + ' TMONID,'
                  + CurrToStr(vCNTHABEMN) + ' CNTHABEMN,'
                  + CurrToStr(vCNTHABEME) + ' CNTHABEME,'
                  + CurrToStr(vCNTDEBEMN) + ' CNTDEBEMN,'
                  + CurrToStr(vCNTDEBEME) + ' CNTDEBEME,'
                  + Quotedstr('BV') + ' CNTTS, '
                  + QuotedStr('CNT') + ' MODULO,'
                  + QuotedStr('CNT') + ' CNTMODDOC,'
                  + InttoStr(vCntReg) + ' CNTREG FROM DUAL )';
            DMCNT.DCOM1.AppServer.EjecutaQry(xSQLI + xSQL);

           //Marca como Contabilizado
            DMCNT.cdsMovCNT1.Edit;
            DMCNT.cdsMovCNT1.FieldByname('NUMCOMPROB').Asstring := vCNTCOMPROB;
            DMCNT.cdsMovCNT1.FieldByname('CODDIARIO').Asstring := dblcTDIARID2.Text;
            DMCNT.cdsMovCNT1.FieldByname('PERANOMM').Asstring := vFPeriodo;
            DMCNT.cdsMovCNT1.FieldByname('FLGCONC').Asstring := 'C';
         End; //End If

         DMCNT.cdsMovCNT1.Next;
      End;
   End; // Fin si no es Totalizado

   //Contabiliza Cabecera
   xSQL := 'Update CNT300 '
         + '   set (CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTGLOSA, CNTLOTE, CNTTCAMBIO, '
         + '        CNTFCOMP, CNTESTADO, CNTCUADRE, CNTUSER, CNTFREG, CNTHREG, CNTANO, '
         + '        CNTMM, TMONID, FLAGVAR, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME,'
         + '        CNTTS, DOCMOD, '
         + '        MODULO )= '
         + '(Select A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, '
         + Quotedstr(edtGlosa.Text) + ' CNTGLOSA, NULL, '
         + '        max(CNTTCAMBIO), '
         + '        max(CNTFCOMP), '
         + '        max(CNTESTADO), '
         + '        MAX(CNTCUADRE), '
         + '        MAX(CNTUSER), MAX( CNTFREG ), MAX( CNTHREG ), '
         + '        A.CNTANO, A.CNTMM, TMONID, null FLAGVAR, '
         + '        SUM(A.CNTDEBEMN), SUM(A.CNTDEBEME), SUM(A.CNTHABEMN), SUM(A.CNTHABEME), '
         + '        MAX(CNTTS), MAX(CNTMODDOC), MAX(MODULO )'
         + '   From CNT311 A '
         + '  Where CIAID=' + quotedstr(FConcBanCob.dblcCia.Text)
         + '    and TDIARID =' + quotedstr(dblcTDIARID2.Text)
         + '    and CNTANOMM=' + quotedstr(vFPeriodo)
         + '    and CNTCOMPROB=' + quotedstr(vCNTCOMPROB)
         + '  Group by A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, '
         + '           A.CNTANO, A.CNTMM,A.TMONID) '
         + ' where CIAID=' + quotedstr(FConcBanCob.dblcCia.Text)
         + '   and TDIARID =' + quotedstr(dblcTDIARID2.Text)
         + '   and CNTANOMM=' + quotedstr(vFPeriodo)
         + '   and CNTCOMPROB=' + quotedstr(vCNTCOMPROB);
   DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);

   //Actualiza Archivo de extracto bancario
   DMCNT.cdsMovCNT1.First;
   While Not DMCNT.cdsMovCNT1.Eof Do
   Begin
      If DMCNT.cdsMovCNT1.FieldByName('FLAG').AsString = 'S' Then
      Begin
         xSQL := 'Update CNT_CONC_EXTR_BAN '
               + '   Set FLGCONC=''C'', '
               + '       NUMCOMPROB=' + quotedstr(vCNTCOMPROB) + ', '
               + '       CODDIARIO=' + quotedstr(dblcTDIARID2.Text) + ', '
               + '       PERANOMM=' + quotedstr(vFPeriodo) + ' '
               + ' Where IDCONC=' + quotedstr(FConcBanCob.xnumconc)
               + '    And IDEXTBAN=' + quotedstr(DMCNT.cdsMovCNT1.FieldByName('IDEXTBAN').AsString);
         DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
      End;
      DMCNT.cdsMovCNT1.Next;
   End;

   DMCNT.cdsMovCNT1.GotoBookmark(B);
   DMCNT.cdsMovCNT1.FreeBookmark(B);
   DMCNT.cdsMovCNT1.EnableControls;
   ShowMessage('Se generó el Comprobante :' + chr(13)
             + ' Para la Compañía  ' + quotedstr(FConcBanCob.dblcCia.Text) + chr(13)
             + ' Tipo de Diario    ' + quotedstr(dblcTDIARID2.Text) + chr(13)
             + ' Año+Mes (Periodo) ' + quotedstr(vFPeriodo) + chr(13)
             + ' Nro. Asiento      ' + quotedstr(vCNTCOMPROB));
End;

Procedure TFConcilBancContab.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMCNT.cdsTMon.Close;
End;

Procedure TFConcilBancContab.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      If Self.ActiveControl Is TMemo Then Exit;
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFConcilBancContab.FormCreate(Sender: TObject);
Var
   xSQL: String;
Begin
   dblcdCuenta1.LookUpField := 'CUENTAID';
   dblcdCuenta1.LookupTable := DMCNT.cdsCuenta;

   dblcdCuenta2.LookUpField := 'CUENTAID';
   dblcdCuenta2.LookupTable := DMCNT.cdsCuenta;

   xSQL := 'Select CCOSID, CCOSDES, CCOSABR, CCOSNIV, CCOSMOV '
      + '  from TGE203 '
      + ' where CCOSMOV=' + quotedstr('S')
      + '   and CCOSACT=''S'' '
      + '   and CCOSCIAS LIKE ''%' + FConcBanCob.dblcCia.text + '%''';
   DMCNT.cdsCCosto.Close;
   DMCNT.cdsCCosto.DataRequest(xSQL);
   DMCNT.cdsCCosto.Open;
   dblcdCCosto1.LookupTable := DMCNT.cdsCCosto;
   dblcdCCosto1.LookupField := 'CCOSID';
   lblCCosto1.Enabled := False;
   dblcdCCosto1.Enabled := False;

   dblcdCCosto2.LookupTable := DMCNT.cdsCCosto;
   dblcdCCosto2.LookupField := 'CCOSID';
   lblCCosto2.Enabled := False;
   dblcdCCosto2.Enabled := False;

   //Inicio HPC_201702_CNT: se inicializan las variables para el manejo del periodo
   sMes := copy(formatdatetime('YYYYMM', NOW()),5,2);
   sAno := copy(formatdatetime('YYYYMM', NOW()),1,4);
   dbsMes.Text:=sMes;
   dbsAno.Text:=sAno;
   //Fin HPC_201702_CNT
End;

Procedure TFConcilBancContab.dblcdCuenta1Exit(Sender: TObject);
Begin
   If dblcdCuenta1.Text = '' Then
   Begin
      ShowMessage('Ingrese Cuenta Contable');
      dblcdCuenta1.SetFocus;
      exit;
   End;
   edtCuenta1.Text := '';
   edtCuenta1.Text := DMCNT.cdsCuenta.FieldByName('CTAABR').AsString;

   If length(edtCuenta1.Text) = 0 Then
   Begin
      ShowMessage('Ingrese correctamente la Cuenta Contable');
      dblcdCuenta1.SetFocus;
      exit;
   End;

// verifica que sea Cuenta de Movimientos
   If DMCNT.cdsCuenta.FieldByName('CTA_MOV').Asstring <> 'S' Then
   Begin
      If (DMCNT.cdsCuenta.FieldByName('CTA_DET').Asstring = 'S') And
         (DMCNT.cdsCuenta.FieldByName('CTA_DEST').AsString = 'S') And
         (DMCNT.cdsCuenta.FieldByName('FLGVAR').AsString = 'S') Then
      Else
      Begin
         dblcdCuenta1.setfocus;
         ShowMessage('Cuenta No es de Movimientos, Verifique!');
         exit;
      End;
   End;

   If DMCNT.cdsCuenta.FieldByName('CTA_CCOS').Asstring = 'S' Then
   Begin
      lblCCosto1.Enabled := True;
      dblcdCCosto1.Enabled := True;
      dblcdCCosto1.SetFocus;
   End;
End;

Procedure TFConcilBancContab.dblcdCuenta2Exit(Sender: TObject);
Begin
   If dblcdCuenta2.Text = '' Then
   Begin
      ShowMessage('Ingrese Cuenta Contable');
      dblcdCuenta2.SetFocus;
      exit;
   End;
   edtCuenta2.Text := '';
   edtCuenta2.Text := DMCNT.cdsCuenta.FieldByName('CTAABR').AsString;

   If length(edtCuenta2.Text) = 0 Then
   Begin
      ShowMessage('Ingrese correctamente la Cuenta Contable');
      dblcdCuenta2.SetFocus;
      exit;
   End;

// verifica que sea Cuenta de Movimientos
   If DMCNT.cdsCuenta.FieldByName('CTA_MOV').Asstring <> 'S' Then
   Begin
      If (DMCNT.cdsCuenta.FieldByName('CTA_DET').Asstring = 'S') And
         (DMCNT.cdsCuenta.FieldByName('CTA_DEST').AsString = 'S') And
         (DMCNT.cdsCuenta.FieldByName('FLGVAR').AsString = 'S') Then
      Else
      Begin
         dblcdCuenta2.setfocus;
         ShowMessage('Cuenta No es de Movimientos, Verifique!');
         exit;
      End;
   End;

   If DMCNT.cdsCuenta.FieldByName('CTA_CCOS').Asstring = 'S' Then
   Begin
      lblCCosto2.Enabled := True;
      dblcdCCosto2.Enabled := True;
      dblcdCCosto2.SetFocus;
   End;
End;

Procedure TFConcilBancContab.dblcdCCosto1Exit(Sender: TObject);
Begin
   If Not DMCNT.cdsCCosto.Locate('CCOSID', VarArrayOf([dblcdCCosto1.Text]), []) Then
   Begin
      ShowMessage('Centro de costo inválido');
      dblcdCCosto1.SetFocus;
      exit;
   End;
   edtCCosto1.Text := DMCNT.cdsCCosto.FieldByname('CCOSDES').AsString
End;

Procedure TFConcilBancContab.dblcdCCosto2Exit(Sender: TObject);
Begin
   If Not DMCNT.cdsCCosto.Locate('CCOSID', VarArrayOf([dblcdCCosto2.Text]), []) Then
   Begin
      ShowMessage('Centro de costo inválido');
      dblcdCCosto2.SetFocus;
      exit;
   End;
   edtCCosto2.Text := DMCNT.cdsCCosto.FieldByname('CCOSDES').AsString
End;

//Inicio HPC_201702_CNT: nueva rutina de validación para el manejo del periodo
function TFConcilBancContab.ValidarPeriodo:Boolean;
begin
    dbsMEs.Text := DMCNT.StrZero(dbsMEs.Text, 2);

    If (Not ValidarPeriodoCerrado) Then
    Begin
        Result:=false;
        exit;
    End;

    Result:= true;
end;
//Fin HPC_201702_CNT

//Inicio HPC_201702_CNT: nueva rutina de validación para el manejo del periodo
function TFConcilBancContab.ValidarPeriodoCerrado: Boolean;
begin
   xSQL := 'Select * '
         + '  from TGE154 '
         + ' where CIAID=' + quotedstr(FConcBanCob.dblcCia.text)
         + '   and ANO=' + quotedstr(dbsAno.Text);
   DMCNT.cdsCierres.close;
   DMCNT.cdsCierres.datarequest(xSQL);
   DMCNT.cdsCierres.open;
   Result := True;
   If DMCNT.cdsCierres.FieldByName('PER' + dbsMEs.Text).AsString = 'S' Then
   Begin
      Showmessage('El periodo se encuentra Cerrado');
      result := false;
      exit;
   End
end;
//Fin HPC_201702_CNT

End.

