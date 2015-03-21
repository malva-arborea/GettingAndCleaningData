# CodeBook

This is the Code Book for the Coursera Course "Getting and Cleaning Data". It describes variables, data and transformation in order to get the cleaned data set.

## Source of Data

The data sources are as follows:

* Dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

__Quote from UCI Machine Learning Repository__: 
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## Description of Data

The following files are in the original dataset and can be described as follows (taken from the README.txt):

* README.txt: Self explaining
* features_info.txt: Shows information about the variables used on the feature vector.
* features.txt: List of all features.
* activity_labels.txt: Links the class labels with their activity name.
* train/X_train.txt: Training set.
* train/y_train.txt: Training labels.
* test/X_test.txt: Test set.
* test/y_test.txt: Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

* train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* train/Inertial Signals/total_acc_x_train.txt: The acceleration signal from the smartphone accelerometer X axis in standard gravity units g. Every row shows a 128 element vector. The same description applies for the total_acc_x_train.txt and total_acc_z_train.txt files for the Y and Z axis. 
* train/Inertial Signals/body_acc_x_train.txt: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* train/Inertial Signals/body_gyro_x_train.txt: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


## Transformation

Transforming the data takes 5 steps (taken from the Coursera project description):  

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Implementation

### Variables

The following variables are used in this program (ordered alphabetically):

```
 my_activity_labels: contains the data from the file activity_labels.txt:  6 rows / 2 columns
 my_data_mean_by_activity: contains the resulting data set: 180 rows / 81 columns
 my_features: contains the data from the file features.txt: 561 rows / 2 columns
 my_mean_std: contains mean and standard deviation data: 10299 rows / 81 columns
 my_sensor_data: is the concatenated data from both training and test datasets: 10299 rows / 563 columns
 my_subject_test: contains the data from the file subject_test.txt: 2947 rows / 1 column
 my_subject_train: contains the data from the file subject_train.txt: 7352 rows / 1 column
 my_test_sensor_data: contains the data from the test dataset (both from the subject and the sensor): 2947 rows/ 563 columns
 my_training_sensor_data: contains the data from the training dataset (both from the subject and the sensor): 7352 rows / 563 columns
 my_x_test: contains the data from the file X_test.txt: 2947 rows / 561 columns
 my_x_train: contains the data from the file X_train.txt: 7352 rows / 561 columns
 my_y_test: contains the data from the file y_test.txt:  2947 rows /  1 columns
 my_y_train: contains the data from the file y_train.txt: 7352 rows / 1 columns
```

### Program Code

The program has as its only dependency plyr which is used by calling
```
library(plyr)
```

It must be placed and started in the same directory as the data or before starting, setting the working directory (setwd()) correctly. 

The script performs the 5 steps mentioned under Transformation. 

Shortly explained, it does the following:

1. Merging the files using using cbind() and rbind()

2. Extracting the interesting data (mean, std) using grepl()

3. Setting descriptive activity names using join()

4. Labelling with descriptive names by using gsub with regexes, e.g. std becomes Standarddeviation, t becomes TimeRelated and so on. 

5. Creating an independent dataset. This is done using plyr, more precisesly ddply() and writing it out as requested using write.table()

### Result

The resulting file has 180 rows and 81 columns. The following are the column names:
```
 [1] "Subject"                                                                       
 [2] "Activity"                                                                      
 [3] "TimeRelated.BodyAcceleration-mean()-X"                                         
 [4] "TimeRelated.BodyAcceleration-mean()-Y"                                         
 [5] "TimeRelated.BodyAcceleration-mean()-Z"                                         
 [6] "TimeRelated.BodyAcceleration-std()-X"                                          
 [7] "TimeRelated.BodyAcceleration-std()-Y"                                          
 [8] "TimeRelated.BodyAcceleration-std()-Z"                                          
 [9] "TimeRelated.GravityAcceleration-mean()-X"                                      
[10] "TimeRelated.GravityAcceleration-mean()-Y"                                      
[11] "TimeRelated.GravityAcceleration-mean()-Z"                                      
[12] "TimeRelated.GravityAcceleration-std()-X"                                       
[13] "TimeRelated.GravityAcceleration-std()-Y"                                       
[14] "TimeRelated.GravityAcceleration-std()-Z"                                       
[15] "TimeRelated.BodyAccelerationJerk-mean()-X"                                     
[16] "TimeRelated.BodyAccelerationJerk-mean()-Y"                                     
[17] "TimeRelated.BodyAccelerationJerk-mean()-Z"                                     
[18] "TimeRelated.BodyAccelerationJerk-std()-X"                                      
[19] "TimeRelated.BodyAccelerationJerk-std()-Y"                                      
[20] "TimeRelated.BodyAccelerationJerk-std()-Z"                                      
[21] "TimeRelated.BodyGyroscopicSpeed-mean()-X"                                      
[22] "TimeRelated.BodyGyroscopicSpeed-mean()-Y"                                      
[23] "TimeRelated.BodyGyroscopicSpeed-mean()-Z"                                      
[24] "TimeRelated.BodyGyroscopicSpeed-std()-X"                                       
[25] "TimeRelated.BodyGyroscopicSpeed-std()-Y"                                       
[26] "TimeRelated.BodyGyroscopicSpeed-std()-Z"                                       
[27] "TimeRelated.BodyGyroscopicSpeedscopicAcceleration-mean()-X"                    
[28] "TimeRelated.BodyGyroscopicSpeedscopicAcceleration-mean()-Y"                    
[29] "TimeRelated.BodyGyroscopicSpeedscopicAcceleration-mean()-Z"                    
[30] "TimeRelated.BodyGyroscopicSpeedscopicAcceleration-std()-X"                     
[31] "TimeRelated.BodyGyroscopicSpeedscopicAcceleration-std()-Y"                     
[32] "TimeRelated.BodyGyroscopicSpeedscopicAcceleration-std()-Z"                     
[33] "TimeRelated.BodyAccelerationMagnitude-mean()"                                  
[34] "TimeRelated.BodyAccelerationMagnitude-std()"                                   
[35] "TimeRelated.GravityAccelerationMagnitude-mean()"                               
[36] "TimeRelated.GravityAccelerationMagnitude-std()"                                
[37] "TimeRelated.BodyAccelerationJerkMagnitude-mean()"                              
[38] "TimeRelated.BodyAccelerationJerkMagnitude-std()"                               
[39] "TimeRelated.BodyGyroscopicSpeedMagnitude-mean()"                               
[40] "TimeRelated.BodyGyroscopicSpeedMagnitude-std()"                                
[41] "TimeRelated.BodyGyroscopicSpeedscopicAccelerationMagnitude-mean()"             
[42] "TimeRelated.BodyGyroscopicSpeedscopicAccelerationMagnitude-std()"              
[43] "FrequencyRelated.BodyAcceleration-mean()-X"                                    
[44] "FrequencyRelated.BodyAcceleration-mean()-Y"                                    
[45] "FrequencyRelated.BodyAcceleration-mean()-Z"                                    
[46] "FrequencyRelated.BodyAcceleration-std()-X"                                     
[47] "FrequencyRelated.BodyAcceleration-std()-Y"                                     
[48] "FrequencyRelated.BodyAcceleration-std()-Z"                                     
[49] "FrequencyRelated.BodyAcceleration-meanFreq()-X"                                
[50] "FrequencyRelated.BodyAcceleration-meanFreq()-Y"                                
[51] "FrequencyRelated.BodyAcceleration-meanFreq()-Z"                                
[52] "FrequencyRelated.BodyAccelerationJerk-mean()-X"                                
[53] "FrequencyRelated.BodyAccelerationJerk-mean()-Y"                                
[54] "FrequencyRelated.BodyAccelerationJerk-mean()-Z"                                
[55] "FrequencyRelated.BodyAccelerationJerk-std()-X"                                 
[56] "FrequencyRelated.BodyAccelerationJerk-std()-Y"                                 
[57] "FrequencyRelated.BodyAccelerationJerk-std()-Z"                                 
[58] "FrequencyRelated.BodyAccelerationJerk-meanFreq()-X"                            
[59] "FrequencyRelated.BodyAccelerationJerk-meanFreq()-Y"                            
[60] "FrequencyRelated.BodyAccelerationJerk-meanFreq()-Z"                            
[61] "FrequencyRelated.BodyGyroscopicSpeed-mean()-X"                                 
[62] "FrequencyRelated.BodyGyroscopicSpeed-mean()-Y"                                 
[63] "FrequencyRelated.BodyGyroscopicSpeed-mean()-Z"                                 
[64] "FrequencyRelated.BodyGyroscopicSpeed-std()-X"                                  
[65] "FrequencyRelated.BodyGyroscopicSpeed-std()-Y"                                  
[66] "FrequencyRelated.BodyGyroscopicSpeed-std()-Z"                                  
[67] "FrequencyRelated.BodyGyroscopicSpeed-meanFreq()-X"                             
[68] "FrequencyRelated.BodyGyroscopicSpeed-meanFreq()-Y"                             
[69] "FrequencyRelated.BodyGyroscopicSpeed-meanFreq()-Z"                             
[70] "FrequencyRelated.BodyAccelerationMagnitude-mean()"                             
[71] "FrequencyRelated.BodyAccelerationMagnitude-std()"                              
[72] "FrequencyRelated.BodyAccelerationMagnitude-meanFreq()"                         
[73] "FrequencyRelated.BodyBodyAccelerationJerkMagnitude-mean()"                     
[74] "FrequencyRelated.BodyBodyAccelerationJerkMagnitude-std()"                      
[75] "FrequencyRelated.BodyBodyAccelerationJerkMagnitude-meanFreq()"                 
[76] "FrequencyRelated.BodyBodyGyroscopicSpeedMagnitude-mean()"                      
[77] "FrequencyRelated.BodyBodyGyroscopicSpeedMagnitude-std()"                       
[78] "FrequencyRelated.BodyBodyGyroscopicSpeedMagnitude-meanFreq()"                  
[79] "FrequencyRelated.BodyBodyGyroscopicSpeedscopicAccelerationMagnitude-mean()"    
[80] "FrequencyRelated.BodyBodyGyroscopicSpeedscopicAccelerationMagnitude-std()"     
[81] "FrequencyRelated.BodyBodyGyroscopicSpeedscopicAccelerationMagnitude-meanFreq()"
```
