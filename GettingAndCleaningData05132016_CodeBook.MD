Summary

The script 'GettingandCleaningData05132016.R' performs the follwing analyses:

1) Reading data into R using read.table and concatenating into one data file using rbind

2) Subsetting data using grep("-(mean|std)\\(\\) to capture only columns that have a lavel containing mean or std

3) Relabel data columns via names function

4) Group data using dplyr function group_by

5) Calcuation averages using dplyr summarize_each function

The dplyr package is required for the analysis and loaded while executing the syntax. The output file is labeled "Getting and Cleaning Data - Output.txt"



Variables:

a) Variables containing data: activities, x_train, y_train, subject_train, x_test, y_test, subject_test, features  

b) combined data sets (train & test): x_data, y_data, subject_data

c) vector selecting columns for analysis: mean_and_std_ID

d) Subset data for analysis: subset_x_data

e) Final Data set w/labels: Final_data

f) Data frame for summation: dfTest (grouped by Subject and Activitiy)

g) Output: Getting and Cleaning Data - Output.txt

