library(tidyverse)

spp <- read_csv('2_geographic_range/2a_range_size/data/na_mussels.csv') 
#spp <- read_csv('2_geographic_range/2a_range_size/data/na_fishes.csv') 

spp <- spp  %>% 
  pivot_longer(!`...1`, names_to = "species", values_to = "presence") %>% 
  rename("drainage" = `...1`)

#spp <- read.csv('http://mtaylor4.semo.edu/~goby/biogeo/NAfishes.csv', header=TRUE, row.names=1) 

#spp <- read.csv('http://mtaylor4.semo.edu/~goby/biogeo/NAmussels.csv', header=TRUE, row.names=1) 


watersheds_per_species <- spp %>% 
  group_by(species) %>% 
  summarise(num_watersheds = sum(presence))

species_per_watershed <- spp %>% 
  group_by(drainage) %>% 
  summarise(num_species = sum(presence))

max_watersheds <- max(watersheds_per_species$num_watersheds)


watersheds_per_species %>% 
  ggplot() + 
  geom_histogram(aes(x = num_watersheds),
                 breaks = seq(0, max_watersheds, 5),
                 closed = "right",
                 color = "black",
                 fill = "gray70") +
  theme_minimal() +
  scale_x_continuous(breaks = seq(0, max_watersheds, 20)) +
  labs(x = "Number of watersheds per species",
       y = "Frequency (number of species)")


highSp <- ceiling(max(species_per_watershed$num_species)/10)*10

species_per_watershed %>% 
  ggplot() + 
  geom_histogram(aes(x = num_species),
                 breaks = seq(0, highSp, 5),
                 closed = "right",
                 color = "black",
                 fill = "gray70") +
  #scale_y_continuous(breaks = seq(1, 7, 1)) +
  scale_x_continuous(breaks = seq(0, highSp, 10)) +
  theme_minimal() +
  labs(x = "Number of species per watershed",
       y = "Frequency (number of watersheds)") 

