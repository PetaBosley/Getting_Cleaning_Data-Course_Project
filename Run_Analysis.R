

## Course Project for Coursera / Getting and Cleaning Data
## Created script
## "run_analysis.R"
## 
## Each required task in the project (1 through 5) has been separately coded, where possible,
## within this single script and labelled with the Task number and Title 
## to assist the peer reviewer.


## This code will use the dplyr package, which needs to be installed for 
## reproducible results

## Working Directory confirmed with
## setwd("C:/Users/PetaB/My Documents/Courses/Data Science Specialization/
## Course 3_Getting and Cleaning Data/Working Directory")


library(dplyr)
library(data.table)

## Ensure path for file exists

if (!file.exists("data")) {
        dir.create("data")
}

## Download zip file from supplied web link

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 

#download.file(fileURL, "smartphone.zip" )
download.file(fileURL, destfile = "./data/smartphone.zip")
## Record date of download for reference

dateDownloaded <- date()
dateDownloaded

## Download ends OK 

## Unzip downloaded data

if (!file.exists("UCI HAR Dataset")) {
        unzip("./data/smartphone.zip")
}


## Task 1 / Merge the training and the test sets to create one data set
## Document all folders of UCI HAR Dataset in README file
## Specify folders used there, as well

activity_df <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity_df) <- c("Act_Code","Activity")
features_df <- read.table("./UCI HAR Dataset/features.txt")
colnames(features_df) <- c("Measure_Code","Measurement")

## Read in training data

subject_tr_df <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train_df <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train_df <- read.table("./UCI HAR Dataset/train/y_train.txt")

## Name the columns in x_train_df, using features.txt info

names(x_train_df) <- features_df[, 2]

## Read in test data

subject_tst_df <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test_df <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test_df <- read.table("./UCI HAR Dataset/test/y_test.txt")

## Name the columns in x_test_df, using features.txt info

names(x_test_df) <- features_df[, 2]

## Rename columns for subject_tr_df / subject_tst_df & y_train_df / y_test_df data frames 

colnames(subject_tr_df) <- c("Subject")
colnames(y_train_df) <- c("Act_Code")
colnames(subject_tst_df) <- c("Subject") 
colnames(y_test_df) <- c("Act_Code")

## Extract only the measurements on the mean and standard deviation fields for 
## each measurement - see features_df for source.

results_mean_test_df <- x_test_df[,grepl("mean", colnames(x_test_df))]
results_std_test_df <- x_test_df[,grepl("std", colnames(x_test_df))]

results_mean_train_df <- x_train_df[,grepl("mean", colnames(x_train_df))]
results_std_train_df <- x_train_df[,grepl("std", colnames(x_train_df))]

## Combine training data / test data into individual data frames

training <- cbind(subject_tr_df,  y_train_df, results_mean_train_df, results_std_train_df)
test <- cbind(subject_tst_df, y_test_df, results_mean_test_df, results_std_test_df)


## Merge the data

merged_data <- rbind(training, test)

merged_data2 <- merge(activity_df, merged_data, by="Act_Code") 

## Replace Activity code (Act_Code) with Activity Description (Activity)

## merged_data3 <- select(merged_data2, - Act_Code)

## Task 1 / Complete 

## Task 2 / Extract only the measurements on the mean and standard deviation for 
## each measurement - see features_df for source.
## Extract columns and bind results_mean_df & results_std_df into results_df
 
## Included as part of Task 1


## Task 2 / Complete

## Task 3 / Use descriptive activity names to name the activities in the data set

# Order by Subject 

merged_data3 <- arrange(merged_data2, Subject)

# Remove Act_Code column

merged_data3 <- select(merged_data3, -Act_Code)

## Make Subject first column

md4 <- merged_data3[, c(2,1,3:81)]

## Task 3 / Complete

## Task 4 / Appropriately label the data set with descriptive variable names

md5 <- c("Subject", "Activity",
         "Mean_TimeBodyAccelerateX", "Mean_TimeBodyAccelerateY", "Mean_TimeBodyAccelerateZ",
         "Mean_TimeGravityAccelerateX", "Mean_TimeGravityAccelerateY", 
         "Mean_TimeGravityAccelerateZ",
         "Mean_TimeBodyAccelerateJerkX", "Mean_TimeBodyAccelerateJerkY", 
         "Mean_TimeBodyAccelerateJerkZ",
         "Mean_TimeBodyGyroX", "Mean_TimeBodyGyroY", "Mean_TimeBodyGyroZ",
         "Mean_TimeBodyGyroJerkX", "Mean_TimeBodyGyroJerkY", "Mean_TimeBodyGyroJerkZ",
         "Mean_TimeBodyAccelerateMagnitude",
         "Mean_TimeGravityAccelerateMagnitude",
         "Mean_TimeBodyAccelerateJerkMagnitude",
         "Mean_TimeBodyGyroMagnitude",
         "Mean_TimeBodyGyroJerkMagnitude",
         "Mean_FFTBodyAccelerateX", "Mean_FFTBodyAccelerateY", "Mean_FFTBodyAccelerateZ",
         "MeanFreq_FFTBodyAccelerateX", "MeanFreq_FFTBodyAccelerateY", 
         "MeanFreq_FFTBodyAccelerateZ",
         "Mean_FFTBodyAccelerateJerkX", "Mean_FFTBodyAccelerateJerkY", 
         "Mean_FFTBodyAccelerateJerkZ",
         "MeanFreq_FFTBodyAccelerateJerkX", "MeanFreq_FFTBodyAccelerateJerkY", 
         "MeanFreq_FFTBodyAccelerateJerkZ",
         "Mean_FFTBodyGyroX", "Mean_FFTBodyGyroY", "Mean_FFTBodyGyroZ",
         "MeanFreq_FFTBodyGyroX", "MeanFreq_FFTBodyGyroY", "MeanFreq_FFTBodyGyroZ",
         "Mean_FFTBodyAccelerateMagnitude",
         "MeanFreq_FFTBodyAccelerateMagnitude",
         "Mean_FFTBBodyAccelerateJerkMagnitude",
         "MeanFreq_FFTBBodyAccelerateJerkMagnitude",
         "Mean_FFTBBodyGyroMagnitude",
         "MeanFreq_FFTBBodyGyroMagnitude",
         "Mean_FFTBBodyGyroJerkMagnitude",
         "MeanFreq_FFTBBodyGyroJerkMagnitude",
         "Std_TimeBodyAccelerateX", "Std_TimeBodyAccelerateY", "Std_TimeBodyAccelerateZ",
         "Std_TimeGravityAccelerateX", "Std_TimeGravityAccelerateY", 
         "Std_TimeGravityAccelerateZ",
         "Std_TimeBodyAccelerateJerkX", "Std_TimeBodyAccelerateJerkY", 
         "Std_TimeBodyAccelerateJerkZ",
         "Std_TimeBodyGyroX", "Std_TimeBodyGyroY", "Std_TimeBodyGyroZ",
         "Std_TimeBodyGyroJerkX", "Std_TimeBodyGyroJerkY", "Std_TimeBodyGyroJerkZ",
         "Std_TimeBodyAccelerateMagnitude", 
         "Std_TimeGravityAccelerateMagnitude",
         "Std_TimeBodyAccelerateJerkMagnitude",
         "Std_TimeBodyGyroMagnitude",
         "Std_TimeBodyGyroJerkMagnitude",
         "Std_FFTBodyAccelerateX", "Std_FFTBodyAccelerateY", "Std_FFTBodyAccelerateZ",
         "Std_FFTBodyAccelerateJerkX", "Std_FFTBodyAccelerateJerkY", "Std_FFTBodyAccelerateJerkZ",
         "Std_FFTBodyGyroX", "Std_FFTBodyGyroY", "Std_FFTBodyGyroZ",
         "Std_FFTBodyAccelerateMagnitude",
         "Std_FFTBBodyAccelerateJerkMagnitude",
         "Std_FFTBBodyGyroMagnitude",
         "Std_FFTBBodyGyroJerkMagnitude")

colnames(md4) <- md5

## Task 4 / Complete

## Task 5 / From the data set in step 4, create a second, independent tidy data set 
## with the average of each variable for each activity and each subject
## Convert data frame to table to make this easy

md4_table <- tbl_df(md4)
by_subject <- arrange(md4_table, Subject, Activity)
group_table <- group_by(by_subject, Subject, Activity)
tidy_dataset <- summarise(group_table,
                  Mean_TimeBodyAccelerateX = mean(Mean_TimeBodyAccelerateX), 
                  Mean_TimeBodyAccelerateY = mean(Mean_TimeBodyAccelerateY),
                  Mean_TimeBodyAccelerateZ = mean(Mean_TimeBodyAccelerateZ), 
                  Mean_TimeGravityAccelerateX = mean(Mean_TimeGravityAccelerateX),
                  Mean_TimeGravityAccelerateY = mean(Mean_TimeGravityAccelerateY), 
                  Mean_TimeGravityAccelerateZ = mean(Mean_TimeGravityAccelerateZ), 
                  Mean_TimeBodyAccelerateJerkX = mean(Mean_TimeBodyAccelerateJerkX),
                  Mean_TimeBodyAccelerateJerkY = mean(Mean_TimeBodyAccelerateJerkY), 
                  Mean_TimeBodyAccelerateJerkZ = mean(Mean_TimeBodyAccelerateJerkZ), 
                  Mean_TimeBodyGyroX = mean(Mean_TimeBodyGyroX),
                  Mean_TimeBodyGyroY = mean(Mean_TimeBodyGyroY), 
                  Mean_TimeBodyGyroZ = mean(Mean_TimeBodyGyroZ), 
                  Mean_TimeBodyGyroJerkX = mean(Mean_TimeBodyGyroJerkX), 
                  Mean_TimeBodyGyroJerkY = mean(Mean_TimeBodyGyroJerkY),
                  Mean_TimeBodyGyroJerkZ = mean(Mean_TimeBodyGyroJerkZ),
                  Mean_TimeBodyAccelerateMagnitude = mean(Mean_TimeBodyAccelerateMagnitude), 
                  Mean_TimeGravityAccelerateMagnitude = mean(Mean_TimeGravityAccelerateMagnitude),
                  Mean_TimeBodyAccelerateJerkMagnitude = mean(Mean_TimeBodyAccelerateJerkMagnitude), 
                  Mean_TimeBodyGyroMagnitude = mean(Mean_TimeBodyGyroMagnitude),
                  Mean_TimeBodyGyroJerkMagnitude = mean(Mean_TimeBodyGyroJerkMagnitude),
                  Mean_FFTBodyAccelerateX = mean(Mean_FFTBodyAccelerateX),
                  Mean_FFTBodyAccelerateY = mean(Mean_FFTBodyAccelerateY),                  
                  Mean_FFTBodyAccelerateZ = mean(Mean_FFTBodyAccelerateZ), 
                  MeanFreq_FFTBodyAccelerateX = mean(MeanFreq_FFTBodyAccelerateX), 
                  MeanFreq_FFTBodyAccelerateY = mean(MeanFreq_FFTBodyAccelerateY),
                  MeanFreq_FFTBodyAccelerateZ = mean(MeanFreq_FFTBodyAccelerateZ),
                  Mean_FFTBodyAccelerateJerkX = mean(Mean_FFTBodyAccelerateJerkX),
                  Mean_FFTBodyAccelerateJerkY = mean(Mean_FFTBodyAccelerateJerkY),
                  Mean_FFTBodyAccelerateJerkZ = mean(Mean_FFTBodyAccelerateJerkZ),
                  MeanFreq_FFTBodyAccelerateJerkX = mean(MeanFreq_FFTBodyAccelerateJerkX),
                  MeanFreq_FFTBodyAccelerateJerkY = mean(MeanFreq_FFTBodyAccelerateJerkY),
                  MeanFreq_FFTBodyAccelerateJerkZ = mean(MeanFreq_FFTBodyAccelerateJerkZ), 
                  Mean_FFTBodyGyroX = mean(Mean_FFTBodyGyroX),
                  Mean_FFTBodyGyroY = mean(Mean_FFTBodyGyroY),
                  Mean_FFTBodyGyroZ = mean(Mean_FFTBodyGyroZ),
                  MeanFreq_FFTBodyGyroX = mean(MeanFreq_FFTBodyGyroX), 
                  MeanFreq_FFTBodyGyroY = mean(MeanFreq_FFTBodyGyroY),
                  MeanFreq_FFTBodyGyroZ = mean(MeanFreq_FFTBodyGyroZ),
                  Mean_FFTBodyAccelerateMagnitude = mean(Mean_FFTBodyAccelerateMagnitude), 
                  MeanFreq_FFTBodyAccelerateMagnitude = mean(MeanFreq_FFTBodyAccelerateMagnitude),
                  Mean_FFTBBodyAccelerateJerkMagnitude = mean(Mean_FFTBBodyAccelerateJerkMagnitude), 
                  MeanFreq_FFTBBodyAccelerateJerkMagnitude = mean(MeanFreq_FFTBBodyAccelerateJerkMagnitude),
                  Mean_FFTBBodyGyroMagnitude = mean(Mean_FFTBBodyGyroMagnitude),
                  MeanFreq_FFTBBodyGyroMagnitude = mean(Mean_FFTBBodyGyroMagnitude),
                  Mean_FFTBBodyGyroJerkMagnitude = mean(Mean_FFTBBodyGyroJerkMagnitude), 
                  MeanFreq_FFTBBodyGyroJerkMagnitude = mean(MeanFreq_FFTBBodyGyroJerkMagnitude),
                  Std_TimeBodyAccelerateX = mean(Std_TimeBodyAccelerateX),
                  Std_TimeBodyAccelerateY = mean(Std_TimeBodyAccelerateY), 
                  Std_TimeBodyAccelerateZ = mean(Std_TimeBodyAccelerateZ), 
                  Std_TimeGravityAccelerateX = mean(Std_TimeGravityAccelerateX), 
                  Std_TimeGravityAccelerateY = mean(Std_TimeGravityAccelerateY),
                  Std_TimeGravityAccelerateZ = mean(Std_TimeGravityAccelerateZ),
                  Std_TimeBodyAccelerateJerkX = mean(Std_TimeBodyAccelerateJerkX),
                  Std_TimeBodyAccelerateJerkY = mean(Std_TimeBodyAccelerateJerkY),
                  Std_TimeBodyAccelerateJerkZ = mean(Std_TimeBodyAccelerateJerkZ),
                  Std_TimeBodyGyroX = mean(Std_TimeBodyGyroX), 
                  Std_TimeBodyGyroY = mean(Std_TimeBodyGyroY), 
                  Std_TimeBodyGyroZ = mean(Std_TimeBodyGyroZ), 
                  Std_TimeBodyGyroJerkX = mean(Std_TimeBodyGyroJerkX), 
                  Std_TimeBodyGyroJerkY = mean(Std_TimeBodyGyroJerkY), 
                  Std_TimeBodyGyroJerkZ = mean(Std_TimeBodyGyroJerkZ),
                  Std_TimeBodyAccelerateMagnitude = mean(Std_TimeBodyAccelerateMagnitude), 
                  Std_TimeGravityAccelerateMagnitude = mean(Std_TimeGravityAccelerateMagnitude),
                  Std_TimeBodyAccelerateJerkMagnitude = mean(Std_TimeBodyAccelerateJerkMagnitude), 
                  Std_TimeBodyGyroMagnitude = mean(Std_TimeBodyGyroMagnitude),
                  Std_TimeBodyGyroJerkMagnitude = mean(Std_TimeBodyGyroJerkMagnitude),
                  Std_FFTBodyAccelerateX = mean(Std_FFTBodyAccelerateX), 
                  Std_FFTBodyAccelerateY = mean(Std_FFTBodyAccelerateY),
                  Std_FFTBodyAccelerateZ = mean(Std_FFTBodyAccelerateZ),
                  Std_FFTBodyAccelerateJerkX =mean(Std_FFTBodyAccelerateJerkX), 
                  Std_FFTBodyAccelerateJerkY =mean(Std_FFTBodyAccelerateJerkY),
                  Std_FFTBodyAccelerateJerkZ =mean(Std_FFTBodyAccelerateJerkZ),
                  Std_FFTBodyGyroX = mean(Std_FFTBodyGyroX), 
                  Std_FFTBodyGyroY = mean(Std_FFTBodyGyroY),
                  Std_FFTBodyGyroZ = mean(Std_FFTBodyGyroZ),
                  Std_FFTBodyAccelerateMagnitude = mean(Std_FFTBodyAccelerateMagnitude), 
                  Std_FFTBBodyAccelerateJerkMagnitude = mean(Std_FFTBBodyAccelerateJerkMagnitude),
                  Std_FFTBBodyGyroMagnitude = mean(Std_FFTBBodyGyroMagnitude), 
                  Std_FFTBBodyGyroJerkMagnitude = mean(Std_FFTBBodyGyroJerkMagnitude))

## The following statement was used to create the txt file output for submission to Github
## and is included here for completeness

write.table(tidy_dataset, file = "tidy_dataset.txt", row.names=FALSE)

## Task 5 / Complete
