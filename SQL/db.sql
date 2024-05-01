-- Create Department table
CREATE TABLE Department (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50) NOT NULL
);
INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
(101, 'Sales'),
(102, 'Marketing'),
(103, 'HR'),
(104, 'Finance'),
(105, 'IT');

-- employee table

CREATE TABLE employee (
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
DateOfBirth DATE,
DepartmentID INT,
Salary DECIMAL(10, 2),
ManagerID INT,
HireDate DATE,
Address VARCHAR(100),
Email VARCHAR(100)
);

INSERT INTO employee (EmployeeID, FirstName, LastName, Gender, DateOfBirth, DepartmentID, Salary, ManagerID, HireDate, Address, Email)
VALUES
(1, 'Amit', 'Sharma', 'M', '1990-05-15', 101, 60000.00, 0, '2015-03-10', 'Delhi, India', 'amit.sharma@email.com'),
(2, 'Sneha', 'Patel', 'F', '1988-08-20', 101, 55000.00, 1, '2010-11-12', 'Mumbai, India', 'sneha.patel@email.com'),
(3, 'Raj', 'Kumar', 'M', '1995-12-02', 102, 58000.00, 1, '2013-06-25', 'Bangalore, India', 'raj.kumar@email.com'),
(4, 'Priya', 'Verma', 'F', '1992-07-18', 103, 62000.00, 2, '2017-08-30', 'Kolkata, India', 'priya.verma@email.com'),
(5, 'Sanjay', 'Gupta', 'M', '1991-03-25', 102, 61000.00, 2, '2012-04-15', 'Chennai, India', 'sanjay.gupta@email.com'),
(6, 'Neha', 'Singh', 'F', '1994-10-10', 101, 56000.00, 1, '2014-09-05', 'Hyderabad, India', 'neha.singh@email.com'),
(7, 'Vikram', 'Yadav', 'M', '1989-06-29', 103, 63000.00, 2, '2018-03-18', 'Pune, India', 'vikram.yadav@email.com'),
(8, 'Sunita', 'Mishra', 'F', '1993-02-14', 102, 59000.00, 3, '2016-05-20', 'Ahmedabad, India', 'sunita.mishra@email.com'),
(9, 'Rahul', 'Shukla', 'M', '1997-09-08', 101, 58000.00, 1, '2019-11-10', 'Jaipur, India', 'rahul.shukla@email.com'),
(10, 'Shreya', 'Pandey', 'F', '1996-04-17', 102, 60000.00, 3, '2018-08-25', 'Lucknow, India', 'shreya.pandey@email.com'),
(11, 'Vishal', 'Garg', 'M', '1998-01-22', 103, 59000.00, 2, '2017-10-01', 'Nagpur, India', 'vishal.garg@email.com'),
(12, 'Anita', 'Yadav', 'F', '1990-07-12', 101, 57000.00, 1, '2016-09-12', 'Bhopal, India', 'anita.yadav@email.com'),
(13, 'Sandeep', 'Verma', 'M', '1991-11-05', 102, 61000.00, 3, '2018-07-23', 'Kanpur, India', 'sandeep.verma@email.com'),
(14, 'Meena', 'Choudhury', 'F', '1993-08-26', 103, 64000.00, 4, '2019-02-15', 'Vadodara, India', 'meena.choudhury@email.com'),
(15, 'Rajesh', 'Jain', 'M', '1995-06-15', 101, 58000.00, 2, '2016-11-30', 'Nashik, India', 'rajesh.jain@email.com'),
(16, 'Pooja', 'Yadav', 'F', '1988-09-09', 102, 60000.00, 3, '2015-05-10', 'Thane, India', 'pooja.yadav@email.com'),
(17, 'Deepak', 'Sharma', 'M', '1996-04-02', 101, 62000.00, 4, '2017-03-19', 'Surat, India', 'deepak.sharma@email.com'),
(18, 'Kavita', 'Das', 'F', '1987-12-04', 103, 63000.00, 4, '2018-09-28', 'Ludhiana, India', 'kavita.das@email.com'),
(19, 'Rahul', 'Khanna', 'M', '1994-03-07', 102, 57000.00, 2, '2015-12-15', 'Agra, India', 'rahul.khanna@email.com'),
(20, 'Sarita', 'Sharma', 'F', '1999-02-18', 101, 59000.00, 1, '2016-08-14', 'Kota, India', 'sarita.sharma@email.com'),
(21, 'Manoj', 'Gupta', 'M', '1985-10-31', 102, 60000.00, 1, '2014-04-22', 'Kochi, India', 'manoj.gupta@email.com'),
(22, 'Savita', 'Chopra', 'F', '1986-08-23', 101, 60000.00, 2, '2017-10-29', 'Mysore, India', 'savita.chopra@email.com'),
(23, 'Rakesh', 'Malik', 'M', '1997-05-27', 103, 63000.00, 4, '2015-03-03', 'Visakhapatnam, India', 'rakesh.malik@email.com'),
(24, 'Lalita', 'Nair', 'F', '1998-09-12', 101, 56000.00, 3, '2016-01-08', 'Patna, India', 'lalita.nair@email.com'),
(25, 'Rajat', 'Rao', 'M', '1990-11-30', 102, 60000.00, 2, '2017-07-21', 'Noida, India', 'rajat.rao@email.com'),
(26, 'Shanti', 'Mishra', 'F', '1991-07-05', 101, 59000.00, 3, '2014-12-09', 'Ghaziabad, India', 'shanti.mishra@email.com'),
(27, 'Surya', 'Kumar', 'M', '1995-03-02', 103, 64000.00, 1, '2016-10-14', 'Faridabad, India', 'surya.kumar@email.com'),
(28, 'Neelam', 'Sharma', 'F', '1989-12-08', 101, 61000.00, 4, '2013-09-18', 'Varanasi, India', 'neelam.sharma@email.com'),
(29, 'Ramesh', 'Rajput', 'M', '1994-01-14', 102, 62000.00, 2, '2019-05-27', 'Ranchi, India', 'ramesh.rajput@email.com'),
(30, 'Divya', 'Yadav', 'F', '1993-06-21', 101, 59000.00, 3, '2018-04-20', 'Bhubaneswar, India', 'divya.yadav@email.com'),
(31, 'Alok', 'Verma', 'M', '1988-04-15', 102, 58000.00, 1, '2015-08-10', 'Guwahati, India', 'alok.verma@email.com'),
(32, 'Kirti', 'Bose', 'F', '1992-02-27', 101, 62000.00, 3, '2016-07-11', 'Chandigarh, India', 'kirti.bose@email.com'),
(33, 'Arvind', 'Shukla', 'M', '1999-03-10', 103, 60000.00, 2, '2019-10-15', 'Coimbatore, India', 'arvind.shukla@email.com'),
(34, 'Neha', 'Yadav', 'F', '1996-07-04', 101, 61000.00, 1, '2017-04-22', 'Madurai, India', 'neha.yadav.email.com'),
(35, 'Rajeev', 'Bhat', 'M', '1994-08-30', 102, 58000.00, 3, '2016-12-10', 'Jamshedpur, India', 'rajeev.bhat@email.com'),
(36, 'Smita', 'Garg', 'F', '1995-01-23', 101, 59000.00, 4, '2018-11-25', 'Allahabad, India', 'smita.garg@email.com'),
(37, 'Vineet', 'Sinha', 'M', '1991-09-01', 103, 62000.00, 2, '2014-07-10', 'Srinagar, India', 'vineet.sinha@email.com'),
(38, 'Kusum', 'Agarwal', 'F', '1990-06-11', 101, 57000.00, 3, '2017-09-15', 'Amritsar, India', 'kusum.agarwal@email.com'),
(39, 'Ashish', 'Mehra', 'M', '1997-04-07', 102, 60000.00, 1, '2019-03-18', 'Kochi, India', 'ashish.mehra@email.com'),
(40, 'Anjali', 'Bajaj', 'F', '1992-12-19', 101, 60000.00, 2, '2018-08-12', 'Pondicherry, India', 'anjali.bajaj@email.com'),
(41, 'Vinod', 'Nagpal', 'M', '1989-03-08', 101, 58000.00, 3, '2017-04-25', 'Rajkot, India', 'vinod.nagpal@email.com'),
(42, 'Shikha', 'Gandhi', 'F', '1988-07-27', 103, 59000.00, 4, '2015-01-19', 'Nagpur, India', 'shikha.gandhi@email.com'),
(43, 'Mukesh', 'Saxena', 'M', '1993-02-10', 101, 61000.00, 1, '2016-06-15', 'Dhanbad, India', 'mukesh.saxena@email.com'),
(44, 'Geeta', 'Sarin', 'F', '1996-01-31', 102, 59000.00, 2, '2019-09-20', 'Gorakhpur, India', 'geeta.sarin@email.com'),
(45, 'Manish', 'Agarwal', 'M', '1998-05-16', 103, 62000.00, 3, '2018-11-05', 'Warangal, India', 'manish.agarwal@email.com'),
(46, 'Anurag', 'Raj', 'M', '1995-11-29', 101, 57000.00, 2, '2016-12-30', 'Hubli, India', 'anurag.raj@email.com'),
(47, 'Swati', 'Seth', 'F', '1994-10-03', 101, 56000.00, 4, '2017-05-22', 'Durgapur, India', 'swati.seth@email.com'),
(48, 'Pawan', 'Kapoor', 'M', '1997-03-12', 102, 60000.00, 1, '2018-02-15', 'Kolhapur, India', 'pawan.kapoor@email.com'),
(49, 'Ankita', 'Rai', 'F', '1990-08-19', 101, 59000.00, 1, '2017-09-08', 'Mathura, India', 'ankita.rai@email.com'),
(50, 'Arjun', 'Mishra', 'M', '1988-12-25', 106, 63000.00, 2, '2016-03-20', 'Panipat, India', 'arjun.mishra@email.com');