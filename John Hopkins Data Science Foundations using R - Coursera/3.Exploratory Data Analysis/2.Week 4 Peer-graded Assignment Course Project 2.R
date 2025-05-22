
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




baltimore <- NEI %>% filter(fips == "24510")

baltimore_emissions <- baltimore %>%
  group_by(year) %>%
  summarise(Total = sum(Emissions, na.rm = TRUE))

png("plot2.png", width = 480, height = 480)
barplot(baltimore_emissions$Total, names.arg = baltimore_emissions$year,
        col = "tomato", main = "PM2.5 in Baltimore City",
        xlab = "Year", ylab = "Emissions (tons)")
dev.off()





png("plot3.png", width = 480, height = 480)
ggplot(baltimore, aes(x = factor(year), y = Emissions, fill = type)) +
  geom_bar(stat = "summary", fun = "sum", position = "dodge") +
  labs(title = "Baltimore PM2.5 Emissions by Type", x = "Year", y = "Emissions (tons)") +
  theme_minimal()
dev.off()




coal_scc <- grep("coal", SCC$EI.Sector, ignore.case = TRUE, value = FALSE)
coal_codes <- SCC[coal_scc, "SCC"]

coal_data <- NEI_coal <- filter(NEI, SCC %in% coal_codes)


coal_summary <- coal_data %>%
  group_by(year) %>%
  summarise(Total = sum(Emissions, na.rm = TRUE))

png("plot4.png", width = 480, height = 480)
ggplot(coal_summary, aes(x = factor(year), y = Total / 1e3)) +
  geom_bar(stat = "identity", fill = "gray40") +
  labs(title = "Coal Combustion-related PM2.5 Emissions (US)",
       x = "Year", y = "Emissions (thousands of tons)") +
  theme_light()
dev.off()








vehicle_scc <- grep("vehicle", SCC$EI.Sector, ignore.case = TRUE)
vehicle_codes <- SCC[vehicle_scc, "SCC"]

balt_vehicle <- NEI %>% filter(fips == "24510", SCC %in% vehicle_codes)

vehicle_summary <- balt_vehicle %>%
  group_by(year) %>%
  summarise(Total = sum(Emissions))

png("plot5.png", width = 480, height = 480)
ggplot(vehicle_summary, aes(x = factor(year), y = Total)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Motor Vehicle PM2.5 in Baltimore", x = "Year", y = "Emissions (tons)") +
  theme_minimal()
dev.off()









compare_cities <- NEI %>%
  filter(fips %in% c("24510", "06037"), SCC %in% vehicle_codes) %>%
  group_by(year, fips) %>%
  summarise(Total = sum(Emissions))

compare_cities$fips <- recode(compare_cities$fips,
                              "24510" = "Baltimore", "06037" = "Los Angeles")

png("plot6.png", width = 480, height = 480)
ggplot(compare_cities, aes(x = factor(year), y = Total, fill = fips)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Motor Vehicle Emissions: Baltimore vs. LA", x = "Year", y = "Emissions (tons)") +
  theme_minimal()
dev.off()
