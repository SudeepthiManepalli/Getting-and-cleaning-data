---
title: "Getting and Cleaning data"

output: html_document
---
Data has been collected,analysed and a tidy dataset has been created.The datasets used for the analysis are from the study **Human Activity Recognition Using Smartphones**.

### About HAR Dataset:

 The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
 The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Files in the Dataset:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Following files have been used for the analysis:

- features.txt   
- X_test.txt
- activity_labels.txt 
- y_test.txt
- X_train.txt  
- subject_train.txt
- y_train.txt
- subject_test.txt

### Scripts:

An R script **run_analysis.R** to perform the cleaning and analysis of the data.



### Variables used:

- **test_data**: Contains the test data from the *X_test.txt* file
- **train_data**: Contains the total data from the *X_train.txt* file
- **total_data**: Contains the merged data from *test_data* and *train_data* 
- **test_labels**: Contains the activity labels from the test data
- **train_labels**: Contains the activity labels from the train data
- **total_labels**: Contains the merged labels from test and train using *rbind()* function
- **activity_labels**: Contains the labels with their respective activity names
- **test_subject**: Contains the list of subjects for test data
- **train_subject**: Contains the list of subjects for train data
- **total_subjects**: Contains the total subjects from test_subject and train subject
- **required_columns_mean**: Contains the list of all available columns with *mean*
- **required_columns_std**: Contains the list of all columns with *std* out of all available columns.
- **required_columns**: Contains the list of all extracted columns
- **new_dataset**: Dataset created from the total data and required columns
- **tidy_dataset**: A tidy dataset created from *new_dataset*,which contains the averages of all variables                     with each activity and each subject.

### Transformations performed:
- Reading the required files from the datasets,which include subjects,labels,data from both the test and    train datasets.
- Merging test and train  using rbind() function into **total_data**(*10299 x 561* dimensions) dataframe
- Setting up the column names with the **features** from features.txt file
- Extracting only those variables with mean and standard deviation using grep function from dplyr package
- Tidying the column names by removing unnecessary symbols using **gsub** function.
- Matching the labels with the respective activity names.
- Combining subjects,total labels with the total_data,a **new_dataset**(*10299 x 81* dimensions) has been formed.
- Using summarize function to summarize all variables.


### Result:
A **tidy_dataset**(*180 x 81* dimensions) has been created with the average of each variable with each activity and each subject.












