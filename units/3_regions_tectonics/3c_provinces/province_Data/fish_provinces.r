# Load libraries needed for the analysis.
# Vegan provides Hellinger transformation.
# rgl provides 3-D plotting.

library(vegan)
#library(rgl)


###################################################
# Define colors for later plotting
###################################################
mycolors = c('black', 'blue3', 'darkcyan', 'darkgoldenrod', 'brown','purple', 
	'deeppink1', 'darkorange', 'darkolivegreen', 'maroon', 'darksalmon', 
	'darkred','forestgreen','darkblue', 'darkturquoise','red', 'green3', 
	'gray50','gray33', 'darkmagenta')

## Alabama 7, PCO
## Mississippi 7, PCO
## Georgia Fishes 6
## North Carolina 5
## South Carolina 5
## Virginia 5
#3 Missouri 7

readCutoff <- function()
{
	cutoff <- readline(prompt='Enter cutoff number provided for you: ')
	if(!grepl("^[0-9]$",cutoff))
	{
		return(readCutoff())
	}	
	return(as.integer(cutoff))
}

clustCut <- readCutoff()

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


###################################################
# Non-metric Dimensional Analysis 
###################################################
# Non-metric Dimensional Analysis (NMDS) is a method that allows complex data
# to be more readily interpreted.  Here, similar watersheds tend to cluster
# together in 2-D space, providing a different view of the cluster results.
fish.nmds <- metaMDS(fish, k=2, trymax=100)
plot(fish.nmds, type='n', las = 1)
points(fish.nmds$points, col=mycolors[fish.clust.cut], pch=20, cex=0.5)
text(fish.nmds$points, labels=rownames(fish), col=mycolors[fish.clust.cut], adj=0.9, cex=0.8, pos=1)
#orditorp(fish.nmds, display='sites',pcol=mycolors[fish.clust.cut], col=mycolors[fish.clust.cut], pch=20, pcex=0.5, air=0.01, cex=0.8)
abline(h=0, col='grey50', lty= 2)
abline(v=0, col='grey50', lty= 2)

###################################################
# Principal Coordinates Analysis 
###################################################
# Principal coordinates analysis is a method that allows complex data
# to be more readily interpreted.  Here, similar watersheds tend to cluster
# together in 2-D space, providing a different view of the cluster 
# results
fish.pco = cmdscale(fish.dist, k = 3, eig=TRUE)
plot(fish.pco$points, main = 'Fishes\nPrincipal Coordinates', xlab = 'PCO 1', ylab = 'PCO 2', col=mycolors[fish.clust.cut], pch=21, cex=0.5, las=1)

text(fish.pco$points, labels = rownames(fish), col=mycolors[fish.clust.cut], adj=1.1, cex=0.8)
abline(h=0, col='grey50', lty=2)
abline(v=0, col='grey50',lty=2)



