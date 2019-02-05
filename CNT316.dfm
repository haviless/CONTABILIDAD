object FAnalisisCuenta: TFAnalisisCuenta
  Left = 198
  Top = 123
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'An'#225'lisis de Cuenta'
  ClientHeight = 573
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlAuxiliares: TPanel
    Left = 0
    Top = 97
    Width = 792
    Height = 476
    Align = alClient
    TabOrder = 1
    object dbgAnalisis: TwwDBGrid
      Left = 1
      Top = 1
      Width = 790
      Height = 474
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = 11974251
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DMCNT.dsMayorAux
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = True
      OnTitleButtonClick = dbgAnalisisTitleButtonClick
      OnDblClick = dbgAnalisisDblClick
      OnTopRowChanged = dbgAnalisisTopRowChanged
    end
  end
  object pnlArriba: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    Color = 14869218
    TabOrder = 0
    object lblCia: TLabel
      Left = 15
      Top = 17
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 241
      Top = 17
      Width = 23
      Height = 15
      Caption = 'A'#241'o:'
    end
    object Label6: TLabel
      Left = 298
      Top = 17
      Width = 24
      Height = 15
      Caption = 'Mes:'
    end
    object Label7: TLabel
      Left = 241
      Top = 3
      Width = 39
      Height = 15
      Caption = 'Periodo'
    end
    object Label8: TLabel
      Left = 359
      Top = 17
      Width = 28
      Height = 15
      Caption = 'Nivel'
    end
    object Label9: TLabel
      Left = 473
      Top = 17
      Width = 40
      Height = 15
      Caption = 'Moneda'
    end
    object dblcCia: TwwDBLookupCombo
      Left = 15
      Top = 31
      Width = 49
      Height = 23
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
      LookupTable = DMCNT.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      DropDownCount = 15
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 65
      Top = 31
      Width = 147
      Height = 23
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object bbtnOk: TBitBtn
      Left = 656
      Top = 62
      Width = 35
      Height = 25
      TabOrder = 8
      OnClick = bbtnOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
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
    object bbtnCanc: TBitBtn
      Left = 698
      Top = 62
      Width = 35
      Height = 25
      TabOrder = 9
      OnClick = bbtnCancClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object Z2bbtnImprime: TBitBtn
      Left = 739
      Top = 62
      Width = 35
      Height = 25
      Hint = 'Imprimir'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      Visible = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object speAno: TwwDBSpinEdit
      Left = 236
      Top = 31
      Width = 55
      Height = 23
      Increment = 1.000000000000000000
      MaxValue = 2100.000000000000000000
      MinValue = 1990.000000000000000000
      Value = 1999.000000000000000000
      MaxLength = 4
      TabOrder = 2
      UnboundDataType = wwDefault
      OnEnter = speAnoEnter
      OnExit = speAnoExit
      OnKeyPress = speAnoKeyPress
    end
    object speMM: TwwDBSpinEdit
      Left = 296
      Top = 31
      Width = 40
      Height = 23
      Increment = 1.000000000000000000
      MaxValue = 12.000000000000000000
      MinValue = 1.000000000000000000
      Value = 12.000000000000000000
      MaxLength = 2
      TabOrder = 3
      UnboundDataType = wwDefault
      OnEnter = speMMEnter
      OnExit = speMMExit
      OnKeyPress = speAnoKeyPress
    end
    object dblcNivel: TwwDBLookupCombo
      Left = 358
      Top = 31
      Width = 46
      Height = 23
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NIVEL'#9'2'#9'Nivel'#9'F'
        'DIGITOS'#9'10'#9'Digitos'#9'F'
        'SIGNO'#9'2'#9'SIGNO'#9'F')
      LookupTable = DMCNT.cdsNivel
      LookupField = 'NIVEL'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcNivelExit
      OnKeyPress = speAnoKeyPress
    end
    object edtNivel: TEdit
      Left = 407
      Top = 31
      Width = 35
      Height = 23
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 5
    end
    object dblcMoneda: TwwDBLookupCombo
      Left = 472
      Top = 31
      Width = 46
      Height = 23
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TMONID'#9'3'#9'TMONID'#9'F'
        'TMONABR'#9'8'#9'TMONABR'#9'F'
        'TMONDES'#9'30'#9'TMONDES'#9'F')
      LookupTable = DMCNT.cdsTMon
      LookupField = 'TMONID'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcMonedaExit
    end
    object edtMon: TEdit
      Left = 519
      Top = 31
      Width = 122
      Height = 23
      Enabled = False
      TabOrder = 7
    end
  end
  object pnlOrden: TPanel
    Left = 252
    Top = 120
    Width = 257
    Height = 81
    BevelInner = bvRaised
    BevelWidth = 2
    Color = 14869218
    TabOrder = 2
    Visible = False
    object lblBusca: TLabel
      Left = 18
      Top = 15
      Width = 41
      Height = 19
      Caption = 'Buscar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 12
      Top = 35
      Width = 235
      Height = 2
    end
    object isBusca: TwwIncrementalSearch
      Left = 21
      Top = 45
      Width = 220
      Height = 21
      DataSource = DMCNT.dsMayorAux
      SearchField = 'CUENTAID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = isBuscaExit
      OnKeyPress = isBuscaKeyPress
    end
    object btnSalir: TBitBtn
      Left = 235
      Top = 5
      Width = 16
      Height = 19
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Draft 12cpi'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnSalirClick
    end
  end
end
