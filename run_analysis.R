fileurl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile="file.zip",method="auto")
rm(fileurl)
	## Start opening connections to the data files in the zip. This avoids
	## really unpacking files into the user's working directory (less mess)
con1	<- unz("file.zip",filename="UCI HAR Dataset/test/X_test.txt")
con2	<- unz("file.zip",filename="UCI HAR Dataset/test/y_test.txt")
con3	<- unz("file.zip",filename="UCI HAR Dataset/test/subject_test.txt")
con4	<- unz("file.zip",filename="UCI HAR Dataset/train/X_train.txt")
con5	<- unz("file.zip",filename="UCI HAR Dataset/train/y_train.txt")
con6	<- unz("file.zip",filename="UCI HAR Dataset/train/subject_train.txt")
con7	<- unz("file.zip",filename="UCI HAR Dataset/features.txt")
	## The separator in this file is sometimes 1 space, other times 2 spaces
	## Treating columns as fixed-width is one of the ways to get around that
testx	<- read.fwf(con1, widths=(rep(16,561)), colClasses=(rep("numeric",561)))
	## read.table works fine with default settings for the other files
testy	<- read.table(con2)
testz	<- read.table(con3)
	## As before. The performance benefit of colClasses (=no auto-analysis
	## of column contents, assume numbers) isn't huge, but it helps a bit.
trainx	<- read.fwf(con4, widths=(rep(16,561)), colClasses=(rep("numeric",561)))
trainy	<- read.table(con5)
trainz	<- read.table(con6)
	## ; is not the real separator so this 'merges' values that would be in 
	## separate columns otherwise. For now, the messy but definitely unique
	## names this yields, are safer (esp. if dplyr gets used). Cleanup later
header	<- read.table(con7, sep=";")
	## closing connections manually should not be needed: connections get
	## auto-closed, and close() will actually error. if that is not an
	## issue and one wants to call close(), uncomment this:
## close(con1,con2,con3,con4,con5,con6,con7)
	## columns will represent Subject, Activity, then all measurements 
testset  <- cbind(testz, testy, testx)
trainset <- cbind(trainz, trainy, trainx)
	## merge the two datasets
datasum <- rbind(trainset,testset)
	## header names to be converted from being observations in a data frame
header	<- as.vector(header[,1])
	## then applied as column names
colnames(datasum) <- c("subject_id", "activity_id", header)
	## we are only interested in the measurements that include the word mean
	## (but not meanFreq) or std (=standard deviation). So we will define
	## columns with those strings as ones to keep. The subject and activity
	## columns, we of course also need to keep.
wantedcols <- grep("subject|activity|mean[^F]|std", colnames(datasum))
	## only keep wanted columns by making a subset of just those columns
datasum <- datasum[,wantedcols]
	## the R environment is getting full. Let's just keep datasum. This can
	## be done with rm(list=ls(pattern="[^datasum]")) but that has risks.
rm (con1, con2, con3, con4, con5, con6, con7, header, wantedcols,
	testx, testy, testz, trainx, trainy, trainz, testset, trainset)
	## remove prefix numbers now, correct repeated "Body" in some headers
colnames(datasum) <- gsub("^[1-9].?.? ","", colnames(datasum))
colnames(datasum) <- gsub("BodyBody","Body", colnames(datasum))
	## let's go all-lowercase with hyphens, no CamelCase, remove (), and 
	## write out a few abbreviations some more. Writing out things more than
	## this makes it too long again I think. Always a compromise/debatable.
colnames(datasum) <- gsub("[()]","", colnames(datasum))
colnames(datasum) <- gsub("tBody","time-body-", colnames(datasum))
colnames(datasum) <- gsub("fBody","freq-body-", colnames(datasum))
colnames(datasum) <- gsub("tGravity","time-gravity-", colnames(datasum))
colnames(datasum) <- gsub("fGravity","freq-gravity-", colnames(datasum))
colnames(datasum) <- gsub("Gyro","gyro", colnames(datasum))
colnames(datasum) <- gsub("Acc","accel", colnames(datasum))
colnames(datasum) <- gsub("Jerk","-jerk", colnames(datasum))
colnames(datasum) <- gsub("Mag","-magnitude", colnames(datasum))
colnames(datasum) <- gsub("-X","-x", colnames(datasum))
colnames(datasum) <- gsub("-Y","-y", colnames(datasum))
colnames(datasum) <- gsub("-Z","-z", colnames(datasum))
	## The names for the activities are in the zip as activity_labels.txt,
	## that txt might be used as a lookup table. But it's a short list and I
	## disagree with the .txt (laying != lying and one does not necessarily
	## need to be going up any stairs to be 'walking upstairs'). Manually:
datasum$activity_id <- gsub("1", "walking", datasum$activity_id)
datasum$activity_id <- gsub("2", "going_up_stairs", datasum$activity_id)
datasum$activity_id <- gsub("3", "going_down_stairs", datasum$activity_id)
datasum$activity_id <- gsub("4", "sitting", datasum$activity_id)
datasum$activity_id <- gsub("5", "standing", datasum$activity_id)
datasum$activity_id <- gsub("6", "lying_down", datasum$activity_id)
	## There are multiple rows of measurements for the same subject+activity
	## and they are not all grouped. Sort by subject and then by activity:
datasum <- datasum[order(datasum[,1],datasum[,2]),]
	## The subjects are numbered but should not be interpreted as being in
	## any particular order: let's make them factors.
datasum$subject_id 	<- as.factor(datasum$subject_id)
datasum$activity_id 	<- as.factor(datasum$activity_id)
	## Done with the data set. On to creating the summary version where we
	## take the mean of all the 'same' measurements (in the sense that they
	## are the same measurement type for the same subject, same activity)
datasummary <- aggregate (x=datasum[3:68], by=list(subject=datasum$subject_id,
				activity=datasum$activity_id), FUN=mean)
	## sort again
datasummary <- datasummary[order(datasummary[,1],datasummary[,2]),]
	## write out files
write.csv(datasum,file="fulldata_onlymean_std.csv", row.names = FALSE)
write.csv(datasummary,file="data_summarized.csv", row.names = FALSE)
	## clean up environment
rm(datasum, datasummary)