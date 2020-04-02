makePlot2 <- function() {
     ## Function to plot Frequency vs. Global Active Power
     ## 
     
     ## Load relevant libraries
     library(plyr)
     library(data.table)
     library(lubridate)
     
     fileName <- "household_power_consumption.txt"
     fullData <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?")
     
     ## Subset to data of interest (DOI)
     ## 
     DOI <- subset(fullData, Date == "1/2/2007" | Date == "2/2/2007")
     
     ## Better convert Date & Time fields
     DOI$Date <- dmy(DOI$Date)
     DOI$Time <- hms(DOI$Time)
     
     ## print(str(DOI))
     
     nDOI <- mutate(DOI, fullDT = Date + Time)
     
     ## print(str(nDOI))
     
     ## Open PNG Graphics Device
     png("plot2.png")
     
     plot(nDOI$fullDT, nDOI$Global_active_power, type = "l",
          ylab = "Global Active Power (kilowatts)",
          xlab = "")
     
     dev.off()
     nDOI
     
}
     