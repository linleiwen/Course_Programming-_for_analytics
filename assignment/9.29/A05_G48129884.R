#A
## 1.Use the first half of this dataset to be the training set and the second half of this dataset to be the test set. Your task is to predict the credit rating of an individual.
## 2.Please ensure that the data are clean.
## 3.Please provide the relevant exploratory and descriptive analysis.
## 4.Please explain how this descriptive analysis informed your next steps.

dataset = read.csv("creditdata.csv")
str(dataset)
head(dataset)

### Look for missing values
sum(is.na(dataset))

### the relevant exploratory and descriptive analysis
table(dataset$rating)
table(dataset$homeown)
table(dataset$mstat)
table(dataset$rcds)
table(dataset$jtype)
summary(dataset$experience)
summary(dataset$loandurn)
summary(dataset$age)
summary(dataset$explvl)
summary(dataset$inc)
summary(dataset$assts)
summary(dataset$loanamount)
summary(dataset$purchprice)

###splite data
library(caTools)
set.seed(123)
split = sample.split(dataset$rating, SplitRatio = 0.5)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#B
## 1.Please make a predictive model using logistic regression.
# Fitting Logistic Regression to the Training set
classifier.logistic = glm(formula = rating ~ .,
                 family = binomial,
                 data = training_set)
summary(classifier.logistic)
## 2.Which variables in the logistic regression model are significant or important?
### experience, rcds, jtype, explvl, inc, assts, debt, loanamount, purchprice

### 3.Please make a predictive model using a decision tree
library(rattle)
library(rpart)
classifier.decision = rpart(formula = rating ~ .,
                   data = training_set)
classifier.decision.prune <- prune(classifier.decision, cp = 0.02)
fancyRpartPlot(classifier.decision.prune) ##interaction ##import rpart.plot
fancyRpartPlot(classifier.decision.prune, main="DT for rpart",  palettes=c("Reds", "Oranges"))

### 4.Describe and explain the tree. How will you explain the tree to your client (less than 250words)?

# C
## 1.
y_prob.logisitc = predict(classifier.logistic,type = 'response', newdata = test_set[-1])## probability
head(y_prob.logisitc)
y_pred.logisitc = ifelse(y_prob.logisitc > 0.5, 1, 0)
# Making the Confusion Matrix of logistic regression
cm = table(test_set[, 1], y_pred.logisitc)
cm
accurancy.logisitc = (cm[1,1]+cm[2,2])/sum(cm)
print(paste('Accuracy of logistic regression:',accurancy.logisitc))

### decision tree
y_prob.decisiontree = predict(classifier.decision.prune, newdata = test_set[-1])## probability
y_pred.decisiontree = predict(classifier.decision.prune, newdata = test_set[-1], type = 'class')

# Making the Confusion Matrix
cm = table(test_set[, 1], y_pred.decisiontree)
cm
accurancy.desciontree = (cm[1,1]+cm[2,2])/sum(cm)
print(paste('Accuracy of decision tree:',accurancy.desciontree))

## 2. Find a way to explain sensitivity, specificity and auc in the ROC to your client (in less than 250 words).
library(ROCR)
pr <- prediction(y_prob.logisitc, test_set$rating)
prf <- performance(pr, measure = "tpr", x.measure = "fpr")
plot(prf) ##ROC curve
abline(a=0, b= 1)
auc <- performance(pr, measure = "auc")
auc <- auc@y.values[[1]]
auc




# ROC and AUC of decision tree
library(ROCR)
pred <- prediction(y_prob.decisiontree[,2], test_set$rating)
perf <- performance(pred,"tpr","fpr")
plot(perf)
abline(a=0, b= 1)
auc <- performance(pred, measure = "auc")
auc <- auc@y.values[[1]]
auc



