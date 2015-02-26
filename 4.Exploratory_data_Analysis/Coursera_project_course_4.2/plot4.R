library(dplyr)

# Load
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Filter and summarize
index<-SCC[grep("Coal",SCC$EI.Sector),1]
TotalCoalEmissionByYear <- NEI[sapply(NEI$SCC,function(x) x %in% index),] %>%
group_by(year) %>% summarize(Total=sum(Emissions))

# Save
png(file="plot4.png", width=480, height=480)
plot(TotalCoalEmissionByYear$year,TotalCoalEmissionByYear$Total,type="l",xlab="Year",ylab="Emission",main="Total emissions from coal combustion-related", col=2)
dev.off()