# the first thing you need to do when using R is install R itself, RStudio (as the application to use R) and the various packages to have access to the tools used with R
# the main package to install is tidyverse
install.packages("tidyverse")
# to actually use tidyverse you need to import the library
library(tidyverse)

# other packages to download that will be used here:
install.packages(
  c("arrow", "babynames", "curl", "duckdb", "gapminder", 
    "ggrepel", "ggridges", "ggthemes", "hexbin", "janitor", "Lahman", 
    "leaflet", "maps", "nycflights13", "openxlsx", "palmerpenguins", 
    "repurrrsive", "tidymodels", "writexl")
)

# Chapter: Whole Game ----------------------------------------------------------

# for the first exercise we will need to install the palmerpenguins package which has a penguins dataset
library(palmerpenguins)
library(ggthemes) # this is a supplementary package to ggplot2 which includes more theme options for the visuals

# main question: do penguins with longer flippers weigh more or less than penguins with shorter flippers?
# other question: what does the relationship between flipper length and body mass look like?

# first want to look at the data frame of the penguins to know what the data looks like and what we are working with
penguins # this shows the top of the dataset

glimpse(penguins) # this shows each column available in the dataset and then the first couple of observations for each column 

# from this we can see the main variables we need are: species, flipper_length_mm, body_mass_g

# to start by creating the plot, we need to define the plot object and then add the layers to it
ggplot(data = penguins)
# right now this is empty, we need to add mapping arguments so it knows what visuals we want
# the mapping visual properties are 'aesthetics' using the aes() function
# we use the aes() to define the x and y arguments for the x and y axis 
# since we want to look at flipper length and body mass we will use those
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
)
# the graph right now is blank because it still needs more structure
# as of right now it doesnt know how to graph the actual penguin data so we need to tell it how
# geom - the geometric object that a plot uses to represent the data (ex: bar graph, line graph, plots, boxplot, etc.)

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()
# running this will result in a warning message:
# "Removed 2 rows containing missing values (geom_point())."
# this is because two of the penguins either dont have a flipper length or body mass so they couldn't be plotted

# for scatterplots the easiest thing to do to add to the visual is doing different colored points
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point()
# this will show different colors by grouping the species together 
# ggplot will automatically add colors (process called scaling) but you can specify colors too 
# another thing to do is adding a smoothing curve to show the trends in the plots
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) +
  geom_point() +
  geom_smooth(method = "lm") # smoothing is to add the line and "lm" is to say we want to draw a line of best fit based on the linear model
# using the method this way the lines are separated because the colors are separated in the aes() function aka the global level but if we move it to the geom_point() function aka the local level then its a singular line
ggplot(
  data = penguins, 
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = species)) +
  geom_smooth(method = "lm")

# to account for color blindness or issues with visualizing the colors, adding different shapes to the plots is another way to differentiate the data
ggplot(
  data = penguins, 
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) + 
  geom_point(mapping = aes(color = species, shape = species)) +
  geom_smooth(method = "lm")

# another thing is adding labels so it's easier to understand because sometimes the variable names from the table are coding in a way other people might not understand
# you would use the lab() function for this
ggplot(
  data = penguins, 
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) +
  scale_color_colorblind() # this is a function to pick colorblind safe colors


ggplot(
  data = penguins, 
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = bill_depth_mm)) +
  geom_smooth()

ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

# There are easier ways to write out the plot to save typing so the following plot can be reduced
# From this:
ggplot(
  data = penguins, 
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point()
# To this:
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()

# Eventually you can even use pipping to help with plots, like this:
penguins |> 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()

# Visualizing distribution: Categorical vs Numerical

# For categorical variables:
# a variable is categorical if it can only take one of a small set of values
# Most of the time we will be using bar charts for this data 
# the height of the bar shows how many observations there are for each x value
ggplot(penguins, aes(x = species)) +
  geom_bar()
# by default the order of the categories will be alphabetical but you can reorder them for highest frequency first 
ggplot(penguins, aes(x = fct_infreq(species))) +
  geom_bar()

# for numeric variables:
# a variable is numerical (quantitative) if it can take on a wide range of numerical values, and it is sensible to add, subtract, or take averages with those values
# a common visual for this is the histogram
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 200)
# it is always worth playing around with the binwidth because if there are too many observations the lines are too narrow and it will be hard to read
# the higher the number the less bars and the thicker and easier they are to read 

# another way to visualize numeric data is with a density plot
# this is basically a smoothed out version of a histogram 
ggplot(penguins, aes(x = body_mass_g)) +
  geom_density()


ggplot(penguins, aes(y = species)) + 
  geom_bar()

ggplot(penguins, aes(x = species)) +
  geom_bar(color = "red")

ggplot(penguins, aes(x = species)) +
  geom_bar(fill = "red")


ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.2)

# visualizing relationships
# to see numeric and categorical values side by side, we can use box-plots
ggplot(penguins, aes(x = species, y = body_mass_g)) +
  geom_boxplot()
# can also make density plots too
ggplot(penguins, aes(x = body_mass_g, color = species)) +
  geom_density(linewidth = 0.75) # adjusting the linewidth can make the lines more readable 
# to add to the visual, you can also fill in the space underneath the lines 
ggplot(penguins, aes(x = body_mass_g, color = species, fill = species)) +
  geom_density(alpha = 0.5) # the transparency is between 0 (completely transparent) and 1 (completely opaque)

# there are also options to see visuals of 2 categorical variables at once 
# this is commonly done by stacked bar plots 
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar()

ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill") # adding the fill position maxes each bar out to the top and the y essentially because what percentage of the whole

# for three or more numeric variables: 
# we can use the visual of the scatterplot but add other aesthetics for the other variables like color for one and shape for another variable
# but this can make it difficult to read
# another option is using the facet_wrap() argument where it splits the visual into multiple different facets (which are just subsets of the data)
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) + 
  geom_point(aes(color = species, shape = species)) +
  facet_wrap(~island)

glimpse(mpg)
?mpg

ggplot(mpg, aes(x = hwy, y = displ, linewidth = cty)) +
    geom_point()

ggplot(penguins, aes(x = bill_depth_mm, y = bill_length_mm, color = species)) +
  geom_point() +
  facet_wrap(~species)

ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm, 
    color = species, shape = species
  )
) +
  geom_point() +
  labs(
    color = "Species",
    shape = "Species"
    )

ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill")
ggplot(penguins, aes(x = species, fill = island)) +
  geom_bar(position = "fill")


# coding basics in R 
# basic arithmetic in R
1 / 200 * 30
(59 + 73 + 2) / 3
sin(pi / 2)

# you can save a value as an object by using <- 
x <- 3 * 4
# you can also save a group of elements into a vector using c()
primes <- c(2, 3, 5, 7, 11, 13)

primes * 2
primes - 1

x

seq(from = 1, to = 10)

library(nycflights13) # dataset of all flights departing NYC in 2013
library(tidyverse)

nycflights13::flights # there are multiple tibbes in this dataset so this is how we specify which one we want 

# in order to combine multiple different verbs into one problem, you would use the '|' to pipe them together
flights |> 
  filter(dest == "IAH") |> 
  group_by(year, month, day) |> 
  summarize(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )

# an important verb that affects the rows of a dataset is filter() which says which rows of the data we want to work on
# another is arrange() which rearranges the order of the rows but doesnt affect the number of rows seen 

# for filter()
# if we want to find all flights that departed more than 120 minutes (two hours) late:
flights |> 
  filter(dep_delay > 120)
# flights that departed on jan 1
flights |> 
  filter(month == 1 & day == 1)
# flights that departed in jan or feb
flights |>
  filter(month == 1 | month == 2)

# a shortcut for combing | and == is %in% which will keep rows where the variable equals one of the values on the right
# so you can rewrite the above as:
flights |>
  filter(month %in% c(1, 2))

# using dplyr verbs does not modify the existing dataset but instead creates a new one which is temporary but there is a way to save it 
# you would save it to its own operation
jan1 <- flights |>
  filter(month == 1 & day == 1)

# arrange is a way to arrange the rows based on the values of certain columns 
# by default it does this ascendingly
flights |>
  arrange(year, month, day, dep_time)
flights |>
  arrange(desc(dep_delay))

# distinct() is used to get the unique rows rows based on whichever column you used
# basically this removes all duplicates in a particular column 
flights |>
  distinct()
# finds all unique origin and destination pairs
flights |>
  distinct(origin, dest)
# this will typically only keep the columns that you are specifying but if you want to see all the columns you would use `.keep_all = TRUE`
flights |>
  distinct(origin, dest, .keep_all = TRUE)

# to get a count of how many rows match each unique value, you would use the count() function 
flights |>
  count(origin, dest, sort = TRUE)

?flights
flights |>
  distinct(carrier)

flights |>
  arrange(desc(dep_delay))

flights |>
  arrange(time_hour)

flights |>
  arrange(air_time)

flights |>
  count(month, day)

flights |>
  arrange(desc(distance))

# to modify columns you can use the functions: 
# mutate() - creates new columns based on existing columns 
# select() - like filter for columns where it will only show certain columns 
# rename() - changes column names 
# relocate() - changes the position of columns

flights |>
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60)
  
flights |>
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60,
    .before = 1 # this specifies where you want the new columns to be added to in the position of the dataset 
  )


flights |>
  mutate(
    gain = dep_delay - arr_delay,
    hours = air_time / 60,
    gain_per_hour = gain / hours,
    .keep = "used" # this is used to say you only want to keep the columns involved in the mutation 
  )

flights |>
  relocate(time_hour, air_time)

# to move the columns year to dep_time and move them after time_hour:
flights |>
  relocate(year:dep_time, .after = time_hour) # you can also specify where the relocated columns go using the .before/.after 

# to move the columns that start with "arr" to before dep_time:
flights |>
  relocate(starts_with("arr"), .before = dep_time)

flights |>
  select(sched_dep_time, dep_time, dep_delay)

select(flights, dep_time:arr_delay, -sched_dep_time, -sched_arr_time)


flights |>
  select(carrier, carrier, flight)

variables <- c("year", "month", "day", "dep_delay", "arr_delay")
flights |>
  select(any_of(variables))


flights |> select(contains("TIME"))


flights |>
  rename(air_time_min = air_time) |>
  relocate(air_time_min)

# find the fastest flight to Houston's IAH airport:
flights |>
  filter(dest == "IAH") |>
  mutate(speed = distance / air_time * 60) |>
  select(year:day, dep_time, carrier, flight, speed) |>
  arrange(desc(speed))


arrange(
  select(
    mutate(
      filter(
        flights, 
        dest == "IAH"
      ),
      speed = distance / air_time * 60
    ),
    year:day, dep_time, carrier, flight, speed
  ),
  desc(speed)
)


# grouping data by a specific column means you can work with each group for other functions
flights |> 
  group_by(month)

# summarize is similar to what it does in python but you can give it more specifications in R
# if we want to see the average departure delay by month:
flights |> 
  group_by(month) |> 
  summarize(
    avg_delay = mean(dep_delay, na.rm = TRUE) # we need to include the na.rm = TRUE to ignore blanks in the data otherwise we just get 'NA' for each output
  )

# it is also possible to have multiple summaries into a single call of summarize()
# n() used in the below is for returning the number of rows in each group
flights |> 
  group_by(month) |> 
  summarize(
    avg_delay = mean(dep_delay, na.rm = TRUE),
    n = n()
  )

# there are multiple types of slice_ functions that let you extract specific rows within each group 
# df |> slice_head(n = 1) takes the first row from each group.
# df |> slice_tail(n = 1) takes the last row in each group.
# df |> slice_min(x, n = 1) takes the row with the smallest value of column x.
# df |> slice_max(x, n = 1) takes the row with the largest value of column x.
# df |> slice_sample(n = 1) takes one random row.

flights |> 
  group_by(dest) |> # this will group the dataset by the destination location 
  slice_max(arr_delay, n = 1) |> # this will take the top 1 max number row in the arrival delay column 
  relocate(dest) # this then takes the dest column and moves it to the first column 

# you can also group by more than one variable:
daily <- flights |> 
  group_by(year, month, day) # this will group the dataset by each day of the year 
daily

daily_flights <- daily |> 
  summarize(n = n())
# dplyr will send a message that the summarise() will only group the output by the first 2 groupings and will exclude the last one
# it will say the way to include the last is by adding the `.groups` argument
# you can also addendum this function to include different values by adding "drop" and "keep" 

# to remove grouping you would use `ungroup()` 
daily |> 
  ungroup()

# if you summarize without any type of grouping then you just get one output because the summary will just be of the entire dataset
daily |> 
  ungroup() |> 
  summarize(
    avg_delay = mean(dep_delay, na.rm = TRUE), 
    flights = n()
  )

# there is another method of grouping that is newer by using the `.by`
# the advantage of this is that it won't give back the message that it dropped the last row and you won't have to use `ungroup()` at the end 
# you can also group multiple things together with .by
flights |> 
  summarize(
    delay = mean(dep_delay, na.rm = TRUE),
    n = n(),
    .by = month 
  )

flights |> 
  summarize(
    delay = mean(dep_delay, na.rm = TRUE),
    n = n(),
    .by = c(origin, dest)
  )


# 1. 
flights |> 
  group_by(carrier, dest) |> # grouping the data by carrier and destination airport 
  summarize(avg_delay = mean(dep_delay, na.rm = TRUE)) |> # take the average delay time and create a column for it
  arrange(desc(avg_delay)) # sort the output by highest average delay time
# the output will show that the top worst avg delay is UA to STL with an avg of 77.5

# 2.
flights |> 
  filter(dep_delay > 0) |> # will filter to only include flights with a delayed departure time 
  group_by(dest) |> # groups the data by the destination
  slice_max(dep_delay, n = 1) |> # takes the top row for highest departure delay time
  relocate(dest) # moves the destination column to the first column

# 3. 
flights |> 
  ggplot(aes(x = dep_time, y = dep_delay, na.rm = TRUE)) +
  geom_point()

# 4.
flights |> 
  slice_min(dep_delay, n = -1)

# 6.
df <- tibble(
  x = 1:5,
  y = c("a", "b", "a", "a", "b"),
  z = c("K", "K", "L", "L", "K")
)

df |>
  group_by(y)

df |>
  arrange(y)

df |>
  group_by(y) |>
  summarize(mean_x = mean(x))

df |>
  group_by(y, z) |>
  summarize(mean_x = mean(x))

df |>
  group_by(y, z) |>
  summarize(mean_x = mean(x), .groups = "drop")

df |>
  group_by(y, z) |>
  summarize(mean_x = mean(x))

df |>
  group_by(y, z) |>
  mutate(mean_x = mean(x))

install.packages("styler")
library(styler)


flights |>
  filter(dest == "IAH") |> 
  group_by(year, month, day) |> 
  summarize(
    n = n(),
    delay = mean(arr_delay, na.rm = TRUE)
  ) |> 
  filter(n > 10)

flights |> 
  filter(
    carrier == "UA",
    dest  %in% c("IAH", "HOU"),
    sched_dep_time > 0900,
    sched_arr_time < 2000
  ) |> 
  group_by(flight) |> 
  summarize(
    delay = mean(arr_delay, na.rm = TRUE),
    cancelled = sum(is.na(arr_delay)),
    n = n()
  ) |> 
  filter(n > 10)


# another way to handle large datasets and make them easier to read and work with is by pivoting the data
# this is when you take a dataset and expand upon it based on the data that is already there
# ex:
df <- tribble(
  ~id,  ~bp1, ~bp2,
  "A",  100,  120,
  "B",  140,  115,
  "C",  120,  125
)
# if we want to take this tribble and see each measurement and value per id with the id and measurement in separate rows:
df |> 
  pivot_longer(
    cols = bp1:bp2,
    names_to = "measurement",
    values_to = "value"
  )
# this will now essentially let us see the different combinations of the data

# to go from a tibble with the column names being ex: x_1, y_2, x_3, etc. you can use the underscore as a separator for elongating the dataset
who2 |> 
  pivot_longer(
    cols = !(country:year),
    names_to = c("diagnosis", "gender", "age"),
    names_sep = "_",
    values_to = "count"
  )

household |> 
  pivot_longer(
    cols = !family, 
    names_to = c(".value", "child"),
    
  "B",        "bp2",    115
)

df |>
  pivot_wider(
    names_from = measurement,
    values_from = value
  )

df |> 
  group_by(id, measurement) |> 
  summarize(n = n(), .groups = "drop") |> 
  filter(n > 1)

# Chapter: Visualize -----------------------------------------------------------
library(tidyverse)

# when using shapes, there are a max of 6 discrete (unique) values that can be used so if you have more than that, it's best to use something else like color 
# size is also not the best idea if there are too many discrete values because then the whole plot will just look like a giant blob 

# R has 26 built-in shapes that are identified by numbers. There are some seeming duplicates: for example, 0, 15, and 22 are all squares. The difference comes from the interaction of the color and fill aesthetics. The hollow shapes (0–14) have a border determined by color; the solid shapes (15–20) are filled with color; the filled shapes (21–25) have a border of color and are filled with fill. Shapes are arranged to keep similar shapes next to each other.

# to see the different aesthetic options: https://ggplot2.tidyverse.org/articles/ggplot2-specs.html

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Exercises:
# 1. Create a scatterplot of hwy vs. displ where the points are pink filled in triangles.
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(shape = 24, fill = "pink")
# shapes are used by numbers instead of names 

# 2. Why did the following code not result in a plot with blue points?
ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy, color = "blue"))
# Your code did not result in blue points because "blue" is placed inside aes(), treating it as a categorical variable rather than setting the actual color.
# the fixed code is below:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(color = "blue")

# 3. What does the stroke aesthetic do? What shapes does it work with? (Hint: use ?geom_point)
?geom_point
# for shapes that have borders: Use the stroke aesthetic to modify the width of the border

# 4. What happens if you map an aesthetic to something other than a variable name, like aes(color = displ < 5)? Note, you’ll also need to specify x and y.
# it evaluates the expression for each row in the dataset and treats it as a categorical (logical) variable so:
# displ < 5 returns TRUE or FALSE for each row 
# ggplot2 treats these logical values as discrete categories 
# the plot will use a different color for TRUE (displ < 5) and FALSE (displ >= 5)
# a legend will be created showing the two groups (TRUE and FALSE)
ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy, color = displ < 5))

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# the aesthetics can be used for geom_point() and geom_smooth() but not all aesthetics can be mapped to both like shape for _smooth 
# for geom_smooth() you could use linetype:
ggplot(mpg, aes(x = displ, y = hwy, linetype = drv)) +
  geom_smooth()
# another option to make it even more clear is to actually stack the two on top of each other:
ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth(aes(linetype = drv))
# aesthetics for each geom is the mapping for that layer only which makes it possible to see multiple overlapping aesthetics per layer 
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth()

# the local layer aesthetics override the global aesthetics too:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_point(
    data = mpg |> filter(class == "2seater"),
    color = "red"
  ) +
  geom_point(
    data = mpg |> filter(class == "2seater"),
    shape = "circle open", size = 3, color = "red"
  )

# ggplot2 only has 40 geoms but there are more expansion packs for more visuals for whatever you need
# one other example is the ggridges package that can make ridge lines which are useful for visualizing density of numeric variables based on categorical variables 
install.packages("ggridges")
library(ggridges)

ggplot(mpg, aes(x = hwy, y = drv, fill = drv, color = drv)) +
  geom_density_ridges(alpha = 0.5, show.legend = FALSE)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Exercises
# 1. What geom would you use to draw a line chart? A boxplot? A histogram? An area chart?
# line = geom_line()
# boxplot = geom_boxplot()
# histogram = geom_histogram()
# area chart = geom_area()

# 2. Earlier in this chapter we used show.legend without explaining it:

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_smooth(aes(color = drv), show.legend = FALSE)

# What does show.legend = FALSE do here? What happens if you remove it? Why do you think we used it earlier?
# it removes the legend in the visual which can be good to compare multiple visuals that have the same legend so it doesn't get in the way 

# 3. What does the se argument to geom_smooth() do?
?geom_smooth
# Display confidence interval around smooth? (TRUE by default, see level to control.)

# 4. Recreate the R code necessary to generate the following graphs. Note that wherever a categorical variable is used in the plot, it’s drv.

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(color = "blue", se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(aes(group = drv), se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth(aes(group = drv), se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(aes(color = drv)) +
  geom_smooth(se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv)) +
  geom_smooth(aes(group = drv, linetype = drv), se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(fill = drv), shape = 21, color = "white", stroke = 1)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# facet_wrap() is used to split a plot into subplots based on categorical variables:
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~cyl)

# but if you want to use two variables, you would use facet_grid() instead 
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() + 
  facet_grid(drv ~ cyl)
# it defaults to the same scale for the ranges of x and y but to have it autoscale then use "free_x", "free_y" or "free" for both
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_grid(drv ~ cyl, scales = "free")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Exercises 

# 1. What happens if you facet on a continuous variable?
# it will convert the continuous variable into bins 
ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy)) +
  facet_wrap(~ cty)

# 2. What do the empty cells in the plot above with facet_grid(drv ~ cyl) mean? Run the following code. How do they relate to the resulting plot?

ggplot(mpg) + 
  geom_point(aes(x = drv, y = cyl))

# it means there are no data points for those categories

# 3. What plots does the following code make? What does . do?

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)
# this makes 3 different horizontal graphs

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
# this makes 3 different vertical graphs

# `.` is just a placeholder so that we can have a facet in only one dimension. 
# This is necessary because sometimes one sided formulae can cause problems.

# 4. Take the first faceted plot in this section:

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) + 
  facet_wrap(~ cyl, nrow = 2)

# What are the advantages to using faceting instead of the color aesthetic? What are the disadvantages? How might the balance change if you had a larger dataset?

# its easier to see the data groupings for each category but its hard to compare the categories together 
# It is difficult to resolve more than a dozen or so discrete colours, but we can have a larger number of facets than that. On the other hand, facets can be harder to read at a glance, or if the cells being compared aren't lined up in the required dimension. So in a situation like this, colours are probably better, but if we had more classes, or wanted to use colour for a different variable, facets would come into their own.

# 5. Read ?facet_wrap. What does nrow do? What does ncol do? What other options control the layout of the individual panels? Why doesn’t facet_grid() have nrow and ncol arguments?
?facet_wrap
# nrow is number of rows
# ncol is number of columns 
# you can change the order of the panels
?facet_grid
# because there are only ever a set number of rows and cols depending on the two variables
# In `facet_wrap`, `nrow` and `ncol` control the numbers of rows and columns, but in `facet_grid` these are implied by the faceting variables. `dir` also controls the placement of the individual panels, and so isn't an argument of `facet_grid`.

# 6. Which of the following plots makes it easier to compare engine size (displ) across cars with different drive trains? What does this say about when to place a faceting variable across rows or columns?

ggplot(mpg, aes(x = displ)) + 
  geom_histogram() + 
  facet_grid(drv ~ .)
# this one is easier to compare the grouping/skewness of each type of drive trains for comparison between them

ggplot(mpg, aes(x = displ)) + 
  geom_histogram() +
  facet_grid(. ~ drv)
# this one is easier to compare counts but harder to see the skinnier lines

# 7. Recreate the following plot using facet_wrap() instead of facet_grid(). How do the positions of the facet labels change?

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy)) +
  facet_wrap(~ drv, nrow = 3)
# it now shows the labels for drv on top of the graph instead of the right side 


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# there are a bunch of geoms that auto calculate stats for their displays like geom_bar using the count of variables # you are able to change the way it calculates these stats by specifying something different
# if you want to use identity instead of count you would do:
diamonds |>
  count(cut) |> 
  ggplot(aes(x = cut, y = n)) +
  geom_bar(stat = "identity")

# another option is displaying proportions instead of counts 
ggplot(diamonds, aes(x = cut, y = after_stat(prop), group = 1)) + 
  geom_bar()

# another option is a stat summary which summarized the y values for each unique x value
ggplot(diamonds) +
  stat_summary(
    aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max, 
    fun = median
  )

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Exercises
# 1. What is the default geom associated with stat_summary()? How could you rewrite the previous plot to use that geom function instead of the stat function?
# geom_pointrange()
ggplot(data = diamonds) +
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    stat = "summary",
    fun.min = min, 
    fun.max = max,
    fun = median
    )

# 2. What does geom_col() do? How is it different from geom_bar()?
?geom_col
# its like geom_bar but the heights of the bars represent values in the data 

# 3. Most geoms and stats come in pairs that are almost always used in concert. Make a list of all the pairs. What do they have in common? (Hint: Read through the documentation.)

# Complementary geoms and stats:
# geom                  | stat
# geom_bar()	            stat_count()
# geom_bin2d()	          stat_bin_2d()
# geom_boxplot()	        stat_boxplot()
# geom_contour_filled()	  stat_contour_filled()
# geom_contour()	        stat_contour()
# geom_count()	          stat_sum()
# geom_density_2d()	      stat_density_2d()
# geom_density()	        stat_density()
# geom_dotplot()	        stat_bindot()
# geom_function()	        stat_function()
# geom_sf()	              stat_sf()
# geom_sf()	              stat_sf()
# geom_smooth()	          stat_smooth()
# geom_violin()	          stat_ydensity()
# geom_hex()	            stat_bin_hex()
# geom_qq_line()	        stat_qq_line()
# geom_qq()	              stat_qq()
# geom_quantile()	        stat_quantile()

# 4.  What variables does stat_smooth() compute? What arguments control its behavior?
?stat_smooth
# Aids the eye in seeing patterns in the presence of overplotting
# The function stat_smooth() calculates the following variables:
# - y: predicted value
# - ymin: lower value of the confidence interval
# - ymax: upper value of the confidence interval
# - se: standard error

# 5. In our proportion bar chart, we needed to set group = 1. Why? In other words, what is the problem with these two graphs?

ggplot(diamonds, aes(x = cut, y = after_stat(prop))) + 
  geom_bar()
ggplot(diamonds, aes(x = cut, fill = color, y = after_stat(prop))) + 
  geom_bar()

# with the group = 1 not included the bars will have the same height and it won't show anything valuable 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# bar charts ca be either outlined in color or filled with color 
# if you map the fill to another variable that isnt the x or y, it stacks the colors on top of one another in the bars 
# there is a position argument when you have stacked bars
# they are: 
# - identity
# - dodge 
# - fill 

# identity keeps the bars exactly where they fall and additives like alpha (transparency) and fill = N/A (just an outline) can be used in combination to make the categories easier to see
# fill is stacked bars but for % so the bars are fully set to 100 and the categories within are the percentages of 100 so its useful for seeing with the overall categories but not for comparing with one another 
# dodge puts all the subcategories side by side instead of stacked so it makes a bunch of bars which is good to compare overall but not within the overarching categories 

# if you have a dataset with a lot of data especially with points and there are many that have the same you run into issues of overplotting 
# to help this you can add the position "jitter" that will not keep the points on such uniforms lines so its easier to see larger clumps compared to one or two by themselves 
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(position = "jitter")
# this is better to use with larger data sets rather than smaller data sets 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Exercises 
# 1. What is the problem with the following plot? How could you improve it?
  
  ggplot(mpg, aes(x = cty, y = hwy)) + 
    geom_point()

  ggplot(mpg, aes(x = cty, y = hwy)) +
    geom_point(position = "jitter") # adding jitter will make it easier to read 
  
# 2. What, if anything, is the difference between the two plots? Why?
  
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(position = "identity")
# no difference?

# 3. What parameters to geom_jitter() control the amount of jittering?
# width and height 
  
# 4. Compare and contrast geom_jitter() with geom_count().
# The geom geom_jitter() adds random variation to the locations points of the graph. In other words, it “jitters” the locations of points slightly. This method reduces overplotting since two points with the same location are unlikely to have the same random variation.
# However, the reduction in overlapping comes at the cost of slightly changing the x and y values of the points.
# The geom geom_count() sizes the points relative to the number of observations. Combinations of (x, y) values with more observations will be larger than those with fewer observations.

# 5. What’s the default position adjustment for geom_boxplot()? Create a visualization of the mpg dataset that demonstrates it.
# default position is dodge2 and this can be either horizontal or vertical 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# there is also the ability to use actual map coordinates to map locations on a graph 
nz <- map_data("nz")

ggplot(nz, aes(x = long, y =lat, group = group)) +
  geom_polygon(fill = "white", color = "black") +
  coord_quickmap()

bar <- ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = clarity, fill = clarity),
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1)

bar + coord_flip()
bar + coord_polar()

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Exercise 
ggplot(mpg, aes(x = factor(1), fill = drv)) +
  geom_bar()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()
?geom_abline()

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# EDA
library("tidyverse")
library("nycflights13")
install.packages("ggbeeswarm")
library("ggbeeswarm")
install.packages("lvplot")
library("lvplot")
install.packages("ggstance")
library("ggstance")

ggplot(diamonds, aes(x = y)) +
  geom_histogram(binwidth = 0.5)
# this plot is too big to see any of the outliers so we need to zoom into the small values in the y-axis and we can do so with coord_cartesian()

ggplot(diamonds, aes(x = y)) +
  geom_histogram(binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))

unusual <- diamonds |>
  filter(y < 3 | y > 20) |>
  select(price, x, y, z) |>
  arrange(y)
unusual


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Exercises
# 1.
summary(select(diamonds, x, y, z))

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = x), binwidth = 0.01)

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.01)

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = z), binwidth = 0.01)

# to see the outliers more clearly 
ggplot(diamonds, aes(x = x, y = y)) +
  geom_point()

ggplot(diamonds, aes(x = x, y = z)) +
  geom_point()

ggplot(diamonds, aes(x = y, y = z)) +
  geom_point()

# now lets look at the histograms with the outliers removed
filter(diamonds, x > 0, x < 10) %>%
  ggplot() +
  geom_histogram(mapping = aes(x = x), binwidth = 0.01) +
  scale_x_continuous(breaks = 1:10)

filter(diamonds, y > 0, y < 10) %>%
  ggplot() +
  geom_histogram(mapping = aes(x = y), binwidth = 0.01) +
  scale_x_continuous(breaks = 1:10)

filter(diamonds, z > 0, z < 10) %>%
  ggplot() +
  geom_histogram(mapping = aes(x = z), binwidth = 0.01) +
  scale_x_continuous(breaks = 1:10)

# 2. 
?diamonds
ggplot(diamonds) +
  geom_histogram(mapping = aes(x = price), binwidth = 10)
ggplot(diamonds) +
  geom_histogram(mapping = aes(x = price), binwidth = 500)

# 3. 
diamonds %>%
  filter(carat >= 0.99, carat <= 1) %>%
  count(carat)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
diamonds2 <- diamonds |> 
  mutate(y = if_else(y < 3 | y > 20, NA, y))

ggplot(diamonds2, aes(x = x, y = y)) + 
  geom_point()

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# exercises
mean(c(0, 1, 2, NA), na.rm = TRUE)
sum(c(0, 1, 2, NA), na.rm = TRUE)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

ggplot(diamonds, aes(x = price)) +
  geom_freqpoly(aes(color = cut), binwidth = 500, linewidth = 0.75)

ggplot(diamonds, aes(x = price, y = after_stat(density))) + 
  geom_freqpoly(aes(color = cut), binwidth = 500, linewidth = 0.75)

# or you can use side-by-side boxplots 
ggplot(diamonds, aes(x = cut, y = price)) +
  geom_boxplot()


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Exercises 

mean(c(0, 1, 2, NA), na.rm = TRUE)
sum(c(0, 1, 2, NA), na.rm = TRUE)

nycflights13::flights |> 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + (sched_min / 60)
  ) |> 
  ggplot(aes(x = sched_dep_time)) + 
  geom_freqpoly(aes(color = cancelled), binwidth = 1/2)

nycflights13::flights %>% 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60
  ) %>% 
  ggplot(mapping = aes(x=sched_dep_time, y=..density..)) + 
  geom_freqpoly(mapping = aes(colour = cancelled), binwidth = .25)+
  xlim(c(5,25))

nycflights13::flights %>% 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60
  ) %>% 
  ggplot(mapping = aes(x=sched_dep_time)) + 
  geom_density(mapping = aes(fill = cancelled), alpha = 0.30)+
  xlim(c(5,25))

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
ggplot(diamonds, aes(x = price)) + 
  geom_freqpoly(aes(color = cut), binwidth = 500, linewidth = 1)


ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot()

ggplot(mpg, aes(x = fct_reorder(class, hwy, median), y = hwy)) + # the previous defaulted to alphabetical order for class but if we want to sort it by median value instead then you would use fct_reorder and specify how you want it reordered 
  geom_boxplot()

ggplot(mpg, aes(x = hwy, y = fct_reorder(class, hwy, median))) + # since the names are long, we want to make the display horizontal and you would do that by switching the x and y
  geom_boxplot()

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Exercises

nycflights13::flights %>%
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60
  ) %>%
  ggplot() +
  geom_boxplot(mapping = aes(y = sched_dep_time, x = cancelled))

###
?diamonds

ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)), orientation = "x")

###
install.packages("ggstance")
library(gg)

?coord_flip

ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy)) +
  coord_flip() # this plot shows horizontally 

ggplot(data = mpg) +
  geom_boxplot(mapping = aes(y = reorder(class, hwy, FUN = median), x = hwy)) # this plot also shows horizontally

ggplot(data = mpg) +
  geom_boxplot(mapping = aes(y = reorder(class, hwy, FUN = median), x = hwy), orientation = "y") # but you can also explicitly specify the orientation too

###
install.packages("lvplot")
library(lvplot)

?geom_lv
ggplot(diamonds, aes(x = cut, y = price)) +
  geom_lv()

###
?geom_violin

ggplot(data = diamonds, mapping = aes(x = price, y = ..density..)) +
  geom_freqpoly(mapping = aes(color = cut), binwidth = 500)

ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram() +
  facet_wrap(~cut, ncol = 1, scales = "free_y")

ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_violin() +
  coord_flip()

###
install.packages("ggbeeswarm")
library(ggbeeswarm)

?geom_quasirandom
?geom_beeswarm

ggplot(data = mpg) +
  geom_quasirandom(mapping = aes(
    x = reorder(class, hwy, FUN = median),
    y = hwy
  ))

ggplot(data = mpg) +
  geom_quasirandom(
    mapping = aes(
      x = reorder(class, hwy, FUN = median),
      y = hwy
    ),
    method = "tukey"
  )

ggplot(data = mpg) +
  geom_quasirandom(
    mapping = aes(
      x = reorder(class, hwy, FUN = median),
      y = hwy
    ),
    method = "tukeyDense"
  )

ggplot(data = mpg) +
  geom_quasirandom(
    mapping = aes(
      x = reorder(class, hwy, FUN = median),
      y = hwy
    ),
    method = "frowney"
  )

ggplot(data = mpg) +
  geom_quasirandom(
    mapping = aes(
      x = reorder(class, hwy, FUN = median),
      y = hwy
    ),
    method = "smiley"
  )

ggplot(data = mpg) +
  geom_beeswarm(mapping = aes(
    x = reorder(class, hwy, FUN = median),
    y = hwy
  ))
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

ggplot(diamonds, aes(x = cut, y = color)) +
  geom_count()

diamonds %>%
  count(color, cut)

diamonds %>%
  count(color, cut) %>%
  ggplot(aes(x = color, y = cut)) +
  geom_tile(aes(fill = n))


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Exercises

diamonds %>%
  count(color, cut) %>%
  group_by(color) %>%
  mutate(prop = n / sum(n)) %>%
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = prop))

diamonds %>%
  count(color, cut) %>%
  group_by(cut) %>%
  mutate(prop = n / sum(n)) %>%
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = prop))

### 
?geom_tile

flights %>%
  group_by(month, dest) %>%
  summarise(dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
  ggplot(aes(x = factor(month), y = dest, fill = dep_delay)) +
  geom_tile() +
  labs(x = "Month", y = "Destination", fill = "Departure Delay")

flights %>%
  group_by(month, dest) %>%                                 # This gives us (month, dest) pairs
  summarise(dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
  group_by(dest) %>%                                        # group all (month, dest) pairs by dest ..
  filter(n() == 12) %>%                                     # and only select those that have one entry per month 
  ungroup() %>%
  mutate(dest = reorder(dest, dep_delay)) %>%
  ggplot(aes(x = factor(month), y = dest, fill = dep_delay)) +
  geom_tile() +
  labs(x = "Month", y = "Destination", fill = "Departure Delay")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

smaller <- diamonds %>%
  filter(carat <= 2.5)

ggplot(smaller, aes(x = carat, y = price)) +
  geom_point()

ggplot(smaller, aes(x = carat, y = price)) +
  geom_point(alpha = 1/100)

ggplot(smaller, aes(x = carat, y = price)) +
  geom_bin2d()

install.packages("hexbin")
library(hexbin)

ggplot(smaller, aes(x = carat, y = price)) +
  geom_hex()

ggplot(smaller, aes(x = carat, y = price)) + 
  geom_boxplot(aes(group = cut_width(carat, 0.1)))
#> Warning: Orientation is not uniquely specified when both the x and y aesthetics are
#> continuous. Picking default orientation 'x'.


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Exercises







