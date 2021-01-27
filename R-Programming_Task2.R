################ Basic Task 3 ##################
# 1. Calculation the following:
# a. ?? with and without loop.

#a. (with loop)

a <- 5:100
s <- 0
for (i in a){
  s <- s + (i^4 + 5*i^3)
}
s

#a. (without loop)

a <- 5:100
sum(a^4 + 5*a^3)

#################

#b. Calculate U40 which is a series, Un =Un???1 +Un???2 , with U1 = 1 and U2 = 2
# U0 = 1; U1 = 1; U2 = 2; U3 = 3; U4 = 5

fibonacci <- numeric(40)
fibonacci[1] <- 1
fibonacci[2] <- fibonacci[1] + 1
for (i in 3:40) fibonacci[i] <- fibonacci[i - 2] + fibonacci[i - 1]

# Print U40
fibonacci[40]


##################

#c. Write a program to calculate sin x, cos x(Taylor series) , Get the input(x) from the user and n = 45.
# install.packages("pracma")
library(pracma)

n <- 45
x <- as.integer(readline(prompt = "Input x: "))


taylor(cos, x, n)
taylor(sin, x, n)

#################

#d. Create a vector of the values of e^x*cos(x) at x = 3, 3.1, 3.2, . . . , 6.

x <- seq(3,6, by = 0.1)
exp(x)*cos(x)

#################

# e. x <- 1:300. How many numbers in x are divisible by 2?

x <- 1:300
length(x[x%%2 == 0])



###############################################

# 2. Solve the following system of linear equations using Gaussian elimination
# x + 2y + 3x = 9  
# 2x - y + 2z = ???3  
# 3x + 3y + z = 5

# If not yet install matlib library 
# install.packages("matlib")

library(matlib)

right_matrix = matrix(c(9,-3,5), nrow=3)
left_matrix = matrix(c(1,2,3,2,-1,3,3,2,1), nrow=3)

result <- gaussianElimination(left_matrix, right_matrix)
result
cat("x = ", result[10], ", y = ", result[11], ", z = ", result[12])



###############################################

# 3. Use outer function to create the following matrix
# 0 1 2 3 4
# 1 2 3 4 5
# 2 3 4 5 6
# 3 4 5 6 7
# 4 5 6 7 8

n <- 0:4
m <- outer(n, n,"+")
m


###############################################

# 4. Get the COVID-19 Dataset from the data sources.
# Number of observations should be more than 100. Then, report the following informations
# 
# install.packages("tidyverse")


# a. Data Source detail
# Dataset on China COVID 19 Data
# COVID-19 Cases in 31 Districts in China with City wise Graph analysis
# Author: Aman Kumar
# URL: https://www.kaggle.com/aestheteaman01/china-covid19-data?select=China_edited_data.csv

library(tidyverse)
dataset <- read_csv("China_edited_data.csv")
dataset

######################

# b. Explain the Unit & Necessity of each variable

names(dataset)


# Convert Date format from char to date

dataset$`Observation Date` <- as.Date(dataset$`Observation Date`, format = '%d/%m/%Y')
dataset

######################

# c. Find the missing values(rows & columns) and replace them with mean(Tidy Dataset)

dataset[] <- lapply(dataset, function(x) {
  x[is.na(x)]<- mean(x, na.rm = TRUE)
  x
})
dataset

# dataset$Confirmed[which(is.na(dataset$Confirmed))] <- mean(dataset$Confirmed, na.rm = TRUE)
# dataset

######################

# d. Generate the two new variables(Var1:Mean, Var2: Median from available variable)

dataset <- dataset %>% mutate(Mean = mean(Confirmed), Median = median(Confirmed))
dataset

######################


# e. Rename the two existing variables

dataset <- dataset %>% rename(Altitude = Latitude, Azimuth = Longitude)
dataset

######################

# f. Create a plot using following instructions (using 7 layers of Grammar of Graphics)
#    i. Choose x and y axis
#     ii. geom_point() - specify the parameters, size : 5, color: red, alpha: ???

library("ggplot2")

g <- ggplot(data=dataset, mapping= aes(x= Observation, y = Confirmed)) + 
  geom_point(size = 5, color = "red", alpha = 1/5) 
g

#    iii. Use Facet grid, cartesian coordinates & geom_smooth()

g <- g + facet_grid(dataset$`Observation Date` ~ Deaths) + geom_smooth()
g

#    iv. Assign the title to x, y and graph

g <- g + ggtitle("COVID-19 Cases in 31 Districts in China") + 
  xlab("Date") + ylab("Number of positive cases")
g

#    v. Export the graph to your working directory with the title called "covid_19_dataset.png"

ggsave(filename = "covid_19_dataset.png")


