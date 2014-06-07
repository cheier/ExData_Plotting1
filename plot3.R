## plot3(del = FALSE)
##      plot3() is designed to plot a time series of the Energy sub
##      metering representing 3 separate regions of the home in a
##      time series. Data is sourced from the UC Irvine Machine
##      Learning Repository.
##
##      Arguments
##              del     Logic, default = FALSE. Set to TRUE to delete
##                      source data. See load.proj1.R for more details.

plot3 <- function(del = FALSE) {
        
        ## Source and call load function from external script.
        
        source("load.proj1.R")
        DT <- load.proj1(del)
        
        ##############################################
        ## Generate time series and save it to file ##
        ##############################################
        
        message("Opening PNG output...")
        png("plot3.png", 
            width = 480,
            height = 480,
            bg = "transparent",
            antialias = "cleartype")
        
        ## For better readability, all data and time data will be
        ## loaded into the timeSeries vector
        
        timeSeries <- strptime(paste(DT$Date, DT$Time), 
                               format = "%d/%m/%Y %H:%M:%S")
        
        message("Generating plot...")
        
        ## Open up DT for simplified access by all plot function
        with(DT, {
                
                ## Creating plot and plotting Sub metering 1 data
                plot(timeSeries,
                     Sub_metering_1,
                     type = "l",
                     main = "",
                     xlab = "",
                     ylab = "Energy sub metering")
        
                ## Plotting Sub metering 2 data onto existing plot
                points(timeSeries,
                       Sub_metering_2,
                       type = "l",
                       col = "red")
        
                ## Plotting Sub metering 3 data onto existing plot
                points(timeSeries,
                       Sub_metering_3,
                       type = "l",
                       col = "blue")
        
                ## Writing legend on upper right corner of plot
                legend("topright",
                       lty = c(1, 1, 1),
                       col = c("black", 
                               "red", 
                               "blue"),
                       legend = c("Sub_metering_1",
                                  "Sub_metering_2",
                                  "Sub_metering_3"))
                
                ## Finished creating plot, closing with({})
        })
        
        dev.off()
        message("Plot saved to plot3.png.")
        
}