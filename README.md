#Getting and Cleaning Data - Course Project

This is the course project for the Getting and Cleaning Data Coursera course. The R script,  run_analysis.R , does the following:
1.Reads features and activity label files
2.Reads Training and Test Data Files
3.Sets up Column Names 
4.Column Bind Files - First Training and then Test Files - to create a denormalized Files
5.Then Row Bind Training and Test Files
6.Remove Unwanted Columns - select only mean and standard deviation columns
7.Aggregate Value Fields to get mean grouped by Activity ID and Subject ID
8. Merge Activity Type Description
9. Write File

The end result is shown in the file  TidyData.txt
