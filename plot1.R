## This R-script generates plot1.png for the first course project of 
## the "Exploratory Data Analysis" course from Johns Hopkins University.
## Author: Dirk Beque
## Notes: 
##  * This script generates a 480x480 image; the course example image is 504x504.
##  * This script generates a plot with a bit depth of 8; the course example image 
##    uses 32 bit depth (probably because of use of the "cairo" package). 


# Read in the data file and select the data from 1/2/2007 and 2/2/2007.
datafile <- "../DataSets/exdata-data-household_power_consumption/household_power_consumption.txt"
data     <- read.csv(datafile, sep=";", na.strings="?")
data     <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))


# Create the plot
png(file   = "plot1.png",                          # Open png file for plotting
    width  = 480,                                  # Set width  of plot
    height = 480,                                  # Set height of plot
    bg     = "transparent")                        # Set transparent background color  
hist(data$Global_active_power,                     # The data to histogram
     col    = "red",                               # Set plotting color
     xlab   = "Global Active Power (kilowatts)",   # Set x label
     main   = "Global Active Power")               # Set title           
dev.off()                                          # Close png file

