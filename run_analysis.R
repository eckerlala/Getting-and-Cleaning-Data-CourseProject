# !!!!HERE!!!! you can set your path in which folder the data are stored - structure must be accoridng to the ZIP-file
# e.g. projectpath <- "./UCI_HAR_Dataset"
projectpath <- "."

################################################################
#
# STEP 1
#
################################################################
# import of activity labels
filename<-"activity_labels.txt"
activity_labels<-read.csv(paste(projectpath,"/",filename,sep=""),sep="",header=FALSE)

#import of features
filename<-"features.txt"
features<-read.csv(paste(projectpath,"/",filename,sep=""),sep="",header=FALSE)

#import training labels
filename<-"y_train.txt"
training_labels<-read.csv(paste(projectpath,"/","train/",filename,sep=""),sep="",header=FALSE)
names(training_labels)<-"label"

#import training subject
filename<-"subject_train.txt"
training_subject<-read.csv(paste(projectpath,"/","train/",filename,sep=""),sep="",header=FALSE)
names(training_subject)<-"SubjectID"

#import training set
filename<-"x_train.txt"
training_set<-read.csv(paste(projectpath,"/","train/",filename,sep=""),sep="",header=FALSE)
names(training_set)<-features$V2

#combine training labels and set
training<-cbind(training_subject,training_labels,training_set)

#import test labels
filename<-"y_test.txt"
test_labels<-read.csv(paste(projectpath,"/","test/",filename,sep=""),sep="",header=FALSE)
names(test_labels)<-"label"

#import test subject
filename<-"subject_test.txt"
test_subject<-read.csv(paste(projectpath,"/","test/",filename,sep=""),sep="",header=FALSE)
names(test_subject)<-"SubjectID"

#import test set
filename<-"x_test.txt"
test_set<-read.csv(paste(projectpath,"/","test/",filename,sep=""),sep="",header=FALSE)
names(test_set)<-features$V2

#combine test labels and set
test<-cbind(test_subject,test_labels,test_set)

#merging of the two datasets
data<-rbind(training,test)

################################################################
#
# STEP 2
#
################################################################
#get appropriate variable names
myVars <- c(grep("mean()",features$V2,value=TRUE,fixed=TRUE),grep("std()",features$V2,value=TRUE,fixed=TRUE))

#get only mean & std Vars
myData<-subset(data,select=c("SubjectID","label",myVars))

names(myData)[2]<-"ActivityID"


################################################################
#
# STEP 3
#
################################################################
#step 3
myResultSet<-merge(activity_labels,myData,by.x="V1",by.y="ActivityID")
names(myResultSet)[1]<-"ActivityID"
names(myResultSet)[2]<-"Activity"

################################################################
#
# STEP 4+5
#
################################################################
##some parts of step 4 are also done before

#get Tidy dataset
myTidy<-aggregate(myResultSet[,4:69],list(myResultSet$SubjectID,myResultSet$Activity),mean)
names(myTidy)[1:2]<-c("SubjectID","Acitivity")

#make result file of the tidy data 
filename <- "myTidyData.txt"
write.table(myTidy,filename,row.names=FALSE)
