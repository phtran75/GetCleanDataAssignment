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

# Read all data files
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Merge all data files
# 7352 train + 2947 test = 10299 lines and 563 columns
first_column <- rbind(subject_train,subject_test)
second_column <- rbind(Y_train,Y_test)
other_column <- rbind(X_train,X_test)

first_dataset <- cbind(first_column, second_column, other_column)