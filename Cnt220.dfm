object FNivel: TFNivel
  Left = 560
  Top = 297
  BorderStyle = bsSingle
  Caption = 'Centro de Costo'
  ClientHeight = 378
  ClientWidth = 294
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lblNivel: TLabel
    Left = 26
    Top = 6
    Width = 32
    Height = 15
    Caption = 'N.C.C.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblIdCCosto: TLabel
    Left = 122
    Top = 6
    Width = 80
    Height = 15
    Caption = 'Id Centro Costo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblDesCCosto: TLabel
    Left = 26
    Top = 62
    Width = 103
    Height = 15
    Caption = 'Descripci'#243'n C.Costo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object lblDig: TLabel
    Left = 82
    Top = 6
    Width = 21
    Height = 15
    Caption = 'Dig.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 27
    Top = 231
    Width = 216
    Height = 15
    Caption = 'Copiar C.Costo a las Siguientes Compa'#241#237'as'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object dbeIdCCosto: TwwDBEdit
    Left = 122
    Top = 22
    Width = 81
    Height = 21
    TabOrder = 1
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
    OnExit = dbeIdCCostoExit
    OnKeyPress = dbeIdCCostoKeyPress
  end
  object rgMov: TRadioGroup
    Left = 32
    Top = 119
    Width = 220
    Height = 38
    Caption = 'Es de Movimiento ?'
    Columns = 2
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    Items.Strings = (
      'Si'
      'No')
    ParentFont = False
    TabOrder = 3
  end
  object rgActivo: TRadioGroup
    Left = 32
    Top = 182
    Width = 220
    Height = 38
    Caption = 'Activo'
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    Items.Strings = (
      'Si'
      'No')
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object dblcNivel: TwwDBLookupCombo
    Left = 26
    Top = 22
    Width = 49
    Height = 21
    DropDownAlignment = taLeftJustify
    Options = [loColLines, loTitles]
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    OnExit = dblcNivelExit
    OnNotInList = dblcNivelNotInList
  end
  object dbeDesCCosto: TwwDBEdit
    Left = 26
    Top = 78
    Width = 241
    Height = 21
    MaxLength = 30
    TabOrder = 2
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object Z2bbtnOk: TBitBtn
    Left = 179
    Top = 343
    Width = 32
    Height = 30
    Hint = 'Registra'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = Z2bbtnOkClick
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
  object Z2bbtnCanc: TBitBtn
    Left = 215
    Top = 343
    Width = 32
    Height = 30
    Hint = 'Cancela Datos'
    Cancel = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = Z2bbtnCancClick
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
  object dbeDig: TwwDBEdit
    Left = 82
    Top = 22
    Width = 25
    Height = 21
    Color = clActiveBorder
    Enabled = False
    TabOrder = 8
    UnboundDataType = wwDefault
    WantReturns = False
    WordWrap = False
  end
  object chlbCia: TCheckListBox
    Left = 23
    Top = 248
    Width = 241
    Height = 88
    OnClickCheck = chlbCiaClickCheck
    ItemHeight = 13
    TabOrder = 5
    Visible = False
  end
end
