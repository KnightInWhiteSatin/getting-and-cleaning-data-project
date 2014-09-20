#getting-and-cleaning-data-project
=================================

##Getting and Cleaning Data - Sept. 2014 - Johns Hopkins University - Coursera

**In this project, we take the initial data and tidy it up according to our needs.**

Source of the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Download the data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A set of instructions taken from the assignment description:

*You should create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.*

**This repository contains:**

run_analysis.R - the R script which allows us to obtain tidy data
README.md - describes contents of the repository as well as the algorithm used for tidying data
CodeBook.md - describes the variables used in the script

**Before running the script:**

Unzip the archive with data;
Set the working directory to "\UCI HAR Dataset" (this is the root folder in the archive you download);
Use the "install.packages("plyr")" command in R to download the plyr package (if you haven't done so before). The "library(plyr)" command is included in the script.

**How the script works:**
- Loads the data and names of variables into R. Then it labels variables and combines separated files together.
- Merges two resulting data sets into one by using the rbind() function
- Accomplishes step 2 by searching in variable names for those that contain either "mean" or "std" in their names and then creating a logical vector and subsetting based on it
- Adds the "Activity" variable that labels the activities - this variable is added from the "activity_labels.txt" file in the archive
- Tidies up the names of the variables (removes unnecessary parenthesis and dashes, expands the names of the variables);
- And finally, creates a new data set that only contains mean values per activity per subject (thus, we end up with 180 rows instead of initial 10299!).
