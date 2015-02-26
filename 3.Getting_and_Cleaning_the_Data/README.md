# Coursera_project_course_3.1
Getting and Cleaning Data Peer Assessments 

The raw data are in the data directory this are the files i use in this analisys

* "./data/activity_labels.txt" Contains the activity labels
* "./data/features.txt" Contais the column names of the X_train and X_test files
* "./data/test/subject_test.txt" Contains the subject id of the test group
* "./data/test/y_test.txt" Contains the activitys taken by the subjects
* "./data/test/X_test.txt" Contains multiple result values of the activitys
* "./data/train/subject_train.txt" Contains the subject id of the train group
* "./data/train/y_train.txt" Contains the activitys taken by the subjects
* "./data/train/X_train.txt" Contains multiple result values of the activitys

### Steps of the Run_analysis.R script

1. Load the txt files and assigned to multiple variables
2. Using dtActivity("activity_labels.txt") variable i merged with yTest("y_test.txt") to get the correct activity names and reassigned the result to yTest
3. Using features("features.txt") variable as the column names paramater when loading the  "X_test.txt" and assing to xTest variable
4. Selecting on xTest only the columns where the name contains "mean" and "std" and reassigned to xTest
5. Merged the subjectTest, yTest and xTest using the cbind command resulting in a data frame with 82 columns and assigned to dtTest
6. Repeated the steps 2-5 using the "train" variables subjectTrain, yTrain and xTrain resulting in dtTrain variable
7. Merged dtTest and dtTrain by using rbind command and resulting in dtSamsungAccelerometer variable
8. Replace unwanted character in the column names of the dtSamsungAccelerometer data frame like "." and "()"
9. Group the data by subjectid and activityname and calculate the mean of the numeric columns
10. Wrote the result of step 9 in a text file called "result.txt"
