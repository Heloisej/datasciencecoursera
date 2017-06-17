rankall <- function(outcome, num="best"){
      ##Read outcome data
      outcome_dt <- read.csv("C2W4 Assignment/outcome-of-care-measures.csv", colClasses = "character")
      
      ##Check that state and outcome are valid
      outcomels <- c("heart attack","heart failure","pneumonia")
      
      if (!outcome %in% outcomels){
            stop("invalid outcome")
      }
      else {
            ## For each state, find the hospital of the given rank
            colnm <- paste("Hospital.30.Day.Death..Mortality..Rates.from",chartr(" ",".",str_to_title(outcome)),sep ="." )
            x <- as.numeric(outcome_dt[[colnm]])
            dt <- data.frame(outcome_dt$Hospital.Name,outcome_dt$State,x)
            dt <- na.omit(dt)
            dtls <- split(dt,dt$outcome_dt.State)
            rankhospital <- function(x){
                  x <- x[order(x$outcome_dt.Hospital.Name),]
                  x$rank <- rank(x$x,ties.method = "first")
                  if (num=="best"){
                        data.frame(hospital=x$outcome_dt.Hospital.Name[x$rank==1],state=x$outcome_dt.State[1])
                  }
                  else if (num=="worst"){
                        data.frame(hospital=x$outcome_dt.Hospital.Name[x$rank==nrow(x)],state=x$outcome_dt.State[1])
                  }
                  else if (num >= nrow(x)){
                        data.frame(hospital=NA,state=x$outcome_dt.State[1])
                  }
                  else {
                        data.frame(hospital=x$outcome_dt.Hospital.Name[x$rank==num],state=x$outcome_dt.State[1])
                  }
            }
            rls <- lapply(dtls,rankhospital)
            do.call(rbind,rls)
      }
}

