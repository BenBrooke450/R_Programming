

library(datasets)  # optional, iris is usually preloaded
data(iris)         # loads the dataset
df <- iris
print(df)

virginica <- df[df$Species == "virginica",]
print(mean(virginica$Petal.Length))
#[1] 5.552

apply(iris[,1:4],2,mean)
#Sepal.Length  Sepal.Width Petal.Length  Petal.Width
#    5.843333     3.057333     3.758000     1.199333


data(mtcars)
df <- mtcars
print(df)

cylinder_4 <- df[df$cyl == 4,]
mean_hp_4 <- mean(cylinder_4$hp)

cylinder_8 <- df[df$cyl == 8,]
mean_hp_8 <- mean(cylinder_8$hp)

print(mean_hp_4 - mean_hp_8)