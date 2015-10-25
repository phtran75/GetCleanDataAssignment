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

# Appropriately labels the data set with descriptive variable names.
# pff
tmp_dataset <- rename(tmp_dataset, BodyAccelerationX_mean = V1, BodyAccelerationY_mean = V2, BodyAccelerationZ_mean = V3)
tmp_dataset <- rename(tmp_dataset, BodyAccelerationX_std = V4, BodyAccelerationY_std = V5, BodyAccelerationZ_std = V6)
tmp_dataset <- rename(tmp_dataset, GravityAccelerationX_mean = V41, GravityAccelerationY_mean = V42, GravityAccelerationZ_mean = V43)
tmp_dataset <- rename(tmp_dataset, GravityAccelerationX_std = V44, GravityAccelerationY_std = V45, GravityAccelerationZ_std = V46)
tmp_dataset <- rename(tmp_dataset, BodyAccelerationJerkX_mean = V81, BodyAccelerationJerkY_mean = V82, BodyAccelerationJerkZ_mean = V83)
tmp_dataset <- rename(tmp_dataset, BodyAccelerationJerkX_std = V84, BodyAccelerationJerkY_std = V85, BodyAccelerationJerkZ_std = V86)
tmp_dataset <- rename(tmp_dataset, BodyGyroscopeX_mean = V121, BodyGyroscopeY_mean = V122, BodyGyroscopeZ_mean = V123)
tmp_dataset <- rename(tmp_dataset, BodyGyroscopeX_std = V124, BodyGyroscopeY_std = V125, BodyGyroscopeZ_std = V126)
tmp_dataset <- rename(tmp_dataset, BodyGyroscopeJerkX_mean = V161, BodyGyroscopeJerkY_mean = V162, BodyGyroscopeJerkZ_mean = V163)
tmp_dataset <- rename(tmp_dataset, BodyGyroscopeJerkX_std = V164, BodyGyroscopeJerkY_std = V165, BodyGyroscopeJerkZ_std = V166)
tmp_dataset <- rename(tmp_dataset, BodyAccelerationMag_mean = V201, BodyAccelerationMag_std = V202)
tmp_dataset <- rename(tmp_dataset, GravityAccelerationMag_mean = V214, GravityAccelerationMag_std = V215)
tmp_dataset <- rename(tmp_dataset, BodyAccelerationJerkMag_mean = V227, BodyAccelerationJerkMag_std = V228)
tmp_dataset <- rename(tmp_dataset, BodyGyroscopeMag_mean = V240, BodyGyroscopeMag_std = V241)
tmp_dataset <- rename(tmp_dataset, BodyGyroscopeJerkMag_mean = V253, BodyGyroscopeJerkMag_std = V254)
tmp_dataset <- rename(tmp_dataset, FreqBodyAccelerationX_mean = V266, FreqBodyAccelerationY_mean = V267, FreqBodyAccelerationZ_mean = V268)
tmp_dataset <- rename(tmp_dataset, FreqBodyAccelerationX_std = V269, FreqBodyAccelerationY_std = V270, FreqBodyAccelerationZ_std = V271)
tmp_dataset <- rename(tmp_dataset, FreqBodyAccelerationJerkX_mean = V345, FreqBodyAccelerationJerkY_mean = V346, FreqBodyAccelerationJerkZ_mean = V347)
tmp_dataset <- rename(tmp_dataset, FreqBodyAccelerationJerkX_std = V348, FreqBodyAccelerationJerkY_std = V349, FreqBodyAccelerationJerkZ_std = V350)
tmp_dataset <- rename(tmp_dataset, FreqBodyGyroscopeX_mean = V424, FreqBodyGyroscopeY_mean = V425, FreqBodyGyroscopeZ_mean = V426)
tmp_dataset <- rename(tmp_dataset, FreqBodyGyroscopeX_std = V427, FreqBodyGyroscopeY_std = V428, FreqBodyGyroscopeZ_std = V429)
tmp_dataset <- rename(tmp_dataset, FreqBodyAccelerationMag_mean = V503, FreqBodyAccelerationMag_std = V504)
tmp_dataset <- rename(tmp_dataset, FreqBodyBodyAccelerationJerkMag_mean = V516, FreqBodyBodyAccelerationJerkMag_std = V517)
tmp_dataset <- rename(tmp_dataset, FreqBodyBodyGyroscopeMag_mean = V529, FreqBodyBodyGyroscopeMag_std = V530)
tmp_dataset <- rename(tmp_dataset, FreqBodyBodyGyroscopeJerkMag_mean = V542, FreqBodyBodyGyroscopeJerkMag_std = V543)

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
# Final mean Calculation...
final_dataset <- group_by(tmp_dataset, Subject, Activity)
summarize(final_dataset, BodyAccelerationX_mean = mean(BodyAccelerationX_mean, na.rm = TRUE),
          BodyAccelerationY_mean = mean(BodyAccelerationY_mean, na.rm = TRUE),
          BodyAccelerationY_mean = mean(BodyAccelerationY_mean, na.rm = TRUE),
          BodyAccelerationZ_mean = mean(BodyAccelerationZ_mean, na.rm = TRUE),
          BodyAccelerationX_std = mean(BodyAccelerationX_std, na.rm = TRUE),
          BodyAccelerationY_std = mean(BodyAccelerationY_std, na.rm = TRUE),
          BodyAccelerationZ_std = mean(BodyAccelerationZ_std, na.rm = TRUE),
          GravityAccelerationX_mean = mean(GravityAccelerationX_mean, na.rm = TRUE),
          GravityAccelerationY_mean = mean(GravityAccelerationY_mean, na.rm = TRUE),
          GravityAccelerationZ_mean = mean(GravityAccelerationZ_mean, na.rm = TRUE),
          GravityAccelerationX_std = mean(GravityAccelerationX_std, na.rm = TRUE),
          GravityAccelerationY_std = mean(GravityAccelerationY_std, na.rm = TRUE),
          GravityAccelerationZ_std = mean(GravityAccelerationZ_std, na.rm = TRUE),
          BodyAccelerationJerkX_mean = mean(BodyAccelerationJerkX_mean, na.rm = TRUE),
          BodyAccelerationJerkY_mean = mean(BodyAccelerationJerkY_mean, na.rm = TRUE),
          BodyAccelerationJerkZ_mean = mean(BodyAccelerationJerkZ_mean, na.rm = TRUE),
          BodyAccelerationJerkX_std = mean(BodyAccelerationJerkX_std, na.rm = TRUE),
          BodyAccelerationJerkY_std = mean(BodyAccelerationJerkY_std, na.rm = TRUE),
          BodyAccelerationJerkZ_std = mean(BodyAccelerationJerkZ_std, na.rm = TRUE),
          BodyGyroscopeX_mean = mean(BodyGyroscopeX_mean, na.rm = TRUE),
          BodyGyroscopeY_mean = mean(BodyGyroscopeY_mean, na.rm = TRUE),
          BodyGyroscopeZ_mean = mean(BodyGyroscopeZ_mean, na.rm = TRUE),
          BodyGyroscopeX_std = mean(BodyGyroscopeX_std, na.rm = TRUE),
          BodyGyroscopeY_std = mean(BodyGyroscopeY_std, na.rm = TRUE),
          BodyGyroscopeX_std = mean(BodyGyroscopeZ_std, na.rm = TRUE),
          BodyGyroscopeJerkX_mean = mean(BodyGyroscopeJerkX_mean, na.rm = TRUE),
          BodyGyroscopeJerkY_mean = mean(BodyGyroscopeJerkY_mean, na.rm = TRUE),
          BodyGyroscopeJerkZ_mean = mean(BodyGyroscopeJerkZ_mean, na.rm = TRUE),
          BodyGyroscopeX_std = mean(BodyGyroscopeX_std, na.rm = TRUE),
          BodyGyroscopeY_std = mean(BodyGyroscopeY_std, na.rm = TRUE),
          BodyGyroscopeZ_std = mean(BodyGyroscopeZ_std, na.rm = TRUE),
          BodyGyroscopeJerkX_mean = mean(BodyGyroscopeJerkX_mean, na.rm = TRUE),
          BodyGyroscopeJerkY_mean = mean(BodyGyroscopeJerkY_mean, na.rm = TRUE),
          BodyGyroscopeJerkZ_mean = mean(BodyGyroscopeJerkZ_mean, na.rm = TRUE),
          BodyGyroscopeJerkX_std = mean(BodyGyroscopeJerkX_std, na.rm = TRUE),
          BodyGyroscopeJerkY_std = mean(BodyGyroscopeJerkY_std, na.rm = TRUE),
          BodyGyroscopeJerkZ_std = mean(BodyGyroscopeJerkZ_std, na.rm = TRUE),
          BodyAccelerationMag_mean = mean(BodyAccelerationMag_mean, na.rm = TRUE),
          BodyAccelerationMag_std = mean(BodyAccelerationMag_std, na.rm = TRUE),
          GravityAccelerationMag_mean = mean(GravityAccelerationMag_mean, na.rm = TRUE),
          GravityAccelerationMag_std = mean(GravityAccelerationMag_std, na.rm = TRUE),
          BodyAccelerationJerkMag_mean = mean(BodyAccelerationJerkMag_mean, na.rm = TRUE),
          BodyAccelerationJerkMag_std = mean(BodyAccelerationJerkMag_std, na.rm = TRUE),
          BodyGyroscopeMag_mean = mean(BodyGyroscopeMag_mean, na.rm = TRUE),
          BodyGyroscopeMag_std = mean(BodyGyroscopeMag_std, na.rm = TRUE),
          BodyGyroscopeJerkMag_mean = mean(BodyGyroscopeJerkMag_mean, na.rm = TRUE),
          BodyGyroscopeJerkMag_std = mean(BodyGyroscopeJerkMag_std, na.rm = TRUE),
          FreqBodyAccelerationX_mean = mean(FreqBodyAccelerationX_mean, na.rm = TRUE),
          FreqBodyAccelerationY_mean = mean(FreqBodyAccelerationY_mean, na.rm = TRUE),
          FreqBodyAccelerationZ_mean = mean(FreqBodyAccelerationZ_mean, na.rm = TRUE),
          FreqBodyAccelerationX_std = mean(FreqBodyAccelerationX_std, na.rm = TRUE),
          FreqBodyAccelerationY_std = mean(FreqBodyAccelerationY_std, na.rm = TRUE),
          FreqBodyAccelerationZ_std = mean(FreqBodyAccelerationZ_std, na.rm = TRUE),
          FreqBodyAccelerationJerkX_mean = mean(FreqBodyAccelerationJerkX_mean, na.rm = TRUE),
          FreqBodyAccelerationJerkY_mean = mean(FreqBodyAccelerationJerkY_mean, na.rm = TRUE),
          FreqBodyAccelerationJerkZ_mean = mean(FreqBodyAccelerationJerkZ_mean, na.rm = TRUE),
          FreqBodyAccelerationJerkX_std = mean(FreqBodyAccelerationJerkX_std, na.rm = TRUE),
          FreqBodyAccelerationJerkY_std = mean(FreqBodyAccelerationJerkY_std, na.rm = TRUE),
          FreqBodyAccelerationJerkZ_std = mean(FreqBodyAccelerationJerkZ_std, na.rm = TRUE),
          FreqBodyGyroscopeX_mean = mean(FreqBodyGyroscopeX_mean, na.rm = TRUE),
          FreqBodyGyroscopeY_mean = mean(FreqBodyGyroscopeY_mean, na.rm = TRUE),
          FreqBodyGyroscopeZ_mean = mean(FreqBodyGyroscopeZ_mean, na.rm = TRUE),
          FreqBodyGyroscopeX_std = mean(FreqBodyGyroscopeX_std, na.rm = TRUE),
          FreqBodyGyroscopeY_std = mean(FreqBodyGyroscopeY_std, na.rm = TRUE),
          FreqBodyGyroscopeZ_std = mean(FreqBodyGyroscopeZ_std, na.rm = TRUE),
          FreqBodyAccelerationMag_mean = mean(FreqBodyAccelerationMag_mean, na.rm = TRUE),
          FreqBodyAccelerationMag_std = mean(FreqBodyAccelerationMag_std, na.rm = TRUE),
          FreqBodyBodyAccelerationJerkMag_mean = mean(FreqBodyBodyAccelerationJerkMag_mean, na.rm = TRUE),
          FreqBodyBodyAccelerationJerkMag_std = mean(FreqBodyBodyAccelerationJerkMag_std, na.rm = TRUE),
          FreqBodyBodyGyroscopeMag_mean = mean(FreqBodyBodyGyroscopeMag_mean, na.rm = TRUE),
          FreqBodyBodyGyroscopeMag_std = mean(FreqBodyBodyGyroscopeMag_std, na.rm = TRUE),
          FreqBodyBodyGyroscopeJerkMag_mean = mean(FreqBodyBodyGyroscopeJerkMag_mean, na.rm = TRUE),
          FreqBodyBodyGyroscopeJerkMag_std = mean(FreqBodyBodyGyroscopeJerkMag_std, na.rm = TRUE)
)



