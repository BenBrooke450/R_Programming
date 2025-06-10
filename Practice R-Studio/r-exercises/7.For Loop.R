
for (i in 1: 4)
  {
    print(i ^ 2)
  }
# [1] 1
# [1] 4
# [1] 9
# [1] 16






# R Program to demonstrate the use of
# next in for loop
for (i in c(3, 6, 23, 19, 0, 21))
  {
    if (i == 0)
    {
      next
    }
    print(i)
  }
# [1] 3
# [1] 6
# [1] 23
# [1] 19
# [1] 21


print('Outside Loop')

















