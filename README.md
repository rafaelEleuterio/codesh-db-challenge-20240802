# codesh-db-challenge-20240802


## Introdução

Este projeto é a resposta a um desafio feito pela [Coodesh](https://coodesh.com/), encontrado [aqui](https://github.com/coodesh/db-challenge-20240802)!

### Pontos importantes para os avaliadores
 
- O projeto está na linguagem SQL;
- Cada consulta (querie) está na pasta [Consultas do Desafio](https://github.com/rafaelEleuterio/codesh-db-challenge-20240802/tree/main/Consultas%20do%20Desafio) e aqui no README.md está detalhado o que eu supus para cada consulta.
- O projeto foi testado no SQL Server Management Studio 21 (SSMS 21).

 
### Modelo de Dados:

Foi seguida esta imagem para a criação do banco de dados:

![<img src="samples/model.png" height="500" alt="Modelo" title="Modelo"/>](samples/model.png)

Para simplificar, todos os IDs foram colocados como int36 na criação da tabelas. Afim de poupar tempo, a maioria dos outros dados ficaram como nchar(50), visto que este é só um exemplo e não necessariamente reflete a qualidade de criar um bom DB, com campos bem delimitados com seus tipos, boas indexações com PK, FK e outros. Tudo isto não foi priorizado por mim, já que este desafio é uma luta contra o relógio.

### Instruções para a criação do DB

1. Instale o SQL Server Management Studio 21.
2. Entre no servidor localdb padrão.
3. Crie um DB com nome a sua escolha neste servidor. Para criar, basta clicar para expandir o servidor > Clique com o botão direito no "Bancos de dados" > Selecione a opção "Novo Banco de Dados...".
4. Execute o [script para criação do DB](https://github.com/rafaelEleuterio/codesh-db-challenge-20240802/blob/main/Criacao%20do%20DB/create_tables_bike_stores_demo_script.sql), se atentando para que ele esteja executando no banco de dados recém criado.
5. Caso queira, execute o [script para inserção de dados](https://github.com/rafaelEleuterio/codesh-db-challenge-20240802/blob/main/Criacao%20do%20DB/populate_tables_bike_stores_demo_script%20-%20Copia.sql) logo após a criação. O script contém alguns "dados burros", que foram utilizados para o teste e podem ser desconsiderados. Caso não queira utilizá-los, basta excluí-los do script.


## Selects

Construir as seguintes consultas:

- [Listar todos Clientes que não tenham realizado uma compra](https://github.com/rafaelEleuterio/codesh-db-challenge-20240802/blob/main/Consultas%20do%20Desafio/01%20-%20Listar%20todos%20Clientes%20que%20não%20tenham%20realizado%20uma%20compra.sql):
  - Aqui considerei que os clientes (customers) que não realizaram qualquer compra não teriam referência na tabela de orders, isto é, caso seja feito um levantamento de todos os clientes citados em um SELECT * FROM orders, ele não apareceria.
- [Listar os Produtos que não tenham sido comprados](https://github.com/rafaelEleuterio/codesh-db-challenge-20240802/blob/main/Consultas%20do%20Desafio/02%20-%20Listar%20os%20Produtos%20que%20não%20tenham%20sido%20comprados.sql):
  - Utilizei a mesma lógica do item anterior. Caso seja feito um levantamento de todos os produtos na tabela de detalhes do pedido, peguei todos os produtos que não foram achados.
- [Listar os Produtos sem Estoque](https://github.com/rafaelEleuterio/codesh-db-challenge-20240802/blob/main/Consultas%20do%20Desafio/03%20-%20Listar%20os%20Produtos%20sem%20Estoque.sql):
  - Supus que todos os produtos estivessem registrados no estoque, isto é, até o produto que não tenha no estoque, deveria estar registrado com quantidade 0.
- [Agrupar a quantidade de vendas que uma determinada Marca por Loja](https://github.com/rafaelEleuterio/codesh-db-challenge-20240802/blob/main/Consultas%20do%20Desafio/04%20-%20Agrupar%20a%20quantidade%20de%20vendas%20que%20uma%20determinada%20Marca%20por%20Loja.sql):
  - Este é complicado de explicar por texto, mas basicamente, é preciso correlacionar 3 tabelas inicialmente. A de marcas (brands), a de lojas (stores) com a de pedidos. Porém, só temos parte da informação que queremos no detalhes de pedidos (order_items), por isso é necessário mais um vínculo. E para correlacionar todas essas tabelas, foi preciso a tabela de produtos (products). Feito a relação e então o agrupamento, basta fazer uma contagem para saber a quantidade de vendas de uma Marca por Loja.
- [Listar os Funcionarios que não estejam relacionados a um Pedido](https://github.com/rafaelEleuterio/codesh-db-challenge-20240802/blob/main/Consultas%20do%20Desafio/05%20-%20Listar%20os%20Funcionarios%20que%20não%20estejam%20relacionados%20a%20um%20Pedido.sql):
  - Meu instinto me diz que deve haver uma maneira melhor e mais eficaz de fazer esta consulta, porém não consegui raciocinar com o tempo que tinha. Tudo o que fiz foi relacionar a tabela de funcionários (staffs) com a tabela de pedidos (orders) e filtrar com uma lista, adquirida através de uma subquerie).

