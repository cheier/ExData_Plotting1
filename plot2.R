## plot2(del = FALSE)
##      plot2() is designed to plot a time series of the Global
##      Active Power (kilowatts) sourced from the UC Irvine Machine
##      Learning Repository.
##
##      Arguments
##              del     Logic, default = FALSE. Set to TRUE to delete
##                      source data. See load.proj1.R for more details.

plot2 <- function(del = FALSE) {
        
        ## Source and call load function from external script.
        
        source("load.proj1.R")
        DT <- load.proj1(del)
        
        ##############################################
        ## Generate time series and save it to file ##
        ##############################################
        
        message("Opening PNG output...")
        png("plot2.png", 
            width = 480,
            height = 480,
            bg = "transparent",
            antialias = "cleartype")
        
        message("Generating plot...")
        plot(strptime(paste(DT$Date, DT$Time),
                      format = "%d/%m/%Y %H:%M:%S"),
             DT$Global_active_power,
             type="l",
             main = "",
             xlab = "",
             ylab = "Global Active Power (kilowatts)")
        
        dev.off()
        message("Plot saved to plot2.png.")
        
}