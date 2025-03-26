/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 */

SELECT film.title
FROM film
JOIN film_actor fa ON film.film_id = fa.film_id
WHERE fa.actor_id IN (
  SELECT actor_id
  FROM film
  JOIN film_actor USING (film_id)
  WHERE title = 'AMERICAN CIRCUS'
)
GROUP BY film.title
HAVING COUNT(*) >= 2
ORDER BY film.title;
