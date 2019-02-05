object FImpPlanCta: TFImpPlanCta
  Left = 259
  Top = 235
  BorderStyle = bsDialog
  Caption = 'Impresi'#243'n del Plan de Cuentas'
  ClientHeight = 124
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlReporte: TPanel
    Left = 0
    Top = 1
    Width = 568
    Height = 121
    BevelInner = bvLowered
    Color = 10207162
    TabOrder = 0
    object Label24: TLabel
      Left = 261
      Top = 7
      Width = 24
      Height = 13
      Caption = 'Nivel'
    end
    object Label25: TLabel
      Left = 12
      Top = 56
      Width = 94
      Height = 13
      Caption = 'Rangos de Cuentas'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label26: TLabel
      Left = 10
      Top = 72
      Width = 64
      Height = 13
      Caption = 'Cuenta Inicial'
    end
    object Label27: TLabel
      Left = 277
      Top = 72
      Width = 59
      Height = 13
      Caption = 'Cuenta Final'
    end
    object Label28: TLabel
      Left = 321
      Top = 8
      Width = 34
      Height = 13
      Caption = 'D'#237'gitos'
    end
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Compa'#241#237'a'
    end
    object dblcNivel: TwwDBLookupCombo
      Left = 258
      Top = 23
      Width = 49
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NIVEL'#9'2'#9'Nivel'#9'F'
        'DIGITOS'#9'10'#9'Digitos'#9'F')
      LookupTable = DMCNT.cdsNivel
      LookupField = 'NIVEL'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcNivelExit
      OnNotInList = dblcNivelNotInList
    end
    object dbeNivel: TwwDBEdit
      Left = 319
      Top = 23
      Width = 41
      Height = 21
      Enabled = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object Panel4: TPanel
      Left = 2
      Top = 48
      Width = 573
      Height = 2
      TabOrder = 4
    end
    object dblcdCtaInic: TwwDBLookupComboDlg
      Left = 9
      Top = 88
      Width = 90
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CUENTAID'#9'15'#9'Id'#9'F'
        'CTADES'#9'40'#9'Cuenta Contable'#9'F')
      LookupTable = DMCNT.cdsCuenta3
      LookupField = 'CUENTAID'
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = dblcdCtaInicChange
    end
    object dbeCtaInic: TwwDBEdit
      Left = 102
      Top = 88
      Width = 169
      Height = 21
      Enabled = False
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdCtaFinal: TwwDBLookupComboDlg
      Left = 276
      Top = 88
      Width = 90
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CUENTAID'#9'15'#9'Id'#9'F'
        'CTADES'#9'40'#9'Cuenta Contable'#9'F')
      LookupTable = DMCNT.cdsCuenta3
      LookupField = 'CUENTAID'
      TabOrder = 7
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = dblcdCtaFinalChange
    end
    object dbeCtaFinal: TwwDBEdit
      Left = 373
      Top = 87
      Width = 185
      Height = 21
      Enabled = False
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object Z2bbtnRegistra3: TBitBtn
      Left = 494
      Top = 16
      Width = 25
      Height = 25
      Hint = 'Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = Z2bbtnRegistra3Click
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
    object Z2bbtnCanc3: TBitBtn
      Left = 525
      Top = 16
      Width = 26
      Height = 25
      Hint = 'Cancela Datos'
      Cancel = True
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
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
    object dblcCia: TwwDBLookupCombo
      Left = 9
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
      Left = 48
      Top = 23
      Width = 201
      Height = 21
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DMCNT.dsCuenta3
    UserName = 'DBPipeline1'
    Left = 399
    Top = 16
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'CUENTAID'
      FieldName = 'CUENTAID'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'CTADES'
      FieldName = 'CTADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'CTAABR'
      FieldName = 'CTAABR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'CTANIV'
      FieldName = 'CTANIV'
      FieldLength = 2
      DisplayWidth = 2
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'CTA_DET'
      FieldName = 'CTA_DET'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'CTA_FVEN'
      FieldName = 'CTA_FVEN'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'CTA_MEXT'
      FieldName = 'CTA_MEXT'
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'CTACLBAL'
      FieldName = 'CTACLBAL'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'CTA_AUT1'
      FieldName = 'CTA_AUT1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object ppField11: TppField
      FieldAlias = 'CTAAUT1'
      FieldName = 'CTAAUT1'
      FieldLength = 15
      DisplayWidth = 15
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'CTAAUT1DH'
      FieldName = 'CTAAUT1DH'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'CTA_AUT2'
      FieldName = 'CTA_AUT2'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
    object ppField14: TppField
      FieldAlias = 'CTAAUT2DH'
      FieldName = 'CTAAUT2DH'
      FieldLength = 1
      DisplayWidth = 1
      Position = 13
    end
    object ppField15: TppField
      FieldAlias = 'CTAAUT2'
      FieldName = 'CTAAUT2'
      FieldLength = 15
      DisplayWidth = 15
      Position = 14
    end
    object ppField16: TppField
      FieldAlias = 'CTAPLAN2'
      FieldName = 'CTAPLAN2'
      FieldLength = 15
      DisplayWidth = 15
      Position = 15
    end
    object ppField17: TppField
      FieldAlias = 'CTA_CIER'
      FieldName = 'CTA_CIER'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object ppField18: TppField
      FieldAlias = 'CTA_PRES'
      FieldName = 'CTA_PRES'
      FieldLength = 1
      DisplayWidth = 1
      Position = 17
    end
    object ppField19: TppField
      FieldAlias = 'CTA_PLAZ'
      FieldName = 'CTA_PLAZ'
      FieldLength = 1
      DisplayWidth = 1
      Position = 18
    end
    object ppField20: TppField
      FieldAlias = 'CTA_MOV'
      FieldName = 'CTA_MOV'
      FieldLength = 1
      DisplayWidth = 1
      Position = 19
    end
    object ppField21: TppField
      FieldAlias = 'CTA_AUX'
      FieldName = 'CTA_AUX'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
    object ppField22: TppField
      FieldAlias = 'CTA_DOC'
      FieldName = 'CTA_DOC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 21
    end
    object ppField23: TppField
      FieldAlias = 'CTA_CCOS'
      FieldName = 'CTA_CCOS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 22
    end
    object ppField24: TppField
      FieldAlias = 'TREGID'
      FieldName = 'TREGID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 23
    end
    object ppField25: TppField
      FieldAlias = 'CTACLAUX'
      FieldName = 'CTACLAUX'
      FieldLength = 2
      DisplayWidth = 2
      Position = 24
    end
    object ppField26: TppField
      FieldAlias = 'CTA_DGAS'
      FieldName = 'CTA_DGAS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 25
    end
    object ppField27: TppField
      FieldAlias = 'CTA_GYP'
      FieldName = 'CTA_GYP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 26
    end
    object ppField28: TppField
      FieldAlias = 'CTA_BAL'
      FieldName = 'CTA_BAL'
      FieldLength = 8
      DisplayWidth = 8
      Position = 27
    end
    object ppField29: TppField
      FieldAlias = 'CTA_ME'
      FieldName = 'CTA_ME'
      FieldLength = 1
      DisplayWidth = 1
      Position = 28
    end
    object ppField30: TppField
      FieldAlias = 'CTA_GP'
      FieldName = 'CTA_GP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 29
    end
    object ppField31: TppField
      FieldAlias = 'CTA_REND'
      FieldName = 'CTA_REND'
      FieldLength = 1
      DisplayWidth = 1
      Position = 30
    end
    object ppField32: TppField
      FieldAlias = 'CTA_DEST'
      FieldName = 'CTA_DEST'
      FieldLength = 1
      DisplayWidth = 1
      Position = 31
    end
    object ppField33: TppField
      FieldAlias = 'FLGVAR'
      FieldName = 'FLGVAR'
      FieldLength = 5
      DisplayWidth = 5
      Position = 32
    end
    object ppField34: TppField
      FieldAlias = 'CTA_DIFC'
      FieldName = 'CTA_DIFC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 33
    end
  end
  object pprPlanCtas: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta 8'#189' x 11 pulg'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 12700
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 2540
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLExes\SOLFormatos\Cnt\Dema\planctas.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 435
    Top = 17
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object pplblCia: TppLabel
        UserName = 'lblCia'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 8202
        mmTop = 2910
        mmWidth = 68263
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Sistema Contable'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 7673
        mmWidth = 40217
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 20638
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Descripci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 27781
        mmTop = 20638
        mmWidth = 29369
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Plan de Cuentas General'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 78317
        mmTop = 2910
        mmWidth = 50271
        BandType = 0
      end
      object pplblNivel: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 112448
        mmTop = 7673
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Aux'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 111390
        mmTop = 20373
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Pagina :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 158221
        mmTop = 2910
        mmWidth = 16140
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 175948
        mmTop = 2910
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Fecha  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 158221
        mmTop = 7673
        mmWidth = 16140
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 175948
        mmTop = 7673
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Hora   :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 158486
        mmTop = 12435
        mmWidth = 16140
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        AutoSize = False
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 175948
        mmTop = 12435
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Cent'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 118004
        mmTop = 20373
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 20373
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 183621
        mmTop = 20373
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Tipo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 103188
        mmTop = 20373
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-----------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 28310
        mmWidth = 256646
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = 'Cost'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 118004
        mmTop = 24342
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 'Auto 1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 24342
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Auto 2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 183886
        mmTop = 24342
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 'Docu'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 20373
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'Niv'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 96309
        mmTop = 20373
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'No'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 134144
        mmTop = 20373
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Mone'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 134144
        mmTop = 24342
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'Extr'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 24342
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'Mon.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 20373
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = 'Es'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 150019
        mmTop = 20373
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'Dest'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 150019
        mmTop = 24342
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 'Es'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 158221
        mmTop = 20373
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Movi'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 158221
        mmTop = 24342
        mmWidth = 7408
        BandType = 0
      end
      object pplblNivel1: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Hasta Nivel :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 85461
        mmTop = 7673
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 16933
        mmWidth = 257969
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CTADES'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 27781
        mmTop = 0
        mmWidth = 69056
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'TIPCTAID'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 105834
        mmTop = 0
        mmWidth = 3704
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CTA_AUX'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 112713
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CTA_CCOS'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 118798
        mmTop = 0
        mmWidth = 4763
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'CTAAUT1'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 166159
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'CTAAUT2'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CTA_DOC'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 127000
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'CTANIV'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 98425
        mmTop = 0
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CUENTAID'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CTA_CIER'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3440
        mmLeft = 134673
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CTA_ME'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 143404
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CTA_DEST'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 150813
        mmTop = 0
        mmWidth = 4763
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'CTA_MOV'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 159544
        mmTop = 0
        mmWidth = 4763
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
end
