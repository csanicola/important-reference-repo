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


-- Joins help merge data together to make extracting the data easier
-- Inner Joins 
SELECT orders.*,
		accounts.* -- you also need to include variables from the other table otherwise, there will be nothing joined
	FROM orders 
	JOIN accounts
		ON orders.account_id = accounts.id; -- we always need to specify how we are joining the two tables together with an ON statement 

SELECT * -- this will also include everything instead of specifying everything for both tables like the above 
	FROM orders
	JOIN accounts
		ON orders.account_id = accounts.id;

-- Quiz Question:
-- Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.
SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty,
		accounts.website, accounts.primary_poc
	FROM orders
	JOIN accounts
		ON orders.account_id = accounts.id;

-- we can even join more than two tables if there are connecting primary and foreign keys that connect many together
SELECT *
	FROM web_events
	JOIN accounts
		ON web_events.account_id = accounts.id
	JOIN orders
		ON accounts.id = orders.account_id;

-- and we can specify columns in each table too
SELECT web_events.channel,
		accounts.name,
		orders.total
	FROM web_events
	JOIN accounts
		ON web_events.account_id = accounts.id
	JOIN orders
		ON accounts.id = orders.account_id;


-- instead of using the full table names each time, we can also give each table an alias which will make script alot cleaner
SELECT o.*, a.*
	FROM orders o -- you just put a space between the table name and the alias you want to use
	JOIN accounts a
		ON o.account_id = a.id;

-- you can also give columns that result from a join alias' too (useful if column names are the same/similar)
SELECT o.total total_orders,
		a.name account_name
	FROM orders o
	JOIN accounts a
		ON o.account_id = a.id;

-- Questions
-- Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.
SELECT w.occurred_at,
		w.channel,
		a.primary_poc,
		a.name -- to ensure the correct name was filtered
	FROM web_events w
	JOIN accounts a
		ON w.account_id = a.id
	WHERE a.name = 'Walmart';

-- Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT s.name sales_rep_name,
		r.name region_name,
		a.name account_name
	FROM sales_reps s
	JOIN region r
		ON s.region_id = r.id
	JOIN accounts a
		ON s.id = a.sales_rep_id
	ORDER BY a.name;

-- Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.
SELECT r.name region_name,
		a.name account_name,
		(o.total_amt_usd / (o.total + 0.01)) AS unit_price -- added the 0.01 to bypass the 'dividing by zero' error 
	FROM accounts a
	JOIN sales_reps s 
		ON a.sales_rep_id = s.id
	JOIN region r
		ON s.region_id = r.id
	JOIN orders o
		ON a.id = o.account_id;
	
-- Inner v Outer JOINs
-- lets say a sales rep wants to see only their own orders in the dataset 
-- the sales rep id is not in the orders table so we need a join to get that information
SELECT o.*,
		a.*
	FROM orders o
	LEFT JOIN accounts a
		ON o.account_id = a.id
	WHERE a.sales_rep_id = 321500
-- but if we want to include all orders and just flag the ones that are just hers, we can employ the ON clause 
	-- you can think of this as filtering after the JOIN
SELECT o.*,
		a.*
	FROM orders o
	LEFT JOIN accounts a
		ON o.account_id = a.id
	AND a.sales_rep_id = 321500 -- this is now only going to include the info from the accounts table that matches the sales_rep_id


-- Questions
/*
Provide a table that provides the region for each sales_rep along with their associated accounts. 
This time only for the Midwest region. Your final table should include three columns: 
the region name, the sales rep name, and the account name. 
Sort the accounts alphabetically (A-Z) according to account name.
*/
SELECT r.name region,
		s.name sales_rep,
		a.name account
	FROM sales_reps s
	JOIN accounts a
		ON s.id = a.sales_rep_id
	JOIN region r
		ON s.region_id = r.id
	WHERE r.name = 'Midwest'
	ORDER BY a.name;

/*
Provide a table that provides the region for each sales_rep along with their associated accounts. 
This time only for accounts where the sales rep has a first name starting with S and in the Midwest region. 
Your final table should include three columns: 
the region name, the sales rep name, and the account name. 
Sort the accounts alphabetically (A-Z) according to account name.
*/
SELECT r.name region,
		a.name account,
		s.name sales_rep
	FROM sales_reps s
	JOIN accounts a
		ON s.id = a.sales_rep_id
	JOIN region r
		ON r.id = s.region_id
	WHERE r.name = 'Midwest' AND
		s.name LIKE 'S%'
	ORDER BY a.name;

/*
Provide a table that provides the region for each sales_rep along with their associated accounts. 
This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. 
Your final table should include three columns: 
the region name, the sales rep name, and the account name. 
Sort the accounts alphabetically (A-Z) according to account name.
*/
SELECT r.name region,
		s.name sales_rep,
		a.name account
	FROM sales_reps s
	JOIN accounts a
		ON s.id = a.sales_rep_id
	JOIN region r
		ON r.id = s.region_id
	WHERE r.name = 'Midwest' AND
		s.name LIKE '% K%'
	ORDER BY a.name;

/*
Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. .
However, you should only provide the results if the standard order quantity exceeds 100. Your final table should have 3 columns: 
region name, account name, and unit price. 
In order to avoid a division by zero error, adding .01 to the denominator here is helpful total_amt_usd/(total+0.01).
*/
SELECT r.name region,
		a.name account,
		o.total_amt_usd / (o.total + 0.01) unit_price
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	JOIN region r
		ON r.id = s.region_id
	WHERE o.standard_qty > 100;

/*
Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. 
Your final table should have 3 columns: 
region name, account name, and unit price. 
Sort for the smallest unit price first. 
In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).
*/
SELECT r.name region,
		a.name account,
		o.total_amt_usd / (o.total + 0.01) unit_price
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	JOIN region r
		ON r.id = s.region_id
	WHERE o.standard_qty > 100 AND
		o.poster_qty > 50
	ORDER BY unit_price;

/*
Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. 
Your final table should have 3 columns: 
region name, account name, and unit price. 
Sort for the smallest unit price first. 
In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).
Sort for the largest unit price first.
*/
SELECT r.name region,
		a.name account,
		o.total_amt_usd / (o.total + 0.01) unit_price
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	JOIN region r
		ON r.id = s.region_id
	WHERE o.standard_qty > 100 AND
		o.poster_qty > 50
	ORDER BY unit_price DESC;

/*
What are the different channels used by account id 1001? 
Your final table should have only 2 columns: 
account name and the different channels. 
You can try SELECT DISTINCT to narrow down the results to only the unique values.
*/
SELECT DISTINCT a.name account,
		w.channel
	FROM accounts a
	JOIN web_events w
		ON a.id = w.account_id
	WHERE a.id = '1001';

/*
Find all the orders that occurred in 2015. 
Your final table should have 4 columns: occurred_at, account name, order total, and order total_amt_usd.
*/
SELECT o.occurred_at,
		a.name account,
		o.total,
		o.total_amt_usd
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	WHERE o.occurred_at BETWEEN '2015-01-01' AND '2016-01-01'
	ORDER BY o.occurred_at;

-- NULLS
SELECT *
	FROM accounts
	WHERE primary_poc IS NULL; -- can't do `WHERE primary_poc = NULL`

-- we can also use aggregates in our queries
-- this is to find how many rows are in a table:
SELECT COUNT(*)
	FROM accounts;

SELECT COUNT(accounts.id)
	FROM accounts;

-- you can also use aggregates to create new columns with the results 
SELECT COUNT(*) AS account_count
	FROM accounts;

SELECT COUNT(primary_poc) AS number_of_reps
	FROM accounts;
-- if you get a count for a specific column that is less than the number of rows, then you know there are NULLs in that column

-- SUM is similar to COUNT but will ignore NULL values
SELECT SUM(standard_qty) AS standard,
		SUM(gloss_qty) AS gloss,
		SUM(poster_qty) AS poster
	FROM orders;

-- Questions
/*
Find the total amount of poster_qty paper ordered in the orders table.
*/
SELECT SUM(poster_qty) AS total_poster_sales
	FROM orders;

/*
Find the total amount of standard_qty paper ordered in the orders table.
*/
SELECT SUM(standard_qty) AS total_standard_sales
	FROM orders;

/*
Find the total dollar amount of sales using the total_amt_usd in the orders table.
*/
SELECT SUM(total_amt_usd) AS total_dollar_sales
	FROM orders;

/*
Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table. 
This should give a dollar amount for each order in the table.
*/
SELECT *,
		gloss_amt_usd + standard_amt_usd AS total_standard_gloss
	FROM orders;

/*
Find the standard_amt_usd per unit of standard_qty paper. 
Your solution should use both an aggregation and a mathematical operator.
*/
SELECT SUM(standard_amt_usd) / SUM(standard_qty) AS standard_price_per_unit
	FROM orders;


-- the other aggregate functions work the same way (with MIN, MAX, AVG)

-- Questions
/*
When was the earliest order ever placed? You only need to return the date.
*/
SELECT MIN(occurred_at)
	FROM orders;

/*
Try performing the same query as in question 1 without using an aggregation function.
*/
SELECT occurred_at
	FROM orders
	ORDER BY occurred_at
	LIMIT 1;

/*
When did the most recent (latest) web_event occur?
*/
SELECT MAX(occurred_at)
	FROM web_events;
	
/*
Try to perform the result of the previous query without using an aggregation function.
*/
SELECT occurred_at
	FROM web_events
	ORDER BY occurred_at DESC
	LIMIT 1;

/*
Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased per order. 
Your final answer should have 6 values - one for each paper type for the average number of sales, as well as the average amount.
*/
SELECT 	AVG(standard_qty) AS standard_qty_avg,
		AVG(standard_amt_usd) AS standard_amt_avg,
		AVG(gloss_qty) AS gloss_qty_avg,
		AVG(gloss_amt_usd) AS gloss_amt_avg,
		AVG(poster_qty) AS poster_qty_avg,
		AVG(poster_amt_usd) AS poster_amt_avg
	FROM orders;

/*
Via the video, you might be interested in how to calculate the MEDIAN. 
Though this is more advanced than what we have covered so far try finding 
- what is the MEDIAN total_usd spent on all orders?
*/
SELECT *
	FROM (SELECT total_amt_usd
			FROM orders
			ORDER BY total_amt_usd 
			LIMIT 3457) AS Table1
	ORDER BY total_amt_usd DESC
	LIMIT 2;


-- GROUP BY
SELECT account_id,
		SUM(standard_qty) AS standard_sum,
		SUM(gloss_qty) AS gloss_sum,
		SUM(poster_qty) AS poster_sum
	FROM orders
	GROUP BY account_id
	ORDER BY account_id;


-- Questions
/*
Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.
*/
SELECT a.name,
		o.occurred_at
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	ORDER BY o.occurred_at
	LIMIT 1;

/*
Find the total sales in usd for each account. 
You should include two columns - the total sales for each company's orders in usd and the company name.
*/
SELECT a.name,
		SUM(o.total_amt_usd) AS total_sales
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY a.name;

/*
Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? 
Your query should return only three values - the date, channel, and account name.
*/
SELECT w.occurred_at,
		w.channel,
		a.name
	FROM web_events w
	JOIN accounts a
		ON a.id = w.account_id
	ORDER BY w.occurred_at DESC
	LIMIT 1;

/*
Find the total number of times each type of channel from the web_events was used. 
Your final table should have two columns - the channel and the number of times the channel was used.
*/
SELECT channel,
		COUNT(channel)
	FROM web_events
	GROUP BY channel;

/*
Who was the primary contact associated with the earliest web_event?
*/
SELECT a.primary_poc,
		w.occurred_at
	FROM accounts a
	JOIN web_events w
		ON a.id = w.account_id
	ORDER BY w.occurred_at 
	LIMIT 1;

/*
What was the smallest order placed by each account in terms of total usd. 
Provide only two columns - the account name and the total usd. Order from smallest dollar amounts to largest.
*/
SELECT a.name,
		MIN(o.total_amt_usd) smallest_order
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY a.name
	ORDER BY smallest_order;

/*
Find the number of sales reps in each region. 
Your final table should have two columns - the region and the number of sales_reps. 
Order from fewest reps to most reps.
*/
SELECT r.name,
		COUNT(s.name) AS number_of_reps
	FROM region r
	JOIN sales_reps s
		ON r.id = s.region_id
	GROUP BY r.name
	ORDER BY number_of_reps;



-- you can also GROUP BY multiple columns
SELECT account_id,
		channel,
		COUNT(id) AS events
	FROM web_events
	GROUP BY account_id, channel
	ORDER BY account_id, channel;

-- QUESTIONS
/*
For each account, determine the average amount of each type of paper they purchased across their orders. 
Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account.
*/
SELECT a.name,
		AVG(o.standard_qty) avg_stand,
		AVG(o.poster_qty) avg_post,
		AVG(o.gloss_qty) avg_gloss
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY a.name;

/*
For each account, determine the average amount spent per order on each paper type. 
Your result should have four columns - one for the account name and one for the average amount spent on each paper type.
*/
SELECT a.name,
		AVG(o.standard_amt_usd) avg_stand,
		AVG(o.gloss_amt_usd) avg_gloss,
		AVG(o.poster_amt_usd) avg_post
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY a.name;

/*
Determine the number of times a particular channel was used in the web_events table for each sales rep. 
Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. 
Order your table with the highest number of occurrences first.
*/
SELECT s.name,
		w.channel,
		COUNT(*) AS num_events
	FROM accounts a
	JOIN web_events w
		ON a.id = w.account_id
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	GROUP BY w.channel, s.name
	ORDER BY num_events DESC;

/*
Determine the number of times a particular channel was used in the web_events table for each region. 
Your final table should have three columns - the region name, the channel, and the number of occurrences. 
Order your table with the highest number of occurrences first.
*/
SELECT r.name,
		w.channel,
		COUNT(w.channel) num_events
	FROM web_events w
	JOIN accounts a
		ON a.id = w.account_id
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	JOIN region r
		ON r.id = s.region_id
	GROUP BY r.name, w.channel
	ORDER BY num_events DESC;























