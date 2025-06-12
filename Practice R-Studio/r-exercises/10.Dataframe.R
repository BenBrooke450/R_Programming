
#1. Write a R program to create an empty data frame.

x = c(1,2,3,4)
y = c(5,6,7,8)

rbind(x,y)
#     [,1] [,2] [,3] [,4]
# x    1    2    3    4
# y    5    6    7    8





#3. Write a R program to get the structure of a given data frame.

t = rbind(x,y)
dim(t)
#[1] 2 4


# Create a data frame named 'exam_data' with four columns: 'name', 'score', 'attempts', and 'qualify'
exam_data = data.frame(
  # Define the 'name' column with a character vector of names
  name = c('Anastasia', 'Dima', 'Katherine', 'James', 'Emily', 'Michael', 'Matthew', 'Laura', 'Kevin', 'Jonas'),
  
  # Define the 'score' column with a numeric vector of scores
  score = c(12.5, 9, 16.5, 12, 9, 20, 14.5, 13.5, 8, 19),
  
  # Define the 'attempts' column with an integer vector of attempts
  attempts = c(1, 3, 2, 3, 2, 3, 1, 1, 2, 1),
  
  # Define the 'qualify' column with a character vector of qualification status
  qualify = c('yes', 'no', 'yes', 'no', 'no', 'yes', 'yes', 'no', 'no', 'yes')
)






#4. Write a R program to get the statistical summary and nature of the data of a given data frame.











