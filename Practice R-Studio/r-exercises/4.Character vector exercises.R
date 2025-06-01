

#Exercise 1
#If x <- “Good Morning! “, find out the number of characters
x <- "Good Morning!"

length(x)
#[1] 1

nchar(x)
#13





#Exercise 2
#Consider the character vector x <- c (“Nature’s”, “Best “), how many characters are there in x?

x <- c ("Nature’s", "Best ")
nchar(x)
#[1] 8 5

sum(nchar(x))
#[1] 13





#Exercise 3
#If x <- c("Nature’s"," At its best ") , how many characters are there in x?

x <- c("Nature’s"," At its best ")

nchar(x)
#[1] 8 13





#Exercise 4
#If fname <- “James“ and lname <- “Bond”, write some R code that will produce the output "James Bond".

fname <- "James"
lname <- "Bond"

paste(fname," ",lname)





#Exercise 5
#If m <- “Capital of America is Washington” then extract the string “Capital of America” from the character vector m.

m <- "Capital of America is Washington"

a = strsplit(m," is")
a[[1]][1]





#Exercise 6
#Write some R code to replace the first occurrence of the word “failed” with “failure” in the string “Success is not final, failed is not fatal”.

x <- "Success is not final, failed is not fatal"

sub("failed","failure",x)
#[1] "Success is not final, failure is not fatal"




#Exercise 7
#Consider two character vectors:
Names <- c("John", "Andrew", "Thomas")
Designation <- c("Manager", "Project Head", "Marketing Head")
#Write some R code to obtain the following output.
#Names Designation
#1 John Manager
#2 Andrew Project Head
#3 Thomas Marketing Head


mapply(paste, Names, Designation)
#John                  Andrew                  Thomas 
#"John Manager"   "Andrew Project Head" "Thomas Marketing Head"


data.frame(Names, Designation)
#  Names    Designation
#1   John        Manager
#2 Andrew   Project Head
#3 Thomas Marketing Head









