
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
