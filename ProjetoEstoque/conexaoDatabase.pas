unit conexaoDatabase;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
