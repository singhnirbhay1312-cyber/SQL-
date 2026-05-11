use sakila;

CREATE TABLE sales_data (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(50),
    Category VARCHAR(20) CHECK (Category IN ('Electronics', 'Home', 'Apparel')),
    OrderDate DATE,
    OrderValue DECIMAL(10, 2)
);

INSERT INTO sales_data (OrderID, CustomerID, Category, OrderDate, OrderValue)
VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500),
(1002, 'C203', 'Apparel', '2024-01-07', 3200),
(1003, 'C205', 'Home', '2024-01-10', 5800),
(1004, 'C201', 'Electronics', '2024-01-15', 8900),
(1005, 'C207', 'Apparel', '2024-01-18', 2100),
(1006, 'C210', 'Home', '2024-01-22', 4700),
(1007, 'C203', 'Electronics', '2024-02-01', 15300),
(1008, 'C212', 'Apparel', '2024-02-05', 1800),
(1009, 'C205', 'Home', '2024-02-08', 6200),
(1010, 'C214', 'Electronics', '2024-02-12', 9400),
(1011, 'C207', 'Apparel', '2024-02-17', 2900),
(1012, 'C210', 'Electronics', '2024-02-20', 11000),
(1013, 'C212', 'Home', '2024-03-01', 3500),
(1014, 'C201', 'Apparel', '2024-03-05', 4100),
(1015, 'C214', 'Home', '2024-03-10', 7800);

select * from sales_data;

-- Level - 1 {EASY}
-- Q1. Calculate the total revenue (sum of OrderValue) for each product Category.
select sum(ordervalue), category
from sales_data
group by category;

-- Q2. Count the total number of orders placed in each Category.
select category, count(orderid)
from sales_data
group by category;

-- Q3. Find the highest (maximum) single OrderValue within each Category.
select category, max(ordervalue)
from sales_data
group by category;

-- Level - 2 {EASY}
-- Q1. List all unique product Categories that appear in the Sales_Data table.
select distinct(category)
from sales_data;

-- Q2. List all unique CustomerIDs who have placed at least one order.
select distinct(customerid)
from sales_data;

-- Q3. Find all unique combinations of CustomerID and Category (i.e., which customers bought from which categories).
select distinct customerid, category
from sales_data
order by customerid;

-- LEVEL 3 — {MEDIUM}
-- Q1. Revenue by CustomerID and Category
select customerid, category, sum(ordervalue) as total_revenue
from sales_data
group by customerid, category;

-- Q2. Order Count by CustomerID and Category
select customerid, category, count(orderid)
from sales_data
group by customerid, category;

-- Q3. Revenue by Category and Month
select category, month(orderdate), sum(ordervalue) as total_revenue
from sales_data
group by category, month(orderdate);

-- Level - 4 {MEDIUM}
-- Q1. Categories with Revenue > $20,000
select category, sum(ordervalue) as total_revenue
from sales_data
group by category
having total_revenue > 20000;

-- Q2. Customers with More Than 1 Order
select customerid, count(OrderID)
from sales_data
group by customerid
having count(OrderID) > 1;

-- Q3. Customer + Category Combinations Spending > $10,000
select CustomerID, category, sum(ordervalue)
from sales_data
group by customerid, category
having sum(OrderValue);

-- level - 5 {HARD}
-- Q1. Category Summary (Avg Order Value > $5,000, sorted by Revenue)
select category, count(orderid), sum(ordervalue) as total_revenue, avg(ordervalue)
from sales_data
group by category
having avg(ordervalue) > 5000;

-- Q2. High-Value Repeat Customers (>1 order, Avg OrderValue > 6,000)
select customerid, count(orderid), avg(ordervalue)
from sales_data
group by customerid
having count(orderid) > 1 and avg(ordervalue) > 6000;

-- Q3. Category-Month Summary (Min 2 Orders, Sorted by Month then Revenue)
select count(orderid), category, month(orderdate), sum(ordervalue) as total_revenue
from sales_data
group by category, month(orderdate)
having count(orderid) >= 2
order by month(orderdate), total_revenue;
