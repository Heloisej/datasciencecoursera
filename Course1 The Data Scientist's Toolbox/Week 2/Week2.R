a <- available.packages()
head(rownames(a),3)
install.packages('devtools')

source("http://bioconductor.org/biocLite.R")
biocLite(c("GeomicFeatures","AnnotationDbi"))

library(ggplot2)
search()
