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
 my_activity_labels: contains the data from the file activity_labels.txt
 my_data_mean_by_activity: contains the resulting data set
 my_features: contains the data from the file features.txt
 my_mean_std: contains mean and standard deviation data
 my_sensor_data: is the concatenated data from both training and test datasets
 my_sensor_labels: represents the label data
 my_subject_test: contains the data from the file subject_test.txt
 my_subject_train: contains the data from the file subject_train.txt
 my_test_sensor_data: contains the data from the test dataset (both from the subject and the sensor)
 my_training_sensor_data: contains the data from the training dataset (both from the subject and the sensor)
 my_x_test: contains the data from the file X_test.txt
 my_x_train: contains the data from the file X_train.txt
 my_y_test: contains the data from the file y_test.txt
 my_y_train: contains the data from the file y_train.txt
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