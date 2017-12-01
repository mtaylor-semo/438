# Load libraries needed for the analysis.
# Vegan provides Hellinger transformation.
# Lattice provides 3-D plotting.

#setwd('~/biogeo')

library(vegan)

###################################################
# Define colors for later plotting
###################################################
mycolors = c('black', 'red', 'green3', 'blue3', 'darkcyan', 'darkmagenta', 'darkgoldenrod', 'brown','gray33',' purple', 'deeppink1', 'darkorange', 'darkolivegreen', 'maroon', 'darksalmon', 'darkred','forestgreen','darkblue', 'darkturquoise','gray50')

###################################################
# Read the Fish Data File
###################################################
nataxa = read.delim('NA_fishes2.txt', header = TRUE, row.names = 1)

# Transform the data
nataxa.hel = decostand(nataxa,method='hellinger')

# Calculate distance between watersheds using Bray-Curtis dissimilarity.
nataxa.dist = vegdist(nataxa.hel, method = 'bray', binary=TRUE)


###################################################
# Cluster Analysis 
###################################################
# Need to do a bit of cluster work to get groups for the PCO.
# Don't plot the cluster though.

nataxa.clust=hclust(nataxa.dist, method='ward')
nataxa.clust.cut = cutree(nataxa.clust, k=17)


###################################################
# Principal Coordinates Analysis 
###################################################
# Principal coordinates analysis is a method that allows complex data
# to be more readily interpreted.  Here, similar watersheds tend to cluster
# together in 2-D space, providing a different view of the cluster 
# results
nataxa.pco = cmdscale(nataxa.dist, k = 3, eig=TRUE)
plot(nataxa.pco$points, main = 'North American Fishes PCO', xlab = 'PCO 1', ylab = 'PCO 2', col=mycolors[nataxa.clust.cut], pch=nataxa.clust.cut)

text(nataxa.pco$points, labels = rownames(nataxa), col=mycolors[nataxa.clust.cut], adj=1.1, cex=0.8)
abline(h=0, col='grey50')
abline(v=0, col='grey50')

#plot(nataxa.pco$points[,2], nataxa.pco$points[,3], main = 'North American Fishes PCO 2 x 3', xlab = 'PCO 2', ylab = 'PCO 3', col=mycolors[nataxa.clust.cut], pch=nataxa.clust.cut)

#text(nataxa.pco$points[,2], nataxa.pco$points[,3], labels = rownames(nataxa), col=mycolors[nataxa.clust.cut], adj=1.1, cex=0.8)

#abline(h=0, col='grey50')
#abline(v=0, col='grey50')


###################################################
# 3-D plot of PCO results that can be rotated.
###################################################
# Remove the next three comment hashes, copy and paste into the R Console to 
# make a 3-D plot of the PCO results.
# Left-click to rotate plot
# Right-click to zoom in and out.

#library('rgl')

#plot3d(nataxa.pco$points, col = mycolors[nataxa.clust.cut], type='s', size=0.5, xlab='PCO1', ylab='PCO2', zlab='PCO3')

#text3d(nataxa.pco$points, text=rownames(nataxa), col = mycolors[nataxa.clust.cut], cex=0.7, adj = -0.3)


###################################################
# 3-D plot of PCO Results 
###################################################
# Remove the next three comment hashes, copy and paste into the R Console to 
# make a 3-D plot of the PCO results.

#library('lattice')

#pco.mat = matrix(nataxa.pco$points, ncol=3)

#cloud(pco.mat[,3]~pco.mat[,1]*pco.mat[,2], pch=1:17, groups = nataxa.clust.cut, xlab='PCO 1', ylab = 'PCO 2', zlab = 'PCO 3', main = 'North American Fishes\nPrincipal Coordinates Analysis')


###################################################
# Performs a principal components analysis and
# plots in rotatable 3-D 
###################################################
#ord <- prcomp(t(nataxa.hel), scale=TRUE, center=FALSE)
#plot3d(ord$rotation[,1], ord$rotation[,2], ord$rotation[,3], col = mycolors[nataxa.clust.cut], type='s', size=0.5, xlab='PCA1', ylab='PCA2', zlab='PCA3')
#text3d(ord$rotation[,1], ord$rotation[,2], ord$rotation[,3], text=rownames(nataxa), col = mycolors[nataxa.clust.cut], cex=0.7, adj = -0.3)
