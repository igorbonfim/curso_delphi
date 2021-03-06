object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  Height = 375
  Width = 463
  object ConexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    Connected = True
    SQLHourGlass = True
    HostName = '.'
    Port = 1433
    Database = 'Vendas'
    User = 'sa'
    Password = 'epilef'
    Protocol = 'mssql'
    LibraryLocation = 'C:\Projetos\ProjetoDelphi\ntwdblib.dll'
    Left = 48
    Top = 32
  end
  object QryScriptCategoria: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID('#39'Categorias'#39') IS NULL'
      'BEGIN'
      ' CREATE TABLE Categorias('
      #9'categoriaId int IDENTITY(1,1) NOT NULL,'
      #9'descricao varchar(30) NULL,'
      #9'PRIMARY KEY (categoriaId)'
      ')'
      'END')
    Params = <>
    Left = 128
    Top = 32
  end
  object QryScriptClientes: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID('#39'Clientes'#39') IS NULL'
      'BEGIN'
      ' CREATE TABLE Clientes('
      #9'clienteId int IDENTITY(1,1) NOT NULL,'
      #9'nome varchar(60) NULL,'
      #9'endereco varchar(60) NULL,'
      #9'cidade varchar(50) NULL,'
      #9'bairro varchar(40) NULL,'
      #9'estado varchar(2) NULL,'
      #9'cep varchar(10) NULL,'
      #9'telefone varchar(14) NULL,'
      #9'email varchar(100) NULL,'
      #9'dataNascimento datetime NULL,'
      #9'PRIMARY KEY (clienteId)'
      ')'
      'END')
    Params = <>
    Left = 222
    Top = 32
  end
  object QryScriptProdutos: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID('#39'Produtos'#39') IS NULL'
      'BEGIN'
      ' CREATE TABLE Produtos('
      #9'produtoId int IDENTITY(1,1) NOT NULL,'
      #9'nome varchar(60) NULL,'
      #9'descricao varchar(255) NULL,'
      #9'valor decimal(18,5) default 0.00000 NULL,'
      #9'quantidade decimal(18,5) default 0.00000 NULL,'
      #9'categoriaId int NULL,'
      #9'PRIMARY KEY (produtoId),'
      #9'CONSTRAINT FK_ProdutosCategorias'
      #9'FOREIGN KEY (categoriaId) references categorias(categoriaId)'
      ')'
      'END')
    Params = <>
    Left = 311
    Top = 32
  end
  object QryScriptVendas: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID('#39'Vendas'#39') IS NULL'
      'BEGIN'
      ' CREATE TABLE Vendas('
      #9'vendaId int IDENTITY(1,1) NOT NULL,'
      #9'clienteId int NOT NULL,'
      #9'dataVenda datetime default getdate(),'
      #9'totalVenda decimal(18,5) default 0.00000,'
      #9'PRIMARY KEY (vendaId),'
      
        #9'CONSTRAINT FK_VendasClientes FOREIGN KEY (clienteId) REFERENCES' +
        ' clientes(clienteId)'#9
      ')'
      'END')
    Params = <>
    Left = 399
    Top = 33
  end
  object QryScriptItensVendas: TZQuery
    Connection = ConexaoDB
    SQL.Strings = (
      'IF OBJECT_ID('#39'VendasItens'#39') IS NULL'
      'BEGIN'
      ' CREATE TABLE VendasItens('
      #9'vendaId int NOT NULL,'
      #9'produtoId int NOT NULL,'
      #9'valorUnitario decimal(18,5) default 0.00000,'
      #9'quantidade decimal(18,5) default 0.00000,'
      #9'totalProduto decimal(18,5) default 0.00000,'
      #9'PRIMARY KEY (vendaId, produtoId),'
      
        #9'CONSTRAINT FK_VendasItensProdutos FOREIGN KEY (produtoId) REFER' +
        'ENCES produtos(produtoId)'#9
      ')'
      'END')
    Params = <>
    Left = 45
    Top = 104
  end
end
