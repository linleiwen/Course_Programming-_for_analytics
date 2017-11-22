# part b 
mydf = read.csv("quizscores.csv",header = T)
mymatb = as.matrix(subset(mydf,Section == "B")[-(1:3)]) #the data only for Section B for all six quizzes
mymatc = as.matrix(subset(mydf,Section == "C")[-(1:3)]) #the data only for Section C for all six quizzes
apply(mymatb,2,mean) #average for all six quizzes for section B
apply(mymatc,2,mean) #average for all six quizzes for section C

myAnalysis = function(matrix)
{
  avg = apply(matrix,2,mean) ## get mean of each column
  std = apply(matrix,2,sd)  ## get standard deviation of each column
  return(rbind(avg,std))
}

myAnalysis(mymatb)
myAnalysis(mymatc)
difference = myAnalysis(mymatb) - myAnalysis(mymatc)
difference
##in Quiz1,Quiz5, Quiz6, average score of students of Section B is higher than those of student of Section C, and standard deviation is lower.
##on the contrary,those of Quiz2 and Quiz4  are opposite.
##while in Quiz3, average score of students of Section B is higher than those of student of Section C, but standard devidation of score of students of Section B is higher than those of student of Section C too

