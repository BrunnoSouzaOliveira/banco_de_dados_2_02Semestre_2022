USE sakila;

SELECT "Com SubQuery" as "INFO";


SELECT
    film.film_id,
    film.title,
    film.description
FROM
    film
WHERE film.film_id IN (
    SELECT
        inventory.film_id
    FROM
        inventory
    WHERE inventory.inventory_id IN (
        SELECT
            rental.inventory_id
        FROM
            rental
        WHERE rental.customer_id IN (
            SELECT
                 customer.customer_id
            FROM
                customer
            WHERE customer.address_id IN (
                SELECT
                    address.address_id
                FROM
                    address
                WHERE address.city_id = (
                    SELECT
                        city.city_id
                    FROM
                        city
                    WHERE
                        city.city = "Caracas"
                )
            )
        )
    )
);

SELECT "Com INNER JOIN" as "INFO";
    

SELECT
    film.film_id,
    film.title,
    film.description
FROM
    city
INNER JOIN
    address ON city.city_id = address.city_id
INNER JOIN
    customer ON customer.address_id = address.address_id
INNER JOIN
    rental ON rental.customer_id = customer.customer_id
INNER JOIN
    inventory ON inventory.inventory_id = rental.inventory_id
INNER JOIN
    film ON film.film_id = inventory.film_id
WHERE
    city.city = "Caracas";