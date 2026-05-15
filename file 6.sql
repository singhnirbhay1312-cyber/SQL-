use shadidb;
CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT);
-- Insert Data
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);

select * from employees;
select avg(salary) from employees;
select salary from employees where name='Alice'; 
select * from employees where salary >(select salary from employees where name='Alice');
select * from employees;
select min(salary) from employees;
select * from employees where salary =(select min(salary) from employees);

select salary from employees where name ='Alice' or name='Bob';
select * from employees where salary =50000 or salary =80000;

select * from employees where department in (select department from employees where name ='Alice' or name='Bob');

-- Any operator 
select * from employees
where salary  >any (select salary from employees where emp_id=103 or emp_id=107);

select * from employees where department ='HR';
select * from employees where salary >any(select salary from employees where department='HR');

-- ALL OPERATOR
select * from employees where salary >all(select salary from employees where department='HR');

-- find the employee details who works in it department and have the salary greater than the salary of employee id 101
-- find the name of the person whose salary is greater than all the salaries of hr or it department 
--  find the employee id and employee name of the user whose salary is greater than the salary of any employee working under the manger id 101
-- find out second highets salary from this table 
  -- 1.
  select * from employees where department='IT' AND salary > ALL(select salary from employees where emp_id=101);
  
  -- 2.
  select * from employees;
  select name from employees where salary >all(select salary from employees where department ='HR' and department='IT');
  
  -- 3
  select emp_id, name  from employees where salary > all(select salary from employees where manager_id=101);
  
  -- 4.
  select max(salary) as second_highest 
  from employees
  where salary<(select max(salary) from employees);
