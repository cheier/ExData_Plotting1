## plot1(del = FALSE)
##      plot1() is designed to plot a histogram of the Global
##      Active Power (kilowatts) sourced from the UC Irvine Machine
##      Learning Repository.
##
##      Arguments
##              del     Logic, default = FALSE. Set to TRUE to delete
##                      source data. See load.proj1.R for more details.

plot1 <- function(del = FALSE) {
        
        ## Source and call load function from external script.
        
        source("load.proj1.R")
        DT <- load.proj1(del)
        
        ############################################
        ## Generate histogram and save it to file ##
        ############################################
        
        message("Opening PNG output...")
        png("plot1.png", 
            width = 480,
            height = 480,
            bg = "transparent",
            antialias = "cleartype")
        
        message("Generating plot...")
        hist(DT$Global_active_power, 
             col = "red",
             main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)",
             ylab = "Frequency")
        
        dev.off()
        message("Plot saved to plot1.png.")
        
}