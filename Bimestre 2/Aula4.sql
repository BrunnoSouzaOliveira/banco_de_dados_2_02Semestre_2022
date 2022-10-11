--Triger

DROP DATABASE IF EXISTS learn_trigger;
CREATE DATABASE learn_trigger;

USE learn_trigger;

CREATE TABLE vendedores(
    id_vendedores   INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_vendedor   VARCHAR(255),
    created_at      DATETIME DEFAULT NOW()
);

INSERT INTO vendedores (nome_vendedor) VALUES
    ("Roberto"),
    ("Fabio"),
    ("Thiago");

CREATE TABLE produto(
    id_produto      INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_produto    VARCHAR(255) NOT NULL,
    compania        VARCHAR(255),
    created_at      DATETIME DEFAULT NOW()
);

INSERT INTO produto (nome_produto, compania) VALUES
    ("Refrigerante", "Pepsi"),
    ("Chocolate", "KitKat"),
    ("Sabao em Po", "OMO"),
    ("Achocolatado","Nescau");

CREATE TABLE estoque(
    id_estoque      INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_produto      INTEGER NOT NULL,
    id_vendedor     INTEGER,
    quantidade      INTEGER NOT NULL,
    created_at      DATETIME DEFAULT NOW(),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedores),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

INSERT INTO estoque (id_produto, quantidade) VALUES
    (1,40),
    (2,70),
    (3,50);

CREATE TABLE saldo(
    id_saldo            INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    quantidade_compra   INTEGER NOT NULL,
    quantidade_venda    INTEGER NOT NULL,
    id_estoque          INTEGER NOT NULL,
    FOREIGN KEY (id_estoque) REFERENCES estoque(id_estoque)
);

DELIMITER //
    CREATE TRIGGER tgr_itensvenda_insert AFTER INSERT ON saldo
        FOR EACH ROW
            BEGIN
                UPDATE
                    estoque
                SET
                    quantidade = NEW.quantidade_compra - NEW.quantidade_venda
                WHERE
                    estoque.id_estoque = NEW.id_estoque;
        END //
DELIMITER ;

SELECT id_estoque,quantidade FROM estoque;

INSERT INTO
    saldo (quantidade_compra,quantidade_venda,id_estoque)
VALUES
    (90,40,1),
    (30,20,2),
    (100,20,3);

SELECT id_estoque,quantidade FROM estoque;


DELIMITER //
    CREATE TRIGGER tgr_itensvenda_update AFTER UPDATE ON saldo
        FOR EACH ROW
            BEGIN
                UPDATE
                    estoque
                SET
                    quantidade = NEW.quantidade_compra - NEW.quantidade_venda
                WHERE
                    estoque.id_estoque = NEW.id_estoque;
        END //
DELIMITER ;

SELECT * FROM estoque;

UPDATE 
    saldo 
SET 
    quantidade_compra = 80, 
    quantidade_venda = 40 
WHERE 
    id_estoque = 1;
    
SELECT * FROM estoque;

