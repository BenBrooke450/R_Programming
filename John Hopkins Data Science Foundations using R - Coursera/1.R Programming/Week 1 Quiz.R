


data <- read.csv("/Users/benjaminbrooke/Desktop/Data/hw1_data.csv")

print(dim(data))
#[1] 153   6

print(data[150:153,])
#    Ozone Solar.R Wind Temp Month Day
#150    NA     145 13.2   77     9  27
#151    14     191 14.3   75     9  28
#152    18     131  8.0   76     9  29
#153    20     223 11.5   68     9  30


print(data[47,])
#   Ozone Solar.R Wind Temp Month Day
#47    21     191 14.9   77     6  16


print(length(data[,1][is.na(data[,1])]))
#37



ozone_without_null <- data[,1][!is.na(data[,1])]
print(ozone_without_null)
#  [1]  41  36  12  18  28  23  19   8   7  16  11  14  18  14  34   6  30  11
# [19]   1  11   4  32  23  45 115  37  29  71  39  23  21  37  20  12  13 135
# [37]  49  32  64  40  77  97  97  85  10  27   7  48  35  61  79  63  16  80
# [55] 108  20  52  82  50  64  59  39   9  16  78  35  66 122  89 110  44  28
# [73]  65  22  59  23  31  44  21   9  45 168  73  76 118  84  85  96  78  73
# [91]  91  47  32  20  23  21  24  44  21  28   9  13  46  18  13  24  16  13
#[109]  23  36   7  14  30  14  18  20

print(mean(ozone_without_null))
#42.12931


june_data <- data[data$Month == 6,]
print(mean(june_data[,4]))
#79.1

data <- na.omit(data) # removes any row with an Na


#new_data <- data[data$Ozone>31 & data$Temp>90] Need Comma
new_data <- data[data$Ozone > 31 & data$Temp > 90, ]
print(mean(new_data[,2]))
#[1] 212.8




may_data <- data[data$Month == 5,]
print(max(may_data[,1]))
#115




