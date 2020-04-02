makePlot1 <- function() {
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
     
     ## Open PNG Graphics Device
     png("plot1.png")
     
     ## Generate plot
     hist(DOI$Global_active_power, col = "red", 
          xlab = "Global Activen Power (kilowatts)",
          ylab = "Frequency",
          main = "Global Active Power")
     
     dev.off()
     DOI
}