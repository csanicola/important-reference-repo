--CREATE TABLE EmployeeDemographics
--(
--EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)
--CREATE TABLE EmployeeSalary
--(
--EmployeeID int,
--JobTitle varchar(50),
--Salary int
--)
-- INSERT INTO EmployeeDemographics
-- VALUES (1001, 'Jim', 'Halpert', 30, 'Male'),
--     (1002, 'Pam', 'Beasley', 30, 'Female'),
--     (1003, 'Dwight', 'Schrute', 29, 'Male'),
--     (1004, 'Angela', 'Martin', 31, 'Female'),
--     (1005, 'Toby', 'Flenderson', 32, 'Male'),
--     (1006, 'Michael', 'Scott', 35, 'Male'),
--     (1007, 'Meredith', 'Palmer', 32, 'Female'),
--     (1008, 'Stanley', 'Hudson', 38, 'Male'),
--     (1009, 'Kevin', 'Malone', 31, 'Male') 
-- INSERT INTO EmployeeSalary
-- VALUES (1001, 'Salesman', 45000),
--     (1002, 'Receptionist', 36000),
--     (1003, 'Salesman', 63000),
--     (1004, 'Accountant', 47000),
--     (1005, 'HR', 50000),
--     (1006, 'Regional Manager', 65000),
--     (1007, 'Supplier Relations', 41000),
--     (1008, 'Salesman', 48000),
--     (1009, 'Accountant', 42000)
/*
 SELECT Statement
 *, Top, Distinct, Count, As, Max, Min, Avg
 */
SELECT DISTINCT(Gender)
FROM EmployeeDemographics
SELECT COUNT(LastName) AS LastNameCount
FROM EmployeeDemographics
SELECT *
FROM EmployeeSalary
SELECT MAX(Salary),
    MIN(Salary),
    AVG(Salary)
FROM EmployeeSalary