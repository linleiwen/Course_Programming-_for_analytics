rnorm2 <- function(n,mean,sd) { mean+sd*scale(rnorm(n)) } 
set.seed(1239)
r1 <- rnorm2(100,25,4) 
r2 <- rnorm2(50,10,3) 
samplingframe <- c(r1,r2) 
hist(samplingframe, breaks=20,col = "pink")

mean(sample(samplingframe,size = 50, replace = T))
a= 1:50
a = apply(a,2)
for(i in 1:50) a[i]=mean(sample(samplingframe,size = 50, replace = T))
hist(a)
