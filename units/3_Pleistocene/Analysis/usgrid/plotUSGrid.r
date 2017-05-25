setwd('~/Documents/stat/rwork/usgrid/csv_files')
tmpGrid <- array(0, dim = c(26,61))
fileNames = list.files('.', pattern = '*.csv')

numFiles = length(fileNames)

for (i in 1:numFiles) {
	tmpFile = read.csv(fileNames[i], header=FALSE)
	tmpGrid = tmpGrid + tmpFile
}

gridsize = nrow(tmpGrid)

NAgrid = array(NA, dim = dim(tmpGrid))
j = 26

for (i in 1:gridsize) {
	NAgrid[i,] = as.matrix(tmpGrid[j,])
	j = j-1
}

setwd('~/Documents/stat/rwork/usgrid')

write.table(NAgrid, file='NAfish_grid.txt', sep=',', quote=FALSE)

#############################

setwd('~/Documents/stat/rwork/usgrid')

NAgrid <- read.csv('NAfish_grid.txt')
bnd <- read.table('boundaries.txt')
rivers <- read.table('rivers.txt')
coastLine <- read.table('coastLoRes.txt')


x = -125:-65
y = 24:49
filled.contour(x, y, t(NAgrid), color = terrain.colors,
    plot.title = title(main = "Distribution and Diversity of U.S. Freshwater Fishes", xlab = "Longitude West", ylab = "Latitude North"),  
    plot.axes = { axis(1); axis(2); lines(coastLine); lines(bnd, col = 'grey35', 
    lty=3); lines(rivers, col = 'grey40', lwd='0.75') })


#### Other Options
filled.contour(x, y, t(NAgrid), color = terrain.colors,
    plot.title = title(main = "Distribution and Diversity of U.S. Freshwater Fishes",
    xlab = "Longitude West", ylab = "Latitude North"),
    plot.axes = { axis(1); axis(2) })

filled.contour(x, y, t(NAgrid), color.palette = terrain.colors,
    plot.title = title(main = "Distribution and Diversity of U.S. Freshwater Fishes",
    xlab = "Longitude West", ylab = "Latitude North"),
    plot.axes = { axis(1); axis(2); lines(coastLine); lines(bnd, col = 'grey35',
    lty=3) })

filled.contour(x, y, t(NAgrid), color = terrain.colors,
    plot.title = title(main = "Distribution and Diversity of U.S. Freshwater Fishes", xlab = "Longitude West", ylab = "Latitude North"),  
    plot.axes = { axis(1); axis(2); lines(coastLine); lines(rivers, col = 'grey40',
    lwd='0.75') })

