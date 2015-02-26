library(dplyr)

# Load
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Filter and summarize
TotalEmissionsByYear <- NEI %>% group_by(year) %>% summarize(Total=sum(Emissions))

# Plot
png(file="plot1.png", width=480, height=480)
plot(TotalEmissionsByYear$year,TotalEmissionsByYear$Total,type="l",xlab="Year",ylab="Emission",main="Total emissions from PM2.5 in US", col=2)
dev.off()