run_analysis<-function(){

## Getting features

features<-read.table('./UCI HAR Dataset/features.txt')
numCols<-length(features[,2])

## Creating training dataset
train_results <-read.table('./UCI HAR Dataset/train/X_train.txt', sep="")
train_act<-read.table('./UCI HAR Dataset/train/Y_train.txt')
train_subject<-read.table('./UCI HAR Dataset/train/subject_train.txt')
##print(train_subject)
train_file <- cbind(train_subject,train_act,train_results)

## Creating test dataset
test_results <-read.table('./UCI HAR Dataset/test/X_test.txt', sep="")
test_act<-read.table('./UCI HAR Dataset/test/Y_test.txt')
test_subject<-read.table('./UCI HAR Dataset/test/subject_test.txt')
test_file <- cbind(test_subject,test_act,test_results)


## 1. Merges the training and the test sets to create one data set.

complete_file<-rbind(train_file,test_file)   

## 2. Extracts only certain measurement. Two steps: 2.a & 2.b

## 2.a  Extract from features.txt all column names for mean and standard deviation measurements

  a<-1
  indNumber<-NULL
  indName<-NULL
  mn<-"mean()"  
  std<-"std()"
  for(i in 1:nrow(features)){
   if(grepl(mn,as.character(features[i,2]),fixed=TRUE) |  grepl(std,as.character(features[i,2]),fixed=TRUE)  ){
      indNumber[a]<-features[i,1]
      indName[a]<-as.character(features[i,2])
      a<-a+1     
     } ##end if
    } ##end for
    measurements<-data.frame(indNumber=indNumber,indName=indName)
   ## columnNames<-measurements[,2]
  ## print(columnNames)

## 2.b  Extracting from complete_file (train and test) only the measurements on the mean and standard deviation for each measurement. 

    filteredData<-data.frame(stringsAsFactors=FALSE) 
    filteredData<-complete_file[,1:2]   ##Initiating the dataframe

    for(m in 1:nrow(measurements)){
       index <-as.numeric(measurements[m,1]+2)
       newColumn<- as.character(complete_file[,index]) 
       filteredData<-cbind(filteredData,newColumn)     ##Adding new columns to dataset    
    }


## 3. Uses descriptive activity names to name the activities in the data set

labels<-read.table('./UCI HAR Dataset/activity_labels.txt')

for(i in 1:length(labels[,1])){
       filteredData[,2]<-replace(temp<-filteredData[,2],temp==labels[i,1],as.character(labels[i,2]))
       filteredData[,2]<-filteredData[,2]
    }
  
## 4. Labeling appropriately the data set with descriptive variable names.  

columnNames<-read.table('new_labels.txt', header=FALSE, sep='\n')

colNames<-c('Subject','Activity',as.character(columnNames[,1]))

## Including names to dataset
names(filteredData)<-colNames
write.table(filteredData,sep=" ",row.names=FALSE,file="completo.txt",col.names=TRUE,quote=FALSE)
print('Creating first dataset')


## 5. Creating a second, independent tidy data set with the average of each variable 
## for each activity and each subject.

dataset<-read.table('completo.txt', head=TRUE)
numCols=ncol(dataset)
colsName<-names(dataset)

## Get non-duplicated subject-activity pairs from columns 1 and 2 from dataset
## and create a new dataframe 

AllSubjAllAct<-dataset[,1:2]
UniqSubAct<-AllSubjAllAct[!duplicated(AllSubjAllAct),]
nonDuplicated<- nrow(UniqSubAct)

resul<-matrix(ncol=numCols,nrow=nonDuplicated)
resul<-data.frame(resul)

for(i in 1:nonDuplicated){
  z<-1
  avr<-NULL
  columns<-c(UniqSubAct[i,1],as.character(UniqSubAct[i,2]))
  for(y in 3:numCols){
    avr[z]<-mean(dataset[dataset$Subject==UniqSubAct[i,1] & dataset$Activity==UniqSubAct[i,2], y])
    z<-z+1
  }  ##end for y

 resul[i,]<-c(columns,avr)
 rm(columns)
}  ##end for i
names(resul) <- colsName
write.table(resul,sep=" ",row.name=FALSE,file="averages.txt",col.names=TRUE,quote=FALSE)
print('done!')



}








