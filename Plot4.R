# Plot 4

## Data extraction

library(dplyr)
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data.f <- filter(data, Date == c("1/2/2007") | Date == c("2/2/2007"))
DTstring <- paste(data.f$Date, data.f$Time)
data.f$DateTime <- strptime(DTstring, "%d/%m/%Y %H:%M:%S" )

## Plot 4
par(mfrow=c(2,2))

# Global Active power plor lines (previous)
with(data.f, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))

# Voltage plot
with(data.f, plot(DateTime, Voltage, type="l", ylab="Voltage", xlab = "datetime"))

# Energy Sub metering (previous)
with(data.f, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(data.f, lines(DateTime, Sub_metering_2, col="red"))
with(data.f, lines(DateTime, Sub_metering_3, col="blue"))

# Global Reactive Power
with(data.f, plot(DateTime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab = "datetime"))

## Copy File from screen device
dev.copy(png, file="Plot4.png")
dev.off()





