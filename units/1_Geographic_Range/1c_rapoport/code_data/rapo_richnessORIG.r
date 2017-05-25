# This code will calculate the mean and max number 
# of species for each degree of latitude and 
# plot it against degrees latitude
setwd('~/Documents/stat/rwork/usgrid/csv_files')
nagrid <- array(0, dim = c(26,61))
fileNames = list.files('.', pattern = '*.csv')

numFiles = length(fileNames)

for (i in 1:numFiles) {
	tmpFile = read.csv(fileNames[i], header=FALSE)
	nagrid = nagrid + tmpFile
}

nagrid <- read.csv(nagrid, header=TRUE, row.names=1)

### COMMENT OUT THE FOLLOWING SO THE STUDENTS
### DON'T EXECUTE IT.

meansp <- apply(nagrid,1,mean)
maxsp <- apply(nagrid,1,max)

lat <- 24:49

meansp <- apply(nagrid,1,mean)
maxsp <- apply(nagrid,1,max)

lat <- 24:49

op <- par(mfrow=c(1,2))

plot(lat~meansp, pch=19, main='Mean Species Riches per Degree Latitude\nfor U.S. Freshwater Fishes', xlab = 'Mean Species Richness', ylab = expression(paste('Latitude ',degree,'N')))

plot(lat~maxsp, pch=19, main='Maximum Species Riches per Degree Latitude\nfor U.S. Freshwater Fishes', xlab = 'Maximum Species Richness', ylab = expression(paste('Latitude ',degree,'N')))

par(op)