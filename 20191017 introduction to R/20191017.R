## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)


## ---- echo = TRUE, eval = FALSE------------------------------------------
## setwd("C:/New project")


## ---- echo = TRUE--------------------------------------------------------
1 + 2 # Sum. Note: everything after # is a comment
5 * 4 # Product
7 / 4 # Division
3 ^ 2 # Power


## ---- echo = TRUE--------------------------------------------------------
a <- 1.6


## ---- echo = TRUE--------------------------------------------------------
a


## ---- echo = TRUE--------------------------------------------------------
a + 3
b <- a * 2
b
b <- 5 # You can overwrite b
b
b <- b + 1 # You can overwrite b using b itself
b


## ---- echo = TRUE--------------------------------------------------------
c(1, 2.5, 4.5)


## ---- echo = TRUE, eval = FALSE------------------------------------------
## help(c)
## ?c


## ---- echo = TRUE--------------------------------------------------------
dbl_var <- c(1, 2.5, 4.5) # double
class(dbl_var)
int_var <- c(1L, 6L, 10L) # integer
class(int_var)
log_var <- c(TRUE, FALSE, T, F) # logical (T/TRUE equivalent)
class(log_var)
chr_var <- c("these are", "some strings") # character
class(chr_var)


## ---- echo = TRUE--------------------------------------------------------
x <- factor(c("a", "b", "a"))
x
class(x)
levels(x)
table(x) # absolute frequencies
table(x) / length(x) # relative frequencies


## ---- echo = TRUE--------------------------------------------------------
c(6.4, 4.3, 7, 3) # as seen before
1:10 # Sequence of numbers increasing by one
seq(from = 1, to = 10, by = 3)
seq(from = 2, to = 10, length = 5)
rep(3, length = 5)


## ---- echo = TRUE--------------------------------------------------------
M <- matrix(data = c(11, 12, 13, 14, 15, 16), 
            nrow = 2, ncol = 3, byrow = FALSE)
class(M)
matrix(data = c(11, 12, 13, 14, 15, 16), 
       nrow = 2, ncol = 3, byrow = TRUE)


## ---- echo = TRUE--------------------------------------------------------
rbind(c(11, 13, 15), c(12, 14, 16))    # bind vecs as rows
cbind(c(11, 12), c(13, 14), c(15, 16)) # bind vecs as cols


## ---- echo = TRUE--------------------------------------------------------
l <- list(num = 1:10, cha = c("a", "b", "c"), 
          fac = factor(c("c1", "c2")))
class(l)
l


## ---- echo = TRUE, eval = FALSE------------------------------------------
## df <- data.frame(nome = c("Gennaro Esposito"),
##                  eta = c(24, 21, 32),
##                  sesso = factor(c("M", "F"))) # Does not work!


## ---- echo = TRUE--------------------------------------------------------
df <- data.frame(name = c("Gennaro Esposito", "Maria Rossi"), 
                 age = c(24, 21), 
                 sex = factor(c("M", "F")))
class(df)
df


## ---- echo = TRUE--------------------------------------------------------
a <- c(5, 23, 9)
a[2] # Indicate the position in the vector
a[c(1, 3)] # Extract multiple elements
a[c(TRUE, TRUE, FALSE)] # Extract only TRUE
a[c(1, 1, 1, 3, 3, 3)] # Extract elements multiple times
a[] # Take all
b <- 2
a[b] # You can of course use variables as indexes


## ---- echo = TRUE--------------------------------------------------------
a[- 2] # take everything except second
a[- c(1, 2)] # take everything except first and second


## ---- echo = TRUE--------------------------------------------------------
M <- rbind(c(11, 13, 15), c(12, 14, 16))
M
M[2, 3] # indicate row and column
M[1, ] # take entire row as vector
M[, 3] # take entire column as vector
M[1, , drop = FALSE] # take entire row as matrix


## ---- echo = TRUE, eval = FALSE------------------------------------------
## l <- list(num = 1:10, cha = c("a", "b", "c"))
## l[1]       # extract object by position as list
## l[[1]]     # extract object by position as it is
## l["num"]   # extract object by name as list
## l$num      # as above (advantageous in RStudio)
## l[["num"]] # extract object by name as it is


## ---- echo = TRUE, eval = FALSE------------------------------------------
## df <- data.frame(name = c("Gennaro Esposito", "Maria Rossi"),
##                  age = c(24, 21),
##                  sex = factor(c("M", "F")))
## 
## df[2, 3] # indicate row and column
## df[1, ]  # take entire row (remains data frame)
## df[, 3]  # take entire column as vector
## df$sex   # as above (advantageous in RStudio)
## df[, 3, drop = FALSE]  # take entire column as data frame


## ---- echo = TRUE, eval = FALSE------------------------------------------
## df[2]       # extract object by position as data frame
## df[[2]]     # extract object by position as it is
## df["sex"]   # extract object by name as data frame
## df[["sex"]] # extract object by name as it is


## ---- echo = TRUE--------------------------------------------------------
a <- c(3, 2, 1, 4)
a > 2   # TRUE where condition satisfied, FALSE otherwise
a >= 2 & a <=3  # AND condition  
a == 3 | a == 4 # OR condition
which(a >= 2)   # Gives positions where condition satisfied


## ---- echo = TRUE--------------------------------------------------------
a <- c(3, 2, 1, 4)
a[a > 2]
a[a >= 2 & a <=3]
a[a == 3 | a == 4]
a[which(a >= 2)] # It is the same as a[a >= 2]


## ---- echo = TRUE--------------------------------------------------------
a <- c(6.7, NA, 4.2) 
is.na(a) # a == NA does not work
!is.na(a) # ! gives the opposite condition
which(!is.na(a)) # gives where you have values


## ---- echo = TRUE, eval = FALSE------------------------------------------
## a <- c(5.3, 6, 1.5, 9)
## b <- c(2, 5.1, 4, 1)
## a + b
## 2 * a
## a ^ 2 # inverse is a ^ 0.5 or sqrt(a)
## exp(a) # inverse is log(a)
## sin(a) # analogously use cos tan etc.


## ---- echo = TRUE, eval = FALSE------------------------------------------
## length(a)
## a[length(a)] # gives the last element
## sum(a) # sum all elements
## mean(a) # mean:  equivalent to sum(a) / length(a)
## sd(a) # Standard deviation (obtained dividing by (N-1))
## sum(a ^ 2) # sum of squares
## min(a) # max(a)
## which.min(a) # which.max(a)
## crossprod(a, b) # inner product between two vectors
## crossprod(a, a) # equivalent to sum of squares


## ---- echo = TRUE, eval = FALSE------------------------------------------
## a <- c(T, F, F, T, T, T, F, T)
## sum(a) # total number of trues
## sum(!a) # total number of falses
## mean(a) # proportion of trues
## mean(!a) # proportion of falses


## ---- echo = TRUE, eval = FALSE------------------------------------------
## M <- rbind(c(11, 13, 15), c(12, 14, 16), c(5, 7, 2))
## N <- rbind(c(14, 10, 17), c(4, 3, 9), c(12, 24, 8))
## nrow(M) # number of rows
## ncol(M) # number of columns
## dim(M)  # two-dim. vector with n. of rows and cols
## M[nrow(M), ] # last row
## M[, ncol(M)] # last column
## M %*% N # Matrix product (check dimensions!)
## M * N # Product elementwise (check dimensions!)
## det(M) # determinant
## solve(M) # inverse matrix (if possible)


## ---- echo = TRUE, eval = FALSE------------------------------------------
## rowMeans(M) # mean of each row
## apply(M, 1, function(x) mean(x)) # equivalent
## apply(M, 1, mean) # equivalent
## colMeans(M) # mean of each colum
## apply(M, 2, mean) # equivalent
## rowSums(M) # sum of each row
## apply(M, 1, sum) # equivalent
## colSums(M) # sum of each column
## apply(M, 2, sum) # equivalent
## rowSd <- apply(M, 1 sd)


## ---- echo = TRUE, eval = FALSE------------------------------------------
## l <- list(num = 1:10, cha = c("a", "b", "c"),
##           fac = factor(c("c1", "c2")))
## names(l) # list element names: useful in loops or to extract
## length(l) # number of objects in list
## l$new # if you assign something, appends to end of list
## summary(l) # summary statistics, useful with data frames
## str(l)     # returns the structure, useful with data frames


## ---- echo = TRUE, eval = TRUE-------------------------------------------
lapply(l, function(x) length(x)) # returns a list
sapply(l, function(x) length(x)) # returns a vector or matrix, if possible


## ---- echo = TRUE, eval = FALSE------------------------------------------
## print(1); print(2); print(3)
## for (ii in 1:3) print(ii) # the same as above
## for (ii in c(1, 5, 2)) print(ii)
## for (name in c("hi", "hey")) print(name) # not only numbers!


## ---- echo = TRUE, eval = FALSE------------------------------------------
## install.packages("MASS") # install a new package
## library(MASS)            # load package to use its functions/datasets


## ---- echo = TRUE, eval = FALSE------------------------------------------
## library(ISLR)            # Contains Auto data
## data(Auto)               # load the data
## summary(Auto)
## View(Auto)               # View the data.frame in a new sheet
## fix(Auto)                # View the data.frame in a new window


## ---- echo = TRUE--------------------------------------------------------
df <- read.csv("data/Auto.csv")
str(df)
# View(df) # See the data


## ---- echo = TRUE--------------------------------------------------------
plot(df$mpg) # Plots n vector values against 1:n


## ---- echo = TRUE, eval = FALSE------------------------------------------
## plot(df$mpg, type = "l") # Lines instead of points
## plot(df$mpg, col = "red") # Set points/lines colours
## plot(df$mpg, pch = 16) # Change point shape
## plot(df$mpg, size = 3) # Change point/line size
## plot(df$mpg, type = "l", lty = 2) # Change line type
## plot(df$mpg, main = "Title") # Set plot title
## plot(df$mpg, xlab = "x axis") # Set x axis title
## plot(df$mpg, ylab = "y axis") # Set y axis title
## plot(df$mpg, xlim = c(10, 50)) # Set limits of x axis
## plot(df$mpg, ylim = c(0, 60)) # Set limits of y axis


## ---- echo = TRUE, eval = TRUE-------------------------------------------
hist(df$mpg) # histogram of frequencies


## ---- echo = TRUE, eval = FALSE------------------------------------------
## hist(df$mpg, breaks = 40) # set number of bins
## hist(df$mpg, probability = TRUE) # histogram of densities
## lines(density(df$mpg)) # adds kernel density estimate


## ---- echo = TRUE, eval = TRUE-------------------------------------------
boxplot(df$mpg)


## ---- echo = TRUE, eval = TRUE-------------------------------------------
plot(df$mpg, df$displacement)


## ---- echo = TRUE, eval = TRUE-------------------------------------------
plot(factor(df$cylinders), df$displacement)


## ---- echo = TRUE, eval = TRUE-------------------------------------------
pairs(df[, 3:5])


## ---- echo = TRUE, eval = TRUE-------------------------------------------
hist(df$mpg, probability = TRUE)
curve(dnorm(x, mean(df$mpg), sd(df$mpg)), add = TRUE)


## ---- echo = TRUE, eval = FALSE------------------------------------------
## curve(dnorm) # Plots with x between 0 and 1
## curve(dnorm, from = - 1, to = 1) # set x axis limit
## curve(dnorm(x, mean = 0.2, sd = 0.5)) # Set mean and sd
## curve(dnorm, add = TRUE) # works like lines/points

