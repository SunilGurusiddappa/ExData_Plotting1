## Read  Individual household electric power consumption Data Set
df <- "household_power_consumption.txt"
## read the text file in to table format
## first line is header
## separator is ";" and the string should not be read as the factor and decimal is "."
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##examine how household energy usage varies over a 2-day period in February, 2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
## Strip the time 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##Get the global active power
globalActivePower <- as.numeric(subSetData$Global_active_power)
##Get the global reactive power
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
## get the volatage
voltage <- as.numeric(subSetData$Voltage)
## sub meetering 1 information
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
## sub meetering 2 information
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
## sub meetering 3 information
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
## set the png device of the width 480 and height 480 and the file name is plot1.png
png("plot4.png", width=480, height=480)
## create 2 X 2 multi pannel 
par(mfrow = c(2, 2))
## plot the line prahp using the datetime
## type = 1 is the line type
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
## close the plot
dev.off()