x <- read.csv("hw1_data.csv")
x[1:2,]
head(x,2)
tail(x,2)
x$Ozone[47]
sum(is.na(x$Ozone))
mean(na.omit(x$Ozone))
subx <- x[x$Ozone>31 & x$Temp >90,]
mean(subx$Solar.R,na.rm = T)
mean(x$Temp[x$Month==6],na.rm = T)
max(x$Ozone[x$Month==5],na.rm = T)
