unit CNT260I;
// Actualizaciones
// HPC_201501_CNT          12/02/2015  Regulariza Métodos Correctos de Control Transaccional

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbedit, StdCtrls, Buttons, ComCtrls, Mask, Spin, wwdblook, ExtCtrls,
  wwdbdatetimepicker, oaContabiliza, oaVariables;

type
  TFTransferenciaInc = class(TForm)
    Panel1: TPanel;
    lblCia: TLabel;
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    bbtnOk: TBitBtn;
    bbtnCanc: TBitBtn;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    edtAnoMM: TEdit;
    dtpFCont: TwwDBDateTimePicker;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    rgElimina: TRadioGroup;
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure speAnoExit(Sender: TObject);
    procedure speMMExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dtpFContExit(Sender: TObject);
    procedure RadioGroup1Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnCancClick(Sender: TObject);
    procedure IniciaDatos;

    // Contabilidad
    procedure GeneraContabilidad( xxCia, xxTDiario, xxAnoMM: String;
                                  xForma: TForm );
    procedure CreaPanel( xForma:TForm; xMensaje:String );
    procedure PanelMsg( xMensaje:String; xProc:Integer );
    function  Contabiliza( xCia, xTDiario, xAnoMM : String ): Boolean;
    procedure GeneraEnLinea401( xxxCia,xxxDiario,xxxAnoMM: String );
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
//    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    xMesT,xMes,xAno : string;
    xDigitos,xDigitos1 : Integer;
    procedure GrabaSaldos;
  public
    { Public declarations }
  end;

  procedure CNTransferenciaInc; stdcall;

exports
  CNTransferenciaInc;

var
  FTransferenciaInc: TFTransferenciaInc;
  wtcambio : string;
  pnlConta   : TPanel;
  pbConta    : TProgressBar;
  wTIPOREG2  : String;
  wcampo : string;

implementation

uses CNTDM;

{$R *.DFM}

procedure CNTransferenciaInc;
begin
   if DMCNT=nil then exit;
  if not DMCNT.DCOM1.Connected then Exit;
  FTransferenciaInc := TFTransferenciaInc.Create( Application );
  try
    FTransferenciaInc.ShowModal;
  finally
    FTransferenciaInc.Free;
  end;
end;


procedure TFTransferenciaInc.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then
      edtCia.Text:=DMCNT.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Falta Definición de Compañía') ;
      dblcCia.SetFocus ;
      exit;
   end ;
   speAno.setfocus;
end;

procedure TFTransferenciaInc.IniciaDatos;
var
   xano, xmes, xdia : word;
begin
   dblcCia.Text:='';
   edtcia.text:='';
   DecodeDate(date, xano, xmes, xdia);
   speAno.value:=xano;
   speMM.value:=xmes;
   dtpFCont.date:=date;
   RadioGroup1.ItemIndex := 0;
   dblcCia.SetFocus;
end;

procedure TFTransferenciaInc.bbtnOkClick(Sender: TObject);
var
	 xSQL,xSQL1,xSQL2, xDiarios : string;
	 xWhere,xano,xmes : string;
	 xcantidad : string;
	 xZ : integer;
begin

	 if rgElimina.ItemIndex=2 then begin
			ShowMessage('No Insertara Registros');
			Exit;
	 end;

	 // Actualiza Archivo de Auxiliares

	 xSQL:='Insert into CNT351 ( CODI_TAB, ARGU_TAB, DESC_TAB, DBRE_TAB, NRUC_TAB, CLAUXID, AUXID, CIAID ) '
				+'SELECT ''01'' CODI_TAB, A.CCTE_DET, '
				+  'COALESCE(DESC_TAB, A.CCTE_DET) DESC_TAB, '
				+  'COALESCE(DBRE_TAB, A.CCTE_DET) DBRE_TAB, '
				+  'CASE WHEN E.ARGU_TAB='''' OR E.ARGU_TAB IS NULL THEN ''NA'' ELSE NRUC_TAB END NRUC_TAB, '
				+  'CASE WHEN CLAUXID='''' OR CLAUXID IS NULL THEN ''01'' ELSE CLAUXID END CLAUXID, '
				+  'CASE WHEN AUXID='''' OR AUXID IS NULL THEN A.CCTE_DET ELSE AUXID END AUXID, '
				+  '''10'' CIAID '
				+'FROM CNT350 A '
				+  'LEFT  JOIN CNT351 E ON (A.CCTE_DET=E.ARGU_TAB AND E.CODI_TAB=''01'') '
				+'WHERE A.CCTE_DET<>'''' '
				+'GROUP BY CODI_TAB, E.ARGU_TAB,  A.CCTE_DET,  CLAUXID, AUXID, DESC_TAB, DBRE_TAB, NRUC_TAB '
				+'HAVING AUXID='''' OR AUXID IS NULL ';

	 DMCNT.DCOM1.AppServer.IniciaTransaccion;
	 try
			DMCNT.DCOM1.AppServer.EjecutaQry( xSQL );
			DMCNT.DCOM1.AppServer.GrabaTransaccion;
	 except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
	 end;

	 // Actualiza CNT201

	 xSQL:='Insert Into CNT201( CLAUXID, AUXID, AUXNOMB, AUXABR, AUXRUC ) '
				+'Select A.CLAUXID, A.AUXID, A.DESC_TAB, A.DBRE_TAB, A.NRUC_TAB  from CNT351 A '
				+  'LEFT JOIN CNT201 B ON A.CLAUXID=B.CLAUXID AND A.AUXID=B.AUXID '
				+  'WHERE A.CODI_TAB=''01'' AND B.AUXID IS NULL ';

	 DMCNT.DCOM1.AppServer.IniciaTransaccion;
	 try
			DMCNT.DCOM1.AppServer.EjecutaQry( xSQL );
			DMCNT.DCOM1.AppServer.GrabaTransaccion;
	 except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
	 end;

	 //
	 // Verificar los Asiento
	 {
SELECT  CIAID, TDIARID, CNTANOMM, CNTCOMPROB,
		SUM( CASE WHEN CNTDH='D' THEN CNTMTOLOC ELSE 0 END ) DEBE,
		SUM( CASE WHEN CNTDH='H' THEN CNTMTOLOC ELSE 0 END ) HABER
 FROM CNT301
WHERE CIAID='10' AND CNTANOMM='200201'
GROUP BY CIAID, TDIARID, CNTANOMM, CNTCOMPROB
HAVING SUM( CASE WHEN CNTDH='D' THEN CNTMTOLOC ELSE 0 END ) <>
			 SUM( CASE WHEN CNTDH='H' THEN CNTMTOLOC ELSE 0 END )
ORDER BY CIAID, TDIARID, CNTANOMM, CNTCOMPROB
		}
	 // Seleciona los Diarios a Transferir

	 xSQL:='SELECT ORIG_DET TDIARID, COUNT(*) FROM CNT350 '
				+'GROUP BY ORIG_DET '
				+'ORDER BY ORIG_DET ';
	 DMCNT.cdsQry.Close;
	 DMCNT.cdsQry.dataRequest( xSQL );
	 DMCNT.cdsQry.Open;

	 xDiarios:=''''+DMCNT.cdsQry.FieldByName('TDIARID').AsString+'''';
	 DMCNT.cdsQry.Next;
	 while not DMCNT.cdsQry.Eof do begin
			xDiarios:=xDiarios+', '''+DMCNT.cdsQry.FieldByName('TDIARID').AsString+'''';
			DMCNT.cdsQry.Next;
	 end;

	 bbtnOk.Enabled := False;
	 bbtnCanc.Enabled := False;
	 DMCNT.cdsTDiario.IndexFieldNames := 'TDIARID';
	 DMCNT.cdsTDiario.First;

	 DMCNT.cdsTDiario.Filter:='TDIARID IN ( ' + xDiarios +' )';
	 DMCNT.cdsTDiario.Filtered:=True;

	 if strtoint(speMM.text)=0 then  xmes:='00'
	 else if length(speMM.text)=1 then xmes:='0'+speMM.text
	 else xmes:=copy(speMM.text,1,2);
	 xano:=speAno.text;

	 // Valida si la transferencia ya se efectuo anteriormente
	 xWhere   :='CIAID='+quotedstr(dblcCia.Text)+' AND CNTANOMM='+quotedstr(speAno.text+xmes);
	 xcantidad:=DMCNT.DisplayDescrip('PrvTGE','CNT301','COUNT(*) AS CANTIDAD',xWhere,'CANTIDAD');

	 if strtoint(xcantidad)>0 then
	 begin
			if MessageDlg('La Transferencia ya fue efectuada, desea volver a generarla?',
				 mtConfirmation, [mbYes, mbNo], 0) = mrNo then
			begin
				 bbtnOk.enabled:=True;
				 bbtnCanc.enabled:=True;
				 Screen.Cursor:=crDefault;
				 exit;
			end;
	 end;

	 Screen.Cursor:=crHourGlass;

	 if rgElimina.ItemIndex=0 then begin

			Screen.Cursor:=crHourGlass;
			xSQL:='DELETE FROM CNT300 WHERE CIAID='+QuotedStr(dblcCia.Text)+'AND CNTANOMM='+QuotedStr(speAno.text+xmes);
			DMCNT.DCOM1.AppServer.IniciaTransaccion;
			try
			 DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
			 DMCNT.DCOM1.AppServer.GrabaTransaccion;
			except
         // Inicio HPC_201501_CNT
            //DMCNT.DCOM1.AppServer.RegresaTransaccion;
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
         // Fin HPC_201501_CNT
			end;

			xSQL:='DELETE FROM CNT301 WHERE CIAID='+QuotedStr(dblcCia.Text)+'AND CNTANOMM='+QuotedStr(speAno.text+xmes);
			DMCNT.DCOM1.AppServer.IniciaTransaccion;
			try
			 DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
			 DMCNT.DCOM1.AppServer.GrabaTransaccion;
			except
         // Inicio HPC_201501_CNT
            //DMCNT.DCOM1.AppServer.RegresaTransaccion;
            DMCNT.DCOM1.AppServer.RetornaTransaccion;
         // Fin HPC_201501_CNT
			end;
	 end;

	 For xZ := 1 to DMCNT.cdsTDiario.RecordCount  do //ListBox1.Items.Count -1 do
	 begin
			dblcTDiario.text := DMCNT.cdsTDiario.fieldbyname('TDIARID').AsString;//ListBox1.Items.Strings[xZ];
			edtTDiario.text := DMCNT.cdsTDiario.fieldbyname('TDIARDES').AsString;
			dblcTDiario.Refresh;
			edtTDiario.Refresh;
		 // INICIA PROCESO DE TRANSFERENCIA
			// Ingresa movimiento contable
			if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
			begin
				 xSQL1:=
					'INSERT INTO CNT301 '
					+'SELECT '+quotedstr(dblcCia.Text)+', A.ORIG_DET, '
							+'case when length(rtrim(ltrim(NCOM_DET)))=0 then '+quotedstr('0000000000')+' '
							+'     when length(rtrim(ltrim(NCOM_DET)))=1 then '+quotedstr('000000000')+'||rtrim(ltrim(NCOM_DET))'+' '
							+'     when length(rtrim(ltrim(NCOM_DET)))=2 then '+quotedstr('00000000')+'||rtrim(ltrim(NCOM_DET))'+' '
							+'     when length(rtrim(ltrim(NCOM_DET)))=3 then '+quotedstr('0000000')+'||rtrim(ltrim(NCOM_DET))'+' '
							+'     when length(rtrim(ltrim(NCOM_DET)))=4 then '+quotedstr('000000')+'||rtrim(ltrim(NCOM_DET))'+' '
							+'     when length(rtrim(ltrim(NCOM_DET)))=5 then '+quotedstr('00000')+'||rtrim(ltrim(NCOM_DET))'+' '
							+'     when length(rtrim(ltrim(NCOM_DET)))=6 then '+quotedstr('0000')+'||rtrim(ltrim(NCOM_DET))'+' '
							+'     when length(rtrim(ltrim(NCOM_DET)))=7 then '+quotedstr('000')+'||rtrim(ltrim(NCOM_DET))'+' '
							+'     when length(rtrim(ltrim(NCOM_DET)))=8 then '+quotedstr('00')+'||rtrim(ltrim(NCOM_DET))'+' '
							+'     when length(rtrim(ltrim(NCOM_DET)))=9 then '+quotedstr('0')+'||rtrim(ltrim(NCOM_DET))'+' '
							+'else '+'rtrim(ltrim(NCOM_DET))'+' '+'END CNTCOMPROB, '
					+'B.FECANO CNTANO, B.FECANO||B.FECMES CNTANOMM, '+quotedstr('0000')+'CNTLOTE, '
					+'H.CUENTAID, ' // Cuenta Equivalente
					+'CASE WHEN COALESCE(A.CCTE_DET,''NULO'')=''NULO'' THEN NULL ELSE E.CLAUXID END CLAUXID, ' // Clase de Auxiliar
					+'CASE WHEN COALESCE(A.CCTE_DET,''NULO'')=''NULO'' THEN NULL ELSE E.AUXID   END AUXID, '
					+'TIPO_DET DOCID, '+quotedstr('000')+' CNTSERIE, '
					+'A.NDOC_DET,SUBSTR(A.GLOS_DET,1,30), '
					+' A.DEHA_DET, CASE WHEN COALESCE(A.CCOS_DET,''NULO'')=''NULO'' THEN NULL ELSE A.CCOS_DET END, '
					+wTCambio+', '
					+' A.IMPO_DET CNTMTOORI, '
					+' A.IMPO_DET CNTMTOLOC, '
					+' ROUND(A.IMPO_DET/'+wTCambio+',2) CNTMTOEXT, '
					+' A.FEDO_DET CNTFEMIS, '
					+' DATE(B.FECDIA||'+quotedstr('/')+'||B.FECMES||'+quotedstr('/')+'||B.FECANO) CNTFVCMTO, '
					+' DATE(B.FECDIA||'+quotedstr('/')+'||B.FECMES||'+quotedstr('/')+'||B.FECANO) CNTFCOMP, '
					+quotedstr('P')+', '+quotedstr('S')+', '+quotedstr(' ')+', '+quotedstr(DMCNT.wUsuario)+', '
					+wRepFecServi+', '+wRepHorServi+', B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, '
					+' B.FECAATRI, B.FECAASEM, B.FECAASS,''01'' TMONID, '
					+quotedstr(' ')+', '+quotedstr(' ')+', '+quotedstr(' ')+', '
					+'SUBSTR(C.TDIARDES,1,20), SUBSTR(D.CTADES,1,40), SUBSTR(G.CLAUXDES,1,15), '
					+quotedstr(' ')+', '+quotedstr(' ')+', '
					+'CASE WHEN A.DEHA_DET=''D'' THEN A.IMPO_DET ELSE 0 END CNTDEBEMN, '
					+'CASE WHEN A.DEHA_DET=''D'' THEN DEC(A.IMPO_DET/'+wTCambio+',15,2) ELSE 0 END CNTDEBEME, '
					+'CASE WHEN A.DEHA_DET=''H'' THEN A.IMPO_DET ELSE 0 END CNTHABEMN, '
					+'CASE WHEN A.DEHA_DET=''H'' THEN DEC(A.IMPO_DET/'+wTCambio+',15,2) ELSE 0 END CNTHABEME, '
					+'0, 0, '+quotedstr(' ')+', '+quotedstr(' ')+', '+quotedstr(' ')+', '+quotedstr('DB2')+', CAST(ITEM_DET AS DECIMAL(6)), '
					+QuotedStr('INCORESA')+', '+quotedstr(' ');

				xSQL2:=
				 ' FROM CNT350 A '
				 //+'LEFT OUTER JOIN TGE114 B ON ( B.FECHA=A.FEIN_DET )'
				 +'LEFT OUTER JOIN TGE114 B ON '
				 +	'( B.FECHA=CASE WHEN YEAR( FEIN_DET )=2002 '
				 + 						      'THEN FEIN_DET '
				 +									' ELSE DATE( RTRIM(CHAR(DAY(FEIN_DET)))||''/''||RTRIM(CHAR(MONTH(FEIN_DET)))||''/2002'' ) '
				 +			      'END ) '
				 +'LEFT OUTER JOIN TGE104 C ON(C.TDIARID='+quotedstr(dblcTDiario.Text)+') '
				 +'Left Join  CNT250 H ON ( H.CIAID='''+dblcCia.Text+''' AND H.CUENTACLI=A.NCTA_DET ) '
				 +'LEFT JOIN  TGE202 D ON ( D.CIAID='+quotedstr(dblcCia.Text)+' AND D.CUENTAID=A.NCTA_DET ) '
				 +'LEFT OUTER JOIN CNT351 E ON(A.CCTE_DET=E.ARGU_TAB AND E.CODI_TAB=''01'') '
				 +'LEFT OUTER JOIN TGE102 G ON (E.CLAUXID=G.CLAUXID) '
				 +'LEFT OUTER JOIN CNT405 F ON(F.CLAUIDOR=A.CCTE_DET) '
				 +'WHERE A.CIAID='''+dblcCia.Text+''' and A.ORIG_DET='+quotedstr(dblcTDiario.text)
				 + ' AND MONTH( A.FEIN_DET )='+IntToStr( speMM.Value );
			end;
			xSQL:=xSQL1+xSQL2;
//      DMCNT.DCOM1.AppServer.IniciaTransaccion;
			try
				 DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
//         DMCNT.DCOM1.AppServer.GrabaTransaccion;
			except
//         DMCNT.DCOM1.AppServer.RegresaTransaccion;
					 ShowMessage('Error al Insertar...');
			end;
			GeneraContabilidad(dblccia.text,dblcTDiario.text,speano.text+xmes,FTransferenciaInc);
			DMCNT.cdsTDiario.Next;
	 end;

	 // Elimina Mayorización
	 xSQL:=' UPDATE CNT401 '+
				 ' SET DEBEMN'+xmes+'=0, '+
				 '     HABEMN'+xmes+'=0, '+
				 '     DEBEME'+xmes+'=0, '+
				 '     HABEME'+xmes+'=0, '+
				 '     SALDMN'+xmes+'=0, '+
				 '     SALDME'+xmes+'=0 '+
				 '     WHERE CIAID='+QuotedStr(dblcCia.Text)+' AND ANO='+quotedstr(speAno.text);
	 DMCNT.DCOM1.AppServer.IniciaTransaccion;
	 try
		DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
		DMCNT.DCOM1.AppServer.GrabaTransaccion;
	 except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
	 end;

	 // Mayorizar
	 if SOLConta(dblcCia.Text, '', speano.text+xmes, '',
			SRV_D, 'M', DMCNT.wModulo, DMCNT.cdsMovCNT1, DMCNT.cdsNivel,
			DMCNT.cdsResultSet, DMCNT.DCOM1, Self ) then
	 begin
			ShowMessage( 'Ok Mayorización' );
	 end;

   Screen.Cursor:=crDefault;
   ShowMessage('Grabación Exitosa');
   Close;
end;

procedure TFTransferenciaInc.speAnoExit(Sender: TObject);
begin
	 speMM.setfocus;
end;

procedure TFTransferenciaInc.speMMExit(Sender: TObject);
var
 xAnoP, xMesP : integer;

begin
   edtAnoMM.text:=speAno.text+'/'+speMM.text;
   xMesP := StrToInt(speMM.text) + 1;
   If xMesP > 12 then
    begin
     xAnoP := StrToInt(speAno.text) + 1;
     xMesP := 1;
    end
   else xAnoP := StrToInt(speAno.text);
   dtpFCont.Date := StrToDate('01/'+IntToStr(xMesP)+'/'+IntToStr(xAnoP)) - 1;
   dtpFCont.setfocus;
//	 dblcTDiario.setfocus;
end;

procedure TFTransferenciaInc.dblcTDiarioExit(Sender: TObject);
begin
   edtTDiario.Text:='';
   if dblcTDiario.Text<>'' then
      edtTDiario.Text:=DMCNT.cdsTDiario.FieldByName('TDIARDES').AsString;
   if length(edtTDiario.Text)=0 then
   begin
      ShowMessage('Falta Definición de Tipo de Diario') ;
      dblcTDiario.SetFocus ;
      exit;
   end ;
   dtpFCont.setfocus;
end;

procedure TFTransferenciaInc.dtpFContExit(Sender: TObject);
var
	 xWhere,xfecha : string;
begin
   if length(dtpFCont.Text)=0 then
   begin
      ShowMessage('Falta Definición de Fecha contable') ;
      dtpFCont.SetFocus ;
      exit;
   end;

   xWhere := 'FECHA='+quotedstr(formatdatetime(wFormatFecha,dtpFCont.date));
   xfecha:=DMCNT.DisplayDescrip('PrvTGE','TGE107','*',xWhere,'FECHA');
   if length(xfecha)=0 then
   begin
      ShowMessage('Fecha contable no esta registrada en Tipo de Cambio');
      dtpFCont.SetFocus ;
      exit;
   end;

	 RadioGroup1.setfocus;
end;

procedure TFTransferenciaInc.RadioGroup1Exit(Sender: TObject);
begin
// Determina el tipo de cambio
   if RadioGroup1.itemindex=0 then wcampo:='TCAMVBC'
   else if RadioGroup1.itemindex=1 then wcampo:='TCAMVBV'
   else if RadioGroup1.itemindex=2 then wcampo:='TCAMVPC'
   else if RadioGroup1.itemindex=3 then wcampo:='TCAMVPV'
   else if RadioGroup1.itemindex=4 then wcampo:='TCAMVOC'
   else if RadioGroup1.itemindex=5 then wcampo:='TCAMVOV'
   else if RadioGroup1.itemindex=6 then wcampo:='TCAMVXC'
   else wcampo:='TCAMVXV';

   wtcambio:=DMCNT.cdsQry.fieldbyname(wcampo).AsString;
   if length(wtcambio)=0 then
   begin
      ShowMessage('Tipo de cambio no registrado en la fecha dada') ;
      RadioGroup1.SetFocus ;
      exit;
   end;

	 bbtnOk.setfocus;
end;

procedure TFTransferenciaInc.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFTransferenciaInc.bbtnCancClick(Sender: TObject);
begin
	 Iniciadatos;
end;

/////////////////////////////////////////////
///                                       ///
///    PROCEDIMIENTOS PARA CONTABILIDAD   ///
///                                       ///
/////////////////////////////////////////////

procedure TFTransferenciaInc.GeneraContabilidad( xxCia, xxTDiario, xxAnoMM: String;
                                   xForma: TForm );
begin
   wTIPOREG2:='RRN( CNT301 ) ';

   CreaPanel( xForma, 'Contabilizando' );

   if Contabiliza( xxCia, xxTDiario, xxAnoMM ) then
      PanelMsg( 'Asiento Contabilizando Final',0 );

   pnlConta.Free;
end;

function TFTransferenciaInc.Contabiliza( xCia, xTDiario, xAnoMM : String ): Boolean;
Var
   xSQL : String;
begin

   // Genera Cabecera de Contabilidad
  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
   xSQL:='INSERT INTO CNT300 ';
   xSQL:=xSQL+ '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, ';
   xSQL:=xSQL+ 'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, ';
   xSQL:=xSQL+ 'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, ';
   xSQL:=xSQL+ 'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, ';
   xSQL:=xSQL+ 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, ';
   xSQL:=xSQL+ 'CNTTS,DOCMOD ) ' ;

   xSQL:=xSQL+ 'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE, ';
   xSQL:=xSQL+ '''M:'''+'||A.CNTMODDOC||'+''' D:'''+'||A.TDIARID||'+''' P:'''+'||A.CNTANOMM||'+''' C:'''+'||A.CNTCOMPROB, ';
   xSQL:=xSQL+ 'SUM( CASE WHEN A.FLAGVAR=''T'' THEN A.CNTTCAMBIO ELSE 0 END ), ';
   xSQL:=xSQL+ 'A.CNTFCOMP, ''P'', ''S'', ';
   xSQL:=xSQL+ ''''+DMCNT.wUsuario+''''+', '+wRepFecServi+', '+wRepHorServi+', A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
   xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, '+quotedstr('01')+', '' '', ';
   xSQL:=xSQL+ 'A.TDIARDES, ';
   xSQL:=xSQL+ 'SUM('+wReplacCeros+'(A.CNTDEBEMN,0)), SUM('+wReplacCeros+'(A.CNTDEBEME,0)), SUM('+wReplacCeros+'(A.CNTHABEMN,0)), SUM('+wReplacCeros+'(A.CNTHABEME,0)), ';
   xSQL:=xSQL+ ''''+Copy( wcampo,6,2 )+''''+',''AS/400'' ';

   xSQL:=xSQL+ 'FROM CNT301 A ';
   xSQL:=xSQL+ 'WHERE A.CIAID='     +''''+xCia    +''''+' AND ';
   xSQL:=xSQL+       'A.TDIARID='   +''''+xTDiario+''''+' AND ';
   xSQL:=xSQL+       'A.CNTANOMM='  +''''+xAnoMM  +'''';
   xSQL:=xSQL+ ' GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, ';
   xSQL:=xSQL+ 'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
   xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
   xSQL:=xSQL+ 'A.TDIARDES, A.CNTMODDOC';
  end
  else
   if SRV_D = 'ORACLE' then
    begin
     xSQL:='INSERT INTO CNT300 ';
     xSQL:=xSQL+ '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, ';
     xSQL:=xSQL+ 'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, ';
     xSQL:=xSQL+ 'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, ';
     xSQL:=xSQL+ 'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, ';
     xSQL:=xSQL+ 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, ';
     xSQL:=xSQL+ 'CNTTS,DOCMOD ) ' ;

     xSQL:=xSQL+ 'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE, ';
     xSQL:=xSQL+ '''M:'''+'||A.CNTMODDOC||'+''' D:'''+'||A.TDIARID||'+''' P:'''+'||A.CNTANOMM||'+''' C:'''+'||A.CNTCOMPROB, ';
     xSQL:=xSQL+ 'SUM( DECODE(A.FLAGVAR,''T'',A.CNTTCAMBIO,0)), ';
     xSQL:=xSQL+ 'A.CNTFCOMP, ''P'', ''S'', ';
     xSQL:=xSQL+ ''''+DMCNT.wUsuario+''''+', '+wRepFecServi+', '+wRepFecServi+', A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
     xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, '+quotedstr('01')+', '' '', ';
     xSQL:=xSQL+ 'A.TDIARDES, ';
     xSQL:=xSQL+ 'SUM('+wReplacCeros+'(A.CNTDEBEMN,0)), SUM('+wReplacCeros+'(A.CNTDEBEME,0)), SUM('+wReplacCeros+'(A.CNTHABEMN,0)), SUM('+wReplacCeros+'(A.CNTHABEME,0)), ';
     xSQL:=xSQL+ ''''+Copy( wcampo,6,2 )+''''+',''ORACLE'' ';
     xSQL:=xSQL+ 'FROM CNT301 A ';
     xSQL:=xSQL+ 'WHERE A.CIAID='     +''''+xCia    +''''+' AND ';
     xSQL:=xSQL+       'A.TDIARID='   +''''+xTDiario+''''+' AND ';
     xSQL:=xSQL+       'A.CNTANOMM='  +''''+xAnoMM  +'''';
     xSQL:=xSQL+ ' GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, ';
     xSQL:=xSQL+ 'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
     xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
     xSQL:=xSQL+ 'A.TDIARDES, A.CNTMODDOC';
   end;
  DMCNT.DCOM1.AppServer.IniciaTransaccion;
  try
  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
  DMCNT.DCOM1.AppServer.GrabaTransaccion;
  except
  // Inicio HPC_201501_CNT
     //DMCNT.DCOM1.AppServer.RegresaTransaccion;
     DMCNT.DCOM1.AppServer.RetornaTransaccion;
  // Fin HPC_201501_CNT
  end;
  Result:=True;
end;

procedure TFTransferenciaInc.GeneraEnLinea401( xxxCia,xxxDiario,xxxAnoMM: String );
var
   xNumNiv : Integer;
   xCuenta,xNivel,xSql : String;
   xZ : Integer;
   xNiv : Array[1..10] of integer;
   xMesA : String;
begin
   xAno := Copy(xxxAnoMM,1,4);
   xMes := Copy(xxxAnoMM,5,2);


    xsql := 'Insert into CNT401 '+
             ' (CIAID, CUENTAID, CTADES, TIPO,CTA_MOV,ANO,'+
             'DEBEMN00,DEBEMN01,DEBEMN02,DEBEMN03,DEBEMN04,DEBEMN05,DEBEMN06,'+
             'DEBEMN07,DEBEMN08,DEBEMN09,DEBEMN10,DEBEMN11,DEBEMN12,DEBEMN13,'+
             'DEBEME00,DEBEME01,DEBEME02,DEBEME03,DEBEME04,DEBEME05,DEBEME06,'+
             'DEBEME07,DEBEME08,DEBEME09,DEBEME10,DEBEME11,DEBEME12,DEBEME13,'+
             'HABEMN00,HABEMN01,HABEMN02,HABEMN03,HABEMN04,HABEMN05,HABEMN06,'+
             'HABEMN07,HABEMN08,HABEMN09,HABEMN10,HABEMN11,HABEMN12,HABEMN13,'+
             'HABEME00,HABEME01,HABEME02,HABEME03,HABEME04,HABEME05,HABEME06,'+
             'HABEME07,HABEME08,HABEME09,HABEME10,HABEME11,HABEME12,HABEME13,'+
             'SALDMN00,SALDMN01,SALDMN02,SALDMN03,SALDMN04,SALDMN05,SALDMN06,'+
             'SALDMN07,SALDMN08,SALDMN09,SALDMN10,SALDMN11,SALDMN12,SALDMN13,'+
             'SALDME00,SALDME01,SALDME02,SALDME03,SALDME04,SALDME05,SALDME06,'+
             'SALDME07,SALDME08,SALDME09,SALDME10,SALDME11,SALDME12,SALDME13)'+
             ' select TGE202.CIAID,TGE202.CUENTAID,TGE202.CTADES,TGE202.CTANIV,TGE202.CTA_MOV,'+
             quotedstr(xAno)+','+
             ' 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'+
             ' 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'+
             ' 0,0,0,0,0,0,0,0,0,0,0,0,0,0'+
             ' FROM TGE202'+
             ' LEFT JOIN CNT401 ON (rtrim(ltrim(TGE202.CUENTAID)) = rtrim(ltrim(CNT401.CUENTAID)) AND TGE202.CIAID=CNT401.CIAID)'+
             ' WHERE CNT401.CUENTAID IS NULL AND TGE202.CIAID='+quotedstr(dblcCia.text);
  DMCNT.DCOM1.AppServer.IniciaTransaccion;
  try
   DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
   DMCNT.DCOM1.AppServer.GrabaTransaccion;
  except
   // Inicio HPC_201501_CNT
      //DMCNT.DCOM1.AppServer.RegresaTransaccion;
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   // Fin HPC_201501_CNT
  end;

   //**07/09/2001 - pjsv, actualizo todos los auxiliares y clase de auxiliares a null
   //** siempre y cuando esten en '', para que no me generen registro indebidos
   xSql := 'UPDATE CNT301 SET AUXID=NULL,CLAUXID=NULL WHERE AUXID=''''';
   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
    DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
    DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
   // Inicio HPC_201501_CNT
      //DMCNT.DCOM1.AppServer.RegresaTransaccion;
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   // Fin HPC_201501_CNT
   end;
   //**actualizo todos los C. de Costo a null
   //** siempre y cuando esten en '', para que no me generen registro indebidos
   xSql := 'UPDATE CNT301 SET CCOSID=NULL WHERE CCOSID=''''';
   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
    DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
    DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
   // Inicio HPC_201501_CNT
      //DMCNT.DCOM1.AppServer.RegresaTransaccion;
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   // Fin HPC_201501_CNT
   end;
   //**


//////////////////////// para Auxiliares /////////////////////////////
   //**07/09/2001 - pjsv, actualizo todos los auxiliares y clase de auxiliares a null
   //** siempre y cuando esten en '', para que no me generen registro indebidos
   xSql := 'UPDATE CNT401 SET AUXID=NULL,CLAUXID=NULL WHERE AUXID=''''';
   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
    DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
    DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
   // Inicio HPC_201501_CNT
      //DMCNT.DCOM1.AppServer.RegresaTransaccion;
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   // Fin HPC_201501_CNT
   end;
   //**

    xSql := ' INSERT INTO CNT401'+
            '(CIAID,CUENTAID,AUXID,CLAUXID,ANO,CTADES,TIPO,CTA_MOV,AUXDES,'+
            'DEBEMN'+ xMes+','+'DEBEME'+ xMes +','+
            'HABEMN'+ xMes +','+'HABEME'+ xMes +')'+
            ' select '+quotedstr(dblcCia.text)+', A.CUENTAID,A.AUXID,A.CLAUXID,'+
            quotedstr(xAno)+',MAX(A.CTADES) CTADES, MAX(C.CTANIV) CTANIV,'+
            ' MAX(C.CTA_MOV) CTA_MOV, MAX(A.AUXDES) AUXDES,'+
            'sum('+wReplacCeros+'(A.CNTDEBEMN'+',0)) DEBEMN'+ xMes+','+
            'sum('+wReplacCeros+'(A.CNTDEBEME'+',0)) DEBEME'+ xMes+','+
            'sum('+wReplacCeros+'(A.CNTHABEMN'+',0)) HABEMN'+ xMes+','+
            'sum('+wReplacCeros+'(A.CNTHABEME'+',0)) HABEME'+ xMes ;
    xSql := xSql + ' FROM CNT301 A'+
                   ' LEFT JOIN TGE202 C ON (A.CUENTAID = C.CUENTAID AND A.CIAID=C.CIAID AND C.CTA_AUX=''S'')'+
                   ' WHERE  A.AUXID IS NOT NULL  AND A.CNTANOMM='+quotedstr(xxxAnoMM)+
                   ' AND A.CIAID='+quotedstr(dblcCia.text)+
                   ' AND NOT EXISTS(SELECT * FROM CNT401 B WHERE B.CLAUXID=A.CLAUXID AND '+
                   ' B.AUXID=A.AUXID AND B.CLAUXID IS NOT NULL AND B.AUXID IS NOT NULL AND'+
                   ' B.CCOSID IS NULL)'+
                   ' GROUP BY A.CUENTAID,A.CLAUXID,A.AUXID';


  DMCNT.DCOM1.AppServer.IniciaTransaccion;
  try
   DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
   DMCNT.DCOM1.AppServer.GrabaTransaccion;
  except
   // Inicio HPC_201501_CNT
      //DMCNT.DCOM1.AppServer.RegresaTransaccion;
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   // Fin HPC_201501_CNT
  end;

  xMesA := DMCNT.StrZero(IntToStr(StrToInt(xmes) -1),2);
  xSql := 'UPDATE CNT401 SET '+
          'SALDMN'+ xMes +'= ('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
          wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),'+
          'SALDME'+ xMes +'= ('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0),';


 for xZ:=StrToInt( xMes )+1 to 13 do
  begin
   xMesT := DMCNT.StrZero( IntToStr(xZ),2);
   xSQL:= xSQL + 'SALDMN'+ xMesT +'=('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
         wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),';
  end;
 for xZ:=StrToInt( xMes )+1 to 13 do
  begin
    xMesT := DMCNT.StrZero( IntToStr(xZ),2);
    If xZ <> 13 then
     xSQL:= xSQL + 'SALDME'+ xMesT +'=('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0),'
    else
     xSQL:= xSQL + 'SALDME'+ xMesT +'=('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0)';
  end;
  xSQL:= xSQL + ' where ANO='+quotedstr(xAno)+
                ' AND CIAID='+quotedstr(dblcCia.text);

  DMCNT.DCOM1.AppServer.IniciaTransaccion;
  try
   DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
   DMCNT.DCOM1.AppServer.GrabaTransaccion;
  except
   // Inicio HPC_201501_CNT
      //DMCNT.DCOM1.AppServer.RegresaTransaccion;
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   // Fin HPC_201501_CNT
  end;

///////////////////// para C. Costos ///////////////////////////////////
   //**07/09/2001 - pjsv, actualizo todos los C. de Costo a null
   //** siempre y cuando esten en '', para que no me generen registro indebidos
   xSql := 'UPDATE CNT401 SET CCOSID=NULL WHERE CCOSID=''''';
   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
    DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
    DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
   // Inicio HPC_201501_CNT
      //DMCNT.DCOM1.AppServer.RegresaTransaccion;
      DMCNT.DCOM1.AppServer.RetornaTransaccion;
   // Fin HPC_201501_CNT
   end;
   //**
{
 xSql := ' INSERT INTO CNT401'+
         '(CIAID,CUENTAID,AUXID,CLAUXID,ANO,CTADES,TIPO,CTA_MOV,AUXDES,CCOSID,CCODES,'+
         'DEBEMN'+ xMes+','+'DEBEME'+ xMes +','+
         'HABEMN'+ xMes +','+'HABEME'+ xMes +')'+
         ' select '+quotedstr(dblcCia.text)+', A.CUENTAID,MAX(A.AUXID) AUXID,MAX(A.CLAUXID) CLAUXID,'+
         quotedstr(xAno)+', MAX(A.CTADES) CTADES, MAX(C.CTANIV) CTANIV,'+
         ' MAX(C.CTA_MOV) CTA_MOV, MAX(A.AUXDES) AUXDES, A.CCOSID,MAX(A.CCOSDES) CCOSDES,'+
         'sum('+wReplacCeros+'(A.CNTDEBEMN'+',0)) DEBEMN'+ xMes+','+
         'sum('+wReplacCeros+'(A.CNTDEBEME'+',0)) DEBEME'+ xMes+','+
         'sum('+wReplacCeros+'(A.CNTHABEMN'+',0)) HABEMN'+ xMes+','+
         'sum('+wReplacCeros+'(A.CNTHABEME'+',0)) HABEME'+ xMes ;
     xSql := xSql +  ' from cnt301 a'+
                     ' left join tge202 c on (a.CUENTAID = c.CUENTAID and a.CIAID=c.CIAID AND c.CTA_CCOS=''S'')'+
                     ' where a.ccosid is not null and a.auxid is null and a.CNTANOMM='+quotedstr(xxxAnoMM)+
                     ' AND a.CIAID='+quotedstr(dblcCia.text)+
                     ' AND NOT EXISTS(SELECT * FROM CNT401 B WHERE B.CCOSID=A.CCOSID '+
                     ' AND B.CLAUXID IS NULL AND B.AUXID IS NULL AND'+
                     ' B.CCOSID IS NOT NULL)'+
                     ' group by a.cuentaid,a.ccosid';
 DMCNT.DCOM1.AppServer.IniciaTransaccion;
 try
  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
  DMCNT.DCOM1.AppServer.GrabaTransaccion;
 except
  DMCNT.DCOM1.AppServer.RegresaTransaccion;
 end;

  xMesA := DMCNT.StrZero( IntToStr(StrToInt(xmes) -1),2);
  xSql := 'UPDATE CNT401 SET '+
          'SALDMN'+ xMes +'= ('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
          wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),'+
          'SALDME'+ xMes +'= ('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0),';


  for xZ:=StrToInt( xMes )+1 to 13 do
   begin
    xMesT := DMCNT.StrZero( IntToStr(xZ),2);
    xSQL:= xSQL + 'SALDMN'+ xMesT +'=('+wReplacCeros+'(SALDMN'+xMesA+',0)+'+
          wReplacCeros+'(DEBEMN'+xMes+',0))- '+wReplacCeros+'(HABEMN'+xMes+',0),';
   end;
 for xZ:=StrToInt( xMes )+1 to 13 do
  begin
    xMesT := DMCNT.StrZero( IntToStr(xZ),2);
    If xZ <> 13 then
     xSQL:= xSQL + 'SALDME'+ xMesT +'=('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0),'
    else
     xSQL:= xSQL + 'SALDME'+ xMesT +'=('+wReplacCeros+'(SALDME'+xMesA+',0)+'+
          wReplacCeros+'(DEBEME'+xMes+',0))- '+wReplacCeros+'(HABEME'+xMes+',0)';
  end;
  xSQL:= xSQL + ' where ANO='+quotedstr(xAno)+
                ' AND CIAID='+quotedstr(dblcCia.text);

 DMCNT.DCOM1.AppServer.IniciaTransaccion;
 try
  DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
  DMCNT.DCOM1.AppServer.GrabaTransaccion;
 except
  DMCNT.DCOM1.AppServer.RegresaTransaccion;
 end;
}
  //** genero montos de las cuentas en la CNT401 que no tengan Auxid y CCOSID
    xSql := 'SELECT A.CIAID,A.CUENTAID,SUM(A.CNTDEBEMN) CNTDEBEMN,SUM(A.CNTDEBEME) CNTDEBEME,'+
          'SUM(A.CNTHABEMN) CNTHABEMN, SUM(A.CNTHABEME) CNTHABEME,'+
          '(SUM(A.CNTDEBEMN) -  SUM(A.CNTHABEMN)) SALDMN'+DMCNT.StrZero(xMes,2)+','+
          '(SUM(A.CNTDEBEME) -  SUM(A.CNTHABEME)) SALDME'+DMCNT.StrZero(xMes,2);
    xSql := xSql + ' FROM CNT301 A'+
                   ' LEFT JOIN CNT401 B ON (B.CUENTAID=A.CUENTAID AND '+
                   ' B.AUXID IS NULL AND B.CCOSID IS NULL AND B.CLAUXID IS NULL  AND '+
                   ' B.ANO='+quotedstr(xAno)+' AND B.CIAID='+quotedstr(dblcCia.text)+')'+
                 ' WHERE  A.CNTANOMM='+quotedstr(xxxAnoMM)+' AND A.CIAID='+quotedstr(dblcCia.text)+
//                        ' A.CNTANOMM='+quotedstr(xxxAnoMM)+' AND A.CIAID='+quotedstr(dblcCia.text)+
                 ' GROUP BY A.CIAID,A.CNTANO,A.CNTANOMM,A.CUENTAID';
 DMCNT.cdsQry2.Close;
 DMCNT.cdsQry2.ProviderName:= 'PrvTGE';
 DMCNT.cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
 DMCNT.cdsQry2.Open;
 DMCNT.cdsQry2.IndexFieldNames:='CIAID;CUENTAID';
 GrabaSaldos;

 //** genero los montos de las cuentas internas
 DMCNT.cdsNivel.Open;
 xNumNiv := DMCNT.cdsNivel.recordcount;
 DMCNT.cdsNivel.IndexFieldNames := 'NIVEL';
 DMCNT.cdsNivel.Last;
 xNivel := DMCNT.cdsNivel.FieldByName('NIVEL').AsString;

 For xZ := 1 to xNumNiv do
    If (StrToInt(xNivel) - xZ) >= 1 then
     xNiv[xZ] := StrToInt(xNivel) - xZ
    else break;

 For xZ := 1 to High(xNiv) do
 begin
   if xNiv[xZ] <> 0 then
   begin

   // determina los digitos del nivel a totalizar
      DMCNT.cdsNivel.SetKey;
      DMCNT.cdsNivel.fieldbyname('NIVEL').AsString := IntToStr(xNiv[xZ]);

      xCuenta := DMCNT.cdsNivel.fieldbyname('NIVEL').AsString;

      if DMCNT.cdsNivel.GotoKey then
         xDigitos1 := StrToInt(DMCNT.cdsNivel.fieldbyname('DIGITOS').AsString);

      //** 17/07/2001 - pjsv - quitar esta condicional si el nivel no esta precedido de Cero y
      //** dejar solo DMCNT.cdsNivel.fieldbyname('NIVEL').AsString := IntToStr(xNiv[xZ]);
      //** determina los dígitos del nivel a sumar
      xNivel := IntToStr(xNiv[xZ]+1 );
      //**

      DMCNT.cdsNivel.SetKey;
      DMCNT.cdsNivel.fieldbyname('NIVEL').AsString := xNivel; //IntToStr(xNiv[xZ]);
      If DMCNT.cdsNivel.GotoKey then
         xDigitos := StrToInt(DMCNT.cdsNivel.fieldbyname('DIGITOS').AsString);

      // xsigno := DMCNT.cdsNivel.fieldbyname('SIGNO').AsString;
      xSql := 'SELECT TGE202.ciaid, tge202.cuentaid,'+
          ' sum(debemn'+DMCNT.StrZero(xMes,2)+') cntdebemn,'+
          ' sum(debeme'+DMCNT.StrZero(xMes,2)+') cntdebeme,'+
          ' sum(habemn'+DMCNT.StrZero(xMes,2)+') cnthabemn,'+
          ' sum(habeme'+DMCNT.StrZero(xMes,2)+') cnthabeme,'+
          '(sum(debemn'+DMCNT.StrZero(xMes,2)+') -  sum(habemn'+DMCNT.StrZero(xMes,2) +')) saldmn'+DMCNT.StrZero(xMes,2)+','+
          '(sum(debeme'+DMCNT.StrZero(xMes,2)+') -  sum(habeme'+DMCNT.StrZero(xMes,2) +')) saldme'+DMCNT.StrZero(xMes,2);
        xSql := xSql + ' FROM CNT401 '+
                       ' LEFT JOIN TGE202 ON (TGE202.CTANIV='+quotedstr(xCuenta)+
        ' AND TGE202.CUENTAID= SUBSTR(CNT401.CUENTAID,1,'+IntToSTr(xDigitos1)+') '+
        ' AND TGE202.CIAID='+quotedstr(dblcCia.text)+
        ' ) WHERE CNT401.AUXID IS NULL AND CNT401.CCOSID IS NULL AND CNT401.CLAUXID IS NULL '+
        ' AND CNT401.TIPO= '+quotedstr(xNivel)+
        '  AND CNT401.ANO='+quotedstr(xAno)+
        ' AND CNT401.CIAID='+quotedstr(dblcCia.text)+
        ' GROUP BY TGE202.CIAID,TGE202.CUENTAID'+
        ' ORDER BY TGE202.CUENTAID';
      DMCNT.cdsQry2.Close;
      DMCNT.cdsQry2.ProviderName:= 'PrvTGE';
      DMCNT.cdsQry2.DataRequest(xSQL); // Llamada remota al provider del servidor
      DMCNT.cdsQry2.Open;
      DMCNT.cdsQry2.IndexFieldNames:='CIAID;CUENTAID';
//    If StrToInt(xNivel) < 3 then
      GrabaSaldos;
    end;
  end;
  Showmessage('Termino');
end;


procedure TFTransferenciaInc.CreaPanel( xForma:TForm; xMensaje:String );
begin
   pnlConta := TPanel.Create( xForma );
   pbConta  := TProgressBar.Create( NIL );
   pbConta.Width:= 205;
   pbConta.Top  := 78;
   pbConta.Left := 48;
   pbConta.Min  := 0;
   pbConta.Max  := 5;
   pbConta.Parent := pnlConta;
   pnlConta.Alignment := taCenter;
   pnlConta.BringToFront;
   pnlConta.Width  := 300;
   pnlConta.Height := 100;
   pnlConta.Top    := xForma.Height-200;
   pnlConta.Left   := StrToInt(FloattoStr(DMCNT.FRound( ( ((xForma.Width-100))/2)-100,3,0 )));
   pnlConta.Parent := xForma;
   pnlConta.BevelInner := bvRaised;
   pnlConta.BevelOuter := bvRaised;
   pnlConta.BevelWidth := 3;
   pnlConta.Font.Name  := 'Times New Roman';
   pnlConta.Font.Style := [fsBold,fsItalic];
   pnlConta.Font.Size  := 12;
   pnlConta.Caption:= xMensaje;
   pbConta.Position:=1;
   pnlConta.Refresh;
end;

procedure TFTransferenciaInc.PanelMsg( xMensaje:String; xProc:Integer );
begin
   If xProc>0 then begin
      pbConta.Position:= 0;
      pbConta.Min     := 0;
      pbConta.Max     := xProc;
   end;
   pnlConta.Caption:= xMensaje;
   If xProc=0 then pbConta.Position:= pbConta.Position + 1;
   pnlConta.Refresh;
end;

////////////////////////////////////////
//                                    //
//       Fin de Contabilización       //
//                                    //
////////////////////////////////////////

procedure TFTransferenciaInc.FormActivate(Sender: TObject);
begin
	 Iniciadatos;
   FVariables.ConfiguraForma( Self );
end;

procedure TFTransferenciaInc.GrabaSaldos;
var
 xZ : Integer;
  xMesA,xSql : String;
begin
 DMCNT.cdsRCuenta.Close;
{ xSql := 'SELECT * FROM CNT401 WHERE ('+wReplacCeros+'(cnt401.auxid,''-'') = ''-'' OR (CNT401.AUXID <> ''''))'+
                            ' and ('+wReplacCeros+'(cnt401.ccosid,''-'') = ''-'' OR (cnt401.ccosid <> ''''))and ('+
                            wReplacCeros+'(cnt401.clauxid,''-'') = ''-'' OR (cnt401.clauxid <> ''''))'+
                           ' AND cnt401.ANO='+quotedstr(xAno)+
                           ' AND cnt401.CIAID='+quotedstr(dblcCia.text)+' ORDER BY CUENTAID';}
 xSql := 'SELECT * FROM CNT401 WHERE CNT401.AUXID IS NULL and CNT401.CCOSID IS NULL and CNT401.CLAUXID IS NULL '+
                           ' AND CNT401.ANO='+quotedstr(xAno)+
                           ' AND CNT401.CIAID='+quotedstr(dblcCia.text)+' ORDER BY CUENTAID';
 DMCNT.cdsRCuenta.DataRequest(xSql);
 DMCNT.cdsRCuenta.Open;
 DMCNT.cdsRCuenta.IndexFieldNames :='CIAID;CUENTAID';
 DMCNT.cdsQry2.First;
 while not DMCNT.cdsQry2.eof do
  begin
   DMCNT.cdsRCuenta.Setkey;
   DMCNT.cdsRCuenta.FieldByname('CIAID').AsString   :=DMCNT.cdsQry2.FieldByName('CIAID').AsString;
   DMCNT.cdsRCuenta.FieldByname('CUENTAID').AsString:= DMCNT.cdsQry2.FieldByName('CUENTAID').AsString;
   If DMCNT.cdsRCuenta.Gotokey then
    begin
     DMCNT.cdsRCuenta.edit;
//     DMCNT.cdsRCuenta.FieldByname('TDIARID').AsString:='X';
     DMCNT.cdsRCuenta.FieldByname('DEBEMN'+DMCNT.StrZero(xMes,2)).AsString := DMCNT.cdsQry2.FieldByName('CNTDEBEMN').AsString;
     DMCNT.cdsRCuenta.FieldByname('DEBEME'+DMCNT.StrZero(xMes,2)).AsString := DMCNT.cdsQry2.FieldByName('CNTDEBEME').AsString;
     DMCNT.cdsRCuenta.FieldByname('HABEMN'+DMCNT.StrZero(xMes,2)).AsString := DMCNT.cdsQry2.FieldByName('CNTHABEMN').AsString;
     DMCNT.cdsRCuenta.FieldByname('HABEME'+DMCNT.StrZero(xMes,2)).AsString := DMCNT.cdsQry2.FieldByName('CNTHABEME').AsString;
     DMCNT.cdsRCuenta.FieldByname('SALDMN'+DMCNT.StrZero(xMes,2)).AsFloat := DMCNT.cdsRCuenta.FieldByname('SALDMN'+DMCNT.StrZero(xMesA,2)).AsFloat + DMCNT.cdsQry2.FieldByName('SALDMN'+DMCNT.StrZero(xMes,2)).AsFloat;
     DMCNT.cdsRCuenta.FieldByname('SALDME'+DMCNT.StrZero(xMes,2)).AsFloat := DMCNT.cdsRCuenta.FieldByname('SALDME'+DMCNT.StrZero(xMesA,2)).AsFloat + DMCNT.cdsQry2.FieldByName('SALDME'+DMCNT.StrZero(xMes,2)).AsFloat;
{     DMCNT.cdsRCuenta.FieldByname('DEBEMN'+DMCNT.StrZero(xMes,2)).AsString := DMCNT.cdsQry2.FieldByName('CNTDEBEMN').AsString;
     DMCNT.cdsRCuenta.FieldByname('DEBEME'+DMCNT.StrZero(xMes,2)).AsString := DMCNT.cdsQry2.FieldByName('CNTDEBEME').AsString;
     DMCNT.cdsRCuenta.FieldByname('HABEMN'+DMCNT.StrZero(xMes,2)).AsString := DMCNT.cdsQry2.FieldByName('CNTHABEMN').AsString;
     DMCNT.cdsRCuenta.FieldByname('HABEME'+DMCNT.StrZero(xMes,2)).AsString := DMCNT.cdsQry2.FieldByName('CNTHABEME').AsString;
     DMCNT.cdsRCuenta.FieldByname('SALDMN'+DMCNT.StrZero(xMes,2)).AsString := DMCNT.cdsQry2.FieldByName('SALDMN'+DMCNT.StrZero(xMes,2)).AsString;
     DMCNT.cdsRCuenta.FieldByname('SALDME'+DMCNT.StrZero(xMes,2)).AsString := DMCNT.cdsQry2.FieldByName('SALDME'+DMCNT.StrZero(xMes,2)).AsString;
}
     for xZ:=StrToInt(xMes)+1 to 13 do
      begin
       xMesT := DMCNT.StrZero( IntToStr(xZ),2);
//       If xZ <> 13 then
//        begin
         DMCNT.cdsRCuenta.FieldByname('SALDMN'+xMesT).AsFloat := DMCNT.cdsRCuenta.FieldByname('SALDMN'+DMCNT.StrZero(xMes,2)).AsFloat;
         DMCNT.cdsRCuenta.FieldByname('SALDME'+xMesT).AsFloat := DMCNT.cdsRCuenta.FieldByname('SALDME'+DMCNT.StrZero(xMes,2)).AsFloat;
//         DMCNT.cdsRCuenta.FieldByname('SALDMN'+xMesT).AsString := DMCNT.cdsRCuenta.FieldByname('SALDMN'+DMCNT.StrZero(xMes,2)).AsString;
//         DMCNT.cdsRCuenta.FieldByname('SALDME'+xMesT).AsString := DMCNT.cdsRCuenta.FieldByname('SALDME'+DMCNT.StrZero(xMes,2)).AsString;
//        end;
      end;
    end;
   DMCNT.cdsQry2.next;
  end;
// DMCNT.DCOM1.AppServer.IniciaTransaccion;
 try
   //DMCNT.ControlTran;
//   DMCNT.DCOM1.AppServer.GrabaTransaccion;
  except
//   DMCNT.DCOM1.AppServer.RegresaTransaccion;
 end;
end;

{procedure TFTransferencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMCNT.cdsTDiario.Filter:='';
  DMCNT.cdsTDiario.Filtered:=False;
end;}


procedure TFTransferenciaInc.BitBtn1Click(Sender: TObject);
var
   xMes, xSQL : String;
begin


   if MessageDlg('¿ Esta Seguro de Mayorizar ?',
         mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;

   if strtoint(speMM.text)=0 then  xmes:='00'
   else if length(speMM.text)=1 then xmes:='0'+speMM.text
   else xmes:=copy(speMM.text,1,2);


   xSQL:=' UPDATE CNT401 '+
         ' SET DEBEMN'+xmes+'=0, '+
         '     HABEMN'+xmes+'=0, '+
         '     DEBEME'+xmes+'=0, '+
         '     HABEME'+xmes+'=0, '+
         '     SALDMN'+xmes+'=0, '+
         '     SALDME'+xmes+'=0 '+
         '     WHERE CIAID='+QuotedStr(dblcCia.Text)+' AND ANO='+quotedstr(speAno.text);
//   DMCNT.DCOM1.AppServer.IniciaTransaccion;
   try
      DMCNT.DCOM1.AppServer.EjecutaQry(xSQL);
//      DMCNT.DCOM1.AppServer.GrabaTransaccion;
   except
//      DMCNT.DCOM1.AppServer.RegresaTransaccion;
   end;

   if SOLConta(dblcCia.Text, '', speano.text+xmes, '',
      SRV_D, 'M', DMCNT.wModulo, DMCNT.cdsMovCNT1, DMCNT.cdsNivel,
      DMCNT.cdsResultSet, DMCNT.DCOM1, Self ) then
   begin
      ShowMessage( 'Ok Mayorización' );
   end;

end;

end.


