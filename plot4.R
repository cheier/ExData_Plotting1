## plot4(del = FALSE)
##      plot4() is designed to plot 4 different plots based on data 
##      sourced from the UC Irvine Machine Learning Repository. The
##      data sets include:
##
##              - Global active power time series
##              - Voltage time series
##              - Energy sub metering time series using multiple 
##                household metering locations (like kitchen, living
##                room, etc.)
##              - Global reactive power time series
##
##      Arguments
##              del     Logic, default = FALSE. Set to TRUE to delete
##                      source data. See load.proj1.R for more details.
##

plot4 <- function(del = FALSE) {
        
        ## Source and call load function from external script.
        
        source("load.proj1.R")
        DT <- load.proj1(del)
        
        #################################################
        ## Generate multiple plots and save it to file ##
        #################################################
        
        message("Opening PNG output...")
        png("plot4.png", 
            width = 480,
            height = 480,
            bg = "transparent",
            antialias = "default")
        
        ## For better readability, all data and time data will be
        ## loaded into the datetime matrix
        
        datetime <- strptime(paste(DT$Date, DT$Time), 
                             format = "%d/%m/%Y %H:%M:%S")
        
        message("Generating plot...")
        
        ## Initialize a 2 x 2, 4 graphic plot
        par(mfrow = c(2, 2))
        
        ## Open up DT for simplified access by all plot function
        with(DT, {
                
                ## Global Active Power time series plot
                plot(datetime,
                      Global_active_power,
                      type="l",
                      main = "",
                      xlab = "",
                      ylab = "Global Active Power")
                
                ## Voltage time series plot
                plot(datetime,
                      Voltage,
                      type="l",
                      main = "")
                
                ## Initial plot for sub metering data
                plot(datetime,
                      Sub_metering_1,
                      type = "l",
                      main = "",
                      xlab = "",
                      ylab = "Energy sub metering")
        
                ## Sub metering 2 data onto existing plot
                points(datetime,
                        Sub_metering_2,
                        type = "l",
                        col = "red")
        
                ## Adding Sub metering 3 data onto existing plot
                points(datetime,
                        Sub_metering_3,
                        type = "l",
                        col = "blue")
        
                ## Writing legend on upper right corner of 
                ## sub metering plot
                legend("topright",
                       bty = "n",
                       lty = c(1, 1, 1),
                       col = c("black", 
                               "red", 
                               "blue"),
                       legend = c("Sub_metering_1",
                                  "Sub_metering_2",
                                  "Sub_metering_3"),
                       cex = 0.9)
        
                ## Global reactive power time series plot
                plot(datetime,
                     Global_reactive_power,
                     type="l",
                     main = "")
                
                ## Finished creating plots, closing with({})
        })
        
        dev.off()
        message("Plot saved to plot4.png.")
        
}