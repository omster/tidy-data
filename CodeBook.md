CodeBook for run_analysis function in creating tidydata.txt data file.

####Raw Data Source & Description

Data Source URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Data Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

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

###Manipulation

The merged output data from the Y_train and Y_test files are replaced with their descriptive label counterparts under the Activity column.  X_train & X_test column headers were added using the data from the features data, and have been updated to be more readable by replacing column names starting with 't*' or 'f*' with 'Time' or 'Freqency', respectively.

##Methods

Tables of similar data are combined by using the rbind() method yielding three tables: subject, activity, and features.  These tables are then combined using the cbind() method.  The resulting data is then aggregated by subject & activity using the mean values of the remaining variables/columns, and then saved asdata/tidyData.txt
Column names are assigned by factoring the features.txt data and using gsub() for renaming. 


