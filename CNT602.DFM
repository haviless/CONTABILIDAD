object FAsMecCxC: TFAsMecCxC
  Left = 259
  Top = 159
  Width = 715
  Height = 438
  BorderIcons = [biSystemMenu]
  Caption = 'Asientos Mecanizados: CUENTAS POR COBRAR'
  Color = 12904163
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 15
  object pnlCabecera: TPanel
    Left = 5
    Top = 5
    Width = 698
    Height = 53
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 10207162
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label3: TLabel
      Left = 18
      Top = 5
      Width = 49
      Height = 17
      Caption = 'Compañía'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 311
      Top = 5
      Width = 20
      Height = 17
      Caption = 'Año'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 364
      Top = 5
      Width = 22
      Height = 17
      Caption = 'Mes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 421
      Top = 5
      Width = 40
      Height = 17
      Caption = 'Periodo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object bbtnOk: TBitBtn
      Left = 599
      Top = 15
      Width = 30
      Height = 25
      Hint = 'Aceptar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
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
      Left = 641
      Top = 15
      Width = 30
      Height = 25
      Hint = 'Salir'
      Cancel = True
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
      Left = 16
      Top = 20
      Width = 42
      Height = 25
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Cia'#9'F'
        'CIAABR'#9'15'#9'Razón Social'#9'F')
      LookupTable = DM1.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 57
      Top = 20
      Width = 156
      Height = 25
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
    object speAno: TSpinEdit
      Left = 308
      Top = 20
      Width = 49
      Height = 27
      MaxLength = 4
      MaxValue = 2100
      MinValue = 1990
      TabOrder = 4
      Value = 1999
    end
    object speMM: TSpinEdit
      Left = 361
      Top = 20
      Width = 43
      Height = 27
      MaxLength = 2
      MaxValue = 12
      MinValue = 1
      TabOrder = 5
      Value = 12
      OnExit = speMMExit
    end
    object dbeAnoMM: TwwDBEdit
      Left = 418
      Top = 20
      Width = 53
      Height = 25
      Enabled = False
      Picture.PictureMask = '999999'
      TabOrder = 6
      UnboundDataType = wwDefault
      UsePictureMask = False
      WantReturns = False
      WordWrap = False
    end
  end
  object pnlDetalle: TPanel
    Left = 4
    Top = 58
    Width = 699
    Height = 297
    BevelInner = bvRaised
    BorderStyle = bsSingle
    Enabled = False
    TabOrder = 1
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 691
      Height = 16
      Align = alTop
      AutoSize = False
      BiDiMode = bdRightToLeft
      Caption = '   Documentos Cuentas Por Cobrar'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentColor = False
      ParentFont = False
    end
    object dbgDocCxC: TwwDBGrid
      Left = 2
      Top = 18
      Width = 691
      Height = 273
      Selected.Strings = (
        'lkTDoc'#9'5'#9'DOC'#9'F'
        'lkTDiario'#9'10'#9'Tipo de~Diario'#9'F'
        'CCSERIE'#9'5'#9'DOC~Serie'#9'F'
        'CCNODOC'#9'15'#9'DOC~Número'#9'F'
        'CCNOREG'#9'10'#9'No.Reg'#9'F'
        'CLIEID'#9'10'#9'CLIENTE'#9'F'
        'lkAux'#9'20'#9'Razón Social'#9'F'
        'lkTMon'#9'4'#9'TM'#9'F'
        'CCFCOMP'#9'10'#9'Fecha~Comprobante'#9'F')
      MemoAttributes = [mSizeable, mWordWrap, mGridShow]
      IniAttributes.Delimiter = ';;'
      TitleColor = 11974251
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoSearchOwnerForm, ecoDisableCustomControls]
      Align = alClient
      Color = clWhite
      Ctl3D = True
      DataSource = DM1.dsDetCxC
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      KeyOptions = [dgEnterToTab, dgAllowDelete]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
      FooterColor = clWindow
      FooterCellColor = clBlack
    end
  end
  object pnlPie: TPanel
    Left = 4
    Top = 354
    Width = 699
    Height = 52
    BorderWidth = 1
    BorderStyle = bsSingle
    Color = 10207162
    Enabled = False
    TabOrder = 2
    object Label4: TLabel
      Left = 11
      Top = 21
      Width = 55
      Height = 16
      Caption = 'Selección:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlGenera: TPanel
      Left = 472
      Top = 14
      Width = 195
      Height = 25
      Caption = 'pnlGenera'
      TabOrder = 2
      Visible = False
      object pbGenera: TProgressBar
        Left = 3
        Top = 3
        Width = 189
        Height = 19
        Min = 0
        Max = 100
        TabOrder = 0
      end
    end
    object btnGenAsMec: TButton
      Left = 473
      Top = 14
      Width = 195
      Height = 25
      Caption = 'Genera Asientos Mecanizados'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnGenAsMecClick
    end
    object rgMod: TRadioGroup
      Left = 79
      Top = 5
      Width = 278
      Height = 34
      BiDiMode = bdLeftToRight
      Columns = 4
      Ctl3D = True
      Items.Strings = (
        'Total'
        'Parcial'
        'No.Reg'
        'Fecha')
      ParentBiDiMode = False
      ParentCtl3D = False
      TabOrder = 1
      OnClick = rgModClick
    end
  end
  object pnlNoReg: TPanel
    Left = 223
    Top = 143
    Width = 290
    Height = 130
    BevelInner = bvRaised
    BorderWidth = 1
    Color = 10207162
    TabOrder = 3
    Visible = False
    object Label6: TLabel
      Left = 14
      Top = 36
      Width = 59
      Height = 16
      Caption = 'Tipo Diario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 186
      Top = 70
      Width = 11
      Height = 15
      Caption = 'Al'
    end
    object Label9: TLabel
      Left = 83
      Top = 70
      Width = 17
      Height = 15
      Caption = 'Del'
    end
    object Label5: TLabel
      Left = 14
      Top = 72
      Width = 48
      Height = 16
      Caption = 'Registros'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblcTDiario: TwwDBLookupCombo
      Left = 89
      Top = 31
      Width = 42
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TDIARID'#9'2'#9'T.Diario'#9'F'
        'TDIARDES'#9'20'#9'Descripción'#9'F')
      LookupTable = DM1.cdsTDiario
      LookupField = 'TDIARID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      UseTFields = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcTDiarioExit
    end
    object edtTDiario: TEdit
      Left = 130
      Top = 31
      Width = 141
      Height = 23
      Color = clSilver
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object bbtnOkReg: TBitBtn
      Left = 202
      Top = 98
      Width = 30
      Height = 25
      Hint = 'Aceptar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
    object bbtnCancReg: TBitBtn
      Left = 242
      Top = 98
      Width = 30
      Height = 25
      Hint = 'Cancelar'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
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
    object meNoReg2: TMaskEdit
      Left = 202
      Top = 64
      Width = 69
      Height = 23
      EditMask = '##########;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '          '
      OnExit = meNoReg2Exit
    end
    object Panel1: TPanel
      Left = 4
      Top = 3
      Width = 283
      Height = 19
      Caption = 'Selección Número de Registro'
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object meNoReg1: TMaskEdit
      Left = 108
      Top = 64
      Width = 69
      Height = 23
      EditMask = '##########;1;_'
      MaxLength = 10
      TabOrder = 6
      Text = '          '
      OnExit = meNoReg1Exit
    end
  end
  object pnlFecha: TPanel
    Left = 226
    Top = 180
    Width = 285
    Height = 97
    BevelInner = bvRaised
    BorderWidth = 1
    Color = 10207162
    TabOrder = 4
    Visible = False
    object Label10: TLabel
      Left = 179
      Top = 40
      Width = 11
      Height = 15
      Caption = 'Al'
    end
    object Label11: TLabel
      Left = 69
      Top = 40
      Width = 17
      Height = 15
      Caption = 'Del'
    end
    object Label13: TLabel
      Left = 14
      Top = 40
      Width = 46
      Height = 16
      Caption = 'Fecha...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bbtnOkFec: TBitBtn
      Left = 194
      Top = 66
      Width = 30
      Height = 25
      Hint = 'Aceptar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
    object bbtnCancFec: TBitBtn
      Left = 234
      Top = 66
      Width = 30
      Height = 25
      Hint = 'Cancelar'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
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
    object dbdtpFReg2: TwwDBDateTimePicker
      Left = 192
      Top = 33
      Width = 80
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 1
    end
    object dbdtpFReg1: TwwDBDateTimePicker
      Left = 90
      Top = 33
      Width = 80
      Height = 23
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 2
      Top = 3
      Width = 283
      Height = 19
      Caption = 'Selección Rango de Fechas'
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
  end
end
