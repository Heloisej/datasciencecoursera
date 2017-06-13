library(data.table)
# Section1-Introduction ---------------------------------------------------
#General form
mtcarsDT[
    mpg > 20, #i
    .(AvgHp=mean(hp)), #i
    "MnWT(kg)" = min(wt*453.6), #wt lbs #j
    by=.(cyl,under5gears = gear<5) #by
     
]
#R: i, j, by
#SQL: where, select, group by
#DT[i,j,by]
#Take DT, subset rows using i, then calculate j grouped by by"

DT <- data.table(A=1:6,B=c("a","b","c"),C=rnorm(6),D=TRUE)
DT
#typeof(1) == "double"
#typeof(1L) == "integer"
#typeof (NA) == "logical"
#typeof (NA_interger_) =="integer"

#selecting rows
DT[3:5,]
DT[3:5]

class(DT) #data.table is a data.frame


# Create and subset a data.table
# Create my_first_data_table
my_first_data_table <- data.table(x = c("a", "b", "c", "d", "e"), y = c(1, 2, 3, 4, 5))

# Create a data.table using recycling
DT <- data.table(a = c(1L, 2L), b = LETTERS[1:4])

# Print the third row to the console
DT[3,]

# Print the second and third row to the console without using commas
DT[2:3]


# Getting to know a data.table
# Print the second to last row of DT using .N
DT[.N-1]

# Print the column names of DT
names(DT)

# Print the number or rows and columns of DT
dim(DT)

# Print a new data.table containing rows 2, 2, and 3 of DT
DT[c(2,2,3),]


# Section2-selecting columns in j -----------------------------------------
DT[,.(B,C)] #.()is an alias to list()
DT[,.(Total=sum(A),Mean=mean(C))] 
#recycling in j
DT[,.(B,C=sum(C))]
#throw anything into j
DT[,plot(A,C)]
DT[,{print(A)
      hist(C)
      NULL}]

#1. A data.table or a vector?
DT[,.(B)] #data.table
DT[,B] #vector

#2. A non-existing column
D <- 5
#suppose D does not exist in DT
DT[,.(D)]
DT[,D]

#3. Subsetting data.tables
# Subset rows 1 and 3, and columns B and C
DT[c(1,3),.(B,C)]

# Assign to ans the correct value
ans <- DT[,.(B,val=A*C)]

# Fill in the blanks such that ans2 equals target
target <- data.table(B = c("a", "b", "c", "d", "e", 
                           "a", "b", "c", "d", "e"), 
                     val = as.integer(c(6:10, 1:5)))
ans2 <- DT[, .(B, val = as.integer(c(6:10, 1:5)))]


# Section3-Doing j by group -----------------------------------------------
DT <- data.table(A=letters[3:1],B=c(1:6))
DT[,.(Mysum=sum(B),Mymean=mean(B)),by=.(A)]

#functions calls in by
DT <- data.table(A=1:5,B=10:14)
DT[,.(MySum = sum(B)),by=.(Grp = A%%2)] #%%余数
DT[,sum(B),by=A%%2]
DT[2:4,sum(B),by=A%%2]

#1. The by basics
# Convert iris to a data.table: DT
DT <- data.table(iris)

# For each Species, print the mean Sepal.Length
DT[,mean(Sepal.Length),by=Species]

# Print mean Sepal.Length, grouping by first letter of Species
DT[,mean(Sepal.Length),by=substr(Species,1,1)]

#2. Using .N and by
# data.table version of iris: DT
DT <- as.data.table(iris)

# Group the specimens by Sepal area (to the nearest 10 cm2) and count how many occur in each group
DT[, .N, by = 10 * round(Sepal.Length * Sepal.Width / 10)]

# Now name the output columns `Area` and `Count`
DT[, .(Count=.N), by = .(Area=10 * round(Sepal.Length * Sepal.Width / 10))]

#3. Return multiple numbers in j
# Create the data.table DT
DT <- data.table(A = rep(letters[2:1], each = 4L), 
                 B = rep(1:4, each = 2L), 
                 C = sample(8))

# Create the new data.table, DT2
DT2 <- DT[,.(C=cumsum(C)),by=.(A,B)]

# Select from DT2 the last two values from C while you group by A
DT2[,.(C=tail(C,2)),by=A]
