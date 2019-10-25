## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ------------------------------------------------------------------------
if (5 > 3) aa <- 1
if (5 < 3) bb <- 1


## ------------------------------------------------------------------------
if (5 > 3) cc <- 2 else cc <- 3
if (5 < 3) dd <- 2 else dd <- 3


## ------------------------------------------------------------------------
if (5 > 3) {
  ee <- "a"
  ff <- "b"
  } else {
    gg <- "c"
    hh <- "d"
  }


## ------------------------------------------------------------------------
vec1 <- c(2, 5, 6, - 8.7)
vec2 <- c(5.9, - 1, 56, 0)
ifelse(vec1 > vec2, 10, - 7) 


## ------------------------------------------------------------------------
for (ii in 1:3) {
  print(ii)
}
vec <- 1:10
for (ii in 1:length(vec)) {
  print(ii)
}


## ------------------------------------------------------------------------
1:length(vec)
seq_along(vec) ## equivalent
for (ii in seq_along(vec)) {
  print(ii)
}


## ------------------------------------------------------------------------
vec <- which(c(1, 3, 4) < 0) # the result is empty vector


## ------------------------------------------------------------------------
# for (ii in 1:seq_along(vec)) {
#   print(ii)
# }


## ------------------------------------------------------------------------
for (ii in seq_along(vec)) { #returns nothing
  print(ii)
} 


## ------------------------------------------------------------------------
ii <- 0
while(ii < 100) {
  print(ii)
  ii <- (ii + 1) ^ 2
}


## ------------------------------------------------------------------------
f <- function(x) {
  return(x + 10) ## return can be omitted, see below
}
f <- function(x) {
  x + 10
}
f <- function(x) x + 10 # if one statement only, you can omit {}


## ------------------------------------------------------------------------
f


## ------------------------------------------------------------------------
f(x = 1.6)
f(1.6)


## ------------------------------------------------------------------------
aa <- f(- 7)
aa


## ------------------------------------------------------------------------
f <- function(x, y) {
  z <- x ^ 2 * y 
  sin(z)
}
f(x = 1, y = 3)
f(1, 3) #equivalent, you must know the first argument is x and the second is y
# f(x = 1) produces error, all arguments must be provided
f(y = 4, x = 9) # if you specify names of input arguments, you can change the order


## ------------------------------------------------------------------------
f <- function(x, y = 2) {
  z <- x ^ 2 * y 
  sin(z)
}
f(1) # here y takes the default value 2
f(1, 3) # you can overwrite the y value of course


## ------------------------------------------------------------------------
yy <- 2
fun <- function(xx) {
  yy <- 1
  xx + yy
}
fun(3)
yy ## yy is not overwritten by the function call


## ------------------------------------------------------------------------
yy <- 3
fun <- function(xx) {
  xx + yy
}
fun(4)


## ------------------------------------------------------------------------
fun <- function(x) sum(x ^ 2)
M <- cbind(c(1, 2, 3), c(4, 5, 6))
M
apply(M, 1, fun)
apply(M, 2, fun)


## ------------------------------------------------------------------------
apply(M, 1, function(x) sum(x ^ 2))


## ------------------------------------------------------------------------
ll <- list(num = 1:10, cha = c("a", "b"))
lapply(ll, function(x) length(x)) ## here it is useless to use anonymous function!
lapply(ll, length)

vv <- c(1, 2, 3)
lapply(vv, function(x) x ^ 2)


## ------------------------------------------------------------------------
ll <- list(num = 1:10, cha = c("a", "b"))
sapply(ll, length)


## ------------------------------------------------------------------------
heart <- read.csv("data/Heart.csv")
head(heart)
str(heart)
summary(heart)


## ------------------------------------------------------------------------
tapply(heart$Age, heart$Sex, mean)
tapply(heart$Age, list(heart$Sex, heart$AHD), mean)


## ------------------------------------------------------------------------
tapply(heart$Age, heart$Sex, length)
table(heart$Sex) # equivalent
tapply(heart$Age, list(heart$Sex, heart$AHD), length)
table(heart$Sex, heart$AHD) # equivalent


## ---- echo = TRUE--------------------------------------------------------
df <- read.csv("data/Auto.csv")
plot(df$mpg) # Plots n vector values against 1:n


## ---- echo = TRUE, eval = FALSE------------------------------------------
## plot(df$mpg, type = "l") # Lines instead of points
## plot(df$mpg, col = "red") # Set points/lines colours
## plot(df$mpg, pch = 16) # Change point shape
## plot(df$mpg, cex = 3) # Change point/line size
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


## ------------------------------------------------------------------------
plot(table(heart$Sex))


## ------------------------------------------------------------------------
plot(table(heart$Sex, heart$ChestPain))


## ---- echo = TRUE, eval = TRUE-------------------------------------------
plot(factor(df$cylinders), df$displacement)


## ---- echo = TRUE, eval = TRUE-------------------------------------------
pairs(df[, 3:5])
pairs(df[, 3:5], col = df$origin)


## ------------------------------------------------------------------------
par(mfrow = c(1, 2))
plot(df$mpg, df$cylinders)
plot(df$mpg, df$displacement)


## ------------------------------------------------------------------------
plot(df$mpg, df$displacement, col = factor(df$origin), pch = 16)
legend("topright", legend = levels(factor(df$origin)), 
       col = levels(factor(df$origin)), pch = 16)


## ------------------------------------------------------------------------
set.seed(1234)
nsim <- 1e2
probs <- c(0, .25, .5, .75, 1)

simbern <- rbinom(nsim, 1, .3)
plot(simbern)
table(simbern)
table(simbern) / length(simbern)
plot(table(simbern) / length(simbern))
dbinom(0:1, 1, .3)
pbinom(0:1, 1, .3)
qbinom(probs, 1, .3)

simbin <- rbinom(nsim, 4, .5)
plot(simbin)
table(simbin) / length(simbin)
plot(table(simbin))
dbinom(0:4, 4, .5)
pbinom(0:4, 4, .5)
qbinom(seq(from = 0, to = 1, length.out = 10), 4, .5)

simnorm <- rnorm(nsim, mean = 2.5, sd = 5)
plot(simnorm)
dnorm(2.5, mean = 2.5, sd = 5)
pnorm(2.5, mean = 2.5, sd = 5)
ss <- seq(from = - 20, to = 20, by = .01)
hist(simnorm, probability = TRUE)
lines(ss, dnorm(ss, 2.5, 5))
summary(simnorm)
qnorm(probs, mean = 2.5, sd = 5)

simexp <- rexp(nsim, rate = 1)
plot(simexp)
dexp(2.5, rate = 1)
pexp(2.5, rate = 1)
hist(simexp, probability = TRUE)
lines(ss, dexp(ss, rate = 1))
summary(simexp)
qexp(probs, rate = 1)

