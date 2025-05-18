#BASIC SYNTAX of if, else if, else

if (condition1) {
  # code if condition1 is TRUE
} else if (condition2) {
  # code if condition2 is TRUE
} else {
  # code if none are TRUE
}


#Basic if statement

x <- 5
if (x > 3) {
  print("x is greater than 3")
}



#if with else

x <- 2
if (x > 3) {
  print("x is greater than 3")
} else {
  print("x is 3 or less")
}


#if, else if, and else

x <- 0
if (x > 0) {
  print("Positive")
} else if (x < 0) {
  print("Negative")
} else {
  print("Zero")
}


#Vectorized if: use ifelse()

#Basic if only works with single values. For vectors, use ifelse():


x <- c(5, -2, 0)
ifelse(x > 0, "Positive", "Non-Positive")
#"Positive" "Non-Positive" "Non-Positive"




################ EX - Temperature warning system________


check_temperature <- function(temp) {
  if (temp > 40) {
    return("🔥 Extreme heat warning!")
  } else if (temp > 30) {
    return("☀️ Hot")
  } else if (temp > 15) {
    return("🌤️ Pleasant")
  } else {
    return("❄️ Cold")
  }
}
check_temperature(35)  # "☀️ Hot"








#The standard if, else if, and else in R do not loop and are not vectorized — they only operate on one element at a time (i.e., a single logical condition).


#Example that only evaluates the first element:

x <- c(10, 20, 30)
if (x > 15) {
  print("Greater than 15")
} else {
  print("Not greater than 15")
}

#Warning: You’ll get this message:
	"the condition has length > 1 and only the first element will be used"

#✅ So this only checks x[1] == 10 > 15 → FALSE, and returns "Not greater than 15"




#To work over each element, use:

#ifelse() (vectorized):

x <- c(10, 20, 30)
ifelse(x > 15, "Big", "Small")
# [1] "Small" "Big" "Big"



#Or use a for loop:

x <- c(10, 20, 30)
for (val in x) {
  if (val > 15) {
    print("Big")
  } else {
    print("Small")
  }
}
