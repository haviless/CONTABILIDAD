object FImpBloComp: TFImpBloComp
  Left = 278
  Top = 295
  Width = 560
  Height = 160
  BorderIcons = [biSystemMenu, biHelp]
  Caption = 'Impresi'#243'n en Bloque de Asientos Contables'
  Color = 14869218
  Constraints.MaxHeight = 160
  Constraints.MaxWidth = 560
  Constraints.MinHeight = 160
  Constraints.MinWidth = 560
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 17
    Top = 8
    Width = 49
    Height = 13
    Caption = 'Compa'#241#237'a'
  end
  object Label24: TLabel
    Left = 296
    Top = 7
    Width = 31
    Height = 13
    Caption = 'Origen'
  end
  object Label2: TLabel
    Left = 274
    Top = 72
    Width = 88
    Height = 13
    Caption = 'Comprobante Final'
  end
  object Label26: TLabel
    Left = 155
    Top = 72
    Width = 93
    Height = 13
    Caption = 'Comprobante Inicial'
  end
  object Label25: TLabel
    Left = 156
    Top = 54
    Width = 130
    Height = 15
    AutoSize = False
    Caption = '  Rangos de Comprobante  '
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object sbDisenoRep: TSpeedButton
    Left = 5
    Top = 96
    Width = 8
    Height = 22
    Flat = True
    OnClick = sbDisenoRepClick
  end
  object dblcCia: TwwDBLookupCombo
    Left = 15
    Top = 23
    Width = 40
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'CIAID'#9'2'#9'Cia'#9'F'
      'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
    LookupTable = DMCNT.cdsCia
    LookupField = 'CIAID'
    Options = [loColLines, loRowLines, loTitles]
    Style = csDropDownList
    TabOrder = 0
    AutoDropDown = True
    ShowButton = True
    SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
    PreciseEditRegion = False
    AllowClearKey = True
    ShowMatchText = True
    OnExit = dblcCiaExit
  end
  object edtCia: TEdit
    Left = 56
    Top = 23
    Width = 201
    Height = 21
    Color = clSilver
    Enabled = False
    ReadOnly = True
    TabOrder = 5
  end
  object dblctdiario: TwwDBLookupCombo
    Left = 293
    Top = 23
    Width = 49
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'TDIARID'#9'2'#9'C'#243'digo'#9'F'
      'TDIARDES'#9'40'#9'Origen'#9'F')
    LookupTable = DMCNT.cdsTDiario
    LookupField = 'TDIARID'
    Options = [loColLines, loRowLines, loTitles]
    TabOrder = 1
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = True
    ShowMatchText = True
    OnExit = dblctdiarioExit
    OnNotInList = dblctdiarioNotInList
  end
  object dbetdiario: TwwDBEdit
    Left = 342
    Top = 23
    Width = 187
    Height = 21
    Enabled = False
    TabOrder = 8
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object edtCompFin: TEdit
    Left = 269
    Top = 87
    Width = 100
    Height = 21
    Color = clSilver
    MaxLength = 11
    TabOrder = 4
    OnExit = edtCompFinExit
  end
  object edtCompIni: TEdit
    Left = 156
    Top = 87
    Width = 100
    Height = 21
    Color = clSilver
    MaxLength = 11
    TabOrder = 3
    OnExit = edtCompIniExit
  end
  object Z2bbtnCanc3: TBitBtn
    Left = 507
    Top = 73
    Width = 35
    Height = 35
    Hint = 'Cancela Datos'
    Cancel = True
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
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
  object gbPer: TGroupBox
    Left = 15
    Top = 64
    Width = 129
    Height = 48
    Caption = 'Periodo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object speAno: TSpinEdit
      Left = 15
      Top = 18
      Width = 53
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      MaxLength = 4
      MaxValue = 2100
      MinValue = 1990
      ParentFont = False
      TabOrder = 0
      Value = 1999
    end
    object speMM: TSpinEdit
      Left = 81
      Top = 18
      Width = 37
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
  object bbtnImpresion: TBitBtn
    Left = 387
    Top = 73
    Width = 35
    Height = 35
    Hint = 'Imprimir Comprobantes'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = bbtnImpresionClick
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
  object bbtnAportes: TBitBtn
    Left = 431
    Top = 73
    Width = 69
    Height = 35
    Hint = 'Imprimir Comprobantes Aportes'
    Caption = 'Aportes'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = bbtnAportesClick
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
  object cbDisenoRep: TCheckBox
    Left = 408
    Top = 56
    Width = 97
    Height = 17
    Caption = 'Dise'#241'o Rep'
    TabOrder = 10
    Visible = False
  end
  object ppdbComprob: TppDBPipeline
    DataSource = DMCNT.dsMovCNT1
    UserName = 'dbComprob'
    Left = 215
    Top = 118
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'TDIARID'
      FieldName = 'TDIARID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'CNTCOMPROB'
      FieldName = 'CNTCOMPROB'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'CNTANO'
      FieldName = 'CNTANO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'CNTANOMM'
      FieldName = 'CNTANOMM'
      FieldLength = 6
      DisplayWidth = 6
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'CNTLOTE'
      FieldName = 'CNTLOTE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'CUENTAID'
      FieldName = 'CUENTAID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'AUXID'
      FieldName = 'AUXID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'CNTSERIE'
      FieldName = 'CNTSERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'CNTNODOC'
      FieldName = 'CNTNODOC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'CNTGLOSA'
      FieldName = 'CNTGLOSA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'CNTDH'
      FieldName = 'CNTDH'
      FieldLength = 1
      DisplayWidth = 1
      Position = 13
    end
    object ppField15: TppField
      FieldAlias = 'CCOSID'
      FieldName = 'CCOSID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 14
    end
    object ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTTCAMBIO'
      FieldName = 'CNTTCAMBIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTMTOORI'
      FieldName = 'CNTMTOORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTMTOLOC'
      FieldName = 'CNTMTOLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTMTOEXT'
      FieldName = 'CNTMTOEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppField20: TppField
      FieldAlias = 'CNTFEMIS'
      FieldName = 'CNTFEMIS'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 19
    end
    object ppField21: TppField
      FieldAlias = 'CNTFVCMTO'
      FieldName = 'CNTFVCMTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 20
    end
    object ppField22: TppField
      FieldAlias = 'CNTFCOMP'
      FieldName = 'CNTFCOMP'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 21
    end
    object ppField23: TppField
      FieldAlias = 'CNTESTADO'
      FieldName = 'CNTESTADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 22
    end
    object ppField24: TppField
      FieldAlias = 'CNTCUADRE'
      FieldName = 'CNTCUADRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object ppField25: TppField
      FieldAlias = 'CNTFAUTOM'
      FieldName = 'CNTFAUTOM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 24
    end
    object ppField26: TppField
      FieldAlias = 'CNTUSER'
      FieldName = 'CNTUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 25
    end
    object ppField27: TppField
      FieldAlias = 'CNTFREG'
      FieldName = 'CNTFREG'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 26
    end
    object ppField28: TppField
      FieldAlias = 'CNTHREG'
      FieldName = 'CNTHREG'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 27
    end
    object ppField29: TppField
      FieldAlias = 'CNTMM'
      FieldName = 'CNTMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 28
    end
    object ppField30: TppField
      FieldAlias = 'CNTDD'
      FieldName = 'CNTDD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 29
    end
    object ppField31: TppField
      FieldAlias = 'CNTTRI'
      FieldName = 'CNTTRI'
      FieldLength = 1
      DisplayWidth = 1
      Position = 30
    end
    object ppField32: TppField
      FieldAlias = 'CNTSEM'
      FieldName = 'CNTSEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 31
    end
    object ppField33: TppField
      FieldAlias = 'CNTSS'
      FieldName = 'CNTSS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 32
    end
    object ppField34: TppField
      FieldAlias = 'CNTAATRI'
      FieldName = 'CNTAATRI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 33
    end
    object ppField35: TppField
      FieldAlias = 'CNTAASEM'
      FieldName = 'CNTAASEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 34
    end
    object ppField36: TppField
      FieldAlias = 'CNTAASS'
      FieldName = 'CNTAASS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 35
    end
    object ppField37: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 36
    end
    object ppField38: TppField
      FieldAlias = 'FLAGVAR'
      FieldName = 'FLAGVAR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 37
    end
    object ppField39: TppField
      FieldAlias = 'FCONS'
      FieldName = 'FCONS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 38
    end
    object ppField40: TppField
      FieldAlias = 'CNTFMEC'
      FieldName = 'CNTFMEC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 39
    end
    object ppField41: TppField
      FieldAlias = 'TDIARDES'
      FieldName = 'TDIARDES'
      FieldLength = 20
      DisplayWidth = 20
      Position = 40
    end
    object ppField42: TppField
      FieldAlias = 'CTADES'
      FieldName = 'CTADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 41
    end
    object ppField43: TppField
      FieldAlias = 'AUXDES'
      FieldName = 'AUXDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 42
    end
    object ppField44: TppField
      FieldAlias = 'DOCDES'
      FieldName = 'DOCDES'
      FieldLength = 8
      DisplayWidth = 8
      Position = 43
    end
    object ppField45: TppField
      FieldAlias = 'CCOSDES'
      FieldName = 'CCOSDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 44
    end
    object ppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTDEBEMN'
      FieldName = 'CNTDEBEMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object ppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTDEBEME'
      FieldName = 'CNTDEBEME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object ppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTHABEMN'
      FieldName = 'CNTHABEMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object ppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTHABEME'
      FieldName = 'CNTHABEME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object ppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTSALDMN'
      FieldName = 'CNTSALDMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object ppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTSALDME'
      FieldName = 'CNTSALDME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 50
    end
    object ppField52: TppField
      FieldAlias = 'CAMPOVAR'
      FieldName = 'CAMPOVAR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 51
    end
    object ppField53: TppField
      FieldAlias = 'CNTTS'
      FieldName = 'CNTTS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 52
    end
    object ppField54: TppField
      FieldAlias = 'CNTPAGADO'
      FieldName = 'CNTPAGADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 53
    end
    object ppField55: TppField
      FieldAlias = 'CNTMODDOC'
      FieldName = 'CNTMODDOC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 54
    end
    object ppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTREG'
      FieldName = 'CNTREG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 55
    end
    object ppField57: TppField
      FieldAlias = 'MODULO'
      FieldName = 'MODULO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 56
    end
  end
  object pprComprob: TppReport
    AutoStop = False
    DataPipeline = ppdbComprob
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 12700
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\oaEjecuta\RTMS\CNT\Dema\Comprobante1.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 249
    Top = 118
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbComprob'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        SaveOrder = 0
        Save = True
        SaveLength = 5
        DataField = 'AUXID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 3704
        mmLeft = 23548
        mmTop = 0
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        SaveOrder = 1
        Save = True
        SaveLength = 3
        DataField = 'CNTSERIE'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 4233
        mmLeft = 33073
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        SaveOrder = 2
        Save = True
        SaveLength = 10
        DataField = 'CNTNODOC'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 4233
        mmLeft = 40217
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        SaveLength = 25
        DataField = 'CNTGLOSA'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 4233
        mmLeft = 74348
        mmTop = 0
        mmWidth = 35190
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        SaveOrder = 3
        Save = True
        SaveLength = 8
        AutoSize = True
        DataField = 'CCOSID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 4233
        mmLeft = 112184
        mmTop = 0
        mmWidth = 10160
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        SaveOrder = 4
        Save = True
        SaveLength = 14
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 4233
        mmLeft = 123031
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        SaveOrder = 5
        Save = True
        SaveLength = 14
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 4233
        mmLeft = 143404
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        SaveOrder = 6
        Save = True
        SaveLength = 14
        DataField = 'CNTDEBEME'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 4233
        mmLeft = 163513
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        SaveOrder = 7
        Save = True
        SaveLength = 14
        DataField = 'CNTHABEME'
        DataPipeline = ppdbComprob
        DisplayFormat = '#,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 4233
        mmLeft = 183621
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        SaveOrder = 8
        Save = True
        SaveLength = 8
        DataField = 'CUENTAID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 4233
        mmLeft = 7938
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        SaveOrder = 9
        Save = True
        SaveLength = 3
        DataField = 'CNTREG'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 0
        mmWidth = 3969
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        SaveOrder = 10
        Save = True
        SaveLength = 8
        AutoSize = True
        DataField = 'CNTFEMIS'
        DataPipeline = ppdbComprob
        DisplayFormat = 'DD/MM/YY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 4233
        mmLeft = 61383
        mmTop = 0
        mmWidth = 10160
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup3: TppGroup
      BreakName = 'CIAID'
      DataPipeline = ppdbComprob
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbComprob'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'TDIARID'
      DataPipeline = ppdbComprob
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbComprob'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CNTANOMM'
      DataPipeline = ppdbComprob
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbComprob'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CNTCOMPROB'
      DataPipeline = ppdbComprob
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppdbComprob'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 47625
        mmPrintPosition = 0
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Cuenta'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 7673
          mmTop = 33602
          mmWidth = 7673
          BandType = 3
          GroupNo = 3
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Auxiliar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 21431
          mmTop = 33602
          mmWidth = 10054
          BandType = 3
          GroupNo = 3
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'C'#243'd.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 23813
          mmTop = 37835
          mmWidth = 5027
          BandType = 3
          GroupNo = 3
        end
        object ppLabel26: TppLabel
          UserName = 'Label26'
          Caption = 'D o c u m e n t o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 35190
          mmTop = 33602
          mmWidth = 21696
          BandType = 3
          GroupNo = 3
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = 'Serie'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 33602
          mmTop = 37835
          mmWidth = 6350
          BandType = 3
          GroupNo = 3
        end
        object ppLabel38: TppLabel
          UserName = 'Label38'
          Caption = 'N'#250'mero'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 43656
          mmTop = 37835
          mmWidth = 7673
          BandType = 3
          GroupNo = 3
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          Caption = 'Glosa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 76465
          mmTop = 37835
          mmWidth = 6350
          BandType = 3
          GroupNo = 3
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'Centro'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 110596
          mmTop = 33602
          mmWidth = 7673
          BandType = 3
          GroupNo = 3
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Caption = 'de Costo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 110331
          mmTop = 37835
          mmWidth = 10054
          BandType = 3
          GroupNo = 3
        end
        object ppLabel43: TppLabel
          UserName = 'Label43'
          Caption = 'Moneda Local'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 139171
          mmTop = 33602
          mmWidth = 15346
          BandType = 3
          GroupNo = 3
        end
        object ppLabel31: TppLabel
          UserName = 'Label31'
          Caption = 'Debe'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 133086
          mmTop = 37835
          mmWidth = 5027
          BandType = 3
          GroupNo = 3
        end
        object ppLabel32: TppLabel
          UserName = 'Label32'
          Caption = 'Haber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 152400
          mmTop = 37835
          mmWidth = 6350
          BandType = 3
          GroupNo = 3
        end
        object ppLabel44: TppLabel
          UserName = 'Label44'
          Caption = 'Moneda Extranjera'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 176477
          mmTop = 33602
          mmWidth = 21696
          BandType = 3
          GroupNo = 3
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'Debe'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 173567
          mmTop = 37835
          mmWidth = 5027
          BandType = 3
          GroupNo = 3
        end
        object ppLabel41: TppLabel
          UserName = 'Label41'
          Caption = 'Haber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 192088
          mmTop = 37835
          mmWidth = 6350
          BandType = 3
          GroupNo = 3
        end
        object ppLabel2: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '---------------------------------------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 29369
          mmWidth = 201348
          BandType = 3
          GroupNo = 3
        end
        object ppLabel4: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '---------------------------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 42069
          mmWidth = 201348
          BandType = 3
          GroupNo = 3
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'P'#225'gina:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 168805
          mmTop = 265
          mmWidth = 8996
          BandType = 3
          GroupNo = 3
        end
        object ppSystemVariable4: TppSystemVariable
          UserName = 'SystemVariable4'
          VarType = vtPageNo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 184415
          mmTop = 265
          mmWidth = 1323
          BandType = 3
          GroupNo = 3
        end
        object ppSystemVariable5: TppSystemVariable
          UserName = 'SystemVariable5'
          VarType = vtTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 184415
          mmTop = 4498
          mmWidth = 16404
          BandType = 3
          GroupNo = 3
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          AutoSize = False
          Caption = 'Hora  :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 168805
          mmTop = 4498
          mmWidth = 13229
          BandType = 3
          GroupNo = 3
        end
        object ppSystemVariable6: TppSystemVariable
          UserName = 'SystemVariable6'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 184415
          mmTop = 8996
          mmWidth = 12700
          BandType = 3
          GroupNo = 3
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Impresi'#243'n de Comprobante'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 86254
          mmTop = 4498
          mmWidth = 30427
          BandType = 3
          GroupNo = 3
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Contabilidad'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 4498
          mmWidth = 33867
          BandType = 3
          GroupNo = 3
        end
        object pplblFecha: TppLabel
          UserName = 'lblFecha'
          Caption = 'Fecha     :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 7144
          mmTop = 16669
          mmWidth = 14023
          BandType = 3
          GroupNo = 3
        end
        object pplblPeriodo: TppLabel
          UserName = 'lblPeriodo'
          Caption = 'Periodo   : '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 7144
          mmTop = 20902
          mmWidth = 15346
          BandType = 3
          GroupNo = 3
        end
        object pplblTcam: TppLabel
          UserName = 'lblTcam'
          Caption = 'T. Cambio :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 7144
          mmTop = 25135
          mmWidth = 14023
          BandType = 3
          GroupNo = 3
        end
        object pplblDiario: TppLabel
          UserName = 'lblDiario'
          Caption = 'Origen      :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 70644
          mmTop = 16669
          mmWidth = 16404
          BandType = 3
          GroupNo = 3
        end
        object pplblComp: TppLabel
          UserName = 'lblComp'
          Caption = 'Comprobante :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 70644
          mmTop = 20902
          mmWidth = 16404
          BandType = 3
          GroupNo = 3
        end
        object pplblLote: TppLabel
          UserName = 'lblLote'
          Caption = 'No.Lote :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 168805
          mmTop = 25135
          mmWidth = 11377
          BandType = 3
          GroupNo = 3
        end
        object pplblTmon: TppLabel
          UserName = 'lblTmon'
          Caption = 'Moneda  :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 168805
          mmTop = 20902
          mmWidth = 11377
          BandType = 3
          GroupNo = 3
        end
        object pplblEstado: TppLabel
          UserName = 'lblEstado'
          Caption = 'Estado  :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 168805
          mmTop = 16669
          mmWidth = 11377
          BandType = 3
          GroupNo = 3
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'It.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 37835
          mmWidth = 3704
          BandType = 3
          GroupNo = 3
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Fecha'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 61383
          mmTop = 37835
          mmWidth = 6350
          BandType = 3
          GroupNo = 3
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Glosa       :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 70644
          mmTop = 25135
          mmWidth = 16404
          BandType = 3
          GroupNo = 3
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Fecha :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 168805
          mmTop = 8996
          mmWidth = 8996
          BandType = 3
          GroupNo = 3
        end
        object lblperiodo: TppLabel
          UserName = 'lblperiodo1'
          AutoSize = False
          Caption = 'MAYO 2005'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 24342
          mmTop = 20902
          mmWidth = 23813
          BandType = 3
          GroupNo = 3
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'CNTFCOMP'
          DataPipeline = ppdbComprob
          DisplayFormat = 'DD/MM/YYYY'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 4233
          mmLeft = 24342
          mmTop = 16669
          mmWidth = 21167
          BandType = 3
          GroupNo = 3
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'CNTCOMPROB'
          DataPipeline = ppdbComprob
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 4233
          mmLeft = 90752
          mmTop = 20902
          mmWidth = 28575
          BandType = 3
          GroupNo = 3
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          AutoSize = True
          DataField = 'ORIGEN'
          DataPipeline = ppdbComprob
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 4233
          mmLeft = 90752
          mmTop = 16669
          mmWidth = 36777
          BandType = 3
          GroupNo = 3
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          AutoSize = True
          DataField = 'CIADES'
          DataPipeline = ppdbComprob
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 265
          mmWidth = 41804
          BandType = 3
          GroupNo = 3
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          DataField = 'CNTLOTE'
          DataPipeline = ppdbComprob
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 4233
          mmLeft = 181769
          mmTop = 25135
          mmWidth = 20373
          BandType = 3
          GroupNo = 3
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'CNTTCAMBIO'
          DataPipeline = ppdbComprob
          DisplayFormat = '#,##0.000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 4233
          mmLeft = 24342
          mmTop = 25135
          mmWidth = 19579
          BandType = 3
          GroupNo = 3
        end
        object ppDBText40: TppDBText
          UserName = 'DBText40'
          DataField = 'GLOSA'
          DataPipeline = ppdbComprob
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 4233
          mmLeft = 90752
          mmTop = 25135
          mmWidth = 68527
          BandType = 3
          GroupNo = 3
        end
        object ppDBText41: TppDBText
          UserName = 'DBText41'
          DataField = 'ESTADO'
          DataPipeline = ppdbComprob
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 4233
          mmLeft = 181769
          mmTop = 16669
          mmWidth = 20373
          BandType = 3
          GroupNo = 3
        end
        object ppDBText42: TppDBText
          UserName = 'DBText42'
          DataField = 'MONEDA'
          DataPipeline = ppdbComprob
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 4233
          mmLeft = 181769
          mmTop = 20902
          mmWidth = 20373
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 34925
        mmPrintPosition = 0
        object ppLabel18: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Total Comprobante.............'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 72231
          mmTop = 4763
          mmWidth = 38100
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'CNTDEBEMN'
          DataPipeline = ppdbComprob
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 4233
          mmLeft = 123031
          mmTop = 4763
          mmWidth = 19315
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'CNTHABEMN'
          DataPipeline = ppdbComprob
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 4233
          mmLeft = 143404
          mmTop = 4763
          mmWidth = 19315
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'CNTDEBEME'
          DataPipeline = ppdbComprob
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 4233
          mmLeft = 163513
          mmTop = 4763
          mmWidth = 19315
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'CNTHABEME'
          DataPipeline = ppdbComprob
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 4233
          mmLeft = 183621
          mmTop = 4763
          mmWidth = 19315
          BandType = 5
          GroupNo = 3
        end
        object ppLabel5: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Preparado por:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 51329
          mmTop = 29633
          mmWidth = 20902
          BandType = 5
          GroupNo = 3
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'V'#186' B'#186
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 143934
          mmTop = 29633
          mmWidth = 7144
          BandType = 5
          GroupNo = 3
        end
        object ppDBText99: TppDBText
          UserName = 'DBText99'
          DataField = 'CNTUSER'
          DataPipeline = ppdbComprob
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 4233
          mmLeft = 51594
          mmTop = 21167
          mmWidth = 20108
          BandType = 5
          GroupNo = 3
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = '------------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 124619
          mmTop = 25400
          mmWidth = 45773
          BandType = 5
          GroupNo = 3
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = '------------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 38894
          mmTop = 25400
          mmWidth = 45773
          BandType = 5
          GroupNo = 3
        end
        object pplCmp: TppLabel
          UserName = 'lCmp'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 6879
          mmTop = 8996
          mmWidth = 194998
          BandType = 5
          GroupNo = 3
        end
        object ppLabel79: TppLabel
          UserName = 'Label79'
          AutoSize = False
          Caption = 
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '---------------------------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 70908
          mmTop = 529
          mmWidth = 132292
          BandType = 5
          GroupNo = 3
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppd1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pprComprob
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 282
    Top = 118
  end
end
