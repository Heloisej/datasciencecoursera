?sample
sample(1:6,4,replace = TRUE)
sample(1:6,4,replace = TRUE)

sample(1:20,10)

LETTERS
sample(LETTERS)

flips <- sample(c(0,1),100,replace = TRUE,prob = c(0.3,0.7))
flips
sum(flips)

?rbinom
rbinom(1,size = 100,prob = 0.7)
flips2 <- rbinom(100,size = 1,prob = 0.7)
flips2
sum(flips2)

?rnorm
rnorm(10)
rnorm(10,100,25)

rpois(5,lambda = 10)
my_pois <- replicate(100,rpois(5,10))
my_pois
cm <- colMeans(my_pois)
hist(cm)
