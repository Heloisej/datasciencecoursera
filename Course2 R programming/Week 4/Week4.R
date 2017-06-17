##Week 4

# The str Function --------------------------------------------------------
str(str)
str(lm)
str(ls)

x <- rnorm(100,2,4)
summary(x)
str(x)

f <- gl(40,10)
str(f)
summary(f)

library(datasets)
head(airquality)
str(airquality)

m <- matrix(rnorm(100),10,10)
str(m)
m[,1]

s <- split(airquality,airquality$Month)
str(s)


# Simulation : Generating Random Numbers--------------------------------------------------------------
# d r p q
x <- rnorm(10)
x
x <- rnorm(10,20,2)
x
summary(x)

set.seed(1)
rnorm(5)
rnorm(5)
set.seed(1)
rnorm(5)

rpois(10,1)
rpois(10,2)
rpois(10,20)

ppois(2,2) #Pr(x <= 2)
ppois(4,2)
ppois(6,2)


# Simulation-Simulating a Linear Model ------------------------------------
set.seed(20)
x <- rnorm(100)
e <- rnorm(100,0,2)
y <- 0.5+2*x+e
summary(y)
plot(x,y)

set.seed(10)
x <- rbinom(100,1,0.5)
e <- rnorm(100,0,2)
y <- 0.5+x*2+e
plot(x,y)

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5+0.3*x
y <- rpois(100,exp(log.mu))
summary(y)
plot(x,y)


# random Sampling ---------------------------------------------------------
set.seed(1)
sample(1:10,4)
sample(1:10,4)
sample(letters,5)
sample(1:10)  ##permutation
sample(1:10)
sample(1:10,replace = TRUE)


# R profiler1 --------------------------------------------------------------
#using system.time()
system.time(readLines("http://www.jhsph.edu"))
hilbert <- function(n){
  i <- 1:n
  1/outer(i-1,i,"+")
}
x <- hilbert(1000)
system.time(svd(x))
system.time({
  n <- 1000
  r <- numeric(n)
  for(i in 1:n){
    x <- rnorm(n)
    r[i] <- mean(x)
  }
})


# R Profiler2 -------------------------------------------------------------
##lm(y~x)
sample.interval=10000
