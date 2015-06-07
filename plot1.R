#
# plot1.R
#
# This code will construct a histogram
# for Global Average Power (kilowatts)

# Moved redundant code into utility file "processUtilData.R".
# That code will read in and process data

source("processUtilData.R")
powerData <- processUtilDataFile()
head(powerData)

# configure png output
png(filename = "plot1.png",
    width = 480, height = 480, 
    units = "px", 
    bg = "white")

# plot the data
hist(powerData$Global_active_power, 
    main="Global Active Power",
    xlab="Global Active Power (kilowatts)",
    col="red")

# turn device off
dev.off()
