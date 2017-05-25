#Divides species into those whose mean latitudinal range is above 
#Point Conception and those below Point Conception

cafish <- read.csv('california_marine_fishes.csv', row.names=1)

#colNames <- colnames(cafish)

#colNames <- gsub('N','',colcafish)
#colNames <- gsub('S','-',colNames)
#colNames <- as.numeric(colNames)

numRows <- nrow(cafish) ## number of species
numCols <- ncol(cafish) ## Number of 1° latitude cells

meanCut <- 34.4481  ## Point Conception latitude as cutoff for northern and southern species.

meanLat <- rep(NA,numRows) ## Create a vector same length as number of species.


#minLat <- rep(NA,numRows)
#maxLat <- rep(NA, numRows)

minLat <- vector('numeric')
maxLat <- vector('numeric')

for (i in 1:numRows) {
	x <- data.frame(cafish)[i,]
	y <- colnames(x)[x==1]

	#colNames <- colnames(y)

	colNames <- gsub('N','',y)
	colNames <- gsub('S','-',colNames)

	minLat[i] <- as.numeric(colNames[1])
	maxLat[i] <- as.numeric(colNames[length(colNames)])
	#colNames <- as.numeric(colNames)
	meanLat[i] <- mean(as.numeric(colNames))

}

cafish$minLat <- minLat
cafish$maxLat <- maxLat
cafish$meanLat <- meanLat


latCol <- vector('character')
for (i in 1:numRows) {
	if (cafish$meanLat[i] > meanCut){latCol[i] = mycolors[1]}
	else { latCol[i] = mycolors[2]}	
} 

cafish$latCol <- latCol

cafish <- cafish[order(-cafish$minLat,-cafish$meanLat),]


plot(nrow(cafish),99, type='n', xlim=c(1,516), ylim=c(-30,68), ylab='Latitude (°S — °N)', xlab='Species Index', main='Latitudinal Range for\nCalifornia Coastal Marine Fishes')
for (i in 1:numRows){
	segments(x0 = i, y0 = cafish$minLat[i], x1 = i, y1 <- cafish$maxLat[i], col=cafish$latCol[i])

}
abline(h=36,col='gray')
abline(h=meanCut,col='gray3')
abline(h=32,col='gray')