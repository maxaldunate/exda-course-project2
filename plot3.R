#Week 4. Peer-graded Assignment: Course Project 2

#Plot 3
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
# variable, which of these four sources have seen decreases in emissions 
#from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

require(ggplot2)

if(!exists("NEI")){
  NEI <- readRDS("data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("data/Source_Classification_Code.rds")
}

baltimore <- NEI[NEI$fips=="24510",]
data3 <- aggregate(Emissions ~ year + type, baltimore, sum)


png("plot3.png", width = 480, height = 480, units = "px")

g <- ggplot(data3, aes(x = year, y = Emissions, color = type))
g <- g + 
  geom_smooth(method = "auto") +
  xlab("Years") +
  ylab(expression("PM2.5 Emissions")) +
  ggtitle("Total PM2.5 Emission in Baltimore 1999-2008 By Type")

print(g)


dev.off()