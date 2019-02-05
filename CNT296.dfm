object FRendicion: TFRendicion
  Left = 288
  Top = 356
  Width = 575
  Height = 160
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Rendici'#243'n'
  Color = clBtnFace
  Constraints.MaxHeight = 160
  Constraints.MaxWidth = 575
  Constraints.MinHeight = 160
  Constraints.MinWidth = 575
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
  object Label1: TLabel
    Left = 25
    Top = 29
    Width = 49
    Height = 16
    Caption = 'Cuenta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 125
    Top = 29
    Width = 89
    Height = 16
    Caption = 'Observaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 387
    Top = 29
    Width = 53
    Height = 16
    Caption = 'Importe'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 472
    Top = 29
    Width = 71
    Height = 16
    Caption = 'Rendici'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbeImporte: TwwDBEdit
    Left = 376
    Top = 48
    Width = 80
    Height = 21
    Color = clInfoBk
    DataField = 'IMPORTE'
    DataSource = DMCNT.dsLiqDet
    ReadOnly = True
    TabOrder = 2
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeObser: TwwDBEdit
    Left = 109
    Top = 48
    Width = 254
    Height = 21
    Color = clInfoBk
    DataField = 'OBSERVACION'
    DataSource = DMCNT.dsLiqDet
    ReadOnly = True
    TabOrder = 0
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeCuenta: TwwDBEdit
    Left = 16
    Top = 48
    Width = 80
    Height = 21
    Color = clInfoBk
    DataField = 'CUENTA'
    DataSource = DMCNT.dsLiqDet
    ReadOnly = True
    TabOrder = 1
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object dbeRendicion: TwwDBEdit
    Left = 469
    Top = 48
    Width = 80
    Height = 21
    DataField = 'RENDICION'
    DataSource = DMCNT.dsLiqDet
    TabOrder = 3
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object BitBtn1: TBitBtn
    Left = 390
    Top = 94
    Width = 75
    Height = 25
    Caption = 'Grabar'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 474
    Top = 94
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = BitBtn2Click
  end
end
