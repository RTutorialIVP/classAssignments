#read the training data into a dataframe called train
train<- read.table("C:/Users/Administrator/Desktop/R Course/Titanic/train.csv",
                    header = TRUE, sep = ",")
#set the pclass, passengers pseudoclass, to be ordered categorical
train$pclass <-factor(train$Pclass,levels = c(3, 2, 1), ordered = TRUE)

#create a truth vector of survival results from training
S = train$Survived == 1

#read the test data into a dataframe named test
test<- read.table("C:/Users/Administrator/Desktop/R Course/Titanic/test.csv",
                   header = TRUE, sep = ",")

#pclass is categorical for test data also
test$pclass <-factor(test$Pclass,levels = c(3, 2, 1), ordered = TRUE)

#create a super simple logistic regression model with the training data
#predicting survival based on passenger class and sex
logistic.model <- glm(Survived ~ pclass + Sex, family = binomial(), data=train)

#generate predictions for training data using the predict method of the logistic model
training_predictions <- predict(logistic.model, type = "response")

#compute training error use an outcome cutoff at 0.5
training_error <-sum((training_predictions >= 0.5) != S)/nrow(train)
training_error
1-training_error

#training error for predictions in {0,1}
test_predictions = predict(logistic.model, test, type = "response")

#using a probability cutoff of 0.5 for outcome of survived, default missing to deceased
test_predictions[test_predictions >=0.5] <- 1
test_predictions[ test_predictions != 1] <- 0
test_predictions[is.na(test_predictions)] <- 0

#write out the test_predictions to a comma separated value, csv, file
write.table(test_predictions, "C:/Users/vk046010/Desktop/Titanic/predictions.csv",col.names = F,row.names=F,quote=FALSE)