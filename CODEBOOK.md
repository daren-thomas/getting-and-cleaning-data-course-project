# Codebook for the tidy data sets

This repository contains two tidy data sets derived from the raw data by means of the script `run_analysis.R`.

The two tidy data sets are called:

- `uci_har_dataset.csv`
- `uci_har_dataset_averages.csv`

The raw data is located in:

- `UCI HAR Dataset/`

## A note on the raw data set

The raw data set folder contains its own documentation. Please check `UCI HAR Dataset/README.txt` for more information on the raw data.


## uci_har_dataset.csv

The first tidy data set is a result of merging the test data set and the training data set.

This file contains the following variables:


- "subject": the subject id identifying the subject who performed the activity
  for each window sample. Its range is from 1 to 30. This variables is produced
  by prepending the contents of `UCI HAR Dataset/test/subject_test.txt` and `UCI HAR Dataset/train/subject_train.txt` files to the data set.
- "activity": the label of the activity performed. This was produced by
  indexing the `UCI HAR Dataset/test/y_test.txt` and `UCI HAR
  Dataset/train/y_train.txt` files with the mapping in `UCI HAR
  Dataset/activity_labels.txt`.
- "timeBodyAccMag.mean": corresponds to `tBodyAccMag-mean()` in the raw data
- "timeBodyAccMag.std": corresponds to `tBodyAccMag-std()` in the raw data
- "timeGravityAccMag.mean": corresponds to `tGravityAccMag-mean()` in the raw data
- "timeGravityAccMag.std": corresponds to `tGravityAccMag-std()` in the raw data
- "timeBodyAccJerkMag.mean": corresponds to `tBodyAccJerkMag-mean()` in the raw data
- "timeBodyAccJerkMag.std": corresponds to `tBodyAccJerkMag-std()` in the raw data
- "timeBodyGyroMag.mean": corresponds to `tBodyGyroMag-mean()` in the raw data
- "timeBodyGyroMag.std": corresponds to `tBodyGyroMag-std()` in the raw data
- "timeBodyGyroJerkMag.mean": corresponds to `tBodyGyroJerkMag-mean()` in the raw data
- "timeBodyGyroJerkMag.std": corresponds to `tBodyGyroJerkMag-std()` in the raw data
- "frequencyBodyAccMag.mean": corresponds to `fBodyAccMag-mean()` in the raw data
- "frequencyBodyAccMag.std": corresponds to `fBodyAccMag-std()` in the raw data
- "frequencyBodyBodyAccJerkMag.mean": corresponds to `fBodyBodyAccJerkMag-mean()` in the raw data
- "frequencyBodyBodyAccJerkMag.std": corresponds to `fBodyBodyAccJerkMag-std()` in the raw data
- "frequencyBodyBodyGyroMag.mean": corresponds to `fBodyBodyGyroMag-mean()` in the raw data
- "frequencyBodyBodyGyroMag.std": corresponds to `fBodyBodyGyroMag-std()` in the raw data
- "frequencyBodyBodyGyroJerkMag.mean": corresponds to `fBodyBodyGyroJerkMag-mean()` in the raw data
- "frequencyBodyBodyGyroJerkMag.std": corresponds to `fBodyBodyGyroJerkMag-std()` in the raw data


The data contained in the `uci_har_dataset.csv` contains the data from the test
data set and the training data set in the raw data folder. Check the file `UCI
HAR Dataset/features_info.txt` for more information on the variables.

## uci_har_dataset_averages.csv

The second tidy data set is a result of processing the first (`uci_har_dataset.csv`) tidy data set. It is stored in a file called `uci_har_dataset_averages.csv`.

This file contains the same variables as `uci_har_dataset.csv`, except that each variable is an average per subject and activity of the data in `uci_har_dataset.csv`.
