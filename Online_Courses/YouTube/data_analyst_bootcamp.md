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

SELECT Jobtitle, AVG(Salary)
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY Jobtitle
```

_Union, Union All_

- A way to allow for you to select data from multiple tables to output into one

```sql
/*
Union, Union All
*/

SELECT *
FROM EmployeeDemographics
UNION
SELECT *
FROM WareHouseEmployeeDemographics
ORDER BY EmployeeID

SELECT *
FROM EmployeeDemographics
UNION ALL
SELECT *
FROM WareHouseEmployeeDemographics
ORDER BY EmployeeID

SELECT *
FROM EmployeeDemographics
FULL OUTER JOIN WareHouseEmployeeDemographics
	ON EmployeeDemographics

-- This is how not to do a union because it takes 3 columns from both but assumes it matches the first 3 so it mixes up columnes:
SELECT EmployeeID, FirstName, Age
FROM EmployeeDemographics
UNION
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
ORDER BY EmployeeID
```

_Case Statement_

```sql
/*
Case Statement
*/

SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END
FROM EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'Old'
	WHEN Age = 38 THEN 'Stanley' -- this won't show because the case was already met above
	ELSE 'Baby'
END
FROM EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

SELECT FirstName, LastName, Age,
CASE
	WHEN Age = 38 THEN 'Stanley'
	WHEN Age > 30 THEN 'Old'
	ELSE 'Baby'
END
FROM EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTItle = 'HR' THEN Salary + (Salary * .000001)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM EmployeeDemographics
JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
```

_Having Clause_

```sql
/*
Having Clause
*/

SELECT JobTitle, COUNT(JobTitle)
FROM EmployeeDemographics
JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1 -- this has to come after the group by statement because you can't ask for this without the data being grouped first

SELECT JobTitle, AVG(Salary)
FROM EmployeeDemographics
JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)
```

_Updating/Deleting Data_

```sql
/*
Updating/Deleting Data
*/

SELECT *
FROM EmployeeDemographics

UPDATE EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly' AND LastName = 'Flax'

UPDATE EmployeeDemographics
SET Age = 31, Gender = 'Female'
WHERE EmployeeID = 1012

DELETE FROM EmployeeDemographics
WHERE EmployeeID = 1005

DELETE FROM EmployeeDemographics -- If you ran just this then it would delete the entire table which you have to be careful not to do
```

_Aliasing_

```sql
/*
Aliasing
*/

SELECT FirstName AS Fname
FROM EmployeeDemographics

SELECT FirstName || ' ' || LastName AS FullName
-- the mysql ver is SELECT FirstName + ' ' + LastName AS FullName
FROM EmployeeDemographics

SELECT AVG(Age) AS AvgAge
FROM EmployeeDemographics

SELECT Demo.EmployeeID, Sal.Salary
FROM EmployeeDemographics AS Demo -- giving the table an alias makes it easier
JOIN EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID

-- the below is what we don't want to do with using a. b. c. as aliases for tables because it can make it more complicated to follow the bigger the query is
SELECT a.EmployeeID, a.FirstName, a.LastName, b.JobTitle, c.Age
FROM EmployeeDemographics a
LEFT JOIN EmployeeSalary b
	ON a.EmployeeID = b.EmployeeID
LEFT JOIN WareHouseEmployeeDemographics c
	ON a.EmployeeID = c.EmployeeID
-- this is the preferred by using short aliases
SELECT Demo.EmployeeID, Demo.FirstName, Demo.LastName, Sal.JobTitle, Ware.Age
FROM EmployeeDemographics Demo
LEFT JOIN EmployeeSalary Sal
	ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN WareHouseEmployeeDemographics Ware
	ON Demo.EmployeeID = Ware.EmployeeID
```

_Partition By_

```sql
/*
Partition By
*/

SELECT FirstName, LastName, Gender, Salary
	,COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM EmployeeDemographics dem
JOIN EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID

-- this will show the same thing as above without the partition but you have to narrow it down to just showing the columns you are partitioning by
SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics dem
JOIN EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
GROUP BY Gender
```

_CTEs_

- These are known as **Common Table Expressions**
  - they are just created temporarily in memory as part of the query but once the query is gone then its like they never existed

```sql
/*
Temp Tables
*/

CREATE TEMPORARY TABLE temp_Employee(
EmployeeID int,
JobTitle varchar(100),
Salary int
)

SELECT *
FROM temp_Employee

INSERT INTO temp_Employee VALUES(
'1001', 'HR', '45000'
)

-- you can also import the data from another table instead of manually importing the data
INSERT INTO temp_Employee
SELECT *
FROM EmployeeSalary

-- this is a more realistic way of using temp tables:
CREATE TEMPORARY TABLE temp_Employee2(
JobTitle varchar(50),
EmployeesPerJob int,
AveAge int,
AvgSalary int
)

INSERT INTO temp_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM temp_Employee2

-- these temporary tables stay in place in the session unless you drop them but you can add the below in front of your script
DROP TABLE IF EXISTS temp_Employee2
```

_String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower_

```sql
/*
String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower
*/

-- DROP TABLE EmployeeErrors

CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

INSERT INTO EmployeeErrors VALUES
('1001 ', 'Jimbo', 'Halbert')
,(' 1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

SELECT *
FROM EmployeeErrors

-- Using TRIM, LTRIM, RTRIM
SELECT EmployeeID, TRIM(EmployeeID) AS IDTRIM -- trim gets rid of blank spaces on both sides
FROM EmployeeErrors

SELECT EmployeeID, LTRIM(EmployeeID) AS IDTRIM -- trim gets rid of blank spaces on the left side of a character
FROM EmployeeErrors

SELECT EmployeeID, RTRIM(EmployeeID) AS IDTRIM -- trim gets rid of blank spaces on the right side of a character
FROM EmployeeErrors

-- Using Replace
SELECT LastName, REPLACE(LastName, '- Fired', '') AS LastNameFixed
FROM EmployeeErrors

-- Using Substring
SELECT SUBSTRING(FirstName,1,3) -- in the first name its going to take the first character and go three characters into the 'word'
FROM EmployeeErrors




-- Using UPPER and LOWER










```

---

# Excel

---

# Tableau

---

# Power BI

---

# Python
