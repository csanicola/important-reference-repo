# Scientific Computing with Python Notes

`type()` is to find out what type of variable is (ex: string, integer, float, etc.)
`len()` is to see how many characters are in a string
`.find()` is to find out the position of a character in a string
`.lower()` will transform all the characters in a string to lowercase
`.upper()` will transform all the characters in a string to uppercase

- A loop allows you to systematically go through a sequence of elements and execute actions on each one.

  - `for` is the keyword denoting the loop type
  - `i` is a variable that subsequently takes the value of the elements in the variable
    - the iteration variable (in this case `i`) can have any valid name, but its convenient to give it a meaningful name

- strings are immutable → meaning they cannot be changed once created
- the modulo operator `%` is used to return the remainder of the division between two numbers
- a **function** is a reusable block of code

  - there are already built in functions like `print()`, `find()`, and `len()` but you can make your own custom function
  - to define a function you use `def`

- **parameters** are variables that you can use inside your function:

  ```python
  def function_name(param_1, param_2):
  	<code>
  ```

  - functions can have _default arguments_ in them too which means that if its not specified then it will take an automated action that is pre-setup

  ```python
  def foo(a, b, c=value):
  	<code>
  ```

- `.index()` method is identical to the `.find()` method but it throws a `ValueError` exception if it is unable to find the substring
- A `ValueError` is a built-in exception that is raised when an argument with the right type but inappropriate value is passed to a function
- `pass` is a keyword that can be used as a placeholder for future code. It doesn’t have any effect on the code but saves you from errors you would get in case of incomplete code

```python
def foo():
	pass
```

- **interpolation** means writing placeholders that will be replaced by the specified values when the program runs
  ```python
  'Encrypted text: ' + text  ->   f'Encrypted text: {text}'
  ```

````
	- you need to put an `f` before the quotes to create the f-string and write the variables or expressions you want to interpolate between curly braces
- python comes with built-in classes to do string manipulation
	- one is called **maketrans** which helps create a translation table → this is used to replace characters in a string
	```python
	str.maketrans({'t': 'c', 'l': 'b'}) # this replaces all t characters with c and l characters with b
````

- ‘calling a function’ is basically telling the computer to follow the steps on this line of the directions
  - it involves writing the name of the function
  - add parenthesis `()` after the function’s name
  - inside the parenthesis, add any parameters that the function requires separated by commas
  - end the line with a semicolon `;`
- you can use the index operator (`[]`) to access a range of characters in a string with `string[start:stop:step]`
  - `start` is the starting index (inclusive)
  - `stop` is the ending index (exclusive)
  - `step` is the amount of characters to skip over (the default is 1 if nothing is specified)
  - you can’t use the `+=` trying to combine a string and an integer
    - you need to convert one to the other so they are the same type
- lists are characterized by brackets and you can even create an empty list with just brackets by themselves `[]`

  - `append()` can be used to add an item to a list
  - to access any element in the list you would also use square brackets and the index starts at 0

    ```python

    ```

example_list = [1, 2, 3]
example_list[1] # this access the emlement at index 1 which is the second element which would be 2
```	- you can change any value of any of the elements of a list
	-`.insert()`will change the position of any element. The first argument is the position and the second is the element that is added
	-`.pop()` is to remove an element from a list (default is that it removes the last element of the list)

- you can’t have a `'` in a string without raising an error so the work around is either double quotes around the string or a `\` before the string:
  - `'I\’m a string!'` or `"I'm a string!"`
- Lambda functions are brief, anonymous functions in python, ideal for simple, one-time tasks:
  - `lambda x: expre`
    - `x` represents a parameter to be used in the expression `expr`
      - just acts like any parameter in a traditional function
    - `expr` is the expression that gets evaluated and returned when the lambda function is called
  - you can combine it with the `map()` function which executed a specified function for each element in a collection of objects such as a list:
    - `map(lambda x: x * 2, [1, 2, 3])`
- the `filter()` function allows you to select items from an iterable, such as a list, based on the output of a function
  - `filter(my_function, my_list)`
    - `filter()` takes a functions as its first argument and an iterable as its second argument
    - it returns an iterator → a special object that enables you to iterate over the elements of a collection, like a list
    - the above result is an iterator containing the elements of `my_list` for which `my_function` returns `True`
- a `while` loop is another kind of loop that runs a portion of code as long as a specified condition is `True`. The loop terminates when the condition becomes `False`
- the `input()` function takes and returns the user input int he form of a string
- the `.strip()` string method removes from a string any leading or trailing characters among a set of characters passed as its argument
- a _list comprehension_ is a construct that allows you to generate anew list by applying an expression to each item in an existing iterable and optionally flirting items with a condition
- `def square_root_bisection()` can:
  - `square_target` - the number for which you want to find the square root
  - `tolerance` - the acceptable difference between the square of the approximate root value and the actual target value (default is `1e-7`).
    - The tolerance `1e-7` implies that the solution will be accurate to within `0.0000001` of the true value and is a good default choice that balances accuracy and performance
  - `max_iterations` - the maximum number of iterations to perform (default is `100`)
    - if the method doesn’t converge within this limit, you’ll assume the solution is not found
  - `raise` statement allows you to force a specific exception to occur
    - it consists of the `raise` keyword followed by the exception type and enables you to provide a custom error message: `raise ValueError("Invalid value")`
- the `abs()` function returns the absolute value of a number which is always positive
- a standalone single underscore is used to represent a value you don’t care or that won’t be used in your code
- a `tuple` is another built-in data structure in python
  - tuples are much like lists, but they are defined with parentheses `()` instead of square brackets
  - tuples are immutable, unlike lists
  - a tuple can be unpacked, meaning that the elements contained in the tuple can be assigned to variables, like this:
    - `spam = ('lemon', 'curry')`
    - `item1, item2 = spam`
- the `re` module allows you to use _regular expressions_ in your code
  - often referred to as **regex** its a pattern used to match a specific combination of characters inside a string
  - it is a valid alternative to `if`/`else` conditional statements when you need to match or find patterns
  - the `search()` function from the `re` module analyzes the string passed as the argument looking for the first place where the regex pattern matches the string
  - the `findall()` function is similar to `search()` but returns a list with all the occurrences of the matched pattern
- the dot character is a wildcard that matches any character in a string - except for a newline character by default
- if you need to match a character that has a special meaning in the pattern such as `.` or `+`, you can escape it by prepending a backslash character `\`
  - ex: `\+`
- raw strings are prefixed with a `r` and are different from regular strings lies in how they handle the backslash character
  - in raw strings, backslashes are treated as literal characters rather than escape characters
- in a character class, you can combine multiple ranges by writing one range after another inside the square brackets (without any additional characters): `[a-d3-6]`
- class equivalents:
  - `[0-9]` = `\d`
  - `[^0-9]` = `\D`
  - `[a-z]` or `[A-Z]` = `\w`
  - special characters = `\W`
- generator expressions follow the syntax of list comprehensions but they use parentheses instead of square brackets
- if you want to iterate over the values of dictionary keys, you can use the `.values()` function
  - using the `.items()` function will show the key-value pairs
- to remove a key-value pair in a dictionary, you would use the `del` keyword
- graphs are data structures representing relations between pairs of elements
  - _nodes_ are the elements and can be real-life objects, entities, points in space or others
  - connections between the nodes are called the _edges_
  - a graph is called a _weighted_ graph when its edges are associated with weights, representing a distance, time, or other quantitive value
- the `list()` type constructor enables you to build a list from an iterable
- with a dictionary comprehension, you can create a dictionary starting from an existing dictionary: `{key: val for key in dict}`
  - dictionary comprehensions support conditional `if/else` syntax too: `{key: val_1 if condition else val_2 for key in dict}`
- the `.extend()` method allows you to add elements from an iterable to the end of a list
- the `.remove()` method removes from a list the first matching element that is passed as the argument

```python
my_list = ['larch', 1, True, 1]
my_list.remove(1)
print(my_list) # Output: ['larch', True, 1]
```

- ternary syntax = a concise way to write if/else conditionals: `val_1 if condition else val_2`
  - the expression above evaluates to `val_1` if `condition` is true, otherwise to `val_2`
- `range()` is `range(x, y, h)` where `x` is the starting integer (inclusive), `y` is the last integer (not inclusive), and `h` is the difference between the number and the next one in the sequence.
- `slice()` function is how to break up a sequence and is written like `slice(start, end, step)`
- you can create a class in python by `class ClassName:`
- you can then have methods, which are like local functions for each instance. They are declared like:

```python
class ClassName:
	def method_name():
		pass
```

- to call an instance method, you need to use dot notation: `instance.method()`
  - where `instance_name` is the instance or object, and `method_name` is the method you want to call
- the instantiation creates an empty object
  - the `__init__` method is a special method that allows you to instantiate an object to a customized state.
    - when a class implements an `__init__` method, `__init__` is automatically called upon instantiation.
- the `enumerate` built-in function takes an iterable as its argument and returns an enumerate object you can iterate over. It provides the count (which by default starts at zero) and the value from the iterable.
  - the loop from the example below would output the tuples `0, a`, `1, b`, `2, c`.

```python
iterable = ['a', 'b', 'c']
for i, j in enumerate(iterable):
	print(i, j)
```

- a `try` statement is used to encapsulate code that might raise an exception; the `except` clause offers alternative code to execute if an exception occures:

```python
try:
	<code>
except:
	<code>
```
