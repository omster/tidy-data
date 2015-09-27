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

###Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

###Methods

Tables of similar data are combined by using the rbind() method yielding three tables: subject, activity, and features.  These tables are then combined using the cbind() method.  The resulting data is then aggregated by subject & activity using the mean values of the remaining variables/columns, and then saved to data/tidyData.txt

Column names are assigned by factoring the features.txt data and using gsub() for renaming. 

###Manipulation

The merged output data from the Y_train and Y_test files are replaced with their descriptive label counterparts under the Activity column.  X_train & X_test column headers were added using the data from the features data, and have been updated to be more readable by replacing column names starting with 't*' or 'f*' with 'Time' or 'Freqency', respectively.
