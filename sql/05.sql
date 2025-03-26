/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

--fa1 gets actors from American Circus
--fa2 gets all films that each actor is in
--JOIN film2 gets the title of those films
--WHERE film.title = 'AMERICAN CIRCUS' filters to only actors from the target film

SELECT f2.title
FROM film_actor fa1
JOIN film f1 ON fa1.film_id = f1.film_id
JOIN film_actor fa2 ON fa1.actor_id = fa2.actor_id
JOIN film f2 ON fa2.film_id = f2.film_id
WHERE f1.title = 'AMERICAN CIRCUS'
ORDER BY f2.title;
