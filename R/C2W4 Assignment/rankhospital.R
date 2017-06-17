rankhospital <- function(state, outcome, num="best"){
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
            ##Return hospital name in that state with the given Rank
            colnm <- paste("Hospital.30.Day.Death..Mortality..Rates.from",chartr(" ",".",str_to_title(outcome)),sep ="." )
            x <- as.numeric(outcome_dt[[colnm]])
            dt <- data.frame(outcome_dt$Hospital.Name,outcome_dt$State,x)
            part <- na.omit(dt[dt$outcome_dt.State==state,])
            part <- part[order(part$outcome_dt.Hospital.Name),]
            part$rank <- rank(part$x,ties.method = "first")
            if (num=="best"){
                  part$outcome_dt.Hospital.Name[part$rank==1]
            }
            else if (num=="worst"){
                  part$outcome_dt.Hospital.Name[part$rank==nrow(part)]
            }
            else if (num >= nrow(part)){
                  NA
            }
            else {
                  part$outcome_dt.Hospital.Name[part$rank==num]
            }
      }
}

