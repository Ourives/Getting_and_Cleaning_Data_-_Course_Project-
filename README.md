#Course Project

===========================================

Sorry for my English. I'm just a brazilian gyu who knows a little bit about english language.
But I make program better... (at least I think...)

Lets start setting up the work directory. Point to the file above the "UCI HAR Dataset" folder that you extract
```r
setwd("C:\\ <set the directory> \\")
```

But if you dont have the archive and want to download first, use the script below:
```r
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "getdata-projectfiles-UCI HAR Dataset.zip")
```

After extract the archive and set up de Workdirectory,  we will start to read the files

Reading the files with the name of variable names and activities labels
```r
var_names <- read.table(".\\UCI HAR Dataset\\features.txt") #Variable names
act_names <- read.table(".\\UCI HAR Dataset\\activity_labels.txt") #Activity Names
```
This will be used in the test and train tables


Now, starting to build the Test table
```r
test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt") #reading the table
names(test) <- var_names$V2 #naming the variables of test table

test_act <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt") #reading the activity table of the test table
test_act_names <- merge(test_act, act_names, by.x ="V1", by.y ="V1") #making merge with the activity names to bring the label of the activities
names(test_act_names) <- c("Code_activity","Label_activity")  #naming this table

test_complete <- cbind(test_act_names, test) #merging the test table with the activity table labeled

test_complete$type <- "test" #Creating the variable to definy this observation as test
```

Making exactly the same procedure with train tables
Building Train table

```r
train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
names(train) <- var_names$V2

train_act <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
train_act_names <- merge(train_act, act_names, by.x ="V1", by.y ="V1")
names(train_act_names) <- c("Code_activity","Label_activity")

train_complete <- cbind(train_act_names, train)
train_complete$type <- "train"
```


AFTER THAT....

Now we will merge the test and train data... 
```r
complete_data  <- rbind(test_complete,train_complete) #... making a big and complete table
```

Extracting mean and standard of each measuremnt
For that, a vector with the name of the variable of mean and standart deviation is created (with the qualitative variables, of course)

```r
list_var <- as.vector(c("Code_activity","type",
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
```

NOW
THE TIDY DATA
```r
tidy_data <- complete_data[,list_var]
```
#IS COMPLETED

To finish the last topic (number 5), follow the mean of the tidy_data variables by activity and each subject
```r
mean_tidy_data <- aggregate(. ~ type + Code_activity, data = tidy_data, FUN= "mean")
```

I hope you enjoy!
