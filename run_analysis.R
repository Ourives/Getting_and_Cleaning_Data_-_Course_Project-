setwd("C:\\<change the directory>\\")

var_names <- read.table(".\\UCI HAR Dataset\\features.txt")
act_names <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")

test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
names(test) <- var_names$V2

test_act <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
test_act_names <- merge(test_act, act_names, by.x ="V1", by.y ="V1") 
names(test_act_names) <- c("Code_activity","Label_activity")  

test_complete <- cbind(test_act_names, test)

test_complete$type <- "test"

train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
names(train) <- var_names$V2

train_act <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
train_act_names <- merge(train_act, act_names, by.x ="V1", by.y ="V1")
names(train_act_names) <- c("Code_activity","Label_activity")

train_complete <- cbind(train_act_names, train)
train_complete$type <- "train"

complete_data  <- rbind(test_complete,train_complete)

list_var <- as.vector(c("Code_activity","Label_activity","type",
                        "tBodyAcc-mean()-X",
                        "tBodyAcc-mean()-Y",
                        "tBodyAcc-mean()-Z",
                        "tBodyAcc-std()-X",
                        "tBodyAcc-std()-Y",
                        "tBodyAcc-std()-Z",
                        "tGravityAcc-mean()-X",
                        "tGravityAcc-mean()-Y",
                        "tGravityAcc-mean()-Z",
                        "tGravityAcc-std()-X",
                        "tGravityAcc-std()-Y",
                        "tGravityAcc-std()-Z",
                        "tBodyAccJerk-mean()-X",
                        "tBodyAccJerk-mean()-Y",
                        "tBodyAccJerk-mean()-Z",
                        "tBodyAccJerk-std()-X",
                        "tBodyAccJerk-std()-Y",
                        "tBodyAccJerk-std()-Z",
                        "tBodyGyro-mean()-X",
                        "tBodyGyro-mean()-Y",
                        "tBodyGyro-mean()-Z",
                        "tBodyGyro-std()-X",
                        "tBodyGyro-std()-Y",
                        "tBodyGyro-std()-Z",
                        "tBodyGyroJerk-mean()-X",
                        "tBodyGyroJerk-mean()-Y",
                        "tBodyGyroJerk-mean()-Z",
                        "tBodyGyroJerk-std()-X",
                        "tBodyGyroJerk-std()-Y",
                        "tBodyGyroJerk-std()-Z",
                        "tBodyAccMag-mean()",
                        "tBodyAccMag-std()",
                        "tGravityAccMag-mean()",
                        "tGravityAccMag-std()",
                        "tBodyAccJerkMag-mean()",
                        "tBodyAccJerkMag-std()",
                        "tBodyGyroMag-mean()",
                        "tBodyGyroMag-std()",
                        "tBodyGyroJerkMag-mean()",
                        "tBodyGyroJerkMag-std()",
                        "fBodyAcc-mean()-X",
                        "fBodyAcc-mean()-Y",
                        "fBodyAcc-mean()-Z",
                        "fBodyAcc-std()-X",
                        "fBodyAcc-std()-Y",
                        "fBodyAcc-std()-Z",
                        "fBodyAcc-meanFreq()-X",
                        "fBodyAcc-meanFreq()-Y",
                        "fBodyAcc-meanFreq()-Z",
                        "fBodyAccJerk-mean()-X",
                        "fBodyAccJerk-mean()-Y",
                        "fBodyAccJerk-mean()-Z",
                        "fBodyAccJerk-std()-X",
                        "fBodyAccJerk-std()-Y",
                        "fBodyAccJerk-std()-Z",
                        "fBodyAccJerk-meanFreq()-X",
                        "fBodyAccJerk-meanFreq()-Y",
                        "fBodyAccJerk-meanFreq()-Z",
                        "fBodyGyro-mean()-X",
                        "fBodyGyro-mean()-Y",
                        "fBodyGyro-mean()-Z",
                        "fBodyGyro-std()-X",
                        "fBodyGyro-std()-Y",
                        "fBodyGyro-std()-Z",
                        "fBodyGyro-meanFreq()-X",
                        "fBodyGyro-meanFreq()-Y",
                        "fBodyGyro-meanFreq()-Z",
                        "fBodyAccMag-mean()",
                        "fBodyAccMag-std()",
                        "fBodyAccMag-meanFreq()",
                        "fBodyBodyAccJerkMag-mean()",
                        "fBodyBodyAccJerkMag-std()",
                        "fBodyBodyAccJerkMag-meanFreq()",
                        "fBodyBodyGyroMag-mean()",
                        "fBodyBodyGyroMag-std()",
                        "fBodyBodyGyroMag-meanFreq()",
                        "fBodyBodyGyroJerkMag-mean()",
                        "fBodyBodyGyroJerkMag-std()",
                        "fBodyBodyGyroJerkMag-meanFreq()",
                        "angle(tBodyAccMean,gravity)",
                        "angle(tBodyAccJerkMean),gravityMean)",
                        "angle(tBodyGyroMean,gravityMean)",
                        "angle(tBodyGyroJerkMean,gravityMean)",
                        "angle(X,gravityMean)",
                        "angle(Y,gravityMean)",
                        "angle(Z,gravityMean)"))

tidy_data <- complete_data[,list_var]

mean_tidy_data <- aggregate(. ~ type + Label_activity, data = tidy_data, FUN= "mean")
