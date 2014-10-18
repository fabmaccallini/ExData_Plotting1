# Exploratory Data Analysis - Course Project 1
# Please download and extract the file form 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
# into the R working directory before running the code.

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data.set <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
rm(data)
data.set$Global_active_power <- as.numeric(as.character(data.set$Sub_metering_1))
temp <- paste(data.set$Date, data.set$Time)
data.set$Date <- strptime(temp, format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png")
with(data.set, {
    plot(data.set$Date, data.set$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(data.set$Date, data.set$Sub_metering_2, col = "red")
    lines(data.set$Date, data.set$Sub_metering_3, col = "blue")
    legend("topright", colnames(data.set)[7: 9], lty = c(1, 1), col=c("black", "red", "blue"))
})
dev.off()
