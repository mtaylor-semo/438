#bnd <- read.table('http://mtaylor4.semo.edu/~goby/biogeo/boundaries.txt')
#rivers <- read.table('http://mtaylor4.semo.edu/~goby/biogeo/rivers.txt')
#coastLine <- read.table('http://mtaylor4.semo.edu/~goby/biogeo/coastLoRes.txt')	# U.S. outline

# library(ggplot2)
# library(dplyr)
# library(ggforce)

bnd <- read.table('data/boundaries.txt')
rivers <- read.table('data/rivers.txt')
coastLine <- read.table('data/coastLoRes.txt')	# U.S. outline
fishArea <- read.csv('data/fish_area.csv', row.names = 1)

fishArea$dia <- sqrt(fishArea$area / pi)

plot(
  fishArea$long,
  fishArea$lat,
  las = 1,
  cex = fishArea$dia,
  #area/20,
  lwd = 1.2,
  col = 'blue',
  xlab = expression(paste('Longitude ', degree, 'W')),
  ylab = expression(paste('Latitude ', degree, 'N'))
)

lines(coastLine, lwd = 0.5, col = 'grey50')

lines(bnd,
      lwd = 0.5,
      lty = 'dashed',
      col = 'grey50')

lines(rivers, lwd = 0.5, col = 'grey50')

# library(ggforce)

# fishArea %>%
#   ggplot() +
#   geom_path(
#     data = bnd,
#     aes(x = V1, y = V2),
#     linewidth = 0.25,
#     color = "gray50") +
#   geom_path(
#     data = coastLine, 
#     aes(x = V1, y = V2),
#     linewidth = 0.25,
#     color = "gray50") +
#   # geom_path(
#   #   data = rivers,
#   #   aes(x = V1, y = V2),
#   #   linewidth = 0.25,
#   #   color = "gray50"
#   # ) +
#   coord_sf(
#     default_crs = sf::st_crs(4326.),  #4326. 3857
#     xlim = c(-130, -60),
#     ylim = c(20, 50),
#     expand = FALSE
#   ) +
#   geom_circle(aes(x0 = long, y0 = lat, r = dia / pi),
#               color = "blue") +
#   theme_void() +
#   labs(x = "Longtitude", y = "Latitude")
# 
# 
# fred <- river_coord %>% st_coordinates() %>% st_linestring()
# 
# ggplot() +
#   geom_sf(data = fred,
#           linewidth = 0.25)
