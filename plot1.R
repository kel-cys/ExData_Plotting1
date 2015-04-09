## Script to plot1 - histogram of household global minute-averaged active power (in kilowatt)

## Check for local data file
if (!file.exists("./data/household_power_consumption.txt")){
  print("Please download data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
}

## load data from local file
power_data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", 
                         as.is = TRUE, na.strings = "?")

## Extract data from the dates 2007-02-01 and 2007-02-02
power_data1 <- power_data[power_data$Date %in% c("1/2/2007", "2/2/2007"), ]

## plot 1 - histogram of Global Active Power
png(file = "plot1.png")

with(power_data1, hist(Global_active_power, col = "red", xlab ="Global Active Power (kilowatts)",
                       main = "Global Active Power"))

dev.off()