# BD_Restaurante
Um BD de um restaurante que conecta os dados da coluna de uma tabela através de chaves estrangeiras.

* Como funciona o script
  - O script cria um Banco de dados para um restaurante.
  - Tabelas para cada integrante do processo são criadas (funcionários, clientes, produtos, pedidos, etc).
  - Conexões são criadas entre cada uma dessas tabelas em relação ao número de identificação de cada categoria através de chaves estrangeiras que se ligam com uma chave primária.

* Caso queira ver a estrutura da tabela, utilize o comando DESC nome_da_tabela. Isso mostrará todos os dados e suas características.

* Manipulando dados
  - No arquivo "manipulação.sql" é possível ver os dados inseridos em cada tabela.
  - SELECT é usado para maior controle visual das tabelas, ajudando na integridade dos dados ao inserir a quantidade e a característica correta.
  - UPDATE é usado para atualizar dados cadastrais de um funcionário, o que é constantemente exigido, devido a necessidade de mantermos os dados atualizados.
  - DELETE é usado para deletar os dados de um funcionário. Ajuda a manter apenas os dados que realmente fazem sentido para a empresa. Um ex funcionnário desligado não deve estar no BD de uma empresa.

* Consultando com condicionais
  - No arquivo "condicional", foi feita a consulta de dados para análises utilizando condicionais como:
  - WHERE, para definir qual critério o registro deve antender.
  - IN, para definir um período de dados em determinada coluna.
  - AND e OR, para definir mais de um critério, podendo selecionar dois ou mais, no caso de AND, ou um ou outro, no caso de OR.
  - NULLIF e IFNULL, para anular um registro com uma determinada condição ou acessar um registro já nulo.
  - LIKE, para selecionar um registr que contenha exatamente o especificado ou, no caso da utilização do "%", contenha uma parte do especificado.
  - BETWEEN, para definir um intervalo entre um número e outro.
  - IS NULL, para selecionar o que for nulo.
  - CASE, para criar uma endentação e utilizar condicionais para definir novas classificações para determinados dados.
