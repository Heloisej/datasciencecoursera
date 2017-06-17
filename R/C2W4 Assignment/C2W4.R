
# Task 1 ------------------------------------------------------------------
outcome <- read.csv("C2W4 Assignment/outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])


# Task 2 ------------------------------------------------------------------
source("C2W4 Assignment/best.R")
best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("BB", "heart attack")
best("NY", "hert attack")
best("SC", "heart attack")
best("NY", "pneumonia")
best("AK", "pneumonia")
# Task 3 ------------------------------------------------------------------
source("C2W4 Assignment/rankhospital.R")
rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)
rankhospital("NC", "heart attack", "worst")
rankhospital("WA", "heart attack", 7)
rankhospital("TX", "pneumonia", 10)
rankhospital("NY", "heart attack", 7)
# Task 4 ------------------------------------------------------------------
source("C2W4 Assignment/rankall.R")
head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)
r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)
r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)
r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)
