setwd('biogeo')


### Part 1: Histograms
cafish <- read.csv('california_marine_fishes.csv', header=TRUE, row.names=1)

#cafish <- read.csv('http://mtaylor4.semo.edu/~goby/biogeo/california_marine_fishes.csv', header=TRUE, row.names=1)

rangeSize <- rowSums(cafish)
numSpecies <- colSums(cafish)

highSp <- ceiling(max(numSpecies)/10)*10

max(rangeSize)	# maximum number of degrees latitude occupied
min(rangeSize)	# minimum number of degrees latitude occupied
mean(rangeSize)	# mean number of degrees latitude occupied

hist(rangeSize)
hist(numSpecies)

op <- par(mfrow=c(1,2))

hist(rangeSize, breaks=20, xlim=c(0,100), las=1, ylab='Number of Species', xlab = 'Latitude (°N)', main='Frequency Distribution of Range Size\nCalifornia Coastal Marine Fishes')

#No need to do this one. Focus on species range.
#hist(numSpecies, breaks=20, xlim=c(0,500), las=1, ylab='Degrees of Latitude', xlab = 'Number ofSpecies', main='Frequency Distribution of Number of Species\nper Degree Latitude')

par(op)


## Part 2: Richness and Point Conception

plot(numSpecies)

lat <- seq(-30,68,1)

# These limits create a balanced distribution of tick marks
plot(numSpecies~lat, xlim=c(-40,80), xlab = 'Latitude (°S – °N)', ylab='Species Richness', main='Species Richness by Latitude\nCalifornia Coastal Marine Fishes')

# Plot again to use identify function
plot(numSpecies~lat)	# Skip xlim for now.
identify(numSpecies~lat)

latlabels <- colnames(cafish)	
latlabels		# View the result

plot(numSpecies~lat, xlim=c(-40,80))
identify(numSpecies~lat, labels=lat, cex=0.8)
