object FMayorAuxiliarAnalisis: TFMayorAuxiliarAnalisis
  Left = 86
  Top = 129
  Width = 866
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
    Top = 212
    Width = 858
    Height = 265
    Align = alClient
    TabOrder = 0
    object pnlResultado: TPanel
      Left = 1
      Top = 221
      Width = 856
      Height = 43
      Align = alBottom
      TabOrder = 0
      object Label3: TLabel
        Left = 225
        Top = 4
        Width = 66
        Height = 13
        Caption = 'Saldo Anterior'
      end
      object Label1: TLabel
        Left = 328
        Top = 4
        Width = 26
        Height = 13
        Caption = 'Debe'
      end
      object Label2: TLabel
        Left = 408
        Top = 4
        Width = 29
        Height = 13
        Caption = 'Haber'
      end
      object Label4: TLabel
        Left = 476
        Top = 4
        Width = 60
        Height = 13
        Caption = 'Saldo Actual'
      end
      object edtSaldoAcum: TEdit
        Left = 224
        Top = 17
        Width = 69
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
      object edtDebe: TEdit
        Left = 307
        Top = 17
        Width = 69
        Height = 21
        ReadOnly = True
        TabOrder = 1
        Text = '0'
      end
      object edtHaber: TEdit
        Left = 389
        Top = 17
        Width = 69
        Height = 21
        ReadOnly = True
        TabOrder = 2
        Text = '0'
      end
      object edtSaldoActual: TEdit
        Left = 472
        Top = 17
        Width = 69
        Height = 21
        ReadOnly = True
        TabOrder = 3
        Text = '0'
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 856
      Height = 40
      Align = alTop
      TabOrder = 1
      object lblParametro: TLabel
        Left = 8
        Top = 12
        Width = 58
        Height = 13
        Caption = 'lblParametro'
      end
      object edtParametro: TEdit
        Left = 96
        Top = 8
        Width = 70
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
    end
    object dbgAnalisis: TwwDBGrid
      Left = 1
      Top = 41
      Width = 856
      Height = 180
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DM1.dsMayorAuxA
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgFooter3DCells, dgTabExitsOnLastCol]
      PopupMenu = pmCancelar
      ReadOnly = True
      TabOrder = 2
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      OnCalcCellColors = dbgAnalisisCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = dbgAnalisisTopRowChanged
      FooterHeight = 50
    end
  end
  object pnlArriba: TPanel
    Left = 0
    Top = 0
    Width = 858
    Height = 212
    Align = alTop
    TabOrder = 1
    object lblCia: TLabel
      Left = 18
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
    object gbFech: TGroupBox
      Left = 343
      Top = 56
      Width = 113
      Height = 92
      TabOrder = 7
      object dtpFReg1: TDateTimePicker
        Left = 11
        Top = 24
        Width = 85
        Height = 21
        CalAlignment = dtaLeft
        Date = 36726.6590645833
        Time = 36726.6590645833
        DateFormat = dfShort
        DateMode = dmComboBox
        Enabled = False
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
      object dtpFReg2: TDateTimePicker
        Left = 11
        Top = 56
        Width = 85
        Height = 21
        CalAlignment = dtaLeft
        Date = 36726.6590645833
        Time = 36726.6590645833
        DateFormat = dfShort
        DateMode = dmComboBox
        Enabled = False
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
        OnExit = dtpFReg2Exit
      end
    end
    object gbCuentas: TGroupBox
      Left = 8
      Top = 56
      Width = 222
      Height = 147
      Caption = 'Rango de Cuentas'
      TabOrder = 3
      object lbCuentas: TListBox
        Left = 2
        Top = 15
        Width = 218
        Height = 130
        Align = alClient
        BorderStyle = bsNone
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object gbTipoMoneda: TGroupBox
      Left = 240
      Top = 152
      Width = 216
      Height = 50
      Caption = 'Moneda'
      TabOrder = 8
      object dblcMoneda: TwwDBLookupCombo
        Left = 16
        Top = 21
        Width = 184
        Height = 21
        DropDownAlignment = taLeftJustify
        DataField = 'TMONDES'
        DataSource = DM1.dsTMon
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object gbAsientosAutomaticos: TGroupBox
      Left = 464
      Top = 140
      Width = 176
      Height = 63
      Caption = 'Incluir Asientos Automaticos'
      TabOrder = 10
      object ckbDifCambio: TCheckBox
        Left = 8
        Top = 16
        Width = 141
        Height = 17
        Caption = 'Por Diferencia de Cambio'
        TabOrder = 0
      end
      object ckbEEFF: TCheckBox
        Left = 8
        Top = 40
        Width = 101
        Height = 17
        Caption = 'Ajuste de EE.FF.'
        TabOrder = 1
      end
    end
    object rgEstadoDoc: TRadioGroup
      Left = 464
      Top = 56
      Width = 175
      Height = 80
      Caption = 'Estado de Documentos'
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Pendientes'
        'Cancelados')
      TabOrder = 9
    end
    object gbPer: TGroupBox
      Left = 240
      Top = 56
      Width = 96
      Height = 92
      TabOrder = 6
      object speAno: TSpinEdit
        Left = 24
        Top = 26
        Width = 48
        Height = 22
        MaxLength = 4
        MaxValue = 2100
        MinValue = 1990
        TabOrder = 0
        Value = 1999
      end
      object speMM: TSpinEdit
        Left = 27
        Top = 58
        Width = 37
        Height = 22
        MaxLength = 2
        MaxValue = 13
        MinValue = 0
        TabOrder = 1
        Value = 12
      end
    end
    object rbPer: TRadioButton
      Left = 248
      Top = 56
      Width = 58
      Height = 17
      Caption = 'Periodo'
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = rbPerClick
    end
    object rbFech: TRadioButton
      Left = 351
      Top = 56
      Width = 57
      Height = 17
      Caption = 'Fechas'
      TabOrder = 5
      OnClick = rbFechClick
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
    end
    object edtCia: TEdit
      Left = 55
      Top = 28
      Width = 171
      Height = 21
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object rgTipoAnalisis: TRadioGroup
      Left = 240
      Top = 16
      Width = 399
      Height = 36
      Caption = 'Tipo de Analisis'
      Columns = 2
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        'Por &Auxiliar'
        'Por &Centro de Costo')
      TabOrder = 2
    end
    object bbtnOk: TBitBtn
      Left = 720
      Top = 37
      Width = 76
      Height = 25
      Caption = 'Analizar'
      TabOrder = 11
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
      Left = 720
      Top = 72
      Width = 76
      Height = 25
      Cancel = True
      Caption = 'Cerrar'
      ModalResult = 2
      TabOrder = 12
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
      Left = 722
      Top = 107
      Width = 76
      Height = 25
      Hint = 'Imprimir'
      Cancel = True
      Caption = 'Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
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
      Left = 720
      Top = 152
      Width = 76
      Height = 25
      Caption = 'Cancelados'
      TabOrder = 14
      OnClick = bbtnCambioClick
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
end
