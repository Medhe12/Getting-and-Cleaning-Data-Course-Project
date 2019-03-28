# Getting and Cleaning Data Project CodeBook

Author: Medha Sawhney
Date: "29.03.2019" 
Output: "tidydata.txt""

## CodeBook

This code book modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information. 
The final summary output tidy dataset "tidydata.txt" contains the average of each variable for each activity and each subject
from the Human Activity Recognition Using Smartphones Data Set.



## Human Activity Recognition Using Smartphones Data Set 
### Source Data
Data and Description can be found here [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Abstract

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.




| | |
|  |  |
| **Data Set Characteristics:  **| Multivariate, Time-Series|	
| **Attribute Characteristics:**| N/A|
| **Associated Tasks:**| Classification, Clustering|
| **Number of Instances:**| 10299|
| **Number of Attributes:**| 561  |
| **Missing Values?:**| N/A |
| **Area:**| Computer|

| **Date Donated:**| 2012-12-10|

| **Number of Web Hits:**| 794361|


### Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 



### Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


# Summary for tidydata.txt and run_analysis.R

**Input** : UCI HAR Dataset downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

**Output** : tidydata.txt

## Pre-Processing steps performed on Raw Data:

 1. Merge the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names.
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



## 1. MERGING TRAINING & TESTING DATA-SETS

The train and test text files were imported and merged.
Column names were assigned at the time each file was imported, before merging. 
All the files were imported individually such as, Train_X, Test_X, etc. Files were individually stored as data tables for X, Y and Subjects before merging. 
The test and train versions of all files were merged together before merging the entire data set together. 
The features and activity_labels files were assigned and merged later.

###Text Files Imported:

- 'features.txt'
- 'activity_labels.txt'
- 'subject_train.txt'
- 'x_train.txt'
- 'y_train.txt'
- 'subject_test.txt'
- 'x_test.txt'
- 'y_test.txt'

##2. EXTRACTING MEASUREMENTS ON MEAN & STANDARD DEVIATION
A logical vector was created identifying TRUE for the ID, mean & stdev columns and FALSE for other values. Merged data was then subsetted to only keep the relevant columns

##3. RENAME ACTIVITIES IN DATA SET WITH DESCRIPTIVE ACTIVITY NAMES
Values in 'activity' column were replaced with the matching values from the 'activitylabel' column in order to make the data easier to read.

##4. APPROPRIATELY LABEL DATA SET WITH DESCRIPTIVE ACTIVITY NAMES
Added the column names for merged X train and test data sets, by only adding feature variables for mean and std data.

##5. INDEPENDNENT TIDY DATA SET CREATED WITH AVERAGE FOR EACH VARIABLE & EACH SUBJECT
New table was created which contains average for each variable for each activity and subject.

# Tidy data set description

### The variables in the tidy data
Tidy data contains 180 rows and 68 columns. Each row has averaged variables for each subject and each activity.

### Only all the variables estimated from mean and standard deviation in the tidy set were kept.

* mean(): Mean value
* std(): Standard deviation

### The data were averaged based on subject and activity group.

Subject column is numbered sequentially from 1 to 30.
Activity column has 6 types as listed below.
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING


# Measurements of the tidy dataset

1."activitylabel"

2."subject"

3."tBodyAcc-mean()-X"

4."tBodyAcc-mean()-Y"

5."tBodyAcc-mean()-Z"

6."tBodyAcc-std()-X"

7."tBodyAcc-std()-Y"

8."tBodyAcc-std()-Z"

9."tGravityAcc-mean()-X"

10."tGravityAcc-mean()-Y"

11."tGravityAcc-mean()-Z"

12."tGravityAcc-std()-X"

13."tGravityAcc-std()-Y"

14."tGravityAcc-std()-Z"

15."tBodyAccJerk-mean()-X"

16."tBodyAccJerk-mean()-Y"

17."tBodyAccJerk-mean()-Z"

18."tBodyAccJerk-std()-X"

19."tBodyAccJerk-std()-Y"

20."tBodyAccJerk-std()-Z"

21."tBodyGyro-mean()-X"

22."tBodyGyro-mean()-Y"

23."tBodyGyro-mean()-Z"

24."tBodyGyro-std()-X"

25."tBodyGyro-std()-Y"

26."tBodyGyro-std()-Z"

27."tBodyGyroJerk-mean()-X"

28."tBodyGyroJerk-mean()-Y"

29."tBodyGyroJerk-mean()-Z"

30."tBodyGyroJerk-std()-X"

31."tBodyGyroJerk-std()-Y"

32."tBodyGyroJerk-std()-Z"

33."tBodyAccMag-mean()"

34."tBodyAccMag-std()"

35."tGravityAccMag-mean()"

36."tGravityAccMag-std()"

37."tBodyAccJerkMag-mean()"

38."tBodyAccJerkMag-std()"

39."tBodyGyroMag-mean()"

40."tBodyGyroMag-std()"

41."tBodyGyroJerkMag-mean()"

42."tBodyGyroJerkMag-std()"

43."fBodyAcc-mean()-X"

44."fBodyAcc-mean()-Y"

45."fBodyAcc-mean()-Z"

46."fBodyAcc-std()-X"

47."fBodyAcc-std()-Y"

48."fBodyAcc-std()-Z"

49."fBodyAccJerk-mean()-X"

50."fBodyAccJerk-mean()-Y"

51."fBodyAccJerk-mean()-Z"

52."fBodyAccJerk-std()-X"

53."fBodyAccJerk-std()-Y"

54."fBodyAccJerk-std()-Z"

55."fBodyGyro-mean()-X"

56."fBodyGyro-mean()-Y"

57."fBodyGyro-mean()-Z"

58."fBodyGyro-std()-X"

59."fBodyGyro-std()-Y"

60."fBodyGyro-std()-Z"

61."fBodyAccMag-mean()"

62."fBodyAccMag-std()"

63."fBodyBodyAccJerkMag-mean()"

64."fBodyBodyAccJerkMag-std()"

65."fBodyBodyGyroMag-mean()"

66."fBodyBodyGyroMag-std()"

67."fBodyBodyGyroJerkMag-mean()"

68."fBodyBodyGyroJerkMag-std()"



