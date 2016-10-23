
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

#Create another column called “Month”, which has full values of month, i.e “aug” becomes “August”, “sep” becomes “September” and so on
ff$Month_Full <-
    sapply(ff$month,function(x){
    if(x=="jan"){
      x <- as.factor("January")
      
    }
      else if(x=="feb"){
        x <- as.factor("february")
        
      }
      
      else if(x=="mar"){
        x <- as.factor("March")
        
      }
      else if(x=="apr"){
        x <- as.factor("April")
        
      }
      else if(x=="may"){
        x <- as.factor("May")
        
      }
      else if(x=="jun"){
        x <- as.factor("June")
        
      }
      else if(x=="jul"){
        x <- as.factor("July")
        
      }
      else if(x=="aug"){
        x <- as.factor("August")
        
      }
      else if(x=="sep"){
        x <- as.factor("September")
        
      }
      else if(x=="oct"){
        x <- as.factor("October")
        
      }
      else if(x=="Nov"){
        x <- as.factor("November")
        
      }
      else if(x=="Dec"){
        x <- as.factor("December")
        
      }
       return( x )
   })

#Create another Column Day_Num where day will be from 1 to 7 - 1 being Sunday, 2 being Monday, 3 being Tuesday and so on


ff$Day_num <-
  sapply(ff$day,function(x){
    if(x=="sun"){
      x <- as.factor(1)
      
    }
    else if(x=="mon"){
      x <- as.factor(2)
      
    }
    
    else if(x=="tue"){
      x <- as.factor(3)
      
    }
    else if(x=="wed"){
      x <- as.factor(4)
      
    }
    else if(x=="thu"){
      x <- as.factor(5)
      
    }
    else if(x=="fri"){
      x <- as.factor(6)
      
    }
    else if(x=="sat"){
      x <- as.factor(7)
      
    }
    
    return( x )
  })


#Graph plots


pdf("C:/Users/Administrator/barPlot1.pdf")
barplot(counts, main="Distribution by X and Y",
        xlab="X", col=c("darkblue","red"),
        legend = rownames(counts), beside=TRUE)
dev.off()



















