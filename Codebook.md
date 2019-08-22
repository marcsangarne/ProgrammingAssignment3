---
title: "codebook"
output: md_document
---

Getting and Cleaning Data Course Project

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the original data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This code book  describes  variables,  data, and  transformations performed to clean up the original data.

1 - Transformations performed:

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

2 - Data

 [1] Activity
        Factor w/ 6 levels 
        1 WALKING
        2 WALKING_UPSTAIRS
        3 WALKING_DOWNSTAIRS
        4 SITTING
        5 STANDING
        6 LAYING
 [2] Subject                                                                                
        Number of the subject submitted to the test (integer 1 to 30)
        
 The following variables are numeric. They represent, for each subject and activity, of a combination of:
 - mean ("mean") or standard deviation ("standard deviation") of the observations
 - time domain measurement ("Time domain signal:" prefix) or frequency domain measurement ("Frequency domain signal:" prefix) (obtained by a Fourrier transformation)
 - feature measured (see description at the end)

 [3] "Time domain signal: Body acceleration- mean - X direction"                             
 [4] "Time domain signal: Body acceleration- mean - Y direction"                             
 [5] "Time domain signal: Body acceleration- mean - Z direction"                             
 [6] "Time domain signal: Gravity acceleration- mean - X direction"                          
 [7] "Time domain signal: Gravity acceleration- mean - Y direction"                          
 [8] "Time domain signal: Gravity acceleration- mean - Z direction"                          
 [9] "Time domain signal: Body acceleration jerk- mean - X direction"                        
[10] "Time domain signal: Body acceleration jerk- mean - Y direction"                        
[11] "Time domain signal: Body acceleration jerk- mean - Z direction"                        
[12] "Time domain signal: Body angular velocity- mean - X direction"                         
[13] "Time domain signal: Body angular velocity- mean - Y direction"                         
[14] "Time domain signal: Body angular velocity- mean - Z direction"                         
[15] "Time domain signal: Body angular velocity jerk- mean - X direction"                    
[16] "Time domain signal: Body angular velocity jerk- mean - Y direction"                    
[17] "Time domain signal: Body angular velocity jerk- mean - Z direction"                    
[18] "Time domain signal: Body acceleration magnitude- mean "                                
[19] "Time domain signal: Gravity acceleration magnitude- mean "                             
[20] "Time domain signal: Body acceleration jerk magnitude- mean "                           
[21] "Time domain signal: Body angular velocity magnitude- mean "                            
[22] "Time domain signal: Body angular velocity jerk magnitude- mean "                       
[23] "Frequency domain signal: Body acceleration- mean - X direction"                        
[24] "Frequency domain signal: Body acceleration- mean - Y direction"                        
[25] "Frequency domain signal: Body acceleration- mean - Z direction"                        
[26] "Frequency domain signal: Body acceleration jerk- mean - X direction"                   
[27] "Frequency domain signal: Body acceleration jerk- mean - Y direction"                   
[28] "Frequency domain signal: Body acceleration jerk- mean - Z direction"                   
[29] "Frequency domain signal: Body angular velocity- mean - X direction"                    
[30] "Frequency domain signal: Body angular velocity- mean - Y direction"                    
[31] "Frequency domain signal: Body angular velocity- mean - Z direction"                    
[32] "Frequency domain signal: Body acceleration magnitude- mean "                           
[33] "Frequency domain signal: BodyBody acceleration jerk magnitude- mean "                  
[34] "Frequency domain signal: BodyBody angular velocity magnitude- mean "                   
[35] "Frequency domain signal: BodyBody angular velocity jerk magnitude- mean "              
[36] "Time domain signal: Body acceleration- standard deviation - X direction"               
[37] "Time domain signal: Body acceleration- standard deviation - Y direction"               
[38] "Time domain signal: Body acceleration- standard deviation - Z direction"               
[39] "Time domain signal: Gravity acceleration- standard deviation - X direction"            
[40] "Time domain signal: Gravity acceleration- standard deviation - Y direction"            
[41] "Time domain signal: Gravity acceleration- standard deviation - Z direction"            
[42] "Time domain signal: Body acceleration jerk- standard deviation - X direction"          
[43] "Time domain signal: Body acceleration jerk- standard deviation - Y direction"          
[44] "Time domain signal: Body acceleration jerk- standard deviation - Z direction"          
[45] "Time domain signal: Body angular velocity- standard deviation - X direction"           
[46] "Time domain signal: Body angular velocity- standard deviation - Y direction"           
[47] "Time domain signal: Body angular velocity- standard deviation - Z direction"           
[48] "Time domain signal: Body angular velocity jerk- standard deviation - X direction"      
[49] "Time domain signal: Body angular velocity jerk- standard deviation - Y direction"      
[50] "Time domain signal: Body angular velocity jerk- standard deviation - Z direction"      
[51] "Time domain signal: Body acceleration magnitude- standard deviation "                  
[52] "Time domain signal: Gravity acceleration magnitude- standard deviation "               
[53] "Time domain signal: Body acceleration jerk magnitude- standard deviation "             
[54] "Time domain signal: Body angular velocity magnitude- standard deviation "              
[55] "Time domain signal: Body angular velocity jerk magnitude- standard deviation "         
[56] "Frequency domain signal: Body acceleration- standard deviation - X direction"          
[57] "Frequency domain signal: Body acceleration- standard deviation - Y direction"          
[58] "Frequency domain signal: Body acceleration- standard deviation - Z direction"          
[59] "Frequency domain signal: Body acceleration jerk- standard deviation - X direction"     
[60] "Frequency domain signal: Body acceleration jerk- standard deviation - Y direction"     
[61] "Frequency domain signal: Body acceleration jerk- standard deviation - Z direction"     
[62] "Frequency domain signal: Body angular velocity- standard deviation - X direction"      
[63] "Frequency domain signal: Body angular velocity- standard deviation - Y direction"      
[64] "Frequency domain signal: Body angular velocity- standard deviation - Z direction"      
[65] "Frequency domain signal: Body acceleration magnitude- standard deviation "             
[66] "Frequency domain signal: BodyBody acceleration jerk magnitude- standard deviation "    
[67] "Frequency domain signal: BodyBody angular velocity magnitude- standard deviation "     
[68] "Frequency domain signal: BodyBody angular velocity jerk magnitude- standard deviation "


The original description from the tests follows:
"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.""

