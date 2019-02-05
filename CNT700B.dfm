object fNueSeguroPrincipal: TfNueSeguroPrincipal
  Left = 565
  Top = 186
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Mantenimiento de Seguros'
  ClientHeight = 466
  ClientWidth = 489
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 8
    Top = 5
    Width = 473
    Height = 449
    Caption = 'pnlPrincipal'
    Color = clMoneyGreen
    TabOrder = 0
    object Label9: TLabel
      Left = 10
      Top = 25
      Width = 58
      Height = 13
      Caption = 'Compa'#241#237'a : '
    end
    object Label11: TLabel
      Left = 10
      Top = 55
      Width = 55
      Height = 13
      Caption = 'Concepto : '
    end
    object Label16: TLabel
      Left = 10
      Top = 85
      Width = 89
      Height = 13
      Caption = 'Cuenta de Gasto : '
    end
    object btnCancela: TfcShapeBtn
      Left = 356
      Top = 416
      Width = 105
      Height = 26
      Hint = 'Salir'
      Caption = 'Salir'
      Color = clBtnFace
      DitherColor = clWhite
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
      Options = [boFocusable]
      ParentClipping = True
      ParentShowHint = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      ShowHint = True
      TabOrder = 0
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = btnCancelaClick
    end
    object dblcCia: TwwDBLookupCombo
      Left = 71
      Top = 20
      Width = 49
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
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
      Left = 120
      Top = 20
      Width = 337
      Height = 21
      Enabled = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcConcepto: TwwDBLookupComboDlg
      Left = 71
      Top = 50
      Width = 90
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Concepto'
      MaxWidth = 0
      MaxHeight = 209
      SearchDelay = 2
      Selected.Strings = (
        'CPTOID'#9'15'#9'Concepto'#9'F'
        'CPTODES'#9'40'#9'Descripci'#243'n'#9'F'
        'CUENTAID'#9'20'#9'Cuenta'#9'F')
      DataField = 'CPTOID'
      LookupField = 'CPTOID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      MaxLength = 15
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = dblcConceptoEnter
      OnExit = dblcConceptoExit
    end
    object dbeConcepto: TwwDBEdit
      Left = 162
      Top = 50
      Width = 295
      Height = 21
      Enabled = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcCtaGasto: TwwDBLookupComboDlg
      Left = 103
      Top = 80
      Width = 90
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Cuenta Gasto'
      MaxWidth = 0
      MaxHeight = 209
      SearchDelay = 2
      Selected.Strings = (
        'CPTOID'#9'15'#9'Concepto'#9'F'
        'CPTODES'#9'40'#9'Descripci'#243'n'#9'F'
        'CUENTAID'#9'20'#9'Cuenta'#9'F')
      DataField = 'CPTOID'
      LookupField = 'CPTOID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      MaxLength = 15
      ParentFont = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnEnter = dblcCtaGastoEnter
      OnExit = dblcCtaGastoExit
    end
    object dbeCtaGasto: TwwDBEdit
      Left = 194
      Top = 80
      Width = 263
      Height = 21
      Enabled = False
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbgSeguroDet: TwwDBGrid
      Left = 6
      Top = 179
      Width = 459
      Height = 233
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 7
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgSeguroDetDblClick
      OnKeyDown = dbgSeguroDetKeyDown
      FooterHeight = -1
      object dbgSeguroDetIButton: TwwIButton
        Left = 0
        Top = 0
        Width = 25
        Height = 25
        AllowAllUp = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333FF33333333FF333993333333300033377F3333333777333993333333
          300033F77FFF3333377739999993333333333777777F3333333F399999933333
          33003777777333333377333993333333330033377F3333333377333993333333
          3333333773333333333F333333333333330033333333F33333773333333C3333
          330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
          333333333337733333FF3333333C333330003333333733333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = dbgSeguroDetIButtonClick
      end
    end
    object btnAceptar: TBitBtn
      Left = 424
      Top = 132
      Width = 30
      Height = 25
      TabOrder = 8
      OnClick = btnAceptarClick
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
    object rgMoneda: TRadioGroup
      Left = 11
      Top = 105
      Width = 382
      Height = 46
      BiDiMode = bdLeftToRight
      Caption = ' Moneda '
      Columns = 2
      Ctl3D = True
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        'Soles'
        'D'#243'lares')
      ParentBiDiMode = False
      ParentCtl3D = False
      TabOrder = 9
    end
  end
  object pnlSeguroDet: TPanel
    Left = 29
    Top = 216
    Width = 401
    Height = 105
    BevelInner = bvLowered
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 14869218
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
    object Label3: TLabel
      Left = 19
      Top = 30
      Width = 92
      Height = 13
      Caption = 'Centro de Costo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTitulo1: TLabel
      Left = 3
      Top = 3
      Width = 391
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = 'Adicionar Centro de Costo'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 79
      Top = 50
      Width = 30
      Height = 13
      Caption = 'Valor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bbtnOk1: TBitBtn
      Left = 312
      Top = 69
      Width = 30
      Height = 25
      TabOrder = 2
      OnClick = bbtnOk1Click
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
    object bbtnCanc1: TBitBtn
      Left = 346
      Top = 69
      Width = 30
      Height = 25
      TabOrder = 3
      OnClick = bbtnCanc1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
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
    object dblcdCCosto: TwwDBLookupComboDlg
      Left = 119
      Top = 22
      Width = 90
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Centro de Costo'
      MaxWidth = 0
      MaxHeight = 209
      SearchDelay = 2
      Selected.Strings = (
        'CCOSID'#9'15'#9'Id'#9'F'
        'CCOSDES'#9'30'#9'Centro de Costo'#9'F')
      DataField = 'CCOSID'
      LookupField = 'CCOSID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      MaxLength = 12
      ParentFont = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
      OnExit = dblcdCCostoExit
    end
    object edtCCosto: TEdit
      Left = 214
      Top = 22
      Width = 137
      Height = 23
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtValor: TEdit
      Left = 119
      Top = 48
      Width = 90
      Height = 24
      TabOrder = 1
      OnKeyPress = edtValorKeyPress
    end
    object btnSalir: TBitBtn
      Left = 378
      Top = 3
      Width = 15
      Height = 17
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnSalirClick
    end
  end
end
