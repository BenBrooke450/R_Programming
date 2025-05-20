
# 1. sample()

sample(x, size, replace = FALSE, prob = NULL)


sample(1:10, 5)
# Randomly picks 5 unique numbers from 1 to 10


sample(1:10, 5, replace = TRUE)
# Elements can repeat


sample(c("A", "B", "C"), 10, replace = TRUE, prob = c(0.7, 0.2, 0.1))
# Heavily biased towards "A"



#2. set.seed()

set.seed(123)
sample(1:10, 5)
# Same result every time you run it with this seed




#3. runif()

runif(5, min = 0, max = 1)
# 5 random numbers between 0 and 1






#4. rnorm()

rnorm(5, mean = 0, sd = 1)
# 5 normally-distributed numbers with mean 0 and sd 1







#5. sample.int()

sample.int(100, 10)
# Picks 10 unique integers from 1 to 100





#6. rbinom(), rexp(), rpois(), etc.
| Function   | Distribution |
| ---------- | ------------ |
| `rbinom()` | Binomial     |
| `rpois()`  | Poisson      |
| `rexp()`   | Exponential  |
| `rchisq()` | Chi-squared  |






#7. replace()


#Not a sampling function per se, but useful in conditional replacement, sometimes paired with sampling.
x <- 1:5
replace(x, x == 3, sample(10:15, 1))
# Replace 3 with a random number from 10 to 15



