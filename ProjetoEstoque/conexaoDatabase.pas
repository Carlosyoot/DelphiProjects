unit conexaoDatabase;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, vcl.Dialogs;

type
  TDataModule1 = class(TDataModule)
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    conexao: TFDConnection;
    tdProduto: TFDTable;
    tdMovimentacaoProduto: TFDTable;
    tdMovimentacao: TFDTable;
    dsProduto: TDataSource;
    dsMovimentacao: TDataSource;
    dsMovimentacaoProduto: TDataSource;
    sqlAumentarEstoque: TFDCommand;
    sqlDiminuirEstoque: TFDCommand;
    sqlMovimentacoes: TFDQuery;
    dsMovimentacoes: TDataSource;
    tdProdutoid: TFDAutoIncField;
    tdProdutonome: TStringField;
    tdProdutofabricante: TStringField;
    tdProdutovalidade: TDateField;
    tdProdutoestoqueAtual: TIntegerField;
    tdMovimentacaoid: TFDAutoIncField;
    tdMovimentacaotipo: TStringField;
    tdMovimentacaodataHora: TDateTimeField;
    tdMovimentacaoresponsavel: TStringField;
    tdMovimentacaoobservacoes: TMemoField;
    tdMovimentacaoProdutoid: TFDAutoIncField;
    tdMovimentacaoProdutoidMovimentacao: TIntegerField;
    tdMovimentacaoProdutoidProduto: TIntegerField;
    tdMovimentacaoProdutoquantidade: TIntegerField;
    tdMovimentacaoProdutonomeProduto: TStringField;
    sqlMovimentacoesFLT: TFDQuery;
    dsMovimentacoesFLT: TDataSource;
    sqlMovimentacoesFLTid: TFDAutoIncField;
    sqlMovimentacoesFLTidMovimentacao: TIntegerField;
    sqlMovimentacoesFLTidProduto: TIntegerField;
    sqlMovimentacoesFLTquantidade: TIntegerField;
    sqlMovimentacoesFLTnomeProduto: TStringField;
    procedure tdMovimentacaoProdutoAfterPost(DataSet: TDataSet);
    procedure tdMovimentacaoProdutoAfterDelete(DataSet: TDataSet);
    procedure CalcularTotais;
    procedure sqlMovimentacoesBeforeDelete(DataSet: TDataSet);
    procedure tdMovimentacaoBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses telaCadastroMovimentacoes;

{$R *.dfm}

procedure TDataModule1.CalcularTotais;
var
    totais : Integer;
begin

  if tdMovimentacaoProduto.State in [dsBrowse] then
  begin
    tdMovimentacaoProduto.First;


    while not tdMovimentacaoProduto.Eof do
    begin

      totais := totais + tdMovimentacaoProduto.FieldByName('quantidade').Value;

      tdMovimentacaoProduto.Next;
    end;

    RegisterActionsScreen.totalTXT.Caption := IntToStr(totais);
  end;
end;

procedure TDataModule1.sqlMovimentacoesBeforeDelete(DataSet: TDataSet);
begin
  if (tdMovimentacao.FieldByName('tipo').Value = 'Entrada no Estoque') then

    begin
      sqlDiminuirEstoque.ParamByName('pId').Value := tdMovimentacaoProduto.FieldByName('idProduto').Value;
      sqlDiminuirEstoque.ParamByName('pQtd').Value := tdMovimentacaoProduto.FieldByName('quantidade').Value;
      sqlDiminuirEstoque.Execute;
    end;

  if (tdMovimentacao.FieldByName('tipo').Value = 'Saída de Estoque') then

    begin
      sqlAumentarEstoque.ParamByName('pId').Value := tdMovimentacaoProduto.FieldByName('idProduto').Value;
      sqlAumentarEstoque.ParamByName('pQtd').Value := tdMovimentacaoProduto.FieldByName('quantidade').Value;
      sqlAumentarEstoque.Execute;
    end;
end;

procedure TDataModule1.tdMovimentacaoBeforeDelete(DataSet: TDataSet);
begin
  if tdMovimentacaoProduto.RecordCount > 0 then
    begin
      ShowMessage('Existe produtos cadastrados nessa movimentação. Exclua-os primeiro.');
      abort;
    end;

end;

procedure TDataModule1.tdMovimentacaoProdutoAfterDelete(DataSet: TDataSet);
begin
  CalcularTotais;

end;

procedure TDataModule1.tdMovimentacaoProdutoAfterPost(DataSet: TDataSet);
begin
  CalcularTotais;

  if (tdMovimentacao.FieldByName('tipo').Value = 'Entrada no Estoque') then

    begin
      sqlAumentarEstoque.ParamByName('pId').Value := tdMovimentacaoProduto.FieldByName('idProduto').Value;
      sqlAumentarEstoque.ParamByName('pQtd').Value := tdMovimentacaoProduto.FieldByName('quantidade').Value;
      sqlAumentarEstoque.Execute;
    end;

  if (tdMovimentacao.FieldByName('tipo').Value = 'Saída de Estoque') then

    begin
      sqlDiminuirEstoque.ParamByName('pId').Value := tdMovimentacaoProduto.FieldByName('idProduto').Value;
      sqlDiminuirEstoque.ParamByName('pQtd').Value := tdMovimentacaoProduto.FieldByName('quantidade').Value;
      sqlDiminuirEstoque.Execute;
    end;

end;

end.
