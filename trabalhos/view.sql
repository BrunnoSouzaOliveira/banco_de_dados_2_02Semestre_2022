--Faça a criação de uma tabela com o nome país. Essa tabela deve contar id_pais (primary key e auto_increment) e nome. 
--Faça uma tabela com o nome cidade. Essa tabela deve contar id_cidade (auto_increment primary key), nome (varchar), id_pais (forekey id_pais). 
--Registre quatro países diferentes. Registre 3 cidades para cada país. Faça uma view que trás todos os países e cidades.

DROP DATABASE IF EXISTS view_trabalho;
CREATE DATABASE view_trabalho;

USE view_trabalho;

CREATE TABLE pais(
    id_pais INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome_pais VARCHAR(255)
);

CREATE TABLE cidade(
    id_cidade INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome_cidade VARCHAR(255),
    id_pais_cidade INTEGER,
    FOREIGN KEY (id_pais_cidade) REFERENCES pais(id_pais)
);

INSERT INTO pais
    (nome_pais)
VALUES
    ("Brazil"),
    ("EUA"),
    ("Canada"),
    ("Mexico");

INSERT INTO cidade
    (nome_cidade, id_pais_cidade)
VALUES
    ("Cornelio Procopio",1),
    ("Vancouver",3),
    ("Perola",1),
    ("San Francisco",2),
    ("Montreal",3),
    ("Cancun",4),
    ("Maringa",1),
    ("Boston",2),
    ("Cidade do Mexico",4),
    ("New York",2),
    ("Toronto",3),
    ("Guadalarajara",4);


CREATE 
    VIEW select_everything
as (
    SELECT
        *
    FROM
        pais
    INNER JOIN
        cidade ON cidade.id_pais_cidade = pais.id_pais
);

SELECT * FROM select_everything;