object FPlnCta: TFPlnCta
  Left = 221
  Top = 154
  Width = 780
  Height = 546
  BorderIcons = [biSystemMenu]
  Caption = 'SOLContabilidad - Plan de Cuentas Contables'
  Color = 14869218
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label13: TLabel
    Left = 160
    Top = 96
    Width = 104
    Height = 15
    Caption = 'Cuenta Automatica 1'
  end
  object Label14: TLabel
    Left = 8
    Top = 96
    Width = 143
    Height = 15
    Caption = 'Flag de Cuenta Automatica 1'
  end
  object Label15: TLabel
    Left = 280
    Top = 96
    Width = 139
    Height = 15
    Caption = 'Flag Debe/Haber  Cta.Aut.1'
  end
  object Label6: TLabel
    Left = 25
    Top = 219
    Width = 92
    Height = 15
    Caption = 'Cuenta de Destino'
  end
  object pnlReporte: TPanel
    Left = 16
    Top = 129
    Width = 568
    Height = 121
    BevelInner = bvLowered
    Color = 10207162
    TabOrder = 1
    Visible = False
    object Label24: TLabel
      Left = 13
      Top = 7
      Width = 28
      Height = 15
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
      Width = 73
      Height = 15
      Caption = 'Cuenta Inicial'
    end
    object Label27: TLabel
      Left = 277
      Top = 72
      Width = 63
      Height = 15
      Caption = 'Cuenta Final'
    end
    object Label28: TLabel
      Left = 73
      Top = 8
      Width = 37
      Height = 15
      Caption = 'D'#237'gitos'
    end
    object dblcNivel: TwwDBLookupCombo
      Left = 10
      Top = 23
      Width = 49
      Height = 23
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NIVEL'#9'2'#9'Nivel'#9'F'
        'DIGITOS'#9'10'#9'Digitos'#9'F')
      LookupField = 'NIVEL'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblcNivelChange
      OnExit = dblcNivelExit
    end
    object dbeNivel: TwwDBEdit
      Left = 71
      Top = 23
      Width = 41
      Height = 23
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object Panel4: TPanel
      Left = 2
      Top = 48
      Width = 573
      Height = 2
      TabOrder = 2
    end
    object dblcdCtaInic: TwwDBLookupComboDlg
      Left = 9
      Top = 88
      Width = 90
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CUENTAID'#9'15'#9'Id'#9'F'
        'CTADES'#9'40'#9'Cuenta Contable'#9'F')
      LookupField = 'CUENTAID'
      TabOrder = 3
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
      Height = 23
      Enabled = False
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcdCtaFinal: TwwDBLookupComboDlg
      Left = 276
      Top = 88
      Width = 90
      Height = 23
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      Selected.Strings = (
        'CUENTAID'#9'15'#9'Id'#9'F'
        'CTADES'#9'40'#9'Cuenta Contable'#9'F')
      LookupField = 'CUENTAID'
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = dblcdCtaFinalChange
      OnExit = dblcdCtaFinalExit
    end
    object dbeCtaFinal: TwwDBEdit
      Left = 373
      Top = 87
      Width = 185
      Height = 23
      Enabled = False
      TabOrder = 6
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
      TabOrder = 7
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
      Width = 25
      Height = 25
      Hint = 'Cancela Datos'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = Z2bbtnCanc3Click
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
  end
  object pnlFondo: TPanel
    Left = 9
    Top = 101
    Width = 579
    Height = 158
    Color = clNavy
    TabOrder = 2
    Visible = False
    object Label29: TLabel
      Left = 13
      Top = 5
      Width = 152
      Height = 13
      Caption = 'Impresi'#243'n Plan de Cuentas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlPrincipal: TPanel
    Left = 3
    Top = 2
    Width = 765
    Height = 508
    Color = 14869218
    TabOrder = 0
    object pnlDetalle: TPanel
      Left = 7
      Top = 7
      Width = 750
      Height = 464
      BevelInner = bvLowered
      Color = 14869218
      TabOrder = 0
      object lblCopiarCuentas: TLabel
        Left = 392
        Top = 341
        Width = 213
        Height = 15
        Caption = 'Copiar Cuenta a las siguientes Compa'#241#237'as:'
      end
      object Label1: TLabel
        Left = 9
        Top = 4
        Width = 49
        Height = 15
        Caption = 'Compa'#241#237'a'
      end
      object Label2: TLabel
        Left = 209
        Top = 4
        Width = 82
        Height = 15
        Caption = 'Cuenta Contable'
      end
      object Label3: TLabel
        Left = 317
        Top = 4
        Width = 100
        Height = 15
        Caption = 'Descripci'#243'n Cuenta'
      end
      object Label4: TLabel
        Left = 585
        Top = 4
        Width = 62
        Height = 15
        Caption = 'Abreviatura'
      end
      object dbeCta: TwwDBEdit
        Left = 206
        Top = 20
        Width = 107
        Height = 23
        DataField = 'CUENTAID'
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeCtaExit
      end
      object dblcdCuenta: TwwDBLookupComboDlg
        Left = 205
        Top = 20
        Width = 107
        Height = 23
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'CUENTAID'#9'20'#9'Cuenta'#9'F'
          'CTADES'#9'40'#9'Descripci'#243'n'#9'F')
        DataField = 'CUENTAID'
        LookupField = 'CUENTAID'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        UseTFields = False
        OnExit = dblcdCuentaExit
      end
      object gbOtrosFlags: TGroupBox
        Left = 8
        Top = 104
        Width = 365
        Height = 353
        TabOrder = 9
        object lblModuloparaAjusteDC: TLabel
          Left = 11
          Top = 131
          Width = 271
          Height = 15
          Caption = 'M'#243'dulo que afecta al ajuste x Dif. de Tipo de Cambio'
          Enabled = False
        end
        object dbcbCCosto: TCheckBox
          Left = 8
          Top = 45
          Width = 153
          Height = 17
          Caption = 'Requiere Centro de Costo'
          TabOrder = 2
          OnClick = dbcbCCostoClick
        end
        object dbcbDoc: TCheckBox
          Left = 8
          Top = 10
          Width = 153
          Height = 17
          Caption = 'Requiere Nro. Documento'
          TabOrder = 0
        end
        object dbcbAux: TCheckBox
          Left = 8
          Top = 27
          Width = 153
          Height = 17
          Caption = 'Requiere Auxiliar/Anexo'
          TabOrder = 1
          OnClick = dbcbAuxClick
        end
        object dbcbEsDifCambioGP: TCheckBox
          Left = 8
          Top = 86
          Width = 170
          Height = 17
          Caption = 'Es de Diferencia de Cambio'
          TabOrder = 7
          OnClick = dbcbEsDifCambioGPClick
        end
        object dbcbMayorizaenME: TCheckBox
          Left = 168
          Top = 27
          Width = 189
          Height = 17
          Caption = 'Mayoriza en Moneda Extranjera'
          TabOrder = 5
        end
        object gbPlazo: TGroupBox
          Left = 9
          Top = 175
          Width = 141
          Height = 40
          Caption = 'Plazo'
          TabOrder = 13
          Visible = False
          object chbPlazoCorto: TCheckBox
            Left = 8
            Top = 17
            Width = 60
            Height = 17
            Caption = 'Corto'
            TabOrder = 0
            OnClick = chbPlazoCortoClick
          end
          object chbPlazoLargo: TCheckBox
            Left = 72
            Top = 17
            Width = 60
            Height = 17
            Caption = 'Largo'
            TabOrder = 1
            OnClick = chbPlazoLargoClick
          end
        end
        object dbcbSeTomaAjusteDC: TCheckBox
          Left = 8
          Top = 108
          Width = 170
          Height = 17
          Caption = 'Se toma en ajuste xDif.Camb'
          TabOrder = 10
          OnClick = dbcbSeTomaAjusteDCClick
        end
        object dbcbEsCtaApertura: TCheckBox
          Left = 168
          Top = 10
          Width = 170
          Height = 17
          Caption = 'Es Cuenta Apertura'
          TabOrder = 4
          OnClick = dbcbEsCtaAperturaClick
        end
        object gbCierreAnual: TGroupBox
          Left = 8
          Top = 218
          Width = 341
          Height = 77
          Caption = 'Cierre Anual'
          TabOrder = 14
          object Label9: TLabel
            Left = 11
            Top = 32
            Width = 109
            Height = 15
            Caption = 'Cuenta Contrapartida'
          end
          object lblSecu: TLabel
            Left = 175
            Top = 13
            Width = 54
            Height = 15
            Caption = 'Secuencia'
          end
          object dbeContra: TwwDBEdit
            Left = 98
            Top = 48
            Width = 211
            Height = 23
            Enabled = False
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dblcdContra: TwwDBLookupComboDlg
            Left = 8
            Top = 48
            Width = 88
            Height = 23
            GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
            GridColor = clWhite
            GridTitleAlignment = taLeftJustify
            Caption = 'Busqueda'
            MaxWidth = 0
            MaxHeight = 209
            Selected.Strings = (
              'CUENTAID'#9'15'#9'Id'#9'F'
              'CTADES'#9'40'#9'Cuenta Contable'#9'F')
            LookupField = 'CUENTAID'
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            UseTFields = False
            ShowMatchText = True
            OnExit = dblcdContraExit
          end
          object dbcbCtaCierreAnual: TCheckBox
            Left = 10
            Top = 15
            Width = 123
            Height = 17
            Caption = 'Cuenta Cierre Anual'
            TabOrder = 0
            OnClick = dbcbCtaCierreAnualClick
          end
          object dbeSecu: TwwDBEdit
            Left = 240
            Top = 14
            Width = 32
            Height = 23
            CharCase = ecUpperCase
            Enabled = False
            MaxLength = 2
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object dbcbNoMonet: TCheckBox
          Left = 8
          Top = 63
          Width = 153
          Height = 17
          Caption = 'No Monetaria'
          TabOrder = 3
        end
        object gbCtaConsolidada: TGroupBox
          Left = 8
          Top = 299
          Width = 341
          Height = 46
          Caption = 'Cuenta Consolidada'
          TabOrder = 15
          object dbeConsoli: TwwDBEdit
            Left = 98
            Top = 17
            Width = 228
            Height = 23
            Enabled = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dblcdConsoli: TwwDBLookupComboDlg
            Left = 8
            Top = 17
            Width = 88
            Height = 23
            GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
            GridColor = clWhite
            GridTitleAlignment = taLeftJustify
            Caption = 'Busqueda'
            MaxWidth = 0
            MaxHeight = 209
            Selected.Strings = (
              'CUENTAID'#9'15'#9'Id'#9'F'
              'CTADES'#9'40'#9'Cuenta Contable'#9'F')
            LookupField = 'CUENTAID'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            UseTFields = False
            ShowMatchText = True
            OnEnter = dblcdConsoliEnter
            OnExit = dblcdConsoliExit
          end
        end
        object dbcbRegistroSoloME: TCheckBox
          Left = 168
          Top = 45
          Width = 170
          Height = 17
          Caption = 'Registro s'#243'lo en ME'
          TabOrder = 6
        end
        object dbcbDifCambPer: TCheckBox
          Left = 278
          Top = 86
          Width = 60
          Height = 17
          Caption = 'P'#233'rdida'
          TabOrder = 9
          Visible = False
          OnClick = dbcbDifCambPerClick
        end
        object dbcbDifCambGan: TCheckBox
          Left = 195
          Top = 86
          Width = 70
          Height = 17
          Caption = 'Ganancia'
          TabOrder = 8
          Visible = False
          OnClick = dbcbDifCambGanClick
        end
        object dblcModulo: TwwDBLookupCombo
          Left = 9
          Top = 148
          Width = 80
          Height = 23
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CIAID'#9'2'#9'Cia'#9'F'
            'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
          Options = [loColLines, loTitles]
          Enabled = False
          TabOrder = 11
          AutoDropDown = False
          ShowButton = True
          SearchDelay = 2
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblcModuloExit
          OnNotInList = NotInList
        end
        object dbeModuloAjusDC: TwwDBEdit
          Left = 92
          Top = 148
          Width = 224
          Height = 23
          Enabled = False
          TabOrder = 12
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object gbTieneCtaDestino: TGroupBox
        Left = 390
        Top = 46
        Width = 343
        Height = 292
        TabOrder = 8
        object dbcbTieneCtaDestino: TCheckBox
          Left = 13
          Top = 32
          Width = 120
          Height = 17
          Caption = 'Tiene Cta Destino'
          TabOrder = 1
          OnClick = dbcbTieneCtaDestinoClick
        end
        object dbcbEsDesti: TCheckBox
          Left = 13
          Top = 12
          Width = 120
          Height = 17
          Caption = 'Es Cuenta Destino'
          TabOrder = 0
          OnClick = dbcbEsDestiClick
        end
        object gbEsCtaDestino: TGroupBox
          Left = 163
          Top = 8
          Width = 171
          Height = 46
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object dbcbPermiteMov: TCheckBox
            Left = 8
            Top = 27
            Width = 146
            Height = 17
            Caption = 'Permite Registro Directo '
            TabOrder = 1
            Visible = False
          end
          object dbcbEsDet: TCheckBox
            Left = 8
            Top = 11
            Width = 113
            Height = 17
            Caption = 'Es de Detalle'
            TabOrder = 0
          end
        end
        object gbCtasDestino: TGroupBox
          Left = 9
          Top = 86
          Width = 325
          Height = 102
          Caption = 'Cuentas de Destino'
          Enabled = False
          TabOrder = 3
          object Label16: TLabel
            Left = 13
            Top = 16
            Width = 140
            Height = 15
            Caption = 'Cuenta de Destino 1 (DEBE)'
          end
          object Label7: TLabel
            Left = 13
            Top = 55
            Width = 150
            Height = 15
            Caption = 'Cuenta de Destino 2 (HABER)'
          end
          object dblcdCtaAutDebe: TwwDBLookupComboDlg
            Left = 10
            Top = 31
            Width = 88
            Height = 23
            GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
            GridColor = clWhite
            GridTitleAlignment = taLeftJustify
            Caption = 'Busqueda'
            MaxWidth = 0
            MaxHeight = 209
            Selected.Strings = (
              'CUENTAID'#9'15'#9'Id'#9'F'
              'CTADES'#9'40'#9'Cta. Contable'#9'F')
            LookupField = 'CUENTAID'
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnExit = dblcdCtaAutDebeExit
          end
          object dbeCtaAutDebe: TwwDBEdit
            Left = 99
            Top = 31
            Width = 211
            Height = 23
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dblcdCtaAutHaber: TwwDBLookupComboDlg
            Left = 10
            Top = 71
            Width = 88
            Height = 23
            GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
            GridColor = clWhite
            GridTitleAlignment = taLeftJustify
            Caption = 'Busqueda'
            MaxWidth = 0
            MaxHeight = 209
            Selected.Strings = (
              'CUENTAID'#9'15'#9'Id'#9'F'
              'CTADES'#9'40'#9'Cuenta Contable'#9'F')
            LookupField = 'CUENTAID'
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnExit = dblcdCtaAutHaberExit
          end
          object dbeCtaAutHaber: TwwDBEdit
            Left = 99
            Top = 71
            Width = 211
            Height = 23
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object gbREI: TGroupBox
          Left = 9
          Top = 191
          Width = 325
          Height = 95
          Caption = 'Resultado por Exposici'#243'n a la Inflaci'#243'n (REI)'
          TabOrder = 4
          object Label5: TLabel
            Left = 11
            Top = 50
            Width = 109
            Height = 15
            Caption = 'Cuenta de Ajuste REI'
          end
          object Label8: TLabel
            Left = 10
            Top = 14
            Width = 46
            Height = 15
            Caption = 'Tipo REI'
          end
          object lblCtaAjuste: TLabel
            Left = 203
            Top = 21
            Width = 91
            Height = 30
            Caption = 'Considera Saldos de Cta. de Ajuste'
            WordWrap = True
          end
          object dbeCuentaREI: TwwDBEdit
            Left = 99
            Top = 65
            Width = 213
            Height = 23
            Enabled = False
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dblcdCtaREI: TwwDBLookupComboDlg
            Left = 10
            Top = 65
            Width = 88
            Height = 23
            GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
            GridColor = clWhite
            GridTitleAlignment = taLeftJustify
            Caption = 'Busqueda'
            MaxWidth = 0
            MaxHeight = 209
            Selected.Strings = (
              'CUENTAID'#9'15'#9'Id'#9'F'
              'CTADES'#9'40'#9'Cuenta Contable'#9'F')
            LookupField = 'CUENTAID'
            Enabled = False
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            UseTFields = False
            ShowMatchText = True
            OnExit = dblcdCtaREIExit
          end
          object dblcTipoREI: TwwDBLookupCombo
            Left = 10
            Top = 28
            Width = 54
            Height = 23
            DropDownAlignment = taLeftJustify
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            PreciseEditRegion = False
            AllowClearKey = False
            OnExit = dblcTipoREIExit
            OnNotInList = NotInList
          end
          object edtTipoREI: TEdit
            Left = 65
            Top = 28
            Width = 121
            Height = 23
            TabOrder = 1
          end
          object dbcbCtaAjuste: TCheckBox
            Left = 298
            Top = 34
            Width = 16
            Height = 17
            TabOrder = 4
          end
        end
        object gbEsMov: TGroupBox
          Left = 163
          Top = 53
          Width = 171
          Height = 33
          TabOrder = 5
          object dbcbEsMovi: TCheckBox
            Left = 10
            Top = 11
            Width = 113
            Height = 17
            Caption = 'Es de Movimiento'
            Enabled = False
            TabOrder = 0
          end
        end
      end
      object clbCopiar: TCheckListBox
        Left = 389
        Top = 360
        Width = 348
        Height = 96
        OnClickCheck = clbCopiarClickCheck
        ItemHeight = 16
        Style = lbOwnerDrawFixed
        TabOrder = 10
      end
      object dbeDescripcion: TwwDBEdit
        Left = 317
        Top = 20
        Width = 267
        Height = 23
        DataField = 'CTADES'
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeCtaAbr: TwwDBEdit
        Left = 585
        Top = 21
        Width = 140
        Height = 23
        DataField = 'CTAABR'
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcCia: TwwDBLookupCombo
        Left = 9
        Top = 20
        Width = 49
        Height = 23
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'2'#9'Cia'#9'F'
          'CIAABR'#9'15'#9'Raz'#243'n Social'#9'F')
        LookupField = 'CIAID'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        SearchDelay = 2
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcCiaExit
        OnNotInList = NotInList
      end
      object dbeCia: TwwDBEdit
        Left = 58
        Top = 20
        Width = 144
        Height = 23
        Enabled = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object gbNivelCta: TGroupBox
        Left = 8
        Top = 46
        Width = 170
        Height = 56
        TabOrder = 6
        object Label33: TLabel
          Left = 10
          Top = 10
          Width = 28
          Height = 15
          Caption = 'Nivel'
        end
        object Label35: TLabel
          Left = 61
          Top = 10
          Width = 30
          Height = 15
          Caption = 'Signo'
        end
        object Label34: TLabel
          Left = 112
          Top = 10
          Width = 37
          Height = 15
          Caption = 'D'#237'gitos'
        end
        object dblcNivel1: TwwDBLookupCombo
          Left = 8
          Top = 26
          Width = 41
          Height = 23
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NIVEL'#9'2'#9'Nivel'#9'F'
            'SIGNO'#9'2'#9'Signo'#9'F'
            'DIGITOS'#9'10'#9'Digitos'#9'F')
          DataField = 'CTANIV'
          LookupField = 'NIVEL'
          Options = [loColLines, loRowLines, loTitles]
          Enabled = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          SearchDelay = 2
          PreciseEditRegion = False
          AllowClearKey = True
        end
        object dbeSigno: TwwDBEdit
          Left = 59
          Top = 26
          Width = 41
          Height = 23
          CharCase = ecUpperCase
          DataField = 'SIGNO'
          Enabled = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDigitos: TwwDBEdit
          Left = 110
          Top = 26
          Width = 41
          Height = 23
          CharCase = ecUpperCase
          DataField = 'DIGITOS'
          Enabled = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object gbTipoCta: TGroupBox
        Left = 191
        Top = 46
        Width = 181
        Height = 56
        TabOrder = 7
        object Label20: TLabel
          Left = 12
          Top = 10
          Width = 76
          Height = 15
          Caption = 'Tipo de Cuenta'
        end
        object dblcTipCta: TwwDBLookupCombo
          Left = 11
          Top = 26
          Width = 41
          Height = 23
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TIPCTAID'#9'1'#9'Id'#9'F'
            'TIPCTADES'#9'30'#9'Tipo de Cuenta'#9'F')
          DataField = 'TIPCTAID'
          LookupField = 'TIPCTAID'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          SearchDelay = 2
          PreciseEditRegion = False
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblcTipCtaExit
          OnNotInList = NotInList
        end
        object dbeTipCta: TwwDBEdit
          Left = 53
          Top = 26
          Width = 114
          Height = 23
          CharCase = ecUpperCase
          DataField = 'TIPCTADES'
          Enabled = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object cbCias: TCheckBox
        Left = 612
        Top = 341
        Width = 129
        Height = 17
        Caption = 'Marcar / Desmarcar'
        TabOrder = 11
        OnClick = cbCiasClick
      end
    end
    object Z2bbtnRegistra: TBitBtn
      Left = 655
      Top = 475
      Width = 28
      Height = 28
      Hint = 'Registra'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = Z2bbtnRegistraClick
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
    object Z2bbtnCanc2: TBitBtn
      Left = 687
      Top = 475
      Width = 28
      Height = 28
      Hint = 'Cancela Datos'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = Z2bbtnCanc2Click
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
    object Z2bbtnImprime: TBitBtn
      Left = 623
      Top = 475
      Width = 28
      Height = 28
      Hint = 'Imprimir'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = False
      OnClick = Z2bbtnImprimeClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object Z2bbtnNuevo: TBitBtn
      Left = 591
      Top = 475
      Width = 28
      Height = 28
      Hint = 'Imprimir'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = Z2bbtnNuevoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
    end
    object Z2bbtnClose: TBitBtn
      Left = 718
      Top = 475
      Width = 28
      Height = 28
      Hint = 'Cancela Datos'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = Z2bbtnCloseClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object Z2bbtnBorrar: TBitBtn
      Left = 560
      Top = 475
      Width = 28
      Height = 28
      Hint = 'Borrar Cuenta'
      Cancel = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = Z2bbtnBorrarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
        05555777775555557F5555000555555505555577755555557555}
      NumGlyphs = 2
    end
  end
  object ppDBPipeline1: TppDBPipeline
    UserName = 'DBPipeline1'
    Left = 514
    Top = 476
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
  end
  object pprPlanCtas: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 12700
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 2540
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\SOLCnt\SolFormatos\planctas.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 479
    Top = 476
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29898
      mmPrintPosition = 0
      object pplblCia: TppLabel
        UserName = 'lblCia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 8202
        mmTop = 2910
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Sistema Contable'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 7673
        mmWidth = 29633
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
        mmLeft = 6350
        mmTop = 20638
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
        mmLeft = 34396
        mmTop = 20638
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Plan de Cuentas General'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 85990
        mmTop = 2910
        mmWidth = 42598
        BandType = 0
      end
      object pplblNivel: TppLabel
        UserName = 'Label101'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 116417
        mmTop = 7673
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Auxi'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 122502
        mmTop = 20373
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Pagina :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 2910
        mmWidth = 14817
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 188913
        mmTop = 2910
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Fecha  :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 7673
        mmWidth = 14817
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
        mmLeft = 188913
        mmTop = 7673
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Hora   :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 172773
        mmTop = 12435
        mmWidth = 14817
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
        mmLeft = 188913
        mmTop = 12435
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Cent'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 131234
        mmTop = 20373
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label13'
        Caption = 'Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 185473
        mmTop = 20373
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label14'
        Caption = 'Cuenta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 202407
        mmTop = 20373
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Tipo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 112713
        mmTop = 20373
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 26723
        mmWidth = 214842
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = 'Cost'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 131234
        mmTop = 24342
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Auto 1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 185473
        mmTop = 24342
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Auto 2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 202142
        mmTop = 24342
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 'Docu'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 139965
        mmTop = 20373
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'Nive'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 104775
        mmTop = 20373
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'No'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 148432
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 148432
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 157692
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 157692
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 166159
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 166159
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 175948
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 175948
        mmTop = 24342
        mmWidth = 7408
        BandType = 0
      end
      object pplblNivel1: TppLabel
        UserName = 'Label10'
        Caption = 'Hasta Nivel :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 86784
        mmTop = 7673
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 16933
        mmWidth = 214842
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3440
        mmLeft = 31750
        mmTop = 0
        mmWidth = 69850
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CTA_GP'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3440
        mmLeft = 112977
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3440
        mmLeft = 121179
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3440
        mmLeft = 130440
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 182034
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 200025
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3440
        mmLeft = 139965
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3440
        mmLeft = 103717
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 0
        mmWidth = 28046
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CTA_CIER'
        DataPipeline = ppDBPipeline1
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3440
        mmLeft = 147109
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3440
        mmLeft = 157427
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3440
        mmLeft = 165629
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
        Font.Name = 'Draft 12cpi'
        Font.Pitch = fpFixed
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3440
        mmLeft = 175684
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
