object FtoolHistAjus: TFtoolHistAjus
  Left = 190
  Top = 155
  Width = 781
  Height = 144
  Caption = 'Saldos'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PnlSaldos: TPanel
    Left = 3
    Top = 6
    Width = 767
    Height = 99
    Color = 14869218
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 53
      Width = 49
      Height = 13
      Caption = 'Compa'#241#237'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 509
      Top = 53
      Width = 19
      Height = 13
      Caption = 'A'#241'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 294
      Top = 54
      Width = 20
      Height = 13
      Caption = 'Mes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dblcCia: TwwDBLookupCombo
      Left = 5
      Top = 67
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
      Left = 48
      Top = 68
      Width = 237
      Height = 21
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 5
    end
    object speAno: TSpinEdit
      Left = 507
      Top = 66
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
      TabOrder = 2
      Value = 2001
    end
    object Z2bbtnCanc3: TBitBtn
      Left = 716
      Top = 14
      Width = 35
      Height = 35
      Hint = 'Cancelar Consulta'
      Cancel = True
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
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
    object z2bbtnAceptar: TBitBtn
      Left = 676
      Top = 14
      Width = 35
      Height = 35
      Hint = 'Aceptar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = z2bbtnAceptarClick
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
    object dblcdmes: TwwDBLookupCombo
      Left = 293
      Top = 68
      Width = 39
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MESIDR'#9'2'#9'C'#243'digo'#9'F'
        'MESDESL'#9'15'#9'Descripci'#243'n'#9'F')
      LookupTable = DMCNT.cdsCuenta5
      LookupField = 'mesidr'
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcdmesExit
    end
    object edtmes: TEdit
      Left = 336
      Top = 69
      Width = 161
      Height = 21
      TabOrder = 6
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 652
      Height = 43
      Caption = 'Seleccionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      object RbConsolidado: TRadioButton
        Left = 166
        Top = 16
        Width = 137
        Height = 17
        Caption = 'Sustento Consolidado'
        TabOrder = 1
        OnClick = RbConsolidadoClick
      end
      object RbCia: TRadioButton
        Left = 16
        Top = 16
        Width = 145
        Height = 17
        Caption = 'Sustento Por Compa'#241#237'a'
        TabOrder = 0
        OnClick = RbCiaClick
      end
      object RbCompConsol: TRadioButton
        Left = 484
        Top = 16
        Width = 161
        Height = 17
        Caption = 'Comprobante Consolidado'
        TabOrder = 2
        OnClick = RbCompConsolClick
      end
      object RbComCia: TRadioButton
        Left = 306
        Top = 16
        Width = 159
        Height = 17
        Caption = 'Comprobante por Compa'#241#237'a'
        TabOrder = 3
        OnClick = RbComCiaClick
      end
    end
  end
  object ppdbComprob: TppDBPipeline
    UserName = 'dbComprob'
    Left = 18
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
    object ppField58: TppField
      FieldAlias = 'CTA_SECU'
      FieldName = 'CTA_SECU'
      FieldLength = 2
      DisplayWidth = 2
      Position = 57
    end
  end
  object pprComprob: TppReport
    AutoStop = False
    DataPipeline = ppdbComprob
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rComprob'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 1350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 280000
    PrinterSetup.mmPaperWidth = 226000
    PrinterSetup.PaperSize = 133
    Template.FileName = 'C:\SOLCnt\SOLFormatos\Cnt\Dema\Comprobante1.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 97
    Top = 128
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbComprob'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47890
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 26988
        mmTop = 36248
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'Auxiliar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 39952
        mmTop = 36248
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Cla.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 2646
        mmLeft = 72761
        mmTop = 19050
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'C'#243'd.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 43392
        mmTop = 40746
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 53181
        mmTop = 36248
        mmWidth = 35983
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 'Id'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 2646
        mmLeft = 54504
        mmTop = 19050
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Serie'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 52652
        mmTop = 40746
        mmWidth = 4763
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'N'#250'mero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 64558
        mmTop = 40746
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Glosa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 102394
        mmTop = 36248
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Centro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 139965
        mmTop = 36248
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'de Costo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 139700
        mmTop = 40746
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        AutoSize = False
        Caption = 'Moneda Local'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 155311
        mmTop = 36248
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Debe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 155311
        mmTop = 40746
        mmWidth = 5027
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Haber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 171980
        mmTop = 40746
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        AutoSize = False
        Caption = 'Moneda Extranjera'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 187855
        mmTop = 36248
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Debe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 188648
        mmTop = 40746
        mmWidth = 5027
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = 'Haber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 203730
        mmTop = 40746
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel2: TppLabel
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
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 21167
        mmTop = 31750
        mmWidth = 195263
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
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
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 21167
        mmTop = 44715
        mmWidth = 195263
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 170921
        mmTop = 794
        mmWidth = 6615
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 185473
        mmTop = 794
        mmWidth = 1323
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 185738
        mmTop = 4498
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 'Hora   :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 170921
        mmTop = 4498
        mmWidth = 11642
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 185738
        mmTop = 8467
        mmWidth = 11906
        BandType = 0
      end
      object pplblCia: TppLabel
        UserName = 'lblCia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 22225
        mmTop = 794
        mmWidth = 112184
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Impresi'#243'n de Comprobante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 100806
        mmTop = 6615
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Contabilidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 27252
        mmTop = 6615
        mmWidth = 12435
        BandType = 0
      end
      object pplblFecha: TppLabel
        UserName = 'lblFecha'
        Caption = 'Fecha         :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 37042
        mmTop = 15081
        mmWidth = 10848
        BandType = 0
      end
      object pplblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'Periodo      :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 37042
        mmTop = 20108
        mmWidth = 11113
        BandType = 0
      end
      object pplblTcam: TppLabel
        UserName = 'lblTcam'
        Caption = 'T. Cambio :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 37042
        mmTop = 25135
        mmWidth = 10583
        BandType = 0
      end
      object pplblDiario: TppLabel
        UserName = 'lblDiario'
        Caption = 'T. de Diario     :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 85461
        mmTop = 15081
        mmWidth = 14023
        BandType = 0
      end
      object pplblComp: TppLabel
        UserName = 'lblComp'
        Caption = 'Comprobante  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 85461
        mmTop = 20108
        mmWidth = 14817
        BandType = 0
      end
      object pplblLote: TppLabel
        UserName = 'lblLote'
        Caption = 'No. de Lote      :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 170921
        mmTop = 16404
        mmWidth = 14817
        BandType = 0
      end
      object pplblTmon: TppLabel
        UserName = 'lblTmon'
        Caption = 'T. de Moneda   :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 170921
        mmTop = 20638
        mmWidth = 15081
        BandType = 0
      end
      object pplblEstado: TppLabel
        UserName = 'lblEstado'
        Caption = 'Estado :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 170921
        mmTop = 24871
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'It.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 21696
        mmTop = 40746
        mmWidth = 2117
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DOCID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2910
        mmLeft = 64823
        mmTop = 19315
        mmWidth = 5027
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CLAUXID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2910
        mmLeft = 79375
        mmTop = 19315
        mmWidth = 4763
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 82021
        mmTop = 40746
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Glosa :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 85461
        mmTop = 25135
        mmWidth = 6615
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2646
        mmLeft = 56621
        mmTop = 11642
        mmWidth = 86784
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Fecha :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 170921
        mmTop = 8467
        mmWidth = 6615
        BandType = 0
      end
      object pplblglosa: TppLabel
        UserName = 'lblglosa'
        Caption = 'lblglosa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 2646
        mmLeft = 94721
        mmTop = 25135
        mmWidth = 7673
        BandType = 0
      end
      object lblperiodo: TppLabel
        UserName = 'lblperiodo1'
        Caption = 'lblperiodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 49742
        mmTop = 20108
        mmWidth = 10054
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'CNTGLOSAC'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2117
        mmLeft = 94721
        mmTop = 25400
        mmWidth = 68792
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'AUXID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2910
        mmLeft = 42598
        mmTop = 1058
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CNTSERIE'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2910
        mmLeft = 51858
        mmTop = 1058
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CNTNODOC'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2910
        mmLeft = 60325
        mmTop = 1058
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CNTGLOSA'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2910
        mmLeft = 92604
        mmTop = 1058
        mmWidth = 45244
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'CCOSID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2910
        mmLeft = 138113
        mmTop = 1058
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbComprob
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2910
        mmLeft = 149754
        mmTop = 1058
        mmWidth = 16000
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbComprob
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2910
        mmLeft = 166159
        mmTop = 1058
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CNTDEBEME'
        DataPipeline = ppdbComprob
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2910
        mmLeft = 182563
        mmTop = 1058
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'CNTHABEME'
        DataPipeline = ppdbComprob
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2910
        mmLeft = 198967
        mmTop = 1058
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CUENTAID'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2910
        mmLeft = 26194
        mmTop = 1058
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CNTREG'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2910
        mmLeft = 21167
        mmTop = 1058
        mmWidth = 3440
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CNTFEMIS'
        DataPipeline = ppdbComprob
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Pitch = fpFixed
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbComprob'
        mmHeight = 2910
        mmLeft = 75142
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
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
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 31221
        mmPrintPosition = 0
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Total Comprobante.............'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2646
          mmLeft = 67733
          mmTop = 4763
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
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
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 2646
          mmLeft = 149754
          mmTop = 4763
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
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
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 2646
          mmLeft = 166159
          mmTop = 4763
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
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
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 2646
          mmLeft = 182563
          mmTop = 4763
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
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
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 2646
          mmLeft = 198967
          mmTop = 4763
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          AutoSize = False
          Caption = 
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '---------------------------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2646
          mmLeft = 80169
          mmTop = 794
          mmWidth = 135467
          BandType = 5
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Preparado por:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2646
          mmLeft = 57944
          mmTop = 27517
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'V'#186' B'#186
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2646
          mmLeft = 147638
          mmTop = 27517
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object ppDBText99: TppDBText
          UserName = 'DBText99'
          DataField = 'CNTUSER'
          DataPipeline = ppdbComprob
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 6
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbComprob'
          mmHeight = 4233
          mmLeft = 57415
          mmTop = 18785
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = '------------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2646
          mmLeft = 135996
          mmTop = 23813
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = '------------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 20cpi'
          Font.Pitch = fpFixed
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2646
          mmLeft = 51329
          mmTop = 23813
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CIAID'
      DataPipeline = ppdbComprob
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
    object ppGroup3: TppGroup
      BreakName = 'CNTANOMM'
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
  end
  object pprCompConsol: TppReport
    AutoStop = False
    DataPipeline = ppdbCompConsol
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
    Template.FileName = 'C:\SOLExes\SOLFormatos\Cnt\Dema\ComprobConsol.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 651
    Top = 62
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbCompConsol'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 45244
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = 'RESUMEN DEL REI DE LAS CUENTAS NO MONETARIAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
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
        Font.Name = 'Draft 20cpi'
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
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 25400
        mmTop = 41275
        mmWidth = 33073
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'DEBE '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 138113
        mmTop = 41275
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'HABER'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 163777
        mmTop = 41275
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'Fecha : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 162190
        mmTop = 6350
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label4'
        Caption = 'Fecha : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
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
        Font.Name = 'Draft 20cpi'
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
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 174361
        mmTop = 11377
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'PERIODO : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 62442
        mmTop = 29104
        mmWidth = 16404
        BandType = 0
      end
      object ppSystemVariable13: TppSystemVariable
        UserName = 'SystemVariable13'
        DisplayFormat = 'YYYY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102129
        mmTop = 29104
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label1'
        Caption = 'CONSOLIDADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 8731
        mmTop = 14552
        mmWidth = 25135
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'CIADESPRINC'
        DataPipeline = ppdbCompConsol
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 10cpi'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppdbCompConsol'
        mmHeight = 3969
        mmLeft = 9260
        mmTop = 8731
        mmWidth = 68527
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'DESMES'
        DataPipeline = ppdbCompConsol
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 20cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCompConsol'
        mmHeight = 3969
        mmLeft = 80963
        mmTop = 29104
        mmWidth = 18785
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'CUENTAAJUSTE'
        DataPipeline = ppdbCompConsol
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCompConsol'
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbCompConsol
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCompConsol'
        mmHeight = 3704
        mmLeft = 130175
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbCompConsol
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCompConsol'
        mmHeight = 3704
        mmLeft = 159279
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'CTADES'
        DataPipeline = ppdbCompConsol
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbCompConsol'
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 794
        mmWidth = 83344
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbCompConsol
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCompConsol'
        mmHeight = 3704
        mmLeft = 130704
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbCompConsol
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbCompConsol'
        mmHeight = 3704
        mmLeft = 159279
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 129646
        mmTop = 12700
        mmWidth = 47096
        BandType = 7
      end
      object ppLabel49: TppLabel
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
        mmLeft = 137054
        mmTop = 14023
        mmWidth = 10848
        BandType = 7
      end
      object pplabel50: TppLabel
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
        mmLeft = 165629
        mmTop = 14023
        mmWidth = 10848
        BandType = 7
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 129646
        mmTop = 19050
        mmWidth = 47096
        BandType = 7
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 130175
        mmTop = 19844
        mmWidth = 46567
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 130175
        mmTop = 265
        mmWidth = 47096
        BandType = 7
      end
      object pplbldebeREI: TppLabel
        UserName = 'lbldebeREI'
        Caption = 'Label2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 138642
        mmTop = 7673
        mmWidth = 9260
        BandType = 7
      end
      object pplblhaberei: TppLabel
        UserName = 'Label3'
        Caption = 'pplblhaberei'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 158750
        mmTop = 7673
        mmWidth = 17463
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
        mmLeft = 16404
        mmTop = 7673
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
        mmLeft = 34925
        mmTop = 7673
        mmWidth = 12700
        BandType = 7
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'CUENTAORI'
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppdbCompConsol: TppDBPipeline
    DataSource = DMCNT.dsQry3
    UserName = 'dbCompConsol'
    Left = 595
    Top = 70
  end
end
