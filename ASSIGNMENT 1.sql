-- answer no 1.
/* Definition of primary key: A primary key is a column or set of columns that uniquely identifies each record in a table. It ensures that each row in a table is unique and serves as the identifier for that record. Primary keys must be unique and cannot contain NULL values. They ensure data integrity and provide a quick way to retrieve specific records.
Definition of foreign key: A foreign key is a column or a set of columns in a table that establishes a link between two tables. It typically references the primary key in another table.  Foreign keys enforce referential integrity, ensuring that values in one table's foreign key column match the values in another table's primary key column. They can also allow or restrict actions such as updates or deletions based on relationships defined between tables.

Diffrence between Primary key & Foreign key where as follow:-
Purpose:
Primary Key: It uniquely identifies records within a single table.
Foreign Key: It establishes relationships between tables by referencing the primary key of another table.

Uniqueness and Null Values:
Primary Key: Must be unique and cannot contain NULL values.
Foreign Key: Can have duplicate values and may contain NULL values, but they usually reference existing values in the related table's primary key.

Data Integrity:
Primary Key: Ensures data integrity within a table by uniquely identifying records.
Foreign Key: Maintains data integrity by establishing relationships between tables, enforcing referential integrity.

Constraints:
Primary Key: Defines a table's identity and serves as a unique identifier.
Foreign Key: Establishes relationships between tables, allowing actions like cascade updates or deletions based on the defined relationships. 
*/
use mavenmovies;
select actor;
describe actor;
describe actor_award;
describe address;
describe advisor;
describe category;
describe city;
describe  country;
describe customer;
describe film;
describe film_actor;
describe film_category;
describe film_text;
describe inventory;
describe investor;
describe language; 
describe payment;
describe rental;
describe staff;
describe store;

-- answer no 2
select * from actor;

-- answer no 3
select * from customer;

-- answer no 4
select distinct country from country;

-- answer n0 5
select * from customer where active = 1;

-- answer no 6
select rental_id from rental where customer_id = 1;

-- answer no 7
select * from film where rental_duration >5;

-- answer no 8
select * from film where replacement_cost <15 and replacement_cost >20;

-- answer no 9
use mavenmovies;
Select count(distinct first_name) from actor;

-- answer 10
select * from customer limit 10 ;

-- answer 11
select * from customer where first_name like 'b%' limit 3;

-- answer 12
select * from film;
select title from film where rating = 'G' limit 5;

-- answer 13
select * from customer where first_name like 'a%' ;

-- answer 14
select * from customer where first_name like '%a' ;

-- answer 15 
select city from city where city like 'a%a' limit 4 ;

-- answer 16
select first_name from customer where first_name like '%NI%' ;

-- answer 17
select first_name from customer where first_name like '_r%' ;

-- answer 18
select first_name from customer where first_name like 'a%' and length(first_name) >=5 ;

-- answer 19 
select first_name from customer where first_name like 'a%o' ;

-- answer 20
select * from film where rating in ( 'PG' , 'PG-13') ;

-- answer 21
select * from film where length between 50 and 100 ;

-- answer 22
select * from actor order by first_name limit 50; 

-- answer 23
select distinct film_id from inventory;
 
 