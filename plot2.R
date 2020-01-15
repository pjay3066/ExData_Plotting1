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

#plot2
with(hpc, plot(dt,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

#exporting plot2
dev.copy(png,"plot2.png")
dev.off()