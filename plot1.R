## Read  Individual household electric power consumption Data Set
df <- "household_power_consumption.txt"
## read the text file in to table format
## first line is header
## separator is ";" and the string should not be read as the factor and decimal is "."
data <- read.table(df, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##examine how household energy usage varies over a 2-day period in February, 2007
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
##Get the global active power
globalActivePower <- as.numeric(subSetData$Global_active_power)
## set the png device of the width 480 and height 480 and the file name is plot1.png
png("plot1.png", width=480, height=480)
## plot the historgram using the global active power data
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
## close the plot
dev.off()