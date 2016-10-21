
#Compute the square of each data point in the X column and store the result in a new column called “X_square”

ff<-read.csv("C:/Users/Administrator/Desktop/R Course/data set/forestfires.csv")
X_square<-(ff["X"]*ff["X"])
print(X_square)
print(mean(X_square))

#Find the correlation coefficient (Theory:
#http://mathbits.com/MathBits/TISection/Statistics2/correlation.htm) between X and Y [HINT: research and use cor() function]

cor(ff$X,ff$Y)


library(dplyr)
install.packages("dplyr", dependencies = TRUE)
library(dplyr)
#Find the total rain,wind for each month [HINT: dplyr]
# Find the mean rain,wind for each month [HINT: dplyr]
#Find the number of records present for each month

summarise(group_by(ff, month), sum_rain=sum(rain),sum_wind=sum(wind))

summarise(group_by(ff, month),count=n())

summarise(group_by(ff, month), mean_rain=mean(rain),mean_wind=mean(wind))

#Compute the sum, mean, median, standard deviation of the following columns -
#a. FMCC
#b. DMC
#c. DC

summarise(group_by(ff), mean_FFMC=mean(FFMC),mean_DMC=mean(DMC),mean_DC=mean(DC), sum_FFMC=sum(FFMC),sum_DMC=sum(DMC),sum_DC=sum(DC)  , median_FFMC=median(FFMC),median_DMC=median(DMC),median_DC=median(DC))
#Find the number of records for each month-day combo
var<-summarise(group_by(ff, month,day),count=n())





























