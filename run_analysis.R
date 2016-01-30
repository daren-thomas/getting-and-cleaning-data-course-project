## paths to data sets (based on the current directory being the root of the repository)

training_set_file <- "./UCI HAR Dataset/train/X_train.txt"
training_labels_file <- "./UCI HAR Dataset/train/Y_train.txt"
test_set_file <- "./UCI HAR Dataset/test/X_test.txt"
test_labels_file <- "./UCI HAR Dataset/test/Y_test.txt"
subject_test_file <- "./UCI HAR Dataset/test/subject_test.txt"
subject_train_file <- "./UCI HAR Dataset/train/subject_train.txt"
activity_lables_file <- "./UCI HAR Dataset/activity_labels.txt"

output_file <- "./uci_har_dataset.txt"
output_avg_file <- "./uci_har_dataset_averages.txt"

## libraries used
library(dplyr)

## Objective 1: Merge the training and the test sets to create one data set

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

## feature column names
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


## Objective 2: extract only the measurements on the mean and standard deviation for each measurement
# NOTE: need to offset col_names indexes because I added the two columns to the beginning of names(merged_set)
COL_OFFSET <- 2
merged_set <- merged_set[, c(1, 2, grep("-(mean|std)\\(\\)$", col_names) + COL_OFFSET)]  


## Objective 3: Use descriptive activity names to name the activites in the data set
merged_set$activity <- activity_lables[, 2][merged_set$activity]

## Objective 4: lable the data set with descriptive variable names (following tidy data set rules)
## tidy up the col_names
col_names <- names(merged_set)
col_names <- gsub("[-,]", ".", col_names)                  # replace "bad" characters with periods
col_names <- gsub("[()]", "", col_names)                   # remove parenthesis in variable names
col_names <- gsub("^t([A-Z])", "time\\1", col_names)       # rename variables that start in "t*" to "time*"
col_names <- gsub("^f([A-Z])", "frequency\\1", col_names)  # rename variables that start in "f*" to "frequency*"
names(merged_set) <- col_names

## save data to output file
write.table(merged_set, file=output_file, row.names=FALSE)

## Objective 5: create a second, independent tidy data set with the average of each variable for each activity and each subject
merged_avg <- tbl_df(merged_set) %>% group_by(subject, activity) %>% summarize_each(funs(mean))
colnames(merged_avg)[]
write.table(merged_tbl, file=output_avg_file, row.names=FALSE)
