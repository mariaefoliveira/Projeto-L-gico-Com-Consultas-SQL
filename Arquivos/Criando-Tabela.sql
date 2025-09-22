-- Criando database do cenário e-commerce

CREATE database Ecommerce;
USE Ecommerce;

-- Tabela Pessoa
CREATE TABLE Pessoa_PF(
CPF char(11) primary key,
Nome varchar(45) not null
);

CREATE TABLE Pessoa_PJ(
CNPJ char(14) primary key NOT NULL,
NomeDaEmpresa varchar(45) NOT NULL,
RazaoSocial varchar(45),
Localizacao varchar(45) NOT NULL,
Fornecedor Boolean
);

-- Criando tabela Cliente
CREATE TABLE Cliente(
id int primary key auto_increment, 
Endereco varchar (45) not null,
CNPJ CHAR(14),
CPF CHAR(11),
-- Definindo a chave estrangeira para CNPJ
FOREIGN KEY (CNPJ) REFERENCES Pessoa_PJ(CNPJ),
-- Definindo a chave estrangeira para CPF
FOREIGN KEY (CPF) REFERENCES Pessoa_PF(CPF)
);

-- Criando Tabela Pedido
CREATE TABLE Pedido (
idPedido INT PRIMARY KEY AUTO_INCREMENT,
Status VARCHAR(45),
Frete FLOAT,
Cod_Rastreio VARCHAR(45),
idCliente INT,
FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);

-- Criando Tabela Produto
CREATE TABLE Produtos (
idProdutos INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(45) NOT NULL,
Descricao VARCHAR(45) NOT NULL,
Preco FLOAT NOT NULL,
Categoria Enum ('Roupa','Alimento','Tecnologia','Decoração')
);

CREATE TABLE Pedido_has_Produtos (
    idPedido INT,
    idProdutos INT,
    Quantidade INT,
    PRIMARY KEY (idPedido, idProdutos),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idProdutos) REFERENCES Produtos(idProdutos)
);

CREATE TABLE Produtos_has_Pessoa (
    idProdutos INT,
    CNPJ VARCHAR(14),
    Quantidade INT,
    PRIMARY KEY (idProdutos, CNPJ),
    FOREIGN KEY (idProdutos) REFERENCES Produtos(idProdutos),
    FOREIGN KEY (CNPJ) REFERENCES Pessoa_PJ(CNPJ)
);
-- Criando tabela Cartão
CREATE TABLE Cartao (
    idCartao INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45),
    Tipo VARCHAR(45),
    NumeroDoCartao VARCHAR(45),
    MesValidade TINYINT,
    AnoValidade SMALLINT,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);

-- Criando tabela estoque
CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    Localizacao VARCHAR(45)
);

CREATE TABLE Estoque_has_Produtos (
    idEstoque INT,
    idProdutos INT,
    Quantidade INT,
    PRIMARY KEY (idEstoque, idProdutos),
    FOREIGN KEY (idEstoque) REFERENCES Estoque(idEstoque),
    FOREIGN KEY (idProdutos) REFERENCES Produtos(idProdutos)
);

