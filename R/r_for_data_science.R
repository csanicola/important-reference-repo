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
  mapping = aes(x = bill_length_mm, y = bill_depth_mm)
) +
  geom_point()


























