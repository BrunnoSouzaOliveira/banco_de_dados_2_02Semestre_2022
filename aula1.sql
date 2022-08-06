SELECT
    "USE MySQL database"
AS
    "INFO";

USE mysql;

SELECT
    "Drop database aula 1 if exist"
AS
    "INFO";

DROP DATABASE IF EXISTS aula1;

SELECT 
    "The creation of database" 
AS 
    "INFO";

CREATE DATABASE aula1;

SELECT
    "Use of database"
AS  
    "INFO";

USE aula1;

SELECT
    "Create table students"
AS  
    "INFO";

DROP TABLE IF EXISTS students;

CREATE TABLE students(
    id_ano              INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name          VARCHAR(255) NOT NULL,
    last_name           VARCHAR(255) NOT NULL,
    gender              ENUM('M','F'),
    code_registration   INTEGER UNIQUE,
    status_             BOOLEAN DEFAULT true,
    created_at          DATETIME DEFAULT NOW(),
    deleted_at          DATETIME
);

DESCRIBE students;

INSERT INTO students(
    first_name,
    last_name,
    gender,
    code_registration
) 
    VALUES
(
    'Brunno',
    'Oliveira',
    'M',
    1
),
(
    'Douglas',
    'Arvimg',
    'M',
    2
),
(
    'Maryanna',
    'Egypto',
    'F',
    3
),
(
    'Ernane',
    'Paz',
    'M',
    4
);

SELECT * FROM students;