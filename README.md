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


Notes: 
======
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 


