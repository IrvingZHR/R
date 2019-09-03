movies <- Section6_Homework_Data
head(movies)
str(movies)
level(movies)
colnames(movies) = c("Day of week","Director","Genre","Movie Title","Release Date","Studio","Adjusted Gross","Budget $M","Gross","IMDb Rating","MovieLens Rating","Overseas","Oversease%","Profit","Profit%","Runtime","US","Gross US")
library("ggplot2")

filter <- (movies$Genre == "action") |(movies$Genre == "adventure") |(movies$Genre == "animation") |(movies$Genre == "comedy") |(movies$Genre == "drama") 
filter2 <- (movies$Studio == "Buena Vista Studios") |(movies$Studio == "Fox") |(movies$Studio == "Paramount Pictures") |(movies$Studio == "Sony") |(movies$Studio == "Universal") |(movies$Studio == "WB") 


movies2 <- movies[filter & filter2,]
a <- ggplot(data =movies2,aes(x = Genre,y = `Gross US`,size = `Budget $M`))
e <- a + geom_jitter(aes(col = Studio)) + geom_boxplot(alpha = 0.5,outlier.color = NA) + 
  ggtitle("Domestic % Gross by Genre")+
  ylab("Gross % US") + theme(axis.title = element_text(colour = "Blue",size = 15),
                             legend.title = element_text(size = 15),
                             plot.title = element_text(colour = "Black",size = 20),
                             text = element_text(family = "Comic Sans MS" ))

e$labels$size <- "Budget M"

library(stats)

?stat_bin()




