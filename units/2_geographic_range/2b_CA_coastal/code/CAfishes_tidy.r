library(tidyverse)


### Part 1: Histograms
cafish <- read_csv('data/california_marine_fishes.csv') %>% 
  rename("species" = `...1`)

#cafish <- read.csv('http://mtaylor4.semo.edu/~goby/biogeo/california_marine_fishes.csv', header=TRUE, row.names=1)

rangeSize <- cafish %>% 
  select(-species) %>% 
  rowSums(.)

rangeSize1 <- rangeSize

numSpecies <- cafish %>% 
  select(-species) %>% 
  colSums(.) %>% 
  unname(.)

num_spec <- cafish %>% 
  pivot_longer(-species, names_to = "latitude", values_to = "number") %>% 
  group_by(species) %>% 
  summarize(count = sum(number))

numSpecies1 <- numSpecies

highSp <- ceiling(max(numSpecies)/10)*10

# Do I need these from original script?
max(rangeSize)	# maximum number of degrees latitude occupied
min(rangeSize)	# minimum number of degrees latitude occupied
mean(rangeSize)	# mean number of degrees latitude occupied

# Convert rangeSize to tibble for plotting
# Merge with creation of this vaqriable if I don't need min/max
rangeSize <- tibble(range = rangeSize)
numSpecies <- tibble(num_species = numSpecies)

# Original for comparison
hist(rangeSize1)

rangeSize %>% 
  ggplot() +
  geom_histogram(aes(x = range),
                 breaks = seq(0, 100, 5),
                 closed = "right",
                 color = "black",
                 fill = "gray80") +
  scale_x_continuous(breaks = seq(0, 100, 20)) +
  scale_y_continuous(breaks = seq(0, 90, 10)) +
  labs(x = "Degrees of latitude occupied",
       y = "Number of species") +
  theme_minimal()

# Original for comparison
hist(numSpecies1)

numSpecies %>% 
  ggplot() +
  geom_histogram(aes(x = num_species),
                 breaks = seq(0, 450, 50),
                 closed = "right",
                 color = "black",
                 fill = "gray80") +
  scale_x_continuous(breaks = seq(0, 450, 50)) +
  scale_y_continuous(breaks = seq(0, 30, 5)) +
  labs(x = "Number of species",
       y = "Range size (degrees of latitude spanned)") +
  theme_minimal()


op <- par(mfrow=c(1,2))

hist(rangeSize1, breaks=20, xlim=c(0,100), las=1, ylab='Number of Species', xlab = 'Latitude (°N)', main='Frequency Distribution of Range Size\nCalifornia Coastal Marine Fishes')

#No need to do this one. Focus on species range.
#hist(numSpecies, breaks=20, xlim=c(0,500), las=1, ylab='Degrees of Latitude', xlab = 'Number ofSpecies', main='Frequency Distribution of Number of Species\nper Degree Latitude')

par(op)


## Part 2: Richness and Point Conception

plot(numSpecies)

lat <- seq(-30,68,1)

# These limits create a balanced distribution of tick marks
plot(numSpecies~lat, xlim=c(-40,80), xlab = 'Latitude (°S – °N)', ylab='Species Richness', main='Species Richness by Latitude\nCalifornia Coastal Marine Fishes')

# Plot again to use identify function
plot(numSpecies~lat)	# Skip xlim for now.
identify(numSpecies~lat)

latlabels <- colnames(cafish)	
latlabels		# View the result

plot(numSpecies~lat, xlim=c(-40,80))
identify(numSpecies~lat, labels=lat, cex=0.8)

