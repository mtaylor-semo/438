
setwd('~/teach/438/units/5_island_biogeo/analysis/')


# Caribbean Herps ---------------------------------------------------------


herp <- read.csv('carib_herps.csv', header = TRUE)

herp$lspecies <- log(herp$species)
herp$larea <- log(herp$area)

larea.lm <- lm(lspecies ~ larea, data=herp)

summary(larea.lm)

plot(lspecies ~ larea, data = herp, pch = 19, cex = 0.5, xlim = c(0,12), xlab = 'Island Size', ylab = 'Species Richness')
text(lspecies ~ larea, data = herp, labels = herp$island, pos=2, offset=0.5, cex=0.8)
abline(larea.lm)


# Florida Beetles ---------------------------------------------------------

beetle <- read.csv('florida_beetles.csv')

beetle$lspecies <- log(beetle$species)
beetle$larea <- log(beetle$area)
beetle$ldist <- log(beetle$distance)

larea.lm <- lm(lspecies ~ larea, data = beetle)
summary(larea.lm)

ldist.lm <- lm(lspecies ~ ldist, data = beetle)
summary(ldist.lm)


op <- par(mfrow=c(1,2))

plot(lspecies ~ larea, data = beetle, xlab = 'Island Size', ylab = 'Species Richness')
abline(larea.lm)

plot(lspecies ~ ldist, data=beetle, xlab = 'Island Distance', ylab = 'Species Richness')
abline(ldist.lm)

par(op)


# Mammals in the Mountains ------------------------------------------------


mtn <- read.csv('montaine_mammals.csv')

mtn$lspecies <- log(mtn$species)
mtn$larea <- log(mtn$area)
mtn$ldistmtn <- log(mtn$dist_mtn)
mtn$ldistmain <- log(mtn$dist_mainland)

larea.lm <- lm(lspecies ~ larea, data=mtn)
summary(larea.lm)

ldistmtn.lm <- lm(lspecies ~ ldistmtn, data = mtn)
summary(ldistmtn.lm)

ldistmain.lm <- lm(lspecies ~ ldistmain, data = mtn)
summary(ldistmain.lm)

op <- par(mfrow=c(1,3))

plot(lspecies ~ larea, data = mtn, xlab = 'Mountain Size',  ylab = 'Species Richness')
abline(larea.lm)

plot(lspecies ~ ldistmtn, data=mtn, xlab = 'Mountain Distance', ylab = 'Species Richness')
abline(ldistmtn.lm)

plot(lspecies ~ ldistmain, data=mtn, xlab = 'Mainland Distance', ylab = 'Species Richness')
abline(ldistmain.lm)

par(op)


# Arboreal Arthropods -----------------------------------------------------

arthro <- read.csv("arboreal_arthropods.csv")

arthro$lspecies <- log(arthro$species)
arthro$larea <- log(arthro$area)


#copy all of the data except for islands matching IN1
arthro.new <- subset(arthro, island != 'IN1')  

larea.lm <- lm(lspecies ~ larea, data = arthro.new)
summary(larea.lm)

plot(lspecies ~ larea, data = arthro.new, ylab = 'Species Richness', xlab = 'Island Size')
abline(larea.lm)

library(lattice)	# this loads the lattice package.

xyplot(species ~ area | island, data = arthro, aspect = 'xy', type = 'l', 
       index.cond = list(c(5,6,7,8,9,3,1,2,4)),
       xlab = 'Island Size',  ylab = 'Species Richness', 
       panel = function(x,y,...) {
         panel.text(x, y, arthro$year, cex = 0.7, pos = 4, offset = 0)
         panel.xyplot(x, y, ...) })

