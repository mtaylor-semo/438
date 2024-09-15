setwd('~/Documents/stat/rwork/usgrid/csv_files')
fileNames = list.files('.', pattern = '*.csv')
numFiles = length(fileNames)

fishArea <- array(0,dim=c(numFiles,3))
fishArea <- as.data.frame(fishArea)
colnames(fishArea) <- c('area','lat','long')

for (i in 1:numFiles) {
	tmpFile = read.csv(fileNames[i], header=FALSE)

	x <- colSums(tmpFile)
	y <- rowSums(tmpFile)

	fishArea[i,1] <- sum(tmpFile)

	# subtract result from 26 (which is the latitude range), then add
	# 24 to properly plot from latitude 24 north.
	#fishArea[i,2] <- (24 + (26 - round(median(which(y == max(y))),0)))
	fishArea[i,2] <- (24 + (26 - mean(which(y == max(y)),0)))
	# subtract 126 to convert to negative longitude.
	#fishArea[i,3] <- (round(median(which(x == max(x))),0) - 126)
	fishArea[i,3] <- (mean(which(x == max(x)),0) - 126)
}

rownames(fishArea) <- sub('.csv','',fileNames)

#xAxis = -125:-65
#yAxis = 24:49


# Convert area to diameter.
#fishArea$dia <- (sqrt(fishArea$area/pi) * 2)/pi
fishArea$new_dia <- sqrt(fishArea$area/pi)

R^2 * pi = area
r^2 = area/pi
r = sq


plot(fishArea$lat ~ fishArea$area, main='Relative Area Occupied by U.S Freshwater Fishes', xlab = 'Area', ylab = expression(paste('Latitude ',degree,'N')))

setwd('~/Documents/stat/rwork/usgrid/')

bnd <- read.table('boundaries.txt')
rivers <- read.table('rivers.txt')
coastLine <- read.table('coastLoRes.txt')

#plot(fishArea$long, fishArea$lat, cex=fishArea$area/20, lwd=1.2, col='blue', xlab=expression(paste('Longitude ',degree,'W')), ylab=expression(paste('Latitude ',degree,'N')))


plot(fishArea$long, fishArea$lat, cex=fishArea$new_dia, lwd=1.2, col='blue', xlab=expression(paste('Longitude ',degree,'W')), ylab=expression(paste('Latitude ',degree,'N')))


lines(coastLine, lwd=0.5,col='grey50')
lines(bnd, lwd=0.5, lty='dashed', col='grey50')
lines(rivers, lwd=0.5, col='grey50')
