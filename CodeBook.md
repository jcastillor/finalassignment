## file names

- test_subjects         : file containing the test subjects numbers
- test_data             : test subjects raw data
- test_activities       : test subjects activities
- train_subjects        : file containing the train subjects numbers
- train_data            : train subjects data
- train_activities      : test subjects activities 
- activities            : file indicating the number of each activity with its label
- features              : file containing all the features names from the feature vector

## variables

 - joint_data       : contains joined train and test data
 - joint_activities : contains joined activities numbers from train and test subjects
 - joint_subjects   : contains joined subject numbers from both test and train individuals
 - joint_all        : contains the previous three tables joined together
 - col_index        : vector indicating the index of the features that contain info about mean or standard deviation
 - col_names        : vector of characters indicating the names of the features that contain info about means or standard deviation
 - final            : final tidy data set with only the mean variables for each activity and subject
