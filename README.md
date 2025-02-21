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
