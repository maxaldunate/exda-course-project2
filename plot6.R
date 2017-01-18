#Week 4. Peer-graded Assignment: Course Project 2

#Plot 6
#Compare emissions from motor vehicle sources in Baltimore City 
#with emissions from motor vehicle sources in Los Angeles County, 
#California (fips == "06037").
#Which city has seen greater changes over time in motor vehicle emissions?

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

norm <- function(x) {(x-min(x)) / (max(x)-min(x))}

baltimore <- NEI[(NEI$fips=="24510") & (NEI$type == "ON-ROAD"),]
baltimoreData6 <- aggregate(Emissions ~ year, data = baltimore, FUN = sum)

losAngeles  <- NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]
losAngelesData6 <- aggregate(Emissions ~ year, data = losAngeles, FUN = sum)

baltimoreData6$County <- "Baltimore City"
losAngelesData6$County <- "Los Angeles County, CA"

data6 <- rbind(baltimoreData6, losAngelesData6)


png("plot6.png", width = 480, height = 480, units = "px")

g <- ggplot(data6, aes(x = factor(year), y = Emissions, fill = County))
g <- g +
  geom_bar(stat="identity") + 
  facet_grid(County ~ ., scales = "free") +
  xlab("Years") +
  ylab(expression("PM2.5 Emissions")) +
  ggtitle("Motor vehicle emission Baltimore and Los Angeles")

print(g)


dev.off()