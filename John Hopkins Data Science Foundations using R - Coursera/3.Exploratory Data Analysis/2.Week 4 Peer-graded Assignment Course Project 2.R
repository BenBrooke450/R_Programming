
# Set the CRAN mirror to use (this one is in the UK, but you can use any)
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Now install the package
install.packages("dplyr")
install.packages("ggplot2")

library(dplyr)
library(ggplot2)


NEI <- readRDS("/Users/benjaminbrooke/Desktop/Data/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("/Users/benjaminbrooke/Desktop/Data/exdata_data_NEI_data/Source_Classification_Code.rds")


total_emissions <- NEI %>%
  group_by(year) %>%
  summarise(Total = sum(Emissions, na.rm = TRUE))





#Question 1: Total PM2.5 Emissions (US-wide)
png("plot1.png", width = 480, height = 480)
barplot(total_emissions$Total / 1e6, names.arg = total_emissions$year,
        col = "skyblue", main = "Total PM2.5 Emissions in the US",
        xlab = "Year", ylab = "Emissions (millions of tons)")
dev.off()
