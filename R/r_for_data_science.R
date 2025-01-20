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

# Chapter: Whole Game

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

################################################################
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































