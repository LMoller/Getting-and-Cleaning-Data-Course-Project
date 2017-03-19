###############Question 1###############
###Instruction: Merges the training and the test sets to create one data set.

##Read Test files
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

##Read Train files
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

##Read Features data
features <- read.table("./UCI HAR Dataset/features.txt")

#Features = xdata
#Subject = subjectdata
#Activity = ydata

##Merge Test and Train data sets together
featuresdata <- rbind(xtest,xtrain)
activitydata <- rbind(ytest,ytrain)
subjectdata <- rbind(subjecttest,subjecttrain)

##Set Names to the variables
names(subjectdata)<-c("subject")
names(activitydata)<- c("activityId")
names(featuresdata)<- features$V2

##Merge all data sets together
alldata <- cbind(featuresdata,subjectdata,activitydata)

###############Question 2###############
###Instruction: Extracts only the measurements on the mean and standard deviation for each measurement.

##Subset the features mean and std
mean_std_features <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]

##Subset the full dataset (alldata) by the selected features mean and std
selectednames <- c(as.character(mean_std_features), "subject", "activityId" )
alldata <- subset(alldata, select = selectednames)

###############Question 3###############
###Instruction: Uses descriptive activity names to name the activities in the data set.

##Read activity file
activitylabels = read.table("./UCI HAR Dataset/activity_labels.txt")

##Assign column names
names(activitylabels) <- c('activityId','activity')

##Add descriptive activity names to activities in the data set
alldatawithactivitynames <- merge(alldata, activitylabels,by="activityId",all.x=TRUE)

###############Question 4###############
##Instruction: Appropriately labels the data set with descriptive variable names.
names(alldata)<-gsub("^t", "time", names(alldata))
names(alldata)<-gsub("^f", "frequency", names(alldata))
names(alldata)<-gsub("Acc", "Accelerometer", names(alldata))
names(alldata)<-gsub("Gyro", "Gyroscope", names(alldata))
names(alldata)<-gsub("Mag", "Magnitude", names(alldata))
names(alldata)<-gsub("BodyBody", "Body", names(alldata))

###############Question 5###############
##Instruction: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
alldata2 <- aggregate(. ~subject + activityId, alldata, mean)
alldata2 <- alldata2[order(alldata2$subject, alldata2$activityId),]
write.table(alldata2, file = "tidydata.txt", row.name=FALSE)

