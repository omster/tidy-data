CodeBook for run_analysis function in creating tidydata.txt data file.

####Raw Data Source & Description

Data Source URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Required data files & relative path from ZIP archive used in the run_analysis function:
- data/features.txt
  - Contains column names for X_train.txt and X_test.txt data tables
- data/activity_labels.txt
  - Contains descriptive labels for Y_train.txt and Y_test.txt data tables
- data/train/subject_train.txt, data/test/subject_test.txt
  - Ordered text file list of subject IDs
- data/train/Y_train.txt, data/test/Y_test.txt
  - Ordered text file list of activiity IDs
- data/train/X_train.txt, data/test/X_test.txt
  - Ordered text file list of bulk raw data variables

###Intent

The run_analysis function is meant to join & combine raw data from the train & test directories, and create a tidy data set consisting of the the mean values of any variables from the data that contains mean() or std() in the column name grouped by subject Id and type of activity.

