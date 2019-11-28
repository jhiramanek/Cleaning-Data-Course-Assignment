##Merges the training and the test sets to create one Data set
## Columns extacted are: measurement, mean(), std()
library(dplyr)
library(stringr)

setwd("C:\\Users\\JH\\Documents\\CourseraProjectsInR\\UCI HAR Dataset")
featureTableTmp <- read.table("features.txt", header = FALSE)
colnames(featureTableTmp) <- c("featureId","featureName")
featureList <- c("-mean()-", "-std()")
featureTable <- filter(featureTableTmp, str_detect(featureTableTmp$featureName, paste(featureList)))
featureColumns <- featureTable[,1]
xDataTestTemp <- read.table("./test/X_test.txt")
xDataTest <- xDataTestTemp[ ,featureColumns]
colnames(xDataTest) <- featureTable$featureName

yDataTest <- read.table("./test/y_test.txt")
colnames(yDataTest) <- c("activityId")

dataTableTest <- cbind(yDataTest,xData2)


setwd("C:\\Users\\JH\\Documents\\CourseraProjectsInR\\UCI HAR Dataset")
activityLabels <- read.table("./activity_labels.txt")
colnames(activityLabels) <- c("activityId", "activityName")

merge(dt,activityLabels,by.x = "activityId", by.y = "activityId")

## Step 1: [Feature Table] Read Features.Txt and find column numbers for specific 
##         values.  [Activity Table] Using Activity_labels.txt create table ID, activityname

## y-train.Txt = ActivityID for each row add Mode: "Train"


## Step 2: Load Test data for specific columns into DataSet add Feature Header
## Step 3: Append Train data for specific columns into DataSet





##For each measurement extract only the mean and standard deviation 
## Mode (Test/Train), SubjectID, ActivityCode, ActivityName, Measure, mean(), std() 

## Use Descriptive activity name to name the activities in Data set

## labels the data set with descriptive variable names


## Create a tidy data set with AVERAGE of each (variable, activity and subject)

