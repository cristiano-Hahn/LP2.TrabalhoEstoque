object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Controle de estoque'
  ClientHeight = 425
  ClientWidth = 731
  Color = clBtnFace
  Constraints.MinHeight = 464
  Constraints.MinWidth = 747
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    731
    425)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlNavigator: TPanel
    Left = 8
    Top = 8
    Width = 715
    Height = 41
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    ExplicitWidth = 702
    DesignSize = (
      715
      41)
    object DbNavegacao: TDBNavigator
      Left = 6
      Top = 3
      Width = 700
      Height = 36
      DataSource = DsEstoque
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
  end
  object pnlDados: TPanel
    Left = 8
    Top = 58
    Width = 715
    Height = 95
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    ExplicitWidth = 702
    DesignSize = (
      715
      95)
    object LblCodigo: TLabel
      Left = 16
      Top = 11
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lblData: TLabel
      Left = 16
      Top = 52
      Width = 27
      Height = 13
      Caption = 'Data:'
    end
    object lblDescricao: TLabel
      Left = 152
      Top = 11
      Width = 50
      Height = 13
      Caption = 'Descri'#231#227'o:'
    end
    object lblFornecedor: TLabel
      Left = 152
      Top = 52
      Width = 59
      Height = 13
      Caption = 'Fornecedor:'
    end
    object lblQuantidade: TLabel
      Left = 375
      Top = 53
      Width = 98
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Quantidade(+ ou -):'
      ExplicitLeft = 354
    end
    object lblUnitario: TLabel
      Left = 493
      Top = 53
      Width = 41
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Unitario:'
      ExplicitLeft = 472
    end
    object lblTotal: TLabel
      Left = 610
      Top = 53
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Total:'
      ExplicitLeft = 589
    end
    object lblUnidade: TLabel
      Left = 610
      Top = 11
      Width = 43
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Unidade:'
      ExplicitLeft = 589
    end
    object dbedtCodigo: TDBEdit
      Left = 16
      Top = 26
      Width = 121
      Height = 21
      DataField = 'Codigo'
      DataSource = DsEstoque
      TabOrder = 0
    end
    object dbedtDescricao: TDBEdit
      Left = 152
      Top = 26
      Width = 438
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Descricao'
      DataSource = DsEstoque
      TabOrder = 1
      ExplicitWidth = 417
    end
    object dbedtFornecedor: TDBEdit
      Left = 150
      Top = 66
      Width = 206
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Fornecedor'
      DataSource = DsEstoque
      TabOrder = 2
      ExplicitWidth = 185
    end
    object dbedtData: TDBEdit
      Left = 16
      Top = 66
      Width = 121
      Height = 21
      DataField = 'Data'
      DataSource = DsEstoque
      TabOrder = 3
    end
    object dbedtUnidade: TDBEdit
      Left = 610
      Top = 26
      Width = 97
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'Unidade'
      DataSource = DsEstoque
      TabOrder = 4
      ExplicitLeft = 589
    end
    object dbedtTotal: TDBEdit
      Left = 610
      Top = 66
      Width = 97
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'Total'
      DataSource = DsEstoque
      TabOrder = 5
      ExplicitLeft = 589
    end
    object dbedtQuantidade: TDBEdit
      Left = 375
      Top = 66
      Width = 97
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'Quantidade'
      DataSource = DsEstoque
      TabOrder = 6
      ExplicitLeft = 354
    end
    object dbedtUnitario: TDBEdit
      Left = 493
      Top = 66
      Width = 97
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'Unitario'
      DataSource = DsEstoque
      TabOrder = 7
      ExplicitLeft = 472
    end
  end
  object pnlPesquisa: TPanel
    Left = 8
    Top = 161
    Width = 715
    Height = 64
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    ExplicitWidth = 702
    DesignSize = (
      715
      64)
    object lblTituloPesquisa: TLabel
      Left = 16
      Top = 3
      Width = 154
      Height = 13
      Caption = 'Pesquisa, ordena'#231#227'o e filtragem'
    end
    object lblCampo: TLabel
      Left = 16
      Top = 20
      Width = 37
      Height = 13
      Caption = 'Campo:'
    end
    object lblAcao: TLabel
      Left = 199
      Top = 20
      Width = 28
      Height = 13
      Caption = 'A'#231#227'o:'
    end
    object lblValor: TLabel
      Left = 382
      Top = 18
      Width = 28
      Height = 13
      Caption = 'Valor:'
    end
    object CboCampo: TComboBox
      Left = 16
      Top = 35
      Width = 145
      Height = 21
      ItemIndex = 0
      TabOrder = 0
      Text = 'Codigo'
      Items.Strings = (
        'Codigo'
        'Descricao'
        'Unidade'
        'Data'
        'Fornecedor'
        'Quantidade'
        'Unitario '
        'Total')
    end
    object CboAcao: TComboBox
      Left = 199
      Top = 35
      Width = 145
      Height = 21
      ItemIndex = 0
      TabOrder = 1
      Text = 'Indexar'
      OnChange = CboAcaoChange
      Items.Strings = (
        'Indexar'
        'Locate'
        'FindKey'
        'Limpar'
        'Percorrer'
        'Filtrar'
        'Limpar filtro')
    end
    object BtnExecutar: TButton
      Left = 499
      Top = 33
      Width = 196
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Executar'
      TabOrder = 2
      OnClick = BtnExecutarClick
      ExplicitLeft = 515
    end
    object DbEdtValor: TEdit
      Left = 382
      Top = 35
      Width = 99
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 3
    end
  end
  object dbgrdEstoque: TDBGrid
    Left = 8
    Top = 234
    Width = 715
    Height = 127
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DsEstoque
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Width = 192
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fornecedor'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unitario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Visible = True
      end>
  end
  object pnlTotais: TPanel
    Left = 8
    Top = 367
    Width = 715
    Height = 50
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
    ExplicitWidth = 702
    DesignSize = (
      715
      50)
    object lblTotais: TLabel
      Left = 6
      Top = 0
      Width = 33
      Height = 13
      Caption = 'Totais:'
    end
    object lblQtdeEstoque: TLabel
      Left = 313
      Top = 25
      Width = 119
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Quantidade em estoque:'
      ExplicitLeft = 300
    end
    object lblVlrEstoque: TLabel
      Left = 584
      Top = 25
      Width = 28
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Valor:'
      ExplicitLeft = 571
    end
    object pnl2: TPanel
      Left = 0
      Top = 14
      Width = 715
      Height = 1
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitWidth = 702
    end
    object dbedtQtdeEstoque: TDBEdit
      Left = 436
      Top = 22
      Width = 78
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'EstoqueQtd'
      DataSource = DsEstoque
      TabOrder = 1
      ExplicitLeft = 423
    end
    object dbedtVlrEstoque: TDBEdit
      Left = 617
      Top = 22
      Width = 78
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'EstoqueVlr'
      DataSource = DsEstoque
      TabOrder = 2
      ExplicitLeft = 604
    end
  end
  object pnl1: TPanel
    Left = 8
    Top = 180
    Width = 715
    Height = 1
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    ExplicitWidth = 702
  end
  object DsEstoque: TDataSource
    DataSet = CdsEstoque
    Left = 296
    Top = 232
  end
  object CdsEstoque: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    BeforePost = CdsEstoqueBeforePost
    OnCalcFields = CdsEstoqueCalcFields
    Left = 232
    Top = 240
    object CdsEstoqueCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object CdsEstoqueDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object CdsEstoqueUnidade: TStringField
      FieldName = 'Unidade'
      Size = 2
    end
    object CdsEstoqueFornecedor: TStringField
      FieldName = 'Fornecedor'
      Size = 50
    end
    object CdsEstoqueData: TDateField
      FieldName = 'Data'
    end
    object CdsEstoqueQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object CdsEstoqueUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object CdsEstoqueTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Total'
      Calculated = True
    end
    object CdsEstoqueEstoqueQtd: TAggregateField
      FieldName = 'EstoqueQtd'
      Visible = True
      Active = True
      DisplayName = ''
      Expression = 'Sum(Quantidade)'
    end
    object CdsEstoqueEstoqueVlr: TAggregateField
      FieldName = 'EstoqueVlr'
      Visible = True
      Active = True
      DisplayName = ''
      Expression = 'Sum(Quantidade * Unitario)'
    end
  end
end
