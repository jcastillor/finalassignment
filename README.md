# Final Assignment

This repo is part of the final assignment needed for the Getting and Cleaning Data course by the JHU at Coursera.
Every analysis needed in order to complete this task is done within the `run_analysis.R`.

The rule of thought for this particular task has been to make it as simple as possible. No additional functions or subroutines have been used that are outside the main script, being the dplyr package the only library used.

This code assumes there is in the directory a folder named `data` with all the unzipped data files, after that, it follows the instructions of the assignment in order:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
