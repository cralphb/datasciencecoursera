---
title: "Codebook"
output: pdf_document
---

Project Description:
Coursera - Getting and Cleaning Data, Course Project = Extract the mean and standard deviation measurements from a parent dataset, creating a tidy data set from which to calculate the average of each variable for each activity and each subject in the parent dataset. 


Data Set Information:
The raw data used for this project is from the Human Activity Recognition (HAR) database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.


Notes on the original (raw) data:
The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activitis (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.

Each record in the original dataset provides the following information:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 


Obtaining or creating the original tidy datafile:
1. The original, raw data was obtained by dowloading it from HAR  database using the "download.file" function.
2. The rersulting 'zip' archive was unpacked into the R working directory using the 'unzip' function.


Cleaning of the data:
The included R script, called "run_analysis.R", merges the original dataset consisting of training and test sets to create one data set, extracts select measurements, adjusts one of the variables to be more descriptive, labels the data accordingly, and outputs an average of each variable for each activity and each subject. Addtional details are available in the included README.md file.

Description of the variables in the tidy data set:
The resulting tidy data set consists of 10299 observations of
68 variables; the mean and standard deviation measurements, 
of the group of 30 volunteers participating in the activities
as described above.

Sources
1] UCI Machine Learning Repository
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2] Original dataset
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
