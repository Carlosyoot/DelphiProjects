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
  object Panel1: TPanel
    Left = 32
    Top = 80
    Width = 561
    Height = 41
    Caption = 'Panel1'
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
