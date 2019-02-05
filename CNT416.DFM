object Form1: TForm1
  Left = 151
  Top = 98
  Width = 552
  Height = 467
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 2
    Top = 109
    Width = 540
    Height = 35
  end
  object Bevel2: TBevel
    Left = 3
    Top = 110
    Width = 140
    Height = 315
  end
  object Bevel3: TBevel
    Left = 439
    Top = 110
    Width = 103
    Height = 315
  end
  object Bevel4: TBevel
    Left = 346
    Top = 109
    Width = 95
    Height = 316
  end
  object Bevel5: TBevel
    Left = 251
    Top = 110
    Width = 95
    Height = 315
  end
  object Bevel6: TBevel
    Left = 143
    Top = 110
    Width = 108
    Height = 315
  end
  object Bevel7: TBevel
    Left = 143
    Top = 384
    Width = 399
    Height = 42
  end
  object Panel1: TPanel
    Left = 2
    Top = 0
    Width = 540
    Height = 110
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 214
      Top = 4
      Width = 36
      Height = 13
      Caption = 'Periodo'
    end
    object Label2: TLabel
      Left = 5
      Top = 39
      Width = 34
      Height = 13
      Caption = 'Cuenta'
    end
    object Label3: TLabel
      Left = 293
      Top = 5
      Width = 39
      Height = 13
      Caption = 'Moneda'
    end
    object Label4: TLabel
      Left = 277
      Top = 39
      Width = 33
      Height = 13
      Caption = 'Auxiliar'
    end
    object Label5: TLabel
      Left = 5
      Top = 72
      Width = 76
      Height = 13
      Caption = 'Centro de Costo'
    end
    object Label6: TLabel
      Left = 6
      Top = 4
      Width = 49
      Height = 13
      Caption = 'Compañía'
    end
    object wwDBLookupComboDlg1: TwwDBLookupComboDlg
      Left = 5
      Top = 53
      Width = 89
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      DataSource = DM1.dsCuenta
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object wwDBLookupCombo1: TwwDBLookupCombo
      Left = 293
      Top = 17
      Width = 112
      Height = 21
      DropDownAlignment = taLeftJustify
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object wwDBLookupComboDlg2: TwwDBLookupComboDlg
      Left = 277
      Top = 53
      Width = 84
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object wwDBEdit1: TwwDBEdit
      Left = 46
      Top = 16
      Width = 157
      Height = 21
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit2: TwwDBEdit
      Left = 358
      Top = 53
      Width = 171
      Height = 21
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBLookupCombo2: TwwDBLookupCombo
      Left = 5
      Top = 16
      Width = 42
      Height = 21
      DropDownAlignment = taLeftJustify
      DataField = 'CIAID'
      DataSource = DM1.dsCia
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object wwDBLookupComboDlg3: TwwDBLookupComboDlg
      Left = 5
      Top = 87
      Width = 59
      Height = 18
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object wwDBEdit3: TwwDBEdit
      Left = 66
      Top = 87
      Width = 128
      Height = 18
      TabOrder = 7
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBLookupCombo3: TwwDBLookupCombo
      Left = 213
      Top = 16
      Width = 60
      Height = 21
      DropDownAlignment = taLeftJustify
      TabOrder = 8
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object wwDBEdit4: TwwDBEdit
      Left = 94
      Top = 53
      Width = 179
      Height = 21
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object BitBtn1: TBitBtn
      Left = 425
      Top = 80
      Width = 42
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 10
    end
    object BitBtn2: TBitBtn
      Left = 472
      Top = 80
      Width = 40
      Height = 25
      Caption = 'BitBtn2'
      TabOrder = 11
    end
  end
  object StaticText1: TStaticText
    Left = 29
    Top = 120
    Width = 81
    Height = 17
    Caption = 'Mes de Proceso'
    TabOrder = 1
  end
  object StaticText2: TStaticText
    Left = 168
    Top = 120
    Width = 70
    Height = 17
    Caption = 'Saldo Anterior'
    TabOrder = 2
  end
  object StaticText3: TStaticText
    Left = 279
    Top = 120
    Width = 39
    Height = 17
    Caption = 'Debe   '
    TabOrder = 3
  end
  object StaticText4: TStaticText
    Left = 370
    Top = 120
    Width = 36
    Height = 17
    Caption = 'Haber '
    TabOrder = 4
  end
  object StaticText5: TStaticText
    Left = 449
    Top = 120
    Width = 87
    Height = 17
    Caption = 'Saldo Acumulado'
    TabOrder = 5
  end
  object wwDBEdit19: TwwDBEdit
    Left = 146
    Top = 392
    Width = 98
    Height = 21
    TabOrder = 6
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit20: TwwDBEdit
    Left = 251
    Top = 392
    Width = 93
    Height = 21
    TabOrder = 7
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit21: TwwDBEdit
    Left = 346
    Top = 392
    Width = 93
    Height = 21
    TabOrder = 8
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit22: TwwDBEdit
    Left = 442
    Top = 392
    Width = 96
    Height = 21
    TabOrder = 9
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit23: TwwDBEdit
    Left = 144
    Top = 152
    Width = 106
    Height = 21
    Color = clActiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit24: TwwDBEdit
    Left = 144
    Top = 168
    Width = 106
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit25: TwwDBEdit
    Left = 144
    Top = 184
    Width = 106
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit26: TwwDBEdit
    Left = 144
    Top = 216
    Width = 106
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit27: TwwDBEdit
    Left = 144
    Top = 200
    Width = 106
    Height = 16
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit28: TwwDBEdit
    Left = 144
    Top = 232
    Width = 106
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit29: TwwDBEdit
    Left = 144
    Top = 248
    Width = 106
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit30: TwwDBEdit
    Left = 144
    Top = 296
    Width = 106
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit31: TwwDBEdit
    Left = 144
    Top = 279
    Width = 106
    Height = 18
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 18
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit32: TwwDBEdit
    Left = 144
    Top = 264
    Width = 106
    Height = 16
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 19
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit33: TwwDBEdit
    Left = 144
    Top = 312
    Width = 106
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 20
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit34: TwwDBEdit
    Left = 144
    Top = 328
    Width = 106
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit35: TwwDBEdit
    Left = 144
    Top = 344
    Width = 106
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 22
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit36: TwwDBEdit
    Left = 144
    Top = 360
    Width = 106
    Height = 20
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 23
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit37: TwwDBEdit
    Left = 253
    Top = 152
    Width = 90
    Height = 21
    Color = clActiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 24
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit38: TwwDBEdit
    Left = 253
    Top = 168
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 25
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit39: TwwDBEdit
    Left = 253
    Top = 184
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 26
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit40: TwwDBEdit
    Left = 253
    Top = 216
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 27
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit41: TwwDBEdit
    Left = 253
    Top = 200
    Width = 90
    Height = 18
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 28
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit42: TwwDBEdit
    Left = 253
    Top = 232
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 29
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit43: TwwDBEdit
    Left = 253
    Top = 248
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 30
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit44: TwwDBEdit
    Left = 253
    Top = 296
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 31
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit45: TwwDBEdit
    Left = 253
    Top = 280
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 32
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit46: TwwDBEdit
    Left = 253
    Top = 264
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 33
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit47: TwwDBEdit
    Left = 253
    Top = 312
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 34
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit48: TwwDBEdit
    Left = 253
    Top = 328
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 35
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit49: TwwDBEdit
    Left = 253
    Top = 344
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 36
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit50: TwwDBEdit
    Left = 253
    Top = 360
    Width = 90
    Height = 20
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 37
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit51: TwwDBEdit
    Left = 348
    Top = 152
    Width = 90
    Height = 21
    Color = clActiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 38
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit52: TwwDBEdit
    Left = 348
    Top = 168
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 39
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit53: TwwDBEdit
    Left = 348
    Top = 184
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 40
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit54: TwwDBEdit
    Left = 348
    Top = 216
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 41
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit55: TwwDBEdit
    Left = 348
    Top = 200
    Width = 90
    Height = 17
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 42
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit56: TwwDBEdit
    Left = 348
    Top = 232
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 43
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit57: TwwDBEdit
    Left = 348
    Top = 248
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 44
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit58: TwwDBEdit
    Left = 348
    Top = 296
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 45
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit59: TwwDBEdit
    Left = 348
    Top = 280
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 46
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit60: TwwDBEdit
    Left = 348
    Top = 264
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 47
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit61: TwwDBEdit
    Left = 348
    Top = 312
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 48
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit62: TwwDBEdit
    Left = 348
    Top = 328
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 49
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit63: TwwDBEdit
    Left = 348
    Top = 344
    Width = 90
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 50
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit64: TwwDBEdit
    Left = 348
    Top = 360
    Width = 90
    Height = 20
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 51
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit65: TwwDBEdit
    Left = 441
    Top = 152
    Width = 98
    Height = 21
    Color = clActiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 52
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit66: TwwDBEdit
    Left = 441
    Top = 168
    Width = 98
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 53
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit67: TwwDBEdit
    Left = 441
    Top = 184
    Width = 98
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 54
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit68: TwwDBEdit
    Left = 441
    Top = 216
    Width = 98
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 55
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit69: TwwDBEdit
    Left = 441
    Top = 200
    Width = 98
    Height = 19
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 56
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit70: TwwDBEdit
    Left = 441
    Top = 232
    Width = 98
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 57
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit71: TwwDBEdit
    Left = 441
    Top = 248
    Width = 98
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 58
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit72: TwwDBEdit
    Left = 441
    Top = 296
    Width = 98
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 59
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit73: TwwDBEdit
    Left = 441
    Top = 280
    Width = 98
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 60
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit74: TwwDBEdit
    Left = 441
    Top = 264
    Width = 98
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 61
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit75: TwwDBEdit
    Left = 441
    Top = 312
    Width = 98
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 62
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit76: TwwDBEdit
    Left = 441
    Top = 328
    Width = 98
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 63
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit77: TwwDBEdit
    Left = 441
    Top = 344
    Width = 98
    Height = 21
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 64
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit78: TwwDBEdit
    Left = 441
    Top = 360
    Width = 98
    Height = 20
    Color = clActiveBorder
    DataSource = DM1.dsRMayor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clActiveCaption
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 65
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit5: TwwDBEdit
    Left = 8
    Top = 152
    Width = 130
    Height = 18
    TabOrder = 66
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit6: TwwDBEdit
    Left = 8
    Top = 168
    Width = 130
    Height = 17
    TabOrder = 67
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit7: TwwDBEdit
    Left = 8
    Top = 184
    Width = 130
    Height = 21
    TabOrder = 68
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit8: TwwDBEdit
    Left = 8
    Top = 200
    Width = 130
    Height = 17
    TabOrder = 69
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit9: TwwDBEdit
    Left = 8
    Top = 216
    Width = 130
    Height = 16
    TabOrder = 70
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit10: TwwDBEdit
    Left = 8
    Top = 231
    Width = 130
    Height = 17
    TabOrder = 71
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit11: TwwDBEdit
    Left = 8
    Top = 248
    Width = 130
    Height = 21
    TabOrder = 72
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit12: TwwDBEdit
    Left = 8
    Top = 264
    Width = 130
    Height = 21
    TabOrder = 73
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit13: TwwDBEdit
    Left = 8
    Top = 279
    Width = 130
    Height = 21
    TabOrder = 74
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit14: TwwDBEdit
    Left = 8
    Top = 296
    Width = 130
    Height = 18
    TabOrder = 75
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit15: TwwDBEdit
    Left = 8
    Top = 313
    Width = 130
    Height = 17
    TabOrder = 76
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit16: TwwDBEdit
    Left = 8
    Top = 330
    Width = 130
    Height = 16
    TabOrder = 77
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit17: TwwDBEdit
    Left = 8
    Top = 346
    Width = 130
    Height = 17
    TabOrder = 78
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object wwDBEdit18: TwwDBEdit
    Left = 8
    Top = 362
    Width = 130
    Height = 18
    TabOrder = 79
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
end
