#Reads the data
household_power_consumption <- read.csv("~/R/household_power_consumption.txt", sep=";", na.strings="?")

#Transforms the Date column to datetime format
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

#Subsets the observations that will be used
hpc <- subset(household_power_consumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Removes the complete dataset to clear some memory
rm(household_power_consumption)

#plot1
hist(hpc$Global_active_power, xlab = "Global Active Power(kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")

#exporting plot1
dev.copy(png,"plot1.png")
dev.off()