\list

-- give me a list of all employees in the company
SELECT *
FROM Employees;

-- give how many departments in the company
SELECT *
FROM departments;

-- changing column names
SELECT emp_no AS "Employee #", birth_date AS "Birthday", first_name as "First Name"
FROM Employees;

-- column concatenation
SELECT concat(emp_no, ' is a ', title) AS "Employee Title"
FROM titles;

SELECT concat(first_name, ' ', last_name) AS "Employee Name"
FROM employees;

-- Aggregate Functions in sql
-- count records
SELECT count(emp_no)
FROM employees;

-- select max
SELECT max(salary)
FROM salaries;

-- Get Total Amount
SELECT sum(salary)
FROM salaries;

-- Average Salary
SELECT avg(salary)
FROM salaries;

-- youngest person in the company
SELECT max(birth_date)
FROM employees;

-- how many towns are there in franc
SELECT count(id)
FROM towns;

-- Count Official languages in the world
select count(countrycode)
from countrylanguage
where isofficial = true;

-- Average life expectancy in the world
SELECT avg(lifeexpectancy)
FROM country;

-- Average population for cities in the netherlands
SELECT avg(population)
FROM city
WHERE countrycode = 'NLD';


-- select with where conditions
SELECT first_name, last_name
FROM employees
-- Filter on first and last name
WHERE first_name = 'Mayumi'
  AND last_name = 'Schueller';


-- Get all female employees
SELECT first_name
FROM employees
WHERE gender = 'F';

-- Multiple searching criteria
-- AND OR
SELECT first_name, last_name, hire_date
FROM employees
WHERE (first_name = 'Georgi' AND last_name = 'Facello'
    AND hire_date = '1986-06-26')
   OR (first_name = 'Bezalel');

-- filter exercise
-- How many female customers we have from OR and NY
SELECT count(firstname) AS "Female Employees"
FROM customers
WHERE gender = 'F'
  AND (state = 'OR' OR state = 'NY');

-- Not Keyword
SELECT firstname, gender
from customers
WHERE NOT gender = 'M';

-- customers not 55
SELECT count(firstname) AS "Not 55"
from customers
WHERE NOT age = 55;

-- comparison operators
-- who over age of 44 and has an income of 100000?
SELECT first_name, last_name, gender, age, income
FROM employees
WHERE age > 44
  AND income < 100000;

-- Female customers from OR
SELECT firstname, gender, state
from customers
WHERE gender = 'F'
  AND state = 'OR';


-- What is the average income between the ages of 20 and 50?
SELECT avg(income) AS "AVERAGE INCOME"
from customers
where age > 20
  AND age < 50;

-- operator precedence
SELECT state, gender
FROM customers
WHERE (state = 'OR' OR state = 'NY')
  AND gender = 'F';

-- two filters
SELECT firstname, lastname, gender, age, income
FROM customers
WHERE (
                income > 100000 AND state = 'NY'
        OR (
                        (age > 20 AND age < 30)
                        AND income <= 20000
                    )
    )
  AND gender = 'F';

-- * Select people either under 30 or over 50 with an income above 50000
-- * Include people that are 50
-- * that are from either Japan or Australia
SELECT firstname, age, country, income
from customers
WHERE (age < 30 OR age >= 50)
  AND income > 50000
  AND (country = 'Japan' OR country = 'Australia');

--What was our total sales in June of 2004 for orders over 100 dollars
SELECT sum(totalamount)
from orders
WHERE (orderdate >= '2004-06-01' AND orderdate <= '2004-06-30')
  AND totalamount > 100;

-- IS keyword
SELECT firstname, lastname, age FROM customers
WHERE firstname IS  NOT NULL;

-- NULL coalesce
SELECT coalesce(firstname, 'noname') AS "GG" FROM customers;

-- WITH SUM
SELECT sum(coalesce(age, 20)) FROM customers;

