
## Load relevant R libraries for tidy data

library(dplyr)
library(tidyr)
library(stringr)

## Download data and set dataPath

if (!file.exists("Cleaning-Data-Course-Assignment")) {
    dir.create("Cleaning-Data-Course-Assignment")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Cleaning-Data-Course-Assignment/dataset.zip", method = "curl")
if (!file.exists("Cleaning-Data-Course-Assignment/UCI HAR Dataset")) {
    unzip(zipfile = "Cleaning-Data-Course-Assignment/dataset.zip", 
          exdir = "Cleaning-Data-Course-Assignment")
}

dataPath <-  normalizePath(path.expand("Cleaning-Data-Course-Assignment\\UCI HAR Dataset"))


## Identify relevant feature columns in data filter for Mean and Standard deviation measures
        
	## Load Column Names (Features) in data table
        featureTableTmp <- read.table(file.path(dataPath, "features.txt", fsep = "\\"), header = FALSE)
        
	##Rename Feature Table Columns for ease of use
        colnames(featureTableTmp) <- c("featureId","featureName")
        
	##Get std-dev and mean measures
        features$select=grepl("mean|std",featureTableTmp$featureName)
        featureTableTmp <- featureTableTmp[features$select == TRUE,]
        
	## Remove the MeanFreq column and store feature column positions
        requiredFeatures <- grep("meanFreq()",featureTable$featureName, invert = TRUE)
        featureTable <- featureTableTmp[requiredFeatures, ]

## Load Activities ID and Activity Name
        activityLabels <- read.table(file.path(dataPath, "activity_labels.txt", fsep = "\\"))  
        colnames(activityLabels) <- c("activityId", "activityName")

## Prepare Test Data Frame
        
	##Load Testing Data
        xDataTestTemp <- read.table(file.path(dataPath, "/test/X_test.txt", fsep = "\\")) 
        xDataTest <- xDataTestTemp[ ,requiredFeatures]
        colnames(xDataTest) <- featureTable$featureName
        
	## Load Activity ID 
        yDataTest <- read.table(file.path(dataPath, "/test/y_test.txt", fsep = "\\"))
        colnames(yDataTest) <- c("activityId")
        
	##Combine x and y Data
        dataTableTest <- cbind(yDataTest,xDataTest)
        
	## Join Activity Name to ActivityID
        dataTableTest <- inner_join(dataTableTest,activityLabels,by.x = "activityId", by.y = "activityId")
                
        ## Add Subject ID
        subjectDataTest <- read.table(file.path(dataPath, "/test/subject_test.txt", fsep = "\\"))
        colnames(subjectDataTest) <- c("subjectID")
        dataTableTest <- cbind(subjectDataTest, dataTableTest)
        
        
## Prepare Training Data Frame
        
		##Load Training Data
        xDataTrainTemp <- read.table(file.path(dataPath, "/train/X_train.txt", fsep = "\\"))
        xDataTrain <- xDataTrainTemp[ ,requiredFeatures]
        colnames(xDataTrain) <- featureTable$featureName
		
        ## Load Activity ID 
        yDataTrain <- read.table(file.path(dataPath, "/train/y_train.txt", fsep = "\\"))
        colnames(yDataTrain) <- c("activityId")
        
		##Combine x and y Data
        dataTableTrain <- cbind(yDataTrain,xDataTrain)
        
		## Join Activity Name to ActivityID
        dataTableTrain <- inner_join(dataTableTrain,activityLabels,by.x = "activityId", by.y = "activityId")
        
        ## Add Subject ID
        subjectDataTrain <- read.table(file.path(dataPath, "/train/subject_train.txt", fsep = "\\"))
        colnames(subjectDataTrain) <- c("subjectID")
        dataTableTrain <- cbind(subjectDataTrain, dataTableTrain)
        
## Merge Training and Testing Data
		mergedDataSet <- rbind(dataTableTrain,dataTableTest)		

## Clean the ColumnNames 
## labels the data set with descriptive variable names

		colnames(mergedDataSet) <- gsub('[-()]', '', colnames(mergedDataSet))
		colnames(mergedDataSet) <- gsub("^t", "time", colnames(mergedDataSet))
		colnames(mergedDataSet) <- gsub("^f", "frequency", colnames(mergedDataSet))
		colnames(mergedDataSet) <- gsub("Acc", "Accelerometer", colnames(mergedDataSet))
		colnames(mergedDataSet) <- gsub("Gyro", "Gyroscope", colnames(mergedDataSet))
		colnames(mergedDataSet) <- gsub("Mag", "Magnitude", colnames(mergedDataSet))
		colnames(mergedDataSet) <- gsub("mean", "Mean", colnames(mergedDataSet))
		colnames(mergedDataSet) <- gsub("std", "Std", colnames(mergedDataSet))
		colnames(mergedDataSet) <- gsub("BodyBody", "Body", colnames(mergedDataSet))


#Create an independent tidy data set with the average of each variable for each activity and each subject.

		finalOutput <- mergedDataSet %>%
				group_by(subjectID, activityName) %>%
				summarise_each(funs(mean))


		write.table(finalOutput, "tidydata.txt", quote = FALSE, row.names = FALSE)   

## END OF SCRIPT

## -- REMOVED -- Add Mode Column
## -- REMOVED -- dataTableTrain <- cbind(mode = "Train", dataTableTrain)
        