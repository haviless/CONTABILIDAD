object FToolComprobante: TFToolComprobante
  Left = 251
  Top = 166
  Width = 554
  Height = 76
  Caption = 'FToolComprobante'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PnlComprobante: TPanel
    Left = 0
    Top = 0
    Width = 546
    Height = 42
    Align = alClient
    Color = 14869218
    TabOrder = 0
    object sbtABl: TSpeedButton
      Left = 145
      Top = 4
      Width = 42
      Height = 41
      Hint = 'Aceptaci'#243'n en Bloque'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000C40E0000C40E00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF5555555555555C055555
        55555555577FF55555555555CCC05555555555557777F55555555555CCC05555
        555555557777FF555555555CCCCC05555555555777777F55555555CCCCCC0555
        5555557777777FF555555CCC05CCC05555555777757777F55555CC05555CC055
        55557775555777FF55555555555CCC05555555555557777F555555555555CC05
        555555555555777FF555555555555CC05555555555555777FF555555555555CC
        05555555555555777FF555555555555CC05555555555555777FF555555555555
        5CC0555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sbtABlClick
    end
    object SpeedButton3: TSpeedButton
      Left = 35
      Top = 4
      Width = 42
      Height = 41
      Hint = 'Impresi'#243'n en Bloque'
      Flat = True
      Glyph.Data = {
        CE020000424DCE020000000000007600000028000000220000001E0000000100
        04000000000058020000CE0E0000D80E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFF0078800FFFFFFFFFFFFFFFF000000FFFFFFFFF00777888800
        FFFFFFFFFFFFFF000000FFFFFFF007777800888800FFFFFFFFFFFF000000FFFF
        F0077778878800888800FFFFFFFFFF000000FFF00777788787888800888800FF
        FFFFFF000000FF07777887778788888800888800FFFFFF000000FF8778877777
        87888888880088880FFFFF000000FF888777777787888888888800880FFFFF00
        0000F8878777777787888888888888000FFFFF000000F8F7877777778F888888
        8888888800FFFF000000F8F78777777F8877888888888888800FFF000000F8F7
        87777FF777887788888888888080FF000000F8F7877FF7777777887788888888
        80780F000000F8F78FF77799778877887788888880788F000000F8FF8877AA77
        8877777088778888808FFF000000F88F778877887777700F7088778880FFFF00
        0000FFF88F77888877700FFFF077887780FFFF000000FFFFF88F7788800FFFCC
        F7087788FFFFFF000000FFFFFFF88F7788FFCCFFFF0888FFFFFFFF000000FFFF
        FFFFF88F778FFFFCCF70FFFFFFFFFF000000FFFFFFFFFFF88F8FFCCFFFF70FFF
        FFFFFF000000FFFFFFFFFFFFF888FFFFCCFF70FFFFFFFF000000FFFFFFFFFFFF
        FFF8FFCCFFFFF70FFFFFFF000000FFFFFFFFFFFFFFFF8FFFFFCCFF700FFFFF00
        0000FFFFFFFFFFFFFFFFF8FFCCFFFFF88FFFFF000000FFFFFFFFFFFFFFFFFF8F
        FFFFF88FFFFFFF000000FFFFFFFFFFFFFFFFFFF8FFF88FFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFF888FFFFFFFFFFF000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object sbtCBl: TSpeedButton
      Left = 90
      Top = 4
      Width = 42
      Height = 41
      Hint = 'Contabilizar'
      Flat = True
      Glyph.Data = {
        06020000424D060200000000000076000000280000001A000000190000000100
        04000000000090010000CE0E0000D80E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888800000080000000000000000000000008000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000BBBBBB
        BBBBBBBBB00000000000000000000000000000000000000000000000BBBBBBBB
        BBBBBBBBBBB00000000000000000000000000000000000000000000000000000
        0000000000000000000000BBBB0BBB0B0B0B0BBB0BBB0000000000B00B0B0B0B
        0B0B0B0B0B0B0000000000B00B0B0B0B0B0B0BBB0B0B0000000000B0000B0B0B
        0B0B000B0B0B0000000000B0000BBB0BBB0B0BBB0BBB0000000000B000000000
        000B00000B000000000000B00B00000000BBB0000B000000000000BBBB000000
        000B000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000080000000000000000000000008000000888888888888
        88888888888888000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtCBlClick
    end
    object Z2sbEliminaAsiento: TSpeedButton
      Left = 274
      Top = 4
      Width = 42
      Height = 41
      Hint = 'Elimina Asiento de otros m'#243'dulos'
      Flat = True
      Glyph.Data = {
        6E1F0000424D6E1F000000000000360000002800000047000000250000000100
        180000000000381F0000CE0E0000D80E00000000000000000000A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0000000000000000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000000000000000A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A000
        0000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A00000000000008080
        80808080808080000000000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0000000000000808080808080808080000000000000A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0000000000000808080808080C0C0C080808080808080
        8080808080000000000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A000000000000080808080
        8080C0C0C0808080808080808080808080000000000000A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A000000000
        0000808080808080C0C0C0C0C0C0C0C0C0808080808080808080808080808080
        808080000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0000000000000808080808080C0C0C0C0C0C0C0C0C0808080
        808080808080808080808080808080000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000000000808080808080C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0808080808080808080808080808080808080000000A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000000000
        808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C08080808080808080808080
        80808080808080000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A000
        0000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        000000000000808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0808080808080808080808080808080808080000000A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0000000000000808080808080C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C080808080808080808080808080808080808000
        0000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000000000808080808080C0C0
        C0C0C0C0808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808080808080
        8080808080808080808080000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A00000
        00000000808080808080C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0808080808080808080808080808080808080000000A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0808080808080808080C0C0C0C0C0C0C0C0C0808080008000C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080808080808080808080808080
        808080808080000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080808080808080C0C0C0C0
        C0C0C0C0C0808080008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080
        808080808080808080808080808080808080000000A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A080
        8080C0C0C0C0C0C0C0C0C0C0C0C0808080008000008000008000008000008000
        C0C0C0C0C0C0C0C0C08080808080808080808080808080808080808080800000
        00A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0808080C0C0C0C0C0C0C0C0C0C0C0C0808080008000
        008000008000008000008000C0C0C0C0C0C0C0C0C08080808080808080808080
        80808080808080808080000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A000
        0000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080C0C0C0C0C0C0
        008000C0C0C0008000008000008000008000008000008000008000C0C0C0C0C0
        C0808080808080808080808080808080808080808080000000A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0808080C0C0C0C0C0C0008000C0C0C00080000080000080000080000080
        00008000008000C0C0C0C0C0C080808080808080808080808080808080808080
        8080000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080C0C0C0008000808080C0C0C0C0C0
        C0008000008000C0C0C0C0C0C0808080008000C0C0C0C0C0C080808080808080
        8080808080808080808080808080000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080C0C0
        C0008000808080C0C0C0C0C0C0008000008000C0C0C0C0C0C0808080008000C0
        C0C0C0C0C0808080808080808080808080808080808080808080000000A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0808080C0C0C0008000008000C0C0C0C0C0C0C0C0C0C0C0C0008000C0
        C0C0C0C0C0C0C0C0008000C0C0C0C0C0C0808080808080808080808080808080
        808080808080808080000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080C0C0C0008000008000C0C0C0C0
        C0C0C0C0C0C0C0C0008000C0C0C0C0C0C0C0C0C0008000C0C0C0C0C0C0808080
        808080808080808080808080808080808080808080000000A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080C0
        C0C0008000008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        008000C0C0C0C0C0C08080808080808080808080808080808080808080808080
        80000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0808080C0C0C0008000008000C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0008000C0C0C0C0C0C08080808080808080808080
        80808080808080808080808080000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A000
        0000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080C0C0C0008000008000
        C0C0C0008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0808080808080808080808080808080808080808080808080000000A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        808080C0C0C0008000008000C0C0C0008000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C080808080808080808080808080808080808080
        8080808080000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0808080C0C0C0008000008000008000008000C0C0
        C0C0C0C0C0C0C0008000008000008000008000C0C0C0C0C0C080808080808080
        8080808080808080808080808080808080000000A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080C0C0C00080
        00008000008000008000C0C0C0C0C0C0C0C0C0008000008000008000008000C0
        C0C0C0C0C0808080808080808080808080808080808080808080808080000000
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0808080C0C0C0C0C0C0C0C0C0008000008000008000C0C0C0C0C0C0C0C0C0C0
        C0C0008000008000008000C0C0C0C0C0C0808080808080808080808080808080
        808080808080808080808080000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0808080C0C0C0C0C0C0C0C0C000800000800000
        8000C0C0C0C0C0C0C0C0C0C0C0C0008000008000008000C0C0C0C0C0C0808080
        808080808080808080808080808080808080808080808080000000A4A0A0A4A0
        A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080C0C0C0C0
        C0C0008000008000008000008000C0C0C0C0C0C0C0C0C0008000008000008000
        008000C0C0C0C0C0C08080808080808080808080808080808080808080808080
        80808080000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0808080C0C0C0C0C0C0008000008000008000008000C0C0C0C0C0C0
        C0C0C0008000008000008000008000C0C0C0C0C0C08080808080808080808080
        80808080808080808080808080808080000000A4A0A0A4A0A0A4A0A0A4A0A000
        0000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0008000008000008000008000008000C0C0C0008000C0C0C0C0C0
        C0808080808080808080808080808080808080808080808080808080000000A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00080000080000080000080000080
        00C0C0C0008000C0C0C0C0C0C080808080808080808080808080808080808080
        8080808080808080000000A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0808080008000008000C0C0C0C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
        8080808080808080808080808080808080808080000000A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0808080008000008000C0C0C0C0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF808080808080808080808080808080808080808080
        000000A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0A4A0A08080
        80C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0FFFFFFFFFFFF808080808080C0C0C0C0C0C0C0C0C0FFFFFFFFFFFFFFFFFF
        808080808080808080808080808080000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF808080808080C0C0C0C0C0C0
        C0C0C0FFFFFFFFFFFFFFFFFF808080808080808080808080808080000000A4A0
        A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0A4A0A0808080C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF808080808080
        C0C0C0808080FFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFFFFFF
        FF808080808080000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        FFFFFFFFFFFF808080808080C0C0C0808080FFFFFFFFFFFFC0C0C0C0C0C0C0C0
        C0C0C0C0FFFFFFFFFFFFFFFFFF808080808080000000A4A0A0A4A0A0A4A0A000
        0000A4A0A0A4A0A0A4A0A0A4A0A0808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0FFFFFFFFFFFF808080808080808080C0C0C0C0C0C0808080FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF00
        0000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF8080808080808080
        80C0C0C0C0C0C0808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0C0C0C0C0
        C0C0C0C0C0FFFFFFFFFFFF000000A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0
        A4A0A0A4A0A0808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF8080
        80808080FFFFFFFFFFFF808080C0C0C0808080FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFC0C0C0C0C0C0C0C0C0FFFFFFFFFFFF000000A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0FFFFFFFFFFFF808080808080FFFFFFFFFFFF808080C0C0C0808080FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0C0C0C0C0C0C0FFFFFF
        FFFFFF000000A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0808080C0C0
        C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF808080808080FFFFFFFFFFFFFFFFFFFF
        FFFF808080C0C0C0FFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF808080FFFFFF808080808080A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0808080C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFF80808080
        8080FFFFFFFFFFFFFFFFFFFFFFFF808080C0C0C0FFFFFF808080FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF808080808080A4A0A0A4A0
        A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0808080C0C0C0C0C0C0FFFFFFFF
        FFFF808080808080FFFFFF808080FFFFFFFFFFFFFFFFFF808080C0C0C0FFFFFF
        FFFFFF808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080808080808080
        80A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A080
        8080C0C0C0C0C0C0FFFFFFFFFFFF808080808080FFFFFF808080FFFFFFFFFFFF
        FFFFFF808080C0C0C0FFFFFFFFFFFF808080808080FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF808080808080808080A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A000
        0000A4A0A0A4A0A0A4A0A0808080FFFFFFFFFFFF808080808080FFFFFFFFFFFF
        FFFFFF808080FFFFFFFFFFFF808080C0C0C0FFFFFFFFFFFFFFFFFF808080C0C0
        C0808080FFFFFFFFFFFFFFFFFF808080808080A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080FFFFFFFFFFFF
        808080808080FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFF808080C0C0C0FFFF
        FFFFFFFFFFFFFF808080C0C0C0808080FFFFFFFFFFFFFFFFFF808080808080A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0
        A4A0A0808080FFFFFF808080808080808080FFFFFFFFFFFFFFFFFF808080FFFF
        FF808080C0C0C0FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF808080FFFFFFFF
        FFFF808080FFFFFF808080A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080FFFFFF808080808080808080FFFF
        FFFFFFFFFFFFFF808080FFFFFF808080C0C0C0FFFFFFFFFFFFFFFFFFFFFFFF80
        8080FFFFFF808080FFFFFFFFFFFF808080FFFFFF808080A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0808080FFFF
        FFFFFFFF808080808080808080FFFFFFFFFFFF808080FFFFFF808080FFFFFFFF
        FFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF808080808080FFFFFFFFFFFF
        808080A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0808080FFFFFFFFFFFF808080808080808080FFFFFFFFFFFF80
        8080FFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFF
        808080808080FFFFFFFFFFFF808080A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0A4A0A0808080808080FFFFFFFF
        FFFFFFFFFF808080808080808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0808080808080FFFFFFFFFFFFFFFFFF808080808080808080808080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF808080A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A000
        0000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080808080808080FFFFFF
        FFFFFFFFFFFF808080808080808080FFFFFFFFFFFFFFFFFF8080808080808080
        80FFFFFFFFFFFFFFFFFF808080808080A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        808080808080808080FFFFFFFFFFFFFFFFFF808080808080808080FFFFFFFFFF
        FFFFFFFF808080808080808080FFFFFFFFFFFFFFFFFF808080808080A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080808080808080FFFF
        FFFFFFFFFFFFFF808080808080FFFFFF808080A4A0A0A4A0A080808080808080
        8080A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0808080808080808080FFFFFFFFFFFFFFFFFF808080808080FFFFFF808080A4
        A0A0A4A0A0808080808080808080A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0808080808080808080A4
        A0A0A4A0A0808080808080A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0808080808080808080A4A0A0A4A0A0808080808080A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0000000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A000
        0000A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0
        A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4
        A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0
        A4A0A0A4A0A0A4A0A0A4A0A0A4A0A0000000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = Z2sbEliminaAsientoClick
    end
    object Z2sbPlanillas: TSpeedButton
      Left = 457
      Top = 4
      Width = 42
      Height = 41
      Hint = 'Importar Asientos de Planillas'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = Z2sbPlanillasClick
    end
  end
end
