
run_analysis <- function() {

     ## install required packages for function
     library(data.table)
     library(plyr)
     
     ## Read data descriptor files into data table objects
     features <- read.table("data/features.txt")
     activityLabels <- read.table("data/activity_labels.txt")
     
     ## Read & combine subject file data, then set label as Subject
     dataSubject <- rbind(read.table("data/train/subject_train.txt"), read.table("data/test/subject_test.txt"))
     names(dataSubject) <- c("Subject")
     
     ## Read & combine activity file data, then set label as Activity
     dataActivity <- rbind(read.table("data/train/Y_train.txt"), read.table("data/test/Y_test.txt"))
     names(dataActivity) <- c("Activity")
     
     ## Read & combine features file data, and then rewrite  o only include column names we're interested in: those that contain 'mean()' or 'std()'
     dataFeatures <- rbind(read.table("data/train/X_train.txt"), read.table("data/test/X_test.txt"))
     names(dataFeatures) <- features$V2
     dataFeatures <- subset(dataFeatures, select = features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)])
     
     ## Create new table combining Subject, Activity, and Features data
     dataComplete <- cbind(dataSubject, dataActivity, dataFeatures)
     
     ## Rewrite Activity column with descriptive label based on factoring from activity label
     dataComplete$Activity <- factor(dataComplete$Activity, labels = activityLabels$V2)
     
     ## Use gsub + regex to rewrite labels with more descriptive text
     names(dataComplete) <- gsub("^t", "Time", names(dataComplete))
     names(dataComplete) <- gsub("^f", "Frequency", names(dataComplete))
     
     ## Create table containing the mean of all data columns grouped by Subject & Activity, and write file to data directory
     dataTidy <- aggregate(. ~Subject + Activity, dataComplete, mean)
     write.table(dataTidy, file = "data/tidyData.txt", col.names = TRUE)
     
}
