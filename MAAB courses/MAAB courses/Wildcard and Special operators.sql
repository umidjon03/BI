-- Init
USE TASK1
GO

-- Exercise 1
-- Write a SQL query to find the details of those salespeople who come from the
-- 'Paris' City or 'Rome' City. Return salesman_id, name, city, commission.

SELECT *
FROM
  [dbo].[salesman]
WHERE
  [city] = 'Paris'
    OR
  [city] = 'Rome'
                  --OR
SELECT *
FROM
  [dbo].[salesman]
WHERE
  [city] IN ('paris', 'rome')

-- Exercise 2
-- Write a SQL query to find the details of the salespeople who come from
-- either 'Paris' or 'Rome'. Return salesman_id, name, city, commission.

-- The same with Exercise 1

-- Exercise 3
-- Write a SQL query to find the details of those salespeople who live in cities
-- other than Paris and Rome. Return salesman_id, name, city, commission

SELECT *
FROM
  [dbo].[salesman]
WHERE
  [city] NOT IN ('paris', 'rome')

-- Exercise 4
-- Write a SQL query to retrieve the details of all customers whose ID belongs
-- to any of the values 3007, 3008 or 3009. Return customer_id, cust_name,
-- city, grade, and salesman_id.

SELECT *
FROM
  [dbo].[customer]
WHERE
  [customer_id] IN (3007, 3008, 3009)

-- Exercise 5
-- Write a SQL query to find salespeople who receive commissions between 0.12 and 0.14
-- (begin and end values are included). Return salesman_id, name, city, and commission.

SELECT *
FROM
  [dbo].[salesman]
WHERE
  [comission] >= 0.12
    AND
  [comission] <= 0.14 -- BETWEEN operator can display the same result

-- Exercise 6
-- Write a SQL query to select orders between 500 and 4000 (begin and end values are
-- included). Exclude orders amount 948.50 and 1983.43. Return ord_no, purch_amt,
-- ord_date, customer_id, and salesman_id

SELECT *
FROM
  [dbo].[orders]
where 
  [purch_amt] BETWEEN 500 and 4000
    AND
  [purch_amt] NOT IN (948.50, 1983.43)

-- Exercise 7
-- Write a SQL query to retrieve the details of the salespeople whose names
-- begin with any letter between 'A' and 'L' (not inclusive). Return
-- salesman_id, name, city, commission.

SELECT *
FROM
  [dbo].[salesman]
WHERE
  [name] BETWEEN 'A' AND 'L'
			--OR
SELECT *
FROM
  [dbo].[salesman]
WHERE
  [name] LIKE '[A-K]%'

-- Exercise 8
-- Write a SQL query to find the details of all salespeople except those whose names
-- begin with any letter between 'A' and 'L' (not inclusive).

SELECT *
FROM
  [dbo].[salesman]
WHERE
  [name] NOT BETWEEN 'A' AND 'L'

-- OR

SELECT *
FROM
  [dbo].[salesman]
WHERE
  [name] LIKE '[^J-k]%'

-- Exercise 9



-- Exercise 10



-- Exercise 11



-- Exercise 12



-- Exercise 13



-- Exercise 14



-- Exercise 15



-- Exercise 16



-- Exercise 17



-- Exercise 18


