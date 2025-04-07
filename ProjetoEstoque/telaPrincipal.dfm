object MainScreen: TMainScreen
  Left = 0
  Top = 0
  Caption = 'Sistema de Controle de Estoque'
  ClientHeight = 441
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  WindowState = wsMaximized
  TextHeight = 15
  object Label2: TLabel
    Left = 32
    Top = 197
    Width = 570
    Height = 114
    Caption = 
      'ESTE '#201' UM PROJETO DE ESTOQUE FEITO EM PASCAL - DELPHI, '#201' '#13#10'MEU P' +
      'RIMEIRO PROJETO USANDO DELPHI'#13#10'COMO LINGUAGEM DE PROGRAMA'#199#195'O. '#13#10 +
      'ESTOU ABERTO PARA DICAS E FORMAS'#13#10'DE MELHORAR MINHA VIS'#195'O SOBRE ' +
      'ESTA LINGUAGEM'#13#10' '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Unispace'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 32
    Top = 40
    Width = 561
    Height = 73
    Caption = 'CONTROLE DE ESTOQUE -  PASCAL'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Unispace'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 512
    Top = 40
    object Sistema1: TMenuItem
      Caption = 'Sistema'
      object Sistema2: TMenuItem
        Caption = 'Sair'
        OnClick = Sistema2Click
      end
    end
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object CadastrarProduto1: TMenuItem
        Caption = 'Cadastro de Produtos'
        OnClick = CadastrarProduto1Click
      end
    end
    object Cadastro2: TMenuItem
      Caption = 'Movimenta'#231#245'es'
      object GerenciarMovimentaes1: TMenuItem
        Caption = 'Gerenciar Movimenta'#231#245'es'
        OnClick = GerenciarMovimentaes1Click
      end
      object ConsultarMovimentaes1: TMenuItem
        Caption = 'Consultar Movimenta'#231#245'es'
        OnClick = ConsultarMovimentaes1Click
      end
    end
  end
end
