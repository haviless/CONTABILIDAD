object FHojaTrabajo: TFHojaTrabajo
  Left = 363
  Top = 262
  BorderStyle = bsDialog
  Caption = 'Hoja de Trabajo'
  ClientHeight = 232
  ClientWidth = 357
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHoja: TPanel
    Left = 2
    Top = 2
    Width = 349
    Height = 229
    BevelInner = bvRaised
    BorderWidth = 1
    Color = 14869218
    TabOrder = 0
    object lblCia: TLabel
      Left = 22
      Top = 20
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
    object bbtnOk: TBitBtn
      Left = 260
      Top = 196
      Width = 30
      Height = 25
      TabOrder = 6
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
    object dblcCia: TwwDBLookupCombo
      Left = 80
      Top = 16
      Width = 42
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
      Left = 121
      Top = 16
      Width = 167
      Height = 21
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object gbPer: TGroupBox
      Left = 23
      Top = 48
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
        MaxValue = 12
        MinValue = 1
        ParentFont = False
        TabOrder = 1
        Value = 12
      end
    end
    object gbNivel: TGroupBox
      Left = 152
      Top = 55
      Width = 93
      Height = 44
      Caption = ' Nivel Detalle  '
      TabOrder = 3
      Visible = False
      object dblcNivel: TwwDBLookupCombo
        Left = 25
        Top = 17
        Width = 42
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NIVEL'#9'2'#9'NIVEL'#9'F'
          'DIGITOS'#9'10'#9'DIGITOS'#9'F'
          'SIGNO'#9'2'#9'SIGNO'#9'F')
        LookupTable = DMCNT.cdsNivel
        LookupField = 'NIVEL'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        Visible = False
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnNotInList = dblcNivelNotInList
      end
    end
    object rgMoneda: TRadioGroup
      Left = 21
      Top = 99
      Width = 229
      Height = 44
      BiDiMode = bdLeftToRight
      Caption = ' Moneda '
      Columns = 3
      Ctl3D = True
      DragCursor = crDefault
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Local           '
        'Extranjera')
      ParentBiDiMode = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
    object rgMes: TRadioGroup
      Left = 20
      Top = 147
      Width = 229
      Height = 44
      BiDiMode = bdLeftToRight
      Caption = 'Mes'
      Columns = 3
      Ctl3D = True
      DragCursor = crDefault
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Total Mes'
        'Acumulado')
      ParentBiDiMode = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
    object bbtnCanc: TBitBtn
      Left = 292
      Top = 196
      Width = 30
      Height = 25
      Cancel = True
      TabOrder = 7
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
  end
  object ppdbHojaTrabajo: TppDBPipeline
    DataSource = DMCNT.dsRMayor
    UserName = 'dbHojaTrabajo'
    Left = 258
    Top = 58
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'ANO'
      FieldName = 'ANO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'TDIARID'
      FieldName = 'TDIARID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'CUENTAID'
      FieldName = 'CUENTAID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'CLAUXID'
      FieldName = 'CLAUXID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'AUXID'
      FieldName = 'AUXID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'PLAZO'
      FieldName = 'PLAZO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'CTA_GYP'
      FieldName = 'CTA_GYP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'CTA_BAL'
      FieldName = 'CTA_BAL'
      FieldLength = 8
      DisplayWidth = 8
      Position = 9
    end
    object ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEMN00'
      FieldName = 'DEBEMN00'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEMN01'
      FieldName = 'DEBEMN01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEMN02'
      FieldName = 'DEBEMN02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEMN03'
      FieldName = 'DEBEMN03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEMN04'
      FieldName = 'DEBEMN04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEMN05'
      FieldName = 'DEBEMN05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEMN06'
      FieldName = 'DEBEMN06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEMN07'
      FieldName = 'DEBEMN07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEMN08'
      FieldName = 'DEBEMN08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEMN09'
      FieldName = 'DEBEMN09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEMN10'
      FieldName = 'DEBEMN10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEMN11'
      FieldName = 'DEBEMN11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEMN12'
      FieldName = 'DEBEMN12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEMN00'
      FieldName = 'HABEMN00'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEMN01'
      FieldName = 'HABEMN01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEMN02'
      FieldName = 'HABEMN02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEMN03'
      FieldName = 'HABEMN03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEMN04'
      FieldName = 'HABEMN04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEMN05'
      FieldName = 'HABEMN05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object ppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEMN06'
      FieldName = 'HABEMN06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object ppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEMN07'
      FieldName = 'HABEMN07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEMN08'
      FieldName = 'HABEMN08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEMN09'
      FieldName = 'HABEMN09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEMN10'
      FieldName = 'HABEMN10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEMN11'
      FieldName = 'HABEMN11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object ppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEMN12'
      FieldName = 'HABEMN12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object ppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEME00'
      FieldName = 'DEBEME00'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object ppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEME01'
      FieldName = 'DEBEME01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object ppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEME02'
      FieldName = 'DEBEME02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object ppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEME03'
      FieldName = 'DEBEME03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object ppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEME04'
      FieldName = 'DEBEME04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object ppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEME05'
      FieldName = 'DEBEME05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 41
    end
    object ppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEME06'
      FieldName = 'DEBEME06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 42
    end
    object ppField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEME07'
      FieldName = 'DEBEME07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 43
    end
    object ppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEME08'
      FieldName = 'DEBEME08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 44
    end
    object ppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEME09'
      FieldName = 'DEBEME09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object ppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEME10'
      FieldName = 'DEBEME10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 46
    end
    object ppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEME11'
      FieldName = 'DEBEME11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 47
    end
    object ppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEME12'
      FieldName = 'DEBEME12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 48
    end
    object ppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEME00'
      FieldName = 'HABEME00'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 49
    end
    object ppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEME01'
      FieldName = 'HABEME01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 50
    end
    object ppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEME02'
      FieldName = 'HABEME02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 51
    end
    object ppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEME03'
      FieldName = 'HABEME03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 52
    end
    object ppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEME04'
      FieldName = 'HABEME04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 53
    end
    object ppField55: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEME05'
      FieldName = 'HABEME05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 54
    end
    object ppField56: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEME06'
      FieldName = 'HABEME06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 55
    end
    object ppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEME07'
      FieldName = 'HABEME07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 56
    end
    object ppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEME08'
      FieldName = 'HABEME08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 57
    end
    object ppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEME09'
      FieldName = 'HABEME09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 58
    end
    object ppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEME10'
      FieldName = 'HABEME10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 59
    end
    object ppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEME11'
      FieldName = 'HABEME11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 60
    end
    object ppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEME12'
      FieldName = 'HABEME12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 61
    end
    object ppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDMN00'
      FieldName = 'SALDMN00'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 62
    end
    object ppField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDMN01'
      FieldName = 'SALDMN01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 63
    end
    object ppField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDMN02'
      FieldName = 'SALDMN02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 64
    end
    object ppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDMN03'
      FieldName = 'SALDMN03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 65
    end
    object ppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDMN04'
      FieldName = 'SALDMN04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object ppField68: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDMN05'
      FieldName = 'SALDMN05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 67
    end
    object ppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDMN06'
      FieldName = 'SALDMN06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 68
    end
    object ppField70: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDMN07'
      FieldName = 'SALDMN07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 69
    end
    object ppField71: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDMN08'
      FieldName = 'SALDMN08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 70
    end
    object ppField72: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDMN09'
      FieldName = 'SALDMN09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 71
    end
    object ppField73: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDMN10'
      FieldName = 'SALDMN10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 72
    end
    object ppField74: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDMN11'
      FieldName = 'SALDMN11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 73
    end
    object ppField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDMN12'
      FieldName = 'SALDMN12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 74
    end
    object ppField76: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDME00'
      FieldName = 'SALDME00'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 75
    end
    object ppField77: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDME01'
      FieldName = 'SALDME01'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 76
    end
    object ppField78: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDME02'
      FieldName = 'SALDME02'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 77
    end
    object ppField79: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDME03'
      FieldName = 'SALDME03'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 78
    end
    object ppField80: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDME04'
      FieldName = 'SALDME04'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 79
    end
    object ppField81: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDME05'
      FieldName = 'SALDME05'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 80
    end
    object ppField82: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDME06'
      FieldName = 'SALDME06'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 81
    end
    object ppField83: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDME07'
      FieldName = 'SALDME07'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 82
    end
    object ppField84: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDME08'
      FieldName = 'SALDME08'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 83
    end
    object ppField85: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDME09'
      FieldName = 'SALDME09'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 84
    end
    object ppField86: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDME10'
      FieldName = 'SALDME10'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 85
    end
    object ppField87: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDME11'
      FieldName = 'SALDME11'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 86
    end
    object ppField88: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDME12'
      FieldName = 'SALDME12'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 87
    end
    object ppField89: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEMN13'
      FieldName = 'DEBEMN13'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 88
    end
    object ppField90: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEMN13'
      FieldName = 'HABEMN13'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 89
    end
    object ppField91: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEBEME13'
      FieldName = 'DEBEME13'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 90
    end
    object ppField92: TppField
      Alignment = taRightJustify
      FieldAlias = 'HABEME13'
      FieldName = 'HABEME13'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 91
    end
    object ppField93: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDMN13'
      FieldName = 'SALDMN13'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 92
    end
    object ppField94: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDME13'
      FieldName = 'SALDME13'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 93
    end
    object ppField95: TppField
      FieldAlias = 'CTADES'
      FieldName = 'CTADES'
      FieldLength = 40
      DisplayWidth = 40
      Position = 94
    end
    object ppField96: TppField
      FieldAlias = 'TDIARDES'
      FieldName = 'TDIARDES'
      FieldLength = 8
      DisplayWidth = 8
      Position = 95
    end
    object ppField97: TppField
      FieldAlias = 'AUXDES'
      FieldName = 'AUXDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 96
    end
    object ppField98: TppField
      FieldAlias = 'CTA_MOV'
      FieldName = 'CTA_MOV'
      FieldLength = 1
      DisplayWidth = 1
      Position = 97
    end
    object ppField99: TppField
      FieldAlias = 'CCOSID'
      FieldName = 'CCOSID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 98
    end
    object ppField100: TppField
      FieldAlias = 'CCODES'
      FieldName = 'CCODES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 99
    end
  end
  object pprHojaTrabajo: TppReport
    AutoStop = False
    DataPipeline = ppdbHojaTrabajo
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 378090
    PrinterSetup.PaperSize = 121
    Template.FileName = 'C:\SolCnt\SolFormatos\HojaDiario1.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 290
    Top = 58
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbHojaTrabajo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28575
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'HOJA DE TRABAJO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 265
        mmWidth = 27781
        BandType = 0
      end
      object ppdbtCIA: TppDBText
        UserName = 'dbtCIA'
        DataField = 'CIAID'
        DataPipeline = ppdbHojaTrabajo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 4763
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3175
        mmTop = 18521
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Descripci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 31750
        mmTop = 18521
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 15875
        mmWidth = 294482
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 25135
        mmWidth = 294482
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'ACUMULADOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130704
        mmTop = 18785
        mmWidth = 101336
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'DEUDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130704
        mmTop = 22754
        mmWidth = 50800
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'ACREEDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 181769
        mmTop = 22754
        mmWidth = 50271
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'SUMAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 232569
        mmTop = 18785
        mmWidth = 101336
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'DEBE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 232569
        mmTop = 22754
        mmWidth = 50800
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'HABER'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 283105
        mmTop = 22754
        mmWidth = 50800
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 304007
        mmTop = 1058
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'P'#225'gina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 290778
        mmTop = 1058
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 290778
        mmTop = 5027
        mmWidth = 9260
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 304007
        mmTop = 5027
        mmWidth = 18521
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 304007
        mmTop = 8996
        mmWidth = 24077
        BandType = 0
      end
      object pplblFecha: TppLabel
        UserName = 'lblFecha'
        AutoSize = False
        Caption = 'lblFecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 155840
        mmTop = 4498
        mmWidth = 54504
        BandType = 0
      end
      object pplblCIA: TppLabel
        UserName = 'lblCIA'
        Caption = 'lblCIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 529
        mmWidth = 11113
        BandType = 0
      end
      object pplblMoneda: TppLabel
        UserName = 'lblMoneda'
        AutoSize = False
        Caption = 'lblMoneda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 156369
        mmTop = 8202
        mmWidth = 53975
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CUENTAID'
        DataPipeline = ppdbHojaTrabajo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 0
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'CTADES'
        DataPipeline = ppdbHojaTrabajo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 28575
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DEBE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 129382
        mmTop = 0
        mmWidth = 50800
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'HABE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 180446
        mmTop = 0
        mmWidth = 51065
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'SALDODEBE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 232305
        mmTop = 0
        mmWidth = 50800
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'SALDOHABER'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 283369
        mmTop = 0
        mmWidth = 50800
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
      mmHeight = 16404
      mmPrintPosition = 0
      object ppDBCalc3: TppDBCalc
        OnPrint = ppDBCalc3Print
        UserName = 'DBCalc3'
        DataField = 'DEBE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 1058
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        OnPrint = ppDBCalc4Print
        UserName = 'DBCalc4'
        DataField = 'HABE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 1058
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        OnPrint = ppDBCalc2Print
        UserName = 'DBCalc2'
        DataField = 'SALDODEBE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 232305
        mmTop = 1058
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        OnPrint = ppDBCalc1Print
        UserName = 'DBCalc1'
        DataField = 'SALDOHABER'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 283369
        mmTop = 1058
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc13: TppVariable
        UserName = 'Variable1'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppDBCalc13Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 5556
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc14: TppVariable
        UserName = 'Variable2'
        AutoSize = False
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppDBCalc14Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 5556
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc15: TppVariable
        UserName = 'Variable3'
        AutoSize = False
        CalcOrder = 2
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppDBCalc15Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 232305
        mmTop = 5556
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc16: TppVariable
        UserName = 'Variable4'
        AutoSize = False
        CalcOrder = 3
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppDBCalc16Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 283369
        mmTop = 5556
        mmWidth = 50800
        BandType = 7
      end
      object ppVariable9: TppVariable
        UserName = 'Variable9'
        AutoSize = False
        CalcOrder = 4
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppVariable9Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 10583
        mmWidth = 50800
        BandType = 7
      end
      object ppVariable10: TppVariable
        UserName = 'Variable10'
        AutoSize = False
        CalcOrder = 5
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppVariable10Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 10583
        mmWidth = 50800
        BandType = 7
      end
      object ppVariable11: TppVariable
        UserName = 'Variable11'
        AutoSize = False
        CalcOrder = 6
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppVariable11Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 232569
        mmTop = 10583
        mmWidth = 50800
        BandType = 7
      end
      object ppVariable12: TppVariable
        UserName = 'Variable12'
        AutoSize = False
        CalcOrder = 7
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppVariable12Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 283369
        mmTop = 10583
        mmWidth = 50800
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 128852
        mmTop = 529
        mmWidth = 206640
        BandType = 7
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 128852
        mmTop = 9525
        mmWidth = 206640
        BandType = 7
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 95515
        mmTop = 10583
        mmWidth = 9260
        BandType = 7
      end
    end
  end
  object ppHojaTrabajo1: TppReport
    AutoStop = False
    DataPipeline = ppdbHojaTrabajo
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 378090
    PrinterSetup.PaperSize = 121
    Template.FileName = 'C:\SolCnt\SolFormatos\HojaDiario2.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 292
    Top = 102
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbHojaTrabajo'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28575
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'HOJA DE TRABAJO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 265
        mmWidth = 27781
        BandType = 0
      end
      object ppdbtCIA1: TppDBText
        UserName = 'dbtCIA1'
        DataField = 'CIAID'
        DataPipeline = ppdbHojaTrabajo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 4763
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3175
        mmTop = 18521
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Descripci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 31750
        mmTop = 18521
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 15875
        mmWidth = 294482
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 25135
        mmWidth = 294482
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'ACUMULADOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130704
        mmTop = 18785
        mmWidth = 101336
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'DEUDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130704
        mmTop = 22754
        mmWidth = 50800
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 'ACREEDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 181769
        mmTop = 22754
        mmWidth = 50271
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'BALANCE DE COMPROBACION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 232569
        mmTop = 18785
        mmWidth = 101336
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'ACTIVO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 232569
        mmTop = 22754
        mmWidth = 50800
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 'PASIVO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 283105
        mmTop = 22754
        mmWidth = 50800
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtPageSet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 304007
        mmTop = 1058
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'P'#225'gina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 290778
        mmTop = 1058
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 290778
        mmTop = 5027
        mmWidth = 9260
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 304007
        mmTop = 5027
        mmWidth = 18521
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 304007
        mmTop = 8996
        mmWidth = 24077
        BandType = 0
      end
      object pplblFecha1: TppLabel
        UserName = 'lblgFecha1'
        AutoSize = False
        Caption = 'lblgFecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 155840
        mmTop = 4498
        mmWidth = 54504
        BandType = 0
      end
      object pplblCIA1: TppLabel
        UserName = 'lblCIA1'
        Caption = 'lblCIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 529
        mmWidth = 11113
        BandType = 0
      end
      object pplblMoneda1: TppLabel
        UserName = 'lblMoneda1'
        AutoSize = False
        Caption = 'lblMoneda1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 8731
        mmWidth = 54504
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CUENTAID'
        DataPipeline = ppdbHojaTrabajo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 0
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'CTADES'
        DataPipeline = ppdbHojaTrabajo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 28575
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DEBE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 129382
        mmTop = 0
        mmWidth = 50800
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'HABE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 180446
        mmTop = 0
        mmWidth = 51065
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'SALDODEBE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 232305
        mmTop = 0
        mmWidth = 50800
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'SALDOHABER'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 283369
        mmTop = 0
        mmWidth = 50800
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 15346
      mmPrintPosition = 0
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'DEBE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 1058
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'HABE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 1058
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'SALDODEBE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 232305
        mmTop = 1058
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'SALDOHABER'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 283369
        mmTop = 1058
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc17: TppVariable
        UserName = 'DBCalc17'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppDBCalc17Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 5027
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc18: TppVariable
        UserName = 'DBCalc18'
        AutoSize = False
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppDBCalc18Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 5027
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc19: TppVariable
        UserName = 'DBCalc19'
        AutoSize = False
        CalcOrder = 2
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppDBCalc19Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 232305
        mmTop = 5027
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc20: TppVariable
        UserName = 'DBCalc20'
        AutoSize = False
        CalcOrder = 3
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppDBCalc20Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 283369
        mmTop = 5027
        mmWidth = 50800
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 2540
        mmLeft = 128852
        mmTop = 8996
        mmWidth = 206640
        BandType = 7
      end
      object ppVariable5: TppVariable
        UserName = 'Variable5'
        AutoSize = False
        CalcOrder = 4
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppVariable5Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 9790
        mmWidth = 50800
        BandType = 7
      end
      object ppVariable6: TppVariable
        UserName = 'Variable6'
        AutoSize = False
        CalcOrder = 5
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppVariable6Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 9790
        mmWidth = 50800
        BandType = 7
      end
      object ppVariable7: TppVariable
        UserName = 'Variable7'
        AutoSize = False
        CalcOrder = 6
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppVariable7Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 232305
        mmTop = 9790
        mmWidth = 50800
        BandType = 7
      end
      object ppVariable8: TppVariable
        UserName = 'DBCalc202'
        AutoSize = False
        CalcOrder = 7
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppVariable8Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 283369
        mmTop = 9790
        mmWidth = 50800
        BandType = 7
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 100806
        mmTop = 9790
        mmWidth = 7408
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 128852
        mmTop = 529
        mmWidth = 206640
        BandType = 7
      end
    end
  end
  object ppHojaTrabajo2: TppReport
    AutoStop = False
    DataPipeline = ppdbHojaTrabajo
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 378090
    PrinterSetup.PaperSize = 121
    Template.FileName = 'C:\SolCnt\SolFormatos\HojaDiario3.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 292
    Top = 150
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdbHojaTrabajo'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28575
      mmPrintPosition = 0
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'HOJA DE TRABAJO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 265
        mmWidth = 27781
        BandType = 0
      end
      object ppdbtCIA2: TppDBText
        UserName = 'dbtCIA2'
        DataField = 'CIAID'
        DataPipeline = ppdbHojaTrabajo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 4763
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3175
        mmTop = 18521
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Descripci'#243'n'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 31750
        mmTop = 18521
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 15875
        mmWidth = 294482
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 25135
        mmWidth = 294482
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = 'ACUMULADOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130704
        mmTop = 18785
        mmWidth = 101336
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = 'DEUDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130704
        mmTop = 22754
        mmWidth = 50800
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 'ACREEDOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 181769
        mmTop = 22754
        mmWidth = 50271
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Caption = 'BALANCE DE COMPROBACION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 232569
        mmTop = 18785
        mmWidth = 101336
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        AutoSize = False
        Caption = 'PERDIDAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 232569
        mmTop = 22754
        mmWidth = 50800
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        AutoSize = False
        Caption = 'GANANCIAS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 283105
        mmTop = 22754
        mmWidth = 50800
        BandType = 0
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable7'
        VarType = vtPageSet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 304007
        mmTop = 1058
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'P'#225'gina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 290778
        mmTop = 1058
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 290778
        mmTop = 5027
        mmWidth = 9260
        BandType = 0
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable8'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 304007
        mmTop = 5027
        mmWidth = 18521
        BandType = 0
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable9'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 304007
        mmTop = 8996
        mmWidth = 24077
        BandType = 0
      end
      object pplblFecha2: TppLabel
        UserName = 'lblFecha2'
        AutoSize = False
        Caption = 'lblgFecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 155840
        mmTop = 4498
        mmWidth = 54504
        BandType = 0
      end
      object pplblCIA2: TppLabel
        UserName = 'lblCIA2'
        Caption = 'lblCIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 529
        mmWidth = 11113
        BandType = 0
      end
      object pplblMoneda2: TppLabel
        UserName = 'lblMoneda2'
        AutoSize = False
        Caption = 'lblMoneda2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 155840
        mmTop = 8731
        mmWidth = 54769
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'CUENTAID'
        DataPipeline = ppdbHojaTrabajo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 0
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'CTADES'
        DataPipeline = ppdbHojaTrabajo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 28575
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText101'
        DataField = 'DEBE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 129382
        mmTop = 0
        mmWidth = 50800
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'HABE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 180446
        mmTop = 0
        mmWidth = 51065
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'SALDODEBE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 232305
        mmTop = 0
        mmWidth = 50800
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'SALDOHABER'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 283369
        mmTop = 0
        mmWidth = 50800
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        DataField = 'DEBE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 1058
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'HABE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 1058
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'SALDODEBE'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 232305
        mmTop = 1058
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'SALDOHABER'
        DataPipeline = ppdbHojaTrabajo
        DisplayFormat = '###,###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppdbHojaTrabajo'
        mmHeight = 3704
        mmLeft = 283369
        mmTop = 1058
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc21: TppVariable
        UserName = 'DBCalc21'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppDBCalc21Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 5027
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc22: TppVariable
        UserName = 'DBCalc22'
        AutoSize = False
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppDBCalc22Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 5027
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc23: TppVariable
        UserName = 'DBCalc23'
        AutoSize = False
        CalcOrder = 2
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppDBCalc23Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 232305
        mmTop = 5027
        mmWidth = 50800
        BandType = 7
      end
      object ppDBCalc24: TppVariable
        UserName = 'DBCalc201'
        AutoSize = False
        CalcOrder = 3
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppDBCalc24Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 283369
        mmTop = 5027
        mmWidth = 50800
        BandType = 7
      end
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        AutoSize = False
        CalcOrder = 4
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppVariable1Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 10583
        mmWidth = 50800
        BandType = 7
      end
      object ppVariable2: TppVariable
        UserName = 'Variable2'
        AutoSize = False
        CalcOrder = 5
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppVariable2Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 10583
        mmWidth = 50800
        BandType = 7
      end
      object ppVariable3: TppVariable
        UserName = 'Variable3'
        AutoSize = False
        CalcOrder = 6
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppVariable3Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 232305
        mmTop = 10583
        mmWidth = 50800
        BandType = 7
      end
      object ppVariable4: TppVariable
        UserName = 'Variable4'
        AutoSize = False
        CalcOrder = 7
        DataType = dtDouble
        DisplayFormat = '###,###,#0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = [fsBold]
        OnCalc = ppVariable4Calc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 283369
        mmTop = 10583
        mmWidth = 50800
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 2540
        mmLeft = 128059
        mmTop = 9525
        mmWidth = 207698
        BandType = 7
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 128059
        mmTop = 529
        mmWidth = 207698
        BandType = 7
      end
      object ppLabel43: TppLabel
        UserName = 'Label401'
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 101071
        mmTop = 10583
        mmWidth = 9260
        BandType = 7
      end
    end
  end
end
