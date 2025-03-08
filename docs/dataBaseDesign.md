# Modelo de Banco de Dados para Sistema de Pedidos

Este documento descreve a modelagem do banco de dados para um sistema de pedidos, incluindo as tabelas, atributos e relacionamentos.

## Diagrama ER

![Diagrama ER](/img/diagramaER.jpg)

## Tabelas

### Customer (Cliente)

| Atributo       | Tipo de Dado | Chave Primária | Chave Estrangeira | Descrição                                  |
|----------------|--------------|----------------|-------------------|--------------------------------------------|
| Customer_ID    | Numérico     | Sim            | Não               | Identificador único do cliente             |
| Name           | Texto        | Não            | Não               | Nome completo do cliente                   |
| Email          | Texto        | Não            | Não               | Endereço de e-mail do cliente              |
| Address        | Texto        | Não            | Não               | Endereço físico do cliente                  |
| Birth_Day      | Data         | Não            | Não               | Data de nascimento do cliente              |
| State          | Texto        | Não            | Não               | Estado onde o cliente reside                |

### Order (Pedido)

| Atributo       | Tipo de Dado | Chave Primária | Chave Estrangeira | Descrição                                  |
|----------------|--------------|----------------|-------------------|--------------------------------------------|
| Order_ID       | Numérico     | Sim            | Não               | Identificador único do pedido              |
| Order_date     | Data/Hora    | Não            | Não               | Data e hora em que o pedido foi feito      |
| Order_Value    | Decimal      | Não            | Não               | Valor total do pedido                      |
| Customer_ID    | Numérico     | Não            | Sim               | ID do cliente que fez o pedido (FK)        |

### Products (Produtos)

| Atributo       | Tipo de Dado | Chave Primária | Chave Estrangeira | Descrição                                  |
|----------------|--------------|----------------|-------------------|--------------------------------------------|
| Product_ID     | Numérico     | Sim            | Não               | Identificador único do produto             |
| Product_name   | Texto        | Não            | Não               | Nome do produto                            |
| Category_ID    | Numérico     | Não            | Sim               | ID da categoria do produto (FK)           |
| Unit_Price          | Decimal      | Não            | Não               | Preço unitário do produto                  |
| Quantity       | Numérico     | Não            | Não               | Quantidade em estoque do produto           |

### Categories (Categorias)

| Atributo       | Tipo de Dado | Chave Primária | Chave Estrangeira | Descrição                                  |
|----------------|--------------|----------------|-------------------|--------------------------------------------|
| Category_ID    | Numérico     | Sim            | Não               | Identificador único da categoria           |
| Category_name  | Texto        | Não            | Não               | Nome da categoria                          |

### Order_Items (Itens do Pedido)

| Atributo       | Tipo de Dado | Chave Primária | Chave Estrangeira | Descrição                                  |
|----------------|--------------|----------------|-------------------|--------------------------------------------|
| ID             | Numérico     | Sim            | Não               | Identificador único do item do pedido      |
| Order_ID       | Numérico     | Não            | Sim               | ID do pedido ao qual o item pertence (FK)  |
| Product_ID     | Numérico     | Não            | Sim               | ID do produto do item (FK)                |
| Order_Quantity | Numérico     | Não            | Não               | Quantidade do produto no pedido            |
| Unit_Price     | Decimal      | Não            | Não               | Preço unitário do produto no pedido        |

## Relacionamentos

* **Customer para Order:** Um cliente pode ter muitos pedidos.
* **Order para Order Items:** Um pedido pode ter muitos itens.
* **Products para Order Items:** Um produto pode aparecer em muitos itens de pedido.
* **Categories para Products:** Uma categoria pode ter muitos produtos.

## Observações

* Os tipos de dados podem variar dependendo do sistema de gerenciamento de banco de dados (SGBD) utilizado.
* As chaves estrangeiras (FK) garantem a integridade referencial entre as tabelas.
