DROP DATABASE IF EXISTS learn_procedures;
CREATE DATABASE learn_procedures;

USE learn_procedures;

CREATE TABLE country(
    id_country INTEGER PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(255),
    continent VARCHAR(255)
);

INSERT INTO
    country (country_name, continent)
VALUES
    ('Brasil', 'America do Sul'),
    ('Paraguai', 'America do Sul'),
    ('Uruguai', 'America do Sul'),
    ('Peru', 'America do Sul'),
    ('Libano', 'Asia'),
    ('Estados Unidos', 'America do Norte');

SELECT "Usando Procedure pela primeira vez" AS "Info";
DELIMITER //

    CREATE  PROCEDURE SelectCountry()
        BEGIN
            SELECT * FROM country;
    END //

DELIMITER ;

show procedure status;

call SelectCountry;

SELECT "Usando Procedure com paramentros" AS "Info";

DELIMITER //

    CREATE  PROCEDURE SelectCountryArgRecive(CountryName VARCHAR(255))
        BEGIN
            SELECT * FROM country WHERE country.country_name=CountryName;
    END //

DELIMITER ;

call SelectCountryArgRecive ('Brasil');

SELECT "Usando Procedure sem parametros mas com argumento interno" AS "Info";

DELIMITER //

    CREATE  PROCEDURE SelectCountryInternArg()
        BEGIN
            DECLARE CountryName VARCHAR(255);
            SET CountryName='Brasil';

            SELECT * FROM country WHERE country.country_name=CountryName;
    END //

DELIMITER ;

call SelectCountryInternArg;

SELECT "Usando Procedure com inputs" AS "Info";

DELIMITER //

    CREATE  PROCEDURE SelectCountryUsingIf(InputNumber INTEGER)
        BEGIN
            DECLARE CountryName VARCHAR(255);

            IF InputNumber = 1 THEN
                SET CountryName = 'Brasil';
            ELSEIF  InputNumber = 2 THEN
                SET CountryName = 'Paraguai';
            ELSEIF  InputNumber = 3 THEN
                SET CountryName = 'Uruguai';
            ELSEIF  InputNumber = 4 THEN
                SET CountryName = 'Peru';
            ELSEIF  InputNumber = 5 THEN
                SET CountryName = 'Libano';
            END IF;

            SELECT CountryName AS 'Pais Selecionado';

            SELECT * from country where country.country_name=CountryName;

    END //

DELIMITER ;

call SelectCountryUsingIf(1);



DELIMITER //

    CREATE  PROCEDURE SelectCountryCase(InputNumber INTEGER)
        BEGIN
            DECLARE CountryName VARCHAR(255);

            CASE
                WHEN InputNumber = 1 THEN SET CountryName = 'Brasil';
                WHEN InputNumber = 2 THEN SET CountryName = 'Paraguai';
                WHEN InputNumber = 3 THEN SET CountryName = 'Uruguai';
                WHEN InputNumber = 4 THEN SET CountryName = 'Peru';
                WHEN InputNumber = 5 THEN SET CountryName = 'Libano';
            END CASE;
            
            SELECT CountryName AS 'Pais Selecionado';

            SELECT * from country where country.country_name=CountryName;

    END //

DELIMITER ;

call SelectCountryCase(5);