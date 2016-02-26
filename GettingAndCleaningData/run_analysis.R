##run_analysis.R 

#Read test sest
testSetX <- read.table("X_test.txt")
testSetY <- read.table("Y_test.txt")
testSetY <- rename(testSetY, c("V1"="activitycode"))

#Read train set
trainSetX <- read.table("X_train.txt")
trainSetY <- read.table("y_train.txt")
trainSetY <- rename(trainSetY, c("V1"="activitycode"))


#Combine Xs and ys
dataX <- rbind(testSetX, trainSetX)
dataY <- rbind(testSetY, trainSetY)

#Read in labels for activities
activityLabels <- read.table("activity_labels.txt")

#Match activity codes to activity labels
mergeY <- merge(dataY, activityLabels, by.x="activitycode", by.y="V1", sort=FALSE)


featureLabels <- read.table("features.txt")

#Use the feature labels as the column names for readability
names(dataX) <- featureLabels$V2 

newData <- dataX[,1:561]

length(grep("(mean|std)\\(\\)",names(newData))) #should be 66

#Extract fields only with measuring mean() and std()
dataMeanStd <- newData[, grep("(mean|std)\\(\\)",names(newData))]

#Read subject IDs append them to table of activitycodes and activitylabels
subjectTrain <- read.table("subject_train.txt")
subjectTest <- read.table("subject_test.txt")
subjects <- rbind(subjectTest, subjectTrain)

subjects <- rename(subjects, c("V1"="subjectid"))

mergeY <- cbind(mergeY, subjects)

#the 'activitycodes' aren't required anymore
mergeY <- mergeY[, 2:3]


#SQL setup
options(sqldf.driver = "SQLite") # as per FAQ #7 force SQLite
options(gsubfn.engine = "R") # as per FAQ #5 use R code rather than tcltk

library(RMySQL)
library(sqldf)

#Step 5 - creating the new tidy data set 

#Remove all the special characters in the column names to execute SQL queries smoothly
names(dataMeanStd) <- str_replace_all(names(dataMeanStd),"[[:punct:]]","")

dataMeanStd <- cbind(dataMeanStd, mergeY)

dataMeanStd <- rename(dataMeanStd, c("subjectid"="subjectid", "V2"="activitylabel"))

#Group observations by activity & subject, and calculate average of those groupings, for each of the extracted measurements
sqlResult <- sqldf('select "activitylabel", "subjectid", avg("tBodyAccmeanX") from dataMeanStd group by "activitylabel","subjectid"')
tidyDataSet <- sqlResult

#now do this for each column from 2 to 66 and cbind the third column of the sqlResult to tidyDataSet

for(i in 2:66) {
    columnName <- as.character(names(dataMeanStd)[i]) 
    sqlResult <- sqldf(paste0("select activitylabel, subjectid, avg(", columnName, ") from dataMeanStd group by activitylabel, subjectid"))
    
    
    tidyDataSet[paste0("avg(",columnName,")")] <- sqlResult[,3]
    i <- i+1 
}

write.table(tidyDataSet, file="tidyDataSet.txt", row.names=FALSE)

tidyDataSet
