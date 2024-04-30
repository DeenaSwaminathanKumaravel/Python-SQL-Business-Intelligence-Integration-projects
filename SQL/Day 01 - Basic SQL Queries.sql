
use data_analytics_duo;

SHOW COLUMNS FROM employee;
SELECT * FROM employee;
SELECT * FROM department;

-- Q.1 - Select the ‘name’ of all the employees.

SELECT FirstName, LastName FROM employee;

-- Q.2 Select the ‘name’ of all the employees where age > 30.

SELECT *, ROUND(DATEDIFF(CURDATE(), DateofBirth)/365, 2) Age FROM employee 
WHERE ROUND(DATEDIFF(CURDATE(), DateofBirth)/365, 2) > 30;

-- Q.3 Select the ‘name’ of all the employees where age>30 and department in 'Sales'.

SELECT a.FirstName, a.LastName, (ROUND(DATEDIFF(CURDATE(), a.DateofBirth), 2)/365) Age FROM employee a
LEFT JOIN department b ON a.DepartmentID = b.DepartmentID
WHERE (ROUND(DATEDIFF(CURDATE(), a.DateofBirth), 2)/365) > 30 AND b.DepartmentName = 'Sales';


-- Q.4 Select the ‘name’ of all the employees where age > 30 and department in Sales and Marketing

SELECT a.FirstName, a.LastName, (ROUND(DATEDIFF(CURDATE(), a.DateofBirth), 2)/365) Age, b.DepartmentName FROM employee a
LEFT JOIN department b ON a.DepartmentID = b.DepartmentID
WHERE (ROUND(DATEDIFF(CURDATE(), a.DateofBirth), 2)/365) > 30 AND (b.DepartmentName = 'Sales' OR b.DepartmentName = 'Marketing');

-- OR

SELECT a.FirstName, a.LastName, (ROUND(DATEDIFF(CURDATE(), a.DateofBirth), 2)/365) Age, b.DepartmentName FROM employee a
LEFT JOIN department b ON a.DepartmentID = b.DepartmentID
WHERE (ROUND(DATEDIFF(CURDATE(), a.DateofBirth), 2)/365) > 30 AND b.DepartmentName IN ('Sales','Marketing');


-- Q.5 Select the ‘name’ of all the employees with first names starting with 'J'.

SELECT * FROM employee WHERE FirstName LIKE 'J%';

-- Q.6 Find out the count of employees in each department.

SELECT b.DepartmentName Department_Name, COUNT(a.EmployeeID) Total_Employees
FROM employee a 	
LEFT JOIN department b ON a.DepartmentID = b.DepartmentID
GROUP BY b.DepartmentName;

-- Q.7 Find out the Total Salaries in each department

SELECT b.DepartmentName Department_Name, SUM(Salary) Total_Salaries
FROM employee a 
LEFT JOIN department b ON a.DepartmentID = b.DepartmentID
GROUP BY b.DepartmentName;

-- Q.8 Find the average age of all the employees working in the company

SELECT AVG(TIMESTAMPDIFF(YEAR, DateofBirth, CURDATE()))
FROM employee;

-- OR 

SELECT AVG(DATEDIFF(CURDATE(), DateofBirth)/365)
FROM employee;

-- Q.8 Find the average age of all the employees working in the company by department

SELECT b.DepartmentName, ROUND(AVG(DATEDIFF(CURDATE(), DateofBirth)/365), 2) Avg_age
FROM employee a
LEFT JOIN department b ON a.DepartmentID = b.DepartmentID
GROUP BY b.DepartmentName;

-- Q.9 Find the minimum salary for all the employees working in the company

SELECT EmployeeID, FirstName, LastName, Email, Salary
FROM employee
WHERE Salary = (SELECT MIN(Salary) FROM employee);

-- Q.10 Find the maximum salary for all the employees working in the company

SELECT EmployeeID, FirstName, LastName, Email, Salary
FROM employee
WHERE Salary = (SELECT MAX(Salary) FROM employee);

-- Q.11 Find the departments with more than two employees.

SELECT b.DepartmentName, COUNT(a.EmployeeID) Total_employees
FROM employee a 
LEFT JOIN department b ON a.DepartmentID = b.DepartmentID
GROUP BY b.DepartmentName
HAVING Total_employees > 2;

-- Q.12 Arrange the employees from youngest to oldest

SELECT * FROM employee ORDER BY DateofBirth DESC;


-- Q.13 Populate first 10 employees

SELECT * FROM employee LIMIT 10;
