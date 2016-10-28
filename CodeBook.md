---
title: "CodeBook for TidyDataSet"
author: "Michael O'Brien"
date: "October 27, 2016"
output: html_document
---
## Coursera Getting and Cleaning Data Course Project

### Introduction
This project is derived from the Human Activity Recognition Using Smartphones Dataset, available at: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The data comes from experiments that were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured a number of acceleration and velocity measurements.

According to Coursera instructions, this data was recomposed using R into a new summary dataset. The R script that achieves this re-composition is called run_analysis.R. The summary dataset produced by the script is called TidyDataSet.txt. Both files can be found in this repo.

The TidyDataSet file has 86 columns, including 3 columns of identifier data and 82 columns of feature data. It has 1 header row for variable labels and 180 rows that represent every possible subject-activity pair (30*6=180). The values in the file are the means for all data collected for each feature variable for each subject-activity pair. 

### Identifier Variables (columns 1-3)
 [1] "activityId": integers 1-6 that are codes for the 6 activity types                                  
 [2] "activityType": six activities of the subjects are recorded, each corresponding to an activityID, as follows:  
* WALKING (1)  
* WALKING_UPSTAIRS (2)    
* WALKING_DOWNSTAIRS (3)    
* SITTING (4)    
* STANDING (5)   
* LAYING (6)    
 [3] "subjectId": integers 1-30 identifying the persons being experimented upon.  
 
### Feature Variables (columns 4-86)
The source dataset cited above has 561 feature variables. TidyDataSet keeps only those 82 features variables that included some version of 'mean' or 'std' in their labels. TidyDataSet has also modified the feature labels somewhat in order to make them more readable. For instance, the abbreviation t has been expanded 'time'. Also we have cast all versions of 'mean' to be 'Mean', and all versions of 'std' to be 'StdDev'. The original acceleration measurements (Acc) were measured in standard gravity units 'g' and the original velocity measurements (Gyro) were measured in radians/second. However, the producers of the dataset normalized the values of all features and bounded within [-1,1]. Thus, there are no units of measurement in the source dataset or in TidyDataSet.

 [4] "timeBodyAcc_Mean-X"                       
 [5] "timeBodyAcc_Mean-Y"                       
 [6] "timeBodyAcc_Mean-Z"                       
 [7] "timeBodyAcc_StdDev-X"                     
 [8] "timeBodyAcc_StdDev-Y"                     
 [9] "timeBodyAcc_StdDev-Z"                     
[10] "timeGravityAcc_Mean-X"                    
[11] "timeGravityAcc_Mean-Y"                    
[12] "timeGravityAcc_Mean-Z"                    
[13] "timeGravityAcc_StdDev-X"                  
[14] "timeGravityAcc_StdDev-Y"                  
[15] "timeGravityAcc_StdDev-Z"                  
[16] "timeBodyAccJerk_Mean-X"                   
[17] "timeBodyAccJerk_Mean-Y"                   
[18] "timeBodyAccJerk_Mean-Z"                   
[19] "timeBodyAccJerk_StdDev-X"                 
[20] "timeBodyAccJerk_StdDev-Y"                 
[21] "timeBodyAccJerk_StdDev-Z"                 
[22] "timeBodyGyro_Mean-X"                      
[23] "timeBodyGyro_Mean-Y"                      
[24] "timeBodyGyro_Mean-Z"                      
[25] "timeBodyGyro_StdDev-X"                    
[26] "timeBodyGyro_StdDev-Y"                    
[27] "timeBodyGyro_StdDev-Z"                    
[28] "timeBodyGyroJerk_Mean-X"                  
[29] "timeBodyGyroJerk_Mean-Y"                  
[30] "timeBodyGyroJerk_Mean-Z"                  
[31] "timeBodyGyroJerk_StdDev-X"                
[32] "timeBodyGyroJerk_StdDev-Y"                
[33] "timeBodyGyroJerk_StdDev-Z"                
[34] "timeBodyAccMagnitude_Mean"                
[35] "timeBodyAccMagnitude_StdDev"              
[36] "timeGravityAccMagnitude_Mean"             
[37] "timeGravityAccMagnitude_StdDev"           
[38] "timeBodyAccJerkMagnitude_Mean"            
[39] "timeBodyAccJerkMagnitude_StdDev"          
[40] "timeBodyGyroMagnitude_Mean"               
[41] "timeBodyGyroMagnitude_StdDev"             
[42] "timeBodyGyroJerkMagnitude_Mean"           
[43] "timeBodyGyroJerkMagnitude_StdDev"         
[44] "freqBodyAcc_Mean-X"                       
[45] "freqBodyAcc_Mean-Y"                       
[46] "freqBodyAcc_Mean-Z"                       
[47] "freqBodyAcc_StdDev-X"                     
[48] "freqBodyAcc_StdDev-Y"                     
[49] "freqBodyAcc_StdDev-Z"                     
[50] "freqBodyAcc_MeanFreq-X"                   
[51] "freqBodyAcc_MeanFreq-Y"                   
[52] "freqBodyAcc_MeanFreq-Z"                   
[53] "freqBodyAccJerk_Mean-X"                   
[54] "freqBodyAccJerk_Mean-Y"                   
[55] "freqBodyAccJerk_Mean-Z"                   
[56] "freqBodyAccJerk_StdDev-X"                 
[57] "freqBodyAccJerk_StdDev-Y"                 
[58] "freqBodyAccJerk_StdDev-Z"                 
[59] "freqBodyAccJerk_MeanFreq-X"               
[60] "freqBodyAccJerk_MeanFreq-Y"               
[61] "freqBodyAccJerk_MeanFreq-Z"               
[62] "freqBodyGyro_Mean-X"                      
[63] "freqBodyGyro_Mean-Y"                      
[64] "freqBodyGyro_Mean-Z"                      
[65] "freqBodyGyro_StdDev-X"                    
[66] "freqBodyGyro_StdDev-Y"                    
[67] "freqBodyGyro_StdDev-Z"                    
[68] "freqBodyGyro_MeanFreq-X"                  
[69] "freqBodyGyro_MeanFreq-Y"                  
[70] "freqBodyGyro_MeanFreq-Z"                  
[71] "freqBodyAccMagnitude_Mean"                
[72] "freqBodyAccMagnitude_StdDev"              
[73] "freqBodyAccMagnitude_MeanFreq"            
[74] "freqBodyBodyAccJerkMagnitude_Mean"        
[75] "freqBodyBodyAccJerkMagnitude_StdDev"      
[76] "freqBodyBodyAccJerkMagnitude_MeanFreq"    
[77] "freqBodyBodyGyroMagnitude_Mean"           
[78] "freqBodyBodyGyroMagnitude_StdDev"         
[79] "freqBodyBodyGyroMagnitude_MeanFreq"       
[80] "freqBodyBodyGyroJerkMagnitude_Mean"       
[81] "freqBodyBodyGyroJerkMagnitude_StdDev"     
[82] "freqBodyBodyGyroJerkMagnitude_MeanFreq"   
[83] "angle(timeBodyAcc_Mean,gravity)"          
[84] "angle(timeBodyAccJerk_Mean),Gravity_Mean)"
[85] "angle(timeBodyGyro_Mean,Gravity_Mean)"    
[86] "angle(timeBodyGyroJerk_Mean,Gravity_Mean)"
[87] "angle(X,Gravity_Mean)"                    
[88] "angle(Y,Gravity_Mean)"                    
[89] "angle(Z,Gravity_Mean)"  






