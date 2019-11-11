
## Read in the data
birds <- read.csv("galapagos_birds.csv", header = TRUE, row.names = 1)
islands <- read.csv("galapagos_islands.csv", header = TRUE)

# Log transform area and elevation
islands$ln_area <- log(islands$Area)
islands$ln_elev <- log(islands$Elevation)

# Tally and plot number of species per island
num_species <- colSums(birds) # skip first column with species names
dotchart(sort(num_species), main = "Species per island", pch = 19)

# Tallyname number of islands occupied by each species
num_islands <- rowSums(birds)
#names(num_islands) <- birds[,1]
dotchart(sort(num_islands), main = "Islands per species", pch = 19)

# Is number of species predicted by area 
area.lm <- lm(num_species ~ islands$ln_area)
summary(area.lm)

plot(num_species ~ islands$ln_area)
abline(area.lm)

x <- data.frame(ln_area = log(rep(10000, 16)))

predict(area.lm, x)

aelev.lm <- lm(num_species ~ islands$ln_elev)
summary(elev.lm)

# sort the 
num_spp_sorted <- sort(num_species)
num_islands_sorted <- sort(num_islands)

# Optional barplot
#op <- par(mar = c(12,3,2,2), mfrow = c(1,2))
op <- par(mfrow = c(1,2))
dotchart(sort(num_species), main = "Species per island")
dotchart(sort(num_islands), main = "Islands per species")
par(op)
# Defaults
par(mfrow = c(1,1))

