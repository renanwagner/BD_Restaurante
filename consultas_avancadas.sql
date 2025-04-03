USE restaurante;

SELECT * FROM funcionarios;
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM info_produtos;
SELECT * FROM pedidos;

-- Cria uma view com JOIN entre quatro tabelas
CREATE VIEW resumo_pedido AS
SELECT 
	pe.id_pedido, 
	pe.quantidade, 
    pe.data_pedido, 
    c.nome AS cliente, 
    c.email, 
    f.nome AS funcionario, 
    pr.nome AS produto, 
    pr.preco
FROM pedidos pe
JOIN clientes c ON pe.id_cliente = c.id_cliente
JOIN funcionarios f ON pe.id_funcionario = f.id_funcionario
JOIN produtos pr ON pe.id_produto = pr.id_produto;

-- Seleciona o id, o nome do cliente e o valor do pedido na view
SELECT id_pedido, cliente, SUM(quantidade * preco) AS total_pedido
FROM resumo_pedido
GROUP BY id_pedido, cliente;

-- Atualiza a view adicionando o campo de total
CREATE OR REPLACE VIEW resumo_pedido AS
SELECT 
	pe.id_pedido, 
	pe.quantidade, 
	pe.data_pedido, 
	c.nome AS cliente, 
	c.email, 	
	f.nome AS funcionario, 
	pr.nome AS produto, 
	pr.preco, 
	SUM(pe.quantidade * pr.preco) AS total_pedido
FROM pedidos pe
JOIN clientes c ON pe.id_cliente = c.id_cliente
JOIN funcionarios f ON pe.id_funcionario = f.id_funcionario
JOIN produtos pr ON pe.id_produto = pr.id_produto;

-- Seleciona o id, o nome do cliente e o total do pedido na view atualizada
SELECT id_pedido, cliente, total_pedido
FROM resumo_pedido;

-- Cria uma função para passar os ingredientes do produto ao usar o id_produto como argumento
DELIMITER //
CREATE FUNCTION BuscaIngredientesProduto(idProduto INT)
RETURNS VARCHAR(200)
READS SQL DATA
BEGIN
	DECLARE Ingredientes VARCHAR(200);
    SELECT ingredientes INTO Ingredientes 
    FROM info_produtos 
    WHERE id_produto = idProduto;
    RETURN Ingredientes;
END //
DELIMITER ;

-- Executa a função cujo id_produto corresponde a 10
SELECT BuscaIngredientesProduto(10);

-- Cria uma função de retorna a informação de se o preço do pedido é abaxio, acima ou está na média geral dos pedidos, utilizando o id_pedido como argumento
DELIMITER //
CREATE FUNCTION mediaPedido (idPedido INT)
RETURNS VARCHAR(200)
READS SQL DATA
BEGIN
	DECLARE preco_pedido DECIMAL(10,2);
	DECLARE media DECIMAL(10, 2);
    DECLARE desempenho VARCHAR(200);
    
    SELECT preco INTO preco_pedido
    FROM pedidos
    WHERE id_pedido = idPedido;
    
    SELECT AVG(preco) INTO media 
    FROM pedidos;

    SET desempenho =
    CASE
		WHEN preco_pedido < media THEN 'Baixo'
        WHEN preco_pedido = media THEN 'Na média'
        ELSE 'Alto'
	END;

	RETURN desempenho
    ;
END //
DELIMITER ;

DROP FUNCTION mediaPedido;

-- Executa a função cujo id_pedido correponde à 5
SELECT mediaPedido(5);

-- Executa a função cujo id_pedido correponde à 6
SELECT mediaPedido(6);




