
# Q1 ----------------------------------------------------------------------
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,destfile = "./data/q1.microdata.csv")
q1 <- read.csv("./data/q1.microdata.csv")
strsplit(names(q1),"wgtp")[123]


# Q2 ----------------------------------------------------------------------
library(dplyr)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url,destfile = "./data/q2.gdp.csv")
q2 <- read.csv("./data/q2.gdp.csv",skip=3,na.strings=c("",".."))
names(q2)[1] <- "Country"
q2 <- q2[!is.na(q2$Country) & !is.na(q2$Ranking),c("Country","Ranking","Economy","US.dollars.")]
q2 %>%
      mutate(US.dollars.=gsub(",","",US.dollars.)) %>%
      mutate(US.dollars.=as.numeric(US.dollars.)) %>%
      summarize(mean(US.dollars.))

# q3 ----------------------------------------------------------------------
length(grep("^United",q2$Economy))


# q4 ----------------------------------------------------------------------
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url,destfile = "./data/edu.csv")
edu <- read.csv("./data/edu.csv")
mergedata <- merge(q2,edu,by.x = "Country",by.y = "CountryCode")

grep("[Ff]iscal year end",mergedata$Special.Notes)
sub <- mergedata[grep("[Ff]iscal year end",mergedata$Special.Notes),]
sum(grepl("June",sub$Special.Notes))

# Q5 ----------------------------------------------------------------------
library(quantmod)
amzn = getS

