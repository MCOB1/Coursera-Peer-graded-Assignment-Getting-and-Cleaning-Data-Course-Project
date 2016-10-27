#----------------------------------------------------------------
# R script for Coursera, Getting and Cleaning Data, Final Project
#----------------------------------------------------------------

# Coursera Project Instructions:
#
# You should create one R script called run_analysis.R that does the following.

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Setup -----------------------------------------------------------------

# Clean up workspace and set working directory to location of the UCI HAR Dataset
rm(list=ls())
setwd("~/.Coursera/03 Getting and Cleaning Data/FinalProject/UCI HAR Dataset/")

# 1. -----------------------------------------------------------------
# Merges the training and the test sets to create one data set.

# Read FEATURES and ACTIVITY LABELS files
features <- read.table('./features.txt')
activityType <- read.table('./activity_labels.txt')

# Assign column names to activityType
colnames(activityType) <- c('activityId','activityType')

#.................................................................

# Read TRAIN files
subjectTrain <- read.table('./train/subject_train.txt')
xTrain <- read.table('./train/x_train.txt')
yTrain <- read.table('./train/y_train.txt')

# Assign column names to TRAIN data.frames
colnames(subjectTrain) <- "subjectId"
colnames(xTrain) <- features[,2] 
colnames(yTrain) <- "activityId"

# Merge TRAIN data.frames
TRAIN <- cbind(yTrain,subjectTrain,xTrain)

#.................................................................

# Read TEST files
subjectTest <- read.table('./test/subject_test.txt')
xTest <- read.table('./test/x_test.txt')
yTest <- read.table('./test/y_test.txt')

# Assign column names to TEST data.frames
colnames(subjectTest) <- "subjectId"
colnames(xTest) <- features[,2] 
colnames(yTest) <- "activityId"

# Merge TEST data.frames
TEST <- cbind(yTest,subjectTest,xTest)

#.................................................................

# Combine TRAIN and TEST into the FINAL data.frame
FINAL <- rbind(TRAIN,TEST)

# 2. -----------------------------------------------------------------
# Extracts only the measurements on the mean and standard deviation for each measurement.

# Create vector CN to hold all colnames of FINAL
CN  <- colnames(FINAL)

# Create logical vector LV that returns TRUE for all column names containing any of these terms:
# 'activity', 'subject', 'Mean', 'mean', or 'std', and returns FALSE if any of these terms is absent
LV <- (grepl("activity.",CN) |
       grepl("subject.",CN) |
       grepl(".[Mm]ean.",CN) |
       grepl(".std.",CN))
                      
# Subset FINAL data.frame using LV to keep only the TRUE columns
FINAL <- FINAL[LV == TRUE]

# 3. -----------------------------------------------------------------
# Uses descriptive activity names to name the activities in the data set.

# Merge the activityType data.frame (which holds descriptive activity names) with FINAL by the variable 'activityId'
FINAL <- merge(FINAL, activityType, by = 'activityId', all.x = TRUE)

# Update CN vector to include the new column called 'activityType' created in the above merge
CN  <- colnames(FINAL)

# 4. -----------------------------------------------------------------
# Appropriately labels the data set with descriptive variable names. 

# Cleaning up the variable names
for (i in 1:length(CN)) 
{
    CN[i] <- gsub("\\()","",CN[i])
    CN[i] <- gsub(".std","_StdDev",CN[i])
    CN[i] <- gsub("-[M,m]ean","_Mean",CN[i])
    CN[i] <- gsub("^(t)","time",CN[i])
    CN[i] <- gsub("tB","timeB",CN[i])
    CN[i] <- gsub("^(f)","freq",CN[i])
    CN[i] <- gsub("AccMean","Acc_Mean",CN[i])
    CN[i] <- gsub("JerkMean","Jerk_Mean",CN[i])
    CN[i] <- gsub("gravityMean","Gravity_Mean",CN[i])
    CN[i] <- gsub("GyroMean","Gyro_Mean",CN[i])
    CN[i] <- gsub("Mag","Magnitude",CN[i])
}
CN

# Reassign the new descriptive column names to FINAL
colnames(FINAL) <- CN
names(FINAL)

# 5. -----------------------------------------------------------------
# From the data set in step 4, creates a second, independent tidy data set with the
# average of each variable for each activity and each subject.

# Move "activityType" column (89) up to the first column position
FINAL <- FINAL[,c(89, 1:88)]

# Load dplyr, then group by the first 3 columns of identifiers,
# then calculate mean for each variable
library(dplyr)
TidyDataSet <- FINAL %>%
    group_by(activityId, activityType, subjectId) %>%
    summarise_each(funs(mean))

# Export TidyDataSet
write.table(TidyDataSet, './TidyDataSet.txt',sep='\t', row.names = FALSE)
View(TidyDataSet)




