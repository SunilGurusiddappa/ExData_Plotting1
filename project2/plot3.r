## read PM2.5 Emissions Data 
NEI <- readRDS("summarySCC_PM25.rds")
##read Source Classification Code Table
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# 24510 is Baltimore, see plot2.R
subset24510  <- NEI[NEI$fips=="24510", ]

ABYT <- aggregate(Emissions ~ year + type, subset24510, sum)



png("plot3.png", width=640, height=480)
g <- ggplot(ABYT, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()