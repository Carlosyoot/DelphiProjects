object ConsultActionsScreen: TConsultActionsScreen
  Left = 0
  Top = 0
  Caption = 'Consulta de movimenta'#231#245'es'
  ClientHeight = 567
  ClientWidth = 825
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object TotalTXTMov: TLabel
    Left = 239
    Top = 521
    Width = 22
    Height = 25
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 32
    Top = 521
    Width = 201
    Height = 25
    Caption = 'TOTAL DE PRODUTOS: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 792
    Top = 478
    Width = 5
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 825
    Height = 73
    Align = alTop
    Alignment = taLeftJustify
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Unispace'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitTop = -8
    ExplicitWidth = 835
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 299
      Height = 25
      Caption = 'Consultar movimenta'#231#245'es'
    end
  end
  object Panel2: TPanel
    Left = -8
    Top = 71
    Width = 835
    Height = 74
    BorderStyle = bsSingle
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Label2: TLabel
      Left = 38
      Top = 11
      Width = 58
      Height = 15
      Caption = 'Data Inicial'
    end
    object Label3: TLabel
      Left = 217
      Top = 11
      Width = 52
      Height = 15
      Caption = 'Data Final'
    end
    object MaskEdit1: TMaskEdit
      Left = 38
      Top = 32
      Width = 120
      Height = 23
      EditMask = '##/##/####;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object MaskEdit2: TMaskEdit
      Left = 217
      Top = 32
      Width = 120
      Height = 23
      EditMask = '##/##/####;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object Button1: TButton
      Left = 640
      Top = 16
      Width = 169
      Height = 41
      Caption = 'Consultar Movimenta'#231#245'es'
      TabOrder = 2
      StyleElements = [seFont, seBorder]
      StyleName = 'Windows'
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 176
    Width = 369
    Height = 329
    DataSource = DataModule1.dsMovimentacoes
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'tipo'
        Title.Caption = 'TIPO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataHora'
        Title.Caption = 'DATA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'responsavel'
        Title.Caption = 'RESPONSAVEL'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 434
    Top = 176
    Width = 363
    Height = 329
    DataSource = DataModule1.dsMovimentacoesFLT
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nomeProduto'
        Title.Caption = 'PRODUTO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'QUANTIDADE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 105
        Visible = True
      end>
  end
end
