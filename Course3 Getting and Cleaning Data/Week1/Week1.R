
# Downloading Files -------------------------------------------------------
getwd()
setwd("D:/R/")

if(!file.exists("data")){
      dir.create("data")
}

#download.file(url=,destfile = ,method = )
fileurl <- "http://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileurl,destfile = "./data/cameras.csv",method = "curl")
list.files("./data")
dateDownloaded <-date()
dateDownloaded
#https on Mac, set method='curl'


# Reading local flat files ------------------------------------------------
cameraData <- read.table("./data/cameras.csv")
head(cameraData)
cameraData <- read.table("./data/cameras.csv",sep=",",header = TRUE)
head(cameraData)

cameraData <- read.csv("./data/cameras.csv")
head(cameraData)
#if there are quotaion marke `or " then set quote=""


# Reading Excel files -----------------------------------------------------
download.file(fileurl,destfile = "./data/cameras.xlsx",method = 'curl')
dateDownloaded <- date()
library(xlsx)
cameraData <- read.xlsx(file = "./data/cameras.xlsx",sheetIndex = 1,header = TRUE)

colIndex <- 2:3
rowIndex <- 1:4
cameraDataSubset <- read.xlsx(file = "./data/cameras.xlsx",sheetIndex = 1, colIndex = colIndex,rowIndex = rowIndex)
cameraDataSubset
library(XLConnect)


# Reading XML -------------------------------------------------------------
library(XML)
fileurl <- "http://www.w3school.com.cn/example/xmle/simple.xml"
doc <- xmlTreeParse(fileurl,useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[1]]
xmlSApply(rootNode,xmlValue)

#XPath
xpathSApply(rootNode,'//name',xmlValue)
xpathSApply(rootNode,'//price',xmlValue)

fileurl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileurl,useInternal = TRUE)
scores <- xpathSApply(doc,"//li[@class='score']",xmlValue)
teams <- xpathSApply(doc,"//li[@class='team-name']",xmlValue)


# Reading JSON ------------------------------------------------------------
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
jsonData$owner$login
myjson <- toJSON(iris,pretty = TRUE)
cat(myjson)

iris2 <- fromJSON(myjson)
head(iris2)


# Using data.table --------------------------------------------------------
library(data.table)
DF <- data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)

DT <- data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)
tables()
#subsetting rows
DT[2,]
DT[DT$y=='a',]
DT[c(2,3)] #subtract the second and third rows
DT[,c(2,3)] #subtract the second and third columns

k <- {print(10);5}
print(k)

DT[,list(mean(x),sum(z))]
DT[,table(y)]

#add new columns
DT[,w:=z^2]
DT2 <- DT
DT[,y:=2]
head(DT2,3)

#multiple operations
DT[,m:={tmp <- (x+z);log2(tmp+5)}]
DT[,a:=x>0]
DT[,b:=mean(x+w), by=a]

#special variables
#.N An integer, length 1, containging the number
set.seed(123)
DT <- data.table(x=sample(letters[1:3],1E5,TRUE))
DT[,.N,by=x] #各类的数目

#keys
DT <- data.table(x=rep(c('a','b','c'),each=100),y=rnorm(300))
setkey(DT,x)
DT['a']

#joins
DT1 <- data.table(x=c('a','a','b','dt1'),y=1:4)
DT2 <- data.table(x=c('a','b','dt2'),z=5:7)
setkey(DT1,x);setkey(DT2,x)
merge(DT1,DT2)

#fast reading
big_df <- data.frame(x=rnorm(1E6),y=rnorm(1E6))
file <- tempfile()
write.table(big_df,file = file,row.names = FALSE,col.names = TRUE,sep = "\t",quote = FALSE)
system.time(fread(file)) #much faster
system.time(read.table(file,header = TRUE,sep='\t'))
