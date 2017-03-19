The script, run_analysis.R does the following...
Merges the training and the test sets to create one data set.
  1. Read the Test files to create...
  xtest = Features
  ytest = Activity
  subjecttest = Subject
  2. Read the Train files to create...
  xtrain = Features
  ytrain = Activity
  subjecttrain = Subject
  3. Read the Features data to create...
  features
  4. Merge Test and Train data sets together to create...
  featuresdata
  activitydata
  subjectdata
  5. Set Names to the variables
  6. Merge all data sets together to create...
  alldata
Extracts only the measurements on the mean and standard deviation for each measurement.
  1. Subset the features mean and std in mean_std_features
  2. Subset the full dataset (alldata) by the selected features mean and stdselectednames
Uses descriptive activity names to name the activities in the data set.
  1. Read activity file to activitylabels
  2. Add descriptive activity names to activities in setalldatawithactivitynames
Appropriately labels the data set with descriptive variable names.
  1. substitutes "t" for "time"
  2. substitutes "f" for "frequency"
  3. substitutes "Acc" for "Accelerometer"
  4. substitutes "Gyro" for "Gyroscope"
  5. substitutes "Mag" for "Magnitude"
  6. substitutes "BodyBody" for "Body"
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Writes to "tidydata.txt"
