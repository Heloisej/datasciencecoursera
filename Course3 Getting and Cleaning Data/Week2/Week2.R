
# 1. Reading from MySQL ---------------------------------------------------
library(RMySQL)
ucscDb <- dbConnect(MySQL(),user='genome',host="genome-mysql.soe.ucsc.edu")
result <- dbGetQuery(ucscDb,'show databases')
dbDisconnect(ucscDb)
result

hg19 <- dbConnect(MySQL(),user='genome',db="hg19",host="genome-mysql.soe.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]

dbListFields(hg19,"affyU133Plus2") #colnames
dbGetQuery(hg19,"select count(*) from affyU133Plus2") #nrow

affyData <- dbReadTable(hg19,"affyU133Plus2")
head(affyData)

#Select a specific subset
query <- dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query)
quantile(affyMis$misMatches)
affyMisSmall <- fetch(query, n=10)
dbClearResult(query)
dim(affyMisSmall)

dbDisconnect(hg19)


# 2. Reading from HDF5 -------------------------------------------------------
source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
created <- h5createFile("example.h5")
created

#Create Groups
created <- h5createGroup("example.h5","foo")
created <- h5createGroup("example.h5","baa")
created <- h5createGroup("example.h5","foo/foobaa")
h5ls("example.h5")

#Write to groups
A= matrix(1:10,nr=5,nc=2)
h5write(A,"example.h5","foo/A")
B=array(seq(0.1,2.0,by=0.1),dim = c(5,2,2))
attr(B,"scale") <- "liter" #units
h5write(B,"example.h5","foo/foobaa/B")
h5ls("example.h5")

#Write a data set
df=data.frame(1L:5L,seq(0,1,length.out = 5),c("ab","cde","fghi","a","s"),stringsAsFactors = FALSE)
h5write(df,"example.h5","df")
h5ls("example.h5")

#Reading data
readA <- h5read("example.h5","foo/A")
readB <- h5read("example.h5","foo/foobaa/B")
readdf <- h5read("example.h5","df")
readA

#Writing and reading chunks
h5write(c(12,13,14),"example.h5","foo/A",index=list(1:3,1))
h5read("example.h5","foo/A")


# 3. Reading from The Web -------------------------------------------------
con <- url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ")
htmlCode <- readLines(con)
htmlCode

library(XML)
url <- "https://scholar.google.com/citations?user=HI-I6C0AAAAJ"
html <- htmlTreeParse(url,useInternalNodes = T)
xpathSApply(html,'//title',xmlValue)
xpathApply(html,"//td[@id='col-citedby']",xmlValue)

library(httr); html2=GET(url)
content2 = content(html2,as="text")
parsedHtml=htmlParse(content2,asText = TRUE)
xpathSApply(parsedHtml,'//title',xmlValue)
xpathApply(parsedHtml,"//td[@id='col-citedby']",xmlValue)

# Reading from the Web ----------------------------------------------------
# Accessing websites with passwords
library(httr)
pg1=GET("http://httpbin.org/basic-auth/user/passwd") #user,pwd required
pg1

pg2=GET("http://httpbin.org/basic-auth/user/passwd",authenticate("user","passwd"))
pg2
names(pg2)

#using handles
google=handle("http://google.com")
pg1=GET(handle = google,path="/")
pg2=GET(handle = google,path="search")


# Reading from API --------------------------------------------------------
myapp=oauth_app("twitter",key="yourConsumerKeyHere",secret = "yourConsumerSecretHere")
sig=sign_oauth1.0(myapp,token = "yourTokenHere",token_secret = "yourTokenSecretHere")
homeTL=GET("https://api.twitter.com/1.1/statuses/home_timeline.json",sig)

json1=content(homeTL)
json2=jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]


# Reading from other sources ----------------------------------------------
#foreign package
#read.arff(Weka);read.dta(stata);read.mtp(Minitab);read.octave(Octave);read.spss(SPSS);read.xport(SAS)

#RPostressSQL
#RODBC
#RMongo

#Reading images
#jpeg;readbitmap;png;EBImage

#Reading GIS data
#rdgal;rgeos;raster

#Reading music data
#tuneR;seewave



