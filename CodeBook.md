Part 1.
How I merge the datasets
For trainning dataset, we have "subject_train.txt", "y_train.txt","X_train.txt" and , these three
files contains the subject ID, acvtivity type and corresponding variable values. So we
combine these three sets by columns.
File "activity_labels" contains activity labels, we extract them out.
File "features.txt" contains all the feature variable names, we also extract them out.
Then we name the merged training set with the above feature names and use names to denote acitivtie rather than numbers.
Do exactly the same thing to test dataset.
In the end we combine the two dataset we got by rows.
Next, we select the features whose name contain mean or standard deviation in it, and only keep those columns
of our combined dataset.
Then we rename the dataset we got from last step, remove any "-","()" and space in variable names and
capitalize m in “mean" and s in "std".
Finally, we output the dataset as txt file and csv file.

This is the variable names and their description in dataset of file "merged_tidy_dataset.txt".
"merged_tidy_dataset.txt" contains the merged training and test dataset  with only measurements on the mean and standard deviation for each measurement.



|    | Variable                     | Description                                                                              | Values                                                                     |
|----|------------------------------|------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| 1  | subject                      | subject ID                                                                               | integer 1-30                                                               |
| 2  | activity                     | activity type                                                                            | WALKING,  WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,  STANDING, LAYING |
| 3  | tBodyAccMeanX                | mean of total body acceleration in X axis                                                |                                                                            |
| 4  | tBodyAccMeanY                | mean of total body acceleration in Y axis                                                |                                                                            |
| 5  | tBodyAccMeanZ                | mean of total body acceleration in Z axis                                                |                                                                            |
| 6  | tBodyAccStdX                 | standard deviation of total body acceleration in X axis                                  |                                                                            |
| 7  | tBodyAccStdY                 | standard deviation of total body acceleration in Y axis                                  |                                                                            |
| 8  | tBodyAccStdZ                 | standard deviation of total body acceleration in Z axis                                  |                                                                            |
| 9  | tGravityAccMeanX             | mean of total gravity acceleration in X axis                                             |                                                                            |
| 10 | tGravityAccMeanY             | mean of total gravity acceleration in Y axis                                             |                                                                            |
| 11 | tGravityAccMeanZ             | mean of total gravity acceleration in Z axis                                             |                                                                            |
| 12 | tGravityAccStdX              | standard deviation of total gravity acceleration in X axis                               |                                                                            |
| 13 | tGravityAccStdY              | standard deviation of total gravity acceleration in Y axis                               |                                                                            |
| 14 | tGravityAccStdZ              | standard deviation of total gravity acceleration in Z axis                               |                                                                            |
| 15 | tBodyAccJerkMeanX            | mean of total body acceleration Jerk in X axis                                           |                                                                            |
| 16 | tBodyAccJerkMeanY            | mean of total body acceleration Jerk in Y axis                                           |                                                                            |
| 17 | tBodyAccJerkMeanZ            | mean of total body acceleration Jerk in Z axis                                           |                                                                            |
| 18 | tBodyAccJerkStdX             | standard deviation of total body acceleration Jerk in X axis                             |                                                                            |
| 19 | tBodyAccJerkStdY             | standard deviation of total body acceleration Jerk in Y axis                             |                                                                            |
| 20 | tBodyAccJerkStdZ             | standard deviation of total body acceleration Jerk in Z axis                             |                                                                            |
| 21 | tBodyGyroMeanX               | mean of total body gyroscope in X axis                                                   |                                                                            |
| 22 | tBodyGyroMeanY               | mean of total body gyroscope in Y axis                                                   |                                                                            |
| 23 | tBodyGyroMeanZ               | mean of total body gyroscope in Z axis                                                   |                                                                            |
| 24 | tBodyGyroStdX                | standard deviation of total body gyroscope in X axis                                     |                                                                            |
| 25 | tBodyGyroStdY                | standard deviation of total body gyroscope in Y axis                                     |                                                                            |
| 26 | tBodyGyroStdZ                | standard deviation of total body gyroscope in Z axis                                     |                                                                            |
| 27 | tBodyGyroJerkMeanX           | mean of total body gyroscope Jerk in X axis                                              |                                                                            |
| 28 | tBodyGyroJerkMeanY           | mean of total body gyroscope Jerk in Y axis                                              |                                                                            |
| 29 | tBodyGyroJerkMeanZ           | mean of total body gyroscope Jerk in Z axis                                              |                                                                            |
| 30 | tBodyGyroJerkStdX            | standard deviation of total body gyroscope Jerk in X axis                                |                                                                            |
| 31 | tBodyGyroJerkStdY            | standard deviation of total body gyroscope Jerk in Y axis                                |                                                                            |
| 32 | tBodyGyroJerkStdZ            | standard deviation of total body gyroscope Jerk in Z axis                                |                                                                            |
| 33 | tBodyAccMagMean              | mean of total body acceleration magnitude                                                |                                                                            |
| 34 | tBodyAccMagStd               | standard deviation of total body acceleration magnitude                                  |                                                                            |
| 35 | tGravityAccMagMean           | mean of total gravity acceleration magnitude                                             |                                                                            |
| 36 | tGravityAccMagStd            | standard deviation of total gravity acceleration magnitude                               |                                                                            |
| 37 | tBodyAccJerkMagMean          | mean of total  body acceleration Jerk magnitude                                          |                                                                            |
| 38 | tBodyAccJerkMagStd           | standard devitation of total  body acceleration Jerk magnitude                           |                                                                            |
| 39 | tBodyGyroMagMean             | mean of total  body gyroscope magnitude                                                  |                                                                            |
| 40 | tBodyGyroMagStd              | standard deviation of total  body gyroscope magnitude                                    |                                                                            |
| 41 | tBodyGyroJerkMagMean         | mean of total  body gyroscope Jerk magnitude                                             |                                                                            |
| 42 | tBodyGyroJerkMagStd          | standard deviation of total  body gyroscope Jerk magnitude                               |                                                                            |
| 43 | fBodyAccMeanX                | mean of frequency domain signals of body acceleration in X axis                          |                                                                            |
| 44 | fBodyAccMeanY                | mean of frequency domain signals of body acceleration in Y axis                          |                                                                            |
| 45 | fBodyAccMeanZ                | mean of frequency domain signals of body acceleration in Z axis                          |                                                                            |
| 46 | fBodyAccStdX                 | standard deviation of frequency domain signals of body acceleration in X axis            |                                                                            |
| 47 | fBodyAccStdY                 | standard deviation of frequency domain signals of body acceleration in Y axis            |                                                                            |
| 48 | fBodyAccStdZ                 | standard deviation of frequency domain signals of body acceleration in Z axis            |                                                                            |
| 49 | fBodyAccMeanFreqX            | mean of frequency domain signals of body acceleration frequency in X axis                |                                                                            |
| 50 | fBodyAccMeanFreqY            | mean of frequency domain signals of body acceleration frequency in Y axis                |                                                                            |
| 51 | fBodyAccMeanFreqZ            | mean of frequency domain signals of body acceleration frequency in Z axis                |                                                                            |
| 52 | fBodyAccJerkMeanX            | mean of frequency domain signals of body acceleration Jerk in X axis                     |                                                                            |
| 53 | fBodyAccJerkMeanY            | mean of frequency domain signals of body acceleration Jerk in Y axis                     |                                                                            |
| 54 | fBodyAccJerkMeanZ            | mean of frequency domain signals of body acceleration Jerk in Z axis                     |                                                                            |
| 55 | fBodyAccJerkStdX             | standard deviation of frequency domain signals of body acceleration Jerk in X axis       |                                                                            |
| 56 | fBodyAccJerkStdY             | standard deviation of frequency domain signals of body acceleration Jerk in Y axis       |                                                                            |
| 57 | fBodyAccJerkStdZ             | standard deviation  of frequency domain signals of body acceleration Jerk in Z axis      |                                                                            |
| 58 | fBodyAccJerkMeanFreqX        | mean of frequency domain signals of body acceleration Jerk frequency in X axis           |                                                                            |
| 59 | fBodyAccJerkMeanFreqY        | mean of frequency domain signals of body acceleration Jerk frequency in Y axis           |                                                                            |
| 60 | fBodyAccJerkMeanFreqZ        | mean of frequency domain signals of body acceleration Jerk frequency in Z axis           |                                                                            |
| 61 | fBodyGyroMeanX               | mean of frequency domain signals of body  gyroscope in X axis                            |                                                                            |
| 62 | fBodyGyroMeanY               | mean of frequency domain signals of body  gyroscope in Y axis                            |                                                                            |
| 63 | fBodyGyroMeanZ               | mean of frequency domain signals of body  gyroscope in Z axis                            |                                                                            |
| 64 | fBodyGyroStdX                | standard deviation of frequency domain signals of body  gyroscope in X axis              |                                                                            |
| 65 | fBodyGyroStdY                | standard deviation of frequency domain signals of body  gyroscope in Y axis              |                                                                            |
| 66 | fBodyGyroStdZ                | standard deviation of frequency domain signals of body  gyroscope in Z axis              |                                                                            |
| 67 | fBodyGyroMeanFreqX           | mean of frequency domain signals of body  gyroscope frequency in X axis                  |                                                                            |
| 68 | fBodyGyroMeanFreqY           | mean of frequency domain signals of body  gyroscope frequency in Y axis                  |                                                                            |
| 69 | fBodyGyroMeanFreqZ           | mean of frequency domain signals of body  gyroscope frequency in Z axis                  |                                                                            |
| 70 | fBodyAccMagMean              | mean of frequency domain signals of body  acceleration magnitude                         |                                                                            |
| 71 | fBodyAccMagStd               | standard deviation of frequency domain signals of body  acceleration magnitude           |                                                                            |
| 72 | fBodyAccMagMeanFreq          | mean of frequency domain signals of body  acceleration magnitude frequency               |                                                                            |
| 73 | fBodyBodyAccJerkMagMean      | mean of frequency domain signals of body  body acceleration Jerk magnitude               |                                                                            |
| 74 | fBodyBodyAccJerkMagStd       | standard deviation of frequency domain signals of body  body acceleration Jerk magnitude |                                                                            |
| 75 | fBodyBodyAccJerkMagMeanFreq  | mean of frequency domain signals of body  body acceleration Jerk magnitude frequency     |                                                                            |
| 76 | fBodyBodyGyroMagMean         | mean of frequency domain signals of body  body  gyroscope magnitude                      |                                                                            |
| 77 | fBodyBodyGyroMagStd          | standard deviation of frequency domain signals of body  body  gyroscope magnitude        |                                                                            |
| 78 | fBodyBodyGyroMagMeanFreq     | mean of frequency domain signals of body  body  gyroscope magnitude frequency            |                                                                            |
| 79 | fBodyBodyGyroJerkMagMean     | mean of frequency domain signals of body  body  gyroscope Jerk magnitude                 |                                                                            |
| 80 | fBodyBodyGyroJerkMagStd      | standard deviation of frequency domain signals of body  body  gyroscope Jerk magnitude   |                                                                            |
| 81 | fBodyBodyGyroJerkMagMeanFreq | mean of frequency domain signals of body  body  gyroscope Jerk magnitude frequency       |                                                                            |



The variables in file "average_per_subject_per_activity.txt" all start with "Mean", except subject and activity.
Since this file contains the dataset with the average of each variable for each activity and each subject.
To interpret each variable name, ignore the prefix "Mean" of each variable, only look at the rest part
of each variable name, they can be brief interpreted as following:

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
