
# 1. Editing text variables -----------------------------------------------
if(!file.exists("./data")){dir.create("./data")}
fileurl <- "http://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileurl,destfile = "./data/cameras.csv")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)

#tolower(),toupper()
tolower(names(cameraData))

#strsplit()
splitNames = strsplit(names(cameraData),"\\.")
splitNames[[5]]
splitNames[[6]]

#Quick aside - lists
mylist <- list(letters=c("A","b","c"),numbers=1:3,matrix(1:25, ncol = 5))
head(mylist)
mylist[1]
mylist$letters
mylist[[1]]

#Fixing character vectors - sapply()
splitNames[[6]][1]
firstElement <- function(x){x[1]}
sapply(splitNames,firstElement)

#Peer review data
fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile = "./data/reviews.csv",method="curl")
download.file(fileUrl2,destfile = "./data/solutions.csv",method="curl")
reviews <- read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)

#sub() &gsub()
names(reviews)
sub("_","",names(reviews)) #find "_", replace it with nothing
testName <- "this_is_a_test"
sub("_","",testName) #can only replace the first "_"
gsub("_","",testName) #replace all the "_"s

#grep(),grepl()
grep("Alameda",cameraData$intersection)
table(grepl("Alameda",cameraData$intersection))
cameraData2 <- cameraData[!grepl("Alameda",cameraData$intersection),]

grep("Alameda",cameraData$intersection,value = TRUE) #return the values where Alameda appears
grep("JeffStreet",cameraData$intersection)
length(grep("JeffStreet",cameraData$intersection))

#More useful string functions
library(stringr)
nchar("Jeffrey Leek")
substr("Jeffrey Leek",1,7)
paste("Jeffrey","Leek")
paste0("Jeffrey","Leek")
str_trim("Jeff       ")

# 2. Regular Expressions 1-----------------------------------------------------
#Metacharacters
#^i think 
#match all the lines that begin with i think

#$ represents the end of a line

#[]
#list a set of characters we will accept at a given point in the match
#[Bb] [Uu] [Ss] [Hh]
# ^[Ii] am
# ^[0-9][a-zA-Z]

#[^?.]$
#^ 表示否定， 任何不以句号或问号结尾的行


# 3.Regular Expressions 2 -------------------------------------------------
#.
#"." is used to reffer to any character
#9.11

# |
#means "or"
# flood|fire|earchquake|hurricane|coldfire

#^[Gg]ood|[Bb]ad
#means begin with G/good or any where in the line is bad

#(and)
#^([Gg]ood|[Bb]ad)

#? the indicated expression is optional
#[Gg]eorge( [Ww]\.)? [Bb]ush
# 可以含或者不含 W./w.
#\ 指将“.”认为是普通字符

# * and +
# means repetition: * means any number, inculding none; +means at least one of the item
#(.*)
#[0-9]+(.*)[0-9]+

#{and}: interval quantifiers, specify the minimum and maximum number of matches of an expression
#[Bb]ush( +[^ ]+ +){1,5} debate
#B/bush 和 debate 之间：(at least one space, following by something that's not a space, followed by at least one space) 重复 1-5次

# {m,n} :at least m but not more than n
# {m} means exactly m matches
# {m,} at least m matches

#() can be used to "remember" text matched
# refer to the matched text with \1,\2,etc
# +([a-zA-z]+) +\1 +
# a space followed by some (at least one) characters, followed by at least one space, followed by the exact same match that we saw within the ()
# night night
# blah blah blah

# * is "greedy" so it always matches the longest possible string that satisfies the regular expression
# ^s(.*)s
#sitting at starbucks

# * can be turned off with the ? ,as in
# ^s(.*?)s$


# 4. Working with dates ---------------------------------------------------
d1 = date()
d1
class(d1)

d2= Sys.Date()
d2
class(d2)

#Formatting dates
# %d = day as number (0-31), %a = abbreviated weekday, %A= unabbreviated weekday, %m = month(00-12), %b = abbreviated month, %B = unabbrevidated month , %y = 2 digit year, % Y = 4 digit year
format(d2,"%a %b %d")

#Creating dates
x= c("1jan1960","2jan1960","31mar1960","30jul1960")
z= as.Date(x,"%d%b%Y")
z
z[1]-z[2]
as.numeric(z[1]-z[2])

weekdays(d2)
months(d2)
julian(d2)

#Lubridate
library(lubridate)
ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013")

#Dealing with times
ymd_hms("2011-08-03 10:15:03")
ymd_hms("2011-08-03 10:15:03", tz="Pacific/Auckland")
?Sys.timezone

#Some functions have slightly different syntax
x = dmy(x= c("1jan1960","2jan1960","31mar1960","30jul1960"))
wday(x[1])
wday(x[1],label = TRUE)


# 5. Data resources -------------------------------------------------------
library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign = getOption('getSymbols.auto.assign',FALSE))
sampleTimes = index(amzn)
sum(year(sampleTimes)==2012)
sum(year(sampleTimes)==2012 & wday(sampleTimes)==2)
