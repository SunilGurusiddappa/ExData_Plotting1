## read PM2.5 Emissions Data 
NEI <- readRDS("summarySCC_PM25.rds")
##read Source Classification Code Table
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

subset24510  <- NEI[NEI$fips=="24510", ]

ATBY <- aggregate(Emissions ~ year, subset24510, sum)

png('plot2.png')
barplot(height=ATBY$Emissions, names.arg=ATBY$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()