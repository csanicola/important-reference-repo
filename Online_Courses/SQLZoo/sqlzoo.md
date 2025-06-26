# SQLZoo

## SELECT

1. The example uses a WHERE clause to show the population of 'France'. Note that strings should be in 'single quotes';

Modify it to show the population of Germany

```sql
SELECT population FROM world
WHERE name = 'Germany';
```

| population |
| ---------- |
| 80716000   |

2. Checking a list The word **IN** allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.

Show the **name** and the **population** for 'Sweden', 'Norway' and 'Denmark'.

```sql
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
```

| name    | population |
| ------- | ---------- |
| Denmark | 5634437    |
| Norway  | 5124383    |
| Sweden  | 9675885    |

3. Which countries are not too small and not too big? `BETWEEN` allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.

```sql
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
```

| name           | area   |
| -------------- | ------ |
| Belarus        | 207600 |
| Ghana          | 238533 |
| Guinea         | 245857 |
| Guyana         | 214969 |
| Laos           | 236800 |
| Romania        | 238391 |
| Uganda         | 241550 |
| United Kingdom | 242900 |

4
