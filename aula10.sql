DROP DATABASE IF EXISTS exercicio_10;
CREATE DATABASE exercicio_10;

use exercicio_10;

DROP TABLE IF EXISTS comp_vend_carro;
DROP TABLE IF EXISTS carros;
DROP TABLE IF EXISTS vendedores;
DROP TABLE IF EXISTS compradores;
DROP VIEW IF EXISTS transacoes;

CREATE TABLE carros(
    id_carro INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_carro VARCHAR(255) NOT NULL,
    modelo VARCHAR(255) NOT NULL,
    ano VARCHAR(4)
);

INSERT INTO carros(nome_carro,modelo,ano)VALUES
('Chevette','Chevrolet',1995),
('Gol','Volkswagen',2010),
('Onix','Chevrolet',2020);

CREATE TABLE vendedores(
    id_vendedor INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_vendedor VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    cpf VARCHAR(15) NOT NULL
);

INSERT INTO vendedores(nome_vendedor,sobrenome,cpf) VALUES
('Jose','Silva','124.531.642-65'),
('Fabio','Lima','097.325.825-23');

CREATE TABLE compradores(
    id_comprador INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_comprador VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    cpf VARCHAR(15) NOT NULL
);

INSERT INTO compradores(nome_comprador,sobrenome,cpf) VALUES
('Odair','Silveira','298.658.973-92');

CREATE TABLE comp_vend_carro(
    id_comp_vend_carro INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_comprador INTEGER NOT NULL,
    id_vendedor INTEGER NOT NULL,
    id_carro INTEGER NOT NULL,
    FOREIGN KEY (id_comprador) REFERENCES compradores(id_comprador),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor),
    FOREIGN KEY (id_carro) REFERENCES carros(id_carro)
);

INSERT INTO comp_vend_carro(id_comprador,id_vendedor,id_carro) VALUES
(1,1,3),
(1,2,1),
(1,1,2);

CREATE 
    VIEW transacoes
as (SELECT
        carros.nome_carro,
        carros.modelo,
        carros.ano,
        vendedores.nome_vendedor,
        compradores.nome_comprador
    FROM
        carros,
        vendedores,
        compradores
    WHERE
        carros.id_carro IN (
            SELECT
                comp_vend_carro.id_carro
            FROM
                comp_vend_carro
            WHERE
                comp_vend_carro.id_vendedor = vendedores.id_vendedor AND comp_vend_carro.id_comprador = compradores.id_comprador
        )
    );

SELECT * FROM transacoes;

SELECT
    carros.nome_carro,
    carros.ano,
    vendedores.nome_vendedor,
    compradores.nome_comprador
FROM
    carros
INNER JOIN
    comp_vend_carro ON carros.id_carro = comp_vend_carro.id_carro
INNER JOIN
    vendedores ON vendedores.id_vendedor = comp_vend_carro.id_vendedor
INNER JOIN
    compradores ON compradores.id_comprador = comp_vend_carro.id_comprador;

CREATE
    VIEW tudo_com_apelido
as (
    SELECT
        compradores.nome_comprador  as comprador,
        compradores.sobrenome       as sobrenome_comprador,
        compradores.cpf             as cpf_comprador,
        vendedores.nome_vendedor    as vendedor,
        vendedores.sobrenome        as sobrenome_vendedor,
        vendedores.cpf              as cpf_vendedor,
        carros.nome_carro           as carro,
        carros.modelo               as modelo_carro,
        carros.ano                  as ano_carro
    FROM
        carros
    INNER JOIN
        comp_vend_carro ON carros.id_carro = comp_vend_carro.id_carro
    INNER JOIN
        vendedores ON vendedores.id_vendedor = comp_vend_carro.id_vendedor
    INNER JOIN
        compradores ON compradores.id_comprador = comp_vend_carro.id_comprador
    );

    SELECT * FROM tudo_com_apelido;