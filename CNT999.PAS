unit CNT999;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppViewr, StdCtrls, Mask, ExtCtrls, Buttons, ppReport, TXComp, ppComm,
  ppRelatv, ppProd, ppClass, ppBands, ppPrnabl, ppCtrls, ppDB, ppCache,
  ppTxPipe, StrContainer;

type
  TFSOLPrevio = class(TForm)
    pnlPreviewBar: TPanel;
    spbPreviewPrint: TSpeedButton;
    spbPreviewWhole: TSpeedButton;
    spbPreviewFirst: TSpeedButton;
    spbPreviewPrior: TSpeedButton;
    spbPreviewNext: TSpeedButton;
    spbPreviewLast: TSpeedButton;
    spbPreviewWidth: TSpeedButton;
    spbPreview100Percent: TSpeedButton;
    Bevel1: TBevel;
    mskPreviewPercentage: TMaskEdit;
    mskPreviewPage: TMaskEdit;
    pnlCancelButton: TPanel;
    spbPreviewCancel: TSpeedButton;
    ppViewer1: TppViewer;
    sbPrintTexto: TSpeedButton;
    ExtraOptions1: TExtraOptions;
    ppTextPipeline2: TppTextPipeline;
    ppField38: TppField;
    ppr4: TppReport;
    ppDetailBand4: TppDetailBand;
    ppDBText12: TppDBText;
    pnlStatusBar: TPanel;
    scFile: TStrContainer;
    scFileN: TStrContainer;
    ppr5: TppReport;
    ppDBText1: TppDBText;
    procedure spbPreviewPrintClick(Sender: TObject);
    procedure spbPreviewWholeClick(Sender: TObject);
    procedure spbPreviewWidthClick(Sender: TObject);
    procedure spbPreview100PercentClick(Sender: TObject);
    procedure spbPreviewCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbPrintTextoClick(Sender: TObject);
    procedure spbPreviewFirstClick(Sender: TObject);
    procedure spbPreviewPriorClick(Sender: TObject);
    procedure mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
    procedure spbPreviewNextClick(Sender: TObject);
    procedure spbPreviewLastClick(Sender: TObject);
    procedure mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
    procedure ppViewer1PageChange(Sender: TObject);
    procedure ppViewer1PrintStateChange(Sender: TObject);
    procedure ppViewer1StatusChange(Sender: TObject);
  private
    { Private declarations }
    procedure EliminaLineas;
  public
    { Public declarations }
    pprPrevio  : TppReport;
    xTextName  : String;
    CarroAncho : Boolean;
    TipoLetra  : String;
  end;

var
  FSOLPrevio: TFSOLPrevio;

implementation

uses CNTDM, CNT319;

{$R *.DFM}

procedure TFSOLPrevio.spbPreviewPrintClick(Sender: TObject);
begin
  ppViewer1.Print;
end;

procedure TFSOLPrevio.spbPreviewWholeClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zsWholePage;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);

  pnlPreviewBar.SetFocus;
end;

procedure TFSOLPrevio.spbPreviewWidthClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zsPageWidth;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);

  pnlPreviewBar.SetFocus;
end;

procedure TFSOLPrevio.spbPreview100PercentClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zs100Percent;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);

  pnlPreviewBar.SetFocus;
end;

procedure TFSOLPrevio.spbPreviewCancelClick(Sender: TObject);
begin
  if ppViewer1.Report.Printing then
    ppViewer1.Cancel;
end;

procedure TFSOLPrevio.FormActivate(Sender: TObject);
begin
   ppViewer1.DisplayAutoSearchDialog;
//   ppViewer1.Show;
end;

procedure TFSOLPrevio.sbPrintTextoClick(Sender: TObject);
var
   xFileRtm : String;
begin

   pprPrevio.AllowPrintToFile := true;
   pprPrevio.TextFileName     := xTextName+'.txt';
   pprPrevio.DeviceType       := 'ReportTextFile';
   pprPrevio.ShowPrintDialog  := True;
   pprPrevio.ArchiveFileName  := xTextName+'.txt';
   pprPrevio.Print;

   

   EliminaLineas;

   ppTextPipeline2.FileName   :=xTextName+'N.txt';
   if CarroAncho then begin
      ppdbtext1.Font.Name     :=TipoLetra;
      ppr5.ShowPrintDialog    :=False;
      ppr5.ModalPreview       :=False;
      ppr5.Print;
      ppr5.Stop;
   end
   else begin
      ppdbtext12.Font.Name     :=TipoLetra;
      ppr4.ShowPrintDialog    :=False;
      ppr4.ModalPreview       :=False;
      ppr4.Print;
      ppr4.Stop;
   end
end;

procedure TFSOLPrevio.EliminaLineas;
var
   xCont, i : Integer;
begin
   scFile.Lines.LoadFromFile( xTextName+'.txt' );

   xCont:=0;

   scFileN.Lines.Clear;

   for i:=0 to scFile.Lines.Count-1 do begin
       xCont:=xCont+1;
       if xCont<75 then
          scFileN.Lines.Add(  scFile.Lines[ i ] )
       else begin
          xCont:=0;
       end
   end;

   scFileN.Lines.SaveToFile( xTextName+'N.txt' );
end;

procedure TFSOLPrevio.spbPreviewFirstClick(Sender: TObject);
begin
  ppViewer1.FirstPage;
end;

procedure TFSOLPrevio.spbPreviewPriorClick(Sender: TObject);
begin
  ppViewer1.PriorPage;
end;

procedure TFSOLPrevio.mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
var
  liPage: Longint;
begin

  if (Key = #13) then
    begin
      liPage := StrToInt(mskPreviewPage.Text);

      ppViewer1.GotoPage(liPage);
    end; {if, carriage return pressed}

end;

procedure TFSOLPrevio.spbPreviewNextClick(Sender: TObject);
begin
  ppViewer1.NextPage;
end;

procedure TFSOLPrevio.spbPreviewLastClick(Sender: TObject);
begin
  ppViewer1.LastPage;
end;

procedure TFSOLPrevio.mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
var
  liPercentage: Integer;
begin
  if (Key = #13) then
    begin
      liPercentage := StrToIntDef(mskPreviewPercentage.Text, 100);

      ppViewer1.ZoomPercentage := liPercentage;

      spbPreviewWhole.Down := False;
      spbPreviewWidth.Down := False;
      spbPreview100Percent.Down := False;

      mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
    end; {if, carriage return pressed}

end;

procedure TFSOLPrevio.ppViewer1PageChange(Sender: TObject);
begin
  mskPreviewPage.Text := IntToStr(ppViewer1.AbsolutePageNo);
  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end;

procedure TFSOLPrevio.ppViewer1PrintStateChange(Sender: TObject);
var
  lPosition: TPoint;
begin

  if ppViewer1.Busy then
    begin
      mskPreviewPercentage.Enabled := False;
      mskPreviewPage.Enabled := False;

      pnlPreviewBar.Cursor := crHourGlass;

      ppViewer1.Cursor := crHourGlass;

      pnlStatusBar.Cursor := crHourGlass;

      spbPreviewCancel.Cursor := crArrow;

      spbPreviewCancel.Enabled := True;
    end
  else
    begin
      mskPreviewPercentage.Enabled := True;
      mskPreviewPage.Enabled := True;

      pnlPreviewBar.Cursor := crDefault;

      ppViewer1.Cursor := crDefault;

      pnlStatusBar.Cursor := crDefault;

      spbPreviewCancel.Cursor := crDefault;

      spbPreviewCancel.Enabled := False;
    end;

  {this code will force the cursor to update}
  GetCursorPos(lPosition);
  SetCursorPos(lPosition.X, lPosition.Y);

end;

procedure TFSOLPrevio.ppViewer1StatusChange(Sender: TObject);
begin

  pnlStatusBar.Caption := ppViewer1.Status;

end;

end.
