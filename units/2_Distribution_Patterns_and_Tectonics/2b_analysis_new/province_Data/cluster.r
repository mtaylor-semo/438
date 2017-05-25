#fish <- read.csv('http://mtaylor4.semo.edu/~goby/biogeo/georgia_fishes.csv', header = TRUE, row.names = 1)
fish <- read.csv('missouri_fishes.csv', row.names = 1)

# Transform the data
fish.hel = decostand(fish,method='hellinger')

# Calculate distance between watersheds using Bray-Curtis dissimilarity.
fish.dist = vegdist(fish.hel, method = 'bray', binary=TRUE)

###################################################
# Cluster Analysis 
###################################################
# Need to do a bit of cluster work to get groups for the PCO.
# Don't plot the cluster though.
fish.clust=hclust(fish.dist, method='ward')
fish.clust.cut = cutree(fish.clust, k=clustCut)
plot(fish.clust, labels = paste(rownames(fish), fish.clust.cut), xlab='', ylab=NULL, sub='', axes=FALSE, main='Fishes')
