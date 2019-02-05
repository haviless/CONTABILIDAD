unit CNT324;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, wwdblook, Wwdbdlg, Mask,
  wwdbedit, Wwdotdot, Wwdbcomb, ExtCtrls, ComCtrls;

type
  TFInconsistCNT = class(TForm)
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    edtPeriodoT: TEdit;
    dblcCiaC: TwwDBLookupCombo;
    edtCiaT: TEdit;
    dbgConsistencia: TwwDBGrid;
    GroupBox3: TGroupBox;
    bbtDC: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Button2: TButton;
    Button3: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtDCClick(Sender: TObject);
    procedure dblcCiaCExit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInconsistCNT: TFInconsistCNT;

implementation

uses CNTDM;

{$R *.DFM}

procedure TFInconsistCNT.FormCreate(Sender: TObject);
var
   xSQL : String;
begin
   xSQL := 'select CIAID, CIADES from TGE101 ';
   DMCNT.cdsQry2.IndexFieldnames:='';
   DMCNT.cdsQry2.Filter:='';
   DMCNT.cdsQry2.Filtered:= False;
   DMCNT.cdsQry2.close;
   DMCNT.cdsQry2.DataRequest(xSQL);
   DMCNT.cdsQry2.Open;
   dblcCiaC.lookuptable := DMCNT.cdsQry2;
   dblcCiaC.lookupfield := 'CIAID';
   dblcCiaC.selected.clear;
   dblcCiaC.selected.add('CIAID'#9'2'#9'Cia'#9'F');
   dblcCiaC.selected.add('CIADES'#9'15'#9'Razón Social'#9'F');
   PageControl1.ActivePageIndex:=0;
end;

procedure TFInconsistCNT.bbtDCClick(Sender: TObject);
var
   sSQL: string;
begin
  if Length(dblcCiaC.text)=0 then
     Raise Exception.Create('Seleccione Compañia');

   if length(edtCiaT.Text)=0 then
   begin
      ShowMessage('Falta Código de Compañía');
      dblcCiac.SetFocus;
   end;

   if length(edtPeriodoT.Text)=0 then
   begin
      ShowMessage('Falta Periodo');
      edtPeriodoT.SetFocus;
   end;

   screen.Cursor := CrHourGlass;

   sSQL:= ' SELECT * FROM ( '+
          ' SELECT CIAID,TDIARID,CNTANOMM,CNTCOMPROB, ' +
          ' SUM(CASE WHEN CNTDH=''D'' THEN CNTMTOLOC END) DEBE, ' +
          ' SUM(CASE WHEN CNTDH=''H'' THEN CNTMTOLOC END) HABER ' +
          ' FROM CNT301 ' +
          ' WHERE CIAID='+Quotedstr(dblcCiaC.text)+
          ' AND CNTANOMM>='+Quotedstr(edtPeriodoT.text)+
          ' GROUP BY CIAID,TDIARID,CNTANOMM,CNTCOMPROB '+
          ' )W '+
          ' WHERE DEBE-HABER<>0 ';

   DMCNT.cdsQry3.IndexFieldnames:='';
   DMCNT.cdsQry3.Filter:='';
   DMCNT.cdsQry3.Filtered:= False;
   DMCNT.cdsQry3.close;
   DMCNT.cdsQry3.DataRequest(sSQL);
   DMCNT.cdsQry3.Open;
   screen.Cursor := CrDeFault;
   if DMCNT.cdsQry3.RecordCount=0 then
      Raise Exception.Create('No existen Registros descuadrados...');

   dbgConsistencia.DataSource:= DMCNT.dsQry3;
end;

procedure TFInconsistCNT.dblcCiaCExit(Sender: TObject);
var
   xWhere : String;
begin
   xwhere := 'CIAID='+quotedstr(dblcCiac.Text);
   edtCiaT.Text := DMCNT.DisplayDescrip('PrvTGE','TGE101','*',xWhere,'CIADES');
   if length(edtCiaT.Text)=0 then
   begin
      ShowMessage('Falta Código de Compañía');
      dblcCiac.SetFocus;
   end;
end;

procedure TFInconsistCNT.BitBtn4Click(Sender: TObject);
var
   sSQL,sCta60,sCta90: string;
begin

   if Length(dblcCiaC.text)=0 then
      Raise Exception.Create('Seleccione Compañia');

   if length(edtCiaT.Text)=0 then
   begin
      ShowMessage('Falta Código de Compañía');
      dblcCiac.SetFocus;
   end;

   if length(edtPeriodoT.Text)=0 then
   begin
      ShowMessage('Falta Periodo');
      edtPeriodoT.SetFocus;
   end;

   screen.Cursor := CrHourGlass;
   sCta60:= ' SUM(CASE WHEN CUENTAID LIKE ''62%'' OR CUENTAID LIKE ''63%''  OR CUENTAID LIKE ''64%'' OR CUENTAID LIKE ''65%''  OR CUENTAID LIKE ''67%'' OR CUENTAID LIKE ''68%'' THEN CNTMTOLOC ELSE 0 END) CTA60, ';
   sCta90:= ' SUM(CASE WHEN SUBSTR(CUENTAID,1,2)=''92'' OR SUBSTR(CUENTAID,1,2)=''93'' OR  SUBSTR(CUENTAID,1,2)=''94'' OR  SUBSTR(CUENTAID,1,2)=''95'' OR  SUBSTR(CUENTAID,1,2)=''97'' OR  SUBSTR(CUENTAID,1,2)=''98''  THEN CNTMTOLOC ELSE 0 END) CTA90 ';

{
   if dblcCiaC.text ='02' then
   begin
      sCta60:= ' SUM(CASE WHEN CUENTAID LIKE ''62%'' OR CUENTAID LIKE ''63%''  OR CUENTAID LIKE ''64%'' OR CUENTAID LIKE ''65%''  OR CUENTAID LIKE ''68%''    THEN CNTMTOLOC ELSE 0 END) CTA60, ';
      sCta90:= ' SUM(CASE WHEN SUBSTR(CUENTAID,1,2)=''93'' OR SUBSTR(CUENTAID,1,2)=''94'' OR  SUBSTR(CUENTAID,1,2)=''95''  THEN CNTMTOLOC ELSE 0 END) CTA90 ';
   end
   else
   begin
      sCta60:= ' SUM(CASE WHEN CUENTAID LIKE ''62%'' OR CUENTAID LIKE ''63%''  OR CUENTAID LIKE ''64%'' OR CUENTAID LIKE ''65%''  OR CUENTAID LIKE ''67%''  OR CUENTAID LIKE ''68%''  THEN CNTMTOLOC ELSE 0 END) CTA60, ';
      sCta90:= ' SUM(CASE WHEN SUBSTR(CUENTAID,1,2)=''96'' OR SUBSTR(CUENTAID,1,2)=''94'' OR  SUBSTR(CUENTAID,1,2)=''95''  THEN CNTMTOLOC ELSE 0 END) CTA90 ';
   end;
}

   sSQL:= ' SELECT * FROM ( '+
          ' SELECT * FROM ( '+
          ' SELECT TDIARID,CNTCOMPROB, '+sCta60+sCta90+
          ' FROM CNT301 '+
          ' WHERE CIAID='+Quotedstr(dblcCiaC.text)+
          ' AND CNTANOMM='+Quotedstr(edtPeriodoT.text)+
          ' GROUP BY TDIARID,CNTCOMPROB '+
          ' )W '+
          ' )P '+
          ' WHERE ABS(CTA60-CTA90)>0 ';

   DMCNT.cdsQry3.IndexFieldnames:='';
   DMCNT.cdsQry3.Filter:='';
   DMCNT.cdsQry3.Filtered:= False;
   DMCNT.cdsQry3.close;
   DMCNT.cdsQry3.DataRequest(sSQL);
   DMCNT.cdsQry3.Open;
   screen.Cursor := CrDeFault;
   if DMCNT.cdsQry3.RecordCount=0 then
      Raise Exception.Create('No existen Registros descuadrados...');

   dbgConsistencia.DataSource:= DMCNT.dsQry3;

end;

procedure TFInconsistCNT.BitBtn5Click(Sender: TObject);
var
   sSQL: string;
begin
   sSQL:= ' select * from TGE202 '+
          ' where CIAID='+Quotedstr(dblcCiaC.text)+
          '   and length(rtrim(CUENTAID))<>2 '+
          '   and length(rtrim(CUENTAID))<>3 '+
          '   and length(rtrim(CUENTAID))<>5 '+
          '   and length(rtrim(CUENTAID))<>7 '+
          '   and length(rtrim(CUENTAID))<>9 '+
          '   and length(rtrim(CUENTAID))<>11 '+
          ' order by CUENTAID ';
   DMCNT.cdsQry3.IndexFieldnames:='';
   DMCNT.cdsQry3.Filter:='';
   DMCNT.cdsQry3.Filtered:= False;
   DMCNT.cdsQry3.close;
   DMCNT.cdsQry3.DataRequest(sSQL);
   DMCNT.cdsQry3.Open;
   screen.Cursor := CrDeFault;
   if DMCNT.cdsQry3.RecordCount>0 then
      Raise Exception.Create('Existen Cuentas con Niveles no definidos...');

   dbgConsistencia.DataSource:= DMCNT.dsQry3;


end;

procedure TFInconsistCNT.BitBtn7Click(Sender: TObject);
var
   sSQL,sAnio: string;
begin
   sAnio:= Copy(edtPeriodoT.text,1,4);
// verifica que las cuentas del CNT401 existan en el Plan de Cuentas
    sSQL:= ' select * from ( '+
           ' select CNT401.CUENTAID,TGE202.CTADES from CNT401 '+
           ' left outer join TGE202 on (TGE202.CIAID=CNT401.CIAID and TGE202.CUENTAID=CNT401.CUENTAID) '+
           ' where CNT401.CIAID='+Quotedstr(dblcCiac.text)+' and CNT401.ANO='+Quotedstr(sAnio)+') XX '+
           ' where CTADES is null '+
           ' order by CUENTAID ';

   DMCNT.cdsQry3.IndexFieldnames:='';
   DMCNT.cdsQry3.Filter:='';
   DMCNT.cdsQry3.Filtered:= False;
   DMCNT.cdsQry3.close;
   DMCNT.cdsQry3.DataRequest(sSQL);
   DMCNT.cdsQry3.Open;
   screen.Cursor := CrDeFault;
   if DMCNT.cdsQry3.RecordCount>0 then
      Raise Exception.Create('Existen Cuentas en Archivos de Saldos'+#13+' no definidos en Plan de Cuentas...');

   dbgConsistencia.DataSource:= DMCNT.dsQry3;


end;

procedure TFInconsistCNT.BitBtn8Click(Sender: TObject);
var
   sSQL: string;
begin
// verifica q las Cuentas de Movimientos del Mes sean de Detalle
   sSQL:= ' select * from ( '+
           ' select CNT301.TDIARID,CNT301.CNTANOMM,CNT301.CNTCOMPROB,CNT301.CUENTAID,TGE202.CTADES,CTA_DET from CNT301 '+
           ' left outer join TGE202 on (TGE202.CIAID=CNT301.CIAID and TGE202.CUENTAID=CNT301.CUENTAID) '+
           ' where CNT301.CIAID='+Quotedstr(dblcCiac.text)+' and CNT301.CNTANOMM='+Quotedstr(edtPeriodoT.text)+') XX '+
           ' where CTA_DET<>''S'' '+
           ' order by CUENTAID ';
   DMCNT.cdsQry3.IndexFieldnames:='';
   DMCNT.cdsQry3.Filter:='';
   DMCNT.cdsQry3.Filtered:= False;
   DMCNT.cdsQry3.close;
   DMCNT.cdsQry3.DataRequest(sSQL);
   DMCNT.cdsQry3.Open;
   screen.Cursor := CrDeFault;
   if DMCNT.cdsQry3.RecordCount>0 then
      Raise Exception.Create('Existen Cuentas de Movimientos del Mes que no son de Detalle...');

   dbgConsistencia.DataSource:= DMCNT.dsQry3;


end;

procedure TFInconsistCNT.BitBtn9Click(Sender: TObject);
var
   sSQL: string;
begin
// revisa las declaraciones de tipo de cuenta
    sSQL:= ' select * from ( '+
           ' select CIAID,CUENTAID,CTA_TIPO,TIPCTAID,CTADES,CTANIV,CTA_DET,CTA_MOV, '+
           '        case when CUENTAID like ''0%'' and (CTA_TIPO<>''O'' or TIPCTAID<>''0'') then ''MALO'' '+
           '             when CUENTAID like ''1%'' and (CTA_TIPO<>''A'' or TIPCTAID<>''1'') then ''MALO'' '+
           '             when CUENTAID like ''2%'' and (CTA_TIPO<>''A'' or TIPCTAID<>''1'') then ''MALO'' '+
           '             when CUENTAID like ''3%'' and (CTA_TIPO<>''A'' or TIPCTAID<>''1'') then ''MALO'' '+
           '             when CUENTAID like ''4%'' and (CTA_TIPO<>''P'' or TIPCTAID<>''3'') then ''MALO'' '+
           '             when CUENTAID like ''5%'' and (CTA_TIPO<>''T'' or TIPCTAID<>''5'') then ''MALO'' '+
           '             when CUENTAID like ''60%'' and (CTA_TIPO<>''X'' or TIPCTAID<>''6'') then ''MALO'' '+
           '             when CUENTAID like ''61%'' and (CTA_TIPO<>''X'' or TIPCTAID<>''6'') then ''MALO'' '+
           '             when CUENTAID like ''62%'' and (CTA_TIPO<>''X'' or TIPCTAID<>''6'') then ''MALO'' '+
           '            when CUENTAID like ''63%'' and (CTA_TIPO<>''X'' or TIPCTAID<>''6'') then ''MALO'' '+
           '             when CUENTAID like ''64%'' and (CTA_TIPO<>''X'' or TIPCTAID<>''6'') then ''MALO'' '+
           '             when CUENTAID like ''65%'' and (CTA_TIPO<>''X'' or TIPCTAID<>''6'') then ''MALO'' '+
           '             when CUENTAID like ''66%'' and (CTA_TIPO<>''G'' or TIPCTAID<>''6'') then ''MALO'' '+
           '             when CUENTAID like ''67%'' and (CTA_TIPO<>''X'' or TIPCTAID<>''6'') then ''MALO'' '+
           '             when CUENTAID like ''68%'' and (CTA_TIPO<>''X'' or TIPCTAID<>''6'') then ''MALO'' '+
           '             when CUENTAID like ''69%'' and (CTA_TIPO<>''G'' or TIPCTAID<>''6'') then ''MALO'' '+
           '            when CUENTAID like ''70%'' and (CTA_TIPO<>''I'' or TIPCTAID<>''7'') then ''MALO'' '+
           '             when CUENTAID like ''71%'' and (CTA_TIPO<>''I'' or TIPCTAID<>''7'') then ''MALO'' '+
           '             when CUENTAID like ''72%'' and (CTA_TIPO<>''I'' or TIPCTAID<>''7'') then ''MALO'' '+
           '             when CUENTAID like ''73%'' and (CTA_TIPO<>''I'' or TIPCTAID<>''7'') then ''MALO'' '+
           '            when CUENTAID like ''74%'' and (CTA_TIPO<>''I'' or TIPCTAID<>''7'') then ''MALO'' '+
           '            when CUENTAID like ''75%'' and (CTA_TIPO<>''I'' or TIPCTAID<>''7'') then ''MALO'' '+
           '            when CUENTAID like ''76%'' and (CTA_TIPO<>''I'' or TIPCTAID<>''7'') then ''MALO'' '+
           '             when CUENTAID like ''77%'' and (CTA_TIPO<>''I'' or TIPCTAID<>''7'') then ''MALO'' '+
           '             when CUENTAID like ''78%'' and (CTA_TIPO<>''I'' or TIPCTAID<>''7'') then ''MALO'' '+
           '             when CUENTAID like ''79%'' and (CTA_TIPO<>''X'' or TIPCTAID<>''7'') then ''MALO'' '+
           '             when CUENTAID like ''8%'' and (CTA_TIPO<>''R'' or TIPCTAID<>''8'') then ''MALO'' '+
           '             when CUENTAID like ''9%'' and (CTA_TIPO<>''N'' or TIPCTAID<>''9'') then ''MALO'' '+
           '             else ''OK'' '+
           '        end ESTADO  '+
           ' from TGE202 '+
           ' where CIAID='+Quotedstr(dblcCiac.text)+
           ' )XX where ESTADO=''MALO'' '+
           ' order by CUENTAID ';

   DMCNT.cdsQry3.IndexFieldnames:='';
   DMCNT.cdsQry3.Filter:='';
   DMCNT.cdsQry3.Filtered:= False;
   DMCNT.cdsQry3.close;
   DMCNT.cdsQry3.DataRequest(sSQL);
   DMCNT.cdsQry3.Open;
   screen.Cursor := CrDeFault;
   if DMCNT.cdsQry3.RecordCount>0 then
      Raise Exception.Create('Existen Cuentas en el Plan con un Tipo de Cuenta incorrecto...');

   dbgConsistencia.DataSource:= DMCNT.dsQry3;


end;

procedure TFInconsistCNT.BitBtn10Click(Sender: TObject);
var
   sSQL: string;
begin
   sSQL:= ' select * from TGE202 '+
          ' where CIAID='+Quotedstr(dblcCiac.text)+' and length(rtrim(CUENTAID))<>cast(CTANIV as integer) ';
   DMCNT.cdsQry3.IndexFieldnames:='';
   DMCNT.cdsQry3.Filter:='';
   DMCNT.cdsQry3.Filtered:= False;
   DMCNT.cdsQry3.close;
   DMCNT.cdsQry3.DataRequest(sSQL);
   DMCNT.cdsQry3.Open;
   screen.Cursor := CrDeFault;
   if DMCNT.cdsQry3.RecordCount>0 then
      Raise Exception.Create('Existen Cuentas en el Plan con un Nivel de cuenta incorrecto...');

   dbgConsistencia.DataSource:= DMCNT.dsQry3;

end;

procedure TFInconsistCNT.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;

end;

procedure TFInconsistCNT.BitBtn1Click(Sender: TObject);
var
   sSQL: string;
begin
  if Length(dblcCiaC.text)=0 then
     Raise Exception.Create('Seleccione Compañia');

   if length(edtCiaT.Text)=0 then
   begin
      ShowMessage('Falta Código de Compañía');
      dblcCiac.SetFocus;
   end;

   if length(edtPeriodoT.Text)=0 then
   begin
      ShowMessage('Falta Periodo');
      edtPeriodoT.SetFocus;
   end;

   screen.Cursor := CrHourGlass;

   sSQL:= ' SELECT CIAID,CNTANOMM,TDIARID,CNTCOMPROB,COUNT(*) NREG FROM CNT300 '+
          ' WHERE CIAID='+Quotedstr(dblcCiaC.Text)+
          ' AND CNTANOMM='+Quotedstr(edtPeriodot.Text)+
          ' GROUP BY CIAID,CNTANOMM,TDIARID,CNTCOMPROB '+
          ' HAVING COUNT(*)>1 ';
   DMCNT.cdsQry3.IndexFieldnames:='';
   DMCNT.cdsQry3.Filter:='';
   DMCNT.cdsQry3.Filtered:= False;
   DMCNT.cdsQry3.close;
   DMCNT.cdsQry3.DataRequest(sSQL);
   DMCNT.cdsQry3.Open;
   screen.Cursor := CrDeFault;
   if DMCNT.cdsQry3.RecordCount=0 then
      Raise Exception.Create('No existen Cabeceras  Duplicadas...');

   dbgConsistencia.DataSource:= DMCNT.dsQry3;
end;

procedure TFInconsistCNT.BitBtn2Click(Sender: TObject);
var
   sSQL : string;
begin
  if Length(dblcCiaC.text)=0 then
     Raise Exception.Create('Seleccione Compañia');

   if length(edtCiaT.Text)=0 then
   begin
      ShowMessage('Falta Código de Compañía');
      dblcCiac.SetFocus;
   end;

   if length(edtPeriodoT.Text)=0 then
   begin
      ShowMessage('Falta Periodo');
      edtPeriodoT.SetFocus;
   end;

   screen.Cursor := CrHourGlass;

   sSQL:= ' SELECT CIAID,CNTANOMM,TDIARID,CNTCOMPROB,CNTREG,COUNT(*) NREG FROM CNT301 '+
          ' WHERE CIAID='+Quotedstr(dblcCiaC.Text)+
//          ' AND TDIARID=''10'' '+
          ' AND CNTANOMM='+Quotedstr(edtPeriodot.Text)+
          ' GROUP BY CIAID,CNTANOMM,TDIARID,CNTCOMPROB,CNTREG '+
          ' HAVING COUNT(*)>1 ';
   DMCNT.cdsQry3.IndexFieldnames:='';
   DMCNT.cdsQry3.Filter:='';
   DMCNT.cdsQry3.Filtered:= False;
   DMCNT.cdsQry3.close;
   DMCNT.cdsQry3.DataRequest(sSQL);
   DMCNT.cdsQry3.Open;
   screen.Cursor := CrDeFault;
   if DMCNT.cdsQry3.RecordCount=0 then
      Raise Exception.Create('No existen Registros de Detalle Duplicados...');

   dbgConsistencia.DataSource:= DMCNT.dsQry3;

end;

procedure TFInconsistCNT.BitBtn3Click(Sender: TObject);
var
   sSQL: string;
begin
  if Length(dblcCiaC.text)=0 then
     Raise Exception.Create('Seleccione Compañia');

   if length(edtCiaT.Text)=0 then
   begin
      ShowMessage('Falta Código de Compañía');
      dblcCiac.SetFocus;
   end;

   if length(edtPeriodoT.Text)=0 then
   begin
      ShowMessage('Falta Periodo');
      edtPeriodoT.SetFocus;
   end;

   screen.Cursor := CrHourGlass;
   sSQL:= ' SELECT CIAID,CNTANOMM PERIODO,TDIARID TDIARIO,CNTCOMPROB COMP '
         +' FROM CNT301 '
         +' WHERE CIAID='+Quotedstr(dblcCiaC.Text)
         +'   AND CNTANOMM='+Quotedstr(edtPeriodot.Text)
         +'   AND nvl(CUENTAID,'''')='''' ';
   DMCNT.cdsQry3.IndexFieldnames:='';
   DMCNT.cdsQry3.Filter:='';
   DMCNT.cdsQry3.Filtered:= False;
   DMCNT.cdsQry3.close;
   DMCNT.cdsQry3.DataRequest(sSQL);
   DMCNT.cdsQry3.Open;
   screen.Cursor := CrDeFault;
   if DMCNT.cdsQry3.RecordCount=0 then
      Raise Exception.Create('No existen Registros con Cuentas Invalidas...');

   dbgConsistencia.DataSource:= DMCNT.dsQry3;
end;

procedure TFInconsistCNT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMCNT.cdsQry3.close;
   DMCNT.cdsQry2.close;
end;

end.


{
SELECT * FROM (
  SELECT * FROM (
     SELECT TDIARID,CNTCOMPROB,
        SUM(CASE WHEN CUENTAID LIKE '601%'
              OR CUENTAID LIKE '604%'  
              OR CUENTAID LIKE '605%'
              OR CUENTAID LIKE '606%'  
              OR CUENTAID LIKE '609%'
            THEN CNTMTOLOC ELSE 0 END) CTA60,
        SUM(CASE WHEN SUBSTR(CUENTAID,1,3)='201' 
              OR SUBSTR(CUENTAID,1,3)='241'
              OR SUBSTR(CUENTAID,1,3)='251'
              OR SUBSTR(CUENTAID,1,3)='261'
              OR SUBSTR(CUENTAID,1,3)='262'
              OR SUBSTR(CUENTAID,1,3)='282'
              OR SUBSTR(CUENTAID,1,3)='283'
              OR SUBSTR(CUENTAID,1,3)='284'
              OR SUBSTR(CUENTAID,1,3)='285'
              OR SUBSTR(CUENTAID,1,3)='209'
            THEN CNTMTOLOC ELSE 0 END) CTA20,
        SUM(CASE WHEN SUBSTR(CUENTAID,1,3)='611' 
              OR SUBSTR(CUENTAID,1,3)='614'
              OR SUBSTR(CUENTAID,1,3)='615'
              OR SUBSTR(CUENTAID,1,3)='616'
              OR SUBSTR(CUENTAID,1,3)='613'
              OR SUBSTR(CUENTAID,1,3)='614'
              OR SUBSTR(CUENTAID,1,3)='615'
              OR SUBSTR(CUENTAID,1,3)='616'
              OR SUBSTR(CUENTAID,1,3)='619'
              OR SUBSTR(CUENTAID,1,3)='612'
            THEN CNTMTOLOC ELSE 0 END) CTA61
     FROM CNT301
     WHERE CIAID='02'
       AND CNTANOMM='200601'
     GROUP BY TDIARID,CNTCOMPROB
     )W
  )P
WHERE ABS(CTA60-CTA20)>0 or ABS(CTA60-CTA61)>0 or ABS(CTA61-CTA20)>0
}
