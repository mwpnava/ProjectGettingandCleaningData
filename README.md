==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Wendy Navarrete
navarrete.wen@gmail.com

==================================================================
Data is from Human Activity Recognition Using Smartphones Dataset provides by  Smartlab - Non Linear Complex Systems Laboratory through Getting and Cleaning Data Course (coursera.org)

The run_analysis.R works following these instructions:
*******************************************************************
- Getting features
- Creating training and test datasets
- Merging the training and test sets to create one data set (complete_file).
- Extracting only certain measurement. Two steps: a & b
- a)  Extracting from features.txt all column names for mean and standard deviation measurements
- b)  Extracting from complete_file (train and test) only the measurements on the mean and standard deviation for each measurement. 
- Using descriptive activity names to name the activities in the data set (using activity_labes.txt file)
- Labeling appropriately the data set with descriptive variable names.  
- Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
- Geting non-duplicated subject-activity pairs from columns 1 and 2 from dataset, to calculate average for each variable and create a new dataframe with results (averages.txt file is the final output)

For each record in averages.txt is provided:
*******************************************************************

- An identifier of the subject who carried out the experiment.
- Its activity label. 
- A 66-feature vector with time and frequency domain variables. Only the measurements on the mean and standard deviation for each measurement. 


The dataset includes the following files:
*******************************************************************
- 'README.md' 

- 'CodeBook.xlsx' and 'CodeBook.csv'  are same content files, dfferent formats. Those contains a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data

- 'completo.txt' It is a complete tidy set. Each row identifies the subject who performed the activity for each window sample and  66 features.

- 'averages.txt': It is a the final tidy data set with the average of each variable for each activity and each subject from completo.txt set

- 'new_labels.txt': Contains labels for labeling activity names in the final tidy data set




Notes
********
For more information about this dataset contact: navarrete.wen@gmail.com