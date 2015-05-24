In order to be able to run the run_analysis.R script please set up the correct path to the main directory of you data.

The data itself should be extracted in the same structure as the zip.file

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

provides.

In STEP 1 of the script all the data which are necessary for the analysis are read and combined to 1 raw dataset.
Appropriate variable names will be defined in each step as soon it will be necessary to do it without loosing any metadata information.

STEP2 filters all columns with "mean()" or "std()" inside the variable names.
Based on this filter all columns with the filtered variable names including SubjectID and ActivityID (which will be set before this step in
the datasets).

STEP3 merges the acitivity names to the dataset.

STEP4 and STEP5 will aggregate the dataset grouped by SubjectID and Acitivity in order to get the means on each of the measurements.

The resulting filename will be myTidyData.txt.