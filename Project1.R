df = read.table("/Users/skylarbrodnan/Downloads/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
df$Date = as.Date(df$Date, "%d/%m/%Y")
dfsub <- subset(df, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

DateTime = paste(dfsub$Date, dfsub$Time)
dfsub = cbind(DateTime, dfsub)
dfsub$DateTime = as.POSIXlt(DateTime)

#plot 1
hist(dfsub$Global_active_power, main="Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()

#plot 2
with(dfsub, plot(DateTime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = " ", pch = 20))
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()

with(dfsub, plot(Sub_metering))
