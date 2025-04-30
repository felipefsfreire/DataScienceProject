# Data Science E-commerce Project

## Coleta de Dados

### Introdução

Este projeto tem como objetivo aplicar técnicas de Data Science para analisar e prever o comportamento de clientes em um e-commerce simulado, com foco em prever churn, recomendar produtos, realizar testes A/B e detectar fraudes. 

A fase de coleta de dados é crucial para criar um conjunto de dados inicial que servirá de base para todas as análises e modelos preditivos. Devido à ausência de dados reais, utilizaremos a geração de dados sintéticos para simular o comportamento de clientes, produtos e vendas.

A geração de dados sintéticos nos permitirá criar um ambiente de teste realista, facilitando o desenvolvimento e a validação dos modelos de análise. Além disso, essa abordagem nos dará flexibilidade para controlar a qualidade e a distribuição dos dados, garantindo que eles representem os padrões e características relevantes para o nosso e-commerce simulado.

### Configuração do Ambiente de Dados Sintéticos com Python

Para gerar os dados sintéticos, configuraremos um ambiente de desenvolvimento Python no sistema operacional Windows, utilizando o VSCode como IDE. As seguintes bibliotecas serão utilizadas:

- **Faker**: Responsável por gerar dados fictícios realistas, como nomes, endereços, e-mails e outros atributos de clientes e produtos.
- **pandas**: Utilizada para manipular os dados gerados em formato de tabelas (DataFrames), facilitando a organização e o processamento dos dados.
- **numpy**: Fornece suporte para operações matemáticas e arrays multidimensionais, útil para manipulação de dados numéricos.
- **uuid**: Utilizada para gerar identificadores únicos universais (UUIDs), garantindo a unicidade dos registros nas tabelas.
- **random**: Fornece funções para geração de números aleatórios, útil para simular comportamentos aleatórios nos dados de vendas.
- **datetime**: Utilizada para manipular datas e horários, permitindo a geração de datas de vendas realistas.
- **sqlite3**: Utilizada para interagir com o banco de dados SQLite, permitindo a inserção dos dados gerados nas tabelas correspondentes.

O ambiente será configurado de forma a garantir a reprodutibilidade do processo de geração de dados, permitindo que os dados sejam gerados novamente, caso seja necessário aumentar o volume de dados ou gerar novos dados para testes.

### Justificativa dos Parâmetros de Geração de Dados

A geração de dados sintéticos foi configurada com os seguintes parâmetros principais, definidos para simular um cenário realista de e-commerce:

- `customerBase`: Define o número inicial de clientes no primeiro ano. O valor de 1500 foi escolhido para representar uma base de clientes inicial razoável para um e-commerce em crescimento.
- `customerGrowthRate`: Representa a taxa de crescimento anual da base de clientes. O valor de 0.2 (20%) foi definido para simular um crescimento consistente ao longo dos anos.
- `salesCustomerYear`: Define o número inicial de vendas por cliente por ano. O valor de 3 foi escolhido para representar uma frequência de compra moderada.
- `salesGrowthRate`: Representa a taxa de crescimento anual das vendas. O valor de 0.25 (25%) foi definido para simular um aumento nas vendas ao longo dos anos.

Os valores aleatórios utilizados na geração de dados, como preços de produtos, quantidades e datas de vendas, foram definidos dentro de intervalos realistas para simular a variação natural de um e-commerce. A lógica por trás desses intervalos é garantir que os dados sintéticos representem uma distribuição e padrões semelhantes aos de dados reais, permitindo análises e modelagens confiáveis.

### Descrição das Funções de Geração de Dados

As seguintes funções foram implementadas para gerar os dados sintéticos:

- `generateCustomer(customerBase, customerGrowthRate, numYears)`: Gera dados de clientes ao longo de vários anos, aplicando uma taxa de crescimento anual. Cria um dicionário com informações detalhadas de cada cliente, como ID, endereço e dados pessoais.
- `generateSales(numYears, salesCustomerYear, salesGrowthRate, categoriesDict, customerInfo)`: Gera dados de vendas simulados, incluindo informações sobre pedidos e itens de pedidos. Utiliza o dicionário de categorias e informações de clientes para criar transações realistas.
- `generateCategories(categoriesDict)`: Gera dados para a tabela de categorias, utilizando um dicionário de categorias e produtos. Atribui IDs únicos a cada categoria.

### Considerações Finais

A qualidade dos dados sintéticos é crucial para a relevância das análises subsequentes. Dados que representam com precisão a distribuição e os padrões dos dados reais garantem que os modelos de machine learning e as análises exploratórias forneçam insights confiáveis.

Para alcançar essa representação, utilizamos a biblioteca Faker, que permite gerar dados fictícios com características realistas. Além disso, ajustamos os parâmetros de geração de dados para simular a distribuição de variáveis importantes, como preços de produtos e frequência de compras. A consistência entre as tabelas foi mantida através da geração de chaves primárias e estrangeiras, garantindo a integridade do banco de dados.

Este processo de geração de dados sintéticos pode ser repetido e ajustado conforme necessário, permitindo a criação de conjuntos de dados maiores ou a simulação de cenários específicos para testes adicionais.
