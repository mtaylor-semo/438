library(lattice) # this loads the lattice package.

xyplot(species ~ area | island,
       data = arthro, aspect = "xy", type = "l",
       index.cond = list(c(5, 6, 7, 8, 9, 3, 1, 2, 4)),
       xlab = "Island Area", ylab = "Species Richness",
       panel = function(x, y, ...) {
         panel.text(x, y, arthro$year, cex = 0.7, pos = 4, offset = 0)
         panel.xyplot(x, y, ...)
       }
)
