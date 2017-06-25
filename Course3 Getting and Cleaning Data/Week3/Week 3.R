
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
setwd("F:/Coursera/datasciencecoursera/R")
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile = "./data/restaurants.csv",method = "curl")
restData <- read.csv("./data/restaurants.csv")

head(restData,n=3)
tail(restData,n=3)
summary(restData)
str(restData)

quantile(restData$councilDistrict,na.rm = TRUE)
quantile(restData$councilDistrict,probs = c(0.5,0.75,0.9))

table(restData$zipCode,useNA = "ifany")
#"ifany" add a column that tells you the number of missing values
table(restData$councilDistrict,restData$zipCode)

#check for missing values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode>0)

#Row and column sums
colSums(is.na(restData))
all(colSums(is.na(restData))==0)

#Values with specific characteristics
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21212","21213"),]

#Cross tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq~Gender+Admit,data=DF)
xt
ftable(xt)

#Flat tables
warpbreaks$replicate <- rep(1:9,len=54)
xt=xtabs(breaks~.,data=warpbreaks)
xt

#size of a data set
fakeDate=rnorm(1e5)
object.size(fakeDate)
print(object.size(fakeDate),units = "Mb")


# Creating new variables --------------------------------------------------
#Getting Data
setwd("F:/Coursera/datasciencecoursera/R")
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile = "./data/restaurants.csv",method = "curl")
restData <- read.csv("./data/restaurants.csv")

#Creating sequences
s1 <- seq(1,10,by=2);s1
s2 <- seq(1,10,length=3);s2
x <- c(1,3,8,25,100);seq(along=x)

#Subsetting variables
restData$nearMe = restData$neighborhood %in% c("Roland Park","Homeland")
table(restData$nearMe)

#Creating binary variables
restData$zipWrong=ifelse(restData$zipCode<0,TRUE,FALSE)
table(restData$zipWrong,restData$zipCode<0)

#Creating categorical variables
restData$zipGroups = cut(restData$zipCode,breaks = quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups,restData$zipCode)

#Easier cutting
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode,g=4)
table(restData$zipGroups)

#Creating factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

#Levels of factor variables
yesno <- sample(c("yes","no"),size = 10,replace = TRUE)
yesnofac <- factor(yesno,levels = c("yes","no"))
relevel(yesnofac,ref = "yes")
as.numeric(yesnofac)

#Using the mutate function
library(Hmisc);library(plyr)
restData2 = mutate(restData,zipGroups=cut2(zipCode,g=4))
table(restData2$zipGroups)

#Common transforms
