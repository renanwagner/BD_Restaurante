/*
Criação de um DB para um restaurante
*/

CREATE DATABASE IF NOT EXISTS restaurante;

use restaurante;

CREATE TABLE IF NOT EXISTS funcionarios(
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY COMMENT'O identificador do funcionário é único',
    nome VARCHAR(255) COMMENT'Nome completo do funcionário',
    CPF VARCHAR(14) COMMENT'CPF do funcionário',
    data_nascimento DATE COMMENT'Data de nascimento do funcionário',
    endereco VARCHAR(255) COMMENT'Endereço residencial do funcionário',
    telefone VARCHAR(15) COMMENT 'Número de telefone para contato do funcionário',
    email VARCHAR(100) COMMENT 'Endereço de e-mail do funcionário',
    cargo VARCHAR(100) COMMENT 'Cargo de ocupação do funcionário no restaurante',
    salario DECIMAL(10,2) COMMENT 'Remuneração do funcionário',
    data_admissao DATE COMMENT 'Data de admissão do funcionário no restaurante'
    );

    
CREATE TABLE IF NOT EXISTS clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY COMMENT 'O identificador do cliente é único',
    nome VARCHAR(255) COMMENT 'Nome completo do cliente',
    cpf VARCHAR(14) COMMENT 'CPF do cliente',
    data_nascimento DATE COMMENT 'Data de nascimento do cliente',
    endereco VARCHAR(255) COMMENT 'Endereço residencial do cliente',
    telefone VARCHAR(15) COMMENT 'Telefone para contato do cliente',
    email VARCHAR(100) COMMENT 'Endereço de e-mail para contato do cliente',
    data_cadastro DATE COMMENT 'Data em que o cliente foi cadastrado no sistema'
);

    
CREATE TABLE IF NOT EXISTS produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY COMMENT 'O identificador do produto é único',
    nome VARCHAR(255) COMMENT 'Nome do produto',
    descricao TEXT COMMENT 'Descrição detalhada do produto',
    preco DECIMAL(10,2) COMMENT 'Preço de venda do produto',
    categoria VARCHAR(100) COMMENT 'Categoria que abrange o produto (bebida, entrada, prato principal, sobremesa, etc.)'
);


CREATE TABLE IF NOT EXISTS pedidos(
	id_pedido INT AUTO_INCREMENT PRIMARY KEY COMMENT 'O identificador do pedido é único',
    id_cliente INT COMMENT 'O identificador será o mesmo que o do cliente que efetuou o pedido',
    id_funcionario INT COMMENT 'O identificador será o mesmo que o do funcionário que atendeu ao pedido',
    id_produto INT COMMENT 'O identificador será o mesmo que o do produto pedido',
    quantidade INT COMMENT 'A quantidade do produto que está disponível para venda',
    preco DECIMAL(10,2) COMMENT 'O preco do venda do produto no momento do pedido',
    data_pedido DATE COMMENT 'Data em que o pedido foi efetuado',
    status VARCHAR(255) COMMENT 'Status do pedido (pendente, concluído, cancelado)',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
    );
    
    
CREATE TABLE IF NOT EXISTS info_produtos(
	id_info INT AUTO_INCREMENT PRIMARY KEY COMMENT 'O identificador da informação do produto é único',
    id_produto INT COMMENT 'O identificador será o mesmo que o do produto informado',
    ingrendientes TEXT COMMENT 'A lista de ingredientes que compõem o produto',
    fornecedor VARCHAR(255) COMMENT 'O nome do fornecedor do produto',
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);