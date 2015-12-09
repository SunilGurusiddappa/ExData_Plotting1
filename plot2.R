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
## set the png device of the width 480 and height 480 and the file name is plot1.png
png("plot2.png", width=480, height=480)
## plot the line prahp using the global active power data and date
## type = 1 is the line type
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
## close the plot
dev.off()