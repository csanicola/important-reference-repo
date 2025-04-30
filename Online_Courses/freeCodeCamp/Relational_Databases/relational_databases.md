# freeCodeCamp - Relational Databases Notes

# Postgres Terminal commands

- `\l` is to **list out** the databases that are available
- to **create a database** you would use the command `CREATE DATABASE database_name;`
  - all commands need the semi-colon at the end of them
- you can **connect** to a database by using `\c database_name`
- `\d` is used to **display the tables** that are in the database
  - you can view more details about the table by typing `\d table_name`
- to **create a table** you would use `CREATE TABLE table_name();`
  - you need the parenthesis
- to **add columns** you would use the command `ALTER TABLE table_name ADD COLUMN column_name DATATYPE;`
  - to **remove a column** you would use `ALTER TABLE table_name DROP COLUMN column_name;`
- a common **data type** is `VARCHAR` which is a string of characters, but to specify this in SQL you need to include a maximum length: `VARCHAR(30)`
  - you can make a type `SERIAL` which makes the column `INT` with a `NOT NULL` constraint, meaning that a new number is made every time you add a row
  - you can add `NOT NULL` next to any data type though like `VARCHAR(30) NOT NULL`
  - for `NUMERIC(3,1)` this means it has up to four digits and one of them has to be the right of the decimal
- to **rename a column** you would use `ALTER TABLE table_name RENAME COLUMN column_name TO new_name;`
- to **add rows** in your table, you use `INSERT INTO table_name(column_1, column_2) VALUES(value1, value2);`
  - you can **add multiple rows** at once by `VALUES(value1, value2), (value3, value4);`
  - to delete a row you would use `DELETE FROM table_name WHERE condition;`
- to **view the data** in the table: `SELECT columns FROM table_name;`
- to **drop a table**, you would use `DROP TABLE table_name;`
  - you can **drop a database** by using `DROP DATABASE database_name`
- you can **rename a database** by using `ALTER DATABASE database_name RENAME TO new_database_name;`
- to **change value** that already exist in a table, you use `UPDATE table_name SET column_name=new_value WHERE condition;`
- to **order the table**, you use `SELECT columns FROM table_name ORDER BY column_name;`
- a **primary key** is a column that uniquely identifies each row in the table
  - `ALTER TABLE table_name ADD PRIMARY KEY(column_name);`
  - if you want to change the primary key, you drop the constraint for it:
    - `ALTER TABLE table_name DROP CONSTAINT constraint_name;`
- to set up a **foreign key** which is what can connect one table to another:
  - `ALTER TABLE table_name ADD COLUMN column_name DATATYPE REFERENCES referenced_table_name(referenced_column_name);`

# Terminal Project Notes

- `pwd` typed into the terminal will print the working directory (stands for print working directory)
- `ls` stands for list and typed into the terminal will list what is in the current working directory at the time you enter it
- `cd` stands for change directory and you would type that to change which directory you currently are in `cd <folder_name>`
  - typing `cd ..` will take you back one level of the working directory
    - you can go back two folders with `cd ../..`
- you can type `more <filename>` to see whats in a folder without actually going into it
- you can empty the terminal by typing `clear`
- you can add a **flag** to a command to use it in a different way ex: `ls <flag>`
  - ex: to see the contents of a folder in a long list format you would add `-l` to the list command
- you can make a new folder with `mkdir <folder_name>` (mkdir stands for make directory)
  - you can also make folders within folders by doing `mkdir <folder>/<new_folder_name>`
- `echo` command lets you print anything to the terminal
  - you can print to a file instead of the terminal with `echo text >> filename`
- `touch <filename>` is used to create a new file
- `--help` can be used to list out how to use a command (ex: `ls --help`)
- the `--all` flag combined with `ls` will show all files including the hidden ones
- `rm` will remove a file or folder that you specify
  - `rmdir` will remove a folder (stands for remove directory)
  - use `-r` to remove folders that have files in them (aka aren’t empty)
- `cp <file> <destination>` is how you would copy a file from one place to another
- you can rename filenames using `mv` ex: `mv <filename> <new_filename>` (mv stands for move)
- use `find` to find things or view a file tree
- `exit` is the command to exit the terminal
