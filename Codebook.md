Original datasources: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

link for the data used: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The first step of the script merges the training set and test set together, in 3 different sets:

X - the values determined by the accelerometer
Y - the activity logged
S - The subject performing the activity

Using the features.txt extracts the mean and std features only from the X dataset, naming the columns appropiately. Merges the 3 datasets into one called CleanDataSet,
and uses the ddply function to group the data by subject and activity and calculate the mean between the values.

Finally extracts the activity names and changes their ID in the final dataset by their actual activity name.

The activities are:

walking,walkingupstairs,walkingdownstairs,sitting,standing,laying

The final dataset is called "tiddy" and  contains 180 obs. (30 subjects *  6 activities) with 68 columns:

Subject, activity, 33 mean values, 33 std values.

The tiddy dataset is saved as a CSV file called  "tiddy_dataset.csv"
