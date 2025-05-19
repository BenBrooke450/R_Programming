

# Example 1: Using lapply() on a list
# Create a list of numeric vectors
my_list <- list(a = 1:5, b = 6:10, c = 11:15)

# Apply mean to each vector
lapply(my_list, mean)
#$a
#[1] 3

#$b
#[1] 8

#$c
#[1] 13







#Example 2: Using sapply() (simplifies output)

sapply(my_list, mean)
#a  b  c
#3  8 13

#Notice the output is now a named numeric vector, not a list.






#Practice Task

check_mean <- function(x) {
  mean(x) > 5
}

my_list <- list(x = 1:4, y = 5:10, z = 10:15)

sapply(my_list, check_mean)





