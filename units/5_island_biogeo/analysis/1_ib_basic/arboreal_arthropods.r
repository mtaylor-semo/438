dat <- read.csv("arboreal_arthropods.csv")

xyplot(
  species ~ as.factor(year) | island, 
  data = dat, 
  aspect = 'xy', 
  type = 'o', 
  xlim = c(69,71),
	panel = function(x, y, ...){
	panel.text(x, y + 2, dat$year, cex = 0.7)
	panel.xyplot(x, y, ...)
	}
)

xyplot(
  species ~ as.factor(year) | island, 
  data = dat, 
  aspect = "xy", 
  type = "o")

xyplot(
  species ~ area | island, 
  data = dat, 
  aspect = "xy", 
  type = "o")

