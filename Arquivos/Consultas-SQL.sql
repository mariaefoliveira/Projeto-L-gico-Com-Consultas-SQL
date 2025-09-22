-- Quantidade vendida de cada produto
SELECT
    p.Nome AS NomeProduto,
    SUM(php.Quantidade) AS QuantidadeTotalVendida
FROM
    Produtos AS p
JOIN
    Pedido_has_Produtos AS php ON p.idProdutos = php.idProdutos
GROUP BY
    p.idProdutos
ORDER BY
    QuantidadeTotalVendida DESC;
    
-- Categorias de produtos que têm um estoque total superior a 50 unidades.
SELECT
    p.Categoria,
    SUM(ehp.Quantidade) AS QuantidadeTotal
FROM
    Produtos AS p
JOIN
    Estoque_has_Produtos AS ehp ON p.idProdutos = ehp.idProdutos
GROUP BY
    p.Categoria
HAVING
    QuantidadeTotal > 50;
    
-- Fornecedores e a quantidade de produtos fornecidas

SELECT
    pj.NomeDaEmpresa AS NomeFornecedor,
    COUNT(php.idProdutos) AS QuantidadeDeProdutosFornecidos
FROM
    Pessoa_PJ AS pj
JOIN
    Produtos_has_Pessoa AS php ON pj.CNPJ = php.CNPJ
GROUP BY
    pj.CNPJ
ORDER BY
    QuantidadeDeProdutosFornecidos DESC;

-- Pedido_has_Produtos = Itens comprados por clientes específicos
SELECT
    p.Nome AS NomeProduto,
    php.Quantidade
FROM
    Cliente AS c
JOIN
    Pedido AS pd ON c.id = pd.idCliente
JOIN
    Pedido_has_Produtos AS php ON pd.idPedido = php.idPedido
JOIN
    Produtos AS p ON php.idProdutos = p.idProdutos
WHERE
    c.CPF = '11122233344';