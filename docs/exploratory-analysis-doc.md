# Data Science E-commerce Project

## Análise Exploratória e Qualidade de Dados

### Introdução

A fase de **Análise Exploratória de Dados (EDA)** é um pilar essencial em qualquer projeto de ciência de dados. É nela que mergulhamos na estrutura, nos padrões e nas particularidades do conjunto de dados. Essa etapa é crucial para **validar a qualidade dos dados coletados** e para **identificar tendências, correlações, outliers e possíveis inconsistências**, estabelecendo uma base sólida antes de aplicar modelos preditivos ou realizar análises mais aprofundadas.

Neste projeto de e-commerce simulado, a EDA foi conduzida utilizando **dados sintéticos** armazenados em um banco de dados SQLite. O objetivo inicial foi obter uma visão geral do comportamento de clientes, produtos e vendas, além de **validar a consistência e a integridade das informações** entre as diferentes tabelas.

### Ferramentas Utilizadas

A análise exploratória foi desenvolvida em **Python**, aproveitando o poder das seguintes bibliotecas:

* **pandas**: Essencial para a **manipulação e organização de dados** em formato tabular, facilitando a limpeza e a preparação.
* **numpy**: Oferece suporte para **operações numéricas vetorizadas**, otimizando cálculos e transformações de dados.
* **sqlite3**: Permite a **conexão direta com o banco de dados SQLite**, onde os dados do e-commerce estão armazenados.
* **dash** e **dash\_table**: Utilizadas para a **criação de uma interface web interativa**, tornando a visualização de tabelas e métricas dinâmicas e acessíveis.
* **plotly.express**: Escolhida para a **geração de gráficos interativos**, o que facilita a identificação de padrões, tendências e anomalias nos dados.
* **matplotlib**: Complementa as visualizações gráficas, oferecendo controle detalhado sobre os gráficos estáticos.
* **io** e **base64**: Ferramentas auxiliares para a **conversão de figuras Matplotlib em formato base64**, permitindo sua incorporação e exibição direta em HTML dentro do aplicativo Dash.

### Visão Geral e Qualidade dos Dados

Para uma compreensão abrangente dos dados, as consultas SQL foram estruturadas em um dicionário Python, permitindo o carregamento eficiente de diversos subconjuntos de dados. Além das visualizações iniciais, implementamos um conjunto robusto de verificações de qualidade de dados:

#### Consultas e Estrutura

* **Tabelas principais**: `customers`, `orders`, `products`, `categories`, `order_items` foram exploradas para entender sua estrutura e tipos de dados.
* **Métricas agregadas**: Incluímos contagens (total de produtos, total de categorias) e médias (média de vendas) para uma visão macro.
* **Análises específicas**: Detalhamos o número de produtos por categoria e identificamos os top 10 clientes por valor total de compras, fornecendo insights iniciais sobre a distribuição e o desempenho.

#### Relatórios de Qualidade de Dados

Para cada DataFrame, foram gerados relatórios detalhados que avaliam:

* **Valores Ausentes**: Identificação e contagem de células vazias em cada coluna, com porcentagens para indicar a severidade.
* **Linhas Duplicadas**: Verificação de linhas completamente duplicadas e, mais crucialmente, duplicatas baseadas em **IDs únicos** (como `customer_id` ou `order_id`), que podem indicar inconsistências graves.
* **Outliers (Método IQR)**: Análise básica de **outliers** em colunas numéricas (e.g., `order_value`, `price`, `quantity`) utilizando o Intervalo Interquartil (IQR), que ajuda a identificar valores atípicos que podem distorcer a análise.

#### Identificação de Inconsistências

Expandimos a análise para detectar inconsistências lógicas e de integridade referencial:

* **Produtos sem Categoria Válida**: Verificamos se todos os produtos estão associados a uma categoria existente, revelando dados "órfãos".
* **Pedidos com Cliente Inválido/Inexistente**: Checamos se todos os pedidos estão vinculados a um cliente registrado, garantindo a integridade dos relacionamentos.

### Visualizações Gráficas para Tendências e Correlações

Para ir além da visão estática, utilizamos **Plotly Express** para criar gráficos interativos que facilitam a descoberta de tendências e correlações, além de auxiliar na visualização de outliers:

1. **Quantidade de Produtos por Categoria**: Um gráfico de barras que ilustra a diversidade de itens no e-commerce, destacando a distribuição de produtos entre as categorias.
1. **Top 10 Clientes por Valor Total de Compras**: Um gráfico de barras que mostra os clientes mais valiosos, indicando padrões de consumo e potenciais clientes VIP.
1. **Tendência de Vendas Mensais**: Um **gráfico de linha** que revela a evolução do total de vendas ao longo do tempo, essencial para identificar padrões sazonais ou de crescimento.
1. **Top 10 Produtos Mais Vendidos (por Quantidade)**: Um gráfico de barras que destaca os produtos com maior volume de vendas, fornecendo insights sobre a popularidade dos itens.
1. **Correlação: Valor do Pedido vs. Número de Itens**: Um **gráfico de dispersão** que ajuda a visualizar a relação entre o valor de um pedido e a quantidade de itens incluídos, útil para identificar padrões de compra ou possíveis outliers em pedidos.

### Interface Interativa com Dash

A aplicação Dash desenvolvida serve como um painel de controle interativo para a EDA:

* **Tabelas Interativas (`DataTable`)**: Exibe amostras das tabelas principais, permitindo uma inspeção rápida dos dados brutos.
* **Relatórios de Qualidade de Dados**: Apresenta de forma organizada os resultados das verificações de valores ausentes, duplicados e outliers, oferecendo um panorama rápido da integridade dos dados.
* **Visualizações Gráficas**: Integra todos os gráficos gerados com Plotly Express, proporcionando uma experiência interativa e rica em detalhes para a análise de tendências e correlações.

Essa abordagem não apenas favorece a análise técnica aprofundada, mas também facilita a comunicação dos insights com stakeholders, tornando a compreensão dos dados mais acessível e dinâmica.

### Considerações Finais

A fase de Análise Exploratória de Dados foi fundamental para consolidar o entendimento dos dados sintéticos de e-commerce. As melhorias implementadas no script permitiram não apenas uma visão geral das informações, mas também uma **validação rigorosa da qualidade dos dados**, identificando potenciais inconsistências, outliers e padrões importantes.

A análise confirmou que os dados possuem boa integridade e representam fielmente os comportamentos esperados em um cenário de e-commerce. A estrutura das tabelas, as métricas obtidas, os relatórios de qualidade e os gráficos gerados demonstram consistência e variabilidade, fornecendo uma base sólida para as etapas subsequentes do projeto.

A criação de uma interface interativa com Dash eleva a capacidade de exploração e de compartilhamento dos resultados, tornando a análise mais transparente e colaborativa.