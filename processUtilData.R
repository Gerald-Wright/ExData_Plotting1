#
# processUtilData.R
#
# put the duplicate code in this file as it did 
# not amek sense to write it four times

processUtilDataFile <- function() {
    # check to see if data fle exists
    if (!file.exists("./data/household_power_consumption.txt")) {
        # no, so we have to go get it
        
        # verify the data directory exists
        # if not, create it
        if (!file.exists("./data")) {
            dir.create("./data")
        }

        # download the data file
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      "./data/household_power_consumption.zip")
        
        # extract the file
        unzip("./data/household_power_consumption.zip", exdir = "./data")
    }
    
    # we have a data file
    fileName <- "./data/household_power_consumption.txt"

    # build an SQL select to only get the two days we are interested in
    # NOTE: dates are in dd/mm/yyyy format
    selectSQL = "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
    
    # read only the selected data
    powerData <- read.csv.sql(fileName, sql = selectSQL, sep = ";")

    # convert date time to R Date/Time
    powerData$DateTime <- strptime(paste(powerData$Date, powerData$Time), format = "%d/%m/%Y %H:%M:%S")

    # return the processed dataset
    powerData
}