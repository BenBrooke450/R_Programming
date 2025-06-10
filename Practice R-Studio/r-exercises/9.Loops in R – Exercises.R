


# Exercise 1
# Write a for loop that iterates over the numbers 1 to 7 and prints the cube of each number using print().

for (x in 1:7){print(x)}
# [1] 1
# [1] 2
# [1] 3
# [1] 4
# [1] 5
# [1] 6
# [1] 7








# Exercise 3
# Write a while loop that prints out standard random normal numbers (use rnorm()) but stops (breaks) if you get a number bigger than 1.

for (x in rnorm(15,sd=1.5)){print(x)
  {if (x > 1){break}
    }}
# [1] -0.437129
# [1] 1.734255






# Exercise 4
# Using next adapt the loop from last exercise so that doesn’t print negative numbers.

i = 0
for (x in rnorm(15,sd= 1.5)){
  {if (x > 1){next}}
  i = i + 1
  print(paste(x,i))
}

# [1] "0.0268694417382114 1"
# [1] "0.255875017545686 2"
# [1] "-1.0063410755583 3"
# [1] "-0.593456847294865 4"
# [1] "-1.1539014283519 5"
# [1] "-0.371691181866515 6"
# [1] "-0.743412311432087 7"
# [1] "-0.9877825754424 8"
# [1] "-0.224360613361286 9"
# [1] "0.936855078563263 10"
# [1] "-1.59914913845715 11"






i = 0
for (x in rnorm(5,sd= 1.5)){
  {if (x > 1)
    i = i + 1
  {print(i)}
  {next}}
}

# [1] 0
# [1] 0
# [1] 0
# [1] 0
# [1] 0





i = 0
for (x in rnorm(5, sd = 1.5)) {
  
  if (x > 1) {
    print(paste("Skipping x =", x))
    next
  }
  
  # If not skipped, increment i and print it
  i = i + 1
  print(paste("i =", i))
}

# [1] "i = 1"
# [1] "i = 2"
# [1] "Skipping x = 1.67928027309166"
# [1] "i = 3"
# [1] "i = 4"








#5. Matrix Snake Pattern
#Create a matrix filled with integers from 1 to N in a "snake" pattern like:

x = c(1:16)
matrix(x,nrow = 4, ncol = 4)
#        [,1] [,2] [,3] [,4]
# [1,]    1    5    9   13
# [2,]    2    6   10   14
# [3,]    3    7   11   15
# [4,]    4    8   12   16






#1. Prime Number Matrix
#Write an R program that creates a 10x10 matrix where
#  each element is the next prime number. Use a for loop to populate it row-wise.


# Function to check if a number is prime
is_prime <- function(n) {
  if (n < 2) return(FALSE)
  for (i in 2:sqrt(n)) {
    if (n %% i == 0) return(FALSE)
  }
  return(TRUE)
}

# Generate the first 100 prime numbers
prime_numbers <- c()
num <- 2
while (length(prime_numbers) < 100) {
  if (is_prime(num)) {
    prime_numbers <- c(prime_numbers, num)
  }
  num <- num + 1
}

# Create a 10x10 matrix and fill it row-wise
prime_matrix <- matrix(0, nrow = 10, ncol = 10)
index <- 1
for (i in 1:10) {
  for (j in 1:10) {
    prime_matrix[i, j] <- prime_numbers[index]
    index <- index + 1
  }
}

# Print the matrix
print(prime_matrix)









