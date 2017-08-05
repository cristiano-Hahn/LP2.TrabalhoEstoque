unit UnCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFrmPrincipal = class(TForm)
    DsEstoque: TDataSource;
    CdsEstoque: TClientDataSet;
    CdsEstoqueCodigo: TIntegerField;
    CdsEstoqueDescricao: TStringField;
    CdsEstoqueUnidade: TStringField;
    CdsEstoqueFornecedor: TStringField;
    CdsEstoqueData: TDateField;
    CdsEstoqueQuantidade: TFloatField;
    CdsEstoqueUnitario: TCurrencyField;
    CdsEstoqueTotal: TCurrencyField;
    CdsEstoqueEstoqueQtd: TAggregateField;
    CdsEstoqueEstoqueVlr: TAggregateField;
    pnlNavigator: TPanel;
    DbNavegacao: TDBNavigator;
    pnlDados: TPanel;
    dbedtCodigo: TDBEdit;
    dbedtDescricao: TDBEdit;
    dbedtFornecedor: TDBEdit;
    dbedtData: TDBEdit;
    dbedtUnidade: TDBEdit;
    dbedtTotal: TDBEdit;
    dbedtQuantidade: TDBEdit;
    dbedtUnitario: TDBEdit;
    LblCodigo: TLabel;
    lblData: TLabel;
    lblDescricao: TLabel;
    lblFornecedor: TLabel;
    lblQuantidade: TLabel;
    lblUnitario: TLabel;
    lblTotal: TLabel;
    lblUnidade: TLabel;
    pnlPesquisa: TPanel;
    lblTituloPesquisa: TLabel;
    lblCampo: TLabel;
    lblAcao: TLabel;
    lblValor: TLabel;
    CboCampo: TComboBox;
    CboAcao: TComboBox;
    BtnExecutar: TButton;
    dbgrdEstoque: TDBGrid;
    pnlTotais: TPanel;
    pnl1: TPanel;
    lblTotais: TLabel;
    pnl2: TPanel;
    dbedtQtdeEstoque: TDBEdit;
    dbedtVlrEstoque: TDBEdit;
    lblQtdeEstoque: TLabel;
    lblVlrEstoque: TLabel;
    DbEdtValor: TEdit;
    procedure CdsEstoqueCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure CdsEstoqueBeforePost(DataSet: TDataSet);
    procedure CboAcaoChange(Sender: TObject);
    procedure BtnExecutarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValidarInformacoes;
    procedure Indexar;
    procedure Locate;
    procedure Findkey;
    procedure limpar;
    procedure Encontrou(AEncontrou: Boolean);
    procedure percorrer;
    procedure Filtrar;
    procedure LimparFiltro;
    procedure ValidarValorPesquisa;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BtnExecutarClick(Sender: TObject);
begin
  ValidarValorPesquisa;
  case CboAcao.ItemIndex of
    0:
      Indexar;
    1:
      Locate;
    2:
      Findkey;
    3:
      limpar;
    4:
      percorrer;
    5:
      Filtrar;
    6:
      LimparFiltro;
  end;
end;

procedure TFrmPrincipal.CboAcaoChange(Sender: TObject);
begin
  dbedtvalor.Enabled := not (CboAcao.ItemIndex in [0, 3, 6])
end;

procedure TFrmPrincipal.CdsEstoqueBeforePost(DataSet: TDataSet);
begin
  ValidarInformacoes;
end;

procedure TFrmPrincipal.CdsEstoqueCalcFields(DataSet: TDataSet);
begin
  CdsEstoque.FieldByName('Total').Value := CdsEstoque.FieldByName('quantidade').Value
    * CdsEstoque.FieldByName('unitario').Value;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  cdsEstoque.FileName := ExtractFileDir(GetCurrentDir) + '\Dados.xml';
  if FileExists(cdsEstoque.FileName) then
    cdsEstoque.Open
  else
    cdsEstoque.CreateDataSet;
end;

{$REGION 'Validacoes'}

procedure TFrmPrincipal.Encontrou(AEncontrou: Boolean);
begin
  if AEncontrou then
    ShowMessage('Registro localizado!')
  else
    ShowMessage('Registro não localizado!');
end;

procedure TFrmPrincipal.ValidarValorPesquisa;
begin
  if (dbedtValor.Enabled) and (dbedtValor.Text = Emptystr) then
    raise Exception.Create('Valor para execução do procedimento inválido!');
end;

procedure TFrmPrincipal.ValidarInformacoes;
const
  Cmsg = 'Para prosseguir é necessário informar todos os campos, informe o campo ';
var
  I: Integer;
begin
//Ficou podre de feio mas poupou codigo
  for I := 0 to FrmPrincipal.ComponentCount - 1 do
    if (FrmPrincipal.Components[I] is TDBEdit) and (FrmPrincipal.Components[I].GetParentComponent
      = pnlDados) then
      if TDBEdit(FrmPrincipal.Components[I]).Text = EmptyStr then
      begin
        ShowMessage(Cmsg + TDBEdit(FrmPrincipal.Components[I]).DataField);
        TDBEdit(FrmPrincipal.Components[I]).SetFocus;
        Abort;
      end;
end;

{$ENDREGION}

{$REGION 'Executar funcoes'}

procedure TFrmPrincipal.percorrer;
begin
  CdsEstoque.First;
  while not CdsEstoque.Eof do
  begin
    if CdsEstoque.FieldByName(CboCampo.Text).AsString = dbedtValor.Text then
    begin
      Encontrou(True);
      Abort;
    end;
    CdsEstoque.Next;
  end;
  Encontrou(False);
end;

procedure TFrmPrincipal.Indexar;
begin
  CdsEstoque.IndexFieldNames := CboCampo.Text;
  ShowMessage('Indexado por ' + CboCampo.Text);
end;

procedure TFrmPrincipal.limpar;
begin
  CdsEstoque.EmptyDataSet;
end;

procedure TFrmPrincipal.LimparFiltro;
begin
  CdsEstoque.Filtered := False;
end;

procedure TFrmPrincipal.Locate;
begin
  Encontrou(CdsEstoque.Locate(CboCampo.Text, dbedtValor.Text, [loCaseInsensitive]));
end;

procedure TFrmPrincipal.Filtrar;
begin
  CdsEstoque.Filtered := False;
  CdsEstoque.Filter := CboCampo.Text + ' = ' + dbedtValor.Text;
  try
    CdsEstoque.Filtered := true;
  except
    ShowMessage('Informe apenas o valor a ser filtrado');
  end;
end;

procedure TFrmPrincipal.Findkey;
begin
  try
    Encontrou(CdsEstoque.FindKey([dbedtValor.Text]));
  except
    ShowMessage('Para encontrar a chave, é necessário criar um índice (indexar)');
  end;
end;

{$ENDREGION}

end.

