GettingAndCleaningData
======================

The program comprises seven phases

1. The data is extracted from the zip archive using the built in unz function, and loaded into data frames.
2. For both test and train data, extra columns are added for activities and subjects using cbind and then the two data sets are stitched together using rbind.
3. Names are added to the main data frame and also the acivity names data frame for join purposes.
4. The required columns for mean and standard deviation are extracted and the resulting data frame merged with the activity names.
5. Using the library 'reshape2', the meged data is melted and then reformed using the correct averages.
6. This data is then written out giving the final output.
7. The temporary data frames are removed from the workspace.

