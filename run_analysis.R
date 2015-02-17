################################################################################
## This file corresponds to PGetting and Cleaning Data Course Project
#
# Álvaro Sánchez February-2015
################################################################################

setwd("/media/DATA2/cursos/R/Getting and Cleaning Data/Getting and Cleaning Data Project/")
require(data.table,plyr)

# 1. Merges the training an the test sets to create one data set

#1.1 test
subject.test<-data.table(subject=read.table("./UCI HAR Dataset/test/subject_test.txt"))
X.test<- data.table(read.table("./UCI HAR Dataset/test/X_test.txt", 
                               stringsAsFactors=FALSE))
Y.test<- data.table(activity=read.table("./UCI HAR Dataset/test/y_test.txt"))

test<-data.table(subject.test,Y.test,X.test)

rm(subject.test,X.test,Y.test)

#1.2 train 
subject.train<-data.table(subject=read.table("./UCI HAR Dataset/train/subject_train.txt"))
X.train<- data.table(read.table("./UCI HAR Dataset/train/X_train.txt", 
                                stringsAsFactors=FALSE))
Y.train<- data.table(activity=read.table("./UCI HAR Dataset/train/y_train.txt"))

train<-data.table(subject.train,Y.train,X.train)

rm(subject.train,X.train,Y.train)

# 1.3 merge
data<-rbind(test,train)
rm(test,train)

# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement. 

variables<-data.table(read.table("./UCI HAR Dataset/features.txt", 
                                 stringsAsFactors=FALSE))

ind<-variables[,V2 %like% "mean\\(\\)|std\\(\\)"]
variables<-variables[ind,]

ind2<-as.vector(paste("V",variables$V1,sep=""))
ind2<-c("subject.V1","activity.V1",ind2)
data<-data[,ind2,with=FALSE]

rm(ind,ind2)

# 3. Uses descriptive activity names to name the activities in the data set


activity_labels<-fread("./UCI HAR Dataset/activity_labels.txt")
data$activity.V1<-as.factor(mapvalues(data$activity.V1,from=activity_labels$V1, 
                                      to=activity_labels$V2))
data$subject.V1<-as.factor(data$subject.V1)


# 4. Appropriately labels the data set with descriptive variable names

variables$V2<- gsub("\\(|\\)", "", variables$V2)

names<-as.vector(c("subject","activity",tolower(variables$V2)))
setnames(data,names)

write.table(data,"./clean_data.txt")
rm(activity_labels,variables,names)

# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject

data2<-data.frame(data)
data2$subject<-as.factor(data2$subject)
activitylevels<-levels(data2$activity)
subjectlevels<-unique(data2$subject)

activity<-rep(activitylevels,length(subjectlevels))
subject<-rep(subjectlevels,length(activitylevels))
subject<-sort(subject)

tidydata<-matrix(0,nrow=(length(activity)),ncol=ncol(data2))
tidydata<-as.data.frame(tidydata)

setnames(tidydata,names(data2))

tidydata$activity<-activity
tidydata$subject<-subject

for (i in 3:ncol(data2)){
        dat <- tapply(data2[,i],list(data2$activity,data2$subject),mean,na.rm=T)
        dat<-as.vector(dat)
        tidydata[,i]<-dat
}
rm(activity,activitylevels,dat,i,subject,subjectlevels)

write.table(tidydata,"./tidy_data.txt",row.names=FALSE)
