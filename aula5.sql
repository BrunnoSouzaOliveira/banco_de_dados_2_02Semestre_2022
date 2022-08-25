CREATE DATABASE IF NOT EXISTS aprenderJoin CHARACTER SET utf8mb4;
USE aprenderJoin;

DROP TABLE IF EXISTS restaurantes;
DROP TABLE IF EXISTS cidade;
DROP TABLE IF EXISTS estado;

CREATE TABLE estado (
    id_estado INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    regiao ENUM('Sul','Sudeste','Centro-oeste','Nordeste','Norte')
);

CREATE TABLE cidade (
    id_cidade INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    id_estado INTEGER NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES estado (id_estado)
);

INSERT INTO
    estado(nome, regiao)
VALUES
    ('Parana','Sul'),
    ('Sao Paulo','Sudeste'),
    ('Rio de Janeiro','Sudeste'),
    ('Bahia','Nordeste'),
    ('Pernambuco','Nordeste'),
    ('Para','Norte'),
    ('Mato Grosso','Centro-oeste');

SET @idParana:=(SELECT id_estado FROM estado WHERE estado.nome = "Parana");
SET @idSaoPaulo:=(SELECT id_estado FROM estado WHERE estado.nome = "Sao Paulo");
SET @idRioJaneiro:=(SELECT id_estado FROM estado WHERE estado.nome = "Rio de Janeiro");
SET @idBahia:=(SELECT id_estado FROM estado WHERE estado.nome = "Bahia");
SET @idPernambuco:=(SELECT id_estado FROM estado WHERE estado.nome = "Pernambuco");
SET @idPara:=(SELECT id_estado FROM estado WHERE estado.nome = "Para");
SET @idMatoGrosso:=(SELECT id_estado FROM estado WHERE estado.nome = "Mato Grosso");

INSERT INTO cidade (nome, id_estado) VALUES ('Curitiba', @idParana);
INSERT INTO cidade (nome, id_estado) VALUES ('Feira de Santana', @idBahia);
INSERT INTO cidade (nome, id_estado) VALUES ('Cuiaba', @idMatoGrosso);
INSERT INTO cidade (nome, id_estado) VALUES ('Sorocabas', @idSaoPaulo);
INSERT INTO cidade (nome, id_estado) VALUES ('Mage', @idRioJaneiro);
INSERT INTO cidade (nome, id_estado) VALUES ('Recife', @idPernambuco);
INSERT INTO cidade (nome, id_estado) VALUES ('Castanhal', @idPara);
INSERT INTO cidade (nome, id_estado) VALUES ('Cornelio Procopio', @idParana);
INSERT INTO cidade (nome, id_estado) VALUES ('Sao Paulo', @idSaoPaulo);
INSERT INTO cidade (nome, id_estado) VALUES ('Sorriso', @idMatoGrosso);
INSERT INTO cidade (nome, id_estado) VALUES ('Rio de Janeiro', @idRioJaneiro);
INSERT INTO cidade (nome, id_estado) VALUES ('Niteroi', @idRioJaneiro);
INSERT INTO cidade (nome, id_estado) VALUES ('Olinda', @idPernambuco);
INSERT INTO cidade (nome, id_estado) VALUES ('Salvador', @idBahia);
INSERT INTO cidade (nome, id_estado) VALUES ('Belem', @idPara);
INSERT INTO cidade (nome, id_estado) VALUES ('Petropolis', @idRioJaneiro);

SELECT * FROM cidade;

SELECT
    *
FROM
    cidade
INNER JOIN
    estado ON cidade.id_estado = estado.id_estado
WHERE 
    cidade.nome = 'Petropoles';


CREATE TABLE IF NOT EXISTS restaurantes(
    id_restaurante INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    descricao VARCHAR(255),
    id_cidade INTEGER,
    FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade)
);

SET @idCuritibaCidade := (SELECT cidade.id_cidade FROM cidade WHERE cidade.nome = 'Curitiba');
SET @idSaoPauloCidade := (SELECT cidade.id_cidade FROM cidade WHERE cidade.nome = 'Sao Paulo');
SET @idPetropolisCidade := (SELECT cidade.id_cidade FROM cidade WHERE cidade.nome = 'Petropolis');
SET @idRioJaneiroCidade := (SELECT cidade.id_cidade FROM cidade WHERE cidade.nome = 'Rio de Janeiro');
SET @idCastanhalCidade := (SELECT cidade.id_cidade FROM cidade WHERE cidade.nome = 'Castanhal');

INSERT INTO restaurantes (nome, descricao, id_cidade) VALUES
    ('Galeto 183','Bar tradicional da boemia carioca com grandes porcoes de carne grelhada acompanhadas de farofa e feijao',@idRioJaneiroCidade),
    ('Fogo de Chao Jardins','Sofisticada rede brasileira de rodizio de carnes servidas a mesa e variado buffet de saladas',@idSaoPauloCidade),
    ('Churrascaria Majorica','Cardapio de carnes, aves e peixes grelhados, mais pratos europeus, em restaurante tradicional fundado em 1961',@idPetropolisCidade),
    ('Cantina do Delio','Restaurante italiano que serve criacoes inovadoras de chefs em um espaco descontraido com decoracao vintage',@idCuritibaCidade),
    ('Churrascaria Boi Bravo','Rodizio de carnes grelhadas e pizzas, alem de buffet variado, em espaço rustico e relaxado com playground.',@idCastanhalCidade);

SELECT 'Restaurante antes' as 'INFO';
SELECT
    *
FROM
    restaurantes
INNER JOIN
    cidade ON cidade.id_cidade = restaurantes.id_cidade
WHERE 
    restaurantes.nome = 'Galeto 183';

SELECT 'Cidade antes' as 'INFO';
SELECT
    *
FROM
    cidade
INNER JOIN
    restaurantes ON cidade.id_cidade = restaurantes.id_cidade
WHERE 
    restaurantes.nome = 'Fogo de Chao Jardins';

SELECT 'Informacoes definidas' as 'INFO';
SELECT
    cidade.nome as nome_da_cidade,
    restaurantes.nome as nome_do_restaurante,
    restaurantes.descricao as descricao_do_restaurante
FROM
    cidade
INNER JOIN
    restaurantes
        ON restaurantes.id_cidade = cidade.id_cidade
WHERE
    restaurantes.nome = 'Cantina do Delio';

SELECT 'Uso do LIKE' as 'INFO';
SELECT
    cidade.nome as nome_da_cidade,
    restaurantes.nome as nome_do_restaurante,
    restaurantes.descricao as descricao_do_restaurante
FROM
    cidade
INNER JOIN
    restaurantes
        ON restaurantes.id_cidade = cidade.id_cidade
WHERE
    restaurantes.nome LIKE '%m%';

SELECT 'Transformando em uma tabela' as 'INFO';
SELECT
    t1.nome_da_cidade,
    t1.nome_do_restaurante
FROM
(
    SELECT
        cidade.nome as nome_da_cidade,
        restaurantes.nome as nome_do_restaurante,
        restaurantes.descricao as descricao_do_restaurante
    FROM
        cidade
    INNER JOIN
        restaurantes
            ON restaurantes.id_cidade = cidade.id_cidade
    WHERE
        restaurantes.nome LIKE '%m%'
) as t1

WHERE
    t1.nome_da_cidade = 'Petropolis'
;


SELECT 'com mais de um INNER JOIN' as 'INFO';

SELECT
    cidade.nome as nome_da_cidade,
    estado.nome as nome_do_estado,
    restaurantes.nome as nome_do_restaurante
FROM 
    restaurantes
INNER JOIN
    cidade
        ON restaurantes.id_cidade = cidade.id_cidade
INNER JOIN
    estado
        ON cidade.id_estado = estado.id_estado
WHERE
    restaurantes.nome LIKE "Churrascaria B%";