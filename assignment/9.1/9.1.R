test.csv <- read.csv("https://stats.idre.ucla.edu/stat/data/test.csv", header = TRUE) ## meta data: data discribe data(header)
class(test.csv)
head(test.csv)
CardioGoodnessFit <- read.csv("~/Desktop/CardioGoodnessFit.csv",header=T)
v1 = c(1,2,3,4)
class(v1)
v2 = c('a','b','c')
class(v2)
v3 = c(v1,v2)
v3
l3 = list(1,9,'a','b')
l3[2]
l4 = list(tom = 1, dick = 9, harry = 'a', mary = 'b')
l4['mary']## list allow each type in one object
#P1
set.seed(1234)
myx = 1:15 ## or seq
myy = sample(0:100,15,replace = T) ##e.g:rposi,rnorm
myz = myx*myy
mydf = data.frame(myx,myy,myz)
plot(myx,myz) ##plot(myz~myx)
plot(mydf$myz~mydf$myx) ##alternative
for(i in 1:20)
{
  print(i)
}
#P2
for(i in 1:20) print(2*i)
##or 
for(i in 1:20) if(i%%2 == 0)  print(i)
##exercise random select P3
won = F
target = sample(0:40,1)
for(chance in 1:6)
{
  guess = readline("plz input your guess:")
  if(guess>target) print('too high')
  else if ((guess<target)) print('too low')
  else
  {
    msg = paste('congretulation, you guessed in', chance ,'tries')
    print(msg)
    won = T
    break
  }
}
if(!won)  print('you lost the game')
!won
##Anatomy of a function
myadd = function(larry,moe,curly)
{
  mysum = larry + moe + curly
  return(mysum)
}
a = 32
b = 52
c =100
myadd(a,b,c)
##birthday problem: explain what's happening 
##stock price