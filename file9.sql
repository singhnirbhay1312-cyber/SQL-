-- windows function => it perform a calculation on multiple rows and gives u the calculated ouput for each row
--
use shadidb;
select * from employees; 
select emp_id,name,salary,avg(salary) over() from employees;

select emp_id,name,salary,max(salary) over(),avg(salary) over() from employees;

select emp_id,name,salary,avg(salary) over(),salary-avg(salary) over() from employees;

select emp_id,name,count(*) over(),max(salary) over (),min(salary) over ()
from employees;

select emp_id,name,salary,sum(salary) over(),
concat(round((salary /sum(salary) over()) *100),'%') from employees;

-- running sum
select * from employees; 
select emp_id,name,salary,sum(salary) over(order by salary) from employees;

select * from employees; 
select emp_id,name,salary,sum(salary) over(order by emp_id) from employees;

-- order by on not unique column  
select * from employees; 
select emp_id,name,salary,department,sum(salary) over(order by department) from employees;
