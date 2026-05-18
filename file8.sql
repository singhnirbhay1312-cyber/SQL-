USE SHADIDB;
create  table departments(dept_id int ,dept_name varchar(20), location varchar(20));
insert into departments values(10,'HR','Mumbai'),(20,'IT','Banglore'),(30,'Finance','Delhi');

select * from departments;
select * from employees;

-- i need to find out the person who have department in delhi and banglore locaion
 select dept_name from departments where location in ('Banglore','Delhi');
 
 select * from employees 
 where department =any (select dept_name from departments where location in ('Banglore','Delhi'));
 
 -- co-related subqueery  => it ia a type of subquerry where nested (inner query)query executed for each value of the outer query.
 -- inner query also refer to the column of outer query 
 select * from employees 
 where salary > all (select avg(salary) from employees where department ='IT');
 
 select * from employees as e  
 where salary > all (select avg(salary) from employees where department =e.department);
 
 -- find the  employee  whose salary  is same as the  highest salary  of their own deaprtment
 select max(salary) from employees where department='IT';
 SELECT * FROM EMPLOYEES AS ES
 where salary = (select max(salary) from employees where department=es.department);
 
 -- find the department where all employees above 70000
 select * from employees as e where 
 70000 < all (select salary from employees where department =e.department);
 
