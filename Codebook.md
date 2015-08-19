This is the codebook for the Course Project from Coursera / Getting & Cleaning Data

I reviewed the features_info.txt & features.txt file to allow for selection of 
the required columns (those with "mean" or "std" in the column names).

I also imported the following files into my script;

features.txt
activity_labels.txt

subject_test.txt
X_test.txt
y_test.txt
subject_train.txt
X_train.txt
y_train.txt

These correspond to data frames within the script;

FEATURES_DF (with sample data)
Measure_Code	Measurement
1	tBodyAcc-mean()-X
2	tBodyAcc-mean()-Y
3	tBodyAcc-mean()-Z
4	tBodyAcc-std()-X
5	tBodyAcc-std()-Y
6	tBodyAcc-std()-Z

ACTIVITY_LABELS.TXT (with sample data)
Act_Code	Activity
1	WALKING
2	WALKING_UPSTAIRS
3	WALKING_DOWNSTAIRS
4	SITTING
5	STANDING
6	LAYING


