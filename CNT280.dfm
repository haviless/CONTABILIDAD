object FPlanilla: TFPlanilla
  Left = 259
  Top = 150
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Transferir Asientos de Planillas a Contabilidad'
  ClientHeight = 520
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 629
    Top = 486
    Width = 74
    Height = 19
    Caption = 'Versi'#243'n 2.0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 2
    Top = 244
    Width = 727
    Height = 4
  end
  object Label2: TLabel
    Left = 125
    Top = 6
    Width = 234
    Height = 23
    Caption = 'Cabecera de Asiento Contable'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 125
    Top = 269
    Width = 217
    Height = 23
    Caption = 'Detalle de Asiento Contable'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 487
    Top = 10
    Width = 58
    Height = 16
    Caption = 'Registros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 487
    Top = 274
    Width = 58
    Height = 16
    Caption = 'Registros'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object dbgCab: TwwDBGrid
    Left = 11
    Top = 36
    Width = 705
    Height = 185
    DisableThemesInTitle = False
    Selected.Strings = (
      'CIAID'#9'4'#9'C'#237'a'
      'CNTANOMM'#9'7'#9'Periodo'
      'TDIARID'#9'5'#9'Origen'
      'CNTCOMPROB'#9'11'#9'Comprobante'
      'CNTFCOMP'#9'11'#9'Fecha'
      'CNTGLOSA'#9'20'#9'Glosa'
      'TMONID'#9'2'#9'TM'
      'CNTDEBEMN'#9'10'#9'Debe~MN'
      'CNTHABEMN'#9'10'#9'Haber~MN'
      'MODULO'#9'6'#9'Modulo')
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = dsPlanilla
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
  end
  object dbgDet: TwwDBGrid
    Left = 11
    Top = 299
    Width = 705
    Height = 188
    DisableThemesInTitle = False
    Selected.Strings = (
      'CIAID'#9'4'#9'C'#237'a'
      'CNTANOMM'#9'7'#9'Periodo'
      'TDIARID'#9'5'#9'Origen'
      'CNTCOMPROB'#9'11'#9'Comprobante'
      'CNTREG'#9'4'#9'Item'
      'CUENTAID'#9'12'#9'Cuenta'
      'CLAUXID'#9'3'#9'Cl.~Aux'
      'AUXID'#9'6'#9'Auxiliar'
      'CNTGLOSA'#9'25'#9'Glosa'
      'CCOSID'#9'9'#9'Centro~Costo'
      'CNTDH'#9'3'#9'D/H'
      'TMONID'#9'2'#9'TM'
      'CNTDEBEMN'#9'10'#9'Debe'
      'CNTHABEMN'#9'10'#9'Haber'
      'DOCID'#9'3'#9'DOC~Id.'
      'CNTSERIE'#9'4'#9'DOC~Serie'
      'CNTNODOC'#9'12'#9'DOC~N'#250'mero'
      'CNTFEMIS'#9'10'#9'Fecha~Emisi'#243'n'
      'CNTFVCMTO'#9'10'#9'Fecha~Vcmto.')
    IniAttributes.Delimiter = ';;'
    TitleColor = 7566265
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = dsPlanDet
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
  end
  object BitBtn8: TBitBtn
    Left = 10
    Top = 5
    Width = 98
    Height = 25
    Caption = 'Ver CNT300'
    TabOrder = 2
    OnClick = BitBtn8Click
  end
  object BitBtn10: TBitBtn
    Left = 617
    Top = 5
    Width = 98
    Height = 25
    Caption = 'Transferir CNT300'
    TabOrder = 3
    OnClick = BitBtn10Click
  end
  object BitBtn9: TBitBtn
    Left = 10
    Top = 268
    Width = 98
    Height = 25
    Caption = 'Ver CNT301'
    TabOrder = 4
    OnClick = BitBtn9Click
  end
  object BitBtn11: TBitBtn
    Left = 617
    Top = 268
    Width = 98
    Height = 25
    Caption = 'Transferir CNT301'
    TabOrder = 5
    OnClick = BitBtn11Click
  end
  object meRegCab: TMaskEdit
    Left = 551
    Top = 7
    Width = 50
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Text = '0'
  end
  object meRegDet: TMaskEdit
    Left = 551
    Top = 270
    Width = 50
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    Text = '0'
  end
  object cdsPlanilla: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 252
    Top = 128
  end
  object dsPlanilla: TwwDataSource
    DataSet = cdsPlanilla
    Left = 292
    Top = 128
  end
  object cdsPlanDet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 252
    Top = 353
  end
  object dsPlanDet: TwwDataSource
    DataSet = cdsPlanDet
    Left = 300
    Top = 353
  end
  object sdGraba300: TSaveDialog
    DefaultExt = 'dat'
    FileName = 'c:\oaEjecuta\CNT300*.dat'
    Filter = '*.DAT  ( Archivo CDS )|*.dat|*.*   ( Todos )|*.*'
    Title = 'Cabecera de Contabilidad'
    Left = 214
    Top = 128
  end
  object sdGraba301: TSaveDialog
    DefaultExt = 'dat'
    FileName = 'c:\oaEjecuta\CNT301*.dat'
    Filter = '*.DAT  ( Archivo CDS )|*.dat|*.*   ( Todos )|*.*'
    Title = 'Detalle de Contabilidad'
    Left = 206
    Top = 353
  end
end
