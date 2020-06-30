---
title: "run_analysis.R"
output: html_document
---
### Description:
This R script collects the data from the datasets of the study *Human Activity recognition using smartphones* carried out using Samsung Galaxy S smartphone.It merges the training and testing data collected from 30 individuals.A new tidy dataset has been created by doing the following analysis.

### Transformation:
- Reading the required files from the datasets,which include subjects,labels,data from both the test and train datasets.
- Merging test and train  using rbind() function into *total_data* dataframe
- Setting up the column names with the *features* from features.txt file
- Extracting only those variables with mean and standard deviation using grep function from dplyr package
- Tidying the column names by removing unnecessary symbols using gsub function.
- Matching the labels with the respective activity names.
- Combining subjects,total labels with the total_data,a *new_dataset* has been formed.
- Using summarize function to summarize all variables.

### Result:
A *tidy_dataset* has been created with the average of each variable with each activity and each subject.






