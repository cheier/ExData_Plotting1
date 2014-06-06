## plot1Data(del = TRUE)
##      plot1Data() is designed to plot a histogram of the Global
##      Active Power (kilowatts) sourced from the UC Irvine Machine
##      Learning Repository.
##
##      This function works only within the date ranges 1/2/2007 and
##      2/2/2007.
##
##      Arguments
##              del     Logic, default = FALSE. When TRUE, all source
##                      data used to generate the plot will be deleted
##                      from hard disk, otherwise both the zip file and
##                      the text file contained within will not be
##                      deleted. The data is around 150 MB. 

plot1Data <- function(del = FALSE) {
        
        ## Check if source data already exists in working directory
        if(!file.exists("household_power_consumption.txt")) {
                
                ## Download source data file from the web and saves temp zip
                download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                              "temp.zip")
                message("Unzipping to temp.zip...")
                unzip("temp.zip")    
                
        }
        
        ## Load only date ranges to be plotted from data
        message("Reading plot data into system memory...")
        DT <- read.csv.sql("household_power_consumption.txt", 
                           sep=";", 
                           header=TRUE, 
                           sql="SELECT * 
                                FROM file 
                                WHERE Date='1/2/2007'
                                OR Date='2/2/2007'")
        
        ## Cleans data from hard drive. No longer necessary once
        ## the data is loaded into memory.
        if(del == TRUE) {
                message("Removing souce data...")
                msg <- file.remove(c("temp.zip", 
                                     "household_power_consumption.txt"))
                remove(msg)
        }
        
        ## Generate histogram and save it to file
        message("Opening PNG output...")
        png("plot1.png", 
            width = 480,
            height = 480,
            antialias = "cleartype")
        
        message("Generating plot...")
        hist(as.numeric(DT$Global_active_power), 
             col = "red",
             main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)",
             ylab = "Frequency")
        
        ## Saving plot to a PNG file
        dev.off()
        message("Plot saved to plot1.png.")
        
}