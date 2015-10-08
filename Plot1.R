par(mfcol = c(1,1))

data2 <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
str(data2)
head(data2)

data31 <- data2[as.Date(data2$Date, "%d/%m/%Y")=="2007-02-01",]
data32 <- data2[as.Date(data2$Date, "%d/%m/%Y")=="2007-02-02",]

data2$Date <- as.Date(data2$Date,"%d/%m/%Y")

data3 <- rbind(data31,data32)

hist(data3$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

dev.copy(png, file = "plot1.png")
dev.off()