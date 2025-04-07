unit telaCadastroMovimentacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Buttons, Data.DB, Vcl.CustomizeDlg, Vcl.Grids, Vcl.DBGrids;

type
  TRegisterActionsScreen = class(TForm)
    Label1: TLabel;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    T: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBNavigator2: TDBNavigator;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBGrid2: TDBGrid;
    Label8: TLabel;
    TotalTXT: TLabel;
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegisterActionsScreen: TRegisterActionsScreen;

implementation

{$R *.dfm}

uses conexaoDatabase;

procedure TRegisterActionsScreen.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
    begin
      DataModule1.tdMovimentacao.FieldByName('dataHora').Value := Now;
    end;

end;

procedure TRegisterActionsScreen.FormShow(Sender: TObject);
begin
  DataModule1.CalcularTotais;
end;

end.
