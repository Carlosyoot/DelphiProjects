program ProjetoEstoque;

uses
  Vcl.Forms,
  telaPrincipal in 'telaPrincipal.pas' {Form1},
  telaCadastroProduto in 'telaCadastroProduto.pas' {RegisterProductScreen},
  telaCadastroMovimentacoes in 'telaCadastroMovimentacoes.pas' {RegisterActionsScreen},
  telaConsultaMovimentacoes in 'telaConsultaMovimentacoes.pas' {ConsultActionsScreen},
  conexaoDatabase in 'conexaoDatabase.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainScreen, MainScreen);
  Application.CreateForm(TRegisterProductScreen, RegisterProductScreen);
  Application.CreateForm(TRegisterProductScreen, RegisterProductScreen);
  Application.CreateForm(TRegisterActionsScreen, RegisterActionsScreen);
  Application.CreateForm(TConsultActionsScreen, ConsultActionsScreen);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
