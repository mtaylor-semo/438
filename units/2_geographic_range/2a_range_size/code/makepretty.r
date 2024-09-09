#getSpeciesSet <- function()
#{
#	n <- readline(prompt="Enter Fish or Mussel for your dataset: ")
#	return(as.character(n))
#}


theTaxon <- readline(prompt = "Enter Fishes, Mussels, or Crayfishes for your dataset: ")
theState <- readline(prompt = "Enter the state of your dataset: ")


numWatersheds <- colSums(spp)
numSpecies <- rowSums(spp)

nws <- nrow(spp)
highSp <- ceiling(max(numSpecies) / 10) * 10



op <- par(mfrow = c(1, 2))

hist(
  numWatersheds,
  breaks = seq(0, nws, 1),
  xlim = c(0, nws),
  xlab = 'Number of Watersheds',
  ylab = 'Number of Species',
  main = paste(
    'Frequency Distribution of Range Size\nfor',
    theState,
    theTaxon,
    sep = ' '
  ),
  las = 1
)

hist(
  numSpecies,
  breaks = seq(0, highSp, 10),
  xlim = c(0, highSp),
  xlab = 'Number of Species',
  ylab = 'Number of Watersheds',
  main = paste(
    'Frequency Distribution of Species Richness\nfor',
    theTaxon,
    'in',
    theState,
    'Watersheds',
    sep = ' '
  ),
  las = 1
)

par(op)
