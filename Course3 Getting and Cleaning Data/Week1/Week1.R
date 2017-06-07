
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


