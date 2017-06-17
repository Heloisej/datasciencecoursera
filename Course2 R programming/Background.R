getwd()
read.csv("myfile.csv")
dir()
ls()
source("mycode.R")

#Week1: Data Types
x <- factor(c("yes","yes","no","yes","no"))
x
table(x)
unclass(x)
x <- factor(c("yes","yes","no","yes","no"),levels = c("yes","no")) #ordered factor：the baseline level

x <- c(1,2,NA,10,3)
is.na(x)
is.nan(x)
x <- c(1,2,NaN,NA,4)
is.na(x)
is.nan(x)

x <- data.frame(foo=1:4,bar=c(T,T,F,F))
x
nrow(x)
ncol(x)

m <- matrix(1:4,2,2)
dimnames(m) <- list(c("a","b"),c("c","d"))
m


# Week1: Read/Write Datas -------------------------------------------------
#read large tables with read.table
#set comment.char="" if there are no comment lines in your file
#use the colclasses argument!
initial <- read.table("datatable.txt",nrows = 100)
classes <- sapply(initial,class)
taball <- read.table("datatable.txt",colClasses = classes)
#set nrows, mildly overestimate, save memory usage


# Textual Data Formats ----------------------------------------------------
y <- data.frame(a=1, b="a")
dput(y)
dput(y,file = "y.R")
new.y <- dget("y.R")
new.y
#dput: single R object
#dump:multiple objects
x <- "foo"
y <- data.frame(a=1,b="a")
dump(c("x","y"),file = "data.R")
rm(x,y)
source("data.R")
y
x

# Interfaces tot the Outside World ----------------------------------------
str(file)
con <- file("foo.txt","r")
data=read.csv(con)
close(con)

con<- gzfile("words.gz")
x <- readLines(con,10)

con <- url("http://www.jhsph.edu","r")
x <- readLines(con)
head(x)


# Subsetting --------------------------------------------------------------
x <- c("a","b","c","c","d","a")
x[1]
x[2]
x[1:4]
x[x>"a"]
u <- x>"a"
u
x[u]

x <- list(foo=1:4,bar=0.6)
x[1]
x[[1]]
x$bar
x[["bar"]]
x["bar"] #[]gives a list

x <- list(foo=1:4, bar=0.6,baz="hello")
x[c(1,3)]

#[[]] can be used with computed indices
name <- "foo"
x[[name]]
x$name
x$foo

# The [[]] can take an integer sequence
x <- list(a=list(10,12,14),b=c(3.14,2.81))
x[[c(1,3)]] #第一个object的第三个元素
x[[c(2,1)]]

#Subsetting a Matrix
x <- matrix(1:6,2,3)
x[1,2]
x[2,1]
x[1,]
x[,2]
x[1,2,drop=FALSE] #return a matrix still
x[1,,drop=F]

#partial matching
x <- list(aardvark=1:5)
x$a
x[["a"]]
x[["a",exact=FALSE]]

#removing NA Values
x <- c(1,2,NA,4,NA,5)
bad <- is.na(x)
x[!bad]

x <- c(1,2,NA,4,NA,5)
y <- c("a","b",NA,"d",NA,"f")
good <- complete.cases(x,y)
good
x[good]
y[good]

airquality[1:6,]
good <- complete.cases(airquality)
airquality[good,][1:6,]

#Vectorized Operations
x <- 1:4; y <- 6:9
x+y
x >2
x >= 2
y==8
x*y
x/y
x %*% y ## true matrix multiplication
