# Exploratory Data Analysis - Course Project 1
# Please download and extract the file form 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
# into the R working directory before running the code.

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data.set <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
rm(data)
for (i in 3: 9) data.set[, i] <- as.numeric(as.character(data.set[, i]))
temp <- paste(data.set$Date, data.set$Time)
data.set$Date <- strptime(temp, format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png")
with(data.set, {
    par(mfrow = c(2, 2))
    # 1
    plot(data.set$Date, data.set$Global_active_power, type = "l", xlab = "", ylab = expression("Global Active Power "("kilowatts")))
    # 2
    plot(data.set$Date, data.set$Voltage, type = "l", xlab = "datetime", ylab = colnames(data.set[5]))
    # 3
    plot(data.set$Date, data.set$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(data.set$Date, data.set$Sub_metering_2, col = "red")
    lines(data.set$Date, data.set$Sub_metering_3, col = "blue")
    legend("topright", colnames(data.set)[7: 9], lty = c(1, 1), col=c("black", "red", "blue"), bty = "n")
    # 4
    plot(data.set$Date, data.set$Global_reactive_power, type = "l", xlab = "datetime", ylab = colnames(data.set[4]))
})
dev.off()
