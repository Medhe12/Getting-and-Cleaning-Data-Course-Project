# Loading the required packages
library(plyr) # plyr is loaded before dplyr for table manipulations
library(data.table) # to handle data frames faster
library(dplyr) # to manipulate and organise data tables

# set the required appropriated working directory for the script
setwd("D:/DataScience_JHU/Practice/GettingCleaningDataProgAss")
dir <- getwd() # storing the path in a dir variable for easy download
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" #storing the given data url in variable url

# using the download.file function to download the data from the given url in .zip format at a required destination
download.file(url, file.path(dir, "dataFiles.zip")) 
unzip(zipfile = "dataFiles.zip") # unzipping the downladed data from the zip file

# read train data
Train_X <- read.table("./UCI HAR Dataset/train/Train_X.txt")
Train_Y <- read.table("./UCI HAR Dataset/train/Train_Y.txt")
Train_Sub <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# read test data
Test_X <- read.table("./UCI HAR Dataset/test/Test_X.txt")
Test_Y <- read.table("./UCI HAR Dataset/test/Test_Y.txt")
Test_Sub <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# read data description
variable_names <- read.table("./UCI HAR Dataset/features.txt")

# read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# 1. Merges the training and the test sets to create one data set.
X_merged <- rbind(Train_X, Test_X)
Y_merged <- rbind(Train_Y, Test_Y)
Sub_merged <- rbind(Train_Sub, Test_Sub)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
mean_std_vars <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_merged <- X_merged[,mean_std_vars[,1]]

# 3. Uses descriptive activity names to name the activities in the data set
colnames(Y_merged) <- "activity"
Y_merged$activitylabel <- factor(Y_merged$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_merged[,-1]

# 4. Appropriately labels the data set with descriptive variable names.
colnames(X_merged) <- variable_names[mean_std_vars[,1],2]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(Sub_merged) <- "subject"
total <- cbind(X_merged, activitylabel, Sub_merged)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
