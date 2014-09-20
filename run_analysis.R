library(plyr)

## Read data into R.
## Here, an assumption that the working directory is set to be "UCI HAR Dataset" is made.

train_x = read.table("./train/X_train.txt")
test_x = read.table("./test/X_test.txt")
train_y = read.table("./train/y_train.txt", col.names = c("Activity ID"))
test_y = read.table("./test/y_test.txt", col.names = c("Activity ID"))
train_subject = read.table("./train/subject_train.txt", col.names = c("Subject ID"))
test_subject = read.table("./test/subject_test.txt", col.names = c("Subject ID"))
activity_labs = read.table("./activity_labels.txt", col.names = c("Activity ID", "Activity"))

## Label variables in data sets
features = read.table("features.txt", colClasses = c("integer","character"))
colnames(train_x) = features[,2]
colnames(test_x) = features[,2]

## Prepare final training and testing data sets
train = cbind(train_y, train_subject, train_x)
test = cbind(test_y, test_subject, test_x)

## 1. Merge the training and the test sets to create one data set

complete = rbind(train, test)

## 2. Extract only the measurements on the mean and standard deviation for each measurement.

# Create a vector of logical values matching the columns
# required for the subset
newDataCols = grepl("mean|std|Subject|Activity", names(complete))

#And create the subset based on the values in the vector
dat = complete[,newDataCols]

## 3. Use descriptive activity names to name the activities in the data set

dat = merge(dat, activity_labs, by = "Activity.ID", all.x = T)

## 4. Appropriately label the data set with descriptive activity names.


# Remove parenthesis and dashes

names(dat) = gsub("\\()","",names(dat))
names(dat) = gsub("-mean-|-mean","Mean",names(dat))
names(dat) = gsub("-std-|-std","StandardDeviation",names(dat))
names(dat) = gsub("Freq|Freq-", "Frequency", names(dat))

# Expand vague "t" and "f" in the beginning of the names
names(dat) = gsub("^t", "time", names(dat))
names(dat) = gsub("^f", "frequency", names(dat))

# Expand names of the variables

names(dat) = gsub("Acc","Acceleration",names(dat))
names(dat) = gsub("Gyro","Gyroscope",names(dat))
names(dat) = gsub("Mag","Magnitude",names(dat))

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy = ddply(dat, c("Subject.ID","Activity"), numcolwise(mean))
write.table(tidy, file = "./tidyData.txt", row.name = F)