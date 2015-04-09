## Script to plot3 - Graph of energy sub-metering No. 1/2/3 (in watt-hour of active energy) against time

## Check for local data file and object
if (!file.exists("./data/household_power_consumption.txt")){
  print("Please download data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
}

if (!exists("power_data")){
  power_data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", 
                           as.is = TRUE, na.strings = "?")
}

## Extract data from the dates 2007-02-01 and 2007-02-02
power_data1 <- power_data[power_data$Date %in% c("1/2/2007", "2/2/2007"), ]

## merge date and time variables into one variable
power_data1$Date_Time <- as.POSIXct(paste(as.Date(power_data1$Date, "%d/%m/%Y"), power_data1$Time))

## plot 3 - plot of energy sub metering against time
png(file = "plot3.png")

with(power_data1, {
  plot(Date_Time, Global_active_power, type = "n", ylim = c(0, max(Sub_metering_1)),
       ylab ="Energy sub metering", xlab = "")
  lines(Date_Time, Sub_metering_1, col = "black")
  lines(Date_Time, Sub_metering_2, col = "red")
  lines(Date_Time, Sub_metering_3, col = "blue")
})

legend("topright", legend = names(power_data1)[7:9], lwd = 1, pch = rep(NA,3), 
       col = c("black", "red", "blue"))

dev.off()