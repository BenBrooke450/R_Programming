

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


png("plot3.png", width = 480, height = 480)
plot(subset_data$DateTime, subset_data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()




png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Top-left
plot(subset_data$DateTime, subset_data$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power")

# Top-right
plot(subset_data$DateTime, subset_data$Voltage,
     type = "l", xlab = "datetime", ylab = "Voltage")

# Bottom-left
plot(subset_data$DateTime, subset_data$Sub_metering_1,
     type = "l", xlab = "", ylab = "Energy sub metering")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

# Bottom-right
plot(subset_data$DateTime, subset_data$Global_reactive_power,
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()



