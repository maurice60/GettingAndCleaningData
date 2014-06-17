library(reshape2)
zip <- "UCI HAR Dataset.zip"
datTest <- read.table(unz(zip, "UCI HAR Dataset/test/X_test.txt")) 
datTrain <- read.table(unz(zip, "UCI HAR Dataset/train/X_train.txt"))
datHeadings <- read.table(unz(zip, "UCI HAR Dataset/features.txt"))
actLabel <- read.table(unz(zip, "UCI HAR Dataset/activity_labels.txt"))
subTest <- read.table(unz(zip, "UCI HAR Dataset/test/subject_test.txt"))
subTrain <- read.table(unz(zip, "UCI HAR Dataset/train/subject_train.txt"))
actTest <- read.table(unz(zip, "UCI HAR Dataset/test/y_test.txt"))
actTrain <- read.table(unz(zip, "UCI HAR Dataset/train/y_train.txt"))
rm(zip)

datTest <- cbind(actTest, subTest, datTest)
datTrain <- cbind(actTrain, subTrain, datTrain)
datMerge <- rbind(datTest, datTrain)

names(datMerge) <- c("activityCode", "subject", as.vector(datHeadings$V2))
names(actLabel) <- c("activityCode", "activity")

datMerge <- datMerge[,grep("subject|activityCode|-mean\\(|-std\\(", names(datMerge))]
datMerge <- merge(actLabel, datMerge)

datMelt <- melt(datMerge, id.vars = c("activityCode", "activity", "subject"))
datOutput <- dcast(datMelt, activityCode+activity+subject ~ variable, mean)

rm(datTest, datTrain, datHeadings, subTest, subTrain, actTest, actTrain, actLabel, datMelt, datMerge)
