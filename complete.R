complete <- function(directory, id = 1:332) {
    
    #first column is just idsdf 
  
    nobs <- c()
    
    
    for(x in id) {
        
        #Return data frame of the form
        #id nobs
        #1  117
        #2  1041
        
        
        if(x < 10)
            filename <- paste(directory,"/00", x, ".csv", sep="")
        
        else if(x <= 99)
            filename <- paste(directory,"/0", x, ".csv", sep="")
        
        else
            filename <- paste(directory,"/", x, ".csv", sep="")
        
        
        cur_file <- read.csv(filename)
        
        #count complete observations, append to col2
        
        cur_nobs <- sum(complete.cases(cur_file))
        nobs <- append(nobs, cur_nobs)
        
        x <- x+1
    }
    
    df <- data.frame(id, nobs)
    df
}