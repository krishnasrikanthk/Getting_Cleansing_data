---
title: "README.md"
author: "Srikanth.Kappagantula"
date: "Sunday, April 26, 2015"
output: html_document
---

##     Program Description

The purpose of the program (run_analysis.R) is to download and identify the raw dataset from the specified URL, but a final tidy data set which can be used for further analysis. The run_analysis.R performs the following functions

### Download & Unzip Files
* download 'FUCI HAR Dataset.zip' if not previously downloaded from URL defined in requirements
* unzip the file into 'FUCI HAR Dataset' folder if not previously unzipped

### Initiate File Locations

* Initiate the directory variables and read directory path for test, train and subject data sets
* Initiate the file location variables and read file locations for test, train and subject data sets
* Initiate the file location variables and read file locations of Inertial Signals for test and train data sets. these variables are not currently used in the program
* Initiate variables to read column features, data labels (of data sets), activity labels and subjects

### Merge Data

* the program merges test and train data labels using rbind and build 1 data set
* Assign Column Names of data labels from the col.activity_labels variable
* the program merges test and train subject data sets using rbind and build 1 data set
* Assign Column Names of data labels from the col.Subjects variable
* the program merges test and train data sets using rbind and build 1 data set
* Assign Column Names of data labels from the col.data_labels variable
* Merge the above data sets (data labels,subjects & data sets) and forms a final data set

### Extract Mean & STD Measurements

* prepare a vector of columns in data labels which has Activity, Subject, Mean, std as part of their column names using grep operator
* extract the data from the above data set and prepare a new data set

### Uses descriptive activity names

* Assign descriptive activity names to the data set and merge the data with the activity_labels using mergedata operator from dplyr package

### Appropriately label with descriptive variable names

* use descriptive.var_names variable to replace std with Standard Deviation, mean with Mean, ^t with Time, etc respectively
* gsub operator is used to perform the replacement of column names

### Create Tidy Data Set

* A Tidy data set is created using 'aggregate operator' with verage of each variable for each activity and each subject
* the the data set created is saved as a tidy_data.txt file


##     CodeBook Variables

### File Locations

* url - The URL of the FUCI HAR Dataset.zip 
* zip_file - The name of the zip file after being downloaded into the PC
      
####    define directory paths
      
* dir.train - directory of the train data files location
* dir.test - directory of the test data files location
* dir.inertial_signals - directory of the Inertial Signals files location
      
####    Directories to hold test and train data
* dir.data - Data Directory
* dir.separator - Directory Separator
* dir.train.data - Train Data Set Directory
* dir.test.data - Test Data Set Directory
* dir.train.inertial_signals - Intertial Signals Train Data Set Directory
* dir.test.inertial_signals - Intertial Signals Test Data Set Directory
      
####    File locations of supportive data
      
* file_loc.activity_labels - file location of activity labels
* file_loc.features - file location of features
* file_loc.features_info - file location of features info
* file_loc.readme - file location of Read Me file
      
####    File Locations of Data Sets

#####    training data file locations     

* file_loc.train_data_labels - file location of train data labels
* file_loc.train_data_set - file location of train data set
* file_loc.train_subject_set- file location of train subject data set

#####    test data file locations     

* file_loc.test_data_labels - file location of test data labels
* file_loc.test_data_set - file location of test data set
* file_loc.test_subject_set - file location of test data set
      
####    File Locations of Inertial Signals
      
#####    training data for Inertial Signals file locations     

* file_loc.IS_body_acc_x_train -The body acceleration signal obtained by subtracting the gravity from the total acceleration for train data set
* file_loc.IS_body_acc_y_train - The body acceleration signal obtained by subtracting the gravity from the total acceleration for train data set
* file_loc.IS_body_acc_z_train - The body acceleration signal obtained by subtracting the gravity from the total acceleration for train data set
* file_loc.IS_body_gyro_x_train - The angular velocity vector measured by the gyroscope for each window sample for train data set
* file_loc.IS_body_gyro_y_train - The angular velocity vector measured by the gyroscope for each window sample for train data set
* file_loc.IS_body_gyro_z_train - The angular velocity vector measured by the gyroscope for each window sample for train data set
* file_loc.IS_total_acc_x_train - The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g' for train data set
* file_loc.IS_total_acc_y_train - The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g' for train data set
* file_loc.IS_total_acc_z_train - The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g' for train data set

#####    test data for Inertial Signals file locations    
      
* file_loc.IS_body_acc_x_test - The body acceleration signal obtained by subtracting the gravity from the total acceleration for test data
* file_loc.IS_body_acc_y_test - The body acceleration signal obtained by subtracting the gravity from the total acceleration for test data
* file_loc.IS_body_acc_z_test - The body acceleration signal obtained by subtracting the gravity from the total acceleration for test data
* file_loc.IS_body_gyro_x_test - The angular velocity vector measured by the gyroscope for each window sample for test data
* file_loc.IS_body_gyro_y_test - The angular velocity vector measured by the gyroscope for each window sample for test data
* file_loc.IS_body_gyro_z_test -  The angular velocity vector measured by the gyroscope for each window sample for test data
* file_loc.IS_total_acc_x_test - The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g' for test data
* file_loc.IS_total_acc_y_test - The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g' for test data
* file_loc.IS_total_acc_z_test - The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g' for test data

###    Other Variables
      
* col.features - A vector of features
* col.data_labels - A vector of data labels
* col.activity_labels - A vector of activity labels
* col.subjects - A vector of subject label
* descriptive.var_names - a data frame with shortnames ad full names to replace for columns
* file.tidy_data_set -  name of the tidy dataset file
