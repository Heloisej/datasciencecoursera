library(stringr)
best <- function(state, outcome){
      ##Read outcome data
      outcome_dt <- read.csv("C2W4 Assignment/outcome-of-care-measures.csv", colClasses = "character")
      
      ##Check that state and outcome are valid
      statels <- unique(outcome_dt$State)
      outcomels <- c("heart attack","heart failure","pneumonia")
      
      if (!state %in% statels){
            stop("invalid state")  
      } 
      else if (!outcome %in% outcomels){
            stop("invalid outcome")
      }
      else {
            ##Return hospital name in that state with lowest 30-day death rate
            colnm <- paste("Hospital.30.Day.Death..Mortality..Rates.from",chartr(" ",".",str_to_title(outcome)),sep ="." )
            x <- as.numeric(outcome_dt[[colnm]])
            dt <- data.frame(outcome_dt$Hospital.Name,outcome_dt$State,x)
            part <- na.omit(dt[dt$outcome_dt.State==state,])
            part <- part[order(part$outcome_dt.Hospital.Name),]
            part$outcome_dt.Hospital.Name[which.min(part$x)][1]     
      }
}



