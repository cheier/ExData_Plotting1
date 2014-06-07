## plot4(del = FALSE)
##      plot4() is designed to plot a time series of the Global
##      Active Power (kilowatts) sourced from the UC Irvine Machine
##      Learning Repository.
##
##      Arguments
##              del     Logic, default = FALSE. Set to TRUE to delete
##                      source data. See load.proj1.R for more details.

plot4 <- function(del = FALSE) {
        
        ## Source and call load function from external script.
        
        source("load.proj1.R")
        DT <- load.proj1(del)
        
        ##############################################
        ## Generate time series and save it to file ##
        ##############################################
        
        message("Opening PNG output...")
        png("plot4.png", 
            width = 480,
            height = 480,
            bg = "transparent",
            antialias = "cleartype")
        
        ## For better readability, all data and time data will be
        ## loaded into the timeSeries matrix
        
        timeSeries <- strptime(paste(DT$Date, DT$Time), 
                               format = "%d/%m/%Y %H:%M:%S")
        
        message("Generating plot...")
        
        par(mfrow = c(2, 2))
        
        plot(timeSeries,
             DT$Global_active_power,
             type="l",
             main = "",
             xlab = "",
             ylab = "Global Active Power")
        
        plot(timeSeries,
             DT$Voltage,
             type="l",
             main = "",
             xlab = "datetime",
             ylab = "Voltage")
        
        plot(timeSeries,
             DT$Sub_metering_1,
             type = "l",
             main = "",
             xlab = "",
             ylab = "Energy sub metering")
        
        ## Plotting Sub metering 2 data onto existing plot
        points(timeSeries,
               DT$Sub_metering_2,
               type = "l",
               col = "red")
        
        ## Plotting Sub metering 3 data onto existing plot
        points(timeSeries,
               DT$Sub_metering_3,
               type = "l",
               col = "blue")
        
        ## Writing legend on upper right corner of plot
        legend("topright",
               border = NULL,
               lty = c(1, 1, 1),
               col = c("black", 
                       "red", 
                       "blue"),
               legend = c("Sub_metering_1",
                          "Sub_metering_2",
                          "Sub_metering_3"))
        
        plot(timeSeries,
             DT$Global_reactive_power,
             type="l",
             main = "",
             xlab = "datetime",
             ylab = "Global_reactive_power")
        
        dev.off()
        message("Plot saved to plot4.png.")
        
}