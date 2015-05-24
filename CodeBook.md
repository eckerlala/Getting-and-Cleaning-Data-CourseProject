Following files are combined to one big dataset together

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'train/subject_train.txt': IDs of the 30 available subjects

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'test/subject_test.txt': IDs of the 30 available subjects

All the information have been taken from those data sources and variable names are showing the content of each variable
according to the original codebook.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

the extension "mean()" shows that the measurements have been calculated to mean
the extension "std()" shows that the measurements have been calculated to std

e.g.
fBodyAcc-mean() shows that mean of the variable fBodyAcc is shown
fBodyAccMag-std() shows that standard deviation of the variable fBodyAccMag is shown

The extension  'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

In the resulting tidy dataset you have 2 additional informations
SubjectID....is the ID of the subject which performs the activities of daily living 
Activity....is the name of the activity of daily living