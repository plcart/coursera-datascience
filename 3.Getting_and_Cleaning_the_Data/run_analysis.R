library(plyr)
library(dplyr)
# Load the activitys info
dtActivity<-read.table("./data/activity_labels.txt", col.names=c("activityid","activityname"))
# Load the features info
features<-read.table("./data/features.txt",col.names=c("featureid","featurename"))

# Load the tests data
# Load the test subjects data
subjectTest<-read.table("./data/test/subject_test.txt",col.names=c("subjectid"))
# Load the test activitys data
yTest<-read.table("./data/test/y_test.txt",col.names=c("activityid"))
# Merge with the activity names
yTest<- merge(yTest,dtActivity,by.x="activityid",by.y="activityid", ALL=F)
# Load Measures data using features info as columns names
xTest<-read.table("./data/test/X_test.txt", col.names=features[,2])
# Get only mean and std columns
xTest<-xTest[,grep("std|mean",names(xTest),value=T)]
# Merge test data sets
dtTest<- cbind(subjectTest,yTest,xTest)
# add a group column
dtTest <- dtTest %>% mutate(group="Test")
# remove unused variables
rm(list=c("subjectTest","yTest","xTest"))

# Load the trains data
# Load the train subjects data
subjectTrain<-read.table("./data/train/subject_train.txt",col.names=c("subjectid"))
# Load the train activitys data
yTrain<-read.table("./data/train/y_train.txt",col.names=c("activityid"))
# Merge with the activity names
yTrain<- merge(yTrain,dtActivity,by.x="activityid",by.y="activityid", ALL=F)
# Load Measures data using features info as columns names
xTrain<-read.table("./data/train/X_train.txt", col.names=features[,2])
# Get only mean and std columns
xTrain<-xTrain[,grep("std|mean",names(xTrain),value=T)]
# Merge train data sets
dtTrain<- cbind(subjectTrain,yTrain,xTrain)
# Add a group column
dtTrain <- dtTrain %>% mutate(group="Train")
# Remove unused variables
rm(list=c("subjectTrain","yTrain","xTrain"))

# Merge train and test data sets
dtSamsungAccelerometer <- rbind(dtTrain,dtTest)
# Remove unused variables
rm(list = c("dtTrain","dtActivity","features","dtTest"))

# remove characters that may cause problems
names(dtSamsungAccelerometer)<-gsub("BodyBody","Body",names(dtSamsungAccelerometer))
names(dtSamsungAccelerometer)<-gsub("\\.","",names(dtSamsungAccelerometer))
names(dtSamsungAccelerometer)<-gsub("\\(|\\)","",names(dtSamsungAccelerometer))
dtSamsungAccelerometer<- tbl_df(dtSamsungAccelerometer)

# Group the data and apply the mean on the numeric columns
dtFinal<-ddply(dtSamsungAccelerometer,.(subjectid,activityname),numcolwise(mean))
dtFinal<-dtFinal[,-c(3,83)]
 
# write the result on a text file
write.table(dtFinal,row.name=F,file="result.txt")