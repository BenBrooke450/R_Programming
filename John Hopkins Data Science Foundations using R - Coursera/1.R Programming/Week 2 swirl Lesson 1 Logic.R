
#T is a shorthand for TRUE

#F is a shorthand for FALSE

#⚠️ It’s best to use TRUE and FALSE to avoid confusion. T and F can be overwritten accidentally.



x <- TRUE
y <- FALSE

x
#[1] TRUE

y
#[1] FALSE



# Equality
10 == 10     # TRUE
10 == 5      # FALSE

# Inequality
10 != 5      # TRUE
5 != 5       # FALSE

# Greater or less than
4 > 2        # TRUE
4 < 2        # FALSE

# Greater than or equal to
4 >= 4       # TRUE
# Less than or equal to
2 <= 1       # FALSE



# Element-wise AND
TRUE & TRUE     # TRUE
TRUE & FALSE    # FALSE

# Element-wise OR
TRUE | FALSE    # TRUE
FALSE | FALSE   # FALSE

# NOT
!TRUE           # FALSE
!FALSE          # TRUE