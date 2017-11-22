# part A
a = c(1,2,3)
a[1]
length(a)
## calculate average(mean())
myAvg <- function(anyVector) 
{
  sum = 0.0
  for(i in 1:length(anyVector)) sum = sum + anyVector[i]
  return (sum/length(anyVector))
}
## compute Std 
mySD <- function(anyVector) 
{
  variance = 0
  for(i in 1:length(anyVector)) variance = variance + (anyVector[i]-myAvg(anyVector))^2
  return (variance^0.5)
}
mySD(a) ##compared with
## compute Range 
myRange <- function(anyVector) 
{
  min = Inf
  max = -Inf
  for(i in 1:length(anyVector))
  {
    if(anyVector[i]>max) max = anyVector[i]
    if(anyVector[i]<min) min = anyVector[i]
  }
  return (max-min)
}
library(readr)
CardioGoodnessFit <- read_csv("~/Google Drive/academic/programing for analytics/assignment/9.1/CardioGoodnessFit.csv")
Income = c(myAvg(CardioGoodnessFit$Income), mySD(CardioGoodnessFit$Income), myRange(CardioGoodnessFit$Income))
Miles =  c(myAvg(CardioGoodnessFit$Miles), mySD(CardioGoodnessFit$Miles), myRange(CardioGoodnessFit$Miles))
Income
Miles
# part B
K=seq(10,70,by=5) ##present number of people in a class
p=rep(0,length(K))##P[i]present probablity of at least two people have the same birthday date under certain number of people 
for (i in 1:length(K)) {
  n = 1
  prod=1    ##after 'while' iteration, prod is the probability of non other people have the same birthday date.
  while (n<K[i]) {
    prod=prod*(1-n/365) ## in order to compute: 365*364*363....../365^n
    n=n+1
  }
  p[i]=1-prod ##P[i]present probablity of at least two people have the same birthday date under certain number of people 
}
plot(K, p, type="l",
     xlab="number of people",
     ylab="Prob(same birthday)",
     col="blue",lwd=2)
## the first loop(for loop) is going to let each slot in P[] be enter a probablity number underunder the certain number of people 
## the second loop(while loop) is going to compute permutation(365,n)/ 365^n which is the probablity of at least two people have the same birthday date when n people in class
all=read.table("prices.txt",header=TRUE)
msft=all[,2]
ge=all[,4]
n=length(msft)
d_msft=rep(0,n)
r_msft=rep(0,n)
d_ge=rep(0,n)
r_ge=rep(0,n)
for (t in 2:n) 
{
  d_msft[t]=msft[t]-msft[t-1]##the change of day price: how much is the price of microsoft going up?
  r_msft[t]=d_msft[t]/msft[t-1]## the change rate of day price: microsoft daily return
  d_ge[t]=ge[t]-ge[t-1]##the change of day price: how much is the price of GE going up?
  r_ge[t]=d_ge[t]/ge[t-1]## the change rate of day price: GE stock daily return
}
par(mfrow=c(1,2))
plot(r_msft,
     type="l",
     main="Daily Returns 11/1/1993 to 4/3/2003",
     xlab="day",
     ylab="Returns",
     col="blue")
hist(r_msft,
     col="blue",
     xlab="Microsoft Returns",
     prob=T,
     nclass=20)
id_msft=(d_msft>0) ##create a vector'id_msft' which indicates today Microsoft price whether goes up
id_ge=(d_ge>0)##create a vector'id_ge' which indicates today GE price whether goes up
ftable(id_ge,id_msft)##create a matrix shows that the numbers days of two stock price going down together, Microsoft going down while GE going up,Microsoft going up while GE going down and two stock price both going up.
# part C
n=as.integer(readline("enter an integer:"))
s = seq(from = 0.05, to = 1, by = 0.05)
p = rep(0,length(s))
matrix = c('X',s)
martix
for(i in 0:n)
{
  for(j in 1:length(p))
  {
    p[j]= p[j]+s[j]^i*(1-s[j])^(n-i)*dim(combn(n,i))[2]
  }
  matrix = rbind(matrix, c(i,round(p, digits = 3)))
}  
View(matrix)

