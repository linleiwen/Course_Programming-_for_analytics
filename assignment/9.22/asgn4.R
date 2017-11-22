library(dplyr)
library(tibble)
library(xtable)
library(ggplot2)


## Part A

# Read the data
# You download this file from https://www.kaggle.com/ludobenistant/hr-analytics
# and use your own path 
mydf <- read.csv("HR_comma_sep.csv")

# get rows and columns
dim.data.frame(mydf)

# explore the data structure
str(mydf)

# Correlate all the numeric fields: exclude catagorical data
xtable(cor(subset(mydf, select = -c(sales, salary))))

# Create a correlation heat map
library(reshape2)

melted_cormat <- melt(cor(subset(mydf, select = -c(sales, salary))))
head(melted_cormat)

g <- ggplot(data = melted_cormat, aes(x=Var1, y=Var2, fill=value)) + 
  geom_raster()
g <- g + theme(axis.text.x = element_text(angle = 90, hjust = 1))
g



# Develop a 3-way table
mydf$status <- ifelse(mydf$left == 1, "Left", "Stay")
table(mydf$status,  mydf$salary, mydf$sales)


# Employees who leave by department
left <- table(mydf$status,mydf$sales)
leftm <- as.matrix(left)
leftnum <- data.frame(leftm["Left",])
colnames(leftnum)[1] <- "LEFT" 
leftnum <- rownames_to_column(leftnum)

ggplot(leftnum, aes(rowname, LEFT)) +
  geom_col()

leftnum$rowname <- factor(leftnum$rowname, levels = leftnum$rowname[order(leftnum$LEFT)])
leftnum$rowname  # notice the changed order of factor levels

ggplot(leftnum, aes(x = rowname, y = LEFT)) + 
  theme_gray() + 
  geom_bar(stat = "identity")



# Complete this for employees who stay in the company by department
left <- table(mydf$status,mydf$sales)
leftm <- as.matrix(left)
staynum <- data.frame(leftm["Stay",])
colnames(staynum)[1] <- "Stay" 
staynum <- rownames_to_column(staynum)


staynum$rowname <- factor(staynum$rowname, levels = staynum$rowname[order(staynum$Stay)])
staynum$rowname  # notice the changed order of factor levels

ggplot(staynum, aes(x = rowname, y = Stay)) + 
  theme_gray() + 
  geom_bar(stat = "identity")





## Part B

#employees who leave the company by salary level 
left <- table(mydf$status,mydf$salary)
leftm <- as.matrix(left)
leftnum <- data.frame(leftm["Left",])
colnames(leftnum)[1] <- "LEFT" 
leftnum <- rownames_to_column(leftnum)

leftnum$rowname <- factor(leftnum$rowname, levels = leftnum$rowname[order(leftnum$LEFT)])
leftnum$rowname  

ggplot(leftnum, aes(x = rowname, y = LEFT)) + 
  theme_gray() + 
  geom_bar(stat = "identity")

#employees who stay in the company by salary level 

left <- table(mydf$status,mydf$salary)
leftm <- as.matrix(left)
staynum <- data.frame(leftm["Stay",])
colnames(staynum)[1] <- "Stay" 
staynum <- rownames_to_column(staynum)


staynum$rowname <- factor(staynum$rowname, levels = staynum$rowname[order(staynum$Stay)])
staynum$rowname  

ggplot(staynum, aes(x = rowname, y = Stay)) + 
  theme_gray() + 
  geom_bar(stat = "identity")

#employees who leave the company by salary level AND department

ggplot(data = mydf[which(mydf$status == "Left"),], aes( x =  sales,  fill = sales))+ #Define the x and fill value

geom_bar()+   # Add the bar plot
facet_grid(salary ~ .)+  #Create one bar plot per each Sex category
labs(y = "# of left")





#employees who stay in the company by salary level AND department
  ggplot(data = mydf[which(mydf$status == "Stay"),], aes( x =  sales,  fill = sales))+ #Define the x and fill value
    #I use fill instead of color because color refers only to the perimeter of the bars and fill to the
    # inside of each figure
    geom_bar()+   # Add the bar plot
    facet_grid(salary ~ .)+  #Create one bar plot per each Sex category
    labs(y = "# of stay")


## Part C

# Draw a bar plot of how many years did employees stay in the company before leaving
# Year stayed in the company is the x axis
  
ggplot(data = mydf[which(mydf$status == "Left"),], aes( x =  time_spend_company,  fill = as.factor(time_spend_company)))+ #Define the x and fill value
  #I use fill instead of color because color refers only to the perimeter of the bars and fill to the
  # inside of each figure
  geom_bar()+   # Add the bar plot
  labs(y = "# of people")+scale_fill_discrete(name = "years before leaving")



# Draw a bar plot of how many years did employees stay in the company before leaving
# by department
# Year stayed in the company is the x axis

ggplot(data = mydf[which(mydf$status == "Left"),], aes( x =  time_spend_company,  fill = as.factor(time_spend_company)))+ #Define the x and fill value
geom_bar()+   # Add the bar plot
facet_grid(sales ~ .)+
labs(y = "# of people")+scale_fill_discrete(name = "years before leaving")


# Draw a bar plot of how many years did employees stay in the company before leaving
# by salary level
# Year stayed in the company is the x axis

ggplot(data = mydf[which(mydf$status == "Left"),], aes( x =  time_spend_company,  fill = as.factor(time_spend_company)))+ #Define the x and fill value
  geom_bar()+   # Add the bar plot
  facet_grid(salary ~ .)+
labs(y = "# of people")+scale_fill_discrete(name = "years before leaving")


