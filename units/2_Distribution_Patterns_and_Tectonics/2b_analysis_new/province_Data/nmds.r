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
