################# Basic Task 2 ##################

# 1. Object x <-1:15
# Construct a 5x3 matrix for the value of x.
# A matrix is a two-dimensional rectangular data set. It can be 
# created using a vector input to the matrix function.

x <- 1:15
m <- matrix(x, nrow = 5, ncol = 3, byrow = TRUE)
m


###############################################
# 2. Write a program to generate the following 4x4 matrix¶
# 0 0 0 0
# 0 0 0 0
# 0 0 0 0
# 0 0 0 0
# 
# All the value of the matrix = 0, so we can put 0 as the value 
# of matrix in matrix() function directly.

m <- matrix(0, nrow = 4, ncol = 4, byrow = TRUE) 
m


###############################################

# 3. The object x<-1:8
# Write a program to generate the following 3x8 matrix using 
# "cbind(),rbind(),rev(),rep()"
# 
# 1 2 3 4 5 6 7 8
# 8 7 6 5 4 3 2 1
# 3 3 3 3 3 3 3 3

x <- 1:8
rbind(unname(x), rev(x), rep(3))

###############################################
# 4. Chose two different(x,y) 4x4 matrix to perform the following arithmetic operations

x <- matrix(1:16, 4, 4, TRUE)
y <- matrix(c(1,8,4,2,4,5,5,1,2,2,5,4,4,1,1,2), 4, 4)

#(a) adding matrices is the same as adding two elements in each other
x + y

#(b) perform subtraction operation on two matrices 
x - y

#(c) Element-wise multiplication: the elements in the same row are multiplied by one another.
x * y

#(d) Matrix multiplication
x %*% y

#(e) Inverse of a matrix
solve(y)

#(f) The elements in the same row of one matrix are divided by one another.
z <- x/y
z

#(g) Transpose of z: another matrix with the rows and columns interchanged.
t(z)

#(i) Diagonal of transpose matrix: 
diag(z)

###############################################
# 5. Difference between (i) & (ii)
# (i). x<-matrix(x<-1:9,3,3,byrow = TRUE) 
# (ii). x<-matrix(x<-1:9,3,3)
# byrow=TRUE indicates that the matrix should be filled by rows.
# 
# byrow=FALSE indicates that the matrix should be filled by columns (the default).
# 
# So the different between (i) and (ii) is because of byrow = TRUE. 
# (i) will return matrix which filled by row one value by one value. 
# (ii) will return matrix which filled by column one value by one value.

# Example: byrow=TRUE
x<-matrix(x<-1:9, 3, 3, byrow = TRUE) 
x

# Example: byrow=FALSE
x <- matrix(x<-1:9, 3, 3)
x


###############################################

# 6. Which function can we use for inner product and outer product in matrix calculation?
# For inner product, in R there is no function particularly, but we can use inner arithmetic operator %*% directly.
# For outer product, we can either use outer arithmetic operator %o% or use outer() function.

x <- 1:4
y <- diag(x)
z <- matrix(1:16, 4, 4, TRUE)

y %*% z     # Inner product

y %o% z     # Outer product

outer(y, z) # Outer product


###############################################

# 7. Explain the use of all.equal() function in Matrix with a sample program.
# all.equal(x, y) is a utility to compare R objects x and y testing 'near equality'. 
# If they are different, comparison is still made to some extent, and a report of the differences is returned.

a <- matrix(1:16, ncol = 4)
b <- matrix(1:16, ncol = 4)
c <- matrix(1:16, ncol = 2)

all.equal(a, b) # Return TRUE, because value and dimensions are the same
all.equal(a, c) # FALSE, because the dimensions are different


###############################################

# 8. Explain the use of dim() function with a sample program.
# dim() function used to get or set the dimension of the specified matrix, array or data frame.
# Syntax: dim(x)
# x can be array, matrix or data frame.

num <- 1:20
dim(num) <- c(4,5)
num

###############################################

# 9. Use of ($)operator, and square brackets [] in List with example program
# Using the dollar sign ($) for subsetting the data if the elements are named.
# Using the square brackets [] for subsetting the data either the elements are named or not.

l <- list(6:12, 1:5, 2:8)

l[2]  
l[[1]] 


# using $ operator to subset the list
# First we need to create the list.
# Then we give the names to the each elements by using names() function. 
# Last, call name element by using $ 

a <- 6:12
b <- 1:5
c <- 2:8
l <- list(a, b, c)
names(l) <- c("First", "Second", "Third")
l$Second

###############################################

# 10. Explain ifelse() with example.

a = c(4,12,5,8,0,2)
ifelse(a %% 2 == 0,"even","odd")

###############################################

# 11. Write a program to get the weight and height from the user to calculate the following cases
# a. If your BMI is less than 18.5, it falls within the underweight range.
# b. If your BMI is 18.5 to <25, it falls within the normal.
# c. If your BMI is 25.0 to <30, it falls within the overweight range.
# d. If your BMI is 30.0 or higher, it falls within the obese range.

height <- as.numeric(readline(prompt = "Enter height(m): "))  
weight <- as.numeric(readline(prompt = "Enter weight(kg): "))  


bmi <- weight/(height ^ 2)
if(bmi < 18.5){
  print("Underweight range!")
} else if(bmi < 25) {
  print("Normal range!")
} else if(bmi < 30) {
  print("Overweight range!")
} else {
  print("Obses range!")
}

###############################################

# 12. List example.

l <- list(c(1,2,3), 11.2, sin)

same_name <- list(age = 20, name = "Khean Sreythou", age = 21)
cat("Age return: ", same_name$age) # return age = 20


###############################################

# 13. Data Frame example.

student <- data.frame(
  roll_number = c(1101701001, 1101701002, 1101701003),
  name = c("Chhuny", "Munyvorn", "Nataly"),
  gender = c("Male", "Male", "Female"),
  age = c(21, 20, 22)
)

student

###############################################

# 14. Repeat Loop example.


x <- 1

repeat {
  cat("Hello World!\n")
  x <- x + 1
  if(x == 7){
    break
  }
}



###############################################

# 14. while loop example.

x <- 1

while(x < 7){
  cat("Hello World!\n")
  x <- x + 1
}



