CREATE DATABASE trabalho_pet;

use trabalho_pet;

SELECT
    "Creating table pet"
AS  
    "INFO";

DROP TABLE IF EXISTS pet;

CREATE TABLE pet(
    id_pet                  INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    pet_name                VARCHAR(255) NOT NULL,
    type_specie             ENUM('Cachorro','Gato'),
    race                    VARCHAR(255),
    created_at              DATETIME DEFAULT NOW()
);

DESCRIBE pet;

INSERT INTO pet(
    pet_name,
    type_specie,
    race,
    created_at
) 
    VALUES
(
    "Doug",
    "Cachorro",
    "Golden Retriever",
    "2012-12-12 10:34:09"
),
(
    "Garfield",
    "Gato",
    "Somali",
    "2001-12-21 13:03:25"
),
(
    "Frederico",
    "Cachorro",
    "Labrador",
    "2006-02-08 05:43:35"
),
(
    "Frajola",
    "Gato",
    "Cymric",
    "2015-04-19 8:53:58"
),
(
    "Gudanzinho",
    "Cachorro",
    "Husky",
    "2021-11-27 00:59:32"
),
(
    "Bichento",
    "Gato",
    "Persa",
    "2019-10-24 13:42:13"
),
(
    "Dona Rosa",
    "Cachorro",
    "Schnauzer",
    "2020-09-30 16:19:00"
),
(
    "Cruel",
    "Gato",
    "Bobtail americano",
    "2020-12-20 14:15:49"
),
(
    "Pulga",
    "Cachorro",
    "Lulu da Pomerania",
    "2003-07-07 12:08:00"
),
(
    "Bisteca",
    "Gato",
    "Scottish Folds",
    "2021-01-28 18:59:29"
),
(
    "Blant",
    "Cachorro",
    "Husky",
    "2022-07-26 10:53:45"
),
(
    "Floquinho",
    "Gato",
    "Siberiano",
    "2006-05-17 4:27:45"
),
(
    "Brutus",
    "Cachorro",
    "Pastor Alemao",
    "2009-09-08 2:10:10"
),
(
    "Pixie",
    "Gato",
    "Burmilla",
    "2021-02-23 15:14:59"
),
(
    "AJ",
    "Cachorro",
    "Labrador",
    "2005-04-06 2:43:22"
),
(
    "Romeu",
    "Gato",
    "LaPerm",
    "2021-06-29 5:17:16"
),
(
    "Eddie",
    "Cachorro",
    "Jack russell terrier",
    "2002-03-05 23:43:58"
),
(
    "Xicrinho",
    "Gato",
    "Siames",
    "2013-06-01 12:34:13"
),
(
    "Scooby-Doo",
    "Cachorro",
    "Dogue Alemao",
    "2012-10-11 17:09:01"
),
(
    "Caneco",
    "Gato",
    "Balines",
    "2000-01-16 4:04:41"
);

SELECT * FROM pet;

SELECT 
    *
FROM 
    pet
ORDER BY
    created_at ASC;

SELECT 
    *
FROM 
    pet
ORDER BY
    created_at ASC
LIMIT 3;
