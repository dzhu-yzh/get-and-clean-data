#Download "UCI HAR Dataset.zip" and unzip it in the same directory as this script

#read the files
features <- read.table('UCI HAR Dataset/features.txt', 
                       header = FALSE, sep ="", as.is = TRUE)
actLabels <- read.table('UCI HAR Dataset/activity_labels.txt', 
                         header = FALSE, sep = "", as.is = TRUE)
xtrain <- read.table('UCI HAR Dataset/train/X_train.txt', 
                      header = FALSE, sep = "")
ytrain <- read.table('UCI HAR Dataset/train/y_train.txt', 
                      header = FALSE, sep = "")
subjTrain <- read.table('UCI HAR Dataset/train/subject_train.txt', 
                         header = FALSE, sep = "")
xtest <- read.table('UCI HAR Dataset/test/X_test.txt', 
                     header = FALSE, sep = "")
ytest <- read.table('UCI HAR Dataset/test/y_test.txt', 
                     header = FALSE, sep = "")
subjTest <- read.table('UCI HAR Dataset/test/subject_test.txt', 
                        header = FALSE, sep = "")

#merge the dataset, since the training and test data are independent entries, simply bind them together
xmerged <- rbind(xtrain, xtest)
ymerged <- rbind(ytrain, ytest)
subjMerged <- rbind(subjTrain, subjTest)

#subset the features of mean and std, and define proper feature names
meanMatch <- regexpr('mean', features[, 2], perl = TRUE)
meanSubset <- meanMatch > 0
meanFeatureNames <- lapply(features[meanSubset, 2], function(input) {
    temp <- gsub('\\(\\)', x = input, replacement = "", perl = TRUE)
    gsub('\\-', x = temp, replacement = ".", perl = TRUE)
})
xmergedMean <- xmerged[, meanSubset]

stdMatch <- regexpr('std', features[, 2], perl = TRUE)
stdSubset <- stdMatch > 0
stdFeatureNames <- lapply(features[stdSubset, 2], function(input) {
    temp <- gsub('\\(\\)', x = input, replacement = "", perl = TRUE)
    gsub('\\-', x = temp, replacement = ".", perl = TRUE)
})
xmergedStd <- xmerged[, stdSubset]

#process activity names
actNames <- apply(ymerged, 1, function(input){
    actLabels[input, 2]
})

#put everything together to get the combined set
combinedSet <- cbind(actNames, subjMerged, xmergedMean, xmergedStd)
names(combinedSet) <- c('activity', 'subject', meanFeatureNames, stdFeatureNames)

#create the tidy set dataset
tidySet <- aggregate(combinedSet[, names(combinedSet)[-(1:2)]], 
                           by = list(activity = combinedSet$activity, 
                                     subject = combinedSet$subject), 
                           FUN = mean)

#write the tidy set
write.table(tidySet, 'tidy.txt', row.name=FALSE)