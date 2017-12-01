# This program performs a cluster analysis of watersheds, using the presence / 
# absence of taxa as characters.

setwd('~/biogeo')

# Load libraries needed for the analysis.
# Vegan provides Hellinger transformation.

library(vegan)

###################################################
# Read the Fish Data File
###################################################

nataxa = read.delim('NA_mussels.txt', header = TRUE, row.names = 1)

# Transform the data
nataxa.hel = decostand(nataxa,method='hellinger')

# Calculate distance between watersheds using Bray-Curtis dissimilarity.
nataxa.dist = vegdist(nataxa.hel, method = 'bray', binary=TRUE)


####################
# Cluster Analysis #
####################

# You can change the number of clusters from 17 to a larger or smaller
# number, such as 14 or 18, to see if one makes more biogeographic
# "sense" than another.  Change the number 17 after the 'k=' below
# to a new value.

nataxa.clust=hclust(nataxa.dist, method='ward')
nataxa.clust.cut = cutree(nataxa.clust, k=17)
plot(nataxa.clust, hang = -1, labels = paste(rownames(nataxa), as.character(nataxa.clust.cut)), cex=0.6, main = 'North American Mussels', xlab = 'Watersheds (Cluster No.)')
