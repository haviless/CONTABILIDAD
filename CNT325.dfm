object FCompara46vs16: TFCompara46vs16
  Left = 268
  Top = 104
  Width = 784
  Height = 577
  Caption = 'Cuentas por Cobrar versus Cuentas por Pagar Diversas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgData: TwwDBGrid
    Left = 0
    Top = 41
    Width = 776
    Height = 453
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object pnlTool46vs16: TPanel
    Left = 0
    Top = 0
    Width = 776
    Height = 41
    Align = alTop
    TabOrder = 1
  end
  object pnlReportes: TPanel
    Left = 0
    Top = 494
    Width = 776
    Height = 49
    Align = alBottom
    TabOrder = 2
  end
end
