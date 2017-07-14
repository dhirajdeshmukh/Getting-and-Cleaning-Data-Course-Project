Sys.Date()
Sys.getenv("USERNAME")
getwd()
setwd('C:/DataScience/Course 3 Project/UCI HAR Dataset')
getwd()

# 1. Merges the training and the test sets to create one data set.

  # Read all data files from dir 
  # Reading Training tables
  x_train <- read.table("train/X_train.txt")
  y_train <- read.table("train/y_train.txt")
  subject_train <- read.table("train/subject_train.txt")

  # Reading testing tables
  x_test <- read.table("test/X_test.txt")
  y_test <- read.table("test/y_test.txt")
  subject_test <- read.table("test/subject_test.txt")

  # Reading feature data
  features <- read.table("features.txt")

  # Reading activity labels:
  activity_labels <- read.table("activity_labels.txt")


  # assign column names so it can be used later on 
  colnames(x_train) <- features[,2] 
  colnames(y_train) <-"activityid"
  colnames(subject_train) <- "subjectid"      

  colnames(x_test) <- features[,2] 
  colnames(y_test) <- "activityid"
  colnames(subject_test) <- "subjectid"

  colnames(activity_labels) <- c('activityid','activitytype')

  # combine all data into one 

  train <- cbind(y_train, subject_train, x_train)
  test <- cbind(y_test, subject_test, x_test)
  
  # Combine train and test data -- first result set
  all_data <- rbind(train, test)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

  # read column name from the combined data obtained above 
  column_names <- colnames(all_data) 

  # create vector now to define id, mean and standard deviation
  mean_and_std <- (grepl("activityid" , column_names) | grepl("subjectid" , column_names) | grepl("mean.." , column_names) | grepl("std.." , column_names))
  

  # create subset of the combined data
  data_mean_and_std <- all_data[ , mean_and_std == TRUE]


# 3. Uses descriptive activity names to name the activities in the data set

  activity_names <- merge (data_mean_and_std , activity_labels , by='activityid',  all.x=TRUE)
  
# 4. Appropriately labels the data set with descriptive variable names.
  
  # Appropriate vector/variables names are given at each stage previously.
  
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
     # for each activity and each subject.
  
  Tidy_data_set <- aggregate(. ~subjectid + activityid, activity_names, mean)
  
  #write data into a txt file
  write.table(Tidy_data_set, "Tidy_Data.txt", row.name=FALSE)