electricData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
date.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(date.data$Date, date.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(date.data$Global_active_power)
globalReactivePower <- as.numeric(date.data$Global_reactive_power)
voltage <- as.numeric(date.data$Voltage)
subMetering1 <- as.numeric(date.data$Sub_metering_1)
subMetering2 <- as.numeric(date.data$Sub_metering_2)
subMetering3 <- as.numeric(date.data$Sub_metering_3)

par(mfrow = c(2,2))

plot(datetime, globalActivePower, type = "l", xlab = "", ylab ="Global Active Power")

plot(datetime, voltage, type="l", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, globalReactivePower, type = "l", ylab = "Global_reactive_power")