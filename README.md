# Projeto-L-gico-Com-Consultas-SQL
> Este projeto é um espaço para a continuação do desafio em que foi criado um MR de um e-commerce, desta vez, será criado tabelas correspondentes ao modelo e consultas serão realizadas.
> Os arquivos disponíveis para download: "Criando-Tabela", "Inserindo-Dados-Tabela" e "Consultas-SQL", estão com os códigos utilizados para a execução do desafio, e para os interessados, também está comentado.
> Obs: Os dados apresentados são fictícios.

Ferramentas utilizadas:

[![MySQL](https://img.shields.io/badge/MySQL-00758F.svg?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)

----
Primeiro foi criado o banco de dados e as tabelas seguindo este MR, não irei colocar todas as tabelas que foram criadas para esse relatório se tornar o mais simples possível

![MR-E-commmerce]()

### Criando Banco de Dados
`CREATE database Ecommerce;
USE Ecommerce;`

### Criando tabela Pedido
`CREATE TABLE Pedido (
idPedido INT PRIMARY KEY AUTO_INCREMENT,
Status VARCHAR(45),
Frete FLOAT,
Cod_Rastreio VARCHAR(45),
idCliente INT,
FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);`

----

Depois de criado as tabelas, foi preenchido com os dados, deixarei apenas uma inserção de exemplo para ficar ilustrativo.

### Inserindo dados na tabela Pedido
`INSERT INTO Pedido (Status, Frete, Cod_Rastreio, idCliente) VALUES
('Processando', 15.50, 'BR123456789BR', 1),
('Enviado', 25.00, 'BR987654321BR', 2),
('Entregue', 0.00, 'BR112233445BR', 3),
('Processando', 10.00, 'BR445566778BR', 4),
('Enviado', 20.75, 'BR667788990BR', 5),
('Entregue', 5.00, 'BR135792468BR', 6);`

Por fim as análises...
Fiz em torno de 4 consultas que achei interessante realizar para o e-commerce e deixarei com os resultados da tabela.

### Quantidade vendida de cada produto
`SELECT p.Nome AS NomeProduto, SUM(php.Quantidade) AS QuantidadeTotalVendida
FROM Produtos AS p
JOIN Pedido_has_Produtos AS php ON p.idProdutos = php.idProdutos
GROUP BY p.idProdutos
ORDER BY QuantidadeTotalVendida DESC;`

![Consulta1]()

### Categorias de produtos que têm um estoque total superior a 50 unidades
`SELECT p.Categoria, SUM(ehp.Quantidade) AS QuantidadeTotal
FROM Produtos AS p
JOIN Estoque_has_Produtos AS ehp ON p.idProdutos = ehp.idProdutos
GROUP BY p.Categoria
HAVING QuantidadeTotal > 50;`

![Consulta2]()

### Fornecedores e a quantidade de produtos fornecidas
`SELECT pj.NomeDaEmpresa AS NomeFornecedor, COUNT(php.idProdutos) AS QuantidadeDeProdutosFornecidos
FROM Pessoa_PJ AS pj
JOIN Produtos_has_Pessoa AS php ON pj.CNPJ = php.CNPJ
GROUP BY pj.CNPJ
ORDER BY QuantidadeDeProdutosFornecidos DESC;`

![Consulta3]()

### Itens comprados por clientes específicos
`SELECT p.Nome AS NomeProduto, php.Quantidade
FROM Cliente AS c
JOIN Pedido AS pd ON c.id = pd.idCliente
JOIN Pedido_has_Produtos AS php ON pd.idPedido = php.idPedido
JOIN Produtos AS p ON php.idProdutos = p.idProdutos
WHERE c.CPF = '11122233344';`

![Consulta4]()

