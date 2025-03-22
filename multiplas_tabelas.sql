USE restaurante;

SELECT * FROM funcionarios;
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM info_produtos;
SELECT * FROM pedidos;

SELECT pr.id_produto, pr.nome, pr.descricao, ip.ingredientes
FROM produtos pr
JOIN info_produtos ip ON pr.id_produto = ip.id_produto; -- Seleciona a tabela produto e info_produtos aplicando um INNER JOIN pelo id_produto

SELECT pe.id_pedido, pe.quantidade, pe.data_pedido, c.nome, c.email
FROM pedidos pe
JOIN clientes c ON pe.id_cliente = c.id_cliente; -- Seleciona registros da tabela pedido e clientes, aplicando um JOIN entre ambas pelo id_cliente

SELECT pe.id_pedido, pe.quantidade, pe.data_pedido, c.nome AS cliente, c.email, f.nome AS funcionario
FROM pedidos pe
JOIN clientes c ON pe.id_cliente = c.id_cliente
JOIN funcionarios f ON pe.id_funcionario = f.id_funcionario; -- Seleciona registros das tabelas pedidos, clientes, funcionarios aplicando um JOIN primeiramente pelo id_cliente e depois pelo id_funcionario

SELECT pe.id_pedido, pe.quantidade, pe.data_pedido, c.nome AS cliente, c.email, f.nome AS funcionario, pr.nome AS produto, pr.preco 
FROM pedidos pe
JOIN clientes c ON pe.id_cliente = c.id_cliente
JOIN funcionarios f ON pe.id_funcionario = f.id_funcionario
JOIN produtos pr ON pe.id_produto = pr.id_produto; -- Seleciona registros das tabelas pedidos, clientes, funcionarios e produtos, aplicando um JOIN primeiramente pelo id_cliente, depois pelo id_funcionario, e então pelo id_produto

SELECT c.id_cliente, c.nome, pe.id_pedido, pe.status
FROM clientes c
JOIN pedidos pe ON c.id_cliente = pe.id_cliente
WHERE status LIKE 'Pendente'
ORDER BY pe.id_pedido DESC; -- Seleciona os registros de status pendente das tabelas clientes e pedidos, aplicando um JOIN pelo id_cliente e ordena por id_pedido de forma decrescente.

SELECT c.id_cliente, c.nome, pe.id_pedido, pe.status
FROM clientes c
JOIN pedidos pe ON c.id_cliente = pe.id_cliente
WHERE status is NULL; -- Seleciona os registros de status nulo das tabelas clientes e pedido, aplicando um JOIN pelo id_cliente

SELECT c.id_cliente, c.nome, COUNT(pe.id_pedido) AS pedidos_total
FROM clientes c
JOIN pedidos pe ON c.id_cliente = pe.id_cliente
GROUP BY c.id_cliente; -- Seleciona a quantidade total de pedidos feitos pelos clientes através de um JOIN pelo id_cliente e agrupando pelo id_cliente

SELECT pe.id_pedido, pe.quantidade, pr.preco, SUM(pe.quantidade * pr.preco) AS preco_total
FROM pedidos pe
JOIN produtos pr ON pe.id_produto = pr.id_produto
GROUP BY id_pedido
ORDER BY preco_total DESC; -- Seleciona o valor total de cada pedido com base na quantidade multiplicada preço através de um JOIN entre a tabela pedidos e produtos, agrupando por id_pedido e ordenando do maior para o menor preço