DROP DATABASE IF EXISTS aula1B2;
CREATE DATABASE aula1B2;

USE aula1B2;

DROP TABLE IF EXISTS editora;

CREATE TABLE editora(
    editora_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

INSERT INTO
    editora(nome,endereco)
VALUES
    ('Abril', 'Rua Abcd 111'),
    ('Madras', 'Rua Dcb 222'),
    ('Globo', 'Rua Xsg 222');

SELECT * FROM editora;
SHOW INDEX FROM editora;
EXPLAIN SELECT * FROM editora WHERE nome = 'Globo';
CREATE INDEX idx_editora ON editora(nome);
SHOW INDEX FROM editora;
EXPLAIN SELECT * FROM editora WHERE nome = 'Globo';