rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    
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
  
    retVal <- order(as.numeric(outcomeData[[colName]]), outcomeData[["Hospital.Name"]], decreasing=FALSE, na.last =NA)
    
    sortedData <- outcomeData[retVal, ]
    
    if(num == "best") 
        num <- 1
    else if(num == "worst")
        num <- nrow(sortedData)
    

    sortedData[num, "Hospital.Name"]
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
}