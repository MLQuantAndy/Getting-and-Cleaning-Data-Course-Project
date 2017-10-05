## install required libraries
install.packages("reshape2")

## Load the dependencies
library("reshape2")

######################################
##Step1: Download and unzip the data
######################################
if(!file.exists("./data")){dir.create("./data")}
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file_url,destfile="./data/Dataset.zip")

# Unzip dataSet to /data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")

######################################
##Step2: Merges the training and the test sets to create one data set.
######################################
# Read training data
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Read testing data
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Read features
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Read labels:
activity_labels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# Assign Column Names
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activity_labels) <- c('activityId','activityType')

#Merge the data 
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
merged_dataset <- rbind(merge_train, merge_test)

######################################
##Step2: Extracts only the measurements on the mean and standard deviation for each measurement.
######################################
column_names <- colnames(merged_dataset)
mean_and_std <- (grepl("activityId" , column_names) | 
                   grepl("subjectId" , column_names) | 
                   grepl("mean.." , column_names) | 
                   grepl("std.." , column_names) 
)

set_mean_std <- merged_dataset[ , mean_and_std == TRUE]

merged_data_with_activity_names <- merge(set_mean_std, activity_labels,
                              by='activityId',
                              all.x=TRUE)

######################################
##Step2: Create Final Tidy Dataset
######################################
final_tidy_data <- aggregate(. ~subjectId + activityId, merged_data_with_activity_names, mean)
final_tidy_data <- final_tidy_data[order(final_tidy_data$subjectId, final_tidy_data$activityId),]

#Cleaning the column names
names(final_tidy_data) <- gsub(x = names(final_tidy_data), pattern = "\\()", replacement = "")  

write.table(final_tidy_data, "final_tidy_data.txt", row.name=FALSE)