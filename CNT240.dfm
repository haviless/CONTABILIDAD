object FHomogNumDocProv: TFHomogNumDocProv
  Left = 275
  Top = 178
  Width = 696
  Height = 481
  Caption = 'Homogeniza N'#250'mero de Series y Documentos por Auxiliar Contable'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDatosAuxiliar: TPanel
    Left = 13
    Top = 7
    Width = 660
    Height = 165
    Color = 14869218
    TabOrder = 0
    object lblCia: TLabel
      Left = 17
      Top = 12
      Width = 49
      Height = 13
      Caption = 'Compa'#241#237'a'
    end
    object lblAuxiliar: TLabel
      Left = 71
      Top = 58
      Width = 33
      Height = 13
      Caption = 'Auxiliar'
    end
    object lblClAux: TLabel
      Left = 17
      Top = 58
      Width = 30
      Height = 13
      Caption = 'Cl.Aux'
    end
    object lblRazonSoc: TLabel
      Left = 158
      Top = 58
      Width = 111
      Height = 13
      Caption = 'Nombre / Raz'#243'n Social'
    end
    object lblCuentaContable: TLabel
      Left = 17
      Top = 105
      Width = 79
      Height = 13
      Caption = 'Cuenta Contable'
    end
    object dblcCia: TwwDBLookupCombo
      Left = 17
      Top = 26
      Width = 47
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DOCID'#9'3'#9'Id'#9'F'
        'DOCDES'#9'30'#9'Documento'#9'F')
      DataField = 'DOCID'
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCiaExit
      OnNotInList = dblcCiaNotInList
    end
    object edtCia: TEdit
      Left = 68
      Top = 26
      Width = 145
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object dblcClAux: TwwDBLookupCombo
      Left = 17
      Top = 74
      Width = 49
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CLAUXID'#9'3'#9'Id.'#9'F'
        'CLAUXDES'#9'20'#9'Auxiliar'#9'F')
      DataField = 'CLAUXID'
      LookupField = 'CLAUXID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      MaxLength = 2
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcClAuxExit
      OnNotInList = dblcCiaNotInList
    end
    object edtAuxiliar: TEdit
      Left = 156
      Top = 74
      Width = 288
      Height = 23
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object bbtnBuscaAsientos: TBitBtn
      Left = 512
      Top = 128
      Width = 114
      Height = 25
      Hint = 'Busca Asientos con Movimientos del Auxiliar'
      Caption = 'Busca Asientos'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = bbtnBuscaAsientosClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
    end
    object dblcdCuenta: TwwDBLookupComboDlg
      Left = 17
      Top = 121
      Width = 95
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Plan de Cuentas'
      MaxWidth = 0
      MaxHeight = 209
      SearchDelay = 2
      Selected.Strings = (
        'CUENTAID'#9'20'#9'Cuenta'#9'F'
        'CTADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CTAABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'CUENTAID'
      LookupField = 'CUENTAID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
      OnExit = dblcdCuentaExit
    end
    object edtCuenta: TEdit
      Left = 114
      Top = 121
      Width = 255
      Height = 23
      Color = clSilver
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object dblcdAuxiliar: TwwDBLookupComboDlg
      Left = 70
      Top = 74
      Width = 83
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Auxiliar'
      MaxWidth = 0
      MaxHeight = 209
      LookupField = 'AUXID'
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      OnExit = dblcdAuxiliarExit
    end
  end
  object pnlAsientos: TPanel
    Left = 13
    Top = 183
    Width = 660
    Height = 253
    Color = 14869218
    TabOrder = 1
    object lblSerie: TLabel
      Left = 482
      Top = 25
      Width = 24
      Height = 13
      Caption = 'Serie'
    end
    object lblNroDoc: TLabel
      Left = 482
      Top = 85
      Width = 110
      Height = 13
      Caption = 'N'#250'mero de Documento'
    end
    object dbgAsientos: TwwDBGrid
      Left = 16
      Top = 24
      Width = 385
      Height = 209
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      KeyOptions = []
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
    object edtSerie: TEdit
      Left = 482
      Top = 40
      Width = 79
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtNroDoc: TEdit
      Left = 482
      Top = 100
      Width = 121
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object bbtnHomogenizar: TBitBtn
      Left = 409
      Top = 144
      Width = 128
      Height = 25
      Hint = 'Homogeniza Asientos'
      Caption = 'Homogenizar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnHomogenizarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbtnIniciaDatos: TBitBtn
      Left = 416
      Top = 64
      Width = 41
      Height = 33
      Caption = '>>'
      TabOrder = 4
      OnClick = bbtnIniciaDatosClick
    end
    object bbtnSalir: TBitBtn
      Left = 568
      Top = 216
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 5
      OnClick = bbtnSalirClick
    end
  end
end
