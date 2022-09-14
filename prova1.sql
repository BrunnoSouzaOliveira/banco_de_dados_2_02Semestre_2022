DROP DATABASE IF EXISTS registro_estoque;
CREATE DATABASE registro_estoque;

USE registro_estoque;

DROP TABLE IF EXISTS clientes_produtos;
DROP TABLE IF EXISTS usuarios_produtos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS empresa;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS cargos;

CREATE TABLE cargos(
    id_cargos INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(25) NOT NULL
);

CREATE TABLE usuarios(
    id_usuarios INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    cargo_usuario INTEGER NOT NULL,
    FOREIGN KEY (cargo_usuario) REFERENCES cargos(id_cargos)
);

CREATE TABLE empresa(
    id_empresa INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_empresa VARCHAR(255) NOT NULL
);

CREATE TABLE produtos(
    id_produto INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(255) NOT NULL,
    preco_de_compra FLOAT NOT NULL,
    preco_de_venda FLOAT NOT NULL,
    quantidade INTEGER(3) NOT NULL,
    id_empresa_prod INTEGER NOT NULL,
    FOREIGN KEY (id_empresa_prod) REFERENCES empresa(id_empresa)
);

CREATE TABLE clientes(
    id_clientes INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(12)
);

CREATE TABLE usuarios_produtos(
    id_usuarios INTEGER NOT NULL,
    id_produtos INTEGER NOT NULL,
    FOREIGN KEY (id_usuarios) REFERENCES usuarios(id_usuarios),
    FOREIGN KEY (id_produtos) REFERENCES produtos(id_produto)
);

CREATE TABLE clientes_produtos(
    id_clientes INTEGER NOT NULL,
    id_produtos INTEGER NOT NULL,
    FOREIGN KEY (id_clientes) REFERENCES clientes(id_clientes),
    FOREIGN KEY (id_produtos) REFERENCES produtos(id_produto)
);

INSERT INTO cargos(nome) VALUES
("secretario"),
("vendedor"),
("gerente"),
("diretor");

INSERT INTO usuarios(nome,endereco,cargo_usuario) VALUES
("Marcio","Rua Vargas Faria",2),
("Luciana","Avenida Brasil",4),
("Pedro","Rua Damasina Macedo",3),
("Diana","Rua Labares",1),
("Carlos","Avenida Barão",2);

INSERT INTO empresa(nome_empresa) VALUES
("Apple"),
("Samsung"),
("Microsoft");

INSERT INTO produtos(nome_produto, preco_de_compra, preco_de_venda, quantidade, id_empresa_prod) VALUES
("iPod",1499,1799,58,1),
("Xbox 360",400,599,154,3),
("Galaxy A52S 5G",3499,7699,658,2),
("Computado",3692,4450,250,3),
("iPad",9000,15000,526,1),
("Smart TV Samsung",2640,4699,355,2);

INSERT INTO clientes(nome, cpf, endereco,telefone) VALUES
("Camila","29741865153","Rua Mantina","913465462457"),
("Rodrigo","75184344361","Avenida Tiradentes","95125725415");

INSERT INTO usuarios_produtos(id_usuarios,id_produtos) VALUES
(2,4),
(1,2),
(5,6),
(3,3),
(1,1);

INSERT INTO clientes_produtos(id_clientes,id_produtos) VALUES
(1,2),
(1,3),
(2,5),
(2,1),
(1,6);

/*
Com subselect, monte query traz o nome do cliente, a empresa do cliente, o nome do produto que o cliente consume, o telefone do cliente e a quantidade do produto em estoque
Trazer para um conjunto de clientes (veja in) pelo nome.
Deve haver um limit de 3 registros.
*/
SELECT 'Exercicio 1' AS 'Prova de Banco de Dados';

SELECT
    clientes.nome,
    produtos.id_empresa_prod,
    produtos.nome_produto,
    clientes.telefone,
    produtos.quantidade
FROM
    clientes,
    produtos
WHERE
    clientes.id_clientes IN (
        SELECT
            clientes_produtos.id_clientes
        FROM
            clientes_produtos
        WHERE
            clientes_produtos.id_produtos = produtos.id_produto
    )
limit 3;

/*
Com subselect, monte query traz o nome do cliente, a empresa do cliente, o nome do produto que o cliente consume, o telefone do cliente e a quantidade do produto em estoque -
trazer para um conjunto de clientes (veja in) pelo nome.
Deve haver uma ordenação orientada pela quantidade de produtos sendo essa descendente.
*/

SELECT 'Exercicio 2' AS 'Prova de Banco de Dados';

SELECT
    clientes.nome,
    produtos.id_empresa_prod,
    produtos.nome_produto,
    clientes.telefone,
    produtos.quantidade
FROM
    clientes,
    produtos
WHERE
    clientes.id_clientes IN (
        SELECT
            clientes_produtos.id_clientes
        FROM
            clientes_produtos
        WHERE
            clientes_produtos.id_produtos = produtos.id_produto
    )
ORDER BY produtos.quantidade DESC;

/*
Com inner join, monte query traz o nome do cliente, a empresa do cliente, o nome do produto que o cliente consume, o telefone do cliente e a quantidade do produto em estoque -
trazer para um conjunto de clientes (veja in) pelo nome.
Deve haver uma ordenação orientada pelo preço de compra (do maior para o menor).
*/

SELECT 'Exercicio 3' AS 'Prova de Banco de Dados';

SELECT
    clientes.nome,
    produtos.id_empresa_prod,
    produtos.nome_produto,
    clientes.telefone,
    produtos.quantidade
FROM
    clientes
INNER JOIN
    clientes_produtos ON clientes_produtos.id_clientes = clientes.id_clientes
INNER JOIN
    produtos ON produtos.id_produto = clientes_produtos.id_produtos
ORDER BY produtos.preco_de_compra;

/*
Com left join, monte query traz o nome do cliente, a empresa do cliente, o nome do produto que o cliente consume, o telefone do cliente e a quantidade do produto em estoque -
trazer para um conjunto de clientes (veja in) pelo nome.
Deve haver uma ordenação orientada pelo preço de compra (do maior para o menor).
*/

SELECT 'Exercicio 4' AS 'Prova de Banco de Dados';

SELECT
    clientes.nome,
    produtos.id_empresa_prod,
    produtos.nome_produto,
    clientes.telefone,
    produtos.quantidade
FROM
    clientes
LEFT JOIN
    clientes_produtos ON clientes_produtos.id_clientes = clientes.id_clientes
LEFT JOIN
    produtos ON produtos.id_produto = clientes_produtos.id_produtos
ORDER BY produtos.preco_de_compra;