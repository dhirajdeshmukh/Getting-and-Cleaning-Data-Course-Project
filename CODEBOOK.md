Additional information about the data, variables and transformations used in Data Project.

   1. Download the source file from the link below and then unzip it to the working directory of R studio.
  
       https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

       The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

       http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

   2. Execute the R scripts in the sequences as mentioned in run_analysis.R file

   3. Variables used in R Scripts

      x_train, y_train, x_test, y_test, subject_train, subject_test, features and activity_labels contain the data from the downloaded files.
      train combine the train data from x_train, y_train and subject_train
      test combine the test data from x_test, y_test and subject_test
      all_data combines the test and train data

      mean_and_std calculates the mean and deviation of the combined data set

      tidy_data_set gets the tidy data set for the final result
      
      

    