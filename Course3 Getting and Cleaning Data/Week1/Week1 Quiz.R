library(data.table)
library(xlsx)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",destfile = './data/com.csv')
dt <- read.csv('F:/GitHub/datasciencecoursera/Course3 Getting and Cleaning Data/Week1/data/com.csv', header = TRUE)
table(dt$VAL)
class(dt$FES)


# Q3 ----------------------------------------------------------------------

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",destfile = './data/Q3.xlsx')
rowIndex <- 18:23
colIndex <- 7:15
dat <- read.xlsx("F:/GitHub/datasciencecoursera/Course3 Getting and Cleaning Data/Week1/data/Q3.xlsx",sheetIndex = 1,rowIndex = rowIndex,colIndex = colIndex)
sum(dat$Zip*dat$Ext,na.rm=T)


# Q4 ----------------------------------------------------------------------
library(XML)
fileurl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
myxml <- xmlTreeParse(fileurl,useInternal=TRUE)
rootNode <- xmlRoot(myxml)
rootNode[[1]][[1]]

zip <- xpathSApply(rootNode,'//zipcode',xmlValue)
sum(zip=='21231')


# Q5 ----------------------------------------------------------------------
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",destfile = './data/Q5.csv')
DT <- fread('./data/Q5.csv',sep = ',',header = T)
