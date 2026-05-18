-- subquery -> a query wihthin a query is known as subquery
-- it a type of query where a query is present another query.alter
-- subquery is also known as nested subquery.  
-- subquery has two parts:-
-- 1.outer query
-- 2.inner query
create database shadidb; 
use shadidb;
create table biodata(id int, name varchar(20),age int);

insert into biodata values(1,'Rahul',28),(2,'anajali',28),(3,'Aishwarya',40),(4,'naina',23);

select age from biodata where name='Rahul';
select * from biodata where age=28;

select * from biodata where age =(select age from biodata where name='Rahul');


-- oldest girl
select max(age) from biodata;
select * from biodata where age =(select max(age) from biodata); 

-- you have to find out the total character of name 'rahul'
select char_length(name)from biodata where name ='Rahul';
select * from biodata where char_length(name)=(select char_length(name)from biodata where name ='Rahul');

-- types of subquerry
-- 1.single row sube query -> it is a type of subquery return only one.

use sakila;
select * from film;
-- find out the movies name where the rental rate is same for the movie african egg
select rental_rate from film where title='AFRICAN EGG'; 
SELECT title from film where rental_rate =(select rental_rate from film where title='AFRICAN EGG');


-- get the movie id and movie name where the rental rate is equal to the minimum rental rate 
-- get mpvie id ,name,duration where the duration is gfetaer than average duration of the movie
-- get the movie id for the movies where the release yearvof the movie shoukd be equals of the releasing year of alone trip and the rating should be same as of the movie apollo team.

-- 1.
select film_id,title from film where rental_rate=(select min(rental_rate) from film);
-- 2 
select film_id,title,rental_duration from film where rental_duration>=(select  avg(rental_duration)from film);
-- 3 
select film_id,title from film where release_year=(select release_year from film where title ='ALONE TRIP') AND rating = (SELECT rating from film where title='APOLLO TEEN');

-- subquery-> if it retuens more  than one row than it is called multirow subquery
-- multi row subquery nai airthemetic suppoprt nhi krta h (comapre nhi kr skta)
 use shadidb;
 select * from biodata
 where age in (select age from biodata where name='anajali' or name ='Aishwarya')
 and name!='Rahul';
 
 -- find the name for rahul where the age is not equal to the age of anajali not ashwariya......
