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
-- Write a SQL query to retrieve the details of the customers whose names begins
-- with the letter 'B'.

SELECT *
FROM
  [dbo].[customer]
WHERE
  [cust_name] LIKE 'B%'

-- Exercise 10
-- Write a SQL query to find the details of the customers whose names end with
-- the letter 'n'.

SELECT *
FROM
  [dbo].[customer]
WHERE
  [cust_name] LIKE '%N'

-- Exercise 11
-- Write a SQL query to find the details of those salespeople whose names begin
-- with ‘N’ and the fourth character is 'l'. Rests may be any character.

SELECT *
FROM
  [dbo].[salesman]
WHERE
  [name] LIKE 'N__L%'

-- Exercise 12
-- Write a SQL query to find those rows where col1 contains the escape
-- character underscore ( _ ).

CREATE TABLE [dbo].[testtable] (
  [col1] CHAR(30)
)

INSERT INTO
  [dbo].[testtable]
VALUES
  ('A001/DJ-402\44_/100/2015'),
  ('A001_\DJ-402\44_/100/2015'),
  ('A001_DJ-402-2014-2015'),
  ('A002_DJ-401-2014-2015'),
  ('A001/DJ_401'),
  ('A001/DJ_402\44'),
  ('A001/DJ_402\44\2015'),
  ('A001/DJ-402%45\2015/200'),
  ('A001/DJ_402\45\2015%100'),
  ('A001/DJ_402%45\2015/300'),
  ('A001/DJ-402\44')

SELECT *
FROM
  [dbo].[testtable]
WHERE
  [col1] LIKE '%!_%' ESCAPE '!'

-- Exercise 13
-- Write a SQL query to identify those rows where col1 does not contain the
-- escape character underscore ( _ ).

SELECT *
FROM
  [dbo].[testtable]
WHERE
  [col1] NOT LIKE '%!_%' ESCAPE '!'

-- Exercise 14
-- Write a SQL query to find rows in which col1 contains the forward slash
-- character ( / ).

SELECT *
FROM
  [dbo].[testtable]             -- ESCAPE means that sign assigned after it is
WHERE                           -- used to as a prefix of one char in order to
  [col1] LIKE '%!/%' ESCAPE '!' -- ignore the wildcard operator. Its value is
                                -- optional (can be "!", "/" OR "\")
-- Exercise 15
-- Write a SQL query to identify those rows where col1 does not contain the
-- forward slash character ( / ).

SELECT *
FROM
  [dbo].[testtable]
WHERE
  [col1] LIKE '%!/%' ESCAPE '!'

-- Exercise 16
-- Write a SQL query to find those rows where col1 contains the string ( _/ ).

SELECT *
FROM
  [dbo].[testtable]
WHERE
  [col1] LIKE '%!_!/%' ESCAPE '!'

-- Exercise 17
-- Write a SQL query to find those rows where col1 does not contain the string ( _/ ).

SELECT *
FROM
  [dbo].[testtable]
WHERE
  [col1] LIKE '%!_!/%' ESCAPE '!'

-- Exercise 18
-- Write a SQL query to find those rows where col1 contains the character percent ( % ).

SELECT *
FROM
  [dbo].[testtable]
WHERE
  [col1] LIKE '%!%%' ESCAPE '!';

-- Exercise 19
-- Write a SQL query to find those rows where col1 does not contain the
-- character percent ( % ).

SELECT *
FROM
  [dbo].[testtable]
WHERE
  [col1] NOT LIKE '%!%%' ESCAPE '!';

-- Exercise 20
-- Write a SQL query to find all those customers who does not have any grade.

SELECT *
FROM
  [dbo].[customer]
WHERE
  [grade] IS NULL

-- Exercise 21
-- rite a SQL query to locate all customers with a grade value.

SELECT *
FROM
  [dbo].[customer]
WHERE
  [grade] IS NOT NULL

-- Exercise 22
-- Write a SQL query to locate the employees whose last name begins with the letter 'D'.

SELECT *
FROM
  [dbo].[emp_details]
WHERE
  [EMP_LNAME] LIKE 'D%'