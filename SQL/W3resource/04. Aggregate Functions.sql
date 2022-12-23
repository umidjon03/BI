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
WHERE
  [ord_date] = '2012-08-17'
GROUP BY
  [customer_id],
  [ord_date]
HAVING
  [max] > 2000

-- Exercise 13
-- Exercise 14
-- Exercise 15
-- Exercise 16
-- Exercise 17
-- Exercise 18
-- Exercise 19
-- Exercise 20
-- Exercise 21
-- Exercise 22
-- Exercise 23
-- Exercise 24
-- Exercise 27
-- Exercise 29
-- Exercise 10
-- Exercise 10
-- Exercise 10
-- Exercise 10
-- Exercise 10



-- Exercise 10
-- Exercise 10
V
-- Exercise 10
-- Exercise 10
-- Exercise 10
-- Exercise 10


