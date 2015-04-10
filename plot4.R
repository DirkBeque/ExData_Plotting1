## This R-script generates plot4.png for the first course project of 
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


# Create some convenience vectors 
nrdata    <- length(data$Time)     # The number of data points
indices   <- c(1:nrdata)           # The indices of the data points
thindices <- c(1,nrdata/2,nrdata)  # Thickmark location indices
thnames   <- c("Thu","Fri","Sat")  # Thickmark names


# Create the png file for 4 subplots
png(file   = "plot4.png",                           # Open png file for plotting
    width  = 480,                                   # Set width  of plot
    height = 480,                                   # Set height of plot
    bg     = "transparent")                         # Set transparent background color  
par(mfrow = c(2,2))                                 # 2x2 subplots


# Create the top left plot
plot(indices,                                       # The x data to plot
     data$Global_active_power,                      # The y data to plot
     xaxt   = "n",                                  # Suppress x axis here; to be added later
     type   = "l",                                  # Set plot type to line
     lty    = 1,                                    # Set linestyle to solid
     lwd    = 1,                                    # Set line thickness to 1
     xlab   = "",                                   # Empty x label 
     ylab   = "Global Active Power")                # Set y label
axis(1, at = thindices, label = thnames)            # Add custom x-axis


# Create the top right plot
plot(indices,                                       # The x data to plot
     data$Voltage,                                  # The y data to plot
     xaxt   = "n",                                  # Suppress x axis here; to be added later
     type   = "l",                                  # Set plot type to line
     lty    = 1,                                    # Set linestyle to solid
     lwd    = 1,                                    # Set line thickness to 1
     xlab   = "datetime",                           # Set x label 
     ylab   = "Voltage")                            # Set y label
axis(1, at = thindices, label = thnames)            # Add custom x-axis


# Create the bottom left plot
plot(indices,                                       # The x data to plot
     data$Sub_metering_1,                           # The first set of y data to plot
     xaxt   = "n",                                  # Suppress x axis here; to be added later
     type   = "l",                                  # Set plot type to line
     lty    = 1,                                    # Set linestyle to solid
     lwd    = 1,                                    # Set line thickness to 1
     col    = "black",                              # Set line color to black
     xlab   = "",                                   # Empty x label 
     ylab   = "Energy sub metering")                # Set y label
lines(indices,                                      # The x data to plot
      data$Sub_metering_2,                          # The second set of y data to plot
      lty    = 1,                                   # Set linestyle to solid
      lwd    = 1,                                   # Set line thickness to 1
      col    = "red")                               # Set line color to red
lines(indices,                                      # The x data to plot
      data$Sub_metering_3,                          # The third set of y data to plot
      lty    = 1,                                   # Set linestyle to solid
      lwd    = 1,                                   # Set line thickness to 1
      col    = "blue")                              # Set line color to blue
axis(1, at = thindices, label = thnames)            # Add custom x-axis
legend("topright",                                  # Add legend to the top right
       bty    = "n",                                # No border for the legend
       lty    = 1,                                  # The linetype of the legend
       col    = c("black","red","blue"),            # The colors of the legend
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"))                # The names  of the legend


# Create the bottom right plot
plot(indices,                                       # The x data to plot
     data$Global_reactive_power,                    # The y data to plot
     xaxt   = "n",                                  # Suppress x axis here; to be added later
     type   = "l",                                  # Set plot type to line
     lty    = 1,                                    # Set linestyle to solid
     lwd    = 1,                                    # Set line thickness to 1
     xlab   = "datetime",                           # Set x label 
     ylab   = "Global_reactive_power")              # Set y label 
axis(1, at = thindices, label = thnames)            # Add custom x-axis


# Close the png file
dev.off()                                           # Close png file
