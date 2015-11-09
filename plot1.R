##Default working directory
electricData <- read.table("household_power_consumption.txt", sep = ";")
electricData$V1 <- as.Date(electricData$V1,"%d/%m/%Y")
date.data <- split(electricData,electricData$V1)
date.data <- rbind(date.data[["2007-02-01"]], date.data[["2007-02-02"]])

colnames(date.data) <- c("Date", "Time", "Global.Active.Power","Global.Reactive.Power", "Voltage", "Global.Intensity", "Sub.Metering.1", "Sub.Metering.2", "Sub.Metering.3")
date.data$Global.Active.Power<- as.numeric(as.character(date.data$Global.Active.Power))
hist(date.data$Global.Active.Power, xlab = "Global Active Power (KiloWatts)", col = "red")