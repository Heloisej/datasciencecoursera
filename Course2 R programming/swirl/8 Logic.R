#8: Logic

TRUE == TRUE
(FALSE == TRUE) == FALSE
6==7

6<7
10 <= 10

5 != 7
! 5==7

FALSE & FALSE
# && ONLY EVALUSTES THE FIRST MEMBER OF A VECTOR
TRUE & c(TRUE,FALSE,FALSE)
TRUE && c(TRUE,FALSE,FALSE)

TRUE | c(TRUE,FALSE,FALSE)
TRUE || c(TRUE,FALSE,FALSE)

#先算&&再算||
5 > 8 || 6 != 8 && 4 > 3.9

isTRUE(6>4)

identical('twins','twins')

#xor: exlusive OR (1个True, 1个False，输出True)
xor(5==6,!FALSE)

ints <- sample(10)
ints
ints > 5
which(ints>7)

any(ints<0)
all(ints>0)
