object FLiqCC: TFLiqCC
  Left = 420
  Top = 386
  Width = 320
  Height = 150
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Centro de Costo'
  Color = clBtnFace
  Constraints.MaxHeight = 150
  Constraints.MaxWidth = 320
  Constraints.MinHeight = 150
  Constraints.MinWidth = 320
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 17
    Top = 23
    Width = 80
    Height = 15
    Caption = 'Centro de Costo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object dblcdCCosto: TwwDBLookupComboDlg
    Left = 10
    Top = 41
    Width = 101
    Height = 21
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    GridColor = clWhite
    GridTitleAlignment = taLeftJustify
    Caption = 'Centros de Costo'
    MaxWidth = 0
    MaxHeight = 209
    Selected.Strings = (
      'CCOSID'#9'15'#9'ID'#9'F'
      'CCOSDES'#9'40'#9'Centro de Costo'#9'F'
      'CCOSABR'#9'15'#9'Abreviatura'#9'F')
    DataField = 'CENCOS'
    DataSource = DMCNT.dsLiqCon
    LookupTable = DMCNT.cdsCCosto
    LookupField = 'CCOSID'
    SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
    Color = clSilver
    TabOrder = 0
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
    OnExit = dblcdCCostoExit
  end
  object dbeCCosto: TDBEdit
    Left = 112
    Top = 41
    Width = 190
    Height = 21
    Color = clSilver
    Enabled = False
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 147
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Grabar'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object bbtnCanc: TBitBtn
    Left = 227
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = bbtnCancClick
  end
end
