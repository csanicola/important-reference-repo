# freeCodeCamp - Relational Databases Notes

# Postgres Terminal commands

> PostgreSQL login info for freecodecamp training: `psql --username=freecodecamp --dbname=postgres`

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
    - adding a **one-to-one relationship** you would use the below command:
      - `ALTER TABLE table_name ADD UNIQUE(column_name);`
  - to add an **existing column as a foreign key**: `ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES referenced_table(referenced_column);`
- for tables with keys or foreign keys, you should set up a `NOT NULL` rule: `ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;`
- you can also make tables that have data type restrains to it when creating the table: `CREATE TABLE table_name(column_name DATATYPE CONSTRAINTS);`
- "many to many" relationships usually use a **junction** table to link the two tables together forming the "many to many" relationships
- to create a primary key from two columns, its known as a **composite** primary key: `ALTER TABLE table_name ADD PRIMARY KEY(column1, column2);`
  - this will create a table with multiple column1 values and multiple column2 values but you will never have the same combination of column1 and column2 in the same row
- to **join** two tables together, you would use the `JOIN` command: `SELECT columns FROM table_1 FULL JOIN table_2 ON table_1.primary_key_column = table_2.foreign_key_column;`
  - you can specify columns or use `*` to select all columns
    - to join three tables:

```sql
SELECT columns FROM junction_table
FULL JOIN table_1 ON junction_table.foreign_key_column = table_1.primary_key_column
FULL JOIN table_2 ON junction_table.foreign_key_column = table_2.primary_key_column;
```

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
  - sometimes it won't work and you'll need to use the `man` command which stands for `manual` like `man <command>`
- the `--all` flag combined with `ls` will show all files including the hidden ones
- `rm` will remove a file or folder that you specify
  - `rmdir` will remove a folder (stands for remove directory)
  - use `-r` to remove folders that have files in them (aka aren’t empty)
- `cp <file> <destination>` is how you would copy a file from one place to another
- you can rename filenames using `mv` ex: `mv <filename> <new_filename>` (mv stands for move)
- use `find` to find things or view a file tree
- `exit` is the command to exit the terminal
- to save a postgresql database (for specifically the freecodecamp account/project)you can use the following command in the terminal `pg_dump -cC --inserts -U freecodecamp universe > universe.sql`
  - it will save a `universe.sql` in the file where the command was located
  - to rebuild the database you would enter the following command which will run all the scripts in the sql file: `psql -U postgres < universe.sql`
- to run a `.sh` file (which has bash/terminal commands) you would enter:
  - for shell commands: `sh file_name.sh`
  - for bash commands: `bash file_name.sh`
    - bash stands for `bourne-again shell`
  - certain terminals will only allow certain type of commands, to find out which one to use, type `which bash` in the terminal
    - That's the absolute path to the `bash` interpreter. You can tell your program to use it by placing a `shebang` at the very top of the file like this: `#!<path_to_interpreter>`. Add a `shebang` at the very top of your file, the one you want looks like this: `#!/bin/bash`.
      - by adding this to the top of the `.sh` file you would just need to type `./file_name.sh` into the terminal to run it
        - you need to double check the permissions of the file first though:
          - Next to your file is `-rw-r--r--`. All but the first character (`-`) describe permissions different users have with the file. `r` means `read`, `w` means `write`, `x` means `execute`. I don't see an `x` anywhere, so nobody can execute it.
            - to add `x` permissions for all users, type: `chmod +x file_name.sh`
- bash has the ability to add variables and values but you can't leave any space, otherwise you need to use quotes: `VARIABLE1=VALUE1` or `VARIABLE2="This is another value"`
  - to use a variable you would put a `$` in front of it
  - to accept input from a variable you would use `read VARIABLE_NAME` and the input will be stored in the `VARIABLE_NAME`
- programs can take arguements so to print all arguments passed to it you would enter `echo $*`
  - to access any of the arguments passed through you would run `$<number>`
- if statements in the terminal look like:

```bash
if [[ CONDITION ]]
then
   STATEMENTS
else
   STATEMENTS
fi
```

- you can also have an else if statement too:
  ```bash
  if (( CONDITION ))
  then
    STATEMENTS
  elif [[ CONDITION ]]
  then
    STATEMENTS
  fi
  ```
- You can compare integers inside the brackets (`[[ ... ]]`) of your `if` with `-eq` (equal), `-ne` (not equal), `-lt` (less than), `-le` (less than or equal), `-gt` (greater than), `-ge` (greater than or equal).
  - `&&` is to check if both expressions are true
  - `||` is to check if either expressions is true
- all commands have an exit status, you can type `echo $?` into the terminal to see what the exit status of a command is
  - you can also print the exit status in the same line as the command: `command; echo $?`
    - anything but `0` means there is an error with the command (because 0 = TRUE)

```sh
for (( i = 10; i > 0; i-- ))
do
  echo $i
done
```

- The above creates a variable (`i = 10`), then prints it, subtracts one, and repeats until `i` is not greater than `0`. So it prints `10` through `1`. In the `then` area of your condition, replace the `echo` with a `for` loop that prints from the argument (`$1`) to `1`.

```bash
while [[ CONDITION ]]
do
  STATEMENTS
done
```

- the above while loop with what is used in terminal
- an until loop will keep looping through until it gets the correct condition to break the loop

```bash
until [[ CONDITION ]]
do
  STATEMENTS
done
```
