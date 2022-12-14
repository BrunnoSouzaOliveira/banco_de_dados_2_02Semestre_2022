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
WHERE
actor.actor_id IN ( 
    SELECT
        film_actor.actor_id
    FROM
        film_actor 
    WHERE
    film_actor.film_id IN (
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
);
