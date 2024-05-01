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
SELECT * FROM data_analytics_duo.employee;

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

UPDATE employee a
LEFT JOIN department b ON a.DepartmentID = b.DepartmentID
SET a.DepartmentName = b.DepartmentName
WHERE a.DepartmentID IS NOT NULL;

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE employee
DROP DepartmentName; 

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



