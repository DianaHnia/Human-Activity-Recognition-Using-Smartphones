==================================================================

# Human Activity Recognition Using Smartphones Dataset

**Version 2.0**

**Original README.txt (version 1.0) adapted by me, this GitHub account owner, for the course project (week 4) of the JHU *Getting and Cleaning Data* offered on Coursera.**   

**All the changes made to the original file are in bold font.**  
**Changes were made to add the necessary information after a tidy dataset from the original files was created. The created tidy dataset along with its corresponding required files were made for submission of the course project. **
**From the project description: ” The goal is to prepare tidy data that can be used for later analysis.” We are required to submit a tidy dataset, a README file, a codebook, and an R script.**  

**The original dataset, that includes the original README.txt, has been downloaded from [data for the project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) on November 30,2020 from the mentioned course. Also, a full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained.**  


==================================================================

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws

==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

# **Processed Data (for the assignment):**  
=====================================================================================

**The data in the files was processed to create a tidy dataset according to the JHU *Getting and Cleaning Data* course project instructions.**  
**The R script was written in the R language R version 3.5.2 using RStudio version 1.2.5019 on Windows 10.**  
**The working directory was set and a new sub-directory called *data* was created in the working directory.**  
**A new R script was opened in RStudio called 'run_analysis.R' as per the project requirement. *tidyverse* library was loaded.**  
**The dataset was downloaded from the above mentioned link *data for the project* using *download.file* function. Then the downloaded file was unzipped manually (right click and *extract here*), and files were inspected to get familiar with the topic and data..**  
**The *test* and *train* datasets were then loaded into R using the *read.table* funtion. Two new tables were created: *x_test* and *x_train* by combining the loaded (*x_test, y_test, subject_test*) and (*x_train, y_train, subject_train*) respectively using column bind, *cbind* function. Those combined training and test sets were then merged to create one data set called *data* using the row bind *rbind* function.**   

**The created *data* was then subset to include only the measurements on the mean and standard deviation for each measurement. This was done by loading the *feature.txt* into R, and extracting only the features that include *mean* or *std* in its name using the *grpl* function and then using the subsetted features vector to subset *data*.**  
 
**Later, the activity column (*y_test, y_train*) that were combined previously in *data* has values from 1 to 6. Those numbers were replaced by their corresponding character description by loading and extracting the information from *activity_labels.txt*.**  

**The *data* variables were then renamed using this format scheme: AxisSignalEstimation-Domain, where Axis refers to axis, Signal refers to signals measured, Estimation refers to estimated value (ex:mean), and Domain refers to time or frequency domain (Ex:XBodyGyroMean-Fdomain)**  

**Finally, another independent tidy data *tidy_data* set was created from the previous one with the average of each variable for each activity and each subject using *group_by* and *summarise_all* and *mean* functions. Variable names were then renamed by replacing "-" with "Avrg" from *data* names, and *tidy_data* was saved to a text file in the *data* sub-directory using *write.table* function.**  

**For more details, please refer to the 'run_analysis.R' script that contains the code with explanatory comments. Also refer to the 'codebook.md' for explanation of the variable names.**  
  

The dataset includes the following files:
=========================================

- 'README.txt': **Modified for the assignment**

- **'codebook.md': Shows information about the variables and summaries calculated, units, and any transformations performed to clean up the data. It also explains the steps performed to obtain the tidy set required. It is also a modified and combined version of the assumably original codebooks: features.txt, features_info.txt, activity_labels.txt**
- **'tidydata.txt': Tidy data set generated for the assignment using 'run_analysis.R' from the following files: 'features.txt', 'activity_labels.txt', 'X_train.txt', 'y_train.txt' 'X_test.txt', 'Y_test.txt','subject_train.txt','subject_test.txt'. Details for the transformation is found in the ‘codebook.md’ file.**
- **'run_analysis.R': R script that is required to transform the raw data to the tidy data. The steps used to clean the data are as per the course instructions and detailed explanation is provided in the ‘codebook.md’.**

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Notes:
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about **the original (excluding processed data and its corresponding scripts)** dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1]

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
