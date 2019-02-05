object FApertura: TFApertura
  Left = 352
  Top = 213
  Width = 327
  Height = 324
  BorderIcons = [biSystemMenu]
  Caption = 'Apertura'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 5
    Top = 2
    Width = 308
    Height = 291
    BevelInner = bvRaised
    BorderWidth = 1
    Color = 10207162
    TabOrder = 0
    object lblCia: TLabel
      Left = 19
      Top = 21
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
      Left = 19
      Top = 53
      Width = 20
      Height = 16
      Caption = 'A'#241'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlGenera: TPanel
      Left = 88
      Top = 329
      Width = 411
      Height = 49
      TabOrder = 6
      Visible = False
      object lblProc: TLabel
        Left = 81
        Top = 4
        Width = 238
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object pbGenera: TProgressBar
        Left = 1
        Top = 21
        Width = 408
        Height = 18
        TabOrder = 0
      end
    end
    object dblcCia: TwwDBLookupCombo
      Left = 91
      Top = 16
      Width = 49
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'3'#9'ID'#9'T'
        'CIAABR'#9'15'#9'Compa'#241#237'a'#9'T')
      LookupTable = DM1.cdsCia
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      DropDownCount = 15
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblcCiaExit
    end
    object edtCia: TEdit
      Left = 144
      Top = 16
      Width = 150
      Height = 21
      Color = clSilver
      Enabled = False
      TabOrder = 2
    end
    object speAno: TSpinEdit
      Left = 91
      Top = 47
      Width = 51
      Height = 22
      MaxLength = 4
      MaxValue = 2100
      MinValue = 2000
      TabOrder = 1
      Value = 2002
      OnExit = speAnoExit
    end
    object bbtnOk: TBitBtn
      Left = 25
      Top = 252
      Width = 120
      Height = 28
      Caption = 'Iniciar Proceso'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
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
      Left = 155
      Top = 252
      Width = 120
      Height = 28
      Hint = 'Regresar al Menu Principal'
      Cancel = True
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 5
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
    object gbAApe: TGroupBox
      Left = 15
      Top = 78
      Width = 265
      Height = 156
      Caption = '  Asiento Apertura  '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object Label6: TLabel
        Left = 9
        Top = 27
        Width = 39
        Height = 15
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 9
        Top = 54
        Width = 43
        Height = 15
        Caption = 'T.Diario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label10: TLabel
        Left = 9
        Top = 81
        Width = 40
        Height = 15
        Caption = 'N'#250'mero'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label11: TLabel
        Left = 9
        Top = 108
        Width = 28
        Height = 15
        Caption = 'Glosa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label12: TLabel
        Left = 165
        Top = 81
        Width = 22
        Height = 15
        Caption = 'Lote'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 9
        Top = 135
        Width = 116
        Height = 15
        Caption = 'Queda Contabilizado ?'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
        Visible = False
      end
      object edtPeriodoAA: TEdit
        Left = 60
        Top = 21
        Width = 51
        Height = 23
        Color = clSilver
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object dblcTDiarioAA: TwwDBLookupCombo
        Left = 60
        Top = 49
        Width = 51
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TDIARID'#9'2'#9'Tipo de Diario'#9'F'
          'TDIARDES'#9'40'#9'Descripci'#243'n'#9'F')
        LookupTable = DM1.cdsTDiario
        LookupField = 'TDIARID'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        DropDownCount = 15
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        UseTFields = False
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcTDiarioAAExit
      end
      object edtTDiarioAA: TEdit
        Left = 117
        Top = 49
        Width = 134
        Height = 23
        Color = clActiveBorder
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object dbeNoCompAA: TwwDBEdit
        Left = 60
        Top = 77
        Width = 85
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Picture.PictureMask = '*10[#]'
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtGlosaAA: TEdit
        Left = 60
        Top = 104
        Width = 191
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Text = 'Asiento por Apertura de A'#241'o'
      end
      object dbeLoteAA: TwwDBEdit
        Left = 199
        Top = 77
        Width = 52
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Picture.PictureMask = '*4[#]'
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object rbAAContS: TRadioButton
        Left = 140
        Top = 133
        Width = 34
        Height = 17
        Caption = 'Si'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        TabStop = True
        Visible = False
      end
      object rbAAContN: TRadioButton
        Left = 196
        Top = 133
        Width = 34
        Height = 17
        Caption = 'No'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Visible = False
      end
    end
  end
end
