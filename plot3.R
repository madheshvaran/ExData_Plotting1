# Checking whether the Electric Power Consumption dataset exists in working directory

if (!file.exists("exdata_data_household_power_consumption.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile="exdata_data_household_power_consumption.zip",
                method="curl")
  unzip("exdata_data_household_power_consumption.zip")  
}

# R Code for Plot 3

library(data.table)
data <- fread("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#Creating Date and Time togther a index for plotting
data$DateTime <- as.POSIXlt(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
str(data)

# Creating Plot 3
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(x = data$DateTime, y = data$Sub_metering_2, col = "red")
lines(x = data$DateTime, y = data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()
