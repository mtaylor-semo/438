mus = read.delim('NA_mussels.txt', header = TRUE, row.names = 1)
fish = read.delim('NA_fishes2.txt', header = TRUE, row.names = 1)


library(vegan)

mus.hel = decostand(mus,method='hellinger')
mus.dis = vegdist(mus.hel, method = 'bray')

fish.hel = decostand(fish,method='hellinger')
fish.dis = vegdist(fish.hel, method = 'bray')

mus.pco = cmdscale(mus.dis, k = 3, eig=TRUE)
fish.pco = cmdscale(fish.dis, k = 3, eig=TRUE)

mantel(mus.dis, fish.dis)

mus.sc <- scores(mus.pco, choices = 1:3)
fish.sc <- scores(fish.pco, choices = 1:3)
pro <- protest(mus.sc, fish.sc)
pro
