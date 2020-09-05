# Checking whether the Electric Power Consumption dataset exists in working directory

if (!file.exists("exdata_data_household_power_consumption.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile="exdata_data_household_power_consumption.zip",
                method="curl")
  unzip("exdata_data_household_power_consumption.zip")  
}

# R Code for Plot 1

library(data.table)
data <- fread("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

data$Date <- as.Date(data$Date)
data$Time <- strptime(data$Time)
str(data)

#Creating Plot 1
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")
dev.off()
