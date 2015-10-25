# GetCleanDataAssignment
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

The script uses "dplyr", which is very useful.

1. Merge the training and the test sets to create one data set.
  The script uses rbind() to build columns of subjects, activities and measurements
  then cbind() to build the first dataset.
  I chose to rename the first two columns containing a name "V1" before merging to avoid problems.
  
2. Extracts only the measurements on the mean and standard deviation for each measurement.
  I counted 66 columns concerned by "mean" or "std".
  
3. Uses descriptive activity names to name the activities in the data set.
  Just makes basic replacements from 1 to 6.
  
4. Appropriately labels the data set with descriptive variable names.
  "Just" makes basic 66 replacements with some descriptive words from features_info.txt.
  
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  Use group_by and summerize to get a final result.

  