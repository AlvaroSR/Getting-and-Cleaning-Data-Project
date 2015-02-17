---
title: README
author: Álvaro Sánchez-Rodríguez
---

#Getting and Cleaning Data project repository

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## About the data

One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Files in the repository

In this repository you will be able to find out all files involved in the course project.

1. Raw Data directory    [link](https://github.com/AlvaroSR/Getting-and-Cleaning-Data-Project/tree/master/UCI%20HAR%20Dataset)
2. The code book file    [link](https://github.com/AlvaroSR/Getting-and-Cleaning-Data-Project/blob/master/CodeBook.md)
3. Tidy data file       [link](https://github.com/AlvaroSR/Getting-and-Cleaning-Data-Project/blob/master/tidy_data.txt)
4. run_analysis.R script [link](https://github.com/AlvaroSR/Getting-and-Cleaning-Data-Project/blob/master/run_analysis.R)

## What does the run_analysis.R file do?

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.




## Before running run_analysis.R

- The directory called UCI HAR Dataset must be stored in the same directory where the script is located. Do no change or modify any file in the directory, please.
- In the 7th line of the script, set your working directory where is going to be saved the tidy data file. 
- **data.table** and **plyr** packages will be loaded.
- If you are working under WINDOWS you have to change file directions in lines 13, 14, 16, 23, 24, 26, 39, 54, 67 and 97. 


**Notes:** 

- Due to overflow troubles it was impomsible to use **fread** over large data.
- run_analysis.R script developed under Ubuntu 14.04. It has not been tested under other OS.



####*Thank you in advance.*