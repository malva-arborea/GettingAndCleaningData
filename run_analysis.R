# Step 1: Reading and merging data

## Load libraries
library(plyr)

## Read files with meta information
my_features <- read.table("features.txt", colClasses = c("character"))
my_activity_labels <- read.table("activity_labels.txt", col.names = c("ActivityId", "Activity"))

## Read Files from the train set into Tables
my_x_train <- read.table("train/X_train.txt")
my_y_train <- read.table("train/y_train.txt")
my_subject_train <- read.table("train/subject_train.txt")

## Read Files from the test set into Tables
my_x_test <- read.table("test/X_test.txt")
my_y_test <- read.table("test/y_test.txt")
my_subject_test <- read.table("test/subject_test.txt")

## Merging files
my_training_sensor_data <- cbind(cbind(my_x_train, my_subject_train), my_y_train)
my_test_sensor_data <- cbind(cbind(my_x_test, my_subject_test), my_y_test)
my_sensor_data <- rbind(my_training_sensor_data, my_test_sensor_data)

## Adding labels
my_sensor_labels <- rbind(rbind(my_features, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(my_sensor_data) <- my_sensor_labels

# Step 2: Extracting measurements: mean, standard deviation

## grep for mean and std columns
my_mean_std <- my_sensor_data[,grepl("mean|std|Subject|ActivityId", names(my_sensor_data))]

# Step 3: Add labels

## Join the my_mean_stad with my_activity_labels using ActivityID
my_mean_std <- join(my_mean_std, my_activity_labels, by = "ActivityId", match = "first")
my_mean_std <- my_mean_std[,-1]

# Step 4: Use descriptive names for the labels and do some cleaning up

## Renaming the Short Names
names(my_mean_std) <- gsub('Acc',"Acceleration",names(my_mean_std))
names(my_mean_std) <- gsub('Freq$',"Frequency",names(my_mean_std))
names(my_mean_std) <- gsub('Freq\\.',"Frequency.",names(my_mean_std))
names(my_mean_std) <- gsub('^f',"FrequencyRelated.",names(my_mean_std))
names(my_mean_std) <- gsub('GyroJerk',"GyroscopicAcceleration",names(my_mean_std))
names(my_mean_std) <- gsub('Gyro',"GyroscopicSpeed",names(my_mean_std))
names(my_mean_std) <- gsub('Mag',"Magnitude",names(my_mean_std))
names(my_mean_std) <- gsub('\\.mean',".Mean",names(my_mean_std))
names(my_mean_std) <- gsub('\\.std',".Standarddeviation",names(my_mean_std))
names(my_mean_std) <- gsub('^t',"TimeRelated.",names(my_mean_std))

# Step 5:
my_data_mean_by_activity = ddply(my_mean_std, c("Subject","Activity"), numcolwise(mean))
write.table(my_data_mean_by_activity, file = "my_data_mean_by_activity.txt", row.name=FALSE)
