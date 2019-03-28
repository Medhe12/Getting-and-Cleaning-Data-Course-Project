# Loading the required packages
library(plyr) # plyr is loaded before dplyr for table manipulations
library(data.table) # to handle data frames faster
library(dplyr) # to manipulate and organise data tables

# arranging and getting the data needed
# set the required appropriated working directory for the script
setwd("D:/DataScience_JHU/Practice/GettingCleaningDataProgAss")
dir <- getwd() # storing the path in a dir variable for easy download
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" #storing the given data url in variable url

# using the download.file function to download the data from the given url in .zip format at a required destination
download.file(url, file.path(dir, "dataFiles.zip")) 
unzip(zipfile = "dataFiles.zip") # unzipping the downladed data from the zip file

#pre-processing od the data
#reading and storing training data into different data tables for X,Y and Subject
Train_X <- read.table("./UCI HAR Dataset/train/Train_X.txt")
Train_Y <- read.table("./UCI HAR Dataset/train/Train_Y.txt")
Train_Sub <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# reading and storing testing data into data tables
Test_X <- read.table("./UCI HAR Dataset/test/Test_X.txt")
Test_Y <- read.table("./UCI HAR Dataset/test/Test_Y.txt")
Test_Sub <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# reading the column names based on the features provided in the dataset
colnames_features <- read.table("./UCI HAR Dataset/features.txt")

# reading the rownames based on the activity labels provided in the dataset
rownames_activity_labels <- read.table("./UCI HAR Dataset/rownames_activity_labels.txt")

# Merging the training and the testing datssets to create one data set respectively for X,Y and subjects
#using row bind function to merge data based on rows, test after train
X_merged <- rbind(Train_X, Test_X)
Y_merged <- rbind(Train_Y, Test_Y)
Sub_merged <- rbind(Train_Sub, Test_Sub)

# Extracting only the measurements on the mean and standard deviation for each measurement.
# using grep to find std and mean across the dataset from the list of features provided
mean_std_vars <- colnames_features[grep("mean\\(\\)|std\\(\\)",colnames_features[,2]),]
# using a vector of only the variables needed, we get a subset of X_merged based on what is needed
X_merged <- X_merged[,mean_std_vars[,1]]

# Using descriptive activity names to name the activities in the data set from the given list of activity labels
colnames(Y_merged) <- "activity"
Y_merged$activitylabel <- factor(Y_merged$activity, labels = as.character(rownames_activity_labels[,2]))
activitylabel <- Y_merged[,-1]

# Appropriately labeling the data set with descriptive variable names from the given list of features
colnames(X_merged) <- colnames_features[mean_std_vars[,1],2]

# From the data set in step 4, creating a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(Sub_merged) <- "subject"
# merging the entire required subset of data columns
total <- cbind(X_merged, activitylabel, Sub_merged)
# computing the mean 
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
# storig the final tidy data into a data table
write.table(total_mean, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
