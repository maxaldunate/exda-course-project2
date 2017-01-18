#Week 4. Peer-graded Assignment: Course Project 2

#Plot 4
#Across the United States, how have emissions from coal combustion-related
#sources changed from 1999-2008?

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

coal  <- grepl("coal", NEImergeSCC$Short.Name, ignore.case = TRUE)
sub <- NEImergeSCC[coal, ]
data4 <- aggregate(Emissions ~ year, sub, sum)


png("plot4.png", width = 480, height = 480, units = "px")

g <- ggplot(data4, aes(x = year, y = Emissions))
g <- g +
  geom_bar(stat="identity") +
  xlab("Years") +
  ylab(expression("PM2.5 Emissions")) +
  ggtitle("Total PM2.5 Emission in Baltimore 1999-2008 from coal combustion")

print(g)


dev.off()