
# Reading from the Web ----------------------------------------------------
# Accessing websites with passwords
library(httr)
pg1=GET("http://httpbin.org/basic-auth/user/passwd") #user,pwd required
pg1

pg2=GET("http://httpbin.org/basic-auth/user/passwd",authenticate("user","passwd"))
pg2
names(pg2)

#using handles
google=handle("http://google.com")
pg1=GET(handle = google,path="/")
pg2=GET(handle = google,path="search")


# Reading from API --------------------------------------------------------


