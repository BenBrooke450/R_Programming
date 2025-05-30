

#Exercise 1
#If X <- c (22,3,7,NA,NA,67) what will be the output for the R statement length(X)

X <- c (22,3,7,NA,NA,67) 
length(X)




#Exercise 2
#If X = c(NA,3,14,NA,33,17,NA,41) write some R code that will remove all occurrences of NA in X.
#a. X[!is.na(X)]
#b. X[is.na(X)]
#c. X[X==NA]= 0

Y = c(NA,3,14,NA,33,17,NA,41)

Y[!is.na(Y)]
#3 14 33 17 41





#Exercise 3
#If Y = c(1,3,12,NA,33,7,NA,21) what R statement will replace all occurrences of NA with 11?
#a. Y[Y==NA]= 11
#b. Y[is.na(Y)]= 11
#c. Y[Y==11] = NA

Q = c(1,3,12,NA,33,7,NA,21)

Q[is.na(Q)]= 11

print(Q)
#[1]  1  3 12 11 33  7 11 21





#Exercise 4
#If X = c(34,33,65,37,89,NA,43,NA,11,NA,23,NA) then what will count the number of occurrences of NA in X?
#a. sum(X==NA)
#b. sum(X == NA, is.na(X))
#c. sum(is.na(X))

H = c(34,33,65,37,89,NA,43,NA,11,NA,23,NA)
is.na(H)
#[1] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE

sum(is.na(H))
#[1] 4






#Exercise 5
#Consider the following vector W <- c (11, 3, 5, NA, 6)
#Write some R code that will return TRUE for value of W missing in the vector.


W <- c (11, 3, 5, NA, 6)

W[is.na(W)] <- TRUE

print(W)
#[1] 11  3  5  1  6

#In R, logical values like TRUE and FALSE are internally stored as numbers:

#TRUE is equivalent to 1

#FALSE is equivalent to 0





#Exercise 7
#Consider the following vector A <- c (33, 21, 12, NA, 7, 8) .
#Write some R code that will calculate the mean of A without the missing value.

A <- c(33, 21, 12, NA, 7, 8)

mean(A)
#[1] NA

A = na.omit(A)
print(A)
#[1] 33 21 12  7  8
#attr(,"na.action")
#[1] 4
#attr(,"class")
#[1] "omit"




















