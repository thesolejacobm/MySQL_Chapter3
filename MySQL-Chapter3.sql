/*
My SQL Chapter 3 Assignment
Jacob Mundt & Faith Coufal
Started on 9/17/2026
*/

/*
Query 1 - Jacob Mundt
     inactive customers
     sorted by name (NOTE: if not stated, all order by clauses are the default ascending)
     Note: to thoroughly test the query, temporarily change the WHERE clause to report active customers
*/

SELECT customer_id, CONCAT(first_name, ", ", last_name) AS cust_name, active, email
FROM customer
WHERE active = 0 
ORDER BY last_name, first_name;

/*
Query 2 - Faith Coufal
     All customers with INVALID email addresses. A valid email address is the first name, a period, the last name, and @sakilacustomer.org. Example: debbie.johnson@sakilacustomer.org
     Note: to thoroughly test this query, temporarily change the WHERE clause to report VALID emails
*/

SELECT first_name, last_name, email,
	CONCAT(first_name, '.', last_name, '@sakilacustomer.org') AS valid_email
FROM if26faitc_sakila.customer
WHERE email != CONCAT(first_name, '.', last_name, '@sakilacustomer.org')
ORDER BY valid_email;


/*
Query 3 - Jacob Mundt
	the current rental rate, what a 30% increase would be, and the new rental rate
	only report the ones that have a rental rate that increased by over $0.50
	order the report by amount increased descending
	round all calculated values to 2 decimal positions
	Note: to fully test this query, temporarily comment out the WHERE clause
*/

SELECT title, rental_rate, 
	round(rental_rate * 0.30, 2) AS amount_increased,
	round(rental_rate * 1.30, 2) AS rental_rate
FROM film
WHERE round(rental_rate * 0.30, 2) >= 0.50
ORDER BY amount_increased

/*
Query 4 - Faith Coufal
 payment amount and date (MM-DD-YYYY)
 filter by payment date greater than 01-01-2006 inclusively and payment amount greater than 1.00
 sort the query by payment amount
 Note: to thoroughly test the query comment out the WHERE clause to verify the filter is working correctly
*/

SELECT amount, DATE_FORMAT(payment_date, '%m-%d-%y') AS payment_date
FROM if26faitc_sakila.payment

WHERE amount > 1.00 
	and payment_date > '2006-01-01' 
		
ORDER BY amount;
