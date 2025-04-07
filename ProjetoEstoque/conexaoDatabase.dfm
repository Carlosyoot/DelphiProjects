object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'E:\Delphi\ProjetoEstoque\libmysql.dll'
    Left = 56
    Top = 96
  end
  object conexao: TFDConnection
    Params.Strings = (
      'Database=delphi_estoque'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 32
  end
  object tdProduto: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'delphi_estoque.produtos'
    Left = 200
    Top = 32
    object tdProdutoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = False
    end
    object tdProdutonome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object tdProdutofabricante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'fabricante'
      Origin = 'fabricante'
      Required = True
      Size = 30
    end
    object tdProdutovalidade: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'validade'
      Origin = 'validade'
      Required = True
      EditMask = '##/##/####;1;_'
    end
    object tdProdutoestoqueAtual: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'estoqueAtual'
      Origin = 'estoqueAtual'
    end
  end
  object tdMovimentacaoProduto: TFDTable
    Active = True
    AfterPost = tdMovimentacaoProdutoAfterPost
    AfterDelete = tdMovimentacaoProdutoAfterDelete
    IndexName = 'idMovimentacao'
    MasterSource = dsMovimentacao
    MasterFields = 'id'
    Connection = conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'movimentacoes_produto'
    Left = 400
    Top = 32
    object tdMovimentacaoProdutoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = False
    end
    object tdMovimentacaoProdutoidMovimentacao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idMovimentacao'
      Origin = 'idMovimentacao'
    end
    object tdMovimentacaoProdutoidProduto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idProduto'
      Origin = 'idProduto'
    end
    object tdMovimentacaoProdutoquantidade: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object tdMovimentacaoProdutonomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'nomeProduto'
      LookupDataSet = tdProduto
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'idProduto'
      Size = 50
      Lookup = True
    end
  end
  object tdMovimentacao: TFDTable
    Active = True
    BeforeDelete = tdMovimentacaoBeforeDelete
    AfterScroll = tdMovimentacaoProdutoAfterPost
    IndexFieldNames = 'id'
    Connection = conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'movimentacoes'
    Left = 280
    Top = 32
    object tdMovimentacaoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = False
    end
    object tdMovimentacaotipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object tdMovimentacaodataHora: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dataHora'
      Origin = 'dataHora'
    end
    object tdMovimentacaoresponsavel: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 50
    end
    object tdMovimentacaoobservacoes: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'observacoes'
      Origin = 'observacoes'
      BlobType = ftMemo
    end
  end
  object dsProduto: TDataSource
    DataSet = tdProduto
    Left = 200
    Top = 96
  end
  object dsMovimentacao: TDataSource
    DataSet = tdMovimentacao
    Left = 280
    Top = 96
  end
  object dsMovimentacaoProduto: TDataSource
    DataSet = tdMovimentacaoProduto
    Left = 400
    Top = 96
  end
  object sqlAumentarEstoque: TFDCommand
    Connection = conexao
    CommandText.Strings = (
      
        'UPDATE produtos SET estoqueAtual = estoqueAtual + :pQtd WHERE id' +
        ' = :pId')
    ParamData = <
      item
        Name = 'pQtd'
        ParamType = ptInput
      end
      item
        Name = 'pId'
        ParamType = ptInput
      end>
    Left = 56
    Top = 200
  end
  object sqlDiminuirEstoque: TFDCommand
    Connection = conexao
    CommandText.Strings = (
      
        'UPDATE produtos SET estoqueAtual = estoqueAtual - :pQtd WHERE id' +
        ' = :pId')
    ParamData = <
      item
        Name = 'pQtd'
        ParamType = ptInput
      end
      item
        Name = 'pId'
        ParamType = ptInput
      end>
    Left = 56
    Top = 264
  end
  object sqlMovimentacoes: TFDQuery
    Active = True
    BeforeDelete = sqlMovimentacoesBeforeDelete
    Connection = conexao
    SQL.Strings = (
      'SELECT * FROM movimentacoes;')
    Left = 208
    Top = 200
    ParamData = <
      item
        Name = 'pDataInicial'
      end
      item
        Name = 'pDataFinal'
      end>
  end
  object dsMovimentacoes: TDataSource
    DataSet = sqlMovimentacoes
    Left = 208
    Top = 272
  end
  object sqlMovimentacoesFLT: TFDQuery
    Active = True
    BeforeDelete = sqlMovimentacoesBeforeDelete
    IndexFieldNames = 'idMovimentacao'
    MasterSource = dsMovimentacoes
    MasterFields = 'id'
    Connection = conexao
    SQL.Strings = (
      'SELECT * FROM movimentacoes_produto')
    Left = 328
    Top = 200
    object sqlMovimentacoesFLTid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object sqlMovimentacoesFLTidMovimentacao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idMovimentacao'
      Origin = 'idMovimentacao'
    end
    object sqlMovimentacoesFLTidProduto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idProduto'
      Origin = 'idProduto'
    end
    object sqlMovimentacoesFLTquantidade: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'quantidade'
      Origin = 'quantidade'
    end
    object sqlMovimentacoesFLTnomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'nomeProduto'
      LookupDataSet = tdProduto
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'idProduto'
      Size = 50
      Lookup = True
    end
  end
  object dsMovimentacoesFLT: TDataSource
    DataSet = sqlMovimentacoesFLT
    Left = 328
    Top = 272
  end
end
