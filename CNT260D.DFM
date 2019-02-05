object FTransferencia: TFTransferencia
  Left = 278
  Top = 217
  Width = 583
  Height = 324
  Caption = 'Transferencia de Archivos'
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 6
    Top = 5
    Width = 563
    Height = 292
    BevelInner = bvRaised
    BorderWidth = 1
    Color = 10207162
    TabOrder = 0
    object lblCia: TLabel
      Left = 27
      Top = 23
      Width = 49
      Height = 16
      Caption = 'Compañía'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 27
      Top = 55
      Width = 38
      Height = 16
      Caption = 'Periodo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 27
      Top = 84
      Width = 59
      Height = 16
      Caption = 'Tipo Diario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 27
      Top = 116
      Width = 132
      Height = 16
      Caption = 'Fecha de Contabilización'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblcCia: TwwDBLookupCombo
      Left = 175
      Top = 18
      Width = 49
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'3'#9'ID'#9'T'
        'CIAABR'#9'15'#9'Compañía'#9'T')
      LookupTable = DM1.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 232
      Top = 18
      Width = 185
      Height = 21
      Color = clSilver
      Enabled = False
      TabOrder = 1
    end
    object speAno: TSpinEdit
      Left = 179
      Top = 49
      Width = 49
      Height = 22
      MaxLength = 4
      MaxValue = 2100
      MinValue = 1900
      TabOrder = 2
      Value = 2001
      OnExit = speAnoExit
    end
    object speMM: TSpinEdit
      Left = 232
      Top = 49
      Width = 43
      Height = 22
      MaxLength = 2
      MaxValue = 13
      MinValue = 1
      TabOrder = 3
      Value = 1
      OnExit = speMMExit
    end
    object bbtnOk: TBitBtn
      Left = 158
      Top = 251
      Width = 104
      Height = 28
      Caption = 'Iniciar Proceso'
      TabOrder = 4
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
      Left = 295
      Top = 252
      Width = 104
      Height = 28
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 5
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
    object dblcTDiario: TwwDBLookupCombo
      Left = 179
      Top = 82
      Width = 49
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TDIARID'#9'2'#9'Tipo de Diario'#9'F'
        'TDIARDES'#9'40'#9'Descripción'#9'F')
      LookupTable = DM1.cdsTDiario
      LookupField = 'TDIARID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      Enabled = False
      ParentFont = False
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      UseTFields = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcTDiarioExit
    end
    object edtTDiario: TEdit
      Left = 231
      Top = 82
      Width = 186
      Height = 21
      Color = clActiveBorder
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object edtAnoMM: TEdit
      Left = 280
      Top = 50
      Width = 81
      Height = 21
      Color = clSilver
      Enabled = False
      TabOrder = 8
    end
    object dtpFCont: TwwDBDateTimePicker
      Left = 177
      Top = 114
      Width = 90
      Height = 22
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 9
      OnExit = dtpFContExit
    end
    object RadioGroup1: TRadioGroup
      Left = 29
      Top = 152
      Width = 508
      Height = 73
      Caption = 'Tipo de Cambio'
      Columns = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'Bancario Compra '
        'Bancario Venta'
        'Paralelo Compra'
        'Paralelo Venta'
        'Oficial Compra'
        'Oficial Venta'
        'Otros Compra'
        'Otros Venta')
      ParentFont = False
      TabOrder = 10
      OnExit = RadioGroup1Exit
    end
  end
end
