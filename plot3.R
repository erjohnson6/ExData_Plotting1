makePlot3 <- function() {
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
     png("plot3.png")
     
     plot(nDOI$fullDT, nDOI$Sub_metering_1, type = "n",
          ylab = "Energy sub metering",
          xlab = "")
     lines(nDOI$fullDT, nDOI$Sub_metering_1, col = "black")
     lines(nDOI$fullDT, nDOI$Sub_metering_2, col = "red")
     lines(nDOI$fullDT, nDOI$Sub_metering_3, col = "blue")
     legend("topright", col = c("black", "red", "blue"), 
            lty = c(1,1,1), 
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     
     dev.off()
     nDOI
     
}