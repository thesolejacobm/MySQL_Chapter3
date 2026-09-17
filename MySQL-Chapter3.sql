/*
Query 1
     inactive customers
     sorted by name (NOTE: if not stated, all order by clauses are the default ascending)
     Note: to thoroughly test the query, temporarily change the WHERE clause to report active customers
*/

SELECT customer_id, CONCAT(first_name, ", ", last_name) AS cust_name, active, email
FROM customer
WHERE active = 0 
ORDER BY last_name, first_name;
