
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
myapp=oauth_app("twitter",key="yourConsumerKeyHere",secret = "yourConsumerSecretHere")
sig=sign_oauth1.0(myapp,token = "yourTokenHere",token_secret = "yourTokenSecretHere")
homeTL=GET("https://api.twitter.com/1.1/statuses/home_timeline.json",sig)

json1=content(homeTL)
json2=jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]


# Reading from other sources ----------------------------------------------
#foreign package
#read.arff(Weka);read.dta(stata);read.mtp(Minitab);read.octave(Octave);read.spss(SPSS);read.xport(SAS)

#RPostressSQL
#RODBC
#RMongo

#Reading images
#jpeg;readbitmap;png;EBImage

#Reading GIS data
#rdgal;rgeos;raster

#Reading music data
#tuneR;seewave



