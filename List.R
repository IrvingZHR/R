getwd()
setwd("/Users/USER/Desktop/Advanced R")
util <- read.csv("Machine-Utilization.csv")
 

head(util,12)
str(util)
summary(util)


util$Utilization <- 1 - util$Percent.Idle

# handling date - Times in R
?POSIXct

util$PosixTime <- as.POSIXct(util$Timestamp,format = "%d/%m/%Y %H:%M")
util$Timestamp <- NULL
head(util)

# REARANGE COLUMNS

util <- util[,c(2,3,4,1)]

summary(util)

###
mean_rl1_idle <- mean(util[util$Machine == "RL1","Percent.Idle"],na.rm = T)
max_rl1_idle <- max(util[util$Machine == "RL1","Percent.Idle"],na.rm = T)
min_rl1_idle <- min(util[util$Machine == "RL1","Percent.Idle"],na.rm = T)

low_utilization <- util[util$Utilization < 0.9 & util$Machine == " RL1",]
low_utilization

na_rl1_hours <- util[util$Machine == "RL1" & is.na(util$Utilization),"PosixTime"]


# DATAFRAME FOR THIS MACHINE

rl1 <- util[util$Machine == "RL1",]


# PLOT
head(util,12)

library(ggplot2)

p <- ggplot(data = util,aes(x = Machine,y = Utilization))

p + geom_boxplot(aes(col = Machine),outlier.alpha = 0)+geom_jitter(aes(col = Machine),alpha = 0.2)


# what is a list
summary(util)
rl1 <- util[util$Machine == "RL1",]

summary(rl1)
rl1$Machine <- factor(rl1$Machine)

summary(rl1)

#construct list

util_stats_rl1 <- c(min(rl1$Utilization,na.rm = T),
                    mean(rl1$Utilization,na.rm = T),
                    max(rl1$Utilization,na.rm = T)
                    )

rl1$Utilization < 0.9
which(rl1$Utilization < 0.9)
length(which(rl1$Utilization < 0.9)) > 0


util_under_90_flag <- length(which(rl1$Utilization < 0.9)) > 0

rl1_list <- list("RL1",util_stats_rl1,util_under_90_flag)
rl1_list
 

# name component of a list
names(rl1_list)
names(rl1_list) <- c("Machine","stats","lowthreshold")


# another way ( like data frames)
rm(rl1_list)
 
rl1_list <- list(Machine = "RL1",STATS = util_stats_rl1, lowthreshold = util_under_90_flag)

# Extracting components of a list
#three ways:
# [] - will always return a list
#[[]] - will always return the actual object
#$ - the same as the [[]], but prettier

rl1_list

rl1_list[1]
rl1_list[[1]]
rl1_list$Machine

rl1_list[2]
rl1_list[[2]]
rl1_list$STATS

typeof(rl1_list[2])
typeof(rl1_list[[2]])
typeof(rl1_list$STATS)

# get access to the max of the STATS

rl1_list$STATS[3]
rl1_list[[2]][3]

# adding and deleting components of a list
rl1_list

rl1_list[4] <- "HELLO"
# ANOTHER WAY

rl1_list$UNKONWN <- rl1[is.na(rl1$Utilization),"PosixTime"]


# REMOVE A COMPONENT
rl1_list[4] <- NULL


rl1_list$DATA <- rl1

summary(rl1_list)

# challenge
rl1_list
rl1_list$UNKONWN[1]
 
# subsetting lists
rl1_list[1:3]
rl1_list[c(1,4)]
rl1_list[c("Machine","STATS")]
# double square brackets are not for subsetting

# building a timeseries plot
util
u <- ggplot(data = util)
u + geom_line(aes(x = PosixTime, y = Utilization,col = Machine),size = 1.2)+
  facet_grid(Machine~.) +
  geom_hline(yintercept = 0.9,col = "Grey",size = 1.2, linetype = 3)

time_plot <- u + geom_line(aes(x = PosixTime, y = Utilization,col = Machine),size = 1.2)+
  facet_grid(Machine~.) +
  geom_hline(yintercept = 0.9,col = "Grey",size = 1.2, linetype = 3)

  rl1_list$PLOT <- time_plot

 str(rl1_list)
