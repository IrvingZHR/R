getwd()
setwd("/Users/USER/Desktop/Advanced R")
fin <- read.csv("Future-500.csv",na.strings = c(""))
head(fin,15) 
fin

is.na(fin$Expenses)
fin[is.na(fin$Expenses),]
  
# sub() and gsub()
fin$Expenses <- gsub("Dollars","",fin$Expenses)
fin$Expenses <- gsub(",","",fin$Expenses)
fin$Revenue <- gsub("\\$","",fin$Revenue)
fin$Revenue <- gsub(",","",fin$Revenue)
fin$Growth <- gsub("%","",fin$Growth)
str(fin)

fin$Expenses <- as.numeric(fin$Expenses)
fin$Revenue <- as.numeric(fin$Revenue)
fin$Growth <- as.numeric(fin$Growth)
head(fin)


# Replace empty with NAs
!complete.cases(fin)
fin[!complete.cases(fin),]


fin[!complete.cases(fin$State),]

fin1 <- fin[complete.cases(fin$State),]

rownames(fin1) = 1:nrow(fin1)
rownames(fin1)  = NULL

fin1
head(fin,24)

options(max.print = 10000)

# REPALECE THE MISSING DATA / FACTUAL ANALYSIS

fin[!complete.cases(fin),]
fin[is.na(fin$State),]

fin[is.na(fin$State) & fin$City == "New York" ,"State"] <- "NY"

fin[fin$City == "San Francisco",]

fin[is.na(fin$State) & fin$City == "San Francisco","State"] <- "CA"
# check
fin[c(11,379),]
fin[c(84,267),]


# median inputation method  part 1

fin[!complete.cases(fin),]
med_retail_emp <- median(fin[fin$Industry == "Retail","Employees"],na.rm = T)
mean(fin[fin$Industry == "Retail","Employees"],na.rm = T)

fin[fin$Industry == "Retail" & is.na(fin$Employees),"Employees"] <- med_retail_emp
# check
fin[is.na(fin$Employees)&fin$Industry == "Retail",]
fin[3,]

head(fin)

# median inputation method 

fin[!complete.cases(fin$Employees),]
med_serv_emp <- median(fin[fin$Industry == "Financial Services","Employees"], na.rm = T)
med_serv_emp

fin[fin$Industry == "Financial Services" & is.na(fin$Employees),"Employees" ] <- med_serv_emp

fin[332,]

# median inputation method  part 2

fin[!complete.cases(fin$Growth),]
med_growth_constr <- median(fin[fin$Industry == "Construction","Growth"], na.rm = T)

fin[is.na(fin$Growth) & fin$Industry == "Construction","Growth"] <- med_growth_constr

fin[8,]

# revenue and expenses

fin[!complete.cases(fin$Revenue),]
med_rev_constr <- median(fin[fin$Industry == "Construction","Revenue"], na.rm = T)
med_rev_constr 

fin[fin$Industry == "Construction" & is.na(fin$Revenue),"Revenue"] <- med_rev_constr

fin$Renvenue <- NULL

fin[c(8,44),]



fin[!complete.cases(fin$Expenses),]
med_expen_constr <- median(fin[fin$Industry == "Construction","Expenses"], na.rm = T)
med_expen_constr 

fin[fin$Industry == "Construction" & is.na(fin$Expenses) & is.na(fin$Profit),"Expenses"] <- med_expen_constr

# replaceing missing data 
# profit = revenue - expenses
######################
#####################
fin[is.na(fin$Profit),"Profit"] <- fin[is.na(fin$Profit),"Revenue"] - fin[is.na(fin$Profit),"Expenses"]
str(fin)

fin[is.na(fin$Expenses),"Expenses"] <- fin[is.na(fin$Expenses),"Revenue"] - fin[is.na(fin$Expenses),"Profit"]



fin[!complete.cases(fin),]
fin <- fin[-c(14,15),] 
fin[!complete.cases(fin),]
fin[c(14,15),]
# VISUALIZING 
library(ggplot2)

p <- ggplot(data = fin)
p + geom_point(aes(x= Revenue,y = Expenses,size = Profit,color = Industry))
###########

d <- ggplot(data = fin,aes(x= Revenue,y = Expenses,color = Industry))

d + geom_point() + geom_smooth(fill = NA,size = 1.2)


######

a <- ggplot(data = fin,aes(x= Industry,y = Growth ,color = Industry))
a + geom_boxplot(size = 1) + geom_jitter(alpha = 0.5)

a + geom_boxplot(size = 1,outlier.colour = NA)
 

