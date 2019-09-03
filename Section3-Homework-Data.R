#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution

#profit of each month
profit <- c(rep(NA,12))
profit = revenue - expenses

#profit after tax
profit_after_tax <-c(rep(NA,12))
profit_after_tax = profit * 0.7

# margin
profit_margin <- c(rep(NA,12))
profit_margin = profit_after_tax / revenue

#good month 
mean <- mean(profit_after_tax)
mean
good_months<- 









