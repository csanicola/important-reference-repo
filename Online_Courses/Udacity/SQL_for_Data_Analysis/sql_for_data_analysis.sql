----------------------------------------------------------
-- SQL for Data Analysis
-- Udacity Intermediate SQL course 
----------------------------------------------------------
-- Data Used for this practice:
-- Parch & Posey fake data set (of a company that sells paper - have 50 sales reps spread across the four regions of the US)

-- first, let's look at the data using a SELECT statement 
SELECT * -- an asterisk means "all"
    FROM orders; -- this will show all the data in the orders table 

-- now looking at specific columns
SELECT id, account_id, occurred_at
	FROM orders;

-- using LIMIT can shorten the amount of rows returned for each query
-- this is useful for a quick glance at a time and the query time is much shorter 
SELECT *
	FROM web_events
	LIMIT 100;

-- LIMIT can also be used return the "top x" of a table (or bottom)
SELECT occurred_at, account_id, channel
	FROM web_events
	LIMIT 15;

-- if there is a specific order of the data we want to return, we can use ORDER BY but it MUST come before the LIMIT clause 
-- the below statement returns the top 10 newest orders in the orders table
SELECT *
	FROM orders
	ORDER BY occurred_at DESC -- default is to order by ascending so need to specify if want descending instead
	LIMIT 10;

-- ORDER BY Examples:
-- return 10 earliest orders in the orders table, include the id, occurred_at, and total_amt_usd
SELECT id, occurred_at, total_amt_usd
	FROM orders
	ORDER BY occurred_at 
	LIMIT 10;

-- return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd
SELECT id, account_id, total_amt_usd
	FROM orders
	ORDER BY total_amt_usd DESC
	LIMIT 5;

-- return the lowest 20 orders in terms of smallest total_amt_usd. Include the id, account_id, and total_amt_usd.
SELECT id, account_id, total_amt_usd
	FROM orders
	ORDER BY total_amt_usd
	LIMIT 20;

-- you can even order by multiple columns at once
SELECT id, account_id, occurred_at, total_amt_usd
	FROM orders 
	ORDER BY total_amt_usd, occurred_at DESC
	LIMIT 20;


-- Questions
-- Write a query that displays the order ID, account ID, and total dollar amount for all the orders, sorted first by the account ID (in ascending order), and then by the total dollar amount (in descending order).
SELECT id, account_id, total_amt_usd
	FROM orders
	ORDER BY account_id, total_amt_usd DESC;

-- Now write a query that again displays order ID, account ID, and total dollar amount for each order, but this time sorted first by total dollar amount (in descending order), and then by account ID (in ascending order).
SELECT id, account_id, total_amt_usd
	FROM orders
	ORDER BY total_amt_usd DESC, account_id;

-- Compare the results of these two queries above. How are the results different when you switch the column you sort on first?
-- our results are incredibly different just by changing the sort order because it completely changes what is prioritized first vs second and how the final table comes out which if we add LIMITs too would possibly not even return the same rows of data

-- filtering queries using the WHERE clause:
-- Pulls the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.
SELECT *
	FROM orders
	WHERE gloss_amt_usd >= 1000
	LIMIT 5;

-- Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.
SELECT *
	FROM orders
	WHERE total_amt_usd < 500
	LIMIT 10;

-- Using Operators for WHERE clauses (for non-numeric values)
-- for non-numeric:
SELECT *
	FROM accounts
	WHERE name = 'United Technologies';

SELECT *
	FROM accounts
	WHERE name != 'United Technologies';

SELECT name, website, primary_poc
	FROM accounts
	WHERE name = 'Exxon Mobil';

-- Derived Columns - columns created from queries from data manipulation 
SELECT account_id,
		occurred_at,
		standard_qty,
		gloss_qty,
		poster_qty,
		gloss_qty + poster_qty AS nonstandard_qty
	FROM orders;

SELECT id,
		(standard_amt_usd/total_amt_usd)*100 AS std_percent,
		total_amt_usd
	FROM orders
	LIMIT 10;


-- Questions using Arithmetic Operations
-- Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. Limit the results to the first 10 orders, and include the id and account_id fields.
SELECT id, 
		account_id,
		standard_amt_usd / standard_qty AS unit_price
	FROM orders
	LIMIT 10;

-- Write a query that finds the percentage of revenue that comes from poster paper for each order. You will need to use only the columns that end with _usd. (Try to do this without using the total column.) Display the id and account_id fields also. NOTE - you will receive an error with the correct solution to this question. This occurs because at least one of the values in the data creates a division by zero in your formula. You will learn later in the course how to fully handle this issue. For now, you can just limit your calculations to the first 10 orders, as we did in question #1, and you'll avoid that set of data that causes the problem.
SELECT id,
		account_id,
		(poster_amt_usd/total_amt_usd)*100 AS poster_percent,
		poster_amt_usd,
		total_amt_usd
	FROM orders
	LIMIT 10;

SELECT id,
		account_id,
		(poster_amt_usd / (standard_amt_usd + gloss_amt_usd + poster_amt_usd))*100 AS poster_percent
	FROM orders
	LIMIT 10;


-- Questions using the LIKE operator
-- Use the accounts table to find:

-- All the companies whose names start with 'C'.
SELECT *
	FROM accounts
	WHERE name LIKE 'C%';

-- All companies whose names contain the string 'one' somewhere in the name.
SELECT *
	FROM accounts
	WHERE name LIKE '%one%';

-- All companies whose names end with 's'.
SELECT *
	FROM accounts
	WHERE name LIKE '%s';


-- using the IN operator is used for both numeric and text columns and is for if we want to query more than one column or more than one item in a particular column
SELECT *
	FROM orders
	WHERE account_id IN (1001, 1021);

-- Questions using IN operator
-- Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.
SELECT name, primary_poc, sales_rep_id
	FROM accounts
	WHERE name IN ('Walmart', 'Target', 'Nordstrom');

-- Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.
SELECT *
	FROM web_events
	WHERE channel IN ('organic', 'adwords');

-- Questions using the NOT operator
-- Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.
SELECT name, primary_poc, sales_rep_id
	FROM accounts
	WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

-- Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or adwords methods.
SELECT *
	FROM web_events
	WHERE channel NOT IN ('organic', 'adwords');

-- Use the accounts table to find:
-- All the companies whose names do not start with 'C'.
SELECT *
	FROM accounts
	WHERE name NOT LIKE 'C%';

-- All companies whose names do not contain the string 'one' somewhere in the name.
SELECT *
	FROM accounts
	WHERE name NOT LIKE '%one%';

-- All companies whose names do not end with 's'.
SELECT *
	FROM accounts
	WHERE name NOT LIKE '%s';

-- AND and BETWEEN are also used like IN where combining clauses
SELECT *
	FROM orders
	WHERE occurred_at >= '2016-04-01' AND occurred_at <= '2016-10-01'
	ORDER BY occurred_at DESC;

-- sometimes its easier to use BETWEEN instead of AND to make the code cleaner
-- From this:
SELECT *
	FROM orders
	WHERE total_amt_usd >= 20 AND total_amt_usd <= 500;
-- To this:
SELECT *
	FROM orders
	WHERE total_amt_usd BETWEEN 20 AND 500;

-- Questions using AND and BETWEEN operators
-- Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.
SELECT *
	FROM orders
	WHERE standard_qty >= 1000 AND
		poster_qty = 0 AND
		gloss_qty = 0;

-- Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.
SELECT *
	FROM accounts
	WHERE name NOT LIKE 'C%' AND name LIKE '%s';

-- When you use the BETWEEN operator in SQL, do the results include the values of your endpoints, or not? Figure out the answer to this important question by writing a query that displays the order date and gloss_qty data for all orders where gloss_qty is between 24 and 29. Then look at your output to see if the BETWEEN operator included the begin and end values or not.
SELECT occurred_at, gloss_qty
	FROM orders
	WHERE gloss_qty BETWEEN 24 AND 29;
-- using BETWEEN does include the upper and lower limits to the request

-- Use the web_events table to find all information regarding individuals who were contacted via the organic or adwords channels, and started their account at any point in 2016, sorted from newest to oldest.
SELECT *
	FROM web_events
	WHERE channel IN ('organic', 'adwords') AND
		occurred_at BETWEEN '2016-01-01' AND '2017-01-01' -- for a whole year, you have to use the first of the year to account for the time because just keeping it at 2016-12-31 stops at 00:00:00 for that date
	ORDER BY occurred_at DESC;

-- OR is similar to AND where it takes multiple values but rows don't have to meet all the conditions, just one or the other
-- Questions using the OR operator
-- Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.
SELECT id
	FROM orders
	WHERE gloss_qty > 4000 OR poster_qty > 4000;

-- Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.
SELECT *
	FROM orders
	WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

-- Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.
SELECT *
	FROM accounts
	WHERE (name LIKE 'C%' OR name LIKE 'W%') AND
		((primary_poc LIKE '%ana%' OR primary_poc LIKE '%Ana%') AND 
		(primary_poc NOT LIKE '%eana%'));


























