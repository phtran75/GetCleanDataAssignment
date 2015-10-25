# run_analysis.R
# 
# Getting and Cleaning Data Course Project
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
# The goal is to prepare tidy data that can be used for later analysis.
# 
# run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

library(dplyr)

# Read all data files
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Merges the training and the test sets to create one data set.
# 7352 train + 2947 test = 10299 lines and 563 columns
first_column <- rbind(subject_train,subject_test)
second_column <- rbind(Y_train,Y_test)
other_column <- rbind(X_train,X_test)

# I chose to rename the first two columns before merging
first_column <- rename(first_column, Subject = V1)
second_column <- rename(second_column, Activity = V1)
first_dataset <- cbind(first_column, second_column, other_column)

# Extracts only the measurements on the mean and standard deviation for each measurement.
# I counted 66 columns... from V1 to V...
tmp_dataset <- select(first_dataset,1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545)

# Uses descriptive activity names to name the activities in the data set
# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING
tmp_dataset$Activity[tmp_dataset$Activity == 1] <- "WALKING"
tmp_dataset$Activity[tmp_dataset$Activity == 2] <- "WALKING_UPSTAIRS"
tmp_dataset$Activity[tmp_dataset$Activity == 3] <- "WALKING_DOWNSTAIRS"
tmp_dataset$Activity[tmp_dataset$Activity == 4] <- "SITTING"
tmp_dataset$Activity[tmp_dataset$Activity == 5] <- "STANDING"
tmp_dataset$Activity[tmp_dataset$Activity == 6] <- "LAYING"
