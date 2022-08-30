USE sakila;

SELECT "Com SubQuery" as "INFO";


SELECT
    film.title,
    film.description
FROM
    film
WHERE film.film_id IN (
    SELECT
        inventory.inventory_id
    FROM
        inventory
    WHERE inventory.film_id IN (
        SELECT
            rental.customer_id
        FROM
            rental
        WHERE rental.inventory_id IN (
            SELECT
                 customer.address_id
            FROM
                customer
            WHERE customer.customer_id IN (
                SELECT
                    address.city_id
                FROM
                    address
                WHERE address.address_id = (
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