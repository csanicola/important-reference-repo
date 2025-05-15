# From the Textbook Mastering Health Science Using R
# https://alicepaul.github.io/health-data-science-using-r/book.html

###################################################################################################
# 1. Getting Started with R
###################################################################################################

# 1.2.1 Basic Computations Objects
# Addition
5+6
# Subtraction
7-2
# Multiplication
2*3
# Division
6/3
# Exponentiation
4^2
# Modulo
100 %% 4

# solving the result of any computation you would store as an object called a variable
x <- 2+3
x <- x+1
x

# if you want to run all lines of code in our script, you would use the source button but
# you can use the source function
source("test.R")

# calling a function 
# ceiling() returns the ceiling of your input
# floor() returns the floor of your input
# round() rounds your input to the closest integer - it rounds a number in 0.5 to the closest even integer
ceiling(3.7)
floor(3.7)
round(2.5)
round(3.5)

# to read a csv file, you would use read.csv()

# you can also see what the current working directory is by using getwd()
getwd() # "/Users/carolinesanicola/" on Mac
# to set the current working directory, you can use setwd()
setwd('/Users/carolinesanicola/Documents/GitHub/important-reference-repo/R')
# check
getwd()

# now update the path to the csv file
df <- read.csv("https://raw.githubusercontent.com/alicepaul/health-data-science-using-r/b71bbec95709d0107c166d97654890b9500678ef/book/data/fake_names.csv")
df
# another way to load in a csv is using readr::
df <- readr::read_csv("https://raw.githubusercontent.com/alicepaul/health-data-science-using-r/refs/heads/main/book/data/test.csv", show_col_types = FALSE)

# the most important thing to do is download packages and one of the most important is 'tidyverse'
# to see what packages are already installed use `installed.packages()`
installed.packages()
# the most important package to download is tidyverse
install.packages('tidyverse')
library(tidyverse)

###################################################################################################
# 2. Data Structures in R
###################################################################################################

# an object is a named instance of a data structure
ex_num <- 4

# data structures in R are vectors, factors, matrices, arrays, lists, and data frames
# vectors can be one-dimensional or two dimensional

# 2.1 Data Types
# each individual value in R has a type: logical, integer, double or character
# you can use typeof() function to find the type of vector
typeof(ex_num) # double
# double is a numeric value with a stored decimal
# an integer is a whole number without a decimal
# to indicate we want the number to be an integer object, you need to use `L` after the number
ex_int <- 4L
typeof(ex_int)
# characters have letters
ex_char <- "Alice"
typeof(ex_char)
# logicals or booleans are TRUE and FALSE
ex_bool <- TRUE
typeof(ex_bool)
# booleans can actually be interpreted as 0/1 and can be used in logic
TRUE + FALSE + TRUE
