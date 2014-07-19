# get and merge test data
testX <- read.table(paste("test", "X_test.txt", collapse=NULL, sep="\\"))
testSubject <- read.table(paste("test","subject_test.txt", collapse=NULL, sep="\\"))
testY <- read.table(paste("test","y_test.txt", collapse=NULL, sep="\\"))
predatTest <- cbind(testY, testX)          
datTest <- cbind(testSubject, predatTest)            

# get and merge train data
trainX <- read.table(paste("train", "X_train.txt", collapse=NULL, sep="\\"))
trainSubject <- read.table(paste("train","subject_train.txt", collapse=NULL, sep="\\"))
trainY <- read.table(paste("train","y_train.txt", collapse=NULL, sep="\\"))
predatTrain <- cbind(trainY, trainX)          
datTrain <- cbind(trainSubject, predatTrain)   

dat <- rbind(datTest, datTrain)

features <- read.table("features.txt")
features1 <- as.vector(features[,2])                       
features2 <- c("Subject", "Activity_Code", features1)
colnames(dat) <- features2

# getting mean and standard deviation
featuresFull <- names(dat)
sd <- grep("std()", featuresFull, value=FALSE, fixed=TRUE)
avg <- grep("mean()", featuresFull, value=FALSE, fixed=TRUE)
stats <- c(1,2, sd, avg)
df <- dat[, stats]

library(data.table)
dt <- as.data.table(df)
par <- c("Subject", "Activity_Code")
nms <- names(dt)[4:68]
dt2 <- dt[, lapply(.SD,mean),by=par]
dtOrder <- dt2[order(Subject, Activity_Code)]
dfOrder <- as.data.frame(dtOrder)

# naming the activities in new data set
activityNames <- c()
for (i in 1:nrow(dfOrder)) {
        chars <- as.character(dfOrder[i,2])
        switch (chars,
                "1" = activityNames[i] <- "Walking",
                "2" = activityNames[i] <- "Walking_Upstairs",
                "3" = activityNames[i] <- "Walking_Downstairs",
                "4" = activityNames[i] <- "Sitting",
                "5" = activityNames[i] <- "Standing",
                "6" = activityNames[i] <- "Laying"
        )
}

dfActivities <- cbind(dfOrder[,1:2], activityNames, dfOrder[, 4:68])

# data with averages
write.table(dfActivities, "activityDataset.txt",row.names = FALSE,append=FALSE, sep=" ")
