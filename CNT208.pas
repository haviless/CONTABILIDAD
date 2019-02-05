unit Cnt208;
// Actualizaciones
// HPC_201501_CNT          12/02/2015  Regulariza Métodos Correctos de Control Transaccional

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, wwdblook,db, Wwdbdlg,
  CheckLst, oaVariables, wwclient;

type
  TFCCosto = class(TForm)
    lblNivel: TLabel;
    dblcNivel: TwwDBLookupCombo;
    dbeIdCCosto: TwwDBEdit;
    lblIdCCosto: TLabel;
    lblDesCCosto: TLabel;
    dbeDesCCosto: TwwDBEdit;
    lblAbrCCosto: TLabel;
    dbeAbrCCosto: TwwDBEdit;
    rgMov: TRadioGroup;
    rgActivo: TRadioGroup;
    Z2bbtnOk: TBitBtn;
    Z2bbtnCanc: TBitBtn;
    dbeDig: TwwDBEdit;
    lblDig: TLabel;
    chlbCia: TCheckListBox;
    Label1: TLabel;
    gb02: TGroupBox;
    gb04: TGroupBox;
    lblCia: TLabel;
    dblcCia02: TwwDBLookupCombo;
    edtCia02: TEdit;
    Label2: TLabel;
    dblcCia04: TwwDBLookupCombo;
    edtCia04: TEdit;
    Label5: TLabel;
    dblcdCuenta02: TwwDBLookupComboDlg;
    Label3: TLabel;
    dblcdCuenta04: TwwDBLookupComboDlg;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z2bbtnCancClick(Sender: TObject);
    procedure dbeIdCCostoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeIdCCostoExit(Sender: TObject);
    procedure dblcNivelExit(Sender: TObject);
    procedure Z2bbtnOkClick(Sender: TObject);
    procedure dblcNivelNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure chlbCiaClickCheck(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcCia04NotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcCia02NotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcCia02Exit(Sender: TObject);
    procedure dblcCia04Exit(Sender: TObject);
    procedure dblcdCuenta02Enter(Sender: TObject);
    procedure dblcdCuenta04Enter(Sender: TObject);
    procedure dblcdCuenta02Exit(Sender: TObject);
    procedure dblcdCuenta04Exit(Sender: TObject);
  private
    { Private declarations }
    xAsigna,xSigno : String;
    xCias,xNivel1 : String;
    xTrues : Boolean;

    // vhn 20121011
    cdsCuenta2 : TwwClientDataset ;

    procedure Limpia;
    Function  ValNivelAnt : boolean;
    function  ValNivelSup: boolean;
    procedure ActNivelAnt;
    Function  VAlida : Boolean;
    Function  ExisteCCosto : Boolean;
    Procedure AsignaCia;
    procedure CargaCia;
  public
    { Public declarations }
  end;

  procedure CNCentroCosto; stdcall;

exports
  CNCentroCosto;

var
  FCCosto: TFCCosto;

implementation

uses CNTDM, oaCN1000;

{$R *.DFM}

procedure CNCentroCosto;
//var
//   xSQL : String;
begin
   if DMCNT=nil then exit;
   if not DMCNT.DCOM1.Connected then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a más de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;

   Application.Initialize;

   try
//     xSQL:='Select * from CXP301 Where CIAID=''ZZ'' AND TDIARID=''ZZ''';
//     DMCNT.cdsMovCxP2.Close;
//     DMCNT.cdsMovCxP2.DataRequest( xSQL );
//     DMCNT.cdsMovCxP2.Open;
     DMCNT.wModo:= 'A';

     FCCosto := TFCCosto.Create( Application );
     FCCosto.ActiveMDIChild
   finally
   end;

end;

procedure TFCCosto.Limpia;
var
 xI : Integer;
begin
    dblcNivel.text := '';
    dbeIdCCosto.text := '';
    dbeDesCCosto.text := '';
    dbeAbrCCosto.text := '';
    rgMov.ItemIndex := -1;
    rgActivo.ItemIndex := 0;
    For xI := 0 to chlbCia.Items.count -1 do
      chlbCia.Checked[xI] := False;
end;

procedure TFCCosto.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFCCosto.Z2bbtnCancClick(Sender: TObject);
begin
  Close;
end;

procedure TFCCosto.dbeIdCCostoKeyPress(Sender: TObject; var Key: Char);
begin
 If Key In [' ','A'..'Z','a'..'z',
            '°','|',' ','!','"','#','$','%','&','/','(',')','=','?','\','¡','¿','@',
            '¨','´','*','+','~','~','[',']','{','}','^','`','<','>',';',',',':','''',
            '-','_'] Then
    Key :=#0;
end;

procedure TFCCosto.dbeIdCCostoExit(Sender: TObject);
begin
  If dblcNivel.Focused then exit; 
  If Z2bbtnCanc.Focused then exit;
  xAsigna := '';
  rgActivo.itemindex := 0;
  If xSigno = '=' then
   xTrues := Length(dbeIdCCosto.text) = StrToInt(dbeDig.text);
  If xSigno = '<=' then
   xTrues := Length(dbeIdCCosto.text) <= StrToInt(dbeDig.text);
  If xSigno = '>=' then
   xTrues := Length(dbeIdCCosto.text) >= StrToInt(dbeDig.text);
  If xSigno = '>' then
   xTrues := Length(dbeIdCCosto.text) > StrToInt(dbeDig.text);
  If xSigno = '<' then
   xTrues := Length(dbeIdCCosto.text) < StrToInt(dbeDig.text);

  If not xTrues then
   begin
    Showmessage('La cantidad de Digitos no concuerdan con el Nivel');
    dbeIdCCosto.setfocus;
    exit
   end;

   //** valida que el centro de costo no exista
   If not ExisteCCosto then
    begin
     Showmessage('El Centro de Costo Existe');
     dbeIdCCosto.setfocus;
     exit
    end;

   //** valido si existe nivel anterior
   If not ValNivelAnt then
    begin
     xTrues := False;
     dbeIdCCosto.setfocus;
     exit;
    end
   else
     rgMov.Itemindex := 0;

   //** valida si existe un nivel superior
   If not ValNivelSup then
    begin
     Showmessage('Ya existe un Nivel Superior');
     dbeIdCCosto.setfocus;
     exit
    end;
end;

Function TFCCosto.ValNivelAnt : boolean;
var
 xI,xDigitos :  Integer ;
 xWhere,xCuenta :  string ;
begin
   // verifica que los niveles anteriores hayan sido registrados
   Result := True;
   DMCNT.cdsQry2.First ;
   while (not DMCNT.cdsQry2.Eof) and (DMCNT.cdsQry2.FieldByName('NIVEL').AsString < xNivel1) do
    begin
      xDigitos := DMCNT.cdsQry2.FieldByName('DIGITOS').AsInteger;
      xCuenta:=copy(dbeIdCCosto.Text,1,xDigitos);
      xWhere := 'CCOSID='+quotedStr(xCuenta);
      if length(DMCNT.DisplayDescrip('PrvTGE','TGE203','*',xWhere,'CCOSID'))=0 then
       begin
         showMessage('No hay C.Costo en Nivel'+DMCNT.cdsQry2.FieldByName('NIVEL').AsString);
         Result := false;
         exit;
       end
      else
       begin
        dbeDesCCosto.text := DMCNT.cdsqry.Fieldbyname('CCOSDES').AsString;
        dbeAbrCCosto.text := DMCNT.cdsqry.Fieldbyname('CCOSABR').AsString;
        AsignaCia;
       end;
      DMCNT.cdsQry2.Next;
    end;
end;


procedure TFCCosto.dblcNivelExit(Sender: TObject);
var
 xwhere : String;
begin
  xWhere := 'NIVEL='+quotedstr(dblcNivel.text);
  dbeDig.TExt := DMCNT.DisplayDescrip('PrvTGE','CNT206','*',xWhere,'DIGITOS');
  If Length(dbeDig.TExt) > 0 then
   begin
    xSigno := DMCNT.cdsQry.FieldByName('SIGNO').AsString;
    xNivel1 := dblcNivel.text;
   end
  else
   begin
    xSigno := '';
    xNivel1 := '';
   end
end;

function TFCCosto.ValNivelSup: boolean;
var
 xSql : String;
begin
    Result := True;
    xSql := 'SELECT COUNT(*) TOTAL FROM TGE203 WHERE CCOSID LIKE '+
             quotedstr(trim(dbeIdCCosto.text)+'%');
    DMCNT.cdsQry3.indexfieldnames := '';
    DMCNT.cdsQry3.close;
    DMCNT.cdsQry3.DataRequest(xSql);
    DMCNT.cdsQry3.open;
    If DMCNT.cdsQry3.FieldByName('TOTAL').AsFloat > 1 then
     Result := False;
end;


procedure TFCCosto.Z2bbtnOkClick(Sender: TObject);
var
 xI : Integer;
 xWhere, xSQL: String;
begin
   //** valida que esten todos los datos
   If not Valida then
      exit;

   //** si es nuevo inserta si no edita
   If DMCNT.wModo = 'A' then
      DMCNT.cdsCCosto.insert
   else
      DMCNT.cdsCCosto.Edit;

   //** asigna los valores
   DMCNT.cdsCCosto.FieldByName('CCOSID').AsString  := dbeIdCCosto.Text;
   DMCNT.cdsCCosto.FieldByName('CCOSDES').AsString := dbeDesCCosto.Text;
   DMCNT.cdsCCosto.FieldByName('CCOSABR').AsString := dbeAbrCCosto.Text;
   DMCNT.cdsCCosto.FieldByName('CCOSNIV').AsString := dblcNivel.Text;

   DMCNT.cdsCCosto.FieldByName('CIADEST').AsString  := dblcCia02.Text;
   DMCNT.cdsCCosto.FieldByName('BAZCIA').AsString   := dblcCia04.Text;
   DMCNT.cdsCCosto.FieldByName('CUENTAID').AsString := dblcdCuenta02.Text;
   DMCNT.cdsCCosto.FieldByName('BAZCTA').AsString   := dblcdCuenta04.Text;

   If rgMov.ItemIndex = 0 then
      DMCNT.cdsCCosto.FieldByName('CCOSMOV').AsString := 'S'
   else
      DMCNT.cdsCCosto.FieldByName('CCOSMOV').AsString := 'N';

   DMCNT.cdsCCosto.FieldByName('CCOSCIAS').AsString := xCias;

   If rgActivo.ItemIndex = 0 then
      DMCNT.cdsCCosto.FieldByName('CCOSACT').AsString := 'S'
   else
      DMCNT.cdsCCosto.FieldByName('CCOSACT').AsString := 'N';

   // vhndema
   if Length(dbeIdCCosto.Text)=2 then
      DMCNT.cdsCCosto.FieldByName('GRUCENCOS').AsString:=DMCNT.cdsCCosto.FieldByName('CCOSDES').AsString
   else
   begin
      xSQL:='Select * from TGE203 where CCOSID='''+Copy(dbeIdCCosto.Text,1,2)+'''';
      DMCNT.cdsQry.Close;
      DMCNT.cdsQry.DataRequest( xSQL );
      DMCNT.cdsQry.Open;
      DMCNT.cdsCCosto.FieldByName('GRUCENCOS').AsString:=DMCNT.cdsQry.FieldByName('CCOSDES').AsString;
   end;
   // end vhndema

   DMCNT.AplicaDatos(DMCNT.cdsCCosto,'');

   //** actualiza los niveles anteriores
   ActNivelAnt;
   Limpia;

   if DMCNT.wModo <> 'A' then
      Close;

end;


procedure TFCCosto.ActNivelAnt;
var
 xWhere,xSql,xCuenta0,xCuenta1,xNivel2,xNivel0 : String;
 xI,xNive   : Integer;
begin
   xNive:=0;
   xNivel2 := DMCNT.StrZero(inttoStr((strtoInt(xNivel1))-1),length(xNivel1));
   DMCNT.cdsQry2.SetKey;
   DMCNT.cdsQry2.FieldByName('NIVEL').AsString := xNivel2;
   if DMCNT.cdsQry2.GotoKey then
    begin
     xNive := DMCNT.cdsQry2.FieldByName('DIGITOS').AsInteger;
    end;
   xCuenta1 := copy(dbeIdCCosto.Text,1,xNive);
   DMCNT.cdsQry2.first;
   If StrToInt(xNivel2) - 1 > 0 then
    begin
     For xI := StrToInt(xNivel2) - 1 downto 0 do
      begin
       xNivel0 := DMCNT.StrZero(IntToStr(xI),2);
       DMCNT.cdsQry2.SetKey;
       DMCNT.cdsQry2.FieldByName('NIVEL').AsString := xNivel0;
       if DMCNT.cdsQry2.GotoKey then
        begin
         xNive := DMCNT.cdsQry2.FieldByName('DIGITOS').AsInteger;
         xCuenta0 := copy(dbeIdCCosto.Text,1,xNive);
        end;
      end;
    end
   else
    xCuenta0 := xCuenta1;

   if xCuenta1<>'' then
   begin
      For xI := 0 to chlbCia.Items.Count -1 do
       begin
        If chlbCia.Checked[xI] then
         begin
          If xWhere = '' then
           begin
            xWhere := 'CCOSCIAS LIKE '+quotedStr('%'+copy(chlbCia.Items.Strings[xI],1,2)+'%');
            end
          else
           begin
            xWhere := xWhere+' or '+'CCOSCIAS LIKE '+quotedStr('%'+copy(chlbCia.Items.Strings[xI],1,2)+'%');
            end;
         end;
       end;

       // vhndema 20060109
       if xWhere<>'' then
          xWhere:='('+xWhere+') and ';

      xSQL:='Update TGE203 set CCOSMOV='+quotedstr('N');

      if xCias<>'' then
         xSQL:=xSQL
           +',CCOSCIAS='+quotedstr(xCias);

      xSQL:=xSQL
           +' WHERE '+xWhere+' ('+'CCOSID>='+quotedstr(xCuenta0)+' and CCOSID <='+
           quotedstr(xCuenta1)+')';

      DMCNT.DCOM1.AppServer.IniciaTransaccion;
      try
         DMCNT.DCOM1.AppServer.EjecutaQry(xSql);
         DMCNT.DCOM1.AppServer.GrabaTransaccion;
      except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
      end;

      // end vhndema
   end;
end;


function TFCCosto.VAlida: Boolean;
begin
   Result := dblcNivel.text <> '' ;
   Result := dbeDig.text <> '' ;
   Result := dbeIdCCosto.text <> '' ;
   Result := dbeDesCCosto.text <> '' ;
   Result := dbeAbrCCosto.text <> '' ;
   Result := rgMov.itemindex <> -1;
   Result := rgActivo.itemindex <> -1;
end;

procedure TFCCosto.dblcNivelNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
	Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

function TFCCosto.ExisteCCosto: Boolean;
var
 xSql : string;
begin
   Result := True;
   xSql := 'SELECT count(*) TOTAL FROM TGE203 WHERE CCOSID='+quotedstr(dbeIdCCosto.text);
   DMCNT.cdsQry3.Close;
   DMCNT.cdsQry3.DataRequest(xSql);
   DMCNT.cdsQry3.Open;
   If DMCNT.cdsQry3.FieldByName('TOTAL').AsFloat > 0 then
    Result := False;
end;

procedure TFCCosto.AsignaCia;
var
 xI : Integer;
 xItem : String;
begin
 //** asigna la(s) cia(s)
   xAsigna := 'S';
   For xI := 0 to chlbCia.Items.Count -1 do
    begin
     xItem := copy(chlbCia.Items.Strings[xI],1,2);
     If DMCNT.wModo = 'A' then
      chlbCia.Checked[xI] := DMCNT.Buscar(DMCNT.cdsQry.FieldByName('CCOSCIAS').AsString,xItem) <> '0'
     else
      chlbCia.Checked[xI] := DMCNT.Buscar(DMCNT.cdsCCosto.FieldByName('CCOSCIAS').AsString,xItem) <> '0'
    end;
   xAsigna := '';
end;

procedure TFCCosto.chlbCiaClickCheck(Sender: TObject);
var
 xI : Integer;
begin
   If xAsigna = '' then
    begin
     CargaCia;
    end;
end;

procedure TFCCosto.CargaCia;
var
 xI : Integer;
begin
     xCias := '';
     For xI := 0 to chlbCia.Items.count  -1 do
      begin
       If chlbCia.Checked[xI] then
        If xCias = '' then
         xCias := copy(chlbCia.Items.Strings[xI],1,2)+','
        else
         xCias := xCias + copy(chlbCia.Items.Strings[xI],1,2)+',';
      end;
end;

procedure TFCCosto.FormShow(Sender: TObject);
var
 xSql : String;
 xI : Integer;
begin

   dblcCia02.LookupTable    :=DMCNT.cdsCia;
   dblcCia04.LookupTable    :=DMCNT.cdsCia;
   dblcdCuenta02.LookupTable:=DMCNT.cdsCuenta;
   dblcdCuenta04.LookupTable:=DMCNT.cdsCuenta5;

   xSql := 'SELECT * FROM CNT206';
   DMCNT.cdsQry2.Close;
   DMCNT.cdsQry2.DataRequest(xSql);
   DMCNT.cdsQry2.Open;
   DMCNT.cdsQry2.IndexFieldNames := 'NIVEL';
   dblcNivel.Selected.clear;
   dblcNivel.Selected.Add('NIVEL'#9'2'#9'Id');
   dblcNivel.Selected.Add('DIGITOS'#9'1'#9'Dig.');
   dblcNivel.LookupTable := DMCNT.cdsQry2;
   dblcNivel.LookupField := 'NIVEL';

   chlbCia.Clear;
   DMCNT.cdsCia.First;
   While not DMCNT.cdsCia.Eof do
    begin
     chlbCia.Items.Add(DMCNT.cdsCia.FieldByName('CIAID').AsString+'  -- '+
                       DMCNT.cdsCia.FieldByName('CIADES').AsString );
     DMCNT.cdsCia.next;
    end;

   dblcNivel.Enabled  :=True;
   dbeIdCCosto.Enabled:=True;

   // vhndema 20060109
   If DMCNT.wModo <> 'A' then
   begin
      dblcNivel.Enabled  :=False;
      dbeIdCCosto.Enabled:=False;

//     dblcCia.text := MantcC.FMant.cds2.FieldByName('').AsString;
     dblcNivel.text := DMCNT.cdsCCosto.FieldByName('CCOSNIV').AsString;
     dblcNivel.OnExit(dblcNivel);
     dbeIdCCosto.text  := DMCNT.cdsCCosto.FieldByName('CCOSID').AsString;
     dbeDesCCosto.text := DMCNT.cdsCCosto.FieldByName('CCOSDES').AsString;
     dbeAbrCCosto.text := DMCNT.cdsCCosto.FieldByName('CCOSABR').AsString;
     dblcCia02.Text    := DMCNT.cdsCCosto.FieldByName('CIADEST').AsString;
     dblcCia02Exit(Self);
     dblcCia04.Text    := DMCNT.cdsCCosto.FieldByName('BAZCIA').AsString;
     dblcCia04Exit(Self);
     dblcdCuenta02.Text:= DMCNT.cdsCCosto.FieldByName('CUENTAID').AsString;
     dblcdCuenta04.Text:= DMCNT.cdsCCosto.FieldByName('BAZCTA').AsString;

     AsignaCia;
     CargaCia;

     IF DMCNT.cdsCCosto.FieldByName('CCOSMOV').AsString = 'S' then
      rgMov.ItemIndex := 0
     else
      rgMov.ItemIndex := 1;
     IF DMCNT.cdsCCosto.FieldByName('CCOSACT').AsString = 'S' then
      rgActivo.ItemIndex := 0
     else
      rgActivo.ItemIndex :=1;

     dbeDesCCosto.SetFocus;
   end;
   // end vhndema
end;

procedure TFCCosto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TRY
     FParametros.MantcC.FMant.cds2.SetKey;
     FParametros.MantcC.FMant.cds2.FieldByName('CCOSID').AsString:=DMCNT.cdsCCosto.FieldByName('CCOSID').AsString;
     if FParametros.MantcC.FMant.cds2.GotoKey then
     begin
        FParametros.MantcC.FMant.cds2.Edit;
        FParametros.MantcC.FMant.cds2.FieldByName('CCOSMOV').AsString :=DMCNT.cdsCCosto.FieldByName('CCOSMOV').AsString;
        FParametros.MantcC.FMant.cds2.FieldByName('CCOSCIAS').AsString:=DMCNT.cdsCCosto.FieldByName('CCOSCIAS').AsString;
        FParametros.MantcC.FMant.cds2.FieldByName('CCOSACT').AsString :=DMCNT.cdsCCosto.FieldByName('CCOSACT').AsString;
        FParametros.MantcC.FMant.cds2.FieldByName('CIADEST').AsString :=DMCNT.cdsCCosto.FieldByName('CIADEST').AsString;
        FParametros.MantcC.FMant.cds2.FieldByName('CUENTAID').AsString:=DMCNT.cdsCCosto.FieldByName('CUENTAID').AsString;
        FParametros.MantcC.FMant.cds2.FieldByName('BAZCIA').AsString  :=DMCNT.cdsCCosto.FieldByName('BAZCIA').AsString;
        FParametros.MantcC.FMant.cds2.FieldByName('BAZCTA').AsString  :=DMCNT.cdsCCosto.FieldByName('BAZCTA').AsString;
        FParametros.MantcC.FMant.cds2.Post;
     end
     else
     begin
        FParametros.MantcC.FMant.cds2.Insert;
        FParametros.MantcC.FMant.cds2.FieldByName('CCOSID').AsString  :=DMCNT.cdsCCosto.FieldByName('CCOSID').AsString;
        FParametros.MantcC.FMant.cds2.FieldByName('CCOSDES').AsString :=DMCNT.cdsCCosto.FieldByName('CCOSDES').AsString;
        FParametros.MantcC.FMant.cds2.FieldByName('CCOSNIV').AsString :=DMCNT.cdsCCosto.FieldByName('CCOSNIV').AsString;
        FParametros.MantcC.FMant.cds2.FieldByName('CCOSMOV').AsString :=DMCNT.cdsCCosto.FieldByName('CCOSMOV').AsString;
        FParametros.MantcC.FMant.cds2.FieldByName('CCOSCIAS').AsString:=DMCNT.cdsCCosto.FieldByName('CCOSCIAS').AsString;
        FParametros.MantcC.FMant.cds2.FieldByName('CCOSACT').AsString :=DMCNT.cdsCCosto.FieldByName('CCOSACT').AsString;
        FParametros.MantcC.FMant.cds2.FieldByName('CIADEST').AsString :=DMCNT.cdsCCosto.FieldByName('CIADEST').AsString;
        FParametros.MantcC.FMant.cds2.FieldByName('CUENTAID').AsString:=DMCNT.cdsCCosto.FieldByName('CUENTAID').AsString;
        FParametros.MantcC.FMant.cds2.FieldByName('BAZCIA').AsString  :=DMCNT.cdsCCosto.FieldByName('BAZCIA').AsString;
        FParametros.MantcC.FMant.cds2.FieldByName('BAZCTA').AsString  :=DMCNT.cdsCCosto.FieldByName('BAZCTA').AsString;
        FParametros.MantcC.FMant.cds2.Post;
     end;
  EXCEPT
  END;

  Action:=caFree;
end;

procedure TFCCosto.dblcCia04NotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFCCosto.dblcCia02NotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFCCosto.dblcCia02Exit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'CIAID='+''''+dblcCia02.Text+'''';
   edtCia02.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE101','CIADES',xWhere,'CIADES');
end;

procedure TFCCosto.dblcCia04Exit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere := 'CIAID='+''''+dblcCia04.Text+'''';
   edtCia04.Text:=DMCNT.DisplayDescrip('PrvTGE','TGE101','CIADES',xWhere,'CIADES');
end;

procedure TFCCosto.dblcdCuenta02Enter(Sender: TObject);
var
   xSQL : String;
begin
   DMCNT.cdsCuenta.Close;
   xSQL:='Select CUENTAID, CTADES '
        +'From TGE202 Where CIAID=''02'' AND CUENTAID LIKE ''166%'' AND CTAACT=''S''';
   DMCNT.cdsCuenta.DataRequest(xSQL);
   DMCNT.cdsCuenta.Open;
   DMCNT.cdsCuenta.IndexFieldNames := 'CUENTAID';
  // dblcdCuenta04.Text:= DMCNT.cdsCCosto.FieldByName('BAZCTA').AsString;
   dblcdCuenta02.Text:= DMCNT.cdsCCosto.FieldByName('CUENTAID').AsString;
end;

procedure TFCCosto.dblcdCuenta04Enter(Sender: TObject);
var
   xSQL : String;
begin
   DMCNT.cdsCuenta5.Close;
   xSQL:='Select CUENTAID, CTADES '
        +'From TGE202 Where CIAID=''02'' '
        + 'and ( CUENTAID LIKE ''166%'' or CUENTAID LIKE ''46602%'' ) AND CTAACT=''S''';
   DMCNT.cdsCuenta5.DataRequest(xSQL);
   DMCNT.cdsCuenta5.Open;
   DMCNT.cdsCuenta5.IndexFieldNames := 'CUENTAID';
   dblcdCuenta04.Text:= DMCNT.cdsCCosto.FieldByName('BAZCTA').AsString;
   //dblcdCuenta02.Text:= DMCNT.cdsCCosto.FieldByName('CUENTAID').AsString;
end;

procedure TFCCosto.dblcdCuenta02Exit(Sender: TObject);
begin
   if dblcdCuenta02.Text='' then
      exit;

   DMCNT.cdsCuenta.SetKey;
   DMCNT.cdsCuenta.FieldByName('CUENTAID').Asstring:=dblcdCuenta02.Text;
   if not DMCNT.cdsCuenta.GotoKey then
   begin
      ShowMessage('Error : Cuenta Contable No Existe...');
      dblcdCuenta02.Text:='';
      dblcdCuenta02.SetFocus;
      Exit;
   end;
end;

procedure TFCCosto.dblcdCuenta04Exit(Sender: TObject);
begin
   if dblcdCuenta04.Text='' then
      exit;

   DMCNT.cdsCuenta5.SetKey;
   DMCNT.cdsCuenta5.FieldByName('CUENTAID').Asstring:=dblcdCuenta04.Text;
   if not DMCNT.cdsCuenta5.GotoKey then
   begin
      ShowMessage('Error : Cuenta Contable No Existe...');
      dblcdCuenta04.Text:='';
      dblcdCuenta04.SetFocus;
      Exit;
   end;
end;

end.
