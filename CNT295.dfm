object FLiqDet: TFLiqDet
  Left = 280
  Top = 155
  Width = 660
  Height = 496
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Detalle de Liquidaci'#243'n'
  Color = clBtnFace
  Constraints.MaxHeight = 496
  Constraints.MaxWidth = 660
  Constraints.MinHeight = 496
  Constraints.MinWidth = 660
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 7
    Top = 4
    Width = 638
    Height = 93
    Enabled = False
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 19
      Width = 62
      Height = 13
      Caption = 'Oficio Nro.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 200
      Top = 19
      Width = 33
      Height = 13
      Caption = 'Equipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 354
      Top = 19
      Width = 30
      Height = 13
      Caption = 'Fecha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 507
      Top = 19
      Width = 36
      Height = 13
      Caption = 'Usuario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 469
      Top = 61
      Width = 35
      Height = 13
      Caption = 'Importe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 61
      Width = 77
      Height = 13
      Caption = 'Liquidaci'#243'n Nro.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 200
      Top = 61
      Width = 33
      Height = 13
      Caption = 'Auxiliar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbeNoOfi: TwwDBEdit
      Left = 97
      Top = 14
      Width = 73
      Height = 21
      Color = clInfoBk
      DataField = 'NUMOFI'
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeEquipo: TwwDBEdit
      Left = 239
      Top = 14
      Width = 73
      Height = 21
      Color = clInfoBk
      DataField = 'EQUIPO'
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeFecha: TwwDBEdit
      Left = 391
      Top = 14
      Width = 73
      Height = 21
      Color = clInfoBk
      DataField = 'FECHA'
      ReadOnly = True
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeUsuario: TwwDBEdit
      Left = 549
      Top = 14
      Width = 73
      Height = 21
      Color = clInfoBk
      DataField = 'EQUIPO'
      ReadOnly = True
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeMoneda: TwwDBEdit
      Left = 510
      Top = 56
      Width = 32
      Height = 21
      Color = clInfoBk
      DataField = 'MONEDA'
      ReadOnly = True
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeMonto: TwwDBEdit
      Left = 549
      Top = 56
      Width = 73
      Height = 21
      Color = clInfoBk
      DataField = 'IMPTOT'
      ReadOnly = True
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeNoLiq: TwwDBEdit
      Left = 97
      Top = 56
      Width = 73
      Height = 21
      Color = clInfoBk
      DataField = 'NUMLIQ'
      ReadOnly = True
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeCodUsu: TwwDBEdit
      Left = 239
      Top = 56
      Width = 56
      Height = 21
      Color = clInfoBk
      DataField = 'CODUSU'
      ReadOnly = True
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object dbgLiqDet: TwwDBGrid
    Left = 7
    Top = 103
    Width = 638
    Height = 257
    DisableThemesInTitle = False
    Selected.Strings = (
      'CUENTA'#9'10'#9'Cuenta~Contable'
      'OBSERVACION'#9'50'#9'Observaci'#243'n'
      'IMPORTE'#9'11'#9'Importe'
      'RENDICION'#9'11'#9'Rendici'#243'n')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
    ReadOnly = True
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnDblClick = dbgLiqDetDblClick
    FooterColor = clGray
  end
  object pnlCNT: TPanel
    Left = 7
    Top = 365
    Width = 638
    Height = 95
    TabOrder = 2
    object Label8: TLabel
      Left = 12
      Top = 5
      Width = 190
      Height = 16
      Caption = 'Rendici'#243'n - Contabilizaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 12
      Top = 38
      Width = 111
      Height = 13
      Caption = 'Rendici'#243'n [S]i/[N]o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 344
      Top = 38
      Width = 36
      Height = 13
      Caption = 'Usuario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 182
      Top = 38
      Width = 30
      Height = 13
      Caption = 'Fecha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 479
      Top = 38
      Width = 112
      Height = 13
      Caption = 'Contabilizado [S]i / [N]o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbeEstRen: TwwDBEdit
      Left = 128
      Top = 33
      Width = 26
      Height = 21
      Color = clInfoBk
      DataField = 'ESTRENLIQ'
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeUsuCon: TwwDBEdit
      Left = 385
      Top = 33
      Width = 73
      Height = 21
      Color = clInfoBk
      DataField = 'USUCONREN'
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeEstCon: TwwDBEdit
      Left = 596
      Top = 33
      Width = 25
      Height = 21
      Color = clInfoBk
      DataField = 'ESTCONREN'
      ReadOnly = True
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dtpFecCon: TwwDBDateTimePicker
      Left = 218
      Top = 33
      Width = 100
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      DataField = 'FECRENLIQ'
      Epoch = 1950
      ShowButton = True
      TabOrder = 3
    end
    object bbtnCNT: TBitBtn
      Left = 541
      Top = 63
      Width = 81
      Height = 25
      Caption = 'Contabilizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = bbtnCNTClick
    end
  end
end
