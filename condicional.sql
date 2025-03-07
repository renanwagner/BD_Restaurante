/*
Consultas
*/

USE restaurante;

SELECT * FROM pedidos 
WHERE id_funcionario = 4 AND status = 'Pendente'; -- Seleciona o pedido atendido pelo funcionário de id 4 e que ainda não foi concluído

SELECT * FROM pedidos 
WHERE status <> 'Concluído'; -- Seleciona todos os pedidos ainda não concluídos

SELECT * FROM pedidos
WHERE id_produto IN (1, 3, 5, 7, 8); -- Seleciona os pedidos com a identificação especifíca

SELECT * FROM clientes
WHERE nome LIKE 'c%'; -- Seleciona todos os cliente cujo nome comece com a letra C

SELECT * FROM info_produtos
WHERE ingredientes LIKE 'carne%' OR'frango%'; -- Seleciona todos os produtos que possuem carne ou frango em sua composição

SELECT * FROM produtos 
WHERE preco BETWEEN 20 AND 30; -- Seleciona todos os produtos com preco entre 20 e 30 reais

SELECT * FROM pedidos 
WHERE id_pedido = 6; -- Seleciona o pedido com a identificação específica

UPDATE pedidos
SET status = NULLIF(status, 'Concluído')
WHERE id_pedido = 6; -- Torna o status do pedido nulo

SELECT * FROM pedidos 
WHERE status IS NULL; -- Seleciona todos os pedidos que possuem status nulo

SELECT id_pedido, status, IFNULL(status, 'Cancelado') AS status_atualizado FROM pedidos; -- Seleciona o nome e o status, alterando todos os registros que possuírem status nulo por 'Cancelado'

SELECT nome, cargo, salario,
	CASE 
		WHEN salario > 3000 THEN 'Acima da média'
        ELSE 'Abaixo da média'
	END AS media_salario
FROM funcionarios; -- Seleciona o nome, cargo e salario, cria uma tabela de média salarial e divide os salarios para saber quem está abaixo ou acima da média.