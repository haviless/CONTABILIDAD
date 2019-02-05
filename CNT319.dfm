object FMAD: TFMAD
  Left = 467
  Top = 177
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Mayor Auxiliar Detallado'
  ClientHeight = 353
  ClientWidth = 406
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMayor: TPanel
    Left = 5
    Top = 3
    Width = 394
    Height = 345
    BevelInner = bvRaised
    BorderWidth = 1
    Color = 10207162
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblCia: TLabel
      Left = 18
      Top = 18
      Width = 49
      Height = 16
      Caption = 'Compa'#241#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 148
      Top = 51
      Width = 131
      Height = 16
      Caption = 'Desde              Hasta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bbtnOk: TBitBtn
      Left = 306
      Top = 309
      Width = 30
      Height = 25
      TabOrder = 11
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
      Left = 345
      Top = 309
      Width = 30
      Height = 25
      Cancel = True
      ModalResult = 2
      TabOrder = 12
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
    object dblcCia: TwwDBLookupCombo
      Left = 91
      Top = 12
      Width = 42
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
      LookupTable = DM1.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      DropDownCount = 14
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
      Left = 132
      Top = 12
      Width = 187
      Height = 23
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object gbPer: TGroupBox
      Left = 15
      Top = 44
      Width = 127
      Height = 48
      Caption = 'Periodo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnExit = gbPerExit
      object speAno: TSpinEdit
        Left = 12
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
        Left = 75
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
    object dbdtpFReg1: TwwDBDateTimePicker
      Left = 147
      Top = 67
      Width = 98
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 3
      OnExit = dbdtpFReg1Exit
    end
    object dbdtpFReg2: TwwDBDateTimePicker
      Left = 250
      Top = 67
      Width = 98
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 4
      OnExit = dbdtpFReg2Exit
    end
    object rgCuenta: TRadioGroup
      Left = 15
      Top = 204
      Width = 359
      Height = 39
      Caption = 'Cuenta Contable'
      Columns = 3
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Todas'
        'Rango'
        'Seleccionar')
      ParentFont = False
      TabOrder = 8
      OnClick = rgCuentaClick
    end
    object rgAuxiliar: TRadioGroup
      Left = 15
      Top = 158
      Width = 359
      Height = 39
      Caption = 'Auxiliar'
      Columns = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Seleccionar')
      ParentFont = False
      TabOrder = 6
      Visible = False
      OnClick = rgAuxiliarClick
    end
    object Z2bbtnSelAuxiliar: TBitBtn
      Left = 303
      Top = 168
      Width = 30
      Height = 25
      Enabled = False
      TabOrder = 7
      Visible = False
      OnClick = Z2bbtnSelAuxiliarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        033333FFFF77777773F330000077777770333777773FFFFFF733077777000000
        03337F3F3F777777733F0797A770003333007F737337773F3377077777778803
        30807F333333337FF73707888887880007707F3FFFF333777F37070000878807
        07807F777733337F7F3707888887880808807F333333337F7F37077777778800
        08807F333FFF337773F7088800088803308073FF777FFF733737300008000033
        33003777737777333377333080333333333333F7373333333333300803333333
        33333773733333333333088033333333333373F7F33333333333308033333333
        3333373733333333333333033333333333333373333333333333}
      NumGlyphs = 2
    end
    object Z2bbtnSelCuenta: TBitBtn
      Left = 343
      Top = 214
      Width = 30
      Height = 25
      Enabled = False
      TabOrder = 9
      OnClick = Z2bbtnSelCuentaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        033333FFFF77777773F330000077777770333777773FFFFFF733077777000000
        03337F3F3F777777733F0797A770003333007F737337773F3377077777778803
        30807F333333337FF73707888887880007707F3FFFF333777F37070000878807
        07807F777733337F7F3707888887880808807F333333337F7F37077777778800
        08807F333FFF337773F7088800088803308073FF777FFF733737300008000033
        33003777737777333377333080333333333333F7373333333333300803333333
        33333773733333333333088033333333333373F7F33333333333308033333333
        3333373733333333333333033333333333333373333333333333}
      NumGlyphs = 2
    end
    object rgTipo: TRadioGroup
      Left = 15
      Top = 94
      Width = 359
      Height = 59
      Caption = 'Auxiliar'
      Columns = 3
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Contabilizados'
        'No Contabilizados'
        'Todos')
      ParentFont = False
      TabOrder = 5
    end
    object gbRangos: TGroupBox
      Left = 15
      Top = 249
      Width = 357
      Height = 52
      Caption = '  Rango de Cuentas   '
      TabOrder = 10
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 31
        Height = 15
        Caption = 'Desde'
      end
      object Label3: TLabel
        Left = 186
        Top = 24
        Width = 29
        Height = 15
        Caption = 'Hasta'
      end
      object dblcdDesde: TwwDBLookupComboDlg
        Left = 59
        Top = 20
        Width = 113
        Height = 23
        Options = [opShowOKCancel]
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Cuentas'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'CUENTAID'#9'13'#9'Cuenta'#9'F'
          'CTADES'#9'50'#9'Descripci'#243'n'#9'F')
        LookupTable = DM1.cdsCuenta
        LookupField = 'CUENTAID'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        Enabled = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        UseTFields = False
        ShowMatchText = True
      end
      object dblcdHasta: TwwDBLookupComboDlg
        Left = 221
        Top = 19
        Width = 113
        Height = 23
        Options = [opShowOKCancel]
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Cuentas'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'CUENTAID'#9'13'#9'Cuenta'#9'F'
          'CTADES'#9'50'#9'Descripci'#243'n'#9'F')
        LookupTable = DM1.cdsCuenta
        LookupField = 'CUENTAID'
        Enabled = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        UseTFields = False
      end
    end
  end
  object pprMayorAna: TppReport
    AutoStop = False
    DataPipeline = ppdbMayorAna
    OnSaveText = pprMayorAnaSaveText
    OnStartPage = pprMayorAnaStartPage
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter 8 1/2 x 11 in'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 11350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLExes\SOLFormatos\Cnt\Dema\MayorAuxDet.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprMayorAnaPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 148
    Top = 293
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbMayorAna'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object pplblCia: TppLabel
        UserName = 'lblCiaY1'
        Caption = 'lblCiaY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 0
        mmWidth = 8996
        BandType = 0
      end
      object pplblTitulo: TppLabel
        UserName = 'lblTituloY1'
        Caption = 'MAYOR AUXILIAR DETALLADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 83344
        mmTop = 0
        mmWidth = 44979
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'P'#225'gina:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 147373
        mmTop = 0
        mmWidth = 8996
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable101'
        AutoSize = False
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166159
        mmTop = 0
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Contabilidad'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 3969
        mmWidth = 15081
        BandType = 0
      end
      object pplblPerFech: TppLabel
        UserName = 'lblPerFechY1'
        Caption = 'lblPerFechY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 97367
        mmTop = 3969
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Fecha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 147373
        mmTop = 3969
        mmWidth = 7938
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 173038
        mmTop = 3969
        mmWidth = 14288
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169863
        mmTop = 7938
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Hora:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 147373
        mmTop = 7938
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'COMPROBANTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 15346
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'DOCUMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 15346
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'lblTituloMonY1'
        Caption = 'MONEDA LOCAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 115888
        mmTop = 15346
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = ' TD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 19050
        mmWidth = 5027
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'NUMERO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 19050
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 26194
        mmTop = 19050
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'NUMERO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 41540
        mmTop = 19050
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 61119
        mmTop = 19050
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'GLOSA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 74613
        mmTop = 19050
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'DEBE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 114036
        mmTop = 19050
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'HABER'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 19050
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label71'
        Caption = 'MONEDA EXTRANJERA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 151607
        mmTop = 15346
        mmWidth = 32808
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label73'
        Caption = 'DEBE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 158221
        mmTop = 19050
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label75'
        Caption = 'HABER'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 177007
        mmTop = 19050
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'CONTABILIZADOS Y NO CONTABILIZADOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 77258
        mmTop = 7938
        mmWidth = 60061
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 11377
        mmWidth = 184150
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '----------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 22754
        mmWidth = 184150
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label62'
        Caption = 'C.COSTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 189707
        mmTop = 18785
        mmWidth = 12171
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      BeforeGenerate = ppDetailBand1BeforeGenerate
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'TDIARID'
        DataPipeline = ppdbMayorAna
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbMayorAna'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText301'
        DataField = 'CNTCOMPROB'
        DataPipeline = ppdbMayorAna
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbMayorAna'
        mmHeight = 3704
        mmLeft = 5556
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CNTFCOMP'
        DataPipeline = ppdbMayorAna
        DisplayFormat = 'dd/mm/yy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbMayorAna'
        mmHeight = 3704
        mmLeft = 25135
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CNTSERIE'
        DataPipeline = ppdbMayorAna
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbMayorAna'
        mmHeight = 3704
        mmLeft = 39423
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CNTNODOC'
        DataPipeline = ppdbMayorAna
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbMayorAna'
        mmHeight = 3704
        mmLeft = 46302
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CNTFEMIS'
        DataPipeline = ppdbMayorAna
        DisplayFormat = 'dd/mm/yy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbMayorAna'
        mmHeight = 3704
        mmLeft = 62442
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText401'
        DataField = 'CNTGLOSA'
        DataPipeline = ppdbMayorAna
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbMayorAna'
        mmHeight = 3704
        mmLeft = 77258
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBDEBE2'
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbMayorAna
        DisplayFormat = '##,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMayorAna'
        mmHeight = 3704
        mmLeft = 101865
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBHABER1'
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbMayorAna
        DisplayFormat = '##,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMayorAna'
        mmHeight = 3704
        mmLeft = 125677
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'CNTDEBEME'
        DataPipeline = ppdbMayorAna
        DisplayFormat = '##,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMayorAna'
        mmHeight = 3704
        mmLeft = 149225
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'CNTHABEME'
        DataPipeline = ppdbMayorAna
        DisplayFormat = '##,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMayorAna'
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'CCOSID'
        DataPipeline = ppdbMayorAna
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbMayorAna'
        mmHeight = 3704
        mmLeft = 194469
        mmTop = 0
        mmWidth = 8731
        BandType = 4
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'ppDBText1'
      BreakType = btCustomField
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLabel66: TppLabel
          UserName = 'Label66'
          Caption = 'Cuenta:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 0
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'CUENTAID'
          DataPipeline = ppdbMayorAna
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbMayorAna'
          mmHeight = 3704
          mmLeft = 14817
          mmTop = 0
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'CTADES'
          DataPipeline = ppdbMayorAna
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbMayorAna'
          mmHeight = 3704
          mmLeft = 39158
          mmTop = 0
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 19315
        mmPrintPosition = 0
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Caption = 'Total  por Cuenta'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 7673
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object ppDBText22: TppDBText
          UserName = 'DBText22'
          AutoSize = True
          DataField = 'CUENTAID'
          DataPipeline = ppdbMayorAna
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbMayorAna'
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 7673
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object ppDBText41: TppDBText
          UserName = 'DBText41'
          AutoSize = True
          DataField = 'CTADES'
          DataPipeline = ppdbMayorAna
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppdbMayorAna'
          mmHeight = 3704
          mmLeft = 50271
          mmTop = 7673
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Saldo por Cuenta'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 11642
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
        object ppLabel68: TppLabel
          UserName = 'Label68'
          Caption = 'Saldo Anterior'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 3704
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'CNTDEBEMN'
          DataPipeline = ppdbMayorAna
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbMayorAna'
          mmHeight = 3704
          mmLeft = 101865
          mmTop = 7673
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc18'
          DataField = 'CNTHABEMN'
          DataPipeline = ppdbMayorAna
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbMayorAna'
          mmHeight = 3704
          mmLeft = 125677
          mmTop = 7673
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc19'
          DataField = 'CNTDEBEME'
          DataPipeline = ppdbMayorAna
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbMayorAna'
          mmHeight = 3704
          mmLeft = 149225
          mmTop = 7673
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'DBCalc20'
          DataField = 'CNTHABEME'
          DataPipeline = ppdbMayorAna
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppdbMayorAna'
          mmHeight = 3704
          mmLeft = 172509
          mmTop = 7673
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppVariable15: TppVariable
          OnPrint = ppVariable15Print
          UserName = 'Variable15'
          AutoSize = False
          CalcOrder = 0
          DataType = dtDouble
          DisplayFormat = '###,###,###.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          OnCalc = ppVariable15Calc
          ResetType = veGroupEnd
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 101865
          mmTop = 11642
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppVariable17: TppVariable
          UserName = 'Variable17'
          AutoSize = False
          CalcOrder = 1
          DataType = dtDouble
          DisplayFormat = '###,###,###.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          OnCalc = ppVariable17Calc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 149225
          mmTop = 11642
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'CNTSALDMN'
          DataPipeline = ppdbMayorAna
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'ppdbMayorAna'
          mmHeight = 3704
          mmLeft = 72761
          mmTop = 3704
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'CNTSALDME'
          DataPipeline = ppdbMayorAna
          DisplayFormat = '###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'ppdbMayorAna'
          mmHeight = 3704
          mmLeft = 73025
          mmTop = 7673
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object ppVariable1: TppVariable
          UserName = 'Variable1'
          AutoSize = False
          CalcOrder = 2
          DataType = dtDouble
          DisplayFormat = '###,###,###.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          OnCalc = ppVariable1Calc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 101865
          mmTop = 3704
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppVariable2: TppVariable
          UserName = 'Variable2'
          AutoSize = False
          CalcOrder = 3
          DataType = dtDouble
          DisplayFormat = '###,###,###.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          OnCalc = ppVariable2Calc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 125677
          mmTop = 3704
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
        object ppVariable3: TppVariable
          OnPrint = ppVariable3Print
          UserName = 'Variable3'
          AutoSize = False
          CalcOrder = 4
          DataType = dtDouble
          DisplayFormat = '###,###,###.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          OnCalc = ppVariable3Calc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 125677
          mmTop = 11642
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppVariable4: TppVariable
          UserName = 'Variable4'
          AutoSize = False
          CalcOrder = 5
          DataType = dtDouble
          DisplayFormat = '###,###,###.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          OnCalc = ppVariable4Calc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 149225
          mmTop = 3704
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppVariable5: TppVariable
          UserName = 'Variable5'
          AutoSize = False
          CalcOrder = 6
          DataType = dtDouble
          DisplayFormat = '###,###,###.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          OnCalc = ppVariable5Calc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 172509
          mmTop = 3704
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppVariable6: TppVariable
          UserName = 'Variable6'
          AutoSize = False
          CalcOrder = 7
          DataType = dtDouble
          DisplayFormat = '###,###,###.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          OnCalc = ppVariable6Calc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 172509
          mmTop = 11642
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 184150
          BandType = 5
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 
            '----------------------------------------------------------------' +
            '----------------------------------------------------------------' +
            '----------------------------------------------'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Draft 17cpi'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 15610
          mmWidth = 184150
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppdbMayorAna: TppDBPipeline
    DataSource = DM1.dsMovCNT2
    OpenDataSource = False
    UserName = 'dbMayorAna'
    Left = 66
    Top = 292
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppField2: TppField
      FieldAlias = 'TDIARID'
      FieldName = 'TDIARID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppField3: TppField
      FieldAlias = 'CNTCOMPROB'
      FieldName = 'CNTCOMPROB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppField4: TppField
      FieldAlias = 'CNTANO'
      FieldName = 'CNTANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppField5: TppField
      FieldAlias = 'CNTANOMM'
      FieldName = 'CNTANOMM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppField6: TppField
      FieldAlias = 'CNTLOTE'
      FieldName = 'CNTLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppField7: TppField
      FieldAlias = 'CUENTAID'
      FieldName = 'CUENTAID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppField8: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppField9: TppField
      FieldAlias = 'AUXID'
      FieldName = 'AUXID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppField10: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppField11: TppField
      FieldAlias = 'CNTSERIE'
      FieldName = 'CNTSERIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppField12: TppField
      FieldAlias = 'CNTNODOC'
      FieldName = 'CNTNODOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppField13: TppField
      FieldAlias = 'CNTGLOSA'
      FieldName = 'CNTGLOSA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppField14: TppField
      FieldAlias = 'CNTDH'
      FieldName = 'CNTDH'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppField15: TppField
      FieldAlias = 'CCOSID'
      FieldName = 'CCOSID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppField16: TppField
      FieldAlias = 'CNTTCAMBIO'
      FieldName = 'CNTTCAMBIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppField17: TppField
      FieldAlias = 'CNTMTOORI'
      FieldName = 'CNTMTOORI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppField18: TppField
      FieldAlias = 'CNTMTOLOC'
      FieldName = 'CNTMTOLOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppField19: TppField
      FieldAlias = 'CNTMTOEXT'
      FieldName = 'CNTMTOEXT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppField20: TppField
      FieldAlias = 'CNTFEMIS'
      FieldName = 'CNTFEMIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppField21: TppField
      FieldAlias = 'CNTFVCMTO'
      FieldName = 'CNTFVCMTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppField22: TppField
      FieldAlias = 'CNTFCOMP'
      FieldName = 'CNTFCOMP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppField23: TppField
      FieldAlias = 'CNTESTADO'
      FieldName = 'CNTESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppField24: TppField
      FieldAlias = 'CNTCUADRE'
      FieldName = 'CNTCUADRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppField25: TppField
      FieldAlias = 'CNTFAUTOM'
      FieldName = 'CNTFAUTOM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppField26: TppField
      FieldAlias = 'CNTUSER'
      FieldName = 'CNTUSER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppField27: TppField
      FieldAlias = 'CNTFREG'
      FieldName = 'CNTFREG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppField28: TppField
      FieldAlias = 'CNTHREG'
      FieldName = 'CNTHREG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppField29: TppField
      FieldAlias = 'CNTMM'
      FieldName = 'CNTMM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppField30: TppField
      FieldAlias = 'CNTDD'
      FieldName = 'CNTDD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppField31: TppField
      FieldAlias = 'CNTTRI'
      FieldName = 'CNTTRI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppField32: TppField
      FieldAlias = 'CNTSEM'
      FieldName = 'CNTSEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppField33: TppField
      FieldAlias = 'CNTSS'
      FieldName = 'CNTSS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppField34: TppField
      FieldAlias = 'CNTAATRI'
      FieldName = 'CNTAATRI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppField35: TppField
      FieldAlias = 'CNTAASEM'
      FieldName = 'CNTAASEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppField36: TppField
      FieldAlias = 'CNTAASS'
      FieldName = 'CNTAASS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppField37: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppField38: TppField
      FieldAlias = 'FLAGVAR'
      FieldName = 'FLAGVAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppField39: TppField
      FieldAlias = 'FCONS'
      FieldName = 'FCONS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppField40: TppField
      FieldAlias = 'CNTFMEC'
      FieldName = 'CNTFMEC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppField41: TppField
      FieldAlias = 'TDIARDES'
      FieldName = 'TDIARDES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppField42: TppField
      FieldAlias = 'CTADES'
      FieldName = 'CTADES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppField43: TppField
      FieldAlias = 'AUXDES'
      FieldName = 'AUXDES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppField44: TppField
      FieldAlias = 'DOCDES'
      FieldName = 'DOCDES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppField45: TppField
      FieldAlias = 'CCOSDES'
      FieldName = 'CCOSDES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppField46: TppField
      FieldAlias = 'CNTDEBEMN'
      FieldName = 'CNTDEBEMN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppField47: TppField
      FieldAlias = 'CNTDEBEME'
      FieldName = 'CNTDEBEME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppField48: TppField
      FieldAlias = 'CNTHABEMN'
      FieldName = 'CNTHABEMN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppField49: TppField
      FieldAlias = 'CNTHABEME'
      FieldName = 'CNTHABEME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppField50: TppField
      FieldAlias = 'CNTSALDMN'
      FieldName = 'CNTSALDMN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppField51: TppField
      FieldAlias = 'CNTSALDME'
      FieldName = 'CNTSALDME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppField52: TppField
      FieldAlias = 'CAMPOVAR'
      FieldName = 'CAMPOVAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppField53: TppField
      FieldAlias = 'CNTTS'
      FieldName = 'CNTTS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppField54: TppField
      FieldAlias = 'CNTPAGADO'
      FieldName = 'CNTPAGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppField55: TppField
      FieldAlias = 'CNTMODDOC'
      FieldName = 'CNTMODDOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppField56: TppField
      FieldAlias = 'CNTREG'
      FieldName = 'CNTREG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
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
    Report = pprMayorAna
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 341
    Top = 91
  end
end
