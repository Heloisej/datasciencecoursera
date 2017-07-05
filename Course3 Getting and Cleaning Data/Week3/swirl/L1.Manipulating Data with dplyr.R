library(swirl)
install_from_swirl("Getting and Cleaning Data")
swirl()

mydf <- read.csv(path2csv,stringsAsFactors = FALSE)
dim(mydf)
head(mydf)

#load package
library(dplyr)
packageVersion("dplyr")

#1.load the data into a "tbl_df"-------------------------------
cran <-tbl_df(mydf)
rm("mydf")

?tbl_df
#main advatage: printing
cran

#2.select-------------------------------------
?select
select(cran,ip_id,package,country)

#":"
5:20
select(cran,r_arch:country)
select(cran,country:r_arch)

#"-"
cran
select(cran,-time)

-5:20
-(5:20)
select(cran,-(X:size))

#3.filter--------------------------------
filter(cran,package=="swirl")
filter(cran,r_version == "3.1.1",country == "US")

?Comparison
filter(cran,country == "IN",r_version <= "3.0.2")
filter(cran,country == "US"|country == "IN")
filter(cran,size > 100500, r_os == "linux-gnu")

is.na(c(3,5,NA,10))
!is.na(c(3,5,NA,10))
filter(cran,!is.na(r_version))

#4.arrange-------------------------------
cran2 <- select(cran,size:ip_id)
arrange(cran2,ip_id)
arrange(cran2,desc(ip_id))
arrange(cran2,package,ip_id)
arrange(cran2,country,desc(r_version),ip_id)

#5.mutate-------------------------------
cran3 <- select(cran,ip_id,package,size)
cran3
mutate(cran3,size_mb = size/2^20)
mutate(cran3,size_mb = size/2^20,size_gb=size_mb/2^10)
mutate(cran3,correct_size=size+1000)

#6.summarize---------------------
summarize(cran,avg_bytes=mean(size))
