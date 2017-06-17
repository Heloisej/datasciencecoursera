library(swirl)
install_from_swirl("R Programming")
swirl()

#4. Vectors
num_vect <- c(0.5,55,-10,6)
tf <- num_vect<1
tf
num_vect>=6

my_char <- c("My","name","is")
my_char
paste(my_char,collapse = " ")
my_name <- c(my_char,"Jiayue")
my_name
paste(my_name,collapse = " ")

paste("Hello","world!",sep = " ")
paste(1:3,c("X","Y","Z"),sep = "")
paste(LETTERS,1:4,sep = "-")
