object fBusquedaDev: TfBusquedaDev
  Left = 206
  Top = 297
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Automatizaci'#243'n de Devengues - Busqueda'
  ClientHeight = 323
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
    Top = 257
    Width = 49
    Height = 13
    Caption = 'Compa'#241#237'a'
  end
  object Label2: TLabel
    Left = 9
    Top = 289
    Width = 103
    Height = 13
    Caption = 'Documentos Desde : '
  end
  object BitSalir: TBitBtn
    Left = 666
    Top = 277
    Width = 106
    Height = 31
    Cursor = crHandPoint
    Hint = 'Salir'
    Caption = 'Cerrar'
    TabOrder = 4
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
    TabOrder = 5
    Visible = False
  end
  object dbgBusqSeguro: TwwDBGrid
    Left = 8
    Top = 17
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
    TabOrder = 3
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnCalcCellColors = dbgBusqSeguroCalcCellColors
    OnDblClick = dbgBusqSeguroDblClick
  end
  object dblcCia: TwwDBLookupCombo
    Left = 65
    Top = 254
    Width = 49
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'Cia'#9'F'
      'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
    LookupField = 'CIAID'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    SearchDelay = 2
    PreciseEditRegion = False
    AllowClearKey = True
    ShowMatchText = True
    OnNotInList = dblcCiaNotInList
  end
  object bbtnBuscar: TBitBtn
    Left = 528
    Top = 279
    Width = 107
    Height = 28
    Caption = 'Buscar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = bbtnBuscarClick
  end
  object edtBuscar: TwwDBSpinEdit
    Left = 119
    Top = 280
    Width = 73
    Height = 24
    Increment = 1.000000000000000000
    MaxValue = 3000.000000000000000000
    MinValue = 2016.000000000000000000
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    UnboundDataType = wwDefault
  end
  object GroupBox1: TGroupBox
    Left = 248
    Top = 248
    Width = 161
    Height = 73
    Caption = 'Leyenda de Estados'
    TabOrder = 6
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 17
      Height = 13
      AutoSize = False
      Color = clWhite
      ParentColor = False
    end
    object Label4: TLabel
      Left = 8
      Top = 40
      Width = 17
      Height = 13
      AutoSize = False
      Color = clYellow
      ParentColor = False
    end
    object Label5: TLabel
      Left = 8
      Top = 56
      Width = 17
      Height = 13
      AutoSize = False
      Color = clAqua
      ParentColor = False
    end
    object Label6: TLabel
      Left = 32
      Top = 24
      Width = 81
      Height = 13
      Caption = 'SIN DEVENGAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 32
      Top = 40
      Width = 96
      Height = 13
      Caption = 'FALTA DEVENGAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 32
      Top = 56
      Width = 106
      Height = 13
      Caption = 'TOTAL DEVENGADO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
end
