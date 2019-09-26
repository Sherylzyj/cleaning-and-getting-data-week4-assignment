#1. Merge the training and the test sets to create one data set.
## load data into R
train_x <- read.table("/Users/sheryl_zyj/Desktop/UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("/Users/sheryl_zyj/Desktop/UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("/Users/sheryl_zyj/Desktop/UCI HAR Dataset/train/subject_train.txt")
test_x <- read.table("/Users/sheryl_zyj/Desktop/UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("/Users/sheryl_zyj/Desktop/UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("/Users/sheryl_zyj/Desktop/UCI HAR Dataset/test/subject_test.txt")
#names(test_x)

## merge train and test data
xall <- rbind(train_x, test_x)
yall <- rbind(train_y, test_y)
suball <- rbind(train_subject, test_subject)
alldata <- cbind(xall, yall, suball)
#head(alldata)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
## load data into R
Featurenames <- read.table("/Users/sheryl_zyj/Desktop/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)[,2]
## Extracts mean and standard deviation for each measurement
index <- grep(("*-mean()*|*-std()*"), Featurenames)
finaldata <- alldata[, c(1, 2, index+2)]
head(finaldata)
colnames(finaldata) <- c("subject", "activity", Featurenames[index])

#3 Uses descriptive activity names to name the activities in the data set
actinames <- read.table("/Users/sheryl_zyj/Desktop/UCI HAR Dataset/activity_labels.txt")
finaldata$activity <- factor(finaldata$activity, levels = actinames[,1], labels = actinames[,2])

#4 Appropriately labels the data set with descriptive variable names.
names(finaldata) <- gsub("\\()", "", names(finaldata))
names(finaldata) <- gsub("^t", "time", names(finaldata))
names(finaldata) <- gsub("^f", "frequence", names(finaldata))
names(finaldata) <- gsub("-mean", "Mean", names(finaldata))
names(finaldata) <- gsub("-std", "Std", names(finaldata))

#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
averdata <- finaldata %>%
group_by(subject, activity) %>%
summarise_each(funs(mean))
write.table(averdata, "/Users/sheryl_zyj/Desktop/UCI HAR Dataset/averdata.txt", row.names = FALSE)

