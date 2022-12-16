-- init
-- Scripts and variables have been typed with full version of them for
-- their readability and flexibility (to another server)

-- NOTE: Before execute this commands, execute the "pre data" file which located
-- in the current folder to get the database and table which is used below

USE [w3resource]
GO

-- Exercise 1
-- Write a SQL statement that displays all the information about all salespeople.

SELECT *
FROM
  [dbo].[salesman]

-- Exercise 2
-- Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution".

SELECT 'This is SQL Exercise, Practice and Solution' -- Presents as a table
-- OR
PRINT 'This is SQL Exercise, Practice and Solution' -- Presents as a just text

-- Exercise 3
-- Write a SQL query to display three numbers in three columns.

SELECT 1, 2, 3

-- Exercise 4
-- Write a SQL query to display the sum of two numbers 10 and 15 from the RDBMS server.

SELECT 10+15 AS [Result] -- The alias name is up to you (you can pass it)

-- Exercise 5
-- Write an SQL query to display the result of an arithmetic expression.

SELECT 9/3*6 AS [Result]

-- Exercise 6
-- Write a SQL statement to display specific columns such as names and commissions
-- for all salespeople.

SELECT
  [name], [comission]
FROM
  [dbo].[salesman]

-- Exercise 7
-- Write a SQL statement to display specific columns such as names and commissions for all salespeople.

SELECT
  [ord_date],
  [salesman_id],
  [ord_no],
  [purch_amt]
FROM
  [dbo].[orders]

-- Exercise 8
-- Write a SQL query to identify the unique salespeople ID. Return salesman_id.

SELECT DISTINCT
  [salesman_id]
FROM
  [dbo].[orders]

-- Exercise 9
-- write a SQL query to locate salespeople who live in the city of 'Paris'. Return salesperson's name, city.

SELECT
  [name],
  [city]
FROM
  [dbo].[salesman]
WHERE
  [city]='paris' -- Case insensitive

-- Exercise 10
-- Write a SQL query to find customers whose grade is 200. Return customer_id,
-- cust_name, city, grade, salesman_id.

SELECT *
FROM
  [dbo].[customer]
WHERE
  [grade]=200

-- Exercise 11
-- Write a SQL query to find orders that are delivered by a salesperson with ID. 5001.
-- Return ord_no, ord_date, purch_amt.

SELECT
  [ord_no],
  [ord_date],
  [purch_amt]
FROM
  [dbo].[orders]
WHERE
  [salesman_id]=5001

-- Exercise 12
-- Write a SQL query to find the Nobel Prize winner(s) for the year 1970. Return year, subject and winner.

SELECT
  [YEAR],
  [SUBJECT],
  [WINNER]
FROM
  [dbo].[nobel_win]
WHERE
  [YEAR]=1970

-- Exercise 13
-- Write a SQL query to find the Nobel Prize winner in ‘Literature’ for 1970.

SELECT
  [WINNER]
FROM
  [dbo].[nobel_win]
WHERE
  [YEAR]=1970 AND [SUBJECT]='Literature'

-- Exercise 14
-- Write a SQL query to locate the Nobel Prize winner ‘Dennis Gabor'. Return year, subject.

SELECT
  [YEAR],
  [SUBJECT]
FROM
  [dbo].[nobel_win]
WHERE
  [WINNER]='DENNIS GABOR'

-- Exercise 15
-- Write a SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner.

SELECT
  [WINNER]
FROM
  [dbo].[nobel_win]
WHERE
  [SUBJECT]='PHYSICS' AND [YEAR]>1950

-- Exercise 16
-- write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975.
-- Begin and end values are included. Return year, subject, winner, and country.

SELECT
  [YEAR],
  [SUBJECT],
  [WINNER],
  [COUNTRY]
FROM
  [dbo].[nobel_win]
WHERE
  [SUBJECT]='Chemistry' 
	AND [YEAR] BETWEEN 1970 AND 1971
	           --OR (Optimal way)
SELECT
  [YEAR],
  [SUBJECT],
  [WINNER],
  [COUNTRY]
FROM
  [dbo].[nobel_win]
WHERE
  [SUBJECT]='Chemistry' AND [YEAR] >= 1965 AND [YEAR] <= 1975

-- Exercise 17
-- Write a SQL query to display all details of the Prime Ministerial winners after
-- 1972 of Menachem Begin and Yitzhak Rabin.

SELECT *
FROM
  [dbo].[nobel_win]
WHERE
  [YEAR] > 1972 AND WINNER IN ('Menachem Begin', 'Yitzhak Rabin')

-- Exercise 18
-- Write a SQL query to retrieve the details of the winners whose first names match with the
-- string ‘Louis’. Return year, subject, winner, country, and category.

SELECT *
FROM
  [dbo].[nobel_win]
WHERE
  [WINNER] LIKE 'Louis %'

-- Exercise 19
-- Write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971.
-- Return year, subject, winner, country, and category.

SELECT *
FROM
  [dbo].[nobel_win]
WHERE
  ([SUBJECT] ='Physics' AND [YEAR]=1970)
    OR
	  ([SUBJECT] ='Economics' AND [YEAR]=1971)
                  --OR
SELECT *
FROM
  [dbo].[nobel_win]
WHERE
  ([SUBJECT] ='Physics' AND [YEAR]=1970)
    UNION
	  (SELECT *
	   FROM [dbo].[nobel_win]
	   WHERE [SUBJECT] ='Economics' AND [YEAR]=1971)

-- Exercise 20
-- Write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of
-- Physiology and Economics. Return year, subject, winner, country, and category.

SELECT *
FROM
  [dbo].[nobel_win]
WHERE
  [YEAR]=1970
	AND [SUBJECT] NOT IN ('Economics', 'Physiology')

-- Exercise 21
-- Write a SQL query to combine the winners in 'Physiology' before 1971 and winners in
-- 'Peace' on or after 1974. Return year, subject, winner, country, and category.

SELECT *
FROM
  [dbo].[nobel_win]
WHERE
  ([SUBJECT]='Physiology' AND [YEAR]<1971)
    UNION
	  (SELECT *
	   FROM [dbo].[nobel_win]
	   WHERE [SUBJECT]='Peace' AND [YEAR]>=1974)

-- Exercise 22
-- Write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'.
-- Return year, subject, winner, country, and category.

SELECT *
FROM
  [dbo].[nobel_win]
WHERE
  [WINNER]='Johannes Georg Bednorz'

-- Exercise 23
-- Write a SQL query to find Nobel Prize winners for the subject that does not begin with
-- the letter 'P'. Return year, subject, winner, country, and category. Order the result
-- by year, descending and winner in ascending. 

SELECT *
FROM 
  [dbo].[nobel_win]
WHERE
  [WINNER] NOT LIKE 'P%'
ORDER BY
  [YEAR] DESC, [WINNER] ASC -- Putting ASC is not required since it is default 

-- Exercise 24
-- Write a SQL query to find the details of 1970 Nobel Prize winners. Order the results by
-- subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end
-- of the result set. Return year, subject, winner, country, and category.

SELECT *
FROM
  [dbo].[nobel_win]
WHERE
  [YEAR]=1970
ORDER BY
  CASE
    WHEN [SUBJECT] NOT IN ('Chemistry', 'Economics')
	  THEN 0
	ELSE 1
  END,
  [SUBJECT]

-- Exerccise 25
-- Write a SQL query to select a range of products whose price is in the range Rs.200 to Rs.600.
-- Begin and end values are included. Return pro_id, pro_name, pro_price, and pro_com.

SELECT *
FROM
  [dbo].[item_mast]
WHERE
  [PRO_PRICE] >= 200
    AND [PRO_PRICE] <= 600 -- Can use also 'BETWEEN' operator

-- Exercise 26
-- Write a SQL query to calculate the average price for a manufacturer code of 16. Return avg.

SELECT
  AVG([PRO_PRICE]) AS [Avarage price of the company with code of 16]
FROM
  [dbo].[item_mast]
WHERE
  [PRO_COM]=16

-- Exercise 27
-- Write a SQL query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.'

SELECT
  [PRO_NAME] AS [Item Name],
  [PRO_PRICE] AS [Price in Rs.]
FROM
  [dbo].[item_mast]

-- Exercise 28
-- Write a SQL query to find the items whose prices are higher than or equal to $250.
-- Order the result by product price in descending, then product name in ascending.
-- Return pro_name and pro_price.

SELECT
  [PRO_NAME] AS [Item Name],
  [PRO_PRICE] AS [Price in Rs.]
FROM
  [dbo].[item_mast]
WHERE
  [PRO_PRICE] >= 250
ORDER BY
  [PRO_PRICE] DESC,
  [PRO_NAME]

-- Exercise 29
-- Write a SQL query to calculate average price of the items for each company.
-- Return average price and company code.

SELECT
  AVG([PRO_PRICE]) AS [Avarage Price],
  [PRO_COM]
FROM
  [dbo].[item_mast]
GROUP BY
  [PRO_COM]

-- Exercise 30
-- Write a SQL query to find the cheapest item(s). Return pro_name and, pro_price.

SELECT
  [PRO_NAME],
  [PRO_PRICE]
FROM
  [dbo].[item_mast]
WHERE
  [PRO_PRICE]=(
               SELECT
                 MIN([PRO_PRICE])
			   FROM
			     [dbo].[item_mast]
			   )

-- Exercise 31
-- Write a SQL query to find the unique last name of all employees. Return emp_lname.

SELECT DISTINCT
  [EMP_LNAME]
FROM
  [dbo].[emp_details]

-- Exercise 32
-- Write a SQL query to find the details of employees whose last name is 'Snares'.
-- Return emp_idno, emp_fname, emp_lname, and emp_dept.

SELECT *
FROM
  [dbo].[emp_details]
WHERE
  [EMP_LNAME]='Snares'

-- Exercise 33
-- Write a SQL query to retrieve the details of the employees who work in the
-- department 57. Return emp_idno, emp_fname, emp_lname and emp_dept.

SELECT *
FROM
  [dbo].[emp_details]
WHERE
  [EMP_DEPT]=57