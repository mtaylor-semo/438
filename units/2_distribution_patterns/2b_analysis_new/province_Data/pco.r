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
