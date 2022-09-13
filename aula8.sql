DROP DATABASE IF EXISTS exercicios;
CREATE DATABASE exercicios;

USE exercicios;

DROP TABLE IF EXISTS tabelaB;
DROP TABLE IF EXISTS tabelaA;

CREATE TABLE tabelaB(
    id_b INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_b VARCHAR(255) NOT NULL
);

CREATE TABLE tabelaA(
    id_a INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_a VARCHAR(255) NOT NULL,
    id_b INTEGER,
    FOREIGN KEY (id_b) REFERENCES tabelaB(id_b)
);

INSERT INTO tabelaB (name_b) VALUES
('q'),('w'),('e'),('r'),('t'),('y'),('u');

INSERT INTO tabelaA (name_a,id_b) VALUES
('a',1),('s',4),('d',NULL),('f',5),('g',NULL),('h',NULL),('j',NULL),('k',7),('l',NULL);

SELECT 'Com LEFT OUTER JOIN' AS 'INFO';

SELECT
    tabelaB.id_b,
    tabelaB.name_b
FROM
    tabelaB
LEFT OUTER JOIN
    tabelaA ON tabelaA.id_b = tabelaB.id_b
WHERE
    tabelaA.id_b IS NULL;

SELECT 'Com SubSelect' AS 'INFO';

SELECT
    tabelaB.id_b,
    tabelaB.name_b
FROM
    tabelaB
WHERE tabelaB.id_b NOT IN (
    SELECT
        tabelaA.id_b
    FROM
        tabelaA
    INNER JOIN
        tabelaB ON tabelaA.id_b = tabelaB.id_b
);