
x <- c("a","b","c","d")

x[1]
#[1] "a"

x[1:3]
#[1] "a" "b" "c"

x[x > "b"]
#[1] "c" "d"


u <- x > "b"
u
#[1] FALSE FALSE  TRUE  TRUE


y <- matrix(1:6,2,3)
y
#     [,1] [,2] [,3]
#[1,]    1    3    5
#[2,]    2    4    6


y[,2]
#[1] 3 4


y[0:1,]
#[1] 1 3 5


y[,2:3]
#     [,1] [,2]
#[1,]    3    5
#[2,]    4    6




x <- c(1,2,3,4,NA,5,NA)
good <- is.na(x)
good
#[1] FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE

x[!good]
#[1] 1 2 3 4 5










