#
# plot2.R
#
# This code will construct a line plot
# for DateTime (x-axis) and Global Average Power (kilowatts) (y-axis)



# Moved redundant code into utility file "processUtilData.R".
# That code will read in and process data
source("processUtilData.R")
powerData <- processUtilDataFile()

# configure png output
png(filename = "plot2.png",
    width = 480, height = 480, 
    units = "px", 
    bg = "white")

# plot the data
plot(powerData$DateTime, 
     powerData$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# turn device off
dev.off()

