# Importing Data from txt and changing class of Date and Time columns
data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")

# Creating a datetime column as POSIXct class
data$datetime <- paste(data$Date,data$Time, sep = " ")
data$datetime <- as.POSIXct(data$datetime, format = "%d/%m/%Y %H:%M:%S")

# Subsetting to include only relevant dates
Date1 <- as.POSIXct("2007-02-01 00:00:00")
Date2 <- as.POSIXct("2007-02-03 00:00:00")
data <- subset(data, datetime >= Date1 & datetime < Date2)


# CREATING PLOT 1

png(filename = "plot1.png",width = 480, height = 480)
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off() 
