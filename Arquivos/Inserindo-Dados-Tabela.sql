-- Inserindo dados na tabela Pessoa_PF
INSERT INTO Pessoa_PF (CPF, Nome) VALUES
('11122233344', 'João da Silva'),
('22233344455', 'Maria Oliveira'),
('33344455566', 'Pedro Costa'),
('44455566677', 'Ana Pereira');

-- Inserindo dados na tabela Pessoa_PJ
INSERT INTO Pessoa_PJ (CNPJ, NomeDaEmpresa, RazaoSocial, Localizacao, Fornecedor) VALUES
('11111111111111', 'Tech Solution', 'TS Soluções em Tecnologia S.A.', 'Rua A, 123', TRUE),
('22222222222222', 'Moda e Estilo', 'ME Comércio de Roupas Ltda', 'Av. B, 456', TRUE),
('33333333333333', 'Food Heaven', 'FH Alimentos Ltda', 'Praça C, 789', TRUE),
('44444444444444', 'Decora Já', 'DJ Decorações S.A.', 'Alameda D, 1011', TRUE);

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (Endereco, CPF) VALUES
('Rua das Flores, 10', '11122233344'),
('Av. Central, 20', '22233344455');
INSERT INTO Cliente (Endereco, CNPJ) VALUES
('Rua das Indústrias, 30', '11111111111111');
INSERT INTO Cliente (Endereco, CPF) VALUES
('Rua da Paz, 40', '33344455566'),
('Av. Brasil, 50', '44455566677');
INSERT INTO Cliente (Endereco, CNPJ) VALUES
('Rua do Comércio, 60', '22222222222222');

-- Inserindo dados na tabela Pedido
INSERT INTO Pedido (Status, Frete, Cod_Rastreio, idCliente) VALUES
('Processando', 15.50, 'BR123456789BR', 1),
('Enviado', 25.00, 'BR987654321BR', 2),
('Entregue', 0.00, 'BR112233445BR', 3),
('Processando', 10.00, 'BR445566778BR', 4),
('Enviado', 20.75, 'BR667788990BR', 5),
('Entregue', 5.00, 'BR135792468BR', 6);

-- Inserindo dados na tabela Produtos
INSERT INTO Produtos (Nome, Descricao, Preco, Categoria) VALUES
('Camiseta Estampada', 'Camiseta de algodão com estampa', 49.90, 'Roupa'),
('Smartphone X', 'Celular de última geração', 2500.00, 'Tecnologia'),
('Biscoito de Arroz', 'Biscoito integral sem glúten', 8.50, 'Alimento'),
('Cadeira de Escritório', 'Cadeira ergonômica com rodinhas', 350.00, 'Decoração'),
('Notebook Pro', 'Notebook para programadores', 4200.00, 'Tecnologia'),
('Vestido de Festa', 'Vestido longo de seda', 180.00, 'Roupa'),
('Mesa de Centro', 'Mesa de centro de madeira', 120.00, 'Decoração'),
('Café Gourmet', 'Café especial torra média', 30.00, 'Alimento');

-- Inserindo dados na tabela Pedido_has_Produtos
INSERT INTO Pedido_has_Produtos (idPedido, idProdutos, Quantidade) VALUES
(1, 1, 2), -- Pedido 1 (João) tem 2 Camisetas
(1, 2, 1), -- Pedido 1 (João) tem 1 Smartphone
(2, 3, 5), -- Pedido 2 (Maria) tem 5 Biscoitos
(3, 4, 1), -- Pedido 3 (Tech Solution) tem 1 Cadeira
(4, 5, 1), -- Pedido 4 (Pedro) tem 1 Notebook
(5, 6, 1), -- Pedido 5 (Ana) tem 1 Vestido
(6, 7, 2), -- Pedido 6 (Moda e Estilo) tem 2 Mesas
(6, 8, 3); -- Pedido 6 (Moda e Estilo) tem 3 Cafés

-- Inserindo dados na tabela Produtos_has_Pessoa (Associação Produto-Fornecedor)
INSERT INTO Produtos_has_Pessoa (idProdutos, CNPJ, Quantidade) VALUES
(1, '22222222222222', 100), -- Moda e Estilo fornece Camiseta
(2, '11111111111111', 50),  -- Tech Solution fornece Smartphone
(3, '33333333333333', 200), -- Food Heaven fornece Biscoito
(4, '44444444444444', 30),  -- Decora Já fornece Cadeira
(5, '11111111111111', 25),  -- Tech Solution fornece Notebook
(6, '22222222222222', 80),  -- Moda e Estilo fornece Vestido
(7, '44444444444444', 40),  -- Decora Já fornece Mesa
(8, '33333333333333', 150); -- Food Heaven fornece Café

-- Inserindo dados na tabela Cartao
INSERT INTO Cartao (Nome, Tipo, NumeroDoCartao, MesValidade, AnoValidade, idCliente) VALUES
('João da Silva', 'Crédito', '1234567890123456', 10, 2028, 1),
('Maria Oliveira', 'Débito', '9876543210987654', 05, 2026, 2),
('TS Soluções', 'Crédito', '1111222233334444', 12, 2029, 3),
('Pedro Costa', 'Crédito', '5555666677778888', 07, 2027, 4);

-- Inserindo dados na tabela Estoque
INSERT INTO Estoque (Localizacao) VALUES
('Centro de Distribuição Principal'),
('Armazém Norte'),
('Ponto de Venda Sul');

-- Inserindo dados na tabela Estoque_has_Produtos
INSERT INTO Estoque_has_Produtos (idEstoque, idProdutos, Quantidade) VALUES
(1, 1, 50),
(1, 2, 20),
(2, 3, 100),
(2, 4, 15),
(3, 5, 10),
(3, 6, 30);