USE sakila;

SELECT "Com INNER JOIN" as "INFO";

SELECT
    film.film_id,
    customer.first_name,
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
    city.city = "Caracas"
GROUP BY film.film_id;


/*SELECT "Com SubQuery" as "INFO";


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
);*/

SELECT "Codigo do Germano" as "INFO";

SELECT
    filme.title
FROM
    city as cidade,
    address as endereco,
    customer as cliente,
    rental as aluguel,
    inventory as inventario,
    film as filme
INNER JOIN
    city on cidade.city_id = endereco.city_id
INNER JOIN
    address on endereco.address_id = cliente.address_id
INNER JOIN
    customer on cliente.customer_id = aluguel.customer_id
INNER JOIN
    rental on aluguel.inventory_id = inventario.inventory_id
INNER JOIN
    inventory on inventario.film_id = filme.film_id
WHERE
    cidade.city = "Caracas";

    
SELECT "Codigo alterado 1" as "INFO";

SELECT
    filme.title
FROM
    film as filme
INNER JOIN
    inventory as inventario on inventario.film_id = filme.film_id
INNER JOIN
    rental as aluguel on aluguel.inventory_id = inventario.inventory_id
INNER JOIN
    customer as cliente on cliente.customer_id = aluguel.customer_id
INNER JOIN
    address as endereco on endereco.address_id = cliente.address_id
INNER JOIN
    city as cidade on cidade.city_id = endereco.city_id
WHERE
    city = "Caracas";

SELECT "Codigo alterado 2" as "INFO";

SELECT
    filme.title
FROM
    film as filme,
    inventory as inventario,
    rental as aluguel,
    customer as cliente,
    address as endereco,
    city as cidade
INNER JOIN
    inventory on inventario.film_id = filme.film_id
INNER JOIN
    rental on aluguel.inventory_id = inventario.inventory_id
INNER JOIN
    customer on cliente.customer_id = aluguel.customer_id
INNER JOIN
    address on endereco.address_id = cliente.address_id
INNER JOIN
    city on cidade.city_id = endereco.city_id
WHERE
    cidade.city = "Caracas";

    
SELECT "Codigo alterado 3" as "INFO";

SELECT
    filme.title
FROM
    city as cidade,
    address as endereco,
    customer as cliente,
    rental as aluguel,
    inventory as inventario,
    film as filme
INNER JOIN
    city on cidade.city_id = endereco.city_id
INNER JOIN
    address on endereco.address_id = cliente.address_id
INNER JOIN
    customer on cliente.customer_id = aluguel.customer_id
INNER JOIN
    rental on aluguel.inventory_id = inventario.inventory_id
INNER JOIN
    inventory on inventario.film_id = filme.film_id
INNER JOIN
    film on filme.film_id = inventario.film_id
WHERE
    cidade.city = "Caracas";