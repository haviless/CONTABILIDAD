object FConcilBancManual: TFConcilBancManual
  Left = 193
  Top = 161
  Width = 639
  Height = 466
  Caption = 'Conciliaci'#243'n Bancaria Manual'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTotal: TLabel
    Left = 88
    Top = 407
    Width = 73
    Height = 16
    Caption = '999999999'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbgManualCabecera: TwwDBGrid
    Left = 6
    Top = 15
    Width = 611
    Height = 77
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Arial Narrow'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = True
  end
  object bbtnDesmarca: TBitBtn
    Left = 16
    Top = 400
    Width = 60
    Height = 25
    Caption = 'Desmarca'
    TabOrder = 1
    OnClick = bbtnDesmarcaClick
  end
  object bbtnAcepta: TBitBtn
    Left = 525
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Acepta'
    TabOrder = 2
    OnClick = bbtnAceptaClick
  end
  object dbgManual: TwwDBGrid
    Left = 6
    Top = 99
    Width = 611
    Height = 270
    HelpType = htKeyword
    DisableThemesInTitle = False
    ControlInfoInDataset = False
    MemoAttributes = [mSizeable, mWordWrap, mGridShow, mViewOnly]
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyOptions = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
    ParentFont = False
    TabOrder = 3
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = True
    UseTFields = False
    OnCalcCellColors = dbgManualCalcCellColors
    OnTitleButtonClick = dbgManualTitleButtonClick
    OnDblClick = dbgManualDblClick
  end
  object pnlBusca: TPanel
    Left = 232
    Top = 375
    Width = 148
    Height = 53
    TabOrder = 4
    Visible = False
    object grbBusqueda: TGroupBox
      Left = 6
      Top = 1
      Width = 137
      Height = 47
      Caption = 'Busqueda'
      TabOrder = 0
      object edtBusca: TwwIncrementalSearch
        Left = 9
        Top = 20
        Width = 121
        Height = 19
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        AutoSelect = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 16776176
        TabOrder = 0
        OnExit = edtBuscaExit
        OnKeyPress = edtBuscaKeyPress
      end
    end
  end
end
