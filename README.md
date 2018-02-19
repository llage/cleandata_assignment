Repo decription
=======
This github repository was made for a project for a Getting and Cleaning Data
Course on Coursera.

The assignment
=======
* To take the dataset from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* To create an R script called run_analysis.R that does the following:

step 1. Merges the training and the test sets to create one data set.

step 2. Extracts only the measurements on the mean and standard deviation for
	each measurement.
	
step 3. Uses descriptive activity names to name the activities in the data set

step 4. Appropriately labels the data set with descriptive variable names.

step 5. From the data set in step 4, creates a second, independent tidy data set
	with the average of each variable for each activity and each subject.

Files in this repo
=======
* README.md (this file)
* run_analysis.R - this script downloads the file mentioned above, stores it
	in the user's working directory (filename file.zip) and creates two
	files from its content: fulldata_onlymean_std.csv (step 1-4 above) and
	data_summarized.csv (step 5).
* data_summarized.csv - one of the files generated with run_analysis.R
* CodeBook.md - explains the data and column names in data_summarized.csv

Script
=======

The run_analysis.R script downloads the data file with the information and
measurements, stores it in the user's working directory (filename file.zip) 
and creates two files from its content: fulldata_onlymean_std.csv and
data_summarized.csv.

The first of those two files contain only the means and standard deviations
of each measurement (see below for list of measurements).
data_summarized.csv contains a summary where averages were taken to make
sure that only one set of means and standard deviation is recorded per
subject and activity. For 30 subjects and 6 activities (each subject
performed each of the 6 activities at least once), it has 180 rows in total.

The script contains comments detailing the steps taken. A summary of what it
does:

* download .zip file
* create connections to the .txt files in the .zip
* read in the .txt files
* arrange and merge the contents to create a data frame containing all info
* put column names, discard columns that we are not interested in (not mean/std)
* modify column names according to taste (see column names section below)
* decode some info: activities were coded as numbers 1-6 in the dataset
* take the completed dataset (corresponding to fulldata_onlymean_std)
* summarize that info to data_summarized with the aggregate function
* write out the data frames to .csv files.

Note: the script only uses commands that are available for use after doing a
standard install of R version 3.4.3 (the most recent released version at the
time of writing), i.e. only libraries like utils and stats are called.

How to use
=======
Downloading run_analysis.R to a directory and, in that directory, issuing the
following command on a command line prompt should work:

	Rscript run_analysis.R
	
However, I do not recommend actually using it. It is customised for this dataset
alone, and the code was written for an assignment, so its purpose probably
should be to serve as a reference for people learning their way around data
getting/cleaning and/or R.
Note that the script does not check if the data file is already downloaded.
