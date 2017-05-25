
NAgrid <- read.csv('NAfish_grid.csv')
bnd <- read.table('boundaries.txt')
rivers <- read.table('rivers.txt')
coastLine <- read.table('coastLoRes.txt')


x = -125:-65
y = 24:49
filled.contour(x, y, t(NAgrid), color = terrain.colors,
    plot.title = title(main = "Distribution and Diversity of U.S. Freshwater Fishes", 
    xlab = "Longitude West", ylab = "Latitude North"),  
    plot.axes = { axis(1); axis(2); lines(coastLine); lines(bnd, col = 'grey35', 
    lty=3); lines(rivers, col = 'grey40', lwd='0.75') })

