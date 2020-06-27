# Importing Data from txt and changing class of Date and Time columns
data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")

# Creating a datetime column as POSIXct class
data$datetime <- paste(data$Date,data$Time, sep = " ")
data$datetime <- as.POSIXct(data$datetime, format = "%d/%m/%Y %H:%M:%S")

# Subsetting to include only relevant dates
Date1 <- as.POSIXct("2007-02-01 00:00:00")
Date2 <- as.POSIXct("2007-02-03 00:00:00")
data <- subset(data, datetime >= Date1 & datetime < Date2)


# CREATING PLOT 4

png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

with(data, plot(datetime,Global_active_power, type="l", 
                frame = TRUE, col = "black", 
                ylab = "Global Active Power (kilowatts)",
                xlab = NA ))

with(data, plot(datetime,Voltage, type = "l",col = "black"))


with(data, {
    plot(datetime,Sub_metering_1, type="n", frame = TRUE, ylab = "Energy sub metering",xlab = NA)
    lines(datetime,Sub_metering_1, type="l", col = "black")
    lines(datetime,Sub_metering_2, type="l", col = "red")
    lines(datetime,Sub_metering_3, type="l", col = "blue")
    legend("topright", pch = "_", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})

with(data, plot(datetime,Global_reactive_power, type = "l"))
dev.off() 
