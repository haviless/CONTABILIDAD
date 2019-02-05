object FAjusteInflacion: TFAjusteInflacion
  Left = 46
  Top = 117
  Width = 729
  Height = 414
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
    Top = 141
    Width = 721
    Height = 203
    ActivePage = tabActivo
    Align = alClient
    TabOrder = 2
    object tabActivo: TTabSheet
      Caption = 'Ac&tivo'
      ImageIndex = 2
      object dbgActivo: TwwDBGrid
        Left = 0
        Top = 0
        Width = 713
        Height = 134
        Selected.Strings = (
          'CIAID'#9'2'#9'CIAID'#9'F'
          'TDIARID'#9'2'#9'TDIARID'#9'F'
          'CUENTAID'#9'15'#9'CUENTAID'#9'F'
          'CLAUXID'#9'3'#9'CLAUXID'#9'F'
          'AUXID'#9'9'#9'AUXID'#9'F'
          'CCOSID'#9'16'#9'CCOSID'#9'F'
          'SRTIPOCTA'#9'1'#9'SRTIPOCTA'#9'F'
          'SALDMNAC'#9'10'#9'SALDMNAC'#9'F'
          'SALDMEXT'#9'10'#9'SALDMEXT'#9'F'
          'AJUSMNAC'#9'10'#9'AJUSMNAC'#9'F'
          'AJUSMEXT'#9'10'#9'AJUSMEXT'#9'F'
          'DIFEMNAC'#9'10'#9'DIFEMNAC'#9'F'
          'DIFEMEXT'#9'10'#9'DIFEMEXT'#9'F'
          'SRPERIODO'#9'6'#9'SRPERIODO'#9'F'
          'CNTCOMPROB'#9'10'#9'CNTCOMPROB'#9'F')
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
        IndicatorColor = icBlack
      end
      object pnlATotal: TPanel
        Left = 0
        Top = 134
        Width = 713
        Height = 39
        Align = alBottom
        BevelInner = bvLowered
        BevelOuter = bvNone
        Color = 10207162
        TabOrder = 1
        object Label8: TLabel
          Left = 196
          Top = 13
          Width = 40
          Height = 15
          Caption = 'Totales:'
        end
        object Label7: TLabel
          Left = 492
          Top = 13
          Width = 60
          Height = 15
          Caption = 'Diferencia:'
        end
        object Label14: TLabel
          Left = 380
          Top = 13
          Width = 48
          Height = 15
          Caption = 'Ajustado:'
        end
        object Label15: TLabel
          Left = 268
          Top = 13
          Width = 32
          Height = 15
          Caption = 'Saldo:'
        end
        object edtASaldo: TEdit
          Left = 304
          Top = 9
          Width = 65
          Height = 23
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          TabOrder = 0
          Text = '0'
        end
        object edtAAjustado: TEdit
          Left = 424
          Top = 9
          Width = 65
          Height = 23
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          TabOrder = 1
          Text = '0'
        end
        object edtADiferencia: TEdit
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
    end
    object tabPasivo: TTabSheet
      Caption = 'Pa&sivo'
      ImageIndex = 1
      object pnlPTotal: TPanel
        Left = 0
        Top = 134
        Width = 713
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
        Width = 713
        Height = 134
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
        IndicatorColor = icBlack
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 721
    Height = 141
    Align = alTop
    Color = 10207162
    TabOrder = 0
    object Label9: TLabel
      Left = 288
      Top = 88
      Width = 31
      Height = 15
      Caption = 'Glosa:'
    end
    object Label13: TLabel
      Left = 288
      Top = 48
      Width = 81
      Height = 15
      Caption = 'Fecha de Comp.:'
    end
    object Label12: TLabel
      Left = 384
      Top = 48
      Width = 42
      Height = 15
      Caption = 'Periodo:'
    end
    object Label4: TLabel
      Left = 440
      Top = 48
      Width = 81
      Height = 15
      Caption = 'Tipo de Cambio:'
    end
    object Label11: TLabel
      Left = 440
      Top = 8
      Width = 150
      Height = 15
      Caption = 'Cuenta de Result.Acumulados:'
    end
    object Label5: TLabel
      Left = 288
      Top = 8
      Width = 61
      Height = 15
      Caption = 'Cuenta REI:'
    end
    object Label19: TLabel
      Left = 544
      Top = 48
      Width = 27
      Height = 15
      Caption = 'Tasa:'
    end
    object edtAcumulado: TEdit
      Left = 440
      Top = 24
      Width = 41
      Height = 23
      Enabled = False
      TabOrder = 3
      Text = '598'
    end
    object edtGlosa: TEdit
      Left = 288
      Top = 104
      Width = 294
      Height = 23
      TabOrder = 9
      Text = 'Calculo del REI'
    end
    object bbtnOk: TBitBtn
      Left = 632
      Top = 16
      Width = 67
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 10
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
      Left = 629
      Top = 56
      Width = 70
      Height = 25
      Cancel = True
      Caption = 'Cerrar'
      ModalResult = 2
      TabOrder = 11
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
      Left = 488
      Top = 24
      Width = 96
      Height = 23
      Color = clInactiveCaptionText
      Enabled = False
      TabOrder = 4
      Text = 'Resultados Acumulados'
    end
    object edtTasa: TEdit
      Left = 544
      Top = 63
      Width = 39
      Height = 23
      Enabled = False
      TabOrder = 8
    end
    object dtpFecha: TDateTimePicker
      Left = 288
      Top = 64
      Width = 88
      Height = 23
      CalAlignment = dtaLeft
      Date = 36891.6526012731
      Time = 36891.6526012731
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 5
      OnExit = dtpFechaExit
    end
    object edtPeriodo: TEdit
      Left = 384
      Top = 64
      Width = 46
      Height = 23
      TabOrder = 6
      Text = '200006'
    end
    object gbAsiento: TGroupBox
      Left = 8
      Top = 8
      Width = 265
      Height = 123
      Caption = 'Datos del &Asiento'
      Color = 10207162
      ParentColor = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 49
        Height = 15
        Caption = 'Compañía'
      end
      object Label2: TLabel
        Left = 8
        Top = 72
        Width = 62
        Height = 15
        Caption = 'Tipo Diario:'
      end
      object Label3: TLabel
        Left = 202
        Top = 72
        Width = 53
        Height = 15
        Caption = 'Comp.Gen.'
      end
      object edtCIA: TEdit
        Left = 64
        Top = 40
        Width = 191
        Height = 23
        Color = clInactiveCaptionText
        Enabled = False
        TabOrder = 1
      end
      object edtTDiario: TEdit
        Left = 64
        Top = 88
        Width = 114
        Height = 23
        Color = clInactiveCaptionText
        Enabled = False
        TabOrder = 3
      end
      object dblcCIA: TwwDBLookupCombo
        Left = 10
        Top = 40
        Width = 53
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'2'#9'Cia'#9'F'
          'CIADES'#9'40'#9'Compañia'#9'F')
        DataField = 'CIAID'
        LookupTable = DM1.cdsCia
        LookupField = 'CIAID'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnExit = dblcCIAExit
      end
      object dblcTDiario: TwwDBLookupCombo
        Left = 10
        Top = 88
        Width = 53
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
        AllowClearKey = False
        OnExit = dblcTDiarioExit
      end
      object edtComprobante: TEdit
        Left = 184
        Top = 88
        Width = 69
        Height = 23
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        ReadOnly = True
        TabOrder = 4
        Text = '0000000000'
      end
    end
    object edtCuentaREI: TEdit
      Left = 288
      Top = 24
      Width = 41
      Height = 23
      Color = clInactiveCaptionText
      Enabled = False
      TabOrder = 1
      Text = '898'
    end
    object cbTCambio: TComboBox
      Left = 440
      Top = 63
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
      Left = 336
      Top = 24
      Width = 96
      Height = 23
      Color = clInactiveCaptionText
      Enabled = False
      TabOrder = 2
      Text = 'REI - Ajuste de Estados Financieros '
    end
  end
  object pnlBotones: TPanel
    Left = 0
    Top = 344
    Width = 721
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
    object Label20: TLabel
      Left = 272
      Top = 0
      Width = 34
      Height = 15
      Alignment = taCenter
      Caption = 'Estado'
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
      Left = 523
      Top = 4
      Width = 40
      Height = 35
      Hint = 'Cuadrar y Asientos Automáticos'
      Default = True
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
      Left = 628
      Top = 4
      Width = 40
      Height = 35
      Hint = 'Imprimir Comprobante'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
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
      Left = 470
      Top = 4
      Width = 40
      Height = 35
      Hint = 'Grabar Comprobante'
      Default = True
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
      Left = 417
      Top = 4
      Width = 40
      Height = 35
      Hint = 'Aceptar Comprobante'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnAceptaClick
      Glyph.Data = {
        8A010000424D8A01000000000000760000002800000017000000170000000100
        0400000000001401000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333303000077777777777770003300000078888888888880000300000
        0780088888888800003000000780088888888800003000000780088888888800
        0030000007888888888888000030000000000000000000000030000000000000
        0000000000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF00
        00300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFF
        FFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF07703000009999999999999907703000009999999999999900
        0030300099999999999999000330}
    end
    object bbtnElimina: TBitBtn
      Left = 575
      Top = 4
      Width = 40
      Height = 35
      Hint = 'Elimina Comprobante'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = bbtnEliminaClick
      Glyph.Data = {
        56020000424D560200000000000076000000280000001D0000001E0000000100
        040000000000E001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00877777777777
        77777777777777777000F8888888888888888888888888887000F88888777777
        77777777777778887000F9998000000000000000000079997000F89990FFFFFF
        FFFFFFFFFFF099987000F889999FFFFFFFFFFFFFFF9999887000F8889999FFFF
        FFFFFFFFF99998887000F88889999FFFFFFFFFFF999978887000F888809999FF
        FFFFFFF9999078887000F88880F9999FFFFFFF9999F078887000F88880FF9999
        FFFFF9999FF078887000F88880FFF9999FFF9999FFF078887000F88880FFFF99
        99F9999FFFF078887000F88880FFFFF9999999FFFFF078887000F88880FFFFFF
        99999FFFFFF078887000F88880FFFFFF99999FFFFFF078887000F88880FFFFF9
        999999FFFFF078887000F88880FFFF9999F9999FFFF078887000F88880FFF999
        9FFF9999FFF078887000F88880FF9999FFFFF9999FF078887000F88880F9999F
        FFFFFF9999F078887000F888809999FFFFFFFFF9999078887000F88889999FFF
        FFFFFFFF999978887000F8889999FFFFFFFFFFFFF99998887000F889999FFFFF
        FFFFFFFFFF9999887000F89990FFFFFFFFFFFFFFFFF099987000F99980FFFFFF
        FFFFFFFFFFF079997000F8888000000000000000000088887000F88888888888
        88888888888888887000FFFFFFFFFFFFFFFFFFFFFFFFFFFF8000}
    end
    object prbAvance: TProgressBar
      Left = 8
      Top = 13
      Width = 150
      Height = 17
      Min = 0
      Max = 100
      TabOrder = 0
    end
  end
  object pprComprob: TppReport
    AutoStop = False
    DataPipeline = ppdbComprob
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rComprob'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 296863
    Units = utMillimeters
    UserName = 'rComprob'
    DeviceType = 'Screen'
    Left = 265
    Top = 150
    Version = '4.22 Pro'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44186
      mmPrintPosition = 0
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Alignment = taCenter
        Caption = 'Impresión de Comprobante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 105834
        mmTop = 4763
        mmWidth = 55033
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Página:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 239184
        mmTop = 1323
        mmWidth = 11642
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        Alignment = taCenter
        AutoSize = False
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 253736
        mmTop = 1323
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 'Hora   :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 239184
        mmTop = 6350
        mmWidth = 11642
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 253736
        mmTop = 6350
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Fecha :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 239184
        mmTop = 11642
        mmWidth = 11642
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 254001
        mmTop = 11377
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1852
        mmTop = 37571
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Clase'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 23813
        mmTop = 39952
        mmWidth = 7938
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 265
        mmTop = 35719
        mmWidth = 275167
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 265
        mmTop = 43656
        mmWidth = 275167
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = '--- Auxiliar ---'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 23813
        mmTop = 36248
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Id'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 49213
        mmTop = 39952
        mmWidth = 2646
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = '--------- Documento ---------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 48948
        mmTop = 36248
        mmWidth = 36248
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Serie'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 57679
        mmTop = 39952
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Glosa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 98425
        mmTop = 37571
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Centro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 146315
        mmTop = 36248
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'de Costo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 146315
        mmTop = 39952
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Debe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 178594
        mmTop = 39952
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Haber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 206375
        mmTop = 39952
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'Número'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 72761
        mmTop = 39952
        mmWidth = 11113
        BandType = 0
      end
      object pplblCia: TppLabel
        UserName = 'lblCia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 1588
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Contabilidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 7673
        mmWidth = 18785
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'TDIARID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165100
        mmTop = 12700
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Código'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 33867
        mmTop = 39952
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Debe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 236538
        mmTop = 39952
        mmWidth = 6879
        BandType = 0
      end
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
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = '-------------- Moneda Local -------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 168275
        mmTop = 36248
        mmWidth = 49213
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = '---------- Moneda Extranjera ----------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 226219
        mmTop = 36248
        mmWidth = 48948
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'T. de Diario     :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 139700
        mmTop = 12700
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'T. Cambio :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 80169
        mmTop = 24342
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'Periodo      :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 79904
        mmTop = 19050
        mmWidth = 16933
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'CNTANOMM'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99748
        mmTop = 18785
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'Comprobante  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 139436
        mmTop = 18785
        mmWidth = 21696
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CNTCOMPROB'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165365
        mmTop = 18785
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'No. de Lote      :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 139436
        mmTop = 23813
        mmWidth = 21696
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CNTLOTE'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165365
        mmTop = 23813
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = 'T. de Moneda   :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 139436
        mmTop = 28840
        mmWidth = 22225
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'TMONID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165365
        mmTop = 28840
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Fecha         :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 80433
        mmTop = 12700
        mmWidth = 16669
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CNTFREG'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99484
        mmTop = 12700
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'Tasa           :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 80433
        mmTop = 29633
        mmWidth = 16669
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'CNTTCAMBIO'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99748
        mmTop = 23283
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CNTTS'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 99748
        mmTop = 29633
        mmWidth = 17992
        BandType = 0
      end
      object pplblTMD: TppLabel
        UserName = 'lblTMD'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 174096
        mmTop = 28840
        mmWidth = 34925
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Estado :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 236273
        mmTop = 28840
        mmWidth = 11113
        BandType = 0
      end
      object pplblEstado: TppLabel
        UserName = 'lblEstado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 249503
        mmTop = 28840
        mmWidth = 25929
        BandType = 0
      end
      object pplblTDD: TppLabel
        UserName = 'pplblTDD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 173567
        mmTop = 12700
        mmWidth = 34925
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'CUENTAID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'CLAUXID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 23283
        mmTop = 265
        mmWidth = 6615
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'AUXID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 31750
        mmTop = 265
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'DOCID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 265
        mmWidth = 6615
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'CNTSERIE'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 57415
        mmTop = 265
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'CNTNODOC'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 72761
        mmTop = 265
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'CNTGLOSA'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 98425
        mmTop = 265
        mmWidth = 44979
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'CCOSID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 265
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        Alignment = taRightJustify
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 169863
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        Alignment = taRightJustify
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 198438
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        Alignment = taRightJustify
        DataField = 'CNTDEBEME'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 227807
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        Alignment = taRightJustify
        DataField = 'CNTHABEME'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 257176
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line7'
        Pen.Style = psDot
        Weight = 0.75
        mmHeight = 265
        mmLeft = 130000
        mmTop = 794
        mmWidth = 150000
        BandType = 8
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        Alignment = taRightJustify
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 169598
        mmTop = 1852
        mmWidth = 17198
        BandType = 8
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        Alignment = taRightJustify
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 198438
        mmTop = 1852
        mmWidth = 17198
        BandType = 8
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        Alignment = taRightJustify
        DataField = 'CNTDEBEME'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 227542
        mmTop = 1852
        mmWidth = 17198
        BandType = 8
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        Alignment = taRightJustify
        DataField = 'CNTHABEME'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 256911
        mmTop = 1852
        mmWidth = 17198
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Total Comprobante...............................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 63765
        mmTop = 1323
        mmWidth = 65088
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppdbComprob: TppDBPipeline
    DataSource = DM1.dsMovCNT1
    CloseDataSource = True
    MasterDataPipeline = ppdbComprob
    UserName = 'dbComprob'
    Left = 242
    Top = 142
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'TDIARID'
      FieldName = 'TDIARID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'CNTCOMPROB'
      FieldName = 'CNTCOMPROB'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'CNTANO'
      FieldName = 'CNTANO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'CNTANOMM'
      FieldName = 'CNTANOMM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'CNTLOTE'
      FieldName = 'CNTLOTE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'CUENTAID'
      FieldName = 'CUENTAID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'AUXID'
      FieldName = 'AUXID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'CNTSERIE'
      FieldName = 'CNTSERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'CNTNODOC'
      FieldName = 'CNTNODOC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'CNTGLOSA'
      FieldName = 'CNTGLOSA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'CNTDH'
      FieldName = 'CNTDH'
      FieldLength = 1
      DisplayWidth = 1
      Position = 13
    end
    object ppField15: TppField
      FieldAlias = 'CCOSID'
      FieldName = 'CCOSID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 14
    end
    object ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTTCAMBIO'
      FieldName = 'CNTTCAMBIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTMTOORI'
      FieldName = 'CNTMTOORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTMTOLOC'
      FieldName = 'CNTMTOLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTMTOEXT'
      FieldName = 'CNTMTOEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppField20: TppField
      FieldAlias = 'CNTFEMIS'
      FieldName = 'CNTFEMIS'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 19
    end
    object ppField21: TppField
      FieldAlias = 'CNTFVCMTO'
      FieldName = 'CNTFVCMTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 20
    end
    object ppField22: TppField
      FieldAlias = 'CNTFCOMP'
      FieldName = 'CNTFCOMP'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 21
    end
    object ppField23: TppField
      FieldAlias = 'CNTESTADO'
      FieldName = 'CNTESTADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 22
    end
    object ppField24: TppField
      FieldAlias = 'CNTCUADRE'
      FieldName = 'CNTCUADRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object ppField25: TppField
      FieldAlias = 'CNTFAUTOM'
      FieldName = 'CNTFAUTOM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object ppField26: TppField
      FieldAlias = 'CNTUSER'
      FieldName = 'CNTUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 25
    end
    object ppField27: TppField
      FieldAlias = 'CNTFREG'
      FieldName = 'CNTFREG'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 26
    end
    object ppField28: TppField
      FieldAlias = 'CNTHREG'
      FieldName = 'CNTHREG'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 27
    end
    object ppField29: TppField
      FieldAlias = 'CNTMM'
      FieldName = 'CNTMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 28
    end
    object ppField30: TppField
      FieldAlias = 'CNTDD'
      FieldName = 'CNTDD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 29
    end
    object ppField31: TppField
      FieldAlias = 'CNTTRI'
      FieldName = 'CNTTRI'
      FieldLength = 1
      DisplayWidth = 1
      Position = 30
    end
    object ppField32: TppField
      FieldAlias = 'CNTSEM'
      FieldName = 'CNTSEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 31
    end
    object ppField33: TppField
      FieldAlias = 'CNTSS'
      FieldName = 'CNTSS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 32
    end
    object ppField34: TppField
      FieldAlias = 'CNTAATRI'
      FieldName = 'CNTAATRI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 33
    end
    object ppField35: TppField
      FieldAlias = 'CNTAASEM'
      FieldName = 'CNTAASEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 34
    end
    object ppField36: TppField
      FieldAlias = 'CNTAASS'
      FieldName = 'CNTAASS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 35
    end
    object ppField37: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 36
    end
    object ppField38: TppField
      FieldAlias = 'FLAGVAR'
      FieldName = 'FLAGVAR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 37
    end
    object ppField39: TppField
      FieldAlias = 'FCONS'
      FieldName = 'FCONS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 38
    end
    object ppField40: TppField
      FieldAlias = 'CNTFMEC'
      FieldName = 'CNTFMEC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 39
    end
    object ppField41: TppField
      FieldAlias = 'TDIARDES'
      FieldName = 'TDIARDES'
      FieldLength = 20
      DisplayWidth = 20
      Position = 40
    end
    object ppField42: TppField
      FieldAlias = 'CTADES'
      FieldName = 'CTADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 41
    end
    object ppField43: TppField
      FieldAlias = 'AUXDES'
      FieldName = 'AUXDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 42
    end
    object ppField44: TppField
      FieldAlias = 'DOCDES'
      FieldName = 'DOCDES'
      FieldLength = 8
      DisplayWidth = 8
      Position = 43
    end
    object ppField45: TppField
      FieldAlias = 'CCOSDES'
      FieldName = 'CCOSDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 44
    end
    object ppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTDEBEMN'
      FieldName = 'CNTDEBEMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object ppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTDEBEME'
      FieldName = 'CNTDEBEME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object ppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTHABEMN'
      FieldName = 'CNTHABEMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object ppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTHABEME'
      FieldName = 'CNTHABEME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object ppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTSALDMN'
      FieldName = 'CNTSALDMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object ppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTSALDME'
      FieldName = 'CNTSALDME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 50
    end
    object ppField52: TppField
      FieldAlias = 'CAMPOVAR'
      FieldName = 'CAMPOVAR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 51
    end
    object ppField53: TppField
      FieldAlias = 'CNTTS'
      FieldName = 'CNTTS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 52
    end
    object ppField54: TppField
      FieldAlias = 'CNTPAGADO'
      FieldName = 'CNTPAGADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 53
    end
    object ppField55: TppField
      FieldAlias = 'CNTMODDOC'
      FieldName = 'CNTMODDOC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 54
    end
    object ppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTREG'
      FieldName = 'CNTREG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 55
    end
    object ppField57: TppField
      FieldAlias = 'MODULO'
      FieldName = 'MODULO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 56
    end
    object ppField58: TppField
      FieldAlias = 'CTA_SECU'
      FieldName = 'CTA_SECU'
      FieldLength = 2
      DisplayWidth = 2
      Position = 57
    end
  end
end
