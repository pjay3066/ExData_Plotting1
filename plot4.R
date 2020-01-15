#Reads the data
household_power_consumption <- read.csv("~/R/household_power_consumption.txt", sep=";", na.strings="?")

#Transforms the Date column to datetime format
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

#Subsets the observations that will be used
hpc <- subset(household_power_consumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Removes the complete dataset to clear some memory
rm(household_power_consumption)

#creating datetime column
dt <- paste(hpc$Date, hpc$Time)
hpc$dt <- as.POSIXct(dt)

#plot 4
par(mfrow = c(2,2), mar = c(4,4,2,2))
plot(hpc$dt, hpc$Global_active_power, type = "l", xlab="",ylab="Global Active Power")
plot(hpc$dt, hpc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(hpc$dt, hpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(hpc$dt, hpc$Sub_metering_2, col = "red")
lines(hpc$dt, hpc$Sub_metering_3, col = "blue")
legend(x = "topright", 
       lwd = 1, 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       cex = 0.7, 
       bty = "n")
plot(hpc$dt,hpc$Global_reactive_power, type = "l", xlab = "datetime", ylab="Globa_reactive_power")

#exporting plot4
dev.copy(png,"plot4.png")
dev.off()