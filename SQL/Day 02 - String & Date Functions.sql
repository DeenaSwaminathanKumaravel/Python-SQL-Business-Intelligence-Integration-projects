-- Constraints and Modifcations
CREATE TABLE Students(
	name VARCHAR(40),
    Id INT,
    SecID INT,
    email VARCHAR(50) NOT NULL,
    
    PRIMARY KEY(Id, SecID)
);

ALTER TABLE Students 
	DROP PRIMARY KEY,
	ADD PRIMARY KEY(Id),
    ADD UNIQUE KEY (SecID);

DROP TABLE IF EXISTS Students ;

-- Denormalization examples
SELECT * FROM employee;

SELECT * FROM employee a
LEFT JOIN department b ON a.DepartmentID = b.DepartmentID;


Select * from employee;

ALTER TABLE employee
-- ADD DepartmentID_b int,
ADD DepartmentName VARCHAR(20);

ALTER TABLE employee
DROP DepartmentID_b, 
DROP DepartmentName;

SET SQL_SAFE_UPDATES = 0;

select * from employee;

UPDATE employee a
LEFT JOIN department b ON a.DepartmentID = b.DepartmentID
SET b.DepartmentName = b.DepartmentName
WHERE a.DepartmentID IS NOT NULL;

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE employee
DROP DepartmentName; 

insert into department 
values(106, "Analytics");

-- Rollback
UPDATE employee
SET Email = 'thisemailisatest2@email.com' WHERE EmployeeID = 1;

ROLLBACK;
COMMIT;

-- Dropping a column and rolling back uusing transcation

START TRANSACTION;

ALTER TABLE employee
DROP ManagerID;

ROLLBACK;

-- String Functions

-- concatenate
select concat(FirstName, " ", UPPER(LastName)) FullName, FirstName, LastName from employee;

-- using substring for Proper()

select 
concat(
concat(lcase( substring(FirstName, 1, 1)), ucase( substring(FirstName, 2, char_length(FirstName)))), " ", -- Firstname

concat(lcase( substring(LastName, 1, 1)), ucase( substring(LastName, 2, char_length(LastName)))) -- Lastname
) FullName, FirstName, LastName

from employee; 

select Email, length(Email) from employee;
-- using position on subtring to inmitate delimiter as "@"

select Email, 
	substring(Email, 1, position("@" IN Email)-1 ) as emailname, 
	substring(Email, position("@" in Email)+ 1, char_length(Email)) as DomainName
from employee;

select Email, substring(Email, 1, instr(Email, "@") ) from employee; 	

select Salary, format(Salary, 1) as format_fn from employee; 

select * from employee;


select DateofBirth, abs((datediff(DateofBirth, CURDATE())/365)) from employee e; 

-- Floor
select DateofBirth, floor(abs((datediff(DateofBirth, CURDATE())/365))) from employee e; 


-- Date Functions --

select * from employee;

select date_format(DateOfBirth, "%b-%y") from employee e order by DateOfBirth desc; 


select * from employee e ;

select DateOfBirth, Date(concat( year(DateOfBirth),  "-", month(DateOfBirth), "-", 1)) as Firstday,
	date_add(Date(concat( year(DateOfBirth),  "-", month(DateOfBirth), "-", 1)), interval 1 month) as NextMonth 
from employee e ; 

--  using dateadd and datesub

select date_add(DateOfBirth, interval 10 day) as d_add, 
	date_sub(DateOfBirth, interval 10 day) as d_sub,
	date_add(DateOfBirth, interval -10 day) as d_sub_using_add, 
	date_sub(DateOfBirth, interval +10 day) as d_sub_using_sub,
	DateOfBirth from employee; 


select last_day(DateOfBirth) as lastday, 
Date(concat(year(DateOfBirth), "-", month(DateOfBirth),"-", "1")) as firstday, 
DateOfBirth from employee;

-- (OR)

select last_day(DateOfBirth) as lastday, 
date(date_format(DateOfBirth, "%Y-%m-01")) firstday, 
DateOfBirth from employee;

select dayname(DateOfBirth), DateOfBirth from employee; 



