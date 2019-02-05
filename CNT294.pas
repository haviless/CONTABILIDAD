unit CNT294;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  DB, ADODB, Wwdatsrc, ppBands, ppCache, ppClass, ppEndUsr, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppPrnabl, ppCtrls, Mask;

type
  TFTransfGiro = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbgOficio: TwwDBGrid;
    dbgConta: TwwDBGrid;
    bbtnTransferir: TBitBtn;
    seMes: TSpinEdit;
    seAno: TSpinEdit;
    bbtnBuscar: TBitBtn;
    Label3: TLabel;
    ado2: TADOConnection;
    cdsOficios: TADODataSet;
    dsOficios: TDataSource;
    cdsCuenta: TADODataSet;
    DataSource1: TDataSource;
    cdsLiqui: TADODataSet;
    dsLiqui: TwwDataSource;
    ppdb1: TppDBPipeline;
    ppr1: TppReport;
    ppd1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    Label4: TLabel;
    meEQ: TMaskEdit;
    wwDBGrid1: TwwDBGrid;
    cbDisenoRep: TCheckBox;
    sbDisenoRep: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure bbtnBuscarClick(Sender: TObject);
    procedure dbgOficioDblClick(Sender: TObject);
    procedure bbtnTransferirClick(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }
    procedure TransferirOficio;
    function  ValidaDatos : Boolean;

  public
    { Public declarations }
  end;

var
  FTransfGiro: TFTransfGiro;

implementation

{$R *.dfm}

USES CNTDM, CNT292;

procedure TFTransfGiro.FormActivate(Sender: TObject);
begin
  if not ado2.Connected then
  begin
     ado2.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;'
         +'User ID=Admin;'
         +'Data Source='+wDir_Giro+'mgirban.mdb;'
         +'Mode=Read;'
         +'Extended Properties="";'
         +'Persist Security Info=False;'
         +'Jet OLEDB:System database="";'
         +'Jet OLEDB:Registry Path="";'
         +'Jet OLEDB:Database Password="";'
         +'Jet OLEDB:Engine Type=5;'
         +'Jet OLEDB:Database Locking Mode=0;'
         +'Jet OLEDB:Global Partial Bulk Ops=2;'
         +'Jet OLEDB:Global Bulk Transactions=1;'
         +'Jet OLEDB:New Database Password="";'
         +'Jet OLEDB:Create System Database=False;'
         +'Jet OLEDB:Encrypt Database=False;'
         +'Jet OLEDB:Don''t Copy Locale on Compact=False;'
         +'Jet OLEDB:Compact Without Replica Repair=False;'
         +'Jet OLEDB:SFP=False';
     ado2.Connected:=True;
  end;

  dbgConta.DataSource :=DMCNT.dsCNT311;
  dbgOficio.DataSource:=dsOficios;
  bbtnBuscarClick(Self);
end;

procedure TFTransfGiro.bbtnBuscarClick(Sender: TObject);
var
   xSQL, cMesSig, cMesAct, cDiaIni, cDiaFin, cDiaIniOra, cDiaFinOra, cEquipo, cNumOfi : String;
   nMes, nAno : Integer;
   dFecha : TDate;
   cWhere : String;
begin
   nMes:=seMes.Value+1;
   nAno:=seAno.Value;
   if nMes>=13 then
   begin
      nMes:=1;
      nAno:=nAno+1;
   end;
   cMesSig:= DMCNT.StrZero(IntToStr(nMes),2);
   cMesAct:= DMCNT.StrZero(IntToStr(seMes.Value),2);
   cDiaFin:= DateToStr( StrToDate('01/'+cMesSig+'/'+IntToStr(nAno))-1 );
   cDiaFin:= Copy(cDiaFin,4,2)+'/'+Copy(cDiaFin,1,2)+'/'+Copy(cDiaFin,7,4);
   cDiaIni:= cMesAct+'/01/'+IntToStr(seAno.Value);

   cDiaIniOra:='01/'+cMesAct+'/'+IntToStr(seAno.Value);
   cDiaFinOra:=DateToStr( StrToDate('01/'+cMesSig+'/'+IntToStr(nAno))-1 );

   dbgConta.DataSource:=DMCNT.dsCNT311;

   xSQL:='Select * from CNT_DES_OFI '
        +'Where FECHA>='''+cDiaIniOra+''' and FECHA<='''+cDiaFinOra+''''
        +  'and EQUIPO LIKE '''+meEQ.Text+''' '
        +'ORDER BY FECHA DESC, EQUIPO, NUMOFI';
   DMCNT.cdsCNT311.Close;
   DMCNT.cdsCNT311.DataRequest( xSQL );
   DMCNT.cdsCNT311.Open;

   cWhere:='';
   DMCNT.cdsCNT311.First;
   while not DMCNT.cdsCNT311.Eof do
   begin
      cWhere:=cWhere+' ( EQUIPO='''+DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString+''' AND '
                    +   'NUMOFI='''+DMCNT.cdsCNT311.FieldByName('NUMOFI').AsString+''' ) OR ';
      DMCNT.cdsCNT311.Next;
   end;
   if Length(cWhere)>0 then
   begin
      cWhere:=Copy(cWhere,1,Length(cWhere)-3);
      cWhere:=' and NOT ( '+cWhere+' ) ';
   end;

   DMCNT.cdsCNT311.First;

   if meEQ.Text='' then
   xSQL:='Select A.*, b.CtaBanco from tOfiDes A, tBancos B '
        +'Where A.FECHA>=#'+cDiaIni+'# and A.FECHA<=#'+cDiaFin+'# '+cWhere
        +  'and a.CodBco=b.CodBco and a.CtaOri=b.CodCta '
        +'ORDER BY FECHA, EQUIPO, NUMOFI'
   else
   xSQL:='Select A.*, b.CtaBanco from tOfiDes A, tBancos B '
        +'Where A.FECHA>=#'+cDiaIni+'# and A.FECHA<=#'+cDiaFin+'# '+cWhere
        +  'and a.CodBco=b.CodBco and a.CtaOri=b.CodCta '
        +  'and a.Equipo='''+meEQ.Text+''' '
        +'ORDER BY FECHA, EQUIPO, NUMOFI';
        
   cdsOficios.Active:=False;
   cdsOficios.CommandText:=xSQL;
   cdsOficios.Active:=True;
end;


procedure TFTransfGiro.bbtnTransferirClick(Sender: TObject);
var
   nCon, x10 : Integer;
   xSQL   : String;
   cError : Boolean;
begin
   Screen.Cursor:=CrHourGlass;

   xSQL:='Select ''      '' NUMOFI, ''       '' NUMLIQ, PROV, PROVDES, '
        +  '''            '' CUENTA, ''        '' CODUSU, '
        +  '''                                   '' OBSERVACION '
        +'from TGE201 A Where CLAUXID=''XX'' AND PROV=''XYZX'' '
        +'Order by NUMOFI, NUMLIQ, PROVDES, CUENTA, OBSERVACION';
   DMCNT.cdsReporteC.Close;
   DMCNT.cdsReporteC.DataRequest( xSQL );
   DMCNT.cdsReporteC.Open;

   cError:=False;
   cdsOficios.First;
   while not cdsOficios.Eof do
   begin
      if not ValidaDatos then
      begin
         cError:=True
      end;
      cdsOficios.Next;
   end;

   if cError Then
   begin
      ppdb1.DataSource:=DMCNT.dsReporteC;
      ppr1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\SustentoOficios.rtm';
      ppr1.template.LoadFromFile ;
      Screen.Cursor:=CrDefault;
      if cbDisenoRep.Checked then
         ppd1.ShowModal
      else
      begin
         ppr1.Print;
         ppr1.Stop;

         x10:=self.componentCount-1;
         while x10>0 do begin
           if self.components[x10].classname='TppGroup' then begin
              self.components[x10].free;
           end;
           x10:=x10-1;
         end;
         DMCNT.cdsMOVCNT1.EnableControls;
         ppdb1.DataSource:=nil;
      end;
      Exit;
   End;

   nCon:=0;
   cdsOficios.First;
   while not cdsOficios.Eof do
   begin
      dbgOficioDblClick(self);
   end;
   Screen.Cursor:=CrDefault;
end;


procedure TFTransfGiro.dbgOficioDblClick(Sender: TObject);
Var
   xSQL : String;
   x10  : Integer;
begin
   if cdsOficios.RecordCount<=0 then
   begin
      ShowMessage('No existen Oficios Generados');
      Exit;
   end;

   Screen.Cursor:=CrHourGlass;

   xSQL:='Select ''      '' NUMOFI, ''       '' NUMLIQ, PROV, PROVDES, '
        +  '''            '' CUENTA, ''        '' CODUSU, '
        +  '''                                   '' OBSERVACION '
        +'from TGE201 A Where CLAUXID=''XX'' AND PROV=''XYZX'' '
        +'Order by NUMOFI, NUMLIQ, PROVDES, CUENTA, OBSERVACION';
   DMCNT.cdsReporteC.Close;
   DMCNT.cdsReporteC.DataRequest( xSQL );
   DMCNT.cdsReporteC.Open;

   if not ValidaDatos then
   begin
      ppdb1.DataSource:=DMCNT.dsReporteC;
      ppr1.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\SustentoOficios.rtm';
      ppr1.template.LoadFromFile ;
      Screen.Cursor:=CrDefault;
      if cbDisenoRep.Checked then
         ppd1.ShowModal
      else
      begin
         ppr1.Print;
         ppr1.Stop;

         x10:=self.componentCount-1;
         while x10>0 do begin
           if self.components[x10].classname='TppGroup' then begin
              self.components[x10].free;
           end;
           x10:=x10-1;
         end;
         DMCNT.cdsMOVCNT1.EnableControls;
         ppdb1.DataSource:=nil;
      end;
      Exit;
   end;

   TransferirOficio;

   bbtnBuscarClick( Self );

   Screen.Cursor:=CrDefault;

   ShowMessage('ok');
end;


procedure TFTransfGiro.TransferirOficio;
var
  xSQL : String;
  nReg : Integer;
begin
   DMCNT.cdsCNT311.Append;
   DMCNT.cdsCNT311.FieldByName('FECINI').AsString :=cdsOficios.FieldByName('FECINI').AsString;
   DMCNT.cdsCNT311.FieldByName('FECFIN').AsString :=cdsOficios.FieldByName('FECFIN').AsString;
   DMCNT.cdsCNT311.FieldByName('BANDES').AsString :=cdsOficios.FieldByName('ABRBCO').AsString;
   DMCNT.cdsCNT311.FieldByName('CTAORI').AsString :=cdsOficios.FieldByName('CTAORI').AsString;
   DMCNT.cdsCNT311.FieldByName('TIPMOV').AsString :=cdsOficios.FieldByName('TIPMOV').AsString;

   if cdsOficios.FieldByName('MONEDA').AsString='S' then
      DMCNT.cdsCNT311.FieldByName('MONEDA').AsString:='N'
   else
      DMCNT.cdsCNT311.FieldByName('MONEDA').AsString:=cdsOficios.FieldByName('MONEDA').AsString;

   DMCNT.cdsCNT311.FieldByName('MONTO').AsString  :=cdsOficios.FieldByName('MONTO').AsString;
   DMCNT.cdsCNT311.FieldByName('NUMMOV').AsString :=cdsOficios.FieldByName('NROMOV').AsString;
   DMCNT.cdsCNT311.FieldByName('NUMOFI').AsString :=cdsOficios.FieldByName('NUMOFI').AsString;
   DMCNT.cdsCNT311.FieldByName('IMPRESO').AsString:=cdsOficios.FieldByName('IMPRESO').AsString;
   DMCNT.cdsCNT311.FieldByName('OBSERVACION').AsString:=cdsOficios.FieldByName('OBSERVA').AsString;
   DMCNT.cdsCNT311.FieldByName('CODBAN').AsString :=cdsOficios.FieldByName('CODBCO').AsString;
   DMCNT.cdsCNT311.FieldByName('USUARIO').AsString:=cdsOficios.FieldByName('USUARIO').AsString;
   DMCNT.cdsCNT311.FieldByName('FECHA').AsString  :=cdsOficios.FieldByName('FECHA').AsString;
   DMCNT.cdsCNT311.FieldByName('HORA').AsDateTime :=strToDateTime(cdsOficios.FieldByName('FECHA').AsString+' '+cdsOficios.FieldByName('HORA').AsString);
   DMCNT.cdsCNT311.FieldByName('ANOOFI').AsString :=cdsOficios.FieldByName('ANOOFI').AsString;
   DMCNT.cdsCNT311.FieldByName('EQUIPO').AsString :=cdsOficios.FieldByName('EQUIPO').AsString;
   DMCNT.cdsCNT311.FieldByName('ESTCON').AsString :='N';
   if cdsOficios.FieldByName('ESTADO').AsString='ANU' then
      DMCNT.cdsCNT311.FieldByName('ESTADO').AsString :='S';
   DMCNT.cdsCNT311.FieldByName('CUEBAN').AsString:=cdsOficios.FieldByName('CTABANCO').AsString;

   DMCNT.cdsCNT311.Post;
   DMCNT.cdsCNT311.ApplyUpdates(0);

   xSQL:='Select * from CNT_LIQ_CAB '
        +'Where EQUIPO='''+cdsOficios.FieldByName('EQUIPO').AsString+''' '
        +  'and NUMOFI='''+cdsOficios.FieldByName('NUMOFI').AsString+''' '
        +  'and ANOLIQ='''+cdsOficios.FieldByName('ANOOFI').AsString+''' '
        +  'and CTAORI='''+cdsOficios.FieldByName('ANOOFI').AsString+''' '
        +'ORDER BY FECHA DESC, EQUIPO, NUMOFI';
   DMCNT.cdsLiqCon.Close;
   DMCNT.cdsLiqCon.DataRequest( xSQL );
   DMCNT.cdsLiqCon.Open;

   xSQL:='Select B.DesUser, A.* from tMovCab A, tUserLiq B '
        +'Where a.EQUIPO='''+cdsOficios.FieldByName('EQUIPO').AsString+''' '
        +  'and a.NUMOFI='''+cdsOficios.FieldByName('NUMOFI').AsString+''' '
        +  'and a.ANOLIQ='''+cdsOficios.FieldByName('ANOOFI').AsString+''' '
        +  'and a.CTAORI='''+cdsOficios.FieldByName('CTAORI').AsString+''' '
        +  'and a.CodUsu=b.CodUser '
        +'ORDER BY b.DesUser, a.NumLiq';
   cdsLiqui.Active:=False;
   cdsLiqui.CommandText:=xSQL;
   cdsLiqui.Active:=True;

   nReg:=0;
   while not cdsLiqui.Eof do
   begin
      nReg:=nReg+1;
      DMCNT.cdsLiqCon.Append;
      DMCNT.cdsLiqCon.FieldByName('NUMLIQ').AsString     :=cdsLiqui.FieldByName('NUMLIQ').AsString;
      DMCNT.cdsLiqCon.FieldByName('ANOLIQ').AsString     :=cdsLiqui.FieldByName('ANOLIQ').AsString;
      DMCNT.cdsLiqCon.FieldByName('FECLIQ').AsString     :=cdsLiqui.FieldByName('FECLIQ').AsString;
      DMCNT.cdsLiqCon.FieldByName('TIPMOV').AsString     :=cdsLiqui.FieldByName('TIPMOV').AsString;
      DMCNT.cdsLiqCon.FieldByName('CTAORI').AsString     :=cdsLiqui.FieldByName('CTAORI').AsString;
      DMCNT.cdsLiqCon.FieldByName('CODUSU').AsString     :=cdsLiqui.FieldByName('CODUSU').AsString;
      DMCNT.cdsLiqCon.FieldByName('CTADES').AsString     :=cdsLiqui.FieldByName('CTADES').AsString;
      DMCNT.cdsLiqCon.FieldByName('IMPTOT').AsString     :=cdsLiqui.FieldByName('IMPTOT').AsString;
      DMCNT.cdsLiqCon.FieldByName('LUGGIR').AsString     :=cdsLiqui.FieldByName('LUGGIR').AsString;
      DMCNT.cdsLiqCon.FieldByName('NUMOFI').AsString     :=cdsLiqui.FieldByName('NUMOFI').AsString;
      DMCNT.cdsLiqCon.FieldByName('IMPRESO').AsString    :=cdsLiqui.FieldByName('IMPRESO').AsString;
      DMCNT.cdsLiqCon.FieldByName('ESTADO').AsString     :=cdsLiqui.FieldByName('ESTADO').AsString;
      DMCNT.cdsLiqCon.FieldByName('EQUIPO').AsString     :=cdsLiqui.FieldByName('EQUIPO').AsString;
      DMCNT.cdsLiqCon.FieldByName('USUARIO').AsString    :=cdsLiqui.FieldByName('USUARIO').AsString;
      DMCNT.cdsLiqCon.FieldByName('FECHA').AsString      :=cdsLiqui.FieldByName('FECHA').AsString;
      DMCNT.cdsLiqCon.FieldByName('HORA').AsString       :=cdsLiqui.FieldByName('HORA').AsString;
      DMCNT.cdsLiqCon.FieldByName('ESTLIQSUS').AsString  :='N';
      DMCNT.cdsLiqCon.FieldByName('FECRENLIQ').AsDateTime:=0;
      DMCNT.cdsLiqCon.FieldByName('ESTRENLIQ').AsString  :='';
      DMCNT.cdsLiqCon.FieldByName('ESTCONREN').AsString  :='';
      DMCNT.cdsLiqCon.FieldByName('USUCONREN').AsString  :='';
      DMCNT.cdsLiqCon.FieldByName('ORDEN').AsString      :=DMCNT.StrZero(IntToStr(nReg),3);
      DMCNT.cdsLiqCon.Post;

      if DMCNT.cdsLiqCon.ApplyUpdates(0)>0 then
      begin
         ShowMessage('Error al Grabar Liquidacion Cabecera');
      end;

      xSQL:='Select A.* from tMovDet A '
           +'Where NUMLIQ='''+cdsLiqui.FieldByName('NUMLIQ').AsString+''' '
           +  'and ANOLIQ='''+cdsLiqui.FieldByName('ANOLIQ').AsString+''' '
           +  'and CodUsu='''+cdsLiqui.FieldByName('CODUSU').AsString+''' '
           +'ORDER BY CUENTA';
      cdsCuenta.Active:=False;
      cdsCuenta.CommandText:=xSQL;
      cdsCuenta.Active:=True;

      xSQL:='Select * from CNT_LIQ_DET '
           +'Where NUMLIQ='''+cdsLiqui.FieldByName('NUMLIQ').AsString+''' '
           +  'and ANOLIQ='''+cdsLiqui.FieldByName('ANOLIQ').AsString+''' '
           +  'and EQUIPO='''+cdsLiqui.FieldByName('EQUIPO').AsString+''' '
           +'ORDER BY CUENTA';
      DMCNT.cdsLiqDet.Close;
      DMCNT.cdsLiqDet.DataRequest( xSQL );
      DMCNT.cdsLiqDet.Open;

      while not cdsCuenta.Eof do
      begin
         DMCNT.cdsLiqDet.Append;
         DMCNT.cdsLiqDet.FieldByName('NUMLIQ').AsString     :=cdsCuenta.FieldByName('NUMLIQ').AsString;
         DMCNT.cdsLiqDet.FieldByName('ANOLIQ').AsString     :=cdsCuenta.FieldByName('ANOLIQ').AsString;
         DMCNT.cdsLiqDet.FieldByName('EQUIPO').AsString     :=cdsLiqui.FieldByName( 'EQUIPO').AsString;
         DMCNT.cdsLiqDet.FieldByName('FECLIQ').AsString     :=cdsCuenta.FieldByName('FECLIQ').AsString;
         DMCNT.cdsLiqDet.FieldByName('TIPMOV').AsString     :=cdsCuenta.FieldByName('TIPMOV').AsString;
         DMCNT.cdsLiqDet.FieldByName('CUENTA').AsString     :=cdsCuenta.FieldByName('CUENTA').AsString;
         DMCNT.cdsLiqDet.FieldByName('CODUSU').AsString     :=cdsCuenta.FieldByName('CODUSU').AsString;
         DMCNT.cdsLiqDet.FieldByName('IMPORTE').AsFloat     :=cdsCuenta.FieldByName('IMPORTE').AsFloat;
         DMCNT.cdsLiqDet.FieldByName('USUARIO').AsString    :=cdsCuenta.FieldByName('USUARIO').AsString;
         DMCNT.cdsLiqDet.FieldByName('FECHA').AsString      :=cdsCuenta.FieldByName('FECHA').AsString;
         DMCNT.cdsLiqDet.FieldByName('HORA').AsString       :=cdsCuenta.FieldByName('HORA').AsString;
         DMCNT.cdsLiqDet.FieldByName('PERMES').AsString     :=cdsCuenta.FieldByName('PERMES').AsString;
         DMCNT.cdsLiqDet.FieldByName('PERANO').AsString     :=cdsCuenta.FieldByName('PERANO').AsString;
         DMCNT.cdsLiqDet.FieldByName('OBSERVACION').AsString:=cdsCuenta.FieldByName('OBSERVACION').AsString;
         DMCNT.cdsLiqDet.FieldByName('ESTADO').AsString     :=cdsCuenta.FieldByName('ESTADO').AsString;
         DMCNT.cdsLiqDet.FieldByName('RENDICION').AsFloat   :=cdsCuenta.FieldByName('IMPORTE').AsFloat;
         DMCNT.cdsLiqDet.Post;
         cdsCuenta.Next;
      end;

      if DMCNT.cdsLiqDet.ApplyUpdates(0)>0 then
      begin
         ShowMessage('Error al Grabar Liquidacion Cabecera');
      end;
      
      cdsLiqui.Next;
   end;
end;


function TFTransfGiro.ValidaDatos : Boolean;
var
   xSQL : String;
begin
   Result := True;

   xSQL:='Select A.*, B.DesUser from tMovCab A, tUserLiq B '
        +'Where A.EQUIPO='''+cdsOficios.FieldByName('EQUIPO').AsString+''' '
        +  'and A.NUMOFI='''+cdsOficios.FieldByName('NUMOFI').AsString+''' '
        +  'and A.ANOLIQ='''+cdsOficios.FieldByName('ANOOFI').AsString+''' '
        +  'and A.CODUSU=B.CODUSER '
        +'ORDER BY A.FECHA DESC, A.EQUIPO, A.NUMOFI';
   cdsLiqui.Active:=False;
   cdsLiqui.CommandText:=xSQL;
   cdsLiqui.Active:=True;

   while not cdsLiqui.Eof do
   begin
      xSQL:='SELECT A.PROV, A.CENCOSOFI CCOSID, B.CCOSABR, A.PROVABR '
           +'FROM TGE201 A, TGE203 B '
           +'WHERE EQUPROOFI='''+cdsLiqui.FieldByName('CODUSU').AsString+''' '
           +  'AND CENCOSOFI=CCOSID(+)';
      DMCNT.cdsQry2.Close;
      DMCNT.cdsQry2.DataRequest(xSQL);
      DMCNT.cdsQry2.Open;

      if DMCNT.cdsQry2.FieldByName('PROV').AsString='' then
      begin
         DMCNT.cdsReporteC.Insert;
         DMCNT.cdsReporteC.FieldByname('NUMOFI').AsString :=cdsOficios.FieldByName('NUMOFI').AsString;
         DMCNT.cdsReporteC.FieldByname('NUMLIQ').AsString :=cdsLiqui.FieldByName('NUMLIQ').AsString;
         DMCNT.cdsReporteC.FieldByname('PROV').AsString   :='';
         DMCNT.cdsReporteC.FieldByname('CODUSU').AsString :=cdsLiqui.FieldByName('CODUSU').AsString;
         DMCNT.cdsReporteC.FieldByname('PROVDES').AsString:=cdsLiqui.FieldByName('DESUSER').AsString;
         DMCNT.cdsReporteC.FieldByname('OBSERVACION').AsString:='Proveedor no tiene Equivalencia';
         DMCNT.cdsReporteC.Post;
         Result := False;
      end;

      xSQL:='Select A.* from tMovDet A '
           +'Where NUMLIQ='''+cdsLiqui.FieldByName('NUMLIQ').AsString+''' '
           +  'and ANOLIQ='''+cdsLiqui.FieldByName('ANOLIQ').AsString+''' '
           +'ORDER BY NUMLIQ';
      cdsCuenta.Active:=False;
      cdsCuenta.CommandText:=xSQL;
      cdsCuenta.Active:=True;

      while not cdsCuenta.Eof do
      begin
         xSQL:='SELECT CUENTAID, CTADES, CTA_AUX, CTA_CCOS FROM TGE202 '
              +'WHERE CIAID=''02'' AND CUENTAID='''+cdsCuenta.FieldByName('CUENTA').AsString+'''';
         DMCNT.cdsQry2.Close;
         DMCNT.cdsQry2.DataRequest(xSQL);
         DMCNT.cdsQry2.Open;

         if DMCNT.cdsQry2.FieldByname('CUENTAID').AsString='' then
         begin
            DMCNT.cdsReporteC.Insert;
            DMCNT.cdsReporteC.FieldByname('NUMOFI').AsString :=cdsOficios.FieldByName('NUMOFI').AsString;
            DMCNT.cdsReporteC.FieldByname('NUMLIQ').AsString :=cdsLiqui.FieldByName('NUMLIQ').AsString;
            DMCNT.cdsReporteC.FieldByname('CODUSU').AsString :=cdsLiqui.FieldByName('CODUSU').AsString;
            DMCNT.cdsReporteC.FieldByname('PROVDES').AsString:=cdsLiqui.FieldByName('DESUSER').AsString;
            DMCNT.cdsReporteC.FieldByname('CUENTA').AsString :=cdsCuenta.FieldByName('CUENTA').AsString;
            DMCNT.cdsReporteC.FieldByname('OBSERVACION').AsString:='Cuenta Contable no Existe';
            DMCNT.cdsReporteC.Post;
            Result := False;
         end;
         cdsCuenta.Next;
      end;
      cdsLiqui.Next;
   end;
end;



procedure TFTransfGiro.sbDisenoRepClick(Sender: TObject);
begin
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
end;

end.
