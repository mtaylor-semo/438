## Code to create the Alberta Climate Plot in the
## R Tutorial Assignment.  Note the use of the 
## code to add a degree symbol to the Y axis, which
## is given as an extra credit challenge to the students.

#setwd('biogeo')

library(tidyverse)

#climate <- read.csv('http://mtaylor4.semo.edu/~goby/biogeo/climatedata.csv')
climate <- read_csv('tutorial_climate_data.csv')
#attach(climate)

# plot(MAT ~ MAP, xlab='Mean annual precipitation (mm)', ylab = 'Mean annual temperature', pch=c(21,22,25)[Species], bg=rainbow(8)[Ecosys], xlim=c(0,3500), ylim=c(-5,10))
# text(700, 4, 'Grassland', font=3, pos=4)
# text(1900,8, 'Redcedar', font=3, pos=4)
# text(700, -2.5, 'Larch', font=3, pos=4)
# 
# legend(3100, 1, legend=c('A','B','C','D','E','F','G','H'), pch=c(25,22,21,22,22,21,25,25), col='black', pt.bg=rainbow(8))

climate %>% ggplot(aes(x = MAP, y = MAT)) +
  geom_point(aes(shape = Species,
                 color = Ecosys,
                 fill = Ecosys)) +
  scale_shape_manual(values = c(21, 22, 24)) +
  scale_color_brewer(palette = "Dark2",
                     aesthetics = c("color", "fill"),
                     guide = "none") +
  theme_minimal() +
  labs(x = "Mean Annual Precipitation (mm)",
       y = "Mean Annual Temperature (°C)") +
  guides(shape = guide_legend(override.aes = list(fill = "black"))) +
  geom_text(aes(x = 700, y = 4, label ="Grassland"),
            hjust = "left",
            size = 5) +
  geom_text(aes(x = 2100, y = 8, label = "Redcedar"),
            hjust = "left",
            size = 5) +
  geom_text(aes(x = 1800, y = 0, label = "Larch"),
            hjust = "left",
            size = 5)




# op <- par(cex=1, ps=12, family='serif', mar=c(5,5,3,3))
# plot(MAT ~ MAP, xlab='Mean annual precipitation (mm)', ylab = expression(paste('Mean annual temperature (',degree,'C)')), pch=c(21,22,25)[Species], bg=rainbow(8)[Ecosys], xlim=c(0,3500), ylim=c(-5,10))
# text(700, 4, 'Grassland', font=3, pos=4)
# text(1900,8, 'Redcedar', font=3, pos=4)
# text(700, -2.5, 'Larch', font=3, pos=4)
# 
# #legend(2400, 2, legend=c('A','B','C','D','E','F','G','H'), pch=c(25,22,21,22,22,21,25,25), col='black', pt.bg=rainbow(8))
# 
# par(op)
# 
# detach(climate)
