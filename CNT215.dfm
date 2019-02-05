object FEncinas: TFEncinas
  Left = 266
  Top = 256
  Width = 640
  Height = 420
  Caption = 'Encinas'
  Color = clBtnFace
  Constraints.MaxHeight = 420
  Constraints.MaxWidth = 640
  Constraints.MinHeight = 420
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 36
    Top = 9
    Width = 41
    Height = 19
    Caption = 'Origen'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 368
    Width = 25
    Height = 13
    Caption = 'V.1.7'
  end
  object dbetdiario: TwwDBEdit
    Left = 71
    Top = 37
    Width = 187
    Height = 27
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object gbPer: TGroupBox
    Left = 295
    Top = 8
    Width = 161
    Height = 65
    Caption = 'Periodo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object speAno: TSpinEdit
      Left = 22
      Top = 24
      Width = 59
      Height = 29
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      MaxLength = 4
      MaxValue = 2100
      MinValue = 2007
      ParentFont = False
      TabOrder = 0
      Value = 2007
    end
    object speMM: TSpinEdit
      Left = 98
      Top = 24
      Width = 43
      Height = 29
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      MaxLength = 2
      MaxValue = 13
      MinValue = 0
      ParentFont = False
      TabOrder = 1
      Value = 12
    end
  end
  object dbeOrigen: TwwDBEdit
    Left = 32
    Top = 37
    Width = 35
    Height = 27
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object BitBtn1: TBitBtn
    Left = 488
    Top = 33
    Width = 75
    Height = 33
    Caption = 'Filtra'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object dbgData: TwwDBGrid
    Left = 13
    Top = 85
    Width = 604
    Height = 245
    DisableThemesInTitle = False
    Selected.Strings = (
      'FACPAG'#9'11'#9'Fecha~Emisi'#243'n'#9#9
      'NUMDOCPAG'#9'16'#9'N'#250'mero'#9#9
      'TMONID'#9'3'#9'T.M.'#9#9
      'IMPORTE'#9'08'#9'Importe'#9#9
      'RUCDNI'#9'10'#9'RUC/DNI'#9#9
      'NOMBRE'#9'40'#9'Nombre~Raz'#243'n Social'#9#9)
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    TabOrder = 4
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
  end
  object BitBtn2: TBitBtn
    Left = 456
    Top = 345
    Width = 83
    Height = 33
    Caption = 'Contabiliza'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 544
    Top = 345
    Width = 75
    Height = 33
    Caption = 'Filtra'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtn1Click
  end
end
