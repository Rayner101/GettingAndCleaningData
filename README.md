GettingAndCleaningData
======================

Coursera project assignement


1) Download and unzip the source from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into your working directory

2) Download the run_analysis.R script into your working directory

3) Execute the script with source(run_analysis.R)

It will create a file called "tidy_dataset.csv" with the clean result, alternatively, you can explore the final dataframe created called "tiddy" that will appear in the workspace

The final dataset should have 180 observations (30 subjects *  6 activities) and 68 columns (1 subject, 1 activity, 66 means and std). I excluded all columns that did not match the "-mean()" structure.
