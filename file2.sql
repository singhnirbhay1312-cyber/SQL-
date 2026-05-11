use sakila;
select * from payment; 

-- q=> from this payment table find the total amount and the average ammount
-- find the number of transaction done customer id 1
-- find the number of transaction done customer id 1 or customer 5
-- find the average ammount spend in the year 2005

-- 1
select sum(amount),avg(amount) from payment;
 -- 2
select count(amount) from payment where customer_id=1;
-- 3
select count(amount) from payment where customer_id=2 OR customer_id=5;
-- 4
select avg(amount ) from payment where year(payment_date)=2005;

-- total transation done by each customer id.
-- find the total transation and the total amount spend after the customer id 3.
-- find the occurrence for each amount values.
-- find the total amount given in your table.
-- get the  average amount spend by each staff.
-- get the total amount in each month.
-- get the total amount spend for each month of each year.
-- 1
select customer_id,sum(amount)  from payment group by customer_id;
-- 2
select sum(amount) from payment where customer_id >3;
-- 3
select amount,count(amount) from payment group by amount;
-- 4
select sum(amount) from payment ;
-- 5
select staff_id, avg (amount) from payment group by staff_id;
-- 6
select month(payment_date),sum(amount) from payment group by month(payment_date);
-- 7
select year(payment_date),month(payment_date),sum(amount) from payment group by  year(payment_date),month(payment_date);


select * from payment;
