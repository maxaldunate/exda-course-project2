#Week 4. Peer-graded Assignment: Course Project 2

#Plot 5
#How have emissions from motor vehicle sources changed from 1999-2008 
#in Baltimore City?

require(ggplot2)

if(!exists("NEI")){
  NEI <- readRDS("data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("data/Source_Classification_Code.rds")
}
if(!exists("NEISCC")){
  NEImergeSCC <- merge(NEI, SCC, by="SCC")
}

onRoad <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
data5 <- aggregate(Emissions ~ year, onRoad, sum)

png("plot5.png", width = 480, height = 480, units = "px")

g <- ggplot(data5, aes(factor(year), Emissions))
g <- g +
  geom_bar(stat="identity") +
  xlab("Years") +
  ylab(expression("PM2.5 Emissions")) +
  ggtitle("Total PM2.5 Emission in Baltimore 1999-2008 from motor vehicle")

print(g)


dev.off()