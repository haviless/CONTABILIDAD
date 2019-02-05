object FMayorAuxiliarAnalisis: TFMayorAuxiliarAnalisis
  Left = 223
  Top = 98
  Width = 795
  Height = 600
  Caption = 'Analisis x Auxiliar y Centro de Costo'
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object pnlAuxiliares: TPanel
    Left = 0
    Top = 177
    Width = 787
    Height = 396
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 785
      Height = 40
      Align = alTop
      Color = 14869218
      TabOrder = 0
      object lblParametro: TLabel
        Left = 8
        Top = 12
        Width = 64
        Height = 15
        Caption = 'lblParametro'
      end
      object edtParametro: TEdit
        Left = 96
        Top = 8
        Width = 70
        Height = 23
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtParametro2: TEdit
        Left = 169
        Top = 8
        Width = 260
        Height = 23
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object dbgAnalisis: TwwDBGrid
      Left = 1
      Top = 41
      Width = 785
      Height = 354
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Color = clWhite
      DataSource = DMCNT.dsMayorAuxA
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      OnDblClick = dbgAnalisisDblClick
      FooterColor = 7566265
    end
  end
  object pnlArriba: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 177
    Align = alTop
    Color = 14869218
    TabOrder = 1
    object lblCia: TLabel
      Left = 18
      Top = 10
      Width = 49
      Height = 13
      Caption = 'Compa'#241#237'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 512
      Top = 11
      Width = 82
      Height = 15
      Caption = 'Cuenta Contable'
    end
    object gbFech: TGroupBox
      Left = 120
      Top = 56
      Width = 201
      Height = 52
      Caption = 'Fechas'
      TabOrder = 6
      object dtpFReg1: TwwDBDateTimePicker
        Left = 6
        Top = 18
        Width = 92
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
        OnExit = dtpFReg1Exit
      end
      object dtpFReg2: TwwDBDateTimePicker
        Left = 102
        Top = 18
        Width = 92
        Height = 23
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 1
        UnboundDataType = wwDTEdtDate
        OnExit = dtpFReg1Exit
      end
    end
    object gbAsientosAutomaticos: TGroupBox
      Left = 500
      Top = 56
      Width = 277
      Height = 52
      Caption = 'Incluir Asientos Automaticos'
      TabOrder = 8
      Visible = False
      object ckbDifCambio: TCheckBox
        Left = 8
        Top = 19
        Width = 129
        Height = 17
        Caption = 'Diferencia de Cambio'
        TabOrder = 0
      end
      object ckbEEFF: TCheckBox
        Left = 160
        Top = 19
        Width = 101
        Height = 17
        Caption = 'Ajuste de EE.FF.'
        TabOrder = 1
      end
    end
    object rgEstadoDoc: TRadioGroup
      Left = 327
      Top = 56
      Width = 170
      Height = 52
      Caption = 'Estado de Documentos'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Pendientes'
        'Cancelados')
      TabOrder = 7
    end
    object gbPer: TGroupBox
      Left = 11
      Top = 56
      Width = 105
      Height = 52
      Caption = 'Periodo'
      TabOrder = 5
      OnExit = gbPerExit
      object speAno: TwwDBSpinEdit
        Left = 8
        Top = 18
        Width = 48
        Height = 23
        Increment = 1.000000000000000000
        MaxValue = 2100.000000000000000000
        MinValue = 1990.000000000000000000
        Value = 1999.000000000000000000
        MaxLength = 4
        TabOrder = 0
        UnboundDataType = wwDefault
        OnEnter = speAnoEnter
        OnExit = speAnoExit
        OnKeyPress = speAnoKeyPress
      end
      object speMM: TwwDBSpinEdit
        Left = 59
        Top = 18
        Width = 37
        Height = 23
        Increment = 1.000000000000000000
        MaxValue = 13.000000000000000000
        Value = 12.000000000000000000
        MaxLength = 2
        TabOrder = 1
        UnboundDataType = wwDefault
        OnEnter = speMMEnter
        OnExit = speMMExit
        OnKeyPress = speMMKeyPress
      end
    end
    object dblcCia: TwwDBLookupCombo
      Left = 12
      Top = 28
      Width = 42
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
      LookupTable = DMCNT.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      Enabled = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object edtCia: TEdit
      Left = 55
      Top = 28
      Width = 171
      Height = 23
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object rgTipoAnalisis: TRadioGroup
      Left = 240
      Top = 16
      Width = 257
      Height = 36
      Caption = 'Tipo de Analisis'
      Columns = 2
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        'Por &Auxiliar'
        'Por &Centro de Costo')
      TabOrder = 2
      OnExit = rgTipoAnalisisExit
    end
    object bbtnOk: TBitBtn
      Left = 536
      Top = 133
      Width = 35
      Height = 25
      TabOrder = 10
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
      Left = 577
      Top = 133
      Width = 35
      Height = 25
      TabOrder = 11
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
      Left = 621
      Top = 133
      Width = 35
      Height = 25
      Hint = 'Imprimir'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
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
    object bbtnCambio: TBitBtn
      Left = 208
      Top = 120
      Width = 76
      Height = 25
      Caption = 'Cancelados'
      TabOrder = 13
      Visible = False
      OnClick = bbtnCambioClick
    end
    object dblcdCuentas: TwwDBLookupComboDlg
      Left = 510
      Top = 28
      Width = 97
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CUENTAID'#9'15'#9'Id'#9'F'
        'CTANIV'#9'2'#9'CTANIV'#9'F'
        'CTADES'#9'40'#9'Cuenta Contable'#9'F')
      LookupTable = DMCNT.cdsCuenta2
      LookupField = 'CUENTAID'
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnEnter = dblcdCuentasEnter
      OnExit = dblcdCuentasExit
    end
    object edtCuenta: TEdit
      Left = 611
      Top = 27
      Width = 163
      Height = 23
      Enabled = False
      TabOrder = 4
      Text = 'edtCuenta'
    end
    object gbTipoMoneda: TGroupBox
      Left = 10
      Top = 116
      Width = 175
      Height = 49
      Caption = 'Moneda'
      TabOrder = 9
      object dblcTMon: TwwDBLookupCombo
        Left = 11
        Top = 16
        Width = 46
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TMONID'#9'3'#9'TMONID'#9'F'
          'TMONABR'#9'8'#9'TMONABR'#9'F'
          'TMONDES'#9'30'#9'TMONDES'#9'F')
        LookupTable = DMCNT.cdsTMon
        LookupField = 'TMONID'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcTMonExit
      end
      object edtMon: TEdit
        Left = 59
        Top = 16
        Width = 104
        Height = 23
        Enabled = False
        TabOrder = 1
      end
    end
  end
  object pmCancelar: TPopupMenu
    Left = 200
    Top = 298
    object Cancelar1: TMenuItem
      Caption = 'Cancelar'
      OnClick = bbtnCambioClick
    end
    object Pendiente1: TMenuItem
      Caption = 'Pendiente'
      OnClick = bbtnCambioClick
    end
  end
  object cgdPrincipal: TControlGridDisp
    FontGrid.Charset = DEFAULT_CHARSET
    FontGrid.Color = clWindowText
    FontGrid.Height = -11
    FontGrid.Name = 'MS Sans Serif'
    FontGrid.Style = []
    FontTitle.Charset = DEFAULT_CHARSET
    FontTitle.Color = clWindowText
    FontTitle.Height = -11
    FontTitle.Name = 'MS Sans Serif'
    FontTitle.Style = []
    Height = 0
    Width = 0
    Left = 629
    Top = 306
  end
end
