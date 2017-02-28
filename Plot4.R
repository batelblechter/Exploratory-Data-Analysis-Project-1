#Plot 4

setwd("E:/R/Exploratory data analysis")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")

SubData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

dateTime <- strptime(paste(SubData$Date, SubData$Time, sep = ""),"%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(SubData$Global_active_power)
GlobalReactivePower <- as.numeric(SubData$Global_reactive_power)
voltage <- as.numeric(SubData$Voltage)

subMetering1 <- as.numeric(SubData$Sub_metering_1)
subMetering2 <- as.numeric(SubData$Sub_metering_2)
subMetering3 <- as.numeric(SubData$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(dateTime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex=0.2)
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dateTime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(dateTime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off() 