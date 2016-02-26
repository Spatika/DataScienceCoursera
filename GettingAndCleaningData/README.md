#Data Transformation 
+ After the training and test sets were combined, the columns for subjectids and activitylabels were added.
+ Next, the feature labels for the original 561 attributes were pulled in to the data set.
+ Using grep and regex, only the columns containing the patterns 'mean()' or 'std()' were retained.
+ Remaining columns were renamed to remove any punctuation/special characters, for ease of use. 
+ sqldf() was used to group each of the instances first by activity type, and then by the subject id, before the average was calculated for each field having the same combination of activity type and subject id.

###Note - the wording of the assignment was a bit ambiguous to me, so I assumed that observations were to be grouped first by activity, then by subject, and based on the grouping, average of each variable should be output in the tidied ata set.


