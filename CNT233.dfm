object FConcilBancContab: TFConcilBancContab
  Left = 589
  Top = 315
  Width = 574
  Height = 340
  Caption = 'Contabilizaci'#243'n de Conciliaci'#243'n Bancaria'
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
  object pnlContabilizacion: TPanel
    Left = 5
    Top = 4
    Width = 547
    Height = 292
    Color = 8700353
    TabOrder = 0
    object Bevel1: TBevel
      Left = 8
      Top = 188
      Width = 529
      Height = 58
    end
    object bvlConta1: TBevel
      Left = 8
      Top = 123
      Width = 529
      Height = 58
    end
    object Label9: TLabel
      Left = 18
      Top = 66
      Width = 40
      Height = 13
      Caption = 'T.Diario:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 18
      Top = 96
      Width = 30
      Height = 13
      Caption = 'Glosa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblCtaContable1: TLabel
      Left = 19
      Top = 129
      Width = 88
      Height = 13
      Caption = 'Cuenta Contable 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblCCosto1: TLabel
      Left = 313
      Top = 126
      Width = 85
      Height = 13
      Caption = 'Centro de Costo 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblCtaContable2: TLabel
      Left = 19
      Top = 197
      Width = 88
      Height = 13
      Caption = 'Cuenta Contable 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblCCosto2: TLabel
      Left = 313
      Top = 194
      Width = 85
      Height = 13
      Caption = 'Centro de Costo 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 20
      Top = 29
      Width = 39
      Height = 13
      Caption = 'Periodo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dblcTDIARID2: TwwDBLookupCombo
      Left = 81
      Top = 56
      Width = 52
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TDIARID'#9'2'#9'Cod.'#9'F'
        'TDIARDES'#9'20'#9'Descripci'#243'n'#9'F')
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      UseTFields = False
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcTDIARID2Exit
    end
    object edtGlosa: TEdit
      Left = 81
      Top = 91
      Width = 451
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object btnContabiliza2: TBitBtn
      Left = 446
      Top = 258
      Width = 89
      Height = 25
      Caption = 'Contabiliza'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      OnClick = btnContabiliza2Click
    end
    object edtDiario2: TEdit
      Left = 136
      Top = 56
      Width = 135
      Height = 24
      Color = 13303807
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object chkTotalizado: TCheckBox
      Left = 310
      Top = 60
      Width = 71
      Height = 20
      Caption = 'Totalizado'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
    end
    object dblcdCuenta1: TwwDBLookupComboDlg
      Left = 16
      Top = 146
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
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
      OnExit = dblcdCuenta1Exit
    end
    object edtCuenta1: TEdit
      Left = 111
      Top = 146
      Width = 190
      Height = 23
      Color = 13303807
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object dblcdCCosto1: TwwDBLookupComboDlg
      Left = 312
      Top = 146
      Width = 65
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Centros de Costo'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CCOSID'#9'15'#9'ID'#9'F'
        'CCOSDES'#9'40'#9'Centro de Costo'#9'F'
        'CCOSABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'CCOSID'
      LookupField = 'CCOSID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      Color = clSilver
      Enabled = False
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdCCosto1Exit
    end
    object edtCCosto1: TEdit
      Left = 381
      Top = 145
      Width = 149
      Height = 23
      Color = 13303807
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object dblcdCuenta2: TwwDBLookupComboDlg
      Left = 16
      Top = 214
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
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      UseTFields = False
      ShowMatchText = True
      OnExit = dblcdCuenta2Exit
    end
    object edtCuenta2: TEdit
      Left = 111
      Top = 214
      Width = 190
      Height = 23
      Color = 13303807
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object dblcdCCosto2: TwwDBLookupComboDlg
      Left = 312
      Top = 214
      Width = 65
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Centros de Costo'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CCOSID'#9'15'#9'ID'#9'F'
        'CCOSDES'#9'40'#9'Centro de Costo'#9'F'
        'CCOSABR'#9'15'#9'Abreviatura'#9'F')
      DataField = 'CCOSID'
      LookupField = 'CCOSID'
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      Color = clSilver
      Enabled = False
      TabOrder = 10
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcdCCosto2Exit
    end
    object edtCCosto2: TEdit
      Left = 381
      Top = 213
      Width = 149
      Height = 23
      Color = 13303807
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object dbsMEs: TwwDBSpinEdit
      Left = 137
      Top = 24
      Width = 36
      Height = 21
      Increment = 1.000000000000000000
      MaxValue = 12.000000000000000000
      MinValue = 1.000000000000000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      UnboundDataType = wwDefault
    end
    object dbsAno: TwwDBSpinEdit
      Left = 81
      Top = 24
      Width = 53
      Height = 21
      Increment = 1.000000000000000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      UnboundDataType = wwDefault
    end
  end
end
