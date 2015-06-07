# plot4.R
#
# This code will construct a 2x2 matrix
# of four plots:
#
# upper left - duplicate of plot #2
#       line plot for DateTime (x-axis) 
#       and Global Average Power (kilowatts) (y-axis)
# upper right
#       line plot for DateTime (x-axis)
#       and Voltage (y-axis)
# lower left - duplicate of plot #3
#       multi-line plot for DateTime (x-axis) 
#       Sub metering 1
#       Sub metering 2
#       and Sub metering 3 as the three (y-axis)
# lower right
#       line plot for DateTime (x-axis)
#       and Global Reactive power (y-axis)



# Moved redundant code into utility file "processUtilData.R".
# That code will read in and process data
source("processUtilData.R")
powerData <- processUtilDataFile()

# configure png output
png(filename = "plot4.png",
    width = 480, height = 480, 
    units = "px", 
    bg = "white")

# set up the 2 x 2 grid
par(mfrow=c(2,2))

# upper left - plot #2 again
plot(powerData$DateTime, 
     powerData$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# upper right
plot(powerData$DateTime, 
     powerData$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# lower left - plot #3 again
plot(powerData$DateTime, 
     powerData$Sub_metering_1,
     col = "black",
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(powerData$DateTime, 
      powerData$Sub_metering_2,
      col = "red",)
lines(powerData$DateTime, 
      powerData$Sub_metering_3,
      col = "blue",)
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1, 1, 1),
       col=c("black","blue","red"))

# lower right
plot(powerData$DateTime, 
     powerData$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

# turn device off
dev.off()