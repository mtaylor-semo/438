# Must have a variable named rangeSize

if (exists("rangeSize")) {
hist(
  rangeSize,
  breaks = 20,
  xlim = c(0, 100),
  las = 1,
  ylab = 'Number of Species',
  xlab = 'Degrees of Latitude Occupied',
  main = 'Frequency Distribution of Range Size\nCalifornia Coastal Marine Fishes'
)
} else {
  errorCondition("Must have a variable named `rangeSize`. See the instructions in the handout.")
}
