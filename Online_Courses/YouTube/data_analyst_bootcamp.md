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

SELECT err.FirstName, SUBSTRING(err.FirstName,1,3), dem.FirstName, SUBSTRING(dem.FirstName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)

-- Using UPPER and LOWER
SELECT FirstName, LOWER(FirstName)
FROM EmployeeDemographics

SELECT FirstName, UPPER(FirstName)
FROM EmployeeDemographics
```

_Stored Procedures_

```sql
/*
Stored Procedures
*/

CREATE OR REPLACE FUNCTION test()
RETURNS SETOF EmployeeDemographics
LANGUAGE sql
AS $$
	SELECT * FROM EmployeeDemographics;
$$;
-- to run it:
SELECT * FROM test();

/*
the microsoft sql server equivalent is:
CREATE PROCEDURE TEST
AS
SELECT *
FROM EmployeeDemographics

EXEC TEST
*/

CREATE OR REPLACE FUNCTION temp_employee()
RETURNS TABLE (
    jobtitle varchar(100),
    employeesperjob bigint,
    avgage numeric,
    avgsalary numeric
)
LANGUAGE sql
AS $$
    SELECT
        JobTitle,
        COUNT(JobTitle) AS employeesperjob,
        AVG(Age) AS avgage,
        AVG(Salary) AS avgsalary
    FROM
        employeedemographics emp
    JOIN
        employeesalary sal ON emp.employeeid = sal.employeeid
    GROUP BY
        JobTitle;
$$;

SELECT * FROM temp_employee();

-- we can also alter a function once its been created
CREATE OR REPLACE FUNCTION temp_employee(p_jobtitle varchar(100))
RETURNS TABLE (
    jobtitle varchar(100),
    employeesperjob bigint,
    avgage numeric,
    avgsalary numeric
) AS $$
    SELECT
        JobTitle,
        COUNT(JobTitle) AS employeesperjob,
        AVG(Age) AS avgage,
        AVG(Salary) AS avgsalary
    FROM
        employeedemographics emp
    JOIN
        employeesalary sal ON emp.employeeid = sal.employeeid
    WHERE JobTitle = p_jobtitle
    GROUP BY
        JobTitle;
$$ LANGUAGE sql;

SELECT * FROM temp_employee();
```

_Subqueries_

```sql
/*
Subqueries (in the Select, From, and Where Statement)
*/
SELECT *
FROM EmployeeSalary

-- Subquery in SELECT
SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
FROM EmployeeSalary

-- How to do it with Partition By
SELECT EmployeeID, Salary, AVG(Salary) OVER () AS AllAvgSalary
FROM EmployeeSalary

-- Why Group BY Doesn't Work
SELECT EmployeeID, Salary, AVG(Salary) AS AllAvgSalary
FROM EmployeeSalary
GROUP BY EmployeeID, Salary
ORDER BY 1,2

-- Subquery in From
SELECT a.EmployeeID, AllAvgSalary
FROM (SELECT EmployeeID, Salary, AVG(Salary) OVER () AS AllAvgSalary
	  FROM EmployeeSalary) a

-- Subquery in Where
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
WHERE EmployeeID in (
		SELECT EmployeeID
		FROM EmployeeDemographics
		WHERE Age > 30)
```

## Data Analyst Portfolio Project | SQL Data Exploration

```sql
-- /Users/carolinesanicola/Documents/GitHub/important-reference-repo/Data/CovidDeaths.csv
-- /Users/carolinesanicola/Documents/GitHub/important-reference-repo/Data/CovidVaccinations.csv

/*
SQL PORTFOLIO PROJECT
*/

-- CREATE COVID DEATHS TABLE
CREATE TABLE CovidDeaths (
    iso_code varchar(10),
    continent varchar(50),
    location varchar(50),
    date date,
    population bigint,
    total_cases int,
    new_cases int,
    new_cases_smoothed float,
    total_deaths int,
    new_deaths int,
    new_deaths_smoothed float,
    total_cases_per_million float,
    new_cases_per_million float,
    new_cases_smoothed_per_million float,
    total_deaths_per_million float,
    new_deaths_per_million float,
    new_deaths_smoothed_per_million float,
    reproduction_rate float,
    icu_patients int,
    icu_patients_per_million float,
    hosp_patients int,
    hosp_patients_per_million float,
    weekly_icu_admissions float,
    weekly_icu_admissions_per_million float,
    weekly_hosp_admissions float,
    weekly_hosp_admissions_per_million float
);

CREATE TABLE CovidVaccinations (
	iso_code varchar(10),
	continent varchar(50),
	location varchar(50),
	date date,
	new_tests int,
	total_tests int,
	total_tests_per_thousand float,
	new_tests_per_thousand float,
	new_tests_smoothed float,
	new_tests_smoothed_per_thousand float,
	positive_rate float,
	tests_per_case float,
	tests_units varchar(50),
	total_vaccinations int,
	people_vaccinated int,
	people_fully_vaccinated int,
	new_vaccinations int,
	new_vaccinations_smoothed int,
	total_vaccinations_per_hundred float,
	people_vaccinated_per_hundred float,
	people_fully_vaccinated_per_hundred float,
	new_vaccinations_smoothed_per_million int,
	stringency_index float,
	population_density float,
	median_age float,
	aged_65_older float,
	aged_70_older float,
	gdp_per_capita float,
	extreme_poverty float,
	cardiovasc_death_rate float,
	diabetes_prevalence float,
	female_smokers float,
	male_smokers float,
	handwashing_facilities float,
	hospital_beds_per_thousand float,
	life_expectancy float,
	human_development_index float
);

SELECT * FROM CovidDeaths;

SELECT * FROM CovidVaccinations;

SELECT *
FROM CovidDeaths
ORDER BY 3, 4;

SELECT *
FROM CovidVaccinations
ORDER BY 3, 4;

-- Select data that we are going to be using
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths
ORDER BY 1,2;

-- Looking at Total Cases vs. Total Deaths
-- Shows the likelihood of dying if you contract covid in your country
SELECT location, date, total_cases, total_deaths,
	(total_deaths::float / total_cases)*100 AS PercentPopulationInfected -- total_deaths needs to be converted to a float first so it doesn't default all deathpercentages as 0
FROM CovidDeaths
WHERE location like '%States%'
ORDER BY 1,2;

-- Looking at Total Cases vs Population
-- Shows what percentage of population got Covid
SELECT location, date, population, total_cases,
	(total_cases::float / population)*100 AS PercentPopulationInfected
FROM CovidDeaths
WHERE total_deaths IS NOT NULL
ORDER BY 1,2;


-- Looking at Countries with Highest Infection Rate Compared to Population
SELECT location, population, MAX(total_cases) AS HighestInfectionCount,
	(MAX(total_cases::float / population))*100 AS PercentPopulationInfected
FROM CovidDeaths
WHERE total_deaths IS NOT NULL
GROUP BY location, population
ORDER BY PercentPopulationInfected DESC;

-- Showing Countries with Highest Death Count per Population
SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM CovidDeaths
WHERE continent IS NOT NULL AND total_deaths IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount DESC;

-- LET'S BREAK THINGS DOWN BY CONTINENT

-- Showing continents with the highest death count per population
SELECT continent, MAX(total_deaths) AS TotalDeathCount
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC;

-- GLOBAL NUMBERS

SELECT SUM(new_cases), SUM(new_deaths)
		-- ,total_deaths
		,(sum(new_deaths::float) / sum(total_cases))*100 AS DeathPercentage
FROM CovidDeaths
WHERE continent IS NOT NULL
	AND new_cases IS NOT NULL
ORDER BY 1, 2;

-- Looking at Total Population vs. Vaccinations
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
	SUM(COALESCE(vac.new_vaccinations::int) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS RollingPeopleVaccinated -- partition is to break it up by location so its going to sum up to the end of the location and then restart at the next location
FROM CovidDeaths dea
	JOIN CovidVaccinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2, 3;


-- USE CTE
WITH PopvsVac AS (
    SELECT
        dea.continent,
        dea.location,
        dea.date,
        dea.population,
        vac.new_vaccinations,
        SUM(COALESCE(vac.new_vaccinations::int, 0)) OVER (
            PARTITION BY dea.location
            ORDER BY dea.date
        ) AS RollingPeopleVaccinated
    FROM CovidDeaths dea
    JOIN CovidVaccinations vac
        ON dea.location = vac.location
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL
)
SELECT
    *,
    (RollingPeopleVaccinated * 100.0 / NULLIF(population, 0)) AS VaccinationPercentage
FROM PopvsVac
ORDER BY location, date;

-- TEMP TABLE
CREATE OR REPLACE FUNCTION temp_percentpopulationvaccinated()
RETURNS TABLE(
	continent varchar(255),
	location varchar(255),
	date date,
	population numeric,
	new_vaccinations numeric,
	rollingpeoplevaccinated numeric
)
LANGUAGE sql
AS $$
	SELECT
		dea.continent,
		dea.location,
		dea.date,
		dea.population,
		vac.new_vaccinations,
		SUM(COALESCE(vac.new_vaccinations::int, 0)) OVER (
            PARTITION BY dea.location
            ORDER BY dea.date
        ) AS RollingPeopleVaccinated
    FROM CovidDeaths dea
    JOIN CovidVaccinations vac
        ON dea.location = vac.location
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL
$$;

SELECT
    *,
    (RollingPeopleVaccinated * 100.0 / NULLIF(population, 0)) AS VaccinationPercentage
FROM temp_percentpopulationvaccinated()
ORDER BY location, date;


-- Creating view to store data for later visualizations
CREATE VIEW PercentPopulationVaccinated AS
	SELECT
		dea.continent,
		dea.location,
		dea.date,
		dea.population,
		vac.new_vaccinations,
		SUM(COALESCE(vac.new_vaccinations::int, 0)) OVER (
            PARTITION BY dea.location
            ORDER BY dea.date
        ) AS RollingPeopleVaccinated
	FROM CovidDeaths dea
		JOIN CovidVaccinations vac
		ON dea.location = vac.location
		AND dea.date = vac.date
	WHERE dea.continent IS NOT NULL;

SELECT *
FROM PercentPopulationVaccinated
```

## Portfolio Project 2: Cleaning up the Data

```sql
-- '/Users/carolinesanicola/Documents/GitHub/important-reference-repo/Data/Nashville Housing Data for Data Cleaning.xlsx'
/*
Portfolio Project: Cleaning Data in SQL Queries
*/

CREATE TABLE NashvilleHousing (
	UniqueID int,
	ParcelID varchar(100),
	LandUse varchar(100),
	PropertyAddress varchar(100),
	SaleDate varchar(50),
	SalePrice int,
	LegalReference varchar(100),
	SoldAsVacant varchar(10),
	OwnerName varchar(100),
	OwnerAddress varchar(100),
	Acreage float,
	TaxDistrict varchar(100),
	LandValue int,
	BuildingValue int,
	TotalValue int,
	YearBuilt varchar(50),
	Bedrooms int,
	FullBath int,
	HalfBath int
);

SELECT * FROM NashvilleHousing;

----------------------------------------------------------------------------------------
-- Standardize Date Format

SELECT
    SaleDate,
    TO_DATE(SaleDate, 'DD-Mon-YY') AS ConvertedDate
FROM NashvilleHousing;

UPDATE NashvilleHousing
SET SaleDate = TO_DATE(SaleDate, 'DD-Mon-YY');

ALTER TABLE NashvilleHousing
ADD SaleDateConverted Date;

UPDATE NashvilleHousing
SET SaleDateConverted = TO_DATE(SaleDate, 'DD-Mon-YY')

ALTER TABLE NashvilleHousing
DROP COLUMN SaleDateConverted;

----------------------------------------------------------------------------------------
-- Populate Property Address Data
-- since the parcelid and the address are always going to be the same, if there is a parcelid without an address, populate it from the parcelid with an address
SELECT *
FROM NashvilleHousing
ORDER BY ParcelID;

-- we now need to do a self join
SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress,
	COALESCE(a.PropertyAddress, b.PropertyAddress) AS MergedPropertyAddress -- in SQL Server you use ISNULL()
FROM NashvilleHousing a
JOIN NashvilleHousing b
	ON a.ParcelID = b.ParcelID
	AND a.UniqueID <> b.UniqueID
WHERE a.PropertyAddress IS NULL

UPDATE NashvilleHousing a
SET PropertyAddress = COALESCE(a.PropertyAddress, b.PropertyAddress)
FROM NashvilleHousing b
WHERE
    a.ParcelID = b.ParcelID
    AND a.UniqueID <> b.UniqueID
    AND a.PropertyAddress IS NULL;


-- Breaking Out Address Into Individual Columns (Address, City, State)
-- Currently the addresses are '101 Street, City' and we are gonna separate out with the character index to separate by comma
SELECT PropertyAddress
FROM NashvilleHousing

SELECT
    SUBSTRING(PropertyAddress, 1, STRPOS(PropertyAddress, ',') - 1) AS StreetAddress -- the mysql serv ver is 'CHARINDEX()'; Added - 1 to exclude the comma from the result
	,SUBSTRING(PropertyAddress, STRPOS(PropertyAddress, ',') +1, LENGTH(PropertyAddress) - STRPOS(PropertyAddress, ',')) AS City
FROM NashvilleHousing;

ALTER TABLE NashvilleHousing
ADD PropertySplitAddress varchar(250);

UPDATE NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, STRPOS(PropertyAddress, ',') - 1);

ALTER TABLE NashvilleHousing
ADD PropertySplitCity varchar(250);

UPDATE NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, STRPOS(PropertyAddress, ',') +1, LENGTH(PropertyAddress) - STRPOS(PropertyAddress, ','));

SELECT *
FROM NashvilleHousing;

-- ver 2 of the above
SELECT OwnerAddress
FROM NashvilleHousing;

SELECT
    SPLIT_PART(REPLACE(OwnerAddress, ', ', ','), ',', 1) AS Street,  -- First part
    SPLIT_PART(REPLACE(OwnerAddress, ', ', ','), ',', 2) AS City,  -- Second part
    SPLIT_PART(REPLACE(OwnerAddress, ', ', ','), ',', 3) AS State   -- Third part (equivalent to PARSENAME(OwnerAddress,1))
FROM NashvilleHousing;

ALTER TABLE NashvilleHousing
ADD OwnerSplitStreet varchar(250);

UPDATE NashvilleHousing
SET OwnerSplitStreet = SPLIT_PART(REPLACE(OwnerAddress, ', ', ','), ',', 1);

ALTER TABLE NashvilleHousing
ADD OwnerSplitCity varchar(250);

UPDATE NashvilleHousing
SET OwnerSplitCity = SPLIT_PART(REPLACE(OwnerAddress, ', ', ','), ',', 2);

ALTER TABLE NashvilleHousing
ADD OwnerSplitState varchar(250);

UPDATE NashvilleHousing
SET OwnerSplitState = SPLIT_PART(REPLACE(OwnerAddress, ', ', ','), ',', 3);

SELECT *
FROM NashvilleHousing;

----------------------------------------------------------------------------------------
-- Change Y and N to Yes and No in "Sold as Vacant" Field
SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM NashvilleHousing
GROUP BY SoldAsVacant
ORDER BY 2;

SELECT SoldAsVacant
	, CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
			WHEN SoldAsVacant = 'N' THEN 'No'
			ELSE SoldAsVacant
			END
FROM NashvilleHousing;

UPDATE NashvilleHousing
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
			WHEN SoldAsVacant = 'N' THEN 'No'
			ELSE SoldAsVacant
			END

----------------------------------------------------------------------------------------
-- Remove Duplicates


SELECT *,
	ROW_NUMBER() OVER(
		PARTITION BY ParcelID,
					PropertyAddress,
					SalePrice,
					SaleDate,
					LegalReference
					ORDER BY
						UniqueID
						) row_num
FROM NashvilleHousing
ORDER BY ParcelID
WHERE row_num;

SELECT *
FROM NashvilleHousing;
-- check the duplicates
WITH RowNumCTE AS (
	SELECT
		UniqueID,
		ParcelID,
		PropertyAddress,
		SalePrice,
		SaleDate,
		LegalReference,
		ROW_NUMBER() OVER(
		PARTITION BY ParcelID,
					PropertyAddress,
					SalePrice,
					SaleDate,
					LegalReference
					ORDER BY
						UniqueID
						) row_num
	FROM NashvilleHousing
	ORDER BY ParcelID
)
SELECT *
FROM RowNumCTE
WHERE row_num > 1
ORDER BY PropertyAddress;

-- delete the duplicates
DELETE FROM NashvilleHousing
WHERE UniqueID IN (
    SELECT UniqueID
    FROM (
        SELECT
            UniqueID,
            ROW_NUMBER() OVER(
                PARTITION BY ParcelID,
                            PropertyAddress,
                            SalePrice,
                            SaleDate,
                            LegalReference
                ORDER BY UniqueID
            ) AS row_num
        FROM NashvilleHousing
    ) AS subquery
    WHERE row_num > 1
);

----------------------------------------------------------------------------------------
-- Delete Unused Columns
-- now that we split apart the address, we can delete the origins

SELECT *
FROM NashvilleHousing;

ALTER TABLE NashvilleHousing
DROP COLUMN SaleDate,
DROP COLUMN OwnerAddress,
DROP COLUMN TaxDistrict,
DROP COLUMN PropertyAddress;
```

---

# Tableau

- the usecase for this data is if a person was trying to find the best location to have an AirBnB

[Tableau Workbook](/Users/carolinesanicola/Documents/GitHub/important-reference-repo/Online_Courses/YouTube/bootcamp_Airbnb_data.twb)

---

# Power BI

---

# Python
