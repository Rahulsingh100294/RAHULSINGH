-- **Join Practice:**
-- Write a query to display the customer's first name, last name, email, and city they live in.
use mavenmovies;
select * from customer;
select * from country;
select * from city;
select * from address;
select customer.first_name, customer.last_name, customer.email , city.city from customer 
inner join address on customer.address_id = address.address_id
 inner join city on address.city_id = city.city_id;
 
-- *Subquery Practice (Single Row):**
-- Retrieve the film title, description, and release year for the film that has the longest duration
select * from film;
select title, description , release_year from film where length = (select max(length) from film);

-- **Join Practice (Multiple Joins):**
-- List the customer name, rental date, and film title for each rental made. Include customers who have
 -- never rented a film.
select * from customer;
select * from rental;
select * from film;
select * from inventory;
select customer.first_name, customer.last_name, rental.rental_date, film.title from customer
left join  rental on customer.customer_id = rental.customer_id 
left join inventory on rental.inventory_id = inventory.inventory_id 
left join film on inventory.film_id = film.film_id;

-- . **Subquery Practice (Multiple Rows):**
-- Find the number of actors for each film. Display the film title and the number of actors for each film.
select * from film;
select * from actor;
select * from film_actor;
select film.title, count(film_actor.film_id) as number_of_film
from film join film_actor on film.film_id = film_actor.film_id
where film.length = ( select max(length) from film) group by film.film_id;

-- Join Practice (Using Aliases):**
-- Display the first name, last name, and email of customers along with the rental date, film title, 
-- and rental return date.
select * from customer;
select * from rental;
select * from film;
select * from inventory;
select c.first_name as 'FIRST NAME' , c.last_name as 'LAST NAME' , c.email, r.rental_date as 'RENTAL DATE',
f.title as 'FILM TITLE', r.return_date as 'RETURN DATE' FROM customer c join rental r 
on c.customer_id = r.customer_id join inventory i on r.inventory_id = i.inventory_id 
join film f on i.film_id = f.film_id;

--  **Subquery Practice (Conditional):**
-- Retrieve the film titles that are rented by customers whose email domain ends with '.net'.
select film.title from film join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
join customer on rental.customer_id = customer.customer_id 
where customer.email like '%.net'
group by film.title;

--  **Join Practice (Aggregation):**
-- Show the total number of rentals made by each customer, along with their first and last names.
select*from rental;
select * from customer;
select customer.first_name, customer.last_name, count(rental.rental_id) from customer
join rental on customer.customer_id = rental.customer_id
group by customer.customer_id;

-- **Subquery Practice (Aggregation):**
-- List the customers who have made more rentals than the average number of rentals made by all  customers
select first_name, last_name from customer where customer_id in  (
select customer_id from rental group by customer_id having count(*) >
( select avg(rental) from ( select count(*) as rental from rental group by customer_id )
as rental_counts )); 

-- **Join Practice (Self Join):**
-- Display the customer first name, last name, and email along with the names of other customers living in 
-- the same city.
select c1.first_name,c1.last_name, c1.email , c2.first_name as 'OTHER FIRST NAME', 
c2.last_name as 'OTHER LAST NAME' from customer c1 join customer c2 on c1.address_id = c2.address_id 
and c1.customer_id != c2.customer_id;

-- --  **Subquery Practice (Correlated Subquery):**
-- Retrieve the film titles with a rental rate higher than the average rental rate of films in the
    -- same category.
    select title from film f where rental_rate >( select avg(rental_rate) from film f2 where f.rating = f2.rating);
    
    
    --  **Subquery Practice (Nested Subquery):**
-- Retrieve the film titles along with their descriptions and lengths that have a rental rate greater
-- than the average rental rate of films released in the same year
select title, description, length from film where rental_rate > ( select avg(rental_rate) from film
 where release_year = ( select release_year from film where film_id = (select max(film_id) from film )));
 
 --  **Subquery Practice (IN Operator):**
-- List the first name, last name, and email of customers who have rented at least one film in the 
-- 'Documentary' category
select first_name, last_name, email from customer where customer_id in(
select rental.customer_id from rental 	
join inventory on rental.inventory_id = inventory.inventory_id 
join film on inventory.film_id = film.film_id 
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id 
where category.name = 'documentary');

--  **Subquery Practice (Scalar Subquery):**
-- Show the title, rental rate, and difference from the average rental rate for each film. 
select title, rental_rate , rental_rate -( select avg(rental_rate) from film) as 'DIFFRENCE OF RENTAL' from film;

-- ASSIGNMENT QUESTIONS 
--  **Subquery Practice (Existence Check):**
-- Retrieve the titles of films that have never been rented.
select title from film where film_id not in ( select distinct film_id 
from inventory where inventory_id in ( select distinct inventory_id from rental) );

--  **Subquery Practice (Correlated Subquery - Multiple Conditions):**
-- List the titles of films whose rental rate is higher than the average rental rate of films released
-- in the same year and belong to the 'Sci-Fi' category
SELECT title
FROM film
WHERE rental_rate > (
    SELECT AVG(rental_rate)
    FROM film
    WHERE release_year = film.release_year
) AND film_id IN (
    SELECT film_id
    FROM film_category
    WHERE category_id = (
        SELECT category_id
        FROM category
        WHERE name = 'Sci-Fi'
    )
);

--  **Subquery Practice (Conditional Aggregation):**
-- Find the number of films rented by each customer, excluding customers who have rented fewer
-- than five films
select customer.first_name, customer.last_name, count(rental.rental_id) as 'TOTAL RENTAL'
from customer join rental on customer.customer_id = rental.customer_id group by customer.customer_id 
having count(rental.rental_id) >= 5;