## Script for the second plot of the first assignment for the Exploratory Data 
## Analysis course

## Reads the data into R. Working directory must contain the unzipped .txt 
## file! 
data <- read.table(file = "household_power_consumption.txt", header = TRUE, 
                   sep = ";", quote = "", na.strings = c("?"), colClasses = 
                           c("character", "character", "numeric", "numeric", 
                             "numeric", "numeric", "numeric", "numeric", "numeric"))

## Subset data for the given dates 
newdata <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

## Merges time and date into single variable of posixct class
newdata <- within(newdata, {DatePos = format(as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"), "%d/%m/%Y %H:%M:%S") })

## Plot Number 2 
png(filename = "Plot2.png")
## Creates empty plot without x axis thicks or label
with(newdata, plot(1:nrow(newdata), Global_active_power, type = "n", 
                   ylab = " Global Active Power (killowats)", xlab = "", xaxt = "n"))

## Plots the data as a function of time (trick used is to plot against number of 
## rows, as it is simpler than to use the POSIXct date format)
lines(1:nrow(newdata), newdata$Global_active_power)

## Creating the x axis labels
xaxisp <- c(0, 1470, 2880) # creates a vector of the positions of the axis thicks
xaxisn <- c("Thu", "Fri", "Sat")
axis(side = 1, at = xaxisp, labels = xaxisn)
dev.off() # Closes the graphics device
