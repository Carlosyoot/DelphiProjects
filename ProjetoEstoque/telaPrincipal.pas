unit telaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TMainScreen = class(TForm)
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Sistema2: TMenuItem;
    Cadastro1: TMenuItem;
    Cadastro2: TMenuItem;
    CadastrarProduto1: TMenuItem;
    GerenciarMovimentaes1: TMenuItem;
    ConsultarMovimentaes1: TMenuItem;
    Panel1: TPanel;
    Label2: TLabel;
    procedure Sistema2Click(Sender: TObject);
    procedure CadastrarProduto1Click(Sender: TObject);
    procedure ConsultarMovimentaes1Click(Sender: TObject);
    procedure GerenciarMovimentaes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainScreen: TMainScreen;

implementation

{$R *.dfm}

uses telaCadastroProduto, telaConsultaMovimentacoes, telaCadastroMovimentacoes;

procedure TMainScreen.CadastrarProduto1Click(Sender: TObject);
begin
  RegisterProductScreen.ShowModal;
end;

procedure TMainScreen.ConsultarMovimentaes1Click(Sender: TObject);
begin
  ConsultActionsScreen.ShowModal;
end;

procedure TMainScreen.GerenciarMovimentaes1Click(Sender: TObject);
begin
  RegisterActionsScreen.ShowModal;
end;

procedure TMainScreen.Sistema2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
