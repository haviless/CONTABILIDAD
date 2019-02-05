object FTransfGiro: TFTransfGiro
  Left = 226
  Top = 118
  Width = 790
  Height = 596
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Transferir Oficios'
  Color = clMoneyGreen
  Constraints.MaxHeight = 596
  Constraints.MaxWidth = 790
  Constraints.MinHeight = 596
  Constraints.MinWidth = 790
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 13
    Top = 10
    Width = 60
    Height = 19
    Caption = 'Periodo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 393
    Top = 10
    Width = 55
    Height = 19
    Caption = 'Equipo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 2
    Top = 38
    Width = 777
    Height = 523
    Color = clMoneyGreen
    TabOrder = 4
    object Label1: TLabel
      Left = 18
      Top = 8
      Width = 306
      Height = 24
      Caption = 'Oficios Generados por Transferir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 19
      Top = 261
      Width = 326
      Height = 24
      Caption = 'Oficios Transferidos a Contabilidad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sbDisenoRep: TSpeedButton
      Left = 0
      Top = 488
      Width = 9
      Height = 22
      Flat = True
      OnClick = sbDisenoRepClick
    end
    object dbgOficio: TwwDBGrid
      Left = 8
      Top = 35
      Width = 759
      Height = 215
      DisableThemesInTitle = False
      ControlType.Strings = (
        'Estado;CheckBox;S;N'
        'ESTCON;CheckBox;S;N')
      Selected.Strings = (
        'Fecha'#9'11'#9'Fecha'
        'Equipo'#9'6'#9'Equipo'
        'NumOfi'#9'6'#9'No.~Oficio'
        'CtaOri'#9'4'#9'Tipo'
        'AbrBco'#9'48'#9'Cuenta Corriente'
        'TipMov'#9'5'#9'Tipo  ~Movi.'#9'F'
        'Moneda'#9'3'#9'TM'
        'Monto'#9'10'#9'Monto'
        'Usuario'#9'12'#9'Usuario'
        'Estado'#9'3'#9'Anulado')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsOficios
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgOficioDblClick
    end
    object dbgConta: TwwDBGrid
      Left = 8
      Top = 285
      Width = 760
      Height = 230
      DisableThemesInTitle = False
      ControlType.Strings = (
        'Estado;CheckBox;ANU;'
        'ESTCON;CheckBox;S;N')
      Selected.Strings = (
        'Fecha'#9'11'#9'Fecha'#9#9
        'Equipo'#9'5'#9'Equipo'#9#9
        'NumOfi'#9'6'#9'No.~Oficio'#9#9
        'CtaOri'#9'4'#9'Cta.~Cte.'#9#9
        'AbrBco'#9'40'#9'Cuenta Corriente'#9#9
        'TipMov'#9'3'#9'Tip.~Mov.'#9#9
        'Moneda'#9'3'#9'TM'#9#9
        'Monto'#9'10'#9'Monto'#9#9
        'Usuario'#9'12'#9'Usuario'#9#9
        'Estado'#9'6'#9'Anulado~Si/No'#9#9
        'ESTCON'#9'5'#9'Contab~Si/No'#9#9)
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
    end
    object bbtnTransferir: TBitBtn
      Left = 606
      Top = 5
      Width = 159
      Height = 27
      Caption = 'Tranferir a Contabilidad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = bbtnTransferirClick
    end
    object wwDBGrid1: TwwDBGrid
      Left = 40
      Top = 128
      Width = 617
      Height = 305
      DisableThemesInTitle = False
      Selected.Strings = (
        'DesUser'#9'26'#9'DesUser'
        'numliq'#9'6'#9'numliq'
        'anoliq'#9'4'#9'anoliq'
        'codusu'#9'6'#9'codusu'
        'imptot'#9'10'#9'imptot'
        'Cuenta'#9'10'#9'Cuenta'
        'hora'#9'15'#9'hora'
        'Importe'#9'10'#9'Importe')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsLiqui
      TabOrder = 3
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      Visible = False
    end
    object cbDisenoRep: TCheckBox
      Left = 432
      Top = 8
      Width = 97
      Height = 17
      Caption = 'Dise'#241'o Rep'
      TabOrder = 4
      Visible = False
    end
  end
  object seMes: TSpinEdit
    Left = 83
    Top = 5
    Width = 42
    Height = 29
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 2
    MaxValue = 12
    MinValue = 1
    ParentFont = False
    TabOrder = 0
    Value = 1
  end
  object seAno: TSpinEdit
    Left = 134
    Top = 5
    Width = 62
    Height = 29
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 4
    MaxValue = 2010
    MinValue = 2006
    ParentFont = False
    TabOrder = 1
    Value = 2006
  end
  object bbtnBuscar: TBitBtn
    Left = 216
    Top = 6
    Width = 107
    Height = 27
    Caption = 'Buscar Oficios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = bbtnBuscarClick
  end
  object meEQ: TMaskEdit
    Left = 456
    Top = 5
    Width = 56
    Height = 27
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 4
    ParentFont = False
    TabOrder = 3
    Text = 'EACO'
  end
  object ado2: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Si' +
      'stemas\AREAS\CREDITOS\dbgirb\mgirban.mdb;Mode=Read;Extended Prop' +
      'erties="";Persist Security Info=False;Jet OLEDB:System database=' +
      '"";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet' +
      ' OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=0;Jet OLEDB' +
      ':Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;' +
      'Jet OLEDB:New Database Password="";Jet OLEDB:Create System Datab' +
      'ase=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy ' +
      'Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair' +
      '=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmRead
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 526
    Top = 4
  end
  object cdsOficios: TADODataSet
    Connection = ado2
    CursorType = ctStatic
    CommandText = 
      'select A.*,'#39'N'#39' AS ESTCON from tOfiDes A WHERE FECHA >=#01/10/200' +
      '6# order by fecha desc, equipo'
    Parameters = <>
    Left = 560
    Top = 4
  end
  object dsOficios: TDataSource
    DataSet = cdsOficios
    Left = 590
    Top = 4
  end
  object cdsCuenta: TADODataSet
    Connection = ado2
    CursorType = ctStatic
    CommandText = 
      'select a.CodBco, a.CtaOri, a.NumOfi, a.Equipo, b.CtaBanco '#13#10'from' +
      ' tOfiDes a, tBancos b'#13#10'where a.CodBco=b.CodBco and a.CtaOri=b.Co' +
      'dCta'
    Parameters = <>
    Left = 624
    Top = 4
  end
  object DataSource1: TDataSource
    DataSet = cdsCuenta
    Left = 654
    Top = 4
  end
  object cdsLiqui: TADODataSet
    Connection = ado2
    CursorType = ctStatic
    CommandText = 
      'Select B.DesUser, c.numliq, a.anoliq, a.codusu, imptot, Cuenta, ' +
      'c.hora, Importe'#13#10'from tMovCab A, tUserLiq B, tMovDet C '#13#10'Where a' +
      '.EQUIPO='#39'EACO'#39' and a.NUMOFI='#39'00414'#39' '#13#10'and a.ANOLIQ='#39'2006'#39' and a.' +
      'CodUsu=b.CodUser '#13#10'and a.numliq= c.NumLiq and a.codusu=c.codusu ' +
      'and a.anoliq=c.anoliq'#13#10'ORDER BY b.DesUser, a.numliq, c.hora'
    Parameters = <>
    Left = 692
    Top = 4
  end
  object dsLiqui: TwwDataSource
    DataSet = cdsLiqui
    Left = 722
    Top = 4
  end
  object ppdb1: TppDBPipeline
    UserName = 'db1'
    Left = 674
    Top = 294
  end
  object ppr1: TppReport
    AutoStop = False
    DataPipeline = ppdb1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\oaEjecuta\RTMS\CNT\Dema\SustentoOficios.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 706
    Top = 294
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppdb1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NUMOFI'
        DataPipeline = ppdb1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppdb1'
        mmHeight = 4022
        mmLeft = 43921
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppd1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppr1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 738
    Top = 294
  end
end
