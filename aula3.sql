/*Quais filmes Kim assistiu?
customer
rental
inventory
film*/

USE sakila;

SET @ID_CUSTOMER_SELECTED = (SELECT
    customer.customer_id
FROM
    customer
WHERE
    customer.email = 'KIM.CRUZ@sakilacustomer.org');

SELECT @ID_CUSTOMER_SELECTED as 'ID_CUSTOMER_SELECETED';

SELECT 
    rental.inventory_id
FROM 
    rental
WHERE
    rental.customer_id = @ID_CUSTOMER_SELECTED;

SELECT 
    inventory.film_id
FROM 
    inventory
WHERE
    inventory.inventory_id IN (
        (
            SELECT 
                rental.inventory_id
            FROM 
                rental
            WHERE
                rental.customer_id = @ID_CUSTOMER_SELECTED
        )
    );

SELECT
    "What Actors was in those Movies"
AS  
    "INFO";

SELECT
    actor.actor_id,
    actor.first_name,
    actor.last_name
FROM
    actor
WHERE actor.actor_id IN ( 
    SELECT 
        film_actor.film_id 
    FROM 
        film_actor 
    WHERE 
        film_actor.film_id IN (
            SELECT
                film.film_id
            FROM 
                film 
            WHERE 
                film.film_id IN (
                SELECT 
                    inventory.film_id
                FROM 
                    inventory
                WHERE
                    inventory.inventory_id IN (
                        SELECT 
                            rental.inventory_id
                        FROM 
                            rental
                        WHERE
                            rental.customer_id = (
                                SELECT
                                    customer.customer_id
                                FROM
                                    customer
                                WHERE
                                    customer.email = 'KIM.CRUZ@sakilacustomer.org'
                            )
                    )  
            )
        )
);

SELECT
    "Which was the id of the film_actor.film_id"
AS  
    "INFO";

SELECT
    *
FROM
    film_actor
WHERE
    film_actor.actor_id = "11" OR film_actor.actor_id = "115";

SELECT
    "Name of the Movies"
AS  
    "INFO";

SELECT
    film.film_id,
    film.title,
    film.description
FROM
    film
WHERE
    film.film_id IN (
        118,
        205,
        281,
        283,
        348,
        364,
        395,
        429,
        433,
        453,
        485,
        532,
        567,
        587,
        597,
        636,
        709,
        850,
        854,
        888,
        896,
        928,
        938,
        969,
        988,
        49,
        52,
        245,
        246,
        277,
        302,
        379,
        383,
        391,
        428,
        506,
        531,
        607,
        615,
        661,
        671,
        686,
        703,
        714,
        740,
        754,
        846,
        887,
        952,
        955,
        966,
        985,
        994
    );

/*SELECT 
    film.film_id,
    film.title,
    film.description
FROM 
    film 
WHERE 
    film_id IN (
        SELECT 
            inventory.film_id
        FROM 
            inventory
        WHERE
            inventory.inventory_id IN (
                SELECT 
                    rental.inventory_id
                FROM 
                    rental
                WHERE
                    rental.customer_id = (
                        SELECT
                            customer.customer_id
                        FROM
                            customer
                        WHERE
                            customer.email = 'KIM.CRUZ@sakilacustomer.org'
                    )
            )   
    )
ORDER BY film_id ASC;*/
