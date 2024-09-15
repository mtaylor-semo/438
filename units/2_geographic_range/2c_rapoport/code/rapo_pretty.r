# Pre-defined code for students to run to make decent side-by-side plots
# of their Rapo data
op <- par(mfrow = c(1, 2))		# to plot the two graphs side by side
plot(lat ~ meansp, xlab = 'Mean Species Richness', ylab = 'Latitude °N')
title(main = list(
  'Mean Species Richness per Degree Latitude\nfor U.S. Freshwater Fishes',
  cex = 1.0
))
plot(lat ~ maxsp, xlab = 'Maximum Species Richness', ylab = '')
title(
  main = list(
    'Maximum Species Richness per Degree Latitude\n for U.S. Freshwater Fishes',
    cex = 1.0
  )
)
par(op)
