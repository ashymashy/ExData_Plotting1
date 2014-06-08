data <- read.table("household_power_consumption.txt", header = T, sep = ";")

feb <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

png(filename="plot4.png")

feb$DateTime <- strptime(paste(feb$Date, feb$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))

plot(feb$DateTime,as.numeric(type.convert(as.character(feb$Global_active_power), dec = ".")), type = "l", xlab = "", ylab = "Global Active Power")

plot(feb$DateTime,as.numeric(type.convert(as.character(feb$Voltage), dec = ".")), type = "l", xlab = "datetime", ylab = "Voltage")

plot(feb$DateTime,as.numeric(type.convert(as.character(feb$Sub_metering_1), dec = ".")), type = "l", xlab = "", ylab = "Energy sub metering", col = "black")

points(feb$DateTime,as.numeric(type.convert(as.character(feb$Sub_metering_2), dec = ".")), type = "l", xlab = "", ylab = "Energy sub metering", col = "red")

points(feb$DateTime,as.numeric(type.convert(as.character(feb$Sub_metering_3), dec = ".")), type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(feb$DateTime,as.numeric(type.convert(as.character(feb$Global_reactive_power), dec = ".")), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()