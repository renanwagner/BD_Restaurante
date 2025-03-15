/*
Funções de agregação
*/

USE restaurante;

SELECT * FROM pedidos;
SELECT * FROM info_produtos;

SELECT COUNT(*) AS total_quantidade FROM pedidos; -- Consulta a quantidade de pedidos que foram feitos

SELECT COUNT(DISTINCT id_cliente) FROM pedidos; -- Consulta a quantidade de clientes únicos que realizaram pedidos

SELECT AVG(preco) FROM produtos; -- Calcula a média de preço dos produtos

SELECT MIN(preco) FROM produtos; -- Consulta o preço mais baixo encontrado em um produto

SELECT MAX(preco) FROM produtos; -- Consultado o preço mais alto encontrado em um produto

SELECT 
	DISTINCT nome, preco, 
    DENSE_RANK() OVER (ORDER BY(preco) DESC) AS rank_preco 
    FROM produtos 
LIMIT 5; -- Consulta e cria um rank dos 5 produtos mais caros

SELECT 
	categoria, 
    ROUND(AVG(preco), 2) AS media_preco 
    FROM produtos 
GROUP BY categoria; -- Consulta a média de preço de cada categoria 

SELECT 
	fornecedor, 
	COUNT(id_produto) AS quantidade_fronecedor 
	FROM info_produtos 
GROUP BY fornecedor; -- Consulta o fornecedor e a quantidade de produtos que vem daquele fornecedor.

SELECT 
	fornecedor, 
    COUNT(id_produto) AS maiores_fornecedores 
    FROM info_produtos 
    GROUP BY fornecedor 
HAVING COUNT(id_produto) > 1; -- Consulta o fornecedor e quadntidade de produtos que vem desse fornecedor, levando em consideração apenas os que fornecem mais de um produto.

SELECT 
	id_cliente, 
    COUNT(id_produto) AS pedidos_únicos 
    FROM pedidos 
    GROUP BY id_cliente 
HAVING COUNT(id_produto) = 1; -- Consulta o cliente e os pedidos feitos por esse cliente, contanto que ele tenha feito apenas um pedido.

