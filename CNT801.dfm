object FVerificaPlan: TFVerificaPlan
  Left = 159
  Top = 49
  Width = 536
  Height = 493
  Caption = 'Verifica Plan de Cuentas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bbtnVerifica: TBitBtn
    Left = 8
    Top = 159
    Width = 75
    Height = 25
    Caption = 'Verifica'
    TabOrder = 0
    Visible = False
    OnClick = bbtnVerificaClick
  end
  object wwDBGrid1: TwwDBGrid
    Left = 10
    Top = 187
    Width = 510
    Height = 239
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DM1.dsCuenta2
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object pbarCuenta: TProgressBar
    Left = 96
    Top = 160
    Width = 417
    Height = 22
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 400
    Top = 433
    Width = 75
    Height = 25
    Caption = 'Imprime'
    TabOrder = 3
    OnClick = BitBtn1Click
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
  object gbRango: TGroupBox
    Left = 7
    Top = 8
    Width = 242
    Height = 146
    Caption = 'Tablas'
    TabOrder = 4
    object dbgTablas: TwwDBGrid
      Left = 10
      Top = 53
      Width = 223
      Height = 85
      DisableThemesInTitle = False
      Selected.Strings = (
        'DUM'#9'2'#9'S/N'#9'F'
        'DESCRIP'#9'10'#9'Tabla'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = 10207162
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = 15792632
      DataSource = DM1.dsQry3
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = [dgEnterToTab]
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = True
    end
    object rgEscoger: TRadioGroup
      Left = 9
      Top = 14
      Width = 221
      Height = 33
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Escoger')
      TabOrder = 1
      OnClick = rgEscogerClick
    end
  end
  object Memo1: TMemo
    Left = 464
    Top = 16
    Width = 53
    Height = 89
    Lines.Strings = (
      'CAJA201'
      'CAJA301'
      'CAJA302'
      'CAJA303'
      'CAJA304'
      'CAJA501'
      'CNT250'
      'CNT301'
      'CNT303'
      'CNT311'
      'CNT400'
      'CNT401'
      'CNT402'
      'CNT403'
      'CNT404'
      'CNT701'
      'CXC102'
      'CXC201'
      'CXC204'
      'CXC205'
      'CXC208'
      'TGE202')
    TabOrder = 5
    Visible = False
  end
  object btnVerifiva: TButton
    Left = 288
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Verifica 2'
    TabOrder = 6
    OnClick = btnVerifivaClick
  end
  object ppdbCtasObservadas: TppDBPipeline
    DataSource = DM1.dsCuenta2
    UserName = 'dbCtasObservadas'
    Left = 320
    Top = 25
  end
  object pprCtasObservadas: TppReport
    AutoStop = False
    DataPipeline = ppdbCtasObservadas
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta 216 x 279 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 416
    Top = 25
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbCtasObservadas'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Relaci'#243'n de Cuentas Observadas en el Plan de Cuentas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5292
        mmTop = 4498
        mmWidth = 77523
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 166159
        mmTop = 1058
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 169863
        mmTop = 6879
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Compa'#241#237'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5027
        mmTop = 12965
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 25665
        mmTop = 12965
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Observaciones'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 53975
        mmTop = 12965
        mmWidth = 21167
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CIAID'
        DataPipeline = ppdbCtasObservadas
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCtasObservadas'
        mmHeight = 3969
        mmLeft = 3969
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CUENTAID'
        DataPipeline = ppdbCtasObservadas
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCtasObservadas'
        mmHeight = 3969
        mmLeft = 26723
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'OBSER'
        DataPipeline = ppdbCtasObservadas
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCtasObservadas'
        mmHeight = 3969
        mmLeft = 53446
        mmTop = 0
        mmWidth = 10319
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
end
