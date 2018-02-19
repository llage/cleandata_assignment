The data
=======

The data processed are the results of an experiment with 30 volunteers
who performed six activities wearing a smartphone. Measurements were taken
using its embedded accelerometer and gyroscope.
Explanations of the measurements are partially reproduced below, as they are
relevant for the choices made in the data processing.
More information can be found in the data file itself
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
or at its website
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Note: data in the data set have undergone some transformation/normalisation
and values have all been put in the range -1:1. This is why lower standard
deviation values can appear as negative numbers here.

Column names
=======

The following descriptions of the variables is given in the original
dataset. 

	The features selected for this database come from the accelerometer
	and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time 
	domain signals (prefix 't' to denote time) were captured at a
	constant rate of 50 Hz. Then they were filtered using a median
	filter and a 3rd order low pass Butterworth filter with a corner 
	frequency of 20 Hz to remove noise. Similarly, the acceleration 
	signal was then separated into body and gravity acceleration signals 
	(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass 
	Butterworth filter with a corner frequency of 0.3 Hz. 

	Subsequently, the body linear acceleration and angular velocity were 
	derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and 
	tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional 
	signals were calculated using the Euclidean norm (tBodyAccMag, 
	tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

	Finally a Fast Fourier Transform (FFT) was applied to some of these 
	signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
	fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to 
	indicate frequency domain signals). 

	These signals were used to estimate variables of the feature vector 
	for each pattern: '-XYZ' is used to denote 3-axial signals in the X, 
	Y and Z directions.

	tBodyAcc-XYZ		tGravityAccMag		fBodyGyro-XYZ
	tGravityAcc-XYZ		tBodyAccJerkMag		fBodyAccMag
	tBodyAccJerk-XYZ	tBodyGyroMag		fBodyAccJerkMag
	tBodyGyro-XYZ		tBodyGyroJerkMag	fBodyGyroMag
	tBodyGyroJerk-XYZ	fBodyAcc-XYZ		fBodyGyroJerkMag
	tBodyAccMag		fBodyAccJerk-XYZ
	
The above names were adapted by run_analysis.R to be a bit more explicit:
the t and f prefixes become time- and freq-, Acc is made longer as "accel"
etc. The subject and the activity are also included as columns, only the
standard deviation and the mean are included for each measurement, and the 
list of column names becomes:

	subject
	activity
	time-body-accel-mean-x
	time-body-accel-mean-y
	time-body-accel-mean-z
	time-body-accel-std-x
	time-body-accel-std-y
	time-body-accel-std-z
	time-gravity-accel-mean-x
	time-gravity-accel-mean-y
	time-gravity-accel-mean-z
	time-gravity-accel-std-x
	time-gravity-accel-std-y
	time-gravity-accel-std-z
	time-body-accel-jerk-mean-x
	time-body-accel-jerk-mean-y
	time-body-accel-jerk-mean-z
	time-body-accel-jerk-std-x
	time-body-accel-jerk-std-y
	time-body-accel-jerk-std-z
	time-body-gyro-mean-x
	time-body-gyro-mean-y
	time-body-gyro-mean-z
	time-body-gyro-std-x
	time-body-gyro-std-y
	time-body-gyro-std-z
	time-body-gyro-jerk-mean-x
	time-body-gyro-jerk-mean-y
	time-body-gyro-jerk-mean-z
	time-body-gyro-jerk-std-x
	time-body-gyro-jerk-std-y
	time-body-gyro-jerk-std-z
	time-body-accel-magnitude-mean
	time-body-accel-magnitude-std
	time-gravity-accel-magnitude-mean
	time-gravity-accel-magnitude-std
	time-body-accel-jerk-magnitude-mean
	time-body-accel-jerk-magnitude-std
	time-body-gyro-magnitude-mean
	time-body-gyro-magnitude-std
	time-body-gyro-jerk-magnitude-mean
	time-body-gyro-jerk-magnitude-std
	freq-body-accel-mean-x
	freq-body-accel-mean-y
	freq-body-accel-mean-z
	freq-body-accel-std-x
	freq-body-accel-std-y
	freq-body-accel-std-z
	freq-body-accel-jerk-mean-x
	freq-body-accel-jerk-mean-y
	freq-body-accel-jerk-mean-z
	freq-body-accel-jerk-std-x
	freq-body-accel-jerk-std-y
	freq-body-accel-jerk-std-z
	freq-body-gyro-mean-x
	freq-body-gyro-mean-y
	freq-body-gyro-mean-z
	freq-body-gyro-std-x
	freq-body-gyro-std-y
	freq-body-gyro-std-z
	freq-body-accel-magnitude-mean
	freq-body-accel-magnitude-std
	freq-body-accel-jerk-magnitude-mean
	freq-body-accel-jerk-magnitude-std
	freq-body-gyro-magnitude-mean
	freq-body-gyro-magnitude-std
	freq-body-gyro-jerk-magnitude-mean
	freq-body-gyro-jerk-magnitude-std

License of the dataset used:
========
Use of this dataset in publications must be acknowledged by referencing the
following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. 
Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass 
Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit 
can be addressed to the authors or their institutions for its use or misuse. 
Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
