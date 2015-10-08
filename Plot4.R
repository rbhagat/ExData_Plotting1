

data2 <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))


data31 <- data2[as.Date(data2$Date, "%d/%m/%Y")=="2007-02-01",]
data32 <- data2[as.Date(data2$Date, "%d/%m/%Y")=="2007-02-02",]

data3 <- rbind(data31,data32)

dt <- strptime(paste(data3$Date,data3$Time), "%d/%m/%Y %H:%M:%S")

#Plot 4
par(mfcol = c(2,2))
plot(dt, data3$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(dt, data3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
with(data3,lines(dt, data3$Sub_metering_2, col="red"))
with(data3,lines(dt, data3$Sub_metering_3, col="blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1),y.intersp = 0.9, bty = "n")
plot(dt, data3$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dt, data3$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()