#CodeBook for Samsung Wearables Dataset

##New Tidy Dataset

+  Number of Instances (rows): 35
+  Number of Attributes (columns): 68
    - Column 1: activitylabel (Character vector from original dataset)
    - Column 2: subjectid (Numeric from 1 to 30)
    - Columns 3 to 68 average of each of the 66 mean() and std() variables from the original dataset (see below), first grouped by activitylabel, and further grouped by subjectid
    
##Original Dataset

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

##Units
+ Features are normalized and bounded within [-1,1].

##License
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
