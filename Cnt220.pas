unit Cnt220;
// Actualizaciones
// HPC_201501_CNT          12/02/2015  Regulariza Métodos Correctos de Control Transaccional

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, wwdblook,db, Wwdbdlg,
  CheckLst;

type
  TFNivel = class(TForm)
    lblNivel: TLabel;
    dblcNivel: TwwDBLookupCombo;
    dbeIdCCosto: TwwDBEdit;
    lblIdCCosto: TLabel;
    lblDesCCosto: TLabel;
    dbeDesCCosto: TwwDBEdit;
    rgMov: TRadioGroup;
    rgActivo: TRadioGroup;
    Z2bbtnOk: TBitBtn;
    Z2bbtnCanc: TBitBtn;
    dbeDig: TwwDBEdit;
    lblDig: TLabel;
    chlbCia: TCheckListBox;
    Label1: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure Z2bbtnCancClick(Sender: TObject);
    procedure dbeIdCCostoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeIdCCostoExit(Sender: TObject);
    procedure dblcNivelExit(Sender: TObject);
    procedure Z2bbtnOkClick(Sender: TObject);
    procedure dblcNivelNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure chlbCiaClickCheck(Sender: TObject);
  private
    { Private declarations }
    xAsigna,xSigno : String;
    xCias,xNivel1 : String;
    xTrues : Boolean;
    procedure Limpia;
    Function ValNivelAnt : boolean;
    function ValNivelSup: boolean;
    procedure ActNivelAnt;
    Function VAlida : Boolean;
    Function ExisteCCosto : Boolean;
    Procedure AsignaCia;
    procedure CargaCia;
  public
    { Public declarations }
  end;

var
  FNivel: TFNivel;

implementation
uses CNTDM,CNT001;
{$R *.DFM}


procedure TFNivel.Limpia;
var
 xI : Integer;
begin
    dblcNivel.text := '';
    dbeIdCCosto.text := '';
    dbeDesCCosto.text := '';
    rgMov.ItemIndex := -1;
    rgActivo.ItemIndex := 0;
    For xI := 0 to chlbCia.Items.count -1 do
      chlbCia.Checked[xI] := False;
end;

procedure TFNivel.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFNivel.FormActivate(Sender: TObject);
var
 xSql : String;
 xI : Integer;
begin
   xSql := 'SELECT * FROM CNT206';
   dm1.cdsQry2.Close;
   dm1.cdsQry2.DataRequest(xSql);
   dm1.cdsQry2.Open;
   dm1.cdsQry2.IndexFieldNames := 'NIVEL';
   dblcNivel.Selected.clear;
   dblcNivel.Selected.Add('NIVEL'#9'2'#9'Id');
   dblcNivel.Selected.Add('DIGITOS'#9'1'#9'Dig.');
   dblcNivel.LookupTable := dm1.cdsQry2;
   dblcNivel.LookupField := 'NIVEL';

   chlbCia.Clear;
   Dm1.cdsCia.First;
   While not Dm1.cdsCia.Eof do
    begin
     chlbCia.Items.Add(Dm1.cdsCia.FieldByName('CIAID').AsString+'  -- '+
                       Dm1.cdsCia.FieldByName('CIADES').AsString );
     Dm1.cdsCia.next;
    end;

   dblcNivel.Enabled  :=True;
   dbeIdCCosto.Enabled:=True;

   If Dm1.wModo <> 'A' then
   begin
      dblcNivel.Enabled  :=False;
      dbeIdCCosto.Enabled:=False;

     dblcNivel.text   := MantcC.FMant.cds2.FieldByName('NIVTIP').AsString;
     dblcNivel.OnExit(dblcNivel);
     dbeIdCCosto.text := MantcC.FMant.cds2.FieldByName('NIVEL10').AsString;
     dbeDesCCosto.text:= MantcC.FMant.cds2.FieldByName('NIVABR').AsString;
     //AsignaCia;
     //CargaCia;
     IF MantcC.FMant.cds2.FieldByName('NIVMOV').AsString = 'S' then
      rgMov.ItemIndex := 0
     else
      rgMov.ItemIndex := 1;
     {
     IF MantcC.FMant.cds2.FieldByName('CCOSACT').AsString = 'S' then
      rgActivo.ItemIndex := 0
     else
      rgActivo.ItemIndex :=1;
     }
     dbeDesCCosto.SetFocus;
   end;
end;

procedure TFNivel.Z2bbtnCancClick(Sender: TObject);
begin
  Close;
end;

procedure TFNivel.dbeIdCCostoKeyPress(Sender: TObject; var Key: Char);
begin
 If Key In [' ','A'..'Z','a'..'z',
            '°','|',' ','!','"','#','$','%','&','/','(',')','=','?','\','¡','¿','@',
            '¨','´','*','+','~','~','[',']','{','}','^','`','<','>',';',',',':','''',
            '-','_'] Then
    Key :=#0;
end;

procedure TFNivel.dbeIdCCostoExit(Sender: TObject);
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

Function TFNivel.ValNivelAnt : boolean;
var
 xI,xDigitos :  Integer ;
 xWhere,xCuenta :  string ;
begin
   // verifica que los niveles anteriores hayan sido registrados
   Result := True;
   dm1.cdsQry2.First ;
   while (not dm1.cdsQry2.Eof) and (dm1.cdsQry2.FieldByName('NIVEL').AsString < xNivel1) do
    begin
      xDigitos := dm1.cdsQry2.FieldByName('DIGITOS').AsInteger;
      xCuenta:=copy(dbeIdCCosto.Text,1,xDigitos);
      xWhere := 'NIVEL10='+quotedStr(xCuenta);
      if length(DM1.DisplayDescrip('PrvTGE','GRH130','*',xWhere,'NIVEL10'))=0 then
       begin
         showMessage('No hay Nivel'+dm1.cdsQry2.FieldByName('NIVEL').AsString);
         Result := false;
         exit;
       end
      else
       begin
        dbeDesCCosto.text := dm1.cdsqry.Fieldbyname('NIVABR').AsString;
        //AsignaCia;
       end;
      dm1.cdsQry2.Next;
    end;
end;


procedure TFNivel.dblcNivelExit(Sender: TObject);
var
 xwhere : String;
begin
  xWhere := 'NIVEL='+quotedstr(dblcNivel.text);
  dbeDig.TExt := dm1.DisplayDescrip('PrvTGE','CNT206','*',xWhere,'DIGITOS');
  If Length(dbeDig.TExt) > 0 then
   begin
    xSigno := dm1.cdsQry.FieldByName('SIGNO').AsString;
    xNivel1 := dblcNivel.text;
   end
  else
   begin
    xSigno := '';
    xNivel1 := '';
   end
end;

function TFNivel.ValNivelSup: boolean;
var
 xSql : String;
begin
    Result := True;
//    xSql := 'SELECT COUNT(*) TOTAL FROM TGE203 WHERE CCOSID LIKE '+
//             quotedstr(trim(dbeIdCCosto.text)+'%');
    xSql := 'SELECT COUNT(*) TOTAL FROM GRH130 WHERE NIVEL10 LIKE '+
             quotedstr(trim(dbeIdCCosto.text)+'%');
    dm1.cdsQry3.indexfieldnames := '';
    dm1.cdsQry3.close;
    dm1.cdsQry3.DataRequest(xSql);
    dm1.cdsQry3.open;
    If dm1.cdsQry3.FieldByName('TOTAL').AsFloat > 1 then
     Result := False;
end;


procedure TFNivel.Z2bbtnOkClick(Sender: TObject);
var
 xI : Integer;
 xWhere: String;
begin
    //** valida que esten todos los datos
    If not Valida then
     exit;

    //** si es nuevo inserta si no edita
    If Dm1.wModo = 'A' then
     dm1.cdsCCosto.insert
    else
     dm1.cdsCCosto.Edit;

   //** asigna los valores
   dm1.cdsCCosto.FieldByName('NIVEL10').AsString := dbeIdCCosto.Text;
   dm1.cdsCCosto.FieldByName('NIVABR').AsString  := dbeDesCCosto.Text;
   dm1.cdsCCosto.FieldByName('NIVTIP').AsString  := dblcNivel.Text;

   If rgMov.ItemIndex = 0 then
      dm1.cdsCCosto.FieldByName('NIVMOV').AsString := 'S'
   else
      dm1.cdsCCosto.FieldByName('NIVMOV').AsString := 'N';

//   dm1.cdsCCosto.FieldByName('CCOSCIAS').AsString := xCias;

{   If rgActivo.ItemIndex = 0 then
    dm1.cdsCCosto.FieldByName('CCOSACT').AsString := 'S'
   else
    dm1.cdsCCosto.FieldByName('CCOSACT').AsString := 'N';
}
    dm1.AplicaDatos(dm1.cdsCCosto,'');

   //** actualiza los niveles anteriores
   ActNivelAnt;
   Limpia;

   if Dm1.wModo <> 'A' then
      Close;

end;


procedure TFNivel.ActNivelAnt;
var
 xWhere,xSql,xCuenta0,xCuenta1,xNivel2,xNivel0 : String;
 xI,xNive   : Integer;
begin
   xNive:=0;
   xNivel2 := DM1.StrZero(inttoStr((strtoInt(xNivel1))-1),length(xNivel1));
   DM1.cdsQry2.SetKey;
   DM1.cdsQry2.FieldByName('NIVEL').AsString := xNivel2;
   if DM1.cdsQry2.GotoKey then
    begin
     xNive := DM1.cdsQry2.FieldByName('DIGITOS').AsInteger;
    end;

   xCuenta1 := '( NIVTIP='''+xNivel2+''' AND NIVEL10 LIKE '''+copy(dbeIdCCosto.Text,1,xNive)+'%'' ) ';

   DM1.cdsQry2.first;
   If StrToInt(xNivel2) - 1 > 0 then
    begin
     For xI := StrToInt(xNivel2) - 1 downto 0 do
      begin
       xNivel0 := dm1.StrZero(IntToStr(xI),2);
       DM1.cdsQry2.SetKey;
       DM1.cdsQry2.FieldByName('NIVEL').AsString := xNivel0;
       if DM1.cdsQry2.GotoKey then
        begin
         xNive := DM1.cdsQry2.FieldByName('DIGITOS').AsInteger;
         xCuenta0 := copy(dbeIdCCosto.Text,1,xNive);
         xCuenta1 := xCuenta1+ ' OR ( NIVTIP='''+xNivel0+''' AND NIVEL10 LIKE '''+copy(dbeIdCCosto.Text,1,xNive)+'%'' ) ';
        end;
      end;
    end
   else
    xCuenta0 := xCuenta1;

   if xCuenta1<>'' then
   begin
    {
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
    }

//      xSQL:='Update TGE203 set CCOSMOV='+quotedstr('N')   //+',CCOSCIAS='+quotedstr(xCias)
//           +'WHERE ('+xWhere+') and  ('+'CCOSID>='+quotedstr(xCuenta0)+' and CCOSID <='+
//           quotedstr(xCuenta1)+')';

      xSQL:='Update GRH130 set NIVMOV='+quotedstr('N')+' '
           +'WHERE '+xCuenta1;
     {
     WHERE ( NIVTIP='01' AND  NIVEL10 LIKE '30%' )
      OR ( NIVTIP='02' AND  NIVEL10 LIKE '3002%' )
     }

      dm1.DCOM1.AppServer.IniciaTransaccion;
      try
         DM1.DCOM1.AppServer.EjecutaQry(xSql);
         DM1.DCOM1.AppServer.GrabaTransaccion;
      except
      // Inicio HPC_201501_CNT
         //DMCNT.DCOM1.AppServer.RegresaTransaccion;
         DMCNT.DCOM1.AppServer.RetornaTransaccion;
      // Fin HPC_201501_CNT
      end;
   end;
end;


function TFNivel.VAlida: Boolean;
begin
   Result := dblcNivel.text <> '' ;
   Result := dbeDig.text <> '' ;
   Result := dbeIdCCosto.text <> '' ;
   Result := dbeDesCCosto.text <> '' ;
//   Result := rgMov.itemindex <> -1;
//   Result := rgActivo.itemindex <> -1;
end;

procedure TFNivel.dblcNivelNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
	Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

function TFNivel.ExisteCCosto: Boolean;
var
 xSql : string;
begin
   Result := True;
   //xSql := 'SELECT count(*) TOTAL FROM TGE203 WHERE CCOSID='+quotedstr(dbeIdCCosto.text);
   xSql := 'SELECT count(*) TOTAL FROM GRH130 WHERE NIVEL10='+quotedstr(dbeIdCCosto.text);
   dm1.cdsQry3.Close;
   dm1.cdsQry3.DataRequest(xSql);
   dm1.cdsQry3.Open;
   If dm1.cdsQry3.FieldByName('TOTAL').AsFloat > 0 then
    Result := False;
end;

procedure TFNivel.AsignaCia;
var
 xI : Integer;
 xItem : String;
begin
 //** asigna la(s) cia(s)
   xAsigna := 'S';
   For xI := 0 to chlbCia.Items.Count -1 do
    begin
     xItem := copy(chlbCia.Items.Strings[xI],1,2);
     If dm1.wModo = 'A' then
      chlbCia.Checked[xI] := dm1.Buscar(dm1.cdsQry.FieldByName('CCOSCIAS').AsString,xItem) <> '0'
     else
      chlbCia.Checked[xI] := dm1.Buscar(MantcC.FMant.cds2.FieldByName('CCOSCIAS').AsString,xItem) <> '0'
    end;
   xAsigna := '';
end;

procedure TFNivel.chlbCiaClickCheck(Sender: TObject);
var
 xI : Integer;
begin
   If xAsigna = '' then
    begin
     CargaCia;
    end;
end;

procedure TFNivel.CargaCia;
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

end.
