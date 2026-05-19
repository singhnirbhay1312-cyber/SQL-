use windowsdb;
select * from employees;
select * ,row_number()over(order by hire_year),
rank() over(order by hire_year) ,dense_rank() over(order by hire_year)from employees;

select*,rank() over(partition by dept order by salary)from employees;

-- max salary fom each department
select * from employees as e
where salary=(select  max(salary)from employees where dept=e.dept);

select * from 
(select * ,max(salary) over(partition by dept) as deptsalary from employees) as trl
where salary=deptsalary;   -- we can not  use where clause on deptsalary directly in this we first create a table only than we can use where clause

select * from 
(select *,rank() over(partition by dept order by salary desc) as rnk from employees)as temp
where rnk=1; 

-- second highest salary
select * from 
(select *, dense_rank() over(order by salary desc) as drnk from employees) as z
where drnk=2;

select * from employees where salary=
(select max(salary)from employees where salary <(select max(salary) from employees )); 

-- for second highest we only use subquery only 
select * from 
(select *,dense_rank() over(order by salary asc) as drnk from employees) as d
where drnk=4;
