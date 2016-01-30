## paths to data sets (based on the current directory being the root of the repository)

training_set_file <- "./UCI HAR Dataset/train/X_train.txt"
training_labels_file <- "./UCI HAR Dataset/train/Y_train.txt"
test_set_file <- "./UCI HAR Dataset/test/X_test.txt"
test_labels_file <- "./UCI HAR Dataset/test/Y_test.txt"
subject_test_file <- "./UCI HAR Dataset/test/subject_test.txt"
subject_train_file <- "./UCI HAR Dataset/train/subject_train.txt"
activity_lables_file <- "./UCI HAR Dataset/activity_labels.txt"

output_file <- "./uci_har_dataset.csv"
output_avg_file <- "./uci_har_dataset_averages.csv"

## libraries used
library(dplyr)

## read in all the data sets

training_set <- read.table(training_set_file, sep="")
test_set <- read.table(test_set_file, sep="")

training_labels <- read.table(training_labels_file)
test_lables <- read.table(test_labels_file)
features <- read.table(features_file, sep="")
features_file <- "./UCI HAR Dataset/features.txt"
subject_test <- read.table(subject_test_file, sep="")
subject_train <- read.table(subject_train_file, sep="")
activity_lables <- read.table(activity_lables_file, sep="")

## tidy the feature column names
col_names <- features[, 2]


## start with the test data
names(test_set) <- col_names  # add the feature column names
test_set <- cbind(subject_test, test_lables, test_set)  # add the subject and activity column data
names(test_set)[1:2] <- c("subject", "activity")  # add the subject and activity column names

## append the training data to the bottom
names(training_set) <- col_names  # add the feature column names
training_set <- cbind(subject_train, training_labels, training_set)  # add the subject and activity column data
names(training_set)[1:2] <- c("subject", "activity")  # add the subject and activity column names

merged_set <- rbind(test_set, training_set)

## look up the activity label
merged_set$activity <- activity_lables[, 2][merged_set$activity]

## extract only the measurements on the mean and standard deviation for each measurement
merged_set <- merged_set[, c(1, 2, grep("-(mean|std)\\(\\)$", col_names)+2)]  # NOTE: need to offset col_names indexes because I added two columns

## tidy up the col_names
col_names <- names(merged_set)
col_names <- gsub("[-,]", ".", col_names)
col_names <- gsub("[()]", "", col_names)
col_names <- gsub("^t([A-Z])", "time\\1", col_names)
col_names <- gsub("^f([A-Z])", "frequency\\1", col_names)
names(merged_set) <- col_names

## save data to output file
write.csv(merged_set, file=output_file)

## create a second, independent tidy data set with the average of each variable for each activity and each subject
merged_avg <- tbl_df(merged_set) %>% group_by(subject, activity) %>% summarize_each(funs(mean))
write.csv(merged_tbl, file=output_avg_file)
