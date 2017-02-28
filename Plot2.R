#Plot 2

setwd("E:/R/Exploratory data analysis")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")

SubData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

dateTime <- strptime(paste(SubData$Date, SubData$Time, sep = ""),"%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(SubData$Global_active_power)
png("plot2.png", width = 480, height = 480)

plot(dateTime, GlobalActivePower,  type= "l", xlab = "", ylab= "Global Active Power (kilowatts")

dev.off()
