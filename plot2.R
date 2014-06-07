data <- read.table("household_power_consumption.txt", header = T, sep = ";")

feb <- subset(myData, myData$Date == "1/2/2007" | myData$Date == "2/2/2007")

png(filename="plot2.png")

feb$DateTime <- strptime(paste(feb$Date, feb$Time), "%d/%m/%Y %H:%M:%S")

plot(feb$DateTime,as.numeric(type.convert(as.character(feb$Global_active_power), dec = ".")), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()