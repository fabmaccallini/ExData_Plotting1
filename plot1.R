# Exploratory Data Analysis - Course Project 1
# Please download and extract the .txt file form 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
# into the R working directory before running the code.

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data.set <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
rm(data)
data.set$Global_active_power <- as.numeric(as.character(data.set$Global_active_power))
png(filename = "plot1.png")
hist(data.set$Global_active_power, col = "red", main = "Global Active Power", xlim = c(0, 6),
     xlab = expression("Global Active Power "("kilowatts")), ylab = "Frequency", axes = FALSE)
axis(2)
axis(1, seq(0, 6, 2))
dev.off()