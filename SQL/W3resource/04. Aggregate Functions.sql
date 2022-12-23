-- NOTE: Before execute this commands, execute the "pre data" file located
-- in the current folder to get the database and table which is used below

-- Init
USE [w3resource]
GO

-- Exercise 1
-- Write a SQL query to calculate total purchase amount of all orders. Return total
-- purchase amount.

SELECT
  SUM([purch_amt]) AS [sum]
FROM
  [dbo].[orders]

-- Exercise 2
-- Write a SQL query to calculate the average purchase amount of all orders. Return
-- average purchase amount.

SELECT
  AVG([purch_amt]) AS [avg]
FROM
  [dbo].[orders]

-- Exercise 3
-- Write a SQL query that counts the number of unique salespeople.
-- Return number of salespeople.

SELECT
  COUNT(DISTINCT [salesman_id]) AS [count]
FROM
  [dbo].[orders]

-- Exercise 4
-- Write a SQL query to count the number of customers. Return number of customers.

SELECT
  COUNT([customer_id]) AS [count]
FROM
  [dbo].[customer]

-- Exercise 5
-- Write a SQL query to determine the number of customers who received at least
-- one grade for their activity.

SELECT
  COUNT(ALL [grade]) AS [count]
FROM
  [dbo].[customer]

-- OR

SELECT
  COUNT([grade]) AS [count]
FROM
  [dbo].[customer]
WHERE
  [grade] IS NOT NULL

-- Exercise 6
-- Write a SQL query to find the maximum purchase amount.

SELECT
  MAX([purch_amt]) AS [max]
FROM
  [dbo].[orders]

-- Exercise 7
-- Write a SQL query to find the minimum purchase amount.

SELECT
  MIN([purch_amt]) AS [min]
FROM
  [dbo].[orders]

-- Exercise 8
-- Write a SQL query to find the highest grade of the customers in each city.
-- Return city, maximum grade.

SELECT
  [city],
  MAX([grade]) AS [max]
FROM
  [dbo].[customer]
GROUP BY
  [city]

-- Exercise 9
-- Write a SQL query to find the highest purchase amount ordered by each
-- customer. Return customer ID, maximum purchase amount.

SELECT
  [customer_id],
  MAX([purch_amt]) AS [max]
FROM
  [dbo].[orders]
GROUP BY
  [customer_id]

-- Exercise 10
-- Write a SQL query to find the highest purchase amount ordered by each customer
-- on a particular date. Return, order date and highest purchase amount.

SELECT
  [customer_id],
  [ord_date],				-- Taking GROUP BY 2 arguments:
  MAX([purch_amt]) AS [max] -- The engine gets like this "I should separate 
FROM						-- this table into several tables by "customer"
  [dbo].[orders]			-- and tables which is separated now should be
GROUP BY					-- separated by date themselves too.
  [customer_id],
  [ord_date]

-- Exercise 11
-- Write a SQL query to determine the highest purchase amount made by each salesperson
-- on '2012-08-17'. Return salesperson ID, purchase amount

SELECT
  [salesman_id],
  MAX([purch_amt]) AS [max]
FROM
  [dbo].[orders]
WHERE
  [ord_date] = '2012-08-17'
GROUP BY
  [salesman_id]

-- Exercise 12
-- Write a SQL query to find the highest order (purchase) amount by each customer on
-- a particular order date. Filter the result by highest order (purchase) amount
-- above 2000.00. Return customer id, order date and maximum purchase amount.

SELECT
  [customer_id],
  [ord_date],
  MAX([purch_amt]) AS [max]
FROM
  [dbo].[orders]
GROUP BY
  [customer_id],
  [ord_date]
HAVING
  MAX([purch_amt]) > 2000

-- Exercise 13
-- Write a SQL query to find the maximum order (purchase) amount in the range 2000 -
-- 6000 (Begin and end values are included.) by combination of each customer and
-- order date. Return customer id, order date and maximum purchase amount.

SELECT
  [customer_id],
  [ord_date],
  MAX([purch_amt]) AS [max]
FROM
  [dbo].[orders]
GROUP BY
  [customer_id],
  [ord_date]
HAVING
  MAX([purch_amt]) BETWEEN 2000 AND 6000

-- Exercise 14
-- Write a SQL query to find the maximum order (purchase) amount based on the combina-
-- tion of each customer and order date. Filter the rows for maximum order (purchase)
-- amount is either 2000, 3000, 5760, 6000. Return customer id, order date and
-- maximum purchase amount.

SELECT
  [customer_id],
  [ord_date],
  MAX([purch_amt]) AS [max]
FROM
  [dbo].[orders]
GROUP BY
  [customer_id],
  [ord_date]
HAVING
  MAX([purch_amt]) IN (2000, 3000, 5760, 6000)

-- Exercise 15
-- Write a SQL query to determine the maximum order amount for each customer. The
-- customer ID should be in the range 3002 and 3007(Begin and end values are
-- included.). Return customer id and maximum purchase amount.

SELECT
  [customer_id],
  MAX([purch_amt]) AS [max]
FROM
  [dbo].[orders]
WHERE
  [customer_id] BETWEEN 3002 AND 3007
GROUP BY
  [customer_id]

-- Exercise 16
-- Write a SQL query to find the maximum order (purchase) amount for each customer. The
-- customer ID should be in the range 3002 and 3007(Begin and end values are included).
-- Filter the rows for maximum order (purchase) amount is higher than 1000. Return
-- customer id and maximum purchase amount.

SELECT
  [customer_id],
  MAX([purch_amt]) AS [max]
FROM
  [dbo].[orders]
WHERE
  [customer_id] BETWEEN 3002 AND 3007
GROUP BY
  [customer_id]
HAVING
  MAX([purch_amt])>1000

-- Exercise 17
-- Write a SQL query to determine the maximum order (purchase) amount generated by each
-- salesperson. Filter the rows for the salesperson ID is in the range 5003 and 5008 
-- (Begin and end values are included.). Return salesperson id and maximum purchase
-- amount.

SELECT
  [salesman_id],
  MAX([purch_amt]) AS [max]
FROM
  [dbo].[orders]
WHERE
  [salesman_id] BETWEEN 5003 and 5008
GROUP BY
  [salesman_id]

-- Exercise 18
-- Write a SQL query to count all the orders generated on '2012-08-17'.
-- Return number of orders.

SELECT
  COUNT([ord_no])
FROM
  [dbo].[orders]
WHERE
  [ord_date]='2012-08-17'

-- Exercise 19
-- Write a SQL query to count the number of salespeople in a city.
-- Return number of salespeople.

SELECT
  COUNT(ALL [city]) AS [city]
FROM
  [dbo].[salesman]

-- Exercise 20
-- Write a SQL query to count the number of orders based on the combination of each
-- order date and salesperson. Return order date, salesperson id.

SELECT
  [ord_date],
  [salesman_id],
  COUNT(*) AS [cnt]
FROM
  [dbo].[orders]
GROUP BY
  [ord_date],
  [salesman_id]

-- Exercise 21
-- Write a SQL query to calculate the average product price. Return average
-- product price.

SELECT
  AVG([PRO_PRICE]) AS [PRICE]
FROM
  [dbo].[item_mast]

-- Exercise 22
-- Write a SQL query to count the number of products whose price are higher than
-- or equal to 350. Return number of products.

SELECT
  COUNT([PRO_PRICE]) AS [CNT]
FROM
  [dbo].[item_mast]
WHERE
  [PRO_PRICE] >= 350

-- Exercise 23
-- Write a SQL query to compute the average price for unique companies.
-- Return average price and company id.

SELECT
  AVG([PRO_PRICE]) AS [Avarage Price],
  [PRO_COM]
FROM
  [dbo].[item_mast]
GROUP BY
  [PRO_COM]

-- Exercise 24
-- Write a SQL query to compute the sum of the allotment amount of all departments.
-- Return sum of the allotment amount.

SELECT
  SUM(DPT_ALLOTMENT) AS [SUM]
FROM
  [dbo].[emp_department]

-- Exercise 27
-- Write a SQL query to count the number of employees in each department.
-- Return department code and number of employees.

SELECT
  [EMP_DEPT],
  COUNT(*)
FROM
  [dbo].[emp_details]
GROUP BY
  [EMP_DEPT]
