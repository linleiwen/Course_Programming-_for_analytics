dataset = read.csv("kickers.csv")
dataset[,c(8,9)]
dataset = dataset[,"Distance"]
classifier.logistic = glm(formula = Success ~ .,
                          family = binomial,
                          data = dataset)
summary(dataset)
Distance=100
ScoreDiff=10
new=as.data.frame(cbind(Distance,ScoreDiff), col.names = c("Distance","ScoreDiff"))
y_prob.logisitc = predict(classifier.logistic,type = 'response', newdata = new)
y_pred.logisitc = ifelse(y_prob.logisitc > 0.5, "Success", "fail")
summary(classifier.logistic)
