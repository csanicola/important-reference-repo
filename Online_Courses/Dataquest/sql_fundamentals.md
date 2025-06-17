# SQL Fundamentals

[Source](https://app.dataquest.io/c/150/m/805/exploring-the-database-and-schema/1/introduction?path=5&slug=sql-fundamentals&version=2)

Welcome to your introduction to SQL!

Structured Query Language (SQL, usually pronounced S-Q-L or "sequel") is a programming language designed for managing data within a Database Management System (DBMS) — a software that stores, manipulates, and retrieves data efficiently.

![img](https://s3.amazonaws.com/dq-content/805/1.1-m805.svg)

### Reading From a Table

The types of operations SQL can perform are often referred to as _CRUD_ , or "create, read, update, delete." As data professionals, we're most likely to perform _read_ operations, and that will be the emphasis of this course.

![](https://s3.amazonaws.com/dq-content/805/2.1-m805.svg)

The **superstore** database contains a table called **returns**, which contains information about which orders were returned. Our first line of code is to retrieve the first five rows of this table:

```sql
SELECT *
  FROM returns
LIMIT 5;
```

Let's unpack this code a little further:

- - is a special character meaning "all." We'll learn more about the **SELECT** clause later, but for now we can read this line as "select all columns."
- **FROM returns** tells SQL which table to read data from. We'll learn more about how databases and tables work and how to manage them.
- **LIMIT 5** returns the number of rows returned to 5. Remember, a table might have millions of rows — attempting to return them all could get messy!

### Different SQL Dialects

There are many different versions of SQL (also called SQL flavors or dialects). We have been coding in a flavor of SQL called SQLite (pronounced " _sequel light_ ").

![](https://s3.amazonaws.com/dq-content/805/3.1-m805.svg)

Don't worry, though. These different versions are more alike than they are different (just like the different dialects of English). Nearly everything we'll learn in this course — and subsequent SQL courses — applies to all SQL flavors, thanks to the **ANSI SQL standard** .

ANSI SQL is a standardized version of SQL that serves as a common ground for all SQL dialects. It ensures that the core functionality of SQL remains consistent across different SQL implementations, making it easier for developers to work with various database systems.

However, there are still differences in syntax, functions, and features among SQL dialects. One such difference is how we limit the displayed results.

For example, in [T-SQL](https://en.wikipedia.org/wiki/Transact-SQL) (Microsoft's SQL flavor), we would write the following query:

```sql
SELECT *
  FROM orders
 LIMIT 5;
```

...like this:

```sql
SELECT TOP 5 *
  FROM orders;
```

It uses a **different word** in a **different location** .

![](https://s3.amazonaws.com/dq-content/805/3.2-m805.svg)

Note that the query above will not run in SQLite (the flavor we're learning). We're showing it here simply as a demonstration.

When working with different SQL dialects, it's important to be aware of their specific syntax and features. However, thanks to the ANSI SQL standard, the majority of the concepts and techniques we learn in SQLite will still be applicable across various SQL implementations.

### SELECT Rows and Fields

Most databases we'll work with are like **superstore** in that they consist of multiple _tables_ of data.

Like a table in a spreadsheet, a database table consists of rows and columns which are often called _records_ and _fields_ .

![](https://s3.amazonaws.com/dq-content/805/4.1-m805.svg)

We've seen how to reduce the number of **records** shown by using the **LIMIT** clause:

```sql
SELECT *
  FROM orders
 LIMIT 5;
```

But what about reducing the number of **fields** shown? As we learned earlier, we can retrieve the data from _all_ fields in a table with help of the **\*** wildcard. If we want to select specific fields to be returned by the query, we can list them in the **SELECT** clause, separated by commas:

```sql
SELECT order_id, order_date, category, subcategory
  FROM orders;
```

When we specify the columns we want returned, the query will execute more quickly and be easier to interpret.

### Defining Relational Databases

As mentioned on the last screen, databases have multiple tables. For example, the **superstore** database has 3 tables:

1. orders
2. returns
3. managers

Each table in a database is connected to other tables through fields that relate to one another. This type of database is called a **relational database** , and we can visualize the relationship between tables with a schema diagram. Let's take a look at the diagram for our database:

![](https://s3.amazonaws.com/dq-content/805/5.1-m805.svg)

A database can store large amounts of data more securely and efficiently than a spreadsheet or a text file. However, unlike simply opening a spreadsheet, we actually have to "ask" for data from the database. This is what we do when we write queries in SQL.

We’ll learn how to join multiple database tables together in a future course. For now, each query will just look at one table.

### Aliasing Results

Sometimes the notations used to name fields in a table are easy to type, but may look awkward to present.

For example, what if we'd like to rename the following table so the headers have more human-readable names like "Order ID", "Order Date" and "Ship Date?"

| order_id       | order_date | ship_date  |
| -------------- | ---------- | ---------- |
| CA-2016-152156 | 2016-11-08 | 2016-11-11 |
| CA-2016-152156 | 2016-11-08 | 2016-11-11 |
| CA-2016-138688 | 2016-06-12 | 2016-06-16 |

It's possible to do that right from the **SELECT** clause with help of the **AS** keyword. **AS** will let you temporarily rename or **alias** these fields:

```sql
SELECT order_id AS 'Order ID',
       order_date AS 'Order Date',
       ship_date AS 'Ship Date'
  FROM orders;
```

| Order ID       | Order Date | Ship Date  |
| -------------- | ---------- | ---------- |
| CA-2016-152156 | 2016-11-08 | 2016-11-11 |
| CA-2016-152156 | 2016-11-08 | 2016-11-11 |
| CA-2016-138688 | 2016-06-12 | 2016-06-16 |

Aliasing fields does _not_ permanently change their name in the database. Aliases only exist for as long as the query does.

When using aliases, quotes are optional for simple, single-word names without spaces or special characters. However, they are recommended—or sometimes required—when the alias:

- Contains spaces (e.g., **order_id AS 'Order ID'**)
- Contains special characters or reserved words (e.g., **usd AS 'Dollars ($)'**)
- Is case-sensitive (e.g., **order_date AS 'OrderDate'**)

While both single (**'**) and double (**"**) quotes are generally supported, some databases have specific requirements. For example, PostgreSQL requires double quotes for case-sensitive aliases, whereas others may allow either. Using quotes consistently improves readability and ensures compatibility across systems.

Interestingly, the **AS** keyword is technically optional, and we can simply write the alias directly after the column or table name like this:

```sql
SELECT order_id 'Order ID',
       order_date 'Order Date',
       ship_date 'Ship Date'
  FROM orders;
```

Both approaches are valid and produce the same result, but using **AS** is preferred for a few reasons:

1. **Readability:**
   Including AS in the query explicitly indicates that an alias is being used, making it easier for others (or yourself) to understand the query when reading it later.
2. **Consistency:**
   Different databases may have varying support for aliasing without the AS keyword. To ensure queries are compatible across database systems, it's a good idea to use AS.
3. **Avoiding Errors:**
   Using AS can prevent potential errors caused by ambiguity, especially when column names are similar to keywords in SQL.

### Hello, Comments!

Like with most programming languages, it's often a good idea to include comments explaining the reasoning behind our code.

Unlike the typical SQL code we'll be writing in this course, comments are not executed by the computer. Single-line comments in SQL are started with two dashes, like so:

```sql
-- This is a single line comment.
-- Each single line comment must start with two dashes.
SELECT *
  FROM orders
 LIMIT 5;
```

Single line comments can also appear on the same line as code, which can be useful for clarifying what a specific line of code does:

```sql
SELECT *
  FROM orders --This query uses the orders table
 LIMIT 5;
```

We can also write multi-line comments by using the **/\*** and **\*/** characters at the start and end of a comment. This is often useful when we want to "comment out" a whole query:

```sql
/*
This is a multi-line comment.
The query below will not run because it is inside of this comment:

SELECT order_id, product_name
  FROM orders
 LIMIT 10;
*/
```

---

_needed to stop here because the rest was premium content_
