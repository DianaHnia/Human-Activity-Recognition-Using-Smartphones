Project Description
-------------------

Final project of *Getting and Cleaning Data* course offered by JHU on
Coursera. The aim of this assignment is to collect, work with, and clean
a data set that can be used for later analysis. The data set to be
cleaned in is the *Human Activity Recognition*. It is a “database built
from the recordings of 30 subjects performing activities of daily living
(ADL) while carrying a waist-mounted smartphone with embedded inertial
sensors.” [UCI Machine Learning
Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Study design and data processing
--------------------------------

### Collection of the raw data

The data set for this assignment was downloaded from [data for the
project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
provided in course project’s page. It includes information about the
experiment and of how the raw data was collected. All the files in the
downloaded zip where used in a way to create the tidy data set except
for the files in *Inertial Signals* sub-directories in each of the
*test* and *train* directories.

### Notes on the original (raw) data

A full description of the experiment and raw data is available at the
[site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)\[1\]
where the data was obtained.

From the ‘features\_info.txt’ in the downloaded data set:

"The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
signals (prefix ‘t’ to denote time) were captured at a constant rate of
50 Hz. Then they were filtered using a median filter and a 3rd order low
pass Butterworth filter with a corner frequency of 20 Hz to remove
noise. Similarly, the acceleration signal was then separated into body
and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3
Hz.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the ‘f’ to
indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for
each pattern"  
A set of variables were estimated from these signals and additional
vectors were obtained. Among these, only estimates of mean and standard
deviations were selected for the tidy dataset, as per the assignment’s
requirements.

Creating the tidy datafile
--------------------------

Creating the tidy data was made using an R script (R version 3.5.2
(2018-12-20)) that reads files from the downloaded data, processes it,
and saves the newly created tidy data to a text file called
‘tidy\_data.txt’.

### Guide to create the tidy data file

1.  Check your current R version, if it is older than the above
    mentioned, please update.  
2.  Open ‘run\_analysis.R’ in RStudio and load (install if neccessary)
    the *tidyverse* library  
3.  Set your working directory and create a sub-directory called
    *data*  
4.  When download is done, please go to directory, right click and
    *extract here*  
5.  Run ‘run\_analysis.R’.  
6.  The ‘tidy\_data.txt’ file is now created and saved in the *data*
    sub-directory of your current working directory.

### Cleaning of the data

The R cript does the following tasks (copied from the course):

1.  Merges the training and the test sets to create one data set.  
2.  Extracts only the measurements on the mean and standard deviation
    for each measurement.  
3.  Uses descriptive activity names to name the activities in the data
    set.  
4.  Appropriately labels the data set with descriptive variable names.  
5.  From the data set in step 4, creates a second, independent tidy data
    set with the average of each variable for each activity and each
    subject.

For a more detailed description, please refer to the modified
‘README.txt’ file and the ‘run\_analysis.R’ which has the code along
with descriptive comments.

Description of the variables in the ‘tidy\_data.txt’ file
---------------------------------------------------------

The tidy data set has 180 observations and 81 variables.

Notes:
======

All the numeric variables are normalized and bounded within \[-1,1\].
This is not part of the data cleaning project, but is a fact from the
downloaded data sets. Please, refer to ‘README.txt’ file.

Variable renaming schema used has 5 parts and is in the form:
AxisSignalEstimationAvrgDomain: 12345. Each part starts with a capital
letter.  
1: refers to axis. Values are X or Y or Z or blank  
2: refers to signals measured, 17 levels: BodyAcc, BodyAccJerk,
BodyAccJerkMag, BodyAccJerkMagTdomain, BodyAccJerkTdomain, BodyAccMag,
BodyAccMagTdomain, BodyAccTdomain, BodyGyro, BodyGyroJerkMag,
BodyGyroJerkMagTdomain, BodyGyroJerkTdomain, BodyGyroMag,
BodyGyroMagTdomain, BodyGyroTdomain, GravityAccMagTdomain,
GravityAccTdomain  
3: refers to estimated value of either mean, standard deviation, or mean
frequency. Values are Mean or Std or MeanFreq 4: refers to average.
Value is Avrg  
5: refers to time doman or frequency domain: Values are Tdomain or
Fdomain

| Variable                           | Class   | Units | Description                                                                                                                                      |
|:-----------------------------------|:--------|:------|:-------------------------------------------------------------------------------------------------------------------------------------------------|
| volunteerID                        | integer | none  | Unique ID number for each participant. Range is from 1-30                                                                                        |
| activity                           | factor  | none  | Activity, among 6, that is being performed by participant. Levels:laying, sitting, standing, walking, walking\_downstairs, and walking\_upstairs |
| XBodyAccMeanAvrgTdomain            | numeric | m/s^2 | Average of body accelerometer mean on the X-axis in the time domain                                                                              |
| YBodyAccMeanAvrgTdomain            | numeric | m/s^2 | Average of body accelerometer mean on the Y-axis in the time domain                                                                              |
| ZBodyAccMeanAvrgTdomain            | numeric | m/s^2 | Average of body accelerometer mean on the Z-axis in the time domain                                                                              |
| XBodyAccStdAvrgTdomain             | numeric | m/s^2 | Average of body accelerometer standard deviation on the X-axis in the time domain                                                                |
| YBodyAccStdAvrgTdomain             | numeric | m/s^2 | Average of body accelerometer standard deviation on the Y-axis in the time domain                                                                |
| ZBodyAccStdAvrgTdomain             | numeric | m/s^2 | Average of body accelerometer standard deviation on the Z-axis in the time domain                                                                |
| XGravityAccMeanAvrgTdomain         | numeric | m/s^2 | Average of gravity accelerometer mean on the X-axis in the time domain                                                                           |
| YGravityAccMeanAvrgTdomain         | numeric | m/s^2 | Average of gravity accelerometer mean on the Y-axis in the time domain                                                                           |
| ZGravityAccMeanAvrgTdomain         | numeric | m/s^2 | Average of gravity accelerometer mean on the Z-axis in the time domain                                                                           |
| XGravityAccStdAvrgTdomain          | numeric | m/s^2 | Average of gravity accelerometer standard deviation on the X-axis in the time domain                                                             |
| YGravityAccStdAvrgTdomain          | numeric | m/s^2 | Average of gravity accelerometer standard deviation on the Y-axis in the time domain                                                             |
| ZGravityAccStdAvrgTdomain          | numeric | m/s^2 | Average of gravity accelerometer standard deviation on the Z-axis in the time domain                                                             |
| XBodyAccJerkMeanAvrgTdomain        | numeric | m/s^2 | Average of body accelerometer jerk mean on the X-axis in the time domain                                                                         |
| YBodyAccJerkMeanAvrgTdomain        | numeric | m/s^2 | Average of body accelerometer jerk mean on the Y-axis in the time domain                                                                         |
| ZBodyAccJerkMeanAvrgTdomain        | numeric | m/s^2 | Average of body accelerometer jerk mean on the Z-axis in the time domain                                                                         |
| XBodyAccJerkStdAvrgTdomain         | numeric | m/s^2 | Average of body accelerometer jerk standard deviation on the X-axis in the time domain                                                           |
| YBodyAccJerkStdAvrgTdomain         | numeric | m/s^2 | Average of body accelerometer jerk standard deviation on the Y-axis in the time domain                                                           |
| ZBodyAccJerkStdAvrgTdomain         | numeric | m/s^2 | Average of body accelerometer jerk standard deviation on the Z-axis in the time domain                                                           |
| XBodyGyroMeanAvrgTdomain           | numeric | rad/s | Average of body gyroscope mean on the X-axis in the time domain                                                                                  |
| YBodyGyroMeanAvrgTdomain           | numeric | rad/s | Average of body gyroscope mean on the Y-axis in the time domain                                                                                  |
| ZBodyGyroMeanAvrgTdomain           | numeric | rad/s | Average of body gyroscope mean on the Z-axis in the time domain                                                                                  |
| XBodyGyroStdAvrgTdomain            | numeric | rad/s | Average of body gyroscope standard deviation on the X-axis in the time domain                                                                    |
| YBodyGyroStdAvrgTdomain            | numeric | rad/s | Average of body gyroscope standard deviation on the Y-axis in the time domain                                                                    |
| ZBodyGyroStdAvrgTdomain            | numeric | rad/s | Average of body gyroscope standard deviation on the Z-axis in the time domain                                                                    |
| XBodyGyroJerkMeanAvrgTdomain       | numeric | rad/s | Average of body gyroscope jerk mean on the X-axis in the time domain                                                                             |
| YBodyGyroJerkMeanAvrgTdomain       | numeric | rad/s | Average of body gyroscope jerk mean on the Y-axis in the time domain                                                                             |
| ZBodyGyroJerkMeanAvrgTdomain       | numeric | rad/s | Average of body gyroscope jerk mean on the Z-axis in the time domain                                                                             |
| XBodyGyroJerkStdAvrgTdomain        | numeric | rad/s | Average of body gyroscope jerk standard deviation on the X-axis in the time domain                                                               |
| YBodyGyroJerkStdAvrgTdomain        | numeric | rad/s | Average of body gyroscope jerk standard deviation on the Y-axis in the time domain                                                               |
| ZBodyGyroJerkStdAvrgTdomain        | numeric | rad/s | Average of body gyroscope jerk standard deviation on the Z-axis in the time domain                                                               |
| BodyAccMagMeanAvrgTdomain          | numeric | m/s^2 | Average of body accelerometer magnitude mean in the time domain                                                                                  |
| BodyAccMagStdAvrgTdomain           | numeric | m/s^2 | Average of body accelerometer magnitude standard deviation in the time domain                                                                    |
| GravityAccMagMeanAvrgTdomain       | numeric | m/s^2 | Average of gravity accelerometer magnitude mean in the time domain                                                                               |
| GravityAccMagStdAvrgTdomain        | numeric | m/s^2 | Average of gravity accelerometer magnitude standard deviation in the time domain                                                                 |
| BodyAccJerkMagMeanAvrgTdomain      | numeric | m/s^2 | Average of body accelerometer jerk magnitude mean in the time domain                                                                             |
| BodyAccJerkMagStdAvrgTdomain       | numeric | m/s^2 | Average of body accelerometer jerk magnitude standard deviation in the time domain                                                               |
| BodyGyroMagMeanAvrgTdomain         | numeric | rad/s | Average of body gyroscope magnitude mean in the time domain                                                                                      |
| BodyGyroMagStdAvrgTdomain          | numeric | rad/s | Average of body gyroscope magnitude standard deviation in the time domain                                                                        |
| BodyGyroJerkMagMeanAvrgTdomain     | numeric | rad/s | Average of body gyroscope jerk magnitude mean in the time domain                                                                                 |
| BodyGyroJerkMagStdAvrgTdomain      | numeric | rad/s | Average of body gyroscope jerk magnitude standard deviation in the time domain                                                                   |
| XBodyAccMeanAvrgFdomain            | numeric | m/s^2 | Average of body accelerometer mean on the X-axis in the frequency domain                                                                         |
| YBodyAccMeanAvrgFdomain            | numeric | m/s^2 | Average of body accelerometer mean on the Y-axis in the frequency domain                                                                         |
| ZBodyAccMeanAvrgFdomain            | numeric | m/s^2 | Average of body accelerometer mean on the Z-axis in the frequency domain                                                                         |
| XBodyAccStdAvrgFdomain             | numeric | m/s^2 | Average of body accelerometer standard deviation on the X-axis in the frequency domain                                                           |
| YBodyAccStdAvrgFdomain             | numeric | m/s^2 | Average of body accelerometer standard deviation on the Y-axis in the frequency domain                                                           |
| ZBodyAccStdAvrgFdomain             | numeric | m/s^2 | Average of body accelerometer standard deviation on the Z-axis in the frequency domain                                                           |
| XBodyAccMeanFreqAvrgFdomain        | numeric | m/s^2 | Average of body accelerometer mean frequency on the X-axis in the frequency domain                                                               |
| YBodyAccMeanFreqAvrgFdomain        | numeric | m/s^2 | Average of body accelerometer mean frequency on the Y-axis in the frequency domain                                                               |
| ZBodyAccMeanFreqAvrgFdomain        | numeric | m/s^2 | Average of body accelerometer mean frequency on the Z-axis in the frequency domain                                                               |
| XBodyAccJerkMeanAvrgFdomain        | numeric | m/s^2 | Average of body accelerometer jerk mean on the X-axis in the frequency domain                                                                    |
| YBodyAccJerkMeanAvrgFdomain        | numeric | m/s^2 | Average of body accelerometer jerk mean on the Y-axis in the frequency domain                                                                    |
| ZBodyAccJerkMeanAvrgFdomain        | numeric | m/s^2 | Average of body accelerometer jerk mean on the Z-axis in the frequency domain                                                                    |
| XBodyAccJerkStdAvrgFdomain         | numeric | m/s^2 | Average of body accelerometer jerk standard deviation on the X-axis in the frequency domain                                                      |
| YBodyAccJerkStdAvrgFdomain         | numeric | m/s^2 | Average of body accelerometer jerk standard deviation on the Y-axis in the frequency domain                                                      |
| ZBodyAccJerkStdAvrgFdomain         | numeric | m/s^2 | Average of body accelerometer jerk standard deviation on the Z-axis in the frequency domain                                                      |
| XBodyAccJerkMeanFreqAvrgFdomain    | numeric | m/s^2 | Average of body accelerometer jerk mean frequency on the X-axis in the frequency domain                                                          |
| YBodyAccJerkMeanFreqAvrgFdomain    | numeric | m/s^2 | Average of body accelerometer jerk mean frequency on the Y-axis in the frequency domain                                                          |
| ZBodyAccJerkMeanFreqAvrgFdomain    | numeric | m/s^2 | Average of body accelerometer jerk mean frequency on the Z-axis in the frequency domain                                                          |
| XBodyGyroMeanAvrgFdomain           | numeric | rad/s | Average of body gyroscope mean on the X-axis in the frequency domain                                                                             |
| YBodyGyroMeanAvrgFdomain           | numeric | rad/s | Average of body gyroscope mean on the Y-axis in the frequency domain                                                                             |
| ZBodyGyroMeanAvrgFdomain           | numeric | rad/s | Average of body gyroscope mean on the Z-axis in the frequency domain                                                                             |
| XBodyGyroStdAvrgFdomain            | numeric | rad/s | Average of body gyroscope standard deviation on the X-axis in the frequency domain                                                               |
| YBodyGyroStdAvrgFdomain            | numeric | rad/s | Average of body gyroscope standard deviation on the Y-axis in the frequency domain                                                               |
| ZBodyGyroStdAvrgFdomain            | numeric | rad/s | Average of body gyroscope standard deviation on the Z-axis in the frequency domain                                                               |
| XBodyGyroMeanFreqAvrgFdomain       | numeric | rad/s | Average of body gyroscope mean frequency on the X-axis in the frequency domain                                                                   |
| YBodyGyroMeanFreqAvrgFdomain       | numeric | rad/s | Average of body gyroscope mean frequency on the Y-axis in the frequency domain                                                                   |
| ZBodyGyroMeanFreqAvrgFdomain       | numeric | rad/s | Average of body gyroscope mean frequency on the Z-axis in the frequency domain                                                                   |
| BodyAccMagMeanAvrgFdomain          | numeric | m/s^2 | Average of body accelerometer magnitude mean in the frequency domain                                                                             |
| BodyAccMagStdAvrgFdomain           | numeric | m/s^2 | Average of body accelerometer magnitude standard deviation in the frequency domain                                                               |
| BodyAccMagMeanFreqAvrgFdomain      | numeric | m/s^2 | Average of body accelerometer magnitude mean frequency in the frequency domain                                                                   |
| BodyAccJerkMagMeanAvrgFdomain      | numeric | m/s^2 | Average of body accelerometer jerk magnitude mean in the frequency domain                                                                        |
| BodyAccJerkMagStdAvrgFdomain       | numeric | m/s^2 | Average of body accelerometer jerk magnitude standard deviation in the frequency domain                                                          |
| BodyAccJerkMagMeanFreqAvrgFdomain  | numeric | m/s^2 | Average of body accelerometer jerk magnitude mean frequency in the frequency domain                                                              |
| BodyGyroMagMeanAvrgFdomain         | numeric | rad/s | Average of body gyroscope magnitude mean in the frequency domain                                                                                 |
| BodyGyroMagStdAvrgFdomain          | numeric | rad/s | Average of body gyroscope magnitude standard deviation in the frequency domain                                                                   |
| BodyGyroMagMeanFreqAvrgFdomain     | numeric | rad/s | Average of body gyroscope magnitude mean frequency in the frequency domain                                                                       |
| BodyGyroJerkMagMeanAvrgFdomain     | numeric | rad/s | Average of body gyroscope jerk magnitude mean in the frequency domain                                                                            |
| BodyGyroJerkMagStdAvrgFdomain      | numeric | rad/s | Average of body gyroscope jerk magnitude standard deviation in the frequency domain                                                              |
| BodyGyroJerkMagMeanFreqAvrgFdomain | numeric | rad/s | Average of body gyroscope jerk magnitude mean frequency in the frequency domain                                                                  |

Sources
-------

[UCI Machine Learning
Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  
[Template used for the
codebook](https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41)
