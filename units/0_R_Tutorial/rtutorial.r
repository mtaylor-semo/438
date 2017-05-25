data(iris)
iris
head(iris)
tail(iris)
nrow(iris)
ncol(iris)
dim(iris)
iris$Sepal.Length
iris$sepal.length
mean(iris$Sepal.Length)
unique(iris$Species)
mean(iris$Sepal.Length[iris$Species == 'setosa'])
# repeat for the other two species.

# perform an analysis of variance to determine if the mean lengths are significantly different.

attach(iris)
iris.aov <- aov(Sepal.Length ~ Species)
iris.aov
summary(iris.aov)

# various types of graphs
boxplot(Sepal.Length) # not really useful as we're interested in between species
boxplot(Sepal.Length ~ Species)

boxplot(Petal.Length ~ Species)

# is there a relationship between sepal length and petal length?

plot(Petal.Length ~ Sepal.Length)
#notice that petal length is on the Y axis, sepal length is on the X axis. The Y axis is plotted as a function of the X axis.

# can't tell between the three species so let's use symbols and color to differentiate

plot(Petal.Length ~ Sepal.Length, pch = c(21,22,23)[Species])

mycolor = c('yellow','cyan','magenta')

# now add some color.
plot(Petal.Length ~ Sepal.Length, pch=c(21,22,23)[Species], bg = mycolor[Species])

# Now, make the axes more useful
plot(Petal.Length ~ Sepal.Length, pch=c(21,22,23)[Species], bg = mycolor[Species], ylab = 'Petal Length (cm)', xlab = 'Sepal Length (cm)')

#legend(4.5, 6.5, legend=c('Iris setosa','I. versicolor','I. virginica'), pch=c(21,22,23), pt.bg=mycolor, text.font=3)

detach(iris)
