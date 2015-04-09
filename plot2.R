## Script to plot2 - plot 2 - Graph of household global minute-averaged active power (in kilowatt) 
## against Time

## Check for local data file
if (!file.exists("./data/household_power_consumption.txt")){
  print("Please download data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
}

## load data from local file
power_data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", 
                         as.is = TRUE, na.strings = "?")

## Extract data from the dates 2007-02-01 and 2007-02-02
power_data1 <- power_data[power_data$Date %in% c("1/2/2007", "2/2/2007"), ]

## merge date and time variables into one variable
power_data1$Date_Time <- as.POSIXct(paste(as.Date(power_data1$Date, "%d/%m/%Y"), power_data1$Time))

## plot 2 - Graph of Global Active Power against Time
png(file = "plot2.png")

with(power_data1, plot(Date_Time, Global_active_power, type = "l", 
                       ylab ="Global Active Power (kilowatts)", xlab = ""))

dev.off()