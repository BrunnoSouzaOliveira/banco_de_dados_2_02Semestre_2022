DROP DATABASE IF EXISTS trabalho_4_semestre;
CREATE DATABASE trabalho_4_semestre;

USE trabalho_4_semestre;

DROP TABLE IF EXISTS ultimo_nome;
DROP TABLE IF EXISTS primeiro_nome;

CREATE TABLE primeiro_nome(
    id_pn INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    rg VARCHAR(255) NOT NULL
);

INSERT INTO primeiro_nome(nome, rg)
VALUES
("Marcio","63.452.408-3"),
("Luiza","52.352.285-4"),
("Joao","732.345.125-1"),
("Sarah","527.722.632-4");

CREATE TABLE ultimo_nome(
    id_un INTEGER PRIMARY KEY AUTO_INCREMENT,
    ultimo_nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    id_pn INTEGER,
    FOREIGN KEY (id_pn) REFERENCES primeiro_nome (id_pn)
);

INSERT INTO ultimo_nome(ultimo_nome, cpf,id_pn)
VALUES
("Souza","724.527.223-91",3),
("dos Santos","843.578.354-34",2),
("Pereira","784.357.835-09",1),
("Oliveira","837.993.282-95",4);

SELECT * FROM primeiro_nome;

SELECT * FROM ultimo_nome;

SELECT "BEFORE DELETE ROW OF ultimo_nome TABLE" AS 'LOG';

SELECT * FROM ultimo_nome;

SET autocommit=0;

START TRANSACTION;
    DELETE FROM ultimo_nome WHERE id_un = 2;

SELECT "AFTER DELETE ROW OF ultimo_nome TABLE" AS 'LOG';

SELECT * FROM ultimo_nome;

ROLLBACK;

SELECT * FROM ultimo_nome;

--Insere na segunda tabela o seguinte: '088.000.999-99' como cpf e 1 como id_(nome da segunda tabela)

SELECT "TRIGGER" AS 'LOG';

DELIMITER //
    CREATE TRIGGER nome_e_sobrenome AFTER INSERT ON primeiro_nome
        FOR EACH ROW
            BEGIN
                INSERT INTO
                    ultimo_nome(cpf,id_pn)
                VALUES
                    ("088.000.999-99", 1);
        END //
DELIMITER ;

INSERT INTO 
    primeiro_nome(nome, rg)
VALUES
    ("Violeta","92.743.863-5");

SELECT * FROM primeiro_nome;
SELECT * FROM ultimo_nome;