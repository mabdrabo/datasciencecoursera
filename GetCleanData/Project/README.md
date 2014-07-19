GetCleanDataProject
===================

##data source##
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

##The used files:##
X_test.txt, y_test.txt, subject_test.txt, <br>
X_train.txt, y_train.txt, subject_train.txt and features.txt, <br>
named as testX, testY, testSubject, trainX, trainY, and trainSubject respectively 


the dat variable holds the combined data from the previously mentioned files.

Mean and standard deviation calculations are used on entries with the words, "std" or "mean" in them and broken down by the subject and type of activity.

A column is added to the full dataset that names the type of activity for each row. The column is named activityNames and the values include Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, and Laying.

The tidy data set is writtent to a file named "activityDataset.txt" and put into the working directory
