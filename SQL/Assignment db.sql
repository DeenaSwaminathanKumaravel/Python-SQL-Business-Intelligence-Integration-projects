CREATE TABLE sales_data(
SaleID INT PRIMARY KEY,
ProductName VARCHAR(100),
Quantity INT,
SaleDate DATE,
SaleAmount DECIMAL(10,2),
CustomerName VARCHAR(100),
Region VARCHAR(50),
SalesRepID INT
);


INSERT INTO sales_data(SaleID, ProductName, Quantity, SaleDate, SaleAmount, CustomerName, Region, SalesRepID) VALUES
(1, 'Headphones' ,1, '2023-01-31' ,511.01, 'Jane Smith' , 'East' ,100),
(2, 'Monitor' ,3, '2023-03-18' ,213.63, 'Chris Green' , 'South' ,103),
(3, 'Smartwatch' ,4, '2023-04-01' ,1053.33, 'Sarah Davis' , 'East' ,102),
(4, 'Headphones' ,3, '2023-06-26' ,562.81, 'John Doe' , 'West' ,100),
(5, 'Keyboard' ,2, '2023-03-28' ,975.23, 'Nancy White' , 'South' ,101),
(6, 'Headphones' ,3, '2023-05-16' ,568.35, 'Sarah Davis' , 'West' ,100),
(7, 'Laptop' ,5, '2023-02-05' ,809.01, 'Jane Smith' , 'East' ,103),
(8, 'Laptop' ,3, '2023-01-30' ,363.02, 'Sarah Davis' , 'North' ,103),
(9, 'Laptop' ,1, '2023-05-05' ,576.43, 'Mike Brown' , 'South' ,103),
(10, 'Printer' ,5, '2023-04-17' ,848.35, 'Jane Smith' , 'North' ,101),
(11, 'Headphones' ,2, '2023-05-19' ,643.92, 'Sarah Davis' , 'East' ,102),
(12, 'Smartphone' ,5, '2023-04-04' ,1324.53, 'Steve Grey' , 'West' ,102),
(13, 'Monitor' ,2, '2023-06-02' ,380.15, 'Steve Grey' , 'West' ,104),
(14, 'Mouse' ,5, '2023-03-13' ,361.72, 'Steve Grey' , 'East' ,102),
(15, 'Mouse' ,2, '2023-04-07' ,574.13, 'Jane Smith' , 'South' ,101),
(16, 'Headphones' ,2, '2023-03-19' ,775.6, 'Jane Smith' , 'North' ,103),
(17, 'Printer' ,2, '2023-04-07' ,588.87, 'Mike Brown' , 'South' ,104),
(18, 'Monitor' ,4, '2023-02-01' ,122.41, 'Derek Lee' , 'South' ,102),
(19, 'Webcam' ,5, '2023-02-23' ,1065.98, 'Sarah Davis' , 'South' ,103),
(20, 'Smartphone' ,2, '2023-03-27' ,881.94, 'Alice Johnson' , 'East' ,104),
(21, 'Monitor' ,5, '2023-01-13' ,1451.85, 'Jane Smith' , 'East' ,102),
(22, 'Monitor' ,2, '2023-05-02' ,1084.47, 'Alice Johnson' , 'West' ,104),
(23, 'Webcam' ,1, '2023-03-19' ,1152.83, 'Mike Brown' , 'North' ,102),
(24, 'Monitor' ,1, '2023-06-13' ,1461.96, 'Derek Lee' , 'West' ,102),
(25, 'Mouse' ,5, '2023-02-02' ,1412.72, 'Chris Green' , 'East' ,100),
(26, 'Tablet' ,2, '2023-05-21' ,183.92, 'Steve Grey' , 'North' ,101),
(27, 'Keyboard' ,4, '2023-04-05' ,934.09, 'Alice Johnson' , 'North' ,105),
(28, 'Monitor' ,1, '2023-05-19' ,1003.39, 'Nancy White' , 'North' ,105),
(29, 'Monitor' ,1, '2023-03-14' ,1309.35, 'Sarah Davis' , 'West' ,103),
(30, 'Printer' ,4, '2023-06-08' ,310.9, 'Chris Green' , 'North' ,102),
(31, 'Printer' ,3, '2023-02-01' ,517.56, 'Jane Smith' , 'West' ,103),
(32, 'Smartwatch' ,4, '2023-06-25' ,1065.82, 'Nancy White' , 'North' ,102),
(33, 'Smartphone' ,2, '2023-02-26' ,1111.72, 'Jane Smith' , 'South' ,101),
(34, 'Printer' ,2, '2023-05-16' ,989.17, 'Sarah Davis' , 'North' ,102),
(35, 'Keyboard' ,1, '2023-03-14' ,1108.22, 'Nancy White' , 'West' ,104),
(36, 'Keyboard' ,4, '2023-04-23' ,177.88, 'Nancy White' , 'East' ,100),
(37, 'Tablet' ,4, '2023-01-11' ,687.28, 'Steve Grey' , 'East' ,104),
(38, 'Laptop' ,3, '2023-03-21' ,673.68, 'Mike Brown' , 'East' ,100),


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    SignUpDate DATE NOT NULL
);

CREATE TABLE Campaigns (
    CampaignID INT PRIMARY KEY,
    CampaignName VARCHAR(255) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Budget DECIMAL(10, 2) NOT NULL -- Adding Budget column
);


CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    CampaignID INT,
    SaleDate DATE NOT NULL,
    SaleAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CampaignID) REFERENCES Campaigns(CampaignID)
);

INSERT INTO Customers (CustomerID, Name, Email, SignUpDate) VALUES
(1, 'John Doe', 'johndoe@email.com', '2021-01-01'),
(2, 'Jane Smith', 'janesmith@email.com', '2021-02-12'),
(3, 'Ahmed Khan', 'ahmedkhan@email.com', '2021-03-23'),
(4, 'Maria Garcia', 'mariagarcia@email.com', '2021-04-15'),
(5, 'Chen Wei', 'chenwei@email.com', '2021-05-30'),
(6, 'Laura Jones', 'laurajones@email.com', '2021-06-19'),
(7, 'Amir Daei', 'amirdaei@email.com', '2021-07-22'),
(8, 'Sofia Rodriguez', 'sofiarodriguez@email.com', '2021-08-31'),
(9, 'Alex Johnson', 'alexjohnson@email.com', '2021-09-12'),
(10, 'Nia Davies', 'niadavies@email.com', '2021-10-28'),
(11, 'Oscar Martinez', 'oscarmartinez@email.com', '2021-11-30'),
(12, 'Leila Espinoza', 'leilaespinoza@email.com', '2022-01-15'),
(13, 'Ravi Patel', 'ravipatel@email.com', '2022-02-20'),
(14, 'Alice Brown', 'alicebrown@email.com', '2022-03-10'),
(15, 'Mohamed Farah', 'mohamedfarah@email.com', '2023-04-05');

INSERT INTO Campaigns (CampaignID, CampaignName, StartDate, EndDate, Budget) VALUES
(1, 'Spring Sale', '2022-03-01', '2022-03-31', 5000.00),
(2, 'Summer Bonanza', '2022-06-01', '2022-06-30', 7000.00),
(3, 'Back to School', '2022-08-10', '2022-09-10', 4500.00),
(4, 'Fall Fiesta', '2022-10-01', '2022-10-31', 4750.00),
(5, 'Holiday Deals', '2022-12-01', '2022-12-31', 9500.00),
(6, 'New Year New You', '2023-01-01', '2023-01-31', 5000.00),
(7, 'Valentine Specials', '2023-02-01', '2023-02-14', 3000.00),
(8, 'Spring Forward', '2023-03-01', '2023-03-31', 5200.00),
(9, 'Summer Kickoff', '2023-06-01', '2023-06-30', 6100.00),
(10, 'Independence Day Sale', '2023-07-04', '2023-07-14', 4300.00),
(11, 'Back to College', '2023-08-15', '2023-09-05', 4700.00),
(12, 'Halloween Horrors', '2023-10-01', '2023-10-31', 3800.00),
(13, 'Thanksgiving Thanks', '2023-11-20', '2023-11-27', 4600.00),
(14, 'Winter Wonderland', '2023-12-01', '2023-12-25', 8800.00),
(15, 'End of Year Extravaganza', '2023-12-26', '2024-01-05', 7500.00);

INSERT INTO Sales (SaleID, CustomerID, CampaignID, SaleDate, SaleAmount) VALUES
(1, 1, 1, '2022-03-05', 120.00),
(2, 2, 1, '2022-03-12', 250.00),
(3, 1, 2, '2022-06-15', 90.00),
(4, 3, 2, '2022-06-18', 150.00),
(5, 4, 3, '2022-08-25', 450.00),
(6, 5, 3, '2022-09-01', 120.00),
(7, 6, 4, '2022-10-15', 350.00),
(8, 7, 4, '2022-10-20', 200.00),
(9, 8, 5, '2022-12-20', 600.00),
(10, 9, 5, '2022-12-22', 400.00),
(11, 10, 6, '2023-01-25', 300.00),
(12, 11, 6, '2023-01-30', 150.00),
(13, 12, 7, '2023-02-14', 290.00),
(14, 13, 8, '2023-03-28', 310.00),
(15, 14, 9, '2023-06-20', 280.00),
(16, 15, 10, '2023-07-07', 200.00),
(17, 1, 10, '2023-07-09', 160.00),
(18, 2, 11, '2023-08-15', 500.00),
(19, 3, 11, '2023-08-20', 450.00),
(20, 4, 12, '2023-10-05', 300.00),
(21, 5, 12, '2023-10-07', 150.00),
(22, 6, 13, '2023-11-23', 400.00),
(23, 7, 13, '2023-11-25', 360.00),
(24, 8, 14, '2023-12-10', 500.00),
(25, 9, 14, '2023-12-15', 430.00),
(26, 10, 15, '2023-11-02', 320.00),
(27, 11, 1, '2022-03-15', 280.00),
(28, 12, 2, '2022-06-25', 350.00),
(29, 13, 3, '2022-08-30', 290.00),
(30, 14, 4, '2022-10-18', 310.00);

(39, 'Webcam' ,5, '2023-05-27' ,127.85, 'John Doe' , 'South' ,102),
(40, 'Headphones' ,4, '2023-01-03' ,801.67, 'Mike Brown' , 'East' ,101),
(41, 'Printer' ,4, '2023-04-14' ,1434.24, 'Sarah Davis' , 'West' ,104),
(42, 'Headphones' ,3, '2023-06-12' ,739.78, 'Jane Smith' , 'South' ,100),
(43, 'Headphones' ,4, '2023-04-12' ,1018.95, 'John Doe' , 'North' ,101),
(44, 'Keyboard' ,2, '2023-01-09' ,663.05, 'Nancy White' , 'West' ,102),
(45, 'Keyboard' ,1, '2023-02-28' ,1342.7, 'Chris Green' , 'East' ,100),
(46, 'Monitor' ,2, '2023-03-30' ,1233.82, 'Steve Grey' , 'East' ,104),
(47, 'Mouse' ,3, '2023-05-25' ,1135.88, 'Karen Black' , 'South' ,102),
(48, 'Printer' ,1, '2023-05-12' ,936.17, 'Nancy White' , 'North' ,101),
(49, 'Headphones' ,4, '2023-06-03' ,1102.29, 'Sarah Davis' , 'East' ,104),
(50, 'Keyboard' ,2, '2023-06-22' ,1233.45, 'Karen Black' , 'West' ,100),
(51, 'Tablet' ,5, '2023-02-15' ,1182.02, 'Nancy White' , 'North' ,103),
(52, 'Mouse' ,2, '2023-03-17' ,482.39, 'Derek Lee' , 'South' ,100),
(53, 'Keyboard' ,5, '2023-03-28' ,615.54, 'John Doe' , 'North' ,100),
(54, 'Mouse' ,2, '2023-05-06' ,318.25, 'Alice Johnson' , 'West' ,102),
(55, 'Smartphone' ,3, '2023-04-05' ,924.67, 'Mike Brown' , 'North' ,104),
(56, 'Mouse' ,1, '2023-01-05' ,759.96, 'Chris Green' , 'South' ,105),
(57, 'Laptop' ,5, '2023-01-04' ,572.38, 'Sarah Davis' , 'East' ,105),
(58, 'Tablet' ,2, '2023-01-27' ,114.03, 'Sarah Davis' , 'South' ,105),
(59, 'Monitor' ,4, '2023-06-25' ,232.23, 'Derek Lee' , 'South' ,104),
(60, 'Printer' ,5, '2023-04-06' ,1422.23, 'Mike Brown' , 'South' ,105),
(61, 'Keyboard' ,1, '2023-05-26' ,716.65, 'Alice Johnson' , 'East' ,104),
(62, 'Smartwatch' ,4, '2023-02-16' ,276.21, 'Steve Grey' , NULL ,104),
(63, 'Webcam' ,5, '2023-01-05' ,111.63, 'Alice Johnson' , 'South' ,102),
(64, 'Webcam' ,3, '2023-01-18' ,903.09, 'Derek Lee' , 'North' ,100),
(65, 'Monitor' ,1, '2023-05-23' ,554.82, 'Chris Green' , 'East' ,101),
(66, 'Smartphone' ,5, '2023-06-13' ,1498.23, 'Derek Lee' , 'South' ,102),
(67, 'Webcam' ,3, '2023-04-16' ,1424.93, 'Chris Green' , 'North' ,105),
(68, 'Headphones' ,1, '2023-01-27' ,945.31, 'Jane Smith' , 'South' ,103),
(69, 'Smartwatch' ,4, '2023-01-15' ,404.17, 'Chris Green' , 'North' ,101),
(70, 'Printer' ,5, '2023-03-29' ,208.89, 'Karen Black' , 'North' ,105),
(71, 'Monitor' ,3, '2023-03-09' ,218.5, 'Alice Johnson' , 'West' ,101),
(72, 'Smartphone' ,2, '2023-04-15' ,743.14, 'Nancy White' , 'South' ,105),
(73, 'Webcam' ,1, '2023-01-27' ,646.85, 'Mike Brown' , 'North' ,102),
(74, 'Laptop' ,4, '2023-06-20' ,560.35, 'Mike Brown' , 'South' ,101),
(75, 'Webcam' ,2, '2023-02-12' ,1490.84, 'Sarah Davis' , 'South' ,104),
(76, 'Smartwatch' ,5, '2023-06-08' ,341.23, 'Jane Smith' , 'North' ,100),
(77, 'Webcam' ,3, '2023-06-30' ,871.52, 'Sarah Davis' , 'North' ,100),
(78, 'Tablet' ,4, '2023-02-27' ,424.62, 'Derek Lee' , 'West' ,102),
(79, 'Tablet' ,3, '2023-06-10' ,1041.56, 'Sarah Davis' , 'West' ,104),
(80, 'Mouse' ,3, '2023-05-23' ,1215.27, 'Derek Lee' , 'North' ,101),
(81, 'Webcam' ,1, '2023-04-03' ,236.69, 'Alice Johnson' , 'South' ,105),
(82, 'Webcam' ,2, '2023-03-09' ,784.72, 'Mike Brown' , 'East' ,103),
(83, 'Monitor' ,2, '2023-06-16' ,667.09, 'Derek Lee' , 'South' ,104),
(84, 'Webcam' ,5, '2023-05-23' ,776.92, 'Jane Smith' , 'North' ,101),
(85, 'Mouse' ,2, '2023-02-24' ,534.45, 'Sarah Davis' , 'North' ,100),
(86, 'Monitor' ,5, '2023-01-16' ,1370.17, 'John Doe' , 'North' ,102),
(87, 'Printer' ,2, '2023-03-31' ,1077.39, 'Jane Smith' , NULL ,104),
(88, 'Tablet' ,3, '2023-04-20' ,199.07, 'John Doe' , 'North' ,104),
(89, 'Headphones' ,4, '2023-05-14' ,826.98, 'John Doe' , 'South' ,102),
(90, 'Smartwatch' ,2, '2023-01-05' ,323.71, 'John Doe' , 'West' ,NULL),
(91, 'Smartphone' ,4, '2023-06-29' ,319.41, 'Chris Green' , 'West' ,104),
(92, 'Tablet' ,4, '2023-05-31' ,735.86, 'Karen Black' , 'South' ,102),
(93, 'Smartwatch' ,3, '2023-01-13' ,640.38, 'Steve Grey' , 'East' ,101),
(94, 'Monitor' ,1, '2023-01-31' ,932.91, 'Nancy White' , 'West' ,NULL),
(95, 'Webcam' ,2, '2023-06-22' ,524.98, 'Sarah Davis' , 'North' ,103),
(96, 'Headphones' ,1, '2023-03-24' ,641.16, 'Jane Smith' , 'North' ,103),
(97, 'Webcam' ,5, '2023-01-15' ,1307.82, 'John Doe' , 'West' ,104),
(98, 'Tablet' ,3, '2023-03-01' ,864.7, 'Jane Smith' , NULL ,104),
(99, 'Headphones' ,3, '2023-06-30' ,477.66, 'Jane Smith' , NULL ,102),
(100, 'Webcam' ,5, '2023-04-21' ,1158.19, 'Jane Smith' , 'East' ,102);
