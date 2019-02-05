object FAjusteInflacion1: TFAjusteInflacion1
  Left = 236
  Top = 180
  Width = 756
  Height = 494
  Caption = 'Calculo del REI de un Ejercicio'
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object Label6: TLabel
    Left = 16
    Top = 16
    Width = 32
    Height = 15
    Caption = 'Label1'
  end
  object pgcActPas: TPageControl
    Left = 0
    Top = 163
    Width = 748
    Height = 261
    ActivePage = tabPasivo
    Align = alClient
    TabOrder = 2
    object tabActivo: TTabSheet
      Caption = 'Ac&tivo'
      ImageIndex = 2
      object dbgActivo: TwwDBGrid
        Left = 0
        Top = 0
        Width = 740
        Height = 192
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = 11974251
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        BorderStyle = bsNone
        DataSource = DM1.dsREIActivo
        KeyOptions = []
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
      end
      object pnlATotal: TPanel
        Left = 0
        Top = 192
        Width = 740
        Height = 39
        Align = alBottom
        BevelInner = bvLowered
        BevelOuter = bvNone
        Color = 10207162
        TabOrder = 1
        object Label8: TLabel
          Left = 106
          Top = 13
          Width = 40
          Height = 15
          Caption = 'Totales:'
        end
        object Label7: TLabel
          Left = 452
          Top = 13
          Width = 60
          Height = 15
          Caption = 'Diferencia:'
        end
        object Label14: TLabel
          Left = 308
          Top = 13
          Width = 48
          Height = 15
          Caption = 'Ajustado:'
        end
        object Label15: TLabel
          Left = 178
          Top = 13
          Width = 32
          Height = 15
          Caption = 'Saldo:'
        end
        object edtASaldo: TEdit
          Left = 212
          Top = 9
          Width = 90
          Height = 23
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          TabOrder = 0
          Text = '0'
        end
        object edtAAjustado: TEdit
          Left = 358
          Top = 9
          Width = 90
          Height = 23
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          TabOrder = 1
          Text = '0'
        end
        object edtADiferencia: TEdit
          Left = 516
          Top = 9
          Width = 90
          Height = 23
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          TabOrder = 2
          Text = '0'
        end
      end
    end
    object tabPasivo: TTabSheet
      Caption = 'Pa&sivo'
      ImageIndex = 1
      object pnlPTotal: TPanel
        Left = 0
        Top = 192
        Width = 740
        Height = 39
        Align = alBottom
        BevelInner = bvLowered
        BevelOuter = bvNone
        Color = 10207162
        TabOrder = 0
        object Label10: TLabel
          Left = 196
          Top = 13
          Width = 40
          Height = 15
          Caption = 'Totales:'
        end
        object Label16: TLabel
          Left = 268
          Top = 13
          Width = 32
          Height = 15
          Caption = 'Saldo:'
        end
        object Label17: TLabel
          Left = 380
          Top = 13
          Width = 48
          Height = 15
          Caption = 'Ajustado:'
        end
        object Label18: TLabel
          Left = 492
          Top = 13
          Width = 60
          Height = 15
          Caption = 'Diferencia:'
        end
        object edtPSaldo: TEdit
          Left = 304
          Top = 9
          Width = 65
          Height = 23
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          TabOrder = 0
          Text = '0'
        end
        object edtPAjustado: TEdit
          Left = 424
          Top = 9
          Width = 65
          Height = 23
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          TabOrder = 1
          Text = '0'
        end
        object edtPDiferencia: TEdit
          Left = 544
          Top = 9
          Width = 65
          Height = 23
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          TabOrder = 2
          Text = '0'
        end
      end
      object dbgPasivo: TwwDBGrid
        Left = 0
        Top = 0
        Width = 740
        Height = 192
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = 11974251
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        BorderStyle = bsNone
        DataSource = DM1.dsREIPasivo
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
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 748
    Height = 163
    Align = alTop
    Color = 10207162
    TabOrder = 0
    object Label9: TLabel
      Left = 356
      Top = 118
      Width = 31
      Height = 15
      Caption = 'Glosa:'
    end
    object Label13: TLabel
      Left = 300
      Top = 43
      Width = 81
      Height = 15
      Caption = 'Fecha de Comp.:'
    end
    object Label12: TLabel
      Left = 401
      Top = 43
      Width = 42
      Height = 15
      Caption = 'Periodo:'
    end
    object Label4: TLabel
      Left = 452
      Top = 43
      Width = 81
      Height = 15
      Caption = 'Tipo de Cambio:'
    end
    object Label11: TLabel
      Left = 452
      Top = 3
      Width = 150
      Height = 15
      Caption = 'Cuenta de Result.Acumulados:'
      Visible = False
    end
    object Label5: TLabel
      Left = 300
      Top = 3
      Width = 61
      Height = 15
      Caption = 'Cuenta REI:'
    end
    object lblfactor: TLabel
      Left = 304
      Top = 120
      Width = 33
      Height = 15
      Caption = 'Factor'
    end
    object Label3: TLabel
      Left = 306
      Top = 82
      Width = 53
      Height = 15
      Caption = 'Comp.Gen.'
    end
    object edtAcumulado: TEdit
      Left = 452
      Top = 19
      Width = 41
      Height = 23
      Enabled = False
      TabOrder = 4
      Text = '598'
      Visible = False
    end
    object edtGlosa: TEdit
      Left = 357
      Top = 133
      Width = 241
      Height = 23
      TabOrder = 9
    end
    object bbtnOk: TBitBtn
      Left = 632
      Top = 16
      Width = 73
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 11
      OnClick = bbtnOkClick
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
    object bbtnCanc: TBitBtn
      Left = 632
      Top = 56
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cerrar'
      ModalResult = 2
      TabOrder = 12
      OnClick = bbtnCancClick
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
    object edtAcumuladoDescripcion: TEdit
      Left = 500
      Top = 19
      Width = 96
      Height = 23
      Color = clInactiveCaptionText
      Enabled = False
      TabOrder = 5
      Text = 'Resultados Acumulados'
      Visible = False
    end
    object edtTasa: TEdit
      Left = 556
      Top = 58
      Width = 39
      Height = 23
      Enabled = False
      TabOrder = 8
    end
    object edtPeriodo: TEdit
      Left = 401
      Top = 59
      Width = 49
      Height = 23
      Enabled = False
      TabOrder = 6
      Text = '200006'
    end
    object gbAsiento: TGroupBox
      Left = 8
      Top = 8
      Width = 286
      Height = 143
      Caption = 'Datos del &Asiento'
      Color = 10207162
      ParentColor = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 18
        Width = 49
        Height = 15
        Caption = 'Compa'#241#237'a'
      end
      object Label2: TLabel
        Left = 8
        Top = 57
        Width = 62
        Height = 15
        Caption = 'Tipo Diario:'
      end
      object speanoajuste: TLabel
        Left = 12
        Top = 100
        Width = 20
        Height = 15
        Caption = 'A'#241'o'
      end
      object edtCIA: TEdit
        Left = 47
        Top = 34
        Width = 235
        Height = 23
        Color = clInactiveCaptionText
        Enabled = False
        TabOrder = 1
      end
      object edtTDiario: TEdit
        Left = 47
        Top = 73
        Width = 235
        Height = 23
        Color = clInactiveCaptionText
        Enabled = False
        TabOrder = 4
      end
      object dblcCIA: TwwDBLookupCombo
        Left = 10
        Top = 34
        Width = 38
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'2'#9'Cia'#9'F'
          'CIADES'#9'40'#9'Compa'#241'ia'#9'F')
        DataField = 'CIAID'
        LookupTable = DM1.cdsCia
        LookupField = 'CIAID'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnClick = dblcCIAClick
        OnExit = dblcCIAExit
      end
      object dblcTDiario: TwwDBLookupCombo
        Left = 10
        Top = 73
        Width = 38
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TDIARID'#9'2'#9'Id'#9'F'
          'TDIARDES'#9'40'#9'Tipo de Diario'#9'F')
        DataField = 'TDIARID'
        LookupTable = DM1.cdsTDiario
        LookupField = 'TDIARID'
        Options = [loTitles]
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnClick = dblcTDiarioClick
        OnExit = dblcTDiarioExit
      end
      object speano: TwwDBSpinEdit
        Left = 10
        Top = 114
        Width = 66
        Height = 23
        Increment = 1.000000000000000000
        MaxValue = 2050.000000000000000000
        MinValue = 1900.000000000000000000
        MaxLength = 4
        TabOrder = 3
        UnboundDataType = wwDefault
        OnExit = speanoExit
      end
    end
    object edtCuentaREI: TEdit
      Left = 300
      Top = 19
      Width = 41
      Height = 23
      Color = clInactiveCaptionText
      Enabled = False
      TabOrder = 2
      Text = '898'
    end
    object cbTCambio: TComboBox
      Left = 452
      Top = 58
      Width = 97
      Height = 23
      ItemHeight = 15
      TabOrder = 7
      OnChange = cbTCambioChange
      Items.Strings = (
        'Venta Bancaria'
        'Compra Bancaria'
        'Venta Paralela'
        'Compra Pararela'
        'Venta Oficial'
        'Compra Oficial'
        'OTRO')
    end
    object edtREIDescripcion: TEdit
      Left = 348
      Top = 19
      Width = 248
      Height = 23
      Color = clInactiveCaptionText
      Enabled = False
      TabOrder = 3
      Text = 'REI - Ajuste de Estados Financieros '
    end
    object edtfactor: TEdit
      Left = 304
      Top = 133
      Width = 50
      Height = 23
      Enabled = False
      TabOrder = 13
    end
    object edtComprobante: TEdit
      Left = 304
      Top = 95
      Width = 95
      Height = 23
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 14
    end
    object bbtnAjuste: TBitBtn
      Left = 617
      Top = 120
      Width = 84
      Height = 35
      Caption = 'Ajuste'
      TabOrder = 10
      OnClick = bbtnAjusteClick
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
    object dtpFecha: TwwDBDateTimePicker
      Left = 302
      Top = 59
      Width = 95
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 1
      OnExit = dtpFechaExit
    end
  end
  object pnlBotones: TPanel
    Left = 0
    Top = 424
    Width = 748
    Height = 43
    Align = alBottom
    Color = 10207162
    TabOrder = 1
    object lblAvance: TLabel
      Left = 168
      Top = 15
      Width = 3
      Height = 15
    end
    object lblestado: TLabel
      Left = 168
      Top = 16
      Width = 35
      Height = 16
      Caption = 'Estado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtEstado: TLabel
      Left = 272
      Top = 16
      Width = 130
      Height = 19
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object bbtnContab: TBitBtn
      Left = 639
      Top = 5
      Width = 40
      Height = 35
      Hint = 'Contabilizar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnContabClick
      Glyph.Data = {
        F6020000424DF602000000000000760000002800000021000000200000000100
        0400000000008002000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888880000000888888888888888888888888888888888000
        0000888888888888888888888888888888888000000080000000000000000000
        000000000000800000000000000000000000000000000000000000000000000F
        0F0F0F0F0F0F0F0F0F0F0F0FF0000000000000F0F0F0F0F0F0F0F0F0F0F0F0F0
        0F000000000000FF00000000000000000000000000F00000000000FF00000000
        00000000000000000F000000000000FF00000000BBBBBBBBBBBBB00000F00000
        000000FF0000000000000000000000000F000000000000FF0000000000000000
        0000000000F00000000000FF0000BBBBBBBBBBBBBBBBBBBB0F000000000000FF
        00000000000000000000000000F00000000000FF000000000000000000000000
        0F000000000000FF0BBBB0BBB00B0B0B0BBB0BBB00F00000000000FF0B00B0B0
        B00B0B0B0B0B0B0B0F000000000000FF0B00B0B0B00B0B0B0BBB0B0B00F00000
        000000FF0B0000B0B00B0B0B000B0B0B0F000000000000FF0B0000BBB0BBBB0B
        0BBB0BBB00F00000000000FF0B000000000000BBB0000B000F000000000000FF
        0B00B0000000000B00000B0000F00000000000FF0BBBB0000000000000000000
        0F000000000000FF00000000000000000000000000F00000000000FF00000000
        00000000000000000F000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000
        0000000FFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000
        0000000000000000000080000000000000000000000000000000800000008888
        8888888888888888888888888888800000008888888888888888888888888888
        8888800000008888888888888888888888888888888880000000}
    end
    object bbtnImprime: TBitBtn
      Left = 683
      Top = 5
      Width = 40
      Height = 35
      Hint = 'Imprimir Asiento Definitivo'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = bbtnImprimeClick
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
    object bbtnGraba: TBitBtn
      Left = 595
      Top = 5
      Width = 40
      Height = 35
      Hint = 'Aceptar Comprobante '
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnGrabaClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object bbtnAcepta: TBitBtn
      Left = 507
      Top = 5
      Width = 40
      Height = 35
      Hint = 'Resumen del Ajuste'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnAceptaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
        777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
        79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
        777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
        79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
        CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
      NumGlyphs = 2
    end
    object prbAvance: TProgressBar
      Left = 8
      Top = 13
      Width = 150
      Height = 17
      TabOrder = 0
    end
    object bbtnMensual: TBitBtn
      Left = 551
      Top = 5
      Width = 40
      Height = 35
      Hint = 'Imprimir Asiento Mensual'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = bbtnMensualClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object BitBCarta: TBitBtn
      Left = 419
      Top = 5
      Width = 40
      Height = 35
      Hint = 'Sustento x Cia'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = BitBCartaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 463
      Top = 5
      Width = 40
      Height = 35
      Hint = 'sustento Consolidado'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333333333C3333333333333337F3333333333333C0C3333
        333333333777F33333333333C0F0C3333333333377377F333333333C0FFF0C33
        3333333777F377F3333333CCC0FFF0C333333373377F377F33333CCCCC0FFF0C
        333337333377F377F3334CCCCCC0FFF0C3337F3333377F377F33C4CCCCCC0FFF
        0C3377F333F377F377F33C4CC0CCC0FFF0C3377F3733F77F377333C4CCC0CC0F
        0C333377F337F3777733333C4C00CCC0333333377F773337F3333333C4CCCCCC
        3333333377F333F7333333333C4CCCC333333333377F37733333333333C4C333
        3333333333777333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object pnlSustento: TPanel
    Left = 29
    Top = 180
    Width = 698
    Height = 242
    BevelInner = bvRaised
    Color = 10207162
    TabOrder = 3
    Visible = False
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 694
      Height = 22
      Align = alTop
      Caption = 'Sustento'
      Color = 10158080
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dbgSustento: TwwDBGrid
      Left = 10
      Top = 40
      Width = 674
      Height = 151
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DM1.dsReporte
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = True
      OnTitleButtonClick = dbgSustentoTitleButtonClick
      OnFieldChanged = dbgSustentoFieldChanged
    end
    object bbtnImprimirS: TBitBtn
      Left = 360
      Top = 200
      Width = 40
      Height = 35
      Hint = 'Imprimir Sustento'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnImprimirSClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object bbtnCancelar: TBitBtn
      Left = 407
      Top = 200
      Width = 40
      Height = 35
      Hint = 'Cancelar'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnCancelarClick
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
    object isbusca: TwwIncrementalSearch
      Left = 24
      Top = 208
      Width = 121
      Height = 23
      DataSource = DM1.dsReporte
      TabOrder = 4
      Visible = False
      OnExit = isbuscaExit
    end
  end
  object pprComprob: TppReport
    AutoStop = False
    DataPipeline = ppdbComprob
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rComprob'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\SOLExes\SOLFormatos\Cnt\Dema\AjusteInflacionREI.rtm'
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprComprobPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 145
    Top = 294
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbComprob'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44450
      mmPrintPosition = 0
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = 'Haber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265378
        mmTop = 39952
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label59'
        Caption = 'Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 9790
        mmTop = 33602
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label60'
        AutoSize = False
        Caption = 'Auxiliar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 21696
        mmTop = 33602
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'Label61'
        AutoSize = False
        Caption = 'C'#243'd.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 22754
        mmTop = 37571
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label62'
        AutoSize = False
        Caption = 'Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 35719
        mmTop = 33867
        mmWidth = 49742
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label63'
        Caption = 'Serie'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33602
        mmTop = 37571
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'Label64'
        Caption = 'N'#250'mero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43127
        mmTop = 37571
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'Label65'
        Caption = 'Glosa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 79904
        mmTop = 37571
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label68'
        AutoSize = False
        Caption = 'Moneda Local'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 118798
        mmTop = 33602
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label69'
        Caption = 'Debe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 37571
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label401'
        Caption = 'Haber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 136261
        mmTop = 37571
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label71'
        AutoSize = False
        Caption = 'Moneda Extranjera'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 159015
        mmTop = 33602
        mmWidth = 32015
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label72'
        Caption = 'Debe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 158486
        mmTop = 37571
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label73'
        Caption = 'Haber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 180446
        mmTop = 37306
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label74'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 29633
        mmWidth = 240507
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label75'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 40746
        mmWidth = 240771
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label88'
        Caption = 'It.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 37571
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'Label89'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 57150
        mmTop = 37571
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'lblFecha1'
        Caption = 'Fecha     :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 13229
        mmTop = 17992
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel81: TppLabel
        UserName = 'lblPeriodo2'
        Caption = 'Periodo   :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 12965
        mmTop = 21960
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'lblTcam1'
        Caption = 'T. Cambio :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 12965
        mmTop = 25929
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'lblDiario1'
        Caption = 'T. de Diario :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 66146
        mmTop = 17992
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'lblComp1'
        Caption = 'Comprobante  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 66146
        mmTop = 21960
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'lblLote1'
        Caption = 'No.Lote :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 159809
        mmTop = 25665
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'lblTmon1'
        Caption = 'Moneda  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 159809
        mmTop = 21696
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'Label87'
        Caption = 'Estado  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 159809
        mmTop = 17727
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label90'
        AutoSize = False
        Caption = 'Glosa :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 66146
        mmTop = 25929
        mmWidth = 13758
        BandType = 0
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        DataField = 'CNTFREG'
        DataPipeline = ppdbComprob
        DisplayFormat = 'DD/MM/YYYY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 34396
        mmTop = 17992
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'CNTCOMPROB'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 93134
        mmTop = 21960
        mmWidth = 28575
        BandType = 0
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'TDIARID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 93134
        mmTop = 17992
        mmWidth = 6085
        BandType = 0
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'TDIARDES'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 100277
        mmTop = 17992
        mmWidth = 55827
        BandType = 0
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        DataField = 'CNTTCAMBIO'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,##0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 34131
        mmTop = 25929
        mmWidth = 13494
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CNTGLOSA'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 80433
        mmTop = 25929
        mmWidth = 75936
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CNTANOMM'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 34396
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object pplblEstado: TppLabel
        UserName = 'pplblestado'
        Caption = 'pplblestado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 174890
        mmTop = 17727
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 4763
        mmWidth = 12965
        BandType = 0
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable7'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 175948
        mmTop = 4763
        mmWidth = 1852
        BandType = 0
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 175948
        mmTop = 8731
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'Label77'
        AutoSize = False
        Caption = 'Hora  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 8731
        mmWidth = 13229
        BandType = 0
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable9'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 175948
        mmTop = 12965
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'Label78'
        Caption = 'Impresi'#243'n de Comprobante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 82021
        mmTop = 8467
        mmWidth = 44450
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'Label79'
        AutoSize = False
        Caption = 'Contabilidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 8467
        mmWidth = 33867
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label91'
        Caption = 'Fecha :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 12965
        mmWidth = 12965
        BandType = 0
      end
      object pplblcia: TppLabel
        UserName = 'pplblcia'
        Caption = 'pplblcia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 4763
        mmWidth = 14817
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CNTREG'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 265
        mmWidth = 2910
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CUENTAID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3969
        mmLeft = 5292
        mmTop = 265
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CNTFEMIS'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3969
        mmLeft = 51594
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CNTGLOSA'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3969
        mmLeft = 67733
        mmTop = 529
        mmWidth = 39158
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CTADES'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 17198
        mmTop = 265
        mmWidth = 33867
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 107686
        mmTop = 265
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 130440
        mmTop = 265
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CNTDEBEME'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 152929
        mmTop = 265
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CNTHABEME'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 175419
        mmTop = 265
        mmWidth = 21167
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 39952
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 107421
        mmTop = 3969
        mmWidth = 21167
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 129911
        mmTop = 3969
        mmWidth = 21167
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'CNTDEBEME'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 152665
        mmTop = 3969
        mmWidth = 21167
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'CNTHABEME'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 175155
        mmTop = 3969
        mmWidth = 21167
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Total Comprobante...............................'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 3440
        mmWidth = 48948
        BandType = 7
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 240771
        BandType = 7
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Preparado por :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 53711
        mmTop = 30163
        mmWidth = 21431
        BandType = 7
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = '-----------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 39423
        mmTop = 25929
        mmWidth = 56092
        BandType = 7
      end
      object ppLabel14: TppLabel
        UserName = 'Label101'
        Caption = 'V'#176' B'#176
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 139436
        mmTop = 30163
        mmWidth = 7673
        BandType = 7
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = '-----------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 113771
        mmTop = 25929
        mmWidth = 56092
        BandType = 7
      end
    end
  end
  object ppdbComprob: TppDBPipeline
    AutoCreateFields = False
    UserName = 'dbComprob'
    Left = 234
    Top = 238
  end
  object pprSustento: TppReport
    AutoStop = False
    DataPipeline = ppDBSustento
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLExes\SOLFormatos\Cnt\Dema\Sustento.rtm'
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprSustentoPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 60
    Top = 383
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBSustento'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33602
      mmPrintPosition = 0
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'AJUSTE POR INFLACION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 65352
        mmTop = 18256
        mmWidth = 39423
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = '(Expresado en Soles)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 70379
        mmTop = 23283
        mmWidth = 29369
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'CIAID'
        DataPipeline = ppDBSustento
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBSustento'
        mmHeight = 3969
        mmLeft = 15610
        mmTop = 7938
        mmWidth = 4498
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'CIADES'
        DataPipeline = ppDBSustento
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBSustento'
        mmHeight = 3969
        mmLeft = 21167
        mmTop = 7938
        mmWidth = 92340
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Fecha : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 153459
        mmTop = 9790
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Hora : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 153459
        mmTop = 15081
        mmWidth = 9260
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165894
        mmTop = 9790
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165894
        mmTop = 15081
        mmWidth = 16933
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'DESMES'
        DataPipeline = ppDBSustento
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBSustento'
        mmHeight = 3969
        mmLeft = 76465
        mmTop = 28047
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Periodo : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 61383
        mmTop = 28046
        mmWidth = 13229
        BandType = 0
      end
      object pplAno1: TppLabel
        UserName = 'lAno1'
        Caption = '2002'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 100013
        mmTop = 28046
        mmWidth = 6350
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'MES'
        DataPipeline = ppDBSustento
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBSustento'
        mmHeight = 3704
        mmLeft = 17463
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'VALOR_HISTORICO'
        DataPipeline = ppDBSustento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBSustento'
        mmHeight = 3704
        mmLeft = 37835
        mmTop = 794
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'FACTOR'
        DataPipeline = ppDBSustento
        DisplayFormat = '#,0.000;-#,0.000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBSustento'
        mmHeight = 3704
        mmLeft = 68263
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'VALOR_AJUSTADO'
        DataPipeline = ppDBSustento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBSustento'
        mmHeight = 3704
        mmLeft = 95779
        mmTop = 794
        mmWidth = 21430
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'DIFERENCIA'
        DataPipeline = ppDBSustento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBSustento'
        mmHeight = 3704
        mmLeft = 123561
        mmTop = 794
        mmWidth = 21430
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'CUENTAORI'
      DataPipeline = ppDBSustento
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBSustento'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 23283
        mmPrintPosition = 0
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'CUENTAORI'
          DataPipeline = ppDBSustento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBSustento'
          mmHeight = 3440
          mmLeft = 17992
          mmTop = 4498
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          DataField = 'CTADES'
          DataPipeline = ppDBSustento
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDBSustento'
          mmHeight = 3440
          mmLeft = 29633
          mmTop = 4498
          mmWidth = 51065
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'VALOR '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 42333
          mmTop = 12435
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'HISTORICO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 40217
          mmTop = 16933
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'FACTOR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 71438
          mmTop = 16933
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'AJUSTADO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 98425
          mmTop = 16933
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'AJUSTAR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 127529
          mmTop = 16933
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'VALOR '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 100277
          mmTop = 12435
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'DIF. POR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 127529
          mmTop = 12435
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.750000000000000000
          mmHeight = 3704
          mmLeft = 15346
          mmTop = 21696
          mmWidth = 133350
          BandType = 3
          GroupNo = 0
        end
        object ppLine11: TppLine
          UserName = 'Line11'
          Weight = 0.750000000000000000
          mmHeight = 1852
          mmLeft = 15610
          mmTop = 10319
          mmWidth = 133350
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 35190
          mmTop = 1588
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.750000000000000000
          mmHeight = 1270
          mmLeft = 121444
          mmTop = 1323
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VALOR_HISTORICO'
          DataPipeline = ppDBSustento
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBSustento'
          mmHeight = 3704
          mmLeft = 37835
          mmTop = 2911
          mmWidth = 21430
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VALOR_AJUSTADO'
          DataPipeline = ppDBSustento
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBSustento'
          mmHeight = 3704
          mmLeft = 95779
          mmTop = 2911
          mmWidth = 21430
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'DIFERENCIA'
          DataPipeline = ppDBSustento
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBSustento'
          mmHeight = 3704
          mmLeft = 123561
          mmTop = 2911
          mmWidth = 21430
          BandType = 5
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 35190
          mmTop = 7938
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 35190
          mmTop = 9260
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.750000000000000000
          mmHeight = 1270
          mmLeft = 92340
          mmTop = 1323
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 92340
          mmTop = 7673
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 92340
          mmTop = 8996
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 121444
          mmTop = 7673
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppLine10: TppLine
          UserName = 'Line10'
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 121444
          mmTop = 8996
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppDBSustento: TppDBPipeline
    DataSource = DM1.dsReporte
    AutoCreateFields = False
    UserName = 'DBSustento'
    Left = 124
    Top = 207
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pprSustento
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 212
    Top = 383
  end
  object pprSconsolidado: TppReport
    AutoStop = False
    DataPipeline = ppdbconsolidado
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rSconsolidado'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLExes\SOLFormatos\Cnt\Dema\SConsolidado.rtm'
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprSconsolidadoPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 92
    Top = 269
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbconsolidado'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38365
      mmPrintPosition = 0
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'AJUSTE POR INFLACION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 69586
        mmTop = 18521
        mmWidth = 39423
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = '(EXPRESADO EN NUEVOS SOLES)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 63765
        mmTop = 32279
        mmWidth = 50800
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Fecha : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 150019
        mmTop = 6350
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Hora : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 150284
        mmTop = 11113
        mmWidth = 9260
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 163248
        mmTop = 6350
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 162719
        mmTop = 11113
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'CONSOLIDADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 9260
        mmTop = 10848
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'Periodo : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 64558
        mmTop = 26194
        mmWidth = 13229
        BandType = 0
      end
      object pplblmes: TppLabel
        UserName = 'lblmes'
        Caption = 'lblmes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 84667
        mmTop = 26194
        mmWidth = 8996
        BandType = 0
      end
      object pplblcian: TppLabel
        UserName = 'lblcian'
        Caption = 'lblcian'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 9260
        mmTop = 4763
        mmWidth = 11377
        BandType = 0
      end
      object pplAno2: TppLabel
        UserName = 'lAno2'
        Caption = '2002'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 104246
        mmTop = 26194
        mmWidth = 6350
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'CIADES'
        DataPipeline = ppdbconsolidado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbconsolidado'
        mmHeight = 3440
        mmLeft = 15081
        mmTop = 794
        mmWidth = 60061
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'VALOR_HISTORICO'
        DataPipeline = ppdbconsolidado
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbconsolidado'
        mmHeight = 3440
        mmLeft = 81492
        mmTop = 794
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'VALOR_AJUSTADO'
        DataPipeline = ppdbconsolidado
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbconsolidado'
        mmHeight = 3704
        mmLeft = 126736
        mmTop = 794
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'DIFERENCIA'
        DataPipeline = ppdbconsolidado
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbconsolidado'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 794
        mmWidth = 22225
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
    end
    object ppGroup3: TppGroup
      BreakName = 'CTA_SUMGA'
      DataPipeline = ppdbconsolidado
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbconsolidado'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppLine20: TppLine
          UserName = 'Line20'
          Weight = 0.750000000000000000
          mmHeight = 1058
          mmLeft = 81756
          mmTop = 794
          mmWidth = 98690
          BandType = 5
          GroupNo = 0
        end
        object ppLine21: TppLine
          UserName = 'Line21'
          Weight = 0.750000000000000000
          mmHeight = 3969
          mmLeft = 82286
          mmTop = 6085
          mmWidth = 98690
          BandType = 5
          GroupNo = 0
        end
        object ppLabel44: TppLabel
          UserName = 'Label44'
          Caption = 'TOTALES : '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 17463
          mmTop = 2646
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc101'
          DataField = 'VALOR_HISTORICO'
          DataPipeline = ppdbconsolidado
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbconsolidado'
          mmHeight = 3440
          mmLeft = 83609
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          AutoSize = True
          DataField = 'VALOR_AJUSTADO'
          DataPipeline = ppdbconsolidado
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbconsolidado'
          mmHeight = 3440
          mmLeft = 110331
          mmTop = 1323
          mmWidth = 38629
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          AutoSize = True
          DataField = 'DIFERENCIA'
          DataPipeline = ppdbconsolidado
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbconsolidado'
          mmHeight = 3440
          mmLeft = 153194
          mmTop = 1323
          mmWidth = 27781
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CTA_ORIGEN'
      DataPipeline = ppdbconsolidado
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbconsolidado'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 23548
        mmPrintPosition = 0
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'VALOR '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 92869
          mmTop = 12435
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'HISTORICO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 89429
          mmTop = 16933
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'AJUSTADO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 130969
          mmTop = 16933
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'AJUSTAR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 165894
          mmTop = 16933
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'VALOR '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 134144
          mmTop = 12435
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'DIF. POR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 166159
          mmTop = 12435
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLine12: TppLine
          UserName = 'Line12'
          Weight = 0.750000000000000000
          mmHeight = 2381
          mmLeft = 15610
          mmTop = 11113
          mmWidth = 166423
          BandType = 3
          GroupNo = 0
        end
        object ppLine13: TppLine
          UserName = 'Line13'
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 15610
          mmTop = 21960
          mmWidth = 166424
          BandType = 3
          GroupNo = 0
        end
        object ppDBText22: TppDBText
          UserName = 'DBText22'
          DataField = 'CTA_ORIGEN'
          DataPipeline = ppdbconsolidado
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbconsolidado'
          mmHeight = 3969
          mmLeft = 43127
          mmTop = 5556
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel31: TppLabel
          UserName = 'Label31'
          Caption = 'Cuenta Contable : '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 15875
          mmTop = 5556
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'DBText23'
          DataField = 'CTADES'
          DataPipeline = ppdbconsolidado
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppdbconsolidado'
          mmHeight = 3969
          mmLeft = 59796
          mmTop = 5556
          mmWidth = 101336
          BandType = 3
          GroupNo = 0
        end
        object ppLabel32: TppLabel
          UserName = 'Label32'
          Caption = 'COMPA'#209#205'A'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 21167
          mmTop = 16933
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLine14: TppLine
          UserName = 'Line14'
          Weight = 0.750000000000000000
          mmHeight = 1058
          mmLeft = 81492
          mmTop = 794
          mmWidth = 98690
          BandType = 5
          GroupNo = 0
        end
        object ppLine15: TppLine
          UserName = 'Line15'
          Weight = 0.750000000000000000
          mmHeight = 3969
          mmLeft = 82021
          mmTop = 6350
          mmWidth = 98690
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'VALOR_HISTORICO'
          DataPipeline = ppdbconsolidado
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbconsolidado'
          mmHeight = 3440
          mmLeft = 81756
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'VALOR_AJUSTADO'
          DataPipeline = ppdbconsolidado
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbconsolidado'
          mmHeight = 3440
          mmLeft = 126736
          mmTop = 2381
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'DIFERENCIA'
          DataPipeline = ppdbconsolidado
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbconsolidado'
          mmHeight = 3440
          mmLeft = 158750
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppdbconsolidado: TppDBPipeline
    DataSource = DM1.dsQry2
    AutoCreateFields = False
    UserName = 'dbconsolidado'
    Left = 148
    Top = 381
    object ppField59: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppField60: TppField
      FieldAlias = 'TDIARID'
      FieldName = 'TDIARID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField61: TppField
      FieldAlias = 'CNTANO'
      FieldName = 'CNTANO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 2
    end
    object ppField62: TppField
      FieldAlias = 'CNTLOTE'
      FieldName = 'CNTLOTE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 3
    end
    object ppField63: TppField
      FieldAlias = 'CTA_ORIGEN'
      FieldName = 'CTA_ORIGEN'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppField64: TppField
      FieldAlias = 'CIADES'
      FieldName = 'CIADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 5
    end
    object ppField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_HISTORICO'
      FieldName = 'VALOR_HISTORICO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_AJUSTADO'
      FieldName = 'VALOR_AJUSTADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCIA'
      FieldName = 'DIFERENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppField68: TppField
      FieldAlias = 'CTADES'
      FieldName = 'CTADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 9
    end
    object ppField127: TppField
      FieldAlias = 'CTA_SUMGA'
      FieldName = 'CTA_SUMGA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
  end
  object pprResumen: TppReport
    AutoStop = False
    DataPipeline = ppdbResumen
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rResumen'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLExes\SOLFormatos\Cnt\Dema\ajusteresumen.rtm'
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprResumenPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 272
    Top = 349
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbResumen'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 53975
      mmPrintPosition = 0
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'RESUMEN DEL REI DE LAS CUENTAS NO MONETARIAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 36248
        mmTop = 21960
        mmWidth = 112977
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = '(EXPRESADO EN NUEVOS SOLES)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 59796
        mmTop = 34396
        mmWidth = 53181
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'CUENTA CONTABLE '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 25400
        mmTop = 46302
        mmWidth = 33073
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'DEBE '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 124619
        mmTop = 46302
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'HABER'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 146315
        mmTop = 46302
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'Fecha : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 162190
        mmTop = 6350
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'Fecha : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 162190
        mmTop = 11377
        mmWidth = 10848
        BandType = 0
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable10'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 174361
        mmTop = 6615
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable11: TppSystemVariable
        UserName = 'SystemVariable11'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 174361
        mmTop = 11377
        mmWidth = 16933
        BandType = 0
      end
      object pplblciades: TppLabel
        UserName = 'lblciades'
        Caption = 'lblciades'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 6879
        mmTop = 12435
        mmWidth = 15346
        BandType = 0
      end
      object pplblciac: TppLabel
        UserName = 'lblciac'
        Caption = 'lblciac'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 6879
        mmTop = 5292
        mmWidth = 11113
        BandType = 0
      end
      object pplblmesr: TppLabel
        UserName = 'lblmesr'
        Caption = 'lblmesr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 79904
        mmTop = 29104
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'PERIODO : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 62442
        mmTop = 29104
        mmWidth = 16404
        BandType = 0
      end
      object pplAno3: TppLabel
        UserName = 'lAno3'
        Caption = '2002'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 102659
        mmTop = 28840
        mmWidth = 7408
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'CUENTAID'
        DataPipeline = ppdbResumen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 16669
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'CTADES'
        DataPipeline = ppdbResumen
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 35190
        mmTop = 529
        mmWidth = 77788
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 117211
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 141817
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 25929
      mmPrintPosition = 0
      object ppLine16: TppLine
        UserName = 'Line16'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 116152
        mmTop = 794
        mmWidth = 45244
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 117211
        mmTop = 2646
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbResumen
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbResumen'
        mmHeight = 3969
        mmLeft = 141817
        mmTop = 2646
        mmWidth = 17198
        BandType = 7
      end
      object pplblctarei: TppLabel
        UserName = 'lblctarei'
        Caption = 'lblctarei'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 16669
        mmTop = 9260
        mmWidth = 12171
        BandType = 7
      end
      object pplblreides: TppLabel
        UserName = 'lblreides'
        Caption = 'lblreides'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 35190
        mmTop = 9260
        mmWidth = 12700
        BandType = 7
      end
      object pplbldeberei: TppLabel
        UserName = 'lbldeberei'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 117211
        mmTop = 9260
        mmWidth = 17198
        BandType = 7
      end
      object pplblhaberei: TppLabel
        UserName = 'lblhaberei'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 141817
        mmTop = 9260
        mmWidth = 17198
        BandType = 7
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 116152
        mmTop = 14288
        mmWidth = 45244
        BandType = 7
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'Label39'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 123561
        mmTop = 15610
        mmWidth = 10848
        BandType = 7
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'Label40'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 148167
        mmTop = 15610
        mmWidth = 10848
        BandType = 7
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 116152
        mmTop = 20638
        mmWidth = 45244
        BandType = 7
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 116152
        mmTop = 21431
        mmWidth = 45244
        BandType = 7
      end
    end
  end
  object ppdbResumen: TppDBPipeline
    OpenDataSource = False
    AutoCreateFields = False
    UserName = 'dbResumen'
    Left = 269
    Top = 299
  end
end
