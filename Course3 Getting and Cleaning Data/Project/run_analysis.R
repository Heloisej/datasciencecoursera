setwd("F:/Coursera/datasciencecoursera/R/")
library(dplyr)

# 1. Merges the training and the test sets to create one data set. --------

#Step1 : download the zip file
if(!file.exists("./data")){dir.create("./data")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile = "./data/project.zip")

#Step2: unzip the downloaded file
unzip("./data/project.zip",exdir = "./data")

#Step3: Load data into R
test.x <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
test.subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

train.x <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
train.y <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
train.subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#Step4: Merge data
testD <- cbind(test.x,test.y,test.subject)
trainD <- cbind(train.x,train.y,train.subject)
fullD <- rbind(testD,trainD)


# 2 -----------------------------------------------------------------------
#Extracts only the measurements on the mean and standard deviation for each measurement.

#Step1: Load data
featureName <- read.table("./data/UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)[,2]

#Step2:  extract mean()|std() of each measurements
Index <- grep("mean\\(\\)|std\\(\\)",featureName)
fullD <- fullD[,c(Index,562:563)]
names(fullD)[1:(ncol(fullD))]<-c(featureName[Index],"activity","subject")


# 3 -----------------------------------------------------------------------
#Uses descriptive activity names to name the activities in the data set
#Step1: load activity data
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE)

#Step2: replace 1 to 6 with activity names
fullD$activity <- factor(fullD$activity, levels = activities[,1],labels = activities[,2])
fullD$activity <- as.character(fullD$activity)


# 4 -----------------------------------------------------------------------
#Appropriately labels the data set with descriptive variable names.
names <- names(fullD)
pattern <- c("\\()","^t","^f","-mean","-std")
replacement <- c("","Time","Frequency","Mean","Std")
for( i in 1:5){
      names <- gsub(pattern[i],replacement[i],names)
}
names(fullD) <- names


# 5 -----------------------------------------------------------------------
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

fullD %>%
      group_by(activity,subject) %>%
      summarise_all(funs(mean)) ->finalD

write.table(finalD,"./data/project_result.txt",row.names = FALSE)
