
# Q1 ---------------------------------------------------------------------
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,destfile = "./data/Q1.csv")
Q1 <- read.csv(file="./data/Q1.csv")

agricultureLogical <- with(Q1,ACR==3 & AGS==6)
which(agricultureLogical==TRUE)


# Q2 ----------------------------------------------------------------------
library(jpeg)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(url,destfile = "./data/q2.jpeg",mode = "wb")
x <- readJPEG(source = "./data/q2.jpeg",native=TRUE)
quantile(x,probs = c(0.3,0.8))


# Q3 ----------------------------------------------------------------------
library(plyr)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url,destfile = "./data/q3_GDP.csv")
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url2,destfile = "./data/q3_edu.csv")
q3.GDP <- read.csv(file = "./data/q3_GDP.csv",skip=3,na.strings=c("",".."))
names(q3.GDP)[1] <- "Country"
q3.GDP <- q3.GDP[,c("Country","Ranking","Economy","US.dollars.")]
q3.GDP <- q3.GDP[!is.na(q3.GDP$Ranking),]

q3.edu <- read.csv(file="./data/q3_edu.csv")
#mergedata
q3 <- merge(q3.edu,q3.GDP,by.x="CountryCode",by.y = "Country")
q3$Ranking <- as.numeric(as.character(q3$Ranking))
q3 <- arrange(q3,desc(Ranking))


# Q4 ----------------------------------------------------------------------
#data in q3
with(q3[q3$Income.Group=="High income: OECD",],mean(Ranking))
with(q3[q3$Income.Group=="High income: nonOECD",],mean(Ranking))

# Q5 ----------------------------------------------------------------------
#data in q3
q3$Range <- cut(q3$Ranking,breaks = 5,labels = c("1","2","3","4","5"))

with(q3,table(Income.Group,Range))
