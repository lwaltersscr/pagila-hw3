/* 
 * In the previous query, the actors could come from any combination of movies.
 * Unfortunately, you've found that if the actors all come from only 1 or 2 of the movies,
 * then there is not enough diversity in the acting talent.
 *
 * Write a SQL query that lists all of the movies where:
 * at least 1 actor was also in AMERICAN CIRCUS,
 * at least 1 actor was also in ACADEMY DINOSAUR,
 * and at least 1 actor was also in AGENT TRUMAN.
 *
 * HINT:
 * There are many ways to solve this problem,
 * but I personally found the INTERSECT operator to make a convenient solution.
 */

-- Films with actors from AMERICAN CIRCUS
SELECT f1.title
FROM film f1
JOIN film_actor fa1 ON f1.film_id = fa1.film_id
WHERE fa1.actor_id IN (
  SELECT actor_id
  FROM film
  JOIN film_actor USING (film_id)
  WHERE title = 'AMERICAN CIRCUS'
)

INTERSECT

-- Films with actors from ACADEMY DINOSAUR
SELECT f2.title
FROM film f2
JOIN film_actor fa2 ON f2.film_id = fa2.film_id
WHERE fa2.actor_id IN (
  SELECT actor_id
  FROM film
  JOIN film_actor USING (film_id)
  WHERE title = 'ACADEMY DINOSAUR'
)

INTERSECT

-- Films with actors from AGENT TRUMAN
SELECT f3.title
FROM film f3
JOIN film_actor fa3 ON f3.film_id = fa3.film_id
WHERE fa3.actor_id IN (
  SELECT actor_id
  FROM film
  JOIN film_actor USING (film_id)
  WHERE title = 'AGENT TRUMAN'
)
ORDER BY title;
