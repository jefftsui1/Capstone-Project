library(dplyr)
library(tidyr)

setwd("C:/Users/Jayden/Desktop/Springboard/Data wrangling/exercise 2")

titanic <- read.csv("titanic_original.csv")
View(titanic)


titanic$embarked <- sub("^$", "S", titanic$embarked)


mean <- mean(titanic$age, na.rm = T)
mean

median <- median(titanic$age, na.rm = T)
median
# Another way could be using the median value instead, because the dataset is not a normal distribution and there are some extreme outliers which made the value of mean more bias than the value of median.


titanic$boat <- sub("^$", "NONE", titanic$boat)


titanic <- titanic %>% 
  mutate(has_cabin_number = ifelse(grepl("^$", cabin), 0, 1))


View(titanic)

write.csv(titanic,"titanic_clean.csv")

