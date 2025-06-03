
#Exercise 1
#If x <- c("ww", "ee", "ff", "uu", "kk"), what will be the output for x[c(2,3)]?

x <- c("ww", "ee", "ff", "uu", "kk")

x[c(2,3)]
#[1] "ee" "ff"







#Exercise 2
#If x <- c("ss", "aa", "ff", "kk", "bb"), what will be the third value in the index vector operation x[c(2, 4, 4)]?

x <- c("ss", "aa", "ff", "kk", "bb")

x[c(2, 4, 4)]
#[1] "aa" "kk" "kk"







#Exercise 3
#If x <- c("pp", "aa", "gg", "kk", "bb"), what will be the fourth value in the index vector operation x[-2]?

x[-2]
#[1] "ss" "ff" "kk" "bb"







#Exercise 4
#Let a <- c(2, 4, 6, 8) and b <- c(TRUE, FALSE, TRUE, FALSE), what will be the output for the R expression max(a[b])?

a <- c(2, 4, 6, 8)
b <- c(TRUE, FALSE, TRUE, FALSE)

max(a[b])
#[1] 6

a[b]
#[1] 2 6







#Exercise 5
#Let a <- c (3, 4, 7, 8) and b <- c(TRUE, TRUE, FALSE, FALSE), what will be the output for the R expression sum(a[b])?


a <- c (3, 4, 7, 8)
b <- c(TRUE, TRUE, FALSE, FALSE)

sum(a[b])
#[1] 7

a[b]
#[1] 3 4











#Exercise 6
#Write an R expression that will return the sum value of 10 for the vector x <- c(2, 1, 4, 2, 1, NA)

x <- c(2, 1, 4, 2, 1, NA)

sum(x[-6])







#Exercise 7
#If x <- c(1, 3, 5, 7, NA) write an r expression that will return the output 1, 3, 5, 7.

x <- c(1, 3, 5, 7, NA)

x[!is.na(x)]
#[1] 1 3 5 7






