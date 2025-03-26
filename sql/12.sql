/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */

SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN LATERAL (
  SELECT i.film_id
  FROM rental r
  JOIN inventory i ON r.inventory_id = i.inventory_id
  WHERE r.customer_id = c.customer_id
  ORDER BY r.rental_date DESC
  LIMIT 5
) recent_rentals ON true
JOIN film_category fc ON recent_rentals.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
GROUP BY c.customer_id
HAVING SUM(CASE WHEN cat.name = 'Action' THEN 1 ELSE 0 END) >= 4
ORDER BY c.customer_id;

