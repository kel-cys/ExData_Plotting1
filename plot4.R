## Script to plot4 - 1) Graph of household global minute-averaged active power (in kilowatt) against Time
## 2) Graph of energy sub-metering No. 1/2/3 (in watt-hour of active energy) against Time
## 3) Graph of minute-averaged voltage (in volt) against Time
## 4) household global minute-averaged reactive power (in kilowatt) against Time


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

## Plot 4
png(file = "plot4.png")

par(mfcol = c(2,2), mar = c(4,4,2,2), cex.lab = 1.2)

with(power_data1, {
  plot(Date_Time, Global_active_power, ylab ="Global Active Power", xlab = "", type ="l")
  
{
    plot(Date_Time, Global_active_power, type = "n", ylim = c(0, max(Sub_metering_1)),
         ylab ="Energy sub metering", xlab = "")
    lines(Date_Time, Sub_metering_1, col = "black")
    lines(Date_Time, Sub_metering_2, col = "red")
    lines(Date_Time, Sub_metering_3, col = "blue")
    legend("topright", legend = ls(pattern = "^S"), lwd = 1, pch = rep(NA,3), bty = "n",
           col = c("black", "red", "blue"))
  }

plot(Date_Time, Voltage, xlab ="datetime", type ="l")

plot(Date_Time, Global_reactive_power, xlab ="datetime", type ="l")
})

dev.off()