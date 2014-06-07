# Load data.table library
library(data.table)

# Loading data into workspace directory
data <- fread('household_power_consumption.txt', header=T, sep=';')

# Subset dates 2007-02-01 and 2007-02-02
feb <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

# Plot histogram
par(mfrow=c(1,1))
png(filename='plot1.png', width=480, height=480, bg='white')
hist(as.numeric(feb$Global_active_power), xlab='Global Active Power (kilowatts)', main='Global Active Power', col='red')

dev.off()   #Dont' forget to close!
