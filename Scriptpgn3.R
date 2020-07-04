png("3plot.png", width=480, height=480)

power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subset <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

subset$Date <- as.Date(subset$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subset$Date), subset$Time)
subset$datetime <- as.POSIXct(datetime)


with(subset, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()