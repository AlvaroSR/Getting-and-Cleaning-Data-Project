---
title: README
author: Álvaro Sánchez-Rodríguez
---

#Getting and Cleaning Data project repository

In this repository you will be able to find out all files involved in the course project.

1. Raw Data directory    [link](https://github.com/AlvaroSR/Getting-and-Cleaning-Data-Project/tree/master/UCI%20HAR%20Dataset)
2. The code book file    [link](https://github.com/AlvaroSR/Getting-and-Cleaning-Data-Project/blob/master/CodeBook.md)
3. Tidy data file       [link](https://github.com/AlvaroSR/Getting-and-Cleaning-Data-Project/blob/master/tidy_data.txt)
4. run_analysis.R script [link](https://github.com/AlvaroSR/Getting-and-Cleaning-Data-Project/blob/master/run_analysis.R)

# Before running run_analysis.R

- The directory called UCI HAR Dataset must be stored in the same directory where the script is located. Do no change or modify any file in the directory, please.
- In the 7th line of the script, set your working directory where is going to be saved the tidy data file. 
- **data.table** and **plyr** packages will be loaded.
- If you are working under WINDOWS you have to change file directions in lines 13, 14, 16, 23, 24, 26, 39, 54, 67 and 97. 


**Notes:** 

- Due to overflow troubles it was impomsible to use **fread** over large data.
- run_analysis.R script developed under Ubuntu 14.04. It has not been tested under other OS.



####*Thank you in advance.*