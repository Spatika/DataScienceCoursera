corr <- function(directory, threshold = 0) {
    corrz <- c() #return an empty vector in case none meet the threshold
    
    for(x in 1:332) {
        
        rez <- complete(directory, x)
        
        if(rez > threshold) {
            
            
            if(x < 10)
                filename <- paste(directory,"/00", x, ".csv", sep="")
            
            else if(x <= 99)
                filename <- paste(directory,"/0", x, ".csv", sep="")
            
            else
                filename <- paste(directory,"/", x, ".csv", sep="")
            
            
            cur_file <- read.csv(filename)
            
            a <- cur_file$sulfate
            a <- a[!is.na(a)]
            
            b <- cur_file$nitrate
            b <- b[!is.na(b)]
            
            
            cur_cor <- cor(a, b)
            
            corrz <- c(corrz, cur_cor) 
                            
        }
        
    }
    
    corrz
}