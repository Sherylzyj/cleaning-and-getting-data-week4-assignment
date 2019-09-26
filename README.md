# cleaning-and-getting-data-week4-assignment

##1 Merge the training and the test sets to create one data set.
### I first loaded the useful data into R. Then I merged the x, y, subject variables respectively by using rbind(). Finally, I merge all these 3 variables into one table by using cbind().
##2 Extracts only the measurements on the mean and standard deviation for each measurement.
### I first loaded the featurenames successfully into R. Then I grasp the "mean" and "standard deviation" by using grep(). the column index I grasped was used to create a finaldata table.
##3 Uses descriptive activity names to name the activities in the data set
### the data of activity names was loaded. The numbers of activity names was matched between the activity names file and the activity column of finaldata. And the numbers was substituted by the corresponding string names of activities.
##4  Appropriately labels the data set with descriptive variable names.
### Used regular expressions to substitute the dataset with descriptive variable names by using gsub()
##5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
### By using group_by function to create a tidy dataset with the average of each variable for each activity and each subject.
