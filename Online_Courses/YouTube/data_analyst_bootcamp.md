# Data Analyst Bootcamp for Beginners (SQL, Tableau, Power BI, Python, Excel, Pandas, Projects, more)

[Source](https://www.youtube.com/watch?v=PSNXoAs2FtQ)

# SQL

1. first thing we will do, in Postgresql is to create our tables

```sql
CREATE TABLE EmployeeDemographics
(
EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

CREATE TABLE EmployeeSalary
(
EmployeeID int,
JobTitle varchar(50),
Salary int
)

Create Table WareHouseEmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)
```

2. now we need to load data into the tables

```sql
INSERT INTO EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

Insert into EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')
```

## SELECT Statements

_Top, Distinct, Count, As, Max, Min, Avg_

```sql
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

SELECT MAX(Salary), MIN(Salary), AVG(Salary)
FROM EmployeeSalary
```

_=, <>, <, >, And, Or, Like, Null, Not Null, In_

```sql
/*
SELECT Statement
=, <>, <, >, And, Or, Like, Null, Not Null, In
*/

SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Jim'

SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim'

SELECT *
FROM EmployeeDemographics
WHERE Age < 30

SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 AND Gender = 'Male'

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%' -- returning first names that start with 'S'

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%t'

SELECT *
FROM EmployeeDemographics
WHERE FirstName is NOT NULL

SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael')
```

_Group By, Order By_

```sql
/*
Group By, Order By
*/

SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender

SELECT Gender, Age, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender, Age

SELECT Gender, Age, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender, Age

SELECT Gender, Age, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
GROUP BY Gender, Age
ORDER BY CountGender DESC

SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC, Gender

SELECT *
FROM EmployeeDemographics
ORDER BY 4 DESC, 5 DESC -- this is using the column numbers instead which can be easier
```

_Inner Joins, Full/Left/Right/Outer Joins_

```sql
/*
Inner Joins, Full/Left/Right/Outer Joins
*/

SELECT *
FROM EmployeeDemographics;

SELECT *
FROM EmployeeSalary;

SELECT *
FROM EmployeeDemographics
INNER JOIN EmployeeSalary -- this is only going to join the data that matches both tables
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT *
FROM EmployeeDemographics
FULL OUTER JOIN EmployeeSalary -- this is going to pull everything from both tables regardless of if a record isnt matched on one table to another
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT *
FROM EmployeeDemographics
LEFT OUTER JOIN EmployeeSalary -- this is going to pull all of the right table (demographics) but only what matches in the left table (salary)
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics
LEFT OUTER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

-- If we want to look at who the highest paid employee is
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC
```

---

# Excel

---

# Tableau

---

# Power BI

---

# Python
