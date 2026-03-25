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

-- DISTINCT 
SELECT account_id,
		channel,
		COUNT(id) AS events
	FROM web_events
	GROUP BY account_id, channel
	ORDER BY account_id, events DESC;
-- this produces the same number of rows as above (you just now lose the count number column)
SELECT DISTINCT account_id,
				channel
		FROM web_events
		ORDER BY account_id;

-- Question
-- Use DISTINCT to test if there are any accounts associated with more than one region.
SELECT a.name account,
		r.name region
	FROM accounts a
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	JOIN region r
		ON r.id = s.region_id
	ORDER BY account;
-- now compare the number of rows to the below full list to see if the amount is bigger in the DISTINCT query then we know there are more than one region
SELECT DISTINCT id, name
	FROM accounts;

-- Have any sales reps worked on more than one account?
SELECT  s.id,
		s.name sales_rep,
		COUNT(*) num_accounts
	FROM accounts a
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	GROUP BY s.id, sales_rep
	ORDER BY num_accounts;
-- we now compare the above to the below distinct to see if there are a different number of rows but from the above we can see that every rep has more than one account
SELECT DISTINCT id, name
	FROM sales_reps;


-- HAVING
/*
-- Instead of running the below, the WHERE will throw an error, you need to use HAVING instead
SELECT account_id, 
		SUM(total_amt_usd) AS sum_total_amt_usd
	FROM orders
	WHERE SUM(total_amt_usd) >= 250000
	GROUP BY 1
	ORDER BY 2 DESC;
*/

SELECT account_id,
		SUM(total_amt_usd) AS sum_total_amt_usd
	FROM orders
	GROUP BY 1
	HAVING SUM(total_amt_usd) >= 250000;


-- Questions
-- How many of the sales reps have more than 5 accounts that they manage?
SELECT s.name sales_rep,
		COUNT(a.id) num_accounts
	FROM accounts a
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	GROUP BY sales_rep
	HAVING COUNT(a.id) > 5
	ORDER BY num_accounts DESC;

-- How many accounts have more than 20 orders?
SELECT a.name account,
		COUNT(o.id) num_orders
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY account
	HAVING COUNT(o.id) > 20
	ORDER BY num_orders;

-- Which account has the most orders?
SELECT a.name account,
		COUNT(o.id) num_orders
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY account
	ORDER BY num_orders DESC
	LIMIT 1;

-- Which accounts spent more than 30,000 usd total across all orders?
SELECT a.name accounts,
		SUM(o.total_amt_usd) total_spent
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY accounts
	HAVING SUM(o.total_amt_usd) > 30000
	ORDER BY total_spent;

-- Which accounts spent less than 1,000 usd total across all orders?
SELECT a.name accounts,
		SUM(o.total_amt_usd) total_spent
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY accounts
	HAVING SUM(o.total_amt_usd) > 1000
	ORDER BY total_spent;

-- Which account has spent the most with us?
SELECT a.name account,
		SUM(o.total_amt_usd) total_spent
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY account
	ORDER BY total_spent DESC
	LIMIT 1;

-- Which account has spent the least with us?
SELECT a.name account,
		SUM(o.total_amt_usd) total_spent
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY account
	ORDER BY total_spent
	LIMIT 1;

-- Which accounts used facebook as a channel to contact customers more than 6 times?
SELECT a.name account,
		w.channel,
		COUNT(w.channel) time_contacted
	FROM accounts a
	JOIN web_events w
		ON a.id = w.account_id
	GROUP BY account, w.channel
	HAVING w.channel = 'facebook' AND
		COUNT(w.channel) > 6
	ORDER BY time_contacted;

-- Which account used facebook most as a channel?
SELECT a.name account,
		w.channel,
		COUNT(w.channel) time_contacted
	FROM accounts a
	JOIN web_events w
		ON a.id = w.account_id
	GROUP BY account, w.channel
	HAVING w.channel = 'facebook'
	ORDER BY time_contacted DESC
	LIMIT 1;

-- Which channel was most frequently used by most accounts?
SELECT channel,
		COUNT(*) used
	FROM web_events
	GROUP BY channel
	ORDER BY used DESC
	LIMIT 1;

-- DISTINCT 
SELECT account_id,
		channel,
		COUNT(id) AS events
	FROM web_events
	GROUP BY account_id, channel
	ORDER BY account_id, events DESC;
-- this produces the same number of rows as above (you just now lose the count number column)
SELECT DISTINCT account_id,
				channel
		FROM web_events
		ORDER BY account_id;

-- Question
-- Use DISTINCT to test if there are any accounts associated with more than one region.
SELECT a.name account,
		r.name region
	FROM accounts a
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	JOIN region r
		ON r.id = s.region_id
	ORDER BY account;
-- now compare the number of rows to the below full list to see if the amount is bigger in the DISTINCT query then we know there are more than one region
SELECT DISTINCT id, name
	FROM accounts;

-- Have any sales reps worked on more than one account?
SELECT  s.id,
		s.name sales_rep,
		COUNT(*) num_accounts
	FROM accounts a
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	GROUP BY s.id, sales_rep
	ORDER BY num_accounts;

-- DATES
-- for looking at "what day of the week are the most sales?" you would do the following:
SELECT DATE_PART('dow', occurred_at) AS day_of_week,
		SUM(total) as total_qty
	FROM orders
	GROUP BY day_of_week
	ORDER BY total_qty DESC;


-- Questions
-- Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends in the yearly sales totals?
SELECT DATE_PART('year', occurred_at) AS order_year,
		SUM(total_amt_usd) AS total_sales
	FROM orders
	GROUP BY order_year
	ORDER BY total_sales DESC;

-- Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset?
SELECT DATE_PART('month', occurred_at) AS order_month,
		SUM(total_amt_usd) AS total_sales
	FROM orders
	GROUP BY order_month
	ORDER BY order_month;

-- Which year did Parch & Posey have the greatest sales in terms of total number of orders? Are all years evenly represented by the dataset?
SELECT DATE_PART('year', occurred_at) AS order_year,
		COUNT(*) AS total_sales
	FROM orders
	GROUP BY order_year
	ORDER BY order_year;

-- Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly represented by the dataset?
SELECT DATE_PART('month', occurred_at) AS order_month,
		COUNT(*) AS total_sales
	FROM orders
	GROUP BY order_month
	ORDER BY order_month;

-- In which month of which year did Walmart spend the most on gloss paper in terms of dollars?
SELECT DATE_TRUNC('month', o.occurred_at) ord_date, SUM(o.gloss_amt_usd) tot_spent
FROM orders o 
JOIN accounts a
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;


-- CASE Statements 
SELECT id,
		account_id, 
		occurred_at,
		channel,
		CASE WHEN channel = 'facebook' OR channel = 'direct' 
			THEN 'yes' 
			ELSE 'no' 
			END AS is_facebook
	FROM web_events
	ORDER BY occurred_at;

-- supposed we want to the numeric column of total orders and categorize them into buckets, we could use a CASE statement for that
SELECT account_id,
		occurred_at,
		total,
		CASE WHEN total > 500 THEN 'Over 500'
			WHEN total > 300 THEN '301 - 500'
			WHEN total > 100 THEN '101 - 300'
			ELSE '100 or under' 
			END AS total_group
	FROM orders;

-- so before we had issues with running the below with the division by zero issue 
SELECT id, 
		account_id, 
		standard_amt_usd/standard_qty AS unit_price
	FROM orders
	LIMIT 10;
-- now, with this, it will return 0 instead of the error
SELECT account_id, 
		CASE WHEN standard_qty = 0 OR standard_qty IS NULL THEN 0
			ELSE standard_amt_usd/standard_qty 
			END AS unit_price
	FROM orders
	LIMIT 10;

-- Combining CASE & Aggregations
SELECT CASE WHEN total > 500 
			THEN 'Over 500'
			ELSE '500 or under' 
			END AS total_group,
		COUNT(*) AS order_count
	FROM orders
	GROUP BY 1;

SELECT COUNT(1) AS orders_over_500_units
	FROM orders
	WHERE total > 500


-- Questions
/*
Write a query to display for each order, the account ID, total amount of the order, and the level of the order 
- ‘Large’ or ’Small’ - depending on if the order is $3000 or more, or smaller than $3000.
*/
SELECT account_id,
		total_amt_usd,
		CASE WHEN total_amt_usd >= 3000
			THEN 'Large'
			ELSE 'Small'
			END AS level_order
	FROM orders
	GROUP BY 1, 2
	ORDER BY 3;

/*
Write a query to display the number of orders in each of three categories, based on the total number of items in each order. 
The three categories are: 'At Least 2000', 'Between 1000 and 2000' and 'Less than 1000'.
*/
SELECT COUNT(*) AS order_count,
		CASE WHEN total > 2000 THEN 'At Least 2000'
			WHEN total >= 1000 AND total < 2000 THEN 'Between 1000 and 2000'
			ELSE 'Less than 1000'
			END AS total_order_category
	FROM orders
	GROUP BY 2;

/*
We would like to understand 3 different levels of customers based on the amount associated with their purchases. 
The top level includes anyone with a Lifetime Value (total sales of all orders) greater than 200,000 usd. 
The second level is between 200,000 and 100,000 usd. The lowest level is anyone under 100,000 usd. 
Provide a table that includes the level associated with each account. 
You should provide the account name, the total sales of all orders for the customer, and the level. 
Order with the top spending customers listed first.
*/
SELECT a.name account,
		SUM(total_amt_usd) AS total_sales,
		CASE WHEN SUM(total_amt_usd) > 200000 THEN 'top'
			WHEN SUM(total_amt_usd) > 100000 THEN 'middle'
			ELSE 'low'
			END AS lifetime_value
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY 1
	ORDER BY 2 DESC, 3;

-- or this:
SELECT a.name, SUM(total_amt_usd) total_spent, 
        CASE WHEN SUM(total_amt_usd) > 200000 THEN 'top'
        WHEN  SUM(total_amt_usd) > 100000 THEN 'middle'
        ELSE 'low' END AS customer_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id 
GROUP BY a.name
ORDER BY 2 DESC;

/*
We would now like to perform a similar calculation to the first, but we want to obtain the total amount spent by customers only in 2016 and 2017. 
Keep the same levels as in the previous question. Order with the top spending customers listed first.
*/
SELECT a.name account,
		o.occurred_at,
		SUM(total_amt_usd) AS total_sales,
		CASE WHEN SUM(total_amt_usd) > 200000 THEN 'top'
			WHEN SUM(total_amt_usd) > 100000 THEN 'middle'
			ELSE 'low'
			END AS lifetime_value
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY 1, 2
	HAVING occurred_at BETWEEN '2016-01-01' AND '2018-01-01'
	ORDER BY 3 DESC, 4;

-- or:
SELECT a.name, SUM(total_amt_usd) total_spent, 
        CASE WHEN SUM(total_amt_usd) > 200000 THEN 'top'
        WHEN  SUM(total_amt_usd) > 100000 THEN 'middle'
        ELSE 'low' END AS customer_level
FROM orders o
JOIN accounts a
ON o.account_id = a.id
WHERE occurred_at > '2015-12-31' 
GROUP BY 1
ORDER BY 2 DESC;

/*
We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders. 
Create a table with the sales rep name, the total number of orders, and a column with top or not depending on if they have more than 200 orders. 
Place the top sales people first in your final table.
*/
SELECT s.name, COUNT(*) num_ords,
        CASE WHEN COUNT(*) > 200 THEN 'top'
        ELSE 'not' END AS sales_rep_level
	FROM orders o
	JOIN accounts a
		ON o.account_id = a.id 
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	GROUP BY s.name
	ORDER BY 2 DESC;

/*
The previous didn't account for the middle, nor the dollar amount associated with the sales. 
Management decides they want to see these characteristics represented as well. 
We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders or more than 750000 in total sales. 
The middle group has any rep with more than 150 orders or 500000 in sales. 
Create a table with the sales rep name, the total number of orders, total sales across all orders, and a column with top, middle, 
or low depending on this criteria. Place the top sales people based on dollar amount of sales first in your final table. 
You might see a few upset sales people by this criteria!
*/
SELECT s.name, 
		COUNT(*) num_orders,
		SUM(total_amt_usd) total_amt,
		CASE WHEN COUNT(*) > 200 OR SUM(total_amt_usd) > 750000 THEN 'top'
			WHEN COUNT(*) > 150 OR SUM(total_amt_usd) > 500000 THEN 'middle'
			ELSE 'low' END AS sales_rep_level
	FROM orders o
	JOIN accounts a
		ON a.id = o.account_id
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	GROUP BY s.name
	ORDER BY total_amt DESC, num_orders, sales_rep_level;

-- or:
SELECT s.name, COUNT(*), SUM(o.total_amt_usd) total_spent, 
        CASE WHEN COUNT(*) > 200 OR SUM(o.total_amt_usd) > 750000 THEN 'top'
        WHEN COUNT(*) > 150 OR SUM(o.total_amt_usd) > 500000 THEN 'middle'
        ELSE 'low' END AS sales_rep_level
	FROM orders o
	JOIN accounts a
		ON o.account_id = a.id 
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	GROUP BY s.name
	ORDER BY 3 DESC;

-- Subqueries (can be thought of as nested queries)
-- wrapped in parentheses
-- lets say we want to find on average which channel sends the most traffic per day to Patch and Posey
SELECT channel,
		AVG(event_count) AS avg_event_count
	FROM
		(SELECT DATE_TRUNC('day', occurred_at) AS day,
				channel,
				COUNT(*) AS event_count
			FROM web_events
			GROUP BY 1, 2) sub
	GROUP BY 1
	ORDER BY 2 DESC;


-- Questions
/*
We want to find the average number of events for each day for each channel. 
The first table will provide us the number of events for each day and channel, 
and then we will need to average these values together using a second query.
*/
SELECT DATE_TRUNC('day', occurred_at) AS day,
		channel,
		COUNT(*) AS event_count
	FROM web_events
	GROUP BY 1, 2;

-- PART 1 sub query
SELECT DATE_TRUNC('day', occurred_at) AS day,
		channel,
		COUNT(*) AS event_count
	FROM web_events
	GROUP BY 1, 2;

-- PART 2 - full query
SELECT channel,
		AVG(event_count) AS avg_event_count
		FROM (SELECT DATE_TRUNC('day', occurred_at) AS day,
						channel,
						COUNT(*) AS event_count
					FROM web_events
					GROUP BY 1, 2) sub
		GROUP BY channel
		ORDER BY avg_event_count DESC;


-- Official Solution:
/*
First, we needed to group by the day and channel. 
Then ordering by the number of events (the third column) 
gave us a quick way to answer the first question.
*/
SELECT DATE_TRUNC('day',occurred_at) AS day,
       channel, COUNT(*) as events
FROM web_events
GROUP BY 1,2
ORDER BY 3 DESC;

/*
Here you can see that to get the entire table in question 1 back, 
we included an * in our* SELECT* statement. 
You will need to be sure to alias your table.
*/
SELECT *
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
                channel, COUNT(*) as events
          FROM web_events 
          GROUP BY 1,2
          ORDER BY 3 DESC) sub;

/*
Finally, here we are able to get a table that shows 
the average number of events a day for each channel.
*/
SELECT channel, AVG(events) AS average_events
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
                channel, COUNT(*) as events
         FROM web_events 
         GROUP BY 1,2) sub
GROUP BY channel
ORDER BY 2 DESC;

-- Subqueries
SELECT *
	FROM orders
	WHERE DATE_TRUNC('month', occurred_at) = 
		(SELECT DATE_TRUNC('month', MIN(occurred_at)) AS min_month
			FROM orders)
	ORDER BY occurred_at;


-- Step by Step subquery
-- step 1: initial query to find the month/year combo for the first orders placed
SELECT DATE_TRUNC('month', MIN(occurred_at)) AS order_month
	FROM orders;
-- step 2: now find only the orders that took place in the same month and year as the first order
-- then pull the average for each type of paper qty in this month
SELECT AVG(standard_qty) AS standard_avg,
		AVG(poster_qty) AS poster_avg,
		AVG(gloss_qty) AS gloss_avg,
		SUM(total_amt_usd) AS total_sum
	FROM orders
	WHERE DATE_TRUNC('month', occurred_at) =
		(SELECT DATE_TRUNC('month', MIN(occurred_at)) AS min_month
			FROM orders);

-- Subqueries Quiz
/*
Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.

First, I wanted to find the total_amt_usd totals associated with each sales rep, 
and I also wanted the region in which they were located. The query below provided this information.
*/
SELECT s.name AS sales_rep,
		r.name AS region,
		SUM(o.total_amt_usd) AS total_amt
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	JOIN region r
		ON r.id = s.region_id
	GROUP BY region, sales_rep
	ORDER BY 3 DESC;
-- next, pull the max for each region to use in final results
SELECT region, 
		MAX(total_amt) AS total_amt
	FROM (SELECT s.name AS sales_rep,
				r.name AS region,
				SUM(o.total_amt_usd) AS total_amt
			FROM accounts a
			JOIN orders o
				ON a.id = o.account_id
			JOIN sales_reps s
				ON s.id = a.sales_rep_id
			JOIN region r
				ON r.id = s.region_id
			GROUP BY region, sales_rep
			ORDER BY 3 DESC) t1
	GROUP BY 1;
-- now our final results are essentially a JOIN of the two tables for region and amount
SELECT t3.sales_rep,
		t3.region,
		t3.total_amt
	FROM(SELECT region, 
				MAX(total_amt) AS total_amt
			FROM(SELECT s.name sales_rep,
						r.name region,
						SUM(o.total_amt_usd) AS total_amt
					FROM accounts a
					JOIN orders o
						ON a.id = o.account_id
					JOIN sales_reps s
						ON s.id = a.sales_rep_id
					JOIN region r
						ON r.id = s.region_id
					GROUP BY region, sales_rep
					ORDER BY total_amt DESC) t1 -- this query returns the full list of all the sales_reps, region, and sum total amount
			GROUP BY 1) t2 -- this query selects the max total amount per region
	JOIN (SELECT s.name sales_rep,
				r.name region,
				SUM(o.total_amt_usd) AS total_amt
			FROM sales_reps s
			JOIN accounts a
				ON s.id = a.sales_rep_id
			JOIN orders o
				ON a.id = o.account_id
			JOIN region r
				ON r.id = region_id
			GROUP BY sales_rep, region
			ORDER BY total_amt DESC) t3 -- this query is the same as the t1 query to bring back the sales_rep names
	ON t3.region = t2.region AND t3.total_amt = t2.total_amt; -- the final query joins all the tables together on the region and total amount to return the exact results 

/*
For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were placed?
*/
-- first query pulls the total amount per region
SELECT r.name region,
		SUM(o.total_amt_usd) AS total_amt
	FROM sales_reps s
	JOIN accounts a
		ON s.id = a.sales_rep_id
	JOIN region r
		ON r.id = s.region_id
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY region;
-- next query is just taking the region with the MAX amount from the above query
-- there are two ways to do this:
		-- one us pulling the MAX using a subquery
		-- the other is order descending and pull the top value
SELECT MAX(total_amt)
	FROM (SELECT r.name region,
				SUM(o.total_amt_usd) AS total_amt
			FROM sales_reps s
			JOIN accounts a
				ON s.id = a.sales_rep_id
			JOIN region r
				ON r.id = s.region_id
			JOIN orders o
				ON a.id = o.account_id
			GROUP BY region);
-- now we want to pull the total orderes for the region with this new amount
SELECT r.name region,
		COUNT(o.total) AS total_orders
	FROM accounts a
	JOIN sales_reps s
		ON s.id = a.sales_rep_id
	JOIN orders o
		ON a.id = o.account_id
	JOIN region r
		ON r.id = s.region_id
	GROUP BY region
	HAVING SUM(o.total_amt_usd) = (
		SELECT MAX(total_amt)
			FROM (SELECT r.name region,
						SUM(o.total_amt_usd) AS total_amt
					FROM sales_reps s
					JOIN accounts a
						ON s.id = a.sales_rep_id
					JOIN region r
						ON r.id = s.region_id
					JOIN orders o
						ON a.id = o.account_id
					GROUP BY region) sub);

/*
How many accounts had more total purchases than the account name 
which has bought the most standard_qty paper throughout their lifetime as a customer?
*/
-- first query is to find the account that has the most standard_qty paper
SELECT a.name account,
		SUM(o.standard_qty) AS total_std,
		SUM(o.total) AS total_orders
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY account
	ORDER BY total_std DESC
	LIMIT 1;
-- now query all the accounts where the total purchases are more than the results from the first query
SELECT a.name account
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY account
	HAVING SUM(o.total) > (SELECT total_orders
							FROM (SELECT a.name account,
										SUM(o.standard_qty) AS total_std,
										SUM(o.total) AS total_orders
									FROM accounts a
									JOIN orders o
										ON a.id = o.account_id
									GROUP BY account
									ORDER BY total_std DESC
									LIMIT 1) sub);
-- now that we have the list of the accounts, we can use COUNT to get the total number
SELECT COUNT(*)
	FROM(SELECT a.name account
			FROM accounts a
			JOIN orders o
				ON a.id = o.account_id
			GROUP BY account
			HAVING SUM(o.total) > (SELECT total_orders
									FROM (SELECT a.name account,
												SUM(o.standard_qty) AS total_std,
												SUM(o.total) AS total_orders
											FROM accounts a
											JOIN orders o
												ON a.id = o.account_id
											GROUP BY account
											ORDER BY total_std DESC
											LIMIT 1) inner_tab)
				) counter_tab;

/*
For the customer that spent the most (in total over their lifetime as a customer) 
total_amt_usd, how many web_events did they have for each channel?
*/
-- first query is to find the customer who spend the most
SELECT a.id,
		a.name,
		SUM(o.total_amt_usd) AS total_spent
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY a.id, a.name
	ORDER BY total_spent DESC
	LIMIT 1;
-- next find total web_events for each channel for the id of the first query
SELECT a.name,
		COUNT(*) total_events,
		w.channel
	FROM web_events w
	JOIN accounts a
		ON a.id = w.account_id AND a.id = (SELECT id
											FROM (SELECT a.id,
														a.name,
														SUM(o.total_amt_usd) AS total_spent
													FROM accounts a
													JOIN orders o
														ON a.id = o.account_id
													GROUP BY a.id, a.name
													ORDER BY total_spent DESC
													LIMIT 1) most_spent)
	GROUP BY a.name, w.channel
	ORDER BY total_events DESC;

/*
What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts?
*/
-- first query is to find the top 10 total spending accounts
SELECT a.name,
		SUM(o.total_amt_usd) AS total_spent
	FROM accounts a
	JOIN orders o
		ON a.id = o.account_id
	GROUP BY a.name
	ORDER BY total_spent DESC
	LIMIT 10;
-- next query should be to find those lifetime average amounts spent for those 10 accounts
SELECT AVG(total_spent)
	FROM (SELECT a.name account,
				SUM(o.total_amt_usd) AS total_spent
			FROM accounts a
			JOIN orders o
				ON a.id = o.account_id
			GROUP BY a.name
			ORDER BY total_spent DESC
			LIMIT 10) temp;

/*
What is the lifetime average amount spent in terms of total_amt_usd, 
including only the companies that spent more per order, on average, than the average of all orders.
*/
-- first query is to find the average of all orders for total_amt_usd
SELECT AVG(o.total_amt_usd) AS avg_all
	FROM orders o;
-- now we want to pull accounts that are more than the results of this first query
SELECT o.account_id,
		AVG(o.total_amt_usd)
	FROM orders o
	GROUP BY 1
	HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) AS avg_all
									FROM orders o)
	ORDER BY 2;
-- now we need the average of these values
SELECT AVG(avg_amt)
	FROM (SELECT o.account_id,
				AVG(o.total_amt_usd) avg_amt
			FROM orders o
			GROUP BY 1
			HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) AS avg_all
											FROM orders o));


-- CTEs
-- Original Subquery:
SELECT channel,
		AVG(event_count) AS avg_event_count
	FROM (SELECT DATE_TRUNC('day', occurred_at) AS day,
				channel,
				COUNT(*) AS event_count
			FROM web_events
			GROUP BY day, channel) sub
	GROUP BY channel
	ORDER BY avg_event_count DESC;

-- Using WITH CTE:
WITH events AS (SELECT DATE_TRUNC('day', occurred_at) AS day,
						channel,
						COUNT(*) AS event_count
					FROM web_events
					GROUP BY day, channel)
SELECT channel,
		AVG(event_count) AS avg_event_count
	FROM events
	GROUP BY channel
	ORDER BY avg_event_count DESC;


-- now lets revise the previous queries into WITH queries
-- question: you need to find the average number of events for each channel per day
-- prev:
SELECT channel, 
		AVG(events) AS avg_events
	FROM (SELECT DATE_TRUNC('day', occurred_at) AS day,
				channel,
				COUNT(*) as events
			FROM web_events
			GROUP BY day, channel) sub
	GROUP BY channel
	ORDER BY avg_events DESC;
-- now lets revise with a WITH statement
WITH events AS (SELECT DATE_TRUNC('day', occurred_at) AS day,
						channel,
						COUNT(*) as events
					FROM web_events
					GROUP BY day, channel)
SELECT channel,
		AVG(events) AS avg_events
	FROM events
	GROUP BY channel
	ORDER BY avg_events DESC;



-- we can also use WITH statements to create additional tables to pull information from
WITH table1 AS (SELECT *
					FROM web_events),
		table2 AS (SELECT *
					FROM accounts)

SELECT *
	FROM table1
	JOIN table2
		ON table1.account_id = table2.id;


-- WITH questions
/*
Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.
*/
-- first WITH will be for finding the total sum amounts for each sales rep
WITH t1 AS (SELECT s.name AS sales_rep,
								r.name AS region,
								SUM(o.total_amt_usd) AS total_amt
							FROM accounts a
							JOIN orders o
								ON a.id = o.account_id
							JOIN sales_reps s
								ON s.id = a.sales_rep_id
							JOIN region r
								ON r.id = s.region_id
							GROUP BY region, sales_rep),
	t2 AS (SELECT region, 
					MAX(total_amt) AS total_amt
			FROM t1
			GROUP BY 1)
			
SELECT t1.sales_rep,
		t1.region,
		t1.total_amt
	FROM t1
	JOIN t2
		ON t1.region = t2.region AND t1.total_amt = t2.total_amt;

/*
For the region with the largest sales total_amt_usd, how many total orders were placed?
*/
WITH t1 AS (SELECT r.name region,
					SUM(o.total_amt_usd) AS total_amt
				FROM sales_reps s
				JOIN accounts a
					ON s.id = a.sales_rep_id
				JOIN orders o
					ON a.id = o.account_id
				JOIN region r
					ON r.id = s.region_id
				GROUP BY region),
	t2 AS (SELECT MAX(total_amt)
				FROM t1)

SELECT r.name,
		COUNT(o.total) AS total_orders
	FROM sales_reps s
	JOIN accounts a
		ON s.id = a.sales_rep_id
	JOIN orders o
		ON a.id = o.account_id
	JOIN region r
		ON r.id = s.region_id
	GROUP BY r.name
	HAVING SUM(o.total_amt_usd) = (SELECT * FROM t2);

/*
How many accounts had more total purchases than the account name which has 
bought the most standard_qty paper throughout their lifetime as a customer?
*/
WITH t1 AS (SELECT a.name AS account,
					SUM(o.standard_qty) AS total_std,
					SUM(o.total) AS total_orders
				FROM accounts a
				JOIN orders o
					ON a.id = o.account_id
				GROUP BY account
				ORDER BY total_std DESC
				LIMIT 1),
	t2 AS (SELECT a.name AS account
				FROM accounts a
				JOIN orders o
					ON a.id = o.account_id
				GROUP BY account
				HAVING SUM(o.total) > (SELECT total_orders FROM t1))
SELECT COUNT(*)
	FROM t2;

/*
For the customer that spent the most (in total over their lifetime as a customer) 
total_amt_usd, how many web_events did they have for each channel?
*/
WITH t1 AS (SELECT a.id,
					a.name,
					SUM(o.total_amt_usd) AS total_spent
				FROM accounts a
				JOIN orders o
					ON a.id = o.account_id
				GROUP BY a.id, a.name
				ORDER BY total_spent DESC
				LIMIT 1)
SELECT a.name,
		w.channel,
		COUNT(*) total_events
	FROM web_events w
	JOIN accounts a
		ON a.id = w.account_id AND a.id = (SELECT id
											FROM t1)
	GROUP BY a.name, w.channel
	ORDER BY total_events DESC;
														

/*
What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts?
*/
WITH t1 AS (SELECT a.name account,
					SUM(o.total_amt_usd) AS total_spent
				FROM accounts a
				JOIN orders o
					ON a.id = o.account_id
				GROUP BY account
				ORDER BY total_spent DESC
				LIMIT 10)
SELECT AVG(total_spent)
	FROM t1;

/*
What is the lifetime average amount spent in terms of total_amt_usd, 
including only the companies that spent more per order, on average, than the average of all orders.
*/
WITH t1 AS (SELECT AVG(o.total_amt_usd) avg_all 
				FROM orders o 
				JOIN accounts a 
					ON a.id = o.account_id), 
	t2 AS (SELECT o.account_id, 
					AVG(o.total_amt_usd) avg_amt 
				FROM orders o 
				GROUP BY 1 
				HAVING AVG(o.total_amt_usd) > (SELECT * FROM t1)) 
SELECT AVG(avg_amt) 
	FROM t2;


-- SQL Data Cleaning
/*
-- EXAMPLE:
SELECT first_name,
		last_name,
		phone_number,
		LEFT(phone_number, 3) AS area_code,
		RIGHT(phone_number, 8) AS phone_numnber_only,
		RIGHT(phone_number, LENGTH(phone_number) - 4) AS phone_number_alt
	FROM customer_data
*/

-- RIGHT & LEFT
/*
In the accounts table, there is a column holding the website for each company. 
The last three digits specify what type of web address they are using. 
A list of extensions (and pricing) is provided here(opens in a new tab). 
Pull these extensions and provide how many of each website type exist in the accounts table.
*/
WITH t1 AS (SELECT RIGHT(website, 3) AS web_extension
				FROM accounts)
SELECT web_extension, 
		COUNT(*) 
	FROM t1
	GROUP BY 1;
		
/*
There is much debate about how much the name (or even the first letter of a company name)(opens in a new tab) matters. 
Use the accounts table to pull the first letter of each company name to see the distribution of company names that begin with each letter (or number).
*/
SELECT LEFT(UPPER(name), 1) AS account_first_letter,
		COUNT(*) num_companies
	FROM accounts
	GROUP BY account_first_letter
	ORDER BY account_first_letter;

/*
Use the accounts table and a CASE statement to create two groups: 
one group of company names that start with a number and a second group of those company names that start with a letter. 
What proportion of company names start with a letter?
*/
SELECT SUM(num) nums, 
		SUM(letter) letters
	FROM (SELECT name,
				CASE WHEN LEFT(UPPER(name), 1) IN ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
						THEN 1 ELSE 0 END AS num,
				CASE WHEN LEFT(UPPER(name), 1) IN ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
						THEN 0 ELSE 1 END AS letter
			FROM accounts) t1;

/*
Consider vowels as a, e, i, o, and u. 
What proportion of company names start with a vowel, and what percent start with anything else?
*/
SELECT SUM(vowel) vowels,
		SUM(consonant) consonants
	FROM (SELECT name,
				CASE WHEN LEFT(UPPER(name), 1) IN ('A', 'E', 'I', 'O', 'U')
					THEN 1 ELSE 0 END AS vowel,
				CASE WHEN LEFT(UPPER(name), 1) IN ('A', 'E', 'I', 'O', 'U')
					THEN 0 ELSE 1 END AS consonant
			FROM accounts) t1;

-- POSITION, STRPOS, SUBSTR
-- Example:
/*
SELECT first_name,
		last_name,
		city_state,
		POSITION(',' IN city_state) AS comma_position,
		STRPOS(city_state, ',') AS substr_comma_position,
		LOWER(city_state) AS lowercase,
		UPPER(city_state) AS uppercase,
		LEFT(city_state, POSITION(',' IN city_state)) AS city
	FROM customer_data;
*/

-- Questions
/*
Use the accounts table to create first and last name columns that hold the first and last names for the primary_poc.
*/
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1) AS first_name,
		RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) AS last_name
	FROM accounts;
	
/*
Now see if you can do the same thing for every rep name in the sales_reps table. 
Again provide first and last name columns.
*/
SELECT LEFT(name, STRPOS(name, ' ') -1) AS first_name,
		RIGHT(name, LENGTH(name) - STRPOS(name, ' ')) AS last_name
	FROM sales_reps;

-- CONCAT & PIPING
-- Example:
/*
SELECT first_name,
		last_name,
		CONCAT(first_name, ' ', last_name) AS full_name
	FROM customer_data;
*/

-- Question:
/*
Each company in the accounts table wants to create an email address for each primary_poc. 
The email address should be the first name of the primary_poc . last name primary_poc @ company name .com.
*/
WITH t1 AS (SELECT primary_poc, 
					name,
					LEFT(primary_poc, STRPOS(primary_poc, ' ') -1) AS first_name,
					RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) AS last_name
				FROM accounts)
SELECT CONCAT(first_name, '.', last_name, '@', name, '.com') AS email_addresss
	FROM t1;

/*
You may have noticed that in the previous solution some of the company names include spaces, 
which will certainly not work in an email address. See if you can create an email address that will work by removing all of the spaces in the account name, 
but otherwise your solution should be just as in question 1. Some helpful documentation is here(opens in a new tab).
*/


/*
We would also like to create an initial password, which they will change after their first log in. 
The first password will be the first letter of the primary_poc's first name (lowercase), 
then the last letter of their first name (lowercase), the first letter of their last name (lowercase), 
the last letter of their last name (lowercase), the number of letters in their first name, 
the number of letters in their last name, and then the name of the company they are working with, all capitalized with no spaces.
*/














































