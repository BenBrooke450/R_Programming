
###########################################################
##               Basic 1
###########################################################



above_20 <- function(n) {
  x <- 1:n
  use <- x > 20
  x[use]

}


above_20(25)
#[1] 21 22 23 24 25



# Absolute value
abs(-10)            # Returns 10
#[1] 10

# Square root
sqrt(16)            # Returns 4
#[1] 4

# Rounding numbers
round(3.14159)      # Returns 3
#[1] 3

round(3.14159, 2)   # Returns 3.14
#[1] 3.14

# Get help on a function
?round              # Shows help documentation
args(round)         # Shows arguments the function takes




# Find square root of the absolute value of -25
sqrt(abs(-25))      # Returns 5




pi               # returns 3.141593

round(pi, 2)     # returns 3.14



###########################################################
##                 Basic 2
###########################################################



my_function <- function(arg1, arg2, ...) {
  # Code goes here
  return(result)
}





say_hello <- function() {
  print("Hello, world!")
}

say_hello()
# Output: "Hello, world!"








square <- function(x) {
  return(x^2)
}

square(4)
# Output: 16







#You can also omit return() (R returns the last evaluated expression):

square <- function(x) {
  x^2
}



#You can also use default values:

power <- function(base, exponent = 2) {
  base^exponent
}

power(3)       # 9 (uses default exponent)
power(3, 3)    # 27







grade <- function(score) {
  if (score >= 90) {
    return("A")
  } else if (score >= 80) {
    return("B")
  } else if (score >= 70) {
    return("C")
  } else {
    return("F")
  }
}

grade(85)  # Output: "B"








process_number <- function(x) {
  abs_val <- abs(x)
  sqrt_val <- sqrt(abs_val)
  return(round(sqrt_val, 2))
}

process_number(-50)
# Output: 7.07

