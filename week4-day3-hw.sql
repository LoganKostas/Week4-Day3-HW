-- 1. List all customers who live in Texas (use
-- JOINs)

SELECT customer.first_name, customer.last_name, district
FROM customer
Full JOIN rental
ON customer.customer_id = rental.customer_id
FULL JOIN staff
ON staff.staff_id = rental.staff_id
FULL JOIN address
ON address.address_id = staff.address_id
WHERE address.district = 'Texas';


-- SELECT customer.first_name, customer.last_name, address.district
-- FROM customer
-- WHERE customer_id IN (
--     SELECT customer.customer_id
--     FROM customer
--     INNER JOIN rental
--     ON customer.customer_id = rental.customer_id
--     INNER JOIN staff
--     ON staff.staff_id = rental.staff_id
--     INNER JOIN address
--     ON address.address_id = staff.address_id
--     WHERE district = 'Texas'
-- );

-- SELECT first_name, last_name
-- FROM (
--     SELECT customer.first_name, customer.last_name, address.district
--     FROM customer
--     INNER JOIN rental
--     ON customer.customer_id = rental.customer_id
--     INNER JOIN staff
--     ON staff.staff_id = rental.staff_id
--     INNER JOIN address
--     ON address.address_id = staff.address_id
--     WHERE address.district = 'Texas'
-- )AS q1;





-- SELECT *
-- FROM city
-- WHERE country_id = '103';

-- SELECT *
-- FROM country
-- WHERE country = 'United States';

-- SELECT district
-- FROM address
-- WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name
SELECT first_name, last_name, payment.amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;


-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    WHERE amount > 175
);

-- 4. List all customers that live in Nepal (use the city
-- table)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer.customer_id
    FROM customer
    INNER JOIN payment
    ON customer.customer_id = payment.customer_id
    INNER JOIN staff
    ON payment.staff_id = staff.staff_id
    INNER JOIN address
    ON staff.address_id = address.address_id
    INNER JOIN city
    ON address.city_id = city.city_id
    INNER JOIN country
    ON city.country_id = country.country_id
    WHERE country = 'Nepal'
);

SELECT city
FROM city;
WHERE city = 'Nepal';

-- 5. Which staff member had the most
-- transactions?
-- jon
SELECT first_name, last_name
FROM staff
WHERE staff_id IN(
    SELECT staff_id
    FROM payment
    GROUP BY payment_id
    ORDER BY COUNT(payment_id) DESC
);

-- SELECT COUNT(payment_id), staff_id
-- FROM payment
-- GROUP BY staff_id;

-- SELECT staff_id, first_name, last_name
-- FROM staff;


-- 6. How many movies of each rating are
-- there?
SELECT COUNT(title), rating
FROM film
GROUP BY rating;

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
);


-- 8. how many free rentals did our store give away?
-- 30
SELECT COUNT(amount)
FROM payment
WHERE amount < 1;

SELECT *
FROM payment;