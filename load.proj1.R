## load.proj1(del = FALSE)
##      This function is the data loader for  1 in the
##      Exploratory Data Analysis course. Project 1 reqires the same
##      data for all 4 plot functions. This function exists as
##      a separate script to keep the code clean for the plotting
##      scripts.
##
##      This function will only load date ranges 1/2/2007 to
##      2/2/2007.
##
##      Arguments
##              del     Logic, default = FALSE. When TRUE, all source
##                      data used to generate the plot will be deleted
##                      from hard disk, otherwise both the zip file and
##                      the text file contained within will not be
##                      deleted. The data is around 150 MB.
##
##      This function requires the package "sqldf" in order to function
##      properly. Ensure it is installed prior to running any plotting
##      functions.

load.proj1 <- function(del = FALSE) {
        
        ## Check if source data already exists in working directory
        
        if(!file.exists("household_power_consumption.txt")) {
                
                ## Download source data file from the web and saves temp zip
                
                download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                              "temp.zip")
                message("Unzipping temp.zip...")
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
        
        return(DT)
        
}