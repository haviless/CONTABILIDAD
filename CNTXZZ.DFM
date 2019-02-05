object FMayorAuxiliar: TFMayorAuxiliar
  Left = 103
  Top = 40
  Width = 631
  Height = 504
  Caption = 'Analisis x Auxiliar y Centro de Costo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAuxiliares: TPanel
    Left = 0
    Top = 181
    Width = 623
    Height = 296
    Align = alClient
    TabOrder = 1
    object pnlResultado: TPanel
      Left = 1
      Top = 252
      Width = 621
      Height = 43
      Align = alBottom
      TabOrder = 0
      object Label3: TLabel
        Left = 81
        Top = 4
        Width = 66
        Height = 13
        Caption = 'Saldo Anterior'
      end
      object Label1: TLabel
        Left = 184
        Top = 4
        Width = 26
        Height = 13
        Caption = 'Debe'
      end
      object Label2: TLabel
        Left = 264
        Top = 4
        Width = 29
        Height = 13
        Caption = 'Haber'
      end
      object Label4: TLabel
        Left = 332
        Top = 4
        Width = 60
        Height = 13
        Caption = 'Saldo Actual'
      end
      object edtSaldoAcum: TEdit
        Left = 80
        Top = 17
        Width = 69
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
      object edtDebe: TEdit
        Left = 163
        Top = 17
        Width = 69
        Height = 21
        ReadOnly = True
        TabOrder = 1
        Text = '0'
      end
      object edtHaber: TEdit
        Left = 245
        Top = 17
        Width = 69
        Height = 21
        ReadOnly = True
        TabOrder = 2
        Text = '0'
      end
      object edtSaldoActual: TEdit
        Left = 328
        Top = 17
        Width = 69
        Height = 21
        ReadOnly = True
        TabOrder = 3
        Text = '0'
      end
    end
    object dbgAnalisis: TwwDBGrid
      Left = 1
      Top = 1
      Width = 621
      Height = 251
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DM1.dsMayorAux
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgAnalisisDblClick
      IndicatorColor = icBlack
      OnTopRowChanged = dbgAnalisisTopRowChanged
    end
  end
  object pnlArriba: TPanel
    Left = 0
    Top = 0
    Width = 623
    Height = 181
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblCia: TLabel
      Left = 10
      Top = 10
      Width = 49
      Height = 13
      Caption = 'Compañía'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object gbCuentas: TGroupBox
      Left = 216
      Top = 16
      Width = 194
      Height = 100
      Caption = 'Rango de Cuentas'
      TabOrder = 3
      object lbCuentas: TListBox
        Left = 2
        Top = 15
        Width = 190
        Height = 83
        Align = alClient
        BorderStyle = bsNone
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object gbTipoMoneda: TGroupBox
      Left = 216
      Top = 126
      Width = 193
      Height = 50
      Caption = 'Moneda'
      TabOrder = 5
      object dblcMoneda: TwwDBLookupCombo
        Left = 9
        Top = 21
        Width = 175
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = DM1.cdsTMon
        LookupField = 'TMONDES'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object gbPer: TGroupBox
      Left = 8
      Top = 126
      Width = 200
      Height = 50
      Caption = 'Periodo'
      TabOrder = 4
      object Label5: TLabel
        Left = 8
        Top = 23
        Width = 22
        Height = 13
        Caption = 'Año:'
      end
      object Label6: TLabel
        Left = 96
        Top = 23
        Width = 23
        Height = 13
        Caption = 'Mes:'
      end
      object speAno: TSpinEdit
        Left = 40
        Top = 18
        Width = 48
        Height = 22
        MaxLength = 4
        MaxValue = 2100
        MinValue = 1990
        TabOrder = 0
        Value = 1999
      end
      object speMM: TSpinEdit
        Left = 139
        Top = 18
        Width = 37
        Height = 22
        MaxLength = 2
        MaxValue = 13
        MinValue = 0
        TabOrder = 1
        Value = 12
      end
    end
    object dblcCia: TwwDBLookupCombo
      Left = 14
      Top = 28
      Width = 42
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Razón Social'#9'F')
      LookupTable = DM1.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 55
      Top = 28
      Width = 147
      Height = 21
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object rgTipoAnalisis: TRadioGroup
      Left = 8
      Top = 56
      Width = 200
      Height = 60
      Caption = 'Tipo de Analisis'
      ItemIndex = 0
      Items.Strings = (
        'Por &Auxiliar'
        'Por &Centro de Costo')
      TabOrder = 2
      OnClick = rgTipoAnalisisClick
    end
    object bbtnOk: TBitBtn
      Left = 472
      Top = 48
      Width = 81
      Height = 25
      Caption = 'Analizar'
      TabOrder = 6
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
      Left = 474
      Top = 80
      Width = 79
      Height = 25
      Cancel = True
      Caption = 'Cerrar'
      ModalResult = 2
      TabOrder = 7
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
      Left = 474
      Top = 128
      Width = 79
      Height = 25
      Hint = 'Imprimir'
      Cancel = True
      Caption = 'Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
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
  end
end
