object FCierrePer: TFCierrePer
  Left = 245
  Top = 185
  Width = 705
  Height = 586
  BorderIcons = [biSystemMenu]
  Caption = 'Cierre de Periodos Contables'
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object pnlCierres: TPanel
    Left = 7
    Top = 2
    Width = 677
    Height = 201
    BevelInner = bvRaised
    BevelOuter = bvNone
    BorderWidth = 1
    Color = 14869218
    TabOrder = 0
    object lblAno: TLabel
      Left = 254
      Top = 5
      Width = 20
      Height = 17
      Caption = 'A'#241'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblCia: TLabel
      Left = 16
      Top = 5
      Width = 49
      Height = 17
      Caption = 'Compa'#241'ia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object bbtnOk: TBitBtn
      Left = 276
      Top = 158
      Width = 133
      Height = 30
      Hint = 'Aceptar Cambios'
      Caption = 'Confirmar Cerrado'
      TabOrder = 4
      OnClick = bbtnOkClick
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
    object bbtnCanc: TBitBtn
      Left = 564
      Top = 158
      Width = 100
      Height = 30
      Hint = 'Cancelar Ingreso'
      Cancel = True
      Caption = 'Cancela'
      TabOrder = 5
      OnClick = bbtnCancClick
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
    object dbgCerrado: TwwDBGrid
      Left = 38
      Top = 89
      Width = 601
      Height = 62
      DisableThemesInTitle = False
      Selected.Strings = (
        'FECCIERRE'#9'18'#9'F.Cierre'#9'F'
        'PER01'#9'5'#9'Ene.'#9'F'
        'PER02'#9'5'#9'Feb.'#9'F'
        'PER03'#9'5'#9'Mar.'#9'F'
        'PER04'#9'5'#9'Abr.'#9'F'
        'PER05'#9'5'#9'May.'#9'F'
        'PER06'#9'5'#9'Jun.'#9'F'
        'PER07'#9'5'#9'Jul.'#9'F'
        'PER08'#9'5'#9'Ago.'#9'F'
        'PER09'#9'5'#9'Set.'#9'F'
        'PER10'#9'5'#9'Oct.'#9'F'
        'PER11'#9'5'#9'Nov.'#9'F'
        'PER12'#9'5'#9'Dic.'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = [dgEnterToTab, dgAllowDelete]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
    end
    object dblcCia: TwwDBLookupCombo
      Left = 11
      Top = 24
      Width = 41
      Height = 23
      DropDownAlignment = taLeftJustify
      LookupTable = DMCNT.cdsCia
      LookupField = 'CIAID'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnExit = dblcCiaExit
      OnNotInList = dblcCiaNotInList
    end
    object edtCia: TEdit
      Left = 53
      Top = 24
      Width = 177
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object speAno: TSpinEdit
      Left = 238
      Top = 24
      Width = 57
      Height = 24
      MaxLength = 4
      MaxValue = 2020
      MinValue = 2000
      TabOrder = 2
      Value = 2011
      OnExit = speAnoExit
    end
    object rgMes: TRadioGroup
      Left = 300
      Top = 5
      Width = 366
      Height = 77
      Caption = 'Mes'
      Columns = 4
      Items.Strings = (
        'Enero'
        'Febrero'
        'Marzo'
        'Abril'
        'Mayo'
        'Junio'
        'Julio'
        'Agosto'
        'Setiembre'
        'Octubre'
        'Noviembre'
        'Diciembre')
      TabOrder = 3
      OnClick = rgMesClick
    end
    object bbtnOpen: TBitBtn
      Left = 420
      Top = 158
      Width = 133
      Height = 30
      Hint = 'Aceptar Cambios'
      Caption = 'Abrir Periodo'
      TabOrder = 7
      OnClick = bbtnOpenClick
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
  end
  object Panel1: TPanel
    Left = 8
    Top = 206
    Width = 675
    Height = 337
    Color = 14869218
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 6
      Width = 127
      Height = 21
      Caption = 'Bloquear Usuarios'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 38
      Width = 46
      Height = 18
      Caption = 'Periodo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object wwDBGrid1: TwwDBGrid
      Left = 179
      Top = 6
      Width = 485
      Height = 324
      DisableThemesInTitle = False
      Selected.Strings = (
        'USERID'#9'15'#9'Usuario'#9'F'
        'USERNOM'#9'20'#9'Nombre'#9'F'
        'ESTADO'#9'11'#9'Estado'#9'F'
        'USUCIERRE'#9'15'#9'Usuario Cierre'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DMCNT.dsBloqueo
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
    object bbtnBloqueaTodo: TBitBtn
      Left = 18
      Top = 90
      Width = 150
      Height = 25
      Caption = 'Bloquear Todos'
      TabOrder = 1
      OnClick = bbtnBloqueaTodoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
        333333333F777773FF333333008888800333333377333F3773F3333077870787
        7033333733337F33373F3308888707888803337F33337F33337F330777880887
        7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
        7703337F33377733337F33088888888888033373FFFFFFFFFF73333000000000
        00333337777777777733333308033308033333337F7F337F7F33333308033308
        033333337F7F337F7F33333308033308033333337F73FF737F33333377800087
        7333333373F77733733333333088888033333333373FFFF73333333333000003
        3333333333777773333333333333333333333333333333333333}
      Margin = 8
      NumGlyphs = 2
    end
    object bbtnDesBloqTodo: TBitBtn
      Left = 18
      Top = 296
      Width = 150
      Height = 25
      Caption = 'Des-Bloquear Todos'
      TabOrder = 2
      OnClick = bbtnDesBloqTodoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
        333333333F777773FF333333008888800333333377333F3773F3333077870787
        7033333733337F33373F3308888707888803337F33337F33337F330777880887
        7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
        7703337F33377733337FB3088888888888033373FFFFFFFFFF733B3000000000
        0033333777777777773333BBBB3333080333333333F3337F7F33BBBB707BB308
        03333333373F337F7F3333BB08033308033333337F7F337F7F333B3B08033308
        033333337F73FF737F33B33B778000877333333373F777337333333B30888880
        33333333373FFFF73333333B3300000333333333337777733333}
      Margin = 8
      NumGlyphs = 2
    end
    object bbtnBloqueaUsu: TBitBtn
      Left = 18
      Top = 171
      Width = 150
      Height = 25
      Caption = 'Bloquear Usuario'
      TabOrder = 3
      OnClick = bbtnBloqueaUsuClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
        333333333F777773FF333333008888800333333377333F3773F3333077870787
        7033333733337F33373F3308888707888803337F33337F33337F330777880887
        7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
        7703337F33377733337F33088888888888033373FFFFFFFFFF73333000000000
        00333337777777777733333308033308033333337F7F337F7F33333308033308
        033333337F7F337F7F33333308033308033333337F73FF737F33333377800087
        7333333373F77733733333333088888033333333373FFFF73333333333000003
        3333333333777773333333333333333333333333333333333333}
      Margin = 8
      NumGlyphs = 2
    end
    object bbtnDesBloqUsu: TBitBtn
      Left = 18
      Top = 227
      Width = 150
      Height = 25
      Caption = 'Des-Bloquear Usuario'
      TabOrder = 4
      OnClick = bbtnDesBloqUsuClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
        333333333F777773FF333333008888800333333377333F3773F3333077870787
        7033333733337F33373F3308888707888803337F33337F33337F330777880887
        7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
        7703337F33377733337FB3088888888888033373FFFFFFFFFF733B3000000000
        0033333777777777773333BBBB3333080333333333F3337F7F33BBBB707BB308
        03333333373F337F7F3333BB08033308033333337F7F337F7F333B3B08033308
        033333337F73FF737F33B33B778000877333333373F777337333333B30888880
        33333333373FFFF73333333B3300000333333333337777733333}
      Margin = 8
      NumGlyphs = 2
    end
    object mePeriodo: TComboBox
      Left = 63
      Top = 36
      Width = 72
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ItemHeight = 16
      MaxLength = 6
      ParentFont = False
      TabOrder = 5
      OnChange = mePeriodoChange
    end
    object bbtnUsu: TBitBtn
      Left = 140
      Top = 35
      Width = 31
      Height = 25
      TabOrder = 6
      OnClick = bbtnUsuClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
  end
end