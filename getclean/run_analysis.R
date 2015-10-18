# Load the training data.
x_train <- read.table("./HARDataset/train/X_train.txt")
y_train <- read.table("./HARDataset/train/y_train.txt")
subject_train <- read.table("./HARDataset/train/subject_train.txt")

# Merge x_train and y_train and label new column.
xytrain <- cbind(y_train, x_train)
names(xytrain)[1] <- "Activity"

# Merge resulting xytrain with subject_train and label new column.
train_bound <- cbind(subject_train, xytrain)
names(train_bound)[1] <- "Subject"

# Reduce the output by keeping only the necessary columns.
train_bound <- train_bound[,c(1,2,3:8,43:48,83:88,123:128,163:168,
  203,204,216,217,229,230,242,243,255,256,268:273,347:352,426:431,
  505,506,518,519,531,532,544,545)]

# Load the test data.
x_test <- read.table("./HARDataset/test/X_test.txt")
y_test <- read.table("./HARDataset/test/y_test.txt")
subject_test <- read.table("./HARDataset/test/subject_test.txt")

# Merge x_test and y_test and label new column.
xytest <- cbind(y_test, x_test)
names(xytest)[1] <- "Activity"

# Merge resulting xytest with subject_test and label new column.
total_test <- cbind(subject_test, xytest)
names(total_test)[1] <- "Subject"

# Reduce the output by keeping only the necessary columns.
total_test <- total_test[,c(1,2,3:8,43:48,83:88,123:128,163:168,
  203,204,216,217,229,230,242,243,255,256,268:273,347:352,426:431,
  505,506,518,519,531,532,544,545)]

# Merge the combined test and training data sets.
totalbound <- merge(total_test, train_bound, all = TRUE)

# Load the features.txt file, reduce, and use it to label the 
# remaining columns.
features <- read.table("./HARDataset/features.txt")
features <- as.vector(features[c(1:6,41:46,81:86,121:126,161:166,
  201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,
  503,504,516,517,529,530,542,543),2])
library(data.table)
names(totalbound)[3:68] <- c(as.vector(features))

# Create a tidy table with the average of each variable for each 
# activity and each subject.
tidy_means = aggregate(totalbound[3:68], by=list(Subject=totalbound$Subject,
Activity=totalbound$Activity), mean)

# Swap out the activity codes for descriptive names.
for(i in 1:180) {
  if(tidy_means[i,2]==1) {
  tidy_means[i,2] <- "WALKING"
} else if(tidy_means[i,2]==2) {
  tidy_means[i,2] <- "WALKING_UPSTAIRS"
} else if(tidy_means[i,2]==3) {
  tidy_means[i,2] <- "WALKING_DOWNSTAIRS"
} else if(tidy_means[i,2]==4) {
  tidy_means[i,2] <- "SITTING"
} else if(tidy_means[i,2]==5) {
  tidy_means[i,2] <- "STANDING"
} else if(tidy_means[i,2]==6) {
  tidy_means[i,2] <- "LAYING"
}
}

# Write the resulting table to the working directory
write.table(tidy_means, file = "tidy_means.txt", row.names = FALSE) 

# Have a nice day.

