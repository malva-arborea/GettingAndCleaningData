# GettingAndCleaningData
Project for Coursera Course Getting and Cleaning Data

## Introduction

From the Coursera Task description:
> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Task
From the Coursera Task description::

> You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
> This is done using cbind and rbind

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> This is done using grepl("mean|std|Subject|ActivityId")

3. Uses descriptive activity names to name the activities in the data set
> This is done using join

4. Appropriately labels the data set with descriptive variable names. 
> This is done using gsub and regexes for the variables thus replacing their names, e.g. std becomes Standarddeviation, t becomes TimeRelated and so on. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
> The last step uses plyr, more exactly ddply()

## Files
The following files are in this repository:

* CodeBook.md -> The Codebook on how the data was cleaned
* README.md -> This file
* run_Analysis.R -> The R program for the data cleaning
* my_data_mean_by_activity.txt -> The resulting dataset that has been cleaned and tidied. 
