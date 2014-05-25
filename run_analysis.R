###
### read in all datasets
path=getwd()
data_x_test=read.table(paste(path,"/UCI HAR Dataset/test/","X_test.txt",sep=""))
data_y_test=read.table(paste(path,"/UCI HAR Dataset/test/","y_test.txt",sep=""))
data_x_train=read.table(paste(path,"/UCI HAR Dataset/train/","X_train.txt",sep=""))
data_y_train=read.table(paste(path,"/UCI HAR Dataset/train/","y_train.txt",sep=""))
data_subject_test=read.table(paste(path,"/UCI HAR Dataset/test/","subject_test.txt",sep=""))
data_subject_train=read.table(paste(path,"/UCI HAR Dataset/train/","subject_train.txt",sep=""))

### read in 561 variable names
features=read.table(paste(path,"/UCI HAR Dataset/features.txt",sep=""))
features=as.vector(features[,2])

###  merge the training dataset and test dataset including subject ID and activities
data_train=cbind(data_subject_train,data_y_train,data_x_train)
data_test=cbind(data_subject_test,data_y_test,data_x_test)
data_all=rbind(data_train,data_test)
names(data_all)=c("subject","activity",features)

###  Extracts only the measurements on the mean and standard deviation for each measurement.
mean_indc=grepl("mean",features)
std_indc=grepl("std",features)
indc=as.logical(mean_indc+std_indc)
all_indc=c(TRUE,TRUE,indc)
sub_data=data_all[,all_indc]

###  Uses descriptive activity names to name the activities in the data set
activity_labels=read.table(paste(path,"/UCI HAR Dataset/activity_labels.txt",sep=""))
activity_labels=as.vector(activity_labels[,2])
sub_data$activity=activity_labels[sub_data$activity]

###  Appropriately labels the data set with descriptive activity names. More details about
###  the names can be found in the CodeBook.md file.
new_label=names(sub_data)
for(i in 1:length(new_label))
{
new_label[i]=gsub("(\\()(\\))","",new_label[i], perl = TRUE)
new_label[i]=gsub("-","",new_label[i], perl = TRUE)
new_label[i]=gsub("mean","Mean",new_label[i], perl = TRUE)
new_label[i]=gsub("std","Std",new_label[i], perl = TRUE)
}
names(sub_data)=new_label

### Arrange the records according to subject ID number from 1 to 30.
tidydata=sub_data[order(sub_data$subject),]

### save the tidy dataset
write.csv(sub_data,"merged_tidy_dataset.csv",row.names=FALSE)
write.table(sub_data,"merged_tidy_dataset.txt",quote=FALSE,row.names=FALSE)



#################################################################################################
#################################################################################################
#################################################################################################

### Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###
### read in all datasets
path=getwd()
data_x_test=read.table(paste(path,"/UCI HAR Dataset/test/","X_test.txt",sep=""))
data_y_test=read.table(paste(path,"/UCI HAR Dataset/test/","y_test.txt",sep=""))
data_x_train=read.table(paste(path,"/UCI HAR Dataset/train/","X_train.txt",sep=""))
data_y_train=read.table(paste(path,"/UCI HAR Dataset/train/","y_train.txt",sep=""))
data_subject_test=read.table(paste(path,"/UCI HAR Dataset/test/","subject_test.txt",sep=""))
data_subject_train=read.table(paste(path,"/UCI HAR Dataset/train/","subject_train.txt",sep=""))

### read in 561 variable names
features=read.table(paste(path,"/UCI HAR Dataset/features.txt",sep=""))
features=as.vector(features[,2])

###  merge the training dataset and test dataset including subject ID and activities
data_train=cbind(data_subject_train,data_y_train,data_x_train)
data_test=cbind(data_subject_test,data_y_test,data_x_test)
data_all=rbind(data_train,data_test)
names(data_all)=c("subject","activity",features)

###  Appropriately labels the data set with descriptive activity names. More details about
###  the names can be found in the CodeBook.md file.
new_label=c("subject","activity",features)
for(i in 1:length(new_label))
{
new_label[i]=gsub("(\\()(\\))","",new_label[i], perl = TRUE)
new_label[i]=gsub("-","",new_label[i], perl = TRUE)
new_label[i]=gsub("mean","Mean",new_label[i], perl = TRUE)
new_label[i]=gsub("std","Std",new_label[i], perl = TRUE)
}



### Create data set with the average of each variable for each activity and each subject.
result=NULL
for( ID in 1:30)
  { for(act_indc in 1:6)
         { subset=data_all[which(data_all$subject==ID & data_all$activity==act_indc),]
             result=rbind(result, colMeans(subset, na.rm = FALSE, dims = 1))
         }
  }
mydataset=data.frame(result)
new_label=c(new_label[1:2],paste("Mean",new_label[-c(1:2)],sep=""))
names(mydataset)=new_label

###  Uses descriptive activity names to name the activities in the data set
activity_labels=read.table(paste(path,"/UCI HAR Dataset/activity_labels.txt",sep=""))
activity_labels=as.vector(activity_labels[,2])
mydataset$activity=activity_labels[mydataset$activity]

### save the tidy dataset
write.csv(mydataset,"average_per_subject_per_activity.csv",row.names=FALSE)
write.table(mydataset,"average_per_subject_per_activity.txt",quote=FALSE,row.names=FALSE)



