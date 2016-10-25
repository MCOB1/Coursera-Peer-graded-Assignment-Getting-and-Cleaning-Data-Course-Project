#--------------------------------------------------------------
# R script for Coursera, Getting and Cleaning Data, Final Project
#--------------------------------------------------------------

# Prepare your Workspace
rm(list=ls())

# Import Data Files
file.create("C:/Users/Mike/Documents/Coursera/03 Getting and Cleaning Data/FinalProject/Samsung.zip")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "Samsung.zip")
unzip("Samsung.zip")
file.remove("Samsung.zip")

# Read the training, testing, feature, and activity labels files into the workspace

# Read trainings files:
x_train <- read.table("C:/Users/Mike/Documents/Coursera/03 Getting and Cleaning Data/FinalProject/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("C:/Users/Mike/Documents/Coursera/03 Getting and Cleaning Data/FinalProject/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("C:/Users/Mike/Documents/Coursera/03 Getting and Cleaning Data/FinalProject/UCI HAR Dataset/train//subject_train.txt")

# Read testing files:
x_test <- read.table("C:/Users/Mike/Documents/Coursera/03 Getting and Cleaning Data/FinalProject/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("C:/Users/Mike/Documents/Coursera/03 Getting and Cleaning Data/FinalProject/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("C:/Users/Mike/Documents/Coursera/03 Getting and Cleaning Data/FinalProject/UCI HAR Dataset/test/subject_test.txt")

# Read feature file:
features <- read.table('C:/Users/Mike/Documents/Coursera/03 Getting and Cleaning Data/FinalProject/UCI HAR Dataset/features.txt')

# Read activity labels file:
activityLabels = read.table('C:/Users/Mike/Documents/Coursera/03 Getting and Cleaning Data/FinalProject/UCI HAR Dataset/activity_labels.txt')

# Apply column names:
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
      
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
      
colnames(activityLabels) <- c('activityId','activityType')

# Merge train data, then Merge test data, then Merge both into a Combined data set:
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
Combined <- rbind(merge_train, merge_test)

# Collect the all the column names of Combined into a new object called colnames
colNames <- colnames(Combined)

# Create a logical vector called ActSubMeanStd that identifies all columns named either "activityId" or "subjectID" or 
# includes the words "mean" or "std". Then subset this vector for TRUE observations. 
ActSubMeanStd <- (grepl("activityId" , colNames) | 
                 grepl("subjectId" , colNames) | 
                 grepl("mean.." , colNames) | 
                 grepl("std.." , colNames))

ActSubMeanStd <- Combined[ , ActSubMeanStd == TRUE]

# Merge activityLabels data set with the ActSubMeanStd data set by activityId
ActlabelsSubMeanStd <- merge(ActSubMeanStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

# Create a tidy data set with the mean of each variable, for each activity-subject pair:
TidyDataSet <- aggregate(. ~subjectId + activityId, ActlabelsSubMeanStd, mean)
TidyDataSet <- TidyDataSet[order(TidyDataSet$subjectId, TidyDataSet$activityId),]

write.table(TidyDataSet, "TidyDataSet.txt", row.name=FALSE)


