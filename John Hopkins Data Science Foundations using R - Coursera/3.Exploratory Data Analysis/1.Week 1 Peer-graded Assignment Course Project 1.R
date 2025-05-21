

# Read data
data <- read.table("/Users/benjaminbrooke/Desktop/Data/household_power_consumption.txt", header = TRUE, sep = ";",
                   stringsAsFactors = FALSE, na.strings = "?")

# Convert Date column to Date type
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset for Feb 1 and 2, 2007
subset_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Combine Date and Time into DateTime
subset_data$DateTime <- strptime(paste(subset_data$Date, subset_data$Time),
                                 format = "%Y-%m-%d %H:%M:%S")


png("plot1.png", width = 480, height = 480)
hist(subset_data$Global_active_power, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()



png("plot2.png", width = 480, height = 480)
plot(subset_data$DateTime, subset_data$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()





