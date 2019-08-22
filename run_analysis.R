#Step 1 - Merges the training and the test sets to create one data set.
#Download and unzip

#CUSTOMIZE SCRIPT AND SETUP YOUR OWN LOCAL WORKING DIRECTORY
#setwd("G:\My Drive\Jota MS\R\Github\ProgrammingAssignment3")


download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","./dataset.zip")
unzip("dataset.zip")

#load datasets into R
features <- read.table('UCI HAR Dataset/features.txt', col.names = c('Feature_Index','Feature_vector'))
activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt', col.names = c('Activity_Index','Activity'))

X_train <- read.table('UCI HAR Dataset/train/X_train.txt',col.names = features$Feature_vector,check.names = FALSE)
y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')

X_test <- read.table('UCI HAR Dataset/test/X_test.txt',col.names = features$Feature_vector,check.names = FALSE)
y_test <- read.table('UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')

X_train_base <- cbind(y_train, subject_train,X_train)
X_test_base <- cbind(y_test, subject_test,X_test)

#rename first two columns
names(X_train_base)[c(1,2)] <- c('Activity','Subject')
names(X_test_base)[c(1,2)] <- c('Activity','Subject')

#merge
X_data <- rbind(X_train,X_test)
y_data <- rbind(y_train,y_test)
subject_data <- rbind(subject_train,subject_test)

#Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
col_names <- colnames(X_data)
col_mean  <- grep('mean\\(\\)',col_names)
col_std   <- grep('std\\(\\)',col_names)
X_mean_and_std <- X_data[,c(col_mean,col_std)]

#Step 3 - Uses descriptive activity names to name the activities in the data set
X_desc <- cbind(y_data,X_mean_and_std)
colnames(X_desc)[1] <- 'Activity_Index'
X_desc <- cbind(subject_data,X_desc)
colnames(X_desc)[1] <- 'Subject'

X_desc <- merge(activity_labels,X_desc)
X_desc$Activity_Index <- NULL

#Step 4 - Appropriately labels the data set with descriptive variable names.

col_names <- colnames(X_desc)

col_names <- sub(x = col_names,pattern = '^t',replacement = 'Time domain signal: ')
col_names <- sub(x = col_names,pattern = '^f',replacement = 'Frequency domain signal: ')
col_names <- sub(x = col_names,pattern = 'mean\\(\\)',replacement = ' mean ')
col_names <- sub(x = col_names,pattern = 'std\\(\\)',replacement = ' standard deviation ')
col_names <- sub(x = col_names,pattern = 'AccJerk',replacement = ' acceleration jerk')
col_names <- sub(x = col_names,pattern = 'Acc',replacement = ' acceleration')
col_names <- sub(x = col_names,pattern = 'GyroJerk',replacement = ' angular velocity jerk')
col_names <- sub(x = col_names,pattern = 'Gyro',replacement = ' angular velocity')
col_names <- sub(x = col_names,pattern = 'Mag',replacement = ' magnitude')
col_names <- sub(x = col_names,pattern = '-X',replacement = '- X direction')
col_names <- sub(x = col_names,pattern = '-Y',replacement = '- Y direction')
col_names <- sub(x = col_names,pattern = '-Z',replacement = '- Z direction')


colnames(X_desc) <- col_names


#Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
X_tidy <- aggregate(X_desc[,3:68],by=list(X_desc$Activity,X_desc$Subject),FUN=mean)
colnames(X_tidy)[1] <- 'Activity'
colnames(X_tidy)[2] <- 'Subject'

#Storing the final tidy data set
write.table(X_tidy,file = 'tidy_data.txt',row.names = FALSE)


