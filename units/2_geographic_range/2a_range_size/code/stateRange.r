pluraltaxon <- 'Fishes'  # Fishes, Crayfishes or Mussels
singletaxon <- 'Fish'  # Fish, Crayfish or Mussel
thestate <- 'Georgia'
fn=paste(thestate,'_',pluraltaxon, sep='')

spp <- read.csv(paste(fn,'.csv', sep=''), header=TRUE, row.names=1)
#spp <- read.csv('http://mtaylor4.semo.edu/~goby/biogeo/filename.csv', header=TRUE, row.names=1)

numWatersheds <- colSums(spp)
numSpecies <- rowSums(spp)

nws <- nrow(spp)
highSp <- ceiling(max(numSpecies)/10)*10


#pdf(paste(fn,'.pdf',sep=''), height=11.5, width=20)

op <- par(mfrow=c(1,2))

hist(numWatersheds, breaks=seq(0,nws,1), right=FALSE, xlim = c(0,nws), xlab = 'Number of Watersheds per Species', main=paste('Frequency Distribution of Range Size\nfor',thestate, pluraltaxon, sep=' '))

hist(numSpecies, breaks=seq(0,highSp,10), right=FALSE, xlim=c(0,highSp), xlab = 'Number of Species per Watershed', main=paste('Frequency Distribution of Species Richness\nfor', singletaxon, 'Species in', thestate, 'Watersheds', sep=' '))

par(op)
#dev.off()
