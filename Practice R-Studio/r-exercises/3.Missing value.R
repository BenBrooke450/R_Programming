

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





#Exercise 8
#Let:
c1 <- c(1,2,3,NA)
c2 <- c(2,4,6,89)
c3 <- c(45,NA,66,101)
X <- rbind (c1,c2,c3, deparse.level=1) # write a code that will display all rows with missing values.

print(X)
#    [,1] [,2] [,3] [,4]
#c1    1    2    3   NA
#c2    2    4    6   89
#c3   45   NA   66  101


clean_data = X[complete.cases(X),]
clean_data
#[1]  2  4  6 89 ONLY ONE ROW LEFT


clean_data_two <- na.omit(X)
print(clean_data_two)
#    [,1] [,2] [,3] [,4]
#c2    2    4    6   89


clean_data_third = X[!is.na(X)]
clean_data_third
#[1]   1   2  45   2   4   3   6  66  89 101 INCORRECT










#Exercise 9
#Consider the following data obtained from 
df <- data.frame(Name = c(NA, "Joseph", "Martin", NA, "Andrea"), Sales = c(15, 18, 21, 56, 60),
                  Price = c(34, 52, 21, 44, 20), stringsAsFactors = FALSE)
#Write some R code that will return a data frame which removes all rows with NA values in Name column

print(df)
#    Name Sales Price
#1   <NA>    15    34
#2 Joseph    18    52
#3 Martin    21    21
#4   <NA>    56    44
#5 Andrea    60    20


clean_data_four <- df[!is.na(df$Name), ]
clean_data_four
#   Name   Sales  Price
#2 Joseph    18    52
#3 Martin    21    21
#5 Andrea    60    20







#Exercise 10
#Consider the following data obtained from 
df <- data.frame(Name = c(NA, "Joseph", "Martin", NA, "Andrea"), 
                 Sales = c(15, 18, 21, NA, 60), Price = c(34, 52, 33, 44, NA), stringsAsFactors = FALSE)
#Write some R code that will remove all rows with NA values and give the following output


clean_data_five <- df[!is.na(df$Name), ]
clean_data_five
#  Name    Sales Price
#2 Joseph    18    52
#3 Martin    21    33
#5 Andrea    60    NA



clean_data_six <- df[!is.na(df$Price), ]
clean_data_six
#   Name Sales Price
#1   <NA>    15    34
#2 Joseph    18    52
#3 Martin    21    33
#4   <NA>    NA    44


