#install.packages("glue", repos = "https://cloud.r-project.org/")
library(glue)






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


