object FSelMovAnt: TFSelMovAnt
  Left = 480
  Top = 269
  BorderStyle = bsDialog
  Caption = 'Seleccionar Movimientos Anteriores'
  ClientHeight = 325
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgMovCont: TwwDBGrid
    Left = 3
    Top = 40
    Width = 734
    Height = 253
    HelpType = htKeyword
    DisableThemesInTitle = False
    ControlInfoInDataset = False
    MemoAttributes = [mSizeable, mWordWrap, mGridShow]
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyOptions = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
    ParentFont = False
    TabOrder = 6
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = True
    UseTFields = False
  end
  object btnAceptar: TButton
    Left = 679
    Top = 296
    Width = 57
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 0
    OnClick = btnAceptarClick
  end
  object btnCancelar: TButton
    Left = 618
    Top = 296
    Width = 57
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = btnCancelarClick
  end
  object dbsMEs: TwwDBSpinEdit
    Left = 61
    Top = 10
    Width = 49
    Height = 21
    Increment = 1.000000000000000000
    MaxValue = 12.000000000000000000
    MinValue = 1.000000000000000000
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    UnboundDataType = wwDefault
  end
  object dbsAno: TwwDBSpinEdit
    Left = 4
    Top = 10
    Width = 53
    Height = 21
    Increment = 1.000000000000000000
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    UnboundDataType = wwDefault
  end
  object btnFiltrar: TButton
    Left = 420
    Top = 9
    Width = 57
    Height = 25
    Caption = 'Filtrar'
    TabOrder = 4
    OnClick = btnFiltrarOnClick
  end
  object cbMarcado: TwwCheckBox
    Left = 16
    Top = 265
    Width = 17
    Height = 17
    DisableThemes = False
    AlwaysTransparent = False
    ValueChecked = 'S'
    ValueUnchecked = 'N'
    DisplayValueChecked = 'True'
    DisplayValueUnchecked = 'False'
    NullAndBlankState = cbUnchecked
    TabOrder = 5
    Visible = False
    OnClick = cbMarcadoClick
  end
  object chkTodo: TCheckBox
    Left = 14
    Top = 291
    Width = 73
    Height = 25
    Caption = 'Todo'
    TabOrder = 7
    OnClick = chkTodoClick
  end
  object cmbFiltro: TComboBox
    Left = 113
    Top = 10
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 8
  end
  object edtFiltro: TEdit
    Left = 212
    Top = 10
    Width = 204
    Height = 21
    TabOrder = 9
  end
  object btnLimpiar: TButton
    Left = 480
    Top = 9
    Width = 57
    Height = 25
    Caption = 'Limpiar'
    TabOrder = 10
    OnClick = btnLimpiarClick
  end
end
