File with R code "run_analysis.R" perform 5 following steps:

Per course requirement the CodeBook needs to contain following information:
A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

Varibales:
file_url : Stores the URL of source location
x_train : Triaining Data loaded from "UCI HAR Dataset/train/X_train.txt"
y_train : Triaining Data loaded from "UCI HAR Dataset/train/Y_train.txt"
subject_train : Triaining Data loaded from  "UCI HAR Dataset/train/subject_train.txt"
x_test : Testing Data loaded from "UCI HAR Dataset/train/X_test.txt"
y_test : Testing Data loaded from "UCI HAR Dataset/train/Y_test.txt"
subject_test : Testing Data loaded from  "UCI HAR Dataset/train/subject_test.txt"
features : Features set loaded from "UCI HAR Dataset/features.txt"
activity_labels : Activity labels loaded from "UCI HAR Dataset/activity_labels.txt"
merge_train : All training data merged together (y_train, subject_train, x_train)
merge_test : All testing data merged together (y_test, subject_test, x_test)
merged_dataset : Both training and testing data merged together (merge_train, merge_test)
column_names : Extracted coulmn names of merged_dataset
mean_and_std : add mean and standard deviation columns
merged_data_with_activity_names : merge mean and standard deviation data with activity labels data
final_tidy_data : Final output

Data:
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Information provided by the authors: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Transformations Applied:
I) Merging the training and the test sets 1 Reading files
  1) Reading trainings tables
  2) Reading testing tables
  3) Reading feature vector
  4) Reading activity labels
  5) Assigning column names
  6) Merging all data in one set
II) Extracting only the measurements on the mean and standard deviation for each measurement
  1) Reading column names
  2) Create vector for defining ID, mean and standard deviation
  3) Making nessesary subset from setAllInOne
III) Using descriptive activity names to name the activities in the data set
IV) Labeling the data set with descriptive variable names
V) Creating a Final tidy data set with the average of each variable for each activity and each subject
