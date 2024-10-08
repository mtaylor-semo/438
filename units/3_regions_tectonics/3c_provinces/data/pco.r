###################################################
# Principal Coordinates Analysis 
###################################################
# Principal coordinates analysis is a method that allows complex data
# to be more readily interpreted.  Here, similar watersheds tend to cluster
# together in 2-D space, providing a different view of the cluster 
# results

## I modified this on 18 October 2019
## to increase font size for display of the 
## Montana fishes for the slides.
## THe color selections and positions are 
## specifically for that purpose.
fish.pco = cmdscale(fish.dist, k = 3, eig=TRUE)

fish.pco.big <- fish.pco$points[-c(1,2),]
fish.pco.small <- fish.pco$points[c(1,2),]

plot(fish.pco$points, type = "n", 
     main = 'Fishes\nPrincipal Coordinates', 
     xlab = 'PCO 1', ylab = 'PCO 2', 
     col=mycolors[fish.clust.cut], 
     bg=mycolors[fish.clust.cut],
     pch=21, cex=1.5, las=1)

points(x = fish.pco.big[,1],
       y = fish.pco.big[,2],
       col=mycolors[fish.clust.cut[3:10]], 
       bg=mycolors[fish.clust.cut[3:10]],
       pch=21, cex=1.5, las=1)
points(x = fish.pco.small[,1],
       y = fish.pco.small[,2],
       col=mycolors[fish.clust.cut[1:2]], 
       bg=mycolors[fish.clust.cut[1:2]],
       pch=21, cex=1.5, las=1)

text(fish.pco.big, labels = rownames(fish.pco.big), 
     col=mycolors[fish.clust.cut[3:10]], adj=1.1, cex=1.5)
text(fish.pco.small, labels = rownames(fish.pco.small), 
     col=mycolors[fish.clust.cut[1:2]], adj=1.1, cex=1.5, pos = 4)

abline(h=0, col='grey50', lty=2)
abline(v=0, col='grey50',lty=2)
