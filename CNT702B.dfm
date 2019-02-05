object fDevengadoSeg: TfDevengadoSeg
  Left = 275
  Top = 84
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Movimientos de Devengados de Seguros'
  ClientHeight = 594
  ClientWidth = 943
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel
    Left = 705
    Top = 78
    Width = 68
    Height = 13
    Caption = 'Monto Local : '
  end
  object sbDiseno: TSpeedButton
    Left = 19
    Top = 565
    Width = 7
    Height = 22
    Flat = True
    OnClick = sbDisenoClick
  end
  object btnCancela: TfcShapeBtn
    Left = 831
    Top = 559
    Width = 105
    Height = 26
    Hint = 'Salir'
    Caption = 'Salir'
    Color = clBtnFace
    DitherColor = clWhite
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
    Options = [boFocusable]
    ParentClipping = True
    ParentShowHint = False
    RoundRectBias = 25
    ShadeStyle = fbsHighlight
    ShowHint = True
    TabOrder = 0
    TabStop = True
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    OnClick = btnCancelaClick
  end
  object gbPreCab: TGroupBox
    Left = 16
    Top = 16
    Width = 921
    Height = 169
    Caption = 'Provisi'#243'n por Pagar de Seguros'
    Color = cl3DLight
    Enabled = False
    ParentColor = False
    TabOrder = 1
    object Label9: TLabel
      Left = 72
      Top = 30
      Width = 24
      Height = 13
      Caption = 'Cia : '
    end
    object Label2: TLabel
      Left = 418
      Top = 29
      Width = 60
      Height = 13
      Caption = 'Tipo Diario : '
    end
    object Label4: TLabel
      Left = 228
      Top = 30
      Width = 45
      Height = 13
      Caption = 'Periodo : '
    end
    object Label5: TLabel
      Left = 715
      Top = 29
      Width = 44
      Height = 13
      Caption = 'N'#176' Reg : '
    end
    object Label6: TLabel
      Left = 71
      Top = 69
      Width = 37
      Height = 13
      Caption = 'TMon : '
    end
    object Label7: TLabel
      Left = 70
      Top = 108
      Width = 40
      Height = 13
      Caption = 'TCamb :'
    end
    object Label8: TLabel
      Left = 228
      Top = 69
      Width = 37
      Height = 13
      Caption = 'M.Orig :'
    end
    object Label10: TLabel
      Left = 419
      Top = 69
      Width = 47
      Height = 13
      Caption = 'M.Local : '
    end
    object Label13: TLabel
      Left = 715
      Top = 69
      Width = 36
      Height = 13
      Caption = 'M.Ext : '
    end
    object Label15: TLabel
      Left = 228
      Top = 107
      Width = 52
      Height = 13
      Caption = 'Cod. Aux. :'
    end
    object Label17: TLabel
      Left = 418
      Top = 106
      Width = 71
      Height = 13
      Caption = 'Nombre Prov : '
    end
    object Label23: TLabel
      Left = 70
      Top = 145
      Width = 101
      Height = 13
      Caption = 'Fecha Inicio Seguro :'
    end
    object Label24: TLabel
      Left = 274
      Top = 144
      Width = 90
      Height = 13
      Caption = 'Fecha Fin Seguro :'
    end
    object dbePeriodo: TEdit
      Left = 290
      Top = 26
      Width = 89
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object dbeRegistro: TwwDBEdit
      Left = 768
      Top = 23
      Width = 89
      Height = 21
      DataField = 'CPNOREG'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeTCambio: TwwDBEdit
      Left = 133
      Top = 104
      Width = 59
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      DataField = 'CPTCAMPR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeMO: TEdit
      Left = 290
      Top = 63
      Width = 87
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object dbeML: TEdit
      Left = 500
      Top = 63
      Width = 61
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object dbeME: TEdit
      Left = 769
      Top = 63
      Width = 90
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object dbeCAux: TEdit
      Left = 290
      Top = 101
      Width = 87
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object dbeNomProv: TEdit
      Left = 499
      Top = 97
      Width = 360
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 40
      ParentFont = False
      TabOrder = 7
    end
    object dbeCIA: TwwDBEdit
      Left = 133
      Top = 25
      Width = 59
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      DataField = 'CPTCAMPR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeTMoneda: TwwDBEdit
      Left = 133
      Top = 62
      Width = 59
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      DataField = 'CPTCAMPR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeTDiario: TwwDBEdit
      Left = 501
      Top = 24
      Width = 59
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      DataField = 'CPTCAMPR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeFecIni: TwwDBEdit
      Left = 179
      Top = 141
      Width = 78
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      DataField = 'FECINIVIG'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeFecFin: TwwDBEdit
      Left = 374
      Top = 141
      Width = 83
      Height = 21
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      DataField = 'FECFINVIG'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object gbPreDet: TGroupBox
    Left = 16
    Top = 192
    Width = 473
    Height = 265
    Caption = 'Detalle de la Provisi'#243'n por Pagar'
    Color = cl3DLight
    ParentColor = False
    TabOrder = 2
    object dbgDevengadoSeg1: TwwDBGrid
      Left = 6
      Top = 24
      Width = 459
      Height = 233
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      OnRowChanged = dbgDevengadoSeg1RowChanged
      FixedCols = 0
      ShowHorzScrollBar = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgDevengadoSeg1DblClick
      FooterHeight = -1
    end
  end
  object GroupBox3: TGroupBox
    Left = 496
    Top = 192
    Width = 441
    Height = 361
    Caption = 'Detalle de la Provisi'#243'n por Pagar'
    Color = cl3DLight
    ParentColor = False
    TabOrder = 3
    object Label16: TLabel
      Left = 217
      Top = 23
      Width = 55
      Height = 13
      Caption = 'Concepto : '
    end
    object Label3: TLabel
      Left = 7
      Top = 55
      Width = 36
      Height = 13
      Caption = 'Glosa : '
    end
    object Label14: TLabel
      Left = 8
      Top = 84
      Width = 34
      Height = 13
      Caption = 'P'#243'liza :'
    end
    object Label1: TLabel
      Left = 7
      Top = 25
      Width = 28
      Height = 13
      Caption = 'A'#241'o : '
    end
    object Label20: TLabel
      Left = 117
      Top = 23
      Width = 26
      Height = 13
      Caption = 'Mes :'
    end
    object pnlNroDev: TPanel
      Left = 349
      Top = 7
      Width = 89
      Height = 104
      Align = alCustom
      Color = clInfoBk
      Enabled = False
      TabOrder = 0
      object Label18: TLabel
        Left = 13
        Top = 7
        Width = 15
        Height = 13
        Caption = 'N'#176
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 12
        Top = 22
        Width = 66
        Height = 13
        Caption = 'Devengado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEstado: TLabel
        Left = 8
        Top = 80
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbeNroDev: TEdit
        Left = 13
        Top = 40
        Width = 65
        Height = 21
        TabOrder = 0
      end
    end
    object dbgDevengadoSeg2: TwwDBGrid
      Left = 3
      Top = 112
      Width = 435
      Height = 209
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgDevengadoSeg2DblClick
      FooterHeight = -1
    end
    object dbeCptoDev: TEdit
      Left = 274
      Top = 17
      Width = 65
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object dbeGlosaDev: TEdit
      Left = 48
      Top = 46
      Width = 291
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object dbePolDev: TEdit
      Left = 49
      Top = 76
      Width = 65
      Height = 21
      Enabled = False
      TabOrder = 4
    end
    object edtano: TwwDBSpinEdit
      Left = 47
      Top = 16
      Width = 58
      Height = 24
      Increment = 1.000000000000000000
      MaxValue = 3000.000000000000000000
      MinValue = 2016.000000000000000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      UnboundDataType = wwDefault
    end
    object edtMes: TwwDBSpinEdit
      Left = 150
      Top = 16
      Width = 58
      Height = 24
      Increment = 1.000000000000000000
      MaxValue = 12.000000000000000000
      MinValue = 1.000000000000000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      UnboundDataType = wwDefault
      OnChange = edtMesChange
    end
    object btnGrabar: TBitBtn
      Left = 373
      Top = 320
      Width = 27
      Height = 32
      Hint = 'Devengar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btnGrabarClick
      Glyph.Data = {
        8A010000424D8A01000000000000760000002800000017000000170000000100
        04000000000014010000CE0E0000D80E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333303000077777777777770003300000078888888888880000300000
        0780088888888800003000000780088888888800003000000780088888888800
        0030000007888888888888000030000000000000000000000030000000000000
        0000000000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF00
        00300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFF
        FFFFFF0000300000FFFFFFFFFFFFFF0000300000FFFFFFFFFFFFFF0000300000
        FFFFFFFFFFFFFF07703000009999999999999907703000009999999999999900
        0030300099999999999999000330}
    end
    object bbtnExcelMes: TBitBtn
      Left = 6
      Top = 326
      Width = 107
      Height = 27
      Hint = 'Imp Devengado Mens'
      Caption = 'Mensual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = bbtnExcelMesClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000DD00000000006660DD08888880E00
        000DD000000000EEE080DD07778E0EEE0080DDD078E0EEE07700DDDD0E0EEE00
        0000DDD0E0EEE080DDDDDD0E0EEE07080DDDD0E0EEE0777080DD0E0EEE0D0777
        080D00EEE0DDD077700D00000DDDDD00000DDDDDDDDDDDDDDDDD}
    end
    object bbtnExcelAcum: TBitBtn
      Left = 172
      Top = 326
      Width = 107
      Height = 27
      Hint = 'Imp Acum'
      Caption = 'Acumulado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = bbtnExcelAcumClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000DD00000000006660DD08888880E00
        000DD000000000EEE080DD07778E0EEE0080DDD078E0EEE07700DDDD0E0EEE00
        0000DDD0E0EEE080DDDDDD0E0EEE07080DDDD0E0EEE0777080DD0E0EEE0D0777
        080D00EEE0DDD077700D00000DDDDD00000DDDDDDDDDDDDDDDDD}
    end
    object btnContabiliza: TBitBtn
      Left = 408
      Top = 322
      Width = 28
      Height = 31
      Hint = 'Contabilizar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = btnContabilizaClick
      Glyph.Data = {
        06020000424D060200000000000076000000280000001A000000190000000100
        04000000000090010000CE0E0000D80E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888800000080000000000000000000000008000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000BBBBBB
        BBBBBBBBB00000000000000000000000000000000000000000000000BBBBBBBB
        BBBBBBBBBBB00000000000000000000000000000000000000000000000000000
        0000000000000000000000BBBB0BBB0B0B0B0BBB0BBB0000000000B00B0B0B0B
        0B0B0B0B0B0B0000000000B00B0B0B0B0B0B0BBB0B0B0000000000B0000B0B0B
        0B0B000B0B0B0000000000B0000BBB0BBB0B0BBB0BBB0000000000B000000000
        000B00000B000000000000B00B00000000BBB0000B000000000000BBBB000000
        000B000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000080000000000000000000000008000000888888888888
        88888888888888000000}
    end
    object gbPeriodoCnt: TGroupBox
      Left = 120
      Top = 65
      Width = 219
      Height = 44
      Caption = 'Periodo Contable'
      Color = clMoneyGreen
      ParentColor = False
      TabOrder = 11
      object Label25: TLabel
        Left = 15
        Top = 25
        Width = 28
        Height = 13
        Caption = 'A'#241'o : '
      end
      object Label26: TLabel
        Left = 124
        Top = 25
        Width = 26
        Height = 13
        Caption = 'Mes :'
      end
      object edtanocnt: TwwDBSpinEdit
        Left = 55
        Top = 14
        Width = 58
        Height = 24
        Increment = 1.000000000000000000
        MaxValue = 3000.000000000000000000
        MinValue = 2016.000000000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object edtmescnt: TwwDBSpinEdit
        Left = 157
        Top = 14
        Width = 58
        Height = 24
        Increment = 1.000000000000000000
        MaxValue = 12.000000000000000000
        MinValue = 1.000000000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        OnChange = edtMesChange
      end
    end
  end
  object pnlEdtMontoDev: TPanel
    Left = 540
    Top = 342
    Width = 372
    Height = 121
    BevelInner = bvLowered
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 14869218
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
    object Label11: TLabel
      Left = 27
      Top = 30
      Width = 53
      Height = 13
      Caption = 'C.Costo :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTitulo1: TLabel
      Left = 3
      Top = 3
      Width = 362
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = 'Editar Monto a Devengar'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label21: TLabel
      Left = 26
      Top = 62
      Width = 84
      Height = 13
      Caption = 'Observaci'#243'n : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 231
      Top = 29
      Width = 48
      Height = 13
      Caption = 'Monto : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bbtnOk1: TBitBtn
      Left = 330
      Top = 82
      Width = 30
      Height = 25
      TabOrder = 0
      OnClick = bbtnOk1Click
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
    object edtObservacion: TEdit
      Left = 111
      Top = 55
      Width = 250
      Height = 24
      TabOrder = 1
    end
    object btnSalir: TBitBtn
      Left = 350
      Top = 2
      Width = 15
      Height = 17
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnSalirClick
    end
    object edtCCosto: TEdit
      Left = 87
      Top = 23
      Width = 64
      Height = 24
      Enabled = False
      TabOrder = 3
    end
    object edtMonto: TEdit
      Left = 283
      Top = 22
      Width = 77
      Height = 24
      TabOrder = 4
    end
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 464
    Width = 473
    Height = 89
    Caption = 'Devengado Acumulado'
    Color = cl3DLight
    ParentColor = False
    TabOrder = 5
    object dbgDevengadoSeg3: TwwDBGrid
      Left = 6
      Top = 24
      Width = 459
      Height = 57
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      FooterHeight = -1
    end
  end
  object cbDiseno: TCheckBox
    Left = 176
    Top = 568
    Width = 15
    Height = 17
    TabOrder = 6
    Visible = False
  end
  object bbtnImprimeMensual: TBitBtn
    Left = 611
    Top = 518
    Width = 32
    Height = 27
    Hint = 'Imprimir Reporte Mensual'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = bbtnImprimeMensualClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object bbtnImprimeAcumulado: TBitBtn
    Left = 777
    Top = 520
    Width = 32
    Height = 25
    Hint = 'Imprimir Reporte Acumulado'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = bbtnImprimeAcumuladoClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object ppDBReporte1: TppDBPipeline
    UserName = 'DBPipeline1'
    Left = 336
    Top = 560
  end
  object pprReporte: TppReport
    AutoStop = False
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rResumen'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\DemaExes\RTMS\CNT\Dema\DevengueMensual.rtm'
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 368
    Top = 560
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 53975
      mmPrintPosition = 0
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'RESUMEN DEL REI DE LAS CUENTAS NO MONETARIAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 36248
        mmTop = 21960
        mmWidth = 112977
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = '(EXPRESADO EN NUEVOS SOLES)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 59796
        mmTop = 34396
        mmWidth = 53181
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'CUENTA CONTABLE '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 25400
        mmTop = 46302
        mmWidth = 33073
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'DEBE '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 124619
        mmTop = 46302
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'HABER'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 146315
        mmTop = 46302
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'Fecha : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 162190
        mmTop = 6350
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'Fecha : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 162190
        mmTop = 11377
        mmWidth = 10848
        BandType = 0
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable10'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 174361
        mmTop = 6615
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable11: TppSystemVariable
        UserName = 'SystemVariable11'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 174361
        mmTop = 11377
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'PERIODO : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 62442
        mmTop = 29104
        mmWidth = 16404
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CCOSID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 42863
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CCOSDES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 66940
        mmTop = 1588
        mmWidth = 49213
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'SOLES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 130175
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 25929
      mmPrintPosition = 0
      object ppLine16: TppLine
        UserName = 'Line16'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 116152
        mmTop = 794
        mmWidth = 45244
        BandType = 7
      end
      object pplblctarei: TppLabel
        UserName = 'lblctarei'
        Caption = 'lblctarei'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 16669
        mmTop = 9260
        mmWidth = 12171
        BandType = 7
      end
      object pplblreides: TppLabel
        UserName = 'lblreides'
        Caption = 'lblreides'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 35190
        mmTop = 9260
        mmWidth = 12700
        BandType = 7
      end
      object pplbldeberei: TppLabel
        UserName = 'lbldeberei'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 117211
        mmTop = 9260
        mmWidth = 17198
        BandType = 7
      end
      object pplblhaberei: TppLabel
        UserName = 'lblhaberei'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 141817
        mmTop = 9260
        mmWidth = 17198
        BandType = 7
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 116152
        mmTop = 14288
        mmWidth = 45244
        BandType = 7
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'Label39'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 123561
        mmTop = 15610
        mmWidth = 10848
        BandType = 7
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'Label40'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 148167
        mmTop = 15610
        mmWidth = 10848
        BandType = 7
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 116152
        mmTop = 20638
        mmWidth = 45244
        BandType = 7
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 116152
        mmTop = 21431
        mmWidth = 45244
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 400
    Top = 560
  end
  object ppDBReporte2: TppDBPipeline
    UserName = 'DBPipeline2'
    Left = 304
    Top = 560
  end
  object ppDBReporte3: TppDBPipeline
    UserName = 'DBPipeline3'
    Left = 272
    Top = 560
  end
  object pprBalComprobUnaMoneda: TppReport
    AutoStop = False
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 11000
    PrinterSetup.mmMarginLeft = 2350
    PrinterSetup.mmMarginRight = 2350
    PrinterSetup.mmMarginTop = 3000
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 378000
    PrinterSetup.PaperSize = 256
    Template.FileName = 'C:\SolExes\SOLFormatos\Cnt\DEMA\BalGeneral'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 31
    Top = 154
    Version = '7.02'
    mmColumnWidth = 0
  end
  object ppReport1: TppReport
    AutoStop = False
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rResumen'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\DemaExes\RTMs\CNT\Dema\DevengueMensual.rtm'
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 368
    Top = 560
    Version = '7.02'
    mmColumnWidth = 0
    object ppParameterList2: TppParameterList
    end
  end
  object ppReport2: TppReport
    AutoStop = False
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rResumen'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\DemaExes\RTMs\CNT\Dema\DevengueMensual.rtm'
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 368
    Top = 560
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39158
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label37'
        Caption = 'Fecha : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 162190
        mmTop = 6350
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label38'
        Caption = 'Fecha : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 162190
        mmTop = 11377
        mmWidth = 10848
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable10'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 174361
        mmTop = 6615
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable11'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 174361
        mmTop = 11377
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label43'
        Caption = 'PERIODO : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 10319
        mmWidth = 16404
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CPTODES'
        DataPipeline = ppDBReporte1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBReporte1'
        mmHeight = 5556
        mmLeft = 1058
        mmTop = 2381
        mmWidth = 39423
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'FACT. N:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 1058
        mmTop = 15875
        mmWidth = 14097
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label2'
        Caption = 'P'#211'LIZA N'#176':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 1058
        mmTop = 21167
        mmWidth = 18161
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        Caption = 'DATOS DE LA PROVISI'#211'N'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 1058
        mmTop = 26723
        mmWidth = 52663
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label4'
        Caption = 'CIAID : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 1058
        mmTop = 33338
        mmWidth = 12277
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label5'
        Caption = 'TDIARID : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 23019
        mmTop = 33338
        mmWidth = 17018
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label6'
        Caption = 'PERIODO: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 51065
        mmTop = 33338
        mmWidth = 18161
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label7'
        Caption = 'NREG: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 89429
        mmTop = 33338
        mmWidth = 12107
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CIAID'
        DataPipeline = ppDBReporte4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBReporte4'
        mmHeight = 3969
        mmLeft = 14552
        mmTop = 33338
        mmWidth = 6615
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'TDIARID'
        DataPipeline = ppDBReporte4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBReporte4'
        mmHeight = 3969
        mmLeft = 41540
        mmTop = 33338
        mmWidth = 7673
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PERIODO'
        DataPipeline = ppDBReporte4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBReporte4'
        mmHeight = 3969
        mmLeft = 70115
        mmTop = 33338
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'NREG'
        DataPipeline = ppDBReporte4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBReporte4'
        mmHeight = 3969
        mmLeft = 102923
        mmTop = 33338
        mmWidth = 20638
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'ANOI'
        DataPipeline = ppDBReporte2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBReporte2'
        mmHeight = 3969
        mmLeft = 18785
        mmTop = 10583
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label8'
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 28840
        mmTop = 10583
        mmWidth = 1185
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'ANOF'
        DataPipeline = ppDBReporte2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBReporte2'
        mmHeight = 3969
        mmLeft = 30956
        mmTop = 10583
        mmWidth = 10319
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'FACT'
        DataPipeline = ppDBReporte4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBReporte4'
        mmHeight = 3969
        mmLeft = 18521
        mmTop = 15875
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'POLIZA'
        DataPipeline = ppDBReporte4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBReporte4'
        mmHeight = 3969
        mmLeft = 20638
        mmTop = 21167
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText13: TppDBText
        UserName = 'DBText1'
        DataField = 'CCOSID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 42863
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText2'
        DataField = 'CCOSDES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 66940
        mmTop = 1588
        mmWidth = 49213
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText3'
        DataField = 'SOLES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 130175
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 25929
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line16'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 116152
        mmTop = 794
        mmWidth = 45244
        BandType = 7
      end
      object ppLabel12: TppLabel
        UserName = 'lblctarei'
        Caption = 'lblctarei'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 16669
        mmTop = 9260
        mmWidth = 12171
        BandType = 7
      end
      object ppLabel13: TppLabel
        UserName = 'lblreides'
        Caption = 'lblreides'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 35190
        mmTop = 9260
        mmWidth = 12700
        BandType = 7
      end
      object ppLabel14: TppLabel
        UserName = 'lbldeberei'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 117211
        mmTop = 9260
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel15: TppLabel
        UserName = 'lblhaberei'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 141817
        mmTop = 9260
        mmWidth = 17198
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line17'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 116152
        mmTop = 14288
        mmWidth = 45244
        BandType = 7
      end
      object ppLabel16: TppLabel
        UserName = 'Label39'
        Caption = 'Label39'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 123561
        mmTop = 15610
        mmWidth = 10848
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label40'
        Caption = 'Label40'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 148167
        mmTop = 15610
        mmWidth = 10848
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line18'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 116152
        mmTop = 20638
        mmWidth = 45244
        BandType = 7
      end
      object ppLine4: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 116152
        mmTop = 21431
        mmWidth = 45244
        BandType = 7
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
  object ppDBReporte4: TppDBPipeline
    UserName = 'DBPipeline4'
    Left = 240
    Top = 560
  end
  object ppReport3: TppReport
    AutoStop = False
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rResumen'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\DemaExes\RTMs\CNT\Dema\DevengueAcumulado.rtm'
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 368
    Top = 560
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object daDataModule1: TdaDataModule
    end
    object ppParameterList4: TppParameterList
    end
  end
  object ppDBReporte5: TppDBPipeline
    UserName = 'DBPipeline5'
    Left = 208
    Top = 560
  end
  object ppDBReporte6: TppDBPipeline
    UserName = 'DBPipeline6'
    Left = 136
    Top = 560
  end
  object ppDBReporte7: TppDBPipeline
    UserName = 'DBPipeline7'
    Left = 104
    Top = 560
  end
end
