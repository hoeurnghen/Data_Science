#1. Write a R code to Generate 6X6 matrix (A) using the random numbers between 1 to 100
&amp; generate another 6x6 matrix (B) using random numbers between 500 to 600.
(20 Marks)
a. Find the range of matrices A and B.
b. Find the max value from each row of the matrices A and B.
c. Find the diagonal values of matrices A&amp;B.
d. Multiply matrices A and B
e. Replace the 4th row of Matrix A with diagonal values of matrix B
f. Multiply matrices A &amp; B and store the values on X.
g. Divide the matrix A with matrix B.
```{r}
## create A and B
x <- sample(1:100)
y <- sample(500:600)
A <- matrix(x, nrow = 6, ncol = 6)
B <- matrix(y, nrow = 6, ncol = 6)
A
B
# a. Find the range of matrices A and B.
print("range of matric A")
range(A)
print("range of matric B")
range(B)
# b.Find the max value from each row of the matrices A and B.
print("The max value from each row of the matrices A")
apply(A,1,max)
print("The max value from each row of the matrices B")
apply(B,1,max)
# c. Find the diagonal values of matrices A&B.
print("The diagonal values of matrices A&B")
z <- A / B
diag(t(z))
# d. Multiply matrices A and B
print("Multiply matrices A and B (inner product)")
A %*% B
# e. Replace the 4th row of Matrix A with diagonal values of matrix B
print("Replace the 4th row of Matrix A with diagonal values of matrix B")
A[4, ] <- diag(t(B))
A
# f. Multiply matrices A & B and store the values on X.
print("Multiply matrices A & B and store the values on X")
X <- A %*% B
X
# g. Divide the matrix A with matrix B.
print("Divide the matrix A with matrix B")
A / B
```
#2. Create a table using dataframe/tibble with the following categories(a to f) (10 marks)
a. First name,
b. Second Name,
c. Age,
d. Occupation,
e. Place,
f. Random numbers( between 1 to 10)
And input at least 10 samples(observation) and do the following
g. Extract the last column (f)
h. Find the sum, mean and length of the extracted column
```{r}
#Create a table using dataframe/tibble with the following categories(a to f)
#(a)
fn<-c("Manich","Nyratt","Chunny","Nataly","Kimteng","Lynan","Sreythou","Jenny","Sokmeng","Wann")
#(b)
ln<-c("Hann","Sang","Am","Chea","Ley","Thon","Khean","Sun","Pech","Thep")
#(c)
age<-c(20,20,21,22,21,20,21,21,20,10)
#(d)
occu<-c("Student","Student","Student","Student","Student","Student","Student","Student","Student","Student")
#(e)
pl<-c("sr","sr","pp","sr","kpc","btc","btc","btb","kps","pp")
#(f)
rand_n<-sample(1:10,10,replace = TRUE)
tabledata<-data.frame(FirstName=fn,LastName=ln,Age=age,Occupation=occu,Place=pl,RandomNumber=rand_n)
tabledata
lastColumn<-tabledata$RandomNumber
#(h)
sum(lastColumn)
mean(lastColumn)
length(lastColumn)
```
#3. Create a .txt file (Minimum : 150 words) with the latest news (In English) in cambodia from
the official news agency's website(Note: Include the reference link) and do the following
(20 Marks)
a. Read the .txt file
b. Perform the Tokenization &amp; count the words
c. Identify the most repeated word and replace that word with "KIT"
d. Perform the Sentiment analysis
e. Plot the graph between "words count" and "words" using geom_col()
e.1. X-axis title ="Number of words", Size=10, Bold, Text in Blue color,
Center, space between graph and title = 20.
e.2. Y-axis title ="List of words", Size=10, Bold, Text in Red color,
Center, space between graph and title = 20.
e.3. Graph title ="Text Mining using R",Size = 25, Bold, Center, Text in
Yellow color, space between graph and title = 25.
```{r}
library(tokenizers)
#a. Read the .txt file
# text is from https://www.khmertimeskh.com/50807376/one-year-on-from-the-first-covid-19-case-in-cambodia/
data <- read_file("Khmertime.txt")
data
#b. Perform the Tokenization count the words
words_data <- paste(data)
tokens <- tokenize_words(words_data)
count <- count_words(words_data)
count
#c. Identify the most repeated word and replace that word with "KIT"
#Identify the most repeated word
most_words <- names(table(tokens))[as.vector(table(tokens))==max(table(tokens))]
most_words_count <- max(table(tokens))
print("The Most repeated word are: ")
most_words
print("Repeated for:  ")
most_words_count
#replace that word with "KIT"
subs <- gsub(most_words, "KIT", tokens)
subs
```
#4. Find the assigned Dataset from the list below and perform the following (20 Marks)
a. Import and Clean the dataset.
b. Find the x and y variables(axis) from the assigned dataset and give the reason for
selecting the x and y axis.
c. Plot the graph using geom_col() and perform the linear model in statistics.
d. Perform the facet with the available columns(Choose the any two variables from the
                                                columns)
e. Use the theme layer to do the following (Note: Based on dataset, name the x and y axis &amp;
                                            graph)
e.1. x-axis title ="________", Size=10, Bold, Text in Green color, Center, space
between graph and title = 20.
e.2. y-axis title ="________", Size=10, Bold, Text in Yellow color, Center, space
between graph and title = 20.
e.3. Graph title ="_________",Size = 25, Bold, Center, Text in Blue color, space
between graph and title = 25.
```{r}
# a. Import and Clean the dataset.
library("tidyverse")
dataset = read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/bob-ross/elements-by-episode.csv")
dataset
#is.na(dataset)
# the dataset is already clean there is no NA so no need to clean again.
# b. Find the x and y variables(axis) from the assigned dataset and give the reason for

plot <- ggplot(dataset, aes(x=TITLE, y=BEACH)) + 
  xlab("Title") +
  ylab("Beach")
# c. Plot the graph using geom_col() and perform the linear model in statistics.
# using geom_col
plot <- plot+geom_col()
#perform linear model
plot <- plot+geom_smooth(method="lm")
plot
# d. Perform the facet with the available columns(Choose the any two variables from the columns)
# use facet with 2 variable by the year budget and domgross
plot+facet_grid(domgross~year)
# use facet with 1 variable by the year of budget
plot <- plot+facet_wrap(~year)
plot
# e. Use the theme layer to do the following (Note: Based on dataset, name the x and y axis graph)
#e.1. x-axis title ="________", Size=10, Bold, Text in Green color, Center, space between graph and title = 20.
#e.2. y-axis title ="________", Size=10, Bold, Text in Yellow color, Center, space between graph and title = 20.
#e.3. Graph title ="_________",Size = 25, Bold, Center, Text in Blue color, space between graph and title = 25.
plot <- plot +
  ggtitle("Episodes") + theme(
    axis.title.x=element_text(size=10, color="green", face="bold", margin=margin(t=20,r=20,b=0,l=0)),
    axis.title.y=element_text(size=10, color="yellow", face="bold", margin=margin(t=0,r=20,b=0,l=20)),
    plot.title=element_text(size=25, color="blue", face="bold", margin=margin(t=25,r=0,b=25,l=0))
  )
plot

# Save graph as png file
ggsave("dataset_plot.png")
