## Script for the third plot of the first assignment for the Exploratory Data 
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

## Plot 3 

## Creates and sets the graphics device
png(file = "Plot3.png") 

## Creates empty plot without x axis thicks or label
with(newdata, plot(1:nrow(newdata), Sub_metering_1, type = "n", 
                   ylab = "Energy sub metering", xlab = "", xaxt = "n"))

## Creating the x axis labels
xaxisp <- c(0, 1470, 2880) # creates a vector of the positions of the axis thicks
xaxisn <- c("Thu", "Fri", "Sat")
axis(side = 1, at = xaxisp, labels = xaxisn)

## Creates the lines
with(newdata, lines(1:nrow(newdata), Sub_metering_1)) #Sub-metering_1
with(newdata, lines(1:nrow(newdata), Sub_metering_2, col = "red")) # Sub_metering_2
with(newdata, lines(1:nrow(newdata), Sub_metering_3, col = "blue")) # Sub_metering_3

## Creates the legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
## closes graphics devices
dev.off()
