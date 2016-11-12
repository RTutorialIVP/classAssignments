ff <- read.csv("C:/Users/Administrator/Desktop/R Course/data set/forestfires.csv")

library(ggplot2)
head(ff)
ggplot(ff, aes(ff$wind, ff$temp, color = ff$day)) + geom_point()
set.seed(20)
ffCluster<-kmeans(ff[, c(9,11)], 9)
ffCluster
table(ffCluster$cluster, ff$day)

plot(ff[c("FFMC", "DMC")], col=ffCluster$cluster)

