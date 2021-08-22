
## Read in the data
birds <- read.csv("galapagos/birds.csv", header = TRUE, row.names = 1)
islands <- read.csv("galapagos/islands.csv", header = TRUE)

birds <- read.csv("http://mtaylor4.semo.edu/biogeo/birds.csv", header = TRUE, row.names = 1)
islands <- read.csv("http://mtaylor4.semo.edu/biogeo/islands.csv", header = TRUE)

# Log transform area and elevation
islands$ln_area <- log(islands$area)
islands$ln_elev <- log(islands$elevation)

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


# Is number of species predicted by elevation 
elev.lm <- lm(num_species ~ islands$ln_elev)
summary(elev.lm)
plot(num_species ~ islands$ln_elev)
abline(elev.lm)


features.lm <- lm(ln_elev ~ ln_area, dat = islands)
summary(features.lm)
plot(islands$ln_elev ~ islands$ln_area)
abline(features.lm)

area_elev.lm <- lm(num_species ~ ln_area * ln_elev, data = islands)
summary(area_elev.lm)



# Optional barplot
#op <- par(mar = c(12,3,2,2), mfrow = c(1,2))
op <- par(mfrow = c(1,2))
dotchart(sort(num_species), main = "Species per island")
dotchart(sort(num_islands), main = "Islands per species")
par(op)
# Defaults
par(mfrow = c(1,1))

