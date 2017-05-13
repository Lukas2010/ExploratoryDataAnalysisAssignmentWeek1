# Plot 2

## Data extraction

library(dplyr)
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data.f <- filter(data, Date == c("1/2/2007") | Date == c("2/2/2007"))
DTstring <- paste(data.f$Date, data.f$Time)
data.f$DateTime <- strptime(DTstring, "%d/%m/%Y %H:%M:%S" )

## Plot 2

with(data.f, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))

## Copy File from screen device
dev.copy(png, file="Plot2.png")
dev.off()