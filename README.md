## Project Overview & Objective
This project utilizes data collected from the accelerometers of the Samsung Galaxy S smartphone.  The original publication of the data can be found here:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The stated objective of the project is to create one R script called run_analysis.R that does the following: 
    
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each               measurement. 
    3. Uses descriptive activity names to name the activities in the data set.
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the        average of each variable for each activity and each subject.

## The Data
The data can be downloaded via this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The files specifically utilized for the purposes of this project are as follows:
    - features.txt
    - activity_labels.txt
    - subject_test.txt
    - X_test.txt
    - y_test.txt
    - subject_train.txt
    - X_train.txt
    - y_train.txt

## The Script
The run_analysis.R script can be run by downloading the file cited above into your working driectory.

The script follows the following steps (which differs slightly from the stated objective):

    1. Read features, activities, test & train files.
    2. Provide descriptive variable names.
    3. Combine all test datasets & remove duplicate columns.
    4. Combine all training datasets & remove duplicate columns.
    5. Combine test and training datasets.
    6. Provide descriptive variable names for activities.
    7. Extract only the measures on the mean and standard deviation for each measurement.     8. Change activity variable to type "factor".
    9. Create a new dataset with the average of each variable for each subject/activity         combination.
    10. Write dataset (tidy_data.txt) to working directory.


