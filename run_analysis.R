require(plyr)
##################################################################
# 1- Merges the training and the test sets to create one data set.
##################################################################


##Extract the data, create the variables
tmp1<-read.table("UCI HAR Dataset/train/X_train.txt")
tmp2<-read.table("UCI HAR Dataset/test/X_test.txt")
X <- rbind(tmp1, tmp2)
tmp1<-read.table("UCI HAR Dataset/train/Y_train.txt")
tmp2<-read.table("UCI HAR Dataset/test/Y_test.txt")
Y <- rbind(tmp1, tmp2)
tmp1<-read.table("UCI HAR Dataset/train/subject_train.txt")
tmp2<-read.table("UCI HAR Dataset/test/subject_test.txt")
S <- rbind(tmp1, tmp2)
rm(tmp1,tmp2)


#################################################################
# 2-  Extracts only the measurements on the mean and standard deviation for each measurement. 
#################################################################


#Features info
features<-read.table("UCI HAR Dataset/features.txt")
#Extract the mean and std index from the features table
mean_index<-grep("mean",features[,2],ignore.case = T)
std_index<-grep("std",features[,2],ignore.case = T)


#Subset the X dataframe and change the column names using the features names
X<-X[,c(mean_index,std_index)]
names(X)<-features[c(mean_index,std_index),2]
rm(features)

##
# Part 3 will be done last, because I cannot make ddply function work with factors for some reason 
##

#################################################################
# 4 - Appropriately labels the data set with descriptive activity names.
#################################################################
names(Y)<-"activity"
names(S)<-"subject"
cleanDataSet<-cbind(S,Y,X)


################################################################
# 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
################################################################
tiddy<-ddply(cleanDataSet,.(subject,activity),function(x){
  unlist(lapply(x, mean, na.rm = T))
})



#################################################################
# 3 - Uses descriptive activity names to name the activities in the data set
#################################################################

activity_names<- read.table("UCI HAR Dataset/activity_labels.txt")
tiddy[,2]<-activity_names[tiddy[,2],2]
rm(activity_names)


####
# Now saving the dataset
####


write.csv(tiddy, file = 'tidy_dataset.csv')
