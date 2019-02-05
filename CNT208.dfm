object FCCosto: TFCCosto
  Left = 349
  Top = 131
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Centro de Costo'
  ClientHeight = 553
  ClientWidth = 392
  Color = 10207162
  Constraints.MaxHeight = 587
  Constraints.MaxWidth = 400
  Constraints.MinHeight = 580
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblNivel: TLabel
    Left = 22
    Top = 1
    Width = 32
    Height = 15
    Caption = 'N.C.C.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblIdCCosto: TLabel
    Left = 118
    Top = 1
    Width = 80
    Height = 15
    Caption = 'Id Centro Costo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblDesCCosto: TLabel
    Left = 22
    Top = 43
    Width = 103
    Height = 15
    Caption = 'Descripci'#243'n C.Costo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblAbrCCosto: TLabel
    Left = 253
    Top = 43
    Width = 103
    Height = 15
    Caption = 'Abreviatura C.Costo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblDig: TLabel
    Left = 78
    Top = 1
    Width = 21
    Height = 15
    Caption = 'Dig.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 26
    Top = 132
    Width = 245
    Height = 15
    Caption = 'Compa'#241'ias que tienen Acceso al Centro de Costo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object dbeIdCCosto: TwwDBEdit
    Left = 118
    Top = 17
    Width = 81
    Height = 21
    TabOrder = 1
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
    OnExit = dbeIdCCostoExit
    OnKeyPress = dbeIdCCostoKeyPress
  end
  object rgMov: TRadioGroup
    Left = 21
    Top = 86
    Width = 161
    Height = 39
    Caption = 'Es de Movimiento ?'
    Columns = 2
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    Items.Strings = (
      'Si'
      'No')
    ParentFont = False
    TabOrder = 4
  end
  object rgActivo: TRadioGroup
    Left = 196
    Top = 86
    Width = 169
    Height = 39
    Caption = 'Activo'
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    Items.Strings = (
      'Si'
      'No')
    ParentFont = False
    TabOrder = 5
  end
  object dblcNivel: TwwDBLookupCombo
    Left = 22
    Top = 17
    Width = 49
    Height = 21
    DropDownAlignment = taLeftJustify
    Options = [loColLines, loTitles]
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcNivelExit
    OnNotInList = dblcNivelNotInList
  end
  object dbeDesCCosto: TwwDBEdit
    Left = 22
    Top = 59
    Width = 220
    Height = 21
    MaxLength = 40
    TabOrder = 2
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeAbrCCosto: TwwDBEdit
    Left = 250
    Top = 59
    Width = 120
    Height = 21
    MaxLength = 15
    TabOrder = 3
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object Z2bbtnOk: TBitBtn
    Left = 298
    Top = 523
    Width = 32
    Height = 30
    Hint = 'Registra'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = Z2bbtnOkClick
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
  object Z2bbtnCanc: TBitBtn
    Left = 334
    Top = 523
    Width = 32
    Height = 30
    Hint = 'Cancela Datos'
    Cancel = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = Z2bbtnCancClick
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
  object dbeDig: TwwDBEdit
    Left = 78
    Top = 17
    Width = 25
    Height = 21
    Color = clActiveBorder
    Enabled = False
    TabOrder = 7
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object chlbCia: TCheckListBox
    Left = 21
    Top = 147
    Width = 348
    Height = 233
    OnClickCheck = chlbCiaClickCheck
    ItemHeight = 13
    TabOrder = 6
  end
  object gb02: TGroupBox
    Left = 21
    Top = 386
    Width = 349
    Height = 63
    Caption = 'Para Asiento Contable de Consumos de Almacen Central'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    object lblCia: TLabel
      Left = 29
      Top = 17
      Width = 144
      Height = 17
      Caption = 'Compa'#241#237'a Filial de Asiento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 229
      Top = 18
      Width = 64
      Height = 15
      Caption = 'Cuenta Debe'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dblcCia02: TwwDBLookupCombo
      Left = 25
      Top = 35
      Width = 49
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCia02Exit
      OnNotInList = dblcCia02NotInList
    end
    object edtCia02: TEdit
      Left = 73
      Top = 35
      Width = 131
      Height = 21
      Color = clInactiveBorder
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object dblcdCuenta02: TwwDBLookupComboDlg
      Left = 226
      Top = 34
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
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
      OnEnter = dblcdCuenta02Enter
      OnExit = dblcdCuenta02Exit
    end
  end
  object gb04: TGroupBox
    Left = 21
    Top = 455
    Width = 349
    Height = 63
    Caption = 'Para Asiento Contable de Transferencias de Bazar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    object Label2: TLabel
      Left = 30
      Top = 17
      Width = 144
      Height = 17
      Caption = 'Compa'#241#237'a Filial de Asiento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 228
      Top = 18
      Width = 64
      Height = 15
      Caption = 'Cuenta Debe'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object dblcCia04: TwwDBLookupCombo
      Left = 26
      Top = 35
      Width = 49
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCia04Exit
      OnNotInList = dblcCia04NotInList
    end
    object edtCia04: TEdit
      Left = 74
      Top = 35
      Width = 131
      Height = 21
      Color = clInactiveBorder
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object dblcdCuenta04: TwwDBLookupComboDlg
      Left = 225
      Top = 34
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
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
      OnEnter = dblcdCuenta04Enter
      OnExit = dblcdCuenta04Exit
    end
  end
end
