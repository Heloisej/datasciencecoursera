library(swirl)
install_from_swirl("R Programming")
swirl()

#3. Sequences of Numbers
#:
1:20
pi:10
15:1
?`:`

#seq function
seq(1,20)
seq(0,10,by = 0.5)
my_seq <- seq(5,10,length=30)
length(my_seq)
1:length(my_seq)
seq(along.with=my_seq)

seq_along(my_seq)

#rep function
rep(0,times=40)
rep(c(0,1,2),times=10)
rep(c(0,1,2),each=10)
