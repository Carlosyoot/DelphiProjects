unit telaConsultaMovimentacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TConsultActionsScreen = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    TotalTXTMov: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConsultActionsScreen: TConsultActionsScreen;

implementation

{$R *.dfm}

uses conexaoDatabase;

procedure TConsultActionsScreen.Button1Click(Sender: TObject);
begin
  DataModule1.sqlmovimentacoes.Close;
  DataModule1.sqlmovimentacoes.SQL.Clear;
  DataModule1.sqlMovimentacoes.SQL.Text := 'SELECT * FROM movimentacoes WHERE DATE(dataHora) BETWEEN :pDataInicial AND :pDataFinal';
  DataModule1.sqlMovimentacoes.ParamByName('pDataInicial').Value := FormatDateTime('yyyy-mm-dd', StrToDate(MaskEdit1.Text));
  DataModule1.sqlMovimentacoes.ParamByName('pDataFinal').Value := FormatDateTime('yyyy-mm-dd', StrToDate(MaskEdit2.Text));
  DataModule1.sqlMovimentacoes.Open;

  totalTXTMov.Caption := IntToStr(DataModule1.sqlMovimentacoes.RecordCount);



end;

procedure TConsultActionsScreen.FormShow(Sender: TObject);
begin
  DataModule1.sqlMovimentacoes.Refresh;
  DataModule1.sqlMovimentacoesFLT.Refresh;
  totalTXTmov.Caption := IntToStr(DataModule1.sqlMovimentacoes.RecordCount);
end;

end.
