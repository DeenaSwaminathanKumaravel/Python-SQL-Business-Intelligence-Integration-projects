-- JOINS

select * from employee;

select * from department ;

-- Q.1 Find all employees, including those who are not assigned to any department.

select * from employee e
left join department d on e.DepartmentID = d.DepartmentID 
where d.DepartmentName is null;

-- Q.2 List all projects along with the names of their lead employees.

CREATE TABLE projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    LeadEmployeeID INT
);

select * from employee e 
right join projects p on e.EmployeeID  = p.LeadEmployeeID 

INSERT INTO projects (ProjectID, ProjectName, LeadEmployeeID) VALUES
(1, 'Project Alpha', 2),
(2, 'Project Beta', 4),
(3, 'Project Gamma', 6);  -- No such employee with ID 6



-- Q.3 Identify any employees that currently have no assigned departments.

select concat(e.FirstName, " ",  e.LastName) as Employee_name, e.Email from employee e 
left join department d on e.DepartmentID = d.DepartmentID 
where d.DepartmentName is null;

-- Q.3.1 Identify any departments that currently have no assigned employees.

select d.DepartmentID, d.DepartmentName  from department d
left join employee e on d.DepartmentID = e.DepartmentID
where e.FirstName is null;


-- INNER JOINS

-- Q.4 List all employees along with their department names.

select * from employee e 
inner join department d on d.DepartmentID = e.DepartmentID;



-- Q.5 List all employees who work in the 'Human Resources' department.

select * from employee e 
inner join department d on d.DepartmentID = e.DepartmentID
where d.DepartmentName = 'HR';


-- RIGHT JOIN

-- Q.6 Show a list of all departments, including those without any employees.

select * from employee e 
right join department d on d.DepartmentID = e.DepartmentID;

-- FULL JOINS

-- Q.7 Display all departments and their employees, including departments with no employees and employees with no departments.

select * from employee e 
left join department d on e.DepartmentID  = d.DepartmentID
union -- removing duplicates
select * from employee e 
right join department d on e.DepartmentID  = d.DepartmentID;

-- (OR)

select * from employee e 
left join department d on e.DepartmentID  = d.DepartmentID

union -- no duplicates to remove, but still will remove as we have used union not union all

select * from employee e 
right join department d on e.DepartmentID  = d.DepartmentID
where e.FirstName is null;

-- UNION

-- table creation

CREATE TABLE book_club (
  name VARCHAR(50),
	age int 
);

INSERT INTO book_club (name, age)
VALUES
  ('John', 32),
  ('Sarah', 30),
  ('Michael', 28),
	('Daisy', 29);

CREATE TABLE laughter_club (
  name VARCHAR(50),
	age int 
);

INSERT INTO laughter_club (name, age)
VALUES
  ('Emily', 31),
  ('Sarah', 30),
	('Jon', 28),
	('Michael', 28),
	('David', 33);
	

-- UNION and union all

select b.name as Name, b.age as Age
from book_club b
union
select lc.name as Name, lc.age as Age
from laughter_club lc 

select b.name as Name, b.age as Age
from book_club b
union all
select lc.name as Name, lc.age as Age
from laughter_club lc 


-- Case statement

-- Example 1: Categorizing Employees by Salary Range:

SELECT
	FirstName,
	LastName,
	Salary,
	CASE
		WHEN Salary BETWEEN 50000 AND 55000 THEN '50k-55k'
		WHEN Salary BETWEEN 55001 AND 60000 THEN '56k-60k'
		WHEN Salary BETWEEN 60001 AND 63000 THEN '61k-63k'
		ELSE '>63k'
	END AS Salary_Range
FROM employee;

-- Example 2: Creating a Custom Employee Status:

SELECT
	FirstName,
	LastName,
	Salary,
	CASE
		WHEN Salary BETWEEN 50000 AND 55000 THEN '50k-55k'
		WHEN Salary BETWEEN 55001 AND 60000 THEN '56k-60k'
		WHEN Salary BETWEEN 60001 AND 63000 THEN '61k-63k'
		ELSE '>63k'
	END AS Salary_Range,
	
	CASE
		WHEN Salary BETWEEN 50000 AND 55000 THEN 'Average'
		WHEN Salary BETWEEN 55001 AND 60000 THEN 'Above Average'
		WHEN Salary BETWEEN 60001 AND 63000 THEN 'Good'
		ELSE 'High'
	END AS Salary_Status
FROM employee;


-- Example 3: Calculating the Total Salary Expenditure by Department with Categories:

select d.DepartmentName , 
CASE
	WHEN e.Salary BETWEEN 50000 AND 55000 THEN 'Average'
	WHEN e.Salary BETWEEN 55001 AND 60000 THEN 'Above Average'
	WHEN e.Salary BETWEEN 60001 AND 63000 THEN 'Good'
	ELSE 'High'
END AS Category,
sum(e.Salary) as Total_Expenditure
from employee e
left join department d on e.DepartmentID  = d.DepartmentID
group by d.DepartmentName, Category
order by Total_Expenditure desc;

-- Example 4: Counting Employees by Age Group:

select 
case 
	when timestampdiff(year , DateOfBirth, CURDATE()) between 20 and 25 then '20-25 years'
	when timestampdiff(year , DateOfBirth, CURDATE()) between 25 and 30 then '25-30 years'
	when timestampdiff(year , DateOfBirth, CURDATE()) > 30 then '>30 years'
end as Age_group,
count(FirstName) as Total_Employees
from employee e 
group by Age_group
order by Age_group desc;
	
	
	
