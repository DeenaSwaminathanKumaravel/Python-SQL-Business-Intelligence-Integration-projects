
-- Sub Queries
-- Orders which value is more than Average amoount

select * from orders
where OrderAmount > (select Avg(OrderAmount) from orders);

-- db

-- Creating the employees table
CREATE TABLE employees (
  id INT,
  name VARCHAR(50),
  department_id INT
);

-- Inserting data into the employees table
INSERT INTO employees (id, name, department_id)
VALUES
  (1, 'John', 1),
  (2, 'Sarah', 2),
  (3, 'Michael', 1),
  (4, 'Emily', 3);

-- Creating the salaries table
CREATE TABLE salaries (
  employee_id INT,
  salary INT
);

-- Inserting data into the salaries table
INSERT INTO salaries (employee_id, salary)
VALUES
  (1, 50000),
  (2, 60000),
  (3, 55000),
  (4, 45000);
 
 -- Find the name of employees whose salary is higher than the average salary
 
select
	e.name,
	s.salary
from
	employees e
left join salaries s on
	e.id = s.employee_id
where
	s.salary > (
	select
		avg(s.salary)
	from
		salaries s);


-- Common Table Expressions (CTE's)
	

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Department VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, Name, Role, Department) VALUES
(1, 'Alice', 'Developer', 'IT'),
(2, 'Bob', 'Designer', 'Design'),
(3, 'Charlie', 'Manager', 'IT'),
(4, 'Daisy', 'Developer', 'IT'),
(5, 'Ethan', 'Designer', 'Design');

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    LeadEmployeeID INT,
    StartDate DATE,
    EndDate DATE
);

INSERT INTO Projects (ProjectID, ProjectName, LeadEmployeeID, StartDate, EndDate) VALUES
(101, 'Website Redesign', 2, '2024-01-01', '2024-03-30'),
(102, 'New Product Launch', 3, '2024-02-15', '2024-05-30'),
(103, 'Data Migration', 1, '2024-01-20', '2024-04-20'),
(104, 'Mobile App Development', 4, '2024-04-01', '2024-08-30'),
(105, 'Cloud Infrastructure Setup', 3, '2024-03-20', '2024-07-20'),
(106, 'Brand Redesign', 2, '2024-05-15', '2024-09-15'),
(107, 'E-commerce Platform Upgrade', 1, '2024-06-01', '2024-10-31'),
(108, 'Data Analytics Implementation', 5, '2024-04-10', '2024-12-10');
	
	
 
-- Question 1: Which employees are leading projects?

-- with joins

select distinct e.name Name from employees e 
left join projects p on e.EmployeeID = p.LeadEmployeeID

-- (or)

--  without using joins
select e.name Name from employees e 
where EmployeeID in (select p.LeadEmployeeID from projects p)

-- with CTE and subquery

with n_projects as
(
select distinct p.LeadEmployeeId ID from projects p
)
select e.name from employees e where e.EmployeeID in (select * from n_projects);


-- Question 2: Find the departments with project leaders.

with new_dept as
(
select p.ProjectID, p.ProjectName, e.name ProjectLead from employees e 
inner join projects p on e.EmployeeID = p.LeadEmployeeID
)
select n.ProjectName Project_name, n.ProjectLead Lead_name, coalesce(d.DepartmentName, "Not Identified") Department_Name from new_dept n
left join department d on n.projectID = d.DepartmentID 


-- Question 3: List all projects that have a longer duration than the average project duration.

with new_projects as
(
select projectName, StartDate, EndDate, Timestampdiff(day, StartDate,  EndDate) Duration from projects
)
select * from new_projects
where Duration > (select avg(Duration) from new_projects);

-- Question 4: Identify employees who are not involved in any projects.



with n_projects as
(
select distinct p.LeadEmployeeId ID from projects p
)
select e.name from employees e where e.EmployeeID not in (select * from n_projects);



-- Question 5: What is the total number of projects led by each department?
 

