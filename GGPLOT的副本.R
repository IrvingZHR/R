getwd()
setwd( "/Users/USER/Desktop")
movie <- read.csv("Movie-Ratings.csv")
tail(movie)
summary(movie)
colnames(movie) <- c("Film","Genre","CriticalRating","AudienceRating","BudgetMillion","Year")
head(movie)  
str(movie)
factor(movie$Year)
movie$Year <- factor(movie$Year)
summary(movie)
#######    Aesthetics
library(ggplot2)

ggplot(data = movie,aes(x = CriticalRating, y = AudienceRating) )

#  geometry
ggplot(data = movie,aes(x = CriticalRating, y = AudienceRating) ) + geom_point()

# add colour

ggplot(data = movie,aes(x = CriticalRating, y = AudienceRating, col = Genre) ) + 
  geom_point()
 
# add size

ggplot(data = movie,aes(x = CriticalRating, y = AudienceRating, col = Genre,size = BudgetMillion) ) + 
  geom_point()



# 
p <- ggplot(data = movie,aes(x = CriticalRating, y = AudienceRating, col = Genre,size = BudgetMillion) )  
p

p + geom_point()
p + geom_line()
# multiple layers
p + geom_point(aes(x = BudgetMillion)) +xlab ("Budget") 

#  mapping VS setting
r <- ggplot(data = movie,aes(x = CirticalRating,y = AudienceRating))
r+ geom_point()
              
# add colour 
# 1.Mapping() 
r + geom_point(aes(col = Genre))

# setting
r + geom_point(col = "DarkBlue")

head(movie)

ggplot(data = movie) + geom_point(aes(x = BudgetMillion, y = CriticalRating,col = AudienceRating,size =BudgetMillion))

###-----------histgrams and density charts
s <- ggplot(data = movie, aes(x = AudienceRating,y = CriticalRating))
#-------  add coulor
s + geom_histogram(binwidth = 10,aes(fill = Genre))
#------ add border
s + geom_histogram(binwidth = 10,aes(fill = Genre),col = "Black")


##-----------density chart

s + geom_density(aes(fill = Genre),position = "Stack")

s+ geom_abline()
 
?geom_abline


s + geom_point(aes(col = AudienceRating),size = 2) + geom_abline(col = "Red")

s + geom_point(aes(col = BudgetMillion,size = BudgetMillion)) +geom_abline(col = "Red")

#-------- statictical transformation

 u <- ggplot(data = movie,aes(x = CriticalRating,y = AudienceRating,col = Genre))
u + geom_point() + geom_smooth(fill = NA)
 #-------------BOX PLOT

u <- ggplot(data = movie, aes(x= Genre,y = AudienceRating,col = Genre))
u + geom_boxplot()
u + geom_boxplot(size = 1.2) + geom_point()

# tip
u + geom_boxplot(size = 1.2) + geom_jitter()

u + geom_jitter() + geom_boxplot(size = 1, alpha = 0.5)

#------------ FACETS histgarm

t <- ggplot(data = movie,aes(BudgetMillion))

t + geom_histogram(binwidth = 10,aes(fill = Genre),col = "Black") +facet_grid(Genre~.,scale  = "free")

#----------- FACETS POINT
# excercise 1
a <- ggplot(data = movie,aes(x = CriticalRating,y = AudienceRating))
a + geom_point(aes(col = Genre),size = 2) + facet_grid(Genre~Year)+geom_smooth(fill = NA)

#--------- coordinates
# limit and zoom

m <- ggplot(data = movie, aes(x= CriticalRating , y= AudienceRating,size = BudgetMillion, col = Genre))
m+ geom_point()


m+ geom_point() + xlim(50,100) + ylim(50,100)

#------- won't always work well

n <- ggplot(data = movie, aes(x =  BudgetMillion)
            
n + geom_histogram(binwidth = 10,aes(fill = Genre),col = "Black")+ ylim(0,50)

# instand -- use zoom 
n + geom_histogram(binwidth = 10,aes(fill = Genre),col = "Black") + coord_cartesian(ylim=c(0,50))

# improved excecise 1
a + geom_point(aes(col = Genre),size = 2) + facet_grid(Genre~Year)+geom_smooth() + 
  coord_cartesian(ylim = c(0,100))

# -    Theme

o <- ggplot(data = movie, aes(x =  BudgetMillion))
            
h <- o + geom_histogram(binwidth = 10,aes(fill = Genre),col = "Black")

# axes labels
 h + xlab("HELLO") + ylab("PPP")+ theme(axis.title.x = element_text(colour  = "Blue",size = 30),
                                        axis.title.y = element_text(colour = "Yellow",size = 30))
# tick mark  formating
 h + xlab("HELLO") + ylab("PPP")+ theme(axis.title.x = element_text(colour  = "Blue",size = 30),
                                        axis.title.y = element_text(colour = "Yellow",size = 30),
                                        axis.text.x = element_text(colour = "Red",size = 29),
                                        axis.text.y = element_text(colour = "Red",size = 29),
 )

 
 # legend formating
 ?theme
 
    h +
   ggtitle("Budget Millions")+
   xlab("HELLO") + ylab("PPP")+ theme(axis.title.x = element_text(colour  = "Blue",size = 30),
                                        axis.title.y = element_text(colour = "Yellow",size = 30),
                                        axis.text.x = element_text(colour = "Red",size = 29),
                                        axis.text.y = element_text(colour = "Red",size = 29),
                                        legend.title = element_text(size = 30),
                                        legend.text = element_text(size = 20),
                                        legend.position = c(1,1),
                                        legend.justification = c(1,1),
                                      plot.title = element_text(colour = "Red", size = 40,family = "Courier")
                                        
  )
 
library(ggplot2)
summary(movies)
head(movies)
mo <- ggplot(data = movies,aes(x= `Profit%` ,y = Gross))+
  geom_point() + geom_polygon(alpha = 0.3) + geom_abline()

mo
 
mo %+% movies + aes( x = `Oversease%`)+ geom_area()
 ?geom_smooth
 
 
 
 
 
 
 
 
 
 
 
 