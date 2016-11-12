train <- read.csv("C:/Users/Administrator/Desktop/R Course/day6/Big_Mart_Train.csv")
test <- read.csv("C:/Users/Administrator/Desktop/R Course/day6/Big_Mart_Test.csv")

test$Item_Outlet_Sales <- 1

#combine the data set
combi <- rbind(train, test)

#impute missing values with median
combi$Item_Weight[is.na(combi$Item_Weight)] <- median(combi$Item_Weight, na.rm = TRUE)

#impute 0 with median
combi$Item_Visibility <- ifelse(combi$Item_Visibility == 0, median(combi$Item_Visibility),
                                combi$Item_Visibility)

#find mode and impute
table(combi$Outlet_Size, combi$Outlet_Type)
levels(combi$Outlet_Size)[1] <- "Other"

#remove the dependent and identifier variables
my_data <- subset(combi, select = -c(Item_Outlet_Sales, Item_Identifier,
                                     Outlet_Identifier))

#check available variables
colnames(my_data)

#check variable class
str(my_data)

#load library
install.packages("dummies")
library(dummies)

#create a dummy data frame
new_my_data <- dummy.data.frame(my_data, names = c("Item_Fat_Content","Item_Type",
                                                   "Outlet_Establishment_Year","Outlet_Size",
                                                   "Outlet_Location_Type","Outlet_Type"))

#check the data set
str(new_my_data)

#divide the new data
pca.train <- new_my_data[1:nrow(train),]
pca.test <- new_my_data[-(1:nrow(train)),]
head(pca.train)
ir.pca_2 <- prcomp(pca.train,
                 center = TRUE,
                 scale. = TRUE) 
print(ir.pca_2)




# plot method
plot(ir.pca_2, type = "l")

# summary method
summary(ir.pca_2)

# Predict PCs
predict(ir.pca_2, 
        newdata=tail(log.ir, 2))

install.packages("devtools")
library(devtools)
install_github("ggbiplot", "vqv")

library(ggbiplot)
g <- ggbiplot(ir.pca_2, obs.scale = 1, var.scale = 1, 
              groups = ir.species, ellipse = TRUE, 
              circle = TRUE)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal', 
               legend.position = 'top')
print(g)

names(ir.pca_2)
pr_var <- ir.pca_2$sdev^2
prop_varex <- pr_var/sum(pr_var)
#scree plot
plot(prop_varex, xlab = "Principal Component",
     ylab = "Proportion of Variance Explained",
     type = "b")

#cumulative scree plot
plot(cumsum(prop_varex), xlab = "Principal Component",
     ylab = "Cumulative Proportion of Variance Explained",
     type = "b")











