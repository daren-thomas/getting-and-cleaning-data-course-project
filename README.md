# Contents of this repository

This repository contains my solution for the course project "Getting and Cleaning Data".

It contains the following files and folders:

- `README.md` (this document)
- `CodeBook.md` (a description of the variables, the data, and any transformations or work that I performed to clean up the data)
- `UCI HAR Dataset/` (a folder containing the original dataset, the raw data)
- `run_analysis.R` (a script to produce the tidy data from the raw data)
- `uci_har_dataset.csv` (a tidy version of the raw data as described in the codebook)
- `uci_har_dataset_averages.csv` (a tidy version of the raw data as described in the codebook, each variable averaged for each activity and each subject)

## A note on running the script

The script `run_analysis.R` is meant to be run with the working directory set
to the root of this repository (the same folder that this `README.md` file is
located).


Use the `setwd()` command to change to this directory if needed.

The script depends on the package `dplyr`.


Running the script will read in the raw data and (re)produce the two files:

- `uci_har_dataset.csv`
- `uci_har_dataset_averages.csv`

Check the `CodeBook.md` for more information on the contents of these files.

## A note on the raw dataset

The folder `UCI HAR Dataset/` contains the raw data used by the script `run_analysis.R`. It was originally downloaded from here:

    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

I unzipped it into the folder, but otherwise did not touch the data.

The data represents data collected from the accelerometers from the Samsung
Galaxy S smartphone. A full description is available at the site where the data
was obtained:

    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data includes documentation that is necessary to understand the modifications made while tidying it up.
