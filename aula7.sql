DROP DATABASE IF EXISTS aprendendoleft;
CREATE DATABASE aprendendoleft;

USE aprendendoleft;

DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS professores;

CREATE TABLE classes(
    id_classe INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_classe VARCHAR(100) NOT NULL,
    descricao TEXT,
    ano VARCHAR(4) NOT NULL
);

CREATE TABLE alunos(
    id_aluno INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    documento VARCHAR(20) NOT NULL,
    id_classe INTEGER,
    FOREIGN KEY (id_classe) REFERENCES classes(id_classe)
);

CREATE TABLE professores(
    id_professor INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    documento VARCHAR(20) NOT NULL,
    id_classe INTEGER,
    FOREIGN KEY (id_classe) REFERENCES classes(id_classe)
);

INSERT INTO classes(nome_classe, descricao, ano) VALUES
('A', 'turma que entrou no inicio do ano', '2021'),
('B', 'turma que entrou no meio do ano', '2021');

INSERT INTO alunos (nome, sobrenome, documento, id_classe) VALUES
('Brunno',      'de Souza Oliveira','XX.XXX.XXX.X', 2),
('Bryan',       'Sobrenome do Bryan','XX.XXX.XXX.X',2),
('Leandro',     'Sobrenome do Leandro','XX.XXX.XXX.X',2),
('Luan',        'Sobrenome do Luan','XX.XXX.XXX.X',1),
('Aryon',       'Sobrenome do Aryon','XX.XXX.XXX.X',2),
('Douglas',     'Sobrenome do Douglas','XX.XXX.XXX.X',1),
('Lucas',       'Sobrenome do Lucas','XX.XXX.XXX.X',2),
('Raphael',     'Sobrenome do Raphael','XX.XXX.XXX.X',1),
('Leticia',     'Sobrenome do Leticia','XX.XXX.XXX.X',1),
('Pedro',       'Sobrenome do Pedro','XX.XXX.XXX.X',1),
('Guilherme',   'Sobrenome do Guilherme','XX.XXX.XXX.X',2);

INSERT INTO alunos (nome, sobrenome, documento) VALUES
('Ernani',      'Sobrenome do Ernani','XX.XXX.XXX.X');

SELECT 'ALUNOS - INNER JOIN' AS 'LOG';
SELECT
    alunos.nome
FROM
    alunos
INNER JOIN
    classes ON alunos.id_classe = classes.id_classe;

SELECT 'ALUNOS - LEFT JOIN' AS 'LOG';
SELECT
    alunos.nome
FROM
    alunos
LEFT JOIN
    classes ON alunos.id_classe = classes.id_classe;


SELECT 'CLASSE - LEFT JOIN' AS 'LOG';
SELECT
    alunos.nome
FROM
    classes
LEFT JOIN
    alunos ON alunos.id_classe = classes.id_classe;


SELECT 'CLASSE - RIGHT JOIN' AS 'LOG';
SELECT
    alunos.nome
FROM
    classes
RIGHT JOIN
    alunos ON alunos.id_classe = classes.id_classe;



INSERT INTO professores(nome, sobrenome, documento, id_classe) VALUES
('Professor A', 'Sobrenome Professor A', 'XX.XXX.XXX-XX',1),
('Professor B', 'Sobrenome Professor B', 'XX.XXX.XXX-XX',2),
('Professor C', 'Sobrenome Professor C', 'XX.XXX.XXX-XX',2),
('Professor D', 'Sobrenome Professor D', 'XX.XXX.XXX-XX',1),
('Professor E', 'Sobrenome Professor E', 'XX.XXX.XXX-XX',2),
('Professor F', 'Sobrenome Professor F', 'XX.XXX.XXX-XX',1);


INSERT INTO professores(nome, sobrenome, documento) VALUES
('Professor G', 'Sobrenome Professor G', 'XX.XXX.XXX-XX');

/*left right inner professores X classe (prof sempre na esquerda)
left right inner professores X classe (prof sempre na direita)*/

SELECT 'PROFESSORES - INNER JOIN' AS 'LOG';
SELECT
    professores.nome
FROM
    professores
INNER JOIN
    classes ON professores.id_classe = classes.id_classe;

SELECT 'PROFESSORES - LEFT JOIN' AS 'LOG';
SELECT
    professores.nome
FROM
    professores
LEFT JOIN
    classes ON professores.id_classe = classes.id_classe;


SELECT 'PROFESSORES - RIGHT JOIN' AS 'LOG';
SELECT
    professores.nome
FROM
    professores
LEFT JOIN
    classes ON professores.id_classe = classes.id_classe;


SELECT 'CLASSES - INNER JOIN' AS 'LOG';
SELECT
    professores.nome
FROM
    classes
INNER JOIN
    professores ON professores.id_classe = classes.id_classe;


SELECT 'CLASSES - LEFT JOIN' AS 'LOG';
SELECT
    professores.nome
FROM
    classes
LEFT JOIN
    professores ON professores.id_classe = classes.id_classe;


SELECT 'CLASSES - RIGHT JOIN' AS 'LOG';
SELECT
    professores.nome
FROM
    classes
RIGHT JOIN
    professores ON professores.id_classe = classes.id_classe;