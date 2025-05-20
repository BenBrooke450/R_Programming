
#Key Concepts & Practice Commands

#1. Loading a dataset
#Most lessons use data() from base R:

library(datasets)
data(iris)


#2. View the structure of a dataset
str(iris)


#3. Look at first/last rows
head(iris)     # First 6 rows
tail(iris)     # Last 6 rows


#4. Number of rows and columns
nrow(iris)     # Total rows
ncol(iris)     # Total columns
dim(iris)      # Both (rows, columns)


#5. Column names and row names
names(iris)        # Column names
colnames(iris)     # Same as above
rownames(iris)     # Row names, usually row numbers


#6. Summary statistics
summary(iris)
