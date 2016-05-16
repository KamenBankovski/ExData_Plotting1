## Script for the first plot of the first assignment for the Exploratory Data 
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

## Plot Number 1 
png(filename = "Plot1.png")
hist(newdata$Global_ac, col = "red1", xlab = "Global Active Power (killowats)", 
     main = "Global Active Power", breaks = 25)
dev.off()
