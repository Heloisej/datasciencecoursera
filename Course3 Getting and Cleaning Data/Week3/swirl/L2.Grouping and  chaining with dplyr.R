library(swirl)
swirl()
library(dplyr)

#dbl_df
cran <- tbl_df(mydf)
rm("mydf")
cran

#group_by
?group_by
by_package <- group_by(cran,package)
by_package
summarize(by_package,mean(size))


pack_sum <- summarize(by_package,
                      count = n() , #total number of rows
                      unique = n_distinct(ip_id), #total number of unique downloads
                      countries = n_distinct(country), 
                      avg_bytes = mean(size))

pack_sum

quantile(pack_sum$count,probs = 0.99)
top_counts <- filter(pack_sum,count > 679)
top_counts
View(top_counts)

#arrange
top_counts_sorted <- arrange(top_counts,desc(count))
View(top_counts_sorted)

#unique count-------------------------
quantile(pack_sum$unique,probs = 0.99)
top_unique <- filter(pack_sum,unique > 465)
View(top_unique)
top_unique_sorted <- arrange(top_unique,desc(unique))
View(top_unique_sorted)

#chain-------------------------------
result3 <-
      cran %>%
      group_by(package) %>%
      summarize(count = n(),
                unique = n_distinct(ip_id),
                countries = n_distinct(country),
                avg_bytes = mean(size)
      ) %>%
      filter(countries > 60) %>%
      arrange(desc(countries), avg_bytes)

View(result3)


cran %>%
      select(ip_id, country, package, size) %>%
      mutate(size_mb = size / 2^20) %>%
      filter(size_mb <= 0.5) %>%
      # Your call to arrange() goes here
      arrange(desc(size_mb))