# Analyzing Hospital Patient Data in R
# based on https://www.geeksforgeeks.org/analyzing-hospital-patient-data-in-r/

install.packages("tidyverse")
library(tidyverse)

install.packages(
    c("ggrepel", "ggridges", "ggthemes", "openxlsx", "tidymodels", "writexl")
)
library(ggthemes)
library(dplyr)
library(ggplot2)
library(ggcorrplot)

data <- read.csv("D:/GitHub/important-reference-repo/Data/fake_healthcare_data_v2.csv") # on Windows

head(data)

# Summary statistics for numerical variables
summary(data)

# Summary statistics for categorical variables
table(data$Practice_ID)
table(data$Quarter)

# Analyzing Visit Volume Over Time
ggplot(data, aes(x = Quarter, y = Visit_Volume)) +
    geom_boxplot() +
    labs(title = "Visit Volume by Quarter", x = "Quarter", y = "Visit Volume")
