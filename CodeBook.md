#Codebook for Getting and Cleaning Data project

##Here, you will find the description of the variables used in the run_analysis.R script.

*train_x, test_x, train_y, test_y, train_subject, test_subject, activity_labs, features*
These are the variables to which we load data from files. 
The first six are data tables and the last two are names of the variables in data sets.

*train, test*
Two data sets that are the result of merging *train_y, train_subject, train_x* and *test_y, test_subject, test_x* respectively.

*complete*
The raw data set that is the result of merging *train* and *test*. Contains all the variables from initial data sets, hence the name.

*dat*
The data set we obtain by extracting only variables with means and SDs of measurements.

*tidy*
The data set we obtain by averaging values per activity per subject.

**How the script works:**
- Loads the data and names of variables into R. Then it labels variables and combines separated files together.
- Merges two resulting data sets into one by using the rbind() function
- Accomplishes step 2 by searching in variable names for those that contain either "mean" or "std" in their names and then creating a logical vector and subsetting based on it
- Adds the "Activity" variable that labels the activities - this variable is added from the "activity_labels.txt" file in the archive
- Tidies up the names of the variables (removes unnecessary parenthesis and dashes, expands the names of the variables);
- And finally, creates a new data set that only contains mean values per activity per subject (thus, we end up with 180 rows instead of initial 10299!).
