# Course project 1

# Data extraction
library(dplyr)
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data.f <- filter(data, Date == c("1/2/2007") | Date == c("2/2/2007"))
DTstring <- paste(data.f$Date, data.f$Time)
data.f$DateTime <- strptime(DTstring, "%d/%m/%Y %H:%M:%S" )

## Plot 1

hist(data.f$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

## Copy File from screen device
dev.copy(png, file="Plot1.png")
dev.off()