# Plot 3

## Data extraction

library(dplyr)
par(mfrow=c(1,1))
data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
data.f <- filter(data, Date == c("1/2/2007") | Date == c("2/2/2007"))
DTstring <- paste(data.f$Date, data.f$Time)
data.f$DateTime <- strptime(DTstring, "%d/%m/%Y %H:%M:%S" )

## Plot 3
with(data.f, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(data.f, lines(DateTime, Sub_metering_2, col="red"))
with(data.f, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", pch=15, col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


## Copy File from screen device
dev.copy(png, file="Plot3.png")
dev.off()