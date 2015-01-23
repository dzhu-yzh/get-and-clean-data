# Human Activity Recognition Using Smartphones Dataset Tidy Dataset Code Book
This is the code book for project assignment of getting and cleaning data. A [full description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ) and the data can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ).  
The data used here is downloaded at 1/21/2015.  

## Description of the tidy set
The "tidy.txt" file contains a tidy set obtained by 

1. Merging the training and test set of the original data   
2. Extracting only the measurements on the mean and standard deviation for each measurement  
3. Calculating the average of each variable for each subject and activity

The brief description of data can be found below. For detailed information please refer to "feature_info.txt" file in the original dataset

- activity

  Type of the activity for the row  

- subject

  ID of the subject for the row  

- the rest of the variables contains the average per activity per subject of the mean and std values for the following signals. These values are normalized between [-1,1]. For details of the signals please refer to "feature_info.txt" in the original data  

1. tBodyAcc-XYZ  
2. tGravityAcc-XYZ  
3. tBodyAccJerk-XYZ  
4. tBodyGyro-XYZ  
5. tBodyGyroJerk-XYZ  
6. tBodyAccMag  
7. tGravityAccMag  
8. tBodyAccJerkMag  
9. tBodyGyroMag  
10. tBodyGyroJerkMag  
11. fBodyAcc-XYZ  
12. fBodyAccJerk-XYZ  
13. fBodyGyro-XYZ  
14. fBodyAccMag  
15. fBodyAccJerkMag  
16. fBodyGyroMag  
17. fBodyGyroJerkMag

