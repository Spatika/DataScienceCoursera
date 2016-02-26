best <- function(state, outcome) {
    ## Read outcome data
    outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    if(outcome == "heart attack")
        suffix <- "Heart.Attack"
    
    else if(outcome == "heart failure")
        suffix <- "Heart.Failure"
    else if(outcome == "pneumonia")
        suffix <- "Pneumonia"
    else
        stop("invalid outcome")
    
    ##Check if state is valid
    if(!(any(outcomeData["State"] == state)))
        stop("invalid state")
        
    colName <- paste("Hospital.30.Day.Death..Mortality..Rates.from.", suffix, sep="")
    
    u <- (outcomeData[, colName] != "Not Available") ## && o)
    
    outcomeData <- outcomeData[u,]
    
    u <- outcomeData[, "State"] == state
    
    outcomeData <- outcomeData[u,]
    
    u <- (newData[, "VAL"] == 24)
    
    ##outcome[, 11] <- as.numeric(outcome[, 11])
    
    ## Return hospital name in that state with lowest 30-day death rate
    
}