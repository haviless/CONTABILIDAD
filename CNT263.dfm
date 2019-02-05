object FGenConsol: TFGenConsol
  Left = 443
  Top = 312
  BorderStyle = bsDialog
  Caption = 'Genera Consolidado'
  ClientHeight = 286
  ClientWidth = 372
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDetalle: TPanel
    Left = 5
    Top = 4
    Width = 362
    Height = 277
    Color = 14869218
    TabOrder = 0
    object lblCia: TLabel
      Left = 55
      Top = 14
      Width = 139
      Height = 16
      Caption = 'Compa'#241#237'a de Consolidado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object final: TLabel
      Left = 265
      Top = 153
      Width = 25
      Height = 13
      Caption = 'Final:'
    end
    object Inicio: TLabel
      Left = 6
      Top = 153
      Width = 31
      Height = 13
      Caption = 'Inicio :'
    end
    object Cierre: TLabel
      Left = 51
      Top = 177
      Width = 33
      Height = 13
      Caption = 'Cierre: '
    end
    object Verifica: TLabel
      Left = 51
      Top = 195
      Width = 41
      Height = 13
      Caption = 'Verifica: '
    end
    object Elimina: TLabel
      Left = 183
      Top = 177
      Width = 39
      Height = 13
      Caption = 'Elimina: '
    end
    object Inserta: TLabel
      Left = 183
      Top = 195
      Width = 38
      Height = 13
      Caption = 'Inserta: '
    end
    object Inicializa: TLabel
      Left = 183
      Top = 213
      Width = 46
      Height = 13
      Caption = 'Inicializa: '
    end
    object gbPer: TGroupBox
      Left = 48
      Top = 63
      Width = 250
      Height = 55
      Caption = 'Periodo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object speAno: TSpinEdit
        Left = 65
        Top = 21
        Width = 55
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        MaxLength = 4
        MaxValue = 2012
        MinValue = 2000
        ParentFont = False
        TabOrder = 0
        Value = 2011
      end
      object speMM: TSpinEdit
        Left = 139
        Top = 21
        Width = 41
        Height = 24
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        MaxLength = 2
        MaxValue = 13
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 12
      end
    end
    object bbtnOk: TBitBtn
      Left = 252
      Top = 237
      Width = 32
      Height = 30
      TabOrder = 1
      OnClick = bbtnOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
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
    object bbtnCanc: TBitBtn
      Left = 294
      Top = 237
      Width = 32
      Height = 30
      Cancel = True
      TabOrder = 2
      OnClick = bbtnCancClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
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
    object pb1: TProgressBar
      Left = 12
      Top = 132
      Width = 339
      Height = 16
      TabOrder = 3
    end
    object bbtnVerifica: TBitBtn
      Left = 14
      Top = 244
      Width = 80
      Height = 25
      Caption = 'Verif.Cuentas'
      TabOrder = 4
      OnClick = bbtnVerificaClick
    end
    object dblcCia: TwwDBLookupCombo
      Left = 50
      Top = 32
      Width = 42
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
      LookupTable = DMCNT.cdsQry3
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      Enabled = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object edtCia: TEdit
      Left = 94
      Top = 32
      Width = 204
      Height = 21
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 6
    end
    object bbtnVerificaMto: TBitBtn
      Left = 102
      Top = 244
      Width = 80
      Height = 25
      Caption = 'Verif.Montos'
      TabOrder = 7
      OnClick = bbtnVerificaMtoClick
    end
  end
  object pprV: TppReport
    AutoStop = False
    DataPipeline = ppdbV
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\oaEjecuta\RTMs\Cnt\Dema\VerifConsolidadoMto.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 324
    Top = 10
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbV'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppdbV: TppDBPipeline
    UserName = 'dbV'
    Left = 324
    Top = 74
  end
  object ppdV: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pprV
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 324
    Top = 42
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 319
    Top = 180
  end
end
