# See bottom for original code
# code to calculate mean range width for 
# freshwater fishes. Calculations are made
# for each degree of latitude.

# change this to get the files from the web site
# may have to use readHTMLTable (see below)
setwd('~/Documents/stat/rwork/usgrid/csv_files')

# This code should get a list of the files but will
# have to trim to get only .csv files

library('XML')  # students will have to load
myURL <- 'http://mtaylor4.semo.edu/~goby/biogeo'
file.list <- readHTMLTable(myURL,skip.rows=1:2)[[1]]$Name

# might also try some other URL reading options if they are out there.

# create a vector of 26 to correspond to the degrees 
# of latitude in the data set. Fill with zeros.
tmpRow <- array(0, dim = 26)

# List all of the files in the directory.
# this will have to be modified to get the names
# from the readHTMLTable result above.
fileNames = list.files('.', pattern = '*.csv')

numFiles = length(fileNames)


for (i in 1:numFiles) {
	filePath <- paste(myURL,fileNames[i], sep='')
	tmpFile <- read.csv(filePath, header=FALSE)
	tmpRow <- tmpRow + rowSums(tmpFile)
}

finalRow <- tmpRow/i

#tmpCol <- array(0, dim = 61)

#for (i in 1:numFiles) {
#	tmpFile = read.csv(fileNames[i], header=FALSE)
#	tmpCol = tmpCol + colSums(tmpFile)
#}

#finalCol <- tmpCol/i

## ORIGINAL CODE. This reads from the working directory.
setwd('~/Documents/stat/rwork/usgrid/csv_files')
tmpRow <- array(0, dim = 26)
fileNames = list.files('.', pattern = '*.csv')

numFiles = length(fileNames)

for (i in 1:numFiles) {
	tmpFile = read.csv(fileNames[i], header=FALSE)
	tmpRow = tmpRow + rowSums(tmpFile)
}

finalRow <- tmpRow/i

