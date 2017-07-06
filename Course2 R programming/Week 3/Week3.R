
# lapply ------------------------------------------------------------------
x <- list(a = 1:5, b=rnorm(10))
lapply(x,mean)

x <- list(a=1:4,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))
lapply(x,mean)

x <- 1:4
lapply(x,runif)
lapply(x,runif,min=0,max=10)

x <- list(a=matrix(1:4,2,2),b=matrix(1:6,3,2))
lapply(x,function(elt) elt[,1])


# sapply ------------------------------------------------------------------
x <- list(a=1:4,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))
sapply(x,mean)


# apply -------------------------------------------------------------------
str(apply)
x <- matrix(rnorm(200),20,10)
#margin:1行、2列
apply(x,2,mean)
apply(x,1,sum)

apply(x,1,quantile,probs=c(0.25,0.75))

a <- array(rnorm(2*2*10),c(2,2,10))
apply(a,c(1,2),mean)
rowMeans(a,dims = 2)


# mapply ------------------------------------------------------------------
#mapply is a multvariate apply of sorts which applies a function in parallel over a set of arguments
str(mapply)
mapply(rep,1:4,4:1)

noise <- function(n,mean,sd){
      rnorm(n,mean,sd)
}
noise(5,1,2)
noise(1:5,1:5,2)
mapply(noise,1:5,1:5,2)


# tapply ------------------------------------------------------------------
str(tapply)

x <- c(rnorm(10),runif(10),rnorm(10,1))
f <- gl(3,10)
f
tapply(x,f,mean,simplify = FALSE)
tapply(x,f,range)


# split -------------------------------------------------------------------
str(split)
split(x,f)
lapply(split(x,f),mean)

library(datasets)
head(airquality)
s <- split(airquality,airquality$Month)
sapply(s,function(x) colMeans(x[,c('Ozone','Solar.R','Wind')]))
sapply(s,function(x) colMeans(x[,c('Ozone','Solar.R','Wind')],na.rm = TRUE))

#Splitting on More than One Level
x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)
f1
f2
interaction(f1,f2)
str(split(x,list(f1,f2)))
str(split(x,list(f1,f2),drop=TRUE))


# Debugging Tools ---------------------------------------------------------
log(-1)
printmessage <- function(x){
      if(x>0)
            print("x is greater tan zero")
      else
            print("x is less than or equal to zero")
      invisible(x)
}
printmessage(1)
printmessage(NA)

printmessage2 <- function(x){
      if(is.na(x))
            print("x is a missing value!")
      else if(x>0)
            print("x is greater tan zero")
      else
            print("x is less than or equal to zero")
      invisible(x)
}
x <- log(-1)
printmessage2(x)


# Basic Toolds ------------------------------------------------------------
mean(x)
traceback()

lm(y~x)
traceback()

debug(lm)
lm(y~x)

options(error = recover)
read.csv("nosuchfile")
