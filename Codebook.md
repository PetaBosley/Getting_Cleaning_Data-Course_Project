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

Measure_Code |	Measurement       |
-------------|--------------------|
1	           |  tBodyAcc-mean()-X |
2	           |	tBodyAcc-mean()-Y |
3	           |	tBodyAcc-mean()-Z |
4	           |	tBodyAcc-std()-X  |
5	           |	tBodyAcc-std()-Y  |
6	           |	tBodyAcc-std()-Z  |


ACTIVITY_LABELS.TXT (with sample data)

Act_Code	   |   Activity           |
-------------|----------------------|
1	           |   WALKING            |
2		         |   WALKING_UPSTAIRS   |
3	           |   WALKING_DOWNSTAIRS |
4	           |   SITTING            |
5	           |   STANDING           |
6	           |   LAYING             |


The training and test data were combined into 2 data frames and the columns with "mean" or "std" in the column names were extracted for further processing. All of the extracted training data was read into a training data frame, with a similar activity for the test data in the test data frame.

These two data frames were merged into a single data frame for further processing.

The merged data frame was then ordered by subject and by activity and more human-friendly labels were applied to the column names.
The data was then summarised to provide an average value for each of the 180 subject / activity pairings.

Finally, the data was written out as a txt file and uploaded to Github.
