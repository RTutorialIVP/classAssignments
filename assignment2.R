ff<-read.csv("C:/Users/Administrator/Desktop/R Course/data set/forestfires.csv")
X_square<-(ff["X"]*ff["X"])
print(X_square)
print(mean(X_square))



cor(ff$X,ff$Y)


library(dplyr)
install.packages("dplyr", dependencies = TRUE)
library(dplyr)
summarise(group_by(ff, month), sum_rain=sum(rain),sum_wind=sum(wind))

summarise(group_by(ff, month),count=n())

summarise(group_by(ff, month), mean_rain=mean(rain),mean_wind=mean(wind))

summarise(group_by(ff), mean_FFMC=mean(FFMC),mean_DMC=mean(DMC),mean_DC=mean(DC), sum_FFMC=sum(FFMC),sum_DMC=sum(DMC),sum_DC=sum(DC)  , median_FFMC=median(FFMC),median_DMC=median(DMC),median_DC=median(DC))

summarise(group_by(ff, month,day),count=n())
