library(tidyverse)
library(here)

pluraltaxon <- 'Fishes'  # Fishes, Crayfishes or Mussels
singletaxon <- 'Fish'  # Fish, Crayfish or Mussel
thestate <- 'Georgia'

file_name=paste(thestate,'_',pluraltaxon, sep='')

x <- read.csv(paste("2_geographic_range/2a_range_size/data/georgia_fishes.csv"), header=TRUE, row.names=1)

spp <- read_csv(here::here("2_geographic_range/2a_range_size/data", 
                     paste(file_name,'.csv', sep=''))) %>% 
  pivot_longer(!`...1`, names_to = "species", values_to = "presence") %>% 
  rename("drainage" = `...1`)


watersheds_per_species <- spp %>% 
  group_by(species) %>% 
  summarise(num_watersheds = sum(presence))

species_per_watershed <- spp %>% 
  group_by(drainage) %>% 
  summarise(num_species = sum(presence))
                

watersheds_per_species %>% 
  ggplot() + 
  geom_histogram(aes(x = num_watersheds),
                 breaks = seq(0, nrow(species_per_watershed), 1),
                 closed = "left",
                 color = "black",
                 fill = "gray70") +
  theme_minimal() +
  labs(x = "Number of watersheds per species",
       y = "Frequency")


highSp <- ceiling(max(species_per_watershed$num_species)/10)*10

species_per_watershed %>% 
  ggplot() + 
  geom_histogram(aes(x = num_species),
                 breaks = seq(0, highSp, 10),
                 closed = "left",
                 color = "black",
                 fill = "gray70") +
  scale_y_continuous(breaks = seq(1, 7, 1)) +
  scale_x_continuous(breaks = seq(0, highSp, 10)) +
  theme_minimal() +
  labs(x = "Number of species per watershed",
       y = "Frequency (number of watersheds)") 

