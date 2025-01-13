object DMCon: TDMCon
  Height = 720
  Width = 960
  PixelsPerInch = 144
  object FDCon: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Gustavo Mena Barreto\OneDrive\'#193'rea de Trabalho' +
        '\GustavoCep\bd\db.db'
      'DriverID=sQLite')
    LoginPrompt = False
    Left = 216
    Top = 72
  end
  object QryEndereco: TFDQuery
    Connection = FDCon
    SQL.Strings = (
      'Select * from tab_endereco')
    Left = 324
    Top = 72
    object QryEnderecoCep: TStringField
      FieldName = 'Cep'
      Origin = 'Cep'
      Size = 10
    end
    object QryEnderecoLogradouro: TStringField
      FieldName = 'Logradouro'
      Origin = 'Logradouro'
      Size = 100
    end
    object QryEnderecoComplemento: TStringField
      FieldName = 'Complemento'
      Origin = 'Complemento'
      Size = 50
    end
    object QryEnderecoUnidade: TStringField
      FieldName = 'Unidade'
      Origin = 'Unidade'
      Size = 10
    end
    object QryEnderecoBairro: TStringField
      FieldName = 'Bairro'
      Origin = 'Bairro'
      Size = 100
    end
    object QryEnderecoLocalidade: TStringField
      FieldName = 'Localidade'
      Origin = 'Localidade'
      Size = 100
    end
    object QryEnderecoUf: TStringField
      FieldName = 'Uf'
      Origin = 'Uf'
      FixedChar = True
      Size = 2
    end
    object QryEnderecoEstado: TStringField
      FieldName = 'Estado'
      Origin = 'Estado'
      Size = 100
    end
    object QryEnderecoRegiao: TStringField
      FieldName = 'Regiao'
      Origin = 'Regiao'
      Size = 100
    end
    object QryEnderecoIbge: TStringField
      FieldName = 'Ibge'
      Origin = 'Ibge'
      Size = 10
    end
    object QryEnderecoGia: TStringField
      FieldName = 'Gia'
      Origin = 'Gia'
      Size = 10
    end
    object QryEnderecoDdd: TStringField
      FieldName = 'Ddd'
      Origin = 'Ddd'
      FixedChar = True
      Size = 3
    end
    object QryEnderecoSiafi: TStringField
      FieldName = 'Siafi'
      Origin = 'Siafi'
      Size = 100
    end
  end
  object PrvEndereco: TDataSetProvider
    DataSet = QryEndereco
    Left = 410
    Top = 72
  end
  object CdsEndereco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'PrvEndereco'
    Left = 492
    Top = 71
    object CdsEnderecoCep: TStringField
      FieldName = 'Cep'
      Size = 10
    end
    object CdsEnderecoLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 100
    end
    object CdsEnderecoComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object CdsEnderecoUnidade: TStringField
      FieldName = 'Unidade'
      Size = 10
    end
    object CdsEnderecoBairro: TStringField
      FieldName = 'Bairro'
      Size = 100
    end
    object CdsEnderecoLocalidade: TStringField
      FieldName = 'Localidade'
      Size = 100
    end
    object CdsEnderecoUf: TStringField
      FieldName = 'Uf'
      FixedChar = True
      Size = 2
    end
    object CdsEnderecoEstado: TStringField
      FieldName = 'Estado'
      Size = 100
    end
    object CdsEnderecoRegiao: TStringField
      FieldName = 'Regiao'
      Size = 100
    end
    object CdsEnderecoIbge: TStringField
      FieldName = 'Ibge'
      Size = 10
    end
    object CdsEnderecoGia: TStringField
      FieldName = 'Gia'
      Size = 10
    end
    object CdsEnderecoDdd: TStringField
      FieldName = 'Ddd'
      FixedChar = True
      Size = 3
    end
    object CdsEnderecoSiafi: TStringField
      FieldName = 'Siafi'
      Size = 100
    end
  end
end
