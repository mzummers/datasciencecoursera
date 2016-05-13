library(dplyr)

myDir <- "~/_R/CleaningData (Class 4)/Project"
setwd(myDir)

###############################################################################
# Reading data sets, using nrow and ncol to check and compare data set size   #
###############################################################################

activities <- read.table("activity_labels.txt")
nrow(activities) # 6
ncol(activities) # 2

x_train <- read.table("X_train.txt")
nrow(x_train) # 7352
ncol(x_train) # 561

y_train <- read.table("y_train.txt")
nrow(y_train) # 7352
ncol(y_train) # 1

subject_train <- read.table("subject_train.txt")
nrow(subject_train) # 7352
ncol(subject_train) # 1

x_test <- read.table("X_test.txt")
nrow(x_test) # 2947
ncol(x_test) # 561

y_test <- read.table("y_test.txt")
nrow(y_test) # 2947
ncol(y_test) # 1

subject_test <- read.table("subject_test.txt")
nrow(subject_test) # 2947
ncol(y_test) # 1

# combine x data
x_data <- rbind(x_train, x_test)
nrow(x_data) # 10299
ncol(x_data) # 561

# combine y data
y_data <- rbind(y_train, y_test)
nrow(y_data) # 10299
ncol(y_data) # 1

# combine subjects
subject_data <- rbind(subject_train, subject_test)
nrow(subject_data) # 10299
ncol(subject_data) # 1

###################################################################
# Extract columns with mean and standard deviation as descriptor  #
###################################################################

features <- read.table("features.txt")
nrow(features) # 561
ncol(features) # 2

# get only column IDs with "mean()" or "std()" in their names
mean_and_std_ID <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
subset_x_data <- x_data[, mean_and_std_ID]

# add column names to subset data
names(subset_x_data) <- features[mean_and_std_ID, 2]

# update data with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# add column name to activity column
names(y_data) <- "Activity"

# update column name for sujects
names(subject_data) <- "Subject"

# create final data set: 
Final_data <- cbind(subject_data, y_data, subset_x_data)
nrow(Final_data) # 10299
ncol(Final_data) # 68

######################################################################################
# Data Manipulation                                                                  #
# Tidy data set with the average of each variable by subject and Activity            #
######################################################################################

dfTest <- group_by(Final_data, Subject, Activity)

dfTest <- dfTest %>%
        group_by(Subject, Activity) %>%
        summarise_each(funs(mean))


write.table(dfTest, "Getting and Cleaning Data - Output.txt", row.name=FALSE)
