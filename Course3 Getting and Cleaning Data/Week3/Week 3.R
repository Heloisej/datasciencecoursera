
# Subsetting and sorting --------------------------------------------------

set.seed(12345)
x <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
x <- x[sample(1:5),]
x$var2[c(1,3)] <- NA
x

x[,1] #subsetting specific columns
x[,"var1"]
x[1:2,"var2"]

#logicals, ands and ors
x[(x$var1<=3 & x$var3>11),]
x[(x$var1<=3 | x$var3>11),]

#Dealing with missing values
x[which(x$var2>8),]#using which command

#Sorting
sort(x$var1)
sort(x$var1,decreasing=TRUE)
sort(x$var2,na.last = TRUE)

#ordering
x[order(x$var1),]
x[order(x$var1,x$var3),]

#ordering with plyr
library(plyr)
arrange(x,var1)
arrange(x,desc(var1))

#adding rows and columns
x$var4 <- rnorm(5)
Y　<- cbind(x,rnorm(5))
Y


# Summarizing Data --------------------------------------------------------



