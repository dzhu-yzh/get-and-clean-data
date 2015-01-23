# get-and-clean-data
Project for getting and cleaning data

This document contains brief explanation of the run_analysis.R script. The purpose of the script process the dataset from [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to get a tidy set of the average value of mean and std values of the singles, for each activity and each subject.

The script works as follows:

1. Read features, activity labels, training/test set variables' values, and the corresponding subject for each training/test set record, i.e. one row in the data. The information is seperately stored in 8 text files in the original data, and each piece of information is read into a seperate R object.  

2. Merge the training set and testing set together by combining the rows. Also merge the subject information for training and testing set in the same way.

3. Subset the feature for mean variables, which is done by subsetting features variable to extract those with string mean in it. These subsetted features are corresponding to columns in the merged dataset from step 2. In this step the features are also renamed by using "." instead of "-" to seperate the words.

4. Do step 3 for std variables.

5. Replace the activity IDs (e.g. 1, 2, 3, etc) with labels (e.g. WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, etc)

6. Combine the activity names, subjects and the merged training/testing variables' values in one object. 

7. Use the combined data from step 6, aggregate by subject and activity with mean method to get the corresponding average values. Here we get the tidy set we want.

