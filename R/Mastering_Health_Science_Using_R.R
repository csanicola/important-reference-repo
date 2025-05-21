# From the Textbook Mastering Health Science Using R
# https://alicepaul.github.io/health-data-science-using-r/book.html

#  ----- 1. Getting Started with R ----- 

# ----- 1.2.1 Basic Computations Objects ----- 
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


# ----- 2. Data Structures in R ----- 

# an object is a named instance of a data structure
ex_num <- 4

# data structures in R are vectors, factors, matrices, arrays, lists, and data frames

# ----- 2.1 Data Types ----- 
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

# ----- 2.2 Vectors ----- 
# vectors are one-dimensional data structures that can store multiple data types of the same type (ex: character, Boolean, numeric)
# you can confirm if something is a vector by using:
is.vector(ex_bool)

# one way to create a vector with multiple values is to use the combine function: c()
days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
rain <- c(5, 0.1, 0, 0, 0.4)
# vectors can only store the same type of values so if you try and combine "Monday" and 5, it will convert 5 to a string "5". 
c("Monday", 5)

# the `class()` function returns the data structure of an object
class(days)
class(rain)
# you can even create an empty vector
ex_empty <- c()
class(ex_empty)
# you can also set the type of the empty vector:
ex_empty <- vector(mode = "numeric")
class(ex_empty)

# another way to create a vector is with rep() or seq()
# rep(x, times) takes the vector x and a number of times and outputs x the number of times entered
rep(0,5)
rep("Monday", 4)
# seq(from, to, step) takes a numeric starting value (from) and end value (to) and step size (step) with specifies the sequence to get from from to to 
seq(1,5,1)
seq(0,-10,-2)

# ----- 2.2.1 Indexing a Vector ----- 
# when a vector is created, you can access certain values in it by indexing []
days[1]
days[4]
# not only can you access a single value, but a subset of the values using c()
days[c(1,4)]
days[-c(1,4)] # this is saying to return everything BUT the 1 and 4 values

# another option is to associate a name with each value
names(rain) <- days
print(rain)
rain["Friday"]

# another option is using TRUE and FALSE values to index the values in a vector (both vectors need to be the same length)
ind_bools <- c(TRUE, FALSE, FALSE, TRUE, FALSE)
days[ind_bools] # this is now going to return only the TRUE values in the vector

# ----- 2.2.2 Modifying a Vector and Calculations ----- 
# exp() - exponential
# log() - log
# sqrt() - square root
# abs() - absolute value
# round() - round to nearest integer value
# ceiling() - round up to the nearest integer value
# floor() - round down to the nearest integer value
# signif(, dig) - round to dig number of significant digits
# the above logical functions can be used to combine vectors or as operators on vector values
c(1, 2, 3) + c(1, 1, 1)
c(1, 2, 3) + 1 # the above is identical to this
sqrt(c(1, 4, 16))
signif(c(0.23, 0.19), dig = 1)

# you can also change a value in a vector
rain["Friday"] <- 0.5
rain
# you can also add extra entries to the vector and can use c() to do so
# the length function checks the current length of the vector 
length(rain)
days <- c(days, "Saturday", "Sunday") # add the weekend with no rain
rain <- c(rain, 0, 0)
length(rain)
# you can also use sum(), max(), and min() to get the sum, maximum value, minimum value of the vector
sum(rain)
max(rain)
min(rain)

# Practice Question
# create a vector of the odd numbers from 1 to 11 using the seq() function then find the third value in the vector using indexing
practice_one <- seq(1, 11, 2)
practice_one[3]

# ----- 2.2.4 Common Vector Functions ----- 
# sum() - summation
# median() - median value
# mean() - mean
# sd() - standard deviation
# var() - variance
# max() - maximum value
# which.max() - index of the first element with the maximum value
# min() - minimum value
# which.min() - index of the first element with the minimum value
mean(rain)
min(rain)
which.min(rain) # this will tell you which value is the min value (if it was given a name)

# you can also use sort() to sort the values and order() which returns the permutation of the elements to be sorted in order
order(rain) # this is returning what is the lowest values to highest values but in the order they currently are in
days[order(rain)] # this is returning the days of the week in the order of the smallest rain value to largest rain value 
# for both order() and sort() they have the extra argument of `decreasing` which can either be `TRUE` or `FALSE`
days[order(rain, decreasing=TRUE)] # now it will show the days in order of highest rain to lowest rain values

# ----- 2.3 Factors ----- 
# a special kind of vector that behaves like a regular vector, except that it represents values from a category
# it keeps tracks of all possible values of that category in what are called levels of the factor
# the function `as.factor()` converts a vector to a factor
days <- c("Monday", "Tuesday", "Wednesday", "Monday", "Thursday", "Wednesday")
days_fct <- as.factor(days)
class(days_fct)
levels(days_fct)
# using the factor() function instead of as.factor() will allow you to specify the levels of the factor
days_fct <- factor(days, 
                   levels = c("Monday", "Tuesday", "Wednesday",
                              "Thursday", "Friday", "Saturday", "Sunday")) # so this is saying that there may not be all theses values but these are the possible levels in the factor
class(days_fct)
levels(days_fct)
days_fct[2] <- "Friday" # this is going to insert "Friday" into the second index of days_fct
days_fct

# factors can also be used for numeric vectors
# if we want to have 0/1 to represent whether a day is a weekend or not this is something we can do with factor levels
weekend <- as.factor(c(1, 0, 0, 0, 1, 1))
levels(weekend)

# ----- 2.4 Matrices ----- 
# similar to vectors in that they store data of the same type but matrices are two-dimensional and consist of rows and columns
# matricies can be created using the matrix() function
# matrix(data, nrow, ncol, byrow) = data is the values, nrow is number of rows, ncol is number of columns, byrow is either TRUE if you want the data values to be filled in by row or FALSE if its by column
rainfall <- matrix(c(5, 6, 0.1, 3, 0, 1, 0, 1, 0.4, 0.2, 
                     0.5, 0.3, 0, 0),
                   ncol=7, nrow=2, byrow=TRUE)
rainfall
# to find the dimensions of the matrix, you can use nrow(), ncol(), or dim() 
# nrow() returns how many rows
# ncol() returns how many columns
# dim() returns the number of rows and columns
nrow(rainfall)
ncol(rainfall)
dim(rainfall)

# ----- 2.4.1 Indexing a Matrix ----- 
# as opposed to vectors, since there are rows and columns, you need to know both when trying to index a value in a matrix
rainfall[1, 4]
# you can provide multiple indexes to return multiple values
rainfall[1, c(4, 5, 7)]
# you can also index by boolean
rainfall[c(FALSE, TRUE), ] # don't have to include column because we are indexing all the values
rainfall[ ,c(TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)]
# we can also specify row and column names in the indices
# colnames() and rownames() returns the names of the rows and columns
colnames(rainfall) <- c("Monday", "Tuesday", "Wednesday", "Thursday",
                        "Friday", "Saturday", "Sunday")
rownames(rainfall) <- c("Week1", "Week2")
rainfall["Week1", c("Friday", "Saturday")]

# ----- 2.4.2 Modifying a Matrix ----- 
# to change the values in a matrix, you need to index the values first and then assign new values
rainfall["Week1", "Friday"] <- 3
rainfall["Week1", c("Monday", "Tuesday")] <- 0
print(rainfall)

# the functions rbind() and cbind() can add rows and columns
rainfall <- rbind(rainfall, "Week3" = c(0.4, 0.0, 0.0, 0.0, 1.2, 2.2, 0.0)) # this will add a new row with values
rainfall <- cbind(rainfall, "Total" = c(7.1, 2.4, 3.8)) # this will add a new column with values
print(rainfall)
# you can bind matrices together, but you need to make sure they are the same size
A <- matrix(c(1, 2, 3, 4), nrow=2)
B <- matrix(c(5, 6, 7, 8), nrow=2)
C <- cbind(A, B)
C
# you can also use mathematical operators to combine too
A+B
exp(C)

# Practice Question
practice_two <- matrix(rep(1,12), ncol=3, nrow=4, byrow=TRUE)
print(practice_two)
practice_two[ ,c(1,3)]

# ----- 2.5 Data Frames ----- 
# like matrices, they store data in rows and columns, but you can use different data types 
# you can create a data frame from data using the data.frame() function
weather_data <- data.frame(day_of_week = c("Monday", "Tuesday", "Wednesday", "Monday"),
                           temp = c(70, 62, 75, 50),
                           rain = c(5, 0.1, 0.0, 0.5))
# the head() function prints the first six rows of a data frame
head(weather_data)
# the tail() function prints the last six rows of a data frame
tail(weather_data)
# you can use the same dim(), nrow(), ncol() as you would with the matrix
dim(weather_data)
nrow(weather_data)
ncol(weather_data)
# the same with colnames() or even just using names()
colnames(weather_data)
names(weather_data)
rownames(weather_data) <- c("6/1", "6/2", "6/3", "6/8")
head(weather_data)
rownames(weather_data)

# ----- 2.5.1 Indexing a Data Frame ----- 
# done the same way as with a matrix
weather_data[1, 2]
weather_data[1, c("day_of_week", "temp")]
# can also use '&' for accessing the column names
weather_data$day_of_week
weather_data$temp
# the day_of_week column is categorical and can only take a limited number of values so it would be useful to convert it to a factor to limit what is allowed in it
weather_data$day_of_week <- factor(weather_data$day_of_week)
levels(weather_data$day_of_week)

# ----- 2.5.2 Modifying a Data Frame ----- 
# can also modify the data the same as with a matrix
weather_data[1, "rain"] <- 2.2
weather_data

# can also combine data frames using the rbind() or cbind() but can also use $
weather_data$aq_warning <- as.factor(c(1, 0, 0, 0))
weather_data

# Practice Question
weather_data$air_quality_index <- rep(NA,4)
weather_data
weather_data["6/2", "air_quality_index"] <- 57
weather_data

# ----- 2.6 Lists ----- 
# a data frame is actually a special type of another data structure called a list
# a list is a collection of objects under the same name
# these objects can be vectors, matrices, data frames, or even other lists
# they don't have to be the same size, type, or any other matching attribute
ex_list <- list("John", c("ibuprofen", "metformin"),
                c(136, 142, 159))
print(ex_list)

print(class(ex_list[2])) # this will print "list"
ex_list[2] # this is going to return a list of the sublist we are indexing
# to return just the values themselves, you would use double brackets
ex_list[[2]]
# it is easier to name the elements of a list to make accessing easier
ex_list <- list(name="John",
                medication=c("ibuprofen", "metformin"),
                past_weights=c(136, 142, 159))
print(ex_list)
# now we have names to easily access things in the list to change or call upon them
ex_list$supplements <- c("vitamin D", "biotin")
ex_list$supplements[2] <- "collagen"
ex_list


# ----- 3. Working with Data Files in R ----- 

# the library to load in for this is HDSinRdata which contains a sample dataset
install.packages("HDSinRdata")
library(HDSinRdata)

# importing data you would use the data() function
data(pain)
dim(pain)

# another way to use your own data, you would need to install the readr package
install.packages("readr")
library(readr)
# this contains read_csv() function which will be the function most used

# but you can also create a csv file from a dataframe you've created
df <- data.frame(x = c(1, 0, 1), y = c("A", "B", "C"))
# write.csv(df, "data/test.csv", row.names=FALSE)

head(pain)

# the below will return the values from row 1 to 5 in the column specified
pain$PAIN_INTENSITY_AVERAGE[1:5]
pain[["PAIN_INTENSITY_AVERAGE"]][1:5]

# to explore distributions and ranges of the values in certain columns, you can use the summary() function
summary(pain$PAIN_INTENSITY_AVERAGE)
# if there are NA values in the column, you can add `na.rm=TRUE` so that it won't return NA for anything you ask
min(pain$PAIN_INTENSITY_AVERAGE, na.rm=TRUE) # returns the minimum value for a numeric vector
max(pain$PAIN_INTENSITY_AVERAGE, na.rm=TRUE) # returns the maximum value for a numeric vector
mean(pain$PAIN_INTENSITY_AVERAGE, na.rm=TRUE) # returns the mean for a numeric vector
median(pain$PAIN_INTENSITY_AVERAGE, na.rm=TRUE) # returns the median for a numeric vector
range(pain$PAIN_INTENSITY_AVERAGE, na.rm=TRUE) # returns the minimum and maximum values for a numeric vector x
quantile(pain$PAIN_INTENSITY_AVERAGE, na.rm=TRUE) # returns the sample quantiles for a numeric vector
IQR(pain$PAIN_INTENSITY_AVERAGE, na.rm=TRUE) # returns the interquartile range for a numeric vector
# by default the quantile() function returns the sample quantiles but you can specify which quantiles you want to use
quantile(pain$PAIN_INTENSITY_AVERAGE, probs = c(0.1, 0.9), na.rm=TRUE)

# we can also see a histogram of the values in a row (which is the distribution of values)
hist(pain$PAIN_INTENSITY_AVERAGE)


# Practice Question
summary(pain$PROMIS_SLEEP_DISTURB_V1_0)
hist(pain$PROMIS_SLEEP_DISTURB_V1_0)

# using the summary() function works with categorical values too, it will return the counts for each level
summary(pain$PAT_SEX)
# it is easier to view the results in a table view
table(pain$PAT_SEX, useNA="always") # the useNA argument will show if there are any NA values in the table because by default it ignores NA's in the output
# using the prob.table() function will convert the counts to proportions (what percentage of the total values is that category value)
prop.table(table(pain$PAT_SEX))

# because this has a limited types of values that can be in this column, we can convert the column to a factor
is.factor(pain$PAT_SEX)
pain$PAT_SEX <- as.factor(pain$PAT_SEX)
is.factor(pain$PAT_SEX)

# you can also take a subset of the data and store it into a new dataframe
body_map_cols <- names(pain)[2:75]
pain_body_map <- pain[, body_map_cols]
head(pain_body_map)
hist(rowSums(pain_body_map))

# we will now fine the number of patients who selected each body region divided by the total number of patients
# this will show the percentage of body regions by total patients
perc_patients <- colSums(pain_body_map, na.rm=TRUE) /  
  nrow(pain_body_map)
hist(perc_patients)

which.max(perc_patients) # returns which value is the max value

# pmax() and pmin() return the pairwise max or min across the vectors
v1 = c(5, 9, 12)
v2 = c(2, 18, 4)
pmax(v1, v2)

# if we want to create a new column called lower_back_pain that corresponds to whether someone selects either x218 or x219, you can use the pmax() function to find the maximum value between columns x218 and x219
lower_back <- pmax(pain_body_map$X218, pain_body_map$X219)
prop.table(table(lower_back))

# if we want to store the total number of pain regions and out indicator of whether or not a patient has a lower back pain as new columns
pain$NUM_REGIONS <- rowSums(pain_body_map)
pain$LOWER_BACK <- lower_back
dim(pain)

# another useful function that allows us to perform computation over the rows or columns of a matrix or data frame is the apply(X, MARGIN, FUN) function
# the X is the data frame or matrix
# the MARGIN indicates whether to compute over the rows (1) or columns (2)
# the FUN argument is the function to apply across that margin
# below is finds the maximum value for each row in the data frame
any_selected <- apply(pain_body_map, 1, max)
min(any_selected, na.rm=TRUE)
# the min shows that every patient selected at least one body map region
# you can also use colSums() for find the sum of the columns for the above example
# if we use apple() function it will pass any additional arguments to the function FUN
perc_patients <- apply(pain_body_map, 2, sum, na.rm=TRUE) /
  nrow(pain_body_map)
summary(perc_patients)

# ----- 3.2.5 Missing Infinite and NaN Values ----- 
# missing values in R are represented by NA
# to confirm is there is a missing value, you can use the function `is.na()`
sum(is.na(pain$PATIENT_NUM))
# to see if there are NAs accross multiple columns and not just one, we can use apply() function too
num_missing_col <- apply(pain, 2, function(x) sum(is.na(x)))
min(num_missing_col)
# the above will tell us that there is at least one missing value in each column
# since that is just seeing minimally how many missing, we may want to see if there is an entire column of missing values; to do so, we need to see how many columns there are total and if there is a row that matches that number indicating that there are all missing values for every column for an entire row
num_missing_row <- apply(pain, 1, function(x) sum(is.na(x)))
max(num_missing_row)
which.max(num_missing_row) # this is asking which row has lal the missing values in it
pain <- pain[-11749, ] # this is going to remove that row from the dataset
# once we remove that row, if we find the percentage of missing values per column we can see which has the most NAs
num_missing_col <- apply(pain, 2, function(x) sum(is.na(x))/nrow(pain))
num_missing_col
# you will see that for PAIN_INTESITY_AVERAGE.FOLLOW_UP it is 0.670422015 which is saying there is only about 33% of responses/valid data for this column
# from this we can create new columns of data
# first is a column for the change in pain at follow-up
pain$PAIN_CHANGE <- pain$PAIN_INTENSITY_AVERAGE.FOLLOW_UP - pain$PAIN_INTENSITY_AVERAGE
hist(pain$PAIN_CHANGE)
# second is a column for the percent change in pain at follow-up
pain$PERC_PAIN_CHANGE <- pain$PAIN_CHANGE / pain$PAIN_INTENSITY_AVERAGE
summary(pain$PERC_PAIN_CHANGE)
# the Max will say 'Inf' which means infinity
# to test whether something is infinity or not you can use the functions is.infinite() or is.finite()
sum(is.infinite(pain$PERC_PAIN_CHANGE)) # this will test how many rows return infinite values for this column
# NaN is also an option in R which stands for "Not a Number"; ex: 0/0
# there is also the function to use `na.omit()` which will remove all incomplete cases in a dataframe
# complete.cases() returns TRUE/FALSE values for each row to indicate whether each row has full values or not
pain_sub1 <- na.omit(pain)
pain_sub2 <- pain[complete.cases(pain), ]
dim(pain_sub1)
dim(pain_sub2)
# ----- 3.2.6 Dates in R ----- 
# Symbol	Description
# %Y	Four-digit year.
# %y	Two-digit year.
# %m	Numeric month.
# %b%	Abbreviated name of month.
# %B	Full name of month.
# %d	Numeric day of the month.
# %H	Military time hour (24 hours).
# %I	Imperial time hour (12 hours).
# %M	Minute.
# %S	Seconds.
# %p	AM/PM

# to convert an object to a dat object, you would use the `as.Date()` function
# for date/time columns, you would use `as.POSIXct()`
date_example <- data.frame(x = c("2020-01-15", "2021-11-16",
                                  "2019-08-01"),
                            y = c("2020-01-15 3:14 PM",
                                  "2021-11-16 5:00 AM",
                                  "2019-08-01 3:00 PM"),
                            z = c("04:10:00", "11:35:11", "18:00:45"))
# convert date and date times using formats
date_example$x <- as.Date(date_example$x, format = "%Y-%m-%d",
                           tz = "EST")
date_example$y <- as.POSIXct(date_example$y,
                              format = "%Y-%m-%d %I:%M %p")

# add date to z and convert
date_example$z <- paste("2024-06-24", date_example$z)
date_example$z <- as.POSIXct(date_example$z,
                             format = "%Y-%m-%d %H:%M:%S")
date_example

# having date specified columns, you are now able to find the time between dates using the difftime() function
difftime(date_example$x[2], date_example$x[1], units = "days")
# you can also use the function `seq()` to add or subtract time from a date using `by`
seq(date_example$x[1], by = "month", length=3)
# the lubridate package does more date manipulation

# ----- 3.3 Using Logic to Subset, Summarize, and Transform ----- 
# the below are more logic operators that can be used in R
# < less than
# <= less than or equal to
# > greater than
# >= greater than or equal to
# == equal to
# != not equal to
# a %in% b a’s value is in a vector of values b

2 < 2
2 <= 2
3 > 2
3 >= 2
"A" == "B"
"A" != "B"

# there is also a natural order between comparisons
TRUE < FALSE # aka this will ask is 1 < 0

# the %in% operator checks whether a value is in a set of possible values
1 %in% c(4, 1, 2)
c(0, 1, 5) %in% c(4, 1, 2)

# Additionally, we can use the following operators, which allow us to negate or combine logical operators.
# !x - the NOT operator ! reverses TRUE/FALSE values
# x | y - the OR operator | checks whether either x or y is equal to TRUE
# x & y - the AND operator & checks whether both x and y are equal to TRUE
# xor(x,y) - the xor function checks whether exactly one of x or y is equal to TRUE (called exclusive or)
# any(x) - the any function checks whether any value in x is TRUE (equivalent to using an OR operator | between all values)
# all(x) - the all function checks whether all values in x are TRUE (equivalent to using an AND operator & between all values)
!(2 < 3)
("Alice" < "Bob") | ("Alice" < "Aaron")
("Alice" < "Bob") & ("Alice" < "Aaron")
xor(TRUE, FALSE)
any(c(FALSE, TRUE, TRUE))
all(c(FALSE, TRUE, TRUE))

# the below example is checking those who do or do not have Medicaid and assigns a new value in that column
pain$MEDICAID_BIN[pain$MEDICAID_BIN == "no"] <- "No Medicaid"
pain$MEDICAID_BIN[pain$MEDICAID_BIN == "yes"] <- "Medicaid"
table(pain$MEDICAID_BIN)
# now if we want to include only those who have a follow-up, we would combine functions
pain_follow_up <- pain[!is.na(pain$PAIN_INTENSITY_AVERAGE.FOLLOW_UP), ] # this is asking for the data of the rows that don't have missing(na) values for the PAIN_INTENSITY_AVERAGE.FOLLOW_UP column
# we can now also use the any() function in combination with our previous column we created for lower back pain to see if there are any patients with general back pain (it will see if any of the columns comes back TRUE but we can use all() if we need all of the columns to come back TRUE)
pain$BACK <- any(pain$X208==1, pain$X209==1, pain$X212==1,
                 pain$X213==1, pain$X218==1, pain$X219==1)

# PRACTICE QUESTION
pain_subset <- pain[pain$PAIN_INTENSITY_AVERAGE >= 5, ]
head(pain_subset)

# if we want to now look at the patient race columns...
table(pain$PAT_RACE)
# most patients are either black or white
# you can also use the unique() function to see how many unique variables are in a column
unique(pain$PAT_RACE)
# we can combine some of the levels in this column using the %in% operator
aapi_values <- c("CHINESE", "HAWAIIAN", "INDIAN (ASIAN)", "FILIPINO",
                 "VIETNAMESE", "JAPANESE", "KOREAN", "GUAM/CHAMORRO",
                 "OTHER ASIAN", "OTHER PACIFIC ISLANDER")
pain$PAT_RACE[pain$PAT_RACE %in% aapi_values] <- "AAPI"
pain$PAT_RACE[pain$PAT_RACE %in%
                c("ALASKA NATIVE", "AMERICAN INDIAN")] <- "AI/AN"
table(pain$PAT_RACE)

# there is another function `which()` that can be used to return the index value for all the TRUE values
# we can use this with the race 'DECLINED' as not specified
pain$PAT_RACE[which (pain$PAT_RACE == "DECLINED")] <- "NOT SPECIFIED"
subset(pain, pain$PAT_RACE == "OTHER")
pain$PAT_RACE[pain$PATIENT_NUM==3588] <- "NOT SPECIFIED"
table(pain$PAT_RACE)


# ----- 4. Intro to Exploratory Data Analysis -----

install.packages('GGally')
install.packages('gt')
install.packages('gtsummary')

library(HDSinRdata)
library(GGally)
library(gt)
library(gtsummary)

# ----- 4.1 Univariate Distributions -----

# the database we are working with is a sample of the National Health and Nutrition Examination Survey (Centers for Disease Control and Prevention (CDC) 1999-2018) containing lead, blood pressure, BMI, smoking status, alcohol use, and demographic variables from NHANES 1999-2018.
# if you ever need to see the column descriptions, you can use:
?NHANESsample

# first we want to see if there are any missing values
sum(complete.cases(NHANESsample)) # see if there are any complete rows
apply(NHANESsample, 2, function(x) sum(is.na(x)))/nrow(NHANESsample) # see which columns have the most missing values
nhanes_df <- na.omit(subset(NHANESsample,
                            select = -c(SBP2, SBP3, SBP4, DBP2, DBP3, DBP4))) # here we are asking to create a subset of the df where it will only keep the columns besides the ones selected that have full data 

# we can now look at some of the columns more in depth
table(nhanes_df$SMOKE)
summary(nhanes_df$YEAR)

# if we want to look at the most recent observations from the data, we would again use the subset() function
nhanes_df <- subset(nhanes_df, nhanes_df$YEAR == 2017)

# now we want to create a new column for if a person has ever smoked (combining the QuitSmoke and StillSmoke variables)
nhanes_df$EVER_SMOKE <- ifelse(nhanes_df$SMOKE %in% c("QuitSmoke",
                                                      "StillSmoke"),
                               "Yes", "No")
table(nhanes_df$EVER_SMOKE)
# if we wanted to just see the output and not store it in a column, we could use the pipe operator `|>`
ifelse(nhanes_df$SMOKE %in% c("QuitSmoke", "StillSmoke"),
       "Yes", "No") |>
  table()

# now we want to look at the lead column
hist(log(nhanes_df$LEAD))

# we can add to this visual by customizing the plot
hist(log(nhanes_df$LEAD), breaks=30, col="blue",
     main="Histogram of Log Blood Lead Level",
     xlab="Log Blood Lead Level")

# for categorical columns we can use count of each variable
smoke_counts <- table(nhanes_df$SMOKE)
barplot(height=smoke_counts, names=names(smoke_counts),
        col="violetred", xlab="Smoking Status", ylab="Frequency")

# you can even use multiple colors for each bar
barplot(height = smoke_counts, names = names(smoke_counts),
        col = c("orange","violetred", "blue"),
        xlab="Smoking Status", ylab="Frequency")

# PRACTICE QUESTION
lead_quantile_counts <- table(nhanes_df$LEAD_QUANTILE) / sum(table(nhanes_df$LEAD_QUANTILE))
barplot(height=lead_quantile_counts, names=names(lead_quantile_counts),
        col="red",xlab="Lead Quantile", ylab="Percentage")

# ----- 4.2 Bivariate Distributions -----

# now if we want to look at the distribution of the categorical columns of smoking status by sex
table(nhanes_df$SMOKE, nhanes_df$SEX)
# and if we want to look at the numeric breakdown of lead by sex
summary(nhanes_df$LEAD[nhanes_df$SEX=="Female"])
summary(nhanes_df$LEAD[nhanes_df$SEX=="Male"])

# we can also visually view a categorical column and continuous column by using boxplots with the plot() function
# the first argument for the function is the x-axis and the second is the y-axis
plot(nhanes_df$SEX, log(nhanes_df$LEAD), ylab="Log Blood Lead Level",
     xlab="Sex")

# we can also combine categorical values in a more advanced boxplot
boxplot(log(LEAD) ~ SEX + EVER_SMOKE, data = nhanes_df,
        col=c("orange", "blue", "orange", "blue"),
        xlab="Sex: Ever Smoked", ylab="Log BLood Lead Level")

# to see the distribution of two continuous columns, its best to use scatterplots
plot(nhanes_df$SBP1, nhanes_df$DBP1, col="blue",
     xlab="Systolic Blood Pressure",
     ylab="Diastolic Blood Pressure")
# since these two look highly correlated from the scatterplot, we can calculate the Pearson and Spearman correlation using the cor() function
# the default is Pearson but you can specify which correlation to use
cor(nhanes_df$SBP1, nhanes_df$DBP1)
cor(nhanes_df$SBP1, nhanes_df$DBP1, method="spearman")

# we can further customize the scatterplots by using another variable as the color gradient instead of specifying a color
plot(nhanes_df$SBP1, nhanes_df$DBP1, col=as.factor(nhanes_df$HYP),
     xlab="Systolic Blood Pressure",
     ylab="Diastolic Blood Pressure")
abline(v=120, col="blue") # these lines are to show the cutoff for the hypertension variable
abline(h=80, col="blue") # aka 120/80 is the cutoff for blood pressure

# we can also combine plots to display next to one another
par(mfrow=c(1, 2))
# boxplot
boxplot(log(LEAD) ~ HYP, data=nhanes_df, xlab="Hypertension",
        ylab="Log Blood Lead Level")
# Scatterplot
plot(nhanes_df$SBP1, nhanes_df$DBP1, col=as.factor(nhanes_df$HYP),
     xlab="Systolic Blood Pressure",
     ylab="Diastolic Blood Pressure")
abline(v=120,col="blue")
abline(h=80,col="blue")
# this is done with the par() function which stands for parameters and using the arguments mfrow = c(nrow, ncol)
# we do have to reset the par() for the rest of the displays
par(mfrow=c(1,1))

# PRACTICE QUESTION
table(nhanes_df$EDUCATION)
# need to plot 3 boxplots next to each other
par(mfrow=c(1,3))
# boxplot 1
less_than_hs <- subset(nhanes_df, nhanes_df$EDUCATION == "LessThanHS")
boxplot(INCOME ~ BMI_CAT, data=less_than_hs, 
        main="Less than High School",
        xlab="BMI Category",
        ylab="Income")
# boxplot 2
hs <- subset(nhanes_df, nhanes_df$EDUCATION == "HS")
boxplot(INCOME ~ BMI_CAT, data=hs,
        main="High School", 
        xlab="BMI Category",
        ylab="Income")
#boxplot 3
more_than_hs <- subset(nhanes_df, nhanes_df$EDUCATION == "MoreThanHS")
boxplot(INCOME ~ BMI_CAT, data=more_than_hs,
        main="More than High School",
        xlab="BMI Category",
        ylab="Income")


# then reset the par() again
par(mfrow=c(1,1))

# ----- 4.3 Autogenerating Plots -----
# the ggpairs() function plots univariate and bivariate relationships at the same time
ggpairs(nhanes_df, columns=c("SEX", "AGE", "LEAD", "SBP1", "DBP1"))
# another function is the ggcorr() which takes in all the dataframe but only the numeric columns and displays the relationships between them (aka a correlation graph) and the positional argument option is `label=TRUE`
nhanes_df[, c("AGE", "LEAD", "SBP1", "DBP1")] |>
  ggcorr(label=TRUE)

# ----- 4.4 Tables -----
# another way to view information is through a table
# the gt package and gtsummary package are used for this
gt(head(nhanes_df[,c("ID", "AGE", "SEX", "RACE")]))

# the tbl_summary() function is from the gtsummary package and is used to summarize all the columns in the data # it uses the argument `include` to specify which columns to include
# the output can be piped into the `as_gt()` function
tbl_summary(nhanes_df,
            include=c("SEX", "RACE", "AGE", "EDUCATION", "SMOKE",
                      "BMI_CAT", "LEAD", "SBP1", "DBP1", "HYP")) |> 
  as_gt()

# if we want to change the type of data reported in the summary table, we would do so with the `statistic` argument
tbl_summary(nhanes_df,
            include=c("SEX", "RACE", "AGE", "EDUCATION", "SMOKE",
                      "BMI_CAT", "LEAD", "SBP1", "DBP1", "HYP"),
            by="HYP",
            statistic=list(all_continuous() ~ "{mean} ({sd})")) |> 
  as_gt()

# ----- 5. Data Transformations and Summaries -----
# here will be using the dplyr package which is used for more extensive data exploration and transformation
library(HDSinRdata)
library(tidyverse)
data(NHANESsample)

class(NHANESsample)

# a tibble has all the properties of data frames but its a more modern version of a data frame
# the function as_tibble()
nhanes_df <- as_tibble(NHANESsample)
print(head(nhanes_df))
nhanes_df <- as.data.frame(nhanes_df)
print(head(nhanes_df))

# ----- 5.2 Subsetting Data -----
# we can only see the head of certain columns that we select
select(nhanes_df, c(RACE, LEAD)) %>% head()
# we can remove columns with -c() 
nhanes_df <- nhanes_df %>% select(-c(ID, LEAD_QUANTILE))
names(nhanes_df)

# if you want to filter the data to only observations after 2008
nhanes_df_recent <- nhanes_df %>% filter(YEAR >= 2008)

# Example 1: multiple filter calls
nhanes_df_males1 <- nhanes_df %>%
  filter(YEAR <= 2012) %>%
  filter(YEAR >= 2008) %>%
  filter(SEX == "Male")

# Example 2: combine with & operator
nhanes_df_males2 <- nhanes_df %>%
  filter((YEAR <= 2012) & (YEAR >= 2008) & (SEX == "Male"))

# Example 3: combine into one filter call with commas
nhanes_df_males3 <- nhanes_df %>%
  filter(between(YEAR, 2008, 2012), SEX == "Male")

# the slice() function to select a slice of rows by their index
slice(nhanes_df, c(1, nrow(nhanes_df)))

# slice_sample() is a function takes in an argument `n` which specifies the number of random rows to sample from the data 


# slice_max() and slice_min() are functions to specify a column through the argument `order_by` and return the `n` rows with either the highest or lowest values in that column
# three male observations with highest blood lead level in 2007
nhanes_df %>%
  filter(YEAR == 2007, SEX == "Male") %>%
  select(c(RACE, EDUCATION, SMOKE, LEAD, SBP1, DBP1)) %>%
  slice_max(order_by=LEAD, n=3)

# three male observations with lowest blood lead level in 2007
nhanes_df %>%
  filter(YEAR == 2007, SEX == "Male") %>%
  select(c(RACE, EDUCATION, SMOKE, LEAD, SBP1, DBP1)) %>%
  slice_min(order_by=LEAD, n=3)

# ----- 5.3 Updating Rows and Columns -----


























