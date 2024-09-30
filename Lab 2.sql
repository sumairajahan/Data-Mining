-- lab 2 work
Use sakila;
-- Question # 01
-- write a query to select colum "actor_id" from the table "actor" where the "actor_id = 58"
select actor_id
from actor
where actor_id = 58;

-- question # 02
-- write a query to select the movie names of movies starting with P
select title as "movie names"
from film
where title like "P%";

-- question # 03
-- write a query to select movie that were relesd int he year 2006
select release_year, title as "movie-names"
from film
where release_year = '2006';

-- Question # 04
-- what password did the DBA assign to the user "MIKE"?
select first_name, password as "Mike's pass"
from staff
where first_name = "MIKE";

-- Question # 05
-- Write a query to retrive all data from actor whose first names are not ending with T
select * 
from actor
where first_name not like "%T";

-- Question # 06
-- select names of the actors whose IDs are b/w 50 and 150 or those whose names starts with A
select first_name, actor_id
from actor
where actor_id between 50 and 150
or actor_id like "A%";

-- Question # 08
-- write a query to display names of customers in the following formate
-- lastname, first letter of first name
select concat(last_name,",", left(first_name,1)) as "Name"
from customer;

-- Question # 10
select concat(first_name, " ", last_name) as "Usernames", address_id
from customer;


