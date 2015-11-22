## Read features, activities, test & train files.
## Provide descriptive variable names.
features <- read.table("features.txt")
feature_names <- as.vector(features$V2)
activity_labels <- read.table("activity_labels.txt", col.names=c("act_num","act_desc"))

subject_test <- read.table("subject_test.txt", col.names="subject")
x_test <- read.table("X_test.txt", col.names=(feature_names))
y_test <- read.table("y_test.txt", col.names="act_num")

subject_train <- read.table("subject_train.txt", col.names="subject")
x_train <- read.table("X_train.txt", col.names=(feature_names))
y_train <- read.table("y_train.txt", col.names="act_num")

## Combine all test datasets & remove duplicate columns.
all_test_data <- bind_cols(subject_test, y_test, x_test)
all_test_data <- all_test_data[, !duplicated(colnames(all_test_data))]

## Combine all training datasets & remove duplicate columns.
all_train_data <- bind_cols(subject_train, y_train, x_train)
all_train_data <- all_train_data[, !duplicated(colnames(all_train_data))]

## Combine test and training datasets.
all_data <- bind_rows(all_test_data, all_train_data)

## Provide descriptive variable names for activities.
all_data <- left_join(activity_labels, all_data, by="act_num")

## Extract only the measures on the mean and standard deviation for each measurement. 
all_data <- select(all_data, subject, act_desc, contains("mean"), contains("std"))

## Change activity variable to type "factor".
all_data$act_desc <- as.factor(all_data$act_desc)

## Create a new dataset with the average of each variable for each 
## subject/activity combination.
all_data <- group_by(all_data, subject, act_desc)
tidy_data <- summarize_each(all_data, funs(mean))

## Write dataset to working directory.
write.table(tidy_data, file="./tidy_data.txt", row.names=FALSE)

