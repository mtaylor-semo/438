# This code will calculate the mean and max number
# of species for each degree of latitude and
# plot it against degrees latitude

nagrid <- read.csv('data/nagrid.csv', row.names = 1)

meansp <- apply(nagrid, 1, mean)
maxsp <- apply(nagrid, 1, max)
lat <- 24:49

op <- par(mfrow = c(1, 2))		# to plot the two graphs side by side
plot(lat ~ meansp, xlab = 'Mean Species Richness', ylab = 'Latitude °N')
title(main = list(
  'Mean Species Richness per Degree Latitude\nfor U.S. Freshwater Fishes',
  cex = 1.0
))
plot(lat ~ maxsp, xlab = 'Maximum Species Richness', ylab = '')
title(
  main = list(
    'Maximum Species Richness per Degree Latitude\n for U.S. Freshwater Fishes',
    cex = 1.0
  )
)
par(op)


####  AREA

fishArea <- read.csv('data/fish_area.csv', row.names = 1)

plot(
  fishArea$lat ~ fishArea$area,
  xlab = 'Area',
  ylab = 'Latitude (°N)',
  main = list('Relative Area Occupied by U.S Freshwater Fishes', cex = 1.0)
)

### Champagne

source('code/rapo_champagne.r')
