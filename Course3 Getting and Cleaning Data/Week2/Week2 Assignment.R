
# Q1 ----------------------------------------------------------------------
library(httr)
library(httpuv)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github", 
                   key = "dad10a356f494efd543f",
                   secret = "f92ce06711a7ab6ce7ef2dda5d793f8b30fa02bd")

# get oauth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
# use api
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
# convert unstructured json to structured json
library(jsonlite)
jsondata <- fromJSON(toJSON(content(req)))
# find out the created time of datasharing repo
subset(jsondata, name == "datasharing", select = c(created_at))


# Q2 ----------------------------------------------------------------------
# The sqldf package allows for execution of SQL commands on R data frames. We will use the sqldf package to practice the queries we might send with the dbSendQuery command in RMySQL.
library(sqldf)
acs <- read.csv(file="F:/Coursera/datasciencecoursera/Course3 Getting and Cleaning Data/Week2/acs.csv")

# Q4 ----------------------------------------------------------------------
url <- url("http://biostat.jhsph.edu/~jleek/contact.html")
q4 <- readLines(url,n=100)
nchar(q4[10])
nchar(q4[20])
nchar(q4[30])
nchar(q4[100])


# Q5 ----------------------------------------------------------------------
q5 <- read.fwf(file = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", 
               skip = 4, 
               widths = c(12, 7,4, 9,4, 9,4, 9,4))
sum(q5[,4])
