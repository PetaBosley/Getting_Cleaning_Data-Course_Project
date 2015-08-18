Getting_Cleaning_Data-Course_Project
Repository for the Course Project for the Coursera / Getting and Cleaning Data course

Created script
"run_analysis.R"
which is documented here
 
Each required task in the project (1 through 5) has been separately coded within this single
script and labelled with the Task number and Title to assist the peer reviewer.

Task 1

Task 2

My original intention was to use grep() to extract the columns with "mean" and "std" in the column names, but the 
script continually failed here.
The alternate, manual, solution was to examine the features.txt and features_info.txt files supplied in the download along
with the data frame that the features data had been loaded to and extract the relevant columns by column number 
(dplyr / select function).


Task 3 

Task 4

Task 5
