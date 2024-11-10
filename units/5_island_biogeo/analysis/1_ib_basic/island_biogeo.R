pacman::p_load(patchwork, ggplot2)


# Caribbean Herps ---------------------------------------------------------


herp <- read.csv("carib_herps.csv")

herp$lspecies <- log10(herp$species)
herp$larea <- log10(herp$area)

larea.lm <- lm(lspecies ~ larea, data = herp)

summary(larea.lm)

plot(species ~ area, data = herp, pch = 19, cex = 0.7, xlab = "Island Area (log)", ylab = "Species Richness (log)", log = "xy")
text(species ~ area, data = herp, labels = herp$island, pos = 2, offset = 0.5, cex = 0.8)
abline(larea.lm)


ggplot(herp, aes(x = larea, y = lspecies)) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "gray50",
    size = 0.75
  ) +
  geom_point() +
  theme_bw() +
  labs(
    x = "Island Area (log)",
    y = "Species Richness (log)"
  ) +
  geom_text(aes(label = island),
    hjust = 0.0,
    nudge_x = 0.1
  ) +
  theme(panel.grid = element_blank())


# Florida Beetles ---------------------------------------------------------

beetle <- read.csv("florida_beetles.csv")

beetle$lspecies <- log(beetle$species)
beetle$larea <- log(beetle$area)
beetle$ldist <- log(beetle$distance)

larea.lm <- lm(lspecies ~ larea, data = beetle)
summary(larea.lm)

ldist.lm <- lm(lspecies ~ ldist, data = beetle)
summary(ldist.lm)


op <- par(mfrow = c(1, 2))

plot(lspecies ~ larea, data = beetle, xlab = "Island Size", ylab = "Species Richness")
abline(larea.lm)

plot(lspecies ~ ldist, data = beetle, xlab = "Island Distance", ylab = "Species Richness")
abline(ldist.lm)

par(op)


p1 <-
  ggplot(beetle, aes(x = larea, y = lspecies)) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "gray50",
    size = 0.75
  ) +
  geom_point() +
  theme_bw() +
  labs(
    x = "Island Area (log)",
    y = "Species Richness (log)"
  ) +
  theme(panel.grid = element_blank())

p2 <-
  ggplot(beetle, aes(x = ldist, y = lspecies)) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "gray50",
    size = 0.75
  ) +
  geom_point() +
  theme_bw() +
  labs(
    x = "Island Distance (log)",
    y = "Species Richness (log)"
  ) +
  theme(
    panel.grid = element_blank(),
    axis.title.y = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )

p1 + p2

# Mammals in the Mountains ------------------------------------------------


mtn <- read.csv("montaine_mammals.csv")

mtn$lspecies <- log(mtn$species)
mtn$larea <- log(mtn$area)
mtn$ldistmtn <- log(mtn$dist_mtn)
mtn$ldistmain <- log(mtn$dist_mainland)

larea.lm <- lm(lspecies ~ larea, data = mtn)
summary(larea.lm)

ldistmtn.lm <- lm(lspecies ~ ldistmtn, data = mtn)
summary(ldistmtn.lm)

ldistmain.lm <- lm(lspecies ~ ldistmain, data = mtn)
summary(ldistmain.lm)

op <- par(mfrow = c(1, 3))

plot(lspecies ~ larea, data = mtn, xlab = "Mountain Size", ylab = "Species Richness")
abline(larea.lm)

plot(lspecies ~ ldistmtn, data = mtn, xlab = "Mountain Distance", ylab = "Species Richness")
abline(ldistmtn.lm)

plot(lspecies ~ ldistmain, data = mtn, xlab = "Mainland Distance", ylab = "Species Richness")
abline(ldistmain.lm)

par(op)

p1 <-
  ggplot(mtn, aes(x = larea, y = lspecies)) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "gray50",
    size = 0.75
  ) +
  geom_point() +
  theme_bw() +
  labs(
    x = "Mountain Area (log)",
    y = "Species Richness (log)"
  ) +
  theme(panel.grid = element_blank())

p2 <-
  ggplot(mtn, aes(x = ldistmtn, y = lspecies)) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "gray50",
    size = 0.75
  ) +
  geom_point() +
  theme_bw() +
  labs(
    x = "Mountain Distance (log)",
    y = "Species Richness (log)"
  ) +
  theme(
    panel.grid = element_blank(),
    axis.title.y = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )

p3 <-
  ggplot(mtn, aes(x = ldistmain, y = lspecies)) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "gray50",
    size = 0.75
  ) +
  geom_point() +
  theme_bw() +
  labs(
    x = "Mainland Distance (log)",
    y = "Species Richness (log)"
  ) +
  theme(
    panel.grid = element_blank(),
    axis.title.y = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )

p1 + p2 + p3

# Arboreal Arthropods -----------------------------------------------------

arthro <- read.csv("arboreal_arthropods.csv")

arthro$lspecies <- log(arthro$species)
arthro$larea <- log(arthro$area)


# copy all of the data except for islands matching IN1
arthro.new <- subset(arthro, island != "IN1")

larea.lm <- lm(lspecies ~ larea, data = arthro.new)
summary(larea.lm)

plot(lspecies ~ larea, data = arthro.new, ylab = "Species Richness", xlab = "Island Size")
abline(larea.lm)

library(lattice) # this loads the lattice package.

xyplot(species ~ area | island,
  data = arthro.new, aspect = "xy", type = "l",
  index.cond = list(c(5, 6, 7, 8, 9, 3, 1, 2, 4)),
  xlab = "Island Size", ylab = "Species Richness",
  panel = function(x, y, ...) {
    panel.text(x, y, arthro$year, cex = 0.7, pos = 4, offset = 0)
    panel.xyplot(x, y, ...)
  }
)

ggplot(arthro.new, aes(x = larea, y = lspecies)) +
  geom_smooth(
    method = "lm",
    se = FALSE,
    color = "gray50",
    size = 0.75
  ) +
  geom_point(size = 0.75) +
  facet_wrap(facets = vars(island)) +
  theme_bw() +
  geom_text(aes(label = year),
    hjust = 1,
    nudge_x = -0.1
  ) +
  theme(panel.grid = element_blank()) +
  labs(
    x = "Island Area (log)",
    y = "Species Richness (log)"
  )
