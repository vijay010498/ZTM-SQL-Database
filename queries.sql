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
SELECT concat(emp_no, ' is a ', title) AS "Employee Title" FROM titles;

SELECT concat(first_name, ' ', last_name) AS "Employee Name" FROM employees;

-- Functions in sql