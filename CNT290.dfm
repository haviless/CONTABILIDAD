object FTelecredito: TFTelecredito
  Left = 203
  Top = 134
  Width = 780
  Height = 580
  Caption = 'Telecr'#233'dito - Pago a Proveedores'
  Color = 12904163
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCab: TPanel
    Left = 6
    Top = 5
    Width = 762
    Height = 540
    BevelOuter = bvNone
    Color = 12904163
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 116
      Height = 22
      Caption = 'Telecr'#233'ditos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 12
      Top = 242
      Width = 144
      Height = 22
      Caption = 'Detalle de Pago'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bbtnImportar: TBitBtn
      Left = 145
      Top = 9
      Width = 71
      Height = 27
      Caption = 'Importar'
      TabOrder = 0
      OnClick = bbtnImportarClick
    end
    object bbtnFiltrar: TBitBtn
      Left = 696
      Top = 10
      Width = 54
      Height = 27
      Caption = 'Filtrar'
      TabOrder = 1
      OnClick = bbtnFiltrarClick
    end
    object dbgCab: TwwDBGrid
      Left = 7
      Top = 43
      Width = 745
      Height = 176
      DisableThemesInTitle = False
      Selected.Strings = (
        'NUMTEL'#9'10'#9'N'#250'mero de~Telecr'#233'dito'#9#9
        'FECTEL'#9'11'#9'Fecha~Telecr'#233'dito'#9#9
        'CUETEL'#9'18'#9'Cuenta~Corriente'#9#9
        'MONEDA'#9'05'#9'Moneda'#9#9
        'NUMREC'#9'08'#9'Cantidad'#9#9
        'MONREC'#9'12'#9'Importe'#9#9
        'FECTRA'#9'11'#9'Fecha~Transfe.'#9#9
        'USUTRA'#9'10'#9'Usuario'#9#9
        'TRACON'#9'05'#9'Transferido~S/N'#9#9)
      IniAttributes.Delimiter = ';;'
      TitleColor = 10207162
      OnRowChanged = dbgCabRowChanged
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = 12904163
      DataSource = DMCNT.dsReporteC
      ReadOnly = True
      TabOrder = 2
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
    end
    object dbgDet: TwwDBGrid
      Left = 7
      Top = 270
      Width = 745
      Height = 266
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = 10207162
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = 12904163
      DataSource = DMCNT.dsReporte
      ReadOnly = True
      TabOrder = 3
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
    end
    object bbtnAsiDes: TBitBtn
      Left = 424
      Top = 240
      Width = 150
      Height = 25
      Caption = 'Asiento Desembolso'
      TabOrder = 4
      OnClick = bbtnAsiDesClick
    end
    object bbtnAsiDoc: TBitBtn
      Left = 592
      Top = 240
      Width = 150
      Height = 25
      Caption = 'Asiento de Cancelaci'#243'n'
      TabOrder = 5
      OnClick = bbtnAsiDocClick
    end
  end
  object pnlImporta: TPanel
    Left = 224
    Top = 13
    Width = 393
    Height = 160
    BevelWidth = 2
    TabOrder = 1
    Visible = False
    object Label5: TLabel
      Left = 16
      Top = 86
      Width = 49
      Height = 15
      Caption = 'Compa'#241#237'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 16
      Top = 41
      Width = 41
      Height = 15
      Caption = 'Archivo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 2
      Top = 2
      Width = 389
      Height = 18
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = '   Importar Archivo de Telecr'#233'dito'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object bbtnTransf: TBitBtn
      Left = 222
      Top = 122
      Width = 75
      Height = 27
      Caption = 'Transferir'
      TabOrder = 0
      OnClick = bbtnTransfClick
    end
    object BitBtn2: TBitBtn
      Left = 302
      Top = 122
      Width = 75
      Height = 27
      Caption = 'Cerrar'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object meFile: TMaskEdit
      Left = 70
      Top = 38
      Width = 307
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dblcCia: TwwDBLookupCombo
      Left = 70
      Top = 79
      Width = 49
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CIAID'#9'2'#9'Compa'#241'ia'#9'F'
        'CIADES'#9'40'#9'Descripci'#243'n'#9'F'
        'CIAABR'#9'15'#9'Abreviatura'#9'F')
      LookupTable = DMCNT.cds3
      LookupField = 'CIAID'
      Options = [loColLines, loRowLines, loTitles]
      DropDownCount = 15
      ParentFont = False
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      SearchDelay = 2
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object edtCia: TEdit
      Left = 120
      Top = 79
      Width = 256
      Height = 23
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  object odFile: TOpenDialog
    DefaultExt = 'txt'
    FileName = 'TLC*'
    InitialDir = 'c:\oaEjecuta'
    Title = 'Archivos de Telecr'#233'dito'
    Left = 532
    Top = 183
  end
  object scFile: TStrContainer
    Left = 600
    Top = 175
  end
end
