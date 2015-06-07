#
# plot3.R
#
# This code will construct a multi-line plot
# for DateTime (x-axis) and 
# Sub metering 1
# Sub metering 2
# and Sub metering 3 as the three (y-axis)



# Moved redundant code into utility file "processUtilData.R".
# That code will read in and process data
source("processUtilData.R")
powerData <- processUtilDataFile()
head(powerData)

# configure png output
png(filename = "plot3.png",
    width = 480, height = 480, 
    units = "px", 
    bg = "white")

# plot the data
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
       legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
       lty=c(1, 1, 1),
       col=c("black","blue","red"))


# turn device off
dev.off()
