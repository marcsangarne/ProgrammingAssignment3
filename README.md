
The objective of the run_analysis script is to prepare tidy data that can be used for later analysis, as follows:

Step 1 - Merges the training and the test sets to create one data set.
The script needs to be adapted, setting up your own working directory. It then downloads the data and loads it into R: features, activity labels, subjects, training and test data.
It then merges training and test datasets in a database including Subject and Activity

Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
Mean and Standard Deviation Columns are extracted

Step 3 - Uses descriptive activity names to name the activities in the data set
Subject and activity data columns are added to the Mean and Standard Deviation dataset, with descriptive names for activities, using the activity labels data loaded during step 1

Step 4 - Appropriately labels the data set with descriptive variable names.
Data label is improved replacing abreviations by fully worded descriptions. This was following the information available in the README.txt file in the dataset directory.

Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The second tidy dataset is created using the aggregate function to summarize average of each variable data by activity and subject.

The output is a tidy dataset stored in file tidy_data.txt