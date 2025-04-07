program ProjetoEstoque;

uses
  Vcl.Forms,
  telaPrincipal in 'telaPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainScreen, MainScreen);
  Application.Run;
end.
