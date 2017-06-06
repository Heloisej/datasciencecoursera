#14: Dates and Times
#Dates: the number of days since 1970-01-01
#Times: the number of seconds since 1970-01-01
x <- as.Date("1970-01-01")
unclass(x)
unclass(as.Date("1970-01-02"))
x <- Sys.time()
x
p <- as.POSIXlt(x)
names(unclass(p))
p$sec

datestring <- c("一月 10, 2012 10:40","十二月 9, 2011 09:10")
x <- strptime(datestring, format="%B %e, %Y %H:%M")
x
class(x)

x <- as.Date("2012-01-01")
y <- strptime("9 01 2011 11:34:21","%d %m %Y %H:%M:%S")
x-y
x <- as.POSIXct(x)
x-y

x <- as.Date("2012-03-01")
y <- as.Date("2012-02-28")
x-y
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00",tz="GMT")
y-x

d2 <- as.Date("1969-01-01")
unclass(d2)
t1 <- Sys.time()
t1
class(t1)
unclass(t1)

t2 <- as.POSIXlt(Sys.time())
t2
class(t2)
t2
unclass(t2)
str(unclass(t2))
t2$min

d1 <- Sys.Date()
weekdays(d1)
months(t1)
quarters(t2)

t3 <- "十月 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M")
t4
class(t4)

Sys.time() > t1
Sys.time() - t1
difftime(Sys.time(),t1,units = 'days')
