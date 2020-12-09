## Copied from the course assignment: 
## Peer-graded Assignment: Getting and Cleaning Data Course Project
## The goal is to prepare tidy data that can be used for later analysis. The dataset
## used represent data collected from the accelerometers from the Samsung Galaxy S
## smartphone and is downloaded from the "url" below.

## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each 
## measurement.
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names.
## From the data set in step 4, creates a second, independent tidy data set with
## the average of each variable for each activity and each subject.


# Download the data for the course project
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- "./data/HAR.zip"  # includes destination directory
download.file(url,destfile)
dateDownloaded <- date()
dateDownloaded  # "Mon Nov 30 00:02:21 2020"

# manually unzipped the file."UCI HAR Dataset" is the name of the unzipped folder

# reading test labels
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/x_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
# reading train labels
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
x_train <- read.table("./data/UCI HAR Dataset/train/x_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

## 1 ## Merges the training and the test sets to create one data set.
# binding y_test (activity) & subject_test (subject's ID) to x_test table (test set)
x_test<- cbind(subject_test,y_test, x_test) 
# binding y_train (activity) & subject_train (subject's ID) to x_train table (train set)
x_train<- cbind(subject_train,y_train, x_train) 
## combining the test and train data sets to form one dataset
data <- rbind(x_test,x_train)


## 2 ## Extracts only the measurements on the mean and stv for each measurement 
destfile_features <- "./data/UCI HAR Dataset/features.txt"
variables<- read.table(destfile_features) # extracts variable names
variables <- as.vector(variables[,2])  # transforms the data needed to a vector
rel<- grepl("(.*)mean|std(.*)", variables) # returns a logical vector
variables <- variables[rel] # returns the variable names that include "mean" or "std"
# subsetting the dataset to include only the measurements on the mean and stv
# TRUEs concatenated to keep the added "subject" and "activity" columns in step 1
data <- data[,c(TRUE,TRUE,rel)]   
# renaming the subseted data with the variable names extracted from "features.txt"
names(data) <- c("volunteerID","activity",variables)


## 3## Uses descriptive activity names to name the activities in the data set
# getting activity names
destfile_activity_labels <- "./data/UCI HAR Dataset/activity_labels.txt"
activity_labels <- read.table(destfile_activity_labels, header=F, sep="")
data$activity <- tolower(activity_labels$V2[data$activity]) # changing to lower case


## 4 ## Appropriately labels the data set with descriptive variable names
names <- names(data)
names <- gsub("^(t|f)BodyBody.*?", "\\1Body", names)
names <- gsub("^(t|f)(.*)-(X|Y|Z)?", "\\1\\3\\2", names)
names <- gsub("^([ft])(.*)?", "\\2\\1", names)
names <- gsub("\\(\\)|-","", names)
names <- gsub("mean", "Mean", names)
names <- gsub("std", "Std", names)
names <- gsub("(.*)f$", "\\1-Fdomain", names)
names <- gsub("(.*)t$", "\\1-Tdomain", names)
names(data) <- names


## 5 ## From the data set in step 4, creates a second, independent tidy data set with
## the average of each variable for each activity and each subject.
library(tidyverse)
tidy_data <- data %>% group_by(volunteerID,activity) %>% summarise_all(.funs=mean)
means_names<- sapply(names(tidy_data)[3:81],function(x)gsub("-","Avrg",x))
names(tidy_data)[3:81] <- means_names
# saves file to working directory
write.table(tidy_data, file="./data/tidy_data.txt", row.names = F)


