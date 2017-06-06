#9. Functions
Sys.Date()
mean(c(2,4,5))

boring_function <- function(x) {
  x
}
submit()

boring_function('My first function!')
boring_function

my_mean <- function(my_vector) {
  sum(my_vector)/length(my_vector) 
}
my_mean(c(4,5,10))

remainder <- function(num, divisor = 2) {
  num %% divisor
}
remainder(5)
remainder(11,5)
remainder(divisor = 11, num = 5)
remainder(4,div = 2)
args(remainder)

evaluate <- function(func, dat){
  func(dat)
}
evaluate(sd,c(1.4,3.6,7.9,8.8))
evaluate(function(x){x+1}, 6)
evaluate(function(x){x[1]},c(8,4,0))
evaluate(function(x){x[length(x)]},c(8,4,0))

?paste
paste("Programming","is","fun!")

telegram <- function(...){
  paste("START", ..., "STOP")
}
telegram("Hello")

mad_libs <- function(...){
  # Do your argument unpacking here!
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  # Don't modify any code below this comment.
  # Notice the variables you'll need to create in order for the code below to
  # be functional!
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}
mad_libs(place="Shanghai", adjective="crazy",noun="baby")

"%p%" <- function(left, right){ # Remember to add arguments!
  paste(left,right)
}
'I' %p% 'love' %p% 'R!'
