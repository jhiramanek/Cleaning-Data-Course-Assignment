README:


The purpose of this document is to explain the methodology and script used to clean the Human Activity data set as part of the Coursera Course Project (Getting and Cleaning Data).

The script prepares tidy data which can be used for later analysis. 
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

The Data set for the project was obtained from the below link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Further information relating to the data is available at the following site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The repository folder contains the following important files and folders:

1. The data was downloaded and extracted into a subdirectory "UCI HAR Dataset" included in the repository.
2. An R Script called runAnalysis.R completes the following steps to clean the data and meet the standards outlined in the project scope.
3. CodeBook.md which describes the variables, the data, and any transformations or work that was performed to clean up the data
4. This README.txt
5. The TidyData.txt dataset which summarises the measurements were summarised by averaging them across each Activity and Subject from combined observations from the Training and Test data sets.


The Variables included in the TidyData.txt include:

SubjectId: A code numeric value to identify the subject who performed the activity for each window sample. Its range is from 1 to 30. 
ActivityName: The type of activity people performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone (Samsung Galaxy S II) on the waist.
ActivityID: The unique Id refrencing the Activity description


The other features selected from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

The Tidy Data Set summarises the measurements were summarised by averaging them across each Activity and Subject from combined observations from the Training and Test data sets.

Notes: 
======
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 


