



list1 <- list(observationA = c(1:5, 7:3), observationB=matrix(1:6, nrow=2))
list1




#Exercise 1
#Using lapply(), find the length of list1‘s observations.

print(lapply(list1,length))
#$observationA
#[1] 10

#$observationB
#[1] 6







#Exercise 2
#Using lapply(), find the sums of list1‘s observations.

print(lapply(list1,sum))
#$observationA
#[1] 40

#$observationB
#[1] 21






#Exercise 3
#Use lapply() to find the quantiles of list1.








#Exercise 5
#Required function:
DerivativeFunction <- function(x) { log10(x) + 1 }
#Apply the “DerivativeFunction” to list1.

print(lapply(list1,DerivativeFunction))
# $observationA
# [1] 1.000000 1.301030 1.477121 1.602060 1.698970 1.845098 1.778151 1.698970
# [9] 1.602060 1.477121
# 
# $observationB
# [,1]     [,2]     [,3]
# [1,] 1.00000 1.477121 1.698970
# [2,] 1.30103 1.602060 1.778151







#Exercise 7
#Find the unique values in list1.

print(lapply(list1,unique))
$observationA
# [1] 1 2 3 4 5 7 6
# 
# $observationB
# [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6






#Exercise 9
#Print list1 with the lapply() function.

lapply(list1,print)
# [1] 1 2 3 4 5 7 6 5 4 3
# [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6
# $observationA
# [1] 1 2 3 4 5 7 6 5 4 3
# 
# $observationB
# [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6







