# part a 
mydf = read.csv("quizscores.csv",header = T)
mydfb = mydf[1:20,] #contains the data for rows 1 to 20
mydfc = subset(mydf, Sex=='M'&Section=='B' ) #contains the data for females pursuing an MBA degree
mydfd = subset(mydf, Sex=='F'&Degree =='MBA')# contains all quiz scores no othercolumns for males doing an MS degree.
mydfe = subset(mydf, Sex=='M'&Degree =='MS')[,-(1:3)]# contains all quiz scores no othercolumns for males doing an MS degree.
mydff = subset(mydf,Sex=='F'&Degree =='MBA'&Section=='C',select= c(Quiz1,Quiz3)) #contains only Quiz1 and Quiz3 scores for females in section C pursuing an MBA degree
