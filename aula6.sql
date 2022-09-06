USE sakila;

SELECT "Com Group By" as "INFO";

SELECT
    actor.actor_id,
    concat(actor.first_name,' ',actor.last_name) as "Names:"
FROM
    actor
INNER JOIN
    film_actor ON film_actor.actor_id = actor.actor_id
INNER JOIN
    film ON film.film_id = film_actor.film_id
INNER JOIN
    inventory ON inventory.film_id = film.film_id
INNER JOIN
    rental ON rental.inventory_id = inventory.inventory_id
INNER JOIN
    customer ON customer.customer_id = rental.customer_id
WHERE
    customer.email = "DOROTHY.TAYLOR@sakilacustomer.org"
GROUP BY actor.actor_id
ORDER BY actor.actor_id ASC;

SELECT "Com Distinct" as "INFO";

SELECT
    distinct(actor.actor_id),
    concat(actor.first_name,' ',actor.last_name) as "Names:"
FROM
    actor
INNER JOIN
    film_actor ON film_actor.actor_id = actor.actor_id
INNER JOIN
    film ON film.film_id = film_actor.film_id
INNER JOIN
    inventory ON inventory.film_id = film.film_id
INNER JOIN
    rental ON rental.inventory_id = inventory.inventory_id
INNER JOIN
    customer ON customer.customer_id = rental.customer_id
WHERE
    customer.email = "DOROTHY.TAYLOR@sakilacustomer.org"
ORDER BY actor.actor_id ASC;