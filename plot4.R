makePlot4 <- function() {
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
     png("plot4.png")
     par(mfcol = c(2,2))
     
     ## Create plot in top left 
     ## Active Power vs. Time
     plot(nDOI$fullDT, nDOI$Global_active_power, type = "l",
          ylab = "Global Active Power",
          xlab = "")
     
     ## Create plot in bottom left 
     ## Sub metering vs. Time
     plot(nDOI$fullDT, nDOI$Sub_metering_1, type = "n",
          ylab = "Energy sub metering",
          xlab = "")
     lines(nDOI$fullDT, nDOI$Sub_metering_1, col = "black")
     lines(nDOI$fullDT, nDOI$Sub_metering_2, col = "red")
     lines(nDOI$fullDT, nDOI$Sub_metering_3, col = "blue")
     legend("topright", col = c("black", "red", "blue"), 
            lty = c(1,1,1), 
            bty = "n",
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

     ## Create plot in top right 
     ## Frequencye vs. Time
     ## 
     plot(nDOI$fullDT, nDOI$Voltage, type = "l",
          xlab = "",
          ylab = "Frequency")
     
     ## Create plot in bottom right 
     ## Global Reactive Power vs. Time
     plot(nDOI$fullDT, nDOI$Global_reactive_power, type = "l", 
          xlab = "datetime",
          ylab = "Global_reactive_power")
     
     dev.off()
     nDOI
     
}