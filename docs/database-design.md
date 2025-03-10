# Documentação da Modelagem de Dados

## 1. Definição do Modelo de Dados

**Objetivo:**
Criar um modelo visual das tabelas, colunas e relacionamentos do banco de dados.

**Descrição:**
Utilizando o Miro, foi criado um diagrama detalhando as seguintes tabelas:

- **Customer:** Informações dos clientes.
- **Products:** Informações sobre os produtos.
- **Order:** Registro das vendas realizadas.
- **Categories:** Informações sobre as categorias dos produtos.
- **Order_Items:** Informações sobre itens do pedido.

**Relacionamentos:**

- **Customer para Order:** Um cliente pode ter muitos pedidos.
- **Order para Order Items:** Um pedido pode ter muitos itens.
- **Products para Order Items:** Um produto pode aparecer em muitos itens de pedido.
- **Categories para Products:** Uma categoria pode ter muitos produtos.

**Link para o Diagrama no Miro:**

**<https://miro.com/app/board/uXjVIUVfm9c=/>**

**Imagem do Diagrama:**
![Inserir imagem do diagrama criado no Miro](/img/modelo-conceitual.jpg)

## 2. Definição dos Tipos de Dados

**Objetivo:**
Especificar os tipos de dados para cada coluna das tabelas.

**Tabela de Tipos de Dados:**

***Customer*** (Cliente)

| Atributo       | Tipo de Dado | Chave Primária | Chave Estrangeira | Descrição                                  |
|----------------|--------------|----------------|-------------------|--------------------------------------------|
| Customer_ID    | Character    | Sim            | Não               | Identificador único do cliente             |
| Name           | Character    | Não            | Não               | Nome completo do cliente                   |
| Email          | Character    | Não            | Não               | Endereço de e-mail do cliente              |
| Address        | Character    | Não            | Não               | Endereço físico do cliente                 |
| Birth_Day      | Date         | Não            | Não               | Data de nascimento do cliente              |
| State          | Character    | Não            | Não               | Estado onde o cliente reside               |

***Order*** (Pedido)

| Atributo       | Tipo de Dado | Chave Primária | Chave Estrangeira | Descrição                                  |
|----------------|--------------|----------------|-------------------|--------------------------------------------|
| Order_ID       | Character    | Sim            | Não               | Identificador único do pedido              |
| Order_date     | Datetime     | Não            | Não               | Data e hora em que o pedido foi feito      |
| Order_Value    | Real         | Não            | Não               | Valor total do pedido                      |
| Customer_ID    | Character    | Não            | Sim               | ID do cliente que fez o pedido (FK)        |

***Products*** (Produtos)

| Atributo       | Tipo de Dado | Chave Primária | Chave Estrangeira | Descrição                                  |
|----------------|--------------|----------------|-------------------|--------------------------------------------|
| Product_ID     | Character    | Sim            | Não               | Identificador único do produto             |
| Product_name   | Character    | Não            | Não               | Nome do produto                            |
| Category_ID    | Character    | Não            | Sim               | ID da categoria do produto (FK)           |
| Unit_Price     | Real         | Não            | Não               | Preço unitário do produto                  |
| Quantity       | Integer      | Não            | Não               | Quantidade em estoque do produto           |

***Categories*** (Categorias)

| Atributo       | Tipo de Dado | Chave Primária | Chave Estrangeira | Descrição                                  |
|----------------|--------------|----------------|-------------------|--------------------------------------------|
| Category_ID    | Character    | Sim            | Não               | Identificador único da categoria           |
| Category_name  | Character    | Não            | Não               | Nome da categoria                          |

***Order_Items*** (Itens do Pedido)

| Atributo       | Tipo de Dado | Chave Primária | Chave Estrangeira | Descrição                                  |
|----------------|--------------|----------------|-------------------|--------------------------------------------|
| ID             | Character    | Sim            | Não               | Identificador único do item do pedido      |
| Order_ID       | Character    | Não            | Sim               | ID do pedido ao qual o item pertence (FK)  |
| Product_ID     | Character    | Não            | Sim               | ID do produto do item (FK)                |
| Order_Quantity | Integer      | Não            | Não               | Quantidade do produto no pedido            |
| Unit_Price     | Real         | Não            | Não               | Preço unitário do produto no pedido        |

## 3. Definição das Chaves Primárias e Estrangeiras

**Objetivo:**
Garantir a integridade do banco de dados definindo as chaves primárias e estrangeiras.

**Chaves Primárias:**

- **Customer:** Customer_ID
- **Products:** Product_ID
- **Order:** Order_ID
- **Categories:** Category_ID
- **Order_Items:** ID

**Chaves Estrangeiras:**

- **Products:** Category_ID (referencia Categories.Category_ID)
- **Order:** Customer_ID (referencia Customer.Customer_ID)
- **Order_Items:** Order_ID (referencia Order.Order_ID)
                    Product_ID (referencia Products.Product_ID)

## 4. Criação do Diagrama ER (Entidade-Relacionamento)

**Objetivo:**
Criar um diagrama visual que represente a estrutura do banco de dados e os relacionamentos entre as tabelas.

**Ferramenta Utilizada:**

![Miro](https://img.shields.io/badge/Miro-050038.svg?style=for-the-badge&logo=Miro&logoColor=yellow)

**Descrição:**
O diagrama ER mostra as tabelas como entidades e os relacionamentos entre elas.

**Imagem do Diagrama ER:**

![Inserir imagem do diagrama criado no Miro](/img/diagramaER.jpg)
