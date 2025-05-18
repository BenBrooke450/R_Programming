
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






#install.packages("glue", repos = "https://cloud.r-project.org/")
library(glue)




###########################################################
##                 Basic 3
###########################################################



corr <- function(pollutant,threshold=0){
  df <- data.frame(Date = character(), sulfate = numeric(), nitrate = numeric(), ID = numeric())
  correlations <- numeric()

  for(i in 1:332) {
    if (i < 10) {
      df <- data.frame(read.csv(glue("/Users/benjaminbrooke/Desktop/Data/specdata/00{i}.csv")))}
    else if ((i > 9) & (i < 100)) {
      df <- data.frame(read.csv(glue("/Users/benjaminbrooke/Desktop/Data/specdata/0{i}.csv")))}
    else if ((i > 99) & (i < 1000)) {
      df <- data.frame(read.csv(glue("/Users/benjaminbrooke/Desktop/Data/specdata/{i}.csv")))}

    complete_cases <- df[complete.cases(df), ]
    if (nrow(complete_cases) > threshold) {
      corr_val <- cor(complete_cases$sulfate, complete_cases$nitrate)
      correlations <- c(correlations, corr_val)

      }}
  correlations
}


cr <- corr("specdata", 129)
cr <- sort(cr)
n <- length(cr)
RNGversion("3.5.1")
set.seed(197)
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)











complete <- function(pollutant,id= 1:332){
  correlations <- numeric()
  df <- data.frame(Date = character(), sulfate = numeric(), nitrate = numeric(), ID = numeric())
  for(i in id) {
    if (i < 10) {
      directory <- data.frame(read.csv(glue("/Users/benjaminbrooke/Desktop/Data/specdata/00{i}.csv")))
      df <- rbind(df,directory)}
    else if ((i > 9) & (i < 100)) {
      directory <- data.frame(read.csv(glue("/Users/benjaminbrooke/Desktop/Data/specdata/0{i}.csv")))
      df <- rbind(df,directory)}
    else if ((i > 99) & (i < 1000)) {
      directory <- data.frame(read.csv(glue("/Users/benjaminbrooke/Desktop/Data/specdata/{i}.csv")))
      df <- rbind(df,directory)}}

  for(i in id) {
    new <- df[df$ID == i,] #BEFORE new <- df[df$ID == i, ]
    new_without_na <- na.omit(new)
    cc <- c(correlations, c(nrow(new_without_na)))}

}


RNGversion("3.5.1")
set.seed(42)
cc <- complete(id = 332:1)
use <- sample(332, 10)
print(cc[use])








pollutantmean <- function(pollutant,id= 1:332) {
  df <- data.frame(Date = character(), sulfate = numeric(), nitrate = numeric(), ID = numeric())
  for(i in id) {
    if (i < 10) {
      directory <- data.frame(read.csv(glue("/Users/benjaminbrooke/Desktop/Data/specdata/00{i}.csv")))
      df <- rbind(df,directory)}
    else if ((i > 9) & (i < 100)) {
      directory <- data.frame(read.csv(glue("/Users/benjaminbrooke/Desktop/Data/specdata/0{i}.csv")))
      df <- rbind(df,directory)}
    else if ((i > 99) & (i < 1000)) {
      directory <- data.frame(read.csv(glue("/Users/benjaminbrooke/Desktop/Data/specdata/{i}.csv")))
      df <- rbind(df,directory)} }
  df <- na.omit(df)
  substance <- df[[pollutant]]
  return(mean(substance))
}

#pollutantmean("nitrate")

















pollutantmean <- function(pollutant,id= 1:332) {
  df <- data.frame(Date = character(), sulfate = numeric(), nitrate = numeric(), ID = numeric())
  for(i in id) {
    directory <- data.frame(read.csv(glue("/Users/benjaminbrooke/Desktop/Data/specdata/00{i}.csv")))
    df <- rbind(df,directory)}
  df <- na.omit(df)
  substance <- df[[pollutant]]
  return(mean(substance))
}

pollutantmean("sulfate",id = 1:9)
## >>>>>>>> /Data/specdata/0010.csv': No such file or directory  <<<<<<<<<<<<<<<<<


