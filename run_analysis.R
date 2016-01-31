run_analysis<-function()
{
setwd("C:/Users/axh080/Documents/R/data/UCI_HAR_Dataset")
	
## Read features and activity label files
features<-read.table("./features.txt",header=FALSE)
activityType<-read.table("./activity_labels.txt",header=FALSE)

## Read Training Files
TrainSub <- read.table("./train/subject_train.txt")
TrainX <- read.table("./train/X_train.txt")
TrainY <- read.table("./train/y_train.txt")

## Set Column Names
colnames(activityType)<-c("activityId","activityType")
colnames(TrainSub)<-"subjectId"
colnames(TrainX)<-features[,2]
colnames(TrainY)<-"activityId"

##Merge the Files
TrainingFile<-cbind(TrainY, TrainSub, TrainX)

## Read Test Files
TestSub <- read.table("./test/subject_test.txt")
TestX <- read.table("./test/X_test.txt")
TestY <- read.table("./test/y_test.txt")

## Set Column Names
colnames(TestSub)<-"subjectId"
colnames(TestX)<-features[,2]
colnames(TestY)<-"activityId"

##Merge the Files
TestFile<-cbind(TestY, TestSub, TestX)

##Merge Training and Test Files
MergedFile<-rbind(TrainingFile,TestFile)

##Select Only columns that are needed - mean, stddev
colNames<-colnames(MergedFile)
SelectOnly<-(grepl("activity",colNames) | grepl("subject",colNames)| grepl("mean",colNames) | grepl("std()",colNames))
SelectData<-MergedFile[SelectOnly==TRUE]

## Aggregate into Means of all Data Columns by Subject ID and Activity ID
MeanData<-aggregate(SelectData[,names(SelectData)!=c("activityId","subjectId")],by=list(activityId=SelectData$activityId,subjectId=SelectData$subjectId),mean)

##Write The Tidy Data - join Activity Text to provide meaningful info on activity
FinalMeanData<-merge(activityType,MeanData, by="activityId",all.x=TRUE)
##colNames<-colnames(FinalMeanData)
##write.table(colNames,"./Columns.txt",row.names=TRUE,sep="\t")
write.table(FinalMeanData,"./TidyData.txt",row.names=FALSE,sep="\t")

}	