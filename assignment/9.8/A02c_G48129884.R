# part c 
mydf = read.csv("quizscores.csv",header = T)
table(mydf$Degree,mydf$Sex)

dim(subset(mydf,Sex == "F"))[1]/dim(mydf)[1] #P(F)
dim(subset(mydf,Sex == "M"))[1]/dim(mydf)[1]#P(M)
dim(subset(mydf,Sex == "M"& Degree =="MBA"))[1]/dim(mydf)[1]#P(M and MBA)
dim(subset(mydf,Sex == "F"& Degree =="MS"))[1]/dim(mydf)[1]#P(F and MS)
dim(subset(mydf,Sex == "F"& Degree =="MBA"))[1]/dim(subset(mydf,Degree =="MBA"))[1]#P(F | MBA)
dim(subset(mydf,Sex == "M"& Degree =="MS"))[1]/dim(subset(mydf,Sex == "M"))[1]#P(MS | M)

apply(subset(mydf,Sex== "M")[-(1:3)],2,mean)#average score across all six quizzes for males
apply(subset(mydf,Sex== "F")[-(1:3)],2,mean)#average score across all six quizzes for females

apply(subset(mydf,Section =="A")[-(1:3)],2,mean)#average score across all six quizzes for the sectionsA
apply(subset(mydf,Section =="B")[-(1:3)],2,mean)#average score across all six quizzes for the sectionsB
apply(subset(mydf,Section =="C")[-(1:3)],2,mean)#average score across all six quizzes for the sectionsC

apply(subset(mydf,Degree =="MBA")[-(1:3)],2,mean)#the average score across all six quizzes for MBA
apply(subset(mydf,Degree =="MS")[-(1:3)],2,mean)#the average score across all six quizzes for MS
