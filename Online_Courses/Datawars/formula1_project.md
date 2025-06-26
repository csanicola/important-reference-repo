# Advanced SQL Subqueries for Formula 1 Data Analysis

[Source](https://app.datawars.io/project/71f82edb-922f-4393-984d-168215966a2a?page=1)

## Introduction

Buckle up and get ready to shift gears as we dive into the fast-paced world of Formula 1 using Advanced SQL Subqueries! 🚀

In this project, you'll tackle real-world F1 racing data, using subqueries to extract insights from race results, driver performances, constructor standings, and much more. Just like an F1 race, data analysis requires precision, strategy, and speed—and that's exactly what you'll master here!

🏁 What’s in store for you?

- Unlock hidden patterns in race results using subqueries in SELECT, FROM, and WHERE.
- Navigate through Correlated Subqueries to analyze driver and constructor performances dynamically.
- Power through Column Creation & Aggregation, calculating crucial statistics like fastest laps, top-scoring constructors, and more.

By the time you cross the finish line, you'll have hands-on experience with subqueries, logical operators, string functions, and more—all applied to the high-speed world of Formula 1! 🏆

So, start your engines, and let’s dive into SQL like never before!

## Basic Activities

1. Find Constructors That Have Entered a Race

Write a query to list constructor names from the `constructors` table that have participated in at least one race.

Expected outcome:

This is how your result will look like:

![img](https://static.prd.datawars.io/projects/lab-4ef1k3-subqueries-2-adv-sql/activity_2.png)

```sql

```

2. Retrieve the Names of Circuits That Have Hosted a Race

Write a query to fetch circuit names from the `circuits` table where the `circuitId` exists in the races table.

Expected outcome:

This is how your result will look like:

![img](https://static.prd.datawars.io/projects/lab-4ef1k3-subqueries-2-adv-sql/activity_3.png)

```sql

```

3. Fetch the Names of Drivers Who Have Won a Race

Write a query to retrieve driver names from the `drivers` table where the driver has finished first place in the results table.

Expected outcome:

This is how your result will look like:

![img](https://static.prd.datawars.io/projects/lab-4ef1k3-subqueries-2-adv-sql/activity_4.png)

```sql

```

4. Find the Oldest Race in the Database

Write a query to get the race name and year of the oldest race in the database using a subquery in the `SELECT` clause to determine the minimum year from the races table.

Expected outcome:

This is how your result will look like:

![img](https://static.prd.datawars.io/projects/lab-4ef1k3-subqueries-2-adv-sql/activity_5.png)

```sql

```

5. Retrieve All Races That Occurred in the Latest Year

Write a query to fetch race names and years from the `races` table where the year is the most recent. Use a subquery in the WHERE clause to get the maximum year.

Expected outcome:

This is how your result will look like:

![img](https://static.prd.datawars.io/projects/lab-4ef1k3-subqueries-2-adv-sql/activity_6.png)

```sql

```

6. Identify Drivers Who Have Raced for More Than One Constructor

Write a query to retrieve driver names who have participated in races for more than one constructor. Use a subquery in the FROM clause to count the number of unique constructor IDs per driver. Apply the `GROUPBY` clause to group results by driver and use the `HAVING` clause to filter those who have raced for more than one constructor.

Expected outcome:

This is how your result will look like:

![img](https://static.prd.datawars.io/projects/lab-4ef1k3-subqueries-2-adv-sql/activity_7.png)

```sql

```

## Correlated Subqueries

7. Find the Youngest Driver in Each Race

Write a query to find the youngest driver in each race by retrieving the race ID and the driver reference. Use a `JOIN` between the `results` and `drivers` tables to link race participation with driver details. Then, apply a correlated subquery in the `WHERE` clause to fetch the driver with the minimum birth year (`dob`) for each race.

Expected outcome:

This is how your result will look like:

![img](https://static.prd.datawars.io/projects/lab-4ef1k3-subqueries-2-adv-sql/activity_8.png)

```sql

```

8. Find the Most Recent Race for Each Circuit

Write a query to fetch circuitId, name, year for the most recent race held there. Use a correlated subquery in the `WHERE` clause to get the maximum year for each `circuitId`.

Expected outcome:

This is how your result will look like:

![img](https://static.prd.datawars.io/projects/lab-4ef1k3-subqueries-2-adv-sql/activity_10.png)

```sql

```

## Column Creation and Aggregation

9. Calculate the Total Wins for Each Constructor

Write a query to retrieve constructor names and the total number of race wins they have achieved. Use a subquery in the `SELECT` clause to count the number of times each constructor's cars finished in 1st place (`positionOrder` = 1) in the results table. Rename the calculated column as `Total_Wins` and limit the output to `15` rows.

Expected outcome:

This is how your result will look like:

![img](https://static.prd.datawars.io/projects/lab-4ef1k3-subqueries-2-adv-sql/activity_13.png)

```sql

```

10. Compute the Fastest Pit Stop for Each Driver

Write a query to retrieve driver names and their fastest pit stop time from the `pitStops` table. Use `MIN(duration)` and rename the column as `Fastest_Pit_Stop`. Limit the table to `10` rows.

Expected outcome:

This is how your result will look like:

![img](https://static.prd.datawars.io/projects/lab-4ef1k3-subqueries-2-adv-sql/activity_15.png)

```sql

```
