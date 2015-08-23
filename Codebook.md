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

FEATURES_DF (with sample data selected for the script)

Measure_Code |	Measurement                      |
-------------|-----------------------------------|
1	           |  tBodyAcc-mean()-X                |
2	           |	tBodyAcc-mean()-Y                |
3	           |	tBodyAcc-mean()-Z                |
4	           |	tBodyAcc-std()-X                 |
5	           |	tBodyAcc-std()-Y                 |
6	           |	tBodyAcc-std()-Z                 |
41	         |  tGravityAcc-mean()-X             |
42	         |	tGravityAcc-mean()-Y             |
43           |	tGravityAcc-mean()-Z             |
44           |  tGravityAcc-std()-X              |
45           |  tGravityAcc-std()-Y              |
46           |  tGravityAcc-std()-Z              |
81           |  tBodyAccJerk-mean()-X            |
82           |  tBodyAccJerk-mean()-Y            |
83           |  tBodyAccJerk-mean()-Z            |
84           |  tBodyAccJerk-std()-X             |
85           |  tBodyAccJerk-std()-Y             |
86           |  tBodyAccJerk-std()-Z             |
121          |  tBodyGyro-mean()-X               |
122          |  tBodyGyro-mean()-Y               |
123          |  tBodyGyro-mean()-Z               |
124          |  tBodyGyro-std()-X                |
125          |  tBodyGyro-std()-Y                |
126          |  tBodyGyro-std()-Z                |
161          |  tBodyGyroJerk-mean()-X           |
162          |  tBodyGyroJerk-mean()-Y           |
163          |  tBodyGyroJerk-mean()-Z           |
164          |  tBodyGyroJerk-std()-X            |
165          |  tBodyGyroJerk-std()-Y            |
166          |  tBodyGyroJerk-std()-Z            |
201          |  tBodyAccMag-mean()               |
202          |  tBodyAccMag-std()                |
214          |  tGravityAccMag-mean()            |
215          |  tGravityAccMag-std()             |
227          |  tBodyAccJerkMag-mean()           |
228          |  tBodyAccJerkMag-std()            |
240          |  tBodyGyroMag-mean()              |
241          |  tBodyGyroMag-std()               |
253          |  tBodyGyroJerkMag-mean()          |
254          |  tBodyGyroJerkMag-std()           |
266          |  fBodyAcc-mean()-X                |
267          |  fBodyAcc-mean()-Y                |
268          |  fBodyAcc-mean()-Z                |
269          |  fBodyAcc-std()-X                 |
270          |  fBodyAcc-std()-Y                 |
271          |  fBodyAcc-std()-Z                 |
294          |  fBodyAcc-meanFreq()-X            |
295          |  fBodyAcc-meanFreq()-Y            |
296          |  fBodyAcc-meanFreq()-Z            |
345          |  fBodyAccJerk-mean()-X            |
346          |  fBodyAccJerk-mean()-Y            |
347          |  fBodyAccJerk-mean()-Z            |
348          |  fBodyAccJerk-std()-X             |
349          |  fBodyAccJerk-std()-Y             |
350          |  fBodyAccJerk-std()-Z             |
373          |  fBodyAccJerk-meanFreq()-X        |
374          |  fBodyAccJerk-meanFreq()-Y        |
375          |  fBodyAccJerk-meanFreq()-Z        |
424          |  fBodyGyro-mean()-X               |
425          |  fBodyGyro-mean()-Y               |
426          |  fBodyGyro-mean()-Z               |
427          |  fBodyGyro-std()-X                |
428          |  fBodyGyro-std()-Y                |
429          |  fBodyGyro-std()-Z                |
452          |  fBodyGyro-meanFreq()-X           |
453          |  fBodyGyro-meanFreq()-Y           |
454          |  fBodyGyro-meanFreq()-Z           |
503          |  fBodyAccMag-mean()               |
504          |  fBodyAccMag-std()                |
513          |  fBodyAccMag-meanFreq()           |
516          |  fBodyBodyAccJerkMag-mean()       |
517          |  fBodyBodyAccJerkMag-std()        |
526          |  fBodyBodyAccJerkMag-meanFreq()   |
529          |  fBodyBodyGyroMag-mean()          |
530          |  fBodyBodyGyroMag-std()           |
539          |  fBodyBodyGyroMag-meanFreq()      |
542          |  fBodyBodyGyroJerkMag-mean()      |
543          |  fBodyBodyGyroJerkMag-std()       |
552          |  fBodyBodyGyroJerkMag-meanFreq()  |



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
