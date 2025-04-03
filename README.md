# BD_Restaurante
Um BD de um restaurante que conecta os dados da coluna de uma tabela através de chaves estrangeiras.

* Como funciona o script
  - O script cria um Banco de dados para um restaurante.
  - Tabelas para cada integrante do processo são criadas (funcionários, clientes, produtos, pedidos, etc).
  - Conexões são criadas entre cada uma dessas tabelas em relação ao número de identificação de cada categoria através de chaves estrangeiras que se ligam com uma chave primária.

* Caso queira ver a estrutura da tabela, utilize o comando DESC nome_da_tabela. Isso mostrará todos os dados e suas características.

* Manipulando dados
  - No arquivo "manipulação" é possível ver os dados inseridos em cada tabela.
  - SELECT é usado para maior controle visual das tabelas, ajudando na integridade dos dados ao inserir a quantidade e a característica correta.
  - UPDATE é usado para atualizar dados cadastrais de um funcionário, o que é constantemente exigido, devido a necessidade de mantermos os dados atualizados.
  - DELETE é usado para deletar os dados de um funcionário. Ajuda a manter apenas os dados que realmente fazem sentido para a empresa. Um ex funcionnário desligado não deve estar no BD de uma empresa.

* Consultando com condicionais
  - No arquivo "condicional" foram feitas consultas de dados para análises utilizando condicionais como:
  - WHERE, para definir qual critério o registro deve antender.
  - IN, para definir um período de dados em determinada coluna.
  - AND e OR, para definir mais de um critério, podendo selecionar dois ou mais, no caso de AND, ou um ou outro, no caso de OR.
  - NULLIF e IFNULL, para anular um registro com uma determinada condição ou acessar um registro já nulo.
  - LIKE, para selecionar um registr que contenha exatamente o especificado ou, no caso da utilização do "%", contenha uma parte do especificado.
  - BETWEEN, para definir um intervalo entre um número e outro.
  - IS NULL, para selecionar o que for nulo.
  - CASE, para criar uma endentação e utilizar condicionais para definir novas classificações para determinados dados.
 
* Consultando com agregações
  - No arquivo "agregação" foram feitas consultas de dados para análises utilizando funções de agragação como:
  - COUNT, para contar uma quantidade de registros.
  - DISTINCT, para selecionar apenas valores únicos.
  - AVG, para calcular a média de uma coluna numérica.
  - MIN, para selecionar o menor valor de uma coluna.
  - MAX, para selecionar o maior valor de uma coluna.
  - DENSE_RANK, para rankear registros únicos em posições crescentes.
  - ROUND, para  arredondar o valor de uma média.
  - GROUP BY, para agrupar dados conforme uma coluna.
  - HAVING, para estabelecer uma condicional na consulta de dados. Diferente do WHERE, deve ser usado depois da estrutura.
 
* Como funcionam as múltiplas tabelas?
  - No arquivo "múltiplas_tabelas" foram feitas consultas complexas utilizando duas ou mais tabelas através das seguintes ferramentas:
  - ALIAS, uma forma de abreviar a variável (coluna) para otimizar a visualização da query
  - PRIMARY KEY e FOREIGN KEY, através das ligações estabelecidas no arquivo "manipulação"
  - INNER JOIN, para criar uma ligação entre os dados em comum das tabelas, definidos pelas chaves
  - Além disso, comandos de condição e agregação foram utilizados para aumentar a complexidade e exatidão das consultas, como, por exemplo, WHERE e GROUP BY, que possibilitam uma visão clara e objetiva dos clientes com pedidos pendentes.
 
* Como funcionam as consultas avançadas?
  - No arquivo "consultas_avançadas" form feitas consultas complexas utilizando a criação de visualizações e funções automatizadas como:
  - VIEW, que cria uma "tabela" separada conforme as condições inseridas no código. É útil para separar informações necessárias e otimizar consultas.
  - FUNCTION, que cria uma função que armazena o código inserido. Podem se fazer joins, consultas agregadas ou com operadores. Para executar a função, utiliza-se o SELECT e número do identificador usado como argumento.
  - DELIMITER, muda o delimitador temporariamente para, nesse caso, "//", permitindo que o ";" possa ser usado dentro da função sem que o código seja encerrado. Após o fim da função, é importante mudar novamente o delimitador.
  - REPLACE, é utilizado para atualizar uma view já existente sem a necessidade de criá-la novamente. Para atualizar, é apenas inserior o comando o escrever o código novamente com a alteração desejada.
