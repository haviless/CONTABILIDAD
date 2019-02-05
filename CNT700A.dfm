object fSeguros: TfSeguros
  Left = 388
  Top = 292
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Seguros - Automatizaci'#243'n de Devengues'
  ClientHeight = 322
  ClientWidth = 785
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 9
    Width = 49
    Height = 13
    Caption = 'Compa'#241#237'a'
  end
  object BitSalir: TBitBtn
    Left = 666
    Top = 276
    Width = 106
    Height = 31
    Cursor = crHandPoint
    Hint = 'Salir'
    Caption = 'Cerrar'
    TabOrder = 0
    OnClick = btnCancelaClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object BitChat: TBitBtn
    Left = 316
    Top = 589
    Width = 65
    Height = 29
    Caption = 'Chat'
    TabOrder = 1
    Visible = False
  end
  object dbgSeguroCab: TwwDBGrid
    Left = 8
    Top = 40
    Width = 769
    Height = 225
    DisableThemesInTitle = False
    Selected.Strings = (
      'DESPRE'#9'36'#9'Descripci'#243'n del Premio'
      'CANTIDAD'#9'9'#9'Cantidad'
      'ORDREP'#9'9'#9'Orden en~Reporte')
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    TabOrder = 2
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnDblClick = dbgSeguroCabDblClick
    OnKeyDown = dbgSeguroCabKeyDown
    object dtgNuevoSeguro: TwwIButton
      Left = 0
      Top = 0
      Width = 23
      Height = 30
      AllowAllUp = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      OnClick = dtgNuevoSeguroClick
    end
  end
  object dblcCia: TwwDBLookupCombo
    Left = 65
    Top = 6
    Width = 49
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'Cia'#9'F'
      'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
    LookupField = 'CIAID'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 3
    AutoDropDown = False
    ShowButton = True
    SearchDelay = 2
    PreciseEditRegion = False
    AllowClearKey = True
    ShowMatchText = True
    OnExit = dblcCiaExit
    OnNotInList = dblcCiaNotInList
  end
  object dbeCia: TwwDBEdit
    Left = 114
    Top = 6
    Width = 263
    Height = 21
    Enabled = False
    TabOrder = 4
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object bbtnBuscar: TBitBtn
    Left = 664
    Top = 6
    Width = 107
    Height = 27
    Caption = 'Buscar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = bbtnBuscarClick
  end
end
