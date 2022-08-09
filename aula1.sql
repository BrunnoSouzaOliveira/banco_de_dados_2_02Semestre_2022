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

SELECT
    "Selecting Specific column"
AS
    "INFO";

SELECT
    first_name,
    last_name,
    gender
FROM
    students;

    SELECT * FROM students;




SELECT
    "Selecting Specific column - version 2"
AS
    "INFO";

SELECT
    students.first_name,
    students.last_name,
    students.gender
FROM
    students;




SELECT
    "Selecting Specific column - version 3"
AS
    "INFO";

SELECT
    aula1.students.first_name,
    aula1.students.last_name,
    aula1.students.gender
FROM
    aula1.students;




SELECT
    "Selecting Specific column - version 4"
AS
    "INFO";

SELECT
    aula1.students.first_name as "primeiro_nome",
    aula1.students.last_name as "ultimo_nome",
    aula1.students.gender as "genero"
FROM
    aula1.students;



SELECT
    "Selecting Specific column - version 5"
AS
    "INFO";

SELECT
    students.first_name,
    students.last_name,
    students.gender
FROM
    students
WHERE
    gender = 'M';