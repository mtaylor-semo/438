#nagrid <- read.csv('http://mtaylor4.semo.edu/~goby/biogeo/NAfish_grid.csv')
#bnd <- read.table('http://mtaylor4.semo.edu/~goby/biogeo/boundaries.txt')
#rivers <- read.table('http://mtaylor4.semo.edu/~goby/biogeo/rivers.txt')
#coastLine <- read.table('http://mtaylor4.semo.edu/~goby/biogeo/coastLoRes.txt')


nagrid <- read.csv('NAfish_grid.csv')
bnd <- read.table('boundaries.txt')
rivers <- read.table('rivers.txt')
coastline <- read.table('coastLoRes.txt')


x = -125:-65
y = 24:49
filled.contour(x, y, t(nagrid), color = terrain.colors,
    plot.title = title(main = "Distribution of Species Richness for U.S. Freshwater Fishes", 
    xlab = "Longitude (°W)", ylab = "Latitude (°N)"),  
    plot.axes = { axis(1); axis(2); lines(coastline); lines(bnd, col = 'grey35', 
    lty=3); lines(rivers, col = 'grey40', lwd='0.75') })

