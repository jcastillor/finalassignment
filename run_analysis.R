#Final Assignment Getting and Cleaning data JOSE CASTILLO RABAZO
# 1. Merges the training and test sets to create one ds
# 2. Extracts only the msrmnts on the mean and sd for each msrmnts
# 3. Uses descriptive activity names to name the activities in the ds
# 4. Label the data set in a correct way
# 5. from 4., creates a 2nd ds with the avg of each variable per activity
# and subject

library(dplyr)

if(!dir.exists("./data")){dir.create("./data")}
#First we're going to load every data set individually
#so we can get an idea of each dimension of the data set.
test_subjects <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
test_data <- read.table("data/UCI HAR Dataset/test/X_test.txt")
test_activities <- read.table("data/UCI HAR Dataset/test/y_test.txt")
train_subjects <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
train_data <- read.table("data/UCI HAR Dataset/train/X_train.txt")
train_activities <- read.table("data/UCI HAR Dataset/train/y_train.txt")

#We also have to load the labels for activities and features
activities <- read.table("data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("data/UCI HAR Dataset/features.txt")

#Now that everything is loaded individualy we can join the tables to create
#a single data set.
joint_data <- rbind(test_data, train_data)
joint_subjects <- rbind(test_subjects, train_subjects)
joint_activities <- rbind(test_activities, train_activities)

#Now we need to extract only the measurements of mean and standard deviation
col_index <- grep("mean|std",features[,2])
col_names <- grep("mean|std",features[,2],value = TRUE)
#clean names for any special characters
col_names <- gsub("[()-]","",col_names)
#Select from the full set of data only the columns selected previously
joint_data <- joint_data %>%
    select(col_index)
#Changing the names of the variables for their descriptrive names
names(joint_data) <- col_names
names(joint_activities) <- c("activity")
names(joint_subjects) <- c("subject")

#Now we change activity numbers for their descriptive names
joint_activities <- activities[match(joint_activities[,1],activities[,1]),2]

#Now we put everything together
joint_all <- cbind(joint_subjects, joint_activities, joint_data)

#Changing the names for clean ones
names(joint_all) <- c("subject", "activity", col_names)

#Now we create the second and final data set from the previous one
final <- joint_all %>% group_by(activity,subject) %>% summarize_all(funs(mean))

#Finally we use write.table to export the tidy data set
write.table(final, file ="./finalDS.txt" , row.names = FALSE)