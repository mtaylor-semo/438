spp <- read.csv('NAmussels.csv', header=TRUE, row.names=1) 
spp <- read.csv('NAfishes.csv', header=TRUE, row.names=1) 

#spp <- read.csv('http://mtaylor4.semo.edu/~goby/biogeo/NAfishes.csv', header=TRUE, row.names=1) 

#spp <- read.csv('http://mtaylor4.semo.edu/~goby/biogeo/NAmussels.csv', header=TRUE, row.names=1) 


head(spp)
dim(spp)

numWatersheds <- colSums(spp)
numWatersheds

numSpecies <- rowSums(spp)
numSpecies			# view the results

op <- par(mfrow=c(1,2))

hist(numWatersheds, main="Number of Watersheds Per Mussel Species\nin North America",xlab="Number of Watersheds",ylab="Frequency of Occurrence", labels=TRUE, breaks=20)

hist(numSpecies, main="Number of Mussel Species Per Watershed\nin North America",xlab="Number of Watersheds",ylab="Frequency of Occurrence", labels=TRUE, breaks=20)

par(op)
