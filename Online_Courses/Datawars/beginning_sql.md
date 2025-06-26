# Beginning SQL: Basic Selection Statements

[Source](https://app.datawars.io/skill-track/da58534f-3819-4a08-a579-17525c64f350)

## Basic SELECT with Chinook

In this project we'll explore the basic syntax of the `SELECT` statement in SQL, which, technically speaking is a [&#34;Projection&#34;](https://w.wiki/7xZ4) in Relational Algebra (but don't worry, you don't need to know the theoretical details to use SQL).

The most basic form of `SELECT` has the following forms:

```sql
SELECT * FROM [table];
```

The `*` will select ALL the columns from the table `[table]`. And also:

```sql
SELECT [col1], [col2] FROM [table]
```

That will select only columns `col1` and `col2`.

#### The Databases Used

### The Databases we're using

We're using two databases for this project: `Chinook` and `AdventureWorks`. The diagrams and tables of each one will be presented for each section of the project.

#### Section 1: Chinook

The Chinook database stores information about a Music store. Here's the schema diagram as a reference:

![](https://static.prd.datawars.io/projects/lab-83028c-basic-selects-chinook/chinook-schema.png)

1. Write a query to select customers `FirstName`, `LastName`, `Email` and `Country` from table `Customer`

Your results should look something like:

![img](https://static.prd.datawars.io/projects/lab-83028c-basic-selects-chinook/activity-1.png)

```sql
SELECT FirstName, LastName, Email, Country FROM Customers;
```

2. Write a query to select only the Title from the Album, but named as 'Album Name'

Your results should look something like:

![img](https://static.prd.datawars.io/projects/lab-83028c-basic-selects-chinook/activity-2.png)

```sql
SELECT Title AS 'Album Name'
FROM Album;
```

3. Select all the columns from the Track table

Your results should look something like:

![img](https://static.prd.datawars.io/projects/lab-83028c-basic-selects-chinook/activity-3.png)

```sql
SELECT * FROM Track;
```

4. Select Id and Name from Playlists, with a twist

Select the columns `PlaylistId` and `Name` from the `Playlist` table, but rename the columns to be `ID` and `Playlist Name`. Your results should look like this:

![](https://static.prd.datawars.io/projects/lab-83028c-basic-selects-chinook/activity-4.png)

```sql
SELECT PlaylistId AS 'ID'
    ,Name AS 'Playlist Name'
FROM Playlist;
```

#### Section 2: AdventureWorks

The Adventure Works database was created by Microsoft for their training on SQLServer, and represents a fictitious, multi-national manufacturing company. It includes sales, product, purchasing, and employee data to simulate business scenarios for training and demonstrations.

The one we're using in this project is a port of a subset of the original AdventureWorks and the diagram can be found below:

![img](https://static.prd.datawars.io/projects/lab-83028c-basic-selects-chinook/adventureworks.png)

5. Select all columns from `Address`

Your results should look like this:

![](https://static.prd.datawars.io/projects/lab-83028c-basic-selects-chinook/activity-5.png)

```sql
SELECT * FROM 'Address'
```

6. Select the following columns from `Product`

Select the columns `ProductNumber`, `Name`, `Color`, `ListPrice`, `DiscontinuedDate` from the `Product` table. Your results should look like this:

![](https://static.prd.datawars.io/projects/lab-83028c-basic-selects-chinook/activity-6.png)

```sql
SELECT ProductNumber, Name, Color, ListPrice, DiscontinuedDate
FROM Product;
```

7. Select the following columns from `Customer`

Select the columns: `CustomerID`, `Title`, `FirstName`, `LastName` and `EmailAddress` from the `Customer` table, but rename them to be `ID`, `Title` (doesn't change), `First Name`, `Last Name`, `Email`.

Your results should look like this:

![](https://static.prd.datawars.io/projects/lab-83028c-basic-selects-chinook/activity-7.png)

```sql
SELECT  CustomerID AS 'ID'
        ,Title
        ,FirstName AS 'First Name'
        ,LastName AS 'Last Name'
        ,EmailAddress AS 'Email'
FROM Customer
```

---

# Skill Assessment: SELECT statement with Sakila

#### Introduction

Welcome to the "Practicing SELECT Statements and Aliases with Sakila Database" lab. In this lab, you will focus on honing your SQL skills, specifically on the use of SELECT statements and aliases. You'll be working with the Sakila database, which simulates a DVD rental store, to master the fundamentals of querying relational databases.

![img](https://static.prd.datawars.io/projects/lab-829c23f-basic-select-practice-sakila/sakila-structure.png)

**Example Queries and SELECT Statement Syntax:**

Before we dive into the activities, let's understand the basic structure of a `SELECT` statement and see a few examples:

A SELECT statement is used to retrieve data from one or more tables in a database. The basic syntax of a SELECT statement is as follows:

```sql
SELECT column1, column2, ...
FROM table_name;
```

> **Example 1:** Retrieve all the data from the `customer` table.

```sql
SELECT * FROM customer;
```

> **Example 2:** Retrieve the `first_name` and `last_name` columns from the `customer` table.

```sql
SELECT first_name, last_name FROM customer;
```

> **Example 3:** Retrieve the `first_name` and `last_name` columns from the `customer` table and rename them to `First Name` and `Last Name`, respectively.

```sql
SELECT first_name AS 'First Name', last_name AS 'Last Name' FROM customer;
```

#### Activities

Now, let's proceed with a series of activities that will allow you to practice writing SELECT statements and using aliases. Each activity will provide a description, a solution, and an explanation to help you gain a better understanding of these SQL concepts. By the end of this lab, you will be more confident in using SELECT statements and aliases to query the Sakila database effectively.

Make sure to try out the queries before checking the solutions. **Good luck!**

**1**Retrieve Customer Names

Write a SQL query to retrieve the first and last names of all customers in the `customer` table. Your output should look something like this:

![img](https://static.prd.datawars.io/projects/lab-829c23f-basic-select-practice-sakila/activity_01.png)

```sql
SELECT first_name, last_name FROM customer;
```

2. Write a query to retrieve Title and Release Years of films

Your goal is to write a SQL query that will select and display the `title` and `release_year` columns from the `film` table. For readability purposes, we want the column names to be displayed as `Title` and `Release Year`, respectively, when the query result appears.

Your output should look something like this:

![img](https://static.prd.datawars.io/projects/lab-829c23f-basic-select-practice-sakila/activity_02.png)

```sql
SELECT title AS 'Title', release_year AS 'Release Year' FROM film;
```

3. Write a SQL query to display the names and addresses of all staff members from the `staff` table.

Your goal is to write a SQL query that will select and display the `first_name`, `last_name`, and `address_id` columns from the `staff` table. For readability purposes, we want the column names to be displayed as `First Name`, `Last Name`, and `Address`, respectively, when the query result appears.

Your output should look something like this:

![img](https://static.prd.datawars.io/projects/lab-829c23f-basic-select-practice-sakila/activity_03.png)

```sql
SELECT 	first_name AS 'First Name'
		,last_name AS 'Last Name'
        ,address_id AS 'Address'
FROM staff;
```

4. Create a SQL query to retrieve the rental IDs and return dates of all rentals from the rental table.

Your output should look something like this:

![](https://static.prd.datawars.io/projects/lab-829c23f-basic-select-practice-sakila/activity_04.png)

```sql
SELECT 	rental_id, return_date
FROM rental;
```

5. Create a SQL query to display the city IDs and names of all cities from the `city` table.

Your output should look something like this:

![img](https://static.prd.datawars.io/projects/lab-829c23f-basic-select-practice-sakila/activity_05.png)

```sql
SELECT city_id, city
FROM city;
```

6. Retrieve Customer Data

Write a SQL query to retrieve all the data from the `customer` table. Your output should look something like this:

![img](https://static.prd.datawars.io/projects/lab-829c23f-basic-select-practice-sakila/activity_06.png)

```sql
SELECT * FROM customer;
```

7. Create a SQL query to retrieve the store IDs and last update timestamps of all stores from the `store` table.

Your output should look something like this:

![img](https://static.prd.datawars.io/projects/lab-829c23f-basic-select-practice-sakila/activity_07.png)

```sql
SELECT store_id, last_update
FROM store;
```

8. Create a SQL query to list the film IDs, titles, and lengths of all films from the `film` table.

Your output should look something like this:

![img](https://static.prd.datawars.io/projects/lab-829c23f-basic-select-practice-sakila/activity_08.png)

```sql
SELECT film_id, title, length
FROM film;
```

9. Write a SQL query to display the rental IDs, rental dates, and return dates of all rentals from the rental table.

Your output should look something like this:

![img](https://static.prd.datawars.io/projects/lab-829c23f-basic-select-practice-sakila/activity_09.png)

```sql
SELECT rental_id, rental_date, return_date
FROM rental;
```

10. Select the following columns from the `address` table.

Select the `address`, `district`, and `postal_code` columns from the `address` table and rename them to `Address`, `District`, and `Postal Code`, respectively.

Your output should look something like this:

![img](https://static.prd.datawars.io/projects/lab-829c23f-basic-select-practice-sakila/activity_10.png)

```sql
SELECT 	address AS 'Address'
		,district AS 'District'
        ,postal_code AS 'Postal Code'
FROM address;
```

#### Knowledge Test

Now that you've resolved the code activities, it's time to finish the assessment with a set of random Multiple Choice questions that will test your knowledge.

These questions will employ "fake" or "example" tables representing different scenarios, like students, products, employees, and more. Each exercise will present you with a specific SQL task, and your goal is to write the correct SQL query to achieve the desired result.

Let's get started!

11. SQL Efficiency

What is the time complexity of a basic `SELECT` query in SQL?

Assuming a query that doesn't use an index and performs a full table scan, that is, has to iterate over all the rows in the table to find the correct results.

[ ] O(n^2)

[ ] O(1)

[ ] O(log n)

[X] O(n)

12. Alias Usage in SQL

In SQL, what is the purpose of using aliases in a SELECT statement?

[ ] To enforce data integrity

[ ] To improve performance

[X] To rename the column names in the output and make it more readable.

[ ] To make the SQL code more readable

13. Basic SELECT Query

Given a table named `employees` with columns `employee_id`, `employee_name`, and `salary`, which SQL query is correct to select the `employee_name` and `salary` columns from the `employees` table?

The table `employees` is shown below:

| employee_id | employee_name | salary |
| ----------- | ------------- | ------ |
| 1           | John          | 1000   |
| 2           | Mike          | 2000   |
| 3           | Sally         | 1500   |

The expected output is shown below:

| employee_name | salary |
| ------------- | ------ |
| John          | 1000   |
| Mike          | 2000   |
| Sally         | 1500   |

[X] `SELECT employee_name, salary FROM employees;`

[ ] `SELECT employee_name, salary WHERE employees;`

[ ] `SELECT employee_name, salary FROM employees WHERE employee_id;`

[ ] `SELECT employee_name AND salary FROM employees;`

14. Alias Usage in SELECT Statement

When using aliases in a SELECT statement, what keyword is used to create an alias for column names?

[ ] `RENAME`

[ ] `IS`

[X] `AS`

[ ] `ALIAS`

15. Alias Usage in SELECT Statement

Suppose you have a table named `orders` with columns `order_id`, `order_date`, and `order_amount`. Which SQL query will return the `order_id` and `order_amount` columns with aliases `id` and `amount` respectively?

The table `orders` is shown below:

| order_id | order_date | order_amount |
| -------- | ---------- | ------------ |
| 1        | 2020-01-01 | 100          |
| 2        | 2020-01-02 | 200          |
| 3        | 2020-01-03 | 150          |

Your query should return the following result set:

| id  | amount |
| --- | ------ |
| 1   | 100    |
| 2   | 200    |
| 3   | 150    |

[ ] `SELECT order_id, order_amount AS amount FROM orders;`

[X] `SELECT order_id AS id, order_amount AS amount FROM orders;`

[ ] `SELECT id, amount FROM orders;`

[ ] `SELECT order_id, order_amount FROM orders;`

16. Selecting All Columns

Which SQL query will return all columns from the `employees` table?

[X] `SELECT * FROM employees;`

[ ] `SELECT all FROM employees;`

[ ] `SELECT columns * FROM employees;`

[ ] `SELECT columns FROM employees;`

17. Column Selection with Aliases

Consider a table named `employees` with columns `employee_id`, `employee_name`, and `employee_salary`. The initial table looks like this:

| employee_id | employee_name | employee_salary |
| ----------- | ------------- | --------------- |
| 1           | John          | 100000          |
| 2           | Jane          | 150000          |
| 3           | Bob           | 90000           |

Your task is to write a query that displays only the `employee_name` and `employee_salary` columns with aliases `Name` and `Salary` respectively. The resulting table should look like this:

| Name | Salary |
| ---- | ------ |
| John | 100000 |
| Jane | 150000 |
| Bob  | 90000  |

Which SQL query will accomplish this task?

[ ] `SELECT employee_name, employee_salary FROM employees;`

[X] `SELECT employee_name AS Name, employee_salary AS Salary FROM employees;`

[ ] `SELECT employee_name, employee_salary AS Salary FROM employees;`

[ ] `SELECT Name, Salary FROM employees;`

18. Select Students Data

In a table named `students`, there are columns `student_id`, `student_name`, `student_age`, and `student_grade`. Your task is to write a query that displays only the `student_name` and `student_grade` columns with aliases `Name` and `Grade` respectively. Which SQL query will accomplish this task?

The table `students` is shown below:

| student_id | student_name | student_age | student_grade |
| ---------- | ------------ | ----------- | ------------- |
| 1          | John         | 10          | 5             |
| 2          | Jane         | 11          | 6             |
| 3          | Bob          | 12          | 7             |

Your query should return the following result set:

| Name | Grade |
| ---- | ----- |
| John | 5     |
| Jane | 6     |
| Bob  | 7     |

[X] `SELECT student_name AS Name, student_grade AS Grade FROM students;`

[ ] `SELECT student_name, student_grade AS Grade FROM students;`

[ ] `SELECT student_name, student_grade FROM students;`

[ ] `SELECT Name, Grade FROM students;`

19. Select the correct SQL query.

Consider the following SQL query intended to select the `product_name` and `unit_price` columns from the `products` table:

The table `products` is shown below:

| product_id | product_name | unit_price |
| ---------- | ------------ | ---------- |
| 1          | Apple        | 1.00       |
| 2          | Orange       | 2.00       |
| 3          | Banana       | 3.00       |

```sql
SELECT product_name AS 'Item' unit_price AS 'Price' FROM products;
```

Copy

Identify the error in the above query and choose the correct version:

[X] `SELECT product_name AS 'Item', unit_price AS 'Price' FROM products;`

[ ] `SELECT * FROM products AS 'product_info';`

[ ] `SELECT name = product_name, price = unit_price FROM products;`

[ ] `SELECT product_name AS 'Item', price AS 'Price' FROM products;`

20. Select the correct SQL query.

In a SQL query aimed at selecting the `employee_name` as 'Name' and `salary` as 'Income' from the `employees` table, an error has been introduced. Identify the error and choose the correct version:

The table `employees` is shown below:

| employee_id | employee_name | salary |
| ----------- | ------------- | ------ |
| 1           | John          | 1000   |
| 2           | Mike          | 2000   |
| 3           | Sally         | 1500   |

```sql
SELECT employee_name AS 'Name', income AS 'Income' FROM employees;
```

Copy

The expected result of the query is shown below:

| Name  | Income |
| ----- | ------ |
| John  | 1000   |
| Mike  | 2000   |
| Sally | 1500   |

[ ] `SELECT Name = employee_name, Income = salary FROM employees;`

[ ] `SELECT * FROM employees AS 'employee_info';`

[ ] `SELECT employee_name AS 'Name', income = salary FROM employees;`

[X] `SELECT employee_name AS 'Name', salary AS 'Income' FROM employees;`

---

# Practice SELECT with World database

#### Activities

In this lab, we will enhance our skills in working with SQL `SELECT` and `ALIAS` statements. The lab focuses on utilizing the `World` database, which houses comprehensive information about countries, cities, and languages spoken in different nations. The database schema is outlined below:

![](https://static.prd.datawars.io/projects/lab-fef3435f-practice-select-world/world-db-schema.png)Preview

This database contains the following tables:

- `city` - stores information about cities
- `country` - stores information about countries
- `countrylanguage` - stores information about countries' languages

Your primary tasks involve performing SQL queries to retrieve specific information from the database. The use of `ALIAS` statements will be highlighted to improve result readability. Familiarity with the database schema and understanding relationships among tables will be crucial for successfully completing the lab exercises.

**Let's get started!**

#### Activities

1. Select all the records from the `city` table.

Write a query to select all the records from the `city` table.

Your output should look like as follows:

![img](https://static.prd.datawars.io/projects/lab-fef3435f-practice-select-world/activity-01.png)

```sql
SELECT * FROM city;
```

2. Select only the `Name` and `CountryCode` columns from the `city` table.

Write a query to select only the `Name` and `CountryCode` columns from the `city` table.

Your output should look like as follows:

![img](https://static.prd.datawars.io/projects/lab-fef3435f-practice-select-world/img-act-02-updated.png)

```sql
SELECT Name, CountryCode FROM city;
```

3. Select all the records from the `country` table.

Write a query to select all the records from the `country` table but alias the `Name` column as `Country Name`, `Continent` column as `Continent Name` and rest of the columns as it is.

Your output should look like as follows:

![img](https://static.prd.datawars.io/projects/lab-fef3435f-practice-select-world/activity-03.png)

```sql
SELECT	 Code
	,Name AS 'Country Name'
        ,Continent AS 'Continent Name'
        ,Region
        ,SurfaceArea
        ,IndepYear
        ,Population
        ,LifeExpectancy
        ,GNP
        ,GNPOld
        ,LocalName
        ,GovernmentForm
        ,HeadOfState
        ,Capital
        ,Code2
FROM country;
```

4. Select only the `Code`, `Name` and `Continent` columns from the `country` table.

Write a query to select only the `Code`, `Name` and `Continent` columns from the `country` table but alias the `Code` column as `Country Code`, `Name` column as `Country Name` and `Continent` column as `Continent Name`.

Your output should look like as follows:

![img](https://static.prd.datawars.io/projects/lab-fef3435f-practice-select-world/activity-04.png)

```sql
SELECT 	Code AS 'Country Code'
	,Name AS 'Country Name'
	,Continent AS 'Continent Name'
FROM country;
```

5. Select all the records from the `countrylanguage` table.

Write a query to select all the records from the `countrylanguage` table.

Your output should look like as follows:

![img](https://static.prd.datawars.io/projects/lab-fef3435f-practice-select-world/activity-05.png)

```sql
SELECT * FROM countrylanguage;
```

6. Select all records from `countrylanguage` table but alias the `Language` column as `Language Name`.

Write a query to select all records from `countrylanguage` table but alias the `Language` column as `Language Name` and rest of the columns as it is.

Your output should look like as follows:

![img](https://static.prd.datawars.io/projects/lab-fef3435f-practice-select-world/activity-06.png)

```sql
SELECT 	CountryCode
	,Language AS 'Language Name'
	,IsOfficial
        ,Percentage
FROM countrylanguage;
```

7. Select only the `CountryCode`, `Language` and `Percentage` columns from the `countrylanguage` table.

Write a query to select only the `CountryCode`, `Language` and `Percentage` columns from the `countrylanguage` table but alias the `CountryCode` column as `Country Code`, `Language` column as `Language Name` and `Percentage` column as `Language Percentage`.

Your output should look like as follows:

![img](https://static.prd.datawars.io/projects/lab-fef3435f-practice-select-world/activity-07.png)

```sql
SELECT 	CountryCode AS 'Country Code'
	,Language AS 'Language Name'
        ,Percentage AS 'Language Percentage'
FROM countrylanguage;
```

8. Select only `Name`, `SurfaceArea` and `Population` columns from the `country` table.

Write a query to select only `Name`, `SurfaceArea` and `Population` columns from the `country` table.

Your output should look like as follows:

![img](https://static.prd.datawars.io/projects/lab-fef3435f-practice-select-world/activity-08.png)

```sql
SELECT Name, SurfaceArea, Population FROM country;
```

9. Select only `Code`, `Name`, `HeadOfState` and `Capital` columns from the `country` table.

Write a query to select only `Code`, `Name`, `HeadOfState` and `Capital` columns from the `country` table and alias the `Code` column as `Country Code`, `Name` column as `Country Name`, `HeadOfState` column as `Head Of State` and `Capital` column as `Capital City`.

Your output should look like as follows:

![img](https://static.prd.datawars.io/projects/lab-fef3435f-practice-select-world/activity-09.png)

```sql
SELECT 	Code AS 'Country Code'
	,Name AS 'Country Name'
        ,HeadOfState AS 'Head Of State'
        ,Capital AS 'Capital City'
FROM country;
```

10. Select `Name`, `CountryCode`, `District` and `Population` columns from the `city` table.

Write a query to select `Name`, `CountryCode`, `District` and `Population` columns from the `city` table and alias the `Name` column as `City Name`, `CountryCode` column as `Country Code`, `District` column as `City District` and `Population` column as `City Population`.

Your output should look like as follows:

![img](https://static.prd.datawars.io/projects/lab-fef3435f-practice-select-world/activity-10.png)

```sql
SELECT 	Name AS 'City Name'
	,CountryCode AS 'Country Code'
        ,District AS 'City District'
        ,Population AS 'City Population'
FROM city;
```

---

# Practice SELECT with Postgres Pagila

#### Activities

Welcome to this hands-on lab designed to strengthen your foundational SQL skills using the Pagila database—a simulated DVD rental store database. This lab focuses on mastering the fundamental `SELECT` statement syntax, practicing queries on real-world-like data, and enhancing proficiency in using aliases for data retrieval.

## Why the Pagila Database?

The Pagila database is a port of the Sakila sample database, tailored for PostgreSQL. It mimics a DVD rental store and includes tables like `film`, `customer`, `actor`, `payment`, `address`, `city`, and more. This rich dataset provides a practical environment to explore SQL queries that reflect real business scenarios.

> **_Important:_** Expected outcome images are provided for each activity to help you verify your query results but there can be more rows in the result set than shown in the images.

#### Activities

**1**Write a SQL query to select all columns from the `film` table.

Write your query in the input box below.

Expected outcome:

Your result looks like this:

| film_id | title            | description                                                                                                           | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | last_update         | special_features                       | fulltext                                                                                                                                                                       |
| ------- | ---------------- | --------------------------------------------------------------------------------------------------------------------- | ------------ | ----------- | -------------------- | --------------- | ----------- | ------ | ---------------- | ------ | ------------------- | -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1       | ACADEMY DINOSAUR | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies                      | 2006         | 1           |                      | 6               | 0.99        | 86     | 20.99            | PG     | 2022-09-10 16:46:03 | {"Deleted Scenes","Behind the Scenes"} | 'academi':1 'battl':15 'canadian':20 'dinosaur':2 'drama':5 'epic':4 'feminist':8 'mad':11 'must':14 'rocki':21 'scientist':12 'teacher':17                                    |
| 2       | ACE GOLDFINGER   | A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China                  | 2006         | 1           |                      | 3               | 4.99        | 48     | 12.99            | G      | 2022-09-10 16:46:03 | {Trailers,"Deleted Scenes"}            | 'ace':1 'administr':9 'ancient':19 'astound':4 'car':17 'china':20 'databas':8 'epistl':5 'explor':12 'find':15 'goldfing':2 'must':14                                         |
| 3       | ADAPTATION HOLES | A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory                      | 2006         | 1           |                      | 7               | 2.99        | 50     | 18.99            | NC-17  | 2022-09-10 16:46:03 | {Trailers,"Deleted Scenes"}            | 'adapt':1 'astound':4 'baloon':19 'car':11 'factori':20 'hole':2 'lumberjack':8,16 'must':13 'reflect':5 'sink':14                                                             |
| 4       | AFFAIR PREJUDICE | A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank                          | 2006         | 1           |                      | 5               | 2.99        | 117    | 26.99            | G      | 2022-09-10 16:46:03 | {Commentaries,"Behind the Scenes"}     | 'affair':1 'chase':14 'documentari':5 'fanci':4 'frisbe':8 'lumberjack':11 'monkey':16 'must':13 'prejudic':2 'shark':19 'tank':20                                             |
| 5       | AFRICAN EGG      | A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico | 2006         | 1           |                      | 6               | 2.99        | 130    | 22.99            | G      | 2022-09-10 16:46:03 | {"Deleted Scenes"}                     | 'african':1 'chef':11 'dentist':14 'documentari':7 'egg':2 'fast':5 'fast-pac':4 'forens':19 'gulf':23 'mexico':25 'must':16 'pace':6 'pastri':10 'psychologist':20 'pursu':17 |

```sql
SELECT * FROM film;
```

2. Write a SQL query to select the `customer_id`, `first_name`, and `last_name` columns from the `customer` table.

Expected outcome:

![img](https://static.prd.datawars.io/projects/lab-0f892dd-basic-selects-pagila/act_02.png)

```sql
SELECT customer_id, first_name, last_name
FROM customer;
```

3. Write a SQL query to select the `first_name` and `last_name` columns from the `customer` table

Write a SQL query to select the `first_name` and `last_name` columns from the `customer` table, but display them as `firstname` and `lastname` in the result set.

Expected outcome:

![img](https://static.prd.datawars.io/projects/lab-0f892dd-basic-selects-pagila/act_03.png)

```sql
SELECT first_name AS firstname
        ,last_name AS lastname
FROM customer;
```

4. Concatenating Customer Names into a Full Name

Write a SQL query to select the `first_name` and `last_name` columns from the `customer` table, concatenating them together with a space in between. Display the result as `fullname`.

Expected outcome:

![img](https://static.prd.datawars.io/projects/lab-0f892dd-basic-selects-pagila/act_04.png)

```sql
SELECT first_name || ' ' || last_name AS fullname
FROM customer;
```

5. Write query to select all the languages from the `language` table.

Write a SQL query to select all the languages from the `language` table, displaying the result as `language`.

Expected outcome:

![img](https://static.prd.datawars.io/projects/lab-0f892dd-basic-selects-pagila/act_05.png)

```sql
SELECT name AS language FROM language;
```

6. Write a query to get the rental rate and replacement cost of all the films.

Write a SQL query to get the `rental_rate` and `replacement_cost` of all the films from the `film` table, displaying the result as `rentalrate` and `replacementcost`.

Expected outcome:

![img](https://static.prd.datawars.io/projects/lab-0f892dd-basic-selects-pagila/act_06.png)

```sql
SELECT rental_rate AS rentalrate
        ,replacement_cost AS replacementcost
FROM film;
```

7. Write a query list the name of staff and their email address.

Write a SQL query to list the `first_name`, `last_name`, and `email` of all the staff members from the `staff` table.

Expected outcome:

![](https://static.prd.datawars.io/projects/lab-0f892dd-basic-selects-pagila/act_07.png)

```sql
SELECT first_name, last_name, email
FROM staff;
```

8. Write a query to list all the stores

Write a SQL query to list all the stores from the `store` table. Select the correct number of stores from the options below.

[ ] 2 stores

[ ] 1 store

[ ] 3 stores

[ ] 4 stores

9. Write a query to list the payment info of 2022 April

Write a SQL query to list the `payment_id`, `amount`, and `payment_date` of all payments from the `payment_p2022_04` table.

Expected outcome:

![](https://static.prd.datawars.io/projects/lab-0f892dd-basic-selects-pagila/act_09.png)

```sql
SELECT payment_id, amount, payment_date
FROM payment_p2022_04;
```

10. Write a query to get the address of the customers

Write a SQL query to get the address of all the customers from the `address` table. Select only `address`, `address2`, `district`, `city_id`, and `postal_code` columns.

Expected outcome:

![img](https://static.prd.datawars.io/projects/lab-0f892dd-basic-selects-pagila/act_10.png)

```sql
SELECT address, address2, district, city_id, postal_code
FROM address;
```

---

# Basic Filtering with Sakila

#### Write more queries

In this lab we'll practice the basics of SQL filtering and sorting using the `WHERE` and `ORDER BY` statements.

The database we're using is called "Sakila", it's a comprehensive SQL Database simulating a Video Rental store. Here's a quick overview of Sakila's schema. Don't worry if it looks like a lot, for these projects we'll mostly focus on the tables `customer`, `film`, and a few others.

![img](https://static.prd.datawars.io/projects/lab-7224ebb9-sql-basic-sql-statements-sakila/sakila.png)

#### Activities

1. What's the email of customer number 135?

Write a query that returns the email of the customer with the `customer_id` equal to `135` from the `customer` table in the `sakila` database.

Choose the correct answer:

[ ] JESSICA.THOMSON@sakilacustomer.org

[ ] PETER.WALKER@sakilacustomer.org

[ ] MARY.SMITH@sakilacustomer.org

[X] JUANITA.MASON@sakilacustomer.org

**2**What's the category which id is 8?

Write a query that returns the category name with `category_id` equal to `8` from the `category` table in the `sakila` database.

Choose the correct answer:

[X] Family

[ ] Comedy

[ ] Horror

[ ] Action

**3**What's the name of the employee number 2?

Write a query that returns the first name of the employee with `staff_id` equal to `2` from the `staff` table in the `sakila` database.

> Use `staff` table to find the employee.

Please select the correct answer:

[ ] Tom

[X] Jon

[ ] Mike

[ ] Sophie

**4**Is there any other employee apart from Jon? If yes, what's his name?

Write a query that returns the first name of the employee that is not Jon from the `staff` table in the `sakila` database and then select the correct answer:

[X] Yes, Mike

[ ] Yes, Sarah

[ ] Yes, Mathew

[ ] No

**5**Are there any movies which rental rate is higher than `$5`?

In the `film` table of the `sakila` database, are there any movies whose rental rate is higher than `$5`? Please select the correct answer:

[X] No

[ ] Yes

**6**Are there any movies which were released before 2006?

In the `film` table of the `sakila` database, are there any movies that were released before 2006? Please select the correct answer:

[ ] Yes

[X] No

**7**What is the id of the first rental of the year 2006?

Table `rental` in the `sakila` database contains all the rentals that have been made in the store. What is the `rental_id` of the first rental of the year 2006?

[ ] 4492

[ ] 871

[X] 13421

[ ] 9173

**8**What's the name of the actor whose last name is LOLLOBRIGIDA?

In the `actor` table of the `sakila` database, what's the name of the actor whose last name is LOLLOBRIGIDA? Please select the correct answer:

[ ] Peter

[ ] Adam

[ ] Bill

[X] Johnny

**9**Which is the first movie whose replacement cost is equal or higher than `$20`, when ordered alphabetically?

In the `film` table of the `sakila` database, which is the first movie whose replacement cost is equal to or higher than `$20`, when ordered alphabetically? Please select the correct answer:

[X] ACADEMY DINOSAUR

[ ] MAGUIRE APACHE

[ ] JURASSIC PARK

[ ] DANCING FEVER

**10**What movie has a rental duration lower than 4 days and the lowest film id?

In the `film` table of the `sakila` database, what movie has a rental duration lower than 4 days and the lowest film id? Please select the correct answer:

[ ] AFRICAN EGG

[X] ACE GOLDFINGER

[ ] MAGUIRE APACHE

[ ] BADMAN DAWN

**11**What's the rental rate of the shortest movie that is longer than 2 hours?

In the `film` table of the `sakila` database, what's the rental rate of the shortest movie that is longer than 2 hours? Please select the correct answer:

[ ] 6.99

[X] 2.99

[ ] 4.99

[ ] 3.99

#### Write more queries

**12**Display the title and rental rate of all movies that have a rental rate of less than `$1.50`

Write a SQL query that displays the title and rental rate of all movies that have a rental rate of less than `$1.50` per day. Your results should look something like:

![img](https://static.prd.datawars.io/projects/lab-7224ebb9-sql-basic-sql-statements-sakila/2023-03-19-15-46-46.png)

```sql
SELECT title, rental_rate FROM film
WHERE rental_rate < 1.50;
```

**13**Display the title and length of all movies that have a length of more than 2 hours.

Write a SQL query that displays the title and length of all movies that have a length of more than 2 hours. Your result should look something like:

![img](https://static.prd.datawars.io/projects/lab-7224ebb9-sql-basic-sql-statements-sakila/2023-03-19-16-21-50.png)

```sql
SELECT title, length FROM film
WHERE length > 120;
```

# Practice WHERE with Chinook

#### Activities

**1**Filter Customer from the USA

Let's find out who's rocking out in the USA! Write a query to display the names of all customers from `Customer` table who live in the 'USA'.

Your results should look like below: ![ACTIVITY-01](https://static.prd.datawars.io/projects/lab-9ec5431f-sql-basics-where-practice-where-with-chinook/activity_01.png)

1

![]()SELECT [columns] FROM [table]

Check ActivityStart project before checking your activities.

**2**Mega Tracks Alert!

Ready for an epic listening session? Write a query to show tracks with a length greater than 5 minutes (`300000` milliseconds) from the `Track` table. Select the `Name` and `Milliseconds` columns.

Your results should look like below:

![](https://static.prd.datawars.io/projects/lab-9ec5431f-sql-basics-where-practice-where-with-chinook/activity_02.png)Preview

> There are more rows in the output than shown in the screenshot.

1

![]()SELECT [columns] FROM [table]

Check ActivityStart project before checking your activities.

**3**Invoices Over $10

Let's go shopping! Write a query to display all invoices with total greater than $10. Select the `InvoiceId`, `BillingCountry`, and `Total` columns from the `Invoice` table.

Your results should look like below:

![](https://static.prd.datawars.io/projects/lab-9ec5431f-sql-basics-where-practice-where-with-chinook/activity_03.png)Preview

> There are more rows in the output than shown in the screenshot.

1

![]()SELECT [columns] FROM [table]

Check ActivityStart project before checking your activities.

**4**Rock 'n Roll Track

Time to find the rock stars! Write a query to display all tracks with a `Name` equals `Rock & Roll`. Select all columns from the `Track` table.

Your results should look like below:

![](https://static.prd.datawars.io/projects/lab-9ec5431f-sql-basics-where-practice-where-with-chinook/activity_04.png)Preview

1

![]()SELECT [columns] FROM [table]

Check ActivityStart project before checking your activities.

**5**Cool Customers in Argentina

Argentina calling! Write a query to find all customers from Argentina. Select the `FirstName`, `LastName`, and `Country` columns from the `Customer` table.

Your results should look like below:

![](https://static.prd.datawars.io/projects/lab-9ec5431f-sql-basics-where-practice-where-with-chinook/activity_05.png)Preview

1

![]()SELECT [columns] FROM [table]

Check ActivityStart project before checking your activities.

**6**New Millennium Employees

New hires on the block! Write a query to display all employees who were hired after the year 2004 (`2004-01-01`). Select the `FirstName`, `LastName`, and `HireDate` columns from the `Employee` table.

Your results should look like below:

![](https://static.prd.datawars.io/projects/lab-9ec5431f-sql-basics-where-practice-where-with-chinook/activity_06.png)Preview

1

![]()SELECT [columns] FROM [table]

Check ActivityStart project before checking your activities.

**7**Non-Rock Tracks

Let's find out what tracks aren't classified as rock! Write a SQL query to display all the tracks that aren't within the `Rock` genre. Remember that the `GenreId` for Rock is `1`. Your query should select the `Name` and `GenreId` columns from the `Track` table.

Your results should look like below:

![](https://static.prd.datawars.io/projects/lab-9ec5431f-sql-basics-where-practice-where-with-chinook/activity_07.png)Preview

> There are more rows in the output than shown in the screenshot.

1

![]()SELECT [columns] FROM [table]

Check ActivityStart project before checking your activities.

**8**Mystery Companies

The company is missing! Write a query to retrieve the customers who have no company information(ie. `Company` is NULL). Select the `FirstName`, `LastName`, and `Company` columns from the `Customer` table.

Your results should look like below:

![](https://static.prd.datawars.io/projects/lab-9ec5431f-sql-basics-where-practice-where-with-chinook/activity_08.png)Preview

> There are more rows in the output than shown in the screenshot.

1

![]()SELECT [columns] FROM [table]

Check ActivityStart project before checking your activities.

**9**Composerless Tracks

Where's the composer? Write a query to display all tracks with no composer information (ie. `Composer` is NULL). Select the `TrackId`, `Name`, and `UnitPrice` columns from the `Track` table.

Your results should look like below:

![](https://static.prd.datawars.io/projects/lab-9ec5431f-sql-basics-where-practice-where-with-chinook/activity_09.png)Preview

> There are more rows in the output than shown in the screenshot.

1

![]()SELECT [columns] FROM [table]

Check ActivityStart project before checking your activities.

**10**Matching Countries

Let's find out who's rocking out in the Canada! Write a query to display the names of all customers from `Customer` table who live in the 'Canada'. Select the `FirstName`, `LastName`, `City`, and `Address` columns and alias the `City` column as `Location`.

Your results should look like below:

![](https://static.prd.datawars.io/projects/lab-9ec5431f-sql-basics-where-practice-where-with-chinook/activity_10.png)Preview

> There are more rows in the output than shown in the screenshot.

1

![]()SELECT [columns] FROM [table]

Check Activity
