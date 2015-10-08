par(mfcol = c(1,1))

data2 <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
str(data2)
summary(data2)

data31 <- data2[as.Date(data2$Date, "%d/%m/%Y")=="2007-02-01",]
data32 <- data2[as.Date(data2$Date, "%d/%m/%Y")=="2007-02-02",]

data3 <- rbind(data31,data32)

plot(strptime(paste(data3$Date,data3$Time), "%d/%m/%Y %H:%M:%S"), data3$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()