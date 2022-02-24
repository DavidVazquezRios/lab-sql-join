use sakila;
-- 1. List the number of films per `category`.
SELECT 
    B.category_id, COUNT(A.film_id) AS number_of_film
FROM
    film AS A
        LEFT JOIN
    film_category AS B ON A.film_id = B.film_id
GROUP BY B.category_id
ORDER BY number_of_film DESC
;

-- 2. Display the first and the last names, as well as the address, of each staff member.
select A.first_name, A.last_name, B.address
FROM staff
     AS A
        LEFT JOIN
    address AS B ON A.address_id = B.address_id
GROUP BY A.first_name, A.last_name, B.address
;

-- 3. Display the total amount rung up by each staff member in August 2005
select * from rental; 
SELECT 
    A.staff_id, SUM(B.amount)
FROM
    rental AS A
        LEFT JOIN
    payment AS B ON A.rental_id = B.rental_id
WHERE
    DATE_FORMAT(A.rental_date, '%m') = 8 & DATE_FORMAT(A.rental_date, '%y') = 05
GROUP BY A.staff_id
;

select rental_date from rental;

-- 4. List all films and the number of actors who are listed for each film.

select A.title, count(B.actor_id) as number_of_actors_listed
FROM film
     AS A
        LEFT JOIN
    film_actor AS B ON A.film_id = B.film_id
GROUP BY A.title
;

-- 5. Using the `payment` and the `customer` tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT 
    A.first_name, A.last_name, SUM(B.amount) AS amount_paid
FROM
    customer AS A
        LEFT JOIN
    payment AS B ON A.customer_id = B.customer_id
GROUP BY A.first_name , A.last_name
ORDER BY A.last_name
;
