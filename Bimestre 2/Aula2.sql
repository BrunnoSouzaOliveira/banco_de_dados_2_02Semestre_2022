USE sakila;

/* Util apenas para por dentro de areas do WHERE */
CREATE INDEX idx_customer_email ON customer(email);
CREATE INDEX idx_film_title ON film(title);

SELECT "Com Sub-Query" AS "INFO";

EXPLAIN SELECT
    film.title
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
                        customer.email = 'JENNIFER.DAVIS@sakilacustomer.org'
                )
            )
        );

SELECT "Com INNER JOIN" AS "INFO";

EXPLAIN SELECT
    film.title
FROM
    film
INNER JOIN
    inventory ON inventory.film_id = film.film_id
INNER JOIN
    rental ON rental.inventory_id = inventory.inventory_id
INNER JOIN
    customer ON customer.customer_id = rental.customer_id
WHERE
    customer.email = 'JENNIFER.DAVIS@sakilacustomer.org';

SELECT "Com LEFT JOIN" AS "INFO";

EXPLAIN SELECT
    film.title
FROM
    customer
LEFT JOIN
    rental ON customer.customer_id = rental.customer_id
LEFT JOIN
    inventory ON rental.inventory_id = inventory.inventory_id
LEFT JOIN
    film ON inventory.film_id = film.film_id
WHERE
    customer.email = 'JENNIFER.DAVIS@sakilacustomer.org';

SELECT "CUSTOMER" AS "INFO";
SHOW INDEX FROM customer;
SELECT "INVENTORY" AS "INFO";
SHOW INDEX FROM inventory;
SELECT "FILM" AS "INFO";
SHOW INDEX FROM film;
SELECT "RENTAL" AS "INFO";
SHOW INDEX FROM rental;