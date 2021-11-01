# Script for Distribution of Species Richess and
# for Biogeographic Provinces
# BI 438 Biogeography

# This script sets up environment for both exercises.


# Libraries ---------------------------------------------------------------

# Use pacman to download (if necessary) and load
# packages requires for this set of exercises.
if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  "tidyverse",
  "vegan",
  "rnaturalearth",
  "rnaturalearthdata",
  "rgeos",
  "sf",
  "maps",
  "ggdendro",
  "dendextend"
)

# Define custom colors ----------------------------------------------------
# These get used in various plots.
mycolors <- c(
  "blue3", "darkcyan", "darkgoldenrod", "brown", "purple",
  "deeppink1", "darkorange", "darkolivegreen", "maroon", "darksalmon",
  "darkred", "forestgreen", "darkblue", "darkturquoise", "red", "green3",
  "gray50", "gray33", "darkmagenta", "black"
)


# Global vars -------------------------------------------------------------

world <- ne_countries(scale = "medium", continent = "North America", returnclass = "sf")
states <- st_as_sf(maps::map("state", plot = FALSE, fill = TRUE))

# Read the data to plot the rivers.
rivers <- read_table("rivers.txt", col_names = c("X1", "X2"))



# Functions for Species Richness ------------------------------------------

# Define valid group file names for showing N.A. richness
# for specific taxonomic groups.
valid_groups <- c(
  "catostomid",
  "cottid",
  "cyprinid1",
  "cyprinid2",
  "cyprinodontid",
  "etheostoma",
  "fundulus",
  "ictalurid",
  "percid",
  "salmonid"
)

# Function to read the specific group files.
getGroupFile <- function() {
  theName <- readline(prompt = "Enter group file name provided for you: ")
  if (theName %in% valid_groups){
    read_csv(paste0(theName, ".csv")) %>% select(-1)
  } else {
    message("Not a valid file name. Enter a correct file name.")
    getGroupFile()
  }
}

prepare_data <- function(.data) {
  # Define the latitude and longitude for the data and plotting.
  lat <- 24:49
  long <- -125:-65
  
  colnames(.data) <- as.character(long)
  mutate(.data, lat = lat) %>%
    pivot_longer(
      cols = -lat,
      names_to = "long",
      values_to = "N"
    ) %>%
    mutate(
      long = as.integer(long),
    )
}

# Plot function for Richness exercise -------------------------------------

# Plot the North American data grid for N.A.
# and specific groups of fishes.
# Called from nagrid_diversity.R and diversity.R
# Both files set up exact same format (for now) so
# no function variables needed.
plot_na_grid <- function() {
  x <- ggplot(data = world) +
    geom_raster(
      data = grid_long,
      aes(x = long, y = lat, fill = N),
      interpolate = TRUE
    ) +
    scale_fill_viridis_c(guide = NULL, option = "cividis") +
    geom_path(data = rivers, aes(x = X1, y = X2), color = "grey70", size = 0.25) +
    geom_sf(color = "gray80", fill = NA, size = 0.25) +
    geom_sf(data = states, color = "gray80", fill = NA, size = 0.25) +
    coord_sf(
      default_crs = sf::st_crs(4326),
      xlim = c(-125, -65),
      ylim = c(24, 49),
      expand = FALSE
    ) +
    annotate(
      geom = "text", x = -90, y = 26.5, label = "Gulf of Mexico",
      color = "white", size = 3
    ) +
    annotate(
      geom = "text", x = -73, y = 30.5, label = "Atlantic",
      color = "gray90", size = 3
    ) +
    annotate(
      geom = "text", x = -121, y = 30.5, label = "Pacific",
      color = "gray90", size = 3
    ) +
    labs(x = "Longtitude", y = "Latitude")
  
  print(x)
}

# Province functions ------------------------------------------------------

# Functions used by the Provinces exercise.

# Reference list for the optimum cluster cuts for each state.
## Alabama 7, PCO
## Mississippi 7, PCO
## Georgia Fishes 6
## North Carolina 5
## South Carolina 5 NO LONGER USED
## Virginia 6
# 3 Missouri 7

# List of valid file names for Province exercise
valid_files <- c(
  "alabama_fishes",
  "georgia_fishes",
  "mississippi_fishes",
  "missouri_fishes",
  "north_carolina_fishes",
  "virginia_fishes",
  "montana_fishes"
)


# Open the correct file of fish data for Province exercise. 
getFishFile <- function() {
  theName <- readline(prompt = "Enter file name provided for you: ")
  if (theName %in% valid_files) {
    return(
      read.csv(paste0(theName, ".csv"), row.names = 1) #%>% select(-1)
    )
  } else {
    return(
      getFishFile()
    )
  }
}

# Number of cuts for the cluster and nmds analysis.
# Cut number provided to students for each state.
readCutoff <- function() {
  cutoff <- readline(prompt = "Enter the number of clusters provided for you: ")
  if (!grepl("^[5-7]$", cutoff)) { # Ensure cuts are between 5 and 7
    cat(file = stderr(), "The cluster number must be a number between 5-7.")
    return(
      readCutoff()
    )
  }
  return(
    as.integer(cutoff)
  )
}

