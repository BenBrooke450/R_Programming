
data <- data.frame(mtcars)
print(data)



#Exercise 1
#Use logical operators to output only those rows of  data  where column  mpg  is between 15 and 20 (excluding 15 and 20).

data[data$mpg >= 15 & data$mpg <= 20, ]




#Exercise 2
#Use logical operators to output only those rows of  data  where column  cyl  is equal to 6 and column  am  is not 0.

data[data$cyl == 6 & data$am == 0, ]




#Exercise 3
#Use logical operators to output only those rows of  data  where column  gear  or  carb  has the value 4.

data[data$gear== 4 | data$carb == 4, ]




#Exercise 4
#Use logical operators to output only the even rows of  data.

data$index <- 1:nrow(data)

data[data$index %% 2 == 0,]

#data[c(F,T),] -- or this, mean False, True




#Exercise 5
#Use logical operators and change every fourth element in column  mpg  to 0.

data$index <- 1:nrow(data)
print(data)

data[data$index %% 4 == 0,]

#data[c(F,F,F,T),] -- or this, meaning False, True




#Exercise 6
#Output only those rows of  data  where columns  vs  and  am  have the same value 1, solve this without using  ==  operator.

data[data$vs == 6 & data$am == 0, ]




#Exercise 8
#Output only those rows of  data  where at least  vs  or  am  have the value 1, solve this without using  ==  or  !=.





#Exercise 9
#Explain the difference between  | ,  || ,  &  and  &&.

x <- c(TRUE, FALSE, TRUE)
y <- c(FALSE, TRUE, TRUE)

x & y   # [1] FALSE FALSE TRUE  (element-wise)
x && y  # [1] FALSE              (only checks first: TRUE && FALSE)

x | y   # [1] TRUE TRUE TRUE
x || y  # [1] TRUE   





#Exercise 10
#Change all values that are 0 in the column  am  in  data  to 2.

x = ifelse(data$am == 0, 2,data$am)
data$am <- x
print(data)




#Exercise 11
#Add 2 to every element in the column  vs  without using numbers.

data$vs <- sapply(data$vs, function(x) x + 2)













