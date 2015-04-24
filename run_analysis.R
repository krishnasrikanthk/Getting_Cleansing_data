##    Getting and Cleansing Data Project

##    Author : Srikanth Kappagantula
##    Date : 24-Apr-2015
##    For each record it is provided:
##    ======================================
      
##    - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
##    - Triaxial Angular velocity from the gyroscope. 
##    - A 561-feature vector with time and frequency domain variables. 
##    - Its activity label. 
##    - An identifier of the subject who carried out the experiment.


##    download files if not previously downloaded from URL defined below
      
      #setwd("C:\\Users\\kappagan\\Learning\\Coursera\\Assignments\\Getting_Cleansing_data")
      setwd("C:\\Users\\kappagan\\Documents\\Getting_Cleansing_data")
      url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      zip_file <- "FUCI.zip"
      if(!file.exists(zip_file)){
            download.file(url, zip_file)
      }      
      
##    define files & locations
      
      dir.train <- "train"
      dir.test <- "test"
      dir.inertial_signals <- "Inertial Signals"
      
##    Directories to hold test and train data
      dir.data <- "UCI HAR Dataset" # Data Directory
      dir.separator <- "/"
      dir.train.data <- paste(dir.data,dir.train,sep = dir.separator) # Train Data Set Directory
      dir.test.data <- paste(dir.data,dir.test,sep = dir.separator) # Test Data Set Directory
      dir.train.inertial_signals <- paste(dir.train.data,dir.inertial_signals,sep=dir.separator)
      dir.test.inertial_signals <- paste(dir.test.data,dir.inertial_signals,sep=dir.separator)
      
##    unzip file
      if(!file.exists(dir.data)){
            unzip (zip_file)
      }

##    File locations of supportive data
      
      file_loc.activity_labels <- paste(dir.data,"activity_labels.txt",sep = dir.separator) # file location of activity labels
      file_loc.features <- paste(dir.data,"features.txt",sep = dir.separator) # file location of features
      file_loc.features_info <- paste(dir.data,"features_info.txt",sep = dir.separator) # file location of features info
      file_loc.readme <- paste(dir.data,"README.txt",sep = dir.separator) # file location of Read Me file
      
##    File Locations of Data Sets

##    training data file locations     

      file_loc.train_data_labels<-paste(dir.train.data,"y_train.txt", sep=dir.separator)
      file_loc.train_data_set<-paste(dir.train.data,"X_train.txt", sep=dir.separator)
      file_loc.train_subject_set<-paste(dir.train.data,"subject_train.txt", sep=dir.separator)

##    test data file locations     

      file_loc.test_data_labels<-paste(dir.test.data,"y_test.txt", sep=dir.separator)
      file_loc.test_data_set<-paste(dir.test.data,"X_test.txt", sep=dir.separator)
      file_loc.test_subject_set<-paste(dir.test.data,"subject_test.txt", sep=dir.separator)
      
##    File Locations of Inertial Signals
      
##    training data for Inertial Signals file locations     
      file_loc.IS_body_acc_x_train<- paste(dir.train.inertial_signals,"body_acc_x_train.txt",sep = dir.separator) ## The body acceleration signal obtained by subtracting the gravity from the total acceleration
      file_loc.IS_body_acc_y_train<- paste(dir.train.inertial_signals,"body_acc_y_train.txt",sep = dir.separator) ## The body acceleration signal obtained by subtracting the gravity from the total acceleration
      file_loc.IS_body_acc_z_train<- paste(dir.train.inertial_signals,"body_acc_z_train.txt",sep = dir.separator) ## The body acceleration signal obtained by subtracting the gravity from the total acceleration
      file_loc.IS_body_gyro_x_train<- paste(dir.train.inertial_signals,"body_gyro_x_train.txt",sep = dir.separator) ## The angular velocity vector measured by the gyroscope for each window sample
      file_loc.IS_body_gyro_y_train<- paste(dir.train.inertial_signals,"body_gyro_y_train.txt",sep = dir.separator) ## The angular velocity vector measured by the gyroscope for each window sample
      file_loc.IS_body_gyro_z_train<- paste(dir.train.inertial_signals,"body_gyro_z_train.txt",sep = dir.separator) ## The angular velocity vector measured by the gyroscope for each window sample
      file_loc.IS_total_acc_x_train<- paste(dir.train.inertial_signals,"total_acc_x_train.txt",sep = dir.separator) ## The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'.
      file_loc.IS_total_acc_y_train<- paste(dir.train.inertial_signals,"total_acc_y_train.txt",sep = dir.separator) ## The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
      file_loc.IS_total_acc_z_train<- paste(dir.train.inertial_signals,"total_acc_z_train.txt",sep = dir.separator) ## The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 

##    test data for Inertial Signals file locations    
      
      file_loc.IS_body_acc_x_test<- paste(dir.test.inertial_signals,"body_acc_x_test.txt",sep = dir.separator) ## The body acceleration signal obtained by subtracting the gravity from the total acceleration
      file_loc.IS_body_acc_y_test<- paste(dir.test.inertial_signals,"body_acc_y_test.txt",sep = dir.separator) ## The body acceleration signal obtained by subtracting the gravity from the total acceleration
      file_loc.IS_body_acc_z_test<- paste(dir.test.inertial_signals,"body_acc_z_test.txt",sep = dir.separator) ## The body acceleration signal obtained by subtracting the gravity from the total acceleration
      file_loc.IS_body_gyro_x_test<- paste(dir.test.inertial_signals,"body_gyro_x_test.txt",sep = dir.separator) ## The angular velocity vector measured by the gyroscope for each window sample
      file_loc.IS_body_gyro_y_test<- paste(dir.test.inertial_signals,"body_gyro_y_test.txt",sep = dir.separator) ## The angular velocity vector measured by the gyroscope for each window sample
      file_loc.IS_body_gyro_z_test<- paste(dir.test.inertial_signals,"body_gyro_z_test.txt",sep = dir.separator) ## The angular velocity vector measured by the gyroscope for each window sample
      file_loc.IS_total_acc_x_test<- paste(dir.test.inertial_signals,"total_acc_x_test.txt",sep = dir.separator) ## The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
      file_loc.IS_total_acc_y_test<- paste(dir.test.inertial_signals,"total_acc_y_test.txt",sep = dir.separator) ## The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
      file_loc.IS_total_acc_z_test<- paste(dir.test.inertial_signals,"total_acc_z_test.txt",sep = dir.separator) ## The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 

##    read test and train datasets
      
      col.features <- c("Signal_ID","Signal")
      col.data_labels = c("Activity_ID")
      col.activity_labels <- c("Activity_ID","Activity") 
      col.subjects <- c("Subject")
      features<- read.table(file_loc.features) # holds various features captured
      colnames(features) <-   col.features    
      activity_labels<- read.table(file_loc.activity_labels) #holds various activities
      colnames(activity_labels) <-   col.activity_labels    
      df.train_data_labels <- read.table(file_loc.train_data_labels)
      df.train_data_set <- read.table(file_loc.train_data_set)
      df.train_subject_set <- read.table(file_loc.train_subject_set)
      df.test_data_labels <- read.table(file_loc.test_data_labels)
      df.test_data_set <- read.table(file_loc.test_data_set)
      df.test_subject_set <- read.table(file_loc.test_subject_set)
      
##    Merges the training and the test sets to create one data set.

      df_data_labels <- rbind(df.train_data_labels,df.test_data_labels)
      colnames(df_data_labels) <- col.data_labels
      df_subject_set <- rbind(df.train_subject_set,df.test_subject_set)
      colnames(df_subject_set) <- col.subjects
      df_data_set <- rbind(df.train_data_set,df.test_data_set)
      colnames(df_data_set) <- features[,2]
      data_set<- cbind(df_data_labels,df_subject_set,df_data_set) # Target data set
##    colnames(data_set) - validation of output

##    Extracts only the measurements on the mean and standard deviation for each measurement. Activity ID and Subject ID is also retrieved
      
      col.Names <- colnames(data_set)
      col.Names.match <- grepl("Activity",col.Names) |grepl("Subject",col.Names) |grepl("mean",col.Names) | grepl("std",col.Names)
      data_set_mean_std <- data_set[col.Names.match]
##    colnames(data_set_mean_std) - validation of output

##    Uses descriptive activity names to name the activities in the data set
      
      library(dplyr)
      data_set_descriptive<- merge(activity_labels,data_set_mean_std, by.x="Activity_ID", by.y="Activity_ID")
##    head(data_set_descriptive[1:5,1:10]) ## - validation of output

##    Appropriately labels the data set with descriptive variable names. 
      
      descriptive.var_names <- data.frame(short_name = c("^t","^f","Acc","Gyro","Mag","BodyBody","std","-"),full_name=c("Time","Frequency","Accelerometer","GyroMeter","Magnitude","Body","Standard_Deviation","_")) 
      for(i in 1:nrow(descriptive.var_names)){
            names(data_set_descriptive)<- gsub(descriptive.var_names$short_name[i],descriptive.var_names$full_name[i],names(data_set_descriptive)) 
      }
##    colnames(data_set_descriptive) - validation of output

##    From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.

      agg_data_set<- aggregate(data_set_descriptive[4:82], 
                               by=list(Activity=data_set_descriptive$Activity,
                                       Subject= data_set_descriptive$Subject), 
                                                                                    mean)
      
##    head(agg_data_set,5) - validation of output
