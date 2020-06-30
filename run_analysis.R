library(dplyr)

#reading the test and train data into test_data and train_data respectively
test_data<-read.table("./data_dscience/UCI HAR Dataset/test/X_test.txt");
train_data<-read.table("./data_dscience/UCI HAR Dataset/train/X_train.txt");

#reading the activity labels
activity_labels<-read.table("./data_dscience/UCI HAR Dataset/activity_labels.txt");

#reading features
features<-read.table("./data_dscience/UCI HAR Dataset/features.txt");

#reading subjects of test and train
test_subject<-read.table("./data_dscience/UCI HAR Dataset/test/subject_test.txt");
train_subject<-read.table("./data_dscience/UCI HAR Dataset/train/subject_train.txt");

#reading labels for test and train
test_labels<-read.table("./data_dscience/UCI HAR Dataset/test/y_test.txt");
train_labels<-read.table("./data_dscience/UCI HAR Dataset/train/y_train.txt");

#merging test data and train data
total_data<-rbind(train_data,test_data);
total_labels<-rbind(train_labels,test_labels);
total_subjects<-rbind(train_subject,test_subject);

#setting up the columns(variables) with features
colnames(total_data)<-features[ ,2];

#extracting only the columns with mean and standard deviation
required_columns_mean<-grep("mean",features[ ,2],value = TRUE);
required_columns_std<-grep("std",features[ ,2],value = TRUE);
required_columns<-c(required_columns_mean,required_columns_std);



new_dataset<-total_data[ ,required_columns];


#replacing the labels with their respective activity_names
total_labels<-activity_labels[match(total_labels[ ,1],activity_labels[ ,1]),2];


new_dataset<-cbind(total_subjects,total_labels,new_dataset);



colnames(new_dataset)<-c("Subject","Activity Label",required_columns);

#making the variable names tidy
colnames(new_dataset)<-gsub("[()-]","",colnames(new_dataset));


#taking means of all variables of each activity and each subject
tidy_dataset<-new_dataset %>% group_by(Subject,`Activity Label`) %>% summarize_all(funs(mean));













