object FCtroCosto: TFCtroCosto
  Left = 182
  Top = 61
  Width = 386
  Height = 532
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Centros de Costo'
  Color = clBtnFace
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCC: TPanel
    Left = 7
    Top = 4
    Width = 365
    Height = 499
    BevelInner = bvRaised
    BorderWidth = 1
    TabOrder = 0
    object lblCia: TLabel
      Left = 18
      Top = 18
      Width = 58
      Height = 13
      Caption = 'Compañía'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object gbNivel: TGroupBox
      Left = 249
      Top = 102
      Width = 100
      Height = 44
      TabOrder = 8
      Visible = False
      object dblcNivel: TwwDBLookupCombo
        Left = 28
        Top = 17
        Width = 42
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NIVEL'#9'2'#9'NIVEL'#9'F'
          'DIGITOS'#9'10'#9'DIGITOS'#9'F'
          'SIGNO'#9'2'#9'SIGNO'#9'F')
        LookupTable = DM1.cdsNivel
        LookupField = 'NIVEL'
        Options = [loColLines, loRowLines, loTitles]
        Enabled = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object gbLPar: TGroupBox
      Left = 18
      Top = 152
      Width = 326
      Height = 290
      Caption = ' Parámetros Opcionales  '
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 9
      object gbCC: TGroupBox
        Left = 16
        Top = 48
        Width = 297
        Height = 94
        Enabled = False
        TabOrder = 1
        object edtCC1: TEdit
          Left = 11
          Top = 21
          Width = 97
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object edtCC2: TEdit
          Left = 11
          Top = 41
          Width = 97
          Height = 21
          Enabled = False
          TabOrder = 1
        end
        object edtCC3: TEdit
          Left = 11
          Top = 61
          Width = 97
          Height = 21
          Enabled = False
          TabOrder = 2
        end
      end
      object gbCtas: TGroupBox
        Left = 16
        Top = 149
        Width = 298
        Height = 84
        Enabled = False
        TabOrder = 3
        object edtCta1: TEdit
          Left = 9
          Top = 18
          Width = 105
          Height = 21
          TabOrder = 0
        end
        object edtCta2: TEdit
          Left = 9
          Top = 37
          Width = 105
          Height = 21
          TabOrder = 1
        end
        object edtCta3: TEdit
          Left = 9
          Top = 56
          Width = 105
          Height = 21
          TabOrder = 2
        end
      end
      object ckTit: TCheckBox
        Left = 27
        Top = 238
        Width = 105
        Height = 17
        Caption = 'Título Listado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = ckTitClick
      end
      object ckCtas: TCheckBox
        Left = 31
        Top = 146
        Width = 73
        Height = 17
        Caption = 'Cuentas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = ckCtasClick
      end
      object edtTit: TEdit
        Left = 18
        Top = 257
        Width = 292
        Height = 21
        Enabled = False
        TabOrder = 5
        Text = 'Listado de Centros de Costo'
      end
      object ckCC: TCheckBox
        Left = 31
        Top = 46
        Width = 123
        Height = 17
        Caption = 'Centros de Costo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ckCCClick
      end
      object ckTDiario: TCheckBox
        Left = 31
        Top = 20
        Width = 108
        Height = 18
        Caption = 'Tipo de Diario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = ckTDiarioClick
      end
      object dblcTDiario: TwwDBLookupCombo
        Left = 147
        Top = 18
        Width = 42
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TDIARID'#9'2'#9'T.Diario'#9'F'
          'TDIARDES'#9'20'#9'Descripción'#9'F')
        LookupTable = DM1.cdsTDiario
        LookupField = 'TDIARID'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        Enabled = False
        ParentFont = False
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcTDiarioExit
      end
      object edtTDiario: TEdit
        Left = 188
        Top = 18
        Width = 124
        Height = 21
        Color = clSilver
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
    end
    object rgMoneda: TRadioGroup
      Left = 15
      Top = 101
      Width = 227
      Height = 44
      BiDiMode = bdLeftToRight
      Caption = 'Moneda'
      Columns = 3
      Ctl3D = True
      DragCursor = crDefault
      ItemIndex = 2
      Items.Strings = (
        'Local           '
        'Extranjera'
        'Ambas')
      ParentBiDiMode = False
      ParentCtl3D = False
      TabOrder = 6
    end
    object bbtnOk: TBitBtn
      Left = 277
      Top = 466
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
      Left = 319
      Top = 466
      Width = 30
      Height = 25
      Cancel = True
      ModalResult = 2
      TabOrder = 12
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
      Left = 94
      Top = 12
      Width = 42
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Razón Social'#9'F')
      LookupTable = DM1.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 135
      Top = 12
      Width = 187
      Height = 21
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object cbComp: TCheckBox
      Left = 11
      Top = 448
      Width = 267
      Height = 17
      Caption = 'Reporte Detallado a nivel de Comprobante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object gbFech: TGroupBox
      Left = 154
      Top = 45
      Width = 193
      Height = 48
      TabOrder = 5
      object dbdtpFReg1: TwwDBDateTimePicker
        Left = 12
        Top = 19
        Width = 80
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        Enabled = False
        ShowButton = True
        TabOrder = 0
      end
      object dbdtpFReg2: TwwDBDateTimePicker
        Left = 104
        Top = 19
        Width = 80
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        Enabled = False
        ShowButton = True
        TabOrder = 1
        OnExit = dbdtpFReg2Exit
      end
    end
    object gbPer: TGroupBox
      Left = 15
      Top = 45
      Width = 127
      Height = 48
      TabOrder = 3
      object speAno: TSpinEdit
        Left = 17
        Top = 18
        Width = 48
        Height = 22
        MaxLength = 4
        MaxValue = 2100
        MinValue = 1990
        TabOrder = 0
        Value = 1999
      end
      object speMM: TSpinEdit
        Left = 76
        Top = 18
        Width = 37
        Height = 22
        MaxLength = 2
        MaxValue = 13
        MinValue = 0
        TabOrder = 1
        Value = 12
      end
    end
    object rbFech: TRadioButton
      Left = 162
      Top = 43
      Width = 96
      Height = 17
      Caption = 'Rango Fechas'
      TabOrder = 4
      OnClick = rbFechClick
    end
    object rbPer: TRadioButton
      Left = 25
      Top = 43
      Width = 58
      Height = 17
      Caption = 'Periodo'
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = rbPerClick
    end
    object cbNivel: TCheckBox
      Left = 256
      Top = 100
      Width = 81
      Height = 17
      Caption = 'Nivel Detalle '
      Enabled = False
      TabOrder = 7
      Visible = False
      OnClick = cbNivelClick
    end
  end
  object ppdbCCostoDet: TppDBPipeline
    DataSource = DM1.dsMovCNT2
    UserName = 'dbCCostoDet'
    Left = 10
    Top = 471
    object ppField1: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 0
      DisplayWidth = 0
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
      FieldAlias = 'CNTANOMM'
      FieldName = 'CNTANOMM'
      FieldLength = 6
      DisplayWidth = 6
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
      FieldLength = 8
      DisplayWidth = 8
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'DOCID'
      FieldName = 'DOCID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'CNTNODOC'
      FieldName = 'CNTNODOC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'CNTDH'
      FieldName = 'CNTDH'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTMTOORI'
      FieldName = 'CNTMTOORI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTMTOLOC'
      FieldName = 'CNTMTOLOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'TMONID'
      FieldName = 'TMONID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 11
    end
    object ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTDEBEMN'
      FieldName = 'CNTDEBEMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTDEBEME'
      FieldName = 'CNTDEBEME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTHABEMN'
      FieldName = 'CNTHABEMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTHABEME'
      FieldName = 'CNTHABEME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTSALDMN'
      FieldName = 'CNTSALDMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTSALDME'
      FieldName = 'CNTSALDME'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppField19: TppField
      FieldAlias = 'CNTFEMIS'
      FieldName = 'CNTFEMIS'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 18
    end
    object ppField20: TppField
      FieldAlias = 'CNTFCOMP'
      FieldName = 'CNTFCOMP'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 19
    end
    object ppField21: TppField
      FieldAlias = 'CNTCUADRE'
      FieldName = 'CNTCUADRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
    object ppField22: TppField
      FieldAlias = 'lkCia'
      FieldName = 'lkCia'
      FieldLength = 20
      DisplayWidth = 20
      Position = 21
    end
    object ppField23: TppField
      FieldAlias = 'lkTDiario'
      FieldName = 'lkTDiario'
      FieldLength = 20
      DisplayWidth = 20
      Position = 22
    end
    object ppField24: TppField
      FieldAlias = 'CNTFMEC'
      FieldName = 'CNTFMEC'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object ppField25: TppField
      FieldAlias = 'lkTDoc'
      FieldName = 'lkTDoc'
      FieldLength = 20
      DisplayWidth = 20
      Position = 24
    end
    object ppField26: TppField
      FieldAlias = 'CNTANO'
      FieldName = 'CNTANO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 25
    end
    object ppField27: TppField
      FieldAlias = 'CNTLOTE'
      FieldName = 'CNTLOTE'
      FieldLength = 4
      DisplayWidth = 4
      Position = 26
    end
    object ppField28: TppField
      FieldAlias = 'CNTSERIE'
      FieldName = 'CNTSERIE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 27
    end
    object ppField29: TppField
      FieldAlias = 'CNTGLOSA'
      FieldName = 'CNTGLOSA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 28
    end
    object ppField30: TppField
      FieldAlias = 'CCOSID'
      FieldName = 'CCOSID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 29
    end
    object ppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTTCAMBIO'
      FieldName = 'CNTTCAMBIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'CNTMTOEXT'
      FieldName = 'CNTMTOEXT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppField33: TppField
      FieldAlias = 'CNTFVCMTO'
      FieldName = 'CNTFVCMTO'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 32
    end
    object ppField34: TppField
      FieldAlias = 'CNTESTADO'
      FieldName = 'CNTESTADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 33
    end
    object ppField35: TppField
      FieldAlias = 'CNTFAUTOM'
      FieldName = 'CNTFAUTOM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 34
    end
    object ppField36: TppField
      FieldAlias = 'CNTUSER'
      FieldName = 'CNTUSER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 35
    end
    object ppField37: TppField
      FieldAlias = 'CNTFREG'
      FieldName = 'CNTFREG'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 36
    end
    object ppField38: TppField
      FieldAlias = 'CNTHREG'
      FieldName = 'CNTHREG'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 37
    end
    object ppField39: TppField
      FieldAlias = 'CNTMM'
      FieldName = 'CNTMM'
      FieldLength = 2
      DisplayWidth = 2
      Position = 38
    end
    object ppField40: TppField
      FieldAlias = 'CNTDD'
      FieldName = 'CNTDD'
      FieldLength = 2
      DisplayWidth = 2
      Position = 39
    end
    object ppField41: TppField
      FieldAlias = 'CNTTRI'
      FieldName = 'CNTTRI'
      FieldLength = 1
      DisplayWidth = 1
      Position = 40
    end
    object ppField42: TppField
      FieldAlias = 'CNTSEM'
      FieldName = 'CNTSEM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 41
    end
    object ppField43: TppField
      FieldAlias = 'CNTSS'
      FieldName = 'CNTSS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 42
    end
    object ppField44: TppField
      FieldAlias = 'CNTAATRI'
      FieldName = 'CNTAATRI'
      FieldLength = 5
      DisplayWidth = 5
      Position = 43
    end
    object ppField45: TppField
      FieldAlias = 'CNTAASEM'
      FieldName = 'CNTAASEM'
      FieldLength = 5
      DisplayWidth = 5
      Position = 44
    end
    object ppField46: TppField
      FieldAlias = 'CNTAASS'
      FieldName = 'CNTAASS'
      FieldLength = 6
      DisplayWidth = 6
      Position = 45
    end
    object ppField47: TppField
      FieldAlias = 'FLAGVAR'
      FieldName = 'FLAGVAR'
      FieldLength = 2
      DisplayWidth = 2
      Position = 46
    end
    object ppField48: TppField
      FieldAlias = 'FCONS'
      FieldName = 'FCONS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 47
    end
    object ppField49: TppField
      FieldAlias = 'TDIARDES'
      FieldName = 'TDIARDES'
      FieldLength = 8
      DisplayWidth = 8
      Position = 48
    end
    object ppField50: TppField
      FieldAlias = 'CTADES'
      FieldName = 'CTADES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 49
    end
    object ppField51: TppField
      FieldAlias = 'AUXDES'
      FieldName = 'AUXDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 50
    end
    object ppField52: TppField
      FieldAlias = 'DOCDES'
      FieldName = 'DOCDES'
      FieldLength = 8
      DisplayWidth = 8
      Position = 51
    end
    object ppField53: TppField
      FieldAlias = 'CCOSDES'
      FieldName = 'CCOSDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 52
    end
    object ppField54: TppField
      FieldAlias = 'CAMPOVAR'
      FieldName = 'CAMPOVAR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 53
    end
    object ppField55: TppField
      FieldAlias = 'CNTTS'
      FieldName = 'CNTTS'
      FieldLength = 2
      DisplayWidth = 2
      Position = 54
    end
    object ppField56: TppField
      FieldAlias = 'CNTCOMPROB'
      FieldName = 'CNTCOMPROB'
      FieldLength = 10
      DisplayWidth = 10
      Position = 55
    end
    object ppField57: TppField
      FieldAlias = 'CNTMODDOC'
      FieldName = 'CNTMODDOC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 56
    end
  end
  object pprCCostoDet: TppReport
    AutoStop = False
    DataPipeline = ppdbCCostoDet
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 337000
    Units = utMillimeters
    UserName = 'Report'
    DeviceType = 'Screen'
    Left = 74
    Top = 471
    Version = '4.22 Pro'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'Label8'
        Caption = 'Contabilidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 7408
        mmWidth = 18785
        BandType = 0
      end
      object pplblTitulo: TppLabel
        UserName = 'Label6'
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6085
        mmLeft = 106892
        mmTop = 1588
        mmWidth = 97367
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 529
        mmTop = 20638
        mmWidth = 320000
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'COMPROBANTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 12700
        mmTop = 21960
        mmWidth = 23813
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 794
        mmTop = 30163
        mmWidth = 320000
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label1'
        Caption = 'DOCUMENTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 60061
        mmTop = 21960
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 102659
        mmTop = 21960
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Página:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 282046
        mmTop = 1588
        mmWidth = 11642
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        Alignment = taRightJustify
        AutoSize = False
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 296599
        mmTop = 1852
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Hora   :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 282046
        mmTop = 6615
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Fecha :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 282046
        mmTop = 11906
        mmWidth = 11642
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        Alignment = taRightJustify
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 296599
        mmTop = 6615
        mmWidth = 21167
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 296599
        mmTop = 11377
        mmWidth = 21167
        BandType = 0
      end
      object pplblCia: TppLabel
        UserName = 'Label7'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 1323
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label5'
        Caption = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 27252
        mmTop = 26194
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label9'
        Caption = 'NUMERO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 11642
        mmTop = 26194
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label10'
        Caption = 'NUMERO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 44186
        mmTop = 26194
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label11'
        Caption = 'FECHA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 85990
        mmTop = 26194
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label101'
        Caption = 'VCMTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 102394
        mmTop = 26194
        mmWidth = 11377
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Style = psDot
        Weight = 0.75
        mmHeight = 265
        mmLeft = 37042
        mmTop = 23548
        mmWidth = 1000
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Style = psDot
        Weight = 0.75
        mmHeight = 265
        mmLeft = 44450
        mmTop = 23548
        mmWidth = 12000
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Pen.Style = psDot
        Weight = 0.75
        mmHeight = 265
        mmLeft = 83609
        mmTop = 23548
        mmWidth = 12000
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'GLOSA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 117740
        mmTop = 24871
        mmWidth = 10848
        BandType = 0
      end
      object pplblDMN: TppLabel
        UserName = 'lblDMN'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'DEBE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 173302
        mmTop = 26194
        mmWidth = 14023
        BandType = 0
      end
      object pplblHMN: TppLabel
        UserName = 'Label3'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'HABER'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 195527
        mmTop = 26194
        mmWidth = 14023
        BandType = 0
      end
      object pplMN1: TppLine
        UserName = 'lMN1'
        Pen.Style = psDot
        Weight = 0.75
        mmHeight = 265
        mmLeft = 155840
        mmTop = 23548
        mmWidth = 13000
        BandType = 0
      end
      object pplblMN: TppLabel
        UserName = 'Label12'
        Caption = 'MONEDA LOCAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 177800
        mmTop = 21960
        mmWidth = 24871
        BandType = 0
      end
      object pplMN2: TppLine
        UserName = 'lMN2'
        Pen.Style = psDot
        Weight = 0.75
        mmHeight = 265
        mmLeft = 211403
        mmTop = 23548
        mmWidth = 13000
        BandType = 0
      end
      object pplblSMN: TppLabel
        UserName = 'Label14'
        Alignment = taRightJustify
        Caption = 'S. FINAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 218017
        mmTop = 26194
        mmWidth = 14023
        BandType = 0
      end
      object pplME1: TppLine
        UserName = 'lME1'
        Pen.Style = psDot
        Weight = 0.75
        mmHeight = 265
        mmLeft = 246328
        mmTop = 23548
        mmWidth = 13000
        BandType = 0
      end
      object pplblDME: TppLabel
        UserName = 'Label19'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'DEBE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 264055
        mmTop = 25929
        mmWidth = 14023
        BandType = 0
      end
      object pplblHME: TppLabel
        UserName = 'Label20'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'HABER'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 285486
        mmTop = 25929
        mmWidth = 14023
        BandType = 0
      end
      object pplblSME: TppLabel
        UserName = 'Label201'
        Alignment = taRightJustify
        Caption = 'S. FINAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 307182
        mmTop = 25929
        mmWidth = 14023
        BandType = 0
      end
      object pplblME: TppLabel
        UserName = 'lblME'
        Caption = 'MONEDA EXTRANJERA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 263261
        mmTop = 21696
        mmWidth = 32808
        BandType = 0
      end
      object pplME2: TppLine
        UserName = 'lME2'
        Pen.Style = psDot
        Weight = 0.75
        mmHeight = 265
        mmLeft = 300567
        mmTop = 23548
        mmWidth = 13000
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Pen.Style = psDot
        Weight = 0.75
        mmHeight = 265
        mmLeft = 10583
        mmTop = 23548
        mmWidth = 1000
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = ' TD'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 4763
        mmTop = 24077
        mmWidth = 4498
        BandType = 0
      end
      object pplblSAME: TppLabel
        UserName = 'lblSAME'
        Alignment = taRightJustify
        Caption = 'S.ANTERIOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 240507
        mmTop = 25929
        mmWidth = 17992
        BandType = 0
      end
      object pplblSAMN: TppLabel
        UserName = 'lblSAMN'
        Alignment = taRightJustify
        Caption = 'S.ANTERIOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 146050
        mmTop = 25929
        mmWidth = 17992
        BandType = 0
      end
      object pplblPerFech: TppLabel
        UserName = 'lblPerFech'
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 106627
        mmTop = 10583
        mmWidth = 97631
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'TDIARID'
        DataPipeline = ppdbCCostoDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5821
        mmTop = 794
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        Alignment = taRightJustify
        DataField = 'CNTCOMPROB'
        DataPipeline = ppdbCCostoDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 12171
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CNTFCOMP'
        DataPipeline = ppdbCCostoDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 794
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        Alignment = taRightJustify
        DataField = 'CNTSERIE'
        DataPipeline = ppdbCCostoDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43127
        mmTop = 794
        mmWidth = 7938
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CNTNODOC'
        DataPipeline = ppdbCCostoDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 52123
        mmTop = 794
        mmWidth = 31750
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'CNTFEMIS'
        DataPipeline = ppdbCCostoDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 85990
        mmTop = 794
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'CNTFVCMTO'
        DataPipeline = ppdbCCostoDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 102659
        mmTop = 794
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CNTGLOSA'
        DataPipeline = ppdbCCostoDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 118534
        mmTop = 794
        mmWidth = 41540
        BandType = 4
      end
      object ppvSaldoMN: TppVariable
        UserName = 'vSaldoMN'
        Alignment = taRightJustify
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        OnCalc = ppvSaldoMNCalc
        Transparent = True
        mmHeight = 3704
        mmLeft = 219605
        mmTop = 529
        mmWidth = 12700
        BandType = 4
      end
      object ppvSaldoME: TppVariable
        UserName = 'vSaldoME'
        Alignment = taRightJustify
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        OnCalc = ppvSaldoMECalc
        Transparent = True
        mmHeight = 3704
        mmLeft = 309034
        mmTop = 529
        mmWidth = 12435
        BandType = 4
      end
      object ppdbtDMN1: TppDBText
        OnPrint = ppdbtDMN1Print
        UserName = 'dbtDMN1'
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'CNTDEBEMN'
        DataPipeline = ppdbCCostoDet
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 169069
        mmTop = 529
        mmWidth = 18521
        BandType = 4
      end
      object ppdbtHMN1: TppDBText
        OnPrint = ppdbtHMN1Print
        UserName = 'dbtHMN1'
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'CNTHABEMN'
        DataPipeline = ppdbCCostoDet
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 191030
        mmTop = 529
        mmWidth = 18785
        BandType = 4
      end
      object ppdbtDME1: TppDBText
        OnPrint = ppdbtDME1Print
        UserName = 'dbtDME1'
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'CNTDEBEME'
        DataPipeline = ppdbCCostoDet
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 260086
        mmTop = 1058
        mmWidth = 18256
        BandType = 4
      end
      object ppdbtHME1: TppDBText
        OnPrint = ppdbtHME1Print
        UserName = 'dbtHME1'
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'CNTHABEME'
        DataPipeline = ppdbCCostoDet
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 281253
        mmTop = 794
        mmWidth = 18521
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'ppDBText7'
      BreakType = btCustomField
      KeepTogether = True
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          AutoSize = True
          DataField = 'CUENTAID'
          DataPipeline = ppdbCCostoDet
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 16404
          mmTop = 1058
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          AutoSize = True
          DataField = 'CTADES'
          DataPipeline = ppdbCCostoDet
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 42598
          mmTop = 1058
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Cuenta:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 1058
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = '**TOTAL..........'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 265
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          AutoSize = True
          DataField = 'CUENTAID'
          DataPipeline = ppdbCCostoDet
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 28840
          mmTop = 265
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object ppDBText16: TppDBText
          UserName = 'DBText101'
          AutoSize = True
          DataField = 'CTADES'
          DataPipeline = ppdbCCostoDet
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 56092
          mmTop = 265
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppvTDMNpC: TppVariable
          UserName = 'vTDMNpC'
          Alignment = taRightJustify
          CalcOrder = 1
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup2
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 173567
          mmTop = 794
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppvTHMNpC: TppVariable
          UserName = 'vTHMNpC'
          Alignment = taRightJustify
          CalcOrder = 2
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup2
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 195527
          mmTop = 794
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppvTSMNpC: TppVariable
          UserName = 'vTSMNpC'
          Alignment = taRightJustify
          CalcOrder = 3
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          OnCalc = ppvTSMNpCCalc
          ResetComponent = ppGroup2
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 218811
          mmTop = 794
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
        object ppvTDMEpC: TppVariable
          UserName = 'vTDMEpC'
          Alignment = taRightJustify
          CalcOrder = 5
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup2
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 264319
          mmTop = 529
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppvTHMEpC: TppVariable
          UserName = 'vTHMEpC'
          Alignment = taRightJustify
          CalcOrder = 6
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup2
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 285751
          mmTop = 794
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppvTSMEpC: TppVariable
          UserName = 'vTSMEpC'
          Alignment = taRightJustify
          CalcOrder = 7
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          OnCalc = ppvTSMEpCCalc
          ResetComponent = ppGroup2
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 308240
          mmTop = 529
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object pplG2: TppLine
          UserName = 'lG2'
          Pen.Style = psDot
          Weight = 0.75
          mmHeight = 265
          mmLeft = 1852
          mmTop = 5292
          mmWidth = 320000
          BandType = 5
          GroupNo = 0
        end
        object ppvTSAMN: TppVariable
          OnPrint = ppvTSAMNPrint
          UserName = 'vTSAMN'
          Alignment = taRightJustify
          CalcOrder = 0
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup2
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 152136
          mmTop = 1058
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppvTSAME: TppVariable
          OnPrint = ppvTSAMEPrint
          UserName = 'vTSAME'
          Alignment = taRightJustify
          CalcOrder = 4
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup2
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 246857
          mmTop = 529
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'ppDBText8'
      BreakType = btCustomField
      KeepTogether = True
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          Alignment = taRightJustify
          AutoSize = True
          DataField = 'CCOSID'
          DataPipeline = ppdbCCostoDet
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 4763
          mmTop = 0
          mmWidth = 11906
          BandType = 3
          GroupNo = 2
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          AutoSize = True
          DataField = 'CCOSDES'
          DataPipeline = ppdbCCostoDet
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 19579
          mmTop = 0
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Alignment = taRightJustify
          Caption = 'SALDO ANTERIOR ....'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 102923
          mmTop = 265
          mmWidth = 29369
          BandType = 3
          GroupNo = 2
        end
        object ppdbtSAME: TppDBText
          OnPrint = ppdbtSAMEPrint
          UserName = 'dbtSAME'
          Alignment = taRightJustify
          AutoSize = True
          DataField = 'CNTSALDME'
          DataPipeline = ppdbCCostoDet
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 240771
          mmTop = 529
          mmWidth = 17992
          BandType = 3
          GroupNo = 2
        end
        object ppvSxMN: TppVariable
          UserName = 'vSxMN'
          Alignment = taRightJustify
          CalcOrder = 0
          DataType = dtDouble
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          OnCalc = ppvSxMNCalc
          Transparent = True
          Visible = False
          mmHeight = 3175
          mmLeft = 177007
          mmTop = 1323
          mmWidth = 9260
          BandType = 3
          GroupNo = 2
        end
        object ppdbtSAMN: TppDBText
          OnPrint = ppdbtSAMNPrint
          UserName = 'DBText16'
          Alignment = taRightJustify
          AutoSize = True
          DataField = 'CNTSALDMN'
          DataPipeline = ppdbCCostoDet
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 146050
          mmTop = 529
          mmWidth = 18256
          BandType = 3
          GroupNo = 2
        end
        object ppvSxME: TppVariable
          UserName = 'vSxME'
          Alignment = taRightJustify
          CalcOrder = 1
          DataType = dtDouble
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          OnCalc = ppvSxMECalc
          Transparent = True
          Visible = False
          mmHeight = 3704
          mmLeft = 264055
          mmTop = 529
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = '*TOTAL..........'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 5292
          mmTop = 1058
          mmWidth = 20902
          BandType = 5
          GroupNo = 2
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          Alignment = taRightJustify
          AutoSize = True
          DataField = 'CCOSID'
          DataPipeline = ppdbCCostoDet
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 34925
          mmTop = 1058
          mmWidth = 11906
          BandType = 5
          GroupNo = 2
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'CCOSDES'
          DataPipeline = ppdbCCostoDet
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 48419
          mmTop = 1058
          mmWidth = 14552
          BandType = 5
          GroupNo = 2
        end
        object ppvTDMN: TppVariable
          UserName = 'vTDMN'
          Alignment = taRightJustify
          CalcOrder = 1
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup7
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 177007
          mmTop = 1058
          mmWidth = 10583
          BandType = 5
          GroupNo = 2
        end
        object pplG1: TppLine
          UserName = 'lG1'
          Pen.Style = psDot
          Weight = 0.75
          mmHeight = 265
          mmLeft = 144992
          mmTop = 265
          mmWidth = 176742
          BandType = 5
          GroupNo = 2
        end
        object ppvTHMN: TppVariable
          UserName = 'vTHMN'
          Alignment = taRightJustify
          CalcOrder = 2
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup7
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 199232
          mmTop = 1058
          mmWidth = 10583
          BandType = 5
          GroupNo = 2
        end
        object ppvTSMN: TppVariable
          UserName = 'vTSMN'
          Alignment = taRightJustify
          CalcOrder = 3
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          OnCalc = ppvTSMNCalc
          ResetComponent = ppGroup7
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 222515
          mmTop = 1058
          mmWidth = 9790
          BandType = 5
          GroupNo = 2
        end
        object ppvTDME: TppVariable
          UserName = 'vTDME'
          Alignment = taRightJustify
          CalcOrder = 4
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup7
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 268023
          mmTop = 794
          mmWidth = 10319
          BandType = 5
          GroupNo = 2
        end
        object ppvTHME: TppVariable
          UserName = 'vTHME'
          Alignment = taRightJustify
          CalcOrder = 5
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup7
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 289455
          mmTop = 794
          mmWidth = 10319
          BandType = 5
          GroupNo = 2
        end
        object ppvTSME: TppVariable
          UserName = 'vTSME'
          Alignment = taRightJustify
          CalcOrder = 6
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          OnCalc = ppvTSMECalc
          ResetComponent = ppGroup7
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 311944
          mmTop = 794
          mmWidth = 9525
          BandType = 5
          GroupNo = 2
        end
        object ppdbtSAMN2: TppDBText
          OnPrint = ppdbtSAMN2Print
          UserName = 'dbtSAMN2'
          Alignment = taRightJustify
          AutoSize = True
          DataField = 'CNTSALDMN'
          DataPipeline = ppdbCCostoDet
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 145521
          mmTop = 1058
          mmWidth = 18256
          BandType = 5
          GroupNo = 2
        end
        object ppdbtSAME2: TppDBText
          OnPrint = ppdbtSAME2Print
          UserName = 'dbtSAME2'
          Alignment = taRightJustify
          AutoSize = True
          DataField = 'CNTSALDME'
          DataPipeline = ppdbCCostoDet
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 240771
          mmTop = 794
          mmWidth = 17992
          BandType = 5
          GroupNo = 2
        end
        object ppvSAMN2: TppVariable
          UserName = 'vSAMN2'
          Alignment = taRightJustify
          CalcOrder = 0
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup7
          ResetType = veGroupEnd
          Transparent = True
          Visible = False
          mmHeight = 3704
          mmLeft = 94721
          mmTop = 3175
          mmWidth = 11377
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object ppdbCCosto: TppDBPipeline
    DataSource = DM1.dsQry
    UserName = 'dbMayor1'
    Left = 42
    Top = 471
  end
  object pprCCosto: TppReport
    AutoStop = False
    DataPipeline = ppdbCCosto
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 317000
    Units = utMillimeters
    UserName = 'rCCosto'
    DeviceType = 'Screen'
    Left = 105
    Top = 471
    Version = '4.22 Pro'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30956
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        Caption = 'Contabilidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 7408
        mmWidth = 18785
        BandType = 0
      end
      object pplblTitulo2: TppLabel
        UserName = 'lblTitulo2'
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6085
        mmLeft = 88106
        mmTop = 1588
        mmWidth = 97367
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 20638
        mmWidth = 300000
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 265
        mmTop = 28575
        mmWidth = 300038
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Página:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 261409
        mmTop = 1588
        mmWidth = 11642
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        Alignment = taRightJustify
        AutoSize = False
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 275961
        mmTop = 1852
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 'Hora   :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 261409
        mmTop = 6615
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Fecha :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 261409
        mmTop = 11906
        mmWidth = 11642
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        Alignment = taRightJustify
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 275961
        mmTop = 6615
        mmWidth = 21167
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 275961
        mmTop = 11377
        mmWidth = 21167
        BandType = 0
      end
      object pplblCia2: TppLabel
        UserName = 'lblCia2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 1323
        mmWidth = 11642
        BandType = 0
      end
      object pplblDMN2: TppLabel
        UserName = 'lblDMN1'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'DEBE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 152665
        mmTop = 24606
        mmWidth = 12435
        BandType = 0
      end
      object pplblHMN2: TppLabel
        UserName = 'lblHMN2'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'HABER'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 175419
        mmTop = 24606
        mmWidth = 12700
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Pen.Style = psDot
        Weight = 0.75
        mmHeight = 265
        mmLeft = 137054
        mmTop = 22490
        mmWidth = 15000
        BandType = 0
      end
      object pplblMN2: TppLabel
        UserName = 'lblMN2'
        Caption = 'MONEDA LOCAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 158221
        mmTop = 20902
        mmWidth = 24871
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Pen.Style = psDot
        Weight = 0.75
        mmHeight = 265
        mmLeft = 189177
        mmTop = 22490
        mmWidth = 15000
        BandType = 0
      end
      object pplblSMN2: TppLabel
        UserName = 'lblSMN2'
        Alignment = taRightJustify
        Caption = 'SALDO FINAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 190500
        mmTop = 24606
        mmWidth = 20108
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Pen.Style = psDot
        Weight = 0.75
        mmHeight = 265
        mmLeft = 224896
        mmTop = 22490
        mmWidth = 15000
        BandType = 0
      end
      object pplblDME2: TppLabel
        UserName = 'lblDME2'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'DEBE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 244211
        mmTop = 24871
        mmWidth = 12171
        BandType = 0
      end
      object pplblHME2: TppLabel
        UserName = 'Label202'
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'HABER'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265642
        mmTop = 24871
        mmWidth = 12435
        BandType = 0
      end
      object pplblSME2: TppLabel
        UserName = 'lblSME2'
        Alignment = taRightJustify
        Caption = 'SALDO FINAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 279930
        mmTop = 24871
        mmWidth = 20108
        BandType = 0
      end
      object pplblME2: TppLabel
        UserName = 'lblME1'
        Caption = 'MONEDA EXTRANJERA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 243417
        mmTop = 20902
        mmWidth = 32808
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Pen.Style = psDot
        Weight = 0.75
        mmHeight = 265
        mmLeft = 280988
        mmTop = 22490
        mmWidth = 15000
        BandType = 0
      end
      object ppLabel11: TppLabel
        Caption = 'CUENTA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3969
        mmTop = 23548
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel14: TppLabel
        Caption = 'DESCRIPCION CENTRO DE COSTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 45773
        mmTop = 23548
        mmWidth = 50800
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'CENTRO '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 24606
        mmTop = 21167
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Alignment = taRightJustify
        Caption = 'S.ANTERIOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 128323
        mmTop = 24606
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Alignment = taRightJustify
        Caption = 'S.ANTERIOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 219340
        mmTop = 24871
        mmWidth = 17992
        BandType = 0
      end
      object pplblPerFech2: TppLabel
        UserName = 'lblPerFech2'
        Alignment = taCenter
        AutoSize = False
        Caption = 'Periodo: 199701'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 88106
        mmTop = 10848
        mmWidth = 97367
        BandType = 0
      end
      object ppLabel12: TppLabel
        Caption = 'DE COSTO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 24606
        mmTop = 24871
        mmWidth = 15610
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'CCOSID'
        DataPipeline = ppdbCCosto
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 529
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'CCODES'
        DataPipeline = ppdbCCosto
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 45773
        mmTop = 529
        mmWidth = 11113
        BandType = 4
      end
      object ppvSaldoMN2: TppVariable
        UserName = 'vSaldoMN2'
        Alignment = taRightJustify
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        OnCalc = ppvSaldoMN2Calc
        Transparent = True
        mmHeight = 3704
        mmLeft = 195792
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object ppvSaldoME2: TppVariable
        UserName = 'vSaldoME2'
        Alignment = taRightJustify
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        OnCalc = ppvSaldoME2Calc
        Transparent = True
        mmHeight = 3704
        mmLeft = 286015
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object ppdbtDMN: TppDBText
        OnPrint = ppdbtDMNPrint
        UserName = 'dbtDMN'
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'DEBEMN'
        DataPipeline = ppdbCCosto
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 152665
        mmTop = 265
        mmWidth = 12435
        BandType = 4
      end
      object ppdbtHMN: TppDBText
        OnPrint = ppdbtHMNPrint
        UserName = 'dbtHMN'
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'HABEMN'
        DataPipeline = ppdbCCosto
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 175948
        mmTop = 265
        mmWidth = 12700
        BandType = 4
      end
      object ppdbtHME: TppDBText
        OnPrint = ppdbtHMEPrint
        UserName = 'dbtHME'
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'HABEME'
        DataPipeline = ppdbCCosto
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 265642
        mmTop = 529
        mmWidth = 12435
        BandType = 4
      end
      object ppdbtDME: TppDBText
        OnPrint = ppdbtDMEPrint
        UserName = 'dbtDME'
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'DEBEME'
        DataPipeline = ppdbCCosto
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 244211
        mmTop = 529
        mmWidth = 12171
        BandType = 4
      end
      object ppdbtSAMN3: TppDBText
        OnPrint = ppdbtSAMN3Print
        UserName = 'dbtDMN2'
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'SALDMN'
        DataPipeline = ppdbCCosto
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 134144
        mmTop = 265
        mmWidth = 12171
        BandType = 4
      end
      object ppdbtSAME3: TppDBText
        OnPrint = ppdbtSAME3Print
        UserName = 'dbtSAME3'
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'SALDME'
        DataPipeline = ppdbCCosto
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 225161
        mmTop = 529
        mmWidth = 11906
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
    end
    object ppGroup3: TppGroup
      BreakName = 'ppDBText20'
      BreakType = btCustomField
      KeepTogether = True
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBText20: TppDBText
          UserName = 'DBText20'
          AutoSize = True
          DataField = 'CUENTAID'
          DataPipeline = ppdbCCosto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 3175
          mmTop = 265
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'DBText102'
          AutoSize = True
          DataField = 'CTADES'
          DataPipeline = ppdbCCosto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 24606
          mmTop = 265
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppvTDMN2: TppVariable
          UserName = 'vTDMN2'
          Alignment = taRightJustify
          CalcOrder = 0
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup3
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 152665
          mmTop = 794
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object ppvTHMN2: TppVariable
          UserName = 'vTHMN2'
          Alignment = taRightJustify
          CalcOrder = 1
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup3
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 175948
          mmTop = 794
          mmWidth = 12700
          BandType = 5
          GroupNo = 0
        end
        object ppvTSFMN: TppVariable
          UserName = 'vTSFMN'
          Alignment = taRightJustify
          CalcOrder = 2
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup3
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 195792
          mmTop = 794
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
        end
        object ppvTDME2: TppVariable
          UserName = 'vTDME2'
          Alignment = taRightJustify
          CalcOrder = 3
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup3
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 244211
          mmTop = 794
          mmWidth = 12171
          BandType = 5
          GroupNo = 0
        end
        object ppvTHME2: TppVariable
          UserName = 'vTHME2'
          Alignment = taRightJustify
          CalcOrder = 4
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup3
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 265642
          mmTop = 794
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object ppvTSFME: TppVariable
          UserName = 'vTSFME'
          Alignment = taRightJustify
          CalcOrder = 5
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup3
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 286015
          mmTop = 794
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label203'
          Caption = 'TOTAL..............'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 30692
          mmTop = 1058
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object pplTotMN: TppLine
          UserName = 'lTotMN'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 122502
          mmTop = 265
          mmWidth = 180000
          BandType = 5
          GroupNo = 0
        end
        object ppDBText24: TppDBText
          UserName = 'DBText201'
          AutoSize = True
          DataField = 'CUENTAID'
          DataPipeline = ppdbCCosto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 53446
          mmTop = 1058
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object ppDBText25: TppDBText
          UserName = 'DBText25'
          DataField = 'CTADES'
          DataPipeline = ppdbCCosto
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 74877
          mmTop = 1058
          mmWidth = 42069
          BandType = 5
          GroupNo = 0
        end
        object ppvTSAMN3: TppVariable
          UserName = 'vTSAMN3'
          Alignment = taRightJustify
          CalcOrder = 6
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup3
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 133086
          mmTop = 794
          mmWidth = 13494
          BandType = 5
          GroupNo = 0
        end
        object ppvTSAME3: TppVariable
          UserName = 'vTSAME3'
          Alignment = taRightJustify
          CalcOrder = 7
          DataType = dtDouble
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = []
          ResetComponent = ppGroup3
          ResetType = veGroupEnd
          Transparent = True
          mmHeight = 3704
          mmLeft = 224103
          mmTop = 529
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
