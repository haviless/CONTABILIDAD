object FLibroDiarioPLE: TFLibroDiarioPLE
  Left = 82
  Top = 131
  Width = 740
  Height = 509
  Caption = 'Libro Diario - PLE'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAdvertencias: TPanel
    Left = 0
    Top = 0
    Width = 719
    Height = 466
    ParentBackground = False
    TabOrder = 0
    TabStop = True
    object Shape15: TShape
      Left = 1
      Top = 1
      Width = 717
      Height = 24
      Align = alTop
      Brush.Color = clMoneyGreen
      Pen.Style = psClear
    end
    object Label48: TLabel
      Left = 16
      Top = 4
      Width = 142
      Height = 20
      Caption = 'PLE - Libro Diario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Shape16: TShape
      Left = 1
      Top = 431
      Width = 717
      Height = 34
      Align = alBottom
      Brush.Color = clMoneyGreen
      Pen.Style = psClear
    end
    object bbtnTextoPLE: TBitBtn
      Left = 6
      Top = 434
      Width = 85
      Height = 28
      Caption = 'Texto - PLE'
      TabOrder = 0
      OnClick = bbtnTextoPLEClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 632
      Top = 434
      Width = 85
      Height = 28
      Caption = 'Salir'
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
    end
    object pbExp: TProgressBar
      Left = 282
      Top = 440
      Width = 161
      Height = 16
      TabOrder = 2
    end
    object dbgLibroDiario: TwwDBGrid
      Left = 6
      Top = 33
      Width = 707
      Height = 395
      DisableThemesInTitle = False
      PictureMasks.Strings = (
        'DEBE'#9'###,###,###.0#'#9'T'#9'T'
        'HABER'#9'###,###,###.0#'#9'T'#9'T'
        'SALDODEBE'#9'###,###,###.0#'#9'T'#9'T'
        'SALDOHABE'#9'###,###,###.0#'#9'T'#9'T')
      Selected.Strings = (
        'CUENTA'#9'2'#9'CUENTA'#9#9
        'DESCRIPCION'#9'30'#9'DESCRIPCION'#9#9
        'DEBECNT401'#9'18'#9'DEBE'#9'F'#9'Debe/Haber  -  Saldos'
        'HABECNT401'#9'18'#9'HABER'#9'F'#9'Debe/Haber  -  Saldos'
        'DEBECNT301'#9'18'#9'DEBE'#9'F'#9'PLE  -  Libro Diario'
        'HABECNT301'#9'18'#9'HABER'#9'F'#9'PLE  -  Libro Diario')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsTotDiario
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
      ReadOnly = True
      TabOrder = 3
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 3
      TitleButtons = False
      UseTFields = False
      FooterColor = clMenu
      FooterCellColor = clMenu
    end
    object BtnImprime: TBitBtn
      Left = 456
      Top = 434
      Width = 85
      Height = 28
      Caption = 'Imprime'
      TabOrder = 4
      OnClick = BtnImprimeClick
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
    object btnExcel: TBitBtn
      Left = 183
      Top = 434
      Width = 85
      Height = 28
      Caption = 'Detalle'
      TabOrder = 5
      OnClick = btnExcelClick
      Glyph.Data = {
        F6010000424DF60100000000000076000000280000001C000000180000000100
        04000000000080010000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFF0FFFFFF0000FFFFFFFFFFFF
        FFFFFFFF00FFFFFF0000FFFFFFFFFFFFFFFFFFF00000FFFF0000FFFFFFFFFFFF
        FFFFFFFF00FF0FFF0000FFFFFFFFFFFFFFFFFF0FF0FFF0FF0000272727272727
        2727F0FFFFFFF0FF00007272727272727272F0FFFFFFF0FF000027FFFFFFFFFF
        FF27F0FFFFFFF0FF000072FFFFFFF7272772F0FFF0FF0FFF000027F2727272F2
        7227FF0FF00FFFFF000072F727272F272F72FFF00000FFFF000027F27272F272
        7F27FFFFF00FFFFF000072FF272F27272F72FFFFF0FFFFFF000027FFF2F2727F
        FF27FFFFFFFFFFFF000072FF2F272727FF72FFFFFFFFFFFF000027F2F2727272
        7F27FFFFFFFFFFFF000072F72727F7272F72FFFFFFFFFFFF000027F2727FFF72
        7F27FFFFFFFFFFFF000072FFFFFFFFFFFF72FFFFFFFFFFFF0000272727272727
        2727FFFFFFFFFFFF00007272727272727272FFFFFFFFFFFF0000}
    end
    object bbtnExlResumen: TBitBtn
      Left = 544
      Top = 434
      Width = 85
      Height = 28
      Caption = 'Resumen'
      TabOrder = 6
      OnClick = bbtnExlResumenClick
      Glyph.Data = {
        F6010000424DF60100000000000076000000280000001C000000180000000100
        04000000000080010000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFF0FFFFFF0000FFFFFFFFFFFF
        FFFFFFFF00FFFFFF0000FFFFFFFFFFFFFFFFFFF00000FFFF0000FFFFFFFFFFFF
        FFFFFFFF00FF0FFF0000FFFFFFFFFFFFFFFFFF0FF0FFF0FF0000272727272727
        2727F0FFFFFFF0FF00007272727272727272F0FFFFFFF0FF000027FFFFFFFFFF
        FF27F0FFFFFFF0FF000072FFFFFFF7272772F0FFF0FF0FFF000027F2727272F2
        7227FF0FF00FFFFF000072F727272F272F72FFF00000FFFF000027F27272F272
        7F27FFFFF00FFFFF000072FF272F27272F72FFFFF0FFFFFF000027FFF2F2727F
        FF27FFFFFFFFFFFF000072FF2F272727FF72FFFFFFFFFFFF000027F2F2727272
        7F27FFFFFFFFFFFF000072F72727F7272F72FFFFFFFFFFFF000027F2727FFF72
        7F27FFFFFFFFFFFF000072FFFFFFFFFFFF72FFFFFFFFFFFF0000272727272727
        2727FFFFFFFFFFFF00007272727272727272FFFFFFFFFFFF0000}
    end
    object bbtnCuentaPLE: TBitBtn
      Left = 94
      Top = 434
      Width = 85
      Height = 28
      Caption = 'Cuenta - PLE'
      TabOrder = 7
      OnClick = bbtnCuentaPLEClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object dtgData: TDBGrid
    Left = 24
    Top = 200
    Width = 145
    Height = 65
    DataSource = dsTotDiario
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object cdsTotDiario: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CUENTA'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DEBECNT401'
        DataType = ftFloat
      end
      item
        Name = 'HABECNT401'
        DataType = ftFloat
      end
      item
        Name = 'DEBECNT301'
        DataType = ftFloat
      end
      item
        Name = 'HABECNT301'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 32
    Top = 140
    Data = {
      A10000009619E0BD010000001800000006000000000003000000A10006435545
      4E544101004900000001000557494454480200020002000B4445534352495043
      494F4E0100490000000100055749445448020002001E000A44454245434E5434
      303108000400000000000A48414245434E5434303108000400000000000A4445
      4245434E5433303108000400000000000A48414245434E543330310800040000
      0000000000}
  end
  object dsTotDiario: TDataSource
    DataSet = cdsTotDiario
    Left = 32
    Top = 98
  end
  object BDEP1: TppBDEPipeline
    DataSource = dsTotDiario
    UserName = 'BDEP1'
    Left = 195
    Top = 111
    object BDEP1ppField1: TppField
      FieldAlias = 'CUENTA'
      FieldName = 'CUENTA'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object BDEP1ppField2: TppField
      FieldAlias = 'DESCRIPCION'
      FieldName = 'DESCRIPCION'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object BDEP1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBECNT401'
      FieldName = 'DEBECNT401'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object BDEP1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABECNT401'
      FieldName = 'HABECNT401'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object BDEP1ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBECNT301'
      FieldName = 'DEBECNT301'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object BDEP1ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABECNT301'
      FieldName = 'HABECNT301'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object rptPLEDiario: TppReport
    AutoStop = False
    DataPipeline = BDEP1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.FileName = 'D:\Desarrollo DM\Sisdema\CNTCLIENTE\PLELibroDiario.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 203
    Top = 135
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'BDEP1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29898
      mmPrintPosition = 0
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 9790
        mmLeft = 126207
        mmTop = 20108
        mmWidth = 51594
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 9790
        mmLeft = 77258
        mmTop = 20108
        mmWidth = 49213
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 9790
        mmLeft = 1323
        mmTop = 20108
        mmWidth = 76200
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Cuenta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5556
        mmTop = 23283
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Debe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 85196
        mmTop = 25400
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Haber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 109802
        mmTop = 25400
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Debe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 135996
        mmTop = 25400
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Haber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 157957
        mmTop = 25400
        mmWidth = 10054
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 4498
        mmLeft = 77258
        mmTop = 20108
        mmWidth = 49213
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 4498
        mmLeft = 126207
        mmTop = 20108
        mmWidth = 51594
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Descripci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 23283
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Libro Diario - Saldos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 92604
        mmTop = 20638
        mmWidth = 28956
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'PLE Libro Diario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 139436
        mmTop = 20638
        mmWidth = 23241
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Informaci'#243'n del Libro Diario - PLE '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4995
        mmLeft = 42408
        mmTop = 12435
        mmWidth = 69765
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Derrama Magisterial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 3281
        mmTop = 794
        mmWidth = 30480
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'Fecha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 164836
        mmTop = 265
        mmWidth = 10245
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Pagina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 164571
        mmTop = 4498
        mmWidth = 10456
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 176213
        mmTop = 0
        mmWidth = 15875
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 176477
        mmTop = 3969
        mmWidth = 1778
        BandType = 0
      end
      object pplblPeriodo: TppLabel
        UserName = 'Label11'
        Caption = 'lblPeriodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 113771
        mmTop = 12435
        mmWidth = 20743
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CUENTA'
        DataPipeline = BDEP1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BDEP1'
        mmHeight = 3979
        mmLeft = 3175
        mmTop = 254
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCRIPCION'
        DataPipeline = BDEP1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BDEP1'
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 264
        mmWidth = 65881
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DEBECNT401'
        DataPipeline = BDEP1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEP1'
        mmHeight = 3683
        mmLeft = 78317
        mmTop = 529
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'HABECNT401'
        DataPipeline = BDEP1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEP1'
        mmHeight = 3683
        mmLeft = 102659
        mmTop = 529
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DEBECNT301'
        DataPipeline = BDEP1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEP1'
        mmHeight = 3683
        mmLeft = 128588
        mmTop = 529
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'HABECNT301'
        DataPipeline = BDEP1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEP1'
        mmHeight = 3683
        mmLeft = 153723
        mmTop = 529
        mmWidth = 22754
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 6615
        mmLeft = 1323
        mmTop = 0
        mmWidth = 176477
        BandType = 7
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Totales'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 21167
        mmTop = 1058
        mmWidth = 10583
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'DEBECNT401'
        DataPipeline = BDEP1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEP1'
        mmHeight = 2910
        mmLeft = 76994
        mmTop = 1588
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'HABECNT401'
        DataPipeline = BDEP1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEP1'
        mmHeight = 2910
        mmLeft = 101336
        mmTop = 1588
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'DEBECNT301'
        DataPipeline = BDEP1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEP1'
        mmHeight = 2910
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'HABECNT301'
        DataPipeline = BDEP1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEP1'
        mmHeight = 2910
        mmLeft = 152400
        mmTop = 1323
        mmWidth = 24077
        BandType = 7
      end
    end
  end
end
