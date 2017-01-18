#Week 4. Peer-graded Assignment: Course Project 2

#Plot 1
#Using the base plotting system, make a plot showing the total PM2.5 emission 
#from all sources for each of the years 1999, 2002, 2005, and 2008.

if(!exists("NEI")){
  NEI <- readRDS("data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("data/Source_Classification_Code.rds")
}

data1 <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png", width = 480, height = 480, units = "px")

barplot((data1$Emissions)/10^6,
        names.arg = data1$year,
        main="Total PM2.5 Emissions from all sources",
        xlab = "Years", ylab="PM2.5 Emissions"
)

dev.off()