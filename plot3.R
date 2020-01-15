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

#plot 3
plot(hpc$dt, hpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(hpc$dt, hpc$Sub_metering_2, col = "red")
lines(hpc$dt, hpc$Sub_metering_3, col = "blue")
legend(x = "topright", 
       lwd = 1, 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       cex = 0.8)

#exporting plot3
dev.copy(png,"plot3.png")
dev.off()