#Week 4. Peer-graded Assignment: Course Project 2

#Plot 2
#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
#(fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

if(!exists("NEI")){
  NEI <- readRDS("data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("data/Source_Classification_Code.rds")
}

baltimore <- NEI[NEI$fips=="24510",]
data2 <- aggregate(Emissions ~ year, baltimore, sum)


png("plot2.png", width = 480, height = 480, units = "px")

barplot((data2$Emissions),
        names.arg = data1$year,
        main = "Total PM2.5 Emission in Baltimore 1999-2008",
        xlab = "Years", ylab = "PM2.5 Emissions"
)

dev.off()