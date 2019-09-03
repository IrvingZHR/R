getwd()
#setwd("./Desktop/Advanced R/Weather Data")    SAMES AS BELOW
setwd("/Users/USER/Desktop/Advanced R/Weather Data")

Chicago <- read.csv("Chicago-F.csv",row.names = 1)
Houston <- read.csv("Houston-F.csv",row.names = 1)
NewYork <- read.csv("NewYork-F.csv",row.names = 1)
SanFrancisco <- read.csv("SanFrancisco-F.csv",row.names = 1)


typeof(Chicago)
is.data.frame(Chicago)
is.matrix(Chicago)

# convert to matrices

Chicago <- as.matrix(Chicago)
Houston <- as.matrix(Houston)
NewYork <- as.matrix(NewYork)
SanFrancisco <- as.matrix(SanFrancisco)

Weather <- list(Chicago=Chicago,Houston=Houston,NewYork=NewYork,SanFrancisco=SanFrancisco)

Weather$NewYork[2,"Mar"]

# apply function
?apply
Chicago


# analysis
apply(Chicago,1,mean)
apply(Chicago,1,max)
apply(Chicago,1,min)
apply(Chicago,2,max)

# compare
apply(Chicago,1,mean)
apply(Houston,1,mean)
apply(NewYork,1,mean)
apply(SanFrancisco,1,mean)

### <<<<<<<-    There is a faster way
# recreating apply functions with loops

Chicago
# find the mean of every row
# 1. via loops
output <- NULL
for (i in  1:5){
 output[i] <-  mean(Chicago[i,])
}

output
 names(output) <- rownames(Chicago)

# 2. via apply function
 
 apply(Chicago,1,mean)
 
# using lapply
 
 ?lapply
Chicago
t(Chicago)
Weather
#t(Weather$Chicago)
#t(Weather$Houston)
#t(Weather$NewYork)
#t(Weather$SanFrancisco)
# example 1
newlist <- lapply(Weather,t)
newlist


# example 2
Weather
Chicago
rbind(Chicago,hello = 1:12)
sapply(Weather,rbind,hello = 1:12)


# example 3
?rowMeans
rowMeans(Chicago) # identical to : apply(Chicago,1,mean)

lapply(Weather,rowMeans)

# rowMeans
# colMeans
# rowSums
# colSums


Weather
Weather[[1]][1,1]  #  Weather[[1]][1,1] Weather[[2]][1,1] Weatehr[[3]][1,1]
Weather$Chicago[1,1] # use lapply for all cities

lapply(Weather,"[",1,1)

lapply(Weather,"[",,1)

lapply(Weather,"[",,3)

######################################
is.matrix(Weather$Chicago)
c.df <- as.data.frame(Weather$Chicago)
n.df <- as.data.frame(Weather$NewYork)
h.df <- as.data.frame(Weather$Houston)
s.df <- as.data.frame(Weather$SanFrancisco)

df <- rbind(c.df,n.df,h.df,s.df)

df.list <- list(df)

apply(df.list,1,mean)
####################################

# adding your own functins
lapply(Weather,rowMeans)
lapply(Weather,function(x) x[1,] )
lapply(Weather,function(x) x[5,] )
lapply(Weather,function(z) z[1,] - z[3,])

#   sapply  simplified 

lapply(Weather,rowMeans)
sapply(Weather,rowMeans)

sapply(Weather,function(x) round(((x[1,]-x[2,]) / x[2,]),2))
 
# by the way
sapply(Weather,function(x) x[1,] ,simplify = F) # SAME AS LAPPLY


###### NESTING APPLY FUNCTION
Weather
lapply(Weather,rowMeans)
Chicago
apply(Chicago,1,max)
# apply across the whole list
lapply(Weather,apply,1,max)
lapply(Weather,function(x) apply(x,1,max))  # same thing

# tidy it up
sapply(Weather,apply,1,max)




###########################
# which.max() and which.min()
?which.max
which.max(Chicago[1,])
names(which.max(Chicago[1,]))

# by the sounds of it , we will ues lapply or sapply
apply(Chicago,1,function(x) names(which.max(x)))

lapply(Weather,function(y) apply(y,1,function(x) names(which.max(x))))

sapply(Weather,function(y) apply(y,1,function(x) names(which.max(x))))


